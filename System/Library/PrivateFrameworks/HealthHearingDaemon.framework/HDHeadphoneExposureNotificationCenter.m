@interface HDHeadphoneExposureNotificationCenter
- (HDHeadphoneExposureNotificationCenter)initWithProfile:(id)a3 syncManager:(id)a4;
- (id)postSevenDayDoseNotification:(id)a3 nowDate:(id)a4 analyticsInfo:(id)a5 error:(id *)a6;
- (void)_reportHeadphoneNotificationWithNowDate:(id)a3 eventDuration:(double)a4 exposureLevel:(double)a5 exposureDuration:(double)a6 hasPrunableData:(BOOL)a7 isDeviceLocked:(BOOL)a8 analyticsInfo:(id)a9;
@end

@implementation HDHeadphoneExposureNotificationCenter

- (HDHeadphoneExposureNotificationCenter)initWithProfile:(id)a3 syncManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)HDHeadphoneExposureNotificationCenter;
  v8 = [(HDHeadphoneExposureNotificationCenter *)&v19 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_profile, v6);
    v10 = [MEMORY[0x263F086E0] mainBundle];
    v11 = [v10 bundleIdentifier];

    uint64_t v12 = [objc_alloc(MEMORY[0x263F41DC8]) initWithBundleIdentifier:v11];
    notificationCenter = v9->_notificationCenter;
    v9->_notificationCenter = (HAENotificationCenter *)v12;

    objc_storeStrong((id *)&v9->_notificationSyncManager, a4);
    id WeakRetained = objc_loadWeakRetained((id *)&v9->_profile);
    uint64_t v15 = [WeakRetained cloudSyncManager];
    cloudSyncManager = v9->_cloudSyncManager;
    v9->_cloudSyncManager = (HDCloudSyncManager *)v15;

    v17 = v9;
  }

  return v9;
}

