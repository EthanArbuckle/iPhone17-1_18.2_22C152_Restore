@interface IMAutomationGroupChat
- (id)_runChangeParticipantsQueryWithGroupID:(id)a3 participants:(id)a4 timeOut:(double)a5 error:(id *)a6 optArguments:(id)a7 addParticipants:(BOOL)a8;
- (id)addParticipantsWithGroupID:(id)a3 participants:(id)a4 timeOut:(double)a5 error:(id *)a6 optArguments:(id)a7;
- (id)changeGroupNameWithGroupID:(id)a3 newName:(id)a4 timeOut:(double)a5 error:(id *)a6 optArguments:(id)a7;
- (id)createGroupChatWithDestinationIDs:(id)a3 error:(id *)a4 optArguments:(id)a5;
- (id)groupNameWithGroupID:(id)a3 timeOut:(double)a4 error:(id *)a5 optArguments:(id)a6;
- (id)groupParticipantsWithGroupID:(id)a3 timeOut:(double)a4 error:(id *)a5 optArguments:(id)a6;
- (id)removeParticipantsWithGroupID:(id)a3 participants:(id)a4 timeOut:(double)a5 error:(id *)a6 optArguments:(id)a7;
@end

@implementation IMAutomationGroupChat

- (id)createGroupChatWithDestinationIDs:(id)a3 error:(id *)a4 optArguments:(id)a5
{
  v67[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v61 = a5;
  v12 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v9, v10, v11);
  v16 = objc_msgSend_handlesFromStrings_error_results_(self, v13, (uint64_t)v8, (uint64_t)a4, v12);
  if (v16)
  {
    v19 = objc_msgSend_chatForHandles_error_results_(self, v14, (uint64_t)v16, (uint64_t)a4, v12);
    if (v19)
    {
      id v20 = v12;
      goto LABEL_23;
    }
    v62[0] = *MEMORY[0x1E4F28568];
    v40 = NSString;
    v41 = objc_msgSend_stringWithFormat_(NSString, v17, @"Condition failed : '%s'", v18, "(chat) == nil");
    v44 = objc_msgSend_stringFromAutomationErrorCode_(IMCoreAutomationHook, v42, 5, v43);
    v47 = objc_msgSend_stringWithFormat_(v40, v45, @"%@ (%@)", v46, v41, v44);
    v63[0] = v47;
    v62[1] = @"IMCoreAutomationHookParameterErrorLocation";
    v50 = objc_msgSend_stringWithFormat_(NSString, v48, @"%s:%d", v49, "/Library/Caches/com.apple.xbs/Sources/MessagesCore/IMCore/IMCore/Source/Automation Hooks/IMAutomationGroupChat.m", 32);
    v63[1] = v50;
    v52 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v51, (uint64_t)v63, (uint64_t)v62, 2);

    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v53, @"IMCoreAutomationHookErrorDomain", 5, v52);
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
          v65 = v59;
          _os_log_impl(&dword_1A4AF7000, v55, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
        }
      }
      if (a4 && !*a4) {
        *a4 = v54;
      }
    }
  }
  else
  {
    v66[0] = *MEMORY[0x1E4F28568];
    v21 = NSString;
    v22 = objc_msgSend_stringWithFormat_(NSString, v14, @"Condition failed : '%s'", v15, "(handles) == nil");
    v25 = objc_msgSend_stringFromAutomationErrorCode_(IMCoreAutomationHook, v23, 5, v24);
    v28 = objc_msgSend_stringWithFormat_(v21, v26, @"%@ (%@)", v27, v22, v25);
    v67[0] = v28;
    v66[1] = @"IMCoreAutomationHookParameterErrorLocation";
    v31 = objc_msgSend_stringWithFormat_(NSString, v29, @"%s:%d", v30, "/Library/Caches/com.apple.xbs/Sources/MessagesCore/IMCore/IMCore/Source/Automation Hooks/IMAutomationGroupChat.m", 29);
    v67[1] = v31;
    v19 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v32, (uint64_t)v67, (uint64_t)v66, 2);

    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v33, @"IMCoreAutomationHookErrorDomain", 5, v19);
    id v34 = (id)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      if (IMOSLoggingEnabled())
      {
        v35 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          v39 = objc_msgSend_description(v34, v36, v37, v38);
          *(_DWORD *)buf = 138412290;
          v65 = v39;
          _os_log_impl(&dword_1A4AF7000, v35, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
        }
      }
      if (a4 && !*a4) {
        *a4 = v34;
      }
    }
  }
  id v20 = 0;
LABEL_23:

  return v20;
}

