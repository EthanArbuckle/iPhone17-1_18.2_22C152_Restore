@interface OctaneXPCService
- (_TtC25ASOctaneSupportXPCService16OctaneXPCService)init;
- (void)appRemovedWithBundleID:(id)a3 withReply:(id)a4;
- (void)buyProductWithConfiguration:(id)a3 withReply:(id)a4;
- (void)buyProductWithID:(id)a3 bundleID:(id)a4 withReply:(id)a5;
- (void)cancelTransactionWithIdentifier:(unint64_t)a3 forBundleID:(id)a4 withReply:(id)a5;
- (void)changeAutoRenewStatus:(BOOL)a3 transactionID:(unint64_t)a4 bundleID:(id)a5 withReply:(id)a6;
- (void)clearOverridesForBundleID:(id)a3 withReply:(id)a4;
- (void)completeAskToBuyRequestWithResponse:(BOOL)a3 transactionIdentifier:(unint64_t)a4 forBundleID:(id)a5 withReply:(id)a6;
- (void)completePriceConsentRequestWithResponse:(BOOL)a3 transactionIdentifier:(unint64_t)a4 forBundleID:(NSString *)a5 withReply:(id)a6;
- (void)deleteAllTransactionsForBundleID:(id)a3 withRelpy:(id)a4;
- (void)deleteTransactionWithIdentifier:(unint64_t)a3 forBundleID:(id)a4 withReply:(id)a5;
- (void)expireOrRenewSubscriptionWithIdentifier:(id)a3 expire:(BOOL)a4 forBundleID:(id)a5 withReply:(id)a6;
- (void)generateSKANPostbackSignature:(id)a3 withReply:(id)a4;
- (void)getIntegerValueForIdentifier:(unint64_t)a3 forBundleID:(id)a4 withReply:(id)a5;
- (void)getPortWithReply:(id)a3;
- (void)getStorefrontForBundleID:(id)a3 withReply:(id)a4;
- (void)getStringValueForIdentifier:(unint64_t)a3 forBundleID:(id)a4 withReply:(id)a5;
- (void)getTransactionDataForBundleID:(id)a3 withReply:(id)a4;
- (void)messageForBundleID:(id)a3 withReply:(id)a4;
- (void)messageOfTypeForBundleID:(id)a3 messageReason:(id)a4 withReply:(id)a5;
- (void)refundTransactionWithIdentifier:(unint64_t)a3 forBundleID:(id)a4 withReply:(id)a5;
- (void)registerForEventOfType:(int64_t)a3 filterData:(id)a4 withReply:(id)a5;
- (void)resolveIssueForTransactionWithIdentifier:(unint64_t)a3 forBundleID:(id)a4 withReply:(id)a5;
- (void)setIntegerValue:(int64_t)a3 forIdentifier:(unint64_t)a4 forBundleID:(id)a5 withReply:(id)a6;
- (void)setStoreKitError:(int64_t)a3 forCategory:(int64_t)a4 bundleID:(id)a5 withReply:(id)a6;
- (void)setStorefront:(id)a3 forBundleID:(id)a4 withReply:(id)a5;
- (void)setStringValue:(id)a3 forIdentifier:(unint64_t)a4 forBundleID:(id)a5 withReply:(id)a6;
- (void)startPriceIncreaseForTransactionID:(unint64_t)a3 bundleID:(NSString *)a4 needsConsent:(BOOL)a5 withReply:(id)a6;
- (void)startServingConfiguration:(id)a3 forBundleID:(id)a4 withReply:(id)a5;
- (void)storeKitErrorForCategory:(int64_t)a3 bundleID:(id)a4 withReply:(id)a5;
- (void)unregisterForEventWithIdentifier:(id)a3;
- (void)validateSKAdNetworkSignature:(id)a3 withPublicKey:(id)a4 source:(int64_t)a5 andParameters:(id)a6 forBundleID:(id)a7 withReply:(id)a8;
@end

