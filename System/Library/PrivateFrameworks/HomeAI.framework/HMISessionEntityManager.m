@interface HMISessionEntityManager
+ (id)updatePersonEventWithPersonEvent:(id)a3 sessionEntityUUID:(id)a4 predictedLinkedEntityUUIDs:(id)a5 sessionEntityAssignment:(int64_t)a6;
- (HMISessionEntityManager)init;
- (NSMutableDictionary)sessionEntities;
- (double)faceVIPThresholdForTorsoAnnotation;
- (id)assignSessionEntitiesToPersonEvents:(id)a3 regionOfInterest:(CGRect)a4 timeStamp:(id *)a5 homeUUID:(id)a6;
- (id)assignSessionEntityToFaceRecognition:(id)a3 torsoRecognition:(id)a4 predictedLinkedEntityUUIDs:(id)a5 availableSessionEntityUUIDs:(id)a6 sessionEntityAssignment:(int64_t *)a7;
- (id)clusterSessionEntityToFaceRecognition:(id)a3 torsoRecognition:(id)a4 predictedLinkedEntityUUIDs:(id)a5 availableSessionEntityUUIDs:(id)a6 sessionEntityAssignment:(int64_t *)a7;
- (id)updateTorsoModelAndGetTorsoAnnotationsForHome:(id)a3;
- (void)createSessionEntityWithUUID:(id)a3 faceRecognition:(id)a4 torsoRecognition:(id)a5 predictedLinkedEntityUUIDs:(id)a6 sessionEntityAssignment:(int64_t *)a7;
- (void)submitTorsoprintsToModelManagerForHome:(id)a3 withTorsoAnnotations:(id)a4;
- (void)updatePreviousPrintsForSessionEntityUUID:(id)a3 faceRecognition:(id)a4 torsoRecognition:(id)a5;
@end

@implementation HMISessionEntityManager

- (HMISessionEntityManager)init
{
  v15.receiver = self;
  v15.super_class = (Class)HMISessionEntityManager;
  v2 = [(HMISessionEntityManager *)&v15 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    sessionEntities = v2->_sessionEntities;
    v2->_sessionEntities = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    sessionUUIDToPreviousFaceprints = v2->_sessionUUIDToPreviousFaceprints;
    v2->_sessionUUIDToPreviousFaceprints = (NSMutableDictionary *)v5;

    uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
    sessionUUIDToPreviousTorsoprints = v2->_sessionUUIDToPreviousTorsoprints;
    v2->_sessionUUIDToPreviousTorsoprints = (NSMutableDictionary *)v7;

    v9 = objc_alloc_init(HMIPersonTracker);
    personTracker = v2->_personTracker;
    v2->_personTracker = v9;

    v11 = +[HMIPreference sharedInstance];
    v12 = [v11 numberPreferenceForKey:@"faceVIPThresholdForTorsoAnnotation" defaultValue:&unk_26D9A9A90];
    [v12 doubleValue];
    v2->_faceVIPThresholdForTorsoAnnotation = v13;
  }
  return v2;
}

- (void)submitTorsoprintsToModelManagerForHome:(id)a3 withTorsoAnnotations:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    v8 = +[HMIPersonsModelManager sharedInstance];
    uint64_t v13 = 0;
    [v8 updateTorsoModelForHome:v6 torsoAnnotations:v7 error:&v13];
  }
  else
  {
    v9 = (void *)MEMORY[0x22A641C70]();
    v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      objc_super v15 = v12;
      _os_log_impl(&dword_225DC6000, v11, OS_LOG_TYPE_INFO, "%{public}@No torso annotations -- skipping torso model update", buf, 0xCu);
    }
  }
}

- (id)assignSessionEntitiesToPersonEvents:(id)a3 regionOfInterest:(CGRect)a4 timeStamp:(id *)a5 homeUUID:(id)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v12 = (void *)MEMORY[0x263EFF9C0];
  id v13 = a3;
  v14 = [(HMISessionEntityManager *)self sessionEntities];
  objc_super v15 = [v14 allKeys];
  uint64_t v16 = [v12 setWithArray:v15];

  v17 = [MEMORY[0x263EFF9C0] set];
  v18 = [MEMORY[0x263EFF980] array];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __99__HMISessionEntityManager_assignSessionEntitiesToPersonEvents_regionOfInterest_timeStamp_homeUUID___block_invoke;
  v33[3] = &unk_26477D3A8;
  id v34 = v18;
  v35 = self;
  id v36 = v16;
  id v19 = v17;
  id v37 = v19;
  id v20 = v16;
  id v21 = v18;
  objc_msgSend(v13, "na_each:", v33);

  personTracker = self->_personTracker;
  v23 = (void *)[v21 copy];
  v24 = [v19 allObjects];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v32 = *a5;
  -[HMIPersonTracker trackNewPersons:knownPersons:regionOfInterest:timeStamp:](personTracker, "trackNewPersons:knownPersons:regionOfInterest:timeStamp:", v23, v24, &v32, x, y, width, height);

  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __99__HMISessionEntityManager_assignSessionEntitiesToPersonEvents_regionOfInterest_timeStamp_homeUUID___block_invoke_43;
  v29[3] = &unk_26477D3D0;
  id v30 = v19;
  v31 = self;
  id v25 = v19;
  [v21 enumerateObjectsUsingBlock:v29];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __99__HMISessionEntityManager_assignSessionEntitiesToPersonEvents_regionOfInterest_timeStamp_homeUUID___block_invoke_2;
  v28[3] = &unk_26477D3F8;
  v28[4] = self;
  objc_msgSend(v25, "na_each:", v28);
  v26 = (void *)[v25 copy];

  return v26;
}

