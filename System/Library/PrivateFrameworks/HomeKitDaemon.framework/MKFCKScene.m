@interface MKFCKScene
+ (id)fetchRequest;
- (BOOL)exportFromLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5;
- (BOOL)importIntoLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5;
- (id)decodeActionAppleMediaAccessoryPower:(id)a3 localModel:(id)a4 context:(id)a5;
- (id)decodeActionCharacteristic:(id)a3 localModel:(id)a4 context:(id)a5;
- (id)decodeActionCommand:(id)a3 localModel:(id)a4 context:(id)a5;
- (id)decodeActionMediaPlayback:(id)a3 localModel:(id)a4 context:(id)a5;
- (id)decodeActionNaturalLight:(id)a3 localModel:(id)a4 context:(id)a5;
- (id)decodeActionShortcut:(id)a3 localModel:(id)a4 context:(id)a5;
- (id)encodeActionAppleMediaAccessoryPower:(id)a3 accessories:(id)a4 context:(id)a5;
- (id)encodeActionCharacteristic:(id)a3 accessories:(id)a4 context:(id)a5;
- (id)encodeActionCommand:(id)a3 accessories:(id)a4 context:(id)a5;
- (id)encodeActionMediaPlayback:(id)a3 accessories:(id)a4 context:(id)a5;
- (id)encodeActionNaturalLight:(id)a3 accessories:(id)a4 shouldRemoveAction:(BOOL *)a5 context:(id)a6;
- (id)encodeActionShortcut:(id)a3 context:(id)a4;
@end

@implementation MKFCKScene

- (id)encodeActionCommand:(id)a3 accessories:(id)a4 context:(id)a5
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = +[HMDCoreData featuresDataSource];
  char v12 = [v11 isRVCEnabled];

  if (v12)
  {
    v13 = [v8 matterPaths];
    v14 = [v13 firstObject];
    v15 = [v14 accessory];
    v16 = [v15 modelID];

    v17 = [MEMORY[0x263EFF980] array];
    v18 = [v8 matterPaths];
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __68__MKFCKScene_ActionComand__encodeActionCommand_accessories_context___block_invoke;
    v44[3] = &unk_264A1DF00;
    id v19 = v17;
    id v45 = v19;
    [v18 enumerateObjectsUsingBlock:v44];

    v20 = -[MKFCKHomeObject _accessoryWithModelID:context:](self, v16, v10);
    if (v20)
    {
      [v9 addObject:v20];
      v47[0] = @"C";
      v46[0] = @"At";
      v46[1] = @"Am";
      v42 = [v8 modelID];
      v47[1] = v42;
      v46[2] = @"Cmp";
      v21 = (void *)[v19 copy];
      v47[2] = v21;
      v47[3] = v16;
      v46[3] = @"Cm";
      v46[4] = @"Cf";
      v22 = [v8 commands];
      +[HMDMatterCommandActionUtilities commandsInStoreRepresentation:v22];
      v43 = v20;
      v23 = v16;
      v25 = id v24 = v9;
      v47[4] = v25;
      v46[5] = @"Ceeo";
      uint64_t v26 = [v8 enforceExecutionOrder];
      id v27 = v8;
      id v28 = v19;
      id v29 = v10;
      v30 = (void *)v26;
      uint64_t v31 = MEMORY[0x263EFFA80];
      if (v26) {
        uint64_t v31 = v26;
      }
      v47[5] = v31;
      v32 = [NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:6];

      id v10 = v29;
      id v19 = v28;
      id v8 = v27;

      id v9 = v24;
      v16 = v23;
      v20 = v43;
    }
    else
    {
      v37 = (void *)MEMORY[0x230FBD990]();
      v38 = self;
      v39 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        v40 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        v49 = v40;
        __int16 v50 = 2160;
        uint64_t v51 = 1752392040;
        __int16 v52 = 2112;
        v53 = v16;
        __int16 v54 = 2112;
        id v55 = v8;
        _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode action, cannot find matching accessory with modelID %{mask.hash}@: %@", buf, 0x2Au);
      }
      v32 = 0;
    }
  }
  else
  {
    v33 = (void *)MEMORY[0x230FBD990]();
    v34 = self;
    v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v36 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v49 = v36;
      _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_ERROR, "%{public}@RVC feature is not enabled", buf, 0xCu);
    }
    v32 = 0;
  }

  return v32;
}

- (id)encodeActionNaturalLight:(id)a3 accessories:(id)a4 shouldRemoveAction:(BOOL *)a5 context:(id)a6
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = [v10 accessory];
  v14 = v13;
  if (v13)
  {
    v15 = [v13 modelID];
    v16 = -[MKFCKHomeObject _accessoryWithModelID:context:](self, v15, v12);
    if (v16)
    {
      [v11 addObject:v16];
      v39[0] = @"NL";
      v38[0] = @"At";
      v38[1] = @"Am";
      v36 = [v10 modelID];
      v39[1] = v36;
      v39[2] = v15;
      v38[2] = @"Lm";
      v38[3] = @"Le";
      v17 = [v10 naturalLightingEnabledField];
      v18 = (void *)[v17 copy];
      v39[3] = v18;
      v38[4] = @"Ll";
      [v10 lightProfileUUID];
      id v19 = v10;
      v20 = v14;
      v21 = v16;
      v22 = v15;
      id v23 = v12;
      v25 = id v24 = v11;
      v39[4] = v25;
      uint64_t v26 = [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:5];

      id v11 = v24;
      id v12 = v23;
      v15 = v22;
      v16 = v21;
      v14 = v20;
      id v10 = v19;
    }
    else
    {
      uint64_t v31 = (void *)MEMORY[0x230FBD990]();
      v32 = self;
      v33 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v34 = v37 = v31;
        *(_DWORD *)buf = 138543874;
        v41 = v34;
        __int16 v42 = 2112;
        id v43 = v15;
        __int16 v44 = 2112;
        id v45 = v10;
        _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode action, cannot find matching accessory with modelID %@: %@", buf, 0x20u);

        uint64_t v31 = v37;
      }

      uint64_t v26 = 0;
      *a5 = 0;
    }
  }
  else
  {
    id v27 = (void *)MEMORY[0x230FBD990]();
    id v28 = self;
    id v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v41 = v30;
      __int16 v42 = 2112;
      id v43 = v10;
      _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode action, no accessory specified: %@", buf, 0x16u);
    }
    uint64_t v26 = 0;
    *a5 = 1;
  }

  return v26;
}

