@interface HFUserNotificationServiceTopicItem
- (HFUserNotificationServiceTopic)topic;
- (HFUserNotificationServiceTopicItem)initWithHome:(id)a3 topic:(id)a4;
- (HMHome)home;
- (id)_notificationModeToString:(unint64_t)a3;
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HFUserNotificationServiceTopicItem

- (HFUserNotificationServiceTopicItem)initWithHome:(id)a3 topic:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFUserNotificationServiceTopicItem;
  v9 = [(HFUserNotificationServiceTopicItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a3);
    objc_storeStrong((id *)&v10->_topic, a4);
  }

  return v10;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v73[1] = *MEMORY[0x263EF8340];
  v5 = objc_opt_new();
  v6 = (void *)MEMORY[0x263EFFA08];
  v73[0] = objc_opt_class();
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v73 count:1];
  id v8 = [v6 setWithArray:v7];
  [v5 setObject:v8 forKeyedSubscript:@"dependentHomeKitClasses"];

  v9 = [(HFUserNotificationServiceTopicItem *)self topic];
  v10 = [v9 topicName];
  [v5 setObject:v10 forKeyedSubscript:@"title"];

  unint64_t v11 = 0x263F08000uLL;
  objc_super v12 = NSString;
  v13 = [(HFUserNotificationServiceTopicItem *)self topic];
  v14 = [v13 topicName];
  v15 = [v12 stringWithFormat:@"Home.Settings.%@", v14];
  v16 = [v15 stringByReplacingOccurrencesOfString:@" " withString:&stru_26C081158];
  [v5 setObject:v16 forKeyedSubscript:@"HFResultDisplayAccessibilityIDKey"];

  v17 = [(HFUserNotificationServiceTopicItem *)self topic];
  v18 = [v17 iconDescriptor];
  [v5 setObject:v18 forKeyedSubscript:@"icon"];

  v19 = [(HFUserNotificationServiceTopicItem *)self home];
  if (!objc_msgSend(v19, "hf_shouldShowAnnounceFeatureForThisHome")) {
    goto LABEL_6;
  }
  v20 = [(HFUserNotificationServiceTopicItem *)self topic];
  v21 = [v20 accessoryCategoryTypes];
  if (([v21 containsObject:*MEMORY[0x263F0B0A0]] & 1) == 0)
  {

LABEL_6:
    goto LABEL_7;
  }
  v22 = [(HFUserNotificationServiceTopicItem *)self topic];
  [v22 topicName];
  v24 = v23 = a2;
  v25 = _HFLocalizedStringWithDefaultValue(@"HFUserNotificationServiceTopicName_Announce", @"HFUserNotificationServiceTopicName_Announce", 1);
  int v67 = [v24 isEqualToString:v25];

  unint64_t v11 = 0x263F08000;
  a2 = v23;

  if (v67)
  {
    v26 = [(HFUserNotificationServiceTopicItem *)self home];
    v27 = [v26 currentUser];
    v28 = [v27 announceUserSettings];

    v29 = -[HFUserNotificationServiceTopicItem _notificationModeToString:](self, "_notificationModeToString:", [v28 deviceNotificationMode]);
    [v5 setObject:v29 forKeyedSubscript:@"description"];

    [v5 setObject:@"Home.HomeSettings.Intercom" forKeyedSubscript:@"HFResultDisplayAccessibilityIDKey"];
    goto LABEL_25;
  }
