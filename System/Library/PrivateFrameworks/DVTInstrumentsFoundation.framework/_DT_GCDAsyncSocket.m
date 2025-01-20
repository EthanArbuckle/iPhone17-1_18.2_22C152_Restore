@interface _DT_GCDAsyncSocket
+ (BOOL)getHost:(id *)a3 port:(unsigned __int16 *)a4 family:(char *)a5 fromAddress:(id)a6;
+ (BOOL)getHost:(id *)a3 port:(unsigned __int16 *)a4 fromAddress:(id)a5;
+ (BOOL)isIPv4Address:(id)a3;
+ (BOOL)isIPv6Address:(id)a3;
+ (id)CRData;
+ (id)CRLFData;
+ (id)LFData;
+ (id)ZeroData;
+ (id)gaiError:(int)a3;
+ (id)hostFromAddress:(id)a3;
+ (id)hostFromSockaddr4:(const sockaddr_in *)a3;
+ (id)hostFromSockaddr6:(const sockaddr_in6 *)a3;
+ (id)lookupHost:(id)a3 port:(unsigned __int16)a4 error:(id *)a5;
+ (unsigned)portFromAddress:(id)a3;
+ (unsigned)portFromSockaddr4:(const sockaddr_in *)a3;
+ (unsigned)portFromSockaddr6:(const sockaddr_in6 *)a3;
+ (void)cfstreamThread;
+ (void)scheduleCFStreams:(id)a3;
+ (void)startCFStreamThreadIfNeeded;
+ (void)stopCFStreamThreadIfNeeded;
+ (void)unscheduleCFStreams:(id)a3;
- (BOOL)acceptOnInterface:(id)a3 port:(unsigned __int16)a4 error:(id *)a5;
- (BOOL)acceptOnPort:(unsigned __int16)a3 error:(id *)a4;
- (BOOL)addStreamsToRunLoop;
- (BOOL)autoDisconnectOnClosedReadStream;
- (BOOL)connectToAddress:(id)a3 error:(id *)a4;
- (BOOL)connectToAddress:(id)a3 viaInterface:(id)a4 withTimeout:(double)a5 error:(id *)a6;
- (BOOL)connectToAddress:(id)a3 withTimeout:(double)a4 error:(id *)a5;
- (BOOL)connectToHost:(id)a3 onPort:(unsigned __int16)a4 error:(id *)a5;
- (BOOL)connectToHost:(id)a3 onPort:(unsigned __int16)a4 viaInterface:(id)a5 withTimeout:(double)a6 error:(id *)a7;
- (BOOL)connectToHost:(id)a3 onPort:(unsigned __int16)a4 withTimeout:(double)a5 error:(id *)a6;
- (BOOL)connectWithAddress4:(id)a3 address6:(id)a4 error:(id *)a5;
- (BOOL)createReadAndWriteStream;
- (BOOL)doAccept:(int)a3;
- (BOOL)isConnected;
- (BOOL)isDisconnected;
- (BOOL)isIPv4;
- (BOOL)isIPv4Enabled;
- (BOOL)isIPv4PreferredOverIPv6;
- (BOOL)isIPv6;
- (BOOL)isIPv6Enabled;
- (BOOL)isSecure;
- (BOOL)openStreams;
- (BOOL)preConnectWithInterface:(id)a3 error:(id *)a4;
- (BOOL)registerForStreamCallbacksIncludingReadWrite:(BOOL)a3;
- (BOOL)usingCFStreamForTLS;
- (BOOL)usingSecureTransportForTLS;
- (NSData)connectedAddress;
- (NSData)localAddress;
- (NSString)connectedHost;
- (NSString)localHost;
- (OS_dispatch_queue)delegateQueue;
- (SSLContext)sslContext;
- (_DT_GCDAsyncSocket)init;
- (_DT_GCDAsyncSocket)initWithDelegate:(id)a3 delegateQueue:(id)a4;
- (_DT_GCDAsyncSocket)initWithDelegate:(id)a3 delegateQueue:(id)a4 socketQueue:(id)a5;
- (_DT_GCDAsyncSocket)initWithSocketQueue:(id)a3;
- (__CFReadStream)readStream;
- (__CFWriteStream)writeStream;
- (float)progressOfReadReturningTag:(int64_t *)a3 bytesDone:(unint64_t *)a4 total:(unint64_t *)a5;
- (float)progressOfWriteReturningTag:(int64_t *)a3 bytesDone:(unint64_t *)a4 total:(unint64_t *)a5;
- (id)badConfigError:(id)a3;
- (id)badParamError:(id)a3;
- (id)connectTimeoutError;
- (id)connectedHost4;
- (id)connectedHost6;
- (id)connectedHostFromSocket4:(int)a3;
- (id)connectedHostFromSocket6:(int)a3;
- (id)connectionClosedError;
- (id)delegate;
- (id)errnoError;
- (id)errnoErrorWithReason:(id)a3;
- (id)localHost4;
- (id)localHost6;
- (id)localHostFromSocket4:(int)a3;
- (id)localHostFromSocket6:(int)a3;
- (id)otherError:(id)a3;
- (id)readMaxedOutError;
- (id)readTimeoutError;
- (id)sslError:(int)a3;
- (id)userData;
- (id)writeTimeoutError;
- (int)socket4FD;
- (int)socket6FD;
- (int)socketFD;
- (int)sslReadWithBuffer:(void *)a3 length:(unint64_t *)a4;
- (int)sslWriteWithBuffer:(const void *)a3 length:(unint64_t *)a4;
- (unsigned)connectedPort;
- (unsigned)connectedPort4;
- (unsigned)connectedPort6;
- (unsigned)connectedPortFromSocket4:(int)a3;
- (unsigned)connectedPortFromSocket6:(int)a3;
- (unsigned)localPort;
- (unsigned)localPort4;
- (unsigned)localPort6;
- (unsigned)localPortFromSocket4:(int)a3;
- (unsigned)localPortFromSocket6:(int)a3;
- (void)cf_abortSSLHandshake:(id)a3;
- (void)cf_finishSSLHandshake;
- (void)cf_startTLS;
- (void)closeWithError:(id)a3;
- (void)completeCurrentRead;
- (void)completeCurrentWrite;
- (void)dealloc;
- (void)didConnect:(int)a3;
- (void)didNotConnect:(int)a3 error:(id)a4;
- (void)disconnect;
- (void)disconnectAfterReading;
- (void)disconnectAfterReadingAndWriting;
- (void)disconnectAfterWriting;
- (void)doConnectTimeout;
- (void)doReadData;
- (void)doReadEOF;
- (void)doReadTimeout;
- (void)doReadTimeoutWithExtension:(double)a3;
- (void)doWriteData;
- (void)doWriteTimeout;
- (void)doWriteTimeoutWithExtension:(double)a3;
- (void)endConnectTimeout;
- (void)endCurrentRead;
- (void)endCurrentWrite;
- (void)flushSSLBuffers;
- (void)getDelegate:(id *)a3 delegateQueue:(id *)a4;
- (void)getInterfaceAddress4:(id *)a3 address6:(id *)a4 fromDescription:(id)a5 port:(unsigned __int16)a6;
- (void)lookup:(int)a3 didFail:(id)a4;
- (void)lookup:(int)a3 didSucceedWithAddress4:(id)a4 address6:(id)a5;
- (void)markSocketQueueTargetQueue:(id)a3;
- (void)maybeClose;
- (void)maybeDequeueRead;
- (void)maybeDequeueWrite;
- (void)maybeStartTLS;
- (void)performBlock:(id)a3;
- (void)readDataToData:(id)a3 withTimeout:(double)a4 buffer:(id)a5 bufferOffset:(unint64_t)a6 maxLength:(unint64_t)a7 tag:(int64_t)a8;
- (void)readDataToData:(id)a3 withTimeout:(double)a4 buffer:(id)a5 bufferOffset:(unint64_t)a6 tag:(int64_t)a7;
- (void)readDataToData:(id)a3 withTimeout:(double)a4 maxLength:(unint64_t)a5 tag:(int64_t)a6;
- (void)readDataToData:(id)a3 withTimeout:(double)a4 tag:(int64_t)a5;
- (void)readDataToLength:(unint64_t)a3 withTimeout:(double)a4 buffer:(id)a5 bufferOffset:(unint64_t)a6 tag:(int64_t)a7;
- (void)readDataToLength:(unint64_t)a3 withTimeout:(double)a4 tag:(int64_t)a5;
- (void)readDataWithTimeout:(double)a3 buffer:(id)a4 bufferOffset:(unint64_t)a5 maxLength:(unint64_t)a6 tag:(int64_t)a7;
- (void)readDataWithTimeout:(double)a3 buffer:(id)a4 bufferOffset:(unint64_t)a5 tag:(int64_t)a6;
- (void)readDataWithTimeout:(double)a3 tag:(int64_t)a4;
- (void)removeStreamsFromRunLoop;
- (void)resumeReadSource;
- (void)resumeWriteSource;
- (void)setAutoDisconnectOnClosedReadStream:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegate:(id)a3 delegateQueue:(id)a4;
- (void)setDelegate:(id)a3 delegateQueue:(id)a4 synchronously:(BOOL)a5;
- (void)setDelegate:(id)a3 synchronously:(BOOL)a4;
- (void)setDelegateQueue:(id)a3;
- (void)setDelegateQueue:(id)a3 synchronously:(BOOL)a4;
- (void)setIPv4Enabled:(BOOL)a3;
- (void)setIPv4PreferredOverIPv6:(BOOL)a3;
- (void)setIPv6Enabled:(BOOL)a3;
- (void)setUserData:(id)a3;
- (void)setupReadAndWriteSourcesForNewlyConnectedSocket:(int)a3;
- (void)setupReadTimerWithTimeout:(double)a3;
- (void)setupWriteTimerWithTimeout:(double)a3;
- (void)ssl_continueSSLHandshake;
- (void)ssl_shouldTrustPeer:(BOOL)a3 stateIndex:(int)a4;
- (void)ssl_startTLS;
- (void)startConnectTimeout:(double)a3;
- (void)startTLS:(id)a3;
- (void)suspendReadSource;
- (void)suspendWriteSource;
- (void)synchronouslySetDelegate:(id)a3;
- (void)synchronouslySetDelegate:(id)a3 delegateQueue:(id)a4;
- (void)synchronouslySetDelegateQueue:(id)a3;
- (void)unmarkSocketQueueTargetQueue:(id)a3;
- (void)writeData:(id)a3 withTimeout:(double)a4 tag:(int64_t)a5;
@end

@implementation _DT_GCDAsyncSocket

- (_DT_GCDAsyncSocket)init
{
  return [(_DT_GCDAsyncSocket *)self initWithDelegate:0 delegateQueue:0 socketQueue:0];
}

- (_DT_GCDAsyncSocket)initWithSocketQueue:(id)a3
{
  return [(_DT_GCDAsyncSocket *)self initWithDelegate:0 delegateQueue:0 socketQueue:a3];
}

- (_DT_GCDAsyncSocket)initWithDelegate:(id)a3 delegateQueue:(id)a4
{
  return [(_DT_GCDAsyncSocket *)self initWithDelegate:a3 delegateQueue:a4 socketQueue:0];
}

- (_DT_GCDAsyncSocket)initWithDelegate:(id)a3 delegateQueue:(id)a4 socketQueue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v31.receiver = self;
  v31.super_class = (Class)_DT_GCDAsyncSocket;
  v12 = [(_DT_GCDAsyncSocket *)&v31 init];
  v13 = v12;
  if (v12)
  {
    objc_storeWeak(&v12->delegate, v9);
    objc_storeStrong((id *)&v13->delegateQueue, a4);
    *(void *)&v13->socket4FD = -1;
    v13->stateIndex = 0;
    if (v11)
    {
      dispatch_get_global_queue(-2, 0);
      id v14 = (id)objc_claimAutoreleasedReturnValue();

      if (v14 == v11)
      {
        v28 = [MEMORY[0x263F08690] currentHandler];
        [v28 handleFailureInMethod:a2 object:v13 file:@"GCDAsyncSocket.m" lineNumber:948 description:@"The given socketQueue parameter must not be a concurrent queue."];
      }
      dispatch_get_global_queue(2, 0);
      id v15 = (id)objc_claimAutoreleasedReturnValue();

      if (v15 == v11)
      {
        v29 = [MEMORY[0x263F08690] currentHandler];
        [v29 handleFailureInMethod:a2 object:v13 file:@"GCDAsyncSocket.m" lineNumber:950 description:@"The given socketQueue parameter must not be a concurrent queue."];
      }
      dispatch_get_global_queue(0, 0);
      id v16 = (id)objc_claimAutoreleasedReturnValue();

      if (v16 == v11)
      {
        v30 = [MEMORY[0x263F08690] currentHandler];
        [v30 handleFailureInMethod:a2 object:v13 file:@"GCDAsyncSocket.m" lineNumber:952 description:@"The given socketQueue parameter must not be a concurrent queue."];
      }
      dispatch_queue_t v17 = (dispatch_queue_t)v11;
    }
    else
    {
      dispatch_queue_t v17 = dispatch_queue_create((const char *)[@"_DT_GCDAsyncSocket" UTF8String], 0);
    }
    socketQueue = v13->socketQueue;
    v13->socketQueue = (OS_dispatch_queue *)v17;

    v13->IsOnSocketQueueOrTargetQueueKey = &v13->IsOnSocketQueueOrTargetQueueKey;
    dispatch_queue_set_specific((dispatch_queue_t)v13->socketQueue, &v13->IsOnSocketQueueOrTargetQueueKey, v13, 0);
    uint64_t v19 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:5];
    readQueue = v13->readQueue;
    v13->readQueue = (NSMutableArray *)v19;

    currentRead = v13->currentRead;
    v13->currentRead = 0;

    uint64_t v22 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:5];
    writeQueue = v13->writeQueue;
    v13->writeQueue = (NSMutableArray *)v22;

    currentWrite = v13->currentWrite;
    v13->currentWrite = 0;

    v25 = [[_DT_GCDAsyncSocketPreBuffer alloc] initWithCapacity:4096];
    preBuffer = v13->preBuffer;
    v13->preBuffer = v25;
  }
  return v13;
}

- (void)dealloc
{
  self->flags |= 0x10000u;
  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
  {
    [(_DT_GCDAsyncSocket *)self closeWithError:0];
  }
  else
  {
    socketQueue = self->socketQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_2308B452C;
    block[3] = &unk_264B8D590;
    block[4] = self;
    dispatch_sync(socketQueue, block);
  }
  objc_storeWeak(&self->delegate, 0);
  delegateQueue = self->delegateQueue;
  self->delegateQueue = 0;

  v5 = self->socketQueue;
  self->socketQueue = 0;

  v6.receiver = self;
  v6.super_class = (Class)_DT_GCDAsyncSocket;
  [(_DT_GCDAsyncSocket *)&v6 dealloc];
}

- (id)delegate
{
  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
  {
    id WeakRetained = objc_loadWeakRetained(&self->delegate);
  }
  else
  {
    uint64_t v7 = 0;
    v8 = &v7;
    uint64_t v9 = 0x3032000000;
    id v10 = sub_2308B4644;
    id v11 = sub_2308B4654;
    id v12 = 0;
    socketQueue = self->socketQueue;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = sub_2308B465C;
    v6[3] = &unk_264B8EC38;
    v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(socketQueue, v6);
    id WeakRetained = (id)v8[5];
    _Block_object_dispose(&v7, 8);
  }
  return WeakRetained;
}

- (void)setDelegate:(id)a3 synchronously:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_2308B4788;
  v10[3] = &unk_264B8DA70;
  v10[4] = self;
  id v7 = v6;
  id v11 = v7;
  v8 = (void (**)(void))_Block_copy(v10);
  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
  {
    v8[2](v8);
  }
  else
  {
    socketQueue = self->socketQueue;
    if (v4) {
      dispatch_sync(socketQueue, v8);
    }
    else {
      dispatch_async(socketQueue, v8);
    }
  }
}

- (void)setDelegate:(id)a3
{
}

- (void)synchronouslySetDelegate:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
  {
    v3 = self->delegateQueue;
  }
  else
  {
    uint64_t v7 = 0;
    v8 = &v7;
    uint64_t v9 = 0x3032000000;
    id v10 = sub_2308B4644;
    id v11 = sub_2308B4654;
    id v12 = 0;
    socketQueue = self->socketQueue;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = sub_2308B48B0;
    v6[3] = &unk_264B8EC38;
    v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(socketQueue, v6);
    v3 = (OS_dispatch_queue *)(id)v8[5];
    _Block_object_dispose(&v7, 8);
  }
  return v3;
}

- (void)setDelegateQueue:(id)a3 synchronously:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_2308B49A4;
  v10[3] = &unk_264B8DA70;
  v10[4] = self;
  id v7 = v6;
  id v11 = v7;
  v8 = (void (**)(void))_Block_copy(v10);
  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
  {
    v8[2](v8);
  }
  else
  {
    socketQueue = self->socketQueue;
    if (v4) {
      dispatch_sync(socketQueue, v8);
    }
    else {
      dispatch_async(socketQueue, v8);
    }
  }
}

- (void)setDelegateQueue:(id)a3
{
}

- (void)synchronouslySetDelegateQueue:(id)a3
{
}

- (void)getDelegate:(id *)a3 delegateQueue:(id *)a4
{
  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
  {
    if (a3) {
      *a3 = objc_loadWeakRetained(&self->delegate);
    }
    if (a4) {
      *a4 = self->delegateQueue;
    }
  }
  else
  {
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x3032000000;
    v18 = sub_2308B4644;
    uint64_t v19 = sub_2308B4654;
    id v20 = 0;
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x3032000000;
    id v12 = sub_2308B4644;
    v13 = sub_2308B4654;
    id v14 = 0;
    socketQueue = self->socketQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_2308B4B44;
    block[3] = &unk_264B8EC60;
    block[4] = self;
    void block[5] = &v15;
    block[6] = &v9;
    dispatch_sync(socketQueue, block);
    if (a3) {
      *a3 = (id) v16[5];
    }
    if (a4) {
      *a4 = (id) v10[5];
    }
    _Block_object_dispose(&v9, 8);

    _Block_object_dispose(&v15, 8);
  }
}

- (void)setDelegate:(id)a3 delegateQueue:(id)a4 synchronously:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_2308B4CB8;
  aBlock[3] = &unk_264B8EC88;
  aBlock[4] = self;
  id v10 = v8;
  id v15 = v10;
  id v11 = v9;
  id v16 = v11;
  id v12 = (void (**)(void))_Block_copy(aBlock);
  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
  {
    v12[2](v12);
  }
  else
  {
    socketQueue = self->socketQueue;
    if (v5) {
      dispatch_sync(socketQueue, v12);
    }
    else {
      dispatch_async(socketQueue, v12);
    }
  }
}

- (void)setDelegate:(id)a3 delegateQueue:(id)a4
{
}

- (void)synchronouslySetDelegate:(id)a3 delegateQueue:(id)a4
{
}

- (BOOL)isIPv4Enabled
{
  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey)) {
    return (self->config & 1) == 0;
  }
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  socketQueue = self->socketQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_2308B4DE0;
  v6[3] = &unk_264B8EC38;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(socketQueue, v6);
  BOOL v3 = *((unsigned char *)v8 + 24) != 0;
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (void)setIPv4Enabled:(BOOL)a3
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_2308B4EAC;
  v5[3] = &unk_264B8ECB0;
  BOOL v6 = a3;
  v5[4] = self;
  BOOL v4 = (void (**)(void))_Block_copy(v5);
  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey)) {
    v4[2](v4);
  }
  else {
    dispatch_async((dispatch_queue_t)self->socketQueue, v4);
  }
}

