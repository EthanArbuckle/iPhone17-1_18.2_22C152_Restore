@interface CRKInstructorExtensionOptimizerShim
- (void)beginRequestWithExtensionContext:(id)a3;
- (void)didAcceptAdminTransport:(id)a3;
@end

@implementation CRKInstructorExtensionOptimizerShim

- (void)didAcceptAdminTransport:(id)a3
{
  id v3 = a3;
  v4 = _CRKLogGeneral_3();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[CRKInstructorExtensionOptimizerShim didAcceptAdminTransport:]((uint64_t)v3, v4);
  }
}

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v3 = a3;
  v4 = _CRKLogGeneral_3();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[CRKInstructorExtensionOptimizerShim beginRequestWithExtensionContext:]((uint64_t)v3, v4);
  }
}

- (void)didAcceptAdminTransport:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_224C00000, a2, OS_LOG_TYPE_ERROR, "(SHOULD NOT BE CALLED) CRKInstructorExtensionOptimizerShim didAcceptAdminTransport: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)beginRequestWithExtensionContext:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_224C00000, a2, OS_LOG_TYPE_ERROR, "(SHOULD NOT BE CALLED) CRKInstructorExtensionOptimizerShim beginRequestWithExtensionContext: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end