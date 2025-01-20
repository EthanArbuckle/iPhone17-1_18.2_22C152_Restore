@interface GTAccelerationStructureServerSession
+ (void)sessionWithReplayClient:(GTMTLReplayClient *)a3 functionIndex:(unint64_t)a4 requestID:(id)a5 transport:(id)a6 dataHandler:(id)a7 accelerationStructureKey:(unint64_t)a8 completionHandler:(id)a9;
- (unint64_t)requestID;
- (unint64_t)sessionID;
- (void)dealloc;
- (void)nextSample:(unint64_t)a3;
- (void)receiveData:(id)a3;
- (void)setRequestID:(unint64_t)a3;
- (void)setSessionID:(unint64_t)a3;
@end

@implementation GTAccelerationStructureServerSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandBufferDescriptor, 0);
  objc_storeStrong(&self->_dataHandler, 0);

  objc_storeStrong((id *)&self->_transport, 0);
}

- (void)setRequestID:(unint64_t)a3
{
  self->requestID = a3;
}

- (unint64_t)requestID
{
  return self->requestID;
}

- (void)setSessionID:(unint64_t)a3
{
  self->sessionID = a3;
}

- (unint64_t)sessionID
{
  return self->sessionID;
}

- (void)nextSample:(unint64_t)a3
{
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __51__GTAccelerationStructureServerSession_nextSample___block_invoke;
  v6[3] = &unk_7463E8;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  v5 = +[NSBlockOperation blockOperationWithBlock:v6];
  [self->_clientContext->var7.var0 addOperation:v5];

  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __51__GTAccelerationStructureServerSession_nextSample___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained && *((void *)WeakRetained + 7))
  {
    GTMTLReplayController_debugSubCommandStop(*(void *)(*((void *)WeakRetained + 1) + 8), *((_DWORD *)WeakRetained + 4), 0);
    v5 = [*(id *)(*(void *)(v4[1] + 8) + 8) defaultCommandQueue];
    uint64_t v6 = v4[7];
    id v7 = v5;
    std::mutex::lock((std::mutex *)(v6 + 48));
    if (*(void *)(v6 + 17712) && !*(void *)(v6 + 17728))
    {
      v33 = +[MTLCaptureManager sharedCaptureManager];
      id v32 = objc_alloc_init((Class)MTLCaptureDescriptor);
      [v32 setDestination:2];
      NSTemporaryDirectory();
      id obja = (id)objc_claimAutoreleasedReturnValue();
      v8 = +[NSURL fileURLWithPath:obja];
      uint64_t v9 = +[NSDate date];
      [(id)v9 timeIntervalSince1970];
      v11 = +[NSString stringWithFormat:@"ASVSRenderer-%lu.gputrace", (unint64_t)v10];
      uint64_t v12 = [v8 URLByAppendingPathComponent:v11];

      id obj = (id)v12;
      [v32 setOutputURL:v12];
      [v32 setCaptureObject:v7];
      NSLog(@"Starting capture of %lu sample(s)…", *(void *)(v6 + 17712));
      id v36 = 0;
      LOBYTE(v9) = [v33 startCaptureWithDescriptor:v32 error:&v36];
      id v13 = v36;
      v14 = v13;
      if (v9)
      {
        v15 = obj;
        objc_storeStrong((id *)(v6 + 17720), obj);
        id v16 = v33;
      }
      else
      {
        v17 = [v13 localizedDescription];
        NSLog(@"Unable to capture: %@", v17);

        v18 = *(void **)(v6 + 17720);
        *(void *)(v6 + 17720) = 0;

        id v16 = 0;
        *(void *)(v6 + 17712) = 0;
        v15 = obj;
      }
      v19 = *(void **)(v6 + 17728);
      *(void *)(v6 + 17728) = v16;
    }
    std::mutex::unlock((std::mutex *)(v6 + 48));

    v20 = [v7 commandBufferWithDescriptor:v4[5]];
    [v20 setLabel:@"ASV Generate Sample"];
    uint64_t v21 = *(void *)(a1 + 40);
    if ((*(unsigned int (**)(void, id))(*(void *)v4[7] + 96))(v4[7], v7)) {
      v22 = 0;
    }
    else {
      v22 = (void *)(v21 + 30);
    }
    if ((unint64_t)v22 <= 0x7530)
    {
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = __51__GTAccelerationStructureServerSession_nextSample___block_invoke_2;
      v34[3] = &unk_745B08;
      objc_copyWeak(v35, v2);
      v35[1] = v22;
      v34[4] = v4;
      [v20 addCompletedHandler:v34];
      objc_destroyWeak(v35);
    }
    else
    {
      uint64_t v23 = v4[8];
      v24 = +[ASVError errorWithCode:7 localizedDescription:@"Xcode isn't responding"];
      (*(void (**)(uint64_t, void, void *))(*(void *)v23 + 40))(v23, 0, v24);
    }
    GTMTLReplay_commitCommandBuffer(v20);
    uint64_t v25 = v4[7];
    std::mutex::lock((std::mutex *)(v25 + 48));
    if (*(void *)(v25 + 17728))
    {
      uint64_t v26 = *(void *)(v25 + 17712);
      if (v26)
      {
        uint64_t v27 = v26 - 1;
        *(void *)(v25 + 17712) = v27;
        NSLog(@"Capturing… %lu remaining sample(s)…", v27);
        if (!*(void *)(v25 + 17712))
        {
          NSLog(@"Stopping capture…");
          [*(id *)(v25 + 17728) stopCapture];
          NSLog(@"Capture complete!");
          v28 = *(void **)(v25 + 17720);
          *(void *)(v25 + 17720) = 0;

          v29 = *(void **)(v25 + 17728);
          *(void *)(v25 + 17728) = 0;
        }
      }
    }
    std::mutex::unlock((std::mutex *)(v25 + 48));
  }
}

