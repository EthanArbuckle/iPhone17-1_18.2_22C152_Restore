@interface ASDStreamFormat(ASDTHelpers)
- (id)asdtEquivalentNativeFloatPacked;
- (void)asdtEquivalentNativeFloatPacked;
@end

@implementation ASDStreamFormat(ASDTHelpers)

- (id)asdtEquivalentNativeFloatPacked
{
  uint64_t v4 = 0;
  memset(v3, 0, sizeof(v3));
  objc_msgSend(a1, "audioStreamBasicDescription", 0);
  v1 = ASDTBaseLogType();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    [(ASDStreamFormat(ASDTHelpers) *)(int *)v3 + 2 asdtEquivalentNativeFloatPacked];
  }

  return 0;
}

- (void)asdtEquivalentNativeFloatPacked
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int v2 = *a1;
  int v3 = HIBYTE(*a1);
  if ((*a1 - 0x20000000) >> 24 >= 0x5F) {
    int v3 = 32;
  }
  int v4 = BYTE2(v2);
  if (BYTE2(v2) - 32 >= 0x5F) {
    int v4 = 32;
  }
  int v5 = BYTE1(v2);
  if (BYTE1(v2) - 32 >= 0x5F) {
    int v5 = 32;
  }
  int v6 = *a1;
  v7[0] = 67109888;
  v7[1] = v3;
  __int16 v8 = 1024;
  int v9 = v4;
  __int16 v10 = 1024;
  int v11 = v5;
  if ((v6 - 32) >= 0x5F) {
    int v6 = 32;
  }
  __int16 v12 = 1024;
  int v13 = v6;
  _os_log_error_impl(&dword_2489BC000, a2, OS_LOG_TYPE_ERROR, "Cannot convert format with ID: %c%c%c%c", (uint8_t *)v7, 0x1Au);
}

@end