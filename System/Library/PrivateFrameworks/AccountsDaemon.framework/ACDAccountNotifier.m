@interface ACDAccountNotifier
+ (NSArray)allNotificationEntries;
+ (void)allNotificationEntries;
- (ACDAccountNotifier)init;
- (ACDAccountNotifier)initWithNotificationEntries:(id)a3;
- (BOOL)canRemoveAccount:(id)a3 inStore:(id)a4 error:(id *)a5;
- (BOOL)canSaveAccount:(id)a3 inStore:(id)a4 error:(id *)a5;
- (BOOL)postWillChangeNotificationForType:(int)a3 inStore:(id)a4 newAccount:(id)a5 oldAccount:(id)a6;
- (NSArray)notificationEntries;
- (id)_pluginsRegisteredForAccount:(id)a3;
- (id)_pluginsRegisteredForNewAccount:(id)a3 oldAccount:(id)a4 changeType:(int)a5;
- (id)_provisionedDataclassesForNewAccount:(id)a3 oldAccount:(id)a4;
- (id)_unsafe_pluginsRegisteredForNewAccount:(id)a3 oldAccount:(id)a4 changeType:(id)a5;
- (void)addNotificationEntry:(id)a3;
- (void)postDidChangeNotificationForType:(int)a3 inStore:(id)a4 newAccount:(id)a5 oldAccount:(id)a6;
- (void)postDidPerformDataclassActionsOnAccount:(id)a3 forDataclasses:(id)a4;
- (void)postWillPerformDataclassActionsOnAccount:(id)a3 forDataclasses:(id)a4;
- (void)removeAllNotificationEntries;
@end

@implementation ACDAccountNotifier

+ (NSArray)allNotificationEntries
{
  v2 = _ACDNotificationSignpostSystem();
  uint64_t v3 = _ACSignpostCreate();

  v4 = _ACDNotificationSignpostSystem();
  v5 = v4;
  if ((unint64_t)(v3 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2183AD000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "FaultPlugins", "", buf, 2u);
  }

  v6 = _ACDNotificationSignpostSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    +[ACDAccountNotifier allNotificationEntries];
  }

  v7 = +[ACPluginLoader pluginBundlesAtSubpath:@"Notification"];
  v8 = [v7 allObjects];

  v9 = objc_msgSend(v8, "ac_mapNullable:", &__block_literal_global_42);
  _ACSignpostGetNanoseconds();
  v10 = _ACDNotificationSignpostSystem();
  v11 = v10;
  if ((unint64_t)(v3 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_2183AD000, v11, OS_SIGNPOST_INTERVAL_END, v3, "FaultPlugins", "", v14, 2u);
  }

  v12 = _ACDNotificationSignpostSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    +[ACDAccountNotifier allNotificationEntries]();
  }

  return (NSArray *)v9;
}

ACDPluginEntry *__44__ACDAccountNotifier_allNotificationEntries__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[ACDPluginEntry alloc] initWithBundle:v2];

  return v3;
}

- (ACDAccountNotifier)init
{
  return [(ACDAccountNotifier *)self initWithNotificationEntries:MEMORY[0x263EFFA68]];
}

- (ACDAccountNotifier)initWithNotificationEntries:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ACDAccountNotifier;
  v6 = [(ACDAccountNotifier *)&v11 init];
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.accounts.notifierworkq", v7);
    notificationEntryQueue = v6->_notificationEntryQueue;
    v6->_notificationEntryQueue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v6->_notificationEntries, a3);
  }

  return v6;
}

- (BOOL)canSaveAccount:(id)a3 inStore:(id)a4 error:(id *)a5
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  v66 = v9;
  if (!v9)
  {
    v59 = [MEMORY[0x263F08690] currentHandler];
    [v59 handleFailureInMethod:a2, self, @"ACDAccountNotifier.m", 104, @"Invalid parameter not satisfying: %@", @"account" object file lineNumber description];
  }
  v65 = v10;
  if (!v10)
  {
    v60 = [MEMORY[0x263F08690] currentHandler];
    [v60 handleFailureInMethod:a2, self, @"ACDAccountNotifier.m", 105, @"Invalid parameter not satisfying: %@", @"store" object file lineNumber description];
  }
  SEL v61 = a2;
  objc_super v11 = _ACDNotificationSignpostSystem();
  os_signpost_id_t v12 = _ACSignpostCreate();

  v13 = _ACDNotificationSignpostSystem();
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_DWORD *)buf = 138412290;
    os_signpost_id_t v74 = (os_signpost_id_t)v66;
    _os_signpost_emit_with_name_impl(&dword_2183AD000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "CanSaveAccount", "account: %@", buf, 0xCu);
  }
  unint64_t v64 = v12 - 1;

  v15 = _ACDNotificationSignpostSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[ACDAccountNotifier canSaveAccount:inStore:error:]();
  }

  [(ACDAccountNotifier *)self _pluginsRegisteredForAccount:v66];
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = [obj countByEnumeratingWithState:&v69 objects:v81 count:16];
  if (!v16)
  {
    v18 = 0;
    BOOL v30 = 1;
LABEL_38:
    unint64_t v32 = v64;
    goto LABEL_44;
  }
  uint64_t v17 = v16;
  os_signpost_id_t v62 = v12;
  v63 = a5;
  v18 = 0;
  uint64_t v19 = *(void *)v70;
  v20 = v65;
LABEL_12:
  uint64_t v21 = 0;
  while (1)
  {
    if (*(void *)v70 != v19) {
      objc_enumerationMutation(obj);
    }
    v22 = *(void **)(*((void *)&v69 + 1) + 8 * v21);
    if ([v22 principalObjectRespondsToSelector:sel_canSaveAccount_inStore_error_]) {
      break;
    }
    if ([v22 principalObjectRespondsToSelector:sel_canSaveAccount_inStore_])
    {
      v27 = [v22 principalObject];
      v24 = v27;
      if (v27)
      {
        if (([v27 canSaveAccount:v66 inStore:v20] & 1) == 0)
        {
          v34 = _ACDNotificationLogSystem();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            os_signpost_id_t v74 = (os_signpost_id_t)v66;
            __int16 v75 = 2112;
            double v76 = *(double *)&v22;
            _os_log_impl(&dword_2183AD000, v34, OS_LOG_TYPE_DEFAULT, "Entry reported inability to save account: %@, entry: %@", buf, 0x16u);
          }

          v36 = NSString;
          v37 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v38 = [v37 localizedStringForKey:@"ACCOUNT_CANNOT_SAVE_ERROR_FORMAT" value:&stru_26C990120 table:@"Localizable"];
          v39 = [v66 accountType];
          v40 = [v39 accountTypeDescription];
          v41 = [v66 accountType];
          v42 = [v41 accountTypeDescription];
          uint64_t v43 = objc_msgSend(v36, "stringWithFormat:", v38, v40, v42);

          v44 = NSString;
          v45 = (objc_class *)objc_opt_class();
          v46 = NSStringFromClass(v45);
          v47 = [v44 stringWithFormat:@"The account save was rejected by '%@'.", v46];

          v48 = (void *)MEMORY[0x263F087E8];
          uint64_t v49 = *MEMORY[0x263EFB070];
          uint64_t v50 = *MEMORY[0x263F07F80];
          v79[0] = *MEMORY[0x263F08320];
          v79[1] = v50;
          v80[0] = v43;
          v80[1] = v47;
          v51 = [NSDictionary dictionaryWithObjects:v80 forKeys:v79 count:2];
          id v26 = [v48 errorWithDomain:v49 code:5 userInfo:v51];

          v33 = (void *)v43;
          os_signpost_id_t v12 = v62;
          a5 = v63;
          unint64_t v32 = v64;
          goto LABEL_42;
        }
        goto LABEL_27;
      }
      v28 = _ACDNotificationLogSystem();
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
LABEL_26:

        goto LABEL_27;
      }
