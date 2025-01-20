@interface MSNanoPreferencesSyncDomainAccessorFactory
+ (id)createAccessorWithDomain:(id)a3;
@end

@implementation MSNanoPreferencesSyncDomainAccessorFactory

+ (id)createAccessorWithDomain:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:v3];

  return v4;
}

@end