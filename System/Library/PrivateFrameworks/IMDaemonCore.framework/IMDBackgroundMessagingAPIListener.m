@interface IMDBackgroundMessagingAPIListener
+ (id)sharedListener;
- (BOOL)isConnectionEntitled:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (IMDBackgroundMessagingAPIListener)init;
- (void)connectionClosed:(int)a3;
- (void)dealloc;
- (void)handleSMSSendResult:(id)a3 sent:(BOOL)a4;
@end

@implementation IMDBackgroundMessagingAPIListener

+ (id)sharedListener
{
  if (qword_1EBE2C188 != -1) {
    dispatch_once(&qword_1EBE2C188, &unk_1F3391720);
  }
  v2 = (void *)qword_1EBE2C190;

  return v2;
}

- (IMDBackgroundMessagingAPIListener)init
{
  v11.receiver = self;
  v11.super_class = (Class)IMDBackgroundMessagingAPIListener;
  v2 = [(IMDBackgroundMessagingAPIListener *)&v11 init];
  dispatch_queue_t v3 = dispatch_queue_create("IMDBackgroundMessagingAPIListenerQueue", 0);
  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v3;

  [MEMORY[0x1E4F6E618] resetStorageIfNeeded];
  uint64_t v5 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.messages.critical-messaging"];
  listener = v2->_listener;
  v2->_listener = (NSXPCListener *)v5;

  [(NSXPCListener *)v2->_listener setDelegate:v2];
  [(NSXPCListener *)v2->_listener resume];
  v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  activeConnections = v2->_activeConnections;
  v2->_activeConnections = v7;

  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  CFNotificationCenterAddObserver(DistributedCenter, v2, (CFNotificationCallback)sub_1D97AE640, (CFStringRef)*MEMORY[0x1E4F6D600], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  return v2;
}

- (void)dealloc
{
  if (IMOSLoggingEnabled())
  {
    dispatch_queue_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "dealloc", buf, 2u);
    }
  }
  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  CFNotificationCenterRemoveObserver(DistributedCenter, self, (CFNotificationName)*MEMORY[0x1E4F6D600], 0);
  [(NSXPCListener *)self->_listener invalidate];
  v5.receiver = self;
  v5.super_class = (Class)IMDBackgroundMessagingAPIListener;
  [(IMDBackgroundMessagingAPIListener *)&v5 dealloc];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Incoming XPC Connection for IMDBackgroundMessagingAPIListener", buf, 2u);
    }
  }
  BOOL v9 = [(IMDBackgroundMessagingAPIListener *)self isConnectionEntitled:v7];
  if (v9)
  {
    v10 = [[IMDBackgroundMessagingAPITargetHandler alloc] initWithXPCConnection:v7 targetQueue:self->_queue delegate:self];
    objc_super v11 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v7, "processIdentifier"));
    [(NSMutableDictionary *)self->_activeConnections setObject:v10 forKey:v11];
  }
  else if (IMOSLoggingEnabled())
  {
    v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Incoming XPC Connection for IMDBackgroundMessagingAPIListener missing entitlement", v14, 2u);
    }
  }
  return v9;
}

- (BOOL)isConnectionEntitled:(id)a3
{
  dispatch_queue_t v3 = [a3 valueForEntitlement:@"com.apple.developer.messages.critical-messaging"];
  v4 = v3;
  BOOL v5 = v3 && ([v3 BOOLValue] & 1) != 0;

  return v5;
}

- (void)connectionClosed:(int)a3
{
  id v5 = [NSNumber numberWithInt:*(void *)&a3];
  v4 = [(NSMutableDictionary *)self->_activeConnections objectForKey:v5];
  [(NSMutableDictionary *)self->_activeConnections removeObjectForKey:v5];
}

- (void)handleSMSSendResult:(id)a3 sent:(BOOL)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D97AEAD8;
  block[3] = &unk_1E6B76578;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeConnections, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_listener, 0);
}

@end