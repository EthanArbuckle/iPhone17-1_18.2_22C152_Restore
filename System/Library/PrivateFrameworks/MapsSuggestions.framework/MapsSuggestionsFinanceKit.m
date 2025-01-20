@interface MapsSuggestionsFinanceKit
- (BOOL)canProduceEntriesOfTypeWithType:(int64_t)a3;
- (NSString)uniqueName;
- (_TtC15MapsSuggestions25MapsSuggestionsFinanceKit)init;
- (_TtC15MapsSuggestions25MapsSuggestionsFinanceKit)initWithConnector:(id)a3 requester:(id)a4;
- (char)deleteOrDeclineEntryWithEntry:(id)a3 handler:(id)a4;
- (id)initFromResourceDepot:(id)a3;
- (void)setUniqueName:(id)a3;
- (void)startObservingForOrdersWithPeriod:(double)a3;
- (void)stopObservingForOrders;
- (void)updateOrdersWithOrders:(id)a3;
@end

@implementation MapsSuggestionsFinanceKit

- (id)initFromResourceDepot:(id)a3
{
  swift_unknownObjectRetain();
  id result = objc_msgSend(a3, sel_oneFinanceKitConnector);
  if (result)
  {
    id v6 = result;
    id result = objc_msgSend(a3, sel_oneNetworkRequester);
    if (result)
    {
      v7 = [(MapsSuggestionsFinanceKit *)self initWithConnector:v6 requester:result];
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      return v7;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

- (_TtC15MapsSuggestions25MapsSuggestionsFinanceKit)initWithConnector:(id)a3 requester:(id)a4
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v6 = (_TtC15MapsSuggestions25MapsSuggestionsFinanceKit *)sub_1A715F340((uint64_t)a3, (uint64_t)a4);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v6;
}

- (NSString)uniqueName
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A721EFB0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setUniqueName:(id)a3
{
  uint64_t v4 = sub_1A721EFC0();
  uint64_t v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC15MapsSuggestions25MapsSuggestionsFinanceKit_uniqueName);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (BOOL)canProduceEntriesOfTypeWithType:(int64_t)a3
{
  return a3 == 23;
}

- (void)updateOrdersWithOrders:(id)a3
{
  type metadata accessor for MapsSuggestionsOrderPickup();
  uint64_t v4 = sub_1A721F050();
  uint64_t v5 = self;
  sub_1A715C950(v4);

  swift_bridgeObjectRelease();
}

- (void)startObservingForOrdersWithPeriod:(double)a3
{
  uint64_t v4 = self;
  MapsSuggestionsFinanceKit.startObservingForOrders(period:)(a3);
}

- (void)stopObservingForOrders
{
  v2 = self;
  MapsSuggestionsFinanceKit.stopObservingForOrders()();
}

- (char)deleteOrDeclineEntryWithEntry:(id)a3 handler:(id)a4
{
  uint64_t v4 = _Block_copy(a4);
  _Block_release(v4);
  return 0;
}

- (_TtC15MapsSuggestions25MapsSuggestionsFinanceKit)init
{
  id result = (_TtC15MapsSuggestions25MapsSuggestionsFinanceKit *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_1A7159C8C((uint64_t)self + OBJC_IVAR____TtC15MapsSuggestions25MapsSuggestionsFinanceKit__delegate);
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15MapsSuggestions25MapsSuggestionsFinanceKit__queue);
}

@end