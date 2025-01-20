@interface MFComposeSubjectView
- (BOOL)_canBecomeFirstResponder;
- (BOOL)allowsNotifyOption;
- (BOOL)becomeFirstResponder;
- (BOOL)enabled;
- (BOOL)endEditing:(BOOL)a3;
- (BOOL)isEndEditingText:(id)a3;
- (BOOL)isNotifyOptionSelected;
- (BOOL)isSeparatorHidden;
- (BOOL)keyboardInput:(id)a3 shouldInsertText:(id)a4 isMarkedText:(BOOL)a5;
- (BOOL)separatorHidden;
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (MFComposeSubjectView)initWithFrame:(CGRect)a3;
- (MFConfirmationButton)notifyButton;
- (NSString)text;
- (UITextView)textView;
- (double)trailingButtonMidlineInsetFromLayoutMargin;
- (id)_textContainerExclusionPathsWithNotifyButton:(BOOL)a3;
- (void)_configureNotifyGlyphs;
- (void)_showNotifyButtonIfNeeded;
- (void)_textInputDidChange:(id)a3;
- (void)_updateExclusionPathsIfNeeded;
- (void)_updateTextContainerInsets;
- (void)dealloc;
- (void)displayMetricsDidChange;
- (void)layoutManager:(id)a3 didCompleteLayoutForTextContainer:(id)a4 atEnd:(BOOL)a5;
- (void)layoutSubviews;
- (void)refreshPreferredContentSize;
- (void)setAllowsNotifyOption:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setNeedsExclusionPathUpdate;
- (void)setNotifyOptionSelected:(BOOL)a3;
- (void)setSeparatorHidden:(BOOL)a3;
- (void)setText:(id)a3;
- (void)setTrailingButtonMidlineInsetFromLayoutMargin:(double)a3;
- (void)textViewDidBeginEditing:(id)a3;
- (void)textViewDidChange:(id)a3;
- (void)textViewDidEndEditing:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation MFComposeSubjectView

- (MFComposeSubjectView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v19.receiver = self;
  v19.super_class = (Class)MFComposeSubjectView;
  v5 = -[MFComposeSubjectView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  if (v5)
  {
    v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v7 = [v6 localizedStringForKey:@"SUBJECT" value:&stru_1F0817A00 table:@"Main"];
    [(MFComposeSubjectView *)v5 setLabel:v7];

    v8 = [(id)objc_opt_class() defaultFont];
    v9 = [MFComposeSubjectTextView alloc];
    uint64_t v10 = -[MFComposeSubjectTextView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), width - *MEMORY[0x1E4F1DB28], floor(height));
    textView = v5->_textView;
    v5->_textView = (UITextView *)v10;

    v12 = [(UITextView *)v5->_textView textContainer];
    [v12 setLineFragmentPadding:0.0];

    [(UITextView *)v5->_textView setFont:v8];
    [(UITextView *)v5->_textView setDelegate:v5];
    v13 = [(UITextView *)v5->_textView layoutManager];
    [v13 setDelegate:v5];

    v14 = v5->_textView;
    v15 = [MEMORY[0x1E4FB1618] mailComposeTextViewBackgroundColor];
    [(UITextView *)v14 setBackgroundColor:v15];

    [(UITextView *)v5->_textView setAccessibilityIdentifier:@"subjectField"];
    [(UITextView *)v5->_textView setScrollsToTop:0];
    [(MFComposeSubjectView *)v5 addSubview:v5->_textView];
    v5->_needsExclusionPathUpdate = 1;
    [(MFComposeSubjectView *)v5 _updateTextContainerInsets];
    v16 = [(MFComposeSubjectView *)v5 inputAssistantItem];
    [v16 _setShowsBarButtonItemsInline:0];

    v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 addObserver:v5 selector:sel__textInputDidChange_ name:*MEMORY[0x1E4FB3028] object:0];
  }
  return v5;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MFComposeSubjectView;
  [(MFComposeSubjectView *)&v4 dealloc];
}

