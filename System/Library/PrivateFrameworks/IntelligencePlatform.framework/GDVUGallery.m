@interface GDVUGallery
- (BOOL)mutateAndReturnError:(id *)a3 handler:(id)a4;
- (BOOL)ready;
- (BOOL)resetAndReturnError:(id *)a3;
- (BOOL)resetWithType:(int64_t)a3 error:(id *)a4;
- (BOOL)updateAndReturnError:(id *)a3 progressHandler:(id)a4;
- (GDVUGallery)init;
- (NSArray)assets;
- (NSDictionary)observationsCountPerEntity;
- (NSSet)unassignedObservations;
- (id)clustersFor:(id)a3;
- (id)keyObservationsFor:(int64_t)a3 limit:(int64_t)a4 offset:(int64_t)a5;
- (int64_t)animalEntitiesCount;
- (int64_t)animalObservationsCount;
- (int64_t)animalprintRevision;
- (int64_t)entityCount;
- (int64_t)faceprintRevision;
- (int64_t)observationsCount;
- (int64_t)personEntitiesCount;
- (int64_t)personObservationsCount;
- (int64_t)primaryCount;
- (int64_t)secondaryCount;
- (int64_t)tagsCount;
- (int64_t)torsoprintRevision;
- (int64_t)version;
- (void)reportMetrics;
- (void)updateInferredDeviceOwner;
- (void)updateSocialGroupsWithSocialGroups:(id)a3;
@end

@implementation GDVUGallery

- (int64_t)version
{
  v2 = self;
  int64_t v3 = GDVUGallery.version.getter();

  return v3;
}

- (BOOL)ready
{
  v2 = self;
  char v3 = GDVUGallery.ready.getter();

  return v3 & 1;
}

- (int64_t)faceprintRevision
{
  v2 = self;
  int64_t v3 = GDVUGallery.faceprintRevision.getter();

  return v3;
}

- (int64_t)torsoprintRevision
{
  v2 = self;
  int64_t v3 = GDVUGallery.torsoprintRevision.getter();

  return v3;
}

- (int64_t)animalprintRevision
{
  v2 = self;
  int64_t v3 = GDVUGallery.animalprintRevision.getter();

  return v3;
}

- (int64_t)observationsCount
{
  v2 = self;
  int64_t v3 = GDVUGallery.observationsCount.getter();

  return v3;
}

- (int64_t)primaryCount
{
  v2 = self;
  int64_t v3 = GDVUGallery.primaryCount.getter();

  return v3;
}

- (int64_t)secondaryCount
{
  v2 = self;
  int64_t v3 = GDVUGallery.secondaryCount.getter();

  return v3;
}

- (int64_t)personObservationsCount
{
  v2 = self;
  int64_t v3 = GDVUGallery.personObservationsCount.getter();

  return v3;
}

- (int64_t)animalObservationsCount
{
  v2 = self;
  int64_t v3 = GDVUGallery.animalObservationsCount.getter();

  return v3;
}

- (int64_t)tagsCount
{
  v2 = self;
  int64_t v3 = GDVUGallery.tagsCount.getter();

  return v3;
}

- (int64_t)entityCount
{
  v2 = self;
  int64_t v3 = GDVUGallery.entityCount.getter();

  return v3;
}

- (int64_t)personEntitiesCount
{
  v2 = self;
  int64_t v3 = GDVUGallery.personEntitiesCount.getter();

  return v3;
}

- (int64_t)animalEntitiesCount
{
  v2 = self;
  int64_t v3 = GDVUGallery.animalEntitiesCount.getter();

  return v3;
}

- (NSDictionary)observationsCountPerEntity
{
  v2 = self;
  GDVUGallery.observationsCountPerEntity.getter();

  sub_1B29C3CA0(0, &qword_1E9C38230);
  sub_1B29C3CA0(0, (unint64_t *)&qword_1EB7E2C40);
  sub_1B2E2FAF8();
  int64_t v3 = (void *)sub_1B2E820D8();
  swift_bridgeObjectRelease();

  return (NSDictionary *)v3;
}

- (NSArray)assets
{
  return (NSArray *)sub_1B2E2BB50(self, (uint64_t)a2, (void (*)(void))GDVUGallery.assets.getter);
}

- (NSSet)unassignedObservations
{
  v2 = self;
  GDVUGallery.unassignedObservations.getter();

  int64_t v3 = (void *)sub_1B2E82AF8();
  swift_bridgeObjectRelease();

  return (NSSet *)v3;
}

- (BOOL)mutateAndReturnError:(id *)a3 handler:(id)a4
{
  v7 = _Block_copy(a4);
  v5 = self;
  GDVUGallery.mutate(handler:)();

  _Block_release(v7);
  return 1;
}

- (id)clustersFor:(id)a3
{
  id v4 = a3;
  v5 = self;
  GDVUGallery.clusters(for:)();

  sub_1B29A3EB4(&qword_1E9C37CF0);
  v6 = (void *)sub_1B2E820D8();
  swift_bridgeObjectRelease();

  return v6;
}

- (void)updateSocialGroupsWithSocialGroups:(id)a3
{
  type metadata accessor for GDVUSocialGroup((uint64_t)self);
  uint64_t v4 = sub_1B2E82838();
  v5 = self;
  GDVUGallery.updateSocialGroups(with:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease();
}

- (BOOL)resetAndReturnError:(id *)a3
{
  return sub_1B2E2D82C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))GDVUGallery.reset());
}

- (BOOL)resetWithType:(int64_t)a3 error:(id *)a4
{
  return sub_1B2E2CF3C(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(uint64_t))GDVUGallery.reset(with:));
}

- (BOOL)updateAndReturnError:(id *)a3 progressHandler:(id)a4
{
  v5 = _Block_copy(a4);
  if (v5)
  {
    v6 = v5;
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v8 = sub_1B2E2FAC8;
  }
  else
  {
    v8 = 0;
    uint64_t v7 = 0;
  }
  v9 = self;
  GDVUGallery.update(progressHandler:)((uint64_t)v8, v7);

  sub_1B2AF182C((uint64_t)v8);
  return 1;
}

- (void)updateInferredDeviceOwner
{
  v2 = self;
  GDVUGallery.updateInferredDeviceOwner()();
}

- (id)keyObservationsFor:(int64_t)a3 limit:(int64_t)a4 offset:(int64_t)a5
{
  v6 = self;
  GDVUGallery.keyObservations(for:limit:offset:)(a3);

  sub_1B29A3EB4(&qword_1E9C39920);
  uint64_t v7 = (void *)sub_1B2E82828();
  swift_bridgeObjectRelease();

  return v7;
}

- (void)reportMetrics
{
  v2 = self;
  GDVUGallery.reportMetrics()();
}

- (GDVUGallery)init
{
}

- (void).cxx_destruct
{
}

@end