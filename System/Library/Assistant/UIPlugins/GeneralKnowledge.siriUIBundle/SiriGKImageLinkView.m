@interface SiriGKImageLinkView
- (BOOL)isFullWidth;
- (BOOL)isSelectable;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSURL)punchoutURL;
- (SiriGKImageLinkView)initWithImageLinkedAnswer:(id)a3 safariBackURL:(id)a4 isVideoResult:(BOOL)a5 usingPersistentStore:(id)a6;
- (UIImageView)imageView;
- (id)_applyBlurredPlayIconToImage:(id)a3;
- (id)displayName;
- (id)imageResource;
- (id)link;
- (void)_configureWithImage:(id)a3 asVideoResult:(BOOL)a4;
- (void)layoutSubviews;
@end

@implementation SiriGKImageLinkView

- (SiriGKImageLinkView)initWithImageLinkedAnswer:(id)a3 safariBackURL:(id)a4 isVideoResult:(BOOL)a5 usingPersistentStore:(id)a6
{
  LODWORD(v7) = a5;
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v73.receiver = self;
  v73.super_class = (Class)SiriGKImageLinkView;
  v14 = [(SiriGKImageLinkView *)&v73 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_imageLinkedAnswer, a3);
    v15->_isVideoResult = v7;
    v16 = [v11 punchOut];
    v17 = v16;
    if (v16)
    {
      uint64_t v18 = [v16 punchOutUri];
      punchoutURL = v15->_punchoutURL;
      v15->_punchoutURL = (NSURL *)v18;

      if (v12)
      {
        v20 = [v17 punchOutUri];
        v21 = SiriGK_safariPunchoutURL(v20, v12);
        [v17 setPunchOutUri:v21];
      }
      [(SiriGKView *)v15 setCommand:v17];
    }
    v67 = v13;
    -[SiriGKView setEdgeInsets:](v15, "setEdgeInsets:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    id v22 = objc_alloc((Class)UIView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v26 = (UIView *)objc_msgSend(v22, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    backgroundTintView = v15->_backgroundTintView;
    v15->_backgroundTintView = v26;

    v28 = v15->_backgroundTintView;
    v29 = +[UIColor siriui_lightMaskingColor];
    [(UIView *)v28 setBackgroundColor:v29];

    [(SiriGKImageLinkView *)v15 addSubview:v15->_backgroundTintView];
    v30 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    imageView = v15->_imageView;
    v15->_imageView = v30;

    [(UIImageView *)v15->_imageView setContentMode:2];
    [(UIImageView *)v15->_imageView setClipsToBounds:1];
    [(UIImageView *)v15->_imageView setAlpha:0.0];
    [(SiriGKImageLinkView *)v15 addSubview:v15->_imageView];
    uint64_t v7 = v7;
    if (v7)
    {
      id v32 = objc_alloc((Class)UIImageView);
      v33 = +[NSBundle bundleForClass:objc_opt_class()];
      v34 = +[UIImage imageNamed:@"siri_play_symbol" inBundle:v33];
      v35 = (UIImageView *)[v32 initWithImage:v34];
      playIconImageView = v15->_playIconImageView;
      v15->_playIconImageView = v35;

      [(UIImageView *)v15->_playIconImageView setAlpha:0.4];
      v37 = [(UIImageView *)v15->_playIconImageView layer];
      v38 = +[CAFilter filterWithType:kCAFilterPlusD];
      [v37 setCompositingFilter:v38];

      [(SiriGKImageLinkView *)v15 addSubview:v15->_playIconImageView];
    }
    else
    {
      v39 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
      placeholderView = v15->_placeholderView;
      v15->_placeholderView = v39;

      v41 = v15->_placeholderView;
      v42 = +[UIColor clearColor];
      [(UIView *)v41 setBackgroundColor:v42];

      [(SiriGKImageLinkView *)v15 addSubview:v15->_placeholderView];
      id v43 = objc_alloc((Class)UIImageView);
      v44 = +[NSBundle bundleForClass:objc_opt_class()];
      v45 = +[UIImage imageNamed:@"missingPhoto" inBundle:v44];
      v46 = +[UIColor siriui_maskingColor];
      [v45 _flatImageWithColor:v46];
      v48 = id v47 = v12;
      id v49 = [v43 initWithImage:v48];

      id v12 = v47;
      uint64_t v7 = v7;
      [(UIView *)v15->_placeholderView addSubview:v49];
    }
    id v13 = v67;
    v50 = [v11 thumbnails];
    id v51 = [v50 count];

    if (v51)
    {
      v52 = [v11 thumbnails];
      v53 = [v52 firstObject];
      v54 = [v53 resourceUrl];
    }
    else
    {
      v52 = [v11 imageResource];
      v54 = [v52 resourceUrl];
    }

    v55 = [v54 absoluteString];
    v56 = [v67 imageForKey:v55];
    if (v56)
    {
      [(SiriGKImageLinkView *)v15 _configureWithImage:v56 asVideoResult:v7];
    }
    else
    {
      +[SiriUIURLSession sharedURLSession];
      v57 = id v66 = v12;
      -[SiriGKImageLinkView sizeThatFits:](v15, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
      double v59 = v58;
      double v61 = v60;
      v62 = [v11 imageResource];
      v63 = [v62 userAgent];
      v68[0] = _NSConcreteStackBlock;
      v68[1] = 3221225472;
      v68[2] = sub_DE08;
      v68[3] = &unk_18638;
      id v69 = v67;
      id v70 = v55;
      v71 = v15;
      char v72 = v7;
      id v64 = objc_msgSend(v57, "imageTaskWithHTTPGetRequest:client:fitToSize:fillColor:userAgent:completionHandler:", v54, v71, 0, v63, v68, v59, v61);

      id v13 = v67;
      id v12 = v66;
    }
  }

  return v15;
}

- (void)_configureWithImage:(id)a3 asVideoResult:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    [(UIImageView *)self->_imageView setContentMode:1];
    uint64_t v7 = [(SiriGKImageLinkView *)self _applyBlurredPlayIconToImage:v6];

    id v6 = (id)v7;
  }
  [(UIImageView *)self->_imageView setImage:v6];
  imageView = self->_imageView;
  v9 = +[UIColor clearColor];
  [(UIImageView *)imageView setBackgroundColor:v9];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_DFD8;
  v11[3] = &unk_18660;
  v11[4] = self;
  BOOL v12 = v4;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_E098;
  v10[3] = &unk_185D0;
  v10[4] = self;
  +[UIView animateWithDuration:v11 animations:v10 completion:0.2];
}

