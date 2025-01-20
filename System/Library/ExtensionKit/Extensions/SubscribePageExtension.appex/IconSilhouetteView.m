@interface IconSilhouetteView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC22SubscribePageExtension18IconSilhouetteView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension18IconSilhouetteView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation IconSilhouetteView

- (_TtC22SubscribePageExtension18IconSilhouetteView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension18IconSilhouetteView *)sub_1000FC564(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension18IconSilhouetteView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000FCDF0();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000FC904();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v4 = sub_100763FA0();
  uint64_t v5 = *(void *)(v4 - 8);
  __n128 v7 = __chkstk_darwin(v4, v6);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v10 = *(double *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC22SubscribePageExtension18IconSilhouetteView_preferredIconWidth);
  (*(void (**)(char *, char *, uint64_t, __n128))(v5 + 16))(v9, (char *)self + OBJC_IVAR____TtC22SubscribePageExtension18IconSilhouetteView_iconStyle, v4, v7);
  v11 = self;
  sub_100763F60();
  double v13 = v12;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v9, v4);

  double v14 = v10;
  double v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension18IconSilhouetteView_iconStyle;
  uint64_t v4 = sub_100763FA0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension18IconSilhouetteView_titleLabel);
}

@end