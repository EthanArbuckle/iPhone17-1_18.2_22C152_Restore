@interface HDWorkoutClusterServer
+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7;
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (id)exportedInterface;
- (id)remoteInterface;
- (uint64_t)_processLocation:(void *)a3 forCoordinateSeries:(unint64_t)a4 limit:(unint64_t *)a5 locationsSeen:(id *)a6 lastSentTimestamp:;
- (unint64_t)maxRouteCoordinateBatchSize;
- (unint64_t)maxWorkoutBatchSize;
- (void)remote_createWorkoutCluster:(id)a3 completion:(id)a4;
- (void)remote_deleteWorkoutClusterWithUUID:(id)a3 completion:(id)a4;
- (void)remote_fetchRouteCoordinatesForWorkoutUUID:(id)a3 dateInterval:(id)a4 limit:(unint64_t)a5 completion:(id)a6;
- (void)remote_fetchRouteCoordinatesForWorkoutUUID:(id)a3 startDate:(id)a4 limit:(unint64_t)a5 completion:(id)a6;
- (void)remote_fetchWorkoutClusterContainingWorkoutUUID:(id)a3 completion:(id)a4;
- (void)remote_fetchWorkoutClustersContainingWorkoutUUIDs:(id)a3 completion:(id)a4;
- (void)remote_fetchWorkoutClustersWithCompletion:(id)a3;
- (void)remote_fetchWorkoutCountWithFilter:(id)a3 completion:(id)a4;
- (void)remote_fetchWorkoutRouteSnapshotForClusterUUID:(id)a3 completion:(id)a4;
- (void)remote_fetchWorkoutUUIDsForClusterUUID:(id)a3 completion:(id)a4;
- (void)remote_fetchWorkoutsWithFilter:(id)a3 anchor:(id)a4 limit:(unint64_t)a5 completion:(id)a6;
- (void)remote_fetchWorkoutsWithFilter:(id)a3 limit:(unint64_t)a4 sortDescriptors:(id)a5 completion:(id)a6;
- (void)remote_generateRaceRouteClustersWithLimit:(unint64_t)a3 completion:(id)a4;
- (void)remote_updateWorkoutClusterWithUUID:(id)a3 newRelevance:(id)a4 newLastWorkoutUUID:(id)a5 newBestWorkoutUUID:(id)a6 newWorkoutAssociations:(id)a7 workoutAssociationsToRemove:(id)a8 completion:(id)a9;
- (void)remote_updateWorkoutRouteLabel:(id)a3 forClusterUUID:(id)a4 completion:(id)a5;
- (void)remote_updateWorkoutRouteSnapshot:(id)a3 forClusterUUID:(id)a4 completion:(id)a5;
- (void)setMaxRouteCoordinateBatchSize:(unint64_t)a3;
- (void)setMaxWorkoutBatchSize:(unint64_t)a3;
@end

@implementation HDWorkoutClusterServer

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = [v13 profile];
  v16 = [v15 profileExtensionWithIdentifier:@"com.apple.health.RacePreviousRoute"];

  v17 = [v16 raceRouteClusterManager];
  v18 = [HDWorkoutClusterManager alloc];
  v19 = [v13 profile];
  v20 = [(HDWorkoutClusterManager *)v18 initWithProfile:v19];

  if (v17) {
    BOOL v21 = v20 == 0;
  }
  else {
    BOOL v21 = 1;
  }
  if (v21)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_featureUnavailableForProfileError");
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      if (a7) {
        *a7 = v22;
      }
      else {
        _HKLogDroppedError();
      }
    }

    v23 = 0;
  }
  else
  {
    v23 = [(HDStandardTaskServer *)[HDWorkoutClusterServer alloc] initWithUUID:v11 configuration:v12 client:v13 delegate:v14];
    objc_storeStrong((id *)&v23->_raceRouteClusterManager, v17);
    objc_storeStrong((id *)&v23->_workoutClusterManager, v20);
    [(HDWorkoutClusterManager *)v23->_workoutClusterManager takeAccessibilityAssertionIfNeeded];
    v23->_maxWorkoutBatchSize = 400;
    v23->_maxRouteCoordinateBatchSize = 7200;
  }

  return v23;
}

