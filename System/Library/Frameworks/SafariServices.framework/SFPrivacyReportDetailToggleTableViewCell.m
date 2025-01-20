@interface SFPrivacyReportDetailToggleTableViewCell
- (BOOL)useCurrentWebsiteHeader;
- (SFPrivacyReportDetailToggleTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (SFPrivacyReportDetailToggleTableViewCellDelegate)delegate;
- (int64_t)detailType;
- (void)_addSegmentForDetailType:(int64_t)a3;
- (void)_selectDetailType:(int64_t)a3;
- (void)_updateTitle;
- (void)setDelegate:(id)a3;
- (void)setDetailType:(int64_t)a3;
- (void)setUseCurrentWebsiteHeader:(BOOL)a3;
@end

@implementation SFPrivacyReportDetailToggleTableViewCell

- (SFPrivacyReportDetailToggleTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v42[7] = *MEMORY[0x1E4F143B8];
  v41.receiver = self;
  v41.super_class = (Class)SFPrivacyReportDetailToggleTableViewCell;
  v4 = [(SFPrivacyReportDetailToggleTableViewCell *)&v41 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = (UISegmentedControl *)objc_alloc_init(MEMORY[0x1E4FB1C10]);
    segmentedControl = v4->_segmentedControl;
    v4->_segmentedControl = v5;

    [(UISegmentedControl *)v4->_segmentedControl setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SFPrivacyReportDetailToggleTableViewCell *)v4 _addSegmentForDetailType:0];
    [(SFPrivacyReportDetailToggleTableViewCell *)v4 _addSegmentForDetailType:1];
    if (v4->_detailType == 1) {
      v7 = @"trackers";
    }
    else {
      v7 = @"websites";
    }
    [(UISegmentedControl *)v4->_segmentedControl setSelectedSegmentIndex:[(UISegmentedControl *)v4->_segmentedControl segmentIndexForActionIdentifier:v7]];
    v8 = [(SFPrivacyReportDetailToggleTableViewCell *)v4 contentView];
    [v8 addSubview:v4->_segmentedControl];
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v9;

    [(UILabel *)v4->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v4->_titleLabel setAdjustsFontForContentSizeCategory:1];
    v11 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
    [(UILabel *)v4->_titleLabel setFont:v11];

    v12 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v4->_titleLabel setTextColor:v12];

    [(UILabel *)v4->_titleLabel setNumberOfLines:0];
    [(SFPrivacyReportDetailToggleTableViewCell *)v4 _updateTitle];
    [v8 addSubview:v4->_titleLabel];
    v13 = [v8 layoutMarginsGuide];
    v30 = (void *)MEMORY[0x1E4F28DC8];
    v40 = [(UISegmentedControl *)v4->_segmentedControl leadingAnchor];
    v39 = [v13 leadingAnchor];
    v38 = [v40 constraintEqualToAnchor:v39];
    v42[0] = v38;
    v37 = [(UISegmentedControl *)v4->_segmentedControl trailingAnchor];
    v36 = [v13 trailingAnchor];
    v34 = [v37 constraintEqualToAnchor:v36];
    v42[1] = v34;
    v33 = [(UILabel *)v4->_titleLabel leadingAnchor];
    v35 = v13;
    v32 = [v13 leadingAnchor];
    v31 = [v33 constraintEqualToAnchor:v32];
    v42[2] = v31;
    v28 = [(UILabel *)v4->_titleLabel trailingAnchor];
    v27 = [v13 trailingAnchor];
    v26 = [v28 constraintEqualToAnchor:v27];
    v42[3] = v26;
    v25 = [(UISegmentedControl *)v4->_segmentedControl topAnchor];
    v29 = v8;
    v14 = [v8 topAnchor];
    v15 = [v25 constraintEqualToSystemSpacingBelowAnchor:v14 multiplier:2.0];
    v42[4] = v15;
    v16 = [(UILabel *)v4->_titleLabel topAnchor];
    v17 = [(UISegmentedControl *)v4->_segmentedControl bottomAnchor];
    v18 = [v16 constraintEqualToSystemSpacingBelowAnchor:v17 multiplier:2.0];
    v42[5] = v18;
    v19 = [v8 bottomAnchor];
    v20 = [(UILabel *)v4->_titleLabel bottomAnchor];
    v21 = [v19 constraintEqualToSystemSpacingBelowAnchor:v20 multiplier:0.5];
    v42[6] = v21;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:7];
    [v30 activateConstraints:v22];

    v23 = v4;
  }

  return v4;
}

- (void)_addSegmentForDetailType:(int64_t)a3
{
  objc_initWeak(&location, self);
  segmentedControl = self->_segmentedControl;
  v7 = (void *)MEMORY[0x1E4FB13F0];
  if ((unint64_t)a3 <= 1)
  {
    v3 = _WBSLocalizedString();
  }
  v8 = @"websites";
  if (a3 == 1) {
    v8 = @"trackers";
  }
  v9 = v8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__SFPrivacyReportDetailToggleTableViewCell__addSegmentForDetailType___block_invoke;
  v11[3] = &unk_1E5C733D0;
  objc_copyWeak(v12, &location);
  v12[1] = (id)a3;
  v10 = [v7 actionWithTitle:v3 image:0 identifier:v9 handler:v11];
  [(UISegmentedControl *)segmentedControl insertSegmentWithAction:v10 atIndex:[(UISegmentedControl *)self->_segmentedControl numberOfSegments] animated:0];

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

void __69__SFPrivacyReportDetailToggleTableViewCell__addSegmentForDetailType___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _selectDetailType:*(void *)(a1 + 40)];
}

- (void)_selectDetailType:(int64_t)a3
{
  self->_detailType = a3;
  [(SFPrivacyReportDetailToggleTableViewCell *)self _updateTitle];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained cellDidToggleDetailType:self];
  }
}

- (void)_updateTitle
{
  if (self->_detailType > 1uLL)
  {
    v3 = 0;
  }
  else
  {
    v3 = _WBSLocalizedString();
  }
  id v5 = v3;
  v4 = [v3 localizedUppercaseString];
  [(UILabel *)self->_titleLabel setText:v4];
}

- (void)setDetailType:(int64_t)a3
{
  if (self->_detailType != a3)
  {
    self->_detailType = a3;
    segmentedControl = self->_segmentedControl;
    if (a3 == 1) {
      id v5 = @"trackers";
    }
    else {
      id v5 = @"websites";
    }
    [(UISegmentedControl *)self->_segmentedControl setSelectedSegmentIndex:[(UISegmentedControl *)segmentedControl segmentIndexForActionIdentifier:v5]];
    [(SFPrivacyReportDetailToggleTableViewCell *)self _updateTitle];
  }
}

- (void)setUseCurrentWebsiteHeader:(BOOL)a3
{
  if (self->_useCurrentWebsiteHeader != a3)
  {
    self->_useCurrentWebsiteHeader = a3;
    [(SFPrivacyReportDetailToggleTableViewCell *)self _updateTitle];
  }
}

- (int64_t)detailType
{
  return self->_detailType;
}

- (SFPrivacyReportDetailToggleTableViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFPrivacyReportDetailToggleTableViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)useCurrentWebsiteHeader
{
  return self->_useCurrentWebsiteHeader;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_segmentedControl, 0);
}

@end