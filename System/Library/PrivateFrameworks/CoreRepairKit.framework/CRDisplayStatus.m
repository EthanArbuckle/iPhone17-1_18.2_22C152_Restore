@interface CRDisplayStatus
- (BOOL)isComponentFailed;
- (CRDisplayStatus)init;
- (int64_t)copyComponentStatus;
@end

@implementation CRDisplayStatus

- (CRDisplayStatus)init
{
  v7.receiver = self;
  v7.super_class = (Class)CRDisplayStatus;
  v2 = [(CRComponentAuth *)&v7 init];
  v5 = v2;
  if (v2) {
    objc_msgSend_setComponentName_(v2, v3, @"Display", v4);
  }
  return v5;
}

- (int64_t)copyComponentStatus
{
  int isFDRDataClassSupported = objc_msgSend_isFDRDataClassSupported_(MEMORY[0x1E4F5CD58], a2, @"tcrt", v2);
  int v7 = objc_msgSend_isFDRDataClassSupported_(MEMORY[0x1E4F5CD58], v5, @"dCfg", v6);
  if ((isFDRDataClassSupported & 1) == 0 && !v7)
  {
    v8 = 0;
    int64_t AuthCPComponentStatus = 0;
    goto LABEL_61;
  }
  if _os_feature_enabled_impl() && (_os_feature_enabled_impl())
  {
    v8 = 0;
    int64_t AuthCPComponentStatus = -3;
    goto LABEL_61;
  }
  if (isFDRDataClassSupported && _os_feature_enabled_impl() && (_os_feature_enabled_impl() & 1) != 0)
  {
    v8 = 0;
    int64_t AuthCPComponentStatus = -1;
    goto LABEL_61;
  }
  v8 = objc_msgSend_findUnsealedData(self, v10, v11, v12);
  v13 = objc_opt_new();
  if ((objc_msgSend_deviceSupportsRepairBootIntent(v13, v14, v15, v16) & 1) == 0)
  {

    goto LABEL_15;
  }
  v19 = objc_msgSend_objectForKeyedSubscript_(v8, v17, @"tcrt", v18);
  if (v19)
  {

    goto LABEL_18;
  }
  v24 = objc_msgSend_objectForKeyedSubscript_(v8, v20, @"dCfg", v21);

  if (!v24)
  {
LABEL_15:
    if (!isFDRDataClassSupported)
    {
      int64_t AuthCPComponentStatus = 1;
      goto LABEL_61;
    }
LABEL_60:
    int64_t AuthCPComponentStatus = objc_msgSend_getAuthCPComponentStatus_(self, v22, @"TouchController", v23);
    goto LABEL_61;
  }
LABEL_18:
  v138 = self;
  v25 = objc_msgSend__getObjectForKeyFromDefaults_(self, v22, @"cachedPreFlightResults", v23);
  v28 = objc_msgSend_objectForKeyedSubscript_(v25, v26, @"failComponents", v27);
  v31 = objc_msgSend_extractComponentsAndIdentifiers_(CRFDRUtils, v29, (uint64_t)v28, v30);

  v32 = CRFDRUtils;
  v35 = objc_msgSend_objectForKeyedSubscript_(v25, v33, @"passComponents", v34);
  uint64_t v141 = objc_msgSend_extractComponentsAndIdentifiers_(CRFDRUtils, v36, (uint64_t)v35, v37);

  v40 = objc_msgSend_spcResults_(MEMORY[0x1E4F5CD68], v38, (uint64_t)v25, v39);
  v139 = objc_msgSend_objectForKeyedSubscript_(v40, v41, @"pass", v42);
  v47 = objc_msgSend_objectForKeyedSubscript_(v8, v43, @"tcrt", v44);
  v140 = v31;
  if (v47)
  {
    v48 = (void *)MEMORY[0x1E4F1CAD0];
    v49 = objc_msgSend_objectForKeyedSubscript_(v8, v45, @"tcrt", v46);
    uint64_t v52 = objc_msgSend_setWithArray_(v48, v50, (uint64_t)v49, v51);
    v53 = (void *)MEMORY[0x1E4F1CAD0];
    v54 = (void *)v52;
    uint64_t v57 = objc_msgSend_objectForKeyedSubscript_(v31, v55, @"tcrt", v56);
    v58 = v53;
    v32 = (__objc2_class *)v57;
    v35 = objc_msgSend_setWithArray_(v58, v59, v57, v60);
    if (objc_msgSend_isEqualToSet_(v54, v61, (uint64_t)v35, v62))
    {

      v63 = (void *)v141;
      v64 = v31;
LABEL_27:
      v84 = handleForCategory();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D9666000, v84, OS_LOG_TYPE_DEFAULT, "component failed preflight proceeding", buf, 2u);
      }

      int64_t AuthCPComponentStatus = 0;
      int v85 = 0;
      goto LABEL_56;
    }
    v129 = v54;
    v134 = v49;
  }
  v135 = v32;
  v67 = objc_msgSend_objectForKeyedSubscript_(v8, v45, @"dCfg", v46, v129);
  v136 = v25;
  v137 = v40;
  v63 = (void *)v141;
  if (v67)
  {
    v68 = (void *)MEMORY[0x1E4F1CAD0];
    v69 = objc_msgSend_objectForKeyedSubscript_(v8, v65, @"dCfg", v66);
    v72 = objc_msgSend_setWithArray_(v68, v70, (uint64_t)v69, v71);
    v73 = (void *)MEMORY[0x1E4F1CAD0];
    v76 = objc_msgSend_objectForKeyedSubscript_(v31, v74, @"dCfg", v75);
    v79 = objc_msgSend_setWithArray_(v73, v77, (uint64_t)v76, v78);
    char isEqualToSet = objc_msgSend_isEqualToSet_(v72, v80, (uint64_t)v79, v81);

    if (v47)
    {
    }
    v25 = v136;
    v40 = v137;
    v64 = v31;
    v63 = (void *)v141;
    if (isEqualToSet) {
      goto LABEL_27;
    }
  }
  else
  {

    v64 = v31;
    if (v47)
    {
    }
  }
  uint64_t v86 = objc_msgSend_objectForKeyedSubscript_(v8, v82, @"tcrt", v83);
  v89 = (void *)v86;
  if (!v86) {
    goto LABEL_36;
  }
  v133 = (void *)v86;
  v90 = (void *)MEMORY[0x1E4F1CAD0];
  v135 = objc_msgSend_objectForKeyedSubscript_(v8, v87, @"tcrt", v88);
  v93 = objc_msgSend_setWithArray_(v90, v91, (uint64_t)v135, v92);
  v94 = (void *)MEMORY[0x1E4F1CAD0];
  v97 = objc_msgSend_objectForKeyedSubscript_(v63, v95, @"tcrt", v96);
  v47 = objc_msgSend_setWithArray_(v94, v98, (uint64_t)v97, v99);
  v134 = v93;
  if (!objc_msgSend_isEqualToSet_(v93, v100, (uint64_t)v47, v101)
    || (objc_msgSend_containsObject_(v139, v87, @"IPHONE COMP DISPLAY", v88) & 1) != 0)
  {
    v130 = v97;
    v89 = v133;
LABEL_36:
    objc_msgSend_objectForKeyedSubscript_(v8, v87, @"dCfg", v88, v130);
    goto LABEL_37;
  }
  v89 = v133;
  if (!objc_msgSend_containsObject_(v139, v87, @"IPAD COMP DISPLAY", v88))
  {

    goto LABEL_52;
  }
  objc_msgSend_objectForKeyedSubscript_(v8, v125, @"dCfg", v126, v97);
  v104 = LABEL_37:;
  if (v104)
  {
    v105 = (void *)MEMORY[0x1E4F1CAD0];
    objc_msgSend_objectForKeyedSubscript_(v8, v102, @"dCfg", v103);
    v107 = v106 = v63;
    v110 = objc_msgSend_setWithArray_(v105, v108, (uint64_t)v107, v109);
    v111 = (void *)MEMORY[0x1E4F1CAD0];
    v114 = objc_msgSend_objectForKeyedSubscript_(v106, v112, @"dCfg", v113);
    v117 = objc_msgSend_setWithArray_(v111, v115, (uint64_t)v114, v116);
    if (objc_msgSend_isEqualToSet_(v110, v118, (uint64_t)v117, v119)
      && (objc_msgSend_containsObject_(v139, v120, @"IPHONE COMP DISPLAY", v121) & 1) == 0)
    {
      char v124 = objc_msgSend_containsObject_(v139, v122, @"IPAD COMP DISPLAY", v123) ^ 1;
    }
    else
    {
      char v124 = 0;
    }

    if (v89)
    {
    }
    v64 = v140;
    v63 = (void *)v141;
    v40 = v137;
    if ((v124 & 1) == 0)
    {
      int v85 = 1;
      int64_t AuthCPComponentStatus = -3;
LABEL_55:
      v25 = v136;
      goto LABEL_56;
    }
LABEL_52:
    v127 = handleForCategory();
    if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v142 = 0;
      _os_log_impl(&dword_1D9666000, v127, OS_LOG_TYPE_DEFAULT, "Display component passed preflight with no pass SPC", v142, 2u);
    }

    int v85 = 1;
    int64_t AuthCPComponentStatus = -1;
    goto LABEL_55;
  }

  if (v89)
  {
  }
  int v85 = 1;
  int64_t AuthCPComponentStatus = -3;
  v40 = v137;
LABEL_56:

  if (!v85) {
    int64_t AuthCPComponentStatus = 1;
  }
  if ((v85 & 1) == 0)
  {
    self = v138;
    if (((isFDRDataClassSupported ^ 1) & 1) == 0) {
      goto LABEL_60;
    }
  }
LABEL_61:

  return AuthCPComponentStatus;
}

- (BOOL)isComponentFailed
{
  int isFDRDataClassSupported = objc_msgSend_isFDRDataClassSupported_(MEMORY[0x1E4F5CD58], a2, @"tcrt", v2);
  if (isFDRDataClassSupported) {
    LOBYTE(isFDRDataClassSupported) = objc_msgSend_getAuthCPComponentStatus_(self, v5, @"TouchController", v6) == -1;
  }
  return isFDRDataClassSupported;
}

@end