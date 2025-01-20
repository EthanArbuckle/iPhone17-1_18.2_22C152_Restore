@interface IdentityProofingUnorderedUIElementOption
+ (BOOL)supportsSecureCoding;
- (_TtC13CoreIDVShared40IdentityProofingUnorderedUIElementOption)init;
- (_TtC13CoreIDVShared40IdentityProofingUnorderedUIElementOption)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IdentityProofingUnorderedUIElementOption

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  IdentityProofingUnorderedUIElementOption.encode(with:)((NSCoder)v4);
}

- (_TtC13CoreIDVShared40IdentityProofingUnorderedUIElementOption)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_TtC13CoreIDVShared40IdentityProofingUnorderedUIElementOption *)sub_1D79371CC();

  return v4;
}

- (_TtC13CoreIDVShared40IdentityProofingUnorderedUIElementOption)init
{
  result = (_TtC13CoreIDVShared40IdentityProofingUnorderedUIElementOption *)_swift_stdlib_reportUnimplementedInitializer();
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
}

@end