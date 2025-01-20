@interface CreateRPCTimeoutThread
@end

@implementation CreateRPCTimeoutThread

void __fpServer_CreateRPCTimeoutThread_block_invoke()
{
  qword_1E92729A8 = (uint64_t)FigDispatchQueueCreateWithPriority("FigRPCTimeoutServerQueue", 0, 0x23u);
  dword_1E92729B0 = 0;
  uint64_t v0 = bootstrap_check_in(*MEMORY[0x1E4F14638], "com.apple.coremedia.admin", (mach_port_t *)&dword_1E92729B0);
  if (v0)
  {
    FigSignalErrorAt(v0, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    qword_1E92729B8 = (uint64_t)dispatch_source_create(MEMORY[0x1E4F14458], dword_1E92729B0, 0, (dispatch_queue_t)qword_1E92729A8);
    dispatch_source_set_cancel_handler((dispatch_source_t)qword_1E92729B8, &__block_literal_global_14);
    dispatch_source_set_event_handler((dispatch_source_t)qword_1E92729B8, &__block_literal_global_17);
    v1 = qword_1E92729B8;
    dispatch_resume(v1);
  }
}

void __fpServer_CreateRPCTimeoutThread_block_invoke_2()
{
  qword_1E92729B8 = 0;
}

uint64_t __fpServer_CreateRPCTimeoutThread_block_invoke_3()
{
  return MEMORY[0x1F40CBB78](qword_1E92729B8, 560);
}

@end