@interface IDSQuerySDPersistenceManager
+ (double)dbCleanupTimeInterval;
- (BOOL)hasUsableSenderKeyFor:(id)a3 fromAny:(id)a4;
- (BOOL)senderKeyMessageSupportedFor:(id)a3;
- (IDSQuerySDPersistenceManager)init;
- (IDSQuerySDPersistenceManager)initWithFilePath:(id)a3;
- (id)activeURIsWithService:(id)a3 fromURI:(id)a4;
- (id)allPeerIDKeys;
- (id)decryptingKeyIDsWithSenderURI:(id)a3 receiverURI:(id)a4;
- (id)deviceTokensForURI:(id)a3 service:(id)a4;
- (id)earliestExpirationDateForService:(id)a3 fromURI:(id)a4 toURI:(id)a5;
- (id)endpointForPushToken:(id)a3 service:(id)a4 fromURI:(id)a5 toURI:(id)a6;
- (id)fetchEndpointsWithService:(id)a3 fromURI:(id)a4 toURI:(id)a5 ignoreExpiration:(BOOL)a6;
- (id)fetchKeyTransparencyContextFor:(id)a3 service:(id)a4;
- (id)lastQualifiedContactsMetric;
- (id)peerIDKeysForService:(id)a3;
- (id)peerIDKeysForService:(id)a3 fromURI:(id)a4;
- (id)peerMapRepresentation;
- (id)publicDeviceIdentityContainerForPushToken:(id)a3;
- (id)publicIdentityDataFor:(id)a3 uri:(id)a4 service:(id)a5;
- (id)publicKeyForService:(id)a3 pushToken:(id)a4;
- (id)recentURIsSinceDate:(id)a3 service:(id)a4;
- (id)senderCorrelationIdentifierForService:(id)a3 uri:(id)a4;
- (id)sessionTokenForService:(id)a3 fromURI:(id)a4 toURI:(id)a5 pushToken:(id)a6;
- (id)shortHandleForUri:(id)a3;
- (id)uriForShortHandle:(id)a3;
- (id)urisMatchingPushToken:(id)a3 service:(id)a4;
- (int64_t)deviceHasCapabilityWithService:(id)a3 uri:(id)a4 fromURI:(id)a5 pushToken:(id)a6 capability:(id)a7;
- (void)cleanupExpiredSessionsIfNeededWithCompletion:(id)a3;
- (void)cleanupInvalidSenderKeyEntriesWithCompletion:(id)a3;
- (void)cleanupOldRegistrationEvents;
- (void)cleanupShortHandlesWithExpireDuration:(double)a3 completion:(id)a4;
- (void)cleanupTimerFired;
- (void)deleteAllSenderKeysWithCompletion:(id)a3;
- (void)deleteAllWithCompletion:(id)a3;
- (void)deleteEndpointsWithService:(id)a3 completion:(id)a4;
- (void)deleteEndpointsWithService:(id)a3 fromURI:(id)a4 toURI:(id)a5 completion:(id)a6;
- (void)deleteEndpointsWithServices:(id)a3 fromURI:(id)a4 toURI:(id)a5 completion:(id)a6;
- (void)deleteEndpointsWithServices:(id)a3 toURIs:(id)a4 completion:(id)a5;
- (void)deletePublicIdentitiesBeforeDate:(id)a3 afterDate:(id)a4 completion:(id)a5;
- (void)performDBCleanupTasks;
- (void)saveEndpoints:(id)a3 ktContext:(id)a4 service:(id)a5 fromURI:(id)a6 toURI:(id)a7 completion:(id)a8;
- (void)savePublicIdentityData:(id)a3 token:(id)a4 uri:(id)a5 service:(id)a6 completion:(id)a7;
- (void)saveRegistrationEventWithBagKey:(id)a3 requestStart:(id)a4 completionTime:(id)a5 resultCode:(int64_t)a6 interface:(unint64_t)a7 splunkHint:(id)a8 baaSigningDigest:(id)a9;
- (void)updateKeyTransparencyContext:(id)a3 uri:(id)a4 service:(id)a5 completion:(id)a6;
- (void)updateQualifiedContactsCountWithMetric:(id)a3;
@end

@implementation IDSQuerySDPersistenceManager

- (IDSQuerySDPersistenceManager)initWithFilePath:(id)a3
{
  if (a3)
  {
    uint64_t v3 = sub_100726430();
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
  }
  return (IDSQuerySDPersistenceManager *)sub_10053B594(v3, v4);
}

