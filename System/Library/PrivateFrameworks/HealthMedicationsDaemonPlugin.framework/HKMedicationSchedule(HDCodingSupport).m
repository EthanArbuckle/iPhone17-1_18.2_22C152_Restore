@interface HKMedicationSchedule(HDCodingSupport)
+ (NSObject)hd_medicationScheduleFromCodable:()HDCodingSupport;
+ (id)hd_medicationSchedulesFromCodables:()HDCodingSupport profile:ignoreDuplicates:;
- (HDCodableMedicationSchedule)hd_codableMedicationSchedule;
@end

@implementation HKMedicationSchedule(HDCodingSupport)

- (HDCodableMedicationSchedule)hd_codableMedicationSchedule
{
  v2 = objc_alloc_init(HDCodableMedicationSchedule);
  v3 = [a1 UUID];
  v4 = objc_msgSend(v3, "hk_dataForUUIDBytes");
  [(HDCodableMedicationSchedule *)v2 setUuid:v4];

  v5 = [a1 medicationUUID];
  v6 = objc_msgSend(v5, "hk_dataForUUIDBytes");
  [(HDCodableMedicationSchedule *)v2 setMedicationUUID:v6];

  v7 = [a1 medicationIdentifier];
  if (v7)
  {
    v8 = [a1 medicationIdentifier];
    [(HDCodableMedicationSchedule *)v2 setMedicationIdentifier:v8];
  }
  else
  {
    [(HDCodableMedicationSchedule *)v2 setMedicationIdentifier:&stru_1F17F0380];
  }

  v9 = [a1 startDateTime];
  [v9 timeIntervalSinceReferenceDate];
  -[HDCodableMedicationSchedule setStartDateTime:](v2, "setStartDateTime:");

  v10 = [a1 endDateTime];
  [v10 timeIntervalSinceReferenceDate];
  -[HDCodableMedicationSchedule setEndDateTime:](v2, "setEndDateTime:");

  v11 = [a1 createdUTCOffset];
  v12 = [v11 name];
  [(HDCodableMedicationSchedule *)v2 setCreatedTimeZone:v12];

  -[HDCodableMedicationSchedule setFrequencyType:](v2, "setFrequencyType:", (double)[a1 frequencyType]);
  -[HDCodableMedicationSchedule setScheduleType:](v2, "setScheduleType:", [a1 scheduleType]);
  v13 = [a1 cycleStartDate];
  v14 = objc_msgSend(v13, "hk_codableDateComponents");
  [(HDCodableMedicationSchedule *)v2 setCycleStartDateComponents:v14];

  v15 = [a1 note];
  [(HDCodableMedicationSchedule *)v2 setNote:v15];

  uint64_t v16 = MEMORY[0x1E4F66B28];
  v17 = [a1 timeIntervals];
  v18 = +[HKMedicationSchedule _codableArrayForMedicationScheduleIntervalDatas:](v16, v17);
  v19 = (void *)[v18 mutableCopy];
  [(HDCodableMedicationSchedule *)v2 setIntervalDatas:v19];

  [a1 creationTimestamp];
  -[HDCodableMedicationSchedule setCreationDate:](v2, "setCreationDate:");
  -[HDCodableMedicationSchedule setDeleted:](v2, "setDeleted:", [a1 isDeleted]);
  v20 = objc_alloc_init(HDCodableMedicationScheduleCompatibilityVersionRange);
  -[HDCodableMedicationScheduleCompatibilityVersionRange setMinimum:](v20, "setMinimum:", [a1 compatibilityRange]);
  [a1 compatibilityRange];
  [(HDCodableMedicationScheduleCompatibilityVersionRange *)v20 setOrigin:v21];
  [(HDCodableMedicationSchedule *)v2 setCompatibilityVersionRange:v20];

  return v2;
}

+ (id)hd_medicationSchedulesFromCodables:()HDCodingSupport profile:ignoreDuplicates:
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__1;
  v26 = __Block_byref_object_dispose__1;
  id v27 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v9 = (void *)MEMORY[0x1E4F65C18];
  v10 = [v8 database];
  id v21 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __101__HKMedicationSchedule_HDCodingSupport__hd_medicationSchedulesFromCodables_profile_ignoreDuplicates___block_invoke;
  v16[3] = &unk_1E6336F08;
  id v11 = v7;
  id v17 = v11;
  char v20 = a5;
  id v12 = v8;
  id v18 = v12;
  v19 = &v22;
  [v9 performWriteTransactionWithHealthDatabase:v10 error:&v21 block:v16];
  id v13 = v21;

  id v14 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v14;
}