- (void)_showNotifyButtonIfNeeded
{
  if (!self->_notifyButton)
  {
    v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_super v4 = [v3 localizedStringForKey:@"NOTIFY_ME_CONFIRMATION" value:&stru_1F0817A00 table:@"Main"];
    v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v6 = [v5 localizedStringForKey:@"NOTIFY_ME" value:&stru_1F0817A00 table:@"Main"];
    v7 = +[MFConfirmationButton confirmationButtonWithMessage:v4 confirmationLabel:v6 handler:0];
    notifyButton = self->_notifyButton;
    self->_notifyButton = v7;

    [(MFConfirmationButton *)self->_notifyButton setAccessibilityIdentifier:*MEMORY[0x1E4F73C68]];
    v9 = objc_msgSend(MEMORY[0x1E4FB1818], "mf_systemImageNamed:forView:", @"bell.fill", 13);
    [(MFConfirmationButton *)self->_notifyButton setConfirmationIcon:v9];

    [(MFConfirmationButton *)self->_notifyButton setConfirmationType:1];
    [(MFConfirmationButton *)self->_notifyButton setConfirmationSelectionMode:1];
    [(MFDimmableButton *)self->_notifyButton setHidesWhenDimmedIfNotSelected:1];
    [(MFDimmableButton *)self->_notifyButton setDimmed:1];
    [(MFConfirmationButton *)self->_notifyButton setContentMode:4];
    [(MFComposeSubjectView *)self _configureNotifyGlyphs];
    [(MFComposeSubjectView *)self addSubview:self->_notifyButton];
    BOOL v10 = [(MFComposeSubjectView *)self allowsNotifyOption];
    v11 = self->_notifyButton;
    [(MFDimmableButton *)v11 setHidden:v10];
  }
}

- (MFConfirmationButton)notifyButton
{
  return self->_notifyButton;
}

- (void)_configureNotifyGlyphs
{
  id v8 = [(MFComposeSubjectView *)self notifyButton];
  v2 = [MEMORY[0x1E4FB1618] quaternaryLabelColor];
  v3 = __46__MFComposeSubjectView__configureNotifyGlyphs__block_invoke((uint64_t)v2, @"bell.fill", v2);

  [v8 setImage:v3 forState:65540];
  objc_super v4 = [MEMORY[0x1E4FB1618] systemBlueColor];
  v5 = __46__MFComposeSubjectView__configureNotifyGlyphs__block_invoke((uint64_t)v4, @"bell.fill", v4);

  [v8 setImage:v5 forState:4];
  v6 = [MEMORY[0x1E4FB1618] systemBlueColor];
  v7 = __46__MFComposeSubjectView__configureNotifyGlyphs__block_invoke((uint64_t)v6, @"bell", v6);

  [v8 setImage:v7 forState:0];
}

id __46__MFComposeSubjectView__configureNotifyGlyphs__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E4FB1818], "mf_systemImageNamed:forView:", a2, 13);
  v6 = [v5 imageWithTintColor:v4];
  v7 = [v6 imageWithRenderingMode:1];

  return v7;
}

- (void)setAllowsNotifyOption:(BOOL)a3
{
  self->_allowsNotifyOption = a3;
  BOOL v3 = !a3;
  id v4 = [(MFComposeSubjectView *)self notifyButton];
  [v4 setHidden:v3];
}

- (BOOL)isNotifyOptionSelected
{
  v2 = [(MFComposeSubjectView *)self notifyButton];
  char v3 = [v2 isSelected];

  return v3;
}

- (void)setNotifyOptionSelected:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MFComposeSubjectView *)self notifyButton];
  [v4 setSelected:v3];
}

- (void)setTrailingButtonMidlineInsetFromLayoutMargin:(double)a3
{
  if (self->_trailingButtonMidlineInsetFromLayoutMargin != a3)
  {
    self->_trailingButtonMidlineInsetFromLayoutMargin = a3;
    [(MFComposeSubjectView *)self setNeedsLayout];
  }
}

- (void)setSeparatorHidden:(BOOL)a3
{
  if (self->_separatorHidden != a3)
  {
    BOOL v3 = a3;
    self->_separatorHidden = a3;
    id v4 = [(MFComposeSubjectView *)self separator];
    [v4 setHidden:v3];
  }
}

- (BOOL)separatorHidden
{
  v2 = [(MFComposeSubjectView *)self separator];
  char v3 = [v2 isHidden];

  return v3;
}

