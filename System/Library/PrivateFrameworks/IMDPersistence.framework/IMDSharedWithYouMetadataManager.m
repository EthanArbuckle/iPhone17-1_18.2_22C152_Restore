@interface IMDSharedWithYouMetadataManager
+ (Class)LPSharedObjectMetadataClass;
+ (Class)LPSpecializationMetadataClass;
+ (id)Sha256ForData:(id)a3 withSalt:(id)a4;
+ (id)collaborationMetadataKey;
+ (id)dataDetectedLink;
- (BOOL)_isAttachmentType:(id)a3;
- (BOOL)_isLNKTypeMessage:(id)a3;
- (BOOL)_shouldDonateToSharedWithYou:(id)a3 lpLinkMetadata:(id)a4;
- (BOOL)chatDictionary:(id)a3 matchesFaceTimeConversation:(id)a4;
- (id)_ckBundleIDsKey;
- (id)_collaborationIdentifierKey;
- (id)_highlightedContentServerDateKey;
- (id)_lpLinkMetadataForItem:(id)a3 attachmentPaths:(id)a4 originalURL:(id)a5;
- (id)_lpTitleCustomKey;
- (id)_pluginPayloadAttachmentPathsForItem:(id)a3;
- (id)_syndicationContentTypeKey;
- (id)_uniqueIdentifierForResourceURL:(id)a3;
- (id)_updateAttributesWithCollaborationMetadata:(id)a3 forMessageWithGUID:(id)a4 withURL:(id)a5 lpLinkMetadata:(id)a6 messageDate:(id)a7;
- (id)highlightDictionaryFromAttributes:(id)a3 withItem:(id)a4 chat:(id)a5;
- (id)titleFromLPLinkMetadata:(id)a3;
- (id)updateAttributesWithSharedWithYouMetadata:(id)a3 withItem:(id)a4 chat:(id)a5;
- (void)updateConversationManagerWithItem:(id)a3 chat:(id)a4 attributes:(id)a5;
@end

@implementation IMDSharedWithYouMetadataManager

+ (Class)LPSharedObjectMetadataClass
{
  if (qword_1E9AF8320 != -1) {
    dispatch_once(&qword_1E9AF8320, &unk_1F084CFA0);
  }
  v2 = (void *)qword_1E9AF8318;
  return (Class)v2;
}

+ (Class)LPSpecializationMetadataClass
{
  if (qword_1E9AF8330 != -1) {
    dispatch_once(&qword_1E9AF8330, &unk_1F084D0E0);
  }
  v2 = (void *)qword_1E9AF8328;
  return (Class)v2;
}

+ (id)Sha256ForData:(id)a3 withSalt:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  memset(&v13, 0, sizeof(v13));
  id v6 = a3;
  CC_SHA256_Init(&v13);
  id v7 = v6;
  v8 = (const void *)objc_msgSend(v7, "bytes", *(_OWORD *)v13.count, *(_OWORD *)&v13.hash[2], *(_OWORD *)&v13.hash[6], *(_OWORD *)&v13.wbuf[2], *(_OWORD *)&v13.wbuf[6], *(_OWORD *)&v13.wbuf[10], *(void *)&v13.wbuf[14]);
  CC_LONG v9 = [v7 length];

  CC_SHA256_Update(&v13, v8, v9);
  if (v5)
  {
    id v10 = v5;
    CC_SHA256_Update(&v13, (const void *)[v10 bytes], objc_msgSend(v10, "length"));
  }
  *(_OWORD *)md = 0u;
  long long v15 = 0u;
  CC_SHA256_Final(md, &v13);
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:md length:32];

  return v11;
}

- (id)updateAttributesWithSharedWithYouMetadata:(id)a3 withItem:(id)a4 chat:(id)a5
{
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v99 = a4;
  id v8 = a5;
  v98 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v10 = IMLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1AFC7097C();
    }
  }
  v91 = v8;
  v11 = [v8 objectForKey:@"lalh"];
  v94 = [v11 _stripFZIDPrefix];

  v12 = [v99 objectForKey:@"flags"];
  unint64_t v13 = [v12 unsignedLongLongValue];

  uint64_t v88 = (v13 >> 2) & 1;
  if (v88)
  {
    v14 = v94;
  }
  else
  {
    long long v15 = [v99 objectForKey:@"handle"];
    uint64_t v16 = [v15 _stripFZIDPrefix];

    v14 = (__CFString *)v16;
  }
  v92 = v14;
  char v17 = MEMORY[0x1B3E899E0]();
  v93 = [v99 objectForKey:@"guid"];
  if (v17)
  {
    v18 = v98;
    if (IMOSLoggingEnabled())
    {
      v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v109 = v93;
        __int16 v110 = 2112;
        v111 = v92;
        _os_log_impl(&dword_1AFB53000, v19, OS_LOG_TYPE_INFO, "NOT Appending highlight metadata Message: %@ shared by business chat with ID: %@", buf, 0x16u);
      }

      v18 = v98;
    }
    goto LABEL_134;
  }
  v96 = [v98 URL];
  if (v96)
  {
    v20 = [MEMORY[0x1E4F28ED0] numberWithBool:0];
    v21 = [(id)objc_opt_class() dataDetectedLink];
    [v98 setValue:v20 forCustomKey:v21];
  }
  else
  {
    v20 = [v99 objectForKey:@"attributedBody"];
    v96 = IMDCoreSpotlightURLFromAttributedMessageBody(v20);
    if (!v96) {
      goto LABEL_17;
    }
    v25 = [MEMORY[0x1E4F6EA28] sharedManager];
    int v26 = [v25 isDataDetectedLinkAllowedForSWY:v96];

    if (!v26) {
      goto LABEL_17;
    }
    [v98 setURL:v96];
    v21 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
    v27 = [(id)objc_opt_class() dataDetectedLink];
    [v98 setValue:v21 forCustomKey:v27];
  }
