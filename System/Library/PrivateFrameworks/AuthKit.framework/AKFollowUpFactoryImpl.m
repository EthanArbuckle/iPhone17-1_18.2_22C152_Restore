@interface AKFollowUpFactoryImpl
- (BOOL)IsFollowUpItemNotificationForced:(id)a3;
- (BOOL)_itemShouldSuppressNotification:(id)a3;
- (NSString)bundleIconName;
- (NSString)extensionIdentifier;
- (NSString)representingBundlePath;
- (id)_actionFromInfo:(id)a3 pushMessageInfo:(id)a4;
- (id)_actionsFromPayload:(id)a3 pushMessageInfo:(id)a4;
- (id)_clearAction;
- (id)_extensionIDFromPayload:(id)a3;
- (id)_itemFromPayload:(id)a3 pushMessageInfo:(id)a4 withAltDSID:(id)a5;
- (id)_notificationFromPayload:(id)a3 pushMessageInfo:(id)a4;
- (id)actionWithTitle:(id)a3 andActionKey:(id)a4;
- (id)itemIdentifiersRequiringNotificationClearFromPayload:(id)a3;
- (id)itemsForAltDSID:(id)a3 pushMessageInfo:(id)a4 fromIDMSPayload:(id)a5;
- (void)setBundleIconName:(id)a3;
- (void)setExtensionIdentifier:(id)a3;
- (void)setRepresentingBundlePath:(id)a3;
@end

@implementation AKFollowUpFactoryImpl

- (id)itemsForAltDSID:(id)a3 pushMessageInfo:(id)a4 fromIDMSPayload:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __73__AKFollowUpFactoryImpl_itemsForAltDSID_pushMessageInfo_fromIDMSPayload___block_invoke;
  v14[3] = &unk_1E57614E0;
  v14[4] = self;
  id v15 = v9;
  id v16 = v8;
  id v10 = v8;
  id v11 = v9;
  v12 = objc_msgSend(a5, "aaf_map:", v14);

  return v12;
}

uint64_t __73__AKFollowUpFactoryImpl_itemsForAltDSID_pushMessageInfo_fromIDMSPayload___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _itemFromPayload:a2 pushMessageInfo:*(void *)(a1 + 40) withAltDSID:*(void *)(a1 + 48)];
}

- (id)itemIdentifiersRequiringNotificationClearFromPayload:(id)a3
{
  return (id)objc_msgSend(a3, "aaf_map:", &__block_literal_global_29);
}

id __78__AKFollowUpFactoryImpl_itemIdentifiersRequiringNotificationClearFromPayload___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 objectForKeyedSubscript:@"notification"];
  v4 = [v3 objectForKeyedSubscript:@"dismiss"];
  if ([v4 BOOLValue])
  {
    v5 = [v2 objectForKeyedSubscript:@"id"];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_itemShouldSuppressNotification:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"id"];
  int v4 = [v3 isEqualToString:@"adpUpsell"];
  if (v4)
  {
    v5 = _AKLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_193494000, v5, OS_LOG_TYPE_DEFAULT, "adpUpsell CFU should not send a notification.", v7, 2u);
    }
  }
  return v4;
}

