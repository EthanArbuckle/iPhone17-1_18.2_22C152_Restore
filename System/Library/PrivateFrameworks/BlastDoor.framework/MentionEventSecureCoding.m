@interface MentionEventSecureCoding
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC9BlastDoor24MentionEventSecureCoding)init;
- (_TtC9BlastDoor24MentionEventSecureCoding)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MentionEventSecureCoding

+ (BOOL)supportsSecureCoding
{
  return byte_1E9B82B41;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_1E9B82B41 = a3;
}

- (_TtC9BlastDoor24MentionEventSecureCoding)initWithCoder:(id)a3
{
  return (_TtC9BlastDoor24MentionEventSecureCoding *)sub_1B1911E88(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1B19122B0(v4);
}

- (_TtC9BlastDoor24MentionEventSecureCoding)init
{
  result = (_TtC9BlastDoor24MentionEventSecureCoding *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end