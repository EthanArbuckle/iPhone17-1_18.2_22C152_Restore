@interface ClinicalSharingOnboardingTileViewController
- (_TtC13HealthRecords43ClinicalSharingOnboardingTileViewController)initWithCoder:(id)a3;
- (_TtC13HealthRecords43ClinicalSharingOnboardingTileViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didAddAccount:(id)a3;
- (void)viewDidLoad;
@end

@implementation ClinicalSharingOnboardingTileViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_2408AC5E8();
}

- (void)didAddAccount:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2408ACD5C();
}

- (_TtC13HealthRecords43ClinicalSharingOnboardingTileViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_2409547C8();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC13HealthRecords43ClinicalSharingOnboardingTileViewController *)sub_2408ACFC4(v5, v7, a4);
}

- (_TtC13HealthRecords43ClinicalSharingOnboardingTileViewController)initWithCoder:(id)a3
{
  return (_TtC13HealthRecords43ClinicalSharingOnboardingTileViewController *)sub_2408AD144(a3);
}

- (void).cxx_destruct
{
  sub_240851CE8((uint64_t)self + OBJC_IVAR____TtC13HealthRecords43ClinicalSharingOnboardingTileViewController_context, (unint64_t *)&qword_26AFCF770, (unint64_t *)&qword_26AFCF760);
  swift_bridgeObjectRelease();
  sub_240851CE8((uint64_t)self+ OBJC_IVAR____TtC13HealthRecords43ClinicalSharingOnboardingTileViewController____lazy_storage___factory, &qword_268C90810, (unint64_t *)&unk_268C911C0);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13HealthRecords43ClinicalSharingOnboardingTileViewController_profile));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC13HealthRecords43ClinicalSharingOnboardingTileViewController____lazy_storage___label);
}

@end