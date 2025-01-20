@interface AMSMediaURLBuilderUtility
+ (id)devicePlatform;
@end

@implementation AMSMediaURLBuilderUtility

+ (id)devicePlatform
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (+[AMSDevice deviceIsAppleTV]
    || +[AMSDevice deviceIsAppleTVSimulator])
  {
    v2 = AMSMediaTaskPlatformAppleTV;
LABEL_7:
    v3 = *v2;
    goto LABEL_8;
  }
  if (+[AMSDevice deviceIsAppleWatch]
    || +[AMSDevice deviceIsAppleWatchSimulator])
  {
    v2 = AMSMediaTaskPlatformAppleWatch;
    goto LABEL_7;
  }
  if (+[AMSDevice deviceIsAudioAccessory])
  {
    v2 = AMSMediaTaskPlatformHomePod;
    goto LABEL_7;
  }
  if (+[AMSDevice deviceIsiPad]
    || +[AMSDevice deviceIsiPadSimulator])
  {
    v2 = AMSMediaTaskPlatformiPad;
    goto LABEL_7;
  }
  if (+[AMSDevice deviceIsiPhone]
    || +[AMSDevice deviceIsiPhoneSimulator]
    || +[AMSDevice deviceIsiPod]
    || +[AMSDevice deviceIsiPodSimulator])
  {
    v2 = AMSMediaTaskPlatformiPhone;
    goto LABEL_7;
  }
  if (+[AMSDevice deviceIsMac])
  {
    v2 = AMSMediaTaskPlatformMac;
    goto LABEL_7;
  }
  if (+[AMSDevice deviceIsRealityDevice]
    || +[AMSDevice deviceIsRealityDeviceSimulator])
  {
    v2 = &AMSMediaTaskPlatformReality;
    goto LABEL_7;
  }
  v5 = +[AMSLogConfig sharedMediaConfig];
  if (!v5)
  {
    v5 = +[AMSLogConfig sharedConfig];
  }
  v6 = v5;
  v7 = [v5 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = objc_opt_class();
    id v9 = v8;
    v10 = AMSLogKey();
    int v11 = 138543618;
    v12 = v8;
    __int16 v13 = 2114;
    v14 = v10;
    _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unknown device platform", (uint8_t *)&v11, 0x16u);
  }
  v3 = 0;
LABEL_8:
  return v3;
}

@end