- (BOOL)isIPv6Enabled
{
  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey)) {
    return (self->config & 2) == 0;
  }
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  socketQueue = self->socketQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_2308B4FA0;
  v6[3] = &unk_264B8EC38;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(socketQueue, v6);
  BOOL v3 = *((unsigned char *)v8 + 24) != 0;
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (void)setIPv6Enabled:(BOOL)a3
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_2308B506C;
  v5[3] = &unk_264B8ECB0;
  BOOL v6 = a3;
  v5[4] = self;
  BOOL v4 = (void (**)(void))_Block_copy(v5);
  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey)) {
    v4[2](v4);
  }
  else {
    dispatch_async((dispatch_queue_t)self->socketQueue, v4);
  }
}

- (BOOL)isIPv4PreferredOverIPv6
{
  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey)) {
    return (self->config & 4) == 0;
  }
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  socketQueue = self->socketQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_2308B5160;
  v6[3] = &unk_264B8EC38;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(socketQueue, v6);
  BOOL v3 = *((unsigned char *)v8 + 24) != 0;
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (void)setIPv4PreferredOverIPv6:(BOOL)a3
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_2308B522C;
  v5[3] = &unk_264B8ECB0;
  BOOL v6 = a3;
  v5[4] = self;
  BOOL v4 = (void (**)(void))_Block_copy(v5);
  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey)) {
    v4[2](v4);
  }
  else {
    dispatch_async((dispatch_queue_t)self->socketQueue, v4);
  }
}

- (id)userData
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  char v10 = sub_2308B4644;
  id v11 = sub_2308B4654;
  id v12 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_2308B5388;
  v6[3] = &unk_264B8EC38;
  v6[4] = self;
  v6[5] = &v7;
  BOOL v3 = (void (**)(void))_Block_copy(v6);
  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey)) {
    v3[2](v3);
  }
  else {
    dispatch_sync((dispatch_queue_t)self->socketQueue, v3);
  }
  id v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)setUserData:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2308B546C;
  v7[3] = &unk_264B8DA70;
  v7[4] = self;
  id v5 = v4;
  id v8 = v5;
  BOOL v6 = (void (**)(void))_Block_copy(v7);
  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey)) {
    v6[2](v6);
  }
  else {
    dispatch_async((dispatch_queue_t)self->socketQueue, v6);
  }
}

- (BOOL)acceptOnPort:(unsigned __int16)a3 error:(id *)a4
{
  return [(_DT_GCDAsyncSocket *)self acceptOnInterface:0 port:a3 error:a4];
}

- (BOOL)acceptOnInterface:(id)a3 port:(unsigned __int16)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = (void *)[v8 copy];
  uint64_t v30 = 0;
  objc_super v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = sub_2308B4644;
  v28 = sub_2308B4654;
  id v29 = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_2308B56DC;
  aBlock[3] = &unk_264B8ECD8;
  aBlock[4] = self;
  void aBlock[5] = &v24;
  char v10 = _Block_copy(aBlock);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_2308B58A8;
  v17[3] = &unk_264B8ED48;
  v17[4] = self;
  id v20 = &v24;
  id v11 = v9;
  id v18 = v11;
  unsigned __int16 v22 = a4;
  id v12 = v10;
  id v19 = v12;
  v21 = &v30;
  v13 = (void (**)(void))_Block_copy(v17);
  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey)) {
    v13[2](v13);
  }
  else {
    dispatch_sync((dispatch_queue_t)self->socketQueue, v13);
  }
  int v14 = *((unsigned __int8 *)v31 + 24);
  if (a5 && !*((unsigned char *)v31 + 24))
  {
    *a5 = (id) v25[5];
    int v14 = *((unsigned __int8 *)v31 + 24);
  }
  BOOL v15 = v14 != 0;

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v15;
}

- (BOOL)doAccept:(int)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  int socket4FD = self->socket4FD;
  *(void *)&v22.sa_len = 0;
  *(void *)&v22.sa_data[6] = 0;
  if (socket4FD == a3)
  {
    socklen_t v6 = 16;
  }
  else
  {
    int v24 = 0;
    uint64_t v23 = 0;
    socklen_t v6 = 28;
  }
  socklen_t v21 = v6;
  int v7 = accept(a3, &v22, &v21);
  if (v7 == -1) {
    return 0;
  }
  int v8 = v7;
  uint64_t v9 = [MEMORY[0x263EFF8F8] dataWithBytes:&v22 length:v21];
  if (fcntl(v8, 4, 4) == -1)
  {
    close(v8);

    return 0;
  }
  *(_DWORD *)&v22.sa_len = 1;
  setsockopt(v8, 0xFFFF, 4130, &v22, 4u);
  if (self->delegateQueue)
  {
    BOOL v10 = socket4FD == a3;
    id WeakRetained = objc_loadWeakRetained(&self->delegate);
    delegateQueue = self->delegateQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_2308B6098;
    block[3] = &unk_264B8ED70;
    id v16 = WeakRetained;
    id v17 = v9;
    id v18 = self;
    BOOL v20 = v10;
    int v19 = v8;
    id v13 = WeakRetained;
    dispatch_async(delegateQueue, block);
  }
  return 1;
}

- (BOOL)preConnectWithInterface:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (!dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
  {
    BOOL v20 = [MEMORY[0x263F08690] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"GCDAsyncSocket.m" lineNumber:1799 description:@"Must be dispatched on socketQueue"];
  }
  id WeakRetained = objc_loadWeakRetained(&self->delegate);

  if (!WeakRetained)
  {
    if (a4)
    {
      BOOL v10 = @"Attempting to connect without a delegate. Set a delegate first.";
      goto LABEL_15;
    }
LABEL_30:
    BOOL v11 = 0;
    goto LABEL_31;
  }
  if (!self->delegateQueue)
  {
    if (a4)
    {
      BOOL v10 = @"Attempting to connect without a delegate queue. Set a delegate queue first.";
      goto LABEL_15;
    }
    goto LABEL_30;
  }
  if (![(_DT_GCDAsyncSocket *)self isDisconnected])
  {
    if (a4)
    {
      BOOL v10 = @"Attempting to connect while connected or accepting connections. Disconnect first.";
      goto LABEL_15;
    }
    goto LABEL_30;
  }
  int config = self->config;
  if ((~config & 3) != 0)
  {
    if (v7)
    {
      id v21 = 0;
      id v22 = 0;
      [(_DT_GCDAsyncSocket *)self getInterfaceAddress4:&v22 address6:&v21 fromDescription:v7 port:0];
      id v12 = (NSData *)v22;
      id v13 = v21;
      int v14 = (NSData *)v13;
      if (!((unint64_t)v12 | (unint64_t)v13))
      {
        if (a4)
        {
          BOOL v15 = @"Unknown interface. Specify valid interface by name (e.g. \"en1\") or IP address.";
LABEL_28:
          *a4 = [(_DT_GCDAsyncSocket *)self badParamError:v15];
          goto LABEL_29;
        }
        goto LABEL_29;
      }
      if ((config & 1) != 0 && !v13)
      {
        if (a4)
        {
          BOOL v15 = @"IPv4 has been disabled and specified interface doesn't support IPv6.";
          goto LABEL_28;
        }
LABEL_29:

        goto LABEL_30;
      }
      if ((config & 2) != 0 && !v12)
      {
        if (a4)
        {
          BOOL v15 = @"IPv6 has been disabled and specified interface doesn't support IPv4.";
          goto LABEL_28;
        }
        goto LABEL_29;
      }
      connectInterface4 = self->connectInterface4;
      self->connectInterface4 = v12;
      id v18 = v12;

      connectInterface6 = self->connectInterface6;
      self->connectInterface6 = v14;
    }
    [(NSMutableArray *)self->readQueue removeAllObjects];
    [(NSMutableArray *)self->writeQueue removeAllObjects];
    BOOL v11 = 1;
    goto LABEL_31;
  }
  if (!a4) {
    goto LABEL_30;
  }
  BOOL v10 = @"Both IPv4 and IPv6 have been disabled. Must enable at least one protocol first.";
LABEL_15:
  [(_DT_GCDAsyncSocket *)self badConfigError:v10];
  BOOL v11 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_31:

  return v11;
}

- (BOOL)connectToHost:(id)a3 onPort:(unsigned __int16)a4 error:(id *)a5
{
  return MEMORY[0x270F9A6D0](self, sel_connectToHost_onPort_withTimeout_error_);
}

- (BOOL)connectToHost:(id)a3 onPort:(unsigned __int16)a4 withTimeout:(double)a5 error:(id *)a6
{
  return MEMORY[0x270F9A6D0](self, sel_connectToHost_onPort_viaInterface_withTimeout_error_);
}

- (BOOL)connectToHost:(id)a3 onPort:(unsigned __int16)a4 viaInterface:(id)a5 withTimeout:(double)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a5;
  int v14 = (void *)[v12 copy];
  BOOL v15 = (void *)[v13 copy];
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v38 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = sub_2308B4644;
  char v33 = sub_2308B4654;
  id v34 = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_2308B6654;
  aBlock[3] = &unk_264B8EE10;
  id v16 = v14;
  uint64_t v25 = &v29;
  id v22 = v16;
  uint64_t v23 = self;
  id v17 = v15;
  unsigned __int16 v28 = a4;
  double v27 = a6;
  id v24 = v17;
  uint64_t v26 = &v35;
  id v18 = (void (**)(void))_Block_copy(aBlock);
  if (!dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
  {
    dispatch_sync((dispatch_queue_t)self->socketQueue, v18);
    if (!a7) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v18[2](v18);
  if (a7) {
LABEL_3:
  }
    *a7 = (id) v30[5];
LABEL_4:
  char v19 = *((unsigned char *)v36 + 24);

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  return v19;
}

- (BOOL)connectToAddress:(id)a3 error:(id *)a4
{
  return MEMORY[0x270F9A6D0](self, sel_connectToAddress_viaInterface_withTimeout_error_);
}

- (BOOL)connectToAddress:(id)a3 withTimeout:(double)a4 error:(id *)a5
{
  return MEMORY[0x270F9A6D0](self, sel_connectToAddress_viaInterface_withTimeout_error_);
}

- (BOOL)connectToAddress:(id)a3 viaInterface:(id)a4 withTimeout:(double)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = (void *)[v10 copy];
  id v13 = (void *)[v11 copy];
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  uint64_t v27 = 0;
  unsigned __int16 v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = sub_2308B4644;
  uint64_t v31 = sub_2308B4654;
  id v32 = 0;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = sub_2308B6DA8;
  v20[3] = &unk_264B8EE38;
  id v14 = v12;
  id v24 = &v27;
  id v21 = v14;
  id v22 = self;
  id v15 = v13;
  double v26 = a5;
  id v23 = v15;
  uint64_t v25 = &v33;
  id v16 = (void (**)(void))_Block_copy(v20);
  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey)) {
    v16[2](v16);
  }
  else {
    dispatch_sync((dispatch_queue_t)self->socketQueue, v16);
  }
  int v17 = *((unsigned __int8 *)v34 + 24);
  if (a6 && !*((unsigned char *)v34 + 24))
  {
    *a6 = (id) v28[5];
    int v17 = *((unsigned __int8 *)v34 + 24);
  }
  BOOL v18 = v17 != 0;

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v18;
}

- (void)lookup:(int)a3 didSucceedWithAddress4:(id)a4 address6:(id)a5
{
  unint64_t v9 = (unint64_t)a4;
  unint64_t v10 = (unint64_t)a5;
  if (!dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
  {
    id v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"GCDAsyncSocket.m" lineNumber:2132 description:@"Must be dispatched on socketQueue"];
  }
  if (!(v9 | v10))
  {
    id v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"GCDAsyncSocket.m" lineNumber:2133 description:@"Expected at least one valid address"];
  }
  if (self->stateIndex == a3)
  {
    unsigned __int16 config = self->config;
    if (v10 || (config & 1) == 0)
    {
      if (v9 || (config & 2) == 0)
      {
        id v17 = 0;
        BOOL v14 = [(_DT_GCDAsyncSocket *)self connectWithAddress4:v9 address6:v10 error:&v17];
        id v13 = v17;
        if (v14) {
          goto LABEL_14;
        }
        goto LABEL_13;
      }
      id v12 = @"IPv6 has been disabled and DNS lookup found no IPv4 address.";
    }
    else
    {
      id v12 = @"IPv4 has been disabled and DNS lookup found no IPv6 address.";
    }
    id v13 = [(_DT_GCDAsyncSocket *)self otherError:v12];
LABEL_13:
    [(_DT_GCDAsyncSocket *)self closeWithError:v13];
LABEL_14:
  }
}

- (void)lookup:(int)a3 didFail:(id)a4
{
  id v8 = a4;
  if (!dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
  {
    id v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"GCDAsyncSocket.m" lineNumber:2186 description:@"Must be dispatched on socketQueue"];
  }
  if (self->stateIndex == a3)
  {
    [(_DT_GCDAsyncSocket *)self endConnectTimeout];
    [(_DT_GCDAsyncSocket *)self closeWithError:v8];
  }
}

- (BOOL)connectWithAddress4:(id)a3 address6:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
  {
    double v26 = [MEMORY[0x263F08690] currentHandler];
    [v26 handleFailureInMethod:a2 object:self file:@"GCDAsyncSocket.m" lineNumber:2206 description:@"Must be dispatched on socketQueue"];
  }
  int v11 = (self->config >> 2) & 1;
  if (!v10) {
    int v11 = 0;
  }
  if (!v9) {
    int v11 = 1;
  }
  if (v11) {
    int v12 = 30;
  }
  else {
    int v12 = 2;
  }
  if (v11) {
    uint64_t v13 = 36;
  }
  else {
    uint64_t v13 = 32;
  }
  if (v11) {
    BOOL v14 = v10;
  }
  else {
    BOOL v14 = v9;
  }
  if (v11) {
    uint64_t v15 = 56;
  }
  else {
    uint64_t v15 = 48;
  }
  int v16 = socket(v12, 1, 0);
  *(_DWORD *)((char *)&self->super.isa + v13) = v16;
  id v17 = v14;
  id v18 = *(id *)((char *)&self->super.isa + v15);
  char v19 = v18;
  if (v16 == -1)
  {
    if (a5)
    {
      id v21 = @"Error in socket() function";
      goto LABEL_29;
    }
LABEL_30:
    BOOL v22 = 0;
    goto LABEL_31;
  }
  if (v18)
  {
    if ([(id)objc_opt_class() portFromAddress:v18])
    {
      LODWORD(location) = 1;
      setsockopt(v16, 0xFFFF, 4, &location, 4u);
    }
    id v20 = v19;
    if (bind(v16, (const sockaddr *)[v20 bytes], [v20 length]))
    {
      if (a5)
      {
        id v21 = @"Error in bind() function";
LABEL_29:
        [(_DT_GCDAsyncSocket *)self errnoErrorWithReason:v21];
        BOOL v22 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_31;
      }
      goto LABEL_30;
    }
  }
  BOOL v22 = 1;
  int v33 = 1;
  setsockopt(v16, 0xFFFF, 4130, &v33, 4u);
  fcntl(v16, 2, 0x1000000);
  int stateIndex = self->stateIndex;
  objc_initWeak(&location, self);
  id v24 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2308B744C;
  block[3] = &unk_264B8EE60;
  int v30 = v16;
  id v28 = v17;
  objc_copyWeak(&v29, &location);
  int v31 = stateIndex;
  dispatch_async(v24, block);
  objc_destroyWeak(&v29);

  objc_destroyWeak(&location);
LABEL_31:

  return v22;
}

- (void)didConnect:(int)a3
{
  if (!dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
  {
    uint64_t v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"GCDAsyncSocket.m" lineNumber:2331 description:@"Must be dispatched on socketQueue"];
  }
  if (self->stateIndex == a3)
  {
    self->flags |= 2u;
    [(_DT_GCDAsyncSocket *)self endConnectTimeout];
    int stateIndex = self->stateIndex;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_2308B7934;
    aBlock[3] = &unk_264B8D590;
    void aBlock[4] = self;
    id v7 = (void (**)(void))_Block_copy(aBlock);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = sub_2308B79E8;
    v22[3] = &unk_264B8D788;
    int v23 = stateIndex;
    v22[4] = self;
    id v8 = (void (**)(void))_Block_copy(v22);
    id v9 = [(_DT_GCDAsyncSocket *)self connectedHost];
    unsigned __int16 v10 = [(_DT_GCDAsyncSocket *)self connectedPort];
    id WeakRetained = objc_loadWeakRetained(&self->delegate);
    if (self->delegateQueue && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v7[2](v7);
      delegateQueue = self->delegateQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_2308B7AA8;
      block[3] = &unk_264B8EE88;
      id v17 = WeakRetained;
      id v18 = self;
      id v19 = v9;
      unsigned __int16 v21 = v10;
      id v20 = v8;
      dispatch_async(delegateQueue, block);
    }
    else
    {
      v7[2](v7);
      v8[2](v8);
    }
    uint64_t socket4FD = self->socket4FD;
    if (socket4FD == -1) {
      uint64_t socket4FD = self->socket6FD;
    }
    if (fcntl(socket4FD, 4, 4) == -1)
    {
      BOOL v14 = [(_DT_GCDAsyncSocket *)self otherError:@"Error enabling non-blocking IO on socket (fcntl)"];
      [(_DT_GCDAsyncSocket *)self closeWithError:v14];
    }
    else
    {
      [(_DT_GCDAsyncSocket *)self setupReadAndWriteSourcesForNewlyConnectedSocket:socket4FD];
      [(_DT_GCDAsyncSocket *)self maybeDequeueRead];
      [(_DT_GCDAsyncSocket *)self maybeDequeueWrite];
    }
  }
}

- (void)didNotConnect:(int)a3 error:(id)a4
{
  id v8 = a4;
  if (!dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
  {
    id v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"GCDAsyncSocket.m" lineNumber:2458 description:@"Must be dispatched on socketQueue"];
  }
  if (self->stateIndex == a3) {
    [(_DT_GCDAsyncSocket *)self closeWithError:v8];
  }
}

- (void)startConnectTimeout:(double)a3
{
  if (a3 >= 0.0)
  {
    location[1] = v6;
    location[2] = v5;
    location[7] = v3;
    location[8] = v4;
    id v9 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->socketQueue);
    connectTimer = self->connectTimer;
    self->connectTimer = v9;

    objc_initWeak(location, self);
    int v11 = self->connectTimer;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = sub_2308B7D84;
    v13[3] = &unk_264B8D760;
    objc_copyWeak(&v14, location);
    dispatch_source_set_event_handler(v11, v13);
    dispatch_time_t v12 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer((dispatch_source_t)self->connectTimer, v12, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)self->connectTimer);
    objc_destroyWeak(&v14);
    objc_destroyWeak(location);
  }
}

- (void)endConnectTimeout
{
  connectTimer = self->connectTimer;
  if (connectTimer)
  {
    dispatch_source_cancel(connectTimer);
    id v4 = self->connectTimer;
    self->connectTimer = 0;
  }
  ++self->stateIndex;
  connectInterface4 = self->connectInterface4;
  if (connectInterface4)
  {
    self->connectInterface4 = 0;
  }
  connectInterface6 = self->connectInterface6;
  if (connectInterface6)
  {
    self->connectInterface6 = 0;
  }
}

- (void)doConnectTimeout
{
  [(_DT_GCDAsyncSocket *)self endConnectTimeout];
  id v3 = [(_DT_GCDAsyncSocket *)self connectTimeoutError];
  [(_DT_GCDAsyncSocket *)self closeWithError:v3];
}

