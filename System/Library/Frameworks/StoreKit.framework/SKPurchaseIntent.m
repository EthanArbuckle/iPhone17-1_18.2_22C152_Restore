@interface SKPurchaseIntent
- (NSString)additionalBuyParams;
- (SKPurchaseIntent)init;
- (SKPurchaseIntent)initWithBundleId:(id)a3 productIdentifier:(id)a4 appName:(id)a5 productName:(id)a6;
- (void)send:(id)a3;
- (void)setAdditionalBuyParams:(id)a3;
@end

@implementation SKPurchaseIntent

- (NSString)additionalBuyParams
{
  SKPurchaseIntent.additionalBuyParams.getter();
  if (v2)
  {
    v3 = (void *)sub_1B01DBB20();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }

  return (NSString *)v3;
}

- (void)setAdditionalBuyParams:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1B01DBB50();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = self;
  SKPurchaseIntent.additionalBuyParams.setter(v4, v6);
}

- (SKPurchaseIntent)initWithBundleId:(id)a3 productIdentifier:(id)a4 appName:(id)a5 productName:(id)a6
{
  uint64_t v8 = sub_1B01DBB50();
  uint64_t v10 = v9;
  uint64_t v11 = sub_1B01DBB50();
  uint64_t v13 = v12;
  if (!a5)
  {
    uint64_t v15 = 0;
    if (a6) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v16 = 0;
    uint64_t v18 = 0;
    return (SKPurchaseIntent *)sub_1B00FB1FC(v8, v10, v11, v13, (uint64_t)a5, v15, v16, v18);
  }
  a5 = (id)sub_1B01DBB50();
  uint64_t v15 = v14;
  if (!a6) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v16 = sub_1B01DBB50();
  uint64_t v18 = v17;
  return (SKPurchaseIntent *)sub_1B00FB1FC(v8, v10, v11, v13, (uint64_t)a5, v15, v16, v18);
}

- (void)send:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = self;
  uint64_t v6 = self;

  sub_1B014BBB4((uint64_t)&unk_1E9B1B608, v5);
}

- (SKPurchaseIntent)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end