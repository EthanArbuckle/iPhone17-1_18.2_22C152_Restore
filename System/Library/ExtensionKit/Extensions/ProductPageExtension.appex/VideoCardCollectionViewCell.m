@interface VideoCardCollectionViewCell
- (_TtC20ProductPageExtension27VideoCardCollectionViewCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension27VideoCardCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation VideoCardCollectionViewCell

- (_TtC20ProductPageExtension27VideoCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension27VideoCardCollectionViewCell *)sub_100500838(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension27VideoCardCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1005015C8();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100500DB4();
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(VideoCardCollectionViewCell *)&v3 prepareForReuse];
  sub_1000BFA0C();
}

- (void).cxx_destruct
{
  sub_1000105B0((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension27VideoCardCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension27VideoCardCollectionViewCell_videoCardView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension27VideoCardCollectionViewCell_avatarShowcase));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension27VideoCardCollectionViewCell_shadowView);
}

@end