- (void)setNeedsExclusionPathUpdate
{
  self->_needsExclusionPathUpdate = 1;
  [(MFComposeSubjectView *)self setNeedsLayout];
}

- (void)_updateExclusionPathsIfNeeded
{
  if (self->_needsExclusionPathUpdate)
  {
    self->_needsExclusionPathUpdate = 0;
    v6 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);

    if (IsAccessibilityCategory)
    {
      id v7 = [(MFComposeSubjectView *)self notifyButton];
      uint64_t v4 = -[MFComposeSubjectView _textContainerExclusionPathsWithNotifyButton:](self, "_textContainerExclusionPathsWithNotifyButton:", [v7 isHidden] ^ 1);

      id v8 = (id)v4;
    }
    else
    {
      id v8 = (id)MEMORY[0x1E4F1CBF0];
    }
    v5 = [(UITextView *)self->_textView textContainer];
    [v5 setExclusionPaths:v8];
  }
}

- (BOOL)becomeFirstResponder
{
  return [(UITextView *)self->_textView becomeFirstResponder];
}

- (void)textViewDidEndEditing:(id)a3
{
  id v4 = [(MFComposeSubjectView *)self notifyButton];
  [v4 setDimmed:1];

  id v5 = [(MFComposeSubjectView *)self delegate];
  [v5 composeSubjectViewTextFieldDidResignFirstResponder:self];
}

- (void)textViewDidBeginEditing:(id)a3
{
  [(MFComposeSubjectView *)self _showNotifyButtonIfNeeded];
  id v4 = [(MFComposeSubjectView *)self notifyButton];
  [v4 setDimmed:0];

  [(MFComposeSubjectView *)self setNeedsExclusionPathUpdate];
  id v5 = [(MFComposeSubjectView *)self delegate];
  [v5 composeSubjectViewTextFieldDidBecomeFirstResponder:self];
}

- (void)refreshPreferredContentSize
{
  v5.receiver = self;
  v5.super_class = (Class)MFComposeSubjectView;
  [(MFComposeSubjectView *)&v5 refreshPreferredContentSize];
  textView = self->_textView;
  id v4 = [(id)objc_opt_class() defaultFont];
  [(UITextView *)textView setFont:v4];

  [(MFComposeSubjectView *)self setNeedsExclusionPathUpdate];
}

- (void)_updateTextContainerInsets
{
  [(MFComposeSubjectView *)self _recipientViewEdgeInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(UITextView *)self->_textView textContainerInset];
  if (v6 != v14 || v4 != v11 || v10 != v13 || v8 != v12)
  {
    textView = self->_textView;
    -[UITextView setTextContainerInset:](textView, "setTextContainerInset:", v4, v6, v8, v10);
  }
}

- (id)_textContainerExclusionPathsWithNotifyButton:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = [(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection];
  v30.receiver = self;
  v30.super_class = (Class)MFComposeSubjectView;
  [(MFComposeSubjectView *)&v30 layoutIfNeeded];
  double v7 = [(MFComposeSubjectView *)self labelView];
  if (v6 == 1) {
    uint64_t v8 = 8;
  }
  else {
    uint64_t v8 = 2;
  }
  [(MFComposeSubjectView *)self _exclusionRectForView:v7 alongEdge:v8];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  -[MFComposeSubjectView convertRect:toView:](self, "convertRect:toView:", self->_textView, v10, v12, v14, v16);
  v17 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:");
  [v5 addObject:v17];
  if (v3)
  {
    v18 = [(MFComposeSubjectView *)self notifyButton];
    if (v6 == 1) {
      uint64_t v19 = 2;
    }
    else {
      uint64_t v19 = 8;
    }
    [(MFComposeSubjectView *)self _exclusionRectForView:v18 alongEdge:v19];
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;

    -[MFComposeSubjectView convertRect:toView:](self, "convertRect:toView:", self->_textView, v21, v23, v25, v27);
    v28 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:");
    [v5 addObject:v28];
  }

  return v5;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = CGRectGetWidth(a3);
  [(MFComposeSubjectView *)self frame];
  double v9 = v8 - CGRectGetWidth(v11);
  if (v9 < 0.0) {
    double v9 = -v9;
  }
  if (v9 >= 2.22044605e-16) {
    self->_needsExclusionPathUpdate = 1;
  }
  v10.receiver = self;
  v10.super_class = (Class)MFComposeSubjectView;
  -[MFComposeSubjectView setFrame:](&v10, sel_setFrame_, x, y, width, height);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MFComposeSubjectView;
  [(MFMailComposeHeaderView *)&v8 traitCollectionDidChange:v4];
  double v5 = [(MFComposeSubjectView *)self traitCollection];
  uint64_t v6 = [v5 preferredContentSizeCategory];
  double v7 = [v4 preferredContentSizeCategory];

  if (v6 != v7)
  {
    [(MFComposeSubjectView *)self _configureNotifyGlyphs];
    self->_needsExclusionPathUpdate = 1;
  }
}

