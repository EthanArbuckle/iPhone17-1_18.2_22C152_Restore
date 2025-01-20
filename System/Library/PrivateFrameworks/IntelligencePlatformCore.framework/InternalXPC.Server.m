@interface InternalXPC.Server
- (_TtCC24IntelligencePlatformCore11InternalXPC6Server)init;
- (void)behaviorUnderstandingClearAllDataWithShouldClearFeaturizer:(BOOL)a3 shouldClearSampleGenerator:(BOOL)a4 completion:(id)a5;
- (void)behaviorUnderstandingClearEntityTaggingInjectedTagsWithCompletion:(id)a3;
- (void)behaviorUnderstandingDigestWithShouldDigestFeaturizer:(BOOL)a3 shouldDigestSampleGenerator:(BOOL)a4 completion:(id)a5;
- (void)behaviorUnderstandingDumpEntityTaggingDataCollectionWithOutputPath:(id)a3 completion:(id)a4;
- (void)behaviorUnderstandingEvaluateForBehaviorType:(NSString *)a3 queryName:(NSString *)a4 inferenceServiceInstanceId:(NSString *)a5 completion:(id)a6;
- (void)behaviorUnderstandingFeaturizeBehaviorOfType:(id)a3 identifier:(id)a4 usingContextAt:(id)a5 completion:(id)a6;
- (void)behaviorUnderstandingFeaturizedBehaviorsForFeatureName:(id)a3 behaviorType:(id)a4 completion:(id)a5;
- (void)behaviorUnderstandingHistogramsOfKind:(id)a3 behaviorType:(id)a4 viewName:(id)a5 completion:(id)a6;
- (void)behaviorUnderstandingInjectTagForPersonID:(id)a3 tagType:(id)a4 confidence:(double)a5 completion:(id)a6;
- (void)behaviorUnderstandingMockEntityRelevanceContextWithDate:(NSDate *)a3 completion:(id)a4;
- (void)behaviorUnderstandingRecentBehaviorsOfType:(id)a3 completion:(id)a4;
- (void)behaviorUnderstandingSampleEntityTaggingFeaturesForPersonID:(id)a3 completion:(id)a4;
- (void)behaviorUnderstandingShowEntityTaggingInjectedTagsWithCompletion:(id)a3;
- (void)behaviorUnderstandingStatusWithCompletion:(id)a3;
- (void)behaviorUnderstandingTriggerEntityTaggingDataCollectionWithCompletion:(id)a3;
- (void)benchmarkWithCompletion:(id)a3;
- (void)clearStatusWithCompletion:(id)a3;
- (void)contextDataForSource:(NSString *)a3 startDate:(NSDate *)a4 endDate:(NSDate *)a5 completion:(id)a6;
- (void)featureKeys:(id)a3;
- (void)generateActivityCentricLifeEventsFromStartDate:(NSDate *)a3 toEndDate:(NSDate *)a4 completion:(id)a5;
- (void)photosMetadataWithStartDate:(id)a3 endDate:(id)a4 maxEvents:(int64_t)a5 newestFirst:(BOOL)a6 completion:(id)a7;
- (void)resolveEntityWithRequest:(GDEntityResolutionRequest *)a3 enableSessionLogging:(BOOL)a4 configName:(NSString *)a5 encodedConfig:(NSString *)a6 completion:(id)a7;
- (void)runDeltaUpdatePipelineWithSource:(NSString *)a3 completion:(id)a4;
- (void)runToMatchingPipelineWithCompletion:(id)a3;
- (void)statsWithCompletion:(id)a3;
- (void)statusWithCompletion:(id)a3;
- (void)stopPipelineWithCompletion:(id)a3;
- (void)triplesQueryWithQuery:(id)a3 completion:(id)a4;
- (void)validateGraphWithCompletion:(id)a3;
- (void)vectorSearchBenchmarkWithConfigFilePath:(NSString *)a3 completion:(id)a4;
- (void)viewInfoWithViewQuery:(GDViewQuery *)a3 rows:(NSNumber *)a4 completion:(id)a5;
- (void)viewSqlWithName:(NSString *)a3 statement:(NSString *)a4 completion:(id)a5;
@end

@implementation InternalXPC.Server

- (void)behaviorUnderstandingStatusWithCompletion:(id)a3
{
}

- (void)behaviorUnderstandingClearAllDataWithShouldClearFeaturizer:(BOOL)a3 shouldClearSampleGenerator:(BOOL)a4 completion:(id)a5
{
}

