@interface IdentityLivenessResults
+ (BOOL)supportsSecureCoding;
- (NSString)debugDescription;
- (_TtC13CoreIDVShared23IdentityLivenessResults)init;
- (_TtC13CoreIDVShared23IdentityLivenessResults)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IdentityLivenessResults

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC13CoreIDVShared23IdentityLivenessResults)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = (_TtC13CoreIDVShared23IdentityLivenessResults *)sub_1D799169C(v3);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  IdentityLivenessResults.encode(with:)((NSCoder)v4);
}

- (NSString)debugDescription
{
  return (NSString *)sub_1D79914A0(self, (uint64_t)a2, (void (*)(void))IdentityLivenessResults.debugDescription.getter);
}

- (_TtC13CoreIDVShared23IdentityLivenessResults)init
{
  result = (_TtC13CoreIDVShared23IdentityLivenessResults *)_swift_stdlib_reportUnimplementedInitializer();
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

  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13CoreIDVShared23IdentityLivenessResults_passiveMetrics);
}

@end