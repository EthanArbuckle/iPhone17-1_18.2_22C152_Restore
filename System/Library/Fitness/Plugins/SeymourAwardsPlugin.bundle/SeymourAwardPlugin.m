@interface SeymourAwardPlugin
- (NSString)pluginIdentifier;
- (_TtC19SeymourAwardsPlugin18SeymourAwardPlugin)init;
- (id)progressProvider;
- (id)templateAssetSource;
@end

@implementation SeymourAwardPlugin

- (NSString)pluginIdentifier
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_242F01100();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (_TtC19SeymourAwardsPlugin18SeymourAwardPlugin)init
{
  v3 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19SeymourAwardsPlugin18SeymourAwardPlugin_pluginIdentifier);
  sub_242F01080();
  v4 = self;
  uint64_t *v3 = sub_242F01070();
  v3[1] = v5;

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for SeymourAwardPlugin();
  return [(SeymourAwardPlugin *)&v7 init];
}

- (void).cxx_destruct
{
}

- (id)templateAssetSource
{
  return sub_242EFEC0C(self, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for SeymourTemplateAssetSource);
}

- (id)progressProvider
{
  return sub_242EFEC0C(self, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for AwardProgressProvider);
}

@end