- (id)decodeActionNaturalLight:(id)a3 localModel:(id)a4 context:(id)a5
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v58 = a5;
  id v10 = [v8 objectForKeyedSubscript:@"Am"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  if (v12)
  {
    v13 = [v8 objectForKeyedSubscript:@"Lm"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v14 = v13;
    }
    else {
      v14 = 0;
    }
    id v15 = v14;

    if (v15)
    {
      v16 = [v8 objectForKeyedSubscript:@"Ll"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v17 = v16;
      }
      else {
        v17 = 0;
      }
      id v18 = v17;

      if (v18)
      {
        id v19 = [v8 objectForKeyedSubscript:@"Le"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v20 = v19;
        }
        else {
          v20 = 0;
        }
        id v21 = v20;

        v57 = v21;
        if (v21)
        {
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          v74 = __Block_byref_object_copy__32299;
          v75 = __Block_byref_object_dispose__32300;
          id v76 = 0;
          v22 = [v9 home];
          id v23 = [v22 accessories];
          v65[0] = MEMORY[0x263EF8330];
          v65[1] = 3221225472;
          v65[2] = __78__MKFCKScene_ActionNaturalLight__decodeActionNaturalLight_localModel_context___block_invoke;
          v65[3] = &unk_264A18AE8;
          v67 = self;
          v68 = buf;
          id v66 = v15;
          objc_msgSend(v23, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v65);

          if (*(void *)(*(void *)&buf[8] + 40))
          {
            *(void *)v69 = 0;
            *(void *)&v69[8] = v69;
            *(void *)&v69[16] = 0x3032000000;
            v70 = __Block_byref_object_copy__32299;
            v71 = __Block_byref_object_dispose__32300;
            id v72 = 0;
            id v24 = [v9 actions];
            v59[0] = MEMORY[0x263EF8330];
            v59[1] = 3221225472;
            v59[2] = __78__MKFCKScene_ActionNaturalLight__decodeActionNaturalLight_localModel_context___block_invoke_10;
            v59[3] = &unk_264A2CAA8;
            id v25 = v12;
            v64 = v69;
            id v60 = v25;
            v61 = self;
            id v62 = v8;
            id v26 = v58;
            id v63 = v26;
            objc_msgSend(v24, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v59);

            id v27 = *(void **)(*(void *)&v69[8] + 40);
            if (!v27)
            {
              id v28 = [[_MKFNaturalLightingAction alloc] initWithContext:v26];
              id v29 = *(void **)(*(void *)&v69[8] + 40);
              *(void *)(*(void *)&v69[8] + 40) = v28;

              [*(id *)(*(void *)&v69[8] + 40) setModelID:v25];
              v30 = [(MKFCKScene *)self writerTimestamp];
              [*(id *)(*(void *)&v69[8] + 40) setWriterTimestamp:v30];

              objc_msgSend(v9, "addActions_Object:", *(void *)(*(void *)&v69[8] + 40));
              id v27 = *(void **)(*(void *)&v69[8] + 40);
            }
            uint64_t v31 = objc_msgSend(v27, "lightProfileUUID", v57);
            char v32 = [v18 isEqual:v31];

            if ((v32 & 1) == 0) {
              [*(id *)(*(void *)&v69[8] + 40) setLightProfileUUID:v18];
            }
            v33 = [*(id *)(*(void *)&v69[8] + 40) naturalLightingEnabledField];
            char v34 = [v57 isEqual:v33];

            if ((v34 & 1) == 0) {
              [*(id *)(*(void *)&v69[8] + 40) setNaturalLightingEnabledField:v57];
            }
            id v35 = *(id *)(*(void *)&v69[8] + 40);

            _Block_object_dispose(v69, 8);
          }
          else
          {
            __int16 v52 = (void *)MEMORY[0x230FBD990]();
            v53 = self;
            HMFGetOSLogHandle();
            __int16 v54 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
            {
              id v55 = HMFGetLogIdentifier();
              *(_DWORD *)v69 = 138543618;
              *(void *)&v69[4] = v55;
              *(_WORD *)&v69[12] = 2112;
              *(void *)&v69[14] = v8;
              _os_log_impl(&dword_22F52A000, v54, OS_LOG_TYPE_ERROR, "%{public}@Could not find accessory matching action: %@", v69, 0x16u);
            }
            id v35 = 0;
          }

          _Block_object_dispose(buf, 8);
        }
        else
        {
          v48 = (void *)MEMORY[0x230FBD990]();
          v49 = self;
          __int16 v50 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            uint64_t v51 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v51;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v8;
            _os_log_impl(&dword_22F52A000, v50, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode enable in action: %@", buf, 0x16u);
          }
          id v35 = 0;
        }
      }
      else
      {
        __int16 v44 = (void *)MEMORY[0x230FBD990]();
        id v45 = self;
        uint64_t v46 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          v47 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v47;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v8;
          _os_log_impl(&dword_22F52A000, v46, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode profileID in action: %@", buf, 0x16u);
        }
        id v35 = 0;
      }
    }
    else
    {
      v40 = (void *)MEMORY[0x230FBD990]();
      v41 = self;
      __int16 v42 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        id v43 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v43;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v8;
        _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode accessory modelID in action: %@", buf, 0x16u);
      }
      id v35 = 0;
    }
  }
  else
  {
    v36 = (void *)MEMORY[0x230FBD990]();
    v37 = self;
    v38 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v39;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v8;
      _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode modelID in action: %@", buf, 0x16u);
    }
    id v35 = 0;
  }

  return v35;
}

void __78__MKFCKScene_ActionNaturalLight__decodeActionNaturalLight_localModel_context___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  v6 = [v5 modelID];
  int v7 = [v6 isEqual:*(void *)(a1 + 32)];

  if (v7)
  {
    id v8 = v5;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
    id v10 = v9;

    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      v13 = (void *)MEMORY[0x230FBD990]();
      id v14 = *(id *)(a1 + 40);
      id v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = HMFGetLogIdentifier();
        int v17 = 138543618;
        id v18 = v16;
        __int16 v19 = 2112;
        id v20 = v8;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Existing accessory is not a HAP accessory: %@", (uint8_t *)&v17, 0x16u);
      }
    }
    *a3 = 1;
  }
}

void __78__MKFCKScene_ActionNaturalLight__decodeActionNaturalLight_localModel_context___block_invoke_10(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  v6 = [v5 modelID];
  int v7 = [v6 isEqual:*(void *)(a1 + 32)];

  if (v7)
  {
    id v8 = v5;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
    id v10 = v9;

    uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      v13 = (void *)MEMORY[0x230FBD990]();
      id v14 = *(id *)(a1 + 40);
      id v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = HMFGetLogIdentifier();
        uint64_t v17 = *(void *)(a1 + 48);
        int v18 = 138543874;
        __int16 v19 = v16;
        __int16 v20 = 2112;
        id v21 = v8;
        __int16 v22 = 2112;
        uint64_t v23 = v17;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Existing action is an unexpected type: %@, %@", (uint8_t *)&v18, 0x20u);
      }
      [*(id *)(a1 + 56) deleteObject:v8];
    }
    *a3 = 1;
  }
}

- (id)encodeActionCharacteristic:(id)a3 accessories:(id)a4 context:(id)a5
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 accessory];
  id v12 = [v11 modelID];

  v13 = -[MKFCKHomeObject _accessoryWithModelID:context:](self, v12, v10);
  if (v13)
  {
    [v9 addObject:v13];
    v34[0] = @"CW";
    v33[0] = @"At";
    v33[1] = @"Am";
    uint64_t v31 = [v8 modelID];
    v34[1] = v31;
    v34[2] = v12;
    v33[2] = @"Cm";
    v33[3] = @"Cs";
    v30 = [v8 service];
    id v14 = [v30 instanceID];
    v34[3] = v14;
    v33[4] = @"Cc";
    id v15 = [v8 characteristicID];
    v34[4] = v15;
    v33[5] = @"Ct";
    [v8 targetValue];
    v16 = id v32 = v9;
    uint64_t v17 = [v16 copy];
    id v18 = v10;
    __int16 v19 = (void *)v17;
    __int16 v20 = (void *)*MEMORY[0x263EFFD08];
    if (v17) {
      __int16 v20 = (void *)v17;
    }
    id v21 = v13;
    __int16 v22 = v12;
    id v23 = v20;
    v34[5] = v23;
    uint64_t v24 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:6];

    id v12 = v22;
    v13 = v21;

    id v10 = v18;
    id v9 = v32;
  }
  else
  {
    id v25 = (void *)MEMORY[0x230FBD990]();
    id v26 = self;
    id v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      id v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      v36 = v28;
      __int16 v37 = 2160;
      uint64_t v38 = 1752392040;
      __int16 v39 = 2112;
      v40 = v12;
      __int16 v41 = 2112;
      id v42 = v8;
      _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode action, cannot find matching accessory with modelID %{mask.hash}@: %@", buf, 0x2Au);
    }
    uint64_t v24 = 0;
  }

  return v24;
}

