@interface TextItemCell
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (_TtC19HealthMedicationsUI12TextItemCell)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI12TextItemCell)initWithFrame:(CGRect)a3;
- (void)didTapDoneWithSender:(id)a3;
- (void)textViewDidChange:(id)a3;
@end

@implementation TextItemCell

- (_TtC19HealthMedicationsUI12TextItemCell)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI12TextItemCell *)sub_1C2026240(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI12TextItemCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI12TextItemCell____lazy_storage___textView) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI12TextItemCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  id v5 = a3;

  result = (_TtC19HealthMedicationsUI12TextItemCell *)sub_1C214B910();
  __break(1u);
  return result;
}

- (void)didTapDoneWithSender:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = sub_1C2025EC4();
  objc_msgSend(v6, sel_resignFirstResponder);
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v9 = sub_1C214A5F0();
  unint64_t v11 = v10;
  id v12 = a3;
  v13 = self;
  LOBYTE(length) = sub_1C202704C(v12, location, length, v9, v11);

  swift_bridgeObjectRelease();
  return length & 1;
}

- (void)textViewDidChange:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1C2027650(v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI12TextItemCell____lazy_storage___textView));
  sub_1C1F23854((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI12TextItemCell_item, (unint64_t *)&qword_1EBF0C300, (unint64_t *)&qword_1EBF0C2F0);
}

@end