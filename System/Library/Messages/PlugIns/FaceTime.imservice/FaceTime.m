void sub_2378DBED0(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

id sub_2378DC810()
{
  qword_26AC13530 = (uint64_t)objc_alloc_init(MEMORY[0x263EFF980]);
  id result = objc_alloc_init(MEMORY[0x263EFF9A0]);
  qword_26AC13538 = (uint64_t)result;
  return result;
}

void sub_2378E0ED0(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_2378E0EE0(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v229 = *MEMORY[0x263EF8340];
  unsigned int v187 = objc_msgSend((id)objc_msgSend(a2, "topic"), "isEqualToString:", @"com.apple.private.ac");
  v7 = OSLogHandleForIDSCategory();
  uint64_t v8 = a4;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    if (v187) {
      v11 = @"audio";
    }
    else {
      v11 = @"video";
    }
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    double v13 = v12;
    [a2 timeSent];
    *(_DWORD *)buf = 138413570;
    uint64_t v220 = (uint64_t)v10;
    __int16 v221 = 2112;
    uint64_t v222 = (uint64_t)a3;
    __int16 v223 = 1024;
    *(_DWORD *)v224 = v8;
    *(_WORD *)&v224[4] = 2112;
    *(void *)&v224[6] = a5;
    __int16 v225 = 2112;
    v226 = v11;
    __int16 v227 = 2048;
    double v228 = v13 - v14;
    _os_log_impl(&dword_2378DA000, v7, OS_LOG_TYPE_DEFAULT, "Message class: %@  delivered with error: %@  code: %d result: %@  call type: %@   message delivery time: %fs", buf, 0x3Au);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (MarcoShouldLog())
    {
      v15 = (objc_class *)objc_opt_class();
      v16 = NSStringFromClass(v15);
      if (v187) {
        v17 = @"audio";
      }
      else {
        v17 = @"video";
      }
      [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
      double v19 = v18;
      [a2 timeSent];
      double v181 = v19 - v20;
      uint64_t v179 = a5;
      v180 = v17;
      v173 = a3;
      uint64_t v176 = v8;
      v168 = v16;
      MarcoLog();
    }
    if (IMShouldLog())
    {
      v21 = (objc_class *)objc_opt_class();
      v22 = NSStringFromClass(v21);
      if (v187) {
        v23 = @"audio";
      }
      else {
        v23 = @"video";
      }
      objc_msgSend(MEMORY[0x263EFF910], "timeIntervalSinceReferenceDate", v168, v173, v176, v179, v180, *(void *)&v181);
      double v25 = v24;
      [a2 timeSent];
      double v181 = v25 - v26;
      uint64_t v179 = a5;
      v180 = v23;
      v173 = a3;
      uint64_t v176 = v8;
      v168 = v22;
      IMLogString();
    }
  }
  v186 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v168, v173, v176, v179, v180, *(void *)&v181);
  if (v8 == 5058)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (IMOSLoggingEnabled())
      {
        v27 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v220 = (uint64_t)a2;
          _os_log_impl(&dword_2378DA000, v27, OS_LOG_TYPE_INFO, "  Peer claimed it was too old to receive a signal, that's ok!  (Message: %@)", buf, 0xCu);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        v169 = a2;
        _IMLoggingLog();
        if (_IMWillLog())
        {
          v169 = a2;
          _IMAlwaysLog();
        }
      }
      uint64_t v8 = 0;
      a3 = 0;
    }
    else
    {
      uint64_t v8 = 5058;
    }
  }
  if (v8 == 5020) {
    uint64_t v28 = 0;
  }
  else {
    uint64_t v28 = v8;
  }
  uint64_t v188 = v28;
  uint64_t v190 = v8;
  if (v8 == 5020) {
    v29 = 0;
  }
  else {
    v29 = a3;
  }
  v184 = v29;
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F4A868], "sharedInstance", v169), "isScreenLocked");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    sub_2378F3FF8(v188);
    objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF910], "date"), "timeIntervalSinceDate:", objc_msgSend((id)objc_msgSend(a2, "userInfo"), "objectForKey:", @"sendDate"));
    uint64_t v30 = objc_msgSend(NSNumber, "numberWithDouble:");
    FTAWDLogCallInvitationSent();
LABEL_45:
    v33 = (void *)MEMORY[0x263EFF9A0];
    uint64_t v34 = [a2 uniqueIDString];
    v186 = (void *)[v33 dictionaryWithObjectsAndKeys:v30, @"SendDuration", v34, @"MessageIdentifier", objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(a2, "command")), @"CommandID", 0];
    goto LABEL_46;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    sub_2378F3FF8(v188);
    objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF910], "date"), "timeIntervalSinceDate:", objc_msgSend((id)objc_msgSend(a2, "userInfo"), "objectForKey:", @"sendDate"));
    uint64_t v30 = objc_msgSend(NSNumber, "numberWithDouble:");
    FTAWDLogCallAcceptSent();
    goto LABEL_45;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    sub_2378F3FF8(v188);
    objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF910], "date"), "timeIntervalSinceDate:", objc_msgSend((id)objc_msgSend(a2, "userInfo"), "objectForKey:", @"sendDate"));
    uint64_t v30 = objc_msgSend(NSNumber, "numberWithDouble:");
    FTAWDLogCallCancelSent();
    goto LABEL_45;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF910], "date"), "timeIntervalSinceDate:", objc_msgSend((id)objc_msgSend(a2, "userInfo"), "objectForKey:", @"sendDate"));
    double v32 = v31;
    sub_2378F3FF8(v188);
    sub_2378F3FEC(objc_msgSend((id)objc_msgSend(a2, "reason"), "unsignedIntValue"));
    uint64_t v30 = [NSNumber numberWithDouble:v32];
    FTAWDLogCallDeclineSent();
    goto LABEL_45;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 336), "containsObject:", objc_msgSend((id)objc_msgSend(a2, "sessionToken"), "__imHexString"));
    sub_2378F3FF8(v188);
    objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF910], "date"), "timeIntervalSinceDate:", objc_msgSend((id)objc_msgSend(a2, "userInfo"), "objectForKey:", @"sendDate"));
    uint64_t v30 = objc_msgSend(NSNumber, "numberWithDouble:");
    FTAWDLogCallRelayInitiateSent();
    goto LABEL_45;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 336), "containsObject:", objc_msgSend((id)objc_msgSend(a2, "sessionToken"), "__imHexString"));
    sub_2378F3FF8(v188);
    objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF910], "date"), "timeIntervalSinceDate:", objc_msgSend((id)objc_msgSend(a2, "userInfo"), "objectForKey:", @"sendDate"));
    uint64_t v30 = objc_msgSend(NSNumber, "numberWithDouble:");
    FTAWDLogCallRelayUpdateSent();
    goto LABEL_45;
  }
