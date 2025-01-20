@interface DPStringRecorderClass
@end

@implementation DPStringRecorderClass

Class __get_DPStringRecorderClass_block_invoke(uint64_t a1)
{
  DifferentialPrivacyLibrary();
  Class result = objc_getClass("_DPStringRecorder");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __get_DPStringRecorderClass_block_invoke_cold_1();
  }
  get_DPStringRecorderClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_DPStringRecorderClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __get_DPNumericDataRecorderClass_block_invoke_cold_1(v0);
}

@end