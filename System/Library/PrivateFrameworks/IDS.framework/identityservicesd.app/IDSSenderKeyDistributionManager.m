@interface IDSSenderKeyDistributionManager
+ (double)cleanupKeysTimeInterval;
- (BOOL)hasAnyUsableSenderKeyFor:(id)a3;
- (BOOL)hasUsableSenderKeyFor:(id)a3 from:(id)a4;
- (IDSSenderKeyDistributionManager)init;
- (IDSSenderKeyDistributionManager)initWithPersistenceManager:(id)a3 service:(id)a4;
- (id)decryptingKeyIDsFor:(id)a3 localURI:(id)a4;
- (id)encryptingKeyIDsFor:(id)a3 localURI:(id)a4;
- (id)formattedDonatedHandleList;
- (id)formattedSenderKeyListFor:(id)a3;
- (id)missingRemoteEncryptingKeyIDs:(id)a3;
- (id)processedKeyMessageWithRemoteURI:(id)a3 localURI:(id)a4 messageData:(id)a5 messageGUID:(id)a6;
- (id)remoteMissingDecryptingKeyIDs:(id)a3 remoteURI:(id)a4 localURI:(id)a5;
- (void)dealloc;
- (void)generateAndSendKeyIfNeededToURIs:(id)a3 fromURI:(id)a4 context:(id)a5 completion:(id)a6;
- (void)handleRemoteDeviceUpdateWithRemoteURI:(id)a3 localURI:(id)a4;
- (void)markLastActivePeerToken:(id)a3 localURI:(id)a4 remoteURI:(id)a5;
- (void)markLastIMessagedPeerToken:(id)a3 localURI:(id)a4 remoteURI:(id)a5;
- (void)processDonatedHandlesForMessagingKeysWithUris:(id)a3 fromURI:(id)a4 priority:(int64_t)a5 isInitialDonation:(BOOL)a6 completion:(id)a7;
- (void)registrationController:(id)a3 deregistrationWillStart:(id)a4;
- (void)resetKeyStateWithKeyIDs:(id)a3 senderURI:(id)a4 receiverURI:(id)a5;
- (void)systemDidLeaveFirstDataProtectionLock;
- (void)triggerKeyRecoveryToURI:(id)a3 fromURI:(id)a4 keysToSend:(id)a5 keysToRequest:(id)a6;
- (void)updateDeliveredStateWithKeyIDStrings:(id)a3 pushToken:(id)a4;
@end

@implementation IDSSenderKeyDistributionManager

- (IDSSenderKeyDistributionManager)initWithPersistenceManager:(id)a3 service:(id)a4
{
  uint64_t v5 = sub_100726430();
  unint64_t v7 = v6;
  id v8 = a3;
  return (IDSSenderKeyDistributionManager *)sub_1004ABCBC(a3, v5, v7);
}

- (void)dealloc
{
  v2 = self;
  sub_1004AC2BC();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___IDSSenderKeyDistributionManager_logger;
  uint64_t v4 = sub_100725ED0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___IDSSenderKeyDistributionManager____lazy_storage___unsentRateLimiter));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___IDSSenderKeyDistributionManager____lazy_storage___iMessageReceiveRateLimiter));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___IDSSenderKeyDistributionManager____lazy_storage___lastActiveRateLimiter));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___IDSSenderKeyDistributionManager____lazy_storage___lastIMessagedRateLimiter));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)generateAndSendKeyIfNeededToURIs:(id)a3 fromURI:(id)a4 context:(id)a5 completion:(id)a6
{
  id v8 = _Block_copy(a6);
  sub_100462C50(0, (unint64_t *)&unk_100A47EC0);
  uint64_t v9 = sub_100726570();
  uint64_t v10 = sub_100726430();
  uint64_t v12 = v11;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v8;
  v14 = *(void (**)(uint64_t, id, uint64_t, uint64_t, void, void *, uint64_t (*)(char), uint64_t))((swift_isaMask & (uint64_t)self->super.isa) + 0x1D8);
  id v15 = a4;
  v16 = self;
  v14(v9, v15, v10, v12, 0, _swiftEmptyArrayStorage, sub_1004D1148, v13);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

- (void)markLastActivePeerToken:(id)a3 localURI:(id)a4 remoteURI:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = self;
  sub_1004B1220(v8, v9, v10);
}

- (void)markLastIMessagedPeerToken:(id)a3 localURI:(id)a4 remoteURI:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = self;
  sub_1004B15EC(v8, v9, v10);
}

- (id)processedKeyMessageWithRemoteURI:(id)a3 localURI:(id)a4 messageData:(id)a5 messageGUID:(id)a6
{
  unint64_t v7 = a5;
  if (a5)
  {
    id v11 = a3;
    id v12 = a4;
    id v13 = a6;
    v14 = self;
    id v15 = v7;
    unint64_t v7 = (void *)sub_100725B50();
    unint64_t v17 = v16;
  }
  else
  {
    id v18 = a3;
    id v19 = a4;
    id v20 = a6;
    v21 = self;
    unint64_t v17 = 0xF000000000000000;
  }
  uint64_t v22 = sub_100726430();
  uint64_t v24 = v23;

  sub_1004B19B8(a3, a4, (uint64_t)v7, v17, v22, v24);
  swift_bridgeObjectRelease();
  sub_10044CE88((uint64_t)v7, v17);

  v25.super.isa = sub_100726560().super.isa;
  swift_bridgeObjectRelease();

  return v25.super.isa;
}

