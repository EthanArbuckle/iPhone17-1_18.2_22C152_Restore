@interface FitCoreDQueryClass
- (BOOL)persistFitnessDataWithFitnessTablesData:(id)a3 error:(id *)a4;
- (NSArray)allFitnessTables;
- (NSDictionary)tableUpdateSummary;
- (_TtC19AppleMediaDiscovery18FitCoreDQueryClass)init;
- (void)fetchCatalogMetadataWithCompletionHandler:(id)a3;
- (void)filterFitcoreDCatalogDebugWithCatalogFilterConfig:(NSDictionary *)a3 completionHandler:(id)a4;
- (void)filterFitcoreDCatalogWithCatalogFilterConfig:(NSDictionary *)a3 completionHandler:(id)a4;
- (void)queryWorkoutReferencesWithWorkoutQueryConfig:(NSDictionary *)a3 completionHandler:(id)a4;
- (void)runBootstrapCatalogSyncWithBootstrapCatalogSyncConfig:(NSDictionary *)a3 completionHandler:(id)a4;
- (void)setAllFitnessTables:(id)a3;
- (void)setTableUpdateSummary:(id)a3;
@end

@implementation FitCoreDQueryClass

- (NSDictionary)tableUpdateSummary
{
  v2 = self;
  sub_20ACAF55C();

  id v5 = (id)sub_20ACD4F70();
  swift_bridgeObjectRelease();

  return (NSDictionary *)v5;
}

- (void)setTableUpdateSummary:(id)a3
{
  id v4 = a3;
  id v5 = self;
  uint64_t v6 = sub_20ACD4F80();
  sub_20ACAF63C(v6);
}

- (NSArray)allFitnessTables
{
  v2 = self;
  sub_20ACAF7E8();

  id v5 = (id)sub_20ACD50D0();
  swift_bridgeObjectRelease();

  return (NSArray *)v5;
}

- (void)setAllFitnessTables:(id)a3
{
  id v4 = a3;
  id v5 = self;
  uint64_t v6 = sub_20ACD50E0();
  sub_20ACAF8B4(v6);
}

- (void)filterFitcoreDCatalogWithCatalogFilterConfig:(NSDictionary *)a3 completionHandler:(id)a4
{
  id v4 = a3;
  v9 = _Block_copy(a4);
  id v5 = self;
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = a3;
  v6[3] = v9;
  v6[4] = self;
  sub_20ACADA3C((uint64_t)&unk_267680F98, (uint64_t)v6);
}

- (void)queryWorkoutReferencesWithWorkoutQueryConfig:(NSDictionary *)a3 completionHandler:(id)a4
{
  id v4 = a3;
  v9 = _Block_copy(a4);
  id v5 = self;
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = a3;
  v6[3] = v9;
  v6[4] = self;
  sub_20ACADA3C((uint64_t)&unk_267680FC8, (uint64_t)v6);
}

- (void)filterFitcoreDCatalogDebugWithCatalogFilterConfig:(NSDictionary *)a3 completionHandler:(id)a4
{
  id v4 = a3;
  v9 = _Block_copy(a4);
  id v5 = self;
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = a3;
  v6[3] = v9;
  v6[4] = self;
  sub_20ACADA3C((uint64_t)&unk_267680FE0, (uint64_t)v6);
}

- (void)fetchCatalogMetadataWithCompletionHandler:(id)a3
{
  id v5 = _Block_copy(a3);
  v3 = self;
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v5;
  *(void *)(v4 + 24) = self;
  sub_20ACADA3C((uint64_t)&unk_267681008, v4);
}

- (void)runBootstrapCatalogSyncWithBootstrapCatalogSyncConfig:(NSDictionary *)a3 completionHandler:(id)a4
{
  uint64_t v4 = a3;
  v9 = _Block_copy(a4);
  id v5 = self;
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = a3;
  v6[3] = v9;
  v6[4] = self;
  sub_20ACADA3C((uint64_t)&unk_267681020, (uint64_t)v6);
}

- (BOOL)persistFitnessDataWithFitnessTablesData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  uint64_t v10 = sub_20ACD4F80();
  sub_20ACBE3D0(v10);
  swift_bridgeObjectRelease();

  return 1;
}

- (_TtC19AppleMediaDiscovery18FitCoreDQueryClass)init
{
  return (_TtC19AppleMediaDiscovery18FitCoreDQueryClass *)FitCoreDQueryClass.init()();
}

- (void).cxx_destruct
{
}

@end