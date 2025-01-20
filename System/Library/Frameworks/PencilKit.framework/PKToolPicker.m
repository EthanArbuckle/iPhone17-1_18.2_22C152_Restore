@interface PKToolPicker
+ (BOOL)_canBecomeVisible;
+ (BOOL)_canShowHandwritingTool;
+ (BOOL)_defaultValueForToolStatePersistenceEnabled;
+ (BOOL)_internalClassWantsToolPicker:(id)a3 visibleForResponder:(id)a4;
+ (BOOL)_prefersPencilHoverPreviewEnabled;
+ (BOOL)_textInputWantsToolPickerVisible:(id)a3 forFirstResponder:(id)a4;
+ (BOOL)isActiveToolPickerVisibleForWindow:(id)a3;
+ (PKToolPicker)sharedToolPickerForWindow:(UIWindow *)window;
+ (id)_existingToolPickerForWindow:(id)a3;
+ (id)_keyEncodedToolsByIdentifier:(id)a3;
+ (id)_toolPickersForWindow:(uint64_t)a1;
+ (id)_windowForToolPicker:(id)a3;
+ (id)_windowSceneForToolPicker:(id)a3;
+ (id)activeToolPickerForWindow:(id)a3;
+ (id)existingPaletteViewForWindow:(id)a3;
+ (void)_cycleToolPickersForResponder:(uint64_t)a1;
+ (void)_dockToolPickerForWindowScene:(uint64_t)a3 toAutoHideCornerAnimated:;
+ (void)_performWithVisibilityUpdatesEnabled:(BOOL)a3 window:(id)a4 block:(id)a5;
+ (void)_setCanBecomeVisible:(BOOL)a3;
+ (void)_setPrefersHoverPreviewEnabled:(BOOL)a3 withCompletion:(id)a4;
+ (void)_setPrefersPencilOnlyDrawingForiWork:(BOOL)a3;
- (BOOL)_backgroundVisible;
- (BOOL)_canInsertTool:(id)a3;
- (BOOL)_canRemoveTool:(id)a3;
- (BOOL)_canResetToolsFrom:(id)a3;
- (BOOL)_canShowEllipsisButtonInCompactSize;
- (BOOL)_didCalculateVisibleBeforeResponderChanges;
- (BOOL)_doneActionResignsFirstResponder;
- (BOOL)_doneButtonVisible;
- (BOOL)_hasEraserTool;
- (BOOL)_hasGenerationTool;
- (BOOL)_hasHandwritingTool;
- (BOOL)_hasLassoTool;
- (BOOL)_hasResponderRegisteredForWindow:(id)a3;
- (BOOL)_hasToolPassingTest:(id)a3;
- (BOOL)_ignoresSafeAreaInsetsInCompactSize;
- (BOOL)_interactionIsValid;
- (BOOL)_internalClassesAcceptingFirstResponderContainsObject:(id)a3;
- (BOOL)_isActiveToolPickerForWindow:(id)a3;
- (BOOL)_isAnimatingToVisible;
- (BOOL)_isCanvasGenerationToolSelected;
- (BOOL)_isContextMenuPresented;
- (BOOL)_isEnabled;
- (BOOL)_isHandwritingToolSelected;
- (BOOL)_isInputViewVisible;
- (BOOL)_isLassoToolEditingViewVisible;
- (BOOL)_isLockedHidden;
- (BOOL)_isPencilInteractionEnabledWhenNotVisible;
- (BOOL)_isToolStatePersistenceEnabled;
- (BOOL)_overlapsMainWindow;
- (BOOL)_presentsDetached;
- (BOOL)_shadowVisible;
- (BOOL)_shouldHideHoverPreviewToggle;
- (BOOL)_shouldTrackHoverLocationForPencilTapActions;
- (BOOL)_showsHandwritingTool;
- (BOOL)_showsPlusButton;
- (BOOL)_showsRuler;
- (BOOL)_showsShapeButton;
- (BOOL)_showsTextButton;
- (BOOL)_squeezePaletteVisible;
- (BOOL)_startOpacityEditing;
- (BOOL)_toolPickerVisible;
- (BOOL)_useEqualSpacingLayoutInCompactSize;
- (BOOL)_useNewAutosaveNameBehavior;
- (BOOL)_visibilityUpdatesEnabled;
- (BOOL)_wantsBottomLineDividerVisibleInCompactSize;
- (BOOL)_wantsClearBackgroundColorInCompactSize;
- (BOOL)_wantsEllipsisButtonVisibleInCompactSize;
- (BOOL)_wantsExternalVisibility;
- (BOOL)_wantsUndoRedoButtonsVisibleInCompactSize;
- (BOOL)_wantsVisibleForFirstResponder:(id)a3;
- (BOOL)_wasVisibleBeforeResponderChanges;
- (BOOL)colorSwatchesVisible;
- (BOOL)isRulerActive;
- (BOOL)isVisible;
- (BOOL)prefersLargeContextualEditingUI;
- (BOOL)showsDrawingPolicyControls;
- (CGRect)frameObscuredInView:(UIView *)view;
- (CGSize)_contentSize;
- (NSArray)_tools;
- (NSArray)_toolsState;
- (NSArray)passthroughViews;
- (NSArray)toolItems;
- (NSDirectionalEdgeInsets)_edgeInsetsInCompactSize;
- (NSHashTable)_observers;
- (NSMapTable)_firstRespondersForVisibleUI;
- (NSString)_paletteViewStateRestorationDefaultsKey;
- (NSString)selectedToolItemIdentifier;
- (NSString)stateAutosaveName;
- (PKContentVersion)maximumSupportedContentVersion;
- (PKDrawingPaletteView)_paletteView;
- (PKPaletteHostView)_paletteHostView;
- (PKPaletteViewAnnotationDelegate)_annotationDelegate;
- (PKPaletteViewInteraction)_interaction;
- (PKTool)selectedTool;
- (PKToolPicker)init;
- (PKToolPicker)initWithToolItems:(id)a3;
- (PKToolPickerDelegate)delegate;
- (PKToolPickerItem)selectedToolItem;
- (PKToolPickerItemManager)_toolItemManager;
- (PKToolPickerPaletteViewDelegateProxy)_paletteViewDelegateProxy;
- (PKToolPickerPopoverPresentationConfiguring)_popoverPresentationConfiguration;
- (PKToolPickerPrivateDelegate)_delegate;
- (PKToolPickerPrivateDelegate)_temporarySelectionDelegate;
- (UIBarButtonItem)accessoryItem;
- (UIEdgeInsets)layoutSceneMargins;
- (UIKeyboardSceneDelegateVisibilityObserver)keyboardSceneDelegateVisibilityObserver;
- (UIMenu)_plusButtonMenu;
- (UIUserInterfaceStyle)colorUserInterfaceStyle;
- (UIUserInterfaceStyle)overrideUserInterfaceStyle;
- (UIView)_contextualEditingView;
- (UIView)_lassoToolEditingView;
- (UIViewController)_plusButtonViewController;
- (UIViewController)_presentationController;
- (UIViewController)_shapeButtonViewController;
- (UIViewController)_textButtonViewController;
- (UIViewController)presentationViewController;
- (double)_fullScreenWindowScaleFactor;
- (double)_interItemToolsSpacingInCompactSize;
- (double)_interItemUndoRedoButtonsSpacingInCompactSize;
- (double)_scalingFactor;
- (id)_applicationWindow;
- (id)_currentFirstResponder;
- (id)_delegateForSelector:(SEL)a3;
- (id)_handwritingTool;
- (id)_paletteAccessibilityIdentifier;
- (id)_signaturesViewControllerProvider;
- (id)_validatedEncodedToolsArray:(id)a3;
- (id)_windowScene;
- (int64_t)_numberOfToolsAfterRuler;
- (int64_t)_palettePosition;
- (unint64_t)_edgeForContextualEditingView;
- (unint64_t)_indexOfGenerationTool;
- (unint64_t)_indexOfMarkerTool;
- (unint64_t)_indexOfPencilTool;
- (unint64_t)_indexOfTool:(id)a3;
- (unint64_t)_indexOfTool:(id)a3 tools:(id)a4;
- (unint64_t)_indexOfToolPassingTest:(id)a3;
- (unint64_t)permittedArrowDirections;
- (unint64_t)selectionMask;
- (void)_addTool:(id)a3;
- (void)_addTool:(id)a3 atIndex:(int64_t)a4;
- (void)_addTool:(id)a3 updateUI:(BOOL)a4;
- (void)_canvasViewWillBeginDrawing:(id)a3;
- (void)_disableTapInteractionWhenNotVisible;
- (void)_dismissPopovers;
- (void)_enableTapInteractionForWindow:(id)a3;
- (void)_endOpacityEditing;
- (void)_handleDidInvokeAddTextBox;
- (void)_handleFirstResponderDidChangeNotification:(id)a3;
- (void)_handleHandwritingEducationPaneSettingsDidChange:(id)a3;
- (void)_handleInsertStickerFromItemProvider:(uint64_t)a1;
- (void)_handleSqueezeInteractionWillShowPaletteViewNotification:(id)a3;
- (void)_insertHandwritingTool;
- (void)_insertTool:(id)a3 atIndex:(unint64_t)a4;
- (void)_insertTool:(id)a3 atIndex:(unint64_t)a4 updateUI:(BOOL)a5;
- (void)_lockHidden;
- (void)_lockHiddenNotify:(BOOL)a3;
- (void)_notifyScaleFactorDidChange;
- (void)_notifySelectedToolDidChange;
- (void)_notifyVisibilityDidChangeIsAnimationFinished:(BOOL)a3;
- (void)_paletteContentSizeDidChange;
- (void)_performPencilPreferredActionShowColorPalette;
- (void)_performPencilPreferredActionSwitchEraser;
- (void)_performPencilPreferredActionSwitchPrevious;
- (void)_performWithVisibilityUpdatesEnabled:(BOOL)a3 block:(id)a4;
- (void)_presentViewController:(id)a3 asPopoverFromItem:(id)a4;
- (void)_removeHandwritingTool;
- (void)_removeNewInks;
- (void)_removeTool:(id)a3;
- (void)_removeTool:(id)a3 updateUI:(BOOL)a4;
- (void)_removeToolsAtIndexes:(id)a3;
- (void)_removeToolsAtIndexes:(id)a3 updateUI:(BOOL)a4;
- (void)_resetTools:(id)a3 selectedTool:(id)a4;
- (void)_resetTools:(id)a3 selectedTool:(id)a4 notify:(BOOL)a5;
- (void)_restoreToolPickerState;
- (void)_restoreToolPickerStateFromRepresentation:(id)a3 notify:(BOOL)a4;
- (void)_restoreToolPickerStateNotify:(BOOL)a3;
- (void)_saveStateIfNecessary;
- (void)_saveToolPickerState;
- (void)_setAnnotationDelegate:(id)a3;
- (void)_setBackgroundVisible:(BOOL)a3;
- (void)_setContextMenuPresented:(BOOL)a3;
- (void)_setDoneActionResignsFirstResponder:(BOOL)a3;
- (void)_setDoneButtonVisible:(BOOL)a3;
- (void)_setEdgeInsetsInCompactSize:(NSDirectionalEdgeInsets)a3;
- (void)_setEnabled:(BOOL)a3;
- (void)_setIgnoresSafeAreaInsetsInCompactSize:(BOOL)a3;
- (void)_setInputViewVisible:(BOOL)a3;
- (void)_setInterItemToolsSpacingInCompactSize:(double)a3;
- (void)_setInterItemUndoRedoButtonsSpacingInCompactSize:(double)a3;
- (void)_setInteraction:(id)a3;
- (void)_setLassoToolEditingViewVisible:(BOOL)a3;
- (void)_setNumberOfToolsAfterRuler:(int64_t)a3;
- (void)_setOverlapsWindow:(BOOL)a3;
- (void)_setPlusButtonMenu:(id)a3;
- (void)_setPlusButtonViewController:(id)a3;
- (void)_setPresentationController:(id)a3;
- (void)_setPresentsDetached:(BOOL)a3;
- (void)_setSelectedColor:(id)a3 isFromExtendedColorPicker:(BOOL)a4;
- (void)_setSelectedTool:(id)a3 saveState:(BOOL)a4 updateUI:(BOOL)a5;
- (void)_setSelectedTool:(id)a3 saveState:(BOOL)a4 updateUI:(BOOL)a5 updateLastSelectedTool:(BOOL)a6;
- (void)_setSelectionMask:(unint64_t)a3 updateUI:(BOOL)a4;
- (void)_setShadowVisible:(BOOL)a3;
- (void)_setShapeButtonViewController:(id)a3;
- (void)_setShouldHideHoverPreviewToggle:(BOOL)a3;
- (void)_setShouldTrackHoverLocationForPencilTapActions:(BOOL)a3;
- (void)_setShowsHandwritingTool:(BOOL)a3;
- (void)_setShowsPlusButton:(BOOL)a3;
- (void)_setShowsRuler:(BOOL)a3;
- (void)_setShowsShapeButton:(BOOL)a3;
- (void)_setShowsTextButton:(BOOL)a3;
- (void)_setSignaturesViewControllerProvider:(id)a3;
- (void)_setTextButtonViewController:(id)a3;
- (void)_setUseEqualSpacingLayoutInCompactSize:(BOOL)a3;
- (void)_setVisibilityUpdatesEnabled:(BOOL)a3;
- (void)_setVisibleInWindow:(id)a3;
- (void)_setVisibleInWindow:(uint64_t)a3 animated:(uint64_t)a4 notify:(void *)a5 completion:;
- (void)_setWantsBottomLineDividerVisibleInCompactSize:(BOOL)a3;
- (void)_setWantsClearBackgroundColorInCompactSize:(BOOL)a3;
- (void)_setWantsEllipsisButtonVisibleInCompactSize:(BOOL)a3;
- (void)_setWantsExternalVisibility:(BOOL)a3;
- (void)_setWantsUndoRedoButtonsVisibleInCompactSize:(BOOL)a3;
- (void)_showImageWandTipWithController:(id)a3;
- (void)_tellDelegateToHideToolPicker;
- (void)_textInputResponderDidReloadNotification:(id)a3;
- (void)_unlockHidden;
- (void)_unlockHiddenNotify:(BOOL)a3;
- (void)_updateGenerationToolInstallation;
- (void)_updateHandwritingInputAssistantItems;
- (void)_updateHandwritingToolInstallation;
- (void)_updateNewInks;
- (void)_updatePaletteTraitCollection:(id)a3;
- (void)_updatePaletteUserInterfaceStyle:(int64_t)a3;
- (void)_updatePaletteView:(id)a3;
- (void)_updateToolPickerVisibility;
- (void)_updateToolPickerVisibilityContextMenuPresentedDidChange:(BOOL)a3;
- (void)_updateToolPickerVisibilityWithContext:(void *)a3 completion:;
- (void)_updateUI;
- (void)_updateUserInterfaceStyle;
- (void)addObserver:(id)observer;
- (void)calculateIsVisibleBeforeResponderChangesForCurrentRunLoopIfNecessary;
- (void)dealloc;
- (void)imageWandTipControllerTipStatusDidUpdate:(id)a3;
- (void)keyboardSceneDelegate:(id)a3 inputViewSetVisibilityDidChange:(BOOL)a4 includedReset:(BOOL)a5;
- (void)paletteViewInteractionDidActivate:(id)a3;
- (void)removeObserver:(id)observer;
- (void)setAccessoryItem:(id)a3;
- (void)setColorSwatchesVisible:(BOOL)a3;
- (void)setColorUserInterfaceStyle:(UIUserInterfaceStyle)colorUserInterfaceStyle;
- (void)setDelegate:(id)a3;
- (void)setKeyboardSceneDelegateVisibilityObserver:(id)a3;
- (void)setMaximumSupportedContentVersion:(PKContentVersion)maximumSupportedContentVersion;
- (void)setOverrideUserInterfaceStyle:(UIUserInterfaceStyle)overrideUserInterfaceStyle;
- (void)setPrefersLargeContextualEditingUI:(BOOL)a3;
- (void)setRulerActive:(BOOL)rulerActive;
- (void)setSelectedTool:(PKTool *)selectedTool;
- (void)setSelectedToolItem:(id)a3;
- (void)setSelectedToolItemIdentifier:(id)a3;
- (void)setSelectionMask:(unint64_t)a3;
- (void)setShowsDrawingPolicyControls:(BOOL)showsDrawingPolicyControls;
- (void)setStateAutosaveName:(NSString *)stateAutosaveName;
- (void)setVisibility:(int64_t)a3 whenFirstResponderIsDescendantOf:(id)a4;
- (void)setVisible:(BOOL)visible forFirstResponder:(UIResponder *)responder;
- (void)set_delegate:(id)a3;
- (void)set_didCalculateVisibleBeforeResponderChanges:(BOOL)a3;
- (void)set_firstRespondersForVisibleUI:(id)a3;
- (void)set_observers:(id)a3;
- (void)set_pencilInteractionEnabledWhenNotVisible:(BOOL)a3;
- (void)set_temporarySelectionDelegate:(id)a3;
- (void)set_toolPickerVisible:(BOOL)a3;
- (void)set_wasVisibleBeforeResponderChanges:(BOOL)a3;
- (void)toolPickerItemDidChange:(id)a3;
- (void)toolPickerItemReloadImage:(id)a3;
@end

@implementation PKToolPicker

+ (BOOL)isActiveToolPickerVisibleForWindow:(id)a3
{
  v3 = [a1 activeToolPickerForWindow:a3];
  if ([v3 isVisible]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 _isAnimatingToVisible];
  }

  return v4;
}

+ (id)activeToolPickerForWindow:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  char v4 = objc_msgSend((id)_allToolPickers, "copy", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(v4);
      }
      v9 = [*(id *)(*((void *)&v11 + 1) + 8 * v8) toolPicker];
      if ([v9 _isActiveToolPickerForWindow:v3]) {
        break;
      }

      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v9 = 0;
  }

  return v9;
}

- (BOOL)_hasResponderRegisteredForWindow:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [(PKToolPicker *)self _firstRespondersForVisibleUI];
  uint64_t v6 = [v5 keyEnumerator];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (!v7) {
    goto LABEL_16;
  }
  uint64_t v8 = *(void *)v16;
  while (2)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v16 != v8) {
        objc_enumerationMutation(v6);
      }
      v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = v10;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          continue;
        }
        id v11 = [v10 view];
      }
      long long v12 = v11;
      if (v11)
      {
        id v13 = [v11 window];

        if (v13 == v4)
        {
          LOBYTE(v7) = 1;
          goto LABEL_16;
        }
      }
    }
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7) {
      continue;
    }
    break;
  }
LABEL_16:

  return v7;
}

- (id)_currentFirstResponder
{
  if (self->_toolPickerVisibility)
  {
    v2 = [(PKToolPickerVisibility *)self->_toolPickerVisibility currentFirstResponder];
  }
  else
  {
    id v3 = [(PKToolPicker *)self _interaction];
    id v4 = [v3 hostingWindow];
    v2 = [v4 firstResponder];
  }

  return v2;
}

- (id)_delegateForSelector:(SEL)a3
{
  id v4 = [(PKToolPicker *)self _temporarySelectionDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    uint64_t v6 = [(PKToolPicker *)self _temporarySelectionDelegate];
  }
  else
  {
    uint64_t v7 = [(PKToolPicker *)self _delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      uint64_t v6 = [(PKToolPicker *)self _delegate];
    }
    else
    {
      uint64_t v6 = 0;
    }
  }

  return v6;
}

- (BOOL)_wantsVisibleForFirstResponder:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[PKToolPicker _internalClassWantsToolPicker:self visibleForResponder:v4];
  BOOL v6 = +[PKToolPicker _textInputWantsToolPickerVisible:self forFirstResponder:v4];
  char v7 = 1;
  if (!v5 && !v6)
  {
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = PKDynamicCast(v8, v4);
    if (v9)
    {
      id v10 = (id)v9;
      char v7 = 0;
      do
      {
        id v11 = [(PKToolPicker *)self _firstRespondersForVisibleUI];
        long long v12 = [v11 objectForKey:v10];

        if (v12)
        {
          switch([v12 integerValue])
          {
            case 0:
              v7 |= v10 == v4;
              break;
            case 1:
              char v7 = 1;
              break;
            case 2:
              v7 &= v10 != v4;
              break;
            case 3:
              char v7 = 0;
              break;
            default:
              break;
          }
        }
        uint64_t v13 = [v10 superview];

        id v10 = (id)v13;
      }
      while (v13);
    }
    else
    {
      long long v14 = [(PKToolPicker *)self _firstRespondersForVisibleUI];
      long long v15 = [v14 objectForKey:v4];

      if (v15)
      {
        if ((unint64_t)[v15 integerValue] >= 2) {
          char v7 = 0;
        }
        else {
          char v7 = -1;
        }
      }
      else
      {
        char v7 = 0;
      }
    }
  }

  return v7 & 1;
}

+ (void)_cycleToolPickersForResponder:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  self;
  if (v2)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v3 = objc_msgSend((id)_allToolPickers, "copy", 0);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = [*(id *)(*((void *)&v10 + 1) + 8 * v7) toolPicker];
          if (v8)
          {
            uint64_t v9 = [v2 _responderWindow];
            -[PKToolPicker _setVisibleInWindow:animated:notify:completion:]((uint64_t)v8, v9, 0, 1, 0);
            -[PKToolPicker _setVisibleInWindow:animated:notify:completion:]((uint64_t)v8, 0, 0, 1, 0);
          }
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }
  }
}

- (void)_setVisibleInWindow:(uint64_t)a3 animated:(uint64_t)a4 notify:(void *)a5 completion:
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a5;
  long long v11 = v10;
  if (a1)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __63__PKToolPicker__setVisibleInWindow_animated_notify_completion___block_invoke;
    aBlock[3] = &unk_1E64C6060;
    id v12 = v10;
    id v68 = v12;
    long long v13 = (void (**)(void))_Block_copy(aBlock);
    if (__canBecomeVisible && ([(id)a1 _isLockedHidden] & 1) == 0)
    {
      char v14 = [(id)a1 _isEnabled];
      if (!v9 || (v14 & 1) != 0) {
        goto LABEL_11;
      }
    }
    else if (!v9)
    {
      goto LABEL_11;
    }

    uint64_t v15 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v16 = +[PKToolPicker _canBecomeVisible];
      int v17 = [(id)a1 _isLockedHidden];
      int v18 = [(id)a1 _isEnabled];
      *(_DWORD *)buf = 134218752;
      uint64_t v72 = a1;
      __int16 v73 = 1024;
      *(_DWORD *)v74 = v16;
      *(_WORD *)&v74[4] = 1024;
      *(_DWORD *)&v74[6] = v17;
      LOWORD(v75[0]) = 1024;
      *(_DWORD *)((char *)v75 + 2) = v18;
      _os_log_impl(&dword_1C44F8000, v15, OS_LOG_TYPE_DEFAULT, "ToolPicker: %p, skip making tool picker visible, canBecomeVisible: %{BOOL}d, isLockedHidden: %{BOOL}d, isEnabled: %{BOOL}d", buf, 0x1Eu);
    }

    id v9 = 0;
