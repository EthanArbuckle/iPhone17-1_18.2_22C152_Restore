@interface TileSashView
- (_TtC16HealthArticlesUI12TileSashView)initWithCoder:(id)a3;
- (_TtC16HealthArticlesUI12TileSashView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)preferredContentSizeCategoryDidChange;
@end

@implementation TileSashView

- (_TtC16HealthArticlesUI12TileSashView)initWithFrame:(CGRect)a3
{
  return (_TtC16HealthArticlesUI12TileSashView *)sub_1C291F73C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16HealthArticlesUI12TileSashView)initWithCoder:(id)a3
{
  return (_TtC16HealthArticlesUI12TileSashView *)sub_1C291F994(a3);
}

- (void)layoutSubviews
{
  v2 = self;
  [(TileSashView *)v2 frame];
  double v4 = v3;
  [(TileSashView *)v2 layoutMargins];
  double v6 = v5;
  [(TileSashView *)v2 layoutMargins];
  double v8 = v4 - (v6 + v7);
  id v9 = sub_1C291F62C();
  objc_msgSend(v9, sel_setPreferredMaxLayoutWidth_, v8);

  id v10 = sub_1C291F638();
  objc_msgSend(v10, sel_setPreferredMaxLayoutWidth_, v8);

  v11.receiver = v2;
  v11.super_class = (Class)type metadata accessor for TileSashView();
  [(TileSashView *)&v11 layoutSubviews];
}

- (void)preferredContentSizeCategoryDidChange
{
  v2 = self;
  sub_1C291FC50();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16HealthArticlesUI12TileSashView____lazy_storage___titleLabel));
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16HealthArticlesUI12TileSashView____lazy_storage___descriptionLabel);
}

@end