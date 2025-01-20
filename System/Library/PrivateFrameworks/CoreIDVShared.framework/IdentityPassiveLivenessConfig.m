@interface IdentityPassiveLivenessConfig
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC13CoreIDVShared29IdentityPassiveLivenessConfig)init;
- (_TtC13CoreIDVShared29IdentityPassiveLivenessConfig)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IdentityPassiveLivenessConfig

+ (BOOL)supportsSecureCoding
{
  return byte_1EA844042;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_1EA844042 = a3;
}

- (_TtC13CoreIDVShared29IdentityPassiveLivenessConfig)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = (_TtC13CoreIDVShared29IdentityPassiveLivenessConfig *)sub_1D792DFF0(v3);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  IdentityPassiveLivenessConfig.encode(with:)((NSCoder)v4);
}

- (_TtC13CoreIDVShared29IdentityPassiveLivenessConfig)init
{
  result = (_TtC13CoreIDVShared29IdentityPassiveLivenessConfig *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end