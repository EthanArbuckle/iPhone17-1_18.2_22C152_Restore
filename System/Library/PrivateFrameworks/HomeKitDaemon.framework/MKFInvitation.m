@interface MKFInvitation
@end

@implementation MKFInvitation

void __66___MKFInvitation_populateWorkingStoreFromRestrictedGuestSchedule___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a2;
  char v14 = 0;
  v7 = *(void **)(a1 + 32);
  v8 = [MEMORY[0x263F08C38] UUID];
  v9 = [v7 materializeOrCreateWeekDayScheduleRulesRelationWithModelID:v8 createdNew:&v14];

  if (v14)
  {
    [v9 updateFromWeekDayScheduleRule:v6];
  }
  else
  {
    v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = *(id *)(a1 + 32);
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v16 = v13;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unable to create week day schedule from : %@", buf, 0x16u);
    }
    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

void __66___MKFInvitation_populateWorkingStoreFromRestrictedGuestSchedule___block_invoke_6(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a2;
  char v18 = 0;
  v7 = *(void **)(a1 + 32);
  v8 = [MEMORY[0x263F08C38] UUID];
  v9 = [v7 materializeOrCreateYearDayScheduleRulesRelationWithModelID:v8 createdNew:&v18];

  if (v18)
  {
    v10 = [v6 dateInterval];
    id v11 = [v10 startDate];
    [v9 setStartDate:v11];

    v12 = [v6 dateInterval];
    v13 = [v12 endDate];
    [v9 setEndDate:v13];
  }
  else
  {
    char v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = *(id *)(a1 + 32);
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      __int16 v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v20 = v17;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unable to create year day schedule from : %@", buf, 0x16u);
    }
    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

uint64_t __41___MKFInvitation_restrictedGuestSchedule__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 yearDayScheduleRule];
}

uint64_t __41___MKFInvitation_restrictedGuestSchedule__block_invoke(uint64_t a1, void *a2)
{
  return [a2 weekDayScheduleRule];
}

@end