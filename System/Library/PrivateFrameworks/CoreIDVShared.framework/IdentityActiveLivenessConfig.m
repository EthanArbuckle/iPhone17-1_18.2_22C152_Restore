@interface IdentityActiveLivenessConfig
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSString)debugDescription;
- (_TtC13CoreIDVShared28IdentityActiveLivenessConfig)init;
- (_TtC13CoreIDVShared28IdentityActiveLivenessConfig)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IdentityActiveLivenessConfig

+ (BOOL)supportsSecureCoding
{
  return byte_1EA844041;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_1EA844041 = a3;
}

- (_TtC13CoreIDVShared28IdentityActiveLivenessConfig)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = (_TtC13CoreIDVShared28IdentityActiveLivenessConfig *)sub_1D792D958(v3);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  IdentityActiveLivenessConfig.encode(with:)((NSCoder)v4);
}

- (NSString)debugDescription
{
  v2 = self;
  IdentityActiveLivenessConfig.debugDescription.getter();

  id v3 = (void *)sub_1D7A9BF98();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC13CoreIDVShared28IdentityActiveLivenessConfig)init
{
  result = (_TtC13CoreIDVShared28IdentityActiveLivenessConfig *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end