+ (NSObject)hd_medicationScheduleFromCodable:()HDCodingSupport
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 endDateTime];
  if (fabs(v5) < 2.22044605e-16)
  {
    uint64_t v7 = 0;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E4F1C9C8];
    [v4 endDateTime];
    uint64_t v7 = objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:");
  }
  id v8 = [v4 compatibilityVersionRange];

  if (v8)
  {
    v9 = [v4 compatibilityVersionRange];
    uint64_t v42 = [v9 minimum];
    v10 = [v4 compatibilityVersionRange];
    uint64_t v41 = [v10 origin];
  }
  else
  {
    uint64_t v41 = 0;
    uint64_t v42 = 0;
  }
  id v11 = [v4 medicationIdentifier];
  if (![v11 length])
  {

    id v11 = 0;
  }
  v43 = v11;
  v44 = (void *)v7;
  if ([v4 hasScheduleType])
  {
    uint64_t v12 = [v4 scheduleType];
  }
  else
  {
    [v4 frequencyType];
    uint64_t v12 = (uint64_t)v13;
  }
  id v14 = objc_alloc(MEMORY[0x1E4F66B28]);
  v39 = [v4 decodedUUID];
  uint64_t v15 = [v4 decodedMedicationUUID];
  uint64_t v16 = (void *)MEMORY[0x1E4F1CAF0];
  v40 = [v4 createdTimeZone];
  v37 = [v16 timeZoneWithName:v40];
  id v17 = (void *)MEMORY[0x1E4F1C9C8];
  [v4 startDateTime];
  v36 = objc_msgSend(v17, "dateWithTimeIntervalSinceReferenceDate:");
  v38 = [v4 intervalDatas];
  uint64_t v35 = a1;
  id v18 = +[HKMedicationSchedule _medicationScheduleIntervalDataFromCodable:](a1, v38);
  uint64_t v19 = [v4 displayOptions];
  char v20 = (void *)MEMORY[0x1E4F1C9D8];
  id v21 = [v4 cycleStartDateComponents];
  uint64_t v22 = objc_msgSend(v20, "hk_dateComponentsWithCodableDateComponents:", v21);
  char v23 = [v4 deleted];
  [v4 creationDate];
  double v25 = v24;
  v26 = [v4 note];
  LOBYTE(v34) = v23;
  id v27 = v14;
  v28 = (void *)v15;
  v29 = objc_msgSend(v27, "initWithUUID:medicationUUID:medicationIdentifier:createdUTCOffset:startDateTime:endDateTime:timeIntervals:scheduleType:displayOptions:cycleStartDateComponents:deleted:creationTimestamp:note:compatibilityVersionRange:", v39, v15, v43, v37, v36, v44, v25, v18, v12, v19, v22, v34, v26, v42, v41);

  if ([v29 isUnavailable])
  {
    _HKInitializeLogging();
    v30 = HKLogMedication();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v46 = v35;
      __int16 v47 = 2114;
      v48 = v29;
      _os_log_impl(&dword_1BD54A000, v30, OS_LOG_TYPE_DEFAULT, "[%{public}@] Receiving a schedule that has already been marked as unavailable. %{public}@", buf, 0x16u);
    }
    goto LABEL_21;
  }
  if ([v29 isInvalid])
  {
    _HKInitializeLogging();
    v31 = HKLogMedication();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      +[HKMedicationSchedule(HDCodingSupport) hd_medicationScheduleFromCodable:v31];
    }
  }
  if ([v29 needsToBeMadeUnavailable])
  {
    [v29 unavailableSchedule];
    v29 = v30 = v29;
LABEL_21:
  }
  v32 = v29;

  return v32;
}

+ (void)hd_medicationScheduleFromCodable:()HDCodingSupport .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1BD54A000, log, OS_LOG_TYPE_ERROR, "[%{public}@] Received invalid schedule: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end