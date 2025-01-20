@interface HKWorkoutClusterStore
+ (id)taskIdentifier;
- (HKWorkoutClusterStore)initWithHealthStore:(id)a3;
- (id)_coordinatesHandlerWithCallback:(id)a3 completion:(id)a4;
- (id)_workoutFilterForPredicate:(id)a3;
- (void)createWorkoutCluster:(id)a3 completion:(id)a4;
- (void)deleteWorkoutClusterWithUUID:(id)a3 completion:(id)a4;
- (void)fetchRouteCoordinatesForWorkoutUUID:(id)a3 dateInterval:(id)a4 limit:(unint64_t)a5 handler:(id)a6 completion:(id)a7;
- (void)fetchRouteCoordinatesForWorkoutUUID:(id)a3 startDate:(id)a4 limit:(unint64_t)a5 handler:(id)a6 completion:(id)a7;
- (void)fetchWorkoutClusterContainingWorkoutUUID:(id)a3 completion:(id)a4;
- (void)fetchWorkoutClustersContainingWorkoutUUIDs:(id)a3 completion:(id)a4;
- (void)fetchWorkoutClustersWithCompletion:(id)a3;
- (void)fetchWorkoutCountWithPredicate:(id)a3 completion:(id)a4;
- (void)fetchWorkoutRouteSnapshotForClusterUUID:(id)a3 completion:(id)a4;
- (void)fetchWorkoutUUIDsForClusterUUID:(id)a3 completion:(id)a4;
- (void)fetchWorkoutsWithPredicate:(id)a3 anchor:(id)a4 limit:(unint64_t)a5 completion:(id)a6;
- (void)fetchWorkoutsWithPredicate:(id)a3 limit:(unint64_t)a4 sortDescriptors:(id)a5 completion:(id)a6;
- (void)generateRaceRouteClustersWithLimit:(unint64_t)a3 completion:(id)a4;
- (void)updateWorkoutClusterWithUUID:(id)a3 newRelevance:(id)a4 newLastWorkoutUUID:(id)a5 newBestWorkoutUUID:(id)a6 newWorkoutAssociations:(id)a7 workoutAssociationsToRemove:(id)a8 completion:(id)a9;
- (void)updateWorkoutRouteLabel:(id)a3 forClusterUUID:(id)a4 completion:(id)a5;
- (void)updateWorkoutRouteSnapshot:(id)a3 forClusterUUID:(id)a4 completion:(id)a5;
@end

@implementation HKWorkoutClusterStore

- (HKWorkoutClusterStore)initWithHealthStore:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKWorkoutClusterStore;
  v5 = [(HKWorkoutClusterStore *)&v12 init];
  if (v5)
  {
    v6 = [HKTaskServerProxyProvider alloc];
    v7 = [(id)objc_opt_class() taskIdentifier];
    v8 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v9 = [(HKTaskServerProxyProvider *)v6 initWithHealthStore:v4 taskIdentifier:v7 exportedObject:v5 taskUUID:v8];
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKTaskServerProxyProvider *)v9;
  }
  return v5;
}

+ (id)taskIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (void)fetchWorkoutCountWithPredicate:(id)a3 completion:(id)a4
{
  proxyProvider = self->_proxyProvider;
  id v7 = a3;
  v8 = [(HKProxyProvider *)proxyProvider clientQueueObjectHandlerWithCompletion:a4];
  uint64_t v9 = [(HKWorkoutClusterStore *)self _workoutFilterForPredicate:v7];

  v10 = self->_proxyProvider;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__HKWorkoutClusterStore_fetchWorkoutCountWithPredicate_completion___block_invoke;
  v15[3] = &unk_1E58BC168;
  id v16 = v9;
  id v17 = v8;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__HKWorkoutClusterStore_fetchWorkoutCountWithPredicate_completion___block_invoke_2;
  v13[3] = &unk_1E58BBD88;
  id v14 = v17;
  id v11 = v17;
  id v12 = v9;
  [(HKProxyProvider *)v10 fetchProxyWithHandler:v15 errorHandler:v13];
}

