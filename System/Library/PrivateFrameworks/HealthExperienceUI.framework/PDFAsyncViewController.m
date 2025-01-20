@interface PDFAsyncViewController
- (Class)classForPage;
- (_TtC18HealthExperienceUI22PDFAsyncViewController)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI22PDFAsyncViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dealloc;
- (void)didTapDone;
- (void)didTapShare:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PDFAsyncViewController

- (_TtC18HealthExperienceUI22PDFAsyncViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  _s18HealthExperienceUI22PDFAsyncViewControllerC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)dealloc
{
  v2 = self;
  PDFAsyncViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI22PDFAsyncViewController_pdfFileNameProvider);
  sub_1AD4B9B44(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC18HealthExperienceUI22PDFAsyncViewController_shareButtonBehavior), *(void *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC18HealthExperienceUI22PDFAsyncViewController_shareButtonBehavior), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC18HealthExperienceUI22PDFAsyncViewController_shareButtonBehavior), *(uint64_t *)((char *)&self->super._overrideTransitioningDelegate+ OBJC_IVAR____TtC18HealthExperienceUI22PDFAsyncViewController_shareButtonBehavior), *(uint64_t *)((char *)&self->super._view+ OBJC_IVAR____TtC18HealthExperienceUI22PDFAsyncViewController_shareButtonBehavior), *(uint64_t *)((char *)&self->super._tabBarItem+ OBJC_IVAR____TtC18HealthExperienceUI22PDFAsyncViewController_shareButtonBehavior));
  sub_1AD4BA044((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI22PDFAsyncViewController_configuration);
  sub_1AD24D3D8((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI22PDFAsyncViewController_analyticsDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI22PDFAsyncViewController_shareItemSource));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI22PDFAsyncViewController____lazy_storage___spinner));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI22PDFAsyncViewController____lazy_storage___pdfView);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1AD4B69D8();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for PDFAsyncViewController();
  [(PDFAsyncViewController *)&v4 viewWillAppear:v3];
}

- (void)didTapDone
{
}

- (void)didTapShare:(id)a3
{
  swift_unknownObjectRetain();
  objc_super v4 = self;
  sub_1AD7404B0();
  swift_unknownObjectRelease();
  sub_1AD4B86DC((uint64_t)v5);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
}

- (Class)classForPage
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC18HealthExperienceUI22PDFAsyncViewController_pageNumberFormat);
  if (v2)
  {
    if (v2 == 1) {
      type metadata accessor for PDFPageNumberedPage();
    }
  }
  else
  {
    sub_1AD2147D4(0, &qword_1E9A2FBA0);
  }
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC18HealthExperienceUI22PDFAsyncViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC18HealthExperienceUI22PDFAsyncViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end