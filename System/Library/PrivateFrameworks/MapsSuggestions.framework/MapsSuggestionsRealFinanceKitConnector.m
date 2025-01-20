@interface MapsSuggestionsRealFinanceKitConnector
- (_TtC15MapsSuggestions38MapsSuggestionsRealFinanceKitConnector)init;
- (id)currentOrderPickupsWithPeriod:(double)a3;
- (id)startObservingOrderPickupsIn:(double)a3 callback:(id)a4;
@end

@implementation MapsSuggestionsRealFinanceKitConnector

- (id)currentOrderPickupsWithPeriod:(double)a3
{
  _s15MapsSuggestions0aB23RealFinanceKitConnectorC19currentOrderPickups6periodSayAA0abH6PickupCGSd_tF_0(a3);
  type metadata accessor for MapsSuggestionsOrderPickup();
  v3 = (void *)sub_1A721F040();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)startObservingOrderPickupsIn:(double)a3 callback:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  v8 = self;
  v9 = (void *)MapsSuggestionsRealFinanceKitConnector.startObservingOrderPickups(in:callback:)((uint64_t)sub_1A7146D9C, v7, a3);

  swift_release();
  return v9;
}

- (_TtC15MapsSuggestions38MapsSuggestionsRealFinanceKitConnector)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MapsSuggestionsRealFinanceKitConnector();
  return [(MapsSuggestionsRealFinanceKitConnector *)&v3 init];
}

@end