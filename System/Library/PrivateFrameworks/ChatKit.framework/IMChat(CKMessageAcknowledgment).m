@interface IMChat(CKMessageAcknowledgment)
+ (id)configureMessageSummaryInfoForChatItem:()CKMessageAcknowledgment;
+ (uint64_t)associatedMessageContentTypeFromCKMediaType:()CKMessageAcknowledgment;
- (id)_relevantLanguageIdentifierForLocalization;
- (uint64_t)sendMessageAcknowledgment:()CKMessageAcknowledgment forChatItem:;
- (uint64_t)sendMessageAcknowledgment:()CKMessageAcknowledgment forChatItem:withGuid:;
- (uint64_t)sendTapback:()CKMessageAcknowledgment forChatItem:;
- (void)sendMessageAcknowledgment:()CKMessageAcknowledgment forChatItem:languageIdentifier:;
- (void)sendTapback:()CKMessageAcknowledgment forChatItem:languageIdentifier:;
@end

@implementation IMChat(CKMessageAcknowledgment)

+ (uint64_t)associatedMessageContentTypeFromCKMediaType:()CKMessageAcknowledgment
{
  if ((a3 - 1) > 8) {
    return 0;
  }
  else {
    return byte_18F81D858[a3 - 1];
  }
}

+ (id)configureMessageSummaryInfoForChatItem:()CKMessageAcknowledgment
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v14 = [v3 IMChatItem];
      v15 = [v14 dataSource];
      if (!v15)
      {
        v25 = 0;
        id v13 = 0;
        v18 = 0;
        uint64_t v7 = 0;
LABEL_35:

        v26 = 0;
        goto LABEL_42;
      }
      v16 = [v14 type];
      if ([v16 isEqualToString:@"com.apple.messages.URLBalloonProvider"])
      {
        v17 = [v15 url];
        v18 = [v17 absoluteString];

        uint64_t v7 = 1;
      }
      else
      {
        v18 = [(id)objc_opt_class() previewSummaryForPluginBundle:v16];
        uint64_t v7 = 9;
      }
      id v13 = v16;
      id v27 = objc_alloc(MEMORY[0x1E4F28DC0]);
      v28 = [v15 pluginPayload];
      v29 = [v28 data];
      id v45 = 0;
      v30 = (void *)[v27 initForReadingFromData:v29 error:&v45];
      id v44 = v45;

      if (objc_opt_respondsToSelector())
      {
        [v30 _enableStrictSecureDecodingMode];
        if (IMOSLoggingEnabled())
        {
          v31 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18EF18000, v31, OS_LOG_TYPE_INFO, "strict-decoding 017 _enableStrictSecureDecodingMode called", buf, 2u);
          }
        }
      }
      v32 = IMExtensionPayloadUnarchivingClasses();
      v33 = [v30 decodeObjectOfClasses:v32 forKey:*MEMORY[0x1E4F284E8]];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v25 = [v33 objectForKey:*MEMORY[0x1E4F6D2E8]];
        if (v18)
        {
LABEL_34:

          goto LABEL_35;
        }
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          v34 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v47 = v44;
            _os_log_impl(&dword_18EF18000, v34, OS_LOG_TYPE_INFO, "Failed to unarchive the data source pluginPayload. Error: %@", buf, 0xCu);
          }
        }
        v25 = 0;
        if (v18) {
          goto LABEL_34;
        }
      }
      if (IMOSLoggingEnabled())
      {
        v35 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v47 = v13;
          _os_log_impl(&dword_18EF18000, v35, OS_LOG_TYPE_INFO, "summary text for tapback is nil for type: %@", buf, 0xCu);
        }
      }
      goto LABEL_34;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v25 = 0;
      id v13 = 0;
      v26 = 0;
      v18 = 0;
      uint64_t v7 = 0;
      goto LABEL_42;
    }
    id v19 = v3;
    v20 = [v19 subject];
    v21 = [v20 string];

    v22 = [v19 text];
    v23 = [v22 string];

    if (v21 && v23)
    {
      id v24 = [NSString stringWithFormat:@"%@ %@", v21, v23];
    }
    else if (v21)
    {
      id v24 = v21;
    }
    else
    {
      if (!v23)
      {
        v18 = 0;
        goto LABEL_41;
      }
      id v24 = v23;
    }
    v18 = v24;
LABEL_41:
    v36 = [v19 messageItem];
    v37 = objc_msgSend(v36, "messagePartMatchingPartIndex:", objc_msgSend(v19, "index"));
    v26 = [v37 messagePartBody];

    v25 = 0;
    id v13 = 0;
    uint64_t v7 = 1;
    goto LABEL_42;
  }
  id v4 = v3;
  v5 = (void *)MEMORY[0x1E4F6BC28];
  v6 = [v4 mediaObject];
  uint64_t v7 = objc_msgSend(v5, "associatedMessageContentTypeFromCKMediaType:", objc_msgSend(v6, "mediaType"));

  v8 = [v4 IMChatItem];
  v9 = [v8 balloonBundleID];
  v10 = (void *)*MEMORY[0x1E4F6CC00];
  v11 = IMBalloonExtensionIDWithSuffix();
  int v12 = [v9 isEqualToString:v11];

  if (v12) {
    id v13 = v10;
  }
  else {
    id v13 = 0;
  }

  v25 = 0;
  v26 = 0;
  v18 = 0;
LABEL_42:
  v38 = [v3 messageItem];
  v39 = [v38 expressiveSendStyleID];
  if ([v39 isEqualToString:*MEMORY[0x1E4F6D4E0]])
  {
    v40 = CKFrameworkBundle();
    uint64_t v41 = [v40 localizedStringForKey:@"SUMMARY_INVISIBLE_INK_MESSAGE" value:&stru_1EDE4CA38 table:@"ChatKit"];

    v18 = (void *)v41;
  }
  v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithAssociatedMessageSummary:v18 contentType:v7 associatedMessagePartText:v26 pluginBundleID:v13 pluginDisplayName:v25];

  return v42;
}