LABEL_30:
      *(_DWORD *)buf = 138412290;
      os_signpost_id_t v74 = (os_signpost_id_t)v22;
      _os_log_error_impl(&dword_2183AD000, v28, OS_LOG_TYPE_ERROR, "Failed to load principal object for entry: %@", buf, 0xCu);
      goto LABEL_26;
    }
LABEL_28:
    if (v17 == ++v21)
    {
      uint64_t v29 = [obj countByEnumeratingWithState:&v69 objects:v81 count:16];
      uint64_t v17 = v29;
      if (!v29)
      {
        BOOL v30 = 1;
        os_signpost_id_t v12 = v62;
        a5 = v63;
        goto LABEL_38;
      }
      goto LABEL_12;
    }
  }
  v23 = [v22 principalObject];
  v24 = v23;
  if (!v23)
  {
    v28 = _ACDNotificationLogSystem();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      goto LABEL_26;
    }
    goto LABEL_30;
  }
  id v68 = v18;
  char v25 = [v23 canSaveAccount:v66 inStore:v20 error:&v68];
  id v26 = v68;

  if (v25)
  {
    v18 = v26;
    v20 = v65;
LABEL_27:

    goto LABEL_28;
  }
  v31 = _ACDNotificationLogSystem();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    os_signpost_id_t v74 = (os_signpost_id_t)v66;
    __int16 v75 = 2112;
    double v76 = *(double *)&v22;
    _os_log_impl(&dword_2183AD000, v31, OS_LOG_TYPE_DEFAULT, "Entry reported inability to save account: %@, entry: %@", buf, 0x16u);
  }

  os_signpost_id_t v12 = v62;
  a5 = v63;
  unint64_t v32 = v64;
  if (!v26)
  {
    v33 = [MEMORY[0x263F08690] currentHandler];
    [v33 handleFailureInMethod:v61, self, @"ACDAccountNotifier.m", 120, @"Plugin denied account save but provided no error: %@", v22 object file lineNumber description];
LABEL_42:
  }
  BOOL v30 = 0;
  v18 = v26;
LABEL_44:

  uint64_t Nanoseconds = _ACSignpostGetNanoseconds();
  v53 = _ACDNotificationSignpostSystem();
  v54 = v53;
  if (v32 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v53))
  {
    v55 = @"NO";
    if (v30) {
      v55 = @"YES";
    }
    *(_DWORD *)buf = 138543362;
    os_signpost_id_t v74 = (os_signpost_id_t)v55;
    _os_signpost_emit_with_name_impl(&dword_2183AD000, v54, OS_SIGNPOST_INTERVAL_END, v12, "CanSaveAccount", "%{public}@", buf, 0xCu);
  }

  v56 = _ACDNotificationSignpostSystem();
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
  {
    v58 = @"NO";
    *(_DWORD *)buf = 134218498;
    os_signpost_id_t v74 = v12;
    if (v30) {
      v58 = @"YES";
    }
    __int16 v75 = 2048;
    double v76 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v77 = 2114;
    v78 = v58;
    _os_log_debug_impl(&dword_2183AD000, v56, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: CanSaveAccount %{public}@", buf, 0x20u);
  }

  if (a5) {
    *a5 = v18;
  }

  return v30;
}

- (BOOL)canRemoveAccount:(id)a3 inStore:(id)a4 error:(id *)a5
{
  uint64_t v103 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  v88 = v9;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    long long v72 = [MEMORY[0x263F08690] currentHandler];
    [v72 handleFailureInMethod:a2, self, @"ACDAccountNotifier.m", 149, @"Invalid parameter not satisfying: %@", @"account" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  v73 = [MEMORY[0x263F08690] currentHandler];
  [v73 handleFailureInMethod:a2, self, @"ACDAccountNotifier.m", 150, @"Invalid parameter not satisfying: %@", @"store" object file lineNumber description];

LABEL_3:
  os_signpost_id_t v12 = _ACDNotificationSignpostSystem();
  os_signpost_id_t v13 = _ACSignpostCreate();

  v14 = _ACDNotificationSignpostSystem();
  v15 = v14;
  unint64_t v16 = v13 - 1;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_DWORD *)buf = 138412290;
    os_signpost_id_t v95 = (os_signpost_id_t)v88;
    _os_signpost_emit_with_name_impl(&dword_2183AD000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "CanRemoveAccount", "account: %@", buf, 0xCu);
  }

  uint64_t v17 = _ACDNotificationSignpostSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    -[ACDAccountNotifier canRemoveAccount:inStore:error:]();
  }
  v83 = v11;

  [(ACDAccountNotifier *)self _pluginsRegisteredForAccount:v88];
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v86 = [obj countByEnumeratingWithState:&v90 objects:v102 count:16];
  if (!v86)
  {
    v18 = 0;
    BOOL v64 = 1;
    goto LABEL_62;
  }
  unint64_t v76 = v13 - 1;
  os_signpost_id_t v74 = self;
  SEL v75 = a2;
  os_signpost_id_t v77 = v13;
  v78 = a5;
  v18 = 0;
  uint64_t v19 = &selRef_activityCriteria;
  v20 = &selRef_activityCriteria;
  uint64_t v85 = *(void *)v91;
  uint64_t v81 = *MEMORY[0x263EFB070];
  uint64_t v80 = *MEMORY[0x263F08320];
  uint64_t v79 = *MEMORY[0x263F07F80];