- (id)_runChangeParticipantsQueryWithGroupID:(id)a3 participants:(id)a4 timeOut:(double)a5 error:(id *)a6 optArguments:(id)a7 addParticipants:(BOOL)a8
{
  BOOL v8 = a8;
  v153[2] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v141 = a7;
  if (v13)
  {
    v140 = a6;
    if (objc_msgSend_count(v14, v15, v16, v17))
    {
      v21 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v18, v19, v20);
      v25 = objc_msgSend_handlesFromStrings_error_results_(self, v22, (uint64_t)v14, (uint64_t)a6, v21);
      if (v25)
      {
        objc_msgSend_existingChatForGroupID_error_results_(self, v23, (uint64_t)v13, 0, v21);
        id v27 = (id)objc_claimAutoreleasedReturnValue();
        if (v27
          || (objc_msgSend_chatForHandles_error_results_(self, v26, (uint64_t)v25, (uint64_t)a6, v21),
              (id v27 = (id)objc_claimAutoreleasedReturnValue()) != 0))
        {
          id v30 = objc_alloc(MEMORY[0x1E4F28B18]);
          id v34 = objc_msgSend_mainBundle(MEMORY[0x1E4F28B50], v31, v32, v33);
          v36 = objc_msgSend_localizedStringForKey_value_table_(v34, v35, @"join us", (uint64_t)&stru_1EF8E78C8, 0);
          v39 = objc_msgSend_initWithString_(v30, v37, (uint64_t)v36, v38);
          objc_msgSend_instantMessageWithText_messageSubject_fileTransferGUIDs_flags_threadIdentifier_(IMMessage, v40, (uint64_t)v39, 0, 0, 5, 0);
          id v41 = (id)objc_claimAutoreleasedReturnValue();

          if (v41)
          {
            if (v8) {
              objc_msgSend_inviteParticipants_reason_(v27, v42, (uint64_t)v25, (uint64_t)v41);
            }
            else {
              objc_msgSend_removeParticipants_reason_(v27, v42, (uint64_t)v25, (uint64_t)v41);
            }
            id v64 = v21;
            goto LABEL_55;
          }
          v142[0] = *MEMORY[0x1E4F28568];
          v101 = NSString;
          v102 = objc_msgSend_stringWithFormat_(NSString, v42, @"Condition failed : '%s'", v43, "(message) == nil");
          v105 = objc_msgSend_stringFromAutomationErrorCode_(IMCoreAutomationHook, v103, 5, v104);
          v108 = objc_msgSend_stringWithFormat_(v101, v106, @"%@ (%@)", v107, v102, v105);
          v143[0] = v108;
          v142[1] = @"IMCoreAutomationHookParameterErrorLocation";
          v111 = objc_msgSend_stringWithFormat_(NSString, v109, @"%s:%d", v110, "/Library/Caches/com.apple.xbs/Sources/MessagesCore/IMCore/IMCore/Source/Automation Hooks/IMAutomationGroupChat.m", 65);
          v143[1] = v111;
          v139 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v112, (uint64_t)v143, (uint64_t)v142, 2);

          objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v113, @"IMCoreAutomationHookErrorDomain", 5, v139);
          id v114 = (id)objc_claimAutoreleasedReturnValue();
          if (v114)
          {
            if (IMOSLoggingEnabled())
            {
              v115 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v115, OS_LOG_TYPE_INFO))
              {
                v119 = objc_msgSend_description(v114, v116, v117, v118);
                *(_DWORD *)buf = 138412290;
                v151 = v119;
                _os_log_impl(&dword_1A4AF7000, v115, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
              }
            }
            if (v140 && !*v140) {
              id *v140 = v114;
            }
          }
        }
        else
        {
          v144[0] = *MEMORY[0x1E4F28568];
          v120 = NSString;
          v121 = objc_msgSend_stringWithFormat_(NSString, v28, @"Condition failed : '%s'", v29, "(chat) == nil");
          v124 = objc_msgSend_stringFromAutomationErrorCode_(IMCoreAutomationHook, v122, 5, v123);
          v127 = objc_msgSend_stringWithFormat_(v120, v125, @"%@ (%@)", v126, v121, v124);
          v145[0] = v127;
          v144[1] = @"IMCoreAutomationHookParameterErrorLocation";
          v130 = objc_msgSend_stringWithFormat_(NSString, v128, @"%s:%d", v129, "/Library/Caches/com.apple.xbs/Sources/MessagesCore/IMCore/IMCore/Source/Automation Hooks/IMAutomationGroupChat.m", 57);
          v145[1] = v130;
          objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v131, (uint64_t)v145, (uint64_t)v144, 2);
          id v27 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v132, @"IMCoreAutomationHookErrorDomain", 5, v27);
          id v41 = (id)objc_claimAutoreleasedReturnValue();
          if (v41)
          {
            if (IMOSLoggingEnabled())
            {
              v133 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v133, OS_LOG_TYPE_INFO))
              {
                v137 = objc_msgSend_description(v41, v134, v135, v136);
                *(_DWORD *)buf = 138412290;
                v151 = v137;
                _os_log_impl(&dword_1A4AF7000, v133, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
              }
            }
            if (v140 && !*v140) {
              id *v140 = v41;
            }
          }
        }
      }
      else
      {
        v146[0] = *MEMORY[0x1E4F28568];
        v83 = NSString;
        v84 = objc_msgSend_stringWithFormat_(NSString, v23, @"Condition failed : '%s'", v24, "(handles) == nil");
        v87 = objc_msgSend_stringFromAutomationErrorCode_(IMCoreAutomationHook, v85, 5, v86);
        v90 = objc_msgSend_stringWithFormat_(v83, v88, @"%@ (%@)", v89, v84, v87);
        v147[0] = v90;
        v146[1] = @"IMCoreAutomationHookParameterErrorLocation";
        v93 = objc_msgSend_stringWithFormat_(NSString, v91, @"%s:%d", v92, "/Library/Caches/com.apple.xbs/Sources/MessagesCore/IMCore/IMCore/Source/Automation Hooks/IMAutomationGroupChat.m", 50);
        v147[1] = v93;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v94, (uint64_t)v147, (uint64_t)v146, 2);
        id v27 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v95, @"IMCoreAutomationHookErrorDomain", 5, v27);
        id v41 = (id)objc_claimAutoreleasedReturnValue();
        if (v41)
        {
          if (IMOSLoggingEnabled())
          {
            v96 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
            {
              v100 = objc_msgSend_description(v41, v97, v98, v99);
              *(_DWORD *)buf = 138412290;
              v151 = v100;
              _os_log_impl(&dword_1A4AF7000, v96, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
            }
          }
          if (v140 && !*v140) {
            id *v140 = v41;
          }
        }
      }
      id v64 = 0;
