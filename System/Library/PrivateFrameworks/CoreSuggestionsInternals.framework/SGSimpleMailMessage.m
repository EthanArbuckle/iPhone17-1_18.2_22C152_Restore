@interface SGSimpleMailMessage
+ (BOOL)enumerateRfc822InNeXTMbox:(id)a3 tableOfContents:(id)a4 withBlock:(id)a5;
+ (BOOL)headerDictionaryContainsInhumanHeaders:(id)a3;
+ (BOOL)headersContainInhumanOnes:(id)a3 keys:(id)a4;
+ (BOOL)supportsSecureCoding;
+ (_NSRange)rangeOfBodyFromRfc822:(id)a3;
+ (_NSRange)rangeOfHeadersFromRfc822:(id)a3;
+ (id)addressItemsFromEmailString:(id)a3;
+ (id)dateFromEmailString:(id)a3;
+ (id)decodeEncodedWordsIn:(id)a3;
+ (id)decodeQuotedPrintable:(id)a3 charset:(unint64_t)a4 rfc2047UnderscoreAsSpace:(BOOL)a5;
+ (id)formatFlowed:(id)a3 delSp:(BOOL)a4;
+ (id)htmlBodyFromRfc822:(id)a3 headers:(id)a4 attachmentCallback:(id)a5;
+ (id)htmlFromPlainTextBody:(id)a3;
+ (id)parseHeaders:(id)a3;
+ (id)parseParameterizedHeaderValue:(id)a3;
+ (id)parseRfc822:(id)a3;
+ (id)parseRfc822:(id)a3 attachmentCallback:(id)a4;
+ (id)parseRfc822Headers:(id)a3 htmlContent:(id)a4;
+ (id)parseRfc822Headers:(id)a3 htmlContent:(id)a4 source:(id)a5;
+ (id)simpleMailMessageFromHeaders:(id)a3;
+ (id)stripTrailingASCIIHSpace:(id)a3;
+ (id)subjectByCleaningPrefixesInSubject:(id)a3;
+ (id)uudecode:(id)a3;
- (BOOL)hasHumanHeaders;
- (BOOL)hasInhumanHeaders;
- (BOOL)hasRecipientFromSameDomainAsSender;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSimpleMailMessage:(id)a3;
- (BOOL)isInhumanContentNoncached;
- (BOOL)isPartiallyDownloaded;
- (HVHtmlParser)htmlParser;
- (NSArray)bcc;
- (NSArray)cc;
- (NSArray)headers;
- (NSArray)mailboxIdentifiers;
- (NSArray)to;
- (NSData)htmlContentData;
- (NSIndexSet)quotedRegions;
- (NSString)appleMailMessageId;
- (NSString)htmlBody;
- (NSString)inReplyTo;
- (NSString)messageId;
- (NSString)messageIdWithoutBrackets;
- (SGSimpleMailMessage)initWithCoder:(id)a3;
- (SGSimpleMailMessage)initWithMailContentEvent:(id)a3 contentProtection:(id)a4 htmlParser:(id)a5;
- (SGSimpleMailMessage)initWithMessageDictionary:(id)a3;
- (SGSimpleMailMessage)initWithSearchableItem:(id)a3;
- (SGSimpleNamedEmailAddress)forwardedBy;
- (SGSimpleNamedEmailAddress)from;
- (SGSimpleNamedEmailAddress)mailingList;
- (SGSimpleNamedEmailAddress)replyTo;
- (id)allRecipients;
- (id)asDictionary;
- (id)author;
- (id)convertMailMessageToBMMailMessage:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createNewSearchableItem;
- (id)createNewSearchableItemWithSource:(id)a3 uniqueIdentifier:(id)a4 domainIdentifier:(id)a5;
- (id)dataDetectorMatchesWithSignature;
- (id)description;
- (id)headersDictionary;
- (id)initForBuilding;
- (id)removeBrackets:(id)a3;
- (id)senderDomain;
- (id)spotlightBundleIdentifier;
- (id)spotlightUniqueIdentifier;
- (id)textContent;
- (id)uniqueIdentifier;
- (int64_t)contentLength;
- (unint64_t)hash;
- (void)_clearExistingHtml;
- (void)encodeWithCoder:(id)a3;
- (void)setBcc:(id)a3;
- (void)setCc:(id)a3;
- (void)setFrom:(id)a3;
- (void)setHasInhumanHeaders:(BOOL)a3;
- (void)setHeaders:(id)a3;
- (void)setHtmlBody:(id)a3;
- (void)setHtmlContentData:(id)a3;
- (void)setIsPartiallyDownloaded:(BOOL)a3;
- (void)setMailboxIdentifiers:(id)a3;
- (void)setMailingList:(id)a3;
- (void)setMessageId:(id)a3;
- (void)setReplyTo:(id)a3;
- (void)setTo:(id)a3;
@end

@implementation SGSimpleMailMessage

+ (BOOL)enumerateRfc822InNeXTMbox:(id)a3 tableOfContents:(id)a4 withBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = [v9 length];
  id v36 = v8;
  unint64_t v35 = [v8 length];
  if (v11 >= 0x20)
  {
    signed int v41 = 0;
    objc_msgSend(v9, "getBytes:range:", &v41, 4, 4);
    signed int v13 = v41;
    signed int v41 = bswap32(v41);
    if (v13)
    {
      char v14 = 1;
      v34 = [MEMORY[0x1E4F1C9B8] dataWithBytes:"\n" length:1];
      if (v41 >= 1)
      {
        signed int v15 = 0;
        id v33 = v10;
        uint64_t v16 = 32;
        id v31 = v9;
        unint64_t v32 = v11;
        while (1)
        {
          v17 = (void *)MEMORY[0x1CB79B230]();
          if (v16 + 4 > v11) {
            break;
          }
          signed int v40 = 0;
          objc_msgSend(v9, "getBytes:range:", &v40, v16, 4);
          signed int v40 = bswap32(v40);
          unint64_t v18 = v16 + 4 + v40;
          if (v18 > v11) {
            break;
          }
          signed int v39 = 0;
          objc_msgSend(v9, "getBytes:range:", &v39, v16 + 4, 4);
          unsigned int v38 = 0;
          signed int v39 = bswap32(v39);
          objc_msgSend(v9, "getBytes:range:", &v38, v16 + 8, 4);
          uint64_t v19 = v39;
          signed int v20 = bswap32(v38);
          unsigned int v38 = v20;
          unint64_t v21 = v39 + (uint64_t)v20;
          BOOL v5 = v21 <= v35;
          if (v21 > v35) {
            goto LABEL_19;
          }
          unint64_t v22 = v20;
          uint64_t v23 = objc_msgSend(v36, "rangeOfData:options:range:", v34, 0, v39, v20);
          if (v23 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v25 = v23;
            uint64_t v26 = v24;
            v27 = objc_msgSend([NSString alloc], "initWithBytes:length:encoding:", objc_msgSend(v36, "bytes") + v19, v23 - v19, 1);
            if ([v27 rangeOfString:@"From " options:11] != 0x7FFFFFFFFFFFFFFFLL)
            {
              uint64_t v19 = v25 + v26;
              unint64_t v22 = v21 - (v25 + v26);
            }

            id v9 = v31;
          }
          v28 = objc_msgSend(v36, "subdataWithRange:", v19, v22, v31);
          unsigned __int8 v37 = 0;
          id v10 = v33;
          (*((void (**)(id, void *, unsigned __int8 *))v33 + 2))(v33, v28, &v37);
          int v29 = v37;

          if (v29) {
            goto LABEL_19;
          }
          ++v15;
          uint64_t v16 = v18;
          unint64_t v11 = v32;
          if (v15 >= v41)
          {
            char v14 = 1;
            goto LABEL_20;
          }
        }
        BOOL v5 = 0;
LABEL_19:
        char v14 = 0;
      }
LABEL_20:
      char v12 = v14 | v5;
    }
    else
    {
      char v12 = 1;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12 & 1;
}

+ (id)parseRfc822:(id)a3 attachmentCallback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 parseHeaders:v6];
  id v9 = [a1 htmlBodyFromRfc822:v6 headers:v8 attachmentCallback:v7];
  uint64_t v10 = [v9 rangeOfString:@"\r" options:2];
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v12 = v10;
    NSUInteger v13 = v11;
    char v14 = (void *)MEMORY[0x1CB79B230]();
    v21.location = [v9 length];
    v20.location = v12;
    v20.length = v13;
    v21.length = 0;
    NSRange v15 = NSUnionRange(v20, v21);
    uint64_t v16 = objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:options:range:", @"\r", &stru_1F24EEF20, 2, v15.location, v15.length);

    id v9 = (void *)v16;
  }
  v17 = +[SGSimpleMailMessage simpleMailMessageFromHeaders:v8];
  [v17 setHtmlBody:v9];

  return v17;
}

+ (id)parseRfc822:(id)a3
{
  return (id)[a1 parseRfc822:a3 attachmentCallback:0];
}

+ (id)htmlBodyFromRfc822:(id)a3 headers:(id)a4 attachmentCallback:(id)a5
{
  v137[1] = *MEMORY[0x1E4F143B8];
  id v110 = a3;
  id v8 = a4;
  v119 = (void (**)(id, void *, void *, void *))a5;
  v113 = v8;
  uint64_t v9 = objc_msgSend(v8, "hv_firstHeaderForKey:", @"content-type");
  uint64_t v10 = (void *)v9;
  NSUInteger v11 = @"text/plain";
  if (v9) {
    NSUInteger v11 = (__CFString *)v9;
  }
  NSUInteger v12 = v11;

  v104 = v12;
  v121 = [a1 parseParameterizedHeaderValue:v12];
  NSUInteger v13 = (void *)MEMORY[0x1CB79B230]();
  char v14 = [v121 first];
  v114 = [v14 lowercaseString];

  v123 = [v121 second];
  NSRange v15 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v16 = [v123 objectForKeyedSubscript:@"charset"];
  v17 = v16;
  if (!v16) {
    uint64_t v16 = @"us-ascii";
  }
  theString = [(__CFString *)v16 lowercaseString];

  unint64_t v18 = [v123 objectForKeyedSubscript:@"boundary"];
  if (!v18) {
    goto LABEL_8;
  }
  uint64_t v19 = (void *)MEMORY[0x1CB79B230]();
  NSRange v20 = [v123 objectForKeyedSubscript:@"boundary"];
  v111 = [@"\n--" stringByAppendingString:v20];

  if (v111)
  {
    NSRange v21 = (void *)MEMORY[0x1CB79B230]();
    v107 = [v111 stringByAppendingString:@"--"];
    int v22 = 1;
  }
  else
  {
LABEL_8:
    v107 = 0;
    v111 = 0;
    int v22 = 0;
  }
  uint64_t v23 = objc_msgSend(v113, "hv_firstHeaderForKey:", @"content-disposition");
  uint64_t v24 = (void *)v23;
  uint64_t v25 = @"inline";
  if (v23) {
    uint64_t v25 = (__CFString *)v23;
  }
  uint64_t v26 = v25;

  v103 = v26;
  v120 = [a1 parseParameterizedHeaderValue:v26];
  v27 = (void *)MEMORY[0x1CB79B230]();
  v28 = [v120 first];
  v122 = [v28 lowercaseString];

  v106 = [v120 second];
  if (([v122 isEqual:@"attachment"] & 1) == 0
    && (v22 & [v114 hasPrefix:@"multipart/"]) == 1)
  {
    int v100 = [v114 isEqual:@"multipart/alternative"];
    if (v100)
    {
      int v29 = 0;
    }
    else
    {
      if ([v114 isEqual:@"multipart/related"])
      {
        v116 = [v123 objectForKeyedSubscript:@"start"];
        int v29 = v116 == 0;
LABEL_54:
        uint64_t v60 = [a1 rangeOfBodyFromRfc822:v110];
        if (v60) {
          NSUInteger v62 = v61 + 1;
        }
        else {
          NSUInteger v62 = v61;
        }
        if (v60) {
          NSUInteger v63 = v60 - 1;
        }
        else {
          NSUInteger v63 = 0;
        }
        v64 = (void *)MEMORY[0x1CB79B230]();
        v118 = [v111 dataUsingEncoding:1];
        v65 = (void *)MEMORY[0x1CB79B230]();
        v105 = [v107 dataUsingEncoding:1];
        v102 = objc_opt_new();
        id v128 = v110;
        uint64_t v66 = [v128 bytes];
        uint64_t v112 = 0;
        if (v29) {
          int v67 = 5;
        }
        else {
          int v67 = 0;
        }
        int v101 = v67;
        uint64_t v126 = 0x7FFFFFFFFFFFFFFFLL;
        while (1)
        {
          uint64_t v68 = objc_msgSend(v128, "rangeOfData:options:range:", v118, 0, v63, v62);
          if (v68 == 0x7FFFFFFFFFFFFFFFLL)
          {
            if (!v62) {
              goto LABEL_113;
            }
            NSUInteger location = v63 + v62 - 1;
            if (*(unsigned char *)(v66 + v63) == 10 || *(unsigned char *)(v66 + location) != 10) {
              goto LABEL_113;
            }
            BOOL v72 = 1;
            uint64_t v73 = 1;
            goto LABEL_94;
          }
          NSUInteger v74 = v68;
          NSUInteger v75 = v69;
          v140.NSUInteger length = v69 + 2;
          v139.NSUInteger location = v63;
          v139.NSUInteger length = v62;
          v140.NSUInteger location = v74;
          NSRange v76 = NSIntersectionRange(v139, v140);
          uint64_t v77 = objc_msgSend(v128, "rangeOfData:options:range:", v105, 2, v76.location, v76.length);
          BOOL v72 = v77 != 0x7FFFFFFFFFFFFFFFLL;
          if (v77 == 0x7FFFFFFFFFFFFFFFLL) {
            NSUInteger location = v74;
          }
          else {
            NSUInteger location = v76.location;
          }
          if (v77 == 0x7FFFFFFFFFFFFFFFLL) {
            NSUInteger length = v75;
          }
          else {
            NSUInteger length = v76.length;
          }
          NSUInteger v79 = v63 + v62;
          NSUInteger v80 = length + location;
          if (length + location >= v63 + v62)
          {
            uint64_t v73 = length;
LABEL_91:
            if (location && *(unsigned char *)(v66 + location - 1) == 13)
            {
              --location;
              ++v73;
            }
LABEL_94:
            if (v126 != 0x7FFFFFFFFFFFFFFFLL)
            {
              BOOL v109 = v72;
              v86 = (void *)MEMORY[0x1CB79B230]();
              v87 = objc_msgSend(v128, "subdataWithRange:", v126 + v112, location - (v126 + v112));
              v88 = [a1 parseHeaders:v87];
              v89 = v88;
              if (v116)
              {
                v90 = objc_msgSend(v88, "hv_firstHeaderForKey:", @"content-id");
                int v91 = [v116 isEqual:v90];

                if (!v91) {
                  goto LABEL_103;
                }
              }
              v92 = (void *)MEMORY[0x1CB79B230]();
              v93 = [a1 htmlBodyFromRfc822:v87 headers:v89 attachmentCallback:v119];
              if (v93)
              {
                if (v100) {
                  [v102 removeAllObjects];
                }
                [v102 addObject:v93];
              }

              if (v116) {
                int v85 = 5;
              }
              else {
LABEL_103:
              }
                int v85 = v101;

              BOOL v72 = v109;
              if (v85)
              {
                NSUInteger length = v73;
                goto LABEL_112;
              }
            }
            if (!v72)
            {
              int v85 = 0;
              uint64_t v112 = v73;
              NSUInteger length = v73;
              uint64_t v126 = location;
              goto LABEL_112;
            }
            goto LABEL_113;
          }
          char v81 = 0;
          uint64_t v73 = v79 - location;
          NSUInteger v82 = length;
          while (2)
          {
            char v83 = v81;
            while (1)
            {
              int v84 = *(unsigned __int8 *)(v66 + v80);
              ++v82;
              if (v84 == 10 || (v83 & 1) != 0)
              {
                uint64_t v73 = v82;
                if (v84 == 10) {
                  goto LABEL_91;
                }
LABEL_111:
                int v85 = 4;
                goto LABEL_112;
              }
              if (v84 != 9 && v84 != 32) {
                break;
              }
              char v83 = 0;
              NSUInteger v80 = v82 + location;
              if (v82 + location >= v79)
              {
                if ((v81 & 1) == 0) {
                  goto LABEL_91;
                }
                goto LABEL_111;
              }
            }
            if (v84 != 13) {
              goto LABEL_111;
            }
            NSUInteger v80 = v82 + location;
            int v85 = 4;
            char v81 = 1;
            if (v82 + location < v79) {
              continue;
            }
            break;
          }
LABEL_112:
          NSUInteger v94 = v63 + v62;
          NSUInteger v63 = length + location;
          NSUInteger v62 = v94 - (length + location);
          if (v85 == 5)
          {
LABEL_113:
            if ([v102 count])
            {
              unint64_t v32 = objc_msgSend(v102, "_pas_proxyComponentsJoinedByString:", &stru_1F24EEF20);
            }
            else
            {
              unint64_t v32 = 0;
            }

            goto LABEL_126;
          }
        }
      }
      int v29 = [v114 isEqual:@"multipart/signed"];
    }
    v116 = 0;
    goto LABEL_54;
  }
  if (([v114 isEqual:@"text/html"] & 1) == 0
    && ([v114 isEqual:@"text/plain"] & 1) == 0
    && ![v122 isEqual:@"attachment"])
  {
    unint64_t v32 = 0;
    goto LABEL_126;
  }
  v30 = (void *)MEMORY[0x1CB79B230]();
  char v31 = [v122 isEqual:@"attachment"];
  if (v119 || (v31 & 1) == 0)
  {
    v125 = v30;
    uint64_t v33 = [a1 rangeOfBodyFromRfc822:v110];
    uint64_t v35 = v34;
    id v36 = (void *)MEMORY[0x1CB79B230]();
    v127 = objc_msgSend(v110, "subdataWithRange:", v33, v35);
    CFStringEncoding v37 = CFStringConvertIANACharSetNameToEncoding(theString);
    if (v37 == -1) {
      CFStringEncoding v37 = 1536;
    }
    unint64_t v38 = CFStringConvertEncodingToNSStringEncoding(v37);
    if ([v114 isEqual:@"text/plain"]
      && ([v123 objectForKeyedSubscript:@"format"],
          (signed int v39 = objc_claimAutoreleasedReturnValue()) != 0)
      && ([v123 objectForKeyedSubscript:@"format"],
          signed int v40 = objc_claimAutoreleasedReturnValue(),
          uint64_t v41 = [v40 caseInsensitiveCompare:@"flowed"],
          v40,
          v39,
          !v41))
    {
      v96 = [v123 objectForKeyedSubscript:@"delsp"];
      if (v96)
      {
        v97 = [v123 objectForKeyedSubscript:@"delsp"];
        BOOL v115 = [v97 caseInsensitiveCompare:@"yes"] == 0;
      }
      else
      {
        BOOL v115 = 0;
      }

      int v117 = 1;
    }
    else
    {
      int v117 = 0;
      BOOL v115 = 0;
    }
    v42 = (void *)MEMORY[0x1CB79B230]();
    v43 = objc_msgSend(v113, "hv_firstHeaderForKey:", @"content-transfer-encoding");
    v44 = [v43 lowercaseString];

    if ([v44 isEqual:@"binary"])
    {
LABEL_28:
      id v45 = v127;
      goto LABEL_36;
    }
    if ([v44 isEqual:@"base64"])
    {
      id v45 = (id)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedData:v127 options:1];
    }
    else if ([v44 isEqual:@"x-uuencode"])
    {
      id v45 = [a1 uudecode:v127];
    }
    else
    {
      if ([v44 isEqual:@"quoted-printable"])
      {
        v95 = objc_msgSend(NSString, "_pas_stringWithDataNoCopy:encoding:nullTerminated:", v127, 1, 0);
        v46 = [a1 decodeQuotedPrintable:v95 charset:v38 rfc2047UnderscoreAsSpace:0];

        if (!v46) {
          goto LABEL_41;
        }
LABEL_37:
        int v47 = [v122 isEqual:@"attachment"];
        v48 = (void *)MEMORY[0x1CB79B230]();
        if (!v47)
        {
          char v130 = 0;
          v50 = (void *)MEMORY[0x1CB79B230]();
          v51 = NSString;
          uint64_t v136 = *MEMORY[0x1E4F288F8];
          v52 = [NSNumber numberWithUnsignedInteger:v38];
          v135 = v52;
          v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v135 count:1];
          v137[0] = v53;
          v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v137 forKeys:&v136 count:1];
          id v129 = 0;
          uint64_t v55 = [v51 stringEncodingForData:v46 encodingOptions:v54 convertedString:&v129 usedLossyConversion:&v130];
          id v56 = v129;

          if (v55)
          {
            if (v130)
            {
              v57 = sgLogHandle();
              if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134218240;
                uint64_t v132 = v55;
                __int16 v133 = 2048;
                unint64_t v134 = v38;
                _os_log_impl(&dword_1CA650000, v57, OS_LOG_TYPE_DEFAULT, "Lossy conversion. Detected charset: %ld (expected: %ld)", buf, 0x16u);
              }
            }
            if ([v114 isEqual:@"text/plain"])
            {
              if (v117)
              {
                uint64_t v58 = [a1 formatFlowed:v56 delSp:v115];

                id v56 = (id)v58;
              }
              uint64_t v59 = [a1 htmlFromPlainTextBody:v56];

              id v56 = (id)v59;
            }
            id v56 = v56;
            unint64_t v32 = v56;
          }
          else
          {
            unint64_t v32 = 0;
          }

          goto LABEL_124;
        }
        if (!v119)
        {
          v99 = [MEMORY[0x1E4F28B00] currentHandler];
          [v99 handleFailureInMethod:a2, a1, @"SGSimpleMailMessage+RFC822Parsing.m", 739, @"Invalid parameter not satisfying: %@", @"attachmentCallback" object file lineNumber description];
        }
        v49 = [v106 objectForKeyedSubscript:@"filename"];
        v119[2](v119, v46, v49, v114);

