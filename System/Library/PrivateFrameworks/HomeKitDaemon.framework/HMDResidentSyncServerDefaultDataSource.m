@interface HMDResidentSyncServerDefaultDataSource
- (int64_t)maximumTransactionsForSparseUpdate;
- (int64_t)maximumTransactionsForStoreChange;
@end

@implementation HMDResidentSyncServerDefaultDataSource

- (int64_t)maximumTransactionsForStoreChange
{
  v2 = [MEMORY[0x263F42608] sharedPreferences];
  v3 = [v2 preferenceForKey:@"residentSyncMaximumTransactionsForStoreChange"];
  v4 = [v3 numberValue];
  int64_t v5 = [v4 integerValue];

  if (v5 < 0) {
    return 1;
  }
  else {
    return v5;
  }
}

- (int64_t)maximumTransactionsForSparseUpdate
{
  v2 = [MEMORY[0x263F42608] sharedPreferences];
  v3 = [v2 preferenceForKey:@"residentSyncMaximumTransactionsForSparseUpdate"];
  v4 = [v3 numberValue];
  int64_t v5 = [v4 integerValue];

  return v5;
}

@end