LABEL_55:

      goto LABEL_56;
    }
    v148[0] = *MEMORY[0x1E4F28568];
    v65 = NSString;
    v66 = objc_msgSend_stringWithFormat_(NSString, v18, @"Condition failed : '%s'", v20, "[participants count] == 0");
    v69 = objc_msgSend_stringFromAutomationErrorCode_(IMCoreAutomationHook, v67, 5, v68);
    v72 = objc_msgSend_stringWithFormat_(v65, v70, @"%@ (%@)", v71, v66, v69);
    v149[0] = v72;
    v148[1] = @"IMCoreAutomationHookParameterErrorLocation";
    v75 = objc_msgSend_stringWithFormat_(NSString, v73, @"%s:%d", v74, "/Library/Caches/com.apple.xbs/Sources/MessagesCore/IMCore/IMCore/Source/Automation Hooks/IMAutomationGroupChat.m", 45);
    v149[1] = v75;
    v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v76, (uint64_t)v149, (uint64_t)v148, 2);

    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v77, @"IMCoreAutomationHookErrorDomain", 5, v21);
    id v27 = (id)objc_claimAutoreleasedReturnValue();
    if (!v27) {
      goto LABEL_24;
    }
    if (IMOSLoggingEnabled())
    {
      v78 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
      {
        v82 = objc_msgSend_description(v27, v79, v80, v81);
        *(_DWORD *)buf = 138412290;
        v151 = v82;
        _os_log_impl(&dword_1A4AF7000, v78, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
      }
    }
    if (!v140 || *v140)
    {
LABEL_24:
      id v64 = 0;
      v25 = v27;
      goto LABEL_56;
    }
    id v63 = v27;
    id v27 = v63;
    id v64 = 0;
    id *v140 = v63;
  }
  else
  {
    v44 = a6;
    v152[0] = *MEMORY[0x1E4F28568];
    v45 = NSString;
    uint64_t v46 = objc_msgSend_stringWithFormat_(NSString, v15, @"Condition failed : '%s'", v17, "(groupID) == nil");
    uint64_t v49 = objc_msgSend_stringFromAutomationErrorCode_(IMCoreAutomationHook, v47, 5, v48);
    v52 = objc_msgSend_stringWithFormat_(v45, v50, @"%@ (%@)", v51, v46, v49);
    v153[0] = v52;
    v152[1] = @"IMCoreAutomationHookParameterErrorLocation";
    v55 = objc_msgSend_stringWithFormat_(NSString, v53, @"%s:%d", v54, "/Library/Caches/com.apple.xbs/Sources/MessagesCore/IMCore/IMCore/Source/Automation Hooks/IMAutomationGroupChat.m", 44);
    v153[1] = v55;
    v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v56, (uint64_t)v153, (uint64_t)v152, 2);

    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v57, @"IMCoreAutomationHookErrorDomain", 5, v21);
    id v27 = (id)objc_claimAutoreleasedReturnValue();
    if (!v27) {
      goto LABEL_24;
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v58 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
      {
        v62 = objc_msgSend_description(v27, v59, v60, v61);
        *(_DWORD *)buf = 138412290;
        v151 = v62;
        _os_log_impl(&dword_1A4AF7000, v58, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
      }
    }
    if (!v44 || *v44) {
      goto LABEL_24;
    }
    id v63 = v27;
    id v27 = v63;
    id v64 = 0;
    id *v44 = v63;
  }
  v25 = v63;
