@interface SeymourTemplateAssetSource
- (NSString)identifier;
- (_TtC19SeymourAwardsPlugin26SeymourTemplateAssetSource)init;
- (id)localizationBundleURLForTemplate:(id)a3;
- (id)propertyListBundleURLForTemplate:(id)a3;
- (id)resourceBundleURLForTemplate:(id)a3;
- (id)stickerBundleURLForTemplate:(id)a3;
@end

@implementation SeymourTemplateAssetSource

- (NSString)identifier
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_242F01100();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (_TtC19SeymourAwardsPlugin26SeymourTemplateAssetSource)init
{
  v3 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19SeymourAwardsPlugin26SeymourTemplateAssetSource_identifier);
  sub_242F01080();
  v4 = self;
  uint64_t *v3 = sub_242F01070();
  v3[1] = v5;

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for SeymourTemplateAssetSource();
  return [(SeymourTemplateAssetSource *)&v7 init];
}

- (void).cxx_destruct
{
}

- (id)localizationBundleURLForTemplate:(id)a3
{
  return sub_242F00D9C(self, (uint64_t)a2, a3, (void (*)(id))sub_242EFFAF4);
}

- (id)resourceBundleURLForTemplate:(id)a3
{
  return sub_242F00D9C(self, (uint64_t)a2, a3, (void (*)(id))sub_242F004A0);
}

- (id)propertyListBundleURLForTemplate:(id)a3
{
  return sub_242F00D9C(self, (uint64_t)a2, a3, (void (*)(id))sub_242F008B8);
}

- (id)stickerBundleURLForTemplate:(id)a3
{
  return 0;
}

@end