@interface HKECGAvailabilityEngine
+ (id)shouldAdvertiseECG2WithSupportedRegion:(BOOL)a3 meetsAgeRequirement:(BOOL)a4 backgroundDeliveredNotAdvertised:(BOOL)a5 prevOnboarded:(BOOL)a6 watchCapable:(BOOL)a7 phoneCapable:(BOOL)a8 isTinker:(BOOL)a9;
@end

@implementation HKECGAvailabilityEngine

+ (id)shouldAdvertiseECG2WithSupportedRegion:(BOOL)a3 meetsAgeRequirement:(BOOL)a4 backgroundDeliveredNotAdvertised:(BOOL)a5 prevOnboarded:(BOOL)a6 watchCapable:(BOOL)a7 phoneCapable:(BOOL)a8 isTinker:(BOOL)a9
{
  if (!a4 || a9 || !a7 || !a8)
  {
    v9 = +[HKECGAvailabilityResult resultWithNoAdvertisements];
    goto LABEL_4;
  }
  if (!a5)
  {
    if (a6)
    {
      if (a3)
      {
        *(void *)&a3 = 0;
        uint64_t v11 = 0;
        uint64_t v12 = 1;
      }
      else
      {
        uint64_t v11 = 0;
        uint64_t v12 = 0;
      }
      uint64_t v13 = 1;
      goto LABEL_22;
    }
    if (a3) {
      *(void *)&a3 = 1;
    }
    uint64_t v11 = 1;
LABEL_19:
    uint64_t v12 = 0;
    uint64_t v13 = 0;
LABEL_22:
    uint64_t v14 = 0;
    goto LABEL_23;
  }
  if (!a3)
  {
    uint64_t v11 = 0;
    goto LABEL_19;
  }
  *(void *)&a3 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = 1;
LABEL_23:
  v9 = +[HKECGAvailabilityResult resultWithAdvertiseDirectOnboarding:a3 advertiseDirectOnboardingSecondary:v11 advertiseUpgrade:v12 advertiseUpgradeSecondary:v13 advertiseUpgradeBackgroundDelivered:v14];
LABEL_4:

  return v9;
}

@end