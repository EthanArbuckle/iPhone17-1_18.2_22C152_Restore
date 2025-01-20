@interface HUFaceRecognitionAddPersonItemManager
- (HFHomePersonItemProvider)homePersonItemProvider;
- (HFPhotosPersonItemProvider)photosPersonItemProvider;
- (HMCameraProfile)cameraProfile;
- (HMCameraSignificantEvent)significantEvent;
- (HMFaceClassification)faceClassification;
- (HMHome)overrideHome;
- (HMPersonManager)personManager;
- (HUFaceRecognitionAddPersonItemManager)initWithDelegate:(id)a3;
- (HUFaceRecognitionAddPersonItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4;
- (HUFaceRecognitionAddPersonItemManager)initWithSignificantEvent:(id)a3 home:(id)a4 delegate:(id)a5;
- (NAFuture)faceCropImageFuture;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)_homeFuture;
- (id)associateFaceClassificationWithExistingPerson:(id)a3;
- (id)associateFaceClassificationWithNewPersonNamed:(id)a3;
@end

@implementation HUFaceRecognitionAddPersonItemManager

- (HUFaceRecognitionAddPersonItemManager)initWithSignificantEvent:(id)a3 home:(id)a4 delegate:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v9 = (HUFaceRecognitionAddPersonItemManager *)a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [(HUFaceRecognitionAddPersonItemManager *)v9 faceClassification];

  if (!v10 || !v12) {
    NSLog(&cfstr_FaceClassifica_0.isa, v9, v10);
  }
  v30.receiver = self;
  v30.super_class = (Class)HUFaceRecognitionAddPersonItemManager;
  v13 = [(HFItemManager *)&v30 initWithDelegate:v11 sourceItem:0];
  if (v13)
  {
    v14 = HFLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v32 = v13;
      __int16 v33 = 2112;
      v34 = v9;
      _os_log_impl(&dword_1BE345000, v14, OS_LOG_TYPE_DEFAULT, "%@: Initialized with significant event:%@", buf, 0x16u);
    }

    objc_storeStrong((id *)&v13->_significantEvent, a3);
    uint64_t v15 = objc_msgSend(v10, "hf_cameraProfileForSignificantEvent:", v9);
    cameraProfile = v13->_cameraProfile;
    v13->_cameraProfile = (HMCameraProfile *)v15;

    v17 = [(HUFaceRecognitionAddPersonItemManager *)v9 faceClassification];

    if (v17)
    {
      uint64_t v18 = [objc_alloc(MEMORY[0x1E4F691B0]) initWithHome:v10];
      homePersonItemProvider = v13->_homePersonItemProvider;
      v13->_homePersonItemProvider = (HFHomePersonItemProvider *)v18;

      [(HFHomePersonItemProvider *)v13->_homePersonItemProvider setFilter:&__block_literal_global_265];
      id v20 = objc_alloc(MEMORY[0x1E4F693A0]);
      v21 = [v10 currentUser];
      uint64_t v22 = [v20 initWithHome:v10 forUser:v21];
      photosPersonItemProvider = v13->_photosPersonItemProvider;
      v13->_photosPersonItemProvider = (HFPhotosPersonItemProvider *)v22;

      [(HFPhotosPersonItemProvider *)v13->_photosPersonItemProvider setFilter:&__block_literal_global_8_3];
    }
    else
    {
      v24 = HFLogForCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v9;
        _os_log_error_impl(&dword_1BE345000, v24, OS_LOG_TYPE_ERROR, "Face classification is nil on significant event %@", buf, 0xCu);
      }
    }
    v25 = [(HUFaceRecognitionAddPersonItemManager *)v13 faceClassification];
    v26 = [v25 personManagerUUID];
    uint64_t v27 = objc_msgSend(v10, "hf_personManagerWithIdentifier:", v26);
    personManager = v13->_personManager;
    v13->_personManager = (HMPersonManager *)v27;

    objc_storeStrong((id *)&v13->_overrideHome, a4);
  }

  return v13;
}

BOOL __80__HUFaceRecognitionAddPersonItemManager_initWithSignificantEvent_home_delegate___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  v6 = [v5 name];
  BOOL v7 = [v6 length] != 0;

  return v7;
}

BOOL __80__HUFaceRecognitionAddPersonItemManager_initWithSignificantEvent_home_delegate___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  v6 = [v5 name];
  BOOL v7 = [v6 length] != 0;

  return v7;
}

- (HUFaceRecognitionAddPersonItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  BOOL v7 = NSStringFromSelector(sel_initWithSignificantEvent_home_delegate_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUFaceRecognitionAddPersonItemManager.m", 69, @"%s is unavailable; use %@ instead",
    "-[HUFaceRecognitionAddPersonItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HUFaceRecognitionAddPersonItemManager)initWithDelegate:(id)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithSignificantEvent_home_delegate_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUFaceRecognitionAddPersonItemManager.m", 74, @"%s is unavailable; use %@ instead",
    "-[HUFaceRecognitionAddPersonItemManager initWithDelegate:]",
    v6);

  return 0;
}

- (HMFaceClassification)faceClassification
{
  id v2 = [(HUFaceRecognitionAddPersonItemManager *)self significantEvent];
  id v3 = [v2 faceClassification];

  return (HMFaceClassification *)v3;
}

- (NAFuture)faceCropImageFuture
{
  id v3 = [(HUFaceRecognitionAddPersonItemManager *)self cameraProfile];
  v4 = [(HUFaceRecognitionAddPersonItemManager *)self significantEvent];
  id v5 = objc_msgSend(v3, "hf_faceCropImageForSignificantEvent:", v4);

  return (NAFuture *)v5;
}

- (id)associateFaceClassificationWithNewPersonNamed:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(HUFaceRecognitionAddPersonItemManager *)self faceClassification];
    *(_DWORD *)buf = 138412802;
    uint64_t v15 = self;
    __int16 v16 = 2112;
    v17 = v6;
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@: Associating %@ with new person named %@", buf, 0x20u);
  }
  BOOL v7 = [(HUFaceRecognitionAddPersonItemManager *)self personManager];
  v8 = [(HUFaceRecognitionAddPersonItemManager *)self faceClassification];
  v9 = [v8 person];
  id v10 = objc_msgSend(v7, "hf_namePerson:name:", v9, v4);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __87__HUFaceRecognitionAddPersonItemManager_associateFaceClassificationWithNewPersonNamed___block_invoke;
  v13[3] = &unk_1E6391688;
  v13[4] = self;
  id v11 = [v10 flatMap:v13];

  return v11;
}

id __87__HUFaceRecognitionAddPersonItemManager_associateFaceClassificationWithNewPersonNamed___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 personManager];
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  BOOL v7 = [*(id *)(a1 + 32) faceClassification];
  v8 = [v7 faceCrop];
  v9 = [v8 UUID];
  id v10 = objc_msgSend(v6, "na_setWithSafeObject:", v9);
  id v11 = [v4 UUID];

  v12 = objc_msgSend(v5, "hf_associateFaceCropsWithUUIDs:toPersonWithUUID:", v10, v11);

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __87__HUFaceRecognitionAddPersonItemManager_associateFaceClassificationWithNewPersonNamed___block_invoke_2;
  v15[3] = &unk_1E6387DC8;
  v15[4] = *(void *)(a1 + 32);
  id v13 = (id)[v12 addSuccessBlock:v15];

  return v12;
}

void __87__HUFaceRecognitionAddPersonItemManager_associateFaceClassificationWithNewPersonNamed___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __87__HUFaceRecognitionAddPersonItemManager_associateFaceClassificationWithNewPersonNamed___block_invoke_3;
  v3[3] = &unk_1E638CE18;
  v3[4] = *(void *)(a1 + 32);
  [v2 dispatchCameraObserverMessage:v3 sender:0];
}

void __87__HUFaceRecognitionAddPersonItemManager_associateFaceClassificationWithNewPersonNamed___block_invoke_3(uint64_t a1, void *a2)
{
  id v8 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 32) cameraProfile];
    id v4 = [v3 clipManager];
    id v5 = (void *)MEMORY[0x1E4F1CAD0];
    v6 = [*(id *)(a1 + 32) significantEvent];
    BOOL v7 = [v5 setWithObject:v6];
    [v8 clipManager:v4 didUpdateSignificantEvents:v7];
  }
}

