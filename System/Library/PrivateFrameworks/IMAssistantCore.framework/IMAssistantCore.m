id sub_22C1AEF14(void *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t vars8;

  v2 = NSString;
  v3 = [a1 identifier];
  v4 = [a1 conversationIdentifier];
  v5 = [a1 groupName];
  v6 = [a1 sender];
  v7 = NSNumber;
  v8 = [a1 recipients];
  v9 = objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
  v10 = [a1 recipients];
  v11 = [v2 stringWithFormat:@"INMessage %@\nConversation identifier: %@\nGroup name: %@\nSender: %@\nRecipients (%@): %@", v3, v4, v5, v6, v9, v10];

  return v11;
}

uint64_t sub_22C1AFD8C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_22C1AFD9C(uint64_t a1)
{
}

void sub_22C1AFDA4(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v14 = 0;
  v2 = (id *)(a1 + 32);
  v3 = [*(id *)(a1 + 32) messageHandlerDataSource];
  v4 = [v3 locationManagerDataSource];

  if (([*v2 canSendLocationMessageWithLocationManager:v4 withError:&v14] & 1) == 0)
  {
    id v5 = objc_alloc(MEMORY[0x263F0FEB0]);
    uint64_t v6 = [v5 initWithCode:v14 userActivity:0];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  if (IMOSLoggingEnabled())
  {
    v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = v10;
      _os_log_impl(&dword_22C1AD000, v9, OS_LOG_TYPE_INFO, "Completing confirmSendMessage with %@", buf, 0xCu);
    }
  }
  v11 = _IMAssistantCoreSendMessageSignpostLogHandle();
  v12 = v11;
  os_signpost_id_t v13 = *(void *)(a1 + 56);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v12, OS_SIGNPOST_INTERVAL_END, v13, "confirmSendMessageIntent", (const char *)&unk_22C1E071B, buf, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_22C1B0154(uint64_t a1)
{
  uint64_t v200 = *MEMORY[0x263EF8340];
  v1 = (id *)(a1 + 32);
  v161 = [*(id *)(a1 + 32) content];
  v2 = [*v1 speakableGroupName];
  v155 = [v2 spokenPhrase];

  v158 = [*v1 recipients];
  v165 = [*v1 _metadata];
  if ([v165 hasOriginatingDeviceIdsIdentifier])
  {
    id v159 = [v165 originatingDeviceIdsIdentifier];
  }
  else
  {
    id v159 = 0;
  }
  v160 = +[IMAssistantINMessageConverter expressiveSendIdFromMessageEffectType:](IMAssistantINMessageConverter, "expressiveSendIdFromMessageEffectType:", [*(id *)(a1 + 32) effect]);
  uint64_t v154 = [*(id *)(a1 + 32) _executionContext];
  v185[0] = MEMORY[0x263EF8330];
  v185[1] = 3221225472;
  v185[2] = sub_22C1B223C;
  v185[3] = &unk_264912418;
  v3 = *(void **)(a1 + 48);
  uint64_t v187 = *(void *)(a1 + 56);
  id v186 = v3;
  v162 = (void (**)(void, void))MEMORY[0x230F62A80](v185);
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v197 = v155;
      _os_log_impl(&dword_22C1AD000, v4, OS_LOG_TYPE_INFO, "Send Message Intent: GroupName: %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v197 = v158;
      _os_log_impl(&dword_22C1AD000, v5, OS_LOG_TYPE_INFO, "Send Message Intent: Recipients: %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = [*(id *)(a1 + 32) conversationIdentifier];
      *(_DWORD *)buf = 138412290;
      v197 = v7;
      _os_log_impl(&dword_22C1AD000, v6, OS_LOG_TYPE_INFO, "Send Message Intent: Conversation Identifier: %@", buf, 0xCu);
    }
  }
  id v8 = *(id *)(a1 + 32);
  long long v189 = 0u;
  long long v190 = 0u;
  long long v191 = 0u;
  long long v192 = 0u;
  v9 = [v8 attachments];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v189 objects:buf count:16];
  if (!v10)
  {

LABEL_36:
    unsigned int v153 = 0;
    goto LABEL_37;
  }
  char v11 = 0;
  uint64_t v12 = *(void *)v190;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v190 != v12) {
        objc_enumerationMutation(v9);
      }
      uint64_t v14 = *(void **)(*((void *)&v189 + 1) + 8 * i);
      if ([v14 currentLocation])
      {
        if (IMOSLoggingEnabled())
        {
          v15 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v195 = 138412290;
            *(void *)&v195[4] = v14;
            _os_log_impl(&dword_22C1AD000, v15, OS_LOG_TYPE_INFO, "Intent contains an current location attachment: %@", v195, 0xCu);
          }
        }
        char v11 = 1;
      }
    }
    uint64_t v10 = [v9 countByEnumeratingWithState:&v189 objects:buf count:16];
  }
  while (v10);

  if ((v11 & 1) == 0) {
    goto LABEL_36;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C1AD000, v16, OS_LOG_TYPE_INFO, "Will try to send a current location message.", buf, 2u);
    }
  }
  unsigned int v153 = 1;
LABEL_37:
  id v171 = *(id *)(a1 + 32);
  if ([v171 outgoingMessageType] == 2)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C1AD000, v17, OS_LOG_TYPE_INFO, "Intent contains an audio message request, looking for the attachment", buf, 2u);
      }
    }
    long long v191 = 0u;
    long long v192 = 0u;
    long long v189 = 0u;
    long long v190 = 0u;
    v18 = [v171 attachments];
    v19 = 0;
    uint64_t v20 = [v18 countByEnumeratingWithState:&v189 objects:buf count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v190;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v190 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = [*(id *)(*((void *)&v189 + 1) + 8 * j) audioMessageFile];
          v24 = [v23 fileURL];

          if (v24)
          {
            if (IMOSLoggingEnabled())
            {
              v25 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)v195 = 138412290;
                *(void *)&v195[4] = v24;
                _os_log_impl(&dword_22C1AD000, v25, OS_LOG_TYPE_INFO, "Intent contains a audioFileAttachment: %@", v195, 0xCu);
              }
            }
            id v26 = v24;

            v19 = v26;
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v189 objects:buf count:16];
      }
      while (v20);
    }
  }
  else
  {
    v19 = 0;
  }
  v166 = v19;

  if (v166 && IMOSLoggingEnabled())
  {
    v27 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v197 = v166;
      _os_log_impl(&dword_22C1AD000, v27, OS_LOG_TYPE_INFO, "Will try to send a Audio Message with attachment: %@", buf, 0xCu);
    }
  }
  id v163 = *(id *)(a1 + 32);
  if (IMOSLoggingEnabled())
  {
    v28 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C1AD000, v28, OS_LOG_TYPE_INFO, "Checking the intent for a shared link.", buf, 2u);
    }
  }
  long long v191 = 0u;
  long long v192 = 0u;
  long long v189 = 0u;
  long long v190 = 0u;
  v29 = [v163 attachments];
  uint64_t v30 = [(IMAssistantURLWithMetadata *)v29 countByEnumeratingWithState:&v189 objects:buf count:16];
  if (v30)
  {
    v172 = 0;
    v174 = 0;
    uint64_t v31 = *(void *)v190;
    v169 = (void *)*MEMORY[0x263F1DA48];
    do
    {
      for (uint64_t k = 0; k != v30; ++k)
      {
        if (*(void *)v190 != v31) {
          objc_enumerationMutation(v29);
        }
        v33 = *(void **)(*((void *)&v189 + 1) + 8 * k);
        if (objc_opt_respondsToSelector())
        {
          v34 = [v33 sharedLink];

          if (v34)
          {
            uint64_t v35 = [v33 sharedLink];

            v174 = (void *)v35;
          }
          else
          {
            v37 = [v33 file];
            v38 = [v37 typeIdentifier];
            v39 = [v169 identifier];
            int v40 = [v38 isEqualToString:v39];

            if (v40)
            {
              v41 = (void *)MEMORY[0x263F08928];
              uint64_t v42 = objc_opt_class();
              v43 = [v33 file];
              v44 = [v43 data];
              id v188 = 0;
              v45 = [v41 unarchivedObjectOfClass:v42 fromData:v44 error:&v188];
              id v46 = v188;

              if (!v45 || v46)
              {
                if (IMOSLoggingEnabled())
                {
                  v47 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)v195 = 138412290;
                    *(void *)&v195[4] = v46;
                    _os_log_impl(&dword_22C1AD000, v47, OS_LOG_TYPE_INFO, "There was an error unarchiving the attachment to LPLinkMetadata: %@", v195, 0xCu);
                  }
                }
                v172 = 0;
              }
              else
              {
                v172 = v45;
              }
            }
          }
        }
        else if (IMOSLoggingEnabled())
        {
          v36 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v195 = 0;
            _os_log_impl(&dword_22C1AD000, v36, OS_LOG_TYPE_INFO, "SDK doesn't support API.", v195, 2u);
          }
        }
      }
      uint64_t v30 = [(IMAssistantURLWithMetadata *)v29 countByEnumeratingWithState:&v189 objects:buf count:16];
    }
    while (v30);

    if (v174 && v172)
    {
      v48 = [v172 originalURL];
      char v49 = [v174 isEqual:v48];

      if ((v49 & 1) == 0)
      {
        if (IMOSLoggingEnabled())
        {
          v50 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v195 = 0;
            _os_log_impl(&dword_22C1AD000, v50, OS_LOG_TYPE_INFO, "We have a shared link and metadata, but there is a URL mismatch. Clearing out the metadata to avoid attaching the wrong metadata.", v195, 2u);
          }
        }
        v172 = 0;
      }
    }
    else if (!v174)
    {
      v170 = 0;
      v174 = 0;
      goto LABEL_102;
    }
    v29 = [[IMAssistantURLWithMetadata alloc] initWithURL:v174 metadata:v172];
    v170 = v29;
  }
  else
  {
    v170 = 0;
    v172 = 0;
    v174 = 0;
  }

LABEL_102:
  if (v170 && IMOSLoggingEnabled())
  {
    v51 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v197 = v170;
      _os_log_impl(&dword_22C1AD000, v51, OS_LOG_TYPE_INFO, "Will try to send a shared link for the URL at: %@", buf, 0xCu);
    }
  }
  id v52 = *(id *)(a1 + 32);
  id v53 = objc_alloc(MEMORY[0x263EFF980]);
  v54 = [v52 attachments];
  v55 = objc_msgSend(v53, "initWithCapacity:", objc_msgSend(v54, "count"));

  if (IMOSLoggingEnabled())
  {
    v56 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C1AD000, v56, OS_LOG_TYPE_INFO, "Checking the intent for a file attachment.", buf, 2u);
    }
  }
  long long v191 = 0u;
  long long v192 = 0u;
  long long v189 = 0u;
  long long v190 = 0u;
  v57 = [v52 attachments];
  uint64_t v58 = [v57 countByEnumeratingWithState:&v189 objects:buf count:16];
  if (v58)
  {
    uint64_t v59 = *(void *)v190;
    do
    {
      for (uint64_t m = 0; m != v58; ++m)
      {
        if (*(void *)v190 != v59) {
          objc_enumerationMutation(v57);
        }
        v61 = *(void **)(*((void *)&v189 + 1) + 8 * m);
        v62 = [v61 file];
        v63 = [v62 fileURL];

        if (v63)
        {
          v64 = [v61 file];
          v65 = [v64 fileURL];
          [v55 addObject:v65];
        }
      }
      uint64_t v58 = [v57 countByEnumeratingWithState:&v189 objects:buf count:16];
    }
    while (v58);
  }

  v173 = v55;
  if ([(IMAssistantURLWithMetadata *)v173 count] && IMOSLoggingEnabled())
  {
    v66 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v197 = v173;
      _os_log_impl(&dword_22C1AD000, v66, OS_LOG_TYPE_INFO, "Will try to send files at the following locations: %@", buf, 0xCu);
    }
  }
  id v175 = *(id *)(a1 + 32);
  if (IMOSLoggingEnabled())
  {
    v67 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C1AD000, v67, OS_LOG_TYPE_INFO, "Checking the intent for a PHAsset attachment.", buf, 2u);
    }
  }
  long long v191 = 0u;
  long long v192 = 0u;
  long long v189 = 0u;
  long long v190 = 0u;
  v68 = [v175 attachments];
  uint64_t v69 = [v68 countByEnumeratingWithState:&v189 objects:buf count:16];
  if (v69)
  {
    uint64_t v70 = *(void *)v190;
    while (2)
    {
      for (uint64_t n = 0; n != v69; ++n)
      {
        if (*(void *)v190 != v70) {
          objc_enumerationMutation(v68);
        }
        v72 = *(void **)(*((void *)&v189 + 1) + 8 * n);
        if (objc_opt_respondsToSelector())
        {
          v73 = [v72 phAssetId];

          if (v73)
          {
            id v74 = objc_alloc_init(MEMORY[0x263F14E18]);
            [v74 setIncludeGuestAssets:1];
            [v74 setIncludeHiddenAssets:1];
            v75 = (void *)MEMORY[0x263F14D18];
            v76 = [v72 phAssetId];
            *(void *)v195 = v76;
            v77 = [MEMORY[0x263EFF8C0] arrayWithObjects:v195 count:1];
            v78 = [v75 fetchAssetsWithLocalIdentifiers:v77 options:v74];
            v79 = [v78 firstObject];

            if (v79)
            {
              id v164 = v79;

              goto LABEL_142;
            }
          }
        }
      }
      uint64_t v69 = [v68 countByEnumeratingWithState:&v189 objects:buf count:16];
      if (v69) {
        continue;
      }
      break;
    }
  }
  id v164 = 0;
LABEL_142:

  v80 = [*(id *)(a1 + 40) messageHandlerDataSource];
  v81 = [v80 chatDataSource];

  v82 = *(void **)(a1 + 32);
  id v176 = v81;
  id v156 = v82;
  v83 = [v156 conversationIdentifier];
  if (![(IMAssistantURLWithMetadata *)v83 length]) {
    goto LABEL_162;
  }
  if (IMOSLoggingEnabled())
  {
    v84 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v197 = v83;
      _os_log_impl(&dword_22C1AD000, v84, OS_LOG_TYPE_INFO, "Intent contains a conversation identifier. Using that to find an existing chat. conversationIdentifier=%@", buf, 0xCu);
    }
  }
  id v85 = v176;
  v86 = v83;
  if ([(IMAssistantURLWithMetadata *)v86 length])
  {
    v87 = IMAssistantChatIdentifierFromConversationIdentifier(v86);
    v88 = [v85 existingChatWithChatIdentifier:v87];
    if (v88)
    {
      id v89 = v88;

      goto LABEL_160;
    }
    if (IMOSLoggingEnabled())
    {
      v90 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v197 = v86;
        _os_log_impl(&dword_22C1AD000, v90, OS_LOG_TYPE_INFO, "Could not find a chat with the conversationIdentifier %@, ignoring.", buf, 0xCu);
      }
    }
    goto LABEL_158;
  }
  if (IMOSLoggingEnabled())
  {
    v87 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C1AD000, v87, OS_LOG_TYPE_INFO, "Could not find a chat with nil or empty conversationIdentifier, ignoring", buf, 2u);
    }
LABEL_158:
  }
  id v89 = 0;
LABEL_160:

  if (v89)
  {
    v91 = (IMAssistantURLWithMetadata *)v89;
    v167 = v91;
    goto LABEL_196;
  }
LABEL_162:
  v92 = [v156 speakableGroupName];
  v91 = v92;
  if (!v92)
  {
    v167 = 0;
    goto LABEL_196;
  }
  obuint64_t j = [(IMAssistantURLWithMetadata *)v92 vocabularyIdentifier];
  if ([(IMAssistantURLWithMetadata *)obj length])
  {
    v93 = IMAssistantChatIdentifierFromConversationIdentifier(obj);
    if (IMOSLoggingEnabled())
    {
      v94 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v197 = obj;
        __int16 v198 = 2112;
        v199 = v93;
        _os_log_impl(&dword_22C1AD000, v94, OS_LOG_TYPE_INFO, "Intent contains a group name vocabulary identifier. Using that to find an existing chat. vocabularyIdentifier=%@ chatIdentifier=%@", buf, 0x16u);
      }
    }
    v95 = [v176 existingChatWithChatIdentifier:v93];
    if (v95)
    {
      v96 = v95;
      v97 = v96;
LABEL_192:
      v167 = v96;
      goto LABEL_193;
    }
    if (IMOSLoggingEnabled())
    {
      v99 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v197 = obj;
        __int16 v198 = 2112;
        v199 = v93;
        _os_log_impl(&dword_22C1AD000, v99, OS_LOG_TYPE_INFO, "Could not find a chat with the vocabularyIdentifier %@ chatIdentifier %@, ignoring", buf, 0x16u);
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    v98 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v98, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v197 = v91;
      _os_log_impl(&dword_22C1AD000, v98, OS_LOG_TYPE_INFO, "speakableGroupName does not contain a vocabularyIdentifier. speakableGroupName=%@", buf, 0xCu);
    }
  }
  v93 = [(IMAssistantURLWithMetadata *)v91 spokenPhrase];
  if (![v93 length])
  {
    v167 = 0;
    goto LABEL_195;
  }
  long long v191 = 0u;
  long long v192 = 0u;
  long long v189 = 0u;
  long long v190 = 0u;
  v97 = [v176 allExistingChats];
  uint64_t v100 = [v97 countByEnumeratingWithState:&v189 objects:buf count:16];
  if (v100)
  {
    uint64_t v101 = *(void *)v190;
    while (2)
    {
      for (iuint64_t i = 0; ii != v100; ++ii)
      {
        if (*(void *)v190 != v101) {
          objc_enumerationMutation(v97);
        }
        v103 = *(void **)(*((void *)&v189 + 1) + 8 * ii);
        v104 = [v103 displayName];
        char v105 = [v104 isEqualToString:v93];

        if (v105)
        {
          v96 = v103;
          goto LABEL_192;
        }
      }
      uint64_t v100 = [v97 countByEnumeratingWithState:&v189 objects:buf count:16];
      if (v100) {
        continue;
      }
      break;
    }
  }
  v167 = 0;
LABEL_193:

LABEL_195:
LABEL_196:

  if (v167)
  {
    if (IMOSLoggingEnabled())
    {
      v106 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v106, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v197 = v167;
        _os_log_impl(&dword_22C1AD000, v106, OS_LOG_TYPE_INFO, "Sending message to chat with identifier specified in intent. chat=%@", buf, 0xCu);
      }
    }
    [*(id *)(a1 + 40) sendMessagesWithText:v161 currentLocation:v153 sharedLinkURL:v170 audioMessageAttachment:v166 photoLibraryAttachment:v164 fileAttachments:v173 expressiveSendStyleID:v160 idsIdentifier:v159 executionContext:v154 toChat:v167 completion:v162];
    goto LABEL_256;
  }
  if (![*(id *)(*(void *)(a1 + 40) + 32) length]) {
    goto LABEL_230;
  }
  if (IMOSLoggingEnabled())
  {
    v107 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v107, OS_LOG_TYPE_INFO))
    {
      v108 = *(IMAssistantURLWithMetadata **)(*(void *)(a1 + 40) + 32);
      *(_DWORD *)buf = 138412290;
      v197 = v108;
      _os_log_impl(&dword_22C1AD000, v107, OS_LOG_TYPE_INFO, "Using stored conversation identifier that was resolved during recipient resolution. conversationIdentifier=%@", buf, 0xCu);
    }
  }
  v109 = *(void **)(*(void *)(a1 + 40) + 32);
  id v110 = v176;
  v111 = v109;
  if (![(IMAssistantURLWithMetadata *)v111 length])
  {
    if (IMOSLoggingEnabled())
    {
      v115 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v115, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C1AD000, v115, OS_LOG_TYPE_INFO, "Could not find a chat with nil or empty conversationIdentifier, ignoring", buf, 2u);
      }
    }
    goto LABEL_219;
  }
  v112 = IMAssistantChatIdentifierFromConversationIdentifier(v111);
  v113 = [v110 existingChatWithChatIdentifier:v112];
  if (!v113)
  {
    if (IMOSLoggingEnabled())
    {
      v116 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v116, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v197 = v111;
        _os_log_impl(&dword_22C1AD000, v116, OS_LOG_TYPE_INFO, "Could not find a chat with the conversationIdentifier %@, ignoring.", buf, 0xCu);
      }
    }
LABEL_219:
    v114 = 0;
    goto LABEL_220;
  }
  v114 = v113;

LABEL_220:
  int v117 = IMOSLoggingEnabled();
  if (v114)
  {
    if (v117)
    {
      v118 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v118, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v197 = v114;
        _os_log_impl(&dword_22C1AD000, v118, OS_LOG_TYPE_INFO, "Sending message to chat that has already been resolved. chat=%@", buf, 0xCu);
      }
    }
    [*(id *)(a1 + 40) sendMessagesWithText:v161 currentLocation:v153 sharedLinkURL:v170 audioMessageAttachment:v166 photoLibraryAttachment:v164 fileAttachments:v173 expressiveSendStyleID:v160 idsIdentifier:v159 executionContext:v154 toChat:v114 completion:v162];

    goto LABEL_256;
  }
  if (v117)
  {
    v119 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v119, OS_LOG_TYPE_INFO))
    {
      v120 = *(IMAssistantURLWithMetadata **)(*(void *)(a1 + 40) + 32);
      *(_DWORD *)buf = 138412290;
      v197 = v120;
      _os_log_impl(&dword_22C1AD000, v119, OS_LOG_TYPE_INFO, "Could not find IMChat matching conversation identifier resolved during recipient resolution. Ignoring. conversationIdentifier=%@", buf, 0xCu);
    }
  }
LABEL_230:
  objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[IMAssistantURLWithMetadata count](v158, "count"));
  v121 = (IMAssistantURLWithMetadata *)objc_claimAutoreleasedReturnValue();
  long long v183 = 0u;
  long long v184 = 0u;
  long long v181 = 0u;
  long long v182 = 0u;
  v122 = v158;
  uint64_t v123 = [(IMAssistantURLWithMetadata *)v122 countByEnumeratingWithState:&v181 objects:v194 count:16];
  if (v123)
  {
    uint64_t v124 = *(void *)v182;
    while (2)
    {
      for (juint64_t j = 0; jj != v123; ++jj)
      {
        if (*(void *)v182 != v124) {
          objc_enumerationMutation(v122);
        }
        v126 = *(IMAssistantURLWithMetadata **)(*((void *)&v181 + 1) + 8 * jj);
        v127 = [(IMAssistantURLWithMetadata *)v126 customIdentifier];
        if (![v127 length])
        {
          if (IMOSLoggingEnabled())
          {
            v128 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v128, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v197 = v126;
              _os_log_impl(&dword_22C1AD000, v128, OS_LOG_TYPE_INFO, "Custom identifier not set, falling back to personHandle.value: %@", buf, 0xCu);
            }
          }
          v129 = [(IMAssistantURLWithMetadata *)v126 personHandle];
          uint64_t v130 = [v129 value];

          v127 = (void *)v130;
        }
        if (![v127 length])
        {
          if (IMOSLoggingEnabled())
          {
            v133 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v133, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v197 = v126;
              _os_log_impl(&dword_22C1AD000, v133, OS_LOG_TYPE_INFO, "Could not send message; recipient had no usable handle: %@",
                buf,
                0xCu);
            }
          }
          v134 = (void *)[objc_alloc(MEMORY[0x263F0FEB0]) initWithCode:4 userActivity:0];
          ((void (**)(void, void *))v162)[2](v162, v134);

          goto LABEL_255;
        }
        [(IMAssistantURLWithMetadata *)v121 addObject:v127];
      }
      uint64_t v123 = [(IMAssistantURLWithMetadata *)v122 countByEnumeratingWithState:&v181 objects:v194 count:16];
      if (v123) {
        continue;
      }
      break;
    }
  }

  v122 = [v176 existingChatForAddresses:v121 allowRetargeting:0 bestHandles:0];
  int v131 = IMOSLoggingEnabled();
  if (v122)
  {
    if (v131)
    {
      v132 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v132, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C1AD000, v132, OS_LOG_TYPE_INFO, "Found existing chat with the recipients; sending",
          buf,
          2u);
      }
    }
    [*(id *)(a1 + 40) sendMessagesWithText:v161 currentLocation:v153 sharedLinkURL:v170 audioMessageAttachment:v166 photoLibraryAttachment:v164 fileAttachments:v173 expressiveSendStyleID:v160 idsIdentifier:v159 executionContext:v154 toChat:v122 completion:v162];
    v127 = [MEMORY[0x263F4B0A8] sharedInstance];
    [v127 sendINSendMessageIntentEvent];
  }
  else
  {
    if (v131)
    {
      v135 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v135, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v197 = v121;
        _os_log_impl(&dword_22C1AD000, v135, OS_LOG_TYPE_INFO, "Could not find any existing chat matching addresses. Creating new chat. Addresses: %@", buf, 0xCu);
      }
    }
    v136 = [*(id *)(a1 + 40) messageHandlerDataSource];
    v137 = [v136 accountDataSource];
    char v138 = [v137 hasMessagingAccount];

    if (v138)
    {
      v127 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[IMAssistantURLWithMetadata count](v121, "count"));
      long long v179 = 0u;
      long long v180 = 0u;
      long long v177 = 0u;
      long long v178 = 0u;
      obja = v121;
      uint64_t v139 = [(IMAssistantURLWithMetadata *)obja countByEnumeratingWithState:&v177 objects:v193 count:16];
      if (v139)
      {
        uint64_t v157 = *(void *)v178;
        while (2)
        {
          for (kuint64_t k = 0; kk != v139; ++kk)
          {
            if (*(void *)v178 != v157) {
              objc_enumerationMutation(obja);
            }
            v141 = *(IMAssistantURLWithMetadata **)(*((void *)&v177 + 1) + 8 * kk);
            v142 = [*(id *)(a1 + 40) messageHandlerDataSource];
            v143 = [v142 accountDataSource];
            v144 = IMStripFormattingFromAddress();
            v145 = [v143 imHandleWithID:v144];

            if (!v145)
            {
              if (IMOSLoggingEnabled())
              {
                v148 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v148, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  v197 = v141;
                  _os_log_impl(&dword_22C1AD000, v148, OS_LOG_TYPE_INFO, "Could not send message; an address could not be resolved to an IMHandle: %@",
                    buf,
                    0xCu);
                }
              }
              v149 = (void *)[objc_alloc(MEMORY[0x263F0FEB0]) initWithCode:4 userActivity:0];
              ((void (**)(void, void *))v162)[2](v162, v149);
              goto LABEL_290;
            }
            [v127 addObject:v145];
          }
          uint64_t v139 = [(IMAssistantURLWithMetadata *)obja countByEnumeratingWithState:&v177 objects:v193 count:16];
          if (v139) {
            continue;
          }
          break;
        }
      }

      if ([v127 count] == 1)
      {
        v146 = [v127 firstObject];
        obja = [v176 chatForIMHandle:v146];
      }
      else
      {
        v146 = [v176 chatForIMHandles:v127];
        obja = v146;
      }

      if ([*(id *)(a1 + 40) updateSenderIdentityForNewlyCreatedChat:obja])
      {
        [*(id *)(a1 + 40) sendMessagesWithText:v161 currentLocation:v153 sharedLinkURL:v170 audioMessageAttachment:v166 photoLibraryAttachment:v164 fileAttachments:v173 expressiveSendStyleID:v160 idsIdentifier:v159 executionContext:v154 toChat:obja completion:v162];
        v149 = [MEMORY[0x263F4B0A8] sharedInstance];
        [v149 sendINSendMessageIntentEvent];
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          v150 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v150, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22C1AD000, v150, OS_LOG_TYPE_INFO, "Failed to determine the prefferred sender identity, returning failure requiring app launch so the user can use the sim selection UI", buf, 2u);
          }
        }
        v149 = (void *)[objc_alloc(MEMORY[0x263F0FEB0]) initWithCode:5 userActivity:0];
        ((void (**)(void, void *))v162)[2](v162, v149);
      }
