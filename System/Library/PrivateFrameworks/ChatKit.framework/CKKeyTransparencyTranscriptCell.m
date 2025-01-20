@interface CKKeyTransparencyTranscriptCell
+ (double)heightForChatItem:(id)a3 fittingSize:(CGSize)a4;
+ (id)generateActionButton;
+ (id)generateLabel;
+ (id)generateWarningImageView;
+ (id)reuseIdentifier;
- (BOOL)isGroupChat;
- (CKKeyTransparencyTranscriptCell)initWithFrame:(CGRect)a3;
- (CKKeyTransparencyTranscriptCellDelegate)delegate;
- (NSAttributedString)attributedText;
- (UIButton)actionButton;
- (UIImageView)warningImageView;
- (UILabel)label;
- (id)clearWarningAction;
- (id)learnMoreAction;
- (id)menuForKTStatusError;
- (id)menuForKTStatusTurnedOff;
- (id)menuForKTStatusUnavailable;
- (id)reportToAppleAction;
- (id)verifyConversationAction;
- (unint64_t)keyTransparencyStatus;
- (void)_layoutButtonInAlignmentContentRect:(CGRect)a3;
- (void)_layoutLabelInAlignmentContentRect:(CGRect)a3;
- (void)_layoutWarningImageInAlignmentContentRect:(CGRect)a3;
- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7;
- (void)layoutSubviewsForAlignmentContents;
- (void)prepareForReuse;
- (void)setActionButton:(id)a3;
- (void)setAttributedText:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsGroupChat:(BOOL)a3;
- (void)setKeyTransparencyStatus:(unint64_t)a3;
- (void)setLabel:(id)a3;
- (void)setWarningImageView:(id)a3;
- (void)setupKeyTransparencyMenu;
@end

@implementation CKKeyTransparencyTranscriptCell

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  BOOL v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CKKeyTransparencyTranscriptCell;
  id v12 = a3;
  [(CKTranscriptCell *)&v15 configureForChatItem:v12 context:a4 animated:v9 animationDuration:a7 animationCurve:a6];
  v13 = objc_msgSend(v12, "transcriptText", v15.receiver, v15.super_class);
  [(CKKeyTransparencyTranscriptCell *)self setAttributedText:v13];

  v14 = [v12 IMChatItem];

  if (v14)
  {
    -[CKKeyTransparencyTranscriptCell setIsGroupChat:](self, "setIsGroupChat:", [v14 isGroupChat]);
    -[CKKeyTransparencyTranscriptCell setKeyTransparencyStatus:](self, "setKeyTransparencyStatus:", [v14 status]);
  }
}

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (id)generateWarningImageView
{
  v2 = [MEMORY[0x1E4F42A80] systemImageNamed:@"exclamationmark.triangle.fill"];
  v3 = [MEMORY[0x1E4F42A98] configurationWithScale:3];
  v4 = [v2 imageByApplyingSymbolConfiguration:v3];

  v5 = (void *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v4];
  v6 = +[CKUIBehavior sharedBehaviors];
  v7 = [v6 theme];
  v8 = [v7 transcriptTextColor];
  [v5 setTintColor:v8];

  return v5;
}

+ (id)generateActionButton
{
  v2 = [MEMORY[0x1E4F427E0] buttonWithType:1];
  v3 = +[CKUIBehavior sharedBehaviors];
  [v3 transcriptButtonContentEdgeInsets];
  objc_msgSend(v2, "setContentEdgeInsets:");

  v4 = +[CKUIBehavior sharedBehaviors];
  v5 = [v4 centerTranscriptButtonTextAttributes];

  id v6 = objc_alloc(MEMORY[0x1E4F28B18]);
  v7 = CKFrameworkBundle();
  v8 = [v7 localizedStringForKey:@"KT_MORE_TRANSCRIPT_LINK" value:&stru_1EDE4CA38 table:@"ChatKit-Key-Transparency"];
  BOOL v9 = (void *)[v6 initWithString:v8 attributes:v5];

  [v2 setAttributedTitle:v9 forState:0];

  return v2;
}

