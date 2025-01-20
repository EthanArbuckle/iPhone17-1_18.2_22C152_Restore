@interface FBKFeedbackDraftViewController
- (_TtC8Feedback30FBKFeedbackDraftViewController)initWithCoder:(id)a3;
- (_TtC8Feedback30FBKFeedbackDraftViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dealloc;
- (void)didFailSubmissionWithError:(id)a3;
- (void)didRequestViewDismissalWithSaved:(BOOL)a3;
- (void)didRequestViewFullScreen;
- (void)draftDirtyStateUpdated:(BOOL)a3;
- (void)feedbackDidBeginSubmission;
- (void)feedbackDidCompleteWithResponseType:(int64_t)a3 responseID:(id)a4 completedForm:(id)a5;
- (void)feedbackDidFailToAttachURL:(id)a3 nsError:(id)a4;
- (void)feedbackRestartDidFailWithError:(id)a3;
@end

@implementation FBKFeedbackDraftViewController

- (_TtC8Feedback30FBKFeedbackDraftViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23CF8EE04();
}

- (void)dealloc
{
  v2 = self;
  FBKFeedbackDraftViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Feedback30FBKFeedbackDraftViewController_form));
  sub_23CF6B6E4((uint64_t)self + OBJC_IVAR____TtC8Feedback30FBKFeedbackDraftViewController_delegate);
  sub_23CF6B6E4((uint64_t)self + OBJC_IVAR____TtC8Feedback30FBKFeedbackDraftViewController_presentationDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Feedback30FBKFeedbackDraftViewController_extensionObserver));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Feedback30FBKFeedbackDraftViewController_extensionKitQueryDelegate));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Feedback30FBKFeedbackDraftViewController__xpcConnection);
}

- (_TtC8Feedback30FBKFeedbackDraftViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8Feedback30FBKFeedbackDraftViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)didRequestViewFullScreen
{
  v2 = self;
  FBKFeedbackDraftViewController.didRequestViewFullScreen()();
}

- (void)didRequestViewDismissalWithSaved:(BOOL)a3
{
  id v3 = self;
  _s8Feedback30FBKFeedbackDraftViewControllerC010didRequestD9Dismissal5savedySb_tF_0();
}

- (void)draftDirtyStateUpdated:(BOOL)a3
{
}

- (void)feedbackDidBeginSubmission
{
}

- (void)feedbackDidCompleteWithResponseType:(int64_t)a3 responseID:(id)a4 completedForm:(id)a5
{
  uint64_t v8 = sub_23D005948();
  uint64_t v10 = v9;
  id v11 = a5;
  v12 = self;
  FBKFeedbackDraftViewController.feedbackDidComplete(responseType:responseID:completedForm:)(a3, v8, v10, v11);

  swift_bridgeObjectRelease();
}

- (void)didFailSubmissionWithError:(id)a3
{
  id v4 = a3;
  v5 = self;
  FBKFeedbackDraftViewController.didFailSubmission(error:)(v4);
}

- (void)feedbackDidFailToAttachURL:(id)a3 nsError:(id)a4
{
  uint64_t v6 = sub_23D003CE8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23D003CA8();
  id v10 = a4;
  id v11 = self;
  FBKFeedbackDraftViewController.feedbackDidFailToAttachURL(_:nsError:)((uint64_t)v9, v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)feedbackRestartDidFailWithError:(id)a3
{
  id v4 = a3;
  v5 = self;
  FBKFeedbackDraftViewController.feedbackRestartDidFail(error:)((NSNumber)v4);
}

@end