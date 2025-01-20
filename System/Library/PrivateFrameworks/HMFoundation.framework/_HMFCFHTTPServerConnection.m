@interface _HMFCFHTTPServerConnection
+ (id)logCategory;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (BOOL)open;
- (HMFNetAddress)address;
- (NSMutableArray)pendingRequests;
- (NSMutableArray)pendingRespones;
- (OS_dispatch_queue)clientQueue;
- (_CFHTTPServerConnection)internal;
- (_HMFCFHTTPServerConnection)init;
- (_HMFCFHTTPServerConnection)initWithConnectionRef:(_CFHTTPServerConnection *)a3;
- (_HMFCFHTTPServerConnectionDelegate)delegate;
- (id)logIdentifier;
- (unint64_t)hash;
- (void)_handleCompletedReceivedRequest:(id)a3 error:(id)a4;
- (void)_handleCompletedResponse:(_CFHTTPServerResponse *)a3 error:(id)a4;
- (void)_handleReceivedRequestRef:(_CFHTTPServerRequest *)a3;
- (void)_sendStatusCode:(int64_t)a3 forRequest:(id)a4;
- (void)_sendStatusCode:(int64_t)a3 forRequest:(id)a4 bodyData:(id)a5;
- (void)_stopReadBody:(id)a3;
- (void)dealloc;
- (void)handleRequest:(id)a3 bodyReadStream:(__CFReadStream *)a4 eventType:(unint64_t)a5;
- (void)invalidate;
- (void)sendResponse:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation _HMFCFHTTPServerConnection

- (_HMFCFHTTPServerConnection)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (_HMFCFHTTPServerConnection)initWithConnectionRef:(_CFHTTPServerConnection *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)_HMFCFHTTPServerConnection;
  v4 = [(_HMFCFHTTPServerConnection *)&v22 init];
  if (!v4)
  {
LABEL_12:
    v19 = v4;
    goto LABEL_13;
  }
  v4->_internal = (_CFHTTPServerConnection *)CFRetain(a3);
  v5 = (const char *)HMFDispatchQueueName(v4, 0);
  dispatch_queue_t v6 = dispatch_queue_create(v5, 0);
  clientQueue = v4->_clientQueue;
  v4->_clientQueue = (OS_dispatch_queue *)v6;

  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  pendingRequests = v4->_pendingRequests;
  v4->_pendingRequests = (NSMutableArray *)v8;

  uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
  pendingRespones = v4->_pendingRespones;
  v4->_pendingRespones = (NSMutableArray *)v10;

  v12 = [[HMFWeakObject alloc] initWithWeakObject:v4];
  [(_HMFCFHTTPServerConnection *)v4 internal];
  _CFHTTPServerConnectionSetClient();
  if ([(_HMFCFHTTPServerConnection *)v4 internal] && [(_HMFCFHTTPServerConnection *)v4 isValid])
  {
    if (a3)
    {
      v13 = (void *)_CFHTTPServerConnectionCopyProperty();
      if (v13)
      {
        id v14 = v13;
        a3 = -[HMFNetAddress initWithSocketAddress:]([HMFNetAddress alloc], "initWithSocketAddress:", [v14 bytes]);
      }
      else
      {
        a3 = 0;
      }
    }
    address = v4->_address;
    v4->_address = (HMFNetAddress *)a3;

    goto LABEL_12;
  }
  v15 = (void *)MEMORY[0x19F3A87A0]();
  v16 = v4;
  v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v18 = HMFGetLogIdentifier(v16);
    *(_DWORD *)buf = 138543362;
    v24 = v18;
    _os_log_impl(&dword_19D57B000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to create connection, connection is invalid", buf, 0xCu);
  }

  v19 = 0;
LABEL_13:

  return v19;
}

- (void)dealloc
{
  if (self->_internal)
  {
    if (_CFHTTPServerConnectionIsValid()) {
      _CFHTTPServerConnectionInvalidate();
    }
    CFRelease(self->_internal);
    self->_internal = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)_HMFCFHTTPServerConnection;
  [(_HMFCFHTTPServerConnection *)&v3 dealloc];
}

