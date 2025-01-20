@interface DASSchedulerClass
@end

@implementation DASSchedulerClass

void __get_DASSchedulerClass_block_invoke(uint64_t a1)
{
  DuetActivitySchedulerLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("_DASScheduler");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    get_DASSchedulerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v2 = (MLBackgroundPredictionTask *)abort_report_np();
    [(MLBackgroundPredictionTask *)v2 .cxx_destruct];
  }
}

@end