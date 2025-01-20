@interface InternalFeedItemDetailViewController
- (_TtC18HealthExperienceUI36InternalFeedItemDetailViewController)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI36InternalFeedItemDetailViewController)initWithCollectionViewLayout:(id)a3;
- (void)didTapDone:(id)a3;
- (void)viewDidLoad;
@end

@implementation InternalFeedItemDetailViewController

- (_TtC18HealthExperienceUI36InternalFeedItemDetailViewController)initWithCoder:(id)a3
{
  result = (_TtC18HealthExperienceUI36InternalFeedItemDetailViewController *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1AD2E5634();
}

- (void)didTapDone:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1AD7404B0();
  swift_unknownObjectRelease();
  [(InternalFeedItemDetailViewController *)v4 dismissViewControllerAnimated:1 completion:0];

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (_TtC18HealthExperienceUI36InternalFeedItemDetailViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC18HealthExperienceUI36InternalFeedItemDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI36InternalFeedItemDetailViewController_feedItem));
}

@end