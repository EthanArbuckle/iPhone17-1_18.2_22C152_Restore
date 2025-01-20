@interface DASActivityGroupClass
@end

@implementation DASActivityGroupClass

void __get_DASActivityGroupClass_block_invoke(uint64_t a1)
{
  DuetActivitySchedulerLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("_DASActivityGroup");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    get_DASActivityGroupClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = abort_report_np();
    __get_DASSchedulerClass_block_invoke(v2);
  }
}

@end