@interface VASReadEntry
+ (BOOL)supportsSecureCoding;
- (_TtC15ProximityReader12VASReadEntry)init;
- (_TtC15ProximityReader12VASReadEntry)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VASReadEntry

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  VASReadEntry.encode(with:)((NSCoder)v4);
}

- (_TtC15ProximityReader12VASReadEntry)initWithCoder:(id)a3
{
  return (_TtC15ProximityReader12VASReadEntry *)VASReadEntry.init(coder:)(a3);
}

- (_TtC15ProximityReader12VASReadEntry)init
{
  result = (_TtC15ProximityReader12VASReadEntry *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_22880BB6C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC15ProximityReader12VASReadEntry_mobileToken), *(void *)&self->mobileToken[OBJC_IVAR____TtC15ProximityReader12VASReadEntry_mobileToken]);
  sub_22880BB6C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC15ProximityReader12VASReadEntry_customerVASData), *(void *)&self->mobileToken[OBJC_IVAR____TtC15ProximityReader12VASReadEntry_customerVASData]);

  swift_bridgeObjectRelease();
}

@end