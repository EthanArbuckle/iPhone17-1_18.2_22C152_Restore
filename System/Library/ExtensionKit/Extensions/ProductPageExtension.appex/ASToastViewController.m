@interface ASToastViewController
+ (id)_fontWithSize:(double)a3 textStyleAttribute:(__CFString *)a4;
+ (id)_primaryLabelFont;
+ (id)_secondaryLabelFont;
- (ASToastPresentationWindow)presentationWindow;
- (ASToastViewController)initWithTitle:(id)a3 message:(id)a4 duration:(double)a5 image:(id)a6;
- (NSString)message;
- (UIImage)image;
- (UIImageView)imageView;
- (UILabel)primaryLabel;
- (UILabel)secondaryLabel;
- (UIVisualEffectView)toastView;
- (double)duration;
- (void)_dismissAfterDelay:(double)a3;
- (void)present;
- (void)setDuration:(double)a3;
- (void)setImage:(id)a3;
- (void)setImageView:(id)a3;
- (void)setMessage:(id)a3;
- (void)setPresentationWindow:(id)a3;
- (void)setPrimaryLabel:(id)a3;
- (void)setSecondaryLabel:(id)a3;
- (void)setToastView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ASToastViewController

- (ASToastViewController)initWithTitle:(id)a3 message:(id)a4 duration:(double)a5 image:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v28.receiver = self;
  v28.super_class = (Class)ASToastViewController;
  v13 = [(ASToastViewController *)&v28 initWithNibName:0 bundle:0];
  if (v13)
  {
    id v14 = objc_alloc((Class)UILabel);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v18 = (UILabel *)objc_msgSend(v14, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    primaryLabel = v13->_primaryLabel;
    v13->_primaryLabel = v18;

    v20 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    secondaryLabel = v13->_secondaryLabel;
    v13->_secondaryLabel = v20;

    v22 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    imageView = v13->_imageView;
    v13->_imageView = v22;

    v24 = +[UIBlurEffect effectWithStyle:9];
    v25 = (UIVisualEffectView *)[objc_alloc((Class)UIVisualEffectView) initWithEffect:v24];
    [(UIVisualEffectView *)v25 setClipsToBounds:1];
    [(UIVisualEffectView *)v25 _setContinuousCornerRadius:9.0];
    toastView = v13->_toastView;
    v13->_toastView = v25;

    [(ASToastViewController *)v13 setTitle:v10];
    [(ASToastViewController *)v13 setMessage:v11];
    [(ASToastViewController *)v13 setImage:v12];
    [(ASToastViewController *)v13 setDuration:a5];
    [(ASToastViewController *)v13 setModalPresentationStyle:6];
  }
  return v13;
}

