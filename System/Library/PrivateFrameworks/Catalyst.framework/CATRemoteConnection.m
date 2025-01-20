@interface CATRemoteConnection
+ (void)createConnectionPairWithConnection:(id *)a3 andConnection:(id *)a4;
+ (void)createConnectionPairWithConnection:(id *)a3 andConnection:(id *)a4 bufferSize:(unint64_t)a5;
- (BOOL)secureUsingIdentity:(__SecIdentity *)a3 trustedCertificates:(id)a4 isServer:(BOOL)a5;
- (BOOL)trySendingDataWithContext:(id)a3 error:(id *)a4;
- (BOOL)usesSSL;
- (CATRemoteConnection)initWithInputStream:(id)a3 outputStream:(id)a4;
- (CATRemoteConnection)initWithInputStream:(id)a3 outputStream:(id)a4 bufferSize:(unint64_t)a5;
- (CATRemoteConnection)initWithNetService:(id)a3;
- (CATRemoteConnectionDelegate)delegate;
- (CATRemoteConnectionSocketOptions)socketOptions;
- (NSArray)customTrustEvaluationPolicies;
- (NSInputStream)inputStream;
- (NSOutputStream)outputStream;
- (NSString)description;
- (NSString)name;
- (__SecTrust)peerTrust;
- (double)connectionTimeoutInterval;
- (int)applyCustomEvaluationPoliciesToTrust:(__SecTrust *)a3;
- (unint64_t)bufferSize;
- (void)_stream:(id)a3 handleEvent:(unint64_t)a4;
- (void)close;
- (void)configureStreamSocketOptions;
- (void)connectionDidInterruptWithError:(id)a3;
- (void)connectionDidReceiveData;
- (void)connectionShouldSendData;
- (void)connectionTimedOut;
- (void)dealloc;
- (void)delegateDidClose;
- (void)delegateDidFailToSendData:(id)a3 userInfo:(id)a4 error:(id)a5;
- (void)delegateDidFailToSendDataWithStream:(id)a3 userInfo:(id)a4 error:(id)a5;
- (void)delegateDidInterruptWithError:(id)a3;
- (void)delegateDidOpen;
- (void)delegateDidReceiveData:(id)a3;
- (void)delegateDidReceiveDataRequestWithURL:(id)a3;
- (void)delegateDidReceiveStreamData:(id)a3 moreComing:(BOOL)a4;
- (void)delegateDidSecure;
- (void)delegateDidSendData:(id)a3 userInfo:(id)a4;
- (void)delegateDidSendDataWithStream:(id)a3 userInfo:(id)a4;
- (void)delegateDidWriteDataForContextIfNeeded:(id)a3;
- (void)delegateDidWriteDataFromStream:(id)a3 totalBytesWritten:(unint64_t)a4 totalBytesExpectedToWrite:(unint64_t)a5 userInfo:(id)a6;
- (void)delegateWillSecure;
- (void)enqueueSendContext:(id)a3;
- (void)messageParser:(id)a3 didParseRequestData:(id)a4;
- (void)messageParser:(id)a3 didParseRequestWithURL:(id)a4;
- (void)messageParser:(id)a3 didParseResponseData:(id)a4 moreComing:(BOOL)a5;
- (void)open;
- (void)scheduleStreams;
- (void)secureUsingClientIdentity:(__SecIdentity *)a3 trustedCertificates:(id)a4;
- (void)secureUsingServerIdentity:(__SecIdentity *)a3 trustedCertificates:(id)a4;
- (void)sendData:(id)a3 userInfo:(id)a4;
- (void)sendDataWithStream:(id)a3 length:(unint64_t)a4 userInfo:(id)a5;
- (void)sendDidFail:(id)a3 withError:(id)a4;
- (void)sendDidSucceed:(id)a3;
- (void)setBufferSize:(unint64_t)a3;
- (void)setConnectionTimeoutInterval:(double)a3;
- (void)setCustomTrustEvaluationPolicies:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInputStream:(id)a3;
- (void)setName:(id)a3;
- (void)setOutputStream:(id)a3;
- (void)setSocketOptions:(id)a3;
- (void)setUsesSSL:(BOOL)a3;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
- (void)trustDecisionDidRespondWithDecisionToAllowUntrustedConnection:(BOOL)a3;
- (void)tryEvaluatingPeerTrustWithStream:(id)a3;
- (void)unscheduleStreams;
@end

@implementation CATRemoteConnection

- (__SecTrust)peerTrust
{
  v2 = [(CATRemoteConnection *)self inputStream];
  v3 = (__SecTrust *)[v2 propertyForKey:*MEMORY[0x263EFC7F8]];

  return v3;
}

+ (void)createConnectionPairWithConnection:(id *)a3 andConnection:(id *)a4
{
}

+ (void)createConnectionPairWithConnection:(id *)a3 andConnection:(id *)a4 bufferSize:(unint64_t)a5
{
  if (!a3)
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"CATRemoteConnection.m", 136, @"Invalid parameter not satisfying: %@", @"connection1" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"CATRemoteConnection.m", 137, @"Invalid parameter not satisfying: %@", @"connection2" object file lineNumber description];

    goto LABEL_3;
  }
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  id v19 = 0;
  id v20 = 0;
  [MEMORY[0x263EFFA10] getBoundStreamsWithBufferSize:a5 inputStream:&v20 outputStream:&v19];
  id v10 = v20;
  id v11 = v19;
  id v17 = 0;
  id v18 = 0;
  [MEMORY[0x263EFFA10] getBoundStreamsWithBufferSize:a5 inputStream:&v18 outputStream:&v17];
  id v12 = v18;
  id v13 = v17;
  *a3 = (id)[objc_alloc((Class)a1) initWithInputStream:v10 outputStream:v13 bufferSize:a5];
  id v14 = (id)[objc_alloc((Class)a1) initWithInputStream:v12 outputStream:v11 bufferSize:a5];

  *a4 = v14;
}

- (CATRemoteConnection)initWithNetService:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"CATRemoteConnection.m", 154, @"Invalid parameter not satisfying: %@", @"netService" object file lineNumber description];
  }
  id v14 = 0;
  id v15 = 0;
  if ([v5 getInputStream:&v15 outputStream:&v14])
  {
    v6 = [(CATRemoteConnection *)self initWithInputStream:v15 outputStream:v14];
    if (v6)
    {
      v7 = [v5 name];
      uint64_t v8 = [v7 copy];
      name = v6->_name;
      v6->_name = (NSString *)v8;
    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)CATRemoteConnection;
    v6 = [(CATRemoteConnection *)&v13 init];
  }
  id v10 = v6;

  return v10;
}