- (id)decodeActionCharacteristic:(id)a3 localModel:(id)a4 context:(id)a5
{
  uint64_t v89 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 objectForKeyedSubscript:@"Am"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  if (v13)
  {
    id v14 = [v8 objectForKeyedSubscript:@"Cm"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }
    id v16 = v15;

    if (!v16)
    {
      __int16 v50 = (void *)MEMORY[0x230FBD990]();
      uint64_t v51 = self;
      __int16 v52 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        v53 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v53;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v8;
        _os_log_impl(&dword_22F52A000, v52, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode accessory modelID in action: %@", buf, 0x16u);
      }
      id v45 = 0;
      goto LABEL_64;
    }
    uint64_t v17 = [v8 objectForKeyedSubscript:@"Cs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v18 = v17;
    }
    else {
      id v18 = 0;
    }
    id v19 = v18;

    if (!v19)
    {
      __int16 v54 = (void *)MEMORY[0x230FBD990]();
      id v55 = self;
      uint64_t v56 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        v57 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v57;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v8;
        _os_log_impl(&dword_22F52A000, v56, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode serviceID in action: %@", buf, 0x16u);
      }
      id v45 = 0;
      goto LABEL_63;
    }
    __int16 v20 = [v8 objectForKeyedSubscript:@"Cc"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v21 = v20;
    }
    else {
      id v21 = 0;
    }
    id v22 = v21;

    v78 = v22;
    if (v22)
    {
      id v23 = [v8 objectForKeyedSubscript:@"Ct"];
      uint64_t v77 = v23;
      if (v23)
      {
        if ((void *)*MEMORY[0x263EFFD08] == v23)
        {

          uint64_t v77 = 0;
        }
        uint64_t v24 = [v9 home];
        id v76 = [v24 accessoryWithModelID:v16 context:v10];

        if (v76)
        {
          id v25 = v76;
          objc_opt_class();
          int v26 = objc_opt_isKindOfClass() & 1;
          if (v26) {
            id v27 = v25;
          }
          else {
            id v27 = 0;
          }
          id v28 = v27;

          if (v26)
          {

            context = [v25 serviceWithID:v19 context:v10];
            if (context)
            {
              *(void *)buf = 0;
              *(void *)&buf[8] = buf;
              *(void *)&buf[16] = 0x3032000000;
              v86 = __Block_byref_object_copy__54973;
              v87 = __Block_byref_object_dispose__54974;
              id v88 = 0;
              id v29 = [v9 actions];
              v79[0] = MEMORY[0x263EF8330];
              v79[1] = 3221225472;
              v79[2] = __82__MKFCKScene_ActionCharacteristic__decodeActionCharacteristic_localModel_context___block_invoke;
              v79[3] = &unk_264A2CAA8;
              v84 = buf;
              id v73 = v13;
              id v80 = v73;
              v81 = self;
              id v82 = v8;
              id v30 = v10;
              id v83 = v30;
              objc_msgSend(v29, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v79);

              uint64_t v31 = *(void **)(*(void *)&buf[8] + 40);
              if (!v31)
              {
                id v32 = [[_MKFCharacteristicWriteAction alloc] initWithContext:v30];
                v33 = *(void **)(*(void *)&buf[8] + 40);
                *(void *)(*(void *)&buf[8] + 40) = v32;

                [*(id *)(*(void *)&buf[8] + 40) setModelID:v73];
                char v34 = [(MKFCKScene *)self writerTimestamp];
                [*(id *)(*(void *)&buf[8] + 40) setWriterTimestamp:v34];

                objc_msgSend(v9, "addActions_Object:", *(void *)(*(void *)&buf[8] + 40));
                uint64_t v31 = *(void **)(*(void *)&buf[8] + 40);
              }
              id v35 = objc_msgSend(v31, "accessory", v73);
              char v36 = HMFEqualObjects();

              if ((v36 & 1) == 0) {
                [*(id *)(*(void *)&buf[8] + 40) setAccessory:v25];
              }
              __int16 v37 = [*(id *)(*(void *)&buf[8] + 40) service];
              char v38 = HMFEqualObjects();

              if ((v38 & 1) == 0) {
                [*(id *)(*(void *)&buf[8] + 40) setService:context];
              }
              __int16 v39 = [*(id *)(*(void *)&buf[8] + 40) characteristicID];
              char v40 = HMFEqualObjects();

              if ((v40 & 1) == 0)
              {
                __int16 v41 = (void *)[v78 copy];
                [*(id *)(*(void *)&buf[8] + 40) setCharacteristicID:v41];
              }
              id v42 = [*(id *)(*(void *)&buf[8] + 40) targetValue];
              char v43 = HMFEqualObjects();

              if ((v43 & 1) == 0)
              {
                __int16 v44 = (void *)[v77 copy];
                [*(id *)(*(void *)&buf[8] + 40) setTargetValue:v44];
              }
              id v45 = *(id *)(*(void *)&buf[8] + 40);

              _Block_object_dispose(buf, 8);
            }
            else
            {
              v68 = (void *)MEMORY[0x230FBD990]();
              v69 = self;
              v70 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
              {
                v71 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                *(void *)&uint8_t buf[4] = v71;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v8;
                _os_log_impl(&dword_22F52A000, v70, OS_LOG_TYPE_ERROR, "%{public}@Could not find service matching action: %@", buf, 0x16u);
              }
              id v45 = 0;
            }

            goto LABEL_61;
          }
          contexta = (void *)MEMORY[0x230FBD990]();
          id v66 = self;
          v64 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
          {
            v67 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            *(void *)&uint8_t buf[4] = v67;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v25;
            *(_WORD *)&buf[22] = 2112;
            v86 = (uint64_t (*)(uint64_t, uint64_t))v8;
            _os_log_impl(&dword_22F52A000, v64, OS_LOG_TYPE_ERROR, "%{public}@Accessory %@ is not a HAP accessory in action: %@", buf, 0x20u);
          }
        }
        else
        {
          contexta = (void *)MEMORY[0x230FBD990]();
          id v63 = self;
          v64 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
          {
            v65 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v65;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v8;
            _os_log_impl(&dword_22F52A000, v64, OS_LOG_TYPE_ERROR, "%{public}@Could not find accessory matching action: %@", buf, 0x16u);
          }
        }

        id v45 = 0;
LABEL_61:

        goto LABEL_62;
      }
      id v58 = (void *)MEMORY[0x230FBD990]();
      v59 = self;
      id v60 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        id v62 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v62;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v8;
        _os_log_impl(&dword_22F52A000, v60, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode targetValue in action: %@", buf, 0x16u);
      }
    }
    else
    {
      id v58 = (void *)MEMORY[0x230FBD990]();
      v59 = self;
      id v60 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        v61 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v61;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v8;
        _os_log_impl(&dword_22F52A000, v60, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode characteristicID in action: %@", buf, 0x16u);
      }
    }

    id v45 = 0;
LABEL_62:

LABEL_63:
LABEL_64:

    goto LABEL_65;
  }
  uint64_t v46 = (void *)MEMORY[0x230FBD990]();
  v47 = self;
  v48 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
  {
    v49 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v49;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v8;
    _os_log_impl(&dword_22F52A000, v48, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode modelID in action: %@", buf, 0x16u);
  }
  id v45 = 0;
LABEL_65:

  return v45;
}

void __82__MKFCKScene_ActionCharacteristic__decodeActionCharacteristic_localModel_context___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  v6 = [v5 modelID];
  int v7 = [v6 isEqual:*(void *)(a1 + 32)];

  if (v7)
  {
    id v8 = v5;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
    id v10 = v9;

    uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      id v13 = (void *)MEMORY[0x230FBD990]();
      id v14 = *(id *)(a1 + 40);
      id v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        id v16 = HMFGetLogIdentifier();
        uint64_t v17 = *(void *)(a1 + 48);
        int v18 = 138543874;
        id v19 = v16;
        __int16 v20 = 2112;
        id v21 = v8;
        __int16 v22 = 2112;
        uint64_t v23 = v17;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Existing action is an unexpected type: %@, %@", (uint8_t *)&v18, 0x20u);
      }
      [*(id *)(a1 + 56) deleteObject:v8];
    }
    *a3 = 1;
  }
}

void __68__MKFCKScene_ActionComand__encodeActionCommand_accessories_context___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 modelID];
  [v2 addObject:v3];
}

