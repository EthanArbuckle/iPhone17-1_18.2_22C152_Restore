@interface DaemonCoreDataSpotlightIndexer
- (id)attributeSetForObject:(id)a3;
- (id)bundleIdentifier;
- (id)initForStoreWithDescription:(id)a3 coordinator:(id)a4;
- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4;
- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5;
@end

@implementation DaemonCoreDataSpotlightIndexer

- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_1D72A19B8((uint64_t)v8, (uint64_t)sub_1D72A2D44, v7);

  swift_release();
}

- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  uint64_t v8 = sub_1D74101A8();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  id v10 = a3;
  v11 = self;
  sub_1D72A1BFC((uint64_t)v10, v8, (uint64_t)sub_1D72A2C18, v9);

  swift_bridgeObjectRelease();
  swift_release();
}

- (id)attributeSetForObject:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_1D72A1E8C(v4);

  return v6;
}

- (id)bundleIdentifier
{
  v2 = (void *)sub_1D740FFB8();
  return v2;
}

- (id)initForStoreWithDescription:(id)a3 coordinator:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v8 = (char *)self + OBJC_IVAR____TtC13FinanceDaemon30DaemonCoreDataSpotlightIndexer_coreAnalytics;
  *(_OWORD *)uint64_t v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((void *)v8 + 4) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC13FinanceDaemon30DaemonCoreDataSpotlightIndexer_context) = 0;
  v10.receiver = self;
  v10.super_class = ObjectType;
  return [(NSCoreDataCoreSpotlightDelegate *)&v10 initForStoreWithDescription:a3 coordinator:a4];
}

- (void).cxx_destruct
{
  sub_1D72A2C94((uint64_t)self + OBJC_IVAR____TtC13FinanceDaemon30DaemonCoreDataSpotlightIndexer_coreAnalytics);
  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC13FinanceDaemon30DaemonCoreDataSpotlightIndexer_context);
}

@end