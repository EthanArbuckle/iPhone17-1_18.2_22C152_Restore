@interface _HKActivityStatisticsQuery
+ (Class)configurationClass;
+ (id)clientInterfaceProtocol;
+ (void)configureClientInterface:(id)a3;
- (BOOL)queue_shouldDeactivateAfterInitialResults;
- (_HKActivityStatisticsQuery)initWithStartDate:(id)a3 endDate:(id)a4 moveIntervalComponents:(id)a5 exerciseIntervalComponents:(id)a6 initialQueryResultsHandler:(id)a7;
- (double)_updateInterval;
- (id)initialQueryResultsHandler;
- (id)queryUpdateHandler;
- (void)_setUpdateInterval:(double)a3;
- (void)_validateIntervalComponents:(id)a3;
- (void)client_deliverResult:(id)a3 query:(id)a4;
- (void)queue_deliverError:(id)a3;
- (void)queue_populateConfiguration:(id)a3;
- (void)queue_queryDidDeactivate:(id)a3;
- (void)queue_validate;
- (void)setInitialQueryResultsHandler:(id)a3;
- (void)setQueryUpdateHandler:(id)a3;
@end

@implementation _HKActivityStatisticsQuery

- (_HKActivityStatisticsQuery)initWithStartDate:(id)a3 endDate:(id)a4 moveIntervalComponents:(id)a5 exerciseIntervalComponents:(id)a6 initialQueryResultsHandler:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v27.receiver = self;
  v27.super_class = (Class)_HKActivityStatisticsQuery;
  v18 = [(HKQuery *)&v27 _initWithObjectType:0 predicate:0];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong(v18 + 20, a3);
    objc_storeStrong(v19 + 21, a4);
    uint64_t v20 = [v15 copy];
    id v21 = v19[22];
    v19[22] = (id)v20;

    uint64_t v22 = [v16 copy];
    id v23 = v19[23];
    v19[23] = (id)v22;

    uint64_t v24 = [v17 copy];
    id v25 = v19[25];
    v19[25] = (id)v24;

    v19[26] = (id)0x4014000000000000;
  }

  return (_HKActivityStatisticsQuery *)v19;
}

- (void)setQueryUpdateHandler:(id)a3
{
  id v5 = a3;
  [(HKQuery *)self _throwInvalidArgumentExceptionIfHasBeenExecuted:a2];
  v6 = [(HKQuery *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52___HKActivityStatisticsQuery_setQueryUpdateHandler___block_invoke;
  v8[3] = &unk_1E58BB978;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_sync(v6, v8);
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EED12198;
}

+ (void)configureClientInterface:(id)a3
{
  id v4 = a3;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS____HKActivityStatisticsQuery;
  objc_msgSendSuper2(&v6, sel_configureClientInterface_, v4);
  id v5 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverResult_query_, 0, 0);
}

- (void)queue_populateConfiguration:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_HKActivityStatisticsQuery;
  id v4 = a3;
  [(HKQuery *)&v5 queue_populateConfiguration:v4];
  objc_msgSend(v4, "setStartDate:", self->_startDate, v5.receiver, v5.super_class);
  [v4 setEndDate:self->_endDate];
  [v4 setMoveIntervalComponents:self->_moveIntervalComponents];
  [v4 setExerciseIntervalComponents:self->_exerciseIntervalComponents];
  [v4 setUpdateInterval:self->_updateInterval];
}

- (void)queue_queryDidDeactivate:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_HKActivityStatisticsQuery;
  [(HKQuery *)&v6 queue_queryDidDeactivate:a3];
  id initialQueryResultsHandler = self->_initialQueryResultsHandler;
  self->_id initialQueryResultsHandler = 0;

  id queryUpdateHandler = self->_queryUpdateHandler;
  self->_id queryUpdateHandler = 0;
}

- (BOOL)queue_shouldDeactivateAfterInitialResults
{
  return self->_queryUpdateHandler == 0;
}

- (void)queue_validate
{
  v5.receiver = self;
  v5.super_class = (Class)_HKActivityStatisticsQuery;
  [(HKQuery *)&v5 queue_validate];
  [(_HKActivityStatisticsQuery *)self _validateIntervalComponents:self->_moveIntervalComponents];
  [(_HKActivityStatisticsQuery *)self _validateIntervalComponents:self->_exerciseIntervalComponents];
  v3 = [(HKQuery *)self objectType];

  id v4 = (void *)MEMORY[0x1E4F1C3C8];
  if (v3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@ cannot have an objectType", objc_opt_class() format];
  }
  if (!self->_initialQueryResultsHandler) {
    [MEMORY[0x1E4F1CA00] raise:*v4, @"%@ initialQueryResultsHandler cannot be nil", objc_opt_class() format];
  }
}

- (void)_validateIntervalComponents:(id)a3
{
  id v3 = a3;
  id v5 = v3;
  if (!v3)
  {
    [MEMORY[0x1E4F1CA00] raise:@"HKQueryValidationFailureException", @"%@ interval components cannot be nil", objc_opt_class() format];
    id v3 = 0;
  }
  if (objc_msgSend(v3, "hk_maxComponentValue") < 1 || (objc_msgSend(v5, "hk_approximateDuration"), v4 <= 0.0)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@ statistics interval must be greater than zero: %@", objc_opt_class(), v5 format];
  }
}

- (void)queue_deliverError:(id)a3
{
  id v4 = a3;
  if (self->_deliveredInitial)
  {
    id v5 = _Block_copy(self->_queryUpdateHandler);
    if (v5)
    {
      objc_super v6 = [(HKQuery *)self clientQueue];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __49___HKActivityStatisticsQuery_queue_deliverError___block_invoke;
      v13[3] = &unk_1E58BB9A0;
      id v7 = &v15;
      id v5 = v5;
      id v15 = v5;
      v13[4] = self;
      v8 = &v14;
      id v14 = v4;
      id v9 = v13;
LABEL_6:
      dispatch_async(v6, v9);
    }
  }
  else
  {
    id v5 = _Block_copy(self->_initialQueryResultsHandler);
    if (v5)
    {
      objc_super v6 = [(HKQuery *)self clientQueue];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __49___HKActivityStatisticsQuery_queue_deliverError___block_invoke_2;
      v10[3] = &unk_1E58BB9A0;
      id v7 = &v12;
      id v5 = v5;
      id v12 = v5;
      v10[4] = self;
      v8 = &v11;
      id v11 = v4;
      id v9 = v10;
      goto LABEL_6;
    }
  }
}

- (void)client_deliverResult:(id)a3 query:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HKQuery *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57___HKActivityStatisticsQuery_client_deliverResult_query___block_invoke;
  block[3] = &unk_1E58BB9C8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (id)queryUpdateHandler
{
  return self->_queryUpdateHandler;
}

- (id)initialQueryResultsHandler
{
  return self->_initialQueryResultsHandler;
}

- (void)setInitialQueryResultsHandler:(id)a3
{
}

- (double)_updateInterval
{
  return self->_updateInterval;
}

- (void)_setUpdateInterval:(double)a3
{
  self->_updateInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_initialQueryResultsHandler, 0);
  objc_storeStrong(&self->_queryUpdateHandler, 0);
  objc_storeStrong((id *)&self->_exerciseIntervalComponents, 0);
  objc_storeStrong((id *)&self->_moveIntervalComponents, 0);
  objc_storeStrong((id *)&self->_endDate, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

@end