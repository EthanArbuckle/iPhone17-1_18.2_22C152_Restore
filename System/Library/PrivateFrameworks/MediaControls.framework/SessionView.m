@interface SessionView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC13MediaControls11SessionView)initWithCoder:(id)a3;
- (_TtC13MediaControls11SessionView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SessionView

- (void)layoutSubviews
{
  v2 = self;
  sub_1AE905744();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC13MediaControls11SessionView_headerView);
  v6 = self;
  id v7 = objc_msgSend(v5, sel_sizeThatFits_, width, height);
  double v9 = v8;
  if ((*(uint64_t (**)(id))((*MEMORY[0x1E4FBC8C8] & (uint64_t)v6->super.super.super.isa) + 0x108))(v7))
  {
  }
  else
  {
    objc_msgSend(*(id *)((char *)&v6->super.super.super.isa + OBJC_IVAR____TtC13MediaControls11SessionView_itemsView), sel_sizeThatFits_, width, height);
    double v11 = v10;
    if (qword_1E9A8DC40 != -1) {
      swift_once();
    }
    double v12 = *(double *)&qword_1E9A8F6A0;

    if (v12 >= v11) {
      double v13 = v11;
    }
    else {
      double v13 = v12;
    }
    double v9 = v9 + v13;
  }
  double v14 = width;
  double v15 = v9;
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (_TtC13MediaControls11SessionView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AE9070BC();
}

- (_TtC13MediaControls11SessionView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC13MediaControls11SessionView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_1AE8E7634((uint64_t)self + OBJC_IVAR____TtC13MediaControls11SessionView_listener);
  sub_1AE8E7634((uint64_t)self + OBJC_IVAR____TtC13MediaControls11SessionView_animationCoordinator);
  sub_1AE8F316C((uint64_t)self + OBJC_IVAR____TtC13MediaControls11SessionView_viewModel);
  swift_release();
  swift_release();
  swift_release();
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC13MediaControls11SessionView_stylingProvider);
}

@end