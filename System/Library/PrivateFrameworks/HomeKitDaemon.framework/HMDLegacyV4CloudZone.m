@interface HMDLegacyV4CloudZone
- (HMDLegacyV4CloudZone)initWithCloudDatabase:(id)a3 configuration:(id)a4 state:(id)a5;
- (NSSet)participants;
- (NSString)rootRecordName;
- (id)decodeModelFromRecord:(id)a3 externalRecordFields:(id)a4 source:(unint64_t)a5 error:(id *)a6;
- (id)encodeRecordFromModel:(id)a3 existingRecord:(id)a4 encodingContext:(id)a5 error:(id *)a6;
- (id)recordIDForParentModelID:(id)a3;
- (id)recordWithExistingRecord:(id)a3 modelData:(id)a4 parentModelID:(id)a5 modelContainer:(id)a6 error:(id *)a7;
- (id)rootRecordModelID;
- (id)rootRecordParentModelID;
- (id)tupleForRootRecordWithOutputBlockRow:(unint64_t)a3 objectIDToRecordNameMap:(id)a4;
- (id)waitForPendingRebuild;
- (int64_t)keyStatus;
- (void)pushGroupWithBlockRow:(unint64_t)a3 tuples:(id)a4 options:(id)a5 activity:(id)a6 completionPromise:(id)a7;
@end

@implementation HMDLegacyV4CloudZone

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootRecordName, 0);
  objc_storeStrong((id *)&self->_participants, 0);
}

- (NSString)rootRecordName
{
  return (NSString *)objc_getProperty(self, a2, 216, 1);
}

- (int64_t)keyStatus
{
  return self->_keyStatus;
}

- (NSSet)participants
{
  return self->_participants;
}

- (id)waitForPendingRebuild
{
  return (id)[MEMORY[0x263F58190] futureWithNoResult];
}

- (id)encodeRecordFromModel:(id)a3 existingRecord:(id)a4 encodingContext:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [(HMBCloudZone *)self modelContainer];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v14 = v13;
  }
  else {
    v14 = 0;
  }
  id v15 = v14;

  if (!v15)
  {
    _HMFPreconditionFailure();
LABEL_13:
    v21 = (HMDLegacyV4CloudZone *)_HMFPreconditionFailure();
    [(HMDLegacyV4CloudZone *)v21 pushGroupWithBlockRow:v23 tuples:v24 options:v25 activity:v26 completionPromise:v27];
    return result;
  }
  [v10 hmbAssociateWithContainer:v15];
  id v16 = v10;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v17 = v16;
  }
  else {
    v17 = 0;
  }
  id v18 = v17;

  if (!v18) {
    goto LABEL_13;
  }
  v19 = [v18 encodeWithExistingRecord:v11 cloudZone:self modelContainer:v15 error:a6];

  return v19;
}

