@interface CKJunkRecoveryTranscriptCell
+ (double)heightForChatItem:(id)a3 fittingSize:(CGSize)a4;
+ (id)_attributedRecoverConversationStringWithDeletionDate:(id)a3;
+ (id)generateDeleteConversationButton;
+ (id)generateRecoverConversationTextView;
+ (id)generateRecoverJunkButton;
+ (id)reuseIdentifier;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (CKJunkRecoveryTranscriptCell)initWithFrame:(CGRect)a3;
- (CKJunkRecoveryTranscriptCellDelegate)delegate;
- (UIButton)deleteConversationButton;
- (UIButton)recoverJunkButton;
- (UITextView)recoverConversationTextView;
- (void)_configureRecoverConversationTextView:(id)a3;
- (void)_layoutLabelInAlignmentContentRect:(CGRect)a3;
- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7;
- (void)deleteConversationButtonPressed:(id)a3;
- (void)layoutSubviewsForAlignmentContents;
- (void)prepareForReuse;
- (void)recoverJunkButtonPressed:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeleteConversationButton:(id)a3;
- (void)setRecoverConversationTextView:(id)a3;
- (void)setRecoverJunkButton:(id)a3;
- (void)updateRecoverConversationTextViewContentForDate:(id)a3;
@end

@implementation CKJunkRecoveryTranscriptCell

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  uint64_t v9 = a5;
  id v12 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CKJunkRecoveryTranscriptCell;
  [(CKTranscriptCell *)&v16 configureForChatItem:v12 context:a4 animated:v9 animationDuration:a7 animationCurve:a6];
  v13 = [v12 IMChatItem];
  objc_opt_class();
  LOBYTE(v9) = objc_opt_isKindOfClass();

  if (v9)
  {
    v14 = [v12 IMChatItem];
    v15 = [v14 earliestMessageDate];
    [(CKJunkRecoveryTranscriptCell *)self updateRecoverConversationTextViewContentForDate:v15];
  }
  [(CKJunkRecoveryTranscriptCell *)self setNeedsLayout];
}

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (id)generateDeleteConversationButton
{
  v2 = [MEMORY[0x1E4F427E0] buttonWithType:1];
  v3 = +[CKUIBehavior sharedBehaviors];
  [v3 transcriptButtonContentEdgeInsets];
  objc_msgSend(v2, "setContentEdgeInsets:");

  if (CKIsRunningInMacCatalyst())
  {
    v4 = 0;
  }
  else
  {
    v5 = +[CKUIBehavior sharedBehaviors];
    v4 = [v5 centerTranscriptButtonTextAttributes];
  }
  id v6 = objc_alloc(MEMORY[0x1E4F28B18]);
  v7 = NSString;
  v8 = CKFrameworkBundle();
  uint64_t v9 = [v8 localizedStringForKey:@"DELETE_CONVERSATION" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v10 = objc_msgSend(v7, "localizedStringWithFormat:", v9, 1);

  v11 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v12 = [v11 userInterfaceLayoutDirection];

  if (v12 == 1) {
    v13 = @"\u200F";
  }
  else {
    v13 = @"\u200E";
  }
  v14 = [(__CFString *)v13 stringByAppendingString:v10];

  v15 = (void *)[v6 initWithString:v14 attributes:v4];
  [v2 setAttributedTitle:v15 forState:0];

  return v2;
}

+ (id)generateRecoverJunkButton
{
  v2 = [MEMORY[0x1E4F427E0] buttonWithType:1];
  v3 = +[CKUIBehavior sharedBehaviors];
  [v3 transcriptButtonContentEdgeInsets];
  objc_msgSend(v2, "setContentEdgeInsets:");

  if (CKIsRunningInMacCatalyst())
  {
    v4 = 0;
  }
  else
  {
    v5 = +[CKUIBehavior sharedBehaviors];
    v4 = [v5 centerTranscriptButtonTextAttributes];
  }
  id v6 = objc_alloc(MEMORY[0x1E4F28B18]);
  v7 = CKFrameworkBundle();
  v8 = [v7 localizedStringForKey:@"NOT_JUNK" value:&stru_1EDE4CA38 table:@"ChatKit"];
  uint64_t v9 = (void *)[v6 initWithString:v8 attributes:v4];

  [v2 setAttributedTitle:v9 forState:0];

  return v2;
}

+ (id)generateRecoverConversationTextView
{
  id v3 = objc_alloc(MEMORY[0x1E4F42F58]);
  v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v5 = [a1 _attributedRecoverConversationStringWithDeletionDate:0];
  [v4 setAttributedText:v5];

  return v4;
}

+ (id)_attributedRecoverConversationStringWithDeletionDate:(id)a3
{
  id v3 = a3;
  if (v3) {
    unint64_t v4 = +[CKUtilities daysUntilJunkFilterDeletionForDate:v3];
  }
  else {
    unint64_t v4 = 90;
  }
  v5 = NSString;
  id v6 = CKFrameworkBundle();
  v7 = [v6 localizedStringForKey:@"JUNK_CONVERSATION_WILL_BE_DELETED_IN_DAYS" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v8 = objc_msgSend(v5, "localizedStringWithFormat:", v7, v4);

  uint64_t v9 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v10 = [v9 userInterfaceLayoutDirection];

  if (v10 == 1) {
    v11 = @"\u200F";
  }
  else {
    v11 = @"\u200E";
  }
  uint64_t v12 = [(__CFString *)v11 stringByAppendingString:v8];

  v13 = +[CKUIBehavior sharedBehaviors];
  v14 = [v13 transcriptEmphasizedFontAttributes];

  v15 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v12 attributes:v14];

  return v15;
}

+ (double)heightForChatItem:(id)a3 fittingSize:(CGSize)a4
{
  double width = a4.width;
  v5 = objc_msgSend(a1, "generateRecoverConversationTextView", a3, a4.width, a4.height);
  id v6 = +[CKJunkRecoveryTranscriptCell generateDeleteConversationButton];
  v7 = +[CKJunkRecoveryTranscriptCell generateRecoverJunkButton];
  double v8 = width + -48.0;
  objc_msgSend(v5, "sizeThatFits:", v8, 1.79769313e308);
  double v10 = v9;
  objc_msgSend(v6, "sizeThatFits:", v8, 1.79769313e308);
  double v12 = v11;
  objc_msgSend(v7, "sizeThatFits:", v8, 1.79769313e308);
  double v14 = v13 + v12 + v10 + 8.0 + 10.0 + 10.0 + 32.0;

  return v14;
}

- (CKJunkRecoveryTranscriptCell)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CKJunkRecoveryTranscriptCell;
  id v3 = -[CKTranscriptCell initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  unint64_t v4 = v3;
  if (v3)
  {
    v5 = [(CKEditableCollectionViewCell *)v3 contentView];
    id v6 = [(CKJunkRecoveryTranscriptCell *)v4 recoverConversationTextView];
    [v5 addSubview:v6];

    v7 = [(CKEditableCollectionViewCell *)v4 contentView];
    double v8 = [(CKJunkRecoveryTranscriptCell *)v4 deleteConversationButton];
    [v7 addSubview:v8];

    double v9 = [(CKEditableCollectionViewCell *)v4 contentView];
    double v10 = [(CKJunkRecoveryTranscriptCell *)v4 recoverJunkButton];
    [v9 addSubview:v10];
  }
  return v4;
}

- (void)layoutSubviewsForAlignmentContents
{
  v35.receiver = self;
  v35.super_class = (Class)CKJunkRecoveryTranscriptCell;
  [(CKEditableCollectionViewCell *)&v35 layoutSubviewsForAlignmentContents];
  [(CKEditableCollectionViewCell *)self contentAlignmentRect];
  double y = v36.origin.y;
  double width = v36.size.width;
  double height = v36.size.height;
  double MidX = CGRectGetMidX(v36);
  if (width + -48.0 <= 420.0) {
    double v7 = width + -48.0;
  }
  else {
    double v7 = 420.0;
  }
  double v8 = [(CKJunkRecoveryTranscriptCell *)self traitCollection];
  [v8 displayScale];
  CGFloat v10 = MidX - round(v9 * (v7 * 0.5)) / v9;

  -[CKEditableCollectionViewCell setContentAlignmentRect:](self, "setContentAlignmentRect:", v10, y, v7, height);
  -[CKJunkRecoveryTranscriptCell _layoutLabelInAlignmentContentRect:](self, "_layoutLabelInAlignmentContentRect:", v10, y, v7, height);
  double v11 = [(CKJunkRecoveryTranscriptCell *)self deleteConversationButton];
  objc_msgSend(v11, "sizeThatFits:", v7, 1.79769313e308);
  double v13 = v12;
  double v34 = v14;

  v37.origin.x = v10;
  v37.origin.double y = y;
  v37.size.double width = v7;
  v37.size.double height = height;
  double v15 = CGRectGetMidX(v37);
  objc_super v16 = [(CKJunkRecoveryTranscriptCell *)self traitCollection];
  [v16 displayScale];
  double v18 = v15 - round(v13 * 0.5 * v17) / v17;

  v19 = [(CKJunkRecoveryTranscriptCell *)self recoverConversationTextView];
  [v19 frame];
  double MaxY = CGRectGetMaxY(v38);

  v21 = [(CKJunkRecoveryTranscriptCell *)self deleteConversationButton];
  objc_msgSend(v21, "setFrame:", v18, MaxY, v13, v34);

  v22 = [(CKJunkRecoveryTranscriptCell *)self recoverJunkButton];
  objc_msgSend(v22, "sizeThatFits:", v7, 1.79769313e308);
  double v24 = v23;
  double v26 = v25;

  v39.origin.x = v10;
  v39.origin.double y = y;
  v39.size.double width = v7;
  v39.size.double height = height;
  double v27 = CGRectGetMidX(v39);
  v28 = [(CKJunkRecoveryTranscriptCell *)self traitCollection];
  [v28 displayScale];
  double v30 = v27 - round(v24 * 0.5 * v29) / v29;

  v31 = [(CKJunkRecoveryTranscriptCell *)self deleteConversationButton];
  [v31 frame];
  CGFloat v32 = CGRectGetMaxY(v40) + 10.0;

  v33 = [(CKJunkRecoveryTranscriptCell *)self recoverJunkButton];
  objc_msgSend(v33, "setFrame:", v30, v32, v24, v26);
}

- (void)_layoutLabelInAlignmentContentRect:(CGRect)a3
{
  double width = a3.size.width;
  double x = a3.origin.x;
  id v7 = [(CKJunkRecoveryTranscriptCell *)self recoverConversationTextView];
  objc_msgSend(v7, "sizeThatFits:", width, 1.79769313e308);
  objc_msgSend(v7, "setFrame:", x, 8.0, v6, v5 + 10.0);
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)CKJunkRecoveryTranscriptCell;
  [(CKTranscriptCell *)&v3 prepareForReuse];
  [(CKJunkRecoveryTranscriptCell *)self setNeedsLayout];
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v7 = [(CKJunkRecoveryTranscriptCell *)self delegate];
  [v7 recoverJunkPressedInTranscriptCell:self];

  return 0;
}

