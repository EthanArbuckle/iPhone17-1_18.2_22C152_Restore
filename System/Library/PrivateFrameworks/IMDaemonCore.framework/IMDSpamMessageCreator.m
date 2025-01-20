@interface IMDSpamMessageCreator
- (BOOL)_isMessageMMS:(id)a3 forChat:(id)a4;
- (BOOL)_textMessageReportToIDSAllowedForMessageItem:(id)a3 chat:(id)a4 notifyInternalSecurity:(BOOL)a5;
- (BOOL)hasDataDetectedInformalPayment:(id)a3;
- (BOOL)isSurfPayment:(id)a3;
- (id)metaDataForSurfURL:(id)a3;
- (id)surfURLForIMMessageItem:(id)a3;
- (id)transferForGuid:(id)a3;
- (void)_addSnapNameKeysToReportMessageDictionary:(id)a3 forSender:(id)a4;
- (void)_reportToIDSTextMessageSpam:(id)a3;
- (void)_reportToIDSiMessageSpam:(id)a3;
- (void)addTextMessageJunkKeysToReportMessageDictionary:(id)a3 forMessage:(id)a4 chat:(id)a5 receiverURI:(id)a6;
- (void)addiMessageJunkKeysToReportMessageDictionary:(id)a3 forMessage:(id)a4 withGUID:(id)a5 contentLength:(unint64_t)a6 chat:(id)a7;
- (void)reportMessageDictionariesForMessages:(id)a3 withLastAddressedHandle:(id)a4 maxMessageLength:(unint64_t)a5 isAutoReport:(BOOL)a6 withChat:(id)a7 maxMessagesToReport:(unint64_t)a8 totalMessageCount:(unint64_t *)a9 notifyInternalSecurity:(BOOL)a10 isJunkReportedToCarrier:(BOOL)a11 reportReason:(unint64_t)a12 iMessageReportSpamDictionaries:(id)a13 textMessageReportSpamDictionaries:(id)a14;
- (void)reportUnknownToIDS:(id)a3 messageID:(id)a4 isBlackholed:(BOOL)a5 isiMessageJunk:(BOOL)a6 messageServerTimestamp:(id)a7 toURI:(id)a8;
@end

@implementation IMDSpamMessageCreator

- (id)transferForGuid:(id)a3
{
  id v3 = a3;
  v4 = +[IMDFileTransferCenter sharedInstance];
  v5 = [v4 transferForGUID:v3];

  return v5;
}

