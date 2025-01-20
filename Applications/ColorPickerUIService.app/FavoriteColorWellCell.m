@interface FavoriteColorWellCell
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)isAccessibilityElement;
- (BOOL)isSelected;
- (CGRect)editMenuInteraction:(id)a3 targetRectForConfiguration:(id)a4;
- (NSString)accessibilityLabel;
- (_TtC20ColorPickerUIService21FavoriteColorWellCell)initWithCoder:(id)a3;
- (_TtC20ColorPickerUIService21FavoriteColorWellCell)initWithFrame:(CGRect)a3;
- (unint64_t)accessibilityTraits;
- (void)delete:(id)a3;
- (void)layoutSubviews;
- (void)setSelected:(BOOL)a3;
@end

@implementation FavoriteColorWellCell

- (_TtC20ColorPickerUIService21FavoriteColorWellCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ColorPickerUIService21FavoriteColorWellCell *)sub_10003AFF0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ColorPickerUIService21FavoriteColorWellCell)initWithCoder:(id)a3
{
  return (_TtC20ColorPickerUIService21FavoriteColorWellCell *)sub_10003B160(a3);
}

- (BOOL)isSelected
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FavoriteColorWellCell();
  return [(FavoriteColorWellCell *)&v3 isSelected];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FavoriteColorWellCell();
  id v4 = v5.receiver;
  [(FavoriteColorWellCell *)&v5 setSelected:v3];
  [v4 setNeedsLayout];
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10003B6C4();
}

- (CGRect)editMenuInteraction:(id)a3 targetRectForConfiguration:(id)a4
{
  [(FavoriteColorWellCell *)self bounds];
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (a4)
  {
    double v5 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v13, 0, sizeof(v13));
    double v6 = self;
  }
  if (static Selector.== infix(_:_:)())
  {
    uint64_t v7 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                    + OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_onDelete);
    uint64_t v8 = *(void *)&self->color[OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_onDelete];
    BOOL v9 = v7 != 0;
    if (v7)
    {
      uint64_t v10 = swift_allocObject();
      *(void *)(v10 + 16) = v7;
      *(void *)(v10 + 24) = v8;
      v11 = sub_10003BF44;
    }
    else
    {
      v11 = 0;
    }
    sub_10003BEFC(v7);
    sub_100010188((uint64_t)v11);
  }
  else
  {
    BOOL v9 = 0;
  }

  sub_10003BE9C((uint64_t)v13);
  return v9;
}

- (void)delete:(id)a3
{
  if (a3)
  {
    double v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    double v5 = self;
  }
  double v6 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_onDelete);
  if (v6)
  {
    uint64_t v7 = swift_retain();
    v6(v7);
    sub_100010188((uint64_t)v6);
  }

  sub_10003BE9C((uint64_t)v8);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (NSString)accessibilityLabel
{
  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_color);
  BOOL v3 = self;
  id v4 = [v2 _accessibilityNameWithLuma];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v5;
}

- (unint64_t)accessibilityTraits
{
  v2 = self;
  UIAccessibilityTraits v3 = sub_100039618();

  return v3;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_color));
  sub_100010188(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_onDelete));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell____lazy_storage___deleteInteraction));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_colorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_blackHalfView));
  UIAccessibilityTraits v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_maskShapeView);
}

@end