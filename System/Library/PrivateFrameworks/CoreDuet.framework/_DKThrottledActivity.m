@interface _DKThrottledActivity
+ (id)standardInstance;
- (_DKSimpleKeyValueStore)store;
- (_DKThrottledActivity)initWithStore:(id)a3 namespace:(id)a4;
- (id)activityThrottler;
- (id)description;
- (void)clearHistoryForName:(id)a3;
- (void)performNoMoreOftenInDaysThan:(double)a3 name:(id)a4 activityBlock:(id)a5;
- (void)performNoMoreOftenInDaysThan:(double)a3 name:(id)a4 activityBlock:(id)a5 throttleBlock:(id)a6;
- (void)performNoMoreOftenInHoursThan:(double)a3 name:(id)a4 activityBlock:(id)a5;
- (void)performNoMoreOftenInHoursThan:(double)a3 name:(id)a4 activityBlock:(id)a5 throttleBlock:(id)a6;
- (void)performNoMoreOftenInMinutesThan:(double)a3 name:(id)a4 activityBlock:(id)a5;
- (void)performNoMoreOftenInMinutesThan:(double)a3 name:(id)a4 activityBlock:(id)a5 throttleBlock:(id)a6;
- (void)performNoMoreOftenInMinutesThan:(double)a3 name:(id)a4 queue:(id)a5 activityBlock:(id)a6 throttleBlock:(id)a7;
- (void)performNoMoreOftenInSecondsThan:(double)a3 name:(id)a4 activityBlock:(id)a5;
- (void)performNoMoreOftenInSecondsThan:(double)a3 name:(id)a4 activityBlock:(id)a5 throttleBlock:(id)a6;
- (void)performWithDelayInDaysOf:(double)a3 name:(id)a4 queue:(id)a5 activityBlock:(id)a6;
- (void)performWithDelayInHoursOf:(double)a3 name:(id)a4 queue:(id)a5 activityBlock:(id)a6;
- (void)performWithDelayInMinutesOf:(double)a3 name:(id)a4 queue:(id)a5 activityBlock:(id)a6;
- (void)performWithDelayInSecondsOf:(double)a3 name:(id)a4 queue:(id)a5 activityBlock:(id)a6;
- (void)performWithMinimumIntervalInDaysOf:(double)a3 name:(id)a4 queue:(id)a5 activityBlock:(id)a6;
- (void)performWithMinimumIntervalInHoursOf:(double)a3 name:(id)a4 queue:(id)a5 activityBlock:(id)a6;
- (void)performWithMinimumIntervalInMinutesOf:(double)a3 name:(id)a4 queue:(id)a5 activityBlock:(id)a6;
- (void)performWithMinimumIntervalInSecondsOf:(double)a3 name:(id)a4 queue:(id)a5 activityBlock:(id)a6;
- (void)setDate:(id)a3 forName:(id)a4;
@end

@implementation _DKThrottledActivity

+ (id)standardInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40___DKThrottledActivity_standardInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (standardInstance_initialized != -1) {
    dispatch_once(&standardInstance_initialized, block);
  }
  v2 = (void *)standardInstance_standardInstance;
  return v2;
}

- (_DKThrottledActivity)initWithStore:(id)a3 namespace:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_DKThrottledActivity;
  v9 = [(_DKThrottledActivity *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_store, a3);
    objc_storeStrong((id *)&v10->_namespace, a4);
  }

  return v10;
}

- (id)activityThrottler
{
  if (a1)
  {
    if (activityThrottler_initialized != -1) {
      dispatch_once(&activityThrottler_initialized, &__block_literal_global_48);
    }
    id v2 = (id)activityThrottler_sharedInstances;
    objc_sync_enter(v2);
    v3 = [(id)activityThrottler_sharedInstances objectForKeyedSubscript:*(void *)(a1 + 8)];
    if (!v3)
    {
      v3 = -[_DKActivityThrottler initWithStore:]([_DKActivityThrottler alloc], *(void **)(a1 + 16));
      [(id)activityThrottler_sharedInstances setObject:v3 forKeyedSubscript:*(void *)(a1 + 8)];
    }
    objc_sync_exit(v2);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)performNoMoreOftenInSecondsThan:(double)a3 name:(id)a4 activityBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  -[_DKThrottledActivity activityThrottler]((uint64_t)self);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKActivityThrottler _performNoMoreOftenInSecondsThan:name:activityBlock:throttleBlock:](v10, v9, v8, 0, a3);
}