- (id)_itemFromPayload:(id)a3 pushMessageInfo:(id)a4 withAltDSID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v72 = a5;
  id v10 = _AKLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[AKFollowUpFactoryImpl _itemFromPayload:pushMessageInfo:withAltDSID:]((uint64_t)v8, v10, v11, v12, v13, v14, v15, v16);
  }

  v17 = [v8 objectForKeyedSubscript:@"id"];
  v18 = +[AKFeatureManager sharedManager];
  if ([v18 isADPExpansionViaCFUEnabled])
  {

    goto LABEL_9;
  }
  int v19 = [v17 isEqualToString:@"adpUpsell"];

  if (!v19)
  {
LABEL_9:
    FLFollowUpItemClass = (objc_class *)CoreFollowUpLibraryCore();
    if (FLFollowUpItemClass) {
      FLFollowUpItemClass = (objc_class *)getFLFollowUpItemClass();
    }
    id v22 = objc_alloc_init(FLFollowUpItemClass);
    v71 = v17;
    [v22 setUniqueIdentifier:v17];
    v20 = [v8 objectForKeyedSubscript:@"bundlePath"];
    v24 = [v8 objectForKeyedSubscript:@"iconName"];
    v25 = [v8 objectForKeyedSubscript:@"notifyingAppBundleID"];
    v26 = [(AKFollowUpFactoryImpl *)self _extensionIDFromPayload:v8];
    [v22 setExtensionIdentifier:v26];

    v27 = [(AKFollowUpFactoryImpl *)self _actionsFromPayload:v8 pushMessageInfo:v9];
    [v22 setActions:v27];

    v28 = [(AKFollowUpFactoryImpl *)self _notificationFromPayload:v8 pushMessageInfo:v9];
    [v22 setNotification:v28];

    v29 = [v8 objectForKeyedSubscript:@"title"];
    if (v29)
    {
      [v22 setTitle:v29];
    }
    else
    {
      v30 = [v22 notification];
      v31 = [v30 title];
      [v22 setTitle:v31];
    }
    v32 = [v8 objectForKeyedSubscript:@"body"];
    [v22 setInformativeText:v32];

    if (CoreFollowUpLibraryCore())
    {
      v33 = getFLGroupIdentifierAccount();
      [v22 setGroupIdentifier:v33];

      if (v20)
      {
LABEL_16:
        v34 = v22;
        p_isa = (NSString *)&v20->isa;
LABEL_19:
        [v34 setRepresentingBundlePath:p_isa];
        if (v24)
        {
          v36 = v22;
          bundleIconName = v24;
        }
        else
        {
          bundleIconName = self->_bundleIconName;
          v36 = v22;
        }
        [v36 setBundleIconName:bundleIconName];
        v38 = [v8 objectForKeyedSubscript:@"priority"];
        uint64_t v39 = [v38 integerValue];

        if (v39 == 1) {
          uint64_t v40 = 1;
        }
        else {
          uint64_t v40 = 4 * (v39 == 2);
        }
        [v22 setDisplayStyle:v40];
        v41 = [v8 objectForKeyedSubscript:@"zeroAction"];
        int v42 = [v41 BOOLValue];

        if (v42) {
          objc_msgSend(v22, "setDisplayStyle:", objc_msgSend(v22, "displayStyle") | 2);
        }
        v43 = [v8 objectForKeyedSubscript:@"badgeOnly"];
        int v44 = [v43 BOOLValue];

        if (v44) {
          objc_msgSend(v22, "setDisplayStyle:", objc_msgSend(v22, "displayStyle") | 8);
        }
        v45 = [v8 objectForKeyedSubscript:@"omitBadge"];
        int v46 = [v45 BOOLValue];

        if (v46) {
          objc_msgSend(v22, "setDisplayStyle:", objc_msgSend(v22, "displayStyle") | 0x10);
        }
        v47 = [MEMORY[0x1E4F1CA60] dictionary];
        v48 = v47;
        if (v72) {
          [v47 setObject:v72 forKeyedSubscript:@"AKFollowUpAltDSIDKey"];
        }
        v49 = [v8 objectForKeyedSubscript:@"idmsdata"];

        if (v49)
        {
          v50 = [v8 objectForKeyedSubscript:@"idmsdata"];
          [v48 setObject:v50 forKeyedSubscript:@"idmsdata"];
        }
        v51 = [v9 objectForKeyedSubscript:@"txnid"];

        if (v51)
        {
          v52 = [v9 objectForKeyedSubscript:@"txnid"];
          [v48 setObject:v52 forKeyedSubscript:@"txnid"];
        }
        v53 = [v9 objectForKeyedSubscript:@"cmd"];

        if (v53)
        {
          v54 = [v9 objectForKeyedSubscript:@"cmd"];
          [v48 setObject:v54 forKeyedSubscript:@"cmd"];
        }
        if (v25)
        {
          v55 = _AKLogSystem();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG)) {
            -[AKFollowUpFactoryImpl _itemFromPayload:pushMessageInfo:withAltDSID:]((uint64_t)v25, v55, v56, v57, v58, v59, v60, v61);
          }

          [v48 setObject:v25 forKeyedSubscript:@"notifyingAppId"];
        }
        [v22 setUserInfo:v48];
        if ([(AKFollowUpFactoryImpl *)self _itemShouldSuppressNotification:v8])
        {
          v62 = _AKLogSystem();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG)) {
            -[AKFollowUpFactoryImpl _itemFromPayload:pushMessageInfo:withAltDSID:](v62, v63, v64, v65, v66, v67, v68, v69);
          }

          [v22 setNotification:0];
        }

        v17 = v71;
        v21 = v72;
        goto LABEL_48;
      }
    }
    else
    {
      [v22 setGroupIdentifier:0];
      if (v20) {
        goto LABEL_16;
      }
    }
    p_isa = self->_representingBundlePath;
    v34 = v22;
    goto LABEL_19;
  }
  v20 = _AKLogSystem();
  v21 = v72;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_193494000, v20, OS_LOG_TYPE_DEFAULT, "Excluding ADP upsell follow up from returned items because feature flag is off.", buf, 2u);
  }
  id v22 = 0;
