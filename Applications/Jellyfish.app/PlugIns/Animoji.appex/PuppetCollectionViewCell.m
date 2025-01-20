@interface PuppetCollectionViewCell
+ (UIColor)selectedBorderColor;
+ (double)cellContentPadding;
+ (void)setSelectedBorderColor:(id)a3;
- (AVTCircularButton)imageButton;
- (AdditivelyAnimatableView)borderView;
- (AdditivelyAnimatableView)contentContainerView;
- (BOOL)_shouldAnimateAdditivelyForView:(id)a3 withKeyPath:(id)a4;
- (BOOL)isAnimatingHighlight;
- (CGSize)maxSize;
- (PuppetCollectionViewCell)initWithFrame:(CGRect)a3;
- (UIImageView)puppetImgView;
- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4;
- (id)asyncPuppetThumbnailHandler;
- (id)imageButtonHandlerBlock;
- (id)pendingHighlightBounceAnimation;
- (id)pendingSelectionAnimation;
- (int64_t)thumbRequestId;
- (void)displayHighlight:(BOOL)a3;
- (void)displaySelection:(BOOL)a3;
- (void)layoutSubviews;
- (void)onImageButtonTapped:(id)a3;
- (void)prepareForReuse;
- (void)setBorderView:(id)a3;
- (void)setButtonImageNamed:(id)a3 alpha:(double)a4 maxSize:(CGSize)a5 enabled:(BOOL)a6 touchedHandler:(id)a7;
- (void)setContentContainerView:(id)a3;
- (void)setImageButton:(id)a3;
- (void)setImageButtonHandlerBlock:(id)a3;
- (void)setMaxSize:(CGSize)a3;
- (void)setPendingHighlightBounceAnimation:(id)a3;
- (void)setPendingSelectionAnimation:(id)a3;
- (void)setPuppetImgView:(id)a3;
- (void)setPuppetThumbnail:(id)a3 alpha:(double)a4 maxSize:(CGSize)a5;
- (void)setThumbRequestId:(int64_t)a3;
@end

@implementation PuppetCollectionViewCell

