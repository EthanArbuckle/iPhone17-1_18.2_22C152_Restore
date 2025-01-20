@interface CKTextEffectCoordinatorConfiguration
- (CKTextEffectCoordinatorConfiguration)init;
- (CKTextEffectCoordinatorConfiguration)initWithLogIdentifier:(id)a3;
- (CKTextEffectCoordinatorConfiguration)initWithLogIdentifier:(id)a3 timeAfterLastAnimationInSeconds:(double)a4;
@end

@implementation CKTextEffectCoordinatorConfiguration

- (CKTextEffectCoordinatorConfiguration)initWithLogIdentifier:(id)a3 timeAfterLastAnimationInSeconds:(double)a4
{
  uint64_t v5 = sub_18F7B97E0();
  CKTextEffectCoordinator.Configuration.init(logIdentifier:timeAfterLastAnimationInSeconds:)(v5, v6, a4);
  return result;
}

- (CKTextEffectCoordinatorConfiguration)initWithLogIdentifier:(id)a3
{
  uint64_t v3 = sub_18F7B97E0();
  uint64_t v5 = v4;
  swift_getObjectType();
  uint64_t v6 = sub_18F7B93A0();
  __n128 v7 = MEMORY[0x1F4188790](v6);
  v9 = (uint64_t *)((char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  void *v9 = 5;
  (*(void (**)(void *, void, __n128))(v10 + 104))(v9, *MEMORY[0x1E4FBCAE0], v7);
  v11 = (CKTextEffectCoordinatorConfiguration *)sub_18F610F00(v3, v5, (uint64_t)v9, 1);
  swift_deallocPartialClassInstance();
  return v11;
}

- (CKTextEffectCoordinatorConfiguration)init
{
  result = (CKTextEffectCoordinatorConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = (char *)self + OBJC_IVAR___CKTextEffectCoordinatorConfiguration_loopDelayProvider;

  __swift_destroy_boxed_opaque_existential_0((uint64_t)v3);
}

@end