@interface FSFCurareInteractionSELFStream
- (BOOL)insert:(id)a3 error:(id *)a4;
- (FSFCurareInteractionSELFStream)init;
- (FSFCurareInteractionSELFStream)initWithFilter:(id)a3;
- (id)retrieve:(id)a3;
- (void)retrieve:(id)a3 completionHandler:(id)a4;
- (void)retrieveWithCompletionHandler:(id)a3;
@end

@implementation FSFCurareInteractionSELFStream

- (BOOL)insert:(id)a3 error:(id *)a4
{
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"SELF stream does not support insertion" userInfo:0];
  objc_exception_throw(v5);
}

- (id)retrieve:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __65__FSFCurareInteractionSELFStream_StreamSourceProtocol__retrieve___block_invoke;
  v9[3] = &unk_2644648A0;
  v11 = &v12;
  v6 = v5;
  v10 = v6;
  [(FSFCurareInteractionSELFStream *)self retrieveWithCompletionHandler:v9];
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __65__FSFCurareInteractionSELFStream_StreamSourceProtocol__retrieve___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)retrieve:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __83__FSFCurareInteractionSELFStream_StreamSourceProtocol__retrieve_completionHandler___block_invoke;
  v7[3] = &unk_2644648C8;
  id v8 = v5;
  id v6 = v5;
  [(FSFCurareInteractionSELFStream *)self retrieveWithCompletionHandler:v7];
}

uint64_t __83__FSFCurareInteractionSELFStream_StreamSourceProtocol__retrieve_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (FSFCurareInteractionSELFStream)initWithFilter:(id)a3
{
  return (FSFCurareInteractionSELFStream *)CurareInteractionSELFStream.init(filter:)(a3);
}

- (void)retrieveWithCompletionHandler:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = self;
  id v6 = self;

  _runTaskForBridgedAsyncMethod(_:)((uint64_t)&async function pointer to partial apply for @objc closure #1 in CurareInteractionSELFStream.retrieve(), v5);
}

- (FSFCurareInteractionSELFStream)init
{
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___FSFCurareInteractionSELFStream_logger;
  type metadata accessor for Logger();
  OUTLINED_FUNCTION_3_3();
  (*(void (**)(char *))(v4 + 8))(v3);

  outlined destroy of InstrumentationStreamsProviderProtocol?((uint64_t)self + OBJC_IVAR___FSFCurareInteractionSELFStream_provider, &demangling cache variable for type metadata for InstrumentationStreamsProviderProtocol?);
}

@end