LABEL_48:

  return v22;
}

- (id)_extensionIDFromPayload:(id)a3
{
  int v4 = [a3 objectForKeyedSubscript:@"extension"];
  v5 = v4;
  if (v4 && [v4 length])
  {
    if ([v5 isEqual:@"data"])
    {
      v6 = AKFollowUpExtensionIdentifierCDP;
LABEL_7:
      v7 = *v6;
      goto LABEL_12;
    }
    if ([v5 isEqual:@"account"])
    {
      v6 = AKFollowUpServerUIExtensionIdentifier;
      goto LABEL_7;
    }
    id v8 = _AKLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[AKFollowUpFactoryImpl _extensionIDFromPayload:]((uint64_t)v5, v8);
    }
  }
  v7 = [(AKFollowUpFactoryImpl *)self extensionIdentifier];
LABEL_12:
  id v9 = v7;

  return v9;
}

- (id)_actionsFromPayload:(id)a3 pushMessageInfo:(id)a4
{
  id v6 = a4;
  v7 = [a3 objectForKeyedSubscript:@"actions"];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__AKFollowUpFactoryImpl__actionsFromPayload_pushMessageInfo___block_invoke;
  v11[3] = &unk_1E5761528;
  v11[4] = self;
  id v12 = v6;
  id v8 = v6;
  id v9 = objc_msgSend(v7, "aaf_map:", v11);

  return v9;
}

uint64_t __61__AKFollowUpFactoryImpl__actionsFromPayload_pushMessageInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _actionFromInfo:a2 pushMessageInfo:*(void *)(a1 + 40)];
}

