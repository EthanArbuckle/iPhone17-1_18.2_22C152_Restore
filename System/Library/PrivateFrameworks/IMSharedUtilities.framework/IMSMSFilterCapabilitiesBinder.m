@interface IMSMSFilterCapabilitiesBinder
+ (BOOL)firstPartyFilterExtensionActive;
+ (BOOL)isValidSubAction:(int64_t)a3 subAction:(int64_t)a4;
+ (int)updateFilterParamsBindings:(id)a3 promotionalSubActions:(id)a4;
+ (int64_t)deLocalizeSubAction:(int64_t)a3 action:(int64_t)a4;
+ (int64_t)localizeSubAction:(int64_t)a3;
+ (void)IMMetricsCollectorForSMSSubClassification:(unint64_t)a3;
+ (void)executeCompletionBlockForFilterParamsUpdate:(id)a3 promo:(id)a4;
+ (void)handleSMSFilterCapabilitiesOptionsChange;
@end

@implementation IMSMSFilterCapabilitiesBinder

+ (int64_t)localizeSubAction:(int64_t)a3
{
  int64_t v3 = 0xFFFFLL;
  if ((unint64_t)(a3 - 20000) < 3) {
    int64_t v3 = a3 - 19990;
  }
  if ((unint64_t)(a3 - 10000) <= 8) {
    return a3 - 9999;
  }
  else {
    return v3;
  }
}

+ (int64_t)deLocalizeSubAction:(int64_t)a3 action:(int64_t)a4
{
  int64_t v4 = 0xFFFFLL;
  if (a4 == 4) {
    int64_t v4 = a3 + 9999;
  }
  if (a4 == 3) {
    return a3 + 19990;
  }
  else {
    return v4;
  }
}

+ (BOOL)isValidSubAction:(int64_t)a3 subAction:(int64_t)a4
{
  BOOL v4 = (unint64_t)(a4 - 1) < 9;
  if (a3 != 4) {
    BOOL v4 = 0;
  }
  if (a3 == 3) {
    return (unint64_t)(a4 - 10) < 3;
  }
  else {
    return v4;
  }
}

+ (void)executeCompletionBlockForFilterParamsUpdate:(id)a3 promo:(id)a4
{
  id v33 = a3;
  id v6 = a4;
  id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v33)
  {
    uint64_t v8 = [v33 count];
    v9 = v33;
    if (v8)
    {
      unint64_t v10 = 0;
      v11 = @"FilterCapabilitiesBinder";
      id v31 = a1;
      do
      {
        v12 = [v9 objectAtIndex:v10];
        uint64_t v13 = (int)[v12 intValue];

        uint64_t v14 = [a1 localizeSubAction:v13];
        if ([a1 isValidSubAction:4 subAction:v14])
        {
          id v15 = v6;
          v16 = v11;
          v17 = [NSNumber numberWithInteger:v14];
          int v18 = [v32 containsObject:v17];

          if (!v18)
          {
            v19 = [NSNumber numberWithInteger:v14];
            [v32 addObject:v19];

            v11 = v16;
            id v6 = v15;
            a1 = v31;
            goto LABEL_12;
          }
          v11 = v16;
          id v6 = v15;
          a1 = v31;
          if (_IMWillLog())
          {
            uint64_t v30 = v13;
LABEL_10:
            _IMAlwaysLog();
          }
        }
        else if (_IMWillLog())
        {
          uint64_t v30 = v13;
          goto LABEL_10;
        }
LABEL_12:
        ++v10;
        unint64_t v20 = objc_msgSend(v33, "count", v30);
        v9 = v33;
      }
      while (v20 > v10);
    }
  }
  if (v6 && [v6 count])
  {
    for (unint64_t i = 0; objc_msgSend(v6, "count", v30) > i; ++i)
    {
      v22 = [v6 objectAtIndex:i];
      uint64_t v23 = (int)[v22 intValue];

      uint64_t v24 = [a1 localizeSubAction:v23];
      if ([a1 isValidSubAction:3 subAction:v24])
      {
        v25 = [NSNumber numberWithInteger:v24];
        int v26 = [v7 containsObject:v25];

        if (!v26)
        {
          v27 = [NSNumber numberWithInteger:v24];
          [v7 addObject:v27];

          continue;
        }
        if (_IMWillLog())
        {
          uint64_t v30 = v23;
LABEL_22:
          _IMAlwaysLog();
        }
      }
      else if (_IMWillLog())
      {
        uint64_t v30 = v23;
        goto LABEL_22;
      }
    }
  }
  v28 = (void *)[v32 mutableCopy];
  v29 = (void *)[v7 mutableCopy];
  [a1 updateFilterParamsBindings:v28 promotionalSubActions:v29];
}

