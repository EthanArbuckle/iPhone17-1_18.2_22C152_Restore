@interface GEOProtobufSession
+ (OS_dispatch_queue)sharedDelegateQueue;
+ (id)sharedProtobufSession;
- (GEOProtobufSession)init;
- (GEOProtobufSession)initWithDataURLSession:(id)a3;
- (id)taskWithRequest:(id)a3 requestTypeCode:(unsigned int)a4 responseClass:(Class)a5 delegate:(id)a6 delegateQueue:(id)a7;
- (id)taskWithRequestKind:(id)a3 protobufRequest:(id)a4 URL:(id)a5 additionalHTTPHeaders:(id)a6 auditToken:(id)a7 traits:(id)a8 delegate:(id)a9 delegateQueue:(id)a10 requestCounterTicket:(id)a11 multipathServiceType:(unint64_t)a12 multipathAlternatePort:(unint64_t)a13 throttleToken:(id)a14 options:(unint64_t)a15;
@end

@implementation GEOProtobufSession

- (id)taskWithRequest:(id)a3 requestTypeCode:(unsigned int)a4 responseClass:(Class)a5 delegate:(id)a6 delegateQueue:(id)a7
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v11 = a7;
  id v12 = a6;
  id v13 = a3;
  v14 = [GEOProtobufSessionTask alloc];
  uint64_t v15 = [v13 kind];
  v16 = [v13 auditToken];
  v17 = [v13 throttleToken];
  uint64_t v31 = v15;
  v18 = self;
  id v19 = v12;
  id v20 = v11;
  id v29 = v16;
  id v21 = v17;
  if (v14)
  {
    v30.receiver = v14;
    v30.super_class = (Class)GEOProtobufSessionTask;
    v22 = [(GEOProtobufSession *)&v30 init];
    v14 = (GEOProtobufSessionTask *)v22;
    if (v22)
    {
      objc_storeWeak((id *)&v22[1]._dataSession, v18);
      objc_storeWeak((id *)&v14->_delegate, v19);
      v14->_responseClass = a5;
      objc_storeStrong((id *)&v14->_delegateQueue, a7);
      v14->_requestKind = ($7466BF22B2A7275A1F5DB80FF4552E0B)v15;
      v14->_requestTypeCode = a4;
      objc_storeStrong((id *)&v14->_auditToken, v16);
      objc_storeStrong((id *)&v14->_throttleToken, v17);
      v23 = GEOGetDataSessionProtobufLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138413058;
        v33 = v14;
        __int16 v34 = 2048;
        id v35 = v19;
        __int16 v36 = 1040;
        int v37 = 8;
        __int16 v38 = 2098;
        v39 = &v31;
        _os_log_impl(&dword_188D96000, v23, OS_LOG_TYPE_DEBUG, "Protobuf task %@ init (delegate %p, kind %{public, geo:DataRequestKind}.*P)", buf, 0x26u);
      }
    }
  }

  if (v18) {
    dataSession = v18->_dataSession;
  }
  else {
    dataSession = 0;
  }
  v25 = -[GEODataURLSession taskWithRequest:delegate:delegateQueue:](dataSession, "taskWithRequest:delegate:delegateQueue:", v13, v14, v20, a5);

  if (v14) {
    objc_storeStrong((id *)&v14->_dataTask, v25);
  }

  return v14;
}

+ (OS_dispatch_queue)sharedDelegateQueue
{
  if (qword_1EB29FDE0 != -1) {
    dispatch_once(&qword_1EB29FDE0, &__block_literal_global_114);
  }
  v2 = (void *)qword_1EB29FDE8;

  return (OS_dispatch_queue *)v2;
}

+ (id)sharedProtobufSession
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__GEOProtobufSession_sharedProtobufSession__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_259 != -1) {
    dispatch_once(&_MergedGlobals_259, block);
  }
  v2 = (void *)qword_1EB29FDD8;

  return v2;
}

void __43__GEOProtobufSession_sharedProtobufSession__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc(*(Class *)(a1 + 32));
  id v4 = +[GEODataURLSession sharedDataURLSession];
  uint64_t v2 = [v1 initWithDataURLSession:v4];
  v3 = (void *)qword_1EB29FDD8;
  qword_1EB29FDD8 = v2;
}

- (GEOProtobufSession)init
{
  return 0;
}

void __41__GEOProtobufSession_sharedDelegateQueue__block_invoke()
{
  uint64_t v0 = geo_dispatch_queue_create();
  id v1 = (void *)qword_1EB29FDE8;
  qword_1EB29FDE8 = v0;
}

- (GEOProtobufSession)initWithDataURLSession:(id)a3
{
  id v5 = a3;
  if (initWithDataURLSession__onceToken != -1) {
    dispatch_once(&initWithDataURLSession__onceToken, &__block_literal_global_4_3);
  }
  v9.receiver = self;
  v9.super_class = (Class)GEOProtobufSession;
  v6 = [(GEOProtobufSession *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dataSession, a3);
  }

  return v7;
}

uint64_t __45__GEOProtobufSession_initWithDataURLSession___block_invoke()
{
  return [MEMORY[0x1E4F28C58] setUserInfoValueProviderForDomain:@"GEOProtobufSession" provider:&__block_literal_global_195];
}

- (void).cxx_destruct
{
}

- (id)taskWithRequestKind:(id)a3 protobufRequest:(id)a4 URL:(id)a5 additionalHTTPHeaders:(id)a6 auditToken:(id)a7 traits:(id)a8 delegate:(id)a9 delegateQueue:(id)a10 requestCounterTicket:(id)a11 multipathServiceType:(unint64_t)a12 multipathAlternatePort:(unint64_t)a13 throttleToken:(id)a14 options:(unint64_t)a15
{
  id v19 = a4;
  id v32 = a5;
  id v31 = a6;
  id v29 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  id v24 = a14;
  context = (void *)MEMORY[0x18C1203C0]();
  v25 = v20;
  v26 = [[GEODataRequest alloc] initWithKind:a3 protobufRequest:v19 URL:v32 additionalHTTPHeaders:v31 auditToken:v29 timeoutInterval:v20 traits:GEODataRequestTimeout(*(void *)&a3) requestCounterTicket:v23 multipathServiceType:a12 multipathAlternatePort:a13 throttleToken:v24 options:a15];
  v27 = -[GEOProtobufSession taskWithRequest:requestTypeCode:responseClass:delegate:delegateQueue:](self, "taskWithRequest:requestTypeCode:responseClass:delegate:delegateQueue:", v26, [v19 requestTypeCode], objc_msgSend(v19, "responseClass"), v21, v22);

  return v27;
}

@end