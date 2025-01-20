@interface MultiAppFallbackCardCollectionViewCell
- (NSArray)accessibilityElements;
- (_TtC22SubscribePageExtension38MultiAppFallbackCardCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAccessibilityElements:(id)isa;
@end

@implementation MultiAppFallbackCardCollectionViewCell

- (_TtC22SubscribePageExtension38MultiAppFallbackCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension38MultiAppFallbackCardCollectionViewCell *)sub_10003738C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  [(BaseTodayCardCollectionViewCell *)&v4 layoutSubviews];
  sub_1000379B8();
  sub_100037B54();
  v3 = *(void **)&v2[OBJC_IVAR____TtC22SubscribePageExtension38MultiAppFallbackCardCollectionViewCell_gradientView];
  objc_msgSend(v2, "bounds", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setFrame:");
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = (char *)v3.receiver;
  [(BaseTodayCardCollectionViewCell *)&v3 prepareForReuse];
  sub_100335664(0);
  sub_100583C10();
  sub_10005C2C8((uint64_t)_swiftEmptyArrayStorage);
  *(void *)&v2[OBJC_IVAR____TtC22SubscribePageExtension38MultiAppFallbackCardCollectionViewCell_artworks] = _swiftEmptyArrayStorage;

  swift_bridgeObjectRelease();
}

- (NSArray)accessibilityElements
{
  sub_10000FB44((uint64_t *)&unk_100936E10);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1007B8540;
  objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension38MultiAppFallbackCardCollectionViewCell_infoLayerLabelsView);
  *(void *)(v3 + 56) = type metadata accessor for TodayCardLabelsView();
  *(void *)(v3 + 32) = v4;
  id v5 = v4;
  v6.super.isa = sub_1007677F0().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v6.super.isa;
}

- (void)setAccessibilityElements:(id)isa
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (isa)
  {
    sub_100767800();
    NSArray v6 = self;
    isa = sub_1007677F0().super.isa;
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
                     + OBJC_IVAR____TtC22SubscribePageExtension38MultiAppFallbackCardCollectionViewCell_multiAppIconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension38MultiAppFallbackCardCollectionViewCell_gradientView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension38MultiAppFallbackCardCollectionViewCell_infoLayerLabelsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension38MultiAppFallbackCardCollectionViewCell_infoLayerOverlayContainer));

  swift_bridgeObjectRelease();
}

@end