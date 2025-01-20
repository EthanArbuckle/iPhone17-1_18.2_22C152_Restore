@interface _BlastDoorCKRecordZoneID
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC9BlastDoor24_BlastDoorCKRecordZoneID)init;
- (_TtC9BlastDoor24_BlastDoorCKRecordZoneID)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _BlastDoorCKRecordZoneID

+ (BOOL)supportsSecureCoding
{
  return byte_1E9B82543;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_1E9B82543 = a3;
}

- (_TtC9BlastDoor24_BlastDoorCKRecordZoneID)initWithCoder:(id)a3
{
  return (_TtC9BlastDoor24_BlastDoorCKRecordZoneID *)sub_1B189A9DC(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1B189AD48(v4);
}

- (_TtC9BlastDoor24_BlastDoorCKRecordZoneID)init
{
  result = (_TtC9BlastDoor24_BlastDoorCKRecordZoneID *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end