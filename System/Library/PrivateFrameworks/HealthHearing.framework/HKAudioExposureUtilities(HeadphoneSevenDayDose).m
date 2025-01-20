@interface HKAudioExposureUtilities(HeadphoneSevenDayDose)
+ (id)_sevenDayDoseWithExposureAverageQuantity:()HeadphoneSevenDayDose duration:error:;
+ (id)hk_sevenDayDoseWithExposureLevel:()HeadphoneSevenDayDose exposureDuration:error:;
@end

@implementation HKAudioExposureUtilities(HeadphoneSevenDayDose)

+ (id)hk_sevenDayDoseWithExposureLevel:()HeadphoneSevenDayDose exposureDuration:error:
{
  objc_msgSend(MEMORY[0x263F0A0E0], "maximumDurationInSecondsForLEQ:days:", 7);
  if (v7 <= 2.22044605e-16)
  {
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:", a5, 3, @"compute 7-day headphone dose failed");
    _HKInitializeLogging();
    v9 = *MEMORY[0x263F09910];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_FAULT)) {
      +[HKAudioExposureUtilities(HeadphoneSevenDayDose) hk_sevenDayDoseWithExposureLevel:exposureDuration:error:](v9);
    }
    v8 = 0;
  }
  else
  {
    v8 = [NSNumber numberWithDouble:a2 / v7];
  }
  return v8;
}

+ (id)_sevenDayDoseWithExposureAverageQuantity:()HeadphoneSevenDayDose duration:error:
{
  id v8 = a3;
  id v9 = a4;
  v10 = [MEMORY[0x263F0A830] decibelAWeightedSoundPressureLevelUnit];
  if ([v8 isCompatibleWithUnit:v10])
  {
    v11 = [MEMORY[0x263F0A830] secondUnit];
    if ([v9 isCompatibleWithUnit:v11])
    {
      [v8 doubleValueForUnit:v10];
      double v13 = v12;
      [v9 doubleValueForUnit:v11];
      v15 = objc_msgSend(a1, "hk_sevenDayDoseWithExposureLevel:exposureDuration:error:", a5, v13, v14);
      goto LABEL_7;
    }
    v17 = (void *)MEMORY[0x263F087E8];
    v18 = [v9 _unit];
    objc_msgSend(v17, "hk_assignError:code:format:", a5, 3, @"duration (%@) incompatible with second unit", v18);
  }
  else
  {
    v16 = (void *)MEMORY[0x263F087E8];
    v11 = [v8 _unit];
    objc_msgSend(v16, "hk_assignError:code:format:", a5, 3, @"averageQuantity (%@) incompatable with dBASPL unit", v11);
  }
  v15 = 0;
LABEL_7:

  return v15;
}

+ (void)hk_sevenDayDoseWithExposureLevel:()HeadphoneSevenDayDose exposureDuration:error:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_22315A000, log, OS_LOG_TYPE_FAULT, "compute 7-day headphone dose failed", v1, 2u);
}

@end