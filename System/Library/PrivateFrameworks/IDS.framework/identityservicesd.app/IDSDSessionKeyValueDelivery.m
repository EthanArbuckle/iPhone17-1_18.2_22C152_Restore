@interface IDSDSessionKeyValueDelivery
+ (id)createWithDelegate:(id)a3 session:(id)a4 metricsCollector:(id)a5 pushTokensForCapabilityProvider:(id)a6;
- (NSSet)objcMaterials;
- (_TtC17identityservicesd27IDSDSessionKeyValueDelivery)init;
- (id)getAllKeyValueDeliveryLocalMaterialSetForGroupID:(id)a3;
- (void)addDeliveryHandler:(id)a3 uuid:(id)a4;
- (void)addMaterialProviderToSession:(id)a3;
- (void)dealloc;
- (void)receiveDictionaryData:(id)a3 forType:(int)a4 fromParticipant:(unint64_t)a5;
- (void)removeDeliveryHandler:(id)a3;
- (void)requestDataForKey:(unsigned int)a3 participantID:(unint64_t)a4;
- (void)sendData:(NSData *)a3 forKey:(unsigned int)a4 encryption:(unsigned int)a5 capability:(NSString *)a6 withCompletion:(id)a7;
- (void)test_receiveData:(id)a3 forKey:(unsigned int)a4 fromParticipant:(unint64_t)a5;
@end

@implementation IDSDSessionKeyValueDelivery

- (void)dealloc
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC17identityservicesd27IDSDSessionKeyValueDelivery_state);
  v3 = self;
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 48));
  sub_100455ED4((void *)(v2 + 16));
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 48));
  swift_release();
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for IDSDSessionKeyValueDelivery(0);
  [(IDSDSessionKeyValueDelivery *)&v4 dealloc];
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC17identityservicesd27IDSDSessionKeyValueDelivery_l;
  uint64_t v4 = sub_100725ED0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17identityservicesd27IDSDSessionKeyValueDelivery_metricsCollector));
  sub_100461218((uint64_t)self + OBJC_IVAR____TtC17identityservicesd27IDSDSessionKeyValueDelivery_participantProvider);
  sub_10044C6AC((uint64_t)self + OBJC_IVAR____TtC17identityservicesd27IDSDSessionKeyValueDelivery_identityProvider);
  swift_unknownObjectRelease();
  sub_10044C6AC((uint64_t)self + OBJC_IVAR____TtC17identityservicesd27IDSDSessionKeyValueDelivery_cryptoHandler);

  swift_release();
}

