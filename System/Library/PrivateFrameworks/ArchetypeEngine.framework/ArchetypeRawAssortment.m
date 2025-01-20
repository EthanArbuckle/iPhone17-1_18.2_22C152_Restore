@interface ArchetypeRawAssortment
- (_TtC15ArchetypeEngine22ArchetypeRawAssortment)init;
- (id)textOnScreen;
- (int64_t)returnNumber;
- (void)spotlightEmailAttributesWithNEmails:(int64_t)a3 completionHandler:(id)a4;
- (void)spotlightItemTitlesWithNTitles:(int64_t)a3 completionHandler:(id)a4;
- (void)spotlightItemsWithContentType:(id)a3 completionHandler:(id)a4;
@end

@implementation ArchetypeRawAssortment

- (int64_t)returnNumber
{
  return 42;
}

- (void)spotlightItemTitlesWithNTitles:(int64_t)a3 completionHandler:(id)a4
{
}

- (void)spotlightEmailAttributesWithNEmails:(int64_t)a3 completionHandler:(id)a4
{
}

- (id)textOnScreen
{
  _s15ArchetypeEngine0A13RawAssortmentC12textOnScreenSSyF_0();
  v2 = (void *)sub_2486ABB58();
  swift_bridgeObjectRelease();
  return v2;
}

- (void)spotlightItemsWithContentType:(id)a3 completionHandler:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = sub_2486ABB68();
  uint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  v10 = self;
  _s15ArchetypeEngine0A13RawAssortmentC14spotlightItems11contentType17completionHandlerySS_ySaySSGctF_0(v6, v8, (uint64_t)sub_2486A63F8, v9);

  swift_bridgeObjectRelease();
  swift_release();
}

- (_TtC15ArchetypeEngine22ArchetypeRawAssortment)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ArchetypeRawAssortment();
  return [(ArchetypeRawAssortment *)&v3 init];
}

@end