- (PuppetCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v56.receiver = self;
  v56.super_class = (Class)PuppetCollectionViewCell;
  v5 = -[PuppetCollectionViewCell initWithFrame:](&v56, "initWithFrame:", a3.origin.x, a3.origin.y);
  if (v5)
  {
    v6 = -[AdditivelyAnimatableView initWithFrame:]([AdditivelyAnimatableView alloc], "initWithFrame:", 0.0, 0.0, width, height);
    [(PuppetCollectionViewCell *)v5 setContentContainerView:v6];

    v7 = [(PuppetCollectionViewCell *)v5 contentContainerView];
    [v7 setAutoresizingMask:0];

    v8 = [(PuppetCollectionViewCell *)v5 contentView];
    v9 = [(PuppetCollectionViewCell *)v5 contentContainerView];
    [v8 addSubview:v9];

    id v10 = [objc_alloc((Class)UIImageView) initWithFrame:0.0, 0.0, width + -24.0, height + -24.0];
    [(PuppetCollectionViewCell *)v5 setPuppetImgView:v10];

    v11 = [(PuppetCollectionViewCell *)v5 contentContainerView];
    v12 = [(PuppetCollectionViewCell *)v5 puppetImgView];
    [v11 addSubview:v12];

    v13 = [(PuppetCollectionViewCell *)v5 contentView];
    [v13 frame];
    double v15 = v14 * 0.5;
    v16 = [(PuppetCollectionViewCell *)v5 contentView];
    [v16 frame];
    double v18 = v17 * 0.5;
    v19 = [(PuppetCollectionViewCell *)v5 puppetImgView];
    [v19 setCenter:v15, v18];

    v20 = [(PuppetCollectionViewCell *)v5 puppetImgView];
    [v20 setAutoresizingMask:0];

    v21 = [(PuppetCollectionViewCell *)v5 puppetImgView];
    [v21 setHidden:1];

    v22 = [(PuppetCollectionViewCell *)v5 puppetImgView];
    v23 = [v22 layer];
    [v23 setMasksToBounds:1];

    v24 = [(PuppetCollectionViewCell *)v5 puppetImgView];
    v25 = [v24 layer];
    [v25 setCornerRadius:6.0];

    v26 = [(PuppetCollectionViewCell *)v5 puppetImgView];
    v27 = [v26 layer];
    [v27 setCornerCurve:kCACornerCurveContinuous];

    v28 = -[AdditivelyAnimatableView initWithFrame:]([AdditivelyAnimatableView alloc], "initWithFrame:", 0.0, 0.0, width, height);
    [(PuppetCollectionViewCell *)v5 setBorderView:v28];

    v29 = +[UIColor clearColor];
    v30 = [(PuppetCollectionViewCell *)v5 borderView];
    [v30 setBackgroundColor:v29];

    v31 = [(PuppetCollectionViewCell *)v5 contentView];
    v32 = [(PuppetCollectionViewCell *)v5 borderView];
    [v31 addSubview:v32];

    v33 = [(PuppetCollectionViewCell *)v5 contentView];
    [v33 frame];
    double v35 = v34 * 0.5;
    v36 = [(PuppetCollectionViewCell *)v5 contentView];
    [v36 frame];
    double v38 = v37 * 0.5;
    v39 = [(PuppetCollectionViewCell *)v5 borderView];
    [v39 setCenter:v35, v38];

    v40 = [(PuppetCollectionViewCell *)v5 borderView];
    v41 = [v40 layer];
    [v41 setBorderWidth:3.0];

    v42 = [(PuppetCollectionViewCell *)v5 borderView];
    v43 = [v42 layer];
    [v43 setCornerRadius:12.0];

    v44 = [(PuppetCollectionViewCell *)v5 borderView];
    v45 = [v44 layer];
    [v45 setCornerCurve:kCACornerCurveContinuous];

    v46 = [(PuppetCollectionViewCell *)v5 borderView];
    [v46 setAutoresizingMask:18];

    id v47 = [(id)objc_opt_class() selectedBorderColor];
    id v48 = [v47 CGColor];
    v49 = [(PuppetCollectionViewCell *)v5 borderView];
    v50 = [v49 layer];
    [v50 setBorderColor:v48];

    v51 = [(PuppetCollectionViewCell *)v5 borderView];
    [v51 setAlpha:0.0];

    v52 = +[AVTCircularButton buttonWithType:0];
    [v52 addTarget:v5 action:"onImageButtonTapped:" forControlEvents:64];
    v53 = [(PuppetCollectionViewCell *)v5 contentView];
    [v53 addSubview:v52];

    [(PuppetCollectionViewCell *)v5 setImageButton:v52];
    v54 = [(PuppetCollectionViewCell *)v5 imageButton];
    [v54 setHidden:1];

    [(PuppetCollectionViewCell *)v5 setThumbRequestId:-1];
  }
  return v5;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)PuppetCollectionViewCell;
  [(PuppetCollectionViewCell *)&v4 prepareForReuse];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100007530;
  v3[3] = &unk_100034790;
  v3[4] = self;
  +[UIView performWithoutAnimation:v3];
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)PuppetCollectionViewCell;
  [(PuppetCollectionViewCell *)&v18 layoutSubviews];
  v3 = [(PuppetCollectionViewCell *)self puppetImgView];
  [v3 isHidden];

  [(PuppetCollectionViewCell *)self maxSize];
  double v5 = v4;
  v6 = [(PuppetCollectionViewCell *)self contentView];
  [v6 bounds];
  double v7 = CGRectGetWidth(v19) + -24.0;

  if (v5 >= v7) {
    double v5 = v7;
  }
  [(PuppetCollectionViewCell *)self maxSize];
  double v9 = v8;
  id v10 = [(PuppetCollectionViewCell *)self contentView];
  [v10 bounds];
  double v11 = CGRectGetHeight(v20) + -24.0;

  if (v9 >= v11) {
    double v9 = v11;
  }
  v12 = [(PuppetCollectionViewCell *)self contentView];
  [v12 bounds];
  CGFloat v13 = (CGRectGetWidth(v21) - v5) * 0.5;

  double v14 = [(PuppetCollectionViewCell *)self contentView];
  [v14 bounds];
  CGFloat v15 = (CGRectGetHeight(v22) - v9) * 0.5;

  v16 = [(PuppetCollectionViewCell *)self puppetImgView];
  [v16 setFrame:v13, v15, v5, v9];

  double v17 = [(PuppetCollectionViewCell *)self imageButton];
  [v17 setFrame:v13, v15, v5, v9];
}

