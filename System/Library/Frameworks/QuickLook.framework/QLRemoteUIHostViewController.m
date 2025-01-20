@interface QLRemoteUIHostViewController
+ (void)remotePreviewCollectionWithCompletionHandler:(id)a3;
- (BOOL)isAvailable;
- (BOOL)isRemote;
- (NSUUID)uuid;
- (_TtC9QuickLook28QLRemoteUIHostViewController)initWithCoder:(id)a3;
- (_TtC9QuickLook28QLRemoteUIHostViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)accessoryView;
- (void)actionSheetDidDismiss;
- (void)configureWithNumberOfItems:(int64_t)a3 currentPreviewItemIndex:(unint64_t)a4 itemProvider:(id)a5 stateManager:(id)a6;
- (void)configureWithNumberOfItems:(int64_t)a3 currentPreviewItemIndex:(unint64_t)a4 itemProvider:(id)a5 stateManager:(id)a6 fullScreen:(BOOL)a7;
- (void)documentMenuActionWillBegin;
- (void)hostApplicationDidBecomeActive;
- (void)hostApplicationDidEnterBackground:(BOOL)a3;
- (void)hostViewControlerTransitionToState:(unint64_t)a3 animated:(BOOL)a4;
- (void)hostViewControllerBackgroundColorChanged:(id)a3;
- (void)invalidateServiceWithCompletionHandler:(id)a3;
- (void)keyCommandWasPerformed:(id)a3;
- (void)keyCommandsWithCompletionHandler:(id)a3;
- (void)notifyFirstTimeAppearanceWithActions:(unint64_t)a3;
- (void)notifyStateRestorationUserInfo:(id)a3;
- (void)overrideParentApplicationDisplayIdentifierWithIdentifier:(id)a3;
- (void)prepareForActionSheetPresentationWithCompletionHandler:(id)a3;
- (void)preparePreviewCollectionForInvalidationWithCompletionHandler:(id)a3;
- (void)previewItemDisplayState:(id)a3 wasAppliedToItemAtIndex:(unint64_t)a4;
- (void)requestLockForCurrentItem;
- (void)saveCurrentPreviewEditsSynchronously:(BOOL)a3 withCompletionHandler:(id)a4;
- (void)saveIntoPhotoLibraryMediaWithURLWrapper:(id)a3 previewItemType:(unint64_t)a4 completionHandler:(id)a5;
- (void)setAllowInteractiveTransitions:(BOOL)a3;
- (void)setAppearance:(id)a3 animated:(BOOL)a4;
- (void)setCurrentPreviewItemIndex:(int64_t)a3 animated:(BOOL)a4;
- (void)setHostApplicationBundleIdentifier:(id)a3;
- (void)setIsContentManaged:(BOOL)a3;
- (void)setLoadingString:(id)a3;
- (void)setPreviewItemDisplayState:(id)a3 onItemAtIndex:(unint64_t)a4;
- (void)setUuid:(id)a3;
- (void)shouldDisplayLockActivityWithCompletionHandler:(id)a3;
- (void)startTransitionWithSourceViewProvider:(QLTransitionContext *)a3 transitionController:(QLTransitionControllerProtocol *)a4 presenting:(BOOL)a5 useInteractiveTransition:(BOOL)a6 completionHandler:(id)a7;
- (void)tearDownTransition:(BOOL)a3;
- (void)toggleDebugView;
- (void)toolbarButtonPressedWithIdentifier:(NSString *)a3 completionHandler:(id)a4;
- (void)toolbarButtonsForTraitCollection:(UITraitCollection *)a3 withCompletionHandler:(id)a4;
- (void)viewDidLoad;
@end

@implementation QLRemoteUIHostViewController

- (BOOL)isAvailable
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC9QuickLook28QLRemoteUIHostViewController_viewModel);
  swift_getKeyPath();
  sub_218031A80((unint64_t *)&qword_267BBA870, (void (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel);
  v4 = self;
  sub_218037E24();
  swift_release();
  char v5 = *(unsigned char *)(v3 + 17);

  return v5;
}

- (NSUUID)uuid
{
  uint64_t v3 = sub_218037DF4();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_21801B360((uint64_t)v6);

  v8 = (void *)sub_218037DC4();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return (NSUUID *)v8;
}

- (void)setUuid:(id)a3
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA8D8);
  MEMORY[0x270FA5388](v4 - 8);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_218037DF4();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_218037DD4();
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v6, v10, v7);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  v11 = (char *)self + OBJC_IVAR____TtC9QuickLook28QLRemoteUIHostViewController____lazy_storage___uuid;
  swift_beginAccess();
  v12 = self;
  sub_21801B594((uint64_t)v6, (uint64_t)v11);
  swift_endAccess();
}

- (_TtC9QuickLook28QLRemoteUIHostViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_218038624();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC9QuickLook28QLRemoteUIHostViewController *)sub_21801BCE0(v5, v7, a4);
}