- (CATRemoteConnection)initWithInputStream:(id)a3 outputStream:(id)a4
{
  return [(CATRemoteConnection *)self initWithInputStream:a3 outputStream:a4 bufferSize:*MEMORY[0x263EF8AF8]];
}

- (CATRemoteConnection)initWithInputStream:(id)a3 outputStream:(id)a4 bufferSize:(unint64_t)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = v11;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v23 = [MEMORY[0x263F08690] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"CATRemoteConnection.m", 179, @"Invalid parameter not satisfying: %@", @"inputStream" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v24 = [MEMORY[0x263F08690] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"CATRemoteConnection.m", 180, @"Invalid parameter not satisfying: %@", @"outputStream" object file lineNumber description];

LABEL_3:
  v25.receiver = self;
  v25.super_class = (Class)CATRemoteConnection;
  objc_super v13 = [(CATRemoteConnection *)&v25 init];
  id v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_inputStream, a3);
    objc_storeStrong((id *)&v14->_outputStream, a4);
    v14->_connectionTimeoutInterval = -1.0;
    v14->_bufferSize = a5;
    uint64_t v15 = objc_opt_new();
    mMessageParser = v14->mMessageParser;
    v14->mMessageParser = (CATHTTPMessageParser *)v15;

    [(CATHTTPMessageParser *)v14->mMessageParser setDelegate:v14];
    uint64_t v17 = objc_opt_new();
    mPendingSendContexts = v14->mPendingSendContexts;
    v14->mPendingSendContexts = (NSMutableArray *)v17;

    uint64_t v19 = objc_opt_new();
    mStreamEventQueue = v14->mStreamEventQueue;
    v14->mStreamEventQueue = (CATSerialOperationQueue *)v19;

    [(CATSerialOperationQueue *)v14->mStreamEventQueue setName:@"Stream Event Queue"];
    v21 = CATGetCatalystQueue();
    [(CATOperationQueue *)v14->mStreamEventQueue setUnderlyingQueue:v21];

    [(CATSerialOperationQueue *)v14->mStreamEventQueue setSuspended:1];
    v14->mState = 1;
  }

  return v14;
}

- (void)dealloc
{
  if (self->mState != 4)
  {
    v4 = [MEMORY[0x263F08690] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"CATRemoteConnection.m", 208, @"%@ cannot dealloc while receiver is still valid.", self object file lineNumber description];
  }
  v5.receiver = self;
  v5.super_class = (Class)CATRemoteConnection;
  [(CATRemoteConnection *)&v5 dealloc];
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  v6 = [(CATRemoteConnection *)self name];
  v7 = [v3 stringWithFormat:@"<%@: %p { name = %@ } >", v5, self, v6];

  return (NSString *)v7;
}

- (void)sendData:(id)a3 userInfo:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [[_CATRemoteConnectionSendDataContext alloc] initWithData:v7 userInfo:v6];

  [(CATRemoteConnection *)self enqueueSendContext:v8];
}

- (void)sendDataWithStream:(id)a3 length:(unint64_t)a4 userInfo:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [[_CATRemoteConnectionSendDataWithStreamContext alloc] initWithStream:v9 length:a4 bufferSize:[(CATRemoteConnection *)self bufferSize] userInfo:v8];

  [(CATRemoteConnection *)self enqueueSendContext:v10];
}

- (void)secureUsingClientIdentity:(__SecIdentity *)a3 trustedCertificates:(id)a4
{
  id v7 = a4;
  id v6 = CATGetCatalystQueue();
  CATAssertIsQueue(v6);

  [(CATRemoteConnection *)self secureUsingIdentity:a3 trustedCertificates:v7 isServer:0];
}

- (void)secureUsingServerIdentity:(__SecIdentity *)a3 trustedCertificates:(id)a4
{
  id v7 = a4;
  id v6 = CATGetCatalystQueue();
  CATAssertIsQueue(v6);

  [(CATRemoteConnection *)self secureUsingIdentity:a3 trustedCertificates:v7 isServer:1];
}

- (void)open
{
  v53[1] = *MEMORY[0x263EF8340];
  v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  int64_t mState = self->mState;
  if (mState == 4)
  {
    v43 = [MEMORY[0x263F08690] currentHandler];
    v44 = NSStringFromSelector(a2);
    [v43 handleFailureInMethod:a2, self, @"CATRemoteConnection.m", 249, @"%@ cannot call %@ when invalidated.", self, v44 object file lineNumber description];

    int64_t mState = self->mState;
  }
  if (mState == 3)
  {
    self->int64_t mState = 1;
    mInterruptionError = self->mInterruptionError;
    self->mInterruptionError = 0;

    int64_t mState = self->mState;
  }
  if (mState)
  {
    id v7 = [(CATRemoteConnection *)self inputStream];
    id v8 = [v7 streamError];

    if (v8)
    {
      uint64_t v52 = *MEMORY[0x263F08608];
      id v9 = [(CATRemoteConnection *)self inputStream];
      id v10 = [v9 streamError];
      v53[0] = v10;
      id v11 = [NSDictionary dictionaryWithObjects:v53 forKeys:&v52 count:1];
      uint64_t v12 = 101;
LABEL_13:
      uint64_t v15 = CATErrorWithCodeAndUserInfo(v12, v11);
      [(CATRemoteConnection *)self connectionDidInterruptWithError:v15];

      return;
    }
    objc_super v13 = [(CATRemoteConnection *)self outputStream];
    id v14 = [v13 streamError];

    if (v14)
    {
      uint64_t v50 = *MEMORY[0x263F08608];
      id v9 = [(CATRemoteConnection *)self outputStream];
      id v10 = [v9 streamError];
      v51 = v10;
      id v11 = [NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];
      uint64_t v12 = 102;
      goto LABEL_13;
    }
    v16 = [(CATRemoteConnection *)self inputStream];
    [v16 setDelegate:self];

    uint64_t v17 = [(CATRemoteConnection *)self outputStream];
    [v17 setDelegate:self];

    id v18 = [(CATRemoteConnection *)self socketOptions];
    uint64_t v19 = [v18 adaptiveWriteTimeout];

    if (v19)
    {
      id v20 = [(CATRemoteConnection *)self socketOptions];
      v21 = [v20 adaptiveWriteTimeout];
      uint64_t v22 = [v21 integerValue];

      if (v22 >= 1)
      {
        v23 = [(CATRemoteConnection *)self inputStream];
        v24 = [NSNumber numberWithInteger:v22];
        uint64_t v25 = *MEMORY[0x263EFC6B8];
        [v23 setProperty:v24 forKey:*MEMORY[0x263EFC6B8]];

        v26 = [(CATRemoteConnection *)self outputStream];
        v27 = [NSNumber numberWithInteger:v22];
        [v26 setProperty:v27 forKey:v25];
      }
    }
    v28 = [(CATRemoteConnection *)self inputStream];
    uint64_t v29 = [v28 streamStatus];

    if (!v29)
    {
      v30 = [(CATRemoteConnection *)self inputStream];
      [v30 open];
    }
    v31 = [(CATRemoteConnection *)self outputStream];
    uint64_t v32 = [v31 streamStatus];

    if (!v32)
    {
      v33 = [(CATRemoteConnection *)self outputStream];
      [v33 open];
    }
    mConnectionTimeoutTimer = self->mConnectionTimeoutTimer;
    if (mConnectionTimeoutTimer)
    {
      dispatch_source_cancel(mConnectionTimeoutTimer);
      v35 = self->mConnectionTimeoutTimer;
      self->mConnectionTimeoutTimer = 0;
    }
    [(CATRemoteConnection *)self connectionTimeoutInterval];
    if (v36 > 0.0)
    {
      v37 = CATGetCatalystQueue();
      v38 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v37);

      [(CATRemoteConnection *)self connectionTimeoutInterval];
      dispatch_source_set_timer(v38, 0, (unint64_t)(v39 * 1000000000.0), 0);
      objc_initWeak(&location, self);
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __27__CATRemoteConnection_open__block_invoke;
      handler[3] = &unk_2641DC138;
      v40 = v38;
      v47 = v40;
      objc_copyWeak(&v48, &location);
      dispatch_source_set_event_handler(v40, handler);
      v41 = self->mConnectionTimeoutTimer;
      self->mConnectionTimeoutTimer = (OS_dispatch_source *)v40;
      v42 = v40;

      dispatch_resume((dispatch_object_t)self->mConnectionTimeoutTimer);
      objc_destroyWeak(&v48);

      objc_destroyWeak(&location);
    }
  }
  else
  {
    CATErrorWithCodeAndUserInfo(104, 0);
    id v45 = (id)objc_claimAutoreleasedReturnValue();
    -[CATRemoteConnection connectionDidInterruptWithError:](self, "connectionDidInterruptWithError:");
  }
}

