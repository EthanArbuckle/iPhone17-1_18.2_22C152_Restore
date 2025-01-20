@interface HMIAnalytics
+ (BOOL)lazyPayloads;
+ (BOOL)sendEventWithName:(id)a3 payloadBuilder:(id)a4;
+ (BOOL)upload;
+ (id)payloadWithCamera:(id)a3;
+ (int64_t)bucketForValue:(int64_t)a3 usingBuckets:(id)a4;
+ (void)sendEventForClusteringTask:(id)a3;
+ (void)sendEventForFaceEvent:(id)a3 homePersonManagerUUID:(id)a4 camera:(id)a5;
+ (void)sendEventForPersonRecognitionType:(int64_t)a3 camera:(id)a4;
+ (void)sendEventForPersonsModels:(id)a3;
+ (void)sendEventsForFragmentResult:(id)a3;
+ (void)videoAnalyzerDidAnalyzeFragmentWithResult:(id)a3 state:(id)a4;
+ (void)videoAnalyzerDidCreateTimelapseFragment:(id)a3 state:(id)a4;
+ (void)videoAnalyzerDidFindFaceEvent:(id)a3 homePersonManagerUUID:(id)a4 camera:(id)a5;
+ (void)videoAnalyzerDidTerminateWithError:(id)a3 state:(id)a4;
+ (void)videoPackageAnalyzerDidClassifyCandidateAsPackage:(BOOL)a3 camera:(id)a4;
+ (void)videoPackageAnalyzerDidResetReferenceImageWithInterval:(double)a3 camera:(id)a4;
@end

@implementation HMIAnalytics

+ (BOOL)upload
{
  v2 = +[HMIPreference sharedInstance];
  char v3 = [v2 BOOLPreferenceForKey:@"uploadVideoAnalysisEvent" defaultValue:1];

  return v3;
}

+ (BOOL)lazyPayloads
{
  return 1;
}

+ (BOOL)sendEventWithName:(id)a3 payloadBuilder:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  if ([a1 upload])
  {
    if ([a1 lazyPayloads])
    {
      char v8 = AnalyticsSendEventLazy();
    }
    else
    {
      v9 = v7[2](v7);
      AnalyticsSendEvent();

      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

+ (id)payloadWithCamera:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x263EFF9A0] dictionary];
  v5 = [v3 manufacturer];

  if (v5)
  {
    id v6 = [v3 manufacturer];
    [v4 setObject:v6 forKeyedSubscript:@"cameraManufacturer"];
  }
  v7 = [v3 model];

  if (v7)
  {
    char v8 = [v3 model];
    [v4 setObject:v8 forKeyedSubscript:@"cameraModel"];
  }
  v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "hasBattery"));
  [v4 setObject:v9 forKeyedSubscript:@"cameraHasBattery"];

  v10 = (void *)[v4 copy];
  return v10;
}

+ (void)sendEventForPersonRecognitionType:(int64_t)a3 camera:(id)a4
{
  id v6 = a4;
  v7 = [MEMORY[0x263EFF9A0] dictionary];
  if (v6)
  {
    char v8 = +[HMIAnalytics payloadWithCamera:v6];
    [v7 addEntriesFromDictionary:v8];
  }
  if (!a3)
  {
    v9 = @"face";
    goto LABEL_7;
  }
  if (a3 == 1)
  {
    v9 = @"torso";
LABEL_7:
    [v7 setObject:v9 forKeyedSubscript:@"recognitionType"];
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __57__HMIAnalytics_sendEventForPersonRecognitionType_camera___block_invoke;
  v11[3] = &unk_26477D910;
  id v12 = v7;
  id v10 = v7;
  [a1 sendEventWithName:@"com.apple.HomeAI.PersonRecognitionEvent" payloadBuilder:v11];
}

id __57__HMIAnalytics_sendEventForPersonRecognitionType_camera___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (void)videoAnalyzerDidFindFaceEvent:(id)a3 homePersonManagerUUID:(id)a4 camera:(id)a5
{
  id v15 = a3;
  id v7 = a4;
  id v8 = a5;
  v9 = [v15 faceRecognition];
  id v10 = [v9 classifications];
  int v11 = objc_msgSend(v10, "na_any:", &__block_literal_global_24);

  id v12 = [v15 faceRecognition];
  v13 = [v12 classifications];
  int v14 = objc_msgSend(v13, "na_any:", &__block_literal_global_25);

  if (v11) {
    +[HMIAnalytics sendEventForPersonRecognitionType:0 camera:v8];
  }
  if (v14) {
    +[HMIAnalytics sendEventForPersonRecognitionType:1 camera:v8];
  }
  else {
    +[HMIAnalytics sendEventForFaceEvent:v15 homePersonManagerUUID:v7 camera:v8];
  }
}

BOOL __75__HMIAnalytics_videoAnalyzerDidFindFaceEvent_homePersonManagerUUID_camera___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = ([v2 fromTorsoClassification] & 1) == 0 && objc_msgSend(v2, "familiarity") == 2;

  return v3;
}

