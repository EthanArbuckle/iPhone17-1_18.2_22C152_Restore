@interface MKFCKAccessory
+ (id)fetchRequest;
- (BOOL)exportFromLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5;
- (BOOL)importIntoLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5;
- (BOOL)isReadyToImportIntoLocalModelWithContext:(id)a3;
- (id)_localModelForHostAccessoryWithContext:(void *)a1;
- (uint64_t)_shouldIgnoreMoveBackToDefaultRoom:(void *)a3 context:;
- (void)_exportOwnerSettingsFromLocalModel:(void *)a3 context:;
- (void)_importOwnerSettingsIntoLocalModel:(void *)a3 context:;
@end

@implementation MKFCKAccessory

- (void)_importOwnerSettingsIntoLocalModel:(void *)a3 context:
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v7 = [a1 home];
    v8 = [v7 owner];

    if (!v8)
    {
      v10 = (void *)MEMORY[0x230FBD990]();
      id v11 = a1;
      v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = HMFGetLogIdentifier();
        int v21 = 138543362;
        v22 = v13;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Cannot import owner settings since owner user cloud model is not available yet", (uint8_t *)&v21, 0xCu);
      }
      goto LABEL_22;
    }
    v9 = [v8 fetchLocalModelWithContext:v6];
    if (v9)
    {
      if ([a1 ownerListeningHistoryEnabled]) {
        objc_msgSend(v5, "addUsersWithListeningHistoryEnabled_Object:", v9);
      }
      else {
        [v5 removeUsersWithListeningHistoryEnabledObject:v9];
      }
      if ([a1 ownerMediaContentProfileEnabled]) {
        objc_msgSend(v5, "addUsersWithMediaContentProfileEnabled_Object:", v9);
      }
      else {
        objc_msgSend(v5, "removeUsersWithMediaContentProfileEnabled_Object:", v9);
      }
      if ([a1 ownerPersonalRequestsEnabled]) {
        uint64_t v18 = objc_msgSend(v5, "addUsersWithPersonalRequestsEnabled_Object:", v9);
      }
      else {
        uint64_t v18 = objc_msgSend(v5, "removeUsersWithPersonalRequestsEnabled_Object:", v9);
      }
      v14 = (void *)MEMORY[0x230FBD990](v18);
      id v19 = a1;
      v16 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_21;
      }
      v17 = HMFGetLogIdentifier();
      v20 = [v5 debugDescription];
      int v21 = 138543618;
      v22 = v17;
      __int16 v23 = 2112;
      v24 = v20;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Imported owner settings for accessory: %@", (uint8_t *)&v21, 0x16u);
    }
    else
    {
      v14 = (void *)MEMORY[0x230FBD990]();
      id v15 = a1;
      v16 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
LABEL_21:

LABEL_22:

        goto LABEL_23;
      }
      v17 = HMFGetLogIdentifier();
      int v21 = 138543362;
      v22 = v17;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Cannot import owner settings since owner user local model is not imported yet", (uint8_t *)&v21, 0xCu);
    }

    goto LABEL_21;
  }
LABEL_23:
}

- (void)_exportOwnerSettingsFromLocalModel:(void *)a3 context:
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v7 = [v5 home];
    v8 = [v7 owner];
    v9 = [v8 modelID];

    v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = a1;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v13 = HMFGetLogIdentifier();
      v14 = [v5 debugDescription];
      *(_DWORD *)buf = 138543618;
      v31 = v13;
      __int16 v32 = 2112;
      v33 = v14;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Exporting owner settings for accessory: %@", buf, 0x16u);
    }
    id v15 = [v5 usersWithListeningHistoryEnabled];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __71__MKFCKAccessory_Settings___exportOwnerSettingsFromLocalModel_context___block_invoke;
    v28[3] = &unk_264A1BFD0;
    id v16 = v9;
    id v29 = v16;
    uint64_t v17 = objc_msgSend(v15, "na_any:", v28);

    if (v17 != [v11 ownerListeningHistoryEnabled]) {
      [v11 setOwnerListeningHistoryEnabled:v17];
    }
    uint64_t v18 = [v5 usersWithMediaContentProfileEnabled];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __71__MKFCKAccessory_Settings___exportOwnerSettingsFromLocalModel_context___block_invoke_2;
    v26[3] = &unk_264A1BFD0;
    id v19 = v16;
    id v27 = v19;
    uint64_t v20 = objc_msgSend(v18, "na_any:", v26);

    if (v20 != [v11 ownerMediaContentProfileEnabled]) {
      [v11 setOwnerMediaContentProfileEnabled:v20];
    }
    int v21 = [v5 usersWithPersonalRequestsEnabled];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __71__MKFCKAccessory_Settings___exportOwnerSettingsFromLocalModel_context___block_invoke_3;
    v24[3] = &unk_264A1BFD0;
    id v25 = v19;
    id v22 = v19;
    uint64_t v23 = objc_msgSend(v21, "na_any:", v24);

    if (v23 != [v11 ownerPersonalRequestsEnabled]) {
      [v11 setOwnerPersonalRequestsEnabled:v23];
    }
  }
}

