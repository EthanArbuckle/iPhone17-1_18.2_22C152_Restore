@interface CertUIItemSummaryCell
+ (double)titleOriginX;
- (CertUIItemSummaryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIImageView)itemImageView;
- (UILabel)itemSubtitleLabel;
- (UILabel)itemTitleLabel;
- (UIView)itemTitleView;
- (double)cellHeight;
- (id)_profileImageAppropriateForDevice;
- (void)_setupCell;
- (void)_setupConstraints;
- (void)setItemImageView:(id)a3;
- (void)setItemSubtitleLabel:(id)a3;
- (void)setItemTitleLabel:(id)a3;
- (void)setItemTitleView:(id)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation CertUIItemSummaryCell

- (CertUIItemSummaryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CertUIItemSummaryCell;
  v4 = [(CertUIItemSummaryCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(CertUIItemSummaryCell *)v4 setSelectionStyle:0];
    [(CertUIItemSummaryCell *)v5 _setupCell];
  }
  return v5;
}

- (void)_setupCell
{
  id v21 = [(CertUIItemSummaryCell *)self _profileImageAppropriateForDevice];
  v3 = (UIImageView *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v21];
  itemImageView = self->_itemImageView;
  self->_itemImageView = v3;

  [(UIImageView *)self->_itemImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = [(CertUIItemSummaryCell *)self contentView];
  [v5 addSubview:self->_itemImageView];

  id v6 = objc_alloc(MEMORY[0x263F1C768]);
  double v7 = *MEMORY[0x263F001A8];
  double v8 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v9 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v10 = *(double *)(MEMORY[0x263F001A8] + 24);
  v11 = (UILabel *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x263F001A8], v8, v9, v10);
  itemTitleLabel = self->_itemTitleLabel;
  self->_itemTitleLabel = v11;

  [(UILabel *)self->_itemTitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_itemTitleLabel setBackgroundColor:0];
  [(UILabel *)self->_itemTitleLabel setOpaque:0];
  v13 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D298]];
  [(UILabel *)self->_itemTitleLabel setFont:v13];

  v14 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v7, v8, v9, v10);
  itemSubtitleLabel = self->_itemSubtitleLabel;
  self->_itemSubtitleLabel = v14;

  [(UILabel *)self->_itemSubtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_itemSubtitleLabel setBackgroundColor:0];
  [(UILabel *)self->_itemSubtitleLabel setOpaque:0];
  v16 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D2C0]];
  [(UILabel *)self->_itemSubtitleLabel setFont:v16];

  v17 = [MEMORY[0x263F1C550] systemGrayColor];
  [(UILabel *)self->_itemSubtitleLabel setTextColor:v17];

  v18 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", v7, v8, v9, v10);
  itemTitleView = self->_itemTitleView;
  self->_itemTitleView = v18;

  [(UIView *)self->_itemTitleView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_itemTitleView addSubview:self->_itemTitleLabel];
  [(UIView *)self->_itemTitleView addSubview:self->_itemSubtitleLabel];
  v20 = [(CertUIItemSummaryCell *)self contentView];
  [v20 addSubview:self->_itemTitleView];

  [(CertUIItemSummaryCell *)self _setupConstraints];
}

- (id)_profileImageAppropriateForDevice
{
  v2 = [MEMORY[0x263F1C920] mainScreen];
  [v2 scale];
  double v4 = v3;

  v5 = (void *)MEMORY[0x263F1C6B0];
  id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  double v7 = [v5 imageNamed:@"profile-icon" inBundle:v6];
  double v8 = [v7 _applicationIconImageForFormat:2 precomposed:1 scale:v4];

  return v8;
}