LABEL_17:

  if ([(IMDSharedWithYouMetadataManager *)self _isLNKTypeMessage:v98])
  {
    v89 = [(IMDSharedWithYouMetadataManager *)self _pluginPayloadAttachmentPathsForItem:v99];
    uint64_t v22 = [(IMDSharedWithYouMetadataManager *)self _lpLinkMetadataForItem:v99 attachmentPaths:v89 originalURL:v96];
  }
  else
  {
    v89 = 0;
    uint64_t v22 = 0;
  }
  v87 = (void *)v22;
  BOOL v23 = -[IMDSharedWithYouMetadataManager _shouldDonateToSharedWithYou:lpLinkMetadata:](self, "_shouldDonateToSharedWithYou:lpLinkMetadata:", v96);
  if (v96)
  {
    if (!v23) {
      goto LABEL_22;
    }
LABEL_30:
    if (IMOSLoggingEnabled())
    {
      v30 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v109 = v93;
        _os_log_impl(&dword_1AFB53000, v30, OS_LOG_TYPE_INFO, "Appending highlight metadata Message: %@", buf, 0xCu);
      }
    }
    v31 = [v99 objectForKeyedSubscript:@"hasAttachments"];
    int v32 = [v31 BOOLValue];

    if (v32)
    {
      [v99 objectForKeyedSubscript:@"attachments"];
      long long v106 = 0u;
      long long v107 = 0u;
      long long v104 = 0u;
      long long v105 = 0u;
      id v33 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v34 = [v33 countByEnumeratingWithState:&v104 objects:v119 count:16];
      if (v34)
      {
        uint64_t v35 = *(void *)v105;
        uint64_t v36 = 1;
        while (2)
        {
          for (uint64_t i = 0; i != v34; ++i)
          {
            if (*(void *)v105 != v35) {
              objc_enumerationMutation(v33);
            }
            v38 = [*(id *)(*((void *)&v104 + 1) + 8 * i) objectForKeyedSubscript:@"isCommSafetySensitive"];
            int v39 = [v38 BOOLValue];

            if (v39)
            {
              if (IMOSLoggingEnabled())
              {
                v40 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  v109 = v93;
                  _os_log_impl(&dword_1AFB53000, v40, OS_LOG_TYPE_INFO, "Setting highlight metadata for Message: %@ to be hidden because flagged as CommSafety sensitive.", buf, 0xCu);
                }
              }
              uint64_t v36 = 4;
              goto LABEL_51;
            }
          }
          uint64_t v34 = [v33 countByEnumeratingWithState:&v104 objects:v119 count:16];
          if (v34) {
            continue;
          }
          break;
        }
      }
      else
      {
        uint64_t v36 = 1;
      }
