@interface SmallGameCenterPlayerCollectionViewCell
- (_TtC18ASMessagesProvider39SmallGameCenterPlayerCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider39SmallGameCenterPlayerCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SmallGameCenterPlayerCollectionViewCell

- (_TtC18ASMessagesProvider39SmallGameCenterPlayerCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider39SmallGameCenterPlayerCollectionViewCell *)sub_46157C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider39SmallGameCenterPlayerCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_462638();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_461F48();
}

- (void).cxx_destruct
{
  sub_411F8((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider39SmallGameCenterPlayerCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider39SmallGameCenterPlayerCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider39SmallGameCenterPlayerCollectionViewCell_alias));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider39SmallGameCenterPlayerCollectionViewCell_displayName));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider39SmallGameCenterPlayerCollectionViewCell_separatorView);
}

@end