- (_TtC9QuickLook28QLRemoteUIHostViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC9QuickLook28QLRemoteUIHostViewController_viewModel;
  type metadata accessor for QLHostRemoteViewModel();
  swift_allocObject();
  id v6 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)sub_218016B74();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9QuickLook28QLRemoteUIHostViewController____lazy_storage___accessoryViewController) = 0;
  uint64_t v7 = (char *)self + OBJC_IVAR____TtC9QuickLook28QLRemoteUIHostViewController____lazy_storage___uuid;
  uint64_t v8 = sub_218037DF4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);

  result = (_TtC9QuickLook28QLRemoteUIHostViewController *)sub_218038B14();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for QLRemoteUIHostViewController();
  id v2 = v3.receiver;
  [(QLRemoteUIHostViewController *)&v3 viewDidLoad];
  sub_218037E04();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9QuickLook28QLRemoteUIHostViewController____lazy_storage___accessoryViewController));
  sub_217FF6BD8((uint64_t)self + OBJC_IVAR____TtC9QuickLook28QLRemoteUIHostViewController____lazy_storage___uuid, &qword_267BBA8D8);
}

+ (void)remotePreviewCollectionWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBA400);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = a1;
  uint64_t v10 = sub_218038824();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_267BBACE8;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_267BBACF0;
  v12[5] = v11;
  sub_21802D754((uint64_t)v7, (uint64_t)&unk_267BBACF8, (uint64_t)v12);
  swift_release();
}

- (void)toggleDebugView
{
  id v2 = self;
  QLRemoteUIHostViewController.toggleDebugView()();
}

- (BOOL)isRemote
{
  return 1;
}

- (void)setAllowInteractiveTransitions:(BOOL)a3
{
}

- (id)accessoryView
{
  id v2 = self;
  id v3 = sub_21801AEC0();
  id v4 = objc_msgSend(v3, sel_view);

  if (v4)
  {

    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)setHostApplicationBundleIdentifier:(id)a3
{
}

- (void)configureWithNumberOfItems:(int64_t)a3 currentPreviewItemIndex:(unint64_t)a4 itemProvider:(id)a5 stateManager:(id)a6 fullScreen:(BOOL)a7
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  uint64_t v13 = self;
  QLRemoteUIHostViewController.configure(withNumberOfItems:currentPreviewItemIndex:itemProvider:stateManager:fullScreen:)(a3, a4, (uint64_t)a5, (uint64_t)a6, a7);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)configureWithNumberOfItems:(int64_t)a3 currentPreviewItemIndex:(unint64_t)a4 itemProvider:(id)a5 stateManager:(id)a6
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v11 = self;
  QLRemoteUIHostViewController.configure(withNumberOfItems:currentPreviewItemIndex:itemProvider:stateManager:)(a3, a4, (uint64_t)a5, (uint64_t)a6);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)setCurrentPreviewItemIndex:(int64_t)a3 animated:(BOOL)a4
{
}

- (void)hostApplicationDidEnterBackground:(BOOL)a3
{
}

- (void)hostApplicationDidBecomeActive
{
}

- (void)toolbarButtonsForTraitCollection:(UITraitCollection *)a3 withCompletionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBA400);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_218038824();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_267BBAC98;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_267BBACA0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_21802D754((uint64_t)v9, (uint64_t)&unk_267BBACA8, (uint64_t)v14);
  swift_release();
}

- (void)toolbarButtonPressedWithIdentifier:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBA400);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_218038824();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_267BBAC78;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_267BBAC80;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_21802D754((uint64_t)v9, (uint64_t)&unk_267BBAC88, (uint64_t)v14);
  swift_release();
}

- (void)shouldDisplayLockActivityWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBA400);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_218038824();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_267BBAC58;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_267BBAC60;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_21802D754((uint64_t)v7, (uint64_t)&unk_267BBAC68, (uint64_t)v12);
  swift_release();
}

- (void)requestLockForCurrentItem
{
}

- (void)keyCommandsWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBA400);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_218038824();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_267BBAC28;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_267BBAC30;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_21802D754((uint64_t)v7, (uint64_t)&unk_267BBAC38, (uint64_t)v12);
  swift_release();
}

- (void)keyCommandWasPerformed:(id)a3
{
}

- (void)setAppearance:(id)a3 animated:(BOOL)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBA400);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = a3;
  v11 = self;
  sub_218038804();
  uint64_t v12 = sub_218038824();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 0, 1, v12);
  sub_2180387F4();
  id v13 = v10;
  uint64_t v14 = v11;
  uint64_t v15 = sub_2180387E4();
  uint64_t v16 = swift_allocObject();
  uint64_t v17 = MEMORY[0x263F8F500];
  *(void *)(v16 + 16) = v15;
  *(void *)(v16 + 24) = v17;
  *(void *)(v16 + 32) = v14;
  *(void *)(v16 + 40) = v13;
  *(unsigned char *)(v16 + 48) = a4;
  sub_21800341C((uint64_t)v9, (uint64_t)&unk_267BBAC10, v16);

  swift_release();
}

