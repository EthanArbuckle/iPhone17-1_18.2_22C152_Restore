@interface HomePodSetupIconContentViewController
- (_TtC14HDSViewService37HomePodSetupIconContentViewController)initWithContentView:(id)a3;
- (void)feedbackDraftViewController:(id)a3 didCompleteWithFeedbackID:(id)a4;
- (void)feedbackDraftViewController:(id)a3 didFailToAttachURL:(id)a4 error:(int64_t)a5;
- (void)feedbackDraftViewController:(id)a3 didFailToStartWithError:(int64_t)a4;
- (void)feedbackDraftViewController:(id)a3 didFailToSubmitFeedback:(id)a4;
- (void)feedbackDraftViewControllerDidCancel:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HomePodSetupIconContentViewController

- (_TtC14HDSViewService37HomePodSetupIconContentViewController)initWithContentView:(id)a3
{
  id v4 = a3;
  return (_TtC14HDSViewService37HomePodSetupIconContentViewController *)sub_100041198(a3);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100041344();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HomePodSetupIconContentViewController();
  id v4 = v5.receiver;
  [(HomePodSetupIconContentViewController *)&v5 viewDidAppear:v3];
  if (swift_unknownObjectWeakLoadStrong())
  {
    sub_10007E75C();

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  sub_100043DDC(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v4 = self;
  sub_1000443D8(a3);
}

- (void).cxx_destruct
{
  sub_10001371C((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService37HomePodSetupIconContentViewController_presenter]);

  sub_10000F674((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService37HomePodSetupIconContentViewController_viewModel], &qword_1000EF130);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  BOOL v3 = *(void **)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService37HomePodSetupIconContentViewController_myContentView];
}

- (void)feedbackDraftViewController:(id)a3 didCompleteWithFeedbackID:(id)a4
{
}

- (void)feedbackDraftViewController:(id)a3 didFailToStartWithError:(int64_t)a4
{
}

- (void)feedbackDraftViewControllerDidCancel:(id)a3
{
}

- (void)feedbackDraftViewController:(id)a3 didFailToAttachURL:(id)a4 error:(int64_t)a5
{
  uint64_t v5 = type metadata accessor for URL();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v9 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  sub_1000492F8();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)feedbackDraftViewController:(id)a3 didFailToSubmitFeedback:(id)a4
{
}

@end