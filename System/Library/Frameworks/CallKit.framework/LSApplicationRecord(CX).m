@interface LSApplicationRecord(CX)
+ (id)cx_applicationRecordForBundleIdentifier:()CX;
+ (id)cx_applicationRecordForConnection:()CX;
- (BOOL)containsBackgroundModeOptions:()CX;
- (uint64_t)cx_backgroundModeOptions;
@end

@implementation LSApplicationRecord(CX)

+ (id)cx_applicationRecordForBundleIdentifier:()CX
{
  id v3 = a3;
  id v8 = 0;
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v3 allowPlaceholder:1 error:&v8];
  id v5 = v8;
  if (!v4)
  {
    v6 = CXDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[LSApplicationRecord(CX) cx_applicationRecordForBundleIdentifier:v6];
    }
  }

  return v4;
}

+ (id)cx_applicationRecordForConnection:()CX
{
  id v4 = a3;
  id v5 = objc_msgSend(v4, "cx_bundleIdentifier");
  if ([v5 length])
  {
    v6 = objc_msgSend(a1, "cx_applicationRecordForBundleIdentifier:", v5);
  }
  else
  {
    v7 = CXDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[LSApplicationRecord(CX) cx_applicationRecordForConnection:]((uint64_t)v4, v7);
    }

    v6 = 0;
  }

  return v6;
}

- (uint64_t)cx_backgroundModeOptions
{
  uint64_t HasBackgroundMode = _cx_LSAppRecordHasBackgroundMode(a1, @"voip");
  if (_cx_LSAppRecordHasBackgroundMode(a1, @"push-to-talk")) {
    return HasBackgroundMode | 2;
  }
  else {
    return HasBackgroundMode;
  }
}

- (BOOL)containsBackgroundModeOptions:()CX
{
  uint64_t v4 = objc_msgSend(a1, "cx_backgroundModeOptions");
  if (a3) {
    return (a3 & ~v4) == 0;
  }
  else {
    return v4 == 0;
  }
}

+ (void)cx_applicationRecordForBundleIdentifier:()CX .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1A6E3A000, log, OS_LOG_TYPE_ERROR, "Attempt to retrieve application record for bundle identifier %@ failed with error: %@", (uint8_t *)&v3, 0x16u);
}

+ (void)cx_applicationRecordForConnection:()CX .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A6E3A000, a2, OS_LOG_TYPE_ERROR, "Could not obtain bundle identifier from connection %@", (uint8_t *)&v2, 0xCu);
}

@end