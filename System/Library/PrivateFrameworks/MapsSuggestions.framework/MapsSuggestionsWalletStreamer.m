@interface MapsSuggestionsWalletStreamer
- (_TtC15MapsSuggestions29MapsSuggestionsWalletStreamer)initWithLookAheadPeriod:(double)a3 pingInterval:(double)a4 notificationName:(id)a5 identifyingName:(id)a6;
- (_TtC15MapsSuggestions29MapsSuggestionsWalletStreamer)initWithResourceDepot:(id)a3 notificationName:(id)a4;
- (void)_setupWallet;
- (void)_tearDownWallet;
- (void)dealloc;
- (void)scanForStreamableEvents;
@end

@implementation MapsSuggestionsWalletStreamer

- (_TtC15MapsSuggestions29MapsSuggestionsWalletStreamer)initWithResourceDepot:(id)a3 notificationName:(id)a4
{
  return (_TtC15MapsSuggestions29MapsSuggestionsWalletStreamer *)sub_1A7142D38((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MapsSuggestionsWalletStreamer.init(resourceDepot:notificationName:));
}

- (void)_setupWallet
{
  v2 = self;
  sub_1A714131C();
}

- (void)_tearDownWallet
{
  v2 = self;
  sub_1A714301C(&OBJC_IVAR____TtC15MapsSuggestions29MapsSuggestionsWalletStreamer__wallet, "Tore down Wallet.");
}

- (void)scanForStreamableEvents
{
  v2 = self;
  MapsSuggestionsWalletStreamer.scanForStreamableEvents()();
}

- (void)dealloc
{
  v2 = self;
  MapsSuggestionsWalletStreamer.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC15MapsSuggestions29MapsSuggestionsWalletStreamer__wallet));
  sub_1A71451CC((uint64_t)self + OBJC_IVAR____TtC15MapsSuggestions29MapsSuggestionsWalletStreamer__keyListenerBlock, (uint64_t *)&unk_1EB6EFCA8);
  swift_unknownObjectRelease();
  sub_1A71451CC((uint64_t)self + OBJC_IVAR____TtC15MapsSuggestions29MapsSuggestionsWalletStreamer__passKitObserver, (uint64_t *)&unk_1EB6EFCA8);
  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC15MapsSuggestions29MapsSuggestionsWalletStreamer__passKitChangedCanKicker);
}

- (_TtC15MapsSuggestions29MapsSuggestionsWalletStreamer)initWithLookAheadPeriod:(double)a3 pingInterval:(double)a4 notificationName:(id)a5 identifyingName:(id)a6
{
}

@end