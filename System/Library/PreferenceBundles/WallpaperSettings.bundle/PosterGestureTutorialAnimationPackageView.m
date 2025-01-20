@interface PosterGestureTutorialAnimationPackageView
- (CGSize)intrinsicContentSize;
- (_TtC17WallpaperSettings41PosterGestureTutorialAnimationPackageView)initWithCoder:(id)a3;
- (_TtC17WallpaperSettings41PosterGestureTutorialAnimationPackageView)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
@end

@implementation PosterGestureTutorialAnimationPackageView

- (_TtC17WallpaperSettings41PosterGestureTutorialAnimationPackageView)initWithFrame:(CGRect)a3
{
  return (_TtC17WallpaperSettings41PosterGestureTutorialAnimationPackageView *)sub_2EBA4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC17WallpaperSettings41PosterGestureTutorialAnimationPackageView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17WallpaperSettings41PosterGestureTutorialAnimationPackageView_package) = 0;
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC17WallpaperSettings41PosterGestureTutorialAnimationPackageView_animating) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17WallpaperSettings41PosterGestureTutorialAnimationPackageView_packageLayer) = 0;
  id v4 = a3;

  result = (_TtC17WallpaperSettings41PosterGestureTutorialAnimationPackageView *)sub_33B60();
  __break(1u);
  return result;
}

- (void)drawRect:(CGRect)a3
{
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC17WallpaperSettings41PosterGestureTutorialAnimationPackageView_packageLayer);
  if (v3)
  {
    CGFloat height = a3.size.height;
    CGFloat width = a3.size.width;
    CGFloat y = a3.origin.y;
    CGFloat x = a3.origin.x;
    v8 = self;
    id v9 = v3;
    v12.origin.CGFloat x = x;
    v12.origin.CGFloat y = y;
    v12.size.CGFloat width = width;
    v12.size.CGFloat height = height;
    double MidX = CGRectGetMidX(v12);
    v13.origin.CGFloat x = x;
    v13.origin.CGFloat y = y;
    v13.size.CGFloat width = width;
    v13.size.CGFloat height = height;
    objc_msgSend(v9, "setPosition:", MidX, CGRectGetMinY(v13));
    CATransform3DMakeScale(&v11, 0.333333333, 0.333333333, 1.0);
    [v9 setTransform:&v11];
  }
}

- (CGSize)intrinsicContentSize
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC17WallpaperSettings41PosterGestureTutorialAnimationPackageView_packageLayer);
  if (v2)
  {
    v3 = self;
    id v4 = v2;
    [v4 bounds];
    double v6 = v5 * 0.333333333;
    [v4 bounds];
    double v8 = v7;

    double v9 = v8 * 0.333333333;
  }
  else
  {
    double v6 = UIViewNoIntrinsicMetric;
    double v9 = UIViewNoIntrinsicMetric;
  }
  double v10 = v6;
  result.CGFloat height = v9;
  result.CGFloat width = v10;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17WallpaperSettings41PosterGestureTutorialAnimationPackageView_package));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC17WallpaperSettings41PosterGestureTutorialAnimationPackageView_packageLayer);
}

@end