- (void)closeWithError:(id)a3
{
  id v5 = a3;
  if (!dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
  {
    uint64_t v25 = [MEMORY[0x263F08690] currentHandler];
    [v25 handleFailureInMethod:a2 object:self file:@"GCDAsyncSocket.m" lineNumber:2556 description:@"Must be dispatched on socketQueue"];
  }
  [(_DT_GCDAsyncSocket *)self endConnectTimeout];
  if (self->currentRead) {
    [(_DT_GCDAsyncSocket *)self endCurrentRead];
  }
  if (self->currentWrite) {
    [(_DT_GCDAsyncSocket *)self endCurrentWrite];
  }
  [(NSMutableArray *)self->readQueue removeAllObjects];
  [(NSMutableArray *)self->writeQueue removeAllObjects];
  [(_DT_GCDAsyncSocketPreBuffer *)self->preBuffer reset];
  if (self->readStream || self->writeStream)
  {
    [(_DT_GCDAsyncSocket *)self removeStreamsFromRunLoop];
    readStream = self->readStream;
    if (readStream)
    {
      CFReadStreamSetClient(readStream, 0, 0, 0);
      CFReadStreamClose(self->readStream);
      CFRelease(self->readStream);
      self->readStream = 0;
    }
    writeStream = self->writeStream;
    if (writeStream)
    {
      CFWriteStreamSetClient(writeStream, 0, 0, 0);
      CFWriteStreamClose(self->writeStream);
      CFRelease(self->writeStream);
      self->writeStream = 0;
    }
  }
  [(_DT_GCDAsyncSocketPreBuffer *)self->sslPreBuffer reset];
  self->sslErrCode = 0;
  sslContext = self->sslContext;
  if (sslContext)
  {
    SSLClose(sslContext);
    CFRelease(self->sslContext);
    self->sslContext = 0;
  }
  accept4Source = self->accept4Source;
  if (accept4Source)
  {
    dispatch_source_cancel(accept4Source);
    unsigned __int16 v10 = self->accept4Source;
    self->accept4Source = 0;

    accept6Source = self->accept6Source;
    if (!accept6Source) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  accept6Source = self->accept6Source;
  if (accept6Source)
  {
LABEL_19:
    dispatch_source_cancel(accept6Source);
    dispatch_time_t v12 = self->accept6Source;
    self->accept6Source = 0;

LABEL_20:
    readSource = self->readSource;
    if (readSource)
    {
      dispatch_source_cancel(readSource);
      [(_DT_GCDAsyncSocket *)self resumeReadSource];
      id v14 = self->readSource;
      self->readSource = 0;
    }
    writeSource = self->writeSource;
    if (writeSource)
    {
      dispatch_source_cancel(writeSource);
      [(_DT_GCDAsyncSocket *)self resumeWriteSource];
      int v16 = self->writeSource;
      self->writeSource = 0;
    }
    self->int socket4FD = -1;
    p_int socket6FD = &self->socket6FD;
    goto LABEL_25;
  }
  if (self->readSource || self->writeSource) {
    goto LABEL_20;
  }
  int socket4FD = self->socket4FD;
  if (socket4FD != -1)
  {
    close(socket4FD);
    self->int socket4FD = -1;
  }
  p_int socket6FD = &self->socket6FD;
  int socket6FD = self->socket6FD;
  if (socket6FD != -1)
  {
    close(socket6FD);
LABEL_25:
    int *p_socket6FD = -1;
  }
  unsigned int flags = self->flags;
  self->socketFDBytesAvailable = 0;
  self->unsigned int flags = 0;
  if (flags)
  {
    id WeakRetained = objc_loadWeakRetained(&self->delegate);
    if ((flags & 0x10000) != 0) {
      id v20 = 0;
    }
    else {
      id v20 = self;
    }
    unsigned __int16 v21 = v20;
    if (self->delegateQueue && (objc_opt_respondsToSelector() & 1) != 0)
    {
      delegateQueue = self->delegateQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_2308B81B4;
      block[3] = &unk_264B8EC88;
      id v27 = WeakRetained;
      id v28 = v21;
      id v29 = v5;
      dispatch_async(delegateQueue, block);
    }
  }
}

- (void)disconnect
{
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_2308B82A8;
  aBlock[3] = &unk_264B8D590;
  void aBlock[4] = self;
  id v3 = (void (**)(void))_Block_copy(aBlock);
  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey)) {
    v3[2](v3);
  }
  else {
    dispatch_sync((dispatch_queue_t)self->socketQueue, v3);
  }
}

- (void)disconnectAfterReading
{
  socketQueue = self->socketQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2308B836C;
  block[3] = &unk_264B8D590;
  void block[4] = self;
  dispatch_async(socketQueue, block);
}

- (void)disconnectAfterWriting
{
  socketQueue = self->socketQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2308B843C;
  block[3] = &unk_264B8D590;
  void block[4] = self;
  dispatch_async(socketQueue, block);
}

- (void)disconnectAfterReadingAndWriting
{
  socketQueue = self->socketQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2308B850C;
  block[3] = &unk_264B8D590;
  void block[4] = self;
  dispatch_async(socketQueue, block);
}

- (void)maybeClose
{
  if (!dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
  {
    id v5 = [MEMORY[0x263F08690] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"GCDAsyncSocket.m" lineNumber:2767 description:@"Must be dispatched on socketQueue"];
  }
  unsigned int flags = self->flags;
  if ((flags & 0x20) == 0)
  {
    if ((flags & 0x40) == 0) {
      return;
    }
LABEL_5:
    if ([(NSMutableArray *)self->writeQueue count] || self->currentWrite) {
      return;
    }
    goto LABEL_12;
  }
  if ([(NSMutableArray *)self->readQueue count] || self->currentRead) {
    return;
  }
  if ((self->flags & 0x40) != 0) {
    goto LABEL_5;
  }
LABEL_12:
  [(_DT_GCDAsyncSocket *)self closeWithError:0];
}

- (id)badConfigError:(id)a3
{
  id v3 = [NSDictionary dictionaryWithObject:a3 forKey:*MEMORY[0x263F08320]];
  id v4 = [MEMORY[0x263F087E8] errorWithDomain:@"GCDAsyncSocketErrorDomain" code:1 userInfo:v3];

  return v4;
}

- (id)badParamError:(id)a3
{
  id v3 = [NSDictionary dictionaryWithObject:a3 forKey:*MEMORY[0x263F08320]];
  id v4 = [MEMORY[0x263F087E8] errorWithDomain:@"GCDAsyncSocketErrorDomain" code:2 userInfo:v3];

  return v4;
}

+ (id)gaiError:(int)a3
{
  id v4 = [NSString stringWithCString:gai_strerror(a3) encoding:1];
  id v5 = [NSDictionary dictionaryWithObject:v4 forKey:*MEMORY[0x263F08320]];
  socklen_t v6 = [MEMORY[0x263F087E8] errorWithDomain:@"kCFStreamErrorDomainNetDB" code:a3 userInfo:v5];

  return v6;
}

- (id)errnoErrorWithReason:(id)a3
{
  id v3 = NSString;
  id v4 = a3;
  id v5 = __error();
  socklen_t v6 = [v3 stringWithUTF8String:strerror(*v5)];
  id v7 = @{v6:v4, *MEMORY[0x263F08320]:*MEMORY[0x263F08338]};

  id v8 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:v7];

  return v8;
}

- (id)errnoError
{
  v2 = NSString;
  id v3 = __error();
  id v4 = [v2 stringWithUTF8String:strerror(*v3)];
  id v5 = [NSDictionary dictionaryWithObject:v4 forKey:*MEMORY[0x263F08320]];
  socklen_t v6 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:v5];

  return v6;
}

- (id)sslError:(int)a3
{
  id v4 = [NSDictionary dictionaryWithObject:@"Error code definition can be found in Apple's SecureTransport.h" forKey:*MEMORY[0x263F08348]];
  id v5 = [MEMORY[0x263F087E8] errorWithDomain:@"kCFStreamErrorDomainSSL" code:a3 userInfo:v4];

  return v5;
}

- (id)connectTimeoutError
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v2 localizedStringForKey:@"GCDAsyncSocketConnectTimeoutError" value:@"Attempt to connect to host timed out" table:@"_DT_GCDAsyncSocket"];

  id v4 = [NSDictionary dictionaryWithObject:v3 forKey:*MEMORY[0x263F08320]];
  id v5 = [MEMORY[0x263F087E8] errorWithDomain:@"GCDAsyncSocketErrorDomain" code:3 userInfo:v4];

  return v5;
}

- (id)readMaxedOutError
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v2 localizedStringForKey:@"GCDAsyncSocketReadMaxedOutError" value:@"Read operation reached set maximum length" table:@"_DT_GCDAsyncSocket"];

  id v4 = [NSDictionary dictionaryWithObject:v3 forKey:*MEMORY[0x263F08320]];
  id v5 = [MEMORY[0x263F087E8] errorWithDomain:@"GCDAsyncSocketErrorDomain" code:6 userInfo:v4];

  return v5;
}

- (id)readTimeoutError
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v2 localizedStringForKey:@"GCDAsyncSocketReadTimeoutError" value:@"Read operation timed out" table:@"_DT_GCDAsyncSocket"];

  id v4 = [NSDictionary dictionaryWithObject:v3 forKey:*MEMORY[0x263F08320]];
  id v5 = [MEMORY[0x263F087E8] errorWithDomain:@"GCDAsyncSocketErrorDomain" code:4 userInfo:v4];

  return v5;
}

- (id)writeTimeoutError
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v2 localizedStringForKey:@"GCDAsyncSocketWriteTimeoutError" value:@"Write operation timed out" table:@"_DT_GCDAsyncSocket"];

  id v4 = [NSDictionary dictionaryWithObject:v3 forKey:*MEMORY[0x263F08320]];
  id v5 = [MEMORY[0x263F087E8] errorWithDomain:@"GCDAsyncSocketErrorDomain" code:5 userInfo:v4];

  return v5;
}

- (id)connectionClosedError
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v2 localizedStringForKey:@"GCDAsyncSocketClosedError" value:@"Socket closed by remote peer" table:@"_DT_GCDAsyncSocket"];

  id v4 = [NSDictionary dictionaryWithObject:v3 forKey:*MEMORY[0x263F08320]];
  id v5 = [MEMORY[0x263F087E8] errorWithDomain:@"GCDAsyncSocketErrorDomain" code:7 userInfo:v4];

  return v5;
}

- (id)otherError:(id)a3
{
  id v3 = [NSDictionary dictionaryWithObject:a3 forKey:*MEMORY[0x263F08320]];
  id v4 = [MEMORY[0x263F087E8] errorWithDomain:@"GCDAsyncSocketErrorDomain" code:8 userInfo:v3];

  return v4;
}

- (BOOL)isDisconnected
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_2308B8F54;
  v6[3] = &unk_264B8EC38;
  v6[4] = self;
  v6[5] = &v7;
  id v3 = (void (**)(void))_Block_copy(v6);
  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey)) {
    v3[2](v3);
  }
  else {
    dispatch_sync((dispatch_queue_t)self->socketQueue, v3);
  }
  char v4 = *((unsigned char *)v8 + 24);

  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)isConnected
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_2308B9064;
  v6[3] = &unk_264B8EC38;
  v6[4] = self;
  v6[5] = &v7;
  id v3 = (void (**)(void))_Block_copy(v6);
  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey)) {
    v3[2](v3);
  }
  else {
    dispatch_sync((dispatch_queue_t)self->socketQueue, v3);
  }
  char v4 = *((unsigned char *)v8 + 24);

  _Block_object_dispose(&v7, 8);
  return v4;
}

- (NSString)connectedHost
{
  if (!dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
  {
    uint64_t v8 = 0;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x3032000000;
    int v11 = sub_2308B4644;
    dispatch_time_t v12 = sub_2308B4654;
    id v13 = 0;
    socketQueue = self->socketQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = sub_2308B91BC;
    v7[3] = &unk_264B8DDD8;
    v7[4] = self;
    void v7[5] = &v8;
    dispatch_sync(socketQueue, v7);
    id v5 = (id)v9[5];
    _Block_object_dispose(&v8, 8);

    goto LABEL_8;
  }
  if (self->socket4FD != -1)
  {
    uint64_t v3 = -[_DT_GCDAsyncSocket connectedHostFromSocket4:](self, "connectedHostFromSocket4:");
LABEL_7:
    id v5 = (id)v3;
    goto LABEL_8;
  }
  if (self->socket6FD != -1)
  {
    uint64_t v3 = -[_DT_GCDAsyncSocket connectedHostFromSocket6:](self, "connectedHostFromSocket6:");
    goto LABEL_7;
  }
  id v5 = 0;
LABEL_8:
  return (NSString *)v5;
}

- (unsigned)connectedPort
{
  if (!dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
  {
    uint64_t v7 = 0;
    uint64_t v8 = &v7;
    uint64_t v9 = 0x2020000000;
    __int16 v10 = 0;
    socketQueue = self->socketQueue;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = sub_2308B935C;
    v6[3] = &unk_264B8DDD8;
    v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(socketQueue, v6);
    unsigned __int16 v5 = *((_WORD *)v8 + 12);
    _Block_object_dispose(&v7, 8);
    return v5;
  }
  if (self->socket4FD != -1)
  {
    return -[_DT_GCDAsyncSocket connectedPortFromSocket4:](self, "connectedPortFromSocket4:");
  }
  if (self->socket6FD == -1) {
    return 0;
  }
  return -[_DT_GCDAsyncSocket connectedPortFromSocket6:](self, "connectedPortFromSocket6:");
}

- (NSString)localHost
{
  if (!dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
  {
    uint64_t v8 = 0;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x3032000000;
    int v11 = sub_2308B4644;
    dispatch_time_t v12 = sub_2308B4654;
    id v13 = 0;
    socketQueue = self->socketQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = sub_2308B94F0;
    v7[3] = &unk_264B8DDD8;
    v7[4] = self;
    void v7[5] = &v8;
    dispatch_sync(socketQueue, v7);
    id v5 = (id)v9[5];
    _Block_object_dispose(&v8, 8);

    goto LABEL_8;
  }
  if (self->socket4FD != -1)
  {
    uint64_t v3 = -[_DT_GCDAsyncSocket localHostFromSocket4:](self, "localHostFromSocket4:");
LABEL_7:
    id v5 = (id)v3;
    goto LABEL_8;
  }
  if (self->socket6FD != -1)
  {
    uint64_t v3 = -[_DT_GCDAsyncSocket localHostFromSocket6:](self, "localHostFromSocket6:");
    goto LABEL_7;
  }
  id v5 = 0;
LABEL_8:
  return (NSString *)v5;
}

- (unsigned)localPort
{
  if (!dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
  {
    uint64_t v7 = 0;
    uint64_t v8 = &v7;
    uint64_t v9 = 0x2020000000;
    __int16 v10 = 0;
    socketQueue = self->socketQueue;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = sub_2308B9690;
    v6[3] = &unk_264B8DDD8;
    v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(socketQueue, v6);
    unsigned __int16 v5 = *((_WORD *)v8 + 12);
    _Block_object_dispose(&v7, 8);
    return v5;
  }
  if (self->socket4FD != -1)
  {
    return -[_DT_GCDAsyncSocket localPortFromSocket4:](self, "localPortFromSocket4:");
  }
  if (self->socket6FD == -1) {
    return 0;
  }
  return -[_DT_GCDAsyncSocket localPortFromSocket6:](self, "localPortFromSocket6:");
}

- (id)connectedHost4
{
  if (self->socket4FD == -1)
  {
    v2 = 0;
  }
  else
  {
    v2 = -[_DT_GCDAsyncSocket connectedHostFromSocket4:](self, "connectedHostFromSocket4:");
  }
  return v2;
}

- (id)connectedHost6
{
  if (self->socket6FD == -1)
  {
    v2 = 0;
  }
  else
  {
    v2 = -[_DT_GCDAsyncSocket connectedHostFromSocket6:](self, "connectedHostFromSocket6:");
  }
  return v2;
}

- (unsigned)connectedPort4
{
  if (self->socket4FD == -1) {
    return 0;
  }
  else {
    return -[_DT_GCDAsyncSocket connectedPortFromSocket4:](self, "connectedPortFromSocket4:");
  }
}

- (unsigned)connectedPort6
{
  if (self->socket6FD == -1) {
    return 0;
  }
  else {
    return -[_DT_GCDAsyncSocket connectedPortFromSocket6:](self, "connectedPortFromSocket6:");
  }
}

- (id)localHost4
{
  if (self->socket4FD == -1)
  {
    v2 = 0;
  }
  else
  {
    v2 = -[_DT_GCDAsyncSocket localHostFromSocket4:](self, "localHostFromSocket4:");
  }
  return v2;
}

- (id)localHost6
{
  if (self->socket6FD == -1)
  {
    v2 = 0;
  }
  else
  {
    v2 = -[_DT_GCDAsyncSocket localHostFromSocket6:](self, "localHostFromSocket6:");
  }
  return v2;
}

- (unsigned)localPort4
{
  if (self->socket4FD == -1) {
    return 0;
  }
  else {
    return -[_DT_GCDAsyncSocket localPortFromSocket4:](self, "localPortFromSocket4:");
  }
}

- (unsigned)localPort6
{
  if (self->socket6FD == -1) {
    return 0;
  }
  else {
    return -[_DT_GCDAsyncSocket localPortFromSocket6:](self, "localPortFromSocket6:");
  }
}

- (id)connectedHostFromSocket4:(int)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  *(void *)&v6.sa_len = 0;
  *(void *)&v6.sa_data[6] = 0;
  socklen_t v5 = 16;
  if (getpeername(a3, &v6, &v5) < 0)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = [(id)objc_opt_class() hostFromSockaddr4:&v6];
  }
  return v3;
}

- (id)connectedHostFromSocket6:(int)a3
{
  *(void *)&v6.sa_len = 0;
  *(void *)&v6.sa_data[6] = 0;
  int v8 = 0;
  uint64_t v7 = 0;
  socklen_t v5 = 28;
  if (getpeername(a3, &v6, &v5) < 0)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = [(id)objc_opt_class() hostFromSockaddr6:&v6];
  }
  return v3;
}

- (unsigned)connectedPortFromSocket4:(int)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  *(void *)&v5.sa_len = 0;
  *(void *)&v5.sa_data[6] = 0;
  socklen_t v4 = 16;
  if (getpeername(a3, &v5, &v4) < 0) {
    return 0;
  }
  else {
    return [(id)objc_opt_class() portFromSockaddr4:&v5];
  }
}

- (unsigned)connectedPortFromSocket6:(int)a3
{
  *(void *)&v5.sa_len = 0;
  *(void *)&v5.sa_data[6] = 0;
  int v7 = 0;
  uint64_t v6 = 0;
  socklen_t v4 = 28;
  if (getpeername(a3, &v5, &v4) < 0) {
    return 0;
  }
  else {
    return [(id)objc_opt_class() portFromSockaddr6:&v5];
  }
}

- (id)localHostFromSocket4:(int)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  *(void *)&v6.sa_len = 0;
  *(void *)&v6.sa_data[6] = 0;
  socklen_t v5 = 16;
  if (getsockname(a3, &v6, &v5) < 0)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = [(id)objc_opt_class() hostFromSockaddr4:&v6];
  }
  return v3;
}

- (id)localHostFromSocket6:(int)a3
{
  *(void *)&v6.sa_len = 0;
  *(void *)&v6.sa_data[6] = 0;
  int v8 = 0;
  uint64_t v7 = 0;
  socklen_t v5 = 28;
  if (getsockname(a3, &v6, &v5) < 0)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = [(id)objc_opt_class() hostFromSockaddr6:&v6];
  }
  return v3;
}

- (unsigned)localPortFromSocket4:(int)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  *(void *)&v5.sa_len = 0;
  *(void *)&v5.sa_data[6] = 0;
  socklen_t v4 = 16;
  if (getsockname(a3, &v5, &v4) < 0) {
    return 0;
  }
  else {
    return [(id)objc_opt_class() portFromSockaddr4:&v5];
  }
}

- (unsigned)localPortFromSocket6:(int)a3
{
  *(void *)&v5.sa_len = 0;
  *(void *)&v5.sa_data[6] = 0;
  int v7 = 0;
  uint64_t v6 = 0;
  socklen_t v4 = 28;
  if (getsockname(a3, &v5, &v4) < 0) {
    return 0;
  }
  else {
    return [(id)objc_opt_class() portFromSockaddr6:&v5];
  }
}