- (void)cleanupTimerFired
{
  v2 = self;
  sub_10053DE70();
}

- (IDSQuerySDPersistenceManager)init
{
  result = (IDSQuerySDPersistenceManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR___IDSQuerySDPersistenceManager_logger;
  uint64_t v4 = sub_100725ED0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_release();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
}

- (void)deletePublicIdentitiesBeforeDate:(id)a3 afterDate:(id)a4 completion:(id)a5
{
  v35[1] = a4;
  v37 = self;
  uint64_t v6 = sub_100725CC0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v10 = __chkstk_darwin(v6, v9);
  v11 = (char *)v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v10, v12);
  v15 = (char *)v35 - v14;
  uint64_t v17 = __chkstk_darwin(v13, v16);
  v19 = (char *)v35 - v18;
  __chkstk_darwin(v17, v20);
  v22 = (char *)v35 - v21;
  v23 = _Block_copy(a5);
  sub_100725C70();
  v36 = v19;
  sub_100725C70();
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = v23;
  v25 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  v25(v15, v22, v6);
  v25(v11, v19, v6);
  uint64_t v26 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v27 = (v26 + 16) & ~v26;
  uint64_t v28 = (v8 + v26 + v27) & ~v26;
  uint64_t v29 = swift_allocObject();
  v30 = *(void (**)(uint64_t, char *, uint64_t))(v7 + 32);
  v30(v29 + v27, v15, v6);
  v30(v29 + v28, v11, v6);
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = sub_100583700;
  *(void *)(v31 + 24) = v24;
  v32 = *(void (**)(uint64_t (*)(uint64_t), uint64_t, uint64_t (*)(), uint64_t))((swift_isaMask & (uint64_t)v37->super.isa) + 0xE0);
  v33 = v37;
  swift_retain();
  v32(sub_10057FD38, v29, sub_100583940, v31);

  swift_release();
  swift_release();
  swift_release();
  v34 = *(void (**)(char *, uint64_t))(v7 + 8);
  v34(v36, v6);
  v34(v22, v6);
}

- (void)deleteEndpointsWithService:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = sub_100726430();
  uint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v6;
  *(void *)(v10 + 24) = v8;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = sub_100583700;
  *(void *)(v11 + 24) = v9;
  uint64_t v12 = *(void (**)(uint64_t (*)(uint64_t), uint64_t, uint64_t (*)(), uint64_t))((swift_isaMask & (uint64_t)self->super.isa) + 0xE0);
  uint64_t v13 = self;
  swift_bridgeObjectRetain();
  swift_retain();
  v12(sub_1005838F0, v10, sub_10058393C, v11);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  swift_release();
}

- (void)deleteEndpointsWithService:(id)a3 fromURI:(id)a4 toURI:(id)a5 completion:(id)a6
{
  uint64_t v9 = _Block_copy(a6);
  uint64_t v27 = sub_100726430();
  uint64_t v11 = v10;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v9;
  id v13 = a4;
  id v14 = a5;
  v15 = self;
  id v16 = [v13 prefixedURI];
  uint64_t v17 = sub_100726430();
  uint64_t v19 = v18;

  id v20 = [v14 prefixedURI];
  uint64_t v21 = sub_100726430();
  uint64_t v23 = v22;

  uint64_t v24 = (void *)swift_allocObject();
  v24[2] = v27;
  v24[3] = v11;
  v24[4] = v21;
  v24[5] = v23;
  v24[6] = v17;
  v24[7] = v19;
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = sub_100583700;
  *(void *)(v25 + 24) = v12;
  uint64_t v26 = *(void (**)(uint64_t (*)(uint64_t), void *, uint64_t (*)(), uint64_t))((swift_isaMask & (uint64_t)v15->super.isa) + 0xE0);
  swift_bridgeObjectRetain();
  swift_retain();
  v26(sub_10057FBFC, v24, sub_100583938, v25);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  swift_release();
}

- (void)deleteEndpointsWithServices:(id)a3 fromURI:(id)a4 toURI:(id)a5 completion:(id)a6
{
  uint64_t v9 = _Block_copy(a6);
  uint64_t v10 = sub_100726570();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v9;
  id v12 = a4;
  id v13 = a5;
  id v14 = self;
  id v15 = [v12 prefixedURI];
  uint64_t v16 = sub_100726430();
  uint64_t v18 = v17;

  id v19 = [v13 prefixedURI];
  uint64_t v20 = sub_100726430();
  uint64_t v22 = v21;

  uint64_t v23 = (void *)swift_allocObject();
  v23[2] = v10;
  v23[3] = v20;
  v23[4] = v22;
  v23[5] = v16;
  v23[6] = v18;
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = sub_100583700;
  *(void *)(v24 + 24) = v11;
  uint64_t v25 = *(void (**)(uint64_t (*)(uint64_t), void *, uint64_t (*)(), uint64_t))((swift_isaMask & (uint64_t)v14->super.isa) + 0xE0);
  swift_bridgeObjectRetain();
  swift_retain();
  v25(sub_10057FB74, v23, sub_100583934, v24);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  swift_release();
}

