@interface DPNumericDataRecorderClass
@end

@implementation DPNumericDataRecorderClass

Class __get_DPNumericDataRecorderClass_block_invoke(uint64_t a1)
{
  DifferentialPrivacyLibrary();
  Class result = objc_getClass("_DPNumericDataRecorder");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __get_DPNumericDataRecorderClass_block_invoke_cold_1();
  }
  get_DPNumericDataRecorderClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_DPNumericDataRecorderClass_block_invoke_cold_1()
{
}

@end