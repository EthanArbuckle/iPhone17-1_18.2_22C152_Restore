@interface DSDelegatedBeaconShare
- (NSArray)participants;
- (NSString)displayDetail;
- (NSString)displayName;
- (_TtC28FindMyItemsDigitalSeparation22DSDelegatedBeaconShare)init;
- (int64_t)visibility;
@end

@implementation DSDelegatedBeaconShare

- (_TtC28FindMyItemsDigitalSeparation22DSDelegatedBeaconShare)init
{
  result = (_TtC28FindMyItemsDigitalSeparation22DSDelegatedBeaconShare *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC28FindMyItemsDigitalSeparation22DSDelegatedBeaconShare_beacon));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC28FindMyItemsDigitalSeparation22DSDelegatedBeaconShare_beaconShare);
}

- (NSString)displayName
{
  return (NSString *)0;
}

- (NSString)displayDetail
{
  return (NSString *)0;
}

- (NSArray)participants
{
  sub_DCC4((uint64_t *)&unk_1F890);
  v2.super.isa = sub_13290().super.isa;

  return (NSArray *)v2.super.isa;
}

- (int64_t)visibility
{
  return 2;
}

@end