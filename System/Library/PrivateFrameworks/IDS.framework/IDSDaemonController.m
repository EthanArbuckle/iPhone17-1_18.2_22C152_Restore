@interface IDSDaemonController
+ (BOOL)_applicationWillTerminate;
+ (id)sharedInstance;
+ (void)_setApplicationWillTerminate;
- (BOOL)_autoReconnect;
- (BOOL)_makeConnectionWithLaunch:(BOOL)a3 completionBlock:(id)a4;
- (BOOL)_setCapabilities:(unsigned int)a3;
- (BOOL)_setCommands:(id)a3;
- (BOOL)_setServices:(id)a3;
- (BOOL)addListenerID:(id)a3 services:(id)a4;
- (BOOL)addListenerID:(id)a3 services:(id)a4 commands:(id)a5;
- (BOOL)connectToDaemon;
- (BOOL)connectToDaemonWithLaunch:(BOOL)a3;
- (BOOL)connectToDaemonWithLaunch:(BOOL)a3 services:(id)a4 commands:(id)a5 capabilities:(unsigned int)a6;
- (BOOL)consumeQueryContext:(id)a3;
- (BOOL)hasListenerForID:(id)a3;
- (BOOL)isConnected;
- (BOOL)isConnecting;
- (BOOL)localObjectExists;
- (BOOL)remoteObjectExists;
- (BOOL)setCapabilities:(unsigned int)a3 forListenerID:(id)a4 shouldLog:(BOOL)a5;
- (BOOL)setCommands:(id)a3 forListenerID:(id)a4;
- (BOOL)setServices:(id)a3 forListenerID:(id)a4;
- (IDSDaemonController)init;
- (IDSDaemonListener)listener;
- (IDSDaemonProtocol)remoteObject;
- (NSString)listenerID;
- (OS_dispatch_queue)_remoteMessageQueue;
- (OS_dispatch_queue)connectingQueue;
- (id)commands;
- (id)commandsForListenerID:(id)a3;
- (id)delegate;
- (id)forwarderWithCompletion:(id)a3;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)localObject;
- (id)services;
- (id)servicesForListenerID:(id)a3;
- (int)curXPCMessagePriority;
- (unsigned)capabilities;
- (unsigned)capabilitiesForListenerID:(id)a3;
- (void)_agentDidLaunchNotification:(id)a3;
- (void)_connectToDaemonWithLaunch:(BOOL)a3 services:(id)a4 commands:(id)a5 capabilities:(unsigned int)a6;
- (void)_disconnectFromDaemonWithForce:(BOOL)a3;
- (void)_handleDaemonException:(id)a3;
- (void)_listenerSetUpdated;
- (void)_localObjectCleanup;
- (void)_noteDisconnected;
- (void)_noteSetupComplete;
- (void)_performBlock:(id)a3;
- (void)_performBlock:(id)a3 wait:(BOOL)a4;
- (void)_remoteObjectCleanup;
- (void)_setAutoReconnect:(BOOL)a3;
- (void)_setServices:(id)a3 commands:(id)a4 capabilities:(unsigned int)a5;
- (void)addedDelegateForService:(id)a3 withCompletion:(id)a4;
- (void)blockUntilConnected;
- (void)dealloc;
- (void)disconnectFromDaemon;
- (void)forwardMethodWithBoostedPriority:(id)a3;
- (void)forwardMethodWithReplyIsSync:(BOOL)a3 block:(id)a4;
- (void)localObjectDiedNotification:(id)a3;
- (void)remoteObjectDiedNotification:(id)a3;
- (void)removeListenerID:(id)a3;
- (void)sendXPCObject:(id)a3 objectContext:(id)a4;
- (void)setConnectingQueue:(id)a3;
- (void)setCurXPCMessagePriority:(int)a3;
- (void)setDelegate:(id)a3;
- (void)setQueryContext:(id)a3;
- (void)setRemoteObject:(id)a3;
- (void)systemApplicationDidEnterBackground;
- (void)systemApplicationDidResume;
- (void)systemApplicationDidSuspend;
- (void)systemApplicationWillEnterForeground;
- (void)unsetQueryContext:(id)a3;
@end

