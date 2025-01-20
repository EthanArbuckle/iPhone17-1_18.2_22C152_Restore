@interface HKWorkoutRouteQuery
+ (Class)configurationClass;
+ (id)clientInterfaceProtocol;
+ (void)configureClientInterface:(id)a3;
- (HKWorkoutRouteQuery)initWithActiveWorkoutUUID:(id)a3 dataHandler:(id)a4;
- (HKWorkoutRouteQuery)initWithRoute:(HKWorkoutRoute *)workoutRoute dataHandler:(void *)dataHandler;
- (HKWorkoutRouteQuery)initWithRoute:(HKWorkoutRoute *)workoutRoute dateInterval:(NSDateInterval *)dateInterval dataHandler:(void *)dataHandler;
- (HKWorkoutRouteQuery)initWithRoute:(id)a3 workoutUUID:(id)a4 dateInterval:(id)a5 dataHandler:(id)a6;
- (id)dataHandler;
- (void)client_deliverWorkoutRouteLocations:(id)a3 isFinal:(BOOL)a4 query:(id)a5;
- (void)queue_deliverError:(id)a3;
- (void)queue_populateConfiguration:(id)a3;
- (void)queue_queryDidDeactivate:(id)a3;
@end

@implementation HKWorkoutRouteQuery

- (HKWorkoutRouteQuery)initWithRoute:(HKWorkoutRoute *)workoutRoute dataHandler:(void *)dataHandler
{
  v6 = workoutRoute;
  v7 = dataHandler;
  if (!v6) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "workoutRoute");
  }
  v8 = [(HKWorkoutRouteQuery *)self initWithRoute:v6 workoutUUID:0 dateInterval:0 dataHandler:v7];

  return v8;
}

- (HKWorkoutRouteQuery)initWithRoute:(HKWorkoutRoute *)workoutRoute dateInterval:(NSDateInterval *)dateInterval dataHandler:(void *)dataHandler
{
  v8 = workoutRoute;
  v9 = dateInterval;
  v10 = dataHandler;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "workoutRoute");
    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "dateInterval");
    goto LABEL_3;
  }
  if (!v9) {
    goto LABEL_5;
  }
LABEL_3:
  v11 = [(HKWorkoutRouteQuery *)self initWithRoute:v8 workoutUUID:0 dateInterval:v9 dataHandler:v10];

  return v11;
}

- (HKWorkoutRouteQuery)initWithActiveWorkoutUUID:(id)a3 dataHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "workoutUUID");
  }
  v8 = [(HKWorkoutRouteQuery *)self initWithRoute:0 workoutUUID:v6 dateInterval:0 dataHandler:v7];

  return v8;
}

- (HKWorkoutRouteQuery)initWithRoute:(id)a3 workoutUUID:(id)a4 dateInterval:(id)a5 dataHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v14) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "dataHandler");
  }
  v15 = +[HKSeriesType workoutRouteType];
  v20.receiver = self;
  v20.super_class = (Class)HKWorkoutRouteQuery;
  v16 = [(HKQuery *)&v20 _initWithObjectType:v15 predicate:0];

  if (v16)
  {
    v17 = _Block_copy(v14);
    id dataHandler = v16->_dataHandler;
    v16->_id dataHandler = v17;

    objc_storeStrong((id *)&v16->_series, a3);
    objc_storeStrong((id *)&v16->_workoutUUID, a4);
    objc_storeStrong((id *)&v16->_dateInterval, a5);
  }

  return v16;
}

- (void)client_deliverWorkoutRouteLocations:(id)a3 isFinal:(BOOL)a4 query:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [(HKQuery *)self queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__HKWorkoutRouteQuery_client_deliverWorkoutRouteLocations_isFinal_query___block_invoke;
  v13[3] = &unk_1E58BD7D8;
  v13[4] = self;
  id v14 = v9;
  BOOL v16 = a4;
  id v15 = v8;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(v10, v13);
}

void __73__HKWorkoutRouteQuery_client_deliverWorkoutRouteLocations_isFinal_query___block_invoke(uint64_t a1)
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__16;
  id v13 = __Block_byref_object_dispose__16;
  id v14 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 152));
  if (v10[5])
  {
    v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(unsigned __int8 *)(a1 + 56);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __73__HKWorkoutRouteQuery_client_deliverWorkoutRouteLocations_isFinal_query___block_invoke_12;
    v5[3] = &unk_1E58C1028;
    id v7 = &v9;
    v5[4] = v2;
    id v6 = *(id *)(a1 + 48);
    char v8 = *(unsigned char *)(a1 + 56);
    objc_msgSend(v2, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v3, v4, v5);
  }
  _Block_object_dispose(&v9, 8);
}

uint64_t __73__HKWorkoutRouteQuery_client_deliverWorkoutRouteLocations_isFinal_query___block_invoke_12(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                                       + 40)
                                                                           + 16))(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), 0);
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EED024D0;
}

+ (void)configureClientInterface:(id)a3
{
  id v4 = a3;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HKWorkoutRouteQuery;
  objc_msgSendSuper2(&v6, sel_configureClientInterface_, v4);
  id v5 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverWorkoutRouteLocations_isFinal_query_, 0, 0);
}

- (void)queue_populateConfiguration:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKWorkoutRouteQuery;
  id v4 = a3;
  [(HKQuery *)&v5 queue_populateConfiguration:v4];
  objc_msgSend(v4, "setWorkoutRoute:", self->_series, v5.receiver, v5.super_class);
  [v4 setWorkoutUUID:self->_workoutUUID];
  [v4 setDateInterval:self->_dateInterval];
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
    block[2] = __42__HKWorkoutRouteQuery_queue_deliverError___block_invoke;
    block[3] = &unk_1E58BB9A0;
    id v9 = v5;
    block[4] = self;
    id v8 = v4;
    dispatch_async(v6, block);
  }
}

uint64_t __42__HKWorkoutRouteQuery_queue_deliverError___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, uint64_t, void))(a1[6] + 16))(a1[6], a1[4], 0, 1, a1[5]);
}

- (void)queue_queryDidDeactivate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKWorkoutRouteQuery;
  [(HKQuery *)&v5 queue_queryDidDeactivate:a3];
  id dataHandler = self->_dataHandler;
  self->_id dataHandler = 0;
}

- (id)dataHandler
{
  return self->_dataHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_workoutUUID, 0);
  objc_storeStrong((id *)&self->_series, 0);

  objc_storeStrong(&self->_dataHandler, 0);
}

@end