+ (id)generateLabel
{
  id v2 = objc_alloc(MEMORY[0x1E4F42B38]);
  v3 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v3 setNumberOfLines:0];

  return v3;
}

+ (double)heightForChatItem:(id)a3 fittingSize:(CGSize)a4
{
  double width = a4.width;
  id v5 = a3;
  id v6 = +[CKKeyTransparencyTranscriptCell generateLabel];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v5;
    v8 = [v7 IMChatItem];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v10 = [v7 IMChatItem];
      v11 = [v10 affectedHandles];
      id v12 = +[CKKeyTransparencyTranscriptUtilities transcriptStringFromHandles:status:](CKKeyTransparencyTranscriptUtilities, "transcriptStringFromHandles:status:", v11, [v10 status]);

      [v6 setAttributedText:v12];
    }
  }
  double v13 = width + -64.0;
  objc_msgSend(v6, "sizeThatFits:", v13, 1.79769313e308);
  double v15 = v14;
  v16 = +[CKKeyTransparencyTranscriptCell generateActionButton];
  objc_msgSend(v16, "sizeThatFits:", v13, 1.79769313e308);
  double v18 = v17 + -2.0;
  v19 = +[CKKeyTransparencyTranscriptCell generateWarningImageView];
  [v19 frame];
  double v21 = v15 + 16.0 + v18 + v20 + 8.0;

  return v21;
}

- (CKKeyTransparencyTranscriptCell)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CKKeyTransparencyTranscriptCell;
  v3 = -[CKTranscriptCell initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    id v5 = [(CKEditableCollectionViewCell *)v3 contentView];
    id v6 = [(CKKeyTransparencyTranscriptCell *)v4 warningImageView];
    [v5 addSubview:v6];

    id v7 = [(CKEditableCollectionViewCell *)v4 contentView];
    v8 = [(CKKeyTransparencyTranscriptCell *)v4 label];
    [v7 addSubview:v8];

    BOOL v9 = [(CKEditableCollectionViewCell *)v4 contentView];
    v10 = [(CKKeyTransparencyTranscriptCell *)v4 actionButton];
    [v9 addSubview:v10];
  }
  return v4;
}

- (void)layoutSubviewsForAlignmentContents
{
  v8.receiver = self;
  v8.super_class = (Class)CKKeyTransparencyTranscriptCell;
  [(CKEditableCollectionViewCell *)&v8 layoutSubviewsForAlignmentContents];
  [(CKEditableCollectionViewCell *)self contentAlignmentRect];
  double y = v9.origin.y;
  double width = v9.size.width;
  double height = v9.size.height;
  double MidX = CGRectGetMidX(v9);
  if (width > 420.0) {
    double width = 420.0;
  }
  double v7 = MidX + width * -0.5;
  -[CKKeyTransparencyTranscriptCell _layoutWarningImageInAlignmentContentRect:](self, "_layoutWarningImageInAlignmentContentRect:", v7, y, width, height);
  -[CKKeyTransparencyTranscriptCell _layoutLabelInAlignmentContentRect:](self, "_layoutLabelInAlignmentContentRect:", v7, y, width, height);
  -[CKKeyTransparencyTranscriptCell _layoutButtonInAlignmentContentRect:](self, "_layoutButtonInAlignmentContentRect:", v7, y, width, height);
}

- (void)_layoutWarningImageInAlignmentContentRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  objc_super v8 = [(CKKeyTransparencyTranscriptCell *)self warningImageView];
  id v18 = v8;
  double v9 = width + -64.0;
  if (width + -64.0 > 420.0) {
    double v9 = 420.0;
  }
  objc_msgSend(v8, "sizeThatFits:", v9, 1.79769313e308);
  double v11 = v10;
  double v13 = v12;
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.double width = width;
  v20.size.CGFloat height = height;
  double MidX = CGRectGetMidX(v20);
  double v15 = [(CKKeyTransparencyTranscriptCell *)self traitCollection];
  [v15 displayScale];
  double v17 = MidX - round(v11 * 0.5 * v16) / v16;

  objc_msgSend(v18, "setFrame:", v17, 8.0, v11, v13);
}

- (void)_layoutLabelInAlignmentContentRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v18 = [(CKKeyTransparencyTranscriptCell *)self label];
  objc_msgSend(v18, "sizeThatFits:", width, 1.79769313e308);
  double v9 = v8;
  double v11 = v10;
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.double width = width;
  v20.size.CGFloat height = height;
  double MidX = CGRectGetMidX(v20);
  double v13 = [(CKKeyTransparencyTranscriptCell *)self traitCollection];
  [v13 displayScale];
  double v15 = MidX - round(v9 * 0.5 * v14) / v14;

  double v16 = [(CKKeyTransparencyTranscriptCell *)self warningImageView];
  [v16 frame];
  CGFloat v17 = CGRectGetMaxY(v21) + 8.0;

  objc_msgSend(v18, "setFrame:", v15, v17, v9, v11);
}

- (void)_layoutButtonInAlignmentContentRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v8 = [(CKKeyTransparencyTranscriptCell *)self actionButton];
  id v20 = v8;
  double v9 = width + -64.0;
  if (width + -64.0 > 420.0) {
    double v9 = 420.0;
  }
  objc_msgSend(v8, "sizeThatFits:", v9, 1.79769313e308);
  double v11 = v10;
  double v13 = v12;
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.double width = width;
  v22.size.CGFloat height = height;
  double MidX = CGRectGetMidX(v22);
  double v15 = [(CKKeyTransparencyTranscriptCell *)self traitCollection];
  [v15 displayScale];
  double v17 = MidX - round(v11 * 0.5 * v16) / v16;

  id v18 = [(CKKeyTransparencyTranscriptCell *)self label];
  [v18 frame];
  CGFloat v19 = CGRectGetMaxY(v23) + -2.0;

  objc_msgSend(v20, "setFrame:", v17, v19, v11, v13);
}

- (void)setAttributedText:(id)a3
{
  id v5 = (NSAttributedString *)a3;
  if (self->_attributedText != v5)
  {
    objc_storeStrong((id *)&self->_attributedText, a3);
    [(UILabel *)self->_label setAttributedText:v5];
  }
}

- (void)setIsGroupChat:(BOOL)a3
{
  if (self->_isGroupChat != a3) {
    self->_isGroupChat = a3;
  }
}

- (void)setKeyTransparencyStatus:(unint64_t)a3
{
  if (self->_keyTransparencyStatus != a3)
  {
    self->_keyTransparencyStatus = a3;
    [(CKKeyTransparencyTranscriptCell *)self setupKeyTransparencyMenu];
  }
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)CKKeyTransparencyTranscriptCell;
  [(CKTranscriptCell *)&v3 prepareForReuse];
  [(CKKeyTransparencyTranscriptCell *)self setNeedsLayout];
}

- (UILabel)label
{
  label = self->_label;
  if (!label)
  {
    v4 = +[CKKeyTransparencyTranscriptCell generateLabel];
    id v5 = self->_label;
    self->_label = v4;

    label = self->_label;
  }

  return label;
}

- (UIButton)actionButton
{
  actionButton = self->_actionButton;
  if (!actionButton)
  {
    v4 = +[CKKeyTransparencyTranscriptCell generateActionButton];
    id v5 = self->_actionButton;
    self->_actionButton = v4;

    actionButton = self->_actionButton;
  }

  return actionButton;
}

- (UIImageView)warningImageView
{
  warningImageView = self->_warningImageView;
  if (!warningImageView)
  {
    v4 = +[CKKeyTransparencyTranscriptCell generateWarningImageView];
    id v5 = self->_warningImageView;
    self->_warningImageView = v4;

    warningImageView = self->_warningImageView;
  }

  return warningImageView;
}

- (void)setupKeyTransparencyMenu
{
  [(UIButton *)self->_actionButton setShowsMenuAsPrimaryAction:1];
  unint64_t keyTransparencyStatus = self->_keyTransparencyStatus;
  if (keyTransparencyStatus - 5 < 2)
  {
    actionButton = self->_actionButton;
    uint64_t v5 = [(CKKeyTransparencyTranscriptCell *)self menuForKTStatusError];
  }
  else if (keyTransparencyStatus == 9)
  {
    actionButton = self->_actionButton;
    uint64_t v5 = [(CKKeyTransparencyTranscriptCell *)self menuForKTStatusTurnedOff];
  }
  else
  {
    if (keyTransparencyStatus != 11) {
      return;
    }
    actionButton = self->_actionButton;
    uint64_t v5 = [(CKKeyTransparencyTranscriptCell *)self menuForKTStatusUnavailable];
  }
  id v6 = (id)v5;
  -[UIButton setMenu:](actionButton, "setMenu:");
}

