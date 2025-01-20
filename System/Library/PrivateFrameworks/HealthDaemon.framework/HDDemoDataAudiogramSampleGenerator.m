@interface HDDemoDataAudiogramSampleGenerator
- (uint64_t)_hearingLevelClassificationForEar:(uint64_t)a1;
- (void)generateFirstRunObjectsForDemoPerson:(id)a3 firstDate:(id)a4 objectCollection:(id)a5;
@end

@implementation HDDemoDataAudiogramSampleGenerator

- (void)generateFirstRunObjectsForDemoPerson:(id)a3 firstDate:(id)a4 objectCollection:(id)a5
{
  id v22 = a4;
  id v21 = a5;
  v7 = [MEMORY[0x1E4F2B860] sharedBehavior];
  char v8 = [v7 isAppleWatch];

  if ((v8 & 1) == 0)
  {
    if (self)
    {
      v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      v10 = [v9 objectForKey:@"HealthDemoDataAudiogramSampleInterval"];

      if (v10 && [v10 integerValue] >= 1) {
        uint64_t v11 = [v10 integerValue];
      }
      else {
        uint64_t v11 = 60;
      }
    }
    else
    {
      uint64_t v11 = 0;
    }
    uint64_t v12 = [MEMORY[0x1E4F1C9C8] date];
    v13 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v20 = (void *)v12;
    v14 = [v13 components:30 fromDate:v12];
    [v14 setHour:10];
    [v14 setMinute:30];
    v15 = [v13 dateFromComponents:v14];
    uint64_t v16 = 0;
    while (1)
    {
      v17 = objc_msgSend(v13, "hk_dateBySubtractingDays:fromDate:", v16, v15);
      if (objc_msgSend(v17, "hk_isBeforeDate:", v22)) {
        break;
      }
      uint64_t v18 = -[HDDemoDataAudiogramSampleGenerator _hearingLevelClassificationForEar:]((uint64_t)self, @"HealthDemoDataAudiogramLeftEarHearingLevelClassificationOverride");
      v19 = objc_msgSend(MEMORY[0x1E4F2AC38], "randomAudiogramSampleWithLeftEarClassification:rightEarClassification:startDate:endDate:device:metadata:", v18, -[HDDemoDataAudiogramSampleGenerator _hearingLevelClassificationForEar:]((uint64_t)self, @"HealthDemoDataAudiogramRightEarHearingLevelClassificationOverride"), v17, v17, 0, 0);
      [v21 addObjectFromPhone:v19];
      v16 += v11;

      if (v16 >= 3650) {
        goto LABEL_13;
      }
    }

LABEL_13:
  }
}

- (uint64_t)_hearingLevelClassificationForEar:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  v2 = (void *)MEMORY[0x1E4F1CB18];
  id v3 = a2;
  v4 = [v2 standardUserDefaults];
  v5 = [v4 objectForKey:v3];

  if (v5)
  {
    unint64_t v6 = [v5 integerValue];
    uint64_t v7 = 5;
    if (v6 < 5) {
      uint64_t v7 = v6;
    }
    if (v6) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 1;
    }
  }
  else
  {
    uint64_t v8 = 1;
  }

  return v8;
}

@end