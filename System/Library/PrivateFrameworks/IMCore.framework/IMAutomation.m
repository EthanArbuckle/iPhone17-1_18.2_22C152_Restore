@interface IMAutomation
- (BOOL)checkArgumentValidity:(id)a3 forExpectedNumberOfArguments:(int)a4;
- (id)IMCoreAutomationPerformOperationWithDictionary:(id)a3;
- (id)callIMCoreMethodWithDictionary:(id)a3;
- (id)startConversationFrom:(id)a3 andReceiveAt:(id)a4;
@end

@implementation IMAutomation

- (BOOL)checkArgumentValidity:(id)a3 forExpectedNumberOfArguments:(int)a4
{
  id v7 = a3;
  if (a4 < 1)
  {
    BOOL v20 = 1;
  }
  else
  {
    v8 = objc_msgSend_stringWithFormat_(NSString, v5, @"arg%d", v6, 1);
    v11 = objc_msgSend_objectForKey_(v7, v9, (uint64_t)v8, v10);

    if (v11)
    {
      int v14 = 1;
      do
      {
        int v15 = v14;
        if (a4 == v14) {
          break;
        }
        ++v14;
        v16 = objc_msgSend_stringWithFormat_(NSString, v12, @"arg%d", v13, (v15 + 1));
        v19 = objc_msgSend_objectForKey_(v7, v17, (uint64_t)v16, v18);
      }
      while (v19);
      BOOL v20 = v15 >= a4;
    }
    else
    {
      BOOL v20 = 0;
    }
  }

  return v20;
}

