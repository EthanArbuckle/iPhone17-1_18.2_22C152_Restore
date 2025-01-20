@interface IMDAttachmentSyndicationUtilities
+ (BOOL)_attachmentGUIDIsSyndicatable:(id)a3 syndicationIdentifier:(id)a4 attachmentUTI:(id)a5 attributedBody:(id)a6 encodedSyndicationRanges:(id)a7 isCMM:(BOOL)a8 verbose:(BOOL)a9;
+ (BOOL)attachmentRecordIsSyndicatable:(id)a3 verbose:(BOOL)a4;
+ (id)_syndicationIdentifierForAttachmentGUID:(id)a3 messageGUID:(id)a4 attributedBody:(id)a5 verbose:(BOOL)a6;
+ (unint64_t)_attachmentSyndicationTypeForAttachmentGUID:(id)a3 syndicationIdentifier:(id)a4 attachmentUTI:(id)a5 attributedBody:(id)a6 encodedSyndicationRanges:(id)a7 isCommSafetySensitive:(BOOL)a8 verbose:(BOOL)a9;
+ (unint64_t)syndicationTypeForAttachmentRecord:(id)a3 verbose:(BOOL)a4;
+ (void)_attachmentGUIDForCMMIsSyndicatable:(id)a3 syndicationIdentifier:(id)a4 encodedSyndicationRanges:(id)a5 isSyndicatable:(BOOL *)a6 verbose:(BOOL)a7;
@end

@implementation IMDAttachmentSyndicationUtilities

+ (id)_syndicationIdentifierForAttachmentGUID:(id)a3 messageGUID:(id)a4 attributedBody:(id)a5 verbose:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!IMFileTransferGUIDIsTemporary())
  {
    if (v6 && IMOSLoggingEnabled())
    {
      v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        int v18 = 138412290;
        id v19 = v9;
        _os_log_impl(&dword_1AFB53000, v15, OS_LOG_TYPE_INFO, "Using existing attachment GUID for syndication identifier. attachmentGUID: %@", (uint8_t *)&v18, 0xCu);
      }
    }
    id v16 = v9;
    goto LABEL_18;
  }
  if (v6 && IMOSLoggingEnabled())
  {
    v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v18 = 138412290;
      id v19 = v9;
      _os_log_impl(&dword_1AFB53000, v12, OS_LOG_TYPE_INFO, "Deriving attachment index because attachment GUID in item dictionary is in legacy format. attachmentGUID: %@", (uint8_t *)&v18, 0xCu);
    }
  }
  if ([MEMORY[0x1E4F6E850] messagePartIndexForAttachmentMessagePartWithTransferGUID:v9 inBody:v11] != 0x7FFFFFFFFFFFFFFFLL)
  {
    IMFileTransferGUIDForAttachmentMessagePartAtMessageGUIDAndMessagePartIndex();
    id v16 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:
    v14 = v16;
    goto LABEL_19;
  }
  v13 = IMLogHandleForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_1AFC6BD68((uint64_t)v9, v13);
  }

  v14 = 0;
LABEL_19:

  return v14;
}

