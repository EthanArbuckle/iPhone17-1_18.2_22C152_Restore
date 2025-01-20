@interface VNTrackerManager
+ (id)_trackerClassToNameMapTableObjectForKey:(Class)a3;
+ (id)_trackerTypeToClassDictionary;
+ (id)trackerClassForOptions:(void *)a3 error:;
- (VNTrackerManager)init;
- (id)_createTracker:(id)a3 type:(id)a4 options:(id)a5 error:(id *)a6;
- (id)_getTracker:(id)a3;
- (id)_supportedComputeDeviceTypesForTrackerType:(id)a3 options:(id)a4 error:(id *)a5;
- (int64_t)_maximumTrackersOfType:(id)a3;
- (void)_releaseTracker_NO_LOCK_DO_NOT_EXECUTE_DIRECTLY:(id)a3;
@end

@implementation VNTrackerManager

- (VNTrackerManager)init
{
  v26[4] = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)VNTrackerManager;
  v2 = [(VNTrackerManager *)&v22 init];
  if (v2)
  {
    v25[0] = @"VNObjectTrackerRevision1Type";
    v25[1] = @"VNObjectTrackerRevision2Type";
    v26[0] = &unk_1EF7A71F0;
    v26[1] = &unk_1EF7A71F0;
    v25[2] = @"VNObjectTrackerRevisionLegacyFaceCoreType";
    v25[3] = @"VNRectangleTrackerType";
    v26[2] = &unk_1EF7A71F0;
    v26[3] = &unk_1EF7A71F0;
    v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:4];
    uint64_t v4 = [v3 mutableCopy];
    liveTrackerCounter = v2->_liveTrackerCounter;
    v2->_liveTrackerCounter = (NSMutableDictionary *)v4;

    id v6 = objc_msgSend([NSString alloc], "initWithFormat:", @"com.apple.VN.trackersCollectionManagementQueue_%lu", v2);
    v7 = (const char *)[v6 UTF8String];
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create(v7, v8);
    trackersCollectionManagementQueue = v2->_trackersCollectionManagementQueue;
    v2->_trackersCollectionManagementQueue = (OS_dispatch_queue *)v9;

    v23[0] = @"VNObjectTrackerRevision1Type";
    v23[1] = @"VNObjectTrackerRevision2Type";
    v24[0] = &unk_1EF7A7208;
    v24[1] = &unk_1EF7A7208;
    v23[2] = @"VNObjectTrackerRevisionLegacyFaceCoreType";
    v23[3] = @"VNRectangleTrackerType";
    v24[2] = &unk_1EF7A7208;
    v24[3] = &unk_1EF7A7208;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:4];
    liveTrackerCounterLimit = v2->_liveTrackerCounterLimit;
    v2->_liveTrackerCounterLimit = (NSDictionary *)v11;

    id v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"com.apple.VN.trackingProcessingQueue_%lu", v2);
    v14 = (const char *)[v13 UTF8String];
    v15 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create(v14, v15);
    trackingProcessingQueue = v2->_trackingProcessingQueue;
    v2->_trackingProcessingQueue = (OS_dispatch_queue *)v16;

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    trackers = v2->_trackers;
    v2->_trackers = v18;

    v20 = v2;
  }

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackers, 0);
  objc_storeStrong((id *)&self->_liveTrackerCounterLimit, 0);
  objc_storeStrong((id *)&self->_trackersCollectionManagementQueue, 0);
  objc_storeStrong((id *)&self->_trackingProcessingQueue, 0);

  objc_storeStrong((id *)&self->_liveTrackerCounter, 0);
}

- (void)_releaseTracker_NO_LOCK_DO_NOT_EXECUTE_DIRECTLY:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    trackers = self->_trackers;
    id v12 = v4;
    id v6 = [v4 key];
    [(NSMutableDictionary *)trackers removeObjectForKey:v6];

    v7 = objc_opt_class();
    v8 = [v7 _trackerClassToNameMapTableObjectForKey:objc_opt_class()];
    dispatch_queue_t v9 = [(NSMutableDictionary *)self->_liveTrackerCounter objectForKey:v8];
    uint64_t v10 = [v9 integerValue];

    uint64_t v11 = [NSNumber numberWithInteger:v10 - 1];
    [(NSMutableDictionary *)self->_liveTrackerCounter setObject:v11 forKeyedSubscript:v8];

    id v4 = v12;
  }
}