- (void)recoverJunkButtonPressed:(id)a3
{
  id v4 = [(CKJunkRecoveryTranscriptCell *)self delegate];
  [v4 recoverJunkPressedInTranscriptCell:self];
}

- (void)deleteConversationButtonPressed:(id)a3
{
  id v4 = [(CKJunkRecoveryTranscriptCell *)self delegate];
  [v4 deleteConversationPressedInTranscriptCell:self];
}

- (UITextView)recoverConversationTextView
{
  recoverConversationTextView = self->_recoverConversationTextView;
  if (!recoverConversationTextView)
  {
    id v4 = +[CKJunkRecoveryTranscriptCell generateRecoverConversationTextView];
    double v5 = self->_recoverConversationTextView;
    self->_recoverConversationTextView = v4;

    [(CKJunkRecoveryTranscriptCell *)self _configureRecoverConversationTextView:self->_recoverConversationTextView];
    recoverConversationTextView = self->_recoverConversationTextView;
  }

  return recoverConversationTextView;
}

- (void)_configureRecoverConversationTextView:(id)a3
{
  id v6 = a3;
  [v6 _setInteractiveTextSelectionDisabled:1];
  [v6 setScrollEnabled:0];
  [v6 setEditable:0];
  [v6 setSelectable:1];
  [v6 setUserInteractionEnabled:1];
  [v6 setDelegate:self];
  id v4 = [v6 textDragInteraction];
  [v4 setEnabled:0];

  double v5 = [MEMORY[0x1E4F428B8] clearColor];
  [v6 setBackgroundColor:v5];

  [v6 setClipsToBounds:0];
  [v6 setAdjustsFontForContentSizeCategory:1];
}

