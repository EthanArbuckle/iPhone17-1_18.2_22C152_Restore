@interface IMCoreAutomationHook
+ (id)stringFromAutomationErrorCode:(int64_t)a3;
- (IMAccount)bestiMessageAccount;
- (id)chatForHandles:(id)a3 error:(id *)a4 results:(id)a5;
- (id)existingChatForGroupID:(id)a3 error:(id *)a4 results:(id)a5;
- (id)handlesFromStrings:(id)a3 error:(id *)a4 results:(id)a5;
@end

@implementation IMCoreAutomationHook

- (IMAccount)bestiMessageAccount
{
  imessageAccount = self->_imessageAccount;
  if (!imessageAccount)
  {
    v6 = objc_msgSend_sharedInstance(IMAccountController, a2, v2, v3);
    v10 = objc_msgSend_iMessageService(IMServiceImpl, v7, v8, v9);
    objc_msgSend_bestAccountForService_(v6, v11, (uint64_t)v10, v12);
    v13 = (IMAccount *)objc_claimAutoreleasedReturnValue();
    v14 = self->_imessageAccount;
    self->_imessageAccount = v13;

    imessageAccount = self->_imessageAccount;
  }

  return imessageAccount;
}

- (id)chatForHandles:(id)a3 error:(id *)a4 results:(id)a5
{
  v70[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  if (objc_msgSend_count(v7, v9, v10, v11))
  {
    v15 = objc_msgSend_sharedRegistry(IMChatRegistry, v12, v13, v14);
    objc_msgSend_chatWithHandles_(v15, v16, (uint64_t)v7, v17);
    id v18 = (id)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v22 = objc_msgSend_groupID(v18, v19, v20, v21);
      objc_msgSend_setValue_forKey_(v8, v23, (uint64_t)v22, @"group_id");

      id v18 = v18;
      v24 = v18;
    }
    else
    {
      v65[0] = *MEMORY[0x1E4F28568];
      v44 = NSString;
      v45 = objc_msgSend_stringWithFormat_(NSString, v19, @"Condition failed : '%s'", v21, "(chat) == nil");
      v48 = objc_msgSend_stringFromAutomationErrorCode_(IMCoreAutomationHook, v46, 5, v47);
      v51 = objc_msgSend_stringWithFormat_(v44, v49, @"%@ (%@)", v50, v45, v48);
      v65[1] = @"IMCoreAutomationHookParameterErrorLocation";
      v66[0] = v51;
      v54 = objc_msgSend_stringWithFormat_(NSString, v52, @"%s:%d", v53, "/Library/Caches/com.apple.xbs/Sources/MessagesCore/IMCore/IMCore/Source/Automation Hooks/IMCoreAutomationHook.m", 49);
      v66[1] = v54;
      v56 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v55, (uint64_t)v66, (uint64_t)v65, 2);

      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v57, @"IMCoreAutomationHookErrorDomain", 5, v56);
      id v58 = (id)objc_claimAutoreleasedReturnValue();
      if (v58)
      {
        if (IMOSLoggingEnabled())
        {
          v59 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
          {
            v63 = objc_msgSend_description(v58, v60, v61, v62);
            *(_DWORD *)buf = 138412290;
            v68 = v63;
            _os_log_impl(&dword_1A4AF7000, v59, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
          }
        }
        if (a4 && !*a4) {
          *a4 = v58;
        }
      }

      v24 = 0;
    }
  }
  else
  {
    v69[0] = *MEMORY[0x1E4F28568];
    v25 = NSString;
    v26 = objc_msgSend_stringWithFormat_(NSString, v12, @"Condition failed : '%s'", v14, "[handles count] == 0");
    v29 = objc_msgSend_stringFromAutomationErrorCode_(IMCoreAutomationHook, v27, 5, v28);
    v32 = objc_msgSend_stringWithFormat_(v25, v30, @"%@ (%@)", v31, v26, v29);
    v69[1] = @"IMCoreAutomationHookParameterErrorLocation";
    v70[0] = v32;
    v35 = objc_msgSend_stringWithFormat_(NSString, v33, @"%s:%d", v34, "/Library/Caches/com.apple.xbs/Sources/MessagesCore/IMCore/IMCore/Source/Automation Hooks/IMCoreAutomationHook.m", 47);
    v70[1] = v35;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v36, (uint64_t)v70, (uint64_t)v69, 2);
    id v18 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v37, @"IMCoreAutomationHookErrorDomain", 5, v18);
    id v38 = (id)objc_claimAutoreleasedReturnValue();
    if (v38)
    {
      if (IMOSLoggingEnabled())
      {
        v39 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          v43 = objc_msgSend_description(v38, v40, v41, v42);
          *(_DWORD *)buf = 138412290;
          v68 = v43;
          _os_log_impl(&dword_1A4AF7000, v39, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
        }
      }
      if (a4 && !*a4) {
        *a4 = v38;
      }
    }

    v24 = 0;
  }

  return v24;
}

