@interface SelfServiceProgressView
- (_TtC11Diagnostics23SelfServiceProgressView)initWithCoder:(id)a3;
- (_TtC11Diagnostics23SelfServiceProgressView)initWithFrame:(CGRect)a3;
@end

@implementation SelfServiceProgressView

- (_TtC11Diagnostics23SelfServiceProgressView)initWithFrame:(CGRect)a3
{
  return (_TtC11Diagnostics23SelfServiceProgressView *)sub_100096314(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11Diagnostics23SelfServiceProgressView)initWithCoder:(id)a3
{
  return (_TtC11Diagnostics23SelfServiceProgressView *)sub_100096504(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics23SelfServiceProgressView_progressView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics23SelfServiceProgressView_titleLabel));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics23SelfServiceProgressView_subtitleLabel));

  swift_bridgeObjectRelease();
}

@end