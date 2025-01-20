@interface IMDCoreSpotlightMessageAttachmentIndexer
+ (BOOL)_attachmentIsSticker:(id)a3;
+ (BOOL)messageSupportsIndexingForItem:(id)a3;
+ (id)_possibleVideoComplementExtensions;
+ (id)assetUUIDKey;
+ (id)attachmentIndexTypeForPath:(id)a3 filename:(id)a4 isSticker:(BOOL)a5 isCommSafetySensitive:(BOOL)a6 knownSender:(BOOL)a7;
+ (id)attachmentIsSyndicatableMediaKey;
+ (id)attachmentRecordsFromAttachments:(id)a3;
+ (id)auxiliaryItemsForPrimaryAttributes:(id)a3 withItem:(id)a4 chat:(id)a5 isReindexing:(BOOL)a6 timingProfiler:(id)a7 rejectedItems:(id)a8;
+ (id)livePhotoComplementKey;
+ (id)momentShareURLKey;
+ (id)videoComplementPathForResourceURL:(id)a3;
+ (void)indexItem:(id)a3 withChat:(id)a4 isReindexing:(BOOL)a5 metadataToUpdate:(id)a6 timingProfiler:(id)a7;
@end

@implementation IMDCoreSpotlightMessageAttachmentIndexer

+ (void)indexItem:(id)a3 withChat:(id)a4 isReindexing:(BOOL)a5 metadataToUpdate:(id)a6 timingProfiler:(id)a7
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v38 = a4;
  id v40 = a6;
  id v39 = a7;
  v47 = v11;
  v12 = [v11 objectForKey:@"hasAttachments"];
  LODWORD(a6) = [v12 BOOLValue];

  int v13 = [a1 messageSupportsIndexingForItem:v11];
  if (a6 && v13)
  {
    v37 = [v11 objectForKeyedSubscript:@"attachments"];
    v14 = v37;
    if ([v37 count])
    {
      id v41 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v43 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v42 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id obj = v37;
      uint64_t v15 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
      if (v15)
      {
        uint64_t v45 = *MEMORY[0x1E4F6D450];
        uint64_t v46 = *(void *)v49;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v49 != v46) {
              objc_enumerationMutation(obj);
            }
            v17 = *(void **)(*((void *)&v48 + 1) + 8 * i);
            v18 = [v17 objectForKeyedSubscript:@"name"];
            if (([v18 containsString:v45] & 1) == 0)
            {
              v19 = [v17 objectForKeyedSubscript:@"path"];
              uint64_t v20 = [v19 length];
              if (v19) {
                BOOL v21 = v20 == 0;
              }
              else {
                BOOL v21 = 1;
              }
              if (!v21) {
                [v41 addObject:v19];
              }
              v22 = [v17 objectForKeyedSubscript:@"guid"];
              v23 = [v47 objectForKey:@"guid"];
              v24 = [v47 objectForKey:@"attributedBody"];
              v25 = +[IMDAttachmentSyndicationUtilities _syndicationIdentifierForAttachmentGUID:messageGUID:attributedBody:verbose:](IMDAttachmentSyndicationUtilities, "_syndicationIdentifierForAttachmentGUID:messageGUID:attributedBody:verbose:", v22, v23, v24, [MEMORY[0x1E4F6E700] verboseLoggingEnabled]);
              BOOL v26 = [v25 length] == 0;
              int v27 = [MEMORY[0x1E4F6E700] verboseLoggingEnabled];
              if (v26)
              {
                if (v27 && IMOSLoggingEnabled())
                {
                  v29 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1AFB53000, v29, OS_LOG_TYPE_INFO, "Failed to determine attachment name!", buf, 2u);
                  }
                }
              }
              else
              {
                if (v27 && IMOSLoggingEnabled())
                {
                  v28 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    v53 = v25;
                    _os_log_impl(&dword_1AFB53000, v28, OS_LOG_TYPE_INFO, "Adding attachment name %@", buf, 0xCu);
                  }
                }
                [v43 addObject:v25];
              }
              v30 = IMUTITypeForFilename();
              int v31 = [MEMORY[0x1E4F6E700] verboseLoggingEnabled];
              if (v30)
              {
                if (v31 && IMOSLoggingEnabled())
                {
                  v32 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    v53 = v30;
                    _os_log_impl(&dword_1AFB53000, v32, OS_LOG_TYPE_INFO, "Adding attachment UTI type to %@", buf, 0xCu);
                  }
                }
                [v42 addObject:v30];
              }
              else if (v31 && IMOSLoggingEnabled())
              {
                v33 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1AFB53000, v33, OS_LOG_TYPE_INFO, "Failed to determine attachment UTI type!", buf, 2u);
                }
              }
            }
          }
          uint64_t v15 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
        }
        while (v15);
      }

      if ([v41 count])
      {
        [v40 setAttachmentPaths:v41];
      }
      else if ([MEMORY[0x1E4F6E700] verboseLoggingEnabled] {
             && IMOSLoggingEnabled())
      }
      {
        v34 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AFB53000, v34, OS_LOG_TYPE_INFO, "No attachment Paths to add", buf, 2u);
        }
      }
      if ([v43 count])
      {
        [v40 setAttachmentNames:v43];
      }
      else if ([MEMORY[0x1E4F6E700] verboseLoggingEnabled] {
             && IMOSLoggingEnabled())
      }
      {
        v35 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AFB53000, v35, OS_LOG_TYPE_INFO, "No attachment names to add", buf, 2u);
        }
      }
      if ([v42 count])
      {
        [v40 setAttachmentTypes:v42];
      }
      else if ([MEMORY[0x1E4F6E700] verboseLoggingEnabled] {
             && IMOSLoggingEnabled())
      }
      {
        v36 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AFB53000, v36, OS_LOG_TYPE_INFO, "No attachment types to add", buf, 2u);
        }
      }
      v14 = v37;
    }
  }
}

