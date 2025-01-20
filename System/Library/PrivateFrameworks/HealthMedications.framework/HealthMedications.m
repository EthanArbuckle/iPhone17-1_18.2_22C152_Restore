void sub_1BCB4BBD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BCB4EAEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 176), 8);
  _Block_object_dispose((const void *)(v33 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_1BCB52B08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_4(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

uint64_t OUTLINED_FUNCTION_6(uint64_t a1)
{
  return *(void *)(a1 + 40);
}

uint64_t HKMedicationScheduleFrequencyTypeForScheduleType(unint64_t a1)
{
  if (a1 > 8) {
    return 4;
  }
  else {
    return qword_1BCB6BF70[a1];
  }
}

void sub_1BCB58064(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

__CFString *HKStringFromReminderWeekdayOptions(uint64_t a1)
{
  if (a1)
  {
    char v1 = a1;
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v3 = v2;
    if (v1)
    {
      [v2 addObject:@"Monday"];
      if ((v1 & 2) == 0)
      {
LABEL_4:
        if ((v1 & 4) == 0) {
          goto LABEL_5;
        }
        goto LABEL_17;
      }
    }
    else if ((v1 & 2) == 0)
    {
      goto LABEL_4;
    }
    [v3 addObject:@"Tuesday"];
    if ((v1 & 4) == 0)
    {
LABEL_5:
      if ((v1 & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_18;
    }
LABEL_17:
    [v3 addObject:@"Wednesday"];
    if ((v1 & 8) == 0)
    {
LABEL_6:
      if ((v1 & 0x10) == 0) {
        goto LABEL_7;
      }
      goto LABEL_19;
    }
LABEL_18:
    [v3 addObject:@"Thursday"];
    if ((v1 & 0x10) == 0)
    {
LABEL_7:
      if ((v1 & 0x20) == 0) {
        goto LABEL_8;
      }
      goto LABEL_20;
    }
LABEL_19:
    [v3 addObject:@"Friday"];
    if ((v1 & 0x20) == 0)
    {
LABEL_8:
      if ((v1 & 0x40) == 0)
      {
LABEL_10:
        uint64_t v4 = NSString;
        v5 = [v3 componentsJoinedByString:@", "];
        v6 = [v4 stringWithFormat:@"[%@]", v5];

        goto LABEL_12;
      }
LABEL_9:
      [v3 addObject:@"Sunday"];
      goto LABEL_10;
    }
LABEL_20:
    [v3 addObject:@"Saturday"];
    if ((v1 & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  v6 = @"None";
LABEL_12:

  return v6;
}

__n128 HKiOSVersionFromWatchOSVersion@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *(void *)a1 + 7;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

__n128 HKWatchOSVersionFromiOSVersion@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *(void *)a1 - 7;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

__n128 HKMedicationFirstSupportedOSVersionForDeviceType@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  switch(a1)
  {
    case 0:
      id v2 = &HKMedicationFirstSupportedOSVersionOniOS;
      goto LABEL_6;
    case 1:
      id v2 = &HKMedicationFirstSupportedOSVersionOnWatchOS;
      goto LABEL_6;
    case 2:
      id v2 = &HKMedicationFirstSupportedOSVersionOniPadOS;
      goto LABEL_6;
    case 3:
      id v2 = &HKMedicationFirstSupportedOSVersionOnVisionOS;
LABEL_6:
      __n128 result = (__n128)*v2;
      *(_OWORD *)a2 = *v2;
      *(void *)(a2 + 16) = *((void *)v2 + 2);
      break;
    default:
      return result;
  }
  return result;
}

__CFString *HKStringFromDrugInteractionLifestyleFactor(unint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Invalid (%ld)", a1);
    char v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v1 = off_1E62EB6B8[a1];
  }

  return v1;
}

id HKConceptIdentifierForDrugInteractionLifestyleFactor(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 3) {
    uint64_t v1 = 0;
  }
  else {
    uint64_t v1 = 703 - a1;
  }
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F2ADE8]) initWithRawIdentifier:v1];

  return v2;
}

void *HKDrugInteractionLifestyleFactorForHKConceptIdentifier(void *a1)
{
  id v1 = a1;
  if ([v1 rawIdentifier] == 702)
  {
    id v2 = &unk_1F1719190;
  }
  else if ([v1 rawIdentifier] == 701)
  {
    id v2 = &unk_1F17191A8;
  }
  else if ([v1 rawIdentifier] == 700)
  {
    id v2 = &unk_1F17191C0;
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

__CFString *HKStringFromMedicationScheduleType(unint64_t a1)
{
  if (a1 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown scheduleType (%ld)", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E62EB6D8[a1];
  }

  return v1;
}

void *HKAllMedicationScheduleTypes()
{
  return &unk_1F17192F8;
}

__CFString *HKStringFromMedicationProductType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Invalid (%ld)", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E62EB720[a1 - 1];
  }

  return v1;
}

__CFString *HKStringFromDrugInteractionType(uint64_t a1)
{
  if (a1 == 1)
  {
    id v2 = @"Multiple Medications";
  }
  else if (a1 == 2)
  {
    id v2 = @"Medication + Lifestyle Factor";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Invalid (%ld)", a1);
    id v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

__CFString *HKStringFromDrugInteractionSeverityLevel(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Invalid (%ld)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E62EB750[a1 - 1];
  }

  return v1;
}

__CFString *HKStringFromMedicationListOnboardingStepType(unint64_t a1)
{
  if (a1 >= 0xE)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Invalid (%ld)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E62EB770[a1];
  }

  return v1;
}

__CFString *HKStringFromHKMedicationListOnboardingAlgorithmType(uint64_t a1)
{
  if (a1)
  {
    if (a1 == 1)
    {
      id v2 = @"NDC";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid (%ld)", a1);
      id v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v2 = @"OCR";
  }
  return v2;
}

__CFString *HKStringFromMedicationListOnboardingProvenanceType(uint64_t a1)
{
  if (a1)
  {
    if (a1 == 1)
    {
      id v2 = @"FromMedsTrackingRoom";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid (%ld)", a1);
      id v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v2 = @"FromSummary";
  }
  return v2;
}

__CFString *HKStringFromMedicationListOnboardingActionType(unint64_t a1)
{
  if (a1 >= 0xD)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Invalid (%ld)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E62EB7E0[a1];
  }

  return v1;
}

__CFString *HKStringFromMedicationListOnboardingDetailsEntryType(unint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Invalid (%ld)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E62EB848[a1];
  }

  return v1;
}

__CFString *HKStringFromMedicationRoomProvenance(unint64_t a1)
{
  if (a1 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Invalid (%ld)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E62EB870[a1];
  }

  return v1;
}

__CFString *HKStringFromMedicationRoomType(uint64_t a1)
{
  if (a1 == 1)
  {
    id v2 = @"DataTypeRoom";
  }
  else if (a1 == 2)
  {
    id v2 = @"CategoryRoom";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Invalid (%ld)", a1);
    id v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

__CFString *HKStringFromMedicationRoomAnalyticsAction(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 0x1D)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Invalid (%ld)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E62EB8B8[a1 - 1];
  }

  return v1;
}

__CFString *HKStringFromMedicationLoggingContext(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Invalid (%ld)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E62EB9A0[a1 - 1];
  }

  return v1;
}

id HKMedicationAnalyticsWeeksBetweenDates(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = a1;
  v7 = [v6 startOfDayForDate:a2];
  v8 = [v6 startOfDayForDate:v5];

  v9 = [v6 components:16 fromDate:v7 toDate:v8 options:0];

  uint64_t v10 = [v9 day];
  if (v10 >= 0) {
    unint64_t v11 = v10;
  }
  else {
    unint64_t v11 = -v10;
  }
  unint64_t v12 = (((unsigned __int16)(v11 - ((9363 * (unsigned __int16)v11) >> 16)) >> 1)
       + ((9363 * (unsigned __int16)v11) >> 16)) >> 2;
  BOOL v13 = v11 >= 0x2BC;
  unint64_t v14 = 10 * (v11 / 0x46);
  if (v13) {
    unint64_t v15 = v14;
  }
  else {
    unint64_t v15 = v12;
  }
  v16 = [NSNumber numberWithInteger:v15];

  return v16;
}

uint64_t HKMedicationsRoomDeepLink()
{
  return [MEMORY[0x1E4F1CB10] URLWithString:@"x-apple-health://MedicationsHealthAppPlugin.healthplugin"];
}

id OUTLINED_FUNCTION_0_1(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id HKMedicationsSharedAnalyticsQueue()
{
  if (HKMedicationsSharedAnalyticsQueue_onceToken != -1) {
    dispatch_once(&HKMedicationsSharedAnalyticsQueue_onceToken, &__block_literal_global_7);
  }
  v0 = (void *)HKMedicationsSharedAnalyticsQueue_analyticsQueue;

  return v0;
}

uint64_t __HKMedicationsSharedAnalyticsQueue_block_invoke()
{
  HKMedicationsSharedAnalyticsQueue_analyticsQueue = HKCreateSerialDispatchQueue();

  return MEMORY[0x1F41817F8]();
}

id HKMedicationsBucketedDecadeForAge(void *a1)
{
  uint64_t v1 = NSNumber;
  id v2 = a1;
  v3 = [v1 numberWithInteger:18];
  uint64_t v4 = HKAnalyticsDecadeBucketedAgeForAgeWithBoundsAndBucketRange();

  return v4;
}

uint64_t HKMedicationScheduleCompatibilityVersionFuture()
{
  return 2;
}

uint64_t HKMedicationScheduleCompatibilityRangeToString(uint64_t a1, uint64_t a2)
{
  return [NSString stringWithFormat:@"[Minimum:%ld, Origin:%ld, Current Device: %ld]", a1, a2, 1];
}

uint64_t HKMedicationScheduleCompatibilityVersionForOSVersion(uint64_t *a1, uint64_t a2)
{
  uint64_t v11 = v2;
  uint64_t v12 = v3;
  switch(a2)
  {
    case 0:
      uint64_t v4 = *a1;
      goto LABEL_4;
    case 1:
      memset(v10, 0, sizeof(v10));
      long long v8 = *(_OWORD *)a1;
      uint64_t v9 = a1[2];
      HKiOSVersionFromWatchOSVersion((uint64_t)&v8, (uint64_t)v10);
      uint64_t v4 = v10[0];
LABEL_4:
      if ((unint64_t)(v4 - 16) < 3) {
        return qword_1BCB6C028[v4 - 16];
      }
      v7 = &HKMedicationFirstSupportedOSVersionOniOS;
      goto LABEL_18;
    case 2:
      uint64_t v4 = *a1;
      if (*a1 == 17) {
        return 0;
      }
      if (v4 == 18) {
        return 1;
      }
      v7 = &HKMedicationFirstSupportedOSVersionOniPadOS;
LABEL_18:
      if (v4 < *(void *)v7) {
        return -1;
      }
      else {
        return 1;
      }
    case 3:
      uint64_t v6 = -1;
      if (*a1 >= (uint64_t)HKMedicationFirstSupportedOSVersionOnVisionOS) {
        uint64_t v6 = 1;
      }
      if (*a1 == 2) {
        return 1;
      }
      else {
        return v6;
      }
    default:
      return -1;
  }
}

uint64_t HKMedicationScheduleCompatibilityVersionForiPhoneOSVersion(void *a1)
{
  unint64_t v1 = *a1 - 16;
  if (v1 < 3) {
    return qword_1BCB6C028[v1];
  }
  if (*a1 < (uint64_t)HKMedicationFirstSupportedOSVersionOniOS) {
    return -1;
  }
  return 1;
}

uint64_t HKMedicationScheduleCompatibilityVersionForiPadOSVersion(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if (*a1 == 17) {
    return 0;
  }
  if (v1 == 18) {
    return 1;
  }
  if (v1 < (uint64_t)HKMedicationFirstSupportedOSVersionOniPadOS) {
    return -1;
  }
  return 1;
}

uint64_t HKMedicationScheduleCompatibilityVersionForVisionOSVersion(void *a1)
{
  uint64_t v1 = -1;
  if (*a1 >= (uint64_t)HKMedicationFirstSupportedOSVersionOnVisionOS) {
    uint64_t v1 = 1;
  }
  if (*a1 == 2) {
    return 1;
  }
  else {
    return v1;
  }
}

uint64_t HKMedicationScheduleCompatibilityVersionForMedicationScheduleType(uint64_t a1, uint64_t a2)
{
  if ((unint64_t)(a1 - 5) > 3)
  {
    uint64_t v3 = 0;
    uint64_t v2 = 1;
  }
  else
  {
    uint64_t v2 = qword_1BCB6C040[a1 - 5];
    uint64_t v3 = v2;
  }
  if (a2) {
    return v2;
  }
  else {
    return v3;
  }
}

uint64_t AnalyticsIsEventUsed()
{
  return MEMORY[0x1F4113888]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1F41138A0]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

uint64_t HKAnalyticsDecadeBucketedAgeForAgeWithBoundsAndBucketRange()
{
  return MEMORY[0x1F40E7A38]();
}

uint64_t HKCreateSerialDispatchQueue()
{
  return MEMORY[0x1F40E7BA0]();
}

uint64_t HKLogHealthOntology()
{
  return MEMORY[0x1F40E7DC8]();
}

uint64_t HKLogMedication()
{
  return MEMORY[0x1F40E7DD8]();
}

uint64_t HKNSOperatingSystemVersionFromString()
{
  return MEMORY[0x1F40E7E28]();
}

uint64_t HKNSOperatingSystemVersionString()
{
  return MEMORY[0x1F40E7E38]();
}

uint64_t HKNSOperatingSystemVersionsEqual()
{
  return MEMORY[0x1F40E7E40]();
}

uint64_t HKSensitiveLogItem()
{
  return MEMORY[0x1F40E7F00]();
}

uint64_t HKStringFromBool()
{
  return MEMORY[0x1F40E7FD0]();
}

uint64_t HKSynchronizeNanoPreferencesUserDefaults()
{
  return MEMORY[0x1F40E8060]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x1F40E7298](proto);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _HKInitializeLogging()
{
  return MEMORY[0x1F40E81B8]();
}

uint64_t _HKLogDroppedError()
{
  return MEMORY[0x1F40E81C0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}