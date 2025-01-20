@interface AMSFollowUpItem
+ (id)_dateFromString:(id)a3;
+ (id)backingIdentifierForIdentifier:(id)a3 account:(id)a4;
+ (id)componentsFromBackingIdentifier:(id)a3;
- (ACAccount)account;
- (AMSFollowUpItem)initWithFollowUpItem:(id)a3;
- (AMSFollowUpItem)initWithIdentifier:(id)a3 account:(id)a4 priority:(int64_t)a5;
- (AMSFollowUpItem)initWithIdentifier:(id)a3 jsonDictionary:(id)a4 account:(id)a5 priority:(int64_t)a6 logKey:(id)a7;
- (AMSFollowUpNotification)notification;
- (AMSMetricsEvent)metricsEvent;
- (BOOL)active;
- (BOOL)disableGrouping;
- (BOOL)isExpirationDateHidden;
- (BOOL)isHardwareOffer;
- (BOOL)isNewDeviceOutreach;
- (BOOL)keepNotificationOnLockscreen;
- (BOOL)shouldOverwriteItem:(id)a3;
- (BOOL)shouldPostNotification;
- (NSArray)actions;
- (NSDate)expirationDate;
- (NSMutableDictionary)userInfo;
- (NSString)backingIdentifier;
- (NSString)bundleIconName;
- (NSString)footer;
- (NSString)groupIdentifier;
- (NSString)identifier;
- (NSString)informativeText;
- (NSString)logKey;
- (NSString)title;
- (OS_dispatch_queue)internalQueue;
- (OS_dispatch_queue)metricsQueue;
- (id)generateItem;
- (id)postMetricsWithBag:(id)a3;
- (id)postMetricsWithBagContract:(id)a3;
- (int64_t)displayStyle;
- (int64_t)priority;
- (void)setAccount:(id)a3;
- (void)setActions:(id)a3;
- (void)setBundleIconName:(id)a3;
- (void)setDisableGrouping:(BOOL)a3;
- (void)setDisplayStyle:(int64_t)a3;
- (void)setExpirationDate:(id)a3;
- (void)setExpirationDateHidden:(BOOL)a3;
- (void)setFooter:(id)a3;
- (void)setHardwareOffer:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setInformativeText:(id)a3;
- (void)setInternalQueue:(id)a3;
- (void)setKeepNotificationOnLockscreen:(BOOL)a3;
- (void)setLogKey:(id)a3;
- (void)setMetricsEvent:(id)a3;
- (void)setMetricsQueue:(id)a3;
- (void)setNewDeviceOutreach:(BOOL)a3;
- (void)setNotification:(id)a3;
- (void)setPriority:(int64_t)a3;
- (void)setShouldPostNotification:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation AMSFollowUpItem

- (AMSFollowUpItem)initWithIdentifier:(id)a3 account:(id)a4 priority:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v21.receiver = self;
  v21.super_class = (Class)AMSFollowUpItem;
  v11 = [(AMSFollowUpItem *)&v21 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_account, a4);
    objc_storeStrong((id *)&v12->_identifier, a3);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.AppleMediaServices.FollowUpItem", 0);
    internalQueue = v12->_internalQueue;
    v12->_internalQueue = (OS_dispatch_queue *)v13;

    dispatch_queue_t v15 = dispatch_queue_create("com.apple.AppleMediaServices.FollowUpItemMetrics", 0);
    metricsQueue = v12->_metricsQueue;
    v12->_metricsQueue = (OS_dispatch_queue *)v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    userInfo = v12->_userInfo;
    v12->_userInfo = v17;

    v19 = [MEMORY[0x1E4F28ED0] numberWithInteger:a5];
    [(NSMutableDictionary *)v12->_userInfo setObject:v19 forKeyedSubscript:@"AMSPriority"];
  }
  return v12;
}