LABEL_51:
    }
    else
    {
      uint64_t v36 = 1;
    }
    v86 = [v99 objectForKey:@"syndicationRanges"];
    v97 = [v99 objectForKey:@"time"];
    if (v86)
    {
      v41 = objc_msgSend(MEMORY[0x1E4F6E880], "rangesFromSerializedString:");
      v85 = v41;
      if (v41)
      {
        long long v102 = 0u;
        long long v103 = 0u;
        long long v100 = 0u;
        long long v101 = 0u;
        obuint64_t j = v41;
        uint64_t v42 = [obj countByEnumeratingWithState:&v100 objects:v118 count:16];
        if (v42)
        {
          uint64_t v43 = *(void *)v101;
          while (2)
          {
            for (uint64_t j = 0; j != v42; ++j)
            {
              if (*(void *)v101 != v43) {
                objc_enumerationMutation(obj);
              }
              v45 = *(void **)(*((void *)&v100 + 1) + 8 * j);
              if ([v45 syndicationStatus] == 2)
              {
                if (IMOSLoggingEnabled())
                {
                  v63 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    v109 = v93;
                    _os_log_impl(&dword_1AFB53000, v63, OS_LOG_TYPE_INFO, "NOT Appending highlight metadata for Message: %@ since its been marked as Do not donate", buf, 0xCu);
                  }
                }
                id v64 = v98;

                goto LABEL_135;
              }
              unint64_t v46 = [v45 syndicationType];
              uint64_t v47 = [v45 syndicationType] & 1;
              unint64_t v48 = v46 & 4;
              unint64_t v49 = [v45 syndicationType] & 8;
              uint64_t v50 = 4;
              if ((v46 & 4) == 0) {
                uint64_t v50 = v36;
              }
              if (v47) {
                BOOL v51 = 1;
              }
              else {
                BOOL v51 = v49 == 0;
              }
              if (!v51 && v48 == 0) {
                uint64_t v50 = 8;
              }
              if (((v47 == 0) | (v46 >> 2) & 1) == 1) {
                uint64_t v36 = v50;
              }
              else {
                uint64_t v36 = 2;
              }
              v53 = [v45 syndicationStartDate];

              if (v53)
              {
                uint64_t v54 = [v45 syndicationStartDate];
                v55 = (void *)v54;
                if (v97)
                {
                  BOOL v56 = [v97 compare:v54] == -1;

                  if (v56)
                  {
                    uint64_t v57 = [v45 syndicationStartDate];

                    v97 = (void *)v57;
                  }
                }
                else
                {
                  v97 = (void *)v54;
                }
              }
            }
            uint64_t v42 = [obj countByEnumeratingWithState:&v100 objects:v118 count:16];
            if (v42) {
              continue;
            }
            break;
          }
          unint64_t v58 = v48 >> 2;
          int v59 = v47;
          uint64_t v42 = v49 >> 3;
        }
        else
        {
          LODWORD(v58) = 0;
          int v59 = 0;
        }
      }
      else
      {
        LODWORD(v58) = 0;
        int v59 = 0;
        LODWORD(v42) = 0;
      }

      BOOL v60 = v58 != 0;
      BOOL v61 = v59 != 0;
      BOOL v62 = v42 != 0;
    }
    else
    {
      BOOL v60 = 0;
      BOOL v61 = 0;
      BOOL v62 = 0;
    }
    _IMDCoreSpotlightCNContactForAddress(v92);
    v65 = (__CFString *)objc_claimAutoreleasedReturnValue();
    int v66 = [MEMORY[0x1E4F6E6D8] isCNContactAKnownContact:v65];
    int v67 = v66;
    if ((v66 | v60)) {
      int v68 = v66 ^ 1;
    }
    else {
      int v68 = v61 || v62;
    }
    int v69 = IMOSLoggingEnabled();
    if (v67 | v68 | v88)
    {
      if (v69)
      {
        v70 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v109 = v93;
          _os_log_impl(&dword_1AFB53000, v70, OS_LOG_TYPE_INFO, "Appending highlight metadata for Message: %@", buf, 0xCu);
        }
      }
      v71 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v36];
      [v98 setSyndicationStatus:v71];

      if (v97)
      {
        if (IMOSLoggingEnabled())
        {
          v72 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v109 = v93;
            _os_log_impl(&dword_1AFB53000, v72, OS_LOG_TYPE_INFO, "Appending highlight server date for Message: %@", buf, 0xCu);
          }
        }
        v73 = [(IMDSharedWithYouMetadataManager *)self _highlightedContentServerDateKey];
        [v98 setValue:v97 forCustomKey:v73];
      }
      else
      {
        v73 = IMLogHandleForCategory();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
          sub_1AFC70948();
        }
      }

      v75 = [v99 objectForKey:@"time"];
      v18 = [(IMDSharedWithYouMetadataManager *)self _updateAttributesWithCollaborationMetadata:v98 forMessageWithGUID:v93 withURL:v96 lpLinkMetadata:v87 messageDate:v75];

      if (v18) {
        [(IMDSharedWithYouMetadataManager *)self updateConversationManagerWithItem:v99 chat:v91 attributes:v18];
      }
    }
    else
    {
      v18 = v98;
      if (v69)
      {
        v74 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v109 = v92;
          __int16 v110 = 2112;
          v111 = v65;
          _os_log_impl(&dword_1AFB53000, v74, OS_LOG_TYPE_INFO, "NOT Appending highlight metadata for Message since sender %@ is not known. Contact: %@", buf, 0x16u);
        }

        v18 = v98;
      }
    }
    if (IMOSLoggingEnabled())
    {
      v76 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
      {
        v77 = @"YES";
        if (v36) {
          v78 = @"YES";
        }
        else {
          v78 = @"NO";
        }
        *(_DWORD *)buf = 138413314;
        v109 = v93;
        if ((v36 & 2) != 0) {
          v79 = @"YES";
        }
        else {
          v79 = @"NO";
        }
        __int16 v110 = 2112;
        v111 = v78;
        if ((v36 & 4) != 0) {
          v80 = @"YES";
        }
        else {
          v80 = @"NO";
        }
        __int16 v112 = 2112;
        v113 = v79;
        if ((v36 & 8) == 0) {
          v77 = @"NO";
        }
        __int16 v114 = 2112;
        v115 = v80;
        __int16 v116 = 2112;
        v117 = v77;
        _os_log_impl(&dword_1AFB53000, v76, OS_LOG_TYPE_INFO, "Highlight type for Message: %@. automatic %@ starred %@ hidden %@ userInteracted %@", buf, 0x34u);
      }
    }
    v81 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
    [v18 setLocal:v81];

    v82 = [v18 isShared];
    BOOL v83 = v82 == 0;

    if (v83) {
      [v18 setShared:MEMORY[0x1E4F1CC28]];
    }

    goto LABEL_133;
  }
  v28 = [v98 attachmentNames];
  BOOL v29 = [v28 count] == 0;

  if (!v29) {
    goto LABEL_30;
  }
