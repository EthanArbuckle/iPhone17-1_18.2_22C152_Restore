@interface FollowUpControllerImpl
- (FollowUpControllerImpl)initWithRegistry:(const void *)a3;
- (id).cxx_construct;
- (id)_createCellularPlanFollowUpItemWithReason:(int)a3 userInfo:(id)a4 uniqueIdentifier:(id)a5;
- (id)_createInstallReplaceFollowUpItemWithReason:(int)a3 userInfo:(id)a4 uniqueIdentifier:(id)a5;
- (id)_createTurnOnWifiCallingFollowUp:(id)a3 userInfo:(id)a4;
- (id)_localize:(id)a3 keyName:(id)a4;
- (id)_textForReason:(int)a3 carrierName:(id)a4;
- (id)_titleForReason:(int)a3 carrierName:(id)a4 isNotification:(BOOL)a5;
- (id)getPendingFollowUpItems;
- (void)_clearFollowUpForCategory:(id)a3;
- (void)_clearFollowUpForIdentifier:(id)a3;
- (void)_createNoteForFollowupItem:(id)a3 withAction:(id)a4 reason:(int)a5 carrierName:(id)a6;
- (void)clearFollowUp:(int)a3;
- (void)clearFollowUpWithUID:(id)a3;
- (void)publishNotificationWithIdentifier:(id)a3 title:(id)a4 body:(id)a5 userInfo:(id)a6;
- (void)showFollowUp:(int)a3 userInfo:(id)a4 withUniqueIdentifier:(id)a5;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation FollowUpControllerImpl

- (FollowUpControllerImpl)initWithRegistry:(const void *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)FollowUpControllerImpl;
  v4 = [(FollowUpControllerImpl *)&v12 init];
  v5 = v4;
  if (v4)
  {
    v7 = *(Registry **)a3;
    uint64_t v6 = *((void *)a3 + 1);
    if (v6) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v4->fRegistry.__cntrl_;
    v5->fRegistry.__ptr_ = v7;
    v5->fRegistry.__cntrl_ = (__shared_weak_count *)v6;
    if (cntrl) {
      sub_10004D2C8(cntrl);
    }
    v9 = (UNUserNotificationCenter *)[objc_alloc((Class)UNUserNotificationCenter) initWithBundleIdentifier:@"com.apple.SIMSetupUIService"];
    fUserNotificationCenter = v5->fUserNotificationCenter;
    v5->fUserNotificationCenter = v9;

    [(UNUserNotificationCenter *)v5->fUserNotificationCenter setDelegate:v5];
    [(UNUserNotificationCenter *)v5->fUserNotificationCenter setWantsNotificationResponsesDelivered];
  }
  return v5;
}

- (void)showFollowUp:(int)a3 userInfo:(id)a4 withUniqueIdentifier:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v15 = a4;
  id v8 = a5;
  if ((v6 - 3) >= 5)
  {
    if (v6 == 8)
    {
      uint64_t v10 = [(FollowUpControllerImpl *)self _createInstallReplaceFollowUpItemWithReason:8 userInfo:v15 uniqueIdentifier:v8];
    }
    else
    {
      if (v6 != 1)
      {
        v11 = 0;
        goto LABEL_7;
      }
      uint64_t v10 = [(FollowUpControllerImpl *)self _createTurnOnWifiCallingFollowUp:v8 userInfo:v15];
    }
  }
  else
  {
    uint64_t v10 = [(FollowUpControllerImpl *)self _createCellularPlanFollowUpItemWithReason:v6 userInfo:v15 uniqueIdentifier:v8];
  }
  v11 = (void *)v10;
  if (v10)
  {
    fFollowUpController = self->fFollowUpController;
    if (!fFollowUpController)
    {
      v13 = (FLFollowUpController *)[objc_alloc((Class)FLFollowUpController) initWithClientIdentifier:@"com.apple.CoreTelephony"];
      v14 = self->fFollowUpController;
      self->fFollowUpController = v13;

      fFollowUpController = self->fFollowUpController;
    }
    [(FLFollowUpController *)fFollowUpController postFollowUpItem:v11 error:0];
  }
LABEL_7:
}

- (void)clearFollowUp:(int)a3
{
  if ((a3 - 1) <= 7)
  {
    [(FollowUpControllerImpl *)self _clearFollowUpForCategory:off_101A68A50[a3 - 1]];
    if (a3 == 4)
    {
      [(UNUserNotificationCenter *)self->fUserNotificationCenter removeAllPendingNotificationRequests];
      [(UNUserNotificationCenter *)self->fUserNotificationCenter removeAllDeliveredNotifications];
    }
  }
  else
  {
    [(FollowUpControllerImpl *)self _clearFollowUpForIdentifier:&stru_101AC1B28];
  }
}

- (void)clearFollowUpWithUID:(id)a3
{
  id v5 = a3;
  [(FollowUpControllerImpl *)self _clearFollowUpForIdentifier:v5];
}

