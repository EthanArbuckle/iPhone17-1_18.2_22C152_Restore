@interface CKConversationListNewMessageCell
+ (id)identifier;
- (BOOL)_boundsShouldCollapseContent:(CGRect)a3;
- (BOOL)_isCollapsed;
- (BOOL)showingEditControl;
- (CKAvatarView)avatarView;
- (CKConversation)conversation;
- (CKConversationListCellDelegate)delegate;
- (CKConversationListCellLayout)cellLayout;
- (CKConversationListNewMessageCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIButton)closeButton;
- (double)leadingLayoutMargin;
- (void)_updateLabelVisibility;
- (void)deleteButtonTapped;
- (void)layoutSubviews;
- (void)setCellLayout:(id)a3;
- (void)setConversation:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)updateContentsForConversation:(id)a3;
- (void)updateFontSize;
- (void)updateWithForwardedConfigurationState:(id)a3;
@end

@implementation CKConversationListNewMessageCell

+ (id)identifier
{
  v2 = (void *)identifier___identifier;
  if (!identifier___identifier)
  {
    uint64_t v3 = [[NSString alloc] initWithFormat:@"%@Identifier", objc_opt_class()];
    v4 = (void *)identifier___identifier;
    identifier___identifier = v3;

    v2 = (void *)identifier___identifier;
  }

  return v2;
}

