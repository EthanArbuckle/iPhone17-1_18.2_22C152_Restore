@interface ArcadeDownloadPackCollectionViewCell
- (_TtC20ProductPageExtension36ArcadeDownloadPackCollectionViewCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension36ArcadeDownloadPackCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ArcadeDownloadPackCollectionViewCell

- (_TtC20ProductPageExtension36ArcadeDownloadPackCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension36ArcadeDownloadPackCollectionViewCell *)sub_100681B30(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension36ArcadeDownloadPackCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100682450();
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  [(ArcadeDownloadPackCollectionViewCell *)&v4 layoutSubviews];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC20ProductPageExtension36ArcadeDownloadPackCollectionViewCell_cardView];
  sub_100770A80();
  objc_msgSend(v3, "setFrame:", v4.receiver, v4.super_class);
}

- (void).cxx_destruct
{
  sub_1000105B0((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension36ArcadeDownloadPackCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension36ArcadeDownloadPackCollectionViewCell_cardView));
  swift_release();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC20ProductPageExtension36ArcadeDownloadPackCollectionViewCell_impressionsUpdateBlock);

  sub_1000194B0(v3);
}

@end