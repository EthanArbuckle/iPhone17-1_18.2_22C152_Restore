@interface _BlastDoorCKUserIdentityLookupInfo
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC9BlastDoor34_BlastDoorCKUserIdentityLookupInfo)init;
- (_TtC9BlastDoor34_BlastDoorCKUserIdentityLookupInfo)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _BlastDoorCKUserIdentityLookupInfo

+ (BOOL)supportsSecureCoding
{
  return byte_1E9B82544;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_1E9B82544 = a3;
}

- (_TtC9BlastDoor34_BlastDoorCKUserIdentityLookupInfo)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = (_TtC9BlastDoor34_BlastDoorCKUserIdentityLookupInfo *)sub_1B18A0B18(v3);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1B189B070(v4);
}

- (_TtC9BlastDoor34_BlastDoorCKUserIdentityLookupInfo)init
{
  result = (_TtC9BlastDoor34_BlastDoorCKUserIdentityLookupInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9BlastDoor34_BlastDoorCKUserIdentityLookupInfo_emailAddress));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9BlastDoor34_BlastDoorCKUserIdentityLookupInfo_phoneNumber));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9BlastDoor34_BlastDoorCKUserIdentityLookupInfo_userRecordID));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9BlastDoor34_BlastDoorCKUserIdentityLookupInfo_encryptedPersonalInfo));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end