- (id)postSevenDayDoseNotification:(id)a3 nowDate:(id)a4 analyticsInfo:(id)a5 error:(id *)a6
{
  v75[3] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (([MEMORY[0x263F44978] isHeadphoneExposureNotificationsEnabled] & 1) == 0)
  {
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:", a6, 111, @"Cannot Send 7-Day HAEN: Feature Disabled.");
    id v56 = 0;
    goto LABEL_23;
  }
  v13 = [v10 statistics];
  id v70 = 0;
  v14 = objc_msgSend(v13, "hk_hearingSevenDayDosePercentageWithError:", &v70);
  id v15 = v70;
  if (v14)
  {
    id v69 = 0;
    v16 = objc_msgSend(v13, "hk_hearingSevenDayDoseDateIntervalEndingBeforeDate:error:", v11, &v69);
    id v17 = v69;
    v18 = v17;
    if (!v16)
    {
      objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:underlyingError:", a6, 100, @"invalid statistics interval", v17);
      id v56 = 0;
LABEL_21:

      goto LABEL_22;
    }
    id v63 = v17;
    id v64 = v15;
    [v13 averageQuantity];
    objc_super v19 = v65 = v16;
    v20 = [MEMORY[0x263F0A830] decibelAWeightedSoundPressureLevelUnit];
    [v19 doubleValueForUnit:v20];
    double v22 = v21;

    v23 = [v13 duration];
    v24 = [MEMORY[0x263F0A830] secondUnit];
    [v23 doubleValueForUnit:v24];
    double v26 = v25;

    uint64_t v27 = *MEMORY[0x263F41DA8];
    v75[0] = v14;
    uint64_t v28 = *MEMORY[0x263F41DB0];
    v74[0] = v27;
    v74[1] = v28;
    v29 = [NSNumber numberWithDouble:v26];
    v75[1] = v29;
    v74[2] = *MEMORY[0x263F41DB8];
    v30 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v10, "includesPrunableData"));
    v75[2] = v30;
    uint64_t v31 = [NSDictionary dictionaryWithObjects:v75 forKeys:v74 count:3];

    v16 = v65;
    v62 = (void *)v31;
    v61 = (void *)[objc_alloc(MEMORY[0x263F41DD0]) initWithEventType:2003133803 exposureLevel:v65 dateInterval:v31 metadata:v22];
    v32 = -[HAENotificationCenter addHAENotificationEvent:error:](self->_notificationCenter, "addHAENotificationEvent:error:");
    if (v32)
    {
      v33 = v32;
      location = (id *)&self->_profile;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
      v35 = [WeakRetained dataManager];
      id v60 = v33;
      v73 = v33;
      v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v73 count:1];
      int v37 = [v35 insertDataObjects:v36 error:a6];

      if (!v37)
      {
        id v56 = 0;
        id v15 = v64;
        v16 = v65;
        v18 = v63;
        v32 = v60;
        goto LABEL_20;
      }
      _HKInitializeLogging();
      v38 = (void *)*MEMORY[0x263F09910];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_DEFAULT))
      {
        v39 = v38;
        v40 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v72 = v40;
        id v41 = v40;
        _os_log_impl(&dword_22615C000, v39, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requesting nanoSync due to HAEN delivery.", buf, 0xCu);
      }
      id v42 = objc_loadWeakRetained(location);
      v43 = [v42 nanoSyncManager];
      v68[0] = MEMORY[0x263EF8330];
      v68[1] = 3221225472;
      v68[2] = __98__HDHeadphoneExposureNotificationCenter_postSevenDayDoseNotification_nowDate_analyticsInfo_error___block_invoke;
      v68[3] = &unk_264796188;
      v68[4] = self;
      [v43 syncHealthDataWithOptions:0 reason:@"HAEN HKCategorySample Inserted" completion:v68];

      _HKInitializeLogging();
      v44 = *MEMORY[0x263F09910];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22615C000, v44, OS_LOG_TYPE_DEFAULT, "Requesting cloudSync due to HAEN delivery.", buf, 2u);
      }
      uint64_t v45 = [objc_alloc(MEMORY[0x263F0A160]) initWithPush:1 pull:0 lite:1];
      cloudSyncManager = self->_cloudSyncManager;
      v58 = (void *)v45;
      v47 = (void *)[objc_alloc(MEMORY[0x263F0A1C8]) initWithChangesSyncRequest:v45];
      v67[0] = MEMORY[0x263EF8330];
      v67[1] = 3221225472;
      v67[2] = __98__HDHeadphoneExposureNotificationCenter_postSevenDayDoseNotification_nowDate_analyticsInfo_error___block_invoke_303;
      v67[3] = &unk_264796188;
      v67[4] = self;
      [(HDCloudSyncManager *)cloudSyncManager syncWithRequest:v47 reason:@"HAEN HKCategorySample Inserted" completion:v67];

      v16 = v65;
      [v65 duration];
      double v49 = v48;
      uint64_t v50 = [v10 includesPrunableData];
      id v51 = objc_loadWeakRetained(location);
      v52 = [v51 database];
      -[HDHeadphoneExposureNotificationCenter _reportHeadphoneNotificationWithNowDate:eventDuration:exposureLevel:exposureDuration:hasPrunableData:isDeviceLocked:analyticsInfo:](self, "_reportHeadphoneNotificationWithNowDate:eventDuration:exposureLevel:exposureDuration:hasPrunableData:isDeviceLocked:analyticsInfo:", v11, v50, [v52 isProtectedDataAvailable] ^ 1, v12, v49, v22, v26);

      notificationSyncManager = self->_notificationSyncManager;
      id v66 = 0;
      LOBYTE(v50) = [(HDHeadphoneExposureNotificationSyncManager *)notificationSyncManager notifyHAENotificationAddedWithSample:v60 error:&v66];
      id v54 = v66;
      if ((v50 & 1) == 0)
      {
        _HKInitializeLogging();
        v55 = (void *)*MEMORY[0x263F09910];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_ERROR)) {
          -[HDHeadphoneExposureNotificationCenter postSevenDayDoseNotification:nowDate:analyticsInfo:error:](v55);
        }
      }
      id v56 = v60;

      v32 = v60;
    }
    else
    {
      id v56 = 0;
    }
    v18 = v63;
    id v15 = v64;
