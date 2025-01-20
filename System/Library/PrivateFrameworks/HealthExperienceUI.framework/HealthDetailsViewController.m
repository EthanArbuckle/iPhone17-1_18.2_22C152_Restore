@interface HealthDetailsViewController
- (_TtC18HealthExperienceUI27HealthDetailsViewController)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI27HealthDetailsViewController)initWithCollectionViewLayout:(id)a3;
- (void)resetCharacteristics;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)viewDidLoad;
@end

@implementation HealthDetailsViewController

- (_TtC18HealthExperienceUI27HealthDetailsViewController)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC18HealthExperienceUI27HealthDetailsViewController_shouldSaveItems) = 1;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI27HealthDetailsViewController____lazy_storage___healthDetailsDataSource) = 0;
  id v4 = a3;

  result = (_TtC18HealthExperienceUI27HealthDetailsViewController *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1AD6D0848();
}

- (void)resetCharacteristics
{
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC18HealthExperienceUI27HealthDetailsViewController_shouldSaveItems) = 0;
  v2 = self;
  _s18HealthExperienceUI0A21DetailsViewControllerC10dataSource3forAA021CompoundSectionedDataH0CSo06UIViewF0C_tF_0();
  swift_retain();
  swift_release();
  sub_1AD582CC8();
  swift_release();
  [(HealthDetailsViewController *)v2 setEditing:0 animated:1];
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  v6 = self;
  sub_1AD6D0ABC(a3, a4);
}

- (_TtC18HealthExperienceUI27HealthDetailsViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC18HealthExperienceUI27HealthDetailsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI27HealthDetailsViewController_healthStore));
  swift_release();
}

@end