LABEL_56:

  return v64;
}

- (id)addParticipantsWithGroupID:(id)a3 participants:(id)a4 timeOut:(double)a5 error:(id *)a6 optArguments:(id)a7
{
  return (id)MEMORY[0x1F4181798](self, sel__runChangeParticipantsQueryWithGroupID_participants_timeOut_error_optArguments_addParticipants_, a3, a4);
}

- (id)removeParticipantsWithGroupID:(id)a3 participants:(id)a4 timeOut:(double)a5 error:(id *)a6 optArguments:(id)a7
{
  return (id)MEMORY[0x1F4181798](self, sel__runChangeParticipantsQueryWithGroupID_participants_timeOut_error_optArguments_addParticipants_, a3, a4);
}

- (id)changeGroupNameWithGroupID:(id)a3 newName:(id)a4 timeOut:(double)a5 error:(id *)a6 optArguments:(id)a7
{
  v89[2] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v81 = a7;
  if (v11)
  {
    if (v12)
    {
      objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v13, v14, v15);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v18 = objc_msgSend_existingChatForGroupID_error_results_(self, v17, (uint64_t)v11, (uint64_t)a6, v16);
      id v21 = v18;
      if (v18)
      {
        objc_msgSend_setDisplayName_(v18, v19, (uint64_t)v12, v20);
        objc_msgSend_setObject_forKeyedSubscript_(v16, v22, (uint64_t)v12, @"name");
        id v16 = v16;
        v23 = v16;
        goto LABEL_33;
      }
      v82[0] = *MEMORY[0x1E4F28568];
      uint64_t v60 = NSString;
      uint64_t v61 = objc_msgSend_stringWithFormat_(NSString, v19, @"Condition failed : '%s'", v20, "(chat) == nil");
      id v64 = objc_msgSend_stringFromAutomationErrorCode_(IMCoreAutomationHook, v62, 5, v63);
      v67 = objc_msgSend_stringWithFormat_(v60, v65, @"%@ (%@)", v66, v61, v64);
      v83[0] = v67;
      v82[1] = @"IMCoreAutomationHookParameterErrorLocation";
      v70 = objc_msgSend_stringWithFormat_(NSString, v68, @"%s:%d", v69, "/Library/Caches/com.apple.xbs/Sources/MessagesCore/IMCore/IMCore/Source/Automation Hooks/IMAutomationGroupChat.m", 117);
      v83[1] = v70;
      v72 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v71, (uint64_t)v83, (uint64_t)v82, 2);

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
            v87 = v79;
            _os_log_impl(&dword_1A4AF7000, v75, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
          }
        }
        if (a6 && !*a6) {
          *a6 = v74;
        }
      }
    }
    else
    {
      v84[0] = *MEMORY[0x1E4F28568];
      v42 = NSString;
      uint64_t v43 = objc_msgSend_stringWithFormat_(NSString, v13, @"Condition failed : '%s'", v15, "(newName) == nil");
      uint64_t v46 = objc_msgSend_stringFromAutomationErrorCode_(IMCoreAutomationHook, v44, 5, v45);
      uint64_t v49 = objc_msgSend_stringWithFormat_(v42, v47, @"%@ (%@)", v48, v43, v46);
      v85[0] = v49;
      v84[1] = @"IMCoreAutomationHookParameterErrorLocation";
      v52 = objc_msgSend_stringWithFormat_(NSString, v50, @"%s:%d", v51, "/Library/Caches/com.apple.xbs/Sources/MessagesCore/IMCore/IMCore/Source/Automation Hooks/IMAutomationGroupChat.m", 113);
      v85[1] = v52;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v53, (uint64_t)v85, (uint64_t)v84, 2);
      id v16 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v54, @"IMCoreAutomationHookErrorDomain", 5, v16);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        if (IMOSLoggingEnabled())
        {
          v55 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
          {
            v59 = objc_msgSend_description(v21, v56, v57, v58);
            *(_DWORD *)buf = 138412290;
            v87 = v59;
            _os_log_impl(&dword_1A4AF7000, v55, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
          }
        }
        if (a6 && !*a6) {
          *a6 = v21;
        }
      }
    }
  }
  else
  {
    v88[0] = *MEMORY[0x1E4F28568];
    uint64_t v24 = NSString;
    v25 = objc_msgSend_stringWithFormat_(NSString, v13, @"Condition failed : '%s'", v15, "(groupID) == nil");
    v28 = objc_msgSend_stringFromAutomationErrorCode_(IMCoreAutomationHook, v26, 5, v27);
    v31 = objc_msgSend_stringWithFormat_(v24, v29, @"%@ (%@)", v30, v25, v28);
    v89[0] = v31;
    v88[1] = @"IMCoreAutomationHookParameterErrorLocation";
    id v34 = objc_msgSend_stringWithFormat_(NSString, v32, @"%s:%d", v33, "/Library/Caches/com.apple.xbs/Sources/MessagesCore/IMCore/IMCore/Source/Automation Hooks/IMAutomationGroupChat.m", 112);
    v89[1] = v34;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v35, (uint64_t)v89, (uint64_t)v88, 2);
    id v16 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v36, @"IMCoreAutomationHookErrorDomain", 5, v16);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v37 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          id v41 = objc_msgSend_description(v21, v38, v39, v40);
          *(_DWORD *)buf = 138412290;
          v87 = v41;
          _os_log_impl(&dword_1A4AF7000, v37, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
        }
      }
      if (a6 && !*a6) {
        *a6 = v21;
      }
    }
  }
  v23 = 0;
