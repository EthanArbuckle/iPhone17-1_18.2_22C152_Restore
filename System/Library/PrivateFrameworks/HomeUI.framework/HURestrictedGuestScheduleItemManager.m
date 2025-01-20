@interface HURestrictedGuestScheduleItemManager
- (HFSchedule)inviteUserSchedule;
- (HMHome)overrideHome;
- (HMUser)user;
- (HURestrictedGuestScheduleItemManager)initWithHome:(id)a3 user:(id)a4 delegate:(id)a5;
- (HURestrictedGuestScheduleItemManager)initWithSchedule:(id)a3 delegate:(id)a4;
- (id)_buildItemModulesForHome:(id)a3;
- (unint64_t)scheduleContext;
@end

@implementation HURestrictedGuestScheduleItemManager

- (HURestrictedGuestScheduleItemManager)initWithHome:(id)a3 user:(id)a4 delegate:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"HURestrictedGuestScheduleItemManager.m", 28, @"Invalid parameter not satisfying: %@", @"home" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"HURestrictedGuestScheduleItemManager.m", 29, @"Invalid parameter not satisfying: %@", @"user" object file lineNumber description];

LABEL_3:
  if ((objc_msgSend(v10, "hf_userIsRestrictedGuest:", v11) & 1) == 0)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"HURestrictedGuestScheduleItemManager.m", 30, @"Invalid parameter not satisfying: %@", @"[home hf_userIsRestrictedGuest:user]" object file lineNumber description];
  }
  v19.receiver = self;
  v19.super_class = (Class)HURestrictedGuestScheduleItemManager;
  v13 = [(HFItemManager *)&v19 initWithDelegate:v12 sourceItem:0];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_overrideHome, a3);
    objc_storeStrong((id *)&v14->_user, a4);
    v14->_scheduleContext = 0;
  }

  return v14;
}

- (HURestrictedGuestScheduleItemManager)initWithSchedule:(id)a3 delegate:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HURestrictedGuestScheduleItemManager.m", 42, @"Invalid parameter not satisfying: %@", @"schedule" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)HURestrictedGuestScheduleItemManager;
  id v10 = [(HFItemManager *)&v14 initWithDelegate:v9 sourceItem:0];
  id v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_inviteUserSchedule, a3);
    v11->_scheduleContext = 1;
  }

  return v11;
}

- (id)_buildItemModulesForHome:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (![(HURestrictedGuestScheduleItemManager *)self scheduleContext])
  {
    id v12 = [(HURestrictedGuestScheduleItemManager *)self overrideHome];
    v13 = [(HURestrictedGuestScheduleItemManager *)self user];
    id v8 = [v12 homeAccessControlForUser:v13];

    objc_super v14 = [v8 restrictedGuestAccessSettings];
    v15 = [v14 guestAccessSchedule];
    v7 = [MEMORY[0x1E4F694A8] scheduleBuilderFromHomeAccessSchedule:v15];
    v16 = HFLogForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = NSStringFromSelector(a2);
      v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HURestrictedGuestScheduleItemManager scheduleContext](self, "scheduleContext"));
      *(_DWORD *)buf = 138413314;
      v24 = self;
      __int16 v25 = 2112;
      v26 = v17;
      __int16 v27 = 2112;
      v28 = v7;
      __int16 v29 = 2112;
      v30 = v15;
      __int16 v31 = 2112;
      v32 = v18;
      _os_log_impl(&dword_1BE345000, v16, OS_LOG_TYPE_DEFAULT, "%@:%@ Constructed new schedule builder [%@] from guest access schedule [%@] with context [%@].", buf, 0x34u);
    }
    goto LABEL_8;
  }
  if ([(HURestrictedGuestScheduleItemManager *)self scheduleContext] == 1)
  {
    v5 = (void *)MEMORY[0x1E4F694A8];
    v6 = [(HURestrictedGuestScheduleItemManager *)self inviteUserSchedule];
    v7 = [v5 scheduleBuilderFromSchedule:v6];

    id v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = NSStringFromSelector(a2);
      id v10 = [(HURestrictedGuestScheduleItemManager *)self inviteUserSchedule];
      id v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HURestrictedGuestScheduleItemManager scheduleContext](self, "scheduleContext"));
      *(_DWORD *)buf = 138413314;
      v24 = self;
      __int16 v25 = 2112;
      v26 = v9;
      __int16 v27 = 2112;
      v28 = v7;
      __int16 v29 = 2112;
      v30 = v10;
      __int16 v31 = 2112;
      v32 = v11;
      _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%@:%@ Constructed new schedule builder [%@] from home schedule [%@] with context [%@].", buf, 0x34u);
    }
LABEL_8:

    goto LABEL_10;
  }
  v7 = 0;
LABEL_10:
  objc_super v19 = [[HUScheduleEditorItemModule alloc] initWithItemUpdater:self scheduleBuilder:v7];
  v22 = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];

  return v20;
}

- (unint64_t)scheduleContext
{
  return self->_scheduleContext;
}

- (HMHome)overrideHome
{
  return self->_overrideHome;
}

- (HMUser)user
{
  return self->_user;
}

- (HFSchedule)inviteUserSchedule
{
  return self->_inviteUserSchedule;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inviteUserSchedule, 0);
  objc_storeStrong((id *)&self->_user, 0);

  objc_storeStrong((id *)&self->_overrideHome, 0);
}

@end