- (void)pushGroupWithBlockRow:(unint64_t)a3 tuples:(id)a4 options:(id)a5 activity:(id)a6 completionPromise:(id)a7
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v12 = a4;
  id v34 = a5;
  id v33 = a6;
  id v13 = a7;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__185465;
  v45 = __Block_byref_object_dispose__185466;
  id v46 = 0;
  v14 = [(HMBCloudZone *)self localZone];
  id v15 = [(HMDLegacyV4CloudZone *)self rootRecordModelID];
  id v16 = (id *)(v42 + 5);
  id obj = (id)v42[5];
  v17 = [v14 fetchModelWithModelID:v15 error:&obj];
  objc_storeStrong(v16, obj);

  id v18 = [v17 convertToHMDModelObject];
  v19 = v18;
  if (v18)
  {
    v20 = [v18 objectIDToRecordNameMap];
    v21 = (void *)[v20 mutableCopy];
  }
  else
  {
    SEL v22 = (void *)MEMORY[0x230FBD990]();
    unint64_t v23 = self;
    HMFGetOSLogHandle();
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      id v25 = HMFGetLogIdentifier();
      uint64_t v26 = v42[5];
      *(_DWORD *)buf = 138543618;
      v48 = v25;
      __int16 v49 = 2112;
      uint64_t v50 = v26;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch root record model object from DB: %@", buf, 0x16u);
    }
    v21 = [MEMORY[0x263EFF9A0] dictionary];
    v20 = [(HMDLegacyV4CloudZone *)v23 rootRecordName];
    id v27 = [(HMDLegacyV4CloudZone *)v23 rootRecordModelID];
    v28 = [v27 UUIDString];
    [v21 setObject:v20 forKey:v28];
  }
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __88__HMDLegacyV4CloudZone_pushGroupWithBlockRow_tuples_options_activity_completionPromise___block_invoke;
  v36[3] = &unk_264A24768;
  v39 = &v41;
  v36[4] = self;
  id v29 = v33;
  id v37 = v29;
  id v30 = v21;
  id v38 = v30;
  objc_msgSend(v12, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v36);
  v31 = [(HMDLegacyV4CloudZone *)self tupleForRootRecordWithOutputBlockRow:a3 objectIDToRecordNameMap:v30];
  v32 = [v12 arrayByAddingObject:v31];

  v35.receiver = self;
  v35.super_class = (Class)HMDLegacyV4CloudZone;
  [(HMBCloudZone *)&v35 pushGroupWithBlockRow:a3 tuples:v32 options:v34 activity:v29 completionPromise:v13];

  _Block_object_dispose(&v41, 8);
}

