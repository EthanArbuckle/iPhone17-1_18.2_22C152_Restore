@interface FedStatsCohortQueryLocale
+ (id)cohortInstance;
- (FedStatsCohortQueryLocale)init;
- (NSString)deviceLocale;
@end

@implementation FedStatsCohortQueryLocale

- (FedStatsCohortQueryLocale)init
{
  v11.receiver = self;
  v11.super_class = (Class)FedStatsCohortQueryLocale;
  v2 = [(FedStatsCohortQueryLocale *)&v11 init];
  if (v2)
  {
    v3 = NSString;
    v4 = [MEMORY[0x263EFF960] preferredLanguages];
    v5 = [v4 firstObject];
    v6 = [MEMORY[0x263EFF960] currentLocale];
    v7 = [v6 objectForKey:*MEMORY[0x263EFF4D0]];
    uint64_t v8 = [v3 stringWithFormat:@"%@_%@", v5, v7];
    deviceLocale = v2->_deviceLocale;
    v2->_deviceLocale = (NSString *)v8;
  }
  return v2;
}

+ (id)cohortInstance
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)deviceLocale
{
  return self->_deviceLocale;
}

- (void).cxx_destruct
{
}

@end