- (id)getPendingFollowUpItems
{
  fFollowUpController = self->fFollowUpController;
  if (!fFollowUpController)
  {
    id v5 = (FLFollowUpController *)[objc_alloc((Class)FLFollowUpController) initWithClientIdentifier:@"com.apple.CoreTelephony"];
    uint64_t v6 = self->fFollowUpController;
    self->fFollowUpController = v5;

    fFollowUpController = self->fFollowUpController;
  }
  uint64_t v9 = 0;
  v7 = [(FLFollowUpController *)fFollowUpController pendingFollowUpItems:&v9];

  return v7;
}

- (id)_titleForReason:(int)a3 carrierName:(id)a4 isNotification:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  ServiceMap = (std::mutex *)Registry::getServiceMap(v9, self->fRegistry.__ptr_);
  v11 = ServiceMap;
  if ((v12 & 0x8000000000000000) != 0)
  {
    v13 = (unsigned __int8 *)(v12 & 0x7FFFFFFFFFFFFFFFLL);
    uint64_t v14 = 5381;
    do
    {
      unint64_t v12 = v14;
      unsigned int v15 = *v13++;
      uint64_t v14 = (33 * v14) ^ v15;
    }
    while (v15);
  }
  std::mutex::lock(ServiceMap);
  unint64_t v31 = v12;
  v16 = sub_10004D37C(&v11[1].__m_.__sig, &v31);
  if (v16)
  {
    uint64_t v18 = v16[3];
    v17 = (std::__shared_weak_count *)v16[4];
    if (v17)
    {
      atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
      std::mutex::unlock(v11);
      atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
      sub_10004D2C8(v17);
      char v19 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v18 = 0;
  }
  std::mutex::unlock(v11);
  v17 = 0;
  char v19 = 1;
LABEL_9:
  char v20 = (*(uint64_t (**)(uint64_t))(*(void *)v18 + 64))(v18);
  if ((v19 & 1) == 0) {
    sub_10004D2C8(v17);
  }
  CFStringRef v21 = @"CTUF_CELLULAR_PLAN_SIMSETUP_TITLE";
  CFStringRef v22 = @"Set Up Cellular";
  v23 = &stru_101AC1B28;
  switch(a3)
  {
    case 0:
    case 1:
      goto LABEL_35;
    case 2:
      if (v20)
      {
        CFStringRef v24 = @"CTUF_WLANCALL_UP_TITLE";
        CFStringRef v25 = @"WLAN Calling Enabled";
        goto LABEL_33;
      }
      uint64_t v29 = [(FollowUpControllerImpl *)self _localize:@"Wi-Fi Calling Enabled" keyName:@"CTUF_WIFICALL_UP_TITLE"];
      goto LABEL_34;
    case 3:
      if (v5) {
        CFStringRef v22 = @"Finish Cellular Setup";
      }
      else {
        CFStringRef v22 = @"Finish Setting Up Cellular";
      }
      if (v5) {
        CFStringRef v21 = @"CTUF_PENDING_PLAN_NOTIFICATION_TITLE";
      }
      goto LABEL_28;
    case 4:
      if (v8)
      {
        CFStringRef v26 = @"CTUF_FINISH_CELLULAR_PLAN_SETTING_UP_TITLE_@";
        CFStringRef v27 = @"Finish Setting up your %@ Cellular Plan";
        goto LABEL_26;
      }
      CFStringRef v24 = @"CTUF_FINISH_CELLULAR_PLAN_SETTING_UP_TITLE";
      CFStringRef v25 = @"Finish Setting up your Cellular Plan";
      goto LABEL_33;
    case 5:
      if (v8)
      {
        CFStringRef v26 = @"CTUF_CELLULAR_PLAN_FAILED_TO_TRANSFER_TITLE_@";
        CFStringRef v27 = @"Failed to transfer %@ Cellular Plan";
LABEL_26:
        v23 = [(FollowUpControllerImpl *)self _localize:v27 keyName:v26];
LABEL_29:
        uint64_t v28 = [(__CFString *)v23 stringByReplacingOccurrencesOfString:@"%@" withString:v8];

        v23 = (__CFString *)v28;
      }
      else
      {
        CFStringRef v24 = @"CTUF_CELLULAR_PLAN_FAILED_TO_TRANSFER_TITLE";
        CFStringRef v25 = @"Failed to transfer Cellular Plan";
LABEL_33:
        uint64_t v29 = [(FollowUpControllerImpl *)self _localize:v25 keyName:v24];
LABEL_34:
        v23 = (__CFString *)v29;
      }
LABEL_35:

      return v23;
    case 6:
      goto LABEL_28;
    case 7:
      CFStringRef v22 = @"Finish Setting Up Cellular";
LABEL_28:
      v23 = [(FollowUpControllerImpl *)self _localize:v22 keyName:v21];
      if (v8) {
        goto LABEL_29;
      }
      goto LABEL_35;
    default:
      v23 = 0;
      if (!v8) {
        goto LABEL_35;
      }
      goto LABEL_29;
  }
}

