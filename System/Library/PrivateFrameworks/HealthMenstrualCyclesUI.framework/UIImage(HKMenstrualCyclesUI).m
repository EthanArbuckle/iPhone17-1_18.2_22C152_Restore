@interface UIImage(HKMenstrualCyclesUI)
+ (id)_hkmcui_imageWithAssetName:()HKMenstrualCyclesUI;
+ (id)hkmc_fertilityProjectionReversedImage;
+ (id)hkmc_menstruationProjectionHighReversedImage;
+ (id)hkmc_menstruationProjectionLowReversedImage;
+ (id)hkmc_ovulationDayReversedImage;
+ (uint64_t)hkmc_fertilityProjectionImage;
+ (uint64_t)hkmc_fertilityProjectionImageHighContrast;
+ (uint64_t)hkmc_menstruationProjectionHighImage;
+ (uint64_t)hkmc_menstruationProjectionHighImageHighContrast;
+ (uint64_t)hkmc_menstruationProjectionLowImage;
+ (uint64_t)hkmc_menstruationProjectionLowImageHighContrast;
+ (uint64_t)hkmc_ovulationDayImage;
+ (uint64_t)hkmc_ovulationDayImageHighContrast;
+ (uint64_t)hkmc_ovulationEstimateImage;
@end

@implementation UIImage(HKMenstrualCyclesUI)

+ (id)_hkmcui_imageWithAssetName:()HKMenstrualCyclesUI
{
  v3 = (void *)MEMORY[0x263F827E8];
  v4 = (void *)MEMORY[0x263F086E0];
  id v5 = a3;
  v6 = objc_msgSend(v4, "hkmcui_bundle");
  v7 = [v3 imageNamed:v5 inBundle:v6 compatibleWithTraitCollection:0];

  return v7;
}

+ (uint64_t)hkmc_fertilityProjectionImage
{
  return objc_msgSend(MEMORY[0x263F827E8], "_hkmcui_imageWithAssetName:", @"Fertility Projection");
}

+ (id)hkmc_fertilityProjectionReversedImage
{
  v1 = objc_msgSend(a1, "hkmc_fertilityProjectionImage");
  v2 = [v1 imageWithHorizontallyFlippedOrientation];

  return v2;
}

+ (uint64_t)hkmc_fertilityProjectionImageHighContrast
{
  return objc_msgSend(a1, "_hkmcui_imageWithAssetName:", @"Fertility Projection - High Contrast");
}

+ (uint64_t)hkmc_menstruationProjectionHighImage
{
  return objc_msgSend(MEMORY[0x263F827E8], "_hkmcui_imageWithAssetName:", @"Menstruation Projection High");
}

+ (id)hkmc_menstruationProjectionHighReversedImage
{
  v1 = objc_msgSend(a1, "hkmc_menstruationProjectionHighImage");
  v2 = [v1 imageWithHorizontallyFlippedOrientation];

  return v2;
}

+ (uint64_t)hkmc_menstruationProjectionHighImageHighContrast
{
  return objc_msgSend(a1, "_hkmcui_imageWithAssetName:", @"Menstruation Projection High - High Contrast");
}

+ (uint64_t)hkmc_menstruationProjectionLowImage
{
  return objc_msgSend(MEMORY[0x263F827E8], "_hkmcui_imageWithAssetName:", @"Menstruation Projection Low");
}

+ (id)hkmc_menstruationProjectionLowReversedImage
{
  v1 = objc_msgSend(a1, "hkmc_menstruationProjectionLowImage");
  v2 = [v1 imageWithHorizontallyFlippedOrientation];

  return v2;
}

+ (uint64_t)hkmc_menstruationProjectionLowImageHighContrast
{
  return objc_msgSend(a1, "_hkmcui_imageWithAssetName:", @"Menstruation Projection Low - High Contrast");
}

+ (uint64_t)hkmc_ovulationDayImage
{
  return objc_msgSend(MEMORY[0x263F827E8], "_hkmcui_imageWithAssetName:", @"Ovulation Day Cycle Timeline");
}

+ (id)hkmc_ovulationDayReversedImage
{
  v1 = objc_msgSend(a1, "hkmc_ovulationDayImage");
  v2 = [v1 imageWithHorizontallyFlippedOrientation];

  return v2;
}

+ (uint64_t)hkmc_ovulationDayImageHighContrast
{
  return objc_msgSend(MEMORY[0x263F827E8], "_hkmcui_imageWithAssetName:", @"Ovulation Day Cycle Timeline - High Contrast");
}

+ (uint64_t)hkmc_ovulationEstimateImage
{
  return objc_msgSend(MEMORY[0x263F827E8], "_hkmcui_imageWithAssetName:", @"Ovulation Confirmation");
}

@end