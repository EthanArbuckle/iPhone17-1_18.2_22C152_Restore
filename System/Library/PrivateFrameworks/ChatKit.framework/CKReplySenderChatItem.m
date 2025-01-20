@interface CKReplySenderChatItem
- (UIEdgeInsets)contentInsets;
- (char)transcriptOrientation;
- (double)_calculateAdditionalOffsetForTapbackWithNextItem:(id)a3 previousItem:(id)a4 associatedChatItem:(id)a5;
- (id)layoutItemSpacingWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6 sizeOverride:(CGSize)a7;
- (id)loadTranscriptText;
@end

@implementation CKReplySenderChatItem

- (UIEdgeInsets)contentInsets
{
  v2 = +[CKUIBehavior sharedBehaviors];
  [v2 replySenderTranscriptInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (char)transcriptOrientation
{
  return 0;
}

- (id)loadTranscriptText
{
  double v3 = +[CKUIBehavior sharedBehaviors];
  double v4 = [v3 senderTranscriptTextAttributes];

  double v5 = [(CKChatItem *)self IMChatItem];
  double v6 = [v5 handle];

  double v7 = [v6 name];
  double v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    double v10 = CKFrameworkBundle();
    id v9 = [v10 localizedStringForKey:@"Unknown" value:&stru_1EDE4CA38 table:@"ChatKit"];
  }
  double v11 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v9 attributes:v4];

  return v11;
}

- (id)layoutItemSpacingWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6 sizeOverride:(CGSize)a7
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  id v11 = a5;
  id v36 = a6;
  if (a4 < 1)
  {
    double v12 = 0;
  }
  else
  {
    double v12 = objc_msgSend(v11, "objectAtIndexedSubscript:", a4 - 1, v34, v36);
  }
  unint64_t v13 = a4 + 1;
  if (v13 >= objc_msgSend(v11, "count", v34))
  {
    double v14 = 0;
  }
  else
  {
    double v14 = [v11 objectAtIndexedSubscript:v13];
  }
  switch([v12 layoutType])
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 7:
    case 12:
    case 14:
    case 17:
      v15 = +[CKUIBehavior sharedBehaviors];
      goto LABEL_9;
    case 13:
      v15 = +[CKUIBehavior sharedBehaviors];
      [v15 largeTranscriptSpace];
      goto LABEL_10;
    case 15:
      int v31 = [(CKChatItem *)self itemIsFromMe];
      if (v31 == [v12 itemIsFromMe])
      {
        BOOL v32 = [v12 replyCount] == 1;
        v33 = +[CKUIBehavior sharedBehaviors];
        v15 = v33;
        if (v32) {
          [v33 xsTranscriptSpace];
        }
        else {
LABEL_9:
        }
          [v15 mediumTranscriptSpace];
      }
      else
      {
        v15 = +[CKUIBehavior sharedBehaviors];
        [v15 minTranscriptSpace];
      }
      goto LABEL_10;
    case 18:
      v15 = +[CKUIBehavior sharedBehaviors];
      [v15 smallTranscriptSpace];
LABEL_10:
      double v17 = v16;

      break;
    default:
      if (IMOSLoggingEnabled())
      {
        v26 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          id v27 = (id)objc_opt_class();
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = v27;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = objc_opt_class();
          id v28 = *(id *)&buf[14];
          _os_log_impl(&dword_18EF18000, v26, OS_LOG_TYPE_INFO, "CKChatItem_Layout: %@ shouldn't follow %@", buf, 0x16u);
        }
      }
      v29 = +[CKUIBehavior sharedBehaviors];
      [v29 smallTranscriptSpace];
      double v17 = v30;

      break;
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v18 = [v14 visibleAssociatedMessageChatItems];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v38;
    while (2)
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v38 != v20) {
          objc_enumerationMutation(v18);
        }
        v22 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        uint64_t v43 = 0;
        long long v42 = 0u;
        memset(buf, 0, sizeof(buf));
        if (v22)
        {
          [v22 geometryDescriptor];
          if (*(void *)buf == 10)
          {
            +[CKChatItemLayoutUtilities transcriptTapbackMinSpacingForSenderChatItem:self withNextChatItem:v14 previousItem:v12 associatedChatItem:v22];
            if (v23 >= v17) {
              double v17 = v23;
            }
            goto LABEL_23;
          }
        }
      }
      uint64_t v19 = [v18 countByEnumeratingWithState:&v37 objects:v44 count:16];
      if (v19) {
        continue;
      }
      break;
    }
  }
LABEL_23:

  v24 = +[CKChatItemLayoutUtilities transcriptVerticalEdgeSpacingForChatItem:self previousChatItem:v12 topSpacing:v17 bottomSpacing:0.0];

  return v24;
}

- (double)_calculateAdditionalOffsetForTapbackWithNextItem:(id)a3 previousItem:(id)a4 associatedChatItem:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = +[CKUIBehavior sharedBehaviors];
  [v9 messageAcknowledgmentTranscriptBalloonRelativePosition];
  double v11 = v10;
  double v13 = v12;

  [(CKChatItem *)self size];
  double v15 = v14;
  [v8 size];
  double v17 = v16 - v11;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  double v19 = 0.0;
  if (v15 < v17 && (isKindOfClass & 1) != 0)
  {
    [v7 size];
    double v21 = v13 + v20;
    [(CKChatItem *)self size];
    double v23 = v21 - v22;
    v24 = +[CKUIBehavior sharedBehaviors];
    [v24 smallTranscriptSpace];
    double v19 = v23 + v25;
  }
  return v19;
}

@end