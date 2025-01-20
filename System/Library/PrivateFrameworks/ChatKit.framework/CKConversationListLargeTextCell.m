@interface CKConversationListLargeTextCell
+ (double)cellHeightForDisplayScale:(double)a3;
+ (id)hyphenationParagraphStyle;
+ (id)identifierForConversation:(id)a3;
- (CKConversationListLargeTextCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSArray)contentSizeCategoryDependentConstraints;
- (NSArray)indicatorTextAttachments;
- (NSLayoutConstraint)editingDependentConstraint;
- (NSTextAttachment)unreadIndicatorAttachment;
- (UILayoutGuide)firstLineLayoutGuide;
- (id)_constraintForEditing:(BOOL)a3;
- (id)_contentSizeCategoryDependentConstraints;
- (id)summaryLabelTextBaseColor;
- (id)unreadIndicatorImageForVisibility:(BOOL)a3 withMuteState:(BOOL)a4;
- (void)contentSizeCategoryDidChange;
- (void)setContentSizeCategoryDependentConstraints:(id)a3;
- (void)setEditingDependentConstraint:(id)a3;
- (void)setFirstLineLayoutGuide:(id)a3;
- (void)setIndicatorTextAttachments:(id)a3;
- (void)setUnreadIndicatorAttachment:(id)a3;
- (void)updateContentsForConversation:(id)a3 fastPreview:(BOOL)a4;
- (void)updateForEditing:(BOOL)a3;
- (void)updateFromLabelWithText:(id)a3;
- (void)updateUnreadIndicatorWithImage:(id)a3;
@end

@implementation CKConversationListLargeTextCell

+ (id)identifierForConversation:(id)a3
{
  return @"CKConversationListLargeTextCellIdentifier";
}

+ (id)hyphenationParagraphStyle
{
  if (hyphenationParagraphStyle_onceToken != -1) {
    dispatch_once(&hyphenationParagraphStyle_onceToken, &__block_literal_global_84);
  }
  v2 = (void *)hyphenationParagraphStyle_hyphenationParagraphStyle;

  return v2;
}

void __60__CKConversationListLargeTextCell_hyphenationParagraphStyle__block_invoke()
{
  v0 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
  v1 = (void *)[v0 mutableCopy];

  LODWORD(v2) = 1.0;
  [v1 setHyphenationFactor:v2];
  [v1 setLineBreakMode:4];
  v3 = (void *)hyphenationParagraphStyle_hyphenationParagraphStyle;
  hyphenationParagraphStyle_hyphenationParagraphStyle = (uint64_t)v1;
}

+ (double)cellHeightForDisplayScale:(double)a3
{
  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___CKConversationListLargeTextCell;
  objc_msgSendSuper2(&v13, sel_cellHeightForDisplayScale_);
  double v4 = v3;
  v5 = +[CKUIBehavior sharedBehaviors];
  v6 = [v5 conversationListDateFont];

  v7 = +[CKUIBehavior sharedBehaviors];
  [v7 senderSummaryConversationListSpace];
  double v9 = v8;

  [v6 capHeight];
  UIRoundToScale();
  double v11 = v4 + v9 + v10;

  return v11;
}