- (void)reportMessageDictionariesForMessages:(id)a3 withLastAddressedHandle:(id)a4 maxMessageLength:(unint64_t)a5 isAutoReport:(BOOL)a6 withChat:(id)a7 maxMessagesToReport:(unint64_t)a8 totalMessageCount:(unint64_t *)a9 notifyInternalSecurity:(BOOL)a10 isJunkReportedToCarrier:(BOOL)a11 reportReason:(unint64_t)a12 iMessageReportSpamDictionaries:(id)a13 textMessageReportSpamDictionaries:(id)a14
{
  BOOL v16 = a6;
  v158 = self;
  v121 = a9;
  uint64_t v174 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v123 = a4;
  id v138 = a7;
  id v130 = a13;
  id v131 = a14;
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v21 = (void *)qword_1EBE2C340;
  qword_1EBE2C340 = (uint64_t)v20;

  long long v170 = 0u;
  long long v171 = 0u;
  long long v168 = 0u;
  long long v169 = 0u;
  id v22 = v19;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v168 objects:v173 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    unint64_t v129 = 0;
    unint64_t v132 = 0;
    unint64_t v133 = 0;
    BOOL v134 = a10;
    BOOL v135 = !a11 || a10;
    LOBYTE(v25) = a10 || a11;
    unint64_t v127 = a8;
    unint64_t v128 = a5;
    unint64_t v124 = a12;
    unint64_t v125 = a5 - 1;
    unint64_t v122 = a12 - 1;
    uint64_t v26 = *(void *)v169;
    id v137 = v22;
    uint64_t v149 = v26;
    BOOL v126 = v16;
    do
    {
      uint64_t v27 = 0;
      uint64_t v145 = v24;
      do
      {
        if (*(void *)v169 != v26)
        {
          uint64_t v28 = v27;
          objc_enumerationMutation(v22);
          uint64_t v27 = v28;
        }
        uint64_t v153 = v27;
        v29 = *(void **)(*((void *)&v168 + 1) + 8 * v27);
        if (![v29 type] && (objc_msgSend(v29, "isTypingMessage") & 1) == 0)
        {
          id v152 = v29;
          if (([v29 isSuggestedActionResponse] & 1) == 0)
          {
            if (v25)
            {
              id v30 = v152;
              LODWORD(v25) = [(IMDSpamMessageCreator *)v158 _textMessageReportToIDSAllowedForMessageItem:v152 chat:v138 notifyInternalSecurity:v134];
            }
            else
            {
              LODWORD(v25) = 0;
              id v30 = v152;
            }
            v31 = +[IMDServiceController sharedController];
            v32 = [v30 service];
            v33 = [v31 serviceWithName:v32];

            int v34 = [v33 supportsCapability:*MEMORY[0x1E4F6DFC0]];
            uint64_t v35 = *MEMORY[0x1E4F6E108];
            id v150 = v33;
            int v36 = [v33 supportsCapability:v35];
            if ((v36 & v25 & 1) != 0 || (v135 & v34) != 0)
            {
              int v143 = v36;
              int v140 = v34;
              int v148 = (int)v25;
              v151 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
              id v37 = v152;
              v38 = [v152 fileTransferGUIDs];
              uint64_t v39 = [v38 count];

              v40 = [v37 plainBody];
              if ([v40 length])
              {
                id v142 = v40;
                v41 = [v40 dataUsingEncoding:4];
              }
              else
              {
                v42 = [v37 body];
                uint64_t v43 = [v42 length];

                if (v43)
                {
                  v44 = [v37 body];
                  v45 = [v44 string];

                  v41 = [v45 dataUsingEncoding:4];
                  id v142 = v45;
                }
                else
                {
                  id v142 = v40;
                  v41 = [MEMORY[0x1E4F1C9B8] data];
                }
              }
              id v147 = v41;
              unint64_t v139 = [v41 length];
              id v46 = v152;
              v47 = [v152 sender];
              v48 = objc_msgSend(v47, "im_stripCategoryLabel");
              v49 = [v48 _stripFZIDPrefix];
              v50 = [v49 _bestGuessURI];

              if ([v46 isFromMe] && !objc_msgSend(v50, "length"))
              {
                v110 = [v123 _stripFZIDPrefix];
                v111 = [v110 _bestGuessURI];

                id v146 = v111;
              }
              else
              {
                id v146 = v50;
              }
              id v22 = v137;
              id v51 = v152;
              id v144 = [v152 guid];
              v52 = [v51 account];
              id v53 = [v52 _stripFZIDPrefix];

              v54 = [v51 time];
              [v54 timeIntervalSince1970];
              double v56 = v55;

              if (v53)
              {
                id v141 = v53;
                int v57 = v140;
                if ((v143 | v140) != 1
                  || (!v143 ? (id v58 = v130) : (id v58 = v131),
                      [v58 objectForKey:v141],
                      (id v59 = (id)objc_claimAutoreleasedReturnValue()) == 0))
                {
                  id v59 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                }
                id v136 = v59;
                if (v139 > v128) {
                  int v60 = v57;
                }
                else {
                  int v60 = 0;
                }
                if (v60 == 1)
                {
                  MEMORY[0x1F4188790](v59);
                  v62 = (char *)&v121 - ((v61 + 15) & 0xFFFFFFFFFFFFFFF0);
                  size_t v63 = v61;
                  bzero(v62, v61);
                  bzero(v62, v63);
                  id v64 = v147;
                  [v147 getBytes:v62 length:v125];
                  size_t v65 = v63;
                  id v22 = v137;
                  v66 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v62 length:v65];

                  id v147 = v66;
                }
                LOBYTE(v25) = v148;
                uint64_t v26 = v149;
                if (v16)
                {
                  id v67 = [NSNumber numberWithDouble:v56];
                  if ([v146 length])
                  {
                    if ([v144 length])
                    {
                      if (v67)
                      {
                        id v68 = v141;
                        if ([v141 length])
                        {
                          id v25 = v138;
                          uint64_t v69 = [v138 isBlackholed];
                          uint64_t v70 = [v25 isOscarChat];
                          uint64_t v71 = v69;
                          uint64_t v26 = v149;
                          LOBYTE(v25) = v148;
                          [(IMDSpamMessageCreator *)v158 reportUnknownToIDS:v146 messageID:v144 isBlackholed:v71 isiMessageJunk:v70 messageServerTimestamp:v67 toURI:v68];
                        }
                      }
                    }
                  }
                }
                else
                {
                  id v72 = v146;
                  if (v72) {
                    CFDictionarySetValue(v151, @"sender-uri", v72);
                  }

                  v73 = [NSNumber numberWithDouble:v56];
                  if (v73) {
                    CFDictionarySetValue(v151, @"time-of-message", v73);
                  }

                  v74 = [NSNumber numberWithBool:v39 != 0];
                  if (v74) {
                    CFDictionarySetValue(v151, @"message-has-image", v74);
                  }

                  id v75 = v147;
                  if (v75) {
                    CFDictionarySetValue(v151, @"message-text", v75);
                  }

                  v76 = [v152 messageSummaryInfo];
                  v77 = [v76 objectForKey:@"smv"];

                  if (v77) {
                    CFDictionarySetValue(v151, @"message-spam-model-version", v77);
                  }

                  id v78 = v152;
                  v79 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v152, "isSpam"));
                  if (v79) {
                    CFDictionarySetValue(v151, @"message-spam-model-detected-spam", v79);
                  }

                  id v155 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                  long long v164 = 0u;
                  long long v165 = 0u;
                  long long v166 = 0u;
                  long long v167 = 0u;
                  id v154 = [v78 fileTransferGUIDs];
                  uint64_t v159 = [v154 countByEnumeratingWithState:&v164 objects:v172 count:16];
                  if (v159)
                  {
                    uint64_t v157 = *(void *)v165;
                    do
                    {
                      for (uint64_t i = 0; i != v159; ++i)
                      {
                        if (*(void *)v165 != v157) {
                          objc_enumerationMutation(v154);
                        }
                        v81 = [(IMDSpamMessageCreator *)v158 transferForGuid:*(void *)(*((void *)&v164 + 1) + 8 * i)];
                        v82 = v81;
                        if (v81)
                        {
                          v83 = [v81 userInfo];
                          v84 = [v83 _stringForKey:@"mmcs-url"];
                          v85 = [v83 _stringForKey:@"mmcs-signature-hex"];
                          v86 = [v83 _stringForKey:@"mmcs-owner"];
                          v87 = [v83 _stringForKey:@"file-size"];
                          id v163 = v83;
                          v88 = [v83 _stringForKey:@"decryption-key"];
                          id v161 = [v82 type];
                          id v160 = [v82 filename];
                          v89 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
                          id v90 = v84;
                          if (v90) {
                            CFDictionarySetValue(v89, @"mmcs-url", v90);
                          }

                          id v91 = v85;
                          if (v91) {
                            CFDictionarySetValue(v89, @"mmcs-signature-hex", v91);
                          }

                          id v92 = v86;
                          if (v92) {
                            CFDictionarySetValue(v89, @"mmcs-owner-id", v92);
                          }

                          id v93 = v87;
                          if (v93) {
                            CFDictionarySetValue(v89, @"mmcs-file-size-string", v93);
                          }

                          id v94 = v88;
                          if (v94) {
                            CFDictionarySetValue(v89, @"mmcs-symmetric-key", v94);
                          }
                          id v162 = v90;

                          id v95 = v161;
                          if (v95) {
                            CFDictionarySetValue(v89, @"mmcs-UTI-type", v95);
                          }
                          id v161 = v91;

                          id v96 = v160;
                          if (v96) {
                            CFDictionarySetValue(v89, @"mmcs-filename", v96);
                          }

                          v97 = [v163 _stringForKey:@"inline-attachment"];
                          if ([v97 length])
                          {
                            id v156 = v93;
                            id v160 = v92;
                            id v98 = objc_alloc(MEMORY[0x1E4F1C9B8]);
                            v99 = [v82 localPath];
                            v100 = (void *)[v98 initWithContentsOfFile:v99];

                            id v101 = v100;
                            if (v101) {
                              CFDictionarySetValue(v89, @"inline-message-data", v101);
                            }

                            id v92 = v160;
                            id v93 = v156;
                          }
                          [v155 addObject:v89];
                        }
                      }
                      uint64_t v159 = [v154 countByEnumeratingWithState:&v164 objects:v172 count:16];
                    }
                    while (v159);
                  }

                  id v67 = v155;
                  if (v67) {
                    CFDictionarySetValue(v151, @"message-attachment-info", v67);
                  }

                  v102 = NSNumber;
                  v103 = [v138 participants];
                  v104 = objc_msgSend(v102, "numberWithUnsignedInteger:", objc_msgSend(v103, "count"));

                  a8 = v127;
                  id v22 = v137;
                  id v105 = v152;
                  if (v104) {
                    CFDictionarySetValue(v151, @"conversation-group-size", v104);
                  }

                  v106 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v105, "isFromMe"));
                  LOBYTE(v16) = v126;
                  if (v106) {
                    CFDictionarySetValue(v151, @"is-self", v106);
                  }

                  v107 = [v152 service];
                  if (v107) {
                    CFDictionarySetValue(v151, @"message-service", v107);
                  }

                  if (v134) {
                    CFDictionarySetValue(v151, @"notify-security", &unk_1F33C56A0);
                  }
                  if (v143)
                  {
                    v108 = v151;
                    id v25 = v141;
                    [(IMDSpamMessageCreator *)v158 addTextMessageJunkKeysToReportMessageDictionary:v151 forMessage:v152 chat:v138 receiverURI:v141];
                    id v109 = v136;
                    [v136 addObject:v108];
                    [v131 setObject:v109 forKey:v25];
                    ++v133;
                    LOBYTE(v25) = v148;
                    uint64_t v26 = v149;
                  }
                  else
                  {
                    id v112 = v138;
                    [(IMDSpamMessageCreator *)v158 addiMessageJunkKeysToReportMessageDictionary:v151 forMessage:v152 withGUID:v144 contentLength:v139 chat:v138];
                    int v113 = [v112 isBusinessChat];
                    if (v124 && v113 && v124 <= 6) {
                      CFDictionarySetValue(v151, @"report-spam-reason", off_1E6B73510[v122]);
                    }
                    id v114 = v136;
                    [v136 addObject:v151];
                    LOBYTE(v25) = v148;
                    uint64_t v26 = v149;
                    if (v140)
                    {
                      [v130 setObject:v114 forKey:v141];
                      ++v132;
                    }
                  }
                  ++v129;
                }

                if (v132 >= a8)
                {
                  id v115 = v130;
                  v116 = (void *)[v130 copy];
                  [(IMDSpamMessageCreator *)v158 _reportToIDSiMessageSpam:v116];

                  v117 = v115;
                  uint64_t v26 = v149;
                  LOBYTE(v25) = v148;
                  [v117 removeAllObjects];
                  unint64_t v132 = 0;
                }
                if (v133 >= a8)
                {
                  id v118 = v131;
                  v119 = (void *)[v131 copy];
                  [(IMDSpamMessageCreator *)v158 _reportToIDSTextMessageSpam:v119];

                  v120 = v118;
                  uint64_t v26 = v149;
                  LOBYTE(v25) = v148;
                  [v120 removeAllObjects];
                  unint64_t v133 = 0;
                }

                id v53 = v141;
              }
              else
              {
                LOBYTE(v25) = v148;
                uint64_t v26 = v149;
              }

              uint64_t v24 = v145;
            }
            else
            {
              uint64_t v24 = v145;
              uint64_t v26 = v149;
            }
          }
        }
        uint64_t v27 = v153 + 1;
      }
      while (v153 + 1 != v24);
      uint64_t v24 = [v22 countByEnumeratingWithState:&v168 objects:v173 count:16];
    }
    while (v24);
  }
  else
  {
    unint64_t v129 = 0;
  }

  unint64_t *v121 = v129;
}

