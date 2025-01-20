@interface BannerCollectionViewCell
- (_TtC18ASMessagesProvider24BannerCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider24BannerCollectionViewCell)initWithFrame:(CGRect)a3;
- (_TtC19AppStoreKitInternal19DynamicTypeTextView)accessibilityMessageTextView;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation BannerCollectionViewCell

- (_TtC18ASMessagesProvider24BannerCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider24BannerCollectionViewCell *)sub_13A8D4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider24BannerCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_13D3AC();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_13B820();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_13BF84(a3);
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BannerCollectionViewCell(0);
  id v2 = v3.receiver;
  [(BannerCollectionViewCell *)&v3 _dynamicUserInterfaceTraitDidChange];
  sub_13B6E8();
}

- (void)prepareForReuse
{
  id v2 = self;
  sub_13C25C();
}

- (_TtC19AppStoreKitInternal19DynamicTypeTextView)accessibilityMessageTextView
{
  return (_TtC19AppStoreKitInternal19DynamicTypeTextView *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC18ASMessagesProvider24BannerCollectionViewCell_messageTextView);
}

- (void).cxx_destruct
{
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider24BannerCollectionViewCell_itemLayoutContext, (uint64_t *)&unk_95C250);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider24BannerCollectionViewCell_messageTextView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider24BannerCollectionViewCell_roundedBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider24BannerCollectionViewCell_bottomSeparatorView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider24BannerCollectionViewCell_leadingArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider24BannerCollectionViewCell_leadingArtworkTintColor));
  objc_super v3 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider24BannerCollectionViewCell_configuredMetrics;

  sub_13D654((uint64_t)v3);
}

@end