LABEL_11:
    if (([(id)a1 _visibilityUpdatesEnabled] & 1) == 0)
    {
      uint64_t v20 = os_log_create("com.apple.pencilkit", "ToolPicker");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = [(id)a1 _visibilityUpdatesEnabled];
        *(_DWORD *)buf = 134218240;
        uint64_t v72 = a1;
        __int16 v73 = 1024;
        *(_DWORD *)v74 = v21;
        _os_log_impl(&dword_1C44F8000, v20, OS_LOG_TYPE_DEFAULT, "ToolPicker: %p, skip updating tool picker visibility, _visibilityUpdatesEnabled: %{BOOL}d", buf, 0x12u);
      }

      goto LABEL_18;
    }
    if ([(id)a1 _visibilityUpdatesEnabled])
    {
      v19 = *(void **)(a1 + 32);
      if (v19)
      {
        [v19 setVisibleInWindow:v9 animated:a3 notify:a4 completion:v12];
LABEL_49:

        goto LABEL_50;
      }
    }
    if ([(id)a1 _squeezePaletteVisible])
    {
      char v22 = [(id)a1 isVisible];
      if (v9)
      {
        if ((v22 & 1) == 0)
        {
          uint64_t v20 = os_log_create("com.apple.pencilkit", "ToolPicker");
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218240;
            uint64_t v72 = a1;
            __int16 v73 = 1024;
            *(_DWORD *)v74 = 1;
            _os_log_impl(&dword_1C44F8000, v20, OS_LOG_TYPE_DEFAULT, "ToolPicker: %p can't become visible, isSqueezePaletteVisible: %{BOOL}d", buf, 0x12u);
          }
LABEL_18:

          v13[2](v13);
          goto LABEL_49;
        }
      }
    }
    [(id)a1 calculateIsVisibleBeforeResponderChangesForCurrentRunLoopIfNecessary];
    v23 = [v9 windowScene];
    v24 = +[PKPaletteViewInteraction paletteViewInteractionForWindow:v9 windowScene:v23];

    if (v24)
    {
      [v24 setDelegate:a1];
      v25 = [(id)a1 _paletteViewDelegateProxy];
      v26 = [v24 paletteView];
      [v26 setDelegate:v25];
    }
    v27 = [(id)a1 _interaction];

    if (v24 == v27)
    {
      v36 = [v24 paletteView];
      [v36 updateUndoRedo];

      v13[2](v13);
LABEL_48:

      goto LABEL_49;
    }
    int v56 = a4;
    uint64_t v28 = [v9 windowScene];
    if (v28) {
      goto LABEL_29;
    }
    v29 = [(id)a1 _interaction];
    [v29 view];
    v31 = uint64_t v30 = a3;
    v32 = [v31 window];
    uint64_t v33 = [v32 windowScene];

    a3 = v30;
    uint64_t v28 = v33;
    if (v33)
    {
LABEL_29:
      v69 = @"PKToolPickerNotificationWindowSceneUserInfoKey";
      uint64_t v70 = v28;
      v53 = (void *)v28;
      v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v70 forKeys:&v69 count:1];
      char v34 = 0;
      if (v24)
      {
LABEL_30:
        v35 = [v24 hostingWindow];
        v54 = [v35 firstResponder];
        goto LABEL_34;
      }
    }
    else
    {
      v55 = 0;
      v53 = 0;
      char v34 = 1;
      if (v24) {
        goto LABEL_30;
      }
    }
    v35 = [(id)a1 _interaction];
    v37 = [v35 hostingWindow];
    v54 = [v37 firstResponder];

LABEL_34:
    if (v56)
    {
      int v38 = [(id)a1 _visibilityUpdatesEnabled];
      if (v24)
      {
LABEL_36:
        [(id)a1 _setInteraction:v24];
        [(id)a1 _setInputViewVisible:1];
        objc_msgSend((id)a1, "set_wasVisibleBeforeResponderChanges:", 1);
        v39 = os_log_create("com.apple.pencilkit", "ToolPicker");
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          v40 = -[NSObject _pkDebugStringRepresentation](v54);
          *(_DWORD *)buf = 134218498;
          uint64_t v72 = a1;
          __int16 v73 = 2112;
          *(void *)v74 = v40;
          *(_WORD *)&v74[8] = 1024;
          v75[0] = v56;
          _os_log_impl(&dword_1C44F8000, v39, OS_LOG_TYPE_DEFAULT, "ToolPicker: %p, interaction should show palette, currentFirstResponder: %@, notify: %{BOOL}d", buf, 0x1Cu);
        }
        objc_msgSend((id)a1, "set_toolPickerVisible:", 1);
        if (v38)
        {
          v41 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v41 postNotificationName:@"PKToolPickerWillShowNotification" object:a1 userInfo:v55];

          *(unsigned char *)(a1 + 100) = 1;
          [(id)a1 _notifyVisibilityDidChangeIsAnimationFinished:0];
        }
        v62[0] = MEMORY[0x1E4F143A8];
        v62[1] = 3221225472;
        v62[2] = __63__PKToolPicker__setVisibleInWindow_animated_notify_completion___block_invoke_78;
        v62[3] = &unk_1E64C6088;
        v62[4] = a1;
        char v65 = v38;
        v42 = v55;
        id v63 = v55;
        char v66 = v56;
        v64 = v13;
        [v24 showPaletteViewAnimated:a3 completion:v62];

        v43 = v63;
        goto LABEL_41;
      }
    }
    else
    {
      int v38 = 0;
      if (v24) {
        goto LABEL_36;
      }
    }
    if (v34) {
      goto LABEL_45;
    }
    v44 = [(id)a1 _interaction];
    v45 = [v44 paletteView];
    [v45 delegate];
    v46 = unsigned int v52 = a3;
    v47 = [(id)a1 _paletteViewDelegateProxy];

    if (v46 != v47)
    {
LABEL_45:
      v42 = v55;
      if (!v9)
      {
        [(id)a1 _setInputViewVisible:0];
        objc_msgSend((id)a1, "set_toolPickerVisible:", 0);
        v48 = [(id)a1 _selectionContext];
        [v48 setSelectionMask:0];

        v42 = v55;
        v13[2](v13);
      }
      goto LABEL_47;
    }
    v49 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      v50 = -[NSObject _pkDebugStringRepresentation](v54);
      *(_DWORD *)buf = 134218498;
      uint64_t v72 = a1;
      __int16 v73 = 2112;
      *(void *)v74 = v50;
      *(_WORD *)&v74[8] = 1024;
      v75[0] = v56;
      _os_log_impl(&dword_1C44F8000, v49, OS_LOG_TYPE_DEFAULT, "ToolPicker: %p, interaction should hide palette, currentFirstResponder: %@, notify: %{BOOL}d", buf, 0x1Cu);
    }
    objc_msgSend((id)a1, "set_toolPickerVisible:", 0);
    if (v38) {
      [(id)a1 _notifyVisibilityDidChangeIsAnimationFinished:0];
    }
    v51 = [(id)a1 _interaction];
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __63__PKToolPicker__setVisibleInWindow_animated_notify_completion___block_invoke_79;
    v57[3] = &unk_1E64C6088;
    v57[4] = a1;
    char v60 = v38;
    id v58 = v55;
    char v61 = v56;
    v59 = v13;
    [v51 hidePaletteViewAnimated:v52 completion:v57];

    v42 = v55;
    v43 = v58;
LABEL_41:

LABEL_47:
    [(id)a1 _setInteraction:v24];

    goto LABEL_48;
  }
LABEL_50:
}

+ (id)_toolPickersForWindow:(uint64_t)a1
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  self;
  if (!v2 || (objc_opt_respondsToSelector() & 1) != 0 && ([v2 _isRemoteInputHostWindow] & 1) != 0)
  {
    id v3 = 0;
  }
  else
  {
    uint64_t v4 = [v2 firstResponder];
    if (v4)
    {
      uint64_t v5 = (void *)[(id)_allToolPickers copy];
      id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v6 = v5;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v15;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v15 != v9) {
              objc_enumerationMutation(v6);
            }
            long long v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "toolPicker", (void)v14);
            id v12 = v11;
            if (v11 && [v11 _wantsVisibleForFirstResponder:v4]) {
              [v3 addObject:v12];
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v8);
      }
    }
    else
    {
      id v3 = 0;
    }
  }

  return v3;
}

+ (id)_windowSceneForToolPicker:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  memset(v8, 0, sizeof(v8));
  id v3 = objc_msgSend(a3, "_firstRespondersForVisibleUI", 0);
  uint64_t v4 = [v3 keyEnumerator];

  if ([v4 countByEnumeratingWithState:v8 objects:v9 count:16])
  {
    uint64_t v5 = [**((id **)&v8[0] + 1) _responderWindow];
    id v6 = [v5 windowScene];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)_windowForToolPicker:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  [v3 calculateIsVisibleBeforeResponderChangesForCurrentRunLoopIfNecessary];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  uint64_t v4 = [MEMORY[0x1E4FB1B70] _scenesIncludingInternalForPK:1];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v57 objects:v65 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v58;
    uint64_t v7 = off_1E64C4000;
    v40 = v4;
    uint64_t v37 = *(void *)v58;
    do
    {
      uint64_t v8 = 0;
      uint64_t v38 = v5;
      do
      {
        if (*(void *)v58 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v39 = v8;
        uint64_t v9 = *(void **)(*((void *)&v57 + 1) + 8 * v8);
        long long v53 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        uint64_t v10 = objc_msgSend(v9, "_allWindows", v35);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v53 objects:v64 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v54;
          while (2)
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v54 != v13) {
                objc_enumerationMutation(v10);
              }
              long long v15 = *(void **)(*((void *)&v53 + 1) + 8 * i);
              if ([v15 isKeyWindow])
              {
                long long v51 = 0u;
                long long v52 = 0u;
                long long v49 = 0u;
                long long v50 = 0u;
                long long v16 = +[PKToolPicker _toolPickersForWindow:]((uint64_t)v7[187], v15);
                uint64_t v17 = [v16 countByEnumeratingWithState:&v49 objects:v63 count:16];
                if (v17)
                {
                  uint64_t v18 = v17;
                  id v19 = 0;
                  uint64_t v20 = *(void *)v50;
                  while (2)
                  {
                    uint64_t v21 = 0;
                    char v22 = v19;
                    do
                    {
                      if (*(void *)v50 != v20) {
                        objc_enumerationMutation(v16);
                      }
                      id v19 = *(id *)(*((void *)&v49 + 1) + 8 * v21);

                      if (v19 == v3)
                      {
LABEL_44:
                        id v33 = v15;

                        uint64_t v4 = v40;
                        goto LABEL_46;
                      }
                      ++v21;
                      char v22 = v19;
                    }
                    while (v18 != v21);
                    uint64_t v18 = [v16 countByEnumeratingWithState:&v49 objects:v63 count:16];
                    if (v18) {
                      continue;
                    }
                    break;
                  }

                  uint64_t v4 = v40;
                  uint64_t v6 = v37;
                }

                uint64_t v7 = off_1E64C4000;
                goto LABEL_25;
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v53 objects:v64 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }
LABEL_25:

        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        uint64_t v10 = [v9 _allWindows];
        uint64_t v23 = [v10 countByEnumeratingWithState:&v45 objects:v62 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v46;
          uint64_t v35 = *(void *)v46;
          while (2)
          {
            uint64_t v26 = 0;
            uint64_t v36 = v24;
            do
            {
              if (*(void *)v46 != v25) {
                objc_enumerationMutation(v10);
              }
              long long v15 = *(void **)(*((void *)&v45 + 1) + 8 * v26);
              long long v41 = 0u;
              long long v42 = 0u;
              long long v43 = 0u;
              long long v44 = 0u;
              long long v16 = +[PKToolPicker _toolPickersForWindow:]((uint64_t)v7[187], v15);
              uint64_t v27 = [v16 countByEnumeratingWithState:&v41 objects:v61 count:16];
              if (v27)
              {
                uint64_t v28 = v27;
                id v29 = 0;
                uint64_t v30 = *(void *)v42;
LABEL_32:
                uint64_t v31 = 0;
                v32 = v29;
                while (1)
                {
                  if (*(void *)v42 != v30) {
                    objc_enumerationMutation(v16);
                  }
                  id v29 = *(id *)(*((void *)&v41 + 1) + 8 * v31);

                  if (v29 == v3) {
                    goto LABEL_44;
                  }
                  ++v31;
                  v32 = v29;
                  if (v28 == v31)
                  {
                    uint64_t v28 = [v16 countByEnumeratingWithState:&v41 objects:v61 count:16];
                    if (v28) {
                      goto LABEL_32;
                    }

                    uint64_t v4 = v40;
                    uint64_t v24 = v36;
                    uint64_t v6 = v37;
                    uint64_t v25 = v35;
                    break;
                  }
                }
              }

              ++v26;
              uint64_t v7 = off_1E64C4000;
            }
            while (v26 != v24);
            uint64_t v24 = [v10 countByEnumeratingWithState:&v45 objects:v62 count:16];
            if (v24) {
              continue;
            }
            break;
          }
        }

        uint64_t v8 = v39 + 1;
      }
      while (v39 + 1 != v38);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v57 objects:v65 count:16];
      id v33 = 0;
    }
    while (v5);
  }
  else
  {
    id v33 = 0;
  }
LABEL_46:

  return v33;
}

+ (void)_dockToolPickerForWindowScene:(uint64_t)a3 toAutoHideCornerAnimated:
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  self;
  uint64_t v5 = +[PKPaletteViewInteraction existingPaletteViewInteractionForWindowScene:v4];
  uint64_t v6 = os_log_create("com.apple.pencilkit", "ToolPicker");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138478083;
    id v9 = v4;
    __int16 v10 = 2113;
    uint64_t v11 = v5;
    _os_log_impl(&dword_1C44F8000, v6, OS_LOG_TYPE_DEFAULT, "Dock toolPicker for windowScene: %{private}@, paletteViewInteraction: %{private}@", (uint8_t *)&v8, 0x16u);
  }

  uint64_t v7 = [v5 paletteHostView];
  [v7 _dockPaletteToAutoHideCornerAnimated:a3];
}

- (id)_applicationWindow
{
  id v3 = [(PKToolPicker *)self _interaction];
  if (v3 && [(PKToolPicker *)self isVisible])
  {
    id v4 = [(PKToolPicker *)self _interaction];
    uint64_t v5 = [v4 hostingWindow];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)addObserver:(id)observer
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = observer;
  uint64_t v5 = [(PKToolPicker *)self _observers];
  [v5 addObject:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v4;
    objc_msgSend(v6, "setRulerActive:", -[PKToolPicker isRulerActive](self, "isRulerActive"));
    [v6 _addObserver:self];
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = PKDebugStringRepresentation(v4);
      int v9 = 138412290;
      __int16 v10 = v8;
      _os_log_impl(&dword_1C44F8000, v7, OS_LOG_TYPE_DEFAULT, "Notify selected tool did change, addObserver: %@", (uint8_t *)&v9, 0xCu);
    }
    [v4 toolPickerSelectedToolItemDidChange:self];
  }
  if ([(PKToolPicker *)self isVisible] && (objc_opt_respondsToSelector() & 1) != 0) {
    [v4 toolPickerVisibilityDidChange:self];
  }
}

- (void)removeObserver:(id)observer
{
  id v4 = observer;
  id v5 = [(PKToolPicker *)self _observers];
  [v5 removeObject:v4];
}

- (void)_saveStateIfNecessary
{
  id v2 = [(PKToolPicker *)self _paletteView];
  [v2 saveOptionsIfNecessary];
}

+ (void)_setCanBecomeVisible:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (__canBecomeVisible != a3)
  {
    __canBecomeVisible = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v3 = (id)_allToolPickers;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          int v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v7), "toolPicker", (void)v10);
          if (v8)
          {
            int v9 = +[PKToolPicker _windowForToolPicker:v8];
            [v8 _setVisibleInWindow:v9];
          }
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }
  }
}

+ (BOOL)_canBecomeVisible
{
  return __canBecomeVisible;
}

- (void)setVisible:(BOOL)visible forFirstResponder:(UIResponder *)responder
{
  BOOL v4 = visible;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = responder;
  uint64_t v7 = [(PKToolPicker *)self _firstRespondersForVisibleUI];
  int v8 = [v7 objectForKey:v6];

  if ((v8 != 0) != v4)
  {
    int v9 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      long long v10 = -[NSObject _pkDebugStringRepresentation](v6);
      long long v11 = [(PKToolPicker *)self _currentFirstResponder];
      long long v12 = -[NSObject _pkDebugStringRepresentation](v11);
      int v15 = 134218754;
      long long v16 = self;
      __int16 v17 = 1024;
      BOOL v18 = v4;
      __int16 v19 = 2112;
      uint64_t v20 = v10;
      __int16 v21 = 2112;
      char v22 = v12;
      _os_log_impl(&dword_1C44F8000, v9, OS_LOG_TYPE_DEFAULT, "ToolPicker: %p, should setVisible %{BOOL}d for responder: %@, current: %@", (uint8_t *)&v15, 0x26u);
    }
  }
  long long v13 = [(PKToolPicker *)self _firstRespondersForVisibleUI];
  long long v14 = v13;
  if (v4) {
    [v13 setObject:&unk_1F200E238 forKey:v6];
  }
  else {
    [v13 removeObjectForKey:v6];
  }

  if ([(UIResponder *)v6 isFirstResponder]) {
    [(PKToolPicker *)self _updateToolPickerVisibility];
  }
}

- (void)setVisibility:(int64_t)a3 whenFirstResponderIsDescendantOf:(id)a4
{
  id v9 = a4;
  if (a3 == 2)
  {
    uint64_t v7 = [(PKToolPicker *)self _firstRespondersForVisibleUI];
    [v7 removeObjectForKey:v9];
  }
  else
  {
    if (a3 == 1)
    {
      uint64_t v6 = [(PKToolPicker *)self _firstRespondersForVisibleUI];
      uint64_t v7 = v6;
      int v8 = &unk_1F200E268;
    }
    else
    {
      if (a3) {
        goto LABEL_9;
      }
      uint64_t v6 = [(PKToolPicker *)self _firstRespondersForVisibleUI];
      uint64_t v7 = v6;
      int v8 = &unk_1F200E250;
    }
    [v6 setObject:v8 forKey:v9];
  }

LABEL_9:
  [(PKToolPicker *)self _updateToolPickerVisibility];
}

- (void)_handleFirstResponderDidChangeNotification:(id)a3
{
  *(void *)&v25[5] = *MEMORY[0x1E4F143B8];
  BOOL v4 = (PKToolPicker *)a3;
  uint64_t v5 = os_log_create("com.apple.pencilkit", "ToolPicker");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(PKToolPicker *)self _currentFirstResponder];
    uint64_t v7 = -[NSObject _pkDebugStringRepresentation](v6);
    int v22 = 138412546;
    uint64_t v23 = v4;
    __int16 v24 = 2112;
    *(void *)uint64_t v25 = v7;
    _os_log_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_DEFAULT, "first responder did change notification: %@, firstResponder: %@", (uint8_t *)&v22, 0x16u);
  }
  int v8 = [(PKToolPicker *)v4 userInfo];
  id v9 = [v8 objectForKey:@"_UIWindowHostDidPromoteFirstResponderUserInfoKey"];
  int v10 = [v9 BOOLValue];

  long long v11 = [(PKToolPicker *)v4 userInfo];
  long long v12 = [v11 objectForKey:@"UIWindowFirstResponderUserInfoKey"];

  if (!v10 || v12)
  {
    long long v13 = [(PKToolPicker *)self _paletteView];
    int v14 = [v13 isExtendedColorPickerVisible];

    if (PKIsPhoneDevice() && ([(PKToolPicker *)self isVisible] & v14) == 1)
    {
      int v15 = os_log_create("com.apple.pencilkit", "ToolPicker");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        BOOL v16 = [(PKToolPicker *)self isVisible];
        int v22 = 134218496;
        uint64_t v23 = self;
        __int16 v24 = 1024;
        *(_DWORD *)uint64_t v25 = v16;
        v25[2] = 1024;
        *(_DWORD *)&v25[3] = 1;
        __int16 v17 = "Skip processing FR notification, toolPicker: %p, isVisible: %{BOOL}d, isExtendedColorPickerVisible: %{BOOL}d";
LABEL_16:
        _os_log_impl(&dword_1C44F8000, v15, OS_LOG_TYPE_INFO, v17, (uint8_t *)&v22, 0x18u);
      }
    }
    else
    {
      if (!PKIsVisionDevice()) {
        goto LABEL_18;
      }
      BOOL v18 = [(PKToolPicker *)self _paletteView];
      __int16 v19 = [v18 palettePopoverPresentingController];
      uint64_t v20 = [v19 presentedViewController];

      if (!v20 || ![(PKToolPicker *)self isVisible])
      {
LABEL_18:
        int v15 = +[PKToolPicker _windowForToolPicker:self];
        [(PKToolPicker *)self _setVisibleInWindow:v15];
        goto LABEL_19;
      }
      int v15 = os_log_create("com.apple.pencilkit", "ToolPicker");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        BOOL v21 = [(PKToolPicker *)self isVisible];
        int v22 = 134218496;
        uint64_t v23 = self;
        __int16 v24 = 1024;
        *(_DWORD *)uint64_t v25 = v21;
        v25[2] = 1024;
        *(_DWORD *)&v25[3] = 1;
        __int16 v17 = "Skip processing FR notification, toolPicker: %p, isVisible: %{BOOL}d, hasPresentedViewController: %{BOOL}d";
        goto LABEL_16;
      }
    }

LABEL_19:
    goto LABEL_20;
  }
  if ((_UIApplicationIsExtension() & 1) == 0) {
    [(PKToolPicker *)self _setVisibleInWindow:0];
  }
LABEL_20:
}

