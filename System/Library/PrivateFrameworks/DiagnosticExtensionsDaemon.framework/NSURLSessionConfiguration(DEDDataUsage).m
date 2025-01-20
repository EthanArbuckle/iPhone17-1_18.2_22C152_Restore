@interface NSURLSessionConfiguration(DEDDataUsage)
- (void)setUpDataUsageWithConfiguration:()DEDDataUsage;
@end

@implementation NSURLSessionConfiguration(DEDDataUsage)

- (void)setUpDataUsageWithConfiguration:()DEDDataUsage
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = +[DEDConfiguration sharedInstance];
  v6 = [v5 identifier];

  uint64_t v7 = [v4 finishingMove];
  if (v7 == 1)
  {
    v8 = @"com.apple.appleseed.FeedbackAssistant";
    goto LABEL_6;
  }
  if (v7 != 2)
  {
    v9 = +[DEDUtils sharedLog];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[NSURLSessionConfiguration(DEDDataUsage) setUpDataUsageWithConfiguration:](v4, v9);
    }

LABEL_10:
    if (!v6) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (!+[DEDUtils isInternalInstall]) {
    goto LABEL_10;
  }
  v8 = @"com.apple.TapToRadar";
LABEL_6:

  v6 = v8;
LABEL_11:
  objc_msgSend(a1, "set_sourceApplicationBundleIdentifier:", v6);
LABEL_12:
  v10 = +[DEDUtils sharedLog];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412290;
    v12 = v6;
    _os_log_impl(&dword_21FE04000, v10, OS_LOG_TYPE_INFO, "Bundle identifier responsible data usage: [%@]", (uint8_t *)&v11, 0xCu);
  }
}

- (void)setUpDataUsageWithConfiguration:()DEDDataUsage .cold.1(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  unint64_t v3 = [a1 finishingMove];
  if (v3 > 4) {
    id v4 = "Unknown";
  }
  else {
    id v4 = off_26453ADD8[v3];
  }
  int v5 = 136446210;
  v6 = v4;
  _os_log_error_impl(&dword_21FE04000, a2, OS_LOG_TYPE_ERROR, "Cannot configure data attribution for [%{public}s]", (uint8_t *)&v5, 0xCu);
}

@end