- (unint64_t)hash
{
  v2 = [(_HMFCFHTTPServerConnection *)self internal];
  return CFHash(v2);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_HMFCFHTTPServerConnection *)a3;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    dispatch_queue_t v6 = v5;
    if (v6) {
      BOOL v7 = CFEqual([(_HMFCFHTTPServerConnection *)self internal], [(_HMFCFHTTPServerConnection *)v6 internal]) != 0;
    }
    else {
      BOOL v7 = 0;
    }
  }
  return v7;
}

- (void)invalidate
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([(_HMFCFHTTPServerConnection *)self isValid])
  {
    objc_super v3 = (void *)MEMORY[0x19F3A87A0]();
    v4 = self;
    v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      dispatch_queue_t v6 = HMFGetLogIdentifier(v4);
      int v7 = 138543362;
      uint64_t v8 = v6;
      _os_log_impl(&dword_19D57B000, v5, OS_LOG_TYPE_INFO, "%{public}@Closed", (uint8_t *)&v7, 0xCu);
    }
    [(_HMFCFHTTPServerConnection *)v4 internal];
    _CFHTTPServerConnectionInvalidate();
  }
}

- (BOOL)isValid
{
  return _CFHTTPServerConnectionIsValid() != 0;
}

- (BOOL)open
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(_HMFCFHTTPServerConnection *)self isValid];
  if (v3)
  {
    v4 = (void *)MEMORY[0x19F3A87A0]();
    v5 = self;
    dispatch_queue_t v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = HMFGetLogIdentifier(v5);
      int v10 = 138543362;
      v11 = v7;
      _os_log_impl(&dword_19D57B000, v6, OS_LOG_TYPE_INFO, "%{public}@Opened", (uint8_t *)&v10, 0xCu);
    }
    [(_HMFCFHTTPServerConnection *)v5 internal];
    uint64_t v8 = [(_HMFCFHTTPServerConnection *)v5 clientQueue];
    _CFHTTPServerConnectionSetDispatchQueue();
  }
  return v3;
}

- (void)_handleReceivedRequestRef:(_CFHTTPServerRequest *)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x19F3A87A0](self, a2);
  dispatch_queue_t v6 = self;
  int v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = HMFGetLogIdentifier(v6);
    LODWORD(buf.version) = 138543618;
    *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)v8;
    WORD2(buf.info) = 2112;
    *(void **)((char *)&buf.info + 6) = a3;
    _os_log_impl(&dword_19D57B000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Received request: %@", (uint8_t *)&buf, 0x16u);
  }
  uint64_t v9 = [[_HMFCFHTTPServerRequest alloc] initWithConnection:v6 requestRef:a3];
  if (v9)
  {
    int v10 = (void *)MEMORY[0x19F3A87A0]();
    v11 = v6;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = HMFGetLogIdentifier(v11);
      LODWORD(buf.version) = 138543618;
      *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)v13;
      WORD2(buf.info) = 2112;
      *(void **)((char *)&buf.info + 6) = v9;
      _os_log_impl(&dword_19D57B000, v12, OS_LOG_TYPE_INFO, "%{public}@Received request: %@", (uint8_t *)&buf, 0x16u);
    }
    [v11[4] addObject:v9];
    id v14 = [(_HMFCFHTTPServerRequest *)v9 bodyStream];
    v15 = (void *)MEMORY[0x19F3A87A0]();
    v16 = v11;
    v17 = HMFGetOSLogHandle();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
    if (v14)
    {
      if (v18)
      {
        v19 = HMFGetLogIdentifier(v16);
        LODWORD(buf.version) = 138543618;
        *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)v19;
        WORD2(buf.info) = 2112;
        *(void **)((char *)&buf.info + 6) = v9;
        _os_log_impl(&dword_19D57B000, v17, OS_LOG_TYPE_INFO, "%{public}@Opening body stream for request: %@", (uint8_t *)&buf, 0x16u);
      }
      v20 = [(HMFHTTPRequestInternal *)v9 activity];
      [v20 markWithReason:@"Opening body stream"];

      memset(&buf, 0, sizeof(buf));
      v21 = [[HMFWeakObject alloc] initWithWeakObject:v9];
      buf.info = v21;
      buf.retain = (void *(__cdecl *)(void *))_retainInfo;
      buf.release = (void (__cdecl *)(void *))_releaseInfo;
      CFReadStreamSetClient(v14, 0x1AuLL, (CFReadStreamClientCallBack)readStreamCallBack, &buf);
      objc_super v22 = [v16 clientQueue];
      MEMORY[0x19F3A7B70](v14, v22);

      if (!CFReadStreamOpen(v14))
      {
        v23 = (void *)MEMORY[0x19F3A87A0]();
        v24 = v16;
        uint64_t v25 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v26 = HMFGetLogIdentifier(v24);
          int v29 = 138543618;
          v30 = v26;
          __int16 v31 = 2112;
          v32 = v9;
          _os_log_impl(&dword_19D57B000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to open request body stream for request %@", (uint8_t *)&v29, 0x16u);
        }
        v27 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:11];
        [v24 _handleCompletedReceivedRequest:v9 error:v27];
      }
    }
    else
    {
      if (v18)
      {
        v28 = HMFGetLogIdentifier(v16);
        LODWORD(buf.version) = 138543618;
        *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)v28;
        WORD2(buf.info) = 2112;
        *(void **)((char *)&buf.info + 6) = v9;
        _os_log_impl(&dword_19D57B000, v17, OS_LOG_TYPE_INFO, "%{public}@No body stream for request: %@", (uint8_t *)&buf, 0x16u);
      }
      [v16 _handleCompletedReceivedRequest:v9 error:0];
    }
  }
}