- (void)addiMessageJunkKeysToReportMessageDictionary:(id)a3 forMessage:(id)a4 withGUID:(id)a5 contentLength:(unint64_t)a6 chat:(id)a7
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  v12 = (__CFDictionary *)a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  CFDictionarySetValue(v12, @"message-format-version", &unk_1F33C56B8);
  if (v14) {
    CFDictionarySetValue(v12, @"message-id", v14);
  }
  BOOL v16 = [NSNumber numberWithUnsignedInteger:a6];
  if (v16) {
    CFDictionarySetValue(v12, @"message-length", v16);
  }

  v17 = [v13 balloonBundleID];
  if (v17) {
    CFDictionarySetValue(v12, @"message-app-bundle-id", v17);
  }

  v18 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v15, "isOscarChat"));
  if (v18) {
    CFDictionarySetValue(v12, @"reported-from-junk", v18);
  }

  id v19 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v15, "isBlackholed"));
  if (v19) {
    CFDictionarySetValue(v12, @"reported-from-blackhole", v19);
  }

  id v20 = [v13 balloonBundleID];
  int v21 = [v20 containsString:*MEMORY[0x1E4F6CC30]];

  if (v21)
  {
    id v22 = [(IMDSpamMessageCreator *)self surfURLForIMMessageItem:v13];
    if (v22)
    {
      uint64_t v23 = [(IMDSpamMessageCreator *)self metaDataForSurfURL:v22];
      uint64_t v24 = [(IMDSpamMessageCreator *)self isSurfPayment:v22];
    }
    else
    {
      uint64_t v23 = 0;
      uint64_t v24 = 0;
    }
  }
  else
  {
    uint64_t v23 = 0;
    uint64_t v24 = 0;
  }
  id v25 = [v13 payloadData];
  if (v25) {
    CFDictionarySetValue(v12, @"message-extension-data", v25);
  }

  uint64_t v26 = [v13 payloadData];

  if (v26)
  {
    uint64_t v27 = [v13 balloonBundleID];
    if (v27) {
      CFDictionarySetValue(v12, @"message-extension-bundle-id", v27);
    }
  }
  uint64_t v28 = [v13 historyForMessagePart:0];
  if ([v28 count])
  {
    unsigned int v41 = v24;
    v42 = v23;
    id v43 = v15;
    v44 = self;
    id v45 = v14;
    id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v30 = v28;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v46 objects:v50 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v47;
LABEL_26:
      uint64_t v34 = 0;
      while (1)
      {
        if (*(void *)v47 != v33) {
          objc_enumerationMutation(v30);
        }
        uint64_t v35 = *(void **)(*((void *)&v46 + 1) + 8 * v34);
        int v36 = [v30 lastObject];

        if (v35 == v36) {
          break;
        }
        id v37 = [v35 messagePartText];
        [v29 addObject:v37];

        if (v32 == ++v34)
        {
          uint64_t v32 = [v30 countByEnumeratingWithState:&v46 objects:v50 count:16];
          if (v32) {
            goto LABEL_26;
          }
          break;
        }
      }
    }

    if (v29) {
      CFDictionarySetValue(v12, @"message-edits", v29);
    }

    self = v44;
    id v14 = v45;
    uint64_t v23 = v42;
    id v15 = v43;
    uint64_t v24 = v41;
  }
  if (v23) {
    CFDictionarySetValue(v12, @"payment-info", v23);
  }
  v38 = [NSNumber numberWithBool:v24];
  if (v38) {
    CFDictionarySetValue(v12, @"is-payment", v38);
  }

  uint64_t v39 = objc_msgSend(NSNumber, "numberWithBool:", -[IMDSpamMessageCreator hasDataDetectedInformalPayment:](self, "hasDataDetectedInformalPayment:", v13));
  if (v39) {
    CFDictionarySetValue(v12, @"is-informal", v39);
  }

  if ([v15 isBusinessChat]) {
    CFDictionarySetValue(v12, @"spam-message-type", @"BusinessInitiatedAlertSpam");
  }
  v40 = [v13 sender];
  [(IMDSpamMessageCreator *)self _addSnapNameKeysToReportMessageDictionary:v12 forSender:v40];
}