void __27__CATRemoteConnection_open__block_invoke(uint64_t a1)
{
  if (!dispatch_source_testcancel(*(dispatch_source_t *)(a1 + 32)))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained connectionTimedOut];
  }
}

- (void)close
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  int64_t mState = self->mState;
  if (mState != 4)
  {
    mConnectionTimeoutTimer = self->mConnectionTimeoutTimer;
    if (mConnectionTimeoutTimer)
    {
      dispatch_source_cancel(mConnectionTimeoutTimer);
      id v6 = self->mConnectionTimeoutTimer;
      self->mConnectionTimeoutTimer = 0;

      int64_t mState = self->mState;
    }
    if (mState >= 1) {
      [(CATRemoteConnection *)self unscheduleStreams];
    }
    id v7 = [(CATRemoteConnection *)self inputStream];
    [v7 setDelegate:0];

    id v8 = [(CATRemoteConnection *)self outputStream];
    [v8 setDelegate:0];

    id v9 = [(CATRemoteConnection *)self inputStream];
    [v9 close];

    id v10 = [(CATRemoteConnection *)self outputStream];
    [v10 close];

    [(CATRemoteConnection *)self setInputStream:0];
    [(CATRemoteConnection *)self setOutputStream:0];
    [(CATHTTPMessageParser *)self->mMessageParser setDelegate:0];
    mMessageParser = self->mMessageParser;
    self->mMessageParser = 0;

    self->int64_t mState = 4;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v12 = self->mPendingSendContexts;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v22;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v21 + 1) + 8 * v16);
          id v18 = CATErrorWithCodeAndUserInfo(100, 0);
          [(CATRemoteConnection *)self sendDidFail:v17 withError:v18];

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v14);
    }

    [(CATSerialOperationQueue *)self->mStreamEventQueue cancelAllOperations];
    [(CATSerialOperationQueue *)self->mStreamEventQueue setSuspended:0];
    [(NSMutableArray *)self->mPendingSendContexts removeAllObjects];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __28__CATRemoteConnection_close__block_invoke;
    v20[3] = &unk_2641DBE60;
    v20[4] = self;
    uint64_t v19 = [MEMORY[0x263F086D0] blockOperationWithBlock:v20];
    [v19 setName:@"Connection did close"];
    [(CATSerialOperationQueue *)self->mStreamEventQueue addOperation:v19];
  }
}

uint64_t __28__CATRemoteConnection_close__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) delegateDidClose];
}

- (void)scheduleStreams
{
  v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  [(CATSerialOperationQueue *)self->mStreamEventQueue setSuspended:0];
  v4 = [(CATRemoteConnection *)self inputStream];
  objc_super v5 = CATGetCatalystQueue();
  MEMORY[0x216692C40](v4, v5);

  id v6 = [(CATRemoteConnection *)self outputStream];
  id v7 = CATGetCatalystQueue();
  MEMORY[0x216692C90](v6, v7);

  id v8 = [(CATRemoteConnection *)self inputStream];
  NSSelectorFromString(&cfstr_Scheduleincfru.isa);
  if (objc_opt_respondsToSelector())
  {
    id v9 = [(CATRemoteConnection *)self inputStream];
    if ([v9 streamStatus] == 2)
    {
      id v10 = [(CATRemoteConnection *)self inputStream];
      int v11 = [v10 hasBytesAvailable];

      if (!v11) {
        goto LABEL_7;
      }
      id v8 = [(CATRemoteConnection *)self inputStream];
      CFReadStreamSignalEvent();
    }
    else
    {
    }
  }

LABEL_7:
  id v15 = [(CATRemoteConnection *)self outputStream];
  NSSelectorFromString(&cfstr_Scheduleincfru.isa);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v12 = [(CATRemoteConnection *)self outputStream];
    if ([v12 streamStatus] == 2)
    {
      uint64_t v13 = [(CATRemoteConnection *)self outputStream];
      int v14 = [v13 hasSpaceAvailable];

      if (!v14) {
        return;
      }
      id v15 = [(CATRemoteConnection *)self outputStream];
      CFWriteStreamSignalEvent();
    }
    else
    {
    }
  }
}