- (void)addDeliveryHandler:(id)a3 uuid:(id)a4
{
  uint64_t v6 = sub_100725D30();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100725D00();
  v11 = *(void (**)(id, char *))((swift_isaMask & (uint64_t)self->super.isa) + 0xB8);
  swift_unknownObjectRetain();
  v12 = self;
  v11(a3, v10);
  swift_unknownObjectRelease();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (void)removeDeliveryHandler:(id)a3
{
  uint64_t v4 = sub_100725D30();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100725D00();
  uint64_t v9 = *(void (**)(char *))((swift_isaMask & (uint64_t)self->super.isa) + 0xC0);
  v10 = self;
  v9(v8);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (id)getAllKeyValueDeliveryLocalMaterialSetForGroupID:(id)a3
{
  uint64_t v4 = sub_100726430();
  unint64_t v6 = v5;
  uint64_t v7 = self;
  uint64_t v8 = (void *)sub_100457578(v4, v6);

  swift_bridgeObjectRelease();

  return v8;
}

- (NSSet)objcMaterials
{
  uint64_t v2 = self;
  id v3 = IDSDSessionKeyValueDelivery.objcMaterials.getter();

  return (NSSet *)v3;
}

- (void)receiveDictionaryData:(id)a3 forType:(int)a4 fromParticipant:(unint64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v8 = sub_100726390();
  uint64_t v9 = self;
  IDSDSessionKeyValueDelivery.receive(dictionaryData:forType:fromParticipant:)(v8, v6, a5);

  swift_bridgeObjectRelease();
}

- (void)test_receiveData:(id)a3 forKey:(unsigned int)a4 fromParticipant:(unint64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  v12 = self;
  uint64_t v9 = sub_100725B50();
  unint64_t v11 = v10;

  (*(void (**)(uint64_t, unint64_t, uint64_t, unint64_t))((swift_isaMask & (uint64_t)v12->super.isa)
                                                                               + 0x110))(v9, v11, v6, a5);
  sub_100442248(v9, v11);
}

- (void)sendData:(NSData *)a3 forKey:(unsigned int)a4 encryption:(unsigned int)a5 capability:(NSString *)a6 withCompletion:(id)a7
{
  uint64_t v13 = sub_100431F80(&qword_100A45350);
  __chkstk_darwin(v13 - 8, v14);
  v16 = (char *)&v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = _Block_copy(a7);
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = a3;
  *(_DWORD *)(v18 + 24) = a4;
  *(_DWORD *)(v18 + 28) = a5;
  *(void *)(v18 + 32) = a6;
  *(void *)(v18 + 40) = v17;
  *(void *)(v18 + 48) = self;
  uint64_t v19 = sub_100726600();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v16, 1, 1, v19);
  v20 = (void *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_100A45360;
  v20[5] = v18;
  v21 = (void *)swift_allocObject();
  v21[2] = 0;
  v21[3] = 0;
  v21[4] = &unk_100A45370;
  v21[5] = v20;
  v22 = a3;
  v23 = a6;
  v24 = self;
  sub_10045C1AC((uint64_t)v16, (uint64_t)&unk_100A45380, (uint64_t)v21);
  swift_release();
}

- (void)requestDataForKey:(unsigned int)a3 participantID:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v6 = (os_unfair_lock_s *)(*(char **)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC17identityservicesd27IDSDSessionKeyValueDelivery_state)
                          + 48);
  uint64_t v7 = self;
  os_unfair_lock_lock(v6);
  sub_10045B938((uint64_t *)&v8);
  os_unfair_lock_unlock(v6);
  if (v8)
  {
    [v8 requestKeyValueDeliveryDataForKey:v5 participantID:a4];

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

+ (id)createWithDelegate:(id)a3 session:(id)a4 metricsCollector:(id)a5 pushTokensForCapabilityProvider:(id)a6
{
  uint64_t v10 = *(void *)((char *)a4
                  + OBJC_IVAR____TtC17identityservicesd40IDSGroupEncryptionControllerGroupSession_groupID
                  + 8);
  uint64_t v22 = *(void *)((char *)a4 + OBJC_IVAR____TtC17identityservicesd40IDSGroupEncryptionControllerGroupSession_groupID);
  unint64_t v11 = *(uint64_t (**)(uint64_t))((swift_isaMask & *(void *)a4) + 0x108);
  swift_unknownObjectRetain_n();
  id v12 = a5;
  uint64_t v13 = (char *)a4;
  swift_unknownObjectRetain();
  uint64_t v14 = swift_bridgeObjectRetain();
  uint64_t v15 = v11(v14);
  uint64_t v17 = v16;
  uint64_t v18 = *(void **)&v13[OBJC_IVAR____TtC17identityservicesd40IDSGroupEncryptionControllerGroupSession_identityController];
  sub_1004407E0((uint64_t)&v13[OBJC_IVAR____TtC17identityservicesd40IDSGroupEncryptionControllerGroupSession_cryptoHandler], (uint64_t)v23);
  id v19 = objc_allocWithZone((Class)type metadata accessor for IDSDSessionKeyValueDelivery(0));
  id v20 = sub_100461840((uint64_t)a3, v22, v10, v12, v15, v17, (uint64_t)v18, (uint64_t)a6, (uint64_t)v23, v19);
  swift_unknownObjectRelease();

  swift_unknownObjectRelease_n();
  swift_unknownObjectRelease();

  return v20;
}

- (void)addMaterialProviderToSession:(id)a3
{
  uint64_t v4 = *(uint64_t (**)(unsigned char *))((*(void *)a3 & swift_isaMask) + 0x130);
  uint64_t v5 = self;
  id v6 = a3;
  uint64_t v7 = (void (*)(unsigned char *, void))v4(v15);
  uint64_t v9 = v8;
  uint64_t v10 = *v8;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v9 = v10;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v10 = sub_10045C52C(0, v10[2] + 1, 1, v10);
    *uint64_t v9 = v10;
  }
  unint64_t v13 = v10[2];
  unint64_t v12 = v10[3];
  if (v13 >= v12 >> 1)
  {
    uint64_t v10 = sub_10045C52C((void *)(v12 > 1), v13 + 1, 1, v10);
    *uint64_t v9 = v10;
  }
  v10[2] = v13 + 1;
  uint64_t v14 = &v10[2 * v13];
  v14[4] = v5;
  v14[5] = &off_10098DCC8;
  v7(v15, 0);
}

- (_TtC17identityservicesd27IDSDSessionKeyValueDelivery)init
{
  result = (_TtC17identityservicesd27IDSDSessionKeyValueDelivery *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end