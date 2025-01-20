@interface IMDRelayUtilities
+ (id)loadDataForTransfer:(id)a3;
+ (id)plainTextRelayPartWithString:(id)a3 index:(int64_t)a4;
+ (id)relayPartsFor:(id)a3 overridingAttachmentData:(id)a4;
@end

@implementation IMDRelayUtilities

+ (id)relayPartsFor:(id)a3 overridingAttachmentData:(id)a4
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 fileTransferGUIDs];
  uint64_t v9 = [v8 count];

  if (!v9)
  {
    v11 = +[IMDTelephonyServiceSession getPlainTextForMessage:v6 processedMessageItem:v6];
    v42[0] = @"text/plain";
    v41[0] = IMDCTPartDictionaryContentTypeKey;
    v41[1] = IMDCTPartDictionaryContentDataKey;
    v13 = [(__CFString *)v11 dataUsingEncoding:4];
    v42[1] = v13;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:2];
    v43[0] = v16;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:1];

    goto LABEL_27;
  }
  v10 = [v6 fileTransferGUIDs];
  v11 = [v10 firstObject];

  v12 = +[IMDAttachmentStore sharedInstance];
  v13 = [v12 attachmentWithGUID:v11];

  if (!v13)
  {
    if (IMOSLoggingEnabled())
    {
      v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v38 = v11;
        _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "No transfer found for %@", buf, 0xCu);
      }
      goto LABEL_12;
    }
LABEL_13:
    v17 = 0;
    goto LABEL_27;
  }
  if ([v13 isInThumbnailState])
  {
    if (IMOSLoggingEnabled())
    {
      v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = [v13 guid];
        *(_DWORD *)buf = 138412290;
        v38 = v15;
        _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Transfer found in thumbnail state, aborting relay %@", buf, 0xCu);
      }
LABEL_12:

      goto LABEL_13;
    }
    goto LABEL_13;
  }
  if (v7)
  {
    id v29 = v7;
  }
  else
  {
    id v29 = [a1 loadDataForTransfer:v13];
    if (!v29)
    {
      if (!IMOSLoggingEnabled()) {
        goto LABEL_13;
      }
      v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v38 = @"YES";
        __int16 v39 = 2112;
        v40 = @"NO";
        _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "No transfer(%@) or data(%@) found ", buf, 0x16u);
      }
      goto LABEL_12;
    }
  }
  v35[0] = IMDCTPartDictionaryContentTypeKey;
  v18 = objc_msgSend(v13, "mimeType", v29);
  if (v18)
  {
    v19 = [v13 mimeType];
  }
  else
  {
    v19 = @"application/octet-stream";
  }
  v36[0] = v19;
  v36[1] = @"0.file";
  v35[1] = IMDCTPartDictionaryContentIDKey;
  v35[2] = IMDCTPartDictionaryContentLocationKey;
  v20 = [v13 filename];
  v21 = [v20 lastPathComponent];
  v36[2] = v21;
  v35[3] = IMDCTPartDictionaryContentDataKey;
  v36[3] = v30;
  v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:4];

  if (v18) {
  v34 = v22;
  }
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
  CreateSMILStringForMessageParts(v23);
  v24 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled())
  {
    v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v24;
      _os_log_impl(&dword_1D967A000, v25, OS_LOG_TYPE_INFO, "Generated SMIL string: %@", buf, 0xCu);
    }
  }
  v32[0] = IMDCTPartDictionaryContentTypeKey;
  v32[1] = IMDCTPartDictionaryContentIDKey;
  v33[0] = IMDCTPartDictionaryContentTypeSMILKey;
  v33[1] = @"0.smil";
  v32[2] = IMDCTPartDictionaryContentDataKey;
  v26 = [(__CFString *)v24 dataUsingEncoding:4];
  v33[2] = v26;
  v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:3];

  v31[0] = v27;
  v31[1] = v22;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];

LABEL_27:

  return v17;
}

+ (id)plainTextRelayPartWithString:(id)a3 index:(int64_t)a4
{
  id v4 = a3;
  if ([v4 length])
  {
    v5 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    CFDictionarySetValue(v5, IMDCTPartDictionaryContentTypeKey, @"text/plain");
    id v6 = [v4 dataUsingEncoding:4];
    if (v6) {
      CFDictionarySetValue(v5, IMDCTPartDictionaryContentDataKey, v6);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)loadDataForTransfer:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1C9B8];
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = [v4 localPath];

  id v7 = (void *)[v5 initWithContentsOfFile:v6];

  return v7;
}

@end