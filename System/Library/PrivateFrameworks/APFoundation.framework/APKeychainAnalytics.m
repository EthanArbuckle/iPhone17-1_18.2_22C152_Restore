@interface APKeychainAnalytics
+ (void)sendKeychainAnalytics:(int)a3 keyName:(id)a4 readCount:(int64_t)a5 writeCount:(int64_t)a6 bundleID:(id)a7;
@end

@implementation APKeychainAnalytics

+ (void)sendKeychainAnalytics:(int)a3 keyName:(id)a4 readCount:(int64_t)a5 writeCount:(int64_t)a6 bundleID:(id)a7
{
  uint64_t v10 = *(void *)&a3;
  v24[5] = *MEMORY[0x1E4F143B8];
  v11 = NSString;
  v12 = (__CFString *)a7;
  id v13 = a4;
  v14 = objc_msgSend(v11, "stringWithFormat:", @"%d", v10);
  v15 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", a5);
  uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", a6);
  v17 = (void *)v16;
  v23[0] = @"keyName";
  v23[1] = @"errorCode";
  v24[0] = v13;
  v24[1] = v14;
  v23[2] = @"bundleIdentifier";
  v23[3] = @"readCount";
  v18 = @"unknown";
  if (v12) {
    v18 = v12;
  }
  v24[2] = v18;
  v24[3] = v15;
  v23[4] = @"writeCount";
  v24[4] = v16;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:5];
  +[APAnalytics sendEvent:@"keychain" customPayload:v19];

  v20 = APLogForCategory(0x15uLL);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67240192;
    int v22 = v10;
    _os_log_impl(&dword_1D70B2000, v20, OS_LOG_TYPE_INFO, "Analytics keychain event status %{public}d", buf, 8u);
  }
}

@end