@implementation IDSDaemonController

- (id)forwardingTargetForSelector:(SEL)a3
{
  v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 isQueueCurrent];

  if (v6) {
    BOOL v7 = sel_sendMessageWithSendParameters_ == a3;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    [(IDSDaemonControllerForwarder *)self->_forwarder setPriority:[(IDSDaemonController *)self curXPCMessagePriority]];
    [(IDSDaemonController *)self setCurXPCMessagePriority:0];
  }
  forwarder = self->_forwarder;

  return forwarder;
}

- (id)localObject
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = sub_191918630;
  v9 = sub_191918538;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_191918CB4;
  v4[3] = &unk_1E5728DF8;
  v4[4] = self;
  v4[5] = &v5;
  [(IDSDaemonController *)self _performBlock:v4 wait:1];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void)_localObjectCleanup
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = sub_1919180E0;
  v2[3] = &unk_1E5729000;
  v2[4] = self;
  [(IDSDaemonController *)self _performBlock:v2 wait:1];
}

- (BOOL)_makeConnectionWithLaunch:(BOOL)a3 completionBlock:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F6C360] sharedInstance];
  if ([v7 isNonUIInstall])
  {
  }
  else
  {
    v8 = [MEMORY[0x1E4F6C3E0] sharedInstance];
    char v9 = [v8 systemIsShuttingDown];

    if ((v9 & 1) == 0)
    {
      uint64_t v16 = 0;
      v17 = &v16;
      uint64_t v18 = 0x2020000000;
      char v19 = 0;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = sub_1919131D4;
      v12[3] = &unk_1E5729028;
      BOOL v15 = a3;
      v12[4] = self;
      v14 = &v16;
      id v13 = v6;
      [(IDSDaemonController *)self _performBlock:v12 wait:1];
      BOOL v10 = *((unsigned char *)v17 + 24) != 0;

      _Block_object_dispose(&v16, 8);
      goto LABEL_6;
    }
  }
  BOOL v10 = 0;
LABEL_6:

  return v10;
}

- (BOOL)remoteObjectExists
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = -86;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_19191714C;
  v4[3] = &unk_1E5728DF8;
  v4[4] = self;
  v4[5] = &v5;
  [(IDSDaemonController *)self _performBlock:v4 wait:1];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (IDSDaemonController)init
{
  if (_IDSRunningInDaemon())
  {
    v3 = +[IDSLogging DaemonController];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_191A2A590((uint64_t)self, v3);
    }

    v4 = 0;
  }
  else
  {
    v28.receiver = self;
    v28.super_class = (Class)IDSDaemonController;
    uint64_t v5 = [(IDSDaemonController *)&v28 init];
    id v6 = v5;
    if (v5)
    {
      [(IDSDaemonController *)v5 _setAutoReconnect:1];
      uint64_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v8 = dispatch_queue_create("com.apple.IDSDaemonControllerIvarQueue", v7);
      ivarQueue = v6->_ivarQueue;
      v6->_ivarQueue = (OS_dispatch_queue *)v8;

      dispatch_queue_set_specific((dispatch_queue_t)v6->_ivarQueue, "IDSDaemonControllerContext", (void *)1, 0);
      dispatch_queue_t v10 = dispatch_queue_create("com.apple.IDSDaemonControllerQueue", v7);
      remoteMessageQueue = v6->_remoteMessageQueue;
      v6->_remoteMessageQueue = (OS_dispatch_queue *)v10;

      dispatch_queue_t v12 = dispatch_queue_create("com.apple.IDSDaemonControllerConnectingQueue", v7);
      connectingQueue = v6->_connectingQueue;
      v6->_connectingQueue = (OS_dispatch_queue *)v12;

      v6->_curXPCMessagePriority = 0;
      dispatch_group_t v14 = dispatch_group_create();
      daemonConnectedGroup = v6->_daemonConnectedGroup;
      v6->_daemonConnectedGroup = (OS_dispatch_group *)v14;

      dispatch_group_enter((dispatch_group_t)v6->_daemonConnectedGroup);
      uint64_t v16 = [objc_alloc(MEMORY[0x1E4F28FA8]) initWithProtocol:&unk_1EE28EA60];
      protocol = v6->_protocol;
      v6->_protocol = (NSProtocolChecker *)v16;

      uint64_t v18 = objc_alloc_init(IDSDaemonListener);
      daemonListener = v6->_daemonListener;
      v6->_daemonListener = v18;

      v20 = [[IDSDaemonControllerForwarder alloc] initWithProtocol:v6->_protocol ivarQueue:v6->_ivarQueue remoteMessageQueue:v6->_remoteMessageQueue];
      forwarder = v6->_forwarder;
      v6->_forwarder = v20;

      v22 = IMGetMainBundleIdentifier();
      if (![v22 length])
      {
        uint64_t v23 = [NSString stringGUID];

        v22 = (void *)v23;
      }
      uint64_t v24 = [v22 copy];
      listenerID = v6->_listenerID;
      v6->_listenerID = (NSString *)v24;

      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v6, (CFNotificationCallback)sub_191919FF0, (CFStringRef)*MEMORY[0x1E4F6B5D8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
    self = v6;
    v4 = self;
  }

  return v4;
}

- (BOOL)addListenerID:(id)a3 services:(id)a4 commands:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 1;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_191914000;
  v15[3] = &unk_1E5729168;
  id v11 = v9;
  id v16 = v11;
  id v12 = v10;
  id v17 = v12;
  id v13 = v8;
  char v19 = self;
  v20 = &v21;
  id v18 = v13;
  [(IDSDaemonController *)self _performBlock:v15 wait:1];
  LOBYTE(self) = *((unsigned char *)v22 + 24);

  _Block_object_dispose(&v21, 8);
  return (char)self;
}

