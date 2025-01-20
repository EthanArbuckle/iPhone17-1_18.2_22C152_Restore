@interface MapsSuggestionsContactActivity
- (NSString)uniqueName;
- (_TtC15MapsSuggestions30MapsSuggestionsContactActivity)init;
- (_TtP15MapsSuggestions38MapsSuggestionsContactActivityDelegate_)contactActivityDelegate;
- (id)initFromResourceDepot:(id)a3;
- (void)contactActivityEntriesWith:(id)a3;
- (void)setContactActivityDelegate:(id)a3;
- (void)setUniqueName:(id)a3;
@end

@implementation MapsSuggestionsContactActivity

- (NSString)uniqueName
{
  v2 = (char *)self + OBJC_IVAR____TtC15MapsSuggestions30MapsSuggestionsContactActivity_uniqueName;
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
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC15MapsSuggestions30MapsSuggestionsContactActivity_uniqueName);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (_TtP15MapsSuggestions38MapsSuggestionsContactActivityDelegate_)contactActivityDelegate
{
  v2 = (char *)self + OBJC_IVAR____TtC15MapsSuggestions30MapsSuggestionsContactActivity_contactActivityDelegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x1AD0C95E0](v2);
  return (_TtP15MapsSuggestions38MapsSuggestionsContactActivityDelegate_ *)v3;
}

- (void)setContactActivityDelegate:(id)a3
{
}

- (id)initFromResourceDepot:(id)a3
{
  return MapsSuggestionsContactActivity.init(fromResourceDepot:)(a3);
}

- (void)contactActivityEntriesWith:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    v7 = sub_1A7159C84;
  }
  else
  {
    v7 = 0;
    uint64_t v6 = 0;
  }
  v8 = self;
  MapsSuggestionsContactActivity.contactActivityEntries(with:)((uint64_t)v7, v6);
  sub_1A713FAB0((uint64_t)v7);
}

- (_TtC15MapsSuggestions30MapsSuggestionsContactActivity)init
{
  result = (_TtC15MapsSuggestions30MapsSuggestionsContactActivity *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15MapsSuggestions30MapsSuggestionsContactActivity__biome));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15MapsSuggestions30MapsSuggestionsContactActivity__contacts));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15MapsSuggestions30MapsSuggestionsContactActivity__findMy));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15MapsSuggestions30MapsSuggestionsContactActivity__queue));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC15MapsSuggestions30MapsSuggestionsContactActivity_contactActivityDelegate;
  sub_1A7159C8C((uint64_t)v3);
}

@end