- (id)decodeActionCommand:(id)a3 localModel:(id)a4 context:(id)a5
{
  uint64_t v106 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = +[HMDCoreData featuresDataSource];
  char v12 = [v11 isRVCEnabled];

  if (v12)
  {
    id v13 = [v8 objectForKeyedSubscript:@"Am"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v14 = v13;
    }
    else {
      id v14 = 0;
    }
    id v15 = v14;

    if (v15)
    {
      id v16 = [v8 objectForKeyedSubscript:@"Cm"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v17 = v16;
      }
      else {
        uint64_t v17 = 0;
      }
      id v18 = v17;

      if (v18)
      {
        id v19 = [v8 objectForKeyedSubscript:@"Cmp"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          __int16 v20 = v19;
        }
        else {
          __int16 v20 = 0;
        }
        id v85 = v20;

        char v97 = 0;
        unsigned int context = objc_msgSend(v8, "hmf_BOOLForKey:isPresent:", @"Ceeo", &v97);
        if (v97)
        {
          v84 = [v8 objectForKeyedSubscript:@"Cf"];
          id v21 = [v9 home];
          __int16 v22 = [v21 accessoryWithModelID:v18 context:v10];

          if (v22)
          {
            id v23 = v22;
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();
            if (isKindOfClass) {
              id v25 = v23;
            }
            else {
              id v25 = 0;
            }
            id v81 = v25;

            if (isKindOfClass)
            {
              int v26 = [v23 matterPaths];
              *(void *)buf = 0;
              *(void *)&buf[8] = buf;
              *(void *)&buf[16] = 0x3032000000;
              v103 = __Block_byref_object_copy__90045;
              v104 = __Block_byref_object_dispose__90046;
              id v105 = [MEMORY[0x263EFF980] array];
              v92[0] = MEMORY[0x263EF8330];
              v92[1] = 3221225472;
              v92[2] = __67__MKFCKScene_ActionComand__decodeActionCommand_localModel_context___block_invoke;
              v92[3] = &unk_264A2BBE0;
              id v80 = v26;
              id v93 = v80;
              v94 = self;
              id v27 = v8;
              id v95 = v27;
              v96 = buf;
              objc_msgSend(v85, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v92);
              id v28 = *(void **)(*(void *)&buf[8] + 40);
              if (v28 && (uint64_t v29 = [v28 count], v29 == objc_msgSend(v85, "count")))
              {
                *(void *)v98 = 0;
                *(void *)&v98[8] = v98;
                *(void *)&v98[16] = 0x3032000000;
                v99 = __Block_byref_object_copy__90045;
                v100 = __Block_byref_object_dispose__90046;
                id v101 = 0;
                id v30 = [v9 actions];
                v86[0] = MEMORY[0x263EF8330];
                v86[1] = 3221225472;
                v86[2] = __67__MKFCKScene_ActionComand__decodeActionCommand_localModel_context___block_invoke_20;
                v86[3] = &unk_264A2CAA8;
                v91 = v98;
                id v31 = v15;
                id v87 = v31;
                id v88 = self;
                id v89 = v27;
                id v32 = v10;
                id v90 = v32;
                objc_msgSend(v30, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v86);

                v33 = *(void **)(*(void *)&v98[8] + 40);
                if (!v33)
                {
                  char v34 = [[_MKFMatterCommandAction alloc] initWithContext:v32];
                  id v35 = *(void **)(*(void *)&v98[8] + 40);
                  *(void *)(*(void *)&v98[8] + 40) = v34;

                  [*(id *)(*(void *)&v98[8] + 40) setModelID:v31];
                  char v36 = [(MKFCKScene *)self writerTimestamp];
                  [*(id *)(*(void *)&v98[8] + 40) setWriterTimestamp:v36];

                  objc_msgSend(v9, "addActions_Object:", *(void *)(*(void *)&v98[8] + 40));
                  v33 = *(void **)(*(void *)&v98[8] + 40);
                }
                __int16 v37 = [v33 matterPaths];
                char v38 = HMFEqualObjects();

                if ((v38 & 1) == 0)
                {
                  __int16 v39 = (void *)MEMORY[0x263EFFA08];
                  char v40 = (void *)[*(id *)(*(void *)&buf[8] + 40) copy];
                  __int16 v41 = [v39 setWithArray:v40];
                  objc_msgSend(*(id *)(*(void *)&v98[8] + 40), "setMatterPaths_:", v41);
                }
                id v42 = [*(id *)(*(void *)&v98[8] + 40) enforceExecutionOrder];
                if (v42)
                {
                  char v43 = [*(id *)(*(void *)&v98[8] + 40) enforceExecutionOrder];
                  int v44 = [v43 BOOLValue];

                  if (context != v44)
                  {
                    id v45 = [NSNumber numberWithBool:context];
                    [*(id *)(*(void *)&v98[8] + 40) setEnforceExecutionOrder:v45];
                  }
                }
                uint64_t v46 = [*(id *)(*(void *)&v98[8] + 40) commands];
                if (v46)
                {
                  v47 = [*(id *)(*(void *)&v98[8] + 40) commands];
                  char v48 = HMFEqualObjects();

                  if ((v48 & 1) == 0)
                  {
                    v49 = (void *)[v84 copy];
                    __int16 v50 = +[HMDMatterCommandActionUtilities commandsInMemoryRepresentation:v49];
                    [*(id *)(*(void *)&v98[8] + 40) setCommands:v50];
                  }
                }
                id v51 = *(id *)(*(void *)&v98[8] + 40);

                _Block_object_dispose(v98, 8);
              }
              else
              {
                contexta = (void *)MEMORY[0x230FBD990]();
                id v76 = self;
                HMFGetOSLogHandle();
                uint64_t v77 = (id)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
                {
                  v78 = HMFGetLogIdentifier();
                  *(_DWORD *)v98 = 138543618;
                  *(void *)&v98[4] = v78;
                  *(_WORD *)&v98[12] = 2112;
                  *(void *)&v98[14] = v27;
                  _os_log_impl(&dword_22F52A000, v77, OS_LOG_TYPE_ERROR, "%{public}@Could not find matter path matching action: %@", v98, 0x16u);
                }
                id v51 = 0;
              }

              _Block_object_dispose(buf, 8);
            }
            else
            {
              id v72 = (void *)MEMORY[0x230FBD990]();
              id v73 = self;
              v74 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
              {
                v75 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                *(void *)&uint8_t buf[4] = v75;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v8;
                _os_log_impl(&dword_22F52A000, v74, OS_LOG_TYPE_ERROR, "%{public}@Accessory is an unexpected type: %@", buf, 0x16u);
              }
              id v51 = 0;
            }
          }
          else
          {
            v68 = (void *)MEMORY[0x230FBD990]();
            v69 = self;
            v70 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
            {
              v71 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              *(void *)&uint8_t buf[4] = v71;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v8;
              _os_log_impl(&dword_22F52A000, v70, OS_LOG_TYPE_ERROR, "%{public}@Could not find accessory matching action: %@", buf, 0x16u);
            }
            id v51 = 0;
          }
        }
        else
        {
          v64 = (void *)MEMORY[0x230FBD990]();
          v65 = self;
          id v66 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          {
            v67 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v67;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v8;
            _os_log_impl(&dword_22F52A000, v66, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode enforceExecutionOrder in action: %@", buf, 0x16u);
          }
          id v51 = 0;
        }
      }
      else
      {
        id v60 = (void *)MEMORY[0x230FBD990]();
        v61 = self;
        id v62 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          id v63 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v63;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v8;
          _os_log_impl(&dword_22F52A000, v62, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode accessory modelID in action: %@", buf, 0x16u);
        }
        id v51 = 0;
      }
    }
    else
    {
      uint64_t v56 = (void *)MEMORY[0x230FBD990]();
      v57 = self;
      id v58 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        v59 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v59;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v8;
        _os_log_impl(&dword_22F52A000, v58, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode modelID in action: %@", buf, 0x16u);
      }
      id v51 = 0;
    }
  }
  else
  {
    __int16 v52 = (void *)MEMORY[0x230FBD990]();
    v53 = self;
    __int16 v54 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      id v55 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v55;
      _os_log_impl(&dword_22F52A000, v54, OS_LOG_TYPE_ERROR, "%{public}@RVC feature is not enabled", buf, 0xCu);
    }
    id v51 = 0;
  }

  return v51;
}

void __67__MKFCKScene_ActionComand__decodeActionCommand_localModel_context___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __67__MKFCKScene_ActionComand__decodeActionCommand_localModel_context___block_invoke_2;
  v10[3] = &unk_264A1DED8;
  id v5 = (void *)a1[4];
  uint64_t v4 = a1[5];
  v6 = (void *)a1[6];
  id v11 = v3;
  uint64_t v12 = v4;
  id v7 = v6;
  uint64_t v8 = a1[7];
  id v13 = v7;
  uint64_t v14 = v8;
  id v9 = v3;
  [v5 enumerateObjectsUsingBlock:v10];
}

void __67__MKFCKScene_ActionComand__decodeActionCommand_localModel_context___block_invoke_20(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  v6 = [v5 modelID];
  int v7 = [v6 isEqual:*(void *)(a1 + 32)];

  if (v7)
  {
    id v8 = v5;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
    id v10 = v9;

    uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      id v13 = (void *)MEMORY[0x230FBD990]();
      id v14 = *(id *)(a1 + 40);
      id v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        id v16 = HMFGetLogIdentifier();
        uint64_t v17 = *(void *)(a1 + 48);
        int v18 = 138543874;
        id v19 = v16;
        __int16 v20 = 2112;
        id v21 = v8;
        __int16 v22 = 2112;
        uint64_t v23 = v17;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Existing action is an unexpected type: %@, %@", (uint8_t *)&v18, 0x20u);
      }
      [*(id *)(a1 + 56) deleteObject:v8];
    }
    *a3 = 1;
  }
}

void __67__MKFCKScene_ActionComand__decodeActionCommand_localModel_context___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a2;
  int v7 = [v6 modelID];
  int v8 = objc_msgSend(v7, "hmf_isEqualToUUID:", *(void *)(a1 + 32));

  if (v8)
  {
    id v9 = v6;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }
    id v11 = v10;

    if (!v11)
    {
      uint64_t v12 = (void *)MEMORY[0x230FBD990]();
      id v13 = *(id *)(a1 + 40);
      id v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v15 = HMFGetLogIdentifier();
        uint64_t v16 = *(void *)(a1 + 48);
        int v17 = 138543874;
        int v18 = v15;
        __int16 v19 = 2112;
        id v20 = v9;
        __int16 v21 = 2112;
        uint64_t v22 = v16;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Existing matter path is an unexpected type: %@, %@", (uint8_t *)&v17, 0x20u);
      }
    }
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v11];
    *a4 = 1;
  }
}

- (id)encodeActionAppleMediaAccessoryPower:(id)a3 accessories:(id)a4 context:(id)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 accessory];
  uint64_t v12 = [v11 modelID];

  id v13 = -[MKFCKHomeObject _accessoryWithModelID:context:](self, v12, v10);
  if (v13)
  {
    v23[0] = @"AMAP";
    id v14 = objc_msgSend(v8, "modelID", @"At", @"Am");
    v23[1] = v14;
    v23[2] = v12;
    v22[2] = @"AMAPATVU";
    v22[3] = @"AMAPASWS";
    id v15 = [v8 targetSleepWakeState];
    v23[3] = v15;
    uint64_t v16 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:4];
  }
  else
  {
    int v17 = (void *)MEMORY[0x230FBD990]();
    int v18 = self;
    __int16 v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      id v25 = v20;
      __int16 v26 = 2160;
      uint64_t v27 = 1752392040;
      __int16 v28 = 2112;
      uint64_t v29 = v12;
      __int16 v30 = 2114;
      id v31 = v8;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode action, cannot find matching appleTV with modelID %{mask.hash}@: %{public}@", buf, 0x2Au);
    }
    uint64_t v16 = 0;
  }

  return v16;
}

