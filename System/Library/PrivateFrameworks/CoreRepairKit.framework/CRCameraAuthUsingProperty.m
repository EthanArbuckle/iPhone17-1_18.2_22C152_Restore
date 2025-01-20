@interface CRCameraAuthUsingProperty
- (CRCameraAuthUsingProperty)init;
- (int64_t)copyComponentStatus;
@end

@implementation CRCameraAuthUsingProperty

- (CRCameraAuthUsingProperty)init
{
  v7.receiver = self;
  v7.super_class = (Class)CRCameraAuthUsingProperty;
  v2 = [(CRComponentAuth *)&v7 init];
  v5 = v2;
  if (v2) {
    objc_msgSend_setComponentName_(v2, v3, @"Camera", v4);
  }
  return v5;
}

- (int64_t)copyComponentStatus
{
  v2 = self;
  objc_sync_enter(v2);
  if (objc_msgSend_isFDRPropertySupported_(MEMORY[0x1E4F5CD58], v3, @"RCSn", v4))
  {
    if _os_feature_enabled_impl() && (_os_feature_enabled_impl())
    {
      v8 = 0;
LABEL_16:
      int64_t v9 = -3;
      goto LABEL_17;
    }
    v8 = objc_msgSend_findUnsealedData(v2, v5, v6, v7);
    v10 = objc_opt_new();
    if (objc_msgSend_deviceSupportsRepairBootIntent(v10, v11, v12, v13))
    {
      v16 = objc_msgSend_objectForKeyedSubscript_(v8, v14, @"RCSn", v15);

      if (!v16)
      {
LABEL_14:
        int64_t v9 = 1;
        goto LABEL_17;
      }
      v10 = objc_msgSend__getObjectForKeyFromDefaults_(v2, v17, @"cachedPreFlightResults", v18);
      v21 = objc_msgSend_objectForKeyedSubscript_(v10, v19, @"failComponents", v20);
      v24 = objc_msgSend_extractComponentsAndIdentifiers_(CRFDRUtils, v22, (uint64_t)v21, v23);

      v29 = objc_msgSend_objectForKeyedSubscript_(v8, v25, @"RCSn", v26);
      if (!v29) {
        goto LABEL_15;
      }
      v30 = (void *)MEMORY[0x1E4F1CAD0];
      v31 = objc_msgSend_objectForKeyedSubscript_(v8, v27, @"RCSn", v28);
      v34 = objc_msgSend_setWithArray_(v30, v32, (uint64_t)v31, v33);
      v35 = (void *)MEMORY[0x1E4F1CAD0];
      v38 = objc_msgSend_objectForKeyedSubscript_(v24, v36, @"RCSn", v37);
      v41 = objc_msgSend_setWithArray_(v35, v39, (uint64_t)v38, v40);
      LODWORD(v35) = objc_msgSend_isEqualToSet_(v34, v42, (uint64_t)v41, v43);

      if (!v35)
      {
LABEL_15:

        goto LABEL_16;
      }
      v44 = handleForCategory();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v46 = 0;
        _os_log_impl(&dword_1D9666000, v44, OS_LOG_TYPE_DEFAULT, "component failed preflight proceeding", v46, 2u);
      }
    }
    goto LABEL_14;
  }
  v8 = 0;
  int64_t v9 = 0;
LABEL_17:

  objc_sync_exit(v2);
  return v9;
}

@end