@interface IFQDAnalytics
+ (void)sendEventForProductionLazyWithEventName:(id)a3 eventPayloadBuilder:(id)a4;
+ (void)sendEventForProductionWithEventName:(id)a3 prefix:(id)a4 eventPayload:(id)a5;
- (IFQDAnalytics)init;
@end

@implementation IFQDAnalytics

+ (void)sendEventForProductionWithEventName:(id)a3 prefix:(id)a4 eventPayload:(id)a5
{
  int v7 = sub_253276CA8();
  int v9 = v8;
  if (a4)
  {
    uint64_t v10 = sub_253276CA8();
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
    sub_25318A574();
    a5 = (id)sub_253276AF8();
  }
LABEL_4:
  static QueryDecorationAnalytics.sendEventForProduction(eventName:prefix:eventPayload:)(v7, v9, v10, a4, a5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

+ (void)sendEventForProductionLazyWithEventName:(id)a3 eventPayloadBuilder:(id)a4
{
  v4 = _Block_copy(a4);
  uint64_t v5 = sub_253276CA8();
  uint64_t v7 = v6;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v4;
  static QueryDecorationAnalytics.sendEventForProductionLazy(eventName:eventPayloadBuilder:)(v5, v7, (uint64_t)sub_25318EAB4, v8);
  swift_bridgeObjectRelease();
  swift_release();
}

- (IFQDAnalytics)init
{
  return (IFQDAnalytics *)QueryDecorationAnalytics.init()();
}

@end