+ (id)auxiliaryItemsForPrimaryAttributes:(id)a3 withItem:(id)a4 chat:(id)a5 isReindexing:(BOOL)a6 timingProfiler:(id)a7 rejectedItems:(id)a8
{
  uint64_t v167 = *MEMORY[0x1E4F143B8];
  id v124 = a3;
  id v12 = a4;
  id v130 = a5;
  id v115 = a7;
  id v121 = a8;
  _IMDCoreRecentsApiInit();
  v143 = v12;
  int v13 = [v12 objectForKey:@"hasAttachments"];
  LODWORD(a8) = [v13 BOOLValue];

  LODWORD(v13) = [a1 messageSupportsIndexingForItem:v12];
  v123 = [v130 objectForKey:@"groupName"];
  v128 = [v12 objectForKey:@"messageSummaryInfo"];
  v14 = [v128 objectForKey:*MEMORY[0x1E4F6D638]];
  uint64_t v135 = [v14 unsignedIntegerValue];

  id v125 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v15 = 0x1E4F6E000;
  if ((a8 & v13) == 1)
  {
    [v12 objectForKeyedSubscript:@"attachments"];
    long long v153 = 0u;
    long long v154 = 0u;
    long long v151 = 0u;
    long long v152 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v136 = [obj countByEnumeratingWithState:&v151 objects:v166 count:16];
    if (!v136) {
      goto LABEL_153;
    }
    uint64_t v133 = *(void *)v152;
    uint64_t v127 = *MEMORY[0x1E4F6D630];
    uint64_t v116 = *MEMORY[0x1E4F6CAD0];
    uint64_t v118 = *MEMORY[0x1E4F6D3F0];
    uint64_t v119 = *MEMORY[0x1E4F6D3E8];
    while (1)
    {
      for (uint64_t i = 0; i != v136; ++i)
      {
        if (*(void *)v152 != v133) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v151 + 1) + 8 * i);
        v145 = [v17 objectForKeyedSubscript:@"guid"];
        v146 = [v143 objectForKey:@"guid"];
        v144 = [v143 objectForKey:@"attributedBody"];
        v18 = +[IMDAttachmentSyndicationUtilities _syndicationIdentifierForAttachmentGUID:messageGUID:attributedBody:verbose:](IMDAttachmentSyndicationUtilities, "_syndicationIdentifierForAttachmentGUID:messageGUID:attributedBody:verbose:", v145, v146, v144, [MEMORY[0x1E4F6E700] verboseLoggingEnabled]);
        if (!v135
          || (unint64_t v19 = IMCMMAssetIndexFromIMFileTransferGUID(),
              [v128 objectForKey:v127],
              uint64_t v20 = objc_claimAutoreleasedReturnValue(),
              unint64_t v21 = [v20 unsignedIntegerValue],
              v20,
              v19 >= v21))
        {
          v142 = [v17 objectForKeyedSubscript:@"uti"];
          v23 = [v17 objectForKeyedSubscript:@"previewGenerationState"];
          [v23 unsignedLongLongValue];

          id v150 = 0;
          char v24 = IMShouldAllowInteractionlessUsageOfUTITypeWithPreviewGenerationState();
          id v140 = v150;
          if (v24)
          {
            v25 = (void *)[v124 copy];
            uint64_t v26 = IMCMMAssetIndexFromIMFileTransferGUID();
            id v27 = objc_alloc(MEMORY[0x1E4F6E868]);
            v28 = [MEMORY[0x1E4F6E860] defaultPrefix];
            v134 = (void *)[v27 initWithMessageGUID:v146 prefix:v28 partNumber:v26];

            v141 = [v17 objectForKeyedSubscript:@"path"];
            if ([v141 length])
            {
              if (v141)
              {
                v129 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v141 isDirectory:0];
                if (v129)
                {
                  [v25 setContentURL:v129];
                  v29 = [a1 videoComplementPathForResourceURL:v129];
                  if (v29)
                  {
                    v30 = [a1 livePhotoComplementKey];
                    [v25 setValue:v29 forCustomKey:v30];
                  }
                }
                v157 = v141;
                int v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v157 count:1];
                [v25 setAttachmentPaths:v31];
              }
              else
              {
                v129 = 0;
              }
              v137 = [v17 objectForKeyedSubscript:@"name"];
              if ([v137 length])
              {
                [v25 setTextContent:v137];
                if ([MEMORY[0x1E4F6E700] verboseLoggingEnabled])
                {
                  if (IMOSLoggingEnabled())
                  {
                    v33 = OSLogHandleForIMFoundationCategory();
                    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412290;
                      unint64_t v159 = (unint64_t)v137;
                      _os_log_impl(&dword_1AFB53000, v33, OS_LOG_TYPE_INFO, "setting text content %@", buf, 0xCu);
                    }
                  }
                }
              }
              BOOL v34 = [v18 length] == 0;
              int v35 = [MEMORY[0x1E4F6E700] verboseLoggingEnabled];
              if (v34)
              {
                if (v35 && IMOSLoggingEnabled())
                {
                  id v38 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1AFB53000, v38, OS_LOG_TYPE_INFO, "Failed to determine attachment name!", buf, 2u);
                  }
                }
              }
              else
              {
                if (v35 && IMOSLoggingEnabled())
                {
                  v36 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    unint64_t v159 = (unint64_t)v18;
                    _os_log_impl(&dword_1AFB53000, v36, OS_LOG_TYPE_INFO, "setting attachment name %@", buf, 0xCu);
                  }
                }
                v156 = v18;
                v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v156 count:1];
                [v25 setAttachmentNames:v37];
              }
              id v39 = [v143 objectForKeyedSubscript:@"knownSender"];
              unsigned int v132 = [v39 BOOLValue];

              id v40 = [v17 objectForKeyedSubscript:@"isCommSafetySensitive"];
              uint64_t v41 = [v40 BOOLValue];

              v138 = objc_msgSend(a1, "attachmentIndexTypeForPath:filename:isSticker:isCommSafetySensitive:knownSender:", v141, v137, objc_msgSend(a1, "_attachmentIsSticker:", v17), v41, v132);
              int v42 = [MEMORY[0x1E4F6E700] verboseLoggingEnabled];
              if (v138)
              {
                if (v42 && IMOSLoggingEnabled())
                {
                  id v43 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    unint64_t v159 = (unint64_t)v138;
                    _os_log_impl(&dword_1AFB53000, v43, OS_LOG_TYPE_INFO, "Setting attachment index type to %@", buf, 0xCu);
                  }
                }
                [v25 setMessageType:v138];
                v44 = [v25 messageType];
                int v45 = [v44 isEqualToString:@"ad"];

                if (v45)
                {
                  uint64_t v46 = [v144 attribute:v116 atIndex:0 effectiveRange:0];
                  if (v46) {
                    [v25 setTextContent:v46];
                  }
                  goto LABEL_60;
                }
              }
              else if (v42 && IMOSLoggingEnabled())
              {
                uint64_t v46 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1AFB53000, v46, OS_LOG_TYPE_INFO, "Failed to determine attachment index type!", buf, 2u);
                }
