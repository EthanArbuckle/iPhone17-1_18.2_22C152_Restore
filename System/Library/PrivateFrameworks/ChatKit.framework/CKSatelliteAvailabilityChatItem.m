@interface CKSatelliteAvailabilityChatItem
- (BOOL)displayDuringSend;
- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (Class)cellClass;
- (NSAttributedString)satelliteAvailabilityTitleLabelAttributedText;
- (UIEdgeInsets)contentInsets;
- (char)transcriptOrientation;
- (id)layoutItemSpacingWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6 sizeOverride:(CGSize)a7;
- (id)loadTranscriptText;
- (unint64_t)layoutType;
- (void)setSatelliteAvailabilityTitleLabelAttributedText:(id)a3;
- (void)unloadTranscriptText;
@end

@implementation CKSatelliteAvailabilityChatItem

- (unint64_t)layoutType
{
  return 23;
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
        -[CKSatelliteAvailabilityChatItem(Layout) layoutItemSpacingWithEnvironment:datasourceItemIndex:allDatasourceItems:supplementryItems:sizeOverride:](v29);
      }
LABEL_22:

      double v20 = v17;
      goto LABEL_12;
    }
LABEL_20:
    v29 = IMLogHandleForCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[CKSatelliteAvailabilityChatItem(Layout) layoutItemSpacingWithEnvironment:datasourceItemIndex:allDatasourceItems:supplementryItems:sizeOverride:]((uint64_t)v14, v29);
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
      _os_log_impl(&dword_18EF18000, v22, OS_LOG_TYPE_INFO, "Satellite availability indicator unexpectedly following a %@", (uint8_t *)&v30, 0xCu);
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
  v4.super_class = (Class)CKSatelliteAvailabilityChatItem;
  [(CKChatItem *)&v4 unloadTranscriptText];
  satelliteAvailabilityTitleLabelAttributedText = self->_satelliteAvailabilityTitleLabelAttributedText;
  self->_satelliteAvailabilityTitleLabelAttributedText = 0;
}

- (id)loadTranscriptText
{
  v3 = +[CKUIBehavior sharedBehaviors];
  objc_super v4 = [v3 satelliteAvailabilityIndicatorIcon];

  v5 = +[CKUIBehavior sharedBehaviors];
  v6 = [v5 transcriptAvailabilityFontAttributes];

  v7 = [(CKSatelliteAvailabilityChatItem *)self imSatelliteAvailabilityChatItem];
  v8 = [v7 handle];
  v9 = [v8 _displayNameWithAbbreviation];

  v10 = NSString;
  id v11 = CKFrameworkBundle();
  id v12 = [v11 localizedStringForKey:@"SATELLITE_AVAILABILITY_OFF_GRID" value:&stru_1EDE4CA38 table:@"ChatKit-CarrierPigeon"];
  id v13 = objc_msgSend(v10, "localizedStringWithFormat:", v12, v9);

  v14 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v15 = [v14 userInterfaceLayoutDirection];

  if (v15 == 1) {
    double v16 = @"\u200F";
  }
  else {
    double v16 = @"\u200E";
  }
  double v17 = [(__CFString *)v16 stringByAppendingString:v13];

  v18 = (NSAttributedString *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v17 attributes:0];
  [(NSAttributedString *)v18 replaceCharactersInRange:0, 0, @" " withString];
  id v19 = objc_alloc_init(MEMORY[0x1E4FB0870]);
  [v19 setImage:v4];
  double v20 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v19];
  [(NSAttributedString *)v18 insertAttributedString:v20 atIndex:0];

  -[NSAttributedString addAttributes:range:](v18, "addAttributes:range:", v6, 0, [(NSAttributedString *)v18 length]);
  satelliteAvailabilityTitleLabelAttributedText = self->_satelliteAvailabilityTitleLabelAttributedText;
  self->_satelliteAvailabilityTitleLabelAttributedText = v18;
  v22 = v18;

  v23 = (void *)[(NSAttributedString *)v22 copy];

  return v23;
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
  double v14 = +[CKTranscriptSatelliteAvailabilityCell satelliteAvailabilityTitleLabel];
  uint64_t v15 = [(CKChatItem *)self transcriptText];
  [v14 setAttributedText:v15];

  objc_msgSend(v14, "sizeThatFits:", width, height);
  double v17 = v16;

  double v18 = 0.0;
  double v19 = v17;
  result.double height = v19;
  result.double width = v18;
  return result;
}

- (NSAttributedString)satelliteAvailabilityTitleLabelAttributedText
{
  return self->_satelliteAvailabilityTitleLabelAttributedText;
}

- (void)setSatelliteAvailabilityTitleLabelAttributedText:(id)a3
{
}

- (void).cxx_destruct
{
}

@end