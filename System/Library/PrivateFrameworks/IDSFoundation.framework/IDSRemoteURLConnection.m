@interface IDSRemoteURLConnection
+ (id)alloc;
- (BOOL)_connect;
- (BOOL)_disconnect;
- (BOOL)disableKeepAlive;
- (BOOL)forceCellularIfPossible;
- (BOOL)requireIDSHost;
- (BOOL)shouldReturnTimingData;
- (BOOL)shouldUsePipelining;
- (IDSRemoteURLConnection)initWithURLRequest:(id)a3 completionBlock:(id)a4;
- (IDSRemoteURLConnection)initWithURLRequest:(id)a3 completionBlockWithTimingData:(id)a4;
- (NSString)bundleIdentifierForDataUsage;
- (NSURLRequest)request;
- (id)block;
- (int)concurrentConnections;
- (int)keepAliveCell;
- (int)keepAliveWifi;
- (void)_disconnected;
- (void)cancel;
- (void)dealloc;
- (void)load;
- (void)setBlock:(id)a3;
- (void)setBundleIdentifierForDataUsage:(id)a3;
- (void)setConcurrentConnections:(int)a3;
- (void)setDisableKeepAlive:(BOOL)a3;
- (void)setForceCellularIfPossible:(BOOL)a3;
- (void)setKeepAliveCell:(int)a3;
- (void)setKeepAliveWifi:(int)a3;
- (void)setRequest:(id)a3;
- (void)setRequireIDSHost:(BOOL)a3;
- (void)setShouldReturnTimingData:(BOOL)a3;
- (void)setShouldUsePipelining:(BOOL)a3;
@end

@implementation IDSRemoteURLConnection

- (void)_disconnected
{
  if (self->_connection)
  {
    v3 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_19D9BE000, v3, OS_LOG_TYPE_DEBUG, "Clearing out _connection, we're disconnected", v9, 2u);
    }

    uint64_t v4 = os_log_shim_legacy_logging_enabled();
    if (v4)
    {
      sub_19DB19948(v4, v5, @"Clearing out _connection, we're disconnected");
      sub_19DB199BC(v6, v7, @"Clearing out _connection, we're disconnected");
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
    }
    xpc_connection_cancel(self->_connection);
    connection = self->_connection;
    self->_connection = 0;
  }
  self->_loading = 0;
}

- (BOOL)_disconnect
{
  self->_loading = 0;
  if (self->_connection)
  {
    v3 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_19D9BE000, v3, OS_LOG_TYPE_DEBUG, "Forcing a disconnect, terminating connection", v10, 2u);
    }

    uint64_t v4 = os_log_shim_legacy_logging_enabled();
    if (v4)
    {
      sub_19DB19948(v4, v5, @"Forcing a disconnect, terminating connection");
      sub_19DB199BC(v6, v7, @"Forcing a disconnect, terminating connection");
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
    }
    xpc_connection_cancel(self->_connection);
    connection = self->_connection;
    self->_connection = 0;
  }
  return 1;
}

- (BOOL)_connect
{
  connection = self->_connection;
  if (!connection)
  {
    uint64_t v4 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v4, OS_LOG_TYPE_DEFAULT, "Connecting to URLLoading agent", buf, 2u);
    }

    uint64_t v5 = os_log_shim_legacy_logging_enabled();
    if (v5)
    {
      sub_19DB19948(v5, (uint64_t)v6, @"Connecting to URLLoading agent");
      sub_19DB199BC(v9, v10, @"Connecting to URLLoading agent");
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
    }
    objc_msgSend_UTF8String(@"com.apple.idsremoteurlconnectionagent.embedded.auth", v6, v7, v8);
    v11 = im_primary_queue();
    v12 = (OS_xpc_object *)IMXPCCreateConnectionForServiceWithQueue();
    v13 = self->_connection;
    self->_connection = v12;

    IMXPCConfigureConnection();
    connection = self->_connection;
  }
  return connection != 0;
}

+ (id)alloc
{
  return objc_alloc(MEMORY[0x1E4F6C3D0]);
}

- (IDSRemoteURLConnection)initWithURLRequest:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_19DB19E50;
  v12[3] = &unk_1E59756A8;
  id v13 = v6;
  id v7 = v6;
  uint64_t v10 = (IDSRemoteURLConnection *)objc_msgSend_initWithURLRequest_completionBlockWithTimingData_(self, v8, (uint64_t)a3, v9, v12);

  return v10;
}

- (IDSRemoteURLConnection)initWithURLRequest:(id)a3 completionBlockWithTimingData:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)IDSRemoteURLConnection;
  double v9 = [(IDSRemoteURLConnection *)&v21 init];
  if (v9)
  {
    uint64_t v10 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v23 = v7;
      __int16 v24 = 2048;
      v25 = v9;
      _os_log_impl(&dword_19D9BE000, v10, OS_LOG_TYPE_DEFAULT, "Init with URL request: %@  (%p)", buf, 0x16u);
    }

    uint64_t v11 = os_log_shim_legacy_logging_enabled();
    if (v11)
    {
      sub_19DB19948(v11, v12, @"Init with URL request: %@  (%p)");
      sub_19DB199BC(v13, v14, @"Init with URL request: %@  (%p)");
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
    }
    objc_storeStrong((id *)&v9->_request, a3);
    uint64_t v18 = objc_msgSend_copy(v8, v15, v16, v17);
    id block = v9->_block;
    v9->_id block = (id)v18;
  }
  return v9;
}