LABEL_60:
              }
              v131 = IMUTITypeForFilename();
              int v47 = [MEMORY[0x1E4F6E700] verboseLoggingEnabled];
              if (v131)
              {
                if (v47 && IMOSLoggingEnabled())
                {
                  long long v48 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    unint64_t v159 = (unint64_t)v131;
                    _os_log_impl(&dword_1AFB53000, v48, OS_LOG_TYPE_INFO, "Setting attachment UTI type to %@", buf, 0xCu);
                  }
                }
                v155 = v131;
                long long v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v155 count:1];
                [v25 setAttachmentTypes:v49];
              }
              else if (v47 && IMOSLoggingEnabled())
              {
                long long v50 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1AFB53000, v50, OS_LOG_TYPE_INFO, "Failed to determine attachment UTI type!", buf, 2u);
                }
              }
              if (([v138 isEqualToString:@"pa"] & v132) == 1)
              {
                v122 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v141];
                id v51 = objc_alloc(MEMORY[0x1E4F84850]);
                id v149 = 0;
                v52 = (void *)[v51 initWithData:v122 error:&v149];
                id v120 = v149;
                if (v52)
                {
                  v53 = [MEMORY[0x1E4F1CA48] array];
                  v54 = [v52 localizedName];
                  uint64_t v55 = [v52 localizedDescription];
                  v56 = [v52 organizationName];
                  if (v54) {
                    [v53 addObject:v54];
                  }
                  if (v55) {
                    [v53 addObject:v55];
                  }
                  if (v56) {
                    [v53 addObject:v56];
                  }
                  v57 = [v53 componentsJoinedByString:@" "];
                  [v25 setTextContent:v57];
                }
                else if ([MEMORY[0x1E4F6E700] verboseLoggingEnabled] {
                       && IMOSLoggingEnabled())
                }
                {
                  v58 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
                  {
                    id v59 = [v25 attributeDictionary];
                    *(_DWORD *)buf = 138412546;
                    unint64_t v159 = (unint64_t)v59;
                    __int16 v160 = 2112;
                    unint64_t v161 = (unint64_t)v120;
                    _os_log_impl(&dword_1AFB53000, v58, OS_LOG_TYPE_INFO, "Indexing .pkpass with attributes %@ error %@", buf, 0x16u);
                  }
                }
              }
              if ([v138 isEqualToString:@"ct"])
              {
                if (!v132) {
                  goto LABEL_112;
                }
              }
              else if (([v138 isEqualToString:@"loc"] & v132 & 1) == 0)
              {
                goto LABEL_112;
              }
              v60 = [v143 objectForKey:@"flags"];
              unint64_t v61 = [v60 unsignedLongLongValue];

              if (!((v61 >> 2) & 1 | a6))
              {
                v62 = [v143 objectForKey:@"time"];
                v63 = [v143 objectForKey:@"lalh"];
                v64 = [v63 _stripFZIDPrefix];

                id v65 = [v143 objectForKey:@"handle"];

                id v148 = 0;
                _AddLocationsFromVCFToCoreRecents(v141, v146, v65, v62, &v148);
                id v66 = v148;
                if (v66)
                {
                  if ([MEMORY[0x1E4F6E700] verboseLoggingEnabled]
                    && IMOSLoggingEnabled())
                  {
                    v67 = OSLogHandleForIMFoundationCategory();
                    if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412290;
                      unint64_t v159 = (unint64_t)v66;
                      _os_log_impl(&dword_1AFB53000, v67, OS_LOG_TYPE_INFO, "Got address to index %@", buf, 0xCu);
                    }
                  }
                  [v25 setFullyFormattedAddress:v66];
                  if ([MEMORY[0x1E4F6E700] verboseLoggingEnabled]
                    && IMOSLoggingEnabled())
                  {
                    v68 = OSLogHandleForIMFoundationCategory();
                    if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412290;
                      unint64_t v159 = (unint64_t)v66;
                      _os_log_impl(&dword_1AFB53000, v68, OS_LOG_TYPE_INFO, "Setting address to %@", buf, 0xCu);
                    }
                  }
                }
              }
              if ([v138 isEqualToString:@"loc"])
              {
                v69 = +[IMDContactCache contactsForVCardAtPath:v141];
                v70 = [v69 firstObject];

                v71 = +[IMDContactCache vCardNameForContact:v70];
                v72 = +[IMDContactCache vCardMapURLForContact:v70];
                uint64_t v147 = 0;
                +[IMDContactCache vCardCoordinateForMapURL:v72 outLatitude:(char *)&v147 + 4 outLongitude:&v147];
                [v25 setTextContent:v71];
                [v25 setFullyFormattedAddress:0];
                +[IMDContactCache updateAttributes:v25 withAddressFromContact:v70];
                LODWORD(v73) = HIDWORD(v147);
                v74 = [MEMORY[0x1E4F28ED0] numberWithFloat:v73];
                [v25 setLatitude:v74];

                LODWORD(v75) = v147;
                v76 = [MEMORY[0x1E4F28ED0] numberWithFloat:v75];
                [v25 setLongitude:v76];

                v77 = [MEMORY[0x1E4F1CB10] URLWithString:v72];
                [v25 setURL:v77];

                if ([MEMORY[0x1E4F6E700] verboseLoggingEnabled]
                  && IMOSLoggingEnabled())
                {
                  v78 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
                  {
                    id v79 = [v25 attributeDictionary];
                    *(_DWORD *)buf = 138412290;
                    unint64_t v159 = (unint64_t)v79;
                    _os_log_impl(&dword_1AFB53000, v78, OS_LOG_TYPE_INFO, "Indexing .loc.vcf with attributes %@", buf, 0xCu);
                  }
                }
              }