- (void)addTextMessageJunkKeysToReportMessageDictionary:(id)a3 forMessage:(id)a4 chat:(id)a5 receiverURI:(id)a6
{
  theDict = (__CFDictionary *)a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void *)MEMORY[0x1E4F6E660];
  id v14 = [v10 destinationCallerID];
  id v15 = [v13 carrierNameForPhoneNumber:v14];

  BOOL v16 = [v10 destinationCallerID];
  v17 = IMCountryCodeForNumber();

  v18 = [v10 subject];
  if ([v18 length])
  {
    BOOL v19 = 1;
  }
  else
  {
    id v20 = [v10 fileTransferGUIDs];
    if ([v20 count]) {
      BOOL v19 = 1;
    }
    else {
      BOOL v19 = [v11 style] != 45;
    }
  }
  CFDictionarySetValue(theDict, @"message-format-version", &unk_1F33C56A0);
  if (v15) {
    CFDictionarySetValue(theDict, @"carrier-name", v15);
  }
  if (v17) {
    CFDictionarySetValue(theDict, @"country-code", v17);
  }
  int v21 = [NSNumber numberWithBool:v19];
  if (v21) {
    CFDictionarySetValue(theDict, @"is-message-mms", v21);
  }

  id v22 = theDict;
  if (v12)
  {
    CFDictionarySetValue(theDict, @"recipient-uri", v12);
    id v22 = theDict;
  }
  CFDictionarySetValue(v22, @"spam-message-type", @"TextMessageSpam");
  uint64_t v23 = [v10 sender];
  [(IMDSpamMessageCreator *)self _addSnapNameKeysToReportMessageDictionary:theDict forSender:v23];
}