BOOL __75__HMIAnalytics_videoAnalyzerDidFindFaceEvent_homePersonManagerUUID_camera___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 fromTorsoClassification]) {
    BOOL v3 = [v2 familiarity] == 2;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

+ (void)sendEventForFaceEvent:(id)a3 homePersonManagerUUID:(id)a4 camera:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [MEMORY[0x263EFF9A0] dictionary];
  if (v10)
  {
    id v12 = +[HMIAnalytics payloadWithCamera:v10];
    [v11 addEntriesFromDictionary:v12];
  }
  v13 = NSNumber;
  int v14 = [v8 confidence];
  [v14 value];
  v16 = [v13 numberWithDouble:ceil(v15 * 10.0)];
  [v11 setObject:v16 forKeyedSubscript:@"detectionScore"];

  v17 = [v8 userInfo];
  v18 = [v17 objectForKeyedSubscript:@"FaceFilteredState"];

  if (v18) {
    [v11 setObject:v18 forKeyedSubscript:@"faceFilteredState"];
  }
  v19 = [v8 faceRecognition];

  if (v19)
  {
    id v32 = a1;
    v20 = [MEMORY[0x263EFF9C0] set];
    v21 = [v8 faceRecognition];
    v22 = [v21 classifications];
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __67__HMIAnalytics_sendEventForFaceEvent_homePersonManagerUUID_camera___block_invoke;
    v35[3] = &unk_26477D938;
    id v36 = v9;
    id v23 = v11;
    id v37 = v23;
    id v24 = v20;
    id v38 = v24;
    objc_msgSend(v22, "na_each:", v35);

    if ([v24 count])
    {
      v25 = [v24 allObjects];
      v26 = [v25 sortedArrayUsingComparator:&__block_literal_global_39];

      v27 = [v26 firstObject];
      v28 = HMIFaceFamiliarityAsString([v27 integerValue]);
      [v23 setObject:v28 forKeyedSubscript:@"externalFamiliarity"];
    }
    v29 = [v8 faceRecognition];
    v30 = HMISessionEntityAssignmentAsString([v29 sessionEntityAssignment]);
    [v23 setObject:v30 forKeyedSubscript:@"sessionEntityAssignment"];

    a1 = v32;
  }
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __67__HMIAnalytics_sendEventForFaceEvent_homePersonManagerUUID_camera___block_invoke_3;
  v33[3] = &unk_26477D910;
  id v34 = v11;
  id v31 = v11;
  [a1 sendEventWithName:@"com.apple.HomeAI.FaceEvent" payloadBuilder:v33];
}

void __67__HMIAnalytics_sendEventForFaceEvent_homePersonManagerUUID_camera___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 sourceUUID];
  int v5 = [v4 isEqual:*(void *)(a1 + 32)];

  if (v5)
  {
    uint64_t v6 = [v3 familiarity];

    HMIFaceFamiliarityAsString(v6);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:");
  }
  else
  {
    id v7 = *(void **)(a1 + 48);
    id v8 = NSNumber;
    uint64_t v9 = [v3 familiarity];

    id v10 = [v8 numberWithInteger:v9];
    objc_msgSend(v7, "addObject:");
  }
}

BOOL __67__HMIAnalytics_sendEventForFaceEvent_homePersonManagerUUID_camera___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 integerValue];
  uint64_t v6 = [v4 integerValue];

  return v5 > v6;
}

