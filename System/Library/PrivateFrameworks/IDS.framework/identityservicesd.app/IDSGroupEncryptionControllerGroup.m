@interface IDSGroupEncryptionControllerGroup
- (BOOL)shortMKIEnabled;
- (IDSEndpointSubscription)endpointSubscription;
- (IDSGroupEncryptionKeyMaterial)mediaKeyMaterial;
- (IDSGroupEncryptionKeyMaterial)stableKeyMaterial;
- (NSSet)allMembers;
- (NSSet)lightweightParticipantPushTokens;
- (NSSet)lightweightParticipants;
- (NSSet)memberURIs;
- (NSSet)participantPushTokens;
- (NSSet)participants;
- (NSSet)standardParticipantPushTokens;
- (NSSet)standardParticipants;
- (NSString)id;
- (_TtC17identityservicesd31IDSGroupEncryptionConfiguration)config;
- (_TtC17identityservicesd33IDSGroupEncryptionControllerGroup)init;
- (id)ensureParticipant:(id)a3;
- (id)ensureSessionForID:(id)a3;
- (id)memberForParticipant:(id)a3;
- (id)memberForURI:(id)a3;
- (id)participantForID:(unint64_t)a3;
- (id)participantForToken:(id)a3;
- (id)participantIDsForURIs:(id)a3;
- (id)participantsForMember:(id)a3;
- (id)participantsForURI:(id)a3;
- (id)receiveMKMWithKeyMaterialDictionary:(id)a3 fromPushToken:(id)a4 fromURI:(id)a5 sessionID:(id)a6 isFromSender:(BOOL)a7;
- (id)receiveSKMWithKeyMaterialDictionary:(id)a3 fromPushToken:(id)a4 fromURI:(id)a5 sessionID:(id)a6 isFromSender:(BOOL)a7;
- (unint64_t)encryptionSequenceNumber;
- (unint64_t)localParticipantID;
- (unint64_t)preKeyAckCount;
- (void)cancelKMCacheReset;
- (void)cleanUpSessionForID:(id)a3;
- (void)dealloc;
- (void)ensureStableKeyMaterialsSentToClient;
- (void)hardRoll;
- (void)removeAllMembers;
- (void)removeAllParticipants;
- (void)removeParticipant:(id)a3;
- (void)removeParticipantForToken:(id)a3;
- (void)resetKMCaches;
- (void)resetKMCachesAfter:(double)a3;
- (void)resetKeysSentToClient;
- (void)resetKeysToPropagate;
- (void)setEncryptionSequenceNumber:(unint64_t)a3;
- (void)setEndpointSubscription:(id)a3;
- (void)setLocalParticipantID:(unint64_t)a3;
- (void)setPreKeyAckCount:(unint64_t)a3;
- (void)setShortMKIEnabled:(BOOL)a3;
- (void)updateDesiredMaterials;
- (void)updateMembersWithURIs:(id)a3;
- (void)updateMembersWithURIs:(id)a3 lightweightStatusDict:(id)a4;
- (void)updateParticipants:(id)a3 lightweight:(BOOL)a4;
@end

@implementation IDSGroupEncryptionControllerGroup