- (id)decodeActionAppleMediaAccessoryPower:(id)a3 localModel:(id)a4 context:(id)a5
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 objectForKeyedSubscript:@"Am"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = v12;

  if (v13)
  {
    objc_msgSend(v8, "hmf_UUIDForKey:", @"AMAPATVU");
    id v14 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      id v15 = objc_msgSend(v8, "hmf_numberForKey:", @"AMAPASWS");
      if (v15)
      {
        uint64_t v16 = [v9 home];
        int v17 = [v16 accessoryWithModelID:v14 context:v10];

        id v18 = v17;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          __int16 v19 = v18;
        }
        else {
          __int16 v19 = 0;
        }
        id v20 = v19;

        __int16 v50 = v20;
        if (v20)
        {

          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          id v58 = __Block_byref_object_copy__145346;
          *(void *)&long long v59 = __Block_byref_object_dispose__145347;
          *((void *)&v59 + 1) = 0;
          __int16 v21 = [v9 actions];
          v51[0] = MEMORY[0x263EF8330];
          v51[1] = 3221225472;
          v51[2] = __85__MKFCKScene_ActionAppleTV__decodeActionAppleMediaAccessoryPower_localModel_context___block_invoke;
          v51[3] = &unk_264A2CAA8;
          id v22 = v13;
          uint64_t v56 = buf;
          id v52 = v22;
          v53 = self;
          id v54 = v8;
          id v23 = v10;
          id v55 = v23;
          objc_msgSend(v21, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v51);

          uint64_t v24 = *(void **)(*(void *)&buf[8] + 40);
          if (!v24)
          {
            id v25 = [[_MKFAppleMediaAccessoryPowerAction alloc] initWithContext:v23];
            __int16 v26 = *(void **)(*(void *)&buf[8] + 40);
            *(void *)(*(void *)&buf[8] + 40) = v25;

            [*(id *)(*(void *)&buf[8] + 40) setModelID:v22];
            uint64_t v27 = [(MKFCKScene *)self writerTimestamp];
            [*(id *)(*(void *)&buf[8] + 40) setWriterTimestamp:v27];

            objc_msgSend(v9, "addActions_Object:", *(void *)(*(void *)&buf[8] + 40));
            uint64_t v24 = *(void **)(*(void *)&buf[8] + 40);
          }
          __int16 v28 = [v24 accessory];
          char v29 = HMFEqualObjects();

          if ((v29 & 1) == 0) {
            [*(id *)(*(void *)&buf[8] + 40) setAccessory:v50];
          }
          __int16 v30 = [*(id *)(*(void *)&buf[8] + 40) targetSleepWakeState];
          char v31 = HMFEqualObjects();

          if ((v31 & 1) == 0) {
            [*(id *)(*(void *)&buf[8] + 40) setTargetSleepWakeState:v15];
          }
          id v32 = *(id *)(*(void *)&buf[8] + 40);

          _Block_object_dispose(buf, 8);
        }
        else
        {
          unsigned int context = (void *)MEMORY[0x230FBD990]();
          id v45 = self;
          uint64_t v46 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            v47 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138544130;
            *(void *)&uint8_t buf[4] = v47;
            *(_WORD *)&buf[12] = 2160;
            *(void *)&buf[14] = 1752392040;
            *(_WORD *)&buf[22] = 2112;
            id v58 = v14;
            LOWORD(v59) = 2112;
            *(void *)((char *)&v59 + 2) = v8;
            _os_log_impl(&dword_22F52A000, v46, OS_LOG_TYPE_ERROR, "%{public}@Could not find accessory %{mask.hash}@ matching action %@", buf, 0x2Au);
          }

          id v32 = 0;
        }
      }
      else
      {
        __int16 v41 = (void *)MEMORY[0x230FBD990]();
        id v42 = self;
        char v43 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          int v44 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v44;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v8;
          _os_log_impl(&dword_22F52A000, v43, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode targetSleepWakeState in action: %@", buf, 0x16u);
        }
        id v32 = 0;
      }
    }
    else
    {
      __int16 v37 = (void *)MEMORY[0x230FBD990]();
      char v38 = self;
      __int16 v39 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        char v40 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v40;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v8;
        _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode accessoryUUID in action: %@", buf, 0x16u);
      }
      id v32 = 0;
    }
  }
  else
  {
    v33 = (void *)MEMORY[0x230FBD990]();
    char v34 = self;
    id v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      char v36 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v36;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v8;
      _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode modelID in action: %@", buf, 0x16u);
    }
    id v32 = 0;
  }

  return v32;
}

void __85__MKFCKScene_ActionAppleTV__decodeActionAppleMediaAccessoryPower_localModel_context___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = [v5 modelID];
  int v7 = [v6 isEqual:*(void *)(a1 + 32)];

  if (v7)
  {
    id v8 = v5;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
    id v10 = v9;

    uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      id v13 = (void *)MEMORY[0x230FBD990]();
      id v14 = *(id *)(a1 + 40);
      id v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = HMFGetLogIdentifier();
        uint64_t v17 = *(void *)(a1 + 48);
        int v18 = 138543874;
        __int16 v19 = v16;
        __int16 v20 = 2112;
        id v21 = v8;
        __int16 v22 = 2112;
        uint64_t v23 = v17;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Existing action is an unexpected type: %@, %@", (uint8_t *)&v18, 0x20u);
      }
      [*(id *)(a1 + 56) deleteObject:v8];
    }
    *a3 = 1;
  }
}

- (id)encodeActionShortcut:(id)a3 context:(id)a4
{
  v12[3] = *MEMORY[0x263EF8340];
  v12[0] = @"S";
  v11[0] = @"At";
  v11[1] = @"Am";
  id v4 = a3;
  id v5 = [v4 modelID];
  v12[1] = v5;
  v11[2] = @"Sd";
  id v6 = [v4 data];

  int v7 = (void *)[v6 copy];
  id v8 = v7;
  if (!v7)
  {
    id v8 = [MEMORY[0x263EFF8F8] data];
  }
  v12[2] = v8;
  id v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];
  if (!v7) {

  }
  return v9;
}

- (id)decodeActionShortcut:(id)a3 localModel:(id)a4 context:(id)a5
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 objectForKeyedSubscript:@"Am"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = v12;

  if (v13)
  {
    id v14 = [v8 objectForKeyedSubscript:@"Sd"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }
    id v16 = v15;

    if (v16)
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      char v43 = __Block_byref_object_copy__200854;
      int v44 = __Block_byref_object_dispose__200855;
      id v45 = 0;
      uint64_t v17 = [v9 actions];
      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      v36[2] = __70__MKFCKScene_ActionShortcut__decodeActionShortcut_localModel_context___block_invoke;
      v36[3] = &unk_264A2CAA8;
      id v18 = v13;
      __int16 v41 = buf;
      id v37 = v18;
      char v38 = self;
      id v39 = v8;
      id v19 = v10;
      id v40 = v19;
      objc_msgSend(v17, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v36);

      __int16 v20 = *(void **)(*(void *)&buf[8] + 40);
      if (!v20)
      {
        id v21 = [[_MKFShortcutAction alloc] initWithContext:v19];
        __int16 v22 = *(void **)(*(void *)&buf[8] + 40);
        *(void *)(*(void *)&buf[8] + 40) = v21;

        [*(id *)(*(void *)&buf[8] + 40) setModelID:v18];
        uint64_t v23 = [(MKFCKScene *)self writerTimestamp];
        [*(id *)(*(void *)&buf[8] + 40) setWriterTimestamp:v23];

        objc_msgSend(v9, "addActions_Object:", *(void *)(*(void *)&buf[8] + 40));
        __int16 v20 = *(void **)(*(void *)&buf[8] + 40);
      }
      uint64_t v24 = [v20 data];
      char v25 = [v16 isEqual:v24];

      if ((v25 & 1) == 0) {
        [*(id *)(*(void *)&buf[8] + 40) setData:v16];
      }
      id v26 = *(id *)(*(void *)&buf[8] + 40);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      char v31 = (void *)MEMORY[0x230FBD990]();
      id v32 = self;
      v33 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        char v34 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v34;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v8;
        _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode data in action: %@", buf, 0x16u);
      }
      id v26 = 0;
    }
  }
  else
  {
    uint64_t v27 = (void *)MEMORY[0x230FBD990]();
    __int16 v28 = self;
    char v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      __int16 v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v30;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v8;
      _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode modelID in action: %@", buf, 0x16u);
    }
    id v26 = 0;
  }

  return v26;
}

