@interface InternalFeedItemListViewController
- (_TtC18HealthExperienceUI34InternalFeedItemListViewController)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI34InternalFeedItemListViewController)initWithCollectionViewLayout:(id)a3;
- (void)viewDidLoad;
@end

@implementation InternalFeedItemListViewController

- (_TtC18HealthExperienceUI34InternalFeedItemListViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI34InternalFeedItemListViewController_contentKinds) = (Class)MEMORY[0x1E4FBC860];
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for InternalFeedItemListViewController();
  return [(CompoundDataSourceCollectionViewController *)&v5 initWithCoder:a3];
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1AD463EA0();
}

- (_TtC18HealthExperienceUI34InternalFeedItemListViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC18HealthExperienceUI34InternalFeedItemListViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end