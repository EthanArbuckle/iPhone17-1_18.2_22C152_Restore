@interface IDSConnectionContext
- (IDSConnectionContext)initWithReadHandler:(id)a3;
- (IDSDeviceConnectionInfo)deviceConnectionInfo;
- (IDSGenericConnection)connection;
- (id)readHandler;
- (void)setConnection:(id)a3;
- (void)setDeviceConnectionInfo:(id)a3;
@end

@implementation IDSConnectionContext

- (IDSConnectionContext)initWithReadHandler:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IDSConnectionContext;
  v5 = [(IDSConnectionContext *)&v13 init];
  if (v5)
  {
    id v6 = objc_retainBlock(v4);
    id readHandler = v5->_readHandler;
    v5->_id readHandler = v6;
  }
  v8 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = objc_retainBlock(v5->_readHandler);
    *(_DWORD *)buf = 134218240;
    id v15 = v9;
    __int16 v16 = 2048;
    v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "initWithReadHandler: readHandler: %p, self: %p", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v11 = objc_retainBlock(v5->_readHandler);
      _IDSLogTransport();

      if (_IDSShouldLog())
      {
        id v12 = objc_retainBlock(v5->_readHandler);
        _IDSLogV();
      }
    }
  }

  return v5;
}

- (id)readHandler
{
  return self->_readHandler;
}

- (IDSGenericConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (IDSDeviceConnectionInfo)deviceConnectionInfo
{
  return self->_deviceConnectionInfo;
}

- (void)setDeviceConnectionInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceConnectionInfo, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong(&self->_readHandler, 0);
}

@end