id __67__HMIAnalytics_sendEventForFaceEvent_homePersonManagerUUID_camera___block_invoke_3(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (void)sendEventForClusteringTask:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "numberOfFaceprintsClustered"));
  [v5 setObject:v6 forKeyedSubscript:@"faceprintsClustered"];

  id v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "numberOfClusters"));
  [v5 setObject:v7 forKeyedSubscript:@"clusters"];

  id v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "numberOfPersonsCreated"));
  [v5 setObject:v8 forKeyedSubscript:@"personsCreated"];

  uint64_t v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "numberOfUnknownFaceprintsAssociated"));
  [v5 setObject:v9 forKeyedSubscript:@"faceprintsAssociated"];

  id v10 = NSNumber;
  [v4 faceprintingDuration];
  int v11 = objc_msgSend(v10, "numberWithDouble:");
  [v5 setObject:v11 forKeyedSubscript:@"faceprintingDuration"];

  id v12 = NSNumber;
  [v4 clusteringDuration];
  v13 = objc_msgSend(v12, "numberWithDouble:");
  [v5 setObject:v13 forKeyedSubscript:@"clusteringDuration"];

  int v14 = NSNumber;
  [v4 totalDuration];
  double v15 = objc_msgSend(v14, "numberWithDouble:");
  [v5 setObject:v15 forKeyedSubscript:@"totalDuration"];

  v16 = [v4 error];

  if (v16)
  {
    v17 = NSNumber;
    v18 = [v4 error];
    v19 = objc_msgSend(v17, "numberWithInteger:", objc_msgSend(v18, "code"));
    [v5 setObject:v19 forKeyedSubscript:@"errorCode"];

    v20 = [v4 error];
    v21 = [v20 description];
    [v5 setObject:v21 forKeyedSubscript:@"errorDescription"];
  }
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __43__HMIAnalytics_sendEventForClusteringTask___block_invoke;
  v23[3] = &unk_26477D910;
  id v24 = v5;
  id v22 = v5;
  [a1 sendEventWithName:@"com.apple.HomeAI.FaceClustering" payloadBuilder:v23];
}

id __43__HMIAnalytics_sendEventForClusteringTask___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (void)sendEventForPersonsModels:(id)a3
{
  v36[7] = *MEMORY[0x263EF8340];
  id v24 = a3;
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x2020000000;
  uint64_t v34 = 0;
  id v4 = [MEMORY[0x263EFF980] array];
  id v22 = a1;
  uint64_t v5 = [MEMORY[0x263EFF980] array];
  uint64_t v6 = [v24 modelSummaries];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __42__HMIAnalytics_sendEventForPersonsModels___block_invoke;
  v27[3] = &unk_26477D9A8;
  id v7 = v4;
  id v28 = v7;
  v30 = &v31;
  id v8 = v5;
  id v29 = v8;
  objc_msgSend(v6, "na_each:", v27);

  id v23 = objc_msgSend(NSNumber, "numberWithInteger:", +[HMIAnalytics bucketForValue:usingBuckets:](HMIAnalytics, "bucketForValue:usingBuckets:", objc_msgSend(v7, "count"), &unk_26D9A9780));
  uint64_t v9 = [v7 valueForKeyPath:@"@avg.self"];
  id v10 = objc_msgSend(NSNumber, "numberWithInteger:", +[HMIAnalytics bucketForValue:usingBuckets:](HMIAnalytics, "bucketForValue:usingBuckets:", objc_msgSend(v9, "integerValue"), &unk_26D9A9798));

  if (v32[3])
  {
    int v11 = NSNumber;
    unint64_t v12 = [v8 count];
    v13 = [v11 numberWithUnsignedInteger:v12 / v32[3]];
  }
  else
  {
    v13 = &unk_26D9A9330;
  }
  int v14 = objc_msgSend(NSNumber, "numberWithInteger:", +[HMIAnalytics bucketForValue:usingBuckets:](HMIAnalytics, "bucketForValue:usingBuckets:", objc_msgSend(v13, "integerValue"), &unk_26D9A97B0));

  double v15 = [v8 valueForKeyPath:@"@avg.self"];
  v16 = objc_msgSend(NSNumber, "numberWithInteger:", +[HMIAnalytics bucketForValue:usingBuckets:](HMIAnalytics, "bucketForValue:usingBuckets:", objc_msgSend(v15, "integerValue"), &unk_26D9A97C8));

  v17 = objc_msgSend(NSNumber, "numberWithInteger:", +[HMIAnalytics bucketForValue:usingBuckets:](HMIAnalytics, "bucketForValue:usingBuckets:", objc_msgSend(v24, "homeToExternalEquivalencies"), &unk_26D9A97E0));
  v18 = objc_msgSend(NSNumber, "numberWithInteger:", +[HMIAnalytics bucketForValue:usingBuckets:](HMIAnalytics, "bucketForValue:usingBuckets:", objc_msgSend(v24, "externalToExternalEquivalencies"), &unk_26D9A97F8));
  v35[0] = @"externalLibraries";
  v19 = [NSNumber numberWithUnsignedInteger:v32[3]];
  v36[0] = v19;
  v36[1] = v23;
  v35[1] = @"homeIdentities";
  v35[2] = @"averageExternalIdentities";
  v36[2] = v14;
  v36[3] = v10;
  v35[3] = @"averageHomeFaceCrops";
  void v35[4] = @"averageExternalFaceCrops";
  v36[4] = v16;
  v36[5] = v17;
  v35[5] = @"homeToExternal";
  v35[6] = @"externalToExternal";
  v36[6] = v18;
  v20 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:7];

  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __42__HMIAnalytics_sendEventForPersonsModels___block_invoke_138;
  v25[3] = &unk_26477D9D0;
  id v21 = v20;
  id v26 = v21;
  [v22 sendEventWithName:@"com.apple.HomeAI.PersonsModels" payloadBuilder:v25];

  _Block_object_dispose(&v31, 8);
}