- (NSString)id
{
  swift_bridgeObjectRetain();
  NSString v2 = sub_100726420();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (_TtC17identityservicesd31IDSGroupEncryptionConfiguration)config
{
  return (_TtC17identityservicesd31IDSGroupEncryptionConfiguration *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC17identityservicesd33IDSGroupEncryptionControllerGroup_config);
}

- (unint64_t)preKeyAckCount
{
  NSString v2 = (unint64_t *)((char *)self
                          + OBJC_IVAR____TtC17identityservicesd33IDSGroupEncryptionControllerGroup_preKeyAckCount);
  swift_beginAccess();
  return *v2;
}

- (void)setPreKeyAckCount:(unint64_t)a3
{
  v4 = (unint64_t *)((char *)self
                          + OBJC_IVAR____TtC17identityservicesd33IDSGroupEncryptionControllerGroup_preKeyAckCount);
  swift_beginAccess();
  unint64_t *v4 = a3;
}

- (unint64_t)localParticipantID
{
  NSString v2 = (unint64_t *)((char *)self
                          + OBJC_IVAR____TtC17identityservicesd33IDSGroupEncryptionControllerGroup_localParticipantID);
  swift_beginAccess();
  return *v2;
}

- (void)setLocalParticipantID:(unint64_t)a3
{
  v5 = (unint64_t *)((char *)self
                          + OBJC_IVAR____TtC17identityservicesd33IDSGroupEncryptionControllerGroup_localParticipantID);
  swift_beginAccess();
  unint64_t *v5 = a3;
  v6 = self;
  sub_1004F7C28();
}

- (IDSEndpointSubscription)endpointSubscription
{
  NSString v2 = (id *)((char *)&self->super.isa
            + OBJC_IVAR____TtC17identityservicesd33IDSGroupEncryptionControllerGroup_endpointSubscription);
  swift_beginAccess();
  return (IDSEndpointSubscription *)*v2;
}

- (void)setEndpointSubscription:(id)a3
{
  v4 = (void **)((char *)&self->super.isa
               + OBJC_IVAR____TtC17identityservicesd33IDSGroupEncryptionControllerGroup_endpointSubscription);
  swift_beginAccess();
  v5 = *v4;
  unint64_t *v4 = a3;
  id v6 = a3;
}

- (unint64_t)encryptionSequenceNumber
{
  NSString v2 = (unint64_t *)((char *)self
                          + OBJC_IVAR____TtC17identityservicesd33IDSGroupEncryptionControllerGroup_encryptionSequenceNumber);
  swift_beginAccess();
  return *v2;
}

- (void)setEncryptionSequenceNumber:(unint64_t)a3
{
  v4 = (unint64_t *)((char *)self
                          + OBJC_IVAR____TtC17identityservicesd33IDSGroupEncryptionControllerGroup_encryptionSequenceNumber);
  swift_beginAccess();
  unint64_t *v4 = a3;
}

- (NSSet)memberURIs
{
  NSString v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0x110);
  id v6 = self;
  v3 = (os_unfair_lock_s *)(v2() + 16);
  os_unfair_lock_lock(v3);
  sub_10050C748(&v7);
  os_unfair_lock_unlock(v3);

  swift_release();
  sub_100462C50(0, (unint64_t *)&unk_100A47EC0);
  sub_100480C20((unint64_t *)&unk_100A46850, (unint64_t *)&unk_100A47EC0);
  v4.super.isa = sub_100726630().super.isa;
  swift_bridgeObjectRelease();

  return (NSSet *)v4.super.isa;
}

- (NSSet)allMembers
{
  NSString v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0x110);
  id v6 = self;
  v3 = (os_unfair_lock_s *)(v2() + 16);
  os_unfair_lock_lock(v3);
  sub_10050C748(&v7);
  os_unfair_lock_unlock(v3);

  swift_release();
  type metadata accessor for IDSGroupEncryptionControllerMember();
  sub_10050DC4C((unint64_t *)&qword_100A44A78, (void (*)(uint64_t))type metadata accessor for IDSGroupEncryptionControllerMember);
  v4.super.isa = sub_100726630().super.isa;
  swift_bridgeObjectRelease();

  return (NSSet *)v4.super.isa;
}

- (NSSet)participants
{
  return (NSSet *)sub_1004F9014(self, (uint64_t)a2, sub_1004F8C3C);
}

- (NSSet)standardParticipants
{
  return (NSSet *)sub_1004F9014(self, (uint64_t)a2, (void (*)(void))sub_1004F8D14);
}

- (NSSet)lightweightParticipants
{
  return (NSSet *)sub_1004F9014(self, (uint64_t)a2, (void (*)(void))sub_1004F90BC);
}

- (NSSet)participantPushTokens
{
  return (NSSet *)sub_1004F968C(self, (uint64_t)a2, (void (*)(void))sub_1004F93BC);
}

- (NSSet)standardParticipantPushTokens
{
  return (NSSet *)sub_1004F968C(self, (uint64_t)a2, (void (*)(void))sub_1004F9734);
}

- (NSSet)lightweightParticipantPushTokens
{
  return (NSSet *)sub_1004F968C(self, (uint64_t)a2, (void (*)(void))sub_1004F9A04);
}

- (IDSGroupEncryptionKeyMaterial)mediaKeyMaterial
{
  NSString v2 = self;
  id v3 = sub_1004F9D00();

  return (IDSGroupEncryptionKeyMaterial *)v3;
}

- (IDSGroupEncryptionKeyMaterial)stableKeyMaterial
{
  NSString v2 = self;
  id v3 = sub_1004F9D50();

  return (IDSGroupEncryptionKeyMaterial *)v3;
}

