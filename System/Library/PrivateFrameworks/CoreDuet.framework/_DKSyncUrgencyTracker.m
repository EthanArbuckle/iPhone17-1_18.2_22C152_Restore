@interface _DKSyncUrgencyTracker
+ (id)sharedInstance;
- (id)allUrgencies;
- (uint64_t)ageUrgencies;
- (uint64_t)urgencyForClient:(uint64_t)result;
- (void)recomputeUrgency;
- (void)updateUrgency:(void *)a3 forClient:;
@end

@implementation _DKSyncUrgencyTracker

- (void)updateUrgency:(void *)a3 forClient:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a1)
  {
    v6 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v6);

    if (a2 >= 0xC)
    {
      v7 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v18 = [(id)objc_opt_class() description];
        v19 = [NSNumber numberWithUnsignedInteger:a2];
        int v20 = 138543874;
        v21 = v18;
        __int16 v22 = 2112;
        id v23 = v5;
        __int16 v24 = 2112;
        v25 = v19;
        _os_log_error_impl(&dword_18ECEB000, v7, OS_LOG_TYPE_ERROR, "%{public}@: Invalid urgency from %@: %@", (uint8_t *)&v20, 0x20u);
      }
      a2 = 10;
    }
    v8 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [(id)objc_opt_class() description];
      v10 = [NSNumber numberWithUnsignedInteger:a2];
      int v20 = 138543874;
      v21 = v9;
      __int16 v22 = 2112;
      id v23 = v5;
      __int16 v24 = 2112;
      v25 = v10;
      _os_log_impl(&dword_18ECEB000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Updating urgency for %@ to %@", (uint8_t *)&v20, 0x20u);
    }
    id v11 = a1[2];
    if (!v11)
    {
      uint64_t v12 = objc_opt_new();
      id v13 = a1[2];
      a1[2] = (id)v12;

      id v11 = a1[2];
    }
    v14 = [v11 objectForKeyedSubscript:v5];
    if (v14)
    {
      v15 = [NSNumber numberWithUnsignedInteger:a2];
      char v16 = [v14 isEqualToNumber:v15];

      if ((v16 & 1) == 0)
      {
        if (!a2)
        {
          [a1[2] setObject:0 forKeyedSubscript:v5];
LABEL_16:
          [a1 recomputeUrgency];
          goto LABEL_17;
        }
LABEL_15:
        v17 = [NSNumber numberWithUnsignedInteger:a2];
        [a1[2] setObject:v17 forKeyedSubscript:v5];

        goto LABEL_16;
      }
    }
    else if (a2)
    {
      goto LABEL_15;
    }
LABEL_17:
  }
}

+ (id)sharedInstance
{
  self;
  if (sharedInstance_initialized_4 != -1) {
    dispatch_once(&sharedInstance_initialized_4, &__block_literal_global_73);
  }
  v0 = (void *)sharedInstance_tracker;
  return v0;
}

- (uint64_t)urgencyForClient:(uint64_t)result
{
  if (result)
  {
    v2 = [*(id *)(result + 16) objectForKeyedSubscript:a2];
    uint64_t v3 = [v2 unsignedIntegerValue];

    return v3;
  }
  return result;
}

- (id)allUrgencies
{
  if (a1)
  {
    a1 = (id *)[a1[2] copy];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (uint64_t)ageUrgencies
{
  if (result)
  {
    uint64_t v1 = (void *)result;
    v2 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v2);

    uint64_t v3 = objc_opt_new();
    v4 = (void *)v1[2];
    v1[2] = v3;

    return [v1 recomputeUrgency];
  }
  return result;
}

- (void)recomputeUrgency
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v3 = self->_urgencies;
  uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v3);
        }
        unint64_t v9 = -[_DKSyncUrgencyTracker urgencyForClient:]((uint64_t)self, *(void *)(*((void *)&v13 + 1) + 8 * i));
        if (v6 <= v9) {
          unint64_t v6 = v9;
        }
      }
      uint64_t v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  if (v6 != self->_urgency)
  {
    self->_urgency = v6;
    v10 = +[_CDObservationCenter sharedInstance];
    v17 = @"urgency";
    id v11 = [NSNumber numberWithUnsignedInteger:self->_urgency];
    v18 = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    [v10 postNotificationName:@"_DKSyncUrgencyDidChangeNotification" userInfo:v12 sender:self];
  }
}

- (void).cxx_destruct
{
}

@end