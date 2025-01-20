@interface HMDUserNotificationCenter
+ (id)logCategory;
- (HMDUserNotificationCenter)initWithBundleIdentifier:(id)a3 logEventSubmitter:(id)a4;
- (HMDUserNotificationCenterDelegate)delegate;
- (HMMLogEventSubmitting)logEventSubmitter;
- (UNUserNotificationCenter)userNotificationCenter;
- (id)configureWithNotificationCategories:(id)a3;
- (id)showNotificationWithTitle:(id)a3 body:(id)a4 threadIdentifier:(id)a5 categoryIdentifier:(id)a6 requestIdentifier:(id)a7 date:(id)a8 attachments:(id)a9 userInfo:(id)a10 shouldIgnoreDoNotDisturb:(BOOL)a11 interruptionLevel:(unint64_t)a12 logEventTopic:(int64_t)a13;
- (void)_showNotification:(id)a3;
- (void)fetchAreUserNotificationsEnabledWithCompletion:(id)a3;
- (void)notificationSettingsWithCompletionHandler:(id)a3;
- (void)removeNotificationRequestsWithIdentifiers:(id)a3;
- (void)setBadgeNumber:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)updateContent:(id)a3 forNotificationWithRequestIdentifier:(id)a4;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation HMDUserNotificationCenter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_userNotificationCenter, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return (HMMLogEventSubmitting *)objc_getProperty(self, a2, 24, 1);
}

- (UNUserNotificationCenter)userNotificationCenter
{
  return (UNUserNotificationCenter *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMDUserNotificationCenterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDUserNotificationCenterDelegate *)WeakRetained;
}

- (void)notificationSettingsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(HMDUserNotificationCenter *)self userNotificationCenter];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__HMDUserNotificationCenter_notificationSettingsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6A16EE0;
  id v8 = v4;
  id v6 = v4;
  [v5 getNotificationSettingsWithCompletionHandler:v7];
}

uint64_t __71__HMDUserNotificationCenter_notificationSettingsWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(HMDUserNotificationCenter *)self delegate];
  [v9 notificationCenter:self didReceiveNotificationResponse:v8 withCompletionHandler:v7];
}

- (void)_showNotification:(id)a3
{
  id v4 = a3;
  v5 = [(HMDUserNotificationCenter *)self userNotificationCenter];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__HMDUserNotificationCenter__showNotification___block_invoke;
  v7[3] = &unk_1E6A197F0;
  id v8 = v4;
  id v6 = v4;
  [v5 addNotificationRequest:v6 withCompletionHandler:v7];
}

void __47__HMDUserNotificationCenter__showNotification___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = HMFGetLogIdentifier();
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543874;
      id v9 = v6;
      __int16 v10 = 2112;
      id v11 = v3;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_ERROR, "%{public}@Error adding notification request. Error: %@. Request: %@.", (uint8_t *)&v8, 0x20u);
    }
  }
}

- (void)fetchAreUserNotificationsEnabledWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(HMDUserNotificationCenter *)self userNotificationCenter];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__HMDUserNotificationCenter_fetchAreUserNotificationsEnabledWithCompletion___block_invoke;
  v7[3] = &unk_1E6A16EE0;
  id v8 = v4;
  id v6 = v4;
  [v5 getNotificationSettingsWithCompletionHandler:v7];
}

uint64_t __76__HMDUserNotificationCenter_fetchAreUserNotificationsEnabledWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = (unint64_t)[a2 authorizationStatus] > 1;
  id v4 = *(uint64_t (**)(uint64_t, BOOL))(*(void *)(a1 + 32) + 16);
  uint64_t v5 = *(void *)(a1 + 32);
  return v4(v5, v3);
}

- (void)removeNotificationRequestsWithIdentifiers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDUserNotificationCenter *)self userNotificationCenter];
  [v5 removePendingNotificationRequestsWithIdentifiers:v4];

  id v6 = [(HMDUserNotificationCenter *)self userNotificationCenter];
  [v6 removeDeliveredNotificationsWithIdentifiers:v4];
}

- (id)showNotificationWithTitle:(id)a3 body:(id)a4 threadIdentifier:(id)a5 categoryIdentifier:(id)a6 requestIdentifier:(id)a7 date:(id)a8 attachments:(id)a9 userInfo:(id)a10 shouldIgnoreDoNotDisturb:(BOOL)a11 interruptionLevel:(unint64_t)a12 logEventTopic:(int64_t)a13
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = a8;
  id v24 = a9;
  id v25 = a10;
  id v26 = objc_alloc_init(MEMORY[0x1E4F445B0]);
  v46 = v18;
  [v26 setTitle:v18];
  v45 = v19;
  [v26 setBody:v19];
  v27 = [MEMORY[0x1E4F44640] defaultSound];
  [v26 setSound:v27];

  v43 = v23;
  [v26 setDate:v23];
  if (v20) {
    [v26 setThreadIdentifier:v20];
  }
  if (_os_feature_enabled_impl())
  {
    v28 = [v25 objectForKey:@"home"];
    if (v28)
    {
      v29 = +[HMDBulletinBoard sharedBulletinBoard];
      [v29 threadIdentifierForNotificationGroupWithHomeContextID:v28];
      v31 = id v30 = v22;

      [v26 setThreadIdentifier:v31];
      id v20 = (id)v31;
      id v22 = v30;
    }
  }
  if (v21) {
    [v26 setCategoryIdentifier:v21];
  }
  if (v25) {
    [v26 setUserInfo:v25];
  }
  [v26 setShouldIgnoreDoNotDisturb:a11];
  if (v24) {
    [v26 setAttachments:v24];
  }
  v44 = v21;
  if (_os_feature_enabled_impl())
  {
    [v26 setInterruptionLevel:a12];
    if (a12 == 3)
    {
      v32 = [MEMORY[0x1E4F44640] defaultCriticalSound];
      [v26 setSound:v32];
    }
  }
  v33 = v22;
  v34 = [MEMORY[0x1E4F44628] requestWithIdentifier:v22 content:v26 trigger:0];
  v35 = (void *)MEMORY[0x1D9452090]();
  v36 = self;
  v37 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    v38 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v48 = v38;
    __int16 v49 = 2112;
    v50 = v34;
    _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_INFO, "%{public}@Adding bulletin: %@", buf, 0x16u);
  }
  [(HMDUserNotificationCenter *)v36 _showNotification:v34];
  v39 = [(HMDUserNotificationCenter *)v36 logEventSubmitter];
  v40 = [[HMDBulletinNotificationLogEvent alloc] initWithTopic:a13];
  [v39 submitLogEvent:v40];

  return v34;
}