- (id)menuForKTStatusError
{
  v17[1] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = [(CKKeyTransparencyTranscriptCell *)self learnMoreAction];
  uint64_t v5 = [(CKKeyTransparencyTranscriptCell *)self reportToAppleAction];
  id v6 = [(CKKeyTransparencyTranscriptCell *)self verifyConversationAction];
  double v7 = [(CKKeyTransparencyTranscriptCell *)self clearWarningAction];
  double v8 = (void *)MEMORY[0x1E4F42B80];
  v17[0] = v7;
  double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  double v10 = [v8 menuWithTitle:&stru_1EDE4CA38 image:0 identifier:0 options:1 children:v9];

  v16[0] = v10;
  v16[1] = v6;
  v16[2] = v5;
  v16[3] = v4;
  double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:4];
  [v3 addObjectsFromArray:v11];

  double v12 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  char v13 = [v12 isKeyTransparencyReportToAppleEnabled];

  if ((v13 & 1) == 0) {
    [v3 removeObject:v5];
  }
  if (self->_isGroupChat) {
    [v3 removeObject:v6];
  }
  double v14 = [MEMORY[0x1E4F42B80] menuWithTitle:&stru_1EDE4CA38 children:v3];

  return v14;
}

- (id)menuForKTStatusUnavailable
{
  v16[1] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = [(CKKeyTransparencyTranscriptCell *)self learnMoreAction];
  uint64_t v5 = [(CKKeyTransparencyTranscriptCell *)self reportToAppleAction];
  id v6 = [(CKKeyTransparencyTranscriptCell *)self clearWarningAction];
  double v7 = (void *)MEMORY[0x1E4F42B80];
  v16[0] = v6;
  double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  double v9 = [v7 menuWithTitle:&stru_1EDE4CA38 image:0 identifier:0 options:1 children:v8];

  v15[0] = v9;
  v15[1] = v5;
  v15[2] = v4;
  double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:3];
  [v3 addObjectsFromArray:v10];

  double v11 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  char v12 = [v11 isKeyTransparencyReportToAppleEnabled];

  if ((v12 & 1) == 0) {
    [v3 removeObject:v5];
  }
  char v13 = [MEMORY[0x1E4F42B80] menuWithTitle:&stru_1EDE4CA38 children:v3];

  return v13;
}

- (id)menuForKTStatusTurnedOff
{
  v13[1] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = [(CKKeyTransparencyTranscriptCell *)self learnMoreAction];
  uint64_t v5 = [(CKKeyTransparencyTranscriptCell *)self clearWarningAction];
  id v6 = (void *)MEMORY[0x1E4F42B80];
  v13[0] = v5;
  double v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  double v8 = [v6 menuWithTitle:&stru_1EDE4CA38 image:0 identifier:0 options:1 children:v7];

  v12[0] = v8;
  v12[1] = v4;
  double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  [v3 addObjectsFromArray:v9];

  double v10 = [MEMORY[0x1E4F42B80] menuWithTitle:&stru_1EDE4CA38 children:v3];

  return v10;
}

- (id)learnMoreAction
{
  id location = 0;
  objc_initWeak(&location, self);
  id v2 = (void *)MEMORY[0x1E4F426E8];
  objc_super v3 = CKFrameworkBundle();
  v4 = [v3 localizedStringForKey:@"KT_LEARN_MORE_ELLIPSES" value:&stru_1EDE4CA38 table:@"ChatKit-Key-Transparency"];
  uint64_t v5 = [MEMORY[0x1E4F42A80] systemImageNamed:@"info.circle"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__CKKeyTransparencyTranscriptCell_learnMoreAction__block_invoke;
  v8[3] = &unk_1E5620ED8;
  objc_copyWeak(&v9, &location);
  id v6 = [v2 actionWithTitle:v4 image:v5 identifier:0 handler:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v6;
}

void __50__CKKeyTransparencyTranscriptCell_learnMoreAction__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained delegate];
  id v3 = objc_loadWeakRetained(v1);
  [v2 keyTransparencyTranscriptCellDidSelectLearnMore:v3];
}