- (PKDrawingPaletteView)_paletteView
{
  if (self->_toolPickerVisibility)
  {
    id v2 = [(PKToolPickerVisibility *)self->_toolPickerVisibility paletteView];
  }
  else
  {
    id v3 = [(PKToolPicker *)self _interaction];
    id v2 = [v3 paletteView];
  }

  return (PKDrawingPaletteView *)v2;
}

- (PKToolPickerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__delegate);

  return (PKToolPickerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PKTool)selectedTool
{
  return self->_selectedTool;
}

- (void)setSelectedTool:(PKTool *)selectedTool
{
}

- (void)_setSelectedTool:(id)a3 saveState:(BOOL)a4 updateUI:(BOOL)a5
{
}

- (void)_setSelectedTool:(id)a3 saveState:(BOOL)a4 updateUI:(BOOL)a5 updateLastSelectedTool:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  long long v11 = (PKTool *)a3;
  long long v12 = v11;
  if (v11)
  {
    if ([(PKTool *)v11 _isRulerTool])
    {
      long long v13 = os_log_create("com.apple.pencilkit", "ToolPicker");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C44F8000, v13, OS_LOG_TYPE_DEFAULT, "Can't select a ruler tool.", buf, 2u);
      }

      [(PKToolPicker *)self setRulerActive:[(PKToolPicker *)self isRulerActive] ^ 1];
    }
    else
    {
      unint64_t v15 = [(PKToolPicker *)self _indexOfTool:v12];
      if (v15 != 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_17;
      }
      uint64_t v16 = objc_opt_class();
      uint64_t v17 = PKDynamicCast(v16, v12);
      mutableTools = self->_mutableTools;
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __75__PKToolPicker__setSelectedTool_saveState_updateUI_updateLastSelectedTool___block_invoke;
      v28[3] = &unk_1E64C5FA8;
      __int16 v19 = v12;
      id v29 = v19;
      uint64_t v30 = v17;
      uint64_t v27 = (void *)v17;
      uint64_t v20 = [(NSMutableArray *)mutableTools indexOfObjectPassingTest:v28];
      if (v20 == 0x7FFFFFFFFFFFFFFFLL)
      {
        BOOL v21 = os_log_create("com.apple.pencilkit", "ToolPicker");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          int v22 = self->_mutableTools;
          *(_DWORD *)buf = 138412546;
          v32 = v19;
          __int16 v33 = 2112;
          char v34 = v22;
          _os_log_impl(&dword_1C44F8000, v21, OS_LOG_TYPE_DEFAULT, "Can't select tool: %@. Tool not found in tools: %@", buf, 0x16u);
        }
      }
      else
      {
        BOOL v21 = [(NSMutableArray *)self->_mutableTools objectAtIndex:v20];
        [(NSMutableArray *)self->_mutableTools replaceObjectAtIndex:v20 withObject:v19];
        -[PKToolPickerItemManager updateItemForTool:]((uint64_t)self->_toolItemManager, v19);
        uint64_t v23 = os_log_create("com.apple.pencilkit", "ToolPicker");
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          v32 = v19;
          __int16 v33 = 2112;
          char v34 = v21;
          __int16 v35 = 2048;
          uint64_t v36 = v20;
          _os_log_impl(&dword_1C44F8000, v23, OS_LOG_TYPE_DEFAULT, "An equal but not identical tool: %@, replaced tool: %@, at index: %lu", buf, 0x20u);
        }
      }
      unint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;

      if (v20 != 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_17:
        if (self->_selectedTool != v12)
        {
          [(PKToolPicker *)self _setSelectionMask:0 updateUI:0];
          if (v6) {
            objc_storeStrong((id *)&self->_lastSelectedTool, self->_selectedTool);
          }
          __int16 v24 = self->_selectedTool;
          objc_storeStrong((id *)&self->_selectedTool, a3);
          [(NSMutableArray *)self->_mutableTools replaceObjectAtIndex:v15 withObject:v12];
          -[PKToolPickerItemManager updateItemForTool:]((uint64_t)self->_toolItemManager, v12);
          uint64_t v25 = os_log_create("com.apple.pencilkit", "ToolPicker");
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            selectedTool = self->_selectedTool;
            *(_DWORD *)buf = 138478083;
            v32 = v24;
            __int16 v33 = 2113;
            char v34 = selectedTool;
            _os_log_impl(&dword_1C44F8000, v25, OS_LOG_TYPE_DEFAULT, "Did change selected tool from %{private}@ to %{private}@", buf, 0x16u);
          }

          [(PKToolPicker *)self _dismissPopovers];
          if (v7) {
            [(PKToolPicker *)self _updateUI];
          }
          if (v8) {
            [(PKToolPicker *)self _saveToolPickerState];
          }
          [(PKToolPicker *)self _notifySelectedToolDidChange];
        }
      }
    }
  }
  else
  {
    int v14 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C44F8000, v14, OS_LOG_TYPE_ERROR, "Can't select a nil tool.", buf, 2u);
    }
  }
}

uint64_t __75__PKToolPicker__setSelectedTool_saveState_updateUI_updateLastSelectedTool___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [*(id *)(a1 + 32) ink];
  int v5 = [v4 _isEraserInk];

  if (!v5)
  {
    if (!*(void *)(a1 + 40))
    {
      BOOL v6 = [*(id *)(a1 + 32) ink];
      id v11 = [v6 inkType];
      long long v13 = [v3 ink];
      uint64_t v16 = [v13 inkType];
      uint64_t v7 = [v11 isEqual:v16];

LABEL_20:
      goto LABEL_21;
    }
    uint64_t v8 = objc_opt_class();
    BOOL v6 = PKDynamicCast(v8, v3);
    if (!v6)
    {
      uint64_t v7 = 0;
      goto LABEL_21;
    }
    id v9 = [*(id *)(a1 + 40) customIdentifier];
    int v10 = [v6 customIdentifier];
    id v11 = v9;
    id v12 = v10;
    long long v13 = v12;
    if (v11 == v12)
    {
    }
    else
    {
      uint64_t v7 = 0;
      int v14 = v12;
      unint64_t v15 = (unint64_t)v11;
      if (!v11 || !v12)
      {
LABEL_19:

        goto LABEL_20;
      }
      uint64_t v7 = [v11 isEqualToString:v12];

      if (!v7) {
        goto LABEL_20;
      }
    }
    uint64_t v17 = [*(id *)(a1 + 40) _configuration];
    BOOL v18 = [v6 _configuration];
    unint64_t v15 = v17;
    unint64_t v19 = v18;
    int v14 = (void *)v19;
    if (v15 | v19)
    {
      uint64_t v7 = 0;
      if (v15 && v19) {
        uint64_t v7 = [(id)v15 isEqual:v19];
      }
    }
    else
    {
      uint64_t v7 = 1;
    }

    goto LABEL_19;
  }
  BOOL v6 = [v3 ink];
  uint64_t v7 = [v6 _isEraserInk];
LABEL_21:

  return v7;
}

- (void)_notifySelectedToolDidChange
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = [(PKToolPicker *)self _observers];
  id v3 = (void *)[v2 copy];

  id obj = v3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    uint64_t v7 = "com.apple.pencilkit";
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        int v10 = os_log_create(v7, "ToolPicker");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          PKDebugStringRepresentation(v9);
          v12 = id v11 = v7;
          *(_DWORD *)buf = 138412290;
          uint64_t v20 = v12;
          _os_log_impl(&dword_1C44F8000, v10, OS_LOG_TYPE_DEFAULT, "Notify selected tool did change, observer: %@", buf, 0xCu);

          uint64_t v7 = v11;
        }

        if (objc_opt_respondsToSelector())
        {
          [v9 toolPickerSelectedToolItemDidChange:self];
        }
        else if (objc_opt_respondsToSelector())
        {
          [v9 toolPickerSelectedToolDidChange:self];
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v5);
  }
}

- (BOOL)_wasVisibleBeforeResponderChanges
{
  return self->_wasVisibleBeforeResponderChanges;
}

- (void)calculateIsVisibleBeforeResponderChangesForCurrentRunLoopIfNecessary
{
  if (![(PKToolPicker *)self _didCalculateVisibleBeforeResponderChanges])
  {
    [(PKToolPicker *)self set_didCalculateVisibleBeforeResponderChanges:1];
    self->_wasVisibleBeforeResponderChanges = [(PKToolPicker *)self isVisible];
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __84__PKToolPicker_calculateIsVisibleBeforeResponderChangesForCurrentRunLoopIfNecessary__block_invoke;
    v5[3] = &unk_1E64C5FD0;
    objc_copyWeak(&v6, &location);
    id v3 = CFRunLoopObserverCreateWithHandler(0, 0x20uLL, 0, 0, v5);
    Main = CFRunLoopGetMain();
    CFRunLoopAddObserver(Main, v3, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
    CFRelease(v3);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __84__PKToolPicker_calculateIsVisibleBeforeResponderChangesForCurrentRunLoopIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "set_didCalculateVisibleBeforeResponderChanges:", 0);
}

- (void)setRulerActive:(BOOL)rulerActive
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (rulerActive)
  {
    if (PKIsVisionDevice())
    {
      uint64_t v4 = os_log_create("com.apple.pencilkit", "ToolPicker");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_INFO, "Can't enable the ruler on this platform.", buf, 2u);
      }
      goto LABEL_19;
    }
    p_rulerActive = &self->_rulerActive;
    if (self->_rulerActive) {
      return;
    }
    int v6 = [(PKToolPicker *)self _showsRuler];
    int v7 = 0;
  }
  else
  {
    p_rulerActive = &self->_rulerActive;
    if (!self->_rulerActive) {
      return;
    }
    int v6 = 0;
    int v7 = 1;
  }
  BOOL *p_rulerActive = v6;
  if (v7 == v6) {
    return;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = [(PKToolPicker *)self _observers];
  uint64_t v4 = [v8 copy];

  uint64_t v9 = [v4 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v4);
        }
        long long v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v13 toolPickerIsRulerActiveDidChange:self];
        }
      }
      uint64_t v10 = [v4 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v10);
  }
LABEL_19:
}

- (BOOL)_showsRuler
{
  return [(PKToolPicker *)self _hasToolPassingTest:&__block_literal_global_5];
}

uint64_t __27__PKToolPicker__showsRuler__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _isRulerTool];
}

- (void)_setShowsRuler:(BOOL)a3
{
  if (!a3)
  {
    if (![(PKToolPicker *)self _showsRuler]) {
      return;
    }
    uint64_t v5 = [(NSMutableArray *)self->_mutableTools indexesOfObjectsPassingTest:&__block_literal_global_59];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __31__PKToolPicker__setShowsRuler___block_invoke_2;
    v6[3] = &unk_1E64C6038;
    v6[4] = self;
    [(PKRulerTool *)v5 enumerateIndexesUsingBlock:v6];
LABEL_10:

    [(PKToolPicker *)self _updateUI];
    [(PKToolPicker *)self _saveToolPickerState];
    return;
  }
  if (!PKIsVisionDevice())
  {
    if ([(PKToolPicker *)self _showsRuler]) {
      return;
    }
    uint64_t v5 = objc_alloc_init(PKRulerTool);
    [(PKToolPicker *)self _insertTool:v5 atIndex:[(NSMutableArray *)self->_mutableTools count] - 4 updateUI:0];
    goto LABEL_10;
  }
  uint64_t v4 = os_log_create("com.apple.pencilkit", "ToolPicker");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_INFO, "Can't enable the ruler on this platform.", buf, 2u);
  }
}

uint64_t __31__PKToolPicker__setShowsRuler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _isRulerTool];
}

void __31__PKToolPicker__setShowsRuler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 8) objectAtIndex:a2];
  [*(id *)(a1 + 32) _removeTool:v3 updateUI:0];
}

- (int64_t)_numberOfToolsAfterRuler
{
  int64_t result = [(NSMutableArray *)self->_mutableTools indexOfObjectPassingTest:&__block_literal_global_62];
  if (result == 0x7FFFFFFFFFFFFFFFLL) {
    return 4;
  }
  return result;
}

uint64_t __40__PKToolPicker__numberOfToolsAfterRuler__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _isRulerTool];
}

- (void)_setNumberOfToolsAfterRuler:(int64_t)a3
{
  if (PKIsVisionDevice())
  {
    uint64_t v5 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_INFO, "Can't enable the ruler on this platform.", buf, 2u);
    }
  }
  else
  {
    int v6 = [(NSMutableArray *)self->_mutableTools indexesOfObjectsPassingTest:&__block_literal_global_64];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __44__PKToolPicker__setNumberOfToolsAfterRuler___block_invoke_2;
    v8[3] = &unk_1E64C6038;
    _OWORD v8[4] = self;
    [v6 enumerateIndexesUsingBlock:v8];

    int v7 = objc_alloc_init(PKRulerTool);
    [(PKToolPicker *)self _insertTool:v7 atIndex:[(NSMutableArray *)self->_mutableTools count] - a3 updateUI:0];
    [(PKToolPicker *)self _updateUI];
    [(PKToolPicker *)self _saveToolPickerState];
  }
}

uint64_t __44__PKToolPicker__setNumberOfToolsAfterRuler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _isRulerTool];
}

void __44__PKToolPicker__setNumberOfToolsAfterRuler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 8) objectAtIndex:a2];
  [*(id *)(a1 + 32) _removeTool:v3 updateUI:0];
}

- (void)_setShouldHideHoverPreviewToggle:(BOOL)a3
{
  if (self->__shouldHideHoverPreviewToggle != a3)
  {
    self->__shouldHideHoverPreviewToggle = a3;
    [(PKToolPicker *)self _updateUI];
  }
}

- (UIBarButtonItem)accessoryItem
{
  return [(PKPaletteBarButton *)self->_accessoryBarButton barButtonItem];
}

- (void)setAccessoryItem:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PKPaletteBarButton *)self->_accessoryBarButton barButtonItem];
  unint64_t v6 = (unint64_t)v4;
  if (v6 | v5)
  {
    id v11 = (id)v6;
    if (v6 && v5)
    {
      char v7 = [(id)v5 isEqual:v6];

      unint64_t v6 = (unint64_t)v11;
      if (v7) {
        goto LABEL_10;
      }
    }
    else
    {

      if (!v11)
      {
        accessoryBarButton = self->_accessoryBarButton;
        self->_accessoryBarButton = 0;

        goto LABEL_9;
      }
    }
    uint64_t v8 = [[PKPaletteBarButton alloc] initWithBarButtonItem:v11];
    uint64_t v9 = self->_accessoryBarButton;
    self->_accessoryBarButton = v8;

    [(PKPaletteBarButton *)self->_accessoryBarButton setAccessibilityIdentifier:@"Plus-Button"];
LABEL_9:
    [(PKToolPicker *)self _updateUI];
    unint64_t v6 = (unint64_t)v11;
  }
LABEL_10:
}

- (void)_setShowsPlusButton:(BOOL)a3
{
  if (self->__showsPlusButton != a3)
  {
    self->__showsPlusButton = a3;
    if (a3)
    {
      id v4 = objc_alloc(MEMORY[0x1E4FB14A8]);
      unint64_t v5 = objc_msgSend(MEMORY[0x1E4FB1818], "pk_plusButtonImage");
      id v6 = (id)[v4 initWithImage:v5 menu:self->__plusButtonMenu];
    }
    else
    {
      id v6 = 0;
    }
    [(PKToolPicker *)self setAccessoryItem:v6];
  }
}

- (void)_setPlusButtonMenu:(id)a3
{
  unint64_t v5 = (UIMenu *)a3;
  if (self->__plusButtonMenu != v5)
  {
    uint64_t v8 = v5;
    objc_storeStrong((id *)&self->__plusButtonMenu, a3);
    accessoryBarButton = self->_accessoryBarButton;
    if (accessoryBarButton)
    {
      char v7 = [(PKPaletteBarButton *)accessoryBarButton barButtonItem];
      [v7 setMenu:v8];
    }
    [(PKToolPicker *)self _updateUI];
    unint64_t v5 = v8;
  }
}

- (void)_setPlusButtonViewController:(id)a3
{
  unint64_t v5 = (UIViewController *)a3;
  if (self->__plusButtonViewController != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->__plusButtonViewController, a3);
    [(PKToolPicker *)self _updateUI];
    unint64_t v5 = v6;
  }
}

- (void)_setShowsTextButton:(BOOL)a3
{
  if (self->__showsTextButton != a3)
  {
    self->__showsTextButton = a3;
    [(PKToolPicker *)self _updateUI];
  }
}

- (void)_setTextButtonViewController:(id)a3
{
  unint64_t v5 = (UIViewController *)a3;
  if (self->__textButtonViewController != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->__textButtonViewController, a3);
    [(PKToolPicker *)self _updateUI];
    unint64_t v5 = v6;
  }
}

- (void)_setShowsShapeButton:(BOOL)a3
{
  if (self->__showsShapeButton != a3)
  {
    self->__showsShapeButton = a3;
    [(PKToolPicker *)self _updateUI];
  }
}

- (void)_setShapeButtonViewController:(id)a3
{
  unint64_t v5 = (UIViewController *)a3;
  if (self->__shapeButtonViewController != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->__shapeButtonViewController, a3);
    [(PKToolPicker *)self _updateUI];
    unint64_t v5 = v6;
  }
}

- (UIView)_contextualEditingView
{
  if ([(PKToolPicker *)self isVisible])
  {
    id v3 = [(PKToolPicker *)self _paletteView];
    id v4 = [v3 contextualEditingView];
  }
  else
  {
    id v4 = 0;
  }

  return (UIView *)v4;
}

- (unint64_t)_edgeForContextualEditingView
{
  unint64_t v3 = [(PKToolPicker *)self _palettePosition] - 1;
  int64_t v4 = [(PKToolPicker *)self _palettePosition];
  if (v3 > 3)
  {
    if ((unint64_t)(v4 - 5) > 3)
    {
      return 4;
    }
    else
    {
      id v6 = [(PKToolPicker *)self _paletteView];
      unint64_t v7 = [(PKToolPicker *)self _palettePosition] - 5;
      if (v7 > 3) {
        uint64_t v8 = -1;
      }
      else {
        uint64_t v8 = qword_1C4829000[v7];
      }
      unint64_t v9 = [v6 edgeLocationToDockFromCorner:v8];

      return v9;
    }
  }
  else if ((unint64_t)(v4 - 1) >= 4)
  {
    return 0;
  }
  else
  {
    return qword_1C4829020[v4 - 1];
  }
}

- (void)_setLassoToolEditingViewVisible:(BOOL)a3
{
  if (self->_lassoToolEditingViewVisible != a3)
  {
    self->_lassoToolEditingViewVisible = a3;
    [(PKToolPicker *)self _updateUI];
  }
}

- (UIView)_lassoToolEditingView
{
  if ([(PKToolPicker *)self isVisible])
  {
    unint64_t v3 = [(PKToolPicker *)self _paletteView];
    int64_t v4 = [v3 lassoToolEditingView];
  }
  else
  {
    int64_t v4 = 0;
  }

  return (UIView *)v4;
}

- (void)_setWantsEllipsisButtonVisibleInCompactSize:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PKToolPicker *)self _canShowEllipsisButtonInCompactSize]
    && self->__wantsEllipsisButtonVisibleInCompactSize != v3)
  {
    self->__wantsEllipsisButtonVisibleInCompactSize = v3;
    [(PKToolPicker *)self _updateUI];
  }
}

- (void)_setWantsBottomLineDividerVisibleInCompactSize:(BOOL)a3
{
  if (self->__wantsBottomLineDividerVisibleInCompactSize != a3)
  {
    self->__wantsBottomLineDividerVisibleInCompactSize = a3;
    [(PKToolPicker *)self _updateUI];
  }
}

- (void)_setIgnoresSafeAreaInsetsInCompactSize:(BOOL)a3
{
  if (self->__ignoresSafeAreaInsetsInCompactSize != a3)
  {
    self->__ignoresSafeAreaInsetsInCompactSize = a3;
    [(PKToolPicker *)self _updateUI];
  }
}

- (void)_setEdgeInsetsInCompactSize:(NSDirectionalEdgeInsets)a3
{
  if (self->__edgeInsetsInCompactSize.leading != a3.leading
    || self->__edgeInsetsInCompactSize.top != a3.top
    || self->__edgeInsetsInCompactSize.trailing != a3.trailing
    || self->__edgeInsetsInCompactSize.bottom != a3.bottom)
  {
    self->__edgeInsetsInCompactSize = a3;
    [(PKToolPicker *)self _updateUI];
  }
}

- (void)_setInterItemToolsSpacingInCompactSize:(double)a3
{
  if (vabdd_f64(self->__interItemToolsSpacingInCompactSize, a3) >= 0.00999999978)
  {
    self->__interItemToolsSpacingInCompactSize = a3;
    [(PKToolPicker *)self _updateUI];
  }
}

- (void)_setInterItemUndoRedoButtonsSpacingInCompactSize:(double)a3
{
  if (self->__interItemUndoRedoButtonsSpacingInCompactSize != a3)
  {
    self->__interItemUndoRedoButtonsSpacingInCompactSize = a3;
    [(PKToolPicker *)self _updateUI];
  }
}

- (void)_setUseEqualSpacingLayoutInCompactSize:(BOOL)a3
{
  if (self->__useEqualSpacingLayoutInCompactSize != a3)
  {
    self->__useEqualSpacingLayoutInCompactSize = a3;
    [(PKToolPicker *)self _updateUI];
  }
}

- (BOOL)_interactionIsValid
{
  id v2 = [(PKToolPicker *)self _interaction];
  BOOL v3 = v2 != 0;

  return v3;
}

- (double)_scalingFactor
{
  if (![(PKToolPicker *)self isVisible]) {
    return 1.0;
  }
  BOOL v3 = [(PKToolPicker *)self _paletteView];
  [v3 paletteScaleFactor];
  double v5 = v4;

  return v5;
}

- (void)_notifyScaleFactorDidChange
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v3 = [(PKToolPicker *)self _observers];
  double v4 = (void *)[v3 copy];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        unint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          [v9 _toolPickerDidChangeScaleFactor:self];
          uint64_t v10 = os_log_create("com.apple.pencilkit", "ToolPicker");
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            id v11 = PKDebugStringRepresentation(v9);
            *(_DWORD *)buf = 138412290;
            long long v17 = v11;
            _os_log_impl(&dword_1C44F8000, v10, OS_LOG_TYPE_DEFAULT, "Tool picker scale factor change notified to observer: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v6);
  }
}