@implementation OctaneXPCService

- (void)appRemovedWithBundleID:(id)a3 withReply:(id)a4
{
}

- (void)buyProductWithID:(id)a3 bundleID:(id)a4 withReply:(id)a5
{
}

- (void)cancelTransactionWithIdentifier:(unint64_t)a3 forBundleID:(id)a4 withReply:(id)a5
{
}

- (void)changeAutoRenewStatus:(BOOL)a3 transactionID:(unint64_t)a4 bundleID:(id)a5 withReply:(id)a6
{
}

- (void)clearOverridesForBundleID:(id)a3 withReply:(id)a4
{
}

- (void)completeAskToBuyRequestWithResponse:(BOOL)a3 transactionIdentifier:(unint64_t)a4 forBundleID:(id)a5 withReply:(id)a6
{
}

- (void)deleteAllTransactionsForBundleID:(id)a3 withRelpy:(id)a4
{
}

- (void)deleteTransactionWithIdentifier:(unint64_t)a3 forBundleID:(id)a4 withReply:(id)a5
{
}

- (void)expireOrRenewSubscriptionWithIdentifier:(id)a3 expire:(BOOL)a4 forBundleID:(id)a5 withReply:(id)a6
{
  v8 = _Block_copy(a6);
  uint64_t v9 = sub_10024E6B0();
  uint64_t v11 = v10;
  uint64_t v12 = sub_10024E6B0();
  uint64_t v14 = v13;
  _Block_copy(v8);
  v15 = self;
  sub_100199704(v9, v11, a4, v12, v14, (uint64_t)v15, v8);
  _Block_release(v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)getPortWithReply:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_100199968((int)v5, v4);
  _Block_release(v4);
}

- (void)getStorefrontForBundleID:(id)a3 withReply:(id)a4
{
}

- (void)getTransactionDataForBundleID:(id)a3 withReply:(id)a4
{
}

- (void)refundTransactionWithIdentifier:(unint64_t)a3 forBundleID:(id)a4 withReply:(id)a5
{
}

- (void)resolveIssueForTransactionWithIdentifier:(unint64_t)a3 forBundleID:(id)a4 withReply:(id)a5
{
}

- (void)setStorefront:(id)a3 forBundleID:(id)a4 withReply:(id)a5
{
}

- (void)startServingConfiguration:(id)a3 forBundleID:(id)a4 withReply:(id)a5
{
}

