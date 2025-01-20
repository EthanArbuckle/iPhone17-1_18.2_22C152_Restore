@interface HKWorkoutDistanceTypeForActivityTypeSymbolLoc
@end

@implementation HKWorkoutDistanceTypeForActivityTypeSymbolLoc

void *__get_HKWorkoutDistanceTypeForActivityTypeSymbolLoc_block_invoke(void *a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!HealthKitLibraryCore_frameworkLibrary)
  {
    v5[1] = (void *)MEMORY[0x263EF8330];
    v5[2] = (void *)3221225472;
    v5[3] = __HealthKitLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_264E58790;
    uint64_t v7 = 0;
    HealthKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  v2 = (void *)HealthKitLibraryCore_frameworkLibrary;
  if (!HealthKitLibraryCore_frameworkLibrary)
  {
    a1 = [MEMORY[0x263F08690] currentHandler];
    v2 = [NSString stringWithUTF8String:"void *HealthKitLibrary(void)"];
    objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", v2, @"WFFitnessUIHelper.m", 21, @"%s", v5[0]);

    __break(1u);
    goto LABEL_7;
  }
  v3 = v5[0];
  if (v5[0]) {
LABEL_7:
  }
    free(v3);
  result = dlsym(v2, "_HKWorkoutDistanceTypeForActivityType");
  *(void *)(*(void *)(a1[4] + 8) + 24) = result;
  get_HKWorkoutDistanceTypeForActivityTypeSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(a1[4] + 8) + 24);
  return result;
}

@end