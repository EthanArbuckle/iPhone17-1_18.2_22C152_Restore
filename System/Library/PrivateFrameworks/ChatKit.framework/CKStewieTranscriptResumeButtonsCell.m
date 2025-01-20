@interface CKStewieTranscriptResumeButtonsCell
+ (double)heightForChatItem:(id)a3 fittingSize:(CGSize)a4;
+ (id)_buttonWithSystemImageName:(id)a3 titleString:(id)a4;
+ (id)_createButtonConfigurationWithSystemImageName:(id)a3 titleString:(id)a4;
+ (id)_makeCallEmergencyServicesButton;
+ (id)_makeTextViaStewieButton;
+ (void)_configureLabel:(id)a3;
- (BOOL)isShowingStewieTextButton;
- (CKStewieTranscriptResumeButtonsCell)initWithFrame:(CGRect)a3;
- (UIButton)callEmergencyServicesButton;
- (UIButton)textViaStewieButton;
- (id)attributedButtonText;
- (void)_layoutLabelInAlignmentContentRect:(CGRect)a3;
- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7;
- (void)layoutSubviewsForAlignmentContents;
- (void)prepareForReuse;
- (void)setCallEmergencyServicesButton:(id)a3;
- (void)setShowStewieTextButton:(BOOL)a3;
- (void)setTextViaStewieButton:(id)a3;
- (void)touchUpInsideCallEmergencyServicesButton:(id)a3;
- (void)touchUpInsideTextViaStewieButton:(id)a3;
@end

@implementation CKStewieTranscriptResumeButtonsCell

+ (double)heightForChatItem:(id)a3 fittingSize:(CGSize)a4
{
  double width = a4.width;
  v6 = objc_msgSend(a1, "createStampLabelView", a3, a4.width, a4.height);
  [a1 _configureLabel:v6];
  v7 = [(id)objc_opt_class() _makeCallEmergencyServicesButton];
  v8 = [(id)objc_opt_class() _makeTextViaStewieButton];
  v9 = +[CKUIBehavior sharedBehaviors];
  [v9 transcriptBoldTextAlignmentInsets];
  double v11 = v10;
  double v13 = v12;

  double v14 = width - (v11 + v13);
  v15 = [v6 attributedText];
  objc_msgSend(v15, "boundingRectWithSize:options:context:", 1, 0, v14, 1.79769313e308);
  double v17 = v16;

  if (v14 + -32.0 <= 400.0) {
    double v18 = v14 + -32.0;
  }
  else {
    double v18 = 400.0;
  }
  objc_msgSend(v7, "sizeThatFits:", v18, 1.79769313e308);
  double v20 = v19;
  objc_msgSend(v8, "sizeThatFits:", v18, 1.79769313e308);
  double v22 = v21 + v17 + 24.0 + v20 + 16.0 + 32.0;

  return v22;
}

+ (void)_configureLabel:(id)a3
{
  id v3 = a3;
  v4 = +[CKUIBehavior sharedBehaviors];
  id v9 = [v4 transcriptEmphasizedFontAttributes];

  id v5 = objc_alloc(MEMORY[0x1E4F28B18]);
  v6 = CKFrameworkBundle();
  v7 = [v6 localizedStringForKey:@"CALL_EMERGENCY_SERVICES_IF_YOU_NEED_HELP" value:&stru_1EDE4CA38 table:@"ChatKit-SYDROB_FEATURES"];
  v8 = (void *)[v5 initWithString:v7 attributes:v9];
  [v3 setAttributedText:v8];

  [v3 setNumberOfLines:0];
}

+ (id)_makeCallEmergencyServicesButton
{
  v2 = objc_opt_class();
  id v3 = CKFrameworkBundle();
  v4 = [v3 localizedStringForKey:@"CALL_EMERGENCY_SERVICES" value:&stru_1EDE4CA38 table:@"ChatKit-SYDROB_FEATURES"];
  id v5 = [v2 _buttonWithSystemImageName:@"phone.fill" titleString:v4];

  return v5;
}

+ (id)_makeTextViaStewieButton
{
  v2 = objc_opt_class();
  id v3 = CKFrameworkBundle();
  v4 = [v3 localizedStringForKey:@"TEXT_EMERGENCY_SERVICES" value:&stru_1EDE4CA38 table:@"ChatKit-SYDROB_FEATURES"];
  id v5 = [v2 _buttonWithSystemImageName:@"message.fill" titleString:v4];

  return v5;
}

+ (id)_createButtonConfigurationWithSystemImageName:(id)a3 titleString:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F427E8];
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 filledButtonConfiguration];
  [v8 setButtonSize:3];
  [v8 setCornerStyle:4];
  id v9 = [MEMORY[0x1E4F428B8] systemRedColor];
  [v8 setBaseBackgroundColor:v9];

  double v10 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  [v8 setBaseForegroundColor:v10];

  [v8 setTitle:v6];
  double v11 = [MEMORY[0x1E4F42A80] _systemImageNamed:v7];

  double v12 = [MEMORY[0x1E4F42A98] configurationWithScale:1];
  double v13 = [v11 imageWithConfiguration:v12];
  [v8 setImage:v13];

  [v8 setImagePadding:5.0];
  [v8 contentInsets];
  objc_msgSend(v8, "setContentInsets:");

  return v8;
}

