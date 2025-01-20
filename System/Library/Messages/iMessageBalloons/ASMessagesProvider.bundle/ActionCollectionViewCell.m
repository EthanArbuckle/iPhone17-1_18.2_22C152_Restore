@interface ActionCollectionViewCell
- (_TtC18ASMessagesProvider24ActionCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider24ActionCollectionViewCell)initWithFrame:(CGRect)a3;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTextLabel;
- (void)accessoryDidActionWithSender:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ActionCollectionViewCell

- (_TtC18ASMessagesProvider24ActionCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider24ActionCollectionViewCell *)sub_256978(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider24ActionCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_259D80();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_257264();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_257B80(a3);
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  [(ActionCollectionViewCell *)&v3 prepareForReuse];
  v2[OBJC_IVAR____TtC18ASMessagesProvider24ActionCollectionViewCell_hasArtworkToDisplay] = 0;
}

- (void)accessoryDidActionWithSender:(id)a3
{
  objc_super v3 = *(void (**)(id))((char *)&self->super.super.super.super.super.isa
                                 + OBJC_IVAR____TtC18ASMessagesProvider24ActionCollectionViewCell_accessoryAction);
  if (v3)
  {
    id v5 = a3;
    v6 = self;
    sub_13318((uint64_t)v3);
    v3(v5);
    sub_13308((uint64_t)v3);
  }
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTextLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC18ASMessagesProvider24ActionCollectionViewCell_textLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider24ActionCollectionViewCell_textLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider24ActionCollectionViewCell_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider24ActionCollectionViewCell_accessoryView));
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider24ActionCollectionViewCell_accessory, &qword_95E010);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider24ActionCollectionViewCell_searchAdTransparencyButton));
  objc_super v3 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider24ActionCollectionViewCell_layoutMetrics;
  uint64_t v4 = sub_76EC10();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider24ActionCollectionViewCell_itemLayoutContext, (uint64_t *)&unk_95C250);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider24ActionCollectionViewCell_lazilyCreatedArtworkView));
  uint64_t v5 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC18ASMessagesProvider24ActionCollectionViewCell_accessoryAction);

  sub_13308(v5);
}

@end