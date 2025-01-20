@interface PHSublayerResizingView
+ (Class)layerClass;
- (PHSublayerResizingView)initWithFrame:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation PHSublayerResizingView

- (PHSublayerResizingView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PHSublayerResizingView;
  return -[PHSublayerResizingView initWithFrame:](&v4, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(PHSublayerResizingView *)self frame];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  v17.receiver = self;
  v17.super_class = (Class)PHSublayerResizingView;
  -[PHSublayerResizingView setFrame:](&v17, "setFrame:", x, y, width, height);
  if (([(PHSublayerResizingView *)self isHidden] & 1) == 0)
  {
    v18.origin.double x = v9;
    v18.origin.double y = v11;
    v18.size.double width = v13;
    v18.size.double height = v15;
    v19.origin.double x = x;
    v19.origin.double y = y;
    v19.size.double width = width;
    v19.size.double height = height;
    if (!CGRectEqualToRect(v18, v19))
    {
      v16 = +[NSNotificationCenter defaultCenter];
      [v16 postNotificationName:@"PHSublayerResizingViewDidResizeNotification" object:0];
    }
  }
}

@end