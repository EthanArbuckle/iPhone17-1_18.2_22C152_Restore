@interface CREnclosureStatus
- (CREnclosureStatus)init;
- (int64_t)copyComponentStatus;
@end

@implementation CREnclosureStatus

- (CREnclosureStatus)init
{
  v7.receiver = self;
  v7.super_class = (Class)CREnclosureStatus;
  v2 = [(CRComponentAuth *)&v7 init];
  v5 = v2;
  if (v2) {
    objc_msgSend_setComponentName_(v2, v3, @"Enclosure", v4);
  }
  return v5;
}

- (int64_t)copyComponentStatus
{
  if (objc_msgSend_isFDRDataClassSupported_(MEMORY[0x1E4F5CD58], a2, @"NBCl", v2))
  {
    if _os_feature_enabled_impl() && (_os_feature_enabled_impl())
    {
      objc_super v7 = 0;
LABEL_16:
      int64_t v8 = -3;
      goto LABEL_17;
    }
    objc_super v7 = objc_msgSend_findUnsealedData(self, v4, v5, v6);
    v9 = objc_opt_new();
    if (objc_msgSend_deviceSupportsRepairBootIntent(v9, v10, v11, v12))
    {
      v15 = objc_msgSend_objectForKeyedSubscript_(v7, v13, @"NBCl", v14);

      if (v15)
      {
        v18 = objc_msgSend__getObjectForKeyFromDefaults_(self, v16, @"cachedPreFlightResults", v17);
        v21 = objc_msgSend_objectForKeyedSubscript_(v18, v19, @"failComponents", v20);
        v24 = objc_msgSend_extractComponentsAndIdentifiers_(CRFDRUtils, v22, (uint64_t)v21, v23);

        uint64_t v27 = objc_msgSend_objectForKeyedSubscript_(v7, v25, @"NBCl", v26);
        if (!v27) {
          goto LABEL_15;
        }
        v30 = (void *)v27;
        v31 = (void *)MEMORY[0x1E4F1CAD0];
        v32 = objc_msgSend_objectForKeyedSubscript_(v7, v28, @"NBCl", v29);
        v35 = objc_msgSend_setWithArray_(v31, v33, (uint64_t)v32, v34);
        v36 = (void *)MEMORY[0x1E4F1CAD0];
        v39 = objc_msgSend_objectForKeyedSubscript_(v24, v37, @"NBCl", v38);
        v42 = objc_msgSend_setWithArray_(v36, v40, (uint64_t)v39, v41);
        int isEqualToSet = objc_msgSend_isEqualToSet_(v35, v43, (uint64_t)v42, v44);

        if (!isEqualToSet)
        {
LABEL_15:

          goto LABEL_16;
        }
        v46 = handleForCategory();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v48 = 0;
          _os_log_impl(&dword_1D9666000, v46, OS_LOG_TYPE_DEFAULT, "component failed preflight proceeding", v48, 2u);
        }
      }
    }
    else
    {
    }
    int64_t v8 = 1;
  }
  else
  {
    objc_super v7 = 0;
    int64_t v8 = 0;
  }
LABEL_17:

  return v8;
}

@end