- (void)layoutSubviews
{
  v70.receiver = self;
  v70.super_class = (Class)MFComposeSubjectView;
  [(MFComposeSubjectView *)&v70 layoutSubviews];
  BOOL v3 = [(UITextView *)self->_textView layoutManager];
  id v4 = (id *)MEMORY[0x1E4FB2608];
  double v5 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);

  double v7 = 0.0;
  double v8 = 1.0;
  if (!IsAccessibilityCategory) {
    double v8 = 0.0;
  }
  [v3 setHyphenationFactor:v8];

  uint64_t v9 = [(MFComposeSubjectView *)self effectiveUserInterfaceLayoutDirection];
  if ([(MFComposeSubjectView *)self allowsNotifyOption])
  {
    objc_super v10 = [(MFComposeSubjectView *)self notifyButton];
    double v7 = 2.0;
    [v10 sizeToFit];
  }
  else
  {
    objc_super v10 = 0;
  }
  [(MFComposeSubjectView *)self _contentRect];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v67 = v11;
  double v68 = v13;
  double v66 = v15;
  double v69 = v17;
  if (v10)
  {
    [v10 frame];
    double v19 = v12;
    double v20 = v14;
    double v21 = v16;
    double v22 = v18;
    if (v9 == 1) {
      CGRectGetMinX(*(CGRect *)&v19);
    }
    else {
      CGRectGetMaxX(*(CGRect *)&v19);
    }
    [(MFComposeSubjectView *)self bounds];
    v28 = [*v4 preferredContentSizeCategory];
    BOOL v29 = UIContentSizeCategoryIsAccessibilityCategory(v28);

    if (v29)
    {
      objc_super v30 = [(MFComposeSubjectView *)self labelView];
      [v30 frame];
      CGFloat v32 = v31;
      CGFloat v34 = v33;
      CGFloat v36 = v35;
      CGFloat v38 = v37;

      v71.origin.double x = v32;
      v71.origin.double y = v34;
      v71.size.double width = v36;
      v71.size.double height = v38;
      CGRectGetMinY(v71);
      v72.origin.double x = v32;
      v72.origin.double y = v34;
      v72.size.double width = v36;
      v72.size.double height = v38;
      CGRectGetHeight(v72);
    }
    v39 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v39 scale];
    uint64_t v65 = v40;
    UIRectCenteredYInRectScale();
    CGFloat v42 = v41;
    CGFloat v44 = v43;
    CGFloat v46 = v45;
    CGFloat v48 = v47;

    v73.origin.double x = v42;
    v73.origin.double y = v44;
    v73.size.double width = v46;
    v73.size.double height = v48;
    CGRect v74 = CGRectOffset(v73, 0.0, -v7);
    double x = v74.origin.x;
    double y = v74.origin.y;
    double width = v74.size.width;
    double height = v74.size.height;
    [(MFComposeSubjectView *)self trailingButtonMidlineInsetFromLayoutMargin];
    if (v49 == 0.0)
    {
      double v27 = 0.0;
    }
    else
    {
      [(MFComposeSubjectView *)self trailingButtonMidlineInsetFromLayoutMargin];
      double v51 = v50;
      v75.origin.double x = x;
      v75.origin.double y = y;
      v75.size.double width = width;
      v75.size.double height = height;
      double v27 = v51 + CGRectGetWidth(v75) * -0.5;
      double v52 = -1.0;
      if (v9 == 1) {
        double v52 = 1.0;
      }
      double x = x + v27 * v52;
    }
    objc_msgSend(v10, "setFrame:", x, y, width, height);
  }
  else
  {
    double x = *MEMORY[0x1E4F1DB28];
    double y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    double v27 = 0.0;
  }
  [(MFComposeSubjectView *)self bounds];
  if (v53 >= v69) {
    double v54 = v53;
  }
  else {
    double v54 = v69;
  }
  v55 = [(MFComposeSubjectView *)self labelView];
  [v55 frame];
  double v56 = CGRectGetWidth(v76);

  v77.origin.double x = x;
  v77.origin.double y = y;
  v77.size.double width = width;
  v77.size.double height = height;
  double v57 = CGRectGetWidth(v77);
  v58 = [*v4 preferredContentSizeCategory];
  BOOL v59 = UIContentSizeCategoryIsAccessibilityCategory(v58);
  double v60 = v56 + 5.0;
  double v61 = v27 + v57 + 5.0;

  if (v9 == 1) {
    double v62 = v61;
  }
  else {
    double v62 = v60;
  }
  if (v9 == 1) {
    double v63 = v60;
  }
  else {
    double v63 = v61;
  }
  if (v59) {
    double v64 = 0.0;
  }
  else {
    double v64 = v62;
  }
  if (v59) {
    double v63 = 0.0;
  }
  -[UITextView setFrame:](self->_textView, "setFrame:", v67 + v64, v68, v66 - (v64 + v63), v54);
  [(MFComposeSubjectView *)self _updateTextContainerInsets];
  [(MFComposeSubjectView *)self _updateExclusionPathsIfNeeded];
}

