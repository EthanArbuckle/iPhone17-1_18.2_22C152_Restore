uint64_t HKMCTodayIndex(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;

  v1 = (void *)MEMORY[0x263EFF910];
  v2 = a1;
  v3 = [v1 date];
  v4 = objc_msgSend(v3, "hk_dayIndexWithCalendar:", v2);

  return v4;
}

__CFString *HKFeatureSettingsKeyForDeviationDetectionTypeEnabled(unint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown-%ld", a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = off_2646E9A70[a1];
  }
  return v1;
}

id HDMenstrualCyclesPluginServerInterface()
{
  v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D7E7530];
  id v1 = (id)objc_msgSend(v0, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_fetchScheduledNotificationsWithCompletion_, 0, 1);
  id v2 = (id)objc_msgSend(v0, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_saveDaySummaries_canOverrideCreationDate_completion_, 0, 0);
  v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v0 setClasses:v5 forSelector:sel_remote_saveBleedingFlowByDayIndex_forBleedingType_completion_ argumentIndex:0 ofReply:0];

  v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  [v0 setClasses:v8 forSelector:sel_remote_confirmAndSaveDeviationWithMenstrualFlowByDayIndex_intermenstrualBleedingByDayIndex_addedCycleFactors_initialAnalysisWindow_completion_ argumentIndex:0 ofReply:0];

  v9 = (void *)MEMORY[0x263EFFA08];
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  [v0 setClasses:v11 forSelector:sel_remote_confirmAndSaveDeviationWithMenstrualFlowByDayIndex_intermenstrualBleedingByDayIndex_addedCycleFactors_initialAnalysisWindow_completion_ argumentIndex:1 ofReply:0];

  id v12 = (id)objc_msgSend(v0, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_confirmAndSaveDeviationWithMenstrualFlowByDayIndex_intermenstrualBleedingByDayIndex_addedCycleFactors_initialAnalysisWindow_completion_, 2, 0);
  id v13 = (id)objc_msgSend(v0, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_confirmAndSaveDeviationWithMenstrualFlowByDayIndex_intermenstrualBleedingByDayIndex_addedCycleFactors_initialAnalysisWindow_completion_, 0, 1);
  return v0;
}

void sub_2249ED428(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id HKMCCycleTrackingSampleTypes()
{
  v0 = HKMCDaySummarySampleTypes();
  id v1 = HKMCCycleFactorsTypes();
  id v2 = [v0 arrayByAddingObjectsFromArray:v1];

  v3 = HKMCDeviationSampleTypes();
  uint64_t v4 = [v2 arrayByAddingObjectsFromArray:v3];

  return v4;
}

id HKMCDeviationSampleTypes()
{
  v6[4] = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F093D8]];
  v6[0] = v0;
  id v1 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F093B8]];
  v6[1] = v1;
  id v2 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F09340]];
  v6[2] = v2;
  v3 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F09328]];
  v6[3] = v3;
  uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];

  return v4;
}

id HKMCCycleFactorsTypes()
{
  v5[3] = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F093C0]];
  id v1 = objc_msgSend(MEMORY[0x263F0A158], "categoryTypeForIdentifier:", *MEMORY[0x263F09348], v0);
  v5[1] = v1;
  id v2 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F09298]];
  v5[2] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:3];

  return v3;
}

id HKMCDaySummarySampleTypes()
{
  v0 = HKMCDaySummaryCategoryTypes();
  id v1 = HKMCDaySummaryQuantityTypes(1);
  id v2 = [v0 arrayByAddingObjectsFromArray:v1];

  return v2;
}

id HKMCDaySummaryQuantityTypes(int a1)
{
  v8[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:*MEMORY[0x263F09C00]];
  v3 = (void *)v2;
  if (a1)
  {
    v8[0] = v2;
    uint64_t v4 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:*MEMORY[0x263F09BE0]];
    v8[1] = v4;
    v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];
  }
  else
  {
    uint64_t v7 = v2;
    v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v7 count:1];
  }

  return v5;
}

id HKMCDaySummaryCategoryTypes()
{
  v16[1] = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F09380]];
  v16[0] = v0;
  id v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];

  v14 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F09260]];
  v15[0] = v14;
  id v13 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F09258]];
  v15[1] = v13;
  id v12 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F09330]];
  v15[2] = v12;
  uint64_t v2 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F093F0]];
  v15[3] = v2;
  v3 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F09278]];
  v15[4] = v3;
  uint64_t v4 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F093A8]];
  v15[5] = v4;
  v5 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F093C8]];
  v15[6] = v5;
  v6 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F093D0]];
  v15[7] = v6;
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:8];
  v8 = [v1 arrayByAddingObjectsFromArray:v7];
  v9 = HKMCSymptomSampleTypes();
  uint64_t v10 = [v8 arrayByAddingObjectsFromArray:v9];

  return v10;
}

id HKMCSymptomSampleTypes()
{
  v24[22] = *MEMORY[0x263EF8340];
  v23 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F09228]];
  v24[0] = v23;
  v22 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F09230]];
  v24[1] = v22;
  v21 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F09238]];
  v24[2] = v21;
  v20 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F09250]];
  v24[3] = v20;
  v19 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F09268]];
  v24[4] = v19;
  v18 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F09270]];
  v24[5] = v18;
  v17 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F09288]];
  v24[6] = v17;
  v16 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F09290]];
  v24[7] = v16;
  v15 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F092A8]];
  v24[8] = v15;
  v14 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F092B8]];
  v24[9] = v14;
  id v13 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F092D0]];
  v24[10] = v13;
  id v12 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F092E8]];
  v24[11] = v12;
  v0 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F092F8]];
  v24[12] = v0;
  id v1 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F09320]];
  v24[13] = v1;
  uint64_t v2 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F09370]];
  v24[14] = v2;
  v3 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F09378]];
  v24[15] = v3;
  uint64_t v4 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F09390]];
  v24[16] = v4;
  v5 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F09398]];
  v24[17] = v5;
  v6 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F093A0]];
  v24[18] = v6;
  uint64_t v7 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F093B0]];
  v24[19] = v7;
  v8 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F09420]];
  v24[20] = v8;
  v9 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F09438]];
  v24[21] = v9;
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:22];

  return v11;
}