+ (BOOL)_attachmentGUIDIsSyndicatable:(id)a3 syndicationIdentifier:(id)a4 attachmentUTI:(id)a5 attributedBody:(id)a6 encodedSyndicationRanges:(id)a7 isCMM:(BOOL)a8 verbose:(BOOL)a9
{
  BOOL v9 = a8;
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  unsigned __int8 v54 = 1;
  if (v9)
  {
    [a1 _attachmentGUIDForCMMIsSyndicatable:v15 syndicationIdentifier:v16 encodedSyndicationRanges:v19 isSyndicatable:&v54 verbose:a9];
    int v20 = v54;
  }
  else
  {
    id v38 = v17;
    uint64_t v48 = 0;
    v49 = &v48;
    uint64_t v50 = 0x3032000000;
    v51 = sub_1AFBE4F38;
    v52 = sub_1AFBE4F48;
    id v53 = 0;
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = sub_1AFBE4F50;
    v43[3] = &unk_1E5F967D0;
    id v37 = v15;
    id v44 = v37;
    BOOL v47 = a9;
    id v36 = v16;
    id v45 = v36;
    v46 = &v48;
    objc_msgSend(v18, "__im_visitMessageParts:", v43);
    uint64_t v21 = [(id)v49[5] messagePartRange];
    uint64_t v23 = v22;
    if (v21 | v22)
    {
      id v35 = v15;
      [MEMORY[0x1E4F6E880] rangesFromSerializedString:v19];
      id v34 = v18;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      v24 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v25 = [v24 countByEnumeratingWithState:&v39 objects:v59 count:16];
      if (v25)
      {
        uint64_t v26 = *(void *)v40;
        while (2)
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v40 != v26) {
              objc_enumerationMutation(v24);
            }
            v28 = *(void **)(*((void *)&v39 + 1) + 8 * i);
            if ([v28 messagePartRange] == v21 && v29 == v23)
            {
              id v18 = v34;
              id v15 = v35;
              id v17 = v38;
              if (([v28 syndicationType] & 4) != 0)
              {
                unsigned __int8 v54 = 0;
                if (a9)
                {
                  if (IMOSLoggingEnabled())
                  {
                    v31 = OSLogHandleForIMFoundationCategory();
                    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412290;
                      id v56 = v37;
                      _os_log_impl(&dword_1AFB53000, v31, OS_LOG_TYPE_INFO, "%@ not syndicatable because it was explcitly hidden", buf, 0xCu);
                    }
                  }
                  if (IMOSLoggingEnabled())
                  {
                    v32 = OSLogHandleForIMFoundationCategory();
                    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412546;
                      id v56 = v37;
                      __int16 v57 = 2112;
                      id v58 = v36;
                      _os_log_impl(&dword_1AFB53000, v32, OS_LOG_TYPE_INFO, "Setting isSyndicatableMedia to be NO because the attachment is flagged as IMMessagePartSyndicationTypeHidden. attachmentGUID: %@ (syndicationIdentifier: %@)", buf, 0x16u);
                    }
                  }
                }
              }

              int v20 = v54;
              goto LABEL_30;
            }
          }
          uint64_t v25 = [v24 countByEnumeratingWithState:&v39 objects:v59 count:16];
          if (v25) {
            continue;
          }
          break;
        }
      }

      id v18 = v34;
      id v15 = v35;
      id v17 = v38;
    }
    else
    {
      v24 = IMLogHandleForCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_1AFC6BDE0((uint64_t)v37, (uint64_t)v36, v24);
      }
    }
    int v20 = 1;
LABEL_30:

    _Block_object_dispose(&v48, 8);
  }

  return v20 != 0;
}

