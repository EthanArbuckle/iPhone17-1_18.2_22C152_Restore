@interface AMSFinalizedBlind
+ (id)finalizedBlindWith:(id)a3 privateInput:(id)a4 timestamp:(id)a5 adamId:(id)a6;
- (AMSFinalizedBlind)init;
- (AMSFinalizedBlind)initWithFinalizedData:(id)a3 privateInput:(id)a4 timestamp:(id)a5 adamId:(id)a6;
- (NSData)finalizedData;
- (NSData)privateInput;
- (NSString)adamId;
- (NSString)timestamp;
@end

@implementation AMSFinalizedBlind

- (NSData)finalizedData
{
  return (NSData *)sub_18D75DD10((uint64_t)self, (uint64_t)a2, (void (*)(void))FinalizedBlind.finalizedData.getter);
}

- (NSData)privateInput
{
  return (NSData *)sub_18D75DD10((uint64_t)self, (uint64_t)a2, (void (*)(void))FinalizedBlind.privateInput.getter);
}

- (NSString)timestamp
{
  return (NSString *)sub_18D75DDF4((uint64_t)self, (uint64_t)a2, (void (*)(void))FinalizedBlind.timestamp.getter);
}

- (NSString)adamId
{
  return (NSString *)sub_18D75DDF4((uint64_t)self, (uint64_t)a2, (void (*)(void))FinalizedBlind.adamId.getter);
}

- (AMSFinalizedBlind)initWithFinalizedData:(id)a3 privateInput:(id)a4 timestamp:(id)a5 adamId:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  sub_18DD4D8C0();

  sub_18DD4D8C0();
  sub_18DD4DEB0();

  sub_18DD4DEB0();
  return (AMSFinalizedBlind *)sub_18D75DE70();
}

+ (id)finalizedBlindWith:(id)a3 privateInput:(id)a4 timestamp:(id)a5 adamId:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = sub_18DD4D8C0();
  unint64_t v15 = v14;

  uint64_t v16 = sub_18DD4D8C0();
  unint64_t v18 = v17;

  sub_18DD4DEB0();
  sub_18DD4DEB0();

  swift_getObjCClassMetadata();
  static FinalizedBlind.finalizedBlind(with:privateInput:timestamp:adamId:)();
  v20 = v19;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_18D69616C(v16, v18);
  sub_18D69616C(v13, v15);
  return v20;
}

- (AMSFinalizedBlind)init
{
}

- (void).cxx_destruct
{
  sub_18D69616C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___AMSFinalizedBlind_finalizedData), *(void *)&self->finalizedData[OBJC_IVAR___AMSFinalizedBlind_finalizedData]);
  sub_18D69616C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___AMSFinalizedBlind_privateInput), *(void *)&self->finalizedData[OBJC_IVAR___AMSFinalizedBlind_privateInput]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end