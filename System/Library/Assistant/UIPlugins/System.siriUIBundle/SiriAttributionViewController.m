@interface SiriAttributionViewController
- (BOOL)wantsConfirmationInsets;
- (CGSize)_imageView:(id)a3 sizeThatFit:(CGSize)a4;
- (Class)transparentFooterViewClass;
- (double)desiredHeightForTransparentFooterView;
- (void)_configureWithImage:(id)a3 superViewWidth:(double)a4;
- (void)_positionButtonToFitWidth:(double)a3 isImage:(BOOL)a4;
- (void)_punchoutButtonTapped:(id)a3;
- (void)configureReusableTransparentFooterView:(id)a3;
- (void)setAceObject:(id)a3;
@end

@implementation SiriAttributionViewController

- (void)setAceObject:(id)a3
{
  v4 = (SAUIAttributionSnippet *)a3;
  v6.receiver = self;
  v6.super_class = (Class)SiriAttributionViewController;
  [(SiriAttributionViewController *)&v6 setAceObject:v4];
  attributionSnippet = self->_attributionSnippet;
  self->_attributionSnippet = v4;
}

- (BOOL)wantsConfirmationInsets
{
  return 0;
}

- (Class)transparentFooterViewClass
{
  return (Class)objc_opt_class();
}

- (void)configureReusableTransparentFooterView:(id)a3
{
  id v4 = a3;
  v5 = [v4 subviews];
  [v5 makeObjectsPerformSelector:"removeFromSuperview"];

  [v4 frame];
  CGFloat v7 = v6;
  double v9 = v8;
  [(SiriAttributionViewController *)self desiredHeightForFooterView];
  double v11 = v10;
  id v12 = objc_alloc((Class)UIButton);
  [v4 bounds];
  v13 = (UIButton *)objc_msgSend(v12, "initWithFrame:");
  attributionButton = self->_attributionButton;
  self->_attributionButton = v13;

  [(UIButton *)self->_attributionButton addTarget:self action:"_punchoutButtonTapped:" forControlEvents:64];
  v15 = [(SAUIAttributionSnippet *)self->_attributionSnippet appPunchOut];
  v16 = [v15 appIcon];

  if (v16)
  {
    v17 = [(SiriAttributionViewController *)self delegate];
    v18 = [v17 persistentDataStoreForSiriViewController:self];

    v19 = [v15 appIcon];
    v20 = [v19 resourceUrl];
    v21 = [v20 absoluteString];

    v22 = [v18 imageForKey:v21];
    if (v22)
    {
      v42.origin.x = 0.0;
      v42.origin.y = v7;
      v42.size.width = v9;
      v42.size.height = v11;
      [(SiriAttributionViewController *)self _configureWithImage:v22 superViewWidth:CGRectGetWidth(v42)];
    }
    else
    {
      v27 = +[SiriUIURLSession sharedURLSession];
      v33 = [v15 appIcon];
      v28 = [v33 resourceUrl];
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_CD6C;
      v34[3] = &unk_185F0;
      id v35 = v18;
      id v36 = v21;
      v37 = self;
      uint64_t v38 = 0;
      CGFloat v39 = v7;
      double v40 = v9;
      double v41 = v11;
      id v29 = [v27 imageTaskWithHTTPGetRequest:v28 client:self completionHandler:v34];
    }
  }
  else
  {
    v23 = self->_attributionButton;
    v24 = [v15 punchOutName];
    [(UIButton *)v23 setTitle:v24 forState:0];

    v25 = [(UIButton *)self->_attributionButton titleLabel];
    v26 = +[UIFont siriui_lightWeightFontWithSize:18.0];
    [v25 setFont:v26];

    v43.origin.x = 0.0;
    v43.origin.y = v7;
    v43.size.width = v9;
    v43.size.height = v11;
    [(SiriAttributionViewController *)self _positionButtonToFitWidth:0 isImage:CGRectGetWidth(v43)];
  }
  [v4 addSubview:self->_attributionButton];
  if ([(SAUIAttributionSnippet *)self->_attributionSnippet showKeyLine])
  {
    v30 = +[SiriUIKeyline keylineWithKeylineType:1];
    objc_msgSend(v30, "sizeThatFits:", v9, v11);
    objc_msgSend(v30, "setFrame:", 0.0, 14.0, v31, v32);
    [v4 addSubview:v30];
  }
}

- (double)desiredHeightForTransparentFooterView
{
  return 38.0;
}

- (void)_configureWithImage:(id)a3 superViewWidth:(double)a4
{
  id v6 = a3;
  id v7 = objc_alloc((Class)UIImageView);
  double v8 = +[UIColor siriui_maskingColor];
  double v9 = [v6 _flatImageWithColor:v8];

  double v10 = (UIImageView *)[v7 initWithImage:v9];
  iconImageView = self->_iconImageView;
  self->_iconImageView = v10;

  [(UIImageView *)self->_iconImageView setContentMode:1];
  id v12 = [(UIButton *)self->_attributionButton superview];
  [v12 insertSubview:self->_iconImageView below:self->_attributionButton];

  [(SiriAttributionViewController *)self _positionButtonToFitWidth:1 isImage:a4];
}

- (CGSize)_imageView:(id)a3 sizeThatFit:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = a3;
  id v7 = v6;
  if (!v6
    || ([v6 image],
        double v8 = objc_claimAutoreleasedReturnValue(),
        [v8 size],
        double v10 = v9,
        double v12 = v11,
        v8,
        v10 == 0.0)
    || v12 == 0.0
    || width == 0.0
    || height == 0.0)
  {
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
  }
  else
  {
    double v13 = v10 / v12;
    if (v10 / v12 <= width / height) {
      double width = height * v13;
    }
    else {
      double height = width / v13;
    }
  }

  double v14 = width;
  double v15 = height;
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (void)_positionButtonToFitWidth:(double)a3 isImage:(BOOL)a4
{
  if (a4)
  {
    -[SiriAttributionViewController _imageView:sizeThatFit:](self, "_imageView:sizeThatFit:", self->_iconImageView, a3, 24.0);
    double v7 = v6;
    double v9 = v8;
    double v10 = 22.0;
  }
  else
  {
    -[UIButton sizeThatFits:](self->_attributionButton, "sizeThatFits:", a3, 24.0);
    double v7 = v11;
    double v9 = v12;
    double v10 = 13.0;
  }
  int IsRTL = SiriLanguageIsRTL();
  double v14 = SiriUIPlatterStyle[32];
  if (!IsRTL) {
    double v14 = a3 - v14 - v7;
  }
  -[UIButton setFrame:](self->_attributionButton, "setFrame:", v14, v10, v7, v9);
  iconImageView = self->_iconImageView;
  if (iconImageView)
  {
    [(UIButton *)self->_attributionButton frame];
    -[UIImageView setFrame:](iconImageView, "setFrame:");
  }
}

- (void)_punchoutButtonTapped:(id)a3
{
  id v4 = [(SiriAttributionViewController *)self delegate];
  v5 = [(SAUIAttributionSnippet *)self->_attributionSnippet appPunchOut];
  double v7 = v5;
  double v6 = +[NSArray arrayWithObjects:&v7 count:1];
  [v4 siriViewController:self performAceCommands:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_attributionButton, 0);

  objc_storeStrong((id *)&self->_attributionSnippet, 0);
}

@end