void __42__HMIAnalytics_sendEventForPersonsModels___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isExternalLibrary])
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    id v4 = [v3 faceCountsByPerson];

    uint64_t v7 = MEMORY[0x263EF8330];
    uint64_t v8 = 3221225472;
    uint64_t v9 = __42__HMIAnalytics_sendEventForPersonsModels___block_invoke_3;
    id v10 = &unk_26477D980;
    uint64_t v5 = &v11;
    id v11 = *(id *)(a1 + 40);
    uint64_t v6 = &v7;
  }
  else
  {
    id v4 = [v3 faceCountsByPerson];

    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    int v14 = __42__HMIAnalytics_sendEventForPersonsModels___block_invoke_2;
    double v15 = &unk_26477D980;
    uint64_t v5 = &v16;
    id v16 = *(id *)(a1 + 32);
    uint64_t v6 = &v12;
  }
  objc_msgSend(v4, "na_each:", v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16);
}

uint64_t __42__HMIAnalytics_sendEventForPersonsModels___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

uint64_t __42__HMIAnalytics_sendEventForPersonsModels___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

id __42__HMIAnalytics_sendEventForPersonsModels___block_invoke_138(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (int64_t)bucketForValue:(int64_t)a3 usingBuckets:(id)a4
{
  id v5 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __44__HMIAnalytics_bucketForValue_usingBuckets___block_invoke;
  v12[3] = &__block_descriptor_40_e18_B16__0__NSNumber_8l;
  v12[4] = a3;
  uint64_t v6 = objc_msgSend(v5, "na_firstObjectPassingTest:", v12);
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [v5 lastObject];
  }
  uint64_t v9 = v8;

  int64_t v10 = [v9 integerValue];
  return v10;
}

BOOL __44__HMIAnalytics_bucketForValue_usingBuckets___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  return v2 <= [a2 integerValue];
}