void __70__MKFCKScene_ActionShortcut__decodeActionShortcut_localModel_context___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = [v5 modelID];
  int v7 = [v6 isEqual:*(void *)(a1 + 32)];

  if (v7)
  {
    id v8 = v5;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
    id v10 = v9;

    uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      id v13 = (void *)MEMORY[0x230FBD990]();
      id v14 = *(id *)(a1 + 40);
      id v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        id v16 = HMFGetLogIdentifier();
        uint64_t v17 = *(void *)(a1 + 48);
        int v18 = 138543874;
        id v19 = v16;
        __int16 v20 = 2112;
        id v21 = v8;
        __int16 v22 = 2112;
        uint64_t v23 = v17;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Existing action is an unexpected type: %@, %@", (uint8_t *)&v18, 0x20u);
      }
      [*(id *)(a1 + 56) deleteObject:v8];
    }
    *a3 = 1;
  }
}

- (id)encodeActionMediaPlayback:(id)a3 accessories:(id)a4 context:(id)a5
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v40 = a4;
  id v9 = a5;
  id v10 = (void *)MEMORY[0x263EFF9C0];
  uint64_t v11 = [v8 accessories];
  uint64_t v12 = objc_msgSend(v10, "setWithCapacity:", objc_msgSend(v11, "count"));

  uint64_t v50 = 0;
  id v51 = &v50;
  uint64_t v52 = 0x2020000000;
  char v53 = 1;
  id v13 = [v8 accessories];
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __81__MKFCKScene_ActionMediaPlayback__encodeActionMediaPlayback_accessories_context___block_invoke;
  v45[3] = &unk_264A2CAD0;
  v45[4] = self;
  id v39 = v9;
  id v46 = v39;
  id v14 = v8;
  id v47 = v14;
  v49 = &v50;
  id v15 = v12;
  id v48 = v15;
  objc_msgSend(v13, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v45);

  if (!*((unsigned char *)v51 + 24))
  {
    id v21 = 0;
    goto LABEL_16;
  }
  id v16 = objc_msgSend(v14, "encodedPlaybackArchive", v39);

  if (v16)
  {
    uint64_t v17 = (void *)MEMORY[0x263F08910];
    int v18 = [v14 encodedPlaybackArchive];
    id v44 = 0;
    uint64_t v19 = [v17 archivedDataWithRootObject:v18 requiringSecureCoding:1 error:&v44];
    id v20 = v44;

    if (!v19)
    {
      char v34 = (void *)MEMORY[0x230FBD990]();
      id v35 = self;
      HMFGetOSLogHandle();
      char v36 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        id v37 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v57 = v37;
        __int16 v58 = 2114;
        id v59 = v20;
        _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode playback archive: %{public}@", buf, 0x16u);
      }
      id v21 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v19 = 0;
  }
  __int16 v22 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v15, "count"));
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __81__MKFCKScene_ActionMediaPlayback__encodeActionMediaPlayback_accessories_context___block_invoke_22;
  v41[3] = &unk_264A2CAF8;
  id v23 = v22;
  id v42 = v23;
  id v43 = v40;
  objc_msgSend(v15, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v41);
  uint64_t v24 = (void *)MEMORY[0x263EFF9A0];
  v55[0] = @"MP";
  v54[0] = @"At";
  v54[1] = @"Am";
  char v25 = [v14 modelID];
  v55[1] = v25;
  v54[2] = @"Mm";
  id v26 = [v23 allObjects];
  v55[2] = v26;
  v54[3] = @"Ms";
  uint64_t v27 = [v14 state];
  __int16 v28 = (void *)[v27 copy];
  v55[3] = v28;
  char v29 = [NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:4];
  __int16 v30 = [v24 dictionaryWithDictionary:v29];

  char v31 = [v14 volume];

  if (v31)
  {
    id v32 = [v14 volume];
    v33 = (void *)[v32 copy];
    [v30 setObject:v33 forKeyedSubscript:@"Mv"];
  }
  if (v19) {
    [v30 setObject:v19 forKeyedSubscript:@"Ma"];
  }
  id v21 = (void *)[v30 copy];

  id v20 = (id)v19;
LABEL_15:

LABEL_16:
  _Block_object_dispose(&v50, 8);

  return v21;
}

void __81__MKFCKScene_ActionMediaPlayback__encodeActionMediaPlayback_accessories_context___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = [v5 modelID];
  int v7 = -[MKFCKHomeObject _accessoryWithModelID:context:](*(void **)(a1 + 32), v6, *(void **)(a1 + 40));
  if (v7)
  {
    [*(id *)(a1 + 56) addObject:v7];
  }
  else
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      uint64_t v12 = *(void *)(a1 + 48);
      int v13 = 138544130;
      id v14 = v11;
      __int16 v15 = 2160;
      uint64_t v16 = 1752392040;
      __int16 v17 = 2112;
      int v18 = v6;
      __int16 v19 = 2112;
      uint64_t v20 = v12;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode action, cannot find matching accessory with modelID %{mask.hash}@: %@", (uint8_t *)&v13, 0x2Au);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    *a3 = 1;
  }
}

void __81__MKFCKScene_ActionMediaPlayback__encodeActionMediaPlayback_accessories_context___block_invoke_22(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v5 = a2;
  id v4 = [v5 modelID];
  [v3 addObject:v4];

  [*(id *)(a1 + 40) addObject:v5];
}