LABEL_46:
  v182 = objc_msgSend((id)objc_msgSend(a2, "userInfo"), "objectForKey:", @"conference");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v35 = objc_msgSend((id)objc_msgSend(a2, "userInfo"), "objectForKey:", @"conference");
    uint64_t v193 = objc_msgSend((id)objc_msgSend(a2, "sessionToken"), "__imHexString");
    if (!v188)
    {
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) _setInitiatedConference:v193];
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) _setCallType:v187 forConferenceID:v193];
    }
    if (([v35 isEqualToString:v193] & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        v36 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v220 = (uint64_t)v35;
          __int16 v221 = 2112;
          uint64_t v222 = v193;
          _os_log_impl(&dword_2378DA000, v36, OS_LOG_TYPE_INFO, "  Initiate processed!   CID changed from %@ to %@", buf, 0x16u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        v174 = (void *)v193;
        _IMLoggingLog();
        if (_IMWillLog())
        {
          v174 = (void *)v193;
          _IMAlwaysLog();
        }
      }
      if (IMOSLoggingEnabled())
      {
        v37 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v220 = v193;
          _os_log_impl(&dword_2378DA000, v37, OS_LOG_TYPE_INFO, "Conference ID: %@", buf, 0xCu);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        _IMLoggingLog();
        if (_IMWillLog()) {
          _IMAlwaysLog();
        }
      }
      if (MarcoShouldLogCheckpoints()) {
        MarcoNoteCheckpoint();
      }
      if (!v188) {
        objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "_setConferenceIDMap:forToken:", v35, objc_msgSend(a2, "sessionToken"));
      }
      [v186 setObject:objc_msgSend(NSString, "stringWithFormat:", @"%@", v193, v174), @"ConferenceID" forKey];
      long long v203 = 0u;
      long long v204 = 0u;
      long long v201 = 0u;
      long long v202 = 0u;
      v38 = (void *)[(id)qword_26AC13540 queuedMessages];
      uint64_t v39 = [v38 countByEnumeratingWithState:&v201 objects:v210 count:16];
      if (v39)
      {
        uint64_t v40 = *(void *)v202;
        do
        {
          for (uint64_t i = 0; i != v39; ++i)
          {
            if (*(void *)v202 != v40) {
              objc_enumerationMutation(v38);
            }
            v42 = *(void **)(*((void *)&v201 + 1) + 8 * i);
            v43 = objc_msgSend((id)objc_msgSend(v42, "userInfo"), "objectForKey:", @"conference");
            if (IMOSLoggingEnabled())
            {
              v44 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
              {
                uint64_t v45 = objc_msgSend((id)objc_msgSend(v42, "sessionToken"), "__imHexString");
                *(_DWORD *)buf = 138412802;
                uint64_t v220 = (uint64_t)v42;
                __int16 v221 = 2112;
                uint64_t v222 = (uint64_t)v43;
                __int16 v223 = 2112;
                *(void *)v224 = v45;
                _os_log_impl(&dword_2378DA000, v44, OS_LOG_TYPE_INFO, "  Found queued message: %@   (%@: %@)", buf, 0x20u);
              }
            }
            if (os_log_shim_legacy_logging_enabled())
            {
              v174 = v43;
              uint64_t v177 = objc_msgSend((id)objc_msgSend(v42, "sessionToken"), "__imHexString");
              v170 = v42;
              _IMLoggingLog();
              if (_IMWillLog())
              {
                uint64_t v46 = objc_msgSend((id)objc_msgSend(v42, "sessionToken", v42, v43, v177), "__imHexString");
                v174 = v43;
                uint64_t v177 = v46;
                v170 = v42;
                _IMAlwaysLog();
              }
            }
            if (objc_msgSend(v43, "isEqualToString:", v35, v170, v174, v177))
            {
              if (IMOSLoggingEnabled())
              {
                v47 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  uint64_t v220 = (uint64_t)v35;
                  __int16 v221 = 2112;
                  uint64_t v222 = v193;
                  _os_log_impl(&dword_2378DA000, v47, OS_LOG_TYPE_INFO, "  Fixing conference ID: %@ => %@", buf, 0x16u);
                }
              }
              if (os_log_shim_legacy_logging_enabled())
              {
                v170 = v35;
                v174 = (void *)v193;
                _IMLoggingLog();
                if (_IMWillLog())
                {
                  v170 = v35;
                  v174 = (void *)v193;
                  _IMAlwaysLog();
                }
              }
              objc_msgSend(v42, "setSessionToken:", objc_msgSend(a2, "sessionToken", v170));
            }
          }
          uint64_t v39 = [v38 countByEnumeratingWithState:&v201 objects:v210 count:16];
        }
        while (v39);
      }
      v48 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      if (v187) {
        v49 = (void *)[v48 broadcasterForACConferenceListeners];
      }
      else {
        v49 = (void *)[v48 broadcasterForVCConferenceListeners];
      }
      objc_msgSend(v49, "account:conference:changedToNewConferenceID:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "accountID"), v35, v193);
      v182 = (void *)v193;
    }
    if (v188)
    {
      PLLogRegisteredEvent();
      goto LABEL_303;
    }
    v51 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v187) {
      v52 = (void *)[v51 broadcasterForACConferenceListeners];
    }
    else {
      v52 = (void *)[v51 broadcasterForVCConferenceListeners];
    }
    objc_msgSend(v52, "account:conference:invitationSentSuccessfully:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "accountID"), v193, 1);
    PLLogRegisteredEvent();
  }
  else
  {
    PLLogRegisteredEvent();
    uint64_t v50 = v188;
    if (v188) {
      goto LABEL_301;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v79 = objc_msgSend((id)objc_msgSend(a2, "sessionToken"), "__imHexString");
      v80 = (__CFDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      v81 = (const void *)[a2 relayType];
      if (v81) {
        CFDictionarySetValue(v80, (const void *)*MEMORY[0x263F4A800], v81);
      }
      v82 = (const void *)objc_msgSend(a2, "relayConnectionId", v81);
      if (v82) {
        CFDictionarySetValue(v80, (const void *)*MEMORY[0x263F4A770], v82);
      }
      v83 = (const void *)objc_msgSend(a2, "relayTransactionIdAlloc", v82);
      if (v83) {
        CFDictionarySetValue(v80, (const void *)*MEMORY[0x263F4A7F8], v83);
      }
      v84 = (const void *)objc_msgSend(a2, "relayTokenAllocReq", v83);
      if (v84) {
        CFDictionarySetValue(v80, (const void *)*MEMORY[0x263F4A7F0], v84);
      }
      v85 = (const void *)objc_msgSend(a2, "peerRelayIP", v84);
      if (v85) {
        CFDictionarySetValue(v80, (const void *)*MEMORY[0x263F4A790], v85);
      }
      v86 = (const void *)objc_msgSend(a2, "peerRelayPort", v85);
      if (v86) {
        CFDictionarySetValue(v80, (const void *)*MEMORY[0x263F4A7A8], v86);
      }
      v87 = (const void *)objc_msgSend(a2, "selfRelayIP", v86);
      if (v87) {
        CFDictionarySetValue(v80, (const void *)*MEMORY[0x263F4A7D0], v87);
      }
      v88 = (const void *)objc_msgSend(a2, "selfRelayPort", v87);
      if (v88) {
        CFDictionarySetValue(v80, (const void *)*MEMORY[0x263F4A7E8], v88);
      }
      if (IMOSLoggingEnabled())
      {
        v89 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v220 = v79;
          __int16 v221 = 2112;
          uint64_t v222 = (uint64_t)v80;
          _os_log_impl(&dword_2378DA000, v89, OS_LOG_TYPE_INFO, "  Response to relay request %@    parameters: %@", buf, 0x16u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        v170 = (void *)v79;
        v174 = v80;
        _IMLoggingLog();
        if (_IMWillLog())
        {
          v170 = (void *)v79;
          v174 = v80;
          _IMAlwaysLog();
        }
      }
      v90 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v220 = v79;
        __int16 v221 = 2112;
        uint64_t v222 = (uint64_t)v80;
        _os_log_impl(&dword_2378DA000, v90, OS_LOG_TYPE_DEFAULT, "  Response to relay request %@    parameters: %@", buf, 0x16u);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (MarcoShouldLog())
        {
          v170 = (void *)v79;
          v174 = v80;
          MarcoLog();
        }
        if (IMShouldLog())
        {
          v170 = (void *)v79;
          v174 = v80;
          IMLogString();
        }
      }
      v91 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      if (v187)
      {
LABEL_297:
        v114 = (void *)[v91 broadcasterForACConferenceListeners];
LABEL_452:
        objc_msgSend(v114, "account:relay:handleInitate:fromPerson:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "accountID", v170, v174), v79, v80, sub_2378E5AEC((const void *)objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "_displayIDForPeerID:conferenceID:", objc_msgSend(a2, "peerID"), v79)));

        goto LABEL_453;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || ![a2 relayType]) {
        goto LABEL_453;
      }
      uint64_t v79 = objc_msgSend((id)objc_msgSend(a2, "sessionToken"), "__imHexString");
      v80 = (__CFDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      v104 = (const void *)[a2 relayType];
      if (v104) {
        CFDictionarySetValue(v80, (const void *)*MEMORY[0x263F4A800], v104);
      }
      v105 = (const void *)objc_msgSend(a2, "relayConnectionId", v104);
      if (v105) {
        CFDictionarySetValue(v80, (const void *)*MEMORY[0x263F4A770], v105);
      }
      v106 = (const void *)objc_msgSend(a2, "relayTransactionIdAlloc", v105);
      if (v106) {
        CFDictionarySetValue(v80, (const void *)*MEMORY[0x263F4A7F8], v106);
      }
      v107 = (const void *)objc_msgSend(a2, "relayTokenAllocReq", v106);
      if (v107) {
        CFDictionarySetValue(v80, (const void *)*MEMORY[0x263F4A7F0], v107);
      }
      v108 = (const void *)objc_msgSend(a2, "peerRelayIP", v107);
      if (v108) {
        CFDictionarySetValue(v80, (const void *)*MEMORY[0x263F4A790], v108);
      }
      v109 = (const void *)objc_msgSend(a2, "peerRelayPort", v108);
      if (v109) {
        CFDictionarySetValue(v80, (const void *)*MEMORY[0x263F4A7A8], v109);
      }
      v110 = (const void *)objc_msgSend(a2, "selfRelayIP", v109);
      if (v110) {
        CFDictionarySetValue(v80, (const void *)*MEMORY[0x263F4A7D0], v110);
      }
      v111 = (const void *)objc_msgSend(a2, "selfRelayPort", v110);
      if (v111) {
        CFDictionarySetValue(v80, (const void *)*MEMORY[0x263F4A7E8], v111);
      }
      if (IMOSLoggingEnabled())
      {
        v112 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v112, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v220 = v79;
          __int16 v221 = 2112;
          uint64_t v222 = (uint64_t)v80;
          _os_log_impl(&dword_2378DA000, v112, OS_LOG_TYPE_INFO, "  Inline request to relay %@    parameters: %@", buf, 0x16u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        v170 = (void *)v79;
        v174 = v80;
        _IMLoggingLog();
        if (_IMWillLog())
        {
          v170 = (void *)v79;
          v174 = v80;
          _IMAlwaysLog();
        }
      }
      v113 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v220 = v79;
        __int16 v221 = 2112;
        uint64_t v222 = (uint64_t)v80;
        _os_log_impl(&dword_2378DA000, v113, OS_LOG_TYPE_DEFAULT, "  Inline request to relay %@    parameters: %@", buf, 0x16u);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (MarcoShouldLog())
        {
          v170 = (void *)v79;
          v174 = v80;
          MarcoLog();
        }
        if (IMShouldLog())
        {
          v170 = (void *)v79;
          v174 = v80;
          IMLogString();
        }
      }
      v91 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      if (v187) {
        goto LABEL_297;
      }
    }
    v114 = (void *)[v91 broadcasterForVCConferenceListeners];
    goto LABEL_452;
  }
  v192 = objc_msgSend((id)objc_msgSend(a2, "sessionToken"), "__imHexString");
  obuint64_t j = (void *)[a2 canonicalizedPeers];
  v194 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  v53 = objc_msgSend((id)objc_msgSend(a2, "userInfo"), "objectForKey:", @"ID");
  if (![obj count] || !objc_msgSend(v192, "length")) {
    goto LABEL_227;
  }
  [v194 _setPeerInfo:obj conferenceID:v192];
  if (IMOSLoggingEnabled())
  {
    v54 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v211 = 138412802;
      uint64_t v212 = (uint64_t)obj;
      __int16 v213 = 2112;
      uint64_t v214 = (uint64_t)v192;
      __int16 v215 = 2112;
      uint64_t v216 = (uint64_t)v53;
      _os_log_impl(&dword_2378DA000, v54, OS_LOG_TYPE_INFO, "  Processing peers: %@ for conferenceID: %@ and targetID: %@", v211, 0x20u);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    v174 = v192;
    uint64_t v177 = (uint64_t)v53;
    v170 = obj;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      v174 = v192;
      uint64_t v177 = (uint64_t)v53;
      v170 = obj;
      _IMAlwaysLog();
    }
  }
  v55 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v211 = 138412290;
    uint64_t v212 = (uint64_t)obj;
    _os_log_impl(&dword_2378DA000, v55, OS_LOG_TYPE_DEFAULT, "Processing peers: %@", v211, 0xCu);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (MarcoShouldLog())
    {
      v170 = obj;
      MarcoLog();
    }
    if (IMShouldLog())
    {
      v170 = obj;
      IMLogString();
    }
  }
  long long v207 = 0u;
  long long v208 = 0u;
  long long v205 = 0u;
  long long v206 = 0u;
  uint64_t v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v205, buf, 16, v170, v174, v177);
  if (!v56) {
    goto LABEL_227;
  }
  char v189 = 0;
  uint64_t v57 = *(void *)v206;
  do
  {
    for (uint64_t j = 0; j != v56; ++j)
    {
      if (*(void *)v206 != v57) {
        objc_enumerationMutation(obj);
      }
      v59 = *(void **)(*((void *)&v205 + 1) + 8 * j);
      v60 = objc_msgSend(v59, "objectForKey:", @"status", v170, v175, v178);
      uint64_t v61 = [v59 objectForKey:@"id"];
      uint64_t v62 = objc_msgSend((id)objc_msgSend(v59, "objectForKey:", @"canonical-id"), "_stripFZIDPrefix");
      if ([v60 intValue])
      {
        if (IMOSLoggingEnabled())
        {
          v63 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v211 = 138412802;
            uint64_t v212 = v61;
            __int16 v213 = 2112;
            uint64_t v214 = (uint64_t)v60;
            __int16 v215 = 2112;
            uint64_t v216 = v62;
            _os_log_impl(&dword_2378DA000, v63, OS_LOG_TYPE_INFO, "  Skipping (non-0 status)   peerID: %@    status code: %@  canonical id: %@", v211, 0x20u);
          }
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          v175 = v60;
          v178 = (void *)v62;
          v170 = (void *)v61;
          _IMLoggingLog();
          if (_IMWillLog())
          {
            v175 = v60;
            v178 = (void *)v62;
            v170 = (void *)v61;
            _IMAlwaysLog();
          }
        }
        v64 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v211 = 138412802;
          uint64_t v212 = v61;
          __int16 v213 = 2112;
          uint64_t v214 = (uint64_t)v60;
          __int16 v215 = 2112;
          uint64_t v216 = v62;
          _os_log_impl(&dword_2378DA000, v64, OS_LOG_TYPE_DEFAULT, "  Skipping (non-0 status)   peerID: %@    status code: %@  canonical id: %@", v211, 0x20u);
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          if (MarcoShouldLog())
          {
            v175 = v60;
            v178 = (void *)v62;
            v170 = (void *)v61;
            MarcoLog();
          }
          if (IMShouldLog())
          {
            v175 = v60;
            v178 = (void *)v62;
            v170 = (void *)v61;
            IMLogString();
          }
        }
      }
      else
      {
        [v194 _setAlternateDisplayID:v53 forPeerID:v61 conferenceID:v192];
        if (IMOSLoggingEnabled())
        {
          v65 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v211 = 138413058;
            uint64_t v212 = v62;
            __int16 v213 = 2112;
            uint64_t v214 = v61;
            __int16 v215 = 2112;
            uint64_t v216 = (uint64_t)v53;
            __int16 v217 = 2112;
            uint64_t v218 = v62;
            _os_log_impl(&dword_2378DA000, v65, OS_LOG_TYPE_INFO, "     Peer: %@    Canonical: %@   Old: %@   New: %@", v211, 0x2Au);
          }
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          v178 = v53;
          v170 = (void *)v62;
          v175 = (void *)v61;
          _IMLoggingLog();
          if (_IMWillLog())
          {
            v178 = v53;
            v170 = (void *)v62;
            v175 = (void *)v61;
            _IMAlwaysLog();
          }
        }
        v66 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v211 = 138413058;
          uint64_t v212 = v62;
          __int16 v213 = 2112;
          uint64_t v214 = v61;
          __int16 v215 = 2112;
          uint64_t v216 = (uint64_t)v53;
          __int16 v217 = 2112;
          uint64_t v218 = v62;
          _os_log_impl(&dword_2378DA000, v66, OS_LOG_TYPE_DEFAULT, "     Peer: %@    Canonical: %@   Old: %@   New: %@", v211, 0x2Au);
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          if (MarcoShouldLog())
          {
            v178 = v53;
            v170 = (void *)v62;
            v175 = (void *)v61;
            MarcoLog();
          }
          if (IMShouldLog())
          {
            v178 = v53;
            v170 = (void *)v62;
            v175 = (void *)v61;
            IMLogString();
          }
        }
        if (objc_msgSend(v53, "isEqualToString:", v62, v170))
        {
          if (IMOSLoggingEnabled())
          {
            v67 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v211 = 138412290;
              uint64_t v212 = (uint64_t)v53;
              _os_log_impl(&dword_2378DA000, v67, OS_LOG_TYPE_INFO, "Peer ID did not change: %@", v211, 0xCu);
            }
          }
          if (os_log_shim_legacy_logging_enabled())
          {
            v170 = v53;
            _IMLoggingLog();
            if (_IMWillLog())
            {
              v170 = v53;
              _IMAlwaysLog();
            }
          }
          if (MarcoShouldLogCheckpoints())
          {
            v170 = v53;
            MarcoNoteCheckpoint();
          }
        }
        else
        {
          if (v187) {
            v68 = (void *)[v194 broadcasterForACConferenceListeners];
          }
          else {
            v68 = (void *)[v194 broadcasterForVCConferenceListeners];
          }
          objc_msgSend(v68, "account:conference:peerIDChangedFromID:toID:", objc_msgSend(v194, "accountID"), v192, v53, v62);
          if (IMOSLoggingEnabled())
          {
            v69 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v211 = 138412546;
              uint64_t v212 = (uint64_t)v53;
              __int16 v213 = 2112;
              uint64_t v214 = v62;
              _os_log_impl(&dword_2378DA000, v69, OS_LOG_TYPE_INFO, "Peer ID was mapped from: %@ to: %@", v211, 0x16u);
            }
          }
          if (os_log_shim_legacy_logging_enabled())
          {
            v170 = v53;
            v175 = (void *)v62;
            _IMLoggingLog();
            if (_IMWillLog())
            {
              v170 = v53;
              v175 = (void *)v62;
              _IMAlwaysLog();
            }
          }
          if (MarcoShouldLogCheckpoints())
          {
            v170 = v53;
            v175 = (void *)v62;
            MarcoNoteCheckpoint();
          }
        }
        char v189 = 1;
      }
    }
    uint64_t v56 = [obj countByEnumeratingWithState:&v205 objects:buf count:16];
  }
  while (v56);
  if (v189)
  {
    v195 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    long long v205 = 0u;
    long long v206 = 0u;
    long long v207 = 0u;
    long long v208 = 0u;
    v70 = (void *)[(id)qword_26AC13540 queuedMessages];
    uint64_t v71 = [v70 countByEnumeratingWithState:&v205 objects:buf count:16];
    if (v71)
    {
      uint64_t v72 = *(void *)v206;
      do
      {
        for (uint64_t k = 0; k != v71; ++k)
        {
          if (*(void *)v206 != v72) {
            objc_enumerationMutation(v70);
          }
          v74 = *(void **)(*((void *)&v205 + 1) + 8 * k);
          uint64_t v75 = objc_msgSend((id)objc_msgSend(v74, "userInfo", v170, v175), "objectForKey:", @"ID");
          if (IMOSLoggingEnabled())
          {
            v76 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v211 = 138412546;
              uint64_t v212 = (uint64_t)v74;
              __int16 v213 = 2112;
              uint64_t v214 = v75;
              _os_log_impl(&dword_2378DA000, v76, OS_LOG_TYPE_INFO, "  Found queued message: %@  with ID: %@", v211, 0x16u);
            }
          }
          if (os_log_shim_legacy_logging_enabled())
          {
            v170 = v74;
            v175 = (void *)v75;
            _IMLoggingLog();
            if (_IMWillLog())
            {
              v170 = v74;
              v175 = (void *)v75;
              _IMAlwaysLog();
            }
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && !objc_msgSend((id)objc_msgSend(v74, "peers"), "count")
            && objc_msgSend((id)objc_msgSend((id)objc_msgSend(v74, "sessionToken"), "__imHexString"), "isEqualToString:", v192))
          {
            uint64_t v77 = [v195 _peerInfoForDisplayID:v75 conferenceID:v192 skippingPairs:0];
            if (IMOSLoggingEnabled())
            {
              v78 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)v211 = 138412546;
                uint64_t v212 = v75;
                __int16 v213 = 2112;
                uint64_t v214 = v77;
                _os_log_impl(&dword_2378DA000, v78, OS_LOG_TYPE_INFO, "  Fixing peers for ID: %@ => %@", v211, 0x16u);
              }
            }
            if (os_log_shim_legacy_logging_enabled())
            {
              v170 = (void *)v75;
              v175 = (void *)v77;
              _IMLoggingLog();
              if (_IMWillLog())
              {
                v170 = (void *)v75;
                v175 = (void *)v77;
                _IMAlwaysLog();
              }
            }
            objc_msgSend(v74, "setPeers:", v77, v170);
          }
        }
        uint64_t v71 = [v70 countByEnumeratingWithState:&v205 objects:buf count:16];
      }
      while (v71);
    }
    uint64_t v50 = 0;
  }
  else
  {
LABEL_227:
    v184 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", *MEMORY[0x263F3BAF0], 5030, 0, v170);
    _IMWarn();
    if (IMOSLoggingEnabled())
    {
      v92 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2378DA000, v92, OS_LOG_TYPE_INFO, "No peer response in initiate", buf, 2u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      _IMLoggingLog();
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
    }
    if (MarcoShouldLogCheckpoints()) {
      MarcoNoteCheckpoint();
    }
    uint64_t v50 = 5030;
  }
  int v93 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "_anyPeersForConferenceIDMayRequireBreakBeforeMake:", v192, v170);
  if (IMOSLoggingEnabled())
  {
    v94 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
    {
      v95 = @"NO";
      if (v93) {
        v95 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v220 = (uint64_t)v95;
      _os_log_impl(&dword_2378DA000, v94, OS_LOG_TYPE_INFO, "Conference may require break before make: %@", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    v96 = v93 ? @"YES" : @"NO";
    v170 = v96;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      v170 = v96;
      _IMAlwaysLog();
    }
  }
  if (IMOSLoggingEnabled())
  {
    v97 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
    {
      v98 = @"NO";
      if (v93) {
        v98 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v220 = (uint64_t)v98;
      _os_log_impl(&dword_2378DA000, v97, OS_LOG_TYPE_INFO, "Conference may require break before make: %@", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    v99 = v93 ? @"YES" : @"NO";
    v170 = v99;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      v170 = v99;
      _IMAlwaysLog();
    }
  }
  if (MarcoShouldLogCheckpoints())
  {
    v100 = @"NO";
    if (v93) {
      v100 = @"YES";
    }
    v170 = v100;
    MarcoNoteCheckpoint();
  }
  if (v93)
  {
    uint64_t v101 = [NSDictionary dictionaryWithObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F4A950]];
    v102 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v187) {
      v103 = (void *)[v102 broadcasterForACConferenceListeners];
    }
    else {
      v103 = (void *)[v102 broadcasterForVCConferenceListeners];
    }
    objc_msgSend(v103, "account:conference:peerID:propertiesUpdated:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "accountID", v170), v192, 0, v101);
  }
LABEL_301:
  if (!v50)
  {
LABEL_453:
    uint64_t v116 = 0;
    goto LABEL_454;
  }
  uint64_t v190 = v50;
LABEL_303:
  if (IMOSLoggingEnabled())
  {
    v115 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v115, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v220) = v190;
      _os_log_impl(&dword_2378DA000, v115, OS_LOG_TYPE_INFO, "Failed delivering message with code: %d", buf, 8u);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    v170 = (void *)v190;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      v170 = (void *)v190;
      _IMAlwaysLog();
    }
  }
  if (MarcoShouldLogCheckpoints())
  {
    v170 = (void *)v190;
    MarcoNoteCheckpoint();
  }
  uint64_t v116 = v190;
  if (IMOSLoggingEnabled())
  {
    v117 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v117, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v220) = v190;
      _os_log_impl(&dword_2378DA000, v117, OS_LOG_TYPE_INFO, "  Message delivery failed with code: %d", buf, 8u);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    v170 = (void *)v190;
    _IMLoggingLog();
    uint64_t v116 = v190;
    if (_IMWillLog())
    {
      v170 = (void *)v190;
      _IMAlwaysLog();
      uint64_t v116 = v190;
    }
  }
  if (!v119 & v118)
  {
    switch(v116)
    {
      case 5057:
        if (IMOSLoggingEnabled())
        {
          v120 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v120, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2378DA000, v120, OS_LOG_TYPE_INFO, "Self version is too old", buf, 2u);
          }
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          _IMLoggingLog();
          if (_IMWillLog()) {
            _IMAlwaysLog();
          }
        }
        if (MarcoShouldLogCheckpoints()) {
          MarcoNoteCheckpoint();
        }
        if (IMOSLoggingEnabled())
        {
          v121 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v121, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2378DA000, v121, OS_LOG_TYPE_INFO, "  Self version is too old", buf, 2u);
          }
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          _IMLoggingLog();
          if (_IMWillLog()) {
            _IMAlwaysLog();
          }
        }
        v184 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", *MEMORY[0x263F3BAF0], 5057, 0, v170);
        uint64_t v116 = 5057;
        break;
      case 5058:
        if (IMOSLoggingEnabled())
        {
          v134 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v134, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2378DA000, v134, OS_LOG_TYPE_INFO, "Peer version is too old", buf, 2u);
          }
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          _IMLoggingLog();
          if (_IMWillLog()) {
            _IMAlwaysLog();
          }
        }
        if (MarcoShouldLogCheckpoints()) {
          MarcoNoteCheckpoint();
        }
        if (IMOSLoggingEnabled())
        {
          v135 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v135, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2378DA000, v135, OS_LOG_TYPE_INFO, "  Peer verion is too old", buf, 2u);
          }
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          _IMLoggingLog();
          if (_IMWillLog()) {
            _IMAlwaysLog();
          }
        }
        v184 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", *MEMORY[0x263F3BAF0], 5058, 0, v170);
        uint64_t v116 = 5058;
        break;
      case 5063:
        if (IMOSLoggingEnabled())
        {
          v136 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v136, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2378DA000, v136, OS_LOG_TYPE_INFO, "Invitation region context needs update", buf, 2u);
          }
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          _IMLoggingLog();
          if (_IMWillLog()) {
            _IMAlwaysLog();
          }
        }
        if (MarcoShouldLogCheckpoints()) {
          MarcoNoteCheckpoint();
        }
        if (IMOSLoggingEnabled())
        {
          v137 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v137, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2378DA000, v137, OS_LOG_TYPE_INFO, "  Invitation region context needs update", buf, 2u);
          }
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          _IMLoggingLog();
          if (_IMWillLog()) {
            _IMAlwaysLog();
          }
        }
        v184 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", *MEMORY[0x263F3BAF0], 5063, 0, v170);
        uint64_t v116 = 5063;
        break;
      case 5064:
        if (IMOSLoggingEnabled())
        {
          v138 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v138, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2378DA000, v138, OS_LOG_TYPE_INFO, "Incomplete phone number", buf, 2u);
          }
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          _IMLoggingLog();
          if (_IMWillLog()) {
            _IMAlwaysLog();
          }
        }
        if (MarcoShouldLogCheckpoints()) {
          MarcoNoteCheckpoint();
        }
        if (IMOSLoggingEnabled())
        {
          v139 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v139, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2378DA000, v139, OS_LOG_TYPE_INFO, "  Incomplete phone number", buf, 2u);
          }
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          _IMLoggingLog();
          if (_IMWillLog()) {
            _IMAlwaysLog();
          }
        }
        v184 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", *MEMORY[0x263F3BAF0], 5064, 0, v170);
        uint64_t v116 = 5064;
        break;
      default:
        break;
    }
  }
  else
  {
    switch(v116)
    {
      case 5029:
        if (IMOSLoggingEnabled())
        {
          v122 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v122, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2378DA000, v122, OS_LOG_TYPE_INFO, "Not authorized - needs re-register", buf, 2u);
          }
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          _IMLoggingLog();
          if (_IMWillLog()) {
            _IMAlwaysLog();
          }
        }
        if (MarcoShouldLogCheckpoints()) {
          MarcoNoteCheckpoint();
        }
        if (IMOSLoggingEnabled())
        {
          v123 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v123, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2378DA000, v123, OS_LOG_TYPE_INFO, "  Not authorized", buf, 2u);
          }
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          _IMLoggingLog();
          if (_IMWillLog()) {
            _IMAlwaysLog();
          }
        }
        objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "reregister", v170);
        uint64_t v116 = 5029;
        break;
      case 5030:
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v199 = 0u;
          long long v200 = 0u;
          long long v197 = 0u;
          long long v198 = 0u;
          v124 = (void *)[a2 canonicalizedPeers];
          uint64_t v125 = [v124 countByEnumeratingWithState:&v197 objects:v209 count:16];
          if (v125)
          {
            uint64_t v126 = *(void *)v198;
            do
            {
              for (uint64_t m = 0; m != v125; ++m)
              {
                if (*(void *)v198 != v126) {
                  objc_enumerationMutation(v124);
                }
                objc_msgSend((id)objc_msgSend(MEMORY[0x263F4A058], "sharedInstance", v170), "_setCurrentIDStatus:forDestination:service:", 2, objc_msgSend(*(id *)(*((void *)&v197 + 1) + 8 * m), "objectForKey:", @"raw-id"), objc_msgSend(a2, "topic"));
              }
              uint64_t v125 = [v124 countByEnumeratingWithState:&v197 objects:v209 count:16];
            }
            while (v125);
          }
        }
        uint64_t v116 = 5030;
        break;
      case 5031:
        break;
      case 5032:
        if (IMOSLoggingEnabled())
        {
          v128 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v128, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2378DA000, v128, OS_LOG_TYPE_INFO, "Bad signature - will re-register", buf, 2u);
          }
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          _IMLoggingLog();
          if (_IMWillLog()) {
            _IMAlwaysLog();
          }
        }
        if (MarcoShouldLogCheckpoints()) {
          MarcoNoteCheckpoint();
        }
        if (IMOSLoggingEnabled())
        {
          v129 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v129, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2378DA000, v129, OS_LOG_TYPE_INFO, "  Bad signature", buf, 2u);
          }
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          _IMLoggingLog();
          if (_IMWillLog()) {
            _IMAlwaysLog();
          }
        }
        objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "reregister", v170);
        uint64_t v116 = 5032;
        break;
      case 5033:
        if (IMOSLoggingEnabled())
        {
          v130 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v130, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2378DA000, v130, OS_LOG_TYPE_INFO, "New signature required - will re-register", buf, 2u);
          }
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          _IMLoggingLog();
          if (_IMWillLog()) {
            _IMAlwaysLog();
          }
        }
        if (MarcoShouldLogCheckpoints()) {
          MarcoNoteCheckpoint();
        }
        if (IMOSLoggingEnabled())
        {
          v131 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v131, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2378DA000, v131, OS_LOG_TYPE_INFO, "  Requires new signature", buf, 2u);
          }
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          _IMLoggingLog();
          if (_IMWillLog()) {
            _IMAlwaysLog();
          }
        }
        objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "reregister", v170);
        uint64_t v116 = 5033;
        break;
      case 5034:
        if (IMOSLoggingEnabled())
        {
          v132 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v132, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2378DA000, v132, OS_LOG_TYPE_INFO, "New registration required - will re-register", buf, 2u);
          }
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          _IMLoggingLog();
          if (_IMWillLog()) {
            _IMAlwaysLog();
          }
        }
        if (MarcoShouldLogCheckpoints()) {
          MarcoNoteCheckpoint();
        }
        if (IMOSLoggingEnabled())
        {
          v133 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v133, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2378DA000, v133, OS_LOG_TYPE_INFO, "  Requires new registration", buf, 2u);
          }
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          _IMLoggingLog();
          if (_IMWillLog()) {
            _IMAlwaysLog();
          }
        }
        objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "reregister", v170);
        uint64_t v116 = 5034;
        break;
      default:
        JUMPOUT(0);
    }
  }
