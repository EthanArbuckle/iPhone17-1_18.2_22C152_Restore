@interface _EXRemoteViewController
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation _EXRemoteViewController

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v3 = a3;
  v4 = _EXDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[_EXRemoteViewController viewServiceDidTerminateWithError:]((uint64_t)v3, v4);
  }
}

- (void)viewServiceDidTerminateWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2156DD000, a2, OS_LOG_TYPE_ERROR, "VS terminated with error: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end