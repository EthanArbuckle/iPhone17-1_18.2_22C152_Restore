@interface B389AnnotationView
+ (Class)calloutViewClass;
- (_TtC18SharingViewServiceP33_A90FF226C003DA47E3B07A4439E9D09718B389AnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4;
- (_TtC18SharingViewServiceP33_A90FF226C003DA47E3B07A4439E9D09718B389AnnotationView)initWithCoder:(id)a3;
- (id)_balloonImage;
- (id)_balloonStrokeColor;
- (id)_balloonTintColor;
- (int64_t)_balloonCalloutStyle;
@end

@implementation B389AnnotationView

+ (Class)calloutViewClass
{
  sub_100017EF4(0, &qword_1001CB268);

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC18SharingViewServiceP33_A90FF226C003DA47E3B07A4439E9D09718B389AnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)&self->_MKPuckAnnotationView_opaque[OBJC_IVAR____TtC18SharingViewServiceP33_A90FF226C003DA47E3B07A4439E9D09718B389AnnotationView_calloutInnerDiameter] = 0x404C000000000000;
    swift_unknownObjectRetain();
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(void *)&self->_MKPuckAnnotationView_opaque[OBJC_IVAR____TtC18SharingViewServiceP33_A90FF226C003DA47E3B07A4439E9D09718B389AnnotationView_calloutInnerDiameter] = 0x404C000000000000;
    swift_unknownObjectRetain();
    NSString v6 = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for B389AnnotationView();
  v7 = [(B389AnnotationView *)&v9 initWithAnnotation:a3 reuseIdentifier:v6];

  swift_unknownObjectRelease();
  return v7;
}

- (_TtC18SharingViewServiceP33_A90FF226C003DA47E3B07A4439E9D09718B389AnnotationView)initWithCoder:(id)a3
{
  *(void *)&self->_MKPuckAnnotationView_opaque[OBJC_IVAR____TtC18SharingViewServiceP33_A90FF226C003DA47E3B07A4439E9D09718B389AnnotationView_calloutInnerDiameter] = 0x404C000000000000;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for B389AnnotationView();
  return [(B389AnnotationView *)&v5 initWithCoder:a3];
}

- (int64_t)_balloonCalloutStyle
{
  return 2;
}

- (id)_balloonStrokeColor
{
  return sub_1000B1570(self, (uint64_t)a2, (SEL *)&selRef_systemGray6Color);
}

- (id)_balloonTintColor
{
  return sub_1000B1570(self, (uint64_t)a2, (SEL *)&selRef_systemBackgroundColor);
}

- (id)_balloonImage
{
  v2 = self;
  if ([(B389AnnotationView *)v2 annotation])
  {
    type metadata accessor for B389MapAnnotation();
    uint64_t v3 = swift_dynamicCastClass();
    if (v3)
    {
      uint64_t v4 = *(void *)(v3 + OBJC_IVAR____TtC18SharingViewService17B389MapAnnotation_roleEmoji);
      uint64_t v5 = *(void *)(v3 + OBJC_IVAR____TtC18SharingViewService17B389MapAnnotation_roleEmoji + 8);
      double v6 = *(double *)&v2->_MKPuckAnnotationView_opaque[OBJC_IVAR____TtC18SharingViewServiceP33_A90FF226C003DA47E3B07A4439E9D09718B389AnnotationView_calloutInnerDiameter];
      swift_bridgeObjectRetain();
      v7 = (void *)sub_1000FA6DC(v4, v5, v6);

      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }

    swift_unknownObjectRelease();
  }
  else
  {
  }
  v7 = 0;
LABEL_7:

  return v7;
}

@end