LABEL_41:
        unint64_t v32 = 0;
LABEL_124:

        v30 = v125;
        goto LABEL_125;
      }
      if (v117) {
        goto LABEL_28;
      }
      id v45 = [a1 stripTrailingASCIIHSpace:v127];
    }
LABEL_36:
    v46 = v45;
    if (!v45) {
      goto LABEL_41;
    }
    goto LABEL_37;
  }
  unint64_t v32 = 0;
LABEL_125:
LABEL_126:

  return v32;
}

+ (id)htmlFromPlainTextBody:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 length];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:v4];
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2020000000;
    uint64_t v19 = 0;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __60__SGSimpleMailMessage_RFC822Parsing__htmlFromPlainTextBody___block_invoke;
    v12[3] = &unk_1E65B7058;
    char v14 = &v16;
    id v7 = v6;
    id v13 = v7;
    uint64_t v15 = v5;
    objc_msgSend(v3, "enumerateSubstringsInRange:options:usingBlock:", 0, v5, 0, v12);
    if (v17[3])
    {
      unint64_t v8 = 0;
      do
      {
        [v7 appendString:@"</blockquote>"];
        ++v8;
      }
      while (v8 < v17[3]);
    }
    if ([v7 isEqual:v3]) {
      uint64_t v9 = v3;
    }
    else {
      uint64_t v9 = v7;
    }
    uint64_t v10 = (__CFString *)[v9 copy];

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    uint64_t v10 = &stru_1F24EEF20;
  }

  return v10;
}

void __60__SGSimpleMailMessage_RFC822Parsing__htmlFromPlainTextBody___block_invoke(uint64_t a1, void *a2, uint64_t a3, unint64_t a4)
{
  id v7 = a2;
  id v17 = v7;
  if (!a4)
  {
LABEL_10:
    unint64_t v8 = 0;
    uint64_t v10 = a1 + 40;
LABEL_11:
    uint64_t v11 = *(void *)(*(void *)v10 + 8);
    unint64_t v12 = *(void *)(v11 + 24);
    goto LABEL_12;
  }
  unint64_t v8 = 0;
  while (1)
  {
    int v9 = [v7 characterAtIndex:v8];
    if (v9 != 62) {
      break;
    }
    ++v8;
    id v7 = v17;
    if (a4 == v8)
    {
      unint64_t v8 = a4;
      goto LABEL_7;
    }
  }
  if (v9 != 32) {
    goto LABEL_10;
  }
LABEL_7:
  uint64_t v10 = a1 + 40;
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  unint64_t v12 = *(void *)(v11 + 24);
  if (v12 < v8)
  {
    do
    {
      [*(id *)(a1 + 32) appendString:@"<blockquote type=cite>"];
      ++v12;
    }
    while (v8 != v12);
    goto LABEL_11;
  }
LABEL_12:
  if (v8 < v12)
  {
    unint64_t v13 = v8;
    do
    {
      [*(id *)(a1 + 32) appendString:@"</blockquote>"];
      ++v13;
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    }
    while (v13 < *(void *)(v11 + 24));
  }
  *(void *)(v11 + 24) = v8;
  if (v8 < a4)
  {
    if (v8)
    {
      uint64_t v14 = [v17 substringFromIndex:v8 + 1];

      uint64_t v15 = (void *)v14;
    }
    else
    {
      uint64_t v15 = v17;
    }
    id v17 = v15;
    uint64_t v16 = (void *)[v15 mutableCopy];
    objc_msgSend(v16, "replaceOccurrencesOfString:withString:options:range:", @"&", @"&amp;",
      2,
      0,
      [v16 length]);
    objc_msgSend(v16, "replaceOccurrencesOfString:withString:options:range:", @"<", @"&lt;",
      2,
      0,
      [v16 length]);
    objc_msgSend(v16, "replaceOccurrencesOfString:withString:options:range:", @"  ", @" &nbsp;",
      2,
      0,
      [v16 length]);
    objc_msgSend(v16, "replaceOccurrencesOfString:withString:options:range:", @"\t", @"<span class=Apple-tab-span style=white-space:pre>\t</span>", 2, 0, objc_msgSend(v16, "length"));
    [*(id *)(a1 + 32) appendString:v16];
  }
  if (a3 + a4 != *(void *)(a1 + 48)) {
    [*(id *)(a1 + 32) appendString:@"<br>\n"];
  }
}

+ (id)parseParameterizedHeaderValue:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 rangeOfString:@";" options:2];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = (void *)MEMORY[0x1E4F93BB8];
    unint64_t v8 = (void *)[v5 copy];
    int v9 = [v7 tupleWithFirst:v8 second:MEMORY[0x1E4F1CC08]];
  }
  else
  {
    uint64_t v10 = v6;
    uint64_t v11 = (void *)MEMORY[0x1CB79B230]();
    unint64_t v12 = [v5 substringToIndex:v10];
    unint64_t v13 = objc_opt_new();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__SGSimpleMailMessage_RFC822Parsing__parseParameterizedHeaderValue___block_invoke;
    block[3] = &__block_descriptor_48_e5_v8__0l;
    block[4] = a2;
    block[5] = a1;
    if (parseParameterizedHeaderValue___pasOnceToken19 != -1) {
      dispatch_once(&parseParameterizedHeaderValue___pasOnceToken19, block);
    }
    id v14 = (id)parseParameterizedHeaderValue___pasExprOnceResult;
    uint64_t v15 = [v5 length] - v10;
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    NSRange v20 = __68__SGSimpleMailMessage_RFC822Parsing__parseParameterizedHeaderValue___block_invoke_2;
    NSRange v21 = &unk_1E65B7030;
    id v22 = v5;
    id v23 = v13;
    id v16 = v13;
    objc_msgSend(v14, "enumerateMatchesInString:options:range:usingBlock:", v22, 0, v10, v15, &v18);
    int v9 = objc_msgSend(MEMORY[0x1E4F93BB8], "tupleWithFirst:second:", v12, v16, v18, v19, v20, v21);
  }

  return v9;
}

void __68__SGSimpleMailMessage_RFC822Parsing__parseParameterizedHeaderValue___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1CB79B230]();
  id v7 = 0;
  objc_msgSend(MEMORY[0x1E4F28FD8], "regularExpressionWithPattern:options:error:", @"[ \\t]*;[ \\t]*([^ \\t()<>@,;:\\\\\"\\/\\[\\]?.=]+)=(?:([^ \\t()<>@,;:\\\\\"\\/\\[\\]?.=]+)|\"((?:[^\"]|\\\\\")*)\")[ \\t]*(?:(?=;)|$)",
    0,
  uint64_t v3 = &v7);
  id v4 = v7;
  if (v4)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:*(void *)(a1 + 32), *(void *)(a1 + 40), @"SGSimpleMailMessage+RFC822Parsing.m", 427, @"error creating parameterRegex: %@", v4 object file lineNumber description];
  }
  id v5 = (void *)parseParameterizedHeaderValue___pasExprOnceResult;
  parseParameterizedHeaderValue___pasExprOnceResult = v3;
}

void __68__SGSimpleMailMessage_RFC822Parsing__parseParameterizedHeaderValue___block_invoke_2(uint64_t a1, void *a2)
{
  id v16 = a2;
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = [v16 rangeAtIndex:1];
  uint64_t v6 = objc_msgSend(v3, "substringWithRange:", v4, v5);
  id v7 = [v6 lowercaseString];

  if ([v16 rangeAtIndex:2] == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ([v16 rangeAtIndex:3] == 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v8 = 0;
    }
    else
    {
      unint64_t v12 = *(void **)(a1 + 32);
      uint64_t v13 = [v16 rangeAtIndex:3];
      uint64_t v15 = objc_msgSend(v12, "substringWithRange:", v13, v14);
      unint64_t v8 = [v15 stringByReplacingOccurrencesOfString:@"\\\" withString:@"\"];
    }
  }
  else
  {
    int v9 = *(void **)(a1 + 32);
    uint64_t v10 = [v16 rangeAtIndex:2];
    unint64_t v8 = objc_msgSend(v9, "substringWithRange:", v10, v11);
  }
  [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:v7];
}

+ (id)formatFlowed:(id)a3 delSp:(BOOL)a4
{
  id v5 = a3;
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithCapacity:", objc_msgSend(v5, "length"));
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  char v21 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v19[3] = 0;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __57__SGSimpleMailMessage_RFC822Parsing__formatFlowed_delSp___block_invoke;
  uint64_t v14 = &unk_1E65B7008;
  id v16 = v20;
  id v7 = v6;
  id v15 = v7;
  id v17 = v19;
  BOOL v18 = a4;
  [v5 enumerateLinesUsingBlock:&v11];
  if (objc_msgSend(v5, "isEqual:", v7, v11, v12, v13, v14)) {
    unint64_t v8 = v5;
  }
  else {
    unint64_t v8 = v7;
  }
  id v9 = v8;

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v20, 8);

  return v9;
}

void __57__SGSimpleMailMessage_RFC822Parsing__formatFlowed_delSp___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  uint64_t v4 = self;

  if (!v4) {
    goto LABEL_28;
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  CFIndex Length = CFStringGetLength(v3);
  CFStringRef theString = v3;
  uint64_t v47 = 0;
  CFIndex v48 = Length;
  CharactersPtr = CFStringGetCharactersPtr(v3);
  CStringPtr = 0;
  id v45 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(v3, 0x600u);
  }
  v49 = 0;
  uint64_t v50 = 0;
  v46 = CStringPtr;
  if (Length < 1)
  {
    uint64_t v4 = 0;
LABEL_28:
    CFIndex Length = 0;
    BOOL v21 = 0;
    goto LABEL_29;
  }
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v4 = 0;
  uint64_t v10 = 64;
  while (1)
  {
    if ((unint64_t)v4 >= 4) {
      uint64_t v11 = 4;
    }
    else {
      uint64_t v11 = v4;
    }
    CFIndex v12 = v48;
    if (v48 <= v4)
    {
      BOOL v21 = 0;
      CFIndex Length = v4 + 1;
      goto LABEL_29;
    }
    if (v45)
    {
      UniChar v13 = v45[v4 + v47];
    }
    else if (v46)
    {
      UniChar v13 = v46[v47 + v4];
    }
    else
    {
      if (v50 <= v4 || v9 > v4)
      {
        uint64_t v15 = v11 + v8;
        uint64_t v16 = v10 - v11;
        id v17 = (char *)(v4 - v11);
        BOOL v18 = v17 + 64;
        if ((uint64_t)(v17 + 64) >= v48) {
          BOOL v18 = (char *)v48;
        }
        v49 = v17;
        uint64_t v50 = (uint64_t)v18;
        if (v48 >= v16) {
          CFIndex v12 = v16;
        }
        v51.NSUInteger length = v12 + v15;
        v51.NSUInteger location = (CFIndex)&v17[v47];
        CFStringGetCharacters(theString, v51, (UniChar *)&v36);
        uint64_t v9 = (uint64_t)v49;
      }
      UniChar v13 = *((_WORD *)&v36 + v4 - v9);
    }
    int v19 = v13;
    NSRange v20 = (char *)(v4 + 1);
    if (v19 != 62) {
      break;
    }
    --v8;
    ++v10;
    ++v4;
    if ((char *)Length == v20)
    {
      BOOL v21 = 0;
      uint64_t v4 = Length;
      goto LABEL_29;
    }
  }
  BOOL v21 = v19 == 32;
  CFIndex Length = v4 + 1;
