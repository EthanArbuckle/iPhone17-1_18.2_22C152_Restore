@interface PKMathTypesetViewController
+ (double)fontSize;
- (BOOL)_canShowWhileLocked;
- (BOOL)canBecomeFirstResponder;
- (CGSize)preferredContentSize;
- (void)dealloc;
- (void)loadView;
- (void)viewTapped;
@end

@implementation PKMathTypesetViewController

+ (double)fontSize
{
  self;
  v0 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v0 pointSize];
  double v2 = v1;

  return v2;
}

- (void)loadView
{
  p_contentSize = &self->_contentSize;
  v4 = (double *)MEMORY[0x1E4F1DB30];
  self->_contentSize = (CGSize)*MEMORY[0x1E4F1DB30];
  v5 = [MEMORY[0x1E4F1CA48] array];
  typesetViewController = self->_typesetViewController;
  if (typesetViewController)
  {
    v69 = [(UIViewController *)typesetViewController view];
    v7 = [MEMORY[0x1E4FB1618] clearColor];
    [(UIImageView *)v69 setBackgroundColor:v7];

LABEL_5:
    [(UIImageView *)v69 intrinsicContentSize];
    double v10 = v9;
    double v12 = v11;
    p_contentSize->width = v9;
    p_contentSize->height = v11;
    goto LABEL_6;
  }
  typesetImageView = self->_typesetImageView;
  if (typesetImageView)
  {
    v69 = typesetImageView;
    [(UIImageView *)v69 sizeToFit];
    goto LABEL_5;
  }
  v69 = 0;
  double v10 = *v4;
  double v12 = v4[1];
LABEL_6:
  id v13 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  double v14 = +[PKMathTypesetViewController fontSize]();
  v15 = (double *)MEMORY[0x1E4F1DAD8];
  if (self->_footerString)
  {
    v16 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    footerLabel = self->_footerLabel;
    self->_footerLabel = v16;

    [(UILabel *)self->_footerLabel setText:self->_footerString];
    v18 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
    v19 = (void *)MEMORY[0x1E4FB08E0];
    v20 = [v18 fontDescriptor];
    v21 = [v20 fontDescriptorWithSymbolicTraits:2];
    [v18 pointSize];
    v22 = objc_msgSend(v19, "fontWithDescriptor:size:", v21);

    [(UILabel *)self->_footerLabel setFont:v22];
    [(UILabel *)self->_footerLabel setTextColor:self->_footerColor];
    [(UILabel *)self->_footerLabel setTextAlignment:1];
    v15 = (double *)MEMORY[0x1E4F1DAD8];
  }
  double v23 = *v15;
  double v24 = v15[1];
  v25 = self->_footerLabel;
  if (v25)
  {
    double v26 = v14 * 0.5;
    [(UILabel *)v25 setNumberOfLines:1];
    [(UILabel *)self->_footerLabel sizeToFit];
    [(UILabel *)self->_footerLabel bounds];
    double v29 = v28 + v26 * 2.0;
    double v30 = 0.0;
    if (v12 <= v26 + v26) {
      double v31 = 0.0;
    }
    else {
      double v31 = v26;
    }
    p_contentSize->height = p_contentSize->height + v27;
    if (v69)
    {
      double v26 = v12 - v31;
      if (v29 <= v10)
      {
        double v30 = (v10 - v29) * 0.5;
      }
      else
      {
        double v23 = (v29 - v10) * 0.5;
        p_contentSize->width = v29;
        double v30 = 0.0;
      }
    }
    else
    {
      p_contentSize->width = v29;
      p_contentSize->height = v27 + v26 * 2.0;
    }
    -[UILabel setFrame:](self->_footerLabel, "setFrame:", v30, v26);
  }
  -[UIImageView setFrame:](v69, "setFrame:", v23, v24, v10, v12);
  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
  v32 = [v13 widthAnchor];
  v33 = [v32 constraintEqualToConstant:p_contentSize->width];
  [v5 addObject:v33];

  v34 = [v13 heightAnchor];
  v35 = [v34 constraintEqualToConstant:p_contentSize->height];
  [v5 addObject:v35];

  objc_msgSend(v13, "setFrame:", 0.0, 0.0, p_contentSize->width, p_contentSize->height);
  if (v69)
  {
    [(UIImageView *)v69 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v13 addSubview:v69];
    v36 = [(UIImageView *)v69 widthAnchor];
    v37 = [v36 constraintEqualToConstant:v10];
    [v5 addObject:v37];

    v38 = [(UIImageView *)v69 heightAnchor];
    v39 = [v38 constraintEqualToConstant:v12];
    [v5 addObject:v39];

    v40 = [v13 safeAreaLayoutGuide];
    v41 = [v40 topAnchor];
    v42 = [(UIImageView *)v69 topAnchor];
    v43 = [v41 constraintEqualToAnchor:v42];
    [v5 addObject:v43];

    v44 = [v13 safeAreaLayoutGuide];
    v45 = [v44 leadingAnchor];
    v46 = [(UIImageView *)v69 leadingAnchor];
    v47 = [v45 constraintEqualToAnchor:v46 constant:-v23];
    [v5 addObject:v47];
  }
  if (self->_typesetViewController)
  {
    -[PKMathTypesetViewController addChildViewController:](self, "addChildViewController:");
    [(UIViewController *)self->_typesetViewController didMoveToParentViewController:self];
  }
  v48 = self->_footerLabel;
  if (v48)
  {
    [(UILabel *)v48 bounds];
    double v50 = v49;
    double v52 = v51;
    [(UILabel *)self->_footerLabel frame];
    double v54 = v53;
    double v56 = v55;
    [(UILabel *)self->_footerLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [v13 addSubview:self->_footerLabel];
    v57 = [(UILabel *)self->_footerLabel widthAnchor];
    v58 = [v57 constraintEqualToConstant:v50];
    [v5 addObject:v58];

    v59 = [(UILabel *)self->_footerLabel heightAnchor];
    v60 = [v59 constraintEqualToConstant:v52];
    [v5 addObject:v60];

    v61 = [v13 safeAreaLayoutGuide];
    v62 = [v61 topAnchor];
    v63 = [(UILabel *)self->_footerLabel topAnchor];
    v64 = [v62 constraintEqualToAnchor:v63 constant:-v56];
    [v5 addObject:v64];

    v65 = [v13 safeAreaLayoutGuide];
    v66 = [v65 leadingAnchor];
    v67 = [(UILabel *)self->_footerLabel leadingAnchor];
    v68 = [v66 constraintEqualToAnchor:v67 constant:-v54];
    [v5 addObject:v68];
  }
  [MEMORY[0x1E4F28DC8] activateConstraints:v5];
  [(PKMathTypesetViewController *)self setView:v13];
}

- (void)dealloc
{
  double v2 = self;
  if (self) {
    self = (PKMathTypesetViewController *)self->_typesetViewController;
  }
  [(PKMathTypesetViewController *)self removeFromParentViewController];
  v3.receiver = v2;
  v3.super_class = (Class)PKMathTypesetViewController;
  [(PKMathTypesetViewController *)&v3 dealloc];
}

- (BOOL)canBecomeFirstResponder
{
  return 0;
}

- (CGSize)preferredContentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)viewTapped
{
  if (self)
  {
    tapAction = (void (**)(void))self->_tapAction;
    if (tapAction) {
      tapAction[2]();
    }
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGR, 0);
  objc_storeStrong((id *)&self->_footerString, 0);
  objc_storeStrong((id *)&self->_footerColor, 0);
  objc_storeStrong((id *)&self->_typesetImageView, 0);
  objc_storeStrong((id *)&self->_typesetViewController, 0);
  objc_storeStrong(&self->_tapAction, 0);

  objc_storeStrong((id *)&self->_footerLabel, 0);
}

@end