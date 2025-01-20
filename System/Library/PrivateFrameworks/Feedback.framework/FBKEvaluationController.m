@interface FBKEvaluationController
- (_TtC8Feedback23FBKEvaluationController)init;
- (void)feedbackDraftViewController:(id)a3 didCompleteWithResponseType:(int64_t)a4 responseID:(id)a5;
- (void)feedbackDraftViewController:(id)a3 didFailToAttachURL:(id)a4 error:(int64_t)a5;
- (void)feedbackDraftViewController:(id)a3 didFailToStartWithError:(int64_t)a4;
- (void)feedbackDraftViewController:(id)a3 didFailToSubmitFeedback:(id)a4;
- (void)feedbackDraftViewControllerDidCancel:(id)a3;
- (void)feedbackDraftViewControllerDidLoadForm:(id)a3;
@end

@implementation FBKEvaluationController

- (_TtC8Feedback23FBKEvaluationController)init
{
  result = (_TtC8Feedback23FBKEvaluationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_23CF6B6E4((uint64_t)self + OBJC_IVAR____TtC8Feedback23FBKEvaluationController__delegate);
  v3 = (char *)self + OBJC_IVAR____TtC8Feedback23FBKEvaluationController__swiftUIDetent;
  uint64_t v4 = sub_23D004C18();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  sub_23CFD3F14(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC8Feedback23FBKEvaluationController___evaluation), self->_apiType[OBJC_IVAR____TtC8Feedback23FBKEvaluationController___evaluation]);
  sub_23CEE93B4(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC8Feedback23FBKEvaluationController___evaluationCompletionHandler));
  sub_23CEE8BB4((uint64_t)self + OBJC_IVAR____TtC8Feedback23FBKEvaluationController__subject, &qword_268BCD7D0);

  sub_23CEE8BB4((uint64_t)self + OBJC_IVAR____TtC8Feedback23FBKEvaluationController__formContext, &qword_268BCF730);
  sub_23CEE8BB4((uint64_t)self + OBJC_IVAR____TtC8Feedback23FBKEvaluationController__actionPerformed, &qword_268BCF728);
  v5 = (char *)self + OBJC_IVAR____TtC8Feedback23FBKEvaluationController___observationRegistrar;
  uint64_t v6 = sub_23D003E18();
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

- (void)feedbackDraftViewController:(id)a3 didCompleteWithResponseType:(int64_t)a4 responseID:(id)a5
{
  uint64_t v7 = sub_23D005948();
  uint64_t v9 = v8;
  id v10 = a3;
  v11 = self;
  sub_23CFD5734((uint64_t)v10, v7, v9);

  swift_bridgeObjectRelease();
}

- (void)feedbackDraftViewController:(id)a3 didFailToStartWithError:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  _s8Feedback23FBKEvaluationControllerC017feedbackDraftViewC0_23didFailToStartWithErroryAA011FBKFeedbackefC0C_AA08FBKDraftL0OtF_0();
}

- (void)feedbackDraftViewController:(id)a3 didFailToAttachURL:(id)a4 error:(int64_t)a5
{
  uint64_t v7 = sub_23D003CE8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  id v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23D003CA8();
  id v11 = a3;
  v12 = self;
  _s8Feedback23FBKEvaluationControllerC017feedbackDraftViewC0_18didFailToAttachURL5erroryAA011FBKFeedbackefC0C_10Foundation0K0VAA18FBKAttachmentErrorOtF_0((uint64_t)v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)feedbackDraftViewControllerDidCancel:(id)a3
{
  id v4 = a3;
  id v5 = self;
  FBKEvaluationController.feedbackDraftViewControllerDidCancel(_:)();
}

- (void)feedbackDraftViewController:(id)a3 didFailToSubmitFeedback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  FBKEvaluationController.feedbackDraftViewController(_:didFailToSubmitFeedback:)((uint64_t)v6, v7);
}

- (void)feedbackDraftViewControllerDidLoadForm:(id)a3
{
  id v4 = a3;
  id v5 = self;
  _s8Feedback23FBKEvaluationControllerC017feedbackDraftViewC11DidLoadFormyyAA011FBKFeedbackefC0CF_0();
}

@end