- (void)unscheduleStreams
{
  v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  [(CATSerialOperationQueue *)self->mStreamEventQueue setSuspended:1];
  v4 = [(CATRemoteConnection *)self inputStream];
  MEMORY[0x216692C40](v4, 0);

  id v5 = [(CATRemoteConnection *)self outputStream];
  MEMORY[0x216692C90](v5, 0);
}

- (BOOL)secureUsingIdentity:(__SecIdentity *)a3 trustedCertificates:(id)a4 isServer:(BOOL)a5
{
  BOOL v5 = a5;
  v34[1] = *MEMORY[0x263EF8340];
  id v9 = (NSArray *)a4;
  id v10 = CATGetCatalystQueue();
  CATAssertIsQueue(v10);

  if (!a3)
  {
    v31 = [MEMORY[0x263F08690] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"CATRemoteConnection.m", 398, @"Invalid parameter not satisfying: %@", @"identity" object file lineNumber description];
  }
  if (self->mState == 4)
  {
    uint64_t v32 = [MEMORY[0x263F08690] currentHandler];
    v33 = NSStringFromSelector(a2);
    [v32 handleFailureInMethod:a2, self, @"CATRemoteConnection.m", 399, @"%@ cannot call %@ when invalidated.", self, v33 object file lineNumber description];
  }
  int v11 = [(CATRemoteConnection *)self inputStream];
  uint64_t v12 = *MEMORY[0x263EFC800];
  uint64_t v13 = [v11 propertyForKey:*MEMORY[0x263EFC800]];
  int v14 = (void *)v13;
  id v15 = (void *)MEMORY[0x263EFFA78];
  if (v13) {
    id v15 = (void *)v13;
  }
  id v16 = v15;

  uint64_t v17 = objc_opt_new();
  id v18 = [MEMORY[0x263EFF9D0] null];
  [v17 setObject:v18 forKeyedSubscript:*MEMORY[0x263EFC860]];

  [v17 addEntriesFromDictionary:v16];
  [v17 setObject:*MEMORY[0x263EFC878] forKeyedSubscript:*MEMORY[0x263EFC848]];
  v34[0] = a3;
  uint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:1];
  [v17 setObject:v19 forKeyedSubscript:*MEMORY[0x263EFC830]];

  id v20 = [NSNumber numberWithInt:v9 == 0];
  [v17 setObject:v20 forKeyedSubscript:*MEMORY[0x263EFC868]];

  long long v21 = [NSNumber numberWithBool:v5];
  [v17 setObject:v21 forKeyedSubscript:*MEMORY[0x263EFC840]];

  mTrustedCertificates = self->mTrustedCertificates;
  self->mTrustedCertificates = v9;

  long long v23 = [(CATRemoteConnection *)self inputStream];
  -[CATRemoteConnection setUsesSSL:](self, "setUsesSSL:", [v23 setProperty:v17 forKey:v12]);

  BOOL v24 = [(CATRemoteConnection *)self usesSSL];
  BOOL v25 = [(CATRemoteConnection *)self usesSSL];
  if (!v9 || !v25 || !v5)
  {
    if (v24) {
      goto LABEL_11;
    }
LABEL_13:
    uint64_t v29 = CATErrorWithCodeAndUserInfo(107, 0);
    [(CATRemoteConnection *)self connectionDidInterruptWithError:v29];

    BOOL v28 = 0;
    goto LABEL_14;
  }
  uint64_t v26 = [(CATRemoteConnection *)self inputStream];
  char v27 = [v26 setProperty:&unk_26C4B5E20 forKey:*MEMORY[0x263EFC6B0]];

  if ((v27 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_11:
  [(CATRemoteConnection *)self delegateWillSecure];
  BOOL v28 = 1;
LABEL_14:

  return v28;
}

- (void)tryEvaluatingPeerTrustWithStream:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = CATGetCatalystQueue();
  CATAssertIsQueue(v5);

  id v6 = (__SecTrust *)[v4 propertyForKey:*MEMORY[0x263EFC7F8]];
  if (v6)
  {
    SecTrustResultType result = kSecTrustResultInvalid;
    OSStatus v7 = SecTrustSetAnchorCertificates(v6, (CFArrayRef)self->mTrustedCertificates);
    if (v7
      || (OSStatus v7 = SecTrustSetAnchorCertificatesOnly(v6, 1u)) != 0
      || (OSStatus v7 = [(CATRemoteConnection *)self applyCustomEvaluationPoliciesToTrust:v6]) != 0)
    {
      OSStatus TrustResult = v7;
      id v9 = 0;
    }
    else
    {
      *(void *)buf = 0;
      if (SecTrustEvaluateWithError(v6, (CFErrorRef *)buf)) {
        id v9 = 0;
      }
      else {
        id v9 = *(void **)buf;
      }
      OSStatus TrustResult = SecTrustGetTrustResult(v6, &result);
    }
    if (_CATLogGeneral_onceToken_5 != -1) {
      dispatch_once(&_CATLogGeneral_onceToken_5, &__block_literal_global_9);
    }
    id v10 = (void *)_CATLogGeneral_logObj_5;
    if (os_log_type_enabled((os_log_t)_CATLogGeneral_logObj_5, OS_LOG_TYPE_INFO))
    {
      int v11 = NSNumber;
      uint64_t v12 = result;
      uint64_t v13 = v10;
      int v14 = [v11 numberWithUnsignedInt:v12];
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v14;
      _os_log_impl(&dword_213B7F000, v13, OS_LOG_TYPE_INFO, "trust result: %@", buf, 0xCu);
    }
    if (!TrustResult)
    {
      switch(result)
      {
        case kSecTrustResultProceed:
          goto LABEL_16;
        case kSecTrustResultRecoverableTrustFailure:
          self->mPeerTrustState = 3;
          id v16 = [[CATRemoteConnectionTrustDecision alloc] initWithConnection:self trust:v6];
          uint64_t v17 = [(CATRemoteConnection *)self delegate];
          char v18 = objc_opt_respondsToSelector();

          if (v18)
          {
            uint64_t v19 = [(CATRemoteConnection *)self delegate];
            [v19 connection:self encounteredTrustDecisionWhileTryingToSecure:v16];
          }
          goto LABEL_19;
        case kSecTrustResultUnspecified:
LABEL_16:
          self->mPeerTrustState = 1;
          [(CATRemoteConnection *)self delegateDidSecure];
LABEL_20:

          return;
      }
    }
    if (v9)
    {
      uint64_t v21 = *MEMORY[0x263F08608];
      long long v22 = v9;
      id v15 = [NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      CATErrorWithCodeAndUserInfo(106, v15);
      id v16 = (CATRemoteConnectionTrustDecision *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      CATErrorWithCodeAndUserInfo(106, 0);
      id v16 = (CATRemoteConnectionTrustDecision *)objc_claimAutoreleasedReturnValue();
    }
    self->mPeerTrustState = 2;
    [(CATRemoteConnection *)self connectionDidInterruptWithError:v16];
LABEL_19:

    goto LABEL_20;
  }
}

- (int)applyCustomEvaluationPoliciesToTrust:(__SecTrust *)a3
{
  id v4 = [(CATRemoteConnection *)self customTrustEvaluationPolicies];
  if (v4) {
    OSStatus v5 = SecTrustSetPolicies(a3, v4);
  }
  else {
    OSStatus v5 = 0;
  }

  return v5;
}

- (void)trustDecisionDidRespondWithDecisionToAllowUntrustedConnection:(BOOL)a3
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __85__CATRemoteConnection_trustDecisionDidRespondWithDecisionToAllowUntrustedConnection___block_invoke;
  v5[3] = &unk_2641DC160;
  BOOL v6 = a3;
  v5[4] = self;
  v3 = v5;
  id v4 = CATGetCatalystQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_5;
  block[3] = &unk_2641DBD98;
  id v8 = v3;
  dispatch_async(v4, block);
}

void __85__CATRemoteConnection_trustDecisionDidRespondWithDecisionToAllowUntrustedConnection___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 40))
  {
    *(void *)(v2 + 64) = 1;
    [*(id *)(a1 + 32) delegateDidSecure];
    [*(id *)(a1 + 32) connectionShouldSendData];
    v3 = *(void **)(a1 + 32);
    [v3 connectionDidReceiveData];
  }
  else
  {
    *(void *)(v2 + 64) = 2;
    id v4 = *(void **)(a1 + 32);
    CATErrorWithCodeAndUserInfo(106, 0);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [v4 connectionDidInterruptWithError:v5];
  }
}