- (BOOL)isVisible
{
  toolPickerVisibility = self->_toolPickerVisibility;
  if (toolPickerVisibility) {
    return [(PKToolPickerVisibility *)toolPickerVisibility toolPickerVisible];
  }
  else {
    return [(PKToolPicker *)self _toolPickerVisible];
  }
}

- (id)_windowScene
{
  if (self->_toolPickerVisibility)
  {
    id v2 = [(PKToolPickerVisibility *)self->_toolPickerVisibility windowScene];
  }
  else
  {
    BOOL v3 = [(PKToolPicker *)self _interaction];
    double v4 = [v3 view];
    uint64_t v5 = [v4 window];
    id v2 = [v5 windowScene];
  }

  return v2;
}

- (void)_setVisibilityUpdatesEnabled:(BOOL)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (self->__visibilityUpdatesEnabled != a3)
  {
    self->__visibilityUpdatesEnabled = a3;
    double v4 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 134218240;
      uint64_t v6 = self;
      __int16 v7 = 1024;
      BOOL v8 = [(PKToolPicker *)self _visibilityUpdatesEnabled];
      _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "ToolPicker: %p, visibility updates did change, visibilityUpdatesEnabled: %{BOOL}d", (uint8_t *)&v5, 0x12u);
    }

    [(PKToolPicker *)self _updateToolPickerVisibility];
  }
}

- (void)_performWithVisibilityUpdatesEnabled:(BOOL)a3 block:(id)a4
{
  BOOL v4 = a3;
  BOOL visibilityUpdatesEnabled = self->__visibilityUpdatesEnabled;
  __int16 v7 = (void (**)(void))a4;
  [(PKToolPicker *)self _setVisibilityUpdatesEnabled:v4];
  v7[2](v7);

  [(PKToolPicker *)self _setVisibilityUpdatesEnabled:visibilityUpdatesEnabled];
}

+ (void)_performWithVisibilityUpdatesEnabled:(BOOL)a3 window:(id)a4 block:(id)a5
{
  BOOL v6 = a3;
  id v10 = a4;
  __int16 v7 = (void (**)(void))a5;
  if (v10
    && (+[PKToolPicker activeToolPickerForWindow:v10],
        (BOOL v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v9 = v8;
    [v8 _performWithVisibilityUpdatesEnabled:v6 block:v7];
  }
  else
  {
    v7[2](v7);
  }
}

- (void)_updateToolPickerVisibility
{
}

- (void)_updateToolPickerVisibilityWithContext:(void *)a3 completion:
{
  int v5 = a2;
  id v6 = a3;
  if (a1)
  {
    __int16 v7 = [a1 _interaction];
    if ([v7 isActive])
    {
      char v8 = [a1 _isInputViewVisible];

      if ((v8 & 1) == 0)
      {
        [a1 _setVisibleInWindow:0];
        goto LABEL_27;
      }
    }
    else
    {
    }
    if ([a1 _isContextMenuPresented])
    {
      uint64_t v9 = 0;
    }
    else
    {
      uint64_t v9 = +[PKToolPicker _windowForToolPicker:a1];
    }
    if (v5)
    {
      if (v5[8]) {
        BOOL v10 = v5[10] != 0;
      }
      else {
        BOOL v10 = 1;
      }
      if (([a1 _isContextMenuPresented] & 1) == 0 && v5[9])
      {
        id v11 = [a1 _windowScene];
        long long v12 = v11;
        if (v11)
        {
          id v13 = v11;
        }
        else
        {
          id v13 = +[PKToolPicker _windowSceneForToolPicker:a1];
        }
        long long v14 = v13;

        if (([a1 isVisible] & 1) == 0 && !v14)
        {
          long long v15 = os_log_create("com.apple.pencilkit", "ToolPicker");
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)long long v16 = 0;
          }
        }
        if ([a1 _squeezePaletteVisible])
        {

          uint64_t v9 = 0;
        }

        BOOL v10 = 0;
      }
    }
    else
    {
      [a1 _isContextMenuPresented];
      BOOL v10 = 1;
    }
    -[PKToolPicker _setVisibleInWindow:animated:notify:completion:]((uint64_t)a1, v9, 1, v10, v6);
  }
LABEL_27:
}

- (void)_updateToolPickerVisibilityContextMenuPresentedDidChange:(BOOL)a3
{
  int v5 = objc_alloc_init(PKToolPickerVisibilityContext);
  if (v5) {
    v5->_contextMenuPresentedDidChange = a3;
  }
  id v6 = v5;
  -[PKToolPicker _updateToolPickerVisibilityWithContext:completion:](self, v5, 0);
}

- (BOOL)_squeezePaletteVisible
{
  BOOL v3 = [(PKToolPicker *)self _windowScene];
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = +[PKToolPicker _windowSceneForToolPicker:self];
  }
  id v6 = v5;

  __int16 v7 = +[PKPencilSqueezeInteraction _existingInteractionForWindowScene:v6];
  char v8 = [v7 _paletteViewVisible];

  return v8;
}

- (void)_setVisibleInWindow:(id)a3
{
}

uint64_t __63__PKToolPicker__setVisibleInWindow_animated_notify_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __63__PKToolPicker__setVisibleInWindow_animated_notify_completion___block_invoke_78(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 100) = 0;
  if (*(unsigned char *)(a1 + 56))
  {
    [*(id *)(a1 + 32) _notifyVisibilityDidChangeIsAnimationFinished:1];
    id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v2 postNotificationName:@"PKToolPickerDidShowNotification" object:*(void *)(a1 + 32) userInfo:*(void *)(a1 + 40)];
  }
  BOOL v3 = os_log_create("com.apple.pencilkit", "ToolPicker");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = *(unsigned __int8 *)(a1 + 57);
    int v7 = 134218240;
    uint64_t v8 = v4;
    __int16 v9 = 1024;
    int v10 = v5;
    _os_log_impl(&dword_1C44F8000, v3, OS_LOG_TYPE_DEFAULT, "ToolPicker: %p, interaction did show palette, notify: %{BOOL}d", (uint8_t *)&v7, 0x12u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __63__PKToolPicker__setVisibleInWindow_animated_notify_completion___block_invoke_79(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) _selectionContext];
  [v2 setSelectionMask:0];

  if (*(unsigned char *)(a1 + 56))
  {
    [*(id *)(a1 + 32) _notifyVisibilityDidChangeIsAnimationFinished:1];
    BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 postNotificationName:@"PKToolPickerDidHideNotification" object:*(void *)(a1 + 32) userInfo:*(void *)(a1 + 40)];
  }
  uint64_t v4 = os_log_create("com.apple.pencilkit", "ToolPicker");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = *(unsigned __int8 *)(a1 + 57);
    int v8 = 134218240;
    uint64_t v9 = v5;
    __int16 v10 = 1024;
    int v11 = v6;
    _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "ToolPicker: %p, interaction did hide palette, notify: %{BOOL}d", (uint8_t *)&v8, 0x12u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_notifyVisibilityDidChangeIsAnimationFinished:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [(PKToolPicker *)self _observers];
  int v6 = (void *)[v5 copy];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector())
        {
          [v11 _toolPickerVisibilityDidChange:self isAnimationFinished:v3];
        }
        else if (!v3 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          [v11 toolPickerVisibilityDidChange:self];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)_setInteraction:(id)a3
{
  uint64_t v5 = (PKPaletteViewInteraction *)a3;
  if (self->__interaction != v5)
  {
    uint64_t v9 = v5;
    objc_storeStrong((id *)&self->__interaction, a3);
    if (self->__interaction)
    {
      [(PKToolPicker *)self _restoreToolPickerStateNotify:1];
      interaction = self->__interaction;
    }
    else
    {
      interaction = 0;
    }
    uint64_t v7 = [(PKPaletteViewInteraction *)interaction hostingWindow];
    uint64_t v8 = [v7 rootViewController];
    [(PKToolPicker *)self _setPresentationController:v8];

    uint64_t v5 = v9;
  }
}

- (void)_updateUI
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    BOOL v3 = os_log_create("com.apple.pencilkit", "");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_fault_impl(&dword_1C44F8000, v3, OS_LOG_TYPE_FAULT, "This should only be called from the main thread!", v7, 2u);
    }
  }
  [(PKToolPicker *)self _updateHandwritingToolInstallation];
  [(PKToolPicker *)self _updateGenerationToolInstallation];
  uint64_t v4 = [(PKTool *)self->_selectedTool ink];
  if ([v4 _isHandwritingInk])
  {
    BOOL rulerActive = self->_rulerActive;

    if (rulerActive) {
      [(PKToolPicker *)self setRulerActive:0];
    }
  }
  else
  {
  }
  if (self->_rulerActive && ![(PKToolPicker *)self _showsRuler]) {
    [(PKToolPicker *)self setRulerActive:0];
  }
  int v6 = [(PKToolPicker *)self _paletteView];
  [(PKToolPicker *)self _updatePaletteView:v6];
}

- (void)_updateGenerationToolInstallation
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PKImageGenerationController *)self->_imageGenerationController shouldAddMagicWand];
  BOOL v4 = [(PKToolPicker *)self _hasGenerationTool];
  if (v3 && !v4)
  {
    uint64_t v5 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13[0]) = 0;
      _os_log_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_DEFAULT, "Install generation tool", (uint8_t *)v13, 2u);
    }

    int v6 = objc_alloc_init(PKGenerationTool);
    [(PKToolPicker *)self _insertTool:v6 atIndex:[(PKToolPicker *)self _numberOfToolsAfterRuler]];
LABEL_11:

    return;
  }
  if (!v3 && v4)
  {
    unint64_t v7 = [(PKToolPicker *)self _indexOfGenerationTool];
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v8 = v7;
      uint64_t v9 = os_log_create("com.apple.pencilkit", "ToolPicker");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v10 = [(PKImageGenerationController *)self->_imageGenerationController isGenerationToolEnabled];
        BOOL v11 = [(PKImageGenerationController *)self->_imageGenerationController isImageGenerationAllowed];
        BOOL v12 = [(PKImageGenerationController *)self->_imageGenerationController isGenerationModelAvailable];
        v13[0] = 67109632;
        v13[1] = v10;
        __int16 v14 = 1024;
        BOOL v15 = v11;
        __int16 v16 = 1024;
        BOOL v17 = v12;
        _os_log_impl(&dword_1C44F8000, v9, OS_LOG_TYPE_DEFAULT, "Remove generation tool, isGenerationToolEnabled: %{BOOL}d, isImageGenerationAllowed: %{BOOL}d, isGenerationModelAvailable: %{BOOL}d", (uint8_t *)v13, 0x14u);
      }

      int v6 = [(NSMutableArray *)self->_mutableTools objectAtIndex:v8];
      [(PKToolPicker *)self _removeTool:v6 updateUI:0];
      goto LABEL_11;
    }
  }
}

- (void)_updateHandwritingToolInstallation
{
  if (self->__showsHandwritingTool) {
    int v3 = [(id)objc_opt_class() _canShowHandwritingTool];
  }
  else {
    int v3 = 0;
  }
  BOOL v4 = [(PKToolPicker *)self _hasHandwritingTool];
  int v5 = !v4;
  if (v3 & 1) != 0 || (v5)
  {
    if ((v3 ^ 1 | v4))
    {
      if (((v3 ^ 1 | v5) & 1) == 0)
      {
        int v6 = +[PKTextInputSettings sharedSettings];
        id v10 = [v6 recognitionLocaleIdentifier];

        unint64_t v7 = [(PKToolPicker *)self _handwritingTool];
        unint64_t v8 = [v7 localeIdentifier];
        char v9 = [v8 isEqualToString:v10];

        if ((v9 & 1) == 0)
        {
          [(PKToolPicker *)self _removeHandwritingTool];
          [(PKToolPicker *)self _insertHandwritingTool];
        }
      }
    }
    else
    {
      [(PKToolPicker *)self _insertHandwritingTool];
    }
  }
  else
  {
    [(PKToolPicker *)self _removeHandwritingTool];
  }
}

- (void)_insertHandwritingTool
{
  int v3 = +[PKTextInputSettings sharedSettings];
  id v5 = [v3 recognitionLocaleIdentifier];

  BOOL v4 = [[PKHandwritingTool alloc] initWithLocaleIdentifier:v5];
  [(PKToolPicker *)self _insertTool:v4 atIndex:self->_indexForHandwritingTool updateUI:0];
}

- (void)_removeHandwritingTool
{
  int v3 = [(NSMutableArray *)self->_mutableTools indexesOfObjectsPassingTest:&__block_literal_global_88];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__PKToolPicker__removeHandwritingTool__block_invoke_2;
  v4[3] = &unk_1E64C6038;
  v4[4] = self;
  [v3 enumerateIndexesUsingBlock:v4];
}

uint64_t __38__PKToolPicker__removeHandwritingTool__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 ink];
  uint64_t v3 = [v2 _isHandwritingInk];

  return v3;
}

void __38__PKToolPicker__removeHandwritingTool__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 8) objectAtIndex:a2];
  [*(id *)(a1 + 32) _removeTool:v3 updateUI:0];
}

- (void)_updatePaletteView:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    [v4 updateUndoRedo];
    objc_msgSend(v5, "_setShouldTrackHoverLocationForPencilTapActions:", -[PKToolPicker _shouldTrackHoverLocationForPencilTapActions](self, "_shouldTrackHoverLocationForPencilTapActions"));
    int v6 = [(PKToolPicker *)self _paletteAccessibilityIdentifier];
    [v5 setAccessibilityIdentifier:v6];

    objc_msgSend(v5, "setPencilInteractionEnabledWhenNotVisible:", -[PKToolPicker _isPencilInteractionEnabledWhenNotVisible](self, "_isPencilInteractionEnabledWhenNotVisible"));
    objc_msgSend(v5, "setColorUserInterfaceStyle:", -[PKToolPicker colorUserInterfaceStyle](self, "colorUserInterfaceStyle"));
    objc_msgSend(v5, "setOverrideUserInterfaceStyle:", -[PKToolPicker overrideUserInterfaceStyle](self, "overrideUserInterfaceStyle"));
    objc_msgSend(v5, "setShouldHideHoverPreviewToggle:", -[PKToolPicker _shouldHideHoverPreviewToggle](self, "_shouldHideHoverPreviewToggle"));
    objc_msgSend(v5, "setFingerDrawsOptionEnabled:", -[PKToolPicker showsDrawingPolicyControls](self, "showsDrawingPolicyControls"));
    objc_msgSend(v5, "setWantsClearBackgroundColorInCompactSize:", -[PKToolPicker _wantsClearBackgroundColorInCompactSize](self, "_wantsClearBackgroundColorInCompactSize"));
    objc_msgSend(v5, "setWantsUndoRedoButtonsVisibleInCompactSize:", -[PKToolPicker _wantsUndoRedoButtonsVisibleInCompactSize](self, "_wantsUndoRedoButtonsVisibleInCompactSize"));
    objc_msgSend(v5, "setWantsEllipsisButtonVisibleInCompactSize:", -[PKToolPicker _wantsEllipsisButtonVisibleInCompactSize](self, "_wantsEllipsisButtonVisibleInCompactSize"));
    objc_msgSend(v5, "setWantsBottomLineDividerVisibleInCompactSize:", -[PKToolPicker _wantsBottomLineDividerVisibleInCompactSize](self, "_wantsBottomLineDividerVisibleInCompactSize"));
    objc_msgSend(v5, "setIgnoresSafeAreaInsetsInCompactSize:", -[PKToolPicker _ignoresSafeAreaInsetsInCompactSize](self, "_ignoresSafeAreaInsetsInCompactSize"));
    [(PKToolPicker *)self _edgeInsetsInCompactSize];
    objc_msgSend(v5, "setEdgeInsetsInCompactSize:");
    objc_msgSend(v5, "setUseEqualSpacingLayoutInCompactSize:", -[PKToolPicker _useEqualSpacingLayoutInCompactSize](self, "_useEqualSpacingLayoutInCompactSize"));
    unint64_t v7 = [(PKToolPicker *)self _tools];
    [v5 setTools:v7];

    [(PKToolPicker *)self _interItemToolsSpacingInCompactSize];
    objc_msgSend(v5, "setInterItemToolsSpacingInCompactSize:");
    [(PKToolPicker *)self _interItemUndoRedoButtonsSpacingInCompactSize];
    objc_msgSend(v5, "setInterItemUndoRedoButtonsSpacingInCompactSize:");
    objc_msgSend(v5, "setWantsUndoRedoButtonsShadowInCompactSize:", -[PKToolPicker _wantsUndoRedoButtonsVisibleInCompactSize](self, "_wantsUndoRedoButtonsVisibleInCompactSize"));
    objc_msgSend(v5, "setWantsMulticolorSwatchShadowInCompactSize:", -[PKToolPicker _wantsUndoRedoButtonsVisibleInCompactSize](self, "_wantsUndoRedoButtonsVisibleInCompactSize"));
    if (self)
    {
      unint64_t v8 = [(PKToolPicker *)self _indexOfTool:self->_selectedTool];
      if (v8 == 0x7FFFFFFFFFFFFFFFLL)
      {
        char v9 = os_log_create("com.apple.pencilkit", "ToolPicker");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)BOOL v21 = 0;
          _os_log_fault_impl(&dword_1C44F8000, v9, OS_LOG_TYPE_FAULT, "_selectedTool must be in the tool picker's array of tools.", v21, 2u);
        }

        unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
    else
    {
      unint64_t v8 = 0;
    }
    [v5 selectToolAtIndex:v8];
    id v10 = [(PKToolPicker *)self _selectionContext];
    objc_msgSend(v5, "setEditingStrokeSelection:", objc_msgSend(v10, "selectionMask") & 1);

    BOOL v11 = [(PKToolPicker *)self _selectionContext];
    objc_msgSend(v5, "setEditingTextSelection:", ((unint64_t)objc_msgSend(v11, "selectionMask") >> 1) & 1);

    BOOL v12 = [(PKToolPicker *)self _selectionContext];
    objc_msgSend(v5, "setEditingExternalElementsSelection:", ((unint64_t)objc_msgSend(v12, "selectionMask") >> 2) & 1);

    if ([(PKToolPicker *)self _isLassoToolEditingViewVisible]) {
      BOOL v13 = [(PKTool *)self->_selectedTool _isLassoTool];
    }
    else {
      BOOL v13 = 0;
    }
    [v5 setShowsLassoToolEditingView:v13];
    [v5 setLassoToolEditingViewIdentifier:self->_lassoToolEditingViewIdentifier];
    __int16 v14 = [(PKToolPicker *)self _selectionContext];
    objc_msgSend(v5, "setColorSwatchesVisible:", objc_msgSend(v14, "colorSwatchesVisible"));

    BOOL v15 = [(PKToolPicker *)self _selectionContext];
    objc_msgSend(v5, "setPrefersLargeContextualEditingUI:", objc_msgSend(v15, "prefersLargeContextualEditingUI"));

    [v5 setShowsPlusButton:self->_accessoryBarButton != 0];
    if (self->_accessoryBarButton) {
      objc_msgSend(v5, "_setPlusButton:");
    }
    __int16 v16 = [(PKToolPicker *)self _plusButtonViewController];
    [v5 setPlusButtonViewController:v16];

    objc_msgSend(v5, "setShowsTextButton:", -[PKToolPicker _showsTextButton](self, "_showsTextButton"));
    BOOL v17 = [(PKToolPicker *)self _textButtonViewController];
    [v5 setTextButtonViewController:v17];

    objc_msgSend(v5, "setShowsShapeButton:", -[PKToolPicker _showsShapeButton](self, "_showsShapeButton"));
    uint64_t v18 = [(PKToolPicker *)self _shapeButtonViewController];
    [v5 setShapeButtonViewController:v18];

    uint64_t v19 = [(PKToolPicker *)self _presentationController];
    [v5 setPresentationController:v19];

    uint64_t v20 = [(PKToolPicker *)self _annotationDelegate];
    [v5 setAnnotationDelegate:v20];

    objc_msgSend(v5, "setShadowVisible:", -[PKToolPicker _shadowVisible](self, "_shadowVisible"));
  }
}

- (id)_paletteAccessibilityIdentifier
{
  id v3 = @"Drawing-Palette";
  if ([(PKToolPicker *)self _wantsUndoRedoButtonsVisibleInCompactSize]
    && ![(PKToolPicker *)self _showsRuler])
  {
    id v3 = @"ScrapPaper-Drawing-Palette";
  }

  return v3;
}

- (BOOL)_hasHandwritingTool
{
  return [(PKToolPicker *)self _hasToolPassingTest:&__block_literal_global_90];
}

uint64_t __35__PKToolPicker__hasHandwritingTool__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 ink];
  uint64_t v3 = [v2 _isHandwritingInk];

  return v3;
}

- (BOOL)_hasEraserTool
{
  return [(PKToolPicker *)self _hasToolPassingTest:&__block_literal_global_92];
}

uint64_t __30__PKToolPicker__hasEraserTool__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 ink];
  uint64_t v3 = [v2 _isEraserInk];

  return v3;
}

- (BOOL)_hasLassoTool
{
  return [(PKToolPicker *)self _hasToolPassingTest:&__block_literal_global_94];
}

uint64_t __29__PKToolPicker__hasLassoTool__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _isLassoTool];
}

- (BOOL)_hasGenerationTool
{
  return [(PKToolPicker *)self _hasToolPassingTest:&__block_literal_global_96];
}

uint64_t __34__PKToolPicker__hasGenerationTool__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 ink];
  uint64_t v3 = [v2 _isGenerationTool];

  return v3;
}

- (BOOL)_hasToolPassingTest:(id)a3
{
  id v4 = a3;
  mutableTools = self->_mutableTools;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __36__PKToolPicker__hasToolPassingTest___block_invoke;
  v8[3] = &unk_1E64C60B0;
  id v9 = v4;
  id v6 = v4;
  LOBYTE(mutableTools) = [(NSMutableArray *)mutableTools indexOfObjectPassingTest:v8] != 0x7FFFFFFFFFFFFFFFLL;

  return (char)mutableTools;
}

uint64_t __36__PKToolPicker__hasToolPassingTest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (unint64_t)_indexOfGenerationTool
{
  return [(PKToolPicker *)self _indexOfToolPassingTest:&__block_literal_global_98];
}

uint64_t __38__PKToolPicker__indexOfGenerationTool__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 ink];
  uint64_t v3 = [v2 _isGenerationTool];

  return v3;
}

