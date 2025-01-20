@interface FedStatsPluginMLHostClient
- (BOOL)fetchAssets:(id)a3 error:(id *)a4;
- (_TtC20FedStatsMLHostPlugin26FedStatsPluginMLHostClient)init;
- (id)assetURLForRecipe:(id)a3 forKey:(id)a4 error:(id *)a5;
- (id)deploymentIdentifierForRecipe:(id)a3;
- (id)experimentIdentifierForRecipe:(id)a3;
- (id)namespaceIdentifierForRecipe:(id)a3;
- (id)recipeDictionaryForRecipe:(id)a3 error:(id *)a4;
- (id)recipeIdentifiers;
- (id)treatmentIdentifierForRecipe:(id)a3;
- (void)removeAssets;
@end

@implementation FedStatsPluginMLHostClient

- (id)recipeDictionaryForRecipe:(id)a3 error:(id *)a4
{
  uint64_t v5 = sub_100018880();
  v7 = v6;
  v8 = self;
  FedStatsPluginMLHostClient.recipeDictionary(forRecipe:)(v5, v7);
  swift_bridgeObjectRelease();

  v9.super.isa = sub_100018830().super.isa;
  swift_bridgeObjectRelease();

  return v9.super.isa;
}

- (id)namespaceIdentifierForRecipe:(id)a3
{
  return sub_1000101F0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))FedStatsPluginMLHostClient.namespaceIdentifier(forRecipe:));
}

- (id)experimentIdentifierForRecipe:(id)a3
{
  return sub_1000101F0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))FedStatsPluginMLHostClient.experimentIdentifier(forRecipe:));
}

- (id)treatmentIdentifierForRecipe:(id)a3
{
  sub_100018880();
  NSString v3 = sub_100018870();
  swift_bridgeObjectRelease();

  return v3;
}

- (id)deploymentIdentifierForRecipe:(id)a3
{
  return sub_1000101F0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))FedStatsPluginMLHostClient.deploymentIdentifier(forRecipe:));
}

- (id)recipeIdentifiers
{
  v2 = self;
  uint64_t v3 = swift_bridgeObjectRetain();
  sub_100016248(v3);

  swift_bridgeObjectRelease();
  v4.super.isa = sub_100018910().super.isa;
  swift_release();

  return v4.super.isa;
}

- (BOOL)fetchAssets:(id)a3 error:(id *)a4
{
  sub_100008028((uint64_t *)&unk_100020860);
  uint64_t v6 = sub_100018840();
  v7 = self;
  FedStatsPluginMLHostClient.fetchAssets(_:)((Swift::OpaquePointer)v6);
  swift_bridgeObjectRelease();

  if (v8)
  {
    if (a4)
    {
      NSDictionary v9 = (void *)sub_100018630();
      swift_errorRelease();
      id v10 = v9;
      *a4 = v9;
    }
    else
    {
      swift_errorRelease();
    }
  }
  return v8 == 0;
}

- (id)assetURLForRecipe:(id)a3 forKey:(id)a4 error:(id *)a5
{
  uint64_t v6 = sub_1000186B0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  NSDictionary v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100018880();
  v12 = v11;
  uint64_t v13 = sub_100018880();
  v15 = v14;
  v16 = self;
  FedStatsPluginMLHostClient.assetURL(forRecipe:forKey:)(v10, v12, v13, v15, (uint64_t)v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_100018680(v17);
  v19 = v18;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v19;
}

- (void)removeAssets
{
  v2 = self;
  FedStatsPluginMLHostClient.removeAssets()();
}

- (_TtC20FedStatsMLHostPlugin26FedStatsPluginMLHostClient)init
{
  result = (_TtC20FedStatsMLHostPlugin26FedStatsPluginMLHostClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end