- (id)handlesFromStrings:(id)a3 error:(id *)a4 results:(id)a5
{
  v92[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  if (objc_msgSend_count(v7, v9, v10, v11))
  {
    objc_msgSend_array(MEMORY[0x1E4F1CA48], v12, v13, v14);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    id v16 = v7;
    uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v82, (uint64_t)v88, 16);
    if (v21)
    {
      uint64_t v22 = *(void *)v83;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v83 != v22) {
            objc_enumerationMutation(v16);
          }
          uint64_t v24 = *(void *)(*((void *)&v82 + 1) + 8 * i);
          v25 = objc_msgSend_bestiMessageAccount(self, v18, v19, v20);
          uint64_t v28 = objc_msgSend_imHandleWithID_(v25, v26, v24, v27);

          if (v28) {
            objc_msgSend_addObject_(v15, v29, (uint64_t)v28, v30);
          }
        }
        uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v18, (uint64_t)&v82, (uint64_t)v88, 16);
      }
      while (v21);
    }

    uint64_t v34 = objc_msgSend_count(v16, v31, v32, v33);
    if (v34 == objc_msgSend_count(v15, v35, v36, v37))
    {
      objc_msgSend_setObject_forKey_(v8, v38, (uint64_t)v16, @"members");
      id v15 = v15;
      v40 = v15;
      goto LABEL_32;
    }
    v86[0] = *MEMORY[0x1E4F28568];
    v60 = NSString;
    uint64_t v61 = objc_msgSend_stringWithFormat_(NSString, v38, @"Condition failed : '%s'", v39, "[handleStrings count] != [outArray count]");
    v64 = objc_msgSend_stringFromAutomationErrorCode_(IMCoreAutomationHook, v62, 5, v63);
    v67 = objc_msgSend_stringWithFormat_(v60, v65, @"%@ (%@)", v66, v61, v64);
    v86[1] = @"IMCoreAutomationHookParameterErrorLocation";
    v87[0] = v67;
    v70 = objc_msgSend_stringWithFormat_(NSString, v68, @"%s:%d", v69, "/Library/Caches/com.apple.xbs/Sources/MessagesCore/IMCore/IMCore/Source/Automation Hooks/IMCoreAutomationHook.m", 68);
    v87[1] = v70;
    v72 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v71, (uint64_t)v87, (uint64_t)v86, 2);

    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v73, @"IMCoreAutomationHookErrorDomain", 5, v72);
    id v74 = (id)objc_claimAutoreleasedReturnValue();
    if (v74)
    {
      if (IMOSLoggingEnabled())
      {
        v75 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
        {
          v79 = objc_msgSend_description(v74, v76, v77, v78);
          *(_DWORD *)buf = 138412290;
          v90 = v79;
          _os_log_impl(&dword_1A4AF7000, v75, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
        }
      }
      if (a4 && !*a4) {
        *a4 = v74;
      }
    }
  }
  else
  {
    v91[0] = *MEMORY[0x1E4F28568];
    uint64_t v41 = NSString;
    uint64_t v42 = objc_msgSend_stringWithFormat_(NSString, v12, @"Condition failed : '%s'", v14, "[handleStrings count] == 0");
    v45 = objc_msgSend_stringFromAutomationErrorCode_(IMCoreAutomationHook, v43, 5, v44);
    v48 = objc_msgSend_stringWithFormat_(v41, v46, @"%@ (%@)", v47, v42, v45);
    v91[1] = @"IMCoreAutomationHookParameterErrorLocation";
    v92[0] = v48;
    v51 = objc_msgSend_stringWithFormat_(NSString, v49, @"%s:%d", v50, "/Library/Caches/com.apple.xbs/Sources/MessagesCore/IMCore/IMCore/Source/Automation Hooks/IMCoreAutomationHook.m", 58);
    v92[1] = v51;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v52, (uint64_t)v92, (uint64_t)v91, 2);
    id v15 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v53, @"IMCoreAutomationHookErrorDomain", 5, v15);
    id v54 = (id)objc_claimAutoreleasedReturnValue();
    if (v54)
    {
      if (IMOSLoggingEnabled())
      {
        v55 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
        {
          v59 = objc_msgSend_description(v54, v56, v57, v58);
          *(_DWORD *)buf = 138412290;
          v90 = v59;
          _os_log_impl(&dword_1A4AF7000, v55, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
        }
      }
      if (a4 && !*a4) {
        *a4 = v54;
      }
    }
  }
  v40 = 0;
