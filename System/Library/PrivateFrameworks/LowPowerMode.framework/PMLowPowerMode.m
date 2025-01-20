@interface PMLowPowerMode
@end

@implementation PMLowPowerMode

uint64_t __33___PMLowPowerMode_sharedInstance__block_invoke()
{
  sharedInstance_saver = objc_alloc_init(_PMLowPowerMode);
  return MEMORY[0x270F9A758]();
}

uint64_t __69___PMLowPowerMode_setPowerMode_fromSource_withParams_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __54___PMLowPowerMode_setPowerMode_fromSource_withParams___block_invoke(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  NSLog(&cfstr_SynchronousCon.isa, a2);
}

void __54___PMLowPowerMode_setPowerMode_fromSource_withParams___block_invoke_2(uint64_t a1, char a2, uint64_t a3)
{
  if (a3 || (a2 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    NSLog(&cfstr_SetpowermodeFa.isa, a3);
  }
}

@end