void __88__HMDLegacyV4CloudZone_pushGroupWithBlockRow_tuples_options_activity_completionPromise___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  v6 = [v3 externalID];
  uint64_t v7 = [v6 length];

  if (!v7)
  {
    v20 = [v3 model];

    if (v20)
    {
      v21 = *(void **)(a1 + 32);
      SEL v22 = [v3 model];
      id v11 = [v21 recordIDForModel:v22];
    }
    else
    {
      id v11 = 0;
    }
LABEL_9:
    unint64_t v23 = [v3 model];

    if (!v23)
    {
      v53 = [v11 recordName];
      v54 = *(void **)(a1 + 48);
      v70[0] = MEMORY[0x263EF8330];
      v70[1] = 3221225472;
      v70[2] = __88__HMDLegacyV4CloudZone_pushGroupWithBlockRow_tuples_options_activity_completionPromise___block_invoke_25;
      v70[3] = &unk_264A24740;
      id v55 = v53;
      id v71 = v55;
      objc_msgSend(v54, "na_firstKeyPassingTest:", v70);
      v56 = (char *)objc_claimAutoreleasedReturnValue();
      v57 = (void *)MEMORY[0x230FBD990]();
      id v58 = *(id *)(a1 + 32);
      v59 = HMFGetOSLogHandle();
      BOOL v60 = os_log_type_enabled(v59, OS_LOG_TYPE_INFO);
      if (v56)
      {
        if (v60)
        {
          v61 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v74 = v61;
          __int16 v75 = 2112;
          v76 = v56;
          _os_log_impl(&dword_22F52A000, v59, OS_LOG_TYPE_INFO, "%{public}@Removing modelID %@ from lookup", buf, 0x16u);
        }
        [*(id *)(a1 + 48) removeObjectForKey:v56];
      }
      else
      {
        if (v60)
        {
          v62 = HMFGetLogIdentifier();
          v63 = [v11 hmbDescription];
          *(_DWORD *)buf = 138543618;
          v74 = v62;
          __int16 v75 = 2112;
          v76 = v63;
          _os_log_impl(&dword_22F52A000, v59, OS_LOG_TYPE_INFO, "%{public}@Unable to find modelID for deleted cloud record: %@", buf, 0x16u);
        }
      }

      goto LABEL_34;
    }
    id v24 = [v3 model];
    id v25 = [v24 hmbModelID];
    uint64_t v26 = [v25 UUIDString];

    id v27 = (void *)MEMORY[0x230FBD990]();
    id v28 = *(id *)(a1 + 32);
    id v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v30 = v67 = v3;
      [*(id *)(a1 + 48) objectForKey:v26];
      v31 = v66 = v26;
      if (v31) {
        v32 = "Updating";
      }
      else {
        v32 = "Adding";
      }
      [v67 model];
      v34 = id v33 = v11;
      objc_super v35 = [v34 hmbModelID];
      [v33 hmbDescription];
      v36 = v65 = v27;
      *(_DWORD *)buf = 138544130;
      v74 = v30;
      __int16 v75 = 2080;
      v76 = v32;
      __int16 v77 = 2112;
      v78 = v35;
      __int16 v79 = 2112;
      v80 = v36;
      _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_INFO, "%{public}@%s modelIDRecordName lookup %@ -> %@", buf, 0x2Au);

      id v11 = v33;
      uint64_t v26 = v66;

      id v27 = v65;
      id v3 = v67;
    }

    id v37 = *(void **)(a1 + 48);
    id v38 = [v11 recordName];
    [v37 setObject:v38 forKey:v26];

    v39 = [v3 externalID];

    if (v39)
    {
LABEL_33:

LABEL_34:
      goto LABEL_35;
    }
    v40 = (void *)[objc_alloc(MEMORY[0x263EFD7C8]) initWithRecordType:@"ObjectRecord" recordID:v11];
    uint64_t v41 = *(void *)(*(void *)(a1 + 56) + 8);
    id v69 = *(id *)(v41 + 40);
    v42 = [v40 externalData:&v69];
    objc_storeStrong((id *)(v41 + 40), v69);
    [v3 setExternalData:v42];

    uint64_t v43 = [v3 externalData];

    if (v43)
    {
      uint64_t v44 = *(void *)(*(void *)(a1 + 56) + 8);
      id v68 = *(id *)(v44 + 40);
      v45 = [v11 externalID:&v68];
      objc_storeStrong((id *)(v44 + 40), v68);
      [v3 setExternalID:v45];

      id v46 = [v3 externalID];

      if (v46)
      {
LABEL_32:

        goto LABEL_33;
      }
      v47 = (void *)MEMORY[0x230FBD990]();
      id v48 = *(id *)(a1 + 32);
      __int16 v49 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        uint64_t v50 = HMFGetLogIdentifier();
        uint64_t v51 = *(const char **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        *(_DWORD *)buf = 138543618;
        v74 = v50;
        __int16 v75 = 2112;
        v76 = v51;
        v52 = "%{public}@Unable to generate external id from CKRecordID (this will cause issues later): %@";
LABEL_30:
        _os_log_impl(&dword_22F52A000, v49, OS_LOG_TYPE_ERROR, v52, buf, 0x16u);
      }
    }
    else
    {
      v47 = (void *)MEMORY[0x230FBD990]();
      id v48 = *(id *)(a1 + 32);
      __int16 v49 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        uint64_t v50 = HMFGetLogIdentifier();
        v64 = *(const char **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        *(_DWORD *)buf = 138543618;
        v74 = v50;
        __int16 v75 = 2112;
        v76 = v64;
        v52 = "%{public}@Unable to generate external data from CKRecord (this will cause issues later): %@";
        goto LABEL_30;
      }
    }

    goto LABEL_32;
  }
  v8 = (void *)MEMORY[0x263EFD7E8];
  v9 = [v3 externalID];
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v10 + 40);
  id v11 = [v8 recordIDFromExternalID:v9 error:&obj];
  objc_storeStrong((id *)(v10 + 40), obj);

  if (v11) {
    goto LABEL_9;
  }
  id v12 = (void *)MEMORY[0x230FBD990]();
  id v13 = *(id *)(a1 + 32);
  v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    id v15 = HMFGetLogIdentifier();
    id v16 = [*(id *)(a1 + 40) identifier];
    v17 = [v16 shortDescription];
    id v18 = [v3 externalID];
    v19 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    *(_DWORD *)buf = 138544130;
    v74 = v15;
    __int16 v75 = 2114;
    v76 = v17;
    __int16 v77 = 2112;
    v78 = v18;
    __int16 v79 = 2112;
    v80 = v19;
    _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to decode encoded record ID %@: %@", buf, 0x2Au);
  }