void __99__HMISessionEntityManager_assignSessionEntitiesToPersonEvents_regionOfInterest_timeStamp_homeUUID___block_invoke(id *a1, void *a2)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [v3 face];
  if (v4)
  {
    uint64_t v5 = [v3 face];
    id v6 = [v5 faceRecognition];
    if (v6)
    {
      id v7 = [v3 face];
      uint64_t v8 = [v7 faceRecognition];
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  v9 = [v3 torso];
  v10 = [v9 torsoRecognition];
  v11 = [v10 torsoprint];
  if ([v11 unrecognizable])
  {
    uint64_t v12 = 0;
  }
  else
  {
    id v13 = [v3 torso];
    uint64_t v12 = [v13 torsoRecognition];
  }
  if (v8 | v12)
  {
    uint64_t v41 = 0;
    v14 = [MEMORY[0x263EFFA08] set];
    if (v8)
    {
      objc_super v15 = [(id)v8 predictedLinkedEntityUUIDs];

      if (v15)
      {
        uint64_t v16 = [(id)v8 predictedLinkedEntityUUIDs];

        v14 = (void *)v16;
      }
      v17 = [a1[5] assignSessionEntityToFaceRecognition:v8 torsoRecognition:0 predictedLinkedEntityUUIDs:v14 availableSessionEntityUUIDs:a1[6] sessionEntityAssignment:&v41];
      if (!v17)
      {
        v17 = [a1[5] clusterSessionEntityToFaceRecognition:v8 torsoRecognition:0 predictedLinkedEntityUUIDs:v14 availableSessionEntityUUIDs:a1[6] sessionEntityAssignment:&v41];
      }
      if (v17 && v12)
      {
        v18 = (void *)MEMORY[0x22A641C70]();
        id v19 = a1[5];
        id v20 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          id v21 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v45 = v21;
          __int16 v46 = 2112;
          v47 = v17;
          _os_log_impl(&dword_225DC6000, v20, OS_LOG_TYPE_INFO, "%{public}@Adding torso to existing sessionEntityUUID: %@ (face)", buf, 0x16u);
        }
        v22 = [a1[5] sessionEntities];
        v23 = [v22 objectForKeyedSubscript:v17];
        v24 = [(id)v12 torsoprint];
        v43 = v24;
        id v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v43 count:1];
        [v23 addTorsoprints:v25];
      }
      v26 = [(id)v8 predictedLinkedEntityUUIDs];
      int v27 = objc_msgSend(v26, "hmf_isEmpty") ^ 1;

      if (!v17 && v27 && v12)
      {
        uint64_t v28 = [a1[5] clusterSessionEntityToFaceRecognition:0 torsoRecognition:v12 predictedLinkedEntityUUIDs:v14 availableSessionEntityUUIDs:a1[6] sessionEntityAssignment:&v41];
        if (v28)
        {
          v17 = (void *)v28;
          v29 = (void *)MEMORY[0x22A641C70]();
          id v30 = a1[5];
          v31 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            $3CC8671D27C23BF42ADDB32F2B5E48AE v32 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v45 = v32;
            __int16 v46 = 2112;
            v47 = v17;
            _os_log_impl(&dword_225DC6000, v31, OS_LOG_TYPE_INFO, "%{public}@Adding face to existing sessionEntityUUID: %@ (torso)", buf, 0x16u);
          }
          v33 = [a1[5] sessionEntities];
          id v34 = [v33 objectForKeyedSubscript:v17];
          v35 = [(id)v8 faceprint];
          v42 = v35;
          id v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v42 count:1];
          [v34 addFaceprints:v36];

          goto LABEL_39;
        }
LABEL_40:
        [a1[4] addObject:v3];
        goto LABEL_41;
      }
    }
    else
    {
      LOBYTE(v27) = 0;
      v17 = 0;
    }
    if ((v27 & 1) == 0 && v12 && !v17)
    {
      id v37 = [(id)v12 predictedLinkedEntityUUIDs];

      if (v37)
      {
        uint64_t v38 = [(id)v12 predictedLinkedEntityUUIDs];

        v14 = (void *)v38;
      }
      uint64_t v39 = [a1[5] assignSessionEntityToFaceRecognition:0 torsoRecognition:v12 predictedLinkedEntityUUIDs:v14 availableSessionEntityUUIDs:a1[6] sessionEntityAssignment:&v41];
      if (v39)
      {
        v17 = (void *)v39;
        goto LABEL_39;
      }
      v17 = [a1[5] clusterSessionEntityToFaceRecognition:0 torsoRecognition:v12 predictedLinkedEntityUUIDs:v14 availableSessionEntityUUIDs:a1[6] sessionEntityAssignment:&v41];
    }
    if (!v17) {
      goto LABEL_40;
    }
LABEL_39:
    [a1[6] removeObject:v17];
    v40 = +[HMISessionEntityManager updatePersonEventWithPersonEvent:v3 sessionEntityUUID:v17 predictedLinkedEntityUUIDs:v14 sessionEntityAssignment:v41];
    [a1[7] addObject:v40];

LABEL_41:
    goto LABEL_42;
  }
  [a1[4] addObject:v3];
LABEL_42:
}

