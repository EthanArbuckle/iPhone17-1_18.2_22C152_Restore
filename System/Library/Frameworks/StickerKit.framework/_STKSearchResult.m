@interface _STKSearchResult
- (NSArray)results;
- (STKStickerSearchQuery)originalQuery;
- (_STKSearchResult)init;
- (_STKSearchResult)initWithOriginalQuery:(id)a3 results:(id)a4;
@end

@implementation _STKSearchResult

- (STKStickerSearchQuery)originalQuery
{
  return (STKStickerSearchQuery *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                          + OBJC_IVAR____STKSearchResult_originalQuery));
}

- (NSArray)results
{
  type metadata accessor for ImageGlyph(0);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_2453FFCF8();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (_STKSearchResult)initWithOriginalQuery:(id)a3 results:(id)a4
{
  type metadata accessor for ImageGlyph(0);
  v6 = (objc_class *)sub_2453FFD18();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____STKSearchResult_originalQuery) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____STKSearchResult_results) = v6;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for _STKSearchResult();
  id v7 = a3;
  return [(_STKSearchResult *)&v9 init];
}

- (_STKSearchResult)init
{
  result = (_STKSearchResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end