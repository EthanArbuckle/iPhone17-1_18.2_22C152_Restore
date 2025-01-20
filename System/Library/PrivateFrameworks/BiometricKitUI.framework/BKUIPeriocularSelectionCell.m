@interface BKUIPeriocularSelectionCell
- (BKUIPeriocularSelectionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIImageView)iconView;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (double)BKUIPeriocularSelectionCellTopBottomPadding;
- (id)_descriptionFont;
- (id)_titleFont;
- (void)setIconView:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation BKUIPeriocularSelectionCell

- (double)BKUIPeriocularSelectionCellTopBottomPadding
{
  int v2 = MGGetSInt32Answer();
  double result = 30.0;
  if (v2 == 30) {
    return 28.0;
  }
  return result;
}

- (BKUIPeriocularSelectionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v103[5] = *MEMORY[0x1E4F143B8];
  v101.receiver = self;
  v101.super_class = (Class)BKUIPeriocularSelectionCell;
  v4 = [(BKUIPeriocularSelectionCell *)&v101 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F42AA0]);
    v6 = [MEMORY[0x1E4F42A80] imageNamed:@"faceid"];
    uint64_t v7 = [v5 initWithImage:v6];
    iconView = v4->_iconView;
    v4->_iconView = (UIImageView *)v7;

    id v9 = objc_alloc(MEMORY[0x1E4F42B38]);
    double v10 = *MEMORY[0x1E4F1DB28];
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v14 = objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], v11, v12, v13);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v14;

    [(UILabel *)v4->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v16 = [(BKUIPeriocularSelectionCell *)v4 _titleFont];
    [(UILabel *)v4->_titleLabel setFont:v16];

    v17 = [MEMORY[0x1E4F428B8] labelColor];
    [(UILabel *)v4->_titleLabel setTextColor:v17];

    [(UILabel *)v4->_titleLabel setNumberOfLines:0];
    [(UILabel *)v4->_titleLabel setAdjustsFontForContentSizeCategory:1];
    LODWORD(v18) = 1148846080;
    [(UILabel *)v4->_titleLabel setContentCompressionResistancePriority:1 forAxis:v18];
    uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v10, v11, v12, v13);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = (UILabel *)v19;

    [(UILabel *)v4->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v21 = [(BKUIPeriocularSelectionCell *)v4 _descriptionFont];
    [(UILabel *)v4->_subtitleLabel setFont:v21];

    v22 = [MEMORY[0x1E4F428B8] labelColor];
    [(UILabel *)v4->_subtitleLabel setTextColor:v22];

    [(UILabel *)v4->_subtitleLabel setAdjustsFontForContentSizeCategory:1];
    LODWORD(v23) = 1148846080;
    [(UILabel *)v4->_subtitleLabel setContentCompressionResistancePriority:1 forAxis:v23];
    [(UIImageView *)v4->_iconView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v4->_iconView setContentMode:2];
    v24 = [(BKUIPeriocularSelectionCell *)v4 subtitleLabel];
    [v24 setNumberOfLines:0];

    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v10, v11, v12, v13);
    [v25 setTranslatesAutoresizingMaskIntoConstraints:0];
    v26 = [(BKUIPeriocularSelectionCell *)v4 titleLabel];
    [v25 addSubview:v26];

    v27 = [(BKUIPeriocularSelectionCell *)v4 subtitleLabel];
    [v25 addSubview:v27];

    v28 = [(BKUIPeriocularSelectionCell *)v4 contentView];
    [v28 addSubview:v25];

    v29 = [(BKUIPeriocularSelectionCell *)v4 contentView];
    v30 = [(BKUIPeriocularSelectionCell *)v4 iconView];
    [v29 addSubview:v30];

    v31 = [MEMORY[0x1E4F428B8] secondarySystemBackgroundColor];
    [(BKUIPeriocularSelectionCell *)v4 setBackgroundColor:v31];

    v82 = (void *)MEMORY[0x1E4F28DC8];
    v96 = [v25 topAnchor];
    v98 = [(BKUIPeriocularSelectionCell *)v4 contentView];
    v94 = [v98 topAnchor];
    v92 = [v96 constraintGreaterThanOrEqualToAnchor:v94];
    v103[0] = v92;
    v100 = v25;
    v88 = [v25 bottomAnchor];
    v90 = [(BKUIPeriocularSelectionCell *)v4 contentView];
    v86 = [v90 bottomAnchor];
    v84 = [v88 constraintLessThanOrEqualToAnchor:v86];
    v103[1] = v84;
    v80 = [v25 leadingAnchor];
    v32 = [(BKUIPeriocularSelectionCell *)v4 leadingAnchor];
    v33 = [v80 constraintEqualToAnchor:v32];
    v103[2] = v33;
    v34 = [v25 trailingAnchor];
    v35 = [(BKUIPeriocularSelectionCell *)v4 trailingAnchor];
    v36 = [v34 constraintEqualToAnchor:v35];
    v103[3] = v36;
    v37 = [v25 centerYAnchor];
    v38 = [(BKUIPeriocularSelectionCell *)v4 centerYAnchor];
    v39 = [v37 constraintEqualToAnchor:v38];
    v103[4] = v39;
    v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v103 count:5];
    [v82 activateConstraints:v40];

    v71 = (void *)MEMORY[0x1E4F28DC8];
    v99 = [(BKUIPeriocularSelectionCell *)v4 iconView];
    v97 = [v99 leadingAnchor];
    v95 = [v100 leadingAnchor];
    v93 = [v97 constraintEqualToAnchor:v95 constant:21.0];
    v102[0] = v93;
    v91 = [(BKUIPeriocularSelectionCell *)v4 iconView];
    v89 = [v91 widthAnchor];
    v87 = [v89 constraintEqualToConstant:37.0];
    v102[1] = v87;
    v85 = [(BKUIPeriocularSelectionCell *)v4 iconView];
    v83 = [v85 heightAnchor];
    v81 = [v83 constraintEqualToConstant:37.0];
    v102[2] = v81;
    v79 = [(BKUIPeriocularSelectionCell *)v4 iconView];
    v78 = [v79 centerYAnchor];
    v77 = [(BKUIPeriocularSelectionCell *)v4 centerYAnchor];
    v76 = [v78 constraintEqualToAnchor:v77];
    v102[3] = v76;
    v75 = [(BKUIPeriocularSelectionCell *)v4 titleLabel];
    v74 = [v75 topAnchor];
    v73 = [v100 topAnchor];
    [(BKUIPeriocularSelectionCell *)v4 BKUIPeriocularSelectionCellTopBottomPadding];
    v72 = objc_msgSend(v74, "constraintEqualToAnchor:constant:", v73);
    v102[4] = v72;
    v70 = [(BKUIPeriocularSelectionCell *)v4 titleLabel];
    v68 = [v70 leadingAnchor];
    v69 = [(BKUIPeriocularSelectionCell *)v4 iconView];
    v67 = [v69 trailingAnchor];
    v66 = [v68 constraintEqualToAnchor:v67 constant:20.0];
    v102[5] = v66;
    v65 = [(BKUIPeriocularSelectionCell *)v4 titleLabel];
    v64 = [v65 trailingAnchor];
    v63 = [v100 trailingAnchor];
    v62 = [v64 constraintEqualToAnchor:v63 constant:-38.0];
    v102[6] = v62;
    v61 = [(BKUIPeriocularSelectionCell *)v4 subtitleLabel];
    v59 = [v61 topAnchor];
    v60 = [(BKUIPeriocularSelectionCell *)v4 titleLabel];
    v58 = [v60 bottomAnchor];
    v57 = [v59 constraintEqualToAnchor:v58 constant:1.0];
    v102[7] = v57;
    v56 = [(BKUIPeriocularSelectionCell *)v4 subtitleLabel];
    v55 = [v56 bottomAnchor];
    v54 = [v100 bottomAnchor];
    [(BKUIPeriocularSelectionCell *)v4 BKUIPeriocularSelectionCellTopBottomPadding];
    v53 = [v55 constraintEqualToAnchor:v54 constant:-v41];
    v102[8] = v53;
    v52 = [(BKUIPeriocularSelectionCell *)v4 subtitleLabel];
    v42 = [v52 leadingAnchor];
    v43 = [(BKUIPeriocularSelectionCell *)v4 iconView];
    v44 = [v43 trailingAnchor];
    v45 = [v42 constraintEqualToAnchor:v44 constant:20.0];
    v102[9] = v45;
    v46 = [(BKUIPeriocularSelectionCell *)v4 subtitleLabel];
    v47 = [v46 trailingAnchor];
    v48 = [v100 trailingAnchor];
    v49 = [v47 constraintEqualToAnchor:v48 constant:-38.0];
    v102[10] = v49;
    v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:v102 count:11];
    [v71 activateConstraints:v50];
  }
  return v4;
}

- (id)_titleFont
{
  int v2 = [MEMORY[0x1E4F42A38] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4F438C8]];
  v3 = (void *)MEMORY[0x1E4F42A30];
  v4 = [v2 fontDescriptorWithSymbolicTraits:2];
  id v5 = [v3 fontWithDescriptor:v4 size:0.0];

  return v5;
}

- (id)_descriptionFont
{
  int v2 = (void *)MEMORY[0x1E4F42A30];
  v3 = [MEMORY[0x1E4F42A38] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4F438C8]];
  v4 = [v2 fontWithDescriptor:v3 size:0.0];

  return v4;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end