uint64_t __67__HKWorkoutClusterStore_fetchWorkoutCountWithPredicate_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchWorkoutCountWithFilter:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __67__HKWorkoutClusterStore_fetchWorkoutCountWithPredicate_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchWorkoutsWithPredicate:(id)a3 anchor:(id)a4 limit:(unint64_t)a5 completion:(id)a6
{
  id v10 = a4;
  proxyProvider = self->_proxyProvider;
  id v12 = a3;
  v13 = [(HKProxyProvider *)proxyProvider clientQueueDoubleObjectHandlerWithCompletion:a6];
  id v14 = [(HKWorkoutClusterStore *)self _workoutFilterForPredicate:v12];

  v15 = self->_proxyProvider;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __76__HKWorkoutClusterStore_fetchWorkoutsWithPredicate_anchor_limit_completion___block_invoke;
  v21[3] = &unk_1E58BC190;
  id v22 = v14;
  id v23 = v10;
  unint64_t v25 = a5;
  id v24 = v13;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __76__HKWorkoutClusterStore_fetchWorkoutsWithPredicate_anchor_limit_completion___block_invoke_2;
  v19[3] = &unk_1E58BBD88;
  id v20 = v24;
  id v16 = v24;
  id v17 = v10;
  id v18 = v14;
  [(HKProxyProvider *)v15 fetchProxyWithHandler:v21 errorHandler:v19];
}

uint64_t __76__HKWorkoutClusterStore_fetchWorkoutsWithPredicate_anchor_limit_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchWorkoutsWithFilter:anchor:limit:completion:", a1[4], a1[5], a1[7], a1[6]);
}

uint64_t __76__HKWorkoutClusterStore_fetchWorkoutsWithPredicate_anchor_limit_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchWorkoutsWithPredicate:(id)a3 limit:(unint64_t)a4 sortDescriptors:(id)a5 completion:(id)a6
{
  id v10 = a5;
  proxyProvider = self->_proxyProvider;
  id v12 = a3;
  v13 = [(HKProxyProvider *)proxyProvider clientQueueObjectHandlerWithCompletion:a6];
  id v14 = [(HKWorkoutClusterStore *)self _workoutFilterForPredicate:v12];

  v15 = self->_proxyProvider;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __85__HKWorkoutClusterStore_fetchWorkoutsWithPredicate_limit_sortDescriptors_completion___block_invoke;
  v21[3] = &unk_1E58BC190;
  unint64_t v25 = a4;
  id v22 = v14;
  id v23 = v10;
  id v24 = v13;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __85__HKWorkoutClusterStore_fetchWorkoutsWithPredicate_limit_sortDescriptors_completion___block_invoke_2;
  v19[3] = &unk_1E58BBD88;
  id v20 = v24;
  id v16 = v24;
  id v17 = v10;
  id v18 = v14;
  [(HKProxyProvider *)v15 fetchProxyWithHandler:v21 errorHandler:v19];
}

uint64_t __85__HKWorkoutClusterStore_fetchWorkoutsWithPredicate_limit_sortDescriptors_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchWorkoutsWithFilter:limit:sortDescriptors:completion:", a1[4], a1[7], a1[5], a1[6]);
}

uint64_t __85__HKWorkoutClusterStore_fetchWorkoutsWithPredicate_limit_sortDescriptors_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_workoutFilterForPredicate:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  id v5 = [v3 alloc];
  v6 = +[HKObjectType workoutType];
  id v7 = objc_msgSend(v5, "initWithObjects:", v6, 0);

  v8 = objc_msgSend(v4, "hk_filterRepresentationForDataTypes:", v7);

  return v8;
}

- (void)fetchRouteCoordinatesForWorkoutUUID:(id)a3 startDate:(id)a4 limit:(unint64_t)a5 handler:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  v15 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a7];
  proxyProvider = self->_proxyProvider;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __96__HKWorkoutClusterStore_fetchRouteCoordinatesForWorkoutUUID_startDate_limit_handler_completion___block_invoke;
  v23[3] = &unk_1E58BC1B8;
  id v24 = v12;
  id v25 = v13;
  unint64_t v29 = a5;
  v26 = self;
  id v27 = v14;
  id v28 = v15;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __96__HKWorkoutClusterStore_fetchRouteCoordinatesForWorkoutUUID_startDate_limit_handler_completion___block_invoke_2;
  v21[3] = &unk_1E58BBD88;
  id v22 = v28;
  id v17 = v28;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v23 errorHandler:v21];
}