- (void)setPuppetThumbnail:(id)a3 alpha:(double)a4 maxSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  id v9 = a3;
  id v10 = [(PuppetCollectionViewCell *)self puppetImgView];
  [v10 setAlpha:a4];

  double v11 = [(PuppetCollectionViewCell *)self puppetImgView];
  [v11 setImage:v9];

  v12 = [(PuppetCollectionViewCell *)self puppetImgView];
  [v12 setHidden:0];

  -[PuppetCollectionViewCell setMaxSize:](self, "setMaxSize:", width, height);

  [(PuppetCollectionViewCell *)self setNeedsLayout];
}

- (id)asyncPuppetThumbnailHandler
{
  v3 = (void *)qword_10003EB78++;
  [(PuppetCollectionViewCell *)self setThumbRequestId:v3];
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100007930;
  v6[3] = &unk_100034830;
  objc_copyWeak(v7, &location);
  v7[1] = v3;
  double v4 = objc_retainBlock(v6);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);

  return v4;
}

- (void)setButtonImageNamed:(id)a3 alpha:(double)a4 maxSize:(CGSize)a5 enabled:(BOOL)a6 touchedHandler:(id)a7
{
  BOOL v7 = a6;
  double height = a5.height;
  double width = a5.width;
  id v13 = a7;
  id v14 = a3;
  -[PuppetCollectionViewCell setMaxSize:](self, "setMaxSize:", width, height);
  id v22 = +[UIImageSymbolConfiguration configurationWithTextStyle:UIFontTextStyleLargeTitle scale:1];
  CGFloat v15 = [(PuppetCollectionViewCell *)self imageButton];
  [v15 setSymbolImageWithName:v14 configuration:v22];

  v16 = [(PuppetCollectionViewCell *)self imageButton];
  [v16 setHidden:0];

  double v17 = [(PuppetCollectionViewCell *)self imageButton];
  [v17 setAlpha:a4];

  objc_super v18 = [(PuppetCollectionViewCell *)self imageButton];
  [v18 setEnabled:v7];

  if (v7)
  {
    [(PuppetCollectionViewCell *)self setTintColor:0];
  }
  else
  {
    CGRect v19 = +[UIColor grayColor];
    [(PuppetCollectionViewCell *)self setTintColor:v19];
  }
  [(PuppetCollectionViewCell *)self setImageButtonHandlerBlock:v13];

  CGRect v20 = [(PuppetCollectionViewCell *)self puppetImgView];
  [v20 setImage:0];

  CGRect v21 = [(PuppetCollectionViewCell *)self puppetImgView];
  [v21 setHidden:1];

  [(PuppetCollectionViewCell *)self setNeedsLayout];
}

- (void)onImageButtonTapped:(id)a3
{
  v3 = [(PuppetCollectionViewCell *)self imageButtonHandlerBlock];
  if (v3)
  {
    double v4 = v3;
    v3[2]();
    v3 = v4;
  }
}

- (BOOL)isAnimatingHighlight
{
  v2 = [(PuppetCollectionViewCell *)self contentContainerView];
  v3 = [v2 layer];
  double v4 = [v3 animationForKey:@"transform"];
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)displayHighlight:(BOOL)a3
{
  BOOL v3 = a3;
  memset(&v21, 0, sizeof(v21));
  if (a3)
  {
    CGAffineTransformMakeScale(&v21, 0.95, 0.95);
  }
  else
  {
    long long v5 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v21.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v21.c = v5;
    *(_OWORD *)&v21.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  }
  unsigned int v6 = +[UIView areAnimationsEnabled];
  BOOL v7 = [(PuppetCollectionViewCell *)self contentContainerView];
  double v8 = v7;
  if (v7) {
    [v7 transform];
  }
  else {
    memset(&t2, 0, sizeof(t2));
  }
  CGAffineTransform t1 = v21;
  BOOL v9 = CGAffineTransformEqualToTransform(&t1, &t2);

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100007E3C;
  v18[3] = &unk_100034790;
  v18[4] = self;
  id v10 = objc_retainBlock(v18);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100007F14;
  v15[3] = &unk_1000348A8;
  v15[4] = self;
  CGAffineTransform v17 = v21;
  double v11 = v10;
  id v16 = v11;
  v12 = objc_retainBlock(v15);
  if (!v6)
  {
    +[UIView performWithoutAnimation:v12];
    id v14 = [(PuppetCollectionViewCell *)self contentContainerView];
    [v14 _removeAllAnimations:0];

    goto LABEL_12;
  }
  if (![(PuppetCollectionViewCell *)self isAnimatingHighlight] || v9 || (id v13 = v12, v3))
  {
    ((void (*)(void *))v12[2])(v12);
LABEL_12:
    id v13 = 0;
  }
  [(PuppetCollectionViewCell *)self setPendingHighlightBounceAnimation:v13];
}