LABEL_22:
  v18 = v98;
  if (IMOSLoggingEnabled())
  {
    v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v109 = v93;
      _os_log_impl(&dword_1AFB53000, v24, OS_LOG_TYPE_INFO, "NOT Appending highlight metadata Message: %@ since LP recommended that we do not.", buf, 0xCu);
    }

    v18 = v98;
  }
LABEL_133:

LABEL_134:
  id v64 = v18;
LABEL_135:

  return v64;
}

- (id)_updateAttributesWithCollaborationMetadata:(id)a3 forMessageWithGUID:(id)a4 withURL:(id)a5 lpLinkMetadata:(id)a6 messageDate:(id)a7
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v91 = a4;
  id v90 = a5;
  id v13 = a6;
  id v14 = a7;
  if (v12)
  {
    id v15 = v12;
    if (![(IMDSharedWithYouMetadataManager *)self _isLNKTypeMessage:v15])
    {
      if (IMOSLoggingEnabled())
      {
        int v26 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v94 = (uint64_t)v15;
          _os_log_impl(&dword_1AFB53000, v26, OS_LOG_TYPE_INFO, "Message was not detected as a link, skipping adding collaboration metadata. attributes: %@", buf, 0xCu);
        }
      }
      goto LABEL_91;
    }
    id v88 = objc_alloc_init(MEMORY[0x1E4F6EA70]);
    uint64_t v16 = [v13 collaborationMetadata];

    if (IMOSLoggingEnabled())
    {
      char v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = [v13 collaborationMetadata];
        v19 = (void *)v18;
        v20 = @"YES";
        if (!v16) {
          v20 = @"NO";
        }
        *(_DWORD *)buf = 138412546;
        uint64_t v94 = (uint64_t)v20;
        __int16 v95 = 2112;
        uint64_t v96 = v18;
        _os_log_impl(&dword_1AFB53000, v17, OS_LOG_TYPE_INFO, "hasCollaborationMetadata: %@ CollaborationMetadata: %@", buf, 0x16u);
      }
    }
    if (v16)
    {
      v87 = [MEMORY[0x1E4F6EA28] sharedManager];
      v21 = [v15 URL];
      v86 = [v87 urlMinusFragment:v21 onlyCKURL:1];

      [v15 setURL:v86];
      uint64_t v22 = [v13 collaborationMetadata];
      v89 = [v22 collaborationIdentifier];

      uint64_t v23 = [v89 length];
      if (v23)
      {
        uint64_t v24 = 1;
      }
      else
      {
        v27 = IMLogHandleForCategory();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          sub_1AFC70A90();
        }

        uint64_t v24 = 2;
      }
      if (IMOSLoggingEnabled())
      {
        v28 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218498;
          uint64_t v94 = v24;
          __int16 v95 = 2112;
          uint64_t v96 = (uint64_t)v91;
          __int16 v97 = 2112;
          v98 = @"YES";
          _os_log_impl(&dword_1AFB53000, v28, OS_LOG_TYPE_INFO, "Setting share status to %lu for MessageGUID: %@. hasCollaborationMetadata: %@", buf, 0x20u);
        }
      }
      BOOL v29 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v24];
      [v15 setShared:v29];

      v30 = [(IMDSharedWithYouMetadataManager *)self _syndicationContentTypeKey];
      [v15 setValue:&unk_1F0864FB0 forCustomKey:v30];

      if (v23) {
        [v15 setAttribute:MEMORY[0x1E4F1CC38] forKey:@"FPIsTopLevelSharedItem"];
      }
      v31 = [(IMDSharedWithYouMetadataManager *)self titleFromLPLinkMetadata:v13];
      if ([v31 length])
      {
        int v32 = v31;
      }
      else
      {
        uint64_t v33 = [v15 urlDescription];

        int v32 = (void *)v33;
      }
      uint64_t v34 = v32;
      if ([v32 length])
      {
        uint64_t v35 = v34;
      }
      else
      {
        uint64_t v36 = [(IMDSharedWithYouMetadataManager *)self _lpTitleCustomKey];
        uint64_t v37 = [v15 valueForCustomKey:v36];

        uint64_t v35 = (void *)v37;
      }
      if (objc_msgSend(v35, "length", v35))
      {
        [v15 setFilename:v85];
      }
      else
      {
        v38 = [v15 filename];
        if (v38) {
          [v15 setFilename:v38];
        }
      }
      int v39 = [v13 collaborationMetadata];
      v40 = [v39 contentType];
      v41 = [v40 identifier];

      if (![v41 length])
      {
        uint64_t v42 = [v13 specialization];
        +[IMDSharedWithYouMetadataManager LPSharedObjectMetadataClass];
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          v44 = [v13 specialization];
          v45 = [v44 specialization];
          +[IMDSharedWithYouMetadataManager LPSpecializationMetadataClass];
          char v46 = objc_opt_isKindOfClass();

          if (v46)
          {
            uint64_t v47 = [v44 specialization];
            if (objc_opt_respondsToSelector())
            {
              uint64_t v48 = [v47 performSelector:sel_type];

              v41 = (void *)v48;
            }
          }
        }
      }
      if ([v41 length])
      {
        unint64_t v49 = v41;
      }
      else
      {
        uint64_t v50 = [v88 UTITypeForURL:v90];

        unint64_t v49 = (void *)v50;
      }
      BOOL v51 = v49;
      if ([v49 length]) {
        [v15 setContentType:v51];
      }
      v52 = [v13 collaborationMetadata];
      v53 = [v52 creationDate];

      uint64_t v54 = [MEMORY[0x1E4F1C9C8] distantPast];
      int v55 = [v53 isEqualToDate:v54];

      if (v55)
      {
        BOOL v56 = IMLogHandleForCategory();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
          sub_1AFC70A5C();
        }
      }
      else if (v53)
      {
        [v15 setContentCreationDate:v53];
      }

      if (IMOSLoggingEnabled())
      {
        uint64_t v57 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v94 = (uint64_t)v89;
          __int16 v95 = 2112;
          uint64_t v96 = (uint64_t)v91;
          _os_log_impl(&dword_1AFB53000, v57, OS_LOG_TYPE_INFO, "Setting collaborationIdentifier to %@ for messageGUID: %@", buf, 0x16u);
        }
      }
      unint64_t v58 = [(IMDSharedWithYouMetadataManager *)self _collaborationIdentifierKey];
      [v15 setValue:v89 forCustomKey:v58];

      [v15 setAttribute:v89 forKey:@"FPCollaborationIdentifier"];
      [v15 setAttribute:@"NSFileProviderRootContainerItemIdentifier" forKey:@"FPParentFileItemID"];
      int v59 = [v13 collaborationMetadata];
      BOOL v60 = [v59 ckAppBundleIDs];

      if (![v60 count])
      {
        BOOL v61 = IMLogHandleForCategory();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
          sub_1AFC709E4((uint64_t)v91, v61);
        }
      }
      BOOL v62 = [(IMDSharedWithYouMetadataManager *)self _ckBundleIDsKey];
      [v15 setValue:v60 forCustomKey:v62];

      v63 = (void *)MEMORY[0x1E4F28DB0];
      id v64 = [v13 collaborationMetadata];
      id v92 = 0;
      v65 = [v63 archivedDataWithRootObject:v64 requiringSecureCoding:1 error:&v92];
      id v66 = v92;

      if (v65)
      {
        int v67 = [(id)objc_opt_class() collaborationMetadataKey];
        [v15 setValue:v65 forCustomKey:v67];
      }
      else
      {
        int v67 = IMLogHandleForCategory();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
          sub_1AFC6B1B0((uint64_t)v66, v67);
        }
      }

      int v68 = [MEMORY[0x1E4F28ED0] numberWithBool:0];
      [v15 setUserOwned:v68];

      int v69 = [MEMORY[0x1E4F28ED0] numberWithBool:0];
      [v15 setTrashed:v69];

      [v15 setAttribute:&unk_1F0864FB0 forKey:@"FPCapabilities"];
      v70 = [v15 authors];
      if ([v70 count])
      {
        v71 = [v70 firstObject];
        v72 = [v71 displayName];
        [v15 setOwnerName:v72];

        if (![MEMORY[0x1E4F6E700] verboseLoggingEnabled]
          || !IMOSLoggingEnabled())
        {
          goto LABEL_80;
        }
        v73 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
        {
          v74 = [v15 ownerName];
          *(_DWORD *)buf = 138412290;
          uint64_t v94 = (uint64_t)v74;
          _os_log_impl(&dword_1AFB53000, v73, OS_LOG_TYPE_INFO, "Owner name set to %@", buf, 0xCu);
        }
      }
      else
      {
        if (![MEMORY[0x1E4F6E700] verboseLoggingEnabled]
          || !IMOSLoggingEnabled())
        {
          goto LABEL_80;
        }
        v73 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
        {
          v75 = [v15 identifier];
          *(_DWORD *)buf = 138412290;
          uint64_t v94 = (uint64_t)v75;
          _os_log_impl(&dword_1AFB53000, v73, OS_LOG_TYPE_INFO, "No authors found to derive the Owner name from for message guid:%@", buf, 0xCu);
        }
      }

