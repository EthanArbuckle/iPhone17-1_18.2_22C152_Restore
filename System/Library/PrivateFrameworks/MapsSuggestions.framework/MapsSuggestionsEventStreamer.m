@interface MapsSuggestionsEventStreamer
- (NSArray)_notifyTimers;
- (NSString)notificationName;
- (NSString)uniqueName;
- (OS_dispatch_queue)_queue;
- (_TtC15MapsSuggestions10TimerClass)_scanTimer;
- (_TtC15MapsSuggestions28MapsSuggestionsEventStreamer)init;
- (_TtC15MapsSuggestions28MapsSuggestionsEventStreamer)initWithLookAheadPeriod:(double)a3 pingInterval:(double)a4 notificationName:(id)a5 identifyingName:(id)a6;
- (double)_delay;
- (double)lookAheadPeriod;
- (double)pingInterval;
- (void)broadcastEventFrom:(id)a3 to:(id)a4;
- (void)dealloc;
- (void)invalidateAllTimers;
- (void)rescan;
- (void)setUniqueName:(id)a3;
- (void)set_notifyTimers:(id)a3;
- (void)set_scanTimer:(id)a3;
@end

@implementation MapsSuggestionsEventStreamer

- (NSString)uniqueName
{
  v2 = (char *)self + OBJC_IVAR____TtC15MapsSuggestions28MapsSuggestionsEventStreamer_uniqueName;
  swift_beginAccess();
  if (*((void *)v2 + 1))
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1A721EFB0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setUniqueName:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1A721EFC0();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC15MapsSuggestions28MapsSuggestionsEventStreamer_uniqueName);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (double)lookAheadPeriod
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC15MapsSuggestions28MapsSuggestionsEventStreamer_lookAheadPeriod);
}

- (double)pingInterval
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC15MapsSuggestions28MapsSuggestionsEventStreamer_pingInterval);
}

- (NSString)notificationName
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A721EFB0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (OS_dispatch_queue)_queue
{
  return (OS_dispatch_queue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____TtC15MapsSuggestions28MapsSuggestionsEventStreamer__queue));
}

- (_TtC15MapsSuggestions10TimerClass)_scanTimer
{
  return (_TtC15MapsSuggestions10TimerClass *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                      + OBJC_IVAR____TtC15MapsSuggestions28MapsSuggestionsEventStreamer__scanTimer));
}

- (void)set_scanTimer:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15MapsSuggestions28MapsSuggestionsEventStreamer__scanTimer);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15MapsSuggestions28MapsSuggestionsEventStreamer__scanTimer) = (Class)a3;
  id v3 = a3;
}

- (NSArray)_notifyTimers
{
  swift_beginAccess();
  type metadata accessor for TimerClass();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A721F040();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)set_notifyTimers:(id)a3
{
  type metadata accessor for TimerClass();
  uint64_t v4 = sub_1A721F050();
  uint64_t v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC15MapsSuggestions28MapsSuggestionsEventStreamer__notifyTimers);
  swift_beginAccess();
  *uint64_t v5 = v4;
  swift_bridgeObjectRelease();
}

- (double)_delay
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC15MapsSuggestions28MapsSuggestionsEventStreamer__delay);
}

- (_TtC15MapsSuggestions28MapsSuggestionsEventStreamer)initWithLookAheadPeriod:(double)a3 pingInterval:(double)a4 notificationName:(id)a5 identifyingName:(id)a6
{
  uint64_t v8 = sub_1A721EFC0();
  uint64_t v10 = v9;
  uint64_t v11 = sub_1A721EFC0();
  return (_TtC15MapsSuggestions28MapsSuggestionsEventStreamer *)MapsSuggestionsEventStreamer.init(lookAheadPeriod:pingInterval:notificationName:identifyingName:)(v8, v10, v11, v12, a3, a4);
}

- (void)broadcastEventFrom:(id)a3 to:(id)a4
{
  uint64_t v5 = sub_1A721ED40();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  uint64_t v11 = (char *)&v14 - v10;
  sub_1A721ED10();
  sub_1A721ED10();
  uint64_t v12 = self;
  MapsSuggestionsEventStreamer.broadcastEvent(from:to:)((uint64_t)v11, (uint64_t)v9);

  v13 = *(void (**)(char *, uint64_t))(v6 + 8);
  v13(v9, v5);
  v13(v11, v5);
}

- (void)rescan
{
  v2 = self;
  MapsSuggestionsEventStreamer.rescan()();
}

- (void)invalidateAllTimers
{
  v2 = self;
  MapsSuggestionsEventStreamer.invalidateAllTimers()();
}

- (void)dealloc
{
  v2 = self;
  MapsSuggestionsEventStreamer.invalidateAllTimers()();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for MapsSuggestionsEventStreamer();
  [(MapsSuggestionsEventStreamer *)&v3 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15MapsSuggestions28MapsSuggestionsEventStreamer__scanTimer));
  swift_bridgeObjectRelease();
}

- (_TtC15MapsSuggestions28MapsSuggestionsEventStreamer)init
{
  result = (_TtC15MapsSuggestions28MapsSuggestionsEventStreamer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end