- (void)_addSnapNameKeysToReportMessageDictionary:(id)a3 forSender:(id)a4
{
  theDict = (__CFDictionary *)a3;
  id v5 = a4;
  v6 = +[IMDNicknameController sharedInstance];
  v7 = [v6 pendingNicknameUpdates];
  v8 = [v7 valueForKey:v5];
  v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v11 = +[IMDNicknameController sharedInstance];
    id v12 = [v11 handledNicknames];
    id v10 = [v12 valueForKey:v5];
  }
  if (v10)
  {
    id v13 = (void *)[objc_alloc(MEMORY[0x1E4F6E8B8]) initWithDictionaryRepresentation:v10];
    id v14 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v15 = [v13 firstName];
    if (v15) {
      CFDictionarySetValue(v14, @"first-name", v15);
    }

    BOOL v16 = [v13 lastName];
    if (v16) {
      CFDictionarySetValue(v14, @"last-name", v16);
    }

    v17 = [v13 recordID];
    if (v17) {
      CFDictionarySetValue(v14, @"recordID", v17);
    }
  }
  else
  {
    id v14 = 0;
  }
  v18 = +[IMDNicknameController sharedInstance];
  BOOL v19 = [v18 unknownSenderRecordInfoFor:v5];

  if (v19)
  {
    if (!v14) {
      id v14 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    CFDictionarySetValue(v14, @"sender-records-and-keys", v19);
  }
  if (v14) {
    CFDictionarySetValue(theDict, @"sender-shared-name-and-photo", v14);
  }
}

