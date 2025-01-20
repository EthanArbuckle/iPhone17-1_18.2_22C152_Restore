@interface VideoCardCollectionViewCell
- (_TtC22SubscribePageExtension27VideoCardCollectionViewCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension27VideoCardCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation VideoCardCollectionViewCell

- (_TtC22SubscribePageExtension27VideoCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension27VideoCardCollectionViewCell *)sub_100679758(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension27VideoCardCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10067A4E8();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100679CD4();
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(VideoCardCollectionViewCell *)&v3 prepareForReuse];
  sub_100617224();
}

- (void).cxx_destruct
{
  sub_10002D20C((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension27VideoCardCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension27VideoCardCollectionViewCell_videoCardView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension27VideoCardCollectionViewCell_avatarShowcase));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension27VideoCardCollectionViewCell_shadowView);
}

@end