- (id)_actionFromInfo:(id)a3 pushMessageInfo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  FLFollowUpActionClass = (objc_class *)CoreFollowUpLibraryCore();
  if (FLFollowUpActionClass) {
    FLFollowUpActionClass = (objc_class *)getFLFollowUpActionClass();
  }
  id v8 = objc_alloc_init(FLFollowUpActionClass);
  v20 = [v5 objectForKeyedSubscript:@"urlKey"];
  id v9 = [v5 objectForKeyedSubscript:@"AKAction"];
  id v10 = [v5 objectForKeyedSubscript:@"AKNativeAction"];
  uint64_t v11 = [v5 objectForKeyedSubscript:@"url"];
  id v12 = [v5 objectForKeyedSubscript:@"localUrlKey"];
  uint64_t v13 = [v5 objectForKeyedSubscript:@"root"];
  uint64_t v14 = [v6 objectForKeyedSubscript:@"cmd"];

  int v15 = [v14 unsignedIntValue];
  uint64_t v16 = [MEMORY[0x1E4F1CA60] dictionary];
  v17 = v16;
  if (v9) {
    [v16 setObject:v9 forKeyedSubscript:@"ak-action"];
  }
  if (v10) {
    [v17 setObject:v10 forKeyedSubscript:@"ak-native-action"];
  }
  if (v20) {
    [v17 setObject:v20 forKeyedSubscript:@"AKFollowUpServerURL"];
  }
  if (v11) {
    [v17 setObject:v11 forKeyedSubscript:@"AKFollowUpSafariURL"];
  }
  if (v12) {
    [v17 setObject:v12 forKeyedSubscript:@"AKFollowUpLocalURLKey"];
  }
  if (v13) {
    [v17 setObject:v13 forKeyedSubscript:@"AKFollowUpAppleAccountRootKey"];
  }
  if (v15 == 1900) {
    [v8 setIdentifier:@"continuity_push_followup_notification"];
  }
  [v8 setUserInfo:v17];
  v18 = [v5 objectForKeyedSubscript:@"title"];
  [v8 setLabel:v18];

  return v8;
}

