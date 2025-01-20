@interface SiriGKImageDetailView
- (CGSize)_displayedImageSizeForImageSize:(CGSize)result inWidth:(double)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SiriGKImageDetailView)initWithAceImageView:(id)a3 expectedWidth:(double)a4;
- (SiriGKImageDetailViewDelegate)delegate;
- (UIImage)displayedImage;
- (id)_titleLabelAttributes;
- (id)_urlLabelAttributes;
- (void)_imageButtonTapped;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
@end

@implementation SiriGKImageDetailView

- (SiriGKImageDetailView)initWithAceImageView:(id)a3 expectedWidth:(double)a4
{
  id v6 = a3;
  v57.receiver = self;
  v57.super_class = (Class)SiriGKImageDetailView;
  v7 = [(SiriGKImageDetailView *)&v57 init];
  if (v7)
  {
    uint64_t v8 = [v6 image];
    imageResource = v7->_imageResource;
    v7->_imageResource = (SAUIImageResource *)v8;

    v10 = (UIStackView *)objc_alloc_init((Class)UIStackView);
    stackView = v7->_stackView;
    v7->_stackView = v10;

    [(UIStackView *)v7->_stackView setAxis:1];
    [(UIStackView *)v7->_stackView setSpacing:8.0];
    [(UIStackView *)v7->_stackView setDistribution:0];
    id v12 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v7 action:"_imageButtonTapped"];
    [(UIStackView *)v7->_stackView setUserInteractionEnabled:1];
    v49 = v12;
    [(UIStackView *)v7->_stackView addGestureRecognizer:v12];
    id v48 = objc_alloc_init((Class)UIView);
    -[UIStackView addArrangedSubview:](v7->_stackView, "addArrangedSubview:");
    v13 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    imageView = v7->_imageView;
    v7->_imageView = v13;

    v15 = v7->_imageView;
    v16 = +[UIColor clearColor];
    [(UIImageView *)v15 setBackgroundColor:v16];

    [(UIImageView *)v7->_imageView setContentMode:1];
    [(UIStackView *)v7->_stackView addArrangedSubview:v7->_imageView];
    id v50 = v6;
    v17 = [v6 commands];
    v18 = [v17 firstObject];

    v51 = v18;
    v19 = [v18 subtitle];
    v20 = v19;
    if ([v19 length])
    {
      id v21 = objc_alloc_init((Class)UILabel);
      v22 = +[UIColor clearColor];
      [v21 setBackgroundColor:v22];

      id v23 = objc_alloc((Class)NSAttributedString);
      v24 = [(SiriGKImageDetailView *)v7 _titleLabelAttributes];
      id v25 = [v23 initWithString:v20 attributes:v24];
      [v21 setAttributedText:v25];

      v19 = v20;
      [v21 setLineBreakMode:4];
      [v21 setTextAlignment:1];
      [(UIStackView *)v7->_stackView addArrangedSubview:v21];
    }
    v26 = [v51 punchOutUri];
    v27 = [v26 host];

    if ([v27 length])
    {
      id v28 = objc_alloc_init((Class)UILabel);
      v29 = +[UIColor clearColor];
      [v28 setBackgroundColor:v29];

      id v30 = objc_alloc((Class)NSAttributedString);
      v31 = [(SiriGKImageDetailView *)v7 _urlLabelAttributes];
      id v32 = [v30 initWithString:v27 attributes:v31];
      [v28 setAttributedText:v32];

      v19 = v20;
      [v28 setLineBreakMode:4];
      [v28 setTextAlignment:1];
      [(UIStackView *)v7->_stackView addArrangedSubview:v28];
    }
    id v33 = objc_alloc_init((Class)UIView);
    [(UIStackView *)v7->_stackView addArrangedSubview:v33];
    v34 = [(SAUIImageResource *)v7->_imageResource resourceUrl];
    if (v34)
    {
      v55[0] = 0;
      v55[1] = v55;
      v55[2] = 0x2020000000;
      char v56 = 0;
      objc_initWeak(&location, v7);
      v35 = +[SiriUIURLSession sharedURLSession];
      [(SAUIImageResource *)v7->_imageResource pixelWidth];
      double v37 = v36;
      [(SAUIImageResource *)v7->_imageResource pixelHeight];
      -[SiriGKImageDetailView _displayedImageSizeForImageSize:inWidth:](v7, "_displayedImageSizeForImageSize:inWidth:", v37, v38, a4);
      double v40 = v39;
      double v42 = v41;
      v52[0] = _NSConcreteStackBlock;
      v52[1] = 3221225472;
      v52[2] = sub_9520;
      v52[3] = &unk_18558;
      objc_copyWeak(&v53, &location);
      v52[4] = v55;
      v43 = [(SAUIImageResource *)v7->_imageResource userAgent];
      id v44 = objc_msgSend(v35, "imageTaskWithHTTPGetRequest:client:fitToSize:incremental:progressHandler:fillColor:userAgent:", v34, v7, 1, v52, 0, v43, v40, v42);

      objc_destroyWeak(&v53);
      objc_destroyWeak(&location);
      _Block_object_dispose(v55, 8);
      v19 = v20;
    }
    v45 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:101];
    activityIndicator = v7->_activityIndicator;
    v7->_activityIndicator = v45;

    [(UIActivityIndicatorView *)v7->_activityIndicator startAnimating];
    [(SiriGKImageDetailView *)v7 addSubview:v7->_stackView];
    [(SiriGKImageDetailView *)v7 addSubview:v7->_activityIndicator];

    id v6 = v50;
  }

  return v7;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)SiriGKImageDetailView;
  [(SiriGKImageDetailView *)&v5 layoutSubviews];
  stackView = self->_stackView;
  [(SiriGKImageDetailView *)self bounds];
  -[UIStackView setFrame:](stackView, "setFrame:");
  activityIndicator = self->_activityIndicator;
  [(SiriGKImageDetailView *)self bounds];
  -[UIActivityIndicatorView setFrame:](activityIndicator, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  [(SAUIImageResource *)self->_imageResource pixelHeight];
  double v5 = v4;
  id v6 = +[UIScreen mainScreen];
  [v6 scale];
  double v8 = v5 / v7;

  v9 = +[UIScreen mainScreen];
  [v9 bounds];
  double v10 = CGRectGetHeight(v14) * 0.5;

  if (v8 >= v10) {
    double v11 = v10;
  }
  else {
    double v11 = v8;
  }
  double v12 = width;
  result.height = v11;
  result.CGFloat width = v12;
  return result;
}

