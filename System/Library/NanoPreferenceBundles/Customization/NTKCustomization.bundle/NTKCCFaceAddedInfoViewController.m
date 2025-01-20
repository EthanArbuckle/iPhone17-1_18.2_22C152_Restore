@interface NTKCCFaceAddedInfoViewController
+ (BOOL)shouldShow;
+ (UIEdgeInsets)layoutMargins;
+ (id)backgroundColor;
- (CGSize)preferredContentSize;
- (UIButton)close;
- (UILabel)body;
- (UILabel)header;
- (void)_closeTapped;
- (void)setBody:(id)a3;
- (void)setClose:(id)a3;
- (void)setHeader:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation NTKCCFaceAddedInfoViewController

- (void)viewDidLoad
{
  v19.receiver = self;
  v19.super_class = (Class)NTKCCFaceAddedInfoViewController;
  [(NTKCCFaceAddedInfoViewController *)&v19 viewDidLoad];
  v3 = objc_opt_new();
  [(NTKCCFaceAddedInfoViewController *)self setHeader:v3];

  v4 = +[UIColor whiteColor];
  [(UILabel *)self->_header setTextColor:v4];

  v5 = +[UIFont systemFontOfSize:24.0 weight:UIFontWeightBold];
  [(UILabel *)self->_header setFont:v5];

  [(UILabel *)self->_header setTextAlignment:1];
  [(UILabel *)self->_header setNumberOfLines:0];
  v6 = NTKCCustomizationLocalizedString();
  [(UILabel *)self->_header setText:v6];

  v7 = [(NTKCCFaceAddedInfoViewController *)self view];
  [v7 addSubview:self->_header];

  v8 = objc_opt_new();
  [(NTKCCFaceAddedInfoViewController *)self setBody:v8];

  v9 = +[UIColor colorWithWhite:1.0 alpha:0.6];
  [(UILabel *)self->_body setTextColor:v9];

  v10 = +[UIFont systemFontOfSize:17.0];
  [(UILabel *)self->_body setFont:v10];

  [(UILabel *)self->_body setNumberOfLines:0];
  [(UILabel *)self->_body setTextAlignment:1];
  v11 = NTKCCustomizationLocalizedString();
  [(UILabel *)self->_body setText:v11];

  v12 = [(NTKCCFaceAddedInfoViewController *)self view];
  [v12 addSubview:self->_body];

  v13 = +[UIButtonConfiguration plainButtonConfiguration];
  v14 = +[UIColor whiteColor];
  [v13 setBaseForegroundColor:v14];

  objc_msgSend(v13, "setContentInsets:", 12.0, 12.0, 12.0, 12.0);
  v15 = +[UIImageSymbolConfiguration configurationWithPointSize:9 weight:11.0];
  v16 = +[UIImage systemImageNamed:@"xmark" withConfiguration:v15];
  [v13 setImage:v16];

  v17 = +[UIButton buttonWithConfiguration:v13 primaryAction:0];
  [(NTKCCFaceAddedInfoViewController *)self setClose:v17];

  [(UIButton *)self->_close addTarget:self action:"_closeTapped" forControlEvents:64];
  [(UIButton *)self->_close sizeToFit];
  [(UIButton *)self->_close layoutBelowIfNeeded];
  v18 = [(NTKCCFaceAddedInfoViewController *)self view];
  [v18 addSubview:self->_close];
}