LABEL_29:

  id v22 = (char *)(v4 + v21);
  if ([(__CFString *)v3 length] - (void)v22 == 3
    && [(__CFString *)v3 hasSuffix:@"-- "])
  {
    uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8);
    if (*(unsigned char *)(v23 + 24))
    {
      [*(id *)(a1 + 32) appendString:@"\n"];
      uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8);
    }
    *(unsigned char *)(v23 + 24) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    goto LABEL_37;
  }
  if ([(__CFString *)v3 length] <= (unint64_t)Length)
  {
LABEL_37:
    uint64_t v25 = [(__CFString *)v3 length];
    goto LABEL_38;
  }
  int v24 = [(__CFString *)v3 hasSuffix:@" "];
  uint64_t v25 = [(__CFString *)v3 length];
  if (!v24)
  {
LABEL_38:
    int v27 = 0;
    uint64_t v26 = 0;
    goto LABEL_39;
  }
  uint64_t v26 = *(unsigned __int8 *)(a1 + 56);
  int v27 = 1;
LABEL_39:
  uint64_t v28 = v25 - (void)v22 - v26;
  int v29 = (void *)MEMORY[0x1CB79B230]();
  v30 = -[__CFString substringWithRange:](v3, "substringWithRange:", v22, v28);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)
    && *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) == v4)
  {
    [*(id *)(a1 + 32) appendString:v30];
  }
  else
  {
    char v31 = (void *)MEMORY[0x1CB79B230]();
    uint64_t v32 = *(void *)(*(void *)(a1 + 40) + 8);
    if (*(unsigned char *)(v32 + 24))
    {
      *(unsigned char *)(v32 + 24) = 0;
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
      [*(id *)(a1 + 32) appendString:@"\n"];
    }
    if (v4)
    {
      uint64_t v33 = *(void **)(a1 + 32);
      uint64_t v34 = [(__CFString *)v3 substringToIndex:v4];
      [v33 appendString:v34];
    }
    [*(id *)(a1 + 32) appendString:v30];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v27;
  if (v27) {
    uint64_t v35 = (char *)v4;
  }
  else {
    uint64_t v35 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v35;
  if ((v27 & 1) == 0) {
    [*(id *)(a1 + 32) appendString:@"\n"];
  }
}

+ (id)stripTrailingASCIIHSpace:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 bytes];
  id v5 = objc_opt_new();
  uint64_t v6 = [v3 length];
  objc_msgSend(v5, "addIndexesInRange:", 0, v6);
  while (1)
  {
    do
    {
      if (stripTrailingASCIIHSpace___pasOnceToken16 != -1) {
        dispatch_once(&stripTrailingASCIIHSpace___pasOnceToken16, &__block_literal_global_188);
      }
      uint64_t v7 = objc_msgSend(v3, "rangeOfData:options:range:", stripTrailingASCIIHSpace___pasExprOnceResult, 1, 0, v6);
      uint64_t v6 = v7;
    }
    while (!v7);
    if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
    do
    {
      int v8 = *(unsigned __int8 *)(v4 - 1 + v6);
      if (v8 != 32 && v8 != 9) {
        break;
      }
      [v5 removeIndex:--v6];
    }
    while (v6);
  }
  uint64_t v10 = [v5 count];
  if (v10 == [v3 length])
  {
    uint64_t v11 = (void *)[v3 copy];
  }
  else
  {
    CFIndex v12 = malloc_type_malloc([v5 count], 0xDC62C61FuLL);
    if (!v12)
    {
      id v15 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
      objc_exception_throw(v15);
    }
    UniChar v13 = v12;
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2020000000;
    void v20[3] = 0;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __63__SGSimpleMailMessage_RFC822Parsing__stripTrailingASCIIHSpace___block_invoke_2;
    v16[3] = &unk_1E65B6FE0;
    BOOL v18 = v20;
    int v19 = v12;
    id v17 = v3;
    [v5 enumerateRangesUsingBlock:v16];
    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9B8]), "initWithBytesNoCopy:length:freeWhenDone:", v13, objc_msgSend(v5, "count"), 1);

    _Block_object_dispose(v20, 8);
  }

  return v11;
}

uint64_t __63__SGSimpleMailMessage_RFC822Parsing__stripTrailingASCIIHSpace___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "getBytes:range:", *(void *)(a1 + 48) + *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), a2, a3);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += a3;
  return result;
}

void __63__SGSimpleMailMessage_RFC822Parsing__stripTrailingASCIIHSpace___block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v1 = [@"\n" dataUsingEncoding:1];
  v2 = (void *)stripTrailingASCIIHSpace___pasExprOnceResult;
  stripTrailingASCIIHSpace___pasExprOnceResult = v1;
}

+ (id)uudecode:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  archive_read_new();
  archive_read_support_filter_uu();
  archive_read_support_format_raw();
  archive_read_append_filter();
  id v4 = v3;
  [v4 bytes];
  [v4 length];
  if (archive_read_open_memory() || archive_read_next_header())
  {
    id v5 = 0;
  }
  else
  {
    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA58]), "initWithCapacity:", (unint64_t)(3 * objc_msgSend(v4, "length")) >> 2);
    memset(v9, 0, sizeof(v9));
    while (1)
    {
      uint64_t data = archive_read_data();
      if (data < 0) {
        break;
      }
      [v7 appendBytes:v9 length:data];
      if (!data)
      {
        id v5 = v7;
        goto LABEL_12;
      }
    }
    id v5 = 0;
LABEL_12:
  }
  archive_read_free();

  return v5;
}

+ (_NSRange)rangeOfHeadersFromRfc822:(id)a3
{
  NSUInteger v3 = [a1 rangeOfBodyFromRfc822:a3];
  NSUInteger v4 = 0;
  result.NSUInteger length = v3;
  result.NSUInteger location = v4;
  return result;
}

+ (_NSRange)rangeOfBodyFromRfc822:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 length];
  id v5 = v3;
  uint64_t v6 = [v5 bytes];
  if (v4)
  {
    uint64_t v7 = 0;
    int v8 = 0;
    uint64_t v9 = 0;
    do
    {
      int v10 = *(unsigned __int8 *)(v6 + v7);
      int v11 = v8 | (v10 != 13);
      if (v11)
      {
        if (v10 == 10)
        {
          if (v9 == 1)
          {
            uint64_t v15 = v7 + 1;
            NSUInteger v12 = v4 - v15;
            uint64_t v4 = v15;
            goto LABEL_10;
          }
          uint64_t v9 = 1;
        }
        else
        {
          uint64_t v9 = 0;
        }
      }
      int v8 = v11 ^ 1;
      ++v7;
    }
    while (v4 != v7);
  }
  NSUInteger v12 = 0;
LABEL_10:

  NSUInteger v13 = v4;
  NSUInteger v14 = v12;
  result.NSUInteger length = v14;
  result.NSUInteger location = v13;
  return result;
}

+ (id)parseRfc822Headers:(id)a3 htmlContent:(id)a4 source:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = (void *)MEMORY[0x1CB79B230]();
  NSUInteger v12 = [a1 parseRfc822Headers:v8 htmlContent:v9];
  [v12 setSource:v10];

  return v12;
}

+ (id)parseRfc822Headers:(id)a3 htmlContent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1CB79B230]();
  id v9 = [a1 parseHeaders:v6];
  id v10 = +[SGSimpleMailMessage simpleMailMessageFromHeaders:v9];

  int v11 = (void *)[v7 copy];
  [v10 setHtmlBody:v11];

  return v10;
}

+ (id)parseHeaders:(id)a3
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__SGSimpleMailMessage_RFC822Parsing__parseHeaders___block_invoke;
  block[3] = &__block_descriptor_48_e5_v8__0l;
  block[4] = a2;
  block[5] = a1;
  if (parseHeaders___pasOnceToken9 != -1) {
    dispatch_once(&parseHeaders___pasOnceToken9, block);
  }
  id v6 = (id)parseHeaders___pasExprOnceResult;
  uint64_t v7 = [a1 rangeOfBodyFromRfc822:v5];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = v5;
  }
  else
  {
    objc_msgSend(v5, "subdataWithRange:", 0, v7);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v9 = v8;
  id v10 = objc_msgSend(NSString, "_pas_stringWithDataNoCopy:encoding:nullTerminated:", v8, 1, 0);
  int v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:5];
  uint64_t v12 = [v10 length];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __51__SGSimpleMailMessage_RFC822Parsing__parseHeaders___block_invoke_2;
  v18[3] = &unk_1E65B6FB8;
  id v19 = v10;
  SEL v21 = a2;
  id v22 = a1;
  id v13 = v11;
  id v20 = v13;
  id v14 = v10;
  objc_msgSend(v6, "enumerateMatchesInString:options:range:usingBlock:", v14, 0, 0, v12, v18);
  uint64_t v15 = v20;
  id v16 = v13;

  return v16;
}

void __51__SGSimpleMailMessage_RFC822Parsing__parseHeaders___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1CB79B230]();
  id v7 = 0;
  uint64_t v3 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"(?:^(\\S+?):(?:\\r?\\n[ \\t])?[ \\t]*(\\S+(?:.*\\r?\\n[ \\t].*\\S+|.*\\S)*|).*$|(?:\\r?\\n){2})" options:16 error:&v7];
  id v4 = v7;
  if (v4)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:*(void *)(a1 + 32), *(void *)(a1 + 40), @"SGSimpleMailMessage+RFC822Parsing.m", 178, @"error creating headerRegex: %@", v4 object file lineNumber description];
  }
  id v5 = (void *)parseHeaders___pasExprOnceResult;
  parseHeaders___pasExprOnceResult = v3;
}

void __51__SGSimpleMailMessage_RFC822Parsing__parseHeaders___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v24 = a2;
  uint64_t v6 = [v24 rangeAtIndex:1];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    *a4 = 1;
  }
  else
  {
    uint64_t v8 = v6;
    uint64_t v9 = v7;
    id v10 = (void *)MEMORY[0x1CB79B230]();
    int v11 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v8, v9);
    uint64_t v12 = [v24 rangeAtIndex:2];
    uint64_t v14 = v13;
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 56), @"SGSimpleMailMessage+RFC822Parsing.m", 208, @"Invalid parameter not satisfying: %@", @"fieldValueRange.location != NSNotFound" object file lineNumber description];
    }
    uint64_t v15 = (void *)MEMORY[0x1CB79B230]();
    id v16 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v12, v14);
    id v17 = (void *)[v16 mutableCopy];

    objc_msgSend(v17, "replaceOccurrencesOfString:withString:options:range:", @"\r", &stru_1F24EEF20, 2, 0, objc_msgSend(v17, "length"));
    objc_msgSend(v17, "replaceOccurrencesOfString:withString:options:range:", @"\n\t", @" ", 2, 0, objc_msgSend(v17, "length"));
    objc_msgSend(v17, "replaceOccurrencesOfString:withString:options:range:", @"\n", &stru_1F24EEF20, 2, 0, objc_msgSend(v17, "length"));
    BOOL v18 = [SGSimpleMailHeaderKeyValue alloc];
    id v19 = (void *)MEMORY[0x1CB79B230]();
    id v20 = [v11 lowercaseString];
    SEL v21 = [*(id *)(a1 + 56) decodeEncodedWordsIn:v17];
    id v22 = [(SGSimpleMailHeaderKeyValue *)v18 initWithKey:v20 value:v21];

    [*(id *)(a1 + 40) addObject:v22];
  }
}

+ (id)decodeEncodedWordsIn:(id)a3
{
  return (id)objc_msgSend(a3, "sg_stringWithDecodedEncodedWords");
}

+ (id)decodeQuotedPrintable:(id)a3 charset:(unint64_t)a4 rfc2047UnderscoreAsSpace:(BOOL)a5
{
  id v8 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__SGSimpleMailMessage_RFC822Parsing__decodeQuotedPrintable_charset_rfc2047UnderscoreAsSpace___block_invoke;
  block[3] = &__block_descriptor_48_e5_v8__0l;
  block[4] = a2;
  block[5] = a1;
  if (decodeQuotedPrintable_charset_rfc2047UnderscoreAsSpace___pasOnceToken6 != -1) {
    dispatch_once(&decodeQuotedPrintable_charset_rfc2047UnderscoreAsSpace___pasOnceToken6, block);
  }
  id v9 = (id)decodeQuotedPrintable_charset_rfc2047UnderscoreAsSpace___pasExprOnceResult;
  id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA58]), "initWithCapacity:", objc_msgSend(v8, "length"));
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v22[3] = 0;
  uint64_t v11 = [v8 length];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __93__SGSimpleMailMessage_RFC822Parsing__decodeQuotedPrintable_charset_rfc2047UnderscoreAsSpace___block_invoke_2;
  v17[3] = &unk_1E65B6F90;
  id v20 = v22;
  id v12 = v8;
  id v18 = v12;
  BOOL v21 = a5;
  id v13 = v10;
  id v19 = v13;
  objc_msgSend(v9, "enumerateMatchesInString:options:range:usingBlock:", v12, 0, 0, v11, v17);
  uint64_t v14 = v19;
  id v15 = v13;

  _Block_object_dispose(v22, 8);
  return v15;
}

void __93__SGSimpleMailMessage_RFC822Parsing__decodeQuotedPrintable_charset_rfc2047UnderscoreAsSpace___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1CB79B230]();
  id v7 = 0;
  uint64_t v3 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"(?:=([0-9A-F]{2})|=[ \\t]*(?:\\r?\\n|$)|[ \\t]+(?:\\r?\\n|$)|$)" options:0 error:&v7];
  id v4 = v7;
  if (v4)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:*(void *)(a1 + 32), *(void *)(a1 + 40), @"SGSimpleMailMessage+RFC822Parsing.m", 126, @"error creating quotedPrintableRegex: %@", v4 object file lineNumber description];
  }
  id v5 = (void *)decodeQuotedPrintable_charset_rfc2047UnderscoreAsSpace___pasExprOnceResult;
  decodeQuotedPrintable_charset_rfc2047UnderscoreAsSpace___pasExprOnceResult = v3;
}

void __93__SGSimpleMailMessage_RFC822Parsing__decodeQuotedPrintable_charset_rfc2047UnderscoreAsSpace___block_invoke_2(uint64_t a1, void *a2)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (v4 != [v3 range])
  {
    id v5 = (void *)MEMORY[0x1CB79B230]();
    uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), objc_msgSend(v3, "range") - *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
    int v7 = *(unsigned __int8 *)(a1 + 56);
    id v8 = (void *)MEMORY[0x1CB79B230]();
    if (v7)
    {
      uint64_t v9 = [v6 componentsSeparatedByString:@"_"];
    }
    else
    {
      v22[0] = v6;
      uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    }
    id v10 = (void *)v9;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __93__SGSimpleMailMessage_RFC822Parsing__decodeQuotedPrintable_charset_rfc2047UnderscoreAsSpace___block_invoke_3;
    void v20[3] = &unk_1E65B6F68;
    id v21 = *(id *)(a1 + 40);
    [v10 enumerateObjectsUsingBlock:v20];
  }
  uint64_t v11 = [v3 rangeAtIndex:1];
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v13 = v11;
    uint64_t v14 = v12;
    id v15 = (void *)MEMORY[0x1CB79B230]();
    objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v13, v14);
    id v16 = objc_claimAutoreleasedReturnValue();
    char v19 = strtol((const char *)[v16 UTF8String], 0, 16);
    [*(id *)(a1 + 40) appendBytes:&v19 length:1];
  }
  uint64_t v17 = [v3 range];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v17 + v18;
}

