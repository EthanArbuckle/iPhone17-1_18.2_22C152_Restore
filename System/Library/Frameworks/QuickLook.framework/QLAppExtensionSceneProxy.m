@interface QLAppExtensionSceneProxy
- (void)actionSheetDidDismiss;
- (void)configureWithNumberOfItems:(int64_t)a3 currentPreviewItemIndex:(unint64_t)a4 itemProvider:(id)a5 stateManager:(id)a6;
- (void)configureWithNumberOfItems:(int64_t)a3 currentPreviewItemIndex:(unint64_t)a4 itemProvider:(id)a5 stateManager:(id)a6 fullScreen:(BOOL)a7;
- (void)crashWithReply:(id)a3;
- (void)documentMenuActionWillBegin;
- (void)getNetworkObserverWithCompletionBlock:(id)a3;
- (void)getPreviewCollectionUUIDWithCompletionHandlerWithCompletionHandler:(id)a3;
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
- (void)preparePreviewCollectionForInvalidationWithCompletionHandlerWithCompletionHandler:(id)a3;
- (void)previewItemDisplayState:(id)a3 wasAppliedToItemAtIndex:(unint64_t)a4;
- (void)requestLockForCurrentItem;
- (void)saveCurrentPreviewEditsSynchronously:(BOOL)a3 withCompletionHandler:(id)a4;
- (void)saveIntoPhotoLibraryMediaWithURLWrapper:(id)a3 previewItemType:(unint64_t)a4 completionHandler:(id)a5;
- (void)setAllowInteractiveTransitions:(BOOL)a3 completionHandler:(id)a4;
- (void)setAppearance:(id)a3 animated:(BOOL)a4;
- (void)setCurrentPreviewItemIndex:(int64_t)a3 animated:(BOOL)a4;
- (void)setHostApplicationBundleIdentifier:(id)a3;
- (void)setIsContentManaged:(BOOL)a3;
- (void)setLoadingString:(id)a3;
- (void)setNotificationCenter:(id)a3;
- (void)setPreviewItemDisplayState:(id)a3 onItemAtIndex:(unint64_t)a4;
- (void)shouldDisplayLockActivityWithCompletionHandler:(id)a3;
- (void)startTransitionWithSourceViewProvider:(QLTransitionContext *)a3 transitionController:(QLTransitionControllerProtocol *)a4 presenting:(BOOL)a5 useInteractiveTransition:(BOOL)a6 completionHandler:(id)a7;
- (void)tearDownTransition:(BOOL)a3;
- (void)toolbarButtonPressedWithIdentifier:(NSString *)a3 completionHandler:(id)a4;
- (void)toolbarButtonsForTraitCollection:(UITraitCollection *)a3 withCompletionHandler:(id)a4;
@end

@implementation QLAppExtensionSceneProxy

- (void)crashWithReply:(id)a3
{
  v3 = _Block_copy(a3);

  _Block_release(v3);
}

- (void)setAllowInteractiveTransitions:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBA400);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = sub_218038824();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_267BB9A50;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_267BB9A58;
  v14[5] = v13;
  swift_retain();
  sub_21802D754((uint64_t)v9, (uint64_t)&unk_267BB9A60, (uint64_t)v14);
  swift_release();
}

- (void)setHostApplicationBundleIdentifier:(id)a3
{
}

- (void)configureWithNumberOfItems:(int64_t)a3 currentPreviewItemIndex:(unint64_t)a4 itemProvider:(id)a5 stateManager:(id)a6 fullScreen:(BOOL)a7
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_retain();
  sub_217FE8994(a3, a4, (uint64_t)a5, (uint64_t)a6, a7);
  swift_release();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

- (void)configureWithNumberOfItems:(int64_t)a3 currentPreviewItemIndex:(unint64_t)a4 itemProvider:(id)a5 stateManager:(id)a6
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_retain();
  sub_217FE8D40(a3, a4, (uint64_t)a5, (uint64_t)a6);
  swift_release();
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
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_218038824();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_267BB9A30;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_267BB9A38;
  v14[5] = v13;
  uint64_t v15 = a3;
  swift_retain();
  sub_21802D754((uint64_t)v9, (uint64_t)&unk_267BB9A40, (uint64_t)v14);
  swift_release();
}

- (void)toolbarButtonPressedWithIdentifier:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBA400);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_218038824();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_267BB9A10;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_267BB9A18;
  v14[5] = v13;
  uint64_t v15 = a3;
  swift_retain();
  sub_21802D754((uint64_t)v9, (uint64_t)&unk_267BB9A20, (uint64_t)v14);
  swift_release();
}

- (void)shouldDisplayLockActivityWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBA400);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_218038824();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_267BB99F0;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_267BB99F8;
  v12[5] = v11;
  swift_retain();
  sub_21802D754((uint64_t)v7, (uint64_t)&unk_267BB9A00, (uint64_t)v12);
  swift_release();
}

