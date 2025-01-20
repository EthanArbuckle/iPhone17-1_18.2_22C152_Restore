@interface CRBatteryStatus
- (BOOL)isComponentFailed;
- (CRBatteryStatus)init;
- (int64_t)copyComponentStatus;
@end

@implementation CRBatteryStatus

- (CRBatteryStatus)init
{
  v7.receiver = self;
  v7.super_class = (Class)CRBatteryStatus;
  v2 = [(CRComponentAuth *)&v7 init];
  v5 = v2;
  if (v2) {
    objc_msgSend_setComponentName_(v2, v3, @"Battery", v4);
  }
  return v5;
}

- (int64_t)copyComponentStatus
{
  if ((objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, a2, @"bcrt", v2) & 1) == 0
    && !objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v5, @"vcrt", v6))
  {
    return 0;
  }
  if (!_os_feature_enabled_impl() || (_os_feature_enabled_impl() & 1) == 0)
  {
    if _os_feature_enabled_impl() && (_os_feature_enabled_impl()) {
      return -1;
    }
    v11 = objc_msgSend_findUnsealedData(self, v8, v9, v10);
    v12 = objc_opt_new();
    if (objc_msgSend_deviceSupportsRepairBootIntent(v12, v13, v14, v15))
    {
      v18 = objc_msgSend_objectForKeyedSubscript_(v11, v16, @"bcrt", v17);
      if (v18)
      {

        goto LABEL_15;
      }
      v23 = objc_msgSend_objectForKeyedSubscript_(v11, v19, @"vcrt", v20);

      if (v23)
      {
LABEL_15:
        v24 = objc_msgSend__getObjectForKeyFromDefaults_(self, v21, @"cachedPreFlightResults", v22);
        v27 = objc_msgSend_objectForKeyedSubscript_(v24, v25, @"failComponents", v26);
        v30 = objc_msgSend_extractComponentsAndIdentifiers_(CRFDRUtils, v28, (uint64_t)v27, v29);

        v35 = objc_msgSend_objectForKeyedSubscript_(v11, v31, @"bcrt", v32);
        v36 = (void *)0x263EFF000;
        if (v35)
        {
          v37 = (void *)MEMORY[0x263EFFA08];
          v38 = objc_msgSend_objectForKeyedSubscript_(v11, v33, @"bcrt", v34);
          v41 = objc_msgSend_setWithArray_(v37, v39, (uint64_t)v38, v40);
          v42 = (void *)MEMORY[0x263EFFA08];
          v3 = objc_msgSend_objectForKeyedSubscript_(v30, v43, @"bcrt", v44);
          v36 = objc_msgSend_setWithArray_(v42, v45, (uint64_t)v3, v46);
          if (objc_msgSend_isEqualToSet_(v41, v47, (uint64_t)v36, v48))
          {

LABEL_24:
            v67 = handleForCategory(0);
            if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_21FBF2000, v67, OS_LOG_TYPE_DEFAULT, "component failed preflight proceeding", buf, 2u);
            }

            goto LABEL_27;
          }
          v70 = v41;
          v71 = v38;
        }
        v51 = objc_msgSend_objectForKeyedSubscript_(v11, v33, @"vcrt", v34);
        if (v51)
        {
          v69 = v3;
          v73 = v24;
          v52 = (void *)MEMORY[0x263EFFA08];
          v53 = objc_msgSend_objectForKeyedSubscript_(v11, v49, @"vcrt", v50);
          v56 = objc_msgSend_setWithArray_(v52, v54, (uint64_t)v53, v55);
          v57 = (void *)MEMORY[0x263EFFA08];
          v72 = v30;
          v60 = objc_msgSend_objectForKeyedSubscript_(v30, v58, @"vcrt", v59);
          v63 = objc_msgSend_setWithArray_(v57, v61, (uint64_t)v60, v62);
          char isEqualToSet = objc_msgSend_isEqualToSet_(v56, v64, (uint64_t)v63, v65);

          if (v35)
          {
          }
          v30 = v72;
          v24 = v73;
          if (isEqualToSet) {
            goto LABEL_24;
          }
        }
        else
        {

          if (v35)
          {
          }
        }

        int64_t AuthCPComponentStatus = -3;
        goto LABEL_31;
      }
    }
    else
    {
    }
LABEL_27:
    int64_t AuthCPComponentStatus = objc_msgSend_getAuthCPComponentStatus_(self, v21, @"Battery", v22);
LABEL_31:

    return AuthCPComponentStatus;
  }
  return -3;
}

- (BOOL)isComponentFailed
{
  return objc_msgSend_getAuthCPComponentStatus_(self, a2, @"Battery", v2) == -1;
}

@end