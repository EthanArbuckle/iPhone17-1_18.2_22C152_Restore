@interface IdentityDocScanConfig
+ (BOOL)supportsSecureCoding;
- (_TtC13CoreIDVShared21IdentityDocScanConfig)init;
- (_TtC13CoreIDVShared21IdentityDocScanConfig)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IdentityDocScanConfig

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC13CoreIDVShared21IdentityDocScanConfig)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = (_TtC13CoreIDVShared21IdentityDocScanConfig *)sub_1D78FBBF4(v3);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  IdentityDocScanConfig.encode(with:)((NSCoder)v4);
}

- (_TtC13CoreIDVShared21IdentityDocScanConfig)init
{
  result = (_TtC13CoreIDVShared21IdentityDocScanConfig *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end