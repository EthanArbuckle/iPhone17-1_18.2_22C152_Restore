@interface AXSettings(HPSAdditions)
+ (__CFString)hps_stringFromTapActivationMethod:()HPSAdditions;
+ (uint64_t)hps_tapActivationMethodFromString:()HPSAdditions;
- (uint64_t)hps_touchAccomodationsTapActivationMethodString;
@end

@implementation AXSettings(HPSAdditions)

- (uint64_t)hps_touchAccomodationsTapActivationMethodString
{
  v1 = (void *)MEMORY[0x263F22938];
  uint64_t v2 = [a1 touchAccommodationsTapActivationMethod];
  return objc_msgSend(v1, "hps_stringFromTapActivationMethod:", v2);
}

+ (__CFString)hps_stringFromTapActivationMethod:()HPSAdditions
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return off_264E89BD0[a3];
  }
}

+ (uint64_t)hps_tapActivationMethodFromString:()HPSAdditions
{
  id v3 = a3;
  if ([v3 isEqualToString:@"off"])
  {
    uint64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"useInitialTouchLocation"])
  {
    uint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"useFinalTouchLocation"])
  {
    uint64_t v4 = 2;
  }
  else
  {
    uint64_t v4 = -1;
  }

  return v4;
}

@end