- (id)_relevantLanguageIdentifierForLocalization
{
  v0 = [MEMORY[0x1E4F42F18] currentInputMode];
  v1 = [v0 primaryLanguage];

  return v1;
}

- (uint64_t)sendMessageAcknowledgment:()CKMessageAcknowledgment forChatItem:
{
  return [a1 sendMessageAcknowledgment:a3 forChatItem:a4 languageIdentifier:0];
}

- (void)sendMessageAcknowledgment:()CKMessageAcknowledgment forChatItem:languageIdentifier:
{
  v8 = (void *)MEMORY[0x1E4F6EA80];
  id v9 = a5;
  id v10 = a4;
  id v11 = [v8 tapbackWithAssociatedMessageType:a3];
  [v11 setLanguageIdentifier:v9];
  [a1 sendTapback:v11 forChatItem:v10 languageIdentifier:v9];
}

- (uint64_t)sendMessageAcknowledgment:()CKMessageAcknowledgment forChatItem:withGuid:
{
  return [a1 sendMessageAcknowledgment:a3 forChatItem:a4 languageIdentifier:0];
}

- (uint64_t)sendTapback:()CKMessageAcknowledgment forChatItem:
{
  return [a1 sendTapback:a3 forChatItem:a4 languageIdentifier:0];
}

- (void)sendTapback:()CKMessageAcknowledgment forChatItem:languageIdentifier:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    id v10 = [a1 _relevantLanguageIdentifierForLocalization];
  }
  [v8 setLanguageIdentifier:v10];
  if ([v9 isEditedMessageHistory])
  {
    id v11 = IMLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[IMChat(CKMessageAcknowledgment) sendTapback:forChatItem:languageIdentifier:](v11, v12, v13, v14, v15, v16, v17, v18);
    }
    goto LABEL_16;
  }
  id v19 = [v9 IMChatItem];

  if (v19)
  {
    v20 = [v9 IMChatItem];
    id v73 = v8;
    id v21 = objc_alloc(MEMORY[0x1E4F6BDE8]);
    v22 = [v20 guid];
    uint64_t v23 = [v20 originalMessagePartRange];
    uint64_t v25 = v24;
    [(id)objc_opt_class() configureMessageSummaryInfoForChatItem:v9];
    id v26 = v10;
    id v27 = v9;
    v29 = v28 = a1;
    v30 = [v20 threadIdentifierForTapback];
    v31 = v21;
    id v8 = v73;
    v32 = v28;
    id v9 = v27;
    id v10 = v26;
    id v11 = objc_msgSend(v31, "initWithTapback:chat:messageGUID:messagePartRange:messageSummaryInfo:threadIdentifier:", v73, v32, v22, v23, v25, v29, v30);

    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_13:
    v53 = IMLogHandleForCategory();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
      -[IMChat(CKMessageAcknowledgment) sendTapback:forChatItem:languageIdentifier:](v53, v54, v55, v56, v57, v58, v59, v60);
    }

    id v11 = 0;
    goto LABEL_16;
  }
  id v33 = v9;
  v34 = [v33 mediaObject];
  v35 = [v34 transfer];
  v36 = [v35 attributionInfo];

  v37 = [v36 objectForKey:*MEMORY[0x1E4F6D3F0]];
  v74 = v36;
  v38 = [v36 objectForKey:*MEMORY[0x1E4F6D420]];
  [v38 unsignedIntValue];

  v39 = [v33 parentGUID];
  [a1 createIMChatItemForTransientAttachmentWithAssetUUID:v37 parentChatItemGUID:v39];
  v40 = IMFauxMessageGUIDForTapbackOfCMMAssetAtIndexInParentMessageGUID();
  uint64_t v41 = [v33 IMChatItem];
  if (v41)
  {
    id v70 = objc_alloc(MEMORY[0x1E4F6BDE8]);
    v72 = v37;
    uint64_t v42 = [v41 originalMessagePartRange];
    uint64_t v69 = v43;
    [(id)objc_opt_class() configureMessageSummaryInfoForChatItem:v33];
    id v44 = v10;
    id v45 = v9;
    id v47 = v46 = a1;
    [v41 threadIdentifierForTapback];
    v71 = v39;
    id v48 = v33;
    v50 = v49 = v40;
    v51 = v46;
    id v9 = v45;
    id v10 = v44;
    uint64_t v52 = v42;
    v37 = v72;
    id v11 = objc_msgSend(v70, "initWithTapback:chat:messageGUID:messagePartRange:messageSummaryInfo:threadIdentifier:", v8, v51, v49, v52, v69, v47, v50);

    v40 = v49;
    id v33 = v48;
    v39 = v71;
  }
  else
  {
    v61 = IMLogHandleForCategory();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
      -[IMChat(CKMessageAcknowledgment) sendTapback:forChatItem:languageIdentifier:](v61, v62, v63, v64, v65, v66, v67, v68);
    }

    id v11 = 0;
  }

  if (v41)
  {
LABEL_8:
    if (v11)
    {
      [v11 send];
      goto LABEL_16;
    }
    goto LABEL_13;
  }
LABEL_16:
}

- (void)sendTapback:()CKMessageAcknowledgment forChatItem:languageIdentifier:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)sendTapback:()CKMessageAcknowledgment forChatItem:languageIdentifier:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)sendTapback:()CKMessageAcknowledgment forChatItem:languageIdentifier:.cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end