uint64_t HKMenstrualCyclesStoreInterface()
{
  return [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D7D2230];
}

id HKCategoryTypeFromDeviationType(void *a1)
{
  if ((unint64_t)a1 <= 3)
  {
    a1 = objc_msgSend(MEMORY[0x263F0A158], "categoryTypeForIdentifier:", **((void **)&unk_2646E9A38 + (void)a1), v1);
  }
  return a1;
}

uint64_t _HKMCAppleSleepingWristTemperatureType()
{
  return [MEMORY[0x263F0A658] quantityTypeForIdentifier:*MEMORY[0x263F09BE0]];
}

uint64_t HKMCMenstrualSymptomFromDataTypeCode(uint64_t a1)
{
  uint64_t v1 = a1 - 157;
  uint64_t result = 1;
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = 16;
      break;
    case 2:
      uint64_t result = 8;
      break;
    case 3:
      uint64_t result = 128;
      break;
    case 4:
      uint64_t result = 2;
      break;
    case 5:
      uint64_t result = 512;
      break;
    case 6:
      uint64_t result = 4096;
      break;
    case 7:
      uint64_t result = 1024;
      break;
    case 8:
      uint64_t result = 32;
      break;
    case 9:
      uint64_t result = 64;
      break;
    case 10:
      uint64_t result = 0x4000;
      break;
    case 11:
      uint64_t result = 2048;
      break;
    case 12:
      uint64_t result = 0x2000;
      break;
    case 13:
      uint64_t result = 4;
      break;
    case 14:
      uint64_t result = 256;
      break;
    default:
      v3 = [MEMORY[0x263F08690] currentHandler];
      uint64_t v4 = [NSString stringWithUTF8String:"HKMCDaySummarySymptoms HKMCMenstrualSymptomFromDataTypeCode(_HKDataTypeCode)"];
      v5 = [NSNumber numberWithInteger:1];
      [v3 handleFailureInFunction:v4, @"HKMCDefines.m", 536, @"%s: Invalid data type code: %@", "HKMCDaySummarySymptoms HKMCMenstrualSymptomFromDataTypeCode(_HKDataTypeCode)", v5 file lineNumber description];

      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t HKMCExperienceStoreServerInterface()
{
  return [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D7E7650];
}

uint64_t HKMCExperienceStoreClientInterface()
{
  return [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D7D6C58];
}

uint64_t HKMCBleedingFlowFromCategoryValueVaginalBleeding(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4) {
    return 0;
  }
  else {
    return qword_224A17B98[a1 - 1];
  }
}

uint64_t HKMCBackgroundAndSedentaryHeartRateContextSet()
{
  return MEMORY[0x270EF3918]();
}

void *HKMCAllDeviationTypes()
{
  return &unk_26D7D01F0;
}

uint64_t HAMenstrualAlgorithmsPhaseFromHKMCCycleFactor(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 8) {
    return 0;
  }
  else {
    return byte_224A17AD0[a1 - 1];
  }
}

uint64_t HKMenstrualCyclesDiagnosticsInterface()
{
  return [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D7D1E28];
}

uint64_t HDMenstrualCyclesDiagnosticsServerInterface()
{
  return [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D7E7590];
}

id HKMCAllNotificationCategories()
{
  v6[1] = *MEMORY[0x263EF8340];
  v0 = HKMCPeriodNotificationCategories();
  uint64_t v1 = HKMCFertileWindowNotificationCategories();
  uint64_t v2 = [v0 arrayByAddingObjectsFromArray:v1];

  v6[0] = @"MenstrualCyclesAppPlugin.UnconfirmedDeviation";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  uint64_t v4 = [v2 arrayByAddingObjectsFromArray:v3];

  return v4;
}

id HKMCPeriodNotificationCategories()
{
  v4[3] = *MEMORY[0x263EF8340];
  v0 = HKMCBeforePeriodStartNotificationCategories();
  v4[0] = @"MenstrualCyclesAppPlugin.AfterPeriodStart";
  v4[1] = @"MenstrualCyclesAppPlugin.AfterLoggedPeriodEnd";
  v4[2] = @"MenstrualCyclesAppPlugin.AfterUnloggedPeriodEnd";
  uint64_t v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:3];
  uint64_t v2 = [v0 arrayByAddingObjectsFromArray:v1];

  return v2;
}

id HKMCFertileWindowNotificationCategories()
{
  v0 = HKMCBeforeFertileWindowStartDaysNotificationCategories();
  uint64_t v1 = HKMCSensorBasedFertileWindowNotificationCategories();
  uint64_t v2 = [v0 arrayByAddingObjectsFromArray:v1];

  return v2;
}

id HKMCBeforePeriodStartNotificationCategories()
{
  v0 = HKMCBeforePeriodStartDaysNotificationCategories();
  uint64_t v1 = HKMCBeforePeriodStartWeeksNotificationCategories();
  uint64_t v2 = [v0 arrayByAddingObjectsFromArray:v1];

  return v2;
}

