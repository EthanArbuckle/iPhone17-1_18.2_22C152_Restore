@interface MedmojiPickerViewController
- (_TtC19HealthMedicationsUI27MedmojiPickerViewController)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI27MedmojiPickerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)cancelButtonTappped:(id)a3;
- (void)colorButtonTappped:(id)a3;
- (void)doneButtonTappped:(id)a3;
- (void)shapeButtonTappped:(id)a3;
- (void)viewDidLoad;
@end

@implementation MedmojiPickerViewController

- (_TtC19HealthMedicationsUI27MedmojiPickerViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C20A7ED4();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1C20A4DB0();
}

- (void)cancelButtonTappped:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI27MedmojiPickerViewController_delegate;
  if (MEMORY[0x1C8754850]((char *)self + OBJC_IVAR____TtC19HealthMedicationsUI27MedmojiPickerViewController_delegate, a2))
  {
    uint64_t v5 = *((void *)v4 + 1);
    uint64_t ObjectType = swift_getObjectType();
    v7 = *(void (**)(uint64_t, uint64_t))(v5 + 16);
    id v8 = a3;
    v9 = self;
    v7(ObjectType, v5);
    swift_unknownObjectRelease();
  }
  else
  {
    id v10 = a3;
    v11 = self;
  }
  [(MedmojiPickerViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)doneButtonTappped:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1C20A886C();
}

- (void)shapeButtonTappped:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1C20A6F1C();
}

- (void)colorButtonTappped:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1C20A6F38();
}

- (_TtC19HealthMedicationsUI27MedmojiPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC19HealthMedicationsUI27MedmojiPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI27MedmojiPickerViewController____lazy_storage___medicationView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI27MedmojiPickerViewController_shapeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI27MedmojiPickerViewController_colorButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI27MedmojiPickerViewController____lazy_storage___medmojiCategorySelectionView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI27MedmojiPickerViewController____lazy_storage___shapeSelectionViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI27MedmojiPickerViewController____lazy_storage___colorSelectionViewController));
  sub_1C1F2E220((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI27MedmojiPickerViewController_delegate);
  swift_bridgeObjectRelease();
  sub_1C20A7654((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI27MedmojiPickerViewController_config, (unint64_t *)&qword_1EBF0B690, MEMORY[0x1E4F66C80]);
}

@end