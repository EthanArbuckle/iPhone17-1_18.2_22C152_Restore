@interface IDSGroupEncryptionController2
- (IDSPushToken)pushToken;
- (IDSRealTimeEncryptionIdentity)objcIdentity;
- (IDSRealTimeEncryptionIdentity)objcPreviousIdentity;
- (IDSRealTimeEncryptionIdentity)objcPreviousPublicIdentity;
- (IDSRealTimeEncryptionIdentity)objcPublicIdentity;
- (NSData)previousPublicIdentityData;
- (NSData)publicIdentityData;
- (NSDictionary)publicKeys;
- (_TtC17identityservicesd29IDSGroupEncryptionController2)init;
- (_TtC17identityservicesd29IDSGroupEncryptionController2)initWithDelegate:(id)a3 config:(id)a4 sessionProvider:(id)a5 identityController:(id)a6 pushHandler:(id)a7;
- (_TtC17identityservicesd36IDSGroupEncryptionIdentityController)identityController;
- (_TtP17identityservicesd19IDSDSessionProvider_)sessionProvider;
- (_TtP17identityservicesd27IDSGroupPushHandlerProtocol_)pushHandler;
- (__SecKey)fullIdentityKey;
- (__SecKey)previousFullIdentityKey;
- (__SecKey)previousPublicIdentityKey;
- (__SecKey)publicIdentityKey;
- (id)groupForID:(id)a3;
- (id)objcPublicIdentityForPushToken:(id)a3;
- (int64_t)publicIdentityWrapMode;
- (void)cleanUpGroupForID:(id)a3 after:(double)a4;
- (void)receivePublicIdentity:(id)a3;
- (void)receivePublicKey:(id)a3 forPushToken:(id)a4 fromURI:(id)a5 groupID:(id)a6 sessionID:(id)a7 serverDate:(id)a8 wrapMode:(int64_t)a9;
@end

@implementation IDSGroupEncryptionController2

- (_TtC17identityservicesd36IDSGroupEncryptionIdentityController)identityController
{
  return (_TtC17identityservicesd36IDSGroupEncryptionIdentityController *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC17identityservicesd29IDSGroupEncryptionController2_identityController);
}

- (_TtP17identityservicesd19IDSDSessionProvider_)sessionProvider
{
  v2 = (void *)swift_unknownObjectRetain();

  return (_TtP17identityservicesd19IDSDSessionProvider_ *)v2;
}

- (_TtP17identityservicesd27IDSGroupPushHandlerProtocol_)pushHandler
{
  v2 = (void *)swift_unknownObjectRetain();

  return (_TtP17identityservicesd27IDSGroupPushHandlerProtocol_ *)v2;
}

- (IDSPushToken)pushToken
{
  v2 = self;
  id v3 = sub_1004EDB08();

  return (IDSPushToken *)v3;
}

- (int64_t)publicIdentityWrapMode
{
  v2 = self;
  int64_t v3 = sub_1004EDD6C();

  return v3;
}

- (__SecKey)fullIdentityKey
{
  uint64_t v3 = sub_100431F80(&qword_100A451F0);
  __chkstk_darwin(v3 - 8, v4);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(void (**)(void))((swift_isaMask & **(void **)((char *)&self->super.isa
                                                       + OBJC_IVAR____TtC17identityservicesd29IDSGroupEncryptionController2_identityController))
                        + 0x130);
  v8 = self;
  v7();
  uint64_t v9 = type metadata accessor for IDSGroupEncryptionFullIdentity(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48))(v6, 1, v9) == 1)
  {
    sub_10044C150((uint64_t)v6, &qword_100A451F0);
    id v10 = 0;
  }
  else
  {
    id v10 = *(id *)&v6[*(int *)(v9 + 20)];
    sub_1004EDCD8((uint64_t)v6, type metadata accessor for IDSGroupEncryptionFullIdentity);
  }

  return (__SecKey *)v10;
}

- (__SecKey)publicIdentityKey
{
  v2 = self;
  id v3 = sub_1004EE258();

  return (__SecKey *)v3;
}

