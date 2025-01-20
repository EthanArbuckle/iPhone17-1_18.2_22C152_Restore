@interface EditorsChoiceBackgroundView
- (_TtC20ProductPageExtension27EditorsChoiceBackgroundView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension27EditorsChoiceBackgroundView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation EditorsChoiceBackgroundView

- (_TtC20ProductPageExtension27EditorsChoiceBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension27EditorsChoiceBackgroundView *)sub_10027F2AC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension27EditorsChoiceBackgroundView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC20ProductPageExtension27EditorsChoiceBackgroundView_imageView;
  id v6 = objc_allocWithZone((Class)UIImageView);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)[v6 init];

  result = (_TtC20ProductPageExtension27EditorsChoiceBackgroundView *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  [(EditorsChoiceBackgroundView *)&v4 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC20ProductPageExtension27EditorsChoiceBackgroundView_imageView];
  objc_msgSend(v2, "bounds", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setFrame:");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension27EditorsChoiceBackgroundView_imageView));
}

@end