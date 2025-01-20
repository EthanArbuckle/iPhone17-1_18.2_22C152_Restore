@interface MFComposeTypeFactory
+ (BOOL)alwaysBCCSelf;
+ (id)_markupForInlineAttachment:(id)a3 willBeIncluded:(BOOL)a4 prependBlankLine:(BOOL)a5 delegate:(id)a6;
+ (id)_markupStringForExcludedInlineAttachmentWithFilename:(id)a3;
+ (id)bccSelfAddressForDelegate:(id)a3;
+ (id)headersFromDelegate:(id)a3;
+ (id)headersFromDelegate:(id)a3 originatingBundleID:(id)a4 sourceAccountManagement:(int)a5;
+ (id)messageFromDelegate:(id)a3 originatingBundleID:(id)a4 sourceAccountManagement:(int)a5;
+ (id)messageFromDelegate:(id)a3 withSubstituteDOMDocument:(id)a4 compositionSpecification:(id)a5 originatingBundleID:(id)a6 sourceAccountManagement:(int)a7 writeAttachmentPlaceholders:(BOOL)a8;
+ (id)signpostLog;
+ (id)subjectFromSubject:(id)a3 withComposeType:(int64_t)a4;
+ (unint64_t)imageScaleFromUserDefaults;
+ (void)_mergeModel:(id)a3 withDelegate:(id)a4;
+ (void)_prependQuotedMarkup:(id)a3 shouldIndent:(BOOL)a4 toBodyField:(id)a5;
+ (void)_quoteFromModel:(id)a3 delegate:(id)a4;
+ (void)_sanitizeRecipientsForComposeType:(unint64_t)a3 sendingAddress:(id)a4 delegate:(id)a5;
+ (void)_setContent:(id)a3 includeAttachments:(BOOL)a4 shouldQuote:(BOOL)a5 prependBlankLine:(BOOL)a6 delegate:(id)a7 signpostID:(unint64_t)a8;
+ (void)_setContent:(id)a3 includeAttachments:(BOOL)a4 shouldQuote:(BOOL)a5 prependBlankLine:(BOOL)a6 delegate:(id)a7 storeOriginalAttachments:(BOOL)a8 signpostID:(unint64_t)a9;
+ (void)_setupForForwardWithModel:(id)a3 delegate:(id)a4;
+ (void)_setupForNewMessageWithModel:(id)a3 delegate:(id)a4;
+ (void)_setupForReplyAllWithModel:(id)a3 delegate:(id)a4;
+ (void)_setupForReplyWithModel:(id)a3 delegate:(id)a4;
+ (void)_updateDelegate:(id)a3 toRecipients:(id)a4 ccRecipients:(id)a5 bccRecipients:(id)a6;
+ (void)addAttachment:(id)a3 prepend:(BOOL)a4 withCompositionModel:(id)a5 delegate:(id)a6;
+ (void)hijackThreadFromDelegate:(id)a3;
+ (void)setupSwitchToReplyAllWithModel:(id)a3 delegate:(id)a4;
+ (void)setupSwitchToReplyWithModel:(id)a3 delegate:(id)a4;
+ (void)setupWithCompositionModel:(id)a3 delegate:(id)a4;
+ (void)setupWithContent:(id)a3 delegate:(id)a4 signpostID:(unint64_t)a5;
- (unint64_t)signpostID;
@end

@implementation MFComposeTypeFactory

+ (id)signpostLog
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__MFComposeTypeFactory_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken != -1) {
    dispatch_once(&signpostLog_onceToken, block);
  }
  v2 = (void *)signpostLog_log;

  return v2;
}

void __35__MFComposeTypeFactory_signpostLog__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email.signposts", (const char *)[v3 UTF8String]);
  v2 = (void *)signpostLog_log;
  signpostLog_log = (uint64_t)v1;
}

- (unint64_t)signpostID
{
  id v3 = [(id)objc_opt_class() signpostLog];
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

+ (void)_prependQuotedMarkup:(id)a3 shouldIndent:(BOOL)a4 toBodyField:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  v7 = [a3 stringByAppendingString:@"<BR>"];
  [v8 prependMarkupString:v7 quote:v5];
}

+ (id)_markupStringForExcludedInlineAttachmentWithFilename:(id)a3
{
  id v3 = NSString;
  os_signpost_id_t v4 = [NSString stringWithFormat:@"<%@>", a3];
  BOOL v5 = objc_msgSend(v4, "ef_stringByEscapingForXML");
  v6 = [v3 stringWithFormat:@"<DIV>%@</DIV>", v5];

  return v6;
}

+ (id)_markupForInlineAttachment:(id)a3 willBeIncluded:(BOOL)a4 prependBlankLine:(BOOL)a5 delegate:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  if (v8)
  {
    uint64_t v12 = [a1 imageScaleFromUserDefaults];
    v13 = [v11 composeWebView];
    objc_msgSend(v10, "markupStringForCompositionWithPrependedBlankLine:imageScale:useAttachmentElement:", v7, v12, objc_msgSend(v13, "allowsAttachmentElements"));
  }
  else
  {
    v13 = [v10 fileName];
    [a1 _markupStringForExcludedInlineAttachmentWithFilename:v13];
  v14 = };

  return v14;
}

+ (void)_setContent:(id)a3 includeAttachments:(BOOL)a4 shouldQuote:(BOOL)a5 prependBlankLine:(BOOL)a6 delegate:(id)a7 signpostID:(unint64_t)a8
{
}