- (void)deleteEndpointsWithServices:(id)a3 toURIs:(id)a4 completion:(id)a5
{
  uint64_t v6 = _Block_copy(a5);
  uint64_t v7 = sub_100726570();
  sub_100462C50(0, (unint64_t *)&unk_100A47EC0);
  unint64_t v8 = sub_100726570();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v6;
  uint64_t v10 = self;
  sub_100541778(v7, v8, (uint64_t)sub_100583700, v9);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

- (void)deleteAllWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_100583700;
  *(void *)(v6 + 24) = v5;
  uint64_t v7 = *(void (**)(uint64_t (*)(), void, uint64_t (*)(), uint64_t))((swift_isaMask & (uint64_t)self->super.isa)
                                                                                       + 0xE0);
  unint64_t v8 = self;
  swift_retain();
  v7(sub_10054296C, 0, sub_100583930, v6);

  swift_release();

  swift_release();
}

- (void)savePublicIdentityData:(id)a3 token:(id)a4 uri:(id)a5 service:(id)a6 completion:(id)a7
{
  id v12 = _Block_copy(a7);
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  uint64_t v31 = self;
  uint64_t v17 = sub_100725B50();
  unint64_t v19 = v18;

  uint64_t v20 = sub_100725B50();
  unint64_t v22 = v21;

  uint64_t v23 = sub_100726430();
  uint64_t v25 = v24;

  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = v12;
  uint64_t v27 = (void *)swift_allocObject();
  v27[2] = v23;
  v27[3] = v25;
  v27[4] = v20;
  v27[5] = v22;
  v27[6] = v15;
  v27[7] = v17;
  v27[8] = v19;
  uint64_t v28 = swift_allocObject();
  *(void *)(v28 + 16) = sub_100583700;
  *(void *)(v28 + 24) = v26;
  v30 = *(void (**)(uint64_t (*)(uint64_t), void *, uint64_t (*)(), uint64_t))((swift_isaMask & (uint64_t)v31->super.isa) + 0xE0);
  id v29 = v15;
  swift_bridgeObjectRetain();
  sub_100441FD4(v20, v22);
  sub_100441FD4(v17, v19);
  swift_retain();
  v30(sub_10057FABC, v27, sub_10058392C, v28);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  sub_100442248(v20, v22);
  sub_100442248(v17, v19);
}

- (void)saveEndpoints:(id)a3 ktContext:(id)a4 service:(id)a5 fromURI:(id)a6 toURI:(id)a7 completion:(id)a8
{
  id v12 = _Block_copy(a8);
  sub_100462C50(0, (unint64_t *)&unk_100A48020);
  uint64_t v13 = sub_100726570();
  uint64_t v14 = sub_100726430();
  uint64_t v16 = v15;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v12;
  unint64_t v18 = (void *)swift_allocObject();
  v18[2] = v13;
  v18[3] = self;
  v18[4] = v14;
  v18[5] = v16;
  v18[6] = a7;
  v18[7] = a4;
  v18[8] = a6;
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = sub_100583700;
  *(void *)(v19 + 24) = v17;
  uint64_t v27 = *(void (**)(void (*)(uint64_t), void *, uint64_t (*)(), uint64_t))((swift_isaMask & (uint64_t)self->super.isa) + 0xE0);
  id v20 = a4;
  id v21 = a6;
  id v22 = a7;
  uint64_t v23 = self;
  id v24 = v22;
  id v25 = v20;
  id v26 = v21;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  v27(sub_10057FA18, v18, sub_100583928, v19);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  swift_release();
}