+ (id)_buttonWithSystemImageName:(id)a3 titleString:(id)a4
{
  v4 = (void *)MEMORY[0x1E4F427E0];
  id v5 = +[CKStewieTranscriptResumeButtonsCell _createButtonConfigurationWithSystemImageName:a3 titleString:a4];
  id v6 = [v4 buttonWithConfiguration:v5 primaryAction:0];

  return v6;
}

- (CKStewieTranscriptResumeButtonsCell)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CKStewieTranscriptResumeButtonsCell;
  id v3 = -[CKTranscriptLabelCell initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_opt_class();
    id v5 = [(CKTranscriptLabelCell *)v3 label];
    [v4 _configureLabel:v5];

    id v6 = [(CKEditableCollectionViewCell *)v3 contentView];
    id v7 = [(CKStewieTranscriptResumeButtonsCell *)v3 callEmergencyServicesButton];
    [v6 addSubview:v7];

    v8 = [(CKEditableCollectionViewCell *)v3 contentView];
    id v9 = [(CKStewieTranscriptResumeButtonsCell *)v3 textViaStewieButton];
    [v8 addSubview:v9];
  }
  return v3;
}

- (void)layoutSubviewsForAlignmentContents
{
  v28.receiver = self;
  v28.super_class = (Class)CKStewieTranscriptResumeButtonsCell;
  [(CKTranscriptStampCell *)&v28 layoutSubviewsForAlignmentContents];
  [(CKTranscriptStampCell *)self contentAlignmentRect];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  CGFloat v10 = v9;
  [(CKStewieTranscriptResumeButtonsCell *)self _layoutLabelInAlignmentContentRect:"_layoutLabelInAlignmentContentRect:"];
  objc_super v11 = [(CKStewieTranscriptResumeButtonsCell *)self callEmergencyServicesButton];
  double v12 = [(CKStewieTranscriptResumeButtonsCell *)self textViaStewieButton];
  if (v8 + -32.0 <= 400.0) {
    double v13 = v8 + -32.0;
  }
  else {
    double v13 = 400.0;
  }
  objc_msgSend(v11, "sizeThatFits:", v13, 1.79769313e308);
  double v15 = v14;
  double v17 = v16;
  objc_msgSend(v12, "sizeThatFits:", v13, 1.79769313e308);
  double v20 = v19;
  if (v15 >= v18) {
    double v18 = v15;
  }
  double v21 = fmax(v18, 200.0);
  v29.origin.x = v4;
  v29.origin.y = v6;
  v29.size.double width = v8;
  v29.size.height = v10;
  double MidX = CGRectGetMidX(v29);
  v23 = [(CKStewieTranscriptResumeButtonsCell *)self traitCollection];
  [v23 displayScale];
  double v25 = MidX - round(v24 * (v21 * 0.5)) / v24;

  v26 = [(CKTranscriptLabelCell *)self label];
  [v26 frame];
  CGFloat v27 = CGRectGetMaxY(v30) + 24.0;

  objc_msgSend(v11, "setFrame:", v25, v27, v21, v17);
  [v11 frame];
  objc_msgSend(v12, "setFrame:", v25, CGRectGetMaxY(v31) + 16.0, v21, v20);
  objc_msgSend(v12, "setHidden:", -[CKStewieTranscriptResumeButtonsCell isShowingStewieTextButton](self, "isShowingStewieTextButton") ^ 1);
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
  double v5 = [(CKStewieTranscriptResumeButtonsCell *)self textViaStewieButton];
  int v6 = [v5 isHidden];

  if (self->_showStewieTextButton != v3 || ((v6 ^ v3) & 1) == 0)
  {
    double v7 = [(CKStewieTranscriptResumeButtonsCell *)self textViaStewieButton];
    [v7 setHidden:!v3];

    [(CKStewieTranscriptResumeButtonsCell *)self setNeedsLayout];
    [(CKStewieTranscriptResumeButtonsCell *)self layoutIfNeeded];
  }
  self->_showStewieTextButton = v3;
}

- (id)attributedButtonText
{
  v2 = [(CKStewieTranscriptResumeButtonsCell *)self callEmergencyServicesButton];
  BOOL v3 = [v2 attributedTitleForState:0];

  return v3;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)CKStewieTranscriptResumeButtonsCell;
  [(CKTranscriptStampCell *)&v3 prepareForReuse];
  [(CKStewieTranscriptResumeButtonsCell *)self setNeedsLayout];
}

- (void)touchUpInsideCallEmergencyServicesButton:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    CGFloat v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "called touchUpInsideCallEmergencyServicesButton: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  double v5 = [MEMORY[0x1E4F6BC48] sharedInstance];
  [v5 placeEmergencyCallToHandle:0 completion:0];
}

