@interface EducationPreviewViewController
- (_TtC15HealthRecordsUI30EducationPreviewViewController)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI30EducationPreviewViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation EducationPreviewViewController

- (_TtC15HealthRecordsUI30EducationPreviewViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI30EducationPreviewViewController____lazy_storage___conceptTitleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI30EducationPreviewViewController____lazy_storage___educationContentLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI30EducationPreviewViewController____lazy_storage___attributionLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI30EducationPreviewViewController____lazy_storage___stackView) = 0;
  id v4 = a3;

  result = (_TtC15HealthRecordsUI30EducationPreviewViewController *)sub_1C25505F0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1C2545C84();
}

- (_TtC15HealthRecordsUI30EducationPreviewViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC15HealthRecordsUI30EducationPreviewViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI30EducationPreviewViewController_userConcept));
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI30EducationPreviewViewController_educationContentProviding);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI30EducationPreviewViewController____lazy_storage___conceptTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI30EducationPreviewViewController____lazy_storage___educationContentLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI30EducationPreviewViewController____lazy_storage___attributionLabel));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15HealthRecordsUI30EducationPreviewViewController____lazy_storage___stackView);
}

@end