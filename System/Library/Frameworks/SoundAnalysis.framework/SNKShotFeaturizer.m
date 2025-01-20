@interface SNKShotFeaturizer
+ (id)featurizeFiles:(id)a3 hallucinatorModelURL:(id)a4 queue:(id)a5 completionHandler:(id)a6;
+ (id)featurizeFiles:(id)a3 hallucinatorModelURL:(id)a4 queue:(id)a5 resultHandler:(id)a6 completionHandler:(id)a7;
+ (id)performSegmentationRequest:(id)a3 error:(id *)a4;
- (SNKShotFeaturizer)init;
@end

@implementation SNKShotFeaturizer

+ (id)featurizeFiles:(id)a3 hallucinatorModelURL:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  uint64_t v8 = sub_1DCB86A18();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a6);
  sub_1DCB87C38();
  sub_1DCB869B8();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  id v14 = a5;
  static SNKShotFeaturizer.featurizeFiles(_:hallucinatorModelURL:queue:completionHandler:)((uint64_t)v14, (uint64_t)sub_1DC89C764, v13, v17);

  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  sub_1DC881A8C(v17, v17[3]);
  v15 = (void *)sub_1DCB89008();
  sub_1DC8818D0((uint64_t)v17);

  return v15;
}

+ (id)featurizeFiles:(id)a3 hallucinatorModelURL:(id)a4 queue:(id)a5 resultHandler:(id)a6 completionHandler:(id)a7
{
  uint64_t v10 = sub_1DCB86A18();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v14 = _Block_copy(a6);
  v15 = _Block_copy(a7);
  sub_1DCB87C38();
  sub_1DCB869B8();
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v14;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v15;
  id v18 = a5;
  static SNKShotFeaturizer.featurizeFiles(_:hallucinatorModelURL:queue:resultHandler:completionHandler:)((uint64_t)v18, (uint64_t)sub_1DC89C750, v16, (uint64_t)sub_1DC89D3F0, v17, v21);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  sub_1DC881A8C(v21, v21[3]);
  v19 = (void *)sub_1DCB89008();
  sub_1DC8818D0((uint64_t)v21);

  return v19;
}

+ (id)performSegmentationRequest:(id)a3 error:(id *)a4
{
  id v4 = a3;
  v5 = (void *)static SNKShotFeaturizer.performSegmentationRequest(_:)((uint64_t)v4);

  return v5;
}

- (SNKShotFeaturizer)init
{
  return (SNKShotFeaturizer *)SNKShotFeaturizer.init()();
}

@end