id HKMCBeforePeriodStartDaysNotificationCategories()
{
  v2[10] = *MEMORY[0x263EF8340];
  v2[0] = @"MenstrualCyclesAppPlugin.BeforePeriodStart1Day";
  v2[1] = @"MenstrualCyclesAppPlugin.BeforePeriodStart2Days";
  v2[2] = @"MenstrualCyclesAppPlugin.BeforePeriodStart3Days";
  v2[3] = @"MenstrualCyclesAppPlugin.BeforePeriodStart4Days";
  v2[4] = @"MenstrualCyclesAppPlugin.BeforePeriodStart5Days";
  v2[5] = @"MenstrualCyclesAppPlugin.BeforePeriodStart6Days";
  v2[6] = @"MenstrualCyclesAppPlugin.BeforePeriodStart7Days";
  v2[7] = @"MenstrualCyclesAppPlugin.BeforePeriodStart8Days";
  v2[8] = @"MenstrualCyclesAppPlugin.BeforePeriodStart9Days";
  v2[9] = @"MenstrualCyclesAppPlugin.BeforePeriodStart10Days";
  v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:10];
  return v0;
}

id HKMCBeforePeriodStartWeeksNotificationCategories()
{
  v2[2] = *MEMORY[0x263EF8340];
  v2[0] = @"MenstrualCyclesAppPlugin.BeforePeriodStart2Weeks";
  v2[1] = @"MenstrualCyclesAppPlugin.BeforePeriodStart3Weeks";
  v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:2];
  return v0;
}

id HKMCBeforeFertileWindowStartDaysNotificationCategories()
{
  v2[1] = *MEMORY[0x263EF8340];
  v2[0] = @"MenstrualCyclesAppPlugin.BeforeFertileWindowStart3Days";
  v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:1];
  return v0;
}

id HKMCSensorBasedFertileWindowNotificationCategories()
{
  void v2[2] = *MEMORY[0x263EF8340];
  v2[0] = @"MenstrualCyclesAppPlugin.UpdatedFertileWindowEnd";
  v2[1] = @"MenstrualCyclesAppPlugin.OvulationConfirmed";
  v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:2];
  return v0;
}

id HKMCSharedPredictionNotificationCategories()
{
  void v2[2] = *MEMORY[0x263EF8340];
  v2[0] = @"MenstrualCyclesAppPlugin.SharedPeriodPrediction";
  v2[1] = @"MenstrualCyclesAppPlugin.SharedFertileWindowPrediction";
  v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:2];
  return v0;
}

uint64_t HKMCNotificationDateComponentScalarFromCategory(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x263F08B08] scannerWithString:a1];
  uint64_t v2 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
  [v1 scanUpToCharactersFromSet:v2 intoString:0];

  uint64_t v5 = 0;
  [v1 scanInteger:&v5];
  uint64_t v3 = v5;

  return v3;
}

__CFString *HKMCNotificationCategoryBeforePeriodStartForDays(uint64_t a1)
{
  unint64_t v1 = a1 - 2;
  if (a1 < 2) {
    return @"MenstrualCyclesAppPlugin.BeforePeriodStart1Day";
  }
  if ((unint64_t)a1 > 0x11) {
    return @"MenstrualCyclesAppPlugin.BeforePeriodStart3Weeks";
  }
  if (v1 > 8) {
    return @"MenstrualCyclesAppPlugin.BeforePeriodStart2Weeks";
  }
  return off_2646E91D8[v1];
}

__CFString *HKMCNotificationIdentifierForCategory(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"MenstrualCyclesAppPlugin.UnconfirmedDeviation"])
  {
    uint64_t v2 = @"MenstrualCyclesAppPlugin.UnconfirmedDeviation";
  }
  else
  {
    uint64_t v3 = HKMCPeriodNotificationCategories();
    char v4 = [v3 containsObject:v1];

    if (v4)
    {
      uint64_t v2 = @"MenstrualCyclesAppPlugin.Period";
    }
    else
    {
      uint64_t v5 = HKMCFertileWindowNotificationCategories();
      char v6 = [v5 containsObject:v1];

      if (v6) {
        uint64_t v2 = @"MenstrualCyclesAppPlugin.FertileWindow";
      }
      else {
        uint64_t v2 = (__CFString *)v1;
      }
    }
  }

  return v2;
}

void sub_2249F2C50(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id HKMCGenerateHeartRateSamplesMatchingTenthPercentile(void *a1, uint64_t a2, float a3)
{
  v33[1] = *MEMORY[0x263EF8340];
  id v4 = a1;
  id v30 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v5 = [v4 startDate];
  [v5 timeIntervalSinceReferenceDate];
  double v7 = v6;

  v29 = v4;
  v8 = [v4 endDate];
  [v8 timeIntervalSinceReferenceDate];
  double v10 = v9;

  id v11 = objc_alloc(MEMORY[0x263F0A2D8]);
  id v12 = [MEMORY[0x263F08C38] UUID];
  id v13 = [v12 UUIDString];
  v14 = (void *)[v11 initWithName:@"Apple Watch" manufacturer:@"Apple Inc" model:0 hardwareVersion:0 firmwareVersion:0 softwareVersion:0 localIdentifier:v13 UDIDeviceIdentifier:0];

  v15 = [MEMORY[0x263F0A830] unitFromString:@"count/min"];
  if (v7 < v10 && a2 >= 1)
  {
    unint64_t v16 = 0;
    uint64_t v17 = *MEMORY[0x263F0AB20];
    float v18 = 0.0;
    do
    {
      v19 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:v7];
      if (v16 <= a2 / 0xAuLL)
      {
        float v20 = a3;
      }
      else
      {
        if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * (~(a2 / 0xAuLL) + v16) + 0x1999999999999998, 1) < 0x1999999999999999uLL) {
          float v18 = v18 + 1.0;
        }
        float v20 = v18 + a3;
      }
      v21 = (void *)MEMORY[0x263F0A648];
      v22 = [MEMORY[0x263F0A658] heartRateType];
      v23 = [MEMORY[0x263F0A630] quantityWithUnit:v15 doubleValue:v20];
      uint64_t v32 = v17;
      v33[0] = &unk_26D7CFF08;
      v24 = [NSDictionary dictionaryWithObjects:v33 forKeys:&v32 count:1];
      v25 = [v21 quantitySampleWithType:v22 quantity:v23 startDate:v19 endDate:v19 device:v14 metadata:v24];

      [v30 addObject:v25];
      double v7 = v7 + 300.0;
      ++v16;
    }
    while (v7 < v10 && (uint64_t)v16 < a2);
  }
  v27 = (void *)[v30 copy];

  return v27;
}

