@interface CRComponentAuth
- (BOOL)_checkForComponentFailureInDefaults:(id)a3;
- (BOOL)isComponentFailed;
- (BOOL)isFirstAuthComplete;
- (CRComponentAuth)init;
- (CRComponentAuth)initWithComponentName:(id)a3;
- (NSString)componentName;
- (id)_getObjectForKeyFromDefaults:(id)a3;
- (id)findUnsealedData;
- (int64_t)convertIORegDataToStatus:(id)a3 authPass:(id)a4;
- (int64_t)copyComponentStatus;
- (int64_t)getAuthCPComponentStatus:(id)a3;
- (int64_t)synchronouslycopyAuthStatus;
- (void)setComponentName:(id)a3;
@end

@implementation CRComponentAuth

- (CRComponentAuth)init
{
  v7.receiver = self;
  v7.super_class = (Class)CRComponentAuth;
  v2 = [(CRComponentAuth *)&v7 init];
  v5 = v2;
  if (v2) {
    objc_msgSend_setComponentName_(v2, v3, 0, v4);
  }
  return v5;
}

- (CRComponentAuth)initWithComponentName:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRComponentAuth;
  v5 = [(CRComponentAuth *)&v10 init];
  v8 = v5;
  if (v5) {
    objc_msgSend_setComponentName_(v5, v6, (uint64_t)v4, v7);
  }

  return v8;
}

- (int64_t)copyComponentStatus
{
  return 0;
}

- (int64_t)getAuthCPComponentStatus:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v36 = a3;
  v35 = self;
  objc_sync_enter(v35);
  v42 = 0;
  int v4 = sub_1D967299C(&v42);
  if (v4)
  {
    v5 = handleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1D9674448(v4, v5);
    }
  }
  else
  {
    v6 = handleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v45 = v42;
      _os_log_impl(&dword_1D9666000, v6, OS_LOG_TYPE_DEFAULT, "Components: %@", buf, 0xCu);
    }

    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    obj = v42;
    v8 = 0;
    v9 = 0;
    v5 = 0;
    uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v38, (uint64_t)v43, 16);
    if (v13)
    {
      uint64_t v14 = *(void *)v39;
      while (2)
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v39 != v14) {
            objc_enumerationMutation(obj);
          }
          v16 = *(void **)(*((void *)&v38 + 1) + 8 * v15);
          if (v16 && objc_msgSend_count(*(void **)(*((void *)&v38 + 1) + 8 * v15), v10, v11, v12))
          {
            v17 = objc_msgSend_stringWithUTF8String_(NSString, v10, (uint64_t)"isTrustedForUI", v12);
            uint64_t v20 = objc_msgSend_objectForKeyedSubscript_(v16, v18, (uint64_t)v17, v19);

            v23 = objc_msgSend_stringWithUTF8String_(NSString, v21, (uint64_t)"ComponentName", v22);
            v26 = objc_msgSend_objectForKeyedSubscript_(v16, v24, (uint64_t)v23, v25);

            v29 = objc_msgSend_stringWithUTF8String_(NSString, v27, (uint64_t)"AuthPassed", v28);
            v32 = objc_msgSend_objectForKeyedSubscript_(v16, v30, (uint64_t)v29, v31);

            if (v20 && v26 && objc_msgSend_isEqualToString_(v26, v10, (uint64_t)v36, v12))
            {
              int64_t v33 = objc_msgSend_convertIORegDataToStatus_authPass_(v35, v10, v20, (uint64_t)v32);

              v5 = v20;
              goto LABEL_22;
            }
            v8 = v26;
            v9 = v32;
            v5 = v20;
          }
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v38, (uint64_t)v43, 16);
        if (v13) {
          continue;
        }
        break;
      }
    }
  }
  int64_t v33 = 0;
LABEL_22:

  objc_sync_exit(v35);
  return v33;
}

- (int64_t)convertIORegDataToStatus:(id)a3 authPass:(id)a4
{
  if (!a3) {
    return 0;
  }
  if (objc_msgSend_intValue(a3, a2, (uint64_t)a3, (uint64_t)a4)) {
    return 1;
  }
  return -1;
}