- (id)associateFaceClassificationWithExistingPerson:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(HUFaceRecognitionAddPersonItemManager *)self faceClassification];
    *(_DWORD *)buf = 138412802;
    v41 = self;
    __int16 v42 = 2112;
    v43 = v6;
    __int16 v44 = 2112;
    id v45 = v4;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@: Associating %@ with existing person %@", buf, 0x20u);
  }
  BOOL v7 = [v4 person];
  id v8 = [v4 latestResults];
  v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F68868]];
  int v10 = [v9 BOOLValue];

  id v11 = [(HUFaceRecognitionAddPersonItemManager *)self faceClassification];
  v12 = [v11 person];

  if (v12)
  {
    id v13 = [(HUFaceRecognitionAddPersonItemManager *)self personManager];
    v14 = [(HUFaceRecognitionAddPersonItemManager *)self faceClassification];
    uint64_t v15 = [v14 person];
    __int16 v16 = v15;
    if (!v10)
    {
      v23 = [v7 name];
      v24 = objc_msgSend(v13, "hf_namePerson:name:", v16, v23);
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __87__HUFaceRecognitionAddPersonItemManager_associateFaceClassificationWithExistingPerson___block_invoke;
      v37[3] = &unk_1E63916B0;
      v37[4] = self;
      id v38 = v7;
      id v39 = v4;
      uint64_t v22 = [v24 addCompletionBlock:v37];

      goto LABEL_14;
    }
    v17 = [v15 UUID];
    __int16 v18 = [v7 UUID];
    uint64_t v19 = objc_msgSend(v13, "hf_reassociateFaceCropsFromPersonWithUUID:toPersonWithUUID:removePerson:", v17, v18, 1);
  }
  else
  {
    uint64_t v20 = [(HUFaceRecognitionAddPersonItemManager *)self faceClassification];
    id v13 = [v20 faceCrop];

    if (!v10)
    {
      v25 = HFLogForCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = [v7 name];
        *(_DWORD *)buf = 138412546;
        v41 = v26;
        __int16 v42 = 2112;
        v43 = v13;
        _os_log_impl(&dword_1BE345000, v25, OS_LOG_TYPE_DEFAULT, "Creating a new person with name %@ face crop %@", buf, 0x16u);
      }
      uint64_t v27 = [(HUFaceRecognitionAddPersonItemManager *)self personManager];
      v28 = [v7 name];
      v29 = objc_msgSend(v27, "hf_namePerson:name:", 0, v28);
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __87__HUFaceRecognitionAddPersonItemManager_associateFaceClassificationWithExistingPerson___block_invoke_26;
      v33[3] = &unk_1E63916D8;
      v33[4] = self;
      id v34 = v7;
      id v35 = v4;
      id v36 = v13;
      uint64_t v22 = [v29 flatMap:v33];

      goto LABEL_13;
    }
    v14 = [(HUFaceRecognitionAddPersonItemManager *)self personManager];
    v21 = (void *)MEMORY[0x1E4F1CAD0];
    __int16 v16 = [v13 UUID];
    v17 = objc_msgSend(v21, "na_setWithSafeObject:", v16);
    __int16 v18 = [v7 UUID];
    uint64_t v19 = objc_msgSend(v14, "hf_associateFaceCropsWithUUIDs:toPersonWithUUID:", v17, v18);
  }
  uint64_t v22 = (void *)v19;

LABEL_13:
LABEL_14:
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __87__HUFaceRecognitionAddPersonItemManager_associateFaceClassificationWithExistingPerson___block_invoke_2;
  v32[3] = &unk_1E6387DC8;
  v32[4] = self;
  id v30 = (id)[v22 addSuccessBlock:v32];

  return v22;
}

void __87__HUFaceRecognitionAddPersonItemManager_associateFaceClassificationWithExistingPerson___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [*(id *)(a1 + 32) personManager];
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = [*(id *)(a1 + 48) personManager];
  v6 = [v5 UUID];
  id v7 = (id)objc_msgSend(v3, "hf_linkFromPerson:toPerson:toPersonManagerUUID:", v8, v4, v6);
}

id __87__HUFaceRecognitionAddPersonItemManager_associateFaceClassificationWithExistingPerson___block_invoke_26(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 personManager];
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = [*(id *)(a1 + 48) personManager];
  id v8 = [v7 UUID];
  id v9 = (id)objc_msgSend(v5, "hf_linkFromPerson:toPerson:toPersonManagerUUID:", v4, v6, v8);

  int v10 = [*(id *)(a1 + 32) personManager];
  id v11 = (void *)MEMORY[0x1E4F1CAD0];
  v12 = [*(id *)(a1 + 56) UUID];
  id v13 = [v11 setWithObject:v12];
  v14 = [v4 UUID];

  uint64_t v15 = objc_msgSend(v10, "hf_associateFaceCropsWithUUIDs:toPersonWithUUID:", v13, v14);

  return v15;
}

void __87__HUFaceRecognitionAddPersonItemManager_associateFaceClassificationWithExistingPerson___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __87__HUFaceRecognitionAddPersonItemManager_associateFaceClassificationWithExistingPerson___block_invoke_3;
  v3[3] = &unk_1E638CE18;
  v3[4] = *(void *)(a1 + 32);
  [v2 dispatchCameraObserverMessage:v3 sender:0];
}

