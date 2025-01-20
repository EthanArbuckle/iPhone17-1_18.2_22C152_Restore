@interface ACHActivitySummaryIteratorServer
+ (id)taskIdentifier;
- (ACHActivitySummaryIteratorServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)remote_activitySummariesForStartDateComponents:(id)a3 endDateComponents:(id)a4 includePrivateProperties:(BOOL)a5 completion:(id)a6;
@end

@implementation ACHActivitySummaryIteratorServer

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x263F23468];
}

- (ACHActivitySummaryIteratorServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ACHActivitySummaryIteratorServer;
  v11 = [(HDStandardTaskServer *)&v19 initWithUUID:a3 configuration:a4 client:v10 delegate:a6];
  if (v11)
  {
    id v12 = objc_alloc(MEMORY[0x263F43140]);
    v13 = [v10 profile];
    uint64_t v14 = [v12 initWithProfile:v13];
    builder = v11->_builder;
    v11->_builder = (HDActivitySummaryBuilder *)v14;

    uint64_t v16 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
    calendar = v11->_calendar;
    v11->_calendar = (NSCalendar *)v16;
  }
  return v11;
}

- (void)remote_activitySummariesForStartDateComponents:(id)a3 endDateComponents:(id)a4 includePrivateProperties:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, void, id))a6;
  v13 = HDActivityCacheEntityPredicateForCachesInDateComponentsRange();
  uint64_t v18 = 0;
  objc_super v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__18;
  v22 = __Block_byref_object_dispose__18;
  id v23 = objc_alloc_init(MEMORY[0x263EFF980]);
  [(HDActivitySummaryBuilder *)self->_builder setShouldIncludePrivateProperties:v7];
  builder = self->_builder;
  v16[4] = &v18;
  id v17 = 0;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __137__ACHActivitySummaryIteratorServer_remote_activitySummariesForStartDateComponents_endDateComponents_includePrivateProperties_completion___block_invoke;
  v16[3] = &unk_264517368;
  [(HDActivitySummaryBuilder *)builder enumerateActivitySummariesWithPredicate:v13 error:&v17 handler:v16];
  id v15 = v17;
  v12[2](v12, v19[5], v15);

  _Block_object_dispose(&v18, 8);
}

uint64_t __137__ACHActivitySummaryIteratorServer_remote_activitySummariesForStartDateComponents_endDateComponents_includePrivateProperties_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:a2];
}

- (id)exportedInterface
{
  v7[2] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D1281C0];
  id v3 = objc_alloc(MEMORY[0x263EFFA08]);
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];
  v5 = (void *)[v3 initWithArray:v4];
  [v2 setClasses:v5 forSelector:sel_remote_activitySummariesForStartDateComponents_endDateComponents_includePrivateProperties_completion_ argumentIndex:0 ofReply:1];

  return v2;
}

- (id)remoteInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D133AE8];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_builder, 0);
}

@end