+ (void)_setContent:(id)a3 includeAttachments:(BOOL)a4 shouldQuote:(BOOL)a5 prependBlankLine:(BOOL)a6 delegate:(id)a7 storeOriginalAttachments:(BOOL)a8 signpostID:(unint64_t)a9
{
  BOOL v83 = a8;
  BOOL v69 = a6;
  BOOL v70 = a4;
  BOOL v73 = a5;
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  id v68 = a3;
  id v85 = a7;
  id v10 = MFMessageComposeLoadingSignpostLog();
  id v11 = v10;
  if (a9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AF945000, v11, OS_SIGNPOST_INTERVAL_BEGIN, a9, "LOAD COMPOSE WEB CONTENT", "Start loading web content enableTelemetry=YES ", buf, 2u);
  }

  v77 = [v85 composeWebView];
  id v89 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v82 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v81 = objc_opt_new();
  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  obuint64_t j = v68;
  uint64_t v76 = [obj countByEnumeratingWithState:&v105 objects:v118 count:16];
  if (v76)
  {
    v79 = 0;
    int v88 = v70 || v83;
    uint64_t v75 = *(void *)v106;
    while (1)
    {
      for (uint64_t i = 0; i != v76; ++i)
      {
        if (*(void *)v106 != v75) {
          objc_enumerationMutation(obj);
        }
        v80 = *(void **)(*((void *)&v105 + 1) + 8 * i);

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v12 = [v80 htmlData];
          if (v12)
          {
            v13 = [v80 preferredCharacterSet];
            MFEncodingForCharset();
            v79 = (void *)MFCreateStringWithData();
          }
          else
          {
            v79 = 0;
          }
          v24 = [v80 attachmentsInDocument];
          v74 = (void *)v12;
          BOOL v25 = [v24 count] == 0;

          if (!v25)
          {
            long long v103 = 0u;
            long long v104 = 0u;
            long long v101 = 0u;
            long long v102 = 0u;
            id v86 = [v80 attachmentsInDocument];
            uint64_t v26 = [v86 countByEnumeratingWithState:&v101 objects:v117 count:16];
            if (!v26) {
              goto LABEL_36;
            }
            uint64_t v90 = *(void *)v102;
            while (1)
            {
              for (uint64_t j = 0; j != v26; ++j)
              {
                if (*(void *)v102 != v90) {
                  objc_enumerationMutation(v86);
                }
                v28 = *(void **)(*((void *)&v101 + 1) + 8 * j);
                v29 = [v28 fileWrapperForcingDownload:0];
                v30 = [v29 preferredFilename];
                v31 = [v28 mimePart];
                v32 = [v31 contentID];

                if (v32)
                {
                  [v89 setObject:v30 forKeyedSubscript:v32];
                  if (!v88) {
                    goto LABEL_34;
                  }
                  v33 = [v29 contentID];
                  v34 = [v29 mimeType];
                  v35 = [v85 composeWebView];
                  v36 = [v35 compositionContextID];

                  v37 = [v29 regularFileContents];
                  if (v83)
                  {
                    [v82 addObject:v29];
                  }
                  else
                  {
                    v39 = +[MFAttachmentMarkup attachmentMarkupWithProperties:v37 contentID:v33 mimeType:v34 filename:v30 contextID:v36];
                    [v81 addObject:v39];
                  }
                }
                else
                {
                  v33 = MFComposeLog();
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                  {
                    v38 = [MEMORY[0x1E4F60E00] partiallyRedactedStringForString:v30];
                    +[MFComposeTypeFactory _setContent:includeAttachments:shouldQuote:prependBlankLine:delegate:storeOriginalAttachments:signpostID:](v38, v115, &v116, v33);
                  }
                }

LABEL_34:
              }
              uint64_t v26 = [v86 countByEnumeratingWithState:&v101 objects:v117 count:16];
              if (!v26)
              {
LABEL_36:

                break;
              }
            }
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v14 = v80;
            v15 = [v14 fileWrapperForcingDownload:0];
            v16 = [v15 contentID];
            v17 = [v15 preferredFilename];
            v18 = [v15 mimeType];
            v19 = [v85 composeWebView];
            v20 = [v19 compositionContextID];

            v21 = [v15 regularFileContents];
            if (v88)
            {
              if (v83)
              {
                [v82 addObject:v15];
                v22 = a1;
                goto LABEL_42;
              }
              v40 = [MEMORY[0x1E4F77B78] defaultManager];
              v41 = [v40 attachmentForData:v21 mimeType:v18 fileName:v17 contentID:v16 context:v20];

              v79 = [a1 _markupForInlineAttachment:v41 willBeIncluded:v70 prependBlankLine:v69 delegate:v85];
            }
            else
            {
              v22 = objc_opt_class();
LABEL_42:
              v79 = [v22 _markupStringForExcludedInlineAttachmentWithFilename:v17];
            }

            goto LABEL_45;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v23 = [a1 _markupForInlineAttachment:v80 willBeIncluded:v70 prependBlankLine:v69 delegate:v85];
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_47;
            }
            id v23 = v80;
          }
          v79 = v23;
        }
LABEL_45:
        if (v79)
        {
          v42 = [[NSString alloc] initWithFormat:@"<div>%@</div>", @"<BR class=\"webkit-block-placeholder\">"];
          v100[0] = MEMORY[0x1E4F143A8];
          v100[1] = 3221225472;
          v100[2] = __129__MFComposeTypeFactory__setContent_includeAttachments_shouldQuote_prependBlankLine_delegate_storeOriginalAttachments_signpostID___block_invoke;
          v100[3] = &__block_descriptor_40_e5_v8__0l;
          v100[4] = a9;
          [v77 appendOrReplace:v42 withMarkupString:v79 quote:v73 completion:v100];
          goto LABEL_53;
        }
LABEL_47:
        v43 = MFMessageComposeLoadingSignpostLog();
        v44 = v43;
        if (a9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1AF945000, v44, OS_SIGNPOST_INTERVAL_END, a9, "LOAD COMPOSE WEB CONTENT", "Unable to create markup string enableTelemetry=YES ", buf, 2u);
        }

        v42 = EMLogCompose();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          v45 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v112 = v80;
          __int16 v113 = 2114;
          v114 = v45;
          id v46 = v45;
          _os_log_impl(&dword_1AF945000, v42, OS_LOG_TYPE_DEFAULT, "No markup string found for content item: %{public}@ - %{public}@", buf, 0x16u);
        }
        v79 = 0;
LABEL_53:
      }
      uint64_t v76 = [obj countByEnumeratingWithState:&v105 objects:v118 count:16];
      if (!v76) {
        goto LABEL_57;
      }
    }
  }
  v79 = 0;
LABEL_57:

  id v87 = (id)objc_opt_new();
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  id v84 = v81;
  uint64_t v47 = [v84 countByEnumeratingWithState:&v96 objects:v110 count:16];
  if (v47)
  {
    uint64_t v91 = *(void *)v97;
    do
    {
      for (uint64_t k = 0; k != v47; ++k)
      {
        if (*(void *)v97 != v91) {
          objc_enumerationMutation(v84);
        }
        v49 = *(void **)(*((void *)&v96 + 1) + 8 * k);
        v50 = [MEMORY[0x1E4F77B78] defaultManager];
        v51 = [v49 attachmentData];
        v52 = [v49 mimeType];
        v53 = [v49 filename];
        v54 = [v49 contentID];
        v55 = [v49 contextID];
        v56 = [v50 attachmentForData:v51 mimeType:v52 fileName:v53 contentID:v54 context:v55];

        v57 = [v56 className];
        if (([v57 isEqualToString:0x1F0817B60] & 1) != 0
          || [v57 isEqualToString:0x1F0817BA0])
        {
          [v87 addObject:v49];
        }
        else
        {
          v58 = [v49 contentID];
          [v89 removeObjectForKey:v58];
        }
      }
      uint64_t v47 = [v84 countByEnumeratingWithState:&v96 objects:v110 count:16];
    }
    while (v47);
  }

  [v77 setOriginalAttachmentInfo:v82];
  [v77 setReplacementFilenamesByContentID:v89];
  [v77 replaceImagesIfNecessary];
  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  id v59 = v87;
  uint64_t v60 = [v59 countByEnumeratingWithState:&v92 objects:v109 count:16];
  if (v60)
  {
    uint64_t v61 = *(void *)v93;
    do
    {
      for (uint64_t m = 0; m != v60; ++m)
      {
        if (*(void *)v93 != v61) {
          objc_enumerationMutation(v59);
        }
        v63 = *(void **)(*((void *)&v92 + 1) + 8 * m);
        v64 = [v63 attachmentData];
        v65 = [v63 filename];
        v66 = [v63 mimeType];
        v67 = [v63 contentID];
        [v77 replaceFilenamePlaceholderWithAttachment:v64 fileName:v65 mimeType:v66 contentID:v67];
      }
      uint64_t v60 = [v59 countByEnumeratingWithState:&v92 objects:v109 count:16];
    }
    while (v60);
  }
}

void __129__MFComposeTypeFactory__setContent_includeAttachments_shouldQuote_prependBlankLine_delegate_storeOriginalAttachments_signpostID___block_invoke(uint64_t a1)
{
  v2 = MFMessageComposeLoadingSignpostLog();
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AF945000, v3, OS_SIGNPOST_INTERVAL_END, v4, "LOAD COMPOSE WEB CONTENT", "Finished loading web content enableTelemetry=YES ", v5, 2u);
  }
}