- (void)updateKeyTransparencyContext:(id)a3 uri:(id)a4 service:(id)a5 completion:(id)a6
{
  uint64_t v9 = _Block_copy(a6);
  uint64_t v10 = sub_100726430();
  uint64_t v12 = v11;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v9;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = self;
  v14[3] = v10;
  v14[4] = v12;
  v14[5] = a4;
  v14[6] = sub_10057F910;
  v14[7] = v13;
  v14[8] = a3;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = sub_10057F910;
  *(void *)(v15 + 24) = v13;
  uint64_t v16 = *(void (**)(uint64_t (*)(uint64_t), void *, uint64_t (*)(), uint64_t))((swift_isaMask & (uint64_t)self->super.isa) + 0xE0);
  id v17 = a3;
  id v18 = a4;
  uint64_t v19 = self;
  swift_retain_n();
  id v20 = v19;
  id v21 = v18;
  id v22 = v17;
  swift_bridgeObjectRetain();
  v16(sub_10057F988, v14, sub_100583924, v15);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  swift_release();
}

- (void)saveRegistrationEventWithBagKey:(id)a3 requestStart:(id)a4 completionTime:(id)a5 resultCode:(int64_t)a6 interface:(unint64_t)a7 splunkHint:(id)a8 baaSigningDigest:(id)a9
{
  uint64_t v31 = a6;
  unint64_t v32 = a7;
  uint64_t v12 = sub_100725CC0();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12, v14);
  uint64_t v16 = (char *)&v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100431F80(&qword_100A47D80);
  __chkstk_darwin(v17 - 8, v18);
  id v20 = (char *)&v29 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_100726430();
  uint64_t v22 = v21;
  if (a4)
  {
    sub_100725C70();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v20, 0, 1, v12);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v20, 1, 1, v12);
  }
  uint64_t v23 = (uint64_t)a9;
  sub_100725C70();
  if (!a8)
  {
    uint64_t v24 = 0;
    if (a9) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v27 = 0;
    goto LABEL_9;
  }
  uint64_t v24 = sub_100726430();
  a8 = v25;
  if (!a9) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v23 = sub_100726430();
  uint64_t v27 = v26;
LABEL_9:
  uint64_t v28 = self;
  sub_100544A10(v30, v22, (uint64_t)v20, (uint64_t)v16, v31, v32, v24, (uint64_t)a8, v23, v27);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
  sub_10044C150((uint64_t)v20, &qword_100A47D80);
}

- (id)fetchEndpointsWithService:(id)a3 fromURI:(id)a4 toURI:(id)a5 ignoreExpiration:(BOOL)a6
{
  uint64_t v24 = _swiftEmptyArrayStorage;
  uint64_t v17 = self;
  uint64_t v18 = sub_100726430();
  uint64_t v19 = v9;
  id v20 = a5;
  id v21 = a4;
  BOOL v22 = a6;
  uint64_t v23 = &v24;
  uint64_t v10 = *(void (**)(void, uint64_t (*)(uint64_t), uint64_t *))((swift_isaMask & (uint64_t)v17->super.isa)
                                                                                  + 0xE8);
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = v17;
  v10(0, sub_10057F8CC, &v16);

  swift_bridgeObjectRelease();
  sub_100462C50(0, (unint64_t *)&unk_100A48020);
  v14.super.isa = sub_100726560().super.isa;
  swift_bridgeObjectRelease();

  return v14.super.isa;
}

- (id)fetchKeyTransparencyContextFor:(id)a3 service:(id)a4
{
  uint64_t v17 = 0;
  id v12 = self;
  uint64_t v13 = sub_100726430();
  uint64_t v14 = v5;
  id v15 = a3;
  uint64_t v16 = &v17;
  uint64_t v6 = *(void (**)(void, uint64_t (*)(uint64_t), uint64_t *))((swift_isaMask & (uint64_t)v12->super.isa)
                                                                                 + 0xE8);
  id v7 = a3;
  unint64_t v8 = v12;
  v6(0, sub_10057F864, &v11);

  swift_bridgeObjectRelease();
  uint64_t v9 = v17;

  return v9;
}

- (id)publicIdentityDataFor:(id)a3 uri:(id)a4 service:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = self;
  uint64_t v12 = sub_100725B50();
  unint64_t v14 = v13;

  uint64_t v15 = sub_100726430();
  uint64_t v17 = v16;

  uint64_t v18 = sub_10054DD7C(v12, v14, v9, v15, v17);
  unint64_t v20 = v19;
  swift_bridgeObjectRelease();
  sub_100442248(v12, v14);

  if (v20 >> 60 == 15)
  {
    Class isa = 0;
  }
  else
  {
    Class isa = sub_100725B20().super.isa;
    sub_10044CE88(v18, v20);
  }

  return isa;
}

