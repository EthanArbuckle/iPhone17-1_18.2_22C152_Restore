@interface BLSHDisableAlwaysOnAttributeHandler
+ (Class)attributeBaseClass;
+ (id)attributeClasses;
+ (id)registerHandlerForService:(id)a3 provider:(id)a4;
- (id)initForService:(id)a3 provider:(id)a4;
- (void)activateWithFirstEntry:(id)a3;
- (void)deactivateWithFinalEntry:(id)a3;
@end

@implementation BLSHDisableAlwaysOnAttributeHandler

+ (id)registerHandlerForService:(id)a3 provider:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initForService:v7 provider:v6];

  [v8 setupService];

  return v8;
}

- (id)initForService:(id)a3 provider:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BLSHDisableAlwaysOnAttributeHandler;
  v8 = [(BLSHLocalCountingAssertionAttributeHandler *)&v11 initForService:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong(v8 + 6, a4);
  }

  return v9;
}

+ (id)attributeClasses
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];

  return v2;
}

+ (Class)attributeBaseClass
{
  return (Class)objc_opt_class();
}

- (void)activateWithFirstEntry:(id)a3
{
}

- (void)deactivateWithFinalEntry:(id)a3
{
}

- (void).cxx_destruct
{
}

@end