- (void)triggerKeyRecoveryToURI:(id)a3 fromURI:(id)a4 keysToSend:(id)a5 keysToRequest:(id)a6
{
  uint64_t v9 = sub_100726570();
  uint64_t v10 = sub_100726570();
  id v13 = a3;
  id v11 = a4;
  id v12 = self;
  sub_1004B353C(v13, v11, v9, v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)resetKeyStateWithKeyIDs:(id)a3 senderURI:(id)a4 receiverURI:(id)a5
{
  if (a3) {
    uint64_t v8 = sub_100726570();
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  sub_1004B44A8(v8, v9, v10);

  swift_bridgeObjectRelease();
}

- (void)handleRemoteDeviceUpdateWithRemoteURI:(id)a3 localURI:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  unint64_t v7 = self;
  sub_1004B4844(v8, v6);
}

- (void)updateDeliveredStateWithKeyIDStrings:(id)a3 pushToken:(id)a4
{
  uint64_t v6 = sub_100726570();
  id v7 = a4;
  id v8 = self;
  sub_1004B5760(v6, v7);

  swift_bridgeObjectRelease();
}

- (id)encryptingKeyIDsFor:(id)a3 localURI:(id)a4
{
  return sub_1004BA738(self, (uint64_t)a2, a3, a4, (void (*)(id, id))sub_1004B9A9C);
}

- (id)decryptingKeyIDsFor:(id)a3 localURI:(id)a4
{
  return sub_1004BA738(self, (uint64_t)a2, a3, a4, (void (*)(id, id))sub_1004BA588);
}

- (id)missingRemoteEncryptingKeyIDs:(id)a3
{
  uint64_t v4 = sub_100726570();
  uint64_t v5 = self;
  sub_1004BA7D8(v4);

  swift_bridgeObjectRelease();
  v6.super.isa = sub_100726560().super.isa;
  swift_bridgeObjectRelease();

  return v6.super.isa;
}

- (id)remoteMissingDecryptingKeyIDs:(id)a3 remoteURI:(id)a4 localURI:(id)a5
{
  id v8 = (void *)sub_100726570();
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  sub_1004BAA00(v8, (uint64_t)v9, (uint64_t)v10);

  swift_bridgeObjectRelease();
  v12.super.isa = sub_100726560().super.isa;
  swift_bridgeObjectRelease();

  return v12.super.isa;
}

- (BOOL)hasUsableSenderKeyFor:(id)a3 from:(id)a4
{
  NSArray v6 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0xA8);
  id v7 = a3;
  id v8 = a4;
  id v9 = self;
  id v10 = (void *)v6();
  LOBYTE(v6) = sub_10055F18C(v7, v8);

  return v6 & 1;
}

- (BOOL)hasAnyUsableSenderKeyFor:(id)a3
{
  uint64_t v4 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0xA8);
  id v5 = a3;
  NSArray v6 = self;
  id v7 = (void *)v4();
  LOBYTE(v4) = sub_10055F274((uint64_t)v5);

  return v4 & 1;
}

- (id)formattedSenderKeyListFor:(id)a3
{
  unint64_t v3 = (unint64_t)a3;
  if (a3)
  {
    sub_100462C50(0, (unint64_t *)&unk_100A47EC0);
    unint64_t v3 = sub_100726570();
  }
  id v5 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0xA8);
  NSArray v6 = self;
  id v7 = (void *)v5();
  sub_1005618D8(v3);

  id v10 = (void *)((uint64_t (*)(uint64_t, uint64_t))v5)(v8, v9);
  NSArray v12 = sub_100561E28(v3, v11);
  v14 = v13;

  v18._countAndFlagsBits = (uint64_t)v12;
  v18._object = v14;
  sub_1007264C0(v18);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  NSString v15 = sub_100726420();
  swift_bridgeObjectRelease();

  return v15;
}

- (id)formattedDonatedHandleList
{
  v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0xA8);
  unint64_t v3 = self;
  uint64_t v4 = (void *)v2();
  sub_10056334C();

  NSString v5 = sub_100726420();
  swift_bridgeObjectRelease();

  return v5;
}

- (void)processDonatedHandlesForMessagingKeysWithUris:(id)a3 fromURI:(id)a4 priority:(int64_t)a5 isInitialDonation:(BOOL)a6 completion:(id)a7
{
  BOOL v7 = a6;
  uint64_t v11 = _Block_copy(a7);
  sub_100462C50(0, (unint64_t *)&unk_100A47EC0);
  sub_100480C20((unint64_t *)&unk_100A46850, (unint64_t *)&unk_100A47EC0);
  uint64_t v12 = sub_100726640();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v11;
  id v15 = a4;
  v14 = self;
  sub_1004BB5A0(v12, v15, a5, v7, (uint64_t)sub_1004D07C8, v13);
  swift_release();
  swift_bridgeObjectRelease();
}

- (IDSSenderKeyDistributionManager)init
{
  result = (IDSSenderKeyDistributionManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)systemDidLeaveFirstDataProtectionLock
{
  v2 = self;
  sub_1004BBBC0();
}

- (void)registrationController:(id)a3 deregistrationWillStart:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_1004CD5DC(a4);
}

+ (double)cleanupKeysTimeInterval
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