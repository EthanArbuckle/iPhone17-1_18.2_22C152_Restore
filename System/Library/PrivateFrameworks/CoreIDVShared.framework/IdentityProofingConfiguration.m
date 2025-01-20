@interface IdentityProofingConfiguration
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (_TtC13CoreIDVShared29IdentityProofingConfiguration)init;
- (_TtC13CoreIDVShared29IdentityProofingConfiguration)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IdentityProofingConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  IdentityProofingConfiguration.encode(with:)((NSCoder)v4);
}

- (_TtC13CoreIDVShared29IdentityProofingConfiguration)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_TtC13CoreIDVShared29IdentityProofingConfiguration *)sub_1D78E393C(v3);

  return v4;
}

- (_TtC13CoreIDVShared29IdentityProofingConfiguration)init
{
  result = (_TtC13CoreIDVShared29IdentityProofingConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
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
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC13CoreIDVShared29IdentityProofingConfiguration_supplementalProvisioningData);
  unint64_t v4 = *(void *)&self->state[OBJC_IVAR____TtC13CoreIDVShared29IdentityProofingConfiguration_supplementalProvisioningData];
  sub_1D7871BDC(v3, v4);
}

- (NSString)description
{
  v2 = self;
  IdentityProofingConfiguration.description.getter();

  uint64_t v3 = (void *)sub_1D7A9BF98();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

@end