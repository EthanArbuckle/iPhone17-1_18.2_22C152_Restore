@interface CRFaceIDStatus
- (BOOL)isComponentFailed;
- (CRFaceIDStatus)init;
- (int64_t)copyComponentStatus;
@end

@implementation CRFaceIDStatus

- (CRFaceIDStatus)init
{
  v7.receiver = self;
  v7.super_class = (Class)CRFaceIDStatus;
  v2 = [(CRComponentAuth *)&v7 init];
  v5 = v2;
  if (v2) {
    objc_msgSend_setComponentName_(v2, v3, @"FaceID", v4);
  }
  return v5;
}

- (int64_t)copyComponentStatus
{
  if (!MGGetBoolAnswer())
  {
    v3 = 0;
    int64_t v4 = 0;
    goto LABEL_55;
  }
  if _os_feature_enabled_impl() && (_os_feature_enabled_impl())
  {
    v3 = 0;
    int64_t v4 = -1;
    goto LABEL_55;
  }
  if _os_feature_enabled_impl() && (_os_feature_enabled_impl())
  {
    v3 = 0;
    int64_t v4 = -3;
    goto LABEL_55;
  }
  v3 = objc_msgSend_findUnsealedData(self, v5, v6, v7);
  v8 = objc_opt_new();
  if (objc_msgSend_deviceSupportsRepairBootIntent(v8, v9, v10, v11))
  {
    v14 = objc_msgSend_objectForKeyedSubscript_(v3, v12, @"psd2", v13);
    if (v14)
    {

      goto LABEL_14;
    }
    v20 = objc_msgSend_objectForKeyedSubscript_(v3, v15, @"prpc", v16);

    if (v20)
    {
LABEL_14:
      v21 = objc_msgSend__getObjectForKeyFromDefaults_(self, v17, @"cachedPreFlightResults", v18);
      v24 = objc_msgSend_objectForKeyedSubscript_(v21, v22, @"failComponents", v23);
      v27 = objc_msgSend_extractComponentsAndIdentifiers_(CRFDRUtils, v25, (uint64_t)v24, v26);

      v30 = objc_msgSend_objectForKeyedSubscript_(v21, v28, @"passComponents", v29);
      v33 = objc_msgSend_extractComponentsAndIdentifiers_(CRFDRUtils, v31, (uint64_t)v30, v32);

      v36 = objc_msgSend_spcResults_(MEMORY[0x1E4F5CD68], v34, (uint64_t)v21, v35);
      v133 = objc_msgSend_objectForKeyedSubscript_(v36, v37, @"pass", v38);
      v43 = objc_msgSend_objectForKeyedSubscript_(v3, v39, @"psd2", v40);
      unint64_t v44 = 0x1E4F1C000uLL;
      v134 = v27;
      v135 = v33;
      v132 = v36;
      if (v43)
      {
        v45 = (void *)MEMORY[0x1E4F1CAD0];
        v46 = objc_msgSend_objectForKeyedSubscript_(v3, v41, @"psd2", v42);
        uint64_t v49 = objc_msgSend_setWithArray_(v45, v47, (uint64_t)v46, v48);
        v50 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v53 = objc_msgSend_objectForKeyedSubscript_(v27, v51, @"psd2", v52);
        v54 = v50;
        v55 = (void *)v49;
        v56 = (void *)v53;
        v30 = objc_msgSend_setWithArray_(v54, v57, v53, v58);
        if (objc_msgSend_isEqualToSet_(v55, v59, (uint64_t)v30, v60))
        {

          v61 = v132;
          v33 = v135;
LABEL_23:
          v83 = handleForCategory();
          if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D9666000, v83, OS_LOG_TYPE_DEFAULT, "component failed preflight proceeding", buf, 2u);
          }

          int64_t v4 = 0;
          int v84 = 1;
          goto LABEL_50;
        }
        v128 = v56;
        v129 = v55;
        v130 = v46;
        v33 = v135;
      }
      v64 = objc_msgSend_objectForKeyedSubscript_(v3, v41, @"prpc", v42);
      v131 = v21;
      if (v64)
      {
        v65 = (void *)MEMORY[0x1E4F1CAD0];
        v66 = objc_msgSend_objectForKeyedSubscript_(v3, v62, @"prpc", v63);
        v69 = objc_msgSend_setWithArray_(v65, v67, (uint64_t)v66, v68);
        v70 = (void *)MEMORY[0x1E4F1CAD0];
        v73 = objc_msgSend_objectForKeyedSubscript_(v27, v71, @"prpc", v72);
        v76 = objc_msgSend_setWithArray_(v70, v74, (uint64_t)v73, v75);
        char isEqualToSet = objc_msgSend_isEqualToSet_(v69, v77, (uint64_t)v76, v78);

        if (v43)
        {
        }
        v21 = v131;
        v61 = v132;
        char v82 = isEqualToSet;
        v27 = v134;
        v33 = v135;
        unint64_t v44 = 0x1E4F1C000;
        if (v82) {
          goto LABEL_23;
        }
      }
      else
      {

        v61 = v132;
        if (v43)
        {
        }
      }
      uint64_t v85 = objc_msgSend_objectForKeyedSubscript_(v3, v80, @"psd2", v81);
      v88 = (void *)v85;
      if (v85)
      {
        v127 = (void *)v85;
        v89 = *(void **)(v44 + 2768);
        v130 = objc_msgSend_objectForKeyedSubscript_(v3, v86, @"psd2", v87);
        v92 = objc_msgSend_setWithArray_(v89, v90, (uint64_t)v130, v91);
        unint64_t v93 = v44;
        v94 = *(void **)(v44 + 2768);
        v128 = objc_msgSend_objectForKeyedSubscript_(v33, v95, @"psd2", v96);
        v33 = objc_msgSend_setWithArray_(v94, v97, (uint64_t)v128, v98);
        v129 = v92;
        if (objc_msgSend_isEqualToSet_(v92, v99, (uint64_t)v33, v100)
          && (objc_msgSend_containsObject_(v133, v86, @"IPHONE COMP FACEID", v87) & 1) == 0)
        {
          v88 = v127;
          if (!objc_msgSend_containsObject_(v133, v86, @"IPAD FRONT CAMERA", v87))
          {

            goto LABEL_47;
          }
          unint64_t v44 = v93;
        }
        else
        {
          unint64_t v44 = v93;
          v88 = v127;
        }
      }
      v103 = objc_msgSend_objectForKeyedSubscript_(v3, v86, @"prpc", v87);
      if (!v103)
      {

        v124 = v133;
        if (v88)
        {
        }
        int v84 = 0;
        int64_t v4 = -3;
        v21 = v131;
        v33 = v135;
LABEL_51:

        if (!v84) {
          goto LABEL_55;
        }
        goto LABEL_52;
      }
      unint64_t v104 = v44;
      v105 = *(void **)(v44 + 2768);
      v106 = objc_msgSend_objectForKeyedSubscript_(v3, v101, @"prpc", v102);
      v109 = objc_msgSend_setWithArray_(v105, v107, (uint64_t)v106, v108);
      v110 = *(void **)(v104 + 2768);
      v113 = objc_msgSend_objectForKeyedSubscript_(v135, v111, @"prpc", v112);
      v116 = objc_msgSend_setWithArray_(v110, v114, (uint64_t)v113, v115);
      if (objc_msgSend_isEqualToSet_(v109, v117, (uint64_t)v116, v118)
        && (objc_msgSend_containsObject_(v133, v119, @"IPHONE COMP FACEID", v120) & 1) == 0)
      {
        char v123 = objc_msgSend_containsObject_(v133, v121, @"IPAD FRONT CAMERA", v122) ^ 1;
      }
      else
      {
        char v123 = 0;
      }

      if (v88)
      {
      }
      v21 = v131;
      v61 = v132;
      v27 = v134;
      if ((v123 & 1) == 0)
      {
        int v84 = 0;
        int64_t v4 = -3;
        v33 = v135;
LABEL_50:
        v124 = v133;
        goto LABEL_51;
      }
LABEL_47:
      v125 = handleForCategory();
      v33 = v135;
      if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v136 = 0;
        _os_log_impl(&dword_1D9666000, v125, OS_LOG_TYPE_DEFAULT, "FaceID component passed preflight with no pass SPC", v136, 2u);
      }

      int v84 = 0;
      int64_t v4 = -1;
      goto LABEL_50;
    }
  }
  else
  {
  }
LABEL_52:
  if (objc_msgSend_isComponentFailed(self, v17, v19, v18)) {
    int64_t v4 = -1;
  }
  else {
    int64_t v4 = 1;
  }
LABEL_55:

  return v4;
}

- (BOOL)isComponentFailed
{
  int64_t v4 = self;
  v5 = objc_msgSend_componentName(self, a2, v2, v3);
  v8 = objc_msgSend_stringByAppendingString_(v5, v6, @"Failed", v7);
  LOBYTE(v4) = objc_msgSend__checkForComponentFailureInDefaults_(v4, v9, (uint64_t)v8, v10);

  return (char)v4;
}

@end