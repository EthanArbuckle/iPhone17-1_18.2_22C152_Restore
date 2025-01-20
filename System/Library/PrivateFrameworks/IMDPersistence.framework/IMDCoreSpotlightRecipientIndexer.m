@interface IMDCoreSpotlightRecipientIndexer
+ (id)_contactForURI:(id)a3;
+ (id)_handleIDForHandleID:(id)a3;
+ (id)_selfCSPersonFromHandleID:(id)a3 messageService:(id)a4;
+ (id)groupPhotoPathCustomKey;
+ (id)suggestedContactNameCustomKey;
+ (id)suggestedContactPhotoCustomKey;
+ (void)indexItem:(id)a3 withChat:(id)a4 isReindexing:(BOOL)a5 metadataToUpdate:(id)a6 timingProfiler:(id)a7;
@end

@implementation IMDCoreSpotlightRecipientIndexer

+ (id)suggestedContactNameCustomKey
{
  if (qword_1E9AF8078 != -1) {
    dispatch_once(&qword_1E9AF8078, &unk_1F084C140);
  }
  v2 = (void *)qword_1E9AF8070;
  return v2;
}

+ (id)suggestedContactPhotoCustomKey
{
  if (qword_1E9AF8088 != -1) {
    dispatch_once(&qword_1E9AF8088, &unk_1F084BF40);
  }
  v2 = (void *)qword_1E9AF8080;
  return v2;
}

+ (id)groupPhotoPathCustomKey
{
  if (qword_1EB5ABBA0 != -1) {
    dispatch_once(&qword_1EB5ABBA0, &unk_1F084C850);
  }
  v2 = (void *)qword_1EB5ABB98;
  return v2;
}