- (BOOL)consumeQueryContext:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F29060] currentThread];
  uint64_t v5 = [v4 threadDictionary];

  id v6 = [v5 objectForKeyedSubscript:v3];
  int v7 = [v6 BOOLValue];

  if (v7) {
    [v5 removeObjectForKey:v3];
  }

  return v7;
}

- (void)blockUntilConnected
{
  id v3 = [MEMORY[0x1E4F6C360] sharedInstance];
  char v4 = [v3 isNonUIInstall];

  if ((v4 & 1) == 0)
  {
    dispatch_assert_queue_not_V2((dispatch_queue_t)self->_ivarQueue);
    uint64_t v5 = +[IDSLogging DaemonController];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19190B000, v5, OS_LOG_TYPE_INFO, "Request to block until connected", buf, 2u);
    }

    *(void *)buf = 0;
    id v9 = buf;
    uint64_t v10 = 0x2020000000;
    char v11 = 1;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = sub_191912C2C;
    v7[3] = &unk_1E57290C8;
    v7[4] = self;
    v7[5] = buf;
    [(IDSDaemonController *)self _performBlock:v7 wait:1];
    if (v9[24])
    {
      id v6 = [(IDSDaemonController *)self connectingQueue];
      dispatch_sync(v6, &unk_1EE246F28);
    }
    _Block_object_dispose(buf, 8);
  }
}

- (BOOL)hasListenerForID:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  char v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_191918168;
  v7[3] = &unk_1E5729190;
  id v9 = &v10;
  v7[4] = self;
  id v5 = v4;
  id v8 = v5;
  [(IDSDaemonController *)self _performBlock:v7 wait:1];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

- (void)_listenerSetUpdated
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = sub_1919144CC;
  v2[3] = &unk_1E5729000;
  v2[4] = self;
  [(IDSDaemonController *)self _performBlock:v2 wait:1];
}

- (BOOL)connectToDaemonWithLaunch:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(IDSDaemonController *)self services];
  id v6 = [(IDSDaemonController *)self commands];
  [(IDSDaemonController *)self _connectToDaemonWithLaunch:v3 services:v5 commands:v6 capabilities:[(IDSDaemonController *)self capabilities]];

  return 1;
}