- (void)configureStreamSocketOptions
{
  v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  id v4 = [(CATRemoteConnection *)self inputStream];
  CFDataRef v5 = (const __CFData *)CFReadStreamCopyProperty(v4, (CFStreamPropertyKey)*MEMORY[0x263EFFEB8]);

  if (v5)
  {
    *(_DWORD *)buffer = 0;
    v39.id location = 0;
    v39.length = 4;
    CFDataGetBytes(v5, v39, buffer);
    CFRelease(v5);
    BOOL v6 = [(CATRemoteConnection *)self name];

    if (!v6)
    {
      OSStatus v7 = [MEMORY[0x263EFF990] dataWithLength:28];
      socklen_t v37 = [v7 length];
      int v8 = *(_DWORD *)buffer;
      id v9 = v7;
      if (!getpeername(v8, (sockaddr *)[v9 mutableBytes], &v37))
      {
        [v9 setLength:v37];
        id v10 = [[CATAddress alloc] initWithData:v9];
        int v11 = [(CATAddress *)v10 address];
        [(CATRemoteConnection *)self setName:v11];
      }
    }
    uint64_t v12 = [(CATRemoteConnection *)self socketOptions];
    uint64_t v13 = [v12 keepAliveEnabled];
    signed int v14 = [v13 intValue];

    socklen_t v37 = v14;
    if (v14 >= 1)
    {
      if (setsockopt(*(int *)buffer, 0xFFFF, 8, &v37, 4u) < 0) {
        goto LABEL_16;
      }
      id v15 = [(CATRemoteConnection *)self socketOptions];
      id v16 = [v15 keepAliveDelay];

      if (v16)
      {
        uint64_t v17 = [(CATRemoteConnection *)self socketOptions];
        char v18 = [v17 keepAliveDelay];
        int v19 = [v18 intValue];

        int v36 = v19;
        if (setsockopt(*(int *)buffer, 6, 16, &v36, 4u) < 0) {
          goto LABEL_16;
        }
      }
      id v20 = [(CATRemoteConnection *)self socketOptions];
      uint64_t v21 = [v20 keepAliveInterval];

      if (v21)
      {
        long long v22 = [(CATRemoteConnection *)self socketOptions];
        long long v23 = [v22 keepAliveInterval];
        int v24 = [v23 intValue];

        int v36 = v24;
        if (setsockopt(*(int *)buffer, 6, 257, &v36, 4u) < 0) {
          goto LABEL_16;
        }
      }
      BOOL v25 = [(CATRemoteConnection *)self socketOptions];
      uint64_t v26 = [v25 keepAliveCount];

      if (v26)
      {
        char v27 = [(CATRemoteConnection *)self socketOptions];
        BOOL v28 = [v27 keepAliveCount];
        int v29 = [v28 intValue];

        int v36 = v29;
        if (setsockopt(*(int *)buffer, 6, 258, &v36, 4u) < 0) {
          goto LABEL_16;
        }
      }
      v30 = [(CATRemoteConnection *)self socketOptions];
      v31 = [v30 netServiceType];

      if (v31)
      {
        uint64_t v32 = [(CATRemoteConnection *)self socketOptions];
        v33 = [v32 netServiceType];
        int v34 = [v33 intValue];

        int v36 = v34;
        if (setsockopt(*(int *)buffer, 0xFFFF, 4374, &v36, 4u) < 0)
        {
LABEL_16:
          v35 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
          [(CATRemoteConnection *)self connectionDidInterruptWithError:v35];
        }
      }
    }
  }
}

- (void)connectionTimedOut
{
  v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  CATErrorWithCodeAndUserInfo(105, 0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(CATRemoteConnection *)self connectionDidInterruptWithError:v4];
}

- (void)connectionShouldSendData
{
  v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  uint64_t v4 = [(NSMutableArray *)self->mPendingSendContexts lastObject];
  if (v4)
  {
    CFDataRef v5 = (void *)v4;
    id v6 = 0;
    while (1)
    {
      OSStatus v7 = v6;
      id v10 = v6;
      BOOL v8 = [(CATRemoteConnection *)self trySendingDataWithContext:v5 error:&v10];
      id v6 = v10;

      if (!v8) {
        break;
      }
      if (([v5 hasBytesRemaining] & 1) == 0)
      {
        [(NSMutableArray *)self->mPendingSendContexts removeLastObject];
        [(CATRemoteConnection *)self sendDidSucceed:v5];
        uint64_t v9 = [(NSMutableArray *)self->mPendingSendContexts lastObject];

        CFDataRef v5 = (void *)v9;
        if (v9) {
          continue;
        }
      }
      goto LABEL_8;
    }
    [(CATRemoteConnection *)self sendDidFail:v5 withError:v6];
LABEL_8:
  }
}

