@interface MultiplayerModeChiclet
@end

@implementation MultiplayerModeChiclet

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC29GameCenterMatchmakerExtension22MultiplayerModeChiclet_primaryMetadata));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC29GameCenterMatchmakerExtension22MultiplayerModeChiclet____lazy_storage___iconImage);

  sub_10000EB5C(v3);
}

@end