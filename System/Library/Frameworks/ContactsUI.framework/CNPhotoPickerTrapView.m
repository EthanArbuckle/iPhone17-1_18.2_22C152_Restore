@interface CNPhotoPickerTrapView
- (CNPhotoPickerTrapView)initWithFrame:(CGRect)a3;
- (NSArray)constraints;
- (UILabel)label;
- (void)setConstraints:(id)a3;
- (void)setLabel:(id)a3;
@end

@implementation CNPhotoPickerTrapView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

- (void)setConstraints:(id)a3
{
}

- (NSArray)constraints
{
  return (NSArray *)objc_getProperty(self, a2, 416, 1);
}

- (void)setLabel:(id)a3
{
}

- (UILabel)label
{
  return self->_label;
}

- (CNPhotoPickerTrapView)initWithFrame:(CGRect)a3
{
  v46[1] = *MEMORY[0x1E4F143B8];
  v41.receiver = self;
  v41.super_class = (Class)CNPhotoPickerTrapView;
  v3 = -[CNPhotoPickerTrapView initWithFrame:](&v41, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [(CNPhotoPickerTrapView *)v3 setBackgroundColor:v4];

    id v5 = objc_alloc(MEMORY[0x1E4FB1930]);
    v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(CNPhotoPickerTrapView *)v3 setLabel:v6];

    v7 = [(CNPhotoPickerTrapView *)v3 label];
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

    v8 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v9 = [(CNPhotoPickerTrapView *)v3 label];
    [v9 setTextColor:v8];

    v40 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28F0]];
    uint64_t v45 = *MEMORY[0x1E4FB0950];
    uint64_t v43 = *MEMORY[0x1E4FB0978];
    v44 = &unk_1ED9156C8;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
    v46[0] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:&v45 count:1];
    v39 = [v40 fontDescriptorByAddingAttributes:v11];

    v12 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v39 size:0.0];
    v13 = [(CNPhotoPickerTrapView *)v3 label];
    [v13 setFont:v12];

    v14 = [(CNPhotoPickerTrapView *)v3 label];
    [v14 setNumberOfLines:0];

    v15 = [(CNPhotoPickerTrapView *)v3 label];
    [v15 setTextAlignment:1];

    v16 = [(CNPhotoPickerTrapView *)v3 label];
    [(CNPhotoPickerTrapView *)v3 addSubview:v16];

    v38 = [(CNPhotoPickerTrapView *)v3 label];
    v36 = [v38 widthAnchor];
    v37 = [(CNPhotoPickerTrapView *)v3 safeAreaLayoutGuide];
    v35 = [v37 widthAnchor];
    v34 = [v36 constraintLessThanOrEqualToAnchor:v35 multiplier:1.0 constant:-20.0];
    v42[0] = v34;
    v33 = [(CNPhotoPickerTrapView *)v3 label];
    v31 = [v33 heightAnchor];
    v32 = [(CNPhotoPickerTrapView *)v3 safeAreaLayoutGuide];
    v30 = [v32 heightAnchor];
    v29 = [v31 constraintLessThanOrEqualToAnchor:v30 multiplier:1.0 constant:-20.0];
    v42[1] = v29;
    v28 = [(CNPhotoPickerTrapView *)v3 label];
    v27 = [v28 centerXAnchor];
    v17 = [(CNPhotoPickerTrapView *)v3 safeAreaLayoutGuide];
    v18 = [v17 centerXAnchor];
    v19 = [v27 constraintEqualToAnchor:v18];
    v42[2] = v19;
    v20 = [(CNPhotoPickerTrapView *)v3 label];
    v21 = [v20 centerYAnchor];
    v22 = [(CNPhotoPickerTrapView *)v3 safeAreaLayoutGuide];
    v23 = [v22 centerYAnchor];
    v24 = [v21 constraintEqualToAnchor:v23];
    v42[3] = v24;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:4];

    [MEMORY[0x1E4F28DC8] activateConstraints:v25];
  }
  return v3;
}

@end