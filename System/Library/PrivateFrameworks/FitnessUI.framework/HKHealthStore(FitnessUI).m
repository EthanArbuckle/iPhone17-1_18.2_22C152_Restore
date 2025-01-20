@interface HKHealthStore(FitnessUI)
+ (__CFString)fiui_localizationStringSuffixForWheelchairUser:()FitnessUI;
+ (id)fiui_sharedHealthStoreForCarousel;
@end

@implementation HKHealthStore(FitnessUI)

+ (id)fiui_sharedHealthStoreForCarousel
{
  if (fiui_sharedHealthStoreForCarousel_onceToken != -1) {
    dispatch_once(&fiui_sharedHealthStoreForCarousel_onceToken, &__block_literal_global_21);
  }
  v0 = (void *)fiui_sharedHealthStoreForCarousel___healthStore;
  return v0;
}

+ (__CFString)fiui_localizationStringSuffixForWheelchairUser:()FitnessUI
{
  v3 = &stru_26CF5F1B8;
  if (a3) {
    v3 = @"_WHEELCHAIR";
  }
  v4 = v3;
  return v4;
}

@end