+ (void)_quoteFromModel:(id)a3 delegate:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v50 = [v5 legacyMessage];
  uint64_t v7 = [v5 composeType];
  BOOL v8 = [v5 composeType] == 4 || objc_msgSend(v5, "composeType") == 5;
  v9 = [v6 savedHeaders];
  uint64_t v10 = *MEMORY[0x1E4F606B0];
  id v11 = [v9 headersForKey:*MEMORY[0x1E4F606B0]];

  if (v11)
  {
    BOOL v45 = 1;
  }
  else
  {
    uint64_t v12 = [MEMORY[0x1E4F77C50] sharedInstance];
    v13 = [v6 sendingEmailAddress];
    id v14 = [v12 signatureMarkupForSendingEmailAddress:v13];
    BOOL v45 = [v14 length] == 0;
  }
  v51 = [v5 originalContent];
  v48 = [v50 messageBodyIfAvailable];
  unsigned int v44 = [v48 isEncrypted];
  if (!v51)
  {
    v51 = [v48 htmlContent];
  }
  v15 = MFComposeLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = objc_msgSend(v50, "ef_publicDescription");
    *(_DWORD *)buf = 138543362;
    v54 = v16;
    _os_log_impl(&dword_1AF945000, v15, OS_LOG_TYPE_DEFAULT, "Quoting content from message: %{public}@", buf, 0xCu);
  }
  v49 = [v6 composeWebView];
  if (v51)
  {
    uint64_t v17 = [v5 includeAttachments];
    v18 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
    v19 = [v18 objectForKey:@"DisableQuoteIncrease"];
    int v20 = [v19 BOOLValue];

    if (v8) {
      uint64_t v21 = [v5 includeAttachmentsWhenAdding];
    }
    else {
      uint64_t v21 = 0;
    }
    uint64_t v22 = v20 ^ 1u;
    objc_msgSend(a1, "_setContent:includeAttachments:shouldQuote:prependBlankLine:delegate:storeOriginalAttachments:signpostID:", v51, v17, v22, 0, v6, v21, objc_msgSend(v5, "signpostID"));
    [v49 addMailAttributesBeforeDisplayHidingTrailingEmptyQuotes:0 shouldQuote:v22];
    if (v7 == 6)
    {
      id v23 = [v50 headersIfAvailable];
      v24 = [v23 markupString];
      [a1 _prependQuotedMarkup:v24 shouldIndent:v20 ^ 1u toBodyField:v49];

      BOOL v25 = [MEMORY[0x1E4F77BD8] forwardedMessagePrefixWithSpacer:v45];
      [v49 prependPreamble:v25 quote:0];
    }
    else
    {
      uint64_t v26 = [v50 senders];
      id v23 = objc_msgSend(v26, "ef_map:", &__block_literal_global_13);

      if ([v23 count])
      {
        if ([v23 count] == 1)
        {
          v27 = [v50 headers];
          v28 = [v27 headersForKey:v10];
          v29 = [v28 firstObject];

          if (v29)
          {
            uint64_t v47 = [MEMORY[0x1E4F608F8] tagValueListFromString:v29 error:0];
            v30 = [v47 objectForKeyedSubscript:*MEMORY[0x1E4F5FD10]];
            if (v30)
            {
              id v43 = v30;
              id v31 = objc_alloc(MEMORY[0x1E4F60800]);
              v32 = [v23 firstObject];
              v33 = (void *)[v31 initWithString:v32];

              v34 = [v33 displayName];
              v35 = (void *)[objc_alloc(MEMORY[0x1E4F60800]) initWithString:v43];

              v36 = v35;
              if (v34) {
                [v35 setDisplayName:v34];
              }
              v37 = [v35 stringValue];
              v52 = v37;
              uint64_t v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];

              id v23 = (void *)v38;
              v30 = v43;
            }
          }
        }
        v39 = [v50 dateSent];
        v40 = [v23 objectAtIndex:0];
        v41 = objc_msgSend(v39, "mf_replyPrefixForSender:", v40);
        [v49 prependPreamble:v41 quote:v22];

        if (v45) {
          [v49 prependString:@"\n"];
        }
      }
    }
  }
  if (!v11 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v6 addSignature:1];
  }
  v42 = [v5 messageBody];
  if ([v42 length]) {
    [v49 prependMarkupString:v42 quote:0];
  }
  if (objc_opt_respondsToSelector()) {
    [v6 contentDidChange];
  }
  if (objc_opt_respondsToSelector()) {
    [v6 setOriginalMessageWasEncrypted:v44];
  }
}

id __49__MFComposeTypeFactory__quoteFromModel_delegate___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 emailAddressValue];
  os_signpost_id_t v4 = v3;
  if (v3) {
    [v3 stringValue];
  }
  else {
  id v5 = [v2 stringValue];
  }

  return v5;
}

+ (id)headersFromDelegate:(id)a3
{
  id v3 = [a1 headersFromDelegate:a3 originatingBundleID:0 sourceAccountManagement:0];

  return v3;
}

+ (id)headersFromDelegate:(id)a3 originatingBundleID:(id)a4 sourceAccountManagement:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v72 = a4;
  BOOL v73 = v7;
  id v8 = objc_alloc_init(MEMORY[0x1E4F73550]);
  v9 = [v7 savedHeaders];
  uint64_t v10 = v9;
  if (v9)
  {
    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    id v11 = [v9 allHeaderKeys];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v78 objects:v83 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v79;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v79 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void *)(*((void *)&v78 + 1) + 8 * i);
          v16 = [v10 firstHeaderForKey:v15];
          if (v16) {
            [v8 setHeader:v16 forKey:v15];
          }
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v78 objects:v83 count:16];
      }
      while (v12);
    }
  }
  uint64_t v17 = [v73 subject];
  uint64_t v18 = [v17 length];

  if (v18)
  {
    v19 = [v73 subject];
    [v8 setHeader:v19 forKey:*MEMORY[0x1E4F60738]];
  }
  int v20 = [v73 toRecipients];
  BOOL v21 = [v20 count] == 0;

  if (!v21)
  {
    uint64_t v22 = [v73 toRecipients];
    [v8 setAddressListForTo:v22];
  }
  id v23 = [v73 ccRecipients];
  BOOL v24 = [v23 count] == 0;

  if (!v24)
  {
    BOOL v25 = [v73 ccRecipients];
    [v8 setAddressListForCc:v25];
  }
  uint64_t v26 = [v73 bccRecipients];
  BOOL v27 = [v26 count] == 0;

  if (!v27)
  {
    v28 = [v73 bccRecipients];
    [v8 setAddressListForBcc:v28];
  }
  v71 = [v73 accountProxyGenerator];
  v29 = [v73 sendingEmailAddress];
  if (!v29)
  {
    v30 = [v71 defaultMailAccountProxyForDeliveryOriginatingBundleID:v72 sourceAccountManagement:v5];
    id v31 = v30;
    if (v30)
    {
      v32 = [v30 firstEmailAddress];
      v33 = [v31 fullUserName];
      v34 = [MEMORY[0x1E4F60800] componentsWithString:v32];
      [v34 setDisplayName:v33];
      v29 = [v34 stringValue];
    }
    else
    {
      v29 = 0;
    }
  }
  id v35 = v29;
  v36 = [v35 emailAddressValue];
  v37 = [v36 displayName];
  uint64_t v38 = v37;
  if (v37)
  {
    id v39 = v37;
  }
  else
  {
    id v39 = [v35 stringValue];
  }
  v40 = v39;

  uint64_t v41 = [v40 length];
  BOOL v42 = v41 == [v35 length];

  if (v42)
  {
    id v43 = [v71 accountProxyContainingEmailAddress:v35 includingInactive:0 originatingBundleID:v72 sourceAccountManagement:v5];
    unsigned int v44 = v43;
    BOOL v69 = v43;
    if (!v43)
    {
LABEL_50:

      goto LABEL_51;
    }
    id v68 = [v43 fullUserName];
    v67 = [v44 fromEmailAddresses];
    if ([v67 count])
    {
      long long v76 = 0u;
      long long v77 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      obuint64_t j = v67;
      uint64_t v45 = [obj countByEnumeratingWithState:&v74 objects:v82 count:16];
      if (v45)
      {
        uint64_t v46 = *(void *)v75;
        while (2)
        {
          for (uint64_t j = 0; j != v45; ++j)
          {
            if (*(void *)v75 != v46) {
              objc_enumerationMutation(obj);
            }
            v48 = *(void **)(*((void *)&v74 + 1) + 8 * j);
            v49 = [v48 emailAddressValue];
            v50 = [v35 emailAddressValue];
            BOOL v51 = [v49 compare:v50] == 0;

            if (v51)
            {
              id v52 = v48;

              id v35 = v52;
              goto LABEL_41;
            }
          }
          uint64_t v45 = [obj countByEnumeratingWithState:&v74 objects:v82 count:16];
          if (v45) {
            continue;
          }
          break;
        }
      }
LABEL_41:
    }
    id v35 = v35;
    v53 = [v35 emailAddressValue];
    v54 = [v53 displayName];
    uint64_t v55 = v54;
    if (v54)
    {
      id v56 = v54;
    }
    else
    {
      id v56 = [v35 stringValue];
    }
    v57 = v56;

    uint64_t v58 = [v57 length];
    if (v58 == [v35 length])
    {
      BOOL v59 = [v68 length] == 0;

      if (v59)
      {
LABEL_49:

        goto LABEL_50;
      }
      uint64_t v60 = (void *)MEMORY[0x1E4F60800];
      uint64_t v61 = [v35 emailAddressValue];
      v57 = [v60 componentsWithEmailAddress:v61];

      [v57 setDisplayName:v68];
      uint64_t v62 = [v57 stringValue];

      id v35 = (id)v62;
    }

    goto LABEL_49;
  }