LABEL_112:
            }
            if (v142) {
              [v25 setContentType:v142];
            }
            v80 = [v143 objectForKey:@"syndicationRanges"];
            v81 = [v17 objectForKeyedSubscript:@"isCommSafetySensitive"];
            uint64_t v82 = [v81 BOOLValue];

            if (([a1 _attachmentIsSticker:v17] & 1) == 0)
            {
              LOBYTE(v114) = [MEMORY[0x1E4F6E700] verboseLoggingEnabled];
              unint64_t v83 = +[IMDAttachmentSyndicationUtilities _attachmentSyndicationTypeForAttachmentGUID:syndicationIdentifier:attachmentUTI:attributedBody:encodedSyndicationRanges:isCommSafetySensitive:verbose:](IMDAttachmentSyndicationUtilities, "_attachmentSyndicationTypeForAttachmentGUID:syndicationIdentifier:attachmentUTI:attributedBody:encodedSyndicationRanges:isCommSafetySensitive:verbose:", v145, v18, v142, v144, v80, v82, v114, v115);
              if (v83 == 1)
              {
                LOBYTE(v114) = [MEMORY[0x1E4F6E700] verboseLoggingEnabled];
                BOOL v88 = +[IMDAttachmentSyndicationUtilities _attachmentGUIDIsSyndicatable:v145 syndicationIdentifier:v18 attachmentUTI:v142 attributedBody:v144 encodedSyndicationRanges:v80 isCMM:v135 != 0 verbose:v114];
                v89 = [MEMORY[0x1E4F28ED0] numberWithBool:v88];
                v90 = [a1 attachmentIsSyndicatableMediaKey];
                [v25 setValue:v89 forCustomKey:v90];

                if ([v18 hasPrefix:@"at_"])
                {
                  v91 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
                  [v25 setEligibleForPhotosProcessing:v91];
                }
                else if (IMOSLoggingEnabled())
                {
                  v92 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    unint64_t v159 = (unint64_t)v18;
                    _os_log_impl(&dword_1AFB53000, v92, OS_LOG_TYPE_INFO, "Not marking item as Syndicatable. identifier: %@", buf, 0xCu);
                  }
                }
              }
              else if (!v83)
              {
                v84 = objc_alloc_init(IMDSharedWithYouMetadataManager);
                v85 = [(IMDSharedWithYouMetadataManager *)v84 updateAttributesWithSharedWithYouMetadata:v25 withItem:v143 chat:v130];
                if (v85)
                {
                  if (IMOSLoggingEnabled())
                  {
                    v86 = OSLogHandleForIMFoundationCategory();
                    if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_1AFB53000, v86, OS_LOG_TYPE_INFO, "Appended Shared with You meta-data", buf, 2u);
                    }
                  }
                  id v87 = v85;

                  v25 = v87;
                }
              }
            }
            v93 = [v17 objectForKeyedSubscript:@"attributionInfo"];
            v94 = v93;
            if (v93)
            {
              v95 = [v93 objectForKey:v119];
              if (v95)
              {
                v96 = [a1 momentShareURLKey];
                [v25 setValue:v95 forCustomKey:v96];
              }
              v97 = [v94 objectForKey:v118];
              if (v97)
              {
                v98 = [a1 assetUUIDKey];
                [v25 setValue:v97 forCustomKey:v98];
              }
            }
            v99 = [v130 objectForKey:@"guid"];
            if ([MEMORY[0x1E4F6E700] verboseLoggingEnabled]
              && IMOSLoggingEnabled())
            {
              v100 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v100, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                unint64_t v159 = (unint64_t)v146;
                __int16 v160 = 2112;
                unint64_t v161 = (unint64_t)v99;
                _os_log_impl(&dword_1AFB53000, v100, OS_LOG_TYPE_INFO, "Creating new attribute set with messageGUID %@ chatGUID %@", buf, 0x16u);
              }
            }
            v101 = _IMDCoreSpotlightChatUIDForChatDictionary(v130);
            if (v101)
            {
              v102 = [a1 chatUniqueIdentifierKey];
              [v25 setValue:v101 forCustomKey:v102];
            }
            else if (IMOSLoggingEnabled())
            {
              v103 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v103, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1AFB53000, v103, OS_LOG_TYPE_INFO, "Not donating the chat's unique identifier to spotlight because it was nil.", buf, 2u);
              }
            }
            [v25 setAccountIdentifier:v99];
            [v25 setOwnerIdentifier:v146];
            [v25 setRelatedUniqueIdentifier:v146];
            v104 = [v134 encodedMessagePartGUID];
            v105 = [v25 textContent];
            v106 = [v143 objectForKey:@"time"];
            [v25 associateMessageEntityWithIdentifier:v104 displayTitle:v105 displaySubtitle:v123 date:v106];

            v107 = (void *)[objc_alloc(MEMORY[0x1E4F23840]) initWithUniqueIdentifier:v18 domainIdentifier:@"attachmentDomain" attributeSet:v25];
            v108 = [MEMORY[0x1E4F1C9C8] distantFuture];
            [v107 setExpirationDate:v108];

            [v125 addObject:v107];
