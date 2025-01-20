@interface IMDSpotlightTextDataProvider
- (id)dataForGUID:(id)a3 error:(id *)a4;
- (id)typeIdentifier;
@end

@implementation IMDSpotlightTextDataProvider

- (id)typeIdentifier
{
  return @"com.apple.metadata-importer.messages.plain-text";
}

- (id)dataForGUID:(id)a3 error:(id *)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  v29 = (void *)[objc_alloc(MEMORY[0x1E4F6E868]) initWithEncodedMessagePartGUID:v4];
  if (v29)
  {
    v5 = [v29 messageGUID];
  }
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = sub_1AFBB5254;
  v39 = sub_1AFBB5264;
  id v40 = 0;
  v6 = +[IMDDatabase synchronousDatabase];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = sub_1AFBB526C;
  v34[3] = &unk_1E5F95320;
  v34[4] = &v35;
  [v6 fetchMessageRecordWithGUID:v5 excludeRecoverableMessages:1 completionHandler:v34];

  v7 = (void *)v36[5];
  if (v7)
  {
    v8 = [v7 attributedBodyText];
    if (v29)
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      v27 = (void *)[objc_alloc(MEMORY[0x1E4F6E830]) initWithMessageBody:v8 messageGUID:v5];
      v9 = [v27 messageParts];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v47 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v31 != v11) {
              objc_enumerationMutation(v9);
            }
            v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            v14 = [v13 messagePartGUIDForMessageGUID:v5];
            v15 = [v14 encodedMessagePartGUID];

            if ([v15 isEqualToString:v4])
            {
              uint64_t v16 = [v13 messagePartRange];
              uint64_t v18 = objc_msgSend(v8, "attributedSubstringFromRange:", v16, v17);

              v8 = (void *)v18;
            }
          }
          uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v47 count:16];
        }
        while (v10);
      }
    }
    v19 = [v8 string];
    v20 = _IMStringStrippingControlCharacters();

    v45 = @"text";
    v46 = v20;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
    v22 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v21 requiringSecureCoding:0 error:a4];
    if (IMOSLoggingEnabled())
    {
      v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v24 = a4;
        if (a4) {
          v24 = *a4;
        }
        *(_DWORD *)buf = 138412546;
        id v42 = v22;
        __int16 v43 = 2112;
        v44 = v24;
        _os_log_impl(&dword_1AFB53000, v23, OS_LOG_TYPE_INFO, "Returning data %@ to spotlight with error %@", buf, 0x16u);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v42 = v4;
        _os_log_impl(&dword_1AFB53000, v25, OS_LOG_TYPE_INFO, "Failed to find plain text for spotlight because no message was found for guid %@", buf, 0xCu);
      }
    }
    v22 = 0;
  }
  _Block_object_dispose(&v35, 8);

  return v22;
}

@end