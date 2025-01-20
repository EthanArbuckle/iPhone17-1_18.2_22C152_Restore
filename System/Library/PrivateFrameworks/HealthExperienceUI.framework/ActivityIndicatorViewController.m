@interface ActivityIndicatorViewController
- (_TtC18HealthExperienceUI31ActivityIndicatorViewController)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI31ActivityIndicatorViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didTapCancel:(id)a3;
- (void)viewDidLoad;
@end

@implementation ActivityIndicatorViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1AD4042A0();
}

- (void)didTapCancel:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1AD7404B0();
  swift_unknownObjectRelease();
  [(ActivityIndicatorViewController *)v4 dismissViewControllerAnimated:1 completion:0];

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (_TtC18HealthExperienceUI31ActivityIndicatorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC18HealthExperienceUI31ActivityIndicatorViewController____lazy_storage___activityIndicatorView) = 0;
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC18HealthExperienceUI31ActivityIndicatorViewController____lazy_storage___cancelBarButtonItem) = 0;
    id v6 = a4;
    v7 = (void *)sub_1AD73F180();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC18HealthExperienceUI31ActivityIndicatorViewController____lazy_storage___activityIndicatorView) = 0;
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC18HealthExperienceUI31ActivityIndicatorViewController____lazy_storage___cancelBarButtonItem) = 0;
    id v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for ActivityIndicatorViewController();
  v9 = [(ActivityIndicatorViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC18HealthExperienceUI31ActivityIndicatorViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI31ActivityIndicatorViewController____lazy_storage___activityIndicatorView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI31ActivityIndicatorViewController____lazy_storage___cancelBarButtonItem) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ActivityIndicatorViewController();
  return [(ActivityIndicatorViewController *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI31ActivityIndicatorViewController____lazy_storage___activityIndicatorView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI31ActivityIndicatorViewController____lazy_storage___cancelBarButtonItem);
}

@end