LABEL_149:
          }
          else
          {
            if (IMOSLoggingEnabled())
            {
              v32 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138543874;
                unint64_t v159 = (unint64_t)v140;
                __int16 v160 = 2112;
                unint64_t v161 = (unint64_t)v145;
                __int16 v162 = 2112;
                v163 = v142;
                _os_log_impl(&dword_1AFB53000, v32, OS_LOG_TYPE_INFO, "Not donating attachment to CoreSpotlight because %{public}@. attachmentGUID: %@ UTI: %@", buf, 0x20u);
              }
            }
            if (v18)
            {
              v25 = (void *)[objc_alloc(MEMORY[0x1E4F6E6F8]) initWithDomain:@"attachmentDomain" identifier:v18 reason:1010];
              [v121 addObject:v25];
              goto LABEL_149;
            }
          }

          goto LABEL_151;
        }
        if (IMOSLoggingEnabled())
        {
          v22 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218754;
            unint64_t v159 = v19;
            __int16 v160 = 2048;
            unint64_t v161 = v21;
            __int16 v162 = 2112;
            v163 = v145;
            __int16 v164 = 2112;
            v165 = v18;
            _os_log_impl(&dword_1AFB53000, v22, OS_LOG_TYPE_INFO, "Not donating CMM preview attachment to CoreSpotlight. attachmentIndex: %lu, cmmOffset: %lu, attachmentGUID: %@, syndicationIdentifier: %@", buf, 0x2Au);
          }
        }