LABEL_35:
}

uint64_t __88__HMDLegacyV4CloudZone_pushGroupWithBlockRow_tuples_options_activity_completionPromise___block_invoke_25(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 isEqual:*(void *)(a1 + 32)];
}

- (id)tupleForRootRecordWithOutputBlockRow:(unint64_t)a3 objectIDToRecordNameMap:(id)a4
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  id v66 = a4;
  v5 = [HMDCloudGroupRootRecordModelObject alloc];
  v6 = [(HMDLegacyV4CloudZone *)self rootRecordModelID];
  uint64_t v7 = [(HMDLegacyV4CloudZone *)self rootRecordParentModelID];
  v8 = [(HMDBackingStoreModelObject *)v5 initWithUUID:v6 parentUUID:v7];

  [(HMDCloudGroupRootRecordModelObject *)v8 setObjectIDToRecordNameMap:v66];
  id v68 = v8;
  v70 = [(HMDBackingStoreModelObject *)v8 convertToLegacyV4];
  uint64_t v87 = 0;
  v88 = &v87;
  uint64_t v89 = 0x2020000000;
  uint64_t v90 = 0;
  v9 = [(HMBCloudZone *)self localZone];
  uint64_t v10 = [v9 modelContainer];
  uint64_t v67 = [v10 bestModelEncodingForStorageLocation:2];

  id v11 = [v9 modelContainer];
  id v86 = 0;
  v65 = [v11 dataFromModel:v70 encoding:v67 storageLocation:2 updatedModelIDs:0 error:&v86];
  id v12 = v86;

  id v13 = [(HMDBackingStoreModelObject *)v68 uuid];
  id v85 = v12;
  v14 = [v9 fetchRecordRowWithModelID:v13 returning:-1 error:&v85];
  id context = v85;

  if (!v14)
  {
    if (context)
    {
      id v48 = (void *)MEMORY[0x230FBD990]();
      __int16 v49 = self;
      HMFGetOSLogHandle();
      uint64_t v50 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v51 = (id)objc_claimAutoreleasedReturnValue();
        v52 = [(HMDBackingStoreModelObject *)v68 uuid];
        *(_DWORD *)buf = 138543874;
        id v92 = v51;
        __int16 v93 = 2112;
        uint64_t v94 = (uint64_t)v52;
        __int16 v95 = 2112;
        id v96 = context;
        _os_log_impl(&dword_22F52A000, v50, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch record row for rootRecordModel (%@): %@", buf, 0x20u);
      }
      id result = (id)_HMFPreconditionFailure();
    }
    else
    {
      id v27 = objc_alloc(MEMORY[0x263EFD7E8]);
      id v28 = [(HMBCloudZone *)self cloudZoneID];
      id v29 = [v28 zoneID];
      id v69 = (void *)[v27 initWithRecordName:@"4B0A9686-599F-487E-B2B0-B63BF838D813" zoneID:v29];

      uint64_t v26 = (void *)[objc_alloc(MEMORY[0x263EFD7C8]) initWithRecordType:@"ObjectRecord" recordID:v69];
      id v84 = 0;
      id v30 = [v69 externalID:&v84];
      id v31 = v84;
      v32 = v31;
      if (v30)
      {
        id v83 = v31;
        id v33 = [v26 externalData:&v83];
        id v61 = v83;

        contexta = (void *)MEMORY[0x230FBD990]();
        id v34 = self;
        if (v33)
        {
          HMFGetOSLogHandle();
          objc_super v35 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            BOOL v60 = v30;
            HMFGetLogIdentifier();
            id v36 = (id)objc_claimAutoreleasedReturnValue();
            id v37 = [(HMDBackingStoreModelObject *)v68 uuid];
            id v38 = [v69 hmbDescription];
            *(_DWORD *)buf = 138543874;
            id v92 = v36;
            __int16 v93 = 2112;
            uint64_t v94 = (uint64_t)v37;
            __int16 v95 = 2112;
            id v96 = v38;
            _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@CREATING NEW ROOT RECORD: %@ / %@", buf, 0x20u);

            id v30 = v60;
          }

          v39 = [v9 sql];
          v75[0] = MEMORY[0x263EF8330];
          v75[1] = 3221225472;
          v75[2] = __85__HMDLegacyV4CloudZone_tupleForRootRecordWithOutputBlockRow_objectIDToRecordNameMap___block_invoke;
          v75[3] = &unk_264A246F0;
          uint64_t v81 = &v87;
          id v76 = v9;
          id v15 = v30;
          id v77 = v15;
          id v16 = v33;
          id v78 = v16;
          id v79 = v70;
          uint64_t v82 = v67;
          id v80 = v65;
          uint64_t v40 = [v39 sqlTransactionWithActivity:0 block:v75];

          if (!v40)
          {

            goto LABEL_13;
          }
          contexta = (void *)MEMORY[0x230FBD990]();
          id v58 = v34;
          HMFGetOSLogHandle();
          v54 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
          {
            v59 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            id v92 = v59;
            __int16 v93 = 2112;
            uint64_t v94 = v40;
            _os_log_impl(&dword_22F52A000, v54, OS_LOG_TYPE_ERROR, "%{public}@Unable to create new record row for rootRecordModel: %@", buf, 0x16u);
          }
        }
        else
        {
          HMFGetOSLogHandle();
          v54 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            id v56 = (id)objc_claimAutoreleasedReturnValue();
            v57 = [v26 hmbDescription];
            *(_DWORD *)buf = 138543874;
            id v92 = v56;
            __int16 v93 = 2112;
            uint64_t v94 = (uint64_t)v57;
            __int16 v95 = 2112;
            id v96 = v61;
            _os_log_impl(&dword_22F52A000, v54, OS_LOG_TYPE_ERROR, "%{public}@Unable to create externalData from %@: %@", buf, 0x20u);
          }
        }
      }
      else
      {
        contexta = (void *)MEMORY[0x230FBD990]();
        v53 = self;
        HMFGetOSLogHandle();
        v54 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          id v55 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          id v92 = v55;
          __int16 v93 = 2112;
          uint64_t v94 = (uint64_t)v69;
          __int16 v95 = 2112;
          id v96 = v32;
          _os_log_impl(&dword_22F52A000, v54, OS_LOG_TYPE_ERROR, "%{public}@Unable to create externalID from %@: %@", buf, 0x20u);
        }
      }

      id result = (id)_HMFPreconditionFailure();
    }
