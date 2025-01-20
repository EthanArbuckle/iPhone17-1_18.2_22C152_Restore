@interface HRPDFConfigurationViewController
- (HRPDFConfigurationViewController)initWithCoder:(id)a3;
- (HRPDFConfigurationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (HRPDFConfigurationViewController)initWithProfile:(id)a3 account:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)didPinchPDF:(id)a3;
- (void)didTapCancel:(id)a3;
- (void)didTapSave:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation HRPDFConfigurationViewController

- (HRPDFConfigurationViewController)initWithProfile:(id)a3 account:(id)a4
{
  memset(v10, 0, sizeof(v10));
  uint64_t v11 = 0;
  objc_allocWithZone((Class)type metadata accessor for PDFConfigurationViewController());
  id v6 = a3;
  id v7 = a4;
  v8 = (HRPDFConfigurationViewController *)PDFConfigurationViewController.init(profile:account:category:)(v6, a4, (uint64_t *)v10);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v8;
}

- (HRPDFConfigurationViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C233F8DC();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1C233976C();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PDFConfigurationViewController();
  id v4 = v6.receiver;
  [(HRPDFConfigurationViewController *)&v6 viewDidAppear:v3];
  if (qword_1EBB6D840 != -1) {
    swift_once();
  }
  char v5 = 11;
  sub_1C23CD65C(1, 13, 0, &v5, 0);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_1C233A54C();
}

- (void)didTapCancel:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  sub_1C25501E0();
  swift_unknownObjectRelease();
  [(HRPDFConfigurationViewController *)v4 dismissViewControllerAnimated:1 completion:0];

  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v5);
}

- (void)didTapSave:(id)a3
{
  id v4 = (uint8_t *)a3;
  uint64_t v5 = self;
  sub_1C233A9AC(v4);
}

- (HRPDFConfigurationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___HRPDFConfigurationViewController____lazy_storage___cancelBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___HRPDFConfigurationViewController____lazy_storage___actionBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___HRPDFConfigurationViewController____lazy_storage___tableView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___HRPDFConfigurationViewController____lazy_storage___collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___HRPDFConfigurationViewController____lazy_storage___scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___HRPDFConfigurationViewController_pinchAnimationBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___HRPDFConfigurationViewController_pinchAnimationView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___HRPDFConfigurationViewController_pinchedPageImageView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___HRPDFConfigurationViewController____lazy_storage___pdfHeightConstraint));
  sub_1C2340254(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___HRPDFConfigurationViewController_state), *(void *)((char *)&self->super.super._responderFlags + OBJC_IVAR___HRPDFConfigurationViewController_state), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity + OBJC_IVAR___HRPDFConfigurationViewController_state), *(uint64_t *)((char *)&self->super._overrideTransitioningDelegate + OBJC_IVAR___HRPDFConfigurationViewController_state));
  swift_unknownObjectUnownedDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___HRPDFConfigurationViewController_previewDataSource));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_1C2340108((uint64_t)self + OBJC_IVAR___HRPDFConfigurationViewController_pdfGenerationToken, (uint64_t)&qword_1EBB6EF00, MEMORY[0x1E4FBC840] + 8, MEMORY[0x1E4FBB718], (uint64_t (*)(void))sub_1C2340900);
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___HRPDFConfigurationViewController_queue);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1C254CD90();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C254CD40();
  id v10 = a3;
  uint64_t v11 = self;
  id v12 = PDFConfigurationViewController.tableView(_:cellForRowAt:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1C254CD90();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C254CD40();
  id v10 = a3;
  uint64_t v11 = self;
  id v12 = (void *)sub_1C254CD30();
  objc_msgSend(v10, sel_deselectRowAtIndexPath_animated_, v12, 1);

  id v13 = sub_1C245CE20((uint64_t)v9, v11);
  sub_1C233D5C4(v13);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)didPinchPDF:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1C233D9F0(v4);
}

@end