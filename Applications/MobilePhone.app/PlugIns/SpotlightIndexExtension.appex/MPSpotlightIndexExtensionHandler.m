@interface MPSpotlightIndexExtensionHandler
- (MPSpotlightIndexExtensionHandler)init;
- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4;
- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5;
@end

@implementation MPSpotlightIndexExtensionHandler

- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_100003878((uint64_t)v8, (uint64_t)v6, "Asked to reindex all items. Setting needsReindexing to true");
  _Block_release(v6);
  _Block_release(v6);
}

- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5
{
  id v7 = _Block_copy(a5);
  _Block_copy(v7);
  id v8 = a3;
  v9 = self;
  sub_100003878((uint64_t)v9, (uint64_t)v7, "Asked to reindex items with identifiers. Setting needsReindexing to true");
  _Block_release(v7);
  _Block_release(v7);
}

- (MPSpotlightIndexExtensionHandler)init
{
  v2 = self;
  sub_100003A98();
  uint64_t v3 = OBJC_IVAR___MPSpotlightIndexExtensionHandler_featureFlags;
  *(Class *)((char *)&v2->super.super.isa + v3) = (Class)[objc_allocWithZone((Class)TUFeatureFlags) init];

  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for MPSpotlightIndexExtensionHandler();
  return [(MPSpotlightIndexExtensionHandler *)&v5 init];
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR___MPSpotlightIndexExtensionHandler_logger;
  uint64_t v4 = sub_100003AA8();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_super v5 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___MPSpotlightIndexExtensionHandler_featureFlags);
}

@end