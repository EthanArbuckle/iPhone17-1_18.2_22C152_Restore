@interface SelectionOptionsCell
- (_TtC19HealthMedicationsUI20SelectionOptionsCell)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI20SelectionOptionsCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)switchValueChanged:(id)a3;
@end

@implementation SelectionOptionsCell

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_1C2149970();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2149960();
  v8 = self;
  sub_1C20A9FA0();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)switchValueChanged:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1C20AA814();
}

- (_TtC19HealthMedicationsUI20SelectionOptionsCell)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI20SelectionOptionsCell *)SelectionOptionsCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI20SelectionOptionsCell)initWithCoder:(id)a3
{
  return (_TtC19HealthMedicationsUI20SelectionOptionsCell *)SelectionOptionsCell.init(coder:)(a3);
}

- (void).cxx_destruct
{
  sub_1C20AB430((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI20SelectionOptionsCell_item, (unint64_t *)&qword_1EBF0C300, (uint64_t (*)(uint64_t))sub_1C1F1CB5C);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI20SelectionOptionsCell____lazy_storage___cellSwitch));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI20SelectionOptionsCell____lazy_storage___selectedImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI20SelectionOptionsCell____lazy_storage___notSelectedImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI20SelectionOptionsCell____lazy_storage___accessoryImageView));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI20SelectionOptionsCell_defaultBackgroundColor);
}

@end