uint64_t __71__MKFCKAccessory_Settings___exportOwnerSettingsFromLocalModel_context___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 modelID];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __71__MKFCKAccessory_Settings___exportOwnerSettingsFromLocalModel_context___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 modelID];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __71__MKFCKAccessory_Settings___exportOwnerSettingsFromLocalModel_context___block_invoke_3(uint64_t a1, void *a2)
{
  v3 = [a2 modelID];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (BOOL)exportFromLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  if (![(MKFCKModel *)self copyPropertiesFromLocalModel:v7 context:v8]) {
    goto LABEL_34;
  }
  -[MKFCKAccessory _exportOwnerSettingsFromLocalModel:context:](self, v7, v8);
  id v9 = v7;
  id v10 = v8;
  BOOL v11 = self != 0;
  if (!self) {
    goto LABEL_37;
  }
  v12 = [v9 room];
  v13 = [v12 entity];
  v14 = +[HMDCoreDataCloudTransform exportTransformableClassFromEntity:v13];

  id v15 = [(objc_class *)v14 fetchWithLocalModel:v12 context:v10];
  if (v15)
  {
    id v16 = [(MKFCKAccessory *)self room];
    char v17 = HMFEqualObjects();

    if ((v17 & 1) == 0) {
      [(MKFCKAccessory *)self setRoom:v15];
    }
  }
  else
  {
    uint64_t v18 = (void *)MEMORY[0x230FBD990]();
    id v19 = self;
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      int v21 = v52 = v7;
      [v9 objectID];
      id v22 = v53 = v18;
      *(_DWORD *)buf = 138543874;
      v57 = v21;
      __int16 v58 = 2112;
      v59 = v22;
      __int16 v60 = 2112;
      v61 = v12;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Cannot fulfill relationship yet: %@.room = %@", buf, 0x20u);

      uint64_t v18 = v53;
      id v7 = v52;
    }

    BOOL v11 = self != 0;
  }

  id v23 = v9;
  id v24 = v10;
  id v25 = [v23 hostAccessory];
  if ((v25 != 0) != [(MKFCKAccessory *)self isHosted]) {
    [(MKFCKAccessory *)self setIsHosted:v25 != 0];
  }
  if (v25)
  {
    v26 = +[MKFCKModel fetchWithLocalModel:v25 context:v24];
    if (!v26)
    {
      id v27 = (void *)MEMORY[0x230FBD990]();
      v28 = self;
      id v29 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v30 = BOOL v55 = v11;
        [v23 objectID];
        v31 = v54 = v27;
        *(_DWORD *)buf = 138543874;
        v57 = v30;
        __int16 v58 = 2112;
        v59 = v31;
        __int16 v60 = 2112;
        v61 = v25;
        _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_INFO, "%{public}@Cannot fulfill relationship yet: %@.hostAccessory = %@", buf, 0x20u);

        id v27 = v54;
        BOOL v11 = v55;
      }

      v26 = 0;
      goto LABEL_19;
    }
  }
  else
  {
    v26 = 0;
  }
  __int16 v32 = [(MKFCKAccessory *)self hostAccessory];
  char v33 = HMFEqualObjects();

  if ((v33 & 1) == 0) {
    [(MKFCKAccessory *)self setHostAccessory:v26];
  }
LABEL_19:
  buf[0] = 1;

  int v34 = buf[0];
  if (v34 == 1)
  {
    id v35 = v23;
    id v36 = v24;
    v37 = [v35 hostedAccessories];

    if (v37)
    {
      v38 = [v35 entity];
      v39 = [v38 relationshipsByName];
      v40 = [v39 objectForKeyedSubscript:@"hostedAccessories_"];

      v41 = [(MKFCKModel *)self relationshipForLocalName:@"hostedAccessories_" localModel:v35];
      -[MKFCKHomeObject _exportSiblingRelationshipsFromLocalModel:localRelationship:cloudRelationship:context:](self, v35, v40, v41, v36);
    }
    id v9 = +[_MKFApplicationData appDataDictionaryForContainer:v35];
    v42 = [(MKFCKAccessory *)self applicationData];
    char v43 = HMFEqualObjects();

    if ((v43 & 1) == 0) {
      [(MKFCKAccessory *)self setApplicationData:v9];
    }
    v44 = [(MKFCKAccessory *)self initialCategory];
    if (![v44 unsignedIntegerValue])
    {
      v45 = [v35 initialCategoryIdentifier];
      uint64_t v46 = [v45 unsignedIntegerValue];

      if (!v46) {
        goto LABEL_28;
      }
      v44 = [v35 initialCategoryIdentifier];
      [(MKFCKAccessory *)self setInitialCategory:v44];
    }

LABEL_28:
    v47 = [(MKFCKAccessory *)self initialManufacturer];
    if (!v47)
    {
      v48 = [v35 initialManufacturer];

      if (!v48) {
        goto LABEL_32;
      }
      v47 = [v35 initialManufacturer];
      [(MKFCKAccessory *)self setInitialManufacturer:v47];
    }

LABEL_32:
    uint64_t v49 = [(MKFCKAccessory *)self initialModel];
    if (v49)
    {
      id v10 = (id)v49;
    }
    else
    {
      v50 = [v35 initialModel];

      if (!v50)
      {
LABEL_38:

        goto LABEL_39;
      }
      id v10 = [v35 initialModel];
      [(MKFCKAccessory *)self setInitialModel:v10];
    }
LABEL_37:

    goto LABEL_38;
  }
