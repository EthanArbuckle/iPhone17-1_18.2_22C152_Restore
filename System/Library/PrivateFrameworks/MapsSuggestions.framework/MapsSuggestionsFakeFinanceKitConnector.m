@interface MapsSuggestionsFakeFinanceKitConnector
- (NSArray)orderPickups;
- (_TtC15MapsSuggestions38MapsSuggestionsFakeFinanceKitConnector)init;
- (id)_callbackHandle;
- (id)currentOrderPickupsWithPeriod:(double)a3;
- (id)startObservingOrderPickupsIn:(double)a3 callback:(id)a4;
- (void)setOrderPickups:(id)a3;
- (void)set_callbackHandle:(id)a3;
- (void)updatedOrders;
@end

@implementation MapsSuggestionsFakeFinanceKitConnector

- (id)currentOrderPickupsWithPeriod:(double)a3
{
  swift_beginAccess();
  type metadata accessor for MapsSuggestionsOrderPickup();
  swift_bridgeObjectRetain();
  v3 = (void *)sub_1A721F040();
  swift_bridgeObjectRelease();
  return v3;
}

- (NSArray)orderPickups
{
  swift_beginAccess();
  type metadata accessor for MapsSuggestionsOrderPickup();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A721F040();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setOrderPickups:(id)a3
{
  type metadata accessor for MapsSuggestionsOrderPickup();
  uint64_t v4 = sub_1A721F050();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC15MapsSuggestions38MapsSuggestionsFakeFinanceKitConnector_orderPickups);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

- (id)_callbackHandle
{
  v2 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC15MapsSuggestions38MapsSuggestionsFakeFinanceKitConnector__callbackHandle);
  swift_beginAccess();
  if (*v2)
  {
    uint64_t v3 = v2[1];
    aBlock[4] = *v2;
    aBlock[5] = v3;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1A715A308;
    aBlock[3] = &block_descriptor_2;
    uint64_t v4 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (void)set_callbackHandle:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    uint64_t v4 = sub_1A715A9D0;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtC15MapsSuggestions38MapsSuggestionsFakeFinanceKitConnector__callbackHandle);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_1A713FAB0(v7);
}

- (id)startObservingOrderPickupsIn:(double)a3 callback:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  uint64_t v7 = self;
  v8 = (void *)sub_1A715A894((uint64_t)sub_1A7146D9C, v6);
  swift_unknownObjectRetain();

  swift_release();
  return v8;
}

- (void)updatedOrders
{
  uint64_t v3 = (void (**)(uint64_t))((char *)self
                                     + OBJC_IVAR____TtC15MapsSuggestions38MapsSuggestionsFakeFinanceKitConnector__callbackHandle);
  swift_beginAccess();
  uint64_t v4 = *v3;
  if (*v3)
  {
    swift_beginAccess();
    uint64_t v5 = self;
    sub_1A713F99C((uint64_t)v4);
    uint64_t v6 = swift_bridgeObjectRetain();
    v4(v6);
    sub_1A713FAB0((uint64_t)v4);

    swift_bridgeObjectRelease();
  }
}

- (_TtC15MapsSuggestions38MapsSuggestionsFakeFinanceKitConnector)init
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC15MapsSuggestions38MapsSuggestionsFakeFinanceKitConnector_orderPickups) = (Class)MEMORY[0x1E4FBC860];
  uint64_t v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC15MapsSuggestions38MapsSuggestionsFakeFinanceKitConnector__callbackHandle);
  uint64_t v4 = (objc_class *)type metadata accessor for MapsSuggestionsFakeFinanceKitConnector();
  void *v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return [(MapsSuggestionsFakeFinanceKitConnector *)&v6 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC15MapsSuggestions38MapsSuggestionsFakeFinanceKitConnector__callbackHandle);
  sub_1A713FAB0(v3);
}

@end