void __96__HKWorkoutClusterStore_fetchRouteCoordinatesForWorkoutUUID_startDate_limit_handler_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[5];
  id v4 = (void *)a1[6];
  uint64_t v5 = a1[7];
  uint64_t v7 = a1[8];
  uint64_t v6 = a1[9];
  id v8 = a2;
  id v9 = [v4 _coordinatesHandlerWithCallback:v5 completion:v7];
  objc_msgSend(v8, "remote_fetchRouteCoordinatesForWorkoutUUID:startDate:limit:completion:", v2, v3, v6, v9);
}

uint64_t __96__HKWorkoutClusterStore_fetchRouteCoordinatesForWorkoutUUID_startDate_limit_handler_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchRouteCoordinatesForWorkoutUUID:(id)a3 dateInterval:(id)a4 limit:(unint64_t)a5 handler:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  v15 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a7];
  proxyProvider = self->_proxyProvider;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __99__HKWorkoutClusterStore_fetchRouteCoordinatesForWorkoutUUID_dateInterval_limit_handler_completion___block_invoke;
  v23[3] = &unk_1E58BC1B8;
  id v24 = v12;
  id v25 = v13;
  unint64_t v29 = a5;
  v26 = self;
  id v27 = v14;
  id v28 = v15;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __99__HKWorkoutClusterStore_fetchRouteCoordinatesForWorkoutUUID_dateInterval_limit_handler_completion___block_invoke_2;
  v21[3] = &unk_1E58BBD88;
  id v22 = v28;
  id v17 = v28;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v23 errorHandler:v21];
}

void __99__HKWorkoutClusterStore_fetchRouteCoordinatesForWorkoutUUID_dateInterval_limit_handler_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[5];
  id v4 = (void *)a1[6];
  uint64_t v5 = a1[7];
  uint64_t v7 = a1[8];
  uint64_t v6 = a1[9];
  id v8 = a2;
  id v9 = [v4 _coordinatesHandlerWithCallback:v5 completion:v7];
  objc_msgSend(v8, "remote_fetchRouteCoordinatesForWorkoutUUID:dateInterval:limit:completion:", v2, v3, v6, v9);
}

uint64_t __99__HKWorkoutClusterStore_fetchRouteCoordinatesForWorkoutUUID_dateInterval_limit_handler_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_coordinatesHandlerWithCallback:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__HKWorkoutClusterStore__coordinatesHandlerWithCallback_completion___block_invoke;
  v11[3] = &unk_1E58BC1E0;
  id v12 = v5;
  id v13 = v6;
  id v7 = v6;
  id v8 = v5;
  id v9 = _Block_copy(v11);

  return v9;
}

void __68__HKWorkoutClusterStore__coordinatesHandlerWithCallback_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = objc_msgSend(v5, "coordinates", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v13 = *(void *)(a1 + 32);
        [v12 latitude];
        double v15 = v14;
        [v12 longitude];
        (*(void (**)(uint64_t, double, double))(v13 + 16))(v13, v15, v16);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  if ([v5 hasResumeDate])
  {
    id v17 = (void *)MEMORY[0x1E4F1C9C8];
    [v5 resumeDate];
    id v18 = objc_msgSend(v17, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    id v18 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)createWorkoutCluster:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57__HKWorkoutClusterStore_createWorkoutCluster_completion___block_invoke;
  v13[3] = &unk_1E58BC168;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__HKWorkoutClusterStore_createWorkoutCluster_completion___block_invoke_2;
  v11[3] = &unk_1E58BBD88;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v13 errorHandler:v11];
}

