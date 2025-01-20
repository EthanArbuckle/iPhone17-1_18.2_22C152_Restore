@interface AdAttributionKitBridge
+ (void)getDeveloperModeEnabledWithCompletion:(id)a3;
+ (void)setDeveloperModeEnabled:(BOOL)a3 completion:(id)a4;
- (_TtC17DeveloperSettings22AdAttributionKitBridge)init;
@end

@implementation AdAttributionKitBridge

+ (void)getDeveloperModeEnabledWithCompletion:(id)a3
{
  v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  _s17DeveloperSettings22AdAttributionKitBridgeC03getA11ModeEnabled10completionyySbc_tFZ_0((uint64_t)sub_22404, v4);

  swift_release();
}

+ (void)setDeveloperModeEnabled:(BOOL)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  _s17DeveloperSettings22AdAttributionKitBridgeC03setA11ModeEnabled_10completionySb_yyctFZ_0(a3, (uint64_t)sub_223F4, v6);

  swift_release();
}

- (_TtC17DeveloperSettings22AdAttributionKitBridge)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(AdAttributionKitBridge *)&v3 init];
}

@end