@interface CreateEmptyWrapper
@end

@implementation CreateEmptyWrapper

uint64_t __frr_CreateEmptyWrapper_block_invoke()
{
  uint64_t result = FigSimpleMutexCreate();
  qword_1EB2AE7C0 = result;
  return result;
}

@end