+ (void)sendEventsForFragmentResult:(id)a3
{
  id v4 = a3;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  int v21 = 0;
  uint64_t v16 = 0;
  v17 = (int *)&v16;
  uint64_t v18 = 0x2020000000;
  int v19 = 0;
  id v5 = [v4 configuration];
  uint64_t v6 = [v5 activityZones];

  if ([v6 count])
  {
    uint64_t v7 = [v6 objectAtIndexedSubscript:0];
    int v8 = [v7 isInclusion];

    if (v8) {
      uint64_t v9 = @"inclusion";
    }
    else {
      uint64_t v9 = @"exclusion";
    }
  }
  else
  {
    uint64_t v9 = @"None";
  }
  int64_t v10 = [v4 frameResults];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __44__HMIAnalytics_sendEventsForFragmentResult___block_invoke;
  v15[3] = &unk_26477DA40;
  v15[4] = v20;
  v15[5] = &v16;
  objc_msgSend(v10, "na_each:", v15);

  if (v17[6] >= 1)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __44__HMIAnalytics_sendEventsForFragmentResult___block_invoke_3;
    v11[3] = &unk_26477DA68;
    int v14 = &v16;
    uint64_t v12 = v9;
    uint64_t v13 = v20;
    [a1 sendEventWithName:@"com.apple.HomeAI.MotionScore" payloadBuilder:v11];
  }
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);
}

void __44__HMIAnalytics_sendEventsForFragmentResult___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 events];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__HMIAnalytics_sendEventsForFragmentResult___block_invoke_2;
  v4[3] = &unk_26477DA18;
  long long v5 = *(_OWORD *)(a1 + 32);
  objc_msgSend(v3, "na_each:", v4);
}

void __44__HMIAnalytics_sendEventsForFragmentResult___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    [v5 motionScore];
    *(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4
                                                               + *(float *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
}

id __44__HMIAnalytics_sendEventsForFragmentResult___block_invoke_3(void *a1, double a2)
{
  v7[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = a1[4];
  *(float *)&a2 = *(float *)(*(void *)(a1[5] + 8) + 24) / (float)*(int *)(*(void *)(a1[6] + 8) + 24);
  v6[0] = @"zoneType";
  v6[1] = @"motionScore";
  v7[0] = v2;
  uint64_t v3 = [NSNumber numberWithFloat:a2];
  v7[1] = v3;
  float v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

+ (void)videoAnalyzerDidTerminateWithError:(id)a3 state:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __57__HMIAnalytics_videoAnalyzerDidTerminateWithError_state___block_invoke;
  v10[3] = &unk_26477DA90;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  [a1 sendEventWithName:@"com.apple.HomeAI.VideoAnalyzer.DidTerminate_v0" payloadBuilder:v10];
}

id __57__HMIAnalytics_videoAnalyzerDidTerminateWithError_state___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v3 = [*(id *)(a1 + 32) configuration];
  float v4 = [v3 camera];

  if (v4)
  {
    id v5 = +[HMIAnalytics payloadWithCamera:v4];
    [v2 addEntriesFromDictionary:v5];
  }
  if (*(void *)(a1 + 40)) {
    id v6 = @"Success";
  }
  else {
    id v6 = @"Fail";
  }
  [v2 setObject:v6 forKeyedSubscript:@"status"];
  id v7 = *(void **)(a1 + 40);
  if (v7)
  {
    id v8 = HMIErrorCodeName([v7 code]);
    [v2 setObject:v8 forKeyedSubscript:@"error"];

    id v9 = [*(id *)(a1 + 40) userInfo];
    int64_t v10 = [v9 objectForKeyedSubscript:*MEMORY[0x263F08608]];

    if (v10)
    {
      id v11 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", objc_msgSend(v10, "code"));
      [v2 setObject:v11 forKeyedSubscript:@"underlyingError"];
    }
  }
  id v12 = NSNumber;
  [*(id *)(a1 + 32) timeSinceAnalyzerStarted];
  uint64_t v13 = objc_msgSend(v12, "numberWithDouble:");
  [v2 setObject:v13 forKeyedSubscript:@"timeSinceAnalyzerStarted"];

  int v14 = NSNumber;
  [*(id *)(a1 + 32) averageAnalysisTime];
  double v15 = objc_msgSend(v14, "numberWithDouble:");
  [v2 setObject:v15 forKeyedSubscript:@"averageFrameAnalysisTime"];

  uint64_t v16 = NSNumber;
  [*(id *)(a1 + 32) delay];
  v17 = objc_msgSend(v16, "numberWithDouble:");
  [v2 setObject:v17 forKeyedSubscript:@"averageDelay"];

  return v2;
}

+ (void)videoAnalyzerDidCreateTimelapseFragment:(id)a3 state:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __62__HMIAnalytics_videoAnalyzerDidCreateTimelapseFragment_state___block_invoke;
  v10[3] = &unk_26477DA90;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  [a1 sendEventWithName:@"com.apple.HomeAI.VideoAnalyzer.DidCreateTimelapseFragment_v0" payloadBuilder:v10];
}