+ (BOOL)firstPartyFilterExtensionActive
{
  v2 = IMGetCachedDomainValueForKey();
  char v3 = [v2 isEqualToString:@"com.apple.smsFilter.extension"];

  return v3;
}

+ (void)IMMetricsCollectorForSMSSubClassification:(unint64_t)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (([a1 firstPartyFilterExtensionActive] & 1) == 0)
  {
    BOOL v4 = +[IMMetricsCollector sharedInstance];
    id v7 = @"type";
    v5 = [NSNumber numberWithUnsignedInteger:a3];
    v8[0] = v5;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    [v4 trackEvent:@"com.apple.Messages.IMMetricsCollectorEventFilteringAction" withDictionary:v6];
  }
}

+ (int)updateFilterParamsBindings:(id)a3 promotionalSubActions:(id)a4
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 count];
  v72 = v7;
  uint64_t v9 = [v7 count] + v8;
  unint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v9 + 2];
  if (([a1 firstPartyFilterExtensionActive] & 1) == 0 && v9 >= 1)
  {
    v11 = +[IMMetricsCollector sharedInstance];
    [v11 trackEvent:@"com.apple.Messages.IMMetricsCollectorEventFilteringAction" withDictionary:&unk_1EF305EE0];
  }
  v12 = objc_alloc_init(SMSFilterExtensionParams);
  [(SMSFilterExtensionParams *)v12 setAction:4];
  [(SMSFilterExtensionParams *)v12 setSubAction:0];
  [(SMSFilterExtensionParams *)v12 setFilterMode:4];
  [(SMSFilterExtensionParams *)v12 setFilterModeStringValue:@"CKConversationListFilterModeSMSTransactional"];
  [(SMSFilterExtensionParams *)v12 setCategory:3];
  [(SMSFilterExtensionParams *)v12 setSubCategory:0];
  [(SMSFilterExtensionParams *)v12 setOrderOfPlacementInUI:0];
  [(SMSFilterExtensionParams *)v12 setLabel:@"smsft"];
  [(SMSFilterExtensionParams *)v12 setIconName:@"arrow.left.arrow.right"];
  if ([v6 count]) {
    uint64_t v13 = @"FILTERHANDLE_FOLDER_NAME_ALL_TRANSACTIONS";
  }
  else {
    uint64_t v13 = @"FILTERHANDLE_FOLDER_NAME_TRANSACTIONS";
  }
  [(SMSFilterExtensionParams *)v12 setFolderName:v13];
  v74 = v12;
  [v10 addObject:v12];
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id v14 = v6;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v80 objects:v85 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v81;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v81 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v80 + 1) + 8 * v18);
        unint64_t v20 = objc_alloc_init(SMSFilterExtensionParams);
        [(SMSFilterExtensionParams *)v20 setAction:4];
        -[SMSFilterExtensionParams setSubAction:](v20, "setSubAction:", (int)[v19 intValue]);
        [(SMSFilterExtensionParams *)v20 setFilterMode:[(SMSFilterExtensionParams *)v20 action] & 0xF | (16* [(SMSFilterExtensionParams *)v20 subAction])];
        [(SMSFilterExtensionParams *)v20 setCategory:3];
        [(SMSFilterExtensionParams *)v20 setLabel:@"smsft"];
        switch([(SMSFilterExtensionParams *)v20 subAction])
        {
          case 1uLL:
            [(SMSFilterExtensionParams *)v20 setFilterModeStringValue:@"IMMessageFilterSubActionSMSTransactionalOthers"];
            [(SMSFilterExtensionParams *)v20 setSubCategory:1];
            [(SMSFilterExtensionParams *)v20 setOrderOfPlacementInUI:11];
            v21 = [(SMSFilterExtensionParams *)v20 label];
            v22 = [v21 stringByAppendingString:@"_ot"];
            [(SMSFilterExtensionParams *)v20 setLabel:v22];

            [(SMSFilterExtensionParams *)v20 setFolderName:@"FILTERHANDLE_FOLDER_NAME_OTHERS"];
            [(SMSFilterExtensionParams *)v20 setIconName:@"ellipsis.circle"];
            id v23 = a1;
            uint64_t v24 = 17;
            goto LABEL_22;
          case 2uLL:
            [(SMSFilterExtensionParams *)v20 setFilterModeStringValue:@"IMMessageFilterSubActionSMSFinance"];
            [(SMSFilterExtensionParams *)v20 setSubCategory:2];
            [(SMSFilterExtensionParams *)v20 setOrderOfPlacementInUI:1];
            v27 = [(SMSFilterExtensionParams *)v20 label];
            v28 = [v27 stringByAppendingString:@"_fi"];
            [(SMSFilterExtensionParams *)v20 setLabel:v28];

            [(SMSFilterExtensionParams *)v20 setFolderName:@"FILTERHANDLE_FOLDER_NAME_FINANCE"];
            [(SMSFilterExtensionParams *)v20 setIconName:@"creditcard"];
            id v23 = a1;
            uint64_t v24 = 9;
            goto LABEL_22;
          case 3uLL:
            [(SMSFilterExtensionParams *)v20 setFilterModeStringValue:@"IMMessageFilterSubActionSMSOrders"];
            [(SMSFilterExtensionParams *)v20 setSubCategory:3];
            [(SMSFilterExtensionParams *)v20 setOrderOfPlacementInUI:2];
            v29 = [(SMSFilterExtensionParams *)v20 label];
            uint64_t v30 = [v29 stringByAppendingString:@"_or"];
            [(SMSFilterExtensionParams *)v20 setLabel:v30];

            [(SMSFilterExtensionParams *)v20 setFolderName:@"FILTERHANDLE_FOLDER_NAME_ORDERS"];
            [(SMSFilterExtensionParams *)v20 setIconName:@"shippingbox"];
            id v23 = a1;
            uint64_t v24 = 10;
            goto LABEL_22;
          case 4uLL:
            [(SMSFilterExtensionParams *)v20 setFilterModeStringValue:@"IMMessageFilterSubActionSMSReminder"];
            [(SMSFilterExtensionParams *)v20 setSubCategory:4];
            [(SMSFilterExtensionParams *)v20 setOrderOfPlacementInUI:3];
            id v31 = [(SMSFilterExtensionParams *)v20 label];
            id v32 = [v31 stringByAppendingString:@"_rm"];
            [(SMSFilterExtensionParams *)v20 setLabel:v32];

            [(SMSFilterExtensionParams *)v20 setFolderName:@"FILTERHANDLE_FOLDER_NAME_REMINDERS"];
            [(SMSFilterExtensionParams *)v20 setIconName:@"calendar.badge.clock"];
            id v23 = a1;
            uint64_t v24 = 11;
            goto LABEL_22;
          case 5uLL:
            [(SMSFilterExtensionParams *)v20 setFilterModeStringValue:@"IMMessageFilterSubActionSMSHealth"];
            [(SMSFilterExtensionParams *)v20 setSubCategory:5];
            [(SMSFilterExtensionParams *)v20 setOrderOfPlacementInUI:4];
            v25 = [(SMSFilterExtensionParams *)v20 label];
            int v26 = [v25 stringByAppendingString:@"_ht"];
            [(SMSFilterExtensionParams *)v20 setLabel:v26];

            [(SMSFilterExtensionParams *)v20 setFolderName:@"FILTERHANDLE_FOLDER_NAME_HEALTH"];
            [(SMSFilterExtensionParams *)v20 setIconName:@"heart"];
            id v23 = a1;
            uint64_t v24 = 12;
            goto LABEL_22;
          case 6uLL:
            [(SMSFilterExtensionParams *)v20 setFilterModeStringValue:@"IMMessageFilterSubActionSMSWeather"];
            [(SMSFilterExtensionParams *)v20 setSubCategory:6];
            [(SMSFilterExtensionParams *)v20 setOrderOfPlacementInUI:6];
            id v33 = [(SMSFilterExtensionParams *)v20 label];
            v34 = [v33 stringByAppendingString:@"_we"];
            [(SMSFilterExtensionParams *)v20 setLabel:v34];

            [(SMSFilterExtensionParams *)v20 setFolderName:@"FILTERHANDLE_FOLDER_NAME_WEATHER"];
            [(SMSFilterExtensionParams *)v20 setIconName:@"cloud.sun"];
            id v23 = a1;
            uint64_t v24 = 13;
            goto LABEL_22;
          case 7uLL:
            [(SMSFilterExtensionParams *)v20 setFilterModeStringValue:@"IMMessageFilterSubActionSMSCarrier"];
            [(SMSFilterExtensionParams *)v20 setSubCategory:7];
            [(SMSFilterExtensionParams *)v20 setOrderOfPlacementInUI:7];
            v35 = [(SMSFilterExtensionParams *)v20 label];
            v36 = [v35 stringByAppendingString:@"_cr"];
            [(SMSFilterExtensionParams *)v20 setLabel:v36];

            [(SMSFilterExtensionParams *)v20 setFolderName:@"FILTERHANDLE_FOLDER_NAME_CARRIER"];
            [(SMSFilterExtensionParams *)v20 setIconName:@"antenna.radiowaves.left.and.right"];
            id v23 = a1;
            uint64_t v24 = 14;
            goto LABEL_22;
          case 8uLL:
            [(SMSFilterExtensionParams *)v20 setFilterModeStringValue:@"IMMessageFilterSubActionSMSRewards"];
            [(SMSFilterExtensionParams *)v20 setSubCategory:8];
            [(SMSFilterExtensionParams *)v20 setOrderOfPlacementInUI:8];
            v37 = [(SMSFilterExtensionParams *)v20 label];
            v38 = [v37 stringByAppendingString:@"_rw"];
            [(SMSFilterExtensionParams *)v20 setLabel:v38];

            [(SMSFilterExtensionParams *)v20 setFolderName:@"FILTERHANDLE_FOLDER_NAME_REWARDS"];
            [(SMSFilterExtensionParams *)v20 setIconName:@"star"];
            id v23 = a1;
            uint64_t v24 = 15;
            goto LABEL_22;
          case 9uLL:
            [(SMSFilterExtensionParams *)v20 setFilterModeStringValue:@"IMMessageFilterSubActionSMSPublicServices"];
            [(SMSFilterExtensionParams *)v20 setSubCategory:9];
            [(SMSFilterExtensionParams *)v20 setOrderOfPlacementInUI:5];
            v39 = [(SMSFilterExtensionParams *)v20 label];
            v40 = [v39 stringByAppendingString:@"_ps"];
            [(SMSFilterExtensionParams *)v20 setLabel:v40];

            [(SMSFilterExtensionParams *)v20 setFolderName:@"FILTERHANDLE_FOLDER_NAME_PUBLIC_SERVICES"];
            [(SMSFilterExtensionParams *)v20 setIconName:@"building.2"];
            id v23 = a1;
            uint64_t v24 = 16;
LABEL_22:
            [v23 IMMetricsCollectorForSMSSubClassification:v24];
            break;
          default:
            [(SMSFilterExtensionParams *)v20 setFilterModeStringValue:&stru_1EF2CAD28];
            [(SMSFilterExtensionParams *)v20 setSubCategory:0];
            [(SMSFilterExtensionParams *)v20 setOrderOfPlacementInUI:0];
            [(SMSFilterExtensionParams *)v20 setLabel:@"none"];
            [(SMSFilterExtensionParams *)v20 setFolderName:@"None"];
            [(SMSFilterExtensionParams *)v20 setIconName:0];
            break;
        }
        [v10 addObject:v20];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v41 = [v14 countByEnumeratingWithState:&v80 objects:v85 count:16];
      uint64_t v16 = v41;
    }
    while (v41);
  }
  id v73 = v14;

  v42 = objc_alloc_init(SMSFilterExtensionParams);
  [(SMSFilterExtensionParams *)v42 setAction:3];
  [(SMSFilterExtensionParams *)v42 setSubAction:0];
  [(SMSFilterExtensionParams *)v42 setFilterMode:5];
  [(SMSFilterExtensionParams *)v42 setFilterModeStringValue:@"CKConversationListFilterModeSMSPromotional"];
  [(SMSFilterExtensionParams *)v42 setCategory:2];
  [(SMSFilterExtensionParams *)v42 setSubCategory:0];
  [(SMSFilterExtensionParams *)v42 setOrderOfPlacementInUI:0];
  [(SMSFilterExtensionParams *)v42 setLabel:@"smsfp"];
  [(SMSFilterExtensionParams *)v42 setIconName:@"megaphone"];
  if ([v72 count]) {
    v43 = @"FILTERHANDLE_FOLDER_NAME_ALL_PROMOTIONS";
  }
  else {
    v43 = @"FILTERHANDLE_FOLDER_NAME_PROMOTIONS";
  }
  [(SMSFilterExtensionParams *)v42 setFolderName:v43];
  v71 = v42;
  [v10 addObject:v42];
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v44 = v72;
  uint64_t v45 = [v44 countByEnumeratingWithState:&v76 objects:v84 count:16];
  if (v45)
  {
    uint64_t v46 = v45;
    uint64_t v47 = *(void *)v77;
    do
    {
      for (uint64_t i = 0; i != v46; ++i)
      {
        if (*(void *)v77 != v47) {
          objc_enumerationMutation(v44);
        }
        v49 = *(void **)(*((void *)&v76 + 1) + 8 * i);
        v50 = objc_alloc_init(SMSFilterExtensionParams);
        [(SMSFilterExtensionParams *)v50 setAction:3];
        -[SMSFilterExtensionParams setSubAction:](v50, "setSubAction:", (int)[v49 intValue]);
        [(SMSFilterExtensionParams *)v50 setFilterMode:[(SMSFilterExtensionParams *)v50 action] & 0xF | (16* [(SMSFilterExtensionParams *)v50 subAction])];
        [(SMSFilterExtensionParams *)v50 setCategory:2];
        [(SMSFilterExtensionParams *)v50 setLabel:@"smsfp"];
        uint64_t v51 = [(SMSFilterExtensionParams *)v50 subAction];
        switch(v51)
        {
          case 10:
            [(SMSFilterExtensionParams *)v50 setFilterModeStringValue:@"IMMessageFilterSubActionSMSPromotionalOthers"];
            [(SMSFilterExtensionParams *)v50 setSubCategory:10];
            [(SMSFilterExtensionParams *)v50 setOrderOfPlacementInUI:11];
            v58 = [(SMSFilterExtensionParams *)v50 label];
            v59 = [v58 stringByAppendingString:@"_ot"];
            [(SMSFilterExtensionParams *)v50 setLabel:v59];

            [(SMSFilterExtensionParams *)v50 setFolderName:@"FILTERHANDLE_FOLDER_NAME_OTHERS"];
            [(SMSFilterExtensionParams *)v50 setIconName:@"ellipsis.circle"];
            id v54 = a1;
            uint64_t v55 = 20;
            goto LABEL_41;
          case 12:
            [(SMSFilterExtensionParams *)v50 setFilterModeStringValue:@"IMMessageFilterSubActionSMSCoupons"];
            [(SMSFilterExtensionParams *)v50 setSubCategory:12];
            [(SMSFilterExtensionParams *)v50 setOrderOfPlacementInUI:9];
            v56 = [(SMSFilterExtensionParams *)v50 label];
            v57 = [v56 stringByAppendingString:@"_cu"];
            [(SMSFilterExtensionParams *)v50 setLabel:v57];

            [(SMSFilterExtensionParams *)v50 setFolderName:@"FILTERHANDLE_FOLDER_NAME_COUPONS"];
            [(SMSFilterExtensionParams *)v50 setIconName:@"wallet.pass"];
            id v54 = a1;
            uint64_t v55 = 18;
            goto LABEL_41;
          case 11:
            [(SMSFilterExtensionParams *)v50 setFilterModeStringValue:@"IMMessageFilterSubActionSMSOffers"];
            [(SMSFilterExtensionParams *)v50 setSubCategory:11];
            [(SMSFilterExtensionParams *)v50 setOrderOfPlacementInUI:10];
            v52 = [(SMSFilterExtensionParams *)v50 label];
            v53 = [v52 stringByAppendingString:@"_of"];
            [(SMSFilterExtensionParams *)v50 setLabel:v53];

            [(SMSFilterExtensionParams *)v50 setFolderName:@"FILTERHANDLE_FOLDER_NAME_OFFERS"];
            [(SMSFilterExtensionParams *)v50 setIconName:@"tag"];
            id v54 = a1;
            uint64_t v55 = 19;
LABEL_41:
            [v54 IMMetricsCollectorForSMSSubClassification:v55];
            goto LABEL_43;
        }
        [(SMSFilterExtensionParams *)v50 setFilterModeStringValue:&stru_1EF2CAD28];
        [(SMSFilterExtensionParams *)v50 setSubCategory:0];
        [(SMSFilterExtensionParams *)v50 setOrderOfPlacementInUI:0];
        [(SMSFilterExtensionParams *)v50 setLabel:@"none"];
        [(SMSFilterExtensionParams *)v50 setFolderName:@"None"];
        [(SMSFilterExtensionParams *)v50 setIconName:0];
LABEL_43:
        [v10 addObject:v50];
      }
      uint64_t v46 = [v44 countByEnumeratingWithState:&v76 objects:v84 count:16];
    }
    while (v46);
  }

  [v10 sortUsingComparator:&unk_1EF2BF200];
  v60 = (void *)[v10 copy];
  id v61 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v75 = 0;
  v62 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v60 requiringSecureCoding:1 error:&v75];
  id v63 = v75;
  if (v63)
  {
    v64 = v73;
    if (_IMWillLog()) {
      _IMAlwaysLog();
    }
  }
  else
  {
    [v61 setValue:v62 forKey:@"spamFilterExtensionParams"];
    CFPreferencesSetAppValue(@"spamFilterExtensionParams", v61, @"com.apple.MobileSMS");
    CFStringRef v65 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
    CFPreferencesSynchronize(@"com.apple.MobileSMS", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
    CFPreferencesSynchronize(@"com.apple.MobileSMS", v65, (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    +[IMSMSFilterHelper updateSMSFilterExtensionParams];
    if (_IMWillLog()) {
      _IMAlwaysLog();
    }
    v66 = +[IMFeatureFlags sharedFeatureFlags];
    int v67 = [v66 isSMSFilterSyncEnabled];

    v64 = v73;
    if (v67)
    {
      if (+[IMSpamFilterHelper isFilterUnknownSendersEnabled])
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterPostNotification(DarwinNotifyCenter, @"CKSMSFilterExtensionParamsUpdateDistributedNotification", 0, 0, 1u);
      }
      +[IMSMSFilterCapabilitiesSyncHelper updateSMSFilterCapabilitiesOptionsForSelf];
    }
    else
    {
      v69 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(v69, @"CKSMSFilterExtensionParamsUpdateDistributedNotification", 0, 0, 1u);
    }
  }

  return 0;
}

+ (void)handleSMSFilterCapabilitiesOptionsChange
{
  if (+[IMSMSFilterHelper supportsIncomingSMSRelayFiltering])
  {
    unint64_t v3 = +[IMSMSFilterCapabilitiesSyncHelper fetchSMSFilterCapabilitiesOptions];
    BOOL v4 = +[IMFeatureFlags sharedFeatureFlags];
    int v5 = [v4 isSMSFilterSyncEnabled];

    if (!v5) {
      return;
    }
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    unint64_t v7 = 1;
    while (1)
    {
      if (v7 > 9)
      {
        if (+[IMSMSFilterCapabilitiesSyncHelper isSubActionActiveInSMSFilterCapabilitiesOptions:v3 subAction:v7 action:3])
        {
          uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", +[IMSMSFilterCapabilitiesBinder deLocalizeSubAction:action:](IMSMSFilterCapabilitiesBinder, "deLocalizeSubAction:action:", v7, 3));
          uint64_t v9 = v6;
          goto LABEL_9;
        }
      }
      else if (+[IMSMSFilterCapabilitiesSyncHelper isSubActionActiveInSMSFilterCapabilitiesOptions:v3 subAction:v7 action:4])
      {
        uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", +[IMSMSFilterCapabilitiesBinder deLocalizeSubAction:action:](IMSMSFilterCapabilitiesBinder, "deLocalizeSubAction:action:", v7, 4));
        uint64_t v9 = v14;
LABEL_9:
        [v9 addObject:v8];
      }
      if (++v7 == 13)
      {
        char v10 = _IMWillLog();
        id v11 = v14;
        if (v10)
        {
          id v12 = v14;
          id v13 = v6;
          _IMAlwaysLog();
          id v11 = v14;
        }
        objc_msgSend(a1, "executeCompletionBlockForFilterParamsUpdate:promo:", v11, v6, v12, v13);

        return;
      }
    }
  }
  if (_IMWillLog())
  {
    _IMAlwaysLog();
  }
}

@end