- (id)services
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_191918630;
  id v9 = sub_191918538;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_191916AF8;
  v4[3] = &unk_1E57290C8;
  v4[4] = self;
  v4[5] = &v5;
  [(IDSDaemonController *)self _performBlock:v4 wait:1];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)commands
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_191918630;
  id v9 = sub_191918538;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_191916C6C;
  v4[3] = &unk_1E57290C8;
  v4[4] = self;
  v4[5] = &v5;
  [(IDSDaemonController *)self _performBlock:v4 wait:1];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (BOOL)connectToDaemonWithLaunch:(BOOL)a3 services:(id)a4 commands:(id)a5 capabilities:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  BOOL v8 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [MEMORY[0x1E4F6C360] sharedInstance];
  char v13 = [v12 isNonUIInstall];

  if ((v13 & 1) == 0) {
    [(IDSDaemonController *)self _connectToDaemonWithLaunch:v8 services:v10 commands:v11 capabilities:v6];
  }

  return 1;
}

- (void)_setAutoReconnect:(BOOL)a3
{
  self->_autoReconnect = a3;
}

- (void)_performBlock:(id)a3 wait:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = (void (**)(void))a3;
  if (v6)
  {
    block = v6;
    if (v4)
    {
      if (dispatch_get_specific("IDSDaemonControllerContext")) {
        block[2]();
      }
      else {
        dispatch_sync((dispatch_queue_t)self->_ivarQueue, block);
      }
    }
    else
    {
      dispatch_async((dispatch_queue_t)self->_ivarQueue, v6);
    }
  }

  MEMORY[0x1F41817F8]();
}

- (IDSDaemonListener)listener
{
  return self->_daemonListener;
}

- (void)_setServices:(id)a3 commands:(id)a4 capabilities:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = [(IDSDaemonController *)self _setServices:v8];
  BOOL v11 = [(IDSDaemonController *)self _setCommands:v9];
  BOOL v12 = [(IDSDaemonController *)self _setCapabilities:v5];
  BOOL v13 = v12;
  if (v10 || v11 || v12)
  {
    if (([v8 containsObject:@"com.apple.private.alloy.pbbridge"] & 1) != 0
      || [v8 containsObject:@"com.apple.private.alloy.accountssync"])
    {
      dispatch_group_t v14 = [MEMORY[0x1E4F6C3B8] registration];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v15 = @"NO";
        *(_DWORD *)v20 = 138413570;
        *(void *)&v20[4] = v8;
        *(_WORD *)&v20[22] = 1024;
        if (v10) {
          id v16 = @"YES";
        }
        else {
          id v16 = @"NO";
        }
        if (v11) {
          id v17 = @"YES";
        }
        else {
          id v17 = @"NO";
        }
        *(_WORD *)&v20[12] = 2112;
        *(void *)&v20[14] = v9;
        if (v13) {
          BOOL v15 = @"YES";
        }
        int v21 = v5;
        __int16 v22 = 2112;
        uint64_t v23 = v16;
        __int16 v24 = 2112;
        v25 = v17;
        __int16 v26 = 2112;
        v27 = v15;
        _os_log_impl(&dword_19190B000, v14, OS_LOG_TYPE_DEFAULT, "Sending down new services %@ commands %@ capabilities %d. sendServices %@ sendCommands %@ sendCaps %@", v20, 0x3Au);
      }
    }
    id v18 = +[IDSLogging DaemonController];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v20 = 138412802;
      *(void *)&v20[4] = v8;
      *(_WORD *)&v20[12] = 2112;
      *(void *)&v20[14] = v9;
      *(_WORD *)&v20[22] = 1024;
      int v21 = v5;
      _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_INFO, "Sending down new services %@ commands %@ capabilities %d", v20, 0x1Cu);
    }

    char v19 = +[IDSDaemonController sharedInstance];
    [v19 setListenerServices:v8 commands:v9 capabilities:v5];
  }
}

