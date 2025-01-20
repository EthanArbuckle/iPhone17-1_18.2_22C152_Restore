@interface _EXDomainAttribute
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_EXDomainAttribute)init;
- (_EXDomainAttribute)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _EXDomainAttribute

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_191F2B864(v4);
}

- (_EXDomainAttribute)initWithCoder:(id)a3
{
  return (_EXDomainAttribute *)sub_191F32F8C(a3);
}

+ (BOOL)supportsSecureCoding
{
  return byte_1E92FD870;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_1E92FD870 = a3;
}

- (_EXDomainAttribute)init
{
  result = (_EXDomainAttribute *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end