- (AMSFollowUpItem)initWithIdentifier:(id)a3 jsonDictionary:(id)a4 account:(id)a5 priority:(int64_t)a6 logKey:(id)a7
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v16 = [v13 objectForKeyedSubscript:@"deviceGroup"];
  char v17 = objc_opt_respondsToSelector();
  id v18 = v14;
  if (v17)
  {
    if ([v16 BOOLValue]) {
      id v18 = 0;
    }
    else {
      id v18 = v14;
    }
  }
  v19 = [(AMSFollowUpItem *)self initWithIdentifier:v12 account:v18 priority:a6];
  if (v19)
  {
    uint64_t v20 = [v13 objectForKeyedSubscript:@"title"];
    objc_super v21 = (void *)v20;
    if (v20) {
      v22 = (__CFString *)v20;
    }
    else {
      v22 = &stru_1EDCA7308;
    }
    v72 = v22;

    id v77 = [v13 objectForKeyedSubscript:@"text"];
    v23 = [v13 objectForKeyedSubscript:@"expirationDateHidden"];
    v71 = v23;
    if (objc_opt_respondsToSelector()) {
      char v24 = [v23 BOOLValue];
    }
    else {
      char v24 = 0;
    }
    v25 = [v13 objectForKeyedSubscript:@"expirationDate"];
    id obj = [v13 objectForKeyedSubscript:@"footer"];
    v75 = [v13 objectForKeyedSubscript:@"metrics"];
    v70 = v25;
    if ([v25 length])
    {
      v26 = +[AMSFollowUpItem _dateFromString:v25];
    }
    else
    {
      v26 = 0;
    }
    v73 = v16;
    v27 = [v13 objectForKeyedSubscript:@"disableGrouping"];
    v68 = v27;
    if (objc_opt_respondsToSelector()) {
      char v28 = [v27 BOOLValue];
    }
    else {
      char v28 = 0;
    }
    uint64_t v29 = [v13 objectForKeyedSubscript:@"iconImageName"];
    bundleIconName = v19->_bundleIconName;
    v19->_bundleIconName = (NSString *)v29;

    v19->_expirationDateHidden = v24;
    v19->_disableGrouping = v28;
    objc_storeStrong((id *)&v19->_expirationDate, v26);
    objc_storeStrong((id *)&v19->_footer, obj);
    objc_storeStrong((id *)&v19->_informativeText, v77);
    objc_storeStrong((id *)&v19->_title, v22);
    [(AMSFollowUpItem *)v19 setLogKey:v15];
    if (v75)
    {
      v31 = [[AMSMetricsEvent alloc] initWithUnderlyingDictionary:v75];
      metricsEvent = v19->_metricsEvent;
      v19->_metricsEvent = v31;
    }
    v33 = [v13 objectForKeyedSubscript:@"notification"];
    id v74 = v14;
    if (objc_opt_respondsToSelector()) {
      uint64_t v34 = [v33 BOOLValue];
    }
    else {
      uint64_t v34 = 0;
    }
    [(AMSFollowUpItem *)v19 setShouldPostNotification:v34];
    id v35 = v33;
    objc_opt_class();
    v67 = v35;
    if (objc_opt_isKindOfClass())
    {
      id v36 = v35;

      if (v36) {
        goto LABEL_29;
      }
    }
    else
    {
    }
    v37 = [v13 objectForKeyedSubscript:@"notificationOptions"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v36 = 0;
LABEL_34:

      goto LABEL_35;
    }
    id v36 = v37;

    if (!v36)
    {
LABEL_35:
      v45 = [v13 objectForKeyedSubscript:@"hardwareOffer"];
      if (objc_opt_respondsToSelector()) {
        char v46 = [v45 BOOLValue];
      }
      else {
        char v46 = 0;
      }
      v19->_hardwareOffer = v46;
      v47 = [v13 objectForKeyedSubscript:@"newDeviceOutreach"];
      if (objc_opt_respondsToSelector()) {
        char v48 = [v47 BOOLValue];
      }
      else {
        char v48 = 0;
      }
      v19->_newDeviceOutreach = v48;
      v49 = [v13 objectForKeyedSubscript:@"omitBadge"];
      if ((objc_opt_respondsToSelector() & 1) != 0 && [v49 BOOLValue]) {
        v19->_displayStyle |= 0x10uLL;
      }
      v65 = v45;
      v69 = v26;
      v50 = [v13 objectForKeyedSubscript:@"notificationOnly"];
      if ((objc_opt_respondsToSelector() & 1) != 0 && [v50 BOOLValue]) {
        v19->_displayStyle |= 0x18uLL;
      }
      v62 = v50;
      v63 = v49;
      v64 = v47;
      v66 = v36;
      v51 = [v13 objectForKeyedSubscript:@"zeroAction"];
      if ((objc_opt_respondsToSelector() & 1) != 0 && [v51 BOOLValue]) {
        v19->_displayStyle |= 2uLL;
      }
      v60 = v51;
      id v52 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v53 = [v13 objectForKeyedSubscript:@"actions"];
      long long v78 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      uint64_t v54 = [v53 countByEnumeratingWithState:&v78 objects:v82 count:16];
      if (v54)
      {
        uint64_t v55 = v54;
        uint64_t v56 = *(void *)v79;
        do
        {
          for (uint64_t i = 0; i != v55; ++i)
          {
            if (*(void *)v79 != v56) {
              objc_enumerationMutation(v53);
            }
            v58 = -[AMSFollowUpAction initWithJSONDictionary:parentIdentifier:]([AMSFollowUpAction alloc], "initWithJSONDictionary:parentIdentifier:", *(void *)(*((void *)&v78 + 1) + 8 * i), v12, v60);
            [(AMSFollowUpAction *)v58 setLogKey:v15];
            [v52 addObject:v58];
          }
          uint64_t v55 = [v53 countByEnumeratingWithState:&v78 objects:v82 count:16];
        }
        while (v55);
      }
      if (objc_msgSend(v52, "count", v60)) {
        objc_storeStrong((id *)&v19->_actions, v52);
      }

      id v14 = v74;
      v16 = v73;
      goto LABEL_60;
    }
LABEL_29:
    v38 = [[AMSFollowUpNotification alloc] initWithJSONDictionary:v36 parentIdentifier:v12 logKey:v15];
    notification = v19->_notification;
    v19->_notification = v38;

    v40 = [(AMSFollowUpItem *)v19 title];

    if (v40)
    {
      v41 = [(AMSFollowUpItem *)v19 title];
      v42 = [(AMSFollowUpItem *)v19 notification];
      [v42 setTitle:v41];
    }
    v43 = [(AMSFollowUpItem *)v19 informativeText];

    if (!v43) {
      goto LABEL_35;
    }
    v37 = [(AMSFollowUpItem *)v19 informativeText];
    v44 = [(AMSFollowUpItem *)v19 notification];
    [v44 setInformativeText:v37];

    goto LABEL_34;
  }
