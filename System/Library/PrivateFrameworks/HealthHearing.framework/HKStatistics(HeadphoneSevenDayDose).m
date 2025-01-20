@interface HKStatistics(HeadphoneSevenDayDose)
- (id)hk_hearingSevenDayDoseDateIntervalEndingBeforeDate:()HeadphoneSevenDayDose error:;
- (id)hk_hearingSevenDayDosePercentageWithError:()HeadphoneSevenDayDose;
- (id)unitTesting_hearingSevenDayDoseCategorySampleWithNow:()HeadphoneSevenDayDose includesPrunableData:error:;
@end

@implementation HKStatistics(HeadphoneSevenDayDose)

- (id)hk_hearingSevenDayDosePercentageWithError:()HeadphoneSevenDayDose
{
  v5 = (void *)MEMORY[0x263F0A0E0];
  v6 = [a1 averageQuantity];
  v7 = [a1 duration];
  v8 = [v5 _sevenDayDoseWithExposureAverageQuantity:v6 duration:v7 error:a3];

  return v8;
}

- (id)hk_hearingSevenDayDoseDateIntervalEndingBeforeDate:()HeadphoneSevenDayDose error:
{
  id v6 = a3;
  v7 = [a1 startDate];
  uint64_t v8 = [v7 compare:v6];

  if (v8 == 1) {
    goto LABEL_3;
  }
  id v9 = objc_alloc(MEMORY[0x263F08798]);
  v10 = [a1 startDate];
  v11 = (void *)[v9 initWithStartDate:v10 endDate:v6];

  id v12 = objc_alloc(MEMORY[0x263F08798]);
  v13 = [a1 startDate];
  v14 = [a1 endDate];
  v15 = (void *)[v12 initWithStartDate:v13 endDate:v14];

  v16 = [v15 intersectionWithDateInterval:v11];
  v17 = objc_msgSend(v16, "hk_hearingSevenDayDoseDateIntervalClampedToMaxDuration");

  if (!v17)
  {
LABEL_3:
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a4, 3, @"Unable to truncate date interval %@ to maxEndDate %@", a1, v6);
    v17 = 0;
  }

  return v17;
}

- (id)unitTesting_hearingSevenDayDoseCategorySampleWithNow:()HeadphoneSevenDayDose includesPrunableData:error:
{
  v33[3] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = [MEMORY[0x263F0A830] decibelAWeightedSoundPressureLevelUnit];
  v10 = [a1 averageQuantity];
  char v11 = [v10 isCompatibleWithUnit:v9];

  if (v11)
  {
    id v12 = [MEMORY[0x263F0A830] secondUnit];
    v13 = [a1 duration];
    char v14 = [v13 isCompatibleWithUnit:v12];

    if (v14)
    {
      v15 = objc_msgSend(a1, "hk_hearingSevenDayDoseDateIntervalEndingBeforeDate:error:", v8, a5);
      if (v15)
      {
        v16 = (void *)MEMORY[0x263F0A150];
        v17 = HKHeadphoneAudioExposureEventType();
        v30 = [v15 startDate];
        v29 = [v15 endDate];
        v32[0] = *MEMORY[0x263F09A38];
        v31 = [a1 averageQuantity];
        v33[0] = v31;
        v32[1] = *MEMORY[0x263F09A28];
        v28 = [a1 duration];
        v33[1] = v28;
        v32[2] = *MEMORY[0x263F0AB40];
        v18 = [NSNumber numberWithBool:a4];
        v33[2] = v18;
        v19 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:3];
        v20 = [v16 categorySampleWithType:v17 value:1 startDate:v30 endDate:v29 device:0 metadata:v19];
      }
      else
      {
        v20 = 0;
      }
    }
    else
    {
      v24 = (void *)MEMORY[0x263F087E8];
      v25 = [a1 duration];
      v26 = [v25 _unit];
      objc_msgSend(v24, "hk_assignError:code:format:", a5, 3, @"duration (%@) incompatible with second unit", v26);

      v20 = 0;
    }
  }
  else
  {
    v21 = (void *)MEMORY[0x263F087E8];
    v22 = [a1 averageQuantity];
    v23 = [v22 _unit];
    objc_msgSend(v21, "hk_assignError:code:format:", a5, 3, @"averageQuantity (%@) incompatable with dBASPL unit", v23);

    v20 = 0;
  }

  return v20;
}

@end