LABEL_51:
  if ([v35 length])
  {
    v63 = [MEMORY[0x1E4F1C978] arrayWithObject:v35];
    [v8 setAddressListForSender:v63];
  }
  v64 = [MEMORY[0x1E4F1C9C8] date];
  v65 = objc_msgSend(v64, "ec_descriptionForMimeHeaders");
  [v8 setHeader:v65 forKey:*MEMORY[0x1E4F606A0]];

  return v8;
}

+ (void)_sanitizeRecipientsForComposeType:(unint64_t)a3 sendingAddress:(id)a4 delegate:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = [v8 toRecipients];
  uint64_t v10 = [v8 ccRecipients];
  id v11 = [v8 bccRecipients];
  uint64_t v12 = [[MFMailRecipients alloc] initWithToRecipients:v9 ccRecipients:v10 bccRecipients:v11];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __82__MFComposeTypeFactory__sanitizeRecipientsForComposeType_sendingAddress_delegate___block_invoke;
  v23[3] = &unk_1E5F7A090;
  id v13 = v8;
  id v24 = v13;
  if ([(MFMailRecipients *)v12 sanitizeForComposeType:a3 sendingEmailAddress:v7 hideMyEmailAddressProvider:v23])
  {
    id v14 = [(MFMailRecipients *)v12 toRecipients];
    char v15 = [v14 isEqualToArray:v9];

    if ((v15 & 1) == 0)
    {
      v16 = [(MFMailRecipients *)v12 toRecipients];
      [v13 setToRecipients:v16];
    }
    uint64_t v17 = [(MFMailRecipients *)v12 ccRecipients];
    char v18 = [v17 isEqualToArray:v10];

    if ((v18 & 1) == 0)
    {
      v19 = [(MFMailRecipients *)v12 ccRecipients];
      [v13 setCcRecipients:v19];
    }
    int v20 = [(MFMailRecipients *)v12 bccRecipients];
    char v21 = [v20 isEqualToArray:v11];

    if ((v21 & 1) == 0)
    {
      uint64_t v22 = [(MFMailRecipients *)v12 bccRecipients];
      [v13 setBccRecipients:v22];
    }
  }
}

id __82__MFComposeTypeFactory__sanitizeRecipientsForComposeType_sendingAddress_delegate___block_invoke(uint64_t a1)
{
  os_log_t v1 = [*(id *)(a1 + 32) savedHeaders];
  id v2 = [v1 headersForKey:*MEMORY[0x1E4F606B0]];

  return v2;
}

+ (BOOL)alwaysBCCSelf
{
  id v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  char v3 = [v2 BOOLForKey:*MEMORY[0x1E4F600C8]];

  return v3;
}

+ (id)bccSelfAddressForDelegate:(id)a3
{
  char v3 = (void *)MEMORY[0x1E4F77C70];
  os_signpost_id_t v4 = [a3 sendingEmailAddress];
  uint64_t v5 = [v3 accountContainingEmailAddress:v4 includingInactive:1];

  id v6 = (void *)v5;
  if (v5
    || ([MEMORY[0x1E4F77C70] defaultMailAccountForDelivery],
        (id v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v7 = [v6 emailAddressStrings];
    id v8 = [v7 firstObject];

    v9 = [v6 fullUserName];
    uint64_t v10 = (void *)MEMORY[0x1E4F60800];
    id v11 = [v8 emailAddressValue];
    uint64_t v12 = [v10 componentsWithEmailAddress:v11];

    [v12 setDisplayName:v9];
    id v13 = [v12 stringValue];
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

+ (void)_mergeModel:(id)a3 withDelegate:(id)a4
{
  id v30 = a3;
  id v5 = a4;
  id v6 = [v30 toRecipients];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    id v8 = [v5 toRecipients];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      uint64_t v10 = [v5 toRecipients];
      id v11 = (void *)[v10 mutableCopy];

      uint64_t v12 = [v30 toRecipients];
      [v11 addObjectsFromArray:v12];
    }
    else
    {
      id v11 = [v30 toRecipients];
    }
    [v5 setToRecipients:v11];
  }
  id v13 = [v30 ccRecipients];
  uint64_t v14 = [v13 count];

  if (v14)
  {
    char v15 = [v5 ccRecipients];
    uint64_t v16 = [v15 count];

    if (v16)
    {
      uint64_t v17 = [v5 ccRecipients];
      char v18 = (void *)[v17 mutableCopy];

      v19 = [v30 ccRecipients];
      [v18 addObjectsFromArray:v19];
    }
    else
    {
      char v18 = [v30 ccRecipients];
    }
    [v5 setCcRecipients:v18];
  }
  int v20 = [v30 bccRecipients];
  uint64_t v21 = [v20 count];

  if (v21)
  {
    uint64_t v22 = [v5 bccRecipients];
    uint64_t v23 = [v22 count];

    if (v23)
    {
      id v24 = [v5 bccRecipients];
      BOOL v25 = (void *)[v24 mutableCopy];

      uint64_t v26 = [v30 bccRecipients];
      [v25 addObjectsFromArray:v26];
    }
    else
    {
      BOOL v25 = [v30 bccRecipients];
    }
    [v5 setBccRecipients:v25];
  }
  BOOL v27 = [v30 subject];
  uint64_t v28 = [v27 length];

  if (v28)
  {
    v29 = [v30 subject];
    [v5 setSubject:v29];
  }
}

+ (void)_updateDelegate:(id)a3 toRecipients:(id)a4 ccRecipients:(id)a5 bccRecipients:(id)a6
{
  id v18 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if ([v9 count])
  {
    uint64_t v12 = [v18 toRecipients];
    id v13 = __80__MFComposeTypeFactory__updateDelegate_toRecipients_ccRecipients_bccRecipients___block_invoke((uint64_t)v12, v12, v9);
    [v18 setToRecipients:v13];
  }
  if ([v10 count])
  {
    uint64_t v14 = [v18 ccRecipients];
    char v15 = __80__MFComposeTypeFactory__updateDelegate_toRecipients_ccRecipients_bccRecipients___block_invoke((uint64_t)v14, v14, v10);
    [v18 setCcRecipients:v15];
  }
  if ([v11 count])
  {
    uint64_t v16 = [v18 bccRecipients];
    uint64_t v17 = __80__MFComposeTypeFactory__updateDelegate_toRecipients_ccRecipients_bccRecipients___block_invoke((uint64_t)v16, v16, v11);
    [v18 setBccRecipients:v17];
  }
}

id __80__MFComposeTypeFactory__updateDelegate_toRecipients_ccRecipients_bccRecipients___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  BOOL v25 = v4;
  id v6 = objc_alloc(MEMORY[0x1E4F1CA70]);
  uint64_t v7 = v4;
  if (!v4)
  {
    uint64_t v7 = [MEMORY[0x1E4F1C978] array];
  }
  id v8 = (void *)[v6 initWithArray:v7];
  if (!v4) {

  }
  id v9 = objc_msgSend(v5, "ef_map:", &__block_literal_global_90);

  id v10 = objc_msgSend(v4, "ef_map:", &__block_literal_global_92);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v11);
        }
        char v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if (([v8 containsObject:v15] & 1) == 0)
        {
          id v16 = v15;
          uint64_t v17 = [v16 emailAddressValue];
          id v18 = [v17 simpleAddress];
          v19 = v18;
          if (v18)
          {
            id v20 = v18;
          }
          else
          {
            id v20 = [v16 stringValue];
          }
          uint64_t v21 = v20;

          char v22 = [v10 containsObject:v21];
          if ((v22 & 1) == 0) {
            [v8 addObject:v16];
          }
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v12);
  }

  uint64_t v23 = [v8 array];

  return v23;
}

id __80__MFComposeTypeFactory__updateDelegate_toRecipients_ccRecipients_bccRecipients___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  char v3 = [v2 emailAddressValue];
  id v4 = v3;
  if (v3) {
    [v3 stringValue];
  }
  else {
  id v5 = [v2 stringValue];
  }

  return v5;
}

