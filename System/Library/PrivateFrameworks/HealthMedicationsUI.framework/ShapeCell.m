@interface ShapeCell
- (BOOL)_accessibilityCellIsSelected;
- (_TtC19HealthMedicationsUI9ShapeCell)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI9ShapeCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation ShapeCell

- (_TtC19HealthMedicationsUI9ShapeCell)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI9ShapeCell *)sub_1C2115220(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI9ShapeCell)initWithCoder:(id)a3
{
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1C211566C();
}

- (void)prepareForReuse
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v2 = v6.receiver;
  [(ShapeCell *)&v6 prepareForReuse];
  uint64_t v5 = 0;
  memset(v4, 0, sizeof(v4));
  uint64_t v3 = (uint64_t)v2 + OBJC_IVAR____TtC19HealthMedicationsUI9ShapeCell_item;
  swift_beginAccess();
  sub_1C1F32DDC((uint64_t)v4, v3);
  swift_endAccess();
  sub_1C2115820();
  sub_1C2116B34((uint64_t)v4, (unint64_t *)&qword_1EBF0C300, (void (*)(uint64_t))sub_1C1F1CB5C);
}

- (BOOL)_accessibilityCellIsSelected
{
  id v2 = self;
  char v3 = sub_1C2116428();

  return v3 & 1;
}

- (void).cxx_destruct
{
}

@end