- (id)reportToAppleAction
{
  id location = 0;
  objc_initWeak(&location, self);
  id v2 = (void *)MEMORY[0x1E4F426E8];
  id v3 = CKFrameworkBundle();
  v4 = [v3 localizedStringForKey:@"KT_REPORT_TO_APPLE_ELLIPSES" value:&stru_1EDE4CA38 table:@"ChatKit-Key-Transparency"];
  uint64_t v5 = [MEMORY[0x1E4F42A80] systemImageNamed:@"exclamationmark.bubble"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__CKKeyTransparencyTranscriptCell_reportToAppleAction__block_invoke;
  v8[3] = &unk_1E5620ED8;
  objc_copyWeak(&v9, &location);
  id v6 = [v2 actionWithTitle:v4 image:v5 identifier:0 handler:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v6;
}

void __54__CKKeyTransparencyTranscriptCell_reportToAppleAction__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained delegate];
  id v3 = objc_loadWeakRetained(v1);
  [v2 keyTransparencyTranscriptCellDidRequestReportToApple:v3];
}

- (id)verifyConversationAction
{
  id location = 0;
  objc_initWeak(&location, self);
  id v2 = (void *)MEMORY[0x1E4F426E8];
  id v3 = CKFrameworkBundle();
  v4 = [v3 localizedStringForKey:@"KT_VERIFY_CONVERSATION_ELLIPSES" value:&stru_1EDE4CA38 table:@"ChatKit-Key-Transparency"];
  uint64_t v5 = [MEMORY[0x1E4F42A80] systemImageNamed:@"person.crop.circle.badge.checkmark"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__CKKeyTransparencyTranscriptCell_verifyConversationAction__block_invoke;
  v8[3] = &unk_1E5620ED8;
  objc_copyWeak(&v9, &location);
  id v6 = [v2 actionWithTitle:v4 image:v5 identifier:0 handler:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v6;
}

void __59__CKKeyTransparencyTranscriptCell_verifyConversationAction__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained delegate];
  id v3 = objc_loadWeakRetained(v1);
  [v2 keyTransparencyTranscriptCellDidRequestVerification:v3];
}

- (id)clearWarningAction
{
  id location = 0;
  objc_initWeak(&location, self);
  id v2 = (void *)MEMORY[0x1E4F426E8];
  id v3 = CKFrameworkBundle();
  v4 = [v3 localizedStringForKey:@"KT_CLEAR_WARNING" value:&stru_1EDE4CA38 table:@"ChatKit-Key-Transparency"];
  uint64_t v5 = [MEMORY[0x1E4F42A80] systemImageNamed:@"xmark"];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  double v10 = __53__CKKeyTransparencyTranscriptCell_clearWarningAction__block_invoke;
  double v11 = &unk_1E5620ED8;
  objc_copyWeak(&v12, &location);
  id v6 = [v2 actionWithTitle:v4 image:v5 identifier:0 handler:&v8];

  objc_msgSend(v6, "setAttributes:", 2, v8, v9, v10, v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v6;
}

void __53__CKKeyTransparencyTranscriptCell_clearWarningAction__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained delegate];
  id v3 = objc_loadWeakRetained(v1);
  [v2 keyTransparencyTranscriptCellDidSelectIgnoreFailures:v3];
}

- (void)setActionButton:(id)a3
{
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (unint64_t)keyTransparencyStatus
{
  return self->_keyTransparencyStatus;
}

- (BOOL)isGroupChat
{
  return self->_isGroupChat;
}

- (CKKeyTransparencyTranscriptCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKKeyTransparencyTranscriptCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setLabel:(id)a3
{
}

- (void)setWarningImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_warningImageView, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_attributedText, 0);

  objc_storeStrong((id *)&self->_actionButton, 0);
}

@end