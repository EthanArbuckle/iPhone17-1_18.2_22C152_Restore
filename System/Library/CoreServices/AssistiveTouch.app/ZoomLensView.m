@interface ZoomLensView
- (_TtC15assistivetouchd12ZoomLensView)initWithCoder:(id)a3;
- (_TtC15assistivetouchd12ZoomLensView)initWithFrame:(CGRect)a3;
- (void)animationDidStart:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
@end

@implementation ZoomLensView

- (_TtC15assistivetouchd12ZoomLensView)initWithFrame:(CGRect)a3
{
  return (_TtC15assistivetouchd12ZoomLensView *)sub_100111370(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15assistivetouchd12ZoomLensView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001124A0();
}

- (void)animationDidStart:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v8 = sub_10011122C();
  [(ZoomLensView *)v5 bounds];
  double Width = CGRectGetWidth(v10);
  [(ZoomLensView *)v5 bounds];
  double Height = CGRectGetHeight(v11);
  if (Width > Height) {
    double Height = Width;
  }
  [v8 setMarginWidth:Height];
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  id v7 = sub_10011122C();
  [v7 setMarginWidth:0.0];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15assistivetouchd12ZoomLensView_sourceViewBeingReplicated));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15assistivetouchd12ZoomLensView_replicatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15assistivetouchd12ZoomLensView____lazy_storage___zoomReplicatorLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15assistivetouchd12ZoomLensView____lazy_storage___zoomBackdropLayer));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15assistivetouchd12ZoomLensView_zoomLayerView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15assistivetouchd12ZoomLensView_backdropLayerView);
}

@end