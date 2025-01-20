@interface HKMedicalIDDataClass
@end

@implementation HKMedicalIDDataClass

Class __get_HKMedicalIDDataClass_block_invoke(uint64_t a1)
{
  HealthKitLibrary_0();
  Class result = objc_getClass("_HKMedicalIDData");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    get_HKMedicalIDDataClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __get_HKMedicalIDDataClass_block_invoke_cold_1();
    return (Class)__getMIUIDisplayConfigurationClass_block_invoke(v3);
  }
  return result;
}

Class __get_HKMedicalIDDataClass_block_invoke_0(uint64_t a1)
{
  HealthKitLibrary_1();
  Class result = objc_getClass("_HKMedicalIDData");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    get_HKMedicalIDDataClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __get_HKMedicalIDDataClass_block_invoke_cold_1();
    return (Class)__getSTSetupClientClass_block_invoke(v3);
  }
  return result;
}

Class __get_HKMedicalIDDataClass_block_invoke_1(uint64_t a1)
{
  HealthKitLibrary_2();
  Class result = objc_getClass("_HKMedicalIDData");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    get_HKMedicalIDDataClass_softClass_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __get_HKMedicalIDDataClass_block_invoke_cold_1();
    return (Class)__getSTSetupClientClass_block_invoke_0(v3);
  }
  return result;
}

uint64_t __get_HKMedicalIDDataClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getMIUIDisplayConfigurationClass_block_invoke_cold_1(v0);
}

@end