- (void)_setupConstraints
{
  double v3 = [(CertUIItemSummaryCell *)self contentView];
  double v4 = (void *)MEMORY[0x263F08938];
  v5 = [(CertUIItemSummaryCell *)self itemImageView];
  id v6 = [(CertUIItemSummaryCell *)self itemImageView];
  double v7 = [(CertUIItemSummaryCell *)self itemImageView];
  double v8 = [v7 image];
  [v8 size];
  double v10 = [v4 constraintWithItem:v5 attribute:7 relatedBy:0 toItem:v6 attribute:7 multiplier:0.0 constant:v9];
  [v3 addConstraint:v10];

  v11 = [(CertUIItemSummaryCell *)self contentView];
  v12 = (void *)MEMORY[0x263F08938];
  v13 = [(CertUIItemSummaryCell *)self itemImageView];
  v14 = [(CertUIItemSummaryCell *)self itemImageView];
  v15 = [(CertUIItemSummaryCell *)self itemImageView];
  v16 = [v15 image];
  [v16 size];
  v17 = objc_msgSend(v12, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v13, 8, 0, v14, 8, 0.0);
  [v11 addConstraint:v17];

  v18 = [(CertUIItemSummaryCell *)self contentView];
  v19 = (void *)MEMORY[0x263F08938];
  v20 = [(CertUIItemSummaryCell *)self itemImageView];
  id v21 = [(CertUIItemSummaryCell *)self contentView];
  v22 = [v19 constraintWithItem:v20 attribute:1 relatedBy:0 toItem:v21 attribute:1 multiplier:1.0 constant:15.0];
  [v18 addConstraint:v22];

  v23 = [(CertUIItemSummaryCell *)self contentView];
  v24 = (void *)MEMORY[0x263F08938];
  v25 = [(CertUIItemSummaryCell *)self itemImageView];
  v26 = [(CertUIItemSummaryCell *)self contentView];
  v27 = [v24 constraintWithItem:v25 attribute:10 relatedBy:0 toItem:v26 attribute:10 multiplier:1.0 constant:0.0];
  [v23 addConstraint:v27];

  v28 = (void *)MEMORY[0x263F08938];
  v29 = [(CertUIItemSummaryCell *)self contentView];
  v30 = [(CertUIItemSummaryCell *)self itemImageView];
  id v88 = [v28 constraintWithItem:v29 attribute:8 relatedBy:1 toItem:v30 attribute:8 multiplier:1.0 constant:16.0];

  LODWORD(v31) = 1148829696;
  [v88 setPriority:v31];
  v32 = [(CertUIItemSummaryCell *)self contentView];
  [v32 addConstraint:v88];

  v33 = [(CertUIItemSummaryCell *)self itemTitleView];
  v34 = (void *)MEMORY[0x263F08938];
  v35 = [(CertUIItemSummaryCell *)self itemTitleLabel];
  v36 = [(CertUIItemSummaryCell *)self itemTitleView];
  v37 = [v34 constraintWithItem:v35 attribute:3 relatedBy:0 toItem:v36 attribute:3 multiplier:1.0 constant:0.0];
  [v33 addConstraint:v37];

  v38 = [(CertUIItemSummaryCell *)self itemTitleView];
  v39 = (void *)MEMORY[0x263F08938];
  v40 = [(CertUIItemSummaryCell *)self itemTitleLabel];
  v41 = [(CertUIItemSummaryCell *)self itemTitleView];
  v42 = [v39 constraintWithItem:v40 attribute:1 relatedBy:0 toItem:v41 attribute:1 multiplier:1.0 constant:0.0];
  [v38 addConstraint:v42];

  v43 = [(CertUIItemSummaryCell *)self itemTitleView];
  v44 = (void *)MEMORY[0x263F08938];
  v45 = [(CertUIItemSummaryCell *)self itemTitleView];
  v46 = [(CertUIItemSummaryCell *)self itemTitleLabel];
  v47 = [v44 constraintWithItem:v45 attribute:2 relatedBy:1 toItem:v46 attribute:2 multiplier:1.0 constant:0.0];
  [v43 addConstraint:v47];

  v48 = [(CertUIItemSummaryCell *)self itemTitleView];
  v49 = (void *)MEMORY[0x263F08938];
  v50 = [(CertUIItemSummaryCell *)self itemSubtitleLabel];
  v51 = [(CertUIItemSummaryCell *)self itemTitleLabel];
  v52 = [v49 constraintWithItem:v50 attribute:3 relatedBy:0 toItem:v51 attribute:4 multiplier:1.0 constant:0.0];
  [v48 addConstraint:v52];

  v53 = [(CertUIItemSummaryCell *)self itemTitleView];
  v54 = (void *)MEMORY[0x263F08938];
  v55 = [(CertUIItemSummaryCell *)self itemSubtitleLabel];
  v56 = [(CertUIItemSummaryCell *)self itemTitleView];
  v57 = [v54 constraintWithItem:v55 attribute:1 relatedBy:0 toItem:v56 attribute:1 multiplier:1.0 constant:0.0];
  [v53 addConstraint:v57];

  v58 = [(CertUIItemSummaryCell *)self itemTitleView];
  v59 = (void *)MEMORY[0x263F08938];
  v60 = [(CertUIItemSummaryCell *)self itemTitleView];
  v61 = [(CertUIItemSummaryCell *)self itemSubtitleLabel];
  v62 = [v59 constraintWithItem:v60 attribute:2 relatedBy:1 toItem:v61 attribute:2 multiplier:1.0 constant:0.0];
  [v58 addConstraint:v62];

  v63 = [(CertUIItemSummaryCell *)self itemTitleView];
  v64 = (void *)MEMORY[0x263F08938];
  v65 = [(CertUIItemSummaryCell *)self itemTitleView];
  v66 = [(CertUIItemSummaryCell *)self itemSubtitleLabel];
  v67 = [v64 constraintWithItem:v65 attribute:4 relatedBy:0 toItem:v66 attribute:4 multiplier:1.0 constant:0.0];
  [v63 addConstraint:v67];

  v68 = [(CertUIItemSummaryCell *)self contentView];
  v69 = (void *)MEMORY[0x263F08938];
  v70 = [(CertUIItemSummaryCell *)self itemTitleView];
  v71 = [(CertUIItemSummaryCell *)self itemImageView];
  v72 = [v69 constraintWithItem:v70 attribute:10 relatedBy:0 toItem:v71 attribute:10 multiplier:1.0 constant:0.0];
  [v68 addConstraint:v72];

  v73 = [(CertUIItemSummaryCell *)self contentView];
  v74 = (void *)MEMORY[0x263F08938];
  v75 = [(CertUIItemSummaryCell *)self itemTitleView];
  v76 = [(CertUIItemSummaryCell *)self itemImageView];
  v77 = [v74 constraintWithItem:v75 attribute:1 relatedBy:0 toItem:v76 attribute:2 multiplier:1.0 constant:12.0];
  [v73 addConstraint:v77];

  v78 = [(CertUIItemSummaryCell *)self contentView];
  v79 = (void *)MEMORY[0x263F08938];
  v80 = [(CertUIItemSummaryCell *)self itemTitleView];
  v81 = [(CertUIItemSummaryCell *)self contentView];
  v82 = [v79 constraintWithItem:v80 attribute:2 relatedBy:0 toItem:v81 attribute:2 multiplier:1.0 constant:-12.0];
  [v78 addConstraint:v82];

  v83 = [(CertUIItemSummaryCell *)self contentView];
  v84 = (void *)MEMORY[0x263F08938];
  v85 = [(CertUIItemSummaryCell *)self contentView];
  v86 = [(CertUIItemSummaryCell *)self itemTitleView];
  v87 = [v84 constraintWithItem:v85 attribute:8 relatedBy:1 toItem:v86 attribute:8 multiplier:1.0 constant:0.0];
  [v83 addConstraint:v87];
}

