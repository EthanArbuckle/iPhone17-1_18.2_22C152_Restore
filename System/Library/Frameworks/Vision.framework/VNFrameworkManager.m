@interface VNFrameworkManager
+ (id)manager;
+ (int)linktimeVersion;
+ (int)runtimeVersion;
- (NSArray)allSessions;
- (NSLocking)detectorAccessingLock;
- (NSLocking)sessionResourcesAccessingLock;
- (NSLocking)trackerResourcesAccessingLock;
- (NSNotificationCenter)notificationCenter;
- (VNFrameworkManager)init;
- (VisionCoreObjectCache)detectorDescriptorsCache;
- (id)_locateDetectorOfClass:(Class)a3 configuredWithOptions:(id)a4 inSessions:(id)a5 excludingSession:(id)a6;
- (id)_locateResourceObjectForIdentifier:(id)a3 requestingSession:(id)a4 creationBlock:(id)a5 error:(id *)a6;
- (id)_locateTrackerResourcesConfiguredWithOptions:(id)a3 inSessions:(id)a4 excludingSession:(id)a5;
- (id)detectorOfClass:(Class)a3 configuredWithOptions:(id)a4 forSession:(id)a5 error:(id *)a6;
- (id)loadedDetectors;
- (id)trackerResourcesConfiguredWithOptions:(id)a3 forSession:(id)a4 error:(id *)a5;
- (id)wisdomParameterForMTLDevice:(id)a3 error:(id *)a4;
- (id)wisdomParameterForMTLDeviceWithName:(id)a3 error:(id *)a4;
- (void)legacyForcedCleanupOfFacePipelineWithLevel:(id)a3;
- (void)legacyForcedCleanupOfJunkPipelineWithLevel:(id)a3;
- (void)legacyForcedCleanupOfScenePipelineWithLevel:(id)a3;
- (void)legacyForcedCleanupOfSmartCamPipelineWithLevel:(id)a3;
- (void)legacyForcedCleanupWithOptions:(id)a3;
- (void)registerSession:(id)a3;
- (void)releaseMetalDeviceWisdomParameters;
@end

@implementation VNFrameworkManager

+ (id)manager
{
  if (+[VNFrameworkManager manager]::onceToken != -1) {
    dispatch_once(&+[VNFrameworkManager manager]::onceToken, &__block_literal_global_5158);
  }
  v2 = (void *)+[VNFrameworkManager manager]::ourManager;

  return v2;
}

- (id)detectorOfClass:(Class)a3 configuredWithOptions:(id)a4 forSession:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  v12 = [(VNFrameworkManager *)self allSessions];
  v13 = [(VNFrameworkManager *)self _locateDetectorOfClass:a3 configuredWithOptions:v10 inSessions:v12 excludingSession:v11];
  if (v13)
  {
    id v14 = v13;
  }
  else
  {
    [v11 _releaseDetectorsThatCanBeReplacedByDetectorOfClass:a3 withConfiguration:v10];
    [(objc_class *)a3 VNClassCode];
    kdebug_trace();
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v15 setObject:a3 forKeyedSubscript:@"VNDetectorNotificationDetectorClass"];
    [v15 setObject:v10 forKeyedSubscript:@"VNDetectorNotificationConfiguration"];
    [(NSNotificationCenter *)self->_notificationCenter postNotificationName:@"VNDetectorWillLoadNotification" object:0 userInfo:v15];
    id v14 = [(objc_class *)a3 detectorWithConfigurationOptions:v10 forSession:v11 error:a6];
    [v14 signPostAdditionalParameter];
    kdebug_trace();
    if (v14)
    {
      [v15 setObject:v14 forKeyedSubscript:@"VNDetectorNotificationDetector"];
      [(NSNotificationCenter *)self->_notificationCenter postNotificationName:@"VNDetectorDidLoadNotification" object:v14 userInfo:v15];
      id v16 = v14;
    }
  }

  return v14;
}