LABEL_33:

  return v23;
}

- (id)groupParticipantsWithGroupID:(id)a3 timeOut:(double)a4 error:(id *)a5 optArguments:(id)a6
{
  v225[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v200 = a6;
  if (v8)
  {
    id v12 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v9, v10, v11);
    uint64_t v14 = objc_msgSend_existingChatForGroupID_error_results_(self, v13, (uint64_t)v8, (uint64_t)a5, v12);
    uint64_t v18 = v14;
    if (!v14)
    {
      v220[0] = *MEMORY[0x1E4F28568];
      v96 = NSString;
      v97 = objc_msgSend_stringWithFormat_(NSString, v15, @"Condition failed : '%s'", v17, "(chat) == nil");
      v100 = objc_msgSend_stringFromAutomationErrorCode_(IMCoreAutomationHook, v98, 5, v99);
      v103 = objc_msgSend_stringWithFormat_(v96, v101, @"%@ (%@)", v102, v97, v100);
      v221[0] = v103;
      v220[1] = @"IMCoreAutomationHookParameterErrorLocation";
      v106 = objc_msgSend_stringWithFormat_(NSString, v104, @"%s:%d", v105, "/Library/Caches/com.apple.xbs/Sources/MessagesCore/IMCore/IMCore/Source/Automation Hooks/IMAutomationGroupChat.m", 129);
      v221[1] = v106;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v107, (uint64_t)v221, (uint64_t)v220, 2);
      id v24 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v108, @"IMCoreAutomationHookErrorDomain", 5, v24);
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        if (IMOSLoggingEnabled())
        {
          v109 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v109, OS_LOG_TYPE_INFO))
          {
            v113 = objc_msgSend_description(v23, v110, v111, v112);
            *(_DWORD *)buf = 138412290;
            id v223 = v113;
            _os_log_impl(&dword_1A4AF7000, v109, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
          }
        }
        if (a5 && !*a5) {
          *a5 = v23;
        }
      }

      goto LABEL_40;
    }
    uint64_t v19 = objc_msgSend_participants(v14, v15, v16, v17);
    objc_msgSend_set(MEMORY[0x1E4F1CA80], v20, v21, v22);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    long long v208 = 0u;
    long long v209 = 0u;
    long long v206 = 0u;
    long long v207 = 0u;
    id v24 = v19;
    uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v206, (uint64_t)v219, 16);
    if (v29)
    {
      uint64_t v30 = *(void *)v207;
      while (2)
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v207 != v30) {
            objc_enumerationMutation(v24);
          }
          uint64_t v32 = *(void **)(*((void *)&v206 + 1) + 8 * i);
          uint64_t v33 = objc_msgSend_ID(v32, v26, v27, v28);
          BOOL v34 = v33 == 0;

          if (v34)
          {
            v217[0] = *MEMORY[0x1E4F28568];
            v76 = NSString;
            uint64_t v77 = objc_msgSend_stringWithFormat_(NSString, v35, @"Condition failed : '%s'", v37, "([handle ID]) == nil");
            uint64_t v80 = objc_msgSend_stringFromAutomationErrorCode_(IMCoreAutomationHook, v78, 5, v79);
            v83 = objc_msgSend_stringWithFormat_(v76, v81, @"%@ (%@)", v82, v77, v80);
            v218[0] = v83;
            v217[1] = @"IMCoreAutomationHookParameterErrorLocation";
            uint64_t v86 = objc_msgSend_stringWithFormat_(NSString, v84, @"%s:%d", v85, "/Library/Caches/com.apple.xbs/Sources/MessagesCore/IMCore/IMCore/Source/Automation Hooks/IMAutomationGroupChat.m", 135);
            v218[1] = v86;
            v88 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v87, (uint64_t)v218, (uint64_t)v217, 2);

            objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v89, @"IMCoreAutomationHookErrorDomain", 5, v88);
            id v90 = (id)objc_claimAutoreleasedReturnValue();
            if (v90)
            {
              if (IMOSLoggingEnabled())
              {
                v91 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
                {
                  v95 = objc_msgSend_description(v90, v92, v93, v94);
                  *(_DWORD *)buf = 138412290;
                  id v223 = v95;
                  _os_log_impl(&dword_1A4AF7000, v91, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
                }
              }
              if (a5 && !*a5) {
                *a5 = v90;
              }
            }

            goto LABEL_40;
          }
          uint64_t v38 = objc_msgSend_ID(v32, v35, v36, v37);
          objc_msgSend_addObject_(v23, v39, (uint64_t)v38, v40);
        }
        uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v26, (uint64_t)&v206, (uint64_t)v219, 16);
        if (v29) {
          continue;
        }
        break;
      }
    }

    v44 = objc_msgSend_lastAddressedHandleID(v18, v41, v42, v43);
    BOOL v48 = objc_msgSend_length(v44, v45, v46, v47) == 0;

    if (v48)
    {
      if (objc_msgSend_joinState(v18, v49, v50, v51) != 3) {
        goto LABEL_56;
      }
      v116 = objc_msgSend_account(v18, v55, v115, v56);
      v52 = v116;
      if (!v116)
      {
        v215[0] = *MEMORY[0x1E4F28568];
        v178 = NSString;
        v179 = objc_msgSend_stringWithFormat_(NSString, v117, @"Condition failed : '%s'", v119, "(account) == nil");
        v182 = objc_msgSend_stringFromAutomationErrorCode_(IMCoreAutomationHook, v180, 5, v181);
        v185 = objc_msgSend_stringWithFormat_(v178, v183, @"%@ (%@)", v184, v179, v182);
        v216[0] = v185;
        v215[1] = @"IMCoreAutomationHookParameterErrorLocation";
        v188 = objc_msgSend_stringWithFormat_(NSString, v186, @"%s:%d", v187, "/Library/Caches/com.apple.xbs/Sources/MessagesCore/IMCore/IMCore/Source/Automation Hooks/IMAutomationGroupChat.m", 145);
        v216[1] = v188;
        v190 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v189, (uint64_t)v216, (uint64_t)v215, 2);

        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v191, @"IMCoreAutomationHookErrorDomain", 5, v190);
        id v192 = (id)objc_claimAutoreleasedReturnValue();
        if (v192)
        {
          if (IMOSLoggingEnabled())
          {
            v193 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v193, OS_LOG_TYPE_INFO))
            {
              v197 = objc_msgSend_description(v192, v194, v195, v196);
              *(_DWORD *)buf = 138412290;
              id v223 = v197;
              _os_log_impl(&dword_1A4AF7000, v193, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
            }
          }
          if (a5 && !*a5) {
            *a5 = v192;
          }
        }

        goto LABEL_40;
      }
      objc_msgSend_arrayOfAllIMHandles(v116, v117, v118, v119);
      long long v204 = 0u;
      long long v205 = 0u;
      long long v202 = 0u;
      long long v203 = 0u;
      obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v124 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v120, (uint64_t)&v202, (uint64_t)v214, 16);
      if (v124)
      {
        uint64_t v125 = *(void *)v203;
        while (2)
        {
          for (uint64_t j = 0; j != v124; ++j)
          {
            if (*(void *)v203 != v125) {
              objc_enumerationMutation(obj);
            }
            uint64_t v129 = objc_msgSend_displayID(*(void **)(*((void *)&v202 + 1) + 8 * j), v121, v122, v123);
            if (!v129)
            {
              v212[0] = *MEMORY[0x1E4F28568];
              v159 = NSString;
              v198 = objc_msgSend_stringWithFormat_(NSString, v127, @"Condition failed : '%s'", v128, "(handleString) == nil");
              v162 = objc_msgSend_stringFromAutomationErrorCode_(IMCoreAutomationHook, v160, 5, v161);
              v165 = objc_msgSend_stringWithFormat_(v159, v163, @"%@ (%@)", v164, v198, v162);
              v213[0] = v165;
              v212[1] = @"IMCoreAutomationHookParameterErrorLocation";
              v168 = objc_msgSend_stringWithFormat_(NSString, v166, @"%s:%d", v167, "/Library/Caches/com.apple.xbs/Sources/MessagesCore/IMCore/IMCore/Source/Automation Hooks/IMAutomationGroupChat.m", 150);
              v213[1] = v168;
              v170 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v169, (uint64_t)v213, (uint64_t)v212, 2);

              objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v171, @"IMCoreAutomationHookErrorDomain", 5, v170);
              id v172 = (id)objc_claimAutoreleasedReturnValue();
              if (v172)
              {
                if (IMOSLoggingEnabled())
                {
                  v173 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v173, OS_LOG_TYPE_INFO))
                  {
                    v177 = objc_msgSend_description(v172, v174, v175, v176);
                    *(_DWORD *)buf = 138412290;
                    id v223 = v177;
                    _os_log_impl(&dword_1A4AF7000, v173, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
                  }
                }
                if (a5 && !*a5) {
                  *a5 = v172;
                }
              }

              goto LABEL_40;
            }
            objc_msgSend_addObject_(v23, v127, (uint64_t)v129, v128);
          }
          uint64_t v124 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v121, (uint64_t)&v202, (uint64_t)v214, 16);
          if (v124) {
            continue;
          }
          break;
        }
      }
    }
    else
    {
      v52 = objc_msgSend_lastAddressedHandleID(v18, v49, v50, v51);
      objc_msgSend_addObject_(v23, v53, (uint64_t)v52, v54);
    }