- (id)recentURIsSinceDate:(id)a3 service:(id)a4
{
  uint64_t v5 = sub_100725CC0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  id v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100725C70();
  uint64_t v10 = sub_100726430();
  uint64_t v12 = v11;
  unint64_t v13 = self;
  sub_10054EE68((uint64_t)v9, v10, v12);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  sub_100462C50(0, (unint64_t *)&unk_100A47EC0);
  v14.super.Class isa = sub_100726560().super.isa;
  swift_bridgeObjectRelease();

  return v14.super.isa;
}

- (BOOL)senderKeyMessageSupportedFor:(id)a3
{
  sub_100462C50(0, (unint64_t *)&unk_100A48020);
  unint64_t v4 = sub_100726570();
  uint64_t v5 = self;
  BOOL v6 = sub_10057CF78(v4);

  swift_bridgeObjectRelease();
  return v6;
}

- (id)decryptingKeyIDsWithSenderURI:(id)a3 receiverURI:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_10055E978(v6, v7);

  v9.super.Class isa = sub_100726560().super.isa;
  swift_bridgeObjectRelease();

  return v9.super.isa;
}

- (BOOL)hasUsableSenderKeyFor:(id)a3 fromAny:(id)a4
{
  sub_100462C50(0, (unint64_t *)&unk_100A47EC0);
  unint64_t v6 = sub_100726570();
  id v7 = a3;
  uint64_t v8 = self;
  LOBYTE(self) = sub_10055F4BC(v7, v6);

  swift_bridgeObjectRelease();
  return self & 1;
}

- (void)deleteAllSenderKeysWithCompletion:(id)a3
{
  unint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_1004D1148;
  *(void *)(v6 + 24) = v5;
  id v7 = *(void (**)(uint64_t (*)(), void, uint64_t (*)(), uint64_t))((swift_isaMask & (uint64_t)self->super.isa)
                                                                                       + 0xE0);
  uint64_t v8 = self;
  swift_retain();
  v7(sub_100560B18, 0, sub_100583920, v6);

  swift_release();

  swift_release();
}

- (void)performDBCleanupTasks
{
  v2 = self;
  sub_10056392C();
}

- (void)cleanupExpiredSessionsIfNeededWithCompletion:(id)a3
{
  unint64_t v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    unint64_t v4 = sub_1004D1148;
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = self;
  v6[3] = v4;
  v6[4] = v5;
  id v7 = *(void (**)(uint64_t (*)(uint64_t), void, uint64_t (*)(), void *))((swift_isaMask & (uint64_t)self->super.isa) + 0xE0);
  uint64_t v8 = self;
  sub_10057D228((uint64_t)v4);
  v7(sub_100563AE8, 0, sub_100583708, v6);
  swift_release();
  sub_1004D5EC8((uint64_t)v4);
}

- (void)cleanupShortHandlesWithExpireDuration:(double)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    uint64_t v6 = sub_1004D1148;
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = self;
  *(double *)(v8 + 24) = a3;
  NSArray v9 = (void *)swift_allocObject();
  v9[2] = self;
  v9[3] = v6;
  v9[4] = v7;
  uint64_t v10 = *(void (**)(uint64_t (*)(uint64_t), uint64_t, uint64_t (*)(), void *))((swift_isaMask & (uint64_t)self->super.isa) + 0xE0);
  uint64_t v11 = self;
  sub_10057D228((uint64_t)v6);
  v10(sub_1005838D8, v8, sub_100583704, v9);
  swift_release();
  swift_release();
  sub_1004D5EC8((uint64_t)v6);
}

- (void)cleanupInvalidSenderKeyEntriesWithCompletion:(id)a3
{
  unint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = self;
  sub_10056746C((uint64_t)sub_1004D07C8, v5);

  swift_release();
}

- (void)cleanupOldRegistrationEvents
{
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = self;
  unint64_t v4 = *(void (**)(uint64_t (*)(uint64_t), void, uint64_t (*)(), uint64_t))((swift_isaMask & (uint64_t)self->super.isa) + 0xE0);
  uint64_t v5 = self;
  v4(sub_10056A994, 0, sub_1005836FC, v3);

  swift_release();
}

- (id)lastQualifiedContactsMetric
{
  id v7 = 0;
  v6[2] = &v7;
  v6[3] = self;
  v2 = *(void (**)(void, void (*)(uint64_t), void *))((swift_isaMask & (uint64_t)self->super.isa)
                                                                             + 0xE8);
  uint64_t v3 = self;
  v2(0, sub_1005838C0, v6);

  id v4 = v7;

  return v4;
}

