@interface HFUserNotificationServiceSettings
+ (id)combinedConditionForBulletinBoardNotifications:(id)a3;
- (BOOL)areDoorbellNotificationsEnabled;
- (BOOL)areMotionNotificationsEnabled;
- (BOOL)areNotificationsEnabled;
- (BOOL)areSmartDetectionNotificationsEnabled;
- (HFUserNotificationServiceSettings)initWithBulletinBoardNotifications:(id)a3;
- (HFUserNotificationServiceSettings)initWithNotificationsEnabled:(BOOL)a3 condition:(id)a4 smartCameraNotificationCondition:(id)a5;
- (NSPredicate)notificationCondition;
- (NSPredicate)smartCameraNotificationCondition;
- (id)applySettingsToBulletinBoardNotifications:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)setDoorbellNotificationsEnabled:(BOOL)a3;
- (void)setMotionNotificationsEnabled:(BOOL)a3;
- (void)setNotificationCondition:(id)a3;
- (void)setNotificationsEnabled:(BOOL)a3;
- (void)setSmartCameraNotificationCondition:(id)a3;
- (void)setSmartDetectionNotificationsEnabled:(BOOL)a3;
@end

@implementation HFUserNotificationServiceSettings

- (HFUserNotificationServiceSettings)initWithBulletinBoardNotifications:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 count])
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v34 = v4;
    id obj = v4;
    uint64_t v39 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
    v5 = 0;
    char v6 = 0;
    if (v39)
    {
      uint64_t v38 = *(void *)v41;
      uint64_t v35 = *MEMORY[0x263F0D7A8];
      uint64_t v36 = *MEMORY[0x263F0D6C0];
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v41 != v38) {
            objc_enumerationMutation(obj);
          }
          v8 = *(void **)(*((void *)&v40 + 1) + 8 * v7);
          char v9 = objc_msgSend(v8, "isEnabled", v34);
          objc_opt_class();
          id v10 = v8;
          if (objc_opt_isKindOfClass()) {
            v11 = v10;
          }
          else {
            v11 = 0;
          }
          id v12 = v11;

          if (v12)
          {
            v13 = [v12 cameraUserSettings];
            if ([v13 accessModeForPresenceType:3] == 2)
            {
              BOOL v14 = 1;
            }
            else
            {
              v18 = [v12 cameraUserSettings];
              BOOL v14 = [v18 accessModeForPresenceType:4] == 2;
            }
            v19 = [v12 condition];

            if (v19) {
              BOOL v20 = 1;
            }
            else {
              BOOL v20 = !v14;
            }
            if (v20)
            {
              self->_smartDetectionNotificationsEnabled = [v10 isEnabled];
            }
            else
            {
              v21 = +[HFCameraSignificantEventConfiguration defaultSmartMotionConfiguration];
              v22 = [v21 predicateRepresentation];

              [(HFUserNotificationServiceSettings *)self setSmartCameraNotificationCondition:v22];
              id v44 = v12;
              v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v44 count:1];
              id v24 = [(HFUserNotificationServiceSettings *)self applySettingsToBulletinBoardNotifications:v23];

              self->_smartDetectionNotificationsEnabled = 1;
            }
            uint64_t v25 = [v10 condition];

            v5 = (void *)v25;
          }
          else
          {
            v15 = [v10 service];
            v16 = [v15 serviceType];
            int v17 = [v16 isEqualToString:v36];

            if (v17)
            {
              self->_doorbellNotificationsEnabled = [v10 isEnabled];
            }
            else
            {
              v26 = [v10 service];
              v27 = [v26 serviceType];
              int v28 = [v27 isEqualToString:v35];

              if (v28) {
                self->_motionNotificationsEnabled = [v10 isEnabled];
              }
            }
          }
          v6 |= v9;

          ++v7;
        }
        while (v39 != v7);
        uint64_t v29 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
        uint64_t v39 = v29;
      }
      while (v29);
    }

    v30 = objc_msgSend(obj, "na_filter:", &__block_literal_global_164);
    v31 = [(id)objc_opt_class() combinedConditionForBulletinBoardNotifications:v30];
    self = [(HFUserNotificationServiceSettings *)self initWithNotificationsEnabled:v6 & 1 condition:v31 smartCameraNotificationCondition:v5];

    v32 = self;
    id v4 = v34;
  }
  else
  {
    v32 = 0;
  }

  return v32;
}

