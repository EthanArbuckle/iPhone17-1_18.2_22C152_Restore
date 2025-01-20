@interface MembershipEventSecureCoding
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC9BlastDoor27MembershipEventSecureCoding)init;
- (_TtC9BlastDoor27MembershipEventSecureCoding)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MembershipEventSecureCoding

+ (BOOL)supportsSecureCoding
{
  return byte_1E9B82B42;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_1E9B82B42 = a3;
}

- (_TtC9BlastDoor27MembershipEventSecureCoding)initWithCoder:(id)a3
{
  return (_TtC9BlastDoor27MembershipEventSecureCoding *)sub_1B1912968(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1B1912CD0(v4);
}

- (_TtC9BlastDoor27MembershipEventSecureCoding)init
{
  result = (_TtC9BlastDoor27MembershipEventSecureCoding *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end