@interface FieldCell
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldEndEditing:(id)a3;
- (_TtC19HealthMedicationsUI9FieldCell)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI9FieldCell)initWithFrame:(CGRect)a3;
- (void)didTapCell;
- (void)didTapDoneWithSender:(id)a3;
- (void)textFieldDidChangeWithSender:(id)a3;
@end

@implementation FieldCell

- (_TtC19HealthMedicationsUI9FieldCell)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI9FieldCell *)sub_1C21424F4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI9FieldCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C2146478();
}

- (void)didTapCell
{
  v2 = self;
  sub_1C2143360();
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  sub_1C214A5F0();
  id v9 = a3;
  v10 = self;
  LOBYTE(length) = sub_1C2143854(v9, location, length);

  swift_bridgeObjectRelease();
  return length & 1;
}

- (void)didTapDoneWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = sub_1C2142038();
  objc_msgSend(v6, sel_resignFirstResponder);
}

- (void)textFieldDidChangeWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C2144ACC(v4);
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI9FieldCell____lazy_storage___textField));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI9FieldCell____lazy_storage___numberFormatter));
  swift_bridgeObjectRelease();
  sub_1C2146364((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI9FieldCell_item, (unint64_t *)&qword_1EBF0C300, (void (*)(uint64_t))sub_1C1F1CB5C);
}

@end