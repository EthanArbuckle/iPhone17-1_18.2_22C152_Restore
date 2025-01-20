@interface NSString(CRLAdditions)
@end

@implementation NSString(CRLAdditions)

- (void)crl_stringByUniquingPathInsideDirectory:()CRLAdditions withFormat:.cold.1(void *a1)
{
  id v2 = a1;
  v3 = [(id)OUTLINED_FUNCTION_5() packedBacktraceString];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_0, v4, v5, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", v6, v7, v8, v9, v10);
}

- (void)crl_stringByUniquingPathInsideDirectory:()CRLAdditions withFormat:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_0, v0, v1, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", v2, v3, v4, v5, v6);
}

- (void)crl_stringByRemovingCharactersInSet:()CRLAdditions options:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_0, v0, v1, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", v2, v3, v4, v5, v6);
}

+ (void)crl_stringWithItemProviderData:()CRLAdditions typeIdentifier:error:.cold.2(uint64_t a1, int a2)
{
  v4[0] = 67110146;
  v4[1] = a2;
  __int16 v5 = 2082;
  OUTLINED_FUNCTION_6();
  uint8_t v6 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSString_CRLAdditions.m";
  __int16 v7 = 1024;
  int v8 = 1331;
  __int16 v9 = 2112;
  uint64_t v10 = v2;
  _os_log_error_impl(&dword_0, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Unable to make a string out of data with UTI %@", (uint8_t *)v4, 0x2Cu);
}

@end