void __87__HUFaceRecognitionAddPersonItemManager_associateFaceClassificationWithExistingPerson___block_invoke_3(uint64_t a1, void *a2)
{
  id v8 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 32) cameraProfile];
    id v4 = [v3 clipManager];
    id v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v6 = [*(id *)(a1 + 32) significantEvent];
    id v7 = [v5 setWithObject:v6];
    [v8 clipManager:v4 didUpdateSignificantEvents:v7];
  }
}

- (id)_buildItemProvidersForHome:(id)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  id v4 = [(HUFaceRecognitionAddPersonItemManager *)self homePersonItemProvider];
  v8[0] = v4;
  id v5 = [(HUFaceRecognitionAddPersonItemManager *)self photosPersonItemProvider];
  v8[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];

  return v6;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA48];
  id v24 = a3;
  id v5 = [v4 array];
  uint64_t v6 = [(HUFaceRecognitionAddPersonItemManager *)self homePersonItemProvider];
  id v7 = [v6 items];
  id v8 = (void *)[v7 mutableCopy];

  v25 = objc_msgSend(v8, "na_flatMap:", &__block_literal_global_31_0);
  id v9 = objc_msgSend(v25, "na_map:", &__block_literal_global_34);
  int v10 = [(HUFaceRecognitionAddPersonItemManager *)self photosPersonItemProvider];
  id v11 = [v10 items];

  v12 = [(HUFaceRecognitionAddPersonItemManager *)self homePersonItemProvider];
  id v13 = [v12 items];
  v14 = objc_msgSend(v13, "na_map:", &__block_literal_global_37);

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __74__HUFaceRecognitionAddPersonItemManager__buildSectionsWithDisplayedItems___block_invoke_4;
  v26[3] = &unk_1E6391740;
  id v27 = v9;
  id v28 = v14;
  id v23 = v14;
  id v15 = v9;
  __int16 v16 = objc_msgSend(v11, "na_filter:", v26);
  [v8 unionSet:v16];
  v17 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUFaceRecognitionHomePersonsSection"];
  __int16 v18 = [v8 allObjects];
  uint64_t v19 = [MEMORY[0x1E4F69220] defaultItemComparator];
  uint64_t v20 = [v18 sortedArrayUsingComparator:v19];
  [v17 setItems:v20];

  [v5 addObject:v17];
  v21 = [MEMORY[0x1E4F69220] filterSections:v5 toDisplayedItems:v24];

  return v21;
}

id __74__HUFaceRecognitionAddPersonItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 person];
  id v3 = [v2 personLinks];

  return v3;
}

uint64_t __74__HUFaceRecognitionAddPersonItemManager__buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 personUUID];
}

id __74__HUFaceRecognitionAddPersonItemManager__buildSectionsWithDisplayedItems___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = [a2 latestResults];
  id v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  return v3;
}

uint64_t __74__HUFaceRecognitionAddPersonItemManager__buildSectionsWithDisplayedItems___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 person];
  uint64_t v6 = [v5 UUID];
  LODWORD(v4) = [v4 containsObject:v6];

  id v7 = *(void **)(a1 + 40);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __74__HUFaceRecognitionAddPersonItemManager__buildSectionsWithDisplayedItems___block_invoke_5;
  v11[3] = &unk_1E6386608;
  id v12 = v3;
  id v8 = v3;
  uint64_t v9 = (v4 | objc_msgSend(v7, "na_any:", v11)) ^ 1;

  return v9;
}

uint64_t __74__HUFaceRecognitionAddPersonItemManager__buildSectionsWithDisplayedItems___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 latestResults];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  uint64_t v6 = [v3 isEqualToString:v5];

  return v6;
}

- (id)_homeFuture
{
  id v2 = (void *)MEMORY[0x1E4F7A0D8];
  id v3 = [(HUFaceRecognitionAddPersonItemManager *)self overrideHome];
  id v4 = [v2 futureWithResult:v3];

  return v4;
}

- (HMCameraSignificantEvent)significantEvent
{
  return self->_significantEvent;
}

- (HMCameraProfile)cameraProfile
{
  return self->_cameraProfile;
}

- (HFHomePersonItemProvider)homePersonItemProvider
{
  return self->_homePersonItemProvider;
}

- (HFPhotosPersonItemProvider)photosPersonItemProvider
{
  return self->_photosPersonItemProvider;
}

- (HMPersonManager)personManager
{
  return self->_personManager;
}

- (HMHome)overrideHome
{
  return self->_overrideHome;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideHome, 0);
  objc_storeStrong((id *)&self->_personManager, 0);
  objc_storeStrong((id *)&self->_photosPersonItemProvider, 0);
  objc_storeStrong((id *)&self->_homePersonItemProvider, 0);
  objc_storeStrong((id *)&self->_cameraProfile, 0);

  objc_storeStrong((id *)&self->_significantEvent, 0);
}

@end