- (BOOL)_setServices:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v11 = 0;
    BOOL v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_191917258;
    v8[3] = &unk_1E57290F0;
    v8[4] = self;
    id v9 = v4;
    BOOL v10 = &v11;
    [(IDSDaemonController *)self _performBlock:v8 wait:1];
    BOOL v6 = *((unsigned char *)v12 + 24) != 0;

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_setCommands:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v11 = 0;
    BOOL v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1919172F0;
    v8[3] = &unk_1E57290F0;
    v8[4] = self;
    id v9 = v4;
    BOOL v10 = &v11;
    [(IDSDaemonController *)self _performBlock:v8 wait:1];
    BOOL v6 = *((unsigned char *)v12 + 24) != 0;

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_setCapabilities:(unsigned int)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_191917168;
  v5[3] = &unk_1E5729118;
  v5[4] = self;
  v5[5] = &v7;
  unsigned int v6 = a3;
  [(IDSDaemonController *)self _performBlock:v5 wait:1];
  char v3 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (void)_connectToDaemonWithLaunch:(BOOL)a3 services:(id)a4 commands:(id)a5 capabilities:(unsigned int)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  BOOL v12 = [MEMORY[0x1E4F6C360] sharedInstance];
  char v13 = [v12 isNonUIInstall];

  if ((v13 & 1) == 0)
  {
    int v14 = [v10 containsObject:@"com.apple.private.alloy.pbbridge"];
    BOOL v15 = [MEMORY[0x1E4F6C3E0] sharedInstance];
    int v16 = [v15 systemIsShuttingDown];

    if (v16)
    {
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = sub_19191AB70;
      v25[3] = &unk_1E5729050;
      char v26 = v14;
      v25[4] = self;
      id v17 = v25;
LABEL_6:
      [(IDSDaemonController *)self _performBlock:v17 wait:1];
      goto LABEL_7;
    }
    if (self->_fatalErrorOccured)
    {
      id v17 = &unk_1EE246EE8;
      goto LABEL_6;
    }
    if (v14)
    {
      id v18 = [MEMORY[0x1E4F6C3B8] registration];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        unsigned int v28 = a6;
        _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "connectToDaemonWithLaunch capabilities %d", buf, 8u);
      }
    }
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = sub_191916DE8;
    v19[3] = &unk_1E5729078;
    char v23 = v14;
    unsigned int v22 = a6;
    v19[4] = self;
    id v20 = v10;
    id v21 = v11;
    BOOL v24 = a3;
    [(IDSDaemonController *)self _performBlock:v19 wait:1];
  }
LABEL_7:
}

- (BOOL)isConnected
{
  char v3 = [MEMORY[0x1E4F6C360] sharedInstance];
  char v4 = [v3 isNonUIInstall];

  if (v4) {
    return 1;
  }
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = -86;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_191916A60;
  v7[3] = &unk_1E5728DF8;
  v7[4] = self;
  void v7[5] = &v8;
  [(IDSDaemonController *)self _performBlock:v7 wait:1];
  BOOL v5 = *((unsigned char *)v9 + 24) != 0;
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (unsigned)capabilities
{
  uint64_t v5 = 0;
  unsigned int v6 = &v5;
  uint64_t v7 = 0x2020000000;
  int v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1919169B4;
  v4[3] = &unk_1E57290C8;
  v4[4] = self;
  v4[5] = &v5;
  [(IDSDaemonController *)self _performBlock:v4 wait:1];
  unsigned int v2 = *((_DWORD *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)isConnecting
{
  uint64_t v5 = 0;
  unsigned int v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = -86;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1919181BC;
  v4[3] = &unk_1E57290C8;
  v4[4] = self;
  v4[5] = &v5;
  [(IDSDaemonController *)self _performBlock:v4 wait:1];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

+ (id)sharedInstance
{
  if (qword_1EB2BD838 != -1) {
    dispatch_once(&qword_1EB2BD838, &unk_1EE2461E8);
  }
  char v2 = (void *)qword_1EB2BD7F8;

  return v2;
}

- (IDSDaemonProtocol)remoteObject
{
  return self->_remoteObject;
}

- (OS_dispatch_queue)connectingQueue
{
  return self->_connectingQueue;
}

- (BOOL)connectToDaemon
{
  return [(IDSDaemonController *)self connectToDaemonWithLaunch:1];
}

- (BOOL)addListenerID:(id)a3 services:(id)a4
{
  return [(IDSDaemonController *)self addListenerID:a3 services:a4 commands:0];
}

- (void)_remoteObjectCleanup
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = sub_191918B04;
  v2[3] = &unk_1E5729000;
  v2[4] = self;
  [(IDSDaemonController *)self _performBlock:v2 wait:1];
}

- (void)_performBlock:(id)a3
{
}

- (void)_noteSetupComplete
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = sub_19190DC74;
  v2[3] = &unk_1E5729000;
  v2[4] = self;
  [(IDSDaemonController *)self _performBlock:v2];
}

- (void)_noteDisconnected
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = sub_191918B7C;
  v2[3] = &unk_1E5729000;
  v2[4] = self;
  [(IDSDaemonController *)self _performBlock:v2 wait:1];
}

- (void)dealloc
{
  char v3 = [MEMORY[0x1E4F6C3E0] sharedInstance];
  [v3 removeListener:self];

  char v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:0 object:0];

  [(IDSDaemonController *)self _localObjectCleanup];
  [(IDSDaemonController *)self _remoteObjectCleanup];
  daemonConnectedGroup = self->_daemonConnectedGroup;
  if (daemonConnectedGroup)
  {
    dispatch_group_leave(daemonConnectedGroup);
    unsigned int v6 = self->_daemonConnectedGroup;
    self->_daemonConnectedGroup = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)IDSDaemonController;
  [(IDSDaemonController *)&v7 dealloc];
}