LABEL_60:

  return v19;
}

- (AMSFollowUpItem)initWithFollowUpItem:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 uniqueIdentifier];
  v6 = [(id)objc_opt_class() componentsFromBackingIdentifier:v5];
  v7 = [v6 objectForKeyedSubscript:@"identifier"];
  v8 = [v6 objectForKeyedSubscript:@"account"];
  if (v8)
  {
    id v9 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
    id v10 = objc_msgSend(v9, "ams_iTunesAccountWithDSID:", v8);
  }
  else
  {
    v11 = [v4 userInfo];
    id v12 = [v11 objectForKeyedSubscript:@"AMSLogKey"];

    id v13 = +[AMSLogConfig sharedFollowUpConfig];
    if (!v13)
    {
      id v13 = +[AMSLogConfig sharedConfig];
    }
    id v14 = [v13 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = objc_opt_class();
      id v50 = v15;
      v16 = AMSHashIfNeeded(0);
      *(_DWORD *)buf = 138543874;
      v58 = v15;
      v8 = 0;
      __int16 v59 = 2114;
      v60 = v12;
      __int16 v61 = 2112;
      v62 = v16;
      _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch account with DSID: %@", buf, 0x20u);
    }
    id v10 = 0;
  }
  char v17 = [(AMSFollowUpItem *)self initWithIdentifier:v7 account:v10 priority:0];
  if (v17)
  {
    char v48 = v10;
    v49 = v8;
    v17->_displayStyle = [v4 displayStyle];
    uint64_t v18 = [v4 bundleIconName];
    bundleIconName = v17->_bundleIconName;
    v17->_bundleIconName = (NSString *)v18;

    uint64_t v20 = [v4 informativeText];
    informativeText = v17->_informativeText;
    v17->_informativeText = (NSString *)v20;

    uint64_t v22 = [v4 expirationDate];
    expirationDate = v17->_expirationDate;
    v17->_expirationDate = (NSDate *)v22;

    uint64_t v24 = [v4 informativeFooterText];
    footer = v17->_footer;
    v17->_footer = (NSString *)v24;

    uint64_t v26 = [v4 title];
    title = v17->_title;
    v17->_title = (NSString *)v26;

    char v28 = [v4 userInfo];

    if (v28)
    {
      uint64_t v29 = [v4 userInfo];
      v30 = (NSMutableDictionary *)[v29 mutableCopy];

      v31 = [(NSMutableDictionary *)v30 objectForKeyedSubscript:@"AMSMetrics"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v32 = v31;

        if (v32)
        {
          v33 = [[AMSMetricsEvent alloc] initWithUnderlyingDictionary:v32];
          metricsEvent = v17->_metricsEvent;
          v17->_metricsEvent = v33;

          [(NSMutableDictionary *)v30 removeObjectForKey:@"AMSMetrics"];
        }
      }
      else
      {

        id v32 = 0;
      }
      id v35 = getFLUserInfoPropertyDontDisplayDate();
      id v36 = [(NSMutableDictionary *)v30 objectForKeyedSubscript:v35];

      if (objc_opt_respondsToSelector()) {
        uint64_t v37 = [v36 BOOLValue];
      }
      else {
        uint64_t v37 = 0;
      }
      [(AMSFollowUpItem *)v17 setExpirationDateHidden:v37];
      userInfo = v17->_userInfo;
      v17->_userInfo = v30;
    }
    v51 = v5;
    v39 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    v40 = [v4 actions];
    uint64_t v41 = [v40 countByEnumeratingWithState:&v52 objects:v56 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v42; ++i)
        {
          if (*(void *)v53 != v43) {
            objc_enumerationMutation(v40);
          }
          v45 = [[AMSFollowUpAction alloc] initWithAction:*(void *)(*((void *)&v52 + 1) + 8 * i) parentIdentifier:v7];
          [(NSArray *)v39 addObject:v45];
        }
        uint64_t v42 = [v40 countByEnumeratingWithState:&v52 objects:v56 count:16];
      }
      while (v42);
    }

    actions = v17->_actions;
    v17->_actions = v39;

    v5 = v51;
    id v10 = v48;
    v8 = v49;
  }

  return v17;
}