- (id)_notificationFromPayload:(id)a3 pushMessageInfo:(id)a4
{
  v103[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 objectForKeyedSubscript:@"notification"];
  id v9 = [v7 objectForKeyedSubscript:@"cmd"];
  int v10 = [v9 unsignedIntValue];

  if (v8)
  {
    FLFollowUpNotificationClass = (objc_class *)CoreFollowUpLibraryCore();
    id v95 = v6;
    if (FLFollowUpNotificationClass) {
      FLFollowUpNotificationClass = (objc_class *)getFLFollowUpNotificationClass();
    }
    id v12 = objc_alloc_init(FLFollowUpNotificationClass);
    uint64_t v13 = [v8 objectForKeyedSubscript:@"body"];
    [v12 setInformativeText:v13];

    uint64_t v14 = [v8 objectForKeyedSubscript:@"title"];
    [v12 setTitle:v14];

    int v15 = [v8 objectForKeyedSubscript:@"frequency"];
    [v15 doubleValue];
    objc_msgSend(v12, "setFrequency:");

    uint64_t v16 = [v8 objectForKeyedSubscript:@"delay"];
    [v16 doubleValue];
    objc_msgSend(v12, "setFirstNotificationDelay:");

    v17 = [v8 objectForKeyedSubscript:@"force"];
    int v18 = [v17 BOOLValue];

    v96 = self;
    if (v18)
    {
      int v19 = [v12 options];
      uint64_t v20 = CoreFollowUpLibraryCore();
      if (v20)
      {
        v21 = getFLNotificationOptionForce();
      }
      else
      {
        v21 = 0;
      }
      v103[0] = v21;
      v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v103 count:1];
      v24 = [v19 setByAddingObjectsFromArray:v23];
      [v12 setOptions:v24];

      if (v20) {
      self = v96;
      }
    }
    v25 = [v8 objectForKeyedSubscript:@"osAlert"];
    int v26 = [v25 BOOLValue];

    if (v26)
    {
      v27 = [v12 options];
      uint64_t v28 = CoreFollowUpLibraryCore();
      if (v28)
      {
        v29 = getFLNotificationOptionSpringboardAlert();
      }
      else
      {
        v29 = 0;
      }
      v102 = v29;
      v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v102 count:1];
      v31 = [v27 setByAddingObjectsFromArray:v30];
      [v12 setOptions:v31];

      if (v28) {
      self = v96;
      }
    }
    id v94 = v7;
    int v32 = v10;
    v33 = [v8 objectForKeyedSubscript:@"osAlertActionOnly"];
    int v34 = [v33 BOOLValue];

    if (v34)
    {
      v35 = _AKLogSystem();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
        -[AKFollowUpFactoryImpl _notificationFromPayload:pushMessageInfo:](v35, v36, v37, v38, v39, v40, v41, v42);
      }

      v43 = [v12 options];
      uint64_t v44 = CoreFollowUpLibraryCore();
      if (v44)
      {
        v45 = getFLNotificationOptionSpringboardAlert();
      }
      else
      {
        v45 = 0;
      }
      v101[0] = v45;
      uint64_t v46 = CoreFollowUpLibraryCore();
      if (v46)
      {
        v47 = getFLNotificationOptionSpringboardAlertActionOnly();
      }
      else
      {
        v47 = 0;
      }
      v101[1] = v47;
      v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v101 count:2];
      v49 = [v43 setByAddingObjectsFromArray:v48];
      [v12 setOptions:v49];

      if (v46) {
      if (v44)
      }

      self = v96;
    }
    v50 = [v8 objectForKeyedSubscript:@"bannerAlert"];
    int v51 = [v50 BOOLValue];

    if (v51)
    {
      v52 = [v12 options];
      uint64_t v53 = CoreFollowUpLibraryCore();
      if (v53)
      {
        v54 = getFLNotificationOptionBannerAlert();
      }
      else
      {
        v54 = 0;
      }
      v100 = v54;
      v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v100 count:1];
      uint64_t v56 = [v52 setByAddingObjectsFromArray:v55];
      [v12 setOptions:v56];

      if (v53) {
    }
      }
    uint64_t v57 = [v8 objectForKeyedSubscript:@"defbtn"];

    if (v57)
    {
      uint64_t v58 = [v8 objectForKeyedSubscript:@"defbtn"];
      uint64_t v59 = [(AKFollowUpFactoryImpl *)self actionWithTitle:v58 andActionKey:@"continue"];
      [v12 setActivateAction:v59];
    }
    uint64_t v60 = [v8 objectForKeyedSubscript:@"albtn"];
    id v22 = v60;
    if (v60 && [v60 length])
    {
      uint64_t v61 = [v8 objectForKeyedSubscript:@"albtn"];
      v62 = [(AKFollowUpFactoryImpl *)self actionWithTitle:v61 andActionKey:@"cancel"];
      [v12 setClearAction:v62];
    }
    else
    {
      uint64_t v61 = [(AKFollowUpFactoryImpl *)self _clearAction];
      [v12 setClearAction:v61];
    }

    if (v32 == 1900)
    {
      uint64_t v63 = _AKLogSystem();
      id v7 = v94;
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG)) {
        -[AKFollowUpFactoryImpl _notificationFromPayload:pushMessageInfo:](v63, v64, v65, v66, v67, v68, v69, v70);
      }

      v71 = [(AKFollowUpFactoryImpl *)self _actionsFromPayload:v95 pushMessageInfo:v94];
      id v72 = [v71 firstObject];

      if (v72)
      {
        v73 = [v71 firstObject];
        [v12 setActivateAction:v73];
      }
      v74 = [v12 options];
      uint64_t v75 = CoreFollowUpLibraryCore();
      if (v75)
      {
        v76 = getFLNotificationOptionExtensionActions();
      }
      else
      {
        v76 = 0;
      }
      v99 = v76;
      v77 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v99 count:1];
      v78 = [v74 setByAddingObjectsFromArray:v77];
      [v12 setOptions:v78];

      if (v75) {
      v79 = [v12 options];
      }
      uint64_t v80 = CoreFollowUpLibraryCore();
      if (v80)
      {
        v81 = getFLNotificationOptionExtensionForNotification();
      }
      else
      {
        v81 = 0;
      }
      v98 = v81;
      v82 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v98 count:1];
      v83 = [v79 setByAddingObjectsFromArray:v82];
      [v12 setOptions:v83];

      if (v80) {
      if (v22 && [v22 length])
      }
      {
        v84 = _AKLogSystem();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG)) {
          -[AKFollowUpFactoryImpl _notificationFromPayload:pushMessageInfo:](v84, v85, v86, v87, v88, v89, v90, v91);
        }

        v92 = [(AKFollowUpFactoryImpl *)v96 actionWithTitle:v22 andActionKey:@"clear_followup_notification"];
        [v12 setClearAction:v92];
      }
      id v6 = v95;
    }
    else
    {
      id v7 = v94;
      id v6 = v95;
    }
  }
  else
  {
    id v22 = _AKLogSystem();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193494000, v22, OS_LOG_TYPE_DEFAULT, "Couldn't find pyaload data to post notification.", buf, 2u);
    }
    id v12 = 0;
  }

  return v12;
}

