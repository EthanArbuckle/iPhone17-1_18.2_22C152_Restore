@interface BLSHDisableCommitOnWakeMeasurementAttributeHandler
+ (Class)attributeBaseClass;
+ (id)attributeClasses;
+ (id)registerHandlerForService:(id)a3 provider:(id)a4;
- (id)initForService:(void *)a3 provider:;
- (void)activateWithFirstEntry:(id)a3;
- (void)deactivateWithFinalEntry:(id)a3;
@end

@implementation BLSHDisableCommitOnWakeMeasurementAttributeHandler

+ (id)registerHandlerForService:(id)a3 provider:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = -[BLSHDisableCommitOnWakeMeasurementAttributeHandler initForService:provider:]([BLSHDisableCommitOnWakeMeasurementAttributeHandler alloc], (uint64_t)v6, v5);

  [v7 setupService];

  return v7;
}

- (id)initForService:(void *)a3 provider:
{
  id v6 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)BLSHDisableCommitOnWakeMeasurementAttributeHandler;
    v7 = (id *)objc_msgSendSuper2(&v10, sel_initForService_, a2);
    v8 = v7;
    if (v7) {
      objc_storeStrong(v7 + 6, a3);
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
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