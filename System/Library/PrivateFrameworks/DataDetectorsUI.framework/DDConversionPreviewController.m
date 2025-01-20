@interface DDConversionPreviewController
- (CGSize)preferredContentSize;
- (DDConversionPreviewController)initWithTitle:(id)a3 subTitle:(id)a4 finance:(BOOL)a5;
- (double)preferredWidth;
- (id)view;
@end

@implementation DDConversionPreviewController

- (DDConversionPreviewController)initWithTitle:(id)a3 subTitle:(id)a4 finance:(BOOL)a5
{
  v8 = (__CFString *)a3;
  v9 = (__CFString *)a4;
  v15.receiver = self;
  v15.super_class = (Class)DDConversionPreviewController;
  v10 = [(DDConversionPreviewController *)&v15 init];
  v11 = v10;
  if (v10)
  {
    if (v8) {
      v12 = v8;
    }
    else {
      v12 = &stru_1EF5023D8;
    }
    objc_storeStrong((id *)&v10->_title, v12);
    if (v9) {
      v13 = v9;
    }
    else {
      v13 = &stru_1EF5023D8;
    }
    objc_storeStrong((id *)&v11->_subtitle, v13);
    v11->_finance = a5;
  }

  return v11;
}

- (id)view
{
  mainView = self->_mainView;
  if (!mainView)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    v5 = self->_mainView;
    self->_mainView = v4;

    [(UIView *)self->_mainView setTranslatesAutoresizingMaskIntoConstraints:0];
    v6 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
    [(UIView *)self->_mainView setBackgroundColor:v6];

    id v7 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self->_mainView addSubview:v7];
    id v8 = objc_alloc_init(MEMORY[0x1E4F42B38]);
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v8 setText:self->_title];
    [v8 setTextAlignment:1];
    v9 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F438A0]];
    [v8 setFont:v9];

    v10 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
    [v8 setTextColor:v10];

    [v8 setAdjustsFontSizeToFitWidth:1];
    [v7 addSubview:v8];
    id v11 = objc_alloc_init(MEMORY[0x1E4F42B38]);
    [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v11 setTextAlignment:1];
    [v11 setText:self->_subtitle];
    v12 = [MEMORY[0x1E4F428B8] labelColor];
    [v11 setTextColor:v12];

    v13 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F438F0]];
    [v11 setFont:v13];

    [v11 setAdjustsFontSizeToFitWidth:1];
    [v7 addSubview:v11];
    if (!self->_finance) {
      goto LABEL_5;
    }
    v14 = (void *)MEMORY[0x1E4F42A80];
    objc_super v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v16 = [v14 imageNamed:@"YahooFinance" inBundle:v15];

    v17 = [v16 imageWithRenderingMode:2];

    v18 = (void *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v17];
    v19 = [MEMORY[0x1E4F428B8] labelColor];
    [v18 setTintColor:v19];

    [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self->_mainView addSubview:v18];

    if (v18)
    {
      v20 = _NSDictionaryOfVariableBindings(&cfstr_TitleSubtitleT.isa, v8, v11, v7, v18, 0);

      int v67 = 0;
    }
    else
    {
LABEL_5:
      v20 = _NSDictionaryOfVariableBindings(&cfstr_TitleSubtitleT_0.isa, v8, v11, v7, 0);
      int v67 = 1;
    }
    v21 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-(>=0)-[title]-(>=0)-|" options:0 metrics:&unk_1EF511070 views:v20];
    [v7 addConstraints:v21];

    v22 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-(>=0)-[subtitle]-(>=0)-|" options:0 metrics:&unk_1EF511070 views:v20];
    [v7 addConstraints:v22];

    v23 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|[title][subtitle]|" options:0 metrics:&unk_1EF511070 views:v20];
    [v7 addConstraints:v23];

    v24 = [v7 centerXAnchor];
    v25 = [v8 centerXAnchor];
    v26 = [v24 constraintEqualToAnchor:v25];
    [v26 setActive:1];

    v27 = [v7 centerXAnchor];
    v28 = [v11 centerXAnchor];
    v29 = [v27 constraintEqualToAnchor:v28];
    [v29 setActive:1];

    v30 = [(UIView *)self->_mainView centerXAnchor];
    v31 = [v7 centerXAnchor];
    v32 = [v30 constraintEqualToAnchor:v31];
    [v32 setActive:1];

    v33 = self->_mainView;
    v34 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-(>=margin)-[textContainer]-(>=margin)-|" options:0 metrics:&unk_1EF511070 views:v20];
    [(UIView *)v33 addConstraints:v34];

    v35 = self->_mainView;
    v36 = (void *)MEMORY[0x1E4F28DC8];
    if (v67)
    {
      v37 = @"V:|-(>=margin)-[textContainer]-(>=margin)-|";
    }
    else
    {
      v38 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-(>=margin)-[attribution(77)]-(margin)-|" options:0 metrics:&unk_1EF511070 views:v20];
      [(UIView *)v35 addConstraints:v38];

      v35 = self->_mainView;
      v36 = (void *)MEMORY[0x1E4F28DC8];
      v37 = @"V:|-(>=margin)-[textContainer]-(>=margin)-[attribution(11)]-(margin)-|";
    }
    v39 = [v36 constraintsWithVisualFormat:v37 options:0 metrics:&unk_1EF511070 views:v20];
    [(UIView *)v35 addConstraints:v39];

    v40 = [v7 centerXAnchor];
    v41 = [(UIView *)self->_mainView centerXAnchor];
    v42 = [v40 constraintEqualToAnchor:v41];
    [v42 setActive:1];

    v43 = [v7 centerYAnchor];
    v44 = [(UIView *)self->_mainView centerYAnchor];
    v45 = [v43 constraintEqualToAnchor:v44];
    [v45 setActive:1];

    [(DDConversionPreviewController *)self preferredWidth];
    double v47 = v46;
    [(DDConversionPreviewController *)self preferredWidth];
    if (v48 <= v47) {
      double v49 = v48;
    }
    else {
      double v49 = v47;
    }
    double v50 = v47 + -20.0;
    [v8 setPreferredMaxLayoutWidth:v50];
    [v11 setPreferredMaxLayoutWidth:v50];
    objc_msgSend(v8, "sizeThatFits:", v49 + -20.0, -1.0);
    double v53 = v51;
    double v54 = v52;
    if (v51 > v50)
    {
      double v54 = v52 * (v50 / v51);
      double v53 = v50;
    }
    objc_msgSend(v11, "sizeThatFits:", v49 + -20.0, -1.0);
    if (v55 <= v50) {
      double v50 = v55;
    }
    else {
      double v56 = v56 * (v50 / v55);
    }
    double v57 = 21.0;
    if (v67) {
      double v57 = 0.0;
    }
    if (v50 >= v53) {
      double v58 = v50;
    }
    else {
      double v58 = v53;
    }
    double v59 = v58 + 20.0;
    if (v49 >= v59) {
      double v60 = v49;
    }
    else {
      double v60 = v59;
    }
    CGFloat v61 = v57 + fmax(v54 + v56 + 20.0, 85.0);
    v62 = [(UIView *)self->_mainView widthAnchor];
    v63 = [v62 constraintEqualToConstant:v60];
    [v63 setActive:1];

    v64 = [(UIView *)self->_mainView heightAnchor];
    v65 = [v64 constraintEqualToConstant:v61];
    [v65 setActive:1];

    self->_naturalTextSize.width = v60;
    self->_naturalTextSize.height = v61;

    mainView = self->_mainView;
  }
  return mainView;
}

- (double)preferredWidth
{
  v2 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (v3) {
    return 325.0;
  }
  v4 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v5 = [v4 statusBarOrientation];

  if ((unint64_t)(v5 - 5) <= 0xFFFFFFFFFFFFFFFDLL) {
    return 325.0;
  }
  else {
    return 270.0;
  }
}

- (CGSize)preferredContentSize
{
  double width = self->_naturalTextSize.width;
  double height = self->_naturalTextSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_mainView, 0);
}

@end