LABEL_454:
  if (!v184) {
    goto LABEL_516;
  }
  if (IMOSLoggingEnabled())
  {
    v140 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v140, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v220 = (uint64_t)v184;
      _os_log_impl(&dword_2378DA000, v140, OS_LOG_TYPE_INFO, "  Message delivery failed with error: %@", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    v170 = v184;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      v170 = v184;
      _IMAlwaysLog();
    }
  }
  id v141 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v142 = objc_msgSend((id)objc_msgSend(a2, "userInfo"), "objectForKey:", @"ID");
  v143 = objc_msgSend((id)objc_msgSend(a2, "userInfo"), "objectForKey:", @"properties");
  if ([v182 length]) {
    [v141 setObject:v182 forKey:@"conference"];
  }
  if (objc_msgSend(v142, "length", v170)) {
    [v141 setObject:v142 forKey:@"ID"];
  }
  if ([v143 count]) {
    [v141 setObject:v143 forKey:@"properties"];
  }
  v144 = objc_msgSend((id)objc_msgSend(a2, "sessionToken"), "__imHexString");
  if ([v144 length]) {
    [v141 setObject:v144 forKey:@"conference"];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_473;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([a2 reason]) {
      objc_msgSend(v141, "setObject:forKey:", objc_msgSend(a2, "reason"), @"reason");
    }
LABEL_473:
    int v145 = 1;
    uint64_t v146 = 4;
    goto LABEL_474;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([a2 peers]) {
      objc_msgSend(v141, "setObject:forKey:", objc_msgSend(a2, "peers"), @"peers");
    }
    if ([a2 reason]) {
      objc_msgSend(v141, "setObject:forKey:", objc_msgSend(a2, "reason"), @"reason");
    }
    int v145 = 0;
    uint64_t v146 = 3;
    goto LABEL_474;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([a2 peers]) {
      objc_msgSend(v141, "setObject:forKey:", objc_msgSend(a2, "peers"), @"receivers");
    }
    uint64_t v146 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v145 = 1;
      uint64_t v146 = 7;
      goto LABEL_474;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v145 = 1;
      uint64_t v146 = 8;
      goto LABEL_474;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v145 = 0;
      uint64_t v146 = 9;
      goto LABEL_474;
    }
    v167 = (objc_class *)objc_opt_class();
    v171 = NSStringFromClass(v167);
    _IMWarn();
    uint64_t v146 = 0;
  }
  int v145 = 1;
LABEL_474:
  if (objc_msgSend((id)objc_msgSend(v184, "domain", v171), "length")) {
    objc_msgSend(v141, "setObject:forKey:", objc_msgSend(v184, "domain"), @"internalErrorDomain");
  }
  if (objc_msgSend((id)objc_msgSend(v184, "userInfo"), "count")) {
    objc_msgSend(v141, "setObject:forKey:", objc_msgSend(v184, "userInfo"), @"internalUserInfo");
  }
  objc_msgSend(v141, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v184, "code")), @"internalCode");
  if (a5) {
    objc_msgSend(v141, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", v116), @"result");
  }
  if ([a2 messageBodyUsingCache]) {
    objc_msgSend(v141, "setObject:forKey:", objc_msgSend(a2, "messageBodyUsingCache"), @"messageBody");
  }
  if ([a2 bagKey]) {
    objc_msgSend(v141, "setObject:forKey:", objc_msgSend(a2, "bagKey"), @"bagKey");
  }
  v147 = (void *)MEMORY[0x263F087E8];
  if ([v141 count]) {
    id v148 = v141;
  }
  else {
    id v148 = 0;
  }
  uint64_t v149 = [v147 errorWithDomain:*MEMORY[0x263F4A768] code:v146 userInfo:v148];
  if (v145)
  {
    v150 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v150, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v220 = v149;
      _os_log_impl(&dword_2378DA000, v150, OS_LOG_TYPE_DEFAULT, "Posting error: %@", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
      {
        v170 = (void *)v149;
        MarcoLog();
      }
      if (IMShouldLog())
      {
        v170 = (void *)v149;
        IMLogString();
      }
    }
    if (IMOSLoggingEnabled())
    {
      v151 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v151, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v220 = v149;
        _os_log_impl(&dword_2378DA000, v151, OS_LOG_TYPE_INFO, "Posting error: %@", buf, 0xCu);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      v170 = (void *)v149;
      _IMLoggingLog();
      if (_IMWillLog())
      {
        v170 = (void *)v149;
        _IMAlwaysLog();
      }
    }
    objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "broadcaster", v170), "account:postedError:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "accountID"), v149);
  }
  else
  {
    v152 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v152, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v220 = v149;
      _os_log_impl(&dword_2378DA000, v152, OS_LOG_TYPE_DEFAULT, "Not reporting error: %@", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
      {
        v170 = (void *)v149;
        MarcoLog();
      }
      if (IMShouldLog())
      {
        v170 = (void *)v149;
        IMLogString();
      }
    }
    if (IMOSLoggingEnabled())
    {
      v153 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v153, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v220 = v149;
        _os_log_impl(&dword_2378DA000, v153, OS_LOG_TYPE_INFO, "Not reporting error: %@", buf, 0xCu);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      v170 = (void *)v149;
      _IMLoggingLog();
      if (_IMWillLog())
      {
        v170 = (void *)v149;
        _IMAlwaysLog();
      }
    }
  }

LABEL_516:
  v154 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v154, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2378DA000, v154, OS_LOG_TYPE_DEFAULT, "Checking to see if the queue needs flushing", buf, 2u);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (MarcoShouldLog()) {
      MarcoLog();
    }
    if (IMShouldLog()) {
      IMLogString();
    }
  }
  v155 = &OBJC_IVAR___FaceTimeServiceSession__broadcasterVCInvocationQueue;
  if (v187) {
    v155 = &OBJC_IVAR___FaceTimeServiceSession__broadcasterACInvocationQueue;
  }
  uint64_t v156 = *v155;
  uint64_t result = objc_msgSend(*(id *)(*(void *)(a1 + 32) + v156), "isEmpty", v170);
  if ((result & 1) == 0)
  {
    v158 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v158, OS_LOG_TYPE_DEFAULT))
    {
      int v159 = [(id)qword_26AC13540 hasQueuedItems];
      *(_DWORD *)buf = 67109120;
      LODWORD(v220) = v159;
      _os_log_impl(&dword_2378DA000, v158, OS_LOG_TYPE_DEFAULT, "Message delivery has queued items: %d", buf, 8u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
      {
        uint64_t v172 = [(id)qword_26AC13540 hasQueuedItems];
        MarcoLog();
      }
      if (IMShouldLog())
      {
        uint64_t v172 = [(id)qword_26AC13540 hasQueuedItems];
        IMLogString();
      }
    }
    v160 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v160, OS_LOG_TYPE_DEFAULT))
    {
      int v161 = [*(id *)(*(void *)(a1 + 32) + v156) count];
      *(_DWORD *)buf = 67109120;
      LODWORD(v220) = v161;
      _os_log_impl(&dword_2378DA000, v160, OS_LOG_TYPE_DEFAULT, "Queue has %d items in it", buf, 8u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
      {
        uint64_t v172 = [*(id *)(*(void *)(a1 + 32) + v156) count];
        MarcoLog();
      }
      if (IMShouldLog())
      {
        uint64_t v172 = [*(id *)(*(void *)(a1 + 32) + v156) count];
        IMLogString();
      }
    }
    if (objc_msgSend((id)qword_26AC13540, "hasQueuedItems", v172))
    {
      v162 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v162, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2378DA000, v162, OS_LOG_TYPE_DEFAULT, " => Pending delivery", buf, 2u);
      }
      uint64_t result = os_log_shim_legacy_logging_enabled();
      if (result)
      {
        if (MarcoShouldLog()) {
          MarcoLog();
        }
        uint64_t result = IMShouldLog();
        if (result) {
          return IMLogString();
        }
      }
    }
    else
    {
      v163 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v163, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2378DA000, v163, OS_LOG_TYPE_DEFAULT, " => Flushing now", buf, 2u);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (MarcoShouldLog()) {
          MarcoLog();
        }
        if (IMShouldLog()) {
          IMLogString();
        }
      }
      uint64_t v164 = *(void *)(a1 + 32);
      v165 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      if (v187)
      {
        uint64_t v166 = 344;
        objc_msgSend(*(id *)(v164 + 344), "setTarget:", objc_msgSend(v165, "broadcasterForACConferenceListeners"));
      }
      else
      {
        uint64_t v166 = 352;
        objc_msgSend(*(id *)(v164 + 352), "setTarget:", objc_msgSend(v165, "broadcasterForVCConferenceListeners"));
      }
      [*(id *)(*(void *)(a1 + 32) + v166) invokeAll];
      uint64_t result = [*(id *)(*(void *)(a1 + 32) + v166) isEmpty];
      if ((result & 1) == 0)
      {
        _IMWarn();
        return [*(id *)(*(void *)(a1 + 32) + v156) removeAllInvocations];
      }
    }
  }
  return result;
}

