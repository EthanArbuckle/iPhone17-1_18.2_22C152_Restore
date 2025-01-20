@interface LAAuthenticationBiometricMethodShim
@end

@implementation LAAuthenticationBiometricMethodShim

uint64_t __54___LAAuthenticationBiometricMethodShim_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(_LAAuthenticationBiometricMethodShim);
  uint64_t v1 = sharedInstance_shim;
  sharedInstance_shim = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end