- (CKConversationListLargeTextCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v106[8] = *MEMORY[0x1E4F143B8];
  v103.receiver = self;
  v103.super_class = (Class)CKConversationListLargeTextCell;
  double v4 = [(CKConversationListCell *)&v103 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(CKConversationListCell *)v4 dateLabel];
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

    v7 = [(CKConversationListCell *)v5 dateLabel];
    [v7 setTextAlignment:4];

    double v8 = [(CKConversationListCell *)v5 dateLabel];
    double v9 = +[CKUIBehavior sharedBehaviors];
    double v10 = [v9 theme];
    double v11 = [v10 conversationListLargeTextDateColor];
    [v8 setTextColor:v11];

    v12 = [(CKConversationListLargeTextCell *)v5 contentView];
    objc_super v13 = [(CKConversationListCell *)v5 dateLabel];
    [v12 addSubview:v13];

    v14 = [(CKConversationListCell *)v5 fromLabel];
    [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

    v15 = [(CKConversationListCell *)v5 fromLabel];
    [v15 setNumberOfLines:2];

    v16 = [(CKConversationListCell *)v5 summaryLabel];
    [v16 setTranslatesAutoresizingMaskIntoConstraints:0];

    v17 = [(CKConversationListLargeTextCell *)v5 contentView];
    v18 = [(CKConversationListCell *)v5 summaryLabel];
    [v17 addSubview:v18];

    v19 = [(CKConversationListCell *)v5 chevronImageView];
    [v19 setTranslatesAutoresizingMaskIntoConstraints:0];

    v20 = [(CKConversationListCell *)v5 chevronImageView];
    LODWORD(v21) = 1148846080;
    [v20 setContentHuggingPriority:0 forAxis:v21];

    id v22 = objc_alloc_init(MEMORY[0x1E4F42B48]);
    v23 = [(CKConversationListLargeTextCell *)v5 contentView];
    [v23 addLayoutGuide:v22];

    v101 = v22;
    [(CKConversationListLargeTextCell *)v5 setFirstLineLayoutGuide:v22];
    v102 = [MEMORY[0x1E4F1CA48] array];
    v98 = [(CKConversationListCell *)v5 fromLabel];
    v94 = [v98 leadingAnchor];
    v95 = [(CKConversationListLargeTextCell *)v5 contentView];
    v92 = [v95 leadingAnchor];
    v93 = +[CKUIBehavior sharedBehaviors];
    [v93 conversationListCellLargeTextLeftMargin];
    v91 = objc_msgSend(v94, "constraintEqualToAnchor:constant:", v92);
    v106[0] = v91;
    v90 = [(CKConversationListCell *)v5 summaryLabel];
    v88 = [v90 leadingAnchor];
    v89 = [(CKConversationListCell *)v5 fromLabel];
    v87 = [v89 leadingAnchor];
    v86 = [v88 constraintEqualToAnchor:v87];
    v106[1] = v86;
    v85 = [(CKConversationListCell *)v5 summaryLabel];
    v83 = [v85 trailingAnchor];
    v84 = [(CKConversationListCell *)v5 fromLabel];
    v82 = [v84 trailingAnchor];
    v81 = [v83 constraintEqualToAnchor:v82];
    v106[2] = v81;
    v80 = [(CKConversationListCell *)v5 dateLabel];
    v78 = [v80 leadingAnchor];
    v79 = [(CKConversationListCell *)v5 fromLabel];
    v77 = [v79 leadingAnchor];
    v76 = [v78 constraintEqualToAnchor:v77];
    v106[3] = v76;
    v75 = [(CKConversationListCell *)v5 dateLabel];
    v73 = [v75 trailingAnchor];
    v74 = [(CKConversationListCell *)v5 fromLabel];
    v72 = [v74 trailingAnchor];
    v71 = [v73 constraintEqualToAnchor:v72];
    v106[4] = v71;
    v70 = [(CKConversationListLargeTextCell *)v5 firstLineLayoutGuide];
    v68 = [v70 bottomAnchor];
    v69 = [(CKConversationListCell *)v5 fromLabel];
    v67 = [v69 firstBaselineAnchor];
    v66 = [v68 constraintEqualToAnchor:v67];
    v106[5] = v66;
    v65 = [(CKConversationListCell *)v5 summaryLabel];
    v63 = [v65 topAnchor];
    v64 = [(CKConversationListCell *)v5 fromLabel];
    v24 = [v64 bottomAnchor];
    v25 = +[CKUIBehavior sharedBehaviors];
    [v25 conversationListCellLargeTextSenderSummaryInterspacing];
    v26 = objc_msgSend(v63, "constraintEqualToAnchor:constant:", v24);
    v106[6] = v26;
    v27 = [(CKConversationListCell *)v5 dateLabel];
    v28 = [v27 topAnchor];
    v29 = [(CKConversationListCell *)v5 summaryLabel];
    v30 = [v29 bottomAnchor];
    v31 = [v28 constraintEqualToAnchor:v30];
    v106[7] = v31;
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v106 count:8];
    [v102 addObjectsFromArray:v32];

    v33 = [(CKConversationListCell *)v5 chevronImageView];

    if (v33)
    {
      v99 = [(CKConversationListCell *)v5 chevronImageView];
      v96 = [v99 centerYAnchor];
      v34 = [(CKConversationListLargeTextCell *)v5 firstLineLayoutGuide];
      v35 = [v34 centerYAnchor];
      v36 = [v96 constraintEqualToAnchor:v35];
      v105[0] = v36;
      v37 = [(CKConversationListCell *)v5 chevronImageView];
      v38 = [v37 trailingAnchor];
      v39 = [(CKConversationListLargeTextCell *)v5 contentView];
      v40 = [v39 trailingAnchor];
      [(CKConversationListLargeTextCell *)v5 layoutMargins];
      v42 = [v38 constraintEqualToAnchor:v40 constant:-v41];
      v105[1] = v42;
      v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v105 count:2];
      [v102 addObjectsFromArray:v43];
    }
    if ((IMSharedHelperDeviceIsiPad() & 1) != 0 || CKIsRunningInMacCatalyst())
    {
      v44 = objc_alloc_init(CKConversationListTypingIndicatorView);
      [(CKConversationListCell *)v5 setTypingIndicatorView:v44];

      v45 = [(CKConversationListCell *)v5 typingIndicatorView];
      [v45 setTranslatesAutoresizingMaskIntoConstraints:0];

      v46 = [(CKConversationListLargeTextCell *)v5 contentView];
      v47 = [(CKConversationListCell *)v5 typingIndicatorView];
      [v46 addSubview:v47];

      v100 = [(CKConversationListCell *)v5 typingIndicatorView];
      v97 = [v100 leadingAnchor];
      v48 = [(CKConversationListCell *)v5 fromLabel];
      v49 = [v48 leadingAnchor];
      v50 = [v97 constraintEqualToAnchor:v49];
      v104[0] = v50;
      v51 = [(CKConversationListCell *)v5 typingIndicatorView];
      v52 = [v51 topAnchor];
      v53 = [(CKConversationListCell *)v5 fromLabel];
      v54 = [v53 bottomAnchor];
      v55 = [v52 constraintEqualToAnchor:v54];
      v104[1] = v55;
      v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:v104 count:2];
      [v102 addObjectsFromArray:v56];

      v57 = [(CKConversationListCell *)v5 typingIndicatorView];
      [v57 setHidden:1];
    }
    v58 = [(CKConversationListLargeTextCell *)v5 _constraintForEditing:0];
    [(CKConversationListLargeTextCell *)v5 setEditingDependentConstraint:v58];

    v59 = [(CKConversationListLargeTextCell *)v5 editingDependentConstraint];
    [v102 addObject:v59];

    v60 = [(CKConversationListLargeTextCell *)v5 _contentSizeCategoryDependentConstraints];
    [(CKConversationListLargeTextCell *)v5 setContentSizeCategoryDependentConstraints:v60];

    v61 = [(CKConversationListLargeTextCell *)v5 contentSizeCategoryDependentConstraints];
    [v102 addObjectsFromArray:v61];

    [MEMORY[0x1E4F28DC8] activateConstraints:v102];
  }
  return v5;
}