void __99__HMISessionEntityManager_assignSessionEntitiesToPersonEvents_regionOfInterest_timeStamp_homeUUID___block_invoke_43(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [v5 sessionEntityUUID];

  if (!v6)
  {
    [*(id *)(a1 + 32) addObject:v5];
    goto LABEL_17;
  }
  id v7 = [*(id *)(*(void *)(a1 + 40) + 24) getBlobIDAtIndex:a3];
  uint64_t v8 = [v5 torso];
  v9 = [v8 torsoRecognition];
  v10 = [v9 torsoprint];
  if ([v10 unrecognizable])
  {
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v12 = [v5 torso];
    uint64_t v11 = [v12 torsoRecognition];
  }
  uint64_t v31 = 0;
  id v13 = [MEMORY[0x263EFFA08] set];
  v14 = [v5 face];
  objc_super v15 = [v14 faceRecognition];
  uint64_t v16 = [v15 predictedLinkedEntityUUIDs];
  char v17 = objc_msgSend(v16, "hmf_isEmpty");

  if ((v17 & 1) == 0)
  {
    id v21 = [v5 face];
    v22 = [v21 faceRecognition];
    uint64_t v20 = [v22 predictedLinkedEntityUUIDs];

    id v13 = v21;
    goto LABEL_10;
  }
  v18 = [(id)v11 predictedLinkedEntityUUIDs];
  char v19 = objc_msgSend(v18, "hmf_isEmpty");

  if ((v19 & 1) == 0)
  {
    uint64_t v20 = [(id)v11 predictedLinkedEntityUUIDs];
LABEL_10:

    id v13 = (void *)v20;
  }
  if (!v13)
  {
    id v13 = [MEMORY[0x263EFFA08] set];
  }
  v23 = [v5 face];
  uint64_t v24 = [v23 faceRecognition];
  uint64_t v25 = v24 | v11;

  if (v25)
  {
    v26 = *(void **)(a1 + 40);
    int v27 = [v5 face];
    uint64_t v28 = [v27 faceRecognition];
    [v26 createSessionEntityWithUUID:v7 faceRecognition:v28 torsoRecognition:v11 predictedLinkedEntityUUIDs:v13 sessionEntityAssignment:&v31];

    uint64_t v29 = v31;
  }
  else
  {
    uint64_t v29 = 0;
  }
  id v30 = +[HMISessionEntityManager updatePersonEventWithPersonEvent:v5 sessionEntityUUID:v7 predictedLinkedEntityUUIDs:v13 sessionEntityAssignment:v29];
  [*(id *)(a1 + 32) addObject:v30];

LABEL_17:
}

void __99__HMISessionEntityManager_assignSessionEntitiesToPersonEvents_regionOfInterest_timeStamp_homeUUID___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [v3 sessionEntityUUID];
  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [v3 face];
    id v7 = [v6 faceRecognition];
    uint64_t v8 = [v3 torso];
    v9 = [v8 torsoRecognition];
    [v5 updatePreviousPrintsForSessionEntityUUID:v4 faceRecognition:v7 torsoRecognition:v9];

    v10 = [v3 face];
    uint64_t v11 = [v10 faceRecognition];

    if (v11)
    {
      uint64_t v12 = [v11 predictedLinkedEntityUUIDs];
      int v13 = objc_msgSend(v12, "hmf_isEmpty") ^ 1;
    }
    else
    {
      int v13 = 0;
    }
    v14 = [*(id *)(a1 + 32) sessionEntities];
    objc_super v15 = [v14 objectForKeyedSubscript:v4];

    if (v13)
    {
      uint64_t v16 = [v15 faceRecognition];

      if (v16)
      {
        char v17 = (void *)MEMORY[0x22A641C70]();
        id v18 = *(id *)(a1 + 32);
        char v19 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          uint64_t v20 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          uint64_t v38 = v20;
          __int16 v39 = 2112;
          v40 = v4;
          _os_log_impl(&dword_225DC6000, v19, OS_LOG_TYPE_INFO, "%{public}@Session entity %@ already has a face recognition, skipping subsequent match", buf, 0x16u);
        }
        id v21 = (void *)MEMORY[0x22A641C70]();
        id v22 = *(id *)(a1 + 32);
        v23 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v24 = HMFGetLogIdentifier();
          uint64_t v25 = [v15 faceRecognition];
          *(_DWORD *)buf = 138543618;
          uint64_t v38 = v24;
          __int16 v39 = 2112;
          v40 = v25;
          _os_log_impl(&dword_225DC6000, v23, OS_LOG_TYPE_DEBUG, "%{public}@Existing face classification: %@", buf, 0x16u);
        }
        v26 = (void *)MEMORY[0x22A641C70]();
        id v27 = *(id *)(a1 + 32);
        uint64_t v28 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v29 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          uint64_t v38 = v29;
          __int16 v39 = 2112;
          v40 = v11;
          _os_log_impl(&dword_225DC6000, v28, OS_LOG_TYPE_DEBUG, "%{public}@New face classification: %@", buf, 0x16u);
        }
      }
      else
      {
        id v30 = [v11 classifications];
        v36[0] = MEMORY[0x263EF8330];
        v36[1] = 3221225472;
        v36[2] = __99__HMISessionEntityManager_assignSessionEntitiesToPersonEvents_regionOfInterest_timeStamp_homeUUID___block_invoke_45;
        v36[3] = &unk_26477BAA8;
        v36[4] = *(void *)(a1 + 32);
        int v31 = objc_msgSend(v30, "na_any:", v36);

        if (v31)
        {
          $3CC8671D27C23BF42ADDB32F2B5E48AE v32 = (void *)MEMORY[0x22A641C70]();
          id v33 = *(id *)(a1 + 32);
          id v34 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            v35 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            uint64_t v38 = v35;
            __int16 v39 = 2112;
            v40 = v4;
            __int16 v41 = 2112;
            v42 = v11;
            _os_log_impl(&dword_225DC6000, v34, OS_LOG_TYPE_INFO, "%{public}@Assigning session entity %@ the face classification: %@", buf, 0x20u);
          }
          [v15 setFaceRecognition:v11];
        }
      }
    }
  }
}

