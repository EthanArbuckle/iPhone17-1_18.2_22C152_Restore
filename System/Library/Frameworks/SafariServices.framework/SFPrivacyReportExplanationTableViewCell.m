@interface SFPrivacyReportExplanationTableViewCell
- (BOOL)isExpanded;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (CGRect)_separatorFrame;
- (SFPrivacyReportExplanationTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (SFPrivacyReportExplanationTableViewCellDelegate)delegate;
- (void)_toggleExpanded:(id)a3;
- (void)privacyProxyStateChanged:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExpanded:(BOOL)a3;
@end

@implementation SFPrivacyReportExplanationTableViewCell

- (SFPrivacyReportExplanationTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v37[1] = *MEMORY[0x1E4F143B8];
  v34.receiver = self;
  v34.super_class = (Class)SFPrivacyReportExplanationTableViewCell;
  v4 = [(SFPrivacyReportExplanationTableViewCell *)&v34 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(SFPrivacyReportExplanationTableViewCell *)v4 contentView];
    v7 = (UITextView *)objc_alloc_init(MEMORY[0x1E4FB1DD8]);
    textLabel = v5->_textLabel;
    v5->_textLabel = v7;

    [(UITextView *)v5->_textLabel setDelegate:v5];
    [(UITextView *)v5->_textLabel setAdjustsFontForContentSizeCategory:1];
    [(UITextView *)v5->_textLabel setEditable:0];
    [(UITextView *)v5->_textLabel setSelectable:1];
    [(UITextView *)v5->_textLabel setScrollEnabled:0];
    v9 = [(UITextView *)v5->_textLabel textContainer];
    [v9 setLineFragmentPadding:0.0];

    [(UITextView *)v5->_textLabel _setInteractiveTextSelectionDisabled:1];
    -[UITextView setTextContainerInset:](v5->_textLabel, "setTextContainerInset:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    [(UITextView *)v5->_textLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v10 = [MEMORY[0x1E4FB1618] clearColor];
    [(UITextView *)v5->_textLabel setBackgroundColor:v10];

    v11 = privacyReportTitleForCurrentStatus(v5->_expanded);
    [(UITextView *)v5->_textLabel setAttributedText:v11];

    uint64_t v36 = *MEMORY[0x1E4FB12B8];
    v12 = [MEMORY[0x1E4FB1618] linkColor];
    v37[0] = v12;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];
    [(UITextView *)v5->_textLabel setLinkTextAttributes:v13];

    v33 = v6;
    [v6 addSubview:v5->_textLabel];
    v14 = [v6 layoutMarginsGuide];
    v27 = (void *)MEMORY[0x1E4F28DC8];
    v32 = [(UITextView *)v5->_textLabel topAnchor];
    v31 = [v14 topAnchor];
    v30 = [v32 constraintEqualToAnchor:v31];
    v35[0] = v30;
    v29 = [(UITextView *)v5->_textLabel bottomAnchor];
    v28 = [v14 bottomAnchor];
    v15 = [v29 constraintEqualToAnchor:v28];
    v35[1] = v15;
    v16 = [(UITextView *)v5->_textLabel leadingAnchor];
    v17 = [v14 leadingAnchor];
    v18 = [v16 constraintEqualToAnchor:v17];
    v35[2] = v18;
    v19 = [(UITextView *)v5->_textLabel trailingAnchor];
    v20 = [v14 trailingAnchor];
    v21 = [v19 constraintEqualToAnchor:v20];
    v35[3] = v21;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:4];
    [v27 activateConstraints:v22];

    [(SFPrivacyReportExplanationTableViewCell *)v5 setBackgroundView:0];
    v23 = [MEMORY[0x1E4FB1618] clearColor];
    [(SFPrivacyReportExplanationTableViewCell *)v5 setBackgroundColor:v23];

    v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v24 addObserver:v5 selector:sel_privacyProxyStateChanged_ name:*MEMORY[0x1E4F993A0] object:0];

    v25 = v5;
  }

  return v5;
}

- (void)setExpanded:(BOOL)a3
{
  if (self->_expanded != a3)
  {
    self->_expanded = a3;
    privacyReportTitleForCurrentStatus(a3);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(UITextView *)self->_textLabel setAttributedText:v4];
  }
}

- (void)_toggleExpanded:(id)a3
{
  [(SFPrivacyReportExplanationTableViewCell *)self setExpanded:!self->_expanded];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained cellDidToggleExpandDetailedExplanation:self];
  }
}

- (CGRect)_separatorFrame
{
  double v2 = *MEMORY[0x1E4F1DB28];
  double v3 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)privacyProxyStateChanged:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __68__SFPrivacyReportExplanationTableViewCell_privacyProxyStateChanged___block_invoke;
  v3[3] = &unk_1E5C724D8;
  v3[4] = self;
  [MEMORY[0x1E4FB1EB0] _animateUsingDefaultTimingWithOptions:0 animations:v3 completion:0];
}

uint64_t __68__SFPrivacyReportExplanationTableViewCell_privacyProxyStateChanged___block_invoke(uint64_t a1)
{
  double v2 = privacyReportTitleForCurrentStatus(*(unsigned __int8 *)(*(void *)(a1 + 32) + 1025));
  [*(id *)(*(void *)(a1 + 32) + 1016) setAttributedText:v2];

  double v3 = *(void **)(a1 + 32);

  return [v3 layoutIfNeeded];
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  return 0;
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (SFPrivacyReportExplanationTableViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFPrivacyReportExplanationTableViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_textLabel, 0);
}

@end