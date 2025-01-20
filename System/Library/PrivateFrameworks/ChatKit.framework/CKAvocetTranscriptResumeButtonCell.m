@interface CKAvocetTranscriptResumeButtonCell
+ (double)heightForChatItem:(id)a3 fittingSize:(CGSize)a4;
+ (id)_buttonWithSystemImageName:(id)a3 titleString:(id)a4;
+ (id)_createButtonConfigurationWithSystemImageName:(id)a3 titleString:(id)a4;
+ (id)_makeTextViaStewieButton;
+ (void)_configureLabel:(id)a3;
- (BOOL)isShowingStewieTextButton;
- (CKAvocetTranscriptResumeButtonCell)initWithFrame:(CGRect)a3;
- (NSString)chatIdentifier;
- (UIButton)textViaStewieButton;
- (id)attributedButtonText;
- (void)_layoutLabelInAlignmentContentRect:(CGRect)a3;
- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7;
- (void)layoutSubviewsForAlignmentContents;
- (void)prepareForReuse;
- (void)setChatIdentifier:(id)a3;
- (void)setShowStewieTextButton:(BOOL)a3;
- (void)setTextViaStewieButton:(id)a3;
- (void)touchUpInsideTextViaStewieButton:(id)a3;
@end

@implementation CKAvocetTranscriptResumeButtonCell

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  BOOL v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CKAvocetTranscriptResumeButtonCell;
  id v12 = a3;
  [(CKTranscriptStampCell *)&v15 configureForChatItem:v12 context:a4 animated:v9 animationDuration:a7 animationCurve:a6];
  v13 = objc_msgSend(v12, "chatIdentifier", v15.receiver, v15.super_class);
  [(CKAvocetTranscriptResumeButtonCell *)self setChatIdentifier:v13];

  uint64_t v14 = [v12 shouldShowStewieTextButton];
  [(CKAvocetTranscriptResumeButtonCell *)self setShowStewieTextButton:v14];
  [(CKAvocetTranscriptResumeButtonCell *)self setNeedsLayout];
}

+ (double)heightForChatItem:(id)a3 fittingSize:(CGSize)a4
{
  double width = a4.width;
  v6 = objc_msgSend(a1, "createStampLabelView", a3, a4.width, a4.height);
  [a1 _configureLabel:v6];
  v7 = [(id)objc_opt_class() _makeTextViaStewieButton];
  v8 = +[CKUIBehavior sharedBehaviors];
  [v8 transcriptBoldTextAlignmentInsets];
  double v10 = v9;
  double v12 = v11;

  double v13 = width - (v10 + v12);
  uint64_t v14 = [v6 attributedText];
  objc_msgSend(v14, "boundingRectWithSize:options:context:", 1, 0, v13, 1.79769313e308);
  double v16 = v15;

  double v17 = v13 + -32.0;
  if (v13 + -32.0 > 400.0) {
    double v17 = 400.0;
  }
  objc_msgSend(v7, "sizeThatFits:", v17, 1.79769313e308);
  double v19 = v16 + 24.0 + v18 + 32.0;

  return v19;
}

- (void)setChatIdentifier:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v5 = (NSString *)a3;
  p_chatIdentifier = &self->_chatIdentifier;
  if (*p_chatIdentifier != v5 && ![(NSString *)*p_chatIdentifier isEqualToString:v5])
  {
    if (IMOSLoggingEnabled())
    {
      v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v8 = 138412290;
        double v9 = v5;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "chatIdentifier: %@", (uint8_t *)&v8, 0xCu);
      }
    }
    objc_storeStrong((id *)p_chatIdentifier, a3);
  }
}

+ (void)_configureLabel:(id)a3
{
  id v3 = a3;
  v4 = +[CKUIBehavior sharedBehaviors];
  id v9 = [v4 transcriptEmphasizedFontAttributes];

  id v5 = objc_alloc(MEMORY[0x1E4F28B18]);
  v6 = CKFrameworkBundle();
  v7 = [v6 localizedStringForKey:@"SATELLITE_CONNECTION_ENDED" value:&stru_1EDE4CA38 table:@"ChatKit-Avocet"];
  int v8 = (void *)[v5 initWithString:v7 attributes:v9];
  [v3 setAttributedText:v8];

  [v3 setNumberOfLines:0];
}

+ (id)_makeTextViaStewieButton
{
  v2 = objc_opt_class();
  id v3 = CKFrameworkBundle();
  v4 = [v3 localizedStringForKey:@"TEXT_ROADSIDE_SERVICES" value:&stru_1EDE4CA38 table:@"ChatKit-Avocet"];
  id v5 = [v2 _buttonWithSystemImageName:@"satellite.fill" titleString:v4];

  return v5;
}

+ (id)_createButtonConfigurationWithSystemImageName:(id)a3 titleString:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F427E8];
  id v6 = a4;
  id v7 = a3;
  int v8 = [v5 grayButtonConfiguration];
  [v8 setButtonSize:3];
  [v8 setCornerStyle:4];
  [v8 setTitle:v6];

  id v9 = [MEMORY[0x1E4F42A80] _systemImageNamed:v7];

  uint64_t v10 = [MEMORY[0x1E4F42A98] configurationWithScale:1];
  double v11 = [v9 imageWithConfiguration:v10];
  [v8 setImage:v11];

  [v8 setImagePadding:5.0];
  [v8 contentInsets];
  objc_msgSend(v8, "setContentInsets:");

  return v8;
}

