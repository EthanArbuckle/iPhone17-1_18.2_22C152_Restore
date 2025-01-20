@interface LinkDetailActionCollectionViewCell
- (_TtC15ConversationKit34LinkDetailActionCollectionViewCell)initWithCoder:(id)a3;
- (_TtC15ConversationKit34LinkDetailActionCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)prepareForReuse;
@end

@implementation LinkDetailActionCollectionViewCell

- (void)prepareForReuse
{
  v2 = self;
  LinkDetailActionCollectionViewCell.prepareForReuse()();
}

- (_TtC15ConversationKit34LinkDetailActionCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC15ConversationKit34LinkDetailActionCollectionViewCell *)LinkDetailActionCollectionViewCell.init(frame:)();
}

- (_TtC15ConversationKit34LinkDetailActionCollectionViewCell)initWithCoder:(id)a3
{
  return (_TtC15ConversationKit34LinkDetailActionCollectionViewCell *)LinkDetailActionCollectionViewCell.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit34LinkDetailActionCollectionViewCell____lazy_storage___accessoryImageView));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC15ConversationKit34LinkDetailActionCollectionViewCell_linkDetailImage);
}

@end