void __93__SGSimpleMailMessage_RFC822Parsing__decodeQuotedPrintable_charset_rfc2047UnderscoreAsSpace___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  if (a3) {
    [*(id *)(a1 + 32) appendBytes:" " length:1];
  }
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = (void *)MEMORY[0x1CB79B230]();
  int v7 = [v8 dataUsingEncoding:1 allowLossyConversion:1];
  [v5 appendData:v7];
}

+ (id)dateFromEmailString:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (dateFromEmailString___pasOnceToken4 != -1) {
    dispatch_once(&dateFromEmailString___pasOnceToken4, &__block_literal_global_37);
  }
  id v4 = (id)dateFromEmailString___pasExprOnceResult;
  if (dateFromEmailString___pasOnceToken5 != -1) {
    dispatch_once(&dateFromEmailString___pasOnceToken5, &__block_literal_global_136);
  }
  id v5 = (id)dateFromEmailString___pasExprOnceResult_134;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v4;
  int v7 = (void *)[v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  id v8 = 0;
  if (v7)
  {
    uint64_t v9 = *(void *)v20;
    while (2)
    {
      id v10 = 0;
      uint64_t v11 = v8;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * (void)v10);
        uint64_t v13 = (void *)MEMORY[0x1CB79B230]();
        id v18 = 0;
        int v14 = [v12 getObjectValue:&v18 forString:v3 range:0 error:0];
        id v8 = v18;

        if (v14)
        {
          id v15 = [v5 components:4 fromDate:v8];
          uint64_t v16 = [v15 year];

          if (v16 > 1899)
          {
            id v8 = v8;
            int v7 = v8;
            goto LABEL_16;
          }
        }
        id v10 = (char *)v10 + 1;
        uint64_t v11 = v8;
      }
      while (v7 != v10);
      int v7 = (void *)[v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_16:

  return v7;
}

void __58__SGSimpleMailMessage_RFC822Parsing__dateFromEmailString___block_invoke_3()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v1 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  v2 = (void *)dateFromEmailString___pasExprOnceResult_134;
  dateFromEmailString___pasExprOnceResult_134 = v1;
}

void __58__SGSimpleMailMessage_RFC822Parsing__dateFromEmailString___block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v1 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:@"en_US_POSIX"];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__SGSimpleMailMessage_RFC822Parsing__dateFromEmailString___block_invoke_2;
  v5[3] = &unk_1E65B6F40;
  id v6 = v1;
  id v7 = &unk_1F25367E8;
  id v8 = &unk_1F2536800;
  id v2 = v1;
  uint64_t v3 = objc_msgSend(&unk_1F2536818, "_pas_mappedArrayWithTransform:", v5);

  id v4 = (void *)dateFromEmailString___pasExprOnceResult;
  dateFromEmailString___pasExprOnceResult = v3;
}

id __58__SGSimpleMailMessage_RFC822Parsing__dateFromEmailString___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_opt_new();
  [v4 setLocale:a1[4]];
  [v4 setShortMonthSymbols:a1[5]];
  [v4 setShortWeekdaySymbols:a1[6]];
  [v4 setLenient:1];
  [v4 setDateFormat:v3];

  return v4;
}

+ (id)addressItemsFromEmailString:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1CB79B230]();
  id v6 = [a1 decodeEncodedWordsIn:v4];
  id v7 = [v6 componentsSeparatedByString:@","];
  id v8 = objc_msgSend(v7, "_pas_mappedArrayWithTransform:", &__block_literal_global_8890);

  return v8;
}

id __66__SGSimpleMailMessage_RFC822Parsing__addressItemsFromEmailString___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F28B88];
  id v3 = a2;
  id v4 = [v2 whitespaceAndNewlineCharacterSet];
  id v5 = [v3 stringByTrimmingCharactersInSet:v4];

  return v5;
}

+ (id)simpleMailMessageFromHeaders:(id)a3
{
  id v67 = a1;
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [[SGSimpleMailMessage alloc] initForBuilding];
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id obj = v3;
  uint64_t v6 = [obj countByEnumeratingWithState:&v70 objects:v74 count:16];
  if (!v6) {
    goto LABEL_50;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v71;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v71 != v8) {
        objc_enumerationMutation(obj);
      }
      id v10 = *(void **)(*((void *)&v70 + 1) + 8 * i);
      uint64_t v11 = (void *)MEMORY[0x1CB79B230]();
      uint64_t v12 = [v10 key];
      [v5 addObject:v12];

      uint64_t v13 = [v4 messageId];
      if (v13)
      {
      }
      else
      {
        int v14 = [v10 key];
        uint64_t v15 = [v14 caseInsensitiveCompare:@"message-id"];

        if (!v15)
        {
          uint64_t v35 = [v10 value];
          long long v36 = (void *)[v35 copy];
          [v4 setMessageId:v36];
          goto LABEL_46;
        }
      }
      uint64_t v16 = objc_msgSend(v4, "subject", v67);
      if (v16)
      {
      }
      else
      {
        uint64_t v17 = [v10 key];
        uint64_t v18 = [v17 caseInsensitiveCompare:@"subject"];

        if (!v18)
        {
          uint64_t v35 = [v10 value];
          [v4 setSubject:v35];
          goto LABEL_47;
        }
      }
      long long v19 = [v4 date];
      if (v19)
      {
      }
      else
      {
        long long v20 = [v10 key];
        uint64_t v21 = [v20 caseInsensitiveCompare:@"date"];

        if (!v21)
        {
          uint64_t v35 = [v10 value];
          long long v36 = [v67 dateFromEmailString:v35];
          [v4 setDate:v36];
          goto LABEL_46;
        }
      }
      long long v22 = [v4 from];
      if (v22)
      {
      }
      else
      {
        uint64_t v23 = [v10 key];
        uint64_t v24 = [v23 caseInsensitiveCompare:@"from"];

        if (!v24)
        {
          uint64_t v47 = (void *)MEMORY[0x1E4F5DB38];
          uint64_t v35 = [v10 value];
          long long v36 = [v47 namedEmailAddressWithFieldValue:v35];
          [v4 setFrom:v36];
          goto LABEL_46;
        }
      }
      uint64_t v25 = [v4 replyTo];
      if (v25)
      {
      }
      else
      {
        uint64_t v26 = [v10 key];
        uint64_t v27 = [v26 caseInsensitiveCompare:@"reply-to"];

        if (!v27)
        {
          CFIndex v48 = (void *)MEMORY[0x1E4F5DB38];
          uint64_t v35 = [v10 value];
          v49 = [v67 addressItemsFromEmailString:v35];
          uint64_t v50 = [v49 firstObject];
          CFRange v51 = [v48 namedEmailAddressWithFieldValue:v50];
          [v4 setReplyTo:v51];

          goto LABEL_47;
        }
      }
      uint64_t v28 = [v4 to];
      if (v28)
      {
      }
      else
      {
        int v29 = [v10 key];
        uint64_t v30 = [v29 caseInsensitiveCompare:@"to"];

        if (!v30)
        {
          v52 = (void *)MEMORY[0x1E4F5DB38];
          uint64_t v35 = [v10 value];
          long long v36 = [v67 addressItemsFromEmailString:v35];
          v53 = [v52 namedEmailAddressesWithFieldValues:v36];
          [v4 setTo:v53];
          goto LABEL_45;
        }
      }
      char v31 = [v4 mailConversationIdentifier];
      if (v31)
      {
      }
      else
      {
        uint64_t v32 = [v10 key];
        uint64_t v33 = [v32 caseInsensitiveCompare:@"conversation-id"];

        if (!v33)
        {
          uint64_t v35 = [v10 value];
          [v4 setMailConversationIdentifier:v35];
          goto LABEL_47;
        }
      }
      uint64_t v34 = [v4 cc];
      if (v34)
      {
      }
      else
      {
        long long v37 = [v10 key];
        uint64_t v38 = [v37 caseInsensitiveCompare:@"cc"];

        if (!v38)
        {
          v54 = (void *)MEMORY[0x1E4F5DB38];
          uint64_t v35 = [v10 value];
          long long v36 = [v67 addressItemsFromEmailString:v35];
          v53 = [v54 namedEmailAddressesWithFieldValues:v36];
          [v4 setCc:v53];
          goto LABEL_45;
        }
      }
      long long v39 = [v4 bcc];
      if (v39)
      {

        goto LABEL_35;
      }
      long long v40 = [v10 key];
      uint64_t v41 = [v40 caseInsensitiveCompare:@"bcc"];

      if (!v41)
      {
        uint64_t v55 = (void *)MEMORY[0x1E4F5DB38];
        uint64_t v35 = [v10 value];
        long long v36 = [v67 addressItemsFromEmailString:v35];
        v53 = [v55 namedEmailAddressesWithFieldValues:v36];
        [v4 setBcc:v53];
LABEL_45:

LABEL_46:
        goto LABEL_47;
      }
LABEL_35:
      uint64_t v35 = [v4 mailingList];
      if (!v35)
      {
        long long v42 = [v10 key];
        uint64_t v43 = [v42 caseInsensitiveCompare:@"list-id"];

        if (v43) {
          goto LABEL_48;
        }
        v44 = (void *)MEMORY[0x1E4F5DB38];
        uint64_t v35 = [v10 value];
        long long v36 = [v67 addressItemsFromEmailString:v35];
        id v45 = [v36 firstObject];
        v46 = [v44 namedEmailAddressWithFieldValue:v45];
        [v4 setMailingList:v46];

        goto LABEL_46;
      }
LABEL_47:

LABEL_48:
    }
    uint64_t v7 = [obj countByEnumeratingWithState:&v70 objects:v74 count:16];
  }
  while (v7);
LABEL_50:

  uint64_t v56 = [v4 to];
  v57 = (void *)v56;
  uint64_t v58 = MEMORY[0x1E4F1CBF0];
  if (v56) {
    uint64_t v59 = v56;
  }
  else {
    uint64_t v59 = MEMORY[0x1E4F1CBF0];
  }
  objc_msgSend(v4, "setTo:", v59, v67);

  uint64_t v60 = [v4 cc];
  NSUInteger v61 = (void *)v60;
  if (v60) {
    uint64_t v62 = v60;
  }
  else {
    uint64_t v62 = v58;
  }
  [v4 setCc:v62];

  uint64_t v63 = [v4 bcc];
  v64 = (void *)v63;
  if (v63) {
    uint64_t v65 = v63;
  }
  else {
    uint64_t v65 = v58;
  }
  [v4 setBcc:v65];

  objc_msgSend(v4, "setHasInhumanHeaders:", objc_msgSend(v68, "headersContainInhumanOnes:keys:", obj, v5));
  [v4 setHeaders:obj];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailingList, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_htmlParser, 0);
  objc_storeStrong((id *)&self->_mailboxIdentifiers, 0);
  objc_storeStrong((id *)&self->_inReplyTo, 0);
  objc_storeStrong((id *)&self->_appleMailMessageId, 0);
  objc_storeStrong((id *)&self->_messageId, 0);
  objc_storeStrong((id *)&self->_forwardedBy, 0);
  objc_storeStrong((id *)&self->_bcc, 0);
  objc_storeStrong((id *)&self->_cc, 0);
  objc_storeStrong((id *)&self->_to, 0);
  objc_storeStrong((id *)&self->_replyTo, 0);
  objc_storeStrong((id *)&self->_from, 0);
  objc_storeStrong((id *)&self->_authorCached, 0);
  objc_storeStrong((id *)&self->_hasHumanHeadersCached, 0);
  objc_storeStrong((id *)&self->_quotedRegionsCached, 0);
  objc_storeStrong((id *)&self->_htmlContentDataCached, 0);
  objc_storeStrong((id *)&self->_htmlContentData, 0);
  objc_storeStrong((id *)&self->_htmlBodyCached, 0);
  objc_storeStrong((id *)&self->_htmlBody, 0);
}

- (void)setMailingList:(id)a3
{
}

- (SGSimpleNamedEmailAddress)mailingList
{
  return self->_mailingList;
}

- (NSArray)headers
{
  return self->_headers;
}

- (void)setIsPartiallyDownloaded:(BOOL)a3
{
  self->_isPartiallyDownloaded = a3;
}

- (BOOL)isPartiallyDownloaded
{
  return self->_isPartiallyDownloaded;
}

- (void)setHasInhumanHeaders:(BOOL)a3
{
  self->_hasInhumanHeaders = a3;
}

- (BOOL)hasInhumanHeaders
{
  return self->_hasInhumanHeaders;
}

- (HVHtmlParser)htmlParser
{
  return self->_htmlParser;
}

- (void)setMailboxIdentifiers:(id)a3
{
}

- (NSArray)mailboxIdentifiers
{
  return self->_mailboxIdentifiers;
}

- (NSString)inReplyTo
{
  return self->_inReplyTo;
}

- (NSString)appleMailMessageId
{
  return self->_appleMailMessageId;
}

- (void)setMessageId:(id)a3
{
}

- (NSString)messageId
{
  return self->_messageId;
}

- (SGSimpleNamedEmailAddress)forwardedBy
{
  return self->_forwardedBy;
}

- (void)setBcc:(id)a3
{
}

- (NSArray)bcc
{
  return self->_bcc;
}

- (void)setCc:(id)a3
{
}

- (NSArray)cc
{
  return self->_cc;
}

- (void)setTo:(id)a3
{
}

- (NSArray)to
{
  return self->_to;
}

- (void)setReplyTo:(id)a3
{
}

- (SGSimpleNamedEmailAddress)replyTo
{
  return self->_replyTo;
}

- (void)setFrom:(id)a3
{
}

- (SGSimpleNamedEmailAddress)from
{
  return self->_from;
}

- (id)convertMailMessageToBMMailMessage:(id)a3
{
  id v3 = a3;
  id v4 = [v3 from];
  id v5 = [v4 emailAddress];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F503B8]);
    uint64_t v7 = [v3 from];
    uint64_t v8 = [v7 name];
    uint64_t v9 = [v3 from];
    id v10 = [v9 emailAddress];
    uint64_t v11 = (void *)[v6 initWithName:v8 handleType:0 handle:v10 contactIdentifier:0];

    uint64_t v12 = [v3 to];
    uint64_t v13 = objc_msgSend(v12, "_pas_mappedArrayWithTransform:", &__block_literal_global_290);
    int v14 = (void *)v13;
    uint64_t v15 = (void *)MEMORY[0x1E4F1CBF0];
    if (v13) {
      uint64_t v15 = (void *)v13;
    }
    id v16 = v15;

    uint64_t v17 = [v3 subject];
    uint64_t v18 = (void *)v17;
    long long v19 = &stru_1F24EEF20;
    if (v17) {
      long long v19 = (__CFString *)v17;
    }
    long long v20 = v19;

    if (v11
      && ([v3 messageId], uint64_t v21 = objc_claimAutoreleasedReturnValue(), v21, v21))
    {
      id v33 = objc_alloc(MEMORY[0x1E4F50398]);
      uint64_t v32 = [v3 uniqueIdentifier];
      uint64_t v34 = [v3 date];
      [v34 timeIntervalSinceReferenceDate];
      double v23 = v22;
      uint64_t v24 = [v3 source];
      uint64_t v25 = [v3 messageId];
      uint64_t v26 = [v3 headersDictionary];
      uint64_t v27 = [v3 htmlContentData];
      uint64_t v28 = [v3 textContent];
      LOBYTE(v31) = 1;
      int v29 = objc_msgSend(v33, "initWithUniqueId:domainId:absoluteTimestamp:accountIdentifier:messageIdentifier:fromHandle:toHandles:ccHandles:bccHandles:headers:subject:htmlContent:textContent:isFullyDownloaded:securityMethod:accountHandles:replyTo:mailboxIdentifiers:listId:accountType:attachments:", v32, 0, v24, v25, v11, v16, v23, 0, 0, v26, v20, v27, v28, v31, 0,
                      0,
                      0,
                      0,
                      0,
                      0,
                      0);
    }
    else
    {
      int v29 = 0;
    }
  }
  else
  {
    int v29 = 0;
  }

  return v29;
}

