@interface FeedItemSuggestedActionViewController
- (_TtC18HealthExperienceUI37FeedItemSuggestedActionViewController)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI37FeedItemSuggestedActionViewController)initWithCollectionViewLayout:(id)a3;
- (_TtC18HealthExperienceUI37FeedItemSuggestedActionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation FeedItemSuggestedActionViewController

- (_TtC18HealthExperienceUI37FeedItemSuggestedActionViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI37FeedItemSuggestedActionViewController_dataSourceAdaptor) = 0;
  *(void *)((char *)&self->super.super.super._responderFlags
            + OBJC_IVAR____TtC18HealthExperienceUI37FeedItemSuggestedActionViewController_suggestedActionDelegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI37FeedItemSuggestedActionViewController____lazy_storage___dataSource) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI37FeedItemSuggestedActionViewController____lazy_storage___layout) = 0;
  id v5 = a3;

  result = (_TtC18HealthExperienceUI37FeedItemSuggestedActionViewController *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  swift_getObjectType();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FeedItemSuggestedActionViewController();
  v3 = self;
  [(FeedItemSuggestedActionViewController *)&v7 viewDidLoad];
  sub_1AD2B3FD4();
  sub_1AD1EEB90();
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1AD74C370;
  uint64_t v5 = sub_1AD73D540();
  uint64_t v6 = MEMORY[0x1E4FB1138];
  *(void *)(v4 + 32) = v5;
  *(void *)(v4 + 40) = v6;
  sub_1AD73FB70();

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1AD2B3E78();
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_1AD73A860();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD73A7E0();
  id v12 = a3;
  id v13 = a4;
  v14 = self;
  sub_1AD2B45E4();

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (_TtC18HealthExperienceUI37FeedItemSuggestedActionViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC18HealthExperienceUI37FeedItemSuggestedActionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC18HealthExperienceUI37FeedItemSuggestedActionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC18HealthExperienceUI37FeedItemSuggestedActionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  id v3 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI37FeedItemSuggestedActionViewController_suggestedAction;
  uint64_t v4 = sub_1AD73B7B0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI37FeedItemSuggestedActionViewController_pinnedContentManager);
  sub_1AD24D3D8((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI37FeedItemSuggestedActionViewController_suggestedActionDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI37FeedItemSuggestedActionViewController____lazy_storage___dataSource));
  uint64_t v5 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI37FeedItemSuggestedActionViewController____lazy_storage___layout);
}

@end