- (void)_handleCompletedReceivedRequest:(id)a3 error:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    [(_HMFCFHTTPServerConnection *)self _stopReadBody:v6];
    uint64_t v8 = [(_HMFCFHTTPServerConnection *)self delegate];
    if (v7)
    {
      uint64_t v9 = (void *)MEMORY[0x19F3A87A0]();
      int v10 = self;
      v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = HMFGetLogIdentifier(v10);
        int v22 = 138543618;
        v23 = v12;
        __int16 v24 = 2112;
        id v25 = v6;
        _os_log_impl(&dword_19D57B000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Sending a 500 (Internal Server Error) for the request: %@", (uint8_t *)&v22, 0x16u);
      }
      v13 = v10;
      uint64_t v14 = 500;
    }
    else
    {
      char v15 = objc_opt_respondsToSelector();
      v16 = (void *)MEMORY[0x19F3A87A0]();
      v17 = self;
      BOOL v18 = HMFGetOSLogHandle();
      v19 = v18;
      if (v15)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          v20 = HMFGetLogIdentifier(v17);
          int v22 = 138543618;
          v23 = v20;
          __int16 v24 = 2112;
          id v25 = v6;
          _os_log_impl(&dword_19D57B000, v19, OS_LOG_TYPE_INFO, "%{public}@Received complete request: %@", (uint8_t *)&v22, 0x16u);
        }
        [v8 connection:v17 didReceiveRequest:v6];
        goto LABEL_14;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v21 = HMFGetLogIdentifier(v17);
        int v22 = 138543618;
        v23 = v21;
        __int16 v24 = 2112;
        id v25 = v6;
        _os_log_impl(&dword_19D57B000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Sending a 501 (Not Implemented) for the request: %@", (uint8_t *)&v22, 0x16u);
      }
      v13 = v17;
      uint64_t v14 = 501;
    }
    [(_HMFCFHTTPServerConnection *)v13 _sendStatusCode:v14 forRequest:v6];
LABEL_14:
    [(NSMutableArray *)self->_pendingRequests removeObject:v6];
  }
}

- (void)_stopReadBody:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x19F3A87A0]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = HMFGetLogIdentifier(v6);
    int v12 = 138543618;
    v13 = v8;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_19D57B000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Closing body stream for request: %@", (uint8_t *)&v12, 0x16u);
  }
  uint64_t v9 = [v4 bodyStream];
  if (v9)
  {
    int v10 = (__CFReadStream *)v9;
    v11 = [v4 activity];
    [v11 markWithReason:@"Closing body stream"];

    CFReadStreamSetClient(v10, 0, 0, 0);
    MEMORY[0x19F3A7B70](v10, 0);
    CFReadStreamClose(v10);
  }
}