- (ACAccount)account
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__34;
  v11 = __Block_byref_object_dispose__34;
  id v12 = 0;
  v3 = [(AMSFollowUpItem *)self internalQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __26__AMSFollowUpItem_account__block_invoke;
  v6[3] = &unk_1E559F2A8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (ACAccount *)v4;
}

void __26__AMSFollowUpItem_account__block_invoke(uint64_t a1)
{
}

- (BOOL)active
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(AMSFollowUp);
  id v4 = [(AMSFollowUp *)v3 pendingFollowUps];
  id v25 = 0;
  v5 = [v4 resultWithError:&v25];
  id v6 = v25;

  if (v6)
  {
    uint64_t v7 = +[AMSLogConfig sharedConfig];
    if (!v7)
    {
      uint64_t v7 = +[AMSLogConfig sharedConfig];
    }
    v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      char v28 = v9;
      __int16 v29 = 2114;
      id v30 = v6;
      id v10 = v9;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch pending followups for determining active status. Error: %{public}@", buf, 0x16u);
    }
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = v5;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "backingIdentifier", (void)v21);
        char v17 = [(AMSFollowUpItem *)self backingIdentifier];
        char v18 = [v16 isEqualToString:v17];

        if (v18)
        {
          BOOL v19 = 1;
          goto LABEL_17;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
  BOOL v19 = 0;
LABEL_17:

  return v19;
}

- (NSString)backingIdentifier
{
  v3 = objc_opt_class();
  id v4 = [(AMSFollowUpItem *)self identifier];
  v5 = [(AMSFollowUpItem *)self account];
  id v6 = [v3 backingIdentifierForIdentifier:v4 account:v5];

  return (NSString *)v6;
}

