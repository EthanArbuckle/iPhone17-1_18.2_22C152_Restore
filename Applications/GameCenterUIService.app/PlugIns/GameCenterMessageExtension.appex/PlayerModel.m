@interface PlayerModel
- (NSString)description;
- (_TtC26GameCenterMessageExtension11PlayerModel)init;
@end

@implementation PlayerModel

- (NSString)description
{
  v2 = self;
  sub_100015AB0();

  NSString v3 = sub_100047E38();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC26GameCenterMessageExtension11PlayerModel)init
{
  result = (_TtC26GameCenterMessageExtension11PlayerModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendPlayer));
  NSString v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_playerGroup);
}

@end