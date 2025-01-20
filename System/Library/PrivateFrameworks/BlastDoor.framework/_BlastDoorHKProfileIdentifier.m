@interface _BlastDoorHKProfileIdentifier
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC9BlastDoor29_BlastDoorHKProfileIdentifier)init;
- (_TtC9BlastDoor29_BlastDoorHKProfileIdentifier)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _BlastDoorHKProfileIdentifier

+ (BOOL)supportsSecureCoding
{
  return byte_1E9B7FB40;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_1E9B7FB40 = a3;
}

- (_TtC9BlastDoor29_BlastDoorHKProfileIdentifier)initWithCoder:(id)a3
{
  return (_TtC9BlastDoor29_BlastDoorHKProfileIdentifier *)sub_1B161E2EC(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1B161E578(v4);
}

- (_TtC9BlastDoor29_BlastDoorHKProfileIdentifier)init
{
  result = (_TtC9BlastDoor29_BlastDoorHKProfileIdentifier *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end