- (void)performNoMoreOftenInSecondsThan:(double)a3 name:(id)a4 activityBlock:(id)a5 throttleBlock:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  -[_DKThrottledActivity activityThrottler]((uint64_t)self);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKActivityThrottler _performNoMoreOftenInSecondsThan:name:activityBlock:throttleBlock:](v13, v12, v11, v10, a3);
}

- (void)performNoMoreOftenInMinutesThan:(double)a3 name:(id)a4 activityBlock:(id)a5
{
  double v7 = a3 * 60.0;
  id v8 = a5;
  id v9 = a4;
  -[_DKThrottledActivity activityThrottler]((uint64_t)self);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKActivityThrottler _performNoMoreOftenInSecondsThan:name:activityBlock:throttleBlock:](v10, v9, v8, 0, v7);
}

- (void)performNoMoreOftenInMinutesThan:(double)a3 name:(id)a4 activityBlock:(id)a5 throttleBlock:(id)a6
{
  double v9 = a3 * 60.0;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  -[_DKThrottledActivity activityThrottler]((uint64_t)self);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKActivityThrottler _performNoMoreOftenInSecondsThan:name:activityBlock:throttleBlock:](v13, v12, v11, v10, v9);
}

- (void)performNoMoreOftenInMinutesThan:(double)a3 name:(id)a4 queue:(id)a5 activityBlock:(id)a6 throttleBlock:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  double v16 = a3 * 60.0;
  v17 = -[_DKThrottledActivity activityThrottler]((uint64_t)self);
  -[_DKActivityThrottler _performNoMoreOftenInSecondsThan:name:activityBlock:throttleBlock:](v17, v12, v14, v15, v16);
  v18 = dispatch_get_current_queue();

  if (v18 == v13)
  {
    -[_DKActivityThrottler _performNoMoreOftenInSecondsThan:name:activityBlock:throttleBlock:](v17, v12, v14, v15, v16);
  }
  else
  {
    id v19 = v12;
    [v19 UTF8String];
    v20 = (void *)os_transaction_create();
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __95___DKThrottledActivity_performNoMoreOftenInMinutesThan_name_queue_activityBlock_throttleBlock___block_invoke;
    v22[3] = &unk_1E560F9A0;
    id v23 = v17;
    double v28 = v16;
    id v24 = v19;
    id v26 = v14;
    id v27 = v15;
    id v25 = v20;
    id v21 = v20;
    dispatch_async(v13, v22);
  }
}

- (void)performNoMoreOftenInHoursThan:(double)a3 name:(id)a4 activityBlock:(id)a5
{
  double v7 = a3 * 60.0 * 60.0;
  id v8 = a5;
  id v9 = a4;
  -[_DKThrottledActivity activityThrottler]((uint64_t)self);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKActivityThrottler _performNoMoreOftenInSecondsThan:name:activityBlock:throttleBlock:](v10, v9, v8, 0, v7);
}

- (void)performNoMoreOftenInHoursThan:(double)a3 name:(id)a4 activityBlock:(id)a5 throttleBlock:(id)a6
{
  double v9 = a3 * 60.0 * 60.0;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  -[_DKThrottledActivity activityThrottler]((uint64_t)self);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKActivityThrottler _performNoMoreOftenInSecondsThan:name:activityBlock:throttleBlock:](v13, v12, v11, v10, v9);
}

- (void)performNoMoreOftenInDaysThan:(double)a3 name:(id)a4 activityBlock:(id)a5
{
  double v7 = a3 * 24.0 * 60.0 * 60.0;
  id v8 = a5;
  id v9 = a4;
  -[_DKThrottledActivity activityThrottler]((uint64_t)self);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKActivityThrottler _performNoMoreOftenInSecondsThan:name:activityBlock:throttleBlock:](v10, v9, v8, 0, v7);
}

- (void)performNoMoreOftenInDaysThan:(double)a3 name:(id)a4 activityBlock:(id)a5 throttleBlock:(id)a6
{
  double v9 = a3 * 24.0 * 60.0 * 60.0;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  -[_DKThrottledActivity activityThrottler]((uint64_t)self);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKActivityThrottler _performNoMoreOftenInSecondsThan:name:activityBlock:throttleBlock:](v13, v12, v11, v10, v9);
}

