@interface DOCItemStatusView
- (UIColor)tintColor;
- (_TtC18DocumentAppIntents17DOCItemStatusView)initWithCoder:(id)a3;
- (_TtC18DocumentAppIntents17DOCItemStatusView)initWithFrame:(CGRect)a3;
- (void)setTintColor:(id)a3;
@end

@implementation DOCItemStatusView

- (UIColor)tintColor
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCItemStatusView();
  v2 = [(DOCItemStatusView *)&v4 tintColor];

  return v2;
}

- (void)setTintColor:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCItemStatusView();
  [(DOCItemStatusView *)&v4 setTintColor:a3];
}

- (_TtC18DocumentAppIntents17DOCItemStatusView)initWithFrame:(CGRect)a3
{
  return (_TtC18DocumentAppIntents17DOCItemStatusView *)sub_1000CD334(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18DocumentAppIntents17DOCItemStatusView)initWithCoder:(id)a3
{
  return (_TtC18DocumentAppIntents17DOCItemStatusView *)sub_1000CD4E0(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntents17DOCItemStatusView_statusImageFontStyle));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntents17DOCItemStatusView_iconColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntents17DOCItemStatusView_progressCompletedColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntents17DOCItemStatusView_progressBackgroundRingColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntents17DOCItemStatusView____lazy_storage___statusButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntents17DOCItemStatusView_progressView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18DocumentAppIntents17DOCItemStatusView_observedProgress);
}

@end