LABEL_80:
      v76 = [MEMORY[0x1E4F1C9C8] distantPast];
      int v77 = [v14 isEqualToDate:v76];

      if (v77)
      {
        v78 = IMLogHandleForCategory();
        if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR)) {
          sub_1AFC709B0();
        }
      }
      else if (v14)
      {
        [v15 setContentCreationDate:v14];
        [v15 setLastUsedDate:v14];
        if ([MEMORY[0x1E4F6E700] verboseLoggingEnabled])
        {
          if (IMOSLoggingEnabled())
          {
            v79 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
            {
              v80 = [v15 contentCreationDate];
              *(_DWORD *)buf = 138412290;
              uint64_t v94 = (uint64_t)v80;
              _os_log_impl(&dword_1AFB53000, v79, OS_LOG_TYPE_INFO, "Setting the creation & last used date to %@", buf, 0xCu);
            }
          }
        }
      }

LABEL_91:
      id v81 = v15;
      goto LABEL_92;
    }
    if (IMOSLoggingEnabled())
    {
      BOOL v83 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AFB53000, v83, OS_LOG_TYPE_INFO, "Skipping adding additional collaboration related meta-data since the message is non-collaborative", buf, 2u);
      }
    }
    id v84 = v15;
  }
  else
  {
    v25 = IMLogHandleForCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_1AFC7097C();
    }
  }