LABEL_32:

  return v40;
}

- (id)existingChatForGroupID:(id)a3 error:(id *)a4 results:(id)a5
{
  v43[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  uint64_t v12 = objc_msgSend_sharedRegistry(IMChatRegistry, v9, v10, v11);
  id v15 = objc_msgSend_existingChatWithGroupID_(v12, v13, (uint64_t)v7, v14);

  if (v15)
  {
    id v18 = v15;
  }
  else
  {
    v42[0] = *MEMORY[0x1E4F28568];
    uint64_t v19 = NSString;
    uint64_t v20 = objc_msgSend_stringWithFormat_(NSString, v16, @"Condition failed : '%s'", v17, "(chat) == nil");
    v23 = objc_msgSend_stringFromAutomationErrorCode_(IMCoreAutomationHook, v21, 5, v22);
    v26 = objc_msgSend_stringWithFormat_(v19, v24, @"%@ (%@)", v25, v20, v23);
    v42[1] = @"IMCoreAutomationHookParameterErrorLocation";
    v43[0] = v26;
    v29 = objc_msgSend_stringWithFormat_(NSString, v27, @"%s:%d", v28, "/Library/Caches/com.apple.xbs/Sources/MessagesCore/IMCore/IMCore/Source/Automation Hooks/IMCoreAutomationHook.m", 78);
    v43[1] = v29;
    uint64_t v31 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v30, (uint64_t)v43, (uint64_t)v42, 2);

    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v32, @"IMCoreAutomationHookErrorDomain", 5, v31);
    id v33 = (id)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v34 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          id v38 = objc_msgSend_description(v33, v35, v36, v37);
          *(_DWORD *)buf = 138412290;
          uint64_t v41 = v38;
          _os_log_impl(&dword_1A4AF7000, v34, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
        }
      }
      if (a4 && !*a4) {
        *a4 = v33;
      }
    }
  }

  return v15;
}

+ (id)stringFromAutomationErrorCode:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      objc_msgSend_stringWithFormat_(NSString, a2, @"%s:%ld", v3, "IMCoreAutomationHookErrorCodeDomainTimeOut", 1);
      goto LABEL_10;
    case 2:
      objc_msgSend_stringWithFormat_(NSString, a2, @"%s:%ld", v3, "IMCoreAutomationHookErrorCodeInvalidParameters", 2);
      goto LABEL_10;
    case 3:
      objc_msgSend_stringWithFormat_(NSString, a2, @"%s:%ld", v3, "IMCoreAutomationHookErrorCodeGroupCreationFailure", 3);
      goto LABEL_10;
    case 4:
      objc_msgSend_stringWithFormat_(NSString, a2, @"%s:%ld", v3, "IMCoreAutomationHookErrorCodeChatNotFound", 4);
      goto LABEL_10;
    case 5:
      objc_msgSend_stringWithFormat_(NSString, a2, @"%s:%ld", v3, "IMCoreAutomationHookErrorCodeConditionFailed", 5);
LABEL_10:
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      break;
  }
  return a1;
}

- (void).cxx_destruct
{
}

@end