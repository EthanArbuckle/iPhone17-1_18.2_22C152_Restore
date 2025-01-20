@interface MetadataRibbonIconWithLabelView
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC18ASMessagesProvider31MetadataRibbonIconWithLabelView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider31MetadataRibbonIconWithLabelView)initWithFrame:(CGRect)a3;
- (_TtC19AppStoreKitInternal11ArtworkView)accessibilityArtworkView;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityUILabel;
- (void)layoutSubviews;
@end

@implementation MetadataRibbonIconWithLabelView

- (_TtC18ASMessagesProvider31MetadataRibbonIconWithLabelView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider31MetadataRibbonIconWithLabelView *)sub_1AE9DC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider31MetadataRibbonIconWithLabelView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1B1960();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AF4BC();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  swift_unknownObjectRetain();
  v5 = self;
  double v6 = sub_1AF7B8();
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  swift_unknownObjectRelease();

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.var3 = v16;
  result.var2 = v15;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (_TtC19AppStoreKitInternal11ArtworkView)accessibilityArtworkView
{
  return (_TtC19AppStoreKitInternal11ArtworkView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                           + OBJC_IVAR____TtC18ASMessagesProvider31MetadataRibbonIconWithLabelView_artworkView));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityUILabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC18ASMessagesProvider31MetadataRibbonIconWithLabelView_label));
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider31MetadataRibbonIconWithLabelView_metrics;
  uint64_t v4 = sub_778BE0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider31MetadataRibbonIconWithLabelView_label));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider31MetadataRibbonIconWithLabelView_artworkView));
  swift_release();
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider31MetadataRibbonIconWithLabelView_id, (uint64_t *)&unk_9563B0);
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider31MetadataRibbonIconWithLabelView_itemType, &qword_9505D0);
  v5 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider31MetadataRibbonIconWithLabelView_configuration;

  sub_1B1818((uint64_t)v5);
}

@end