- (void)_handleDaemonException:(id)a3
{
  id v3 = a3;
  char v4 = +[IDSLogging DaemonController];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_191A2A7E8((uint64_t)v3, v4);
  }
}

+ (BOOL)_applicationWillTerminate
{
  return byte_1E92DE258;
}

+ (void)_setApplicationWillTerminate
{
  byte_1E92DE258 = 1;
  [a1 _blockUntilSendQueueIsEmpty];
}

- (void)_disconnectFromDaemonWithForce:(BOOL)a3
{
  uint64_t v5 = [MEMORY[0x1E4F6C360] sharedInstance];
  char v6 = [v5 isNonUIInstall];

  if ((v6 & 1) == 0)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = sub_19191A42C;
    v7[3] = &unk_1E5729050;
    v7[4] = self;
    BOOL v8 = a3;
    [(IDSDaemonController *)self _performBlock:v7 wait:1];
  }
}

- (void)disconnectFromDaemon
{
  id v3 = [MEMORY[0x1E4F6C360] sharedInstance];
  char v4 = [v3 isNonUIInstall];

  if ((v4 & 1) == 0)
  {
    [(IDSDaemonController *)self _disconnectFromDaemonWithForce:0];
  }
}

- (void)setCurXPCMessagePriority:(int)a3
{
  uint64_t v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    objc_super v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A2ABC0();
    }
  }
  self->_curXPCMessagePriority = a3;
}

- (int)curXPCMessagePriority
{
  id v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A2AC58();
    }
  }
  return self->_curXPCMessagePriority;
}

- (void)addedDelegateForService:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_19191AEB4;
  v10[3] = &unk_1E5729140;
  id v11 = v6;
  BOOL v12 = self;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  [(IDSDaemonController *)self _performBlock:v10 wait:1];
}

- (void)removeListenerID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = sub_19191B0C0;
    v5[3] = &unk_1E57291B8;
    v5[4] = self;
    id v6 = v4;
    [(IDSDaemonController *)self _performBlock:v5];
  }
}

- (id)servicesForListenerID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x3032000000;
    id v13 = sub_191918630;
    int v14 = sub_191918538;
    id v15 = 0;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = sub_19191B414;
    v7[3] = &unk_1E5729190;
    id v9 = &v10;
    v7[4] = self;
    id v8 = v4;
    [(IDSDaemonController *)self _performBlock:v7 wait:1];
    id v5 = (id)v11[5];

    _Block_object_dispose(&v10, 8);
  }
  else
  {
    id v5 = [(IDSDaemonController *)self services];
  }

  return v5;
}