__CFDictionary *sub_2378E5AEC(const void *a1)
{
  v2 = (__CFDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  v3 = v2;
  if (a1) {
    CFDictionarySetValue(v2, (const void *)*MEMORY[0x263F4A8C0], a1);
  }

  return v3;
}

uint64_t sub_2378E6898(uint64_t a1, void *a2)
{
  return [a2 _stripFZIDPrefix];
}

uint64_t sub_2378E7FC0()
{
  if (sub_2378F3F88()) {
    return 1;
  }
  int v1 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F4A848], "sharedInstance"), "inValidSIMState");
  return v1 & (objc_msgSend((id)objc_msgSend(MEMORY[0x263F4A848], "sharedInstance"), "isSIMLocked") ^ 1);
}

uint64_t sub_2378E8558()
{
  if (sub_2378F3F88()) {
    return 1;
  }
  int v1 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F4A848], "sharedInstance"), "inValidSIMState");
  int v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F4A848], "sharedInstance"), "isSIMLocked");
  if (v2) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F4A848], "sharedInstance"), "showSIMUnlock");
  }
  return v1 & (v2 ^ 1u);
}

uint64_t sub_2378E93E4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelVCRequestWithPerson:*(void *)(a1 + 40) properties:*(void *)(a1 + 48) conference:*(void *)(a1 + 56) pairsToSkip:*(void *)(a1 + 64) reason:*(void *)(a1 + 72)];
}

void *sub_2378EA870(void *result, void *a2)
{
  if (result)
  {
    if (a2)
    {
      int v3 = [result unsignedIntValue];
      return objc_msgSend(a2, "setObject:forKey:", objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", &v3, 4), @"r");
    }
  }
  return result;
}

uint64_t sub_2378EA8D4(uint64_t result, void *a2)
{
  if (result)
  {
    [a2 setObject:result forKey:@"k"];
    uint64_t v3 = [NSNumber numberWithInt:1];
    return [a2 setObject:v3 forKey:@"kv"];
  }
  return result;
}

void *sub_2378EA940(void *result, void *a2)
{
  if (result)
  {
    if (a2)
    {
      int v3 = [result unsignedIntValue];
      return objc_msgSend(a2, "setObject:forKey:", objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", &v3, 4), @"h");
    }
  }
  return result;
}

uint64_t sub_2378ED580(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_relay_sendCancel_toPerson_);
}

uint64_t sub_2378EF6FC(uint64_t a1)
{
  return [*(id *)(a1 + 32) handler:*(void *)(a1 + 40) sessionInitated:*(void *)(a1 + 48) topic:*(void *)(a1 + 56) myID:*(void *)(a1 + 64) peerID:*(void *)(a1 + 72) peerDisplayID:*(void *)(a1 + 80) peerCN:*(void *)(a1 + 88) peerPushToken:*(void *)(a1 + 96) peerNATType:*(void *)(a1 + 104) peerBlob:*(void *)(a1 + 112) peerNatIP:*(void *)(a1 + 120) clientInfo:*(void *)(a1 + 128) serviceData:*(void *)(a1 + 136)];
}

void *sub_2378EF74C(void *a1)
{
  [a1 objectForKey:@"r"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [a1 objectForKey:@"r"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 0;
    }
    uint64_t result = (void *)[a1 objectForKey:@"r"];
    if (!result) {
      return result;
    }
LABEL_6:
    int v3 = 0;
    [result getBytes:&v3 length:4];
    return (void *)(v3 != 0);
  }
  uint64_t result = objc_msgSend(MEMORY[0x263EFF8F8], "_IDSDataFromBase64String:", objc_msgSend(a1, "objectForKey:", @"r"));
  if (result) {
    goto LABEL_6;
  }
  return result;
}

void *sub_2378EF834(void *a1)
{
  [a1 objectForKey:@"s"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [a1 objectForKey:@"s"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 0;
    }
    uint64_t result = (void *)[a1 objectForKey:@"s"];
    if (!result) {
      return result;
    }
LABEL_6:
    unsigned int v3 = 0;
    [result getBytes:&v3 length:4];
    return (void *)[NSNumber numberWithUnsignedInt:v3];
  }
  uint64_t result = objc_msgSend(MEMORY[0x263EFF8F8], "_IDSDataFromBase64String:", objc_msgSend(a1, "objectForKey:", @"s"));
  if (result) {
    goto LABEL_6;
  }
  return result;
}

void *sub_2378EF920(void *a1)
{
  [a1 objectForKey:@"a"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [a1 objectForKey:@"a"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 0;
    }
    uint64_t result = (void *)[a1 objectForKey:@"a"];
    if (!result) {
      return result;
    }
LABEL_6:
    unsigned int v3 = 0;
    [result getBytes:&v3 length:4];
    return (void *)[NSNumber numberWithUnsignedInt:v3];
  }
  uint64_t result = objc_msgSend(MEMORY[0x263EFF8F8], "_IDSDataFromBase64String:", objc_msgSend(a1, "objectForKey:", @"a"));
  if (result) {
    goto LABEL_6;
  }
  return result;
}

void *sub_2378EFA0C(void *a1)
{
  [a1 objectForKey:@"h"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [a1 objectForKey:@"h"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 0;
    }
    uint64_t result = (void *)[a1 objectForKey:@"h"];
    if (!result) {
      return result;
    }
LABEL_6:
    int v3 = 0;
    [result getBytes:&v3 length:4];
    return (void *)(v3 != 0);
  }
  uint64_t result = objc_msgSend(MEMORY[0x263EFF8F8], "_IDSDataFromBase64String:", objc_msgSend(a1, "objectForKey:", @"h"));
  if (result) {
    goto LABEL_6;
  }
  return result;
}

uint64_t sub_2378EFAF4(void *a1)
{
  [a1 objectForKey:@"k"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v2 = (void *)MEMORY[0x263EFF8F8];
    uint64_t v3 = [a1 objectForKey:@"k"];
    return [v2 _IDSDataFromBase64String:v3];
  }
  else
  {
    [a1 objectForKey:@"k"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      return [a1 objectForKey:@"k"];
    }
    else
    {
      return 0;
    }
  }
}

void *sub_2378EFBD8(void *a1)
{
  [a1 objectForKey:@"p"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [a1 objectForKey:@"p"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 0;
    }
    uint64_t result = (void *)[a1 objectForKey:@"p"];
    if (!result) {
      return result;
    }
LABEL_6:
    unsigned int v3 = 0;
    [result getBytes:&v3 length:4];
    return (void *)[NSNumber numberWithUnsignedInt:v3];
  }
  uint64_t result = objc_msgSend(MEMORY[0x263EFF8F8], "_IDSDataFromBase64String:", objc_msgSend(a1, "objectForKey:", @"p"));
  if (result) {
    goto LABEL_6;
  }
  return result;
}

uint64_t sub_2378F0CF0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handler:sessionAccepted:topic:peerID:peerCN:peerPushToken:peerNATType:peerBlob:peerNatIP:relayType:relayConnectionID:relayTransactionIDAlloc:relayTokenAllocReq:myRelayIP:myRelayPort:peerRelayIP:peerRelayPort:clientInfo:serviceData:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144), *(void *)(a1 + 152), *(void *)(a1 + 160),
           *(void *)(a1 + 168),
           *(void *)(a1 + 176),
           *(void *)(a1 + 184));
}

id sub_2378F0D50(uint64_t a1, uint64_t a2)
{
  int v2 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", a1, @"id", a2, @"push-token", 0);
  unsigned int v3 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v2, 0);

  return v3;
}

uint64_t sub_2378F18A4(uint64_t a1)
{
  return [*(id *)(a1 + 32) handler:*(void *)(a1 + 40) sessionRejected:*(void *)(a1 + 48) topic:*(void *)(a1 + 56) peerID:*(void *)(a1 + 64) peerPushToken:*(void *)(a1 + 72) reason:*(void *)(a1 + 80) clientInfo:*(void *)(a1 + 88) serviceData:*(void *)(a1 + 96)];
}

uint64_t sub_2378F3F88()
{
  if (!objc_msgSend((id)objc_msgSend(MEMORY[0x263F3BB18], "sharedInstance"), "isTelephonyDevice")
    || (objc_msgSend((id)objc_msgSend(MEMORY[0x263F3BB40], "sharedInstance"), "allowAnyNetwork") & 1) != 0)
  {
    return 1;
  }
  uint64_t v1 = [MEMORY[0x263F4A848] sharedInstance];

  return MEMORY[0x270F9A6D0](v1, sel_isAirplaneModeEnabled);
}

uint64_t sub_2378F3FEC(unsigned int a1)
{
  if (a1 < 4) {
    return a1 + 1;
  }
  else {
    return 0;
  }
}

uint64_t sub_2378F3FF8(uint64_t a1)
{
  uint64_t v1 = a1;
  if (a1 <= 4999)
  {
    if (a1 > 199)
    {
      if (a1 == 200) {
        return 2;
      }
      if (a1 == 1000) {
        return 70;
      }
    }
    else
    {
      if (!a1) {
        return 1;
      }
      if (a1 == 1) {
        return 0;
      }
    }
LABEL_89:
    _IMWarn();
    return v1;
  }
  if (a1 > 5999)
  {
    if (a1 > 9999)
    {
      if (a1 == 10000) {
        return 73;
      }
      if (a1 == 20000) {
        return 74;
      }
    }
    else
    {
      if (a1 == 6000) {
        return 71;
      }
      if (a1 == 8000) {
        return 72;
      }
    }
    goto LABEL_89;
  }
  switch(a1)
  {
    case 5000:
      uint64_t v1 = 3;
      break;
    case 5001:
      uint64_t v1 = 4;
      break;
    case 5002:
      uint64_t v1 = 5;
      break;
    case 5003:
      uint64_t v1 = 6;
      break;
    case 5004:
      uint64_t v1 = 7;
      break;
    case 5005:
      uint64_t v1 = 8;
      break;
    case 5006:
      uint64_t v1 = 9;
      break;
    case 5007:
      uint64_t v1 = 10;
      break;
    case 5008:
      uint64_t v1 = 11;
      break;
    case 5009:
      uint64_t v1 = 12;
      break;
    case 5010:
      uint64_t v1 = 13;
      break;
    case 5011:
      uint64_t v1 = 14;
      break;
    case 5012:
      uint64_t v1 = 15;
      break;
    case 5013:
      uint64_t v1 = 16;
      break;
    case 5014:
      uint64_t v1 = 17;
      break;
    case 5015:
      uint64_t v1 = 18;
      break;
    case 5016:
      uint64_t v1 = 19;
      break;
    case 5017:
      uint64_t v1 = 20;
      break;
    case 5018:
      uint64_t v1 = 21;
      break;
    case 5019:
      uint64_t v1 = 22;
      break;
    case 5020:
      uint64_t v1 = 23;
      break;
    case 5021:
      uint64_t v1 = 24;
      break;
    case 5022:
      uint64_t v1 = 25;
      break;
    case 5023:
      uint64_t v1 = 26;
      break;
    case 5024:
      uint64_t v1 = 27;
      break;
    case 5025:
      uint64_t v1 = 28;
      break;
    case 5026:
      uint64_t v1 = 29;
      break;
    case 5027:
      uint64_t v1 = 30;
      break;
    case 5028:
      uint64_t v1 = 31;
      break;
    case 5029:
      uint64_t v1 = 32;
      break;
    case 5030:
      uint64_t v1 = 33;
      break;
    case 5031:
      uint64_t v1 = 34;
      break;
    case 5032:
      uint64_t v1 = 35;
      break;
    case 5033:
      uint64_t v1 = 36;
      break;
    case 5034:
      uint64_t v1 = 37;
      break;
    case 5035:
      uint64_t v1 = 41;
      break;
    case 5036:
      uint64_t v1 = 42;
      break;
    case 5037:
      uint64_t v1 = 43;
      break;
    case 5038:
    case 5055:
      uint64_t v1 = 44;
      break;
    case 5039:
      uint64_t v1 = 38;
      break;
    case 5040:
      uint64_t v1 = 39;
      break;
    case 5041:
      uint64_t v1 = 40;
      break;
    case 5046:
      uint64_t v1 = 45;
      break;
    case 5047:
      uint64_t v1 = 46;
      break;
    case 5048:
      uint64_t v1 = 47;
      break;
    case 5051:
      uint64_t v1 = 48;
      break;
    case 5052:
      uint64_t v1 = 49;
      break;
    case 5057:
      uint64_t v1 = 50;
      break;
    case 5058:
      uint64_t v1 = 51;
      break;
    case 5059:
      uint64_t v1 = 52;
      break;
    case 5060:
      uint64_t v1 = 53;
      break;
    case 5061:
      uint64_t v1 = 54;
      break;
    case 5062:
      uint64_t v1 = 55;
      break;
    case 5063:
      uint64_t v1 = 56;
      break;
    case 5064:
      uint64_t v1 = 57;
      break;
    case 5068:
      uint64_t v1 = 58;
      break;
    case 5076:
      uint64_t v1 = 64;
      break;
    case 5078:
      uint64_t v1 = 59;
      break;
    case 5079:
      uint64_t v1 = 60;
      break;
    case 5080:
      uint64_t v1 = 61;
      break;
    case 5085:
      uint64_t v1 = 65;
      break;
    case 5086:
      uint64_t v1 = 66;
      break;
    case 5087:
      uint64_t v1 = 67;
      break;
    case 5088:
      uint64_t v1 = 68;
      break;
    case 5089:
      uint64_t v1 = 62;
      break;
    case 5090:
      uint64_t v1 = 63;
      break;
    case 5092:
      uint64_t v1 = 69;
      break;
    default:
      goto LABEL_89;
  }
  return v1;
}

uint64_t sub_2378F44A8(uint64_t a1)
{
  v4.tv_sec = 0;
  *(void *)&v4.tv_usec = 0;
  gettimeofday(&v4, 0);
  memset(&v3, 0, sizeof(v3));
  localtime_r(&v4.tv_sec, &v3);
  return [NSString stringWithFormat:@"%02d:%02d:%02d.%06d %@", v3.tm_hour, v3.tm_min, v3.tm_sec, v4.tv_usec, a1];
}