- (id)_textForReason:(int)a3 carrierName:(id)a4
{
  id v6 = a4;
  ServiceMap = (std::mutex *)Registry::getServiceMap(v7, self->fRegistry.__ptr_);
  uint64_t v9 = ServiceMap;
  unint64_t v11 = v10;
  if ((v10 & 0x8000000000000000) != 0)
  {
    unint64_t v12 = (unsigned __int8 *)(v10 & 0x7FFFFFFFFFFFFFFFLL);
    uint64_t v13 = 5381;
    do
    {
      unint64_t v11 = v13;
      unsigned int v14 = *v12++;
      uint64_t v13 = (33 * v13) ^ v14;
    }
    while (v14);
  }
  std::mutex::lock(ServiceMap);
  unint64_t v42 = v11;
  unsigned int v15 = sub_10004D37C(&v9[1].__m_.__sig, &v42);
  if (v15)
  {
    uint64_t v17 = v15[3];
    v16 = (std::__shared_weak_count *)v15[4];
    if (v16)
    {
      atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
      std::mutex::unlock(v9);
      atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
      sub_10004D2C8(v16);
      char v18 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v17 = 0;
  }
  std::mutex::unlock(v9);
  v16 = 0;
  char v18 = 1;
LABEL_9:
  char v20 = (*(uint64_t (**)(uint64_t))(*(void *)v17 + 64))(v17);
  if ((v18 & 1) == 0) {
    sub_10004D2C8(v16);
  }
  CFStringRef v21 = (std::mutex *)Registry::getServiceMap(v19, self->fRegistry.__ptr_);
  CFStringRef v22 = v21;
  if ((v10 & 0x8000000000000000) != 0)
  {
    v23 = (unsigned __int8 *)(v10 & 0x7FFFFFFFFFFFFFFFLL);
    uint64_t v24 = 5381;
    do
    {
      unint64_t v10 = v24;
      unsigned int v25 = *v23++;
      uint64_t v24 = (33 * v24) ^ v25;
    }
    while (v25);
  }
  std::mutex::lock(v21);
  unint64_t v42 = v10;
  CFStringRef v26 = sub_10004D37C(&v22[1].__m_.__sig, &v42);
  if (v26)
  {
    uint64_t v28 = (GestaltUtilityInterface *)v26[3];
    CFStringRef v27 = (std::__shared_weak_count *)v26[4];
    if (v27)
    {
      atomic_fetch_add_explicit(&v27->__shared_owners_, 1uLL, memory_order_relaxed);
      std::mutex::unlock(v22);
      atomic_fetch_add_explicit(&v27->__shared_owners_, 1uLL, memory_order_relaxed);
      sub_10004D2C8(v27);
      char v29 = 0;
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v28 = 0;
  }
  std::mutex::unlock(v22);
  CFStringRef v27 = 0;
  char v29 = 1;
LABEL_19:
  int isIPad = GestaltUtilityInterface::isIPad(v28);
  if ((v29 & 1) == 0) {
    sub_10004D2C8(v27);
  }
  CFStringRef v31 = @"CTUF_CELLULAR_PLAN_READY_TO_INSTALL_TEXT";
  CFStringRef v32 = @"Tap this notification to finish your cellular plan set up.";
  switch(a3)
  {
    case 2:
      if (v20)
      {
        CFStringRef v31 = @"CTFU_TEXT_WLANCALL_ACTIVATED";
        CFStringRef v32 = @"Address on file is used for Emergency calls over WLAN. You can update it via provided link.";
        goto LABEL_36;
      }
      uint64_t v36 = [(FollowUpControllerImpl *)self _localize:@"Address on file is used for Emergency calls over Wi-Fi. You can update it via provided link." keyName:@"CTFU_TEXT_WIFICALL_ACTIVATED"];
      goto LABEL_37;
    case 3:
      if (v6)
      {
        if (isIPad) {
          CFStringRef v33 = @"CTFU_IPAD_ESIM_READY_TO_INSTALL_@";
        }
        else {
          CFStringRef v33 = @"CTFU_IPHONE_ESIM_READY_TO_INSTALL_@";
        }
        if (isIPad) {
          CFStringRef v34 = @"An eSIM from %@ is ready to be set up on this iPad.";
        }
        else {
          CFStringRef v34 = @"An eSIM from %@ is ready to be set up on this iPhone.";
        }
        v35 = [(FollowUpControllerImpl *)self _localize:v34 keyName:v33];
LABEL_38:
        v37 = [(__CFString *)v35 stringByReplacingOccurrencesOfString:@"%@" withString:v6];
      }
      else
      {
        if (isIPad) {
          CFStringRef v38 = @"CTFU_IPAD_ESIM_READY_TO_INSTALL";
        }
        else {
          CFStringRef v38 = @"CTFU_IPHONE_ESIM_READY_TO_INSTALL";
        }
        if (isIPad) {
          CFStringRef v39 = @"An eSIM is ready to be set up on this iPad.";
        }
        else {
          CFStringRef v39 = @"An eSIM is ready to be set up on this iPhone.";
        }
        v35 = [(FollowUpControllerImpl *)self _localize:v39 keyName:v38];
LABEL_47:
        v37 = v35;
        v35 = v37;
      }
      v40 = v37;

      return v40;
    case 4:
    case 6:
      goto LABEL_36;
    case 5:
      CFStringRef v31 = @"CTUF_CELLULAR_PLAN_FAILED_TO_TRANSFER_TEXT";
      CFStringRef v32 = @"Tap this notification to see the details";
      goto LABEL_36;
    case 7:
      CFStringRef v31 = @"CTFU_CELLULAR_PLAN_SETUP_REQUIRED_TEXT";
      CFStringRef v32 = @"You can transfer your phone number from another device or set up this iPhone with a new number.";
LABEL_36:
      uint64_t v36 = [(FollowUpControllerImpl *)self _localize:v32 keyName:v31];
LABEL_37:
      v35 = (__CFString *)v36;
      if (v6) {
        goto LABEL_38;
      }
      goto LABEL_47;
    default:
      v35 = &stru_101AC1B28;
      if (!v6) {
        goto LABEL_47;
      }
      goto LABEL_38;
  }
}

- (id)_localize:(id)a3 keyName:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  v23 = v6;
  if (v6) {
    CFRetain(v6);
  }
  ServiceMap = (std::mutex *)Registry::getServiceMap(v7, self->fRegistry.__ptr_);
  unint64_t v10 = ServiceMap;
  if (v11 < 0)
  {
    unint64_t v12 = (unsigned __int8 *)(v11 & 0x7FFFFFFFFFFFFFFFLL);
    uint64_t v13 = 5381;
    do
    {
      uint64_t v11 = v13;
      unsigned int v14 = *v12++;
      uint64_t v13 = (33 * v13) ^ v14;
    }
    while (v14);
  }
  std::mutex::lock(ServiceMap);
  uint64_t v24 = v11;
  unsigned int v15 = sub_10004D37C(&v10[1].__m_.__sig, (unint64_t *)&v24);
  if (!v15)
  {
    uint64_t v17 = 0;
LABEL_11:
    std::mutex::unlock(v10);
    v16 = 0;
    char v18 = 1;
    if (!v17) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  uint64_t v17 = v15[3];
  v16 = (std::__shared_weak_count *)v15[4];
  if (!v16) {
    goto LABEL_11;
  }
  atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
  std::mutex::unlock(v10);
  atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
  sub_10004D2C8(v16);
  char v18 = 0;
  if (v17)
  {
LABEL_12:
    (*(void (**)(void **__return_ptr, uint64_t, void, id, void *))(*(void *)v17 + 40))(&v22, v17, kAlertDialogLocalizationTable, v8, v23);
    uint64_t v19 = (uint64_t)v23;
    v23 = v22;
    uint64_t v24 = v19;
    CFStringRef v22 = 0;
    sub_1000558F4((const void **)&v24);
    sub_1000558F4((const void **)&v22);
  }
LABEL_13:
  if ((v18 & 1) == 0) {
    sub_10004D2C8(v16);
  }
  char v20 = v23;
  sub_1000558F4((const void **)&v23);

  return v20;
}

- (void)_clearFollowUpForIdentifier:(id)a3
{
  id v4 = a3;
  fFollowUpController = self->fFollowUpController;
  if (!fFollowUpController)
  {
    v7 = (FLFollowUpController *)[objc_alloc((Class)FLFollowUpController) initWithClientIdentifier:@"com.apple.CoreTelephony"];
    id v8 = self->fFollowUpController;
    self->fFollowUpController = v7;

    fFollowUpController = self->fFollowUpController;
  }
  id v10 = v4;
  uint64_t v9 = +[NSArray arrayWithObjects:&v10 count:1];
  [(FLFollowUpController *)fFollowUpController clearPendingFollowUpItemsWithUniqueIdentifiers:v9 error:0];
}

- (void)_clearFollowUpForCategory:(id)a3
{
  id v4 = a3;
  fFollowUpController = self->fFollowUpController;
  if (!fFollowUpController)
  {
    id v6 = (FLFollowUpController *)[objc_alloc((Class)FLFollowUpController) initWithClientIdentifier:@"com.apple.CoreTelephony"];
    v7 = self->fFollowUpController;
    self->fFollowUpController = v6;

    fFollowUpController = self->fFollowUpController;
  }
  uint64_t v17 = [(FLFollowUpController *)fFollowUpController pendingFollowUpItems:0];
  id v8 = objc_alloc_init((Class)NSMutableArray);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v17;
  id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v19;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        unsigned int v14 = [v13 categoryIdentifier];
        unsigned int v15 = [v14 isEqualToString:v4];

        if (v15)
        {
          v16 = [v13 uniqueIdentifier];
          [v8 addObject:v16];
        }
      }
      id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  if ([v8 count]) {
    [(FLFollowUpController *)self->fFollowUpController clearPendingFollowUpItemsWithUniqueIdentifiers:v8 error:0];
  }
}

- (id)_createTurnOnWifiCallingFollowUp:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  ServiceMap = (std::mutex *)Registry::getServiceMap(v8, self->fRegistry.__ptr_);
  id v10 = ServiceMap;
  if ((v11 & 0x8000000000000000) != 0)
  {
    unint64_t v12 = (unsigned __int8 *)(v11 & 0x7FFFFFFFFFFFFFFFLL);
    uint64_t v13 = 5381;
    do
    {
      unint64_t v11 = v13;
      unsigned int v14 = *v12++;
      uint64_t v13 = (33 * v13) ^ v14;
    }
    while (v14);
  }
  std::mutex::lock(ServiceMap);
  unint64_t v32 = v11;
  unsigned int v15 = sub_10004D37C(&v10[1].__m_.__sig, &v32);
  if (v15)
  {
    uint64_t v17 = v15[3];
    v16 = (std::__shared_weak_count *)v15[4];
    if (v16)
    {
      atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
      std::mutex::unlock(v10);
      atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
      sub_10004D2C8(v16);
      char v18 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v17 = 0;
  }
  std::mutex::unlock(v10);
  v16 = 0;
  char v18 = 1;
LABEL_9:
  int v19 = (*(uint64_t (**)(uint64_t))(*(void *)v17 + 64))(v17);
  if ((v18 & 1) == 0) {
    sub_10004D2C8(v16);
  }
  long long v20 = objc_opt_new();
  [v20 setUniqueIdentifier:v6];
  if (v19) {
    [(FollowUpControllerImpl *)self _localize:@"Turn on WLAN Calling" keyName:@"CTUF_TITLE_WLANCALL_NEED_ACTION"];
  }
  else {
  long long v21 = [(FollowUpControllerImpl *)self _localize:@"Turn on Wi-Fi Calling" keyName:@"CTUF_TITLE_WIFICALL_NEED_ACTION"];
  }
  [v20 setTitle:v21];

  if (v19) {
    [(FollowUpControllerImpl *)self _localize:@"WLAN Calling can't be turned on due to missing T&C or address on file." keyName:@"CTFU_TEXT_WLANCALL_NEED_ACTION"];
  }
  else {
  CFStringRef v22 = [(FollowUpControllerImpl *)self _localize:@"Wi-Fi Calling can't be turned on due to missing T&C or address on file." keyName:@"CTFU_TEXT_WIFICALL_NEED_ACTION"];
  }
  [v20 setInformativeText:v22];

  [v20 setExtensionIdentifier:@"com.apple.CoreTelephony.CTFollowUpExtension"];
  [v20 setDisplayStyle:1];
  [v20 setGroupIdentifier:FLGroupIdentifierAccount];
  [v20 setCategoryIdentifier:@"com.apple.coretelephony.wificalling-default.need-action"];
  [v20 setUserInfo:v7];
  v23 = objc_opt_new();
  [v23 setIdentifier:@"com.followup.showurl"];
  if (v19) {
    [(FollowUpControllerImpl *)self _localize:@"Turn On WLAN Calling" keyName:@"CTFU_LABEL_ACTION_TURN_ON_WLAN"];
  }
  else {
  uint64_t v24 = [(FollowUpControllerImpl *)self _localize:@"Turn On Wi-Fi Calling" keyName:@"CTFU_LABEL_ACTION_TURN_ON_WIFI"];
  }
  [v23 setLabel:v24];

  unsigned int v25 = objc_opt_new();
  [v25 setIdentifier:@"com.followup.dismiss"];
  CFStringRef v26 = [(FollowUpControllerImpl *)self _localize:@"Not Now" keyName:@"CTFU_LABEL_ACTION_NOTNOW"];
  [v25 setLabel:v26];

  v33[0] = v23;
  v33[1] = v25;
  CFStringRef v27 = +[NSArray arrayWithObjects:v33 count:2];
  [v20 setActions:v27];

  uint64_t v28 = objc_opt_new();
  if (v19) {
    [(FollowUpControllerImpl *)self _localize:@"Turn on WLAN Calling" keyName:@"CTUF_TITLE_WLANCALL_NEED_ACTION"];
  }
  else {
  char v29 = [(FollowUpControllerImpl *)self _localize:@"Turn on Wi-Fi Calling" keyName:@"CTUF_TITLE_WIFICALL_NEED_ACTION"];
  }
  [v28 setTitle:v29];

  if (v19) {
    [(FollowUpControllerImpl *)self _localize:@"WLAN Calling can't be turned on due to missing T&C or address on file." keyName:@"CTFU_TEXT_WLANCALL_NEED_ACTION"];
  }
  else {
  v30 = [(FollowUpControllerImpl *)self _localize:@"Wi-Fi Calling can't be turned on due to missing T&C or address on file." keyName:@"CTFU_TEXT_WIFICALL_NEED_ACTION"];
  }
  [v28 setInformativeText:v30];

  [v28 setFrequency:3600.0];
  [v28 setActivateAction:v23];
  [v28 setClearAction:v25];
  [v28 setFirstNotificationDelay:60.0];
  [v20 setNotification:v28];

  return v20;
}

- (void)_createNoteForFollowupItem:(id)a3 withAction:(id)a4 reason:(int)a5 carrierName:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v17 = a3;
  id v10 = a4;
  id v11 = a6;
  unint64_t v12 = objc_opt_new();
  uint64_t v13 = [(FollowUpControllerImpl *)self _titleForReason:v7 carrierName:v11 isNotification:1];
  [v12 setTitle:v13];

  unsigned int v14 = [(FollowUpControllerImpl *)self _textForReason:v7 carrierName:v11];
  [v12 setInformativeText:v14];

  [v12 setActivateAction:v10];
  unsigned int v15 = +[FLFollowUpNotification defaultOptions];
  v16 = [v15 setByAddingObject:FLNotificationOptionExtensionActions];
  [v12 setOptions:v16];

  [v17 setNotification:v12];
}

