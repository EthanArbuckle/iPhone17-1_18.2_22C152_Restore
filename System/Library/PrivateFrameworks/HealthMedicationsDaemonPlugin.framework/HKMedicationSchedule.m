@interface HKMedicationSchedule
+ (id)_codableArrayForMedicationScheduleIntervalDatas:(uint64_t)a1;
+ (id)_medicationScheduleIntervalDataFromCodable:(uint64_t)a1;
@end

@implementation HKMedicationSchedule

uint64_t __89__HKMedicationSchedule_HDCodingSupport___codableArrayForMedicationScheduleIntervalDatas___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hd_codableFromIntervalData");
}

+ (id)_codableArrayForMedicationScheduleIntervalDatas:(uint64_t)a1
{
  id v2 = a2;
  self;
  v3 = objc_msgSend(v2, "hk_map:", &__block_literal_global_323);

  return v3;
}

uint64_t __101__HKMedicationSchedule_HDCodingSupport__hd_medicationSchedulesFromCodables_profile_ignoreDuplicates___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v23 = a2;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v3 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v29;
    do
    {
      uint64_t v6 = 0;
      uint64_t v24 = v4;
      do
      {
        if (*(void *)v29 != v5) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v28 + 1) + 8 * v6);
        if (!*(unsigned char *)(a1 + 56) || ([*(id *)(*((void *)&v28 + 1) + 8 * v6) duplicate] & 1) == 0)
        {
          v8 = [*(id *)(a1 + 40) syncIdentityManager];
          v9 = [v8 legacySyncIdentity];

          if ([v7 hasSyncIdentity])
          {
            uint64_t v10 = v5;
            v11 = (void *)MEMORY[0x1E4F65C10];
            v12 = [v7 syncIdentity];
            id v27 = 0;
            v13 = [v11 syncIdentityWithCodable:v12 error:&v27];
            id v14 = v27;

            if (v13)
            {
              v15 = [*(id *)(a1 + 40) syncIdentityManager];
              id v26 = v14;
              uint64_t v16 = [v15 concreteIdentityForIdentity:v13 shouldCreate:1 transaction:v23 error:&v26];
              id v17 = v26;

              if (v16)
              {

                v9 = (void *)v16;
                uint64_t v5 = v10;
                uint64_t v4 = v24;
                goto LABEL_12;
              }
              _HKInitializeLogging();
              v21 = *MEMORY[0x1E4F29F18];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138543362;
                id v33 = v17;
                _os_log_fault_impl(&dword_1BD54A000, v21, OS_LOG_TYPE_FAULT, "MedicationSchedule ConcreteSyncIdentity from received codable is nil %{public}@", buf, 0xCu);
              }
              v9 = 0;
              id v14 = v17;
            }
            else
            {
              _HKInitializeLogging();
              v20 = *MEMORY[0x1E4F29F18];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138543362;
                id v33 = v14;
                _os_log_fault_impl(&dword_1BD54A000, v20, OS_LOG_TYPE_FAULT, "MedicationSchedule SyncIdentity from received codable is nil %{public}@", buf, 0xCu);
              }
            }
            uint64_t v5 = v10;
            uint64_t v4 = v24;
          }
          else
          {
LABEL_12:
            v18 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectForKeyedSubscript:v9];

            if (v18)
            {
              id v14 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectForKeyedSubscript:v9];
              v13 = objc_msgSend(MEMORY[0x1E4F66B28], "hd_medicationScheduleFromCodable:", v7);
              [v14 addObject:v13];
            }
            else
            {
              id v19 = objc_alloc(MEMORY[0x1E4F1CA48]);
              objc_msgSend(MEMORY[0x1E4F66B28], "hd_medicationScheduleFromCodable:", v7);
              id v14 = (id)objc_claimAutoreleasedReturnValue();
              v13 = objc_msgSend(v19, "initWithObjects:", v14, 0);
              [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v13 forKeyedSubscript:v9];
            }
          }
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v4);
  }

  return 1;
}

+ (id)_medicationScheduleIntervalDataFromCodable:(uint64_t)a1
{
  id v2 = a2;
  self;
  uint64_t v3 = objc_msgSend(v2, "hk_map:", &__block_literal_global_0);

  return v3;
}

uint64_t __84__HKMedicationSchedule_HDCodingSupport___medicationScheduleIntervalDataFromCodable___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E4F66B48], "hd_medicationScheduleIntervalDataFromCodable:", a2);
}

@end