LABEL_151:
      }
      uint64_t v136 = [obj countByEnumeratingWithState:&v151 objects:v166 count:16];
      if (!v136)
      {
LABEL_153:

        unint64_t v15 = 0x1E4F6E000uLL;
        break;
      }
    }
  }
  if ([*(id *)(v15 + 1792) verboseLoggingEnabled])
  {
    v109 = [v143 objectForKey:@"guid"];
    if (IMOSLoggingEnabled())
    {
      v110 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
      {
        uint64_t v111 = [v125 count];
        *(_DWORD *)buf = 134218242;
        unint64_t v159 = v111;
        __int16 v160 = 2112;
        unint64_t v161 = (unint64_t)v109;
        _os_log_impl(&dword_1AFB53000, v110, OS_LOG_TYPE_INFO, "Generated %lu aux items for message guid %@", buf, 0x16u);
      }
    }
  }
  id v112 = v125;

  return v112;
}

+ (id)attachmentIndexTypeForPath:(id)a3 filename:(id)a4 isSticker:(BOOL)a5 isCommSafetySensitive:(BOOL)a6 knownSender:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  int v13 = [v12 pathExtension];
  v14 = [v13 lowercaseString];

  int v15 = [v14 isEqualToString:@"vcf"];
  int v16 = objc_msgSend(v14, "im_isAudioMessageExtension");
  if ([v14 isEqualToString:@"pluginpayload"]) {
    char v17 = 1;
  }
  else {
    char v17 = [v14 isEqualToString:@"pluginpayloadattachment"];
  }
  int v18 = [v14 isEqualToString:@"pkpass"];
  int v19 = [v14 isEqualToString:@"order"];
  char v20 = v16 | v17;
  if (v16) {
    unint64_t v21 = @"ad";
  }
  else {
    unint64_t v21 = @"pp";
  }
  if ((v20 & 1) == 0)
  {
    if ((v18 | v19))
    {
      unint64_t v21 = @"pa";
    }
    else if (v15)
    {
      v22 = [v12 stringByDeletingPathExtension];
      v23 = [v22 pathExtension];
      int v24 = [v23 isEqualToString:@"loc"];

      if (v24) {
        unint64_t v21 = @"loc";
      }
      else {
        unint64_t v21 = @"ct";
      }
    }
    else
    {
      v25 = IMUTITypeForFilename();
      uint64_t v26 = [MEMORY[0x1E4F6E8F8] sharedInstance];
      id v27 = (void *)[v26 previewGeneratorClassForUTIType:v25];

      if ([MEMORY[0x1E4F6E700] verboseLoggingEnabled]
        && IMOSLoggingEnabled())
      {
        v28 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          int v34 = 138412546;
          int v35 = v25;
          __int16 v36 = 2112;
          v37 = v27;
          _os_log_impl(&dword_1AFB53000, v28, OS_LOG_TYPE_INFO, "UTI Type is %@ generator class is %@", (uint8_t *)&v34, 0x16u);
        }
      }
      if ([v27 isEqual:objc_opt_class()])
      {
        if (v9)
        {
          v29 = @"st";
        }
        else if (v7 && (IMDCoreSpotlightPhotoAtPathIsScreenshot(v11) & 1) != 0)
        {
          v29 = @"scr";
        }
        else
        {
          v29 = @"pto";
        }
      }
      else
      {
        if ([v27 isEqual:objc_opt_class()])
        {
          v29 = @"apto";
          v30 = @"st";
          BOOL v31 = !v9;
        }
        else
        {
          int v32 = [v27 isEqual:objc_opt_class()];
          v29 = @"at";
          v30 = @"mov";
          BOOL v31 = v32 == 0;
        }
        if (!v31) {
          v29 = v30;
        }
      }
      if (v8) {
        unint64_t v21 = @"csspto";
      }
      else {
        unint64_t v21 = v29;
      }
    }
  }

  return v21;
}

