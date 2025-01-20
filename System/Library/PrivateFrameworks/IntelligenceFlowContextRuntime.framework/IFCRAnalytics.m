@interface IFCRAnalytics
+ (void)sendEventForProductionWithEventName:(id)a3 prefix:(id)a4 eventPayload:(id)a5;
- (IFCRAnalytics)init;
@end

@implementation IFCRAnalytics

+ (void)sendEventForProductionWithEventName:(id)a3 prefix:(id)a4 eventPayload:(id)a5
{
  int v7 = sub_252E44CF8();
  int v9 = v8;
  if (a4)
  {
    uint64_t v10 = sub_252E44CF8();
    a4 = v11;
    if (!a5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v10 = 0;
  if (a5)
  {
LABEL_3:
    sub_252DDBAEC();
    a5 = (id)sub_252E44C78();
  }
LABEL_4:
  v13.value._countAndFlagsBits = v10;
  v13.value._object = a4;
  static Analytics.sendEventForProduction(eventName:prefix:eventPayload:)(v7, v9, v13, a5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (IFCRAnalytics)init
{
  return (IFCRAnalytics *)Analytics.init()();
}

@end