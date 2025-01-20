@interface ChangeEventSecureCoding
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC9BlastDoor23ChangeEventSecureCoding)init;
- (_TtC9BlastDoor23ChangeEventSecureCoding)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ChangeEventSecureCoding

+ (BOOL)supportsSecureCoding
{
  return byte_1E9B82B40;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_1E9B82B40 = a3;
}

- (_TtC9BlastDoor23ChangeEventSecureCoding)initWithCoder:(id)a3
{
  return (_TtC9BlastDoor23ChangeEventSecureCoding *)sub_1B1911414(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1B1911784(v4);
}

- (_TtC9BlastDoor23ChangeEventSecureCoding)init
{
  result = (_TtC9BlastDoor23ChangeEventSecureCoding *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end