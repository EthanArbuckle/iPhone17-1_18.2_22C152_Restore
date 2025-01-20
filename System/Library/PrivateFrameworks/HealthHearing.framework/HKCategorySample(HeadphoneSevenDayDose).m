@interface HKCategorySample(HeadphoneSevenDayDose)
- (BOOL)hk_isHearingSevenDayDoseNotification;
- (id)hk_hearingSevenDayDosePercentageWithError:()HeadphoneSevenDayDose;
@end

@implementation HKCategorySample(HeadphoneSevenDayDose)

- (BOOL)hk_isHearingSevenDayDoseNotification
{
  v2 = [a1 categoryType];
  BOOL v3 = [v2 code] == 199 && objc_msgSend(a1, "value") == 1;

  return v3;
}

- (id)hk_hearingSevenDayDosePercentageWithError:()HeadphoneSevenDayDose
{
  v5 = [a1 categoryType];
  uint64_t v6 = [v5 code];

  if (v6 != 199)
  {
    v12 = (void *)MEMORY[0x263F087E8];
    v13 = [a1 categoryType];
    objc_msgSend(v12, "hk_assignError:code:format:", a3, 3, @"Unexpected data type code: %ld", objc_msgSend(v13, "code"));

LABEL_8:
    v11 = 0;
    goto LABEL_13;
  }
  if ([a1 value] != 1)
  {
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a3, 3, @"Unexpected value: %ld", objc_msgSend(a1, "value"));
    goto LABEL_8;
  }
  v7 = [a1 metadata];
  v8 = objc_msgSend(v7, "hk_safeValueForKeyPath:class:error:", *MEMORY[0x263F09A38], objc_opt_class(), a3);

  if (v8)
  {
    v9 = [a1 metadata];
    v10 = objc_msgSend(v9, "hk_safeValueForKeyPath:class:error:", *MEMORY[0x263F09A28], objc_opt_class(), a3);

    if (v10)
    {
      v11 = [MEMORY[0x263F0A0E0] _sevenDayDoseWithExposureAverageQuantity:v8 duration:v10 error:a3];
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }

LABEL_13:
  return v11;
}

@end