@interface LargeGameCenterPlayerCollectionViewCell
- (_TtC18ASMessagesProvider39LargeGameCenterPlayerCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider39LargeGameCenterPlayerCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation LargeGameCenterPlayerCollectionViewCell

- (_TtC18ASMessagesProvider39LargeGameCenterPlayerCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider39LargeGameCenterPlayerCollectionViewCell *)sub_26B658(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider39LargeGameCenterPlayerCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_26C3A0();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_26BE1C();
}

- (void).cxx_destruct
{
  sub_411F8((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider39LargeGameCenterPlayerCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider39LargeGameCenterPlayerCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider39LargeGameCenterPlayerCollectionViewCell_alias));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider39LargeGameCenterPlayerCollectionViewCell_displayName);
}

@end