- (NSData)connectedAddress
{
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x3032000000;
  __int16 v10 = sub_2308B4644;
  int v11 = sub_2308B4654;
  id v12 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_2308B9DBC;
  v6[3] = &unk_264B8DDD8;
  v6[4] = self;
  v6[5] = &v7;
  uint64_t v3 = (void (**)(void))_Block_copy(v6);
  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey)) {
    v3[2](v3);
  }
  else {
    dispatch_sync((dispatch_queue_t)self->socketQueue, v3);
  }
  id v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  return (NSData *)v4;
}

- (NSData)localAddress
{
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x3032000000;
  __int16 v10 = sub_2308B4644;
  int v11 = sub_2308B4654;
  id v12 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_2308BA000;
  v6[3] = &unk_264B8DDD8;
  v6[4] = self;
  v6[5] = &v7;
  uint64_t v3 = (void (**)(void))_Block_copy(v6);
  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey)) {
    v3[2](v3);
  }
  else {
    dispatch_sync((dispatch_queue_t)self->socketQueue, v3);
  }
  id v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  return (NSData *)v4;
}

- (BOOL)isIPv4
{
  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey)) {
    return self->socket4FD != -1;
  }
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  socketQueue = self->socketQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_2308BA1DC;
  v6[3] = &unk_264B8EC38;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(socketQueue, v6);
  BOOL v3 = *((unsigned char *)v8 + 24) != 0;
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (BOOL)isIPv6
{
  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey)) {
    return self->socket6FD != -1;
  }
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  socketQueue = self->socketQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_2308BA2C8;
  v6[3] = &unk_264B8EC38;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(socketQueue, v6);
  BOOL v3 = *((unsigned char *)v8 + 24) != 0;
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (BOOL)isSecure
{
  v2 = self;
  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
  {
    LODWORD(v2) = (BYTE1(v2->flags) >> 5) & 1;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = &v6;
    uint64_t v8 = 0x2020000000;
    char v9 = 0;
    socketQueue = v2->socketQueue;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = sub_2308BA3B0;
    v5[3] = &unk_264B8EC38;
    v5[4] = v2;
    void v5[5] = &v6;
    dispatch_sync(socketQueue, v5);
    LOBYTE(v2) = *((unsigned char *)v7 + 24) != 0;
    _Block_object_dispose(&v6, 8);
  }
  return (char)v2;
}

- (void)getInterfaceAddress4:(id *)a3 address6:(id *)a4 fromDescription:(id)a5 port:(unsigned __int16)a6
{
  unsigned int v6 = a6;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v9 = a5;
  char v10 = [v9 componentsSeparatedByString:@":"];
  if ([v10 count])
  {
    int v11 = [v10 objectAtIndex:0];
    if ([v11 length]) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }
  unint64_t v13 = [v10 count];
  if (!v6 && v13 >= 2)
  {
    id v14 = [v10 objectAtIndex:1];
    uint64_t v15 = strtol((const char *)[v14 UTF8String], 0, 10);

    if ((unint64_t)(v15 - 1) >= 0xFFFF) {
      unsigned int v6 = 0;
    }
    else {
      unsigned int v6 = v15;
    }
  }
  if (!v12)
  {
    *(void *)&__s1[8] = 0;
    *(_WORD *)__s1 = 528;
    *(_WORD *)&__s1[2] = bswap32(v6) >> 16;
    *(_DWORD *)&__s1[4] = 0;
    memset((char *)v27 + 4, 0, 24);
    LOWORD(v27[0]) = 7708;
    WORD1(v27[0]) = *(_WORD *)&__s1[2];
    int v16 = (_OWORD *)MEMORY[0x263EF88F0];
    goto LABEL_17;
  }
  if (([v12 isEqualToString:@"localhost"] & 1) != 0
    || [v12 isEqualToString:@"loopback"])
  {
    *(void *)&__s1[8] = 0;
    *(_WORD *)__s1 = 528;
    *(_WORD *)&__s1[2] = bswap32(v6) >> 16;
    *(_DWORD *)&__s1[4] = 16777343;
    memset((char *)v27 + 4, 0, 24);
    LOWORD(v27[0]) = 7708;
    WORD1(v27[0]) = *(_WORD *)&__s1[2];
    int v16 = (_OWORD *)MEMORY[0x263EF88F8];
LABEL_17:
    *(_OWORD *)((char *)v27 + 8) = *v16;
    id v17 = [MEMORY[0x263EFF990] dataWithBytes:__s1 length:16];
    id v18 = [MEMORY[0x263EFF990] dataWithBytes:v27 length:28];
    goto LABEL_18;
  }
  id v19 = (const char *)[v12 UTF8String];
  double v26 = 0;
  id v18 = 0;
  id v17 = 0;
  if (!getifaddrs(&v26))
  {
    id v20 = v26;
    if (v26)
    {
      id v17 = 0;
      id v18 = 0;
      unsigned int v21 = bswap32(v6) >> 16;
      do
      {
        if (v17 || (BOOL v22 = v20->ifa_addr, v22->sa_family != 2))
        {
          if (!v18)
          {
            if (v20->ifa_addr->sa_family == 30
              && ((memset(__s1, 0, 28),
                   ifa_addr = v20->ifa_addr,
                   long long v24 = *(_OWORD *)&ifa_addr->sa_data[10],
                   *(sockaddr *)__s1 = *ifa_addr,
                   *(_OWORD *)&__s1[12] = v24,
                   !strcmp(v20->ifa_name, v19))
               || inet_ntop(30, &__s1[8], (char *)v27, 0x2Eu) && !strcmp((const char *)v27, v19)))
            {
              *(_WORD *)&__s1[2] = v21;
              id v18 = [MEMORY[0x263EFF990] dataWithBytes:__s1 length:28];
            }
            else
            {
              id v18 = 0;
            }
          }
        }
        else
        {
          v27[0] = 0uLL;
          v27[0] = *v22;
          if (!strcmp(v20->ifa_name, v19) || inet_ntop(2, (char *)v27 + 4, __s1, 0x10u) && !strcmp(__s1, v19))
          {
            WORD1(v27[0]) = v21;
            id v17 = [MEMORY[0x263EFF990] dataWithBytes:v27 length:16];
          }
          else
          {
            id v17 = 0;
          }
        }
        id v20 = v20->ifa_next;
      }
      while (v20);
      uint64_t v25 = v26;
    }
    else
    {
      uint64_t v25 = 0;
      id v18 = 0;
      id v17 = 0;
    }
    MEMORY[0x230FC16E0](v25);
  }
LABEL_18:
  if (a3) {
    *a3 = v17;
  }
  if (a4) {
    *a4 = v18;
  }
}

- (void)setupReadAndWriteSourcesForNewlyConnectedSocket:(int)a3
{
  uintptr_t v5 = a3;
  unsigned int v6 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF83E8], a3, 0, (dispatch_queue_t)self->socketQueue);
  readSource = self->readSource;
  self->readSource = v6;

  uint64_t v8 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8418], v5, 0, (dispatch_queue_t)self->socketQueue);
  writeSource = self->writeSource;
  self->writeSource = v8;

  objc_initWeak(&location, self);
  char v10 = self->readSource;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = sub_2308BAA00;
  handler[3] = &unk_264B8D760;
  objc_copyWeak(&v23, &location);
  dispatch_source_set_event_handler(v10, handler);
  int v11 = self->writeSource;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = sub_2308BAA74;
  v20[3] = &unk_264B8D760;
  objc_copyWeak(&v21, &location);
  dispatch_source_set_event_handler(v11, v20);
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  int v19 = 2;
  id v12 = self->readSource;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_2308BAAD8;
  v16[3] = &unk_264B8EEB0;
  v16[4] = v18;
  int v17 = a3;
  dispatch_source_set_cancel_handler(v12, v16);
  unint64_t v13 = self->writeSource;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_2308BAAFC;
  v14[3] = &unk_264B8EEB0;
  v14[4] = v18;
  int v15 = a3;
  dispatch_source_set_cancel_handler(v13, v14);
  self->socketFDBytesAvailable = 0;
  self->flags &= ~0x100u;
  dispatch_resume((dispatch_object_t)self->readSource);
  self->flags |= 0x280u;
  _Block_object_dispose(v18, 8);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

- (BOOL)usingCFStreamForTLS
{
  return (~self->flags & 0x42000) == 0;
}

- (BOOL)usingSecureTransportForTLS
{
  return (~self->flags & 0x42000) != 0;
}

- (void)suspendReadSource
{
  if ((self->flags & 0x100) == 0)
  {
    dispatch_suspend((dispatch_object_t)self->readSource);
    self->flags |= 0x100u;
  }
}

- (void)resumeReadSource
{
  if ((self->flags & 0x100) != 0)
  {
    dispatch_resume((dispatch_object_t)self->readSource);
    self->flags &= ~0x100u;
  }
}

- (void)suspendWriteSource
{
  if ((self->flags & 0x200) == 0)
  {
    dispatch_suspend((dispatch_object_t)self->writeSource);
    self->flags |= 0x200u;
  }
}

- (void)resumeWriteSource
{
  if ((self->flags & 0x200) != 0)
  {
    dispatch_resume((dispatch_object_t)self->writeSource);
    self->flags &= ~0x200u;
  }
}

- (void)readDataWithTimeout:(double)a3 tag:(int64_t)a4
{
}

- (void)readDataWithTimeout:(double)a3 buffer:(id)a4 bufferOffset:(unint64_t)a5 tag:(int64_t)a6
{
}

- (void)readDataWithTimeout:(double)a3 buffer:(id)a4 bufferOffset:(unint64_t)a5 maxLength:(unint64_t)a6 tag:(int64_t)a7
{
  id v12 = a4;
  if ([v12 length] >= a5)
  {
    unint64_t v13 = [[_DT_GCDAsyncReadPacket alloc] initWithData:v12 startOffset:a5 maxLength:a6 timeout:0 readLength:0 terminator:a7 tag:a3];
    socketQueue = self->socketQueue;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = sub_2308BAD60;
    v16[3] = &unk_264B8DA70;
    v16[4] = self;
    int v17 = v13;
    int v15 = v13;
    dispatch_async(socketQueue, v16);
  }
}

- (void)readDataToLength:(unint64_t)a3 withTimeout:(double)a4 tag:(int64_t)a5
{
}

- (void)readDataToLength:(unint64_t)a3 withTimeout:(double)a4 buffer:(id)a5 bufferOffset:(unint64_t)a6 tag:(int64_t)a7
{
  id v12 = a5;
  unint64_t v13 = v12;
  if (a3 && [v12 length] >= a6)
  {
    id v14 = [[_DT_GCDAsyncReadPacket alloc] initWithData:v13 startOffset:a6 maxLength:0 timeout:a3 readLength:0 terminator:a7 tag:a4];
    socketQueue = self->socketQueue;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = sub_2308BAEE0;
    v17[3] = &unk_264B8DA70;
    v17[4] = self;
    id v18 = v14;
    int v16 = v14;
    dispatch_async(socketQueue, v17);
  }
}

- (void)readDataToData:(id)a3 withTimeout:(double)a4 tag:(int64_t)a5
{
}

- (void)readDataToData:(id)a3 withTimeout:(double)a4 buffer:(id)a5 bufferOffset:(unint64_t)a6 tag:(int64_t)a7
{
}

- (void)readDataToData:(id)a3 withTimeout:(double)a4 maxLength:(unint64_t)a5 tag:(int64_t)a6
{
}

- (void)readDataToData:(id)a3 withTimeout:(double)a4 buffer:(id)a5 bufferOffset:(unint64_t)a6 maxLength:(unint64_t)a7 tag:(int64_t)a8
{
  id v14 = a3;
  id v15 = a5;
  if ([v14 length] && [v15 length] >= a6 && (!a7 || [v14 length] <= a7))
  {
    int v16 = [[_DT_GCDAsyncReadPacket alloc] initWithData:v15 startOffset:a6 maxLength:a7 timeout:0 readLength:v14 terminator:a8 tag:a4];
    socketQueue = self->socketQueue;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = sub_2308BB0B0;
    v19[3] = &unk_264B8DA70;
    v19[4] = self;
    id v20 = v16;
    id v18 = v16;
    dispatch_async(socketQueue, v19);
  }
}

- (float)progressOfReadReturningTag:(int64_t *)a3 bytesDone:(unint64_t *)a4 total:(unint64_t *)a5
{
  uint64_t v10 = 0;
  int v11 = (float *)&v10;
  uint64_t v12 = 0x2020000000;
  int v13 = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_2308BB21C;
  aBlock[3] = &unk_264B8EED8;
  void aBlock[6] = a3;
  aBlock[7] = a4;
  aBlock[8] = a5;
  void aBlock[4] = self;
  void aBlock[5] = &v10;
  unsigned int v6 = (void (**)(void))_Block_copy(aBlock);
  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey)) {
    v6[2](v6);
  }
  else {
    dispatch_sync((dispatch_queue_t)self->socketQueue, v6);
  }
  float v7 = v11[6];

  _Block_object_dispose(&v10, 8);
  return v7;
}

- (void)maybeDequeueRead
{
  if (!dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
  {
    float v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"GCDAsyncSocket.m" lineNumber:3927 description:@"Must be dispatched on socketQueue"];
  }
  if (!self->currentRead && (self->flags & 2) != 0)
  {
    if ([(NSMutableArray *)self->readQueue count])
    {
      id v4 = [(NSMutableArray *)self->readQueue objectAtIndex:0];
      currentRead = self->currentRead;
      self->currentRead = v4;

      [(NSMutableArray *)self->readQueue removeObjectAtIndex:0];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        self->flags |= 0x800u;
        MEMORY[0x270F9A6D0](self, sel_maybeStartTLS);
      }
      else
      {
        [(_DT_GCDAsyncSocket *)self setupReadTimerWithTimeout:self->currentRead->timeout];
        [(_DT_GCDAsyncSocket *)self doReadData];
      }
    }
    else
    {
      unsigned int flags = self->flags;
      if ((flags & 0x20) != 0)
      {
        if ((flags & 0x40) == 0 || ![(NSMutableArray *)self->writeQueue count] && !self->currentWrite)
        {
          [(_DT_GCDAsyncSocket *)self closeWithError:0];
        }
      }
      else if ((flags & 0x2000) != 0)
      {
        [(_DT_GCDAsyncSocket *)self flushSSLBuffers];
        if (![(_DT_GCDAsyncSocketPreBuffer *)self->preBuffer availableBytes]
          && ![(_DT_GCDAsyncSocket *)self usingCFStreamForTLS])
        {
          [(_DT_GCDAsyncSocket *)self resumeReadSource];
        }
      }
    }
  }
}

- (void)flushSSLBuffers
{
  if ((self->flags & 0x2000) == 0)
  {
    uint64_t v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"GCDAsyncSocket.m" lineNumber:4005 description:@"Cannot flush ssl buffers on non-secure socket"];
  }
  if (![(_DT_GCDAsyncSocketPreBuffer *)self->preBuffer availableBytes])
  {
    if ([(_DT_GCDAsyncSocket *)self usingCFStreamForTLS])
    {
      if ((self->flags & 0x80000) != 0 && CFReadStreamHasBytesAvailable(self->readStream))
      {
        [(_DT_GCDAsyncSocketPreBuffer *)self->preBuffer ensureCapacityForWrite:4096];
        CFIndex v3 = CFReadStreamRead(self->readStream, (UInt8 *)[(_DT_GCDAsyncSocketPreBuffer *)self->preBuffer writeBuffer], 4096);
        if (v3 >= 1) {
          [(_DT_GCDAsyncSocketPreBuffer *)self->preBuffer didWrite:v3];
        }
        self->flags &= ~0x80000u;
      }
    }
    else
    {
      uint64_t v11 = 0;
      uint64_t v12 = &v11;
      uint64_t v13 = 0x2020000000;
      uint64_t v14 = 0;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = sub_2308BB6B8;
      aBlock[3] = &unk_264B8EC38;
      void aBlock[4] = self;
      void aBlock[5] = &v11;
      id v4 = (void (**)(void))_Block_copy(aBlock);
      v4[2]();
      while (v12[3])
      {
        -[_DT_GCDAsyncSocketPreBuffer ensureCapacityForWrite:](self->preBuffer, "ensureCapacityForWrite:");
        uintptr_t v5 = [(_DT_GCDAsyncSocketPreBuffer *)self->preBuffer writeBuffer];
        size_t processed = 0;
        OSStatus v6 = SSLRead(self->sslContext, v5, v12[3], &processed);
        if (processed) {
          -[_DT_GCDAsyncSocketPreBuffer didWrite:](self->preBuffer, "didWrite:");
        }
        if (v6) {
          break;
        }
        ((void (*)(void (**)(void)))v4[2])(v4);
      }

      _Block_object_dispose(&v11, 8);
    }
  }
}