- (BOOL)setServices:(id)a3 forListenerID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 1;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_19191B590;
  v11[3] = &unk_1E57291E0;
  id v8 = v7;
  id v15 = &v16;
  id v12 = v8;
  id v13 = self;
  id v9 = v6;
  id v14 = v9;
  [(IDSDaemonController *)self _performBlock:v11 wait:1];
  LOBYTE(self) = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)self;
}

- (BOOL)setCommands:(id)a3 forListenerID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 1;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_19191B7B0;
  v11[3] = &unk_1E57291E0;
  id v8 = v7;
  id v15 = &v16;
  id v12 = v8;
  id v13 = self;
  id v9 = v6;
  id v14 = v9;
  [(IDSDaemonController *)self _performBlock:v11 wait:1];
  LOBYTE(self) = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)self;
}

- (id)commandsForListenerID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x3032000000;
    id v13 = sub_191918630;
    id v14 = sub_191918538;
    id v15 = 0;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = sub_19191BA04;
    v7[3] = &unk_1E5729190;
    id v9 = &v10;
    v7[4] = self;
    id v8 = v4;
    [(IDSDaemonController *)self _performBlock:v7 wait:1];
    id v5 = (id)v11[5];

    _Block_object_dispose(&v10, 8);
  }
  else
  {
    id v5 = [(IDSDaemonController *)self commands];
  }

  return v5;
}

- (unsigned)capabilitiesForListenerID:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  int v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_19191BB54;
  v7[3] = &unk_1E5729190;
  id v9 = &v10;
  v7[4] = self;
  id v5 = v4;
  id v8 = v5;
  [(IDSDaemonController *)self _performBlock:v7 wait:1];
  LODWORD(self) = *((_DWORD *)v11 + 6);

  _Block_object_dispose(&v10, 8);
  return self;
}

- (BOOL)setCapabilities:(unsigned int)a3 forListenerID:(id)a4 shouldLog:(BOOL)a5
{
  id v8 = a4;
  uint64_t v18 = 0;
  char v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 1;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_19191BCBC;
  v12[3] = &unk_1E5729208;
  id v9 = v8;
  BOOL v17 = a5;
  unsigned int v16 = a3;
  id v14 = self;
  id v15 = &v18;
  id v13 = v9;
  [(IDSDaemonController *)self _performBlock:v12 wait:1];
  char v10 = *((unsigned char *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return v10;
}

- (NSString)listenerID
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_191918630;
  id v9 = sub_191918538;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_19191C070;
  v4[3] = &unk_1E5728DF8;
  v4[4] = self;
  v4[5] = &v5;
  [(IDSDaemonController *)self _performBlock:v4 wait:1];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

- (BOOL)localObjectExists
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = -86;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_19191C1B8;
  v4[3] = &unk_1E5728DF8;
  v4[4] = self;
  v4[5] = &v5;
  [(IDSDaemonController *)self _performBlock:v4 wait:1];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)_agentDidLaunchNotification:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_19191C244;
  v3[3] = &unk_1E5729000;
  v3[4] = self;
  [(IDSDaemonController *)self _performBlock:v3 wait:0];
}

- (void)localObjectDiedNotification:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_19191C2CC;
  v3[3] = &unk_1E5729000;
  v3[4] = self;
  [(IDSDaemonController *)self _performBlock:v3 wait:1];
}

- (void)remoteObjectDiedNotification:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_19191C4B8;
  v3[3] = &unk_1E5729000;
  v3[4] = self;
  [(IDSDaemonController *)self _performBlock:v3 wait:1];
}

- (void)sendXPCObject:(id)a3 objectContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  IMInsertBoolsToXPCDictionary();
  xpc_dictionary_set_value(v8, "object", v7);

  id v9 = objc_msgSend(v6, "copy", 1, 0);
  IMInsertDictionariesToXPCDictionary();

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_19191C8B8;
  v15[3] = &unk_1E57291B8;
  void v15[4] = self;
  id v16 = v8;
  id v10 = v8;
  id v11 = (void *)MEMORY[0x192FE03B0](v15);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_19191CA08;
  v13[3] = &unk_1E5729230;
  v13[4] = self;
  id v14 = v11;
  id v12 = v11;
  -[IDSDaemonController _performBlock:wait:](self, "_performBlock:wait:", v13, 1, v9, 0);
}

