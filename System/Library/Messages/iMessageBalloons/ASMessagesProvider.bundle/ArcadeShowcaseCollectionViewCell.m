@interface ArcadeShowcaseCollectionViewCell
- (_TtC18ASMessagesProvider32ArcadeShowcaseCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider32ArcadeShowcaseCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ArcadeShowcaseCollectionViewCell

- (_TtC18ASMessagesProvider32ArcadeShowcaseCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider32ArcadeShowcaseCollectionViewCell *)sub_1422A0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider32ArcadeShowcaseCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_144C2C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_142CF0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider32ArcadeShowcaseCollectionViewCell_iconGridView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider32ArcadeShowcaseCollectionViewCell_wordmarkImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider32ArcadeShowcaseCollectionViewCell_descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider32ArcadeShowcaseCollectionViewCell_offerButton));
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider32ArcadeShowcaseCollectionViewCell_offerLabelPresenter, (uint64_t *)&unk_951B40);
}

@end