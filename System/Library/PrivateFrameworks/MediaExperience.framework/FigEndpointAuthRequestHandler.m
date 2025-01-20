@interface FigEndpointAuthRequestHandler
@end

@implementation FigEndpointAuthRequestHandler

uint64_t __FigEndpointAuthRequestHandler_GetAuthRequestList_block_invoke()
{
  FigNote_AllowInternalDefaultLogs();
  fig_note_initialize_category_with_default_work();
  fig_note_initialize_category_with_default_work();
  if (dword_1E9359AD8 >= 0x100) {
    dword_1E9359AD8 = 0;
  }
  uint64_t result = FigSimpleMutexCreate();
  FigEndpointAuthRequestHandler_GetAuthRequestList_authListObj = 0;
  xmmword_1E93582F8 = 0uLL;
  qword_1E93582F0 = result;
  return result;
}

@end