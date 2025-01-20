@interface DSBeacon
- (NSArray)participants;
- (NSString)displayDetail;
- (NSString)displayName;
- (_TtC28FindMyItemsDigitalSeparation8DSBeacon)init;
- (_TtC28FindMyItemsDigitalSeparation8DSBeacon)initWithCoder:(id)a3;
- (int64_t)visibility;
@end

@implementation DSBeacon

- (_TtC28FindMyItemsDigitalSeparation8DSBeacon)initWithCoder:(id)a3
{
  result = (_TtC28FindMyItemsDigitalSeparation8DSBeacon *)sub_13480();
  __break(1u);
  return result;
}

- (NSArray)participants
{
  v2 = self;
  sub_120E0();

  sub_DCC4((uint64_t *)&unk_1F890);
  v3.super.isa = sub_13290().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (int64_t)visibility
{
  return 1;
}

- (NSString)displayName
{
  return (NSString *)0;
}

- (NSString)displayDetail
{
  return (NSString *)0;
}

- (_TtC28FindMyItemsDigitalSeparation8DSBeacon)init
{
  result = (_TtC28FindMyItemsDigitalSeparation8DSBeacon *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  NSArray v3 = &self->SPBeacon_opaque[OBJC_IVAR____TtC28FindMyItemsDigitalSeparation8DSBeacon_dsBeaconIdentifier];
  uint64_t v4 = sub_131C0();
  v5 = *(void (**)(unsigned __int8 *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end