LABEL_290:
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v147 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v147, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22C1AD000, v147, OS_LOG_TYPE_INFO, "Could not send message; no messaging accounts available",
            buf,
            2u);
        }
      }
      v127 = (void *)[objc_alloc(MEMORY[0x263F0FEB0]) initWithCode:6 userActivity:0];
      ((void (**)(void, void *))v162)[2](v162, v127);
    }
  }
LABEL_255:

LABEL_256:
}

void sub_22C1B223C(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = _IMAssistantCoreSendMessageSignpostLogHandle();
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v5, OS_SIGNPOST_INTERVAL_END, v6, "handleSendMessageIntent", (const char *)&unk_22C1E071B, v7, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_22C1B2550(uint64_t a1, void *a2)
{
  return [a2 ID];
}

void sub_22C1B26E4(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x22C1B267CLL);
  }
  _Unwind_Resume(a1);
}

void sub_22C1B28CC(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_22C1AD000, v4, OS_LOG_TYPE_INFO, "Resolve recipients with legacy resolution results: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  id v5 = _IMAssistantCoreSendMessageSignpostLogHandle();
  os_signpost_id_t v6 = v5;
  os_signpost_id_t v7 = *(void *)(a1 + 40);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v6, OS_SIGNPOST_INTERVAL_END, v7, "resolveRecipientsForSendMessage", (const char *)&unk_22C1E071B, (uint8_t *)&v8, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_22C1B33D8(id *a1)
{
  v1 = a1;
  uint64_t v272 = *MEMORY[0x263EF8340];
  uint64_t v2 = [a1[4] count];
  id v3 = v1[4];
  v221 = v1;
  if (v2 == 1)
  {
    id v229 = [v3 firstObject];
    IMAssistantChatIdentifierFromConversationIdentifier(v229);
    v226 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v265 = (uint64_t)v229;
        __int16 v266 = 2112;
        v267 = v226;
        _os_log_impl(&dword_22C1AD000, v4, OS_LOG_TYPE_INFO, "Intent contains one unique conversationIdentifier: %@ chatIdentifier: %@", buf, 0x16u);
      }
    }
    id v5 = [v1[5] messageHandlerDataSource];
    os_signpost_id_t v6 = [v5 chatDataSource];
    os_signpost_id_t v7 = [v6 existingChatWithChatIdentifier:v226];

    if (v7)
    {
      if ([v7 isBusinessChat] && -[__CFString length](v226, "length"))
      {
        if (IMOSLoggingEnabled())
        {
          int v8 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22C1AD000, v8, OS_LOG_TYPE_INFO, "Chat resolved via conversation identifier is a business chat. Not resolving speakableGroupName to the business name, because the business name will be included in the recipients. Returning notRequired for speakableGroupName.", buf, 2u);
          }
        }
        id v9 = _IMAssistantCoreSendMessageSignpostLogHandle();
        uint64_t v10 = v9;
        os_signpost_id_t v11 = (os_signpost_id_t)v221[8];
        if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22C1AD000, v10, OS_SIGNPOST_INTERVAL_END, v11, "resolveSpeakableGroupNameForSendMessage", (const char *)&unk_22C1E071B, buf, 2u);
        }

        uint64_t v12 = (void (**)(id, __CFString *))v221[7];
        os_signpost_id_t v13 = [MEMORY[0x263F0FFA8] notRequired];
        v12[2](v12, v13);
LABEL_273:

        goto LABEL_320;
      }
      id v78 = v7;
      int v79 = [v78 isGroupChat];
      int v80 = [v78 isBusinessChat];
      int v81 = [v78 isStewieChat];
      v82 = [v78 displayName];
      v83 = v82;
      if (v79 | v80 | v81 && [v82 length])
      {
        id v84 = objc_alloc(MEMORY[0x263F0FFA0]);
        id v85 = [v78 chatIdentifier];
        v86 = [v78 displayName];
        os_signpost_id_t v13 = (__CFString *)[v84 initWithVocabularyIdentifier:v85 spokenPhrase:v86 pronunciationHint:0];
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          v88 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
          {
            id v89 = @"NO";
            *(_DWORD *)buf = 138413058;
            uint64_t v265 = (uint64_t)v78;
            if (v79) {
              v90 = @"YES";
            }
            else {
              v90 = @"NO";
            }
            __int16 v266 = 2112;
            v267 = v90;
            if (v80) {
              id v89 = @"YES";
            }
            __int16 v268 = 2112;
            v269 = v89;
            __int16 v270 = 2112;
            v271 = v83;
            _os_log_impl(&dword_22C1AD000, v88, OS_LOG_TYPE_INFO, "Could not find a name for chat, ignoring. chat: %@, isGroupChat: %@, isBusinessChat: %@, displayName: %@", buf, 0x2Au);
          }
        }
        os_signpost_id_t v13 = 0;
      }

      int v91 = IMOSLoggingEnabled();
      if (v13)
      {
        if (v91)
        {
          v92 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v265 = (uint64_t)v226;
            __int16 v266 = 2112;
            v267 = v13;
            _os_log_impl(&dword_22C1AD000, v92, OS_LOG_TYPE_INFO, "Found a named chat matching chatIdentifier, %@ with name \"%@\".", buf, 0x16u);
          }
        }
        v93 = [v221[5] messageHandlerDataSource];
        char v94 = [v93 screentimeAllowedToShowChat:v78 error:0];

        int v95 = IMOSLoggingEnabled();
        if (v94)
        {
          if (v95)
          {
            v96 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v265 = (uint64_t)v13;
              _os_log_impl(&dword_22C1AD000, v96, OS_LOG_TYPE_INFO, "Returning success with name \"%@\".", buf, 0xCu);
            }
          }
          v97 = _IMAssistantCoreSendMessageSignpostLogHandle();
          v98 = v97;
          os_signpost_id_t v99 = (os_signpost_id_t)v221[8];
          if (v99 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v97))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22C1AD000, v98, OS_SIGNPOST_INTERVAL_END, v99, "resolveSpeakableGroupNameForSendMessage", (const char *)&unk_22C1E071B, buf, 2u);
          }

          uint64_t v100 = (void (**)(id, void *))v221[7];
          uint64_t v101 = [MEMORY[0x263F0FFA8] successWithResolvedString:v13];
          v100[2](v100, v101);
        }
        else
        {
          if (v95)
          {
            v199 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v199, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v265 = (uint64_t)v13;
              _os_log_impl(&dword_22C1AD000, v199, OS_LOG_TYPE_INFO, "Returning unsupported because the chat group (%@) contains non-allowlisted participants and isn't allowed by downtime.", buf, 0xCu);
            }
          }
          uint64_t v200 = _IMAssistantCoreSendMessageSignpostLogHandle();
          v201 = v200;
          os_signpost_id_t v202 = (os_signpost_id_t)v221[8];
          if (v202 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v200))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22C1AD000, v201, OS_SIGNPOST_INTERVAL_END, v202, "resolveSpeakableGroupNameForSendMessage", (const char *)&unk_22C1E071B, buf, 2u);
          }

          v203 = (void (**)(id, void *))v221[7];
          uint64_t v101 = [MEMORY[0x263F0FFA8] unsupported];
          v203[2](v203, v101);
        }

        goto LABEL_273;
      }
      if (!v91) {
        goto LABEL_143;
      }
      v87 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v265 = (uint64_t)v226;
        _os_log_impl(&dword_22C1AD000, v87, OS_LOG_TYPE_INFO, "Could not find a name for the chat with the chatIdentifier %@, ignoring.", buf, 0xCu);
      }
    }
    else
    {
      if (!IMOSLoggingEnabled())
      {
LABEL_143:

LABEL_144:
        v1 = v221;
        goto LABEL_145;
      }
      v87 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v265 = (uint64_t)v226;
        _os_log_impl(&dword_22C1AD000, v87, OS_LOG_TYPE_INFO, "Could not find chat with the chatIdentifier %@, ignoring", buf, 0xCu);
      }
    }

    goto LABEL_143;
  }
  unint64_t v14 = [v3 count];
  int v15 = IMOSLoggingEnabled();
  if (v14 >= 2)
  {
    if (v15)
    {
      uint64_t v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = [v1[4] count];
        v18 = (__CFString *)v1[4];
        *(_DWORD *)buf = 134218242;
        uint64_t v265 = v17;
        __int16 v266 = 2112;
        v267 = v18;
        _os_log_impl(&dword_22C1AD000, v16, OS_LOG_TYPE_INFO, "Intent contains %ld unique conversationIdentifiers: %@", buf, 0x16u);
      }
    }
    v19 = [v1[5] messageHandlerDataSource];
    id v229 = [v19 chatDataSource];

    v226 = (__CFString *)objc_alloc_init(MEMORY[0x263EFF9B0]);
    long long v232 = 0u;
    long long v233 = 0u;
    long long v230 = 0u;
    long long v231 = 0u;
    id v20 = v1[4];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v230 objects:v246 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v231;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v231 != v22) {
            objc_enumerationMutation(v20);
          }
          v24 = *(void **)(*((void *)&v230 + 1) + 8 * i);
          v25 = IMAssistantChatIdentifierFromConversationIdentifier(v24);
          id v26 = [v229 existingChatWithChatIdentifier:v25];
          if (v26)
          {
            [(__CFString *)v226 addObject:v26];
          }
          else if (IMOSLoggingEnabled())
          {
            v27 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v265 = (uint64_t)v24;
              _os_log_impl(&dword_22C1AD000, v27, OS_LOG_TYPE_INFO, "Could not find chat with chatIdentifier %@, ignoring", buf, 0xCu);
            }
          }
        }
        uint64_t v21 = [v20 countByEnumeratingWithState:&v230 objects:v246 count:16];
      }
      while (v21);
    }

    if (IMOSLoggingEnabled())
    {
      v28 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        uint64_t v29 = [(__CFString *)v226 count];
        *(_DWORD *)buf = 134218242;
        uint64_t v265 = v29;
        __int16 v266 = 2112;
        v267 = v226;
        _os_log_impl(&dword_22C1AD000, v28, OS_LOG_TYPE_INFO, "%ld chats match chatIdentifiers. Chats: %@", buf, 0x16u);
      }
    }
    id v30 = [(__CFString *)v226 array];
    id v222 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v244 = 0u;
    long long v245 = 0u;
    long long v242 = 0u;
    long long v243 = 0u;
    obuint64_t j = v30;
    uint64_t v31 = [obj countByEnumeratingWithState:&v242 objects:buf count:16];
    if (v31)
    {
      uint64_t v32 = *(void *)v243;
      do
      {
        for (uint64_t j = 0; j != v31; ++j)
        {
          if (*(void *)v243 != v32) {
            objc_enumerationMutation(obj);
          }
          v34 = *(void **)(*((void *)&v242 + 1) + 8 * j);
          int v35 = [v34 isGroupChat];
          v36 = [v34 displayName];
          v37 = v36;
          if (v35 && [v36 length])
          {
            v38 = [v222 objectForKey:v37];
            v39 = v38;
            if (v38)
            {
              [v38 addObject:v34];
            }
            else
            {
              uint64_t v42 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v34, 0);
              [v222 setObject:v42 forKey:v37];
            }
          }
          else if (IMOSLoggingEnabled())
          {
            int v40 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v253 = 138412802;
              v41 = @"NO";
              if (v35) {
                v41 = @"YES";
              }
              *(void *)&v253[4] = v34;
              *(_WORD *)&v253[12] = 2112;
              *(void *)&v253[14] = v41;
              *(_WORD *)&v253[22] = 2112;
              *(void *)&v253[24] = v37;
              _os_log_impl(&dword_22C1AD000, v40, OS_LOG_TYPE_INFO, "Could not construct disambiguation option for chat: %@, isGroupChat: %@, displayName: %@. Ignoring.", v253, 0x20u);
            }
          }
        }
        uint64_t v31 = [obj countByEnumeratingWithState:&v242 objects:buf count:16];
      }
      while (v31);
    }

    id v227 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v240 = 0u;
    long long v241 = 0u;
    long long v238 = 0u;
    long long v239 = 0u;
    v43 = [v222 allValues];
    uint64_t v44 = [v43 countByEnumeratingWithState:&v238 objects:v253 count:16];
    if (v44)
    {
      uint64_t v45 = *(void *)v239;
      do
      {
        for (uint64_t k = 0; k != v44; ++k)
        {
          if (*(void *)v239 != v45) {
            objc_enumerationMutation(v43);
          }
          v47 = *(void **)(*((void *)&v238 + 1) + 8 * k);
          v48 = [v47 sortedArrayUsingComparator:&unk_26DF9B658];
          char v49 = [v48 firstObject];
          [v227 addObject:v49];
          if ((unint64_t)[v47 count] >= 2 && IMOSLoggingEnabled())
          {
            v50 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
            {
              uint64_t v51 = [v47 count];
              id v52 = [v49 displayName];
              *(_DWORD *)v247 = 134218498;
              uint64_t v248 = v51;
              __int16 v249 = 2112;
              id v250 = v52;
              __int16 v251 = 2112;
              v252 = v49;
              _os_log_impl(&dword_22C1AD000, v50, OS_LOG_TYPE_INFO, "%ld chats have the name \"%@\". Presenting disambiguation of chats with the same name is confusing, so using the most recent one, %@.", v247, 0x20u);
            }
          }
        }
        uint64_t v44 = [v43 countByEnumeratingWithState:&v238 objects:v253 count:16];
      }
      while (v44);
    }

    id v53 = [v227 sortedArrayUsingComparator:&unk_26DF9B658];
    id v54 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v236 = 0u;
    long long v237 = 0u;
    long long v234 = 0u;
    long long v235 = 0u;
    id v55 = v53;
    uint64_t v56 = [v55 countByEnumeratingWithState:&v234 objects:v247 count:16];
    if (v56)
    {
      uint64_t v57 = *(void *)v235;
      do
      {
        for (uint64_t m = 0; m != v56; ++m)
        {
          if (*(void *)v235 != v57) {
            objc_enumerationMutation(v55);
          }
          id v59 = *(id *)(*((void *)&v234 + 1) + 8 * m);
          int v60 = [v59 isGroupChat];
          int v61 = [v59 isBusinessChat];
          int v62 = [v59 isStewieChat];
          v63 = [v59 displayName];
          v64 = v63;
          if (v60 | v61 | v62 && [v63 length])
          {
            id v65 = objc_alloc(MEMORY[0x263F0FFA0]);
            v66 = [v59 chatIdentifier];
            v67 = [v59 displayName];
            v68 = (void *)[v65 initWithVocabularyIdentifier:v66 spokenPhrase:v67 pronunciationHint:0];
          }
          else
          {
            if (IMOSLoggingEnabled())
            {
              uint64_t v69 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)v256 = 138413058;
                uint64_t v70 = @"NO";
                if (v60) {
                  v71 = @"YES";
                }
                else {
                  v71 = @"NO";
                }
                id v257 = v59;
                if (v61) {
                  uint64_t v70 = @"YES";
                }
                __int16 v258 = 2112;
                v259 = v71;
                __int16 v260 = 2112;
                v261 = v70;
                __int16 v262 = 2112;
                v263 = v64;
                _os_log_impl(&dword_22C1AD000, v69, OS_LOG_TYPE_INFO, "Could not find a name for chat, ignoring. chat: %@, isGroupChat: %@, isBusinessChat: %@, displayName: %@", v256, 0x2Au);
              }
            }
            v68 = 0;
          }

          if (v68) {
            [v54 addObject:v68];
          }
        }
        uint64_t v56 = [v55 countByEnumeratingWithState:&v234 objects:v247 count:16];
      }
      while (v56);
    }

    v72 = (void *)[v54 copy];
    v73 = v72;
    if ([(__CFString *)v73 count] == 1)
    {
      id v74 = [(__CFString *)v73 firstObject];
      if (IMOSLoggingEnabled())
      {
        v75 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v265 = (uint64_t)v74;
          _os_log_impl(&dword_22C1AD000, v75, OS_LOG_TYPE_INFO, "Only one disambiguation option remains, returning success with resolved name: %@", buf, 0xCu);
        }
      }
      v76 = [MEMORY[0x263F0FFA8] successWithResolvedString:v74];
    }
    else
    {
      BOOL v102 = (unint64_t)[(__CFString *)v73 count] > 1;
      int v103 = IMOSLoggingEnabled();
      if (v102)
      {
        if (v103)
        {
          v104 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v104, OS_LOG_TYPE_INFO))
          {
            uint64_t v105 = [(__CFString *)v73 count];
            *(_DWORD *)buf = 134218242;
            uint64_t v265 = v105;
            __int16 v266 = 2112;
            v267 = v73;
            _os_log_impl(&dword_22C1AD000, v104, OS_LOG_TYPE_INFO, "Asking user to disambiguate among %ld disambiguation options: %@", buf, 0x16u);
          }
        }
        uint64_t v106 = [MEMORY[0x263F0FFA8] disambiguationWithStringsToDisambiguate:v73];
      }
      else
      {
        if (v103)
        {
          v204 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v204, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22C1AD000, v204, OS_LOG_TYPE_INFO, "No disambiguation options remain. Returning unsupported (a.k.a. notFound)", buf, 2u);
          }
        }
        uint64_t v106 = [MEMORY[0x263F0FFA8] unsupported];
      }
      v76 = (void *)v106;
    }

    if (IMOSLoggingEnabled())
    {
      v205 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v205, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v265 = (uint64_t)v76;
        _os_log_impl(&dword_22C1AD000, v205, OS_LOG_TYPE_INFO, "Returning speakableGroupName resolution result: %@", buf, 0xCu);
      }
    }
    v206 = _IMAssistantCoreSendMessageSignpostLogHandle();
    v207 = v206;
    os_signpost_id_t v208 = (os_signpost_id_t)v221[8];
    if (v208 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v206))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_22C1AD000, v207, OS_SIGNPOST_INTERVAL_END, v208, "resolveSpeakableGroupNameForSendMessage", (const char *)&unk_22C1E071B, buf, 2u);
    }

    (*((void (**)(void))v221[7] + 2))();
    goto LABEL_320;
  }
  if (v15)
  {
    v77 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C1AD000, v77, OS_LOG_TYPE_INFO, "Intent contains no chat guids.", buf, 2u);
    }

    goto LABEL_144;
  }
LABEL_145:
  id v229 = [v1[6] spokenPhrase];
  BOOL v107 = [v229 length] == 0;
  int v108 = IMOSLoggingEnabled();
  if (!v107)
  {
    v109 = v221;
    if (v108)
    {
      id v110 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v265 = (uint64_t)v229;
        _os_log_impl(&dword_22C1AD000, v110, OS_LOG_TYPE_INFO, "Attempting to resolve via speakableGroupName.spokenPhrase = \"%@\"", buf, 0xCu);
      }

      v109 = v221;
    }
    v111 = [v109[5] messageHandlerDataSource];
    id v112 = [v111 chatDataSource];
    id v229 = v229;
    if ([v229 length])
    {
      id v113 = objc_alloc_init(MEMORY[0x263EFF9B0]);
      long long v254 = 0u;
      long long v255 = 0u;
      memset(v253, 0, sizeof(v253));
      v114 = [v112 allExistingChats];
      uint64_t v115 = [v114 countByEnumeratingWithState:v253 objects:buf count:16];
      if (v115)
      {
        uint64_t v116 = **(void **)&v253[16];
        do
        {
          for (uint64_t n = 0; n != v115; ++n)
          {
            if (**(void **)&v253[16] != v116) {
              objc_enumerationMutation(v114);
            }
            v118 = *(void **)(*(void *)&v253[8] + 8 * n);
            v119 = [v118 displayName];
            int v120 = [v119 isEqualToString:v229];

            if (v120) {
              [v113 addObject:v118];
            }
          }
          uint64_t v115 = [v114 countByEnumeratingWithState:v253 objects:buf count:16];
        }
        while (v115);
      }

      v226 = [v113 array];
    }
    else
    {
      v226 = (__CFString *)MEMORY[0x263EFFA68];
    }

    if ([(__CFString *)v226 count] != 1)
    {
      BOOL v136 = (unint64_t)[(__CFString *)v226 count] > 1;
      int v137 = IMOSLoggingEnabled();
      if (v136)
      {
        char v138 = v226;
        if (v137)
        {
          uint64_t v139 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v139, OS_LOG_TYPE_INFO))
          {
            uint64_t v140 = [(__CFString *)v226 count];
            *(_DWORD *)buf = 134218242;
            uint64_t v265 = v140;
            __int16 v266 = 2112;
            v267 = v226;
            _os_log_impl(&dword_22C1AD000, v139, OS_LOG_TYPE_INFO, "Found %ld chats matching requested spoken phrase. Producing disambiguation options. matchingChats: %@", buf, 0x16u);
          }

          char v138 = v226;
        }
        v141 = v138;
        id v223 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        long long v244 = 0u;
        long long v245 = 0u;
        long long v242 = 0u;
        long long v243 = 0u;
        obja = v141;
        uint64_t v142 = [(__CFString *)obja countByEnumeratingWithState:&v242 objects:buf count:16];
        if (v142)
        {
          uint64_t v143 = *(void *)v243;
          do
          {
            for (iuint64_t i = 0; ii != v142; ++ii)
            {
              if (*(void *)v243 != v143) {
                objc_enumerationMutation(obja);
              }
              v145 = *(void **)(*((void *)&v242 + 1) + 8 * ii);
              int v146 = [v145 isGroupChat];
              v147 = [v145 displayName];
              v148 = v147;
              if (v146 && [v147 length])
              {
                v149 = [v223 objectForKey:v148];
                v150 = v149;
                if (v149)
                {
                  [v149 addObject:v145];
                }
                else
                {
                  unsigned int v153 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v145, 0);
                  [v223 setObject:v153 forKey:v148];
                }
              }
              else if (IMOSLoggingEnabled())
              {
                v151 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v151, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)v253 = 138412802;
                  v152 = @"NO";
                  if (v146) {
                    v152 = @"YES";
                  }
                  *(void *)&v253[4] = v145;
                  *(_WORD *)&v253[12] = 2112;
                  *(void *)&v253[14] = v152;
                  *(_WORD *)&v253[22] = 2112;
                  *(void *)&v253[24] = v148;
                  _os_log_impl(&dword_22C1AD000, v151, OS_LOG_TYPE_INFO, "Could not construct disambiguation option for chat: %@, isGroupChat: %@, displayName: %@. Ignoring.", v253, 0x20u);
                }
              }
            }
            uint64_t v142 = [(__CFString *)obja countByEnumeratingWithState:&v242 objects:buf count:16];
          }
          while (v142);
        }

        id v228 = objc_alloc_init(MEMORY[0x263EFF980]);
        long long v240 = 0u;
        long long v241 = 0u;
        long long v238 = 0u;
        long long v239 = 0u;
        uint64_t v154 = [v223 allValues];
        uint64_t v155 = [v154 countByEnumeratingWithState:&v238 objects:v253 count:16];
        if (v155)
        {
          uint64_t v156 = *(void *)v239;
          do
          {
            for (juint64_t j = 0; jj != v155; ++jj)
            {
              if (*(void *)v239 != v156) {
                objc_enumerationMutation(v154);
              }
              v158 = *(void **)(*((void *)&v238 + 1) + 8 * jj);
              id v159 = [v158 sortedArrayUsingComparator:&unk_26DF9B658];
              v160 = [v159 firstObject];
              [v228 addObject:v160];
              if ((unint64_t)[v158 count] >= 2 && IMOSLoggingEnabled())
              {
                v161 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v161, OS_LOG_TYPE_INFO))
                {
                  uint64_t v162 = [v158 count];
                  id v163 = [v160 displayName];
                  *(_DWORD *)v247 = 134218498;
                  uint64_t v248 = v162;
                  __int16 v249 = 2112;
                  id v250 = v163;
                  __int16 v251 = 2112;
                  v252 = v160;
                  _os_log_impl(&dword_22C1AD000, v161, OS_LOG_TYPE_INFO, "%ld chats have the name \"%@\". Presenting disambiguation of chats with the same name is confusing, so using the most recent one, %@.", v247, 0x20u);
                }
              }
            }
            uint64_t v155 = [v154 countByEnumeratingWithState:&v238 objects:v253 count:16];
          }
          while (v155);
        }

        id v164 = [v228 sortedArrayUsingComparator:&unk_26DF9B658];
        id v165 = objc_alloc_init(MEMORY[0x263EFF980]);
        long long v236 = 0u;
        long long v237 = 0u;
        long long v234 = 0u;
        long long v235 = 0u;
        id v166 = v164;
        uint64_t v167 = [v166 countByEnumeratingWithState:&v234 objects:v247 count:16];
        if (v167)
        {
          uint64_t v168 = *(void *)v235;
          do
          {
            for (kuint64_t k = 0; kk != v167; ++kk)
            {
              if (*(void *)v235 != v168) {
                objc_enumerationMutation(v166);
              }
              id v170 = *(id *)(*((void *)&v234 + 1) + 8 * kk);
              int v171 = [v170 isGroupChat];
              int v172 = [v170 isBusinessChat];
              int v173 = [v170 isStewieChat];
              v174 = [v170 displayName];
              id v175 = v174;
              if (v171 | v172 | v173 && [v174 length])
              {
                id v176 = objc_alloc(MEMORY[0x263F0FFA0]);
                long long v177 = [v170 chatIdentifier];
                long long v178 = [v170 displayName];
                long long v179 = (void *)[v176 initWithVocabularyIdentifier:v177 spokenPhrase:v178 pronunciationHint:0];
              }
              else
              {
                if (IMOSLoggingEnabled())
                {
                  long long v180 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v180, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)v256 = 138413058;
                    long long v181 = @"NO";
                    if (v171) {
                      long long v182 = @"YES";
                    }
                    else {
                      long long v182 = @"NO";
                    }
                    id v257 = v170;
                    if (v172) {
                      long long v181 = @"YES";
                    }
                    __int16 v258 = 2112;
                    v259 = v182;
                    __int16 v260 = 2112;
                    v261 = v181;
                    __int16 v262 = 2112;
                    v263 = v175;
                    _os_log_impl(&dword_22C1AD000, v180, OS_LOG_TYPE_INFO, "Could not find a name for chat, ignoring. chat: %@, isGroupChat: %@, isBusinessChat: %@, displayName: %@", v256, 0x2Au);
                  }
                }
                long long v179 = 0;
              }

              if (v179) {
                [v165 addObject:v179];
              }
            }
            uint64_t v167 = [v166 countByEnumeratingWithState:&v234 objects:v247 count:16];
          }
          while (v167);
        }

        long long v183 = (void *)[v165 copy];
        long long v184 = v183;
        if ([(__CFString *)v184 count] == 1)
        {
          v185 = [(__CFString *)v184 firstObject];
          if (IMOSLoggingEnabled())
          {
            id v186 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v186, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v265 = (uint64_t)v185;
              _os_log_impl(&dword_22C1AD000, v186, OS_LOG_TYPE_INFO, "Only one disambiguation option remains, returning success with resolved name: %@", buf, 0xCu);
            }
          }
          uint64_t v187 = [MEMORY[0x263F0FFA8] successWithResolvedString:v185];
        }
        else
        {
          BOOL v211 = (unint64_t)[(__CFString *)v184 count] > 1;
          int v212 = IMOSLoggingEnabled();
          if (v211)
          {
            if (v212)
            {
              v213 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v213, OS_LOG_TYPE_INFO))
              {
                uint64_t v214 = [(__CFString *)v184 count];
                *(_DWORD *)buf = 134218242;
                uint64_t v265 = v214;
                __int16 v266 = 2112;
                v267 = v184;
                _os_log_impl(&dword_22C1AD000, v213, OS_LOG_TYPE_INFO, "Asking user to disambiguate among %ld disambiguation options: %@", buf, 0x16u);
              }
            }
            uint64_t v215 = [MEMORY[0x263F0FFA8] disambiguationWithStringsToDisambiguate:v184];
          }
          else
          {
            if (v212)
            {
              v216 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v216, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_22C1AD000, v216, OS_LOG_TYPE_INFO, "No disambiguation options remain. Returning unsupported (a.k.a. notFound)", buf, 2u);
              }
            }
            uint64_t v215 = [MEMORY[0x263F0FFA8] unsupported];
          }
          uint64_t v187 = (void *)v215;
        }
      }
      else
      {
        if (v137)
        {
          __int16 v198 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v198, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22C1AD000, v198, OS_LOG_TYPE_INFO, "Could not find any chats matching requested spokenPhrase. Returning unsupported (a.k.a. notFound)", buf, 2u);
          }
        }
        uint64_t v187 = [MEMORY[0x263F0FFA8] unsupported];
      }
      goto LABEL_312;
    }
    v126 = [(__CFString *)v226 firstObject];
    int v127 = [(__CFString *)v126 isGroupChat];
    int v128 = [(__CFString *)v126 isBusinessChat];
    int v129 = [(__CFString *)v126 isStewieChat];
    uint64_t v130 = [(__CFString *)v126 displayName];
    int v131 = v130;
    if (v127 | v128 | v129 && [v130 length])
    {
      id v132 = objc_alloc(MEMORY[0x263F0FFA0]);
      v133 = [(__CFString *)v126 chatIdentifier];
      v134 = [(__CFString *)v126 displayName];
      v135 = (void *)[v132 initWithVocabularyIdentifier:v133 spokenPhrase:v134 pronunciationHint:0];
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        id v188 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v188, OS_LOG_TYPE_INFO))
        {
          long long v189 = @"NO";
          *(_DWORD *)buf = 138413058;
          uint64_t v265 = (uint64_t)v126;
          if (v127) {
            long long v190 = @"YES";
          }
          else {
            long long v190 = @"NO";
          }
          __int16 v266 = 2112;
          v267 = v190;
          if (v128) {
            long long v189 = @"YES";
          }
          __int16 v268 = 2112;
          v269 = v189;
          __int16 v270 = 2112;
          v271 = v131;
          _os_log_impl(&dword_22C1AD000, v188, OS_LOG_TYPE_INFO, "Could not find a name for chat, ignoring. chat: %@, isGroupChat: %@, isBusinessChat: %@, displayName: %@", buf, 0x2Au);
        }
      }
      v135 = 0;
    }

    int v191 = IMOSLoggingEnabled();
    if (v135)
    {
      if (v191)
      {
        long long v192 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v192, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v265 = (uint64_t)v135;
          __int16 v266 = 2112;
          v267 = v126;
          _os_log_impl(&dword_22C1AD000, v192, OS_LOG_TYPE_INFO, "Found chat name \"%@\" matching chat: %@", buf, 0x16u);
        }
      }
      v193 = [v221[5] messageHandlerDataSource];
      char v194 = [v193 screentimeAllowedToShowChat:v126 error:0];

      int v195 = IMOSLoggingEnabled();
      if (v194)
      {
        if (v195)
        {
          v196 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v196, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v265 = (uint64_t)v135;
            __int16 v266 = 2112;
            v267 = v126;
            _os_log_impl(&dword_22C1AD000, v196, OS_LOG_TYPE_INFO, "Using chat name \"%@\" resolved from matching chat: %@", buf, 0x16u);
          }
        }
        uint64_t v197 = [MEMORY[0x263F0FFA8] successWithResolvedString:v135];
        goto LABEL_298;
      }
      if (v195)
      {
        v210 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v210, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22C1AD000, v210, OS_LOG_TYPE_INFO, "Returning unsupported because the chat group contains non-allowlisted participants and isn't allowed by downtime.", buf, 2u);
        }
      }
    }
    else if (v191)
    {
      v209 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v209, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v265 = (uint64_t)v126;
        _os_log_impl(&dword_22C1AD000, v209, OS_LOG_TYPE_INFO, "Could not determine chat name from only matching chat. Returning unsupported/notFound. Matching chat: %@", buf, 0xCu);
      }
    }
    uint64_t v197 = [MEMORY[0x263F0FFA8] unsupported];
