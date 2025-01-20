@interface ArcadeDownloadPackCollectionViewCell
- (_TtC18ASMessagesProvider36ArcadeDownloadPackCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider36ArcadeDownloadPackCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ArcadeDownloadPackCollectionViewCell

- (_TtC18ASMessagesProvider36ArcadeDownloadPackCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider36ArcadeDownloadPackCollectionViewCell *)sub_5CBE30(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider36ArcadeDownloadPackCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_5CC750();
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  [(ArcadeDownloadPackCollectionViewCell *)&v4 layoutSubviews];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC18ASMessagesProvider36ArcadeDownloadPackCollectionViewCell_cardView];
  sub_772580();
  objc_msgSend(v3, "setFrame:", v4.receiver, v4.super_class);
}

- (void).cxx_destruct
{
  sub_411F8((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider36ArcadeDownloadPackCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider36ArcadeDownloadPackCollectionViewCell_cardView));
  swift_release();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC18ASMessagesProvider36ArcadeDownloadPackCollectionViewCell_impressionsUpdateBlock);

  sub_13308(v3);
}

@end