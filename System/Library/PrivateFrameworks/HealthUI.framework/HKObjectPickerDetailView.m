@interface HKObjectPickerDetailView
- (HKObjectPickerDetailView)initWithFrame:(CGRect)a3;
- (UILabel)primaryLabel;
- (UILabel)secondaryLabel;
- (void)_setUpSubviews;
- (void)setPrimaryLabel:(id)a3;
- (void)setSecondaryLabel:(id)a3;
@end

@implementation HKObjectPickerDetailView

- (HKObjectPickerDetailView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HKObjectPickerDetailView;
  v3 = -[HKObjectPickerDetailView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(HKObjectPickerDetailView *)v3 _setUpSubviews];
  }
  return v4;
}

- (void)_setUpSubviews
{
  v40[7] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4FB1930]);
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v8 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], v5, v6, v7);
  primaryLabel = self->_primaryLabel;
  self->_primaryLabel = v8;

  [(UILabel *)self->_primaryLabel setAdjustsFontForContentSizeCategory:1];
  uint64_t v10 = *MEMORY[0x1E4FB28C8];
  v11 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [(UILabel *)self->_primaryLabel setFont:v11];

  [(UILabel *)self->_primaryLabel setNumberOfLines:0];
  v12 = [MEMORY[0x1E4FB1618] labelColor];
  [(UILabel *)self->_primaryLabel setTextColor:v12];

  [(UILabel *)self->_primaryLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(HKObjectPickerDetailView *)self addSubview:self->_primaryLabel];
  v13 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v4, v5, v6, v7);
  secondaryLabel = self->_secondaryLabel;
  self->_secondaryLabel = v13;

  [(UILabel *)self->_secondaryLabel setAdjustsFontForContentSizeCategory:1];
  v15 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v10];
  [(UILabel *)self->_secondaryLabel setFont:v15];

  [(UILabel *)self->_secondaryLabel setNumberOfLines:0];
  v16 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(UILabel *)self->_secondaryLabel setTextColor:v16];

  [(UILabel *)self->_secondaryLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(HKObjectPickerDetailView *)self addSubview:self->_secondaryLabel];
  v30 = (void *)MEMORY[0x1E4F28DC8];
  v39 = [(UILabel *)self->_primaryLabel topAnchor];
  v38 = [(HKObjectPickerDetailView *)self topAnchor];
  v37 = [v39 constraintEqualToAnchor:v38];
  v40[0] = v37;
  v36 = [(UILabel *)self->_primaryLabel leadingAnchor];
  v35 = [(HKObjectPickerDetailView *)self leadingAnchor];
  v34 = [v36 constraintEqualToAnchor:v35];
  v40[1] = v34;
  v33 = [(HKObjectPickerDetailView *)self trailingAnchor];
  v32 = [(UILabel *)self->_primaryLabel trailingAnchor];
  v31 = [v33 constraintEqualToAnchor:v32];
  v40[2] = v31;
  v29 = [(UILabel *)self->_secondaryLabel topAnchor];
  v28 = [(UILabel *)self->_primaryLabel bottomAnchor];
  v27 = [v29 constraintEqualToAnchor:v28];
  v40[3] = v27;
  v17 = [(UILabel *)self->_secondaryLabel leadingAnchor];
  v18 = [(UILabel *)self->_primaryLabel leadingAnchor];
  v19 = [v17 constraintEqualToAnchor:v18];
  v40[4] = v19;
  v20 = [(HKObjectPickerDetailView *)self trailingAnchor];
  v21 = [(UILabel *)self->_secondaryLabel trailingAnchor];
  v22 = [v20 constraintEqualToAnchor:v21];
  v40[5] = v22;
  v23 = [(HKObjectPickerDetailView *)self bottomAnchor];
  v24 = [(UILabel *)self->_secondaryLabel bottomAnchor];
  v25 = [v23 constraintEqualToAnchor:v24];
  v40[6] = v25;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:7];
  [v30 activateConstraints:v26];
}

- (UILabel)primaryLabel
{
  return self->_primaryLabel;
}

- (void)setPrimaryLabel:(id)a3
{
}

- (UILabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (void)setSecondaryLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
}

@end