- (void)handleRequest:(id)a3 bodyReadStream:(__CFReadStream *)a4 eventType:(unint64_t)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (a5 == 16) {
    goto LABEL_17;
  }
  if (a5 == 8)
  {
    uint64_t v16 = (void *)MEMORY[0x19F3A87A0]();
    v17 = self;
    BOOL v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = HMFGetLogIdentifier(v17);
      *(_DWORD *)buffer = 138543618;
      v40 = v19;
      __int16 v41 = 2112;
      unint64_t v42 = (unint64_t)v8;
      _os_log_impl(&dword_19D57B000, v18, OS_LOG_TYPE_INFO, "%{public}@Received body stream error for request: %@", buffer, 0x16u);
    }
    goto LABEL_14;
  }
  if (a5 != 2)
  {
    uint64_t v16 = (void *)MEMORY[0x19F3A87A0]();
    v17 = self;
    v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = HMFGetLogIdentifier(v17);
      *(_DWORD *)buffer = 138543874;
      v40 = v21;
      __int16 v41 = 2048;
      unint64_t v42 = a5;
      __int16 v43 = 2112;
      id v44 = v8;
      _os_log_impl(&dword_19D57B000, v20, OS_LOG_TYPE_ERROR, "%{public}@Received unknown event: %ld, for request: %@", buffer, 0x20u);
    }
LABEL_14:

    [(_HMFCFHTTPServerConnection *)v17 _sendStatusCode:500 forRequest:v8];
    goto LABEL_18;
  }
  CFIndex v9 = CFReadStreamRead(a4, buffer, 1024);
  CFIndex v10 = v9;
  if (v9 >= 1)
  {
    v11 = (void *)MEMORY[0x19F3A87A0]();
    int v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      __int16 v14 = HMFGetLogIdentifier(v12);
      int v33 = 138543874;
      uint64_t v34 = v14;
      __int16 v35 = 2048;
      CFIndex v36 = v10;
      __int16 v37 = 2112;
      id v38 = v8;
      _os_log_impl(&dword_19D57B000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Reading %ld bytes for request: %@", (uint8_t *)&v33, 0x20u);
    }
    id v15 = [MEMORY[0x1E4F1C9B8] dataWithBytes:buffer length:v10];
    [v8 appendBodyData:v15];

    goto LABEL_18;
  }
  if (v9 < 0)
  {
    __int16 v24 = (void *)MEMORY[0x19F3A87A0]();
    id v25 = self;
    uint64_t v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v27 = HMFGetLogIdentifier(v25);
      int v33 = 138543618;
      uint64_t v34 = v27;
      __int16 v35 = 2112;
      CFIndex v36 = (CFIndex)v8;
      _os_log_impl(&dword_19D57B000, v26, OS_LOG_TYPE_INFO, "%{public}@Failed to read available data for request: %@", (uint8_t *)&v33, 0x16u);
    }
    v28 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:11];
    [(_HMFCFHTTPServerConnection *)v25 _handleCompletedReceivedRequest:v8 error:v28];
  }
  else
  {
    int v22 = [v8 body];
    uint64_t v23 = [v22 length];

    if (v23)
    {
LABEL_17:
      [(_HMFCFHTTPServerConnection *)self _handleCompletedReceivedRequest:v8 error:0];
      goto LABEL_18;
    }
    int v29 = (void *)MEMORY[0x19F3A87A0]();
    v30 = self;
    __int16 v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = HMFGetLogIdentifier(v30);
      int v33 = 138543618;
      uint64_t v34 = v32;
      __int16 v35 = 2112;
      CFIndex v36 = (CFIndex)v8;
      _os_log_impl(&dword_19D57B000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@Got zero bytes read and no accumulated read bytes for request: %@", (uint8_t *)&v33, 0x16u);
    }
  }
LABEL_18:
}

- (void)_sendStatusCode:(int64_t)a3 forRequest:(id)a4
{
}

- (void)_sendStatusCode:(int64_t)a3 forRequest:(id)a4 bodyData:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  [(_HMFCFHTTPServerConnection *)self _stopReadBody:v8];
  [(NSMutableArray *)self->_pendingRequests removeObject:v8];
  CFIndex v10 = [[_HMFCFHTTPServerResponse alloc] initWithRequest:v8 statusCode:a3];
  [(_HMFCFHTTPServerResponse *)v10 setBody:v9];
  objc_initWeak(&location, self);
  objc_initWeak(&from, v10);
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __66___HMFCFHTTPServerConnection__sendStatusCode_forRequest_bodyData___block_invoke;
  __int16 v14 = &unk_1E5957F80;
  objc_copyWeak(&v15, &location);
  objc_copyWeak(&v16, &from);
  [(_HMFCFHTTPServerResponse *)v10 setCompletionHandler:&v11];
  -[_HMFCFHTTPServerConnection sendResponse:](self, "sendResponse:", v10, v11, v12, v13, v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

- (void)sendResponse:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(_HMFCFHTTPServerConnection *)self clientQueue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __43___HMFCFHTTPServerConnection_sendResponse___block_invoke;
    v6[3] = &unk_1E5957730;
    id v7 = v4;
    id v8 = self;
    dispatch_async(v5, v6);
  }
}