LABEL_92:

  return v12;
}

- (BOOL)chatDictionary:(id)a3 matchesFaceTimeConversation:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v6 state] == 3)
  {
    id v7 = [v5 objectForKeyedSubscript:@"groupID"];
    id v8 = [v6 groupUUID];
    id v9 = [v8 UUIDString];
    char v10 = [v7 isEqualToString:v9];

    if (v10)
    {
      char v11 = 1;
    }
    else
    {
      id v12 = [MEMORY[0x1E4F1CA80] set];
      id v13 = [MEMORY[0x1E4F1CA80] set];
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v30 = v5;
      id v14 = [v5 objectForKeyedSubscript:@"participants"];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v36 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = [MEMORY[0x1E4FADBD8] normalizedHandleWithDestinationID:*(void *)(*((void *)&v35 + 1) + 8 * i)];
            [v12 addObject:v19];
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v35 objects:v40 count:16];
        }
        while (v16);
      }

      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      v20 = [v6 remoteMembers];
      uint64_t v21 = [v20 countByEnumeratingWithState:&v31 objects:v39 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v32;
        do
        {
          for (uint64_t j = 0; j != v22; ++j)
          {
            if (*(void *)v32 != v23) {
              objc_enumerationMutation(v20);
            }
            v25 = *(void **)(*((void *)&v31 + 1) + 8 * j);
            int v26 = [v25 handle];
            uint64_t v27 = [v26 type];

            if (v27 != 1)
            {
              v28 = [v25 handle];
              [v13 addObject:v28];
            }
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v31 objects:v39 count:16];
        }
        while (v22);
      }

      char v11 = [v12 isEqualToSet:v13];
      id v5 = v30;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (void)updateConversationManagerWithItem:(id)a3 chat:(id)a4 attributes:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id v8 = a4;
  id v24 = a5;
  id v9 = [MEMORY[0x1E4FADA90] sharedInstance];
  v25 = [v9 conversationManager];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = [v25 activeConversations];
  uint64_t v10 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v10)
  {
    uint64_t v12 = *(void *)v33;
    *(void *)&long long v11 = 138412290;
    long long v23 = v11;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        if (-[IMDSharedWithYouMetadataManager chatDictionary:matchesFaceTimeConversation:](self, "chatDictionary:matchesFaceTimeConversation:", v8, v14, v23))
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v15 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v23;
              long long v37 = v14;
              _os_log_impl(&dword_1AFB53000, v15, OS_LOG_TYPE_INFO, "TUConversation matches chatRecord for conversation: %@", buf, 0xCu);
            }
          }
          uint64_t v16 = [(IMDSharedWithYouMetadataManager *)self highlightDictionaryFromAttributes:v24 withItem:v27 chat:v8];
          if (IMOSLoggingEnabled())
          {
            uint64_t v17 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v23;
              long long v37 = v16;
              _os_log_impl(&dword_1AFB53000, v17, OS_LOG_TYPE_INFO, "Going to update Conversation Manager with highlightDictionary: %@", buf, 0xCu);
            }
          }
          uint64_t v18 = [v27 objectForKeyedSubscript:@"flags"];
          char v19 = [v18 unsignedLongLongValue];

          v20 = [MEMORY[0x1E4FADA90] sharedInstance];
          uint64_t v21 = [v20 queue];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = sub_1AFC2D2A4;
          block[3] = &unk_1E5F9CD48;
          block[4] = v14;
          id v29 = v16;
          id v30 = v25;
          BOOL v31 = (v19 & 4) != 0;
          id v22 = v16;
          dispatch_async(v21, block);
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v10);
  }
}

