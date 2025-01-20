@interface FocusableTitledAppIconView
- (BOOL)canBecomeFocused;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC12GameCenterUI26FocusableTitledAppIconView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI26FocusableTitledAppIconView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation FocusableTitledAppIconView

- (void)prepareForReuse
{
  v2 = self;
  sub_1AF6DF94C();
}

- (_TtC12GameCenterUI26FocusableTitledAppIconView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI26FocusableTitledAppIconView *)sub_1AF781F34(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI26FocusableTitledAppIconView)initWithCoder:(id)a3
{
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AF78210C();
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  swift_unknownObjectRetain();
  v6 = self;
  double v7 = sub_1AF7821C8(a4);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  swift_unknownObjectRelease();

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.var3 = v17;
  result.var2 = v16;
  result.var1 = v15;
  result.var0 = v14;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI26FocusableTitledAppIconView_embeddedView));
}

@end