- (void)reportUnknownToIDS:(id)a3 messageID:(id)a4 isBlackholed:(BOOL)a5 isiMessageJunk:(BOOL)a6 messageServerTimestamp:(id)a7 toURI:(id)a8
{
}

- (BOOL)isSurfPayment:(id)a3
{
  id v3 = a3;
  if (qword_1EA8CA418 != -1) {
    dispatch_once(&qword_1EA8CA418, &unk_1F3390740);
  }
  if (off_1EA8CA410) {
    BOOL v4 = off_1EA8CA410(v3) == 1;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)metaDataForSurfURL:(id)a3
{
  id v3 = a3;
  if (qword_1EA8CA428 != -1) {
    dispatch_once(&qword_1EA8CA428, &unk_1F3390760);
  }
  if (off_1EA8CA420)
  {
    BOOL v4 = off_1EA8CA420(v3, 1);
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)hasDataDetectedInformalPayment:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F6E850];
  BOOL v4 = [a3 body];
  LOBYTE(v3) = [v3 messageContainsSurfDD:v4];

  return (char)v3;
}

- (id)surfURLForIMMessageItem:(id)a3
{
  id v3 = a3;
  BOOL v4 = IMExtensionPayloadUnarchivingClasses();
  id v5 = objc_alloc(MEMORY[0x1E4F28DC0]);
  v6 = [v3 payloadData];
  id v14 = 0;
  v7 = (void *)[v5 initForReadingFromData:v6 error:&v14];
  id v8 = v14;

  if (objc_opt_respondsToSelector()) {
    [v7 _enableStrictSecureDecodingMode];
  }
  v9 = [v7 decodeObjectOfClasses:v4 forKey:*MEMORY[0x1E4F284E8]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = [v9 objectForKey:*MEMORY[0x1E4F6D330]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }
    id v12 = v11;
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (void)_reportToIDSiMessageSpam:(id)a3
{
  if (a3) {
    [a3 enumerateKeysAndObjectsUsingBlock:&unk_1F3390780];
  }
}

- (void)_reportToIDSTextMessageSpam:(id)a3
{
  if (a3)
  {
    id v3 = (objc_class *)MEMORY[0x1E4F6AB90];
    id v4 = a3;
    id v5 = [v3 alloc];
    v6 = (void *)[v5 initWithService:*MEMORY[0x1E4F6AA78]];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1D96B7F00;
    v8[3] = &unk_1E6B73358;
    id v9 = v6;
    id v7 = v6;
    [v4 enumerateKeysAndObjectsUsingBlock:v8];
  }
}

- (BOOL)_textMessageReportToIDSAllowedForMessageItem:(id)a3 chat:(id)a4 notifyInternalSecurity:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  if (a5)
  {
    char v10 = 1;
  }
  else
  {
    id v11 = [v8 destinationCallerID];
    if (IMStringIsEmail())
    {
      char v10 = 0;
      id v12 = 0;
      id v13 = 0;
    }
    else
    {
      int v14 = MEMORY[0x1E0169B60](v11);
      id v15 = v11;
      id v16 = v15;
      BOOL v17 = v14 == 0;
      if (v14) {
        id v12 = 0;
      }
      else {
        id v12 = v15;
      }
      if (v17) {
        id v13 = 0;
      }
      else {
        id v13 = v15;
      }
      BOOL v18 = [(IMDSpamMessageCreator *)self _isMessageMMS:v8 forChat:v9];
      if (v18) {
        BOOL v19 = @"%@-MMS";
      }
      else {
        BOOL v19 = @"%@-SMS";
      }
      id v20 = objc_msgSend(NSString, "stringWithFormat:", v19, v16);
      int v21 = [(id)qword_1EBE2C340 objectForKeyedSubscript:v20];

      if (v21)
      {
        id v22 = [(id)qword_1EBE2C340 objectForKeyedSubscript:v20];
        char v10 = [v22 BOOLValue];
      }
      else
      {
        if (v18) {
          uint64_t v23 = &unk_1F33C5F40;
        }
        else {
          uint64_t v23 = &unk_1F33C5F58;
        }
        id v22 = [MEMORY[0x1E4F6E660] carrierBundleValueForKeyHierarchy:v23 phoneNumber:v13 simID:v12];
        if (v22 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          [(id)qword_1EBE2C340 setObject:v22 forKeyedSubscript:v20];
          char v10 = [v22 BOOLValue];
          if (_IMWillLog()) {
            _IMAlwaysLog();
          }
        }
        else
        {
          if (_IMWillLog()) {
            _IMAlwaysLog();
          }
          char v10 = 0;
        }
      }
    }
  }

  return v10;
}

- (BOOL)_isMessageMMS:(id)a3 forChat:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 fileTransferGUIDs];
  if ([v7 count])
  {
    BOOL v8 = 1;
  }
  else
  {
    id v9 = [v5 subject];
    if ([v9 length]) {
      BOOL v8 = 1;
    }
    else {
      BOOL v8 = [v6 style] != 45;
    }
  }
  return v8;
}

@end