- (NSLocking)detectorAccessingLock
{
  return (NSLocking *)self->_detectorAccessingLock;
}

- (id)_locateDetectorOfClass:(Class)a3 configuredWithOptions:(id)a4 inSessions:(id)a5 excludingSession:(id)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v20;
LABEL_3:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v20 != v14) {
        objc_enumerationMutation(v12);
      }
      id v16 = *(id *)(*((void *)&v19 + 1) + 8 * v15);
      if (v16 != v11)
      {
        v17 = objc_msgSend(v16, "_cachedDetectorOfClass:configuredWithOptions:", a3, v9, (void)v19);
        if (v17) {
          break;
        }
      }
      if (v13 == ++v15)
      {
        uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v13) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    v17 = 0;
  }

  return v17;
}

- (NSArray)allSessions
{
  v3 = (void *)MEMORY[0x1A6257080](self, a2);
  v4 = [(VNWeakTypeWrapperCollection *)self->_sessions allObjectsDroppingWeakZeroedObjects:1];

  return (NSArray *)v4;
}

- (void)registerSession:(id)a3
{
}

+ (int)linktimeVersion
{
  int result = +[VNRuntimeUtilities linkTimeVersion];
  if (result == -1)
  {
    return +[VNRuntimeUtilities runTimeVersion];
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wisdomParameters, 0);
  objc_storeStrong((id *)&self->_sessionResourcesAccessingLock, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_trackerResourcesAccessingLock, 0);
  objc_storeStrong((id *)&self->_detectorAccessingLock, 0);
  objc_storeStrong((id *)&self->_detectorDescriptorsCache, 0);

  objc_storeStrong((id *)&self->_notificationCenter, 0);
}

- (VisionCoreObjectCache)detectorDescriptorsCache
{
  return (VisionCoreObjectCache *)objc_getProperty(self, a2, 16, 1);
}

- (void)legacyForcedCleanupOfJunkPipelineWithLevel:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v5 = [(VNFrameworkManager *)self allSessions];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) legacyForcedCleanupOfJunkPipelineWithLevel:v4];
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)legacyForcedCleanupOfSmartCamPipelineWithLevel:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v5 = [(VNFrameworkManager *)self allSessions];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) legacyForcedCleanupOfSmartCamPipelineWithLevel:v4];
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)legacyForcedCleanupOfScenePipelineWithLevel:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v5 = [(VNFrameworkManager *)self allSessions];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) legacyForcedCleanupOfFacePipelineWithLevel:v4];
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)legacyForcedCleanupOfFacePipelineWithLevel:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v5 = [(VNFrameworkManager *)self allSessions];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) legacyForcedCleanupOfFacePipelineWithLevel:v4];
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)legacyForcedCleanupWithOptions:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v5 = [(VNFrameworkManager *)self allSessions];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) legacyForcedCleanupWithOptions:v4];
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)wisdomParameterForMTLDeviceWithName:(id)a3 error:(id *)a4
{
  id v4 = [(VNMTLDeviceWisdomParameters *)self->_wisdomParameters wisdomParameterForMTLDeviceWithName:a3 error:a4];

  return v4;
}

- (id)wisdomParameterForMTLDevice:(id)a3 error:(id *)a4
{
  id v4 = [(VNMTLDeviceWisdomParameters *)self->_wisdomParameters wisdomParameterForMTLDevice:a3 error:a4];

  return v4;
}

- (void)releaseMetalDeviceWisdomParameters
{
}

- (id)loadedDetectors
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1A6257080](self, a2);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  [(VNFrameworkManager *)self allSessions];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        long long v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "loadedDetectors", (void)v12);
        [v4 addObjectsFromArray:v9];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  long long v10 = [v4 allObjects];

  return v10;
}

