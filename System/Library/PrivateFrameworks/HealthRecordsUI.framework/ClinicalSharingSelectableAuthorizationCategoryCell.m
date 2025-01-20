@interface ClinicalSharingSelectableAuthorizationCategoryCell
- (_TtC15HealthRecordsUI50ClinicalSharingSelectableAuthorizationCategoryCell)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI50ClinicalSharingSelectableAuthorizationCategoryCell)initWithFrame:(CGRect)a3;
- (void)switchUpdated;
@end

@implementation ClinicalSharingSelectableAuthorizationCategoryCell

- (_TtC15HealthRecordsUI50ClinicalSharingSelectableAuthorizationCategoryCell)initWithFrame:(CGRect)a3
{
  return (_TtC15HealthRecordsUI50ClinicalSharingSelectableAuthorizationCategoryCell *)ClinicalSharingSelectableAuthorizationCategoryCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15HealthRecordsUI50ClinicalSharingSelectableAuthorizationCategoryCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI50ClinicalSharingSelectableAuthorizationCategoryCell_item;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((void *)v5 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI50ClinicalSharingSelectableAuthorizationCategoryCell_switchTrailingMargin) = (Class)0x4034000000000000;
  uint64_t v6 = OBJC_IVAR____TtC15HealthRecordsUI50ClinicalSharingSelectableAuthorizationCategoryCell_selectionSwitch;
  id v7 = objc_allocWithZone(MEMORY[0x1E4FB1CD0]);
  id v8 = a3;
  id v9 = objc_msgSend(v7, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v9, sel_setTranslatesAutoresizingMaskIntoConstraints_, 1);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v6) = (Class)v9;

  result = (_TtC15HealthRecordsUI50ClinicalSharingSelectableAuthorizationCategoryCell *)sub_1C25505F0();
  __break(1u);
  return result;
}

- (void)switchUpdated
{
  v2 = self;
  sub_1C2264CFC();
}

- (void).cxx_destruct
{
  sub_1C22666F0((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI50ClinicalSharingSelectableAuthorizationCategoryCell_item, (unint64_t *)&qword_1EA2E5330, (uint64_t (*)(uint64_t))sub_1C22270A8);
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC15HealthRecordsUI50ClinicalSharingSelectableAuthorizationCategoryCell_selectionSwitch);
}

@end