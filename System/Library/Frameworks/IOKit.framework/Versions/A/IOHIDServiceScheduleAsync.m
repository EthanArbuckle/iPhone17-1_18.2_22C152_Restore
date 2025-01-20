@interface IOHIDServiceScheduleAsync
@end

@implementation IOHIDServiceScheduleAsync

BOOL ___IOHIDServiceScheduleAsync_block_invoke(uint64_t a1, uint64_t a2)
{
  BOOL result = IOHIDServiceFilterSetCancelHandler(a2, *(void *)(*(void *)(a1 + 32) + 432));
  if (result) {
    ++*(_DWORD *)(*(void *)(a1 + 32) + 444);
  }
  return result;
}

@end