- (void)notifyFirstTimeAppearanceWithActions:(unint64_t)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBA400);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = self;
  sub_218038804();
  uint64_t v9 = sub_218038824();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 0, 1, v9);
  sub_2180387F4();
  id v10 = v8;
  uint64_t v11 = sub_2180387E4();
  uint64_t v12 = (void *)swift_allocObject();
  uint64_t v13 = MEMORY[0x263F8F500];
  v12[2] = v11;
  v12[3] = v13;
  v12[4] = v10;
  v12[5] = a3;
  sub_21800341C((uint64_t)v7, (uint64_t)&unk_267BBAC08, (uint64_t)v12);

  swift_release();
}

- (void)notifyStateRestorationUserInfo:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBA400);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3) {
    a3 = (id)sub_2180385B4();
  }
  uint64_t v8 = self;
  sub_218038804();
  uint64_t v9 = sub_218038824();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 0, 1, v9);
  sub_2180387F4();
  swift_bridgeObjectRetain();
  id v10 = v8;
  uint64_t v11 = sub_2180387E4();
  uint64_t v12 = (void *)swift_allocObject();
  uint64_t v13 = MEMORY[0x263F8F500];
  v12[2] = v11;
  v12[3] = v13;
  v12[4] = v10;
  v12[5] = a3;
  sub_21800341C((uint64_t)v7, (uint64_t)&unk_267BBAC00, (uint64_t)v12);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)previewItemDisplayState:(id)a3 wasAppliedToItemAtIndex:(unint64_t)a4
{
}

- (void)startTransitionWithSourceViewProvider:(QLTransitionContext *)a3 transitionController:(QLTransitionControllerProtocol *)a4 presenting:(BOOL)a5 useInteractiveTransition:(BOOL)a6 completionHandler:(id)a7
{
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBA400);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = _Block_copy(a7);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a3;
  *(void *)(v17 + 24) = a4;
  *(unsigned char *)(v17 + 32) = a5;
  *(unsigned char *)(v17 + 33) = a6;
  *(void *)(v17 + 40) = v16;
  *(void *)(v17 + 48) = self;
  uint64_t v18 = sub_218038824();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v15, 1, 1, v18);
  v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_267BBABE0;
  v19[5] = v17;
  v20 = (void *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_267BBABE8;
  v20[5] = v19;
  v21 = a3;
  swift_unknownObjectRetain();
  v22 = self;
  sub_21802D754((uint64_t)v15, (uint64_t)&unk_267BBABF0, (uint64_t)v20);
  swift_release();
}

- (void)tearDownTransition:(BOOL)a3
{
}

- (void)setLoadingString:(id)a3
{
}

- (void)overrideParentApplicationDisplayIdentifierWithIdentifier:(id)a3
{
}

- (void)preparePreviewCollectionForInvalidationWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBA400);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_218038824();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_267BBABA8;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_267BBABB0;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_21802D754((uint64_t)v7, (uint64_t)&unk_267BBABB8, (uint64_t)v12);
  swift_release();
}

- (void)invalidateServiceWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBA400);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_218038824();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_267BBAB88;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_267BBAB90;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_21802D754((uint64_t)v7, (uint64_t)&unk_267BBAB98, (uint64_t)v12);
  swift_release();
}

- (void)hostViewControlerTransitionToState:(unint64_t)a3 animated:(BOOL)a4
{
}

- (void)setPreviewItemDisplayState:(id)a3 onItemAtIndex:(unint64_t)a4
{
}

- (void)prepareForActionSheetPresentationWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBA400);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_218038824();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_267BBAB58;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_267BBAB60;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_21802D754((uint64_t)v7, (uint64_t)&unk_267BBAB68, (uint64_t)v12);
  swift_release();
}

- (void)actionSheetDidDismiss
{
}

- (void)documentMenuActionWillBegin
{
}

- (void)hostViewControllerBackgroundColorChanged:(id)a3
{
}

- (void)saveIntoPhotoLibraryMediaWithURLWrapper:(id)a3 previewItemType:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  if (v8)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    uint64_t v8 = sub_217FF18B0;
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = a3;
  uint64_t v11 = self;
  QLRemoteUIHostViewController.saveIntoPhotoLibraryMedia(with:previewItemType:completionHandler:)(v10, a4, (uint64_t)v8, v9);
  sub_217FF18A0((uint64_t)v8);
}

- (void)setIsContentManaged:(BOOL)a3
{
}

- (void)saveCurrentPreviewEditsSynchronously:(BOOL)a3 withCompletionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBA400);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = sub_218038824();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_267BBAAF8;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_267BB9938;
  v14[5] = v13;
  uint64_t v15 = self;
  sub_21802D754((uint64_t)v9, (uint64_t)&unk_267BB9940, (uint64_t)v14);
  swift_release();
}

@end