- (unint64_t)_indexOfToolPassingTest:(id)a3
{
  id v4 = a3;
  mutableTools = self->_mutableTools;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__PKToolPicker__indexOfToolPassingTest___block_invoke;
  v9[3] = &unk_1E64C60B0;
  id v10 = v4;
  id v6 = v4;
  unint64_t v7 = [(NSMutableArray *)mutableTools indexOfObjectPassingTest:v9];

  return v7;
}

uint64_t __40__PKToolPicker__indexOfToolPassingTest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int64_t)_palettePosition
{
  uint64_t v3 = [(PKToolPicker *)self _paletteView];
  if (v3)
  {
    id v4 = [(PKToolPicker *)self _paletteView];
    int64_t v5 = [v4 palettePosition];
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (void)_setPresentationController:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->__presentationController);

  int64_t v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->__presentationController, obj);
    [(PKToolPicker *)self _updateUI];
    int64_t v5 = obj;
  }
}

- (void)_setAnnotationDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->__annotationDelegate);

  int64_t v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->__annotationDelegate, obj);
    [(PKToolPicker *)self _updateUI];
    int64_t v5 = obj;
  }
}

- (void)_setShadowVisible:(BOOL)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->__shadowVisible != a3)
  {
    self->__BOOL shadowVisible = a3;
    id v4 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      BOOL shadowVisible = self->__shadowVisible;
      v6[0] = 67109120;
      v6[1] = shadowVisible;
      _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "shadow visibility state did change: %{BOOL}d", (uint8_t *)v6, 8u);
    }

    [(PKToolPicker *)self _updateUI];
  }
}

- (void)_setBackgroundVisible:(BOOL)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->__backgroundVisible != a3)
  {
    self->__BOOL backgroundVisible = a3;
    id v4 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      BOOL backgroundVisible = self->__backgroundVisible;
      v6[0] = 67109120;
      v6[1] = backgroundVisible;
      _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "background visibility state did change: %{BOOL}d", (uint8_t *)v6, 8u);
    }

    [(PKToolPicker *)self _updateUI];
  }
}

- (BOOL)_isToolStatePersistenceEnabled
{
  int v3 = [(id)objc_opt_class() _defaultValueForToolStatePersistenceEnabled];
  char v4 = ![(PKToolPicker *)self _useNewAutosaveNameBehavior];
  BOOL result = v4 & v3;
  if ((v4 & 1) == 0)
  {
    if (v3) {
      return self->_stateAutosaveName != 0;
    }
  }
  return result;
}

- (void)_setWantsClearBackgroundColorInCompactSize:(BOOL)a3
{
  if (self->__wantsClearBackgroundColorInCompactSize != a3)
  {
    self->__wantsClearBackgroundColorInCompactSize = a3;
    [(PKToolPicker *)self _updateUI];
  }
}

- (void)_setWantsUndoRedoButtonsVisibleInCompactSize:(BOOL)a3
{
  if (self->__wantsUndoRedoButtonsVisibleInCompactSize != a3)
  {
    self->__wantsUndoRedoButtonsVisibleInCompactSize = a3;
    [(PKToolPicker *)self _updateUI];
  }
}

- (void)setStateAutosaveName:(NSString *)stateAutosaveName
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  char v4 = stateAutosaveName;
  int64_t v5 = self->_stateAutosaveName;
  id v6 = v4;
  uint64_t v7 = v6;
  if (v5 == v6)
  {
  }
  else
  {
    if (v6 && v5)
    {
      BOOL v8 = [(NSString *)v5 isEqualToString:v6];

      if (v8) {
        goto LABEL_13;
      }
    }
    else
    {
    }
    id v9 = (NSString *)[(NSString *)v7 copy];
    id v10 = self->_stateAutosaveName;
    self->_stateAutosaveName = v9;

    BOOL v11 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v12 = self->_stateAutosaveName;
      int v13 = 138477827;
      __int16 v14 = v12;
      _os_log_impl(&dword_1C44F8000, v11, OS_LOG_TYPE_DEFAULT, "Did change state autosave name to: %{private}@", (uint8_t *)&v13, 0xCu);
    }

    if ([(PKToolPicker *)self _useNewAutosaveNameBehavior] && !self->_stateAutosaveName) {
      [(PKToolPicker *)self _restoreToolPickerStateFromRepresentation:self->_originalToolPickerStateRepresentation notify:1];
    }
    else {
      [(PKToolPicker *)self _restoreToolPickerStateNotify:1];
    }
  }
LABEL_13:
}

- (void)setOverrideUserInterfaceStyle:(UIUserInterfaceStyle)overrideUserInterfaceStyle
{
  if (self->_overrideUserInterfaceStyle != overrideUserInterfaceStyle)
  {
    self->_overrideUserInterfaceStyle = overrideUserInterfaceStyle;
    [(PKToolPicker *)self _updateUI];
    [(PKToolPicker *)self _updateUserInterfaceStyle];
  }
}

- (void)setColorUserInterfaceStyle:(UIUserInterfaceStyle)colorUserInterfaceStyle
{
  if (self->_colorUserInterfaceStyle != colorUserInterfaceStyle)
  {
    self->_colorUserInterfaceStyle = colorUserInterfaceStyle;
    [(PKToolPicker *)self _updateUI];
    [(PKToolPicker *)self _updateUserInterfaceStyle];
  }
}

- (void)setShowsDrawingPolicyControls:(BOOL)showsDrawingPolicyControls
{
  if (self->_showsDrawingPolicyControls != showsDrawingPolicyControls)
  {
    self->_showsDrawingPolicyControls = showsDrawingPolicyControls;
    [(PKToolPicker *)self _updateUI];
  }
}

- (CGRect)frameObscuredInView:(UIView *)view
{
  char v4 = view;
  if (!v4) {
    goto LABEL_5;
  }
  uint64_t v5 = [(PKToolPicker *)self _paletteView];
  if (!v5) {
    goto LABEL_5;
  }
  id v6 = (void *)v5;
  uint64_t v7 = [(PKToolPicker *)self _paletteView];
  char v8 = [v7 useCompactSize];

  if (v8)
  {
    id v9 = [(PKToolPicker *)self _paletteView];
    id v10 = [(PKToolPicker *)self _paletteView];
    [v10 bounds];
    objc_msgSend(v9, "convertRect:toView:", v4);
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;

    [(UIView *)v4 bounds];
    v34.origin.CGFloat x = v19;
    v34.origin.CGFloat y = v20;
    v34.size.CGFloat width = v21;
    v34.size.CGFloat height = v22;
    v31.origin.CGFloat x = v12;
    v31.origin.CGFloat y = v14;
    v31.size.CGFloat width = v16;
    v31.size.CGFloat height = v18;
    CGRect v32 = CGRectIntersection(v31, v34);
    CGFloat x = v32.origin.x;
    CGFloat y = v32.origin.y;
    CGFloat width = v32.size.width;
    CGFloat height = v32.size.height;
  }
  else
  {
LABEL_5:
    CGFloat x = *MEMORY[0x1E4F1DB20];
    CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  double v27 = x;
  double v28 = y;
  double v29 = width;
  double v30 = height;
  result.size.CGFloat height = v30;
  result.size.CGFloat width = v29;
  result.origin.CGFloat y = v28;
  result.origin.CGFloat x = v27;
  return result;
}

- (CGSize)_contentSize
{
  if ([(PKToolPicker *)self isVisible]
    && ([(PKToolPicker *)self _paletteView],
        int v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 useCompactSize],
        v3,
        !v4))
  {
    uint64_t v7 = [(PKToolPicker *)self _paletteView];
    uint64_t v8 = [v7 palettePosition];
    if ((unint64_t)(v8 - 1) > 3) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = qword_1C4829020[v8 - 1];
    }

    id v10 = [(PKToolPicker *)self _paletteView];
    [v10 paletteSizeForEdge:v9];
    double v5 = v11;
    double v6 = v12;
  }
  else
  {
    double v5 = *MEMORY[0x1E4F1DB30];
    double v6 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  double v13 = v5;
  double v14 = v6;
  result.CGFloat height = v14;
  result.CGFloat width = v13;
  return result;
}

- (void)_enableTapInteractionForWindow:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (!PKIsVisionDevice())
    {
      [(PKToolPicker *)self set_pencilInteractionEnabledWhenNotVisible:1];
      -[PKToolPicker _setVisibleInWindow:animated:notify:completion:]((uint64_t)self, v4, 0, 0, 0);
      -[PKToolPicker _setVisibleInWindow:animated:notify:completion:]((uint64_t)self, 0, 0, 0, 0);
    }
  }
  else
  {
    double v5 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v6 = 0;
      _os_log_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_INFO, "Unable to enable tap interaction for nil window", v6, 2u);
    }
  }
}

- (void)_disableTapInteractionWhenNotVisible
{
}

+ (id)_existingToolPickerForWindow:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v5 = objc_msgSend((id)_allToolPickers, "copy", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v15 + 1) + 8 * i) toolPicker];
        if ([v10 _isActiveToolPickerForWindow:v4])
        {
          id v12 = v10;
LABEL_16:

          goto LABEL_17;
        }
        if (v4)
        {
          double v11 = [a1 existingPaletteViewForWindow:v4];
          if (v11 && ([v10 _hasResponderRegisteredForWindow:v4] & 1) != 0)
          {
            id v13 = v10;

            goto LABEL_16;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_17:

  return v10;
}

- (BOOL)_isActiveToolPickerForWindow:(id)a3
{
  id v4 = a3;
  double v5 = [v4 windowScene];
  if (v5)
  {
    toolPickerVisibilitCGFloat y = self->_toolPickerVisibility;
    if (toolPickerVisibility)
    {
      char v7 = [(PKToolPickerVisibility *)toolPickerVisibility isActiveToolPickerForWindow:v4];
    }
    else
    {
      uint64_t v8 = +[PKPaletteViewInteraction existingPaletteViewInteractionForWindowScene:v5];
      if (v8)
      {
        uint64_t v9 = [(PKToolPicker *)self _interaction];
        char v7 = v9 == v8;
      }
      else
      {
        char v7 = 0;
      }
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

+ (id)existingPaletteViewForWindow:(id)a3
{
  int v3 = [a3 windowScene];
  if (v3)
  {
    id v4 = +[PKPaletteViewInteraction existingPaletteViewInteractionForWindowScene:v3];
    double v5 = [v4 paletteView];
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

+ (PKToolPicker)sharedToolPickerForWindow:(UIWindow *)window
{
  int v3 = window;
  id v4 = [(UIWindow *)v3 windowScene];
  if (v4)
  {
    double v5 = (void *)_perCanvasToolPickers;
    if (!_perCanvasToolPickers)
    {
      uint64_t v6 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
      char v7 = (void *)_perCanvasToolPickers;
      _perCanvasToolPickers = v6;

      double v5 = (void *)_perCanvasToolPickers;
    }
    uint64_t v8 = [v5 objectForKey:v4];
    if (!v8)
    {
      uint64_t v9 = +[PKPaletteViewInteraction paletteViewInteractionForWindow:v3 windowScene:v4];
      if (v9)
      {
        uint64_t v8 = objc_alloc_init(PKToolPicker);
        [(PKToolPicker *)v8 setStateAutosaveName:@"com.apple.PencilKit.shared"];
        [(PKToolPicker *)v8 _setInteraction:v9];
        [(PKToolPicker *)v8 _updateUI];
        [(id)_perCanvasToolPickers setObject:v8 forKey:v4];
        [v9 setDelegate:v8];
      }
      else
      {
        uint64_t v8 = 0;
      }
    }
    id v10 = [(PKToolPicker *)v8 _interaction];
    double v11 = [v10 paletteView];
    id v12 = [v11 delegate];

    if (!v12)
    {
      id v13 = [(PKToolPicker *)v8 _paletteViewDelegateProxy];
      uint64_t v14 = [(PKToolPicker *)v8 _interaction];
      long long v15 = [(id)v14 paletteView];
      [v15 setDelegate:v13];

      long long v16 = [(PKToolPicker *)v8 _paletteView];
      LOBYTE(v14) = [v16 isAnnotationSupportEnabled];

      if ((v14 & 1) == 0) {
        [(PKToolPicker *)v8 setColorUserInterfaceStyle:0];
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (PKToolPicker)init
{
  v19[9] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F1CA48];
  long long v17 = +[PKToolPickerInkingItem _defaultInkingItemForType:]((uint64_t)PKToolPickerInkingItem, @"com.apple.ink.pen");
  v19[0] = v17;
  int v3 = +[PKToolPickerInkingItem _defaultInkingItemForType:]((uint64_t)PKToolPickerInkingItem, @"com.apple.ink.monoline");
  v19[1] = v3;
  id v4 = +[PKToolPickerInkingItem _defaultInkingItemForType:]((uint64_t)PKToolPickerInkingItem, @"com.apple.ink.marker");
  v19[2] = v4;
  double v5 = [PKToolPickerEraserItem alloc];
  +[PKInkingTool defaultWidthForInkType:@"com.apple.ink.eraser"];
  uint64_t v6 = -[PKToolPickerEraserItem initWithEraserType:width:](v5, "initWithEraserType:width:", 1);
  v19[3] = v6;
  char v7 = objc_alloc_init(PKToolPickerLassoItem);
  v19[4] = v7;
  uint64_t v8 = +[PKToolPickerInkingItem _defaultInkingItemForType:]((uint64_t)PKToolPickerInkingItem, @"com.apple.ink.pencil");
  v19[5] = v8;
  uint64_t v9 = +[PKToolPickerInkingItem _defaultInkingItemForType:]((uint64_t)PKToolPickerInkingItem, @"com.apple.ink.crayon");
  v19[6] = v9;
  id v10 = +[PKToolPickerInkingItem _defaultInkingItemForType:]((uint64_t)PKToolPickerInkingItem, @"com.apple.ink.fountainpen");
  v19[7] = v10;
  double v11 = +[PKToolPickerInkingItem _defaultInkingItemForType:]((uint64_t)PKToolPickerInkingItem, @"com.apple.ink.watercolor");
  v19[8] = v11;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:9];
  id v13 = [v2 arrayWithArray:v12];

  if (!PKIsVisionDevice())
  {
    uint64_t v14 = objc_alloc_init(PKToolPickerRulerItem);
    [v13 insertObject:v14 atIndex:5];
  }
  long long v15 = -[PKToolPicker initWithToolItems:](self, "initWithToolItems:", v13, v17);

  return v15;
}

- (PKToolPicker)initWithToolItems:(id)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v64.receiver = self;
  v64.super_class = (Class)PKToolPicker;
  double v5 = [(PKToolPicker *)&v64 init];
  if (v5)
  {
    uint64_t v6 = -[PKToolPickerItemManager initWithToolItems:]((id *)[PKToolPickerItemManager alloc], v4);
    char v7 = (void *)*((void *)v5 + 7);
    *((void *)v5 + 7) = v6;

    v5[99] = 1;
    v5[120] = 1;
    v5[114] = 1;
    uint64_t v8 = +[PKContentVersionUtility sharedUtility]();
    *((void *)v5 + 19) = -[PKContentVersionUtility contentVersionForCurrentSDK]((uint64_t)v8);

    uint64_t v9 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v10 = [v9 UUIDString];
    double v11 = (void *)*((void *)v5 + 3);
    *((void *)v5 + 3) = v10;

    v5[98] = 1;
    v5[95] = 1;
    uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
    id v13 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v12;

    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    uint64_t v14 = *((void *)v5 + 7);
    if (v14) {
      long long v15 = objc_msgSend(*(id *)(v14 + 16), "copy", (void)v60);
    }
    else {
      long long v15 = 0;
    }
    uint64_t v16 = [v15 countByEnumeratingWithState:&v60 objects:v67 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v61;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v61 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(id **)(*((void *)&v60 + 1) + 8 * i);
          CGFloat v21 = (void *)*((void *)v5 + 1);
          CGFloat v22 = objc_msgSend(v20, "_tool", (void)v60);
          [v21 addObject:v22];

          if (v20) {
            [v20[1] addObject:v5];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v60 objects:v67 count:16];
      }
      while (v17);
    }

    uint64_t v23 = [*((id *)v5 + 1) indexOfObjectPassingTest:&__block_literal_global_115];
    if (v23 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v24 = 0;
    }
    else {
      uint64_t v24 = v23;
    }
    v5[88] = v23 != 0x7FFFFFFFFFFFFFFFLL;
    *((void *)v5 + 2) = v24;
    uint64_t v25 = objc_msgSend(*((id *)v5 + 1), "indexOfObjectPassingTest:", &__block_literal_global_117, (void)v60);
    uint64_t v26 = (void *)*((void *)v5 + 1);
    if (v25 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v27 = [v26 firstObject];
      double v28 = os_log_create("com.apple.pencilkit", "ToolPicker");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138477827;
        uint64_t v66 = v27;
        _os_log_error_impl(&dword_1C44F8000, v28, OS_LOG_TYPE_ERROR, "Unable to find a suitable tool to select by default, select: %{private}@", buf, 0xCu);
      }

      double v29 = (void *)*((void *)v5 + 16);
      *((void *)v5 + 16) = v27;
    }
    else
    {
      uint64_t v30 = objc_msgSend(v26, "objectAtIndex:");
      double v29 = (void *)*((void *)v5 + 16);
      *((void *)v5 + 16) = v30;
    }

    int v31 = [(id)objc_opt_class() _defaultValueForToolStatePersistenceEnabled];
    if ([v5 _useNewAutosaveNameBehavior])
    {
      if (v31) {
        CGRect v32 = @"PKPaletteNamedDefaults";
      }
      else {
        CGRect v32 = 0;
      }
      objc_storeStrong((id *)v5 + 17, v32);
    }
    *((_WORD *)v5 + 52) = 257;
    v5[118] = PKIsVisionDevice();
    v5[117] = PKIsVisionDevice();
    v5[119] = PKIsVisionDevice();
    if (PKIsVisionDevice()) {
      *((int64x2_t *)v5 + 10) = vdupq_n_s64(1uLL);
    }
    v5[116] = PKIsVisionDevice();
    v5[107] = 0;
    v5[108] = PKIsPadDevice();
    v5[109] = PKIsPadDevice();
    *((_WORD *)v5 + 55) = 1;
    long long v33 = *(_OWORD *)(MEMORY[0x1E4FB12A8] + 16);
    *((_OWORD *)v5 + 19) = *MEMORY[0x1E4FB12A8];
    *((_OWORD *)v5 + 20) = v33;
    *(_WORD *)(v5 + 91) = 1;
    *((void *)v5 + 36) = 0x4028000000000000;
    uint64_t v34 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    __int16 v35 = (void *)*((void *)v5 + 24);
    *((void *)v5 + 24) = v34;

    uint64_t v36 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    uint64_t v37 = (void *)*((void *)v5 + 22);
    *((void *)v5 + 22) = v36;

    uint64_t v38 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v38 addObserver:v5 selector:sel__handleFirstResponderDidChangeNotification_ name:*MEMORY[0x1E4FB3348] object:0];

    if (!PKIsVisionDevice())
    {
      uint64_t v39 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v39 addObserver:v5 selector:sel__handleWindowDidBecomeKeyNotification_ name:*MEMORY[0x1E4FB30E8] object:0];
    }
    v40 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v40 addObserver:v5 selector:sel__handleHandwritingEducationPaneSettingsDidChange_ name:@"PKHandwritingEducationPaneSettingsDidChangeNotification" object:0];

    long long v41 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v41 addObserver:v5 selector:sel__recognitionLocaleIdentifierDidChange_ name:@"PKTextInputSettingsRecognitionLocaleIdentifierDidChangeNotification" object:0];

    long long v42 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v42 addObserver:v5 selector:sel__hasSeenPencilPairingUIDidChange_ name:*MEMORY[0x1E4FB3290] object:0];

    long long v43 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v43 addObserver:v5 selector:sel__textInputResponderDidReloadNotification_ name:*MEMORY[0x1E4FB3058] object:0];

    long long v44 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v44 addObserver:v5 selector:sel__handleSqueezeInteractionWillShowPaletteViewNotification_ name:@"PKPencilSqueezeInteractionWillShowPaletteViewNotification" object:0];

    long long v45 = (void *)_allToolPickers;
    if (!_allToolPickers)
    {
      uint64_t v46 = [MEMORY[0x1E4F1CA48] array];
      long long v47 = (void *)_allToolPickers;
      _allToolPickers = v46;

      long long v45 = (void *)_allToolPickers;
    }
    long long v48 = [v45 indexesOfObjectsPassingTest:&__block_literal_global_136];
    [(id)_allToolPickers removeObjectsAtIndexes:v48];
    long long v49 = objc_alloc_init(PKToolPickerWeak);
    [(PKToolPickerWeak *)v49 setToolPicker:v5];
    [(id)_allToolPickers addObject:v49];
    long long v50 = [v5 _tools];
    uint64_t v51 = [v50 count];
    double v52 = 7.0;
    if (v51 < 8) {
      double v52 = 5.0;
    }
    *((double *)v5 + 35) = v52;

    long long v53 = -[PKToolPickerPaletteViewDelegateProxy initWithToolPicker:]((id *)[PKToolPickerPaletteViewDelegateProxy alloc], v5);
    long long v54 = (void *)*((void *)v5 + 25);
    *((void *)v5 + 25) = v53;

    uint64_t v55 = [v5 _toolsState];
    long long v56 = (void *)*((void *)v5 + 9);
    *((void *)v5 + 9) = v55;

    [v5 _restoreToolPickerStateNotify:0];
    long long v57 = objc_alloc_init(PKImageGenerationController);
    long long v58 = (void *)*((void *)v5 + 10);
    *((void *)v5 + 10) = v57;

    [*((id *)v5 + 10) setDelegate:v5];
  }

  return (PKToolPicker *)v5;
}

uint64_t __34__PKToolPicker_initWithToolItems___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 ink];
  uint64_t v3 = [v2 _isHandwritingInk];

  return v3;
}

uint64_t __34__PKToolPicker_initWithToolItems___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 _isRulerTool] ^ 1;
}

BOOL __34__PKToolPicker_initWithToolItems___block_invoke_133(uint64_t a1, void *a2)
{
  id v2 = [a2 toolPicker];
  BOOL v3 = v2 == 0;

  return v3;
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PKToolPicker;
  [(PKToolPicker *)&v4 dealloc];
}

- (void)_handleSqueezeInteractionWillShowPaletteViewNotification:(id)a3
{
  objc_super v4 = os_log_create("com.apple.pencilkit", "ToolPicker");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "Handle squeeze interaction will show palette view notification", v6, 2u);
  }

  double v5 = [(PKToolPicker *)self _paletteView];
  [v5 _dismissEyeDropper];
}