- (void)forwardMethodWithReplyIsSync:(BOOL)a3 block:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, IDSDaemonController *))a4;
  if (v4) {
    id v7 = @"QueryWithReplySync";
  }
  else {
    id v7 = @"QueryWithReply";
  }
  [(IDSDaemonController *)self setQueryContext:v7];
  v6[2](v6, self);

  MEMORY[0x1F4181798](self, sel_unsetQueryContext_);
}

- (void)forwardMethodWithBoostedPriority:(id)a3
{
  BOOL v4 = (void (**)(id, IDSDaemonController *))a3;
  [(IDSDaemonController *)self setQueryContext:@"QueryWithBoost"];
  v4[2](v4, self);

  MEMORY[0x1F4181798](self, sel_unsetQueryContext_);
}

- (void)setQueryContext:(id)a3
{
  id v7 = a3;
  id v3 = [MEMORY[0x1E4F29060] currentThread];
  BOOL v4 = [v3 threadDictionary];

  uint64_t v5 = [v4 objectForKeyedSubscript:v7];
  char v6 = [v5 BOOLValue];

  if ((v6 & 1) == 0) {
    [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v7];
  }
}

- (void)unsetQueryContext:(id)a3
{
  id v7 = a3;
  id v3 = [MEMORY[0x1E4F29060] currentThread];
  BOOL v4 = [v3 threadDictionary];

  uint64_t v5 = [v4 objectForKeyedSubscript:v7];
  int v6 = [v5 BOOLValue];

  if (v6) {
    [v4 removeObjectForKey:v7];
  }
}

- (id)forwarderWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[IDSDaemonControllerForwarder alloc] initWithProtocol:self->_protocol ivarQueue:self->_ivarQueue remoteMessageQueue:self->_remoteMessageQueue completion:v4];

  return v5;
}

- (void)systemApplicationDidSuspend
{
  id v3 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_191A2AF80();
  }

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_19191CDBC;
  v4[3] = &unk_1E5729000;
  v4[4] = self;
  [(IDSDaemonController *)self _performBlock:v4 wait:1];
}

- (void)systemApplicationDidEnterBackground
{
  id v3 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_191A2AFB4();
  }

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_19191CE7C;
  v4[3] = &unk_1E5729000;
  v4[4] = self;
  [(IDSDaemonController *)self _performBlock:v4 wait:1];
}

- (void)systemApplicationWillEnterForeground
{
  char v2 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_191A2AFE8();
  }
}

- (void)systemApplicationDidResume
{
  char v2 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_191A2B01C();
  }
}

- (OS_dispatch_queue)_remoteMessageQueue
{
  return self->_remoteMessageQueue;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)_autoReconnect
{
  return self->_autoReconnect;
}

- (void)setRemoteObject:(id)a3
{
}

- (void)setConnectingQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectingQueue, 0);
  objc_storeStrong((id *)&self->_notificationServices, 0);
  objc_storeStrong((id *)&self->_listenerCapabilities, 0);
  objc_storeStrong((id *)&self->_cachedCommands, 0);
  objc_storeStrong((id *)&self->_commands, 0);
  objc_storeStrong((id *)&self->_listenerCommands, 0);
  objc_storeStrong((id *)&self->_cachedServices, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_listenerServices, 0);
  objc_storeStrong((id *)&self->_remoteMessageQueue, 0);
  objc_storeStrong((id *)&self->_daemonConnectedGroup, 0);
  objc_storeStrong((id *)&self->_ivarQueue, 0);
  objc_storeStrong((id *)&self->_listenerID, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_daemonListener, 0);
  objc_storeStrong((id *)&self->_localObject, 0);
  objc_storeStrong((id *)&self->_forwarder, 0);
  objc_storeStrong((id *)&self->_remoteObject, 0);

  objc_destroyWeak(&self->_delegate);
}

@end