LABEL_29:
    __break(1u);
    return result;
  }
  id v15 = [v14 externalID];
  id v16 = [v14 externalData];
  uint64_t v17 = [v14 recordRow];
  v88[3] = v17;
  id v69 = [MEMORY[0x263EFD7E8] recordIDFromExternalID:v15 error:0];
  id v18 = (void *)MEMORY[0x230FBD990]();
  v19 = self;
  HMFGetOSLogHandle();
  v20 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    id v22 = [v70 hmbDescription];
    unint64_t v23 = [v69 hmbDescription];
    *(_DWORD *)buf = 138543874;
    id v92 = v21;
    __int16 v93 = 2112;
    uint64_t v94 = (uint64_t)v22;
    __int16 v95 = 2112;
    id v96 = v23;
    _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@UPDATING EXISTING ROOT RECORD: %@ / %@", buf, 0x20u);
  }
  id v24 = [v9 sql];
  v71[0] = MEMORY[0x263EF8330];
  v71[1] = 3221225472;
  v71[2] = __85__HMDLegacyV4CloudZone_tupleForRootRecordWithOutputBlockRow_objectIDToRecordNameMap___block_invoke_22;
  v71[3] = &unk_264A24718;
  id v72 = v14;
  uint64_t v74 = v67;
  id v73 = v65;
  uint64_t v25 = [v24 sqlTransactionWithActivity:0 block:v71];

  if (v25)
  {
    uint64_t v44 = (void *)MEMORY[0x230FBD990]();
    v45 = v19;
    HMFGetOSLogHandle();
    id v46 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      v47 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v92 = v47;
      __int16 v93 = 2112;
      uint64_t v94 = v25;
      _os_log_impl(&dword_22F52A000, v46, OS_LOG_TYPE_ERROR, "%{public}@Unable to update record row for rootRecordModel: %@", buf, 0x16u);
    }
    id result = (id)_HMFPreconditionFailure();
    goto LABEL_29;
  }

  uint64_t v26 = v72;
