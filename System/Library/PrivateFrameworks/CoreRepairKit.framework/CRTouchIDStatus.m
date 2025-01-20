@interface CRTouchIDStatus
- (BOOL)_isLegacyMesaInInvalidState;
- (BOOL)isComponentFailed;
- (CRTouchIDStatus)init;
- (int64_t)copyComponentStatus;
@end

@implementation CRTouchIDStatus

- (CRTouchIDStatus)init
{
  v7.receiver = self;
  v7.super_class = (Class)CRTouchIDStatus;
  v2 = [(CRComponentAuth *)&v7 init];
  v5 = v2;
  if (v2) {
    objc_msgSend_setComponentName_(v2, v3, @"TouchID", v4);
  }
  return v5;
}

- (int64_t)copyComponentStatus
{
  if (!MGGetBoolAnswer()) {
    return 0;
  }
  if _os_feature_enabled_impl() && (_os_feature_enabled_impl()) {
    return -1;
  }
  if (!_os_feature_enabled_impl() || (_os_feature_enabled_impl() & 1) == 0)
  {
    if (objc_msgSend__isLegacyMesaInInvalidState(self, v3, v4, v5)) {
      return -1;
    }
    v10 = objc_msgSend_findUnsealedData(self, v7, v8, v9);
    v11 = objc_opt_new();
    if (objc_msgSend_deviceSupportsRepairBootIntent(v11, v12, v13, v14))
    {
      v17 = objc_msgSend_objectForKeyedSubscript_(v10, v15, @"MSRk", v16);

      if (!v17) {
        goto LABEL_18;
      }
      v11 = objc_msgSend__getObjectForKeyFromDefaults_(self, v18, @"cachedPreFlightResults", v20);
      v23 = objc_msgSend_objectForKeyedSubscript_(v11, v21, @"failComponents", v22);
      v26 = objc_msgSend_extractComponentsAndIdentifiers_(CRFDRUtils, v24, (uint64_t)v23, v25);

      uint64_t v29 = objc_msgSend_objectForKeyedSubscript_(v10, v27, @"MSRk", v28);
      if (!v29) {
        goto LABEL_21;
      }
      v32 = (void *)v29;
      v33 = (void *)MEMORY[0x1E4F1CAD0];
      v34 = objc_msgSend_objectForKeyedSubscript_(v10, v30, @"MSRk", v31);
      v37 = objc_msgSend_setWithArray_(v33, v35, (uint64_t)v34, v36);
      v38 = (void *)MEMORY[0x1E4F1CAD0];
      v41 = objc_msgSend_objectForKeyedSubscript_(v26, v39, @"MSRk", v40);
      v44 = objc_msgSend_setWithArray_(v38, v42, (uint64_t)v41, v43);
      int isEqualToSet = objc_msgSend_isEqualToSet_(v37, v45, (uint64_t)v44, v46);

      if (!isEqualToSet)
      {
LABEL_21:

        int64_t v6 = -3;
LABEL_22:

        return v6;
      }
      v48 = handleForCategory();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v50 = 0;
        _os_log_impl(&dword_1D9666000, v48, OS_LOG_TYPE_DEFAULT, "component failed preflight proceeding", v50, 2u);
      }
    }
LABEL_18:
    if (objc_msgSend_isComponentFailed(self, v18, v19, v20)) {
      int64_t v6 = -1;
    }
    else {
      int64_t v6 = 1;
    }
    goto LABEL_22;
  }
  return -3;
}

- (BOOL)_isLegacyMesaInInvalidState
{
  v20[1] = *MEMORY[0x1E4F143B8];
  if (!objc_msgSend_isFDRDataClassSupported_(MEMORY[0x1E4F5CD58], a2, @"FSCl", v2)) {
    return 0;
  }
  uint64_t v19 = @"QueryPath";
  v20[0] = @"QueryPath_Straight";
  uint64_t v4 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v3, (uint64_t)v20, (uint64_t)&v19, 1);
  uint64_t v5 = (void *)ZhuGeCopyValue();
  if ((objc_msgSend_isEqualToString_(v5, v6, @"ProvisionedWithUID", v7) & 1) != 0
    || (objc_msgSend_isEqualToString_(v5, v8, @"ProvisionedLockedWithUID", v9) & 1) != 0
    || (objc_msgSend_isEqualToString_(v5, v10, @"ProvisionedUnknownKey", v11) & 1) != 0
    || (objc_msgSend_isEqualToString_(v5, v12, @"ATE", v13) & 1) != 0)
  {
    BOOL v14 = 0;
  }
  else
  {
    uint64_t v16 = handleForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138543362;
      v18 = v5;
      _os_log_impl(&dword_1D9666000, v16, OS_LOG_TYPE_DEFAULT, "Invalid Mesa: %{public}@", (uint8_t *)&v17, 0xCu);
    }

    BOOL v14 = 1;
  }

  return v14;
}

- (BOOL)isComponentFailed
{
  if (objc_msgSend__isLegacyMesaInInvalidState(self, a2, v2, v3)) {
    return 1;
  }
  uint64_t v9 = objc_msgSend_componentName(self, v5, v6, v7);
  v12 = objc_msgSend_stringByAppendingString_(v9, v10, @"Failed", v11);
  char v15 = objc_msgSend__checkForComponentFailureInDefaults_(self, v13, (uint64_t)v12, v14);

  return v15;
}

@end