- (double)cellHeight
{
  v2 = [(CertUIItemSummaryCell *)self itemImageView];
  double v3 = [v2 image];
  [v3 size];
  double v5 = v4;

  if (v5 <= 0.0)
  {
    id v6 = [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v7 = [v6 userInterfaceIdiom];

    if (v7 == 1) {
      double v5 = 72.0;
    }
    else {
      double v5 = 58.0;
    }
  }
  return v5 + 16.0;
}

+ (double)titleOriginX
{
  v2 = [MEMORY[0x263F1C5C0] currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == 1;

  return dbl_218616F20[v3];
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)CertUIItemSummaryCell;
  [(CertUIItemSummaryCell *)&v4 setSelected:a3 animated:a4];
}

- (UIImageView)itemImageView
{
  return self->_itemImageView;
}

- (void)setItemImageView:(id)a3
{
}

- (UIView)itemTitleView
{
  return self->_itemTitleView;
}

- (void)setItemTitleView:(id)a3
{
}

- (UILabel)itemTitleLabel
{
  return self->_itemTitleLabel;
}

- (void)setItemTitleLabel:(id)a3
{
}

- (UILabel)itemSubtitleLabel
{
  return self->_itemSubtitleLabel;
}

- (void)setItemSubtitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemSubtitleLabel, 0);
  objc_storeStrong((id *)&self->_itemTitleLabel, 0);
  objc_storeStrong((id *)&self->_itemTitleView, 0);
  objc_storeStrong((id *)&self->_itemImageView, 0);
}

@end