id __57__SGSimpleMailMessage_convertMailMessageToBMMailMessage___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x1E4F503B8];
  id v3 = a2;
  id v4 = [v2 alloc];
  id v5 = [v3 name];
  id v6 = [v3 emailAddress];

  uint64_t v7 = (void *)[v4 initWithName:v5 handleType:0 handle:v6 contactIdentifier:0];
  return v7;
}

- (id)createNewSearchableItem
{
  return [(SGSimpleMailMessage *)self createNewSearchableItemWithSource:0 uniqueIdentifier:0 domainIdentifier:0];
}

- (id)createNewSearchableItemWithSource:(id)a3 uniqueIdentifier:(id)a4 domainIdentifier:(id)a5
{
  v50[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)MEMORY[0x1CB79B230]();
  id v12 = objc_alloc(MEMORY[0x1E4F23850]);
  uint64_t v13 = (void *)[v12 initWithContentType:*MEMORY[0x1E4F443A8]];
  int v14 = [(SGMessage *)self subject];

  if (v14)
  {
    uint64_t v15 = [(SGMessage *)self subject];
    [v13 setSubject:v15];
  }
  id v16 = [(SGMessage *)self date];

  if (v16)
  {
    uint64_t v17 = [(SGMessage *)self date];
    [v13 setContentCreationDate:v17];
  }
  uint64_t v18 = [(SGSimpleMailMessage *)self appleMailMessageId];

  if (v18)
  {
    long long v19 = [(SGSimpleMailMessage *)self appleMailMessageId];
    [v13 setMailMessageID:v19];
  }
  long long v20 = [(SGMessage *)self accountHandles];

  if (v20)
  {
    uint64_t v21 = [(SGMessage *)self accountHandles];
    [v13 setAccountHandles:v21];
  }
  double v22 = [(SGSimpleMailMessage *)self from];

  if (v22)
  {
    double v23 = [(SGSimpleMailMessage *)self from];
    uint64_t v24 = [v23 name];
    uint64_t v25 = (void *)v24;
    uint64_t v26 = &stru_1F24EEF20;
    if (v24) {
      uint64_t v26 = (__CFString *)v24;
    }
    v50[0] = v26;
    uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:1];
    [v13 setAuthorNames:v27];

    uint64_t v28 = [(SGSimpleMailMessage *)self from];
    uint64_t v29 = [v28 emailAddress];
    uint64_t v30 = (void *)v29;
    uint64_t v31 = &stru_1F24EEF20;
    if (v29) {
      uint64_t v31 = (__CFString *)v29;
    }
    v49 = v31;
    uint64_t v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
    [v13 setAuthorEmailAddresses:v32];

    id v33 = [(SGSimpleMailMessage *)self from];
    uint64_t v34 = [v33 asCSPerson];
    CFIndex v48 = v34;
    uint64_t v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
    [v13 setAuthors:v35];
  }
  long long v36 = [(SGSimpleMailMessage *)self to];
  long long v37 = sgMapSelector();
  [v13 setPrimaryRecipients:v37];

  uint64_t v38 = [(SGSimpleMailMessage *)self cc];
  long long v39 = sgMapSelector();
  [v13 setAdditionalRecipients:v39];

  long long v40 = [(SGSimpleMailMessage *)self bcc];
  uint64_t v41 = sgMapSelector();
  [v13 setHiddenAdditionalRecipients:v41];

  long long v42 = [(SGSimpleMailMessage *)self headersDictionary];
  [v13 setEmailHeaders:v42];

  if (self->_htmlContentData || self->_htmlBody)
  {
    uint64_t v43 = [(SGSimpleMailMessage *)self htmlContentData];
    [v13 setHTMLContentData:v43];
  }
  else
  {
    uint64_t v43 = [(SGSimpleMailMessage *)self body];
    [v13 setTextContent:v43];
  }

  if (v8 || ([(SGMessage *)self source], (id v8 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    [v13 setAccountIdentifier:v8];
  }
  if ([(SGMessage *)self isSent])
  {
    uint64_t v47 = *MEMORY[0x1E4F22998];
    v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
    [v13 setMailboxIdentifiers:v44];
  }
  id v45 = (void *)[objc_alloc(MEMORY[0x1E4F23840]) initWithUniqueIdentifier:v9 domainIdentifier:v10 attributeSet:v13];
  [v45 setBundleID:*MEMORY[0x1E4F5DC28]];

  return v45;
}

- (void)setHeaders:(id)a3
{
}

- (id)spotlightUniqueIdentifier
{
  v8.receiver = self;
  v8.super_class = (Class)SGSimpleMailMessage;
  id v3 = [(SGMessage *)&v8 spotlightUniqueIdentifier];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(SGSimpleMailMessage *)self uniqueIdentifier];
  }
  id v6 = v5;

  return v6;
}

- (id)spotlightBundleIdentifier
{
  v6.receiver = self;
  v6.super_class = (Class)SGSimpleMailMessage;
  id v2 = [(SGMessage *)&v6 spotlightBundleIdentifier];
  id v3 = v2;
  if (!v2) {
    id v2 = (void *)*MEMORY[0x1E4F5DC28];
  }
  id v4 = v2;

  return v4;
}

- (BOOL)hasRecipientFromSameDomainAsSender
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [(SGSimpleMailMessage *)self senderDomain];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(SGSimpleMailMessage *)self to];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        objc_super v8 = [*(id *)(*((void *)&v12 + 1) + 8 * i) emailAddress];
        id v9 = emailAddressDomain(v8);
        char v10 = [v9 isEqualToString:v3];

        if (v10)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (id)senderDomain
{
  id v2 = [(SGSimpleMailMessage *)self from];
  id v3 = [v2 emailAddress];
  id v4 = emailAddressDomain(v3);

  return v4;
}

- (id)allRecipients
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v4 = [(SGSimpleMailMessage *)self to];
  uint64_t v5 = (void *)[v3 initWithArray:v4];

  uint64_t v6 = [(SGSimpleMailMessage *)self cc];
  [v5 addObjectsFromArray:v6];

  uint64_t v7 = [(SGSimpleMailMessage *)self bcc];
  [v5 addObjectsFromArray:v7];

  objc_super v8 = (void *)[v5 copy];
  return v8;
}

- (SGSimpleMailMessage)initWithMailContentEvent:(id)a3 contentProtection:(id)a4 htmlParser:(id)a5
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v99.receiver = self;
  v99.super_class = (Class)SGSimpleMailMessage;
  uint64_t v11 = [(SGMessage *)&v99 initWithMailContentEvent:v8 contentProtection:v9];
  if (v11)
  {
    id v79 = a5;
    id v80 = v10;
    id v81 = v9;
    long long v12 = [v8 replyTo];

    if (v12)
    {
      id v13 = objc_alloc(MEMORY[0x1E4F5DB38]);
      long long v14 = [v8 replyTo];
      uint64_t v15 = [v13 initWithNamedHandle:v14];
      replyTo = v11->_replyTo;
      v11->_replyTo = (SGSimpleNamedEmailAddress *)v15;
    }
    uint64_t v17 = [v8 listId];

    if (v17)
    {
      id v18 = objc_alloc(MEMORY[0x1E4F5DB38]);
      long long v19 = [v8 listId];
      uint64_t v20 = [v18 initWithNamedHandle:v19];
      mailingList = v11->_mailingList;
      v11->_mailingList = (SGSimpleNamedEmailAddress *)v20;
    }
    double v22 = [v8 headers];
    NSUInteger v82 = v11;
    if (v22)
    {
      double v23 = objc_opt_class();
      uint64_t v24 = [v8 headers];
      v11->_hasInhumanHeaders = [v23 headerDictionaryContainsInhumanHeaders:v24];
    }
    else
    {
      v11->_hasInhumanHeaders = 0;
    }

    long long v97 = 0u;
    long long v98 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    char v83 = v8;
    uint64_t v25 = [v8 headers];
    uint64_t v26 = [v25 countByEnumeratingWithState:&v95 objects:v102 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v96;
LABEL_11:
      uint64_t v29 = 0;
      while (1)
      {
        if (*(void *)v96 != v28) {
          objc_enumerationMutation(v25);
        }
        uint64_t v30 = *(void *)(*((void *)&v95 + 1) + 8 * v29);
        if (![@"message-id" compare:v30 options:3])
        {
          uint64_t v31 = [v8 headers];
          uint64_t v32 = [v31 objectForKeyedSubscript:v30];
          uint64_t v33 = [v32 firstObject];
          messageId = v82->_messageId;
          v82->_messageId = (NSString *)v33;

          if (v82->_messageId) {
            break;
          }
        }
        if (v27 == ++v29)
        {
          uint64_t v27 = [v25 countByEnumeratingWithState:&v95 objects:v102 count:16];
          if (v27) {
            goto LABEL_11;
          }
          break;
        }
      }
    }

    if (!v82->_messageId)
    {
      uint64_t v35 = [v8 messageIdentifier];
      long long v36 = v82->_messageId;
      v82->_messageId = (NSString *)v35;
    }
    uint64_t v37 = [v8 messageIdentifier];
    appleMailMessageId = v82->_appleMailMessageId;
    v82->_appleMailMessageId = (NSString *)v37;

    long long v39 = [v8 headers];
    long long v40 = [v39 objectForKeyedSubscript:@"in-reply-to"];
    uint64_t v41 = [v40 objectAtIndexedSubscript:0];
    inReplyTo = v82->_inReplyTo;
    v82->_inReplyTo = (NSString *)v41;

    id v43 = objc_alloc(MEMORY[0x1E4F5DB38]);
    v44 = [v8 fromHandle];
    uint64_t v45 = [v43 initWithNamedHandle:v44];
    from = v82->_from;
    v82->_from = (SGSimpleNamedEmailAddress *)v45;

    uint64_t v47 = [v8 toHandles];
    uint64_t v48 = objc_msgSend(v47, "_pas_mappedArrayWithTransform:", &__block_literal_global_268_11306);
    v49 = (void *)v48;
    uint64_t v50 = (void *)MEMORY[0x1E4F1CBF0];
    if (v48) {
      CFRange v51 = (void *)v48;
    }
    else {
      CFRange v51 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v82->_to, v51);

    v52 = [v83 ccHandles];
    uint64_t v53 = objc_msgSend(v52, "_pas_mappedArrayWithTransform:", &__block_literal_global_270);
    v54 = (void *)v53;
    if (v53) {
      uint64_t v55 = (void *)v53;
    }
    else {
      uint64_t v55 = v50;
    }
    objc_storeStrong((id *)&v82->_cc, v55);

    uint64_t v56 = [v83 bccHandles];
    uint64_t v57 = objc_msgSend(v56, "_pas_mappedArrayWithTransform:", &__block_literal_global_272);
    uint64_t v58 = (void *)v57;
    if (v57) {
      uint64_t v59 = (void *)v57;
    }
    else {
      uint64_t v59 = v50;
    }
    objc_storeStrong((id *)&v82->_bcc, v59);

    uint64_t v60 = [v83 mailboxIdentifiers];
    mailboxIdentifiers = v82->_mailboxIdentifiers;
    v82->_mailboxIdentifiers = (NSArray *)v60;

    [(SGMessage *)v82 setIsSent:[(NSArray *)v82->_mailboxIdentifiers containsObject:*MEMORY[0x1E4F22998]]];
    v82->_isPartiallyDownloaded = [v83 isFullyDownloaded] ^ 1;
    uint64_t v62 = [v83 headers];
    uint64_t v63 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v62, "count"));
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    id obj = v62;
    uint64_t v85 = [obj countByEnumeratingWithState:&v91 objects:v101 count:16];
    if (v85)
    {
      uint64_t v84 = *(void *)v92;
      do
      {
        for (uint64_t i = 0; i != v85; ++i)
        {
          if (*(void *)v92 != v84) {
            objc_enumerationMutation(obj);
          }
          uint64_t v65 = *(void *)(*((void *)&v91 + 1) + 8 * i);
          uint64_t v66 = (void *)MEMORY[0x1CB79B230]();
          long long v87 = 0u;
          long long v88 = 0u;
          long long v89 = 0u;
          long long v90 = 0u;
          id v67 = [obj objectForKeyedSubscript:v65];
          uint64_t v68 = [v67 countByEnumeratingWithState:&v87 objects:v100 count:16];
          if (v68)
          {
            uint64_t v69 = v68;
            uint64_t v70 = *(void *)v88;
            do
            {
              for (uint64_t j = 0; j != v69; ++j)
              {
                if (*(void *)v88 != v70) {
                  objc_enumerationMutation(v67);
                }
                long long v72 = [[SGSimpleMailHeaderKeyValue alloc] initWithKey:v65 value:*(void *)(*((void *)&v87 + 1) + 8 * j)];
                [(NSArray *)v63 addObject:v72];
              }
              uint64_t v69 = [v67 countByEnumeratingWithState:&v87 objects:v100 count:16];
            }
            while (v69);
          }
        }
        uint64_t v85 = [obj countByEnumeratingWithState:&v91 objects:v101 count:16];
      }
      while (v85);
    }

    uint64_t v11 = v82;
    headers = v82->_headers;
    v82->_headers = v63;
    NSUInteger v74 = v63;

    id v8 = v83;
    uint64_t v75 = [v83 htmlContent];
    htmlContentData = v82->_htmlContentData;
    v82->_htmlContentData = (NSData *)v75;

    objc_storeStrong((id *)&v82->_htmlParser, v79);
    uint64_t v77 = [v83 textContent];
    [(SGMessage *)v82 setTextContent:v77];

    id v10 = v80;
    id v9 = v81;
  }

  return v11;
}

id __77__SGSimpleMailMessage_initWithMailContentEvent_contentProtection_htmlParser___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x1E4F5DB38];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithNamedHandle:v3];

  return v4;
}

id __77__SGSimpleMailMessage_initWithMailContentEvent_contentProtection_htmlParser___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x1E4F5DB38];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithNamedHandle:v3];

  return v4;
}

id __77__SGSimpleMailMessage_initWithMailContentEvent_contentProtection_htmlParser___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x1E4F5DB38];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithNamedHandle:v3];

  return v4;
}

