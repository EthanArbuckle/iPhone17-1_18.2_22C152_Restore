@interface IdentityProofingUIConfig
+ (BOOL)supportsSecureCoding;
- (_TtC13CoreIDVShared24IdentityProofingUIConfig)init;
- (_TtC13CoreIDVShared24IdentityProofingUIConfig)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IdentityProofingUIConfig

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  IdentityProofingUIConfig.encode(with:)((NSCoder)v4);
}

- (_TtC13CoreIDVShared24IdentityProofingUIConfig)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_TtC13CoreIDVShared24IdentityProofingUIConfig *)sub_1D78F9770(v3);

  return v4;
}

- (_TtC13CoreIDVShared24IdentityProofingUIConfig)init
{
  result = (_TtC13CoreIDVShared24IdentityProofingUIConfig *)_swift_stdlib_reportUnimplementedInitializer();
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
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end