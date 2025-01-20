@interface SmallGameCenterPlayerCollectionViewCell
- (_TtC22SubscribePageExtension39SmallGameCenterPlayerCollectionViewCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension39SmallGameCenterPlayerCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SmallGameCenterPlayerCollectionViewCell

- (_TtC22SubscribePageExtension39SmallGameCenterPlayerCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension39SmallGameCenterPlayerCollectionViewCell *)sub_10006C300(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension39SmallGameCenterPlayerCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10006D3BC();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10006CCCC();
}

- (void).cxx_destruct
{
  sub_10002D20C((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension39SmallGameCenterPlayerCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension39SmallGameCenterPlayerCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension39SmallGameCenterPlayerCollectionViewCell_alias));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension39SmallGameCenterPlayerCollectionViewCell_displayName));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension39SmallGameCenterPlayerCollectionViewCell_separatorView);
}

@end