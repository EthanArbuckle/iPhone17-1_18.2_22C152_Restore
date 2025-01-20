@interface VideoCardCollectionViewCell
- (_TtC18ASMessagesProvider27VideoCardCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider27VideoCardCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation VideoCardCollectionViewCell

- (_TtC18ASMessagesProvider27VideoCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider27VideoCardCollectionViewCell *)sub_55944(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider27VideoCardCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_5685C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_55F80();
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(VideoCardCollectionViewCell *)&v3 prepareForReuse];
  sub_6C6528();
}

- (void).cxx_destruct
{
  sub_411F8((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider27VideoCardCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider27VideoCardCollectionViewCell_videoCardView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider27VideoCardCollectionViewCell_avatarShowcase));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider27VideoCardCollectionViewCell_shadowView);
}

@end