- (int64_t)synchronouslycopyAuthStatus
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  v3 = dispatch_queue_create("com.apple.corerepair.authsyncqueue", MEMORY[0x1E4F14430]);
  int64_t v7 = objc_msgSend_copyComponentStatus(self, v4, v5, v6);
  v13[3] = v7;
  if (!v7)
  {
    v8 = handleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1D96744F4();
    }

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1D966D9E0;
    v11[3] = &unk_1E6B6F8E0;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v3, v11);
    if (!v13[3])
    {
      v9 = handleForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1D96744C0();
      }
    }
    int64_t v7 = v13[3];
  }

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (BOOL)isFirstAuthComplete
{
  return objc_msgSend_copyComponentStatus(self, a2, v2, v3) != 0;
}

- (BOOL)_checkForComponentFailureInDefaults:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uid_t v4 = getuid();
  uint64_t v5 = handleForCategory();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (!v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D9666000, v5, OS_LOG_TYPE_DEFAULT, "Reading system health from file", buf, 2u);
    }

    uint64_t v14 = objc_msgSend_stringWithFormat_(NSString, v15, @"/var/mobile/Library/Preferences/%@.plist", v16, @"com.apple.mobilerepaird.systemhealth");
    uint64_t v19 = objc_msgSend_dictionaryWithContentsOfFile_(MEMORY[0x1E4F1C9E8], v17, (uint64_t)v14, v18);
    uint64_t v13 = v19;
    if (!v19
      || (objc_msgSend_objectForKey_(v19, v20, (uint64_t)v3, v21),
          uint64_t v22 = objc_claimAutoreleasedReturnValue(),
          int v26 = objc_msgSend_BOOLValue(v22, v23, v24, v25),
          v22,
          !v26))
    {

      LOBYTE(v13) = 0;
      goto LABEL_16;
    }
    v27 = handleForCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v3;
      _os_log_impl(&dword_1D9666000, v27, OS_LOG_TYPE_DEFAULT, "Found failed component: %@", buf, 0xCu);
    }

LABEL_14:
    LOBYTE(v13) = 1;
LABEL_16:

    goto LABEL_17;
  }
  if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D9666000, v5, OS_LOG_TYPE_DEFAULT, "Reading system health from defaults", buf, 2u);
  }

  id v7 = objc_alloc(MEMORY[0x1E4F1CB18]);
  objc_super v10 = objc_msgSend_initWithSuiteName_(v7, v8, @"com.apple.mobilerepaird.systemhealth", v9);
  LODWORD(v13) = objc_msgSend_BOOLForKey_(v10, v11, (uint64_t)v3, v12);

  if (v13)
  {
    uint64_t v14 = handleForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v3;
      _os_log_impl(&dword_1D9666000, v14, OS_LOG_TYPE_DEFAULT, "Found failed component: %@", buf, 0xCu);
    }
    goto LABEL_14;
  }
LABEL_17:

  return (char)v13;
}

- (id)_getObjectForKeyFromDefaults:(id)a3
{
  id v3 = a3;
  uid_t v4 = getuid();
  uint64_t v5 = handleForCategory();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D9666000, v5, OS_LOG_TYPE_DEFAULT, "Reading system health from defaults", buf, 2u);
    }

    id v7 = objc_alloc(MEMORY[0x1E4F1CB18]);
    objc_super v10 = objc_msgSend_initWithSuiteName_(v7, v8, @"com.apple.mobilerepaird.systemhealth", v9);
    uint64_t v13 = objc_msgSend_objectForKey_(v10, v11, (uint64_t)v3, v12);
  }
  else
  {
    if (v6)
    {
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl(&dword_1D9666000, v5, OS_LOG_TYPE_DEFAULT, "Reading system health from file", v24, 2u);
    }

    objc_super v10 = objc_msgSend_stringWithFormat_(NSString, v14, @"/var/mobile/Library/Preferences/%@.plist", v15, @"com.apple.mobilerepaird.systemhealth");
    uint64_t v18 = objc_msgSend_dictionaryWithContentsOfFile_(MEMORY[0x1E4F1C9E8], v16, (uint64_t)v10, v17);
    uint64_t v21 = v18;
    if (v18)
    {
      uint64_t v13 = objc_msgSend_objectForKey_(v18, v19, (uint64_t)v3, v20);
    }
    else
    {
      uint64_t v13 = 0;
    }
  }
  return v13;
}

- (id)findUnsealedData
{
  if (qword_1EBE27768 != -1) {
    dispatch_once(&qword_1EBE27768, &unk_1F338B118);
  }
  uint64_t v2 = (void *)qword_1EBE27770;
  return v2;
}

- (BOOL)isComponentFailed
{
  return 0;
}

- (NSString)componentName
{
  return self->componentName;
}

- (void)setComponentName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end