BOOL __99__HMISessionEntityManager_assignSessionEntitiesToPersonEvents_regionOfInterest_timeStamp_homeUUID___block_invoke_45(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 confidence];
  double v5 = v4;
  [*(id *)(a1 + 32) faceVIPThresholdForTorsoAnnotation];
  BOOL v7 = v5 >= v6 && [v3 familiarity] == 2;

  return v7;
}

- (id)updateTorsoModelAndGetTorsoAnnotationsForHome:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = (void *)MEMORY[0x22A641C70]();
  double v6 = self;
  BOOL v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v22 = v8;
    __int16 v23 = 2112;
    id v24 = v4;
    _os_log_impl(&dword_225DC6000, v7, OS_LOG_TYPE_DEBUG, "%{public}@updateTorsoModelAndGetTorsoAnnotationsForHome: %@", buf, 0x16u);
  }
  v9 = [MEMORY[0x263EFF980] array];
  v10 = [(HMISessionEntityManager *)v6 sessionEntities];
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  char v17 = __73__HMISessionEntityManager_updateTorsoModelAndGetTorsoAnnotationsForHome___block_invoke;
  id v18 = &unk_26477D420;
  char v19 = v6;
  id v11 = v9;
  id v20 = v11;
  objc_msgSend(v10, "na_each:", &v15);

  if ((objc_msgSend(v11, "hmf_isEmpty", v15, v16, v17, v18, v19) & 1) == 0)
  {
    uint64_t v12 = (void *)[v11 copy];
    [(HMISessionEntityManager *)v6 submitTorsoprintsToModelManagerForHome:v4 withTorsoAnnotations:v12];
  }
  int v13 = (void *)[v11 copy];

  return v13;
}

void __73__HMISessionEntityManager_updateTorsoModelAndGetTorsoAnnotationsForHome___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v6 faceRecognition];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v9 = [v6 torsoprints];
    char v10 = objc_msgSend(v9, "hmf_isEmpty");

    if ((v10 & 1) == 0)
    {
      id v11 = (void *)MEMORY[0x22A641C70]();
      id v12 = *(id *)(a1 + 32);
      int v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = HMFGetLogIdentifier();
        uint64_t v15 = [v6 torsoprints];
        int v20 = 138543618;
        id v21 = v14;
        __int16 v22 = 2048;
        uint64_t v23 = [v15 count];
        _os_log_impl(&dword_225DC6000, v13, OS_LOG_TYPE_INFO, "%{public}@Creating torso annotation with %lu torsoprints", (uint8_t *)&v20, 0x16u);
      }
      uint64_t v16 = [HMITorsoAnnotation alloc];
      char v17 = [v6 faceRecognition];
      id v18 = [v6 torsoprints];
      char v19 = [(HMITorsoAnnotation *)v16 initWithFaceRecognition:v17 torsoprints:v18];

      [*(id *)(a1 + 40) addObject:v19];
      [v6 flushTorsoprints];
    }
  }
}

- (id)assignSessionEntityToFaceRecognition:(id)a3 torsoRecognition:(id)a4 predictedLinkedEntityUUIDs:(id)a5 availableSessionEntityUUIDs:(id)a6 sessionEntityAssignment:(int64_t *)a7
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  unint64_t v12 = (unint64_t)a3;
  unint64_t v13 = (unint64_t)a4;
  id v14 = a5;
  id v15 = a6;
  if (!(v12 | v13)) {
    _HMFPreconditionFailure();
  }
  v44 = a7;
  uint64_t v67 = 0;
  v68 = &v67;
  uint64_t v69 = 0x3032000000;
  v70 = __Block_byref_object_copy__5;
  v71 = __Block_byref_object_dispose__5;
  id v72 = 0;
  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x3032000000;
  v64 = __Block_byref_object_copy__5;
  v65 = __Block_byref_object_dispose__5;
  id v66 = 0;
  uint64_t v57 = 0;
  v58 = (float *)&v57;
  uint64_t v59 = 0x2020000000;
  int v60 = 2139095039;
  uint64_t v16 = v15;
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x2020000000;
  char v56 = 1;
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __160__HMISessionEntityManager_assignSessionEntityToFaceRecognition_torsoRecognition_predictedLinkedEntityUUIDs_availableSessionEntityUUIDs_sessionEntityAssignment___block_invoke;
  v45[3] = &unk_26477D448;
  uint64_t v43 = self;
  v45[4] = self;
  id v17 = v14;
  id v46 = v17;
  id v18 = (id)v12;
  id v47 = v18;
  id v19 = (id)v13;
  id v48 = v19;
  v49 = &v57;
  v50 = &v53;
  v51 = &v67;
  v52 = &v61;
  uint64_t v20 = objc_msgSend(v16, "na_each:", v45);
  id v21 = (void *)v68[5];
  if (v21)
  {
    if (*((unsigned char *)v54 + 24)) {
      __int16 v22 = &kHMIPersonTrackerFaceDistanceMinThreshold;
    }
    else {
      __int16 v22 = &kHMIPersonTrackerTorsoDistanceMinThreshold;
    }
    if (v58[6] < *(float *)v22)
    {
      if (v12)
      {
        uint64_t v23 = (void *)MEMORY[0x22A641C70](v20);
        uint64_t v24 = v43;
        HMFGetOSLogHandle();
        uint64_t v25 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          v26 = HMFGetLogIdentifier();
          uint64_t v27 = v68[5];
          *(_DWORD *)buf = 138543618;
          v76 = v26;
          __int16 v77 = 2112;
          uint64_t v78 = v27;
          _os_log_impl(&dword_225DC6000, v25, OS_LOG_TYPE_INFO, "%{public}@Adding face to existing sessionEntityUUID: %@ (VIP)", buf, 0x16u);
        }
        uint64_t v28 = (void *)v62[5];
        uint64_t v29 = [v18 faceprint];
        v74 = v29;
        id v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v74 count:1];
        [v28 addFaceprints:v30];
      }
      if (v13)
      {
        int v31 = (void *)MEMORY[0x22A641C70](v20);
        $3CC8671D27C23BF42ADDB32F2B5E48AE v32 = v43;
        HMFGetOSLogHandle();
        id v33 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          id v34 = HMFGetLogIdentifier();
          uint64_t v35 = v68[5];
          *(_DWORD *)buf = 138543618;
          v76 = v34;
          __int16 v77 = 2112;
          uint64_t v78 = v35;
          _os_log_impl(&dword_225DC6000, v33, OS_LOG_TYPE_INFO, "%{public}@Adding torso to existing sessionEntityUUID: %@ (VIP)", buf, 0x16u);
        }
        id v36 = (void *)v62[5];
        id v37 = [v19 torsoprint];
        v73 = v37;
        uint64_t v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v73 count:1];
        [v36 addTorsoprints:v38];
      }
    }
    __int16 v39 = (void *)v62[5];
    v40 = objc_msgSend(v17, "allObjects", v43);
    [v39 addLinkedEntityUUIDs:v40];

    int64_t *v44 = 1;
    id v21 = (void *)v68[5];
  }
  id v41 = v21;

  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v61, 8);

  _Block_object_dispose(&v67, 8);
  return v41;
}