- (void)remote_fetchWorkoutCountWithFilter:(id)a3 completion:(id)a4
{
  workoutClusterManager = self->_workoutClusterManager;
  id v9 = 0;
  v6 = (void (**)(id, void *, id))a4;
  v7 = [(HDWorkoutClusterManager *)workoutClusterManager workoutCountWithFilter:a3 error:&v9];
  id v8 = v9;
  v6[2](v6, v7, v8);
}

- (void)remote_fetchWorkoutsWithFilter:(id)a3 anchor:(id)a4 limit:(unint64_t)a5 completion:(id)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v10 = (void (**)(id, void *, id, id))a6;
  unint64_t maxWorkoutBatchSize = self->_maxWorkoutBatchSize;
  if (a5 >= maxWorkoutBatchSize) {
    unint64_t v12 = self->_maxWorkoutBatchSize;
  }
  else {
    unint64_t v12 = a5;
  }
  if (a5) {
    unint64_t maxWorkoutBatchSize = v12;
  }
  workoutClusterManager = self->_workoutClusterManager;
  if (self) {
    unint64_t v14 = maxWorkoutBatchSize;
  }
  else {
    unint64_t v14 = 0;
  }
  id v23 = 0;
  id v24 = 0;
  v15 = [(HDWorkoutClusterManager *)workoutClusterManager workoutsWithFilter:a3 anchor:a4 limit:v14 newAnchor:&v24 error:&v23];
  id v16 = v24;
  id v17 = v23;
  _HKInitializeLogging();
  v18 = (void *)*MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEBUG))
  {
    v19 = v18;
    uint64_t v20 = [v15 count];
    BOOL v21 = HKStringFromBool();
    id v22 = [v17 localizedDescription];
    *(_DWORD *)buf = 134218754;
    uint64_t v26 = v20;
    __int16 v27 = 2114;
    v28 = v21;
    __int16 v29 = 2112;
    id v30 = v16;
    __int16 v31 = 2114;
    v32 = v22;
    _os_log_debug_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_DEBUG, "Fetched %lu workouts with success=%{public}@, newAnchor=%@, error=%{public}@", buf, 0x2Au);
  }
  v10[2](v10, v15, v16, v17);
}

- (void)remote_fetchWorkoutsWithFilter:(id)a3 limit:(unint64_t)a4 sortDescriptors:(id)a5 completion:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v10 = (void (**)(id, void *, id))a6;
  unint64_t maxWorkoutBatchSize = self->_maxWorkoutBatchSize;
  if (a4 >= maxWorkoutBatchSize) {
    unint64_t v12 = self->_maxWorkoutBatchSize;
  }
  else {
    unint64_t v12 = a4;
  }
  if (a4) {
    unint64_t maxWorkoutBatchSize = v12;
  }
  if (self) {
    unint64_t v13 = maxWorkoutBatchSize;
  }
  else {
    unint64_t v13 = 0;
  }
  workoutClusterManager = self->_workoutClusterManager;
  id v22 = 0;
  v15 = [(HDWorkoutClusterManager *)workoutClusterManager workoutsWithFilter:a3 limit:v13 sortDescriptors:a5 error:&v22];
  id v16 = v22;
  _HKInitializeLogging();
  id v17 = (void *)*MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEBUG))
  {
    v18 = v17;
    uint64_t v19 = [v15 count];
    uint64_t v20 = HKStringFromBool();
    BOOL v21 = [v16 localizedDescription];
    *(_DWORD *)buf = 134218498;
    uint64_t v24 = v19;
    __int16 v25 = 2114;
    uint64_t v26 = v20;
    __int16 v27 = 2114;
    v28 = v21;
    _os_log_debug_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_DEBUG, "Fetched %lu workouts with success=%{public}@, error=%{public}@", buf, 0x20u);
  }
  v10[2](v10, v15, v16);
}

