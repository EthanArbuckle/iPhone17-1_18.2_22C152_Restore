@interface HDRaceRouteClusterServer
+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7;
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)remote_fetchRaceRouteClustersForActivityType:(unint64_t)a3 completion:(id)a4;
@end

@implementation HDRaceRouteClusterServer

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = [v13 profile];
  v16 = [v15 profileExtensionWithIdentifier:@"com.apple.health.RacePreviousRoute"];

  v17 = [v16 raceRouteClusterManager];
  if (v17)
  {
    v18 = [(HDStandardTaskServer *)[HDRaceRouteClusterServer alloc] initWithUUID:v11 configuration:v12 client:v13 delegate:v14];
    v19 = v17;
    raceRouteClusterManager = v18->_raceRouteClusterManager;
    v18->_raceRouteClusterManager = v19;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_featureUnavailableForProfileError");
    raceRouteClusterManager = (HDRaceRouteClusterManager *)(id)objc_claimAutoreleasedReturnValue();
    if (raceRouteClusterManager)
    {
      if (a7) {
        *a7 = raceRouteClusterManager;
      }
      else {
        _HKLogDroppedError();
      }
    }

    v18 = 0;
  }

  return v18;
}

- (void)remote_fetchRaceRouteClustersForActivityType:(unint64_t)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  raceRouteClusterManager = self->_raceRouteClusterManager;
  id v14 = 0;
  v6 = (void (**)(id, void *, id))a4;
  v7 = [(HDRaceRouteClusterManager *)raceRouteClusterManager raceRouteClustersForActivityType:a3 error:&v14];
  id v8 = v14;
  _HKInitializeLogging();
  v9 = (void *)*MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    uint64_t v11 = [v7 count];
    id v12 = HKStringFromBool();
    id v13 = [v8 localizedDescription];
    *(_DWORD *)buf = 134218754;
    unint64_t v16 = a3;
    __int16 v17 = 2048;
    uint64_t v18 = v11;
    __int16 v19 = 2114;
    v20 = v12;
    __int16 v21 = 2114;
    v22 = v13;
    _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "Fetched racing clusters (activity-type %lu, count %lu) with success=%{public}@, error=%{public}@", buf, 0x2Au);
  }
  v6[2](v6, v7, v8);
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
  return (id)[MEMORY[0x1E4F2B3E8] taskIdentifier];
}

- (id)exportedInterface
{
  return (id)MEMORY[0x1F40E7ED8](self, a2);
}

- (id)remoteInterface
{
  return (id)MEMORY[0x1F40E7ED0](self, a2);
}

- (void).cxx_destruct
{
}

@end