- (void)_imageButtonTapped
{
  id v3 = [(SiriGKImageDetailView *)self delegate];
  [v3 siriGeneralKnowledgeImageDetailViewImageTapped:self];
}

- (id)_titleLabelAttributes
{
  v6[0] = NSFontAttributeName;
  v2 = +[UIFont siriui_mediumWeightFontWithSize:15.0];
  v7[0] = v2;
  v6[1] = NSForegroundColorAttributeName;
  id v3 = +[UIColor labelColor];
  v7[1] = v3;
  double v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (id)_urlLabelAttributes
{
  v6[0] = NSFontAttributeName;
  v2 = +[UIFont siriui_lightWeightFontWithSize:13.0];
  v7[0] = v2;
  v6[1] = NSForegroundColorAttributeName;
  id v3 = +[UIColor labelColor];
  v7[1] = v3;
  double v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (CGSize)_displayedImageSizeForImageSize:(CGSize)result inWidth:(double)a4
{
  double v4 = result.height * (a4 / result.width);
  double v5 = fmax(result.height, 160.0);
  if (a4 / result.width < 1.0)
  {
    double v5 = v4;
    result.CGFloat width = a4;
  }
  result.height = v5;
  return result;
}

- (UIImage)displayedImage
{
  return [(UIImageView *)self->_imageView image];
}

- (SiriGKImageDetailViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SiriGKImageDetailViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);

  objc_storeStrong((id *)&self->_imageResource, 0);
}

@end