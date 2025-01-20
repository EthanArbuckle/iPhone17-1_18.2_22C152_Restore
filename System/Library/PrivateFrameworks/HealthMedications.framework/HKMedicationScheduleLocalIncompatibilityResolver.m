@interface HKMedicationScheduleLocalIncompatibilityResolver
- (void)_unitTest_setPairedDeviceRegistry:(id)a3;
- (void)checkIncompatibilityForSchedule:(id)a3 completion:(id)a4;
- (void)checkIncompatibilityForSchedule:(id)a3 pairedDevice:(id)a4 completion:(id)a5;
@end

@implementation HKMedicationScheduleLocalIncompatibilityResolver

- (void)checkIncompatibilityForSchedule:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unitTestPairedDeviceRegistry = self->_unitTestPairedDeviceRegistry;
  if (unitTestPairedDeviceRegistry)
  {
    v9 = unitTestPairedDeviceRegistry;
  }
  else
  {
    v9 = [MEMORY[0x1E4F79EF0] sharedInstance];
  }
  v10 = v9;
  v11 = [(NRPairedDeviceRegistry *)v9 getActivePairedDevice];
  if (v11)
  {
    [(HKMedicationScheduleLocalIncompatibilityResolver *)self checkIncompatibilityForSchedule:v6 pairedDevice:v11 completion:v7];
  }
  else
  {
    _HKInitializeLogging();
    v12 = HKLogMedication();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543362;
      id v15 = (id)objc_opt_class();
      id v13 = v15;
      _os_log_impl(&dword_1BCB4A000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping incompatibility check, no active paired device found.", (uint8_t *)&v14, 0xCu);
    }
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

- (void)checkIncompatibilityForSchedule:(id)a3 pairedDevice:(id)a4 completion:(id)a5
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [[HKACAccountDevice alloc] initWithPairedDevice:v9];

  v18[0] = v10;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  v17 = v11;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __108__HKMedicationScheduleLocalIncompatibilityResolver_checkIncompatibilityForSchedule_pairedDevice_completion___block_invoke;
  v15[3] = &unk_1E62EAEF8;
  id v16 = v8;
  id v14 = v8;
  [(HKMedicationScheduleBaseIncompatibilityResolver *)self _resolveIncompatibleScheduleResultsFromSchedules:v12 scheduleError:0 devices:v13 deviceError:0 completion:v15];
}

void __108__HKMedicationScheduleLocalIncompatibilityResolver_checkIncompatibilityForSchedule_pairedDevice_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 firstObject];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

- (void)_unitTest_setPairedDeviceRegistry:(id)a3
{
}

- (void).cxx_destruct
{
}

@end