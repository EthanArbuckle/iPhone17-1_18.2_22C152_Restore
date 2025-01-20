@interface IDSCredentialsDaemonMIGInterface
+ (id)sharedInstance;
- (void)__setupServer;
- (void)acceptIncomingGrantRequests;
- (void)denyIncomingGrantRequests;
@end

@implementation IDSCredentialsDaemonMIGInterface

+ (id)sharedInstance
{
  if (qword_100015808 != -1) {
    dispatch_once(&qword_100015808, &stru_100010768);
  }
  v2 = (void *)qword_100015810;
  return v2;
}

- (void)__setupServer
{
  v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Accepting Incoming Grant Requests", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000096E8;
  v11[3] = &unk_1000106C8;
  v11[4] = self;
  v4 = objc_retainBlock(v11);
  uint64_t v5 = kIDSRemoteCredentialDaemonAuthGrantPortName;
  [kIDSRemoteCredentialDaemonAuthGrantPortName UTF8String];
  v6 = dispatch_get_global_queue(2, 0);
  uint64_t v7 = IMXPCCreateServerConnection();
  server = self->_server;
  p_server = &self->_server;
  *p_server = (OS_xpc_object *)v7;

  if (!*p_server)
  {
    v10 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "IDSRemoteURLConnectionDaemonMIGInterface: Could not create server with name: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
    exit(-1);
  }
  xpc_connection_resume(*p_server);
}

- (void)acceptIncomingGrantRequests
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009F1C;
  block[3] = &unk_1000106C8;
  block[4] = self;
  if (qword_100015818 != -1) {
    dispatch_once(&qword_100015818, block);
  }
}

- (void)denyIncomingGrantRequests
{
  self->_shuttingDown = 1;
  server = self->_server;
  if (server)
  {
    xpc_connection_cancel(server);
    v4 = self->_server;
    self->_server = 0;
  }
}

- (void).cxx_destruct
{
}

@end