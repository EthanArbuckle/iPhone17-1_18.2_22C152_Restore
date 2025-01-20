@interface CKAppCardPresentationOverseer
- (BOOL)isExpanded;
- (BOOL)isPresentingCard;
- (BOOL)isPresentingInSendMenuPopover;
- (BOOL)isPresentingInSheetController;
- (BOOL)presentationBegan;
- (BOOL)presentedAppBypassesSendMenu;
- (BOOL)shouldAnimateDismissal;
- (BOOL)shouldAnimatePresentationForPresentationStyle:(unint64_t)a3;
- (BOOL)updateCurrentBrowserWithDataSource:(id)a3;
- (CKAppCardPresentationOverseer)init;
- (CKAppCardPresentationOverseer)initWithPresentingViewController:(id)a3 sendDelegate:(id)a4;
- (CKAppCardPresentationOverseerDelegate)delegate;
- (CKBrowserViewControllerProtocol)browserViewController;
- (UIViewController)containerViewController;
- (double)appCardDismissPadding;
- (id)updateCurrentBrowserForPlugin:(id)a3 dataSource:(id)a4 pluginContext:(id)a5;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (void)_sheetPresentationControllerDidInvalidateCurrentPresentedViewFrame:(id)a3;
- (void)checkForTouchInExtensionWithCompletion:(id)a3;
- (void)dismissCardAnimated:(BOOL)a3 completion:(id)a4;
- (void)dismissCardAnimated:(BOOL)a3 overrideExceptions:(BOOL)a4 completion:(id)a5;
- (void)extensionRemoteConnectionWasInterruptedWithNotification:(id)a3;
- (void)fadeOutCardWithCompletion:(id)a3;
- (void)presentCardWithStyle:(unint64_t)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)presentPopoverFromView:(UIView *)a3 sourceRect:(CGRect)a4 completion:(id)a5;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)requestPresentationStyle:(unint64_t)a3;
- (void)requestPresentationStyle:(unint64_t)a3 animated:(BOOL)a4;
- (void)setAppCardDismissPadding:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setPresentationBegan:(BOOL)a3;
- (void)sheetPresentationControllerDidChangeSelectedDetentIdentifier:(id)a3;
- (void)updatePopoverLocation:(CGRect)a3 completion:(id)a4;
@end

@implementation CKAppCardPresentationOverseer

- (CKBrowserViewControllerProtocol)browserViewController
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___CKAppCardPresentationOverseer_container);
  if (v2) {
    id v3 = *(id *)(v2 + OBJC_IVAR____TtC7ChatKit30AppCardContainerViewController_remoteViewController);
  }
  else {
    id v3 = 0;
  }

  return (CKBrowserViewControllerProtocol *)v3;
}

- (UIViewController)containerViewController
{
  return (UIViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___CKAppCardPresentationOverseer_container));
}

