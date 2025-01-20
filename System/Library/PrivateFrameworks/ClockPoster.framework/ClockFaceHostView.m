@interface ClockFaceHostView
- (UIColor)tintColor;
- (_TtC11ClockPoster17ClockFaceHostView)initWithCoder:(id)a3;
- (_TtC11ClockPoster17ClockFaceHostView)initWithFrame:(CGRect)a3;
- (void)didMoveToSuperview;
- (void)layoutSubviews;
- (void)setTintColor:(id)a3;
@end

@implementation ClockFaceHostView

- (_TtC11ClockPoster17ClockFaceHostView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC11ClockPoster17ClockFaceHostView_wasUnsupportedPortraitInterface) = 0;
  id v4 = a3;

  result = (_TtC11ClockPoster17ClockFaceHostView *)sub_24A057BC8();
  __break(1u);
  return result;
}

- (void)didMoveToSuperview
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ClockFaceHostView();
  v2 = (UIView *)v5.receiver;
  [(ClockFaceHostView *)&v5 didMoveToSuperview];
  v3 = [(UIView *)v2 superview];
  if (v3)
  {
    id v4 = v3;
    [(UIView *)v3 bounds];
    -[UIView setFrame:](v2, sel_setFrame_);
    UIView.cp_applyFullscreenConstraints(inContainer:)(v4);

    v2 = v4;
  }
}

- (void)layoutSubviews
{
  v2 = self;
  sub_249FC8FB8();
}

- (UIColor)tintColor
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ClockFaceHostView();
  v2 = [(ClockFaceHostView *)&v4 tintColor];

  return v2;
}

- (void)setTintColor:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ClockFaceHostView();
  id v4 = a3;
  objc_super v5 = (char *)v8.receiver;
  [(ClockFaceHostView *)&v8 setTintColor:v4];
  v6 = *(void **)&v5[OBJC_IVAR____TtC11ClockPoster17ClockFaceHostView_hostedClockFace];
  id v7 = objc_msgSend(v5, sel_tintColor, v8.receiver, v8.super_class);
  objc_msgSend(v6, sel_setTintColor_, v7);
}

- (_TtC11ClockPoster17ClockFaceHostView)initWithFrame:(CGRect)a3
{
  result = (_TtC11ClockPoster17ClockFaceHostView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ClockPoster17ClockFaceHostView_hostedClockFace));
}

@end