- (void)remote_fetchRouteCoordinatesForWorkoutUUID:(id)a3 startDate:(id)a4 limit:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  unint64_t v12 = (void (**)(id, void, id))a6;
  unint64_t maxRouteCoordinateBatchSize = self->_maxRouteCoordinateBatchSize;
  if (a5 >= maxRouteCoordinateBatchSize) {
    unint64_t v14 = self->_maxRouteCoordinateBatchSize;
  }
  else {
    unint64_t v14 = a5;
  }
  if (a5) {
    unint64_t maxRouteCoordinateBatchSize = v14;
  }
  if (self) {
    unint64_t v15 = maxRouteCoordinateBatchSize;
  }
  else {
    unint64_t v15 = 0;
  }
  id v16 = objc_alloc_init(MEMORY[0x1E4F2ADA0]);
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  v30[3] = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__54;
  workoutClusterManager = self->_workoutClusterManager;
  v28[4] = __Block_byref_object_dispose__54;
  id v29 = 0;
  id v27 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __96__HDWorkoutClusterServer_remote_fetchRouteCoordinatesForWorkoutUUID_startDate_limit_completion___block_invoke;
  v22[3] = &unk_1E62FAC08;
  v22[4] = self;
  id v18 = v16;
  id v23 = v18;
  uint64_t v24 = v30;
  __int16 v25 = v28;
  unint64_t v26 = v15;
  BOOL v19 = [(HDWorkoutClusterManager *)workoutClusterManager enumerateRouteLocationsForWorkoutUUID:v10 startDate:v11 limit:v15 + 1 error:&v27 handler:v22];
  id v20 = v27;
  if (v19) {
    id v21 = v18;
  }
  else {
    id v21 = 0;
  }
  ((void (**)(id, id, id))v12)[2](v12, v21, v20);

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(v30, 8);
}

uint64_t __96__HDWorkoutClusterServer_remote_fetchRouteCoordinatesForWorkoutUUID_startDate_limit_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  v2 = (void *)a1[5];
  unint64_t v4 = a1[8];
  v5 = (unint64_t *)(*(void *)(a1[6] + 8) + 24);
  uint64_t v6 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v6 + 40);
  uint64_t v7 = -[HDWorkoutClusterServer _processLocation:forCoordinateSeries:limit:locationsSeen:lastSentTimestamp:](v3, a2, v2, v4, v5, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  return v7;
}

- (uint64_t)_processLocation:(void *)a3 forCoordinateSeries:(unint64_t)a4 limit:(unint64_t *)a5 locationsSeen:(id *)a6 lastSentTimestamp:
{
  id v11 = a2;
  id v12 = a3;
  if (a1)
  {
    unint64_t v13 = *a5 + 1;
    *a5 = v13;
    if (v13 <= a4)
    {
      id v15 = objc_alloc_init(MEMORY[0x1E4F2AD98]);
      [v11 coordinate];
      objc_msgSend(v15, "setLatitude:");
      [v11 coordinate];
      [v15 setLongitude:v16];
      [v12 addCoordinates:v15];
      *a6 = [v11 timestamp];

      uint64_t v14 = 1;
      goto LABEL_6;
    }
    [*a6 timeIntervalSinceReferenceDate];
    objc_msgSend(v12, "setResumeDate:");
  }
  uint64_t v14 = 0;
LABEL_6:

  return v14;
}

- (void)remote_fetchRouteCoordinatesForWorkoutUUID:(id)a3 dateInterval:(id)a4 limit:(unint64_t)a5 completion:(id)a6
{
  id v22 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void, id))a6;
  unint64_t maxRouteCoordinateBatchSize = self->_maxRouteCoordinateBatchSize;
  id v13 = objc_alloc_init(MEMORY[0x1E4F2ADA0]);
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v33[3] = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__54;
  v31[4] = __Block_byref_object_dispose__54;
  id v32 = 0;
  workoutClusterManager = self->_workoutClusterManager;
  id v15 = [v10 startDate];
  if (a5 >= maxRouteCoordinateBatchSize) {
    unint64_t v16 = maxRouteCoordinateBatchSize;
  }
  else {
    unint64_t v16 = a5;
  }
  if (a5) {
    unint64_t maxRouteCoordinateBatchSize = v16;
  }
  id v30 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __99__HDWorkoutClusterServer_remote_fetchRouteCoordinatesForWorkoutUUID_dateInterval_limit_completion___block_invoke;
  v23[3] = &unk_1E62FAC30;
  id v17 = v10;
  id v24 = v17;
  __int16 v25 = self;
  id v18 = v13;
  id v26 = v18;
  id v27 = v33;
  v28 = v31;
  unint64_t v29 = maxRouteCoordinateBatchSize;
  BOOL v19 = [(HDWorkoutClusterManager *)workoutClusterManager enumerateRouteLocationsForWorkoutUUID:v22 startDate:v15 limit:maxRouteCoordinateBatchSize + 1 error:&v30 handler:v23];
  id v20 = v30;

  if (v19) {
    id v21 = v18;
  }
  else {
    id v21 = 0;
  }
  ((void (**)(id, id, id))v11)[2](v11, v21, v20);

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v33, 8);
}

