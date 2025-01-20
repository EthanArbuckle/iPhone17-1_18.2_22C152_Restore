@interface FeedbackController
- (void)feedbackDraftViewController:(id)a3 didCompleteWithFeedbackID:(id)a4;
- (void)feedbackDraftViewController:(id)a3 didFailToAttachURL:(id)a4 error:(int64_t)a5;
- (void)feedbackDraftViewController:(id)a3 didFailToStartWithError:(int64_t)a4;
- (void)feedbackDraftViewController:(id)a3 didFailToSubmitFeedback:(id)a4;
- (void)feedbackDraftViewControllerDidCancel:(id)a3;
@end

@implementation FeedbackController

- (void)feedbackDraftViewController:(id)a3 didCompleteWithFeedbackID:(id)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v7 = v6;
  id v8 = a3;
  swift_retain();
  sub_100004F54(v5, v7);

  swift_release();

  swift_bridgeObjectRelease();
}

- (void)feedbackDraftViewController:(id)a3 didFailToStartWithError:(int64_t)a4
{
  id v4 = a3;
  swift_retain();
  sub_10000516C();

  swift_release();
}

- (void)feedbackDraftViewController:(id)a3 didFailToAttachURL:(id)a4 error:(int64_t)a5
{
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  swift_retain();
  sub_1000053AC((uint64_t)v9);

  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)feedbackDraftViewControllerDidCancel:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_100005718();

  swift_release();
}

- (void)feedbackDraftViewController:(id)a3 didFailToSubmitFeedback:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  swift_retain();
  sub_100005860(v6);

  swift_release();
}

@end