LABEL_298:
    uint64_t v187 = (void *)v197;

LABEL_312:
    if (IMOSLoggingEnabled())
    {
      v217 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v217, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v265 = (uint64_t)v187;
        _os_log_impl(&dword_22C1AD000, v217, OS_LOG_TYPE_INFO, "Resolved group name result: %@", buf, 0xCu);
      }
    }
    v218 = _IMAssistantCoreSendMessageSignpostLogHandle();
    v219 = v218;
    os_signpost_id_t v220 = (os_signpost_id_t)v221[8];
    if (v220 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v218))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_22C1AD000, v219, OS_SIGNPOST_INTERVAL_END, v220, "resolveSpeakableGroupNameForSendMessage", (const char *)&unk_22C1E071B, buf, 2u);
    }

    (*((void (**)(void))v221[7] + 2))();
    goto LABEL_320;
  }
  if (v108)
  {
    v121 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v121, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C1AD000, v121, OS_LOG_TYPE_INFO, "Intent does not contain a spoken group name. Returning notRequired for resolveSpeakableGroupName.", buf, 2u);
    }
  }
  v122 = _IMAssistantCoreSendMessageSignpostLogHandle();
  uint64_t v123 = v122;
  os_signpost_id_t v124 = (os_signpost_id_t)v221[8];
  if (v124 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v122))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v123, OS_SIGNPOST_INTERVAL_END, v124, "resolveSpeakableGroupNameForSendMessage", (const char *)&unk_22C1E071B, buf, 2u);
  }

  v125 = (void (**)(id, __CFString *))v221[7];
  v226 = [MEMORY[0x263F0FFA8] notRequired];
  v125[2](v125, v226);
LABEL_320:
}

void sub_22C1B6500(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

void sub_22C1B6530(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  int v6 = IMOSLoggingEnabled();
  if (v5)
  {
    if (v6)
    {
      os_signpost_id_t v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v8 = [v5 localizedDescription];
        int v10 = 138412290;
        os_signpost_id_t v11 = v8;
        _os_log_impl(&dword_22C1AD000, v7, OS_LOG_TYPE_INFO, "Image sensitivity analysis error: '%@'", (uint8_t *)&v10, 0xCu);
      }
    }
  }
  else
  {
    if (v6)
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v10 = 67109120;
        LODWORD(v11) = a2;
        _os_log_impl(&dword_22C1AD000, v9, OS_LOG_TYPE_INFO, "Image sensisitivty %d.", (uint8_t *)&v10, 8u);
      }
    }
    [*(id *)(a1 + 32) lock];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) |= a2;
    [*(id *)(a1 + 32) unlock];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t sub_22C1B66D4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

uint64_t sub_22C1B7088(uint64_t a1, int a2)
{
  if (!a2) {
    return [*(id *)(a1 + 32) sendLocalFileAttachmentURLs:*(void *)(a1 + 40) chat:*(void *)(a1 + 48) executionContext:*(void *)(a1 + 96) expressiveSendStyleID:*(void *)(a1 + 56) idsIdentifier:*(void *)(a1 + 64) sourceApplicationID:*(void *)(a1 + 72) sentMessages:*(void *)(a1 + 80) completion:*(void *)(a1 + 88)];
  }
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 88) + 16);

  return v2();
}

void sub_22C1B7450(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v4 = +[IMAssistantINMessageConverter INMessageForOutgoingIMMessage:a2 toChat:*(void *)(a1 + 32) messageType:13 personProvider:*(void *)(a1 + 40)];
    [*(id *)(a1 + 48) addObject:v4];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v3();
  }
}

void sub_22C1B8200(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    if (IMOSLoggingEnabled())
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        __int16 v9 = 0;
        int v6 = "Unable to build a PHAsset message as requested. Returning failure.";
        os_signpost_id_t v7 = (uint8_t *)&v9;
LABEL_10:
        _os_log_impl(&dword_22C1AD000, v5, OS_LOG_TYPE_INFO, v6, v7, 2u);
      }
LABEL_11:
    }
LABEL_12:
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))(*(void *)(a1 + 80));
    goto LABEL_13;
  }
  if (([*(id *)(a1 + 32) sendMessageWithDraft:v3 expressiveSendStyleID:*(void *)(a1 + 40) idsIdentifier:*(void *)(a1 + 48) executionContext:*(void *)(a1 + 88) sourceApplicationID:*(void *)(a1 + 56) toChat:*(void *)(a1 + 64)] & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        __int16 v8 = 0;
        int v6 = "Unable to send a PHAsset message as requested. Returning failure.";
        os_signpost_id_t v7 = (uint8_t *)&v8;
        goto LABEL_10;
      }
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  id v4 = +[IMAssistantINMessageConverter INMessageForOutgoingIMMessage:v3 toChat:*(void *)(a1 + 64) messageType:15 personProvider:*(void *)(a1 + 32)];
  [*(id *)(a1 + 72) addObject:v4];
  (*(void (**)(void))(*(void *)(a1 + 80) + 16))();

LABEL_13:
}

void sub_22C1B8FA0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  int v6 = (void *)[objc_alloc(MEMORY[0x263F0FEB0]) initWithCode:a2 userActivity:0];
  os_signpost_id_t v7 = v6;
  if (a2 == 3) {
    [v6 setSentMessages:v5];
  }
  if (IMOSLoggingEnabled())
  {
    __int16 v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      os_signpost_id_t v13 = v7;
      _os_log_impl(&dword_22C1AD000, v8, OS_LOG_TYPE_INFO, "Returning %@ response.", (uint8_t *)&v12, 0xCu);
    }
  }
  __int16 v9 = _IMAssistantCoreSendMessageSignpostLogHandle();
  int v10 = v9;
  os_signpost_id_t v11 = *(void *)(a1 + 40);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v10, OS_SIGNPOST_INTERVAL_END, v11, "sendMessageWithText", (const char *)&unk_22C1E071B, (uint8_t *)&v12, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_22C1B96DC(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [v4 objectAtIndex:a3];
  [v6 addObject:v5];
}

void sub_22C1BAAE8(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t v28 = [*(id *)(a1 + 32) resolveRecipientsWithGroupNameOrConversationIdentifier:*(void *)(a1 + 40) forIntent:*(void *)(a1 + 48)];
  v1 = (void *)v28;
  if (!v28)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v2 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C1AD000, v2, OS_LOG_TYPE_INFO, "Neither a group name nor a conversation identifier were provided, attempting to resolve by recipients.", buf, 2u);
      }
    }
    id v3 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v4 = *(id *)(a1 + 40);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (!v5)
    {
LABEL_58:

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      v1 = (void *)v28;
      goto LABEL_59;
    }
    uint64_t v6 = *(void *)v31;
LABEL_9:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v31 != v6) {
        objc_enumerationMutation(v4);
      }
      __int16 v8 = *(void **)(*((void *)&v30 + 1) + 8 * v7);
      __int16 v9 = objc_msgSend(v8, "contactIdentifier", v28);
      if ([v9 length])
      {
        int v10 = [v8 personHandle];
        os_signpost_id_t v11 = [v10 value];
        BOOL v12 = v11 == 0;

        if (!v12)
        {
          if (IMOSLoggingEnabled())
          {
            os_signpost_id_t v13 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              int v35 = v8;
              _os_log_impl(&dword_22C1AD000, v13, OS_LOG_TYPE_INFO, "This recipient is already fully resolved: %@", buf, 0xCu);
            }
          }
          uint64_t v14 = [MEMORY[0x263F0FEB8] successWithResolvedPerson:v8];
          [v3 addObject:v14];
          goto LABEL_56;
        }
      }
      else
      {
      }
      if (IMOSLoggingEnabled())
      {
        int v15 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          int v35 = v8;
          _os_log_impl(&dword_22C1AD000, v15, OS_LOG_TYPE_INFO, "Resolving %@", buf, 0xCu);
        }
      }
      uint64_t v16 = [v8 scoredAlternatives];
      uint64_t v14 = [v16 firstObject];

      if (!v14)
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v21 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            int v35 = v8;
            _os_log_impl(&dword_22C1AD000, v21, OS_LOG_TYPE_INFO, "CRR offered no suggestions for %@", buf, 0xCu);
          }
        }
        uint64_t v17 = [MEMORY[0x263F0FEB8] unsupported];
        [v3 addObject:v17];
        goto LABEL_55;
      }
      uint64_t v17 = [v14 person];
      if (!v17)
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v22 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            int v35 = v14;
            _os_log_impl(&dword_22C1AD000, v22, OS_LOG_TYPE_INFO, "Error extracting a scoredPerson from %@", buf, 0xCu);
          }
        }
        id v20 = [MEMORY[0x263F0FEB8] unsupported];
        [v3 addObject:v20];
        goto LABEL_54;
      }
      uint64_t v18 = [v14 recommendation];
      if (v18 == 2)
      {
        if (IMOSLoggingEnabled())
        {
          v23 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            v24 = [v8 siriMatches];
            *(_DWORD *)buf = 138412290;
            int v35 = v24;
            _os_log_impl(&dword_22C1AD000, v23, OS_LOG_TYPE_INFO, "CRR resolved to needs disambiguation: %@", buf, 0xCu);
          }
        }
        v25 = (void *)MEMORY[0x263F0FEB8];
        id v20 = [v8 siriMatches];
        id v26 = [v25 disambiguationWithPeopleToDisambiguate:v20];
        [v3 addObject:v26];

        goto LABEL_54;
      }
      if (v18 == 1) {
        break;
      }
      if (!v18)
      {
        if (IMOSLoggingEnabled())
        {
          v19 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            int v35 = v17;
            _os_log_impl(&dword_22C1AD000, v19, OS_LOG_TYPE_INFO, "CRR resolved to a confident match: %@", buf, 0xCu);
          }
        }
        id v20 = [MEMORY[0x263F0FEB8] successWithResolvedPerson:v17];
        [v3 addObject:v20];
LABEL_54:
      }
LABEL_55:

LABEL_56:
      if (v5 == ++v7)
      {
        uint64_t v5 = [v4 countByEnumeratingWithState:&v30 objects:v36 count:16];
        if (!v5) {
          goto LABEL_58;
        }
        goto LABEL_9;
      }
    }
    if (IMOSLoggingEnabled())
    {
      v27 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        int v35 = v17;
        _os_log_impl(&dword_22C1AD000, v27, OS_LOG_TYPE_INFO, "CRR resolved to needs confirmation: %@", buf, 0xCu);
      }
    }
    id v20 = [MEMORY[0x263F0FEB8] confirmationRequiredWithPersonToConfirm:v17];
    [v3 addObject:v20];
    goto LABEL_54;
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_59:
}

void sub_22C1BB358(uint64_t a1)
{
  v160[1] = *MEMORY[0x263EF8340];
  v1 = [*(id *)(a1 + 32) resolveRecipientsWithGroupNameOrConversationIdentifier:*(void *)(a1 + 40) forIntent:*(void *)(a1 + 48)];
  if (v1)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    goto LABEL_181;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C1AD000, v2, OS_LOG_TYPE_INFO, "Neither a group name nor a conversation identifier were provided, attempting to resolve by recipients.", buf, 2u);
    }
  }
  id v112 = objc_msgSend(*(id *)(a1 + 40), "__imArrayByApplyingBlock:", &unk_26DF9B618);
  if ((objc_msgSend(MEMORY[0x263F0FD28], "__imcore__containsNonSuccess:", v112) & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      v43 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C1AD000, v43, OS_LOG_TYPE_INFO, "All recipients already have a resolved handle, validating screentime status.", buf, 2u);
      }
    }
    uint64_t v44 = *(void **)(a1 + 32);
    id v148 = 0;
    char v45 = [v44 recipientHandleResolutionResultsAllowedByScreentime:v112 error:&v148];
    id v118 = v148;
    int v46 = IMOSLoggingEnabled();
    if (v45)
    {
      if (v46)
      {
        v47 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22C1AD000, v47, OS_LOG_TYPE_INFO, "Returning success with pre-resolved handles.", buf, 2u);
        }
      }
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    else
    {
      id v54 = v118;
      if (v46)
      {
        id v55 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22C1AD000, v55, OS_LOG_TYPE_INFO, "Returning unsupported because the preresolved handles contain a non-screentime allowlisted recipient.", buf, 2u);
        }

        id v54 = v118;
      }
      if (v54) {
        uint64_t v56 = [v54 code];
      }
      else {
        uint64_t v56 = *MEMORY[0x263F102D8];
      }
      uint64_t v81 = *(void *)(a1 + 56);
      v82 = [MEMORY[0x263F0FEB8] unsupportedForReason:v56];
      v160[0] = v82;
      v83 = [MEMORY[0x263EFF8C0] arrayWithObjects:v160 count:1];
      (*(void (**)(uint64_t, void *))(v81 + 16))(v81, v83);
    }
    goto LABEL_180;
  }
  objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
  id v118 = (id)objc_claimAutoreleasedReturnValue();
  id v116 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v146 = 0u;
  long long v147 = 0u;
  long long v144 = 0u;
  long long v145 = 0u;
  obuint64_t j = *(id *)(a1 + 40);
  uint64_t v117 = [obj countByEnumeratingWithState:&v144 objects:v159 count:16];
  if (!v117)
  {
    char v113 = 1;
    goto LABEL_104;
  }
  char v113 = 1;
  uint64_t v115 = *(void *)v145;
  *(void *)&long long v3 = 134218242;
  long long v111 = v3;
  while (2)
  {
    uint64_t v4 = 0;
    do
    {
      if (*(void *)v145 != v115)
      {
        uint64_t v5 = v4;
        objc_enumerationMutation(obj);
        uint64_t v4 = v5;
      }
      uint64_t v120 = v4;
      v122 = *(void **)(*((void *)&v144 + 1) + 8 * v4);
      uint64_t v6 = objc_msgSend(v122, "personHandle", v111);
      uint64_t v7 = objc_msgSend(v6, "__im_assistant_handleType");

      v121 = [*(id *)(a1 + 32) contactsMatchingINPerson:v122];
      if (!([v121 count] | v7))
      {
        if (IMOSLoggingEnabled())
        {
          v48 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v153 = (uint64_t)v122;
            _os_log_impl(&dword_22C1AD000, v48, OS_LOG_TYPE_INFO, "Recipient contains neither siriMatches nor a personHandle.value, returning unsupported/notFound for recipient: %@", buf, 0xCu);
          }
        }
        uint64_t v49 = *(void *)(a1 + 56);
        v50 = *(void **)(a1 + 32);
        uint64_t v51 = [MEMORY[0x263F0FEB8] unsupported];
        id v52 = [v50 recipientsResolutionFailureResultWithResult:v51 forRecipient:v122 amongRecipients:*(void *)(a1 + 40)];
        (*(void (**)(uint64_t, void *))(v49 + 16))(v49, v52);

        id v53 = obj;
        goto LABEL_179;
      }
      [v118 setObject:v121 forKeyedSubscript:v122];
      id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
      if ((unint64_t)(v7 - 1) < 2)
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v21 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v153 = (uint64_t)v122;
            _os_log_impl(&dword_22C1AD000, v21, OS_LOG_TYPE_INFO, "Recipient contains both an explicit personHandle.value and contact identifiers, attempting to extract mathcing handle from contacts. Recipient: %@", buf, 0xCu);
          }
        }
        uint64_t v22 = [v122 personHandle];
        uint64_t v123 = [v22 value];

        long long v138 = 0u;
        long long v139 = 0u;
        long long v136 = 0u;
        long long v137 = 0u;
        id v23 = v121;
        uint64_t v24 = [v23 countByEnumeratingWithState:&v136 objects:v151 count:16];
        if (v24)
        {
          uint64_t v25 = *(void *)v137;
          do
          {
            for (uint64_t i = 0; i != v24; ++i)
            {
              if (*(void *)v137 != v25) {
                objc_enumerationMutation(v23);
              }
              v27 = *(void **)(*((void *)&v136 + 1) + 8 * i);
              uint64_t v28 = objc_msgSend(v27, "__im_assistant_handlesMatchingHandleID:", v123);
              if (IMOSLoggingEnabled())
              {
                uint64_t v29 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
                {
                  uint64_t v30 = [v28 count];
                  *(_DWORD *)buf = 134218498;
                  uint64_t v153 = v30;
                  __int16 v154 = 2112;
                  id v155 = v27;
                  __int16 v156 = 2112;
                  uint64_t v157 = v122;
                  _os_log_impl(&dword_22C1AD000, v29, OS_LOG_TYPE_INFO, "Found %ld matching handles on contact %@ for recipient: %@", buf, 0x20u);
                }
              }
              [v8 addObjectsFromArray:v28];
            }
            uint64_t v24 = [v23 countByEnumeratingWithState:&v136 objects:v151 count:16];
          }
          while (v24);
        }

        if ([v8 count]) {
          goto LABEL_68;
        }
        if (IMOSLoggingEnabled())
        {
          long long v31 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v153 = (uint64_t)v123;
            _os_log_impl(&dword_22C1AD000, v31, OS_LOG_TYPE_INFO, "Handle %@ was not found on any of the contacts, using handle without a contact", buf, 0xCu);
          }
        }
        if (v7 == 2)
        {
          long long v32 = (void *)[objc_alloc(MEMORY[0x263EFEAD0]) initWithLabel:0 value:v123];
          long long v33 = [[IMAssistantHandleFromContact alloc] initWithCNLabeledEmailAddress:v32 contact:0];
          if (v33) {
            [v8 addObject:v33];
          }
        }
        else
        {
          if (v7 != 1) {
            goto LABEL_68;
          }
          long long v32 = (void *)[objc_alloc(MEMORY[0x263EFEB28]) initWithStringValue:v123];
          long long v33 = (IMAssistantHandleFromContact *)[objc_alloc(MEMORY[0x263EFEAD0]) initWithLabel:0 value:v32];
          v34 = [[IMAssistantHandleFromContact alloc] initWithCNLabeledPhoneNumber:v33 contact:0];
          if (v34) {
            [v8 addObject:v34];
          }
        }
LABEL_68:
        if (IMOSLoggingEnabled())
        {
          v39 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            uint64_t v40 = [v8 count];
            *(_DWORD *)buf = v111;
            uint64_t v153 = v40;
            __int16 v154 = 2112;
            id v155 = v8;
            _os_log_impl(&dword_22C1AD000, v39, OS_LOG_TYPE_INFO, "Using %ld matching manually dictated handles: %@", buf, 0x16u);
          }
        }
        goto LABEL_72;
      }
      if (v7 == 3)
      {
        int v35 = [v122 personHandle];
        uint64_t v123 = [v35 value];

        v36 = [[IMAssistantHandleFromContact alloc] initWithBusinessID:v123];
        if (v36) {
          [v8 addObject:v36];
        }
        if (IMOSLoggingEnabled())
        {
          uint64_t v37 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            uint64_t v38 = [v8 count];
            *(_DWORD *)buf = v111;
            uint64_t v153 = v38;
            __int16 v154 = 2112;
            id v155 = v8;
            _os_log_impl(&dword_22C1AD000, v37, OS_LOG_TYPE_INFO, "Using %ld matching business chat handle: %@", buf, 0x16u);
          }
        }
      }
      else
      {
        if (v7) {
          goto LABEL_73;
        }
        uint64_t v123 = [v122 personHandle];
        uint64_t v9 = [v123 type];
        int v10 = [v123 label];
        long long v142 = 0u;
        long long v143 = 0u;
        long long v140 = 0u;
        long long v141 = 0u;
        id v11 = v121;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v140 objects:v158 count:16];
        if (v12)
        {
          uint64_t v13 = *(void *)v141;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v141 != v13) {
                objc_enumerationMutation(v11);
              }
              int v15 = *(void **)(*((void *)&v140 + 1) + 8 * j);
              uint64_t v16 = objc_msgSend(v15, "__im_assistant_handlesMatchingRequestedHandleType:requestedHandleLabel:", v9, v10);
              if (IMOSLoggingEnabled())
              {
                uint64_t v17 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
                {
                  uint64_t v18 = [v16 count];
                  *(_DWORD *)buf = 134218498;
                  uint64_t v153 = v18;
                  __int16 v154 = 2112;
                  id v155 = v15;
                  __int16 v156 = 2112;
                  uint64_t v157 = v122;
                  _os_log_impl(&dword_22C1AD000, v17, OS_LOG_TYPE_INFO, "Found %ld matching handles on contact %@ for recipient: %@", buf, 0x20u);
                }
              }
              [v8 addObjectsFromArray:v16];
            }
            uint64_t v12 = [v11 countByEnumeratingWithState:&v140 objects:v158 count:16];
          }
          while (v12);
        }

        if (IMOSLoggingEnabled())
        {
          v19 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            uint64_t v20 = [v8 count];
            *(_DWORD *)buf = v111;
            uint64_t v153 = v20;
            __int16 v154 = 2112;
            id v155 = v8;
            _os_log_impl(&dword_22C1AD000, v19, OS_LOG_TYPE_INFO, "Using %ld matching handles from contacts: %@", buf, 0x16u);
          }
        }
      }
LABEL_72:

LABEL_73:
      if (![v8 count])
      {
        if (IMOSLoggingEnabled())
        {
          v41 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v153 = (uint64_t)v122;
            _os_log_impl(&dword_22C1AD000, v41, OS_LOG_TYPE_INFO, "Found no handles matching recipient: %@", buf, 0xCu);
          }
        }
        char v113 = 0;
      }
      uint64_t v42 = (void *)[v8 copy];
      [v116 setObject:v42 forKey:v122];

      uint64_t v4 = v120 + 1;
    }
    while (v120 + 1 != v117);
    uint64_t v117 = [obj countByEnumeratingWithState:&v144 objects:v159 count:16];
    if (v117) {
      continue;
    }
    break;
  }