- (id)_createTracker:(id)a3 type:(id)a4 options:(id)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__12679;
  v35 = __Block_byref_object_dispose__12680;
  id v36 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__12679;
  v29 = __Block_byref_object_dispose__12680;
  id v30 = 0;
  uint64_t v11 = [(id)objc_opt_class() _trackerTypeToClassDictionary];
  trackersCollectionManagementQueue = self->_trackersCollectionManagementQueue;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __54__VNTrackerManager__createTracker_type_options_error___block_invoke;
  v19[3] = &unk_1E5B1D4D0;
  v19[4] = self;
  id v13 = v9;
  id v20 = v13;
  v23 = &v25;
  id v14 = v10;
  id v21 = v14;
  id v15 = v11;
  id v22 = v15;
  v24 = &v31;
  dispatch_sync(trackersCollectionManagementQueue, v19);
  dispatch_queue_t v16 = (void *)v32[5];
  if (a6 && !v16)
  {
    *a6 = (id) v26[5];
    dispatch_queue_t v16 = (void *)v32[5];
  }
  id v17 = v16;

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v17;
}

void __54__VNTrackerManager__createTracker_type_options_error___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = [v2 integerValue];

  if (v3 < [*(id *)(a1 + 32) _maximumTrackersOfType:*(void *)(a1 + 40)])
  {
    id v4 = (void *)[*(id *)(a1 + 48) mutableCopy];
    if ([*(id *)(a1 + 40) isEqualToString:@"VNObjectTrackerRevision2Type"])
    {
      uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
      id obj = *(id *)(v5 + 40);
      id v6 = +[VNValidationUtilities requiredSessionInOptions:v4 error:&obj];
      objc_storeStrong((id *)(v5 + 40), obj);
      if (!v6) {
        goto LABEL_9;
      }
      v7 = +[VNObjectTrackerRevision2 rpnTrackerInitModelName];
      [v4 setObject:v7 forKeyedSubscript:@"VNObjectTrackerRevision2Type_RPNTrackerInitModelName"];

      v8 = +[VNObjectTrackerRevision2 rpnTrackerTrackModelName];
      [v4 setObject:v8 forKeyedSubscript:@"VNObjectTrackerRevision2Type_RPNTrackerTrackModelName"];

      uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
      id v24 = *(id *)(v9 + 40);
      id v10 = [v6 trackerResourcesConfiguredWithOptions:v4 error:&v24];
      objc_storeStrong((id *)(v9 + 40), v24);
      if (!v10)
      {
LABEL_8:

        goto LABEL_9;
      }
      [v4 setObject:v10 forKeyedSubscript:@"VNTrackerOption_RPNEspressoResources"];
    }
    id v11 = objc_alloc((Class)(id)[*(id *)(a1 + 56) objectForKeyedSubscript:*(void *)(a1 + 40)]);
    uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
    id v23 = *(id *)(v12 + 40);
    uint64_t v13 = [v11 initWithOptions:v4 error:&v23];
    objc_storeStrong((id *)(v12 + 40), v23);
    uint64_t v14 = *(void *)(*(void *)(a1 + 72) + 8);
    id v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
    {
      dispatch_queue_t v16 = [NSNumber numberWithInteger:v3 + 1];
      [*(id *)(*(void *)(a1 + 32) + 8) setObject:v16 forKeyedSubscript:*(void *)(a1 + 40)];

      id v17 = *(void **)(*(void *)(a1 + 32) + 40);
      uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      id v6 = [v4 objectForKeyedSubscript:@"VNTrackingOption_TrackerKey"];
      [v17 setObject:v18 forKey:v6];
      goto LABEL_8;
    }
LABEL_9:

    return;
  }
  id v22 = [NSString stringWithFormat:@"Internal error: Exceeded maximum allowed number of Trackers for a tracker type: %@", *(void *)(a1 + 40)];
  uint64_t v19 = +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:");
  uint64_t v20 = *(void *)(*(void *)(a1 + 64) + 8);
  id v21 = *(void **)(v20 + 40);
  *(void *)(v20 + 40) = v19;
}

- (id)_getTracker:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__12679;
  dispatch_queue_t v16 = __Block_byref_object_dispose__12680;
  id v17 = 0;
  trackersCollectionManagementQueue = self->_trackersCollectionManagementQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__VNTrackerManager__getTracker___block_invoke;
  block[3] = &unk_1E5B1D4A0;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(trackersCollectionManagementQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __32__VNTrackerManager__getTracker___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 40) objectForKey:a1[5]];

  return MEMORY[0x1F41817F8]();
}

