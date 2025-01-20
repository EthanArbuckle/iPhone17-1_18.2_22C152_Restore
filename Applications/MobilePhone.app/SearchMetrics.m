@interface SearchMetrics
+ (_TtC11MobilePhone13SearchMetrics)shared;
- (_TtC11MobilePhone13SearchMetrics)init;
- (void)keypadButtonInteractedWithButtonType:(unsigned int)a3;
- (void)logSearchBarTap;
- (void)logSearchResultInteraction:(unsigned int)a3 cellType:(unsigned int)a4 searchLength:(int64_t)a5;
- (void)searchFinishedForController:(unsigned int)a3 startTime:(id)a4 searchLength:(int64_t)a5 resultsCount:(int64_t)a6;
@end

@implementation SearchMetrics

+ (_TtC11MobilePhone13SearchMetrics)shared
{
  if (one-time initialization token for shared != -1) {
    swift_once();
  }
  v2 = (void *)static SearchMetrics.shared;

  return (_TtC11MobilePhone13SearchMetrics *)v2;
}

- (_TtC11MobilePhone13SearchMetrics)init
{
  return (_TtC11MobilePhone13SearchMetrics *)SearchMetrics.init()();
}

- (void)logSearchBarTap
{
  v2 = *(void (**)(unint64_t, unint64_t))((**(void **)((char *)&self->super.isa
                                                                                + OBJC_IVAR____TtC11MobilePhone13SearchMetrics_analyticsLogger) & swift_isaMask)
                                                                 + 0x50);
  v3 = self;
  v2(0xD000000000000029, 0x8000000100241200);
}

- (void)keypadButtonInteractedWithButtonType:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = self;
  SearchMetrics.keypadButtonInteracted(buttonType:)(v3);
}

- (void)logSearchResultInteraction:(unsigned int)a3 cellType:(unsigned int)a4 searchLength:(int64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  uint64_t v8 = 0xD00000000000003BLL;
  if (a4 - 5 < 4)
  {
    uint64_t v8 = 0xD000000000000039;
    v9 = "com.apple.MobilePhone.SmartDialerResultInteractionMetrics";
  }
  else
  {
    if (a4 - 1 > 3) {
      return;
    }
    v9 = "com.apple.MobilePhone.RecentsSearchResultInteractionMetrics";
  }
  unint64_t v10 = (unint64_t)(v9 - 32) | 0x8000000000000000;
  v11 = self;
  SearchMetrics.logSearchResultInteraction(forEvent:interactionType:cellType:suggestionKind:searchLength:)(v8, v10, v7, v6, 5u, a5);

  swift_bridgeObjectRelease();
}

- (void)searchFinishedForController:(unsigned int)a3 startTime:(id)a4 searchLength:(int64_t)a5 resultsCount:(int64_t)a6
{
  id v11 = a4;
  v12 = self;
  SearchMetrics.searchFinished(forController:startTime:searchLength:resultsCount:)(a3, a4, a5, a6);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11MobilePhone13SearchMetrics_analyticsLogger);
}

@end