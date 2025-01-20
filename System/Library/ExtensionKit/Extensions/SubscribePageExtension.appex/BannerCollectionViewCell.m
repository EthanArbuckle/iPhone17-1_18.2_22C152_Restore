@interface BannerCollectionViewCell
- (_TtC19AppStoreKitInternal19DynamicTypeTextView)accessibilityMessageTextView;
- (_TtC22SubscribePageExtension24BannerCollectionViewCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension24BannerCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation BannerCollectionViewCell

- (_TtC22SubscribePageExtension24BannerCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension24BannerCollectionViewCell *)sub_1000F8CBC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension24BannerCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000FB794();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000F9C08();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1000FA36C(a3);
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BannerCollectionViewCell(0);
  id v2 = v3.receiver;
  [(BannerCollectionViewCell *)&v3 _dynamicUserInterfaceTraitDidChange];
  sub_1000F9AD0();
}

- (void)prepareForReuse
{
  id v2 = self;
  sub_1000FA644();
}

- (_TtC19AppStoreKitInternal19DynamicTypeTextView)accessibilityMessageTextView
{
  return (_TtC19AppStoreKitInternal19DynamicTypeTextView *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension24BannerCollectionViewCell_messageTextView);
}

- (void).cxx_destruct
{
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension24BannerCollectionViewCell_itemLayoutContext, (uint64_t *)&unk_100934630);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension24BannerCollectionViewCell_messageTextView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension24BannerCollectionViewCell_roundedBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension24BannerCollectionViewCell_bottomSeparatorView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension24BannerCollectionViewCell_leadingArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension24BannerCollectionViewCell_leadingArtworkTintColor));
  objc_super v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension24BannerCollectionViewCell_configuredMetrics;

  sub_1000FBA3C((uint64_t)v3);
}

@end