- (NSString)identifier
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__34;
  id v11 = __Block_byref_object_dispose__34;
  id v12 = 0;
  v3 = [(AMSFollowUpItem *)self internalQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__AMSFollowUpItem_identifier__block_invoke;
  v6[3] = &unk_1E559F2A8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __29__AMSFollowUpItem_identifier__block_invoke(uint64_t a1)
{
}

- (NSString)groupIdentifier
{
  if ([(AMSFollowUpItem *)self disableGrouping])
  {
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x2020000000;
    v3 = (void **)qword_1EB38D928;
    uint64_t v16 = qword_1EB38D928;
    if (qword_1EB38D928) {
      goto LABEL_16;
    }
    id v4 = (void *)CoreFollowUpLibrary();
    v14[3] = (uint64_t)dlsym(v4, "FLGroupIdentifierNoGroup");
    qword_1EB38D928 = v14[3];
  }
  else if ([(AMSFollowUpItem *)self isHardwareOffer])
  {
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x2020000000;
    v3 = (void **)qword_1EB38D930;
    uint64_t v16 = qword_1EB38D930;
    if (qword_1EB38D930) {
      goto LABEL_16;
    }
    v5 = (void *)CoreFollowUpLibrary();
    v14[3] = (uint64_t)dlsym(v5, "FLGroupIdentifierAppleServices");
    qword_1EB38D930 = v14[3];
  }
  else if ([(AMSFollowUpItem *)self isNewDeviceOutreach])
  {
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x2020000000;
    v3 = (void **)qword_1EB38D938;
    uint64_t v16 = qword_1EB38D938;
    if (qword_1EB38D938) {
      goto LABEL_16;
    }
    id v6 = (void *)CoreFollowUpLibrary();
    v14[3] = (uint64_t)dlsym(v6, "FLGroupIdentifierNewDeviceOutreach");
    qword_1EB38D938 = v14[3];
  }
  else
  {
    uint64_t v7 = [(AMSFollowUpItem *)self account];

    if (v7)
    {
      uint64_t v13 = 0;
      uint64_t v14 = &v13;
      uint64_t v15 = 0x2020000000;
      v3 = (void **)qword_1EB38D940;
      uint64_t v16 = qword_1EB38D940;
      if (qword_1EB38D940) {
        goto LABEL_16;
      }
      v8 = (void *)CoreFollowUpLibrary();
      v14[3] = (uint64_t)dlsym(v8, "FLGroupIdentifierAccount");
      qword_1EB38D940 = v14[3];
    }
    else
    {
      uint64_t v13 = 0;
      uint64_t v14 = &v13;
      uint64_t v15 = 0x2020000000;
      v3 = (void **)qword_1EB38D948;
      uint64_t v16 = qword_1EB38D948;
      if (qword_1EB38D948) {
        goto LABEL_16;
      }
      uint64_t v9 = (void *)CoreFollowUpLibrary();
      v14[3] = (uint64_t)dlsym(v9, "FLGroupIdentifierDevice");
      qword_1EB38D948 = v14[3];
    }
  }
  v3 = (void **)v14[3];
LABEL_16:
  _Block_object_dispose(&v13, 8);
  if (!v3)
  {
    dlerror();
    id v12 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v13, 8);
    _Unwind_Resume(v12);
  }
  id v10 = *v3;
  return (NSString *)v10;
}

- (NSString)logKey
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__34;
  id v11 = __Block_byref_object_dispose__34;
  id v12 = 0;
  v3 = [(AMSFollowUpItem *)self internalQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __25__AMSFollowUpItem_logKey__block_invoke;
  v6[3] = &unk_1E559F2A8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __25__AMSFollowUpItem_logKey__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:@"AMSLogKey"];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    v5 = AMSGenerateLogCorrelationKey();
    [*(id *)(*(void *)(a1 + 32) + 24) setObject:v5 forKeyedSubscript:@"AMSLogKey"];

    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:@"AMSLogKey"];
    MEMORY[0x1F41817F8]();
  }
}

- (int64_t)priority
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  uint64_t v3 = [(AMSFollowUpItem *)self internalQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __27__AMSFollowUpItem_priority__block_invoke;
  v6[3] = &unk_1E55A30A0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __27__AMSFollowUpItem_priority__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:@"AMSPriority"];
  if (objc_opt_respondsToSelector()) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 integerValue];
  }
}

- (NSMutableDictionary)userInfo
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__34;
  id v11 = __Block_byref_object_dispose__34;
  id v12 = 0;
  uint64_t v3 = [(AMSFollowUpItem *)self internalQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __27__AMSFollowUpItem_userInfo__block_invoke;
  v6[3] = &unk_1E559F2A8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSMutableDictionary *)v4;
}

void __27__AMSFollowUpItem_userInfo__block_invoke(uint64_t a1)
{
}

- (void)setAccount:(id)a3
{
  id v4 = a3;
  v5 = [(AMSFollowUpItem *)self internalQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __30__AMSFollowUpItem_setAccount___block_invoke;
  v7[3] = &unk_1E559F1E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __30__AMSFollowUpItem_setAccount___block_invoke(uint64_t a1)
{
}

- (void)setIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(AMSFollowUpItem *)self internalQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__AMSFollowUpItem_setIdentifier___block_invoke;
  v7[3] = &unk_1E559F1E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __33__AMSFollowUpItem_setIdentifier___block_invoke(uint64_t a1)
{
}

- (void)setLogKey:(id)a3
{
  id v4 = a3;
  v5 = [(AMSFollowUpItem *)self internalQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __29__AMSFollowUpItem_setLogKey___block_invoke;
  v7[3] = &unk_1E559F1E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __29__AMSFollowUpItem_setLogKey___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) setObject:*(void *)(a1 + 40) forKeyedSubscript:@"AMSLogKey"];
}

- (void)setPriority:(int64_t)a3
{
  v5 = [(AMSFollowUpItem *)self internalQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __31__AMSFollowUpItem_setPriority___block_invoke;
  v6[3] = &unk_1E55A1998;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(v5, v6);
}

void __31__AMSFollowUpItem_setPriority___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28ED0] numberWithInteger:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 24) setObject:v2 forKeyedSubscript:@"AMSPriority"];
}