id __80__MFComposeTypeFactory__updateDelegate_toRecipients_ccRecipients_bccRecipients___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  char v3 = [v2 emailAddressValue];
  id v4 = [v3 simpleAddress];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v2 stringValue];
  }
  uint64_t v7 = v6;

  return v7;
}

+ (void)_setupForReplyWithModel:(id)a3 delegate:(id)a4
{
  v88[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v74 = a1;
  [a1 _mergeModel:v6 withDelegate:v7];
  long long v76 = [v6 legacyMessage];
  long long v77 = [v76 headersIfAvailable];
  id v8 = [v76 mailbox];
  id v9 = [v8 account];
  long long v75 = [v9 emailAddressStrings];

  id v10 = [v76 firstSender];
  id v11 = [v10 emailAddressValue];
  uint64_t v12 = [v11 simpleAddress];
  uint64_t v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = [v10 stringValue];
  }
  char v15 = v14;

  int v16 = [v75 containsObject:v15];
  if (v16)
  {
    uint64_t v17 = (void *)[v77 copyAddressListForReplyTo];
    id v18 = objc_msgSend(v17, "ef_map:", &__block_literal_global_94);
    v19 = (void *)[v18 copy];

    id v20 = [v76 to];
    uint64_t v21 = objc_msgSend(v20, "ef_map:", &__block_literal_global_96);
    char v22 = (void *)[v21 copy];

    uint64_t v23 = [v76 firstSender];
    id v24 = [v76 firstSender];
    [v7 setSendingEmailAddress:v24];

    uint64_t v25 = [v19 count];
    long long v26 = v19;
    if (v25) {
      goto LABEL_17;
    }
    long long v27 = objc_msgSend(v22, "ef_map:", &__block_literal_global_98);
    id v28 = v23;
    long long v29 = [v28 emailAddressValue];
    id v30 = [v29 simpleAddress];
    uint64_t v31 = v30;
    if (v30)
    {
      id v32 = v30;
    }
    else
    {
      id v32 = [v28 stringValue];
    }
    uint64_t v38 = v32;

    int v39 = [v27 containsObject:v38];
    long long v26 = v22;
    if (!v39)
    {
LABEL_17:
      [v7 setToRecipients:v26];
    }
    else
    {
      v88[0] = v28;
      v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v88 count:1];
      [v7 setToRecipients:v40];
    }
  }
  else
  {
    v33 = (void *)[v77 copyAddressListForReplyTo];
    if ([v33 count])
    {
      id v34 = v33;
    }
    else
    {
      id v35 = [v7 toRecipients];
      uint64_t v36 = [v35 count];

      if (v36)
      {
        id v34 = 0;
      }
      else
      {
        v37 = (void *)[v77 copyAddressListForReplyTo];
        if ([v37 count])
        {
          id v34 = v37;
        }
        else
        {
          uint64_t v41 = [v76 senders];

          id v34 = (id)v41;
        }
      }
    }
    [v74 _updateDelegate:v7 toRecipients:v34 ccRecipients:0 bccRecipients:0];
  }
  BOOL v42 = [v7 subject];
  BOOL v43 = [v42 length] == 0;

  if (v43)
  {
    unsigned int v44 = [v76 subject];
    uint64_t v45 = [v44 subjectWithoutPrefix];
    uint64_t v46 = [MEMORY[0x1E4F608E8] nonLocalizedReplyPrefix];
    uint64_t v47 = _subjectWithPrefix(v45, v46);

    [v7 setSubject:v47];
  }
  v48 = [v77 firstHeaderForKey:*MEMORY[0x1E4F606F0]];
  v49 = v48;
  if (v48)
  {
    id v50 = v48;
  }
  else
  {
    id v50 = [v77 firstHeaderForKey:*MEMORY[0x1E4F606C8]];
  }
  BOOL v51 = v50;
  uint64_t v52 = *MEMORY[0x1E4F606B0];
  v53 = [v77 firstHeaderForKey:*MEMORY[0x1E4F606B0]];
  BOOL v73 = [v6 originalMessage];
  v54 = [v73 objectID];
  uint64_t v55 = [v54 serializedRepresentation];

  id v56 = [v77 references];
  v57 = v56;
  if (v49)
  {
    if (!v56)
    {
      v57 = [MEMORY[0x1E4F1C978] arrayWithObject:v49];
      if (!v51) {
        goto LABEL_30;
      }
      goto LABEL_32;
    }
    uint64_t v58 = [v56 arrayByAddingObject:v49];

    v57 = (void *)v58;
  }
  if (!v51)
  {
LABEL_30:
    if (!v57 && !v53) {
      goto LABEL_41;
    }
  }
LABEL_32:
  id v59 = objc_alloc_init(MEMORY[0x1E4F73550]);
  uint64_t v60 = v59;
  if (v51) {
    [v59 setHeader:v51 forKey:*MEMORY[0x1E4F606C8]];
  }
  if (v55)
  {
    uint64_t v61 = [v55 base64EncodedDataWithOptions:0];
    [v60 setHeader:v61 forKey:*MEMORY[0x1E4F73420]];
  }
  if (v53) {
    [v60 setHeader:v53 forKey:v52];
  }
  if (v57) {
    [v60 setReferences:v57];
  }
  [v7 setSavedHeaders:v60];

LABEL_41:
  uint64_t v82 = 0;
  BOOL v83 = &v82;
  uint64_t v84 = 0x3032000000;
  id v85 = __Block_byref_object_copy__2;
  id v86 = __Block_byref_object_dispose__2;
  id v87 = 0;
  if (v53)
  {
    uint64_t v62 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v63 = [v62 localizedStringForKey:@"HIDE_MY_EMAIL_TITLE" value:&stru_1F0817A00 table:@"Main"];
    v64 = (void *)v83[5];
    v83[5] = v63;

    v65 = [MEMORY[0x1E4F602C8] sharedInstance];
    v78[0] = MEMORY[0x1E4F143A8];
    v78[1] = 3221225472;
    v78[2] = __57__MFComposeTypeFactory__setupForReplyWithModel_delegate___block_invoke_112;
    v78[3] = &unk_1E5F7A0D8;
    id v79 = v53;
    id v80 = v7;
    long long v81 = &v82;
    [v65 isAvailable:v78];
  }
  else
  {
    uint64_t v66 = [v76 preferredEmailAddressToReplyWith];
    v67 = (void *)v83[5];
    v83[5] = v66;

    uint64_t v68 = v83[5];
    if (!v68)
    {
      uint64_t v69 = [v6 preferredSendingEmailAddress];
      BOOL v70 = (void *)v83[5];
      v83[5] = v69;

      uint64_t v68 = v83[5];
    }
    [v7 setSendingEmailAddress:v68];
  }
  if ([v6 isQuickReply]) {
    [v7 setIsQuickReply:1];
  }
  v71 = [v7 composeWebView];
  if (v71) {
    [v74 _quoteFromModel:v6 delegate:v7];
  }
  if ([v6 composeType] == 4 || objc_msgSend(v6, "composeType") == 5)
  {
    uint64_t v72 = [v6 composeType];
    [v74 _sanitizeRecipientsForComposeType:v72 sendingAddress:v83[5] delegate:v7];
  }

  _Block_object_dispose(&v82, 8);
}

id __57__MFComposeTypeFactory__setupForReplyWithModel_delegate___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  char v3 = [v2 emailAddressValue];
  id v4 = v3;
  if (v3) {
    [v3 stringValue];
  }
  else {
  id v5 = [v2 stringValue];
  }

  return v5;
}

id __57__MFComposeTypeFactory__setupForReplyWithModel_delegate___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  char v3 = [v2 emailAddressValue];
  id v4 = v3;
  if (v3) {
    [v3 stringValue];
  }
  else {
  id v5 = [v2 stringValue];
  }

  return v5;
}

id __57__MFComposeTypeFactory__setupForReplyWithModel_delegate___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  char v3 = [v2 emailAddressValue];
  id v4 = [v3 simpleAddress];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v2 stringValue];
  }
  id v7 = v6;

  return v7;
}