LABEL_104:

  uint64_t v57 = [*(id *)(a1 + 40) firstObject];
  uint64_t v58 = [v57 scoredAlternatives];
  BOOL v59 = v58 != 0;

  int v60 = [MEMORY[0x263F4AF80] sharedFeatureFlags];
  LODWORD(v57) = [v60 arePreResolvedSiriMatchesEnabled];

  int v61 = IMOSLoggingEnabled();
  if ((v59 & v57) != 0)
  {
    if (v61)
    {
      int v62 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C1AD000, v62, OS_LOG_TYPE_INFO, "Skipping existing chat search because we have pre resolved siriMatch results.", buf, 2u);
      }
      goto LABEL_108;
    }
    goto LABEL_153;
  }
  if ((v113 & 1) == 0)
  {
    if (v61)
    {
      int v62 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C1AD000, v62, OS_LOG_TYPE_INFO, "Skipping existing chat search as at least one of the recipients has no valid handles.", buf, 2u);
      }
LABEL_108:
    }
LABEL_153:
    int v91 = *(void **)(a1 + 40);
    v131[0] = MEMORY[0x263EF8330];
    v131[1] = 3221225472;
    v131[2] = sub_22C1BCB14;
    v131[3] = &unk_264912638;
    id v92 = v112;
    id v132 = v92;
    id v93 = v118;
    uint64_t v94 = *(void *)(a1 + 32);
    id v133 = v93;
    uint64_t v134 = v94;
    int v95 = objc_msgSend(v91, "__im_assistant_arrayByApplyingBlockWithIndex:", v131);
    if (objc_msgSend(MEMORY[0x263F0FD28], "__imcore__containsNonSuccess:", v95))
    {
      if (IMOSLoggingEnabled())
      {
        v96 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v153 = (uint64_t)v95;
          _os_log_impl(&dword_22C1AD000, v96, OS_LOG_TYPE_INFO, "Could not resolve a single contact for each recipient, returning resolution result: %@", buf, 0xCu);
        }
      }
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    else
    {
      v97 = *(void **)(a1 + 40);
      v125[0] = MEMORY[0x263EF8330];
      v125[1] = 3221225472;
      v125[2] = sub_22C1BCFA8;
      v125[3] = &unk_264912660;
      id v126 = v92;
      id v127 = v95;
      id v128 = v116;
      id v98 = v93;
      uint64_t v99 = *(void *)(a1 + 32);
      id v129 = v98;
      uint64_t v130 = v99;
      uint64_t v100 = objc_msgSend(v97, "__im_assistant_arrayByApplyingBlockWithIndex:", v125);
      uint64_t v101 = *(void **)(a1 + 32);
      id v124 = 0;
      LOBYTE(v97) = [v101 recipientHandleResolutionResultsAllowedByScreentime:v100 error:&v124];
      id v102 = v124;
      int v103 = IMOSLoggingEnabled();
      if (v97)
      {
        if (v103)
        {
          v104 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v104, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v153 = (uint64_t)v100;
            _os_log_impl(&dword_22C1AD000, v104, OS_LOG_TYPE_INFO, "Completed handle resolution with results: %@", buf, 0xCu);
          }
        }
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      }
      else
      {
        if (v103)
        {
          uint64_t v105 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v105, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22C1AD000, v105, OS_LOG_TYPE_INFO, "Returning unsupported because chat is blocked for downtime.", buf, 2u);
          }
        }
        if (v102) {
          uint64_t v106 = [v102 code];
        }
        else {
          uint64_t v106 = *MEMORY[0x263F102D8];
        }
        uint64_t v108 = *(void *)(a1 + 56);
        v109 = [MEMORY[0x263F0FEB8] unsupportedForReason:v106];
        v149 = v109;
        id v110 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v149 count:1];
        (*(void (**)(uint64_t, void *))(v108 + 16))(v108, v110);
      }
    }

    id v53 = v132;
    goto LABEL_179;
  }
  if (v61)
  {
    v63 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C1AD000, v63, OS_LOG_TYPE_INFO, "Attempting to find an existing chat with the desired recipients", buf, 2u);
    }
  }
  v64 = [*(id *)(a1 + 32) messageHandlerDataSource];
  id v65 = [v64 chatDataSource];
  v66 = [v65 allExistingChats];
  v67 = objc_msgSend(v66, "__imArrayByFilteringWithBlock:", &unk_26DF9B678);
  id v53 = [v67 sortedArrayUsingSelector:sel_compareChatByDate_];

  v68 = [*(id *)(a1 + 32) resolveRecipientsByFindingExistingRelevantChatsForRecipients:*(void *)(a1 + 40) withMatchingHandlesByRecipient:v116 fromChats:v53];
  if ([v68 count] == 1)
  {
    uint64_t v69 = [v68 firstObject];
    uint64_t v70 = [v69 chat];
    v71 = [*(id *)(a1 + 32) messageHandlerDataSource];
    id v135 = 0;
    char v72 = [v71 screentimeAllowedToShowChat:v70 error:&v135];
    id v73 = v135;

    if (v72)
    {
      id v74 = [v69 resolvedPersons];
      v75 = objc_msgSend(v74, "__imArrayByApplyingBlock:", &unk_26DF9B638);
      v76 = [v70 chatIdentifier];
      if (IMOSLoggingEnabled())
      {
        v77 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v153 = (uint64_t)v76;
          _os_log_impl(&dword_22C1AD000, v77, OS_LOG_TYPE_INFO, "Found an existing chat matching recipients. Storing conversationIdentifier=%@", buf, 0xCu);
        }
      }
      uint64_t v78 = *(void *)(a1 + 32);
      int v79 = *(void **)(v78 + 32);
      *(void *)(v78 + 32) = v76;
      id v80 = v76;

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v87 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22C1AD000, v87, OS_LOG_TYPE_INFO, "Returning unsupported because one of the intended recipient handles is not allowed by downtime.", buf, 2u);
        }
      }
      if (v73) {
        uint64_t v88 = [v73 code];
      }
      else {
        uint64_t v88 = *MEMORY[0x263F102D8];
      }
      uint64_t v107 = *(void *)(a1 + 56);
      id v74 = [MEMORY[0x263F0FEB8] unsupportedForReason:v88];
      v150 = v74;
      v75 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v150 count:1];
      (*(void (**)(uint64_t, void *))(v107 + 16))(v107, v75);
    }

    goto LABEL_174;
  }
  if ((unint64_t)[v68 count] < 2)
  {
LABEL_148:
    if (IMOSLoggingEnabled())
    {
      v90 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C1AD000, v90, OS_LOG_TYPE_INFO, "Did not find any existing chat matching request.", buf, 2u);
      }
    }
    goto LABEL_153;
  }
  if (IMOSLoggingEnabled())
  {
    id v84 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C1AD000, v84, OS_LOG_TYPE_INFO, "Multiple existing recent chats match the requested participant(s).", buf, 2u);
    }
  }
  uint64_t v69 = [*(id *)(a1 + 32) recipientDisambiguationResultsFromMultipleRelevantChats:v68];
  int v85 = IMOSLoggingEnabled();
  if (!v69)
  {
    if (v85)
    {
      id v89 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C1AD000, v89, OS_LOG_TYPE_INFO, "Could not construct disambiguation result. Ignoring relevant chats.", buf, 2u);
      }
    }
    goto LABEL_148;
  }
  if (v85)
  {
    v86 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v153 = (uint64_t)v69;
      _os_log_impl(&dword_22C1AD000, v86, OS_LOG_TYPE_INFO, "Returning disambiguation result: %@", buf, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_174:

LABEL_179:
LABEL_180:

  v1 = 0;
LABEL_181:
}

id sub_22C1BCA80(uint64_t a1, void *a2)
{
  id v2 = a2;
  long long v3 = [v2 customIdentifier];
  uint64_t v4 = [v3 length];

  if (v4) {
    [MEMORY[0x263F0FEB8] successWithResolvedPerson:v2];
  }
  else {
  uint64_t v5 = [MEMORY[0x263F0FEB8] needsValue];
  }

  return v5;
}

uint64_t sub_22C1BCB04(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x263F0FEB8] successWithResolvedPerson:a2];
}

id sub_22C1BCB14(id *a1, void *a2, uint64_t a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v5 = a2;
  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v25 = 138412290;
      id v26 = v5;
      _os_log_impl(&dword_22C1AD000, v6, OS_LOG_TYPE_INFO, "Beginning contact resolution for recipient: %@", (uint8_t *)&v25, 0xCu);
    }
  }
  uint64_t v7 = [MEMORY[0x263F4AF80] sharedFeatureFlags];
  int v8 = [v7 arePreResolvedSiriMatchesEnabled];

  if (!v8) {
    goto LABEL_29;
  }
  uint64_t v9 = [v5 siriMatches];
  uint64_t v10 = [v9 count];
  if (v10 >= 2)
  {
    if (IMOSLoggingEnabled())
    {
      id v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v25 = 138412290;
        id v26 = v9;
        _os_log_impl(&dword_22C1AD000, v11, OS_LOG_TYPE_INFO, "found multiple resolved siri matches. disambiguating: %@", (uint8_t *)&v25, 0xCu);
      }
    }
    uint64_t v12 = [MEMORY[0x263F0FD28] disambiguationWithPeopleToDisambiguate:v9];
LABEL_35:
    uint64_t v20 = v12;
    goto LABEL_37;
  }
  if (v10 == 1)
  {
    uint64_t v13 = [v9 objectAtIndexedSubscript:0];
    uint64_t v14 = [v13 personHandle];
    int v15 = [v14 value];
    BOOL v16 = [v15 length] == 0;

    if (!v16)
    {
      uint64_t v17 = [v13 personHandle];
      uint64_t v18 = [v17 value];
      [v13 setCustomIdentifier:v18];

      if (IMOSLoggingEnabled())
      {
        v19 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          int v25 = 138412290;
          id v26 = v13;
          _os_log_impl(&dword_22C1AD000, v19, OS_LOG_TYPE_INFO, "found one resolved siri match with a valid handle. picking it: %@", (uint8_t *)&v25, 0xCu);
        }
      }
      uint64_t v20 = [MEMORY[0x263F0FD28] successWithResolvedPerson:v13];

      goto LABEL_37;
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        LOWORD(v25) = 0;
        _os_log_impl(&dword_22C1AD000, v21, OS_LOG_TYPE_INFO, "found one resolved siri match, but no handle. falling back to legacy contact resolution.", (uint8_t *)&v25, 2u);
      }
    }
    goto LABEL_27;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LOWORD(v25) = 0;
      _os_log_impl(&dword_22C1AD000, v13, OS_LOG_TYPE_INFO, "did not find any siri matches. falling back to legacy contact resolution.", (uint8_t *)&v25, 2u);
    }
LABEL_27:
  }
LABEL_29:
  uint64_t v9 = [a1[4] objectAtIndexedSubscript:a3];
  if ([v9 __imcore__isSuccess])
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        int v25 = 138412290;
        id v26 = v9;
        _os_log_impl(&dword_22C1AD000, v22, OS_LOG_TYPE_INFO, "Already have a resolved contact and handle for this recipient. Returning success: %@", (uint8_t *)&v25, 0xCu);
      }
    }
    uint64_t v12 = v9;
    uint64_t v9 = v12;
    goto LABEL_35;
  }
  id v23 = [a1[5] objectForKeyedSubscript:v5];
  uint64_t v20 = [a1[6] contactResolutionResultForContacts:v23 matchingRecipient:v5];

LABEL_37:

  return v20;
}

id sub_22C1BCFA8(id *a1, void *a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v20 = 138412290;
      id v21 = v5;
      _os_log_impl(&dword_22C1AD000, v6, OS_LOG_TYPE_INFO, "Beginning handle resolution for recipient: %@", (uint8_t *)&v20, 0xCu);
    }
  }
  uint64_t v7 = [a1[4] objectAtIndexedSubscript:a3];
  if (objc_msgSend(v7, "__imcore__isSuccess"))
  {
    if (IMOSLoggingEnabled())
    {
      int v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v20 = 138412290;
        id v21 = v7;
        _os_log_impl(&dword_22C1AD000, v8, OS_LOG_TYPE_INFO, "Intent already has a resolved handle for this recipient. Returning success: %@", (uint8_t *)&v20, 0xCu);
      }
    }
    id v9 = v7;
  }
  else
  {
    uint64_t v10 = [a1[5] objectAtIndexedSubscript:a3];
    id v11 = [v10 resolvedValue];
    uint64_t v12 = [v11 customIdentifier];
    BOOL v13 = [v12 length] == 0;

    if (v13)
    {
      int v15 = [a1[6] objectForKeyedSubscript:v5];
      BOOL v16 = [a1[7] objectForKeyedSubscript:v5];
      uint64_t v17 = [v16 firstObject];
      if ((unint64_t)[v16 count] >= 2 && IMOSLoggingEnabled())
      {
        uint64_t v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          int v20 = 138412290;
          id v21 = v16;
          _os_log_impl(&dword_22C1AD000, v18, OS_LOG_TYPE_INFO, "More than one matching contact exists after person resolution. Person resolution should have resolved the recipients down to a single contact. Something has gone horribly wrong. Picking the first one and continuing with handle resolution.\nContacts: %@", (uint8_t *)&v20, 0xCu);
        }
      }
      id v9 = [a1[8] handleResolutionResultForHandles:v15 resolvedContactForAlternatives:v17 recipient:v5];
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          int v20 = 138412290;
          id v21 = v10;
          _os_log_impl(&dword_22C1AD000, v14, OS_LOG_TYPE_INFO, "A handle was already resolved as part of contact resolution (e.g. contacts with duplicate names that only contain one valid handle). Returning success with the resolved handle: %@", (uint8_t *)&v20, 0xCu);
        }
      }
      id v9 = v10;
    }
  }

  return v9;
}

void sub_22C1BDE58(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if ((unint64_t)[v6 count] >= 2)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v8 = 134218498;
        uint64_t v9 = [v6 count];
        __int16 v10 = 2112;
        id v11 = v5;
        __int16 v12 = 2112;
        id v13 = v6;
        _os_log_impl(&dword_22C1AD000, v7, OS_LOG_TYPE_INFO, "%ld contacts have the name \"%@\". Will use handles for these contacts, rather than just name, when disambiguating. Contacts: %@", (uint8_t *)&v8, 0x20u);
      }
    }
    [*(id *)(a1 + 32) addObjectsFromArray:v6];
  }
}

void sub_22C1BEAE0(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v12 = a2;
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [[IMAssistantChatParticipant alloc] initWithIMHandle:v8 handleFromContact:v7];

  __int16 v10 = [*(id *)(a1 + 32) objectForKey:v12];
  if (v10)
  {
    id v11 = v10;
    [v10 addObject:v9];
  }
  else
  {
    id v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v9, 0);
    [*(id *)(a1 + 32) setObject:v11 forKey:v12];
  }
}

id sub_22C1BEBCC(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) objectForKey:v3];
  id v5 = [v4 imHandle];
  id v6 = [v4 handleFromContact];
  id v7 = [v6 contact];
  if (v7)
  {
LABEL_2:
    id v8 = objc_alloc(MEMORY[0x263F0FD18]);
    uint64_t v9 = objc_msgSend(v8, "__im_assistant_initWithContact:imHandle:", v7, v5);

    goto LABEL_16;
  }
  __int16 v10 = [*(id *)(a1 + 40) contactIdentifiersMatchingHandle:v5];
  if ([v10 count])
  {
    id v11 = [v10 lastObject];
    id v7 = [*(id *)(a1 + 40) contactWithIdentifier:v11];
    if (IMOSLoggingEnabled())
    {
      id v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v15 = 134219010;
        uint64_t v16 = [v10 count];
        __int16 v17 = 2112;
        uint64_t v18 = v5;
        __int16 v19 = 2112;
        int v20 = v11;
        __int16 v21 = 2112;
        uint64_t v22 = v10;
        __int16 v23 = 2112;
        id v24 = v7;
        _os_log_impl(&dword_22C1AD000, v12, OS_LOG_TYPE_INFO, "Found %ld contacts matching handle: %@. Using contact identifier %@ from list %@. Contact: %@", (uint8_t *)&v15, 0x34u);
      }
    }
    if (v7) {
      goto LABEL_2;
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v15 = 138412290;
        uint64_t v16 = (uint64_t)v5;
        _os_log_impl(&dword_22C1AD000, v13, OS_LOG_TYPE_INFO, "Did not find any contacts matching manually requested handle: %@", (uint8_t *)&v15, 0xCu);
      }
    }
  }
  id v7 = objc_alloc(MEMORY[0x263F0FD18]);
  uint64_t v9 = objc_msgSend(v7, "__im_assistant_initAnonymousRecipientWithIMHandle:", v5);
LABEL_16:

  return v9;
}

uint64_t sub_22C1BFB08(uint64_t a1, void *a2)
{
  id v3 = [a2 imHandle];
  uint64_t v4 = [*(id *)(a1 + 32) imHandle];
  uint64_t v5 = [v3 isEqual:v4] ^ 1;

  return v5;
}

id sub_22C1C1320(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x263F0FD18];
  id v4 = a2;
  id v5 = [v3 alloc];
  id v6 = objc_msgSend(v5, "__im_assistant_initWithHandleFromContact:accountDataSource:", v4, *(void *)(a1 + 32));

  return v6;
}

id sub_22C1C1470(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 32) == a2)
  {
    id v2 = *(id *)(a1 + 40);
  }
  else
  {
    id v2 = [MEMORY[0x263F0FEB8] notRequired];
  }

  return v2;
}

uint64_t sub_22C1C152C(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = [a3 lastFinishedMessageDate];
  id v6 = [v4 lastFinishedMessageDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

void sub_22C1C159C(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a2;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_22C1AD000, v5, OS_LOG_TYPE_INFO, "Live photo photo write completed.", (uint8_t *)&v9, 2u);
    }
  }
  if (v4)
  {
    if (IMOSLoggingEnabled())
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        int v9 = 138412546;
        uint64_t v10 = v7;
        __int16 v11 = 2112;
        uint64_t v12 = v8;
        _os_log_impl(&dword_22C1AD000, v6, OS_LOG_TYPE_INFO, "Failed to write the photo (%@) into the MessagesAssistantExtension Sandbox. Error: %@", (uint8_t *)&v9, 0x16u);
      }
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_22C1C1728(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a2;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_22C1AD000, v5, OS_LOG_TYPE_INFO, "Live photo video write completed.", (uint8_t *)&v9, 2u);
    }
  }
  if (v4)
  {
    if (IMOSLoggingEnabled())
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        int v9 = 138412546;
        uint64_t v10 = v7;
        __int16 v11 = 2112;
        uint64_t v12 = v8;
        _os_log_impl(&dword_22C1AD000, v6, OS_LOG_TYPE_INFO, "Failed to write the live photo video compliment (%@) into the MessagesAssistantExtension Sandbox. Error: %@", (uint8_t *)&v9, 0x16u);
      }
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_22C1C18B4(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
  {
    id v2 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v2();
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        uint64_t v4 = *(void *)(a1 + 32);
        uint64_t v5 = *(void *)(a1 + 40);
        int v15 = 138412546;
        uint64_t v16 = v4;
        __int16 v17 = 2112;
        uint64_t v18 = v5;
        _os_log_impl(&dword_22C1AD000, v3, OS_LOG_TYPE_INFO, "Attempting to transfer a live photo with photo URL %@ and video URL %@", (uint8_t *)&v15, 0x16u);
      }
    }
    id v6 = [*(id *)(a1 + 48) createNewOutgoingTransferWithLocalFileURL:*(void *)(a1 + 32)];
    [*(id *)(a1 + 48) setAuxImageForTransfer:v6 value:1];
    uint64_t v7 = [MEMORY[0x263F4AF88] AuxGUIDFromFileTransferGUID:v6];
    [*(id *)(a1 + 48) registerGUID:v7 forNewOutgoingTransferWithLocalURL:*(void *)(a1 + 40)];
    [*(id *)(a1 + 48) setAuxVideoForTransfer:v7 value:1];
    [*(id *)(a1 + 48) registerTransferWithDaemon:v7];
    [*(id *)(a1 + 48) registerTransferWithDaemon:v6];
    [*(id *)(a1 + 56) addObject:v6];
    if (IMOSLoggingEnabled())
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = *(void *)(a1 + 56);
        int v15 = 138412290;
        uint64_t v16 = v9;
        _os_log_impl(&dword_22C1AD000, v8, OS_LOG_TYPE_INFO, "The message's file transfer guids are: %@", (uint8_t *)&v15, 0xCu);
      }
    }
    uint64_t v10 = (void *)(a1 + 56);
    __int16 v11 = objc_msgSend(MEMORY[0x263F086A0], "__im_attributedStringWithFileTransfers:", *(void *)(a1 + 56));
    uint64_t v12 = objc_msgSend(v11, "__im_attributedStringByAssigningMessagePartNumbers");
    uint64_t v13 = *(void *)(a1 + 64);
    uint64_t v14 = [MEMORY[0x263F4A5B8] instantMessageWithText:v12 messageSubject:0 fileTransferGUIDs:*v10 flags:5 threadIdentifier:0];
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);
  }
}

void sub_22C1C1B78(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (IMOSLoggingEnabled())
  {
    uint64_t v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_22C1AD000, v4, OS_LOG_TYPE_INFO, "Photo write completed.", (uint8_t *)&v23, 2u);
    }
  }
  if (v3)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        id v6 = *(void **)(a1 + 32);
        uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
        int v23 = 138412546;
        id v24 = v6;
        __int16 v25 = 2112;
        uint64_t v26 = v7;
        _os_log_impl(&dword_22C1AD000, v5, OS_LOG_TYPE_INFO, "Failed to write the photo (%@) into the MessagesAssistantExtension Sandbox. Error: %@", (uint8_t *)&v23, 0x16u);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    uint64_t v8 = *(void **)(a1 + 48);
    uint64_t v10 = *(void **)(a1 + 56);
    uint64_t v9 = *(void *)(a1 + 64);
    id v11 = *(id *)(a1 + 40);
    id v12 = v8;
    id v13 = v10;
    int v14 = IMOSLoggingEnabled();
    if (v13)
    {
      if (v14)
      {
        int v15 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          int v23 = 138412290;
          id v24 = v13;
          _os_log_impl(&dword_22C1AD000, v15, OS_LOG_TYPE_INFO, "Building a file transfer message based on a file at %@", (uint8_t *)&v23, 0xCu);
        }
      }
      id v16 = objc_alloc_init(MEMORY[0x263EFF980]);
      __int16 v17 = [v12 createNewOutgoingTransferWithLocalFileURL:v13];
      [v12 registerTransferWithDaemon:v17];
      [v16 addObject:v17];
      if (IMOSLoggingEnabled())
      {
        uint64_t v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          int v23 = 138412290;
          id v24 = v16;
          _os_log_impl(&dword_22C1AD000, v18, OS_LOG_TYPE_INFO, "The message's file transfer guids are: %@", (uint8_t *)&v23, 0xCu);
        }
      }
      uint64_t v19 = objc_msgSend(MEMORY[0x263F086A0], "__im_attributedStringWithFileTransfers:", v16);
      int v20 = objc_msgSend(v19, "__im_attributedStringByAssigningMessagePartNumbers");
      __int16 v21 = [MEMORY[0x263F4A5B8] instantMessageWithText:v20 messageSubject:0 fileTransferGUIDs:v16 flags:5 threadIdentifier:0];
    }
    else
    {
      if (v14)
      {
        uint64_t v22 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          LOWORD(v23) = 0;
          _os_log_impl(&dword_22C1AD000, v22, OS_LOG_TYPE_INFO, "Provided localFileAttachmentURL is nil", (uint8_t *)&v23, 2u);
        }
      }
      __int16 v21 = 0;
    }

    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v21);
  }
}

void sub_22C1C1F4C(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (IMOSLoggingEnabled())
  {
    uint64_t v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_22C1AD000, v4, OS_LOG_TYPE_INFO, "Video write completed.", (uint8_t *)&v23, 2u);
    }
  }
  if (v3)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        id v6 = *(void **)(a1 + 32);
        uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
        int v23 = 138412546;
        id v24 = v6;
        __int16 v25 = 2112;
        uint64_t v26 = v7;
        _os_log_impl(&dword_22C1AD000, v5, OS_LOG_TYPE_INFO, "Failed to write the video (%@) into the MessagesAssistantExtension Sandbox. Error: %@", (uint8_t *)&v23, 0x16u);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    uint64_t v8 = *(void **)(a1 + 48);
    uint64_t v10 = *(void **)(a1 + 56);
    uint64_t v9 = *(void *)(a1 + 64);
    id v11 = *(id *)(a1 + 40);
    id v12 = v8;
    id v13 = v10;
    int v14 = IMOSLoggingEnabled();
    if (v13)
    {
      if (v14)
      {
        int v15 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          int v23 = 138412290;
          id v24 = v13;
          _os_log_impl(&dword_22C1AD000, v15, OS_LOG_TYPE_INFO, "Building a file transfer message based on a file at %@", (uint8_t *)&v23, 0xCu);
        }
      }
      id v16 = objc_alloc_init(MEMORY[0x263EFF980]);
      __int16 v17 = [v12 createNewOutgoingTransferWithLocalFileURL:v13];
      [v12 registerTransferWithDaemon:v17];
      [v16 addObject:v17];
      if (IMOSLoggingEnabled())
      {
        uint64_t v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          int v23 = 138412290;
          id v24 = v16;
          _os_log_impl(&dword_22C1AD000, v18, OS_LOG_TYPE_INFO, "The message's file transfer guids are: %@", (uint8_t *)&v23, 0xCu);
        }
      }
      uint64_t v19 = objc_msgSend(MEMORY[0x263F086A0], "__im_attributedStringWithFileTransfers:", v16);
      int v20 = objc_msgSend(v19, "__im_attributedStringByAssigningMessagePartNumbers");
      __int16 v21 = [MEMORY[0x263F4A5B8] instantMessageWithText:v20 messageSubject:0 fileTransferGUIDs:v16 flags:5 threadIdentifier:0];
    }
    else
    {
      if (v14)
      {
        uint64_t v22 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          LOWORD(v23) = 0;
          _os_log_impl(&dword_22C1AD000, v22, OS_LOG_TYPE_INFO, "Provided localFileAttachmentURL is nil", (uint8_t *)&v23, 2u);
        }
      }
      __int16 v21 = 0;
    }

    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v21);
  }
}

uint64_t sub_22C1C2320(uint64_t a1, void *a2)
{
  id v2 = [a2 account];
  uint64_t v3 = [v2 isOperational];

  return v3;
}