+ (BOOL)_attachmentIsSticker:(id)a3
{
  if (IMDCoreSpotlightMessageAttachmentIndexer_TestOverrideIsSticker) {
    return 1;
  }
  v4 = [a3 objectForKeyedSubscript:@"isSticker"];
  char v5 = [v4 BOOLValue];

  return v5;
}

+ (BOOL)messageSupportsIndexingForItem:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 objectForKey:@"balloonBundleID"];
  char v5 = [v3 objectForKey:@"hasAttachments"];
  int v6 = [v5 BOOLValue];

  BOOL v7 = [v3 objectForKey:@"messageSummaryInfo"];
  BOOL v8 = [(__CFString *)v7 objectForKey:*MEMORY[0x1E4F6D638]];
  uint64_t v9 = [v8 unsignedIntegerValue];

  BOOL v10 = v9 == 4 || v4 == 0;
  if ([MEMORY[0x1E4F6E700] verboseLoggingEnabled])
  {
    if (IMOSLoggingEnabled())
    {
      id v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v18 = 138412290;
        int v19 = v7;
        _os_log_impl(&dword_1AFB53000, v11, OS_LOG_TYPE_INFO, "messageSummaryInfo: %@", (uint8_t *)&v18, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      id v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v13 = @"NO";
        if (v6) {
          v14 = @"YES";
        }
        else {
          v14 = @"NO";
        }
        if (v4) {
          int v15 = @"YES";
        }
        else {
          int v15 = @"NO";
        }
        int v18 = 138413058;
        int v19 = v14;
        if (v9) {
          int v16 = @"YES";
        }
        else {
          int v16 = @"NO";
        }
        __int16 v20 = 2112;
        unint64_t v21 = v15;
        __int16 v22 = 2112;
        v23 = v16;
        if (v10) {
          int v13 = @"YES";
        }
        __int16 v24 = 2112;
        v25 = v13;
        _os_log_impl(&dword_1AFB53000, v12, OS_LOG_TYPE_INFO, "messageHasAttachments %@ isPlugin %@ isCMM %@ messageSupportsIndexing %@", (uint8_t *)&v18, 0x2Au);
      }
    }
  }

  return v10;
}