void sub_2249F7854(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

unint64_t HAMenstrualAlgorithmsFlowFromHKMCMenstrualFlow(unint64_t a1)
{
  unint64_t v1 = 0x40302010500uLL >> (8 * a1);
  if (a1 >= 6) {
    LOBYTE(v1) = 0;
  }
  return v1 & 7;
}

unint64_t HAMenstrualAlgorithmsOvulationTestResultFromHKMCOvulationTestResult(unint64_t a1)
{
  unint64_t v1 = 0x203010300uLL >> (8 * a1);
  if (a1 >= 5) {
    LOBYTE(v1) = 0;
  }
  return v1 & 3;
}

uint64_t HKMCCycleFactorFromHAMenstrualAlgorithmsCycleFactor(char a1)
{
  if ((a1 - 1) > 7u) {
    return 2;
  }
  else {
    return qword_224A17B00[(char)(a1 - 1)];
  }
}

uint64_t HKMCPredictionPrimarySourceFromHAMenstrualAlgorithmsPredictionPrimarySource(unsigned int a1)
{
  unsigned __int8 v1 = a1;
  if (a1 < 4) {
    return a1 + 1;
  }
  _HKInitializeLogging();
  uint64_t v3 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_FAULT)) {
    HKMCPredictionPrimarySourceFromHAMenstrualAlgorithmsPredictionPrimarySource_cold_1(v3, v1);
  }
  return 1;
}

void HKMCAppendCycleFactorsPhaseFromDaySummary(void *a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v5 = [v4 startedCycleFactors];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        unint64_t v10 = [*(id *)(*((void *)&v23 + 1) + 8 * v9) integerValue] - 1;
        if (v10 > 8) {
          uint64_t v11 = 0;
        }
        else {
          uint64_t v11 = byte_224A17AD0[v10];
        }
        objc_msgSend(v3, "beginPhase:onJulianDay:", v11, objc_msgSend(v4, "dayIndex"));
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v7);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = objc_msgSend(v4, "endedCycleFactors", 0);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        unint64_t v17 = [*(id *)(*((void *)&v19 + 1) + 8 * v16) integerValue] - 1;
        if (v17 > 8) {
          uint64_t v18 = 0;
        }
        else {
          uint64_t v18 = byte_224A17AD0[v17];
        }
        objc_msgSend(v3, "endPhase:onJulianDay:", v18, objc_msgSend(v4, "dayIndex"));
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }
}

uint64_t HKHAMenstrualAlgorithmsDayStreamProcessorAlgorithmVersion()
{
  return [MEMORY[0x263F42970] algorithmVersion];
}