void __160__HMISessionEntityManager_assignSessionEntityToFaceRecognition_torsoRecognition_predictedLinkedEntityUUIDs_availableSessionEntityUUIDs_sessionEntityAssignment___block_invoke(uint64_t a1, void *a2)
{
  id v21 = a2;
  id v4 = [*(id *)(a1 + 32) sessionEntities];
  id v5 = [v4 objectForKeyedSubscript:v21];

  id v6 = *(void **)(a1 + 40);
  uint64_t v7 = [v5 linkedEntityUUIDs];
  LODWORD(v6) = [v6 intersectsSet:v7];

  if (v6)
  {
    if (*(void *)(a1 + 48) && [v5 faceCount])
    {
      uint64_t v8 = [*(id *)(a1 + 48) faceprint];
      v9 = [v8 data];
      char v10 = [v5 faceCentroid];
      id v11 = [v10 data];
      +[HMIGreedyClustering faceDistanceFromDescriptor:v9 toDescriptor:v11];
      float v13 = v12;
    }
    else
    {
      float v13 = 3.4028e38;
    }
    if (*(void *)(a1 + 56) && [v5 torsoCount])
    {
      id v14 = [*(id *)(a1 + 56) torsoprint];
      id v15 = [v14 data];
      uint64_t v16 = [v5 torsoCentroid];
      id v17 = [v16 data];
      +[HMIGreedyClustering faceDistanceFromDescriptor:v15 toDescriptor:v17];
      float v19 = v18;
    }
    else
    {
      float v19 = 3.4028e38;
    }
    float v20 = v13 >= v19 ? v19 : v13;
    if (v20 < *(float *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v13 <= v19;
      *(float *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v20;
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), a2);
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), v5);
    }
  }
}

- (id)clusterSessionEntityToFaceRecognition:(id)a3 torsoRecognition:(id)a4 predictedLinkedEntityUUIDs:(id)a5 availableSessionEntityUUIDs:(id)a6 sessionEntityAssignment:(int64_t *)a7
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  unint64_t v12 = (unint64_t)a3;
  unint64_t v13 = (unint64_t)a4;
  id v36 = a5;
  id v14 = a6;
  if (!(v12 | v13)) {
    _HMFPreconditionFailure();
  }
  id v15 = v14;
  uint64_t v59 = 0;
  int v60 = &v59;
  uint64_t v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__5;
  uint64_t v63 = __Block_byref_object_dispose__5;
  id v64 = 0;
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3032000000;
  char v56 = __Block_byref_object_copy__5;
  uint64_t v57 = __Block_byref_object_dispose__5;
  id v58 = 0;
  uint64_t v49 = 0;
  v50 = (float *)&v49;
  uint64_t v51 = 0x2020000000;
  int v52 = 2139095039;
  uint64_t v45 = 0;
  id v46 = (float *)&v45;
  uint64_t v47 = 0x2020000000;
  int v48 = 2139095039;
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __161__HMISessionEntityManager_clusterSessionEntityToFaceRecognition_torsoRecognition_predictedLinkedEntityUUIDs_availableSessionEntityUUIDs_sessionEntityAssignment___block_invoke;
  v37[3] = &unk_26477D4C0;
  id v16 = (id)v12;
  id v38 = v16;
  __int16 v39 = self;
  id v41 = &v49;
  v42 = &v59;
  id v17 = (id)v13;
  id v40 = v17;
  uint64_t v43 = &v45;
  v44 = &v53;
  objc_msgSend(v15, "na_each:", v37);
  if (v50[6] >= 0.17)
  {
    if (v46[6] >= 0.15)
    {
      id v19 = 0;
      goto LABEL_17;
    }
    *a7 = 3;
    float v18 = v54;
  }
  else
  {
    *a7 = 3;
    float v18 = v60;
  }
  id v19 = (id)v18[5];
  if (v19)
  {
    float v20 = [(HMISessionEntityManager *)self sessionEntities];
    id v21 = [v20 objectForKeyedSubscript:v19];

    if (v12)
    {
      context = (void *)MEMORY[0x22A641C70]();
      __int16 v22 = self;
      HMFGetOSLogHandle();
      uint64_t v23 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        uint64_t v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v68 = v24;
        __int16 v69 = 2112;
        id v70 = v19;
        _os_log_impl(&dword_225DC6000, v23, OS_LOG_TYPE_INFO, "%{public}@Adding face to existing sessionEntityUUID: %@ (NN)", buf, 0x16u);
      }
      uint64_t v25 = [v16 faceprint];
      id v66 = v25;
      v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v66 count:1];
      [v21 addFaceprints:v26];
    }
    if (v13)
    {
      uint64_t v27 = (void *)MEMORY[0x22A641C70]();
      uint64_t v28 = self;
      HMFGetOSLogHandle();
      uint64_t v29 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        id v30 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v68 = v30;
        __int16 v69 = 2112;
        id v70 = v19;
        _os_log_impl(&dword_225DC6000, v29, OS_LOG_TYPE_INFO, "%{public}@Adding torso to existing sessionEntityUUID: %@ (NN)", buf, 0x16u);
      }
      int v31 = [v17 torsoprint];
      v65 = v31;
      $3CC8671D27C23BF42ADDB32F2B5E48AE v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v65 count:1];
      [v21 addTorsoprints:v32];
    }
    id v33 = [v36 allObjects];
    [v21 addLinkedEntityUUIDs:v33];
  }
