@interface LargeGameCenterPlayerCollectionViewCell
- (_TtC22SubscribePageExtension39LargeGameCenterPlayerCollectionViewCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension39LargeGameCenterPlayerCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation LargeGameCenterPlayerCollectionViewCell

- (_TtC22SubscribePageExtension39LargeGameCenterPlayerCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension39LargeGameCenterPlayerCollectionViewCell *)sub_100740D20(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension39LargeGameCenterPlayerCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100741A68();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1007414E4();
}

- (void).cxx_destruct
{
  sub_10002D20C((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension39LargeGameCenterPlayerCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension39LargeGameCenterPlayerCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension39LargeGameCenterPlayerCollectionViewCell_alias));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension39LargeGameCenterPlayerCollectionViewCell_displayName);
}

@end