- (PKToolPickerItemManager)_toolItemManager
{
  return self->_toolItemManager;
}

- (PKToolPickerItem)selectedToolItem
{
  id v2 = -[PKToolPickerItemManager itemForTool:]((id *)&self->_toolItemManager->super.isa, self->_selectedTool);
  if (!v2)
  {
    id v2 = +[PKToolPickerInkingItem _defaultInkingItemForType:]((uint64_t)PKToolPickerInkingItem, @"com.apple.ink.pen");
  }

  return (PKToolPickerItem *)v2;
}

- (void)setSelectedToolItem:(id)a3
{
  id v4 = [a3 identifier];
  [(PKToolPicker *)self setSelectedToolItemIdentifier:v4];
}

- (NSString)selectedToolItemIdentifier
{
  id v2 = [(PKToolPicker *)self selectedToolItem];
  BOOL v3 = [v2 identifier];

  return (NSString *)v3;
}

- (void)setSelectedToolItemIdentifier:(id)a3
{
  if (a3)
  {
    id v4 = -[PKToolPickerItemManager toolForIdentifier:]((uint64_t)self->_toolItemManager, (uint64_t)a3);
    if (v4)
    {
      double v5 = v4;
      [(PKToolPicker *)self _setSelectedTool:v4 saveState:1 updateUI:1 updateLastSelectedTool:1];
      id v4 = v5;
    }
  }
}

- (NSArray)toolItems
{
  return (NSArray *)-[PKToolPickerItemManager toolItemsForTools:]((id *)&self->_toolItemManager->super.isa, self->_mutableTools);
}

- (void)_setEnabled:(BOOL)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->__enabled != a3)
  {
    self->__BOOL enabled = a3;
    id v4 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      BOOL enabled = self->__enabled;
      v6[0] = 67109120;
      v6[1] = enabled;
      _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "Tool picker enabled state changed to: %{BOOL}d", (uint8_t *)v6, 8u);
    }

    [(PKToolPicker *)self _updateToolPickerVisibility];
  }
}

- (void)_setWantsExternalVisibility:(BOOL)a3
{
  if (!PKIsVisionDevice())
  {
    BOOL v3 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
    }
  }
}

- (BOOL)_isLockedHidden
{
  return self->_wantsToolPickerHiddenCount > 0;
}

- (void)_lockHiddenNotify:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  ++self->_wantsToolPickerHiddenCount;
  double v5 = os_log_create("com.apple.pencilkit", "ToolPicker");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int64_t wantsToolPickerHiddenCount = self->_wantsToolPickerHiddenCount;
    int v9 = 134218496;
    uint64_t v10 = self;
    __int16 v11 = 2048;
    int64_t v12 = wantsToolPickerHiddenCount;
    __int16 v13 = 1024;
    BOOL v14 = [(PKToolPicker *)self isVisible];
    _os_log_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_INFO, "ToolPicker: %p, locking tool picker visibility hidden, count: %ld, isVisible: %{BOOL}d", (uint8_t *)&v9, 0x1Cu);
  }

  if ([(PKToolPicker *)self isVisible])
  {
    uint64_t v7 = objc_alloc_init(PKToolPickerVisibilityContext);
    uint64_t v8 = v7;
    if (v7) {
      v7->_shouldNotifyDuringUpdate = a3;
    }
    -[PKToolPicker _updateToolPickerVisibilityWithContext:completion:](self, v7, 0);
  }
}

- (void)_unlockHiddenNotify:(BOOL)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int64_t wantsToolPickerHiddenCount = self->_wantsToolPickerHiddenCount;
  BOOL v4 = wantsToolPickerHiddenCount < 1;
  int64_t v5 = wantsToolPickerHiddenCount - 1;
  if (!v4)
  {
    self->_int64_t wantsToolPickerHiddenCount = v5;
    uint64_t v8 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int64_t v9 = self->_wantsToolPickerHiddenCount;
      int v12 = 134218496;
      __int16 v13 = self;
      __int16 v14 = 2048;
      int64_t v15 = v9;
      __int16 v16 = 1024;
      BOOL v17 = [(PKToolPicker *)self isVisible];
      _os_log_impl(&dword_1C44F8000, v8, OS_LOG_TYPE_INFO, "ToolPicker: %p, unlocking tool picker visibility hidden, count: %ld, isVisible: %{BOOL}d", (uint8_t *)&v12, 0x1Cu);
    }

    if (!self->_wantsToolPickerHiddenCount)
    {
      uint64_t v10 = objc_alloc_init(PKToolPickerVisibilityContext);
      __int16 v11 = v10;
      if (v10) {
        v10->_shouldNotifyDuringUpdate = a3;
      }
      -[PKToolPicker _updateToolPickerVisibilityWithContext:completion:](self, v10, 0);
    }
  }
}

- (void)_lockHidden
{
}

- (void)_unlockHidden
{
}

- (NSString)_paletteViewStateRestorationDefaultsKey
{
  if ([(PKToolPicker *)self _useNewAutosaveNameBehavior]
    && ([(PKToolPicker *)self stateAutosaveName],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [@"PKPaletteNamedDefaults" isEqualToString:v3],
        v3,
        v4))
  {
    int64_t v5 = [(PKToolPicker *)self stateAutosaveName];
  }
  else
  {
    int64_t v5 = [MEMORY[0x1E4F28E78] stringWithString:@"PKPaletteNamedDefaults"];
    uint64_t v6 = [(PKToolPicker *)self stateAutosaveName];

    if (v6)
    {
      uint64_t v7 = [(PKToolPicker *)self stateAutosaveName];
      [v5 appendFormat:@"-%@", v7];
    }
  }

  return (NSString *)v5;
}

- (void)setMaximumSupportedContentVersion:(PKContentVersion)maximumSupportedContentVersion
{
  self->_maximumSupportedContentVersion = maximumSupportedContentVersion;
  int v4 = [(PKToolPicker *)self _tools];
  uint64_t v5 = [v4 count];
  double v6 = 7.0;
  if (v5 < 8) {
    double v6 = 5.0;
  }
  self->__interItemToolsSpacingInCompactSize = v6;

  [(PKToolPicker *)self _updateNewInks];

  [(PKToolPicker *)self _updateUI];
}

- (void)_setPresentsDetached:(BOOL)a3
{
  if (!PKIsVisionDevice())
  {
    BOOL v3 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v4 = 0;
    }
  }
}

- (void)_setDoneButtonVisible:(BOOL)a3
{
  if (!PKIsVisionDevice())
  {
    BOOL v3 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v4 = 0;
    }
  }
}

+ (BOOL)_defaultValueForToolStatePersistenceEnabled
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (os_variant_has_internal_diagnostics())
  {
    int v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v5 = [v4 objectForKey:@"PKShouldRestoreToolPickerState"];

    if (v5) {
      int v2 = [v4 BOOLForKey:@"PKShouldRestoreToolPickerState"];
    }
    else {
      int v2 = 1;
    }
    double v6 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = @"NO";
      if (v2) {
        uint64_t v7 = @"YES";
      }
      int v8 = 138412290;
      int64_t v9 = v7;
      _os_log_impl(&dword_1C44F8000, v6, OS_LOG_TYPE_DEFAULT, "Should restore tool picker state: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    LOBYTE(v2) = 1;
  }
  return v2;
}

- (void)_restoreToolPickerState
{
}

- (void)_restoreToolPickerStateNotify:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(PKToolPicker *)self _isToolStatePersistenceEnabled];
  os_log_t v6 = os_log_create("com.apple.pencilkit", "ToolPicker");
  uint64_t v7 = v6;
  if (v5)
  {
    int v8 = v6;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v9 = [(PKToolPicker *)self _paletteViewStateRestorationDefaultsKey];
      int v17 = 138477827;
      uint64_t v18 = v9;
      _os_log_impl(&dword_1C44F8000, v8, OS_LOG_TYPE_DEFAULT, "Restore state for name: %{private}@", (uint8_t *)&v17, 0xCu);
    }
    uint64_t v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v10 = [(PKToolPicker *)self _paletteViewStateRestorationDefaultsKey];
    __int16 v11 = [v7 dictionaryForKey:v10];

    if (v11)
    {
      uint64_t v12 = [v11 objectForKeyedSubscript:@"PKPaletteTools"];
      if (v12)
      {
        __int16 v13 = v12;
        [(PKToolPicker *)self _restoreToolPickerStateFromRepresentation:v12 notify:v3];
      }
      else
      {
        __int16 v14 = os_log_create("com.apple.pencilkit", "ToolPicker");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          __int16 v16 = [(PKToolPicker *)self _paletteViewStateRestorationDefaultsKey];
          int v17 = 138412290;
          uint64_t v18 = v16;
          _os_log_error_impl(&dword_1C44F8000, v14, OS_LOG_TYPE_ERROR, "Missing tools array to restore state for: %@", (uint8_t *)&v17, 0xCu);
        }
        __int16 v13 = 0;
      }
    }
    else
    {
      __int16 v13 = os_log_create("com.apple.pencilkit", "ToolPicker");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int64_t v15 = [(PKToolPicker *)self _paletteViewStateRestorationDefaultsKey];
        int v17 = 138412290;
        uint64_t v18 = v15;
        _os_log_error_impl(&dword_1C44F8000, v13, OS_LOG_TYPE_ERROR, "Missing defaults dictionary to restore state for: %@", (uint8_t *)&v17, 0xCu);
      }
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v17) = 0;
    _os_log_impl(&dword_1C44F8000, v7, OS_LOG_TYPE_DEFAULT, "Tried to restore state but persistence is disabled.", (uint8_t *)&v17, 2u);
  }
}

- (void)_restoreToolPickerStateFromRepresentation:(id)a3 notify:(BOOL)a4
{
  BOOL v43 = a4;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v46 = a3;
  long long v45 = -[PKToolPicker _validatedEncodedToolsArray:](self, "_validatedEncodedToolsArray:");
  BOOL v5 = +[PKToolPicker _keyEncodedToolsByIdentifier:](PKToolPicker, "_keyEncodedToolsByIdentifier:");
  os_log_t v6 = [(PKToolPicker *)self toolItems];
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  long long v44 = self;
  uint64_t v51 = self->_selectedTool;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id obj = v6;
  uint64_t v53 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
  if (v53)
  {
    uint64_t v52 = *(void *)v55;
    long long v48 = v7;
    long long v49 = v5;
    do
    {
      for (uint64_t i = 0; i != v53; ++i)
      {
        if (*(void *)v55 != v52) {
          objc_enumerationMutation(obj);
        }
        int64_t v9 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        uint64_t v10 = [v9 identifier];
        __int16 v11 = [v5 objectForKeyedSubscript:v10];

        uint64_t v12 = [v9 _tool];
        __int16 v13 = [v12 ink];
        __int16 v14 = [v13 identifier];

        if (!v11)
        {
          if (([(__CFString *)v14 isEqualToString:@"com.apple.ink.custom"] & 1) != 0
            || ([v5 objectForKeyedSubscript:v14], (uint64_t v15 = objc_claimAutoreleasedReturnValue()) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              __int16 v11 = 0;
              goto LABEL_15;
            }
            __int16 v16 = @"com.apple.ink.objectEraser";

            uint64_t v17 = [v5 objectForKeyedSubscript:v16];
            if (v17)
            {
              __int16 v11 = (void *)v17;
              __int16 v14 = v16;
              goto LABEL_15;
            }
            __int16 v14 = @"com.apple.ink.eraser";

            uint64_t v15 = [v5 objectForKeyedSubscript:v14];
          }
          __int16 v11 = (void *)v15;
        }
LABEL_15:
        id v18 = [v9 _tool];
        uint64_t v19 = v18;
        if (!v11)
        {
          uint64_t v23 = v18;
          goto LABEL_32;
        }
        uint64_t v20 = objc_opt_class();
        CGFloat v21 = [v11 objectForKeyedSubscript:@"properties"];
        CGFloat v22 = PKDynamicCast(v20, v21);

        uint64_t v23 = v19;
        if (v22)
        {
          uint64_t v24 = [v19 ink];
          if (v24)
          {
            uint64_t v25 = [v19 ink];
            uint64_t v26 = [v25 version];
          }
          else
          {
            uint64_t v26 = -1;
          }

          uint64_t v27 = +[PKInk inkWithIdentifier:v14 properties:v22 inkVersion:v26];
          uint64_t v28 = objc_opt_class();
          double v29 = PKDynamicCast(v28, v19);
          if (v29)
          {
            uint64_t v30 = [v27 color];
            id v31 = (id)[v29 copyWithScrubbedColor:v30];

            [v27 weight];
            uint64_t v23 = objc_msgSend(v31, "copyWithScrubbedWeight:");
            CGRect v32 = v19;
            goto LABEL_27;
          }
          long long v33 = [v27 identifier];
          char v34 = [v33 isEqualToString:@"com.apple.ink.custom"];

          uint64_t v23 = v19;
          if ((v34 & 1) == 0)
          {
            id v31 = v27;
            __int16 v35 = [v19 _configuration];
            char v36 = [v35 supportsColor];

            if ((v36 & 1) == 0)
            {
              uint64_t v37 = [v19 ink];
              uint64_t v38 = [v37 color];
              uint64_t v47 = +[PKInk inkFromInk:v31 color:v38];

              id v31 = (id)v47;
            }
            CGRect v32 = [v19 _configuration];
            uint64_t v23 = +[PKTool _toolWithInk:v31 configuration:v32];

LABEL_27:
          }
          uint64_t v39 = [v19 _toolPickerItemIdentifier];
          [v23 _setToolPickerItemIdentifier:v39];

          uint64_t v7 = v48;
          BOOL v5 = v49;
        }
        v40 = [v11 objectForKeyedSubscript:@"isSelected"];
        int v41 = [v40 BOOLValue];

        if (v41)
        {
          long long v42 = v23;

          uint64_t v51 = v42;
        }

LABEL_32:
        [v7 addObject:v23];
      }
      uint64_t v53 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
    }
    while (v53);
  }

  [(PKToolPicker *)v44 _resetTools:v7 selectedTool:v51 notify:v43];
  [(PKToolPicker *)v44 _updateUI];
}

+ (id)_keyEncodedToolsByIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = objc_opt_class();
        uint64_t v12 = objc_msgSend(v10, "objectForKeyedSubscript:", @"identifier", (void)v16);
        __int16 v13 = PKDynamicCast(v11, v12);

        if (v13)
        {
          __int16 v14 = [v4 objectForKeyedSubscript:v13];

          if (!v14) {
            [v4 setObject:v10 forKeyedSubscript:v13];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_validatedEncodedToolsArray:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v35 = [MEMORY[0x1E4F1CA48] array];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    os_log_t v4 = (os_log_t)v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (!v5) {
      goto LABEL_38;
    }
    uint64_t v6 = v5;
    id v30 = v3;
    uint64_t v7 = *(void *)v37;
    uint64_t v8 = v4;
    while (1)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v37 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v36 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v11 = [v10 objectForKeyedSubscript:@"identifier"];
          if (v11)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v12 = [v10 objectForKeyedSubscript:@"properties"];
              if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {
                __int16 v13 = os_log_create("com.apple.pencilkit", "ToolPicker");
                if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v21 = (objc_class *)objc_opt_class();
                  CGRect v32 = NSStringFromClass(v21);
                  uint64_t v22 = [(PKToolPicker *)self _paletteViewStateRestorationDefaultsKey];
                  *(_DWORD *)buf = 138543618;
                  long long v42 = v32;
                  __int16 v43 = 2112;
                  uint64_t v44 = v22;
                  uint64_t v23 = (void *)v22;
                  _os_log_error_impl(&dword_1C44F8000, v13, OS_LOG_TYPE_ERROR, "Skipping decode of tool dictionary with wrong class for properties dictionary: %{public}@ from: %@", buf, 0x16u);
                }
              }
              else
              {
                __int16 v13 = [v10 objectForKeyedSubscript:@"isSelected"];
                if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                {
                  uint64_t v15 = os_log_create("com.apple.pencilkit", "ToolPicker");
                  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
                  {
                    uint64_t v24 = (objc_class *)objc_opt_class();
                    long long v33 = NSStringFromClass(v24);
                    id v31 = [(PKToolPicker *)self _paletteViewStateRestorationDefaultsKey];
                    *(_DWORD *)buf = 138543618;
                    long long v42 = v33;
                    __int16 v43 = 2112;
                    uint64_t v44 = (uint64_t)v31;
                    _os_log_error_impl(&dword_1C44F8000, v15, OS_LOG_TYPE_ERROR, "Skipping decode of tool dictionary with wrong class for selected bit: %{public}@ from: %@", buf, 0x16u);
                  }
                }
                else
                {
                  [v35 addObject:v10];
                }
              }
              goto LABEL_22;
            }
            __int16 v13 = os_log_create("com.apple.pencilkit", "ToolPicker");
            if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
LABEL_21:
              uint64_t v12 = v13;
LABEL_22:

              os_log_t v4 = v8;
              goto LABEL_23;
            }
            long long v19 = (objc_class *)objc_opt_class();
            __int16 v14 = NSStringFromClass(v19);
            uint64_t v20 = [(PKToolPicker *)self _paletteViewStateRestorationDefaultsKey];
            *(_DWORD *)buf = 138543618;
            long long v42 = v14;
            __int16 v43 = 2112;
            uint64_t v44 = (uint64_t)v20;
            _os_log_error_impl(&dword_1C44F8000, v13, OS_LOG_TYPE_ERROR, "Skipping decode of tool dictionary with wrong class for identifier: %{public}@ from: %@", buf, 0x16u);
          }
          else
          {
            __int16 v13 = os_log_create("com.apple.pencilkit", "ToolPicker");
            if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
              goto LABEL_21;
            }
            __int16 v14 = [(PKToolPicker *)self _paletteViewStateRestorationDefaultsKey];
            *(_DWORD *)buf = 138412290;
            long long v42 = v14;
            _os_log_error_impl(&dword_1C44F8000, v13, OS_LOG_TYPE_ERROR, "Skipping decode of tool dictionary missing identifier from: %@", buf, 0xCu);
          }

          goto LABEL_21;
        }
        uint64_t v12 = os_log_create("com.apple.pencilkit", "ToolPicker");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          long long v16 = (objc_class *)objc_opt_class();
          long long v17 = NSStringFromClass(v16);
          long long v18 = [(PKToolPicker *)self _paletteViewStateRestorationDefaultsKey];
          *(_DWORD *)buf = 138543618;
          long long v42 = v17;
          __int16 v43 = 2112;
          uint64_t v44 = (uint64_t)v18;
          _os_log_error_impl(&dword_1C44F8000, v12, OS_LOG_TYPE_ERROR, "Skipping decode of tool dictionary with wrong class: %{public}@ from: %@", buf, 0x16u);

          os_log_t v4 = v8;
        }
        uint64_t v11 = v12;
LABEL_23:

        ++v9;
      }
      while (v6 != v9);
      uint64_t v25 = [v4 countByEnumeratingWithState:&v36 objects:v40 count:16];
      uint64_t v6 = v25;
      if (!v25)
      {
        id v3 = v30;
        goto LABEL_38;
      }
    }
  }
  os_log_t v4 = os_log_create("com.apple.pencilkit", "ToolPicker");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v27 = (objc_class *)objc_opt_class();
    uint64_t v28 = NSStringFromClass(v27);
    double v29 = [(PKToolPicker *)self _paletteViewStateRestorationDefaultsKey];
    *(_DWORD *)buf = 138543618;
    long long v42 = v28;
    __int16 v43 = 2112;
    uint64_t v44 = (uint64_t)v29;
    _os_log_error_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_ERROR, "Encoded tools array has wrong class: %{public}@ from: %@", buf, 0x16u);
  }
  id v35 = (id)MEMORY[0x1E4F1CBF0];
LABEL_38:

  return v35;
}

- (void)_saveToolPickerState
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([(PKToolPicker *)self _isToolStatePersistenceEnabled])
  {
    id v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    os_log_t v4 = [(PKToolPicker *)self _paletteViewStateRestorationDefaultsKey];
    uint64_t v5 = [v3 dictionaryForKey:v4];
    uint64_t v6 = (void *)[v5 mutableCopy];

    if (!v6)
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    uint64_t v7 = [(PKToolPicker *)self _toolsState];
    [v6 setObject:v7 forKey:@"PKPaletteTools"];

    uint64_t v8 = [(PKToolPicker *)self _paletteViewStateRestorationDefaultsKey];
    [v3 setObject:v6 forKey:v8];

    uint64_t v9 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [(PKToolPicker *)self _paletteViewStateRestorationDefaultsKey];
      int v11 = 138477827;
      uint64_t v12 = v10;
      _os_log_impl(&dword_1C44F8000, v9, OS_LOG_TYPE_DEFAULT, "Did save state for name: %{private}@", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    id v3 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1C44F8000, v3, OS_LOG_TYPE_DEFAULT, "Tried to save state but persistence is disabled.", (uint8_t *)&v11, 2u);
    }
  }
}

- (NSArray)_toolsState
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = [(PKToolPicker *)self toolItems];
  os_log_t v4 = [(PKToolPicker *)self selectedToolItemIdentifier];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "_dictionaryRepresentation", (void)v19);
        if (v4)
        {
          uint64_t v13 = [v11 identifier];
          int v14 = [v13 isEqualToString:v4];

          if (v14)
          {
            uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v12];
            [v15 setValue:MEMORY[0x1E4F1CC38] forKey:@"isSelected"];
            uint64_t v16 = [v15 copy];

            uint64_t v12 = (void *)v16;
          }
        }
        if ((unint64_t)[v12 count] >= 2) {
          [v5 addObject:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  long long v17 = (void *)[v5 copy];

  return (NSArray *)v17;
}

- (void)keyboardSceneDelegate:(id)a3 inputViewSetVisibilityDidChange:(BOOL)a4 includedReset:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_keyboardSceneDelegateVisibilityObserver);

  if (WeakRetained)
  {
    id v10 = objc_loadWeakRetained((id *)&self->_keyboardSceneDelegateVisibilityObserver);
    [v10 keyboardSceneDelegate:v8 inputViewSetVisibilityDidChange:v6 includedReset:v5];
  }
  else
  {
    int v11 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13[0] = 67109376;
      v13[1] = v6;
      __int16 v14 = 1024;
      BOOL v15 = v5;
      _os_log_impl(&dword_1C44F8000, v11, OS_LOG_TYPE_DEFAULT, "keyboardSceneDelegate inputViewSetVisibilityDidChange isVisible: %d, includedReset: %d", (uint8_t *)v13, 0xEu);
    }

    if (v6) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = v5 & ~PKIsPhoneDevice();
    }
    [(PKToolPicker *)self _setInputViewVisible:v12];
    [(PKToolPicker *)self _updateToolPickerVisibility];
  }
}