id OUTLINED_FUNCTION_0(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id HKMCDaySummarySymptomArrayFromSymptoms(int a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v3 = v2;
  if (a1)
  {
    [v2 addObject:&unk_26D7CFF20];
    if ((a1 & 2) == 0)
    {
LABEL_3:
      if ((a1 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_29;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_3;
  }
  [v3 addObject:&unk_26D7CFF38];
  if ((a1 & 4) == 0)
  {
LABEL_4:
    if ((a1 & 0x100000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_30;
  }
LABEL_29:
  [v3 addObject:&unk_26D7CFF50];
  if ((a1 & 0x100000) == 0)
  {
LABEL_5:
    if ((a1 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_31;
  }
LABEL_30:
  [v3 addObject:&unk_26D7CFF68];
  if ((a1 & 8) == 0)
  {
LABEL_6:
    if ((a1 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_32;
  }
LABEL_31:
  [v3 addObject:&unk_26D7CFF80];
  if ((a1 & 0x10) == 0)
  {
LABEL_7:
    if ((a1 & 0x20000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_33;
  }
LABEL_32:
  [v3 addObject:&unk_26D7CFF98];
  if ((a1 & 0x20000) == 0)
  {
LABEL_8:
    if ((a1 & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_34;
  }
LABEL_33:
  [v3 addObject:&unk_26D7CFFB0];
  if ((a1 & 0x20) == 0)
  {
LABEL_9:
    if ((a1 & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_35;
  }
LABEL_34:
  [v3 addObject:&unk_26D7CFFC8];
  if ((a1 & 0x40) == 0)
  {
LABEL_10:
    if ((a1 & 0x80000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_36;
  }
LABEL_35:
  [v3 addObject:&unk_26D7CFFE0];
  if ((a1 & 0x80000) == 0)
  {
LABEL_11:
    if ((a1 & 0x4000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_37;
  }
LABEL_36:
  [v3 addObject:&unk_26D7CFFF8];
  if ((a1 & 0x4000) == 0)
  {
LABEL_12:
    if ((a1 & 0x40000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_38;
  }
LABEL_37:
  [v3 addObject:&unk_26D7D0010];
  if ((a1 & 0x40000) == 0)
  {
LABEL_13:
    if ((a1 & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_39;
  }
LABEL_38:
  [v3 addObject:&unk_26D7D0028];
  if ((a1 & 0x80) == 0)
  {
LABEL_14:
    if ((a1 & 0x100) == 0) {
      goto LABEL_15;
    }
    goto LABEL_40;
  }
LABEL_39:
  [v3 addObject:&unk_26D7D0040];
  if ((a1 & 0x100) == 0)
  {
LABEL_15:
    if ((a1 & 0x200) == 0) {
      goto LABEL_16;
    }
    goto LABEL_41;
  }
LABEL_40:
  [v3 addObject:&unk_26D7D0058];
  if ((a1 & 0x200) == 0)
  {
LABEL_16:
    if ((a1 & 0x200000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_42;
  }
LABEL_41:
  [v3 addObject:&unk_26D7D0070];
  if ((a1 & 0x200000) == 0)
  {
LABEL_17:
    if ((a1 & 0x400) == 0) {
      goto LABEL_18;
    }
    goto LABEL_43;
  }
LABEL_42:
  [v3 addObject:&unk_26D7D0088];
  if ((a1 & 0x400) == 0)
  {
LABEL_18:
    if ((a1 & 0x800) == 0) {
      goto LABEL_19;
    }
    goto LABEL_44;
  }
LABEL_43:
  [v3 addObject:&unk_26D7D00A0];
  if ((a1 & 0x800) == 0)
  {
LABEL_19:
    if ((a1 & 0x10000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_45;
  }
LABEL_44:
  [v3 addObject:&unk_26D7D00B8];
  if ((a1 & 0x10000) == 0)
  {
LABEL_20:
    if ((a1 & 0x1000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_46;
  }
LABEL_45:
  [v3 addObject:&unk_26D7D00D0];
  if ((a1 & 0x1000) == 0)
  {
LABEL_21:
    if ((a1 & 0x2000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_47;
  }
LABEL_46:
  [v3 addObject:&unk_26D7D00E8];
  if ((a1 & 0x2000) == 0)
  {
LABEL_22:
    if ((a1 & 0x8000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_47:
  [v3 addObject:&unk_26D7D0100];
  if ((a1 & 0x8000) != 0) {
LABEL_23:
  }
    [v3 addObject:&unk_26D7D0118];
LABEL_24:
  return v3;
}

BOOL HKMCDaySummaryBleedingFlowHasFlow(uint64_t a1)
{
  return (unint64_t)(a1 - 2) < 4;
}

void sub_2249FD204(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_224A00B5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
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

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_4(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

id HKMCAllDisplayTypeIdentifiers()
{
  v2[12] = *MEMORY[0x263EF8340];
  v2[0] = @"DisplayTypeIdentifierMenstrualFlow";
  v2[1] = @"DisplayTypeIdentifierBleedingInPregnancyFlow";
  void v2[2] = @"DisplayTypeIdentifierBleedingAfterPregnancyFlow";
  void v2[3] = @"DisplayTypeIdentifierSymptoms";
  v2[4] = @"DisplayTypeIdentifierIntermenstrualBleeding";
  v2[5] = @"DisplayTypeIdentifierSexualActivity";
  v2[6] = @"DisplayTypeIdentifierOvulationTestResult";
  v2[7] = @"DisplayTypeIdentifierProgesteroneTestResult";
  v2[8] = @"DisplayTypeIdentifierPregnancyTestResult";
  v2[9] = @"DisplayTypeIdentifierCervicalMucusQuality";
  v2[10] = @"DisplayTypeIdentifierBasalBodyTemperature";
  void v2[11] = @"DisplayTypeIdentifierCycleFactors";
  v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:12];
  return v0;
}

__CFString *HKMCDisplayTypeIdentifierForSampleType(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 code];
  if (v2 > 242)
  {
    if (v2 > 312)
    {
      if (v2 == 314)
      {
        id v3 = @"DisplayTypeIdentifierBleedingAfterPregnancyFlow";
        goto LABEL_24;
      }
      if (v2 == 313)
      {
        id v3 = @"DisplayTypeIdentifierBleedingInPregnancyFlow";
        goto LABEL_24;
      }
    }
    else
    {
      if (v2 == 243)
      {
        id v3 = @"DisplayTypeIdentifierPregnancyTestResult";
        goto LABEL_24;
      }
      if (v2 == 244)
      {
        id v3 = @"DisplayTypeIdentifierProgesteroneTestResult";
        goto LABEL_24;
      }
    }
LABEL_17:
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v4 = HKMCSymptomSampleTypes();
      char v5 = [v4 containsObject:v1];

      if (v5)
      {
        id v3 = @"DisplayTypeIdentifierSymptoms";
      }
      else
      {
        uint64_t v6 = HKMCCycleFactorsTypes();
        int v7 = [v6 containsObject:v1];

        if (v7) {
          id v3 = @"DisplayTypeIdentifierCycleFactors";
        }
        else {
          id v3 = 0;
        }
      }
    }
    else
    {
      id v3 = 0;
    }
  }
  else
  {
    id v3 = @"DisplayTypeIdentifierMenstrualFlow";
    switch(v2)
    {
      case 'Z':
        id v3 = @"DisplayTypeIdentifierBasalBodyTemperature";
        break;
      case '[':
        id v3 = @"DisplayTypeIdentifierCervicalMucusQuality";
        break;
      case '\\':
        id v3 = @"DisplayTypeIdentifierOvulationTestResult";
        break;
      case '_':
        break;
        id v3 = @"DisplayTypeIdentifierIntermenstrualBleeding";
        break;
      case 'a':
        id v3 = @"DisplayTypeIdentifierSexualActivity";
        break;
      default:
        goto LABEL_17;
    }
  }
LABEL_24:

  return v3;
}

uint64_t HKMCCategoryValueVaginalBleedingFromBleedingFlow(uint64_t a1)
{
  uint64_t result = 1;
  switch(a1)
  {
    case 0:
      uint64_t result = HKMCCategoryValueNotSet;
      break;
    case 1:
      uint64_t result = 5;
      break;
    case 3:
      uint64_t result = 2;
      break;
    case 4:
      uint64_t result = 3;
      break;
    case 5:
      uint64_t result = 4;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t HKMCCategoryValueCervicalMucusQualityFromCervicalMucusQuality(uint64_t a1)
{
  uint64_t result = 1;
  switch(a1)
  {
    case 0:
      uint64_t result = HKMCCategoryValueNotSet;
      break;
    case 2:
    case 3:
    case 4:
    case 5:
      uint64_t result = a1;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t HKMCCategoryValueOvulationTestResultFromOvulationTestResult(uint64_t a1)
{
  uint64_t result = 1;
  switch(a1)
  {
    case 0:
      uint64_t result = HKMCCategoryValueNotSet;
      break;
    case 1:
      uint64_t result = 3;
      break;
    case 3:
      uint64_t result = 4;
      break;
    case 4:
      uint64_t result = 2;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t HKMCCategoryValuePregnancyTestResultFromPregnancyTestResult(uint64_t a1)
{
  if (a1 == 3) {
    return 2;
  }
  if (a1 == 1) {
    return 3;
  }
  if (a1) {
    return 1;
  }
  return HKMCCategoryValueNotSet;
}

uint64_t HKMCCategoryValueProgesteroneTestResultFromProgesteroneTestResult(uint64_t a1)
{
  if (a1 == 3) {
    return 2;
  }
  if (a1 == 1) {
    return 3;
  }
  if (a1) {
    return 1;
  }
  return HKMCCategoryValueNotSet;
}

uint64_t HKMCCategoryValueContraceptiveFromCycleFactor(uint64_t a1)
{
  uint64_t result = 1;
  switch(a1)
  {
    case 1:
    case 2:
      id v3 = [MEMORY[0x263F08690] currentHandler];
      uint64_t v4 = [NSString stringWithUTF8String:"HKCategoryValueContraceptive HKMCCategoryValueContraceptiveFromCycleFactor(HKMCCycleFactor)"];
      char v5 = [NSNumber numberWithInteger:a1];
      [v3 handleFailureInFunction:v4, @"HKMCDefines.m", 200, @"%s: Invalid cycle factor: %@", "HKCategoryValueContraceptive HKMCCategoryValueContraceptiveFromCycleFactor(HKMCCycleFactor)", v5 file lineNumber description];

      uint64_t result = 0;
      break;
    case 4:
      uint64_t result = 2;
      break;
    case 5:
      uint64_t result = 3;
      break;
    case 6:
      uint64_t result = 4;
      break;
    case 7:
      uint64_t result = 5;
      break;
    case 8:
      uint64_t result = 6;
      break;
    case 9:
      uint64_t result = 7;
      break;
    default:
      return result;
  }
  return result;
}

__CFString *NSStringFromCycleFactor(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 8) {
    return @"Pregnancy";
  }
  else {
    return off_2646E99D8[a1 - 1];
  }
}

id NSStringFromCycleFactors(void *a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        unint64_t v8 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "integerValue", (void)v12) - 1;
        uint64_t v9 = @"Pregnancy";
        if (v8 <= 8) {
          uint64_t v9 = off_2646E99D8[v8];
        }
        [v2 addObject:v9];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  uint64_t v10 = [NSString pathWithComponents:v2];

  return v10;
}

uint64_t HKMCAlgorithmSuppressPeriodPredictionsFromCycleFactorSamples(void *a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v1 = a1;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v8 != v3) {
          objc_enumerationMutation(v1);
        }
        uint64_t v5 = *(void **)(*((void *)&v7 + 1) + 8 * i);
        if (objc_msgSend(v5, "hkmc_cycleFactor", (void)v7) == 2
          && ([v5 hasUndeterminedDuration] & 1) != 0)
        {
          uint64_t v2 = 1;
          goto LABEL_12;
        }
      }
      uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v2;
}

uint64_t HKMCForceDisablePeriodProjectionsFromCycleFactorSamples(void *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v1 = a1;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v10 != v3) {
          objc_enumerationMutation(v1);
        }
        uint64_t v5 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        uint64_t v6 = objc_msgSend(v5, "hkmc_cycleFactor", (void)v9);
        BOOL v7 = v6 == 8 || v6 == 2;
        if (v7 && ([v5 hasUndeterminedDuration] & 1) != 0)
        {
          uint64_t v2 = 1;
          goto LABEL_16;
        }
      }
      uint64_t v2 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_16:

  return v2;
}

uint64_t HKMCForceDisableFertileWindowProjectionsFromCycleFactorSamples(void *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v1 = a1;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v10 != v3) {
          objc_enumerationMutation(v1);
        }
        uint64_t v5 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        uint64_t v6 = objc_msgSend(v5, "hkmc_cycleFactor", (void)v9);
        BOOL v7 = (unint64_t)(v6 - 4) < 6 || v6 == 2;
        if (v7 && ([v5 hasUndeterminedDuration] & 1) != 0)
        {
          uint64_t v2 = 1;
          goto LABEL_16;
        }
      }
      uint64_t v2 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_16:

  return v2;
}

__CFString *NSStringFromDeviationType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"Prolonged";
  }
  else {
    return off_2646E9A20[a1 - 1];
  }
}

uint64_t HKMCCervicalMucusQualityFromCategoryValueCervicalMucusQuality(uint64_t result)
{
  if ((unint64_t)(result - 1) >= 5) {
    return 0;
  }
  return result;
}

uint64_t HKMCOvulationTestResultFromCategoryValueOvulationTestResult(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return 0;
  }
  else {
    return qword_224A17BC0[a1 - 1];
  }
}

uint64_t HKMCPregnancyTestResultFromCategoryValuePregnancyTestResult(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return 0;
  }
  else {
    return qword_224A17BE0[a1 - 1];
  }
}

uint64_t HKMCProgesteroneTestResultFromCategoryValueProgesteroneTestResult(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return 0;
  }
  else {
    return qword_224A17BE0[a1 - 1];
  }
}

uint64_t HKMCDataTypeCodeFromMenstrualSymptom(uint64_t a1)
{
  uint64_t v2 = HKMCDaySummarySymptomArrayFromSymptoms(a1);
  uint64_t v3 = [v2 count];

  if (v3 != 1)
  {
    long long v8 = [MEMORY[0x263F08690] currentHandler];
    long long v9 = [NSString stringWithUTF8String:"_HKDataTypeCode HKMCDataTypeCodeFromMenstrualSymptom(HKMCDaySummarySymptoms)"];
    long long v10 = [NSNumber numberWithUnsignedInteger:a1];
    [v8 handleFailureInFunction:v9, @"HKMCDefines.m", 438, @"%s: Invalid symptom: %@", "_HKDataTypeCode HKMCDataTypeCodeFromMenstrualSymptom(HKMCDaySummarySymptoms)", v10 file lineNumber description];
  }
  uint64_t result = 157;
  if (a1 <= 2047)
  {
    if (a1 <= 63)
    {
      switch(a1)
      {
        case 0:
          uint64_t result = HKMCDataTypeCodeNotSet;
          break;
        case 1:
        case 3:
        case 5:
        case 6:
        case 7:
          return result;
        case 2:
          uint64_t result = 161;
          break;
        case 4:
          uint64_t result = 170;
          break;
        case 8:
          uint64_t result = 159;
          break;
        default:
          uint64_t v5 = 158;
          uint64_t v6 = 165;
          if (a1 != 32) {
            uint64_t v6 = 157;
          }
          BOOL v7 = a1 == 16;
          goto LABEL_36;
      }
      return result;
    }
    if (a1 > 255)
    {
      switch(a1)
      {
        case 256:
          return 171;
        case 512:
          return 162;
        case 1024:
          return 164;
      }
      return result;
    }
    uint64_t v5 = 166;
    uint64_t v6 = 160;
    if (a1 != 128) {
      uint64_t v6 = 157;
    }
    BOOL v7 = a1 == 64;
LABEL_36:
    if (v7) {
      return v5;
    }
    else {
      return v6;
    }
  }
  if (a1 < 0x10000)
  {
    if (a1 < 0x2000)
    {
      uint64_t v5 = 168;
      uint64_t v6 = 163;
      if (a1 != 4096) {
        uint64_t v6 = 157;
      }
      BOOL v7 = a1 == 2048;
      goto LABEL_36;
    }
    switch(a1)
    {
      case 0x2000:
        return 169;
      case 0x4000:
        return 167;
      case 0x8000:
        return 229;
    }
  }
  else if (a1 >= 0x80000)
  {
    switch(a1)
    {
      case 0x80000:
        return 233;
      case 0x100000:
        return 234;
      case 0x200000:
        return 235;
    }
  }
  else
  {
    switch(a1)
    {
      case 0x10000:
        return 230;
      case 0x20000:
        return 231;
      case 0x40000:
        return 232;
    }
  }
  return result;
}

uint64_t HKMCDataTypeCodeFromCycleFactors(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 8) {
    return 191;
  }
  else {
    return qword_224A17BF8[a1 - 1];
  }
}

id HKMCLocalizedString(void *a1)
{
  id v1 = (void *)MEMORY[0x263F086E0];
  id v2 = a1;
  uint64_t v3 = [v1 bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:v2 value:&stru_26D7C7A88 table:0];

  return v4;
}

id HKMCLocalizedStringSelene(void *a1)
{
  id v1 = (void *)MEMORY[0x263F086E0];
  id v2 = a1;
  uint64_t v3 = [v1 bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:v2 value:&stru_26D7C7A88 table:@"Localizable-Selene"];

  return v4;
}

id HKMCCycleChartMainTypes()
{
  v16[1] = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F09380]];
  v16[0] = v0;
  id v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];

  uint64_t v14 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F09260]];
  v15[0] = v14;
  long long v13 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F09258]];
  v15[1] = v13;
  long long v12 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F09330]];
  v15[2] = v12;
  id v2 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:*MEMORY[0x263F09C00]];
  v15[3] = v2;
  uint64_t v3 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:*MEMORY[0x263F09BE0]];
  v15[4] = v3;
  uint64_t v4 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F093F0]];
  v15[5] = v4;
  uint64_t v5 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F093A8]];
  v15[6] = v5;
  uint64_t v6 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F093D0]];
  v15[7] = v6;
  BOOL v7 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F093C8]];
  void v15[8] = v7;
  long long v8 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F09278]];
  v15[9] = v8;
  long long v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:10];
  long long v10 = [v1 arrayByAddingObjectsFromArray:v9];

  return v10;
}

uint64_t HKMCIsAlgorithmsVersionSameOnPairedDevice(void *a1)
{
  id v1 = [a1 valueForProperty:*MEMORY[0x263F57608]];
  id v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 isEqualToString:*MEMORY[0x263F099F8]];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

id HKMCActiveWatchPairedProductType()
{
  v0 = [MEMORY[0x263F57730] sharedInstance];
  id v1 = [v0 getActivePairedDevice];

  id v2 = [v1 valueForProperty:*MEMORY[0x263F57628]];

  return v2;
}

BOOL HKMCHeartRateContextIsSedentary(uint64_t a1)
{
  return ((a1 - 3) & 0xFFFFFFFFFFFFFFF7) == 0;
}

__CFString *NSStringFromPredictionPrimarySource(uint64_t a1)
{
  if ((unint64_t)(a1 - 2) > 2) {
    return @"Calendar";
  }
  else {
    return off_2646E9A58[a1 - 2];
  }
}

uint64_t HKFeatureSettingsKeyForIsLoggingHiddenForDisplayTypeIdentifier(uint64_t a1)
{
  return [NSString stringWithFormat:@"IsLoggingHidden_%@", a1];
}

void sub_224A05E24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _HKMCMenstruationDisplayTypeIdentifiers()
{
  if (_HKMCMenstruationDisplayTypeIdentifiers_onceToken != -1) {
    dispatch_once(&_HKMCMenstruationDisplayTypeIdentifiers_onceToken, &__block_literal_global_2);
  }
  v0 = (void *)_HKMCMenstruationDisplayTypeIdentifiers_displayTypeIdentifiers;
  return v0;
}

id _HKMCFertilityDisplayTypeIdentifiers()
{
  v2[5] = *MEMORY[0x263EF8340];
  v2[0] = @"DisplayTypeIdentifierOvulationTestResult";
  v2[1] = @"DisplayTypeIdentifierPregnancyTestResult";
  void v2[2] = @"DisplayTypeIdentifierProgesteroneTestResult";
  void v2[3] = @"DisplayTypeIdentifierCervicalMucusQuality";
  v2[4] = @"DisplayTypeIdentifierBasalBodyTemperature";
  v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:5];
  return v0;
}

id _AnalysisSettingKeys()
{
  v2[10] = *MEMORY[0x263EF8340];
  v2[0] = @"MenstruationProjectionsEnabled";
  v2[1] = @"FertileWindowProjectionsEnabled";
  void v2[2] = @"SensorBasedProjectionsEnabled";
  void v2[3] = @"WristTemperatureBasedProjectionsEnabled";
  v2[4] = @"InternalCycleFactorsOverrideEnabled";
  v2[5] = @"InternalIgnoreOvulationTestResultsEnabled";
  void v2[6] = @"ProlongedDeviationDetectionEnabled";
  v2[7] = @"SpottingDeviationDetectionEnabled";
  v2[8] = @"IrregularDeviationDetectionEnabled";
  v2[9] = @"InfrequentDeviationDetectionEnabled";
  v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:10];
  return v0;
}

id _NotificationSettingKeys()
{
  v2[4] = *MEMORY[0x263EF8340];
  v2[0] = @"MenstruationNotificationsEnabled";
  v2[1] = @"MenstruationNotificationTimeOfDay";
  void v2[2] = @"FertileWindowNotificationsEnabled";
  void v2[3] = @"FertileWindowNotificationTimeOfDay";
  v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:4];
  return v0;
}

id _HiddenDisplayTypeSettingKeys()
{
  v2[1] = *MEMORY[0x263EF8340];
  v2[0] = @"ShouldHideByDisplayTypeIdentifier";
  v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:1];
  return v0;
}