- (id)_createInstallReplaceFollowUpItemWithReason:(int)a3 userInfo:(id)a4 uniqueIdentifier:(id)a5
{
  id v8 = a4;
  id v56 = a5;
  if ((a3 - 3) > 5)
  {
    long long v21 = 0;
    goto LABEL_36;
  }
  [v8 objectForKeyedSubscript:@"CarrierName"];
  v58 = id v9 = CTEnhancedLinkQualityMetric_ptr;
  if ([v58 length]) {
    CFStringRef v10 = @"An update for your %@ eSIM is available for your";
  }
  else {
    CFStringRef v10 = @"An update for your eSIM is available for your";
  }
  ServiceMap = (std::mutex *)Registry::getServiceMap((uint64_t *)@"An update for your %@ eSIM is available for your", self->fRegistry.__ptr_);
  unint64_t v12 = ServiceMap;
  if ((v13 & 0x8000000000000000) != 0)
  {
    unsigned int v14 = (unsigned __int8 *)(v13 & 0x7FFFFFFFFFFFFFFFLL);
    uint64_t v15 = 5381;
    do
    {
      unint64_t v13 = v15;
      unsigned int v16 = *v14++;
      uint64_t v15 = (33 * v15) ^ v16;
    }
    while (v16);
  }
  std::mutex::lock(ServiceMap);
  unint64_t v59 = v13;
  id v17 = sub_10004D37C(&v12[1].__m_.__sig, &v59);
  if (!v17)
  {
    int v19 = 0;
    goto LABEL_13;
  }
  int v19 = (GestaltUtilityInterface *)v17[3];
  char v18 = (std::__shared_weak_count *)v17[4];
  if (!v18)
  {
LABEL_13:
    std::mutex::unlock(v12);
    char v18 = 0;
    char v20 = 1;
    goto LABEL_14;
  }
  atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
  std::mutex::unlock(v12);
  atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
  id v9 = CTEnhancedLinkQualityMetric_ptr;
  sub_10004D2C8(v18);
  char v20 = 0;
LABEL_14:
  int isIPad = GestaltUtilityInterface::isIPad(v19);
  CFStringRef v23 = @"iPhone.";
  if (isIPad) {
    CFStringRef v23 = @"iPad.";
  }
  v55 = +[NSString stringWithFormat:@"%@ %@ %@", v10, v23, @"You can choose to install it now, or you can update your eSIM later from Settings."];
  if ((v20 & 1) == 0) {
    sub_10004D2C8(v18);
  }
  id v24 = [v58 length];
  id v25 = [v58 length];
  if (v24) {
    CFStringRef v26 = @"A critical update for your %@ eSIM is available. It is recommended to update now. You can also update your eSIM later in Settings.";
  }
  else {
    CFStringRef v26 = @"A critical update for your eSIM is available. It is recommended to update now. You can also update your eSIM later in Settings.";
  }
  if (v25) {
    CFStringRef v27 = @"INSTALL_REPLACE_ESIM_LAST_DAY_MESSAGE_%@";
  }
  else {
    CFStringRef v27 = @"INSTALL_REPLACE_ESIM_LAST_DAY_MESSAGE";
  }
  v57 = [(FollowUpControllerImpl *)self _localize:v26 keyName:v27];
  long long v21 = objc_opt_new();
  uint64_t v28 = [(FollowUpControllerImpl *)self _localize:@"eSIM Update" keyName:@"INSTALL_REPLACE_ESIM_TITLE"];
  [v21 setTitle:v28];

  if ([v58 length]) {
    CFStringRef v29 = @"INSTALL_REPLACE_ESIM_FIRST_DAY_MESSAGE_%@";
  }
  else {
    CFStringRef v29 = @"INSTALL_REPLACE_ESIM_FIRST_DAY_MESSAGE";
  }
  v30 = [(FollowUpControllerImpl *)self _localize:v55 keyName:v29];
  [v21 setInformativeText:v30];

  if ([v58 length])
  {
    CFStringRef v31 = [v21 informativeText];
    unint64_t v32 = [v31 stringByReplacingOccurrencesOfString:@"%@" withString:v58];
    [v21 setInformativeText:v32];

    uint64_t v33 = [v57 stringByReplacingOccurrencesOfString:@"%@" withString:v58];

    v57 = (void *)v33;
  }
  [v21 setExtensionIdentifier:@"com.apple.CoreTelephony.CTFollowUpExtension"];
  [v21 setGroupIdentifier:FLGroupIdentifierDevice];
  unsigned int v34 = a3 - 1;
  if ((a3 - 1) > 7) {
    CFStringRef v35 = &stru_101AC1B28;
  }
  else {
    CFStringRef v35 = off_101A68A50[v34];
  }
  [v21 setCategoryIdentifier:v35];
  uint64_t v36 = objc_opt_new();
  [v36 setUserInfo:v8];
  v37 = [(FollowUpControllerImpl *)self _localize:@"Update" keyName:@"CBMessageAcceptButton"];
  [v36 setLabel:v37];

  [v36 setIdentifier:@"com.followup.install-replace"];
  if (v34 > 7) {
    CFStringRef v38 = &stru_101AC1B28;
  }
  else {
    CFStringRef v38 = off_101A68A50[v34];
  }
  CFStringRef v39 = v9[254];
  v40 = [v8 objectForKeyedSubscript:@"IccidHash"];
  v41 = [v39 stringWithFormat:@"%@.%@", v38, v40];
  [v21 setUniqueIdentifier:v41];

  v60 = v36;
  unint64_t v42 = +[NSArray arrayWithObjects:&v60 count:1];
  [v21 setActions:v42];

  v43 = objc_opt_new();
  [v43 setUserInfo:v8];
  v44 = [v36 label];
  [v43 setLabel:v44];

  [v43 setIdentifier:@"com.followup.install-replace-action"];
  v45 = objc_opt_new();
  [v45 setUserInfo:v8];
  [v45 setIdentifier:@"com.apple.coretelephony.cellularplan-default.plan-installreplace-dismiss"];
  v46 = [(FollowUpControllerImpl *)self _localize:@"Not Now" keyName:@"CTFU_LABEL_ACTION_NOTNOW"];
  [v45 setLabel:v46];

  v47 = +[NSMutableDictionary dictionaryWithDictionary:v8];
  [v47 setValue:v57 forKey:@"LastDayInformativeText"];
  v48 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", FLNotificationOptionForce, FLNotificationOptionSpringboardAlert, FLNotificationOptionNotificationCenter, FLNotificationOptionExtensionActions, 0);
  v49 = objc_opt_new();
  v50 = [v21 title];
  [v49 setTitle:v50];

  v51 = [v21 informativeText];
  [v49 setInformativeText:v51];

  [v49 setActivateAction:v43];
  [v49 setClearAction:v45];
  v52 = [v49 options];
  v53 = [v52 setByAddingObjectsFromSet:v48];
  [v49 setOptions:v53];

  [v49 setFrequency:10.0];
  [v21 setUserInfo:v47];
  [v21 setNotification:v49];

LABEL_36:

  return v21;
}

