@interface CKMessageRetractionChatItem
- (BOOL)canBeSelectedInEditMode;
- (BOOL)hasSelectableText;
- (BOOL)isRetractedReply;
- (BOOL)isRetractedReplyThreadOriginator;
- (UIEdgeInsets)contentInsets;
- (id)_loadTranscriptTextWithRetractionUnsupportedCount:(unint64_t)a3 unsupportedNames:(id)a4 isFromMe:(BOOL)a5 isFailedRetraction:(BOOL)a6 senderName:(id)a7;
- (id)_retractionUnsupportedByNamesFromHandles:(id)a3;
- (id)loadTranscriptText;
@end

@implementation CKMessageRetractionChatItem

- (BOOL)hasSelectableText
{
  v2 = [(CKChatItem *)self IMChatItem];
  char v3 = [v2 isFailedRetraction];

  return v3;
}

- (id)_retractionUnsupportedByNamesFromHandles:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "_displayNameWithAbbreviation", (void)v14);
        v11 = v10;
        if (v10 && [v10 length]) {
          [v4 addObject:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  v12 = (void *)[v4 copy];

  return v12;
}

- (id)_loadTranscriptTextWithRetractionUnsupportedCount:(unint64_t)a3 unsupportedNames:(id)a4 isFromMe:(BOOL)a5 isFailedRetraction:(BOOL)a6 senderName:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v11 = a4;
  id v12 = a7;
  v13 = +[CKUIBehavior sharedBehaviors];
  long long v14 = [v13 transcriptRegularPreferredFontAttributes];

  long long v15 = +[CKUIBehavior sharedBehaviors];
  long long v16 = [v15 transcriptEmphasizedPreferredFontAttributes];

  if (!v9)
  {
    CKFrameworkBundle();
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    v21 = [v17 localizedStringForKey:@"MESSAGE_RETRACTED_BY_PERSON_STATUS" value:&stru_1EDE4CA38 table:@"ChatKit"];
    CKAttributedFormatString(v14, v16, v21, v22, v23, v24, v25, v26, (uint64_t)v12);
    v27 = LABEL_8:;
    v28 = 0;
    goto LABEL_22;
  }
  if (!a3)
  {
    v29 = CKFrameworkBundle();
    id v17 = v29;
    if (v8)
    {
      v28 = [v29 localizedStringForKey:@"MESSAGE_RETRACTED_BY_ME_RETRACTION_FAILED_STATUS_ERROR_SUBSTRING_HARDSPACE" value:&stru_1EDE4CA38 table:@"ChatKit"];

      CKFrameworkBundle();
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      v21 = [v17 localizedStringForKey:@"MESSAGE_RETRACTED_BY_ME_RETRACTION_FAILED_STATUS" value:&stru_1EDE4CA38 table:@"ChatKit"];
      v27 = CKAttributedFormatString(v14, v16, v21, v30, v31, v32, v33, v34, (uint64_t)v28);
      goto LABEL_22;
    }
    v21 = [v29 localizedStringForKey:@"MESSAGE_RETRACTED_BY_ME_STATUS" value:&stru_1EDE4CA38 table:@"ChatKit"];
    CKAttributedFormatString(v14, v16, v21, v77, v78, v79, v80, v81, 0);
    goto LABEL_8;
  }
  id v17 = v11;
  if ((unint64_t)[v17 count] >= 4)
  {
    uint64_t v18 = objc_msgSend(v17, "subarrayWithRange:", 0, 2);

    id v17 = (id)v18;
  }
  uint64_t v19 = [v17 count];
  unint64_t v20 = a3 - v19;
  id v84 = v12;
  id v86 = v11;
  if (a3 != v19)
  {
    v35 = NSString;
    v36 = CKFrameworkBundle();
    v37 = [v36 localizedStringForKey:@"N_OTHER_PEOPLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v38 = objc_msgSend(v35, "localizedStringWithFormat:", v37, v20);

    v39 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v40 = [v39 userInterfaceLayoutDirection];

    if (v40 == 1) {
      v41 = @"\u200F";
    }
    else {
      v41 = @"\u200E";
    }
    v42 = [(__CFString *)v41 stringByAppendingString:v38];

    uint64_t v43 = [v17 arrayByAddingObject:v42];

    id v17 = (id)v43;
  }
  v21 = [MEMORY[0x1E4F28DF8] localizedStringByJoiningStrings:v17];
  if (v8)
  {
    v44 = CKFrameworkBundle();
    v28 = [v44 localizedStringForKey:@"MESSAGE_RETRACTED_BY_ME_WITH_UNSUPPORTED_RECIPIENTS_AND_RETRACTION_FAILED_STATUS_ERROR_SUBSTRING_HARDSPACE" value:&stru_1EDE4CA38 table:@"ChatKit"];

    v45 = NSString;
    v46 = CKFrameworkBundle();
    v47 = [v46 localizedStringForKey:@"MESSAGE_RETRACTED_BY_ME_WITH_N_UNSUPPORTED_RECIPIENTS_AND_RETRACTION_FAILED_STATUS" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v48 = objc_msgSend(v45, "localizedStringWithFormat:", v47, a3, v21, v28);
  }
  else
  {
    v49 = NSString;
    v46 = CKFrameworkBundle();
    v47 = [v46 localizedStringForKey:@"MESSAGE_RETRACTED_BY_ME_WITH_N_UNSUPPORTED_RECIPIENTS_STATUS" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v48 = objc_msgSend(v49, "localizedStringWithFormat:", v47, a3, v21);
    v28 = 0;
  }

  v50 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v51 = [v50 userInterfaceLayoutDirection];

  if (v51 == 1) {
    v52 = @"\u200F";
  }
  else {
    v52 = @"\u200E";
  }
  v53 = [(__CFString *)v52 stringByAppendingString:v48];

  v27 = CKAttributedFormatString(v14, v16, v53, v54, v55, v56, v57, v58, 0);

  id v12 = v84;
  id v11 = v86;
LABEL_22:

  if (v27 && [v28 length])
  {
    id v85 = v12;
    id v87 = v11;
    v59 = [v27 string];
    uint64_t v60 = [v59 rangeOfString:v28];
    uint64_t v62 = v61;

    if (v60 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v12 = v85;
      id v11 = v87;
    }
    else
    {
      v82 = v14;
      v63 = (void *)[v27 mutableCopy];
      v64 = +[CKUIBehavior sharedBehaviors];
      uint64_t v65 = [v64 transcriptErrorStampPreferredFontAttributes];

      v83 = (void *)v65;
      objc_msgSend(v63, "setAttributes:range:", v65, v60, v62);
      v66 = [v63 string];
      uint64_t v67 = objc_msgSend(v66, "rangeOfString:options:range:", @"(!)", 0, v60, v62);
      uint64_t v69 = v68;

      if (v67 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v63, "replaceCharactersInRange:withString:", v67, v69, &stru_1EDE4CA38);
        id v70 = objc_alloc_init(MEMORY[0x1E4FB0870]);
        v71 = +[CKUIBehavior sharedBehaviors];
        v72 = [v71 messageStampWarningIconRed];

        [v70 setImage:v72];
        v73 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v70];
        v74 = (void *)[v73 mutableCopy];

        objc_msgSend(v74, "addAttributes:range:", v83, 0, objc_msgSend(v74, "length"));
        [v63 insertAttributedString:v74 atIndex:v67];
      }
      uint64_t v75 = [v63 copy];

      v27 = (void *)v75;
      id v12 = v85;
      id v11 = v87;
      long long v14 = v82;
    }
  }

  return v27;
}

- (id)loadTranscriptText
{
  id v3 = [(CKChatItem *)self IMChatItem];
  uint64_t v4 = [v3 isFromMe];
  id v5 = [v3 sender];
  uint64_t v6 = [v5 name];

  uint64_t v7 = [v3 isFailedRetraction];
  BOOL v8 = [v3 retractionUnsupportedByHandles];
  BOOL v9 = [(CKMessageRetractionChatItem *)self _retractionUnsupportedByNamesFromHandles:v8];
  v10 = -[CKMessageRetractionChatItem _loadTranscriptTextWithRetractionUnsupportedCount:unsupportedNames:isFromMe:isFailedRetraction:senderName:](self, "_loadTranscriptTextWithRetractionUnsupportedCount:unsupportedNames:isFromMe:isFailedRetraction:senderName:", [v8 count], v9, v4, v7, v6);

  return v10;
}

- (UIEdgeInsets)contentInsets
{
  BOOL v3 = [(CKMessageRetractionChatItem *)self isRetractedReply];
  BOOL v4 = [(CKMessageRetractionChatItem *)self isRetractedReplyThreadOriginator];
  id v5 = +[CKUIBehavior sharedBehaviors];
  uint64_t v6 = v5;
  if (v3 || v4) {
    [v5 retractedReplyStampInsets];
  }
  else {
    [v5 stampTranscriptInsets];
  }
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;
  double v14 = v10;

  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  double v18 = v14;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (BOOL)isRetractedReply
{
  v2 = [(CKMessageRetractionChatItem *)self imMessageRetractionChatItem];
  char v3 = [v2 itemIsReply];

  return v3;
}

- (BOOL)isRetractedReplyThreadOriginator
{
  v2 = [(CKMessageRetractionChatItem *)self imMessageRetractionChatItem];
  char v3 = [v2 itemIsThreadOriginator];

  return v3;
}

- (BOOL)canBeSelectedInEditMode
{
  return 0;
}

@end