id __62__HMIAnalytics_videoAnalyzerDidCreateTimelapseFragment_state___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v3 = [*(id *)(a1 + 32) configuration];
  float v4 = [v3 camera];

  if (v4)
  {
    id v5 = +[HMIAnalytics payloadWithCamera:v4];
    [v2 addEntriesFromDictionary:v5];
  }
  id v6 = *(void **)(a1 + 40);
  if (v6) {
    [v6 duration];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  unint64_t Seconds = (unint64_t)CMTimeGetSeconds(&time);
  if (Seconds)
  {
    id v8 = [*(id *)(a1 + 40) separableSegment];
    unint64_t v9 = 8 * [v8 length] / Seconds;

    int64_t v10 = [NSNumber numberWithUnsignedInteger:v9];
    [v2 setObject:v10 forKeyedSubscript:@"bitrate"];
  }
  return v2;
}

+ (void)videoAnalyzerDidAnalyzeFragmentWithResult:(id)a3 state:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __64__HMIAnalytics_videoAnalyzerDidAnalyzeFragmentWithResult_state___block_invoke;
  v10[3] = &unk_26477DA90;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  [a1 sendEventWithName:@"com.apple.HomeAI.VideoAnalyzer.DidAnalyzeFragment_v5" payloadBuilder:v10];
}

id __64__HMIAnalytics_videoAnalyzerDidAnalyzeFragmentWithResult_state___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v3 = [*(id *)(a1 + 32) configuration];
  float v4 = [v3 camera];

  if (v4)
  {
    id v5 = +[HMIAnalytics payloadWithCamera:v4];
    [v2 addEntriesFromDictionary:v5];
  }
  id v6 = NSNumber;
  id v7 = [*(id *)(a1 + 32) dynamicConfiguration];
  id v8 = objc_msgSend(v6, "numberWithBool:", objc_msgSend(v7, "recognizeFaces"));
  [v2 setObject:v8 forKeyedSubscript:@"recognizeFaces"];

  id v9 = [*(id *)(a1 + 32) dynamicConfiguration];
  uint64_t v10 = [v9 eventTriggers];

  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __64__HMIAnalytics_videoAnalyzerDidAnalyzeFragmentWithResult_state___block_invoke_2;
  v35[3] = &unk_26477DAB8;
  id v11 = v2;
  id v36 = v11;
  uint64_t v38 = v10;
  id v37 = *(id *)(a1 + 40);
  id v12 = (void (**)(void, void, void, void))MEMORY[0x22A641EE0](v35);
  uint64_t v13 = objc_opt_class();
  ((void (**)(void, __CFString *, uint64_t, uint64_t))v12)[2](v12, @"motion", 1, v13);
  uint64_t v14 = objc_opt_class();
  ((void (**)(void, __CFString *, uint64_t, uint64_t))v12)[2](v12, @"pet", 4, v14);
  uint64_t v15 = objc_opt_class();
  ((void (**)(void, __CFString *, uint64_t, uint64_t))v12)[2](v12, @"person", 2, v15);
  uint64_t v16 = objc_opt_class();
  ((void (**)(void, __CFString *, uint64_t, uint64_t))v12)[2](v12, @"vehicle", 8, v16);
  uint64_t v17 = objc_opt_class();
  ((void (**)(void, __CFString *, uint64_t, uint64_t))v12)[2](v12, @"package", 16, v17);
  uint64_t v18 = NSNumber;
  int v19 = [*(id *)(a1 + 32) configuration];
  v20 = objc_msgSend(v18, "numberWithBool:", objc_msgSend(v19, "transcode"));
  [v11 setObject:v20 forKeyedSubscript:@"transcode"];

  int v21 = NSNumber;
  [*(id *)(a1 + 32) analysisFPS];
  id v22 = objc_msgSend(v21, "numberWithDouble:");
  [v11 setObject:v22 forKeyedSubscript:@"analysisQuality"];

  id v23 = NSNumber;
  id v24 = [*(id *)(a1 + 40) fragment];
  v25 = objc_msgSend(v23, "numberWithInteger:", +[HMIAnalytics bucketForValue:usingBuckets:](HMIAnalytics, "bucketForValue:usingBuckets:", objc_msgSend(v24, "sequenceNumber"), &unk_26D9A9810));
  [v11 setObject:v25 forKeyedSubscript:@"sequenceNumber"];

  id v26 = NSNumber;
  v27 = [*(id *)(a1 + 40) outcome];
  id v28 = objc_msgSend(v26, "numberWithUnsignedInteger:", objc_msgSend(v27, "code"));
  [v11 setObject:v28 forKeyedSubscript:@"outcomeCode"];

  id v29 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "activeAnalyzersCount"));
  [v11 setObject:v29 forKeyedSubscript:@"activeAnalyzersCount"];

  v30 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "systemResourceUsageLevel"));
  [v11 setObject:v30 forKeyedSubscript:@"systemResourceUsageLevel"];

  uint64_t v31 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "thermalLevel"));
  [v11 setObject:v31 forKeyedSubscript:@"thermalLevel"];

  id v32 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isThermalAndSystemResourceUsageLevelIgnored"));
  [v11 setObject:v32 forKeyedSubscript:@"thermalAndSystemResourceUsageLevelIgnored"];

  id v33 = v11;
  return v33;
}