+ (id)_buttonWithSystemImageName:(id)a3 titleString:(id)a4
{
  v4 = (void *)MEMORY[0x1E4F427E0];
  id v5 = +[CKAvocetTranscriptResumeButtonCell _createButtonConfigurationWithSystemImageName:a3 titleString:a4];
  id v6 = [v4 buttonWithConfiguration:v5 primaryAction:0];

  return v6;
}

- (CKAvocetTranscriptResumeButtonCell)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CKAvocetTranscriptResumeButtonCell;
  id v3 = -[CKTranscriptLabelCell initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_opt_class();
    id v5 = [(CKTranscriptLabelCell *)v3 label];
    [v4 _configureLabel:v5];

    id v6 = [(CKEditableCollectionViewCell *)v3 contentView];
    id v7 = [(CKAvocetTranscriptResumeButtonCell *)v3 textViaStewieButton];
    [v6 addSubview:v7];
  }
  return v3;
}

- (void)layoutSubviewsForAlignmentContents
{
  v24.receiver = self;
  v24.super_class = (Class)CKAvocetTranscriptResumeButtonCell;
  [(CKTranscriptStampCell *)&v24 layoutSubviewsForAlignmentContents];
  [(CKTranscriptStampCell *)self contentAlignmentRect];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  CGFloat v10 = v9;
  [(CKAvocetTranscriptResumeButtonCell *)self _layoutLabelInAlignmentContentRect:"_layoutLabelInAlignmentContentRect:"];
  double v11 = [(CKAvocetTranscriptResumeButtonCell *)self textViaStewieButton];
  double v12 = v11;
  double v13 = v8 + -32.0;
  if (v8 + -32.0 > 400.0) {
    double v13 = 400.0;
  }
  objc_msgSend(v11, "sizeThatFits:", v13, 1.79769313e308);
  double v15 = v14;
  double v17 = fmax(v16, 200.0);
  v25.origin.x = v4;
  v25.origin.y = v6;
  v25.size.double width = v8;
  v25.size.height = v10;
  double MidX = CGRectGetMidX(v25);
  double v19 = [(CKAvocetTranscriptResumeButtonCell *)self traitCollection];
  [v19 displayScale];
  double v21 = MidX - round(v17 * 0.5 * v20) / v20;

  v22 = [(CKTranscriptLabelCell *)self label];
  [v22 frame];
  CGFloat v23 = CGRectGetMaxY(v26) + 24.0;

  objc_msgSend(v12, "setFrame:", v21, v23, v17, v15);
  objc_msgSend(v12, "setHidden:", -[CKAvocetTranscriptResumeButtonCell isShowingStewieTextButton](self, "isShowingStewieTextButton") ^ 1);
}

- (void)_layoutLabelInAlignmentContentRect:(CGRect)a3
{
  double width = a3.size.width;
  double x = a3.origin.x;
  id v8 = [(CKTranscriptLabelCell *)self label];
  double v5 = [v8 attributedText];
  objc_msgSend(v5, "boundingRectWithSize:options:context:", 1, 0, width, 1.79769313e308);
  double v7 = v6;

  objc_msgSend(v8, "setFrame:", x, 8.0, width, v7);
}

- (void)setShowStewieTextButton:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(CKAvocetTranscriptResumeButtonCell *)self textViaStewieButton];
  int v6 = [v5 isHidden];

  if (self->_showStewieTextButton != v3 || ((v6 ^ v3) & 1) == 0)
  {
    double v7 = [(CKAvocetTranscriptResumeButtonCell *)self textViaStewieButton];
    [v7 setHidden:!v3];

    [(CKAvocetTranscriptResumeButtonCell *)self setNeedsLayout];
    [(CKAvocetTranscriptResumeButtonCell *)self layoutIfNeeded];
  }
  self->_showStewieTextButton = v3;
}

- (id)attributedButtonText
{
  v2 = [(CKAvocetTranscriptResumeButtonCell *)self textViaStewieButton];
  BOOL v3 = [v2 attributedTitleForState:0];

  return v3;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)CKAvocetTranscriptResumeButtonCell;
  [(CKTranscriptStampCell *)&v3 prepareForReuse];
  [(CKAvocetTranscriptResumeButtonCell *)self setNeedsLayout];
}

- (void)touchUpInsideTextViaStewieButton:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    double v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      chatIdentifier = self->_chatIdentifier;
      int v8 = 138412546;
      id v9 = v4;
      __int16 v10 = 2112;
      double v11 = chatIdentifier;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "called touchUpInsideTextViaStewieButton: %@, chatIdentifier: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  double v7 = [MEMORY[0x1E4F6BC48] sharedInstance];
  [v7 openStewieAppForChatIdentifier:self->_chatIdentifier completion:0];
}

- (UIButton)textViaStewieButton
{
  textViaStewieButton = self->_textViaStewieButton;
  if (!textViaStewieButton)
  {
    id v4 = [(id)objc_opt_class() _makeTextViaStewieButton];
    double v5 = self->_textViaStewieButton;
    self->_textViaStewieButton = v4;

    [(UIButton *)self->_textViaStewieButton addTarget:self action:sel_touchUpInsideTextViaStewieButton_ forEvents:64];
    textViaStewieButton = self->_textViaStewieButton;
  }

  return textViaStewieButton;
}

- (BOOL)isShowingStewieTextButton
{
  return self->_showStewieTextButton;
}

- (void)setTextViaStewieButton:(id)a3
{
}

- (NSString)chatIdentifier
{
  return self->_chatIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chatIdentifier, 0);

  objc_storeStrong((id *)&self->_textViaStewieButton, 0);
}

@end