- (void)setUserInfo:(id)a3
{
  id v4 = a3;
  v5 = [(AMSFollowUpItem *)self internalQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31__AMSFollowUpItem_setUserInfo___block_invoke;
  v7[3] = &unk_1E559F1E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __31__AMSFollowUpItem_setUserInfo___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 40);
  id v3 = v2;
  if (!v2) {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  id v4 = v3;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), v3);
  if (!v2)
  {
  }
}

+ (id)backingIdentifierForIdentifier:(id)a3 account:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_msgSend(v6, "ams_DSID");
  uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    id v8 = NSString;
    uint64_t v9 = objc_msgSend(v6, "ams_DSID");
    uint64_t v7 = [v8 stringWithFormat:@"%@%@", @"++", v9];
  }
  uint64_t v10 = &stru_1EDCA7308;
  if (v7) {
    uint64_t v10 = v7;
  }
  id v11 = [NSString stringWithFormat:@"%@%@%@", @"AMS_", v5, v10];

  return v11;
}

+ (id)componentsFromBackingIdentifier:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = [v4 stringByReplacingOccurrencesOfString:@"AMS_" withString:&stru_1EDCA7308];

  uint64_t v7 = [v6 componentsSeparatedByString:@"++"];
  if ([v7 count])
  {
    id v8 = [v7 objectAtIndexedSubscript:0];
    [v5 setObject:v8 forKeyedSubscript:@"identifier"];
  }
  if ((unint64_t)[v7 count] >= 2)
  {
    uint64_t v9 = [v7 objectAtIndexedSubscript:1];
    if ([v9 longLongValue])
    {
      uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", objc_msgSend(v9, "longLongValue"));
      [v5 setObject:v10 forKeyedSubscript:@"account"];
    }
  }

  return v5;
}

+ (id)_dateFromString:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F28C10], "ams_serverFriendlyFormatter");
  id v5 = [v4 dateFromString:v3];

  if (!v5)
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F28C10], "ams_serverFriendlyLocalTimeZoneFormatter");
    id v5 = [v6 dateFromString:v3];
  }
  return v5;
}