- (void)doReadData
{
  if (self->currentRead) {
    BOOL v3 = (self->flags & 8) == 0;
  }
  else {
    BOOL v3 = 0;
  }
  if (!v3)
  {
    if ((self->flags & 0x2000) != 0) {
      [(_DT_GCDAsyncSocket *)self flushSSLBuffers];
    }
    if (![(_DT_GCDAsyncSocket *)self usingCFStreamForTLS] && self->socketFDBytesAvailable)
    {
      [(_DT_GCDAsyncSocket *)self suspendReadSource];
    }
    return;
  }
  if ([(_DT_GCDAsyncSocket *)self usingCFStreamForTLS])
  {
    if ((self->flags & 0x80000) != 0 && CFReadStreamHasBytesAvailable(self->readStream))
    {
      unint64_t socketFDBytesAvailable = 0;
LABEL_19:
      int v7 = 1;
      goto LABEL_22;
    }
  }
  else
  {
    unint64_t socketFDBytesAvailable = self->socketFDBytesAvailable;
    if ((self->flags & 0x2000) != 0)
    {
      unint64_t v6 = [(_DT_GCDAsyncSocketPreBuffer *)self->sslPreBuffer availableBytes];
      size_t bufferSize = 0;
      SSLGetBufferedReadSize(self->sslContext, &bufferSize);
      socketFDBytesAvailable += v6 + bufferSize;
    }
    if (socketFDBytesAvailable) {
      goto LABEL_19;
    }
  }
  if (![(_DT_GCDAsyncSocketPreBuffer *)self->preBuffer availableBytes])
  {
LABEL_137:
    if (![(_DT_GCDAsyncSocket *)self usingCFStreamForTLS]) {
      [(_DT_GCDAsyncSocket *)self resumeReadSource];
    }
    return;
  }
  int v7 = 0;
  unint64_t socketFDBytesAvailable = 0;
LABEL_22:
  unsigned int flags = self->flags;
  if ((flags & 0x800) == 0)
  {
    BOOL v61 = 0;
    if ([(_DT_GCDAsyncSocketPreBuffer *)self->preBuffer availableBytes])
    {
      currentRead = self->currentRead;
      if (currentRead->term) {
        uint64_t v10 = [(_DT_GCDAsyncReadPacket *)self->currentRead readLengthForTermWithPreBuffer:self->preBuffer found:&v61];
      }
      else {
        uint64_t v10 = [(_DT_GCDAsyncReadPacket *)currentRead readLengthForNonTermWithHint:[(_DT_GCDAsyncSocketPreBuffer *)self->preBuffer availableBytes]];
      }
      size_t v11 = v10;
      [(_DT_GCDAsyncReadPacket *)self->currentRead ensureCapacityForAdditionalDataOfLength:v10];
      memcpy([(NSMutableData *)self->currentRead->buffer mutableBytes]+ self->currentRead->startOffset+ self->currentRead->bytesDone, [(_DT_GCDAsyncSocketPreBuffer *)self->preBuffer readBuffer], v11);
      [(_DT_GCDAsyncSocketPreBuffer *)self->preBuffer didRead:v11];
      self->currentRead->bytesDone += v11;
      uint64_t v13 = self->currentRead;
      unint64_t readLength = v13->readLength;
      if (readLength)
      {
        uint64_t v12 = 0;
        BOOL v15 = v13->bytesDone == readLength;
LABEL_36:
        BOOL v61 = v15;
        goto LABEL_37;
      }
      if (!v13->term)
      {
        unint64_t maxLength = v13->maxLength;
        if (maxLength) {
          BOOL v15 = v13->bytesDone == maxLength;
        }
        else {
          BOOL v15 = 0;
        }
        uint64_t v12 = 0;
        goto LABEL_36;
      }
      if (!v61)
      {
        unint64_t v22 = v13->maxLength;
        if (v22)
        {
          if (v13->bytesDone >= v22)
          {
            uint64_t v12 = [(_DT_GCDAsyncSocket *)self readMaxedOutError];
            goto LABEL_37;
          }
        }
      }
    }
    else
    {
      size_t v11 = 0;
    }
    uint64_t v12 = 0;
LABEL_37:
    unsigned int v16 = self->flags & 0x4000;
    if (v61 || v12)
    {
      int v18 = 0;
      BOOL v19 = v16 != 0;
      if (v61) {
        goto LABEL_130;
      }
    }
    else
    {
      int v17 = v7 ^ 1;
      if (v16) {
        int v18 = 0;
      }
      else {
        int v18 = v7 ^ 1;
      }
      BOOL v19 = v16 != 0;
      if (v16)
      {
        uint64_t v12 = 0;
        int v18 = 0;
      }
      else
      {
        if (v7)
        {
          if ([(_DT_GCDAsyncSocketPreBuffer *)self->preBuffer availableBytes])
          {
            v50 = [MEMORY[0x263F08690] currentHandler];
            [v50 handleFailureInMethod:a2 object:self file:@"GCDAsyncSocket.m" lineNumber:4371 description:@"Invalid logic"];
          }
          char v60 = 0;
          if ((self->flags & 0x2000) != 0)
          {
            if ([(_DT_GCDAsyncSocket *)self usingCFStreamForTLS])
            {
              CFIndex v24 = [(_DT_GCDAsyncReadPacket *)self->currentRead optimalReadLengthWithDefault:0x8000 shouldPreBuffer:&v60];
              if (v60)
              {
                [(_DT_GCDAsyncSocketPreBuffer *)self->preBuffer ensureCapacityForWrite:v24];
                uint64_t v25 = [(_DT_GCDAsyncSocketPreBuffer *)self->preBuffer writeBuffer];
              }
              else
              {
                [(_DT_GCDAsyncReadPacket *)self->currentRead ensureCapacityForAdditionalDataOfLength:v24];
                uint64_t v25 = (char *)([(NSMutableData *)self->currentRead->buffer mutableBytes]
                             + self->currentRead->startOffset
                             + self->currentRead->bytesDone);
              }
              CFIndex v35 = CFReadStreamRead(self->readStream, (UInt8 *)v25, v24);
              if (v35 < 0)
              {
                BOOL v19 = 0;
                uint64_t v12 = CFReadStreamCopyError(self->readStream);
                size_t v31 = 0;
                int v18 = 0;
              }
              else
              {
                size_t v31 = v35;
                uint64_t v12 = 0;
                if (v35) {
                  int v18 = 1;
                }
                else {
                  int v18 = v17;
                }
                BOOL v19 = v35 == 0;
              }
              self->flags &= ~0x80000u;
            }
            else
            {
              if (socketFDBytesAvailable <= 0x8000) {
                uint64_t v26 = 0x8000;
              }
              else {
                uint64_t v26 = socketFDBytesAvailable + 0x4000;
              }
              unint64_t v27 = [(_DT_GCDAsyncReadPacket *)self->currentRead optimalReadLengthWithDefault:v26 shouldPreBuffer:&v60];
              if (v60)
              {
                [(_DT_GCDAsyncSocketPreBuffer *)self->preBuffer ensureCapacityForWrite:v27];
                uint64_t v25 = [(_DT_GCDAsyncSocketPreBuffer *)self->preBuffer writeBuffer];
              }
              else
              {
                [(_DT_GCDAsyncReadPacket *)self->currentRead ensureCapacityForAdditionalDataOfLength:v27];
                uint64_t v25 = (char *)([(NSMutableData *)self->currentRead->buffer mutableBytes]
                             + self->currentRead->startOffset
                             + self->currentRead->bytesDone);
              }
              size_t v31 = 0;
              do
              {
                size_t bufferSize = 0;
                uint64_t v36 = SSLRead(self->sslContext, &v25[v31], v27 - v31, &bufferSize);
                v31 += bufferSize;
                if (v36) {
                  BOOL v37 = 1;
                }
                else {
                  BOOL v37 = v31 >= v27;
                }
              }
              while (!v37);
              uint64_t v12 = 0;
              BOOL v19 = 0;
              if (v36 == -9803)
              {
                int v18 = 1;
              }
              else if (v36)
              {
                if (v36 >> 1 == 2147478745)
                {
                  uint64_t v12 = 0;
                  self->sslErrCode = v36;
                  BOOL v19 = 1;
                }
                else
                {
                  uint64_t v12 = [(_DT_GCDAsyncSocket *)self sslError:v36];
                }
              }
            }
            if (!v31)
            {
LABEL_117:
              if (v61) {
                goto LABEL_130;
              }
              goto LABEL_118;
            }
          }
          else
          {
            id v20 = self->currentRead;
            if (v20->term) {
              uint64_t v21 = [(_DT_GCDAsyncReadPacket *)v20 readLengthForTermWithHint:socketFDBytesAvailable shouldPreBuffer:&v60];
            }
            else {
              uint64_t v21 = [(_DT_GCDAsyncReadPacket *)v20 readLengthForNonTermWithHint:socketFDBytesAvailable];
            }
            size_t v28 = v21;
            if (v60)
            {
              [(_DT_GCDAsyncSocketPreBuffer *)self->preBuffer ensureCapacityForWrite:v21];
              uint64_t v25 = [(_DT_GCDAsyncSocketPreBuffer *)self->preBuffer writeBuffer];
            }
            else
            {
              [(_DT_GCDAsyncReadPacket *)self->currentRead ensureCapacityForAdditionalDataOfLength:v21];
              uint64_t v25 = (char *)([(NSMutableData *)self->currentRead->buffer mutableBytes]
                           + self->currentRead->startOffset
                           + self->currentRead->bytesDone);
            }
            int socket4FD = self->socket4FD;
            if (socket4FD == -1) {
              int socket4FD = self->socket6FD;
            }
            unint64_t v30 = read(socket4FD, v25, v28);
            if ((v30 & 0x8000000000000000) != 0)
            {
              int v33 = *__error();
              int v18 = v33 == 35;
              if (v33 == 35)
              {
                uint64_t v12 = 0;
              }
              else
              {
                uint64_t v12 = [(_DT_GCDAsyncSocket *)self errnoErrorWithReason:@"Error in read() function"];
              }
              BOOL v19 = 0;
              self->unint64_t socketFDBytesAvailable = 0;
              goto LABEL_117;
            }
            size_t v31 = v30;
            if (!v30)
            {
              int v18 = 0;
              uint64_t v12 = 0;
              self->unint64_t socketFDBytesAvailable = 0;
              BOOL v19 = 1;
              goto LABEL_117;
            }
            if (v30 >= v28)
            {
              unint64_t v34 = self->socketFDBytesAvailable;
              BOOL v37 = v34 >= v30;
              unint64_t v32 = v34 - v30;
              if (!v37) {
                unint64_t v32 = 0;
              }
            }
            else
            {
              unint64_t v32 = 0;
            }
            uint64_t v12 = 0;
            BOOL v19 = 0;
            self->unint64_t socketFDBytesAvailable = v32;
            if (v32) {
              int v18 = v17;
            }
            else {
              int v18 = 1;
            }
          }
          char v38 = self->currentRead;
          if (v38->readLength)
          {
            if (v60)
            {
              v51 = [MEMORY[0x263F08690] currentHandler];
              [v51 handleFailureInMethod:a2 object:self file:@"GCDAsyncSocket.m" lineNumber:4645 description:@"Invalid logic"];

              char v38 = self->currentRead;
            }
            v38->bytesDone += v31;
            v11 += v31;
            BOOL v39 = self->currentRead->bytesDone == self->currentRead->readLength;
LABEL_116:
            BOOL v61 = v39;
            goto LABEL_117;
          }
          if (!v38->term)
          {
            if (v60)
            {
              [(_DT_GCDAsyncSocketPreBuffer *)self->preBuffer didWrite:v31];
              [(_DT_GCDAsyncReadPacket *)self->currentRead ensureCapacityForAdditionalDataOfLength:v31];
              memcpy([(NSMutableData *)self->currentRead->buffer mutableBytes]+ self->currentRead->startOffset+ self->currentRead->bytesDone, [(_DT_GCDAsyncSocketPreBuffer *)self->preBuffer readBuffer], v31);
              [(_DT_GCDAsyncSocketPreBuffer *)self->preBuffer didRead:v31];
              char v38 = self->currentRead;
            }
            v38->bytesDone += v31;
            v11 += v31;
            BOOL v39 = 1;
            goto LABEL_116;
          }
          if (v60)
          {
            [(_DT_GCDAsyncSocketPreBuffer *)self->preBuffer didWrite:v31];
            size_t v44 = [(_DT_GCDAsyncReadPacket *)self->currentRead readLengthForTermWithPreBuffer:self->preBuffer found:&v61];
            [(_DT_GCDAsyncReadPacket *)self->currentRead ensureCapacityForAdditionalDataOfLength:v44];
            memcpy([(NSMutableData *)self->currentRead->buffer mutableBytes]+ self->currentRead->startOffset+ self->currentRead->bytesDone, [(_DT_GCDAsyncSocketPreBuffer *)self->preBuffer readBuffer], v44);
            [(_DT_GCDAsyncSocketPreBuffer *)self->preBuffer didRead:v44];
            self->currentRead->bytesDone += v44;
            v11 += v44;
            if (v61) {
              goto LABEL_117;
            }
            goto LABEL_152;
          }
          uint64_t v45 = [(_DT_GCDAsyncReadPacket *)v38 searchForTermAfterPreBuffering:v31];
          if (v45)
          {
            size_t v46 = v45;
            if (v45 < 1)
            {
              self->currentRead->bytesDone += v31;
              BOOL v61 = 0;
              v11 += v31;
LABEL_152:
              v47 = self->currentRead;
              unint64_t v48 = v47->maxLength;
              if (v48 && v47->bytesDone >= v48)
              {
                uint64_t v49 = [(_DT_GCDAsyncSocket *)self readMaxedOutError];

                uint64_t v12 = (void *)v49;
              }
              goto LABEL_117;
            }
            v31 -= v45;
            [(_DT_GCDAsyncSocketPreBuffer *)self->preBuffer ensureCapacityForWrite:v45];
            memcpy([(_DT_GCDAsyncSocketPreBuffer *)self->preBuffer writeBuffer], &v25[v31], v46);
            [(_DT_GCDAsyncSocketPreBuffer *)self->preBuffer didWrite:v46];
          }
          self->currentRead->bytesDone += v31;
          BOOL v61 = 1;
          v11 += v31;
          goto LABEL_117;
        }
        uint64_t v12 = 0;
        BOOL v19 = 0;
        int v18 = 1;
      }
    }
LABEL_118:
    v40 = self->currentRead;
    if (v40->readLength || v40->term)
    {
      if (v11)
      {
        id WeakRetained = objc_loadWeakRetained(&self->delegate);
        if (self->delegateQueue && (objc_opt_respondsToSelector() & 1) != 0)
        {
          int64_t tag = self->currentRead->tag;
          delegateQueue = self->delegateQueue;
          uint64_t v52 = MEMORY[0x263EF8330];
          uint64_t v53 = 3221225472;
          v54 = sub_2308BC0D8;
          v55 = &unk_264B8EF00;
          id v56 = WeakRetained;
          v57 = self;
          size_t v58 = v11;
          int64_t v59 = tag;
          dispatch_async(delegateQueue, &v52);
        }
      }
LABEL_125:
      if (!v12)
      {
        if (!v19)
        {
          if (!v18) {
            return;
          }
          goto LABEL_137;
        }
LABEL_135:
        [(_DT_GCDAsyncSocket *)self doReadEOF];
        return;
      }
      goto LABEL_131;
    }
    BOOL v61 = v11 != 0;
    if (!v11) {
      goto LABEL_125;
    }
LABEL_130:
    [(_DT_GCDAsyncSocket *)self completeCurrentRead];
    if (!v12)
    {
      if (!v19)
      {
        [(_DT_GCDAsyncSocket *)self maybeDequeueRead];
        if ((v18 & 1) == 0) {
          return;
        }
        goto LABEL_137;
      }
      if ([(_DT_GCDAsyncSocketPreBuffer *)self->preBuffer availableBytes]) {
        [(_DT_GCDAsyncSocket *)self maybeDequeueRead];
      }
      goto LABEL_135;
    }
LABEL_131:
    -[_DT_GCDAsyncSocket closeWithError:](self, "closeWithError:", v12, v52, v53, v54, v55);

    return;
  }
  if ((flags & 0x1000) != 0)
  {
    if ([(_DT_GCDAsyncSocket *)self usingSecureTransportForTLS]) {
      [(_DT_GCDAsyncSocket *)self ssl_continueSSLHandshake];
    }
  }
  else if (![(_DT_GCDAsyncSocket *)self usingCFStreamForTLS])
  {
    [(_DT_GCDAsyncSocket *)self suspendReadSource];
  }
}

- (void)doReadEOF
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  unsigned int flags = self->flags;
  LOWORD(v4) = flags | 0x4000;
  self->unsigned int flags = flags | 0x4000;
  if ((flags & 0x2000) != 0)
  {
    [(_DT_GCDAsyncSocket *)self flushSSLBuffers];
    unsigned int v4 = self->flags;
  }
  if ((v4 & 0x1800) != 0)
  {
    if ([(_DT_GCDAsyncSocket *)self usingSecureTransportForTLS])
    {
      uintptr_t v5 = [(_DT_GCDAsyncSocket *)self sslError:4294957490];
      if (v5)
      {
LABEL_20:
        [(_DT_GCDAsyncSocket *)self closeWithError:v5];

        return;
      }
    }
LABEL_15:
    if ([(_DT_GCDAsyncSocket *)self usingSecureTransportForTLS]
      && (int sslErrCode = self->sslErrCode, sslErrCode != -9805)
      && sslErrCode)
    {
      uint64_t v8 = -[_DT_GCDAsyncSocket sslError:](self, "sslError:");
    }
    else
    {
      uint64_t v8 = [(_DT_GCDAsyncSocket *)self connectionClosedError];
    }
    uintptr_t v5 = (void *)v8;
    goto LABEL_20;
  }
  if ((v4 & 0x8000) == 0 && ![(_DT_GCDAsyncSocketPreBuffer *)self->preBuffer availableBytes])
  {
    if ((self->config & 8) == 0) {
      goto LABEL_15;
    }
    int socket4FD = self->socket4FD;
    if (socket4FD == -1) {
      int socket4FD = self->socket6FD;
    }
    v17.fd = socket4FD;
    *(_DWORD *)&v17.events = 4;
    poll(&v17, 1u, 0);
    if ((v17.revents & 4) == 0) {
      goto LABEL_15;
    }
    self->flags |= 0x8000u;
    id WeakRetained = objc_loadWeakRetained(&self->delegate);
    if (self->delegateQueue && (objc_opt_respondsToSelector() & 1) != 0)
    {
      delegateQueue = self->delegateQueue;
      uint64_t v11 = MEMORY[0x263EF8330];
      uint64_t v12 = 3221225472;
      uint64_t v13 = sub_2308BC318;
      uint64_t v14 = &unk_264B8DA70;
      id v15 = WeakRetained;
      unsigned int v16 = self;
      dispatch_async(delegateQueue, &v11);
    }
  }
  if (![(_DT_GCDAsyncSocket *)self usingCFStreamForTLS]) {
    [(_DT_GCDAsyncSocket *)self suspendReadSource];
  }
}

- (void)completeCurrentRead
{
  currentRead = self->currentRead;
  if (!currentRead)
  {
    BOOL v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"GCDAsyncSocket.m" lineNumber:4995 description:@"Trying to complete current read when there is no current read."];

    currentRead = self->currentRead;
  }
  buffer = currentRead->buffer;
  if (currentRead->bufferOwner)
  {
    [(NSMutableData *)buffer setLength:currentRead->bytesDone];
    uintptr_t v5 = self->currentRead->buffer;
  }
  else
  {
    unint64_t v6 = [(NSMutableData *)buffer length];
    int v7 = self->currentRead;
    unint64_t originalBufferLength = v7->originalBufferLength;
    if (v6 > originalBufferLength)
    {
      unint64_t startOffset = v7->startOffset;
      unint64_t bytesDone = v7->bytesDone;
      if (bytesDone + startOffset <= originalBufferLength) {
        unint64_t v11 = v7->originalBufferLength;
      }
      else {
        unint64_t v11 = bytesDone + startOffset;
      }
      [(NSMutableData *)v7->buffer setLength:v11];
      int v7 = self->currentRead;
    }
    uint64_t v12 = [(NSMutableData *)v7->buffer mutableBytes];
    uintptr_t v5 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v12 + self->currentRead->startOffset length:self->currentRead->bytesDone freeWhenDone:0];
  }
  uint64_t v13 = v5;
  id WeakRetained = objc_loadWeakRetained(&self->delegate);
  if (self->delegateQueue && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v15 = self->currentRead;
    delegateQueue = self->delegateQueue;
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    unint64_t v22 = sub_2308BC52C;
    id v23 = &unk_264B8EF28;
    id v24 = WeakRetained;
    uint64_t v25 = self;
    uint64_t v26 = v13;
    unint64_t v27 = v15;
    pollfd v17 = v15;
    dispatch_async(delegateQueue, &v20);
  }
  [(_DT_GCDAsyncSocket *)self endCurrentRead];
}

- (void)endCurrentRead
{
  readTimer = self->readTimer;
  if (readTimer)
  {
    dispatch_source_cancel(readTimer);
    unsigned int v4 = self->readTimer;
    self->readTimer = 0;
  }
  currentRead = self->currentRead;
  self->currentRead = 0;
}

- (void)setupReadTimerWithTimeout:(double)a3
{
  if (a3 >= 0.0)
  {
    location[1] = v6;
    location[2] = v5;
    location[7] = v3;
    location[8] = v4;
    id v9 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->socketQueue);
    readTimer = self->readTimer;
    self->readTimer = v9;

    objc_initWeak(location, self);
    unint64_t v11 = self->readTimer;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = sub_2308BC6E8;
    v13[3] = &unk_264B8D760;
    objc_copyWeak(&v14, location);
    dispatch_source_set_event_handler(v11, v13);
    dispatch_time_t v12 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer((dispatch_source_t)self->readTimer, v12, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)self->readTimer);
    objc_destroyWeak(&v14);
    objc_destroyWeak(location);
  }
}

- (void)doReadTimeout
{
  self->flags |= 8u;
  id WeakRetained = objc_loadWeakRetained(&self->delegate);
  if (self->delegateQueue && (objc_opt_respondsToSelector() & 1) != 0)
  {
    unsigned int v4 = self->currentRead;
    delegateQueue = self->delegateQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_2308BC840;
    block[3] = &unk_264B8EC88;
    id v8 = WeakRetained;
    id v9 = self;
    uint64_t v10 = v4;
    unint64_t v6 = v4;
    dispatch_async(delegateQueue, block);
  }
  else
  {
    [(_DT_GCDAsyncSocket *)self doReadTimeoutWithExtension:0.0];
  }
}

- (void)doReadTimeoutWithExtension:(double)a3
{
  currentRead = self->currentRead;
  if (currentRead)
  {
    if (a3 <= 0.0)
    {
      id v6 = [(_DT_GCDAsyncSocket *)self readTimeoutError];
      [(_DT_GCDAsyncSocket *)self closeWithError:v6];
    }
    else
    {
      currentRead->timeout = currentRead->timeout + a3;
      dispatch_time_t v5 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
      dispatch_source_set_timer((dispatch_source_t)self->readTimer, v5, 0xFFFFFFFFFFFFFFFFLL, 0);
      self->flags &= ~8u;
      [(_DT_GCDAsyncSocket *)self doReadData];
    }
  }
}

