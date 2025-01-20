@interface AXCloudShadowView
- (AXCloudShadowView)initWithFrame:(CGRect)a3;
- (id)resizableShadowImage;
- (void)layoutSubviews;
@end

@implementation AXCloudShadowView

- (AXCloudShadowView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AXCloudShadowView;
  v3 = -[AXCloudShadowView initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = [(AXCloudShadowView *)v3 resizableShadowImage];
  v5 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v4];
  imageView = v3->_imageView;
  v3->_imageView = v5;

  [(AXCloudShadowView *)v3 addSubview:v3->_imageView];
  return v3;
}

- (void)layoutSubviews
{
  [(AXCloudShadowView *)self bounds];
  imageView = self->_imageView;

  -[UIImageView setFrame:](imageView, "setFrame:");
}

- (id)resizableShadowImage
{
  v2 = +[UIScreen mainScreen];
  [v2 scale];
  CGFloat v4 = v3;
  v32.CGFloat width = 39.0;
  v32.CGFloat height = 39.0;
  UIGraphicsBeginImageContextWithOptions(v32, 0, v4);

  CurrentContext = UIGraphicsGetCurrentContext();
  Mutable = CGPathCreateMutable();
  v34.origin.CGFloat x = 0.0;
  v34.origin.CGFloat y = 0.0;
  v34.size.CGFloat width = 39.0;
  v34.size.CGFloat height = 39.0;
  CGRect v35 = CGRectInset(v34, 0.0, 0.0);
  CGFloat x = v35.origin.x;
  CGFloat y = v35.origin.y;
  CGFloat width = v35.size.width;
  CGFloat height = v35.size.height;
  CGPathMoveToPoint(Mutable, 0, v35.origin.x, 0.0);
  v36.origin.CGFloat x = x;
  v36.origin.CGFloat y = y;
  v36.size.CGFloat width = width;
  v36.size.CGFloat height = height;
  CGFloat MaxX = CGRectGetMaxX(v36);
  CGPathAddLineToPoint(Mutable, 0, MaxX, 0.0);
  v37.origin.CGFloat x = 0.0;
  v37.origin.CGFloat y = 0.0;
  v37.size.CGFloat width = 39.0;
  v37.size.CGFloat height = 39.0;
  CGFloat v12 = CGRectGetMaxX(v37);
  v38.origin.CGFloat x = 0.0;
  v38.origin.CGFloat y = 0.0;
  v38.size.CGFloat width = 39.0;
  v38.size.CGFloat height = 39.0;
  CGFloat v13 = CGRectGetMaxX(v38);
  CGPathAddArcToPoint(Mutable, 0, v12, 0.0, v13, y, 0.0);
  v39.origin.CGFloat x = 0.0;
  v39.origin.CGFloat y = 0.0;
  v39.size.CGFloat width = 39.0;
  v39.size.CGFloat height = 39.0;
  CGFloat v14 = CGRectGetMaxX(v39);
  v40.origin.CGFloat x = 0.0;
  v40.origin.CGFloat y = 0.0;
  v40.size.CGFloat width = 39.0;
  v40.size.CGFloat height = 39.0;
  CGFloat MaxY = CGRectGetMaxY(v40);
  CGPathAddLineToPoint(Mutable, 0, v14, MaxY);
  v41.origin.CGFloat x = 0.0;
  v41.origin.CGFloat y = 0.0;
  v41.size.CGFloat width = 39.0;
  v41.size.CGFloat height = 39.0;
  CGFloat v16 = CGRectGetMaxX(v41);
  v42.origin.CGFloat x = 0.0;
  v42.origin.CGFloat y = 0.0;
  v42.size.CGFloat width = 39.0;
  v42.size.CGFloat height = 39.0;
  CGFloat v17 = CGRectGetMaxY(v42);
  v43.origin.CGFloat x = x;
  v43.origin.CGFloat y = y;
  v43.size.CGFloat width = width;
  v43.size.CGFloat height = height;
  CGFloat v18 = CGRectGetMaxX(v43);
  v44.origin.CGFloat x = 0.0;
  v44.origin.CGFloat y = 0.0;
  v44.size.CGFloat width = 39.0;
  v44.size.CGFloat height = 39.0;
  CGFloat v19 = CGRectGetMaxY(v44);
  CGPathAddArcToPoint(Mutable, 0, v16, v17, v18, v19, 0.0);
  v45.origin.CGFloat x = 0.0;
  v45.origin.CGFloat y = 0.0;
  v45.size.CGFloat width = 39.0;
  v45.size.CGFloat height = 39.0;
  CGFloat v20 = CGRectGetMaxY(v45);
  CGPathAddLineToPoint(Mutable, 0, x, v20);
  v46.origin.CGFloat x = 0.0;
  v46.origin.CGFloat y = 0.0;
  v46.size.CGFloat width = 39.0;
  v46.size.CGFloat height = 39.0;
  CGFloat v21 = CGRectGetMaxY(v46);
  v47.origin.CGFloat x = x;
  v47.origin.CGFloat y = y;
  v47.size.CGFloat width = width;
  v47.size.CGFloat height = height;
  CGFloat v22 = CGRectGetMaxY(v47);
  CGPathAddArcToPoint(Mutable, 0, 0.0, v21, 0.0, v22, 0.0);
  CGPathAddLineToPoint(Mutable, 0, 0.0, y);
  CGPathAddArcToPoint(Mutable, 0, 0.0, 0.0, x, 0.0, 0.0);
  CGPathCloseSubpath(Mutable);
  v23 = +[UIColor clearColor];
  [v23 setFill];
  CGContextAddPath(CurrentContext, Mutable);
  CGContextFillPath(CurrentContext);
  v24 = CGPathCreateMutable();
  v48.origin.CGFloat x = 0.0;
  v48.origin.CGFloat y = 0.0;
  v48.size.CGFloat width = 39.0;
  v48.size.CGFloat height = 39.0;
  CGRect v49 = CGRectInset(v48, -40.0, -40.0);
  CGPathAddRect(v24, 0, v49);
  CGPathAddPath(v24, 0, Mutable);
  CGPathCloseSubpath(v24);
  CGContextAddPath(CurrentContext, Mutable);
  CGContextClip(CurrentContext);
  v25 = +[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.600000024];

  CGContextSaveGState(CurrentContext);
  id v26 = v25;
  v27 = (CGColor *)[v26 CGColor];
  v33.CGFloat width = 0.0;
  v33.CGFloat height = 1.0;
  CGContextSetShadowWithColor(CurrentContext, v33, 18.0, v27);
  [v26 setFill];
  CGContextSaveGState(CurrentContext);
  CGContextAddPath(CurrentContext, v24);
  CGContextEOFillPath(CurrentContext);
  CGPathRelease(v24);
  CGPathRelease(Mutable);
  v28 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  v29 = objc_msgSend(v28, "resizableImageWithCapInsets:", 19.0, 19.0, 19.0, 19.0);

  return v29;
}

- (void).cxx_destruct
{
}

@end