LABEL_13:

  id v41 = objc_alloc(MEMORY[0x263F49298]);
  v42 = (void *)[v41 initWithOutputBlockRow:a3 recordRow:v88[3] model:v70 queryTable:0 externalID:v15 externalData:v16];

  _Block_object_dispose(&v87, 8);
  return v42;
}

id __85__HMDLegacyV4CloudZone_tupleForRootRecordWithOutputBlockRow_objectIDToRecordNameMap___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 zoneRow];
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v18 = v5;
  uint64_t v7 = [*(id *)(a1 + 56) hmbModelID];
  v8 = [*(id *)(a1 + 56) hmbParentModelID];
  v9 = [*(id *)(a1 + 56) hmbType];
  uint64_t v10 = *(void *)(a1 + 80);
  uint64_t v11 = *(void *)(a1 + 64);
  id v12 = [*(id *)(a1 + 32) modelContainer];
  id v13 = [v12 schemaHashForModel:*(void *)(a1 + 56)];
  id v19 = 0;
  uint64_t v14 = [v4 _insertRecordWithZoneRow:v18 externalID:v17 externalData:v6 modelID:v7 parentModelID:v8 modelType:v9 modelEncoding:v10 modelData:v11 modelSchema:v13 pushEncoding:0 pushData:0 pushBlockRow:0 error:&v19];

  id v15 = v19;
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v14;

  return v15;
}

id __85__HMDLegacyV4CloudZone_tupleForRootRecordWithOutputBlockRow_objectIDToRecordNameMap___block_invoke_22(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 recordRow];
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  v8 = [*(id *)(a1 + 32) modelSchema];
  id v11 = 0;
  [v4 _updateRecordWithRow:v5 modelEncoding:v6 modelData:v7 modelSchema:v8 error:&v11];

  id v9 = v11;
  return v9;
}

- (id)rootRecordParentModelID
{
  id v3 = objc_alloc(MEMORY[0x263F08C38]);
  id v4 = [(HMBCloudZone *)self cloudZoneID];
  uint64_t v5 = [v4 zoneID];
  uint64_t v6 = [v5 zoneName];
  uint64_t v7 = (void *)[v3 initWithUUIDString:v6];

  return v7;
}

- (id)rootRecordModelID
{
  v13[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F08C38]);
  id v4 = [(HMDLegacyV4CloudZone *)self rootRecordName];
  uint64_t v5 = (void *)[v3 initWithUUIDString:v4];

  uint64_t v6 = [(HMBCloudZone *)self cloudZoneID];
  uint64_t v7 = [v6 zoneID];
  v8 = [v7 zoneName];

  id v9 = (void *)MEMORY[0x263F08C38];
  v13[0] = v8;
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  id v11 = objc_msgSend(v9, "hm_deriveUUIDFromBaseUUID:identifierSalt:withSalts:", v5, 0, v10);

  return v11;
}