- (void)viewDidLayoutSubviews
{
  v74.receiver = self;
  v74.super_class = (Class)NTKCCFaceAddedInfoViewController;
  [(NTKCCFaceAddedInfoViewController *)&v74 viewDidLayoutSubviews];
  v3 = [(NTKCCFaceAddedInfoViewController *)self view];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v69 = v6;
  CGFloat v8 = v7;
  CGFloat v10 = v9;

  int IsRTL = CLKLayoutIsRTL();
  [(UIButton *)self->_close frame];
  CGFloat v66 = v12;
  CGFloat v67 = v13;
  CGFloat v68 = v14;
  close = self->_close;
  v16 = [(UIButton *)close imageView];
  [v16 frame];
  -[UIButton convertRect:toView:](close, "convertRect:toView:", self->_close);
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;

  v75.origin.x = v18;
  v75.origin.y = v20;
  v75.size.width = v22;
  v75.size.height = v24;
  CGFloat v72 = v5;
  double rect = 12.0 - CGRectGetMinY(v75);
  CGFloat v70 = v10;
  CGFloat v71 = v8;
  if (IsRTL)
  {
    v76.origin.x = v5;
    CGFloat v25 = v69;
    v76.origin.y = v69;
    v76.size.width = v8;
    v76.size.height = v10;
    CGFloat v65 = CGRectGetWidth(v76) + -12.0;
    v77.origin.x = v66;
    double v26 = v67;
    v77.origin.y = rect;
    double v27 = v68;
    v77.size.width = v68;
    v77.size.height = v67;
    double Width = CGRectGetWidth(v77);
    v78.origin.x = v18;
    v78.origin.y = v20;
    v78.size.width = v22;
    v78.size.height = v24;
    double v29 = v65 + CGRectGetMinX(v78) - Width;
  }
  else
  {
    v79.origin.x = v18;
    v79.origin.y = v20;
    v79.size.width = v22;
    v79.size.height = v24;
    double v29 = 12.0 - CGRectGetMinX(v79);
    double v27 = v68;
    CGFloat v25 = v69;
    double v26 = v67;
  }
  -[UIButton setFrame:](self->_close, "setFrame:", v29, rect, v27, v26);
  v30 = self->_close;
  v31 = [(UIButton *)v30 imageView];
  [v31 frame];
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;
  v40 = [(NTKCCFaceAddedInfoViewController *)self view];
  -[UIButton convertRect:toView:](v30, "convertRect:toView:", v40, v33, v35, v37, v39);
  CGFloat v42 = v41;
  CGFloat v44 = v43;
  CGFloat v46 = v45;
  CGFloat v48 = v47;

  if (IsRTL)
  {
    CGFloat v50 = v71;
    CGFloat v49 = v72;
    v80.origin.x = v72;
    v80.origin.y = v25;
    v80.size.width = v71;
    CGFloat v51 = v70;
    v80.size.height = v70;
    double v52 = CGRectGetWidth(v80);
    v81.origin.x = v29;
    v81.origin.y = rect;
    v81.size.width = v27;
    v81.size.height = v26;
    double v53 = v52 - CGRectGetMinX(v81) + -12.0;
  }
  else
  {
    v82.origin.x = v42;
    v82.origin.y = v44;
    v82.size.width = v46;
    v82.size.height = v48;
    double v53 = CGRectGetMaxX(v82) + 12.0;
    CGFloat v50 = v71;
    CGFloat v49 = v72;
    CGFloat v51 = v70;
  }
  v83.origin.x = v49;
  v83.origin.y = v25;
  v83.size.width = v50;
  v83.size.height = v51;
  CGFloat v54 = CGRectGetWidth(v83) + v53 * -2.0;
  -[UILabel sizeThatFits:](self->_header, "sizeThatFits:", v54, 1.79769313e308);
  double v56 = v55;
  [(UILabel *)self->_header frame];
  [(UILabel *)self->_header setFrame:v53];
  [(UILabel *)self->_header _firstBaselineOffsetFromTop];
  CGFloat v58 = 44.0 - v57;
  -[UILabel setFrame:](self->_header, "setFrame:", v53, 44.0 - v57, v54, v56);
  -[UILabel sizeThatFits:](self->_body, "sizeThatFits:", v54, 1.79769313e308);
  double v60 = v59;
  [(UILabel *)self->_body frame];
  [(UILabel *)self->_body setFrame:v53];
  v84.origin.x = v53;
  v84.origin.y = v58;
  v84.size.width = v54;
  v84.size.height = v56;
  double MaxY = CGRectGetMaxY(v84);
  [(UILabel *)self->_header _baselineOffsetFromBottom];
  double v63 = MaxY - v62 + 27.0;
  [(UILabel *)self->_body _firstBaselineOffsetFromTop];
  -[UILabel setFrame:](self->_body, "setFrame:", v53, v63 - v64, v54, v60);
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)NTKCCFaceAddedInfoViewController;
  [(NTKCCFaceAddedInfoViewController *)&v3 viewDidAppear:a3];
  CFPreferencesSetAppValue(@"FaceAddedInfoPopoverShown", kCFBooleanTrue, NTKFacePreferencesDomain);
}

- (CGSize)preferredContentSize
{
  objc_super v3 = +[UIScreen mainScreen];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5 + -40.0;
  double v9 = [(NTKCCFaceAddedInfoViewController *)self view];
  objc_msgSend(v9, "setFrame:", 0.0, 0.0, v8, v7);

  CGFloat v10 = [(NTKCCFaceAddedInfoViewController *)self view];
  [v10 layoutIfNeeded];

  [(UILabel *)self->_body frame];
  double MaxY = CGRectGetMaxY(v16);
  [(UILabel *)self->_body _baselineOffsetFromBottom];
  double v13 = MaxY - v12 + 24.0;
  double v14 = v8;
  result.height = v13;
  result.width = v14;
  return result;
}

- (void)_closeTapped
{
}

+ (BOOL)shouldShow
{
  return CFPreferencesGetAppBooleanValue(@"FaceAddedInfoPopoverShown", NTKFacePreferencesDomain, 0) == 0;
}

+ (id)backgroundColor
{
  return +[UIColor colorWithWhite:0.282352941 alpha:0.9];
}

+ (UIEdgeInsets)layoutMargins
{
  double v2 = 0.0;
  double v3 = 20.0;
  double v4 = 0.0;
  double v5 = 20.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UILabel)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
}

- (UILabel)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
}

- (UIButton)close
{
  return self->_close;
}

- (void)setClose:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_close, 0);
  objc_storeStrong((id *)&self->_body, 0);

  objc_storeStrong((id *)&self->_header, 0);
}

@end