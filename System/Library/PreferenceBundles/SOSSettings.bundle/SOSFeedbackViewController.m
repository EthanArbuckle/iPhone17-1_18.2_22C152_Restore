@interface SOSFeedbackViewController
- (void)feedbackDraftViewController:(id)a3 didCompleteWithFeedbackID:(id)a4;
- (void)feedbackDraftViewController:(id)a3 didFailToAttachURL:(id)a4 error:(int64_t)a5;
- (void)feedbackDraftViewController:(id)a3 didFailToStartWithError:(int64_t)a4;
- (void)feedbackDraftViewController:(id)a3 didFailToSubmitFeedback:(id)a4;
- (void)feedbackDraftViewControllerDidCancel:(id)a3;
@end

@implementation SOSFeedbackViewController

- (void)feedbackDraftViewController:(id)a3 didCompleteWithFeedbackID:(id)a4
{
  uint64_t v6 = sub_F760();
  uint64_t v8 = v7;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v9 = *(void *)&self->delegate[8];
    uint64_t ObjectType = swift_getObjectType();
    v11 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 8);
    id v12 = a3;
    swift_retain();
    v11(v6, v8, ObjectType, v9);

    swift_release();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

- (void)feedbackDraftViewController:(id)a3 didFailToStartWithError:(int64_t)a4
{
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v6 = *(void *)&self->delegate[8];
    swift_getObjectType();
    id v7 = a3;
    swift_retain();
    uint64_t v8 = sub_F690();
    (*(void (**)(uint64_t))(v6 + 16))(v8);

    swift_release();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
}

- (void)feedbackDraftViewControllerDidCancel:(id)a3
{
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v5 = *(void *)&self->delegate[8];
    uint64_t ObjectType = swift_getObjectType();
    id v7 = *(void (**)(uint64_t, uint64_t))(v5 + 24);
    id v8 = a3;
    swift_retain();
    v7(ObjectType, v5);

    swift_release();
    swift_unknownObjectRelease();
  }
}

- (void)feedbackDraftViewController:(id)a3 didFailToAttachURL:(id)a4 error:(int64_t)a5
{
  uint64_t v7 = sub_F570();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_F560();
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v12 = *(void *)&self->delegate[8];
    uint64_t ObjectType = swift_getObjectType();
    id v14 = a3;
    swift_retain();
    uint64_t v15 = sub_F710();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 32))(v11, v15, v16, ObjectType, v12);

    swift_release();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

- (void)feedbackDraftViewController:(id)a3 didFailToSubmitFeedback:(id)a4
{
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v7 = *(void *)&self->delegate[8];
    uint64_t ObjectType = swift_getObjectType();
    id v9 = a3;
    id v10 = a4;
    swift_retain();
    id v11 = [v10 description];
    uint64_t v12 = sub_F760();
    uint64_t v14 = v13;

    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 40))(v12, v14, ObjectType, v7);
    swift_release();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
}

@end