- (NSData)publicIdentityData
{
  uint64_t v3 = type metadata accessor for IDSGroupEncryptionPublicIdentity(0);
  __chkstk_darwin(v3 - 8, v4);
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100431F80(&qword_100A451F0);
  __chkstk_darwin(v7 - 8, v8);
  id v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(void (**)(void))((swift_isaMask & **(void **)((char *)&self->super.isa
                                                        + OBJC_IVAR____TtC17identityservicesd29IDSGroupEncryptionController2_identityController))
                         + 0x130);
  uint64_t v12 = self;
  v11();
  uint64_t v13 = type metadata accessor for IDSGroupEncryptionFullIdentity(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48))(v10, 1, v13) == 1)
  {
    sub_10044C150((uint64_t)v10, &qword_100A451F0);

    Class isa = 0;
  }
  else
  {
    sub_1004EEA50((uint64_t)v10, (uint64_t)v6, type metadata accessor for IDSGroupEncryptionPublicIdentity);
    sub_1004EDCD8((uint64_t)v10, type metadata accessor for IDSGroupEncryptionFullIdentity);
    v15 = sub_1005353E4();
    unint64_t v17 = v16;
    sub_1004EDCD8((uint64_t)v6, type metadata accessor for IDSGroupEncryptionPublicIdentity);

    if (v17 >> 60 == 15)
    {
      Class isa = 0;
    }
    else
    {
      Class isa = sub_100725B20().super.isa;
      sub_10044CE88((uint64_t)v15, v17);
    }
  }

  return (NSData *)isa;
}

- (__SecKey)previousFullIdentityKey
{
  v2 = self;
  id v3 = sub_1004EE884();

  return (__SecKey *)v3;
}

- (__SecKey)previousPublicIdentityKey
{
  v2 = self;
  id v3 = sub_1004EEAFC();

  return (__SecKey *)v3;
}

- (NSData)previousPublicIdentityData
{
  v2 = self;
  id v3 = sub_1004EEDDC();
  unint64_t v5 = v4;

  if (v5 >> 60 == 15)
  {
    Class isa = 0;
  }
  else
  {
    Class isa = sub_100725B20().super.isa;
    sub_10044CE88((uint64_t)v3, v5);
  }

  return (NSData *)isa;
}

- (NSDictionary)publicKeys
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC17identityservicesd29IDSGroupEncryptionController2_publicIdentitiesLock);
  id v3 = self;
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 24));
  sub_1004EF190((uint64_t *)(v2 + 16), &v6);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 24));

  swift_release();
  sub_100462C50(0, (unint64_t *)&qword_100A47A80);
  sub_1004ED1E4();
  v4.super.Class isa = sub_100726380().super.isa;
  swift_bridgeObjectRelease();

  return (NSDictionary *)v4.super.isa;
}

- (_TtC17identityservicesd29IDSGroupEncryptionController2)initWithDelegate:(id)a3 config:(id)a4 sessionProvider:(id)a5 identityController:(id)a6 pushHandler:(id)a7
{
  swift_unknownObjectRetain();
  id v12 = a4;
  swift_unknownObjectRetain();
  id v13 = a6;
  swift_unknownObjectRetain();
  v14 = (_TtC17identityservicesd29IDSGroupEncryptionController2 *)sub_1004F593C((uint64_t)a3, v12, (uint64_t)a5, v13, (uint64_t)a7);
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v14;
}

- (id)groupForID:(id)a3
{
  sub_100726430();
  uint64_t v4 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC17identityservicesd29IDSGroupEncryptionController2_groupsLock);
  unint64_t v5 = self;
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v4 + 32));
  sub_1004F7364((void *)(v4 + 16), &v8);
  os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 32));
  uint64_t v6 = v8;

  swift_bridgeObjectRelease();
  swift_release();

  return v6;
}

- (void)receivePublicIdentity:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self;
  sub_1004EFF04(v4);
}