- (id)_clearAction
{
  FLFollowUpActionClass = (objc_class *)CoreFollowUpLibraryCore();
  if (FLFollowUpActionClass) {
    FLFollowUpActionClass = (objc_class *)getFLFollowUpActionClass();
  }
  id v3 = objc_alloc_init(FLFollowUpActionClass);
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  [v4 setObject:@"clear_followup_notification" forKeyedSubscript:@"ak-action"];
  [v3 setUserInfo:v4];

  return v3;
}

- (id)actionWithTitle:(id)a3 andActionKey:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  FLFollowUpActionClass = (objc_class *)CoreFollowUpLibraryCore();
  if (FLFollowUpActionClass) {
    FLFollowUpActionClass = (objc_class *)getFLFollowUpActionClass();
  }
  id v8 = objc_alloc_init(FLFollowUpActionClass);
  [v8 setLabel:v6];

  uint64_t v11 = @"ak-action";
  v12[0] = v5;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];

  [v8 setUserInfo:v9];

  return v8;
}

- (BOOL)IsFollowUpItemNotificationForced:(id)a3
{
  id v3 = [a3 notification];
  int v4 = [v3 options];
  if (CoreFollowUpLibraryCore())
  {
    id v5 = getFLNotificationOptionForce();
    char v6 = [v4 containsObject:v5];
  }
  else
  {
    char v6 = [v4 containsObject:0];
  }

  return v6;
}

- (NSString)extensionIdentifier
{
  return self->_extensionIdentifier;
}

- (void)setExtensionIdentifier:(id)a3
{
}

- (NSString)representingBundlePath
{
  return self->_representingBundlePath;
}

- (void)setRepresentingBundlePath:(id)a3
{
}

- (NSString)bundleIconName
{
  return self->_bundleIconName;
}

- (void)setBundleIconName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIconName, 0);
  objc_storeStrong((id *)&self->_representingBundlePath, 0);

  objc_storeStrong((id *)&self->_extensionIdentifier, 0);
}

- (void)_itemFromPayload:(uint64_t)a3 pushMessageInfo:(uint64_t)a4 withAltDSID:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_itemFromPayload:(uint64_t)a3 pushMessageInfo:(uint64_t)a4 withAltDSID:(uint64_t)a5 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_itemFromPayload:(uint64_t)a3 pushMessageInfo:(uint64_t)a4 withAltDSID:(uint64_t)a5 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_extensionIDFromPayload:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_193494000, a2, OS_LOG_TYPE_ERROR, "Unrecognized follow up extension identifier %{public}@. Please add support for this if necessary. Using extension identifier from factory property.", (uint8_t *)&v2, 0xCu);
}

- (void)_notificationFromPayload:(uint64_t)a3 pushMessageInfo:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_notificationFromPayload:(uint64_t)a3 pushMessageInfo:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_notificationFromPayload:(uint64_t)a3 pushMessageInfo:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end