- (void)dealloc
{
  NSString v2 = self;
  sub_1004FA0C0();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC17identityservicesd33IDSGroupEncryptionControllerGroup_l;
  uint64_t v4 = sub_100725ED0();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC17identityservicesd33IDSGroupEncryptionControllerGroup_stateLogger, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17identityservicesd33IDSGroupEncryptionControllerGroup_q));
  swift_release();
  sub_100461218((uint64_t)self + OBJC_IVAR____TtC17identityservicesd33IDSGroupEncryptionControllerGroup_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17identityservicesd33IDSGroupEncryptionControllerGroup_config));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17identityservicesd33IDSGroupEncryptionControllerGroup_identityController));
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_10044C6AC((uint64_t)self + OBJC_IVAR____TtC17identityservicesd33IDSGroupEncryptionControllerGroup_cryptoHandler);
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17identityservicesd33IDSGroupEncryptionControllerGroup_endpointSubscription));
  sub_10044C150((uint64_t)self + OBJC_IVAR____TtC17identityservicesd33IDSGroupEncryptionControllerGroup_needsKMCacheResetAfter, &qword_100A47D80);

  swift_release();
}

- (void)removeAllMembers
{
  NSString v2 = self;
  sub_1004FA40C();
}

- (void)updateMembersWithURIs:(id)a3
{
  sub_100462C50(0, (unint64_t *)&unk_100A47EC0);
  sub_100480C20((unint64_t *)&unk_100A46850, (unint64_t *)&unk_100A47EC0);
  uint64_t v4 = sub_100726640();
  v5 = *(void (**)(uint64_t, void))((swift_isaMask & (uint64_t)self->super.isa) + 0x2B0);
  id v6 = self;
  v5(v4, 0);

  swift_bridgeObjectRelease();
}

- (void)updateMembersWithURIs:(id)a3 lightweightStatusDict:(id)a4
{
  sub_100462C50(0, (unint64_t *)&unk_100A47EC0);
  sub_100480C20((unint64_t *)&unk_100A46850, (unint64_t *)&unk_100A47EC0);
  uint64_t v6 = sub_100726640();
  if (a4) {
    uint64_t v7 = sub_100726390();
  }
  else {
    uint64_t v7 = 0;
  }
  v8 = self;
  sub_1004FA6C8(v6, v7);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (id)memberForURI:(id)a3
{
  id v4 = a3;
  v5 = self;
  uint64_t v6 = sub_1004FBE08(v4);

  return v6;
}

- (id)memberForParticipant:(id)a3
{
  id v4 = a3;
  v5 = self;
  uint64_t v6 = (void *)sub_1004FC114((uint64_t)v4);

  return v6;
}

- (id)participantsForURI:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1004FC290(v4);

  type metadata accessor for IDSGroupEncryptionControllerParticipant(0);
  sub_10050DC4C((unint64_t *)&unk_100A45410, (void (*)(uint64_t))type metadata accessor for IDSGroupEncryptionControllerParticipant);
  v6.super.isa = sub_100726630().super.isa;
  swift_bridgeObjectRelease();

  return v6.super.isa;
}

- (id)participantsForMember:(id)a3
{
  id v4 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0x258);
  id v5 = a3;
  NSSet v6 = self;
  uint64_t v7 = v4();
  id v8 = v5;
  sub_10050D9A8(v7, v8);

  type metadata accessor for IDSGroupEncryptionControllerParticipant(0);
  sub_10050DC4C((unint64_t *)&unk_100A45410, (void (*)(uint64_t))type metadata accessor for IDSGroupEncryptionControllerParticipant);
  v9.super.isa = sub_100726630().super.isa;
  swift_release();

  return v9.super.isa;
}

- (id)participantForToken:(id)a3
{
  id v4 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0x258);
  id v5 = a3;
  NSSet v6 = self;
  uint64_t v7 = v4();
  id v8 = v5;
  sub_10050D294(v7);
  v10 = v9;

  swift_bridgeObjectRelease();

  return v10;
}

- (id)participantForID:(unint64_t)a3
{
  id v3 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0x158);
  uint64_t v7 = self;
  id v4 = (os_unfair_lock_s *)(v3() + 16);
  os_unfair_lock_lock(v4);
  sub_10050C748(&v8);
  os_unfair_lock_unlock(v4);
  id v5 = v8;

  swift_release();

  return v5;
}

- (id)participantIDsForURIs:(id)a3
{
  sub_100462C50(0, (unint64_t *)&unk_100A47EC0);
  sub_100480C20((unint64_t *)&unk_100A46850, (unint64_t *)&unk_100A47EC0);
  uint64_t v4 = sub_100726640();
  id v5 = self;
  sub_1004FCA10(v4);

  swift_bridgeObjectRelease();
  v6.super.isa = sub_100726630().super.isa;
  swift_bridgeObjectRelease();

  return v6.super.isa;
}

