@interface DailyBriefingMapsSink
- (NSString)uniqueName;
- (_TtC23DailyBriefingFlowPlugin21DailyBriefingMapsSink)init;
- (void)dealloc;
- (void)invalidateForMapsSuggestionsManager:(id)a3;
@end

@implementation DailyBriefingMapsSink

- (NSString)uniqueName
{
  sub_CA18();
  NSString v2 = sub_B2F20();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)dealloc
{
  NSString v2 = self;
  sub_CA34();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC23DailyBriefingFlowPlugin21DailyBriefingMapsSink_logger;
  uint64_t v4 = sub_B2D30();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23DailyBriefingFlowPlugin21DailyBriefingMapsSink_topSuggestion));

  swift_unknownObjectRelease();
}

- (void)invalidateForMapsSuggestionsManager:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_B3430();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }

  sub_AD60((uint64_t)v6);
}

- (_TtC23DailyBriefingFlowPlugin21DailyBriefingMapsSink)init
{
  return (_TtC23DailyBriefingFlowPlugin21DailyBriefingMapsSink *)sub_CC4C();
}

@end