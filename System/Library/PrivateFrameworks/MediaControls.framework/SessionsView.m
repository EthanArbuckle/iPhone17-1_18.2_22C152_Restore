@interface SessionsView
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (_TtC13MediaControls12SessionsView)initWithCoder:(id)a3;
- (_TtC13MediaControls12SessionsView)initWithFrame:(CGRect)a3;
- (void)backgroundTapAction:(id)a3;
- (void)layoutSubviews;
- (void)visualStylingProviderDidChange:(id)a3;
@end

@implementation SessionsView

- (_TtC13MediaControls12SessionsView)initWithFrame:(CGRect)a3
{
  return (_TtC13MediaControls12SessionsView *)sub_1AE8E5734(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC13MediaControls12SessionsView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AE8E71A8();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AE8E5C10();
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_1AE8E74A0(v7);

  return v9 & 1;
}

- (void)backgroundTapAction:(id)a3
{
  v4 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.super.super.isa) + 0x88);
  id v5 = a3;
  char v9 = self;
  if (v4())
  {
    uint64_t v7 = v6;
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(_TtC13MediaControls12SessionsView *, uint64_t, uint64_t))(v7 + 8))(v9, ObjectType, v7);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)visualStylingProviderDidChange:(id)a3
{
  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC13MediaControls12SessionsView_sessionsContentView);
  id v5 = a3;
  uint64_t v7 = self;
  id v6 = sub_1AE8E6A44();
  (*(void (**)(id))((*MEMORY[0x1E4FBC8C8] & *v4) + 0x250))(v6);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls12SessionsView_sessionsContentView));
  sub_1AE8E7634((uint64_t)self + OBJC_IVAR____TtC13MediaControls12SessionsView_delegate);
  sub_1AE8E4EC4(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC13MediaControls12SessionsView_viewModel), *(void *)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC13MediaControls12SessionsView_viewModel), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC13MediaControls12SessionsView_viewModel), *(uint64_t *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC13MediaControls12SessionsView_viewModel), *(uint64_t *)((char *)&self->super._cachedTraitCollection + OBJC_IVAR____TtC13MediaControls12SessionsView_viewModel));
  swift_unknownObjectRelease();
  sub_1AE8E765C(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC13MediaControls12SessionsView____lazy_storage___mtVisualStylingProvider));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC13MediaControls12SessionsView____lazy_storage___stylingProvider);

  sub_1AE8E765C(v3);
}

@end