- (id)generateItem
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  uint64_t v47 = 0;
  char v48 = &v47;
  uint64_t v49 = 0x2050000000;
  id v3 = (void *)getFLFollowUpItemClass_softClass;
  uint64_t v50 = getFLFollowUpItemClass_softClass;
  if (!getFLFollowUpItemClass_softClass)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getFLFollowUpItemClass_block_invoke;
    long long v53 = &unk_1E559EC70;
    long long v54 = &v47;
    __getFLFollowUpItemClass_block_invoke((uint64_t)buf);
    id v3 = (void *)v48[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v47, 8);
  id v5 = objc_alloc_init(v4);
  objc_msgSend(v5, "setDisplayStyle:", -[AMSFollowUpItem displayStyle](self, "displayStyle"));
  id v6 = [(AMSFollowUpItem *)self expirationDate];
  [v5 setExpirationDate:v6];

  [v5 setExtensionIdentifier:@"com.apple.AppleMediaServices.FollowUpExtension"];
  uint64_t v7 = [(AMSFollowUpItem *)self groupIdentifier];
  [v5 setGroupIdentifier:v7];

  id v8 = [(AMSFollowUpItem *)self footer];
  [v5 setInformativeFooterText:v8];

  uint64_t v9 = [(AMSFollowUpItem *)self informativeText];
  [v5 setInformativeText:v9];

  uint64_t v10 = [(AMSFollowUpItem *)self title];
  [v5 setTitle:v10];

  uint64_t v11 = [(AMSFollowUpItem *)self backingIdentifier];
  [v5 setUniqueIdentifier:v11];

  id v12 = [(AMSFollowUpItem *)self bundleIconName];
  LOBYTE(v11) = v12 == 0;

  if ((v11 & 1) == 0)
  {
    [v5 setRepresentingBundlePath:@"/System/Library/PrivateFrameworks/AppleMediaServicesUI.framework"];
    uint64_t v13 = [(AMSFollowUpItem *)self bundleIconName];
    [v5 setBundleIconName:v13];
  }
  uint64_t v14 = [(AMSFollowUpItem *)self userInfo];
  uint64_t v15 = (void *)[v14 mutableCopy];

  uint64_t v16 = [(AMSFollowUpItem *)self metricsEvent];

  if (v16)
  {
    char v17 = [(AMSFollowUpItem *)self metricsEvent];
    char v18 = [v17 underlyingDictionary];
    [v15 setObject:v18 forKeyedSubscript:@"AMSMetrics"];
  }
  if ([(AMSFollowUpItem *)self isExpirationDateHidden])
  {
    BOOL v19 = getFLUserInfoPropertyDontDisplayDate();
    [v15 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v19];
  }
  [v5 setUserInfo:v15];
  if ([(AMSFollowUpItem *)self shouldPostNotification])
  {
    uint64_t v20 = +[AMSLogConfig sharedFollowUpConfig];
    if (!v20)
    {
      uint64_t v20 = +[AMSLogConfig sharedConfig];
    }
    long long v21 = [v20 OSLogObject];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      long long v22 = objc_opt_class();
      id v23 = v22;
      long long v24 = [(AMSFollowUpItem *)self logKey];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v22;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v24;
      _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Posting notification", buf, 0x16u);
    }
    id v25 = objc_alloc_init(AMSFollowUpNotification);
    uint64_t v26 = [(AMSFollowUpItem *)self title];
    BOOL v27 = v26 == 0;

    if (!v27)
    {
      char v28 = [(AMSFollowUpItem *)self title];
      [(AMSFollowUpNotification *)v25 setTitle:v28];
    }
    __int16 v29 = [(AMSFollowUpItem *)self informativeText];
    BOOL v30 = v29 == 0;

    if (!v30)
    {
      uint64_t v31 = [(AMSFollowUpItem *)self informativeText];
      [(AMSFollowUpNotification *)v25 setInformativeText:v31];
    }
    id v32 = [(AMSFollowUpNotification *)v25 generateNotification];
    [v5 setNotification:v32];
  }
  else
  {
    v33 = [(AMSFollowUpItem *)self notification];
    BOOL v34 = v33 == 0;

    if (v34) {
      goto LABEL_22;
    }
    id v35 = [(AMSFollowUpItem *)self notification];
    id v25 = [v35 generateNotification];

    [v5 setNotification:v25];
  }

LABEL_22:
  id v36 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v37 = [(AMSFollowUpItem *)self actions];
  uint64_t v38 = [v37 countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (v38)
  {
    uint64_t v39 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v44 != v39) {
          objc_enumerationMutation(v37);
        }
        uint64_t v41 = [*(id *)(*((void *)&v43 + 1) + 8 * i) generateAction];
        [v36 addObject:v41];
      }
      uint64_t v38 = [v37 countByEnumeratingWithState:&v43 objects:v51 count:16];
    }
    while (v38);
  }

  if ([v36 count]) {
    [v5 setActions:v36];
  }

  return v5;
}

- (id)postMetricsWithBag:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_MergedGlobals_111 != -1) {
    dispatch_once(&_MergedGlobals_111, &__block_literal_global_61);
  }
  id v5 = (id)qword_1EB38D920;
  id v6 = objc_alloc_init(AMSMutablePromise);
  uint64_t v7 = [(AMSFollowUpItem *)self metricsEvent];
  if (v7
    && (id v8 = (void *)v7,
        [(AMSFollowUpItem *)self metricsEvent],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v5 containsObject:v9],
        v9,
        v8,
        !v10))
  {
    uint64_t v11 = [(AMSFollowUpItem *)self metricsEvent];
    id v12 = [v11 underlyingDictionary];
    uint64_t v13 = +[AMSFollowUpMetricsEvent eventFromMetricsDictionary:v12];

    uint64_t v14 = +[AMSMetrics internalInstanceUsingBag:v4];
    [v14 enqueueEvent:v13];
    uint64_t v15 = [(AMSFollowUpItem *)self metricsEvent];
    [v5 addObject:v15];

    uint64_t v16 = +[AMSLogConfig sharedFollowUpConfig];
    if (!v16)
    {
      uint64_t v16 = +[AMSLogConfig sharedConfig];
    }
    char v17 = [v16 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      char v18 = objc_opt_class();
      id v19 = v18;
      uint64_t v20 = [(AMSFollowUpItem *)self logKey];
      int v22 = 138543618;
      id v23 = v18;
      __int16 v24 = 2114;
      id v25 = v20;
      _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Metrics event enqueued (impression)", (uint8_t *)&v22, 0x16u);
    }
    [(AMSMutablePromise *)v6 finishWithResult:MEMORY[0x1E4F1CC38]];
  }
  else
  {
    [(AMSMutablePromise *)v6 finishWithResult:MEMORY[0x1E4F1CC28]];
  }

  return v6;
}

