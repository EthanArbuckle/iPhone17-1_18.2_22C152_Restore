@interface HKMedicationScheduleCloudIncompatibilityResolver
- (HKACAccountDeviceStore)accountDeviceStore;
- (HKACDeviceListRequestProtocol)deviceRequest;
- (HKHealthStore)healthStore;
- (HKMedicationScheduleCloudIncompatibilityResolver)init;
- (HKMedicationScheduleCloudIncompatibilityResolver)initWithHealthStore:(id)a3 accountStore:(id)a4 deviceRequest:(id)a5;
- (HKMedicationScheduleControl)scheduleControl;
- (void)checkIncompatibilityForSchedule:(id)a3 completion:(id)a4;
- (void)resolveIncompatibleSchedulesWithCompletion:(id)a3;
- (void)setAccountDeviceStore:(id)a3;
- (void)setDeviceRequest:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)setScheduleControl:(id)a3;
@end

@implementation HKMedicationScheduleCloudIncompatibilityResolver

- (HKMedicationScheduleCloudIncompatibilityResolver)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKMedicationScheduleCloudIncompatibilityResolver)initWithHealthStore:(id)a3 accountStore:(id)a4 deviceRequest:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HKMedicationScheduleCloudIncompatibilityResolver;
  v12 = [(HKMedicationScheduleBaseIncompatibilityResolver *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_healthStore, a3);
    v14 = [[HKACAccountDeviceStore alloc] initWithAccountStore:v10];
    accountDeviceStore = v13->_accountDeviceStore;
    v13->_accountDeviceStore = v14;

    objc_storeStrong((id *)&v13->_deviceRequest, a5);
    v16 = [[HKMedicationScheduleControl alloc] initWithHealthStore:v13->_healthStore];
    scheduleControl = v13->_scheduleControl;
    v13->_scheduleControl = v16;
  }
  return v13;
}

- (void)resolveIncompatibleSchedulesWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = dispatch_group_create();
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy_;
  v33[4] = __Block_byref_object_dispose_;
  id v34 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy_;
  v31[4] = __Block_byref_object_dispose_;
  id v32 = 0;
  dispatch_group_enter(v5);
  v6 = [(HKMedicationScheduleCloudIncompatibilityResolver *)self accountDeviceStore];
  v7 = [(HKMedicationScheduleCloudIncompatibilityResolver *)self deviceRequest];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __95__HKMedicationScheduleCloudIncompatibilityResolver_resolveIncompatibleSchedulesWithCompletion___block_invoke;
  v27[3] = &unk_1E62EAEA8;
  v29 = v31;
  v30 = v33;
  v27[4] = self;
  v8 = v5;
  v28 = v8;
  [v6 fetchDevicesWithRequest:v7 completion:v27];

  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy_;
  v25[4] = __Block_byref_object_dispose_;
  id v26 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy_;
  v23[4] = __Block_byref_object_dispose_;
  id v24 = 0;
  dispatch_group_enter(v8);
  id v9 = [(HKMedicationScheduleCloudIncompatibilityResolver *)self scheduleControl];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __95__HKMedicationScheduleCloudIncompatibilityResolver_resolveIncompatibleSchedulesWithCompletion___block_invoke_307;
  v19[3] = &unk_1E62EAEA8;
  v21 = v23;
  v22 = v25;
  v19[4] = self;
  id v10 = v8;
  v20 = v10;
  [v9 fetchAllSchedulesWithCompletion:v19];

  id v11 = [(HKHealthStore *)self->_healthStore clientQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __95__HKMedicationScheduleCloudIncompatibilityResolver_resolveIncompatibleSchedulesWithCompletion___block_invoke_308;
  v13[3] = &unk_1E62EAED0;
  v15 = v25;
  v16 = v23;
  v17 = v33;
  v18 = v31;
  v13[4] = self;
  id v14 = v4;
  id v12 = v4;
  dispatch_group_notify(v10, v11, v13);

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v25, 8);

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v33, 8);
}

void __95__HKMedicationScheduleCloudIncompatibilityResolver_resolveIncompatibleSchedulesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
  _HKInitializeLogging();
  v8 = HKLogMedication();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = objc_opt_class();
    id v10 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    id v11 = v9;
    int v12 = 138543618;
    v13 = v9;
    __int16 v14 = 2048;
    uint64_t v15 = [v10 count];
    _os_log_impl(&dword_1BCB4A000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Found %ld cloud devices to evaluate", (uint8_t *)&v12, 0x16u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __95__HKMedicationScheduleCloudIncompatibilityResolver_resolveIncompatibleSchedulesWithCompletion___block_invoke_307(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
  _HKInitializeLogging();
  v8 = HKLogMedication();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = objc_opt_class();
    id v10 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    id v11 = v9;
    int v12 = 138543618;
    v13 = v9;
    __int16 v14 = 2048;
    uint64_t v15 = [v10 count];
    _os_log_impl(&dword_1BCB4A000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Found %ld schedules to evaluate", (uint8_t *)&v12, 0x16u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __95__HKMedicationScheduleCloudIncompatibilityResolver_resolveIncompatibleSchedulesWithCompletion___block_invoke_308(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resolveIncompatibleScheduleResultsFromSchedules:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) scheduleError:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) devices:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) deviceError:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) completion:*(void *)(a1 + 40)];
}

- (void)checkIncompatibilityForSchedule:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HKMedicationScheduleCloudIncompatibilityResolver *)self accountDeviceStore];
  id v9 = [(HKMedicationScheduleCloudIncompatibilityResolver *)self deviceRequest];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __95__HKMedicationScheduleCloudIncompatibilityResolver_checkIncompatibilityForSchedule_completion___block_invoke;
  v12[3] = &unk_1E62EAF20;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [v8 fetchDevicesWithRequest:v9 completion:v12];
}

void __95__HKMedicationScheduleCloudIncompatibilityResolver_checkIncompatibilityForSchedule_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v5 = *(void **)(a1 + 32);
  v12[0] = *(void *)(a1 + 40);
  id v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a3;
  id v8 = a2;
  id v9 = [v6 arrayWithObjects:v12 count:1];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __95__HKMedicationScheduleCloudIncompatibilityResolver_checkIncompatibilityForSchedule_completion___block_invoke_2;
  v10[3] = &unk_1E62EAEF8;
  id v11 = *(id *)(a1 + 48);
  [v5 _resolveIncompatibleScheduleResultsFromSchedules:v9 scheduleError:0 devices:v8 deviceError:v7 completion:v10];
}

void __95__HKMedicationScheduleCloudIncompatibilityResolver_checkIncompatibilityForSchedule_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 firstObject];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (HKMedicationScheduleControl)scheduleControl
{
  return self->_scheduleControl;
}

- (void)setScheduleControl:(id)a3
{
}

- (HKACAccountDeviceStore)accountDeviceStore
{
  return self->_accountDeviceStore;
}

- (void)setAccountDeviceStore:(id)a3
{
}

- (HKACDeviceListRequestProtocol)deviceRequest
{
  return self->_deviceRequest;
}

- (void)setDeviceRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceRequest, 0);
  objc_storeStrong((id *)&self->_accountDeviceStore, 0);
  objc_storeStrong((id *)&self->_scheduleControl, 0);

  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end