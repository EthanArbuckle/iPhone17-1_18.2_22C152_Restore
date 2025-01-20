@interface _BlastDoorCKShareParticipant
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC9BlastDoor28_BlastDoorCKShareParticipant)init;
- (_TtC9BlastDoor28_BlastDoorCKShareParticipant)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _BlastDoorCKShareParticipant

+ (BOOL)supportsSecureCoding
{
  return byte_1E9B82540;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_1E9B82540 = a3;
}

- (_TtC9BlastDoor28_BlastDoorCKShareParticipant)initWithCoder:(id)a3
{
  return (_TtC9BlastDoor28_BlastDoorCKShareParticipant *)sub_1B1898180(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1B189902C(v4);
}

- (_TtC9BlastDoor28_BlastDoorCKShareParticipant)init
{
  result = (_TtC9BlastDoor28_BlastDoorCKShareParticipant *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9BlastDoor28_BlastDoorCKShareParticipant_encryptedPersonalInfo));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9BlastDoor28_BlastDoorCKShareParticipant_invitationToken));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9BlastDoor28_BlastDoorCKShareParticipant_protectionInfoPublicKey));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end