uint64_t __38__AMSFollowUpItem_postMetricsWithBag___block_invoke()
{
  qword_1EB38D920 = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  return MEMORY[0x1F41817F8]();
}

- (BOOL)shouldOverwriteItem:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 identifier];
    if ([v6 length])
    {
      uint64_t v7 = [v5 identifier];
      id v8 = [(AMSFollowUpItem *)self identifier];
      int v9 = [v7 isEqualToString:v8];

      if (v9)
      {
        int v10 = [v5 account];
        uint64_t v11 = [(AMSFollowUpItem *)self account];
        if (v10 == (void *)v11)
        {

LABEL_11:
          uint64_t v19 = [(AMSFollowUpItem *)self priority];
          BOOL v18 = v19 <= [v5 priority];
          goto LABEL_12;
        }
        id v12 = (void *)v11;
        uint64_t v13 = [v5 account];
        uint64_t v14 = objc_msgSend(v13, "ams_DSID");
        uint64_t v15 = [(AMSFollowUpItem *)self account];
        uint64_t v16 = objc_msgSend(v15, "ams_DSID");
        int v17 = [v14 isEqualToNumber:v16];

        if (v17) {
          goto LABEL_11;
        }
      }
    }
    else
    {
    }
    BOOL v18 = 0;
  }
  else
  {
    BOOL v18 = 1;
  }
LABEL_12:

  return v18;
}

- (id)postMetricsWithBagContract:(id)a3
{
  id v4 = a3;
  id v5 = [[AMSContractBagShim alloc] initWithBagContract:v4];

  id v6 = [(AMSFollowUpItem *)self postMetricsWithBag:v5];

  return v6;
}

- (AMSFollowUpNotification)notification
{
  return self->_notification;
}

- (void)setNotification:(id)a3
{
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
}

- (NSString)bundleIconName
{
  return self->_bundleIconName;
}

- (void)setBundleIconName:(id)a3
{
}

- (BOOL)disableGrouping
{
  return self->_disableGrouping;
}

- (void)setDisableGrouping:(BOOL)a3
{
  self->_disableGrouping = a3;
}

- (int64_t)displayStyle
{
  return self->_displayStyle;
}

- (void)setDisplayStyle:(int64_t)a3
{
  self->_displayStyle = a3;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (BOOL)isExpirationDateHidden
{
  return self->_expirationDateHidden;
}

- (void)setExpirationDateHidden:(BOOL)a3
{
  self->_expirationDateHidden = a3;
}

- (NSString)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
}

- (BOOL)isHardwareOffer
{
  return self->_hardwareOffer;
}

- (void)setHardwareOffer:(BOOL)a3
{
  self->_hardwareOffer = a3;
}

- (NSString)informativeText
{
  return self->_informativeText;
}

- (void)setInformativeText:(id)a3
{
}

- (BOOL)keepNotificationOnLockscreen
{
  return self->_keepNotificationOnLockscreen;
}

- (void)setKeepNotificationOnLockscreen:(BOOL)a3
{
  self->_keepNotificationOnLockscreen = a3;
}

- (AMSMetricsEvent)metricsEvent
{
  return self->_metricsEvent;
}

- (void)setMetricsEvent:(id)a3
{
}

- (BOOL)isNewDeviceOutreach
{
  return self->_newDeviceOutreach;
}

- (void)setNewDeviceOutreach:(BOOL)a3
{
  self->_newDeviceOutreach = a3;
}

- (BOOL)shouldPostNotification
{
  return self->_shouldPostNotification;
}

- (void)setShouldPostNotification:(BOOL)a3
{
  self->_shouldPostNotification = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
}

- (OS_dispatch_queue)metricsQueue
{
  return self->_metricsQueue;
}

- (void)setMetricsQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_metricsEvent, 0);
  objc_storeStrong((id *)&self->_informativeText, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_bundleIconName, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_notification, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end