id sub_22C1C235C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v28 = v5;
  if (MEMORY[0x230F62610]())
  {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263EFEB28]) initWithStringValue:v6];
    if (v7)
    {
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      uint64_t v8 = [v5 phoneNumbers];
      uint64_t v9 = 0;
      uint64_t v10 = [v8 countByEnumeratingWithState:&v33 objects:v40 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v34 != v11) {
              objc_enumerationMutation(v8);
            }
            id v13 = [*(id *)(*((void *)&v33 + 1) + 8 * i) value];
            int v14 = [v13 isLikePhoneNumber:v7];

            if (v14)
            {
              uint64_t v15 = INPersonHandleLabelForCNLabeledValue();

              uint64_t v9 = (void *)v15;
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v33 objects:v40 count:16];
        }
        while (v10);
      }
    }
    else
    {
      uint64_t v9 = 0;
    }

    uint64_t v24 = 2;
  }
  else if (IMStringIsEmail())
  {
    id v16 = IMNormalizeFormattedString();
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    __int16 v17 = [v5 emailAddresses];
    uint64_t v9 = 0;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v39 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v30 != v19) {
            objc_enumerationMutation(v17);
          }
          __int16 v21 = [*(id *)(*((void *)&v29 + 1) + 8 * j) value];
          uint64_t v22 = IMNormalizeFormattedString();

          if ([v22 isEqual:v16])
          {
            uint64_t v23 = INPersonHandleLabelForCNLabeledValue();

            uint64_t v9 = (void *)v23;
          }
        }
        uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v39 count:16];
      }
      while (v18);
    }

    uint64_t v24 = 1;
  }
  else
  {
    if ((MEMORY[0x230F625F0](v6) & 1) == 0 && IMOSLoggingEnabled())
    {
      __int16 v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v38 = v6;
        _os_log_impl(&dword_22C1AD000, v25, OS_LOG_TYPE_INFO, "Could not determine person handle label or type because [IMHandle normalizedID] was neither a phone number nor an email address: %@", buf, 0xCu);
      }
    }
    uint64_t v24 = 0;
    uint64_t v9 = 0;
  }
  uint64_t v26 = (void *)[objc_alloc(MEMORY[0x263F0FD20]) initWithValue:v6 type:v24 label:v9];

  return v26;
}

uint64_t sub_22C1C26C4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 length])
  {
    if (MEMORY[0x230F62610](v3))
    {
      uint64_t v4 = 1;
    }
    else if (IMStringIsEmail())
    {
      uint64_t v4 = 2;
    }
    else if (MEMORY[0x230F625F0](v3))
    {
      uint64_t v4 = 3;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        id v5 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          int v7 = 138412290;
          id v8 = v3;
          _os_log_impl(&dword_22C1AD000, v5, OS_LOG_TYPE_INFO, "%@ is an invalid personHandle.value.", (uint8_t *)&v7, 0xCu);
        }
      }
      uint64_t v4 = 4;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t sub_22C1C27EC(void *a1)
{
  v1 = [a1 value];
  uint64_t v2 = objc_msgSend(MEMORY[0x263F0FD20], "__im_assistant_handleTypeForString:", v1);

  return v2;
}

id _IMAssistantCoreGeneralSignpostLogHandle()
{
  if (qword_2684A5538 != -1) {
    dispatch_once(&qword_2684A5538, &unk_26DF9B698);
  }
  v0 = (void *)qword_2684A5530;

  return v0;
}

uint64_t sub_22C1C2884()
{
  qword_2684A5530 = (uint64_t)os_log_create("com.apple.Messages", "IMAssistantCore");

  return MEMORY[0x270F9A758]();
}

id _IMAssistantCoreSendMessageSignpostLogHandle()
{
  if (qword_2684A5548 != -1) {
    dispatch_once(&qword_2684A5548, &unk_26DF9B6B8);
  }
  v0 = (void *)qword_2684A5540;

  return v0;
}

uint64_t sub_22C1C291C()
{
  qword_2684A5540 = (uint64_t)os_log_create("com.apple.Messages", "SendMessageIntent");

  return MEMORY[0x270F9A758]();
}

id _IMAssistantCoreSearchForMessageSignpostLogHandle()
{
  if (qword_2684A5558 != -1) {
    dispatch_once(&qword_2684A5558, &unk_26DF9B6D8);
  }
  v0 = (void *)qword_2684A5550;

  return v0;
}

uint64_t sub_22C1C29B4()
{
  qword_2684A5550 = (uint64_t)os_log_create("com.apple.Messages", "SearchForMessageIntent");

  return MEMORY[0x270F9A758]();
}

id sub_22C1C29F8(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 handleID];
  uint64_t v9 = [v6 imHandleWithID:v8];

  uint64_t v10 = [v9 normalizedID];
  uint64_t v11 = (void *)v10;
  if (v10) {
    id v12 = (void *)v10;
  }
  else {
    id v12 = v8;
  }
  id v13 = v12;

  uint64_t v14 = [v9 displayID];
  uint64_t v15 = (void *)v14;
  if (v14) {
    id v16 = (void *)v14;
  }
  else {
    id v16 = v8;
  }
  id v17 = v16;

  uint64_t v18 = [v7 contact];
  uint64_t v19 = [v7 personHandleType];
  int v20 = [v7 personHandleLabel];

  __int16 v21 = objc_msgSend(a1, "__im_assistant_initWithContact:displayFormattedHandle:normalizedHandle:type:label:", v18, v17, v13, v19, v20);

  return v21;
}

id sub_22C1C2B38(void *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 value];
  id v12 = [v10 imHandleWithID:v11];

  if (v12)
  {
    uint64_t v13 = [v9 type];
    uint64_t v14 = [v9 label];
    uint64_t v15 = objc_msgSend(a1, "__im_assistant_initWithContact:imHandle:type:label:", v8, v12, v13, v14);
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

id sub_22C1C2C20(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 normalizedID];
  id v9 = objc_msgSend(MEMORY[0x263F0FD20], "__im_assistant_extractIntentHandleLabelAndTypeFromContact:forNormalizedID:", v7, v8);
  uint64_t v10 = [v9 type];
  uint64_t v11 = [v9 label];
  id v12 = objc_msgSend(a1, "__im_assistant_initWithContact:imHandle:type:label:", v7, v6, v10, v11);

  return v12;
}

id sub_22C1C2CF8(void *a1, uint64_t a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [v11 displayID];
  uint64_t v14 = [v11 normalizedID];

  uint64_t v15 = objc_msgSend(a1, "__im_assistant_initWithContact:displayFormattedHandle:normalizedHandle:type:label:", v12, v13, v14, a5, v10);

  return v15;
}

uint64_t sub_22C1C2DC0(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(a1, "__im_assistant_initWithContact:displayFormattedHandle:normalizedHandle:type:label:", a3, 0, 0, a4, a5);
}

id sub_22C1C2DD4(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, uint64_t a6, void *a7)
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  if (v11)
  {
    uint64_t v15 = [MEMORY[0x263F08A68] componentsForContact:v11];
  }
  else
  {
    uint64_t v15 = 0;
  }
  id v16 = (void *)[objc_alloc(MEMORY[0x263F0FD20]) initWithValue:v12 type:a6 label:v14];
  id v17 = objc_msgSend(MEMORY[0x263F0FD18], "__im_assistant_displayNameForContact:displayFormattedHandle:normalizedHandle:", v11, v12, v13);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v18 = 0;
  }
  else
  {
    uint64_t v18 = [v11 identifier];
  }
  uint64_t v19 = (void *)[objc_alloc(MEMORY[0x263F0FD18]) initWithPersonHandle:v16 nameComponents:v15 displayName:v17 image:0 contactIdentifier:v18 customIdentifier:v13];
  int v20 = [v11 phonemeData];
  [v19 setPhonemeData:v20];

  return v19;
}

id sub_22C1C2F54(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  uint64_t v4 = [v3 normalizedID];
  id v5 = [v3 displayID];

  if (MEMORY[0x230F62610](v4)) {
    uint64_t IsEmail = 2;
  }
  else {
    uint64_t IsEmail = IMStringIsEmail();
  }
  id v7 = (void *)[objc_alloc(MEMORY[0x263F0FD20]) initWithValue:v5 type:IsEmail];
  id v8 = objc_msgSend(MEMORY[0x263F0FD18], "__im_assistant_displayNameForContact:displayFormattedHandle:normalizedHandle:", 0, v5, v4);
  id v9 = (void *)[objc_alloc(MEMORY[0x263F0FD18]) initWithPersonHandle:v7 nameComponents:0 displayName:v8 image:0 contactIdentifier:0 customIdentifier:v4];

  return v9;
}

id sub_22C1C3050(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [MEMORY[0x263F4AF80] sharedFeatureFlags];
  int v11 = [v10 stewieEnabled];

  if (v11 && [v9 isEqualToString:*MEMORY[0x263F4AE50]]) {
    goto LABEL_5;
  }
  id v12 = [MEMORY[0x263F4AF80] sharedFeatureFlags];
  int v13 = [v12 isTranscriptSharingEnabled];

  if (v13)
  {
    id v14 = [(id)*MEMORY[0x263F4AB68] lowercaseString];
    int v15 = [v9 hasSuffix:v14];

    if (v15)
    {
LABEL_5:
      id v16 = IMSharedUtilitiesFrameworkBundle();
      id v17 = [v16 localizedStringForKey:@"TS_NOTIFICATION_EMERGENCY_SUBTITLE_DISPLAYNAME" value:&stru_26DF9B8B8 table:@"IMSharedUtilities-SYDROB_FEATURES"];

      goto LABEL_41;
    }
  }
  char v18 = MEMORY[0x230F625F0](v9);
  uint64_t v19 = v9;
  if ((v18 & 1) != 0 || (int v20 = MEMORY[0x230F625F0](v8), v19 = v8, v20)) {
    id v21 = v19;
  }
  else {
    id v21 = 0;
  }
  if ([v21 length])
  {
    uint64_t v22 = [MEMORY[0x263F4AF30] placeholderNameForBrandURI:v21];
    dispatch_semaphore_t v23 = dispatch_semaphore_create(0);
    uint64_t v44 = 0;
    char v45 = &v44;
    uint64_t v46 = 0x3032000000;
    v47 = sub_22C1C35EC;
    v48 = sub_22C1C35FC;
    id v49 = 0;
    uint64_t v24 = [MEMORY[0x263F4A588] sharedInstance];
    uint64_t v38 = MEMORY[0x263EF8330];
    uint64_t v39 = 3221225472;
    uint64_t v40 = sub_22C1C3604;
    uint64_t v41 = &unk_264912828;
    v43 = &v44;
    __int16 v25 = v23;
    uint64_t v42 = v25;
    uint64_t v26 = [v24 businessNameForUID:v21 updateHandler:&v38];

    if (objc_msgSend(v26, "length", v38, v39, v40, v41))
    {
      int v27 = IMOSLoggingEnabled();
      uint64_t v28 = v26;
      if (v27)
      {
        long long v29 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v51 = v26;
          _os_log_impl(&dword_22C1AD000, v29, OS_LOG_TYPE_INFO, "Using cached business name: %@", buf, 0xCu);
        }

        uint64_t v28 = v26;
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        long long v31 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22C1AD000, v31, OS_LOG_TYPE_INFO, "Business name lookup beginning.", buf, 2u);
        }
      }
      dispatch_time_t v32 = dispatch_time(0, 3000000000);
      if (dispatch_semaphore_wait(v25, v32) && IMOSLoggingEnabled())
      {
        long long v33 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22C1AD000, v33, OS_LOG_TYPE_INFO, "Business name lookup timed out", buf, 2u);
        }
      }
      if (IMOSLoggingEnabled())
      {
        long long v34 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          long long v35 = (void *)v45[5];
          *(_DWORD *)buf = 138412290;
          uint64_t v51 = v35;
          _os_log_impl(&dword_22C1AD000, v34, OS_LOG_TYPE_INFO, "Business name lookup completed with name: %@", buf, 0xCu);
        }
      }
      if (![(id)v45[5] length]) {
        goto LABEL_37;
      }
      uint64_t v28 = (void *)v45[5];
    }
    id v36 = v28;

    uint64_t v22 = v36;
LABEL_37:
    id v17 = v22;

    _Block_object_dispose(&v44, 8);
    goto LABEL_40;
  }
  if (!v7)
  {
LABEL_19:
    if ([v8 length]) {
      id v30 = v8;
    }
    else {
      id v30 = v9;
    }
    id v17 = v30;
    goto LABEL_40;
  }
  id v17 = [MEMORY[0x263EFEA20] stringFromContact:v7 style:0];
  if (![v17 length])
  {

    goto LABEL_19;
  }
LABEL_40:

LABEL_41:

  return v17;
}

uint64_t sub_22C1C35EC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_22C1C35FC(uint64_t a1)
{
}

intptr_t sub_22C1C3604(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v6);
}

id sub_22C1C3654(void *a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF9B0]);
  uint64_t v3 = [a1 contactIdentifier];
  if ([v3 length]) {
    [v2 addObject:v3];
  }
  uint64_t v4 = [a1 siriMatches];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) contactIdentifier];
        if ([v9 length]) {
          [v2 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  id v10 = [v2 array];

  return v10;
}

id sub_22C1C37D0(void *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 address];
  id v9 = [v8 _stripFZIDPrefix];
  id v10 = objc_msgSend(v9, "im_stripCategoryLabel");
  int v11 = IMChatCanonicalIDSIDsForAddress();

  long long v12 = (void *)IDSCopyRawAddressForDestination();
  if (IMOSLoggingEnabled())
  {
    long long v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v20 = 138412290;
      id v21 = v12;
      _os_log_impl(&dword_22C1AD000, v13, OS_LOG_TYPE_INFO, "Normalized handle %@", (uint8_t *)&v20, 0xCu);
    }
  }
  long long v14 = objc_msgSend(MEMORY[0x263F0FD20], "__im_assistant_extractIntentHandleLabelAndTypeFromContact:forNormalizedID:", v7, v12);
  if (v7)
  {
    id v15 = objc_alloc(MEMORY[0x263F0FD18]);
    uint64_t v16 = [v14 type];
    uint64_t v17 = [v14 label];
    char v18 = objc_msgSend(v15, "__im_assistant_initWithContact:displayFormattedHandle:normalizedHandle:type:label:", v7, v12, v12, v16, v17);
  }
  else
  {
    objc_msgSend(a1, "__im_assistant_displayNameForContact:displayFormattedHandle:normalizedHandle:", 0, 0, v12);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    char v18 = (void *)[objc_alloc(MEMORY[0x263F0FD18]) initWithPersonHandle:v14 nameComponents:0 displayName:v15 image:0 contactIdentifier:0 customIdentifier:v12];
  }

  objc_msgSend(v18, "setIsMe:", objc_msgSend(v6, "isMe"));

  return v18;
}

void sub_22C1C3FE4(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 count])
  {
    if ((unint64_t)[v3 count] < 2)
    {
      id v8 = [v3 objectAtIndexedSubscript:0];
      id v9 = *(void **)(a1 + 40);
      id v10 = [*(id *)(a1 + 32) messageIdentifier];
      uint64_t v19 = v10;
      int v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v19 count:1];
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = sub_22C1C42D8;
      v14[3] = &unk_264912850;
      id v18 = *(id *)(a1 + 48);
      id v15 = v8;
      id v12 = *(id *)(a1 + 32);
      uint64_t v13 = *(void *)(a1 + 40);
      id v16 = v12;
      uint64_t v17 = v13;
      id v5 = v8;
      [v9 chatsForMessageIdentifiers:v11 completion:v14];
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v4 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22C1AD000, v4, OS_LOG_TYPE_INFO, "Message identifier has more than one message item associated with it, requiring app launch", buf, 2u);
        }
      }
      id v5 = (id)[objc_alloc(MEMORY[0x263F0FAC0]) initWithCode:5 userActivity:0];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        id v7 = [*(id *)(a1 + 32) messageIdentifier];
        *(_DWORD *)buf = 138412290;
        id v21 = v7;
        _os_log_impl(&dword_22C1AD000, v6, OS_LOG_TYPE_INFO, "No messages found that match the provided identifier %@", buf, 0xCu);
      }
    }
    id v5 = (id)[objc_alloc(MEMORY[0x263F0FAC0]) initWithCode:6 userActivity:0];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_22C1C42D8(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 count])
  {
    uint64_t v4 = [v3 objectAtIndexedSubscript:0];
    if ([v4 allowedByScreenTime])
    {
      if ([v4 isMemberOfChat])
      {
        if ([v4 supportsCapabilities:1])
        {
          if (([*(id *)(a1 + 32) isAudioMessage] & 1) != 0
            || [*(id *)(a1 + 32) isFileAttachment])
          {
            if (IMOSLoggingEnabled())
            {
              id v5 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_22C1AD000, v5, OS_LOG_TYPE_INFO, "Message type does not support editing", buf, 2u);
              }
            }
            id v6 = (void *)[objc_alloc(MEMORY[0x263F0FAC0]) initWithCode:8 userActivity:0];
            (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
          }
          else
          {
            id v6 = [*(id *)(a1 + 32) body];
            long long v33 = objc_msgSend(v6, "__im_messagePartIndexes");
            uint64_t v12 = [v33 count];
            int v13 = IMOSLoggingEnabled();
            if (v12 == 1)
            {
              if (v13)
              {
                long long v14 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 134217984;
                  uint64_t v35 = [v33 firstIndex];
                  _os_log_impl(&dword_22C1AD000, v14, OS_LOG_TYPE_INFO, "Determining edit eligiblity of message part with index %lu", buf, 0xCu);
                }
              }
              switch(objc_msgSend(*(id *)(a1 + 32), "eligibilityForEditType:messagePartIndex:", 1, objc_msgSend(v33, "firstIndex")))
              {
                case 0:
                  if (IMOSLoggingEnabled())
                  {
                    id v15 = OSLogHandleForIMFoundationCategory();
                    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_22C1AD000, v15, OS_LOG_TYPE_INFO, "Messages is eligible for editing", buf, 2u);
                    }
                  }
                  goto LABEL_47;
                case 1:
                  if (!IMOSLoggingEnabled()) {
                    goto LABEL_88;
                  }
                  dispatch_semaphore_t v23 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_22C1AD000, v23, OS_LOG_TYPE_INFO, "Messages from different senders cannot be edited", buf, 2u);
                  }
                  break;
                case 2:
                  if (IMOSLoggingEnabled())
                  {
                    int v20 = OSLogHandleForIMFoundationCategory();
                    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_22C1AD000, v20, OS_LOG_TYPE_INFO, "Message service does not support editing", buf, 2u);
                    }
                  }
                  int v16 = 0;
                  uint64_t v17 = 9;
                  goto LABEL_89;
                case 3:
                  if (IMOSLoggingEnabled())
                  {
                    id v21 = OSLogHandleForIMFoundationCategory();
                    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_22C1AD000, v21, OS_LOG_TYPE_INFO, "Message is too old to be edited", buf, 2u);
                    }
                  }
                  int v16 = 0;
                  uint64_t v17 = 7;
                  goto LABEL_89;
                case 4:
                  if (IMOSLoggingEnabled())
                  {
                    uint64_t v22 = OSLogHandleForIMFoundationCategory();
                    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_22C1AD000, v22, OS_LOG_TYPE_INFO, "Plugin message types do not support editing", buf, 2u);
                    }
                  }
                  int v16 = 0;
                  uint64_t v17 = 8;
                  goto LABEL_89;
                case 5:
                  if (!IMOSLoggingEnabled()) {
                    goto LABEL_88;
                  }
                  dispatch_semaphore_t v23 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_22C1AD000, v23, OS_LOG_TYPE_INFO, "Messages has been edited too many times", buf, 2u);
                  }
                  break;
                case 6:
                  if (!IMOSLoggingEnabled()) {
                    goto LABEL_88;
                  }
                  dispatch_semaphore_t v23 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_22C1AD000, v23, OS_LOG_TYPE_INFO, "Messages is currently sending", buf, 2u);
                  }
                  break;
                case 7:
                  if (!IMOSLoggingEnabled()) {
                    goto LABEL_88;
                  }
                  dispatch_semaphore_t v23 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_22C1AD000, v23, OS_LOG_TYPE_INFO, "Scheduled Messages is assumed to be sent but not yet received ack from server for sending", buf, 2u);
                  }
                  break;
                case 8:
                  if (!IMOSLoggingEnabled()) {
                    goto LABEL_88;
                  }
                  dispatch_semaphore_t v23 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_22C1AD000, v23, OS_LOG_TYPE_INFO, "Scheduled message is in a failed state and can't be edited.", buf, 2u);
                  }
                  break;
                default:
LABEL_47:
                  int v16 = 1;
                  uint64_t v17 = 3;
                  goto LABEL_89;
              }

LABEL_88:
              int v16 = 0;
              uint64_t v17 = 4;
LABEL_89:
              uint64_t v19 = (void *)[objc_alloc(MEMORY[0x263F0FAC0]) initWithCode:v17 userActivity:0];
              if (v16)
              {
                id v30 = (void *)MEMORY[0x263F4AFC0];
                uint64_t v24 = *(void **)(a1 + 32);
                dispatch_time_t v32 = [v24 body];
                long long v31 = objc_msgSend(v32, "__im_messagePartIndexes");
                uint64_t v25 = [v31 firstIndex];
                id v26 = objc_alloc(MEMORY[0x263F086A0]);
                int v27 = [*(id *)(a1 + 40) editedContent];
                uint64_t v28 = (void *)[v26 initWithString:v27];
                long long v29 = [v30 editedMessageItemWithOriginalMessageItem:v24 editedPartIndex:v25 newPartText:v28];

                [*(id *)(a1 + 48) sendEditedMessageItem:v29 originalMessageItem:*(void *)(a1 + 32) chat:v4 backwardCompatabilityText:0];
              }
              (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
            }
            else
            {
              if (v13)
              {
                id v18 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_22C1AD000, v18, OS_LOG_TYPE_INFO, "Message has more than one part, requiring app launch", buf, 2u);
                }
              }
              uint64_t v19 = (void *)[objc_alloc(MEMORY[0x263F0FAC0]) initWithCode:5 userActivity:0];
              (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
            }
          }
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            int v11 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_22C1AD000, v11, OS_LOG_TYPE_INFO, "capability does not support editing", buf, 2u);
            }
          }
          id v6 = (void *)[objc_alloc(MEMORY[0x263F0FAC0]) initWithCode:9 userActivity:0];
          (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
        }
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          id v10 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v35 = (uint64_t)v4;
            _os_log_impl(&dword_22C1AD000, v10, OS_LOG_TYPE_INFO, "Will not send to chat in Un-Joined state: %@", buf, 0xCu);
          }
        }
        id v6 = (void *)[objc_alloc(MEMORY[0x263F0FAC0]) initWithCode:11 userActivity:0];
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      }
    }
    else
    {
      if ([v4 allowedToShowConversationSync]) {
        uint64_t v8 = 12;
      }
      else {
        uint64_t v8 = 13;
      }
      if (IMOSLoggingEnabled())
      {
        id v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22C1AD000, v9, OS_LOG_TYPE_INFO, "ScreenTime or DownTime restriction is in-place, returning", buf, 2u);
        }
      }
      id v6 = (void *)[objc_alloc(MEMORY[0x263F0FAC0]) initWithCode:v8 userActivity:0];
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C1AD000, v7, OS_LOG_TYPE_INFO, "No chats found for message identifiers", buf, 2u);
      }
    }
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F0FAC0]) initWithCode:4 userActivity:0];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void sub_22C1C4C20(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x22C1C4B10);
  }
  _Unwind_Resume(a1);
}

void sub_22C1C4F70(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 count])
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v15;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v8), "chatIdentifier", (void)v14);
          [v4 addObject:v9];

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v6);
    }

    if (IMOSLoggingEnabled())
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v4;
        _os_log_impl(&dword_22C1AD000, v10, OS_LOG_TYPE_INFO, "Searching for chat corresponding to conversation identifiers %@", buf, 0xCu);
      }
    }
    int v11 = objc_msgSend(*(id *)(a1 + 40), "chatsWithConversationIdentifiers:", v4, (void)v14);
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v13 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        id v20 = v13;
        _os_log_impl(&dword_22C1AD000, v12, OS_LOG_TYPE_INFO, "Exptected at least one message matching the message identifiers %@", buf, 0xCu);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

id sub_22C1C51E4(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v11[3] = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_22C1C52D8;
  v8[3] = &unk_2649128A0;
  id v5 = v4;
  id v9 = v5;
  id v10 = v11;
  uint64_t v6 = objc_msgSend(a1, "__imArrayByApplyingBlock:", v8);

  _Block_object_dispose(v11, 8);

  return v6;
}

void sub_22C1C52C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_22C1C52D8(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return result;
}

void sub_22C1C55F0(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v5;
      _os_log_impl(&dword_22C1AD000, v7, OS_LOG_TYPE_INFO, "Calling resolveRecipients completion handler with result: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v8 = _IMAssistantCoreSearchForMessageSignpostLogHandle();
  id v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v9, OS_SIGNPOST_INTERVAL_END, v10, "resolveRecipientsForSearchForMessages", (const char *)&unk_22C1E071B, (uint8_t *)&v11, 2u);
  }
}

