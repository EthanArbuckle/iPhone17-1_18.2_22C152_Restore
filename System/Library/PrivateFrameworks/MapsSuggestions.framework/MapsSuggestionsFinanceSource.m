@interface MapsSuggestionsFinanceSource
+ (BOOL)isEnabled;
+ (unint64_t)disposition;
- (BOOL)canProduceEntriesOfType:(int64_t)a3;
- (_TtC15MapsSuggestions28MapsSuggestionsFinanceSource)init;
- (_TtC15MapsSuggestions28MapsSuggestionsFinanceSource)initWithDelegate:(id)a3 name:(id)a4;
- (char)removeEntry:(id)a3 behavior:(int64_t)a4 handler:(id)a5;
- (double)updateSuggestionEntriesWithHandler:(id)a3;
- (id)initFromResourceDepot:(id)a3;
- (id)initFromResourceDepot:(id)a3 name:(id)a4;
- (void)start;
- (void)stop;
@end

@implementation MapsSuggestionsFinanceSource

+ (unint64_t)disposition
{
  return 2;
}

- (id)initFromResourceDepot:(id)a3 name:(id)a4
{
  swift_unknownObjectRetain();
  id result = objc_msgSend(a3, sel_oneSourceDelegate);
  if (result)
  {
    id v6 = result;
    id result = objc_msgSend(a3, sel_oneFinanceKit);
    if (result)
    {
      id v7 = result;
      id v8 = objc_allocWithZone((Class)type metadata accessor for MapsSuggestionsFinanceSource());
      id v9 = sub_1A715AE88((uint64_t)v6, v7);
      swift_unknownObjectRelease();
      swift_getObjectType();
      swift_deallocPartialClassInstance();
      return v9;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

- (void)start
{
  v2 = self;
  MapsSuggestionsFinanceSource.start()();
}

- (void)stop
{
  v2 = self;
  MapsSuggestionsFinanceSource.stop()();
}

- (double)updateSuggestionEntriesWithHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    id v7 = sub_1A715C338;
  }
  else
  {
    id v7 = 0;
    uint64_t v6 = 0;
  }
  id v8 = self;
  MapsSuggestionsFinanceSource.updateSuggestionEntries(handler:)((uint64_t)v7, v6);
  double v10 = v9;
  sub_1A713FAB0((uint64_t)v7);

  return v10;
}

- (BOOL)canProduceEntriesOfType:(int64_t)a3
{
  return a3 == 23;
}

- (char)removeEntry:(id)a3 behavior:(int64_t)a4 handler:(id)a5
{
  v5 = _Block_copy(a5);
  _Block_release(v5);
  return 0;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (id)initFromResourceDepot:(id)a3
{
  swift_unknownObjectRetain();
  id result = (id)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15MapsSuggestions28MapsSuggestionsFinanceSource)init
{
  id result = (_TtC15MapsSuggestions28MapsSuggestionsFinanceSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15MapsSuggestions28MapsSuggestionsFinanceSource)initWithDelegate:(id)a3 name:(id)a4
{
  swift_unknownObjectRetain();
  id result = (_TtC15MapsSuggestions28MapsSuggestionsFinanceSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1A7159C8C((uint64_t)self + OBJC_IVAR____TtC15MapsSuggestions28MapsSuggestionsFinanceSource__delegate);
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC15MapsSuggestions28MapsSuggestionsFinanceSource__financeKit));
  sub_1A713FAB0(*(uint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC15MapsSuggestions28MapsSuggestionsFinanceSource__updateCompleteHandler));
  v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC15MapsSuggestions28MapsSuggestionsFinanceSource_queue);
}

@end