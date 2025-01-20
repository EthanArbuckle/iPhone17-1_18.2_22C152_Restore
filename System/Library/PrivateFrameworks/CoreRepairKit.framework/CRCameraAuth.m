@interface CRCameraAuth
- (BOOL)isComponentFailed;
- (CRCameraAuth)init;
- (id)getCmClValidationStatus;
- (int64_t)copyComponentStatus;
@end

@implementation CRCameraAuth

- (CRCameraAuth)init
{
  v7.receiver = self;
  v7.super_class = (Class)CRCameraAuth;
  v2 = [(CRComponentAuth *)&v7 init];
  v5 = v2;
  if (v2) {
    objc_msgSend_setComponentName_(v2, v3, @"Camera", v4);
  }
  return v5;
}

- (int64_t)copyComponentStatus
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  if ((objc_msgSend_isFDRDataClassSupported_(MEMORY[0x1E4F5CD58], v3, @"CmCl", v4) & 1) == 0)
  {
    v5 = 0;
    v6 = 0;
    int64_t isEqualToString = 1;
    goto LABEL_28;
  }
  if (!_os_feature_enabled_impl() || (_os_feature_enabled_impl() & 1) == 0)
  {
    if _os_feature_enabled_impl() && (_os_feature_enabled_impl())
    {
      v5 = 0;
      v6 = 0;
LABEL_27:
      int64_t isEqualToString = -1;
      goto LABEL_28;
    }
    v6 = objc_msgSend_findUnsealedData(v2, v8, v9, v10);
    v11 = objc_opt_new();
    if ((objc_msgSend_deviceSupportsRepairBootIntent(v11, v12, v13, v14) & 1) == 0)
    {

      goto LABEL_23;
    }
    v17 = objc_msgSend_objectForKeyedSubscript_(v6, v15, @"CmCl", v16);

    if (!v17) {
      goto LABEL_23;
    }
    v21 = objc_msgSend__getObjectForKeyFromDefaults_(v2, v18, @"cachedPreFlightResults", v20);
    v24 = objc_msgSend_objectForKeyedSubscript_(v21, v22, @"failComponents", v23);
    v92 = objc_msgSend_extractComponentsAndIdentifiers_(CRFDRUtils, v25, (uint64_t)v24, v26);

    v29 = objc_msgSend_objectForKeyedSubscript_(v21, v27, @"passComponents", v28);
    v91 = objc_msgSend_extractComponentsAndIdentifiers_(CRFDRUtils, v30, (uint64_t)v29, v31);

    v89 = objc_msgSend_spcResults_(MEMORY[0x1E4F5CD68], v32, (uint64_t)v21, v33);
    v90 = objc_msgSend_objectForKeyedSubscript_(v89, v34, @"pass", v35);
    v40 = objc_msgSend_objectForKeyedSubscript_(v6, v36, @"CmCl", v37);
    if (v40)
    {
      v41 = (void *)MEMORY[0x1E4F1CAD0];
      v42 = objc_msgSend_objectForKeyedSubscript_(v6, v38, @"CmCl", v39);
      v45 = objc_msgSend_setWithArray_(v41, v43, (uint64_t)v42, v44);
      v46 = (void *)MEMORY[0x1E4F1CAD0];
      v49 = objc_msgSend_objectForKeyedSubscript_(v92, v47, @"CmCl", v48);
      v52 = objc_msgSend_setWithArray_(v46, v50, (uint64_t)v49, v51);
      int isEqualToSet = objc_msgSend_isEqualToSet_(v45, v53, (uint64_t)v52, v54);

      if (isEqualToSet)
      {
        v56 = handleForCategory();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D9666000, v56, OS_LOG_TYPE_DEFAULT, "component failed preflight proceeding", buf, 2u);
        }

        int64_t isEqualToString = 0;
        int v57 = 1;
        goto LABEL_22;
      }
    }
    v60 = objc_msgSend_objectForKeyedSubscript_(v6, v38, @"CmCl", v39);
    if (v60)
    {
      v61 = (void *)MEMORY[0x1E4F1CAD0];
      v62 = objc_msgSend_objectForKeyedSubscript_(v6, v58, @"CmCl", v59);
      v65 = objc_msgSend_setWithArray_(v61, v63, (uint64_t)v62, v64);
      v66 = (void *)MEMORY[0x1E4F1CAD0];
      v69 = objc_msgSend_objectForKeyedSubscript_(v91, v67, @"CmCl", v68);
      v72 = objc_msgSend_setWithArray_(v66, v70, (uint64_t)v69, v71);
      if (objc_msgSend_isEqualToSet_(v65, v73, (uint64_t)v72, v74)
        && (objc_msgSend_containsObject_(v90, v75, @"IPHONE COMP CAMERA", v76) & 1) == 0)
      {
        char v87 = objc_msgSend_containsObject_(v90, v77, @"IPHONE COMP RCAM", v78);

        if ((v87 & 1) == 0)
        {
          v88 = handleForCategory();
          if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D9666000, v88, OS_LOG_TYPE_DEFAULT, "Camera component passed preflight with no pass SPC", buf, 2u);
          }

          int v57 = 0;
          int64_t isEqualToString = -1;
LABEL_22:

          if (!v57)
          {
            v5 = 0;
            goto LABEL_28;
          }
LABEL_23:
          v5 = objc_msgSend_getCmClValidationStatus(v2, v18, v19, v20);
          v79 = handleForCategory();
          if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v94 = v5;
            _os_log_impl(&dword_1D9666000, v79, OS_LOG_TYPE_DEFAULT, "FDR Validation status:%@", buf, 0xCu);
          }

          if ((objc_msgSend_isEqualToString_(v5, v80, @"Fail", v81) & 1) == 0
            && (objc_msgSend_isEqualToString_(v5, v82, @"Invalid", v83) & 1) == 0)
          {
            int64_t isEqualToString = objc_msgSend_isEqualToString_(v5, v84, @"Pass", v85);
            goto LABEL_28;
          }
          goto LABEL_27;
        }
      }
      else
      {
      }
    }
    int v57 = 0;
    int64_t isEqualToString = -3;
    goto LABEL_22;
  }
  v5 = 0;
  v6 = 0;
  int64_t isEqualToString = -3;
LABEL_28:

  objc_sync_exit(v2);
  return isEqualToString;
}

- (BOOL)isComponentFailed
{
  uint64_t v4 = objc_msgSend_getCmClValidationStatus(self, a2, v2, v3);
  if (objc_msgSend_isEqualToString_(v4, v5, @"Fail", v6)) {
    char isEqualToString = 1;
  }
  else {
    char isEqualToString = objc_msgSend_isEqualToString_(v4, v7, @"Invalid", v8);
  }

  return isEqualToString;
}

- (id)getCmClValidationStatus
{
  uint64_t isFDRDataClassSupported = objc_msgSend_isFDRDataClassSupported_(MEMORY[0x1E4F5CD58], a2, @"CmCl", v2);
  if (isFDRDataClassSupported)
  {
    io_registry_entry_t v5 = sub_1D966D260(isFDRDataClassSupported, v4);
    if (v5)
    {
      CFProperty = (void *)IORegistryEntryCreateCFProperty(v5, @"CmClValidationStatus", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
      goto LABEL_8;
    }
    objc_super v7 = handleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1D9674660();
    }
  }
  CFProperty = 0;
LABEL_8:
  return CFProperty;
}

@end