@interface ActionCollectionViewCell
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTextLabel;
- (_TtC20ProductPageExtension24ActionCollectionViewCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension24ActionCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)accessoryDidActionWithSender:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ActionCollectionViewCell

- (_TtC20ProductPageExtension24ActionCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension24ActionCollectionViewCell *)sub_10029F1B0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension24ActionCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1002A2050();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10029FA9C();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1002A03B8(a3);
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  [(ActionCollectionViewCell *)&v3 prepareForReuse];
  v2[OBJC_IVAR____TtC20ProductPageExtension24ActionCollectionViewCell_hasArtworkToDisplay] = 0;
}

- (void)accessoryDidActionWithSender:(id)a3
{
  objc_super v3 = *(void (**)(id))((char *)&self->super.super.super.super.super.isa
                                 + OBJC_IVAR____TtC20ProductPageExtension24ActionCollectionViewCell_accessoryAction);
  if (v3)
  {
    id v5 = a3;
    v6 = self;
    sub_1000194C0((uint64_t)v3);
    v3(v5);
    sub_1000194B0((uint64_t)v3);
  }
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTextLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension24ActionCollectionViewCell_textLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension24ActionCollectionViewCell_textLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension24ActionCollectionViewCell_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension24ActionCollectionViewCell_accessoryView));
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension24ActionCollectionViewCell_accessory, (uint64_t *)&unk_100959390);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension24ActionCollectionViewCell_searchAdTransparencyButton));
  objc_super v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension24ActionCollectionViewCell_layoutMetrics;
  uint64_t v4 = sub_10076D0B0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension24ActionCollectionViewCell_itemLayoutContext, (uint64_t *)&unk_1009559B0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension24ActionCollectionViewCell_lazilyCreatedArtworkView));
  uint64_t v5 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC20ProductPageExtension24ActionCollectionViewCell_accessoryAction);

  sub_1000194B0(v5);
}

@end