uint64_t __99__HDWorkoutClusterServer_remote_fetchRouteCoordinatesForWorkoutUUID_dateInterval_limit_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) endDate];
  if (!v4) {
    goto LABEL_4;
  }
  v5 = (void *)v4;
  uint64_t v6 = [v3 timestamp];
  uint64_t v7 = [*(id *)(a1 + 32) endDate];
  char v8 = objc_msgSend(v6, "hk_isAfterDate:", v7);

  if (v8)
  {
    uint64_t v9 = 0;
  }
  else
  {
LABEL_4:
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = *(void **)(a1 + 48);
    unint64_t v12 = *(void *)(a1 + 72);
    id v13 = (unint64_t *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
    id obj = *(id *)(v14 + 40);
    uint64_t v9 = -[HDWorkoutClusterServer _processLocation:forCoordinateSeries:limit:locationsSeen:lastSentTimestamp:](v10, v3, v11, v12, v13, &obj);
    objc_storeStrong((id *)(v14 + 40), obj);
  }

  return v9;
}

- (void)remote_createWorkoutCluster:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  workoutClusterManager = self->_workoutClusterManager;
  id v16 = 0;
  char v8 = (void (**)(id, uint64_t, id))a4;
  uint64_t v9 = [(HDWorkoutClusterManager *)workoutClusterManager createWorkoutCluster:v6 error:&v16];
  id v10 = v16;
  _HKInitializeLogging();
  id v11 = (void *)*MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v12 = v11;
    id v13 = [v6 clusterUUID];
    uint64_t v14 = HKStringFromBool();
    id v15 = [v10 localizedDescription];
    *(_DWORD *)buf = 138543874;
    id v18 = v13;
    __int16 v19 = 2114;
    id v20 = v14;
    __int16 v21 = 2114;
    id v22 = v15;
    _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_DEFAULT, "Created workout cluster (%{public}@) with success=%{public}@, error=%{public}@", buf, 0x20u);
  }
  v8[2](v8, v9, v10);
}

- (void)remote_fetchWorkoutClustersWithCompletion:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  workoutClusterManager = self->_workoutClusterManager;
  id v12 = 0;
  uint64_t v4 = (void (**)(id, void *, id))a3;
  v5 = [(HDWorkoutClusterManager *)workoutClusterManager allWorkoutClustersWithError:&v12];
  id v6 = v12;
  _HKInitializeLogging();
  uint64_t v7 = (void *)*MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    char v8 = v7;
    uint64_t v9 = [v5 count];
    id v10 = HKStringFromBool();
    id v11 = [v6 localizedDescription];
    *(_DWORD *)buf = 134218498;
    uint64_t v14 = v9;
    __int16 v15 = 2114;
    id v16 = v10;
    __int16 v17 = 2114;
    id v18 = v11;
    _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "Fetched all workout clusters (count %lu) with success=%{public}@, error=%{public}@", buf, 0x20u);
  }
  v4[2](v4, v5, v6);
}

