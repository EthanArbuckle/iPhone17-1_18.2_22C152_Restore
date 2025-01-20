@interface ATXDigitalHealthBlacklistGuardedData
- (ATXDigitalHealthBlacklistGuardedData)init;
@end

@implementation ATXDigitalHealthBlacklistGuardedData

- (ATXDigitalHealthBlacklistGuardedData)init
{
  v6.receiver = self;
  v6.super_class = (Class)ATXDigitalHealthBlacklistGuardedData;
  v2 = [(ATXDigitalHealthBlacklistGuardedData *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    blacklistedBundleIds = v2->_blacklistedBundleIds;
    v2->_blacklistedBundleIds = (NSSet *)v3;
  }
  return v2;
}

- (void).cxx_destruct
{
}

@end