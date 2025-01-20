@interface UITextFieldWithInsets
- (CGRect)editingRectForBounds:(CGRect)a3;
- (CGRect)textRectForBounds:(CGRect)a3;
- (_TtC19HealthMedicationsUI21UITextFieldWithInsets)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI21UITextFieldWithInsets)initWithFrame:(CGRect)a3;
@end

@implementation UITextFieldWithInsets

- (CGRect)textRectForBounds:(CGRect)a3
{
  sub_1C2045BDC((char *)self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (SEL *)&selRef_textRectForBounds_);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)editingRectForBounds:(CGRect)a3
{
  sub_1C2045BDC((char *)self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (SEL *)&selRef_editingRectForBounds_);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (_TtC19HealthMedicationsUI21UITextFieldWithInsets)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI21UITextFieldWithInsets_insets;
  *(_OWORD *)v9 = 0u;
  *((_OWORD *)v9 + 1) = 0u;
  v9[32] = 1;
  v11.receiver = self;
  v11.super_class = ObjectType;
  return -[UITextFieldWithInsets initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC19HealthMedicationsUI21UITextFieldWithInsets)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  double v6 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI21UITextFieldWithInsets_insets;
  *(_OWORD *)double v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  v6[32] = 1;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return [(UITextFieldWithInsets *)&v8 initWithCoder:a3];
}

@end