- (void)paletteViewInteractionDidActivate:(id)a3
{
  [(PKToolPicker *)self _setInputViewVisible:1];

  [(PKToolPicker *)self _updateUI];
}

- (void)_handleHandwritingEducationPaneSettingsDidChange:(id)a3
{
  if ([(PKToolPicker *)self isVisible])
  {
    os_log_t v4 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v6 = 0;
      _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "Handle handwriting education pane settings did change notification", v6, 2u);
    }

    BOOL v5 = [(PKToolPicker *)self _paletteView];
    [v5 handwritingEducationPaneSettingsDidChange];
  }
}

- (PKPaletteHostView)_paletteHostView
{
  toolPickerVisibilitCGFloat y = self->_toolPickerVisibility;
  if (!toolPickerVisibility) {
    toolPickerVisibilitCGFloat y = self->__interaction;
  }
  os_log_t v4 = [toolPickerVisibility paletteHostView];

  return (PKPaletteHostView *)v4;
}

- (void)_updatePaletteTraitCollection:(id)a3
{
  uint64_t v4 = [a3 userInterfaceStyle];

  [(PKToolPicker *)self _updatePaletteUserInterfaceStyle:v4];
}

- (void)_updatePaletteUserInterfaceStyle:(int64_t)a3
{
  [(PKPaletteViewInteraction *)self->__interaction _updatePaletteUserInterfaceStyle:a3];

  [(PKToolPicker *)self _updateUserInterfaceStyle];
}

- (void)_updateUserInterfaceStyle
{
  int v2 = +[PKToolPicker _windowSceneForToolPicker:self];
  if (v2)
  {
    uint64_t v4 = v2;
    id v3 = +[PKPencilSqueezeInteraction _existingInteractionForWindowScene:v2];
    [v3 _updateUserInterfaceStyle];

    int v2 = v4;
  }
}

- (BOOL)_internalClassesAcceptingFirstResponderContainsObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

+ (BOOL)_internalClassWantsToolPicker:(id)a3 visibleForResponder:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (objc_opt_respondsToSelector())
  {
    char v7 = [v6 _wantsToolPickerVisible:v5];
    goto LABEL_29;
  }
  if (![v5 _internalClassesAcceptingFirstResponderContainsObject:v6])
  {
    char v7 = 0;
    goto LABEL_29;
  }
  id v8 = v6;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v9 = [v5 _firstRespondersForVisibleUI];
  id v10 = [v9 keyEnumerator];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (!v11)
  {
    char v7 = 0;
    goto LABEL_28;
  }
  uint64_t v12 = v11;
  id v23 = v6;
  uint64_t v24 = v10;
  uint64_t v13 = *(void *)v26;
  while (2)
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v26 != v13) {
        objc_enumerationMutation(v10);
      }
      BOOL v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = v15;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          long long v17 = 0;
          goto LABEL_22;
        }
        id v16 = [v15 view];
      }
      long long v17 = v16;
      if (v16)
      {
        long long v18 = [v16 window];
        long long v19 = [v8 window];
        if (v18 == v19)
        {
          id v20 = v5;
          int v21 = [v5 _wasVisibleBeforeResponderChanges];

          if (v21)
          {
            if (([v8 isDescendantOfView:v17] & 1) != 0
              || (NSClassFromString(&cfstr_Icinktoolpicke.isa), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
              || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {

              char v7 = 1;
              id v5 = v20;
              id v6 = v23;
              id v10 = v24;
              goto LABEL_28;
            }
          }
          id v5 = v20;
          id v10 = v24;
        }
        else
        {
        }
      }
LABEL_22:
    }
    uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v12) {
      continue;
    }
    break;
  }
  char v7 = 0;
  id v6 = v23;
LABEL_28:

LABEL_29:
  return v7;
}

+ (BOOL)_textInputWantsToolPickerVisible:(id)a3 forFirstResponder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v9 = [v8 bundleIdentifier];
  int v10 = [v9 isEqual:@"com.apple.mobilenotes"];

  if (!v10) {
    goto LABEL_12;
  }
  uint64_t v11 = [v6 _paletteView];
  uint64_t v12 = [v11 windowFirstResponder];

  if (v12)
  {
    uint64_t v13 = [v6 _paletteView];
    __int16 v14 = [v13 windowFirstResponder];
    uint64_t v15 = [v14 textInputSource];
  }
  else
  {
    uint64_t v15 = +[PKTextInputUtilities responderTextInputSource:v7];
  }
  if (v15 != 3 || ![v6 _isHandwritingToolSelected])
  {
    [v6 _isHandwritingToolSelected];
LABEL_12:
    LOBYTE(v18) = 0;
    goto LABEL_13;
  }
  NSClassFromString(&cfstr_Ictextview.isa);
  id v16 = v7;
  if (!v16) {
    goto LABEL_15;
  }
  while ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v17 = [v16 nextResponder];

    id v16 = (id)v17;
    if (!v17) {
      goto LABEL_15;
    }
  }
  id v20 = [v16 _responderWindow];
  int v21 = [v20 windowScene];
  long long v22 = [a1 _windowSceneForToolPicker:v6];

  if (v21 == v22)
  {
    id v23 = [v16 findInteraction];
    int v18 = [v23 isFindNavigatorVisible] ^ 1;
  }
  else
  {
LABEL_15:
    LOBYTE(v18) = 0;
  }

LABEL_13:
  return v18;
}

- (void)_tellDelegateToHideToolPicker
{
  id v3 = [(PKToolPicker *)self _delegateForSelector:sel__toolPicker_shouldSetVisible_];
  if (v3)
  {
    id v4 = v3;
    [v3 _toolPicker:self shouldSetVisible:0];
    id v3 = v4;
  }
}

- (PKToolPickerPopoverPresentationConfiguring)_popoverPresentationConfiguration
{
  if ([(PKToolPicker *)self isVisible]) {
    id v3 = self;
  }
  else {
    id v3 = 0;
  }

  return (PKToolPickerPopoverPresentationConfiguring *)v3;
}

- (void)_presentViewController:(id)a3 asPopoverFromItem:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PKToolPicker *)self _paletteView];
  [v8 _presentViewController:v7 asPopoverFromItem:v6];
}

- (UIViewController)presentationViewController
{
  int v2 = [(PKToolPicker *)self _paletteView];
  id v3 = [v2 palettePopoverPresentingController];

  return (UIViewController *)v3;
}

- (NSArray)passthroughViews
{
  int v2 = [(PKToolPicker *)self _paletteView];
  id v3 = [v2 palettePopoverPassthroughViews];

  return (NSArray *)v3;
}

- (unint64_t)permittedArrowDirections
{
  int v2 = [(PKToolPicker *)self _paletteView];
  unint64_t v3 = [v2 palettePopoverPermittedArrowDirections];

  return v3;
}

- (UIEdgeInsets)layoutSceneMargins
{
  int v2 = [(PKToolPicker *)self _paletteView];
  [v2 palettePopoverLayoutSceneMargins];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

+ (BOOL)_canShowHandwritingTool
{
  if (PKIsVisionDevice()) {
    return 0;
  }
  if (objc_opt_respondsToSelector()) {
    [MEMORY[0x1E4FB1A80] hasSeenPencilPairingUI];
  }
  if (os_variant_has_internal_diagnostics())
  {
    double v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v6 BOOLForKey:@"PKForceShowHandwritingTool"];
  }
  if (os_variant_has_internal_diagnostics())
  {
    double v7 = [MEMORY[0x1E4F28B50] mainBundle];
    double v8 = [v7 bundleIdentifier];
    char v9 = [v8 isEqualToString:@"com.apple.dt.xctest.tool"];

    if (v9) {
      return 1;
    }
  }
  double v3 = +[PKTextInputSettings sharedSettings];
  double v4 = [v3 recognitionLocaleIdentifier];
  BOOL v2 = v4 != 0;

  return v2;
}

- (void)_setShowsHandwritingTool:(BOOL)a3
{
  int v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (PKIsVisionDevice())
  {
    double v5 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_INFO, "Can't show the handwriting tool on this platform.", (uint8_t *)&v11, 2u);
    }

    self->__BOOL showsHandwritingTool = 0;
  }
  else if (self->__showsHandwritingTool != v3)
  {
    self->__BOOL showsHandwritingTool = v3;
    if (v3) {
      int v3 = [(id)objc_opt_class() _canShowHandwritingTool];
    }
    int v6 = [(PKToolPicker *)self _hasHandwritingTool];
    double v7 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL showsHandwritingTool = self->__showsHandwritingTool;
      int v11 = 67109120;
      LODWORD(v12) = showsHandwritingTool;
      _os_log_impl(&dword_1C44F8000, v7, OS_LOG_TYPE_DEFAULT, "Should show handwriting tool: %d", (uint8_t *)&v11, 8u);
    }

    if (v3 != v6)
    {
      char v9 = os_log_create("com.apple.pencilkit", "ToolPicker");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        double v10 = @"HIDDEN";
        if (v3) {
          double v10 = @"VISIBLE";
        }
        int v11 = 138412290;
        double v12 = v10;
        _os_log_impl(&dword_1C44F8000, v9, OS_LOG_TYPE_DEFAULT, "Handwriting tool state: %@", (uint8_t *)&v11, 0xCu);
      }

      [(PKToolPicker *)self _updateUI];
      [(PKToolPicker *)self _saveToolPickerState];
    }
  }
}

- (id)_handwritingTool
{
  uint64_t v3 = [(NSMutableArray *)self->_mutableTools indexOfObjectPassingTest:&__block_literal_global_190];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v4 = 0;
  }
  else
  {
    double v4 = [(NSMutableArray *)self->_mutableTools objectAtIndex:v3];
  }

  return v4;
}

uint64_t __32__PKToolPicker__handwritingTool__block_invoke(uint64_t a1, void *a2)
{
  BOOL v2 = [a2 ink];
  uint64_t v3 = [v2 _isHandwritingInk];

  return v3;
}

- (BOOL)_isHandwritingToolSelected
{
  BOOL v2 = [(PKTool *)self->_selectedTool ink];
  char v3 = [v2 _isHandwritingInk];

  return v3;
}

- (void)_updateHandwritingInputAssistantItems
{
  BOOL v3 = [(PKToolPicker *)self _isHandwritingToolSelected];
  double v4 = os_log_create("com.apple.pencilkit", "ToolPicker");
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)int v6 = 0;
      _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "Update handwriting assistant items.", v6, 2u);
    }

    double v4 = [(PKToolPicker *)self _paletteView];
    [v4 updateHandwritingAssistantItems];
  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "Can't update handwriting assistant items if handwriting tool isn't the selected tool.", buf, 2u);
  }
}

- (BOOL)_isCanvasGenerationToolSelected
{
  BOOL v2 = [(PKTool *)self->_selectedTool ink];
  char v3 = [v2 _isGenerationTool];

  return v3;
}

- (void)_textInputResponderDidReloadNotification:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = os_log_create("com.apple.pencilkit", "ToolPicker");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_DEFAULT, "Received notification: %@", (uint8_t *)&v6, 0xCu);
  }

  [(PKToolPicker *)self _updateHandwritingInputAssistantItems];
}

- (NSArray)_tools
{
  BOOL v2 = (void *)[(NSMutableArray *)self->_mutableTools copy];

  return (NSArray *)v2;
}

- (void)_addTool:(id)a3
{
  mutableTools = self->_mutableTools;
  id v5 = a3;
  [(PKToolPicker *)self _insertTool:v5 atIndex:[(NSMutableArray *)mutableTools count]];
}

- (void)_addTool:(id)a3 updateUI:(BOOL)a4
{
  BOOL v4 = a4;
  mutableTools = self->_mutableTools;
  id v7 = a3;
  [(PKToolPicker *)self _insertTool:v7 atIndex:[(NSMutableArray *)mutableTools count] updateUI:v4];
}

- (void)_insertTool:(id)a3 atIndex:(unint64_t)a4
{
}

- (void)_insertTool:(id)a3 atIndex:(unint64_t)a4 updateUI:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if ([(PKToolPicker *)self _canInsertTool:v8])
  {
    [(NSMutableArray *)self->_mutableTools insertObject:v8 atIndex:a4];
    if (v5) {
      [(PKToolPicker *)self _updateUI];
    }
    -[PKToolPickerItemManager _addTool:]((uint64_t)self->_toolItemManager, v8);
  }
  else
  {
    char v9 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v8;
      _os_log_impl(&dword_1C44F8000, v9, OS_LOG_TYPE_DEFAULT, "Can't insert tool: %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (BOOL)_canInsertTool:(id)a3
{
  id v4 = a3;
  int v5 = [v4 _isLassoTool];
  BOOL v6 = [(PKToolPicker *)self _hasLassoTool];
  if (v5) {
    goto LABEL_4;
  }
  id v7 = [v4 ink];
  int v8 = [v7 _isEraserInk];

  BOOL v6 = [(PKToolPicker *)self _hasEraserTool];
  if (v8
    || ([v4 ink],
        char v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v9 _isHandwritingInk],
        v9,
        BOOL v6 = [(PKToolPicker *)self _hasHandwritingTool],
        v10))
  {
LABEL_4:
    BOOL v11 = !v6;
  }
  else
  {
    BOOL v11 = [(PKToolPicker *)self _indexOfTool:v4] == 0x7FFFFFFFFFFFFFFFLL;
  }

  return v11;
}

- (void)_removeTool:(id)a3
{
}

- (void)_removeTool:(id)a3 updateUI:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(PKToolPicker *)self _canRemoveTool:v6])
  {
    [(NSMutableArray *)self->_mutableTools removeObjectAtIndex:[(PKToolPicker *)self _indexOfTool:v6]];
    if (v4) {
      [(PKToolPicker *)self _updateUI];
    }
    -[PKToolPickerItemManager _removeTool:]((uint64_t)self->_toolItemManager, v6);
  }
  else
  {
    id v7 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v6;
      _os_log_impl(&dword_1C44F8000, v7, OS_LOG_TYPE_DEFAULT, "Can't remove tool: %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)_removeToolsAtIndexes:(id)a3
{
}

- (void)_removeToolsAtIndexes:(id)a3 updateUI:(BOOL)a4
{
  BOOL v4 = a4;
  mutableTools = self->_mutableTools;
  id v7 = a3;
  int v8 = (void *)[(NSMutableArray *)mutableTools copy];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __47__PKToolPicker__removeToolsAtIndexes_updateUI___block_invoke;
  double v14 = &unk_1E64C60F8;
  id v9 = v8;
  id v15 = v9;
  id v16 = self;
  [v7 enumerateIndexesUsingBlock:&v11];
  uint64_t v10 = objc_msgSend(v7, "count", v11, v12, v13, v14);

  if (v10 && v4) {
    [(PKToolPicker *)self _updateUI];
  }
}

void __47__PKToolPicker__removeToolsAtIndexes_updateUI___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) objectAtIndex:a2];
  [*(id *)(a1 + 40) _removeTool:v3 updateUI:0];
}

- (BOOL)_canRemoveTool:(id)a3
{
  BOOL v4 = (PKTool *)a3;
  if ([(PKToolPicker *)self _indexOfTool:v4] == 0x7FFFFFFFFFFFFFFFLL)
  {
    char v5 = 0;
  }
  else if (self->_selectedTool == v4)
  {
    id v6 = [(PKTool *)v4 ink];
    char v5 = [v6 _isGenerationTool];
  }
  else
  {
    char v5 = 1;
  }

  return v5;
}

- (void)_resetTools:(id)a3 selectedTool:(id)a4
{
}

- (void)_resetTools:(id)a3 selectedTool:(id)a4 notify:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  int v8 = (PKTool *)a3;
  id v9 = a4;
  p_selectedTool = &self->_selectedTool;
  uint64_t v11 = self->_selectedTool;
  if ([(NSMutableArray *)self->_mutableTools isEqual:v8])
  {
    unint64_t v12 = [(PKToolPicker *)self _indexOfTool:v9 tools:v8];
    mutableTools = self->_mutableTools;
    if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
      [(NSMutableArray *)mutableTools firstObject];
    }
    else {
    uint64_t v14 = -[NSMutableArray objectAtIndex:](mutableTools, "objectAtIndex:");
    }
    CGRect v32 = *p_selectedTool;
    *p_selectedTool = (PKTool *)v14;

LABEL_28:
    if (v11 != *p_selectedTool && v5)
    {
      long long v33 = os_log_create("com.apple.pencilkit", "ToolPicker");
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        char v34 = *p_selectedTool;
        *(_DWORD *)buf = 138412290;
        uint64_t v45 = v34;
        _os_log_impl(&dword_1C44F8000, v33, OS_LOG_TYPE_DEFAULT, "Did reset selected tool to %@", buf, 0xCu);
      }

      [(PKToolPicker *)self _notifySelectedToolDidChange];
    }
    goto LABEL_36;
  }
  if ([(PKToolPicker *)self _canResetToolsFrom:v8])
  {
    BOOL v37 = v5;
    long long v36 = (void *)[(NSMutableArray *)self->_mutableTools copy];
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[PKTool count](v8, "count"));
    id v15 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    id v16 = self->_mutableTools;
    self->_mutableTools = v15;

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v38 = v8;
    uint64_t v17 = v8;
    uint64_t v18 = [(PKTool *)v17 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v40 != v20) {
            objc_enumerationMutation(v17);
          }
          id v22 = *(id *)(*((void *)&v39 + 1) + 8 * i);
          [(PKToolPicker *)self _addTool:v22 updateUI:0];
          unint64_t v23 = [(PKToolPicker *)self _indexOfTool:v22];
          if (v22 == v9 && v23 != 0x7FFFFFFFFFFFFFFFLL) {
            objc_storeStrong((id *)&self->_selectedTool, a4);
          }
        }
        uint64_t v19 = [(PKTool *)v17 countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v19);
    }

    if (![(NSMutableArray *)self->_mutableTools count])
    {
      long long v25 = (NSMutableArray *)[v36 mutableCopy];
      long long v26 = self->_mutableTools;
      self->_mutableTools = v25;

      long long v27 = os_log_create("com.apple.pencilkit", "ToolPicker");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C44F8000, v27, OS_LOG_TYPE_DEFAULT, "Unable to restore tools. Did reset tools to last copy", buf, 2u);
      }
    }
    BOOL v5 = v37;
    if ([(PKToolPicker *)self _indexOfTool:self->_selectedTool] == 0x7FFFFFFFFFFFFFFFLL)
    {
      long long v28 = [(NSMutableArray *)self->_mutableTools firstObject];
      selectedTool = self->_selectedTool;
      self->_selectedTool = v28;

      uint64_t v30 = os_log_create("com.apple.pencilkit", "ToolPicker");
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        id v31 = *p_selectedTool;
        *(_DWORD *)buf = 138412290;
        uint64_t v45 = v31;
        _os_log_impl(&dword_1C44F8000, v30, OS_LOG_TYPE_DEFAULT, "Unable to restore last selected tool. Did reset selected tool to %@", buf, 0xCu);
      }
    }
    int v8 = v38;
    goto LABEL_28;
  }
  id v35 = os_log_create("com.apple.pencilkit", "ToolPicker");
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v45 = v8;
    _os_log_impl(&dword_1C44F8000, v35, OS_LOG_TYPE_DEFAULT, "Can't reset tools to: %@", buf, 0xCu);
  }

LABEL_36:
}

- (BOOL)_canResetToolsFrom:(id)a3
{
  return [a3 count] != 0;
}

- (unint64_t)_indexOfTool:(id)a3
{
  return [(PKToolPicker *)self _indexOfTool:a3 tools:self->_mutableTools];
}

- (unint64_t)_indexOfTool:(id)a3 tools:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 count])
  {
    unint64_t v7 = 0;
    while (1)
    {
      int v8 = [v6 objectAtIndexedSubscript:v7];
      id v9 = [v8 _toolPickerItemIdentifier];
      uint64_t v10 = [v5 _toolPickerItemIdentifier];
      char v11 = [v9 isEqualToString:v10];

      if (v11) {
        break;
      }
      if (++v7 >= [v6 count]) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

uint64_t __38__PKToolPicker__lastSelectedToolIndex__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _isLassoTool];
}

uint64_t __32__PKToolPicker__eraserToolIndex__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _isEraserTool];
}

uint64_t __31__PKToolPicker__rulerToolIndex__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _isRulerTool];
}

- (void)_performPencilPreferredActionSwitchEraser
{
  id v2 = [(PKToolPicker *)self _paletteView];
  [v2 _performPencilPreferredActionSwitchEraser];
}

- (void)_performPencilPreferredActionSwitchPrevious
{
  id v2 = [(PKToolPicker *)self _paletteView];
  [v2 _performPencilPreferredActionSwitchPrevious];
}

- (void)_performPencilPreferredActionShowColorPalette
{
  id v2 = [(PKToolPicker *)self _paletteView];
  [v2 _performPencilPreferredActionShowColorPalette];
}

- (void)setSelectionMask:(unint64_t)a3
{
}

- (void)_setSelectionMask:(unint64_t)a3 updateUI:(BOOL)a4
{
  if (self->_selectionMask != a3)
  {
    self->_selectionMask = a3;
    if (a4) {
      [(PKToolPicker *)self _updateUI];
    }
  }
}

- (void)setColorSwatchesVisible:(BOOL)a3
{
  if (self->_colorSwatchesVisible != a3)
  {
    self->_colorSwatchesVisible = a3;
    [(PKToolPicker *)self _updateUI];
  }
}

- (void)setPrefersLargeContextualEditingUI:(BOOL)a3
{
  if (self->_prefersLargeContextualEditingUI != a3)
  {
    self->_prefersLargeContextualEditingUI = a3;
    [(PKToolPicker *)self _updateUI];
  }
}

- (BOOL)_startOpacityEditing
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = [(PKToolPicker *)self _observers];
  BOOL v4 = (void *)[v3 copy];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v17 != v7) {
        objc_enumerationMutation(v4);
      }
      id v9 = *(void **)(*((void *)&v16 + 1) + 8 * v8);
      if (objc_opt_respondsToSelector()) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v11 = v9;

    if (v11)
    {
      unint64_t v12 = [(PKToolPicker *)self _paletteView];
      [v12 startOpacityEditing];

      uint64_t v13 = [(PKToolPicker *)self _paletteView];
      uint64_t v14 = [v13 opacityEditingView];
      [v11 _toolPicker:self startEditingOpacityWithAccessoryView:v14];

      BOOL v10 = 1;
      BOOL v4 = v11;
      goto LABEL_12;
    }
    return 0;
  }
  else
  {
LABEL_9:
    BOOL v10 = 0;
LABEL_12:
  }
  return v10;
}