void sub_2378F5134(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_2378F7B94()
{
  v0 = (void *)MEMORY[0x237E24D80]();
  id v1 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  int v2 = _Block_copy(&unk_26EA8B870);
  objc_msgSend(v1, "setObject:forKey:", v2, objc_msgSend(NSNumber, "numberWithInteger:", 1));

  tm v3 = _Block_copy(&unk_26EA8B890);
  objc_msgSend(v1, "setObject:forKey:", v3, objc_msgSend(NSNumber, "numberWithInteger:", 2));

  timeval v4 = _Block_copy(&unk_26EA8B8B0);
  objc_msgSend(v1, "setObject:forKey:", v4, objc_msgSend(NSNumber, "numberWithInteger:", 3));

  v5 = _Block_copy(&unk_26EA8B8D0);
  objc_msgSend(v1, "setObject:forKey:", v5, objc_msgSend(NSNumber, "numberWithInteger:", 4));

  v6 = _Block_copy(&unk_26EA8B8F0);
  objc_msgSend(v1, "setObject:forKey:", v6, objc_msgSend(NSNumber, "numberWithInteger:", 8));

  v7 = _Block_copy(&unk_26EA8B910);
  objc_msgSend(v1, "setObject:forKey:", v7, objc_msgSend(NSNumber, "numberWithInteger:", 5));

  uint64_t v8 = _Block_copy(&unk_26EA8B930);
  objc_msgSend(v1, "setObject:forKey:", v8, objc_msgSend(NSNumber, "numberWithInteger:", 6));

  uint64_t v9 = _Block_copy(&unk_26EA8B950);
  objc_msgSend(v1, "setObject:forKey:", v9, objc_msgSend(NSNumber, "numberWithInteger:", 7));

  qword_26AC13548 = (uint64_t)v1;
}

void sub_2378F7D70(uint64_t a1, void *a2, uint64_t a3, __CFString *a4)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v49 = a4;
      _os_log_impl(&dword_2378DA000, v5, OS_LOG_TYPE_DEBUG, "_handleInitatePush: %@", buf, 0xCu);
    }
  }
  v6 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v49 = a4;
    _os_log_impl(&dword_2378DA000, v6, OS_LOG_TYPE_DEFAULT, "userInfo: %@", buf, 0xCu);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (MarcoShouldLog())
    {
      uint64_t v34 = a4;
      MarcoLog();
    }
    if (IMShouldLog())
    {
      uint64_t v34 = a4;
      IMLogString();
    }
  }
  v7 = objc_msgSend(a2, "copyHandlersForEnumerating", v34);
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v8)
  {
    uint64_t v40 = *(void *)v45;
    obuint64_t j = v7;
    do
    {
      uint64_t v9 = 0;
      uint64_t v41 = v8;
      do
      {
        if (*(void *)v45 != v40) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v44 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector())
        {
          [(__CFString *)a4 objectForKey:@"s"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v39 = objc_msgSend(MEMORY[0x263EFF8F8], "_IDSDataFromBase64String:", -[__CFString objectForKey:](a4, "objectForKey:", @"s"));
          }
          else
          {
            [(__CFString *)a4 objectForKey:@"s"];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              uint64_t v39 = [(__CFString *)a4 objectForKey:@"s"];
            }
            else {
              uint64_t v39 = 0;
            }
          }
          uint64_t v11 = objc_opt_class();
          uint64_t v43 = [(__CFString *)a4 objectForKey:@"i"];
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (v43)
            {
              double v12 = [MEMORY[0x263F4A860] registration];
              if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412546;
                v49 = @"i";
                __int16 v50 = 2112;
                uint64_t v51 = v11;
                _os_log_fault_impl(&dword_2378DA000, v12, OS_LOG_TYPE_FAULT, "_handleInitatePush: %@", buf, 0x16u);
              }
            }
            uint64_t v43 = 0;
          }
          uint64_t v13 = objc_opt_class();
          uint64_t v42 = [(__CFString *)a4 objectForKey:@"I"];
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (v42)
            {
              double v14 = [MEMORY[0x263F4A860] registration];
              if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412546;
                v49 = @"I";
                __int16 v50 = 2112;
                uint64_t v51 = v13;
                _os_log_fault_impl(&dword_2378DA000, v14, OS_LOG_TYPE_FAULT, "_handleInitatePush: %@", buf, 0x16u);
              }
            }
            uint64_t v42 = 0;
          }
          uint64_t v15 = objc_opt_class();
          uint64_t v16 = [(__CFString *)a4 objectForKey:@"W"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v16)
          {
            v17 = [MEMORY[0x263F4A860] registration];
            if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              v49 = @"W";
              __int16 v50 = 2112;
              uint64_t v51 = v15;
              _os_log_fault_impl(&dword_2378DA000, v17, OS_LOG_TYPE_FAULT, "_handleInitatePush: %@", buf, 0x16u);
            }
            uint64_t v16 = 0;
          }
          uint64_t v18 = objc_opt_class();
          uint64_t v19 = [(__CFString *)a4 objectForKey:@"J"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v19)
          {
            double v20 = [MEMORY[0x263F4A860] registration];
            if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              v49 = @"J";
              __int16 v50 = 2112;
              uint64_t v51 = v18;
              _os_log_fault_impl(&dword_2378DA000, v20, OS_LOG_TYPE_FAULT, "_handleInitatePush: %@", buf, 0x16u);
            }
            uint64_t v19 = 0;
          }
          [(__CFString *)a4 objectForKey:@"P"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v38 = objc_msgSend(MEMORY[0x263EFF8F8], "_IDSDataFromBase64String:", -[__CFString objectForKey:](a4, "objectForKey:", @"P"));
          }
          else
          {
            [(__CFString *)a4 objectForKey:@"P"];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              uint64_t v38 = [(__CFString *)a4 objectForKey:@"P"];
            }
            else {
              uint64_t v38 = 0;
            }
          }
          v21 = NSNumber;
          uint64_t v22 = objc_opt_class();
          v23 = (void *)[(__CFString *)a4 objectForKey:@"N"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v23)
          {
            double v24 = [MEMORY[0x263F4A860] registration];
            if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              v49 = @"N";
              __int16 v50 = 2112;
              uint64_t v51 = v22;
              _os_log_fault_impl(&dword_2378DA000, v24, OS_LOG_TYPE_FAULT, "_handleInitatePush: %@", buf, 0x16u);
            }
            v23 = 0;
          }
          uint64_t v25 = objc_msgSend(v21, "numberWithInt:", objc_msgSend(v23, "intValue"));
          [(__CFString *)a4 objectForKey:@"B"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v26 = objc_msgSend(MEMORY[0x263EFF8F8], "_IDSDataFromBase64String:", -[__CFString objectForKey:](a4, "objectForKey:", @"B"));
            goto LABEL_56;
          }
          [(__CFString *)a4 objectForKey:@"B"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v26 = [(__CFString *)a4 objectForKey:@"B"];
LABEL_56:
            uint64_t v27 = v26;
          }
          else
          {
            uint64_t v27 = 0;
          }
          [(__CFString *)a4 objectForKey:@"A"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v28 = objc_msgSend(MEMORY[0x263EFF8F8], "_IDSDataFromBase64String:", -[__CFString objectForKey:](a4, "objectForKey:", @"A"));
            goto LABEL_62;
          }
          [(__CFString *)a4 objectForKey:@"A"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v28 = [(__CFString *)a4 objectForKey:@"A"];
LABEL_62:
            uint64_t v29 = v28;
          }
          else
          {
            uint64_t v29 = 0;
          }
          uint64_t v30 = objc_opt_class();
          uint64_t v31 = [(__CFString *)a4 objectForKey:@"x"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v31)
          {
            double v32 = [MEMORY[0x263F4A860] registration];
            if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              v49 = @"x";
              __int16 v50 = 2112;
              uint64_t v51 = v30;
              _os_log_fault_impl(&dword_2378DA000, v32, OS_LOG_TYPE_FAULT, "_handleInitatePush: %@", buf, 0x16u);
            }
            uint64_t v31 = 0;
          }
          [(__CFString *)a4 objectForKey:@"d"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v33 = objc_msgSend(MEMORY[0x263EFF8F8], "_IDSDataFromBase64String:", -[__CFString objectForKey:](a4, "objectForKey:", @"d"));
          }
          else
          {
            [(__CFString *)a4 objectForKey:@"d"];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              uint64_t v33 = [(__CFString *)a4 objectForKey:@"d"];
            }
            else {
              uint64_t v33 = 0;
            }
          }
          [v10 handler:a2 sessionInitated:v39 topic:a3 myID:v43 peerID:v42 peerDisplayID:v16 peerCN:v19 peerPushToken:v38 peerNATType:v25 peerBlob:v27 peerNatIP:v29 clientInfo:v31 serviceData:v33];
        }
        ++v9;
      }
      while (v41 != v9);
      v7 = obj;
      uint64_t v8 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
    }
    while (v8);
  }
}

void sub_2378F87D0()
{
}

void sub_2378F8828()
{
}

void sub_2378F88D8(uint64_t a1, void *a2, uint64_t a3, __CFString *a4)
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v67 = a4;
      _os_log_impl(&dword_2378DA000, v5, OS_LOG_TYPE_DEBUG, "_handleAcceptPush: %@", buf, 0xCu);
    }
  }
  v6 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v67 = a4;
    _os_log_impl(&dword_2378DA000, v6, OS_LOG_TYPE_DEFAULT, "userInfo: %@", buf, 0xCu);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (MarcoShouldLog())
    {
      long long v46 = a4;
      MarcoLog();
    }
    if (IMShouldLog())
    {
      long long v46 = a4;
      IMLogString();
    }
  }
  v7 = objc_msgSend(a2, "copyHandlersForEnumerating", v46);
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v62 objects:v70 count:16];
  if (v8)
  {
    uint64_t v58 = *(void *)v63;
    obuint64_t j = v7;
    do
    {
      uint64_t v9 = 0;
      uint64_t v59 = v8;
      do
      {
        if (*(void *)v63 != v58) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v62 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector())
        {
          [(__CFString *)a4 objectForKey:@"s"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v57 = objc_msgSend(MEMORY[0x263EFF8F8], "_IDSDataFromBase64String:", -[__CFString objectForKey:](a4, "objectForKey:", @"s"));
          }
          else
          {
            [(__CFString *)a4 objectForKey:@"s"];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              uint64_t v57 = [(__CFString *)a4 objectForKey:@"s"];
            }
            else {
              uint64_t v57 = 0;
            }
          }
          uint64_t v11 = objc_opt_class();
          uint64_t v61 = [(__CFString *)a4 objectForKey:@"I"];
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (v61)
            {
              double v12 = [MEMORY[0x263F4A860] registration];
              if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412546;
                v67 = @"I";
                __int16 v68 = 2112;
                uint64_t v69 = v11;
                _os_log_fault_impl(&dword_2378DA000, v12, OS_LOG_TYPE_FAULT, "_handleInitatePush: %@", buf, 0x16u);
              }
            }
            uint64_t v61 = 0;
          }
          uint64_t v13 = objc_opt_class();
          uint64_t v60 = [(__CFString *)a4 objectForKey:@"J"];
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (v60)
            {
              double v14 = [MEMORY[0x263F4A860] registration];
              if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412546;
                v67 = @"J";
                __int16 v68 = 2112;
                uint64_t v69 = v13;
                _os_log_fault_impl(&dword_2378DA000, v14, OS_LOG_TYPE_FAULT, "_handleInitatePush: %@", buf, 0x16u);
              }
            }
            uint64_t v60 = 0;
          }
          [(__CFString *)a4 objectForKey:@"P"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v56 = objc_msgSend(MEMORY[0x263EFF8F8], "_IDSDataFromBase64String:", -[__CFString objectForKey:](a4, "objectForKey:", @"P"));
          }
          else
          {
            [(__CFString *)a4 objectForKey:@"P"];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              uint64_t v56 = [(__CFString *)a4 objectForKey:@"P"];
            }
            else {
              uint64_t v56 = 0;
            }
          }
          uint64_t v15 = NSNumber;
          uint64_t v16 = objc_opt_class();
          v17 = (void *)[(__CFString *)a4 objectForKey:@"N"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v17)
          {
            uint64_t v18 = [MEMORY[0x263F4A860] registration];
            if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              v67 = @"N";
              __int16 v68 = 2112;
              uint64_t v69 = v16;
              _os_log_fault_impl(&dword_2378DA000, v18, OS_LOG_TYPE_FAULT, "_handleInitatePush: %@", buf, 0x16u);
            }
            v17 = 0;
          }
          uint64_t v55 = objc_msgSend(v15, "numberWithInt:", objc_msgSend(v17, "intValue"));
          [(__CFString *)a4 objectForKey:@"B"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v54 = objc_msgSend(MEMORY[0x263EFF8F8], "_IDSDataFromBase64String:", -[__CFString objectForKey:](a4, "objectForKey:", @"B"));
          }
          else
          {
            [(__CFString *)a4 objectForKey:@"B"];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              uint64_t v54 = [(__CFString *)a4 objectForKey:@"B"];
            }
            else {
              uint64_t v54 = 0;
            }
          }
          [(__CFString *)a4 objectForKey:@"A"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v53 = objc_msgSend(MEMORY[0x263EFF8F8], "_IDSDataFromBase64String:", -[__CFString objectForKey:](a4, "objectForKey:", @"A"));
          }
          else
          {
            [(__CFString *)a4 objectForKey:@"A"];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              uint64_t v53 = [(__CFString *)a4 objectForKey:@"A"];
            }
            else {
              uint64_t v53 = 0;
            }
          }
          uint64_t v19 = objc_opt_class();
          uint64_t v20 = [(__CFString *)a4 objectForKey:@"t"];
          if (objc_opt_isKindOfClass())
          {
            if (v20)
            {
              v21 = NSNumber;
              uint64_t v22 = objc_opt_class();
              v23 = (void *)[(__CFString *)a4 objectForKey:@"t"];
              if ((objc_opt_isKindOfClass() & 1) == 0 && v23)
              {
                double v24 = [MEMORY[0x263F4A860] registration];
                if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  v67 = @"t";
                  __int16 v68 = 2112;
                  uint64_t v69 = v22;
                  _os_log_fault_impl(&dword_2378DA000, v24, OS_LOG_TYPE_FAULT, "_handleInitatePush: %@", buf, 0x16u);
                }
                v23 = 0;
              }
              uint64_t v52 = objc_msgSend(v21, "numberWithInt:", objc_msgSend(v23, "intValue"));
LABEL_64:
              [(__CFString *)a4 objectForKey:@"k"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v51 = objc_msgSend(MEMORY[0x263EFF8F8], "_IDSDataFromBase64String:", -[__CFString objectForKey:](a4, "objectForKey:", @"k"));
              }
              else
              {
                [(__CFString *)a4 objectForKey:@"k"];
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  uint64_t v51 = [(__CFString *)a4 objectForKey:@"k"];
                }
                else {
                  uint64_t v51 = 0;
                }
              }
              [(__CFString *)a4 objectForKey:@"q"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v50 = objc_msgSend(MEMORY[0x263EFF8F8], "_IDSDataFromBase64String:", -[__CFString objectForKey:](a4, "objectForKey:", @"q"));
              }
              else
              {
                [(__CFString *)a4 objectForKey:@"q"];
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  uint64_t v50 = [(__CFString *)a4 objectForKey:@"q"];
                }
                else {
                  uint64_t v50 = 0;
                }
              }
              [(__CFString *)a4 objectForKey:@"r"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v26 = objc_msgSend(MEMORY[0x263EFF8F8], "_IDSDataFromBase64String:", -[__CFString objectForKey:](a4, "objectForKey:", @"r"));
                goto LABEL_78;
              }
              [(__CFString *)a4 objectForKey:@"r"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v26 = [(__CFString *)a4 objectForKey:@"r"];
LABEL_78:
                uint64_t v27 = v26;
              }
              else
              {
                uint64_t v27 = 0;
              }
              [(__CFString *)a4 objectForKey:@"h"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v28 = objc_msgSend(MEMORY[0x263EFF8F8], "_IDSDataFromBase64String:", -[__CFString objectForKey:](a4, "objectForKey:", @"h"));
                goto LABEL_84;
              }
              [(__CFString *)a4 objectForKey:@"h"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v28 = [(__CFString *)a4 objectForKey:@"h"];
LABEL_84:
                uint64_t v29 = v28;
              }
              else
              {
                uint64_t v29 = 0;
              }
              uint64_t v30 = NSNumber;
              uint64_t v31 = objc_opt_class();
              double v32 = (void *)[(__CFString *)a4 objectForKey:@"o"];
              if ((objc_opt_isKindOfClass() & 1) == 0 && v32)
              {
                uint64_t v33 = [MEMORY[0x263F4A860] registration];
                if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  v67 = @"o";
                  __int16 v68 = 2112;
                  uint64_t v69 = v31;
                  _os_log_fault_impl(&dword_2378DA000, v33, OS_LOG_TYPE_FAULT, "_handleInitatePush: %@", buf, 0x16u);
                }
                double v32 = 0;
              }
              uint64_t v34 = objc_msgSend(v30, "numberWithInt:", objc_msgSend(v32, "intValue"));
              [(__CFString *)a4 objectForKey:@"H"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v35 = objc_msgSend(MEMORY[0x263EFF8F8], "_IDSDataFromBase64String:", -[__CFString objectForKey:](a4, "objectForKey:", @"H"));
                goto LABEL_95;
              }
              [(__CFString *)a4 objectForKey:@"H"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v35 = [(__CFString *)a4 objectForKey:@"H"];
LABEL_95:
                uint64_t v36 = v35;
              }
              else
              {
                uint64_t v36 = 0;
              }
              v37 = NSNumber;
              uint64_t v38 = objc_opt_class();
              uint64_t v39 = (void *)[(__CFString *)a4 objectForKey:@"O"];
              if ((objc_opt_isKindOfClass() & 1) == 0 && v39)
              {
                uint64_t v40 = [MEMORY[0x263F4A860] registration];
                if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  v67 = @"O";
                  __int16 v68 = 2112;
                  uint64_t v69 = v38;
                  _os_log_fault_impl(&dword_2378DA000, v40, OS_LOG_TYPE_FAULT, "_handleInitatePush: %@", buf, 0x16u);
                }
                uint64_t v39 = 0;
              }
              uint64_t v41 = objc_msgSend(v37, "numberWithInt:", objc_msgSend(v39, "intValue"));
              uint64_t v42 = objc_opt_class();
              uint64_t v43 = [(__CFString *)a4 objectForKey:@"x"];
              if ((objc_opt_isKindOfClass() & 1) == 0 && v43)
              {
                long long v44 = [MEMORY[0x263F4A860] registration];
                if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  v67 = @"x";
                  __int16 v68 = 2112;
                  uint64_t v69 = v42;
                  _os_log_fault_impl(&dword_2378DA000, v44, OS_LOG_TYPE_FAULT, "_handleInitatePush: %@", buf, 0x16u);
                }
                uint64_t v43 = 0;
              }
              [(__CFString *)a4 objectForKey:@"d"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v45 = objc_msgSend(MEMORY[0x263EFF8F8], "_IDSDataFromBase64String:", -[__CFString objectForKey:](a4, "objectForKey:", @"d"));
              }
              else
              {
                [(__CFString *)a4 objectForKey:@"d"];
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  uint64_t v45 = [(__CFString *)a4 objectForKey:@"d"];
                }
                else {
                  uint64_t v45 = 0;
                }
              }
              objc_msgSend(v10, "handler:sessionAccepted:topic:peerID:peerCN:peerPushToken:peerNATType:peerBlob:peerNatIP:relayType:relayConnectionID:relayTransactionIDAlloc:relayTokenAllocReq:myRelayIP:myRelayPort:peerRelayIP:peerRelayPort:clientInfo:serviceData:", a2, v57, a3, v61, v60, v56, v55, v54, v53, v52, v51, v50, v27, v29, v34,
                v36,
                v41,
                v43,
                v45);
              goto LABEL_113;
            }
          }
          else if (v20)
          {
            uint64_t v25 = [MEMORY[0x263F4A860] registration];
            if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              v67 = @"t";
              __int16 v68 = 2112;
              uint64_t v69 = v19;
              _os_log_fault_impl(&dword_2378DA000, v25, OS_LOG_TYPE_FAULT, "_handleInitatePush: %@", buf, 0x16u);
            }
          }
          uint64_t v52 = 0;
          goto LABEL_64;
        }
