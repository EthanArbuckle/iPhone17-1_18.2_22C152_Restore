@interface HMDMetricsPreferencesDebugManager
- (HMDMetricsPreferencesDebugManager)initWithDataSource:(id)a3;
- (HMMLogEventSubmitting)logEventSubmitter;
- (void)runDailyTask;
- (void)submitPreferencesSizeLogEventsForApplicationID:(id)a3 submissionTrigger:(unint64_t)a4;
@end

@implementation HMDMetricsPreferencesDebugManager

- (void).cxx_destruct
{
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return self->_logEventSubmitter;
}

- (void)runDailyTask
{
}

- (void)submitPreferencesSizeLogEventsForApplicationID:(id)a3 submissionTrigger:(unint64_t)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  v6 = (__CFString *)a3;
  if (isInternalBuild())
  {
    CFStringRef v7 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
    CFStringRef v8 = (const __CFString *)*MEMORY[0x1E4F1D3E0];
    CFArrayRef v9 = CFPreferencesCopyKeyList(v6, (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    CFArrayRef obj = v9;
    uint64_t v26 = [(__CFArray *)obj countByEnumeratingWithState:&v30 objects:v42 count:16];
    if (v26)
    {
      uint64_t v25 = *(void *)v31;
      CFStringRef v23 = v8;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v31 != v25) {
            objc_enumerationMutation(obj);
          }
          CFStringRef v11 = *(const __CFString **)(*((void *)&v30 + 1) + 8 * i);
          context = (void *)MEMORY[0x1D9452090]();
          CFStringRef v12 = (const __CFString *)CFPreferencesCopyValue(v11, v6, v7, v8);
          CFTypeRef cf = 0;
          uint64_t v28 = _approximateSizeOfPlistValue(v12, &cf, 0);
          if (v12) {
            CFRelease(v12);
          }
          v13 = (void *)MEMORY[0x1D9452090]();
          v14 = self;
          v15 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            CFStringRef v16 = v7;
            v17 = v6;
            v18 = self;
            v20 = unint64_t v19 = a4;
            *(_DWORD *)buf = 138544130;
            v35 = v20;
            __int16 v36 = 2114;
            CFStringRef v37 = v11;
            __int16 v38 = 2048;
            uint64_t v39 = v28;
            __int16 v40 = 2112;
            CFTypeRef v41 = cf;
            _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Preferences Key: %{public}@ Size of value: %ld Description: %@", buf, 0x2Au);

            a4 = v19;
            self = v18;
            v6 = v17;
            CFStringRef v7 = v16;
            CFStringRef v8 = v23;
          }

          if (cf) {
            CFRelease(cf);
          }
          v21 = [[HMDPreferencesSizeLogEvent alloc] initWithApplicationID:v6 preferencesKey:v11 preferencesSize:v28 eventTrigger:a4];
          v22 = [(HMDMetricsPreferencesDebugManager *)v14 logEventSubmitter];
          [v22 submitLogEvent:v21];
        }
        uint64_t v26 = [(__CFArray *)obj countByEnumeratingWithState:&v30 objects:v42 count:16];
      }
      while (v26);
    }
  }
}

- (HMDMetricsPreferencesDebugManager)initWithDataSource:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMDMetricsPreferencesDebugManager;
  v5 = [(HMDMetricsPreferencesDebugManager *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 logEventSubmitter];
    logEventSubmitter = v5->_logEventSubmitter;
    v5->_logEventSubmitter = (HMMLogEventSubmitting *)v6;

    CFStringRef v8 = [v4 dailyScheduler];
    [v8 registerDailyTaskRunner:v5];
  }
  return v5;
}

@end