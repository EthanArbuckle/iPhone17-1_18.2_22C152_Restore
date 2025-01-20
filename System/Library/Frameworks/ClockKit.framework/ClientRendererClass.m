@interface ClientRendererClass
@end

@implementation ClientRendererClass

Class __get_ClientRendererClass_block_invoke(uint64_t a1)
{
  ComplicationDisplayLibrary();
  Class result = objc_getClass("_ClientRenderer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    get_ClientRendererClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __get_ClientRendererClass_block_invoke_cold_1();
    return (Class)ComplicationDisplayLibrary();
  }
  return result;
}

uint64_t __get_ClientRendererClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[CLKComplicationTimelineEntry validateComplicationFamily:](v0);
}

@end