+ (void)_attachmentGUIDForCMMIsSyndicatable:(id)a3 syndicationIdentifier:(id)a4 encodedSyndicationRanges:(id)a5 isSyndicatable:(BOOL *)a6 verbose:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  v33 = a4;
  id v12 = a5;
  v13 = [MEMORY[0x1E4F6E880] rangesFromSerializedString:v12];
  v14 = v13;
  if (v13 && [v13 count])
  {
    id v15 = [v14 firstObject];
    id v16 = [v15 assetDescriptor];
    id v17 = v16;
    id v18 = v11;
    if (v16
      && ([v16 assetSyndications], (id v19 = objc_claimAutoreleasedReturnValue()) != 0)
      && ([v17 assetSyndications],
          int v20 = objc_claimAutoreleasedReturnValue(),
          uint64_t v21 = [v20 count],
          v20,
          v19,
          v21))
    {
      uint64_t v32 = IMCMMAssetIndexFromIMFileTransferGUID();
      uint64_t v22 = [v17 assetSyndications];
      id v11 = v18;
      uint64_t v23 = [v22 objectForKey:&unk_1F0864F08];

      if (v23 && [v23 count])
      {
        uint64_t v24 = [MEMORY[0x1E4F28ED0] numberWithInteger:v32];
        uint64_t v25 = [v23 objectForKey:v24];
        uint64_t v26 = (void *)v24;
        v27 = v25;

        char v28 = [v27 intValue];
        if (v27)
        {
          if (a6)
          {
            *a6 = (v28 & 4) == 0;
            if (v7)
            {
              if (IMOSLoggingEnabled())
              {
                uint64_t v29 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
                {
                  BOOL v30 = *a6;
                  *(_DWORD *)buf = 138412802;
                  id v35 = (const char *)v18;
                  __int16 v36 = 2112;
                  uint64_t v37 = (uint64_t)v33;
                  __int16 v38 = 1024;
                  LODWORD(v39) = v30;
                  _os_log_impl(&dword_1AFB53000, v29, OS_LOG_TYPE_INFO, "attachmentGUID %@, syndicationIdentifier %@, isSyndicatable: %d", buf, 0x1Cu);
                }
              }
            }
          }
        }
        else
        {
          v31 = IMLogHandleForCategory();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            id v35 = "+[IMDAttachmentSyndicationUtilities _attachmentGUIDForCMMIsSyndicatable:syndicationIdentifier:encodedS"
                  "yndicationRanges:isSyndicatable:verbose:]";
            __int16 v36 = 2048;
            uint64_t v37 = v32;
            __int16 v38 = 2112;
            long long v39 = v23;
            __int16 v40 = 2112;
            long long v41 = v18;
            __int16 v42 = 2112;
            v43 = v33;
            _os_log_error_impl(&dword_1AFB53000, v31, OS_LOG_TYPE_ERROR, "%s no syndication found for asset index %li from CMM asset info %@ for attachmentGUID %@, syndicationIdentifier %@", buf, 0x34u);
          }
        }
      }
      else
      {
        v27 = IMLogHandleForCategory();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315906;
          id v35 = "+[IMDAttachmentSyndicationUtilities _attachmentGUIDForCMMIsSyndicatable:syndicationIdentifier:encodedSyn"
                "dicationRanges:isSyndicatable:verbose:]";
          __int16 v36 = 2112;
          uint64_t v37 = (uint64_t)v23;
          __int16 v38 = 2112;
          long long v39 = v18;
          __int16 v40 = 2112;
          long long v41 = v33;
          _os_log_error_impl(&dword_1AFB53000, v27, OS_LOG_TYPE_ERROR, "%s no asset info from CMM asset info %@ for attachmentGUID %@, syndicationIdentifier %@", buf, 0x2Au);
        }
      }
    }
    else
    {
      uint64_t v23 = IMLogHandleForCategory();
      id v11 = v18;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        id v35 = "+[IMDAttachmentSyndicationUtilities _attachmentGUIDForCMMIsSyndicatable:syndicationIdentifier:encodedSyndi"
              "cationRanges:isSyndicatable:verbose:]";
        __int16 v36 = 2112;
        uint64_t v37 = (uint64_t)v15;
        __int16 v38 = 2112;
        long long v39 = v18;
        __int16 v40 = 2112;
        long long v41 = v33;
        _os_log_error_impl(&dword_1AFB53000, v23, OS_LOG_TYPE_ERROR, "%s no asset syndications from range %@ for attachmentGUID %@, syndicationIdentifier %@", buf, 0x2Au);
      }
    }
  }
  else
  {
    id v15 = IMLogHandleForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      id v35 = "+[IMDAttachmentSyndicationUtilities _attachmentGUIDForCMMIsSyndicatable:syndicationIdentifier:encodedSyndica"
            "tionRanges:isSyndicatable:verbose:]";
      __int16 v36 = 2112;
      uint64_t v37 = (uint64_t)v12;
      __int16 v38 = 2112;
      long long v39 = v11;
      __int16 v40 = 2112;
      long long v41 = v33;
      _os_log_error_impl(&dword_1AFB53000, v15, OS_LOG_TYPE_ERROR, "%s no ranges deserialized from encodedSyndicationRanges %@ for attachmentGUID %@, syndicationIdentifier %@", buf, 0x2Au);
    }
  }
}