void sub_22C1C5944(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v5;
      _os_log_impl(&dword_22C1AD000, v7, OS_LOG_TYPE_INFO, "Calling resolveSenders completion handler with result: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  uint64_t v8 = _IMAssistantCoreSearchForMessageSignpostLogHandle();
  id v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v9, OS_SIGNPOST_INTERVAL_END, v10, "resolveSendersForSearchForMessages", (const char *)&unk_22C1E071B, (uint8_t *)&v11, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_22C1C622C(void *a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = a1 + 5;
  id v3 = (void *)a1[4];
  id v4 = [(id)a1[5] speakableGroupNames];
  id v5 = [v3 resolveSpeakableGroupNames:v4 forIntent:*v2];

  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      int v11 = v5;
      _os_log_impl(&dword_22C1AD000, v6, OS_LOG_TYPE_INFO, "Calling resolveSpeakableGroupNames completion handler with results: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  uint64_t v7 = _IMAssistantCoreSearchForMessageSignpostLogHandle();
  uint64_t v8 = v7;
  os_signpost_id_t v9 = a1[7];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v10) = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v8, OS_SIGNPOST_INTERVAL_END, v9, "resolveSpeakableGroupNamesForSearchForMessages", (const char *)&unk_22C1E071B, (uint8_t *)&v10, 2u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

uint64_t sub_22C1C63AC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_22C1C658C(uint64_t a1)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v3;
      _os_log_impl(&dword_22C1AD000, v2, OS_LOG_TYPE_INFO, "Performing intent: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  id v4 = [*(id *)(a1 + 40) messageHandlerDataSource];
  id v5 = [v4 accountDataSource];
  char v6 = [v5 hasMessagingAccount];

  if (v6)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v48 = 0x3032000000;
    id v49 = sub_22C1C6BC8;
    v50 = sub_22C1C6BD8;
    id v51 = 0;
    uint64_t v39 = 0;
    uint64_t v40 = &v39;
    uint64_t v41 = 0x3032000000;
    uint64_t v42 = sub_22C1C6BC8;
    v43 = sub_22C1C6BD8;
    id v44 = 0;
    uint64_t v7 = [*(id *)(a1 + 32) identifiers];
    BOOL v8 = [v7 count] == 0;

    if (v8)
    {
      uint64_t v22 = [*(id *)(a1 + 32) notificationIdentifiers];
      BOOL v23 = [v22 count] == 0;

      if (v23)
      {
        uint64_t v28 = *(void *)(a1 + 32);
        int v27 = *(void **)(a1 + 40);
        v38[0] = MEMORY[0x263EF8330];
        v38[1] = 3221225472;
        v38[2] = sub_22C1C6BE0;
        v38[3] = &unk_264912940;
        v38[4] = &buf;
        v38[5] = &v39;
        [v27 resolveRecipientsAndSender:v28 withCompletion:v38];
        uint64_t v12 = [*(id *)(a1 + 32) contents];
        long long v14 = [*(id *)(a1 + 32) speakableGroupNames];
        long long v15 = [*(id *)(a1 + 32) conversationIdentifiers];
        long long v16 = [*(id *)(a1 + 32) dateTimeRange];
        long long v17 = 0;
        uint64_t v13 = 0;
        uint64_t v34 = [*(id *)(a1 + 32) attributes];
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v24 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            uint64_t v25 = [*(id *)(a1 + 32) notificationIdentifiers];
            int v26 = [v25 count];
            *(_DWORD *)char v45 = 67109120;
            int v46 = v26;
            _os_log_impl(&dword_22C1AD000, v24, OS_LOG_TYPE_INFO, "Intent with %u notificationIdentifiers, looking at only unread messages from those threads", v45, 8u);
          }
        }
        [*(id *)(a1 + 32) notificationIdentifiers];
        uint64_t v12 = 0;
        long long v17 = 0;
        long long v14 = 0;
        long long v15 = 0;
        long long v16 = 0;
        uint64_t v13 = v34 = 2;
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        os_signpost_id_t v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          int v10 = [*(id *)(a1 + 32) identifiers];
          int v11 = [v10 count];
          *(_DWORD *)char v45 = 67109120;
          int v46 = v11;
          _os_log_impl(&dword_22C1AD000, v9, OS_LOG_TYPE_INFO, "Intent with %u identifiers, looking at both unread and read messages", v45, 8u);
        }
      }
      [*(id *)(a1 + 32) identifiers];
      uint64_t v12 = 0;
      uint64_t v13 = 0;
      long long v14 = 0;
      long long v15 = 0;
      long long v16 = 0;
      long long v17 = v34 = 3;
    }
    uint64_t v29 = a1;
    id v30 = *(void **)(a1 + 40);
    uint64_t v31 = *(void *)(*((void *)&buf + 1) + 40);
    uint64_t v32 = v40[5];
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = sub_22C1C6C80;
    v35[3] = &unk_264912488;
    long long v33 = *(void **)(v29 + 48);
    uint64_t v37 = *(void *)(v29 + 56);
    id v36 = v33;
    [v30 searchMessagesWithContents:v12 messageIdentifiers:v17 notificationIdentifiers:v13 chatNames:v14 conversationIdentifiers:v15 recipients:v31 senders:v32 dateTimeRange:v16 attributes:v34 completion:v35];

    _Block_object_dispose(&v39, 8);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_22C1AD000, v18, OS_LOG_TYPE_INFO, "Could not search for messages; no messaging accounts available",
          (uint8_t *)&buf,
          2u);
      }
    }
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x263F0FE88]) initWithCode:6 userActivity:0];
    uint64_t v19 = _IMAssistantCoreSearchForMessageSignpostLogHandle();
    id v20 = v19;
    os_signpost_id_t v21 = *(void *)(a1 + 56);
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_22C1AD000, v20, OS_SIGNPOST_INTERVAL_END, v21, "handleSearchForMessages", (const char *)&unk_22C1E071B, (uint8_t *)&buf, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_22C1C6B24(_Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  if (a2 == 1)
  {
    objc_begin_catch(exc_buf);
    objc_end_catch();
    JUMPOUT(0x22C1C6920);
  }
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Unwind_Resume(exc_buf);
}

uint64_t sub_22C1C6BC8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_22C1C6BD8(uint64_t a1)
{
}

void sub_22C1C6BE0(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v8 = a3;
  id v7 = a4;
  if ([v8 count]) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
  if ([v7 count]) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a4);
  }
}

void sub_22C1C6C80(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x263F0FE88]) initWithCode:3 userActivity:0];
    [v4 setMessages:v3];
    if (IMOSLoggingEnabled())
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v12 = 134217984;
        uint64_t v13 = [v3 count];
        _os_log_impl(&dword_22C1AD000, v5, OS_LOG_TYPE_INFO, "Returning success response with %ld messages", (uint8_t *)&v12, 0xCu);
      }
    }
    char v6 = _IMAssistantCoreSearchForMessageSignpostLogHandle();
    id v7 = v6;
    os_signpost_id_t v8 = *(void *)(a1 + 40);
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      LOWORD(v12) = 0;
      _os_signpost_emit_with_name_impl(&dword_22C1AD000, v7, OS_SIGNPOST_INTERVAL_END, v8, "handleSearchForMessages", (const char *)&unk_22C1E071B, (uint8_t *)&v12, 2u);
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      os_signpost_id_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_22C1AD000, v9, OS_LOG_TYPE_INFO, "Message search returned nil results (e.g. an exception was caught). Returning intent failure response.", (uint8_t *)&v12, 2u);
      }
    }
    id v4 = (void *)[objc_alloc(MEMORY[0x263F0FE88]) initWithCode:4 userActivity:0];
    int v10 = _IMAssistantCoreSearchForMessageSignpostLogHandle();
    id v7 = v10;
    os_signpost_id_t v11 = *(void *)(a1 + 40);
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      LOWORD(v12) = 0;
      _os_signpost_emit_with_name_impl(&dword_22C1AD000, v7, OS_SIGNPOST_INTERVAL_END, v11, "handleSearchForMessages", (const char *)&unk_22C1E071B, (uint8_t *)&v12, 2u);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_22C1C6F10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_22C1C7000(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = *(void **)(a1 + 40);
    os_signpost_id_t v8 = [*(id *)(a1 + 32) senders];
    os_signpost_id_t v9 = *(void **)(a1 + 32);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = sub_22C1C71F4;
    v12[3] = &unk_264912968;
    id v13 = v9;
    id v15 = *(id *)(a1 + 48);
    id v14 = v6;
    [v7 resolvePersons:v8 forIntent:v13 completionHandler:v12];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      int v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        os_signpost_id_t v11 = [*(id *)(a1 + 32) recipients];
        *(_DWORD *)long long buf = 138412290;
        long long v17 = v11;
        _os_log_impl(&dword_22C1AD000, v10, OS_LOG_TYPE_INFO, "IMAssistantMessageSearchHandler: Failed to resolve recipients: %@", buf, 0xCu);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_22C1C71F4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        os_signpost_id_t v8 = [*(id *)(a1 + 32) senders];
        int v9 = 138412290;
        int v10 = v8;
        _os_log_impl(&dword_22C1AD000, v7, OS_LOG_TYPE_INFO, "IMAssistantMessageSearchHandler: Failed to resolve senders: %@", (uint8_t *)&v9, 0xCu);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

id sub_22C1C7954(void *a1)
{
  if (![MEMORY[0x263F4A610] iMessageEnabledForSenderLastAddressedHandle:0 simID:0]
    || ([MEMORY[0x263F4A608] iMessageService],
        id v2 = objc_claimAutoreleasedReturnValue(),
        [a1 bestAccountForService:v2],
        id v3 = objc_claimAutoreleasedReturnValue(),
        v2,
        !v3))
  {
    if ([MEMORY[0x263F4A610] smsEnabled])
    {
      id v4 = [MEMORY[0x263F4A608] smsService];
      id v3 = [a1 bestAccountForService:v4];
    }
    else
    {
      id v3 = 0;
    }
  }

  return v3;
}

void sub_22C1C7C88(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 count])
  {
    id v4 = *(void **)(a1 + 40);
    id v5 = [*(id *)(a1 + 32) messageIdentifiers];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = sub_22C1C7E88;
    v11[3] = &unk_264912990;
    id v12 = *(id *)(a1 + 32);
    id v15 = *(id *)(a1 + 48);
    id v6 = v3;
    uint64_t v7 = *(void *)(a1 + 40);
    id v13 = v6;
    uint64_t v14 = v7;
    [v4 chatsForMessageIdentifiers:v5 completion:v11];

    os_signpost_id_t v8 = v12;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      int v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v10 = [*(id *)(a1 + 32) identifier];
        *(_DWORD *)long long buf = 138412290;
        long long v17 = v10;
        _os_log_impl(&dword_22C1AD000, v9, OS_LOG_TYPE_INFO, "Exptected at least one message matching the message identifier %@", buf, 0xCu);
      }
    }
    os_signpost_id_t v8 = (void *)[objc_alloc(MEMORY[0x263F10088]) initWithCode:6 userActivity:0];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_22C1C7E88(uint64_t a1, void *a2)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v43 = a2;
  uint64_t v3 = [v43 count];
  id v4 = [*(id *)(a1 + 32) messageIdentifiers];
  uint64_t v5 = [v4 count];

  if (v3 != v5)
  {
    if (IMOSLoggingEnabled())
    {
      id v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_22C1AD000, v15, OS_LOG_TYPE_INFO, "No chats found for message identifiers", buf, 2u);
      }
    }
    id v14 = (id)[objc_alloc(MEMORY[0x263F10088]) initWithCode:4 userActivity:0];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    goto LABEL_36;
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v6 = v43;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v48 objects:v55 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v49 != v8) {
          objc_enumerationMutation(v6);
        }
        int v10 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        if (([v10 allowedByScreenTime] & 1) == 0)
        {
          if ([v10 allowedToShowConversationSync]) {
            uint64_t v16 = 12;
          }
          else {
            uint64_t v16 = 13;
          }
          if (IMOSLoggingEnabled())
          {
            long long v17 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl(&dword_22C1AD000, v17, OS_LOG_TYPE_INFO, "ScreenTime or DownTime restriction is in-place, returning", buf, 2u);
            }
          }
          uint64_t v18 = (void *)[objc_alloc(MEMORY[0x263F10088]) initWithCode:v16 userActivity:0];
          (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
          goto LABEL_35;
        }
        if (([v10 isMemberOfChat] & 1) == 0)
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v19 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)long long buf = 138412290;
              id v54 = v10;
              _os_log_impl(&dword_22C1AD000, v19, OS_LOG_TYPE_INFO, "Will not send to chat in Un-Joined state: %@", buf, 0xCu);
            }
          }
          uint64_t v18 = (void *)[objc_alloc(MEMORY[0x263F10088]) initWithCode:11 userActivity:0];
          (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_35:

          id v14 = v6;
          goto LABEL_36;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v48 objects:v55 count:16];
    }
    while (v7);
  }

  uint64_t v11 = [MEMORY[0x263F4A548] sharedInstance];
  int v12 = [v11 isSatelliteConnectionActive];

  if (v12)
  {
    if (IMOSLoggingEnabled())
    {
      id v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_22C1AD000, v13, OS_LOG_TYPE_INFO, "Message satellite service does not support retraction", buf, 2u);
      }
    }
    id v14 = (id)[objc_alloc(MEMORY[0x263F10088]) initWithCode:9 userActivity:0];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    goto LABEL_36;
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v14 = *(id *)(a1 + 40);
  uint64_t v41 = [v14 countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (!v41) {
    goto LABEL_51;
  }
  uint64_t v39 = *(void *)v45;
  uint64_t v40 = 0;
  *(void *)&long long v20 = 138412290;
  long long v38 = v20;
  while (2)
  {
    for (uint64_t j = 0; j != v41; ++j)
    {
      if (*(void *)v45 != v39) {
        objc_enumerationMutation(v14);
      }
      uint64_t v22 = *(void **)(*((void *)&v44 + 1) + 8 * j);
      uint64_t v42 = objc_msgSend(v22, "body", v38);
      BOOL v23 = objc_msgSend(v42, "__im_messagePartIndexes");
      if ([v23 count] != 1)
      {
        if (IMOSLoggingEnabled())
        {
          long long v33 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_22C1AD000, v33, OS_LOG_TYPE_INFO, "Message has more than one part, requiring app launch", buf, 2u);
          }
        }
        uint64_t v32 = (void *)[objc_alloc(MEMORY[0x263F10088]) initWithCode:5 userActivity:0];
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
        goto LABEL_83;
      }
      uint64_t v24 = [v23 firstIndex];
      uint64_t v25 = [v22 eligibilityForEditType:2 messagePartIndex:v40 + j];
      if (!(!v27 & v26))
      {
        switch(v25)
        {
          case 1:
            if (IMOSLoggingEnabled())
            {
              uint64_t v34 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)long long buf = 0;
                _os_log_impl(&dword_22C1AD000, v34, OS_LOG_TYPE_INFO, "Messages from different senders cannot be retracted", buf, 2u);
              }
            }
            goto LABEL_82;
          case 2:
          case 4:
            if (IMOSLoggingEnabled())
            {
              uint64_t v31 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)long long buf = 0;
                _os_log_impl(&dword_22C1AD000, v31, OS_LOG_TYPE_INFO, "Message type does not support retraction", buf, 2u);
              }
            }
            uint64_t v32 = (void *)[objc_alloc(MEMORY[0x263F10088]) initWithCode:8 userActivity:0];
            (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
            break;
          case 3:
            if (IMOSLoggingEnabled())
            {
              uint64_t v35 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)long long buf = 0;
                _os_log_impl(&dword_22C1AD000, v35, OS_LOG_TYPE_INFO, "Message is too old to be retracted", buf, 2u);
              }
            }
            uint64_t v32 = (void *)[objc_alloc(MEMORY[0x263F10088]) initWithCode:7 userActivity:0];
            (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
            break;
          case 5:
            if (IMOSLoggingEnabled())
            {
              id v36 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)long long buf = 0;
                _os_log_impl(&dword_22C1AD000, v36, OS_LOG_TYPE_INFO, "Messages has been edited too many times", buf, 2u);
              }
            }
            goto LABEL_82;
          case 6:
            if (IMOSLoggingEnabled())
            {
              uint64_t v37 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)long long buf = 0;
                _os_log_impl(&dword_22C1AD000, v37, OS_LOG_TYPE_INFO, "Messages is currently sending", buf, 2u);
              }
            }
LABEL_82:
            uint64_t v32 = (void *)[objc_alloc(MEMORY[0x263F10088]) initWithCode:4 userActivity:0];
            (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
            break;
          default:
            JUMPOUT(0);
        }
LABEL_83:

        goto LABEL_36;
      }
      if (IMOSLoggingEnabled())
      {
        uint64_t v28 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          uint64_t v29 = [v22 guid];
          *(_DWORD *)long long buf = v38;
          id v54 = v29;
          _os_log_impl(&dword_22C1AD000, v28, OS_LOG_TYPE_INFO, "Retracting message with identifier %@", buf, 0xCu);
        }
      }
      id v30 = [v6 objectAtIndexedSubscript:v40 + j];
      [*(id *)(a1 + 48) retractPartIndex:v24 fromMessageItem:v22 chat:v30 backwardCompatabilityText:0];
    }
    uint64_t v41 = [v14 countByEnumeratingWithState:&v44 objects:v52 count:16];
    v40 += j;
    if (v41) {
      continue;
    }
    break;
  }
LABEL_51:

  id v14 = (id)[objc_alloc(MEMORY[0x263F10088]) initWithCode:3 userActivity:0];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_36:
}

void sub_22C1C897C(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 count])
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v15;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v5);
          }
          int v9 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v8), "chatIdentifier", (void)v14);
          [v4 addObject:v9];

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v6);
    }

    if (IMOSLoggingEnabled())
    {
      int v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        id v20 = v4;
        _os_log_impl(&dword_22C1AD000, v10, OS_LOG_TYPE_INFO, "Searching for chat corresponding to conversation identifiers %@", buf, 0xCu);
      }
    }
    uint64_t v11 = objc_msgSend(*(id *)(a1 + 40), "chatsWithConversationIdentifiers:", v4, (void)v14);
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      int v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        id v13 = *(void **)(a1 + 32);
        *(_DWORD *)long long buf = 138412290;
        id v20 = v13;
        _os_log_impl(&dword_22C1AD000, v12, OS_LOG_TYPE_INFO, "Exptected at least one message matching the message identifiers %@", buf, 0xCu);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_22C1C903C(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = IMOSLoggingEnabled();
  if (v3)
  {
    if (v4)
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v18 = 138412290;
        id v19 = v3;
        _os_log_impl(&dword_22C1AD000, v5, OS_LOG_TYPE_INFO, "Play audioURL: %@", (uint8_t *)&v18, 0xCu);
      }
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    uint64_t v7 = [*(id *)(a1 + 40) messageIdentifier];
    uint64_t v8 = [WeakRetained createAudioPlayerWithIdentifier:v7];
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = *(void **)(v9 + 32);
    *(void *)(v9 + 32) = v8;

    uint64_t v11 = *(void **)(*(void *)(a1 + 32) + 32);
    if (v11 && [v11 startPlayingAudioURL:v3])
    {
      if (IMOSLoggingEnabled())
      {
        int v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          LOWORD(v18) = 0;
          _os_log_impl(&dword_22C1AD000, v12, OS_LOG_TYPE_INFO, "Started playing audio", (uint8_t *)&v18, 2u);
        }
      }
      uint64_t v13 = [*(id *)(a1 + 48) copy];
      uint64_t v14 = *(void *)(a1 + 32);
      long long v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        long long v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          LOWORD(v18) = 0;
          _os_log_impl(&dword_22C1AD000, v16, OS_LOG_TYPE_INFO, "Failed to play audio", (uint8_t *)&v18, 2u);
        }
      }
      long long v15 = (void *)[objc_alloc(MEMORY[0x263F0FD40]) initWithCode:5 userActivity:0];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    if (v4)
    {
      long long v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_22C1AD000, v17, OS_LOG_TYPE_INFO, "Could not find audioURL", (uint8_t *)&v18, 2u);
      }
    }
    long long v15 = (void *)[objc_alloc(MEMORY[0x263F0FD40]) initWithCode:6 userActivity:0];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_22C1C94A8(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (IMOSLoggingEnabled())
  {
    int v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_22C1AD000, v4, OS_LOG_TYPE_INFO, "Confirm intent completion audioURL: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  if (v3) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 6;
  }
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F0FD40]) initWithCode:v5 userActivity:0];
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
}

void sub_22C1C96F0(uint64_t a1, void *a2)
{
  id v7 = [a2 firstObject];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = [v7 attachments];
  uint64_t v5 = [v4 firstObject];
  uint64_t v6 = [v5 fileUrl];
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v6);
}

uint64_t sub_22C1CA18C(void *a1)
{
  unint64_t v2 = [a1 joinState];
  if (v2 < 2) {
    return [a1 isGroupChat] ^ 1;
  }
  else {
    return v2 - 2 <= 1;
  }
}

void sub_22C1CC360()
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v0 = _IMAssistantCoreGeneralSignpostLogHandle();
  os_signpost_id_t v1 = os_signpost_id_generate(v0);

  unint64_t v2 = _IMAssistantCoreGeneralSignpostLogHandle();
  uint64_t v3 = v2;
  if (v1 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    LOWORD(v19) = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v1, "imDaemonControllerConnection", (const char *)&unk_22C1E071B, (uint8_t *)&v19, 2u);
  }

  if (IMOSLoggingEnabled())
  {
    int v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_22C1AD000, v4, OS_LOG_TYPE_INFO, "Connecting to IMDaemonController", (uint8_t *)&v19, 2u);
    }
  }
  uint64_t v5 = [MEMORY[0x263EFF910] date];
  uint64_t v6 = [MEMORY[0x263F4A568] sharedInstance];
  [v6 addListenerID:@"IMAssistantCore" capabilities:*MEMORY[0x263F4A680] | *MEMORY[0x263F4A670] | *MEMORY[0x263F4A658] | *MEMORY[0x263F4A678] | (*MEMORY[0x263F4A688] | *MEMORY[0x263F4A660]) | *MEMORY[0x263F4A690] | *MEMORY[0x263F4A668]];

  id v7 = [MEMORY[0x263F4A568] sharedInstance];
  [v7 blockUntilConnected];

  int v8 = [MEMORY[0x263F4A568] sharedInstance];
  [v8 _setBlocksConnectionAtResume:1];

  uint64_t v9 = [MEMORY[0x263EFF910] date];
  uint64_t v10 = (void *)qword_2684A5568;
  qword_2684A5568 = v9;

  [(id)qword_2684A5568 timeIntervalSinceDate:v5];
  uint64_t v12 = v11;
  if (IMOSLoggingEnabled())
  {
    uint64_t v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = [MEMORY[0x263F4A568] sharedInstance];
      int v15 = [v14 isConnected];
      long long v16 = @"NO";
      if (v15) {
        long long v16 = @"YES";
      }
      int v19 = 134218242;
      uint64_t v20 = v12;
      __int16 v21 = 2112;
      uint64_t v22 = v16;
      _os_log_impl(&dword_22C1AD000, v13, OS_LOG_TYPE_INFO, "IMDaemonController blockUntilConnected completed in %.4f seconds. Connected: %@", (uint8_t *)&v19, 0x16u);
    }
  }
  long long v17 = _IMAssistantCoreGeneralSignpostLogHandle();
  int v18 = v17;
  if (v1 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v17))
  {
    LOWORD(v19) = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v18, OS_SIGNPOST_INTERVAL_END, v1, "imDaemonControllerConnection", (const char *)&unk_22C1E071B, (uint8_t *)&v19, 2u);
  }
}

void sub_22C1CC7D4()
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v0 = [(id)objc_opt_class() connectToIMDaemonController];
  [v0 timeIntervalSinceNow];
  double v2 = fabs(v1);
  if (v2 >= 5.0)
  {
    int v4 = _IMAssistantCoreGeneralSignpostLogHandle();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);

    uint64_t v6 = _IMAssistantCoreGeneralSignpostLogHandle();
    id v7 = v6;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      LOWORD(v14) = 0;
      _os_signpost_emit_with_name_impl(&dword_22C1AD000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "imSystemMonitorSuspendAndResume", (const char *)&unk_22C1E071B, (uint8_t *)&v14, 2u);
    }

    if (IMOSLoggingEnabled())
    {
      int v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_22C1AD000, v8, OS_LOG_TYPE_INFO, "Calling IMSystemMonitor _forceSuspended and _forceResumed", (uint8_t *)&v14, 2u);
      }
    }
    uint64_t v9 = [MEMORY[0x263F4A620] sharedInstance];
    [v9 _forceSuspended];

    uint64_t v10 = [MEMORY[0x263F4A620] sharedInstance];
    [v10 _forceResumed];

    if (IMOSLoggingEnabled())
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_22C1AD000, v11, OS_LOG_TYPE_INFO, "IMSystemMonitor _forceResumed completed", (uint8_t *)&v14, 2u);
      }
    }
    uint64_t v12 = _IMAssistantCoreGeneralSignpostLogHandle();
    uint64_t v13 = v12;
    if (v5 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v12))
    {
      LOWORD(v14) = 0;
      _os_signpost_emit_with_name_impl(&dword_22C1AD000, v13, OS_SIGNPOST_INTERVAL_END, v5, "imSystemMonitorSuspendAndResume", (const char *)&unk_22C1E071B, (uint8_t *)&v14, 2u);
    }
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v14 = 134217984;
      double v15 = v2;
      _os_log_impl(&dword_22C1AD000, v3, OS_LOG_TYPE_INFO, "Not triggering IMDaemonController reconnect. Connection was established %.4f seconds ago.", (uint8_t *)&v14, 0xCu);
    }
  }
}

uint64_t sub_22C1CCAB8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_22C1CCD18()
{
  qword_2684A5570 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return MEMORY[0x270F9A758]();
}

uint64_t sub_22C1CCDF4()
{
  qword_2684A5580 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return MEMORY[0x270F9A758]();
}

uint64_t sub_22C1CD318()
{
  qword_2684A5590 = (uint64_t)objc_alloc_init(MEMORY[0x263EFF8E0]);

  return MEMORY[0x270F9A758]();
}

uint64_t sub_22C1CD3BC()
{
  qword_2684A55A0 = (uint64_t)objc_alloc_init(MEMORY[0x263EFF8E0]);

  return MEMORY[0x270F9A758]();
}

uint64_t sub_22C1CD460()
{
  qword_2684A55B0 = (uint64_t)objc_alloc_init(MEMORY[0x263EFF8E0]);

  return MEMORY[0x270F9A758]();
}

uint64_t sub_22C1CD9D8()
{
  qword_2684A55C0 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return MEMORY[0x270F9A758]();
}

id IMAssistantChatIdentifierFromConversationIdentifier(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 rangeOfString:@";"];
  uint64_t v3 = v1;
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    IMComponentsFromChatGUID();
    uint64_t v3 = 0;
  }
  id v4 = v3;

  return v4;
}

void sub_22C1CE01C()
{
  v9[13] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F4AEC0];
  v8[0] = *MEMORY[0x263F4AEB0];
  v8[1] = v0;
  v9[0] = &unk_26DF9EDE8;
  v9[1] = &unk_26DF9EE00;
  uint64_t v1 = *MEMORY[0x263F4AED0];
  v8[2] = *MEMORY[0x263F4AEE8];
  v8[3] = v1;
  v9[2] = &unk_26DF9EE18;
  v9[3] = &unk_26DF9EE30;
  uint64_t v2 = *MEMORY[0x263F4AEB8];
  void v8[4] = *MEMORY[0x263F4AF00];
  v8[5] = v2;
  v9[4] = &unk_26DF9EE48;
  v9[5] = &unk_26DF9EE60;
  uint64_t v3 = *MEMORY[0x263F4AF08];
  v8[6] = *MEMORY[0x263F4AEF8];
  v8[7] = v3;
  v9[6] = &unk_26DF9EE78;
  v9[7] = &unk_26DF9EE90;
  uint64_t v4 = *MEMORY[0x263F4AED8];
  v8[8] = *MEMORY[0x263F4AEF0];
  v8[9] = v4;
  v9[8] = &unk_26DF9EEA8;
  v9[9] = &unk_26DF9EEC0;
  uint64_t v5 = *MEMORY[0x263F4AEC8];
  v8[10] = *MEMORY[0x263F4AEE0];
  v8[11] = v5;
  v9[10] = &unk_26DF9EED8;
  v9[11] = &unk_26DF9EEF0;
  v8[12] = *MEMORY[0x263F4AF10];
  v9[12] = &unk_26DF9EF08;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:13];
  id v7 = (void *)qword_2684A55D0;
  qword_2684A55D0 = v6;
}

id sub_22C1CF5CC(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 URL];
  uint64_t v3 = [v2 absoluteString];

  return v3;
}

id sub_22C1CF61C(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 URL];
  uint64_t v3 = [v2 absoluteString];

  return v3;
}

uint64_t sub_22C1CFA34(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) personFromSPIHandle:a2];
}