BOOL __72__HFUserNotificationServiceSettings_initWithBulletinBoardNotifications___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5 == 0;
}

- (HFUserNotificationServiceSettings)initWithNotificationsEnabled:(BOOL)a3 condition:(id)a4 smartCameraNotificationCondition:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HFUserNotificationServiceSettings;
  v11 = [(HFUserNotificationServiceSettings *)&v14 init];
  id v12 = v11;
  if (v11)
  {
    v11->_notificationsEnabled = a3;
    objc_storeStrong((id *)&v11->_notificationCondition, a4);
    objc_storeStrong((id *)&v12->_smartCameraNotificationCondition, a5);
  }

  return v12;
}

- (id)applySettingsToBulletinBoardNotifications:(id)a3
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __79__HFUserNotificationServiceSettings_applySettingsToBulletinBoardNotifications___block_invoke;
  v7[3] = &unk_2640985F8;
  v7[4] = self;
  id v3 = objc_msgSend(a3, "na_map:", v7);
  id v4 = [MEMORY[0x263F58190] combineAllFutures:v3];
  id v5 = [v4 flatMap:&__block_literal_global_8_7];

  return v5;
}

id __79__HFUserNotificationServiceSettings_applySettingsToBulletinBoardNotifications___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 service];
  id v5 = [v4 serviceType];
  int v6 = [v5 isEqualToString:*MEMORY[0x263F0D6C0]];

  uint64_t v7 = [v3 service];
  v8 = [v7 serviceType];
  int v9 = [v8 isEqualToString:*MEMORY[0x263F0D7A8]];

  objc_opt_class();
  id v10 = v3;
  if (objc_opt_isKindOfClass()) {
    v11 = v10;
  }
  else {
    v11 = 0;
  }
  id v12 = v11;

  v13 = *(void **)(a1 + 32);
  if (v12)
  {
    objc_msgSend(v10, "setEnabled:", objc_msgSend(v13, "areSmartDetectionNotificationsEnabled"));
    uint64_t v14 = [*(id *)(a1 + 32) smartCameraNotificationCondition];
  }
  else
  {
    if (v6)
    {
      uint64_t v15 = [v13 areDoorbellNotificationsEnabled];
    }
    else if (v9)
    {
      uint64_t v15 = [v13 areMotionNotificationsEnabled];
    }
    else
    {
      uint64_t v15 = [v13 areNotificationsEnabled];
    }
    [v10 setEnabled:v15];
    uint64_t v14 = [*(id *)(a1 + 32) notificationCondition];
  }
  v16 = (void *)v14;
  [v10 setCondition:v14];

  int v17 = (void *)MEMORY[0x263F58190];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __79__HFUserNotificationServiceSettings_applySettingsToBulletinBoardNotifications___block_invoke_2;
  v21[3] = &unk_26408CD50;
  id v22 = v10;
  id v18 = v10;
  v19 = [v17 futureWithErrorOnlyHandlerAdapterBlock:v21];

  return v19;
}

uint64_t __79__HFUserNotificationServiceSettings_applySettingsToBulletinBoardNotifications___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) commitWithCompletionHandler:a2];
}

uint64_t __79__HFUserNotificationServiceSettings_applySettingsToBulletinBoardNotifications___block_invoke_3()
{
  return [MEMORY[0x263F58190] futureWithNoResult];
}

+ (id)combinedConditionForBulletinBoardNotifications:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(v3, "na_filter:", &__block_literal_global_10_8);
  if ((unint64_t)[v4 count] > 1)
  {
    uint64_t v7 = [v4 firstObject];
    v8 = [v7 condition];

    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __84__HFUserNotificationServiceSettings_combinedConditionForBulletinBoardNotifications___block_invoke_2;
    v12[3] = &unk_264098620;
    id v5 = v8;
    id v13 = v5;
    if (objc_msgSend(v4, "na_all:", v12))
    {
      id v6 = v5;
    }
    else
    {
      int v9 = (void *)MEMORY[0x263F08730];
      id v10 = objc_msgSend(v3, "na_map:", &__block_literal_global_14_7);
      id v6 = [v9 orPredicateWithSubpredicates:v10];
    }
  }
  else
  {
    id v5 = [v3 firstObject];
    id v6 = [v5 condition];
  }

  return v6;
}