- (void)enqueueSendContext:(id)a3
{
  id v9 = a3;
  uint64_t v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  int64_t mState = self->mState;
  if (mState)
  {
    if (mState == 3)
    {
      OSStatus v7 = self->mInterruptionError;
      goto LABEL_11;
    }
    if (mState == 4)
    {
      uint64_t v6 = 100;
    }
    else
    {
      if (![(CATRemoteConnection *)self usesSSL] || self->mPeerTrustState != 2) {
        goto LABEL_13;
      }
      uint64_t v6 = 106;
    }
  }
  else
  {
    uint64_t v6 = 104;
  }
  CATErrorWithCodeAndUserInfo(v6, 0);
  OSStatus v7 = (NSError *)objc_claimAutoreleasedReturnValue();
LABEL_11:
  BOOL v8 = v7;
  if (v7)
  {
    [(CATRemoteConnection *)self sendDidFail:v9 withError:v7];

    goto LABEL_16;
  }
LABEL_13:
  [(NSMutableArray *)self->mPendingSendContexts insertObject:v9 atIndex:0];
  if (![(CATRemoteConnection *)self usesSSL] || self->mPeerTrustState == 1) {
    [(CATRemoteConnection *)self connectionShouldSendData];
  }
LABEL_16:
}

- (BOOL)trySendingDataWithContext:(id)a3 error:(id *)a4
{
  v30[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  OSStatus v7 = CATGetCatalystQueue();
  CATAssertIsQueue(v7);

  id v26 = 0;
  BOOL v8 = [v6 bufferedDataWithError:&v26];
  id v9 = v26;
  if ([v8 length])
  {
    while (1)
    {
      id v10 = [(CATRemoteConnection *)self outputStream];
      int v11 = [v10 hasSpaceAvailable];

      if (!v11) {
        break;
      }
      uint64_t v12 = [(CATRemoteConnection *)self outputStream];
      id v13 = v8;
      uint64_t v14 = objc_msgSend(v12, "write:maxLength:", objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"));

      if (v14 < 1)
      {
        if ((v14 & 0x8000000000000000) == 0)
        {
          BOOL v8 = v13;
          break;
        }
        id v20 = [(CATRemoteConnection *)self outputStream];
        uint64_t v21 = [v20 streamError];
        if (v21)
        {
          uint64_t v29 = *MEMORY[0x263F08608];
          long long v22 = [(CATRemoteConnection *)self outputStream];
          long long v23 = [v22 streamError];
          v30[0] = v23;
          int v24 = [NSDictionary dictionaryWithObjects:v30 forKeys:&v29 count:1];
          CATErrorWithCodeAndUserInfo(102, v24);
          id v18 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          CATErrorWithCodeAndUserInfo(102, 0);
          id v18 = (id)objc_claimAutoreleasedReturnValue();
        }

        if (a4) {
          goto LABEL_16;
        }
        goto LABEL_17;
      }
      objc_msgSend(v6, "setBytesWritten:", objc_msgSend(v6, "bytesWritten") + v14);
      id v25 = v9;
      BOOL v8 = [v6 bufferedDataWithError:&v25];
      id v15 = v25;

      if ([v6 clientBytesWritten]) {
        [(CATRemoteConnection *)self delegateDidWriteDataForContextIfNeeded:v6];
      }
      id v9 = v15;
      if (![v8 length])
      {
        if (!v8) {
          goto LABEL_12;
        }
        goto LABEL_8;
      }
    }
  }
  id v15 = v9;
  if (v8)
  {
LABEL_8:
    BOOL v16 = 1;
  }
  else
  {
LABEL_12:
    if (v15)
    {
      uint64_t v27 = *MEMORY[0x263F08608];
      id v28 = v15;
      uint64_t v17 = [NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      CATErrorWithCodeAndUserInfo(102, v17);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      CATErrorWithCodeAndUserInfo(102, 0);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v13 = 0;
    id v9 = v15;
    if (a4)
    {
LABEL_16:
      id v18 = v18;
      *a4 = v18;
    }
LABEL_17:

    BOOL v16 = 0;
    BOOL v8 = v13;
    id v15 = v9;
  }

  return v16;
}

- (void)sendDidSucceed:(id)a3
{
  id v7 = a3;
  uint64_t v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CFDataRef v5 = [v7 data];
    id v6 = [v7 userInfo];
    [(CATRemoteConnection *)self delegateDidSendData:v5 userInfo:v6];
  }
  else
  {
    CFDataRef v5 = [v7 stream];
    id v6 = [v7 userInfo];
    [(CATRemoteConnection *)self delegateDidSendDataWithStream:v5 userInfo:v6];
  }
}

- (void)sendDidFail:(id)a3 withError:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = CATGetCatalystQueue();
  CATAssertIsQueue(v7);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v8 = [v10 data];
    id v9 = [v10 userInfo];
    [(CATRemoteConnection *)self delegateDidFailToSendData:v8 userInfo:v9 error:v6];
  }
  else
  {
    BOOL v8 = [v10 stream];
    id v9 = [v10 userInfo];
    [(CATRemoteConnection *)self delegateDidFailToSendDataWithStream:v8 userInfo:v9 error:v6];
  }
}

- (void)connectionDidReceiveData
{
  v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  uint64_t v4 = [(CATRemoteConnection *)self inputStream];
  int v5 = [v4 hasBytesAvailable];

  if (v5)
  {
    if (!self->mReadBuffer)
    {
      objc_msgSend(MEMORY[0x263EFF990], "dataWithLength:", -[CATRemoteConnection bufferSize](self, "bufferSize"));
      id v6 = (NSMutableData *)objc_claimAutoreleasedReturnValue();
      mReadBuffer = self->mReadBuffer;
      self->mReadBuffer = v6;
    }
    BOOL v8 = [(CATRemoteConnection *)self inputStream];
    uint64_t v9 = objc_msgSend(v8, "read:maxLength:", -[NSMutableData mutableBytes](self->mReadBuffer, "mutableBytes"), -[NSMutableData length](self->mReadBuffer, "length"));

    if (v9 >= 1)
    {
      mMessageParser = self->mMessageParser;
      if (mMessageParser)
      {
        if (![(CATHTTPMessageParser *)mMessageParser appendBytes:[(NSMutableData *)self->mReadBuffer bytes] length:v9])
        {
          CATErrorWithCodeAndUserInfo(300, 0);
          id v11 = (id)objc_claimAutoreleasedReturnValue();
          [(CATRemoteConnection *)self connectionDidInterruptWithError:v11];
        }
      }
    }
  }
}

- (void)connectionDidInterruptWithError:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = CATGetCatalystQueue();
  CATAssertIsQueue(v7);

  if (!v6)
  {
    BOOL v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"CATRemoteConnection.m", 747, @"Invalid parameter not satisfying: %@", @"error" object file lineNumber description];
  }
  int64_t mState = self->mState;
  if ((unint64_t)(mState - 3) >= 2)
  {
    if (mState)
    {
      objc_storeStrong((id *)&self->mInterruptionError, a3);
      self->int64_t mState = 3;
    }
    mConnectionTimeoutTimer = self->mConnectionTimeoutTimer;
    if (mConnectionTimeoutTimer)
    {
      dispatch_source_cancel(mConnectionTimeoutTimer);
      id v10 = self->mConnectionTimeoutTimer;
      self->mConnectionTimeoutTimer = 0;
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v11 = self->mPendingSendContexts;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v11);
          }
          [(CATRemoteConnection *)self sendDidFail:*(void *)(*((void *)&v17 + 1) + 8 * v15++) withError:v6];
        }
        while (v13 != v15);
        uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v13);
    }

    [(NSMutableArray *)self->mPendingSendContexts removeAllObjects];
    [(CATRemoteConnection *)self delegateDidInterruptWithError:v6];
  }
}