- (id)recordWithExistingRecord:(id)a3 modelData:(id)a4 parentModelID:(id)a5 modelContainer:(id)a6 error:(id *)a7
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v65 = a5;
  id v13 = a6;
  id v14 = v11;
  id v15 = v14;
  if (!v14)
  {
    id v16 = [(HMDLegacyV4CloudZone *)self recordIDForParentModelID:v65];
    uint64_t v17 = (void *)[objc_alloc(MEMORY[0x263EFD7C8]) initWithRecordType:@"ObjectRecord" recordID:v16];
    uint64_t v18 = (void *)MEMORY[0x230FBD990]();
    id v19 = self;
    v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      id v21 = v66 = v18;
      id v22 = [v17 hmbDescription];
      *(_DWORD *)buf = 138543618;
      id v73 = v21;
      __int16 v74 = 2112;
      id v75 = v22;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@Creating new cloud record %@ to store model.", buf, 0x16u);

      uint64_t v18 = v66;
    }

    id v15 = v17;
  }
  id v23 = [v13 modelFromData:v12 encoding:1 storageLocation:1 error:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v24 = v23;
  }
  else {
    id v24 = 0;
  }
  id v25 = v24;

  v64 = v25;
  if (v25)
  {
    uint64_t v26 = [v25 convertToHMDModelObject];
    uint64_t v67 = [v26 debugString:1];
  }
  else
  {
    uint64_t v67 = [v23 debugDescription];
  }
  id v27 = (void *)MEMORY[0x230FBD990]();
  id v28 = self;
  id v29 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    id v30 = HMFGetLogIdentifier();
    id v31 = [v14 recordID];
    [v15 recordID];
    id v61 = v12;
    id v32 = v23;
    id v33 = v15;
    id v34 = v14;
    v36 = id v35 = v13;
    *(_DWORD *)buf = 138544130;
    id v73 = v30;
    __int16 v74 = 2112;
    id v75 = v31;
    __int16 v76 = 2112;
    id v77 = v36;
    __int16 v78 = 2112;
    id v79 = v67;
    _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@V4 CLOUD SAVE: %@/%@:\n%@", buf, 0x2Au);

    id v13 = v35;
    id v14 = v34;
    id v15 = v33;
    id v23 = v32;
    id v12 = v61;
  }
  id v69 = 0;
  id v37 = [v13 encryptData:v12 compress:1 error:&v69];
  id v38 = v69;

  if (v38)
  {
    v39 = (void *)MEMORY[0x230FBD990]();
    uint64_t v40 = v28;
    id v41 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      id v42 = v23;
      uint64_t v43 = v15;
      id v44 = v14;
      id v46 = v45 = v13;
      *(_DWORD *)buf = 138543618;
      id v73 = v46;
      __int16 v74 = 2112;
      id v75 = v38;
      _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_ERROR, "%{public}@Unable to encrypt model field: %@", buf, 0x16u);

      id v13 = v45;
      id v14 = v44;
      id v15 = v43;
      id v23 = v42;
    }

    id v47 = 0;
    if (a7) {
      *a7 = v38;
    }
  }
  else
  {
    id v62 = v13;
    [v15 hmbSetObject:v37 forKey:@"k01" encrypted:0];
    uint64_t v48 = *MEMORY[0x263F49360];
    v70[0] = *MEMORY[0x263F49368];
    v70[1] = v48;
    v71[0] = &unk_26E472838;
    __int16 v49 = [MEMORY[0x263F08C38] UUID];
    uint64_t v50 = [v49 UUIDString];
    v71[1] = v50;
    id v51 = [NSDictionary dictionaryWithObjects:v71 forKeys:v70 count:2];

    id v68 = 0;
    v52 = [MEMORY[0x263F08910] archivedDataWithRootObject:v51 requiringSecureCoding:1 error:&v68];
    id v53 = v68;
    if (v52)
    {
      [v15 hmbSetObject:v52 forKey:*MEMORY[0x263F49358] encrypted:0];
      id v47 = v15;
      id v13 = v62;
    }
    else
    {
      id v60 = v23;
      v54 = (void *)MEMORY[0x230FBD990]();
      id v55 = v28;
      id v56 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v57 = v59 = v55;
        *(_DWORD *)buf = 138543618;
        id v73 = v57;
        __int16 v74 = 2112;
        id v75 = v53;
        _os_log_impl(&dword_22F52A000, v56, OS_LOG_TYPE_ERROR, "%{public}@Unable to create / encode cloud record metadata: %@", buf, 0x16u);

        id v55 = v59;
      }

      id v13 = v62;
      id v47 = 0;
      if (a7) {
        *a7 = v53;
      }
      id v23 = v60;
    }
  }
  return v47;
}