- (SGSimpleMailMessage)initWithSearchableItem:(id)a3
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v71.receiver = self;
  v71.super_class = (Class)SGSimpleMailMessage;
  uint64_t v5 = [(SGMessage *)&v71 initWithSearchableItem:v4];
  if (v5)
  {
    context = (void *)MEMORY[0x1CB79B230]();
    uint64_t v6 = [v4 attributeSet];
    uint64_t v7 = [v6 accountIdentifier];
    [(SGMessage *)v5 setSource:v7];

    id v8 = [v6 contentCreationDate];
    id v9 = (void *)[v8 copy];
    [(SGMessage *)v5 setDate:v9];

    id v10 = [v6 authors];
    uint64_t v11 = [v6 emailHeaders];
    if (v11)
    {
      id v12 = objc_alloc(MEMORY[0x1E4F28E10]);
      id v13 = objc_msgSend(MEMORY[0x1E4F28E10], "hv_headerKeyFunctions");
      long long v14 = objc_msgSend(MEMORY[0x1E4F28E10], "hv_headerValueFunctions");
      uint64_t v15 = (NSMapTable *)objc_msgSend(v12, "initWithKeyPointerFunctions:valuePointerFunctions:capacity:", v13, v14, objc_msgSend(v11, "count"));

      [(NSMapTable *)v15 hv_addEntriesFromHeadersDictionary:v11];
    }
    else
    {
      uint64_t v15 = 0;
    }
    if ([v10 count])
    {
      id v16 = (void *)MEMORY[0x1E4F5DB38];
      uint64_t v17 = [v10 objectAtIndexedSubscript:0];
      id v18 = [v16 namedEmailAddressWithCSPerson:v17];
      [(SGSimpleMailMessage *)v5 setFrom:v18];
    }
    long long v19 = [(NSMapTable *)v15 objectForKey:@"reply-to"];
    if ([v19 count])
    {
      uint64_t v20 = (void *)MEMORY[0x1E4F5DB38];
      uint64_t v21 = [v19 objectAtIndexedSubscript:0];
      double v22 = [v20 namedEmailAddressWithFieldValue:v21];
      [(SGSimpleMailMessage *)v5 setReplyTo:v22];
    }
    double v23 = [(NSMapTable *)v15 hv_firstHeaderForKey:@"message-id"];
    if (v23 || ([v6 mailMessageID], (double v23 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      [(SGSimpleMailMessage *)v5 setMessageId:v23];
    }
    uint64_t v24 = [v6 mailMessageID];
    appleMailMessageId = v5->_appleMailMessageId;
    v5->_appleMailMessageId = (NSString *)v24;

    uint64_t v26 = [(NSMapTable *)v15 hv_firstHeaderForKey:@"in-reply-to"];
    inReplyTo = v5->_inReplyTo;
    v5->_inReplyTo = (NSString *)v26;

    uint64_t v28 = [(NSMapTable *)v15 hv_firstHeaderForKey:@"list-id"];
    if (v28)
    {
      uint64_t v29 = [MEMORY[0x1E4F5DB38] namedEmailAddressWithFieldValue:v28];
      [(SGSimpleMailMessage *)v5 setMailingList:v29];
    }
    uint64_t v53 = (void *)v28;
    uint64_t v30 = [v6 primaryRecipients];
    uint64_t v31 = sgMapAndFilter();
    [(SGSimpleMailMessage *)v5 setTo:v31];

    uint64_t v32 = [v6 additionalRecipients];
    uint64_t v33 = sgMapAndFilter();
    [(SGSimpleMailMessage *)v5 setCc:v33];

    uint64_t v34 = [v6 hiddenAdditionalRecipients];
    uint64_t v35 = sgMapAndFilter();
    [(SGSimpleMailMessage *)v5 setBcc:v35];

    long long v36 = [v6 mailboxIdentifiers];
    [(SGSimpleMailMessage *)v5 setMailboxIdentifiers:v36];

    uint64_t v56 = v10;
    uint64_t v57 = v6;
    v54 = v19;
    uint64_t v55 = v11;
    if (v15)
    {
      uint64_t v37 = objc_opt_class();
      uint64_t v38 = NSAllMapTableKeys(v15);
      -[SGSimpleMailMessage setHasInhumanHeaders:](v5, "setHasInhumanHeaders:", [v37 headersContainInhumanOnes:v15 keys:v38]);
    }
    else
    {
      [(SGSimpleMailMessage *)v5 setHasInhumanHeaders:0];
    }
    id v59 = v4;
    long long v39 = [v4 attributeSet];
    long long v40 = [v39 isPartiallyDownloaded];
    -[SGSimpleMailMessage setIsPartiallyDownloaded:](v5, "setIsPartiallyDownloaded:", [v40 BOOLValue]);

    uint64_t v41 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMapTable count](v15, "count"));
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id obj = v15;
    uint64_t v61 = [(NSMapTable *)obj countByEnumeratingWithState:&v67 objects:v73 count:16];
    if (v61)
    {
      uint64_t v60 = *(void *)v68;
      do
      {
        for (uint64_t i = 0; i != v61; ++i)
        {
          if (*(void *)v68 != v60) {
            objc_enumerationMutation(obj);
          }
          uint64_t v43 = *(void *)(*((void *)&v67 + 1) + 8 * i);
          v44 = (void *)MEMORY[0x1CB79B230]();
          long long v63 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          uint64_t v45 = [(NSMapTable *)obj objectForKey:v43];
          uint64_t v46 = [v45 countByEnumeratingWithState:&v63 objects:v72 count:16];
          if (v46)
          {
            uint64_t v47 = v46;
            uint64_t v48 = *(void *)v64;
            do
            {
              for (uint64_t j = 0; j != v47; ++j)
              {
                if (*(void *)v64 != v48) {
                  objc_enumerationMutation(v45);
                }
                uint64_t v50 = [[SGSimpleMailHeaderKeyValue alloc] initWithKey:v43 value:*(void *)(*((void *)&v63 + 1) + 8 * j)];
                [v41 addObject:v50];
              }
              uint64_t v47 = [v45 countByEnumeratingWithState:&v63 objects:v72 count:16];
            }
            while (v47);
          }
        }
        uint64_t v61 = [(NSMapTable *)obj countByEnumeratingWithState:&v67 objects:v73 count:16];
      }
      while (v61);
    }

    objc_storeStrong((id *)&v5->_headers, v41);
    CFRange v51 = [v57 HTMLContentDataNoCopy];
    if (v51)
    {
      [(SGMessage *)v5 setTextContent:0];
      [(SGSimpleMailMessage *)v5 setHtmlContentData:v51];
    }
    id v4 = v59;
    -[SGMessage setIsSent:](v5, "setIsSent:", [MEMORY[0x1E4F93790] mailItemIsInSent:v59]);
  }

  return v5;
}

uint64_t __46__SGSimpleMailMessage_initWithSearchableItem___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F5DB38] namedEmailAddressWithCSPerson:a2];
}

uint64_t __46__SGSimpleMailMessage_initWithSearchableItem___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F5DB38] namedEmailAddressWithCSPerson:a2];
}

uint64_t __46__SGSimpleMailMessage_initWithSearchableItem___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F5DB38] namedEmailAddressWithCSPerson:a2];
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(SGSimpleMailMessage *)self asDictionary];
  uint64_t v5 = (void *)[v3 initWithFormat:@"<SGSimpleMailMessage %@>", v4];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SGSimpleMailMessage;
  id v4 = [(SGMessage *)&v7 copyWithZone:a3];
  uint64_t v5 = v4;
  if (self->_htmlContentData)
  {
    objc_msgSend(v4, "setHtmlContentData:");
  }
  else if (self->_htmlBody)
  {
    objc_msgSend(v4, "setHtmlBody:");
  }
  [v5 setMessageId:self->_messageId];
  [v5 setFrom:self->_from];
  [v5 setReplyTo:self->_replyTo];
  [v5 setTo:self->_to];
  [v5 setCc:self->_cc];
  [v5 setBcc:self->_bcc];
  [v5 setHasInhumanHeaders:self->_hasInhumanHeaders];
  [v5 setIsPartiallyDownloaded:self->_isPartiallyDownloaded];
  [v5 setMailingList:self->_mailingList];
  objc_storeStrong(v5 + 40, self->_headers);
  objc_storeStrong(v5 + 36, self->_appleMailMessageId);
  objc_storeStrong(v5 + 37, self->_inReplyTo);
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SGSimpleMailMessage;
  id v4 = a3;
  [(SGMessage *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_htmlBody, @"htmlBody", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_htmlContentData forKey:@"htmlContentData"];
  [v4 encodeObject:self->_messageId forKey:@"messageId"];
  [v4 encodeObject:self->_inReplyTo forKey:@"inReplyTo"];
  [v4 encodeObject:self->_from forKey:@"from"];
  [v4 encodeObject:self->_replyTo forKey:@"replyTo"];
  [v4 encodeObject:self->_mailingList forKey:@"mailingList"];
  [v4 encodeObject:self->_to forKey:@"to"];
  [v4 encodeObject:self->_cc forKey:@"cc"];
  [v4 encodeObject:self->_bcc forKey:@"bcc"];
  [v4 encodeBool:self->_hasInhumanHeaders forKey:@"hasInhumanHeaders"];
  [v4 encodeBool:self->_isPartiallyDownloaded forKey:@"isPartiallyDownloaded"];
  [v4 encodeObject:self->_headers forKey:@"headers"];
  [v4 encodeObject:self->_appleMailMessageId forKey:@"appleMailMessageId"];
}

- (SGSimpleMailMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)SGSimpleMailMessage;
  objc_super v5 = [(SGMessage *)&v51 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"htmlBody"];
    htmlBody = v5->_htmlBody;
    v5->_htmlBody = (NSString *)v7;

    id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"htmlContentData"];
    htmlContentData = v5->_htmlContentData;
    v5->_htmlContentData = (NSData *)v10;

    id v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"messageId"];
    messageId = v5->_messageId;
    v5->_messageId = (NSString *)v13;

    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"inReplyTo"];
    inReplyTo = v5->_inReplyTo;
    v5->_inReplyTo = (NSString *)v16;

    id v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"from"];
    from = v5->_from;
    v5->_from = (SGSimpleNamedEmailAddress *)v19;

    uint64_t v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"mailingList"];
    mailingList = v5->_mailingList;
    v5->_mailingList = (SGSimpleNamedEmailAddress *)v22;

    uint64_t v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"replyTo"];
    replyTo = v5->_replyTo;
    v5->_replyTo = (SGSimpleNamedEmailAddress *)v25;

    id v27 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v28 = objc_opt_class();
    uint64_t v29 = objc_msgSend(v27, "initWithObjects:", v28, objc_opt_class(), 0);
    uint64_t v30 = [v4 decodeObjectOfClasses:v29 forKey:@"to"];
    to = v5->_to;
    v5->_to = (NSArray *)v30;

    id v32 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v33 = objc_opt_class();
    uint64_t v34 = objc_msgSend(v32, "initWithObjects:", v33, objc_opt_class(), 0);
    uint64_t v35 = [v4 decodeObjectOfClasses:v34 forKey:@"cc"];
    cc = v5->_cc;
    v5->_cc = (NSArray *)v35;

    id v37 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v38 = objc_opt_class();
    long long v39 = objc_msgSend(v37, "initWithObjects:", v38, objc_opt_class(), 0);
    uint64_t v40 = [v4 decodeObjectOfClasses:v39 forKey:@"bcc"];
    bcc = v5->_bcc;
    v5->_bcc = (NSArray *)v40;

    v5->_hasInhumanHeaders = [v4 decodeBoolForKey:@"hasInhumanHeaders"];
    v5->_isPartiallyDownloaded = [v4 decodeBoolForKey:@"isPartiallyDownloaded"];
    id v42 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v43 = objc_opt_class();
    v44 = objc_msgSend(v42, "initWithObjects:", v43, objc_opt_class(), 0);
    uint64_t v45 = [v4 decodeObjectOfClasses:v44 forKey:@"headers"];
    headers = v5->_headers;
    v5->_headers = (NSArray *)v45;

    uint64_t v47 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v48 = [v4 decodeObjectOfClasses:v47 forKey:@"appleMailMessageId"];
    appleMailMessageId = v5->_appleMailMessageId;
    v5->_appleMailMessageId = (NSString *)v48;
  }
  return v5;
}

- (unint64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)SGSimpleMailMessage;
  unint64_t v3 = [(SGSimpleMailMessage *)&v6 hash];
  NSUInteger v4 = [(NSString *)self->_messageId hash] - v3 + 32 * v3;
  return [(SGSimpleNamedEmailAddress *)self->_from hash] - v4 + 32 * v4;
}

- (BOOL)isEqualToSimpleMailMessage:(id)a3
{
  NSUInteger v4 = (id *)a3;
  v55.receiver = self;
  v55.super_class = (Class)SGSimpleMailMessage;
  if (![(SGMessage *)&v55 isEqualToMessage:v4]) {
    goto LABEL_38;
  }
  messageId = self->_messageId;
  objc_super v6 = (NSString *)v4[35];
  if (messageId == v6)
  {
  }
  else
  {
    uint64_t v7 = v6;
    id v8 = messageId;
    char v9 = [(NSString *)v8 isEqual:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_38;
    }
  }
  from = self->_from;
  uint64_t v11 = (SGSimpleNamedEmailAddress *)v4[29];
  if (from == v11)
  {
  }
  else
  {
    id v12 = v11;
    uint64_t v13 = from;
    char v14 = [(SGSimpleNamedEmailAddress *)v13 isEqual:v12];

    if ((v14 & 1) == 0) {
      goto LABEL_38;
    }
  }
  replyTo = self->_replyTo;
  uint64_t v16 = (SGSimpleNamedEmailAddress *)v4[30];
  if (replyTo == v16)
  {
  }
  else
  {
    uint64_t v17 = v16;
    id v18 = replyTo;
    char v19 = [(SGSimpleNamedEmailAddress *)v18 isEqual:v17];

    if ((v19 & 1) == 0) {
      goto LABEL_38;
    }
  }
  to = self->_to;
  uint64_t v21 = (NSArray *)v4[31];
  if (to == v21)
  {
  }
  else
  {
    uint64_t v22 = v21;
    double v23 = to;
    char v24 = [(NSArray *)v23 isEqual:v22];

    if ((v24 & 1) == 0) {
      goto LABEL_38;
    }
  }
  cc = self->_cc;
  uint64_t v26 = (NSArray *)v4[32];
  if (cc == v26)
  {
  }
  else
  {
    id v27 = v26;
    uint64_t v28 = cc;
    char v29 = [(NSArray *)v28 isEqual:v27];

    if ((v29 & 1) == 0) {
      goto LABEL_38;
    }
  }
  bcc = self->_bcc;
  uint64_t v31 = (NSArray *)v4[33];
  if (bcc == v31)
  {
  }
  else
  {
    id v32 = v31;
    uint64_t v33 = bcc;
    char v34 = [(NSArray *)v33 isEqual:v32];

    if ((v34 & 1) == 0) {
      goto LABEL_38;
    }
  }
  headers = self->_headers;
  long long v36 = (NSArray *)v4[40];
  if (headers == v36)
  {
  }
  else
  {
    id v37 = v36;
    uint64_t v38 = headers;
    char v39 = [(NSArray *)v38 isEqual:v37];

    if ((v39 & 1) == 0) {
      goto LABEL_38;
    }
  }
  mailingList = self->_mailingList;
  uint64_t v41 = (SGSimpleNamedEmailAddress *)v4[41];
  if (mailingList == v41)
  {
  }
  else
  {
    id v42 = v41;
    uint64_t v43 = mailingList;
    char v44 = [(SGSimpleNamedEmailAddress *)v43 isEqual:v42];

    if ((v44 & 1) == 0) {
      goto LABEL_38;
    }
  }
  if (self->_hasInhumanHeaders != *((unsigned __int8 *)v4 + 224)
    || self->_isPartiallyDownloaded != *((unsigned __int8 *)v4 + 225))
  {
    goto LABEL_38;
  }
  appleMailMessageId = self->_appleMailMessageId;
  uint64_t v46 = (NSString *)v4[36];
  if (appleMailMessageId == v46)
  {
  }
  else
  {
    uint64_t v47 = v46;
    uint64_t v48 = appleMailMessageId;
    char v49 = [(NSString *)v48 isEqual:v47];

    if ((v49 & 1) == 0)
    {
LABEL_38:
      char v50 = 0;
      goto LABEL_39;
    }
  }
  htmlContentData = self->_htmlContentData;
  if (htmlContentData)
  {
    uint64_t v53 = [v4 htmlContentData];
    char v50 = [(NSData *)htmlContentData isEqual:v53];
  }
  else
  {
    uint64_t v53 = [(SGSimpleMailMessage *)self htmlBody];
    v54 = [v4 htmlBody];
    char v50 = [v53 isEqual:v54];
  }
LABEL_39:

  return v50;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (SGSimpleMailMessage *)a3;
  objc_super v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGSimpleMailMessage *)self isEqualToSimpleMailMessage:v5];

  return v6;
}

