@interface MapsSuggestionsEventKitStreamer
- (_TtC15MapsSuggestions31MapsSuggestionsEventKitStreamer)initWithLookAheadPeriod:(double)a3 pingInterval:(double)a4 notificationName:(id)a5 identifyingName:(id)a6;
- (_TtC15MapsSuggestions31MapsSuggestionsEventKitStreamer)initWithResourceDepot:(id)a3 notificationName:(id)a4;
- (void)_setupEventKit;
- (void)_tearDownEventKit;
- (void)dealloc;
- (void)scanForStreamableEvents;
@end

@implementation MapsSuggestionsEventKitStreamer

- (_TtC15MapsSuggestions31MapsSuggestionsEventKitStreamer)initWithResourceDepot:(id)a3 notificationName:(id)a4
{
  return (_TtC15MapsSuggestions31MapsSuggestionsEventKitStreamer *)sub_1A7142D38((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MapsSuggestionsEventKitStreamer.init(resourceDepot:notificationName:));
}

- (void)_setupEventKit
{
  v2 = self;
  sub_1A7142D9C();
}

- (void)_tearDownEventKit
{
  v2 = self;
  sub_1A714301C(&OBJC_IVAR____TtC15MapsSuggestions31MapsSuggestionsEventKitStreamer__eventKit, "Tore down EventKit.");
}

- (void)scanForStreamableEvents
{
  v2 = self;
  MapsSuggestionsEventKitStreamer.scanForStreamableEvents()();
}

- (void)dealloc
{
  v2 = self;
  MapsSuggestionsEventKitStreamer.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC15MapsSuggestions31MapsSuggestionsEventKitStreamer__eventKit));
  sub_1A71451CC((uint64_t)self + OBJC_IVAR____TtC15MapsSuggestions31MapsSuggestionsEventKitStreamer__keyListenerBlock, (uint64_t *)&unk_1EB6EFCA8);
  swift_unknownObjectRelease();
  sub_1A71451CC((uint64_t)self + OBJC_IVAR____TtC15MapsSuggestions31MapsSuggestionsEventKitStreamer__eventKitObserver, (uint64_t *)&unk_1EB6EFCA8);
  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC15MapsSuggestions31MapsSuggestionsEventKitStreamer__eventKitChangedCanKicker);
}

- (_TtC15MapsSuggestions31MapsSuggestionsEventKitStreamer)initWithLookAheadPeriod:(double)a3 pingInterval:(double)a4 notificationName:(id)a5 identifyingName:(id)a6
{
}

@end