- (void)receivePublicKey:(id)a3 forPushToken:(id)a4 fromURI:(id)a5 groupID:(id)a6 sessionID:(id)a7 serverDate:(id)a8 wrapMode:(int64_t)a9
{
  uint64_t v34 = a9;
  uint64_t v16 = sub_100725CC0();
  uint64_t v35 = *(void *)(v16 - 8);
  uint64_t v36 = v16;
  __chkstk_darwin(v16, v17);
  uint64_t v19 = (char *)&v33 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v20 = a3;
  id v33 = a4;
  id v21 = a5;
  id v22 = a6;
  id v23 = a7;
  id v24 = a8;
  v25 = self;
  uint64_t v26 = sub_100725B50();
  unint64_t v28 = v27;

  uint64_t v29 = sub_100726430();
  uint64_t v31 = v30;

  sub_100725C70();
  v32 = v33;
  sub_1004F6334(v26, v28, v33, v21, v29, v31, (uint64_t)v19, v34);
  swift_bridgeObjectRelease();
  sub_100442248(v26, v28);

  (*(void (**)(char *, uint64_t))(v35 + 8))(v19, v36);
}

- (id)objcPublicIdentityForPushToken:(id)a3
{
  uint64_t v4 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC17identityservicesd29IDSGroupEncryptionController2_publicIdentitiesLock);
  id v5 = a3;
  uint64_t v6 = self;
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v4 + 24));
  sub_1004F737C((uint64_t *)(v4 + 16), &v9);
  os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 24));
  uint64_t v7 = v9;

  swift_release();

  return v7;
}

- (void)cleanUpGroupForID:(id)a3 after:(double)a4
{
  uint64_t v6 = sub_100726430();
  unint64_t v8 = v7;
  uint64_t v9 = self;
  sub_1004F1868(v6, v8, a4);

  swift_bridgeObjectRelease();
}

- (IDSRealTimeEncryptionIdentity)objcPublicIdentity
{
  uint64_t v2 = self;
  id v3 = sub_1004F201C();

  return (IDSRealTimeEncryptionIdentity *)v3;
}

- (IDSRealTimeEncryptionIdentity)objcPreviousPublicIdentity
{
  uint64_t v2 = self;
  id v3 = sub_1004F2230();

  return (IDSRealTimeEncryptionIdentity *)v3;
}

- (IDSRealTimeEncryptionIdentity)objcIdentity
{
  uint64_t v3 = sub_100431F80(&qword_100A451F0);
  __chkstk_darwin(v3 - 8, v4);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v7 = *(void (**)(void))((swift_isaMask & **(void **)((char *)&self->super.isa
                                                       + OBJC_IVAR____TtC17identityservicesd29IDSGroupEncryptionController2_identityController))
                        + 0x130);
  unint64_t v8 = self;
  v7();
  uint64_t v9 = type metadata accessor for IDSGroupEncryptionFullIdentity(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48))(v6, 1, v9) == 1)
  {
    sub_10044C150((uint64_t)v6, &qword_100A451F0);
    id v10 = 0;
  }
  else
  {
    id v10 = sub_1005359BC();
    sub_1004EDCD8((uint64_t)v6, type metadata accessor for IDSGroupEncryptionFullIdentity);
  }

  return (IDSRealTimeEncryptionIdentity *)v10;
}

- (IDSRealTimeEncryptionIdentity)objcPreviousIdentity
{
  uint64_t v2 = self;
  id v3 = sub_1004F277C();

  return (IDSRealTimeEncryptionIdentity *)v3;
}

- (_TtC17identityservicesd29IDSGroupEncryptionController2)init
{
  result = (_TtC17identityservicesd29IDSGroupEncryptionController2 *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC17identityservicesd29IDSGroupEncryptionController2_l;
  uint64_t v4 = sub_100725ED0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_release();
  swift_release();
  sub_100461218((uint64_t)self + OBJC_IVAR____TtC17identityservicesd29IDSGroupEncryptionController2_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17identityservicesd29IDSGroupEncryptionController2_config));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17identityservicesd29IDSGroupEncryptionController2_identityController));
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_10044C6AC((uint64_t)self + OBJC_IVAR____TtC17identityservicesd29IDSGroupEncryptionController2_cryptoHandler);
}

@end