LABEL_56:
    if (v23)
    {
      if (IMOSLoggingEnabled())
      {
        v130 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v130, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v223 = v8;
          _os_log_impl(&dword_1A4AF7000, v130, OS_LOG_TYPE_INFO, "groupParticipantsWithGroupID incoming ID %@ ", buf, 0xCu);
        }
      }
      if (IMOSLoggingEnabled())
      {
        v131 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v131, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v223 = v23;
          _os_log_impl(&dword_1A4AF7000, v131, OS_LOG_TYPE_INFO, "groupParticipantsWithGroupID resulting participants %@ ", buf, 0xCu);
        }
      }
      if (IMOSLoggingEnabled())
      {
        v133 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v133, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v223 = v18;
          _os_log_impl(&dword_1A4AF7000, v133, OS_LOG_TYPE_INFO, "groupParticipantsWithGroupID resulting chat %@ ", buf, 0xCu);
        }
      }
      objc_msgSend_setObject_forKey_(v12, v132, (uint64_t)v8, @"group_id");
      v137 = objc_msgSend_allObjects(v23, v134, v135, v136);
      objc_msgSend_setObject_forKey_(v12, v138, (uint64_t)v137, @"members");

      id v75 = v12;
      goto LABEL_41;
    }
    v210[0] = *MEMORY[0x1E4F28568];
    v139 = NSString;
    v140 = objc_msgSend_stringWithFormat_(NSString, v55, @"Condition failed : '%s'", v56, "(outList) == nil");
    v143 = objc_msgSend_stringFromAutomationErrorCode_(IMCoreAutomationHook, v141, 5, v142);
    v146 = objc_msgSend_stringWithFormat_(v139, v144, @"%@ (%@)", v145, v140, v143);
    v211[0] = v146;
    v210[1] = @"IMCoreAutomationHookParameterErrorLocation";
    v149 = objc_msgSend_stringWithFormat_(NSString, v147, @"%s:%d", v148, "/Library/Caches/com.apple.xbs/Sources/MessagesCore/IMCore/IMCore/Source/Automation Hooks/IMAutomationGroupChat.m", 156);
    v211[1] = v149;
    v151 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v150, (uint64_t)v211, (uint64_t)v210, 2);

    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v152, @"IMCoreAutomationHookErrorDomain", 5, v151);
    id v153 = (id)objc_claimAutoreleasedReturnValue();
    if (v153)
    {
      if (IMOSLoggingEnabled())
      {
        v154 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v154, OS_LOG_TYPE_INFO))
        {
          v158 = objc_msgSend_description(v153, v155, v156, v157);
          *(_DWORD *)buf = 138412290;
          id v223 = v158;
          _os_log_impl(&dword_1A4AF7000, v154, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
        }
      }
      if (a5 && !*a5) {
        *a5 = v153;
      }
    }

