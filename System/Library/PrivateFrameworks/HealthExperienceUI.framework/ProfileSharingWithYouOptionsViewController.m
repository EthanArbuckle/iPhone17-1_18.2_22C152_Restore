@interface ProfileSharingWithYouOptionsViewController
- (_TtC18HealthExperienceUI42ProfileSharingWithYouOptionsViewController)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI42ProfileSharingWithYouOptionsViewController)initWithCollectionViewLayout:(id)a3;
- (void)dismissOptions:(id)a3;
- (void)viewDidLoad;
@end

@implementation ProfileSharingWithYouOptionsViewController

- (_TtC18HealthExperienceUI42ProfileSharingWithYouOptionsViewController)initWithCoder:(id)a3
{
  result = (_TtC18HealthExperienceUI42ProfileSharingWithYouOptionsViewController *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ProfileSharingWithYouOptionsViewController();
  id v2 = v3.receiver;
  [(CompoundDataSourceCollectionViewController *)&v3 viewDidLoad];
  sub_1AD484FC4();
}

- (void)dismissOptions:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1AD7404B0();
  swift_unknownObjectRelease();
  [(ProfileSharingWithYouOptionsViewController *)v4 dismissViewControllerAnimated:1 completion:0];

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (_TtC18HealthExperienceUI42ProfileSharingWithYouOptionsViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC18HealthExperienceUI42ProfileSharingWithYouOptionsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end