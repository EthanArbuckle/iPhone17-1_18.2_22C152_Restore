@interface PDClassKitServiceOperationsObjC
- (PDClassKitServiceOperationsObjC)init;
- (void)checkConnectionStatusWithCompletion:(id)a3;
- (void)fetchRecordsforDownloadingWithIsDraft:(BOOL)a3 request:(id)a4 progressBlock:(id)a5 recordResultBlock:(id)a6 completionBlock:(id)a7;
- (void)fetchRecordsforStreamingWithIsDraft:(BOOL)a3 request:(id)a4 progressBlock:(id)a5 recordResultBlock:(id)a6 completionBlock:(id)a7;
@end

@implementation PDClassKitServiceOperationsObjC

- (void)fetchRecordsforDownloadingWithIsDraft:(BOOL)a3 request:(id)a4 progressBlock:(id)a5 recordResultBlock:(id)a6 completionBlock:(id)a7
{
  BOOL v10 = a3;
  v12 = _Block_copy(a5);
  v13 = _Block_copy(a6);
  v14 = _Block_copy(a7);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v12;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v13;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v14;
  id v18 = a4;
  v19 = self;
  ClassKitServiceOperations.fetchRecordsforDownloading(isDraft:request:progressBlock:recordResultBlock:completionBlock:)(v10, (uint64_t)v18, (uint64_t)sub_100018658, v15, (uint64_t)sub_100018650, v16, (uint64_t)sub_100018654, v17);

  swift_release();
  swift_release();

  swift_release();
}

- (void)fetchRecordsforStreamingWithIsDraft:(BOOL)a3 request:(id)a4 progressBlock:(id)a5 recordResultBlock:(id)a6 completionBlock:(id)a7
{
  BOOL v10 = a3;
  v12 = _Block_copy(a5);
  v13 = _Block_copy(a6);
  v14 = _Block_copy(a7);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v12;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v13;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v14;
  id v18 = a4;
  v19 = self;
  ClassKitServiceOperations.fetchRecordsforStreaming(isDraft:request:progressBlock:recordResultBlock:completionBlock:)(v10, (uint64_t)v18, (uint64_t)sub_10001836C, v15, (uint64_t)sub_100018380, v16, (uint64_t)sub_100018388, v17);

  swift_release();
  swift_release();

  swift_release();
}

- (void)checkConnectionStatusWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  _s9progressd25ClassKitServiceOperationsC21checkConnectionStatus10completionyySSSg_s5Error_pSgtc_tF_0((uint64_t)sub_100018364, v5);

  swift_release();
}

- (PDClassKitServiceOperationsObjC)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ClassKitServiceOperations();
  return [(PDClassKitServiceOperationsObjC *)&v3 init];
}

@end