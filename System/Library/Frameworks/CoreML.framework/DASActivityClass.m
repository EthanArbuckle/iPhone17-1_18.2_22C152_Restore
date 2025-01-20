@interface DASActivityClass
@end

@implementation DASActivityClass

MLBackgroundTask *__get_DASActivityClass_block_invoke(uint64_t a1)
{
  DuetActivitySchedulerLibrary();
  result = (MLBackgroundTask *)objc_getClass("_DASActivity");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    get_DASActivityClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (MLBackgroundTask *)abort_report_np();
    return [(MLBackgroundTask *)v3 init];
  }
  return result;
}

@end