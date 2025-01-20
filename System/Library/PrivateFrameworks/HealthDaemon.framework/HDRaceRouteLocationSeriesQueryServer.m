@interface HDRaceRouteLocationSeriesQueryServer
+ (Class)queryClass;
+ (id)requiredEntitlements;
- (HDRaceRouteLocationSeriesQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (void)_queue_start;
@end

@implementation HDRaceRouteLocationSeriesQueryServer

- (HDRaceRouteLocationSeriesQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HDRaceRouteLocationSeriesQueryServer;
  v11 = [(HDQueryServer *)&v18 initWithUUID:a3 configuration:v10 client:a5 delegate:a6];
  if (v11)
  {
    uint64_t v12 = [v10 clusterUUID];
    clusterUUID = v11->_clusterUUID;
    v11->_clusterUUID = (NSUUID *)v12;

    v11->_workoutSelection = [v10 workoutSelection];
    uint64_t v14 = [v10 workoutUUID];
    workoutUUID = v11->_workoutUUID;
    v11->_workoutUUID = (NSUUID *)v14;

    [v10 timestampAnchor];
    v11->_timestampAnchor = v16;
    v11->_limit = [v10 limit];
  }

  return v11;
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

+ (id)requiredEntitlements
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4F2A548];
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (void)_queue_start
{
  v32.receiver = self;
  v32.super_class = (Class)HDRaceRouteLocationSeriesQueryServer;
  [(HDQueryServer *)&v32 _queue_start];
  v3 = [(HDQueryServer *)self queryUUID];
  v4 = [(HDQueryServer *)self clientProxy];
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__52;
  v30 = __Block_byref_object_dispose__52;
  id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__HDRaceRouteLocationSeriesQueryServer__queue_start__block_invoke;
  aBlock[3] = &unk_1E62FAA38;
  v25 = &v26;
  id v5 = v4;
  id v23 = v5;
  id v6 = v3;
  id v24 = v6;
  v7 = _Block_copy(aBlock);
  workoutUUID = self->_workoutUUID;
  if (!workoutUUID)
  {
    clusterUUID = self->_clusterUUID;
    unint64_t workoutSelection = self->_workoutSelection;
    double timestampAnchor = self->_timestampAnchor;
    unint64_t limit = self->_limit;
    objc_super v18 = [(HDQueryServer *)self profile];
    id v20 = 0;
    BOOL v19 = +[HDRaceRouteClusterEntity enumerateRoutePointsForClusterUUID:clusterUUID workoutSelection:workoutSelection timestampAnchor:limit limit:v18 profile:&v20 error:v7 dataHandler:timestampAnchor];
    id v13 = v20;

    if (v19) {
      goto LABEL_3;
    }
LABEL_5:
    objc_msgSend(v5, "client_deliverError:forQuery:", v13, v6);
    goto LABEL_6;
  }
  double v9 = self->_timestampAnchor;
  unint64_t v10 = self->_limit;
  v11 = [(HDQueryServer *)self profile];
  id v21 = 0;
  BOOL v12 = +[HDRaceRouteWorkoutEntity enumerateRoutePointsForWorkoutUUID:workoutUUID timestampAnchor:v10 limit:v11 profile:&v21 error:v7 dataHandler:v9];
  id v13 = v21;

  if (!v12) {
    goto LABEL_5;
  }
LABEL_3:
  objc_msgSend(v5, "client_deliverRaceRouteLocations:isFinal:query:", v27[5], 1, v6);
LABEL_6:

  _Block_object_dispose(&v26, 8);
}

uint64_t __52__HDRaceRouteLocationSeriesQueryServer__queue_start__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((unint64_t)[*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count] >= 0xC8)
  {
    objc_msgSend(*(id *)(a1 + 32), "client_deliverRaceRouteLocations:isFinal:query:", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), 0, *(void *)(a1 + 40));
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v3];

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutUUID, 0);

  objc_storeStrong((id *)&self->_clusterUUID, 0);
}

@end