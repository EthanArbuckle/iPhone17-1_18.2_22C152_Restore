@interface GDVUVisualUnderstandingService
- (BOOL)keyObservationFor:(id)a3 output:(int64_t *)a4 error:(id *)a5;
- (BOOL)similarEntitiesTo:(id)a3 error:(id *)a4 body:(id)a5;
- (BOOL)similarityWithBetween:(id)a3 and:(id)a4 output:(double *)a5 error:(id *)a6;
- (GDVUGallery)gallery;
- (GDVUVisualUnderstandingService)init;
- (GDVUVisualUnderstandingService)initWithClient:(id)a3 version:(int64_t)a4 url:(id)a5 error:(id *)a6;
- (id)changesSince:(id)a3 error:(id *)a4 body:(id)a5;
- (id)entitiesFor:(id)a3 error:(id *)a4 body:(id)a5;
- (id)inferredDeviceOwner;
- (id)inferredDeviceOwnerWithIgnoreMeGroundTruth:(BOOL)a3;
- (id)recognizeIn:(id)a3 context:(id)a4 error:(id *)a5;
- (id)recognizeIn:(id)a3 contextMoment:(int64_t)a4 error:(id *)a5;
@end

@implementation GDVUVisualUnderstandingService

- (GDVUGallery)gallery
{
  v2 = self;
  v3 = (void *)GDVUVisualUnderstandingService.gallery.getter((uint64_t)v2);

  return (GDVUGallery *)v3;
}

- (GDVUVisualUnderstandingService)initWithClient:(id)a3 version:(int64_t)a4 url:(id)a5 error:(id *)a6
{
  uint64_t v8 = sub_1B29A3EB4(&qword_1EB7E69E0);
  MEMORY[0x1F4188790](v8 - 8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    sub_1B2E80448();
    uint64_t v11 = sub_1B2E80498();
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v11 = sub_1B2E80498();
    uint64_t v12 = 1;
  }
  _s20IntelligencePlatform17UnstructuredImageV5AssetOwst_0((uint64_t)v10, v12, 1, v11);
  id v13 = a3;
  GDVUVisualUnderstandingService.init(client:version:url:)();
  return result;
}

- (id)recognizeIn:(id)a3 contextMoment:(int64_t)a4 error:(id *)a5
{
  id v6 = a3;
  v7 = self;
  GDVUVisualUnderstandingService.recognize(in:contextMoment:)();

  type metadata accessor for GDVURecognitionResult(v8);
  uint64_t v9 = (void *)sub_1B2E82828();
  swift_bridgeObjectRelease();

  return v9;
}

- (id)recognizeIn:(id)a3 context:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  GDVUVisualUnderstandingService.recognize(in:context:)();

  type metadata accessor for GDVURecognitionResult(v10);
  uint64_t v11 = (void *)sub_1B2E82828();
  swift_bridgeObjectRelease();

  return v11;
}

- (id)entitiesFor:(id)a3 error:(id *)a4 body:(id)a5
{
  id v7 = _Block_copy(a5);
  if (a3)
  {
    sub_1B29C3CA0(0, &qword_1E9C38230);
    a3 = (id)sub_1B2E82838();
  }
  _Block_copy(v7);
  id v8 = self;
  sub_1B2E28020((unint64_t)a3, (uint64_t)v8, (char *)v7);
  uint64_t v10 = v9;

  _Block_release(v7);
  swift_bridgeObjectRelease();

  return v10;
}

- (BOOL)keyObservationFor:(id)a3 output:(int64_t *)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = self;
  GDVUVisualUnderstandingService.keyObservation(for:output:)(v7, a4);

  return 1;
}

- (BOOL)similarityWithBetween:(id)a3 and:(id)a4 output:(double *)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = self;
  GDVUVisualUnderstandingService.similarity(withBetween:and:output:)(v9, v10, a5);

  return 1;
}

- (BOOL)similarEntitiesTo:(id)a3 error:(id *)a4 body:(id)a5
{
  id v7 = _Block_copy(a5);
  _Block_copy(v7);
  id v8 = a3;
  id v9 = self;
  sub_1B2E28F34(v8, (uint64_t)v9, (uint64_t (**)(void, void))v7);

  _Block_release(v7);
  return 1;
}

- (id)changesSince:(id)a3 error:(id *)a4 body:(id)a5
{
  id v7 = _Block_copy(a5);
  _Block_copy(v7);
  id v8 = a3;
  id v9 = self;
  id v10 = sub_1B2E291F8((uint64_t)v8, (uint64_t)v9, (uint64_t (**)(void, void))v7);

  _Block_release(v7);

  return v10;
}

- (id)inferredDeviceOwner
{
  v2 = self;
  id v3 = sub_1B2E29A40();

  return v3;
}

- (id)inferredDeviceOwnerWithIgnoreMeGroundTruth:(BOOL)a3
{
  id v3 = self;
  id v4 = sub_1B2E29BEC();

  return v4;
}

- (GDVUVisualUnderstandingService)init
{
}

- (void).cxx_destruct
{
}

@end