LABEL_34:
  BOOL v11 = 0;
LABEL_39:

  return v11;
}

- (BOOL)importIntoLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(MKFCKModel *)self copyPropertiesIntoLocalModel:v8 context:v10])
  {
    -[MKFCKAccessory _importOwnerSettingsIntoLocalModel:context:](self, v8, v10);
    uint64_t v67 = 0;
    v68 = &v67;
    uint64_t v69 = 0x2020000000;
    char v70 = 0;
    if (v9 && !objc_msgSend(v9, "hmf_isEmpty"))
    {
      v63[0] = MEMORY[0x263EF8330];
      v63[1] = 3221225472;
      v63[2] = __65__MKFCKAccessory_importIntoLocalModel_updatedProperties_context___block_invoke;
      v63[3] = &unk_264A24210;
      v63[4] = self;
      id v64 = v8;
      id v65 = v10;
      v66 = &v67;
      objc_msgSend(v9, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v63);

      v12 = v68;
    }
    else
    {
      char v11 = -[MKFCKAccessory _shouldIgnoreMoveBackToDefaultRoom:context:](self, v8, v10);
      v12 = v68;
      if ((v11 & 1) == 0) {
        *((unsigned char *)v68 + 24) = 1;
      }
    }
    if (!*((unsigned char *)v12 + 24))
    {
      if (self)
      {
LABEL_26:
        id v30 = v8;
        v31 = -[MKFCKAccessory _localModelForHostAccessoryWithContext:](self, v10);
        [(MKFCKAccessory *)self isHosted];
        [v30 setHostAccessory:v31];

        __int16 v32 = [(MKFCKAccessory *)self applicationData];
        +[_MKFApplicationData setAppDataDictionary:v32 forContainer:v30];

        char v33 = [(MKFCKAccessory *)self initialCategory];
        int v34 = [v30 initialCategoryIdentifier];
        char v35 = HMFEqualObjects();

        if ((v35 & 1) == 0) {
          [v30 setInitialCategoryIdentifier:v33];
        }
        id v36 = [(MKFCKAccessory *)self initialManufacturer];
        v37 = [v30 initialManufacturer];
        char v38 = HMFEqualObjects();

        if ((v38 & 1) == 0) {
          [v30 setInitialManufacturer:v36];
        }
        v39 = [(MKFCKAccessory *)self initialModel];
        v40 = [v30 initialModel];
        char v41 = HMFEqualObjects();

        if ((v41 & 1) == 0) {
          [v30 setInitialModel:v39];
        }
        if (![v9 count])
        {
          v42 = [(MKFCKAccessory *)self initialManufacturer];
          if (v42)
          {
            char v43 = [v30 manufacturer];
            BOOL v44 = v43 == 0;

            if (v44)
            {
              v45 = [(MKFCKAccessory *)self initialManufacturer];
              uint64_t v46 = (void *)[v45 copy];
              [v30 setManufacturer:v46];
            }
          }
          v47 = [(MKFCKAccessory *)self initialModel];
          if (v47)
          {
            v48 = [v30 model];
            BOOL v49 = v48 == 0;

            if (v49)
            {
              v50 = [(MKFCKAccessory *)self initialModel];
              v51 = (void *)[v50 copy];
              [v30 setModel:v51];
            }
          }
          id v52 = [(MKFCKAccessory *)self initialCategory];
          if (v52)
          {
            v53 = [v30 accessoryCategory];
            BOOL v54 = v53 == 0;

            if (v54)
            {
              BOOL v55 = [(MKFCKAccessory *)self initialCategory];
              v56 = (void *)[v55 copy];
              [v30 setAccessoryCategory:v56];
            }
          }
        }

        LOBYTE(self) = 1;
      }
LABEL_48:
      _Block_object_dispose(&v67, 8);
      goto LABEL_49;
    }
    id v61 = v8;
    id v62 = v10;
    if (!self)
    {

LABEL_47:
      LOBYTE(self) = 0;
      goto LABEL_48;
    }
    id v13 = [(MKFCKAccessory *)self room];
    v14 = [(MKFCKAccessory *)self home];
    __int16 v60 = [v14 defaultRoom];

    if (!v13)
    {
      id v15 = (void *)MEMORY[0x230FBD990]();
      id v16 = self;
      char v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v73 = v18;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Cannot fulfill room relationship yet", buf, 0xCu);
      }
      id v19 = (void *)MEMORY[0x230FBD990]();
      uint64_t v20 = v16;
      int v21 = HMFGetOSLogHandle();
      BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
      if (!v60)
      {
        if (v22)
        {
          v57 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v73 = v57;
          _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Default room also not available", buf, 0xCu);
        }
        id v13 = 0;
        char v71 = 1;
LABEL_25:

        char v29 = v71;
        if (v29) {
          goto LABEL_26;
        }
        goto LABEL_47;
      }
      if (v22)
      {
        id v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v73 = v23;
        _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Substituting nil room with default room", buf, 0xCu);
      }
      id v13 = v60;
    }
    id v24 = [v13 fetchLocalModelWithContext:v62];
    if (v24)
    {
      [v61 setRoom:v24];
    }
    else
    {
      context = (void *)MEMORY[0x230FBD990]();
      id v25 = self;
      v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        id v27 = HMFGetLogIdentifier();
        v28 = [v61 objectID];
        *(_DWORD *)buf = 138543874;
        v73 = v27;
        __int16 v74 = 2112;
        v75 = v28;
        __int16 v76 = 2112;
        id v77 = v13;
        _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_INFO, "%{public}@Cannot fulfill relationship yet: %@.room = %@", buf, 0x20u);
      }
    }
    char v71 = 1;

    goto LABEL_25;
  }
  LOBYTE(self) = 0;