uint64_t __57__HKWorkoutClusterStore_createWorkoutCluster_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_createWorkoutCluster:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __57__HKWorkoutClusterStore_createWorkoutCluster_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchWorkoutClustersWithCompletion:(id)a3
{
  id v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a3];
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__HKWorkoutClusterStore_fetchWorkoutClustersWithCompletion___block_invoke;
  v9[3] = &unk_1E58BC208;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__HKWorkoutClusterStore_fetchWorkoutClustersWithCompletion___block_invoke_2;
  v7[3] = &unk_1E58BBD88;
  id v8 = v10;
  id v6 = v10;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __60__HKWorkoutClusterStore_fetchWorkoutClustersWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchWorkoutClustersWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __60__HKWorkoutClusterStore_fetchWorkoutClustersWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchWorkoutClusterContainingWorkoutUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__HKWorkoutClusterStore_fetchWorkoutClusterContainingWorkoutUUID_completion___block_invoke;
  v13[3] = &unk_1E58BC168;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __77__HKWorkoutClusterStore_fetchWorkoutClusterContainingWorkoutUUID_completion___block_invoke_2;
  v11[3] = &unk_1E58BBD88;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v13 errorHandler:v11];
}

uint64_t __77__HKWorkoutClusterStore_fetchWorkoutClusterContainingWorkoutUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchWorkoutClusterContainingWorkoutUUID:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __77__HKWorkoutClusterStore_fetchWorkoutClusterContainingWorkoutUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchWorkoutClustersContainingWorkoutUUIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__HKWorkoutClusterStore_fetchWorkoutClustersContainingWorkoutUUIDs_completion___block_invoke;
  v13[3] = &unk_1E58BC168;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __79__HKWorkoutClusterStore_fetchWorkoutClustersContainingWorkoutUUIDs_completion___block_invoke_2;
  v11[3] = &unk_1E58BBD88;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v13 errorHandler:v11];
}

uint64_t __79__HKWorkoutClusterStore_fetchWorkoutClustersContainingWorkoutUUIDs_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchWorkoutClustersContainingWorkoutUUIDs:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __79__HKWorkoutClusterStore_fetchWorkoutClustersContainingWorkoutUUIDs_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchWorkoutUUIDsForClusterUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__HKWorkoutClusterStore_fetchWorkoutUUIDsForClusterUUID_completion___block_invoke;
  v13[3] = &unk_1E58BC168;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__HKWorkoutClusterStore_fetchWorkoutUUIDsForClusterUUID_completion___block_invoke_2;
  v11[3] = &unk_1E58BBD88;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v13 errorHandler:v11];
}

uint64_t __68__HKWorkoutClusterStore_fetchWorkoutUUIDsForClusterUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchWorkoutUUIDsForClusterUUID:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __68__HKWorkoutClusterStore_fetchWorkoutUUIDsForClusterUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchWorkoutRouteSnapshotForClusterUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __76__HKWorkoutClusterStore_fetchWorkoutRouteSnapshotForClusterUUID_completion___block_invoke;
  v13[3] = &unk_1E58BC168;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__HKWorkoutClusterStore_fetchWorkoutRouteSnapshotForClusterUUID_completion___block_invoke_2;
  v11[3] = &unk_1E58BBD88;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v13 errorHandler:v11];
}

uint64_t __76__HKWorkoutClusterStore_fetchWorkoutRouteSnapshotForClusterUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchWorkoutRouteSnapshotForClusterUUID:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __76__HKWorkoutClusterStore_fetchWorkoutRouteSnapshotForClusterUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateWorkoutRouteSnapshot:(id)a3 forClusterUUID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a5];
  proxyProvider = self->_proxyProvider;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __78__HKWorkoutClusterStore_updateWorkoutRouteSnapshot_forClusterUUID_completion___block_invoke;
  v17[3] = &unk_1E58BC230;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78__HKWorkoutClusterStore_updateWorkoutRouteSnapshot_forClusterUUID_completion___block_invoke_2;
  v15[3] = &unk_1E58BBD88;
  id v16 = v20;
  id v12 = v20;
  id v13 = v9;
  id v14 = v8;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v17 errorHandler:v15];
}

uint64_t __78__HKWorkoutClusterStore_updateWorkoutRouteSnapshot_forClusterUUID_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_updateWorkoutRouteSnapshot:forClusterUUID:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __78__HKWorkoutClusterStore_updateWorkoutRouteSnapshot_forClusterUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateWorkoutRouteLabel:(id)a3 forClusterUUID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a5];
  proxyProvider = self->_proxyProvider;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __75__HKWorkoutClusterStore_updateWorkoutRouteLabel_forClusterUUID_completion___block_invoke;
  v17[3] = &unk_1E58BC230;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75__HKWorkoutClusterStore_updateWorkoutRouteLabel_forClusterUUID_completion___block_invoke_2;
  v15[3] = &unk_1E58BBD88;
  id v16 = v20;
  id v12 = v20;
  id v13 = v9;
  id v14 = v8;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v17 errorHandler:v15];
}