void __57__MFComposeTypeFactory__setupForReplyWithModel_delegate___block_invoke_112(uint64_t a1, int a2, void *a3)
{
  id v12 = a3;
  if (a2)
  {
    id v5 = [MEMORY[0x1E4F608F8] tagValueListFromString:*(void *)(a1 + 32) error:0];
    id v6 = *(void **)(a1 + 40);
    id v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F5FD00]];
    [v6 setSendingEmailAddressAsHME:v7 isComposeTypeReply:1];
  }
  else
  {
    id v8 = [MEMORY[0x1E4F602C8] sharedInstance];
    uint64_t v9 = [v8 forwardingEmailForPrimaryAccount];
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    [*(id *)(a1 + 40) setSendingEmailAddress:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  }
}

+ (void)_setupForForwardWithModel:(id)a3 delegate:(id)a4
{
  id v24 = a3;
  id v6 = a4;
  [a1 _mergeModel:v24 withDelegate:v6];
  id v7 = [v24 legacyMessage];
  id v8 = [v6 subject];
  uint64_t v9 = [v8 length];

  if (!v9)
  {
    uint64_t v10 = [v7 subject];
    id v11 = [v10 subjectWithoutPrefix];
    id v12 = [MEMORY[0x1E4F608E8] nonLocalizedForwardPrefix];
    uint64_t v13 = _subjectWithPrefix(v11, v12);

    [v6 setSubject:v13];
  }
  id v14 = [v24 originalMessage];
  char v15 = [v14 objectID];
  int v16 = [v15 serializedRepresentation];

  uint64_t v17 = [v7 headersIfAvailable];
  id v18 = [v17 firstHeaderForKey:*MEMORY[0x1E4F606F0]];
  if (v18)
  {
    id v19 = objc_alloc_init(MEMORY[0x1E4F73550]);
    id v20 = [MEMORY[0x1E4F1C978] arrayWithObject:v18];
    [v19 setReferences:v20];

    if (v16)
    {
      uint64_t v21 = [v16 base64EncodedDataWithOptions:0];
      [v19 setHeader:v21 forKey:*MEMORY[0x1E4F73408]];
    }
    [v6 setSavedHeaders:v19];
  }
  char v22 = [v7 preferredEmailAddressToReplyWith];
  if (!v22)
  {
    char v22 = [v24 preferredSendingEmailAddress];
  }
  [v6 setSendingEmailAddress:v22];
  uint64_t v23 = [v6 composeWebView];
  if (v23) {
    [a1 _quoteFromModel:v24 delegate:v6];
  }
  objc_msgSend(a1, "_sanitizeRecipientsForComposeType:sendingAddress:delegate:", objc_msgSend(v24, "composeType"), v22, v6);
}

+ (void)_setupForReplyAllWithModel:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  [a1 _setupForReplyWithModel:v7 delegate:v6];
  [a1 setupSwitchToReplyAllWithModel:v7 delegate:v6];
}

+ (void)setupSwitchToReplyAllWithModel:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v45 = v6;
  id v8 = [v6 legacyMessage];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v46 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v10 = [v8 to];
  id v11 = [v8 cc];
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CA80], "ec_emailAddressConvertiblesSetFromArray:includeInvalid:", v10, 1);
  uint64_t v13 = (void *)MEMORY[0x1E4F1CA80];
  BOOL v43 = (void *)v12;
  id v14 = [v7 toRecipients];
  BOOL v42 = objc_msgSend(v13, "ec_emailAddressConvertiblesSetFromArray:includeInvalid:", v14, 1);

  char v15 = [v8 mailbox];
  int v16 = [v15 account];
  unsigned int v44 = [v16 emailAddressStrings];
  id v41 = a1;

  id v17 = [v8 firstSender];
  id v18 = [v17 emailAddressValue];
  id v19 = [v18 simpleAddress];
  id v20 = v19;
  if (v19)
  {
    id v21 = v19;
  }
  else
  {
    id v21 = [v17 stringValue];
  }
  char v22 = v21;

  uint64_t v23 = [v7 savedHeaders];
  id v24 = [v23 headersForKey:*MEMORY[0x1E4F606B0]];

  if (![v44 containsObject:v22])
  {
    if (v10 && !v24) {
      [v9 addObjectsFromArray:v10];
    }
    if (v11) {
      [v9 addObjectsFromArray:v11];
    }
    if (v24)
    {
      long long v27 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      [v27 localizedStringForKey:@"HIDE_MY_EMAIL_TITLE" value:&stru_1F0817A00 table:@"Main"];
      char v22 = v28 = v22;
    }
    else
    {
      long long v29 = [v8 preferredEmailAddressToReplyWith];

      if (!v29)
      {
        long long v29 = [v45 preferredSendingEmailAddress];
      }
      id v30 = v29;
      uint64_t v31 = [v30 emailAddressValue];
      id v32 = [v31 simpleAddress];
      v33 = v32;
      if (v32)
      {
        id v34 = v32;
      }
      else
      {
        id v34 = [v30 stringValue];
      }
      id v35 = v34;

      id v28 = v30;
      long long v27 = v30;
      char v22 = v35;
    }
    goto LABEL_23;
  }
  if (v11) {
    [v9 addObjectsFromArray:v11];
  }
  [v43 unionSet:v42];
  if (v10 && ([v43 isEqual:v42] & 1) == 0)
  {
    uint64_t v25 = [v7 toRecipients];
    long long v26 = objc_msgSend(v25, "ef_map:", &__block_literal_global_116);
    [v43 addObjectsFromArray:v26];

    long long v27 = [v43 allObjects];
    id v28 = objc_msgSend(v27, "ef_map:", &__block_literal_global_118);
    [v46 addObjectsFromArray:v28];
LABEL_23:
  }
  uint64_t v36 = [[MFMailRecipients alloc] initWithToRecipients:v46 ccRecipients:v9 bccRecipients:0];
  uint64_t v37 = [v45 composeType];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __64__MFComposeTypeFactory_setupSwitchToReplyAllWithModel_delegate___block_invoke_3;
  v47[3] = &unk_1E5F7A090;
  id v38 = v7;
  id v48 = v38;
  [(MFMailRecipients *)v36 sanitizeForComposeType:v37 sendingEmailAddress:v22 hideMyEmailAddressProvider:v47];
  int v39 = [(MFMailRecipients *)v36 toRecipients];
  v40 = [(MFMailRecipients *)v36 ccRecipients];
  [v41 _updateDelegate:v38 toRecipients:v39 ccRecipients:v40 bccRecipients:0];
}

id __64__MFComposeTypeFactory_setupSwitchToReplyAllWithModel_delegate___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  char v3 = [v2 emailAddressValue];
  id v4 = v3;
  if (!v3) {
    char v3 = v2;
  }
  id v5 = v3;

  return v5;
}

id __64__MFComposeTypeFactory_setupSwitchToReplyAllWithModel_delegate___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  char v3 = [v2 emailAddressValue];
  id v4 = [v3 stringValue];
  id v5 = v4;
  if (!v4) {
    id v4 = v2;
  }
  id v6 = v4;

  return v6;
}

id __64__MFComposeTypeFactory_setupSwitchToReplyAllWithModel_delegate___block_invoke_3(uint64_t a1)
{
  os_log_t v1 = [*(id *)(a1 + 32) savedHeaders];
  id v2 = [v1 headersForKey:*MEMORY[0x1E4F606B0]];

  return v2;
}

+ (void)setupSwitchToReplyWithModel:(id)a3 delegate:(id)a4
{
  id v4 = a4;
  [v4 setCcRecipients:0];
  [v4 setBccRecipients:0];
}