LABEL_49:

  return (char)self;
}

- (uint64_t)_shouldIgnoreMoveBackToDefaultRoom:(void *)a3 context:
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!a1)
  {
    uint64_t v10 = 0;
    goto LABEL_16;
  }
  id v7 = [a1 room];
  id v8 = [a1 home];
  id v9 = [v8 defaultRoom];

  uint64_t v10 = 0;
  if (v7 && v9)
  {
    char v11 = [v5 room];

    if (v11)
    {
      v12 = [v9 fetchLocalModelWithContext:v6];
      if (v12)
      {
        id v13 = [v5 room];
        if ([v13 isEqual:v12])
        {
        }
        else
        {
          int v14 = [v7 isEqual:v9];

          if (v14)
          {
            id v15 = (void *)MEMORY[0x230FBD990]();
            id v16 = a1;
            char v17 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              uint64_t v18 = HMFGetLogIdentifier();
              int v20 = 138543362;
              int v21 = v18;
              _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Ignore moving the accessory back to default room", (uint8_t *)&v20, 0xCu);
            }
            uint64_t v10 = 1;
            goto LABEL_14;
          }
        }
      }
      uint64_t v10 = 0;
LABEL_14:

      goto LABEL_15;
    }
    uint64_t v10 = 0;
  }
LABEL_15:

LABEL_16:
  return v10;
}

void __65__MKFCKAccessory_importIntoLocalModel_updatedProperties_context___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = [v5 name];
  int v7 = [v6 isEqualToString:@"room"];

  if (v7)
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      char v11 = HMFGetLogIdentifier();
      int v12 = 138543362;
      id v13 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Room property is dirty", (uint8_t *)&v12, 0xCu);
    }
    if ((-[MKFCKAccessory _shouldIgnoreMoveBackToDefaultRoom:context:](*(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48)) & 1) == 0)*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1; {
    *a3 = 1;
    }
  }
}

- (id)_localModelForHostAccessoryWithContext:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = [a1 hostAccessory];
    id v5 = v4;
    if (v4)
    {
      id v6 = [v4 fetchLocalModelWithContext:v3];
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)isReadyToImportIntoLocalModelWithContext:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(MKFCKAccessory *)self isHosted])
  {
    id v5 = -[MKFCKAccessory _localModelForHostAccessoryWithContext:](self, v4);
    BOOL v6 = v5 != 0;
    if (!v5)
    {
      int v7 = (void *)MEMORY[0x230FBD990]();
      id v8 = self;
      id v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = HMFGetLogIdentifier();
        int v12 = 138543362;
        id v13 = v10;
        _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Cannot fulfill host accessory relationship yet", (uint8_t *)&v12, 0xCu);
      }
    }
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFCKAccessory"];
}

@end