- (void)updateQualifiedContactsCountWithMetric:(id)a3
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a3;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = self;
  id v7 = *(void (**)(uint64_t (*)(uint64_t), uint64_t, uint64_t (*)(), uint64_t))((swift_isaMask & (uint64_t)self->super.isa) + 0xE0);
  id v8 = a3;
  NSArray v9 = self;
  id v10 = v8;
  uint64_t v11 = v9;
  v7(sub_1005836DC, v5, sub_1005836F8, v6);

  swift_release();

  swift_release();
}

- (id)deviceTokensForURI:(id)a3 service:(id)a4
{
  uint64_t v18 = &_swiftEmptySetSingleton;
  unint64_t v13 = self;
  uint64_t v14 = sub_100726430();
  uint64_t v15 = v5;
  id v16 = a3;
  uint64_t v17 = &v18;
  uint64_t v6 = *(void (**)(void, uint64_t (*)(uint64_t), uint64_t *))((swift_isaMask & (uint64_t)v13->super.isa)
                                                                                 + 0xE8);
  id v7 = a3;
  id v8 = v13;
  v6(0, sub_10057F7B0, &v12);
  uint64_t v9 = (uint64_t)v18;
  swift_bridgeObjectRetain();
  sub_1005723AC(v9, (unint64_t *)&qword_100A47A80, (uint64_t)IDSPushToken_ptr, (unint64_t *)&qword_100A48110);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  sub_100462C50(0, (unint64_t *)&qword_100A47A80);
  v10.super.Class isa = sub_100726560().super.isa;
  swift_release();

  return v10.super.isa;
}

- (int64_t)deviceHasCapabilityWithService:(id)a3 uri:(id)a4 fromURI:(id)a5 pushToken:(id)a6 capability:(id)a7
{
  int64_t v28 = 0;
  unint64_t v19 = self;
  uint64_t v20 = sub_100726430();
  uint64_t v21 = v10;
  id v22 = a4;
  id v23 = a6;
  id v24 = a5;
  id v25 = &v28;
  uint64_t v26 = sub_100726430();
  uint64_t v27 = v11;
  uint64_t v12 = *(void (**)(void, void (*)(uint64_t), uint64_t *))((swift_isaMask & (uint64_t)v19->super.isa)
                                                                               + 0xE8);
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = v19;
  v12(0, sub_10057F760, &v18);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v28;
}

- (id)sessionTokenForService:(id)a3 fromURI:(id)a4 toURI:(id)a5 pushToken:(id)a6
{
  uint64_t v25 = sub_100726430();
  uint64_t v9 = v8;
  uint64_t v24 = sub_100726430();
  uint64_t v11 = v10;
  uint64_t v12 = sub_100726430();
  uint64_t v14 = v13;
  id v15 = a6;
  id v16 = self;
  uint64_t v17 = sub_100725B50();
  unint64_t v19 = v18;

  long long v37 = xmmword_100795A50;
  uint64_t v27 = v16;
  uint64_t v28 = v25;
  uint64_t v29 = v9;
  uint64_t v30 = v24;
  uint64_t v31 = v11;
  uint64_t v32 = v12;
  uint64_t v33 = v14;
  uint64_t v34 = v17;
  unint64_t v35 = v19;
  v36 = &v37;
  (*(void (**)(void, uint64_t (*)(uint64_t), unsigned char *))((swift_isaMask & (uint64_t)v16->super.isa)
                                                                           + 0xE8))(0, sub_10057F6F8, v26);
  sub_100442248(v17, v19);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  Class isa = 0;
  unint64_t v21 = *((void *)&v37 + 1);
  if (*((void *)&v37 + 1) >> 60 != 15)
  {
    uint64_t v22 = v37;
    Class isa = sub_100725B20().super.isa;
    sub_10044CE88(v22, v21);
  }

  return isa;
}

- (id)activeURIsWithService:(id)a3 fromURI:(id)a4
{
  return sub_10056F358(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)sub_10057F6CC, (unint64_t *)&unk_100A47EC0, (uint64_t)IDSURI_ptr, (unint64_t *)&unk_100A46850);
}