LABEL_17:

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);

  _Block_object_dispose(&v59, 8);
  return v19;
}

void __161__HMISessionEntityManager_clusterSessionEntityToFaceRecognition_torsoRecognition_predictedLinkedEntityUUIDs_availableSessionEntityUUIDs_sessionEntityAssignment___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32))
  {
    id v4 = [*(id *)(*(void *)(a1 + 40) + 8) objectForKeyedSubscript:v3];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __161__HMISessionEntityManager_clusterSessionEntityToFaceRecognition_torsoRecognition_predictedLinkedEntityUUIDs_availableSessionEntityUUIDs_sessionEntityAssignment___block_invoke_2;
    v10[3] = &unk_26477D470;
    id v11 = *(id *)(a1 + 32);
    long long v13 = *(_OWORD *)(a1 + 56);
    id v12 = v3;
    objc_msgSend(v4, "na_each:", v10);
  }
  if (*(void *)(a1 + 48))
  {
    id v5 = [*(id *)(*(void *)(a1 + 40) + 16) objectForKeyedSubscript:v3];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __161__HMISessionEntityManager_clusterSessionEntityToFaceRecognition_torsoRecognition_predictedLinkedEntityUUIDs_availableSessionEntityUUIDs_sessionEntityAssignment___block_invoke_3;
    v6[3] = &unk_26477D498;
    id v7 = *(id *)(a1 + 48);
    long long v9 = *(_OWORD *)(a1 + 72);
    id v8 = v3;
    objc_msgSend(v5, "na_each:", v6);
  }
}

void __161__HMISessionEntityManager_clusterSessionEntityToFaceRecognition_torsoRecognition_predictedLinkedEntityUUIDs_availableSessionEntityUUIDs_sessionEntityAssignment___block_invoke_2(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  id v5 = [v3 faceprint];
  id v6 = [v5 data];
  id v7 = [v4 data];

  +[HMIGreedyClustering faceDistanceFromDescriptor:v6 toDescriptor:v7];
  float v9 = v8;

  uint64_t v10 = *(void *)(a1[6] + 8);
  if (v9 < *(float *)(v10 + 24))
  {
    *(float *)(v10 + 24) = v9;
    id v11 = (void *)a1[5];
    id v12 = (id *)(*(void *)(a1[7] + 8) + 40);
    objc_storeStrong(v12, v11);
  }
}

void __161__HMISessionEntityManager_clusterSessionEntityToFaceRecognition_torsoRecognition_predictedLinkedEntityUUIDs_availableSessionEntityUUIDs_sessionEntityAssignment___block_invoke_3(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  id v5 = [v3 torsoprint];
  id v6 = [v5 data];
  id v7 = [v4 data];

  +[HMIGreedyClustering faceDistanceFromDescriptor:v6 toDescriptor:v7];
  float v9 = v8;

  uint64_t v10 = *(void *)(a1[6] + 8);
  if (v9 < *(float *)(v10 + 24))
  {
    *(float *)(v10 + 24) = v9;
    id v11 = (void *)a1[5];
    id v12 = (id *)(*(void *)(a1[7] + 8) + 40);
    objc_storeStrong(v12, v11);
  }
}

- (void)createSessionEntityWithUUID:(id)a3 faceRecognition:(id)a4 torsoRecognition:(id)a5 predictedLinkedEntityUUIDs:(id)a6 sessionEntityAssignment:(int64_t *)a7
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v12 = a3;
  unint64_t v13 = (unint64_t)a4;
  unint64_t v14 = (unint64_t)a5;
  id v15 = a6;
  if (!(v13 | v14)) {
    _HMFPreconditionFailure();
  }
  id v16 = v15;
  id v17 = [(HMISessionEntityManager *)self sessionEntities];
  float v18 = [v17 objectForKeyedSubscript:v12];

  if (!v18)
  {
    *a7 = 5;
    $3CC8671D27C23BF42ADDB32F2B5E48AE v32 = [(HMISessionEntityManager *)self sessionEntities];
    unint64_t v33 = [v32 count];

    if (v33 > 0x3B) {
      goto LABEL_26;
    }
    if (v13)
    {
      id v34 = (void *)MEMORY[0x22A641C70]();
      uint64_t v35 = self;
      id v36 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        id v37 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        int v60 = v37;
        __int16 v61 = 2112;
        id v62 = v12;
        _os_log_impl(&dword_225DC6000, v36, OS_LOG_TYPE_INFO, "%{public}@Adding new face sessionEntityUUID: %@", buf, 0x16u);
      }
      id v38 = [HMIMutableCluster alloc];
      __int16 v39 = [(id)v13 faceprint];
      id v40 = [(HMIMutableCluster *)v38 initWithFaceprint:v39];

      if (!v14) {
        goto LABEL_25;
      }
      uint64_t v55 = v16;
      id v41 = (void *)MEMORY[0x22A641C70]();
      v42 = v35;
      uint64_t v43 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        v44 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        int v60 = v44;
        __int16 v61 = 2112;
        id v62 = v12;
        _os_log_impl(&dword_225DC6000, v43, OS_LOG_TYPE_INFO, "%{public}@Adding new torso sessionEntityUUID: %@", buf, 0x16u);
      }
      uint64_t v45 = [(id)v14 torsoprint];
      char v56 = v45;
      id v46 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v56 count:1];
      [(HMIMutableCluster *)v40 addTorsoprints:v46];

      id v16 = v55;
    }
    else
    {
      if (!v14)
      {
        id v40 = 0;
        goto LABEL_25;
      }
      uint64_t v47 = (void *)MEMORY[0x22A641C70]();
      int v48 = self;
      uint64_t v49 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        v50 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        int v60 = v50;
        __int16 v61 = 2112;
        id v62 = v12;
        _os_log_impl(&dword_225DC6000, v49, OS_LOG_TYPE_INFO, "%{public}@Adding new torso sessionEntityUUID: %@", buf, 0x16u);
      }
      uint64_t v51 = [HMIMutableCluster alloc];
      uint64_t v45 = [(id)v14 torsoprint];
      id v40 = [(HMIMutableCluster *)v51 initWithTorsoprint:v45];
    }