- (id)highlightDictionaryFromAttributes:(id)a3 withItem:(id)a4 chat:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v35 = a4;
  id v33 = a5;
  if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AFB53000, v9, OS_LOG_TYPE_INFO, "Generating highlight dictionary", buf, 2u);
    }
  }
  uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
  if (v8)
  {
    long long v32 = [v8 filename];
    if ([v32 length]) {
      [v10 setObject:v32 forKey:@"fn"];
    }
    BOOL v31 = [v8 contentCreationDate];
    if (v31) {
      [v10 setObject:v31 forKey:@"cd"];
    }
    id v30 = [v35 objectForKey:@"time"];
    if (v30) {
      [v10 setObject:v30 forKey:@"md"];
    }
    id v29 = [v8 contentType];
    if ([v29 length]) {
      [v10 setObject:v29 forKey:@"ct"];
    }
    long long v34 = [v8 URL];
    if (v34)
    {
      long long v11 = [v34 absoluteString];
      [v10 setObject:v11 forKey:@"ru"];

      uint64_t v12 = [(IMDSharedWithYouMetadataManager *)self _uniqueIdentifierForResourceURL:v34];
      if ([v12 length]) {
        [v10 setObject:v12 forKey:@"i"];
      }
    }
    id v13 = [v8 customAttributeDictionary];
    id v28 = [v13 valueForKey:@"com_apple_mobilesms_collaborationIdentifier"];

    id v14 = [MEMORY[0x1E4F1CA98] null];
    if (v28 == v14)
    {
    }
    else
    {
      BOOL v15 = [v28 length] == 0;

      if (!v15) {
        [v10 setObject:v28 forKey:@"ci"];
      }
    }
    uint64_t v17 = [v8 customAttributeDictionary];
    uint64_t v18 = [v17 valueForKey:@"com_apple_mobilesms_ckBundleIDs"];

    if (v18)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {

        uint64_t v18 = (void *)MEMORY[0x1E4F1CBF0];
      }
      [v10 setObject:v18 forKey:@"ckAppBundleIDs"];
    }
    char v19 = [MEMORY[0x1E4F1CA60] dictionary];
    v20 = [v33 objectForKey:@"guid"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [v19 setObject:v20 forKey:@"cid"];
    }
    uint64_t v21 = [v35 objectForKey:@"guid"];
    if ([v21 length]) {
      [v19 setObject:v21 forKey:@"uid"];
    }
    [v19 setObject:@"Messages" forKey:@"sa"];
    [v19 setObject:MEMORY[0x1E4F1CC28] forKey:@"l"];
    id v22 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v23 = [v35 objectForKey:@"handle"];
    if ([v23 length]) {
      [v22 setObject:v23 forKey:@"h"];
    }
    [v19 setObject:v22 forKey:@"s"];
    id v24 = (void *)[v19 copy];
    long long v36 = v24;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
    [v10 setObject:v25 forKey:@"a"];

    if (IMOSLoggingEnabled())
    {
      int v26 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        long long v38 = v10;
        _os_log_impl(&dword_1AFB53000, v26, OS_LOG_TYPE_INFO, "Returning highlight dictionary: %@", buf, 0xCu);
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      long long v38 = 0;
      _os_log_impl(&dword_1AFB53000, v16, OS_LOG_TYPE_INFO, "Nil attributes: %@ passed in. Skipping generating highlight dictionary ", buf, 0xCu);
    }
  }
  return v10;
}

- (id)_uniqueIdentifierForResourceURL:(id)a3
{
  v3 = [a3 absoluteString];
  v4 = [v3 dataUsingEncoding:4];

  id v5 = [(id)objc_opt_class() Sha256ForData:v4 withSalt:0];
  id v6 = [v5 base64EncodedStringWithOptions:0];

  return v6;
}

- (BOOL)_isLNKTypeMessage:(id)a3
{
  v3 = [a3 messageType];
  v4 = v3;
  if (v3) {
    char v5 = [v3 isEqual:@"lnk"];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)_isAttachmentType:(id)a3
{
  v3 = [a3 messageType];
  v4 = v3;
  if (v3) {
    char v5 = [v3 isEqual:@"at"];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (id)titleFromLPLinkMetadata:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    id v7 = 0;
    goto LABEL_19;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v3 collaborationMetadata],
        v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = objc_opt_respondsToSelector(),
        v4,
        (v5 & 1) != 0))
  {
    id v6 = [v3 collaborationMetadata];
    id v7 = [v6 title];
  }
  else
  {
    id v7 = 0;
  }
  if (![v7 length])
  {
    if (!MEMORY[0x1B3E89B10](@"LPSharedObjectMetadata", @"LinkPresentation"))
    {
      uint64_t v17 = [v3 title];
      uint64_t v18 = [v17 length];

      if (v18) {
        goto LABEL_19;
      }
      long long v11 = [v3 title];
      uint64_t v10 = v7;
      goto LABEL_18;
    }
    id v8 = [v3 specialization];
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_19;
    }
    uint64_t v10 = [v3 specialization];
    long long v11 = [v10 title];

    if (![v11 length])
    {
      MEMORY[0x1B3E89B10](@"LPFileMetadata", @"LinkPresentation");
      MEMORY[0x1B3E89B10](@"LPiCloudSharingMetadata", @"LinkPresentation");
      uint64_t v12 = [v10 specialization];
      char v13 = objc_opt_isKindOfClass();

      id v14 = [v10 specialization];
      BOOL v15 = v14;
      if (v13)
      {
        uint64_t v16 = [v14 name];
LABEL_17:
        v20 = (void *)v16;

        long long v11 = v20;
        goto LABEL_18;
      }
      char v19 = objc_opt_isKindOfClass();

      if (v19)
      {
        BOOL v15 = [v10 specialization];
        uint64_t v16 = [v15 title];
        goto LABEL_17;
      }
    }
