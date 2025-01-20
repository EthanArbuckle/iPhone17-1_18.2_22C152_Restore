@interface CAPackage(ControlCenterUIKit)
+ (id)ccuiPackageFromDescription:()ControlCenterUIKit;
@end

@implementation CAPackage(ControlCenterUIKit)

+ (id)ccuiPackageFromDescription:()ControlCenterUIKit
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E4F39C38];
  v5 = [v3 packageURL];
  uint64_t v6 = *MEMORY[0x1E4F3A4C0];
  id v11 = 0;
  v7 = [v4 packageWithContentsOfURL:v5 type:v6 options:0 error:&v11];
  id v8 = v11;

  if (v8)
  {
    v9 = (void *)CCUILogUserInterface;
    if (os_log_type_enabled((os_log_t)CCUILogUserInterface, OS_LOG_TYPE_ERROR)) {
      +[CAPackage(ControlCenterUIKit) ccuiPackageFromDescription:(uint64_t)v8];
    }
  }

  return v7;
}

+ (void)ccuiPackageFromDescription:()ControlCenterUIKit .cold.1(void *a1, void *a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v5 = a1;
  uint64_t v6 = [a2 packageURL];
  int v7 = 138543618;
  id v8 = v6;
  __int16 v9 = 2114;
  uint64_t v10 = a3;
  _os_log_error_impl(&dword_1D834A000, v5, OS_LOG_TYPE_ERROR, "Cannot load CAPackage from %{public}@: %{public}@", (uint8_t *)&v7, 0x16u);
}

@end