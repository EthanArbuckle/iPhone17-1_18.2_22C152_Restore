@interface BBPowerChanged
@end

@implementation BBPowerChanged

void ___BBPowerChanged_block_invoke()
{
  v0 = (void *)MEMORY[0x21D44A020]();
  [(id)__server _handleSystemSleep];
}

void ___BBPowerChanged_block_invoke_2()
{
  v0 = (void *)MEMORY[0x21D44A020]();
  [(id)__server _handleSystemWake];
}

@end