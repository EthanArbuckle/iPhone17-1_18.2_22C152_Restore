@interface IDSRemoteAgentURLLoader
+ (BOOL)shouldAssertWiFi;
- (BOOL)disableKeepAlive;
- (BOOL)forceCellularIfPossible;
- (BOOL)requireIDSHost;
- (BOOL)shouldReturnTimingData;
- (BOOL)shouldUsePipelining;
- (IDSRemoteAgentURLLoader)initWithURLRequest:(id)a3 completionBlock:(id)a4;
- (NSString)bundleIdentifierForDataUsage;
- (NSString)uniqueID;
- (id)block;
- (int)concurrentConnections;
- (int)keepAliveCell;
- (int)keepAliveWifi;
- (void)cancel;
- (void)dealloc;
- (void)load;
- (void)setBundleIdentifierForDataUsage:(id)a3;
- (void)setConcurrentConnections:(int)a3;
- (void)setDisableKeepAlive:(BOOL)a3;
- (void)setForceCellularIfPossible:(BOOL)a3;
- (void)setKeepAliveCell:(int)a3;
- (void)setKeepAliveWifi:(int)a3;
- (void)setRequireIDSHost:(BOOL)a3;
- (void)setShouldReturnTimingData:(BOOL)a3;
- (void)setShouldUsePipelining:(BOOL)a3;
@end

@implementation IDSRemoteAgentURLLoader

+ (BOOL)shouldAssertWiFi
{
  if (qword_100015978 != -1) {
    dispatch_once(&qword_100015978, &stru_100010658);
  }
  return byte_100015970;
}

- (IDSRemoteAgentURLLoader)initWithURLRequest:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)IDSRemoteAgentURLLoader;
  v8 = [(IDSRemoteAgentURLLoader *)&v21 init];
  if (v8)
  {
    v9 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Creating loader with request: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v20 = v6;
      _IDSLogV();
    }
    v10 = (NSMutableURLRequest *)objc_msgSend(v6, "mutableCopy", v20);
    request = v8->_request;
    v8->_request = v10;

    id v12 = [v7 copy];
    id block = v8->_block;
    v8->_id block = v12;

    remoteURLConnection = v8->_remoteURLConnection;
    v8->_remoteURLConnection = 0;

    uint64_t v15 = +[NSString stringGUID];
    uniqueID = v8->_uniqueID;
    v8->_uniqueID = (NSString *)v15;

    uint64_t v17 = +[NSString stringWithFormat:@"%@-%@", @"IDSRemoteAgent", v8->_uniqueID];
    wifiAssertionToken = v8->_wifiAssertionToken;
    v8->_wifiAssertionToken = (NSString *)v17;
  }
  return v8;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)IDSRemoteAgentURLLoader;
  [(IDSRemoteAgentURLLoader *)&v2 dealloc];
}

- (void)load
{
  id v3 = objc_alloc((Class)IMRemoteURLConnection);
  request = self->_request;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100005ACC;
  v9[3] = &unk_100010680;
  v9[4] = self;
  v5 = (IMRemoteURLConnection *)[v3 initWithURLRequest:request completionBlockWithTimingData:v9];
  remoteURLConnection = self->_remoteURLConnection;
  self->_remoteURLConnection = v5;

  [(IMRemoteURLConnection *)self->_remoteURLConnection setShouldUsePipelining:[(IDSRemoteAgentURLLoader *)self shouldUsePipelining]];
  [(IMRemoteURLConnection *)self->_remoteURLConnection setConcurrentConnections:[(IDSRemoteAgentURLLoader *)self concurrentConnections]];
  [(IMRemoteURLConnection *)self->_remoteURLConnection setDisableKeepAlive:[(IDSRemoteAgentURLLoader *)self disableKeepAlive]];
  [(IMRemoteURLConnection *)self->_remoteURLConnection setKeepAliveWifi:[(IDSRemoteAgentURLLoader *)self keepAliveWifi]];
  [(IMRemoteURLConnection *)self->_remoteURLConnection setKeepAliveCell:[(IDSRemoteAgentURLLoader *)self keepAliveCell]];
  id v7 = self->_remoteURLConnection;
  v8 = [(IDSRemoteAgentURLLoader *)self bundleIdentifierForDataUsage];
  [(IMRemoteURLConnection *)v7 setBundleIdentifierForDataUsage:v8];

  [(IMRemoteURLConnection *)self->_remoteURLConnection setForceCellularIfPossible:[(IDSRemoteAgentURLLoader *)self forceCellularIfPossible]];
  [(IMRemoteURLConnection *)self->_remoteURLConnection setRequireIDSHost:[(IDSRemoteAgentURLLoader *)self requireIDSHost]];
  [(IMRemoteURLConnection *)self->_remoteURLConnection setShouldReturnTimingData:[(IDSRemoteAgentURLLoader *)self shouldReturnTimingData]];
  [(IMRemoteURLConnection *)self->_remoteURLConnection load];
}

- (void)cancel
{
  id v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    request = self->_request;
    *(_DWORD *)buf = 138412546;
    v8 = request;
    __int16 v9 = 2048;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Cancelling URL request: %@  (%p)", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  id block = self->_block;
  if (block)
  {
    self->_id block = 0;
  }
  remoteURLConnection = self->_remoteURLConnection;
  if (remoteURLConnection) {
    [(IMRemoteURLConnection *)remoteURLConnection cancel];
  }
}

- (NSString)uniqueID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (id)block
{
  return objc_getProperty(self, a2, 8, 1);
}

- (BOOL)forceCellularIfPossible
{
  return self->_forceCellularIfPossible;
}

- (void)setForceCellularIfPossible:(BOOL)a3
{
  self->_forceCellularIfPossible = a3;
}

- (NSString)bundleIdentifierForDataUsage
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBundleIdentifierForDataUsage:(id)a3
{
}

- (BOOL)requireIDSHost
{
  return self->_requireIDSHost;
}

- (void)setRequireIDSHost:(BOOL)a3
{
  self->_requireIDSHost = a3;
}

- (BOOL)shouldUsePipelining
{
  return self->_shouldUsePipelining;
}

- (void)setShouldUsePipelining:(BOOL)a3
{
  self->_shouldUsePipelining = a3;
}

- (int)concurrentConnections
{
  return self->_concurrentConnections;
}

- (void)setConcurrentConnections:(int)a3
{
  self->_concurrentConnections = a3;
}

- (BOOL)disableKeepAlive
{
  return self->_disableKeepAlive;
}

- (void)setDisableKeepAlive:(BOOL)a3
{
  self->_disableKeepAlive = a3;
}

- (int)keepAliveWifi
{
  return self->_keepAliveWifi;
}

- (void)setKeepAliveWifi:(int)a3
{
  self->_keepAliveWifi = a3;
}

- (int)keepAliveCell
{
  return self->_keepAliveCell;
}

- (void)setKeepAliveCell:(int)a3
{
  self->_keepAliveCell = a3;
}

- (BOOL)shouldReturnTimingData
{
  return self->_shouldReturnTimingData;
}

- (void)setShouldReturnTimingData:(BOOL)a3
{
  self->_shouldReturnTimingData = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiAssertionToken, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_dataTask, 0);
  objc_storeStrong((id *)&self->_remoteURLConnection, 0);
  objc_storeStrong((id *)&self->_bundleIdentifierForDataUsage, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong(&self->_block, 0);
}

@end