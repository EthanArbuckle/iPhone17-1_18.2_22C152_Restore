@interface CNErrorFactory(iOSAB)
+ (void)genericiOSABError;
@end

@implementation CNErrorFactory(iOSAB)

+ (void)genericiOSABError
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1909E3000, log, OS_LOG_TYPE_ERROR, "Creating genericiOSABError, backtrace:", v1, 2u);
}

+ (void)errorForiOSABError:()iOSAB .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v5 = 138543618;
  uint64_t v6 = ABLogErrorPtr();
  __int16 v7 = 2114;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_1909E3000, a3, OS_LOG_TYPE_ERROR, "errorForiOSABError:\niOSABError = %{public}@ \nCNError = %{public}@ backtrace:", (uint8_t *)&v5, 0x16u);
}

@end