- (void)displayMetricsDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)MFComposeSubjectView;
  [(MFMailComposeHeaderView *)&v4 displayMetricsDidChange];
  BOOL v3 = [(MFMailComposeHeaderView *)self displayMetrics];
  [v3 trailingButtonMidlineOffset];
  [(MFComposeSubjectView *)self setTrailingButtonMidlineInsetFromLayoutMargin:"setTrailingButtonMidlineInsetFromLayoutMargin:"];
}

- (void)layoutManager:(id)a3 didCompleteLayoutForTextContainer:(id)a4 atEnd:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (v5)
  {
    [(UITextView *)self->_textView textContainerInset];
    uint64_t v11 = v10;
    double v13 = v12;
    uint64_t v39 = 0;
    uint64_t v40 = &v39;
    uint64_t v41 = 0x4010000000;
    CGFloat v42 = "";
    *(void *)&long long v14 = -1;
    *((void *)&v14 + 1) = -1;
    long long v43 = v14;
    long long v44 = v14;
    [v8 usedRectForTextContainer:v9];
    *(void *)&long long v43 = v15;
    *((void *)&v43 + 1) = v16;
    *(void *)&long long v44 = v17;
    *((void *)&v44 + 1) = v18;
    double v19 = v40;
    *((_OWORD *)v40 + 2) = *MEMORY[0x1E4F1DAD8];
    v19[7] = v11;
    [(UITextView *)self->_textView bounds];
    v40[6] = v20;
    uint64_t v35 = 0;
    CGFloat v36 = &v35;
    uint64_t v37 = 0x2020000000;
    uint64_t v38 = 0;
    uint64_t v21 = [v8 numberOfGlyphs];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __78__MFComposeSubjectView_layoutManager_didCompleteLayoutForTextContainer_atEnd___block_invoke;
    v34[3] = &unk_1E5F79300;
    v34[4] = &v35;
    v34[5] = &v39;
    objc_msgSend(v8, "enumerateLineFragmentsForGlyphRange:usingBlock:", 0, v21, v34);
    if (v36[3])
    {
      double v22 = (double *)v40;
      double v23 = *((double *)v40 + 7);
    }
    else
    {
      [v8 usedRectForTextContainer:v9];
      double v22 = (double *)v40;
      double v23 = v24 + *((double *)v40 + 7);
      *((double *)v40 + 7) = v23;
    }
    v22[7] = v13 + v23;
    [(UITextView *)self->_textView bounds];
    if (v22[6] != v26 || v22[7] != v25)
    {
      [(UITextView *)self->_textView frame];
      double v27 = v40;
      v40[4] = v28;
      v27[5] = v29;
      -[UITextView setFrame:](self->_textView, "setFrame:");
      [(MFComposeSubjectView *)self bounds];
      double v31 = v30;
      double v32 = *((double *)v40 + 7);
      double v33 = [(MFComposeSubjectView *)self delegate];
      objc_msgSend(v33, "composeHeaderView:didChangeSize:", self, v31, v32);
    }
    _Block_object_dispose(&v35, 8);
    _Block_object_dispose(&v39, 8);
  }
}