LABEL_113:
        ++v9;
      }
      while (v59 != v9);
      v7 = obj;
      uint64_t v8 = [obj countByEnumeratingWithState:&v62 objects:v70 count:16];
    }
    while (v8);
  }
}

void sub_2378F9830()
{
}

void sub_2378F9888()
{
}

void sub_2378F9938(uint64_t a1, void *a2, uint64_t a3, __CFString *a4)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v39 = a4;
      _os_log_impl(&dword_2378DA000, v5, OS_LOG_TYPE_DEBUG, "_handleRejectPush: %@", buf, 0xCu);
    }
  }
  v6 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v39 = a4;
    _os_log_impl(&dword_2378DA000, v6, OS_LOG_TYPE_DEFAULT, "userInfo: %@", buf, 0xCu);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (MarcoShouldLog())
    {
      uint64_t v28 = a4;
      MarcoLog();
    }
    if (IMShouldLog())
    {
      uint64_t v28 = a4;
      IMLogString();
    }
  }
  v7 = objc_msgSend(a2, "copyHandlersForEnumerating", v28);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v8)
  {
    uint64_t v33 = *(void *)v35;
    *(void *)&long long v9 = 138412802;
    long long v29 = v9;
    obuint64_t j = v7;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v35 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v34 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector())
        {
          [(__CFString *)a4 objectForKey:@"s"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v12 = objc_msgSend(MEMORY[0x263EFF8F8], "_IDSDataFromBase64String:", -[__CFString objectForKey:](a4, "objectForKey:", @"s"));
            goto LABEL_21;
          }
          [(__CFString *)a4 objectForKey:@"s"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v12 = [(__CFString *)a4 objectForKey:@"s"];
LABEL_21:
            uint64_t v13 = v12;
          }
          else
          {
            uint64_t v13 = 0;
          }
          uint64_t v14 = objc_opt_class();
          uint64_t v15 = [(__CFString *)a4 objectForKey:@"I"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v15)
          {
            uint64_t v16 = [MEMORY[0x263F4A860] registration];
            if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v39 = @"I";
              __int16 v40 = 2112;
              uint64_t v41 = v14;
              _os_log_fault_impl(&dword_2378DA000, v16, OS_LOG_TYPE_FAULT, "_handleInitatePush: %@", buf, 0x16u);
            }
            uint64_t v15 = 0;
          }
          [(__CFString *)a4 objectForKey:@"P"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v17 = objc_msgSend(MEMORY[0x263EFF8F8], "_IDSDataFromBase64String:", -[__CFString objectForKey:](a4, "objectForKey:", @"P"));
            goto LABEL_32;
          }
          [(__CFString *)a4 objectForKey:@"P"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v17 = [(__CFString *)a4 objectForKey:@"P"];
LABEL_32:
            uint64_t v18 = v17;
          }
          else
          {
            uint64_t v18 = 0;
          }
          uint64_t v19 = NSNumber;
          uint64_t v20 = objc_opt_class();
          v21 = (void *)[(__CFString *)a4 objectForKey:@"y"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v21)
          {
            uint64_t v22 = [MEMORY[0x263F4A860] registration];
            if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v39 = @"y";
              __int16 v40 = 2112;
              uint64_t v41 = v20;
              _os_log_fault_impl(&dword_2378DA000, v22, OS_LOG_TYPE_FAULT, "_handleInitatePush: %@", buf, 0x16u);
            }
            v21 = 0;
          }
          uint64_t v23 = objc_msgSend(v19, "numberWithInt:", objc_msgSend(v21, "intValue"));
          uint64_t v24 = objc_opt_class();
          uint64_t v25 = [(__CFString *)a4 objectForKey:@"x"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v25)
          {
            uint64_t v26 = [MEMORY[0x263F4A860] registration];
            if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v39 = @"x";
              __int16 v40 = 2112;
              uint64_t v41 = v24;
              _os_log_fault_impl(&dword_2378DA000, v26, OS_LOG_TYPE_FAULT, "_handleInitatePush: %@", buf, 0x16u);
            }
            uint64_t v25 = 0;
          }
          [(__CFString *)a4 objectForKey:@"d"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v27 = objc_msgSend(MEMORY[0x263EFF8F8], "_IDSDataFromBase64String:", -[__CFString objectForKey:](a4, "objectForKey:", @"d"));
          }
          else
          {
            [(__CFString *)a4 objectForKey:@"d"];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              uint64_t v27 = [(__CFString *)a4 objectForKey:@"d"];
            }
            else {
              uint64_t v27 = 0;
            }
          }
          objc_msgSend(v11, "handler:sessionRejected:topic:peerID:peerPushToken:reason:clientInfo:serviceData:", a2, v13, a3, v15, v18, v23, v25, v27, v29);
        }
        ++v10;
      }
      while (v8 != v10);
      v7 = obj;
      uint64_t v8 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v8);
  }
}

void sub_2378FA060()
{
}

void sub_2378FA0B8()
{
}

void sub_2378FA168(uint64_t a1, void *a2, uint64_t a3, __CFString *a4)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      long long v35 = a4;
      _os_log_impl(&dword_2378DA000, v5, OS_LOG_TYPE_DEBUG, "_handleCancelPush: %@", buf, 0xCu);
    }
  }
  v6 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    long long v35 = a4;
    _os_log_impl(&dword_2378DA000, v6, OS_LOG_TYPE_DEFAULT, "userInfo: %@", buf, 0xCu);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (MarcoShouldLog())
    {
      uint64_t v25 = a4;
      MarcoLog();
    }
    if (IMShouldLog())
    {
      uint64_t v25 = a4;
      IMLogString();
    }
  }
  v7 = objc_msgSend(a2, "copyHandlersForEnumerating", v25);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v8)
  {
    uint64_t v29 = *(void *)v31;
    obuint64_t j = v7;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v31 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v30 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector())
        {
          [(__CFString *)a4 objectForKey:@"s"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v11 = objc_msgSend(MEMORY[0x263EFF8F8], "_IDSDataFromBase64String:", -[__CFString objectForKey:](a4, "objectForKey:", @"s"));
            goto LABEL_21;
          }
          [(__CFString *)a4 objectForKey:@"s"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v11 = [(__CFString *)a4 objectForKey:@"s"];
LABEL_21:
            uint64_t v12 = v11;
          }
          else
          {
            uint64_t v12 = 0;
          }
          uint64_t v13 = objc_opt_class();
          uint64_t v14 = [(__CFString *)a4 objectForKey:@"I"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v14)
          {
            uint64_t v15 = [MEMORY[0x263F4A860] registration];
            if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              long long v35 = @"I";
              __int16 v36 = 2112;
              uint64_t v37 = v13;
              _os_log_fault_impl(&dword_2378DA000, v15, OS_LOG_TYPE_FAULT, "_handleInitatePush: %@", buf, 0x16u);
            }
            uint64_t v14 = 0;
          }
          uint64_t v16 = NSNumber;
          uint64_t v17 = objc_opt_class();
          uint64_t v18 = (void *)[(__CFString *)a4 objectForKey:@"y"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v18)
          {
            uint64_t v19 = [MEMORY[0x263F4A860] registration];
            if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              long long v35 = @"y";
              __int16 v36 = 2112;
              uint64_t v37 = v17;
              _os_log_fault_impl(&dword_2378DA000, v19, OS_LOG_TYPE_FAULT, "_handleInitatePush: %@", buf, 0x16u);
            }
            uint64_t v18 = 0;
          }
          uint64_t v20 = objc_msgSend(v16, "numberWithInt:", objc_msgSend(v18, "intValue"));
          uint64_t v21 = objc_opt_class();
          uint64_t v22 = [(__CFString *)a4 objectForKey:@"x"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v22)
          {
            uint64_t v23 = [MEMORY[0x263F4A860] registration];
            if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              long long v35 = @"x";
              __int16 v36 = 2112;
              uint64_t v37 = v21;
              _os_log_fault_impl(&dword_2378DA000, v23, OS_LOG_TYPE_FAULT, "_handleInitatePush: %@", buf, 0x16u);
            }
            uint64_t v22 = 0;
          }
          [(__CFString *)a4 objectForKey:@"d"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v24 = objc_msgSend(MEMORY[0x263EFF8F8], "_IDSDataFromBase64String:", -[__CFString objectForKey:](a4, "objectForKey:", @"d"));
          }
          else
          {
            [(__CFString *)a4 objectForKey:@"d"];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              uint64_t v24 = [(__CFString *)a4 objectForKey:@"d"];
            }
            else {
              uint64_t v24 = 0;
            }
          }
          [v10 handler:a2 sessionCancelled:v12 topic:a3 peerID:v14 reason:v20 clientInfo:v22 serviceData:v24];
        }
        ++v9;
      }
      while (v8 != v9);
      v7 = obj;
      uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v8);
  }
}

void sub_2378FA7E8()
{
}

void sub_2378FA840()
{
}

void sub_2378FA8F0(uint64_t a1, void *a2, uint64_t a3, __CFString *a4)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      long long v35 = a4;
      _os_log_impl(&dword_2378DA000, v5, OS_LOG_TYPE_DEBUG, "_handleSendPush: %@", buf, 0xCu);
    }
  }
  v6 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    long long v35 = a4;
    _os_log_impl(&dword_2378DA000, v6, OS_LOG_TYPE_DEFAULT, "userInfo: %@", buf, 0xCu);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (MarcoShouldLog())
    {
      uint64_t v25 = a4;
      MarcoLog();
    }
    if (IMShouldLog())
    {
      uint64_t v25 = a4;
      IMLogString();
    }
  }
  v7 = objc_msgSend(a2, "copyHandlersForEnumerating", v25);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v8)
  {
    uint64_t v29 = *(void *)v31;
    obuint64_t j = v7;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v31 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v30 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector())
        {
          [(__CFString *)a4 objectForKey:@"s"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v11 = objc_msgSend(MEMORY[0x263EFF8F8], "_IDSDataFromBase64String:", -[__CFString objectForKey:](a4, "objectForKey:", @"s"));
            goto LABEL_21;
          }
          [(__CFString *)a4 objectForKey:@"s"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v11 = [(__CFString *)a4 objectForKey:@"s"];
LABEL_21:
            uint64_t v12 = v11;
          }
          else
          {
            uint64_t v12 = 0;
          }
          uint64_t v13 = objc_opt_class();
          uint64_t v14 = [(__CFString *)a4 objectForKey:@"I"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v14)
          {
            uint64_t v15 = [MEMORY[0x263F4A860] registration];
            if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              long long v35 = @"I";
              __int16 v36 = 2112;
              uint64_t v37 = v13;
              _os_log_fault_impl(&dword_2378DA000, v15, OS_LOG_TYPE_FAULT, "_handleInitatePush: %@", buf, 0x16u);
            }
            uint64_t v14 = 0;
          }
          uint64_t v16 = NSNumber;
          uint64_t v17 = objc_opt_class();
          uint64_t v18 = (void *)[(__CFString *)a4 objectForKey:@"y"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v18)
          {
            uint64_t v19 = [MEMORY[0x263F4A860] registration];
            if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              long long v35 = @"y";
              __int16 v36 = 2112;
              uint64_t v37 = v17;
              _os_log_fault_impl(&dword_2378DA000, v19, OS_LOG_TYPE_FAULT, "_handleInitatePush: %@", buf, 0x16u);
            }
            uint64_t v18 = 0;
          }
          uint64_t v20 = objc_msgSend(v16, "numberWithInt:", objc_msgSend(v18, "intValue"));
          uint64_t v21 = objc_opt_class();
          uint64_t v22 = [(__CFString *)a4 objectForKey:@"x"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v22)
          {
            uint64_t v23 = [MEMORY[0x263F4A860] registration];
            if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              long long v35 = @"x";
              __int16 v36 = 2112;
              uint64_t v37 = v21;
              _os_log_fault_impl(&dword_2378DA000, v23, OS_LOG_TYPE_FAULT, "_handleInitatePush: %@", buf, 0x16u);
            }
            uint64_t v22 = 0;
          }
          [(__CFString *)a4 objectForKey:@"d"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v24 = objc_msgSend(MEMORY[0x263EFF8F8], "_IDSDataFromBase64String:", -[__CFString objectForKey:](a4, "objectForKey:", @"d"));
          }
          else
          {
            [(__CFString *)a4 objectForKey:@"d"];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              uint64_t v24 = [(__CFString *)a4 objectForKey:@"d"];
            }
            else {
              uint64_t v24 = 0;
            }
          }
          [v10 handler:a2 incomingMessage:v12 topic:a3 peerID:v14 reason:v20 clientInfo:v22 serviceData:v24];
        }
        ++v9;
      }
      while (v8 != v9);
      v7 = obj;
      uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v8);
  }
}

void sub_2378FAF70()
{
}

void sub_2378FAFC8()
{
}

