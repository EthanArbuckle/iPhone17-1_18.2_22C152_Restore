@interface GeneralASRAssetDelegateInterface
+ (_TtC22localspeechrecognition32GeneralASRAssetDelegateInterface)sharedInstance;
- (NSDictionary)statusForLanguage;
- (_TtC22localspeechrecognition32GeneralASRAssetDelegateInterface)init;
- (void)assetStatus:(id)a3;
- (void)dealloc;
- (void)setStatusForLanguage:(id)a3;
@end

@implementation GeneralASRAssetDelegateInterface

+ (_TtC22localspeechrecognition32GeneralASRAssetDelegateInterface)sharedInstance
{
  id v2 = sub_10002D5BC(&qword_100062248, (void **)&qword_100064890);

  return (_TtC22localspeechrecognition32GeneralASRAssetDelegateInterface *)v2;
}

- (NSDictionary)statusForLanguage
{
  return (NSDictionary *)sub_10002D668((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_10002D6CC);
}

- (void)setStatusForLanguage:(id)a3
{
  uint64_t v4 = sub_100041130();
  v5 = self;
  sub_10002D74C(v4);
}

- (_TtC22localspeechrecognition32GeneralASRAssetDelegateInterface)init
{
  return (_TtC22localspeechrecognition32GeneralASRAssetDelegateInterface *)sub_10002D758(&OBJC_IVAR____TtC22localspeechrecognition32GeneralASRAssetDelegateInterface_assetManager, &OBJC_IVAR____TtC22localspeechrecognition32GeneralASRAssetDelegateInterface_statusForLanguage, type metadata accessor for GeneralASRAssetDelegateInterface, 7);
}

- (void)assetStatus:(id)a3
{
}

- (void)dealloc
{
  id v2 = self;
  sub_10002DD3C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22localspeechrecognition32GeneralASRAssetDelegateInterface_assetManager));

  swift_bridgeObjectRelease();
}

@end