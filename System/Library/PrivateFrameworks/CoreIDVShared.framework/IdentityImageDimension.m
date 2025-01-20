@interface IdentityImageDimension
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSString)debugDescription;
- (_TtC13CoreIDVShared22IdentityImageDimension)init;
- (_TtC13CoreIDVShared22IdentityImageDimension)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IdentityImageDimension

+ (BOOL)supportsSecureCoding
{
  return byte_1EA843631;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_1EA843631 = a3;
}

- (_TtC13CoreIDVShared22IdentityImageDimension)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = (_TtC13CoreIDVShared22IdentityImageDimension *)sub_1D78E0348(v3);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  IdentityImageDimension.encode(with:)((NSCoder)v4);
}

- (NSString)debugDescription
{
  return (NSString *)sub_1D78E0240(self, (uint64_t)a2, (void (*)(void))IdentityImageDimension.debugDescription.getter);
}

- (_TtC13CoreIDVShared22IdentityImageDimension)init
{
  result = (_TtC13CoreIDVShared22IdentityImageDimension *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end