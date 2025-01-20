@interface IDSGroupEncryptionControllerParticipant
- (BOOL)isEqual:(id)a3;
- (IDSPushToken)pushToken;
- (NSString)allocatedURI;
- (NSString)description;
- (_TtC17identityservicesd34IDSGroupEncryptionControllerMember)member;
- (_TtC17identityservicesd39IDSGroupEncryptionControllerParticipant)init;
- (int64_t)hash;
- (unint64_t)participantID;
- (void)recoverKeyMaterialForSessionID:(id)a3 mkm:(BOOL)a4 skm:(BOOL)a5;
@end

@implementation IDSGroupEncryptionControllerParticipant

- (unint64_t)participantID
{
  return *(unint64_t *)((char *)&self->super.isa
                             + OBJC_IVAR____TtC17identityservicesd39IDSGroupEncryptionControllerParticipant_participantID);
}

- (IDSPushToken)pushToken
{
  return (IDSPushToken *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                 + OBJC_IVAR____TtC17identityservicesd39IDSGroupEncryptionControllerParticipant_pushToken));
}

- (NSString)allocatedURI
{
  swift_bridgeObjectRetain();
  NSString v2 = sub_100726420();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (_TtC17identityservicesd34IDSGroupEncryptionControllerMember)member
{
  v3 = (char *)self + OBJC_IVAR____TtC17identityservicesd39IDSGroupEncryptionControllerParticipant_delegate;
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    v5 = (void *)Strong;
    uint64_t v6 = *((void *)v3 + 1);
    swift_getObjectType();
    v7 = *(uint64_t (**)(void))(v6 + 24);
    v8 = self;
    v9 = (void *)v7();
  }
  else
  {
    v9 = 0;
  }

  return (_TtC17identityservicesd34IDSGroupEncryptionControllerMember *)v9;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_100726870();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = sub_1004D1774((uint64_t)v8);

  sub_100450D90((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  sub_100726E10(*(Swift::UInt64 *)((char *)&self->super.isa
                                 + OBJC_IVAR____TtC17identityservicesd39IDSGroupEncryptionControllerParticipant_participantID));
  return sub_100726E20();
}

- (NSString)description
{
  NSString v2 = self;
  sub_1004D1A54();

  NSString v3 = sub_100726420();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (void)recoverKeyMaterialForSessionID:(id)a3 mkm:(BOOL)a4 skm:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v8 = sub_100726430();
  uint64_t v10 = v9;
  if (!v6)
  {
    v13 = self;
    if (!v5) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v11 = *(void (**)(void, uint64_t, uint64_t))((swift_isaMask & (uint64_t)self->super.isa) + 0x118);
  v12 = self;
  v11(0, v8, v10);
  if (v5) {
LABEL_5:
  }
    (*(void (**)(uint64_t, uint64_t, uint64_t))((swift_isaMask & (uint64_t)self->super.isa) + 0x118))(1, v8, v10);
LABEL_6:

  swift_bridgeObjectRelease();
}

- (_TtC17identityservicesd39IDSGroupEncryptionControllerParticipant)init
{
  result = (_TtC17identityservicesd39IDSGroupEncryptionControllerParticipant *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17identityservicesd39IDSGroupEncryptionControllerParticipant_q));
  sub_100461218((uint64_t)self + OBJC_IVAR____TtC17identityservicesd39IDSGroupEncryptionControllerParticipant_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17identityservicesd39IDSGroupEncryptionControllerParticipant_pushToken));
  swift_bridgeObjectRelease();
  sub_1004D3CD0((uint64_t)self + OBJC_IVAR____TtC17identityservicesd39IDSGroupEncryptionControllerParticipant_preKeyState, type metadata accessor for IDSGroupEncryptionControllerParticipantPreKeyState);
  sub_1004D3CD0((uint64_t)self + OBJC_IVAR____TtC17identityservicesd39IDSGroupEncryptionControllerParticipant_keyRecoveryState, type metadata accessor for IDSGroupEncryptionControllerParticipantKeyRecoveryState);
}

@end