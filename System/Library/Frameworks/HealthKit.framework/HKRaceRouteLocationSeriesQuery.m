@interface HKRaceRouteLocationSeriesQuery
+ (Class)configurationClass;
+ (id)clientInterfaceProtocol;
+ (void)configureClientInterface:(id)a3;
- (HKRaceRouteLocationSeriesQuery)initWithClusterUUID:(id)a3 workoutSelection:(unint64_t)a4 timestampAnchor:(double)a5 limit:(unint64_t)a6 dataHandler:(id)a7;
- (HKRaceRouteLocationSeriesQuery)initWithWorkoutUUID:(id)a3 timestampAnchor:(double)a4 limit:(unint64_t)a5 dataHandler:(id)a6;
- (void)client_deliverRaceRouteLocations:(id)a3 isFinal:(BOOL)a4 query:(id)a5;
- (void)queue_deliverError:(id)a3;
- (void)queue_populateConfiguration:(id)a3;
- (void)queue_queryDidDeactivate:(id)a3;
@end

@implementation HKRaceRouteLocationSeriesQuery

- (HKRaceRouteLocationSeriesQuery)initWithClusterUUID:(id)a3 workoutSelection:(unint64_t)a4 timestampAnchor:(double)a5 limit:(unint64_t)a6 dataHandler:(id)a7
{
  id v13 = a3;
  id v14 = a7;
  v15 = +[HKSeriesType workoutRouteType];
  v22.receiver = self;
  v22.super_class = (Class)HKRaceRouteLocationSeriesQuery;
  v16 = [(HKQuery *)&v22 _initWithObjectType:v15 predicate:0];

  if (v16)
  {
    objc_storeStrong((id *)&v16->_clusterUUID, a3);
    v16->_workoutSelection = a4;
    v16->_timestampAnchor = a5;
    v16->_limit = a6;
    v17 = _Block_copy(v14);
    id dataHandler = v16->_dataHandler;
    v16->_id dataHandler = v17;

    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    results = v16->_results;
    v16->_results = v19;
  }
  return v16;
}

- (HKRaceRouteLocationSeriesQuery)initWithWorkoutUUID:(id)a3 timestampAnchor:(double)a4 limit:(unint64_t)a5 dataHandler:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  id v13 = +[HKSeriesType workoutRouteType];
  v20.receiver = self;
  v20.super_class = (Class)HKRaceRouteLocationSeriesQuery;
  id v14 = [(HKQuery *)&v20 _initWithObjectType:v13 predicate:0];

  if (v14)
  {
    objc_storeStrong((id *)&v14->_workoutUUID, a3);
    v14->_timestampAnchor = a4;
    v14->_limit = a5;
    v15 = _Block_copy(v12);
    id dataHandler = v14->_dataHandler;
    v14->_id dataHandler = v15;

    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    results = v14->_results;
    v14->_results = v17;
  }
  return v14;
}

- (void)client_deliverRaceRouteLocations:(id)a3 isFinal:(BOOL)a4 query:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [(HKQuery *)self queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __81__HKRaceRouteLocationSeriesQuery_client_deliverRaceRouteLocations_isFinal_query___block_invoke;
  v13[3] = &unk_1E58BD7D8;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

void __81__HKRaceRouteLocationSeriesQuery_client_deliverRaceRouteLocations_isFinal_query___block_invoke(uint64_t a1)
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__6;
  id v15 = __Block_byref_object_dispose__6;
  id v16 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 192));
  if (v12[5])
  {
    [*(id *)(*(void *)(a1 + 32) + 200) addObjectsFromArray:*(void *)(a1 + 40)];
    if (*(unsigned char *)(a1 + 56))
    {
      id v2 = *(id *)(*(void *)(a1 + 32) + 200);
      uint64_t v3 = *(void *)(a1 + 32);
      v4 = *(void **)(v3 + 200);
      *(void *)(v3 + 200) = 0;

      v5 = *(void **)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 48);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __81__HKRaceRouteLocationSeriesQuery_client_deliverRaceRouteLocations_isFinal_query___block_invoke_5;
      v8[3] = &unk_1E58BBAC8;
      v10 = &v11;
      v8[4] = v5;
      id v7 = v2;
      id v9 = v7;
      objc_msgSend(v5, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v6, 1, v8);
    }
  }
  _Block_object_dispose(&v11, 8);
}

uint64_t __81__HKRaceRouteLocationSeriesQuery_client_deliverRaceRouteLocations_isFinal_query___block_invoke_5(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(*(void *)(a1[6] + 8) + 40) + 16))(*(void *)(*(void *)(a1[6] + 8) + 40), a1[4], a1[5], 0);
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EECF7800;
}

+ (void)configureClientInterface:(id)a3
{
  id v4 = a3;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HKRaceRouteLocationSeriesQuery;
  objc_msgSendSuper2(&v6, sel_configureClientInterface_, v4);
  id v5 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverRaceRouteLocations_isFinal_query_, 0, 0);
}

- (void)queue_populateConfiguration:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKRaceRouteLocationSeriesQuery;
  id v4 = a3;
  [(HKQuery *)&v5 queue_populateConfiguration:v4];
  objc_msgSend(v4, "setClusterUUID:", self->_clusterUUID, v5.receiver, v5.super_class);
  [v4 setWorkoutSelection:self->_workoutSelection];
  [v4 setWorkoutUUID:self->_workoutUUID];
  [v4 setTimestampAnchor:self->_timestampAnchor];
  [v4 setLimit:self->_limit];
}

- (void)queue_deliverError:(id)a3
{
  id v4 = a3;
  objc_super v5 = _Block_copy(self->_dataHandler);
  if (v5)
  {
    objc_super v6 = [(HKQuery *)self clientQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__HKRaceRouteLocationSeriesQuery_queue_deliverError___block_invoke;
    block[3] = &unk_1E58BB9A0;
    id v9 = v5;
    block[4] = self;
    id v8 = v4;
    dispatch_async(v6, block);
  }
}

uint64_t __53__HKRaceRouteLocationSeriesQuery_queue_deliverError___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

- (void)queue_queryDidDeactivate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKRaceRouteLocationSeriesQuery;
  [(HKQuery *)&v5 queue_queryDidDeactivate:a3];
  id dataHandler = self->_dataHandler;
  self->_id dataHandler = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong(&self->_dataHandler, 0);
  objc_storeStrong((id *)&self->_workoutUUID, 0);

  objc_storeStrong((id *)&self->_clusterUUID, 0);
}

@end