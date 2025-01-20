@interface MFDatePickerSectionHeaderView
- (MFDatePickerSectionHeaderView)initWithFrame:(CGRect)a3;
- (UILabel)label;
- (void)setLabel:(id)a3;
@end

@implementation MFDatePickerSectionHeaderView

- (MFDatePickerSectionHeaderView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)MFDatePickerSectionHeaderView;
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v7 = -[MFDatePickerSectionHeaderView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v4, v5, v6);
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v3, v4, v5, v6);
    v9 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D0]];
    [v8 setFont:v9];

    [v8 setNumberOfLines:0];
    [v8 setLineBreakMode:0];
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MFDatePickerSectionHeaderView *)v7 setLabel:v8];
    [(MFDatePickerSectionHeaderView *)v7 addSubview:v8];
    objc_msgSend(v8, "mf_pinToView:usingLayoutMargins:", v7, 1);
  }
  return v7;
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end