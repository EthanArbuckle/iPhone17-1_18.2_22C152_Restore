@interface SessionsContentView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC13MediaControls19SessionsContentView)initWithCoder:(id)a3;
- (_TtC13MediaControls19SessionsContentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SessionsContentView

- (_TtC13MediaControls19SessionsContentView)initWithFrame:(CGRect)a3
{
  return (_TtC13MediaControls19SessionsContentView *)sub_1AE8EACE4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC13MediaControls19SessionsContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AE8F3060();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  sub_1AE8EB138(width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)type metadata accessor for SessionsContentView();
  v2 = v16.receiver;
  id v3 = [(SessionsContentView *)&v16 layoutSubviews];
  uint64_t v4 = (*(uint64_t (**)(id))((*MEMORY[0x1E4FBC8C8] & *v2) + 0x168))(v3);
  objc_msgSend(v2, sel_bounds);
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  v13 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v4 + 104))(v15);
  v14[1] = v6;
  v14[2] = v8;
  v14[3] = v10;
  v14[4] = v12;
  v13(v15, 0);
  swift_release();
  sub_1AE8EE294();
}

- (void).cxx_destruct
{
  sub_1AE8E7634((uint64_t)self + OBJC_IVAR____TtC13MediaControls19SessionsContentView_delegate);
  sub_1AE8E4EC4(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC13MediaControls19SessionsContentView_viewModel), *(void *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC13MediaControls19SessionsContentView_viewModel), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC13MediaControls19SessionsContentView_viewModel), *(uint64_t *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC13MediaControls19SessionsContentView_viewModel), *(uint64_t *)((char *)&self->super._cachedTraitCollection+ OBJC_IVAR____TtC13MediaControls19SessionsContentView_viewModel));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1AE8E7634((uint64_t)self + OBJC_IVAR____TtC13MediaControls19SessionsContentView_animationCoordinator);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC13MediaControls19SessionsContentView_stylingProvider);
}

@end