- (CKAppCardPresentationOverseerDelegate)delegate
{
  uint64_t v2 = (char *)self + OBJC_IVAR___CKAppCardPresentationOverseer_delegate;
  swift_beginAccess();
  id v3 = (void *)MEMORY[0x192FBC390](v2);

  return (CKAppCardPresentationOverseerDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (double)appCardDismissPadding
{
  uint64_t v2 = (double *)((char *)self + OBJC_IVAR___CKAppCardPresentationOverseer_appCardDismissPadding);
  swift_beginAccess();
  return *v2;
}

- (void)setAppCardDismissPadding:(double)a3
{
  v4 = self;
  CKAppCardPresentationOverseer.appCardDismissPadding.setter(a3);
}

- (BOOL)presentationBegan
{
  uint64_t v2 = (BOOL *)self + OBJC_IVAR___CKAppCardPresentationOverseer_presentationBegan;
  swift_beginAccess();
  return *v2;
}

- (void)setPresentationBegan:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___CKAppCardPresentationOverseer_presentationBegan;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (CKAppCardPresentationOverseer)initWithPresentingViewController:(id)a3 sendDelegate:(id)a4
{
  id v4 = a3;
  swift_unknownObjectRetain();
  return (CKAppCardPresentationOverseer *)CKAppCardPresentationOverseer.init(presenting:sendDelegate:)(v4);
}

- (id)updateCurrentBrowserForPlugin:(id)a3 dataSource:(id)a4 pluginContext:(id)a5
{
  if (a5)
  {
    id v8 = a3;
    id v9 = a4;
    v10 = self;
    swift_unknownObjectRetain();
    sub_18F7BA320();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v16, 0, sizeof(v16));
    id v11 = a3;
    id v12 = a4;
    v13 = self;
  }
  id v14 = CKAppCardPresentationOverseer.updateCurrentBrowser(for:dataSource:pluginContext:)(a3, (uint64_t)a4, (uint64_t)v16);

  sub_18EF288F8((uint64_t)v16);

  return v14;
}

- (BOOL)updateCurrentBrowserWithDataSource:(id)a3
{
  id v4 = (CKAppCardPresentationOverseer *)a3;
  v5 = self;
  v6 = [(CKAppCardPresentationOverseer *)v5 browserViewController];
  if (v6)
  {
    v7 = (CKAppCardPresentationOverseer *)v6;
    if (([(CKBrowserViewControllerProtocol *)v6 respondsToSelector:sel_canReplaceDataSource] & 1) != 0&& ![(CKAppCardPresentationOverseer *)v7 canReplaceDataSource])
    {
      BOOL v8 = 0;
    }
    else
    {
      [(CKAppCardPresentationOverseer *)v7 setBalloonPluginDataSource:v4];
      BOOL v8 = 1;
    }

    id v4 = v5;
  }
  else
  {
    BOOL v8 = 0;
    v7 = v5;
  }

  return v8;
}

- (BOOL)isPresentingInSendMenuPopover
{
  uint64_t v2 = self;
  id v3 = (void *)sub_18F4FBA04();

  if (v3) {
  return v3 != 0;
  }
}

- (BOOL)isPresentingInSheetController
{
  uint64_t v2 = self;
  if ([(CKAppCardPresentationOverseer *)v2 isPresentingInSendMenuPopover]
    || (id v3 = *(Class *)((char *)&v2->super.isa + OBJC_IVAR___CKAppCardPresentationOverseer_container)) == 0)
  {

    return 0;
  }
  else
  {
    id v4 = objc_msgSend(v3, sel_modalPresentationStyle);

    return v4 == (id)1;
  }
}

- (void)extensionRemoteConnectionWasInterruptedWithNotification:(id)a3
{
  uint64_t v4 = sub_18F7B5D30();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18F7B5CF0();
  BOOL v8 = self;
  sub_18F4FBBA4();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)presentCardWithStyle:(unint64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB442C50);
  MEMORY[0x1F4188790](v9 - 8);
  id v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = _Block_copy(a5);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a3;
  *(unsigned char *)(v13 + 24) = a4;
  *(void *)(v13 + 32) = v12;
  *(void *)(v13 + 40) = self;
  uint64_t v14 = sub_18F7B9AE0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1E9239F80;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  _OWORD v16[2] = 0;
  v16[3] = 0;
  v16[4] = aDu;
  v16[5] = v15;
  v17 = self;
  sub_18EF277D4((uint64_t)v11, (uint64_t)aEu, (uint64_t)v16);
  swift_release();
}

- (void)presentPopoverFromView:(UIView *)a3 sourceRect:(CGRect)a4 completion:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB442C50);
  MEMORY[0x1F4188790](v12 - 8);
  uint64_t v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = _Block_copy(a5);
  v16 = (CGFloat *)swift_allocObject();
  *((void *)v16 + 2) = a3;
  v16[3] = x;
  v16[4] = y;
  v16[5] = width;
  v16[6] = height;
  *((void *)v16 + 7) = v15;
  *((void *)v16 + 8) = self;
  uint64_t v17 = sub_18F7B9AE0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v14, 1, 1, v17);
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1E9239F60;
  v18[5] = v16;
  v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_1E9239F68;
  v19[5] = v18;
  v20 = a3;
  v21 = self;
  sub_18EF277D4((uint64_t)v14, (uint64_t)aHeu, (uint64_t)v19);
  swift_release();
}

- (void)updatePopoverLocation:(CGRect)a3 completion:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB442C50);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = _Block_copy(a4);
  uint64_t v14 = (CGFloat *)swift_allocObject();
  v14[2] = x;
  v14[3] = y;
  v14[4] = width;
  v14[5] = height;
  *((void *)v14 + 6) = v13;
  *((void *)v14 + 7) = self;
  uint64_t v15 = sub_18F7B9AE0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v12, 1, 1, v15);
  v16 = (void *)swift_allocObject();
  _OWORD v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1E9239F40;
  v16[5] = v14;
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1E9239F48;
  v17[5] = v16;
  uint64_t v18 = self;
  sub_18EF277D4((uint64_t)v12, (uint64_t)aHeu_0, (uint64_t)v17);
  swift_release();
}