+ (void)_setupForNewMessageWithModel:(id)a3 delegate:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v37 = a1;
  [a1 _mergeModel:v7 withDelegate:v8];
  id v38 = [v7 preferredSendingEmailAddress];
  id v9 = [v7 hideMyEmailFrom];
  uint64_t v10 = [v9 length];

  if (v10)
  {
    id v11 = [v7 hideMyEmailFrom];
    [v8 setHideMyEmailAddressForMailToURLAddressString:v11];

    uint64_t v12 = [v7 hideMyEmailFrom];

    uint64_t v13 = (void *)v12;
  }
  else
  {
    uint64_t v13 = v38;
  }
  int v39 = v13;
  objc_msgSend(v8, "setSendingEmailAddress:");
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (uint64_t v15 = [v8 contentVariationIndex], v15 != 0x7FFFFFFFFFFFFFFFLL))
  {
    id v20 = [v7 contentVariations];
    id v21 = [v20 objectAtIndexedSubscript:v15];

    uint64_t v36 = v21;
    char v22 = [v21 body];
    uint64_t v23 = +[_MFMailCompositionContext processMessageBody:asHTML:](_MFMailCompositionContext, "processMessageBody:asHTML:", v22, [v21 bodyIsHTML]);

    id v35 = (void *)v23;
    if (v23) {
      [v14 addObject:v23];
    }
    id v24 = [v7 attachmentContext];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    uint64_t v25 = [v36 attachmentIdentifiers];
    SEL v34 = a2;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v41;
      do
      {
        uint64_t v28 = 0;
        do
        {
          if (*(void *)v41 != v27) {
            objc_enumerationMutation(v25);
          }
          long long v29 = [v24 attachmentForHostIdentifier:*(void *)(*((void *)&v40 + 1) + 8 * v28)];
          if (v29)
          {
            [v14 addObject:v29];
          }
          else
          {
            id v30 = [MEMORY[0x1E4F28B00] currentHandler];
            [v30 handleFailureInMethod:v34 object:v37 file:@"MFComposeTypeFactory.m" lineNumber:857 description:@"Unexpected found nil attachment for host identifier."];
          }
          ++v28;
        }
        while (v26 != v28);
        uint64_t v31 = [v25 countByEnumeratingWithState:&v40 objects:v44 count:16];
        uint64_t v26 = v31;
      }
      while (v31);
    }
  }
  else
  {
    int v16 = [v7 messageBody];
    if (v16) {
      [v14 addObject:v16];
    }
    id v17 = [v7 deferredAttachments];
    uint64_t v18 = [v17 count];

    if (!v18)
    {
      id v19 = [v7 attachments];
      [v14 addObjectsFromArray:v19];
    }
  }
  objc_msgSend(v37, "_setContent:includeAttachments:shouldQuote:prependBlankLine:delegate:signpostID:", v14, 1, 0, 1, v8, objc_msgSend(v7, "signpostID"));
  if (objc_opt_respondsToSelector()) {
    [v8 addSignature:0];
  }
  if ([v7 originatingFromAttachmentMarkup])
  {
    id v32 = [v7 legacyMessage];
    v33 = [v32 preferredEmailAddressToReplyWith];
    if (!v33)
    {
      v33 = [v7 preferredSendingEmailAddress];
    }
    [v8 setSendingEmailAddress:v33];
  }
  objc_msgSend(v37, "_sanitizeRecipientsForComposeType:sendingAddress:delegate:", objc_msgSend(v7, "composeType"), v39, v8);
}

+ (void)addAttachment:(id)a3 prepend:(BOOL)a4 withCompositionModel:(id)a5 delegate:(id)a6
{
  BOOL v8 = a4;
  id v15 = a3;
  id v10 = a5;
  id v11 = a6;
  BOOL v12 = v8 && [v10 composeType] == 0;
  uint64_t v13 = [a1 _markupForInlineAttachment:v15 willBeIncluded:1 prependBlankLine:v12 delegate:v11];
  if ([v13 length])
  {
    [v11 composeWebView];
    if (v8) {
      id v14 = {;
    }
      [v14 prependMarkupString:v13 quote:0];
    }
    else {
      id v14 = {;
    }
      [v14 appendMarkupString:v13 quote:0];
    }
  }
}

+ (unint64_t)imageScaleFromUserDefaults
{
  if (!objc_msgSend(MEMORY[0x1E4FB16C8], "mf_isPad")) {
    return 0;
  }
  id v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "mf_copyCompositionServicesPreferenceValueForKey:", *MEMORY[0x1E4F77E18]);
  unint64_t v3 = (int)[v2 intValue];

  return v3;
}

+ (void)setupWithCompositionModel:(id)a3 delegate:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  switch([v6 composeType])
  {
    case 0:
      [a1 _setupForNewMessageWithModel:v6 delegate:v7];
      break;
    case 4:
      [a1 _setupForReplyWithModel:v6 delegate:v7];
      break;
    case 5:
      [a1 _setupForReplyAllWithModel:v6 delegate:v7];
      break;
    case 6:
      [a1 _setupForForwardWithModel:v6 delegate:v7];
      break;
    default:
      BOOL v8 = MFLogGeneral();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 134217984;
        uint64_t v10 = [v6 composeType];
        _os_log_impl(&dword_1AF945000, v8, OS_LOG_TYPE_DEFAULT, "#Warning Unhandled composition case: %ld", (uint8_t *)&v9, 0xCu);
      }

      break;
  }
}

+ (void)setupWithContent:(id)a3 delegate:(id)a4 signpostID:(unint64_t)a5
{
  id v12 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v12;
  }
  else
  {
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObject:v12];
  }
  uint64_t v10 = v9;
  [a1 _setContent:v9 includeAttachments:1 shouldQuote:0 prependBlankLine:0 delegate:v8 signpostID:a5];
  uint64_t v11 = [v8 composeWebView];
  [v11 addMailAttributesBeforeDisplayHidingTrailingEmptyQuotes:1 shouldQuote:0];
}

+ (id)messageFromDelegate:(id)a3 withSubstituteDOMDocument:(id)a4 compositionSpecification:(id)a5 originatingBundleID:(id)a6 sourceAccountManagement:(int)a7 writeAttachmentPlaceholders:(BOOL)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  if (pthread_main_np() != 1)
  {
    uint64_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2 object:a1 file:@"MFComposeTypeFactory.m" lineNumber:947 description:@"Current thread must be main"];
  }
  id v17 = [v14 composeWebView];
  uint64_t v18 = [v14 shouldCreateRichTextRepresentation];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __167__MFComposeTypeFactory_messageFromDelegate_withSubstituteDOMDocument_compositionSpecification_originatingBundleID_sourceAccountManagement_writeAttachmentPlaceholders___block_invoke;
  v26[3] = &unk_1E5F7A170;
  id v31 = a1;
  id v19 = v14;
  id v27 = v19;
  id v20 = v16;
  id v28 = v20;
  int v32 = a7;
  id v21 = v15;
  id v29 = v21;
  BOOL v33 = a8;
  id v22 = v17;
  id v30 = v22;
  uint64_t v23 = [v18 then:v26];

  return v23;
}

id __167__MFComposeTypeFactory_messageFromDelegate_withSubstituteDOMDocument_compositionSpecification_originatingBundleID_sourceAccountManagement_writeAttachmentPlaceholders___block_invoke(uint64_t a1, void *a2)
{
  int v3 = [a2 BOOLValue];
  id v4 = [*(id *)(a1 + 64) headersFromDelegate:*(void *)(a1 + 32) originatingBundleID:*(void *)(a1 + 40) sourceAccountManagement:*(unsigned int *)(a1 + 72)];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F77BF8]) initWithCompositionSpecification:*(void *)(a1 + 48)];
  [v5 setShouldWriteAttachmentPlaceholders:*(unsigned __int8 *)(a1 + 76)];
  id v6 = [v4 firstSenderAddress];
  id v7 = [MEMORY[0x1E4F77C70] accountContainingEmailAddress:v6];
  objc_opt_class();
  char v8 = objc_opt_isKindOfClass() & 1;
  if (v3)
  {
    id v9 = [MEMORY[0x1E4F60E18] promise];
    uint64_t v10 = [v9 future];
    uint64_t v11 = *(void **)(a1 + 56);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __167__MFComposeTypeFactory_messageFromDelegate_withSubstituteDOMDocument_compositionSpecification_originatingBundleID_sourceAccountManagement_writeAttachmentPlaceholders___block_invoke_2;
    v21[3] = &unk_1E5F7A100;
    id v22 = *(id *)(a1 + 32);
    char v26 = v8;
    id v23 = v5;
    id v24 = v4;
    id v12 = v9;
    id v25 = v12;
    [v11 getHTMLDataObject:v21];
    uint64_t v13 = &v22;
    id v14 = &v23;
  }
  else
  {
    id v12 = [*(id *)(a1 + 56) plainTextContent];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __167__MFComposeTypeFactory_messageFromDelegate_withSubstituteDOMDocument_compositionSpecification_originatingBundleID_sourceAccountManagement_writeAttachmentPlaceholders___block_invoke_3;
    v17[3] = &unk_1E5F7A128;
    char v20 = v8;
    id v18 = v5;
    id v19 = v4;
    uint64_t v10 = [v12 then:v17];
    uint64_t v13 = &v18;
    id v14 = &v19;
  }

  id v15 = [v10 then:&__block_literal_global_144];

  return v15;
}