- (id)summaryLabelTextBaseColor
{
  double v2 = +[CKUIBehavior sharedBehaviors];
  double v3 = [v2 theme];
  double v4 = [v3 conversationListLargeTextSummaryColor];

  return v4;
}

- (id)unreadIndicatorImageForVisibility:(BOOL)a3 withMuteState:(BOOL)a4
{
  if (a3)
  {
    double v4 = +[CKUIBehavior sharedBehaviors];
    v5 = [v4 unreadIndicatorTintedImage];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)contentSizeCategoryDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)CKConversationListLargeTextCell;
  [(CKConversationListCell *)&v8 contentSizeCategoryDidChange];
  double v3 = (void *)MEMORY[0x1E4F28DC8];
  double v4 = [(CKConversationListLargeTextCell *)self contentSizeCategoryDependentConstraints];
  [v3 deactivateConstraints:v4];

  v5 = [(CKConversationListLargeTextCell *)self _contentSizeCategoryDependentConstraints];
  [(CKConversationListLargeTextCell *)self setContentSizeCategoryDependentConstraints:v5];

  v6 = (void *)MEMORY[0x1E4F28DC8];
  v7 = [(CKConversationListLargeTextCell *)self contentSizeCategoryDependentConstraints];
  [v6 activateConstraints:v7];
}

