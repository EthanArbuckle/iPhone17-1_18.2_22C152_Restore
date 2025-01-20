@interface DosageCollectionViewCell
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldBeginEditing:(id)a3;
- (BOOL)textFieldShouldEndEditing:(id)a3;
- (_TtC19HealthMedicationsUI24DosageCollectionViewCell)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI24DosageCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)doneTapped;
- (void)textFieldChanged:(id)a3;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)timePickerChanged:(id)a3;
- (void)valueLabelTapped:(id)a3;
@end

@implementation DosageCollectionViewCell

- (_TtC19HealthMedicationsUI24DosageCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI24DosageCollectionViewCell *)sub_1C20CA944(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI24DosageCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  _s19HealthMedicationsUI24DosageCollectionViewCellC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)timePickerChanged:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C20CE580();
}

- (void)textFieldChanged:(id)a3
{
  id v5 = a3;
  id v4 = self;
  sub_1C20CC3F8(v5);
}

- (void)valueLabelTapped:(id)a3
{
  id v6 = a3;
  id v4 = self;
  id v5 = sub_1C20CA2A8();
  objc_msgSend(v5, sel_becomeFirstResponder);
}

- (void)doneTapped
{
  id v3 = self;
  id v2 = sub_1C20CA2A8();
  objc_msgSend(v2, sel_resignFirstResponder);
}

- (void).cxx_destruct
{
  sub_1C20D20C4((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI24DosageCollectionViewCell_currentDosage, &qword_1EA2C5650, (uint64_t (*)(uint64_t))type metadata accessor for Dosage);
  swift_bridgeObjectRelease();
  sub_1C20D1348((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI24DosageCollectionViewCell_item, (uint64_t (*)(void))sub_1C1F24488);
  id v3 = (uint64_t (*)(uint64_t))MEMORY[0x1E4FB0E68];
  sub_1C20D20C4((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI24DosageCollectionViewCell____lazy_storage___deleteAccessory, &qword_1EBF0C618, MEMORY[0x1E4FB0E68]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI24DosageCollectionViewCell_timePicker));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI24DosageCollectionViewCell____lazy_storage___toolbar));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI24DosageCollectionViewCell____lazy_storage___valueField));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI24DosageCollectionViewCell____lazy_storage___valueLabel));
  sub_1C20D20C4((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI24DosageCollectionViewCell____lazy_storage___spacerAccessory, &qword_1EBF0C618, v3);

  swift_bridgeObjectRelease();
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LOBYTE(self) = _s19HealthMedicationsUI24DosageCollectionViewCellC27textFieldShouldBeginEditingySbSo06UITextI0CF_0();

  return self & 1;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4 = a3;
  id v5 = self;
  _s19HealthMedicationsUI24DosageCollectionViewCellC24textFieldDidBeginEditingyySo06UITextI0CF_0(v4);
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  sub_1C214A5F0();
  id v9 = a3;
  v10 = self;
  LOBYTE(length) = _s19HealthMedicationsUI24DosageCollectionViewCellC9textField_24shouldChangeCharactersIn17replacementStringSbSo06UITextI0C_So8_NSRangeVSStF_0(v9, location, length);

  swift_bridgeObjectRelease();
  return length & 1;
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4 = a3;
  id v5 = self;
  _s19HealthMedicationsUI24DosageCollectionViewCellC22textFieldDidEndEditingyySo06UITextI0CF_0();
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

@end