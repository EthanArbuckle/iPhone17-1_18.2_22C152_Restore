@interface SpotlightUtilities
+ (CSSearchableIndex)searchableIndex;
+ (void)deleteAllSearchableItemsWithCompletionHandler:(id)a3;
+ (void)reindexAllSearchableItemsWithSpotlightDelegate:(NSCoreDataCoreSpotlightDelegate *)a3 completionHandler:(id)a4;
+ (void)setDisableSearchInSpotlightFlagWithDisableSearchInSpotlight:(BOOL)a3 completionHandler:(id)a4;
- (_TtC15JournalSettings18SpotlightUtilities)init;
@end

@implementation SpotlightUtilities

+ (CSSearchableIndex)searchableIndex
{
  id v2 = objc_allocWithZone((Class)CSSearchableIndex);
  NSString v3 = sub_145B80();
  NSString v4 = sub_145B80();
  id v5 = [v2 initWithName:v3 bundleIdentifier:v4];

  return (CSSearchableIndex *)v5;
}

+ (void)setDisableSearchInSpotlightFlagWithDisableSearchInSpotlight:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_A314(&qword_19BFB0);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = a1;
  uint64_t v12 = sub_145F50();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_19C010;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_19C018;
  v14[5] = v13;
  sub_25AA0((uint64_t)v9, (uint64_t)&unk_19C020, (uint64_t)v14);
  swift_release();
}

+ (void)deleteAllSearchableItemsWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_A314(&qword_19BFB0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = a1;
  uint64_t v10 = sub_145F50();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_19BFE8;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_19BFF0;
  v12[5] = v11;
  sub_25AA0((uint64_t)v7, (uint64_t)&unk_19BFF8, (uint64_t)v12);
  swift_release();
}

+ (void)reindexAllSearchableItemsWithSpotlightDelegate:(NSCoreDataCoreSpotlightDelegate *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_A314(&qword_19BFB0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = a1;
  uint64_t v12 = sub_145F50();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_19BFC0;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_19BFC8;
  v14[5] = v13;
  uint64_t v15 = a3;
  sub_25AA0((uint64_t)v9, (uint64_t)&unk_19BFD0, (uint64_t)v14);
  swift_release();
}

- (_TtC15JournalSettings18SpotlightUtilities)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SpotlightUtilities();
  return [(SpotlightUtilities *)&v3 init];
}

@end