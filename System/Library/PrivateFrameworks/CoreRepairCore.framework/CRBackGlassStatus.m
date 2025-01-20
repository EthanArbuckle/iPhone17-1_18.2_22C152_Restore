@interface CRBackGlassStatus
- (CRBackGlassStatus)init;
- (int64_t)copyComponentStatus;
@end

@implementation CRBackGlassStatus

- (CRBackGlassStatus)init
{
  v7.receiver = self;
  v7.super_class = (Class)CRBackGlassStatus;
  v2 = [(CRComponentAuth *)&v7 init];
  v5 = v2;
  if (v2) {
    objc_msgSend_setComponentName_(v2, v3, @"BackGlass", v4);
  }
  return v5;
}

- (int64_t)copyComponentStatus
{
  if ((objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, a2, @"bCfg", v2) & 1) != 0
    || objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v6, @"LCfg", v7))
  {
    if _os_feature_enabled_impl() && (_os_feature_enabled_impl())
    {
      v11 = 0;
LABEL_28:
      int64_t v23 = -3;
      goto LABEL_29;
    }
    v11 = objc_msgSend_findUnsealedData(self, v8, v9, v10);
    v12 = objc_opt_new();
    if (objc_msgSend_deviceSupportsRepairBootIntent(v12, v13, v14, v15))
    {
      v18 = objc_msgSend_objectForKeyedSubscript_(v11, v16, @"bCfg", v17);
      if (v18)
      {

        goto LABEL_12;
      }
      v24 = objc_msgSend_objectForKeyedSubscript_(v11, v19, @"LCfg", v20);

      if (v24)
      {
LABEL_12:
        v25 = objc_msgSend__getObjectForKeyFromDefaults_(self, v21, @"cachedPreFlightResults", v22);
        v28 = objc_msgSend_objectForKeyedSubscript_(v25, v26, @"failComponents", v27);
        v31 = objc_msgSend_extractComponentsAndIdentifiers_(CRFDRUtils, v29, (uint64_t)v28, v30);

        v36 = objc_msgSend_objectForKeyedSubscript_(v11, v32, @"bCfg", v33);
        if (v36)
        {
          v37 = (void *)MEMORY[0x263EFFA08];
          v38 = objc_msgSend_objectForKeyedSubscript_(v11, v34, @"bCfg", v35);
          v41 = objc_msgSend_setWithArray_(v37, v39, (uint64_t)v38, v40);
          v42 = (void *)MEMORY[0x263EFFA08];
          v3 = objc_msgSend_objectForKeyedSubscript_(v31, v43, @"bCfg", v44);
          uint64_t v4 = objc_msgSend_setWithArray_(v42, v45, (uint64_t)v3, v46);
          if (objc_msgSend_isEqualToSet_(v41, v47, (uint64_t)v4, v48))
          {

LABEL_21:
            v69 = handleForCategory(0);
            if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_21FBF2000, v69, OS_LOG_TYPE_DEFAULT, "component failed preflight proceeding", buf, 2u);
            }

            goto LABEL_24;
          }
          v71 = v41;
          v73 = v38;
        }
        v51 = objc_msgSend_objectForKeyedSubscript_(v11, v34, @"LCfg", v35, v71);
        if (v51)
        {
          v75 = v25;
          v52 = (void *)MEMORY[0x263EFFA08];
          v53 = objc_msgSend_objectForKeyedSubscript_(v11, v49, @"LCfg", v50);
          uint64_t v56 = objc_msgSend_setWithArray_(v52, v54, (uint64_t)v53, v55);
          v57 = v31;
          v58 = (void *)v56;
          v59 = (void *)MEMORY[0x263EFFA08];
          v74 = v57;
          v62 = objc_msgSend_objectForKeyedSubscript_(v57, v60, @"LCfg", v61);
          v65 = objc_msgSend_setWithArray_(v59, v63, (uint64_t)v62, v64);
          char isEqualToSet = objc_msgSend_isEqualToSet_(v58, v66, (uint64_t)v65, v67);

          if (v36)
          {
          }
          v31 = v74;
          v25 = v75;
          if (isEqualToSet) {
            goto LABEL_21;
          }
        }
        else
        {

          if (v36)
          {
          }
        }

        goto LABEL_28;
      }
    }
    else
    {
    }
LABEL_24:
    int64_t v23 = 1;
    goto LABEL_29;
  }
  v11 = 0;
  int64_t v23 = 0;
LABEL_29:

  return v23;
}

@end