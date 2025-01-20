@interface DOCItemStatusView
- (UIColor)tintColor;
- (_TtC11SaveToFiles17DOCItemStatusView)initWithCoder:(id)a3;
- (_TtC11SaveToFiles17DOCItemStatusView)initWithFrame:(CGRect)a3;
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

- (_TtC11SaveToFiles17DOCItemStatusView)initWithFrame:(CGRect)a3
{
  return (_TtC11SaveToFiles17DOCItemStatusView *)sub_1003B4744(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11SaveToFiles17DOCItemStatusView)initWithCoder:(id)a3
{
  return (_TtC11SaveToFiles17DOCItemStatusView *)sub_1003B48F0(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles17DOCItemStatusView_statusImageFontStyle));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles17DOCItemStatusView_progressCompletedColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles17DOCItemStatusView_progressBackgroundRingColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles17DOCItemStatusView____lazy_storage___statusButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles17DOCItemStatusView_progressView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11SaveToFiles17DOCItemStatusView_observedProgress);
}

@end