@interface FigDataQueueServer
@end

@implementation FigDataQueueServer

void __FigDataQueueServer_EnsureServerAndCopyXPCEndpoint_block_invoke()
{
  fig_note_initialize_category_with_default_work_cf();
  fig_note_initialize_category_with_default_work_cf();
  CFDictionaryRef v0 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], MEMORY[0x1E4F220C0], MEMORY[0x1E4F1CFD0], 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (v0)
  {
    CFDictionaryRef v1 = v0;
    int v2 = FigXPCServerStartWithNewXPCEndpoint();
    CFRelease(v1);
  }
  else
  {
    int v2 = FigSignalErrorAt();
  }
  FigDataQueueServer_EnsureServerAndCopyXPCEndpoint_sFigDataQueueServerStartError = v2;
}

@end