- (id)uniqueIdentifier
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  messageId = self->_messageId;
  if (messageId)
  {
    unint64_t v3 = messageId;
  }
  else
  {
    memset(&c, 0, sizeof(c));
    uint64_t v5 = CC_SHA256_Init(&c);
    BOOL v6 = (void *)MEMORY[0x1CB79B230](v5);
    uint64_t v7 = [(SGSimpleNamedEmailAddress *)self->_from emailAddress];
    id v8 = [v7 dataUsingEncoding:4];

    if (v8)
    {
      id v9 = v8;
      CC_SHA256_Update(&c, (const void *)[v9 bytes], objc_msgSend(v9, "length"));
    }

    uint64_t v10 = (void *)MEMORY[0x1CB79B230]();
    uint64_t v11 = [(SGMessage *)self subject];
    id v12 = [v11 dataUsingEncoding:4];

    if (v12)
    {
      id v13 = v12;
      CC_SHA256_Update(&c, (const void *)[v13 bytes], objc_msgSend(v13, "length"));
    }

    char v14 = [(SGMessage *)self date];
    [v14 timeIntervalSinceReferenceDate];
    uint64_t v16 = (uint64_t)v15;

    *(_OWORD *)__str = 0u;
    long long v23 = 0u;
    snprintf(__str, 0x20uLL, "%llu", v16);
    CC_LONG v17 = strlen(__str);
    CC_SHA256_Update(&c, __str, v17);
    CC_SHA256_Final((unsigned __int8 *)__str, &c);
    unint64_t v3 = (NSString *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:64];
    for (uint64_t i = 0; i != 32; ++i)
    {
      char v19 = (void *)MEMORY[0x1CB79B230]();
      [(NSString *)v3 appendFormat:@"%02x", __str[i]];
    }
  }
  return v3;
}

- (id)author
{
  authorCached = self->_authorCached;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__SGSimpleMailMessage_author__block_invoke;
  v5[3] = &unk_1E65B7848;
  void v5[4] = self;
  unint64_t v3 = [(_PASCachedResult *)authorCached resultWithBlock:v5];
  return v3;
}

id __29__SGSimpleMailMessage_author__block_invoke(uint64_t a1)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) from];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F23810]);
    NSUInteger v4 = [*(id *)(a1 + 32) from];
    uint64_t v5 = [v4 name];
    BOOL v6 = +[SGNames cleanName:v5];
    uint64_t v7 = [*(id *)(a1 + 32) from];
    id v8 = [v7 emailAddress];
    v12[0] = v8;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    uint64_t v10 = (void *)[v3 initWithDisplayName:v6 handles:v9 handleIdentifier:*MEMORY[0x1E4F1ADC8]];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (int64_t)contentLength
{
  v9.receiver = self;
  v9.super_class = (Class)SGSimpleMailMessage;
  id v3 = [(SGMessage *)&v9 textContent];

  if (v3)
  {
    v8.receiver = self;
    v8.super_class = (Class)SGSimpleMailMessage;
    NSUInteger v4 = [(SGMessage *)&v8 textContent];
    int64_t v5 = [v4 length];
  }
  else
  {
    htmlContentData = self->_htmlContentData;
    if (htmlContentData) {
      return [htmlContentData length];
    }
    htmlContentData = self->_htmlBody;
    if (htmlContentData) {
      return [htmlContentData length];
    }
    else {
      return 0;
    }
  }
  return v5;
}

- (id)textContent
{
  v8.receiver = self;
  v8.super_class = (Class)SGSimpleMailMessage;
  id v3 = [(SGMessage *)&v8 textContent];

  if (v3)
  {
    v7.receiver = self;
    v7.super_class = (Class)SGSimpleMailMessage;
    NSUInteger v4 = [(SGMessage *)&v7 textContent];
  }
  else
  {
    int64_t v5 = [(SGSimpleMailMessage *)self htmlParser];
    NSUInteger v4 = [v5 textContent];
  }
  return v4;
}

- (id)dataDetectorMatchesWithSignature
{
  id v3 = [(SGSimpleMailMessage *)self textContent];
  NSUInteger v4 = [(SGSimpleMailMessage *)self htmlParser];
  int64_t v5 = [v4 quotedRegions];

  BOOL v6 = [(SGSimpleMailMessage *)self htmlParser];
  objc_super v7 = [v6 tabularRegions];

  objc_super v8 = [(SGMessage *)self date];
  objc_super v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E60]), "initWithIndexesInRange:", 0, objc_msgSend(v3, "length"));
  [v9 removeIndexes:v5];
  [v9 removeIndexes:v7];
  uint64_t v10 = +[SGDataDetectorMatch detectionsAndSignatureInText:v3 eligibleRegions:v9 baseDate:v8];
  if (v7)
  {
    uint64_t v11 = +[SGDataDetectorMatch detectionsInPlainText:v3 withEligibleRegions:v7 baseDate:v8];
    if ([v11 count])
    {
      id v12 = objc_msgSend(v11, "_pas_filteredArrayWithTest:", &__block_literal_global_205);

      if ([v12 count])
      {
        id v13 = [v10 matches];
        char v14 = (void *)[v13 mutableCopy];

        [v14 addObjectsFromArray:v12];
        double v15 = (void *)[v14 copy];
        [v10 setMatches:v15];
      }
    }
    else
    {
      id v12 = v11;
    }
  }
  return v10;
}

BOOL __55__SGSimpleMailMessage_dataDetectorMatchesWithSignature__block_invoke(uint64_t a1, void *a2)
{
  return [a2 matchType] == 7;
}

- (BOOL)hasHumanHeaders
{
  hasHumanHeadersCached = self->_hasHumanHeadersCached;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__SGSimpleMailMessage_hasHumanHeaders__block_invoke;
  v6[3] = &unk_1E65BB858;
  v6[4] = self;
  id v3 = [(_PASCachedResult *)hasHumanHeadersCached resultNonnullWithBlock:v6];
  char v4 = [v3 BOOLValue];

  return v4;
}

id __38__SGSimpleMailMessage_hasHumanHeaders__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) headers];
  id v2 = NSNumber;
  if (v1) {
    BOOL v3 = +[SGInhumans areHumanHeaders:v1];
  }
  else {
    BOOL v3 = 0;
  }
  char v4 = [v2 numberWithInt:v3];

  return v4;
}

- (BOOL)isInhumanContentNoncached
{
  uint64_t v13 = 0;
  char v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  BOOL v3 = [(SGSimpleMailMessage *)self textContent];
  if ([v3 length])
  {
    char v4 = (void *)MEMORY[0x1CB79B230]();
    int64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E60]), "initWithIndexesInRange:", 0, objc_msgSend(v3, "length"));
    BOOL v6 = [(SGSimpleMailMessage *)self htmlParser];
    objc_super v7 = [v6 quotedRegions];
    [v5 removeIndexes:v7];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __48__SGSimpleMailMessage_isInhumanContentNoncached__block_invoke;
    v10[3] = &unk_1E65B7820;
    id v12 = &v13;
    id v11 = v3;
    [v5 enumerateRangesUsingBlock:v10];
  }
  char v8 = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __48__SGSimpleMailMessage_isInhumanContentNoncached__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, BOOL *a4)
{
  char v8 = (void *)MEMORY[0x1CB79B230]();
  objc_super v9 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a2, a3);
  BOOL v10 = +[SGInhumans isInhumanBody:v9];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v10;
  *a4 = v10;
}

- (NSIndexSet)quotedRegions
{
  quotedRegionsCached = self->_quotedRegionsCached;
  if (!quotedRegionsCached)
  {
    objc_super v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"SGSimpleMailMessage.m", 325, @"Invalid parameter not satisfying: %@", @"_quotedRegionsCached" object file lineNumber description];

    quotedRegionsCached = self->_quotedRegionsCached;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __36__SGSimpleMailMessage_quotedRegions__block_invoke;
  v8[3] = &unk_1E65B77F8;
  v8[4] = self;
  char v4 = [(_PASCachedResult *)quotedRegionsCached resultNonnullWithBlock:v8];
  return (NSIndexSet *)v4;
}

id __36__SGSimpleMailMessage_quotedRegions__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) harvestMetrics];
  [v2 startTimer:kHarvestMetricsMessageQuotedRegions];

  BOOL v3 = [*(id *)(a1 + 32) htmlParser];
  char v4 = [v3 textContent];

  uint64_t v5 = [v4 length];
  BOOL v6 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_super v7 = [v6 messageId];
    char v8 = [v7 hasSuffix:@"@email.android.com>"];

    objc_super v9 = [*(id *)(a1 + 32) htmlParser];
    BOOL v10 = [v9 quotedRegions];

    id v11 = objc_opt_new();
    id v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E60]), "initWithIndexesInRange:", 0, objc_msgSend(v4, "length"));
    [v12 removeIndexes:v10];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __36__SGSimpleMailMessage_quotedRegions__block_invoke_2;
    v18[3] = &unk_1E65B77D0;
    id v19 = v4;
    char v21 = v8;
    id v13 = v11;
    id v20 = v13;
    [v12 enumerateRangesUsingBlock:v18];
    if (v10) {
      [v13 addIndexes:v10];
    }
    char v14 = (void *)[v13 copy];
    uint64_t v15 = [*(id *)(a1 + 32) harvestMetrics];
    objc_msgSend(v15, "endTimer:significantWork:", kHarvestMetricsMessageQuotedRegions, objc_msgSend(v14, "count") != 0);
  }
  else
  {
    char v16 = [v6 htmlParser];
    char v14 = [v16 quotedRegions];
  }
  return v14;
}

void __36__SGSimpleMailMessage_quotedRegions__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  char v8 = (void *)MEMORY[0x1CB79B230]();
  char v12 = 0;
  objc_super v9 = (void *)MEMORY[0x1CB79B230]();
  BOOL v10 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a2, a3);
  id v11 = +[SGMailQuoteParser quotedRegionsFrom:v10 isAOSPMail:*(unsigned __int8 *)(a1 + 48) foundToEndOfMessage:&v12];

  [v11 shiftIndexesStartingAtIndex:0 by:a2];
  [*(id *)(a1 + 40) addIndexes:v11];
  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 40), "addIndexesInRange:", a2 + a3, objc_msgSend(*(id *)(a1 + 32), "length") - (a2 + a3));
    *a4 = 1;
  }
}

- (void)setHtmlContentData:(id)a3
{
  id v4 = a3;
  [(SGSimpleMailMessage *)self _clearExistingHtml];
  uint64_t v5 = (void *)*MEMORY[0x1E4F93BF8];
  if (v4) {
    uint64_t v5 = v4;
  }
  BOOL v6 = v5;

  htmlContentData = self->_htmlContentData;
  self->_htmlContentData = v6;
  BOOL v10 = v6;

  char v8 = (HVHtmlParser *)[objc_alloc(MEMORY[0x1E4F93778]) initWithData:v10 encoding:4];
  htmlParser = self->_htmlParser;
  self->_htmlParser = v8;
}

- (NSData)htmlContentData
{
  htmlContentData = self->_htmlContentData;
  if (htmlContentData)
  {
    BOOL v3 = htmlContentData;
  }
  else
  {
    htmlContentDataCached = self->_htmlContentDataCached;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __38__SGSimpleMailMessage_htmlContentData__block_invoke;
    v6[3] = &unk_1E65B77A8;
    v6[4] = self;
    BOOL v3 = [(_PASCachedResult *)htmlContentDataCached resultNonnullWithBlock:v6];
  }
  return v3;
}

id __38__SGSimpleMailMessage_htmlContentData__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(*(void *)(a1 + 32) + 168) dataUsingEncoding:4];
  id v2 = v1;
  if (!v1) {
    uint64_t v1 = (void *)*MEMORY[0x1E4F93BF8];
  }
  id v3 = v1;

  return v3;
}

- (void)setHtmlBody:(id)a3
{
  id v4 = (__CFString *)a3;
  [(SGSimpleMailMessage *)self _clearExistingHtml];
  uint64_t v5 = &stru_1F24EEF20;
  if (v4) {
    uint64_t v5 = v4;
  }
  BOOL v6 = v5;

  htmlBody = self->_htmlBody;
  self->_htmlBody = v6;
  BOOL v10 = v6;

  char v8 = (HVHtmlParser *)[objc_alloc(MEMORY[0x1E4F93778]) initWithString:v10];
  htmlParser = self->_htmlParser;
  self->_htmlParser = v8;
}

- (NSString)htmlBody
{
  htmlBody = self->_htmlBody;
  if (htmlBody)
  {
    id v3 = htmlBody;
  }
  else
  {
    htmlBodyCached = self->_htmlBodyCached;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __31__SGSimpleMailMessage_htmlBody__block_invoke;
    v6[3] = &unk_1E65BB830;
    v6[4] = self;
    id v3 = [(_PASCachedResult *)htmlBodyCached resultNonnullWithBlock:v6];
  }
  return v3;
}

__CFString *__31__SGSimpleMailMessage_htmlBody__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 184);
  if (v1)
  {
    objc_msgSend(NSString, "_pas_stringWithDataNoCopy:encoding:nullTerminated:", v1, 4, 0);
    id v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v2 = &stru_1F24EEF20;
  }
  return v2;
}

- (void)_clearExistingHtml
{
  htmlBody = self->_htmlBody;
  self->_htmlBody = 0;

  id v4 = (_PASCachedResult *)objc_opt_new();
  htmlBodyCached = self->_htmlBodyCached;
  self->_htmlBodyCached = v4;

  htmlContentData = self->_htmlContentData;
  self->_htmlContentData = 0;

  self->_htmlContentDataCached = (_PASCachedResult *)objc_opt_new();
  MEMORY[0x1F41817F8]();
}

- (id)headersDictionary
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v4 = self->_headers;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v49 objects:v62 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v50 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        BOOL v10 = objc_msgSend(v9, "key", (void)v49);
        id v11 = [v3 objectForKeyedSubscript:v10];

        if (!v11)
        {
          id v11 = objc_opt_new();
          char v12 = [v9 key];
          [v3 setObject:v11 forKeyedSubscript:v12];
        }
        id v13 = [v9 value];
        [v11 addObject:v13];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v49 objects:v62 count:16];
    }
    while (v6);
  }

  if (self->_messageId)
  {
    char v14 = [v3 objectForKeyedSubscript:@"message-id"];

    if (!v14)
    {
      messageId = self->_messageId;
      uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&messageId count:1];
      [v3 setObject:v15 forKeyedSubscript:@"message-id"];
    }
  }
  uint64_t v16 = [(SGMessage *)self subject];
  if (v16)
  {
    CC_LONG v17 = (void *)v16;
    id v18 = [v3 objectForKeyedSubscript:@"subject"];

    if (!v18)
    {
      id v19 = [(SGMessage *)self subject];
      uint64_t v60 = v19;
      id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v60 count:1];
      [v3 setObject:v20 forKeyedSubscript:@"subject"];
    }
  }
  uint64_t v21 = [(SGMessage *)self date];
  if (v21)
  {
    uint64_t v22 = (void *)v21;
    long long v23 = [v3 objectForKeyedSubscript:@"date"];

    if (!v23)
    {
      uint64_t v24 = [(SGMessage *)self date];
      uint64_t v25 = objc_msgSend(v24, "sg_descriptionForMimeHeaders");
      id v59 = v25;
      uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v59 count:1];
      [v3 setObject:v26 forKeyedSubscript:@"date"];
    }
  }
  if (self->_from)
  {
    id v27 = [v3 objectForKeyedSubscript:@"from"];

    if (!v27)
    {
      uint64_t v28 = [(SGSimpleNamedEmailAddress *)self->_from serialized];
      uint64_t v58 = v28;
      char v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v58 count:1];
      [v3 setObject:v29 forKeyedSubscript:@"from"];
    }
  }
  if (self->_replyTo)
  {
    uint64_t v30 = [v3 objectForKeyedSubscript:@"reply-to"];

    if (!v30)
    {
      uint64_t v31 = [(SGSimpleNamedEmailAddress *)self->_replyTo serialized];
      uint64_t v57 = v31;
      id v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v57 count:1];
      [v3 setObject:v32 forKeyedSubscript:@"reply-to"];
    }
  }
  if ([(NSArray *)self->_to count])
  {
    uint64_t v33 = [v3 objectForKeyedSubscript:@"to"];

    if (!v33)
    {
      char v34 = [MEMORY[0x1E4F5DB38] serializeAll:self->_to];
      uint64_t v35 = objc_msgSend(v34, "_pas_componentsJoinedByString:", @", ");
      uint64_t v56 = v35;
      long long v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v56 count:1];
      [v3 setObject:v36 forKeyedSubscript:@"to"];
    }
  }
  if ([(NSArray *)self->_cc count])
  {
    id v37 = [v3 objectForKeyedSubscript:@"cc"];

    if (!v37)
    {
      uint64_t v38 = [MEMORY[0x1E4F5DB38] serializeAll:self->_cc];
      char v39 = objc_msgSend(v38, "_pas_componentsJoinedByString:", @", ");
      objc_super v55 = v39;
      uint64_t v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v55 count:1];
      [v3 setObject:v40 forKeyedSubscript:@"cc"];
    }
  }
  if ([(NSArray *)self->_bcc count])
  {
    uint64_t v41 = [v3 objectForKeyedSubscript:@"bcc"];

    if (!v41)
    {
      id v42 = [MEMORY[0x1E4F5DB38] serializeAll:self->_bcc];
      uint64_t v43 = objc_msgSend(v42, "_pas_componentsJoinedByString:", @", ");
      v54 = v43;
      char v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v54 count:1];
      [v3 setObject:v44 forKeyedSubscript:@"bcc"];
    }
  }
  if (self->_mailingList)
  {
    uint64_t v45 = [v3 objectForKeyedSubscript:@"list-id"];

    if (!v45)
    {
      uint64_t v46 = [(SGSimpleNamedEmailAddress *)self->_mailingList serialized];
      uint64_t v53 = v46;
      uint64_t v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v53 count:1];
      [v3 setObject:v47 forKeyedSubscript:@"list-id"];
    }
  }
  return v3;
}