void sub_22C1D0E68(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v50 = [v5 messagePartIndex];
  id v53 = [v5 messagePartBody];
  v57[0] = MEMORY[0x263EF8330];
  v57[1] = 3221225472;
  v57[2] = sub_22C1D1D5C;
  v57[3] = &unk_264912AF8;
  id v58 = *(id *)(a1 + 32);
  id v55 = (void *)MEMORY[0x230F62A80](v57);
  id v56 = 0;
  id v54 = objc_msgSend(v53, "__imspi_attributedStringByReplacingAdaptiveImageGlyphFileTransfersUsingAttachmentProvider:replacementTextProvider:removedTransferGUIDsOut:", v55, &unk_26DF9B7D8, &v56);
  id v51 = v56;
  uint64_t v52 = [v54 string];
  uint64_t v6 = [*(id *)(a1 + 88) _stringByRemovingMessagesControlCharactersFromString:v52];
  id v7 = [v5 transferGUID];
  uint64_t v8 = [*(id *)(a1 + 40) messageType];
  uint64_t v9 = [*(id *)(a1 + 40) bundleId];
  uint64_t v10 = [v9 length];

  uint64_t v11 = [v7 length];
  if ([v7 length])
  {
    uint64_t v12 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
    int v13 = [v12 isAdaptiveImageGlyph];

    if (v11) {
      goto LABEL_3;
    }
LABEL_7:
    int v14 = 0;
    goto LABEL_8;
  }
  int v13 = 0;
  if (!v11) {
    goto LABEL_7;
  }
LABEL_3:
  if (v10) {
    int v14 = 0;
  }
  else {
    int v14 = v13 ^ 1;
  }
LABEL_8:
  double v15 = [MEMORY[0x263F4AF80] sharedFeatureFlags];
  int v16 = [v15 isSiriReactionReadingEnabled];

  if (v16)
  {
    if (*(void *)(a1 + 48))
    {
      if (IMOSLoggingEnabled())
      {
        long long v17 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          unint64_t v18 = *(void *)(a1 + 56);
          *(_DWORD *)long long buf = 138412290;
          unint64_t v60 = v18;
          _os_log_impl(&dword_22C1AD000, v17, OS_LOG_TYPE_INFO, "This reaction has a reference to message %@", buf, 0xCu);
        }
      }
LABEL_14:
      uint64_t v19 = 0;
      unint64_t v20 = 26;
      goto LABEL_131;
    }
    if (v14)
    {
      char v26 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
      uint64_t v22 = v26;
      if (!v26)
      {
        if (IMOSLoggingEnabled())
        {
          id v30 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            uint64_t v31 = *(void *)(a1 + 64);
            *(_DWORD *)long long buf = 138412802;
            unint64_t v60 = (unint64_t)v7;
            __int16 v61 = 2048;
            uint64_t v62 = v50;
            __int16 v63 = 2112;
            uint64_t v64 = v31;
            _os_log_impl(&dword_22C1AD000, v30, OS_LOG_TYPE_INFO, "Could not find attachment matching attachmentGUID %@ for messagePart %ld of message %@", buf, 0x20u);
          }
        }
        uint64_t v19 = 0;
        unint64_t v20 = 0;
        goto LABEL_130;
      }
      uint64_t v23 = [v26 uti];
      if ([v22 isSticker])
      {
        unint64_t v20 = 5;
      }
      else if (IMUTTypeIsGIF())
      {
        unint64_t v20 = 27;
      }
      else if (IMUTTypeIsImage())
      {
        unint64_t v20 = 15;
      }
      else if (IMUTTypeIsMovie())
      {
        unint64_t v20 = 16;
      }
      else if (IMUTTypeIsVCard())
      {
        unint64_t v20 = 14;
      }
      else if (IMUTTypeIsCalendar())
      {
        unint64_t v20 = 12;
      }
      else if (IMUTTypeIsPass())
      {
        unint64_t v20 = 17;
      }
      else if (IMUTTypeIsAudio())
      {
        unint64_t v20 = 2;
      }
      else if (IMUTTypeIsMap())
      {
        unint64_t v20 = 13;
      }
      else if (IMUTTypeIsWatchface())
      {
        unint64_t v20 = 24;
      }
      else if (IMUTTypeIsWorkout())
      {
        unint64_t v20 = 24;
      }
      else
      {
        unint64_t v20 = 0;
      }
LABEL_129:

      uint64_t v19 = 1;
LABEL_130:

      goto LABEL_131;
    }
    if (a3 < 2 || v11)
    {
      switch(v8)
      {
        case 200:
          goto LABEL_48;
        case 201:
          goto LABEL_74;
        case 202:
          goto LABEL_75;
        case 203:
          goto LABEL_76;
        case 204:
          goto LABEL_77;
        case 205:
          goto LABEL_78;
        case 206:
          goto LABEL_79;
        case 207:
          goto LABEL_80;
        case 208:
          goto LABEL_81;
        case 209:
          goto LABEL_82;
        case 210:
          goto LABEL_83;
        case 211:
          goto LABEL_84;
        case 212:
          goto LABEL_85;
        case 213:
          goto LABEL_86;
        case 214:
          if (!IMOSLoggingEnabled()) {
            goto LABEL_108;
          }
          char v27 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_22C1AD000, v27, OS_LOG_TYPE_INFO, "Cannot map IMSPIMessageTypeBalloonExtensionValue to INMessageType. Using unspecified.", buf, 2u);
          }
          goto LABEL_107;
        case 215:
          goto LABEL_87;
        case 216:
          goto LABEL_88;
        case 217:
          goto LABEL_89;
        case 218:
          goto LABEL_90;
        case 219:
          goto LABEL_91;
        case 220:
          goto LABEL_97;
        case 221:
          goto LABEL_92;
        case 222:
          goto LABEL_93;
        default:
          uint64_t v19 = 0;
          unint64_t v20 = 1;
          switch(v8)
          {
            case 'd':
              goto LABEL_131;
            case 'e':
              goto LABEL_61;
            case 'f':
              goto LABEL_94;
            case 'g':
              goto LABEL_95;
            case 'h':
              goto LABEL_96;
            case 'i':
            case 'j':
            case 'k':
            case 'l':
            case 'm':
            case 'n':
            case 'o':
            case 'p':
            case 'q':
              goto LABEL_14;
            default:
              goto LABEL_108;
          }
          goto LABEL_131;
      }
    }
    if ([v6 length]) {
      goto LABEL_38;
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        uint64_t v32 = *(void *)(a1 + 64);
        *(_DWORD *)long long buf = 134218242;
        unint64_t v60 = v50;
        __int16 v61 = 2112;
        uint64_t v62 = v32;
        _os_log_impl(&dword_22C1AD000, v24, OS_LOG_TYPE_INFO, "Skipping empty text message part %ld of %@", buf, 0x16u);
      }
      goto LABEL_163;
    }
  }
  else
  {
    if (v14)
    {
      __int16 v21 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
      uint64_t v22 = v21;
      if (!v21)
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v28 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            uint64_t v29 = *(void *)(a1 + 64);
            *(_DWORD *)long long buf = 138412802;
            unint64_t v60 = (unint64_t)v7;
            __int16 v61 = 2048;
            uint64_t v62 = v50;
            __int16 v63 = 2112;
            uint64_t v64 = v29;
            _os_log_impl(&dword_22C1AD000, v28, OS_LOG_TYPE_INFO, "Could not find attachment matching attachmentGUID %@ for messagePart %ld of message %@", buf, 0x20u);
          }
        }
        uint64_t v19 = 0;
        unint64_t v20 = 0;
        goto LABEL_130;
      }
      uint64_t v23 = [v21 uti];
      if ([v22 isSticker])
      {
        unint64_t v20 = 5;
      }
      else if (IMUTTypeIsGIF())
      {
        unint64_t v20 = 27;
      }
      else if (IMUTTypeIsImage())
      {
        unint64_t v20 = 15;
      }
      else if (IMUTTypeIsMovie())
      {
        unint64_t v20 = 16;
      }
      else if (IMUTTypeIsVCard())
      {
        unint64_t v20 = 14;
      }
      else if (IMUTTypeIsCalendar())
      {
        unint64_t v20 = 12;
      }
      else if (IMUTTypeIsPass())
      {
        unint64_t v20 = 17;
      }
      else if (IMUTTypeIsAudio())
      {
        unint64_t v20 = 2;
      }
      else if (IMUTTypeIsMap())
      {
        unint64_t v20 = 13;
      }
      else if (IMUTTypeIsWatchface())
      {
        unint64_t v20 = 24;
      }
      else if (IMUTTypeIsWorkout())
      {
        unint64_t v20 = 24;
      }
      else
      {
        unint64_t v20 = 0;
      }
      goto LABEL_129;
    }
    if (a3 < 2 || v11)
    {
      switch(v8)
      {
        case 200:
LABEL_48:
          uint64_t v19 = 0;
          unint64_t v20 = 15;
          break;
        case 201:
LABEL_74:
          uint64_t v19 = 0;
          unint64_t v20 = 16;
          break;
        case 202:
LABEL_75:
          uint64_t v19 = 0;
          unint64_t v20 = 18;
          break;
        case 203:
LABEL_76:
          uint64_t v19 = 0;
          unint64_t v20 = 12;
          break;
        case 204:
LABEL_77:
          uint64_t v19 = 0;
          unint64_t v20 = 14;
          break;
        case 205:
LABEL_78:
          uint64_t v19 = 0;
          unint64_t v20 = 17;
          break;
        case 206:
LABEL_79:
          uint64_t v19 = 0;
          unint64_t v20 = 24;
          break;
        case 207:
LABEL_80:
          uint64_t v19 = 0;
          unint64_t v20 = 22;
          break;
        case 208:
LABEL_81:
          uint64_t v19 = 0;
          unint64_t v20 = 13;
          break;
        case 209:
LABEL_82:
          uint64_t v19 = 0;
          unint64_t v20 = 19;
          break;
        case 210:
LABEL_83:
          uint64_t v19 = 0;
          unint64_t v20 = 20;
          break;
        case 211:
LABEL_84:
          uint64_t v19 = 0;
          unint64_t v20 = 21;
          break;
        case 212:
LABEL_85:
          uint64_t v19 = 0;
          unint64_t v20 = 23;
          break;
        case 213:
LABEL_86:
          uint64_t v19 = 0;
          unint64_t v20 = 25;
          break;
        case 214:
          if (IMOSLoggingEnabled())
          {
            char v27 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl(&dword_22C1AD000, v27, OS_LOG_TYPE_INFO, "Cannot map IMSPIMessageTypeBalloonExtensionValue to INMessageType. Using unspecified.", buf, 2u);
            }
LABEL_107:
          }
LABEL_108:
          uint64_t v19 = 0;
          unint64_t v20 = 0;
          break;
        case 215:
LABEL_87:
          uint64_t v19 = 0;
          unint64_t v20 = 1000;
          break;
        case 216:
LABEL_88:
          uint64_t v19 = 0;
          unint64_t v20 = 1004;
          break;
        case 217:
LABEL_89:
          uint64_t v19 = 0;
          unint64_t v20 = 1005;
          break;
        case 218:
LABEL_90:
          uint64_t v19 = 0;
          unint64_t v20 = 1001;
          break;
        case 219:
LABEL_91:
          uint64_t v19 = 0;
          unint64_t v20 = 1002;
          break;
        case 220:
LABEL_97:
          uint64_t v19 = 0;
          unint64_t v20 = 1003;
          break;
        case 221:
LABEL_92:
          uint64_t v19 = 0;
          unint64_t v20 = 27;
          break;
        case 222:
LABEL_93:
          uint64_t v19 = 0;
          unint64_t v20 = 28;
          break;
        default:
          uint64_t v19 = 0;
          unint64_t v20 = 1;
          switch(v8)
          {
            case 'd':
              goto LABEL_131;
            case 'e':
LABEL_61:
              uint64_t v19 = 0;
              unint64_t v20 = 2;
              break;
            case 'f':
LABEL_94:
              uint64_t v19 = 0;
              unint64_t v20 = 3;
              break;
            case 'g':
LABEL_95:
              uint64_t v19 = 0;
              unint64_t v20 = 4;
              break;
            case 'h':
LABEL_96:
              uint64_t v19 = 0;
              unint64_t v20 = 5;
              break;
            case 'i':
            case 'j':
            case 'k':
            case 'l':
            case 'm':
            case 'n':
            case 'o':
            case 'p':
            case 'q':
              goto LABEL_14;
            default:
              goto LABEL_108;
          }
          break;
      }
LABEL_131:
      if (IMOSLoggingEnabled())
      {
        long long v33 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 134217984;
          unint64_t v60 = v20;
          _os_log_impl(&dword_22C1AD000, v33, OS_LOG_TYPE_INFO, "Message is type INMessageType %ld", buf, 0xCu);
        }
      }
      uint64_t v34 = [MEMORY[0x263F4AF80] sharedFeatureFlags];
      int v35 = [v34 isSiriReactionReadingEnabled];

      if (v35)
      {
        if (v20 == 26)
        {
          uint64_t v36 = objc_msgSend(*(id *)(a1 + 88), "INMessageReactionTypeForIMSPIMessageType:", objc_msgSend(*(id *)(a1 + 40), "messageType"));
          if (v36 == 1)
          {
            uint64_t v37 = [*(id *)(a1 + 40) associatedMessageEmoji];
          }
          else
          {
            uint64_t v37 = 0;
          }
          if (v36 == *MEMORY[0x263F10280] || v36 == *MEMORY[0x263F10240])
          {
            uint64_t v40 = *(void **)(a1 + 88);
            uint64_t v41 = [*(id *)(a1 + 40) attachments];
            uint64_t v39 = [v40 INStickerForIMSPIAttachment:v41];
          }
          else
          {
            uint64_t v39 = 0;
          }
          long long v38 = (void *)[objc_alloc(MEMORY[0x263F0FC80]) initWithReactionType:v36 reactionDescription:0 emoji:v37 sticker:v39];
        }
        else
        {
          long long v38 = 0;
        }
        uint64_t v24 = [*(id *)(a1 + 88) makeINMessage:v20 message:*(void *)(a1 + 40) numberOfAttachments:v19 personProvider:*(void *)(a1 + 72) referencedINMessage:*(void *)(a1 + 48) content:v6 reaction:v38];
      }
      else
      {
        uint64_t v24 = [*(id *)(a1 + 88) makeINMessage:v20 message:*(void *)(a1 + 40) numberOfAttachments:v19 personProvider:*(void *)(a1 + 72) referencedINMessage:*(void *)(a1 + 48) content:v6 reaction:0];
      }
      if (v24)
      {
        uint64_t v42 = [*(id *)(a1 + 80) lastObject];
        id v43 = v42;
        if (v19 && v20 <= 0x18 && ((1 << v20) & 0x1C3F038) != 0 && v20 == [v42 messageType])
        {
          if (IMOSLoggingEnabled())
          {
            long long v44 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
            {
              uint64_t v45 = *(void *)(a1 + 64);
              *(_DWORD *)long long buf = 134218242;
              unint64_t v60 = v50;
              __int16 v61 = 2112;
              uint64_t v62 = v45;
              _os_log_impl(&dword_22C1AD000, v44, OS_LOG_TYPE_INFO, "Aggregating message part %ld of %@ to previous INMessage", buf, 0x16u);
            }
          }
          long long v46 = [v43 numberOfAttachments];
          int v47 = [v46 intValue];

          long long v48 = [NSNumber numberWithInteger:v47 + 1];
          [v43 setValue:v48 forKey:@"numberOfAttachments"];
        }
        else
        {
          [*(id *)(a1 + 80) addObject:v24];
        }
      }
      else
      {
        if (!IMOSLoggingEnabled())
        {
LABEL_163:

          goto LABEL_164;
        }
        id v43 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          uint64_t v49 = *(void *)(a1 + 64);
          *(_DWORD *)long long buf = 134218242;
          unint64_t v60 = v50;
          __int16 v61 = 2112;
          uint64_t v62 = v49;
          _os_log_impl(&dword_22C1AD000, v43, OS_LOG_TYPE_INFO, "Unable to convert message part %ld of %@ to INMessage", buf, 0x16u);
        }
      }

      goto LABEL_163;
    }
    if ([v6 length])
    {
LABEL_38:
      uint64_t v19 = 0;
      unint64_t v20 = 1;
      goto LABEL_131;
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        uint64_t v25 = *(void *)(a1 + 64);
        *(_DWORD *)long long buf = 134218242;
        unint64_t v60 = v50;
        __int16 v61 = 2112;
        uint64_t v62 = v25;
        _os_log_impl(&dword_22C1AD000, v24, OS_LOG_TYPE_INFO, "Skipping empty text message part %ld of %@", buf, 0x16u);
      }
      goto LABEL_163;
    }
  }
LABEL_164:
}

uint64_t sub_22C1D1D5C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
}

__CFString *sub_22C1D1D68(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 adaptiveImageGlyphContentDescription];
  if ([v2 length] && (objc_msgSend(v2, "isEqual:", @"Emoji") & 1) == 0)
  {
    uint64_t v3 = [NSString stringWithFormat:@"(%@)", v2];
  }
  else
  {
    uint64_t v3 = @"\uFFFD";
  }

  return v3;
}

uint64_t sub_22C1D28C0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "__imcore__isSuccess", (void)v8))
        {
          uint64_t v4 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

BOOL sub_22C1D29C0(void *a1)
{
  return [a1 resolutionResultCode] == 0;
}

void sub_22C1D2BC0(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  obuint64_t j = [*(id *)(a1 + 32) identifiers];
  uint64_t v1 = [obj countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v1)
  {
    uint64_t v2 = *(void *)v17;
    uint64_t v3 = MEMORY[0x263EF8330];
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v17 != v2) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v16 + 1) + 8 * v4);
        uint64_t v6 = [MEMORY[0x263F4A568] sharedController];
        id v7 = [v6 synchronousRemoteDaemon];
        v15[0] = v3;
        v15[1] = 3221225472;
        v15[2] = sub_22C1D2E74;
        v15[3] = &unk_264912B68;
        v15[4] = v5;
        [v7 markMessageAsReadWithGUID:v5 callerOrigin:1 reply:v15];

        ++v4;
      }
      while (v1 != v4);
      uint64_t v1 = [obj countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v1);
  }

  long long v8 = (void *)[objc_alloc(MEMORY[0x263F0FF08]) initWithCode:3 userActivity:0];
  if (IMOSLoggingEnabled())
  {
    long long v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      __int16 v21 = v8;
      _os_log_impl(&dword_22C1AD000, v9, OS_LOG_TYPE_INFO, "Calling completion with response: %@", buf, 0xCu);
    }
  }
  long long v10 = _IMAssistantCoreGeneralSignpostLogHandle();
  long long v11 = v10;
  os_signpost_id_t v12 = *(void *)(a1 + 48);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v11, OS_SIGNPOST_INTERVAL_END, v12, "handleSetMessageAttributeIntent", (const char *)&unk_22C1E071B, buf, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_22C1D2E74(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    uint64_t v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = @"NO";
      uint64_t v6 = *(void *)(a1 + 32);
      if (a2) {
        uint64_t v5 = @"YES";
      }
      int v7 = 138412546;
      uint64_t v8 = v6;
      __int16 v9 = 2112;
      long long v10 = v5;
      _os_log_impl(&dword_22C1AD000, v4, OS_LOG_TYPE_INFO, "Message marked as read: %@ success: %@", (uint8_t *)&v7, 0x16u);
    }
  }
}

id sub_22C1D35EC(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (a3 > 102)
  {
    if ((unint64_t)(a3 - 103) >= 2) {
      goto LABEL_30;
    }
  }
  else if (a3)
  {
    if (a3 == 1)
    {
      id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
LABEL_20:
      double v15 = objc_msgSend(a1, "__im_assistant_emailAddressesMatchingLabel:", v6);
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v24 != v18) {
              objc_enumerationMutation(v15);
            }
            unint64_t v20 = [[IMAssistantHandleFromContact alloc] initWithCNLabeledEmailAddress:*(void *)(*((void *)&v23 + 1) + 8 * i) contact:a1];
            if (v20) {
              [v8 addObject:v20];
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
        }
        while (v17);
      }

      goto LABEL_31;
    }
    if (a3 == 2)
    {
      char v7 = 0;
      goto LABEL_8;
    }
LABEL_30:
    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    goto LABEL_31;
  }
  char v7 = 1;
LABEL_8:
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  __int16 v9 = objc_msgSend(a1, "__im_assistant_phoneNumbersMatchingLabel:", v6);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v9);
        }
        int v14 = [[IMAssistantHandleFromContact alloc] initWithCNLabeledPhoneNumber:*(void *)(*((void *)&v27 + 1) + 8 * j) contact:a1];
        if (v14) {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v11);
  }

  if (v7) {
    goto LABEL_20;
  }
LABEL_31:
  __int16 v21 = (void *)[v8 copy];

  return v21;
}

id sub_22C1D3884(void *a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v6 = [a1 phoneNumbers];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (![v4 length] || INPersonHandleLabelEqualsCNLabeledValue()) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
  uint64_t v12 = (void *)[v5 copy];

  return v12;
}

id sub_22C1D39E4(void *a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v6 = [a1 emailAddresses];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (![v4 length] || INPersonHandleLabelEqualsCNLabeledValue()) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
  uint64_t v12 = (void *)[v5 copy];

  return v12;
}

id sub_22C1D3B44(void *a1, uint64_t a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v6 = objc_msgSend(MEMORY[0x263F0FD20], "__im_assistant_handleTypeForString:", v4);
  if (v6 == 2)
  {
    uint64_t v7 = [a1 emailAddresses];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v14 = [v7 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v7);
          }
          uint64_t v18 = [[IMAssistantHandleFromContact alloc] initWithCNLabeledEmailAddress:*(void *)(*((void *)&v22 + 1) + 8 * i) contact:a1];
          uint64_t v19 = v18;
          if (v18 && [(IMAssistantHandleFromContact *)v18 matchesHandleID:v4]) {
            [v5 addObject:v19];
          }
        }
        uint64_t v15 = [v7 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v15);
    }
  }
  else
  {
    if (v6 != 1) {
      goto LABEL_25;
    }
    uint64_t v7 = [a1 phoneNumbers];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v27;
      do
      {
        for (uint64_t j = 0; j != v9; ++j)
        {
          if (*(void *)v27 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [[IMAssistantHandleFromContact alloc] initWithCNLabeledPhoneNumber:*(void *)(*((void *)&v26 + 1) + 8 * j) contact:a1];
          uint64_t v13 = v12;
          if (v12 && [(IMAssistantHandleFromContact *)v12 matchesHandleID:v4]) {
            [v5 addObject:v13];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v9);
    }
  }

LABEL_25:
  unint64_t v20 = (void *)[v5 copy];

  return v20;
}

id sub_22C1D3DB0(void *a1, uint64_t a2, unint64_t a3, void *a4, void *a5)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v35 = a5;
  id v9 = objc_alloc_init(MEMORY[0x263EFF9B0]);
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 0)
  {
    unint64_t v31 = a3;
    uint64_t v32 = a1;
    id v33 = v8;
    uint64_t v10 = objc_msgSend(a1, "__im_assistant_phoneNumbersMatchingLabel:", v8);
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v41 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = [*(id *)(*((void *)&v40 + 1) + 8 * i) value];
          uint64_t v16 = [v15 stringValue];
          long long v17 = IMInternationalForPhoneNumberWithOptions();
          if ([v17 length])
          {
            uint64_t v18 = INPersonHandleLabelForCNLabeledValue();
            uint64_t v19 = (void *)[objc_alloc(MEMORY[0x263F0FD20]) initWithValue:v17 type:2 label:v18];
            [v9 addObject:v19];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v40 objects:v45 count:16];
      }
      while (v12);
    }

    a1 = v32;
    id v8 = v33;
    a3 = v31;
  }
  if (a3 <= 1)
  {
    id v34 = v8;
    unint64_t v20 = objc_msgSend(a1, "__im_assistant_emailAddressesMatchingLabel:", v8);
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v37;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v37 != v23) {
            objc_enumerationMutation(v20);
          }
          long long v25 = [*(id *)(*((void *)&v36 + 1) + 8 * j) value];
          long long v26 = IMCanonicalFormForEmail();
          if ([v26 length])
          {
            long long v27 = INPersonHandleLabelForCNLabeledValue();
            long long v28 = (void *)[objc_alloc(MEMORY[0x263F0FD20]) initWithValue:v26 type:1 label:v27];
            [v9 addObject:v28];
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v36 objects:v44 count:16];
      }
      while (v22);
    }

    id v8 = v34;
  }
  long long v29 = [v9 array];

  return v29;
}