- (void)viewDidLoad
{
  v43.receiver = self;
  v43.super_class = (Class)ASToastViewController;
  [(ASToastViewController *)&v43 viewDidLoad];
  v3 = [(ASToastViewController *)self presentationController];
  [v3 _setContainerIgnoresDirectTouchEvents:1];

  v4 = [(ASToastViewController *)self view];
  [v4 setUserInteractionEnabled:0];

  v5 = [(ASToastViewController *)self image];
  v6 = [(ASToastViewController *)self imageView];
  [v6 setImage:v5];

  v7 = [(ASToastViewController *)self imageView];
  [v7 setAlpha:0.64];

  v8 = +[UIColor labelColor];
  v9 = [(ASToastViewController *)self imageView];
  [v9 setTintColor:v8];

  id v10 = [(ASToastViewController *)self imageView];
  [v10 setContentMode:2];

  id v11 = [(ASToastViewController *)self title];
  id v12 = [(ASToastViewController *)self primaryLabel];
  [v12 setText:v11];

  v13 = [(ASToastViewController *)self primaryLabel];
  [v13 setTextAlignment:1];

  id v14 = [(ASToastViewController *)self primaryLabel];
  [v14 setNumberOfLines:2];

  v15 = +[UIColor secondaryLabelColor];
  v16 = [(ASToastViewController *)self primaryLabel];
  [v16 setTextColor:v15];

  v17 = [(ASToastViewController *)self primaryLabel];
  [v17 setLineBreakMode:4];

  id v18 = [(ASToastViewController *)self message];

  if (v18)
  {
    id v19 = objc_alloc((Class)NSMutableAttributedString);
    v20 = [(ASToastViewController *)self message];
    id v18 = [v19 initWithString:v20];
  }
  id v21 = objc_alloc_init((Class)NSMutableParagraphStyle);
  [v21 setLineSpacing:2.0];
  objc_msgSend(v18, "addAttribute:value:range:", NSParagraphStyleAttributeName, v21, 0, objc_msgSend(v18, "length"));
  v22 = [(ASToastViewController *)self secondaryLabel];
  [v22 setAttributedText:v18];

  v23 = [(ASToastViewController *)self secondaryLabel];
  [v23 setTextAlignment:1];

  v24 = [(ASToastViewController *)self secondaryLabel];
  [v24 setNumberOfLines:4];

  v25 = +[UIColor secondaryLabelColor];
  v26 = [(ASToastViewController *)self secondaryLabel];
  [v26 setTextColor:v25];

  v27 = [(ASToastViewController *)self secondaryLabel];
  [v27 setLineBreakMode:4];

  objc_super v28 = [(ASToastViewController *)self toastView];
  v29 = [v28 contentView];
  v30 = [(ASToastViewController *)self imageView];
  [v29 addSubview:v30];

  v31 = [(ASToastViewController *)self toastView];
  v32 = [v31 contentView];
  v33 = [(ASToastViewController *)self primaryLabel];
  [v32 addSubview:v33];

  v34 = [(ASToastViewController *)self toastView];
  v35 = [v34 contentView];
  v36 = [(ASToastViewController *)self secondaryLabel];
  [v35 addSubview:v36];

  CGAffineTransformMakeScale(&v42, 0.88, 0.88);
  v37 = [(ASToastViewController *)self toastView];
  CGAffineTransform v41 = v42;
  [v37 setTransform:&v41];

  v38 = [(ASToastViewController *)self toastView];
  [v38 setAlpha:0.0];

  v39 = [(ASToastViewController *)self view];
  v40 = [(ASToastViewController *)self toastView];
  [v39 addSubview:v40];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ASToastViewController;
  [(ASToastViewController *)&v5 viewWillAppear:a3];
  v4 = [(ASToastViewController *)self presentationController];
  [v4 _setContainerIgnoresDirectTouchEvents:1];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ASToastViewController;
  [(ASToastViewController *)&v6 viewDidAppear:a3];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100009B78;
  v5[3] = &unk_100887710;
  v5[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100009BF8;
  v4[3] = &unk_100887738;
  v4[4] = self;
  +[UIView animateWithDuration:2 delay:v5 options:v4 animations:0.2 completion:0.0];
}

- (void)viewDidLayoutSubviews
{
  v65.receiver = self;
  v65.super_class = (Class)ASToastViewController;
  [(ASToastViewController *)&v65 viewDidLayoutSubviews];
  v3 = [(ASToastViewController *)self view];
  [v3 bounds];

  v4 = [(ASToastViewController *)self traitCollection];
  [v4 displayScale];
  uint64_t v6 = v5;

  v7 = [(ASToastViewController *)self toastView];
  objc_msgSend(v7, "setFrame:", 0.0, 0.0, 250.0, 450.0);

  uint64_t v59 = 0;
  v60 = (double *)&v59;
  uint64_t v61 = 0x4010000000;
  v62 = &unk_1007CC82B;
  long long v63 = 0u;
  long long v64 = 0u;
  v8 = [(ASToastViewController *)self toastView];
  [v8 bounds];
  *(double *)&long long v63 = v9 + 25.0;
  *((double *)&v63 + 1) = v10 + 40.0;
  *(double *)&long long v64 = v11 + -50.0;
  *((double *)&v64 + 1) = v12 + -65.0;

  v13 = [(ASToastViewController *)self toastView];
  [v13 bounds];
  UIRectCenteredXInRectScale();
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  v22 = [(ASToastViewController *)self imageView];
  objc_msgSend(v22, "setFrame:", v15, v17, v19, v21);

  v23 = v60;
  v60[5] = v21 + v60[5];
  v23[7] = v23[7] - v21;
  uint64_t v55 = 0;
  v56 = (double *)&v55;
  uint64_t v57 = 0x2020000000;
  uint64_t v58 = 0;
  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x2020000000;
  v54[3] = 0;
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_10000A0FC;
  v53[3] = &unk_100887760;
  v53[4] = &v59;
  v53[5] = v54;
  v53[6] = &v55;
  v24 = objc_retainBlock(v53);
  v25 = [(id)objc_opt_class() _primaryLabelFont];
  v26 = [(ASToastViewController *)self primaryLabel];
  [v26 setFont:v25];

  v27 = [(ASToastViewController *)self primaryLabel];
  ((void (*)(void *, void *, void, double))v24[2])(v24, v27, 0, 18.0);

  objc_super v28 = [(id)objc_opt_class() _secondaryLabelFont];
  v29 = [(ASToastViewController *)self secondaryLabel];
  [v29 setFont:v28];

  v30 = [(ASToastViewController *)self secondaryLabel];
  ((void (*)(void *, void *, void, double))v24[2])(v24, v30, 0, 25.5);

  v31 = [(ASToastViewController *)self toastView];
  [v31 bounds];
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;

  double v38 = v56[3];
  v39 = [(ASToastViewController *)self toastView];
  v40 = v39;
  double v41 = fmin(v38 + 25.0, 450.0);
  if (v41 < 250.0) {
    double v41 = 250.0;
  }
  float v42 = v41;
  objc_msgSend(v39, "setBounds:", v33, v35, v37, ceilf(v42));

  objc_super v43 = [(ASToastViewController *)self toastView];
  [v43 frame];
  UIRectCenteredXInRectScale();

  UIRectCenteredYInRectScale();
  double v45 = v44;
  double v47 = v46;
  double v49 = v48;
  double v51 = v50;
  v52 = [(ASToastViewController *)self toastView];
  objc_msgSend(v52, "setFrame:", v45, v47, v49, v51);

  _Block_object_dispose(v54, 8);
  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v59, 8);
}

