@interface TTRComplicationRouter
- (_TtC25NanoRemindersComplication21TTRComplicationRouter)init;
- (id)launchURLForTimelineWithEntryCount:(int64_t)a3;
@end

@implementation TTRComplicationRouter

- (_TtC25NanoRemindersComplication21TTRComplicationRouter)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TTRComplicationRouter();
  return [(TTRComplicationRouter *)&v3 init];
}

- (id)launchURLForTimelineWithEntryCount:(int64_t)a3
{
  uint64_t v5 = sub_B260();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = self;
  TTRComplicationRouter.launchURLForTimeline(withEntryCount:)(a3, (uint64_t)v8);

  sub_B250(v10);
  v12 = v11;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return v12;
}

@end