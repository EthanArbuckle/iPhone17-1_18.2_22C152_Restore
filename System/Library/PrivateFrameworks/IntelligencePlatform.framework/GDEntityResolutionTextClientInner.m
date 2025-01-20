@interface GDEntityResolutionTextClientInner
- (BOOL)cooldownSyncAndReturnError:(id *)a3;
- (BOOL)recordDirectFeedbackWithEngagedIds:(id)a3 rejectedIds:(id)a4 ignoredIds:(id)a5 neverPresentedIds:(id)a6 error:(id *)a7;
- (BOOL)warmupSyncFor:(int64_t)a3 error:(id *)a4;
- (GDEntityResolutionTextClientInner)init;
- (id)generateMentionsForQuery:(id)a3 error:(id *)a4;
- (id)initFor:(int64_t)a3 warmup:(BOOL)a4 error:(id *)a5;
- (id)resolveAddressToContactForRequest:(id)a3 error:(id *)a4;
- (id)resolveEntitiesSyncForBatchRequests:(id)a3 error:(id *)a4;
- (id)resolveEntitiesSyncForRequest:(id)a3 error:(id *)a4;
- (void)cooldownWithCompletionHandler:(id)a3;
- (void)resolveEntitiesForBatchRequests:(NSArray *)a3 completionHandler:(id)a4;
- (void)resolveEntitiesForRequest:(GDEntityResolutionRequest *)a3 completionHandler:(id)a4;
- (void)warmupFor:(int64_t)a3 completionHandler:(id)a4;
@end

@implementation GDEntityResolutionTextClientInner

- (id)initFor:(int64_t)a3 warmup:(BOOL)a4 error:(id *)a5
{
  return EntityResolutionTextClient.init(for:warmup:)(a3, a4);
}

- (void)warmupFor:(int64_t)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = self;

  sub_1B2AF8F40((uint64_t)&unk_1E9C3D298, (uint64_t)v7);
}

- (BOOL)warmupSyncFor:(int64_t)a3 error:(id *)a4
{
  v4 = self;
  sub_1B2AD48F0();

  return 1;
}

- (void)cooldownWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = self;
  v6 = self;

  sub_1B2AF8F40((uint64_t)&unk_1E9C3D288, v5);
}

- (BOOL)cooldownSyncAndReturnError:(id *)a3
{
  v3 = self;
  sub_1B2AD51A4();

  return 1;
}

- (void)resolveEntitiesForRequest:(GDEntityResolutionRequest *)a3 completionHandler:(id)a4
{
}

- (id)resolveEntitiesSyncForRequest:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = self;
  sub_1B2AD5B5C();
  v8 = v7;

  return v8;
}

- (void)resolveEntitiesForBatchRequests:(NSArray *)a3 completionHandler:(id)a4
{
}

- (id)resolveEntitiesSyncForBatchRequests:(id)a3 error:(id *)a4
{
  sub_1B29C3CA0(0, &qword_1E9C3D258);
  sub_1B2E82838();
  id v5 = self;
  sub_1B2AD6564();
  swift_bridgeObjectRelease();

  sub_1B29C3CA0(0, &qword_1EB7D97F0);
  v6 = (void *)sub_1B2E82828();
  swift_bridgeObjectRelease();

  return v6;
}

- (id)generateMentionsForQuery:(id)a3 error:(id *)a4
{
  sub_1B2E82378();
  id v5 = self;
  sub_1B2AD6960();
  v7 = v6;
  swift_bridgeObjectRelease();

  return v7;
}

- (id)resolveAddressToContactForRequest:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = self;
  id v7 = sub_1B2AD804C(v5);

  return v7;
}

- (BOOL)recordDirectFeedbackWithEngagedIds:(id)a3 rejectedIds:(id)a4 ignoredIds:(id)a5 neverPresentedIds:(id)a6 error:(id *)a7
{
  uint64_t v8 = sub_1B2E82B08();
  uint64_t v9 = sub_1B2E82B08();
  uint64_t v10 = sub_1B2E82B08();
  uint64_t v11 = sub_1B2E82B08();
  v12 = self;
  sub_1B2AD85F8(v8, v9, v10, v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return 1;
}

- (GDEntityResolutionTextClientInner)init
{
}

- (void).cxx_destruct
{
  _s20IntelligencePlatform28InferenceServiceInstanceEnumOwxx_0((uint64_t)self + OBJC_IVAR___GDEntityResolutionTextClientInner_service);
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___GDEntityResolutionTextClientInner_feedbackService);
}

@end