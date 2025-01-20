@interface FPLayerStateSyncQueue
@end

@implementation FPLayerStateSyncQueue

uint64_t ___FPLayerStateSyncQueue_block_invoke()
{
  qword_26B1F5070 = (uint64_t)dispatch_queue_create("com.apple.FramePacing.LayerStateSyncQueue", 0);

  return MEMORY[0x270F9A758]();
}

@end