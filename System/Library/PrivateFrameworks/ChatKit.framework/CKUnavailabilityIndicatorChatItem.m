@interface CKUnavailabilityIndicatorChatItem
- (BOOL)displayDuringSend;
- (BOOL)displayNotifyAnywayButton;
- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (Class)cellClass;
- (NSAttributedString)unavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton;
- (NSAttributedString)unavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton;
- (UIEdgeInsets)contentInsets;
- (char)transcriptOrientation;
- (id)_unavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton:(BOOL)a3;
- (id)layoutItemSpacingWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6 sizeOverride:(CGSize)a7;
- (id)loadTranscriptText;
- (unint64_t)layoutType;
- (void)_loadUnavailableTitleLabelTextVariants;
- (void)setUnavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton:(id)a3;
- (void)setUnavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton:(id)a3;
- (void)unloadTranscriptText;
@end

@implementation CKUnavailabilityIndicatorChatItem

- (BOOL)displayNotifyAnywayButton
{
  v2 = [(CKUnavailabilityIndicatorChatItem *)self imUnavailabilityIndicatorChatItem];
  char v3 = [v2 displayNotifyAnywayButton];

  return v3;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (id)loadTranscriptText
{
  [(CKUnavailabilityIndicatorChatItem *)self _loadUnavailableTitleLabelTextVariants];
  unavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton = self->_unavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton;

  return unavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton;
}

- (void)unloadTranscriptText
{
  v5.receiver = self;
  v5.super_class = (Class)CKUnavailabilityIndicatorChatItem;
  [(CKChatItem *)&v5 unloadTranscriptText];
  unavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton = self->_unavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton;
  self->_unavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton = 0;

  unavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton = self->_unavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton;
  self->_unavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton = 0;
}

- (NSAttributedString)unavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton
{
  unavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton = self->_unavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton;
  if (!unavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton)
  {
    [(CKUnavailabilityIndicatorChatItem *)self _loadUnavailableTitleLabelTextVariants];
    unavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton = self->_unavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton;
  }

  return unavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton;
}

- (NSAttributedString)unavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton
{
  unavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton = self->_unavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton;
  if (!unavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton)
  {
    [(CKUnavailabilityIndicatorChatItem *)self _loadUnavailableTitleLabelTextVariants];
    unavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton = self->_unavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton;
  }

  return unavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton;
}

- (void)_loadUnavailableTitleLabelTextVariants
{
  char v3 = [(CKUnavailabilityIndicatorChatItem *)self _unavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton:1];
  unavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton = self->_unavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton;
  self->_unavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton = v3;

  objc_super v5 = [(CKUnavailabilityIndicatorChatItem *)self _unavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton:0];
  unavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton = self->_unavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton;
  self->_unavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton = v5;
}

- (id)_unavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = +[CKUIBehavior sharedBehaviors];
  v6 = v5;
  if (v3)
  {
    v7 = [v5 transcriptAvailabilityDeemphasizedFontAttributes];

    v8 = +[CKUIBehavior sharedBehaviors];
    [v8 unavailabilityIndicatorDeemphasizedIcon];
  }
  else
  {
    v7 = [v5 transcriptAvailabilityFontAttributes];

    v8 = +[CKUIBehavior sharedBehaviors];
    [v8 unavailabilityIndicatorIcon];
  v9 = };

  v10 = [(CKUnavailabilityIndicatorChatItem *)self imUnavailabilityIndicatorChatItem];
  v11 = [v10 handle];
  v12 = [v11 _displayNameWithAbbreviation];

  v13 = NSString;
  v14 = CKFrameworkBundle();
  v15 = [v14 localizedStringForKey:@"UNAVAILABILITY_INDICATOR_TITLE_FORMAT" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v16 = objc_msgSend(v13, "stringWithFormat:", v15, v12);

  v17 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v18 = [v17 userInterfaceLayoutDirection];

  if (v18 == 1) {
    v19 = @"\u200F";
  }
  else {
    v19 = @"\u200E";
  }
  v20 = [(__CFString *)v19 stringByAppendingString:v16];

  v21 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v20 attributes:0];
  objc_msgSend(v21, "replaceCharactersInRange:withString:", 0, 0, @" ");
  id v22 = objc_alloc_init(MEMORY[0x1E4FB0870]);
  [v22 setImage:v9];
  v23 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v22];
  [v21 insertAttributedString:v23 atIndex:0];

  objc_msgSend(v21, "addAttributes:range:", v7, 0, objc_msgSend(v21, "length"));

  return v21;
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
  return 1;
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
  double v14 = +[CKTranscriptUnavailabilityIndicatorCell unavailableTitleLabel];
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

- (void)setUnavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton:(id)a3
{
}

- (void)setUnavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton, 0);

  objc_storeStrong((id *)&self->_unavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton, 0);
}

- (unint64_t)layoutType
{
  return 10;
}

- (id)layoutItemSpacingWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6 sizeOverride:(CGSize)a7
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (a4 < 1)
  {
    double v14 = 0;
  }
  else
  {
    double v14 = [v12 objectAtIndex:a4 - 1];
  }
  v15 = +[CKUIBehavior sharedBehaviors];
  [v15 smallTranscriptSpace];
  double v17 = v16;

  double v18 = +[CKUIBehavior sharedBehaviors];
  [v18 largeTranscriptSpace];
  double v20 = v19;

  if (v14)
  {
    switch([v14 layoutType])
    {
      case 1:
      case 4:
        break;
      case 2:
      case 3:
      case 5:
      case 7:
      case 8:
      case 9:
      case 12:
      case 13:
      case 14:
        if (IMOSLoggingEnabled())
        {
          v21 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            id v22 = (objc_class *)objc_opt_class();
            v23 = NSStringFromClass(v22);
            int v29 = 138412290;
            v30 = v23;
            _os_log_impl(&dword_18EF18000, v21, OS_LOG_TYPE_INFO, "Unavailability indicator unexpectedly following a %@", (uint8_t *)&v29, 0xCu);
          }
        }
        break;
      case 10:
        v26 = IMLogHandleForCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          -[CKUnavailabilityIndicatorChatItem(Layout) layoutItemSpacingWithEnvironment:datasourceItemIndex:allDatasourceItems:supplementryItems:sizeOverride:](v26);
        }
        goto LABEL_19;
      case 11:
        v26 = IMLogHandleForCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          -[CKUnavailabilityIndicatorChatItem(Layout) layoutItemSpacingWithEnvironment:datasourceItemIndex:allDatasourceItems:supplementryItems:sizeOverride:](v26);
        }
        goto LABEL_19;
      default:
        v26 = IMLogHandleForCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          -[CKUnavailabilityIndicatorChatItem(Layout) layoutItemSpacingWithEnvironment:datasourceItemIndex:allDatasourceItems:supplementryItems:sizeOverride:]((uint64_t)v14, v26);
        }
LABEL_19:

        double v20 = v17;
        break;
    }
  }
  else
  {
    v24 = +[CKUIBehavior sharedBehaviors];
    [v24 topTranscriptSpace];
    double v20 = v25;
  }
  v27 = +[CKChatItemLayoutUtilities transcriptVerticalEdgeSpacingForChatItem:self previousChatItem:v14 topSpacing:v20 bottomSpacing:0.0];

  return v27;
}

@end