LABEL_20:

    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:underlyingError:", a6, 100, @"invalid statistics dose", v15);
  id v56 = 0;
LABEL_22:

LABEL_23:
  return v56;
}

void __98__HDHeadphoneExposureNotificationCenter_postSevenDayDoseNotification_nowDate_analyticsInfo_error___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = (void *)*MEMORY[0x263F09910];
  id v7 = *MEMORY[0x263F09910];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v6;
      int v10 = 138543362;
      id v11 = (id)objc_opt_class();
      id v9 = v11;
      _os_log_impl(&dword_22615C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully nano synced 7-Day HAEN HKCategorySample.", (uint8_t *)&v10, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __98__HDHeadphoneExposureNotificationCenter_postSevenDayDoseNotification_nowDate_analyticsInfo_error___block_invoke_cold_1(a1, v6);
  }
}

void __98__HDHeadphoneExposureNotificationCenter_postSevenDayDoseNotification_nowDate_analyticsInfo_error___block_invoke_303(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = (void *)*MEMORY[0x263F09910];
  id v7 = *MEMORY[0x263F09910];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v6;
      int v10 = 138543362;
      id v11 = (id)objc_opt_class();
      id v9 = v11;
      _os_log_impl(&dword_22615C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully cloud synced 7-Day HAEN HKCategorySample.", (uint8_t *)&v10, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __98__HDHeadphoneExposureNotificationCenter_postSevenDayDoseNotification_nowDate_analyticsInfo_error___block_invoke_303_cold_1(a1, v6);
  }
}

- (void)_reportHeadphoneNotificationWithNowDate:(id)a3 eventDuration:(double)a4 exposureLevel:(double)a5 exposureDuration:(double)a6 hasPrunableData:(BOOL)a7 isDeviceLocked:(BOOL)a8 analyticsInfo:(id)a9
{
  id v11 = a3;
  id v12 = a9;
  if (v12)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    uint64_t v14 = [WeakRetained profileType];

    if (v14 == 1)
    {
      if (HKImproveHealthAndActivityAnalyticsAllowed())
      {
        id v17 = v11;
        id v18 = v12;
        AnalyticsSendEventLazy();
      }
    }
    else
    {
      _HKInitializeLogging();
      v16 = (void *)*MEMORY[0x263F09910];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_FAULT)) {
        -[HDHeadphoneExposureNotificationCenter _reportHeadphoneNotificationWithNowDate:eventDuration:exposureLevel:exposureDuration:hasPrunableData:isDeviceLocked:analyticsInfo:](v16, (uint64_t)self, (id *)&self->_profile);
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    id v15 = (void *)*MEMORY[0x263F09910];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_FAULT)) {
      -[HDHeadphoneExposureNotificationCenter _reportHeadphoneNotificationWithNowDate:eventDuration:exposureLevel:exposureDuration:hasPrunableData:isDeviceLocked:analyticsInfo:](v15);
    }
  }
}