- (void)requestLockForCurrentItem
{
}

- (void)keyCommandsWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBA400);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_218038824();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_267BB99D0;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_267BB99D8;
  v12[5] = v11;
  swift_retain();
  sub_21802D754((uint64_t)v7, (uint64_t)&unk_267BB99E0, (uint64_t)v12);
  swift_release();
}

- (void)keyCommandWasPerformed:(id)a3
{
}

- (void)setAppearance:(id)a3 animated:(BOOL)a4
{
  id v5 = a3;
  swift_retain();
  sub_217FEB37C((uint64_t)v5, a4);
  swift_release();
}

- (void)notifyFirstTimeAppearanceWithActions:(unint64_t)a3
{
  swift_retain();
  sub_217FEB404(a3);

  swift_release();
}

- (void)notifyStateRestorationUserInfo:(id)a3
{
  if (a3) {
    v3 = (void *)sub_2180385B4();
  }
  else {
    v3 = 0;
  }
  swift_retain();
  sub_217FEB698(v3);
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)previewItemDisplayState:(id)a3 wasAppliedToItemAtIndex:(unint64_t)a4
{
}

- (void)startTransitionWithSourceViewProvider:(QLTransitionContext *)a3 transitionController:(QLTransitionControllerProtocol *)a4 presenting:(BOOL)a5 useInteractiveTransition:(BOOL)a6 completionHandler:(id)a7
{
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBA400);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
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
  v19[4] = &unk_267BB99B0;
  v19[5] = v17;
  v20 = (void *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_267BB99B8;
  v20[5] = v19;
  v21 = a3;
  swift_unknownObjectRetain();
  swift_retain();
  sub_21802D754((uint64_t)v15, (uint64_t)&unk_267BB99C0, (uint64_t)v20);
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
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_218038824();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_267BB9990;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_267BB9998;
  v12[5] = v11;
  swift_retain();
  sub_21802D754((uint64_t)v7, (uint64_t)&unk_267BB99A0, (uint64_t)v12);
  swift_release();
}

- (void)invalidateServiceWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBA400);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_218038824();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_267BB9970;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_267BB9978;
  v12[5] = v11;
  swift_retain();
  sub_21802D754((uint64_t)v7, (uint64_t)&unk_267BB9980, (uint64_t)v12);
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
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_218038824();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_267BB9950;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_267BB9958;
  v12[5] = v11;
  swift_retain();
  sub_21802D754((uint64_t)v7, (uint64_t)&unk_267BB9960, (uint64_t)v12);
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
  uint64_t v7 = _Block_copy(a5);
  if (v7)
  {
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = v7;
    uint64_t v7 = sub_217FF18B0;
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = a3;
  swift_retain();
  sub_217FEE714((uint64_t)v9, a4, v7, v8);
  sub_217FF18A0((uint64_t)v7);
  swift_release();
}

- (void)setIsContentManaged:(BOOL)a3
{
}

- (void)saveCurrentPreviewEditsSynchronously:(BOOL)a3 withCompletionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBA400);
  MEMORY[0x270FA5388](v7 - 8);
  id v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = sub_218038824();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_267BB9930;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_267BB9938;
  v14[5] = v13;
  swift_retain();
  sub_21802D754((uint64_t)v9, (uint64_t)&unk_267BB9940, (uint64_t)v14);
  swift_release();
}

- (void)getPreviewCollectionUUIDWithCompletionHandlerWithCompletionHandler:(id)a3
{
  v3 = _Block_copy(a3);
  _Block_copy(v3);
  uint64_t v4 = swift_retain();
  sub_217FF1560(v4, (void (**)(void, void))v3);
  _Block_release(v3);
  _Block_release(v3);

  swift_release();
}

- (void)setNotificationCenter:(id)a3
{
  uint64_t v4 = self;
  swift_unknownObjectRetain();
  swift_retain();
  id v5 = objc_msgSend(v4, sel_sharedInstance);
  if (v5)
  {
    id v6 = v5;
    objc_msgSend(v5, sel_setRemoteNotificationCenter_, a3);
    swift_unknownObjectRelease();
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    swift_release();
  }
}

- (void)getNetworkObserverWithCompletionBlock:(id)a3
{
  v3 = (void (**)(void *, id))_Block_copy(a3);
  uint64_t v4 = self;
  swift_retain();
  id v5 = objc_msgSend(v4, sel_sharedInstance);
  v3[2](v3, v5);

  _Block_release(v3);

  swift_release();
}

- (void)preparePreviewCollectionForInvalidationWithCompletionHandlerWithCompletionHandler:(id)a3
{
  v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  swift_retain();
  QLAppExtensionSceneProxy.preparePreviewCollectionForInvalidationWithCompletionHandler(completionHandler:)((uint64_t)sub_217FF1550, v4);
  swift_release();

  swift_release();
}

@end