- (void)remote_fetchWorkoutClusterContainingWorkoutUUID:(id)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  workoutClusterManager = self->_workoutClusterManager;
  id v16 = 0;
  char v8 = (void (**)(id, void *, id))a4;
  uint64_t v9 = [(HDWorkoutClusterManager *)workoutClusterManager workoutClusterContainingWorkoutUUID:v6 error:&v16];
  id v10 = v16;
  _HKInitializeLogging();
  id v11 = (void *)*MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v11;
    id v13 = [v9 clusterUUID];
    uint64_t v14 = HKStringFromBool();
    __int16 v15 = [v10 localizedDescription];
    *(_DWORD *)buf = 138544130;
    id v18 = v13;
    __int16 v19 = 2114;
    id v20 = v6;
    __int16 v21 = 2114;
    id v22 = v14;
    __int16 v23 = 2114;
    id v24 = v15;
    _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_DEFAULT, "Fetched cluster (%{public}@) for workout UUID %{public}@ with success=%{public}@, error=%{public}@", buf, 0x2Au);
  }
  v8[2](v8, v9, v10);
}

- (void)remote_fetchWorkoutClustersContainingWorkoutUUIDs:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  workoutClusterManager = self->_workoutClusterManager;
  id v17 = 0;
  char v8 = (void (**)(id, void *, id))a4;
  uint64_t v9 = [(HDWorkoutClusterManager *)workoutClusterManager workoutClustersContainingWorkoutUUIDs:v6 error:&v17];
  id v10 = v17;
  _HKInitializeLogging();
  id v11 = (void *)*MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v11;
    uint64_t v13 = [v9 count];
    uint64_t v14 = [v6 count];
    __int16 v15 = HKStringFromBool();
    id v16 = [v10 localizedDescription];
    *(_DWORD *)buf = 134218754;
    uint64_t v19 = v13;
    __int16 v20 = 2048;
    uint64_t v21 = v14;
    __int16 v22 = 2114;
    __int16 v23 = v15;
    __int16 v24 = 2114;
    uint64_t v25 = v16;
    _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_DEFAULT, "Fetched clusters (count %lu) for workouts (count %lu) with success=%{public}@, error=%{public}@", buf, 0x2Au);
  }
  v8[2](v8, v9, v10);
}

- (void)remote_fetchWorkoutUUIDsForClusterUUID:(id)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  workoutClusterManager = self->_workoutClusterManager;
  id v16 = 0;
  char v8 = (void (**)(id, void *, id))a4;
  uint64_t v9 = [(HDWorkoutClusterManager *)workoutClusterManager allWorkoutUUIDsForClusterUUID:v6 error:&v16];
  id v10 = v16;
  _HKInitializeLogging();
  id v11 = (void *)*MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v11;
    uint64_t v13 = [v9 count];
    uint64_t v14 = HKStringFromBool();
    __int16 v15 = [v10 localizedDescription];
    *(_DWORD *)buf = 138544130;
    id v18 = v6;
    __int16 v19 = 2048;
    uint64_t v20 = v13;
    __int16 v21 = 2114;
    __int16 v22 = v14;
    __int16 v23 = 2114;
    __int16 v24 = v15;
    _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_DEFAULT, "Fetched workout UUIDs (cluster=%{public}@, count %lu) with success=%{public}@, error=%{public}@", buf, 0x2Au);
  }
  v8[2](v8, v9, v10);
}

- (void)remote_fetchWorkoutRouteSnapshotForClusterUUID:(id)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  workoutClusterManager = self->_workoutClusterManager;
  id v16 = 0;
  char v8 = (void (**)(id, void *, id))a4;
  uint64_t v9 = [(HDWorkoutClusterManager *)workoutClusterManager workoutRouteSnapshotForClusterUUID:v6 error:&v16];
  id v10 = v16;
  _HKInitializeLogging();
  id v11 = (void *)*MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v11;
    double v13 = (double)(unint64_t)[v9 length] * 0.0009765625;
    uint64_t v14 = HKStringFromBool();
    __int16 v15 = [v10 localizedDescription];
    *(_DWORD *)buf = 138544130;
    id v18 = v6;
    __int16 v19 = 2048;
    double v20 = v13;
    __int16 v21 = 2114;
    __int16 v22 = v14;
    __int16 v23 = 2114;
    __int16 v24 = v15;
    _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_DEFAULT, "Fetched route snapshot (cluster=%{public}@, %0.1lf kB) with success=%{public}@, error=%{public}@", buf, 0x2Au);
  }
  v8[2](v8, v9, v10);
}