- (id)urisMatchingPushToken:(id)a3 service:(id)a4
{
  unint64_t v19 = _swiftEmptyArrayStorage;
  uint64_t v14 = self;
  uint64_t v15 = sub_100726430();
  uint64_t v16 = v5;
  id v17 = a3;
  unint64_t v18 = &v19;
  uint64_t v6 = *(void (**)(void, uint64_t (*)(uint64_t), uint64_t *))((swift_isaMask & (uint64_t)v14->super.isa)
                                                                                 + 0xE8);
  id v7 = a3;
  uint64_t v8 = v14;
  v6(0, sub_10057F6A0, &v13);
  unint64_t v9 = swift_bridgeObjectRetain();
  uint64_t v10 = sub_100481658(v9, (unint64_t *)&unk_100A47EC0, (uint64_t)IDSURI_ptr, (unint64_t *)&unk_100A46850, &qword_100A459E0);
  swift_bridgeObjectRelease();
  sub_1005723AC(v10, (unint64_t *)&unk_100A47EC0, (uint64_t)IDSURI_ptr, (unint64_t *)&unk_100A46850);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100462C50(0, (unint64_t *)&unk_100A47EC0);
  v11.super.Class isa = sub_100726560().super.isa;
  swift_release();

  return v11.super.isa;
}

- (id)publicKeyForService:(id)a3 pushToken:(id)a4
{
  long long v19 = xmmword_100795A50;
  uint64_t v14 = self;
  uint64_t v15 = sub_100726430();
  uint64_t v16 = v5;
  id v17 = a4;
  unint64_t v18 = &v19;
  uint64_t v6 = *(void (**)(void, uint64_t (*)(uint64_t), uint64_t *))((swift_isaMask & (uint64_t)v14->super.isa)
                                                                                 + 0xE8);
  id v7 = a4;
  uint64_t v8 = v14;
  v6(0, sub_10057F638, &v13);

  swift_bridgeObjectRelease();
  Class isa = 0;
  unint64_t v10 = *((void *)&v19 + 1);
  if (*((void *)&v19 + 1) >> 60 != 15)
  {
    uint64_t v11 = v19;
    Class isa = sub_100725B20().super.isa;
    sub_10044CE88(v11, v10);
  }

  return isa;
}

- (id)publicDeviceIdentityContainerForPushToken:(id)a3
{
  id v10 = 0;
  v9[2] = self;
  v9[3] = a3;
  v9[4] = &v10;
  id v4 = *(void (**)(void, void (*)(uint64_t), void *))((swift_isaMask & (uint64_t)self->super.isa)
                                                                             + 0xE8);
  id v5 = a3;
  uint64_t v6 = self;
  v4(0, sub_100583908, v9);

  id v7 = v10;

  return v7;
}

- (id)senderCorrelationIdentifierForService:(id)a3 uri:(id)a4
{
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t v12 = self;
  uint64_t v13 = sub_100726430();
  uint64_t v14 = v5;
  id v15 = a4;
  uint64_t v16 = &v17;
  uint64_t v6 = *(void (**)(void, uint64_t (*)(uint64_t), uint64_t *))((swift_isaMask & (uint64_t)v12->super.isa)
                                                                                 + 0xE8);
  id v7 = a4;
  uint64_t v8 = v12;
  v6(0, sub_10057F60C, &v11);

  swift_bridgeObjectRelease();
  if (v18)
  {
    NSString v9 = sub_100726420();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v9 = 0;
  }

  return v9;
}

- (id)earliestExpirationDateForService:(id)a3 fromURI:(id)a4 toURI:(id)a5
{
  uint64_t v8 = sub_100431F80(&qword_100A47D80);
  uint64_t v10 = __chkstk_darwin(v8 - 8, v9);
  uint64_t v12 = (char *)v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10, v13);
  id v15 = (char *)v27 - v14;
  uint64_t v16 = sub_100726430();
  uint64_t v18 = v17;
  v27[1] = v17;
  uint64_t v19 = sub_100725CC0();
  uint64_t v20 = *(void *)(v19 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v20 + 56))(v12, 1, 1, v19);
  uint64_t v29 = self;
  uint64_t v30 = v16;
  uint64_t v31 = v18;
  id v32 = a4;
  id v33 = a5;
  uint64_t v34 = v12;
  unint64_t v21 = *(void (**)(void, uint64_t (*)(uint64_t), char *))((swift_isaMask & (uint64_t)self->super.isa)
                                                                               + 0xE8);
  id v22 = a4;
  id v23 = a5;
  uint64_t v24 = self;
  v21(0, sub_10057F5A4, v28);
  sub_100462BE4((uint64_t)v12, (uint64_t)v15, &qword_100A47D80);

  swift_bridgeObjectRelease();
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v15, 1, v19) != 1)
  {
    Class isa = sub_100725BE0().super.isa;
    (*(void (**)(char *, uint64_t))(v20 + 8))(v15, v19);
  }

  return isa;
}