- (void)writeData:(id)a3 withTimeout:(double)a4 tag:(int64_t)a5
{
  id v8 = a3;
  if ([v8 length])
  {
    id v9 = [[_DT_GCDAsyncWritePacket alloc] initWithData:v8 timeout:a5 tag:a4];
    socketQueue = self->socketQueue;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = sub_2308BCAF0;
    v12[3] = &unk_264B8DA70;
    v12[4] = self;
    uint64_t v13 = v9;
    unint64_t v11 = v9;
    dispatch_async(socketQueue, v12);
  }
}

- (float)progressOfWriteReturningTag:(int64_t *)a3 bytesDone:(unint64_t *)a4 total:(unint64_t *)a5
{
  uint64_t v10 = 0;
  unint64_t v11 = (float *)&v10;
  uint64_t v12 = 0x2020000000;
  int v13 = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_2308BCC5C;
  aBlock[3] = &unk_264B8EED8;
  void aBlock[6] = a3;
  aBlock[7] = a4;
  aBlock[8] = a5;
  void aBlock[4] = self;
  void aBlock[5] = &v10;
  id v6 = (void (**)(void))_Block_copy(aBlock);
  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey)) {
    v6[2](v6);
  }
  else {
    dispatch_sync((dispatch_queue_t)self->socketQueue, v6);
  }
  float v7 = v11[6];

  _Block_object_dispose(&v10, 8);
  return v7;
}

- (void)maybeDequeueWrite
{
  if (!dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
  {
    float v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"GCDAsyncSocket.m" lineNumber:5230 description:@"Must be dispatched on socketQueue"];
  }
  if (!self->currentWrite && (self->flags & 2) != 0)
  {
    if ([(NSMutableArray *)self->writeQueue count])
    {
      unsigned int v4 = [(NSMutableArray *)self->writeQueue objectAtIndex:0];
      currentWrite = self->currentWrite;
      self->currentWrite = v4;

      [(NSMutableArray *)self->writeQueue removeObjectAtIndex:0];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        self->flags |= 0x1000u;
        MEMORY[0x270F9A6D0](self, sel_maybeStartTLS);
      }
      else
      {
        [(_DT_GCDAsyncSocket *)self setupWriteTimerWithTimeout:self->currentWrite->timeout];
        [(_DT_GCDAsyncSocket *)self doWriteData];
      }
    }
    else
    {
      unsigned int flags = self->flags;
      if ((flags & 0x40) != 0
        && ((flags & 0x20) == 0 || ![(NSMutableArray *)self->readQueue count] && !self->currentRead))
      {
        [(_DT_GCDAsyncSocket *)self closeWithError:0];
      }
    }
  }
}

- (void)doWriteData
{
  currentWrite = self->currentWrite;
  if (!currentWrite || (unsigned int flags = self->flags, (flags & 0x10) != 0))
  {
    if ([(_DT_GCDAsyncSocket *)self usingCFStreamForTLS] || (self->flags & 0x80) == 0) {
      return;
    }
    goto LABEL_10;
  }
  if ((flags & 0x80) == 0)
  {
    if (![(_DT_GCDAsyncSocket *)self usingCFStreamForTLS])
    {
      [(_DT_GCDAsyncSocket *)self resumeWriteSource];
    }
    return;
  }
  if ((flags & 0x1000) != 0)
  {
    if ((flags & 0x800) != 0)
    {
      if ([(_DT_GCDAsyncSocket *)self usingSecureTransportForTLS])
      {
        [(_DT_GCDAsyncSocket *)self ssl_continueSSLHandshake];
      }
      return;
    }
    if ([(_DT_GCDAsyncSocket *)self usingCFStreamForTLS]) {
      return;
    }
LABEL_10:
    [(_DT_GCDAsyncSocket *)self suspendWriteSource];
    return;
  }
  if ((flags & 0x2000) == 0)
  {
    int socket4FD = self->socket4FD;
    if (socket4FD == -1) {
      int socket4FD = self->socket6FD;
    }
    ssize_t v6 = write(socket4FD, [(NSData *)currentWrite->buffer bytes] + self->currentWrite->bytesDone, [(NSData *)self->currentWrite->buffer length] - self->currentWrite->bytesDone);
    if ((v6 & 0x8000000000000000) == 0)
    {
      unint64_t sslWriteCachedLength = v6;
LABEL_19:
      char v8 = 0;
      id v9 = 0;
      goto LABEL_60;
    }
    if (*__error() == 35)
    {
      id v9 = 0;
      unint64_t sslWriteCachedLength = 0;
      goto LABEL_57;
    }
    uint64_t v14 = [(_DT_GCDAsyncSocket *)self errnoErrorWithReason:@"Error in write() function"];
LABEL_47:
    id v9 = (void *)v14;
    unint64_t sslWriteCachedLength = 0;
    char v8 = 0;
    goto LABEL_64;
  }
  if (![(_DT_GCDAsyncSocket *)self usingCFStreamForTLS])
  {
    if (self->sslWriteCachedLength)
    {
      size_t processed = 0;
      uint64_t v11 = SSLWrite(self->sslContext, 0, 0, &processed);
      if (v11 == -9803)
      {
        id v9 = 0;
        int v19 = 1;
      }
      else
      {
        if (!v11)
        {
          unint64_t sslWriteCachedLength = self->sslWriteCachedLength;
          self->unint64_t sslWriteCachedLength = 0;
          NSUInteger v12 = [(NSData *)self->currentWrite->buffer length];
          int v13 = self->currentWrite;
          if (v12 == v13->bytesDone + sslWriteCachedLength) {
            goto LABEL_19;
          }
          goto LABEL_39;
        }
        id v9 = [(_DT_GCDAsyncSocket *)self sslError:v11];
        int v19 = 0;
      }
      unint64_t sslWriteCachedLength = 0;
      goto LABEL_55;
    }
    unint64_t sslWriteCachedLength = 0;
    int v13 = self->currentWrite;
LABEL_39:
    id v15 = (char *)([(NSData *)v13->buffer bytes] + self->currentWrite->bytesDone + sslWriteCachedLength);
    NSUInteger v16 = [(NSData *)self->currentWrite->buffer length]
        - (sslWriteCachedLength
         + self->currentWrite->bytesDone);
    while (1)
    {
      size_t v17 = v16 >= 0x8000 ? 0x8000 : v16;
      size_t processed = 0;
      uint64_t v18 = SSLWrite(self->sslContext, v15, v17, &processed);
      if (v18) {
        break;
      }
      v15 += processed;
      sslWriteCachedLength += processed;
      v16 -= processed;
      if (!v16)
      {
        id v9 = 0;
        goto LABEL_54;
      }
    }
    if (v18 == -9803)
    {
      id v9 = 0;
      self->unint64_t sslWriteCachedLength = v17;
      int v19 = 1;
      goto LABEL_55;
    }
    id v9 = [(_DT_GCDAsyncSocket *)self sslError:v18];
LABEL_54:
    int v19 = 0;
LABEL_55:
    if (!v19)
    {
      char v8 = 0;
      goto LABEL_60;
    }
    goto LABEL_57;
  }
  CFIndex v10 = CFWriteStreamWrite(self->writeStream, (const UInt8 *)([(NSData *)self->currentWrite->buffer bytes] + self->currentWrite->bytesDone), [(NSData *)self->currentWrite->buffer length] - self->currentWrite->bytesDone);
  if (v10 < 0)
  {
    uint64_t v14 = (uint64_t)CFWriteStreamCopyError(self->writeStream);
    goto LABEL_47;
  }
  unint64_t sslWriteCachedLength = v10;
  id v9 = 0;
LABEL_57:
  self->flags &= ~0x80u;
  if (![(_DT_GCDAsyncSocket *)self usingCFStreamForTLS]) {
    [(_DT_GCDAsyncSocket *)self resumeWriteSource];
  }
  char v8 = 1;
LABEL_60:
  if (!sslWriteCachedLength)
  {
LABEL_64:
    char v23 = 1;
    if (v8) {
      goto LABEL_70;
    }
    goto LABEL_67;
  }
  self->currentWrite->bytesDone += sslWriteCachedLength;
  uint64_t v20 = self->currentWrite;
  unint64_t bytesDone = v20->bytesDone;
  if (bytesDone == [(NSData *)v20->buffer length])
  {
    [(_DT_GCDAsyncSocket *)self completeCurrentWrite];
    if (!v9)
    {
      socketQueue = self->socketQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_2308BD3BC;
      block[3] = &unk_264B8D590;
      void block[4] = self;
      dispatch_async(socketQueue, block);
      return;
    }
    goto LABEL_76;
  }
  char v23 = 0;
  if (v8) {
    goto LABEL_70;
  }
LABEL_67:
  if (!v9)
  {
    self->flags &= ~0x80u;
    if (![(_DT_GCDAsyncSocket *)self usingCFStreamForTLS]) {
      [(_DT_GCDAsyncSocket *)self resumeWriteSource];
    }
  }
LABEL_70:
  if ((v23 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained(&self->delegate);
    if (self->delegateQueue && (objc_opt_respondsToSelector() & 1) != 0)
    {
      int64_t tag = self->currentWrite->tag;
      delegateQueue = self->delegateQueue;
      uint64_t v28 = MEMORY[0x263EF8330];
      uint64_t v29 = 3221225472;
      unint64_t v30 = sub_2308BD400;
      size_t v31 = &unk_264B8EF00;
      id v32 = WeakRetained;
      int v33 = self;
      unint64_t v34 = sslWriteCachedLength;
      int64_t v35 = tag;
      dispatch_async(delegateQueue, &v28);
    }
  }
  if (v9)
  {
LABEL_76:
    unint64_t v27 = [(_DT_GCDAsyncSocket *)self errnoErrorWithReason:@"Error in write() function", v28, v29, v30, v31];
    [(_DT_GCDAsyncSocket *)self closeWithError:v27];
  }
}

- (void)completeCurrentWrite
{
  if (!self->currentWrite)
  {
    float v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"GCDAsyncSocket.m" lineNumber:5669 description:@"Trying to complete current write when there is no current write."];
  }
  id WeakRetained = objc_loadWeakRetained(&self->delegate);
  if (self->delegateQueue && (objc_opt_respondsToSelector() & 1) != 0)
  {
    int64_t tag = self->currentWrite->tag;
    delegateQueue = self->delegateQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_2308BD564;
    block[3] = &unk_264B8EF50;
    id v9 = WeakRetained;
    CFIndex v10 = self;
    int64_t v11 = tag;
    dispatch_async(delegateQueue, block);
  }
  [(_DT_GCDAsyncSocket *)self endCurrentWrite];
}

- (void)endCurrentWrite
{
  writeTimer = self->writeTimer;
  if (writeTimer)
  {
    dispatch_source_cancel(writeTimer);
    unsigned int v4 = self->writeTimer;
    self->writeTimer = 0;
  }
  currentWrite = self->currentWrite;
  self->currentWrite = 0;
}

- (void)setupWriteTimerWithTimeout:(double)a3
{
  if (a3 >= 0.0)
  {
    location[1] = v6;
    location[2] = v5;
    location[7] = v3;
    location[8] = v4;
    id v9 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->socketQueue);
    writeTimer = self->writeTimer;
    self->writeTimer = v9;

    objc_initWeak(location, self);
    int64_t v11 = self->writeTimer;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = sub_2308BD71C;
    v13[3] = &unk_264B8D760;
    objc_copyWeak(&v14, location);
    dispatch_source_set_event_handler(v11, v13);
    dispatch_time_t v12 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer((dispatch_source_t)self->writeTimer, v12, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)self->writeTimer);
    objc_destroyWeak(&v14);
    objc_destroyWeak(location);
  }
}

- (void)doWriteTimeout
{
  self->flags |= 0x10u;
  id WeakRetained = objc_loadWeakRetained(&self->delegate);
  if (self->delegateQueue && (objc_opt_respondsToSelector() & 1) != 0)
  {
    unsigned int v4 = self->currentWrite;
    delegateQueue = self->delegateQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_2308BD874;
    block[3] = &unk_264B8EC88;
    id v8 = WeakRetained;
    id v9 = self;
    CFIndex v10 = v4;
    ssize_t v6 = v4;
    dispatch_async(delegateQueue, block);
  }
  else
  {
    [(_DT_GCDAsyncSocket *)self doWriteTimeoutWithExtension:0.0];
  }
}

- (void)doWriteTimeoutWithExtension:(double)a3
{
  currentWrite = self->currentWrite;
  if (currentWrite)
  {
    if (a3 <= 0.0)
    {
      id v6 = [(_DT_GCDAsyncSocket *)self writeTimeoutError];
      [(_DT_GCDAsyncSocket *)self closeWithError:v6];
    }
    else
    {
      currentWrite->timeout = currentWrite->timeout + a3;
      dispatch_time_t v5 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
      dispatch_source_set_timer((dispatch_source_t)self->writeTimer, v5, 0xFFFFFFFFFFFFFFFFLL, 0);
      self->flags &= ~0x10u;
      [(_DT_GCDAsyncSocket *)self doWriteData];
    }
  }
}

- (void)startTLS:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = [NSDictionary dictionary];
  }
  dispatch_time_t v5 = [[_DT_GCDAsyncSpecialPacket alloc] initWithTLSSettings:v4];
  socketQueue = self->socketQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_2308BDB18;
  v8[3] = &unk_264B8DA70;
  v8[4] = self;
  id v9 = v5;
  float v7 = v5;
  dispatch_async(socketQueue, v8);
}

- (void)maybeStartTLS
{
  if ((~self->flags & 0x1800) != 0) {
    return;
  }
  BOOL v3 = self->currentRead;
  id v4 = v3;
  if (v3) {
    BOOL v3 = (_DT_GCDAsyncReadPacket *)v3->buffer;
  }
  dispatch_time_t v5 = [(_DT_GCDAsyncReadPacket *)v3 objectForKey:@"GCDAsyncSocketUseCFStreamForTLS"];
  if (v5)
  {
    id v6 = v5;
    char v7 = [v5 BOOLValue];

    if (v7)
    {
      MEMORY[0x270F9A6D0](self, sel_cf_startTLS);
      return;
    }
  }
  else
  {
  }
  MEMORY[0x270F9A6D0](self, sel_ssl_startTLS);
}

- (int)sslReadWithBuffer:(void *)a3 length:(unint64_t *)a4
{
  if (!self->socketFDBytesAvailable
    && ![(_DT_GCDAsyncSocketPreBuffer *)self->sslPreBuffer availableBytes])
  {
    [(_DT_GCDAsyncSocket *)self resumeReadSource];
    *a4 = 0;
    return -9803;
  }
  unint64_t v7 = *a4;
  unint64_t v8 = [(_DT_GCDAsyncSocketPreBuffer *)self->sslPreBuffer availableBytes];
  if (v8)
  {
    if (v8 >= v7) {
      size_t v9 = v7;
    }
    else {
      size_t v9 = v8;
    }
    memcpy(a3, [(_DT_GCDAsyncSocketPreBuffer *)self->sslPreBuffer readBuffer], v9);
    [(_DT_GCDAsyncSocketPreBuffer *)self->sslPreBuffer didRead:v9];
    v7 -= v9;
    if (!v7)
    {
      *a4 = v9;
      return 0;
    }
  }
  else
  {
    size_t v9 = 0;
  }
  unint64_t socketFDBytesAvailable = self->socketFDBytesAvailable;
  if (!socketFDBytesAvailable)
  {
    *a4 = v9;
    return -9803;
  }
  int socket6FD = self->socket6FD;
  if (socket6FD == -1) {
    int socket6FD = self->socket4FD;
  }
  if (socketFDBytesAvailable <= v7)
  {
    int v13 = (char *)a3 + v9;
    size_t v12 = v7;
  }
  else
  {
    [(_DT_GCDAsyncSocketPreBuffer *)self->sslPreBuffer ensureCapacityForWrite:self->socketFDBytesAvailable];
    size_t v12 = self->socketFDBytesAvailable;
    int v13 = [(_DT_GCDAsyncSocketPreBuffer *)self->sslPreBuffer writeBuffer];
  }
  unint64_t v14 = read(socket6FD, v13, v12);
  if ((v14 & 0x8000000000000000) != 0)
  {
    int v20 = *__error();
    self->unint64_t socketFDBytesAvailable = 0;
    *a4 = v9;
    if (v20 != 35) {
      return -9806;
    }
    return -9803;
  }
  size_t v15 = v14;
  if (v14)
  {
    unint64_t v16 = self->socketFDBytesAvailable;
    BOOL v17 = v16 >= v14;
    unint64_t v18 = v16 - v14;
    if (!v17) {
      unint64_t v18 = 0;
    }
    self->unint64_t socketFDBytesAvailable = v18;
    if (socketFDBytesAvailable > v7)
    {
      [(_DT_GCDAsyncSocketPreBuffer *)self->sslPreBuffer didWrite:v14];
      if (v7 < v15) {
        size_t v15 = v7;
      }
      memcpy((char *)a3 + v9, [(_DT_GCDAsyncSocketPreBuffer *)self->sslPreBuffer readBuffer], v15);
      [(_DT_GCDAsyncSocketPreBuffer *)self->sslPreBuffer didRead:v15];
    }
    *a4 = v15 + v9;
    if (v7 == v15) {
      return 0;
    }
    return -9803;
  }
  self->unint64_t socketFDBytesAvailable = 0;
  *a4 = v9;
  return -9806;
}

- (int)sslWriteWithBuffer:(const void *)a3 length:(unint64_t *)a4
{
  if ((self->flags & 0x80) == 0)
  {
    [(_DT_GCDAsyncSocket *)self resumeWriteSource];
LABEL_14:
    *a4 = 0;
    return -9803;
  }
  unint64_t v6 = *a4;
  int socket4FD = self->socket4FD;
  if (socket4FD == -1) {
    int socket4FD = self->socket6FD;
  }
  ssize_t v8 = write(socket4FD, a3, *a4);
  if (v8 < 0)
  {
    int v10 = *__error();
    self->flags &= ~0x80u;
    *a4 = 0;
    if (v10 == 35) {
      return -9803;
    }
    else {
      return -9806;
    }
  }
  else
  {
    if (!v8)
    {
      self->flags &= ~0x80u;
      goto LABEL_14;
    }
    *a4 = v8;
    if (v8 == v6) {
      return 0;
    }
    else {
      return -9803;
    }
  }
}

