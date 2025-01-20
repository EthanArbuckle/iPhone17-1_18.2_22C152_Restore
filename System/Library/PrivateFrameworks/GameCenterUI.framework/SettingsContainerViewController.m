@interface SettingsContainerViewController
- (BOOL)canBeShownFromSuspendedState;
- (PSRootController)_rootController;
- (PSSpecifier)_specifier;
- (_TtC12GameCenterUI31SettingsContainerViewController)initWithCoder:(id)a3;
- (_TtC12GameCenterUI31SettingsContainerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)parentController;
- (id)readPreferenceValue:(id)a3;
- (id)rootController;
- (id)specifier;
- (void)dealloc;
- (void)handleURL:(id)a3 withCompletion:(id)a4;
- (void)onboardingFlowFinishedWithAction:(unint64_t)a3;
- (void)openAvatarEditor;
- (void)openPlayerProfileViewWithPlayerID:(id)a3;
- (void)photoPicker:(id)a3 didUpdatePhotoForContact:(id)a4 withContactImage:(id)a5;
- (void)photoPickerDidCancel:(id)a3;
- (void)setPreferenceValue:(id)a3 specifier:(id)a4;
- (void)setRootController:(id)a3;
- (void)setSpecifier:(id)a3;
- (void)set_rootController:(id)a3;
- (void)set_specifier:(id)a3;
- (void)signInController:(id)a3 didCompleteWithSuccess:(BOOL)a4 error:(id)a5;
- (void)signInControllerDidCancel:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SettingsContainerViewController

- (void)dealloc
{
  v2 = self;
  SettingsContainerViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI31SettingsContainerViewController_childViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI31SettingsContainerViewController_overlayView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI31SettingsContainerViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI31SettingsContainerViewController_onboardingNavigationController));
  sub_1AF368930(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC12GameCenterUI31SettingsContainerViewController_viewDidLayoutSubviewsCallback));
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI31SettingsContainerViewController__rootController));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12GameCenterUI31SettingsContainerViewController__specifier);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1AF439C98();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1AF43AC3C(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1AF43AEB0(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_1AF43AF60(a3);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_1AF43B054();
}

- (PSRootController)_rootController
{
  v2 = sub_1AF43B218();

  return (PSRootController *)v2;
}

- (void)set_rootController:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AF43B2A4((uint64_t)a3);
}

- (PSSpecifier)_specifier
{
  v2 = sub_1AF43B2E4();

  return (PSSpecifier *)v2;
}

- (void)set_specifier:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AF43B370((uint64_t)a3);
}

- (_TtC12GameCenterUI31SettingsContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return (_TtC12GameCenterUI31SettingsContainerViewController *)sub_1AF43ED60((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(uint64_t, uint64_t, void *))SettingsContainerViewController.init(nibName:bundle:));
}

- (_TtC12GameCenterUI31SettingsContainerViewController)initWithCoder:(id)a3
{
  return (_TtC12GameCenterUI31SettingsContainerViewController *)SettingsContainerViewController.init(coder:)(a3);
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (id)parentController
{
  v2 = SettingsContainerViewController.parentController()();

  return v2;
}

- (void)setRootController:(id)a3
{
  id v5 = a3;
  v6 = self;
  SettingsContainerViewController.setRoot(_:)(a3);
}

- (id)rootController
{
  v2 = SettingsContainerViewController.rootController()();

  return v2;
}

- (void)setSpecifier:(id)a3
{
  id v5 = a3;
  v6 = self;
  SettingsContainerViewController.setSpecifier(_:)(a3);
}

- (id)specifier
{
  v2 = SettingsContainerViewController.specifier()();

  return v2;
}

- (void)setPreferenceValue:(id)a3 specifier:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    v7 = self;
    swift_unknownObjectRetain();
    sub_1AF7AEB60();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    id v8 = a4;
    v9 = self;
  }

  sub_1AF379794((uint64_t)v10, (uint64_t *)&unk_1E9AC4590);
}

- (id)readPreferenceValue:(id)a3
{
  SettingsContainerViewController.readPreferenceValue(_:)((uint64_t)v11);
  uint64_t v3 = v12;
  if (v12)
  {
    v4 = __swift_project_boxed_opaque_existential_1(v11, v12);
    uint64_t v5 = *(void *)(v3 - 8);
    __n128 v6 = MEMORY[0x1F4188790](v4);
    id v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, __n128))(v5 + 16))(v8, v6);
    v9 = (void *)sub_1AF7AEFC0();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v3);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  __n128 v6 = _Block_copy(a4);
  if (a3) {
    a3 = (id)sub_1AF7ADFE0();
  }
  if (v6)
  {
    *(void *)(swift_allocObject() + 16) = v6;
    uint64_t v7 = sub_1AF388384;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = self;
  v9._rawValue = a3;
  SettingsContainerViewController.handleURL(_:withCompletion:)(v9, (void (*)(uint64_t))v7);
  sub_1AF368930((uint64_t)v7);

  swift_bridgeObjectRelease();
}

- (void)signInController:(id)a3 didCompleteWithSuccess:(BOOL)a4 error:(id)a5
{
  id v7 = a3;
  id v8 = self;
  id v9 = a5;
  SettingsContainerViewController.signInController(_:didCompleteWithSuccess:error:)(v7, 0, a5);
}

- (void)signInControllerDidCancel:(id)a3
{
  v4 = (AAUISignInController *)a3;
  uint64_t v5 = self;
  SettingsContainerViewController.signInControllerDidCancel(_:)(v4);
}

- (void)openAvatarEditor
{
  v2 = self;
  SettingsContainerViewController.openAvatarEditor()();
}

- (void)photoPickerDidCancel:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  SettingsContainerViewController.photoPickerDidCancel(_:)(v4);
}

- (void)photoPicker:(id)a3 didUpdatePhotoForContact:(id)a4 withContactImage:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  SettingsContainerViewController.photoPicker(_:didUpdatePhotoFor:with:)(v8, (uint64_t)v9, (uint64_t)v10);
}

- (void)openPlayerProfileViewWithPlayerID:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1AF7AE0E0();
    __n128 v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    __n128 v6 = 0;
  }
  id v7 = self;
  v8.value._countAndFlagsBits = v4;
  v8.value._object = v6;
  SettingsContainerViewController.openPlayerProfileView(playerID:)(v8);

  swift_bridgeObjectRelease();
}

- (void)onboardingFlowFinishedWithAction:(unint64_t)a3
{
  uint64_t v3 = self;
  SettingsContainerViewController.onboardingFlowFinished(with:)();
}

@end