@interface IDSDaemonMIGQueryInterface
+ (id)sharedInstance;
- (IDSDaemonMIGQueryInterfaceDelegate)delegate;
- (void)__setupServer;
- (void)acceptIncomingGrantRequests;
- (void)denyIncomingGrantRequests;
- (void)setDelegate:(id)a3;
@end

@implementation IDSDaemonMIGQueryInterface

+ (id)sharedInstance
{
  if (qword_100A4C798 != -1) {
    dispatch_once(&qword_100A4C798, &stru_100989538);
  }
  v2 = (void *)qword_100A4C7A0;

  return v2;
}

- (void)__setupServer
{
  v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Accepting Incoming Grant Query Requests", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    MarcoLogMadridLevel();
    IMLogString();
    if (_IMWillLog()) {
      _IMAlwaysLog();
    }
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10033D340;
  v13[3] = &unk_10097E4D0;
  v13[4] = self;
  v4 = objc_retainBlock(v13);
  v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v6 = dispatch_queue_create(0, v5);

  v7 = +[IDSDependencyProvider XPCAdapter];
  uint64_t v8 = kIDSDaemonQueryAuthGrantPortName;
  uint64_t v9 = objc_msgSend(v7, "createServiceConnectionWithServiceName:invalidationHandler:terminationHandler:peerEventHandler:peerQueue:", objc_msgSend(kIDSDaemonQueryAuthGrantPortName, "UTF8String"), v4, v4, &stru_100989558, v6);
  server = self->_server;
  p_server = (id *)&self->_server;
  id *p_server = (id)v9;

  if (!*p_server)
  {
    v12 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "IDSDaemonMIGQueryInterface: Could not create server with name: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      MarcoLogMadridLevel();
      IMLogString();
      _IMWarn();
    }
    exit(-1);
  }
  [*p_server resume];
}

- (void)acceptIncomingGrantRequests
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10033F478;
  block[3] = &unk_10097E4D0;
  block[4] = self;
  if (qword_100A4C7A8 != -1) {
    dispatch_once(&qword_100A4C7A8, block);
  }
}

- (void)denyIncomingGrantRequests
{
  self->_shuttingDown = 1;
  server = self->_server;
  if (server)
  {
    [(IDSXPCConnectionProtocol *)server cancel];
    v4 = self->_server;
    self->_server = 0;
  }
}

- (IDSDaemonMIGQueryInterfaceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);

  return (IDSDaemonMIGQueryInterfaceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_delegate);

  objc_storeStrong((id *)&self->_server, 0);
}

@end