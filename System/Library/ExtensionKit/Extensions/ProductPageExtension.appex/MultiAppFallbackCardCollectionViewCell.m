@interface MultiAppFallbackCardCollectionViewCell
- (NSArray)accessibilityElements;
- (_TtC20ProductPageExtension38MultiAppFallbackCardCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAccessibilityElements:(id)isa;
@end

@implementation MultiAppFallbackCardCollectionViewCell

- (_TtC20ProductPageExtension38MultiAppFallbackCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension38MultiAppFallbackCardCollectionViewCell *)sub_10012ECBC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  [(BaseTodayCardCollectionViewCell *)&v4 layoutSubviews];
  sub_10012F204();
  sub_10012F3A0();
  v3 = *(void **)&v2[OBJC_IVAR____TtC20ProductPageExtension38MultiAppFallbackCardCollectionViewCell_gradientView];
  objc_msgSend(v2, "bounds", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setFrame:");
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = (char *)v3.receiver;
  [(BaseTodayCardCollectionViewCell *)&v3 prepareForReuse];
  sub_10017E160(0);
  sub_10031CCD8();
  sub_100723CA0((uint64_t)_swiftEmptyArrayStorage);
  *(void *)&v2[OBJC_IVAR____TtC20ProductPageExtension38MultiAppFallbackCardCollectionViewCell_artworks] = _swiftEmptyArrayStorage;

  swift_bridgeObjectRelease();
}

- (NSArray)accessibilityElements
{
  sub_10000D280(&qword_10094C640);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_10078DF90;
  objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension38MultiAppFallbackCardCollectionViewCell_infoLayerLabelsView);
  *(void *)(v3 + 56) = type metadata accessor for TodayCardLabelsView();
  *(void *)(v3 + 32) = v4;
  id v5 = v4;
  v6.super.isa = sub_10077BEC0().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v6.super.isa;
}

- (void)setAccessibilityElements:(id)isa
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (isa)
  {
    sub_10077BED0();
    NSArray v6 = self;
    isa = sub_10077BEC0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = self;
  }
  v8.receiver = self;
  v8.super_class = ObjectType;
  [(MultiAppFallbackCardCollectionViewCell *)&v8 setAccessibilityElements:isa];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_weakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension38MultiAppFallbackCardCollectionViewCell_multiAppIconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension38MultiAppFallbackCardCollectionViewCell_gradientView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension38MultiAppFallbackCardCollectionViewCell_infoLayerLabelsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension38MultiAppFallbackCardCollectionViewCell_infoLayerOverlayContainer));

  swift_bridgeObjectRelease();
}

@end