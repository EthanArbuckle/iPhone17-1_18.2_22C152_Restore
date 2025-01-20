@interface PlayerProfileViewController
+ (void)showProfileFor:(id)a3 from:(id)a4 completion:(id)a5;
- (BOOL)canBeShownFromSuspendedState;
- (BOOL)isDeeplinked;
- (BOOL)shouldDisplayInSplitView;
- (PSRootController)_rootController;
- (PSSpecifier)_specifier;
- (_TtC12GameCenterUI18BaseSplitPresenter)dataPresenter;
- (_TtC12GameCenterUI27PlayerProfileViewController)initWithCoder:(id)a3;
- (_TtC12GameCenterUI27PlayerProfileViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)contentScrollView;
- (id)parentController;
- (id)readPreferenceValue:(id)a3;
- (id)rootController;
- (id)specifier;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)donePressed:(id)a3;
- (void)handleURL:(id)a3 withCompletion:(id)a4;
- (void)loadMoreWithContinuationToken:(id)a3;
- (void)mainSecondaryCollectionViewLayout;
- (void)scrollToTopActionTriggered;
- (void)setDataPresenter:(id)a3;
- (void)setIsDeeplinked:(BOOL)a3;
- (void)setPreferenceValue:(id)a3 specifier:(id)a4;
- (void)setRootController:(id)a3;
- (void)setSpecifier:(id)a3;
- (void)set_rootController:(id)a3;
- (void)set_specifier:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PlayerProfileViewController

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (id)parentController
{
  v2 = PlayerProfileViewController.parentController()();

  return v2;
}

- (void)setRootController:(id)a3
{
  id v5 = a3;
  v6 = self;
  PlayerProfileViewController.setRoot(_:)(a3);
}

- (id)rootController
{
  v2 = PlayerProfileViewController.rootController()();

  return v2;
}

- (void)setSpecifier:(id)a3
{
  id v5 = a3;
  v6 = self;
  PlayerProfileViewController.setSpecifier(_:)(a3);
}

- (id)specifier
{
  v2 = PlayerProfileViewController.specifier()();

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

  sub_1AF36A4F0((uint64_t)v10);
}

- (id)readPreferenceValue:(id)a3
{
  PlayerProfileViewController.readPreferenceValue(_:)((uint64_t)v11);
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
    sub_1AF7ADFE0();
  }
  if (v6)
  {
    *(void *)(swift_allocObject() + 16) = v6;
    __n128 v6 = sub_1AF388384;
  }
  uint64_t v7 = self;
  sub_1AF368930((uint64_t)v6);

  swift_bridgeObjectRelease();
}

+ (void)showProfileFor:(id)a3 from:(id)a4 completion:(id)a5
{
  uint64_t v7 = (uint64_t (*)())_Block_copy(a5);
  id v8 = v7;
  if (a3)
  {
    uint64_t v9 = sub_1AF7AE0E0();
    a3 = v10;
    if (!v8) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  uint64_t v9 = 0;
  if (v7)
  {
LABEL_3:
    *(void *)(swift_allocObject() + 16) = v8;
    id v8 = sub_1AF388384;
  }
LABEL_5:
  id v11 = a4;
  static PlayerProfileViewController.showProfile(for:from:completion:)(v9, (uint64_t)a3, v11);
  sub_1AF368930((uint64_t)v8);

  swift_bridgeObjectRelease();
}

- (_TtC12GameCenterUI27PlayerProfileViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  PlayerProfileViewController.init(coder:)();
}

- (_TtC12GameCenterUI27PlayerProfileViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_1AF7AE0E0();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC12GameCenterUI27PlayerProfileViewController *)PlayerProfileViewController.init(nibName:bundle:)((uint64_t)a4, v6, a4);
}

- (_TtC12GameCenterUI18BaseSplitPresenter)dataPresenter
{
  id v2 = sub_1AF4C7998();

  return (_TtC12GameCenterUI18BaseSplitPresenter *)v2;
}

- (void)setDataPresenter:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1AF4C7A04(v4);
}

- (BOOL)isDeeplinked
{
  return sub_1AF4C7AF4() & 1;
}

- (void)setIsDeeplinked:(BOOL)a3
{
}

- (void)viewDidLoad
{
  id v2 = self;
  sub_1AF4C7B8C();
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  sub_1AF4C7D5C(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  sub_1AF4C802C(a3);
}

- (void)viewDidLayoutSubviews
{
  id v2 = self;
  sub_1AF4C8140();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_1AF4C84E0((uint64_t)a3);
}

- (BOOL)shouldDisplayInSplitView
{
  id v2 = self;
  unsigned __int8 v3 = sub_1AF4C8650();

  return v3 & 1;
}

- (id)contentScrollView
{
  id v2 = self;
  id v3 = sub_1AF4C8718();

  return v3;
}

- (void)mainSecondaryCollectionViewLayout
{
  id v2 = self;
  sub_1AF4C9E00();
}

- (void)donePressed:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1AF7AEB60();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    id v5 = self;
  }
  sub_1AF4CA230();

  sub_1AF379794((uint64_t)v6, (uint64_t *)&unk_1E9AC4590);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_1AF7A9A60();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  id v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AF7A99E0();
  id v12 = a3;
  id v13 = a4;
  v14 = self;
  sub_1AF4CA308((uint64_t)v12, v13);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (PSRootController)_rootController
{
  id v2 = sub_1AF4CB5D4();

  return (PSRootController *)v2;
}

- (void)set_rootController:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_1AF4CB660((uint64_t)a3);
}

- (PSSpecifier)_specifier
{
  id v2 = sub_1AF4CB6A0();

  return (PSSpecifier *)v2;
}

- (void)set_specifier:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_1AF4CB72C((uint64_t)a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI27PlayerProfileViewController_profilePresenter));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI27PlayerProfileViewController_clippingLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI27PlayerProfileViewController_friendSuggestionsSectionFocusGuide));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI27PlayerProfileViewController__rootController));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC12GameCenterUI27PlayerProfileViewController__specifier);
}

- (void)scrollToTopActionTriggered
{
  id v2 = self;
  sub_1AF4CB858();
}

- (void)loadMoreWithContinuationToken:(id)a3
{
  sub_1AF7AE0E0();
  id v4 = self;
  sub_1AF4CB974();

  swift_bridgeObjectRelease();
}

@end