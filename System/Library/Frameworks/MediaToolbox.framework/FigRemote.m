@interface FigRemote
@end

@implementation FigRemote

void __FigRemote_ReleaseAndClearLocalCAContextAndShutDownCAServer_block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 100000000);
  v3 = *(NSObject **)(a1 + 32);

  dispatch_after(v2, v3, &__block_literal_global_69);
}

uint64_t __FigRemote_ReleaseAndClearLocalCAContextAndShutDownCAServer_block_invoke_2()
{
  uint64_t result = FigAtomicDecrement32();
  if ((int)result <= 0)
  {
    JUMPOUT(0x1997073C0);
  }
  return result;
}

@end