- (void)ssl_startTLS
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v4 = self->currentRead;
  dispatch_time_t v5 = v4;
  if (!v4)
  {
    int64_t v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"GCDAsyncSocket.m" lineNumber:6125 description:@"Logic error"];

    unint64_t v6 = [(_DT_GCDAsyncSocket *)self otherError:@"Logic error"];
    [(_DT_GCDAsyncSocket *)self closeWithError:v6];
    goto LABEL_10;
  }
  unint64_t v6 = v4->buffer;
  unint64_t v7 = [(NSMutableData *)v6 objectForKey:*MEMORY[0x263EFC840]];
  int v8 = [v7 BOOLValue];

  size_t v9 = SSLCreateContext((CFAllocatorRef)*MEMORY[0x263EFFB08], (SSLProtocolSide)(v8 ^ 1), kSSLStreamType);
  self->sslContext = v9;
  if (!v9)
  {
    int v10 = @"Error in SSLCreateContext";
    goto LABEL_9;
  }
  if (SSLSetIOFuncs(v9, (SSLReadFunc)sub_2308BE9CC, (SSLWriteFunc)sub_2308BEA8C))
  {
    int v10 = @"Error in SSLSetIOFuncs";
LABEL_9:
    size_t v12 = [(_DT_GCDAsyncSocket *)self otherError:v10];
    [(_DT_GCDAsyncSocket *)self closeWithError:v12];

    goto LABEL_10;
  }
  if (SSLSetConnection(self->sslContext, self))
  {
    int v10 = @"Error in SSLSetConnection";
    goto LABEL_9;
  }
  int v13 = [(NSMutableData *)v6 objectForKey:@"GCDAsyncSocketManuallyEvaluateTrust"];
  int v14 = [v13 BOOLValue];

  if (v14)
  {
    if (v8)
    {
      int v10 = @"Manual trust validation is not supported for server sockets";
      goto LABEL_9;
    }
    if (SSLSetSessionOption(self->sslContext, kSSLSessionOptionBreakOnServerAuth, 1u))
    {
      int v10 = @"Error in SSLSetSessionOption";
      goto LABEL_9;
    }
  }
  id v15 = [(NSMutableData *)v6 objectForKey:*MEMORY[0x263EFC860]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = v15;
    BOOL v17 = (const char *)[v16 UTF8String];
    size_t v18 = strlen(v17);
    if (SSLSetPeerDomainName(self->sslContext, v17, v18))
    {
      int v19 = @"Error in SSLSetPeerDomainName";
LABEL_28:
      id v24 = [(_DT_GCDAsyncSocket *)self otherError:v19];
      [(_DT_GCDAsyncSocket *)self closeWithError:v24];

LABEL_29:
      goto LABEL_10;
    }
  }
  else if (v15)
  {
    int v20 = [MEMORY[0x263F08690] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"GCDAsyncSocket.m" lineNumber:6251 description:@"Invalid value for kCFStreamSSLPeerName. Value must be of type NSString."];

    uint64_t v21 = @"Invalid value for kCFStreamSSLPeerName.";
LABEL_21:
    unint64_t v22 = [(_DT_GCDAsyncSocket *)self otherError:v21];
    [(_DT_GCDAsyncSocket *)self closeWithError:v22];

LABEL_22:
    goto LABEL_10;
  }
  id v16 = [(NSMutableData *)v6 objectForKey:*MEMORY[0x263EFC830]];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (SSLSetCertificate(self->sslContext, (CFArrayRef)v16))
    {
      int v19 = @"Error in SSLSetCertificate";
      goto LABEL_28;
    }
  }
  else if (v16)
  {
    char v23 = [MEMORY[0x263F08690] currentHandler];
    [v23 handleFailureInMethod:a2 object:self file:@"GCDAsyncSocket.m" lineNumber:6273 description:@"Invalid value for kCFStreamSSLCertificates. Value must be of type NSArray."];

    int v19 = @"Invalid value for kCFStreamSSLCertificates.";
    goto LABEL_28;
  }
  id v15 = [(NSMutableData *)v6 objectForKey:@"GCDAsyncSocketSSLPeerID"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v25 = v15;
    sslContext = self->sslContext;
    id v16 = v25;
    if (SSLSetPeerID(sslContext, (const void *)[v16 bytes], [v16 length]))
    {
      unint64_t v27 = [(_DT_GCDAsyncSocket *)self otherError:@"Error in SSLSetPeerID"];
      [(_DT_GCDAsyncSocket *)self closeWithError:v27];

      goto LABEL_29;
    }

    goto LABEL_36;
  }
  if (v15)
  {
    uint64_t v28 = [MEMORY[0x263F08690] currentHandler];
    [v28 handleFailureInMethod:a2 object:self file:@"GCDAsyncSocket.m" lineNumber:6297 description:@"Invalid value for GCDAsyncSocketSSLPeerID. Value must be of type NSData. (You can convert strings to data using a method like [string dataUsingEncoding:NSUTF8StringEncoding])"];

    uint64_t v21 = @"Invalid value for GCDAsyncSocketSSLPeerID.";
    goto LABEL_21;
  }
LABEL_36:
  id v16 = [(NSMutableData *)v6 objectForKey:@"GCDAsyncSocketSSLProtocolVersionMin"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    SSLProtocol v29 = [v16 intValue];
    if (v29 && SSLSetProtocolVersionMin(self->sslContext, v29))
    {
      int v19 = @"Error in SSLSetProtocolVersionMin";
      goto LABEL_28;
    }
  }
  else if (v16)
  {
    unint64_t v30 = [MEMORY[0x263F08690] currentHandler];
    [v30 handleFailureInMethod:a2 object:self file:@"GCDAsyncSocket.m" lineNumber:6321 description:@"Invalid value for GCDAsyncSocketSSLProtocolVersionMin. Value must be of type NSNumber."];

    int v19 = @"Invalid value for GCDAsyncSocketSSLProtocolVersionMin.";
    goto LABEL_28;
  }
  id v15 = [(NSMutableData *)v6 objectForKey:@"GCDAsyncSocketSSLProtocolVersionMax"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    SSLProtocol v31 = [v15 intValue];
    if (v31 && SSLSetProtocolVersionMax(self->sslContext, v31))
    {
      uint64_t v21 = @"Error in SSLSetProtocolVersionMax";
      goto LABEL_21;
    }
  }
  else if (v15)
  {
    id v32 = [MEMORY[0x263F08690] currentHandler];
    [v32 handleFailureInMethod:a2 object:self file:@"GCDAsyncSocket.m" lineNumber:6345 description:@"Invalid value for GCDAsyncSocketSSLProtocolVersionMax. Value must be of type NSNumber."];

    uint64_t v21 = @"Invalid value for GCDAsyncSocketSSLProtocolVersionMax.";
    goto LABEL_21;
  }
  id v16 = [(NSMutableData *)v6 objectForKey:@"GCDAsyncSocketSSLSessionOptionFalseStart"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (SSLSetSessionOption(self->sslContext, kSSLSessionOptionFalseStart, [v16 BOOLValue]))
    {
      int v19 = @"Error in SSLSetSessionOption (kSSLSessionOptionFalseStart)";
      goto LABEL_28;
    }
  }
  else if (v16)
  {
    int v33 = [MEMORY[0x263F08690] currentHandler];
    [v33 handleFailureInMethod:a2 object:self file:@"GCDAsyncSocket.m" lineNumber:6365 description:@"Invalid value for GCDAsyncSocketSSLSessionOptionFalseStart. Value must be of type NSNumber."];

    int v19 = @"Invalid value for GCDAsyncSocketSSLSessionOptionFalseStart.";
    goto LABEL_28;
  }
  id v15 = [(NSMutableData *)v6 objectForKey:@"GCDAsyncSocketSSLSessionOptionSendOneByteRecord"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (SSLSetSessionOption(self->sslContext, kSSLSessionOptionSendOneByteRecord, [v15 BOOLValue]))
    {
      uint64_t v21 = @"Error in SSLSetSessionOption (kSSLSessionOptionSendOneByteRecord)";
      goto LABEL_21;
    }
  }
  else if (v15)
  {
    unint64_t v34 = [MEMORY[0x263F08690] currentHandler];
    [v34 handleFailureInMethod:a2 object:self file:@"GCDAsyncSocket.m" lineNumber:6387 description:@"Invalid value for GCDAsyncSocketSSLSessionOptionSendOneByteRecord. Value must be of type NSNumber."];

    uint64_t v21 = @"Invalid value for GCDAsyncSocketSSLSessionOptionSendOneByteRecord.";
    goto LABEL_21;
  }
  id v16 = [(NSMutableData *)v6 objectForKey:@"GCDAsyncSocketSSLCipherSuites"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = v16;
    size_t v35 = [v15 count];
    uint64_t v54 = (uint64_t)&v54;
    uint64_t v36 = (const SSLCipherSuite *)((char *)&v54 - ((2 * v35 + 15) & 0xFFFFFFFFFFFFFFF0));
    if (v35)
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        char v38 = [v15 objectAtIndex:i v54 v55];
        v36[i] = [v38 shortValue];
      }
    }
    if (SSLSetEnabledCiphers(self->sslContext, v36, v35))
    {
      BOOL v39 = [(_DT_GCDAsyncSocket *)self otherError:@"Error in SSLSetEnabledCiphers"];
      [(_DT_GCDAsyncSocket *)self closeWithError:v39];

      goto LABEL_22;
    }
  }
  else if (v16)
  {
    v40 = [MEMORY[0x263F08690] currentHandler];
    [v40 handleFailureInMethod:a2 object:self file:@"GCDAsyncSocket.m" lineNumber:6418 description:@"Invalid value for GCDAsyncSocketSSLCipherSuites. Value must be of type NSArray."];

    int v19 = @"Invalid value for GCDAsyncSocketSSLCipherSuites.";
    goto LABEL_28;
  }
  -[NSMutableData objectForKey:](v6, "objectForKey:", *MEMORY[0x263EFC818], v54);
  id v15 = (id)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v41 = [MEMORY[0x263F08690] currentHandler];
    [v41 handleFailureInMethod:a2 object:self file:@"GCDAsyncSocket.m" lineNumber:6459 description:@"Security option unavailable - kCFStreamSSLAllowsAnyRoot - You must use manual trust evaluation"];

    uint64_t v21 = @"Security option unavailable - kCFStreamSSLAllowsAnyRoot";
    goto LABEL_21;
  }
  uint64_t v42 = [(NSMutableData *)v6 objectForKey:*MEMORY[0x263EFC828]];
  if (v42)
  {
    id v16 = (id)v42;
    v43 = [MEMORY[0x263F08690] currentHandler];
    [v43 handleFailureInMethod:a2 object:self file:@"GCDAsyncSocket.m" lineNumber:6474 description:@"Security option unavailable - kCFStreamSSLAllowsExpiredRoots - You must use manual trust evaluation"];

    int v19 = @"Security option unavailable - kCFStreamSSLAllowsExpiredRoots";
    goto LABEL_28;
  }
  uint64_t v44 = [(NSMutableData *)v6 objectForKey:*MEMORY[0x263EFC868]];
  if (v44)
  {
    id v16 = (id)v44;
    uint64_t v45 = [MEMORY[0x263F08690] currentHandler];
    [v45 handleFailureInMethod:a2 object:self file:@"GCDAsyncSocket.m" lineNumber:6489 description:@"Security option unavailable - kCFStreamSSLValidatesCertificateChain - You must use manual trust evaluation"];

    int v19 = @"Security option unavailable - kCFStreamSSLValidatesCertificateChain";
    goto LABEL_28;
  }
  uint64_t v46 = [(NSMutableData *)v6 objectForKey:*MEMORY[0x263EFC820]];
  if (v46)
  {
    id v16 = (id)v46;
    v47 = [MEMORY[0x263F08690] currentHandler];
    [v47 handleFailureInMethod:a2 object:self file:@"GCDAsyncSocket.m" lineNumber:6504 description:@"Security option unavailable - kCFStreamSSLAllowsExpiredCertificates - You must use manual trust evaluation"];

    int v19 = @"Security option unavailable - kCFStreamSSLAllowsExpiredCertificates";
    goto LABEL_28;
  }
  uint64_t v48 = [(NSMutableData *)v6 objectForKey:*MEMORY[0x263EFC848]];
  if (v48)
  {
    id v16 = (id)v48;
    uint64_t v49 = [MEMORY[0x263F08690] currentHandler];
    [v49 handleFailureInMethod:a2 object:self file:@"GCDAsyncSocket.m" lineNumber:6519 description:@"Security option unavailable - kCFStreamSSLLevel - You must use GCDAsyncSocketSSLProtocolVersionMin & GCDAsyncSocketSSLProtocolVersionMax"];

    int v19 = @"Security option unavailable - kCFStreamSSLLevel";
    goto LABEL_28;
  }
  v50 = [[_DT_GCDAsyncSocketPreBuffer alloc] initWithCapacity:4096];
  sslPreBuffer = self->sslPreBuffer;
  self->sslPreBuffer = v50;

  unint64_t v52 = [(_DT_GCDAsyncSocketPreBuffer *)self->preBuffer availableBytes];
  if (v52)
  {
    size_t v53 = v52;
    [(_DT_GCDAsyncSocketPreBuffer *)self->sslPreBuffer ensureCapacityForWrite:v52];
    memcpy([(_DT_GCDAsyncSocketPreBuffer *)self->sslPreBuffer writeBuffer], [(_DT_GCDAsyncSocketPreBuffer *)self->preBuffer readBuffer], v53);
    [(_DT_GCDAsyncSocketPreBuffer *)self->preBuffer didRead:v53];
    [(_DT_GCDAsyncSocketPreBuffer *)self->sslPreBuffer didWrite:v53];
  }
  self->int sslErrCode = 0;
  [(_DT_GCDAsyncSocket *)self ssl_continueSSLHandshake];
LABEL_10:
}

- (void)ssl_continueSSLHandshake
{
  uint64_t v3 = SSLHandshake(self->sslContext);
  if (v3 == -9841)
  {
    uint64_t v27 = 0;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x2020000000;
    SecTrustRef v30 = 0;
    uint64_t v6 = SSLCopyPeerTrust(self->sslContext, &v30);
    if (v6)
    {
      unint64_t v7 = [(_DT_GCDAsyncSocket *)self sslError:v6];
      [(_DT_GCDAsyncSocket *)self closeWithError:v7];
    }
    else
    {
      int stateIndex = self->stateIndex;
      size_t v9 = self->socketQueue;
      objc_initWeak(&location, self);
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = sub_2308BEF30;
      aBlock[3] = &unk_264B8EFA0;
      unint64_t v7 = v9;
      unint64_t v22 = v7;
      char v23 = &v27;
      objc_copyWeak(&v24, &location);
      int v25 = stateIndex;
      int v10 = _Block_copy(aBlock);
      id WeakRetained = objc_loadWeakRetained(&self->delegate);
      if (self->delegateQueue && (objc_opt_respondsToSelector() & 1) != 0)
      {
        delegateQueue = self->delegateQueue;
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = sub_2308BF080;
        v16[3] = &unk_264B8EFC8;
        id v17 = WeakRetained;
        size_t v18 = self;
        int v20 = &v27;
        id v19 = v10;
        dispatch_async(delegateQueue, v16);

        int v13 = v17;
      }
      else
      {
        int v14 = (const void *)v28[3];
        if (v14)
        {
          CFRelease(v14);
          v28[3] = 0;
        }
        int v13 = [(_DT_GCDAsyncSocket *)self otherError:@"GCDAsyncSocketManuallyEvaluateTrust specified in tlsSettings, but delegate doesn't implement socket:shouldTrustPeer:"];
        [(_DT_GCDAsyncSocket *)self closeWithError:v13];
      }

      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
    }

    _Block_object_dispose(&v27, 8);
  }
  else if (v3 != -9803)
  {
    if (v3)
    {
      id v15 = [(_DT_GCDAsyncSocket *)self sslError:v3];
      [(_DT_GCDAsyncSocket *)self closeWithError:v15];
    }
    else
    {
      self->unsigned int flags = self->flags & 0xFFFFC7FF | 0x2000;
      id v4 = objc_loadWeakRetained(&self->delegate);
      if (self->delegateQueue)
      {
        if (objc_opt_respondsToSelector())
        {
          dispatch_time_t v5 = self->delegateQueue;
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = sub_2308BEEEC;
          block[3] = &unk_264B8DA70;
          id v32 = v4;
          int v33 = self;
          dispatch_async(v5, block);
        }
      }
      [(_DT_GCDAsyncSocket *)self endCurrentRead];
      [(_DT_GCDAsyncSocket *)self endCurrentWrite];
      [(_DT_GCDAsyncSocket *)self maybeDequeueRead];
      [(_DT_GCDAsyncSocket *)self maybeDequeueWrite];
    }
  }
}

- (void)ssl_shouldTrustPeer:(BOOL)a3 stateIndex:(int)a4
{
  if (self->stateIndex == a4)
  {
    self->int stateIndex = a4 + 1;
    if (a3)
    {
      [(_DT_GCDAsyncSocket *)self ssl_continueSSLHandshake];
    }
    else
    {
      id v5 = [(_DT_GCDAsyncSocket *)self sslError:4294957471];
      [(_DT_GCDAsyncSocket *)self closeWithError:v5];
    }
  }
}

- (void)cf_finishSSLHandshake
{
  unsigned int flags = self->flags;
  if ((~flags & 0x1800) == 0)
  {
    self->unsigned int flags = flags & 0xFFFFC7FF | 0x2000;
    id WeakRetained = objc_loadWeakRetained(&self->delegate);
    if (self->delegateQueue)
    {
      if (objc_opt_respondsToSelector())
      {
        delegateQueue = self->delegateQueue;
        uint64_t v6 = MEMORY[0x263EF8330];
        uint64_t v7 = 3221225472;
        int v8 = sub_2308BF274;
        size_t v9 = &unk_264B8DA70;
        id v10 = WeakRetained;
        int64_t v11 = self;
        dispatch_async(delegateQueue, &v6);
      }
    }
    [(_DT_GCDAsyncSocket *)self endCurrentRead];
    [(_DT_GCDAsyncSocket *)self endCurrentWrite];
    [(_DT_GCDAsyncSocket *)self maybeDequeueRead];
    [(_DT_GCDAsyncSocket *)self maybeDequeueWrite];
  }
}

- (void)cf_abortSSLHandshake:(id)a3
{
  unsigned int flags = self->flags;
  if ((~flags & 0x1800) == 0)
  {
    self->unsigned int flags = flags & 0xFFFFE7FF;
    [(_DT_GCDAsyncSocket *)self closeWithError:a3];
  }
}

- (void)cf_startTLS
{
  if ([(_DT_GCDAsyncSocketPreBuffer *)self->preBuffer availableBytes])
  {
    id v4 = @"Invalid TLS transition. Handshake has already been read from socket.";
LABEL_15:
    size_t v12 = [(_DT_GCDAsyncSocket *)self otherError:v4];
    [(_DT_GCDAsyncSocket *)self closeWithError:v12];
    goto LABEL_16;
  }
  [(_DT_GCDAsyncSocket *)self suspendReadSource];
  [(_DT_GCDAsyncSocket *)self suspendWriteSource];
  self->unint64_t socketFDBytesAvailable = 0;
  self->unsigned int flags = self->flags & 0xFFF3FF7F | 0x40000;
  if (![(_DT_GCDAsyncSocket *)self createReadAndWriteStream])
  {
    id v4 = @"Error in CFStreamCreatePairWithSocket";
    goto LABEL_15;
  }
  if (![(_DT_GCDAsyncSocket *)self registerForStreamCallbacksIncludingReadWrite:1])
  {
    id v4 = @"Error in CFStreamSetClient";
    goto LABEL_15;
  }
  if (![(_DT_GCDAsyncSocket *)self addStreamsToRunLoop])
  {
    id v4 = @"Error in CFStreamScheduleWithRunLoop";
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"GCDAsyncSocket.m" lineNumber:6781 description:@"Invalid read packet for startTLS"];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int64_t v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"GCDAsyncSocket.m" lineNumber:6782 description:@"Invalid write packet for startTLS"];
  }
  size_t v12 = self->currentRead;
  buffer = v12->buffer;
  CFStringRef v6 = (const __CFString *)*MEMORY[0x263EFC800];
  int v7 = CFReadStreamSetProperty(self->readStream, (CFStreamPropertyKey)*MEMORY[0x263EFC800], buffer);
  if (v7 | CFWriteStreamSetProperty(self->writeStream, v6, buffer))
  {
    if ([(_DT_GCDAsyncSocket *)self openStreams]) {
      goto LABEL_16;
    }
    int v8 = @"Error in CFStreamOpen";
  }
  else
  {
    int v8 = @"Error in CFStreamSetProperty";
  }
  size_t v9 = [(_DT_GCDAsyncSocket *)self otherError:v8];
  [(_DT_GCDAsyncSocket *)self closeWithError:v9];

LABEL_16:
}