double __78__MFComposeSubjectView_layoutManager_didCompleteLayoutForTextContainer_atEnd___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  double result = a9 + *(double *)(v9 + 56);
  *(double *)(v9 + 56) = result;
  return result;
}

- (NSString)text
{
  return [(UITextView *)self->_textView text];
}

- (void)setText:(id)a3
{
}

- (void)setDelegate:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MFComposeSubjectView;
  [(MFComposeSubjectView *)&v6 setDelegate:a3];
  objc_super v4 = [(MFComposeSubjectView *)self delegate];
  *((unsigned char *)self + 552) = *((unsigned char *)self + 552) & 0xFE | objc_opt_respondsToSelector() & 1;
  if (objc_opt_respondsToSelector()) {
    char v5 = 2;
  }
  else {
    char v5 = 0;
  }
  *((unsigned char *)self + 552) = *((unsigned char *)self + 552) & 0xFD | v5;
}

- (BOOL)enabled
{
  return [(UITextView *)self->_textView isUserInteractionEnabled];
}

- (void)setEnabled:(BOOL)a3
{
}

- (void)textViewDidChange:(id)a3
{
  id v4 = a3;
  BOOL v8 = 0;
  char v5 = [(UITextView *)self->_textView text];
  objc_super v6 = cleanupSubjectString(v5, &v8);

  if (v8) {
    [v4 setText:v6];
  }
  if (*((unsigned char *)self + 552))
  {
    double v7 = [(MFComposeSubjectView *)self delegate];
    [v7 composeHeaderViewDidChangeValue:self];
  }
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length = a4.length;
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(MFComposeSubjectView *)self delegate];
  BOOL v11 = [(MFComposeSubjectView *)self isEndEditingText:v9];
  if (v11)
  {
    [v10 composeHeaderViewDidConfirmValue:self];
  }
  else if ((*((unsigned char *)self + 552) & 2) != 0)
  {
    double v12 = [v8 text];
    uint64_t v13 = [v12 length];

    if (length == v13) {
      [v10 composeSubjectViewWillRemoveContent:self];
    }
  }

  return !v11;
}

- (BOOL)keyboardInput:(id)a3 shouldInsertText:(id)a4 isMarkedText:(BOOL)a5
{
  id v6 = a4;
  BOOL v7 = [(MFComposeSubjectView *)self isEndEditingText:v6];
  if (v7)
  {
    id v8 = [(MFComposeSubjectView *)self delegate];
    [v8 composeHeaderViewDidConfirmValue:self];
  }
  return !v7;
}

- (BOOL)isEndEditingText:(id)a3
{
  id v3 = a3;
  if ([v3 isEqual:@"\n"]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isEqual:@"\t"];
  }

  return v4;
}

- (BOOL)endEditing:(BOOL)a3
{
  return [(UITextView *)self->_textView endEditing:a3];
}

- (BOOL)_canBecomeFirstResponder
{
  return 1;
}

- (void)_textInputDidChange:(id)a3
{
  char v4 = [(UITextView *)self->_textView text];
  uint64_t v5 = [v4 length];

  if (!v5)
  {
    int64_t v6 = [(UIResponder *)self mf_textAlignmentForActiveInputLanguage];
    textView = self->_textView;
    [(UITextView *)textView setTextAlignment:v6];
  }
}

- (UITextView)textView
{
  return self->_textView;
}

- (BOOL)allowsNotifyOption
{
  return self->_allowsNotifyOption;
}

- (double)trailingButtonMidlineInsetFromLayoutMargin
{
  return self->_trailingButtonMidlineInsetFromLayoutMargin;
}

- (BOOL)isSeparatorHidden
{
  return self->_separatorHidden;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifyButton, 0);

  objc_storeStrong((id *)&self->_textView, 0);
}

@end