- (id)_createCellularPlanFollowUpItemWithReason:(int)a3 userInfo:(id)a4 uniqueIdentifier:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = a5;
  if ((v6 - 3) > 5)
  {
    CFStringRef v10 = 0;
  }
  else
  {
    CFStringRef v10 = objc_opt_new();
    id v11 = [v8 objectForKeyedSubscript:@"CarrierName"];
    unint64_t v12 = [(FollowUpControllerImpl *)self _titleForReason:v6 carrierName:v11 isNotification:0];
    [v10 setTitle:v12];

    unint64_t v13 = [(FollowUpControllerImpl *)self _textForReason:v6 carrierName:v11];
    [v10 setInformativeText:v13];

    [v10 setExtensionIdentifier:@"com.apple.CoreTelephony.CTFollowUpExtension"];
    [v10 setGroupIdentifier:FLGroupIdentifierDevice];
    [v10 setCategoryIdentifier:off_101A689E0[(int)v6 - 3]];
    if (v6 != 7) {
      [v10 setDisplayStyle:2];
    }
    unsigned int v14 = objc_opt_new();
    uint64_t v15 = objc_opt_new();
    [v14 setUserInfo:v8];
    switch((int)v6)
    {
      case 3:
        unsigned int v16 = [(FollowUpControllerImpl *)self _localize:@"Install Cellular Plan" keyName:@"CTFU_LABEL_ACTION_CELLULAR_PLAN_INSTALL"];
        [v14 setLabel:v16];

        [v14 setIdentifier:@"com.followup.install"];
        id v17 = [v8 objectForKeyedSubscript:@"CarrierName"];
        [(FollowUpControllerImpl *)self _createNoteForFollowupItem:v10 withAction:v14 reason:3 carrierName:v17];
        goto LABEL_9;
      case 4:
        char v18 = [(FollowUpControllerImpl *)self _localize:@"Install Cellular Plan" keyName:@"CTFU_LABEL_ACTION_CELLULAR_PLAN_INSTALL"];
        [v14 setLabel:v18];

        [v14 setIdentifier:@"com.followup.transfer-websheet"];
        id v17 = [v10 uniqueIdentifier];
        int v19 = [v10 title];
        char v20 = [v10 informativeText];
        [(FollowUpControllerImpl *)self publishNotificationWithIdentifier:v17 title:v19 body:v20 userInfo:v8];

LABEL_9:
        goto LABEL_12;
      case 6:
        long long v21 = [(FollowUpControllerImpl *)self _localize:@"Set Up Cellular" keyName:@"CTUF_CELLULAR_PLAN_SIMSETUP_TITLE"];
        [v14 setLabel:v21];

        [v14 setIdentifier:@"com.followup.setup"];
        [(FollowUpControllerImpl *)self _createNoteForFollowupItem:v10 withAction:v14 reason:6 carrierName:&stru_101AC1B28];
        goto LABEL_12;
      case 7:
        CFStringRef v23 = [(FollowUpControllerImpl *)self _localize:@"Install Cellular Plan" keyName:@"CTFU_LABEL_ACTION_CELLULAR_PLAN_INSTALL"];
        [v14 setLabel:v23];

        [v14 setIdentifier:@"com.apple.coretelephony.cellularplan-default.setup-required"];
        id v24 = [(FollowUpControllerImpl *)self _localize:@"Don't Install Cellular Plan" keyName:@"CTFU_LABEL_ACTION_CELLULAR_PLAN_NOT_INSTALL"];
        [v15 setLabel:v24];

        [v10 setUniqueIdentifier:v9];
        goto LABEL_14;
      default:
        if (v6 == 7)
        {
LABEL_14:
          v26[0] = v14;
          v26[1] = v15;
          CFStringRef v22 = +[NSArray arrayWithObjects:v26 count:2];
          [v10 setActions:v22];
        }
        else
        {
LABEL_12:
          CFStringRef v27 = v14;
          CFStringRef v22 = +[NSArray arrayWithObjects:&v27 count:1];
          [v10 setActions:v22];
        }

        break;
    }
  }

  return v10;
}