- (id)decodeActionMediaPlayback:(id)a3 localModel:(id)a4 context:(id)a5
{
  uint64_t v109 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v86 = a4;
  id v87 = a5;
  id v9 = [v8 objectForKeyedSubscript:@"Am"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  if (v11)
  {
    uint64_t v12 = [v8 objectForKeyedSubscript:@"Mm"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v13 = v12;
    }
    else {
      int v13 = 0;
    }
    id v14 = v13;

    if (v14)
    {
      __int16 v15 = [v8 objectForKeyedSubscript:@"Ms"];
      uint64_t v16 = v15;
      if (!v15
        || ((v17 = v15, objc_opt_class(), (int v18 = objc_opt_isKindOfClass() & 1) == 0)
          ? (__int16 v19 = 0)
          : (__int16 v19 = v17),
            id v20 = v19,
            v17,
            v18))
      {

        uint64_t v21 = [v8 objectForKeyedSubscript:@"Mv"];
        id v85 = v21;
        __int16 v22 = v21;
        if (v21)
        {
          id v23 = v21;
          objc_opt_class();
          int v24 = objc_opt_isKindOfClass() & 1;
          id v25 = v24 ? v23 : 0;
          id v26 = v25;

          if (!v24)
          {
            id v47 = (void *)MEMORY[0x230FBD990]();
            id v48 = self;
            v49 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
            {
              uint64_t v50 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              *(void *)&uint8_t buf[4] = v50;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v8;
              _os_log_impl(&dword_22F52A000, v49, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode volume in action: %@", buf, 0x16u);
            }
            id v38 = 0;
            goto LABEL_62;
          }
        }

        uint64_t v27 = [v8 objectForKeyedSubscript:@"Ma"];
        __int16 v28 = v27;
        if (v27)
        {
          id v29 = v27;
          objc_opt_class();
          int v30 = objc_opt_isKindOfClass() & 1;
          if (v30) {
            char v31 = v29;
          }
          else {
            char v31 = 0;
          }
          id v32 = v31;

          if (v30)
          {
            id v104 = 0;
            unsigned int context = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v29 error:&v104];
            id v33 = v104;
            if (context)
            {

LABEL_40:
              id v51 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v14, "count"));
              uint64_t v100 = 0;
              id v101 = &v100;
              uint64_t v102 = 0x2020000000;
              char v103 = 1;
              v94[0] = MEMORY[0x263EF8330];
              v94[1] = 3221225472;
              v94[2] = __80__MKFCKScene_ActionMediaPlayback__decodeActionMediaPlayback_localModel_context___block_invoke;
              v94[3] = &unk_264A2CA80;
              v94[4] = self;
              id v52 = v8;
              id v95 = v52;
              v99 = &v100;
              id v53 = v86;
              id v96 = v53;
              id v54 = v87;
              id v97 = v54;
              id v82 = v51;
              id v98 = v82;
              objc_msgSend(v14, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v94);
              if (*((unsigned char *)v101 + 24))
              {
                *(void *)buf = 0;
                *(void *)&buf[8] = buf;
                *(void *)&buf[16] = 0x3032000000;
                uint64_t v106 = __Block_byref_object_copy__251489;
                v107 = __Block_byref_object_dispose__251490;
                id v108 = 0;
                id v81 = v53;
                id v55 = [v53 actions];
                v88[0] = MEMORY[0x263EF8330];
                v88[1] = 3221225472;
                v88[2] = __80__MKFCKScene_ActionMediaPlayback__decodeActionMediaPlayback_localModel_context___block_invoke_17;
                v88[3] = &unk_264A2CAA8;
                id v56 = v11;
                id v93 = buf;
                id v89 = v56;
                id v90 = self;
                id v91 = v52;
                id v57 = v54;
                id v92 = v57;
                objc_msgSend(v55, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v88);

                __int16 v58 = *(void **)(*(void *)&buf[8] + 40);
                if (!v58)
                {
                  id v59 = [[_MKFMediaPlaybackAction alloc] initWithContext:v57];
                  uint64_t v60 = *(void **)(*(void *)&buf[8] + 40);
                  *(void *)(*(void *)&buf[8] + 40) = v59;

                  [*(id *)(*(void *)&buf[8] + 40) setModelID:v56];
                  v61 = [(MKFCKScene *)self writerTimestamp];
                  [*(id *)(*(void *)&buf[8] + 40) setWriterTimestamp:v61];

                  objc_msgSend(v81, "addActions_Object:", *(void *)(*(void *)&buf[8] + 40));
                  __int16 v58 = *(void **)(*(void *)&buf[8] + 40);
                }
                id v62 = [v58 state];
                char v63 = HMFEqualObjects();

                if ((v63 & 1) == 0) {
                  [*(id *)(*(void *)&buf[8] + 40) setState:v16];
                }
                v64 = [*(id *)(*(void *)&buf[8] + 40) volume];
                char v65 = HMFEqualObjects();

                if ((v65 & 1) == 0) {
                  [*(id *)(*(void *)&buf[8] + 40) setVolume:v85];
                }
                id v66 = [*(id *)(*(void *)&buf[8] + 40) encodedPlaybackArchive];
                char v67 = HMFEqualObjects();

                if ((v67 & 1) == 0) {
                  [*(id *)(*(void *)&buf[8] + 40) setEncodedPlaybackArchive:context];
                }
                v68 = [*(id *)(*(void *)&buf[8] + 40) accessories];
                char v69 = [v68 isEqualToSet:v82];

                if ((v69 & 1) == 0)
                {
                  v70 = *(void **)(*(void *)&buf[8] + 40);
                  v71 = (void *)[v82 copy];
                  objc_msgSend(v70, "setAccessories_:", v71);
                }
                id v38 = *(id *)(*(void *)&buf[8] + 40);

                _Block_object_dispose(buf, 8);
              }
              else
              {
                id v38 = 0;
              }

              _Block_object_dispose(&v100, 8);
              id v29 = context;
              goto LABEL_61;
            }
            id v76 = (uint64_t (*)(uint64_t, uint64_t))v33;
            contexta = (void *)MEMORY[0x230FBD990]();
            uint64_t v77 = self;
            v78 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
            {
              v79 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543874;
              *(void *)&uint8_t buf[4] = v79;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v8;
              *(_WORD *)&buf[22] = 2114;
              uint64_t v106 = v76;
              _os_log_impl(&dword_22F52A000, v78, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode playback archive in action: %@, %{public}@", buf, 0x20u);
            }
          }
          else
          {
            id v72 = (void *)MEMORY[0x230FBD990]();
            id v73 = self;
            v74 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
            {
              v75 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              *(void *)&uint8_t buf[4] = v75;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v8;
              _os_log_impl(&dword_22F52A000, v74, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode encodedArchive in action: %@", buf, 0x16u);
            }
          }
          id v38 = 0;
LABEL_61:

          id v23 = v85;
LABEL_62:

          goto LABEL_63;
        }
        unsigned int context = 0;
        goto LABEL_40;
      }
      id v43 = (void *)MEMORY[0x230FBD990]();
      id v44 = self;
      id v45 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        id v46 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v46;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v8;
        _os_log_impl(&dword_22F52A000, v45, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode state in action: %@", buf, 0x16u);
      }
    }
    else
    {
      id v39 = (void *)MEMORY[0x230FBD990]();
      id v40 = self;
      __int16 v41 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        id v42 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v42;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v8;
        _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode accessory modelIDs in action: %@", buf, 0x16u);
      }
    }
    id v38 = 0;
LABEL_63:

    goto LABEL_64;
  }
  char v34 = (void *)MEMORY[0x230FBD990]();
  id v35 = self;
  char v36 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
  {
    id v37 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v37;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v8;
    _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode modelID in action: %@", buf, 0x16u);
  }
  id v38 = 0;
LABEL_64:

  return v38;
}

void __80__MKFCKScene_ActionMediaPlayback__decodeActionMediaPlayback_localModel_context___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v7 = v6;
  }
  else {
    int v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    id v9 = [*(id *)(a1 + 48) home];
    id v10 = [v9 accessoryWithModelID:v8 context:*(void *)(a1 + 56)];

    if (v10)
    {
      [*(id *)(a1 + 64) addObject:v10];
    }
    else
    {
      uint64_t v16 = (void *)MEMORY[0x230FBD990]();
      id v17 = *(id *)(a1 + 32);
      int v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        __int16 v19 = HMFGetLogIdentifier();
        uint64_t v20 = *(void *)(a1 + 40);
        int v21 = 138543874;
        __int16 v22 = v19;
        __int16 v23 = 2112;
        id v24 = v8;
        __int16 v25 = 2112;
        uint64_t v26 = v20;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Could not find accessory %@ matching action: %@", (uint8_t *)&v21, 0x20u);
      }
      *a4 = 1;
    }
  }
  else
  {
    id v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = *(id *)(a1 + 32);
    int v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      __int16 v15 = *(void **)(a1 + 40);
      int v21 = 138543618;
      __int16 v22 = v14;
      __int16 v23 = 2112;
      id v24 = v15;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode accessory modelID in action: %@", (uint8_t *)&v21, 0x16u);
    }
    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
  }
}

void __80__MKFCKScene_ActionMediaPlayback__decodeActionMediaPlayback_localModel_context___block_invoke_17(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = [v5 modelID];
  int v7 = [v6 isEqual:*(void *)(a1 + 32)];

  if (v7)
  {
    id v8 = v5;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
    id v10 = v9;

    uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      int v13 = (void *)MEMORY[0x230FBD990]();
      id v14 = *(id *)(a1 + 40);
      __int16 v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = HMFGetLogIdentifier();
        uint64_t v17 = *(void *)(a1 + 48);
        int v18 = 138543874;
        __int16 v19 = v16;
        __int16 v20 = 2112;
        id v21 = v8;
        __int16 v22 = 2112;
        uint64_t v23 = v17;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Existing action is an unexpected type: %@, %@", (uint8_t *)&v18, 0x20u);
      }
      [*(id *)(a1 + 56) deleteObject:v8];
    }
    *a3 = 1;
  }
}

- (BOOL)exportFromLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned int context = (void *)MEMORY[0x230FBD990]();
  id v11 = v8;
  id v12 = v9;
  id v13 = v10;
  if (self
    && [(MKFCKModel *)self copyPropertiesFromLocalModel:v11 context:v13])
  {
    id v14 = (void *)MEMORY[0x263EFF9C0];
    __int16 v15 = [v11 actions];
    uint64_t v16 = objc_msgSend(v14, "setWithCapacity:", objc_msgSend(v15, "count"));

    uint64_t v17 = [MEMORY[0x263EFF9C0] set];
    int v18 = objc_msgSend(v13, "hmd_currentChangeSet");
    __int16 v19 = (void *)MEMORY[0x263EFF9A0];
    __int16 v20 = [(MKFCKScene *)self actions];
    id v21 = objc_msgSend(v19, "dictionaryWithCapacity:", objc_msgSend(v20, "count"));

    __int16 v22 = [(MKFCKScene *)self actions];
    v57[0] = MEMORY[0x263EF8330];
    v57[1] = 3221225472;
    v57[2] = __62__MKFCKScene__exportFromLocalModel_updatedProperties_context___block_invoke;
    v57[3] = &unk_264A2F140;
    id v44 = v18;
    id v58 = v44;
    id v23 = v21;
    id v59 = v23;
    objc_msgSend(v22, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v57);

    uint64_t v53 = 0;
    id v54 = &v53;
    uint64_t v55 = 0x2020000000;
    char v56 = 1;
    uint64_t v24 = [v11 actions];
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __62__MKFCKScene__exportFromLocalModel_updatedProperties_context___block_invoke_2;
    v47[3] = &unk_264A2F168;
    v47[4] = self;
    id v25 = v17;
    id v48 = v25;
    id v49 = v13;
    id v52 = &v53;
    id v26 = v23;
    id v50 = v26;
    id v45 = v16;
    id v51 = v45;
    objc_msgSend(v24, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v47);

    if (*((unsigned char *)v54 + 24))
    {
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __62__MKFCKScene__exportFromLocalModel_updatedProperties_context___block_invoke_37;
      v61 = &unk_264A2F190;
      id v27 = v45;
      id v62 = v27;
      char v63 = self;
      [v26 enumerateKeysAndObjectsUsingBlock:buf];
      __int16 v28 = (void *)MEMORY[0x263EFFA08];
      id v29 = [(MKFCKScene *)self actions];
      int v30 = [v28 setWithArray:v29];
      LOBYTE(v28) = HMFEqualObjects();

      if ((v28 & 1) == 0)
      {
        char v31 = [v27 allObjects];
        [(MKFCKScene *)self setActions:v31];
      }
      id v32 = [(MKFCKScene *)self accessories];
      char v33 = HMFEqualObjects();

      if ((v33 & 1) == 0)
      {
        char v34 = (void *)[v25 copy];
        [(MKFCKScene *)self setAccessories:v34];
      }
      id v35 = +[_MKFApplicationData appDataDictionaryForContainer:v11];
      char v36 = [(MKFCKScene *)self applicationData];
      char v37 = HMFEqualObjects();

      if ((v37 & 1) == 0) {
        [(MKFCKScene *)self setApplicationData:v35];
      }
    }
    else
    {
      id v39 = (void *)MEMORY[0x230FBD990]();
      id v40 = self;
      HMFGetOSLogHandle();
      __int16 v41 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        id v42 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v42;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v11;
        _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode all actions, assuming a later export will succeed: %@", buf, 0x16u);
      }
    }

    _Block_object_dispose(&v53, 8);
    BOOL v38 = 1;
  }
  else
  {
    BOOL v38 = 0;
  }

  return v38;
}

