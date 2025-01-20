@interface HURestrictedGuestScheduleItem
- (HFSchedule)schedule;
- (HMHome)home;
- (HMUser)user;
- (HURestrictedGuestScheduleItem)initWithHome:(id)a3 user:(id)a4;
- (HURestrictedGuestScheduleItem)initWithSchedule:(id)a3;
- (id)_subclass_updateWithOptions:(id)a3;
- (void)setSchedule:(id)a3;
@end

@implementation HURestrictedGuestScheduleItem

- (HURestrictedGuestScheduleItem)initWithHome:(id)a3 user:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"HURestrictedGuestScheduleItem.m", 21, @"Invalid parameter not satisfying: %@", @"home" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"HURestrictedGuestScheduleItem.m", 22, @"Invalid parameter not satisfying: %@", @"user" object file lineNumber description];

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)HURestrictedGuestScheduleItem;
  v11 = [(HURestrictedGuestScheduleItem *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_home, a3);
    objc_storeStrong((id *)&v12->_user, a4);
  }

  return v12;
}

- (HURestrictedGuestScheduleItem)initWithSchedule:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HURestrictedGuestScheduleItem.m", 34, @"Invalid parameter not satisfying: %@", @"schedule" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)HURestrictedGuestScheduleItem;
  v7 = [(HURestrictedGuestScheduleItem *)&v11 init];
  id v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_schedule, a3);
  }

  return v8;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = NSStringFromSelector(a2);
    v7 = [(HURestrictedGuestScheduleItem *)self schedule];
    id v8 = [(HURestrictedGuestScheduleItem *)self user];
    id v9 = objc_msgSend(v8, "hf_prettyDescription");
    v10 = [(HURestrictedGuestScheduleItem *)self home];
    *(_DWORD *)buf = 138413314;
    v64 = self;
    __int16 v65 = 2112;
    v66 = v6;
    __int16 v67 = 2112;
    v68 = v7;
    __int16 v69 = 2112;
    v70 = v9;
    __int16 v71 = 2112;
    v72 = v10;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ Attempting to update HURestrictedGuestScheduleItem with schedule [%@], user [%@], home [%@].", buf, 0x34u);
  }
  objc_super v11 = objc_opt_new();
  uint64_t v12 = [(HURestrictedGuestScheduleItem *)self home];
  if (v12)
  {
    v13 = (void *)v12;
    uint64_t v14 = [(HURestrictedGuestScheduleItem *)self user];
    if (v14)
    {
      v15 = (void *)v14;
      objc_super v16 = [(HURestrictedGuestScheduleItem *)self home];
      v17 = [(HURestrictedGuestScheduleItem *)self user];
      int v18 = objc_msgSend(v16, "hf_userIsRestrictedGuest:", v17);

      if (v18)
      {
        v19 = [(HURestrictedGuestScheduleItem *)self home];
        v20 = [(HURestrictedGuestScheduleItem *)self user];
        v21 = [v19 homeAccessControlForUser:v20];

        v22 = [v21 restrictedGuestAccessSettings];
        v23 = (void *)MEMORY[0x1E4F694A8];
        v24 = [v22 guestAccessSchedule];
        v25 = [v23 scheduleBuilderFromHomeAccessSchedule:v24];

        v26 = HFLogForCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v27 = NSStringFromSelector(a2);
          v28 = [v22 guestAccessSchedule];
          *(_DWORD *)buf = 138413058;
          v64 = self;
          __int16 v65 = 2112;
          v66 = v27;
          __int16 v67 = 2112;
          v68 = v25;
          __int16 v69 = 2112;
          v70 = v28;
          _os_log_impl(&dword_1BE345000, v26, OS_LOG_TYPE_DEFAULT, "%@:%@ Constructed schedule builder [%@] from guest access schedule [%@].", buf, 0x2Au);
        }
        v29 = [(HURestrictedGuestScheduleItem *)self home];
        char v30 = objc_msgSend(v29, "hf_currentUserIsRestrictedGuest");

        if (v30)
        {
          v31 = 0;
        }
        else
        {
          v31 = _HULocalizedStringWithDefaultValue(@"HUEditButtonTitle", @"HUEditButtonTitle", 1);
        }
        v38 = (void *)MEMORY[0x1E4F1CAD0];
        v39 = [(HURestrictedGuestScheduleItem *)self home];
        v40 = [(HURestrictedGuestScheduleItem *)self user];
        v41 = objc_msgSend(v38, "setWithObjects:", v39, v40, 0);
        [v11 setObject:v41 forKeyedSubscript:*MEMORY[0x1E4F68908]];

        goto LABEL_18;
      }
    }
    else
    {
    }
  }
  v25 = [(HURestrictedGuestScheduleItem *)self schedule];

  if (v25)
  {
    v32 = (void *)MEMORY[0x1E4F694A8];
    v33 = [(HURestrictedGuestScheduleItem *)self schedule];
    v25 = [v32 scheduleBuilderFromSchedule:v33];

    v34 = HFLogForCategory();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v35 = NSStringFromSelector(a2);
      v36 = [(HURestrictedGuestScheduleItem *)self schedule];
      *(_DWORD *)buf = 138413058;
      v64 = self;
      __int16 v65 = 2112;
      v66 = v35;
      __int16 v67 = 2112;
      v68 = v25;
      __int16 v69 = 2112;
      v70 = v36;
      _os_log_impl(&dword_1BE345000, v34, OS_LOG_TYPE_DEFAULT, "%@:%@ Constructed schedule builder [%@] from schedule [%@].", buf, 0x2Au);
    }
    v37 = [NSNumber numberWithInt:v25 == 0];
    [v11 setObject:v37 forKeyedSubscript:*MEMORY[0x1E4F68B10]];

    v31 = _HULocalizedStringWithDefaultValue(@"HUEditButtonTitle", @"HUEditButtonTitle", 1);
  }
  else
  {
    [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
    v31 = 0;
  }
LABEL_18:
  uint64_t v42 = [v25 estimatedScheduleType];
  v43 = [MEMORY[0x1E4F694D8] localizedStringFromScheduleType:v42];
  v44 = @"Home.Users.Guests.Access.Schedule";
  if (v42 == 2)
  {
    v50 = [v25 rules];
    unint64_t v51 = [v50 count];

    if (v51 < 2)
    {
      v54 = (void *)MEMORY[0x1E4F694D8];
      v55 = [v25 rules];
      v56 = [v55 anyObject];
      uint64_t v49 = [v54 localizedMainStringForRule:v56];

      v57 = (void *)MEMORY[0x1E4F694D8];
      v43 = [v25 rules];
      v58 = [v43 anyObject];
      v52 = [v57 localizedDetailedStringForRule:v58];

      v53 = @"%@.CustomSingle";
    }
    else
    {
      uint64_t v49 = HFLocalizedString();
      v52 = 0;
      v53 = @"%@.CustomMultipleTimes";
    }
  }
  else
  {
    if (v42 != 1)
    {
      v52 = 0;
      goto LABEL_29;
    }
    v45 = [v25 rules];
    if ((unint64_t)[v45 count] > 1)
    {
      uint64_t v49 = HFLocalizedString();
    }
    else
    {
      v46 = (void *)MEMORY[0x1E4F694D8];
      v47 = [v25 rules];
      v48 = [v47 anyObject];
      uint64_t v49 = [v46 localizedMainStringForRule:v48];

      v43 = v47;
    }

    v52 = 0;
    v53 = @"%@.SpecificDates";
    v43 = v45;
  }

  objc_msgSend(NSString, "stringWithFormat:", v53, @"Home.Users.Guests.Access.Schedule");
  v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)v49;
LABEL_29:
  [v11 setObject:v43 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  [v11 setObject:v31 forKeyedSubscript:*MEMORY[0x1E4F68990]];
  [v11 setObject:v52 forKeyedSubscript:*MEMORY[0x1E4F68980]];
  [v11 setObject:v44 forKeyedSubscript:*MEMORY[0x1E4F68928]];
  v59 = [MEMORY[0x1E4F42A98] configurationWithScale:0];
  v60 = (void *)[objc_alloc(MEMORY[0x1E4F691D0]) initWithSystemImageNamed:@"calendar" configuration:v59];
  [v11 setObject:v60 forKeyedSubscript:*MEMORY[0x1E4F689E8]];

  [v11 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F68A70]];
  v61 = [MEMORY[0x1E4F7A0D8] futureWithResult:v11];

  return v61;
}

- (HMHome)home
{
  return self->_home;
}

- (HMUser)user
{
  return self->_user;
}

- (HFSchedule)schedule
{
  return self->_schedule;
}

- (void)setSchedule:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schedule, 0);
  objc_storeStrong((id *)&self->_user, 0);

  objc_storeStrong((id *)&self->_home, 0);
}

@end