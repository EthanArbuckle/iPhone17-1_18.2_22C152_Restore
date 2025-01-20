@interface HKRaceRouteCluster(HDCodingSupport)
+ (id)createWithCodable:()HDCodingSupport;
@end

@implementation HKRaceRouteCluster(HDCodingSupport)

+ (id)createWithCodable:()HDCodingSupport
{
  id v3 = a3;
  v4 = [v3 lastWorkoutMetrics];
  v5 = [v3 bestWorkoutMetrics];
  v6 = [v4 routePoints];
  v7 = [v6 firstObject];

  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F1E5F0]);
    [v7 latitude];
    double v10 = v9;
    [v7 longitude];
    v47 = (void *)[v8 initWithLatitude:v10 longitude:v11];
  }
  else
  {
    v47 = 0;
  }
  id v12 = objc_alloc(MEMORY[0x1E4F2B3E0]);
  v13 = (void *)MEMORY[0x1E4F29128];
  v46 = [v3 uuid];
  v44 = objc_msgSend(v13, "hk_UUIDWithData:", v46);
  v14 = (void *)MEMORY[0x1E4F29128];
  v45 = [v3 workoutClusterUUID];
  v15 = objc_msgSend(v14, "hk_UUIDWithData:", v45);
  id v41 = (id)(int)[v3 clusterSize];
  [v3 relevance];
  double v17 = v16;
  uint64_t v40 = (int)[v3 activityType];
  v18 = (void *)MEMORY[0x1E4F29128];
  v43 = [v4 workoutUUID];
  v39 = objc_msgSend(v18, "hk_UUIDWithData:", v43);
  v19 = (void *)MEMORY[0x1E4F1C9C8];
  [v4 startDate];
  v36 = objc_msgSend(v19, "dateWithTimeIntervalSinceReferenceDate:");
  [v4 distance];
  double v21 = v20;
  [v4 duration];
  double v23 = v22;
  v24 = (void *)MEMORY[0x1E4F29128];
  v37 = [v3 bestWorkoutMetrics];
  v35 = [v37 workoutUUID];
  v25 = objc_msgSend(v24, "hk_UUIDWithData:", v35);
  v26 = (void *)MEMORY[0x1E4F1C9C8];
  [v5 startDate];
  v27 = objc_msgSend(v26, "dateWithTimeIntervalSinceReferenceDate:");
  [v5 distance];
  double v29 = v28;
  [v5 duration];
  double v31 = v30;
  [v3 routeSnapshot];
  v32 = v38 = v5;
  v33 = [v3 routeLabel];
  id v42 = (id)objc_msgSend(v12, "_initWithUUID:workoutClusterUUID:clusterSize:relevanceValue:workoutActivityType:lastWorkoutUUID:lastWorkoutDate:lastWorkoutDistance:lastWorkoutDuration:lastWorkoutStartingPoint:bestWorkoutUUID:bestWorkoutDate:bestWorkoutDistance:bestWorkoutDuration:workoutRouteSnapshot:workoutRouteLabel:", v44, v15, v41, v40, v39, v36, v17, v21, v23, v29, v31, v47, v25, v27, v32,
              v33);

  return v42;
}

@end