- (void)behaviorUnderstandingDigestWithShouldDigestFeaturizer:(BOOL)a3 shouldDigestSampleGenerator:(BOOL)a4 completion:(id)a5
{
}

- (void)behaviorUnderstandingRecentBehaviorsOfType:(id)a3 completion:(id)a4
{
}

- (void)behaviorUnderstandingFeaturizeBehaviorOfType:(id)a3 identifier:(id)a4 usingContextAt:(id)a5 completion:(id)a6
{
  uint64_t v8 = sub_1C791F620();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a6);
  uint64_t v13 = sub_1C7925E60();
  unint64_t v15 = v14;
  uint64_t v16 = sub_1C7925E60();
  unint64_t v18 = v17;
  sub_1C791F5C0();
  _Block_copy(v12);
  v19 = self;
  sub_1C73162CC(v13, v15, v16, v18, (uint64_t)v11, (uint64_t)v19, v12);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  _Block_release(v12);
}

- (void)behaviorUnderstandingHistogramsOfKind:(id)a3 behaviorType:(id)a4 viewName:(id)a5 completion:(id)a6
{
  uint64_t v8 = _Block_copy(a6);
  uint64_t v9 = sub_1C7925E60();
  unint64_t v11 = v10;
  uint64_t v12 = sub_1C7925E60();
  unint64_t v14 = v13;
  if (a5)
  {
    uint64_t v15 = sub_1C7925E60();
    a5 = v16;
  }
  else
  {
    uint64_t v15 = 0;
  }
  _Block_copy(v8);
  unint64_t v17 = self;
  sub_1C731848C(v9, v11, v12, v14, v15, (uint64_t (*)(char *, uint64_t))a5, (uint64_t)v17, (void (**)(void, void, void))v8);
  _Block_release(v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)behaviorUnderstandingFeaturizedBehaviorsForFeatureName:(id)a3 behaviorType:(id)a4 completion:(id)a5
{
  v6 = _Block_copy(a5);
  uint64_t v7 = sub_1C7925E60();
  unint64_t v9 = v8;
  uint64_t v10 = sub_1C7925E60();
  unint64_t v12 = v11;
  _Block_copy(v6);
  unint64_t v13 = self;
  sub_1C7319F24(v7, v9, v10, v12, (uint64_t)v13, v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)photosMetadataWithStartDate:(id)a3 endDate:(id)a4 maxEvents:(int64_t)a5 newestFirst:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  uint64_t v11 = sub_1C791F620();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  unint64_t v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v15);
  unint64_t v17 = ((char *)&v21 - v16);
  unint64_t v18 = _Block_copy(a7);
  sub_1C791F5C0();
  sub_1C791F5C0();
  _Block_copy(v18);
  v19 = self;
  sub_1C731BA90(v17, (uint64_t)v14, a5, v8, (uint64_t)v19, v18);

  uint64_t v20 = *(void (**)(char *, uint64_t))(v12 + 8);
  v20(v14, v11);
  v20((char *)v17, v11);
  _Block_release(v18);
}

- (void)behaviorUnderstandingEvaluateForBehaviorType:(NSString *)a3 queryName:(NSString *)a4 inferenceServiceInstanceId:(NSString *)a5 completion:(id)a6
{
  uint64_t v10 = _Block_copy(a6);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = a5;
  v11[5] = v10;
  v11[6] = self;
  uint64_t v12 = a3;
  uint64_t v13 = a4;
  unint64_t v14 = a5;
  uint64_t v15 = self;
  sub_1C77690E4((uint64_t)&unk_1EA472C68, (uint64_t)v11);
}

- (void)behaviorUnderstandingSampleEntityTaggingFeaturesForPersonID:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = sub_1C7925E60();
  uint64_t v8 = v7;
  _Block_copy(v5);
  unint64_t v9 = self;
  sub_1C731F170(v6, v8, (uint64_t)v9, (void (**)(void, void, void))v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)behaviorUnderstandingTriggerEntityTaggingDataCollectionWithCompletion:(id)a3
{
}

- (void)behaviorUnderstandingDumpEntityTaggingDataCollectionWithOutputPath:(id)a3 completion:(id)a4
{
}

- (void)behaviorUnderstandingMockEntityRelevanceContextWithDate:(NSDate *)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  uint64_t v8 = a3;
  unint64_t v9 = self;
  sub_1C77690E4((uint64_t)&unk_1EA472C58, (uint64_t)v7);
}

- (void)behaviorUnderstandingShowEntityTaggingInjectedTagsWithCompletion:(id)a3
{
}

