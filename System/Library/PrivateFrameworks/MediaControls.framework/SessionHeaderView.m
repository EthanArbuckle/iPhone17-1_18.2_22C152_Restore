@interface SessionHeaderView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC13MediaControls17SessionHeaderView)initWithCoder:(id)a3;
- (_TtC13MediaControls17SessionHeaderView)initWithFrame:(CGRect)a3;
- (void)tapAction;
@end

@implementation SessionHeaderView

- (_TtC13MediaControls17SessionHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC13MediaControls17SessionHeaderView *)sub_1AE8F49BC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC13MediaControls17SessionHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AE8F5774();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  v4 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.super.super.isa) + 0x98);
  v5 = self;
  char v6 = v4();
  if (qword_1E9A8CDB0 != -1) {
    swift_once();
  }
  if (v6) {
    double v7 = 20.0;
  }
  else {
    double v7 = 11.0;
  }
  if (v6) {
    double v8 = 17.0;
  }
  else {
    double v8 = 11.0;
  }
  double v9 = *(double *)&qword_1E9A8F610;

  double v10 = v8 + v7 + v9;
  double v11 = width;
  result.height = v10;
  result.CGFloat width = v11;
  return result;
}

- (void)tapAction
{
  v2 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.super.super.isa) + 0x100);
  v5 = self;
  id v3 = (void (*)(void))v2();
  if (v3)
  {
    uint64_t v4 = (uint64_t)v3;
    v3();
    sub_1AE8F5874(v4);
  }
}

- (void).cxx_destruct
{
  sub_1AE8F431C(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC13MediaControls17SessionHeaderView_viewModel), *(void *)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC13MediaControls17SessionHeaderView_viewModel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls17SessionHeaderView_metadataView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls17SessionHeaderView_visualStylingProvider));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC13MediaControls17SessionHeaderView_tapHandler);

  sub_1AE8F5874(v3);
}

@end