void sub_2378FB078(uint64_t a1, void *a2, uint64_t a3, __CFString *a4)
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v57 = a4;
      _os_log_impl(&dword_2378DA000, v5, OS_LOG_TYPE_DEBUG, "_handleRelayInitatePush: %@", buf, 0xCu);
    }
  }
  v6 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v57 = a4;
    _os_log_impl(&dword_2378DA000, v6, OS_LOG_TYPE_DEFAULT, "userInfo: %@", buf, 0xCu);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (MarcoShouldLog())
    {
      uint64_t v38 = a4;
      MarcoLog();
    }
    if (IMShouldLog())
    {
      uint64_t v38 = a4;
      IMLogString();
    }
  }
  v7 = objc_msgSend(a2, "copyHandlersForEnumerating", v38);
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v52 objects:v60 count:16];
  if (v8)
  {
    uint64_t v49 = *(void *)v53;
    *(void *)&long long v9 = 138412802;
    long long v39 = v9;
    obuint64_t j = v7;
    do
    {
      uint64_t v10 = 0;
      uint64_t v50 = v8;
      do
      {
        if (*(void *)v53 != v49) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v52 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector())
        {
          [(__CFString *)a4 objectForKey:@"s"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v48 = objc_msgSend(MEMORY[0x263EFF8F8], "_IDSDataFromBase64String:", -[__CFString objectForKey:](a4, "objectForKey:", @"s"));
          }
          else
          {
            [(__CFString *)a4 objectForKey:@"s"];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              uint64_t v48 = [(__CFString *)a4 objectForKey:@"s"];
            }
            else {
              uint64_t v48 = 0;
            }
          }
          uint64_t v12 = objc_opt_class();
          uint64_t v51 = [(__CFString *)a4 objectForKey:@"I"];
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (v51)
            {
              uint64_t v13 = [MEMORY[0x263F4A860] registration];
              if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v57 = @"I";
                __int16 v58 = 2112;
                uint64_t v59 = v12;
                _os_log_fault_impl(&dword_2378DA000, v13, OS_LOG_TYPE_FAULT, "_handleInitatePush: %@", buf, 0x16u);
              }
            }
            uint64_t v51 = 0;
          }
          [(__CFString *)a4 objectForKey:@"P"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v47 = objc_msgSend(MEMORY[0x263EFF8F8], "_IDSDataFromBase64String:", -[__CFString objectForKey:](a4, "objectForKey:", @"P"));
          }
          else
          {
            [(__CFString *)a4 objectForKey:@"P"];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              uint64_t v47 = [(__CFString *)a4 objectForKey:@"P"];
            }
            else {
              uint64_t v47 = 0;
            }
          }
          uint64_t v14 = NSNumber;
          uint64_t v15 = objc_opt_class();
          uint64_t v16 = (void *)[(__CFString *)a4 objectForKey:@"t"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v16)
          {
            uint64_t v17 = [MEMORY[0x263F4A860] registration];
            if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v57 = @"t";
              __int16 v58 = 2112;
              uint64_t v59 = v15;
              _os_log_fault_impl(&dword_2378DA000, v17, OS_LOG_TYPE_FAULT, "_handleInitatePush: %@", buf, 0x16u);
            }
            uint64_t v16 = 0;
          }
          uint64_t v46 = objc_msgSend(v14, "numberWithInt:", objc_msgSend(v16, "intValue"));
          [(__CFString *)a4 objectForKey:@"k"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v45 = objc_msgSend(MEMORY[0x263EFF8F8], "_IDSDataFromBase64String:", -[__CFString objectForKey:](a4, "objectForKey:", @"k"));
          }
          else
          {
            [(__CFString *)a4 objectForKey:@"k"];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              uint64_t v45 = [(__CFString *)a4 objectForKey:@"k"];
            }
            else {
              uint64_t v45 = 0;
            }
          }
          [(__CFString *)a4 objectForKey:@"q"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v44 = objc_msgSend(MEMORY[0x263EFF8F8], "_IDSDataFromBase64String:", -[__CFString objectForKey:](a4, "objectForKey:", @"q"));
          }
          else
          {
            [(__CFString *)a4 objectForKey:@"q"];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              uint64_t v44 = [(__CFString *)a4 objectForKey:@"q"];
            }
            else {
              uint64_t v44 = 0;
            }
          }
          [(__CFString *)a4 objectForKey:@"r"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v43 = objc_msgSend(MEMORY[0x263EFF8F8], "_IDSDataFromBase64String:", -[__CFString objectForKey:](a4, "objectForKey:", @"r"));
          }
          else
          {
            [(__CFString *)a4 objectForKey:@"r"];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              uint64_t v43 = [(__CFString *)a4 objectForKey:@"r"];
            }
            else {
              uint64_t v43 = 0;
            }
          }
          [(__CFString *)a4 objectForKey:@"K"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v18 = objc_msgSend(MEMORY[0x263EFF8F8], "_IDSDataFromBase64String:", -[__CFString objectForKey:](a4, "objectForKey:", @"K"));
            goto LABEL_56;
          }
          [(__CFString *)a4 objectForKey:@"K"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v18 = [(__CFString *)a4 objectForKey:@"K"];
LABEL_56:
            uint64_t v19 = v18;
          }
          else
          {
            uint64_t v19 = 0;
          }
          [(__CFString *)a4 objectForKey:@"h"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v20 = objc_msgSend(MEMORY[0x263EFF8F8], "_IDSDataFromBase64String:", -[__CFString objectForKey:](a4, "objectForKey:", @"h"));
            goto LABEL_62;
          }
          [(__CFString *)a4 objectForKey:@"h"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v20 = [(__CFString *)a4 objectForKey:@"h"];
LABEL_62:
            uint64_t v21 = v20;
          }
          else
          {
            uint64_t v21 = 0;
          }
          uint64_t v22 = NSNumber;
          uint64_t v23 = objc_opt_class();
          uint64_t v24 = (void *)[(__CFString *)a4 objectForKey:@"o"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v24)
          {
            uint64_t v25 = [MEMORY[0x263F4A860] registration];
            if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v57 = @"o";
              __int16 v58 = 2112;
              uint64_t v59 = v23;
              _os_log_fault_impl(&dword_2378DA000, v25, OS_LOG_TYPE_FAULT, "_handleInitatePush: %@", buf, 0x16u);
            }
            uint64_t v24 = 0;
          }
          uint64_t v26 = objc_msgSend(v22, "numberWithInt:", objc_msgSend(v24, "intValue"));
          [(__CFString *)a4 objectForKey:@"H"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v27 = objc_msgSend(MEMORY[0x263EFF8F8], "_IDSDataFromBase64String:", -[__CFString objectForKey:](a4, "objectForKey:", @"H"));
            goto LABEL_73;
          }
          [(__CFString *)a4 objectForKey:@"H"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v27 = [(__CFString *)a4 objectForKey:@"H"];
LABEL_73:
            uint64_t v28 = v27;
          }
          else
          {
            uint64_t v28 = 0;
          }
          uint64_t v29 = NSNumber;
          uint64_t v30 = objc_opt_class();
          long long v31 = (void *)[(__CFString *)a4 objectForKey:@"O"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v31)
          {
            long long v32 = [MEMORY[0x263F4A860] registration];
            if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v57 = @"O";
              __int16 v58 = 2112;
              uint64_t v59 = v30;
              _os_log_fault_impl(&dword_2378DA000, v32, OS_LOG_TYPE_FAULT, "_handleInitatePush: %@", buf, 0x16u);
            }
            long long v31 = 0;
          }
          uint64_t v33 = objc_msgSend(v29, "numberWithInt:", objc_msgSend(v31, "intValue"));
          uint64_t v34 = objc_opt_class();
          uint64_t v35 = [(__CFString *)a4 objectForKey:@"x"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v35)
          {
            __int16 v36 = [MEMORY[0x263F4A860] registration];
            if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v57 = @"x";
              __int16 v58 = 2112;
              uint64_t v59 = v34;
              _os_log_fault_impl(&dword_2378DA000, v36, OS_LOG_TYPE_FAULT, "_handleInitatePush: %@", buf, 0x16u);
            }
            uint64_t v35 = 0;
          }
          [(__CFString *)a4 objectForKey:@"d"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v37 = objc_msgSend(MEMORY[0x263EFF8F8], "_IDSDataFromBase64String:", -[__CFString objectForKey:](a4, "objectForKey:", @"d"));
          }
          else
          {
            [(__CFString *)a4 objectForKey:@"d"];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              uint64_t v37 = [(__CFString *)a4 objectForKey:@"d"];
            }
            else {
              uint64_t v37 = 0;
            }
          }
          objc_msgSend(v11, "handler:relayInitiated:topic:peerID:peerPushToken:relayType:relayConnectionID:relayTransactionIDAlloc:relayTokenAllocReq:relayCandidateID:myRelayIP:myRelayPort:peerRelayIP:peerRelayPort:clientInfo:serviceData:", a2, v48, a3, v51, v47, v46, v45, v44, v43, v19, v21, v26, v28, v33, v35, v37,
            v39);
        }
        ++v10;
      }
      while (v50 != v10);
      v7 = obj;
      uint64_t v8 = [obj countByEnumeratingWithState:&v52 objects:v60 count:16];
    }
    while (v8);
  }
}

void sub_2378FBD14()
{
}

void sub_2378FBD6C()
{
}

void sub_2378FBE1C(uint64_t a1, void *a2, uint64_t a3, __CFString *a4)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v50 = a4;
      _os_log_impl(&dword_2378DA000, v5, OS_LOG_TYPE_DEBUG, "_handleRelayUpdatePush: %@", buf, 0xCu);
    }
  }
  v6 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v50 = a4;
    _os_log_impl(&dword_2378DA000, v6, OS_LOG_TYPE_DEFAULT, "userInfo: %@", buf, 0xCu);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (MarcoShouldLog())
    {
      uint64_t v33 = a4;
      MarcoLog();
    }
    if (IMShouldLog())
    {
      uint64_t v33 = a4;
      IMLogString();
    }
  }
  v7 = objc_msgSend(a2, "copyHandlersForEnumerating", v33);
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v8)
  {
    uint64_t v43 = *(void *)v46;
    obuint64_t j = v7;
    do
    {
      uint64_t v9 = 0;
      uint64_t v44 = v8;
      do
      {
        if (*(void *)v46 != v43) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v45 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector())
        {
          [(__CFString *)a4 objectForKey:@"s"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v42 = objc_msgSend(MEMORY[0x263EFF8F8], "_IDSDataFromBase64String:", -[__CFString objectForKey:](a4, "objectForKey:", @"s"));
          }
          else
          {
            [(__CFString *)a4 objectForKey:@"s"];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              uint64_t v42 = [(__CFString *)a4 objectForKey:@"s"];
            }
            else {
              uint64_t v42 = 0;
            }
          }
          uint64_t v11 = objc_opt_class();
          uint64_t v12 = [(__CFString *)a4 objectForKey:@"I"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v12)
          {
            uint64_t v13 = [MEMORY[0x263F4A860] registration];
            if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v50 = @"I";
              __int16 v51 = 2112;
              uint64_t v52 = v11;
              _os_log_fault_impl(&dword_2378DA000, v13, OS_LOG_TYPE_FAULT, "_handleInitatePush: %@", buf, 0x16u);
            }
            uint64_t v12 = 0;
          }
          [(__CFString *)a4 objectForKey:@"P"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v41 = objc_msgSend(MEMORY[0x263EFF8F8], "_IDSDataFromBase64String:", -[__CFString objectForKey:](a4, "objectForKey:", @"P"));
          }
          else
          {
            [(__CFString *)a4 objectForKey:@"P"];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              uint64_t v41 = [(__CFString *)a4 objectForKey:@"P"];
            }
            else {
              uint64_t v41 = 0;
            }
          }
          uint64_t v14 = NSNumber;
          uint64_t v15 = objc_opt_class();
          uint64_t v16 = (void *)[(__CFString *)a4 objectForKey:@"t"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v16)
          {
            uint64_t v17 = [MEMORY[0x263F4A860] registration];
            if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v50 = @"t";
              __int16 v51 = 2112;
              uint64_t v52 = v15;
              _os_log_fault_impl(&dword_2378DA000, v17, OS_LOG_TYPE_FAULT, "_handleInitatePush: %@", buf, 0x16u);
            }
            uint64_t v16 = 0;
          }
          uint64_t v40 = objc_msgSend(v14, "numberWithInt:", objc_msgSend(v16, "intValue"));
          [(__CFString *)a4 objectForKey:@"k"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v39 = objc_msgSend(MEMORY[0x263EFF8F8], "_IDSDataFromBase64String:", -[__CFString objectForKey:](a4, "objectForKey:", @"k"));
          }
          else
          {
            [(__CFString *)a4 objectForKey:@"k"];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              uint64_t v39 = [(__CFString *)a4 objectForKey:@"k"];
            }
            else {
              uint64_t v39 = 0;
            }
          }
          [(__CFString *)a4 objectForKey:@"q"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v38 = objc_msgSend(MEMORY[0x263EFF8F8], "_IDSDataFromBase64String:", -[__CFString objectForKey:](a4, "objectForKey:", @"q"));
          }
          else
          {
            [(__CFString *)a4 objectForKey:@"q"];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              uint64_t v38 = [(__CFString *)a4 objectForKey:@"q"];
            }
            else {
              uint64_t v38 = 0;
            }
          }
          [(__CFString *)a4 objectForKey:@"r"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v37 = objc_msgSend(MEMORY[0x263EFF8F8], "_IDSDataFromBase64String:", -[__CFString objectForKey:](a4, "objectForKey:", @"r"));
          }
          else
          {
            [(__CFString *)a4 objectForKey:@"r"];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              uint64_t v37 = [(__CFString *)a4 objectForKey:@"r"];
            }
            else {
              uint64_t v37 = 0;
            }
          }
          [(__CFString *)a4 objectForKey:@"K"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v18 = objc_msgSend(MEMORY[0x263EFF8F8], "_IDSDataFromBase64String:", -[__CFString objectForKey:](a4, "objectForKey:", @"K"));
            goto LABEL_56;
          }
          [(__CFString *)a4 objectForKey:@"K"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v18 = [(__CFString *)a4 objectForKey:@"K"];
LABEL_56:
            uint64_t v19 = v18;
          }
          else
          {
            uint64_t v19 = 0;
          }
          [(__CFString *)a4 objectForKey:@"L"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v20 = objc_msgSend(MEMORY[0x263EFF8F8], "_IDSDataFromBase64String:", -[__CFString objectForKey:](a4, "objectForKey:", @"L"));
            goto LABEL_62;
          }
          [(__CFString *)a4 objectForKey:@"L"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v20 = [(__CFString *)a4 objectForKey:@"L"];
LABEL_62:
            uint64_t v21 = v20;
          }
          else
          {
            uint64_t v21 = 0;
          }
          [(__CFString *)a4 objectForKey:@"U"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v22 = objc_msgSend(MEMORY[0x263EFF8F8], "_IDSDataFromBase64String:", -[__CFString objectForKey:](a4, "objectForKey:", @"U"));
            goto LABEL_68;
          }
          [(__CFString *)a4 objectForKey:@"U"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v22 = [(__CFString *)a4 objectForKey:@"U"];
LABEL_68:
            uint64_t v23 = v22;
          }
          else
          {
            uint64_t v23 = 0;
          }
          uint64_t v24 = NSNumber;
          uint64_t v25 = objc_opt_class();
          uint64_t v26 = (void *)[(__CFString *)a4 objectForKey:@"V"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v26)
          {
            uint64_t v27 = [MEMORY[0x263F4A860] registration];
            if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v50 = @"V";
              __int16 v51 = 2112;
              uint64_t v52 = v25;
              _os_log_fault_impl(&dword_2378DA000, v27, OS_LOG_TYPE_FAULT, "_handleInitatePush: %@", buf, 0x16u);
            }
            uint64_t v26 = 0;
          }
          uint64_t v28 = objc_msgSend(v24, "numberWithInt:", objc_msgSend(v26, "intValue"));
          uint64_t v29 = objc_opt_class();
          uint64_t v30 = [(__CFString *)a4 objectForKey:@"x"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v30)
          {
            long long v31 = [MEMORY[0x263F4A860] registration];
            if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v50 = @"x";
              __int16 v51 = 2112;
              uint64_t v52 = v29;
              _os_log_fault_impl(&dword_2378DA000, v31, OS_LOG_TYPE_FAULT, "_handleInitatePush: %@", buf, 0x16u);
            }
            uint64_t v30 = 0;
          }
          [(__CFString *)a4 objectForKey:@"d"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v32 = objc_msgSend(MEMORY[0x263EFF8F8], "_IDSDataFromBase64String:", -[__CFString objectForKey:](a4, "objectForKey:", @"d"));
          }
          else
          {
            [(__CFString *)a4 objectForKey:@"d"];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              uint64_t v32 = [(__CFString *)a4 objectForKey:@"d"];
            }
            else {
              uint64_t v32 = 0;
            }
          }
          [v10 handler:a2 relayUpdated:v42 topic:a3 peerID:v12 peerPushToken:v41 relayType:v40 relayConnectionID:v39 relayTransactionIDChannelBind:v38 relayTokenChannelBind:v37 relayCandidateID:v19 relayBlob:v21 peerRelayNATIP:v23 peerRelayNATPort:v28 clientInfo:v30 serviceData:v32];
        }
        ++v9;
      }
      while (v44 != v9);
      v7 = obj;
      uint64_t v8 = [obj countByEnumeratingWithState:&v45 objects:v53 count:16];
    }
    while (v8);
  }
}

void sub_2378FC9F8()
{
}

void sub_2378FCA50()
{
}

