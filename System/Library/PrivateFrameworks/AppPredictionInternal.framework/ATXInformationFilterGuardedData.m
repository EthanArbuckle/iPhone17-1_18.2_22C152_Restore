@interface ATXInformationFilterGuardedData
- (ATXInformationFilterGuardedData)init;
@end

@implementation ATXInformationFilterGuardedData

- (ATXInformationFilterGuardedData)init
{
  v6.receiver = self;
  v6.super_class = (Class)ATXInformationFilterGuardedData;
  v2 = [(ATXInformationFilterGuardedData *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    dismissRecordsCache = v2->dismissRecordsCache;
    v2->dismissRecordsCache = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void).cxx_destruct
{
}

@end