+ (void)indexItem:(id)a3 withChat:(id)a4 isReindexing:(BOOL)a5 metadataToUpdate:(id)a6 timingProfiler:(id)a7
{
  BOOL v119 = a5;
  uint64_t v153 = *MEMORY[0x1E4F143B8];
  id v107 = a3;
  id v10 = a4;
  id v106 = a6;
  id v11 = a7;
  [v11 startTimingForKey:@"IMDCoreRecentsApiInitProfilingKey"];
  _IMDCoreRecentsApiInit();
  v123 = v11;
  [v11 stopTimingForKey:@"IMDCoreRecentsApiInitProfilingKey"];
  BOOL v112 = __PAIR128__(IMDCoreSpotlightRecipientIndexer_TestHandleID, IMDCoreSpotlightRecipientIndexer_TestContact) == 0;
  v105 = v10;
  v12 = [v10 objectForKey:@"participants"];
  id v116 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v109 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v110 = [v107 objectForKey:@"time"];
  v122 = [v107 objectForKey:@"service"];
  v13 = [v105 objectForKey:@"lalh"];
  v104 = [v13 _stripFZIDPrefix];

  v14 = [v107 objectForKey:@"flags"];
  LOBYTE(v11) = [v14 unsignedLongLongValue];

  char v99 = (char)v11;
  if ((v11 & 4) != 0)
  {
    id v17 = v104;
  }
  else
  {
    v15 = [v107 objectForKey:@"handle"];
    v16 = [v15 _stripFZIDPrefix];
    objc_msgSend(v16, "im_stripCategoryLabel");
    id v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  v114 = v17;
  v98 = [NSString stringWithFormat:@"%@:%@", v122, v17];
  if ([MEMORY[0x1E4F6E700] verboseLoggingEnabled] && IMOSLoggingEnabled())
  {
    v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = [v12 count];
      v20 = @"YES";
      *(_DWORD *)buf = 134219522;
      uint64_t v140 = v19;
      __int16 v141 = 2112;
      if ((v99 & 4) == 0) {
        v20 = @"NO";
      }
      v142 = v110;
      __int16 v143 = 2112;
      v144 = v122;
      __int16 v145 = 2112;
      v146 = v104;
      __int16 v147 = 2112;
      v148 = v20;
      __int16 v149 = 2112;
      id v150 = v17;
      __int16 v151 = 2112;
      v152 = v98;
      _os_log_impl(&dword_1AFB53000, v18, OS_LOG_TYPE_INFO, "Got %lu participants, date %@ service %@ lastAddressedLocalHandle %@ isFromMe %@ senderID %@ sendingAddress %@", buf, 0x48u);
    }
  }
  id v111 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v130 = 0u;
  long long v131 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  id obj = v12;
  uint64_t v21 = [obj countByEnumeratingWithState:&v128 objects:v138 count:16];
  if (v21)
  {
    uint64_t v22 = 0;
    uint64_t v117 = *(void *)v129;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v129 != v117) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = *(void *)(*((void *)&v128 + 1) + 8 * i);
        v25 = [a1 _contactForURI:v24];
        [v123 startTimingForKey:@"IMDCoreSpotlightFullNameForContactProfilingKey" iteration:v22 + i];
        _IMDCoreSpotlightFullNameForContact(v25, 0);
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
        [v123 stopTimingForKey:@"IMDCoreSpotlightFullNameForContactProfilingKey" iteration:v22 + i];
        [v123 startTimingForKey:@"IMDCoreSpotlightContactsHandleIDForHandler" iteration:v22 + i];
        v27 = [a1 _handleIDForHandleID:v24];
        [v123 stopTimingForKey:@"IMDCoreSpotlightContactsHandleIDForHandler" iteration:v22 + i];
        if (v27 && !v119)
        {
          v28 = -[IMDCoreSpotlightChatParticipant initWithHandleID:contact:isSender:]([IMDCoreSpotlightChatParticipant alloc], "initWithHandleID:contact:isSender:", v27, v25, [v114 isEqualToString:v27]);
          [v111 addObject:v28];
        }
        v29 = _IMDCoreRecentsKindForHandleID(v27, v122);
        if (!v26)
        {
          objc_msgSend(v27, "im_stripCategoryLabel");
          v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        if (!v119)
        {
          char v30 = !v112;
          if (!v27) {
            char v30 = 1;
          }
          if ((v30 & 1) == 0 && v29)
          {
            [v123 startTimingForKey:@"IMDCoreSpotlightCoreRecentsRecentEventForAddress" iteration:v22 + i];
            if (v26) {
              v31 = v26;
            }
            else {
              v31 = &stru_1F084E970;
            }
            v32 = [MEMORY[0x1E4F5CCE0] recentEventForAddress:v27 displayName:v31 kind:v29 date:v110 weight:0 metadata:0 options:1];
            [v109 addObject:v32];
            [v123 stopTimingForKey:@"IMDCoreSpotlightCoreRecentsRecentEventForAddress" iteration:v22 + i];
          }
        }
        [v123 startTimingForKey:@"IMDCoreSpotlightCreateCoreSpotlightPerson" iteration:v22 + i];
        v33 = _IMDCoreSpotlightPerson(v26, v27, v25, v122);
        [v123 stopTimingForKey:@"IMDCoreSpotlightCreateCoreSpotlightPerson" iteration:v22 + i];
        if ([MEMORY[0x1E4F6E700] verboseLoggingEnabled]
          && IMOSLoggingEnabled())
        {
          v34 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v140 = (uint64_t)v33;
            _os_log_impl(&dword_1AFB53000, v34, OS_LOG_TYPE_INFO, "Adding name %@", buf, 0xCu);
          }
        }
        if (v33) {
          [v116 addObject:v33];
        }
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v128 objects:v138 count:16];
      v22 += i;
    }
    while (v21);
  }

  v35 = _IMDCoreSpotlightChatUIDForChatDictionary(v105);
  if (v35)
  {
    v36 = [a1 chatUniqueIdentifierKey];
    [v106 setValue:v35 forCustomKey:v36];
  }
  v37 = [v105 objectForKeyedSubscript:@"groupPhotoGUID"];
  v108 = [v105 objectForKeyedSubscript:@"groupPhotoPath"];
  v118 = [v105 objectForKey:@"groupName"];
  if ([v118 length]) {
    [v106 setDisplayName:v118];
  }
  v100 = [v107 objectForKey:@"plainBody"];
  v103 = [v107 objectForKey:@"attributedBody"];
  v102 = [v107 objectForKey:@"destinationCallerID"];
  unsigned __int8 v38 = _IMDCoreSpotlightMessageMentionsMe(v103, v102);
  v101 = [v107 objectForKey:@"threadOriginator"];
  v39 = [v101 objectForKey:@"flags"];
  char v40 = [v39 unsignedLongLongValue];

  v41 = [v107 objectForKey:@"flags"];
  uint64_t v42 = [v41 unsignedLongLongValue];

  if (v110)
  {
    if ([v100 length])
    {
      if (v119)
      {
        if (IMOSLoggingEnabled())
        {
          v43 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1AFB53000, v43, OS_LOG_TYPE_INFO, "Not donating INInteraction during re-indexing", buf, 2u);
          }
LABEL_64:
        }
      }
      else if ((v99 & 4) != 0)
      {
        if (IMOSLoggingEnabled())
        {
          v43 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1AFB53000, v43, OS_LOG_TYPE_INFO, "Not donating INInteraction for message from me", buf, 2u);
          }
          goto LABEL_64;
        }
      }
      else
      {
        v44 = [v105 objectForKey:@"guid"];
        v45 = [v105 objectForKey:@"chatIdentifier"];
        v46 = [v107 objectForKey:@"guid"];
        v47 = [v105 objectForKey:@"style"];
        char v48 = [v47 intValue];

        v49 = [v107 objectForKey:@"uncanonicalizedHandle"];
        v50 = _IMDCoreSpotlightNewINInteractionForIncomingMessage(v46, v100, v110, v122, v114, v49, v44, v45, v118, v48, v111, v104, v37, v108, v38, (v40 & 4) != 0, (v42 & 0x800000000) != 0, 0);
        v51 = v50;
        if (v50)
        {
          [v50 donateInteractionWithCompletion:&unk_1F084C588];
        }
        else
        {
          v52 = IMLogHandleForCategory();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
            sub_1AFC67F24(v52);
          }
        }
      }
    }
    else if (IMOSLoggingEnabled())
    {
      v43 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AFB53000, v43, OS_LOG_TYPE_INFO, "Not donating INInteraction for non-text message.", buf, 2u);
      }
      goto LABEL_64;
    }
  }
  else if (IMOSLoggingEnabled())
  {
    v43 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AFB53000, v43, OS_LOG_TYPE_INFO, "Not donating INInteraction for message without a date, to prevent message send from appearing to have taken place now.", buf, 2u);
    }
    goto LABEL_64;
  }
  if ([MEMORY[0x1E4F6E700] verboseLoggingEnabled] && IMOSLoggingEnabled())
  {
    v53 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v140 = (uint64_t)v116;
      _os_log_impl(&dword_1AFB53000, v53, OS_LOG_TYPE_INFO, "generated CSPersons %@", buf, 0xCu);
    }
  }
  if (!v119 && v112 && [v109 count] && objc_msgSend(obj, "count") == 1)
  {
    v54 = +[IMDCoreSpotlightDispatchObject sharedInstance];
    v55 = [v54 recentsInstance];
    [v55 recordContactEvents:v109 recentsDomain:*MEMORY[0x1E4F5CCC8] sendingAddress:v98 source:@"com.apple.MobileSMS" userInitiated:1];
  }
  if (v104) {
    BOOL v56 = v112;
  }
  else {
    BOOL v56 = 0;
  }
  if (v56)
  {
    [v123 startTimingForKey:@"IMDCoreSpotlightCreateCoreSpotlightPersonForHandleID"];
    v57 = [a1 _selfCSPersonFromHandleID:v104 messageService:v122];
    [v123 stopTimingForKey:@"IMDCoreSpotlightCreateCoreSpotlightPersonForHandleID"];
  }
  else
  {
    v57 = 0;
  }
  if ([MEMORY[0x1E4F6E700] verboseLoggingEnabled] && IMOSLoggingEnabled())
  {
    v58 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v140 = (uint64_t)v57;
      _os_log_impl(&dword_1AFB53000, v58, OS_LOG_TYPE_INFO, "generated self person %@", buf, 0xCu);
    }
  }
  if ((v99 & 4) != 0)
  {
    if (v57)
    {
      v133 = v57;
      v66 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v133 count:1];
      [v106 setAuthors:v66];

      if (v104)
      {
        v132 = v104;
        v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v132 count:1];
        [v106 setAuthorAddresses:v67];
      }
      if ([MEMORY[0x1E4F6E700] verboseLoggingEnabled]
        && IMOSLoggingEnabled())
      {
        v68 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v140 = (uint64_t)v57;
          __int16 v141 = 2112;
          v142 = v104;
          _os_log_impl(&dword_1AFB53000, v68, OS_LOG_TYPE_INFO, "Adding author %@ author senderID %@", buf, 0x16u);
        }
      }
    }
  }
  else
  {
    [v123 startTimingForKey:@"IMDCoreSpotlightAddAuthorDataTimingKey"];
    long long v126 = 0u;
    long long v127 = 0u;
    long long v124 = 0u;
    long long v125 = 0u;
    id v59 = v116;
    uint64_t v60 = [v59 countByEnumeratingWithState:&v124 objects:v137 count:16];
    if (v60)
    {
      uint64_t v61 = *(void *)v125;
LABEL_93:
      uint64_t v62 = 0;
      while (1)
      {
        if (*(void *)v125 != v61) {
          objc_enumerationMutation(v59);
        }
        v63 = *(void **)(*((void *)&v124 + 1) + 8 * v62);
        v64 = [v63 handles];
        v65 = [v64 firstObject];

        if ([v65 isEqualToString:v114]) {
          break;
        }

        if (v60 == ++v62)
        {
          uint64_t v60 = [v59 countByEnumeratingWithState:&v124 objects:v137 count:16];
          if (v60) {
            goto LABEL_93;
          }
          goto LABEL_99;
        }
      }
      id v69 = v63;

      if (!v69) {
        goto LABEL_111;
      }
      v70 = [v107 objectForKey:@"handle"];
      if (MEMORY[0x1B3E899E0]())
      {
        v136 = v118;
        v71 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v136 count:1];
        [v106 setAuthorNames:v71];
      }
      else
      {
        id v135 = v69;
        v71 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v135 count:1];
        [v106 setAuthors:v71];
      }

      v73 = v114;
      if (v114)
      {
        v134 = v114;
        v74 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v134 count:1];
        [v106 setAuthorAddresses:v74];

        v73 = v114;
      }
      v120 = _IMDNicknameInfoForAddress(v73);
      v75 = (void *)[objc_alloc(MEMORY[0x1E4F6E8B8]) initWithDictionaryRepresentation:v120];
      v76 = _IMDContactNameForNickname(v75, 0);
      v77 = [v75 avatar];
      v78 = [v77 imageFilePath];

      if ([v76 length])
      {
        if (IMOSLoggingEnabled())
        {
          v79 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
          {
            v113 = v70;
            v80 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v76, "length"));
            *(_DWORD *)buf = 138412290;
            uint64_t v140 = (uint64_t)v80;
            _os_log_impl(&dword_1AFB53000, v79, OS_LOG_TYPE_INFO, " Adding profile name of length %@ ", buf, 0xCu);

            v70 = v113;
          }
        }
        v81 = [a1 suggestedContactNameCustomKey];
        [v106 setValue:v76 forCustomKey:v81];
      }
      if ([v78 length])
      {
        if (IMOSLoggingEnabled())
        {
          v82 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1AFB53000, v82, OS_LOG_TYPE_INFO, " Adding profile avatar path ", buf, 2u);
          }
        }
        v83 = [a1 suggestedContactPhotoCustomKey];
        [v106 setValue:v78 forCustomKey:v83];
      }
      [v59 removeObject:v69];
      if ([MEMORY[0x1E4F6E700] verboseLoggingEnabled]
        && IMOSLoggingEnabled())
      {
        v84 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v140 = (uint64_t)v69;
          __int16 v141 = 2112;
          v142 = v114;
          _os_log_impl(&dword_1AFB53000, v84, OS_LOG_TYPE_INFO, "Adding author %@ author senderID %@", buf, 0x16u);
        }
      }
    }
    else
    {
LABEL_99:

LABEL_111:
      if (IMOSLoggingEnabled())
      {
        v72 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AFB53000, v72, OS_LOG_TYPE_INFO, "IMDCoreSpotlightRecipientIndexer - Failed to get author CSPerson for !isFromMe message", buf, 2u);
        }
      }
      id v69 = 0;
    }
    if (v57) {
      [v59 insertObject:v57 atIndex:0];
    }
    [v123 stopTimingForKey:@"IMDCoreSpotlightAddAuthorDataTimingKey"];
  }
  [v106 setPrimaryRecipients:v116];
  v85 = objc_msgSend(v116, "__imArrayByApplyingBlock:", &unk_1F084D338);
  [v106 setRecipientAddresses:v85];
  v86 = [v105 objectForKey:@"guid"];
  v87 = objc_msgSend(v108, "im_lastPathComponent");
  v88 = IMSharedHelperExternalLocationForFile();
  v89 = [a1 groupPhotoPathCustomKey];
  [v106 setValue:v88 forCustomKey:v89];

  [v106 setGroupPhotoPath:v88];
  if ([MEMORY[0x1E4F6E700] verboseLoggingEnabled])
  {
    if (IMOSLoggingEnabled())
    {
      v90 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
      {
        id v91 = [v106 primaryRecipients];
        *(_DWORD *)buf = 138412290;
        uint64_t v140 = (uint64_t)v91;
        _os_log_impl(&dword_1AFB53000, v90, OS_LOG_TYPE_INFO, "Setting primary recipients %@", buf, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      v92 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
      {
        id v93 = [v106 recipientAddresses];
        *(_DWORD *)buf = 138412290;
        uint64_t v140 = (uint64_t)v93;
        _os_log_impl(&dword_1AFB53000, v92, OS_LOG_TYPE_INFO, "Setting primary recipient IDs %@", buf, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      v94 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
      {
        id v95 = [v106 authors];
        *(_DWORD *)buf = 138412290;
        uint64_t v140 = (uint64_t)v95;
        _os_log_impl(&dword_1AFB53000, v94, OS_LOG_TYPE_INFO, "Setting author %@", buf, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      v96 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
      {
        id v97 = [v106 authorAddresses];
        *(_DWORD *)buf = 138412290;
        uint64_t v140 = (uint64_t)v97;
        _os_log_impl(&dword_1AFB53000, v96, OS_LOG_TYPE_INFO, "Setting author IDs %@", buf, 0xCu);
      }
    }
  }
}

+ (id)_contactForURI:(id)a3
{
  if (IMDCoreSpotlightRecipientIndexer_TestContact)
  {
    id v3 = (id)IMDCoreSpotlightRecipientIndexer_TestContact;
  }
  else
  {
    _IMDCoreSpotlightCNContactForAddress(a3);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (id)_handleIDForHandleID:(id)a3
{
  id v3 = a3;
  v4 = v3;
  v5 = (void *)IMDCoreSpotlightRecipientIndexer_TestHandleID;
  if (!IMDCoreSpotlightRecipientIndexer_TestHandleID) {
    v5 = v3;
  }
  id v6 = v5;

  return v6;
}

+ (id)_selfCSPersonFromHandleID:(id)a3 messageService:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = _IMDCoreSpotlightCNContactForAddress(v5);
  _IMDCoreSpotlightFullNameForContact(v7, 0);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8) {
    id v8 = v5;
  }
  v9 = _IMDCoreSpotlightPerson(v8, v5, v7, v6);

  return v9;
}

@end