void __64__HMIAnalytics_videoAnalyzerDidAnalyzeFragmentWithResult_state___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  if ((*(void *)(a1 + 48) & a3) != 0) {
    id v6 = &unk_26D9A93D8;
  }
  else {
    id v6 = &unk_26D9A9330;
  }
  id v7 = *(void **)(a1 + 32);
  id v8 = NSString;
  id v9 = a2;
  uint64_t v10 = [v8 stringWithFormat:@"%@Trigger", v9];
  [v7 setObject:v6 forKeyedSubscript:v10];

  id v11 = NSNumber;
  id v15 = [*(id *)(a1 + 40) maxConfidenceEventForEventClass:a4];
  id v12 = [v11 numberWithInt:v15 != 0];
  uint64_t v13 = *(void **)(a1 + 32);
  uint64_t v14 = [NSString stringWithFormat:@"%@Found", v9];

  [v13 setObject:v12 forKeyedSubscript:v14];
}

+ (void)videoPackageAnalyzerDidClassifyCandidateAsPackage:(BOOL)a3 camera:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __73__HMIAnalytics_videoPackageAnalyzerDidClassifyCandidateAsPackage_camera___block_invoke;
  v8[3] = &unk_26477DAE0;
  id v9 = v6;
  BOOL v10 = a3;
  id v7 = v6;
  [a1 sendEventWithName:@"com.apple.HomeAI.VideoPackageAnalyzer.DidClassify_v0" payloadBuilder:v8];
}

id __73__HMIAnalytics_videoPackageAnalyzerDidClassifyCandidateAsPackage_camera___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(void *)(a1 + 32))
  {
    uint64_t v3 = +[HMIAnalytics payloadWithCamera:](HMIAnalytics, "payloadWithCamera:");
    [v2 addEntriesFromDictionary:v3];
  }
  float v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  [v2 setObject:v4 forKeyedSubscript:@"package"];

  return v2;
}

+ (void)videoPackageAnalyzerDidResetReferenceImageWithInterval:(double)a3 camera:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __78__HMIAnalytics_videoPackageAnalyzerDidResetReferenceImageWithInterval_camera___block_invoke;
  v8[3] = &unk_26477DB08;
  id v9 = v6;
  double v10 = a3;
  id v7 = v6;
  [a1 sendEventWithName:@"com.apple.HomeAI.VideoPackageAnalyzer.DidReset_v0" payloadBuilder:v8];
}

id __78__HMIAnalytics_videoPackageAnalyzerDidResetReferenceImageWithInterval_camera___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(void *)(a1 + 32))
  {
    uint64_t v3 = +[HMIAnalytics payloadWithCamera:](HMIAnalytics, "payloadWithCamera:");
    [v2 addEntriesFromDictionary:v3];
  }
  float v4 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  [v2 setObject:v4 forKeyedSubscript:@"interval"];

  return v2;
}

@end