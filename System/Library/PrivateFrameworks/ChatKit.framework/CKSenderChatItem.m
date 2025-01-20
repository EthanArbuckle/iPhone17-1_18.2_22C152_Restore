@interface CKSenderChatItem
- (BOOL)wantsDrawerLayout;
- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (Class)cellClass;
- (UIEdgeInsets)contentInsets;
- (char)transcriptOrientation;
- (id)cellIdentifier;
- (id)getAttributeTextForMessagesFromEmergencyUser:(id)a3 transcriptSharingMessageType:(int64_t)a4;
- (id)layoutItemSpacingWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6 sizeOverride:(CGSize)a7;
- (id)loadTranscriptText;
- (unint64_t)layoutType;
@end

@implementation CKSenderChatItem

- (unint64_t)layoutType
{
  return 6;
}

- (id)layoutItemSpacingWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6 sizeOverride:(CGSize)a7
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v42 = a3;
  id v11 = a5;
  id v12 = a6;
  int64_t v13 = a4 - 1;
  if (a4 < 1)
  {
    v14 = 0;
  }
  else
  {
    v14 = [v11 objectAtIndexedSubscript:a4 - 1];
  }
  if (a4 + 1 >= (unint64_t)[v11 count])
  {
    v15 = 0;
  }
  else
  {
    v15 = [v11 objectAtIndexedSubscript:a4 + 1];
  }
  BOOL v16 = +[CKChatItemLayoutUtilities nextItemIsOriginatorWithRepliesForIndex:a4 allDatasourceItems:v11];
  uint64_t v17 = [v14 layoutType];
  if (v16)
  {
    BOOL v18 = v17 == 7;
    v19 = +[CKUIBehavior sharedBehaviors];
    v20 = v19;
    if (v18) {
      [v19 mediumTranscriptSpace];
    }
    else {
      [v19 extraLargeTranscriptSpace];
    }
    double v22 = v21;
  }
  else
  {
    switch(v17)
    {
      case 1:
      case 2:
      case 3:
      case 7:
      case 8:
      case 10:
      case 11:
      case 13:
      case 14:
      case 17:
      case 23:
      case 24:
        v24 = +[CKUIBehavior sharedBehaviors];
        goto LABEL_18;
      case 4:
      case 5:
        BOOL v23 = +[CKChatItemLayoutUtilities prevMessageIsReplyForIndex:v13 allDatasourceItems:v11];
        v24 = +[CKUIBehavior sharedBehaviors];
        if (v23) {
          goto LABEL_42;
        }
        goto LABEL_18;
      case 12:
        v24 = +[CKUIBehavior sharedBehaviors];
LABEL_42:
        [v24 extraLargeTranscriptSpace];
        goto LABEL_19;
      case 15:
        int v25 = [(CKChatItem *)self itemIsFromMe];
        int v26 = [v14 itemIsFromMe];
        v27 = +[CKUIBehavior sharedBehaviors];
        v24 = v27;
        if (v25 != v26) {
          [v27 minTranscriptSpace];
        }
        else {
LABEL_18:
        }
          [v24 mediumTranscriptSpace];
        goto LABEL_19;
      case 18:
        v24 = +[CKUIBehavior sharedBehaviors];
        [v24 smallTranscriptSpace];
LABEL_19:
        double v22 = v28;

        break;
      default:
        if (IMOSLoggingEnabled())
        {
          v37 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            id v38 = (id)objc_opt_class();
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = v38;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = objc_opt_class();
            id v39 = *(id *)&buf[14];
            _os_log_impl(&dword_18EF18000, v37, OS_LOG_TYPE_INFO, "CKChatItem_Layout: %@ shouldn't follow %@", buf, 0x16u);
          }
        }
        v40 = +[CKUIBehavior sharedBehaviors];
        [v40 smallTranscriptSpace];
        double v22 = v41;

        break;
    }
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v29 = [v15 visibleAssociatedMessageChatItems];
    uint64_t v30 = [v29 countByEnumeratingWithState:&v43 objects:v50 count:16];
    if (v30)
    {
      uint64_t v31 = *(void *)v44;
      while (2)
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v44 != v31) {
            objc_enumerationMutation(v29);
          }
          v33 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          uint64_t v49 = 0;
          long long v48 = 0u;
          memset(buf, 0, sizeof(buf));
          if (v33)
          {
            [v33 geometryDescriptor];
            if (*(void *)buf == 10)
            {
              +[CKChatItemLayoutUtilities transcriptTapbackMinSpacingForSenderChatItem:self withNextChatItem:v15 previousItem:v14 associatedChatItem:v33];
              if (v34 >= v22) {
                double v22 = v34;
              }
              goto LABEL_32;
            }
          }
        }
        uint64_t v30 = [v29 countByEnumeratingWithState:&v43 objects:v50 count:16];
        if (v30) {
          continue;
        }
        break;
      }
    }