- (void)updateContent:(id)a3 forNotificationWithRequestIdentifier:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  __int16 v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v17 = v11;
    __int16 v18 = 2112;
    id v19 = v7;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating notification with request identifier %@ with content: %@", buf, 0x20u);
  }
  __int16 v12 = [(HMDUserNotificationCenter *)v9 userNotificationCenter];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __80__HMDUserNotificationCenter_updateContent_forNotificationWithRequestIdentifier___block_invoke;
  v14[3] = &unk_1E6A196E0;
  v14[4] = v9;
  id v15 = v7;
  id v13 = v7;
  [v12 replaceContentForRequestWithIdentifier:v13 replacementContent:v6 completionHandler:v14];
}

void __80__HMDUserNotificationCenter_updateContent_forNotificationWithRequestIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 138543874;
      __int16 v10 = v7;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v3;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to update notification with request identifier %@: %@", (uint8_t *)&v9, 0x20u);
    }
  }
}

- (void)setBadgeNumber:(int64_t)a3
{
  id v4 = [(HMDUserNotificationCenter *)self userNotificationCenter];
  [v4 setBadgeCount:a3 withCompletionHandler:0];
}

- (id)configureWithNotificationCategories:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDUserNotificationCenter *)self userNotificationCenter];
  [v5 setNotificationCategories:v4];

  id v6 = [(HMDUserNotificationCenter *)self userNotificationCenter];
  [v6 setWantsNotificationResponsesDelivered];

  id v7 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
  uint64_t v8 = [(HMDUserNotificationCenter *)self userNotificationCenter];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__HMDUserNotificationCenter_configureWithNotificationCategories___block_invoke;
  v13[3] = &unk_1E6A16EB8;
  v13[4] = self;
  uint64_t v15 = 64;
  id v9 = v7;
  id v14 = v9;
  [v8 requestAuthorizationWithOptions:64 completionHandler:v13];

  __int16 v10 = v14;
  id v11 = v9;

  return v11;
}

void __65__HMDUserNotificationCenter_configureWithNotificationCategories___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = HMFGetOSLogHandle();
  id v9 = v8;
  if (a2)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      __int16 v10 = HMFGetLogIdentifier();
      uint64_t v11 = *(void *)(a1 + 48);
      int v17 = 138543618;
      __int16 v18 = v10;
      __int16 v19 = 2048;
      uint64_t v20 = v11;
      uint64_t v12 = "%{public}@Authorization request with options: %lu was granted.";
      __int16 v13 = v9;
      os_log_type_t v14 = OS_LOG_TYPE_INFO;
      uint32_t v15 = 22;
LABEL_6:
      _os_log_impl(&dword_1D49D5000, v13, v14, v12, (uint8_t *)&v17, v15);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    __int16 v10 = HMFGetLogIdentifier();
    uint64_t v16 = *(void *)(a1 + 48);
    int v17 = 138543874;
    __int16 v18 = v10;
    __int16 v19 = 2048;
    uint64_t v20 = v16;
    __int16 v21 = 2112;
    id v22 = v5;
    uint64_t v12 = "%{public}@Authorization request with options: %lu was not granted with error:%@.";
    __int16 v13 = v9;
    os_log_type_t v14 = OS_LOG_TYPE_ERROR;
    uint32_t v15 = 32;
    goto LABEL_6;
  }

  [*(id *)(a1 + 40) finishWithNoResult];
}

- (HMDUserNotificationCenter)initWithBundleIdentifier:(id)a3 logEventSubmitter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDUserNotificationCenter;
  uint64_t v8 = [(HMDUserNotificationCenter *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F44680]) initWithBundleIdentifier:v6];
    userNotificationCenter = v8->_userNotificationCenter;
    v8->_userNotificationCenter = (UNUserNotificationCenter *)v9;

    [(UNUserNotificationCenter *)v8->_userNotificationCenter setDelegate:v8];
    objc_storeStrong((id *)&v8->_logEventSubmitter, a4);
  }

  return v8;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6_173178 != -1) {
    dispatch_once(&logCategory__hmf_once_t6_173178, &__block_literal_global_173179);
  }
  v2 = (void *)logCategory__hmf_once_v7_173180;
  return v2;
}

uint64_t __40__HMDUserNotificationCenter_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v7_173180;
  logCategory__hmf_once_v7_173180 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end