- (void)delegateWillSecure
{
  v3 = [(CATRemoteConnection *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(CATRemoteConnection *)self delegate];
    [v5 connectionWillSecure:self];
  }
}

- (void)delegateDidSecure
{
  v3 = [(CATRemoteConnection *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(CATRemoteConnection *)self delegate];
    [v5 connectionDidSecure:self];
  }
}

- (void)delegateDidSendData:(id)a3 userInfo:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = CATGetCatalystQueue();
  CATAssertIsQueue(v7);

  BOOL v8 = [(CATRemoteConnection *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(CATRemoteConnection *)self delegate];
    [v10 connection:self didSendData:v11 userInfo:v6];
  }
}

- (void)delegateDidFailToSendData:(id)a3 userInfo:(id)a4 error:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = CATGetCatalystQueue();
  CATAssertIsQueue(v10);

  id v11 = [(CATRemoteConnection *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    uint64_t v13 = [(CATRemoteConnection *)self delegate];
    [v13 connection:self didFailToSendData:v14 userInfo:v8 error:v9];
  }
}

- (void)delegateDidReceiveData:(id)a3
{
  id v8 = a3;
  char v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  id v5 = [(CATRemoteConnection *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(CATRemoteConnection *)self delegate];
    [v7 connection:self didReceiveData:v8];
  }
}

- (void)delegateDidReceiveDataRequestWithURL:(id)a3
{
  id v8 = a3;
  char v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  id v5 = [(CATRemoteConnection *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(CATRemoteConnection *)self delegate];
    [v7 connection:self didReceiveDataRequestWithURL:v8];
  }
}

- (void)delegateDidWriteDataForContextIfNeeded:(id)a3
{
  id v10 = a3;
  char v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v10;
    char v6 = [v5 stream];
    uint64_t v7 = [v5 clientBytesWritten];
    uint64_t v8 = [v5 dataLength];
    id v9 = [v5 userInfo];

    [(CATRemoteConnection *)self delegateDidWriteDataFromStream:v6 totalBytesWritten:v7 totalBytesExpectedToWrite:v8 userInfo:v9];
  }
}

- (void)delegateDidWriteDataFromStream:(id)a3 totalBytesWritten:(unint64_t)a4 totalBytesExpectedToWrite:(unint64_t)a5 userInfo:(id)a6
{
  id v15 = a3;
  id v10 = a6;
  id v11 = CATGetCatalystQueue();
  CATAssertIsQueue(v11);

  char v12 = [(CATRemoteConnection *)self delegate];
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    id v14 = [(CATRemoteConnection *)self delegate];
    [v14 connection:self didWriteDataFromStream:v15 totalBytesWritten:a4 totalBytesExpectedToWrite:a5 userInfo:v10];
  }
}

- (void)delegateDidSendDataWithStream:(id)a3 userInfo:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  uint64_t v7 = CATGetCatalystQueue();
  CATAssertIsQueue(v7);

  uint64_t v8 = [(CATRemoteConnection *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(CATRemoteConnection *)self delegate];
    [v10 connection:self didSendDataWithStream:v11 userInfo:v6];
  }
}

- (void)delegateDidFailToSendDataWithStream:(id)a3 userInfo:(id)a4 error:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = CATGetCatalystQueue();
  CATAssertIsQueue(v10);

  id v11 = [(CATRemoteConnection *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    char v13 = [(CATRemoteConnection *)self delegate];
    [v13 connection:self didFailToSendDataWithStream:v14 userInfo:v8 error:v9];
  }
}

- (void)delegateDidReceiveStreamData:(id)a3 moreComing:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  id v6 = CATGetCatalystQueue();
  CATAssertIsQueue(v6);

  uint64_t v7 = [(CATRemoteConnection *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(CATRemoteConnection *)self delegate];
    [v9 connection:self didReceiveStreamData:v10 moreComing:v4];
  }
}

- (void)delegateDidOpen
{
  v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  BOOL v4 = [(CATRemoteConnection *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CATRemoteConnection *)self delegate];
    [v6 connectionDidOpen:self];
  }
}

- (void)delegateDidClose
{
  v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  BOOL v4 = [(CATRemoteConnection *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CATRemoteConnection *)self delegate];
    [v6 connectionDidClose:self];
  }
}

- (void)delegateDidInterruptWithError:(id)a3
{
  id v8 = a3;
  BOOL v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  char v5 = [(CATRemoteConnection *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    uint64_t v7 = [(CATRemoteConnection *)self delegate];
    [v7 connection:self didInterruptWithError:v8];
  }
}

- (void)messageParser:(id)a3 didParseRequestData:(id)a4
{
  id v6 = a4;
  char v5 = CATGetCatalystQueue();
  CATAssertIsQueue(v5);

  if (self->mState != 4) {
    [(CATRemoteConnection *)self delegateDidReceiveData:v6];
  }
}

- (void)messageParser:(id)a3 didParseResponseData:(id)a4 moreComing:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  uint64_t v7 = CATGetCatalystQueue();
  CATAssertIsQueue(v7);

  if (self->mState != 4) {
    [(CATRemoteConnection *)self delegateDidReceiveStreamData:v8 moreComing:v5];
  }
}