- (id)callIMCoreMethodWithDictionary:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (!v4)
  {
    v17 = 0;
    goto LABEL_34;
  }
  v8 = objc_msgSend_objectForKey_(v4, v5, @"methodName", v6);
  v11 = v8;
  if (v8 && !objc_msgSend_isEqualToString_(v8, v9, (uint64_t)&stru_1EF8E78C8, v10))
  {
    if (objc_msgSend_isEqualToString_(v11, v12, @"clearAttachmentsUploadedToCloudkit", v13))
    {
      uint64_t v18 = objc_opt_new();
      uint64_t v24 = objc_msgSend_clearAttachmentsUploadedToCloudkit(v18, v21, v22, v23);
LABEL_10:
      v17 = (void *)v24;
LABEL_32:

      goto LABEL_33;
    }
    if (objc_msgSend_isEqualToString_(v11, v19, @"deleteAttachmentWithMessageGUID", v20)
      && objc_msgSend_checkArgumentValidity_forExpectedNumberOfArguments_(self, v25, (uint64_t)v7, 2))
    {
      uint64_t v18 = objc_opt_new();
      v29 = objc_msgSend_objectForKeyedSubscript_(v7, v27, @"arg1", v28);
      v32 = objc_msgSend_objectForKeyedSubscript_(v7, v30, @"arg2", v31);
      uint64_t v36 = objc_msgSend_integerValue(v32, v33, v34, v35);
      uint64_t v38 = objc_msgSend_deleteAttachmentWithMessageGUID_andFilePathIndex_(v18, v37, (uint64_t)v29, v36);
LABEL_30:
      v17 = (void *)v38;

      goto LABEL_31;
    }
    if (objc_msgSend_isEqualToString_(v11, v25, @"dictionaryFromGUID", v26)
      && objc_msgSend_checkArgumentValidity_forExpectedNumberOfArguments_(self, v39, (uint64_t)v7, 1))
    {
      uint64_t v18 = objc_opt_new();
      v29 = objc_msgSend_objectForKeyedSubscript_(v7, v41, @"arg1", v42);
      uint64_t v45 = objc_msgSend_dictionaryFromGUID_(v18, v43, (uint64_t)v29, v44);
    }
    else
    {
      if (objc_msgSend_isEqualToString_(v11, v39, @"fileSizeForMessageGUID", v40)
        && objc_msgSend_checkArgumentValidity_forExpectedNumberOfArguments_(self, v46, (uint64_t)v7, 2))
      {
        uint64_t v18 = objc_opt_new();
        v29 = objc_msgSend_objectForKeyedSubscript_(v7, v48, @"arg1", v49);
        v32 = objc_msgSend_objectForKeyedSubscript_(v7, v50, @"arg2", v51);
        uint64_t v55 = objc_msgSend_integerValue(v32, v52, v53, v54);
        uint64_t v38 = objc_msgSend_fileSizeForMessageGUID_withFilePathIndex_(v18, v56, (uint64_t)v29, v55);
        goto LABEL_30;
      }
      if (objc_msgSend_isEqualToString_(v11, v46, @"loadHighResolutionFileForMessageGUID", v47)&& objc_msgSend_checkArgumentValidity_forExpectedNumberOfArguments_(self, v57, (uint64_t)v7, 2))
      {
        uint64_t v18 = objc_opt_new();
        v29 = objc_msgSend_objectForKeyedSubscript_(v7, v59, @"arg1", v60);
        v32 = objc_msgSend_objectForKeyedSubscript_(v7, v61, @"arg2", v62);
        uint64_t v66 = objc_msgSend_integerValue(v32, v63, v64, v65);
        uint64_t v38 = objc_msgSend_loadHighResolutionFileForMessageGUID_withFilePathIndex_(v18, v67, (uint64_t)v29, v66);
        goto LABEL_30;
      }
      if (!objc_msgSend_isEqualToString_(v11, v57, @"startConversationFrom", v58)
        || !objc_msgSend_checkArgumentValidity_forExpectedNumberOfArguments_(self, v68, (uint64_t)v7, 2))
      {
        if (!objc_msgSend_isEqualToString_(v11, v68, @"uploadAttachmentToCloudkitWithMessageGUID", v69)|| !objc_msgSend_checkArgumentValidity_forExpectedNumberOfArguments_(self, v73, (uint64_t)v7, 2))
        {
          id v84 = objc_alloc(MEMORY[0x1E4F1C9E8]);
          uint64_t v18 = objc_msgSend_stringWithFormat_(NSString, v85, @"Could not find method %@", v86, v11);
          uint64_t v24 = objc_msgSend_initWithObjectsAndKeys_(v84, v87, (uint64_t)v18, v88, @"error", 0);
          goto LABEL_10;
        }
        uint64_t v18 = objc_opt_new();
        v29 = objc_msgSend_objectForKeyedSubscript_(v7, v74, @"arg1", v75);
        v32 = objc_msgSend_objectForKeyedSubscript_(v7, v76, @"arg2", v77);
        uint64_t v81 = objc_msgSend_integerValue(v32, v78, v79, v80);
        uint64_t v38 = objc_msgSend_uploadAttachmentToCloudkitWithMessageGUID_andFilePathIndex_(v18, v82, (uint64_t)v29, v81);
        goto LABEL_30;
      }
      uint64_t v18 = objc_msgSend_objectForKeyedSubscript_(v7, v68, @"arg1", v69);
      v29 = objc_msgSend_objectForKeyedSubscript_(v7, v70, @"arg2", v71);
      uint64_t v45 = objc_msgSend_startConversationFrom_andReceiveAt_(self, v72, (uint64_t)v18, (uint64_t)v29);
    }
    v17 = (void *)v45;
LABEL_31:

    goto LABEL_32;
  }
  id v14 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  v17 = objc_msgSend_initWithObjectsAndKeys_(v14, v15, @"No method name was passed in", v16, @"error", 0);
  if (IMOSLoggingEnabled())
  {
    uint64_t v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v18, OS_LOG_TYPE_INFO, "No method name was passed in", buf, 2u);
    }
    goto LABEL_32;
  }
LABEL_33:

LABEL_34:

  return v17;
}

