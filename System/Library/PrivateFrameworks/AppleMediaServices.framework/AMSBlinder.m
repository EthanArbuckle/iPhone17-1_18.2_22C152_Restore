@interface AMSBlinder
+ (id)finalizeBlindedDataWithPrivateInput:(id)a3 timeStamp:(id)a4 priceType:(id)a5 adamId:(id)a6 serverData:(id)a7 error:(id *)a8;
+ (id)generateRandomPrivateInput;
+ (id)generateTimestamp;
+ (id)makeBlindedDataWithPrivateInputData:(id)a3;
+ (void)removeCachedClientForPrivateInput:(id)a3;
- (AMSBlinder)init;
@end

@implementation AMSBlinder

+ (void)removeCachedClientForPrivateInput:(id)a3
{
  id v3 = a3;
  uint64_t v4 = sub_18DD4D8C0();
  unint64_t v6 = v5;

  swift_getObjCClassMetadata();
  static Blinder.removeCachedClient(for:)();
  sub_18D69616C(v4, v6);
}

+ (id)generateRandomPrivateInput
{
  uint64_t v2 = static Blinder.generateRandomPrivateInput()();
  unint64_t v4 = v3;
  unint64_t v5 = (void *)sub_18DD4D8A0();
  sub_18D69616C(v2, v4);
  return v5;
}

+ (id)makeBlindedDataWithPrivateInputData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = sub_18DD4D8C0();
  unint64_t v6 = v5;

  swift_getObjCClassMetadata();
  static Blinder.makeBlindedData(privateInputData:)();
  v8 = v7;
  sub_18D69616C(v4, v6);
  return v8;
}

+ (id)finalizeBlindedDataWithPrivateInput:(id)a3 timeStamp:(id)a4 priceType:(id)a5 adamId:(id)a6 serverData:(id)a7 error:(id *)a8
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = sub_18DD4D8C0();
  unint64_t v31 = v18;

  uint64_t v30 = sub_18DD4DEB0();
  uint64_t v20 = v19;

  unint64_t v21 = sub_18DD4DEB0();
  uint64_t v23 = v22;

  uint64_t v24 = sub_18DD4DEB0();
  uint64_t v26 = v25;

  unint64_t v27 = sub_18DD4DDA0();
  swift_getObjCClassMetadata();
  v28 = static Blinder.finalizeBlindedData(privateInput:timeStamp:priceType:adamId:serverData:)(v17, v31, v30, v20, v21, v23, v24, v26, v27);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_18D69616C(v17, v31);
  return v28;
}

+ (id)generateTimestamp
{
  static Blinder.generateTimestamp()();
  if (v2)
  {
    id v3 = (void *)sub_18DD4DE80();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (AMSBlinder)init
{
  return (AMSBlinder *)Blinder.init()();
}

@end