LABEL_25:
    int v52 = [v16 allObjects];
    [(HMIMutableCluster *)v40 addLinkedEntityUUIDs:v52];

    uint64_t v53 = [(HMISessionEntityManager *)self sessionEntities];
    [v53 setObject:v40 forKeyedSubscript:v12];

    goto LABEL_26;
  }
  if (v13)
  {
    v54 = v16;
    id v19 = (void *)MEMORY[0x22A641C70]();
    float v20 = self;
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      __int16 v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      int v60 = v22;
      __int16 v61 = 2112;
      id v62 = v12;
      _os_log_impl(&dword_225DC6000, v21, OS_LOG_TYPE_INFO, "%{public}@Adding face to existing sessionEntityUUID: %@ (track)", buf, 0x16u);
    }
    uint64_t v23 = [(id)v13 faceprint];
    id v58 = v23;
    uint64_t v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v58 count:1];
    [v18 addFaceprints:v24];

    id v16 = v54;
  }
  if (v14)
  {
    uint64_t v25 = (void *)MEMORY[0x22A641C70]();
    v26 = self;
    uint64_t v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      uint64_t v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      int v60 = v28;
      __int16 v61 = 2112;
      id v62 = v12;
      _os_log_impl(&dword_225DC6000, v27, OS_LOG_TYPE_INFO, "%{public}@Adding torso to existing sessionEntityUUID: %@ (track)", buf, 0x16u);
    }
    uint64_t v29 = [(id)v14 torsoprint];
    uint64_t v57 = v29;
    id v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v57 count:1];
    [v18 addTorsoprints:v30];
  }
  int v31 = [v16 allObjects];
  [v18 addLinkedEntityUUIDs:v31];

  *a7 = 2;
LABEL_26:
}

- (void)updatePreviousPrintsForSessionEntityUUID:(id)a3 faceRecognition:(id)a4 torsoRecognition:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v8)
  {
    uint64_t v10 = [(NSMutableDictionary *)self->_sessionUUIDToPreviousFaceprints objectForKeyedSubscript:v16];
    if (v10)
    {
      id v11 = v10;
      if ([v10 count] == 5) {
        [v11 removeObjectAtIndex:0];
      }
    }
    else
    {
      id v11 = [MEMORY[0x263EFF980] array];
      [(NSMutableDictionary *)self->_sessionUUIDToPreviousFaceprints setObject:v11 forKeyedSubscript:v16];
    }
    id v12 = [v8 faceprint];
    [v11 addObject:v12];
  }
  if (v9)
  {
    unint64_t v13 = [(NSMutableDictionary *)self->_sessionUUIDToPreviousTorsoprints objectForKeyedSubscript:v16];
    if (v13)
    {
      unint64_t v14 = v13;
      if ([v13 count] == 5) {
        [v14 removeObjectAtIndex:0];
      }
    }
    else
    {
      unint64_t v14 = [MEMORY[0x263EFF980] array];
      [(NSMutableDictionary *)self->_sessionUUIDToPreviousTorsoprints setObject:v14 forKeyedSubscript:v16];
    }
    id v15 = [v9 torsoprint];
    [v14 addObject:v15];
  }
}