- (id)endpointForPushToken:(id)a3 service:(id)a4 fromURI:(id)a5 toURI:(id)a6
{
  id v25 = 0;
  uint64_t v18 = self;
  uint64_t v19 = sub_100726430();
  uint64_t v20 = v9;
  id v21 = a6;
  id v22 = a3;
  id v23 = a5;
  uint64_t v24 = &v25;
  uint64_t v10 = *(void (**)(void, void (*)(uint64_t), uint64_t *))((swift_isaMask & (uint64_t)v18->super.isa)
                                                                               + 0xE8);
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = v18;
  v10(0, sub_10057F554, &v17);

  swift_bridgeObjectRelease();
  id v15 = v25;

  return v15;
}

- (id)peerIDKeysForService:(id)a3
{
  uint64_t v14 = &_swiftEmptySetSingleton;
  uint64_t v10 = self;
  uint64_t v11 = sub_100726430();
  uint64_t v12 = v3;
  id v13 = &v14;
  id v4 = *(void (**)(void, unint64_t (*)(uint64_t), uint64_t *))((swift_isaMask & (uint64_t)v10->super.isa)
                                                                                          + 0xE8);
  uint64_t v5 = v10;
  v4(0, sub_1005837DC, &v9);
  uint64_t v6 = swift_bridgeObjectRetain();
  sub_1005723AC(v6, &qword_100A48000, (uint64_t)off_10097CB58, (unint64_t *)&unk_100A48010);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  sub_100462C50(0, &qword_100A48000);
  v7.super.Class isa = sub_100726560().super.isa;
  swift_release();

  return v7.super.isa;
}

- (id)peerIDKeysForService:(id)a3 fromURI:(id)a4
{
  return sub_10056F358(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)sub_10057F528, &qword_100A48000, (uint64_t)off_10097CB58, (unint64_t *)&unk_100A48010);
}

- (id)allPeerIDKeys
{
  uint64_t v8 = &_swiftEmptySetSingleton;
  v7[2] = self;
  v7[3] = &v8;
  v2 = *(void (**)(void, unint64_t (*)(uint64_t), void *))((swift_isaMask & (uint64_t)self->super.isa)
                                                                                         + 0xE8);
  uint64_t v3 = self;
  v2(0, sub_1005838A8, v7);
  uint64_t v4 = swift_bridgeObjectRetain();
  sub_1005723AC(v4, &qword_100A48000, (uint64_t)off_10097CB58, (unint64_t *)&unk_100A48010);

  swift_bridgeObjectRelease_n();
  sub_100462C50(0, &qword_100A48000);
  v5.super.Class isa = sub_100726560().super.isa;
  swift_release();

  return v5.super.isa;
}

- (id)peerMapRepresentation
{
  NSArray v7 = &_swiftEmptyDictionarySingleton;
  v6[2] = self;
  v6[3] = &v7;
  v2 = *(void (**)(void, uint64_t (*)(uint64_t), void *))((swift_isaMask & (uint64_t)self->super.isa)
                                                                                + 0xE8);
  uint64_t v3 = self;
  v2(0, sub_100583890, v6);

  sub_100462C50(0, &qword_100A48000);
  sub_100462C50(0, &qword_100A48008);
  sub_100480C20((unint64_t *)&unk_100A48010, &qword_100A48000);
  v4.super.Class isa = sub_100726380().super.isa;
  swift_bridgeObjectRelease();

  return v4.super.isa;
}

- (id)uriForShortHandle:(id)a3
{
  uint64_t v4 = sub_100726430();
  uint64_t v6 = v5;
  NSArray v7 = self;
  id v8 = sub_1005706D0(v4, v6);

  swift_bridgeObjectRelease();

  return v8;
}

- (id)shortHandleForUri:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100571074(v4);
  uint64_t v7 = v6;

  if (v7)
  {
    NSString v8 = sub_100726420();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v8 = 0;
  }

  return v8;
}

+ (double)dbCleanupTimeInterval
{
  id v0 = [self sharedInstance];
  NSString v1 = sub_100726420();
  id v2 = [v0 objectForKey:v1];

  if (v2)
  {
    sub_100726870();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_100462BE4((uint64_t)v6, (uint64_t)v7, &qword_100A44F00);
  if (v8)
  {
    sub_100462C50(0, (unint64_t *)&unk_100A468F0);
    if (swift_dynamicCast())
    {
      id v3 = [v5 integerValue];

      return (double)(uint64_t)v3;
    }
  }
  else
  {
    sub_10044C150((uint64_t)v7, &qword_100A44F00);
  }
  return 86400.0;
}

@end