LABEL_18:

    id v7 = v11;
  }
LABEL_19:

  return v7;
}

- (id)_pluginPayloadAttachmentPathsForItem:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [a3 objectForKeyedSubscript:@"attachments"];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "objectForKeyedSubscript:", @"path", (void)v13);
        if (v10)
        {
          long long v11 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v10];
          [v4 addObject:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_lpLinkMetadataForItem:(id)a3 attachmentPaths:(id)a4 originalURL:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (MEMORY[0x1B3E89B10](@"LPLinkMetadataPresentationTransformer", @"LinkPresentation"))
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F6E718]);
    long long v11 = [v7 objectForKey:@"payloadData"];
    uint64_t v12 = IMSharedHelperCombinedPluginPayloadDictionaryDataWithAttachmentURLs();
    long long v13 = IMSharedHelperPayloadFromCombinedPluginPayloadData();
    [v10 setData:v13];
    long long v14 = [v7 objectForKey:@"guid"];
    [v10 setMessageGUID:v14];
    long long v15 = [v7 objectForKey:@"flags"];
    unint64_t v16 = ((unint64_t)[v15 unsignedLongLongValue] >> 2) & 1;

    [v10 setIsFromMe:v16];
    [v10 setUrl:v9];
    [v10 setAttachments:v8];
    uint64_t v17 = [MEMORY[0x1E4F6E9A8] linkMetadataForPluginPayload:v10];
    uint64_t v18 = (void *)[v17 copy];
  }
  else
  {
    uint64_t v18 = 0;
  }

  return v18;
}

- (BOOL)_shouldDonateToSharedWithYou:(id)a3 lpLinkMetadata:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x2050000000;
    id v7 = (void *)qword_1E9AF8398;
    uint64_t v19 = qword_1E9AF8398;
    if (!qword_1E9AF8398)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      uint64_t v21 = sub_1AFC2E890;
      id v22 = &unk_1E5F8EB38;
      long long v23 = &v16;
      sub_1AFC2E890((uint64_t)&buf);
      id v7 = (void *)v17[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v16, 8);
    id v9 = [v8 alloc];
    id v10 = objc_msgSend(v9, "initWithMetadata:URL:", v6, v5, v16);
    if (v10 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      int v11 = [v10 shouldDonateToSharedWithYou];
      if (IMOSLoggingEnabled())
      {
        uint64_t v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          long long v13 = @"NO";
          if (v11) {
            long long v13 = @"YES";
          }
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v13;
          _os_log_impl(&dword_1AFB53000, v12, OS_LOG_TYPE_INFO, "LP's recommendation is %@", (uint8_t *)&buf, 0xCu);
        }
      }
    }
    else
    {
      LOBYTE(v11) = 1;
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      long long v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1AFB53000, v14, OS_LOG_TYPE_INFO, "Since we failed to get LPLinkMetadata, not asking LP's recommendation here.", (uint8_t *)&buf, 2u);
      }
    }
    LOBYTE(v11) = 1;
  }

  return v11;
}

- (id)_highlightedContentServerDateKey
{
  if (qword_1EB5ABA90 != -1) {
    dispatch_once(&qword_1EB5ABA90, &unk_1F084C568);
  }
  v2 = (void *)qword_1EB5ABA88;
  return v2;
}

- (id)_syndicationContentTypeKey
{
  if (qword_1E9AF8340 != -1) {
    dispatch_once(&qword_1E9AF8340, &unk_1F084C160);
  }
  v2 = (void *)qword_1E9AF8338;
  return v2;
}

- (id)_collaborationIdentifierKey
{
  if (qword_1E9AF8350 != -1) {
    dispatch_once(&qword_1E9AF8350, &unk_1F084C1A0);
  }
  v2 = (void *)qword_1E9AF8348;
  return v2;
}

- (id)_ckBundleIDsKey
{
  if (qword_1E9AF8360 != -1) {
    dispatch_once(&qword_1E9AF8360, &unk_1F084C1C0);
  }
  v2 = (void *)qword_1E9AF8358;
  return v2;
}

- (id)_lpTitleCustomKey
{
  if (qword_1E9AF8370 != -1) {
    dispatch_once(&qword_1E9AF8370, &unk_1F084C1E0);
  }
  v2 = (void *)qword_1E9AF8368;
  return v2;
}

+ (id)collaborationMetadataKey
{
  if (qword_1E9AF8380 != -1) {
    dispatch_once(&qword_1E9AF8380, &unk_1F084C200);
  }
  v2 = (void *)qword_1E9AF8378;
  return v2;
}

+ (id)dataDetectedLink
{
  if (qword_1E9AF8390 != -1) {
    dispatch_once(&qword_1E9AF8390, &unk_1F084D120);
  }
  v2 = (void *)qword_1E9AF8388;
  return v2;
}

@end