- (void)remote_updateWorkoutRouteSnapshot:(id)a3 forClusterUUID:(id)a4 completion:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  workoutClusterManager = self->_workoutClusterManager;
  id v19 = 0;
  id v11 = (void (**)(id, uint64_t, id))a5;
  uint64_t v12 = [(HDWorkoutClusterManager *)workoutClusterManager updateWorkoutClusterWithUUID:v9 newRouteSnapshot:v8 error:&v19];
  id v13 = v19;
  _HKInitializeLogging();
  uint64_t v14 = (void *)*MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    __int16 v15 = v14;
    double v16 = (double)(unint64_t)[v8 length] * 0.0009765625;
    id v17 = HKStringFromBool();
    id v18 = [v13 localizedDescription];
    *(_DWORD *)buf = 138544130;
    id v21 = v9;
    __int16 v22 = 2048;
    double v23 = v16;
    __int16 v24 = 2114;
    uint64_t v25 = v17;
    __int16 v26 = 2114;
    id v27 = v18;
    _os_log_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_DEFAULT, "Updated route snapshot (cluster=%{public}@, %0.1lf kB) with success=%{public}@, error=%{public}@", buf, 0x2Au);
  }
  v11[2](v11, v12, v13);
}

- (void)remote_updateWorkoutRouteLabel:(id)a3 forClusterUUID:(id)a4 completion:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  workoutClusterManager = self->_workoutClusterManager;
  id v17 = 0;
  id v10 = (void (**)(id, uint64_t, id))a5;
  uint64_t v11 = [(HDWorkoutClusterManager *)workoutClusterManager updateWorkoutClusterWithUUID:v8 newRouteLabel:a3 error:&v17];
  id v12 = v17;
  _HKInitializeLogging();
  id v13 = (void *)*MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = v13;
    __int16 v15 = HKStringFromBool();
    double v16 = [v12 localizedDescription];
    *(_DWORD *)buf = 138543874;
    id v19 = v8;
    __int16 v20 = 2114;
    id v21 = v15;
    __int16 v22 = 2114;
    double v23 = v16;
    _os_log_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_DEFAULT, "Updated route label (cluster=%{public}@) with success=%{public}@, error=%{public}@", buf, 0x20u);
  }
  v10[2](v10, v11, v12);
}

- (void)remote_updateWorkoutClusterWithUUID:(id)a3 newRelevance:(id)a4 newLastWorkoutUUID:(id)a5 newBestWorkoutUUID:(id)a6 newWorkoutAssociations:(id)a7 workoutAssociationsToRemove:(id)a8 completion:(id)a9
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  workoutClusterManager = self->_workoutClusterManager;
  id v24 = 0;
  id v17 = (void (**)(id, uint64_t, id))a9;
  uint64_t v18 = [(HDWorkoutClusterManager *)workoutClusterManager updateWorkoutClusterWithUUID:v15 newRelevance:a4 newLastWorkoutUUID:a5 newBestWorkoutUUID:a6 newWorkoutAssociations:a7 workoutAssociationsToRemove:a8 error:&v24];
  id v19 = v24;
  _HKInitializeLogging();
  __int16 v20 = (void *)*MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    id v21 = v20;
    __int16 v22 = HKStringFromBool();
    double v23 = [v19 localizedDescription];
    *(_DWORD *)buf = 138543874;
    id v26 = v15;
    __int16 v27 = 2114;
    uint64_t v28 = v22;
    __int16 v29 = 2114;
    id v30 = v23;
    _os_log_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_DEFAULT, "Updated workout cluster (%{public}@) with success=%{public}@, error=%{public}@", buf, 0x20u);
  }
  v17[2](v17, v18, v19);
}

