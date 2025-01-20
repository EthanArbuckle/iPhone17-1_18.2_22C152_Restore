@interface NSString(FPAppLibrary)
+ (id)fp_defaultProviderDomainID;
+ (void)setFp_defaultProviderDomainID:()FPAppLibrary;
@end

@implementation NSString(FPAppLibrary)

+ (void)setFp_defaultProviderDomainID:()FPAppLibrary
{
  id v7 = a3;
  id v4 = a1;
  objc_sync_enter(v4);
  if (([(id)_defaultProviderDomainID isEqualToString:v7] & 1) == 0)
  {
    uint64_t v5 = [v7 copy];
    v6 = (void *)_defaultProviderDomainID;
    _defaultProviderDomainID = v5;
  }
  objc_sync_exit(v4);
}

+ (id)fp_defaultProviderDomainID
{
  id v1 = a1;
  objc_sync_enter(v1);
  v2 = (void *)[(id)_defaultProviderDomainID copy];
  objc_sync_exit(v1);

  return v2;
}

@end