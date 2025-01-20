@interface HWPreviewBubbleView
- (CGSize)intrinsicContentSize;
- (DKInkView)inkView;
- (HWPreviewBubbleView)initWithCoder:(id)a3;
- (HWPreviewBubbleView)initWithFrame:(CGRect)a3;
- (UIImageView)imageView;
- (id)updateImage;
- (int64_t)lastPointCount;
- (void)_commonInit;
- (void)_updateCoronaColors;
- (void)inkViewDidRender:(id)a3;
- (void)setImageView:(id)a3;
- (void)setInkView:(id)a3;
- (void)setLastPointCount:(int64_t)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updatePreview;
- (void)updateVisibility;
@end

@implementation HWPreviewBubbleView

- (HWPreviewBubbleView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HWPreviewBubbleView;
  v3 = -[HWPreviewBubbleView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(HWPreviewBubbleView *)v3 _commonInit];
  }
  return v4;
}

- (HWPreviewBubbleView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HWPreviewBubbleView;
  v3 = [(HWPreviewBubbleView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(HWPreviewBubbleView *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  [(HWPreviewBubbleView *)self updateVisibility];
  v3 = +[UIColor favoritesPickerItemBackgroundColor];
  [(HWPreviewBubbleView *)self setBackgroundColor:v3];

  id v4 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(HWPreviewBubbleView *)self setImageView:v4];

  v5 = [(HWPreviewBubbleView *)self imageView];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  objc_super v6 = [(HWPreviewBubbleView *)self imageView];
  [v6 setContentMode:4];

  LODWORD(v7) = 1144750080;
  [(HWPreviewBubbleView *)self setContentHuggingPriority:1 forAxis:v7];
  v8 = [(HWPreviewBubbleView *)self imageView];
  [(HWPreviewBubbleView *)self addSubview:v8];

  _NSDictionaryOfVariableBindings(@"_imageView, margin", self->_imageView, &off_29BF8, 0);
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  v9 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-(margin)-[_imageView]-(margin)-|", 0, v19, v19);
  +[NSLayoutConstraint activateConstraints:v9];

  v10 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-(margin)-[_imageView]-(margin)-|", 0, v19, v19);
  +[NSLayoutConstraint activateConstraints:v10];

  id v11 = +[UIColor favoritesPickerItemBorderColor];
  id v12 = [v11 CGColor];
  v13 = [(HWPreviewBubbleView *)self layer];
  [v13 setBorderColor:v12];

  v14 = +[UIScreen mainScreen];
  [v14 scale];
  double v16 = 1.0 / v15;
  v17 = [(HWPreviewBubbleView *)self layer];
  [v17 setBorderWidth:v16];

  v18 = [(HWPreviewBubbleView *)self layer];
  [v18 setCornerRadius:5.0];

  [(HWPreviewBubbleView *)self setClipsToBounds:1];
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HWPreviewBubbleView;
  id v4 = a3;
  [(HWPreviewBubbleView *)&v8 traitCollectionDidChange:v4];
  v5 = [(HWPreviewBubbleView *)self traitCollection];
  id v6 = [v5 userInterfaceStyle];
  id v7 = [v4 userInterfaceStyle];

  if (v6 != v7) {
    [(HWPreviewBubbleView *)self _updateCoronaColors];
  }
}

- (void)_updateCoronaColors
{
  id v5 = +[UIColor favoritesPickerItemBorderColor];
  id v3 = [v5 CGColor];
  id v4 = [(HWPreviewBubbleView *)self layer];
  [v4 setBorderColor:v3];
}

- (CGSize)intrinsicContentSize
{
  double v2 = 37.0;
  double v3 = 37.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)updateImage
{
  double v3 = [(HWPreviewBubbleView *)self inkView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  id v12 = [v3 currentDrawing];
  id v13 = [v12 totalPoints];

  if ([v3 canvasHasInk])
  {
    if (self->_lastPointCount == v13)
    {
      v14 = [(UIImageView *)self->_imageView image];
    }
    else
    {
      double v15 = [v3 snapshotRendererState];
      [(UIImageView *)self->_imageView bounds];
      double Height = CGRectGetHeight(v40);
      [v3 bounds];
      CGFloat v17 = Height / CGRectGetHeight(v41);
      v18 = [v3 currentDrawing];
      CGAffineTransformMakeScale(&v37, v17, v17);
      v42.origin.x = v5;
      v42.origin.y = v7;
      v42.size.double width = v9;
      v42.size.height = v11;
      CGRect v43 = CGRectApplyAffineTransform(v42, &v37);
      double width = v43.size.width;
      double v20 = v43.size.height;
      objc_msgSend(v18, "strokesFrame", v43.origin.x, v43.origin.y);
      CGFloat v22 = v21;
      CGFloat v24 = v23;
      CGFloat v26 = v25;
      CGFloat v28 = v27;
      CGAffineTransformMakeScale(&v36, v17, v17);
      v44.origin.x = v22;
      v44.origin.y = v24;
      v44.size.double width = v26;
      v44.size.height = v28;
      CGRect v45 = CGRectApplyAffineTransform(v44, &v36);
      CGFloat v29 = -v45.origin.x;
      CGFloat v30 = ceil(CGRectGetWidth(v45));
      [(UIImageView *)self->_imageView bounds];
      CGFloat v31 = CGRectGetHeight(v46);
      v39.double width = v30;
      v39.height = v31;
      UIGraphicsBeginImageContextWithOptions(v39, 1, 0.0);
      CurrentContext = UIGraphicsGetCurrentContext();
      id v33 = +[UIColor drawingCanvasBackgroundColor];
      CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v33 CGColor]);

      v47.origin.x = 0.0;
      v47.origin.y = 0.0;
      v47.size.double width = v30;
      v47.size.height = v31;
      CGContextFillRect(CurrentContext, v47);
      CGContextSaveGState(CurrentContext);
      CGContextSetInterpolationQuality(CurrentContext, kCGInterpolationHigh);
      objc_msgSend(v15, "drawInRect:", v29, 0.0, width, v20);
      CGContextRestoreGState(CurrentContext);
      v14 = UIGraphicsGetImageFromCurrentImageContext();
      UIGraphicsEndImageContext();
      self->_lastPointCount = (int64_t)v13;
    }
  }
  else
  {
    v14 = 0;
  }
  v34 = [(HWPreviewBubbleView *)self imageView];
  [v34 setImage:v14];

  return v14;
}

- (void)setInkView:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inkView);

  CGFloat v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_inkView, obj);
    [(HWPreviewBubbleView *)self setNeedsDisplay];
    CGFloat v5 = obj;
  }
}

- (void)updatePreview
{
  [(HWPreviewBubbleView *)self updateVisibility];
  id v3 = [(HWPreviewBubbleView *)self updateImage];
}

- (void)updateVisibility
{
  id v3 = [(HWPreviewBubbleView *)self inkView];
  -[HWPreviewBubbleView setHidden:](self, "setHidden:", [v3 canvasHasInk] ^ 1);
}

- (void)inkViewDidRender:(id)a3
{
}

- (DKInkView)inkView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inkView);

  return (DKInkView *)WeakRetained;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (int64_t)lastPointCount
{
  return self->_lastPointCount;
}

- (void)setLastPointCount:(int64_t)a3
{
  self->_lastPointCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);

  objc_destroyWeak((id *)&self->_inkView);
}

@end