id _AlgorithmVersionMismatchSettingKeys()
{
  v2[7] = *MEMORY[0x263EF8340];
  v2[0] = @"MenstruationProjectionsDisabledForVersionMismatch";
  v2[1] = @"FertileWindowProjectionsDisabledForVersionMismatch";
  void v2[2] = @"LocalizedTextForVersionMismatchAndDisabledProjections";
  void v2[3] = @"MenstruationProjectionsAlgorithmAttributesPhone";
  v2[4] = @"FertileWindowProjectionsAlgorithmAttributesPhone";
  void v2[5] = @"MenstruationProjectionsAlgorithmAttributesWatch";
  void v2[6] = @"FertileWindowProjectionsAlgorithmAttributesWatch";
  v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:7];
  return v0;
}

void sub_224A089B4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return objc_opt_class();
}

id OUTLINED_FUNCTION_4_0(id a1)
{
  return a1;
}

void sub_224A0CC68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  return objc_opt_class();
}

id OUTLINED_FUNCTION_4_1(uint64_t a1, void *a2)
{
  return a2;
}

__CFString *HKMCDeviationDetectionAnalyticsKeyFromDeviationType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"ProlongedDeviationDetectedDayIndices";
  }
  else {
    return off_2646E9F08[a1 - 1];
  }
}

