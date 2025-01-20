@interface AssistantAssetDelegateInterface
+ (_TtC22localspeechrecognition31AssistantAssetDelegateInterface)sharedInstance;
- (NSDictionary)statusForLanguage;
- (_TtC22localspeechrecognition31AssistantAssetDelegateInterface)init;
- (void)assetStatus:(id)a3;
- (void)dealloc;
- (void)setStatusForLanguage:(id)a3;
@end

@implementation AssistantAssetDelegateInterface

+ (_TtC22localspeechrecognition31AssistantAssetDelegateInterface)sharedInstance
{
  id v2 = sub_10002D5BC(&qword_100062240, (void **)&qword_100064888);

  return (_TtC22localspeechrecognition31AssistantAssetDelegateInterface *)v2;
}

- (NSDictionary)statusForLanguage
{
  return (NSDictionary *)sub_10002D668((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_10002D39C);
}

- (void)setStatusForLanguage:(id)a3
{
  uint64_t v4 = sub_100041130();
  v5 = self;
  sub_10002D41C(v4);
}

- (_TtC22localspeechrecognition31AssistantAssetDelegateInterface)init
{
  return (_TtC22localspeechrecognition31AssistantAssetDelegateInterface *)sub_10002D758(&OBJC_IVAR____TtC22localspeechrecognition31AssistantAssetDelegateInterface_assetManager, &OBJC_IVAR____TtC22localspeechrecognition31AssistantAssetDelegateInterface_statusForLanguage, type metadata accessor for AssistantAssetDelegateInterface, 3);
}

- (void)assetStatus:(id)a3
{
}

- (void)dealloc
{
  id v2 = self;
  sub_10002D4AC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22localspeechrecognition31AssistantAssetDelegateInterface_assetManager));

  swift_bridgeObjectRelease();
}

@end