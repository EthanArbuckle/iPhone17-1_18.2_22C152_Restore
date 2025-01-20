@interface ArcadeDownloadPackCollectionViewCell
- (_TtC22SubscribePageExtension36ArcadeDownloadPackCollectionViewCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension36ArcadeDownloadPackCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ArcadeDownloadPackCollectionViewCell

- (_TtC22SubscribePageExtension36ArcadeDownloadPackCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension36ArcadeDownloadPackCollectionViewCell *)sub_1006A7CC8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension36ArcadeDownloadPackCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1006A85E8();
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  [(ArcadeDownloadPackCollectionViewCell *)&v4 layoutSubviews];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC22SubscribePageExtension36ArcadeDownloadPackCollectionViewCell_cardView];
  sub_10075C580();
  objc_msgSend(v3, "setFrame:", v4.receiver, v4.super_class);
}

- (void).cxx_destruct
{
  sub_10002D20C((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension36ArcadeDownloadPackCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension36ArcadeDownloadPackCollectionViewCell_cardView));
  swift_release();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC22SubscribePageExtension36ArcadeDownloadPackCollectionViewCell_impressionsUpdateBlock);

  sub_10001A4D0(v3);
}

@end