- (void)_endOpacityEditing
{
  id v2 = [(PKToolPicker *)self _paletteView];
  [v2 endOpacityEditing];
}

- (void)set_temporarySelectionDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->__temporarySelectionDelegate);

  uint64_t v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->__temporarySelectionDelegate, obj);
    uint64_t v6 = [(PKToolPicker *)self _paletteView];
    [v6 updateColorPickerSelectedColor];

    uint64_t v5 = obj;
  }
}

- (void)_dismissPopovers
{
  id v2 = [(PKToolPicker *)self _paletteView];
  [v2 dismissPalettePopoverWithCompletion:0];
}

- (void)_canvasViewWillBeginDrawing:(id)a3
{
  if (PKIsVisionDevice())
  {
    [(PKToolPicker *)self _dismissPopovers];
  }
}

- (void)_setContextMenuPresented:(BOOL)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->__contextMenuPresented != a3)
  {
    self->__BOOL contextMenuPresented = a3;
    BOOL v4 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      BOOL contextMenuPresented = self->__contextMenuPresented;
      v6[0] = 67109120;
      v6[1] = contextMenuPresented;
      _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "Context menu presented state did change: %d", (uint8_t *)v6, 8u);
    }

    [(PKToolPicker *)self _updateToolPickerVisibilityContextMenuPresentedDidChange:1];
  }
}

- (void)_setOverlapsWindow:(BOOL)a3
{
  BOOL v3 = a3;
  if (PKIsVisionDevice() && self->__overlapsMainWindow != v3)
  {
    uint64_t v5 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v6 = 0;
    }
  }
}

- (BOOL)_useNewAutosaveNameBehavior
{
  return dyld_program_sdk_at_least();
}

- (void)_paletteContentSizeDidChange
{
}

- (void)_setSelectedColor:(id)a3 isFromExtendedColorPicker:(BOOL)a4
{
  id v5 = -[PKTool _copyWithColor:](self->_selectedTool, "_copyWithColor:", a3, a4);
  [(PKToolPicker *)self _setSelectedTool:v5 saveState:1 updateUI:1 updateLastSelectedTool:0];
}

- (void)_handleDidInvokeAddTextBox
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v1 = a1;
    id v2 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C44F8000, v2, OS_LOG_TYPE_DEFAULT, "Handle did invoke add text-box", buf, 2u);
    }

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    BOOL v3 = (void *)[*(id *)(v1 + 192) copy];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v20;
      uint64_t v7 = "com.apple.pencilkit";
      uint64_t v8 = "ToolPicker";
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v20 != v6) {
            objc_enumerationMutation(v3);
          }
          BOOL v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            id v11 = os_log_create(v7, v8);
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              PKDebugStringRepresentation(v10);
              uint64_t v12 = v5;
              uint64_t v13 = v6;
              uint64_t v14 = v3;
              uint64_t v15 = v1;
              long long v16 = v8;
              v18 = long long v17 = v7;
              *(_DWORD *)buf = 138412290;
              uint64_t v24 = v18;
              _os_log_impl(&dword_1C44F8000, v11, OS_LOG_TYPE_DEFAULT, "Invoke add text-box on observer: %@", buf, 0xCu);

              uint64_t v7 = v17;
              uint64_t v8 = v16;
              uint64_t v1 = v15;
              BOOL v3 = v14;
              uint64_t v6 = v13;
              uint64_t v5 = v12;
            }

            [v10 _toolPickerDidInvokeAddTextBox:v1];
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v19 objects:v25 count:16];
      }
      while (v5);
    }
  }
}

- (void)_handleInsertStickerFromItemProvider:(uint64_t)a1
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v16 = a2;
  if (a1)
  {
    id v2 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      id v23 = v16;
      _os_log_impl(&dword_1C44F8000, v2, OS_LOG_TYPE_DEFAULT, "Handle did invoke insert sticker from item provider: %{private}@", buf, 0xCu);
    }

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    BOOL v3 = (void *)[*(id *)(a1 + 192) copy];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v18;
      uint64_t v7 = "com.apple.pencilkit";
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v18 != v6) {
            objc_enumerationMutation(v3);
          }
          id v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            BOOL v10 = os_log_create(v7, "ToolPicker");
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            {
              PKDebugStringRepresentation(v9);
              uint64_t v11 = v5;
              uint64_t v12 = v6;
              v14 = uint64_t v13 = v7;
              *(_DWORD *)buf = 138412290;
              id v23 = v14;
              _os_log_impl(&dword_1C44F8000, v10, OS_LOG_TYPE_DEFAULT, "Invoke insert sticker on observer: %@", buf, 0xCu);

              uint64_t v7 = v13;
              uint64_t v6 = v12;
              uint64_t v5 = v11;
            }

            [v9 _toolPickerDidInvokeInsertSticker:a1 fromItemProvider:v16];
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v5);
    }
  }
}

- (double)_fullScreenWindowScaleFactor
{
  if (!a1) {
    return 0.0;
  }
  uint64_t v1 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v1 bounds];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  BOOL v10 = +[PKPaletteView _makeScaleFactorPolicy];
  objc_msgSend(v10, "scaleFactorForWindowBounds:", v3, v5, v7, v9);
  double v12 = v11;

  return v12;
}

- (void)toolPickerItemDidChange:(id)a3
{
  id v14 = a3;
  double v4 = [v14 _tool];
  unint64_t v5 = [(PKToolPicker *)self _indexOfTool:v4];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v6 = v5;
    double v7 = [(NSMutableArray *)self->_mutableTools objectAtIndexedSubscript:v5];
    if (([v4 isEqual:v7] & 1) == 0)
    {
      [(PKToolPicker *)self _dismissPopovers];
      mutableTools = self->_mutableTools;
      double v9 = [v14 _tool];
      [(NSMutableArray *)mutableTools replaceObjectAtIndex:v6 withObject:v9];

      BOOL v10 = [v14 identifier];
      double v11 = [(PKTool *)self->_selectedTool _toolPickerItemIdentifier];
      LODWORD(v9) = [v10 isEqualToString:v11];

      if (v9)
      {
        double v12 = [v14 _tool];
        selectedTool = self->_selectedTool;
        self->_selectedTool = v12;
      }
      [(PKToolPicker *)self _updateUI];
      [(PKToolPicker *)self _saveToolPickerState];
    }
  }
}

- (void)toolPickerItemReloadImage:(id)a3
{
  id v4 = a3;
  id v5 = [(PKToolPicker *)self _paletteView];
  [v5 _reloadImageForToolItem:v4];
}

- (BOOL)_showsHandwritingTool
{
  return self->__showsHandwritingTool;
}

- (NSString)stateAutosaveName
{
  return self->_stateAutosaveName;
}

- (void)set_wasVisibleBeforeResponderChanges:(BOOL)a3
{
  self->_wasVisibleBeforeResponderChanges = a3;
}

- (BOOL)_didCalculateVisibleBeforeResponderChanges
{
  return self->_didCalculateVisibleBeforeResponderChanges;
}

- (void)set_didCalculateVisibleBeforeResponderChanges:(BOOL)a3
{
  self->_didCalculateVisibleBeforeResponderChanges = a3;
}

- (unint64_t)selectionMask
{
  return self->_selectionMask;
}

- (BOOL)colorSwatchesVisible
{
  return self->_colorSwatchesVisible;
}

- (BOOL)prefersLargeContextualEditingUI
{
  return self->_prefersLargeContextualEditingUI;
}

- (BOOL)_isLassoToolEditingViewVisible
{
  return self->_lassoToolEditingViewVisible;
}

- (BOOL)isRulerActive
{
  return self->_rulerActive;
}

- (PKContentVersion)maximumSupportedContentVersion
{
  return self->_maximumSupportedContentVersion;
}

- (UIUserInterfaceStyle)overrideUserInterfaceStyle
{
  return self->_overrideUserInterfaceStyle;
}

- (UIUserInterfaceStyle)colorUserInterfaceStyle
{
  return self->_colorUserInterfaceStyle;
}

- (BOOL)showsDrawingPolicyControls
{
  return self->_showsDrawingPolicyControls;
}

- (NSMapTable)_firstRespondersForVisibleUI
{
  return self->__firstRespondersForVisibleUI;
}

- (void)set_firstRespondersForVisibleUI:(id)a3
{
}

- (PKPaletteViewInteraction)_interaction
{
  return self->__interaction;
}

- (BOOL)_isPencilInteractionEnabledWhenNotVisible
{
  return self->__pencilInteractionEnabledWhenNotVisible;
}

- (void)set_pencilInteractionEnabledWhenNotVisible:(BOOL)a3
{
  self->__pencilInteractionEnabledWhenNotVisible = a3;
}

- (BOOL)_toolPickerVisible
{
  return self->__toolPickerVisible;
}

- (void)set_toolPickerVisible:(BOOL)a3
{
  self->__toolPickerVisible = a3;
}

- (NSHashTable)_observers
{
  return self->__observers;
}

- (void)set_observers:(id)a3
{
}

- (BOOL)_isInputViewVisible
{
  return self->__inputViewVisible;
}

- (void)_setInputViewVisible:(BOOL)a3
{
  self->__inputViewVisible = a3;
}

- (PKToolPickerPaletteViewDelegateProxy)_paletteViewDelegateProxy
{
  return self->__paletteViewDelegateProxy;
}

- (BOOL)_isEnabled
{
  return self->__enabled;
}

- (UIViewController)_presentationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__presentationController);

  return (UIViewController *)WeakRetained;
}

- (PKPaletteViewAnnotationDelegate)_annotationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__annotationDelegate);

  return (PKPaletteViewAnnotationDelegate *)WeakRetained;
}

- (PKToolPickerPrivateDelegate)_delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__delegate);

  return (PKToolPickerPrivateDelegate *)WeakRetained;
}

- (void)set_delegate:(id)a3
{
}

- (PKToolPickerPrivateDelegate)_temporarySelectionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__temporarySelectionDelegate);

  return (PKToolPickerPrivateDelegate *)WeakRetained;
}

- (BOOL)_isAnimatingToVisible
{
  return self->__animatingToVisible;
}

- (BOOL)_showsPlusButton
{
  return self->__showsPlusButton;
}

- (UIMenu)_plusButtonMenu
{
  return self->__plusButtonMenu;
}

- (UIViewController)_plusButtonViewController
{
  return self->__plusButtonViewController;
}

- (BOOL)_showsTextButton
{
  return self->__showsTextButton;
}

- (UIViewController)_textButtonViewController
{
  return self->__textButtonViewController;
}

- (BOOL)_showsShapeButton
{
  return self->__showsShapeButton;
}

- (UIViewController)_shapeButtonViewController
{
  return self->__shapeButtonViewController;
}

- (id)_signaturesViewControllerProvider
{
  return self->__signaturesViewControllerProvider;
}

- (void)_setSignaturesViewControllerProvider:(id)a3
{
}

- (BOOL)_shadowVisible
{
  return self->__shadowVisible;
}

- (BOOL)_backgroundVisible
{
  return self->__backgroundVisible;
}

- (BOOL)_wantsClearBackgroundColorInCompactSize
{
  return self->__wantsClearBackgroundColorInCompactSize;
}

- (BOOL)_wantsUndoRedoButtonsVisibleInCompactSize
{
  return self->__wantsUndoRedoButtonsVisibleInCompactSize;
}

- (BOOL)_canShowEllipsisButtonInCompactSize
{
  return self->__canShowEllipsisButtonInCompactSize;
}

- (BOOL)_wantsEllipsisButtonVisibleInCompactSize
{
  return self->__wantsEllipsisButtonVisibleInCompactSize;
}

- (BOOL)_wantsBottomLineDividerVisibleInCompactSize
{
  return self->__wantsBottomLineDividerVisibleInCompactSize;
}

- (BOOL)_ignoresSafeAreaInsetsInCompactSize
{
  return self->__ignoresSafeAreaInsetsInCompactSize;
}

- (NSDirectionalEdgeInsets)_edgeInsetsInCompactSize
{
  double top = self->__edgeInsetsInCompactSize.top;
  double leading = self->__edgeInsetsInCompactSize.leading;
  double bottom = self->__edgeInsetsInCompactSize.bottom;
  double trailing = self->__edgeInsetsInCompactSize.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (double)_interItemToolsSpacingInCompactSize
{
  return self->__interItemToolsSpacingInCompactSize;
}

- (double)_interItemUndoRedoButtonsSpacingInCompactSize
{
  return self->__interItemUndoRedoButtonsSpacingInCompactSize;
}

- (BOOL)_useEqualSpacingLayoutInCompactSize
{
  return self->__useEqualSpacingLayoutInCompactSize;
}

- (BOOL)_shouldHideHoverPreviewToggle
{
  return self->__shouldHideHoverPreviewToggle;
}

- (BOOL)_shouldTrackHoverLocationForPencilTapActions
{
  return self->__shouldTrackHoverLocationForPencilTapActions;
}

- (void)_setShouldTrackHoverLocationForPencilTapActions:(BOOL)a3
{
  self->__shouldTrackHoverLocationForPencilTapActions = a3;
}

- (BOOL)_isContextMenuPresented
{
  return self->__contextMenuPresented;
}

- (BOOL)_overlapsMainWindow
{
  return self->__overlapsMainWindow;
}

- (BOOL)_doneActionResignsFirstResponder
{
  return self->__doneActionResignsFirstResponder;
}

- (void)_setDoneActionResignsFirstResponder:(BOOL)a3
{
  self->__doneActionResignsFirstResponder = a3;
}

- (BOOL)_doneButtonVisible
{
  return self->__doneButtonVisible;
}

- (BOOL)_presentsDetached
{
  return self->__presentsDetached;
}

- (BOOL)_visibilityUpdatesEnabled
{
  return self->__visibilityUpdatesEnabled;
}

- (BOOL)_wantsExternalVisibility
{
  return self->__wantsExternalVisibility;
}

- (UIKeyboardSceneDelegateVisibilityObserver)keyboardSceneDelegateVisibilityObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_keyboardSceneDelegateVisibilityObserver);

  return (UIKeyboardSceneDelegateVisibilityObserver *)WeakRetained;
}

- (void)setKeyboardSceneDelegateVisibilityObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_keyboardSceneDelegateVisibilityObserver);
  objc_storeStrong(&self->__signaturesViewControllerProvider, 0);
  objc_storeStrong((id *)&self->__shapeButtonViewController, 0);
  objc_storeStrong((id *)&self->__textButtonViewController, 0);
  objc_storeStrong((id *)&self->__plusButtonViewController, 0);
  objc_storeStrong((id *)&self->__plusButtonMenu, 0);
  objc_destroyWeak((id *)&self->__temporarySelectionDelegate);
  objc_destroyWeak((id *)&self->__delegate);
  objc_destroyWeak((id *)&self->__annotationDelegate);
  objc_destroyWeak((id *)&self->__presentationController);
  objc_storeStrong((id *)&self->__paletteViewDelegateProxy, 0);
  objc_storeStrong((id *)&self->__observers, 0);
  objc_storeStrong((id *)&self->__interaction, 0);
  objc_storeStrong((id *)&self->__firstRespondersForVisibleUI, 0);
  objc_storeStrong((id *)&self->_stateAutosaveName, 0);
  objc_storeStrong((id *)&self->_selectedTool, 0);
  objc_storeStrong((id *)&self->_imageGenerationController, 0);
  objc_storeStrong((id *)&self->_originalToolPickerStateRepresentation, 0);
  objc_storeStrong((id *)&self->_accessoryBarButton, 0);
  objc_storeStrong((id *)&self->_toolItemManager, 0);
  objc_storeStrong((id *)&self->_lastSelectedTool, 0);
  objc_storeStrong((id *)&self->_toolPickerVisibility, 0);
  objc_storeStrong((id *)&self->_lassoToolEditingViewIdentifier, 0);

  objc_storeStrong((id *)&self->_mutableTools, 0);
}

+ (void)_setPrefersPencilOnlyDrawingForiWork:(BOOL)a3
{
  BOOL v3 = a3;
  if (PKIsiWork())
  {
    +[PKSettingsDaemon setPrefersPencilOnlyDrawing:v3];
  }
}

+ (BOOL)_prefersPencilHoverPreviewEnabled
{
  return [MEMORY[0x1E4FB1A80] prefersHoverToolPreview];
}

+ (void)_setPrefersHoverPreviewEnabled:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  if ((PKIsiWork() & 1) != 0
    || ([MEMORY[0x1E4F28B50] mainBundle],
        unint64_t v6 = objc_claimAutoreleasedReturnValue(),
        [v6 bundleIdentifier],
        double v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 isEqualToString:@"com.apple.freeform"],
        v7,
        v6,
        v8))
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __72__PKToolPicker_iWorkSPI___setPrefersHoverPreviewEnabled_withCompletion___block_invoke;
    v9[3] = &unk_1E64C6060;
    id v10 = v5;
    +[PKSettingsDaemon setPrefersPencilHoverPreviewEnabled:v4 withCompletion:v9];
  }
}

uint64_t __72__PKToolPicker_iWorkSPI___setPrefersHoverPreviewEnabled_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_updateNewInks
{
  if ([(PKToolPicker *)self maximumSupportedContentVersion] < PKContentVersion2)
  {
    [(PKToolPicker *)self _removeNewInks];
  }
  else
  {
    [(PKToolPicker *)self _addTool:@"com.apple.ink.monoline" atIndex:[(PKToolPicker *)self _indexOfMarkerTool]];
    unint64_t v3 = [(PKToolPicker *)self _indexOfPencilTool];
    BOOL v4 = [(PKToolPicker *)self _tools];
    id v7 = [v4 objectAtIndexedSubscript:v3];

    [(PKToolPicker *)self _removeTool:v7];
    id v5 = [(PKToolPicker *)self _tools];
    uint64_t v6 = [v5 count];

    [(PKToolPicker *)self _insertTool:v7 atIndex:v6];
    [(PKToolPicker *)self _addTool:@"com.apple.ink.crayon" atIndex:v6 + 1];
    [(PKToolPicker *)self _addTool:@"com.apple.ink.fountainpen" atIndex:v6 + 2];
    [(PKToolPicker *)self _addTool:@"com.apple.ink.watercolor" atIndex:v6 + 3];
  }
}

- (void)_addTool:(id)a3 atIndex:(int64_t)a4
{
  +[PKToolPickerInkingItem _defaultInkingItemForType:]((uint64_t)PKToolPickerInkingItem, a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v7 _tool];
  [(PKToolPicker *)self _insertTool:v6 atIndex:a4];
}

- (void)_removeNewInks
{
  if ([(PKToolPicker *)self maximumSupportedContentVersion] == PKContentVersion1)
  {
    unint64_t v3 = [(PKToolPicker *)self _tools];
    id v9 = [v3 indexesOfObjectsPassingTest:&__block_literal_global_32];

    [(PKToolPicker *)self _removeToolsAtIndexes:v9];
    unint64_t v4 = [(PKToolPicker *)self _indexOfPencilTool];
    unint64_t v5 = [(PKToolPicker *)self _indexOfMarkerTool];
    if (v4 > v5)
    {
      unint64_t v6 = v5;
      id v7 = [(PKToolPicker *)self _tools];
      int v8 = [v7 objectAtIndexedSubscript:v4];

      [(PKToolPicker *)self _removeTool:v8];
      [(PKToolPicker *)self _insertTool:v8 atIndex:v6 + 1];
    }
  }
}

uint64_t __39__PKToolPicker_NewInks___removeNewInks__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  unint64_t v3 = [v2 ink];
  if ([v3 _isMonolineInk])
  {
    uint64_t v4 = 1;
  }
  else
  {
    unint64_t v5 = [v2 ink];
    if ([v5 _isFountainPenInk])
    {
      uint64_t v4 = 1;
    }
    else
    {
      unint64_t v6 = [v2 ink];
      if ([v6 _isWatercolorInk])
      {
        uint64_t v4 = 1;
      }
      else
      {
        id v7 = [v2 ink];
        uint64_t v4 = [v7 _isCrayonInk];
      }
    }
  }
  return v4;
}

- (unint64_t)_indexOfPencilTool
{
  id v2 = [(PKToolPicker *)self _tools];
  unint64_t v3 = [v2 indexOfObjectPassingTest:&__block_literal_global_5];

  return v3;
}

uint64_t __43__PKToolPicker_NewInks___indexOfPencilTool__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 ink];
  uint64_t v3 = [v2 _isPencilInk];

  return v3;
}

- (unint64_t)_indexOfMarkerTool
{
  id v2 = [(PKToolPicker *)self _tools];
  unint64_t v3 = [v2 indexOfObjectPassingTest:&__block_literal_global_7];

  return v3;
}

uint64_t __43__PKToolPicker_NewInks___indexOfMarkerTool__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 ink];
  uint64_t v3 = [v2 _isMarkerInk];

  return v3;
}

- (void)_showImageWandTipWithController:(id)a3
{
  id v4 = a3;
  if ([(PKToolPicker *)self isVisible])
  {
    unint64_t v5 = [(PKToolPicker *)self _paletteView];
    [v5 showImageWandTipWithController:v4];

    if (([v4 tipStatusIsInvalid] & 1) == 0) {
      [v4 setDelegate:self];
    }
  }
  else
  {
    unint64_t v6 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1C44F8000, v6, OS_LOG_TYPE_DEFAULT, "Unable to present image wand tip if no tool picker is visible", v7, 2u);
    }
  }
}

- (void)imageWandTipControllerTipStatusDidUpdate:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = os_log_create("com.apple.pencilkit", "ToolPicker");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109632;
    v6[1] = [v4 tipStatusIsInvalid];
    __int16 v7 = 1024;
    int v8 = [v4 tipStatusIsPending];
    __int16 v9 = 1024;
    int v10 = [v4 tipStatusIsAvailable];
    _os_log_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_DEFAULT, "Image Wand Tip status did update, invalid: %{BOOL}d, pending: %{BOOL}d, available: %{BOOL}d", (uint8_t *)v6, 0x14u);
  }

  if ([v4 tipStatusIsInvalid]) {
    [v4 setDelegate:0];
  }
  else {
    [(PKToolPicker *)self _showImageWandTipWithController:v4];
  }
}

@end