- (CKConversationListNewMessageCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v24.receiver = self;
  v24.super_class = (Class)CKConversationListNewMessageCell;
  v4 = [(CKConversationListNewMessageCell *)&v24 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = +[CKUIBehavior sharedBehaviors];
    v6 = [v5 theme];

    v7 = CKFrameworkBundle();
    v8 = [v7 localizedStringForKey:@"NEW_MESSAGE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v9 = [(CKConversationListNewMessageCell *)v4 textLabel];
    [v9 setText:v8];

    v10 = [(CKConversationListNewMessageCell *)v4 textLabel];
    v11 = [v6 conversationListSenderColor];
    [v10 setTextColor:v11];

    v12 = [(CKConversationListNewMessageCell *)v4 textLabel];
    [v12 setHighlightedTextColor:0];

    v13 = +[CKUIBehavior sharedBehaviors];
    LODWORD(v11) = [v13 showsHoverToDeleteButtonForNewCompose];

    if (v11)
    {
      v14 = [MEMORY[0x1E4F42A80] imageNamed:@"SidebarCloseImage"];
      v15 = [MEMORY[0x1E4F42A80] imageNamed:@"SidebarCloseAlternate"];
      uint64_t v16 = [MEMORY[0x1E4F427E0] buttonWithType:0];
      closeButton = v4->_closeButton;
      v4->_closeButton = (UIButton *)v16;

      [(UIButton *)v4->_closeButton setImage:v14 forState:0];
      [(UIButton *)v4->_closeButton setImage:v15 forState:1];
      [(UIButton *)v4->_closeButton addTarget:v4 action:sel_deleteButtonTapped forEvents:64];
      v18 = [(UIButton *)v4->_closeButton imageView];
      v19 = +[CKUIBehavior sharedBehaviors];
      v20 = [v19 theme];
      v21 = [v20 conversationListSummaryColor];
      [v18 setTintColor:v21];

      v22 = [(CKConversationListNewMessageCell *)v4 contentView];
      [v22 addSubview:v4->_closeButton];

      [(UIButton *)v4->_closeButton setHidden:1];
    }
    [(CKConversationListNewMessageCell *)v4 updateFontSize];
  }
  return v4;
}

- (void)updateWithForwardedConfigurationState:(id)a3
{
  id v4 = a3;
  v5 = +[CKUIBehavior sharedBehaviors];
  v6 = [(CKConversationListNewMessageCell *)self traitCollection];
  char v7 = [v5 useSelectedAppearanceForConversationCellState:v4 traitCollection:v6];

  v8 = +[CKUIBehavior sharedBehaviors];
  v9 = [v8 theme];
  v10 = v9;
  if (v7) {
    [v9 conversationListCellSelectedTextColor];
  }
  else {
  id v16 = [v9 conversationListSenderColor];
  }

  v11 = [(CKConversationListNewMessageCell *)self textLabel];
  id v12 = [v11 textColor];

  if (v12 != v16)
  {
    v13 = [(CKConversationListNewMessageCell *)self textLabel];
    [v13 setTextColor:v16];
  }
  v14 = [MEMORY[0x1E4F427B0] listPlainCellConfiguration];
  v15 = [MEMORY[0x1E4F428B8] clearColor];
  [v14 setBackgroundColor:v15];

  [(CKConversationListNewMessageCell *)self setBackgroundConfiguration:v14];
}

- (void)layoutSubviews
{
  v96.receiver = self;
  v96.super_class = (Class)CKConversationListNewMessageCell;
  [(CKConversationListNewMessageCell *)&v96 layoutSubviews];
  uint64_t v4 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
  if (CKIsRunningInMacCatalyst())
  {
    int v5 = 1;
  }
  else
  {
    [(CKConversationListNewMessageCell *)self bounds];
    double v7 = v6;
    v8 = +[CKUIBehavior sharedBehaviors];
    [v8 conversationListMinimumWidthForHiddenContactImage];
    if (v7 <= v9)
    {
      int v5 = 0;
    }
    else
    {
      v10 = +[CKUIBehavior sharedBehaviors];
      int v5 = [v10 canShowContactPhotosInConversationList];
    }
  }
  v11 = [(CKConversationListNewMessageCell *)self traitCollection];
  [v11 displayScale];
  double v13 = v12;

  v14 = [(CKConversationListNewMessageCell *)self textLabel];
  [v14 frame];
  double v16 = v15;
  [v14 sizeToFit];
  v17 = +[CKUIBehavior sharedBehaviors];
  [v17 conversationListCellLeftMargin];
  double v19 = v18;

  if (v5)
  {
    v20 = +[CKUIBehavior sharedBehaviors];
    [v20 conversationListContactImageDiameter];
    double v22 = v19 + v21;

    v23 = +[CKUIBehavior sharedBehaviors];
    [v23 conversationListContactImageTrailingSpace];
    double v19 = v22 + v24;
  }
  double v25 = v19;
  if (v4)
  {
    v26 = [(CKConversationListNewMessageCell *)self contentView];
    [v26 bounds];
    double v28 = v27;
    [v14 frame];
    double v30 = v28 - v29 - v19;
    [(CKConversationListNewMessageCell *)self safeAreaInsets];
    double v25 = v30 - v31;
  }
  [v14 bounds];
  double v33 = v32;
  double v35 = v34;
  if (CKIsRunningInMacCatalyst())
  {
    v36 = +[CKUIBehavior sharedBehaviors];
    [v36 conversationListCellRightMargin];
    double v19 = v19 + v37;
  }
  v38 = [(CKConversationListNewMessageCell *)self contentView];
  [v38 bounds];
  double v40 = v39 - v19;

  if (v33 > v40)
  {
    v41 = [(CKConversationListNewMessageCell *)self contentView];
    [v41 bounds];
    double v43 = v42 - v19;

    double v44 = v33 - v43;
    if (!v4) {
      double v44 = -0.0;
    }
    double v25 = v25 + v44;
    double v33 = v43;
  }
  v45 = [(CKConversationListNewMessageCell *)self contentView];
  [v45 bounds];
  double v47 = v46;

  if (v35 > v47)
  {
    v48 = [(CKConversationListNewMessageCell *)self contentView];
    [v48 bounds];
    double v35 = v49;
  }
  objc_msgSend(v14, "setFrame:", v25, v16, v33, v35);
  v50 = [(CKConversationListNewMessageCell *)self cellLayout];
  v51 = [(CKConversationListNewMessageCell *)self cellLayout];

  if (!v51)
  {
    v93 = [MEMORY[0x1E4F28B00] currentHandler];
    v94 = (objc_class *)objc_opt_class();
    v95 = NSStringFromClass(v94);
    [v93 handleFailureInMethod:a2, self, @"CKConversationListNewMessageCell.m", 141, @"%@ needs a cell layout.", v95 object file lineNumber description];
  }
  if (CKIsRunningInMacCatalyst())
  {
    v52 = [(CKConversationListNewMessageCell *)self contentView];
    [v52 bounds];
    BOOL v53 = -[CKConversationListNewMessageCell _boundsShouldCollapseContent:](self, "_boundsShouldCollapseContent:");
  }
  else
  {
    BOOL v53 = 0;
  }
  v54 = +[CKUIBehavior sharedBehaviors];
  int v55 = [v54 showsHoverToDeleteButtonForNewCompose];

  if (v55)
  {
    v56 = [(CKConversationListNewMessageCell *)self contentView];
    [v56 frame];
    double v58 = v57;

    v59 = +[CKUIBehavior sharedBehaviors];
    [v59 conversationListCellCloseButtonWidth];
    double v61 = v60 * 0.5;

    if (v4)
    {
      [v50 trailingLayoutMarginSize];
      double v63 = v62;
      if (v53)
      {
        v64 = +[CKUIBehavior sharedBehaviors];
        [v64 conversationListContactImageTrailingSpace];
        double v66 = (v63 + v65) * 0.5;

        double v63 = v66 - v61;
      }
    }
    else if (v53)
    {
      [v50 trailingLayoutMarginSize];
      double v68 = v67;
      v69 = +[CKUIBehavior sharedBehaviors];
      [v69 conversationListContactImageTrailingSpace];
      double v71 = (v68 + v70) * -0.5;

      double v63 = v58 + v71 - v61;
    }
    else
    {
      v72 = [(CKConversationListNewMessageCell *)self contentView];
      [v72 frame];
      double v74 = v73;
      [v50 trailingLayoutMarginSize];
      double v76 = v74 - v75;
      v77 = +[CKUIBehavior sharedBehaviors];
      [v77 conversationListCellCloseButtonWidth];
      double v63 = v76 - v78;
    }
    v79 = [(CKConversationListNewMessageCell *)self contentView];
    [v79 frame];
    double v81 = v80 * 0.5;
    v82 = +[CKUIBehavior sharedBehaviors];
    [v82 conversationListCellCloseButtonHeight];
    double v84 = v81 - v83 * 0.5;
    v85 = +[CKUIBehavior sharedBehaviors];
    [v85 conversationListCellCloseButtonWidth];
    double v87 = v86;
    v88 = +[CKUIBehavior sharedBehaviors];
    [v88 conversationListCellCloseButtonHeight];
    double v90 = v89;

    -[UIButton setFrame:](self->_closeButton, "setFrame:", round(v13 * v63) / v13, round(v13 * v84) / v13, round(v13 * v87) / v13, round(v13 * v90) / v13);
    v91 = [(CKConversationListNewMessageCell *)self contentView];
    [v91 bringSubviewToFront:self->_closeButton];
  }
  v92 = +[CKUIBehavior sharedBehaviors];
  [v92 topConversationListSpace];
  objc_msgSend(v14, "_setFirstLineCapFrameOriginY:");

  [(CKConversationListNewMessageCell *)self _updateLabelVisibility];
}

- (void)_updateLabelVisibility
{
  if (CKIsRunningInMacCatalyst())
  {
    BOOL v3 = [(CKConversationListNewMessageCell *)self _isCollapsed];
    uint64_t v4 = [(CKConversationListNewMessageCell *)self textLabel];
    [v4 setHidden:v3];

    int v5 = [(CKConversationListNewMessageCell *)self conversation];

    if (!v5) {
      goto LABEL_12;
    }
    double v6 = [(CKConversationListNewMessageCell *)self conversation];
    int v7 = [v6 hasDisplayName];

    v8 = [(CKConversationListNewMessageCell *)self conversation];
    double v9 = v8;
    if (v7)
    {
      v10 = [v8 displayName];
    }
    else
    {
      v10 = [v8 name];

      double v9 = [(CKConversationListNewMessageCell *)self conversation];
      [v9 fetchSuggestedNameIfNecessary];
    }

    if (v10)
    {
      v11 = NSString;
      double v12 = CKFrameworkBundle();
      double v13 = [v12 localizedStringForKey:@"NEW_MESSAGE_TO" value:&stru_1EDE4CA38 table:@"ChatKit"];
      v14 = objc_msgSend(v11, "stringWithFormat:", v13, v10);

      double v15 = [MEMORY[0x1E4F42738] sharedApplication];
      uint64_t v16 = [v15 userInterfaceLayoutDirection];

      if (v16 == 1) {
        v17 = @"\u200F";
      }
      else {
        v17 = @"\u200E";
      }
      id v25 = [(__CFString *)v17 stringByAppendingString:v14];
    }
    else
    {
LABEL_12:
      double v18 = NSString;
      double v19 = CKFrameworkBundle();
      v20 = [v19 localizedStringForKey:@"NEW_MESSAGE" value:&stru_1EDE4CA38 table:@"ChatKit"];
      v10 = [v18 stringWithFormat:v20];

      double v21 = [MEMORY[0x1E4F42738] sharedApplication];
      uint64_t v22 = [v21 userInterfaceLayoutDirection];

      if (v22 == 1) {
        v23 = @"\u200F";
      }
      else {
        v23 = @"\u200E";
      }
      id v25 = [(__CFString *)v23 stringByAppendingString:v10];
    }

    double v24 = [(CKConversationListNewMessageCell *)self textLabel];
    [v24 setText:v25];
  }
}

- (BOOL)_isCollapsed
{
  v2 = self;
  BOOL v3 = [(CKConversationListNewMessageCell *)self contentView];
  [v3 bounds];
  LOBYTE(v2) = -[CKConversationListNewMessageCell _boundsShouldCollapseContent:](v2, "_boundsShouldCollapseContent:");

  return (char)v2;
}

- (BOOL)_boundsShouldCollapseContent:(CGRect)a3
{
  double width = a3.size.width;
  if (!CKIsRunningInMacCatalyst()) {
    return 0;
  }
  uint64_t v4 = +[CKUIBehavior sharedBehaviors];
  [v4 snapToMinConversationListCellWidth];
  BOOL v6 = width < v5;

  return v6;
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKConversationListNewMessageCell;
  [(CKConversationListNewMessageCell *)&v11 setSelected:a3 animated:a4];
  BOOL v6 = [(UIButton *)self->_closeButton imageView];
  int v7 = +[CKUIBehavior sharedBehaviors];
  v8 = [v7 theme];
  double v9 = v8;
  if (v4) {
    [v8 conversationListCellSelectedSummaryColor];
  }
  else {
  v10 = [v8 conversationListSummaryColor];
  }
  [v6 setTintColor:v10];
}

- (void)updateFontSize
{
  BOOL v3 = +[CKUIBehavior sharedBehaviors];
  BOOL v4 = [v3 conversationListSenderFont];
  double v5 = [(CKConversationListNewMessageCell *)self textLabel];
  [v5 setFont:v4];

  [(CKConversationListNewMessageCell *)self setNeedsLayout];
}

- (void)deleteButtonTapped
{
  id v3 = [(CKConversationListNewMessageCell *)self delegate];
  [v3 selectedDeleteButtonForConversation:0 inCell:self];
}

- (double)leadingLayoutMargin
{
  double v2 = 16.0;
  if (![(CKConversationListNewMessageCell *)self showingEditControl])
  {
    id v3 = +[CKUIBehavior sharedBehaviors];
    [v3 conversationListCellLeftMargin];
    *(float *)&double v4 = v4;
    double v2 = *(float *)&v4;
  }
  return v2;
}

- (BOOL)showingEditControl
{
  return [(CKConversationListNewMessageCell *)self currentStateMask] & 1;
}

- (void)updateContentsForConversation:(id)a3
{
  [(CKConversationListNewMessageCell *)self setConversation:a3];

  [(CKConversationListNewMessageCell *)self _updateLabelVisibility];
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
}

- (CKConversationListCellLayout)cellLayout
{
  return self->_cellLayout;
}

- (void)setCellLayout:(id)a3
{
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (CKConversationListCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKConversationListCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CKAvatarView)avatarView
{
  return self->_avatarView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_cellLayout, 0);

  objc_storeStrong((id *)&self->_conversation, 0);
}

@end