- (void)updateRecoverConversationTextViewContentForDate:(id)a3
{
  id v5 = +[CKJunkRecoveryTranscriptCell _attributedRecoverConversationStringWithDeletionDate:a3];
  id v4 = [(CKJunkRecoveryTranscriptCell *)self recoverConversationTextView];
  [v4 setAttributedText:v5];
}

- (UIButton)deleteConversationButton
{
  deleteConversationButton = self->_deleteConversationButton;
  if (!deleteConversationButton)
  {
    id v4 = +[CKJunkRecoveryTranscriptCell generateDeleteConversationButton];
    id v5 = self->_deleteConversationButton;
    self->_deleteConversationButton = v4;

    [(UIButton *)self->_deleteConversationButton addTarget:self action:sel_deleteConversationButtonPressed_ forEvents:64];
    deleteConversationButton = self->_deleteConversationButton;
  }

  return deleteConversationButton;
}

- (UIButton)recoverJunkButton
{
  recoverJunkButton = self->_recoverJunkButton;
  if (!recoverJunkButton)
  {
    id v4 = +[CKJunkRecoveryTranscriptCell generateRecoverJunkButton];
    id v5 = self->_recoverJunkButton;
    self->_recoverJunkButton = v4;

    [(UIButton *)self->_recoverJunkButton addTarget:self action:sel_recoverJunkButtonPressed_ forEvents:64];
    recoverJunkButton = self->_recoverJunkButton;
  }

  return recoverJunkButton;
}

- (CKJunkRecoveryTranscriptCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKJunkRecoveryTranscriptCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setRecoverConversationTextView:(id)a3
{
}

- (void)setDeleteConversationButton:(id)a3
{
}

- (void)setRecoverJunkButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recoverJunkButton, 0);
  objc_storeStrong((id *)&self->_deleteConversationButton, 0);
  objc_storeStrong((id *)&self->_recoverConversationTextView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end