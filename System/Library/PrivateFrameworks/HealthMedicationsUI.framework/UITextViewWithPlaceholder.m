@interface UITextViewWithPlaceholder
- (NSString)text;
- (_TtC19HealthMedicationsUI25UITextViewWithPlaceholder)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI25UITextViewWithPlaceholder)initWithFrame:(CGRect)a3 textContainer:(id)a4;
- (void)layoutSubviews;
- (void)setText:(id)a3;
@end

@implementation UITextViewWithPlaceholder

- (NSString)text
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v2 = v7.receiver;
  v3 = [(UITextViewWithPlaceholder *)&v7 text];
  if (v3)
  {
    v4 = v3;
    sub_1C214A5F0();

    v5 = (void *)sub_1C214A5B0();
    swift_bridgeObjectRelease();
  }
  else
  {

    v5 = 0;
  }

  return (NSString *)v5;
}

- (void)setText:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1C214A5F0();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  objc_super v7 = self;
  UITextViewWithPlaceholder.text.setter(v4, v6);
}

- (_TtC19HealthMedicationsUI25UITextViewWithPlaceholder)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI25UITextViewWithPlaceholder____lazy_storage___placeholderLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI25UITextViewWithPlaceholder_textDidChangeSubscription) = 0;
  v15.receiver = self;
  v15.super_class = ObjectType;
  id v11 = a4;
  v12 = -[UITextViewWithPlaceholder initWithFrame:textContainer:](&v15, sel_initWithFrame_textContainer_, v11, x, y, width, height);
  id v13 = sub_1C20DEE50();
  -[UITextViewWithPlaceholder addSubview:](v12, sel_addSubview_, v13, v15.receiver, v15.super_class);

  sub_1C20DF758();
  return v12;
}

- (_TtC19HealthMedicationsUI25UITextViewWithPlaceholder)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI25UITextViewWithPlaceholder____lazy_storage___placeholderLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI25UITextViewWithPlaceholder_textDidChangeSubscription) = 0;
  id v4 = a3;

  result = (_TtC19HealthMedicationsUI25UITextViewWithPlaceholder *)sub_1C214B910();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  id v2 = self;
  UITextViewWithPlaceholder.layoutSubviews()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI25UITextViewWithPlaceholder____lazy_storage___placeholderLabel));

  swift_release();
}

@end