- (id)IMCoreAutomationPerformOperationWithDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_1A4B3451C;
  uint64_t v23 = sub_1A4B34374;
  id v24 = 0;
  if (objc_msgSend_isMainThread(MEMORY[0x1E4F29060], v5, v6, v7))
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4AF7000, v10, OS_LOG_TYPE_INFO, "IMCoreAutomationPerformOperationWithDictionary method call already on main queue", buf, 2u);
      }
    }
    uint64_t v11 = objc_msgSend_callIMCoreMethodWithDictionary_(self, v8, (uint64_t)v4, v9);
    v12 = (void *)v20[5];
    v20[5] = v11;
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1A4BC803C;
    block[3] = &unk_1E5B7BDA8;
    v17 = &v19;
    block[4] = self;
    id v16 = v4;
    dispatch_sync(MEMORY[0x1E4F14428], block);
  }
  id v13 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v13;
}

- (id)startConversationFrom:(id)a3 andReceiveAt:(id)a4
{
  uint64_t v180 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v11 = objc_msgSend_length(v5, v8, v9, v10);
  if (!v6 || !v11)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v7, v12, @"Did not pass in a valid set of arguments", @"error");
    id v41 = v7;
    goto LABEL_69;
  }
  v164 = v7;
  v165 = v6;
  int v15 = objc_msgSend_sharedInstance(IMAccountController, v12, v13, v14);
  uint64_t v19 = objc_msgSend_iMessageService(IMServiceImpl, v16, v17, v18);
  uint64_t v22 = objc_msgSend_accountsForService_(v15, v20, (uint64_t)v19, v21);

  long long v176 = 0u;
  long long v177 = 0u;
  long long v174 = 0u;
  long long v175 = 0u;
  id v23 = v22;
  uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v174, (uint64_t)v179, 16);
  if (!v25)
  {
    unint64_t v30 = 0;
    unint64_t v31 = 0;
    goto LABEL_17;
  }
  uint64_t v29 = v25;
  unint64_t v30 = 0;
  unint64_t v31 = 0;
  uint64_t v32 = *(void *)v175;
  do
  {
    for (uint64_t i = 0; i != v29; ++i)
    {
      if (*(void *)v175 != v32) {
        objc_enumerationMutation(v23);
      }
      uint64_t v34 = *(void **)(*((void *)&v174 + 1) + 8 * i);
      if (objc_msgSend_accountType(v34, v26, v27, v28) == 2)
      {
        uint64_t v38 = (void *)v31;
        unint64_t v39 = v30;
        unint64_t v31 = (unint64_t)v34;
      }
      else
      {
        uint64_t v38 = (void *)v30;
        unint64_t v39 = (unint64_t)v34;
        if (objc_msgSend_accountType(v34, v35, v36, v37) != 1) {
          continue;
        }
      }
      id v40 = v34;

      unint64_t v30 = v39;
    }
    uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v26, (uint64_t)&v174, (uint64_t)v179, 16);
  }
  while (v29);
