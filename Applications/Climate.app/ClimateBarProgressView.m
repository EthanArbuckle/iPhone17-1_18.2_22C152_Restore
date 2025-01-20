@interface ClimateBarProgressView
@end

@implementation ClimateBarProgressView

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate22ClimateBarProgressView_trackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate22ClimateBarProgressView_progressView));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC7Climate22ClimateBarProgressView_progressViewConstraint);
}

@end