- (void)remote_deleteWorkoutClusterWithUUID:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  workoutClusterManager = self->_workoutClusterManager;
  id v15 = 0;
  id v8 = (void (**)(id, uint64_t, id))a4;
  uint64_t v9 = [(HDWorkoutClusterManager *)workoutClusterManager deleteWorkoutClusterWithUUID:v6 error:&v15];
  id v10 = v15;
  _HKInitializeLogging();
  uint64_t v11 = (void *)*MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v11;
    id v13 = HKStringFromBool();
    uint64_t v14 = [v10 localizedDescription];
    *(_DWORD *)buf = 138543874;
    id v17 = v6;
    __int16 v18 = 2114;
    id v19 = v13;
    __int16 v20 = 2114;
    id v21 = v14;
    _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_DEFAULT, "Deleted workout cluster (%{public}@) with success=%{public}@, error=%{public}@", buf, 0x20u);
  }
  v8[2](v8, v9, v10);
}

- (void)remote_generateRaceRouteClustersWithLimit:(unint64_t)a3 completion:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, uint64_t, id))a4;
  double Current = CFAbsoluteTimeGetCurrent();
  workoutClusterManager = self->_workoutClusterManager;
  v19[5] = a3;
  id v20 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __79__HDWorkoutClusterServer_remote_generateRaceRouteClustersWithLimit_completion___block_invoke;
  v19[3] = &unk_1E62FAC58;
  v19[4] = self;
  uint64_t v9 = [(HDWorkoutClusterManager *)workoutClusterManager performUsingAccessibilityAssertionWithError:&v20 block:v19];
  id v10 = v20;
  double v11 = CFAbsoluteTimeGetCurrent();
  _HKInitializeLogging();
  id v12 = (void *)*MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    id v13 = v12;
    uint64_t v14 = HKStringFromBool();
    id v15 = [v10 localizedDescription];
    *(_DWORD *)buf = 134218754;
    double v22 = v11 - Current;
    __int16 v23 = 2048;
    unint64_t v24 = a3;
    __int16 v25 = 2114;
    id v26 = v14;
    __int16 v27 = 2114;
    uint64_t v28 = v15;
    _os_log_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_DEFAULT, "Generated Race Route clusters (%0.3lfs, limit %lu) with success=%{public}@, error=%{public}@", buf, 0x2Au);
  }
  if (v9)
  {
    double v16 = [(HDWorkoutClusterManager *)self->_workoutClusterManager profile];
    id v17 = [v16 nanoSyncManager];

    __int16 v18 = [(HDWorkoutClusterManager *)self->_workoutClusterManager accessibilityAssertion];
    [v17 syncHealthDataWithOptions:1 reason:@"Race Route clusters generated" accessibilityAssertion:v18 completion:&__block_literal_global_58];
  }
  v6[2](v6, v9, v10);
}

uint64_t __79__HDWorkoutClusterServer_remote_generateRaceRouteClustersWithLimit_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) generateRaceRouteClustersWithLimit:*(void *)(a1 + 40) error:a2];
}

void __79__HDWorkoutClusterServer_remote_generateRaceRouteClustersWithLimit_completion___block_invoke_286(uint64_t a1, char a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      int v6 = 138543362;
      id v7 = v4;
      _os_log_error_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_ERROR, "Failed to sync Racing clusters after generation: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

+ (id)requiredEntitlements
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4F2A548];
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

+ (id)taskIdentifier
{
  return (id)[MEMORY[0x1E4F2B758] taskIdentifier];
}

- (id)exportedInterface
{
  return (id)MEMORY[0x1F40E80A0](self, a2);
}

- (id)remoteInterface
{
  return (id)MEMORY[0x1F40E8098](self, a2);
}

- (unint64_t)maxWorkoutBatchSize
{
  return self->_maxWorkoutBatchSize;
}

- (void)setMaxWorkoutBatchSize:(unint64_t)a3
{
  self->_unint64_t maxWorkoutBatchSize = a3;
}

- (unint64_t)maxRouteCoordinateBatchSize
{
  return self->_maxRouteCoordinateBatchSize;
}

- (void)setMaxRouteCoordinateBatchSize:(unint64_t)a3
{
  self->_unint64_t maxRouteCoordinateBatchSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutClusterManager, 0);

  objc_storeStrong((id *)&self->_raceRouteClusterManager, 0);
}

@end