+ (unint64_t)_attachmentSyndicationTypeForAttachmentGUID:(id)a3 syndicationIdentifier:(id)a4 attachmentUTI:(id)a5 attributedBody:(id)a6 encodedSyndicationRanges:(id)a7 isCommSafetySensitive:(BOOL)a8 verbose:(BOOL)a9
{
  BOOL v9 = a8;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (!v16)
  {
LABEL_13:
    unint64_t v19 = 2;
    goto LABEL_14;
  }
  if (IMUTITypeIsSupportedByPhotos())
  {
    unint64_t v19 = 1;
    goto LABEL_14;
  }
  int IsFileAttachment = IMUTITypeIsFileAttachment();
  if (IsFileAttachment) {
    unint64_t v19 = 0;
  }
  else {
    unint64_t v19 = 2;
  }
  if ((IsFileAttachment & 1) == 0 && a9)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        int v26 = 138412546;
        unint64_t v27 = (unint64_t)v14;
        __int16 v28 = 2112;
        id v29 = v16;
        _os_log_impl(&dword_1AFB53000, v21, OS_LOG_TYPE_INFO, "%@ not syndicatable because it was an unsupported UTI %@", (uint8_t *)&v26, 0x16u);
      }
    }
    goto LABEL_13;
  }
LABEL_14:
  if (a9)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        int v26 = 134218498;
        unint64_t v27 = v19;
        __int16 v28 = 2112;
        id v29 = v14;
        __int16 v30 = 2112;
        id v31 = v16;
        _os_log_impl(&dword_1AFB53000, v22, OS_LOG_TYPE_INFO, "syndicationType == %lu for attachmentGUID %@ based on UTI type %@", (uint8_t *)&v26, 0x20u);
      }
    }
    if (v9)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v23 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          int v26 = 138412290;
          unint64_t v27 = (unint64_t)v14;
          _os_log_impl(&dword_1AFB53000, v23, OS_LOG_TYPE_INFO, "%@ not syndicatable because it was comm safety sensitive", (uint8_t *)&v26, 0xCu);
        }
      }
      if (IMOSLoggingEnabled())
      {
        uint64_t v24 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          int v26 = 138412290;
          unint64_t v27 = (unint64_t)v14;
          _os_log_impl(&dword_1AFB53000, v24, OS_LOG_TYPE_INFO, "Setting syndicationType to be Other because the attachment is flagged as CommSafety sensitive. attachmentGUID: %@", (uint8_t *)&v26, 0xCu);
        }
      }
      unint64_t v19 = 2;
    }
  }
  else if (v9)
  {
    unint64_t v19 = 2;
  }

  return v19;
}

+ (unint64_t)syndicationTypeForAttachmentRecord:(id)a3 verbose:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int v20 = [v6 messageRecord];
  BOOL v7 = IMDCreateIMItemFromIMDMessageRecordRefWithAccountLookup(v20, 0, 0, 0);
  v8 = [v7 body];
  BOOL v9 = (void *)MEMORY[0x1E4F6E880];
  id v10 = [v7 syndicationRanges];
  id v11 = [v9 serializedStringFromArray:v10];

  id v12 = [v6 guid];
  v13 = [v7 guid];
  id v14 = [a1 _syndicationIdentifierForAttachmentGUID:v12 messageGUID:v13 attributedBody:v8 verbose:v4];

  id v15 = [v6 utiString];
  uint64_t v16 = [v6 isCommSafetySensitive];

  LOBYTE(v19) = v4;
  unint64_t v17 = [a1 _attachmentSyndicationTypeForAttachmentGUID:v12 syndicationIdentifier:v14 attachmentUTI:v15 attributedBody:v8 encodedSyndicationRanges:v11 isCommSafetySensitive:v16 verbose:v19];

  return v17;
}

+ (BOOL)attachmentRecordIsSyndicatable:(id)a3 verbose:(BOOL)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  BOOL v7 = [v6 messageRecord];
  v8 = IMDCreateIMItemFromIMDMessageRecordRefWithAccountLookup(v7, 0, 0, 0);
  BOOL v9 = [v8 body];
  id v10 = (void *)MEMORY[0x1E4F6E880];
  id v11 = [v8 syndicationRanges];
  id v12 = [v10 serializedStringFromArray:v11];

  v13 = [v6 guid];
  id v14 = [v8 guid];
  id v15 = [a1 _syndicationIdentifierForAttachmentGUID:v13 messageGUID:v14 attributedBody:v9 verbose:v4];

  uint64_t v16 = [v6 utiString];

  LOBYTE(v18) = v4;
  LOBYTE(v4) = [a1 _attachmentGUIDIsSyndicatable:v13 syndicationIdentifier:v15 attachmentUTI:v16 attributedBody:v9 encodedSyndicationRanges:v12 isCMM:0 verbose:v18];

  return v4;
}

@end