void sub_2378FCB00(uint64_t a1, void *a2, uint64_t a3, __CFString *a4)
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v58 = a4;
      _os_log_impl(&dword_2378DA000, v5, OS_LOG_TYPE_DEBUG, "_handleRelayCancelPush: %@", buf, 0xCu);
    }
  }
  v6 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v58 = a4;
    _os_log_impl(&dword_2378DA000, v6, OS_LOG_TYPE_DEFAULT, "userInfo: %@", buf, 0xCu);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (MarcoShouldLog())
    {
      uint64_t v39 = a4;
      MarcoLog();
    }
    if (IMShouldLog())
    {
      uint64_t v39 = a4;
      IMLogString();
    }
  }
  v7 = objc_msgSend(a2, "copyHandlersForEnumerating", v39);
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v53 objects:v61 count:16];
  if (v8)
  {
    uint64_t v50 = *(void *)v54;
    *(void *)&long long v9 = 138412802;
    long long v40 = v9;
    obuint64_t j = v7;
    do
    {
      uint64_t v10 = 0;
      uint64_t v51 = v8;
      do
      {
        if (*(void *)v54 != v50) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v53 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector())
        {
          [(__CFString *)a4 objectForKey:@"s"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v49 = objc_msgSend(MEMORY[0x263EFF8F8], "_IDSDataFromBase64String:", -[__CFString objectForKey:](a4, "objectForKey:", @"s"));
          }
          else
          {
            [(__CFString *)a4 objectForKey:@"s"];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              uint64_t v49 = [(__CFString *)a4 objectForKey:@"s"];
            }
            else {
              uint64_t v49 = 0;
            }
          }
          uint64_t v12 = objc_opt_class();
          uint64_t v52 = [(__CFString *)a4 objectForKey:@"I"];
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (v52)
            {
              uint64_t v13 = [MEMORY[0x263F4A860] registration];
              if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412546;
                __int16 v58 = @"I";
                __int16 v59 = 2112;
                uint64_t v60 = v12;
                _os_log_fault_impl(&dword_2378DA000, v13, OS_LOG_TYPE_FAULT, "_handleInitatePush: %@", buf, 0x16u);
              }
            }
            uint64_t v52 = 0;
          }
          uint64_t v14 = NSNumber;
          uint64_t v15 = objc_opt_class();
          uint64_t v16 = (void *)[(__CFString *)a4 objectForKey:@"t"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v16)
          {
            uint64_t v17 = [MEMORY[0x263F4A860] registration];
            if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              __int16 v58 = @"t";
              __int16 v59 = 2112;
              uint64_t v60 = v15;
              _os_log_fault_impl(&dword_2378DA000, v17, OS_LOG_TYPE_FAULT, "_handleInitatePush: %@", buf, 0x16u);
            }
            uint64_t v16 = 0;
          }
          uint64_t v48 = objc_msgSend(v14, "numberWithInt:", objc_msgSend(v16, "intValue"));
          [(__CFString *)a4 objectForKey:@"r"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v47 = objc_msgSend(MEMORY[0x263EFF8F8], "_IDSDataFromBase64String:", -[__CFString objectForKey:](a4, "objectForKey:", @"r"));
          }
          else
          {
            [(__CFString *)a4 objectForKey:@"r"];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              uint64_t v47 = [(__CFString *)a4 objectForKey:@"r"];
            }
            else {
              uint64_t v47 = 0;
            }
          }
          [(__CFString *)a4 objectForKey:@"k"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v46 = objc_msgSend(MEMORY[0x263EFF8F8], "_IDSDataFromBase64String:", -[__CFString objectForKey:](a4, "objectForKey:", @"k"));
          }
          else
          {
            [(__CFString *)a4 objectForKey:@"k"];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              uint64_t v46 = [(__CFString *)a4 objectForKey:@"k"];
            }
            else {
              uint64_t v46 = 0;
            }
          }
          [(__CFString *)a4 objectForKey:@"q"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v45 = objc_msgSend(MEMORY[0x263EFF8F8], "_IDSDataFromBase64String:", -[__CFString objectForKey:](a4, "objectForKey:", @"q"));
          }
          else
          {
            [(__CFString *)a4 objectForKey:@"q"];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              uint64_t v45 = [(__CFString *)a4 objectForKey:@"q"];
            }
            else {
              uint64_t v45 = 0;
            }
          }
          [(__CFString *)a4 objectForKey:@"K"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v44 = objc_msgSend(MEMORY[0x263EFF8F8], "_IDSDataFromBase64String:", -[__CFString objectForKey:](a4, "objectForKey:", @"K"));
          }
          else
          {
            [(__CFString *)a4 objectForKey:@"K"];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              uint64_t v44 = [(__CFString *)a4 objectForKey:@"K"];
            }
            else {
              uint64_t v44 = 0;
            }
          }
          [(__CFString *)a4 objectForKey:@"h"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v18 = objc_msgSend(MEMORY[0x263EFF8F8], "_IDSDataFromBase64String:", -[__CFString objectForKey:](a4, "objectForKey:", @"h"));
            goto LABEL_56;
          }
          [(__CFString *)a4 objectForKey:@"h"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v18 = [(__CFString *)a4 objectForKey:@"h"];
LABEL_56:
            uint64_t v19 = v18;
          }
          else
          {
            uint64_t v19 = 0;
          }
          uint64_t v20 = NSNumber;
          uint64_t v21 = objc_opt_class();
          uint64_t v22 = (void *)[(__CFString *)a4 objectForKey:@"o"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v22)
          {
            uint64_t v23 = [MEMORY[0x263F4A860] registration];
            if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              __int16 v58 = @"o";
              __int16 v59 = 2112;
              uint64_t v60 = v21;
              _os_log_fault_impl(&dword_2378DA000, v23, OS_LOG_TYPE_FAULT, "_handleInitatePush: %@", buf, 0x16u);
            }
            uint64_t v22 = 0;
          }
          uint64_t v24 = objc_msgSend(v20, "numberWithInt:", objc_msgSend(v22, "intValue"));
          [(__CFString *)a4 objectForKey:@"H"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v25 = objc_msgSend(MEMORY[0x263EFF8F8], "_IDSDataFromBase64String:", -[__CFString objectForKey:](a4, "objectForKey:", @"H"));
            goto LABEL_67;
          }
          [(__CFString *)a4 objectForKey:@"H"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v25 = [(__CFString *)a4 objectForKey:@"H"];
LABEL_67:
            uint64_t v26 = v25;
          }
          else
          {
            uint64_t v26 = 0;
          }
          uint64_t v27 = NSNumber;
          uint64_t v28 = objc_opt_class();
          uint64_t v29 = (void *)[(__CFString *)a4 objectForKey:@"O"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v29)
          {
            uint64_t v30 = [MEMORY[0x263F4A860] registration];
            if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              __int16 v58 = @"O";
              __int16 v59 = 2112;
              uint64_t v60 = v28;
              _os_log_fault_impl(&dword_2378DA000, v30, OS_LOG_TYPE_FAULT, "_handleInitatePush: %@", buf, 0x16u);
            }
            uint64_t v29 = 0;
          }
          uint64_t v31 = objc_msgSend(v27, "numberWithInt:", objc_msgSend(v29, "intValue"));
          uint64_t v32 = objc_opt_class();
          uint64_t v33 = [(__CFString *)a4 objectForKey:@"y"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v33)
          {
            uint64_t v34 = [MEMORY[0x263F4A860] registration];
            if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              __int16 v58 = @"y";
              __int16 v59 = 2112;
              uint64_t v60 = v32;
              _os_log_fault_impl(&dword_2378DA000, v34, OS_LOG_TYPE_FAULT, "_handleInitatePush: %@", buf, 0x16u);
            }
            uint64_t v33 = 0;
          }
          uint64_t v35 = objc_opt_class();
          uint64_t v36 = [(__CFString *)a4 objectForKey:@"x"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v36)
          {
            uint64_t v37 = [MEMORY[0x263F4A860] registration];
            if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              __int16 v58 = @"x";
              __int16 v59 = 2112;
              uint64_t v60 = v35;
              _os_log_fault_impl(&dword_2378DA000, v37, OS_LOG_TYPE_FAULT, "_handleInitatePush: %@", buf, 0x16u);
            }
            uint64_t v36 = 0;
          }
          [(__CFString *)a4 objectForKey:@"d"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v38 = objc_msgSend(MEMORY[0x263EFF8F8], "_IDSDataFromBase64String:", -[__CFString objectForKey:](a4, "objectForKey:", @"d"));
          }
          else
          {
            [(__CFString *)a4 objectForKey:@"d"];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              uint64_t v38 = [(__CFString *)a4 objectForKey:@"d"];
            }
            else {
              uint64_t v38 = 0;
            }
          }
          objc_msgSend(v11, "handler:relayCancelled:topic:peerID:relayType:relayTokenAllocReq:relayConnectionID:relayTransactionIDAlloc:relayCandidateID:myRelayIP:myRelayPort:peerRelayIP:peerRelayPort:reason:clientInfo:serviceData:", a2, v49, a3, v52, v48, v47, v46, v45, v44, v19, v24, v26, v31, v33, v36, v38,
            v40);
        }
        ++v10;
      }
      while (v51 != v10);
      v7 = obj;
      uint64_t v8 = [obj countByEnumeratingWithState:&v53 objects:v61 count:16];
    }
    while (v8);
  }
}

void sub_2378FD794()
{
}

void sub_2378FD7EC()
{
}

void sub_2378FDE7C()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v0 = 138412546;
  id v1 = @"session-token";
  __int16 v2 = 2080;
  tm v3 = "dictionary";
  _os_log_error_impl(&dword_2378DA000, &_os_log_internal, OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", (uint8_t *)&v0, 0x16u);
}

void sub_2378FDF18()
{
  sub_2378F5150();
  sub_2378F5134(&dword_2378DA000, &_os_log_internal, v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, 2u);
}

void sub_2378FDFA0()
{
  sub_2378F5150();
  sub_2378F5134(&dword_2378DA000, &_os_log_internal, v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, 2u);
}

void sub_2378FE028()
{
  sub_2378F5150();
  sub_2378F5134(&dword_2378DA000, &_os_log_internal, v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, 2u);
}

void sub_2378FE0B0()
{
  sub_2378F5150();
  sub_2378F5134(&dword_2378DA000, &_os_log_internal, v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, 2u);
}

void sub_2378FE138()
{
  sub_2378F5150();
  sub_2378F5134(&dword_2378DA000, &_os_log_internal, v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, 2u);
}

void sub_2378FE1C0()
{
  sub_2378F5150();
  sub_2378F5134(&dword_2378DA000, &_os_log_internal, v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, 2u);
}

void sub_2378FE248()
{
  sub_2378F5150();
  sub_2378F5134(&dword_2378DA000, &_os_log_internal, v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, 2u);
}

void sub_2378FE2D0()
{
  sub_2378F5150();
  sub_2378F5134(&dword_2378DA000, &_os_log_internal, v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, 2u);
}

void sub_2378FE358()
{
  sub_2378F5150();
  sub_2378F5134(&dword_2378DA000, &_os_log_internal, v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, 2u);
}

void sub_2378FE3E0()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v0 = 138412546;
  uint64_t v1 = @"peers";
  __int16 v2 = 2080;
  uint64_t v3 = "dictionary";
  _os_log_error_impl(&dword_2378DA000, &_os_log_internal, OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", (uint8_t *)&v0, 0x16u);
}

void sub_2378FE47C()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v0 = 138412546;
  uint64_t v1 = @"reason";
  __int16 v2 = 2080;
  uint64_t v3 = "dictionary";
  _os_log_error_impl(&dword_2378DA000, &_os_log_internal, OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", (uint8_t *)&v0, 0x16u);
}

void sub_2378FE518()
{
  sub_2378F5150();
  sub_2378F5134(&dword_2378DA000, &_os_log_internal, v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, 2u);
}

void sub_2378FE5A0()
{
  sub_2378F5150();
  sub_2378F5134(&dword_2378DA000, &_os_log_internal, v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, 2u);
}

void sub_2378FE628()
{
  sub_2378F5150();
  sub_2378F5134(&dword_2378DA000, &_os_log_internal, v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, 2u);
}

void sub_2378FE6B0()
{
  sub_2378F5150();
  sub_2378F5134(&dword_2378DA000, &_os_log_internal, v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, 2u);
}

void sub_2378FE738()
{
  sub_2378F5150();
  sub_2378F5134(&dword_2378DA000, &_os_log_internal, v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, 2u);
}

void sub_2378FE7C0()
{
  sub_2378F5150();
  sub_2378F5134(&dword_2378DA000, &_os_log_internal, v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, 2u);
}

void sub_2378FE848()
{
  sub_2378F5150();
  sub_2378F5134(&dword_2378DA000, &_os_log_internal, v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, 2u);
}

void sub_2378FE8D0()
{
  sub_2378F5150();
  sub_2378F5134(&dword_2378DA000, &_os_log_internal, v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, 2u);
}

void sub_2378FE958()
{
  sub_2378F5150();
  sub_2378F5134(&dword_2378DA000, &_os_log_internal, v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, 2u);
}

void sub_2378FE9E0()
{
  sub_2378F5150();
  sub_2378F5134(&dword_2378DA000, &_os_log_internal, v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, 2u);
}

void sub_2378FEA68()
{
  sub_2378F5150();
  sub_2378F5134(&dword_2378DA000, &_os_log_internal, v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, 2u);
}

void sub_2378FEAF0()
{
  sub_2378F5150();
  sub_2378F5134(&dword_2378DA000, &_os_log_internal, v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, 2u);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t FTAWDLogCallAcceptReceived()
{
  return MEMORY[0x270F28150]();
}

uint64_t FTAWDLogCallAcceptSent()
{
  return MEMORY[0x270F28158]();
}

uint64_t FTAWDLogCallCancelSent()
{
  return MEMORY[0x270F28160]();
}

uint64_t FTAWDLogCallDeclineSent()
{
  return MEMORY[0x270F28170]();
}

uint64_t FTAWDLogCallInvitationReceived()
{
  return MEMORY[0x270F281A0]();
}

uint64_t FTAWDLogCallInvitationSent()
{
  return MEMORY[0x270F281A8]();
}

uint64_t FTAWDLogCallRelayInitiateReceived()
{
  return MEMORY[0x270F281B0]();
}

uint64_t FTAWDLogCallRelayInitiateSent()
{
  return MEMORY[0x270F281B8]();
}

uint64_t FTAWDLogCallRelayUpdateSent()
{
  return MEMORY[0x270F281C0]();
}

uint64_t FTAWDLogCallRelayUpdatedReceived()
{
  return MEMORY[0x270F281C8]();
}

uint64_t FTAWDSetSubmissionDate()
{
  return MEMORY[0x270F281D8]();
}

uint64_t IMDInconsistencyResolved()
{
  return MEMORY[0x270F3CCA0]();
}

uint64_t IMDNoticedInconsistency()
{
  return MEMORY[0x270F3CCA8]();
}

uint64_t IMGetCachedDomainIntForKey()
{
  return MEMORY[0x270F3CD20]();
}

uint64_t IMLogString()
{
  return MEMORY[0x270F3CDF0]();
}

uint64_t IMOSLoggingEnabled()
{
  return MEMORY[0x270F3CE08]();
}

uint64_t IMShouldLog()
{
  return MEMORY[0x270F3CE40]();
}

uint64_t IMSingleObjectArray()
{
  return MEMORY[0x270F3CE58]();
}

uint64_t MarcoBeginSession()
{
  return MEMORY[0x270F496A8]();
}

uint64_t MarcoEndSession()
{
  return MEMORY[0x270F496B0]();
}

uint64_t MarcoLog()
{
  return MEMORY[0x270F496B8]();
}

uint64_t MarcoNoteCheckpoint()
{
  return MEMORY[0x270F496D0]();
}

uint64_t MarcoSetInitiator()
{
  return MEMORY[0x270F496D8]();
}

uint64_t MarcoShouldLog()
{
  return MEMORY[0x270F496E0]();
}

uint64_t MarcoShouldLogCheckpoints()
{
  return MEMORY[0x270F496E8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t OSLogHandleForFaceTimeCategory()
{
  return MEMORY[0x270F3CEE8]();
}

uint64_t OSLogHandleForIDSCategory()
{
  return MEMORY[0x270F3CEF0]();
}

uint64_t OSLogHandleForIMFoundationCategory()
{
  return MEMORY[0x270F3CF00]();
}

uint64_t OSLogHandleForRegistrationCategory()
{
  return MEMORY[0x270F3CF08]();
}

uint64_t PLLogRegisteredEvent()
{
  return MEMORY[0x270F55148]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _IDSAppleRegistrationCopyKeyPair()
{
  return MEMORY[0x270F3CA18]();
}

uint64_t _IDSCopyCallerID()
{
  return MEMORY[0x270F3CA20]();
}

uint64_t _IDSInvitationProtocolVersionNumber()
{
  return MEMORY[0x270F3CA28]();
}

uint64_t _IMAlwaysLog()
{
  return MEMORY[0x270F3CF18]();
}

uint64_t _IMLoggingLog()
{
  return MEMORY[0x270F3CF68]();
}

uint64_t _IMWarn()
{
  return MEMORY[0x270F3CFA8]();
}

uint64_t _IMWillLog()
{
  return MEMORY[0x270F3CFB8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x270ED9D98](a1, a2);
}

uint64_t im_dispatch_after()
{
  return MEMORY[0x270F3CFC8]();
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x270EDA0A0](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

uint64_t os_log_shim_legacy_logging_enabled()
{
  return MEMORY[0x270EDA9C0]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}