LABEL_10:
  uint64_t v21 = 0;
  v87 = v19[80];
  uint64_t v82 = v20[79];
  while (1)
  {
    if (*(void *)v91 != v85) {
      objc_enumerationMutation(obj);
    }
    v22 = *(void **)(*((void *)&v90 + 1) + 8 * v21);
    v23 = _ACDNotificationSignpostSystem();
    os_signpost_id_t v24 = _ACSignpostCreate();

    char v25 = _ACDNotificationSignpostSystem();
    id v26 = v25;
    unint64_t v27 = v24 - 1;
    if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      v28 = [v22 identifier];
      uint64_t v29 = [v88 accountType];
      BOOL v30 = [v29 identifier];
      *(_DWORD *)buf = 138544386;
      os_signpost_id_t v95 = (os_signpost_id_t)v28;
      __int16 v96 = 2114;
      double v97 = *(double *)&v30;
      __int16 v98 = 1026;
      *(_DWORD *)v99 = 3;
      *(_WORD *)&v99[4] = 2112;
      *(void *)&v99[6] = @"deleted";
      *(_WORD *)&v99[14] = 2112;
      *(void *)&v99[16] = v88;
      _os_signpost_emit_with_name_impl(&dword_2183AD000, v26, OS_SIGNPOST_INTERVAL_BEGIN, v24, "CanRemoveAccountPlugin", " PluginIdentifier=%{public,signpost.telemetry:string1,name=PluginIdentifier}@  AccountType=%{public,signpost.telemetry:string2,name=AccountType}@  ChangeType=%{public,signpost.telemetry:number1,name=ChangeType}d  enableTelemetry=YES (changeType: %@, account: %@)", buf, 0x30u);
    }
    v31 = _ACDNotificationSignpostSystem();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      v57 = [v22 identifier];
      v58 = [v88 accountType];
      v59 = [v58 identifier];
      *(_DWORD *)buf = 134219266;
      os_signpost_id_t v95 = v24;
      __int16 v96 = 2114;
      double v97 = *(double *)&v57;
      __int16 v98 = 2114;
      *(void *)v99 = v59;
      *(_WORD *)&v99[8] = 1026;
      *(_DWORD *)&v99[10] = 3;
      *(_WORD *)&v99[14] = 2112;
      *(void *)&v99[16] = @"deleted";
      *(_WORD *)&v99[24] = 2112;
      *(void *)&v99[26] = v88;
      _os_log_debug_impl(&dword_2183AD000, v31, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: CanRemoveAccountPlugin  PluginIdentifier=%{public,signpost.telemetry:string1,name=PluginIdentifier}@  AccountType=%{public,signpost.telemetry:string2,name=AccountType}@  ChangeType=%{public,signpost.telemetry:number1,name=ChangeType}d  enableTelemetry=YES (changeType: %@, account: %@)", buf, 0x3Au);
    }
    if ([v22 principalObjectRespondsToSelector:v87])
    {
      unint64_t v32 = [v22 principalObject];
      v33 = v32;
      if (v32)
      {
        id v89 = v18;
        char v34 = [v32 canRemoveAccount:v88 inStore:v83 error:&v89];
        id v35 = v89;

        if (v34)
        {
          int v36 = 1;
LABEL_40:

          v18 = v35;
          goto LABEL_41;
        }
        v39 = _ACDNotificationLogSystem();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          os_signpost_id_t v95 = (os_signpost_id_t)v88;
          __int16 v96 = 2112;
          double v97 = *(double *)&v22;
          _os_log_impl(&dword_2183AD000, v39, OS_LOG_TYPE_DEFAULT, "Entry reported inability to remove account: %@, entry: %@", buf, 0x16u);
        }

        if (v35)
        {
          int v36 = 0;
          goto LABEL_40;
        }
        v38 = [MEMORY[0x263F08690] currentHandler];
        [v38 handleFailureInMethod:v75, v74, @"ACDAccountNotifier.m", 166, @"Plugin denied account remove but provided no error: %@", v22 object file lineNumber description];
        v18 = 0;
        int v36 = 0;
        goto LABEL_38;
      }
      v38 = _ACDNotificationLogSystem();
      if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        goto LABEL_34;
      }
      goto LABEL_55;
    }
    if ([v22 principalObjectRespondsToSelector:v82])
    {
      v37 = [v22 principalObject];
      v33 = v37;
      if (v37)
      {
        if ([v37 canRemoveAccount:v88 inStore:v83])
        {
          int v36 = 1;
LABEL_39:
          id v35 = v18;
          goto LABEL_40;
        }
        v40 = _ACDNotificationLogSystem();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          os_signpost_id_t v95 = (os_signpost_id_t)v88;
          __int16 v96 = 2112;
          double v97 = *(double *)&v22;
          _os_log_impl(&dword_2183AD000, v40, OS_LOG_TYPE_DEFAULT, "Entry reported inability to remove account: %@, entry: %@", buf, 0x16u);
        }

        v41 = NSString;
        v42 = [v88 accountType];
        uint64_t v43 = [v42 accountTypeDescription];
        v38 = [v41 stringWithFormat:@"Can't remove account with identifier %@ because one plugin doesn't allow it.", v43];

        v44 = NSString;
        v45 = (objc_class *)objc_opt_class();
        v46 = NSStringFromClass(v45);
        v47 = [v44 stringWithFormat:@"The account removal was rejected by '%@'.", v46];

        v48 = (void *)MEMORY[0x263F087E8];
        v100[0] = v80;
        v100[1] = v79;
        v101[0] = v38;
        v101[1] = v47;
        uint64_t v49 = [NSDictionary dictionaryWithObjects:v101 forKeys:v100 count:2];
        uint64_t v50 = [v48 errorWithDomain:v81 code:17 userInfo:v49];

        int v36 = 0;
        v18 = (void *)v50;
        unint64_t v27 = v24 - 1;
LABEL_38:

        goto LABEL_39;
      }
      v38 = _ACDNotificationLogSystem();
      if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
LABEL_34:
        int v36 = 1;
        goto LABEL_38;
      }
LABEL_55:
      *(_DWORD *)buf = 138412290;
      os_signpost_id_t v95 = (os_signpost_id_t)v22;
      _os_log_error_impl(&dword_2183AD000, v38, OS_LOG_TYPE_ERROR, "Failed to load principal object for entry: %@", buf, 0xCu);
      goto LABEL_34;
    }
    int v36 = 1;
LABEL_41:
    uint64_t Nanoseconds = _ACSignpostGetNanoseconds();
    v52 = _ACDNotificationSignpostSystem();
    v53 = v52;
    if (v27 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v52))
    {
      if (v36) {
        v54 = @"YES";
      }
      else {
        v54 = @"NO";
      }
      v55 = [v22 identifier];
      *(_DWORD *)buf = 138413058;
      os_signpost_id_t v95 = (os_signpost_id_t)v54;
      __int16 v96 = 2112;
      double v97 = *(double *)&v55;
      __int16 v98 = 2112;
      *(void *)v99 = @"deleted";
      *(_WORD *)&v99[8] = 2112;
      *(void *)&v99[10] = v88;
      _os_signpost_emit_with_name_impl(&dword_2183AD000, v53, OS_SIGNPOST_INTERVAL_END, v24, "CanRemoveAccountPlugin", "%@ %@ (changeType: %@, account: %@)", buf, 0x2Au);
    }
    v56 = _ACDNotificationSignpostSystem();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
    {
      double v60 = (double)(unint64_t)Nanoseconds / 1000000000.0;
      if (v36) {
        SEL v61 = @"YES";
      }
      else {
        SEL v61 = @"NO";
      }
      os_signpost_id_t v62 = [v22 identifier];
      *(_DWORD *)buf = 134219266;
      os_signpost_id_t v95 = v24;
      __int16 v96 = 2048;
      double v97 = v60;
      __int16 v98 = 2112;
      *(void *)v99 = v61;
      *(_WORD *)&v99[8] = 2112;
      *(void *)&v99[10] = v62;
      *(_WORD *)&v99[18] = 2112;
      *(void *)&v99[20] = @"deleted";
      *(_WORD *)&v99[28] = 2112;
      *(void *)&v99[30] = v88;
      _os_log_debug_impl(&dword_2183AD000, v56, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: CanRemoveAccountPlugin %@ %@ (changeType: %@, account: %@)", buf, 0x3Eu);
    }
    if (!v36) {
      break;
    }
    if (v86 == ++v21)
    {
      uint64_t v63 = [obj countByEnumeratingWithState:&v90 objects:v102 count:16];
      uint64_t v86 = v63;
      uint64_t v19 = &selRef_activityCriteria;
      v20 = &selRef_activityCriteria;
      if (!v63)
      {
        BOOL v64 = 1;
        goto LABEL_60;
      }
      goto LABEL_10;
    }
  }
  BOOL v64 = 0;
LABEL_60:
  os_signpost_id_t v13 = v77;
  a5 = v78;
  unint64_t v16 = v76;
LABEL_62:

  uint64_t v65 = _ACSignpostGetNanoseconds();
  v66 = _ACDNotificationSignpostSystem();
  v67 = v66;
  if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v66))
  {
    id v68 = @"NO";
    if (v64) {
      id v68 = @"YES";
    }
    *(_DWORD *)buf = 138543362;
    os_signpost_id_t v95 = (os_signpost_id_t)v68;
    _os_signpost_emit_with_name_impl(&dword_2183AD000, v67, OS_SIGNPOST_INTERVAL_END, v13, "CanRemoveAccount", "%{public}@", buf, 0xCu);
  }

  long long v69 = _ACDNotificationSignpostSystem();
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
  {
    long long v71 = @"NO";
    *(_DWORD *)buf = 134218498;
    os_signpost_id_t v95 = v13;
    if (v64) {
      long long v71 = @"YES";
    }
    __int16 v96 = 2048;
    double v97 = (double)(unint64_t)v65 / 1000000000.0;
    __int16 v98 = 2114;
    *(void *)v99 = v71;
    _os_log_debug_impl(&dword_2183AD000, v69, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: CanRemoveAccount %{public}@", buf, 0x20u);
  }

  if (a5) {
    *a5 = v18;
  }

  return v64;
}