- (void)updateFromLabelWithText:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  double v4 = (__CFString *)a3;
  v5 = [(CKConversationListLargeTextCell *)self indicatorTextAttachments];
  if ([v5 count])
  {
  }
  else
  {
    v6 = [(CKConversationListLargeTextCell *)self unreadIndicatorAttachment];

    if (!v6)
    {
      id v25 = objc_alloc(MEMORY[0x1E4F28E48]);
      if (v4) {
        v26 = v4;
      }
      else {
        v26 = &stru_1EDE4CA38;
      }
      id v7 = (id)[v25 initWithString:v26];
      goto LABEL_17;
    }
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  objc_super v8 = [(CKConversationListLargeTextCell *)self unreadIndicatorAttachment];

  if (v8)
  {
    double v9 = (void *)MEMORY[0x1E4F28B18];
    double v10 = [(CKConversationListLargeTextCell *)self unreadIndicatorAttachment];
    double v11 = [v9 attributedStringWithAttachment:v10];

    [v7 appendAttributedString:v11];
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v12 = [(CKConversationListLargeTextCell *)self indicatorTextAttachments];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v28;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:*(void *)(*((void *)&v27 + 1) + 8 * v16)];
        [v7 appendAttributedString:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v14);
  }

  v18 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
  [v7 appendAttributedString:v18];

  id v19 = objc_alloc(MEMORY[0x1E4F28B18]);
  if (v4) {
    v20 = v4;
  }
  else {
    v20 = &stru_1EDE4CA38;
  }
  double v21 = (void *)[v19 initWithString:v20];
  [v7 appendAttributedString:v21];

LABEL_17:
  uint64_t v22 = *MEMORY[0x1E4FB0738];
  v23 = [(id)objc_opt_class() hyphenationParagraphStyle];
  objc_msgSend(v7, "addAttribute:value:range:", v22, v23, 0, objc_msgSend(v7, "length"));

  v24 = [(CKConversationListCell *)self fromLabel];
  [v24 setAttributedText:v7];
}

- (void)updateUnreadIndicatorWithImage:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = [(CKConversationListLargeTextCell *)self unreadIndicatorAttachment];

    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4FB0870]);
      [(CKConversationListLargeTextCell *)self setUnreadIndicatorAttachment:v6];
    }
    id v7 = [(CKConversationListLargeTextCell *)self unreadIndicatorAttachment];
    [v7 setImage:v4];

    objc_super v8 = [(CKConversationListCell *)self fromLabel];
    double v9 = [v8 font];
    [v9 capHeight];
    double v11 = v10;

    [v4 size];
    double v13 = v12;
    double v15 = v14;
    uint64_t v16 = [(CKConversationListLargeTextCell *)self unreadIndicatorAttachment];
    objc_msgSend(v16, "setBounds:", 0.0, v11 * 0.5 - v15 * 0.5, v13, v15);
  }
  else
  {
    [(CKConversationListLargeTextCell *)self setUnreadIndicatorAttachment:0];
  }
  v17 = [(CKConversationListCell *)self fromLabel];
  v18 = [v17 font];
  [v18 capHeight];
  double v20 = v19;

  double v21 = [(CKConversationListCell *)self makeTextAttachmentsForCurrentIndicatorState];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v34;
    double v25 = v20 * 0.5;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v34 != v24) {
          objc_enumerationMutation(v21);
        }
        long long v27 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        long long v28 = [v27 image];
        [v28 size];
        double v30 = v29;
        double v32 = v31;

        objc_msgSend(v27, "setBounds:", 0.0, v25 + v32 * 0.65 * -0.5, v30 * 0.65);
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v23);
  }
  [(CKConversationListLargeTextCell *)self setIndicatorTextAttachments:v21];
}

- (void)updateForEditing:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CKConversationListLargeTextCell;
  -[CKConversationListCell updateForEditing:](&v8, sel_updateForEditing_);
  v5 = [(CKConversationListLargeTextCell *)self editingDependentConstraint];
  [v5 setActive:0];

  id v6 = [(CKConversationListLargeTextCell *)self _constraintForEditing:v3];
  [(CKConversationListLargeTextCell *)self setEditingDependentConstraint:v6];

  id v7 = [(CKConversationListLargeTextCell *)self editingDependentConstraint];
  [v7 setActive:1];

  [(CKConversationListLargeTextCell *)self layoutIfNeeded];
}

- (id)_constraintForEditing:(BOOL)a3
{
  if (a3)
  {
    id v4 = [(CKConversationListCell *)self fromLabel];
    v5 = [v4 trailingAnchor];
    id v6 = [(CKConversationListLargeTextCell *)self contentView];
    id v7 = [v6 trailingAnchor];
    objc_super v8 = +[CKUIBehavior sharedBehaviors];
    [v8 conversationListCellLargeTextLeftMargin];
    double v10 = [v5 constraintEqualToAnchor:v7 constant:-v9];
  }
  else
  {
    double v11 = [(CKConversationListCell *)self chevronImageView];

    id v4 = [(CKConversationListCell *)self fromLabel];
    v5 = [v4 trailingAnchor];
    if (v11)
    {
      id v6 = [(CKConversationListCell *)self chevronImageView];
      id v7 = [v6 leadingAnchor];
      double v12 = -10.0;
    }
    else
    {
      id v6 = [(CKConversationListLargeTextCell *)self contentView];
      id v7 = [v6 trailingAnchor];
      [(CKConversationListLargeTextCell *)self layoutMargins];
      double v12 = -v13;
    }
    double v10 = [v5 constraintEqualToAnchor:v7 constant:v12];
  }

  return v10;
}