- (id)recordIDForParentModelID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDLegacyV4CloudZone *)self rootRecordModelID];
  int v6 = [v4 isEqual:v5];

  id v7 = objc_alloc(MEMORY[0x263EFD7E8]);
  if (v6)
  {
    v8 = [(HMDLegacyV4CloudZone *)self rootRecordName];
    id v9 = [(HMBCloudZone *)self cloudZoneID];
    uint64_t v10 = [v9 zoneID];
    id v11 = (void *)[v7 initWithRecordName:v8 zoneID:v10];
  }
  else
  {
    v8 = [MEMORY[0x263F08C38] UUID];
    id v9 = [v8 UUIDString];
    uint64_t v10 = [(HMBCloudZone *)self cloudZoneID];
    id v12 = [v10 zoneID];
    id v11 = (void *)[v7 initWithRecordName:v9 zoneID:v12];
  }
  return v11;
}

- (id)decodeModelFromRecord:(id)a3 externalRecordFields:(id)a4 source:(unint64_t)a5 error:(id *)a6
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = [(HMBCloudZone *)self modelContainer];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  if (!v13) {
    _HMFPreconditionFailure();
  }
  id v14 = [v9 recordType];
  int v15 = [v14 isEqualToString:@"ObjectRecord"];

  if (v15
    && (+[HMDLegacyV4Model createWithLegacyRecord:v9 modelContainer:v13 error:a6], (uint64_t v16 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v17 = (void *)v16;
    uint64_t v18 = [(HMBCloudZone *)self modelContainer];
    [v17 hmbAssociateWithContainer:v18];
  }
  else
  {
    id v19 = (void *)MEMORY[0x230FBD990]();
    v20 = self;
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v22 = HMFGetLogIdentifier();
      id v23 = [v9 hmbDescription];
      int v25 = 138543618;
      uint64_t v26 = v22;
      __int16 v27 = 2112;
      id v28 = v23;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode record %@ from legacy cloud zone.", (uint8_t *)&v25, 0x16u);
    }
    if (a6 && !*a6)
    {
      [MEMORY[0x263F087E8] hmfErrorWithCode:15];
      uint64_t v17 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v17 = 0;
    }
  }

  return v17;
}

- (HMDLegacyV4CloudZone)initWithCloudDatabase:(id)a3 configuration:(id)a4 state:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)HMDLegacyV4CloudZone;
  id v11 = [(HMBCloudZone *)&v21 initWithCloudDatabase:v8 configuration:v9 state:v10];
  id v12 = v11;
  if (!v11) {
    goto LABEL_7;
  }
  [(HMBCloudZone *)v11 setDefaultDesiredKeys:0];
  id v13 = v9;
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
    uint64_t v16 = [v15 rootRecordName];
    rootRecordName = v12->_rootRecordName;
    v12->_rootRecordName = (NSString *)v16;

LABEL_7:
    return v12;
  }
  id v19 = (HMDLegacyCloudZoneConfiguration *)_HMFPreconditionFailure();
  [(HMDLegacyCloudZoneConfiguration *)v19 .cxx_destruct];
  return result;
}

@end