void __51__GTAccelerationStructureServerSession_nextSample___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = dispatch_get_global_queue(0, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  id v7[2] = __51__GTAccelerationStructureServerSession_nextSample___block_invoke_3;
  v7[3] = &unk_745AE0;
  id v8 = v3;
  id v5 = v3;
  objc_copyWeak(v10, (id *)(a1 + 40));
  uint64_t v6 = *(void *)(a1 + 32);
  v10[1] = *(id *)(a1 + 48);
  uint64_t v9 = v6;
  dispatch_async(v4, v7);

  objc_destroyWeak(v10);
}

void __51__GTAccelerationStructureServerSession_nextSample___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) status];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    unint64_t v3 = *(void *)(a1 + 56);
    if (v3 > 0x64)
    {
      dispatch_time_t v4 = dispatch_time(0, 1000000 * v3);
      id v5 = dispatch_get_global_queue(0, 0);
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = __51__GTAccelerationStructureServerSession_nextSample___block_invoke_4;
      v6[3] = &unk_7463E8;
      objc_copyWeak(v7, (id *)(a1 + 48));
      v7[1] = *(id *)(a1 + 56);
      dispatch_after(v4, v5, v6);

      objc_destroyWeak(v7);
    }
    else
    {
      [*(id *)(a1 + 40) nextSample:];
    }
  }
}

void __51__GTAccelerationStructureServerSession_nextSample___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[7]) {
    [WeakRetained nextSample:*(void *)(a1 + 40)];
  }
}

- (void)receiveData:(id)a3
{
  id v6 = a3;
  server = self->_server;
  if (server)
  {
    id v5 = v6;
    (*((void (**)(Server *, id, id))server->var0 + 4))(server, [v5 bytes], objc_msgSend(v5, "length"));
  }
}

- (void)dealloc
{
  NSLog(@"Session is deallocating…", a2);
  server = self->_server;
  if (server) {
    (*((void (**)(Server *, Sampler *, void))server->var0 + 15))(server, self->_sampler, 0);
  }
  htransport = self->_htransport;
  if (htransport) {
    (*((void (**)(Transport *))htransport->var0 + 1))(htransport);
  }
  self->_htransport = 0;
  sampler = self->_sampler;
  if (sampler) {
    (*((void (**)(Sampler *))sampler->var0 + 1))(sampler);
  }
  self->_sampler = 0;
  id v6 = self->_server;
  if (v6) {
    (*((void (**)(Server *))v6->var0 + 1))(v6);
  }
  self->_server = 0;
  dataSource = self->_dataSource;
  if (dataSource) {
    (*(void (**)(void *))(*(void *)dataSource + 8))(dataSource);
  }
  self->_dataSource = 0;
  NSLog(@"Session is deallocated…");
  v8.receiver = self;
  v8.super_class = (Class)GTAccelerationStructureServerSession;
  [(GTAccelerationStructureServerSession *)&v8 dealloc];
}

+ (void)sessionWithReplayClient:(GTMTLReplayClient *)a3 functionIndex:(unint64_t)a4 requestID:(id)a5 transport:(id)a6 dataHandler:(id)a7 accelerationStructureKey:(unint64_t)a8 completionHandler:(id)a9
{
  id v13 = a5;
  id v14 = a6;
  id v20 = a7;
  id v19 = a9;
  v15 = objc_alloc_init(GTAccelerationStructureServerSession);
  id v16 = v15;
  if (v15)
  {
    if (v13) {
      v15->requestID = (unint64_t)[v13 unsignedLongValue];
    }
    v16->_clientContext = a3;
    v16->_functionIndex = a4;
    objc_storeStrong((id *)&v16->_transport, a6);
    id v17 = objc_retainBlock(v20);
    id dataHandler = v16->_dataHandler;
    v16->_id dataHandler = v17;

    operator new();
  }
}

void __153__GTAccelerationStructureServerSession_sessionWithReplayClient_functionIndex_requestID_transport_dataHandler_accelerationStructureKey_completionHandler___block_invoke(uint64_t a1)
{
}

@end