id __171__HDHeadphoneExposureNotificationCenter__reportHeadphoneNotificationWithNowDate_eventDuration_exposureLevel_exposureDuration_hasPrunableData_isDeviceLocked_analyticsInfo___block_invoke(uint64_t a1)
{
  v16[9] = *MEMORY[0x263EF8340];
  v2 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
  v3 = [v2 components:544 fromDate:*(void *)(a1 + 32)];

  v15[0] = @"averageSoundLevel";
  uint64_t v14 = +[HDAudioAnalyticsUtilities boundedIntegerForLEQ:*(double *)(a1 + 48)];
  v16[0] = v14;
  v15[1] = @"dayOfWeek";
  v4 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "valueForComponent:", 512));
  v16[1] = v4;
  v15[2] = @"eventDuration";
  id v5 = +[HDAudioAnalyticsUtilities boundedIntegerForEventDuration:*(double *)(a1 + 56)];
  v16[2] = v5;
  v15[3] = @"durationActualListeningTime";
  id v6 = +[HDAudioAnalyticsUtilities boundedIntegerForExposureDuration:*(double *)(a1 + 64)];
  v16[3] = v6;
  v15[4] = @"hasPrunableData";
  id v7 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 72)];
  v16[4] = v7;
  v15[5] = @"hourOfDay";
  v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "valueForComponent:", 32));
  v16[5] = v8;
  v15[6] = @"isDeviceLocked";
  id v9 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 73)];
  v16[6] = v9;
  v15[7] = @"minutesSinceLastUnlock";
  int v10 = [*(id *)(a1 + 40) boundedIntegerForMinutesSinceLastUnlockWithNowDate:*(void *)(a1 + 32)];
  v16[7] = v10;
  v15[8] = @"timeSinceLastNotification";
  id v11 = [*(id *)(a1 + 40) boundedIntegerForTimeSinceLastNotificationWithNowDate:*(void *)(a1 + 32)];
  v16[8] = v11;
  id v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:9];

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudSyncManager, 0);
  objc_storeStrong((id *)&self->_notificationSyncManager, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)postSevenDayDoseNotification:(void *)a1 nowDate:analyticsInfo:error:.cold.1(void *a1)
{
  id v2 = a1;
  v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0_2(v3);
  OUTLINED_FUNCTION_1(&dword_22615C000, v5, v6, "[%{public}@] Failure to send HAEN notification sync: %@", v7, v8, v9, v10, v11);
}

void __98__HDHeadphoneExposureNotificationCenter_postSevenDayDoseNotification_nowDate_analyticsInfo_error___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)OUTLINED_FUNCTION_3();
  id v5 = OUTLINED_FUNCTION_0_2(v4);
  OUTLINED_FUNCTION_1(&dword_22615C000, v6, v7, "[%{public}@] Failure to nano sync 7-Day HAEN HKCategorySample: %@", v8, v9, v10, v11, v12);
}

void __98__HDHeadphoneExposureNotificationCenter_postSevenDayDoseNotification_nowDate_analyticsInfo_error___block_invoke_303_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)OUTLINED_FUNCTION_3();
  id v5 = OUTLINED_FUNCTION_0_2(v4);
  OUTLINED_FUNCTION_1(&dword_22615C000, v6, v7, "[%{public}@] Failure to cloud sync 7-Day HAEN HKCategorySample: %@", v8, v9, v10, v11, v12);
}

- (void)_reportHeadphoneNotificationWithNowDate:(void *)a1 eventDuration:exposureLevel:exposureDuration:hasPrunableData:isDeviceLocked:analyticsInfo:.cold.1(void *a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1 = a1;
  int v2 = 138543362;
  uint64_t v3 = objc_opt_class();
  _os_log_fault_impl(&dword_22615C000, v1, OS_LOG_TYPE_FAULT, "[%{public}@ Missing analyticsInfo for 7-Day HAEN analytics.", (uint8_t *)&v2, 0xCu);
}

- (void)_reportHeadphoneNotificationWithNowDate:(id *)a3 eventDuration:exposureLevel:exposureDuration:hasPrunableData:isDeviceLocked:analyticsInfo:.cold.2(void *a1, uint64_t a2, id *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a1;
  uint64_t v6 = OUTLINED_FUNCTION_3();
  id WeakRetained = objc_loadWeakRetained(a3);
  int v8 = 138543618;
  uint64_t v9 = v6;
  __int16 v10 = 2048;
  uint64_t v11 = [WeakRetained profileType];
  _os_log_fault_impl(&dword_22615C000, v3, OS_LOG_TYPE_FAULT, "[%{public}@ Only primary profiles should be able to trigger HAENs: %ld.", (uint8_t *)&v8, 0x16u);
}

@end