void __167__MFComposeTypeFactory_messageFromDelegate_withSubstituteDOMDocument_compositionSpecification_originatingBundleID_sourceAccountManagement_writeAttachmentPlaceholders___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v33 = a2;
  id v35 = [v33 htmlString];
  id v3 = [v33 otherHTMLStringsAndAttachments];
  SEL v34 = [v33 plainTextAlternative];
  if (!v3)
  {
    id v7 = [MEMORY[0x1E4F77B78] defaultManager];
    char v8 = [*(id *)(a1 + 32) composeWebView];
    id v9 = [v8 compositionContextID];
    id v3 = [v7 attachmentsForContext:v9];

    goto LABEL_6;
  }
  if (!*(unsigned char *)(a1 + 64))
  {
LABEL_6:
    uint64_t v10 = v35;
    goto LABEL_38;
  }
  id v38 = objc_opt_new();
  id v4 = objc_opt_new();
  uint64_t v32 = a1;
  if (v35)
  {
    id v5 = [v35 string];
    [v38 addObject:v5];

    id v6 = [v35 charset];
  }
  else
  {
    id v6 = 0;
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v11 = v3;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (!v12)
  {

    goto LABEL_33;
  }
  uint64_t v13 = *(void *)v40;
  char v37 = 1;
  do
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v40 != v13) {
        objc_enumerationMutation(v11);
      }
      id v15 = *(void **)(*((void *)&v39 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v4 addObject:v15];
        continue;
      }
      id v16 = v15;
      id v17 = v16;
      if (!v6)
      {
        id v6 = [v16 charset];
      }
      id v18 = [v17 string];
      [v38 addObject:v18];

      id v19 = [v17 charset];
      uint64_t v20 = [v19 encoding];
      LOBYTE(v20) = v20 == [v6 encoding];

      if ((v20 & 1) == 0)
      {
        id v21 = [v17 charset];
        if ([v21 encoding] == 4)
        {
          BOOL v22 = [v6 encoding] == 1;

          if (v22)
          {
            uint64_t v23 = [v17 charset];

            id v6 = (void *)v23;
            goto LABEL_27;
          }
        }
        else
        {
        }
        id v24 = [v17 charset];
        if ([v24 encoding] == 1)
        {
          BOOL v25 = [v6 encoding] == 4;

          if (v25) {
            goto LABEL_27;
          }
        }
        else
        {
        }
        char v37 = 0;
      }
LABEL_27:
    }
    uint64_t v12 = [v11 countByEnumeratingWithState:&v39 objects:v43 count:16];
  }
  while (v12);

  if ((v37 & 1) == 0)
  {
    uint64_t v26 = (uint64_t)v35;
    id v3 = v11;
    goto LABEL_37;
  }
LABEL_33:
  id v27 = [v38 componentsJoinedByString:@"\n"];
  if (v35)
  {
    uint64_t v26 = [objc_alloc(MEMORY[0x1E4F60840]) initWithString:v27 charset:v6];
    id v28 = v35;
  }
  else
  {
    id v28 = (void *)[objc_alloc(MEMORY[0x1E4F60840]) initWithString:v27 charset:v6];
    uint64_t v26 = 0;
    [v4 insertObject:v28 atIndex:0];
  }

  id v3 = v4;
LABEL_37:

  uint64_t v10 = (void *)v26;
  a1 = v32;
LABEL_38:
  uint64_t v36 = v10;
  id v29 = objc_msgSend(*(id *)(a1 + 40), "createMessageWithHTMLStringAndMIMECharset:plainTextAlternative:otherHtmlStringsAndAttachments:headers:");
  id v30 = *(void **)(a1 + 56);
  if (v29)
  {
    [*(id *)(a1 + 56) finishWithResult:v29];
  }
  else
  {
    id v31 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F77B18] code:1030 userInfo:0];
    [v30 finishWithError:v31];
  }
}

id __167__MFComposeTypeFactory_messageFromDelegate_withSubstituteDOMDocument_compositionSpecification_originatingBundleID_sourceAccountManagement_writeAttachmentPlaceholders___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (*(unsigned char *)(a1 + 48) && (unint64_t)[v3 count] >= 2)
  {
    id v5 = objc_opt_new();
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = v4;
    id v7 = 0;
    uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (v7)
            {
              uint64_t v12 = [v11 string];
              [v7 appendString:v12 withQuoteLevel:0];
            }
            else
            {
              id v7 = v11;
            }
          }
          else
          {
            objc_msgSend(v5, "addObject:", v11, (void)v18);
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v8);
    }
  }
  uint64_t v13 = objc_msgSend(*(id *)(a1 + 32), "createMessageWithPlainTextDocumentsAndAttachments:headers:", v4, *(void *)(a1 + 40), (void)v18);
  id v14 = (void *)MEMORY[0x1E4F60D70];
  if (v13)
  {
    id v15 = [MEMORY[0x1E4F60D70] futureWithResult:v13];
  }
  else
  {
    id v16 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F77B18] code:1030 userInfo:0];
    id v15 = [v14 futureWithError:v16];
  }

  return v15;
}

id __167__MFComposeTypeFactory_messageFromDelegate_withSubstituteDOMDocument_compositionSpecification_originatingBundleID_sourceAccountManagement_writeAttachmentPlaceholders___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  [v3 timeIntervalSince1970];
  objc_msgSend(v2, "setDateSentAsTimeIntervalSince1970:");

  id v4 = [MEMORY[0x1E4F60D70] futureWithResult:v2];

  return v4;
}

+ (id)messageFromDelegate:(id)a3 originatingBundleID:(id)a4 sourceAccountManagement:(int)a5
{
  id v5 = [a1 messageFromDelegate:a3 withSubstituteDOMDocument:0 compositionSpecification:0 originatingBundleID:a4 sourceAccountManagement:*(void *)&a5 writeAttachmentPlaceholders:0];

  return v5;
}

+ (void)hijackThreadFromDelegate:(id)a3
{
  id v4 = a3;
  id v3 = [v4 savedHeaders];
  [v3 removeHeaderForKey:*MEMORY[0x1E4F606C8]];
  [v3 setReferences:0];
  [v4 setSavedHeaders:v3];
}

+ (id)subjectFromSubject:(id)a3 withComposeType:(int64_t)a4
{
  id v5 = a3;
  id v6 = v5;
  if ((unint64_t)(a4 - 4) < 2)
  {
    id v7 = [MEMORY[0x1E4F608E8] nonLocalizedReplyPrefix];
    uint64_t v8 = _subjectWithPrefix(v6, v7);
LABEL_5:
    id v9 = (id)v8;

    goto LABEL_7;
  }
  if (a4 == 6)
  {
    id v7 = [MEMORY[0x1E4F608E8] nonLocalizedForwardPrefix];
    uint64_t v8 = _subjectWithPrefix(v6, v7);
    goto LABEL_5;
  }
  id v9 = v5;
LABEL_7:

  return v9;
}

+ (void)_setContent:(void *)a3 includeAttachments:(os_log_t)log shouldQuote:prependBlankLine:delegate:storeOriginalAttachments:signpostID:.cold.1(void *a1, uint8_t *buf, void *a3, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *a3 = a1;
  _os_log_error_impl(&dword_1AF945000, log, OS_LOG_TYPE_ERROR, "Unable to find content ID for MIME attachment: %{public}@", buf, 0xCu);
}

@end