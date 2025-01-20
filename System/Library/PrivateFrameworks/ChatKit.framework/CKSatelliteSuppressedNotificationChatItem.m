@interface CKSatelliteSuppressedNotificationChatItem
- (BOOL)displayDuringSend;
- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (Class)cellClass;
- (NSAttributedString)satelliteNoNotificationTitleLabelAttributedText;
- (UIEdgeInsets)contentInsets;
- (char)transcriptOrientation;
- (id)layoutItemSpacingWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6 sizeOverride:(CGSize)a7;
- (id)loadTranscriptText;
- (unint64_t)layoutType;
- (void)setSatelliteNoNotificationTitleLabelAttributedText:(id)a3;
- (void)unloadTranscriptText;
@end

@implementation CKSatelliteSuppressedNotificationChatItem

- (unint64_t)layoutType
{
  return 24;
}

- (id)layoutItemSpacingWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6 sizeOverride:(CGSize)a7
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (a4 < 1)
  {
    v14 = 0;
  }
  else
  {
    v14 = [v12 objectAtIndex:a4 - 1];
  }
  v15 = +[CKUIBehavior sharedBehaviors];
  [v15 smallTranscriptSpace];
  double v17 = v16;

  v18 = +[CKUIBehavior sharedBehaviors];
  [v18 largeTranscriptSpace];
  double v20 = v19;

  if (!v14)
  {
    v25 = +[CKUIBehavior sharedBehaviors];
    [v25 topTranscriptSpace];
    double v20 = v26;

    goto LABEL_12;
  }
  unint64_t v21 = [v14 layoutType];
  if (v21 > 0x17) {
    goto LABEL_20;
  }
  if (((1 << v21) & 0x7FAC) == 0)
  {
    if (((1 << v21) & 0x12) != 0) {
      goto LABEL_12;
    }
    if (v21 == 23)
    {
      v29 = IMLogHandleForCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        -[CKSatelliteSuppressedNotificationChatItem(Layout) layoutItemSpacingWithEnvironment:datasourceItemIndex:allDatasourceItems:supplementryItems:sizeOverride:](v29);
      }
LABEL_22:

      double v20 = v17;
      goto LABEL_12;
    }
LABEL_20:
    v29 = IMLogHandleForCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[CKSatelliteSuppressedNotificationChatItem(Layout) layoutItemSpacingWithEnvironment:datasourceItemIndex:allDatasourceItems:supplementryItems:sizeOverride:]((uint64_t)v14, v29);
    }
    goto LABEL_22;
  }
  if (IMOSLoggingEnabled())
  {
    v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = (objc_class *)objc_opt_class();
      v24 = NSStringFromClass(v23);
      int v30 = 138412290;
      v31 = v24;
      _os_log_impl(&dword_18EF18000, v22, OS_LOG_TYPE_INFO, "Satellite suppressed notification unexpectedly following a %@", (uint8_t *)&v30, 0xCu);
    }
  }
LABEL_12:
  v27 = +[CKChatItemLayoutUtilities transcriptVerticalEdgeSpacingForChatItem:self previousChatItem:v14 topSpacing:v20 bottomSpacing:0.0];

  return v27;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (void)unloadTranscriptText
{
  v4.receiver = self;
  v4.super_class = (Class)CKSatelliteSuppressedNotificationChatItem;
  [(CKChatItem *)&v4 unloadTranscriptText];
  satelliteNoNotificationTitleLabelAttributedText = self->_satelliteNoNotificationTitleLabelAttributedText;
  self->_satelliteNoNotificationTitleLabelAttributedText = 0;
}

- (id)loadTranscriptText
{
  v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isCarrierPigeonEnabled];

  if (v4)
  {
    v5 = +[CKUIBehavior sharedBehaviors];
    v6 = [v5 satelliteAvailabilityIndicatorIcon];

    v7 = +[CKUIBehavior sharedBehaviors];
    v8 = [v7 transcriptSatelliteFontAttributes];

    v9 = [(CKSatelliteSuppressedNotificationChatItem *)self imSatelliteSuppressedNotificationChatItem];
    v10 = [v9 handle];
    id v11 = [v10 _displayNameWithAbbreviation];

    id v12 = NSString;
    id v13 = CKFrameworkBundle();
    v14 = [v13 localizedStringForKey:@"MESSAGE_STATUS_CHECK_VIA_SATELLITE" value:&stru_1EDE4CA38 table:@"ChatKit-CarrierPigeon"];
    v15 = objc_msgSend(v12, "localizedStringWithFormat:", v14, v11);

    double v16 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v17 = [v16 userInterfaceLayoutDirection];

    if (v17 == 1) {
      v18 = @"\u200F";
    }
    else {
      v18 = @"\u200E";
    }
    double v19 = [(__CFString *)v18 stringByAppendingString:v15];

    double v20 = (NSAttributedString *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v19 attributes:0];
    [(NSAttributedString *)v20 replaceCharactersInRange:0, 0, @" " withString];
    id v21 = objc_alloc_init(MEMORY[0x1E4FB0870]);
    [v21 setImage:v6];
    v22 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v21];
    [(NSAttributedString *)v20 insertAttributedString:v22 atIndex:0];

    -[NSAttributedString addAttributes:range:](v20, "addAttributes:range:", v8, 0, [(NSAttributedString *)v20 length]);
    satelliteNoNotificationTitleLabelAttributedText = self->_satelliteNoNotificationTitleLabelAttributedText;
    self->_satelliteNoNotificationTitleLabelAttributedText = v20;
    v24 = v20;

    v25 = (void *)[(NSAttributedString *)v24 copy];
  }
  else
  {
    v25 = 0;
  }

  return v25;
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
  double v9 = v8;
  if (a4)
  {
    [v8 transcriptBoldTextAlignmentInsets];
    a4->top = v10;
    a4->left = v11;
    a4->bottom = v12;
    a4->right = v13;
  }
  double v14 = +[CKTranscriptSatelliteSuppressedNotificationCell satelliteNoNotificationTitleLabel];
  v15 = [(CKChatItem *)self transcriptText];
  [v14 setAttributedText:v15];

  objc_msgSend(v14, "sizeThatFits:", width, height);
  double v17 = v16;

  double v18 = 0.0;
  double v19 = v17;
  result.double height = v19;
  result.double width = v18;
  return result;
}

- (NSAttributedString)satelliteNoNotificationTitleLabelAttributedText
{
  return self->_satelliteNoNotificationTitleLabelAttributedText;
}

- (void)setSatelliteNoNotificationTitleLabelAttributedText:(id)a3
{
}

- (void).cxx_destruct
{
}

@end