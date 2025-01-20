@interface AGXPrincipalDevice
- (AGXPrincipalDevice)initWithAcceleratorPort:(unsigned int)a3;
@end

@implementation AGXPrincipalDevice

- (AGXPrincipalDevice)initWithAcceleratorPort:(unsigned int)a3
{
  fwrite("Attempting to load Metal bundle via AGXPrincipalDevice is not supported!\n", 0x49uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_2427AD000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGX: Attempting to load Metal bundle via AGXPrincipalDevice is not supported!\n", buf, 2u);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2427AD000, &_os_log_internal, OS_LOG_TYPE_INFO, "AGX: Attempting to load Metal bundle via AGXPrincipalDevice is not supported!\n", v4, 2u);
  }
  return 0;
}

@end