LABEL_17:

  if (!(v30 | v31))
  {
    id v7 = v164;
    objc_msgSend_setObject_forKeyedSubscript_(v164, v42, @"No usable iMessageAccounts found", @"error");
    id v88 = v164;
    goto LABEL_68;
  }
  id v43 = (id)v30;
  uint64_t v49 = objc_msgSend_stringWithFormat_(NSString, v44, @"P:%@", v45, v5);
  if (v30 || (v50 = (void *)v31) == 0)
  {
    if (!v43 || (v50 = v43, v31))
    {
      if (!v31
        || (objc_msgSend_login((void *)v31, v46, v47, v48),
            uint64_t v51 = objc_claimAutoreleasedReturnValue(),
            char isEqualToString = objc_msgSend_isEqualToString_(v49, v52, (uint64_t)v51, v53),
            v51,
            v50 = (void *)v31,
            (isEqualToString & 1) == 0))
      {
        v50 = v43;
      }
    }
  }
  v162 = v49;
  id v169 = v43;
  id v163 = v50;
  long long v170 = 0u;
  long long v171 = 0u;
  long long v172 = 0u;
  long long v173 = 0u;
  id obj = v165;
  uint64_t v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v55, (uint64_t)&v170, (uint64_t)v178, 16);
  if (!v56)
  {
    v167 = &stru_1EF8E78C8;
    int v61 = 1;
    goto LABEL_47;
  }
  uint64_t v60 = v56;
  v167 = &stru_1EF8E78C8;
  uint64_t v168 = *(void *)v171;
  LOBYTE(v61) = 1;
  while (2)
  {
    uint64_t v62 = 0;
    while (2)
    {
      if (*(void *)v171 != v168) {
        objc_enumerationMutation(obj);
      }
      v63 = *(void **)(*((void *)&v170 + 1) + 8 * v62);
      if (!objc_msgSend_length(v63, v57, (uint64_t)v58, v59))
      {
        id v7 = v164;
        objc_msgSend_setObject_forKeyedSubscript_(v164, v64, @"Did not pass in valid alias", @"error");
        id v89 = v164;

        goto LABEL_45;
      }
      v67 = objc_msgSend_vettedAliases(v169, v64, v65, v66);
      char v70 = objc_msgSend_containsObject_(v67, v68, (uint64_t)v63, v69);

      if (v70)
      {
        if ((v61 & 1) == 0)
        {
          int v61 = 0;
          goto LABEL_40;
        }
LABEL_36:
        v76 = objc_msgSend_aliases(v169, v57, (uint64_t)v58, v59);
        char v79 = objc_msgSend_containsObject_(v76, v77, (uint64_t)v63, v78);

        if ((v79 & 1) != 0
          || (objc_msgSend_addAlias_(v169, v57, (uint64_t)v63, v59),
              objc_msgSend_aliases(v169, v80, v81, v82),
              v83 = objc_claimAutoreleasedReturnValue(),
              char v86 = objc_msgSend_containsObject_(v83, v84, (uint64_t)v63, v85),
              v83,
              uint64_t v58 = @"Failed to add alias to alias array | ",
              (v86 & 1) != 0))
        {
          int v61 = 1;
          goto LABEL_40;
        }
      }
      else
      {
        int v71 = objc_msgSend_validateAlias_(v169, v57, (uint64_t)v63, v59);
        uint64_t v58 = @"Failed to validate alias | ";
        if (v71)
        {
          v72 = objc_msgSend_vettedAliases(v169, v57, @"Failed to validate alias | ", v59);
          char v75 = objc_msgSend_containsObject_(v72, v73, (uint64_t)v63, v74);

          uint64_t v58 = @"Failed to validate alias | ";
          if (v75) {
            goto LABEL_36;
          }
        }
      }
      uint64_t v87 = objc_msgSend_stringByAppendingString_(v167, v57, (uint64_t)v58, v59);

      int v61 = 0;
      v167 = (__CFString *)v87;
LABEL_40:
      if (v60 != ++v62) {
        continue;
      }
      break;
    }
    uint64_t v60 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v57, (uint64_t)&v170, (uint64_t)v178, 16);
    if (v60) {
      continue;
    }
    break;
  }