- (id)_contentSizeCategoryDependentConstraints
{
  v23[3] = *MEMORY[0x1E4F143B8];
  uint64_t v22 = [(CKConversationListCell *)self fromLabel];
  double v20 = [v22 topAnchor];
  double v21 = [(CKConversationListLargeTextCell *)self contentView];
  v18 = [v21 topAnchor];
  double v19 = +[CKUIBehavior sharedBehaviors];
  [v19 largeTextTopConversationListSpace];
  v17 = objc_msgSend(v20, "constraintEqualToAnchor:constant:", v18);
  v23[0] = v17;
  uint64_t v16 = [(CKConversationListLargeTextCell *)self firstLineLayoutGuide];
  BOOL v3 = [v16 heightAnchor];
  id v4 = [(CKConversationListCell *)self fromLabel];
  v5 = [v4 font];
  [v5 capHeight];
  id v6 = objc_msgSend(v3, "constraintEqualToConstant:");
  v23[1] = v6;
  id v7 = [(CKConversationListCell *)self dateLabel];
  objc_super v8 = [v7 bottomAnchor];
  double v9 = [(CKConversationListLargeTextCell *)self contentView];
  double v10 = [v9 bottomAnchor];
  double v11 = +[CKUIBehavior sharedBehaviors];
  [v11 accessibilityBottomConversationListSpace];
  double v13 = [v8 constraintEqualToAnchor:v10 constant:-v12];
  v23[2] = v13;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:3];

  return v15;
}

- (void)updateContentsForConversation:(id)a3 fastPreview:(BOOL)a4
{
  v11.receiver = self;
  v11.super_class = (Class)CKConversationListLargeTextCell;
  [(CKConversationListCell *)&v11 updateContentsForConversation:a3 fastPreview:a4];
  if ((IMSharedHelperDeviceIsiPad() & 1) != 0 || CKIsRunningInMacCatalyst())
  {
    if ([(CKConversationListCell *)self lastMessageIsTypingIndicator])
    {
      v5 = [(CKConversationListCell *)self summaryLabel];
      [v5 setHidden:1];

      id v6 = [(CKConversationListCell *)self typingIndicatorView];
      [v6 stopAnimation];

      id v7 = [(CKConversationListCell *)self typingIndicatorView];
      [v7 setHidden:0];

      objc_super v8 = [(CKConversationListCell *)self typingIndicatorView];
      [v8 startPulseAnimation];
    }
    else
    {
      double v9 = [(CKConversationListCell *)self typingIndicatorView];
      [v9 setHidden:1];

      double v10 = [(CKConversationListCell *)self typingIndicatorView];
      [v10 stopAnimation];

      objc_super v8 = [(CKConversationListCell *)self summaryLabel];
      [v8 setHidden:0];
    }
  }
}

- (UILayoutGuide)firstLineLayoutGuide
{
  return self->_firstLineLayoutGuide;
}

- (void)setFirstLineLayoutGuide:(id)a3
{
}

- (NSLayoutConstraint)editingDependentConstraint
{
  return self->_editingDependentConstraint;
}

- (void)setEditingDependentConstraint:(id)a3
{
}

- (NSArray)contentSizeCategoryDependentConstraints
{
  return self->_contentSizeCategoryDependentConstraints;
}

- (void)setContentSizeCategoryDependentConstraints:(id)a3
{
}

- (NSTextAttachment)unreadIndicatorAttachment
{
  return self->_unreadIndicatorAttachment;
}

- (void)setUnreadIndicatorAttachment:(id)a3
{
}

- (NSArray)indicatorTextAttachments
{
  return self->_indicatorTextAttachments;
}

- (void)setIndicatorTextAttachments:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indicatorTextAttachments, 0);
  objc_storeStrong((id *)&self->_unreadIndicatorAttachment, 0);
  objc_storeStrong((id *)&self->_contentSizeCategoryDependentConstraints, 0);
  objc_storeStrong((id *)&self->_editingDependentConstraint, 0);

  objc_storeStrong((id *)&self->_firstLineLayoutGuide, 0);
}

@end