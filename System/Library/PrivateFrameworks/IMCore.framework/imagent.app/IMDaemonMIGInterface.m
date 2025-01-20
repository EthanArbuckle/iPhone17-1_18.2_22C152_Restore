@interface IMDaemonMIGInterface
+ (id)sharedInstance;
- (IMDaemonMIGInterfaceDelegate)delegate;
- (void)__setupServer;
- (void)acceptIncomingGrantRequests;
- (void)denyIncomingGrantRequests;
- (void)setDelegate:(id)a3;
@end

@implementation IMDaemonMIGInterface

+ (id)sharedInstance
{
  if (qword_10007D348 != -1) {
    dispatch_once(&qword_10007D348, &stru_100071C40);
  }
  return (id)qword_10007D350;
}

- (void)__setupServer
{
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Accepting Incoming Grant Requests", buf, 2u);
    }
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100028C8C;
  v9[3] = &unk_100071C68;
  v9[4] = self;
  self->_connection_queue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.imagent.connection_queue", 0);
  IMXPCCreateServerConnectionWithQueue = (uint64_t (*)(id, OS_dispatch_queue *, void *, void *, Block_layout *, OS_dispatch_queue *))IMSharedHelperGet_IMXPCCreateServerConnectionWithQueue();
  uint64_t v5 = kFZDaemonAuthGrantPortName;
  v6 = (OS_xpc_object *)IMXPCCreateServerConnectionWithQueue([kFZDaemonAuthGrantPortName UTF8String], self->_connection_queue, v9, v9, &stru_100071CA8, self->_connection_queue);
  self->_server = v6;
  if (!v6)
  {
    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v11 = v5;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "IMDaemonMIGInterface: Could not create server with name: %@", buf, 0xCu);
      }
    }
    exit(-1);
  }
  xpc_connection_resume(v6);
  p_notifyToken = &self->_notifyToken;
  notify_register_check("_IMDaemonRunningNotifyToken", p_notifyToken);
  notify_set_state(*p_notifyToken, 1uLL);
  notify_post("_IMDaemonRunningNotifyToken");
}

- (void)acceptIncomingGrantRequests
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000291CC;
  block[3] = &unk_100071C68;
  block[4] = self;
  if (qword_10007D358 != -1) {
    dispatch_once(&qword_10007D358, block);
  }
}

- (void)denyIncomingGrantRequests
{
  self->_shuttingDown = 1;
  server = self->_server;
  if (server)
  {
    xpc_connection_cancel(server);
    self->_server = 0;
  }
  connection_queue = self->_connection_queue;
  if (connection_queue)
  {
    dispatch_release(connection_queue);
    self->_connection_queue = 0;
  }
  notify_set_state(self->_notifyToken, 0);

  notify_post("_IMDaemonRunningNotifyToken");
}

- (IMDaemonMIGInterfaceDelegate)delegate
{
  return (IMDaemonMIGInterfaceDelegate *)objc_loadWeak(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end