- (void)_handleCompletedResponse:(_CFHTTPServerResponse *)a3 error:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = (void *)MEMORY[0x19F3A87A0]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    CFIndex v10 = HMFGetLogIdentifier(v8);
    *(_DWORD *)CFStreamClientContext buf = 138543874;
    v40 = v10;
    __int16 v41 = 2112;
    unint64_t v42 = a3;
    __int16 v43 = 2112;
    id v44 = v6;
    _os_log_impl(&dword_19D57B000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Completed sending response, %@, with error: %@", buf, 0x20u);
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v11 = [(_HMFCFHTTPServerConnection *)v8 pendingRespones];
  uint64_t v12 = (void *)[v11 copy];

  uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (!v13) {
    goto LABEL_20;
  }
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)v35;
  while (2)
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v35 != v15) {
        objc_enumerationMutation(v12);
      }
      v17 = *(void **)(*((void *)&v34 + 1) + 8 * i);
      if ((_CFHTTPServerResponse *)[v17 responseRef] == a3)
      {
        BOOL v18 = [v17 activity];
        [v18 invalidate];

        v19 = [v17 request];
        v20 = [v19 activity];
        [v20 invalidate];

        v21 = (void *)MEMORY[0x19F3A87A0]();
        int v22 = v8;
        uint64_t v23 = HMFGetOSLogHandle();
        __int16 v24 = v23;
        if (v6)
        {
          if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_18;
          }
          id v25 = HMFGetLogIdentifier(v22);
          uint64_t v26 = [v17 shortDescription];
          *(_DWORD *)CFStreamClientContext buf = 138543874;
          v40 = v25;
          __int16 v41 = 2112;
          unint64_t v42 = v26;
          __int16 v43 = 2112;
          id v44 = v6;
          v27 = "%{public}@Failed to send response, %@, with error: %@";
          v28 = v24;
          os_log_type_t v29 = OS_LOG_TYPE_DEFAULT;
          uint32_t v30 = 32;
        }
        else
        {
          if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO)) {
            goto LABEL_18;
          }
          id v25 = HMFGetLogIdentifier(v22);
          uint64_t v26 = [v17 shortDescription];
          *(_DWORD *)CFStreamClientContext buf = 138543618;
          v40 = v25;
          __int16 v41 = 2112;
          unint64_t v42 = v26;
          v27 = "%{public}@Successfully sent response: %@";
          v28 = v24;
          os_log_type_t v29 = OS_LOG_TYPE_INFO;
          uint32_t v30 = 22;
        }
        _os_log_impl(&dword_19D57B000, v28, v29, v27, buf, v30);

LABEL_18:
        __int16 v31 = [(_HMFCFHTTPServerConnection *)v22 pendingRespones];
        [v31 removeObject:v17];

        v32 = [v17 completionHandler];

        if (v32)
        {
          int v33 = [v17 completionHandler];
          ((void (**)(void, id))v33)[2](v33, v6);

          [v17 setCompletionHandler:0];
        }
        goto LABEL_20;
      }
    }
    uint64_t v14 = [v12 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v14) {
      continue;
    }
    break;
  }
LABEL_20:
}

+ (id)logCategory
{
  if (_MergedGlobals_3_7 != -1) {
    dispatch_once(&_MergedGlobals_3_7, &__block_literal_global_23);
  }
  v2 = (void *)qword_1EB4EEAC0;
  return v2;
}

- (id)logIdentifier
{
  v2 = [(_HMFCFHTTPServerConnection *)self address];
  BOOL v3 = [v2 addressString];

  return v3;
}

- (_HMFCFHTTPServerConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_HMFCFHTTPServerConnectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HMFNetAddress)address
{
  return self->_address;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (NSMutableArray)pendingRequests
{
  return self->_pendingRequests;
}

- (NSMutableArray)pendingRespones
{
  return self->_pendingRespones;
}

- (_CFHTTPServerConnection)internal
{
  return self->_internal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingRespones, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end