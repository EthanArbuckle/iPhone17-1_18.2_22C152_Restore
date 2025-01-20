@interface PDFAsyncConfigurationViewController
- (_TtC18HealthExperienceUI35PDFAsyncConfigurationViewController)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI35PDFAsyncConfigurationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)dealloc;
- (void)didPinchPDF:(id)a3;
- (void)didTapCancel:(id)a3;
- (void)didTapSave:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation PDFAsyncConfigurationViewController

- (_TtC18HealthExperienceUI35PDFAsyncConfigurationViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  _s18HealthExperienceUI35PDFAsyncConfigurationViewControllerC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)dealloc
{
  if (*(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI35PDFAsyncConfigurationViewController_currentTask))
  {
    id v3 = self;
    swift_retain();
    sub_1AD73F640();
    swift_release();
  }
  else
  {
    v4 = self;
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PDFAsyncConfigurationViewController();
  [(PDFAsyncConfigurationViewController *)&v5 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI35PDFAsyncConfigurationViewController____lazy_storage___cancelBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI35PDFAsyncConfigurationViewController____lazy_storage___actionBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI35PDFAsyncConfigurationViewController____lazy_storage___tableView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI35PDFAsyncConfigurationViewController____lazy_storage___collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI35PDFAsyncConfigurationViewController____lazy_storage___scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI35PDFAsyncConfigurationViewController_pinchAnimationBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI35PDFAsyncConfigurationViewController_pinchAnimationView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI35PDFAsyncConfigurationViewController_pinchedPageImageView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI35PDFAsyncConfigurationViewController____lazy_storage___pdfHeightConstraint));
  sub_1AD6BB5F4(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC18HealthExperienceUI35PDFAsyncConfigurationViewController_state), *((unsigned char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC18HealthExperienceUI35PDFAsyncConfigurationViewController_state));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI35PDFAsyncConfigurationViewController_previewDataSource));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI35PDFAsyncConfigurationViewController_configurationDataSource);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1AD6B4944();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_1AD6B5258();
}

- (void)didTapCancel:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1AD7404B0();
  swift_unknownObjectRelease();
  [(PDFAsyncConfigurationViewController *)v4 dismissViewControllerAnimated:1 completion:0];

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (void)didTapSave:(id)a3
{
  uint64_t v5 = (char *)a3;
  v4 = self;
  sub_1AD6B5758(v5);
}

- (_TtC18HealthExperienceUI35PDFAsyncConfigurationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC18HealthExperienceUI35PDFAsyncConfigurationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v6 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC18HealthExperienceUI35PDFAsyncConfigurationViewController_configurationDataSource);
  uint64_t v7 = v6[3];
  uint64_t v8 = v6[4];
  __swift_project_boxed_opaque_existential_1(v6, v7);
  v9 = *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8);
  id v10 = a3;
  v11 = self;
  int64_t v12 = v9(v7, v8);

  return v12;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1AD73A860();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD73A7E0();
  id v10 = a3;
  v11 = self;
  id v12 = PDFAsyncConfigurationViewController.tableView(_:cellForRowAt:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1AD73A860();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD73A7E0();
  id v10 = a3;
  v11 = self;
  id v12 = (void *)sub_1AD73A7C0();
  objc_msgSend(v10, sel_deselectRowAtIndexPath_animated_, v12, 1);

  uint64_t v13 = *(uint64_t *)((char *)&v11->super._overrideTransitioningDelegate
                   + OBJC_IVAR____TtC18HealthExperienceUI35PDFAsyncConfigurationViewController_configurationDataSource);
  uint64_t v14 = *(uint64_t *)((char *)&v11->super._view
                   + OBJC_IVAR____TtC18HealthExperienceUI35PDFAsyncConfigurationViewController_configurationDataSource);
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&v11->super.super.super.isa+ OBJC_IVAR____TtC18HealthExperienceUI35PDFAsyncConfigurationViewController_configurationDataSource), v13);
  uint64_t v15 = sub_1AD73A800();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 32))(v15, v13, v14);
  sub_1AD6B5FA0();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)didPinchPDF:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1AD6B87C8(v4);
}

@end