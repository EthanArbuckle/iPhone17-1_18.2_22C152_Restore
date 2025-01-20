@interface JSFeatureFlags
- (BOOL)isEnabled:(id)a3;
- (BOOL)isGSEUIEnabled:(id)a3;
- (_TtC19AppStoreKitInternal14JSFeatureFlags)init;
@end

@implementation JSFeatureFlags

- (BOOL)isEnabled:(id)a3
{
  return sub_1E1635A68(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_1E1635AD0);
}

- (_TtC19AppStoreKitInternal14JSFeatureFlags)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(JSFeatureFlags *)&v3 init];
}

- (BOOL)isGSEUIEnabled:(id)a3
{
  return sub_1E1635A68(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_1E19E99CC);
}

@end