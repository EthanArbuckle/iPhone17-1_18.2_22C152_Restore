@interface IdentityConfigurationInternal
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC15ProximityReader29IdentityConfigurationInternal)init;
- (_TtC15ProximityReader29IdentityConfigurationInternal)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IdentityConfigurationInternal

- (_TtC15ProximityReader29IdentityConfigurationInternal)init
{
  result = (_TtC15ProximityReader29IdentityConfigurationInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return byte_26826B260;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_26826B260 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_228915C40();
  id v7 = (id)sub_228915C40();
  objc_msgSend(v4, sel_encodeObject_forKey_, v6, v7);
}

- (_TtC15ProximityReader29IdentityConfigurationInternal)initWithCoder:(id)a3
{
  return (_TtC15ProximityReader29IdentityConfigurationInternal *)IdentityConfigurationInternal.init(coder:)(a3);
}

@end