- (BOOL)postWillChangeNotificationForType:(int)a3 inStore:(id)a4 newAccount:(id)a5 oldAccount:(id)a6
{
  uint64_t v89 = *MEMORY[0x263EF8340];
  id v11 = a4;
  double v71 = COERCE_DOUBLE(a5);
  id v69 = a6;
  unsigned int v67 = a3;
  if (!a3)
  {
    os_signpost_id_t v62 = [MEMORY[0x263F08690] currentHandler];
    [v62 handleFailureInMethod:a2, self, @"ACDAccountNotifier.m", 198, @"Invalid parameter not satisfying: %@", @"changeType" object file lineNumber description];
  }
  id v68 = v11;
  if (!v11)
  {
    uint64_t v63 = [MEMORY[0x263F08690] currentHandler];
    [v63 handleFailureInMethod:a2, self, @"ACDAccountNotifier.m", 199, @"Invalid parameter not satisfying: %@", @"store" object file lineNumber description];
  }
  os_signpost_id_t v12 = _ACDNotificationSignpostSystem();
  uint64_t spid = _ACSignpostCreate();

  os_signpost_id_t v13 = _ACDNotificationSignpostSystem();
  v14 = v13;
  if ((unint64_t)(spid - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    if ((a3 - 1) > 4) {
      *(double *)&v15 = COERCE_DOUBLE(@"unknown");
    }
    else {
      v15 = off_264321540[a3 - 1];
    }
    *(_DWORD *)buf = 138412802;
    double v84 = v71;
    __int16 v85 = 2112;
    double v86 = *(double *)&v15;
    __int16 v87 = 2112;
    *(void *)v88 = v69;
    _os_signpost_emit_with_name_impl(&dword_2183AD000, v14, OS_SIGNPOST_INTERVAL_BEGIN, spid, "AccountWillChange", "%@ (changeType: %@, oldAccount: %@)", buf, 0x20u);
  }

  unint64_t v16 = _ACDNotificationSignpostSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    if ((a3 - 1) > 4) {
      double v60 = @"unknown";
    }
    else {
      double v60 = off_264321540[a3 - 1];
    }
    *(_DWORD *)buf = 134218754;
    double v84 = *(double *)&spid;
    __int16 v85 = 2112;
    double v86 = v71;
    __int16 v87 = 2112;
    *(void *)v88 = v60;
    *(_WORD *)&v88[8] = 2112;
    *(void *)&v88[10] = v69;
    _os_log_debug_impl(&dword_2183AD000, v16, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: AccountWillChange %@ (changeType: %@, oldAccount: %@)", buf, 0x2Au);
  }

  [(ACDAccountNotifier *)self _pluginsRegisteredForNewAccount:*(void *)&v71 oldAccount:v69 changeType:a3];
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v73 = [obj countByEnumeratingWithState:&v78 objects:v82 count:16];
  if (v73)
  {
    char v65 = 0;
    uint64_t v66 = a3 - 1;
    uint64_t v72 = *(void *)v79;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v79 != v72) {
          objc_enumerationMutation(obj);
        }
        v18 = *(void **)(*((void *)&v78 + 1) + 8 * v17);
        if ([v18 principalObjectRespondsToSelector:sel_account_willChangeWithType_inStore_oldAccount_])
        {
          uint64_t v19 = (void *)[*(id *)&v71 copy];
          v20 = (void *)[v69 copy];
          id v77 = v18;
          id v76 = v68;
          id v21 = v19;
          id v22 = v20;
          v23 = v22;
          if (v21) {
            os_signpost_id_t v24 = v21;
          }
          else {
            os_signpost_id_t v24 = v22;
          }
          id v74 = v24;
          char v25 = [v74 accountType];
          double v75 = [v25 identifier];

          id v26 = _ACDNotificationSignpostSystem();
          os_signpost_id_t v27 = _ACSignpostCreate();

          v28 = _ACDNotificationSignpostSystem();
          uint64_t v29 = v28;
          if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
          {
            uint64_t v30 = [v77 identifier];
            v31 = (void *)v30;
            unint64_t v32 = @"unknown";
            if (v66 < 5) {
              unint64_t v32 = off_264321540[v66];
            }
            *(_DWORD *)buf = 138544386;
            double v84 = *(double *)&v30;
            __int16 v85 = 2114;
            double v86 = v75;
            __int16 v87 = 1026;
            *(_DWORD *)v88 = v67;
            *(_WORD *)&v88[4] = 2112;
            *(void *)&v88[6] = v32;
            *(_WORD *)&v88[14] = 2112;
            *(void *)&v88[16] = v74;
            _os_signpost_emit_with_name_impl(&dword_2183AD000, v29, OS_SIGNPOST_INTERVAL_BEGIN, v27, "AccountWillChangePlugin", " PluginIdentifier=%{public,signpost.telemetry:string1,name=PluginIdentifier}@  AccountType=%{public,signpost.telemetry:string2,name=AccountType}@  ChangeType=%{public,signpost.telemetry:number1,name=ChangeType}d  enableTelemetry=YES (changeType: %@, account: %@)", buf, 0x30u);
          }
          v33 = _ACDNotificationSignpostSystem();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          {
            double v46 = [v77 identifier];
            double v47 = v46;
            v48 = @"unknown";
            if (v66 < 5) {
              v48 = off_264321540[v66];
            }
            *(_DWORD *)buf = 134219266;
            double v84 = *(double *)&v27;
            __int16 v85 = 2114;
            double v86 = v46;
            __int16 v87 = 2114;
            *(double *)v88 = v75;
            *(_WORD *)&v88[8] = 1026;
            *(_DWORD *)&v88[10] = v67;
            *(_WORD *)&v88[14] = 2112;
            *(void *)&v88[16] = v48;
            *(_WORD *)&v88[24] = 2112;
            *(void *)&v88[26] = v74;
            _os_log_debug_impl(&dword_2183AD000, v33, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: AccountWillChangePlugin  PluginIdentifier=%{public,signpost.telemetry:string1,name=PluginIdentifier}@  AccountType=%{public,signpost.telemetry:string2,name=AccountType}@  ChangeType=%{public,signpost.telemetry:number1,name=ChangeType}d  enableTelemetry=YES (changeType: %@, account: %@)", buf, 0x3Au);
          }
          char v34 = [v77 principalObject];
          id v35 = v34;
          if (v34)
          {
            int v36 = [v34 account:v21 willChangeWithType:v67 inStore:v76 oldAccount:v23];
          }
          else
          {
            v37 = _ACDNotificationLogSystem();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              double v84 = *(double *)&v77;
              _os_log_error_impl(&dword_2183AD000, v37, OS_LOG_TYPE_ERROR, "Failed to load principal object for entry: %@", buf, 0xCu);
            }

            int v36 = 0;
          }

          uint64_t Nanoseconds = _ACSignpostGetNanoseconds();
          v39 = _ACDNotificationSignpostSystem();
          v40 = v39;
          if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
          {
            double v41 = [v77 identifier];
            double v42 = v41;
            uint64_t v43 = @"NO";
            if (v36) {
              uint64_t v43 = @"YES";
            }
            v44 = @"unknown";
            if (v66 <= 4) {
              v44 = off_264321540[v66];
            }
            *(_DWORD *)buf = 138413058;
            double v84 = *(double *)&v43;
            __int16 v85 = 2112;
            double v86 = v41;
            __int16 v87 = 2112;
            *(void *)v88 = v44;
            *(_WORD *)&v88[8] = 2112;
            *(void *)&v88[10] = v23;
            _os_signpost_emit_with_name_impl(&dword_2183AD000, v40, OS_SIGNPOST_INTERVAL_END, v27, "AccountWillChangePlugin", "%@ %@ (changeType: %@, oldAccount: %@)", buf, 0x2Au);
          }
          v45 = _ACDNotificationSignpostSystem();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v49 = [v77 identifier];
            uint64_t v50 = (void *)v49;
            v51 = @"NO";
            if (v36) {
              v51 = @"YES";
            }
            v52 = @"unknown";
            if (v66 <= 4) {
              v52 = off_264321540[v66];
            }
            *(_DWORD *)buf = 134219266;
            double v84 = *(double *)&v27;
            __int16 v85 = 2048;
            double v86 = (double)(unint64_t)Nanoseconds / 1000000000.0;
            __int16 v87 = 2112;
            *(void *)v88 = v51;
            *(_WORD *)&v88[8] = 2112;
            *(void *)&v88[10] = v49;
            *(_WORD *)&v88[18] = 2112;
            *(void *)&v88[20] = v52;
            *(_WORD *)&v88[28] = 2112;
            *(void *)&v88[30] = v23;
            _os_log_debug_impl(&dword_2183AD000, v45, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AccountWillChangePlugin %@ %@ (changeType: %@, oldAccount: %@)", buf, 0x3Eu);
          }
          if (v36)
          {
            [*(id *)&v71 takeValuesFromModifiedAccount:v21];
            char v65 = 1;
          }
        }
        ++v17;
      }
      while (v73 != v17);
      uint64_t v53 = [obj countByEnumeratingWithState:&v78 objects:v82 count:16];
      uint64_t v73 = v53;
    }
    while (v53);
  }
  else
  {
    char v65 = 0;
  }

  uint64_t v54 = _ACSignpostGetNanoseconds();
  v55 = _ACDNotificationSignpostSystem();
  v56 = v55;
  if ((unint64_t)(spid - 1) < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v55))
  {
    v57 = @"NO";
    if (v65) {
      v57 = @"YES";
    }
    *(_DWORD *)buf = 138543362;
    double v84 = *(double *)&v57;
    _os_signpost_emit_with_name_impl(&dword_2183AD000, v56, OS_SIGNPOST_INTERVAL_END, spid, "AccountWillChange", "%{public}@", buf, 0xCu);
  }

  v58 = _ACDNotificationSignpostSystem();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
  {
    SEL v61 = @"NO";
    *(_DWORD *)buf = 134218498;
    double v84 = *(double *)&spid;
    if (v65) {
      SEL v61 = @"YES";
    }
    __int16 v85 = 2048;
    double v86 = (double)(unint64_t)v54 / 1000000000.0;
    __int16 v87 = 2114;
    *(void *)v88 = v61;
    _os_log_debug_impl(&dword_2183AD000, v58, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AccountWillChange %{public}@", buf, 0x20u);
  }

  return v65 & 1;
}