- (void)updateParticipants:(id)a3 lightweight:(BOOL)a4
{
  BOOL v4 = a4;
  sub_100462C50(0, &qword_100A47430);
  unint64_t v6 = sub_100726570();
  uint64_t v7 = self;
  sub_1004FD108(v6, v4);

  swift_bridgeObjectRelease();
}

- (id)ensureParticipant:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = sub_1004FF0EC(v4);

  return v6;
}

- (void)removeParticipant:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1004FFC98(v4);
}

- (void)removeParticipantForToken:(id)a3
{
  id v4 = *(uint64_t (**)(_TtC17identityservicesd33IDSGroupEncryptionControllerGroup *))((swift_isaMask & (uint64_t)self->super.isa)
                                                                                              + 0x2D8);
  id v5 = (_TtC17identityservicesd33IDSGroupEncryptionControllerGroup *)a3;
  id v8 = self;
  uint64_t v6 = v4(v5);
  if (v6)
  {
    uint64_t v7 = (_TtC17identityservicesd33IDSGroupEncryptionControllerGroup *)v6;
    (*(void (**)(void))((swift_isaMask & (uint64_t)v8->super.isa) + 0x300))();

    id v5 = v8;
    id v8 = v7;
  }
}

- (void)removeAllParticipants
{
  NSString v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0x158);
  id v4 = self;
  id v3 = (os_unfair_lock_s *)(v2() + 16);
  os_unfair_lock_lock(v3);
  sub_100482E74();
  os_unfair_lock_unlock(v3);

  swift_release();
}

- (id)receiveMKMWithKeyMaterialDictionary:(id)a3 fromPushToken:(id)a4 fromURI:(id)a5 sessionID:(id)a6 isFromSender:(BOOL)a7
{
  return sub_1005005C8(self, (uint64_t)a2, (uint64_t)a3, a4, a5, (uint64_t)a6, a7, 0);
}

- (id)receiveSKMWithKeyMaterialDictionary:(id)a3 fromPushToken:(id)a4 fromURI:(id)a5 sessionID:(id)a6 isFromSender:(BOOL)a7
{
  return sub_1005005C8(self, (uint64_t)a2, (uint64_t)a3, a4, a5, (uint64_t)a6, a7, 1);
}

- (void)resetKeysToPropagate
{
  NSString v2 = self;
  sub_1005049F0();
}

- (void)resetKMCachesAfter:(double)a3
{
  id v3 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0x110);
  uint64_t v6 = self;
  id v4 = (os_unfair_lock_s *)(v3() + 16);
  os_unfair_lock_lock(v4);
  sub_100482E74();
  os_unfair_lock_unlock(v4);
  uint64_t v5 = swift_release();
  (*(void (**)(uint64_t))((swift_isaMask & (uint64_t)v6->super.isa) + 0x378))(v5);
}

- (void)resetKMCaches
{
  NSString v2 = self;
  sub_100504FE8();
}

- (void)cancelKMCacheReset
{
  NSString v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0x110);
  id v4 = self;
  id v3 = (os_unfair_lock_s *)(v2() + 16);
  os_unfair_lock_lock(v3);
  sub_100482E74();
  os_unfair_lock_unlock(v3);

  swift_release();
}

- (void)updateDesiredMaterials
{
  NSString v2 = self;
  sub_100505FE8();
}

- (void)resetKeysSentToClient
{
  NSString v2 = self;
  sub_1005061F4();
}

- (void)hardRoll
{
  NSString v2 = self;
  sub_100506414();
}

- (void)ensureStableKeyMaterialsSentToClient
{
  NSString v2 = self;
  sub_100506634();
}

- (id)ensureSessionForID:(id)a3
{
  uint64_t v4 = sub_100726430();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  sub_100506854(v4, v6);
  NSSet v9 = v8;

  swift_bridgeObjectRelease();

  return v9;
}

- (void)cleanUpSessionForID:(id)a3
{
  uint64_t v4 = sub_100726430();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  sub_100506F6C(v4, v6);

  swift_bridgeObjectRelease();
}

- (BOOL)shortMKIEnabled
{
  return *((unsigned char *)&self->super.isa
         + OBJC_IVAR____TtC17identityservicesd33IDSGroupEncryptionControllerGroup__shortMKIEnabled);
}

- (void)setShortMKIEnabled:(BOOL)a3
{
  uint64_t v4 = self;
  sub_1005071F4(a3);
}

- (_TtC17identityservicesd33IDSGroupEncryptionControllerGroup)init
{
  result = (_TtC17identityservicesd33IDSGroupEncryptionControllerGroup *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end