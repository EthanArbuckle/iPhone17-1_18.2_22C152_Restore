@interface HAPNotification
+ (id)typeToString:(unint64_t)a3;
+ (void)postNotification:(id)a3 object:(id)a4 userInfo:(id)a5;
@end

@implementation HAPNotification

+ (id)typeToString:(unint64_t)a3
{
  if (a3 - 1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown Reachability Notification type %ld", a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E69F0270[a3 - 1];
  }

  return v3;
}

+ (void)postNotification:(id)a3 object:(id)a4 userInfo:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)MEMORY[0x1D944E080]();
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = HMFGetLogIdentifier();
    int v14 = 138544130;
    v15 = v12;
    __int16 v16 = 2112;
    id v17 = v7;
    __int16 v18 = 2112;
    id v19 = v8;
    __int16 v20 = 2112;
    id v21 = v9;
    _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_INFO, "%{public}@CoreHAP - Sending notification %@ with object %@ and userInfo %@", (uint8_t *)&v14, 0x2Au);
  }
  v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v13 postNotificationName:v7 object:v8 userInfo:v9];
}

@end