+ (void)startCFStreamThreadIfNeeded
{
  if (qword_268707F38 != -1) {
    dispatch_once(&qword_268707F38, &unk_26E515648);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2308BF5FC;
  block[3] = &unk_264B8EFE8;
  void block[4] = a1;
  dispatch_sync((dispatch_queue_t)qword_268707F48, block);
}

+ (void)stopCFStreamThreadIfNeeded
{
  dispatch_time_t v2 = dispatch_time(0, 30000000000);
  uint64_t v3 = qword_268707F48;
  dispatch_after(v2, v3, &unk_26E515AE8);
}

+ (void)cfstreamThread
{
  uint64_t v3 = (void *)MEMORY[0x230FC2180](a1, a2);
  id v4 = [MEMORY[0x263F08B88] currentThread];
  [v4 setName:@"_DT_GCDAsyncSocket-CFStream"];

  id v5 = (void *)MEMORY[0x263EFFA20];
  CFStringRef v6 = [MEMORY[0x263EFF910] distantFuture];
  [v6 timeIntervalSinceNow];
  id v7 = [v5 scheduledTimerWithTimeInterval:a1 target:0 selector:sel_ignore_ userInfo:1 repeats:YES];

  int v8 = [MEMORY[0x263F08B88] currentThread];
  size_t v9 = [MEMORY[0x263EFF9F0] currentRunLoop];
  if (([v8 isCancelled] & 1) == 0)
  {
    uint64_t v10 = *MEMORY[0x263EFF478];
    do
    {
      int64_t v11 = [MEMORY[0x263EFF910] distantFuture];
      int v12 = [v9 runMode:v10 beforeDate:v11];
    }
    while (v12 && ![v8 isCancelled]);
  }
}

+ (void)scheduleCFStreams:(id)a3
{
  id v13 = a3;
  id v5 = [MEMORY[0x263F08B88] currentThread];
  uint64_t v6 = qword_268707F50;

  if (v5 != (void *)v6)
  {
    int v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2 object:a1 file:@"GCDAsyncSocket.m" lineNumber:6930 description:@"Invoked on wrong thread"];
  }
  Current = CFRunLoopGetCurrent();
  int v8 = v13;
  size_t v9 = (__CFReadStream *)*((void *)v13 + 27);
  uint64_t v10 = (CFRunLoopMode *)MEMORY[0x263EFFE88];
  if (v9)
  {
    CFReadStreamScheduleWithRunLoop(v9, Current, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
    int v8 = v13;
  }
  int64_t v11 = (__CFWriteStream *)v8[28];
  if (v11)
  {
    CFWriteStreamScheduleWithRunLoop(v11, Current, *v10);
    int v8 = v13;
  }
}

+ (void)unscheduleCFStreams:(id)a3
{
  id v13 = a3;
  id v5 = [MEMORY[0x263F08B88] currentThread];
  uint64_t v6 = qword_268707F50;

  if (v5 != (void *)v6)
  {
    int v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2 object:a1 file:@"GCDAsyncSocket.m" lineNumber:6944 description:@"Invoked on wrong thread"];
  }
  Current = CFRunLoopGetCurrent();
  int v8 = v13;
  size_t v9 = (__CFReadStream *)*((void *)v13 + 27);
  uint64_t v10 = (CFRunLoopMode *)MEMORY[0x263EFFE88];
  if (v9)
  {
    CFReadStreamUnscheduleFromRunLoop(v9, Current, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
    int v8 = v13;
  }
  int64_t v11 = (__CFWriteStream *)v8[28];
  if (v11)
  {
    CFWriteStreamUnscheduleFromRunLoop(v11, Current, *v10);
    int v8 = v13;
  }
}

- (BOOL)createReadAndWriteStream
{
  if (!dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
  {
    int64_t v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"GCDAsyncSocket.m" lineNumber:7093 description:@"Must be dispatched on socketQueue"];
  }
  p_readStream = &self->readStream;
  if (self->readStream) {
    goto LABEL_5;
  }
  p_writeStream = &self->writeStream;
  if (self->writeStream) {
    goto LABEL_5;
  }
  CFSocketNativeHandle socket6FD = self->socket6FD;
  if (socket6FD == -1)
  {
    CFSocketNativeHandle socket6FD = self->socket4FD;
    if (socket6FD == -1) {
      goto LABEL_20;
    }
  }
  LODWORD(v6) = [(_DT_GCDAsyncSocket *)self isConnected];
  if (!v6) {
    return (char)v6;
  }
  CFStreamCreatePairWithSocket(0, socket6FD, &self->readStream, &self->writeStream);
  int v8 = (CFStreamPropertyKey *)MEMORY[0x263EFFEB0];
  size_t v9 = (CFTypeRef *)MEMORY[0x263EFFB38];
  if (*p_readStream) {
    CFReadStreamSetProperty(*p_readStream, (CFStreamPropertyKey)*MEMORY[0x263EFFEB0], (CFTypeRef)*MEMORY[0x263EFFB38]);
  }
  if (!*p_writeStream)
  {
    uint64_t v10 = *p_readStream;
    if (*p_readStream) {
      goto LABEL_17;
    }
LABEL_20:
    LOBYTE(v6) = 0;
    return (char)v6;
  }
  CFWriteStreamSetProperty(*p_writeStream, *v8, *v9);
  uint64_t v6 = *p_writeStream;
  uint64_t v10 = *p_readStream;
  if (!*p_readStream) {
    goto LABEL_18;
  }
  if (v6)
  {
LABEL_5:
    LOBYTE(v6) = 1;
    return (char)v6;
  }
LABEL_17:
  CFReadStreamClose(v10);
  CFRelease(*p_readStream);
  *p_readStream = 0;
  uint64_t v6 = *p_writeStream;
LABEL_18:
  if (v6)
  {
    CFWriteStreamClose(v6);
    CFRelease(*p_writeStream);
    LOBYTE(v6) = 0;
    *p_writeStream = 0;
  }
  return (char)v6;
}

- (BOOL)registerForStreamCallbacksIncludingReadWrite:(BOOL)a3
{
  BOOL v3 = a3;
  if (!dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
  {
    int64_t v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"GCDAsyncSocket.m" lineNumber:7155 description:@"Must be dispatched on socketQueue"];
  }
  readStream = self->readStream;
  if (!readStream || !self->writeStream)
  {
    uint64_t v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"GCDAsyncSocket.m" lineNumber:7156 description:@"Read/Write stream is null"];

    readStream = self->readStream;
  }
  self->streamContext.version = 0;
  self->streamContext.info = self;
  self->streamContext.retain = 0;
  if (v3) {
    CFOptionFlags v7 = 26;
  }
  else {
    CFOptionFlags v7 = 24;
  }
  self->streamContext.release = 0;
  self->streamContext.copyDescription = 0;
  int v8 = CFReadStreamSetClient(readStream, v7, (CFReadStreamClientCallBack)sub_2308BFD3C, (CFStreamClientContext *)&self->streamContext);
  if (v8)
  {
    if (v3) {
      CFOptionFlags v9 = 28;
    }
    else {
      CFOptionFlags v9 = 24;
    }
    LOBYTE(v8) = CFWriteStreamSetClient(self->writeStream, v9, (CFWriteStreamClientCallBack)sub_2308BFE8C, (CFStreamClientContext *)&self->streamContext) != 0;
  }
  return v8;
}

- (BOOL)addStreamsToRunLoop
{
  if (!dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
  {
    uint64_t v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"GCDAsyncSocket.m" lineNumber:7189 description:@"Must be dispatched on socketQueue"];
  }
  if (!self->readStream || !self->writeStream)
  {
    id v5 = [MEMORY[0x263F08690] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"GCDAsyncSocket.m" lineNumber:7190 description:@"Read/Write stream is null"];
  }
  if ((self->flags & 0x20000) == 0)
  {
    [(id)objc_opt_class() startCFStreamThreadIfNeeded];
    [(id)objc_opt_class() performSelector:sel_scheduleCFStreams_ onThread:qword_268707F50 withObject:self waitUntilDone:1];
    self->flags |= 0x20000u;
  }
  return 1;
}

- (void)removeStreamsFromRunLoop
{
  if (!dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
  {
    id v5 = [MEMORY[0x263F08690] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"GCDAsyncSocket.m" lineNumber:7212 description:@"Must be dispatched on socketQueue"];
  }
  if (!self->readStream || !self->writeStream)
  {
    id v4 = [MEMORY[0x263F08690] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"GCDAsyncSocket.m" lineNumber:7213 description:@"Read/Write stream is null"];
  }
  if ((self->flags & 0x20000) != 0)
  {
    [(id)objc_opt_class() performSelector:sel_unscheduleCFStreams_ onThread:qword_268707F50 withObject:self waitUntilDone:1];
    [(id)objc_opt_class() stopCFStreamThreadIfNeeded];
    self->flags &= ~0x20000u;
  }
}

- (BOOL)openStreams
{
  if (!dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
  {
    int v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"GCDAsyncSocket.m" lineNumber:7233 description:@"Must be dispatched on socketQueue"];
  }
  readStream = self->readStream;
  if (!readStream || !self->writeStream)
  {
    int64_t v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"GCDAsyncSocket.m" lineNumber:7234 description:@"Read/Write stream is null"];

    readStream = self->readStream;
  }
  CFStreamStatus Status = CFReadStreamGetStatus(readStream);
  CFStreamStatus v6 = CFWriteStreamGetStatus(self->writeStream);
  if (Status && v6) {
    return 1;
  }
  int v8 = CFReadStreamOpen(self->readStream);
  int v9 = CFWriteStreamOpen(self->writeStream);
  if (v8) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  return !v10;
}

- (BOOL)autoDisconnectOnClosedReadStream
{
  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey)) {
    return (self->config & 8) == 0;
  }
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  socketQueue = self->socketQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_2308C03BC;
  v6[3] = &unk_264B8EC38;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(socketQueue, v6);
  BOOL v3 = *((unsigned char *)v8 + 24) != 0;
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (void)setAutoDisconnectOnClosedReadStream:(BOOL)a3
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_2308C0488;
  v5[3] = &unk_264B8ECB0;
  BOOL v6 = a3;
  v5[4] = self;
  id v4 = (void (**)(void))_Block_copy(v5);
  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey)) {
    v4[2](v4);
  }
  else {
    dispatch_async((dispatch_queue_t)self->socketQueue, v4);
  }
}

- (void)markSocketQueueTargetQueue:(id)a3
{
}

- (void)unmarkSocketQueueTargetQueue:(id)a3
{
}

- (void)performBlock:(id)a3
{
  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey))
  {
    id v5 = (void (*)(id))*((void *)a3 + 2);
    v5(a3);
  }
  else
  {
    socketQueue = self->socketQueue;
    dispatch_sync(socketQueue, a3);
  }
}

- (int)socketFD
{
  if (!dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey)) {
    return -1;
  }
  int result = self->socket4FD;
  if (result == -1) {
    return self->socket6FD;
  }
  return result;
}

- (int)socket4FD
{
  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey)) {
    return self->socket4FD;
  }
  else {
    return -1;
  }
}

- (int)socket6FD
{
  if (dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey)) {
    return self->socket6FD;
  }
  else {
    return -1;
  }
}

- (__CFReadStream)readStream
{
  int result = (__CFReadStream *)dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey);
  if (result)
  {
    int result = self->readStream;
    if (!result)
    {
      [(_DT_GCDAsyncSocket *)self createReadAndWriteStream];
      return self->readStream;
    }
  }
  return result;
}

- (__CFWriteStream)writeStream
{
  int result = (__CFWriteStream *)dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey);
  if (result)
  {
    int result = self->writeStream;
    if (!result)
    {
      [(_DT_GCDAsyncSocket *)self createReadAndWriteStream];
      return self->writeStream;
    }
  }
  return result;
}

- (SSLContext)sslContext
{
  int result = (SSLContext *)dispatch_get_specific(self->IsOnSocketQueueOrTargetQueueKey);
  if (result) {
    return self->sslContext;
  }
  return result;
}

+ (id)lookupHost:(id)a3 port:(unsigned __int16)a4 error:(id *)a5
{
  unsigned int v6 = a4;
  v29[2] = *(addrinfo **)MEMORY[0x263EF8340];
  id v8 = a3;
  if (([v8 isEqualToString:@"localhost"] & 1) != 0
    || [v8 isEqualToString:@"loopback"])
  {
    LOWORD(v29[0]) = 528;
    WORD1(v29[0]) = __rev16(v6);
    HIDWORD(v29[0]) = 16777343;
    v29[1] = 0;
    LOWORD(v28.ai_flags) = 7708;
    HIWORD(v28.ai_flags) = WORD1(v29[0]);
    v28.int ai_family = 0;
    *(_OWORD *)&v28.ai_socktype = *MEMORY[0x263EF88F8];
    LODWORD(v28.ai_canonname) = 0;
    uint64_t v9 = [MEMORY[0x263EFF8F8] dataWithBytes:v29 length:16];
    char v10 = [MEMORY[0x263EFF8F8] dataWithBytes:&v28 length:28];
    int64_t v11 = [MEMORY[0x263EFF980] arrayWithCapacity:2];
    [v11 addObject:v9];
    [v11 addObject:v10];

    int v12 = 0;
    if (!a5) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  int v14 = [NSString stringWithFormat:@"%hu", v6];
  v29[0] = 0;
  *(void *)&v28.ai_unsigned int flags = 0;
  memset(&v28.ai_addrlen, 0, 32);
  *(void *)&v28.ai_socktype = 0x600000001;
  id v15 = (const char *)[v8 UTF8String];
  id v16 = v14;
  uint64_t v17 = getaddrinfo(v15, (const char *)[v16 UTF8String], &v28, v29);
  if (v17)
  {
    uint64_t v18 = v17;
    int64_t v11 = 0;
LABEL_10:
    int v12 = [a1 gaiError:v18];
    goto LABEL_33;
  }
  id v19 = v29[0];
  if (v29[0])
  {
    uint64_t v20 = 0;
    do
    {
      int ai_family = v19->ai_family;
      if (ai_family == 30 || ai_family == 2) {
        ++v20;
      }
      id v19 = v19->ai_next;
    }
    while (v19);
  }
  else
  {
    uint64_t v20 = 0;
  }
  int64_t v11 = [MEMORY[0x263EFF980] arrayWithCapacity:v20];
  char v23 = v29[0];
  if (v29[0])
  {
    do
    {
      int v24 = v23->ai_family;
      if (v24 == 30 || v24 == 2)
      {
        uint64_t v26 = [MEMORY[0x263EFF8F8] dataWithBytes:v23->ai_addr length:v23->ai_addrlen];
        [v11 addObject:v26];
      }
      char v23 = v23->ai_next;
    }
    while (v23);
    uint64_t v27 = v29[0];
  }
  else
  {
    uint64_t v27 = 0;
  }
  freeaddrinfo(v27);
  if (![v11 count])
  {
    uint64_t v18 = 4;
    goto LABEL_10;
  }
  int v12 = 0;
LABEL_33:

  if (a5) {
LABEL_4:
  }
    *a5 = v12;
LABEL_5:

  return v11;
}

+ (id)hostFromSockaddr4:(const sockaddr_in *)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (!inet_ntop(2, &a3->sin_addr, v5, 0x10u)) {
    v5[0] = 0;
  }
  BOOL v3 = [NSString stringWithCString:v5 encoding:1];
  return v3;
}

+ (id)hostFromSockaddr6:(const sockaddr_in6 *)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (!inet_ntop(30, &a3->sin6_addr, v5, 0x2Eu)) {
    v5[0] = 0;
  }
  BOOL v3 = [NSString stringWithCString:v5 encoding:1];
  return v3;
}

+ (unsigned)portFromSockaddr4:(const sockaddr_in *)a3
{
  return bswap32(a3->sin_port) >> 16;
}

+ (unsigned)portFromSockaddr6:(const sockaddr_in6 *)a3
{
  return bswap32(a3->sin6_port) >> 16;
}

+ (id)hostFromAddress:(id)a3
{
  id v8 = 0;
  int v3 = [a1 getHost:&v8 port:0 fromAddress:a3];
  id v4 = v8;
  id v5 = v4;
  id v6 = 0;
  if (v3) {
    id v6 = v4;
  }

  return v6;
}

+ (unsigned)portFromAddress:(id)a3
{
  unsigned __int16 v6 = 0;
  int v3 = [a1 getHost:0 port:&v6 fromAddress:a3];
  unsigned __int16 v4 = v6;
  if (!v3) {
    return 0;
  }
  return v4;
}

+ (BOOL)isIPv4Address:(id)a3
{
  id v3 = a3;
  BOOL v4 = (unint64_t)[v3 length] >= 0x10
    && *(unsigned char *)([v3 bytes] + 1) == 2;

  return v4;
}

+ (BOOL)isIPv6Address:(id)a3
{
  id v3 = a3;
  BOOL v4 = (unint64_t)[v3 length] >= 0x10
    && *(unsigned char *)([v3 bytes] + 1) == 30;

  return v4;
}

+ (BOOL)getHost:(id *)a3 port:(unsigned __int16 *)a4 fromAddress:(id)a5
{
  return MEMORY[0x270F9A6D0](a1, sel_getHost_port_family_fromAddress_);
}

+ (BOOL)getHost:(id *)a3 port:(unsigned __int16 *)a4 family:(char *)a5 fromAddress:(id)a6
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v10 = a6;
  if ((unint64_t)[v10 length] < 0x10) {
    goto LABEL_20;
  }
  id v11 = v10;
  uint64_t v12 = [v11 bytes];
  int v13 = *(unsigned __int8 *)(v12 + 1);
  if (v13 == 30)
  {
    if ((unint64_t)[v11 length] >= 0x1C)
    {
      long long v15 = *(_OWORD *)v12;
      *(_OWORD *)&v18[12] = *(_OWORD *)(v12 + 12);
      *(_OWORD *)uint64_t v18 = v15;
      if (a3)
      {
        *a3 = [a1 hostFromSockaddr6:v18];
      }
      if (a4) {
        *a4 = [a1 portFromSockaddr6:v18];
      }
      if (!a5) {
        goto LABEL_19;
      }
      char v14 = 30;
      goto LABEL_18;
    }
LABEL_20:
    BOOL v16 = 0;
    goto LABEL_21;
  }
  if (v13 != 2 || (unint64_t)[v11 length] < 0x10) {
    goto LABEL_20;
  }
  *(_OWORD *)uint64_t v18 = *(_OWORD *)v12;
  if (a3)
  {
    *a3 = [a1 hostFromSockaddr4:v18];
  }
  if (a4) {
    *a4 = [a1 portFromSockaddr4:v18];
  }
  if (!a5) {
    goto LABEL_19;
  }
  char v14 = 2;
LABEL_18:
  *a5 = v14;
LABEL_19:
  BOOL v16 = 1;
LABEL_21:

  return v16;
}

+ (id)CRLFData
{
  return (id)[MEMORY[0x263EFF8F8] dataWithBytes:"\r\n" length:2];
}

+ (id)CRData
{
  return (id)[MEMORY[0x263EFF8F8] dataWithBytes:"\r" length:1];
}

+ (id)LFData
{
  return (id)[MEMORY[0x263EFF8F8] dataWithBytes:"\n" length:1];
}

+ (id)ZeroData
{
  return (id)[MEMORY[0x263EFF8F8] dataWithBytes:"" length:1];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->userData, 0);
  objc_storeStrong((id *)&self->sslPreBuffer, 0);
  objc_storeStrong((id *)&self->preBuffer, 0);
  objc_storeStrong((id *)&self->currentWrite, 0);
  objc_storeStrong((id *)&self->currentRead, 0);
  objc_storeStrong((id *)&self->writeQueue, 0);
  objc_storeStrong((id *)&self->readQueue, 0);
  objc_storeStrong((id *)&self->writeTimer, 0);
  objc_storeStrong((id *)&self->readTimer, 0);
  objc_storeStrong((id *)&self->writeSource, 0);
  objc_storeStrong((id *)&self->readSource, 0);
  objc_storeStrong((id *)&self->connectTimer, 0);
  objc_storeStrong((id *)&self->accept6Source, 0);
  objc_storeStrong((id *)&self->accept4Source, 0);
  objc_storeStrong((id *)&self->socketQueue, 0);
  objc_storeStrong((id *)&self->connectInterface6, 0);
  objc_storeStrong((id *)&self->connectInterface4, 0);
  objc_storeStrong((id *)&self->delegateQueue, 0);
  objc_destroyWeak(&self->delegate);
}

@end