- (void)publishNotificationWithIdentifier:(id)a3 title:(id)a4 body:(id)a5 userInfo:(id)a6
{
  id v18 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  unint64_t v13 = objc_opt_new();
  unsigned int v14 = [(FollowUpControllerImpl *)self _localize:@"Settings" keyName:@"SETTINGS"];
  [v13 setHeader:v14];

  uint64_t v15 = +[UNNotificationIcon iconForApplicationIdentifier:@"com.apple.Preferences"];
  [v13 setIcon:v15];

  [v13 setTitle:v10];
  [v13 setBody:v11];
  [v13 setUserInfo:v12];
  unsigned int v16 = +[UNNotificationSound defaultSound];
  [v13 setSound:v16];

  [v13 setShouldBackgroundDefaultAction:1];
  id v17 = +[UNNotificationRequest requestWithIdentifier:v18 content:v13 trigger:0];
  [(UNUserNotificationCenter *)self->fUserNotificationCenter addNotificationRequest:v17 withCompletionHandler:0];
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v25 = a4;
  uint64_t v7 = (void (**)(void))a5;
  id v8 = [objc_alloc((Class)SBSRemoteAlertDefinition) initWithServiceName:@"com.apple.SIMSetupUIService" viewControllerClassName:@"TSSIMSetupSupportViewController"];
  id v9 = objc_opt_new();
  id v10 = [v25 notification];
  id v11 = [v10 request];
  id v12 = [v11 content];
  unint64_t v13 = [v12 userInfo];

  unsigned int v14 = objc_opt_new();
  [v14 setObject:&off_101AE64C0 forKey:@"FlowTypeKey"];
  [v14 setObject:&off_101AE64C0 forKey:@"RequestTypeKey"];
  uint64_t v15 = [v13 objectForKeyedSubscript:@"CarrierName"];
  [v14 setObject:v15 forKey:@"CarrierName"];

  unsigned int v16 = [v13 objectForKeyedSubscript:@"ServerURL"];
  [v14 setObject:v16 forKey:@"WebsheetURLKey"];

  id v17 = [v13 objectForKeyedSubscript:@"PostData"];

  if (v17)
  {
    id v18 = [v13 objectForKeyedSubscript:@"PostData"];
    [v14 setObject:v18 forKey:@"WebsheetPostdataKey"];
  }
  [v9 setUserInfo:v14];
  [(SBSRemoteAlertHandle *)self->fRemoteAlertHandle invalidate];
  int v19 = (SBSRemoteAlertHandle *)+[SBSRemoteAlertHandle newHandleWithDefinition:v8 configurationContext:v9];
  fRemoteAlertHandle = self->fRemoteAlertHandle;
  self->fRemoteAlertHandle = v19;

  long long v21 = objc_opt_new();
  [v21 setReason:@"Transfer Websheet"];
  [(SBSRemoteAlertHandle *)self->fRemoteAlertHandle activateWithContext:v21];
  CFStringRef v22 = [v25 notification];
  CFStringRef v23 = [v22 request];
  id v24 = [v23 identifier];
  [(FollowUpControllerImpl *)self _clearFollowUpForIdentifier:v24];

  if (v7) {
    v7[2](v7);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->fRemoteAlertHandle, 0);
  objc_storeStrong((id *)&self->fUserNotificationCenter, 0);
  objc_storeStrong((id *)&self->fFollowUpController, 0);
  cntrl = self->fRegistry.__cntrl_;
  if (cntrl)
  {
    sub_10004D2C8((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end