@interface IDSDaemonMIGInterface
+ (id)sharedInstance;
- (IDSDaemonMIGInterfaceDelegate)delegate;
- (void)__setupServer;
- (void)acceptIncomingGrantRequests;
- (void)denyIncomingGrantRequests;
- (void)setDelegate:(id)a3;
- (void)shutDownSim2HostServer;
@end

@implementation IDSDaemonMIGInterface

+ (id)sharedInstance
{
  if (qword_100A4A7B0 != -1) {
    dispatch_once(&qword_100A4A7B0, &stru_100983568);
  }
  v2 = (void *)qword_100A4A7B8;

  return v2;
}

- (IDSDaemonMIGInterfaceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);

  return (IDSDaemonMIGInterfaceDelegate *)WeakRetained;
}

- (void)__setupServer
{
  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100134A58;
  v13[3] = &unk_10097E4D0;
  v13[4] = self;
  v3 = objc_retainBlock(v13);
  if (_os_feature_enabled_impl()) {
    dispatch_queue_t v4 = 0;
  }
  else {
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.identityservicesd.connection_queue", 0);
  }
  v5 = +[IDSDependencyProvider XPCAdapter];
  uint64_t v6 = kIDSDaemonAuthGrantPortName;
  objc_msgSend(v5, "createServiceConnectionWithServiceName:invalidationHandler:terminationHandler:peerEventHandler:peerQueue:", objc_msgSend(kIDSDaemonAuthGrantPortName, "UTF8String"), v3, v3, &stru_1009835A8, v4);
  v7 = (IDSXPCConnectionProtocol *)objc_claimAutoreleasedReturnValue();
  server = self->_server;
  self->_server = v7;

  v9 = self->_server;
  if (!v9)
  {
    v12 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "IDSDaemonMIGInterface: Could not create server with name: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
    exit(-1);
  }
  [(IDSXPCConnectionProtocol *)v9 resume];
  v10 = (const char *)IMUserScopedNotification();
  notify_register_check(v10, &self->_notifyToken);
  notify_set_state(self->_notifyToken, 1uLL);
  v11 = (const char *)IMUserScopedNotification();
  notify_post(v11);
}

- (void)acceptIncomingGrantRequests
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100134C30;
  block[3] = &unk_10097E4D0;
  block[4] = self;
  if (qword_100A4A7C0 != -1) {
    dispatch_once(&qword_100A4A7C0, block);
  }
}

- (void)denyIncomingGrantRequests
{
  self->_shuttingDown = 1;
  server = self->_server;
  if (server)
  {
    [(IDSXPCConnectionProtocol *)server cancel];
    dispatch_queue_t v4 = self->_server;
    self->_server = 0;
  }
  notify_set_state(self->_notifyToken, 0);
  v5 = (const char *)IMUserScopedNotification();

  notify_post(v5);
}

- (void)shutDownSim2HostServer
{
  self->_shuttingDownSim2Host = 1;
  serverSim2Host = self->_serverSim2Host;
  if (serverSim2Host)
  {
    [(IDSXPCConnectionProtocol *)serverSim2Host cancel];
    dispatch_queue_t v4 = self->_serverSim2Host;
    self->_serverSim2Host = 0;
  }
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->_serverSim2Host, 0);

  objc_storeStrong((id *)&self->_server, 0);
}

@end