- (void)postDidChangeNotificationForType:(int)a3 inStore:(id)a4 newAccount:(id)a5 oldAccount:(id)a6
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v11 = a4;
  double v64 = COERCE_DOUBLE(a5);
  id v63 = a6;
  unsigned int v61 = a3;
  if (!a3)
  {
    v57 = [MEMORY[0x263F08690] currentHandler];
    [v57 handleFailureInMethod:a2, self, @"ACDAccountNotifier.m", 247, @"Invalid parameter not satisfying: %@", @"changeType" object file lineNumber description];
  }
  os_signpost_id_t v62 = v11;
  if (!v11)
  {
    v58 = [MEMORY[0x263F08690] currentHandler];
    [v58 handleFailureInMethod:a2, self, @"ACDAccountNotifier.m", 248, @"Invalid parameter not satisfying: %@", @"store" object file lineNumber description];
  }
  os_signpost_id_t v12 = _ACDNotificationSignpostSystem();
  uint64_t spid = _ACSignpostCreate();

  os_signpost_id_t v13 = _ACDNotificationSignpostSystem();
  v14 = v13;
  if ((unint64_t)(spid - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    if ((a3 - 1) > 4) {
      *(double *)&v15 = COERCE_DOUBLE(@"unknown");
    }
    else {
      v15 = off_264321540[a3 - 1];
    }
    *(_DWORD *)buf = 138412802;
    double v76 = v64;
    __int16 v77 = 2112;
    double v78 = *(double *)&v15;
    __int16 v79 = 2112;
    *(void *)long long v80 = v63;
    _os_signpost_emit_with_name_impl(&dword_2183AD000, v14, OS_SIGNPOST_INTERVAL_BEGIN, spid, "AccountDidChange", "%@ (changeType: %@, oldAccount: %@)", buf, 0x20u);
  }

  unint64_t v16 = _ACDNotificationSignpostSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    if ((a3 - 1) > 4) {
      v56 = @"unknown";
    }
    else {
      v56 = off_264321540[a3 - 1];
    }
    *(_DWORD *)buf = 134218754;
    double v76 = *(double *)&spid;
    __int16 v77 = 2112;
    double v78 = v64;
    __int16 v79 = 2112;
    *(void *)long long v80 = v56;
    *(_WORD *)&v80[8] = 2112;
    *(void *)&v80[10] = v63;
    _os_log_debug_impl(&dword_2183AD000, v16, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: AccountDidChange %@ (changeType: %@, oldAccount: %@)", buf, 0x2Au);
  }

  [(ACDAccountNotifier *)self _pluginsRegisteredForNewAccount:*(void *)&v64 oldAccount:v63 changeType:a3];
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v67 = [obj countByEnumeratingWithState:&v70 objects:v74 count:16];
  if (v67)
  {
    uint64_t v60 = a3 - 1;
    uint64_t v66 = *(void *)v71;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v71 != v66) {
          objc_enumerationMutation(obj);
        }
        v18 = *(void **)(*((void *)&v70 + 1) + 8 * v17);
        if ([v18 principalObjectRespondsToSelector:sel_account_didChangeWithType_inStore_oldAccount_])
        {
          uint64_t v19 = (void *)[*(id *)&v64 copy];
          v20 = (void *)[v63 copy];
          id v21 = v18;
          id v69 = v62;
          id v22 = v19;
          id v23 = v20;
          os_signpost_id_t v24 = v23;
          if (v22) {
            char v25 = v22;
          }
          else {
            char v25 = v23;
          }
          id v26 = v25;
          os_signpost_id_t v27 = [v26 accountType];
          double v68 = [v27 identifier];

          v28 = _ACDNotificationSignpostSystem();
          os_signpost_id_t v29 = _ACSignpostCreate();

          uint64_t v30 = _ACDNotificationSignpostSystem();
          v31 = v30;
          if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
          {
            uint64_t v32 = [v21 identifier];
            v33 = (void *)v32;
            char v34 = @"unknown";
            if (v60 < 5) {
              char v34 = off_264321540[v60];
            }
            *(_DWORD *)buf = 138544386;
            double v76 = *(double *)&v32;
            __int16 v77 = 2114;
            double v78 = v68;
            __int16 v79 = 1026;
            *(_DWORD *)long long v80 = v61;
            *(_WORD *)&v80[4] = 2112;
            *(void *)&v80[6] = v34;
            *(_WORD *)&v80[14] = 2112;
            *(void *)&v80[16] = v26;
            _os_signpost_emit_with_name_impl(&dword_2183AD000, v31, OS_SIGNPOST_INTERVAL_BEGIN, v29, "AccountDidChangePlugin", " PluginIdentifier=%{public,signpost.telemetry:string1,name=PluginIdentifier}@  AccountType=%{public,signpost.telemetry:string2,name=AccountType}@  ChangeType=%{public,signpost.telemetry:number1,name=ChangeType}d  enableTelemetry=YES (changeType: %@, account: %@)", buf, 0x30u);
          }
          id v35 = _ACDNotificationSignpostSystem();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          {
            double v46 = [v21 identifier];
            double v47 = v46;
            v48 = @"unknown";
            if (v60 < 5) {
              v48 = off_264321540[v60];
            }
            *(_DWORD *)buf = 134219266;
            double v76 = *(double *)&v29;
            __int16 v77 = 2114;
            double v78 = v46;
            __int16 v79 = 2114;
            *(double *)long long v80 = v68;
            *(_WORD *)&v80[8] = 1026;
            *(_DWORD *)&v80[10] = v61;
            *(_WORD *)&v80[14] = 2112;
            *(void *)&v80[16] = v48;
            *(_WORD *)&v80[24] = 2112;
            *(void *)&v80[26] = v26;
            _os_log_debug_impl(&dword_2183AD000, v35, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: AccountDidChangePlugin  PluginIdentifier=%{public,signpost.telemetry:string1,name=PluginIdentifier}@  AccountType=%{public,signpost.telemetry:string2,name=AccountType}@  ChangeType=%{public,signpost.telemetry:number1,name=ChangeType}d  enableTelemetry=YES (changeType: %@, account: %@)", buf, 0x3Au);
          }
          int v36 = [v21 principalObject];
          v37 = v36;
          if (v36)
          {
            [v36 account:v22 didChangeWithType:v61 inStore:v69 oldAccount:v24];
          }
          else
          {
            v38 = _ACDNotificationLogSystem();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              double v76 = *(double *)&v21;
              _os_log_error_impl(&dword_2183AD000, v38, OS_LOG_TYPE_ERROR, "Failed to load principal object for entry: %@", buf, 0xCu);
            }
          }
          uint64_t Nanoseconds = _ACSignpostGetNanoseconds();
          v40 = _ACDNotificationSignpostSystem();
          double v41 = v40;
          if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
          {
            uint64_t v42 = [v21 identifier];
            uint64_t v43 = (void *)v42;
            *(double *)&v44 = COERCE_DOUBLE(@"unknown");
            if (v60 <= 4) {
              v44 = off_264321540[v60];
            }
            *(_DWORD *)buf = 138412802;
            double v76 = *(double *)&v42;
            __int16 v77 = 2112;
            double v78 = *(double *)&v44;
            __int16 v79 = 2112;
            *(void *)long long v80 = v24;
            _os_signpost_emit_with_name_impl(&dword_2183AD000, v41, OS_SIGNPOST_INTERVAL_END, v29, "AccountDidChangePlugin", "%@ (changeType: %@, oldAccount: %@)", buf, 0x20u);
          }
          v45 = _ACDNotificationSignpostSystem();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v49 = [v21 identifier];
            uint64_t v50 = (void *)v49;
            v51 = @"unknown";
            if (v60 <= 4) {
              v51 = off_264321540[v60];
            }
            *(_DWORD *)buf = 134219010;
            double v76 = *(double *)&v29;
            __int16 v77 = 2048;
            double v78 = (double)(unint64_t)Nanoseconds / 1000000000.0;
            __int16 v79 = 2112;
            *(void *)long long v80 = v49;
            *(_WORD *)&v80[8] = 2112;
            *(void *)&v80[10] = v51;
            *(_WORD *)&v80[18] = 2112;
            *(void *)&v80[20] = v24;
            _os_log_debug_impl(&dword_2183AD000, v45, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AccountDidChangePlugin %@ (changeType: %@, oldAccount: %@)", buf, 0x34u);
          }
        }
        ++v17;
      }
      while (v67 != v17);
      uint64_t v52 = [obj countByEnumeratingWithState:&v70 objects:v74 count:16];
      uint64_t v67 = v52;
    }
    while (v52);
  }

  _ACSignpostGetNanoseconds();
  uint64_t v53 = _ACDNotificationSignpostSystem();
  uint64_t v54 = v53;
  if ((unint64_t)(spid - 1) < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v53))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2183AD000, v54, OS_SIGNPOST_INTERVAL_END, spid, "AccountDidChange", "", buf, 2u);
  }

  v55 = _ACDNotificationSignpostSystem();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG)) {
    -[ACDAccountNotifier postDidChangeNotificationForType:inStore:newAccount:oldAccount:]();
  }
}

