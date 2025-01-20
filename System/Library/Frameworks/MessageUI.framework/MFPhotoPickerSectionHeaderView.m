@interface MFPhotoPickerSectionHeaderView
+ (NSString)reusableIdentifier;
- (MFPhotoPickerSectionHeaderView)initWithFrame:(CGRect)a3;
- (UIButton)actionButton;
- (UILabel)titleLabel;
- (void)addAllPhotosTarget:(id)a3 action:(SEL)a4;
- (void)setActionButton:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation MFPhotoPickerSectionHeaderView

+ (NSString)reusableIdentifier
{
  return (NSString *)@"PhotoPickerSectionHeaderIdentifier";
}

- (MFPhotoPickerSectionHeaderView)initWithFrame:(CGRect)a3
{
  v37[5] = *MEMORY[0x1E4F143B8];
  v36.receiver = self;
  v36.super_class = (Class)MFPhotoPickerSectionHeaderView;
  v3 = -[MFPhotoPickerSectionHeaderView initWithFrame:](&v36, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1930]);
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v5;

    [(UILabel *)v3->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v7 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v3->_titleLabel setTextColor:v7];

    v8 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908]];
    [(UILabel *)v3->_titleLabel setFont:v8];

    uint64_t v9 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
    actionButton = v3->_actionButton;
    v3->_actionButton = (UIButton *)v9;

    [(UIButton *)v3->_actionButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MFPhotoPickerSectionHeaderView *)v3 addSubview:v3->_titleLabel];
    [(MFPhotoPickerSectionHeaderView *)v3 addSubview:v3->_actionButton];
    v11 = (void *)MEMORY[0x1E4F28DC8];
    v35 = [(UILabel *)v3->_titleLabel leadingAnchor];
    v31 = [(MFPhotoPickerSectionHeaderView *)v3 layoutMarginsGuide];
    v30 = [v31 leadingAnchor];
    v29 = objc_msgSend(v35, "constraintEqualToAnchor:constant:", 8.0);
    v37[0] = v29;
    v28 = [(MFPhotoPickerSectionHeaderView *)v3 layoutMarginsGuide];
    v34 = [v28 trailingAnchor];
    v27 = [(UIButton *)v3->_actionButton trailingAnchor];
    v26 = objc_msgSend(v34, "constraintEqualToAnchor:constant:", 8.0);
    v37[1] = v26;
    v33 = [(UILabel *)v3->_titleLabel trailingAnchor];
    v25 = [(UIButton *)v3->_actionButton leadingAnchor];
    v24 = objc_msgSend(v33, "constraintLessThanOrEqualToAnchor:constant:", 0.0);
    v37[2] = v24;
    v32 = [(UILabel *)v3->_titleLabel centerYAnchor];
    v12 = [(MFPhotoPickerSectionHeaderView *)v3 centerYAnchor];
    v13 = [v32 constraintEqualToAnchor:v12];
    v37[3] = v13;
    v14 = [(UIButton *)v3->_actionButton centerYAnchor];
    v15 = [(MFPhotoPickerSectionHeaderView *)v3 centerYAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    v37[4] = v16;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:5];
    [v11 activateConstraints:v17];

    v18 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v19 = [v18 localizedStringForKey:@"PHOTO_PICKER_RECENT_PHOTOS" value:&stru_1F0817A00 table:@"Main"];
    [(UILabel *)v3->_titleLabel setText:v19];

    v20 = v3->_actionButton;
    v21 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v22 = [v21 localizedStringForKey:@"PHOTO_PICKER_ALL_PHOTOS" value:&stru_1F0817A00 table:@"Main"];
    [(UIButton *)v20 setTitle:v22 forState:0];
  }
  return v3;
}

- (void)addAllPhotosTarget:(id)a3 action:(SEL)a4
{
  id v7 = a3;
  v6 = [(MFPhotoPickerSectionHeaderView *)self actionButton];
  [v6 addTarget:v7 action:a4 forControlEvents:64];
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIButton)actionButton
{
  return self->_actionButton;
}

- (void)setActionButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionButton, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end