void HKMCPredictionPrimarySourceFromHAMenstrualAlgorithmsPredictionPrimarySource_cold_1(void *a1, unsigned __int8 a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = NSNumber;
  uint64_t v4 = a1;
  uint64_t v5 = [v3 numberWithUnsignedChar:a2];
  int v6 = 138412290;
  BOOL v7 = v5;
  _os_log_fault_impl(&dword_2249E9000, v4, OS_LOG_TYPE_FAULT, "Passed an unknown primary source: %@", (uint8_t *)&v6, 0xCu);
}

uint64_t AnalyticsIsEventUsed()
{
  return MEMORY[0x270F18A30]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x270F18A38]();
}

uint64_t HKCreateSerialDispatchQueue()
{
  return MEMORY[0x270EF3660]();
}

uint64_t HKIntersectionDayIndexRange()
{
  return MEMORY[0x270EF3720]();
}

uint64_t HKSafeObject()
{
  return MEMORY[0x270EF3800]();
}

uint64_t HKSensitiveLogItem()
{
  return MEMORY[0x270EF3808]();
}

uint64_t HKShowSensitiveLogItems()
{
  return MEMORY[0x270EF3818]();
}

uint64_t HKSynchronizeNanoPreferencesUserDefaults()
{
  return MEMORY[0x270EF3898]();
}

uint64_t HKUnionDayIndexRange()
{
  return MEMORY[0x270EF38A8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t NSStringFromHKDayIndexRange()
{
  return MEMORY[0x270EF38C0]();
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x270EF2C28](range.location, range.length);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _HKInitializeLogging()
{
  return MEMORY[0x270EF3970]();
}

uint64_t _HKLogDroppedError()
{
  return MEMORY[0x270EF3978]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x270EDA750](*(void *)&val);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}