- (id)asDictionary
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (asDictionary_onceToken != -1) {
    dispatch_once(&asDictionary_onceToken, &__block_literal_global_11392);
  }
  id v3 = [MEMORY[0x1E4F1CA60] dictionaryWithSharedKeySet:asDictionary_sharedKeySet];
  v34.receiver = self;
  v34.super_class = (Class)SGSimpleMailMessage;
  id v4 = [(SGMessage *)&v34 asDictionary];
  [v3 addEntriesFromDictionary:v4];

  uint64_t v5 = [(SGSimpleMailMessage *)self htmlBody];
  [v3 setObject:v5 forKeyedSubscript:@"htmlBody"];

  messageId = self->_messageId;
  if (messageId) {
    [v3 setObject:messageId forKeyedSubscript:@"messageId"];
  }
  inReplyTo = self->_inReplyTo;
  if (inReplyTo) {
    [v3 setObject:inReplyTo forKeyedSubscript:@"inReplyTo"];
  }
  from = self->_from;
  if (from)
  {
    objc_super v9 = [(SGSimpleNamedEmailAddress *)from serialized];
    [v3 setObject:v9 forKeyedSubscript:@"from"];
  }
  replyTo = self->_replyTo;
  if (replyTo)
  {
    id v11 = [(SGSimpleNamedEmailAddress *)replyTo serialized];
    [v3 setObject:v11 forKeyedSubscript:@"replyTo"];
  }
  if (self->_to)
  {
    char v12 = objc_msgSend(MEMORY[0x1E4F5DB38], "serializeAll:");
    [v3 setObject:v12 forKeyedSubscript:@"to"];
  }
  if (self->_cc)
  {
    id v13 = objc_msgSend(MEMORY[0x1E4F5DB38], "serializeAll:");
    [v3 setObject:v13 forKeyedSubscript:@"cc"];
  }
  if (self->_bcc)
  {
    char v14 = objc_msgSend(MEMORY[0x1E4F5DB38], "serializeAll:");
    [v3 setObject:v14 forKeyedSubscript:@"bcc"];
  }
  if (self->_hasInhumanHeaders)
  {
    uint64_t v15 = [NSNumber numberWithBool:1];
    [v3 setObject:v15 forKeyedSubscript:@"hasInhumanHeaders"];
  }
  if (self->_isPartiallyDownloaded)
  {
    uint64_t v16 = [NSNumber numberWithBool:1];
    [v3 setObject:v16 forKeyedSubscript:@"isPartiallyDownloaded"];
  }
  mailingList = self->_mailingList;
  if (mailingList)
  {
    id v18 = [(SGSimpleNamedEmailAddress *)mailingList serialized];
    [v3 setObject:v18 forKeyedSubscript:@"mailingList"];
  }
  id v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_headers, "count"));
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v20 = self->_headers;
  uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v31 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v26 = objc_msgSend(v25, "key", (void)v30);
        v35[0] = v26;
        id v27 = [v25 value];
        v35[1] = v27;
        uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
        [v19 addObject:v28];
      }
      uint64_t v22 = [(NSArray *)v20 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v22);
  }

  [v3 setObject:v19 forKeyedSubscript:@"headers"];
  return v3;
}

uint64_t __35__SGSimpleMailMessage_asDictionary__block_invoke()
{
  asDictionary_sharedKeySet = [MEMORY[0x1E4F1C9E8] sharedKeySetForKeys:&unk_1F2536890];
  return MEMORY[0x1F41817F8]();
}

- (SGSimpleMailMessage)initWithMessageDictionary:(id)a3
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v70.receiver = self;
  v70.super_class = (Class)SGSimpleMailMessage;
  uint64_t v5 = [(SGMessage *)&v70 initWithMessageDictionary:v4];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"htmlBody"];

    if (v6)
    {
      uint64_t v7 = [v4 objectForKeyedSubscript:@"htmlBody"];
      char v8 = (void *)[v7 copy];
      [(SGSimpleMailMessage *)v5 setHtmlBody:v8];
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"messageId"];
    uint64_t v10 = [v9 copy];
    messageId = v5->_messageId;
    v5->_messageId = (NSString *)v10;

    char v12 = [v4 objectForKeyedSubscript:@"inReplyTo"];
    uint64_t v13 = [v12 copy];
    inReplyTo = v5->_inReplyTo;
    v5->_inReplyTo = (NSString *)v13;

    uint64_t v15 = [v4 objectForKeyedSubscript:@"appleMailMessageId"];
    uint64_t v16 = [v15 copy];
    appleMailMessageId = v5->_appleMailMessageId;
    v5->_appleMailMessageId = (NSString *)v16;

    id v18 = (void *)MEMORY[0x1E4F5DB38];
    id v19 = [v4 objectForKeyedSubscript:@"from"];
    id v20 = [v18 namedEmailAddressWithFieldValue:v19];
    uint64_t v21 = [v20 copy];
    from = v5->_from;
    v5->_from = (SGSimpleNamedEmailAddress *)v21;

    uint64_t v23 = (void *)MEMORY[0x1E4F5DB38];
    uint64_t v24 = [v4 objectForKeyedSubscript:@"forwardedBy"];
    uint64_t v25 = [v23 namedEmailAddressWithFieldValue:v24];
    uint64_t v26 = [v25 copy];
    forwardedBy = v5->_forwardedBy;
    v5->_forwardedBy = (SGSimpleNamedEmailAddress *)v26;

    uint64_t v28 = (void *)MEMORY[0x1E4F5DB38];
    char v29 = [v4 objectForKeyedSubscript:@"replyTo"];
    long long v30 = [v28 namedEmailAddressWithFieldValue:v29];
    uint64_t v31 = [v30 copy];
    replyTo = v5->_replyTo;
    v5->_replyTo = (SGSimpleNamedEmailAddress *)v31;

    long long v33 = (void *)MEMORY[0x1E4F5DB38];
    objc_super v34 = [v4 objectForKeyedSubscript:@"to"];
    uint64_t v35 = [v33 namedEmailAddressesWithFieldValues:v34];
    to = v5->_to;
    v5->_to = (NSArray *)v35;

    uint64_t v37 = (void *)MEMORY[0x1E4F5DB38];
    uint64_t v38 = [v4 objectForKeyedSubscript:@"cc"];
    uint64_t v39 = [v37 namedEmailAddressesWithFieldValues:v38];
    cCC_SHA256_CTX c = v5->_cc;
    v5->_cCC_SHA256_CTX c = (NSArray *)v39;

    uint64_t v41 = (void *)MEMORY[0x1E4F5DB38];
    id v42 = [v4 objectForKeyedSubscript:@"bcc"];
    uint64_t v43 = [v41 namedEmailAddressesWithFieldValues:v42];
    bcCC_SHA256_CTX c = v5->_bcc;
    v5->_bcCC_SHA256_CTX c = (NSArray *)v43;

    uint64_t v45 = [v4 objectForKeyedSubscript:@"hasInhumanHeaders"];
    v5->_hasInhumanHeaders = [v45 BOOLValue];

    uint64_t v46 = [v4 objectForKeyedSubscript:@"isPartiallyDownloaded"];
    v5->_isPartiallyDownloaded = [v46 BOOLValue];

    uint64_t v47 = (void *)MEMORY[0x1E4F5DB38];
    uint64_t v48 = [v4 objectForKeyedSubscript:@"mailingList"];
    uint64_t v49 = [v47 namedEmailAddressWithFieldValue:v48];
    mailingList = v5->_mailingList;
    v5->_mailingList = (SGSimpleNamedEmailAddress *)v49;

    id v65 = v4;
    long long v51 = [v4 objectForKeyedSubscript:@"headers"];
    long long v52 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v51, "count"));
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id v53 = v51;
    uint64_t v54 = [v53 countByEnumeratingWithState:&v66 objects:v71 count:16];
    if (v54)
    {
      uint64_t v55 = v54;
      uint64_t v56 = *(void *)v67;
      do
      {
        uint64_t v57 = 0;
        do
        {
          if (*(void *)v67 != v56) {
            objc_enumerationMutation(v53);
          }
          uint64_t v58 = *(void **)(*((void *)&v66 + 1) + 8 * v57);
          id v59 = [SGSimpleMailHeaderKeyValue alloc];
          uint64_t v60 = [v58 objectAtIndexedSubscript:0];
          uint64_t v61 = [v58 objectAtIndexedSubscript:1];
          uint64_t v62 = [(SGSimpleMailHeaderKeyValue *)v59 initWithKey:v60 value:v61];
          [(NSArray *)v52 addObject:v62];

          ++v57;
        }
        while (v55 != v57);
        uint64_t v55 = [v53 countByEnumeratingWithState:&v66 objects:v71 count:16];
      }
      while (v55);
    }

    headers = v5->_headers;
    v5->_headers = v52;

    id v4 = v65;
  }

  return v5;
}

- (id)initForBuilding
{
  v11.receiver = self;
  v11.super_class = (Class)SGSimpleMailMessage;
  id v2 = [(SGMessage *)&v11 initForBuilding];
  id v3 = v2;
  if (v2)
  {
    [v2 _clearExistingHtml];
    uint64_t v4 = objc_opt_new();
    uint64_t v5 = (void *)v3[25];
    v3[25] = v4;

    uint64_t v6 = objc_opt_new();
    uint64_t v7 = (void *)v3[26];
    v3[26] = v6;

    uint64_t v8 = objc_opt_new();
    objc_super v9 = (void *)v3[27];
    v3[27] = v8;
  }
  return v3;
}

+ (id)subjectByCleaningPrefixesInSubject:(id)a3
{
  id v3 = a3;
  unint64_t v4 = 0;
  if ([v3 length])
  {
    while (1)
    {
      uint64_t v5 = objc_msgSend(v3, "rangeOfString:options:range:", @":", 0, v4, objc_msgSend(v3, "length") - v4);
      if (v5 == 0x7FFFFFFFFFFFFFFFLL || v5 - v4 > 6) {
        break;
      }
      uint64_t v7 = v5;
      uint64_t v8 = (void *)MEMORY[0x1CB79B230]();
      unint64_t v4 = v7 + 1;
      if (v7 + 1 < (unint64_t)[v3 length])
      {
        if (subjectByCleaningPrefixesInSubject___pasOnceToken9 != -1) {
          dispatch_once(&subjectByCleaningPrefixesInSubject___pasOnceToken9, &__block_literal_global_285);
        }
        id v9 = (id)subjectByCleaningPrefixesInSubject___pasExprOnceResult;
        unint64_t v4 = objc_msgSend(v3, "rangeOfCharacterFromSet:options:range:", v9, 0, v7 + 1, objc_msgSend(v3, "length") + ~v7);

        if (v4 == 0x7FFFFFFFFFFFFFFFLL)
        {
          unint64_t v4 = [v3 length];
          break;
        }
      }
    }
  }
  if ([v3 length] <= v4)
  {
    objc_super v11 = &stru_1F24EEF20;
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1CB79B230]();
    objc_super v11 = [v3 substringFromIndex:v4];
  }

  return v11;
}

void __58__SGSimpleMailMessage_subjectByCleaningPrefixesInSubject___block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v1 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  uint64_t v2 = [v1 invertedSet];
  id v3 = (void *)subjectByCleaningPrefixesInSubject___pasExprOnceResult;
  subjectByCleaningPrefixesInSubject___pasExprOnceResult = v2;
}

+ (BOOL)headersContainInhumanOnes:(id)a3 keys:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    while (2)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_super v11 = *(void **)(*((void *)&v23 + 1) + 8 * v10);
        char v12 = (void *)MEMORY[0x1CB79B230](v7);
        uint64_t v13 = objc_msgSend(v11, "lowercaseString", (void)v23);
        if (isInhumanHeader(v13) || ([v13 isEqual:@"list-unsubscribe"] & 1) != 0)
        {

          char v17 = 1;
          goto LABEL_20;
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
      uint64_t v8 = v7;
      if (v7) {
        continue;
      }
      break;
    }
  }

  char v14 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v15 = objc_msgSend(v5, "hv_firstHeaderForKey:", @"precedence");
  uint64_t v16 = v15;
  if (v15 && ([v15 isEqualToString:@"bulk"] & 1) != 0)
  {
    char v17 = 1;
  }
  else
  {
    id v18 = objc_msgSend(v5, "hv_firstHeaderForKey:", @"auto-submitted", (void)v23);
    id v19 = v18;
    if (v18 && ![v18 isEqualToString:@"no"])
    {
      char v17 = 1;
    }
    else
    {
      id v20 = objc_msgSend(v5, "hv_firstHeaderForKey:", @"x-email-type-id");
      uint64_t v21 = [v20 lowercaseString];

      char v17 = [v21 hasPrefix:@"pp"];
    }
  }
LABEL_20:

  return v17;
}

+ (BOOL)headerDictionaryContainsInhumanHeaders:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v33;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v33 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v9 = (void *)MEMORY[0x1CB79B230]();
        uint64_t v10 = [v8 lowercaseString];
        if (isInhumanHeader(v10) || ([v10 isEqual:@"list-unsubscribe"] & 1) != 0)
        {

          BOOL v26 = 1;
          id v17 = v3;
          goto LABEL_23;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v32 objects:v37 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  objc_super v11 = [v3 objectForKeyedSubscript:@"precedence"];
  char v12 = [v11 containsObject:@"bulk"];

  if (v12) {
    goto LABEL_24;
  }
  uint64_t v13 = [v3 objectForKeyedSubscript:@"auto-submitted"];
  if (!v13) {
    goto LABEL_13;
  }
  char v14 = (void *)v13;
  uint64_t v15 = [v3 objectForKeyedSubscript:@"auto-submitted"];
  int v16 = [v15 containsObject:@"no"];

  if (!v16)
  {
LABEL_24:
    BOOL v26 = 1;
  }
  else
  {
LABEL_13:
    [v3 objectForKeyedSubscript:@"x-email-type-id"];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = [v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v29;
      while (2)
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v29 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void **)(*((void *)&v28 + 1) + 8 * v21);
          long long v23 = (void *)MEMORY[0x1CB79B230](v18);
          long long v24 = objc_msgSend(v22, "lowercaseString", (void)v28);
          char v25 = [v24 hasPrefix:@"pp"];

          if (v25)
          {
            BOOL v26 = 1;
            goto LABEL_27;
          }
          ++v21;
        }
        while (v19 != v21);
        uint64_t v18 = [v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
        uint64_t v19 = v18;
        if (v18) {
          continue;
        }
        break;
      }
    }
    BOOL v26 = 0;
LABEL_27:

LABEL_23:
  }

  return v26;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)removeBrackets:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 rangeOfString:@">"];
  uint64_t v5 = v3;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = v4;
    uint64_t v7 = objc_msgSend(v3, "rangeOfString:options:range:", @"<", 4, 0, v4);
    uint64_t v5 = v3;
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v5 = objc_msgSend(v3, "substringWithRange:", v7 + 1, v6 - (v7 + 1));
    }
  }

  return v5;
}

- (NSString)messageIdWithoutBrackets
{
  id v3 = [(SGSimpleMailMessage *)self messageId];
  uint64_t v4 = [(SGSimpleMailMessage *)self removeBrackets:v3];

  return (NSString *)v4;
}

@end