- (void)getIntegerValueForIdentifier:(unint64_t)a3 forBundleID:(id)a4 withReply:(id)a5
{
  v7 = _Block_copy(a5);
  uint64_t v8 = sub_10024E6B0();
  uint64_t v10 = v9;
  _Block_copy(v7);
  uint64_t v11 = self;
  sub_10019A168(a3, v8, v10, (int)v11, v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (void)setIntegerValue:(int64_t)a3 forIdentifier:(unint64_t)a4 forBundleID:(id)a5 withReply:(id)a6
{
}

- (void)getStringValueForIdentifier:(unint64_t)a3 forBundleID:(id)a4 withReply:(id)a5
{
}

- (void)setStringValue:(id)a3 forIdentifier:(unint64_t)a4 forBundleID:(id)a5 withReply:(id)a6
{
  uint64_t v8 = _Block_copy(a6);
  uint64_t v9 = sub_10024E6B0();
  uint64_t v11 = v10;
  uint64_t v12 = sub_10024E6B0();
  uint64_t v14 = v13;
  _Block_copy(v8);
  v15 = self;
  sub_10019A4DC(v9, v11, a4, v12, v14, (uint64_t)v15, (void (**)(void, void))v8);
  _Block_release(v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)registerForEventOfType:(int64_t)a3 filterData:(id)a4 withReply:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  id v9 = a4;
  uint64_t v14 = self;
  uint64_t v10 = sub_10024DF10();
  unint64_t v12 = v11;

  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v8;
  sub_10019A6A0(a3, v10, v12, (uint64_t)sub_1001A3A00, v13);
  swift_release();
  sub_10003F808(v10, v12);
}

- (void)unregisterForEventWithIdentifier:(id)a3
{
  uint64_t v4 = sub_10024E0A0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10024E080();
  id v9 = self;
  sub_10019ABE4((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (void)messageForBundleID:(id)a3 withReply:(id)a4
{
}

- (void)messageOfTypeForBundleID:(id)a3 messageReason:(id)a4 withReply:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  uint64_t v8 = sub_10024E6B0();
  uint64_t v10 = v9;
  _Block_copy(v7);
  id v11 = a4;
  unint64_t v12 = self;
  sub_10019B0D0(v8, v10, v11, (uint64_t)v12, (void (**)(void, void))v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (void)startPriceIncreaseForTransactionID:(unint64_t)a3 bundleID:(NSString *)a4 needsConsent:(BOOL)a5 withReply:(id)a6
{
  uint64_t v10 = _Block_copy(a6);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = a4;
  *(unsigned char *)(v11 + 32) = a5;
  *(void *)(v11 + 40) = v10;
  *(void *)(v11 + 48) = self;
  unint64_t v12 = a4;
  uint64_t v13 = self;
  sub_10019B9A4((uint64_t)&unk_100317130, v11);
}

- (void)completePriceConsentRequestWithResponse:(BOOL)a3 transactionIdentifier:(unint64_t)a4 forBundleID:(NSString *)a5 withReply:(id)a6
{
  uint64_t v10 = _Block_copy(a6);
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = a4;
  *(void *)(v11 + 32) = a5;
  *(void *)(v11 + 40) = v10;
  *(void *)(v11 + 48) = self;
  unint64_t v12 = a5;
  uint64_t v13 = self;
  sub_10019B9A4((uint64_t)&unk_100317100, v11);
}

- (void)validateSKAdNetworkSignature:(id)a3 withPublicKey:(id)a4 source:(int64_t)a5 andParameters:(id)a6 forBundleID:(id)a7 withReply:(id)a8
{
  uint64_t v10 = _Block_copy(a8);
  uint64_t v11 = sub_10024E6B0();
  uint64_t v13 = v12;
  uint64_t v14 = sub_10024E6B0();
  uint64_t v16 = v15;
  uint64_t v17 = sub_10024E4F0();
  uint64_t v18 = sub_10024E6B0();
  uint64_t v20 = v19;
  _Block_copy(v10);
  v21 = self;
  sub_10019BCFC(v11, v13, v14, v16, a5, v17, v18, v20, (uint64_t)v21, v10);
  _Block_release(v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)generateSKANPostbackSignature:(id)a3 withReply:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = sub_10024E4F0();
  _Block_copy(v5);
  uint64_t v7 = self;
  sub_10019C010(v6, (int)v7, v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)storeKitErrorForCategory:(int64_t)a3 bundleID:(id)a4 withReply:(id)a5
{
}

- (void)setStoreKitError:(int64_t)a3 forCategory:(int64_t)a4 bundleID:(id)a5 withReply:(id)a6
{
}

- (void)buyProductWithConfiguration:(id)a3 withReply:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  id v7 = a3;
  uint64_t v11 = self;
  uint64_t v8 = sub_10024DF10();
  unint64_t v10 = v9;

  _Block_copy(v6);
  sub_10019C4F8(v8, v10, (int)v11, v6);
  _Block_release(v6);
  sub_10003F808(v8, v10);
}

- (_TtC25ASOctaneSupportXPCService16OctaneXPCService)init
{
  return (_TtC25ASOctaneSupportXPCService16OctaneXPCService *)sub_1001A2BCC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25ASOctaneSupportXPCService16OctaneXPCService_serverQueue));
}

@end