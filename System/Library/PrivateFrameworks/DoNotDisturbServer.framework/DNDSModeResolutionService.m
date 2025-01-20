@interface DNDSModeResolutionService
- (BOOL)_preferModeAssertion:(id)a3 toModeAssertion:(id)a4;
- (id)recalculateModeForSnapshot:(id)a3;
- (unint64_t)_priorityForModeAssertion:(id)a3;
@end

@implementation DNDSModeResolutionService

- (id)recalculateModeForSnapshot:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 assertions];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v6 = [v3 assertions];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      v9 = 0;
      uint64_t v10 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v6);
          }
          v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          v13 = [v3 activeAssertionUUIDs];
          v14 = [v12 UUID];
          int v15 = [v13 containsObject:v14];

          if (v15
            && [(DNDSModeResolutionService *)self _preferModeAssertion:v12 toModeAssertion:v9])
          {
            id v16 = v12;

            v9 = v16;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }
  v17 = [v9 details];
  v18 = [v17 modeIdentifier];

  return v18;
}

- (BOOL)_preferModeAssertion:(id)a3 toModeAssertion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7) {
    unint64_t v8 = [(DNDSModeResolutionService *)self _priorityForModeAssertion:v7];
  }
  else {
    unint64_t v8 = 0;
  }
  unint64_t v9 = [(DNDSModeResolutionService *)self _priorityForModeAssertion:v6];
  if (v9 <= v8)
  {
    if (v9 == v8)
    {
      v11 = [v7 startDate];
      v12 = [v6 startDate];
      BOOL v10 = [v11 compare:v12] == -1;
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

- (unint64_t)_priorityForModeAssertion:(id)a3
{
  id v3 = a3;
  v4 = [v3 source];
  uint64_t v5 = [v4 clientIdentifier];

  id v6 = [v3 details];

  uint64_t v7 = [v6 modeIdentifier];
  unint64_t v8 = (void *)v7;
  unint64_t v9 = @"*";
  if (v7) {
    unint64_t v9 = (__CFString *)v7;
  }
  BOOL v10 = v9;

  if (_intersect_clientIdentifier_modeIdentifier_priority_onceToken != -1) {
    dispatch_once(&_intersect_clientIdentifier_modeIdentifier_priority_onceToken, &__block_literal_global_32);
  }
  id v11 = (id)_intersect_clientIdentifier_modeIdentifier_priority_dict;
  v12 = v5;
  v13 = v12;
  if ([(__CFString *)v12 hasSuffix:@".private.schedule"])
  {
    v13 = @"com.apple.donotdisturb.private.schedule";
  }
  if ([(__CFString *)v12 containsString:@".private.region."])
  {

    v13 = @"com.apple.donotdisturb.private.region";
  }
  v14 = [v11 objectForKey:v13];
  if (!v14)
  {
    v14 = [v11 objectForKey:@"*"];
  }
  int v15 = [v14 objectForKey:v10];
  if (!v15)
  {
    int v15 = [v14 objectForKey:@"*"];
  }
  unint64_t v16 = [v15 unsignedIntegerValue];

  return v16;
}

@end