+ (id)updatePersonEventWithPersonEvent:(id)a3 sessionEntityUUID:(id)a4 predictedLinkedEntityUUIDs:(id)a5 sessionEntityAssignment:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  unint64_t v13 = [v10 face];
  uint64_t v14 = [v10 face];
  if (v14)
  {
    id v15 = (void *)v14;
    id v16 = [v10 face];
    id v17 = [v16 faceRecognition];

    if (v17)
    {
      float v18 = [v10 face];
      id v19 = [v18 faceRecognition];

      float v20 = [v19 classifications];
      v92[0] = MEMORY[0x263EF8330];
      v92[1] = 3221225472;
      v92[2] = __129__HMISessionEntityManager_updatePersonEventWithPersonEvent_sessionEntityUUID_predictedLinkedEntityUUIDs_sessionEntityAssignment___block_invoke;
      v92[3] = &unk_26477D4E8;
      id v21 = v11;
      id v93 = v21;
      id v94 = a1;
      v85 = objc_msgSend(v20, "na_map:", v92);

      __int16 v22 = [HMIFaceRecognition alloc];
      v86 = v19;
      uint64_t v23 = [v19 faceCrop];
      [v19 faceprint];
      uint64_t v24 = v90 = v13;
      [v19 faceQualityScore];
      v82 = -[HMIFaceRecognition initWithFaceCrop:faceprint:classifications:predictedLinkedEntityUUIDs:faceQualityScore:sessionEntityAssignment:sessionEntityUUID:](v22, "initWithFaceCrop:faceprint:classifications:predictedLinkedEntityUUIDs:faceQualityScore:sessionEntityAssignment:sessionEntityUUID:", v23, v24, v85, v12, a6, v21);

      v80 = [HMIVideoAnalyzerEventFace alloc];
      v84 = [v10 face];
      [v84 confidence];
      uint64_t v79 = v88 = v11;
      v83 = [v10 face];
      [v83 boundingBox];
      double v26 = v25;
      double v28 = v27;
      double v30 = v29;
      double v32 = v31;
      unint64_t v33 = [v10 face];
      id v34 = [v33 yaw];
      uint64_t v35 = [v10 face];
      [v35 roll];
      v37 = id v36 = v12;
      [v10 face];
      v39 = int64_t v38 = a6;
      id v40 = [v39 userInfo];
      uint64_t v81 = -[HMIVideoAnalyzerEventFace initWithConfidence:boundingBox:yaw:roll:faceRecognition:torsoAnnotation:userInfo:](v80, "initWithConfidence:boundingBox:yaw:roll:faceRecognition:torsoAnnotation:userInfo:", v79, v34, v37, v82, 0, v40, v26, v28, v30, v32);

      a6 = v38;
      id v12 = v36;

      id v11 = v88;
      unint64_t v13 = (void *)v81;
    }
  }
  id v41 = [v10 torso];
  uint64_t v42 = [v10 torso];
  if (v42)
  {
    uint64_t v43 = (void *)v42;
    v44 = [v10 torso];
    uint64_t v45 = [v44 torsoRecognition];

    if (v45)
    {
      id v89 = v12;
      v91 = v13;
      id v46 = [v10 torso];
      uint64_t v47 = [v46 torsoRecognition];
      int v48 = [v47 torsoprint];
      char v49 = [v48 unrecognizable];

      if (v49)
      {
        v50 = 0;
      }
      else
      {
        uint64_t v51 = [v10 torso];
        int v52 = [v51 torsoRecognition];

        uint64_t v53 = [HMITorsoClassification alloc];
        v54 = [v52 classification];
        uint64_t v55 = [v54 personUUID];
        char v56 = [v52 classification];
        uint64_t v57 = [v56 sourceUUID];
        [v52 classification];
        id v58 = v87 = a6;
        [v58 confidence];
        uint64_t v59 = -[HMITorsoClassification initWithPersonUUID:sourceUUID:confidence:](v53, "initWithPersonUUID:sourceUUID:confidence:", v55, v57);

        int v60 = [HMITorsoRecognition alloc];
        __int16 v61 = [v52 torsoprint];
        v50 = [(HMITorsoRecognition *)v60 initWithTorsoprint:v61 classification:v59 predictedLinkedEntityUUIDs:v89 sessionEntityAssignment:v87 sessionEntityUUID:v11];
      }
      id v62 = [HMIVideoAnalyzerEventTorso alloc];
      uint64_t v63 = [v10 torso];
      id v64 = [v63 confidence];
      v65 = [v10 torso];
      [v65 boundingBox];
      double v67 = v66;
      double v69 = v68;
      double v71 = v70;
      double v73 = v72;
      v74 = [v10 torso];
      v75 = [v74 roll];
      uint64_t v76 = -[HMIVideoAnalyzerEventTorso initWithConfidence:boundingBox:roll:torsoRecognition:](v62, "initWithConfidence:boundingBox:roll:torsoRecognition:", v64, v75, v50, v67, v69, v71, v73);

      id v41 = (void *)v76;
      id v12 = v89;
      unint64_t v13 = v91;
    }
  }
  __int16 v77 = (void *)[v10 copyWithFaceEvent:v13 torso:v41];

  return v77;
}

HMIFaceClassification *__129__HMISessionEntityManager_updatePersonEventWithPersonEvent_sessionEntityUUID_predictedLinkedEntityUUIDs_sessionEntityAssignment___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [HMIFaceClassification alloc];
  id v5 = [v3 personUUID];
  id v6 = [v3 sourceUUID];
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = [v3 faceCrop];
  id v9 = [v3 faceprint];
  [v3 confidence];
  id v11 = -[HMIFaceClassification initWithUUID:sourceUUID:sessionEntityUUID:faceCrop:faceprint:confidence:fromTorsoClassification:familiarity:](v4, "initWithUUID:sourceUUID:sessionEntityUUID:faceCrop:faceprint:confidence:fromTorsoClassification:familiarity:", v5, v6, v7, v8, v9, [v3 fromTorsoClassification], v10, objc_msgSend(v3, "familiarity"));

  id v12 = (void *)MEMORY[0x22A641C70]();
  id v13 = *(id *)(a1 + 40);
  uint64_t v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    float v18 = v15;
    __int16 v19 = 2112;
    float v20 = v11;
    _os_log_impl(&dword_225DC6000, v14, OS_LOG_TYPE_INFO, "%{public}@%@", buf, 0x16u);
  }

  return v11;
}

- (NSMutableDictionary)sessionEntities
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (double)faceVIPThresholdForTorsoAnnotation
{
  return self->_faceVIPThresholdForTorsoAnnotation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionEntities, 0);
  objc_storeStrong((id *)&self->_personTracker, 0);
  objc_storeStrong((id *)&self->_sessionUUIDToPreviousTorsoprints, 0);
  objc_storeStrong((id *)&self->_sessionUUIDToPreviousFaceprints, 0);
}

@end