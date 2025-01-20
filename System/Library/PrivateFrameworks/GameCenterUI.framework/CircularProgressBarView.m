@interface CircularProgressBarView
- (_TtC12GameCenterUI23CircularProgressBarView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI23CircularProgressBarView)initWithFrame:(CGRect)a3;
@end

@implementation CircularProgressBarView

- (_TtC12GameCenterUI23CircularProgressBarView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF5B93E8();
}

- (_TtC12GameCenterUI23CircularProgressBarView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI23CircularProgressBarView_circleLayer));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12GameCenterUI23CircularProgressBarView_progressLayer);
}

@end