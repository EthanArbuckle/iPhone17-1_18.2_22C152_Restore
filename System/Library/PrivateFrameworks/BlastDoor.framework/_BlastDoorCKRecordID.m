@interface _BlastDoorCKRecordID
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC9BlastDoor20_BlastDoorCKRecordID)init;
- (_TtC9BlastDoor20_BlastDoorCKRecordID)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _BlastDoorCKRecordID

+ (BOOL)supportsSecureCoding
{
  return byte_1E9B82542;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_1E9B82542 = a3;
}

- (_TtC9BlastDoor20_BlastDoorCKRecordID)initWithCoder:(id)a3
{
  return (_TtC9BlastDoor20_BlastDoorCKRecordID *)sub_1B189A578(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1B189A7B4(v4);
}

- (_TtC9BlastDoor20_BlastDoorCKRecordID)init
{
  result = (_TtC9BlastDoor20_BlastDoorCKRecordID *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end