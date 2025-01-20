@interface FigSandboxServerXPC
@end

@implementation FigSandboxServerXPC

void __FigSandboxServerXPC_RemoveAssertionForPID_block_invoke(uint64_t a1)
{
}

void __FigSandboxServerXPC_AddAssertionForPID_block_invoke(uint64_t a1)
{
  v1 = (const void *)*(int *)(a1 + 40);
  MEMORY[0x192FC3C00](gFigSandboxServerXPC_2, v1);
  v2 = (__CFBag *)gFigSandboxServerXPC_2;

  CFBagAddValue(v2, v1);
}

@end