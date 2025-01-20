@interface IdentityProofingReviewSubmissionViewController
- (_TtC9CoreIDVUI46IdentityProofingReviewSubmissionViewController)initWithCoder:(id)a3;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)updateUI;
- (void)updateViewLayout:(id)a3 previousTraitCollection:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation IdentityProofingReviewSubmissionViewController

- (_TtC9CoreIDVUI46IdentityProofingReviewSubmissionViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_21F508A44();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_21F502B4C(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for IdentityProofingReviewSubmissionViewController();
  id v4 = v6.receiver;
  [(IdentityProofingReviewSubmissionViewController *)&v6 viewDidDisappear:v3];
  v5 = sub_21F529DBC();
  sub_21F4EF10C(0);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_21F502E94();
}

- (void)updateViewLayout:(id)a3 previousTraitCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_21F52F500(a4);
  id v9 = sub_21F5029EC();
  sub_21F52D608(v9);
}

- (void)updateUI
{
  v2 = self;
  sub_21F503C50();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super._responderFlags
                     + OBJC_IVAR____TtC9CoreIDVUI46IdentityProofingReviewSubmissionViewController_viewConfiguration));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI46IdentityProofingReviewSubmissionViewController_context));
  swift_release();
  sub_21F47F01C(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC9CoreIDVUI46IdentityProofingReviewSubmissionViewController_unboundACL), *(void *)((char *)&self->super.super.super._responderFlags+ OBJC_IVAR____TtC9CoreIDVUI46IdentityProofingReviewSubmissionViewController_unboundACL));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9CoreIDVUI46IdentityProofingReviewSubmissionViewController____lazy_storage___tableView);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v4 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC9CoreIDVUI46IdentityProofingReviewSubmissionViewController_documentsToBeReviewed);
  if (v4) {
    return *(void *)(v4 + 16);
  }
  else {
    return 0;
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_21F54EC80();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21F54EC50();
  id v10 = a3;
  v11 = self;
  id v12 = sub_21F507CB8(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v4 = sub_21F54EC80();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21F54EC50();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return 60.0;
}

@end