LABEL_7:
  v30 = [(HFUserNotificationServiceTopicItem *)self topic];
  v31 = [v30 topicName];
  v32 = _HFLocalizedStringWithDefaultValue(@"HFUserNotificationServiceTopicName_SafetyAndSecurity", @"HFUserNotificationServiceTopicName_SafetyAndSecurity", 1);
  int v33 = [v31 isEqualToString:v32];

  if (v33)
  {
    v34 = +[HFHomeKitDispatcher sharedDispatcher];
    v35 = [v34 homeManager];

    v36 = [(HFUserNotificationServiceTopicItem *)self home];
    if (objc_msgSend(v36, "hf_hasAtleastOneSafetyAndSecuritySupportedAccessory")) {
      int v37 = 0;
    }
    else {
      int v37 = [v35 hasOptedToHH2];
    }

    v46 = HFLogForCategory(0);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      v47 = [(HFUserNotificationServiceTopicItem *)self home];
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v69 = objc_msgSend(v47, "hf_hasAtleastOneSafetyAndSecuritySupportedAccessory");
      *(_WORD *)&v69[4] = 1024;
      *(_DWORD *)&v69[6] = [v35 hasOptedToHH2];
      _os_log_impl(&dword_20B986000, v46, OS_LOG_TYPE_DEFAULT, "Safety Accessory: %{BOOL}d HH2: %{BOOL}d", buf, 0xEu);
    }
    v48 = [(HFUserNotificationServiceTopicItem *)self home];
    if objc_msgSend(v48, "hf_hasEnabledResident") && (objc_msgSend(v35, "hasOptedToHH2"))
    {
      unsigned int v49 = 0;
    }
    else
    {
      v50 = [(HFUserNotificationServiceTopicItem *)self home];
      unsigned int v49 = [v50 isEventLogEnabled] ^ 1;
    }
    v51 = HFLogForCategory(3uLL);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      v52 = [(HFUserNotificationServiceTopicItem *)self home];
      int v53 = objc_msgSend(v52, "hf_hasEnabledResident");
      int v54 = [v35 hasOptedToHH2];
      v55 = [(HFUserNotificationServiceTopicItem *)self home];
      int v56 = [v55 isEventLogEnabled];
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)v69 = v53;
      *(_WORD *)&v69[4] = 1024;
      *(_DWORD *)&v69[6] = v54;
      LOWORD(v70) = 1024;
      *(_DWORD *)((char *)&v70 + 2) = v56;
      _os_log_impl(&dword_20B986000, v51, OS_LOG_TYPE_DEFAULT, "Enabled Resident: %{BOOL}d HH2: %{BOOL}d EventLogEnabled: %{BOOL}d", buf, 0x14u);
    }
    v57 = [NSNumber numberWithInt:v37 & v49];
    [v5 setObject:v57 forKeyedSubscript:@"isDisabled"];

    [v5 setObject:@"Home.HomeSettings.SafetyAndSecurity" forKeyedSubscript:@"HFResultDisplayAccessibilityIDKey"];
  }
  else
  {
    v38 = [(HFUserNotificationServiceTopicItem *)self topic];
    v39 = [v38 topicName];
    v40 = _HFLocalizedStringWithDefaultValue(@"HFUserNotificationServiceTopicName_Energy", @"HFUserNotificationServiceTopicName_Energy", 1);
    int v41 = [v39 isEqualToString:v40];

    if (v41)
    {
      v42 = HFLogForCategory(0x31uLL);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        v43 = NSStringFromSelector(a2);
        v44 = [(HFUserNotificationServiceTopicItem *)self topic];
        v45 = [v44 topicName];
        *(_DWORD *)buf = 138412802;
        *(void *)v69 = self;
        *(_WORD *)&v69[8] = 2112;
        v70 = v43;
        __int16 v71 = 2112;
        v72 = v45;
        _os_log_impl(&dword_20B986000, v42, OS_LOG_TYPE_DEFAULT, "%@:%@ Don't need device count for topic %@", buf, 0x20u);
      }
      [v5 setObject:@"Home.HomeSettings.Energy" forKeyedSubscript:@"HFResultDisplayAccessibilityIDKey"];
    }
    else
    {
      v58 = [(HFUserNotificationServiceTopicItem *)self home];
      v59 = [(HFUserNotificationServiceTopicItem *)self topic];
      v60 = objc_msgSend(v58, "hf_allObjectsAffectedByServiceTopic:", v59);
      uint64_t v61 = [v60 count];

      v62 = objc_msgSend(*(id *)(v11 + 2880), "localizedStringWithFormat:", @"%lu", v61);
      [v5 setObject:v62 forKeyedSubscript:@"description"];
    }
  }
LABEL_25:
  [v5 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"shouldDisableForNonAdminUsers"];
  v63 = (void *)MEMORY[0x263F58190];
  v64 = +[HFItemUpdateOutcome outcomeWithResults:v5];
  v65 = [v63 futureWithResult:v64];

  return v65;
}

- (id)_notificationModeToString:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      v4 = @"HFAnnounceNotificationSetting_NotSet";
      goto LABEL_9;
    case 1uLL:
      v4 = @"HFAnnounceNotificationSetting_Never";
      goto LABEL_9;
    case 2uLL:
      v4 = @"HFAnnounceNotificationSetting_AtHome";
      goto LABEL_9;
    case 3uLL:
      v4 = @"HFAnnounceNotificationSetting_Always";
LABEL_9:
      _HFLocalizedStringWithDefaultValue(v4, v4, 1);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = &stru_26C081158;
      break;
  }
  return v5;
}

- (HMHome)home
{
  return self->_home;
}

- (HFUserNotificationServiceTopic)topic
{
  return self->_topic;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end