@interface DOCContainerFittingView
- (CGSize)intrinsicContentSize;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3;
- (_TtC14RecentsAvocado23DOCContainerFittingView)initWithCoder:(id)a3;
- (_TtC14RecentsAvocado23DOCContainerFittingView)initWithFrame:(CGRect)a3;
- (double)contentOffsetFromTop;
- (void)layoutSubviews;
- (void)setContentOffsetFromTop:(double)a3;
@end

@implementation DOCContainerFittingView

- (double)contentOffsetFromTop
{
  v2 = (double *)((char *)self + OBJC_IVAR____TtC14RecentsAvocado23DOCContainerFittingView_contentOffsetFromTop);
  swift_beginAccess();
  return *v2;
}

- (void)setContentOffsetFromTop:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR____TtC14RecentsAvocado23DOCContainerFittingView_contentOffsetFromTop);
  swift_beginAccess();
  double *v4 = a3;
}

- (void)layoutSubviews
{
  v2 = self;
  DOCContainerFittingView.layoutSubviews()();
}

- (_TtC14RecentsAvocado23DOCContainerFittingView)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC14RecentsAvocado23DOCContainerFittingView_fittingSize);
  void *v4 = 0;
  v4[1] = 0;
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC14RecentsAvocado23DOCContainerFittingView_preventContentOffsetUpdates) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC14RecentsAvocado23DOCContainerFittingView_contentOffsetFromTop) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC14RecentsAvocado23DOCContainerFittingView_observationContext) = 0;
  id v5 = a3;

  result = (_TtC14RecentsAvocado23DOCContainerFittingView *)sub_1004CF6B0();
  __break(1u);
  return result;
}

- (CGSize)intrinsicContentSize
{
  v2 = (double *)((char *)self + OBJC_IVAR____TtC14RecentsAvocado23DOCContainerFittingView_fittingSize);
  swift_beginAccess();
  double v3 = *v2;
  double v4 = v2[1];
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
{
  double v3 = (double *)((char *)self + OBJC_IVAR____TtC14RecentsAvocado23DOCContainerFittingView_fittingSize);
  swift_beginAccess();
  double v4 = *v3;
  double v5 = v3[1];
  result.height = v5;
  result.width = v4;
  return result;
}

- (_TtC14RecentsAvocado23DOCContainerFittingView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC14RecentsAvocado23DOCContainerFittingView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado23DOCContainerFittingView_containedViewController));
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC14RecentsAvocado23DOCContainerFittingView_observationContext);
}

@end