- (void)postWillPerformDataclassActionsOnAccount:(id)a3 forDataclasses:(id)a4
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v37 = v7;
  if (!v7)
  {
    id v32 = v8;
    v33 = [MEMORY[0x263F08690] currentHandler];
    [v33 handleFailureInMethod:a2, self, @"ACDAccountNotifier.m", 284, @"Invalid parameter not satisfying: %@", @"account" object file lineNumber description];

    id v8 = v32;
  }
  int v36 = v8;
  if (!v8)
  {
    char v34 = [MEMORY[0x263F08690] currentHandler];
    [v34 handleFailureInMethod:a2, self, @"ACDAccountNotifier.m", 285, @"Invalid parameter not satisfying: %@", @"dataclasses" object file lineNumber description];
  }
  id v9 = _ACDNotificationSignpostSystem();
  uint64_t spid = _ACSignpostCreate();

  id v10 = _ACDNotificationSignpostSystem();
  id v11 = v10;
  if ((unint64_t)(spid - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_DWORD *)buf = 138412546;
    os_signpost_id_t v45 = (os_signpost_id_t)v37;
    __int16 v46 = 2112;
    double v47 = *(double *)&v36;
    _os_signpost_emit_with_name_impl(&dword_2183AD000, v11, OS_SIGNPOST_INTERVAL_BEGIN, spid, "AccountWillPerform", "%@ (dataclasses: %@)", buf, 0x16u);
  }

  os_signpost_id_t v12 = _ACDNotificationSignpostSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    os_signpost_id_t v45 = spid;
    __int16 v46 = 2112;
    double v47 = *(double *)&v37;
    __int16 v48 = 2112;
    uint64_t v49 = v36;
    _os_log_debug_impl(&dword_2183AD000, v12, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: AccountWillPerform %@ (dataclasses: %@)", buf, 0x20u);
  }

  [(ACDAccountNotifier *)self _pluginsRegisteredForAccount:v37];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [obj countByEnumeratingWithState:&v40 objects:v52 count:16];
  if (v13)
  {
    uint64_t v39 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v41 != v39) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        if ([v15 principalObjectRespondsToSelector:sel_account_willPerformActionsForDataclasses_])
        {
          unint64_t v16 = [v15 principalObject];
          if (v16)
          {
            uint64_t v17 = _ACDNotificationSignpostSystem();
            os_signpost_id_t v18 = _ACSignpostCreate();

            uint64_t v19 = _ACDNotificationSignpostSystem();
            v20 = v19;
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
            {
              id v21 = [v15 identifier];
              *(_DWORD *)buf = 138412802;
              os_signpost_id_t v45 = (os_signpost_id_t)v21;
              __int16 v46 = 2112;
              double v47 = *(double *)&v37;
              __int16 v48 = 2112;
              uint64_t v49 = v36;
              _os_signpost_emit_with_name_impl(&dword_2183AD000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "AccountWillPerformPlugin", "%@ : %@ (dataclasses: %@)", buf, 0x20u);
            }
            id v22 = _ACDNotificationSignpostSystem();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              v28 = [v15 identifier];
              *(_DWORD *)buf = 134218754;
              os_signpost_id_t v45 = v18;
              __int16 v46 = 2112;
              double v47 = *(double *)&v28;
              __int16 v48 = 2112;
              uint64_t v49 = v37;
              __int16 v50 = 2112;
              v51 = v36;
              _os_log_debug_impl(&dword_2183AD000, v22, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: AccountWillPerformPlugin %@ : %@ (dataclasses: %@)", buf, 0x2Au);
            }
            [v16 account:v37 willPerformActionsForDataclasses:v36];
            uint64_t Nanoseconds = _ACSignpostGetNanoseconds();
            os_signpost_id_t v24 = _ACDNotificationSignpostSystem();
            char v25 = v24;
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_2183AD000, v25, OS_SIGNPOST_INTERVAL_END, v18, "AccountWillPerformPlugin", "", buf, 2u);
            }

            id v26 = _ACDNotificationSignpostSystem();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134218240;
              os_signpost_id_t v45 = v18;
              __int16 v46 = 2048;
              double v47 = (double)(unint64_t)Nanoseconds / 1000000000.0;
              _os_log_debug_impl(&dword_2183AD000, v26, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AccountWillPerformPlugin ", buf, 0x16u);
            }
          }
          else
          {
            os_signpost_id_t v27 = _ACDNotificationLogSystem();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              os_signpost_id_t v45 = (os_signpost_id_t)v15;
              _os_log_error_impl(&dword_2183AD000, v27, OS_LOG_TYPE_ERROR, "Failed to load principal object for entry: %@", buf, 0xCu);
            }
          }
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v40 objects:v52 count:16];
    }
    while (v13);
  }

  _ACSignpostGetNanoseconds();
  os_signpost_id_t v29 = _ACDNotificationSignpostSystem();
  uint64_t v30 = v29;
  if ((unint64_t)(spid - 1) < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v29))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2183AD000, v30, OS_SIGNPOST_INTERVAL_END, spid, "AccountWillPerform", "", buf, 2u);
  }

  v31 = _ACDNotificationSignpostSystem();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
    -[ACDAccountNotifier postWillPerformDataclassActionsOnAccount:forDataclasses:]();
  }
}