- (void)performWithMinimumIntervalInSecondsOf:(double)a3 name:(id)a4 queue:(id)a5 activityBlock:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  -[_DKThrottledActivity activityThrottler]((uint64_t)self);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKActivityThrottler _performOrScheduleWithTimeInterval:name:queue:activityBlock:callDepth:](v13, v12, v11, v10, 0, a3);
}

- (void)performWithMinimumIntervalInMinutesOf:(double)a3 name:(id)a4 queue:(id)a5 activityBlock:(id)a6
{
  double v9 = a3 * 60.0;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  -[_DKThrottledActivity activityThrottler]((uint64_t)self);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKActivityThrottler _performOrScheduleWithTimeInterval:name:queue:activityBlock:callDepth:](v13, v12, v11, v10, 0, v9);
}

- (void)performWithMinimumIntervalInHoursOf:(double)a3 name:(id)a4 queue:(id)a5 activityBlock:(id)a6
{
  double v9 = a3 * 60.0 * 60.0;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  -[_DKThrottledActivity activityThrottler]((uint64_t)self);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKActivityThrottler _performOrScheduleWithTimeInterval:name:queue:activityBlock:callDepth:](v13, v12, v11, v10, 0, v9);
}

- (void)performWithMinimumIntervalInDaysOf:(double)a3 name:(id)a4 queue:(id)a5 activityBlock:(id)a6
{
  double v9 = a3 * 24.0 * 60.0 * 60.0;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  -[_DKThrottledActivity activityThrottler]((uint64_t)self);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKActivityThrottler _performOrScheduleWithTimeInterval:name:queue:activityBlock:callDepth:](v13, v12, v11, v10, 0, v9);
}

- (void)performWithDelayInSecondsOf:(double)a3 name:(id)a4 queue:(id)a5 activityBlock:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  -[_DKThrottledActivity activityThrottler]((uint64_t)self);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKActivityThrottler _performWithDelayInSecondsOf:name:queue:activityBlock:](v13, v12, v11, v10, a3);
}

- (void)performWithDelayInMinutesOf:(double)a3 name:(id)a4 queue:(id)a5 activityBlock:(id)a6
{
  double v9 = a3 * 60.0;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  -[_DKThrottledActivity activityThrottler]((uint64_t)self);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKActivityThrottler _performWithDelayInSecondsOf:name:queue:activityBlock:](v13, v12, v11, v10, v9);
}

- (void)performWithDelayInHoursOf:(double)a3 name:(id)a4 queue:(id)a5 activityBlock:(id)a6
{
  double v9 = a3 * 60.0 * 60.0;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  -[_DKThrottledActivity activityThrottler]((uint64_t)self);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKActivityThrottler _performWithDelayInSecondsOf:name:queue:activityBlock:](v13, v12, v11, v10, v9);
}

- (void)performWithDelayInDaysOf:(double)a3 name:(id)a4 queue:(id)a5 activityBlock:(id)a6
{
  double v9 = a3 * 24.0 * 60.0 * 60.0;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  -[_DKThrottledActivity activityThrottler]((uint64_t)self);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKActivityThrottler _performWithDelayInSecondsOf:name:queue:activityBlock:](v13, v12, v11, v10, v9);
}

- (id)description
{
  v3 = -[_DKThrottledActivity activityThrottler]((uint64_t)self);
  v4 = NSString;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  double v7 = [v4 stringWithFormat:@"<%@ %p: %@>", v6, self, v3];

  return v7;
}

- (void)clearHistoryForName:(id)a3
{
  id v4 = a3;
  -[_DKThrottledActivity activityThrottler]((uint64_t)self);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKActivityThrottler clearHistoryForName:](v5, v4);
}

- (void)setDate:(id)a3 forName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[_DKThrottledActivity activityThrottler]((uint64_t)self);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = -[_DKActivityThrottler keyForName:](v9, (uint64_t)v6);

  -[_DKActivityThrottler setDate:forKey:]((uint64_t)v9, v7, v8);
}

- (_DKSimpleKeyValueStore)store
{
  return self->_store;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_namespace, 0);
}

@end