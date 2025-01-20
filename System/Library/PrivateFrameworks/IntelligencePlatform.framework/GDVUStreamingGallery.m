@interface GDVUStreamingGallery
- (BOOL)resetAndReturnError:(id *)a3;
- (GDVUStreamingGallery)init;
- (GDVUStreamingGallery)initWithClient:(id)a3 error:(id *)a4;
- (id)addWithObservations:(id)a3 observationIdentifiers:(id)a4 trackIdentifiers:(id)a5 context:(id)a6 error:(id *)a7;
- (id)updateWithMaxKeyFacesPerCluster:(int64_t)a3 error:(id *)a4;
- (id)updateWithMaxKeyFacesPerCluster:(int64_t)a3 sortBy:(id)a4 error:(id *)a5;
@end

@implementation GDVUStreamingGallery

- (GDVUStreamingGallery)initWithClient:(id)a3 error:(id *)a4
{
  return (GDVUStreamingGallery *)sub_1B2E2D698(a3);
}

- (BOOL)resetAndReturnError:(id *)a3
{
  return sub_1B2E2D82C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))GDVUStreamingGallery.reset());
}

- (id)updateWithMaxKeyFacesPerCluster:(int64_t)a3 error:(id *)a4
{
  v5 = self;
  GDVUStreamingGallery.update(withMaxKeyFacesPerCluster:)(a3);

  type metadata accessor for GDVUClusterResult(v6);
  v7 = (void *)sub_1B2E82828();
  swift_bridgeObjectRelease();

  return v7;
}

- (id)updateWithMaxKeyFacesPerCluster:(int64_t)a3 sortBy:(id)a4 error:(id *)a5
{
  sub_1B2E82838();
  uint64_t v6 = self;
  GDVUStreamingGallery.update(withMaxKeyFacesPerCluster:sortBy:)();
  swift_bridgeObjectRelease();

  type metadata accessor for GDVUClusterResult(v7);
  v8 = (void *)sub_1B2E82828();
  swift_bridgeObjectRelease();

  return v8;
}

- (id)addWithObservations:(id)a3 observationIdentifiers:(id)a4 trackIdentifiers:(id)a5 context:(id)a6 error:(id *)a7
{
  sub_1B29C3CA0(0, &qword_1E9C45318);
  uint64_t v11 = sub_1B2E82838();
  if (a4) {
    a4 = (id)sub_1B2E82838();
  }
  if (a5) {
    a5 = (id)sub_1B2E82838();
  }
  id v12 = a6;
  v13 = self;
  GDVUStreamingGallery.add(with:observationIdentifiers:trackIdentifiers:context:)(v11, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v14 = (void *)sub_1B2E82828();
  swift_bridgeObjectRelease();

  return v14;
}

- (GDVUStreamingGallery)init
{
}

- (void).cxx_destruct
{
}

@end