- (void)postDidPerformDataclassActionsOnAccount:(id)a3 forDataclasses:(id)a4
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v37 = v7;
  if (!v7)
  {
    id v32 = v8;
    v33 = [MEMORY[0x263F08690] currentHandler];
    [v33 handleFailureInMethod:a2, self, @"ACDAccountNotifier.m", 313, @"Invalid parameter not satisfying: %@", @"account" object file lineNumber description];

    id v8 = v32;
  }
  int v36 = v8;
  if (!v8)
  {
    char v34 = [MEMORY[0x263F08690] currentHandler];
    [v34 handleFailureInMethod:a2, self, @"ACDAccountNotifier.m", 314, @"Invalid parameter not satisfying: %@", @"dataclasses" object file lineNumber description];
  }
  id v9 = _ACDNotificationSignpostSystem();
  uint64_t spid = _ACSignpostCreate();

  id v10 = _ACDNotificationSignpostSystem();
  id v11 = v10;
  if ((unint64_t)(spid - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_DWORD *)buf = 138412546;
    os_signpost_id_t v45 = (os_signpost_id_t)v37;
    __int16 v46 = 2112;
    double v47 = *(double *)&v36;
    _os_signpost_emit_with_name_impl(&dword_2183AD000, v11, OS_SIGNPOST_INTERVAL_BEGIN, spid, "AccountDidPerform", "%@ (dataclasses: %@)", buf, 0x16u);
  }

  os_signpost_id_t v12 = _ACDNotificationSignpostSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    os_signpost_id_t v45 = spid;
    __int16 v46 = 2112;
    double v47 = *(double *)&v37;
    __int16 v48 = 2112;
    uint64_t v49 = v36;
    _os_log_debug_impl(&dword_2183AD000, v12, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: AccountDidPerform %@ (dataclasses: %@)", buf, 0x20u);
  }

  [(ACDAccountNotifier *)self _pluginsRegisteredForAccount:v37];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [obj countByEnumeratingWithState:&v40 objects:v52 count:16];
  if (v13)
  {
    uint64_t v39 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v41 != v39) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        if ([v15 principalObjectRespondsToSelector:sel_account_didPerformActionsForDataclasses_])
        {
          unint64_t v16 = [v15 principalObject];
          if (v16)
          {
            uint64_t v17 = _ACDNotificationSignpostSystem();
            os_signpost_id_t v18 = _ACSignpostCreate();

            uint64_t v19 = _ACDNotificationSignpostSystem();
            v20 = v19;
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
            {
              id v21 = [v15 identifier];
              *(_DWORD *)buf = 138412802;
              os_signpost_id_t v45 = (os_signpost_id_t)v21;
              __int16 v46 = 2112;
              double v47 = *(double *)&v37;
              __int16 v48 = 2112;
              uint64_t v49 = v36;
              _os_signpost_emit_with_name_impl(&dword_2183AD000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "AccountDidPerformPlugin", "%@ : %@ (dataclasses: %@)", buf, 0x20u);
            }
            id v22 = _ACDNotificationSignpostSystem();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              v28 = [v15 identifier];
              *(_DWORD *)buf = 134218754;
              os_signpost_id_t v45 = v18;
              __int16 v46 = 2112;
              double v47 = *(double *)&v28;
              __int16 v48 = 2112;
              uint64_t v49 = v37;
              __int16 v50 = 2112;
              v51 = v36;
              _os_log_debug_impl(&dword_2183AD000, v22, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: AccountDidPerformPlugin %@ : %@ (dataclasses: %@)", buf, 0x2Au);
            }
            [v16 account:v37 didPerformActionsForDataclasses:v36];
            uint64_t Nanoseconds = _ACSignpostGetNanoseconds();
            os_signpost_id_t v24 = _ACDNotificationSignpostSystem();
            char v25 = v24;
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_2183AD000, v25, OS_SIGNPOST_INTERVAL_END, v18, "AccountDidPerformPlugin", "", buf, 2u);
            }

            id v26 = _ACDNotificationSignpostSystem();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134218240;
              os_signpost_id_t v45 = v18;
              __int16 v46 = 2048;
              double v47 = (double)(unint64_t)Nanoseconds / 1000000000.0;
              _os_log_debug_impl(&dword_2183AD000, v26, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AccountDidPerformPlugin ", buf, 0x16u);
            }
          }
          else
          {
            os_signpost_id_t v27 = _ACDNotificationLogSystem();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              os_signpost_id_t v45 = (os_signpost_id_t)v15;
              _os_log_error_impl(&dword_2183AD000, v27, OS_LOG_TYPE_ERROR, "Failed to load principal object for entry: %@", buf, 0xCu);
            }
          }
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v40 objects:v52 count:16];
    }
    while (v13);
  }

  _ACSignpostGetNanoseconds();
  os_signpost_id_t v29 = _ACDNotificationSignpostSystem();
  uint64_t v30 = v29;
  if ((unint64_t)(spid - 1) < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v29))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2183AD000, v30, OS_SIGNPOST_INTERVAL_END, spid, "AccountDidPerform", "", buf, 2u);
  }

  v31 = _ACDNotificationSignpostSystem();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
    -[ACDAccountNotifier postDidPerformDataclassActionsOnAccount:forDataclasses:]();
  }
}

