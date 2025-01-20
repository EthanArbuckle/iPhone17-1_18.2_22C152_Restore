@interface PreviewSharedProfileOverviewViewController
- (_TtC18HealthExperienceUI42PreviewSharedProfileOverviewViewController)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI42PreviewSharedProfileOverviewViewController)initWithCollectionViewLayout:(id)a3;
- (void)doneButtonTapped:(id)a3;
- (void)ttrButtonTapped;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation PreviewSharedProfileOverviewViewController

- (_TtC18HealthExperienceUI42PreviewSharedProfileOverviewViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AD2AB244();
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PreviewSharedProfileOverviewViewController();
  id v2 = v6.receiver;
  [(CompoundDataSourceCollectionViewController *)&v6 viewDidLoad];
  id v3 = objc_msgSend(v2, sel_collectionView, v6.receiver, v6.super_class);
  if (v3)
  {
    v4 = v3;
    id v5 = objc_msgSend(self, sel_clearColor);
    objc_msgSend(v4, sel_setBackgroundColor_, v5);

    sub_1AD2AA640();
  }
  else
  {
    __break(1u);
  }
}

- (void)viewWillLayoutSubviews
{
  id v2 = self;
  sub_1AD2AA48C();
}

- (void)doneButtonTapped:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1AD7404B0();
  swift_unknownObjectRelease();
  [(PreviewSharedProfileOverviewViewController *)v4 dismissViewControllerAnimated:1 completion:0];

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (_TtC18HealthExperienceUI42PreviewSharedProfileOverviewViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC18HealthExperienceUI42PreviewSharedProfileOverviewViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI42PreviewSharedProfileOverviewViewController_gradientView));
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC18HealthExperienceUI42PreviewSharedProfileOverviewViewController_gradientColorProvider);
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI42PreviewSharedProfileOverviewViewController____lazy_storage___previewSummariesLabel);
}

- (void)ttrButtonTapped
{
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = self;
  v4 = self;
  sub_1AD5DCA34(0xD000000000000016, 0x80000001AD791300, (uint64_t)sub_1AD5DD640, v3);

  swift_release();
}

@end