- (id)trackerResourcesConfiguredWithOptions:(id)a3 forSession:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  long long v10 = [(VNFrameworkManager *)self allSessions];
  long long v11 = [(VNFrameworkManager *)self _locateTrackerResourcesConfiguredWithOptions:v8 inSessions:v10 excludingSession:v9];
  long long v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = [v9 createRPNTrackerResourcesConfiguredWithOptions:v8 error:a5];
  }
  long long v14 = v13;

  return v14;
}

- (id)_locateResourceObjectForIdentifier:(id)a3 requestingSession:(id)a4 creationBlock:(id)a5 error:(id *)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  long long v12 = (void (**)(id, id *))a5;
  [(VNFrameworkManager *)self allSessions];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v13);
        }
        id v17 = *(id *)(*((void *)&v21 + 1) + 8 * i);
        if (v17 != v11)
        {
          v18 = [v17 cachedResourceObjectForIdentifier:v10];
          if (v18)
          {
            long long v19 = v13;
            goto LABEL_13;
          }
        }
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }

  if (v12)
  {
    v18 = v12[2](v12, a6);
  }
  else if (a6)
  {
    long long v19 = (void *)[[NSString alloc] initWithFormat:@"could not locate resource object %@", v10];
    +[VNError errorForDataUnavailableWithLocalizedDescription:v19];
    v18 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (NSLocking)trackerResourcesAccessingLock
{
  return (NSLocking *)self->_trackerResourcesAccessingLock;
}

- (NSLocking)sessionResourcesAccessingLock
{
  return (NSLocking *)self->_sessionResourcesAccessingLock;
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (id)_locateTrackerResourcesConfiguredWithOptions:(id)a3 inSessions:(id)a4 excludingSession:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v18;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v18 != v12) {
        objc_enumerationMutation(v10);
      }
      id v14 = *(id *)(*((void *)&v17 + 1) + 8 * v13);
      if (v14 != v9)
      {
        uint64_t v15 = objc_msgSend(v14, "_cachedTrackerResourcesConfiguredWithOptions:", v7, (void)v17);
        if (v15) {
          break;
        }
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v11) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    uint64_t v15 = 0;
  }

  return v15;
}

- (VNFrameworkManager)init
{
  v18.receiver = self;
  v18.super_class = (Class)VNFrameworkManager;
  v2 = [(VNFrameworkManager *)&v18 init];
  if (v2)
  {
    v3 = (NSNotificationCenter *)objc_alloc_init(MEMORY[0x1E4F28EB8]);
    notificationCenter = v2->_notificationCenter;
    v2->_notificationCenter = v3;

    id v5 = (VisionCoreObjectCache *)objc_alloc_init(MEMORY[0x1E4FB3EE8]);
    detectorDescriptorsCache = v2->_detectorDescriptorsCache;
    v2->_detectorDescriptorsCache = v5;

    id v7 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E4F28FD0]);
    detectorAccessingLock = v2->_detectorAccessingLock;
    v2->_detectorAccessingLock = v7;

    id v9 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E4F28FD0]);
    trackerResourcesAccessingLock = v2->_trackerResourcesAccessingLock;
    v2->_trackerResourcesAccessingLock = v9;

    uint64_t v11 = objc_alloc_init(VNWeakTypeWrapperCollection);
    sessions = v2->_sessions;
    v2->_sessions = v11;

    uint64_t v13 = objc_alloc_init(VNMTLDeviceWisdomParameters);
    wisdomParameters = v2->_wisdomParameters;
    v2->_wisdomParameters = v13;

    uint64_t v15 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E4F28FD0]);
    sessionResourcesAccessingLock = v2->_sessionResourcesAccessingLock;
    v2->_sessionResourcesAccessingLock = v15;
  }
  return v2;
}

uint64_t __29__VNFrameworkManager_manager__block_invoke()
{
  +[VNFrameworkManager manager]::ourManager = objc_alloc_init(VNFrameworkManager);

  return MEMORY[0x1F41817F8]();
}

+ (int)runtimeVersion
{
  return +[VNRuntimeUtilities runTimeVersion];
}

@end