- (void)messageParser:(id)a3 didParseRequestWithURL:(id)a4
{
  id v6 = a4;
  BOOL v5 = CATGetCatalystQueue();
  CATAssertIsQueue(v5);

  if (self->mState != 4) {
    [(CATRemoteConnection *)self delegateDidReceiveDataRequestWithURL:v6];
  }
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  id v6 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __42__CATRemoteConnection_stream_handleEvent___block_invoke;
  v11[3] = &unk_2641DC188;
  v11[4] = self;
  id v12 = v6;
  unint64_t v13 = a4;
  uint64_t v7 = v11;
  id v8 = v6;
  id v9 = CATGetCatalystQueue();
  id v10 = v7;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_5;
  block[3] = &unk_2641DBD98;
  id v15 = v10;
  dispatch_async(v9, block);
}

void __42__CATRemoteConnection_stream_handleEvent___block_invoke(void *a1)
{
  uint64_t v2 = (void *)MEMORY[0x263F086D0];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__CATRemoteConnection_stream_handleEvent___block_invoke_2;
  v7[3] = &unk_2641DC188;
  v3 = (void *)a1[5];
  v7[4] = a1[4];
  id v4 = v3;
  uint64_t v5 = a1[6];
  id v8 = v4;
  uint64_t v9 = v5;
  id v6 = [v2 blockOperationWithBlock:v7];
  [v6 setName:@"Handle Stream Event Operation"];
  [*(id *)(a1[4] + 72) addOperation:v6];
}

void *__42__CATRemoteConnection_stream_handleEvent___block_invoke_2(void *a1)
{
  SecTrustResultType result = (void *)a1[4];
  if (result[2] != 4) {
    return (void *)[result _stream:a1[5] handleEvent:a1[6]];
  }
  return result;
}

- (void)_stream:(id)a3 handleEvent:(unint64_t)a4
{
  v21[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = CATGetCatalystQueue();
  CATAssertIsQueue(v7);

  switch(a4)
  {
    case 1uLL:
      if (self->mState == 1)
      {
        id v8 = [(CATRemoteConnection *)self inputStream];
        if ((unint64_t)[v8 streamStatus] <= 1) {
          goto LABEL_26;
        }
        uint64_t v9 = [(CATRemoteConnection *)self outputStream];
        unint64_t v10 = [v9 streamStatus];

        if (v10 >= 2)
        {
          self->int64_t mState = 2;
          [(CATRemoteConnection *)self configureStreamSocketOptions];
          [(CATRemoteConnection *)self delegateDidOpen];
        }
      }
      goto LABEL_27;
    case 2uLL:
      if ([(CATRemoteConnection *)self usesSSL] && !self->mPeerTrustState) {
        [(CATRemoteConnection *)self tryEvaluatingPeerTrustWithStream:v6];
      }
      if (![(CATRemoteConnection *)self usesSSL] || self->mPeerTrustState == 1) {
        [(CATRemoteConnection *)self connectionDidReceiveData];
      }
      goto LABEL_27;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_27;
    case 4uLL:
      if ([(CATRemoteConnection *)self usesSSL] && !self->mPeerTrustState) {
        [(CATRemoteConnection *)self tryEvaluatingPeerTrustWithStream:v6];
      }
      if (![(CATRemoteConnection *)self usesSSL] || self->mPeerTrustState == 1) {
        [(CATRemoteConnection *)self connectionShouldSendData];
      }
      goto LABEL_27;
    case 8uLL:
      id v12 = [(CATRemoteConnection *)self inputStream];

      if (v12 == v6)
      {
        uint64_t v20 = *MEMORY[0x263F08608];
        id v8 = [(CATRemoteConnection *)self inputStream];
        id v14 = [v8 streamError];
        v21[0] = v14;
        id v15 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
        uint64_t v16 = 101;
        goto LABEL_25;
      }
      id v13 = [(CATRemoteConnection *)self outputStream];

      if (v13 == v6)
      {
        uint64_t v18 = *MEMORY[0x263F08608];
        id v8 = [(CATRemoteConnection *)self outputStream];
        id v14 = [v8 streamError];
        long long v19 = v14;
        id v15 = [NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
        uint64_t v16 = 102;
LABEL_25:
        long long v17 = CATErrorWithCodeAndUserInfo(v16, v15);
        [(CATRemoteConnection *)self connectionDidInterruptWithError:v17];

        goto LABEL_26;
      }
LABEL_27:

      return;
    default:
      if (a4 == 16)
      {
        id v11 = [(CATRemoteConnection *)self inputStream];

        if (v11 == v6)
        {
          id v8 = CATErrorWithCodeAndUserInfo(103, 0);
          [(CATRemoteConnection *)self connectionDidInterruptWithError:v8];
LABEL_26:
        }
      }
      goto LABEL_27;
  }
}

- (CATRemoteConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CATRemoteConnectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (BOOL)usesSSL
{
  return self->_usesSSL;
}

- (void)setUsesSSL:(BOOL)a3
{
  self->_usesSSL = a3;
}

- (double)connectionTimeoutInterval
{
  return self->_connectionTimeoutInterval;
}

- (void)setConnectionTimeoutInterval:(double)a3
{
  self->_connectionTimeoutInterval = a3;
}

- (CATRemoteConnectionSocketOptions)socketOptions
{
  return self->_socketOptions;
}

- (void)setSocketOptions:(id)a3
{
}

- (NSArray)customTrustEvaluationPolicies
{
  return self->_customTrustEvaluationPolicies;
}

- (void)setCustomTrustEvaluationPolicies:(id)a3
{
}

- (NSInputStream)inputStream
{
  return self->_inputStream;
}

- (void)setInputStream:(id)a3
{
}

- (NSOutputStream)outputStream
{
  return self->_outputStream;
}

- (void)setOutputStream:(id)a3
{
}

- (unint64_t)bufferSize
{
  return self->_bufferSize;
}

- (void)setBufferSize:(unint64_t)a3
{
  self->_bufferSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputStream, 0);
  objc_storeStrong((id *)&self->_inputStream, 0);
  objc_storeStrong((id *)&self->_customTrustEvaluationPolicies, 0);
  objc_storeStrong((id *)&self->_socketOptions, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->mStreamEventQueue, 0);
  objc_storeStrong((id *)&self->mTrustedCertificates, 0);
  objc_storeStrong((id *)&self->mReadBuffer, 0);
  objc_storeStrong((id *)&self->mInterruptionError, 0);
  objc_storeStrong((id *)&self->mConnectionTimeoutTimer, 0);
  objc_storeStrong((id *)&self->mPendingSendContexts, 0);

  objc_storeStrong((id *)&self->mMessageParser, 0);
}

@end