uint64_t __75__HKWorkoutClusterStore_updateWorkoutRouteLabel_forClusterUUID_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_updateWorkoutRouteLabel:forClusterUUID:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __75__HKWorkoutClusterStore_updateWorkoutRouteLabel_forClusterUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateWorkoutClusterWithUUID:(id)a3 newRelevance:(id)a4 newLastWorkoutUUID:(id)a5 newBestWorkoutUUID:(id)a6 newWorkoutAssociations:(id)a7 workoutAssociationsToRemove:(id)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  long long v21 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a9];
  proxyProvider = self->_proxyProvider;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __167__HKWorkoutClusterStore_updateWorkoutClusterWithUUID_newRelevance_newLastWorkoutUUID_newBestWorkoutUUID_newWorkoutAssociations_workoutAssociationsToRemove_completion___block_invoke;
  v32[3] = &unk_1E58BC258;
  id v33 = v15;
  id v34 = v16;
  id v35 = v17;
  id v36 = v18;
  id v37 = v19;
  id v38 = v20;
  id v39 = v21;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __167__HKWorkoutClusterStore_updateWorkoutClusterWithUUID_newRelevance_newLastWorkoutUUID_newBestWorkoutUUID_newWorkoutAssociations_workoutAssociationsToRemove_completion___block_invoke_2;
  v30[3] = &unk_1E58BBD88;
  id v31 = v39;
  id v23 = v39;
  id v24 = v20;
  id v25 = v19;
  id v26 = v18;
  id v27 = v17;
  id v28 = v16;
  id v29 = v15;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v32 errorHandler:v30];
}

uint64_t __167__HKWorkoutClusterStore_updateWorkoutClusterWithUUID_newRelevance_newLastWorkoutUUID_newBestWorkoutUUID_newWorkoutAssociations_workoutAssociationsToRemove_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_updateWorkoutClusterWithUUID:newRelevance:newLastWorkoutUUID:newBestWorkoutUUID:newWorkoutAssociations:workoutAssociationsToRemove:completion:", a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10]);
}

uint64_t __167__HKWorkoutClusterStore_updateWorkoutClusterWithUUID_newRelevance_newLastWorkoutUUID_newBestWorkoutUUID_newWorkoutAssociations_workoutAssociationsToRemove_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deleteWorkoutClusterWithUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__HKWorkoutClusterStore_deleteWorkoutClusterWithUUID_completion___block_invoke;
  v13[3] = &unk_1E58BC168;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__HKWorkoutClusterStore_deleteWorkoutClusterWithUUID_completion___block_invoke_2;
  v11[3] = &unk_1E58BBD88;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v13 errorHandler:v11];
}

uint64_t __65__HKWorkoutClusterStore_deleteWorkoutClusterWithUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_deleteWorkoutClusterWithUUID:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __65__HKWorkoutClusterStore_deleteWorkoutClusterWithUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)generateRaceRouteClustersWithLimit:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    id v7 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v6];

    proxyProvider = self->_proxyProvider;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __71__HKWorkoutClusterStore_generateRaceRouteClustersWithLimit_completion___block_invoke;
    v12[3] = &unk_1E58BC280;
    unint64_t v14 = a3;
    id v13 = v7;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __71__HKWorkoutClusterStore_generateRaceRouteClustersWithLimit_completion___block_invoke_2;
    v10[3] = &unk_1E58BBD88;
    id v6 = v13;
    id v11 = v6;
    [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v12 errorHandler:v10];
  }
  else
  {
    id v9 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 3, @"Cluster limit must be positive.");
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v9);
  }
}

uint64_t __71__HKWorkoutClusterStore_generateRaceRouteClustersWithLimit_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_generateRaceRouteClustersWithLimit:completion:", *(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __71__HKWorkoutClusterStore_generateRaceRouteClustersWithLimit_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

@end