- (void)touchUpInsideTextViaStewieButton:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    CGFloat v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "called touchUpInsideTextViaStewieButton: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  double v5 = [MEMORY[0x1E4F6BC48] sharedInstance];
  [v5 openStewieAppForChatIdentifier:*MEMORY[0x1E4F6E348] completion:0];
}

- (UIButton)callEmergencyServicesButton
{
  v2 = self;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  callEmergencyServicesButton = self->_callEmergencyServicesButton;
  if (!callEmergencyServicesButton)
  {
    uint64_t v4 = [(id)objc_opt_class() _makeCallEmergencyServicesButton];
    double v5 = v2->_callEmergencyServicesButton;
    v2->_callEmergencyServicesButton = (UIButton *)v4;

    int v6 = [MEMORY[0x1E4F6BC48] sharedInstance];
    id v7 = [v6 emergencyHandles];

    if ((unint64_t)[v7 count] < 2)
    {
      [(UIButton *)v2->_callEmergencyServicesButton addTarget:v2 action:sel_touchUpInsideCallEmergencyServicesButton_ forEvents:64];
    }
    else
    {
      CGRect v30 = [MEMORY[0x1E4F1CA48] array];
      [v7 keysSortedByValueUsingComparator:&__block_literal_global_50];
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
      CGFloat v27 = v2;
      if (v8)
      {
        uint64_t v9 = v8;
        id v10 = 0;
        id v11 = 0;
        uint64_t v29 = *(void *)v34;
        do
        {
          uint64_t v12 = 0;
          double v13 = v10;
          do
          {
            if (*(void *)v34 != v29) {
              objc_enumerationMutation(obj);
            }
            id v10 = *(id *)(*((void *)&v33 + 1) + 8 * v12);

            double v14 = v7;
            double v15 = [v7 objectForKey:v10];

            double v16 = (void *)MEMORY[0x1E4F426E8];
            double v17 = CKFrameworkBundle();
            double v18 = [v17 localizedStringForKey:v10 value:&stru_1EDE4CA38 table:@"ChatKit"];
            double v19 = StringGUID();
            v31[0] = MEMORY[0x1E4F143A8];
            v31[1] = 3221225472;
            v31[2] = __66__CKStewieTranscriptResumeButtonsCell_callEmergencyServicesButton__block_invoke_2;
            v31[3] = &unk_1E56211C8;
            id v11 = v15;
            id v32 = v11;
            double v20 = [v16 actionWithTitle:v18 image:0 identifier:v19 handler:v31];

            if (v11)
            {
              double v21 = [v11 value];
              if ([v10 isEqualToString:v21])
              {
                [v20 setSubtitle:&stru_1EDE4CA38];
              }
              else
              {
                double v22 = [v11 value];
                [v20 setSubtitle:v22];
              }
            }
            [v30 addObject:v20];

            ++v12;
            double v13 = v10;
            id v7 = v14;
          }
          while (v9 != v12);
          uint64_t v9 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
        }
        while (v9);
      }
      else
      {
        id v10 = 0;
        id v11 = 0;
      }
      v23 = (void *)MEMORY[0x1E4F42B80];
      double v24 = (void *)[v30 copy];
      double v25 = [v23 menuWithChildren:v24];

      v2 = v27;
      [(UIButton *)v27->_callEmergencyServicesButton setShowsMenuAsPrimaryAction:1];
      [(UIButton *)v27->_callEmergencyServicesButton setMenu:v25];
    }
    callEmergencyServicesButton = v2->_callEmergencyServicesButton;
  }

  return callEmergencyServicesButton;
}

uint64_t __66__CKStewieTranscriptResumeButtonsCell_callEmergencyServicesButton__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  double v5 = [a2 value];
  int v6 = [v5 intValue];
  id v7 = [v4 value];

  if (v6 > (int)[v7 intValue]) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = -1;
  }

  return v8;
}

void __66__CKStewieTranscriptResumeButtonsCell_callEmergencyServicesButton__block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F6BC48] sharedInstance];
  [v2 placeEmergencyCallToHandle:*(void *)(a1 + 32) completion:0];
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

- (void)setCallEmergencyServicesButton:(id)a3
{
}

- (void)setTextViaStewieButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textViaStewieButton, 0);

  objc_storeStrong((id *)&self->_callEmergencyServicesButton, 0);
}

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  BOOL v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CKStewieTranscriptResumeButtonsCell;
  id v12 = a3;
  [(CKTranscriptStampCell *)&v14 configureForChatItem:v12 context:a4 animated:v9 animationDuration:a7 animationCurve:a6];
  uint64_t v13 = objc_msgSend(v12, "shouldShowStewieTextButton", v14.receiver, v14.super_class);

  [(CKStewieTranscriptResumeButtonsCell *)self setShowStewieTextButton:v13];
  [(CKStewieTranscriptResumeButtonsCell *)self setNeedsLayout];
}

@end