@interface DraftingExtensionViewController
- (_TtC8Feedback31DraftingExtensionViewController)initWithCoder:(id)a3;
- (_TtC8Feedback31DraftingExtensionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)controller:(id)a3 didAttachLocalFile:(id)a4;
- (void)controller:(id)a3 didClickSwitchAccountsWithCurrentUser:(id)a4;
- (void)controller:(id)a3 didFailToLoadDraftWithError:(id)a4;
- (void)controller:(id)a3 didFinishLoadingDraft:(id)a4 devicesController:(id)a5 draftingController:(id)a6;
- (void)controller:(id)a3 didFinishSubmissionWithError:(id)a4;
- (void)controller:(id)a3 didRequestDismissalWithSavedDraft:(BOOL)a4;
- (void)controllerDidRequestFullScreenWithController:(id)a3;
- (void)controllerWillResignFirstActive:(id)a3;
- (void)deleteDraft;
- (void)saveDraftWithIsClosing:(BOOL)a3;
- (void)setFeedbackForm:(id)a3 reply:(id)a4;
- (void)setShowsCompletionPage:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation DraftingExtensionViewController

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_23CF60490(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DraftingExtensionViewController();
  id v4 = v5.receiver;
  [(DraftingExtensionViewController *)&v5 viewDidAppear:v3];
  sub_23D003E38();
  sub_23CF62614();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_23CF60D34();
}

- (_TtC8Feedback31DraftingExtensionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_23D005948();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC8Feedback31DraftingExtensionViewController *)DraftingExtensionViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC8Feedback31DraftingExtensionViewController)initWithCoder:(id)a3
{
  return (_TtC8Feedback31DraftingExtensionViewController *)DraftingExtensionViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Feedback31DraftingExtensionViewController_form));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Feedback31DraftingExtensionViewController_formStub));
  sub_23CEE93B4(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8Feedback31DraftingExtensionViewController_setFeedbackFormReply));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Feedback31DraftingExtensionViewController_feedbackDraftNavigationController));
  swift_unknownObjectWeakDestroy();
  sub_23CF6B6E4((uint64_t)self + OBJC_IVAR____TtC8Feedback31DraftingExtensionViewController_localClient);
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Feedback31DraftingExtensionViewController_bugFormTableViewController);
}

- (void)setShowsCompletionPage:(BOOL)a3
{
  id v4 = self;
  sub_23CF65BA0(a3, (uint64_t)&unk_26F0CCC90, (uint64_t)sub_23CF6B578, (uint64_t)&block_descriptor_56);
}

- (void)saveDraftWithIsClosing:(BOOL)a3
{
  id v4 = self;
  sub_23CF65BA0(a3, (uint64_t)&unk_26F0CCC18, (uint64_t)sub_23CF6B56C, (uint64_t)&block_descriptor_47);
}

- (void)deleteDraft
{
  v2 = self;
  sub_23CF65F9C();
}

- (void)setFeedbackForm:(id)a3 reply:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  DraftingExtensionViewController.setFeedbackForm(_:reply:)(v8, (uint64_t)sub_23CF6B4BC, v7);

  swift_release();
}

- (void)controller:(id)a3 didClickSwitchAccountsWithCurrentUser:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_23CF6A1C4(v7);
}

- (void)controller:(id)a3 didFinishLoadingDraft:(id)a4 devicesController:(id)a5 draftingController:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = self;
  sub_23CF6A3B8(v11, a5, v13);
}

- (void)controller:(id)a3 didAttachLocalFile:(id)a4
{
  id v6 = a3;
  id v7 = (void (*)(char *, char *, uint64_t))a4;
  id v8 = self;
  sub_23CF6A470(v7);
}

- (void)controllerWillResignFirstActive:(id)a3
{
  uint64_t v4 = qword_268BCCC40;
  id v10 = a3;
  uint64_t v5 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_23D004498();
  __swift_project_value_buffer(v6, (uint64_t)qword_268BCE6B8);
  id v7 = sub_23D004478();
  os_log_type_t v8 = sub_23D005CB8();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_23CEE3000, v7, v8, "Will resign first active", v9, 2u);
    MEMORY[0x23ECF6610](v9, -1, -1);
  }
}

- (void)controller:(id)a3 didFinishSubmissionWithError:(id)a4
{
  id v6 = a3;
  id v7 = self;
  id v8 = a4;
  DraftingExtensionViewController.controller(_:didFinishSubmissionWithError:)(v6, a4);
}

- (void)controller:(id)a3 didFailToLoadDraftWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  id v7 = self;
  sub_23CF6AEE8(v8);
}

- (void)controller:(id)a3 didRequestDismissalWithSavedDraft:(BOOL)a4
{
  id v6 = a3;
  id v7 = self;
  sub_23CF6B120(a4);
}

- (void)controllerDidRequestFullScreenWithController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  _s8Feedback31DraftingExtensionViewControllerC30controllerDidRequestFullScreen4withySo015FBKBugFormTabledE0C_tF_0();
}

@end