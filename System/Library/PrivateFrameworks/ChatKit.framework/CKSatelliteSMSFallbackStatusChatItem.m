@interface CKSatelliteSMSFallbackStatusChatItem
- (BOOL)displayDuringSend;
- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (Class)cellClass;
- (NSAttributedString)smsFallbackStatusTitleLabelAttributedText;
- (UIEdgeInsets)contentInsets;
- (char)transcriptOrientation;
- (id)layoutItemSpacingWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6;
- (id)loadTranscriptText;
- (unint64_t)layoutType;
- (void)setSmsFallbackStatusTitleLabelAttributedText:(id)a3;
- (void)unloadTranscriptText;
@end

@implementation CKSatelliteSMSFallbackStatusChatItem

- (unint64_t)layoutType
{
  return 25;
}

- (id)layoutItemSpacingWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (a4 < 1)
  {
    v13 = 0;
  }
  else
  {
    v13 = [v11 objectAtIndex:a4 - 1];
  }
  v14 = +[CKUIBehavior sharedBehaviors];
  [v14 smallTranscriptSpace];
  double v16 = v15;

  v17 = +[CKUIBehavior sharedBehaviors];
  [v17 largeTranscriptSpace];
  double v19 = v18;

  if (!v13)
  {
    v24 = +[CKUIBehavior sharedBehaviors];
    [v24 topTranscriptSpace];
    double v19 = v25;

    goto LABEL_12;
  }
  unint64_t v20 = [v13 layoutType];
  if (v20 <= 0x18)
  {
    if (((1 << v20) & 0x1807FAC) != 0)
    {
      if (IMOSLoggingEnabled())
      {
        v21 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          v22 = (objc_class *)objc_opt_class();
          v23 = NSStringFromClass(v22);
          int v29 = 138412290;
          v30 = v23;
          _os_log_impl(&dword_18EF18000, v21, OS_LOG_TYPE_INFO, "Satellite SMS fallback indicator  unexpectedly following a %@", (uint8_t *)&v29, 0xCu);
        }
      }
      goto LABEL_12;
    }
    if (((1 << v20) & 0x12) != 0) {
      goto LABEL_12;
    }
  }
  v28 = IMLogHandleForCategory();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
    -[CKSatelliteSMSFallbackStatusChatItem(Layout) layoutItemSpacingWithEnvironment:datasourceItemIndex:allDatasourceItems:supplementryItems:]((uint64_t)v13, v28);
  }

  double v19 = v16;
LABEL_12:
  v26 = +[CKChatItemLayoutUtilities transcriptVerticalEdgeSpacingForChatItem:self previousChatItem:v13 topSpacing:v19 bottomSpacing:0.0];

  return v26;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (void)unloadTranscriptText
{
  v4.receiver = self;
  v4.super_class = (Class)CKSatelliteSMSFallbackStatusChatItem;
  [(CKChatItem *)&v4 unloadTranscriptText];
  smsFallbackStatusTitleLabelAttributedText = self->_smsFallbackStatusTitleLabelAttributedText;
  self->_smsFallbackStatusTitleLabelAttributedText = 0;
}

- (id)loadTranscriptText
{
  v3 = +[CKUIBehavior sharedBehaviors];
  objc_super v4 = [v3 transcriptEmphasizedFontAttributes];

  v5 = +[CKUIBehavior sharedBehaviors];
  v6 = [v5 transcriptRegularFontAttributes];

  v7 = CKFrameworkBundle();
  v8 = [v7 localizedStringForKey:@"PLACEHOLDER_TEXT_VIEW_SATELLITE_MESSAGE_SMS" value:&stru_1EDE4CA38 table:@"ChatKit-CarrierPigeon"];

  v9 = (NSAttributedString *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v8 attributes:v4];
  id v10 = [(CKChatItem *)self IMChatItem];
  id v11 = [v10 handle];
  id v12 = [v11 _displayNameWithAbbreviation];

  int v13 = [v10 canSMSReply];
  v14 = NSString;
  double v15 = CKFrameworkBundle();
  double v16 = v15;
  if (v13) {
    v17 = @"SMS_FALLBACK_STATUS_MESSAGE";
  }
  else {
    v17 = @"SMS_FALLBACK_STATUS_MESSAGE_NO_REPLY";
  }
  double v18 = [v15 localizedStringForKey:v17 value:&stru_1EDE4CA38 table:@"ChatKit-CarrierPigeon"];
  double v19 = objc_msgSend(v14, "localizedStringWithFormat:", v18, v12);

  unint64_t v20 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v21 = [v20 userInterfaceLayoutDirection];

  if (v21 == 1) {
    v22 = @"\u200F";
  }
  else {
    v22 = @"\u200E";
  }
  v23 = [(__CFString *)v22 stringByAppendingString:v19];

  v24 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v23 attributes:v6];
  double v25 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n"];
  [(NSAttributedString *)v9 appendLocalizedFormat:v25];
  [(NSAttributedString *)v9 appendLocalizedFormat:v24];
  smsFallbackStatusTitleLabelAttributedText = self->_smsFallbackStatusTitleLabelAttributedText;
  self->_smsFallbackStatusTitleLabelAttributedText = v9;
  v27 = v9;

  v28 = (void *)[(NSAttributedString *)v27 copy];

  return v28;
}

- (UIEdgeInsets)contentInsets
{
  v2 = +[CKUIBehavior sharedBehaviors];
  [v2 stampTranscriptInsets];
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
  return 1;
}

- (BOOL)displayDuringSend
{
  return 0;
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height = a3.height;
  double width = a3.width;
  double v8 = +[CKUIBehavior sharedBehaviors];
  double v9 = [(CKSatelliteSMSFallbackStatusChatItem *)self loadTranscriptText];
  objc_msgSend(v9, "boundingRectWithSize:options:context:", 1, 0, width, height);
  double v11 = v10;

  [v8 smallTranscriptSpace];
  double v13 = v12;
  [v8 transcriptBoldTextAlignmentInsets];
  if (a4)
  {
    a4->top = v14;
    a4->left = v15;
    a4->bottom = v16;
    a4->right = v17;
  }
  double v18 = v11 - v14 + v13 + v11 - v16;

  double v19 = 0.0;
  double v20 = v18;
  result.double height = v20;
  result.double width = v19;
  return result;
}

- (NSAttributedString)smsFallbackStatusTitleLabelAttributedText
{
  return self->_smsFallbackStatusTitleLabelAttributedText;
}

- (void)setSmsFallbackStatusTitleLabelAttributedText:(id)a3
{
}

- (void).cxx_destruct
{
}

@end