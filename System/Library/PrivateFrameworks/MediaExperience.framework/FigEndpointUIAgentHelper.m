@interface FigEndpointUIAgentHelper
@end

@implementation FigEndpointUIAgentHelper

uint64_t __FigEndpointUIAgentHelper_GetSharedHelper_block_invoke()
{
  FigNote_AllowInternalDefaultLogs();
  fig_note_initialize_category_with_default_work();
  fig_note_initialize_category_with_default_work();
  if (dword_1E9359D60 >= 0x100) {
    dword_1E9359D60 = 0;
  }
  uint64_t result = FigSimpleMutexCreate();
  qword_1E93587B0 = 0;
  unk_1E93587B8 = 0;
  FigEndpointUIAgentHelper_GetSharedHelper_endpointUIAgentHelperObj = result;
  return result;
}

@end