- (int64_t)_maximumTrackersOfType:(id)a3
{
  uint64_t v3 = [(NSDictionary *)self->_liveTrackerCounterLimit objectForKeyedSubscript:a3];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (id)_supportedComputeDeviceTypesForTrackerType:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [(id)objc_opt_class() _trackerTypeToClassDictionary];
  id v10 = (id)[v9 objectForKeyedSubscript:v7];
  if (v10)
  {
    a5 = [v10 supportedComputeDevicesForOptions:v8 error:a5];
  }
  else if (a5)
  {
    id v11 = (void *)[[NSString alloc] initWithFormat:@"unknown tracker type %@", v7];
    *a5 = +[VNError errorForInternalErrorWithLocalizedDescription:v11];

    a5 = 0;
  }

  return a5;
}

+ (id)_trackerClassToNameMapTableObjectForKey:(Class)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__VNTrackerManager__trackerClassToNameMapTableObjectForKey___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNTrackerManager _trackerClassToNameMapTableObjectForKey:]::onceToken != -1) {
    dispatch_once(&+[VNTrackerManager _trackerClassToNameMapTableObjectForKey:]::onceToken, block);
  }
  int64_t v4 = [(id)+[VNTrackerManager _trackerClassToNameMapTableObjectForKey:]::trackerClassToNameMapTable objectForKey:a3];

  return v4;
}

void __60__VNTrackerManager__trackerClassToNameMapTableObjectForKey___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _trackerTypeToClassDictionary];
  uint64_t v1 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  v2 = (void *)+[VNTrackerManager _trackerClassToNameMapTableObjectForKey:]::trackerClassToNameMapTable;
  +[VNTrackerManager _trackerClassToNameMapTableObjectForKey:]::trackerClassToNameMapTable = v1;

  [v3 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_51_12712];
}

uint64_t __60__VNTrackerManager__trackerClassToNameMapTableObjectForKey___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [(id)+[VNTrackerManager _trackerClassToNameMapTableObjectForKey:]::trackerClassToNameMapTable setObject:a2 forKey:a3];
}

+ (id)_trackerTypeToClassDictionary
{
  if (+[VNTrackerManager _trackerTypeToClassDictionary]::onceToken != -1) {
    dispatch_once(&+[VNTrackerManager _trackerTypeToClassDictionary]::onceToken, &__block_literal_global_12715);
  }
  v2 = (void *)+[VNTrackerManager _trackerTypeToClassDictionary]::trackerTypeToClassDictionary;

  return v2;
}

void __49__VNTrackerManager__trackerTypeToClassDictionary__block_invoke()
{
  v3[4] = *MEMORY[0x1E4F143B8];
  v2[0] = @"VNObjectTrackerRevision1Type";
  v3[0] = objc_opt_class();
  v2[1] = @"VNObjectTrackerRevision2Type";
  v3[1] = objc_opt_class();
  v2[2] = @"VNObjectTrackerRevisionLegacyFaceCoreType";
  v3[2] = objc_opt_class();
  v2[3] = @"VNRectangleTrackerType";
  v3[3] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:4];
  uint64_t v1 = (void *)+[VNTrackerManager _trackerTypeToClassDictionary]::trackerTypeToClassDictionary;
  +[VNTrackerManager _trackerTypeToClassDictionary]::trackerTypeToClassDictionary = v0;
}

+ (id)trackerClassForOptions:(void *)a3 error:
{
  id v4 = a2;
  self;
  uint64_t v5 = +[VNValidationUtilities requiredObjectOfClass:objc_opt_class() forKey:@"VNTrackingOption_TrackerType" inOptions:v4 error:a3];
  if (v5)
  {
    id v6 = [(id)objc_opt_class() _trackerTypeToClassDictionary];
    id v7 = (id)[v6 objectForKeyedSubscript:v5];
    id v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else if (a3)
    {
      id v10 = (void *)[[NSString alloc] initWithFormat:@"Unknown tracker type \"%@\"", v5];
      *a3 = +[VNError errorForInvalidOptionWithLocalizedDescription:v10];
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

uint64_t __35__VNTrackerManager_releaseTracker___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_releaseTracker_NO_LOCK_DO_NOT_EXECUTE_DIRECTLY:", *(void *)(a1 + 40));
}

void __38__VNTrackerManager_releaseAllTrackers__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 40) allValues];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 32), "_releaseTracker_NO_LOCK_DO_NOT_EXECUTE_DIRECTLY:", *(void *)(*((void *)&v9 + 1) + 8 * v5++), (void)v9);
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v3);
  }

  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

@end