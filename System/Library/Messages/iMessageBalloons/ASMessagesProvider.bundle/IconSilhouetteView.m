@interface IconSilhouetteView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC18ASMessagesProvider18IconSilhouetteView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider18IconSilhouetteView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation IconSilhouetteView

- (_TtC18ASMessagesProvider18IconSilhouetteView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider18IconSilhouetteView *)sub_11EEA4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider18IconSilhouetteView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_11F730();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_11F244();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v4 = sub_77A010();
  uint64_t v5 = *(void *)(v4 - 8);
  __n128 v6 = __chkstk_darwin(v4);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v9 = *(double *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC18ASMessagesProvider18IconSilhouetteView_preferredIconWidth);
  (*(void (**)(char *, char *, uint64_t, __n128))(v5 + 16))(v8, (char *)self + OBJC_IVAR____TtC18ASMessagesProvider18IconSilhouetteView_iconStyle, v4, v6);
  v10 = self;
  sub_779FD0();
  double v12 = v11;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);

  double v13 = v9;
  double v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider18IconSilhouetteView_iconStyle;
  uint64_t v4 = sub_77A010();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider18IconSilhouetteView_titleLabel);
}

@end