id sub_22C1D40C0(void *a1, uint64_t a2, void *a3)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v32 = objc_alloc_init(MEMORY[0x263EFF9B0]);
  id v33 = a1;
  [a1 phoneNumbers];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [obj countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (v5)
  {
    uint64_t v7 = *(void *)v39;
    *(void *)&long long v6 = 138412546;
    long long v29 = v6;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v39 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = objc_msgSend(*(id *)(*((void *)&v38 + 1) + 8 * i), "value", v29);
        uint64_t v10 = [v9 stringValue];
        uint64_t v11 = [v4 imHandleWithID:v10];
        if (v11)
        {
          uint64_t v12 = INPersonHandleLabelForCNLabeledValue();
          id v13 = objc_alloc(MEMORY[0x263F0FD18]);
          uint64_t v14 = objc_msgSend(v13, "__im_assistant_initWithContact:imHandle:type:label:", v33, v11, 2, v12);

          [v32 addObject:v14];
        }
        else if (IMOSLoggingEnabled())
        {
          uint64_t v15 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = v29;
            long long v44 = v9;
            __int16 v45 = 2112;
            uint64_t v46 = v33;
            _os_log_impl(&dword_22C1AD000, v15, OS_LOG_TYPE_INFO, "Could not create IMHandle with phone number: %@ from contact: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v38 objects:v47 count:16];
    }
    while (v5);
  }

  [v33 emailAddresses];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = [v16 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v17)
  {
    uint64_t v19 = *(void *)v35;
    *(void *)&long long v18 = 138412546;
    long long v30 = v18;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v35 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * j), "value", v30);
        uint64_t v22 = [v4 imHandleWithID:v21];
        if (v22)
        {
          uint64_t v23 = INPersonHandleLabelForCNLabeledValue();
          id v24 = objc_alloc(MEMORY[0x263F0FD18]);
          long long v25 = objc_msgSend(v24, "__im_assistant_initWithContact:imHandle:type:label:", v33, v22, 1, v23);

          [v32 addObject:v25];
        }
        else if (IMOSLoggingEnabled())
        {
          long long v26 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = v30;
            long long v44 = v21;
            __int16 v45 = 2112;
            uint64_t v46 = v33;
            _os_log_impl(&dword_22C1AD000, v26, OS_LOG_TYPE_INFO, "Could not create IMHandle with email address: %@ from contact: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v17 = [v16 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v17);
  }

  long long v27 = [v32 array];

  return v27;
}

id sub_22C1D44F8(void *a1)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v1 = objc_alloc_init(MEMORY[0x263EFF9B0]);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v2 = [MEMORY[0x263F4A520] sharedInstance];
  obuint64_t j = [v2 accounts];

  uint64_t v27 = [obj countByEnumeratingWithState:&v38 objects:v50 count:16];
  if (v27)
  {
    uint64_t v26 = *(void *)v39;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v39 != v26)
        {
          uint64_t v4 = v3;
          objc_enumerationMutation(obj);
          uint64_t v3 = v4;
        }
        uint64_t v28 = v3;
        uint64_t v5 = *(void **)(*((void *)&v38 + 1) + 8 * v3);
        long long v6 = objc_msgSend(a1, "phoneNumbers", obj);
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v7 = v6;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v34 objects:v49 count:16];
        if (v8)
        {
          uint64_t v9 = *(void *)v35;
          do
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v35 != v9) {
                objc_enumerationMutation(v7);
              }
              uint64_t v11 = [*(id *)(*((void *)&v34 + 1) + 8 * i) value];
              uint64_t v12 = [v11 stringValue];
              id v13 = [v5 imHandleWithID:v12];
              if (v13)
              {
                [v1 addObject:v13];
              }
              else if (IMOSLoggingEnabled())
              {
                uint64_t v14 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)long long buf = 138412802;
                  long long v44 = v11;
                  __int16 v45 = 2112;
                  uint64_t v46 = v5;
                  __int16 v47 = 2112;
                  uint64_t v48 = a1;
                  _os_log_impl(&dword_22C1AD000, v14, OS_LOG_TYPE_INFO, "Could not create IMHandle with phone number: %@ account: %@ from contact: %@ ", buf, 0x20u);
                }
              }
            }
            uint64_t v8 = [v7 countByEnumeratingWithState:&v34 objects:v49 count:16];
          }
          while (v8);
        }

        uint64_t v15 = [a1 emailAddresses];
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v16 = v15;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v42 count:16];
        if (v17)
        {
          uint64_t v18 = *(void *)v31;
          do
          {
            for (uint64_t j = 0; j != v17; ++j)
            {
              if (*(void *)v31 != v18) {
                objc_enumerationMutation(v16);
              }
              unint64_t v20 = [*(id *)(*((void *)&v30 + 1) + 8 * j) value];
              uint64_t v21 = [v5 imHandleWithID:v20];
              if (v21)
              {
                [v1 addObject:v21];
              }
              else if (IMOSLoggingEnabled())
              {
                uint64_t v22 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)long long buf = 138412802;
                  long long v44 = v20;
                  __int16 v45 = 2112;
                  uint64_t v46 = v5;
                  __int16 v47 = 2112;
                  uint64_t v48 = a1;
                  _os_log_impl(&dword_22C1AD000, v22, OS_LOG_TYPE_INFO, "Could not create IMHandle with email address: %@ account: %@ from contact: %@", buf, 0x20u);
                }
              }
            }
            uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v42 count:16];
          }
          while (v17);
        }

        uint64_t v3 = v28 + 1;
      }
      while (v28 + 1 != v27);
      uint64_t v27 = [obj countByEnumeratingWithState:&v38 objects:v50 count:16];
    }
    while (v27);
  }

  uint64_t v23 = [v1 array];

  return v23;
}

void sub_22C1D54BC()
{
  uint64_t v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  dispatch_queue_t v0 = dispatch_queue_create("IMAssistantIMSPIQueue", v2);
  id v1 = (void *)qword_2684A55E0;
  qword_2684A55E0 = (uint64_t)v0;
}

void sub_22C1D5C98(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _IMAssistantCoreSearchForMessageSignpostLogHandle();
  uint64_t v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)id v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v5, OS_SIGNPOST_INTERVAL_END, v6, "queryMessagesWithChatIdentifiers", (const char *)&unk_22C1E071B, v7, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_22C1D603C(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v27 count:16];
  if (v4)
  {
    uint64_t v6 = *(void *)v18;
    *(void *)&long long v5 = 138412546;
    long long v16 = v5;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(v8, "account", v16);
        uint64_t v10 = [v9 service];
        uint64_t v11 = [v10 name];

        uint64_t v12 = [v8 ID];
        if ([v12 length] && objc_msgSend(v11, "length"))
        {
          id v13 = (void *)IMCopyGUIDForChat();
          if ([v13 length])
          {
            [*(id *)(a1 + 32) addObject:v13];
          }
          else if (IMOSLoggingEnabled())
          {
            uint64_t v15 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)long long buf = v16;
              uint64_t v22 = v12;
              __int16 v23 = 2112;
              id v24 = v11;
              _os_log_impl(&dword_22C1AD000, v15, OS_LOG_TYPE_INFO, "Could not construct chat GUID from handleID: %@ service: %@", buf, 0x16u);
            }
          }
        }
        else if (IMOSLoggingEnabled())
        {
          uint64_t v14 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138412802;
            uint64_t v22 = v12;
            __int16 v23 = 2112;
            id v24 = v11;
            __int16 v25 = 2112;
            uint64_t v26 = v8;
            _os_log_impl(&dword_22C1AD000, v14, OS_LOG_TYPE_INFO, "Could not extract handleID: %@ or service: %@ from IMHandle %@", buf, 0x20u);
          }
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v27 count:16];
    }
    while (v4);
  }
}

void sub_22C1D6844(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _IMAssistantCoreSearchForMessageSignpostLogHandle();
  long long v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)id v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v5, OS_SIGNPOST_INTERVAL_END, v6, "queryMessagesWithIDs", (const char *)&unk_22C1E071B, v7, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_22C1D6AC8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _IMAssistantCoreSearchForMessageSignpostLogHandle();
  long long v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)id v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v5, OS_SIGNPOST_INTERVAL_END, v6, "queryUnreadMessages", (const char *)&unk_22C1E071B, v7, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_22C1D6D5C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _IMAssistantCoreSearchForMessageSignpostLogHandle();
  long long v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)id v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v5, OS_SIGNPOST_INTERVAL_END, v6, "queryMessagesWithGUIDs", (const char *)&unk_22C1E071B, v7, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_22C1D6FF0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _IMAssistantCoreSearchForMessageSignpostLogHandle();
  long long v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)id v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v5, OS_SIGNPOST_INTERVAL_END, v6, "queryMessagesWithRowIDs", (const char *)&unk_22C1E071B, v7, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_22C1D7284(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v17 = a2;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v3 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v23;
    while (1)
    {
      uint64_t v6 = 0;
LABEL_4:
      if (*(void *)v23 != v5) {
        objc_enumerationMutation(obj);
      }
      uint64_t v7 = *(void *)(*((void *)&v22 + 1) + 8 * v6);
      uint64_t v8 = [*(id *)(a1 + 40) objectForKey:v7];
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v9 = v17;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v26 count:16];
      if (!v10) {
        break;
      }
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
LABEL_8:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        if ([*(id *)(*((void *)&v18 + 1) + 8 * v13) matchesPerson:v7 withUnifiedContactIdentifiers:v8])break; {
        if (v11 == ++v13)
        }
        {
          uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v26 count:16];
          if (v11) {
            goto LABEL_8;
          }
          goto LABEL_18;
        }
      }

      if (++v6 != v4) {
        goto LABEL_4;
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
      uint64_t v14 = 1;
      if (!v4) {
        goto LABEL_20;
      }
    }
LABEL_18:

    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v14 = 1;
  }
LABEL_20:

  return v14;
}

uint64_t sub_22C1D764C(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v9, (void)v13);
        LOBYTE(v9) = [v3 matchesPerson:v9 withUnifiedContactIdentifiers:v10];

        if (v9)
        {
          uint64_t v11 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v11 = 0;
LABEL_11:

  return v11;
}

id sub_22C1D867C(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = [v2 normalizedID];
  if (MEMORY[0x230F62610]() || IMStringIsEmail())
  {
    IMCanonicalizeFormattedString();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!MEMORY[0x230F625F0](v3) && IMOSLoggingEnabled())
    {
      uint64_t v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v8 = 138412290;
        id v9 = v3;
        _os_log_impl(&dword_22C1AD000, v5, OS_LOG_TYPE_INFO, "Could not canonicalize handle \"%@\" because it is neither a phone number nor an email address.", (uint8_t *)&v8, 0xCu);
      }
    }
    id v4 = v3;
  }
  uint64_t v6 = v4;

  return v6;
}

id sub_22C1D8D6C(uint64_t a1, void *a2)
{
  return IMAssistantChatIdentifierFromConversationIdentifier(a2);
}

id sub_22C1D9AAC(uint64_t a1, void *a2)
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 134217984;
      uint64_t v74 = [v3 count];
      _os_log_impl(&dword_22C1AD000, v4, OS_LOG_TYPE_INFO, "Filter block executed with %ld messages.", buf, 0xCu);
    }
  }
  id v65 = [MEMORY[0x263EFF980] array];
  uint64_t v5 = _IMAssistantCoreSearchForMessageSignpostLogHandle();
  os_signpost_id_t spid = os_signpost_id_generate(v5);

  uint64_t v6 = _IMAssistantCoreSearchForMessageSignpostLogHandle();
  uint64_t v7 = v6;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v7, OS_SIGNPOST_INTERVAL_BEGIN, spid, "filterMessages", (const char *)&unk_22C1E071B, buf, 2u);
  }

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  obuint64_t j = v3;
  uint64_t v8 = [obj countByEnumeratingWithState:&v68 objects:v72 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v69;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v69 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v68 + 1) + 8 * v10);
        uint64_t v12 = _IMAssistantCoreSearchForMessageSignpostLogHandle();
        os_signpost_id_t v13 = os_signpost_id_generate(v12);

        long long v14 = _IMAssistantCoreSearchForMessageSignpostLogHandle();
        long long v15 = v14;
        unint64_t v16 = v13 - 1;
        if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
        {
          *(_WORD *)long long buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22C1AD000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "filterIndividualMessage", (const char *)&unk_22C1E071B, buf, 2u);
        }

        id v17 = _IMAssistantCoreSearchForMessageSignpostLogHandle();
        os_signpost_id_t v18 = os_signpost_id_generate(v17);

        long long v19 = _IMAssistantCoreSearchForMessageSignpostLogHandle();
        long long v20 = v19;
        unint64_t v21 = v18 - 1;
        if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
        {
          *(_WORD *)long long buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22C1AD000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "filterMessageScreentimeCheck", (const char *)&unk_22C1E071B, buf, 2u);
        }

        if ([v11 allowedByScreenTime])
        {
          long long v22 = _IMAssistantCoreSearchForMessageSignpostLogHandle();
          long long v23 = v22;
          if (v21 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v22))
          {
            *(_WORD *)long long buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22C1AD000, v23, OS_SIGNPOST_INTERVAL_END, v18, "filterMessageScreentimeCheck", (const char *)&unk_22C1E071B, buf, 2u);
          }

          if (*(unsigned char *)(a1 + 72) && [*(id *)(a1 + 32) messageIsFromBlackholedChat:v11])
          {
            if (IMOSLoggingEnabled())
            {
              long long v24 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)long long buf = 138412290;
                uint64_t v74 = (uint64_t)v11;
                _os_log_impl(&dword_22C1AD000, v24, OS_LOG_TYPE_INFO, "Message filtered because it is from a blackholed chat: %@", buf, 0xCu);
              }
            }
            long long v25 = _IMAssistantCoreSearchForMessageSignpostLogHandle();
            uint64_t v26 = v25;
            if (v16 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v25)) {
              goto LABEL_41;
            }
          }
          else
          {
            long long v31 = *(void **)(a1 + 40);
            if (v31
              && ([v11 date],
                  long long v32 = objc_claimAutoreleasedReturnValue(),
                  char v33 = [v31 containsDate:v32],
                  v32,
                  (v33 & 1) == 0))
            {
              if (IMOSLoggingEnabled())
              {
                uint64_t v46 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)long long buf = 138412290;
                  uint64_t v74 = (uint64_t)v11;
                  _os_log_impl(&dword_22C1AD000, v46, OS_LOG_TYPE_INFO, "Message filtered because it did not fall within the specified date interval: %@", buf, 0xCu);
                }
              }
              __int16 v47 = _IMAssistantCoreSearchForMessageSignpostLogHandle();
              uint64_t v26 = v47;
              if (v16 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v47)) {
                goto LABEL_41;
              }
            }
            else
            {
              if ([v11 isRead]) {
                int v34 = 1;
              }
              else {
                int v34 = [v11 isOutgoing];
              }
              if (*(unsigned char *)(a1 + 73) && v34)
              {
                if (IMOSLoggingEnabled())
                {
                  long long v35 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)long long buf = 138412290;
                    uint64_t v74 = (uint64_t)v11;
                    _os_log_impl(&dword_22C1AD000, v35, OS_LOG_TYPE_INFO, "Message filtered due to not being an unread message: %@", buf, 0xCu);
                  }
                }
                long long v36 = _IMAssistantCoreSearchForMessageSignpostLogHandle();
                uint64_t v26 = v36;
                if (v16 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v36)) {
                  goto LABEL_41;
                }
              }
              else
              {
                if (*(unsigned char *)(a1 + 74)) {
                  char v37 = v34;
                }
                else {
                  char v37 = 1;
                }
                if (v37)
                {
                  long long v38 = *(void **)(a1 + 48);
                  if (v38
                    && ([v11 body],
                        long long v39 = objc_claimAutoreleasedReturnValue(),
                        char v40 = [v38 evaluateWithObject:v39],
                        v39,
                        (v40 & 1) == 0))
                  {
                    if (IMOSLoggingEnabled())
                    {
                      uint64_t v50 = OSLogHandleForIMFoundationCategory();
                      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)long long buf = 138412290;
                        uint64_t v74 = (uint64_t)v11;
                        _os_log_impl(&dword_22C1AD000, v50, OS_LOG_TYPE_INFO, "Message filtered because it did not pass the contents predicate: %@", buf, 0xCu);
                      }
                    }
                    uint64_t v51 = _IMAssistantCoreSearchForMessageSignpostLogHandle();
                    uint64_t v26 = v51;
                    if (v16 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v51)) {
                      goto LABEL_41;
                    }
                  }
                  else
                  {
                    if (*(void *)(a1 + 56))
                    {
                      uint64_t v26 = [v11 sender];
                      long long v41 = [*(id *)(a1 + 32) chatParticipantForSPIHandle:v26];
                      if (([*(id *)(a1 + 56) evaluateWithObject:v41] & 1) == 0)
                      {
                        if (IMOSLoggingEnabled())
                        {
                          uint64_t v52 = OSLogHandleForIMFoundationCategory();
                          if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
                          {
                            *(_DWORD *)long long buf = 138412290;
                            uint64_t v74 = (uint64_t)v11;
                            _os_log_impl(&dword_22C1AD000, v52, OS_LOG_TYPE_INFO, "Message filtered because it did not pass the senders predicate: %@", buf, 0xCu);
                          }
                        }
                        id v53 = _IMAssistantCoreSearchForMessageSignpostLogHandle();
                        id v54 = v53;
                        if (v16 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v53))
                        {
                          *(_WORD *)long long buf = 0;
                          _os_signpost_emit_with_name_impl(&dword_22C1AD000, v54, OS_SIGNPOST_INTERVAL_END, v13, "filterIndividualMessage", (const char *)&unk_22C1E071B, buf, 2u);
                        }

                        goto LABEL_42;
                      }
                    }
                    if (*(void *)(a1 + 64))
                    {
                      uint64_t v26 = objc_alloc_init(MEMORY[0x263EFF980]);
                      v66 = [v11 recipients];
                      if (v66) {
                        [v26 addObjectsFromArray:v66];
                      }
                      long long v42 = [v11 sender];
                      if (v42) {
                        [v26 addObject:v42];
                      }
                      long long v43 = [*(id *)(a1 + 32) chatParticipantsForSPIHandles:v26];
                      if (([*(id *)(a1 + 64) evaluateWithObject:v43] & 1) == 0)
                      {
                        if (IMOSLoggingEnabled())
                        {
                          log = OSLogHandleForIMFoundationCategory();
                          if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
                          {
                            *(_DWORD *)long long buf = 138412290;
                            uint64_t v74 = (uint64_t)v11;
                            _os_log_impl(&dword_22C1AD000, log, OS_LOG_TYPE_INFO, "Message filtered because it did not pass the recipients predicate: %@", buf, 0xCu);
                          }
                        }
                        id v55 = _IMAssistantCoreSearchForMessageSignpostLogHandle();
                        id v56 = v55;
                        if (v16 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v55))
                        {
                          *(_WORD *)long long buf = 0;
                          _os_signpost_emit_with_name_impl(&dword_22C1AD000, v56, OS_SIGNPOST_INTERVAL_END, v13, "filterIndividualMessage", (const char *)&unk_22C1E071B, buf, 2u);
                        }

                        goto LABEL_42;
                      }
                    }
                    if (IMOSLoggingEnabled())
                    {
                      long long v44 = OSLogHandleForIMFoundationCategory();
                      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)long long buf = 138412290;
                        uint64_t v74 = (uint64_t)v11;
                        _os_log_impl(&dword_22C1AD000, v44, OS_LOG_TYPE_INFO, "Message passed filter: %@", buf, 0xCu);
                      }
                    }
                    [v65 addObject:v11];
                    __int16 v45 = _IMAssistantCoreSearchForMessageSignpostLogHandle();
                    uint64_t v26 = v45;
                    if (v16 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v45)) {
                      goto LABEL_41;
                    }
                  }
                }
                else
                {
                  if (IMOSLoggingEnabled())
                  {
                    uint64_t v48 = OSLogHandleForIMFoundationCategory();
                    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)long long buf = 138412290;
                      uint64_t v74 = (uint64_t)v11;
                      _os_log_impl(&dword_22C1AD000, v48, OS_LOG_TYPE_INFO, "Message filtered due to not being a read message: %@", buf, 0xCu);
                    }
                  }
                  uint64_t v49 = _IMAssistantCoreSearchForMessageSignpostLogHandle();
                  uint64_t v26 = v49;
                  if (v16 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v49)) {
                    goto LABEL_41;
                  }
                }
              }
            }
          }
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v27 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)long long buf = 138412290;
              uint64_t v74 = (uint64_t)v11;
              _os_log_impl(&dword_22C1AD000, v27, OS_LOG_TYPE_INFO, "Message filtered because it did not pass downtime allowlist check: %@", buf, 0xCu);
            }
          }
          uint64_t v28 = _IMAssistantCoreSearchForMessageSignpostLogHandle();
          long long v29 = v28;
          if (v21 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v28))
          {
            *(_WORD *)long long buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22C1AD000, v29, OS_SIGNPOST_INTERVAL_END, v18, "filterMessageScreentimeCheck", (const char *)&unk_22C1E071B, buf, 2u);
          }

          long long v30 = _IMAssistantCoreSearchForMessageSignpostLogHandle();
          uint64_t v26 = v30;
          if (v16 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v30))
          {
LABEL_41:
            *(_WORD *)long long buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22C1AD000, v26, OS_SIGNPOST_INTERVAL_END, v13, "filterIndividualMessage", (const char *)&unk_22C1E071B, buf, 2u);
          }
        }
LABEL_42:

        ++v10;
      }
      while (v8 != v10);
      uint64_t v57 = [obj countByEnumeratingWithState:&v68 objects:v72 count:16];
      uint64_t v8 = v57;
    }
    while (v57);
  }

  if (IMOSLoggingEnabled())
  {
    id v58 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
    {
      uint64_t v59 = [v65 count];
      *(_DWORD *)long long buf = 134217984;
      uint64_t v74 = v59;
      _os_log_impl(&dword_22C1AD000, v58, OS_LOG_TYPE_INFO, "Filter block completed with %ld messages.", buf, 0xCu);
    }
  }
  unint64_t v60 = _IMAssistantCoreSearchForMessageSignpostLogHandle();
  __int16 v61 = v60;
  if (spid - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v60))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v61, OS_SIGNPOST_INTERVAL_END, spid, "filterMessages", (const char *)&unk_22C1E071B, buf, 2u);
  }

  return v65;
}

void sub_22C1DA824(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x22C1DA76CLL);
  }
  _Unwind_Resume(a1);
}

id sub_22C1DA858(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _IMAssistantCoreSearchForMessageSignpostLogHandle();
  os_signpost_id_t spid = os_signpost_id_generate(v4);

  uint64_t v5 = _IMAssistantCoreSearchForMessageSignpostLogHandle();
  uint64_t v6 = v5;
  unint64_t v19 = spid - 1;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v6, OS_SIGNPOST_INTERVAL_BEGIN, spid, "convertMessages", (const char *)&unk_22C1E071B, buf, 2u);
  }

  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = [v3 count];
      *(_DWORD *)long long buf = 134217984;
      uint64_t v27 = v8;
      _os_log_impl(&dword_22C1AD000, v7, OS_LOG_TYPE_INFO, "Conversion block executed with %ld messages.", buf, 0xCu);
    }
  }
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = v3;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v10);
        }
        long long v14 = +[IMAssistantINMessageConverter INMessagesForSPIMessage:personProvider:](IMAssistantINMessageConverter, "INMessagesForSPIMessage:personProvider:", *(void *)(*((void *)&v21 + 1) + 8 * i), *(void *)(a1 + 32), v19);
        if (IMOSLoggingEnabled())
        {
          long long v15 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138412290;
            uint64_t v27 = (uint64_t)v14;
            _os_log_impl(&dword_22C1AD000, v15, OS_LOG_TYPE_INFO, "Finished converting message: %@", buf, 0xCu);
          }
        }
        [v9 addObjectsFromArray:v14];
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  unint64_t v16 = _IMAssistantCoreSearchForMessageSignpostLogHandle();
  id v17 = v16;
  if (v19 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v16))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v17, OS_SIGNPOST_INTERVAL_END, spid, "convertMessages", (const char *)&unk_22C1E071B, buf, 2u);
  }

  return v9;
}

void sub_22C1DAB94(void *a1)
{
  (*(void (**)(void))(a1[4] + 16))();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = (*(void (**)(void))(a1[5] + 16))();
  (*(void (**)(void))(a1[6] + 16))();
}

void sub_22C1DAFF8(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x22C1DAFACLL);
  }
  _Unwind_Resume(a1);
}

id sub_22C1DB02C(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 hasPrefix:@"x-apple-sms:guid="])
  {
    id v3 = NSNumber;
    id v4 = [v2 substringFromIndex:objc_msgSend(@"x-apple-sms:guid=", "length")];
    uint64_t v5 = objc_msgSend(v3, "numberWithLongLong:", objc_msgSend(v4, "longLongValue"));
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

void sub_22C1DB0DC(void *a1)
{
  objc_end_catch();
}

void sub_22C1DB100(void *a1)
{
  objc_end_catch();
}

uint64_t IDSCopyRawAddressForDestination()
{
  return MEMORY[0x270F3C9B0]();
}

uint64_t IMCanonicalFormForEmail()
{
  return MEMORY[0x270F3CA98]();
}

uint64_t IMCanonicalizeFormattedString()
{
  return MEMORY[0x270F3CAA0]();
}

uint64_t IMChatCanonicalIDSIDsForAddress()
{
  return MEMORY[0x270F3D018]();
}

uint64_t IMComponentsFromChatGUID()
{
  return MEMORY[0x270F3CAA8]();
}

uint64_t IMCopyGUIDForChat()
{
  return MEMORY[0x270F3CAB0]();
}

uint64_t IMCopyGUIDForChatOnAccount()
{
  return MEMORY[0x270F3CAB8]();
}

uint64_t IMGetDomainValueForKey()
{
  return MEMORY[0x270F3CAD8]();
}

uint64_t IMInternationalForPhoneNumberWithOptions()
{
  return MEMORY[0x270F3CAE8]();
}

uint64_t IMIsRunningInUnitTesting()
{
  return MEMORY[0x270F3D078]();
}

uint64_t IMNormalizeFormattedString()
{
  return MEMORY[0x270F3CB00]();
}

uint64_t IMOSLoggingEnabled()
{
  return MEMORY[0x270F3CB08]();
}

uint64_t IMSPIQueryIMMessageItemsWithGUIDsAndQOS()
{
  return MEMORY[0x270F3CB30]();
}

uint64_t IMSPIQueryMessagesWithChatIdentifiersAndQOS()
{
  return MEMORY[0x270F3CB38]();
}

uint64_t IMSPIQueryMessagesWithGUIDsAndQOS()
{
  return MEMORY[0x270F3CB40]();
}

uint64_t IMSPIQueryMessagesWithIDsWithOnlyUnreadAndQOS()
{
  return MEMORY[0x270F3CB48]();
}

uint64_t IMSPIQueryMessagesWithRowIDsAndQOS()
{
  return MEMORY[0x270F3CB50]();
}

uint64_t IMSPIQueryUnreadMessagesWithQOS()
{
  return MEMORY[0x270F3CB58]();
}

uint64_t IMSetDomainValueForKey()
{
  return MEMORY[0x270F3CB80]();
}

uint64_t IMSetEmbeddedTempDirectory()
{
  return MEMORY[0x270F3D0C8]();
}

uint64_t IMSharedHelperDeviceHasMultipleSubscriptions()
{
  return MEMORY[0x270F3D0E0]();
}

uint64_t IMSharedUtilitiesFrameworkBundle()
{
  return MEMORY[0x270F3D0F8]();
}

uint64_t IMStringIsBusinessID()
{
  return MEMORY[0x270F3CB98]();
}

uint64_t IMStringIsEmail()
{
  return MEMORY[0x270F3CBA0]();
}

uint64_t IMStringIsPhoneNumber()
{
  return MEMORY[0x270F3CBA8]();
}

uint64_t IMStripFormattingFromAddress()
{
  return MEMORY[0x270F3CBB0]();
}

uint64_t IMUTTypeIsAudio()
{
  return MEMORY[0x270F3D128]();
}

uint64_t IMUTTypeIsCalendar()
{
  return MEMORY[0x270F3D130]();
}

uint64_t IMUTTypeIsGIF()
{
  return MEMORY[0x270F3D138]();
}

uint64_t IMUTTypeIsImage()
{
  return MEMORY[0x270F3D140]();
}

uint64_t IMUTTypeIsMap()
{
  return MEMORY[0x270F3D148]();
}

uint64_t IMUTTypeIsMovie()
{
  return MEMORY[0x270F3D150]();
}

uint64_t IMUTTypeIsPass()
{
  return MEMORY[0x270F3D158]();
}

uint64_t IMUTTypeIsVCard()
{
  return MEMORY[0x270F3D160]();
}

uint64_t IMUTTypeIsWatchface()
{
  return MEMORY[0x270F3D168]();
}

uint64_t IMUTTypeIsWorkout()
{
  return MEMORY[0x270F3D170]();
}

uint64_t IMWeakLinkClass()
{
  return MEMORY[0x270F3CBC0]();
}

uint64_t INPersonHandleLabelEqualsCNLabeledValue()
{
  return MEMORY[0x270EF5270]();
}

uint64_t INPersonHandleLabelForCNLabeledValue()
{
  return MEMORY[0x270EF5278]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

uint64_t OSLogHandleForIMFoundationCategory()
{
  return MEMORY[0x270F3CBD0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x270EDAA60](log);
}