LABEL_40:
    id v75 = 0;
LABEL_41:

    goto LABEL_42;
  }
  v224[0] = *MEMORY[0x1E4F28568];
  uint64_t v57 = NSString;
  uint64_t v58 = objc_msgSend_stringWithFormat_(NSString, v9, @"Condition failed : '%s'", v11, "(groupID) == nil");
  uint64_t v61 = objc_msgSend_stringFromAutomationErrorCode_(IMCoreAutomationHook, v59, 5, v60);
  id v64 = objc_msgSend_stringWithFormat_(v57, v62, @"%@ (%@)", v63, v58, v61);
  v225[0] = v64;
  v224[1] = @"IMCoreAutomationHookParameterErrorLocation";
  v67 = objc_msgSend_stringWithFormat_(NSString, v65, @"%s:%d", v66, "/Library/Caches/com.apple.xbs/Sources/MessagesCore/IMCore/IMCore/Source/Automation Hooks/IMAutomationGroupChat.m", 126);
  v225[1] = v67;
  id v12 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v68, (uint64_t)v225, (uint64_t)v224, 2);

  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v69, @"IMCoreAutomationHookErrorDomain", 5, v12);
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  if (!v24) {
    goto LABEL_21;
  }
  if (IMOSLoggingEnabled())
  {
    v70 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
    {
      id v74 = objc_msgSend_description(v24, v71, v72, v73);
      *(_DWORD *)buf = 138412290;
      id v223 = v74;
      _os_log_impl(&dword_1A4AF7000, v70, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }
  }
  if (a5 && !*a5)
  {
    id v24 = v24;
    id v75 = 0;
    *a5 = v24;
    uint64_t v18 = v24;
  }
  else
  {
LABEL_21:
    id v75 = 0;
    uint64_t v18 = v24;
  }
LABEL_42:

  return v75;
}