- (void)present
{
  v3 = objc_alloc_init(ASToastPresentationWindow);
  [(ASToastViewController *)self setPresentationWindow:v3];
  [(ASToastPresentationWindow *)v3 setHidden:0];
  [(ASToastPresentationWindow *)v3 setUserInteractionEnabled:0];
  [(ASToastPresentationWindow *)v3 presentViewController:self animated:0 completion:0];
}

- (void)_dismissAfterDelay:(double)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000A404;
  v4[3] = &unk_100887710;
  v4[4] = self;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000A4E4;
  v3[3] = &unk_100887738;
  v3[4] = self;
  +[UIView animateWithDuration:2 delay:v4 options:v3 animations:0.2 completion:a3];
}

+ (id)_primaryLabelFont
{
  v2 = (void *)qword_100973B98;
  if (!qword_100973B98)
  {
    uint64_t v3 = [a1 _fontWithSize:kCTFontDescriptorTextStyleSemibold textStyleAttribute:22.0];
    v4 = (void *)qword_100973B98;
    qword_100973B98 = v3;

    v2 = (void *)qword_100973B98;
  }

  return v2;
}

+ (id)_secondaryLabelFont
{
  v2 = (void *)qword_100973BA0;
  if (!qword_100973BA0)
  {
    uint64_t v3 = [a1 _fontWithSize:kCTFontDescriptorTextStyleRegular textStyleAttribute:16.0];
    v4 = (void *)qword_100973BA0;
    qword_100973BA0 = v3;

    v2 = (void *)qword_100973BA0;
  }

  return v2;
}

+ (id)_fontWithSize:(double)a3 textStyleAttribute:(__CFString *)a4
{
  uint64_t v5 = +[UIFont systemFontOfSize:a3];
  uint64_t v6 = [v5 fontDescriptor];
  UIFontDescriptorAttributeName v11 = UIFontDescriptorTextStyleAttribute;
  double v12 = a4;
  v7 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  v8 = [v6 fontDescriptorByAddingAttributes:v7];
  double v9 = +[UIFont fontWithDescriptor:v8 size:0.0];

  return v9;
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (ASToastPresentationWindow)presentationWindow
{
  return self->_presentationWindow;
}

- (void)setPresentationWindow:(id)a3
{
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

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UIVisualEffectView)toastView
{
  return self->_toastView;
}

- (void)setToastView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toastView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_presentationWindow, 0);
  objc_storeStrong((id *)&self->_image, 0);

  objc_storeStrong((id *)&self->_message, 0);
}

@end