void __62__MKFCKScene__exportFromLocalModel_updatedProperties_context___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [v8 objectForKeyedSubscript:@"Am"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  id v6 = [*(id *)(a1 + 32) deletedModelIDs];
  char v7 = [v6 containsObject:v5];

  if ((v7 & 1) == 0) {
    [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:v5];
  }
}

void __62__MKFCKScene__exportFromLocalModel_updatedProperties_context___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  char v20 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [*(id *)(a1 + 32) encodeActionCharacteristic:v5 accessories:*(void *)(a1 + 40) context:*(void *)(a1 + 48)];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [*(id *)(a1 + 32) encodeActionNaturalLight:v5 accessories:*(void *)(a1 + 40) shouldRemoveAction:&v20 context:*(void *)(a1 + 48)];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v6 = [*(id *)(a1 + 32) encodeActionMediaPlayback:v5 accessories:*(void *)(a1 + 40) context:*(void *)(a1 + 48)];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v6 = [*(id *)(a1 + 32) encodeActionShortcut:v5 context:*(void *)(a1 + 48)];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v6 = [*(id *)(a1 + 32) encodeActionAppleMediaAccessoryPower:v5 accessories:*(void *)(a1 + 40) context:*(void *)(a1 + 48)];
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_21;
            }
            char v7 = +[HMDCoreData featuresDataSource];
            int v8 = [v7 isRVCEnabled];

            if (!v8) {
              goto LABEL_21;
            }
            uint64_t v6 = [*(id *)(a1 + 32) encodeActionCommand:v5 accessories:*(void *)(a1 + 40) context:*(void *)(a1 + 48)];
          }
        }
      }
    }
  }
  id v9 = (void *)v6;
  if (!v6)
  {
    if (v20) {
      goto LABEL_22;
    }
LABEL_21:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
    *a3 = 1;
    goto LABEL_22;
  }
  id v10 = *(void **)(a1 + 56);
  id v11 = [v5 modelID];
  id v12 = [v10 objectForKeyedSubscript:v11];

  id v13 = +[MKFCKModel mergedDictionaryFromCloud:v12 localModifications:v9];
  if (!v13)
  {
    id v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = *(id *)(a1 + 32);
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      __int16 v22 = v17;
      __int16 v23 = 2112;
      uint64_t v24 = v12;
      __int16 v25 = 2112;
      id v26 = v9;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unable to merge cloud & local actions: %@ / %@", buf, 0x20u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
    *a3 = 1;
  }
  int v18 = *(void **)(a1 + 56);
  __int16 v19 = [v5 modelID];
  [v18 removeObjectForKey:v19];

  [*(id *)(a1 + 64) addObject:v13];
LABEL_22:
}

void __62__MKFCKScene__exportFromLocalModel_updatedProperties_context___block_invoke_37(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  char v7 = (void *)MEMORY[0x230FBD990]([*(id *)(a1 + 32) addObject:v6]);
  id v8 = *(id *)(a1 + 40);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    id v11 = [v6 objectForKeyedSubscript:@"At"];
    int v12 = 138543874;
    id v13 = v10;
    __int16 v14 = 2114;
    id v15 = v11;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Found new action type [%{public}@] not supported by this software. Adding it back to cloud: %@", (uint8_t *)&v12, 0x20u);
  }
}

- (BOOL)importIntoLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  BOOL v9 = [(MKFCKModel *)self copyPropertiesIntoLocalModel:v7 context:v8];
  if (v9)
  {
    id v10 = (void *)MEMORY[0x263EFF9C0];
    id v11 = [(MKFCKScene *)self actions];
    int v12 = objc_msgSend(v10, "setWithCapacity:", objc_msgSend(v11, "count"));

    id v13 = [(MKFCKScene *)self actions];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __61__MKFCKScene_importIntoLocalModel_updatedProperties_context___block_invoke;
    v28[3] = &unk_264A2F0F0;
    v28[4] = self;
    id v14 = v7;
    id v29 = v14;
    id v15 = v8;
    id v30 = v15;
    id v16 = v12;
    id v31 = v16;
    objc_msgSend(v13, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v28);

    id v17 = [v14 actions];
    uint64_t v18 = [v17 allObjects];
    uint64_t v22 = MEMORY[0x263EF8330];
    uint64_t v23 = 3221225472;
    uint64_t v24 = __61__MKFCKScene_importIntoLocalModel_updatedProperties_context___block_invoke_24;
    __int16 v25 = &unk_264A2F118;
    id v26 = v16;
    id v27 = v15;
    id v19 = v16;
    objc_msgSend(v18, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v22);

    char v20 = [(MKFCKScene *)self applicationData];
    +[_MKFApplicationData setAppDataDictionary:v20 forContainer:v14];
  }
  return v9;
}

void __61__MKFCKScene_importIntoLocalModel_updatedProperties_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:@"At"];
  if ([v4 isEqualToString:@"CW"])
  {
    id v5 = [*(id *)(a1 + 32) decodeActionCharacteristic:v3 localModel:*(void *)(a1 + 40) context:*(void *)(a1 + 48)];
    goto LABEL_14;
  }
  if ([v4 isEqualToString:@"NL"])
  {
    id v5 = [*(id *)(a1 + 32) decodeActionNaturalLight:v3 localModel:*(void *)(a1 + 40) context:*(void *)(a1 + 48)];
    goto LABEL_14;
  }
  if ([v4 isEqualToString:@"MP"])
  {
    id v5 = [*(id *)(a1 + 32) decodeActionMediaPlayback:v3 localModel:*(void *)(a1 + 40) context:*(void *)(a1 + 48)];
    goto LABEL_14;
  }
  if ([v4 isEqualToString:@"S"])
  {
    id v5 = [*(id *)(a1 + 32) decodeActionShortcut:v3 localModel:*(void *)(a1 + 40) context:*(void *)(a1 + 48)];
    goto LABEL_14;
  }
  if ([v4 isEqualToString:@"AMAP"])
  {
    id v5 = [*(id *)(a1 + 32) decodeActionAppleMediaAccessoryPower:v3 localModel:*(void *)(a1 + 40) context:*(void *)(a1 + 48)];
    goto LABEL_14;
  }
  if (![v4 isEqualToString:@"C"])
  {
    id v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = *(id *)(a1 + 32);
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      int v19 = 138543618;
      char v20 = v14;
      __int16 v21 = 2112;
      id v22 = v3;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unknown encoded action type: %@", (uint8_t *)&v19, 0x16u);
    }
    goto LABEL_19;
  }
  id v6 = +[HMDCoreData featuresDataSource];
  int v7 = [v6 isRVCEnabled];

  if (v7)
  {
    id v5 = [*(id *)(a1 + 32) decodeActionCommand:v3 localModel:*(void *)(a1 + 40) context:*(void *)(a1 + 48)];
LABEL_14:
    id v8 = v5;
    if (v5)
    {
      BOOL v9 = *(void **)(a1 + 56);
      id v10 = [v5 objectID];
      [v9 addObject:v10];

      goto LABEL_22;
    }
  }
LABEL_19:
  id v15 = (void *)MEMORY[0x230FBD990]();
  id v16 = *(id *)(a1 + 32);
  id v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    uint64_t v18 = HMFGetLogIdentifier();
    int v19 = 138543618;
    char v20 = v18;
    __int16 v21 = 2112;
    id v22 = v3;
    _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode action, ignoring: %@", (uint8_t *)&v19, 0x16u);
  }
LABEL_22:
}

void __61__MKFCKScene_importIntoLocalModel_updatedProperties_context___block_invoke_24(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v6 = v3;
  id v5 = [v3 objectID];
  LOBYTE(v4) = [v4 containsObject:v5];

  if ((v4 & 1) == 0) {
    [*(id *)(a1 + 40) deleteObject:v6];
  }
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFCKScene"];
}

@end