+ (id)_possibleVideoComplementExtensions
{
  return &unk_1F0864FC8;
}

+ (id)videoComplementPathForResourceURL:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v21 = [v4 pathExtension];
  char v5 = [v4 path];
  int v6 = [v5 stringByDeletingPathExtension];
  [a1 _possibleVideoComplementExtensions];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    __int16 v20 = v5;
    BOOL v10 = 0;
    uint64_t v11 = *(void *)v23;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v23 != v11) {
        objc_enumerationMutation(v7);
      }
      int v13 = *(void **)(*((void *)&v22 + 1) + 8 * v12);
      if ([v21 isEqualToString:v13]) {
        goto LABEL_11;
      }
      v14 = [v6 stringByAppendingPathExtension:v13];

      int v15 = [MEMORY[0x1E4F28CB8] defaultManager];
      char v16 = [v15 fileExistsAtPath:v14];

      if (v16) {
        goto LABEL_14;
      }
      uint64_t v17 = [v13 uppercaseString];
      BOOL v10 = [v6 stringByAppendingPathExtension:v17];

      int v18 = [MEMORY[0x1E4F28CB8] defaultManager];
      LOBYTE(v17) = [v18 fileExistsAtPath:v10];

      if (v17) {
        break;
      }
      if (v9 == ++v12)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v9) {
          goto LABEL_3;
        }
LABEL_11:

        v14 = 0;
        goto LABEL_14;
      }
    }
    v14 = v10;
LABEL_14:
    char v5 = v20;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)attachmentRecordsFromAttachments:(id)a3
{
  id v3 = a3;
  return v3;
}

+ (id)attachmentIsSyndicatableMediaKey
{
  if (qword_1EB5ABB50 != -1) {
    dispatch_once(&qword_1EB5ABB50, &unk_1F084D398);
  }
  v2 = (void *)qword_1EB5ABB68;
  return v2;
}

+ (id)livePhotoComplementKey
{
  if (qword_1EB5ABB60 != -1) {
    dispatch_once(&qword_1EB5ABB60, &unk_1F084D3B8);
  }
  v2 = (void *)qword_1EB5ABB58;
  return v2;
}

+ (id)momentShareURLKey
{
  if (qword_1E9AF80E8 != -1) {
    dispatch_once(&qword_1E9AF80E8, &unk_1F084D3D8);
  }
  v2 = (void *)qword_1E9AF80E0;
  return v2;
}

+ (id)assetUUIDKey
{
  if (qword_1E9AF80F8 != -1) {
    dispatch_once(&qword_1E9AF80F8, &unk_1F084D3F8);
  }
  v2 = (void *)qword_1E9AF80F0;
  return v2;
}

@end