- (id)_applyBlurredPlayIconToImage:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[NSBundle bundleForClass:objc_opt_class()];
  v5 = +[UIImage imageNamed:@"siri_play_circle" inBundle:v4];

  [v3 size];
  UIGraphicsBeginImageContextWithOptions(v23, 0, 0.0);
  double y = CGPointZero.y;
  [v5 size];
  double v8 = v7;
  double v10 = v9;
  [v3 size];
  double v12 = v11;
  double v14 = v13;
  v15 = +[UIScreen mainScreen];
  [v15 scale];
  double v17 = v16;

  objc_msgSend(v5, "drawAtPoint:", 1.0 / v17 * (CGPointZero.x * v17 + floor((v12 * v17 - v8 * v17) * 0.5)), 1.0 / v17 * (y * v17 + floor((v14 * v17 - v10 * v17) * 0.5)));
  uint64_t v18 = UIGraphicsGetImageFromCurrentImageContext();

  UIGraphicsEndImageContext();
  v19 = +[_UIBackdropViewSettings settingsForPrivateStyle:2020 graphicsQuality:100];
  [v19 setGrayscaleTintMaskImage:v18];
  [v19 setColorTintMaskImage:v18];
  [v19 setFilterMaskImage:v18];
  v20 = [v3 _applyBackdropViewSettings:v19];

  return v20;
}

- (id)imageResource
{
  if (self->_isVideoResult)
  {
    id v2 = 0;
  }
  else
  {
    id v3 = [(SAGKImageLinkedAnswer *)self->_imageLinkedAnswer imageResource];
    id v2 = [v3 copy];
  }

  return v2;
}

- (id)link
{
  return [(SAGKImageLinkedAnswer *)self->_imageLinkedAnswer link];
}

- (id)displayName
{
  return [(SAGKImageLinkedAnswer *)self->_imageLinkedAnswer name];
}

- (BOOL)isSelectable
{
  return 1;
}

- (BOOL)isFullWidth
{
  return 0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  int v3 = SiriUIIsWhitePlatterSnippetBackgroundEnabledForAllSnippets();
  int IsPad = SiriUIDeviceIsPad();
  int v5 = SiriUIIsCompactWidth();
  int v6 = v5;
  if (IsPad)
  {
    double v7 = 90.0;
    if (v5) {
      double v7 = 84.0;
    }
  }
  else
  {
    if (v3) {
      double v8 = (344.0 - (SiriUIDefaultSnippetViewInsets[1] + SiriUIDefaultSnippetViewInsets[3])) / 3.0;
    }
    else {
      double v8 = 114.666667;
    }
    char v9 = SiriUIIsLargePhoneLayout();
    if (v6) {
      double v7 = v8;
    }
    else {
      double v7 = 90.0;
    }
    if (v6)
    {
      if ((v9 & 1) == 0)
      {
        int IsSmallPhone = SiriUIDeviceIsSmallPhone();
        double v7 = 84.0;
        if (!IsSmallPhone) {
          double v7 = 90.0;
        }
      }
    }
  }
  double v11 = v7;
  result.double height = v11;
  result.double width = v7;
  return result;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)SiriGKImageLinkView;
  [(SiriGKImageLinkView *)&v13 layoutSubviews];
  double y = CGPointZero.y;
  -[SiriGKImageLinkView sizeThatFits:](self, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
  double v5 = v4;
  double v7 = v6;
  -[UIView setFrame:](self->_backgroundTintView, "setFrame:", CGPointZero.x, y, v4, v6);
  -[UIView setFrame:](self->_placeholderView, "setFrame:", CGPointZero.x, y, v5, v7);
  double v8 = [(UIView *)self->_placeholderView subviews];
  char v9 = [v8 firstObject];

  [v9 frame];
  [(UIView *)self->_placeholderView frame];
  UIRectCenteredIntegralRectScale();
  [v9 setFrame:0];
  -[UIImageView setFrame:](self->_imageView, "setFrame:", CGPointZero.x, y, v5, v7);
  playIconImageView = self->_playIconImageView;
  if (playIconImageView)
  {
    [(UIImageView *)playIconImageView frame];
    -[UIImageView setFrame:](self->_playIconImageView, "setFrame:", CGPointZero.x + floor((v5 - v11) * 0.5), y + floor((v7 - v12) * 0.5));
  }
}

- (NSURL)punchoutURL
{
  return self->_punchoutURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_punchoutURL, 0);
  objc_storeStrong((id *)&self->_imageLinkedAnswer, 0);
  objc_storeStrong((id *)&self->_placeholderView, 0);
  objc_storeStrong((id *)&self->_backgroundTintView, 0);
  objc_storeStrong((id *)&self->_playIconImageView, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end