- (id)groupNameWithGroupID:(id)a3 timeOut:(double)a4 error:(id *)a5 optArguments:(id)a6
{
  v69[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v13 = a6;
  if (v9)
  {
    objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v10, v11, v12);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = objc_msgSend_existingChatForGroupID_error_results_(self, v15, (uint64_t)v9, (uint64_t)a5, v14);
    id v20 = v16;
    if (v16)
    {
      uint64_t v21 = objc_msgSend_displayName(v16, v17, v18, v19);
      if (v21)
      {
        id v23 = (__CFString *)v21;
        objc_msgSend_setObject_forKey_(v14, v22, v21, @"name");
      }
      else
      {
        id v23 = &stru_1EF8E78C8;
        objc_msgSend_setObject_forKey_(v14, v22, (uint64_t)&stru_1EF8E78C8, @"name");
      }
      id v14 = v14;

      id v24 = v14;
      goto LABEL_26;
    }
    v64[0] = *MEMORY[0x1E4F28568];
    uint64_t v43 = NSString;
    v44 = objc_msgSend_stringWithFormat_(NSString, v17, @"Condition failed : '%s'", v19, "(chat) == nil");
    uint64_t v47 = objc_msgSend_stringFromAutomationErrorCode_(IMCoreAutomationHook, v45, 5, v46);
    uint64_t v50 = objc_msgSend_stringWithFormat_(v43, v48, @"%@ (%@)", v49, v44, v47);
    v65[0] = v50;
    v64[1] = @"IMCoreAutomationHookParameterErrorLocation";
    v53 = objc_msgSend_stringWithFormat_(NSString, v51, @"%s:%d", v52, "/Library/Caches/com.apple.xbs/Sources/MessagesCore/IMCore/IMCore/Source/Automation Hooks/IMAutomationGroupChat.m", 171);
    v65[1] = v53;
    v55 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v54, (uint64_t)v65, (uint64_t)v64, 2);

    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v56, @"IMCoreAutomationHookErrorDomain", 5, v55);
    id v57 = (id)objc_claimAutoreleasedReturnValue();
    if (v57)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v58 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
        {
          v62 = objc_msgSend_description(v57, v59, v60, v61);
          *(_DWORD *)buf = 138412290;
          v67 = v62;
          _os_log_impl(&dword_1A4AF7000, v58, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
        }
      }
      if (a5 && !*a5) {
        *a5 = v57;
      }
    }
  }
  else
  {
    v68[0] = *MEMORY[0x1E4F28568];
    v25 = NSString;
    v26 = objc_msgSend_stringWithFormat_(NSString, v10, @"Condition failed : '%s'", v12, "(groupID) == nil");
    uint64_t v29 = objc_msgSend_stringFromAutomationErrorCode_(IMCoreAutomationHook, v27, 5, v28);
    uint64_t v32 = objc_msgSend_stringWithFormat_(v25, v30, @"%@ (%@)", v31, v26, v29);
    v69[0] = v32;
    v68[1] = @"IMCoreAutomationHookParameterErrorLocation";
    v35 = objc_msgSend_stringWithFormat_(NSString, v33, @"%s:%d", v34, "/Library/Caches/com.apple.xbs/Sources/MessagesCore/IMCore/IMCore/Source/Automation Hooks/IMAutomationGroupChat.m", 168);
    v69[1] = v35;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v36, (uint64_t)v69, (uint64_t)v68, 2);
    id v14 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v37, @"IMCoreAutomationHookErrorDomain", 5, v14);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v38 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          uint64_t v42 = objc_msgSend_description(v20, v39, v40, v41);
          *(_DWORD *)buf = 138412290;
          v67 = v42;
          _os_log_impl(&dword_1A4AF7000, v38, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
        }
      }
      if (a5 && !*a5) {
        *a5 = v20;
      }
    }
  }
  id v24 = 0;
LABEL_26:

  return v24;
}

@end