- (void)fadeOutCardWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = self;
  CKAppCardPresentationOverseer.fadeOutCard(completion:)((uint64_t)sub_18F4C1E94, v5);

  swift_release();
}

- (void)dismissCardAnimated:(BOOL)a3 completion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB442C50);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = sub_18F7B9AE0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1E9239F20;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1E9239F28;
  v14[5] = v13;
  uint64_t v15 = self;
  sub_18EF277D4((uint64_t)v9, (uint64_t)&unk_1E9239F30, (uint64_t)v14);
  swift_release();
}

- (void)dismissCardAnimated:(BOOL)a3 overrideExceptions:(BOOL)a4 completion:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB442C50);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = swift_allocObject();
  *(unsigned char *)(v13 + 16) = a3;
  *(unsigned char *)(v13 + 17) = a4;
  *(void *)(v13 + 24) = v12;
  *(void *)(v13 + 32) = self;
  uint64_t v14 = sub_18F7B9AE0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1E9239F00;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  _OWORD v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1E9239F08;
  v16[5] = v15;
  uint64_t v17 = self;
  sub_18EF277D4((uint64_t)v11, (uint64_t)&unk_1E9239F10, (uint64_t)v16);
  swift_release();
}

- (BOOL)isPresentingCard
{
  uint64_t v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CKAppCardPresentationOverseer_container);
  if (!v2) {
    return 0;
  }
  id v3 = self;
  id v4 = objc_msgSend(v2, sel_presentingViewController);

  if (!v4) {
    return 0;
  }

  return 1;
}

- (BOOL)presentedAppBypassesSendMenu
{
  uint64_t v2 = self;
  unsigned __int8 v3 = CKAppCardPresentationOverseer.presentedAppBypassesSendMenu.getter();

  return v3 & 1;
}

- (BOOL)isExpanded
{
  uint64_t v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CKAppCardPresentationOverseer_container);
  if (!v2) {
    return 0;
  }
  unsigned __int8 v3 = self;
  id v4 = v2;
  uint64_t v5 = sub_18F5D2798();

  return v5 == 1;
}

- (void)requestPresentationStyle:(unint64_t)a3 animated:(BOOL)a4
{
  uint64_t v6 = self;
  CKAppCardPresentationOverseer.request(_:animated:)(a3, a4);
}

- (void)requestPresentationStyle:(unint64_t)a3
{
}

- (void)checkForTouchInExtensionWithCompletion:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB442C50);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_18F7B9AE0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1E9239EE0;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = a0nu;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_18EF277D4((uint64_t)v7, (uint64_t)&unk_1E9239EF0, (uint64_t)v12);
  swift_release();
}

- (BOOL)shouldAnimatePresentationForPresentationStyle:(unint64_t)a3
{
  id v4 = self;
  LOBYTE(a3) = CKAppCardPresentationOverseer.shouldAnimatePresentation(for:)(a3);

  return a3 & 1;
}

- (BOOL)shouldAnimateDismissal
{
  uint64_t v2 = self;
  char v3 = CKAppCardPresentationOverseer.shouldAnimateDismissal.getter();

  return v3 & 1;
}

- (CKAppCardPresentationOverseer)init
{
  result = (CKAppCardPresentationOverseer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_18EF288F8((uint64_t)self + OBJC_IVAR___CKAppCardPresentationOverseer_pluginContext);
  sub_18F4C25DC((uint64_t)self + OBJC_IVAR___CKAppCardPresentationOverseer_delegate);

  swift_unknownObjectWeakDestroy();
  sub_18F4C25DC((uint64_t)self + OBJC_IVAR___CKAppCardPresentationOverseer_sendDelegate);

  swift_release();
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  _sSo29CKAppCardPresentationOverseerC7ChatKitE32presentationControllerDidDismissyySo014UIPresentationH0CF_0();
}

- (void)sheetPresentationControllerDidChangeSelectedDetentIdentifier:(id)a3
{
  id v4 = (UISheetPresentationController *)a3;
  uint64_t v5 = self;
  CKAppCardPresentationOverseer.sheetPresentationControllerDidChangeSelectedDetentIdentifier(_:)(v4);
}

- (void)_sheetPresentationControllerDidInvalidateCurrentPresentedViewFrame:(id)a3
{
  id v4 = (UISheetPresentationController *)a3;
  uint64_t v5 = self;
  CKAppCardPresentationOverseer._sheetPresentationControllerDidInvalidateCurrentPresentedViewFrame(_:)(v4);
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

@end