- (void)displaySelection:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = (double)a3;
  unsigned int v6 = +[UIView areAnimationsEnabled];
  BOOL v7 = [(PuppetCollectionViewCell *)self borderView];
  [v7 alpha];
  double v9 = v8;

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000081AC;
  v14[3] = &unk_1000348D0;
  v14[4] = self;
  *(double *)&v14[5] = v5;
  id v10 = objc_retainBlock(v14);
  if (!v6)
  {
    +[UIView performWithoutAnimation:v10];
    id v13 = [(PuppetCollectionViewCell *)self borderView];
    [v13 _removeAllAnimations:0];

    goto LABEL_10;
  }
  if (![(PuppetCollectionViewCell *)self isAnimatingHighlight]
    || (v9 != v5 ? (BOOL v11 = !v3) : (BOOL v11 = 1), v12 = v10, v11))
  {
    ((void (*)(void *))v10[2])(v10);
LABEL_10:
    v12 = 0;
  }
  [(PuppetCollectionViewCell *)self setPendingSelectionAnimation:v12];
}

+ (void)setSelectedBorderColor:(id)a3
{
}

+ (UIColor)selectedBorderColor
{
  if (qword_10003EB70)
  {
    id v2 = (id)qword_10003EB70;
  }
  else
  {
    id v2 = +[UIColor colorWithRed:0.78 green:0.78 blue:0.8 alpha:1.0];
  }

  return (UIColor *)v2;
}

+ (double)cellContentPadding
{
  return 8.0;
}

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  return 0;
}

- (BOOL)_shouldAnimateAdditivelyForView:(id)a3 withKeyPath:(id)a4
{
  return 1;
}

- (UIImageView)puppetImgView
{
  return self->_puppetImgView;
}

- (void)setPuppetImgView:(id)a3
{
}

- (AVTCircularButton)imageButton
{
  return self->_imageButton;
}

- (void)setImageButton:(id)a3
{
}

- (AdditivelyAnimatableView)borderView
{
  return self->_borderView;
}

- (void)setBorderView:(id)a3
{
}

- (AdditivelyAnimatableView)contentContainerView
{
  return self->_contentContainerView;
}

- (void)setContentContainerView:(id)a3
{
}

- (CGSize)maxSize
{
  double width = self->_maxSize.width;
  double height = self->_maxSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setMaxSize:(CGSize)a3
{
  self->_maxSize = a3;
}

- (int64_t)thumbRequestId
{
  return self->_thumbRequestId;
}

- (void)setThumbRequestId:(int64_t)a3
{
  self->_thumbRequestId = a3;
}

- (id)imageButtonHandlerBlock
{
  return self->_imageButtonHandlerBlock;
}

- (void)setImageButtonHandlerBlock:(id)a3
{
}

- (id)pendingHighlightBounceAnimation
{
  return self->_pendingHighlightBounceAnimation;
}

- (void)setPendingHighlightBounceAnimation:(id)a3
{
}

- (id)pendingSelectionAnimation
{
  return self->_pendingSelectionAnimation;
}

- (void)setPendingSelectionAnimation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pendingSelectionAnimation, 0);
  objc_storeStrong(&self->_pendingHighlightBounceAnimation, 0);
  objc_storeStrong(&self->_imageButtonHandlerBlock, 0);
  objc_storeStrong((id *)&self->_contentContainerView, 0);
  objc_storeStrong((id *)&self->_borderView, 0);
  objc_storeStrong((id *)&self->_imageButton, 0);

  objc_storeStrong((id *)&self->_puppetImgView, 0);
}

@end