BOOL __84__HFUserNotificationServiceSettings_combinedConditionForBulletinBoardNotifications___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 condition];
  BOOL v3 = v2 != 0;

  return v3;
}

uint64_t __84__HFUserNotificationServiceSettings_combinedConditionForBulletinBoardNotifications___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  BOOL v3 = [a2 condition];
  id v4 = v2;
  id v5 = v3;
  if (v4 == v5)
  {
    uint64_t v6 = 1;
  }
  else if (v4)
  {
    uint64_t v6 = [v4 isEqual:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t __84__HFUserNotificationServiceSettings_combinedConditionForBulletinBoardNotifications___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 condition];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [HFUserNotificationServiceSettings alloc];
  BOOL v5 = [(HFUserNotificationServiceSettings *)self areNotificationsEnabled];
  uint64_t v6 = [(HFUserNotificationServiceSettings *)self notificationCondition];
  uint64_t v7 = [(HFUserNotificationServiceSettings *)self smartCameraNotificationCondition];
  v8 = [(HFUserNotificationServiceSettings *)v4 initWithNotificationsEnabled:v5 condition:v6 smartCameraNotificationCondition:v7];

  [(HFUserNotificationServiceSettings *)v8 setDoorbellNotificationsEnabled:[(HFUserNotificationServiceSettings *)self areDoorbellNotificationsEnabled]];
  [(HFUserNotificationServiceSettings *)v8 setSmartDetectionNotificationsEnabled:[(HFUserNotificationServiceSettings *)self areSmartDetectionNotificationsEnabled]];
  [(HFUserNotificationServiceSettings *)v8 setMotionNotificationsEnabled:[(HFUserNotificationServiceSettings *)self areMotionNotificationsEnabled]];
  return v8;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [HFMutableUserNotificationServiceSettings alloc];
  BOOL v5 = [(HFUserNotificationServiceSettings *)self areNotificationsEnabled];
  uint64_t v6 = [(HFUserNotificationServiceSettings *)self notificationCondition];
  uint64_t v7 = [(HFUserNotificationServiceSettings *)self smartCameraNotificationCondition];
  v8 = [(HFUserNotificationServiceSettings *)v4 initWithNotificationsEnabled:v5 condition:v6 smartCameraNotificationCondition:v7];

  [(HFUserNotificationServiceSettings *)v8 setDoorbellNotificationsEnabled:[(HFUserNotificationServiceSettings *)self areDoorbellNotificationsEnabled]];
  [(HFUserNotificationServiceSettings *)v8 setSmartDetectionNotificationsEnabled:[(HFUserNotificationServiceSettings *)self areSmartDetectionNotificationsEnabled]];
  [(HFUserNotificationServiceSettings *)v8 setMotionNotificationsEnabled:[(HFUserNotificationServiceSettings *)self areMotionNotificationsEnabled]];
  return v8;
}

- (BOOL)areNotificationsEnabled
{
  return self->_notificationsEnabled;
}

- (void)setNotificationsEnabled:(BOOL)a3
{
  self->_notificationsEnabled = a3;
}

- (BOOL)areDoorbellNotificationsEnabled
{
  return self->_doorbellNotificationsEnabled;
}

- (void)setDoorbellNotificationsEnabled:(BOOL)a3
{
  self->_doorbellNotificationsEnabled = a3;
}

- (BOOL)areMotionNotificationsEnabled
{
  return self->_motionNotificationsEnabled;
}

- (void)setMotionNotificationsEnabled:(BOOL)a3
{
  self->_motionNotificationsEnabled = a3;
}

- (BOOL)areSmartDetectionNotificationsEnabled
{
  return self->_smartDetectionNotificationsEnabled;
}

- (void)setSmartDetectionNotificationsEnabled:(BOOL)a3
{
  self->_smartDetectionNotificationsEnabled = a3;
}

- (NSPredicate)notificationCondition
{
  return self->_notificationCondition;
}

- (void)setNotificationCondition:(id)a3
{
}

- (NSPredicate)smartCameraNotificationCondition
{
  return self->_smartCameraNotificationCondition;
}

- (void)setSmartCameraNotificationCondition:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smartCameraNotificationCondition, 0);
  objc_storeStrong((id *)&self->_notificationCondition, 0);
}

@end