- (void)addNotificationEntry:(id)a3
{
  self->_notificationEntries = [(NSArray *)self->_notificationEntries arrayByAddingObject:a3];

  MEMORY[0x270F9A758]();
}

- (void)removeAllNotificationEntries
{
  self->_notificationEntries = (NSArray *)objc_alloc_init(MEMORY[0x263EFF8C0]);

  MEMORY[0x270F9A758]();
}

- (id)_pluginsRegisteredForAccount:(id)a3
{
  v4 = [(ACDAccountNotifier *)self _unsafe_pluginsRegisteredForNewAccount:a3 oldAccount:0 changeType:0];
  if ([v4 count])
  {
    notificationEntryQueue = self->_notificationEntryQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__ACDAccountNotifier__pluginsRegisteredForAccount___block_invoke;
    block[3] = &unk_264320CF0;
    id v6 = v4;
    id v10 = v6;
    dispatch_sync(notificationEntryQueue, block);
    id v7 = v6;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

uint64_t __51__ACDAccountNotifier__pluginsRegisteredForAccount___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) enumerateObjectsUsingBlock:&__block_literal_global_117];
}

void __51__ACDAccountNotifier__pluginsRegisteredForAccount___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v2 = (void *)MEMORY[0x21D46A190]();
  id v3 = (id)[v4 principalObject];
}

- (id)_pluginsRegisteredForNewAccount:(id)a3 oldAccount:(id)a4 changeType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = NSNumber;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v8 numberWithUnsignedInt:v5];
  os_signpost_id_t v12 = [(ACDAccountNotifier *)self _unsafe_pluginsRegisteredForNewAccount:v10 oldAccount:v9 changeType:v11];

  if ([v12 count])
  {
    notificationEntryQueue = self->_notificationEntryQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __76__ACDAccountNotifier__pluginsRegisteredForNewAccount_oldAccount_changeType___block_invoke;
    block[3] = &unk_264320CF0;
    id v14 = v12;
    id v18 = v14;
    dispatch_sync(notificationEntryQueue, block);
    id v15 = v14;
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

uint64_t __76__ACDAccountNotifier__pluginsRegisteredForNewAccount_oldAccount_changeType___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) makeObjectsPerformSelector:sel_principalObject];
}

- (id)_unsafe_pluginsRegisteredForNewAccount:(id)a3 oldAccount:(id)a4 changeType:(id)a5
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 accountType];
  os_signpost_id_t v12 = [v11 identifier];

  uint64_t v13 = [v9 accountType];
  id v14 = [v13 identifier];

  id v15 = [(ACDAccountNotifier *)self _provisionedDataclassesForNewAccount:v8 oldAccount:v9];
  if (v10)
  {
    unint64_t v16 = ExplicitAllowedPluginsByChangeType();
    uint64_t v17 = [v16 objectForKeyedSubscript:v10];
  }
  else
  {
    uint64_t v17 = 0;
  }
  id v18 = (void *)MEMORY[0x263F08A98];
  uint64_t v29 = MEMORY[0x263EF8330];
  uint64_t v30 = 3221225472;
  v31 = __83__ACDAccountNotifier__unsafe_pluginsRegisteredForNewAccount_oldAccount_changeType___block_invoke;
  id v32 = &unk_264321520;
  id v19 = v12;
  id v33 = v19;
  id v20 = v14;
  id v34 = v20;
  id v21 = v15;
  id v35 = v21;
  id v22 = v17;
  id v36 = v22;
  id v23 = [v18 predicateWithBlock:&v29];
  os_signpost_id_t v24 = -[NSArray filteredArrayUsingPredicate:](self->_notificationEntries, "filteredArrayUsingPredicate:", v23, v29, v30, v31, v32);
  char v25 = _ACDLogSystem();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v27 = [v10 intValue] - 1;
    if (v27 > 4) {
      v28 = @"unknown";
    }
    else {
      v28 = off_264321540[v27];
    }
    *(_DWORD *)buf = 138413058;
    id v38 = v8;
    __int16 v39 = 2112;
    id v40 = v9;
    __int16 v41 = 2112;
    long long v42 = v28;
    __int16 v43 = 2114;
    v44 = v24;
    _os_log_debug_impl(&dword_2183AD000, v25, OS_LOG_TYPE_DEBUG, "\"_unsafe_pluginsRegisteredForNewAccount returning plugins for newAccount %@, oldAccount %@, changeType %@:\\n%{public}@ \"", buf, 0x2Au);
  }

  return v24;
}

uint64_t __83__ACDAccountNotifier__unsafe_pluginsRegisteredForNewAccount_oldAccount_changeType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 supportedAccountTypes];
  uint64_t v5 = v4;
  BOOL v6 = !v4
    || *(void *)(a1 + 32) && (objc_msgSend(v4, "containsObject:") & 1) != 0
    || *(void *)(a1 + 40) && (objc_msgSend(v5, "containsObject:") & 1) != 0;
  uint64_t v7 = [v3 supportedDataclasses];
  id v8 = (void *)v7;
  if (v6 && v7)
  {
    if (([*(id *)(a1 + 48) intersectsSet:v7] & 1) == 0)
    {
LABEL_11:
      uint64_t v9 = 0;
      goto LABEL_17;
    }
  }
  else if (!v6)
  {
    goto LABEL_11;
  }
  id v10 = *(void **)(a1 + 56);
  if (v10 && [v10 count])
  {
    id v11 = *(void **)(a1 + 56);
    os_signpost_id_t v12 = [v3 identifier];
    uint64_t v9 = [v11 containsObject:v12];
  }
  else
  {
    uint64_t v9 = 1;
  }
LABEL_17:

  return v9;
}

- (id)_provisionedDataclassesForNewAccount:(id)a3 oldAccount:(id)a4
{
  id v5 = a4;
  BOOL v6 = [a3 provisionedDataclasses];
  uint64_t v7 = [v5 provisionedDataclasses];

  if (v6 && v7)
  {
    id v8 = [v6 setByAddingObjectsFromSet:v7];
LABEL_8:
    uint64_t v9 = v8;
    goto LABEL_9;
  }
  if (v6)
  {
    id v8 = v6;
    goto LABEL_8;
  }
  if (v7)
  {
    id v8 = v7;
    goto LABEL_8;
  }
  uint64_t v9 = 0;
LABEL_9:

  return v9;
}

- (NSArray)notificationEntries
{
  return self->_notificationEntries;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationEntries, 0);

  objc_storeStrong((id *)&self->_notificationEntryQueue, 0);
}

+ (void)allNotificationEntries
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_2183AD000, a2, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: FaultPlugins ", (uint8_t *)&v2, 0xCu);
}

- (void)canSaveAccount:inStore:error:.cold.1()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_0(&dword_2183AD000, v0, v1, "BEGIN [%lld]: CanSaveAccount account: %@");
}

- (void)canRemoveAccount:inStore:error:.cold.1()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_0(&dword_2183AD000, v0, v1, "BEGIN [%lld]: CanRemoveAccount account: %@");
}

- (void)postDidChangeNotificationForType:inStore:newAccount:oldAccount:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_2183AD000, v0, v1, "END [%lld] %fs: AccountDidChange ", v2, v3, v4, v5, v6);
}

- (void)postWillPerformDataclassActionsOnAccount:forDataclasses:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_2183AD000, v0, v1, "END [%lld] %fs: AccountWillPerform ", v2, v3, v4, v5, v6);
}

- (void)postDidPerformDataclassActionsOnAccount:forDataclasses:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_2183AD000, v0, v1, "END [%lld] %fs: AccountDidPerform ", v2, v3, v4, v5, v6);
}

@end