- (void)behaviorUnderstandingClearEntityTaggingInjectedTagsWithCompletion:(id)a3
{
}

- (void)behaviorUnderstandingInjectTagForPersonID:(id)a3 tagType:(id)a4 confidence:(double)a5 completion:(id)a6
{
  uint64_t v8 = _Block_copy(a6);
  uint64_t v9 = sub_1C7925E60();
  uint64_t v11 = v10;
  uint64_t v12 = sub_1C7925E60();
  unint64_t v14 = v13;
  _Block_copy(v8);
  uint64_t v15 = self;
  sub_1C7323E00(v9, v11, v12, v14, a5, (uint64_t)v15, v8);
  _Block_release(v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)contextDataForSource:(NSString *)a3 startDate:(NSDate *)a4 endDate:(NSDate *)a5 completion:(id)a6
{
  uint64_t v10 = _Block_copy(a6);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = a5;
  v11[5] = v10;
  v11[6] = self;
  uint64_t v12 = a3;
  uint64_t v13 = a4;
  unint64_t v14 = a5;
  uint64_t v15 = self;
  sub_1C77690E4((uint64_t)&unk_1EA472D98, (uint64_t)v11);
}

- (void)vectorSearchBenchmarkWithConfigFilePath:(NSString *)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  uint64_t v8 = a3;
  uint64_t v9 = self;
  sub_1C77690E4((uint64_t)&unk_1EA4731B0, (uint64_t)v7);
}

- (void)resolveEntityWithRequest:(GDEntityResolutionRequest *)a3 enableSessionLogging:(BOOL)a4 configName:(NSString *)a5 encodedConfig:(NSString *)a6 completion:(id)a7
{
  uint64_t v12 = _Block_copy(a7);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a3;
  *(unsigned char *)(v13 + 24) = a4;
  *(void *)(v13 + 32) = a5;
  *(void *)(v13 + 40) = a6;
  *(void *)(v13 + 48) = v12;
  *(void *)(v13 + 56) = self;
  unint64_t v14 = a3;
  uint64_t v15 = a5;
  uint64_t v16 = a6;
  unint64_t v17 = self;
  sub_1C77690E4((uint64_t)&unk_1EA473238, v13);
}

- (void)generateActivityCentricLifeEventsFromStartDate:(NSDate *)a3 toEndDate:(NSDate *)a4 completion:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  uint64_t v10 = a3;
  uint64_t v11 = a4;
  uint64_t v12 = self;
  sub_1C77690E4((uint64_t)&unk_1EA473408, (uint64_t)v9);
}

- (void)viewInfoWithViewQuery:(GDViewQuery *)a3 rows:(NSNumber *)a4 completion:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  uint64_t v10 = a3;
  uint64_t v11 = a4;
  uint64_t v12 = self;
  sub_1C77690E4((uint64_t)&unk_1EA4734D8, (uint64_t)v9);
}

- (void)viewSqlWithName:(NSString *)a3 statement:(NSString *)a4 completion:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  uint64_t v10 = a3;
  uint64_t v11 = a4;
  uint64_t v12 = self;
  sub_1C77690E4((uint64_t)&unk_1EA4734C8, (uint64_t)v9);
}

- (void)featureKeys:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = self;
  uint64_t v6 = self;
  sub_1C77690E4((uint64_t)&unk_1EA4734B0, v5);
}

- (void)statusWithCompletion:(id)a3
{
}

- (void)clearStatusWithCompletion:(id)a3
{
}

- (void)statsWithCompletion:(id)a3
{
}

- (void)triplesQueryWithQuery:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = (void *)sub_1C7925C00();
  _Block_copy(v5);
  uint64_t v7 = self;
  sub_1C734A680(v6, (uint64_t)v7, (void (**)(void, void *, void *))v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)benchmarkWithCompletion:(id)a3
{
}

- (void)validateGraphWithCompletion:(id)a3
{
}

- (_TtCC24IntelligencePlatformCore11InternalXPC6Server)init
{
  return (_TtCC24IntelligencePlatformCore11InternalXPC6Server *)InternalXPC.Server.init()();
}

- (void)runDeltaUpdatePipelineWithSource:(NSString *)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  uint64_t v8 = a3;
  uint64_t v9 = self;
  sub_1C77690E4((uint64_t)&unk_1EA473628, (uint64_t)v7);
}

- (void)runToMatchingPipelineWithCompletion:(id)a3
{
}

- (void)stopPipelineWithCompletion:(id)a3
{
}

@end