LABEL_32:
  }
  v35 = +[CKChatItemLayoutUtilities transcriptVerticalEdgeSpacingForChatItem:self previousChatItem:v14 topSpacing:v22 bottomSpacing:0.0];

  return v35;
}

- (UIEdgeInsets)contentInsets
{
  v2 = +[CKUIBehavior sharedBehaviors];
  [v2 senderTranscriptInsets];
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

- (Class)cellClass
{
  v2 = +[CKUIBehavior sharedBehaviors];
  [v2 isAccessibilityPreferredContentSizeCategory];
  id v3 = (id)objc_opt_class();

  return (Class)v3;
}

- (id)cellIdentifier
{
  v2 = [(CKChatItem *)self transcriptText];
  id v3 = [v2 string];

  return v3;
}

- (BOOL)wantsDrawerLayout
{
  v5.receiver = self;
  v5.super_class = (Class)CKSenderChatItem;
  if ([(CKChatItem *)&v5 wantsDrawerLayout])
  {
    v2 = +[CKUIBehavior sharedBehaviors];
    int v3 = [v2 timestampsPushBalloons] ^ 1;
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (id)getAttributeTextForMessagesFromEmergencyUser:(id)a3 transcriptSharingMessageType:(int64_t)a4
{
  id v5 = a3;
  if (!a4) {
    goto LABEL_7;
  }
  if (_IMWillLog())
  {
    double v12 = [NSNumber numberWithInteger:a4];
    _IMAlwaysLog();
  }
  if (a4 == 2)
  {
    double v10 = NSString;
    double v7 = CKFrameworkBundle();
    double v8 = [v7 localizedStringForKey:@"TS_EMERGENCY_USER_ATTRIBUTE_INFORMATION" value:&stru_1EDE4CA38 table:@"TranscriptSharing-SYDROB_FEATURES"];
    objc_msgSend(v10, "localizedStringWithFormat:", v8, v12);
    goto LABEL_9;
  }
  if (a4 != 1)
  {
LABEL_7:
    double v9 = 0;
    goto LABEL_10;
  }
  double v6 = NSString;
  double v7 = CKFrameworkBundle();
  double v8 = [v7 localizedStringForKey:@"TS_EMERGENCY_USER_ATTRIBUTE_MESSAGE" value:&stru_1EDE4CA38 table:@"TranscriptSharing-SYDROB_FEATURES"];
  objc_msgSend(v6, "localizedStringWithFormat:", v8, v5);
  double v9 = LABEL_9:;

LABEL_10:

  return v9;
}

- (id)loadTranscriptText
{
  int v3 = +[CKUIBehavior sharedBehaviors];
  double v4 = [v3 senderTranscriptTextAttributes];

  id v5 = [(CKChatItem *)self notification];

  if (v5)
  {
    double v6 = [(CKChatItem *)self notification];
    double v7 = [v6 request];
    double v8 = [v7 content];
    double v9 = [v8 title];
    double v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      v15 = CKFrameworkBundle();
      id v11 = [v15 localizedStringForKey:@"Unknown" value:&stru_1EDE4CA38 table:@"ChatKit"];
    }
  }
  else
  {
    double v6 = [(CKChatItem *)self IMChatItem];
    double v12 = [v6 handle];
    double v13 = [v12 name];
    double v14 = v13;
    if (v13)
    {
      id v11 = v13;
    }
    else
    {
      BOOL v16 = CKFrameworkBundle();
      id v11 = [v16 localizedStringForKey:@"Unknown" value:&stru_1EDE4CA38 table:@"ChatKit"];
    }
    uint64_t v17 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v18 = [v17 isTranscriptSharingEnabled];

    if (!v18 || ![v6 transcriptSharingMessageType]) {
      goto LABEL_14;
    }
    v19 = [v6 displayName];
    v20 = v19;
    if (v19)
    {
      id v21 = v19;
    }
    else
    {
      v24 = CKFrameworkBundle();
      id v21 = [v24 localizedStringForKey:@"Unknown" value:&stru_1EDE4CA38 table:@"ChatKit"];

      id v11 = v24;
    }

    int v25 = [v6 handle];
    int v26 = [v25 isStewieEmergencyServices];

    if (v26)
    {
      v27 = NSString;
      double v28 = CKFrameworkBundle();
      v29 = [v28 localizedStringForKey:@"TS_EMERGENCY_SERVICE_ATTRIBUTE_TEXT" value:&stru_1EDE4CA38 table:@"TranscriptSharing-SYDROB_FEATURES"];
      id v11 = [v27 localizedStringWithFormat:v29];

      double v7 = +[CKUIBehavior sharedBehaviors];
      [v7 stewieTranscriptEmergencyServiceAttributes];
    }
    else
    {
      -[CKSenderChatItem getAttributeTextForMessagesFromEmergencyUser:transcriptSharingMessageType:](self, "getAttributeTextForMessagesFromEmergencyUser:transcriptSharingMessageType:", v21, [v6 transcriptSharingMessageType]);
      id v11 = (id)objc_claimAutoreleasedReturnValue();

      double v7 = +[CKUIBehavior sharedBehaviors];
      [v7 stewieTranscriptEmergencyUserAttributes];
    }
    double v4 = v8 = v4;
  }

LABEL_14:
  double v22 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v11 attributes:v4];

  return v22;
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height = a3.height;
  double width = a3.width;
  if (a4)
  {
    double v8 = +[CKUIBehavior sharedBehaviors];
    [v8 transcriptBoldTextAlignmentInsets];
    a4->top = v9;
    a4->left = v10;
    a4->bottom = v11;
    a4->right = v12;
  }
  double v13 = +[CKUIBehavior sharedBehaviors];
  int v14 = [v13 isAccessibilityPreferredContentSizeCategory];

  if (v14)
  {
    v15 = [(objc_class *)[(CKSenderChatItem *)self cellClass] createStampLabelView];
    BOOL v16 = [(CKChatItem *)self transcriptText];
    [v15 setAttributedText:v16];

    objc_msgSend(v15, "sizeThatFits:", width, height);
    double v18 = v17;
    double v20 = v19;
  }
  else
  {
    id v21 = +[CKUIBehavior sharedBehaviors];
    [v21 balloonTranscriptInsets];
    double v23 = v22;
    double v25 = v24;

    int v26 = [(CKChatItem *)self transcriptText];
    objc_msgSend(v26, "boundingRectWithSize:options:context:", 3, 0, width, height);
    double v28 = v27;

    double v18 = v28 - (v23 + v25);
    v15 = +[CKUIBehavior sharedBehaviors];
    [v15 transcriptBoldTextHeight];
    double v20 = v29;
  }

  double v30 = v18;
  double v31 = v20;
  result.double height = v31;
  result.double width = v30;
  return result;
}

@end