- (void)dealloc
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    request = self->_request;
    *(_DWORD *)buf = 138412546;
    v15 = request;
    __int16 v16 = 2048;
    double v17 = self;
    _os_log_impl(&dword_19D9BE000, v3, OS_LOG_TYPE_DEFAULT, "Released URL request: %@  (%p)", buf, 0x16u);
  }

  uint64_t v5 = os_log_shim_legacy_logging_enabled();
  if (v5)
  {
    sub_19DB19948(v5, (uint64_t)v6, @"Released URL request: %@  (%p)");
    uint64_t v11 = self->_request;
    uint64_t v12 = self;
    sub_19DB199BC(v9, v10, @"Released URL request: %@  (%p)");
    if (_IMWillLog())
    {
      uint64_t v11 = self->_request;
      uint64_t v12 = self;
      _IMAlwaysLog();
    }
  }
  objc_msgSend__disconnect(self, v6, v7, v8, v11, v12);
  v13.receiver = self;
  v13.super_class = (Class)IDSRemoteURLConnection;
  [(IDSRemoteURLConnection *)&v13 dealloc];
}

- (void)load
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  if (!self->_loading)
  {
    self->_cancelled = 0;
    if (objc_msgSend__connect(self, a2, v2, v3))
    {
      uint64_t v5 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        request = self->_request;
        uint64_t v10 = objc_msgSend_bundleIdentifierForDataUsage(self, v6, v7, v8);
        *(_DWORD *)buf = 138412802;
        v68 = request;
        __int16 v69 = 2112;
        v70 = v10;
        __int16 v71 = 2048;
        v72 = self;
        _os_log_impl(&dword_19D9BE000, v5, OS_LOG_TYPE_DEFAULT, "Sending URL request: %@ (Data usage identifier: %@)  (%p)", buf, 0x20u);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        uint64_t v14 = self->_request;
        v63 = objc_msgSend_bundleIdentifierForDataUsage(self, v11, v12, v13);
        sub_19DB19948((uint64_t)v63, v15, @"Sending URL request: %@ (Data usage identifier: %@)  (%p)");

        __int16 v16 = self->_request;
        v64 = objc_msgSend_bundleIdentifierForDataUsage(self, v17, v18, v19, v14, v63, self);
        sub_19DB199BC((uint64_t)v64, v20, @"Sending URL request: %@ (Data usage identifier: %@)  (%p)");

        if (_IMWillLog())
        {
          v65 = objc_msgSend_bundleIdentifierForDataUsage(self, v21, v22, v23, v16, v64, self);
          _IMAlwaysLog();
        }
      }
      self->_loading = 1;
      xpc_object_t v24 = xpc_dictionary_create(0, 0, 0);
      v54 = self->_request;
      IMInsertKeyedCodableObjectsToXPCDictionary();
      uint64_t v55 = objc_msgSend_forceCellularIfPossible(self, v25, v26, v27, v54, 0);
      IMInsertBoolsToXPCDictionary();
      uint64_t v56 = objc_msgSend_requireIDSHost(self, v28, v29, v30, v55, 0);
      IMInsertBoolsToXPCDictionary();
      v57 = objc_msgSend_bundleIdentifierForDataUsage(self, v31, v32, v33, v56, 0);
      IMInsertNSStringsToXPCDictionary();

      uint64_t shouldUsePipelining = objc_msgSend_shouldUsePipelining(self, v34, v35, v36, v57, 0);
      IMInsertBoolsToXPCDictionary();
      uint64_t v59 = objc_msgSend_concurrentConnections(self, v37, v38, v39, shouldUsePipelining, 0);
      IMInsertIntsToXPCDictionary();
      uint64_t v60 = objc_msgSend_disableKeepAlive(self, v40, v41, v42, v59, 0);
      IMInsertBoolsToXPCDictionary();
      uint64_t v61 = objc_msgSend_keepAliveWifi(self, v43, v44, v45, v60, 0);
      IMInsertIntsToXPCDictionary();
      uint64_t v62 = objc_msgSend_keepAliveCell(self, v46, v47, v48, v61, 0);
      IMInsertIntsToXPCDictionary();
      objc_msgSend_shouldReturnTimingData(self, v49, v50, v51, v62, 0);
      IMInsertBoolsToXPCDictionary();
      connection = self->_connection;
      v53 = im_primary_queue();
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = sub_19DB1A524;
      handler[3] = &unk_1E59756D0;
      handler[4] = self;
      xpc_connection_send_message_with_reply(connection, v24, v53, handler);
    }
  }
}

- (void)cancel
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  double v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    request = self->_request;
    *(_DWORD *)buf = 138412546;
    uint64_t v15 = request;
    __int16 v16 = 2048;
    double v17 = self;
    _os_log_impl(&dword_19D9BE000, v3, OS_LOG_TYPE_DEFAULT, "Cancelling URL request: %@  (%p)", buf, 0x16u);
  }

  uint64_t v5 = os_log_shim_legacy_logging_enabled();
  if (v5)
  {
    sub_19DB19948(v5, (uint64_t)v6, @"Cancelling URL request: %@  (%p)");
    uint64_t v12 = self->_request;
    double v13 = self;
    sub_19DB199BC(v9, v10, @"Cancelling URL request: %@  (%p)");
    if (_IMWillLog())
    {
      uint64_t v12 = self->_request;
      double v13 = self;
      _IMAlwaysLog();
    }
  }
  self->_cancelled = 1;
  id block = self->_block;
  if (block)
  {
    self->_id block = 0;
  }
  objc_msgSend__disconnect(self, v6, v7, v8, v12, v13);
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
  return (NSString *)objc_getProperty(self, a2, 16, 1);
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
  self->_uint64_t shouldUsePipelining = a3;
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

- (NSURLRequest)request
{
  return (NSURLRequest *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRequest:(id)a3
{
}

- (id)block
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_bundleIdentifierForDataUsage, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end