LABEL_47:

  if (v163 == v169
    && (objc_msgSend_aliases(v169, v93, v94, v95),
        v96 = objc_claimAutoreleasedReturnValue(),
        char v99 = objc_msgSend_containsObject_(v96, v97, (uint64_t)v5, v98),
        v96,
        (v99 & 1) == 0))
  {
    id v7 = v164;
    objc_msgSend_setObject_forKeyedSubscript_(v164, v93, @"Cannot set apple id caller id if this alias is not in alias list", @"error");
    id v142 = v164;
LABEL_45:
    v90 = v169;
    v91 = v162;
    v92 = v167;
  }
  else
  {
    v100 = objc_msgSend_vettedAliases(v163, v93, v94, v95);
    char v103 = objc_msgSend_containsObject_(v100, v101, (uint64_t)v5, v102);

    id v7 = v164;
    if ((v103 & 1) == 0)
    {
      if (objc_msgSend_validateAlias_(v163, v104, (uint64_t)v5, v106)
        && (objc_msgSend_vettedAliases(v163, v104, v107, v106),
            v108 = objc_claimAutoreleasedReturnValue(),
            char v111 = objc_msgSend_containsObject_(v108, v109, (uint64_t)v5, v110),
            v108,
            (v111 & 1) != 0))
      {
        int v61 = 1;
      }
      else
      {
        uint64_t v112 = objc_msgSend_stringByAppendingString_(v167, v104, @"Failed to validate callerID | ", v106);

        int v61 = 0;
        v167 = (__CFString *)v112;
      }
    }
    v113 = objc_msgSend_iMessageService(IMServiceImpl, v104, v105, v106);
    IMPreferredAccountForService(v113);
    id v114 = (id)objc_claimAutoreleasedReturnValue();

    if (v114 == v163)
    {
      if (v61) {
        goto LABEL_58;
      }
      v90 = v169;
      v91 = v162;
      v92 = v167;
      objc_msgSend_setObject_forKeyedSubscript_(v164, v115, (uint64_t)v167, @"error");
    }
    else
    {
      v118 = objc_msgSend_service(v163, v115, v116, v117);
      char v119 = IMSetPreferredAccountForService(v163, v118);

      if ((v119 & 1) == 0)
      {
        v90 = v169;
        v91 = v162;
        v92 = v167;
        objc_msgSend_stringByAppendingString_(v167, v115, @"Preferred account was not set to specified login account", v117);
        goto LABEL_62;
      }
LABEL_58:
      v120 = objc_msgSend_displayName(v163, v115, v116, v117);
      char v123 = objc_msgSend_isEqualToString_(v120, v121, (uint64_t)v5, v122);

      if (v123)
      {
        v90 = v169;
        v91 = v162;
        v92 = v167;
        objc_msgSend_aliases(v169, v124, v125, v126);
        goto LABEL_66;
      }
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.ft.CallerID.changed", 0, 0, 1u);
      objc_msgSend_setDisplayName_(v163, v128, (uint64_t)v5, v129);
      v133 = objc_msgSend_displayName(v163, v130, v131, v132);
      char v136 = objc_msgSend_isEqualToString_(v133, v134, (uint64_t)v5, v135);

      v90 = v169;
      v91 = v162;
      v92 = v167;
      if ((v136 & 1) == 0)
      {
        objc_msgSend_stringByAppendingString_(v167, v137, @"Failed to change display name | ", v139);
        uint64_t v140 = LABEL_62:;

        v92 = (void *)v140;
        objc_msgSend_setObject_forKeyedSubscript_(v164, v141, v140, @"error");
      }
    }
    objc_msgSend_aliases(v90, v137, v138, v139);
    v143 = LABEL_66:;
    objc_msgSend_setObject_forKeyedSubscript_(v164, v144, (uint64_t)v143, @"receivingAliases");

    v148 = objc_msgSend_vettedAliases(v90, v145, v146, v147);
    objc_msgSend_setObject_forKeyedSubscript_(v164, v149, (uint64_t)v148, @"receivingVettedAliases");

    v153 = objc_msgSend_displayName(v163, v150, v151, v152);
    objc_msgSend_setObject_forKeyedSubscript_(v164, v154, (uint64_t)v153, @"sendingDisplayName");

    v158 = objc_msgSend_login(v163, v155, v156, v157);
    objc_msgSend_setObject_forKeyedSubscript_(v164, v159, (uint64_t)v158, @"sendingLogin");

    id v160 = v164;
  }

LABEL_68:
  id v6 = v165;
LABEL_69:

  return v7;
}

@end