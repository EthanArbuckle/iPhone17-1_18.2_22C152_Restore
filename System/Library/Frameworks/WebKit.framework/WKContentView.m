@interface WKContentView
- (BOOL)_allowAnimatedUpdateSelectionRectViews;
- (BOOL)_allowAnimationControls;
- (BOOL)_currentPositionInformationIsApproximatelyValidForRequest:(const InteractionInformationRequest *)a3 radiusForApproximation:(int)a4;
- (BOOL)_currentPositionInformationIsValidForRequest:(const InteractionInformationRequest *)a3;
- (BOOL)_deferKeyEventToInputMethodEditing:(id)a3;
- (BOOL)_disableAutomaticKeyboardUI;
- (BOOL)_dragInteraction:(id)a3 shouldDelayCompetingGestureRecognizer:(id)a4;
- (BOOL)_elementForTextInputContextIsFocused:(id)a3;
- (BOOL)_elementTypeRequiresAccessoryView:(unsigned __int8)a3;
- (BOOL)_formControlRefreshEnabled;
- (BOOL)_gestureRecognizerCanBePreventedByTouchEvents:(id)a3;
- (BOOL)_handleDOMPasteRequestWithResult:(unsigned __int8)a3;
- (BOOL)_handleDropByInsertingImagePlaceholders:(id)a3 session:(id)a4;
- (BOOL)_handleTapOverInteractiveControl:(CGPoint)a3;
- (BOOL)_hasContent;
- (BOOL)_hasCustomTintColor;
- (BOOL)_hasEnclosingScrollView:(id)a3 matchingCriteria:(void *)a4;
- (BOOL)_hasFocusedElement;
- (BOOL)_hasValidOutstandingPositionInformationRequest:(const InteractionInformationRequest *)a3;
- (BOOL)_interactionShouldBeginFromPreviewItemController:(id)a3 forPosition:(CGPoint)a4;
- (BOOL)_interpretKeyEvent:(id)a3 isCharEvent:(BOOL)a4;
- (BOOL)_isAnchoredToCurrentSelection:(id)a3;
- (BOOL)_isContextMenuGestureRecognizerForFailureRelationships:(id)a3;
- (BOOL)_isDragInitiationGestureRecognizer:(id)a3;
- (BOOL)_isInterruptingDecelerationForScrollViewOrAncestor:(id)a3;
- (BOOL)_isPanningScrollViewOrAncestor:(id)a3;
- (BOOL)_isTextInputContextFocused:(id)a3;
- (BOOL)_isTouchEndDeferringGesture:(id)a3;
- (BOOL)_isTouchStartDeferringGesture:(id)a3;
- (BOOL)_mayDisableDoubleTapGesturesDuringSingleTap;
- (BOOL)_pointIsInsideSelectionRect:(CGPoint)a3 outBoundingRect:(FloatRect *)a4;
- (BOOL)_requiresKeyboardResetOnReload;
- (BOOL)_requiresKeyboardWhenFirstResponder;
- (BOOL)_requiresLegacyTextInputTraits;
- (BOOL)_restoreFocusWithToken:(id)a3;
- (BOOL)_scrollToRect:(CGRect)a3 withOrigin:(CGPoint)a4 minimumScrollDistance:(double)a5;
- (BOOL)_selectionAtDocumentStart;
- (BOOL)_shouldAvoidResizingWhenInputViewBoundsChange;
- (BOOL)_shouldAvoidScrollingWhenFocusedContentIsVisible;
- (BOOL)_shouldAvoidSecurityHeuristicScoreUpdates;
- (BOOL)_shouldShowAutomaticKeyboardUIIgnoringInputMode;
- (BOOL)_shouldShowKeyboardForElement:(const void *)a3;
- (BOOL)_shouldShowKeyboardForElementIgnoringInputMode:(const void *)a3;
- (BOOL)_shouldSimulateKeyboardInputOnTextInsertion;
- (BOOL)_shouldSuppressSelectionCommands;
- (BOOL)_shouldToggleSelectionCommandsAfterTapAt:(CGPoint)a3;
- (BOOL)_shouldUseContextMenus;
- (BOOL)_shouldUseContextMenusForFormControls;
- (BOOL)_shouldUseLegacySelectPopoverDismissalBehavior;
- (BOOL)_shouldUseTextCursorDragAnimator;
- (BOOL)_touchEventsMustRequireGestureRecognizerToFail:(id)a3;
- (BOOL)_tryToHandlePressesEvent:(id)a3;
- (BOOL)_wk_printFormatterRequiresMainThread;
- (BOOL)_zoomToRect:(CGRect)a3 withOrigin:(CGPoint)a4 fitEntireRect:(BOOL)a5 minimumScale:(double)a6 maximumScale:(double)a7 minimumScrollDistance:(double)a8;
- (BOOL)actionSheetAssistant:(id)a3 shouldIncludeAppLinkActionsForElement:(id)a4;
- (BOOL)actionSheetAssistant:(id)a3 shouldIncludeLookUpImageActionForElement:(id)a4;
- (BOOL)actionSheetAssistant:(id)a3 shouldIncludeShowTextActionForElement:(id)a4;
- (BOOL)actionSheetAssistant:(id)a3 showCustomSheetForElement:(id)a4;
- (BOOL)actionSheetAssistantShouldIncludeCopySubjectAction:(id)a3;
- (BOOL)automaticallyPresentEditMenu;
- (BOOL)becomeFirstResponder;
- (BOOL)becomeFirstResponderForWebView;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canBecomeFirstResponderForWebView;
- (BOOL)canBecomeFocused;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)canPerformActionForWebView:(SEL)a3 withSender:(id)a4;
- (BOOL)canShowNonEmptySelectionView;
- (BOOL)deferringGestureRecognizer:(id)a3 shouldDeferOtherGestureRecognizer:(id)a4;
- (BOOL)deferringGestureRecognizer:(id)a3 willBeginTouchesWithEvent:(id)a4;
- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4;
- (BOOL)ensurePositionInformationIsUpToDate:(InteractionInformationRequest)a3;
- (BOOL)fileUploadPanelDestinationIsManaged:(id)a3;
- (BOOL)fileUploadPanelPhotoPickerPrefersOriginalImageFormat:(id)a3;
- (BOOL)gestureRecognizer:(id)a3 canBePreventedByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 canPreventGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 isInterruptingMomentumScrollingWithEvent:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldIgnoreTouchEvent:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceivePress:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerMayDoubleTapToZoomWebView:(id)a3;
- (BOOL)gestureRecognizerMayPanWebView:(id)a3;
- (BOOL)gestureRecognizerMayPinchToZoomWebView:(id)a3;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)hasContent;
- (BOOL)hasHiddenContentEditable;
- (BOOL)hasMarkedText;
- (BOOL)hasPendingImageAnalysisRequest;
- (BOOL)hasSelectablePositionAtPoint:(CGPoint)a3;
- (BOOL)hasSelectableTextForImageContextMenu;
- (BOOL)hasSelection;
- (BOOL)hasText;
- (BOOL)hasVisualSearchResultsForImageContextMenu;
- (BOOL)imageAnalysisInteraction:(id)a3 shouldBeginAtPoint:(CGPoint)a4 forAnalysisType:(unint64_t)a5;
- (BOOL)indirectScribbleInteraction:(id)a3 isElementFocused:(id)a4;
- (BOOL)isAnimatingDragCancel;
- (BOOL)isAnyTouchOverActiveArea:(id)a3;
- (BOOL)isEditable;
- (BOOL)isImageBacked;
- (BOOL)isKeyboardScrollingAnimationRunning;
- (BOOL)isPosition:(id)a3 atBoundary:(int64_t)a4 inDirection:(int64_t)a5;
- (BOOL)isPosition:(id)a3 withinTextUnit:(int64_t)a4 inDirection:(int64_t)a5;
- (BOOL)isPresentingEditMenu;
- (BOOL)isReplaceAllowed;
- (BOOL)isResigningFirstResponder;
- (BOOL)isScrollableForKeyboardScrollViewAnimator:(id)a3;
- (BOOL)isShowingDataListSuggestions;
- (BOOL)isShowingInspectorIndication;
- (BOOL)isTextRecognitionInFullscreenVideoEnabled;
- (BOOL)pointIsNearMarkedText:(CGPoint)a3;
- (BOOL)positionInformationHasImageOverlayDataDetector;
- (BOOL)preventsPanningInXAxis;
- (BOOL)preventsPanningInYAxis;
- (BOOL)requiresAccessoryView;
- (BOOL)requiresKeyEvents;
- (BOOL)resignFirstResponder;
- (BOOL)resignFirstResponderForWebView;
- (BOOL)screenIsBeingCaptured;
- (BOOL)selectFormAccessoryHasCheckedItemAtRow:(int64_t)a3;
- (BOOL)selectionAtDocumentStart;
- (BOOL)setIsEditable:(BOOL)a3;
- (BOOL)shouldAllowHidingSelectionCommands;
- (BOOL)shouldAllowHighlightLinkCreation;
- (BOOL)shouldDeferGestureDueToImageAnalysis:(id)a3;
- (BOOL)shouldHideSelectionWhenScrolling;
- (BOOL)shouldIgnoreKeyboardWillHideNotification;
- (BOOL)shouldShowAutomaticKeyboardUI;
- (BOOL)shouldSuppressEditMenu;
- (BOOL)shouldSuppressUpdateCandidateView;
- (BOOL)shouldSynthesizeKeyEvents;
- (BOOL)shouldUseAsyncInteractions;
- (BOOL)shouldUseMouseGestureRecognizer;
- (BOOL)sizeChangedSinceLastVisibleContentRectUpdate;
- (BOOL)supportsAdaptiveImageGlyph;
- (BOOL)supportsTextReplacement;
- (BOOL)supportsTextReplacementForWebView;
- (BOOL)supportsTextSelectionWithCharacterGranularity;
- (BOOL)textInteractionGesture:(int64_t)a3 shouldBeginAtPoint:(CGPoint)a4;
- (BOOL)validateImageAnalysisRequestIdentifier:()ObjectIdentifierGeneric<WebKit:()WTF:(unsigned long)long :(WTF::SupportsObjectIdentifierNullState::Yes>)a3 ObjectIdentifierMainThreadAccessTraits<uint64_t> :ImageAnalysisRequestIdentifierType;
- (CGImage)copySubjectResultForImageContextMenu;
- (CGPoint)lastInteractionLocation;
- (CGRect)_computeUnobscuredContentRectRespectingInputViewBounds:(CGRect)a3 inputViewBounds:(CGRect)a4;
- (CGRect)_presentationRectForPreviewItemController:(id)a3;
- (CGRect)_selectionClipRect;
- (CGRect)caretRectForPosition:(id)a3;
- (CGRect)contentsRectForImageAnalysisInteraction:(id)a3;
- (CGRect)firstRectForRange:(id)a3;
- (CGRect)indirectScribbleInteraction:(id)a3 frameForElement:(id)a4;
- (CGRect)previewController:(id)a3 frameForPreviewItem:(id)a4 inSourceView:(id *)a5;
- (CGRect)rectContainingCaretSelection;
- (CGRect)rectForNSRange:(_NSRange)a3;
- (CGRect)selectionClipRect;
- (CGRect)tapHighlightViewRect;
- (CGRect)textFirstRect;
- (CGRect)textLastRect;
- (CGRect)unobscuredContentRect;
- (CGRect)unoccludedWindowBoundsForActionSheetAssistant:(id)a3;
- (CGSize)sizeForLegacyFormControlPickerViews;
- (Class)_dragInteractionClass;
- (Color)_tapHighlightColorForFastClick:(BOOL)a3;
- (DragData)dragDataForDropSession:(SEL)a3 dragDestinationAction:(id)a4;
- (FloatRect)_scaledCaretRectForSelectionEnd:(FloatRect)a3;
- (FloatRect)_scaledCaretRectForSelectionStart:(FloatRect)a3;
- (FloatRect)rectToRevealWhenZoomingToFocusedElement;
- (NSArray)dataListTextSuggestions;
- (NSArray)deferringGestures;
- (NSDictionary)markedTextStyle;
- (NSString)formInputLabel;
- (NSString)selectFormPopoverTitle;
- (NSString)textContentTypeForTesting;
- (NSUndoManager)undoManagerForWebView;
- (ObjectIdentifierGeneric<WebKit::TapIdentifierType,)nextTapIdentifier;
- (OpaqueWKPage)_pageRef;
- (OptionSet<WebCore::DragSourceAction>)_allowedDragSourceActions;
- (RetainPtr<NSArray>)actionSheetAssistant:(id)a3 decideActionsForElement:(id)a4 defaultActions:(RetainPtr<NSArray>)a5;
- (RetainPtr<VKCImageAnalyzerRequest>)createImageAnalyzerRequest:(unint64_t)a3 image:(CGImage *)a4;
- (RetainPtr<VKCImageAnalyzerRequest>)createImageAnalyzerRequest:(unint64_t)a3 image:(CGImage *)a4 imageURL:(id)a5;
- (RetainPtr<WKTargetedPreviewContainer>)_createPreviewContainerWithLayerName:(id)a3;
- (RetainPtr<_WKPrintFormattingAttributes>)_attributesForPrintFormatter:(id)a3;
- (SEL)_actionForLongPress;
- (SEL)_actionForLongPressFromPositionInformation:(const void *)a3;
- (UIContextMenuInteraction)contextMenuInteraction;
- (UIGestureRecognizer)imageAnalysisGestureRecognizer;
- (UITapGestureRecognizer)singleTapGestureRecognizer;
- (UITextInputAssistantItem)inputAssistantItemForWebView;
- (UITextInputDelegate)inputDelegate;
- (UITextInputTokenizer)tokenizer;
- (UITextInputTraits)textInputTraitsForWebView;
- (UITextPosition)beginningOfDocument;
- (UITextPosition)endOfDocument;
- (UITextRange)markedTextRange;
- (UITextRange)selectedTextRange;
- (UIView)inputAccessoryViewForWebView;
- (UIView)inputViewForWebView;
- (UIView)unscaledView;
- (UIWKTextInteractionAssistant)textInteractionAssistant;
- (WKBrowsingContextController)browsingContextController;
- (WKContentView)initWithFrame:(CGRect)a3 processPool:(NakedRef<WebKit:(void *)a5 :(id)a6 WebProcessPool>)a4 configuration:webView:;
- (WKDateTimeInputControl)dateTimeInputControl;
- (WKFormAccessoryView)formAccessoryView;
- (WKFormControl)dataListTextSuggestionsInputView;
- (WKFormSelectControl)selectControl;
- (WKTouchEventsGestureRecognizer)touchEventGestureRecognizer;
- (_NSRange)_markedTextNSRange;
- (_NSRange)selectionRange;
- (const)autocorrectionData;
- (const)focusedElementInformation;
- (const)positionInformation;
- (double)_contentZoomScale;
- (double)_initialScaleFactor;
- (double)_targetContentZoomScaleForRect:(const FloatRect *)a3 currentScale:(double)a4 fitEntireRect:(BOOL)a5 minimumScale:(double)a6 maximumScale:(double)a7;
- (double)dragLiftDelay;
- (double)inverseScale;
- (double)keyboardScrollViewAnimator:(id)a3 distanceForIncrement:(unsigned __int8)a4 inDirection:(unsigned __int8)a5;
- (double)timePickerValueHour;
- (double)timePickerValueMinute;
- (id).cxx_construct;
- (id)_autofillContext;
- (id)_cascadeInteractionTintColor;
- (id)_commonInitializationWithProcessPool:(void *)a3 configuration:(void *)a4;
- (id)_contentsOfUserInterfaceItem:(id)a3;
- (id)_contextMenuInteraction:(id)a3 overrideSuggestedActionsForConfiguration:(id)a4;
- (id)_createTargetedContextMenuHintPreviewForFocusedElement:(unsigned __int8)a3;
- (id)_createTargetedContextMenuHintPreviewIfPossible;
- (id)_createTargetedPreviewFromTextIndicator:(TextIndicatorData *)a3 previewContainer:(id)a4;
- (id)_createVisibilityPropagationView;
- (id)_dataDetectionResults;
- (id)_dataForPreviewItemController:(id)a3 atPosition:(CGPoint)a4 type:(int64_t *)a5;
- (id)_formInputSession;
- (id)_itemsForBeginningOrAddingToSessionWithRegistrationLists:(id)a3 stagedDragSource:(const void *)a4;
- (id)_moveDown:(BOOL)a3 withHistory:(id)a4;
- (id)_moveLeft:(BOOL)a3 withHistory:(id)a4;
- (id)_moveRight:(BOOL)a3 withHistory:(id)a4;
- (id)_moveToEndOfDocument:(BOOL)a3 withHistory:(id)a4;
- (id)_moveToEndOfLine:(BOOL)a3 withHistory:(id)a4;
- (id)_moveToEndOfParagraph:(BOOL)a3 withHistory:(id)a4;
- (id)_moveToEndOfWord:(BOOL)a3 withHistory:(id)a4;
- (id)_moveToStartOfDocument:(BOOL)a3 withHistory:(id)a4;
- (id)_moveToStartOfLine:(BOOL)a3 withHistory:(id)a4;
- (id)_moveToStartOfParagraph:(BOOL)a3 withHistory:(id)a4;
- (id)_moveToStartOfWord:(BOOL)a3 withHistory:(id)a4;
- (id)_moveUp:(BOOL)a3 withHistory:(id)a4;
- (id)_presentationRectsForPreviewItemController:(id)a3;
- (id)_presentationSnapshotForPreviewItemController:(id)a3;
- (id)_presentedViewControllerForPreviewItemController:(id)a3;
- (id)_scroller;
- (id)_textInputContextByScribbleIdentifier:(id)a3;
- (id)_touchEndDeferringGestures;
- (id)_touchStartDeferringGestures;
- (id)additionalMediaControlsContextMenuItemsForActionSheetAssistant:(id)a3;
- (id)alternativesForSelectedText;
- (id)appHighlightMenu;
- (id)asyncInputDelegate;
- (id)automaticallySelectedOverlay;
- (id)characterRangeAtPoint:(CGPoint)a3;
- (id)characterRangeByExtendingPosition:(id)a3 inDirection:(int64_t)a4;
- (id)closestPositionToPoint:(CGPoint)a3;
- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4;
- (id)containerForContextMenuHintPreviews;
- (id)containerForDragPreviews;
- (id)containerForDropPreviews;
- (id)contentTypeFromFieldName:(unsigned __int8)a3;
- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 dismissalPreviewForItemWithIdentifier:(id)a5;
- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)currentDragOrDropSession;
- (id)dataDetectionContextForActionSheetAssistant:(id)a3 positionInformation:(const void *)a4;
- (id)dataDetectionContextForPositionInformation:(const void *)a3;
- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4;
- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5;
- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5;
- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5;
- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4;
- (id)extendedTraitsDelegate;
- (id)filePickerAcceptedTypeIdentifiers;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)imageAnalyzer;
- (id)inputAccessoryView;
- (id)inputAssistantItem;
- (id)inputLabelText;
- (id)inputView;
- (id)insertionPointColor;
- (id)interactionAssistant;
- (id)machineReadableCodeSubMenuForImageContextMenu;
- (id)markedText;
- (id)menuWithInlineAction:(id)a3 image:(id)a4 identifier:(id)a5 handler:(void *)a6;
- (id)placeholderForDynamicallyInsertedImageAnalysisActions;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (id)pointerRegionForPositionInformation:(const void *)a3 point:(CGPoint)a4;
- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5;
- (id)positionFromPosition:(id)a3 offset:(int64_t)a4;
- (id)positionFromPosition:(id)a3 toBoundary:(int64_t)a4 inDirection:(int64_t)a5;
- (id)positionWithinRange:(id)a3 farthestInDirection:(int64_t)a4;
- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4;
- (id)previewController:(id)a3 transitionImageForPreviewItem:(id)a4 contentRect:(CGRect *)a5;
- (id)provideDataForItem:(id)a3;
- (id)rangeEnclosingPosition:(id)a3 withGranularity:(int64_t)a4 inDirection:(int64_t)a5;
- (id)removeBackgroundMenu;
- (id)rootContentView;
- (id)scrollToTextFragmentGenerationMenu;
- (id)selectedDOMRange;
- (id)selectedText;
- (id)selectionBarColor;
- (id)selectionHighlightColor;
- (id)selectionRectsForRange:(id)a3;
- (id)supportedPasteboardTypesForCurrentSelection;
- (id)targetForAction:(SEL)a3 withSender:(id)a4;
- (id)targetForActionForWebView:(SEL)a3 withSender:(id)a4;
- (id)textEffectsWindow;
- (id)textInRange:(id)a3;
- (id)textInputTraits;
- (id)textInteractionLoupeGestureRecognizer;
- (id)textInteractionTapGestureRecognizer;
- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4;
- (id)textStylingAtPosition:(id)a3 inDirection:(int64_t)a4;
- (id)touchActionActiveTouches;
- (id)webSelectionRects;
- (id)webSelectionRectsForSelectionGeometries:(const void *)a3;
- (id)webView;
- (id)webViewUIDelegate;
- (id)wordContainingCaretSelection;
- (id)wordRangeContainingCaretSelection;
- (int64_t)_dragInteraction:(id)a3 dataOwnerForSession:(id)a4;
- (int64_t)_dropInteraction:(id)a3 dataOwnerForSession:(id)a4;
- (int64_t)baseWritingDirectionForPosition:(id)a3 inDirection:(int64_t)a4;
- (int64_t)compareFoundRange:(id)a3 toRange:(id)a4 inDocument:(id)a5;
- (int64_t)comparePosition:(id)a3 toPosition:(id)a4;
- (int64_t)interfaceOrientation;
- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3;
- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4;
- (int64_t)selectionGranularity;
- (int64_t)writingToolsBehavior;
- (optional<WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::FrameIdentifierType,)_frameIdentifierForPrintFormatter:(unsigned long)long;
- (optional<WebKit::InteractionInformationAtPosition>)positionInformationForActionSheetAssistant:(optional<WebKit::InteractionInformationAtPosition> *__return_ptr)retstr;
- (optional<unsigned)activeTouchIdentifierForGestureRecognizer:(id)a3;
- (uint64_t)_removeTemporaryFilesIfNecessary;
- (uint64_t)didUpdateVisibleRect:(CGFloat)a3 unobscuredRect:(CGFloat)a4 contentInsets:(CGFloat)a5 unobscuredRectInScrollViewCoordinates:(CGFloat)a6 obscuredInsets:(CGFloat)a7 unobscuredSafeAreaInsets:(CGFloat)a8 inputViewBounds:(CGFloat)a9 scale:(uint64_t)a10 minimumScale:(char)a11 viewStability:(char)a12 enclosedInScrollableAncestorView:(int)a13 sendEvenIfUnchanged:(uint64_t)a14;
- (unint64_t)_dragDestinationActionForDropSession:(id)a3;
- (unint64_t)_wk_pageCountForPrintFormatter:(id)a3;
- (unint64_t)allowedWritingToolsResultOptions;
- (unint64_t)writingToolsAllowedInputOptions;
- (unique_ptr<WebKit::DrawingAreaProxy,)_createDrawingAreaProxy:(void *)a3;
- (unsigned)_characterInRelationToCaretSelection:(int)a3;
- (unsigned)_dataOwnerForPasteboard:(BOOL)a3;
- (unsigned)characterBeforeCaretSelection;
- (void)_accessibilityClearSelection;
- (void)_accessibilityRegisterUIProcessTokens;
- (void)_accessibilityRetrieveRectsAtSelectionOffset:(int64_t)a3 withText:(id)a4;
- (void)_accessibilityRetrieveRectsAtSelectionOffset:(int64_t)a3 withText:(id)a4 completionHandler:(id)a5;
- (void)_accessibilityRetrieveRectsEnclosingSelectionOffset:(int64_t)a3 withGranularity:(int64_t)a4;
- (void)_accessibilityStoreSelection;
- (void)_actionSheetAssistant:(id)a3 performAction:(unsigned __int8)a4 onElements:(void *)a5;
- (void)_addDefaultGestureRecognizers;
- (void)_addShortcut:(id)a3;
- (void)_addShortcutForWebView:(id)a3;
- (void)_alignCenter:(id)a3;
- (void)_alignCenterForWebView:(id)a3;
- (void)_alignJustified:(id)a3;
- (void)_alignJustifiedForWebView:(id)a3;
- (void)_alignLeft:(id)a3;
- (void)_alignLeftForWebView:(id)a3;
- (void)_alignRight:(id)a3;
- (void)_alignRightForWebView:(id)a3;
- (void)_applicationDidBecomeActive:(id)a3;
- (void)_applicationDidEnterBackground:(id)a3;
- (void)_applicationWillEnterForeground:(id)a3;
- (void)_applicationWillResignActive:(id)a3;
- (void)_attemptSyntheticClickAtLocation:(CGPoint)a3 modifierFlags:(int64_t)a4;
- (void)_becomeFirstResponderWithSelectionMovingForward:(BOOL)a3 completionHandler:(id)a4;
- (void)_cancelImageAnalysis;
- (void)_cancelInteraction;
- (void)_cancelLongPressGestureRecognizer;
- (void)_cancelPendingAutocorrectionContextHandler;
- (void)_cancelPendingKeyEventHandlers:(BOOL)a3;
- (void)_cancelPreviousResetInputViewDeferralRequest;
- (void)_cancelTouchEventGestureRecognizer;
- (void)_changeListType:(id)a3;
- (void)_changeListTypeForWebView:(id)a3;
- (void)_closeCurrentTypingCommand;
- (void)_commitPotentialTapFailed;
- (void)_completeImageAnalysisRequestForContextMenu:(CGImage *)a3 requestIdentifier:()ObjectIdentifierGeneric<WebKit:()WTF:(unsigned long)long :(WTF:(BOOL)a5 :SupportsObjectIdentifierNullState::Yes>)a4 ObjectIdentifierMainThreadAccessTraits<uint64_t> :ImageAnalysisRequestIdentifierType hasTextResults:;
- (void)_configureMouseGestureRecognizer;
- (void)_createAndConfigureDoubleTapGestureRecognizer;
- (void)_createAndConfigureHighlightLongPressGestureRecognizer;
- (void)_createAndConfigureLongPressGestureRecognizer;
- (void)_createImage:(id)a3 printFormatter:(id)a4;
- (void)_createPDF:(id)a3 printFormatter:(id)a4;
- (void)_decreaseListLevel:(id)a3;
- (void)_decreaseListLevelForWebView:(id)a3;
- (void)_define:(id)a3;
- (void)_defineForWebView:(id)a3;
- (void)_deleteByWord;
- (void)_deleteForwardAndNotify:(BOOL)a3;
- (void)_deleteForwardByWord;
- (void)_deleteToEndOfLine;
- (void)_deleteToEndOfParagraph;
- (void)_deleteToStartOfLine;
- (void)_deliverDelayedDropPreviewIfPossible:(optional<WebCore::TextIndicatorData> *)a3;
- (void)_didChangeDragCaretRect:(CGRect)a3 currentRect:(CGRect)a4;
- (void)_didChangeDragInteractionPolicy;
- (void)_didChangeWebViewEditability;
- (void)_didCommitLayerTree:(const void *)a3;
- (void)_didCommitLoadForMainFrame;
- (void)_didCompleteSyntheticClick;
- (void)_didEndScrollingOrZooming;
- (void)_didExitStableState;
- (void)_didFinishTextInteractionInTextInputContext:(id)a3;
- (void)_didGetTapHighlightForRequest:()ObjectIdentifierGeneric<WebKit:()WTF:(unsigned long)long :(WTF:(const Color *)a4 :(const void *)a5 SupportsObjectIdentifierNullState:(const IntSize *)a6 :(const IntSize *)a7 No>)a3 ObjectIdentifierMainThreadAccessTraits<uint64_t> :(const IntSize *)a8 TapIdentifierType color:(const IntSize *)a9 quads:(BOOL)a10 topLeftRadius:topRightRadius:bottomLeftRadius:bottomRightRadius:nodeHasBuiltInClickHandling:;
- (void)_didHandleAdditionalDragItemsRequest:(BOOL)a3;
- (void)_didHandleDragStartRequest:(BOOL)a3;
- (void)_didHandleKeyEvent:(id)a3 eventWasHandled:(BOOL)a4;
- (void)_didHandleTapAsHover;
- (void)_didNotHandleTapAsClick:(const IntPoint *)a3;
- (void)_didPerformAction:(SEL)a3 sender:(id)a4;
- (void)_didPerformDragOperation:(BOOL)a3;
- (void)_didReceiveEditDragSnapshot:(optional<WebCore::TextIndicatorData> *)a3;
- (void)_didRelaunchProcess;
- (void)_didScroll;
- (void)_didStartProvisionalLoadForMainFrame;
- (void)_didUpdateEditorState;
- (void)_didUpdateInputMode:(unsigned __int8)a3;
- (void)_disableDoubleTapGesturesDuringTapIfNecessary:()ObjectIdentifierGeneric<WebKit:()WTF:(unsigned long)long :(WTF::SupportsObjectIdentifierNullState::No>)a3 ObjectIdentifierMainThreadAccessTraits<uint64_t> :TapIdentifierType;
- (void)_disableInspectorNodeSearch;
- (void)_dismissContactPickerWithContacts:(id)a3;
- (void)_doAfterPendingImageAnalysis:(id)a3;
- (void)_doAfterReceivingEditDragSnapshotForTesting:(id)a3;
- (void)_doneDeferringTouchEnd:(BOOL)a3;
- (void)_doneDeferringTouchMove:(BOOL)a3;
- (void)_doneDeferringTouchStart:(BOOL)a3;
- (void)_doubleTapDidFail:(id)a3;
- (void)_doubleTapRecognized:(id)a3;
- (void)_doubleTapRecognizedForDoubleClick:(id)a3;
- (void)_dragInteraction:(id)a3 itemsForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5 completion:(id)a6;
- (void)_dragInteraction:(id)a3 prepareForSession:(id)a4 completion:(id)a5;
- (void)_elementDidBlur;
- (void)_elementDidFocus:(const void *)a3 userIsInteracting:(BOOL)a4 blurPreviousNode:(BOOL)a5 activityStateChanges:(OptionSet<WebCore:(id)a7 :ActivityState>)a6 userObject:;
- (void)_enableInspectorNodeSearch;
- (void)_endEditing;
- (void)_endImageAnalysisGestureDeferral:(BOOL)a3;
- (void)_endPotentialTapAndEnableDoubleTapGesturesIfNecessary;
- (void)_executeEditCommand:(id)a3;
- (void)_executeEditCommand:(id)a3 notifyDelegate:(BOOL)a4;
- (void)_fadeTapHighlightViewIfNeeded;
- (void)_findSelected:(id)a3;
- (void)_findSelectedForWebView:(id)a3;
- (void)_finishInteraction;
- (void)_focusTextInputContext:(id)a3 placeCaretAt:(CGPoint)a4 completionHandler:(id)a5;
- (void)_handleAutocorrectionContext:(const void *)a3;
- (void)_handleSmartMagnificationInformationForPotentialTap:()ObjectIdentifierGeneric<WebKit:()WTF:(unsigned long)long :(WTF:(const FloatRect *)a4 :(BOOL)a5 SupportsObjectIdentifierNullState:(double)a6 :(double)a7 No>)a3 ObjectIdentifierMainThreadAccessTraits<uint64_t> :(BOOL)a8 TapIdentifierType renderRect:fitEntireRect:viewportMinimumScale:viewportMaximumScale:nodeIsRootLevel:;
- (void)_handleTouchActionsForTouchEvent:(const void *)a3;
- (void)_hardwareKeyboardAvailabilityChanged;
- (void)_hideInspectorHighlight;
- (void)_hideKeyboard;
- (void)_highlightLongPressRecognized:(id)a3;
- (void)_increaseListLevel:(id)a3;
- (void)_increaseListLevelForWebView:(id)a3;
- (void)_indent:(id)a3;
- (void)_indentForWebView:(id)a3;
- (void)_insertDropCaret:(CGRect)a3;
- (void)_insertDynamicImageAnalysisContextMenuItemsIfPossible;
- (void)_insertNestedOrderedList:(id)a3;
- (void)_insertNestedOrderedListForWebView:(id)a3;
- (void)_insertNestedUnorderedList:(id)a3;
- (void)_insertNestedUnorderedListForWebView:(id)a3;
- (void)_insertOrderedList:(id)a3;
- (void)_insertOrderedListForWebView:(id)a3;
- (void)_insertUnorderedList:(id)a3;
- (void)_insertUnorderedListForWebView:(id)a3;
- (void)_inspectorNodeSearchRecognized:(id)a3;
- (void)_installVisibilityPropagationViews;
- (void)_interactionStartedFromPreviewItemController:(id)a3;
- (void)_interactionStoppedFromPreviewItemController:(id)a3;
- (void)_internalAdjustSelectionWithOffset:(int64_t)a3 lengthDelta:(int64_t)a4 completionHandler:(id)a5;
- (void)_internalBeginSelectionChange;
- (void)_internalClearSelection;
- (void)_internalContextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4 completion:(id)a5;
- (void)_internalEndSelectionChange;
- (void)_internalHandleKeyWebEvent:(id)a3;
- (void)_internalHandleKeyWebEvent:(id)a3 withCompletionHandler:(id)a4;
- (void)_internalReplaceText:(id)a3 withText:(id)a4 isCandidate:(BOOL)a5 completion:(void *)a6;
- (void)_internalRequestAutocorrectionContextWithCompletionHandler:(void *)a3;
- (void)_internalRequestTextRectsForString:(id)a3 completion:(void *)a4;
- (void)_internalSelectTextForContextMenuWithLocationInView:(CGPoint)a3 completionHandler:(id)a4;
- (void)_invalidateCurrentPositionInformation;
- (void)_invokeAllActionsToPerformAfterPendingImageAnalysis:(BOOL)a3;
- (void)_invokeAndRemovePendingHandlersValidForCurrentPositionInformation;
- (void)_keyboardDidRequestDismissal:(id)a3;
- (void)_keyboardDidShow;
- (void)_keyboardDismissalGestureRecognized:(id)a3;
- (void)_keyboardWillShow;
- (void)_layerTreeCommitComplete;
- (void)_logMissingSystemInputDelegateIfNeeded:(const char *)a3;
- (void)_longPressRecognized:(id)a3;
- (void)_lookup:(id)a3;
- (void)_lookupForWebView:(id)a3;
- (void)_nextAccessoryTab:(id)a3;
- (void)_nextAccessoryTabForWebView:(id)a3;
- (void)_nonBlockingDoubleTapRecognized:(id)a3;
- (void)_outdent:(id)a3;
- (void)_outdentForWebView:(id)a3;
- (void)_pasteAndMatchStyle:(id)a3;
- (void)_pasteAndMatchStyleForWebView:(id)a3;
- (void)_pasteAsQuotation:(id)a3;
- (void)_pasteAsQuotationForWebView:(id)a3;
- (void)_positionInformationDidChange:(const void *)a3;
- (void)_prepareToDragPromisedAttachment:(const void *)a3;
- (void)_preserveFocusWithToken:(id)a3 destructively:(BOOL)a4;
- (void)_previewItemController:(id)a3 commitPreview:(id)a4;
- (void)_previewItemController:(id)a3 didDismissPreview:(id)a4 committing:(BOOL)a5;
- (void)_previewItemControllerDidCancelPreview:(id)a3;
- (void)_previousAccessoryTab:(id)a3;
- (void)_previousAccessoryTabForWebView:(id)a3;
- (void)_processDidExit;
- (void)_promptForReplace:(id)a3;
- (void)_promptForReplaceForWebView:(id)a3;
- (void)_provideSuggestionsToInputDelegate:(id)a3;
- (void)_provideUITextSuggestionsToInputDelegate:(id)a3;
- (void)_registerPreview;
- (void)_removeContainerForContextMenuHintPreviews;
- (void)_removeContainerForDragPreviews;
- (void)_removeContainerForDropPreviews;
- (void)_removeContextMenuHintContainerIfPossible;
- (void)_removeDefaultGestureRecognizers;
- (void)_removeDropCaret;
- (void)_removeTemporaryDirectoriesWhenDeallocated:(void *)a3;
- (void)_removeTemporaryFilesIfNecessary;
- (void)_removeVisibilityPropagationViewForGPUProcess;
- (void)_removeVisibilityPropagationViewForWebProcess;
- (void)_requestDOMPasteAccessForCategory:(unsigned __int8)a3 requiresInteraction:(BOOL)a4 elementRect:(const IntRect *)a5 originIdentifier:(const void *)a6 completionHandler:(void *)a7;
- (void)_requestTextInputContextsInRect:(CGRect)a3 completionHandler:(id)a4;
- (void)_resetIsDoubleTapPending;
- (void)_resetPanningPreventionFlags;
- (void)_resetPrintingState;
- (void)_restoreEditMenuIfNeeded;
- (void)_scheduleResetInputViewDeferralAfterBecomingFirstResponder;
- (void)_screenCapturedDidChange:(id)a3;
- (void)_scrollingNodeScrollingDidEnd:()ProcessQualified<WTF:()WTF:(unsigned long)long :(WTF::SupportsObjectIdentifierNullState::Yes>>)a3 ObjectIdentifierMainThreadAccessTraits<uint64_t> :ObjectIdentifierGeneric<WebCore::ScrollingNodeIDType;
- (void)_scrollingNodeScrollingWillBegin:()ProcessQualified<WTF:()WTF:(unsigned long)long :(WTF::SupportsObjectIdentifierNullState::Yes>>)a3 ObjectIdentifierMainThreadAccessTraits<uint64_t> :ObjectIdentifierGeneric<WebCore::ScrollingNodeIDType;
- (void)_selectDataListOption:(int64_t)a3;
- (void)_selectPositionAtPoint:(CGPoint)a3 stayingWithinFocusedElement:(BOOL)a4 completionHandler:(id)a5;
- (void)_selectionChanged;
- (void)_setAcceleratedCompositingRootView:(id)a3;
- (void)_setDataListSuggestionsControl:(id)a3;
- (void)_setDoubleTapGesturesEnabled:(BOOL)a3;
- (void)_setFontForWebView:(id)a3 sender:(id)a4;
- (void)_setFontSizeForWebView:(double)a3 sender:(id)a4;
- (void)_setMarkedText:(id)a3 underlines:(const void *)a4 highlights:(const void *)a5 selectedRange:(_NSRange)a6;
- (void)_setMouseEventPolicy:(unsigned __int8)a3;
- (void)_setTextColorForWebView:(id)a3 sender:(id)a4;
- (void)_setUpImageAnalysis;
- (void)_setupVisibilityPropagationForGPUProcess;
- (void)_setupVisibilityPropagationForWebProcess;
- (void)_share:(id)a3;
- (void)_shareForWebView:(id)a3;
- (void)_showAttachmentSheet;
- (void)_showContactPicker:(const void *)a3 completionHandler:(void *)a4;
- (void)_showDataDetectorsUI;
- (void)_showDataDetectorsUIForPositionInformation:(const void *)a3;
- (void)_showImageSheet;
- (void)_showInspectorHighlight:(const void *)a3;
- (void)_showKeyboard;
- (void)_showLinkSheet;
- (void)_showMediaControlsContextMenu:(FloatRect *)a3 items:(void *)a4 completionHandler:(void *)a5;
- (void)_showPlaybackTargetPicker:(BOOL)a3 fromRect:(const IntRect *)a4 routeSharingPolicy:(unsigned __int8)a5 routingContextUID:(id)a6;
- (void)_showRunOpenPanel:(OpenPanelParameters *)a3 frameInfo:(const void *)a4 resultListener:(WebOpenPanelResultListenerProxy *)a5;
- (void)_showShareSheet:(const void *)a3 inRect:(optional<WebCore:(void *)a5 :FloatRect> *)a4 completionHandler:;
- (void)_showTapHighlight;
- (void)_simulateElementAction:(int64_t)a3 atLocation:(CGPoint)a4;
- (void)_simulateLongPressActionAtLocation:(CGPoint)a3;
- (void)_simulateSelectionStart;
- (void)_singleTapDidReset:(id)a3;
- (void)_singleTapIdentified:(id)a3;
- (void)_singleTapRecognized:(id)a3;
- (void)_startDrag:(RetainPtr<CGImage *>)a3 item:(const void *)a4;
- (void)_startSuppressingSelectionAssistantForReason:(unsigned __int8)a3;
- (void)_stopSuppressingSelectionAssistantForReason:(unsigned __int8)a3;
- (void)_targetedPreviewContainerDidRemoveLastSubview:(id)a3;
- (void)_tearDownImageAnalysis;
- (void)_toggleStrikeThrough:(id)a3;
- (void)_toggleStrikeThroughForWebView:(id)a3;
- (void)_touchEvent:(const void *)a3 preventsNativeGestures:(BOOL)a4;
- (void)_touchEventsRecognized:(id)a3;
- (void)_translate:(id)a3;
- (void)_translateForWebView:(id)a3;
- (void)_transliterateChinese:(id)a3;
- (void)_transliterateChineseForWebView:(id)a3;
- (void)_transpose;
- (void)_twoFingerDoubleTapRecognized:(id)a3;
- (void)_twoFingerSingleTapGestureRecognized:(id)a3;
- (void)_unregisterPreview;
- (void)_updateAccessory;
- (void)_updateChangedSelection;
- (void)_updateChangedSelection:(BOOL)a3;
- (void)_updateFocusedElementInformation:(const void *)a3;
- (void)_updateForScreen:(id)a3;
- (void)_updateFrameOfContainerForContextMenuHintPreviewsIfNeeded;
- (void)_updateInitialWritingDirectionIfNecessary;
- (void)_updateInputContextAfterBlurringAndRefocusingElement;
- (void)_updateInternalStateAfterSelectionChange;
- (void)_updateInternalStateBeforeSelectionChange;
- (void)_updateLastPointerRegionIfNeeded:(id)a3;
- (void)_updateLongPressAndHighlightLongPressGestures;
- (void)_updateRuntimeProtocolConformanceIfNeeded;
- (void)_updateSelectionAssistantSuppressionState;
- (void)_updateTapHighlight;
- (void)_updateTargetedPreviewScrollViewUsingContainerScrollingNodeID:()optional<WebCore:()WTF:(unsigned long)long :(WTF::SupportsObjectIdentifierNullState::Yes>>> *)a3 ObjectIdentifierMainThreadAccessTraits<uint64_t> :ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::ScrollingNodeIDType;
- (void)_updateTextInputTraits:(id)a3;
- (void)_updateTextInputTraitsForInteractionTintColor;
- (void)_waitForDrawToImageCallbackForPrintFormatterIfNeeded:(id)a3;
- (void)_waitForDrawToPDFCallbackForPrintFormatterIfNeeded:(id)a3;
- (void)_webViewDestroyed;
- (void)_wheelChangedWithEvent:(id)a3;
- (void)_willBeginTextInteractionInTextInputContext:(id)a3;
- (void)_willHideMenu:(id)a3;
- (void)_willPerformAction:(SEL)a3 sender:(id)a4;
- (void)_willReceiveEditDragSnapshot;
- (void)_willStartScrollingOrZooming;
- (void)_windowDidMoveToScreenNotification:(id)a3;
- (void)_wk_requestDocumentForPrintFormatter:(id)a3;
- (void)_wk_requestImageForPrintFormatter:(id)a3;
- (void)_writePromisedAttachmentToPasteboard:(void *)a3;
- (void)_zoomOutWithOrigin:(CGPoint)a3;
- (void)_zoomToFocusRect:(CGRect)a3 selectionRect:(CGRect)a4 fontSize:(float)a5 minimumScale:(double)a6 maximumScale:(double)a7 allowScaling:(BOOL)a8 forceScroll:(BOOL)a9;
- (void)_zoomToInitialScaleWithOrigin:(CGPoint)a3;
- (void)_zoomToRevealFocusedElement;
- (void)accessibilityRetrieveSpeakSelectionContent;
- (void)accessoryDone;
- (void)accessoryOpen;
- (void)accessoryTab:(BOOL)a3;
- (void)accessoryView:(id)a3 tabInDirection:(BOOL)a4;
- (void)accessoryViewAutoFill:(id)a3;
- (void)accessoryViewDone:(id)a3;
- (void)actionSheetAssistant:(id)a3 copySubject:(id)a4 sourceMIMEType:(id)a5;
- (void)actionSheetAssistant:(id)a3 getAlternateURLForImage:(id)a4 completion:(id)a5;
- (void)actionSheetAssistant:(id)a3 lookUpImage:(id)a4 imageURL:(id)a5 title:(id)a6 imageBounds:(CGRect)a7;
- (void)actionSheetAssistant:(id)a3 openElementAtLocation:(CGPoint)a4;
- (void)actionSheetAssistant:(id)a3 performAction:(unsigned __int8)a4;
- (void)actionSheetAssistant:(id)a3 shareElementWithImage:(id)a4 rect:(CGRect)a5;
- (void)actionSheetAssistant:(id)a3 shareElementWithURL:(id)a4 rect:(CGRect)a5;
- (void)actionSheetAssistant:(id)a3 showTextForImage:(id)a4 imageURL:(id)a5 title:(id)a6 imageBounds:(CGRect)a7;
- (void)actionSheetAssistant:(id)a3 willStartInteractionWithElement:(id)a4;
- (void)actionSheetAssistantDidDismissContextMenu:(id)a3;
- (void)actionSheetAssistantDidShowContextMenu:(id)a3;
- (void)actionSheetAssistantDidStopInteraction:(id)a3;
- (void)addShortcut:(id)a3;
- (void)addShortcutForWebView:(id)a3;
- (void)addTextAlternatives:(id)a3;
- (void)addTextAnimationForAnimationID:(id)a3 withData:(const TextAnimationData *)a4;
- (void)adjustSelectionWithDelta:(_NSRange)a3 completionHandler:(id)a4;
- (void)applyAutocorrection:(id)a3 toString:(id)a4 isCandidate:(BOOL)a5 withCompletionHandler:(id)a6;
- (void)applyAutocorrection:(id)a3 toString:(id)a4 withCompletionHandler:(id)a5;
- (void)assignLegacyDataForContextMenuInteraction;
- (void)autoscrollToPoint:(CGPoint)a3;
- (void)beginSelectionChange;
- (void)beginSelectionInDirection:(int64_t)a3 completionHandler:(id)a4;
- (void)beginTextRecognitionForFullscreenVideo:(void *)a3 playerViewController:(id)a4;
- (void)beginTextRecognitionForVideoInElementFullscreen:(void *)a3 bounds:(FloatRect)a4;
- (void)buildMenuForWebViewWithBuilder:(id)a3;
- (void)callCompletionHandlerForAnimationID:(id)a3;
- (void)callCompletionHandlerForAnimationID:(id)a3 completionHandler:(id)a4;
- (void)cancelActiveTextInteractionGestures;
- (void)cancelAutoscroll;
- (void)cancelPointersForGestureRecognizer:(id)a3;
- (void)cancelTextRecognitionForFullscreenVideo:(id)a3;
- (void)cancelTextRecognitionForVideoInElementFullscreen;
- (void)captureTextFromCamera:(id)a3;
- (void)captureTextFromCameraForWebView:(id)a3;
- (void)changeSelectionWithGestureAt:(CGPoint)a3 withGesture:(int64_t)a4 withState:(int64_t)a5;
- (void)changeSelectionWithGestureAt:(CGPoint)a3 withGesture:(int64_t)a4 withState:(int64_t)a5 withFlags:(unint64_t)a6;
- (void)changeSelectionWithTouchAt:(CGPoint)a3 withSelectionTouch:(int64_t)a4 baseIsStart:(BOOL)a5 withFlags:(unint64_t)a6;
- (void)changeSelectionWithTouchesFrom:(CGPoint)a3 to:(CGPoint)a4 withGesture:(int64_t)a5 withState:(int64_t)a6;
- (void)cleanUpDragSourceSessionState;
- (void)cleanUpInteraction;
- (void)cleanUpScribbleInteraction;
- (void)clearAllDecoratedFoundText;
- (void)clearSelection;
- (void)clearTextIndicator:(unsigned __int8)a3;
- (void)compositionSession:(id)a3 didReceiveText:(id)a4 replacementRange:(_NSRange)a5 inContext:(id)a6 finished:(BOOL)a7;
- (void)computeClientAndGlobalPointsForDropSession:(id)a3 outClientPoint:(CGPoint *)a4 outGlobalPoint:(CGPoint *)a5;
- (void)contactPickerDidDismiss:(id)a3;
- (void)contactPickerDidPresent:(id)a3;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)continueContextMenuInteraction:(id)a3;
- (void)continueContextMenuInteractionWithDataDetectors:(id)a3;
- (void)copy:(id)a3;
- (void)copyForWebView:(id)a3;
- (void)cut:(id)a3;
- (void)cutForWebView:(id)a3;
- (void)dealloc;
- (void)decorateFoundTextRange:(id)a3 inDocument:(id)a4 usingStyle:(int64_t)a5;
- (void)decreaseSize:(id)a3;
- (void)decreaseSizeForWebView:(id)a3;
- (void)deferringGestureRecognizer:(id)a3 didEndTouchesWithEvent:(id)a4;
- (void)deferringGestureRecognizer:(id)a3 didTransitionToState:(int64_t)a4;
- (void)define:(id)a3;
- (void)deleteBackward;
- (void)deleteInDirection:(int64_t)a3 toGranularity:(int64_t)a4;
- (void)didBeginTextSearchOperation;
- (void)didBeginWritingToolsSession:(id)a3 contexts:(id)a4;
- (void)didDismissWritingTools;
- (void)didEndTextSearchOperation;
- (void)didEndWritingToolsSession:(id)a3 accepted:(BOOL)a4;
- (void)didInsertFinalDictationResult;
- (void)didInterruptScrolling;
- (void)didMoveToWindow;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)dismissFilePicker;
- (void)dismissFormAccessoryView;
- (void)dismissPickersIfNeededWithReason:(unsigned __int8)a3;
- (void)doAfterComputingImageAnalysisResultsForBackgroundRemoval:(void *)a3;
- (void)doAfterEditorStateUpdateAfterFocusingElement:(id)a3;
- (void)doAfterPositionInformationUpdate:(id)a3 forRequest:(InteractionInformationRequest)a4;
- (void)dragInteraction:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5;
- (void)dragInteraction:(id)a3 itemsForAddingToSession:(id)a4 forTouchAtPoint:(CGPoint)a5 completion:(id)a6;
- (void)dragInteraction:(id)a3 prepareDragSession:(id)a4 completion:(id)a5;
- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5;
- (void)dragInteraction:(id)a3 sessionDidTransferItems:(id)a4;
- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4;
- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5;
- (void)dropInteraction:(id)a3 concludeDrop:(id)a4;
- (void)dropInteraction:(id)a3 item:(id)a4 willAnimateDropWithAnimator:(id)a5;
- (void)dropInteraction:(id)a3 performDrop:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4;
- (void)endEditingAndUpdateFocusAppearanceWithReason:(int64_t)a3;
- (void)endSelectionChange;
- (void)extendInLayoutDirection:(int64_t)a3;
- (void)extendInStorageDirection:(int64_t)a3 byGranularity:(int64_t)a4;
- (void)fileUploadPanelDidDismiss:(id)a3;
- (void)find:(id)a3;
- (void)findAndReplace:(id)a3;
- (void)findNext:(id)a3;
- (void)findPrevious:(id)a3;
- (void)findSelected:(id)a3;
- (void)findSelectedForWebView:(id)a3;
- (void)focusedSelectElementOptions;
- (void)generateSyntheticEditingCommand:(unsigned __int8)a3;
- (void)gestureRecognizerConsistencyEnforcer;
- (void)handleKeyEntry:(id)a3 withCompletionHandler:(id)a4;
- (void)handleKeyWebEvent:(id)a3;
- (void)handleKeyWebEvent:(id)a3 withCompletionHandler:(id)a4;
- (void)imageAnalysisGestureDidBegin:(id)a3;
- (void)imageAnalysisGestureDidFail:(id)a3;
- (void)increaseSize:(id)a3;
- (void)increaseSizeForWebView:(id)a3;
- (void)indirectScribbleInteraction:(id)a3 didFinishWritingInElement:(id)a4;
- (void)indirectScribbleInteraction:(id)a3 focusElementIfNeeded:(id)a4 referencePoint:(CGPoint)a5 completion:(id)a6;
- (void)indirectScribbleInteraction:(id)a3 requestElementsInRect:(CGRect)a4 completion:(id)a5;
- (void)indirectScribbleInteraction:(id)a3 willBeginWritingInElement:(id)a4;
- (void)insertAdaptiveImageGlyph:(id)a3 replacementRange:(id)a4;
- (void)insertText:(id)a3;
- (void)insertText:(id)a3 alternatives:(id)a4 style:(int64_t)a5;
- (void)insertText:(id)a3 textAlternatives:(id)a4 style:(int64_t)a5;
- (void)insertTextAlternatives:(id)a3;
- (void)insertTextPlaceholderWithSize:(CGSize)a3 completionHandler:(id)a4;
- (void)insertTextSuggestion:(id)a3;
- (void)installImageAnalysisInteraction:(id)a3;
- (void)keyboardScrollViewAnimatorDidFinishScrolling:(id)a3;
- (void)keyboardScrollViewAnimatorWillScroll:(id)a3;
- (void)lookup:(id)a3;
- (void)lookupForWebView:(id)a3;
- (void)makeTextWritingDirectionLeftToRight:(id)a3;
- (void)makeTextWritingDirectionLeftToRightForWebView:(id)a3;
- (void)makeTextWritingDirectionNatural:(id)a3;
- (void)makeTextWritingDirectionNaturalForWebView:(id)a3;
- (void)makeTextWritingDirectionRightToLeft:(id)a3;
- (void)makeTextWritingDirectionRightToLeftForWebView:(id)a3;
- (void)modifierFlagsDidChangeFrom:(int64_t)a3 to:(int64_t)a4;
- (void)mouseInteraction:(id)a3 changedWithEvent:(const void *)a4;
- (void)moveByOffset:(int64_t)a3;
- (void)moveInLayoutDirection:(int64_t)a3;
- (void)moveInStorageDirection:(int64_t)a3 byGranularity:(int64_t)a4;
- (void)moveSelectionAtBoundary:(int64_t)a3 inDirection:(int64_t)a4 completionHandler:(id)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)page;
- (void)paste:(id)a3;
- (void)pasteAndMatchStyle:(id)a3;
- (void)pasteForWebView:(id)a3;
- (void)pasteWithCompletionHandler:(id)a3;
- (void)performTextSearchWithQueryString:(id)a3 usingOptions:(id)a4 resultAggregator:(id)a5;
- (void)prepareSelectionForContextMenuWithLocationInView:(CGPoint)a3 completionHandler:(id)a4;
- (void)presentVisualSearchPreviewControllerForImage:(id)a3 imageURL:(id)a4 title:(id)a5 imageBounds:(CGRect)a6 appearanceActions:(unint64_t)a7;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesChanged:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)previewControllerDidDismiss:(id)a3;
- (void)promptForReplace:(id)a3;
- (void)promptForReplaceForWebView:(id)a3;
- (void)proofreadingSession:(id)a3 didReceiveSuggestions:(id)a4 processedRange:(_NSRange)a5 inContext:(id)a6 finished:(BOOL)a7;
- (void)proofreadingSession:(id)a3 didUpdateState:(int64_t)a4 forSuggestionWithUUID:(id)a5 inContext:(id)a6;
- (void)removeEmojiAlternatives;
- (void)removeTextAnimationForAnimationID:(id)a3;
- (void)removeTextPlaceholder:(id)a3 willInsertText:(BOOL)a4 completionHandler:(id)a5;
- (void)replace:(id)a3;
- (void)replaceDictatedText:(id)a3 withText:(id)a4;
- (void)replaceForWebView:(id)a3;
- (void)replaceFoundTextInRange:(id)a3 inDocument:(id)a4 withText:(id)a5;
- (void)replaceRangeWithTextWithoutClosingTyping:(id)a3 replacementText:(id)a4;
- (void)replaceText:(id)a3 withText:(id)a4;
- (void)replaceText:(id)a3 withText:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6;
- (void)replacementEffectDidComplete;
- (void)requestAsynchronousPositionInformationUpdate:(InteractionInformationRequest)a3;
- (void)requestAutocorrectionContextWithCompletionHandler:(id)a3;
- (void)requestAutocorrectionRectsForString:(id)a3 withCompletionHandler:(id)a4;
- (void)requestDocumentContext:(id)a3 completionHandler:(id)a4;
- (void)requestPreferredArrowDirectionForEditMenuWithCompletionHandler:(id)a3;
- (void)requestRVItemInSelectedRangeWithCompletionHandler:(id)a3;
- (void)requestRectForFoundTextRange:(id)a3 completionHandler:(id)a4;
- (void)requestTextContextForAutocorrectionWithCompletionHandler:(id)a3;
- (void)requestTextRecognition:(id)a3 imageData:(void *)a4 sourceLanguageIdentifier:(id)a5 targetLanguageIdentifier:(id)a6 completionHandler:(void *)a7;
- (void)requestTextRectsForString:(id)a3 withCompletionHandler:(id)a4;
- (void)runModalJavaScriptDialog:(void *)a3;
- (void)scrollRangeToVisible:(id)a3 inDocument:(id)a4;
- (void)scrollSelectionToVisible:(BOOL)a3;
- (void)scrollViewWillStartPanOrPinchGesture;
- (void)select:(id)a3;
- (void)selectAll;
- (void)selectAll:(id)a3;
- (void)selectAllForWebView:(id)a3;
- (void)selectForWebView:(id)a3;
- (void)selectFormAccessoryPickerRow:(int64_t)a3;
- (void)selectPositionAtBoundary:(int64_t)a3 inDirection:(int64_t)a4 fromPoint:(CGPoint)a5 completionHandler:(id)a6;
- (void)selectPositionAtPoint:(CGPoint)a3 completionHandler:(id)a4;
- (void)selectPositionAtPoint:(CGPoint)a3 withContextRequest:(id)a4 completionHandler:(id)a5;
- (void)selectTextForContextMenuWithLocationInView:(CGPoint)a3 completionHandler:(id)a4;
- (void)selectTextWithGranularity:(int64_t)a3 atPoint:(CGPoint)a4 completionHandler:(id)a5;
- (void)selectWordBackwardForTesting;
- (void)selectWordForReplacement;
- (void)setAsyncInputDelegate:(id)a3;
- (void)setAttributedMarkedText:(id)a3 selectedRange:(_NSRange)a4;
- (void)setBaseWritingDirection:(int64_t)a3 forRange:(id)a4;
- (void)setBottomBufferHeight:(double)a3;
- (void)setContinuousSpellCheckingEnabled:(BOOL)a3;
- (void)setDataListTextSuggestions:(id)a3;
- (void)setDataListTextSuggestionsInputView:(id)a3;
- (void)setGrammarCheckingEnabled:(BOOL)a3;
- (void)setInputDelegate:(id)a3;
- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4;
- (void)setSelectedColorForColorPicker:(id)a3;
- (void)setSelectedTextRange:(id)a3;
- (void)setShowingInspectorIndication:(BOOL)a3;
- (void)setSizeChangedSinceLastVisibleContentRectUpdate:(BOOL)a3;
- (void)setTextIndicatorAnimationProgress:(float)a3;
- (void)setTimePickerValueToHour:(int64_t)a3 minute:(int64_t)a4;
- (void)setUpDragAndDropInteractions;
- (void)setUpInteraction;
- (void)setUpMouseGestureRecognizer;
- (void)setUpPointerInteraction;
- (void)setUpScribbleInteraction;
- (void)setUpTextIndicator:()Ref<WebCore:()WTF:(WTF::DefaultRefDerefTraits<WebCore::TextIndicator>>)a3 :RawPtrTraits<WebCore::TextIndicator> :TextIndicator;
- (void)setUpTextSelectionAssistant;
- (void)share:(id)a3;
- (void)shareForWebView:(id)a3;
- (void)shareSheet:(id)a3 willShowActivityItems:(id)a4;
- (void)shareSheetDidDismiss:(id)a3;
- (void)shiftKeyStateChangedFromState:(int64_t)a3 toState:(int64_t)a4;
- (void)startAutoscroll:(CGPoint)a3;
- (void)startDeferringInputViewUpdates:(OptionSet<WebKit::InputViewUpdateDeferralSource>)a3;
- (void)startFadeOut;
- (void)startRelinquishingFirstResponderToFocusedElement;
- (void)stopDeferringInputViewUpdates:(OptionSet<WebKit::InputViewUpdateDeferralSource>)a3;
- (void)stopDeferringInputViewUpdatesForAllSources;
- (void)stopRelinquishingFirstResponderToFocusedElement;
- (void)takeTraitsFrom:(id)a3;
- (void)targetedPreviewForID:(id)a3 completionHandler:(id)a4;
- (void)teardownDragAndDropInteractions;
- (void)teardownTextIndicatorLayer;
- (void)tintColorDidChange;
- (void)toggleBoldface:(id)a3;
- (void)toggleBoldfaceForWebView:(id)a3;
- (void)toggleItalics:(id)a3;
- (void)toggleItalicsForWebView:(id)a3;
- (void)toggleUnderline:(id)a3;
- (void)toggleUnderlineForWebView:(id)a3;
- (void)translate:(id)a3;
- (void)translateForWebView:(id)a3;
- (void)transliterateChinese:(id)a3;
- (void)transliterateChineseForWebView:(id)a3;
- (void)transposeCharactersAroundSelection;
- (void)uninstallImageAnalysisInteraction;
- (void)unmarkText;
- (void)unsuppressSoftwareKeyboardUsingLastAutocorrectionContextIfNeeded;
- (void)updateCurrentFocusedElementInformation:(void *)a3;
- (void)updateFixedClippingView:(FloatRect)a3;
- (void)updateFocusedElementFocusedWithDataListDropdown:(BOOL)a3;
- (void)updateFocusedElementSelectedIndex:(unsigned int)a3 allowsMultipleSelection:(BOOL)a4;
- (void)updateFocusedElementValue:(id)a3;
- (void)updateFocusedElementValueAsColor:(id)a3;
- (void)updateImageAnalysisForContextMenuPresentation:(id)a3 elementBounds:(CGRect)a4;
- (void)updatePositionInformationForActionSheetAssistant:(id)a3;
- (void)updateSelectionWithExtentPoint:(CGPoint)a3 completionHandler:(id)a4;
- (void)updateSelectionWithExtentPoint:(CGPoint)a3 withBoundary:(int64_t)a4 completionHandler:(id)a5;
- (void)updateSoftwareKeyboardSuppressionStateFromWebView;
- (void)updateTextSuggestionsForInputDelegate;
- (void)updateUnderlyingTextVisibilityForTextAnimationID:(id)a3 visible:(BOOL)a4 completionHandler:(id)a5;
- (void)useSelectionForFind:(id)a3;
- (void)useSelectionForFindForWebView:(id)a3;
- (void)willBeginWritingToolsSession:(id)a3 requestContexts:(id)a4;
- (void)willDismissEditMenuWithAnimator:(id)a3;
- (void)willFinishIgnoringCalloutBarFadeAfterPerformingAction;
- (void)willInsertFinalDictationResult;
- (void)willMoveToWindow:(id)a3;
- (void)willPresentEditMenuWithAnimator:(id)a3;
- (void)willPresentWritingTools;
- (void)writingToolsSession:(id)a3 didReceiveAction:(int64_t)a4;
@end

@implementation WKContentView

- (void)willMoveToWindow:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WKContentView;
  -[WKApplicationStateTrackingView willMoveToWindow:](&v8, sel_willMoveToWindow_);
  v5 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v6 = [(WKContentView *)self window];
  if (v6)
  {
    uint64_t v7 = *MEMORY[0x1E4F43F00];
    [v5 removeObserver:self name:*MEMORY[0x1E4F43F00] object:v6];
    if (!a3)
    {
      [(WKContentView *)self dismissPickersIfNeededWithReason:1];
      return;
    }
  }
  else
  {
    if (!a3) {
      return;
    }
    uint64_t v7 = *MEMORY[0x1E4F43F00];
  }
  [v5 addObserver:self selector:sel__windowDidMoveToScreenNotification_ name:v7 object:a3];
  -[WKContentView _updateForScreen:](self, "_updateForScreen:", [a3 screen]);
}

- (void)_updateForScreen:(id)a3
{
  m_ptr = self->_page.m_ptr;
  WebCore::screenScaleFactor((WebCore *)a3, (UIScreen *)a2);
  if (*((float *)m_ptr + 190) != v5)
  {
    *((float *)m_ptr + 190) = v5;
    uint64_t v6 = *((void *)m_ptr + 29);
    if (v6) {
      (*(void (**)(uint64_t))(*(void *)v6 + 56))(v6);
    }
  }

  [(WKContentView *)self _accessibilityRegisterUIProcessTokens];
}

- (void)_cancelInteraction
{
  BYTE2(self->_dataListTextSuggestionsInputView.m_ptr) = 0;
  [self->_tapHighlightView.m_ptr removeFromSuperview];
}

- (BOOL)isEditable
{
  return (BOOL)self->_dataListTextSuggestionsInputView.m_ptr;
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)WKContentView;
  [(WKApplicationStateTrackingView *)&v3 didMoveToWindow];
  if (self->_needsDeferredEndScrollingSelectionUpdate) {
    self->_needsDeferredEndScrollingSelectionUpdate = 0;
  }
  if ([(WKContentView *)self window])
  {
    [(WKContentView *)self setUpInteraction];
    WebKit::WebPageProxy::setScreenIsBeingCaptured((uint64_t)self->_page.m_ptr, [(WKContentView *)self screenIsBeingCaptured]);
  }
  else
  {
    [(WKContentView *)self cleanUpInteractionPreviewContainers];
  }
}

- (UIView)unscaledView
{
  return (UIView *)self->_interactionViewsContainerView.m_ptr;
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)WKContentView;
  [(WKContentView *)&v3 tintColorDidChange];
  if (self->_needsDeferredEndScrollingSelectionUpdate) {
    self->_needsDeferredEndScrollingSelectionUpdate = 0;
  }
  if ([(WKContentView *)self isFirstResponder]
    && [(WKContentView *)self canShowNonEmptySelectionView])
  {
    [self->_textInteractionWrapper.m_ptr deactivateSelection];
    [(WKContentView *)self _updateTextInputTraitsForInteractionTintColor];
    [self->_textInteractionWrapper.m_ptr activateSelection];
  }
  else
  {
    [(WKContentView *)self _updateTextInputTraitsForInteractionTintColor];
  }
  WebKit::WebPageProxy::insertionPointColorDidChange((WebKit::WebPageProxy *)self->_page.m_ptr);
}

- (BOOL)sizeChangedSinceLastVisibleContentRectUpdate
{
  return self->_printRenderingCallbackID.m_identifier;
}

- (uint64_t)didUpdateVisibleRect:(CGFloat)a3 unobscuredRect:(CGFloat)a4 contentInsets:(CGFloat)a5 unobscuredRectInScrollViewCoordinates:(CGFloat)a6 obscuredInsets:(CGFloat)a7 unobscuredSafeAreaInsets:(CGFloat)a8 inputViewBounds:(CGFloat)a9 scale:(uint64_t)a10 minimumScale:(char)a11 viewStability:(char)a12 enclosedInScrollableAncestorView:(int)a13 sendEvenIfUnchanged:(uint64_t)a14
{
  v127.origin.x = a2;
  v127.origin.y = a3;
  v127.size.width = a4;
  v127.size.height = a5;
  v126.origin.x = a6;
  v126.origin.y = a7;
  v126.size.width = a8;
  v126.size.height = a9;
  v125.origin = a21;
  v125.size.width = a22;
  v125.size.height = a23;
  uint64_t v40 = *(void *)(*(void *)(result + 424) + 232);
  if (v40)
  {
    uint64_t v45 = result;
    WTF::MonotonicTime::now((WTF::MonotonicTime *)result);
    uint64_t v47 = v46;
    if (a11)
    {
      WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)&v124, &v127.origin);
      WebCore::HistoricalVelocityData::velocityForNewData();
      FloatPoint m_location = v92.m_location;
      float m_width = v92.m_size.m_width;
      float m_height = v92.m_size.m_height;
      uint64_t v47 = v93;
    }
    else
    {
      *(_DWORD *)(v45 + 4160) = 0;
      FloatPoint m_location = 0;
      float m_width = 0.0;
    }
    objc_msgSend((id)v45, "_computeUnobscuredContentRectRespectingInputViewBounds:inputViewBounds:", a6, a7, a8, a9, a32, a33, a34, a35);
    v123.origin.x = v48;
    v123.origin.y = v49;
    v123.size.width = v50;
    v123.size.height = v51;
    v52 = *(void **)(v45 + 424);
    WebCore::FloatRect::FloatRect((WebCore::FloatRect *)&v92, &v126);
    WebCore::FloatRect::FloatRect((WebCore::FloatRect *)&v122, &v123);
    float v53 = WebKit::WebPageProxy::computeLayoutViewportRect(v52, (long long *)&v92, &v122, (const FloatRect *)(*(void *)(*(void *)(v45 + 424) + 32) + 2360), 1, a36);
    int v55 = v54;
    int v57 = v56;
    int v59 = v58;
    WebCore::FloatRect::FloatRect((WebCore::FloatRect *)&v122, &v127);
    WebCore::FloatRect::FloatRect((WebCore::FloatRect *)&v91, &v126);
    WebCore::FloatRect::FloatRect((WebCore::FloatRect *)&v90, &v125);
    WebCore::FloatRect::FloatRect((WebCore::FloatRect *)&v89, &v123);
    char v60 = *(unsigned char *)(v45 + 4312);
    char v61 = objc_msgSend((id)objc_msgSend((id)v45, "webView"), "_allowsViewportShrinkToFit");
    if (*(unsigned char *)(v40 + 36))
    {
      result = 96;
      __break(0xC471u);
    }
    else
    {
      float v62 = a29;
      float v63 = a30;
      float v64 = a31;
      float v65 = a28;
      float v66 = a25;
      float v67 = a26;
      float v68 = a27;
      float v69 = a24;
      float v70 = a18;
      float v71 = a19;
      float v72 = a20;
      float v73 = a17;
      uint64_t v74 = *(void *)(v40 + 112);
      FloatRect v92 = v122;
      long long v93 = v91;
      float v94 = v73;
      float v95 = v72;
      float v96 = v71;
      float v97 = v70;
      long long v98 = v89;
      long long v99 = v90;
      float v100 = v53;
      int v101 = v55;
      int v102 = v57;
      int v103 = v59;
      float v104 = v69;
      float v105 = v68;
      float v106 = v67;
      float v107 = v66;
      float v108 = v65;
      float v109 = v64;
      float v110 = v63;
      float v111 = v62;
      FloatPoint v112 = m_location;
      float v113 = m_width;
      float v114 = m_height;
      uint64_t v115 = v47;
      uint64_t v116 = v74;
      double v117 = a36;
      char v118 = a11;
      char v119 = v60;
      char v120 = v61;
      char v121 = a12;
      uint64_t v75 = *(void *)(v45 + 424);
      int v76 = *(unsigned __int8 *)(*(void *)(v75 + 32) + 2448);
      WebKit::WebPageProxy::updateVisibleContentRects(v75, (long long *)&v92, a13);
      v122.m_location.m_x = WebKit::WebPageProxy::computeLayoutViewportRect(*(void **)(v45 + 424), (long long *)(*(void *)(*(void *)(v45 + 424) + 32) + 2296), (FloatRect *)(*(void *)(*(void *)(v45 + 424) + 32) + 2328), (const FloatRect *)(*(void *)(*(void *)(v45 + 424) + 32) + 2360), 0, *(double *)(*(void *)(*(void *)(v45 + 424) + 32) + 2440));
      v122.m_location.m_y = v77;
      v122.m_size.float m_width = v78;
      v122.m_size.float m_height = v79;
      uint64_t v80 = *(void *)(v45 + 424);
      uint64_t v81 = *(void *)(v80 + 32);
      *(void *)&long long v91 = *(void *)(v81 + 2296);
      uint64_t v82 = *(void *)(v80 + 248);
      if (v82) {
        WebCore::ScrollingTree::mainFrameViewportChangedViaDelegatedScrolling(*(WebCore::ScrollingTree **)(v82 + 24), (const WebCore::FloatPoint *)&v91, &v122, *(double *)(v81 + 2440));
      }
      *(unsigned char *)(v45 + 4312) = 0;
      __n128 v83 = ((__n128 (*)(uint64_t))*(void *)(*(void *)v40 + 152))(v40);
      v83.n128_u32[0] = LODWORD(v122.m_location.m_x);
      *(float *)&double v84 = v122.m_location.m_y;
      *(float *)&double v85 = v122.m_size.m_width;
      *(float *)&double v86 = v122.m_size.m_height;
      result = objc_msgSend((id)v45, "updateFixedClippingView:", v83.n128_f64[0], v84, v85, v86);
      if (a11)
      {
        if (!v76) {
          return [(id)v45 _didExitStableState];
        }
      }
    }
  }
  return result;
}

- (void)updateFixedClippingView:(FloatRect)a3
{
  FloatRect v12 = a3;
  [(WKContentView *)self bounds];
  v10.origin.x = v4;
  v10.origin.y = v5;
  v10.size.width = v6;
  v10.size.height = v7;
  WebCore::FloatRect::FloatRect((WebCore::FloatRect *)v11, &v10);
  WebCore::FloatRect::unite((WebCore::FloatRect *)v11, (const WebCore::FloatRect *)&v12);
  asyncInputDelegate = self->_asyncInputDelegate;
  *(void *)&v10.origin.x = v11[0];
  WebCore::FloatPoint::operator CGPoint();
  -[BETextInputDelegate setCenter:](asyncInputDelegate, "setCenter:");
  v9 = self->_asyncInputDelegate;
  WebCore::FloatRect::operator CGRect();
  -[BETextInputDelegate setBounds:](v9, "setBounds:");
}

- (void)_didCommitLayerTree:(const void *)a3
{
  uint64_t v5 = *((void *)a3 + 5);
  unint64_t v25 = *((void *)a3 + 16);
  WebCore::IntSize::operator CGSize();
  double v7 = v6;
  double v9 = v8;
  unint64_t v25 = -*((_DWORD *)a3 + 34) - (*((void *)a3 + 17) & 0xFFFFFFFF00000000);
  WebCore::IntPoint::operator CGPoint();
  int v12 = 0;
  if (!v5)
  {
    double v13 = v10;
    double v14 = v11;
    [(WKContentView *)self bounds];
    v27.origin.x = v13;
    v27.origin.y = v14;
    v27.size.width = v7;
    v27.size.height = v9;
    if (CGRectEqualToRect(v26, v27))
    {
      int v12 = 0;
    }
    else
    {
      -[WKContentView setBounds:](self, "setBounds:", v13, v14, v7, v9);
      int v12 = 1;
    }
  }
  [objc_loadWeak(&self->_webView.m_weakReference) _didCommitLayerTree:a3];
  if (self->_interactionViewsContainerView.m_ptr)
  {
    IntPoint v24 = (IntPoint)*((void *)a3 + 17);
    WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)&v25, &v24);
    objc_msgSend((id)objc_msgSend(-[WKContentView webView](self, "webView"), "scrollView"), "zoomScale");
    *(float *)&double v15 = v15;
    *(float *)&unint64_t v25 = *(float *)&v25 * *(float *)&v15;
    *((float *)&v25 + 1) = *((float *)&v25 + 1) * *(float *)&v15;
    objc_msgSend(self->_interactionViewsContainerView.m_ptr, "setFrame:", *(float *)&v25, *((float *)&v25 + 1), 0.0, 0.0);
  }
  if (v12)
  {
    m_ptr = self->_page.m_ptr;
    uint64_t v17 = *((void *)m_ptr + 4);
    v18 = (long long *)(v17 + 2296);
    v19 = (FloatRect *)(v17 + 2328);
    v20 = (const FloatRect *)(v17 + 2360);
    objc_msgSend((id)objc_msgSend(-[WKContentView webView](self, "webView"), "scrollView"), "zoomScale");
    *(float *)&double v22 = WebKit::WebPageProxy::computeLayoutViewportRect(m_ptr, v18, v19, v20, 0, v21);
    [(WKContentView *)self updateFixedClippingView:v22];
    [objc_loadWeak(&self->_webView.m_weakReference) _scheduleVisibleContentRectUpdate];
  }
  uint64_t v23 = *((void *)self->_page.m_ptr + 4);
  if (*(unsigned char *)(v23 + 576))
  {
    if (*(unsigned char *)(v23 + 704)) {
      [(WKContentView *)self _updateChangedSelection];
    }
  }
}

- (id)webView
{
  return objc_loadWeak(&self->_webView.m_weakReference);
}

- (void)_setDoubleTapGesturesEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    if (([self->_doubleTapGestureRecognizer.m_ptr isEnabled] & 1) == 0) {
      [(WKContentView *)self _createAndConfigureDoubleTapGestureRecognizer];
    }
  }
  else if (LOBYTE(self->_dataListSuggestionsControl.m_weakReference))
  {
    [(WKContentView *)self _tapHighlightColorForFastClick:1];
    WebCore::Color::operator=();
    if ((*(void *)v7 & 0x8000000000000) != 0)
    {
      double v6 = (unsigned int *)(*(void *)v7 & 0xFFFFFFFFFFFFLL);
      if (atomic_fetch_add((atomic_uint *volatile)(*(void *)v7 & 0xFFFFFFFFFFFFLL), 0xFFFFFFFF) == 1)
      {
        atomic_store(1u, v6);
        WTF::fastFree((WTF *)v6, v5);
      }
    }
  }
  [self->_doubleTapGestureRecognizer.m_ptr setEnabled:v3];
  [self->_nonBlockingDoubleTapGestureRecognizer.m_ptr setEnabled:v3 ^ 1];
  [(WKContentView *)self _resetIsDoubleTapPending];
}

- (void)_resetIsDoubleTapPending
{
  BYTE5(self->_dataListTextSuggestionsInputView.m_ptr) = 0;
}

- (BOOL)_mayDisableDoubleTapGesturesDuringSingleTap
{
  return BYTE4(self->_dataListTextSuggestionsInputView.m_ptr);
}

- (CGRect)_computeUnobscuredContentRectRespectingInputViewBounds:(CGRect)a3 inputViewBounds:(CGRect)a4
{
  double height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  objc_msgSend((id)-[WKContentView window](self, "window"), "convertRect:toView:", self, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  CGFloat v8 = v23.origin.x;
  CGFloat v9 = v23.origin.y;
  CGFloat v10 = v23.size.width;
  CGFloat v11 = v23.size.height;
  if (CGRectGetHeight(v23) != 0.0)
  {
    v24.origin.CGFloat x = x;
    v24.origin.CGFloat y = y;
    v24.size.CGFloat width = width;
    v24.size.double height = height;
    CGFloat rect = height;
    CGFloat v12 = x;
    CGFloat v13 = y;
    CGFloat v14 = width;
    float v15 = CGRectGetHeight(v24);
    v25.origin.CGFloat x = v8;
    v25.origin.CGFloat y = v9;
    v25.size.CGFloat width = v10;
    v25.size.double height = v11;
    double MinY = CGRectGetMinY(v25);
    v26.origin.CGFloat x = v12;
    v26.origin.CGFloat y = v13;
    v26.size.CGFloat width = v14;
    v26.size.double height = rect;
    float v17 = MinY - CGRectGetMinY(v26);
    if (v17 >= v15) {
      float v17 = v15;
    }
    CGFloat width = v14;
    CGFloat y = v13;
    CGFloat x = v12;
    double height = v17;
  }
  double v18 = x;
  double v19 = y;
  double v20 = width;
  double v21 = height;
  result.size.double height = v21;
  result.size.CGFloat width = v20;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

- (void)_didScroll
{
  [(WKContentView *)self _updateFrameOfContainerForContextMenuHintPreviewsIfNeeded];
  [(WKContentView *)self _cancelLongPressGestureRecognizer];

  [(WKContentView *)self _cancelInteraction];
}

- (void)_updateFrameOfContainerForContextMenuHintPreviewsIfNeeded
{
  if (self->_contextMenuHintContainerView.m_ptr)
  {
    objc_msgSend(objc_loadWeak(&self->_scrollViewForTargetedPreview.m_weakReference), "convertPoint:toView:", objc_msgSend(self->_contextMenuHintContainerView.m_ptr, "superview"), *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    double v4 = v3;
    double v6 = v5;
    [self->_contextMenuHintContainerView.m_ptr frame];
    double v7 = v4 - self->_scrollViewForTargetedPreviewInitialOffset.x;
    m_ptr = self->_contextMenuHintContainerView.m_ptr;
    double v9 = v6 - self->_scrollViewForTargetedPreviewInitialOffset.y;
    objc_msgSend(m_ptr, "setFrame:", v7, v9);
  }
}

- (void)_cancelLongPressGestureRecognizer
{
}

- (id)_commonInitializationWithProcessPool:(void *)a3 configuration:(void *)a4
{
  WebPage = WebKit::WebProcessPool::createWebPage((uint64_t)a3, *(void *)&self->_anon_fb8[32], (API::PageConfiguration **)a4, (uint64_t *)&v39);
  double v6 = (WebPageProxy *)v39;
  v39 = 0;
  m_ptr = self->_page.m_ptr;
  self->_page.m_ptr = v6;
  if (m_ptr)
  {
    CFRelease(*((CFTypeRef *)m_ptr + 1));
    CGFloat v8 = v39;
    v39 = 0;
    if (v8) {
      CFRelease(*((CFTypeRef *)v8 + 1));
    }
  }
  double v9 = self->_page.m_ptr;
  uint64_t v10 = *((void *)v9 + 6);
  if (*(unsigned char *)(v10 + 184))
  {
    CGFloat v11 = *(WTF::StringImpl **)(v10 + 152);
    if (v11) {
      *(_DWORD *)v11 += 2;
    }
    v39 = v11;
    CGFloat v12 = *(WTF::StringImpl **)(v10 + 160);
    if (v12) {
      *(_DWORD *)v12 += 2;
    }
    uint64_t v40 = v12;
  }
  else
  {
    CGFloat v13 = (const WTF::URL *)WTF::aboutBlankURL((WTF *)WebPage);
    WebKit::Site::Site((WebKit::Site *)&v39, v13);
  }
  WebKit::WebPageProxy::initializeWebPage((unsigned int *)v9, (const WebKit::Site *)&v39);
  float v15 = v40;
  uint64_t v40 = 0;
  if (v15)
  {
    if (*(_DWORD *)v15 == 2) {
      WTF::StringImpl::destroy(v15, v14);
    }
    else {
      *(_DWORD *)v15 -= 2;
    }
  }
  v16 = v39;
  v39 = 0;
  if (v16)
  {
    if (*(_DWORD *)v16 == 2) {
      WTF::StringImpl::destroy(v16, v14);
    }
    else {
      *(_DWORD *)v16 -= 2;
    }
  }
  [(WKContentView *)self _updateRuntimeProtocolConformanceIfNeeded];
  float v17 = self->_page.m_ptr;
  double v18 = (WebCore *)[MEMORY[0x1E4F42D90] mainScreen];
  WebCore::screenScaleFactor(v18, v19);
  if (*((float *)v17 + 190) != v20)
  {
    *((float *)v17 + 190) = v20;
    uint64_t v21 = *((void *)v17 + 29);
    if (v21) {
      (*(void (**)(uint64_t))(*(void *)v21 + 56))(v21);
    }
  }
  WebKit::WebPageProxy::setUseFixedLayout((uint64_t)self->_page.m_ptr, 1);
  WebKit::WebPageProxy::setScreenIsBeingCaptured((uint64_t)self->_page.m_ptr, [(WKContentView *)self screenIsBeingCaptured]);
  WebKit::WebPageProxy::windowScreenDidChange((WebKit::WebPageProxy *)self->_page.m_ptr, ~*(_DWORD *)(*((void *)self->_page.m_ptr + 4) + 1928));
  double v22 = self->_page.m_ptr;
  id v23 = [(WKContentView *)self webView];
  CGRect v24 = (WTF::StringImpl *)WTF::fastMalloc((WTF *)0x20);
  *(void *)CGRect v24 = &unk_1EE9CE0A8;
  *((void *)v24 + 1) = v23;
  *((void *)v24 + 2) = 0;
  v39 = v24;
  WebKit::WebPageProxy::setFullscreenClient((uint64_t)v22, (void **)&v39);
  if (v39) {
    (*(void (**)(WTF::StringImpl *))(*(void *)v39 + 16))(v39);
  }
  LODWORD(WebKit::WebProcessPool::statistics(void)::statistics) = WebKit::WebProcessPool::statistics(void)::statistics
                                                                + 1;
  id v25 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
  CGRect v26 = *(const void **)&self->_anon_fb8[48];
  *(void *)&self->_anon_fb8[48] = v25;
  if (v26)
  {
    CFRelease(v26);
    id v25 = *(id *)&self->_anon_fb8[48];
  }
  objc_msgSend((id)objc_msgSend(v25, "layer"), "setName:", @"RootContent");
  objc_msgSend((id)objc_msgSend(*(id *)&self->_anon_fb8[48], "layer"), "setMasksToBounds:", 0);
  [*(id *)&self->_anon_fb8[48] setAutoresizingMask:18];
  CGRect v27 = (BETextInputDelegate *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
  asyncInputDelegate = self->_asyncInputDelegate;
  self->_asyncInputDelegate = v27;
  if (asyncInputDelegate)
  {
    CFRelease(asyncInputDelegate);
    CGRect v27 = self->_asyncInputDelegate;
  }
  objc_msgSend((id)-[BETextInputDelegate layer](v27, "layer"), "setName:", @"FixedClipping");
  objc_msgSend((id)-[BETextInputDelegate layer](self->_asyncInputDelegate, "layer"), "setMasksToBounds:", 1);
  objc_msgSend((id)-[BETextInputDelegate layer](self->_asyncInputDelegate, "layer"), "setAnchorPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  [(WKContentView *)self addSubview:self->_asyncInputDelegate];
  [(BETextInputDelegate *)self->_asyncInputDelegate addSubview:*(void *)&self->_anon_fb8[48]];
  if ((WTF::linkedOnOrAfterSDKWithBehavior() & 1) == 0) {
    [(WKContentView *)self setUpInteraction];
  }
  [(WKContentView *)self setUserInteractionEnabled:1];
  objc_msgSend((id)-[WKContentView layer](self, "layer"), "setHitTestsAsOpaque:", 1);
  if (objc_opt_respondsToSelector()) {
    [(WKContentView *)self setFocusEffect:0];
  }
  [(WKContentView *)self _installVisibilityPropagationViews];
  v29 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  objc_msgSend(v29, "addObserver:selector:name:object:", self, sel__applicationWillResignActive_, *MEMORY[0x1E4F43710], objc_msgSend(MEMORY[0x1E4F42738], "sharedApplication"));
  v30 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  objc_msgSend(v30, "addObserver:selector:name:object:", self, sel__applicationDidBecomeActive_, *MEMORY[0x1E4F43648], objc_msgSend(MEMORY[0x1E4F42738], "sharedApplication"));
  v31 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  objc_msgSend(v31, "addObserver:selector:name:object:", self, sel__applicationDidEnterBackground_, *MEMORY[0x1E4F43660], objc_msgSend(MEMORY[0x1E4F42738], "sharedApplication"));
  v32 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  objc_msgSend(v32, "addObserver:selector:name:object:", self, sel__applicationWillEnterForeground_, *MEMORY[0x1E4F43708], objc_msgSend(MEMORY[0x1E4F42738], "sharedApplication"));
  v33 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  if (WebCore::IOSApplication::isEvernote((WebCore::IOSApplication *)objc_msgSend(v33, "addObserver:selector:name:object:", self, sel__screenCapturedDidChange_, *MEMORY[0x1E4F43CB8], objc_msgSend(MEMORY[0x1E4F42D90], "mainScreen")))&& (WTF::linkedOnOrAfterSDKWithBehavior() & 1) == 0)
  {
    v34 = (objc_class *)objc_opt_class();
    v35 = (objc_class *)objc_opt_class();
    InstanceMethod = class_getInstanceMethod(v35, sel_keyCommands);
    TypeEncoding = method_getTypeEncoding(InstanceMethod);
    class_addMethod(v34, sel_keyCommands, (IMP)keyCommandsPlaceholderHackForEvernote, TypeEncoding);
  }
  return self;
}

- (BOOL)screenIsBeingCaptured
{
  v2 = objc_msgSend((id)-[WKContentView window](self, "window"), "screen");

  return [v2 isCaptured];
}

- (id).cxx_construct
{
  self->_page.m_ptr = 0;
  self->_webView.m_weakReference = 0;
  self->_touchStartDeferringGestureRecognizerForImmediatelyResettableGestures.m_ptr = 0;
  self->_touchStartDeferringGestureRecognizerForDelayedResettableGestures.m_ptr = 0;
  self->_touchStartDeferringGestureRecognizerForSyntheticTapGestures.m_ptr = 0;
  self->_touchEndDeferringGestureRecognizerForImmediatelyResettableGestures.m_ptr = 0;
  self->_touchEndDeferringGestureRecognizerForDelayedResettableGestures.m_ptr = 0;
  self->_touchEndDeferringGestureRecognizerForSyntheticTapGestures.m_ptr = 0;
  self->_touchMoveDeferringGestureRecognizer.m_ptr = 0;
  self->_failedTouchStartDeferringGestures.var0.__null_state_ = 0;
  self->_failedTouchStartDeferringGestures.__engaged_ = 0;
  self->_imageAnalysisDeferringGestureRecognizer.m_ptr = 0;
  self->_gestureRecognizerConsistencyEnforcer.__ptr_.__value_ = 0;
  self->_touchEventGestureRecognizer.m_ptr = 0;
  self->_singleTapGestureRecognizer.m_ptr = 0;
  self->_highlightLongPressGestureRecognizer.m_ptr = 0;
  self->_longPressGestureRecognizer.m_ptr = 0;
  self->_doubleTapGestureRecognizer.m_ptr = 0;
  self->_nonBlockingDoubleTapGestureRecognizer.m_ptr = 0;
  self->_doubleTapGestureRecognizerForDoubleClick.m_ptr = 0;
  self->_twoFingerDoubleTapGestureRecognizer.m_ptr = 0;
  self->_twoFingerSingleTapGestureRecognizer.m_ptr = 0;
  self->_keyboardDismissalGestureRecognizer.m_ptr = 0;
  self->_inspectorNodeSearchGestureRecognizer.m_ptr = 0;
  self->_touchActionGestureRecognizer.m_ptr = 0;
  self->_touchActionLeftSwipeGestureRecognizer.m_ptr = 0;
  self->_touchActionRightSwipeGestureRecognizer.m_ptr = 0;
  self->_touchActionUpSwipeGestureRecognizer.m_ptr = 0;
  self->_touchActionDownSwipeGestureRecognizer.m_ptr = 0;
  self->_mouseInteraction.m_ptr = 0;
  self->_scribbleInteraction.m_ptr = 0;
  self->_pointerInteraction.m_ptr = 0;
  self->_lastPointerRegion.m_ptr = 0;
  self->_textInteractionWrapper.m_ptr = 0;
  self->_suppressSelectionAssistantReasons.m_storage = 0;
  self->_legacyTextInputTraits.m_ptr = 0;
  self->_extendedTextInputTraits.m_ptr = 0;
  self->_formAccessoryView.m_ptr = 0;
  self->_tapHighlightView.m_ptr = 0;
  self->_interactionViewsContainerView.m_ptr = 0;
  self->_contextMenuHintContainerView.m_ptr = 0;
  self->_scrollViewForTargetedPreview.m_weakReference = 0;
  self->_dragPreviewContainerView.m_ptr = 0;
  self->_dropPreviewContainerView.m_ptr = 0;
  self->_markedText.m_ptr = 0;
  self->_actionSheetAssistant.m_ptr = 0;
  self->_airPlayRoutePicker.m_ptr = 0;
  self->_formInputSession.m_ptr = 0;
  self->_fileUploadPanel.m_ptr = 0;
  p_frameInfoForFileUploadPanel = &self->_frameInfoForFileUploadPanel;
  *(_WORD *)&self->_frameInfoForFileUploadPanel.isMainFrame = 0;
  WebCore::ResourceRequest::ResourceRequest((StringImpl *)&self->_frameInfoForFileUploadPanel.request);
  p_frameInfoForFileUploadPanel->securityOrigin.m_data.__impl_.__indeCGFloat x = 0;
  p_frameInfoForFileUploadPanel->securityOrigin.m_data.__impl_.__data.__tail.__head.__value.m_processIdentifier.m_identifier = 0;
  *((void *)&p_frameInfoForFileUploadPanel->securityOrigin.m_data.__impl_.__data.__tail + 2) = 0;
  p_frameInfoForFileUploadPanel->securityOrigin.m_data.__impl_.__data.__tail.__head.__value.m_object.m_identifier = 0;
  p_frameInfoForFileUploadPanel->parentFrameID.__engaged_ = 0;
  *(_WORD *)&p_frameInfoForFileUploadPanel->isFocused = 0;
  p_frameInfoForFileUploadPanel->parentFrameID.var0.__null_state_ = 0;
  p_frameInfoForFileUploadPanel->frameID.m_object.m_identifier = 0;
  p_frameInfoForFileUploadPanel->frameID.m_processIdentifier.m_identifier = 0;
  p_frameInfoForFileUploadPanel->frameName.m_impl.m_ptr = 0;
  self->_shareSheet.m_ptr = 0;
  self->_contactPicker.m_ptr = 0;
  self->_previewGestureRecognizer.m_ptr = 0;
  self->_previewSecondaryGestureRecognizer.m_ptr = 0;
  self->_focusStateStack.m_buffer = 0;
  *(void *)&self->_focusStateStack.m_capacitCGFloat y = 0;
  self->_contextMenuElementInfo.m_ptr = 0;
  self->_contextMenuLegacyPreviewController.m_ptr = 0;
  self->_contextMenuLegacyMenu.m_ptr = 0;
  self->_previewItemController.m_ptr = 0;
  self->_textIndicator.m_ptr = 0;
  self->_textIndicatorLayer.m_ptr = 0;
  self->_contextMenuInteractionTargetedPreview.m_ptr = 0;
  self->_textAnimationManager.m_ptr = 0;
  self->_smartMagnificationController.__ptr_.__value_ = 0;
  self->_inputDelegate.m_weakReference = 0;
  self->_latestTapID.m_value.m_identifier = 0;
  self->_tapHighlightInformation.nodeHasBuiltInClickHandling = 0;
  *(_OWORD *)&self->_tapHighlightInformation.color.m_colorAndFlags = 0u;
  *(_OWORD *)&self->_tapHighlightInformation.quads.m_capacitCGFloat y = 0u;
  *(_OWORD *)&self->_tapHighlightInformation.topRightRadius.float m_width = 0u;
  self->_tapHighlightInformation.bottomRightRadius = 0;
  *(_OWORD *)&self->_lastAutocorrectionContext.contextBefore.m_impl.m_ptr = 0u;
  *(_OWORD *)&self->_lastAutocorrectionContext.selectedText.m_impl.m_ptr = 0u;
  self->_lastAutocorrectionContext.selectedRangeInMarkedText = (EditingRange)xmmword_1994F6020;
  self->_autocorrectionData.font.m_ptr = 0;
  *(int *)((char *)&self->_positionInformation.request.point.m_y + 3) = 0;
  self->_positionInformation.request.point = 0;
  *(_DWORD *)&self->_positionInformation.request.includeHasDoubleClickHandler = 1;
  self->_positionInformation.canBeValid = 1;
  *(_DWORD *)&self->_positionInformation.nodeAtPositionHasDoubleClickHandler.var0.__null_state_ = 0;
  *(_WORD *)&self->_positionInformation.prefersDraggingOverTextSelection = 0;
  self->_positionInformation.touchCalloutEnabled = 1;
  self->_positionInformation.adjustedPointForNodeRespondingToClickEvents = 0;
  *(void *)&self->_positionInformation.isLink = 0;
  self->_positionInformation.isContentEditable = 0;
  *(unint64_t *)((char *)&self->_positionInformation.containerScrollingNodeID.m_value.m_processIdentifier.m_identifier
                      + 6) = 0;
  self->_positionInformation.containerScrollingNodeID.m_value.m_object.m_identifier = 0;
  self->_positionInformation.containerScrollingNodeID.m_value.m_processIdentifier.m_identifier = 0;
  WTF::URL::URL((WTF::URL *)&self->_positionInformation.url);
  WTF::URL::URL((WTF::URL *)&self->_positionInformation.imageURL);
  self->_positionInformation.cursor.var0.__null_state_ = 0;
  self->_positionInformation.cursor.__engaged_ = 0;
  self->_positionInformation.linkIndicator.selectionRectInRootViewCoordinates = 0u;
  self->_positionInformation.linkIndicator.textBoundingRectInRootViewCoordinates = 0u;
  self->_positionInformation.linkIndicator.contentImageWithoutSelectionRectInRootViewCoordinates = 0u;
  self->_positionInformation.linkIndicator.textRectsInBoundingRectCoordinates = 0u;
  *(_OWORD *)&self->_positionInformation.imageMIMEType.m_impl.m_ptr = 0u;
  *(_OWORD *)&self->_positionInformation.idAttribute.m_impl.m_ptr = 0u;
  *(_OWORD *)&self->_positionInformation.bounds.m_size.float m_width = 0u;
  *(_OWORD *)&self->_positionInformation.textBefore.m_impl.m_ptr = 0u;
  *(_OWORD *)&self->_positionInformation.caretLength = 0u;
  self->_positionInformation.lineCaretExtent.m_size.float m_height = 0.0;
  self->_positionInformation.linkIndicator.contentImageScaleFactor = 1.0;
  self->_positionInformation.linkIndicator.options.m_storage = 0;
  *(_OWORD *)&self->_positionInformation.linkIndicator.contentImageWithHighlight.m_ptr = 0u;
  *(_OWORD *)&self->_positionInformation.linkIndicator.contentImage.m_ptr = 0u;
  self->_positionInformation.linkIndicator.presentationTransition = 0;
  *((unsigned char *)&self->_positionInformation.elementContext.var0.var2 + 8) = 0;
  self->_anon_7d0[32] = 0;
  self->_anon_7d0[48] = 0;
  self->_anon_7d0[128] = 0;
  *(_OWORD *)&self->_anon_7d0[144] = 0u;
  *(_OWORD *)&self->_positionInformation.dataDetectorIdentifier.m_impl.m_ptr = 0u;
  self->_positionInformation.dataDetectorBounds = 0u;
  self->_positionInformationLinkIndicator.var0.__null_state_ = 0;
  self->_positionInformationLinkIndicator.__engaged_ = 0;
  WebKit::FocusedElementInformation::FocusedElementInformation((WebKit::FocusedElementInformation *)&self->_focusedElementInformation);
  self->_inputPeripheral.m_ptr = 0;
  self->_keyWebEventHandlers.m_buffer = (KeyEventAndCompletionBlock *)self->_keyWebEventHandlers.m_inlineBuffer;
  *(void *)&self->_keyWebEventHandlers.m_capacitCGFloat y = 1;
  *(void *)&self->_keyWebEventHandlers.m_inlineBuffer[0].__lx[32] = 0;
  WebKit::WKSelectionDrawingInfo::WKSelectionDrawingInfo((WebKit::WKSelectionDrawingInfo *)&self->_keyWebEventHandlers.m_inlineBuffer[0].__lx[40]);
  self->_lastSelectionDrawingInfo.selectionGeometries.m_buffer = 0;
  LOBYTE(self->_lastSelectionDrawingInfo.selectionGeometries.m_capacity) = 0;
  LOBYTE(self->_lastSelectionDrawingInfo.selectionClipRect.m_size.m_width) = 0;
  *(void *)&self->_lastOutstandingPositionInformationRequest.var0.__null_state_ = 0;
  *(void *)&self->_lastOutstandingPositionInformationRequest.var0.__val_.includeSnapshot = 0;
  self->_lastOutstandingPositionInformationRequest.__engaged_ = 0;
  self->_positionInformationCallbackDepth = 0;
  self->_pendingPositionInformationHandlers.m_buffer = 0;
  *(void *)&self->_pendingPositionInformationHandlers.m_capacitCGFloat y = 0;
  *(void *)&self->_inputViewUpdateDeferralSources.m_storage = 0;
  self->_keyboardScrollingAnimator.m_ptr = 0;
  self->_actionsToPerformAfterEditorStateUpdate.m_buffer = 0;
  *(void *)&self->_actionsToPerformAfterEditorStateUpdate.m_capacitCGFloat y = 0;
  *(_WORD *)&self->_isWaitingOnPositionInformation = 0;
  *(_WORD *)&self->_resigningFirstResponder = 0;
  *(void *)&self->_hasSetUpInteractions = 0;
  LOWORD(self->_ignoreSelectionCommandFadeCount) = 0;
  self->_activeTextInteractionCount = 0;
  self->_suppressNonEditableSingleTapTextInteractionCount = 0;
  self->_domPasteRequestHandler.m_function.m_callableWrapper.__ptr_.__value_ = 0;
  self->_domPasteRequestCategory.var0.__null_state_ = 0;
  *((unsigned char *)&self->_domPasteRequestCategory + 4) = 0;
  double v4 = (_OWORD *)MEMORY[0x1E4F1DAD8];
  *(_OWORD *)&self->_pendingRunModalJavaScriptDialogCallback.m_function.m_callableWrapper.__ptr_.__value_ = *MEMORY[0x1E4F1DAD8];
  *(_OWORD *)&self->_lastInsertedCharacterToOverrideCharacterBeforeSelection.var0.__null_state_ = *v4;
  LOWORD(self->_dragDropInteractionState.m_lastGlobalPosition.x) = 0;
  LOBYTE(self->_dragDropInteractionState.m_stagedDragSource.var0.__val_.linkURL.m_pathEnd) = 0;
  *(_OWORD *)&self->_dragDropInteractionState.m_lastGlobalPosition.CGFloat y = 0u;
  *(_OWORD *)&self->_dragDropInteractionState.m_adjustedPositionForDragEnd.CGFloat y = 0u;
  *(_OWORD *)&self->_dragDropInteractionState.m_isPerformingDrop = 0u;
  *(_OWORD *)&self->_dragDropInteractionState.m_stagedDragSource.var0.__val_.possiblyNeedsDragPreviewUpdate = 0u;
  *(_OWORD *)&self->_dragDropInteractionState.m_stagedDragSource.__engaged_ = 0u;
  *(void *)&self->_dragDropInteractionState.m_activeDragSources.m_capacitCGFloat y = 0;
  self->_dragDropInteractionState.m_defaultDropPreviews.m_impl.var0.m_table = 0;
  *(void *)self->_anon_dc8 = 0;
  self->_dragInteraction.m_ptr = 0;
  self->_dropInteraction.m_ptr = 0;
  *(void *)&self->_isAnimatingDragCancel = 0;
  self->_visibleContentViewSnapshot.m_ptr = 0;
  self->_unselectedContentSnapshot.m_ptr = 0;
  self->_editDropCaretView.m_ptr = 0;
  self->_actionToPerformAfterReceivingEditDragSnapshot.m_block = 0;
  LOBYTE(self->_editDropTextCursorView.m_ptr) = 0;
  LOBYTE(self->_editDropCaretAnimator.m_ptr) = 0;
  LOBYTE(self->_imageAnalysisGestureRecognizer.m_ptr) = 0;
  self->_anon_e70[0] = 0;
  *(void *)&self->_anon_e70[16] = 0;
  *(void *)&self->_anon_e70[24] = 0;
  *(void *)&self->_anon_e70[40] = 0;
  self->_actionsToPerformAfterPendingImageAnalysis.m_buffer = 0;
  *(void *)&self->_actionsToPerformAfterPendingImageAnalysis.m_capacitCGFloat y = 0;
  *(void *)&self->_isProceedingWithTextSelectionInImage = 0;
  self->_imageAnalyzer.m_ptr = 0;
  LOBYTE(self->_visualSearchPreviewImageBounds.origin.x) = 0;
  self->_cachedVisualSearchPreviewImageBoundsInWindowCoordinates.var0.__null_state_ = 0;
  LOBYTE(self->_cachedVisualSearchPreviewImageBoundsInWindowCoordinates.var0.__val_.size.width) = 0;
  self->_dynamicImageAnalysisContextMenuState = 0;
  self->_imageAnalysisContextMenuActionData.var0.__val_.copySubjectResult.m_ptr = 0;
  self->_imageAnalysisContextMenuActionData.var0.__val_.machineReadableCodeMenu.m_ptr = 0;
  *(void *)&self->_imageAnalysisContextMenuActionData.__engaged_ = 0;
  *(void *)&self->_fullscreenVideoImageAnalysisRequestIdentifier = 0;
  LOBYTE(self->_imageAnalysisActionButtons.m_ptr) = 0;
  self->_anon_fb8[8] = 0;
  *(void *)&self->_anon_fb8[32] = 0;
  *(void *)&self->_anon_fb8[40] = 0;
  *(void *)&self->_anon_fb8[48] = 0;
  self->_asyncInputDelegate = 0;
  self->_pageClient.__ptr_.__value_ = 0;
  self->_browsingContextController.m_ptr = 0;
  self->_rootContentView.m_ptr = 0;
  self->_fixedClippingView.m_ptr = 0;
  self->_inspectorIndicationView.m_ptr = 0;
  self->_inspectorHighlightView.m_ptr = 0;
  self->_visibilityPropagationViewForWebProcess.m_ptr = 0;
  for (uint64_t i = 16; i != 88; i += 24)
  {
    double v6 = (void **)((char *)&self->_inspectorHighlightView.m_ptr + i);
    *double v6 = 0;
    v6[1] = 0;
  }
  self->_historicalKinematicData.m_positionHistory[1].scale = 0.0;
  self->_historicalKinematicData.m_positionHistory[2].timestamp.m_value = 0.0;
  LOBYTE(self->_historicalKinematicData.m_positionHistory[2].position.m_x) = 0;
  self->_historicalKinematicData.m_positionHistory[2].scale = 0.0;
  self->_undoManager.m_ptr = 0;
  *(void *)&self->_pendingBackgroundPrintFormattersLock.m_byte.value.__a_.__a_value = 0;
  self->_pendingBackgroundPrintFormatters.m_ptr = 0;
  return self;
}

- (UITextInputDelegate)inputDelegate
{
  return (UITextInputDelegate *)objc_loadWeak(&self->_inputDelegate.m_weakReference);
}

- (NSArray)deferringGestures
{
  double v3 = (NSArray *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:7];
  [(NSArray *)v3 addObjectsFromArray:[(WKContentView *)self _touchStartDeferringGestures]];
  [(NSArray *)v3 addObjectsFromArray:[(WKContentView *)self _touchEndDeferringGestures]];
  if (self->_touchMoveDeferringGestureRecognizer.m_ptr) {
    -[NSArray addObject:](v3, "addObject:");
  }
  if (self->_imageAnalysisDeferringGestureRecognizer.m_ptr) {
    -[NSArray addObject:](v3, "addObject:");
  }
  return v3;
}

- (id)_touchStartDeferringGestures
{
  v6[3] = *MEMORY[0x1E4F143B8];
  if (self->_touchStartDeferringGestureRecognizerForImmediatelyResettableGestures.m_ptr)
  {
    v6[0] = self->_touchStartDeferringGestureRecognizerForImmediatelyResettableGestures.m_ptr;
    uint64_t v2 = 1;
  }
  else
  {
    uint64_t v2 = 0;
  }
  m_ptr = self->_touchStartDeferringGestureRecognizerForDelayedResettableGestures.m_ptr;
  if (m_ptr) {
    v6[v2++] = m_ptr;
  }
  double v4 = self->_touchStartDeferringGestureRecognizerForSyntheticTapGestures.m_ptr;
  if (v4) {
    v6[v2++] = v4;
  }
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:v2];
}

- (id)_touchEndDeferringGestures
{
  v6[3] = *MEMORY[0x1E4F143B8];
  if (self->_touchEndDeferringGestureRecognizerForImmediatelyResettableGestures.m_ptr)
  {
    v6[0] = self->_touchEndDeferringGestureRecognizerForImmediatelyResettableGestures.m_ptr;
    uint64_t v2 = 1;
  }
  else
  {
    uint64_t v2 = 0;
  }
  m_ptr = self->_touchEndDeferringGestureRecognizerForDelayedResettableGestures.m_ptr;
  if (m_ptr) {
    v6[v2++] = m_ptr;
  }
  double v4 = self->_touchEndDeferringGestureRecognizerForSyntheticTapGestures.m_ptr;
  if (v4) {
    v6[v2++] = v4;
  }
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:v2];
}

- (void)_layerTreeCommitComplete
{
  id Weak = objc_loadWeak(&self->_webView.m_weakReference);

  [Weak _layerTreeCommitComplete];
}

- (UITextInputTraits)textInputTraitsForWebView
{
  m_ptr = self->_legacyTextInputTraits.m_ptr;
  if (!m_ptr)
  {
    m_ptr = objc_opt_new();
    double v4 = self->_legacyTextInputTraits.m_ptr;
    self->_legacyTextInputTraits.m_ptr = m_ptr;
    if (v4)
    {
      CFRelease(v4);
      m_ptr = self->_legacyTextInputTraits.m_ptr;
    }
  }
  if (!self->_isDoubleTapPending)
  {
    [(WKContentView *)self _updateTextInputTraits:m_ptr];
    return (UITextInputTraits *)self->_legacyTextInputTraits.m_ptr;
  }
  return (UITextInputTraits *)m_ptr;
}

- (void)setUpInteraction
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  m_ptr = self->_page.m_ptr;
  if (!*((unsigned char *)m_ptr + 801) && *((unsigned char *)m_ptr + 800) && !self->_becomingFirstResponder)
  {
    if (self->_needsDeferredEndScrollingSelectionUpdate) {
      self->_needsDeferredEndScrollingSelectionUpdate = 0;
    }
    if (!self->_interactionViewsContainerView.m_ptr)
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
      double v5 = self->_interactionViewsContainerView.m_ptr;
      self->_interactionViewsContainerView.m_ptr = v4;
      if (v5)
      {
        CFRelease(v5);
        id v4 = self->_interactionViewsContainerView.m_ptr;
      }
      objc_msgSend((id)objc_msgSend(v4, "layer"), "setName:", @"InteractionViewsContainer");
      [self->_interactionViewsContainerView.m_ptr setOpaque:0];
      objc_msgSend((id)objc_msgSend(self->_interactionViewsContainerView.m_ptr, "layer"), "setAnchorPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
      objc_msgSend((id)-[WKContentView superview](self, "superview"), "addSubview:", self->_interactionViewsContainerView.m_ptr);
    }
    double v6 = -[WKKeyboardScrollViewAnimator initWithScrollView:]([WKKeyboardScrollViewAnimator alloc], "initWithScrollView:", objc_msgSend(-[WKContentView webView](self, "webView"), "_scrollViewInternal"));
    positionInformationCallbackDepth = (const void *)self->_positionInformationCallbackDepth;
    self->_positionInformationCallbackDepth = (unint64_t)v6;
    if (positionInformationCallbackDepth)
    {
      CFRelease(positionInformationCallbackDepth);
      double v6 = (WKKeyboardScrollViewAnimator *)self->_positionInformationCallbackDepth;
    }
    [(WKKeyboardScrollViewAnimator *)v6 setDelegate:self];
    CGFloat v8 = (void *)[(WKContentView *)self layer];
    [v8 addObserver:self forKeyPath:@"transform" options:4 context:WKContentViewKVOTransformContext];
    double v9 = (void *)[objc_alloc(MEMORY[0x1E4F42E70]) initWithTarget:0 action:0];
    uint64_t v10 = self->_touchActionLeftSwipeGestureRecognizer.m_ptr;
    self->_touchActionLeftSwipeGestureRecognizer.m_ptr = v9;
    if (v10)
    {
      CFRelease(v10);
      double v9 = self->_touchActionLeftSwipeGestureRecognizer.m_ptr;
    }
    [v9 setDirection:2];
    [self->_touchActionLeftSwipeGestureRecognizer.m_ptr setDelegate:self];
    [self->_touchActionLeftSwipeGestureRecognizer.m_ptr setName:@"Touch action swipe left"];
    [(WKContentView *)self addGestureRecognizer:self->_touchActionLeftSwipeGestureRecognizer.m_ptr];
    CGFloat v11 = (void *)[objc_alloc(MEMORY[0x1E4F42E70]) initWithTarget:0 action:0];
    CGFloat v12 = self->_touchActionRightSwipeGestureRecognizer.m_ptr;
    self->_touchActionRightSwipeGestureRecognizer.m_ptr = v11;
    if (v12)
    {
      CFRelease(v12);
      CGFloat v11 = self->_touchActionRightSwipeGestureRecognizer.m_ptr;
    }
    [v11 setDirection:1];
    [self->_touchActionRightSwipeGestureRecognizer.m_ptr setDelegate:self];
    [self->_touchActionRightSwipeGestureRecognizer.m_ptr setName:@"Touch action swipe right"];
    [(WKContentView *)self addGestureRecognizer:self->_touchActionRightSwipeGestureRecognizer.m_ptr];
    CGFloat v13 = (void *)[objc_alloc(MEMORY[0x1E4F42E70]) initWithTarget:0 action:0];
    CGFloat v14 = self->_touchActionUpSwipeGestureRecognizer.m_ptr;
    self->_touchActionUpSwipeGestureRecognizer.m_ptr = v13;
    if (v14)
    {
      CFRelease(v14);
      CGFloat v13 = self->_touchActionUpSwipeGestureRecognizer.m_ptr;
    }
    [v13 setDirection:4];
    [self->_touchActionUpSwipeGestureRecognizer.m_ptr setDelegate:self];
    [self->_touchActionUpSwipeGestureRecognizer.m_ptr setName:@"Touch action swipe up"];
    [(WKContentView *)self addGestureRecognizer:self->_touchActionUpSwipeGestureRecognizer.m_ptr];
    float v15 = (void *)[objc_alloc(MEMORY[0x1E4F42E70]) initWithTarget:0 action:0];
    v16 = self->_touchActionDownSwipeGestureRecognizer.m_ptr;
    self->_touchActionDownSwipeGestureRecognizer.m_ptr = v15;
    if (v16)
    {
      CFRelease(v16);
      float v15 = self->_touchActionDownSwipeGestureRecognizer.m_ptr;
    }
    [v15 setDirection:8];
    [self->_touchActionDownSwipeGestureRecognizer.m_ptr setDelegate:self];
    [self->_touchActionDownSwipeGestureRecognizer.m_ptr setName:@"Touch action swipe down"];
    [(WKContentView *)self addGestureRecognizer:self->_touchActionDownSwipeGestureRecognizer.m_ptr];
    float v17 = [[WKDeferringGestureRecognizer alloc] initWithDeferringGestureDelegate:self];
    double v18 = self->_touchStartDeferringGestureRecognizerForImmediatelyResettableGestures.m_ptr;
    self->_touchStartDeferringGestureRecognizerForImmediatelyResettableGestures.m_ptr = v17;
    if (v18)
    {
      CFRelease(v18);
      float v17 = (WKDeferringGestureRecognizer *)self->_touchStartDeferringGestureRecognizerForImmediatelyResettableGestures.m_ptr;
    }
    [(WKDeferringGestureRecognizer *)v17 setName:@"Deferrer for touch start (immediate reset)"];
    double v19 = [[WKDeferringGestureRecognizer alloc] initWithDeferringGestureDelegate:self];
    float v20 = self->_touchStartDeferringGestureRecognizerForDelayedResettableGestures.m_ptr;
    self->_touchStartDeferringGestureRecognizerForDelayedResettableGestures.m_ptr = v19;
    if (v20)
    {
      CFRelease(v20);
      double v19 = (WKDeferringGestureRecognizer *)self->_touchStartDeferringGestureRecognizerForDelayedResettableGestures.m_ptr;
    }
    [(WKDeferringGestureRecognizer *)v19 setName:@"Deferrer for touch start (delayed reset)"];
    uint64_t v21 = [[WKDeferringGestureRecognizer alloc] initWithDeferringGestureDelegate:self];
    double v22 = self->_touchStartDeferringGestureRecognizerForSyntheticTapGestures.m_ptr;
    self->_touchStartDeferringGestureRecognizerForSyntheticTapGestures.m_ptr = v21;
    if (v22)
    {
      CFRelease(v22);
      uint64_t v21 = (WKDeferringGestureRecognizer *)self->_touchStartDeferringGestureRecognizerForSyntheticTapGestures.m_ptr;
    }
    [(WKDeferringGestureRecognizer *)v21 setName:@"Deferrer for touch start (synthetic tap)"];
    id v23 = [[WKDeferringGestureRecognizer alloc] initWithDeferringGestureDelegate:self];
    CGRect v24 = self->_touchEndDeferringGestureRecognizerForImmediatelyResettableGestures.m_ptr;
    self->_touchEndDeferringGestureRecognizerForImmediatelyResettableGestures.m_ptr = v23;
    if (v24)
    {
      CFRelease(v24);
      id v23 = (WKDeferringGestureRecognizer *)self->_touchEndDeferringGestureRecognizerForImmediatelyResettableGestures.m_ptr;
    }
    [(WKDeferringGestureRecognizer *)v23 setName:@"Deferrer for touch end (immediate reset)"];
    id v25 = [[WKDeferringGestureRecognizer alloc] initWithDeferringGestureDelegate:self];
    CGRect v26 = self->_touchEndDeferringGestureRecognizerForDelayedResettableGestures.m_ptr;
    self->_touchEndDeferringGestureRecognizerForDelayedResettableGestures.m_ptr = v25;
    if (v26)
    {
      CFRelease(v26);
      id v25 = (WKDeferringGestureRecognizer *)self->_touchEndDeferringGestureRecognizerForDelayedResettableGestures.m_ptr;
    }
    [(WKDeferringGestureRecognizer *)v25 setName:@"Deferrer for touch end (delayed reset)"];
    CGRect v27 = [[WKDeferringGestureRecognizer alloc] initWithDeferringGestureDelegate:self];
    v28 = self->_touchEndDeferringGestureRecognizerForSyntheticTapGestures.m_ptr;
    self->_touchEndDeferringGestureRecognizerForSyntheticTapGestures.m_ptr = v27;
    if (v28)
    {
      CFRelease(v28);
      CGRect v27 = (WKDeferringGestureRecognizer *)self->_touchEndDeferringGestureRecognizerForSyntheticTapGestures.m_ptr;
    }
    [(WKDeferringGestureRecognizer *)v27 setName:@"Deferrer for touch end (synthetic tap)"];
    v29 = [[WKDeferringGestureRecognizer alloc] initWithDeferringGestureDelegate:self];
    v30 = self->_touchMoveDeferringGestureRecognizer.m_ptr;
    self->_touchMoveDeferringGestureRecognizer.m_ptr = v29;
    if (v30)
    {
      CFRelease(v30);
      v29 = (WKDeferringGestureRecognizer *)self->_touchMoveDeferringGestureRecognizer.m_ptr;
    }
    [(WKDeferringGestureRecognizer *)v29 setName:@"Deferrer for touch move"];
    v31 = [[WKDeferringGestureRecognizer alloc] initWithDeferringGestureDelegate:self];
    v32 = self->_imageAnalysisDeferringGestureRecognizer.m_ptr;
    self->_imageAnalysisDeferringGestureRecognizer.m_ptr = v31;
    if (v32)
    {
      CFRelease(v32);
      v31 = (WKDeferringGestureRecognizer *)self->_imageAnalysisDeferringGestureRecognizer.m_ptr;
    }
    [(WKDeferringGestureRecognizer *)v31 setName:@"Deferrer for image analysis"];
    [self->_imageAnalysisDeferringGestureRecognizer.m_ptr setImmediatelyFailsAfterTouchEnd:1];
    [self->_imageAnalysisDeferringGestureRecognizer.m_ptr setEnabled:PAL::VisionKitCoreLibrary((PAL *)1) != 0];
    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    v33 = [(WKContentView *)self deferringGestures];
    uint64_t v34 = [(NSArray *)v33 countByEnumeratingWithState:&v74 objects:v78 count:16];
    if (v34)
    {
      uint64_t v35 = *(void *)v75;
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v75 != v35) {
            objc_enumerationMutation(v33);
          }
          v37 = *(void **)(*((void *)&v74 + 1) + 8 * i);
          [v37 setDelegate:self];
          [(WKContentView *)self addGestureRecognizer:v37];
        }
        uint64_t v34 = [(NSArray *)v33 countByEnumeratingWithState:&v74 objects:v78 count:16];
      }
      while (v34);
    }
    value = self->_gestureRecognizerConsistencyEnforcer.__ptr_.__value_;
    if (value) {
      WebKit::GestureRecognizerConsistencyEnforcer::reset((WebKit::GestureRecognizerConsistencyEnforcer *)value);
    }
    v39 = [[WKTouchEventsGestureRecognizer alloc] initWithTarget:self action:sel__touchEventsRecognized_ touchDelegate:self];
    uint64_t v40 = self->_touchEventGestureRecognizer.m_ptr;
    self->_touchEventGestureRecognizer.m_ptr = v39;
    if (v40)
    {
      CFRelease(v40);
      v39 = (WKTouchEventsGestureRecognizer *)self->_touchEventGestureRecognizer.m_ptr;
    }
    [(WKTouchEventsGestureRecognizer *)v39 setDelegate:self];
    [(WKContentView *)self addGestureRecognizer:self->_touchEventGestureRecognizer.m_ptr];
    [(WKContentView *)self setUpMouseGestureRecognizer];
    v41 = [[WKSyntheticTapGestureRecognizer alloc] initWithTarget:self action:sel__singleTapRecognized_];
    v42 = self->_singleTapGestureRecognizer.m_ptr;
    self->_singleTapGestureRecognizer.m_ptr = v41;
    if (v42)
    {
      CFRelease(v42);
      v41 = (WKSyntheticTapGestureRecognizer *)self->_singleTapGestureRecognizer.m_ptr;
    }
    [(WKSyntheticTapGestureRecognizer *)v41 setDelegate:self];
    [self->_singleTapGestureRecognizer.m_ptr setGestureIdentifiedTarget:self action:sel__singleTapIdentified_];
    [self->_singleTapGestureRecognizer.m_ptr setResetTarget:self action:sel__singleTapDidReset_];
    [self->_singleTapGestureRecognizer.m_ptr setSupportingTouchEventsGestureRecognizer:self->_touchEventGestureRecognizer.m_ptr];
    [(WKContentView *)self addGestureRecognizer:self->_singleTapGestureRecognizer.m_ptr];
    v43 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel__nonBlockingDoubleTapRecognized_];
    v44 = self->_nonBlockingDoubleTapGestureRecognizer.m_ptr;
    self->_nonBlockingDoubleTapGestureRecognizer.m_ptr = v43;
    if (v44)
    {
      CFRelease(v44);
      v43 = self->_nonBlockingDoubleTapGestureRecognizer.m_ptr;
    }
    [v43 setNumberOfTapsRequired:2];
    [self->_nonBlockingDoubleTapGestureRecognizer.m_ptr setDelegate:self];
    [self->_nonBlockingDoubleTapGestureRecognizer.m_ptr setEnabled:0];
    [(WKContentView *)self addGestureRecognizer:self->_nonBlockingDoubleTapGestureRecognizer.m_ptr];
    uint64_t v45 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel__doubleTapRecognizedForDoubleClick_];
    uint64_t v46 = self->_doubleTapGestureRecognizerForDoubleClick.m_ptr;
    self->_doubleTapGestureRecognizerForDoubleClick.m_ptr = v45;
    if (v46)
    {
      CFRelease(v46);
      uint64_t v45 = self->_doubleTapGestureRecognizerForDoubleClick.m_ptr;
    }
    [v45 setNumberOfTapsRequired:2];
    [self->_doubleTapGestureRecognizerForDoubleClick.m_ptr setDelegate:self];
    [(WKContentView *)self addGestureRecognizer:self->_doubleTapGestureRecognizerForDoubleClick.m_ptr];
    [(WKContentView *)self _createAndConfigureDoubleTapGestureRecognizer];
    uint64_t v47 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel__twoFingerDoubleTapRecognized_];
    CGFloat v48 = self->_twoFingerDoubleTapGestureRecognizer.m_ptr;
    self->_twoFingerDoubleTapGestureRecognizer.m_ptr = v47;
    if (v48)
    {
      CFRelease(v48);
      uint64_t v47 = self->_twoFingerDoubleTapGestureRecognizer.m_ptr;
    }
    [v47 setNumberOfTapsRequired:2];
    [self->_twoFingerDoubleTapGestureRecognizer.m_ptr setNumberOfTouchesRequired:2];
    [self->_twoFingerDoubleTapGestureRecognizer.m_ptr setDelegate:self];
    [(WKContentView *)self addGestureRecognizer:self->_twoFingerDoubleTapGestureRecognizer.m_ptr];
    [(WKContentView *)self _createAndConfigureHighlightLongPressGestureRecognizer];
    [(WKContentView *)self _createAndConfigureLongPressGestureRecognizer];
    [(WKContentView *)self _updateLongPressAndHighlightLongPressGestures];
    [(WKContentView *)self setUpDragAndDropInteractions];
    [(WKContentView *)self setUpPointerInteraction];
    [(WKContentView *)self setUpScribbleInteraction];
    CGFloat v49 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel__twoFingerSingleTapGestureRecognized_];
    CGFloat v50 = self->_twoFingerSingleTapGestureRecognizer.m_ptr;
    self->_twoFingerSingleTapGestureRecognizer.m_ptr = v49;
    if (v50)
    {
      CFRelease(v50);
      CGFloat v49 = self->_twoFingerSingleTapGestureRecognizer.m_ptr;
    }
    [v49 setAllowableMovement:60.0];
    [self->_twoFingerSingleTapGestureRecognizer.m_ptr _setAllowableSeparation:150.0];
    [self->_twoFingerSingleTapGestureRecognizer.m_ptr setNumberOfTapsRequired:1];
    [self->_twoFingerSingleTapGestureRecognizer.m_ptr setNumberOfTouchesRequired:2];
    [self->_twoFingerSingleTapGestureRecognizer.m_ptr setDelaysTouchesEnded:0];
    [self->_twoFingerSingleTapGestureRecognizer.m_ptr setDelegate:self];
    objc_msgSend(self->_twoFingerSingleTapGestureRecognizer.m_ptr, "setEnabled:", objc_msgSend(-[WKContentView webView](self, "webView"), "_isEditable") ^ 1);
    [(WKContentView *)self addGestureRecognizer:self->_twoFingerSingleTapGestureRecognizer.m_ptr];
    CGFloat v51 = [[WKTouchActionGestureRecognizer alloc] initWithTouchActionDelegate:self];
    v52 = self->_touchActionGestureRecognizer.m_ptr;
    self->_touchActionGestureRecognizer.m_ptr = v51;
    if (v52)
    {
      CFRelease(v52);
      CGFloat v51 = (WKTouchActionGestureRecognizer *)self->_touchActionGestureRecognizer.m_ptr;
    }
    [(WKContentView *)self addGestureRecognizer:v51];
    [(WKContentView *)self setUpTextSelectionAssistant];
    float v53 = [[WKScrollViewTrackingTapGestureRecognizer alloc] initWithTarget:self action:sel__keyboardDismissalGestureRecognized_];
    int v54 = self->_keyboardDismissalGestureRecognizer.m_ptr;
    self->_keyboardDismissalGestureRecognizer.m_ptr = v53;
    if (v54)
    {
      CFRelease(v54);
      float v53 = (WKScrollViewTrackingTapGestureRecognizer *)self->_keyboardDismissalGestureRecognizer.m_ptr;
    }
    [(WKScrollViewTrackingTapGestureRecognizer *)v53 setNumberOfTapsRequired:1];
    [self->_keyboardDismissalGestureRecognizer.m_ptr setDelegate:self];
    [self->_keyboardDismissalGestureRecognizer.m_ptr setName:@"Keyboard dismissal tap gesture"];
    int v56 = self->_keyboardDismissalGestureRecognizer.m_ptr;
    uint64_t v57 = *((void *)self->_page.m_ptr + 34);
    {
      WebKit::WebPreferencesKey::keyboardDismissalGestureEnabledKey(void)::$_0::operator() const(void)::impl += 2;
      WebKit::WebPreferencesKey::keyboardDismissalGestureEnabledKey(void)::keCGFloat y = (uint64_t)&WebKit::WebPreferencesKey::keyboardDismissalGestureEnabledKey(void)::$_0::operator() const(void)::impl;
    }
    objc_msgSend(v56, "setEnabled:", WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)(v57 + 40), (WTF::StringImpl **)&WebKit::WebPreferencesKey::keyboardDismissalGestureEnabledKey(void)::key, v55));
    [(WKContentView *)self addGestureRecognizer:self->_keyboardDismissalGestureRecognizer.m_ptr];
    id v59 = objc_alloc(MEMORY[0x1E4F42C48]);
    uint64_t v60 = *((void *)self->_page.m_ptr + 34);
    {
      WebKit::WebPreferencesKey::attachmentElementEnabledKey(void)::$_0::operator() const(void)::impl += 2;
      WebKit::WebPreferencesKey::attachmentElementEnabledKey(void)::keCGFloat y = (uint64_t)&WebKit::WebPreferencesKey::attachmentElementEnabledKey(void)::$_0::operator() const(void)::impl;
    }
    BoolValueForKeCGFloat y = (WebKit *)WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)(v60 + 40), (WTF::StringImpl **)&WebKit::WebPreferencesKey::attachmentElementEnabledKey(void)::key, v58);
    if (BoolValueForKey)
    {
      if (byte_1E93CF9CA == 1)
      {
        id v62 = (id)qword_1E93CF9D0;
      }
      else
      {
        id v62 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        float v73 = (WebCore::Pasteboard *)[v62 addObjectsFromArray:WebKit::supportedRichTextPasteboardTypesForPasteConfiguration((WebKit *)v62)];
        [v62 addObjectsFromArray:WebCore::Pasteboard::supportedFileUploadPasteboardTypes(v73)];
        qword_1E93CF9D0 = (uint64_t)v62;
        byte_1E93CF9CA = 1;
      }
    }
    else
    {
      id v62 = WebKit::supportedRichTextPasteboardTypesForPasteConfiguration(BoolValueForKey);
    }
    float v63 = (const void *)[v59 initWithAcceptableTypeIdentifiers:v62];
    [(WKContentView *)self setPasteConfiguration:v63];
    if (v63) {
      CFRelease(v63);
    }
    [(WKContentView *)self _registerPreview];
    float v64 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    [v64 addObserver:self selector:sel__willHideMenu_ name:*MEMORY[0x1E4F43BA8] object:0];
    [v64 addObserver:self selector:sel__keyboardDidRequestDismissal_ name:*MEMORY[0x1E4F43B20] object:0];
    float v65 = [[WKActionSheetAssistant alloc] initWithView:self];
    float v66 = self->_actionSheetAssistant.m_ptr;
    self->_actionSheetAssistant.m_ptr = v65;
    if (v66)
    {
      CFRelease(v66);
      float v65 = (WKActionSheetAssistant *)self->_actionSheetAssistant.m_ptr;
    }
    [(WKActionSheetAssistant *)v65 setDelegate:self];
    float v67 = (WebKit::SmartMagnificationController *)WTF::fastMalloc((WTF *)0x20);
    WebKit::SmartMagnificationController::SmartMagnificationController(v67, self);
    float v68 = self->_smartMagnificationController.__ptr_.__value_;
    self->_smartMagnificationController.__ptr_.__value_ = (SmartMagnificationController *)v67;
    if (v68) {
      (*(void (**)(SmartMagnificationController *))(*(void *)v68 + 8))(v68);
    }
    self->_touchEventsCanPreventNativeGestures = 1;
    HIBYTE(self->_dataListTextSuggestions.m_ptr) = 0;
    BYTE4(self->_dataListTextSuggestionsInputView.m_ptr) = 0;
    BYTE5(self->_dataListTextSuggestionsInputView.m_ptr) = 0;
    LOBYTE(self->_dataListSuggestionsControl.m_weakReference) = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"WebKitShowFastClickDebugTapHighlights");
    self->_isTapHighlightIDValid = 0;
    self->_isTapHighlightFading = 0;
    self->_isDoubleTapPending = 0;
    self->_isDisplayingContextMenuWithAnimation = 0;
    self->_showDebugTapHighlightsForFastClicking = 0;
    float v69 = *(const void **)&self->_inputViewUpdateDeferralSources.m_storage;
    *(void *)&self->_inputViewUpdateDeferralSources.m_storage = 0;
    if (v69) {
      CFRelease(v69);
    }
    float v70 = self->_keyboardScrollingAnimator.m_ptr;
    self->_keyboardScrollingAnimator.m_ptr = 0;
    if (v70) {
      CFRelease(v70);
    }
    BYTE4(self->_dataListSuggestionsControl.m_weakReference) = 1;
    WebKit::WebProcessProxy::updateTextCheckerState(*((WebKit **)self->_page.m_ptr + 32));
    WebKit::WebPageProxy::setScreenIsBeingCaptured((uint64_t)self->_page.m_ptr, [(WKContentView *)self screenIsBeingCaptured]);
    [(WKContentView *)self _setUpImageAnalysis];
    id v71 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    float v72 = self->_editDropCaretView.m_ptr;
    self->_editDropCaretView.m_ptr = v71;
    if (v72) {
      CFRelease(v72);
    }
    self->_becomingFirstResponder = 1;
  }
}

- (void)setUpScribbleInteraction
{
  double v3 = (void *)[objc_alloc(MEMORY[0x1E4F42AB0]) initWithDelegate:self];
  m_ptr = self->_scribbleInteraction.m_ptr;
  self->_scribbleInteraction.m_ptr = v3;
  if (m_ptr)
  {
    CFRelease(m_ptr);
    double v3 = self->_scribbleInteraction.m_ptr;
  }

  [(WKContentView *)self addInteraction:v3];
}

- (void)setUpPointerInteraction
{
  double v3 = (void *)[objc_alloc(MEMORY[0x1E4F42CA0]) initWithDelegate:self];
  m_ptr = self->_pointerInteraction.m_ptr;
  self->_pointerInteraction.m_ptr = v3;
  if (m_ptr)
  {
    CFRelease(m_ptr);
    double v3 = self->_pointerInteraction.m_ptr;
  }

  [(WKContentView *)self addInteraction:v3];
}

- (void)_registerPreview
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if (objc_msgSend(-[WKContentView webView](self, "webView"), "allowsLinkPreview"))
  {
    if ([(WKContentView *)self _shouldUseContextMenus])
    {
      self->_contextMenuHasRequestedLegacyData = 0;
      [self->_textInteractionWrapper.m_ptr setExternalContextMenuInteractionDelegate:self];
      uint64_t v3 = objc_msgSend((id)objc_msgSend(-[WKContentView webView](self, "webView"), "configuration"), "_clickInteractionDriverForTesting");
      if (v3)
      {
        v12[0] = v3;
        objc_msgSend((id)-[UIContextMenuInteraction presentationInteraction](-[WKContentView contextMenuInteraction](self, "contextMenuInteraction"), "presentationInteraction"), "setOverrideDrivers:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v12, 1));
      }
    }
    else
    {
      id v4 = (void *)[objc_alloc(MEMORY[0x1E4F42CF0]) initWithView:self];
      m_ptr = self->_previewItemController.m_ptr;
      self->_previewItemController.m_ptr = v4;
      if (m_ptr)
      {
        CFRelease(m_ptr);
        id v4 = self->_previewItemController.m_ptr;
      }
      [v4 setDelegate:self];
      double v6 = (void *)[self->_previewItemController.m_ptr presentationGestureRecognizer];
      double v7 = v6;
      if (v6) {
        CFRetain(v6);
      }
      CGFloat v8 = self->_previewGestureRecognizer.m_ptr;
      self->_previewGestureRecognizer.m_ptr = v7;
      if (v8) {
        CFRelease(v8);
      }
      if (objc_opt_respondsToSelector())
      {
        double v9 = (void *)[self->_previewItemController.m_ptr presentationSecondaryGestureRecognizer];
        uint64_t v10 = v9;
        if (v9) {
          CFRetain(v9);
        }
        CGFloat v11 = self->_previewSecondaryGestureRecognizer.m_ptr;
        self->_previewSecondaryGestureRecognizer.m_ptr = v10;
        if (v11)
        {
          CFRelease(v11);
        }
      }
    }
  }
}

- (void)_updateLongPressAndHighlightLongPressGestures
{
  m_ptr = self->_highlightLongPressGestureRecognizer.m_ptr;
  if ([(WKContentView *)self _shouldUseContextMenus]) {
    uint64_t v4 = objc_msgSend(-[WKContentView webView](self, "webView"), "allowsLinkPreview") ^ 1;
  }
  else {
    uint64_t v4 = 1;
  }
  [m_ptr setEnabled:v4];
  double v5 = self->_longPressGestureRecognizer.m_ptr;
  if ([(WKContentView *)self _shouldUseContextMenus]) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = objc_msgSend(-[WKContentView webView](self, "webView"), "allowsLinkPreview");
  }

  [v5 setEnabled:v6];
}

- (BOOL)_shouldUseContextMenus
{
  return WTF::linkedOnOrAfterSDKWithBehavior();
}

- (id)extendedTraitsDelegate
{
  if ([(WKContentView *)self _requiresLegacyTextInputTraits])
  {
    return [(WKContentView *)self textInputTraits];
  }
  else
  {
    if (!self->_extendedTextInputTraits.m_ptr)
    {
      uint64_t v4 = objc_opt_new();
      m_ptr = self->_extendedTextInputTraits.m_ptr;
      self->_extendedTextInputTraits.m_ptr = v4;
      if (m_ptr) {
        CFRelease(m_ptr);
      }
    }
    if ([(WKContentView *)self _hasFocusedElement] || self->_potentialTapInProgress)
    {
      if (!self->_isDoubleTapPending) {
        [(WKContentView *)self _updateTextInputTraits:self->_extendedTextInputTraits.m_ptr];
      }
    }
    else
    {
      [self->_extendedTextInputTraits.m_ptr restoreDefaultValues];
      objc_msgSend(self->_extendedTextInputTraits.m_ptr, "setSelectionColorsToMatchTintColor:", -[WKContentView _cascadeInteractionTintColor](self, "_cascadeInteractionTintColor"));
    }
    return self->_extendedTextInputTraits.m_ptr;
  }
}

- (void)_updateTextInputTraits:(id)a3
{
  p_focusedElementInformation = &self->_focusedElementInformation;
  if (self->_anon_938[113] == 3) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = [self->_formInputSession.m_ptr forceSecureTextEntry];
  }
  [a3 setSecureTextEntry:v6];
  unsigned int v7 = p_focusedElementInformation[2].elementContext.documentIdentifier.m_object[3] - 1;
  if (v7 < 7 && ((0x6Fu >> v7) & 1) != 0)
  {
    uint64_t v9 = qword_1994F8FE0[(char)v7];
  }
  else
  {
    uint64_t v8 = *(void *)&p_focusedElementInformation[2].elementContext.documentIdentifier.m_object[8];
    if (!v8 || !*(_DWORD *)(v8 + 4)) {
      goto LABEL_13;
    }
    if (p_focusedElementInformation[2].elementContext.documentIdentifier.m_object[1] == 5) {
      uint64_t v9 = 6;
    }
    else {
      uint64_t v9 = 1;
    }
  }
  [a3 setReturnKeyType:v9];
LABEL_13:
  unsigned int v10 = p_focusedElementInformation[2].elementContext.documentIdentifier.m_object[1];
  BOOL v11 = 1;
  BOOL v12 = v10 > 7;
  int v13 = (1 << v10) & 0xC8;
  if (v12 || v13 == 0)
  {
    if (!*(void *)&p_focusedElementInformation[2].elementContext.documentIdentifier.m_object[8])
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        if ((objc_opt_respondsToSelector() & 1) == 0) {
          goto LABEL_40;
        }
        goto LABEL_36;
      }
LABEL_24:
      int v16 = p_focusedElementInformation[2].elementContext.documentIdentifier.m_object[0];
      if (v16 == 4)
      {
        BOOL v11 = 0;
        uint64_t v15 = 3;
      }
      else if (v16 == 2)
      {
        BOOL v11 = 0;
        uint64_t v15 = 1;
      }
      else
      {
        BOOL v11 = 0;
        if (v16 == 1) {
          uint64_t v15 = 0;
        }
        else {
          uint64_t v15 = 2;
        }
      }
      goto LABEL_31;
    }
    BOOL v11 = WTF::StringImpl::find() != -1;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_32;
  }
  if (!v11) {
    goto LABEL_24;
  }
  uint64_t v15 = 0;
  BOOL v11 = 1;
LABEL_31:
  [a3 setAutocapitalizationType:v15];
LABEL_32:
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_40;
  }
  if (!v11)
  {
LABEL_36:
    if (LOBYTE(p_focusedElementInformation[2].elementContext.webPageIdentifier.m_value.m_identifier)) {
      uint64_t v17 = 2;
    }
    else {
      uint64_t v17 = 1;
    }
    goto LABEL_39;
  }
  uint64_t v17 = 1;
LABEL_39:
  [a3 setAutocorrectionType:v17];
LABEL_40:
  if (!BYTE2(p_focusedElementInformation[5].interactionRect.m_location.m_x))
  {
    if (objc_opt_respondsToSelector()) {
      [a3 setSmartQuotesType:1];
    }
    if (objc_opt_respondsToSelector()) {
      [a3 setSmartDashesType:1];
    }
    if (objc_opt_respondsToSelector()) {
      [a3 setSpellCheckingType:1];
    }
  }
  uint64_t v18 = 0;
  switch(p_focusedElementInformation[2].elementContext.documentIdentifier.m_object[2])
  {
    case 0u:
    case 1u:
      unint64_t v19 = (char)p_focusedElementInformation[2].elementContext.documentIdentifier.m_object[1];
      if (v19 < 0x13)
      {
        uint64_t v18 = qword_1994F9018[v19];
        goto LABEL_56;
      }
      break;
    case 2u:
      goto LABEL_56;
    case 3u:
      uint64_t v18 = 5;
      goto LABEL_56;
    case 4u:
      uint64_t v18 = 3;
      goto LABEL_56;
    case 5u:
      uint64_t v18 = 7;
      goto LABEL_56;
    case 6u:
      uint64_t v18 = 4;
      goto LABEL_56;
    case 7u:
      uint64_t v18 = 8;
      goto LABEL_56;
    case 8u:
      uint64_t v18 = 10;
LABEL_56:
      [a3 setKeyboardType:v18];
      break;
    default:
      break;
  }
  objc_msgSend(a3, "setTextContentType:", -[WKContentView contentTypeFromFieldName:](self, "contentTypeFromFieldName:", LOBYTE(p_focusedElementInformation[4].interactionRect.m_size.m_width)));
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v20 = a3;
  }
  else {
    id v20 = 0;
  }
  uint64_t v21 = (p_focusedElementInformation[2].elementContext.documentIdentifier.m_object[1] < 0x13uLL) & (0x7FFECu >> p_focusedElementInformation[2].elementContext.documentIdentifier.m_object[1]);
  if (objc_opt_respondsToSelector())
  {
    [v20 setSingleLineDocument:v21];
  }
  else if (objc_opt_respondsToSelector())
  {
    [a3 setIsSingleLineDocument:v21];
  }
  if (LOBYTE(p_focusedElementInformation[5].interactionRect.m_location.m_x))
  {
    if (objc_opt_respondsToSelector()) {
      [a3 setLearnsCorrections:0];
    }
    [v20 setTypingAdaptationEnabled:0];
  }
  if (objc_opt_respondsToSelector()) {
    [a3 setShortcutConversionType:p_focusedElementInformation[2].elementContext.documentIdentifier.m_object[1] == 3];
  }
  if (objc_msgSend((id)objc_msgSend(-[WKContentView webView](self, "webView"), "configuration"), "allowsInlinePredictions"))
  {
    BOOL v22 = 0;
  }
  else
  {
    m_ptr = self->_page.m_ptr;
    uint64_t v24 = *((void *)m_ptr + 4);
    if (!*(unsigned char *)(v24 + 576) || self->_potentialTapInProgress || *((unsigned char *)m_ptr + 1104)) {
      id v25 = (unsigned __int8 *)&p_focusedElementInformation[5].interactionRect.m_location + 3;
    }
    else {
      id v25 = (unsigned __int8 *)(v24 + 307);
    }
    BOOL v22 = *v25 == 0;
  }
  [a3 setInlinePredictionType:v22];
  [(WKContentView *)self _updateTextInputTraitsForInteractionTintColor];
}

- (void)_updateTextInputTraitsForInteractionTintColor
{
  id v3 = [(WKContentView *)self _cascadeInteractionTintColor];
  [self->_legacyTextInputTraits.m_ptr _setColorsToMatchTintColor:v3];
  m_ptr = self->_extendedTextInputTraits.m_ptr;

  [m_ptr setSelectionColorsToMatchTintColor:v3];
}

- (id)_cascadeInteractionTintColor
{
  if (objc_msgSend((id)objc_msgSend(-[WKContentView webView](self, "webView"), "configuration"), "_textInteractionGesturesEnabled"))
  {
    uint64_t v4 = *((void *)self->_page.m_ptr + 34);
    {
      WebKit::WebPreferencesKey::textInteractionEnabledKey(void)::$_0::operator() const(void)::impl += 2;
      WebKit::WebPreferencesKey::textInteractionEnabledKey(void)::keCGFloat y = (uint64_t)&WebKit::WebPreferencesKey::textInteractionEnabledKey(void)::$_0::operator() const(void)::impl;
    }
    if (WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)(v4 + 40), (WTF::StringImpl **)&WebKit::WebPreferencesKey::textInteractionEnabledKey(void)::key, v3))
    {
      uint64_t v5 = *((void *)self->_page.m_ptr + 4);
      if (*(unsigned char *)(v5 + 576))
      {
        WebCore::Color::Color((WebCore::Color *)&v17, (const Color *)(v5 + 368));
        if ((v17 & 0x4000000000000) != 0)
        {
          WebCore::cocoaColor((uint64_t *)&v16, (WebCore *)&v17, v6);
          unsigned int v7 = v16;
          int v11 = *(unsigned __int8 *)(v5 + 376);
          if ((v17 & 0x8000000000000) != 0)
          {
            uint64_t v15 = (unsigned int *)(v17 & 0xFFFFFFFFFFFFLL);
            if (atomic_fetch_add((atomic_uint *volatile)(v17 & 0xFFFFFFFFFFFFLL), 0xFFFFFFFF) == 1)
            {
              atomic_store(1u, v15);
              WTF::fastFree((WTF *)v15, v10);
            }
          }
          if (!v11) {
            return (id)(id)CFMakeCollectable(v7);
          }
LABEL_14:
          BOOL v12 = (void *)[(WKContentView *)self tintColor];
          if ([(WKContentView *)self _hasCustomTintColor])
          {
            if (v7) {
              CFRelease(v7);
            }
          }
          else
          {
            CFTypeRef v13 = (id)CFMakeCollectable(v7);
            if (v13) {
              return (id)v13;
            }
          }
          return v12;
        }
        if ((v17 & 0x8000000000000) != 0)
        {
          CGFloat v14 = (unsigned int *)(v17 & 0xFFFFFFFFFFFFLL);
          if (atomic_fetch_add((atomic_uint *volatile)(v17 & 0xFFFFFFFFFFFFLL), 0xFFFFFFFF) == 1)
          {
            atomic_store(1u, v14);
            WTF::fastFree((WTF *)v14, v6);
          }
        }
      }
      unsigned int v7 = 0;
      goto LABEL_14;
    }
  }
  uint64_t v8 = (void *)MEMORY[0x1E4F428B8];

  return (id)[v8 clearColor];
}

- (BOOL)_hasCustomTintColor
{
  p_resigningFirstResponder = &self->_resigningFirstResponder;
  if (self->_needsDeferredEndScrollingSelectionUpdate) {
    return *p_resigningFirstResponder;
  }
  uint64_t v4 = objc_opt_new();
  uint64_t v5 = (WebCore *)[v4 tintColor];
  WebCore::colorFromCocoaColor((uint64_t *)&v21, v5, v6);
  if (v4) {
    CFRelease(v4);
  }
  unsigned int v7 = (WebCore *)[(WKContentView *)self tintColor];
  WebCore::colorFromCocoaColor((uint64_t *)&v20, v7, v8);
  unint64_t v10 = v20;
  if ((v21 & 0x8000000000000) == 0)
  {
    if (v21 == v20) {
      __int16 v11 = (v20 >> 51) & 1;
    }
    else {
      __int16 v11 = 1;
    }
    *(_WORD *)p_resigningFirstResponder = v11 | 0x100;
    if ((v10 & 0x8000000000000) == 0) {
      goto LABEL_9;
    }
    uint64_t v15 = (unsigned int *)(v10 & 0xFFFFFFFFFFFFLL);
LABEL_16:
    if (atomic_fetch_add((atomic_uint *volatile)v15, 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, v15);
      WTF::fastFree((WTF *)v15, v9);
    }
    goto LABEL_9;
  }
  if ((v20 & 0x8000000000000) != 0)
  {
    BOOL v16 = 0;
    unint64_t v17 = 0;
    long long v18 = *(_OWORD *)((v21 & 0xFFFFFFFFFFFFLL) + 4);
    uint64_t v15 = (unsigned int *)(v20 & 0xFFFFFFFFFFFFLL);
    long long v22 = *(_OWORD *)((v20 & 0xFFFFFFFFFFFFLL) + 4);
    long long v23 = v18;
    do
    {
      if (*((float *)&v23 + v17) != *((float *)&v22 + v17)) {
        break;
      }
      BOOL v16 = v17++ > 2;
    }
    while (v17 != 4);
    __int16 v19 = BYTE6(v21) != BYTE6(v20);
    if (HIBYTE(v21) != HIBYTE(v20)) {
      __int16 v19 = 1;
    }
    if (!v16) {
      __int16 v19 = 1;
    }
    *(_WORD *)p_resigningFirstResponder = v19 | 0x100;
    goto LABEL_16;
  }
  *(_WORD *)p_resigningFirstResponder = 257;
LABEL_9:
  unint64_t v12 = v21;
  if ((v21 & 0x8000000000000) != 0) {
    goto LABEL_13;
  }
  while (1)
  {
    unint64_t v12 = p_resigningFirstResponder[1];
    if (p_resigningFirstResponder[1]) {
      break;
    }
    __break(1u);
LABEL_13:
    CGFloat v14 = (unsigned int *)(v12 & 0xFFFFFFFFFFFFLL);
    if (atomic_fetch_add((atomic_uint *volatile)(v12 & 0xFFFFFFFFFFFFLL), 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, v14);
      WTF::fastFree((WTF *)v14, v9);
    }
  }
  return *p_resigningFirstResponder;
}

- (id)contentTypeFromFieldName:(unsigned __int8)a3
{
  id result = 0;
  switch(a3)
  {
    case 1u:
      uint64_t v5 = (id *)MEMORY[0x1E4F43D98];
      return *v5;
    case 2u:
      uint64_t v5 = (id *)MEMORY[0x1E4F43DA0];
      return *v5;
    case 3u:
      uint64_t v5 = (id *)MEMORY[0x1E4F43D80];
      return *v5;
    case 4u:
      uint64_t v5 = (id *)MEMORY[0x1E4F43D90];
      return *v5;
    case 5u:
      uint64_t v5 = (id *)MEMORY[0x1E4F43D68];
      return *v5;
    case 6u:
      uint64_t v5 = (id *)MEMORY[0x1E4F43DA8];
      return *v5;
    case 7u:
      uint64_t v5 = (id *)MEMORY[0x1E4F43DB8];
      return *v5;
    case 8u:
    case 0x36u:
      uint64_t v5 = (id *)MEMORY[0x1E4F43E18];
      return *v5;
    case 0xBu:
      uint64_t v5 = (id *)MEMORY[0x1E4F43D88];
      return *v5;
    case 0xCu:
      uint64_t v5 = (id *)MEMORY[0x1E4F43DD0];
      return *v5;
    case 0xDu:
      uint64_t v5 = (id *)MEMORY[0x1E4F43D78];
      return *v5;
    case 0xEu:
      uint64_t v5 = (id *)MEMORY[0x1E4F43DF0];
      return *v5;
    case 0xFu:
      uint64_t v5 = (id *)MEMORY[0x1E4F43DF8];
      return *v5;
    case 0x12u:
      uint64_t v5 = (id *)MEMORY[0x1E4F43E00];
      return *v5;
    case 0x13u:
      uint64_t v5 = (id *)MEMORY[0x1E4F43D28];
      return *v5;
    case 0x14u:
      uint64_t v5 = (id *)MEMORY[0x1E4F43D30];
      return *v5;
    case 0x16u:
      uint64_t v5 = (id *)MEMORY[0x1E4F43D48];
      return *v5;
    case 0x17u:
      uint64_t v5 = (id *)MEMORY[0x1E4F43DE0];
      return *v5;
    case 0x2Au:
      uint64_t v5 = (id *)MEMORY[0x1E4F43E10];
      return *v5;
    case 0x2Cu:
      uint64_t v5 = (id *)MEMORY[0x1E4F43E08];
      return *v5;
    case 0x34u:
      uint64_t v5 = (id *)MEMORY[0x1E4F43D60];
      return *v5;
    case 0x37u:
      uint64_t v5 = (id *)MEMORY[0x1E4F43DC8];
      return *v5;
    case 0x38u:
      int shouldAllowAutoFillForCellularIdentifiers = WebKit::WebPageProxy::shouldAllowAutoFillForCellularIdentifiers((WebKit::WebPageProxy *)self->_page.m_ptr);
      unsigned int v7 = (void **)MEMORY[0x1E4F43D38];
      goto LABEL_28;
    case 0x39u:
      int shouldAllowAutoFillForCellularIdentifiers = WebKit::WebPageProxy::shouldAllowAutoFillForCellularIdentifiers((WebKit::WebPageProxy *)self->_page.m_ptr);
      unsigned int v7 = (void **)MEMORY[0x1E4F43D40];
LABEL_28:
      uint64_t v8 = *v7;
      if (shouldAllowAutoFillForCellularIdentifiers) {
        id result = v8;
      }
      else {
        id result = 0;
      }
      break;
    default:
      return result;
  }
  return result;
}

- (BOOL)_hasFocusedElement
{
  return self->_anon_938[113] != 0;
}

- (void)setUpTextSelectionAssistant
{
  m_ptr = self->_textInteractionWrapper.m_ptr;
  if (m_ptr)
  {
    [m_ptr setGestureRecognizers];
  }
  else
  {
    uint64_t v4 = [[WKTextInteractionWrapper alloc] initWithView:self];
    uint64_t v5 = self->_textInteractionWrapper.m_ptr;
    self->_textInteractionWrapper.m_ptr = v4;
    if (v5) {
      CFRelease(v5);
    }
  }
  objc_storeWeak((id *)&self->_cachedTextInteractionLoupeGestureRecognizer, 0);

  objc_storeWeak((id *)&self->_cachedTextInteractionTapGestureRecognizer, 0);
}

- (void)setUpMouseGestureRecognizer
{
  if (self->_mouseInteraction.m_ptr) {
    -[WKContentView removeInteraction:](self, "removeInteraction:");
  }
  id v3 = [[WKMouseInteraction alloc] initWithDelegate:self];
  m_ptr = self->_mouseInteraction.m_ptr;
  self->_mouseInteraction.m_ptr = v3;
  if (m_ptr)
  {
    CFRelease(m_ptr);
    id v3 = (WKMouseInteraction *)self->_mouseInteraction.m_ptr;
  }
  [(WKContentView *)self addInteraction:v3];

  [(WKContentView *)self _configureMouseGestureRecognizer];
}

- (void)setUpDragAndDropInteractions
{
  uint64_t v3 = objc_msgSend(objc_alloc(-[WKContentView _dragInteractionClass](self, "_dragInteractionClass")), "initWithDelegate:", self);
  uint64_t v4 = *(const void **)&self->_dragDropInteractionState.m_activeDragSources.m_capacity;
  *(void *)&self->_dragDropInteractionState.m_activeDragSources.m_capacitCGFloat y = v3;
  if (v4) {
    CFRelease(v4);
  }
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F429D0]) initWithDelegate:self];
  m_table = self->_dragDropInteractionState.m_defaultDropPreviews.m_impl.var0.m_table;
  self->_dragDropInteractionState.m_defaultDropPreviews.m_impl.var0.m_table = v5;
  if (m_table) {
    CFRelease(m_table);
  }
  unsigned int v7 = *(void **)&self->_dragDropInteractionState.m_activeDragSources.m_capacity;
  uint64_t v8 = objc_msgSend(-[WKContentView webView](self, "webView"), "_dragInteractionPolicy");
  if (v8 == 1)
  {
    uint64_t v9 = 1;
  }
  else if (v8 == 2)
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F42998] isEnabledByDefault];
  }
  [v7 setEnabled:v9];
  if (![(WKContentView *)self shouldUseAsyncInteractions])
  {
    unint64_t v10 = *(void **)&self->_dragDropInteractionState.m_activeDragSources.m_capacity;
    [(WKContentView *)self dragLiftDelay];
    objc_msgSend(v10, "_setLiftDelay:");
    [*(id *)&self->_dragDropInteractionState.m_activeDragSources.m_capacity _setAllowsPointerDragBeforeLiftDelay:0];
  }
  [(WKContentView *)self addInteraction:*(void *)&self->_dragDropInteractionState.m_activeDragSources.m_capacity];
  __int16 v11 = self->_dragDropInteractionState.m_defaultDropPreviews.m_impl.var0.m_table;

  [(WKContentView *)self addInteraction:v11];
}

- (Class)_dragInteractionClass
{
  [(WKContentView *)self shouldUseAsyncInteractions];

  return (Class)objc_opt_class();
}

- (BOOL)_requiresLegacyTextInputTraits
{
  p_isWaitingOnPositionInformation = &self->_isWaitingOnPositionInformation;
  if (self->_autocorrectionContextNeedsUpdate)
  {
    LOBYTE(v3) = *p_isWaitingOnPositionInformation;
  }
  else
  {
    if ([(WKContentView *)self shouldUseAsyncInteractions])
    {
      p_webView = &self->_webView;
      objc_loadWeak(&p_webView->m_weakReference);
      uint64_t v6 = objc_opt_class();
      if (v6 == objc_opt_class())
      {
        __int16 v3 = 0;
      }
      else
      {
        if (byte_1E93CF9CF == 1)
        {
          IMP MethodImplementation = (IMP)qword_1E93CFA40;
        }
        else
        {
          uint64_t v9 = (objc_class *)objc_opt_class();
          IMP MethodImplementation = class_getMethodImplementation(v9, sel__textInputTraits);
          qword_1E93CFA40 = (uint64_t)MethodImplementation;
          byte_1E93CF9CF = 1;
        }
        objc_loadWeak(&p_webView->m_weakReference);
        uint64_t v8 = (objc_class *)objc_opt_class();
        __int16 v3 = MethodImplementation != class_getMethodImplementation(v8, sel__textInputTraits);
      }
    }
    else
    {
      __int16 v3 = 1;
    }
    *(_WORD *)p_isWaitingOnPositionInformation = v3 | 0x100;
  }
  return v3;
}

- (void)_updateRuntimeProtocolConformanceIfNeeded
{
  char v2 = -[WKContentView(WKInteraction) _updateRuntimeProtocolConformanceIfNeeded]::hasUpdatedProtocolConformance;
  -[WKContentView(WKInteraction) _updateRuntimeProtocolConformanceIfNeeded]::hasUpdatedProtocolConformance = 1;
  if ((v2 & 1) == 0)
  {
    BOOL v4 = [(WKContentView *)self shouldUseAsyncInteractions];
    uint64_t v5 = qword_1EB3586B8;
    BOOL v6 = os_log_type_enabled((os_log_t)qword_1EB3586B8, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_1985F2000, v5, OS_LOG_TYPE_DEFAULT, "Conforming to BrowserEngineKit text input protocol", (uint8_t *)&v16, 2u);
      }
      unsigned int v7 = (objc_class *)objc_opt_class();
      class_addProtocol(v7, (Protocol *)&unk_1EEADC120);
    }
    else
    {
      if (v6)
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_1985F2000, v5, OS_LOG_TYPE_DEFAULT, "Conforming to legacy UIKit interaction and text input protocols", (uint8_t *)&v16, 2u);
      }
      uint64_t v8 = 0;
      BOOL v16 = &unk_1EEADC768;
      unint64_t v17 = &unk_1EEA70088;
      long long v18 = &unk_1EEA68468;
      __int16 v19 = &unk_1EEADC860;
      unint64_t v20 = &unk_1EEADC950;
      do
      {
        uint64_t v9 = *(Protocol **)((char *)&v16 + v8);
        unint64_t v10 = (objc_class *)objc_opt_class();
        class_addProtocol(v10, v9);
        v8 += 8;
      }
      while (v8 != 40);
    }
    if (![(WKContentView *)self _shouldUseUIContextMenuAsyncConfiguration])
    {
      __int16 v11 = (objc_class *)objc_opt_class();
      InstanceMethod = class_getInstanceMethod(v11, sel__internalContextMenuInteraction_configurationForMenuAtLocation_completion_);
      Implementation = method_getImplementation(InstanceMethod);
      CGFloat v14 = (objc_class *)objc_opt_class();
      TypeEncoding = method_getTypeEncoding(InstanceMethod);
      class_addMethod(v14, sel__contextMenuInteraction_configurationForMenuAtLocation_completion_, Implementation, TypeEncoding);
    }
  }
}

- (BOOL)shouldUseAsyncInteractions
{
  uint64_t v3 = *((void *)self->_page.m_ptr + 34);
  {
    WebKit::WebPreferencesKey::useAsyncUIKitInteractionsKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::useAsyncUIKitInteractionsKey(void)::keCGFloat y = (uint64_t)&WebKit::WebPreferencesKey::useAsyncUIKitInteractionsKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)(v3 + 40), (WTF::StringImpl **)&WebKit::WebPreferencesKey::useAsyncUIKitInteractionsKey(void)::key, v2);
}

- (void)_accessibilityRegisterUIProcessTokens
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F29128] UUID];
  uint64_t v5 = WebKit::newAccessibilityRemoteToken(v3, v4);
  uint64_t v6 = *((void *)self->_page.m_ptr + 32);
  uint64_t v7 = *(void *)(v6 + 136);
  if ((!v7 || !*(unsigned char *)(v7 + 104)) && *(void *)(v6 + 144))
  {
    [(WKContentView *)self _updateRemoteAccessibilityRegistration:1];
    uint64_t v8 = *(void *)(*((void *)self->_page.m_ptr + 32) + 136);
    if (v8) {
      uint64_t v9 = *(unsigned int *)(v8 + 108);
    }
    else {
      uint64_t v9 = 0;
    }
    objc_setAssociatedObject(self, (const void *)[@"ax-uuid" hash], v3, (void *)1);
    unint64_t v10 = (const void *)[@"ax-pid" hash];
    objc_setAssociatedObject(self, v10, (id)[NSNumber numberWithInt:v9], (void *)1);
    if (v5)
    {
      uint64_t v11 = [v5 bytes];
      uint64_t v12 = [v5 length];
    }
    else
    {
      uint64_t v11 = 0;
      uint64_t v12 = 0;
    }
    m_ptr = self->_page.m_ptr;
    WebKit::WebPageProxy::registerUIProcessAccessibilityTokens((uint64_t)m_ptr, v11, v12, v11, v12);
  }
}

- (void)_installVisibilityPropagationViews
{
  id v3 = [(WKContentView *)self _createVisibilityPropagationView];
  if (v3)
  {
    [(WKContentView *)self addSubview:v3];
  }
  else
  {
    [(WKContentView *)self _setupVisibilityPropagationForWebProcess];
    [(WKContentView *)self _setupVisibilityPropagationForGPUProcess];
  }
}

- (id)_createVisibilityPropagationView
{
  if (!self->_inspectorIndicationView.m_ptr)
  {
    id v3 = (void *)[MEMORY[0x1E4F28D30] weakObjectsHashTable];
    BOOL v4 = v3;
    if (v3) {
      CFRetain(v3);
    }
    m_ptr = self->_inspectorIndicationView.m_ptr;
    self->_inspectorIndicationView.m_ptr = v4;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
  }
  uint64_t v6 = objc_alloc_init(WKVisibilityPropagationView);
  [self->_inspectorIndicationView.m_ptr addObject:v6];
  [(WKContentView *)self _setupVisibilityPropagationForWebProcess];
  [(WKContentView *)self _setupVisibilityPropagationForGPUProcess];
  uint64_t v7 = (void *)CFMakeCollectable(v6);

  return v7;
}

- (void)_setupVisibilityPropagationForWebProcess
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  m_ptr = self->_page.m_ptr;
  if (!*((unsigned char *)m_ptr + 801))
  {
    if (*((unsigned char *)m_ptr + 800))
    {
      long long v11 = 0u;
      long long v12 = 0u;
      long long v9 = 0u;
      long long v10 = 0u;
      BOOL v4 = self->_inspectorIndicationView.m_ptr;
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v10;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v10 != v7) {
              objc_enumerationMutation(v4);
            }
            [*(id *)(*((void *)&v9 + 1) + 8 * i) propagateVisibilityToProcess:*((void *)self->_page.m_ptr + 32)];
          }
          uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
        }
        while (v6);
      }
    }
  }
}

- (void)_setupVisibilityPropagationForGPUProcess
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebProcessPool,&API::PageConfiguration::Data::createWebProcessPool>::get((uint64_t *)(*((void *)self->_page.m_ptr + 6) + 24))
                 + 176);
  if (v3)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    m_ptr = self->_inspectorIndicationView.m_ptr;
    uint64_t v5 = [m_ptr countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(m_ptr);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * v8++) propagateVisibilityToProcess:v3];
        }
        while (v6 != v8);
        uint64_t v6 = [m_ptr countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)WKContentViewKVOTransformContext == a6)
  {
    if (objc_msgSend(MEMORY[0x1E4F42FF0], "_isInAnimationBlock", a3, a4, a5)
      && *(unsigned char *)(*((void *)self->_page.m_ptr + 4) + 249))
    {
      [(WKContentView *)self _cancelInteraction];
      [self->_interactionViewsContainerView.m_ptr setHidden:1];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __79__WKContentView_WKInteraction__observeValueForKeyPath_ofObject_change_context___block_invoke;
      v7[3] = &unk_1E5813860;
      v7[4] = self;
      [MEMORY[0x1E4F42FF0] _addCompletion:v7];
    }
    [(WKContentView *)self _updateTapHighlight];
    if (!*(unsigned char *)(*((void *)self->_page.m_ptr + 4) + 249)
      || *(_DWORD *)&self->_keyWebEventHandlers.m_inlineBuffer[0].__lx[40])
    {
      LOBYTE(self->_dataListTextSuggestions.m_ptr) = 1;
      [(WKContentView *)self _updateChangedSelection:1];
    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)WKContentView;
    -[WKContentView observeValueForKeyPath:ofObject:change:context:](&v8, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)_updateTapHighlight
{
  if (![self->_tapHighlightView.m_ptr superview]) {
    return;
  }
  m_ptr = self->_tapHighlightView.m_ptr;
  WebCore::cocoaColor((uint64_t *)cf, (WebCore *)&self->_tapHighlightInformation.color, v3);
  [m_ptr setColor:*(void *)&cf[0].m_p1];
  m_p1 = (const void *)cf[0].m_p1;
  cf[0].m_p1 = 0;
  if (m_p1) {
    CFRelease(m_p1);
  }
  uint64_t m_size = self->_tapHighlightInformation.quads.m_size;
  if (m_size)
  {
    m_buffer = self->_tapHighlightInformation.quads.m_buffer;
    uint64_t v8 = 32 * m_size - 32;
    do
    {
      int isRectilinear = WebCore::FloatQuad::isRectilinear((WebCore::FloatQuad *)m_buffer);
      if (!isRectilinear) {
        break;
      }
      ++m_buffer;
      uint64_t v10 = v8;
      v8 -= 32;
    }
    while (v10);
  }
  else
  {
    int isRectilinear = 1;
  }
  long long v11 = (void *)[(WKContentView *)self layer];
  if (v11)
  {
    [v11 transform];
    double v12 = *(double *)&cf[0].m_p1;
    if (isRectilinear)
    {
LABEL_12:
      CFTypeRef v13 = self->_page.m_ptr;
      uint64_t v14 = 764;
      if (!*((unsigned char *)v13 + 768)) {
        uint64_t v14 = 760;
      }
      float v15 = *(float *)((char *)v13 + v14);
      BOOL v16 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:self->_tapHighlightInformation.quads.m_size];
      uint64_t v17 = self->_tapHighlightInformation.quads.m_size;
      if (!v17)
      {
        uint64_t v34 = self->_tapHighlightView.m_ptr;
        v70.m_p1 = 0;
        v70.m_p2 = 0;
        goto LABEL_36;
      }
      long long v18 = self->_tapHighlightInformation.quads.m_buffer;
      uint64_t v19 = 32 * v17;
      do
      {
        WebCore::FloatQuad::boundingBox((WebCore::FloatQuad *)v18);
        cf[0].m_p1 = (FloatPoint)__PAIR64__(v21, v20);
        cf[0].m_p2 = (FloatPoint)__PAIR64__(v23, v22);
        float v24 = v12;
        float v25 = v12;
        WebCore::FloatRect::scale((WebCore::FloatRect *)cf, v24, v25);
        cf[0].m_p1 = (FloatPoint)vadd_f32((float32x2_t)cf[0].m_p1, (float32x2_t)0xC0000000C0000000);
        cf[0].m_p2 = (FloatPoint)vadd_f32(vadd_f32((float32x2_t)cf[0].m_p2, (float32x2_t)0x4000000040000000), (float32x2_t)0x4000000040000000);
        CGRect v26 = (void *)MEMORY[0x1E4F29238];
        WebCore::encloseRectToDevicePixels((WebCore *)cf, v27, v15);
        v70.m_p1.m_CGFloat x = v28;
        v70.m_p1.m_CGFloat y = v29;
        v70.m_p2.m_CGFloat x = v30;
        v70.m_p2.m_CGFloat y = v31;
        WebCore::FloatRect::operator CGRect();
        uint64_t v32 = objc_msgSend(v26, "valueWithCGRect:");
        if (v32) {
          [v16 addObject:v32];
        }
        ++v18;
        v19 -= 32;
      }
      while (v19);
      uint64_t v33 = self->_tapHighlightInformation.quads.m_size;
      uint64_t v34 = self->_tapHighlightView.m_ptr;
      v70.m_p1 = 0;
      v70.m_p2 = 0;
      if (!v33)
      {
LABEL_36:
        [v34 setFrames:&v70];
        uint64_t v60 = (WTF *)v70.m_p1;
        if (v70.m_p1)
        {
          v70.m_p1 = 0;
          v70.m_p2.m_CGFloat x = 0.0;
LABEL_41:
          WTF::fastFree(v60, v59);
          goto LABEL_42;
        }
        goto LABEL_42;
      }
      if (!(v33 >> 28))
      {
        uint64_t v35 = WTF::fastMalloc((WTF *)(16 * v33));
        LODWORD(v70.m_p2.m_x) = v33;
        v70.m_p1 = (FloatPoint)v35;
        if (self->_tapHighlightInformation.quads.m_size)
        {
          uint64_t v36 = 0;
          unint64_t v37 = 0;
          v38 = (float32x2_t *)(v35 + 8);
          do
          {
            WebCore::FloatQuad::boundingBox((WebCore::FloatQuad *)&self->_tapHighlightInformation.quads.m_buffer[v36]);
            cf[0].m_p1 = (FloatPoint)__PAIR64__(v40, v39);
            cf[0].m_p2 = (FloatPoint)__PAIR64__(v42, v41);
            float v43 = v12;
            float v44 = v12;
            WebCore::FloatRect::scale((WebCore::FloatRect *)cf, v43, v44);
            float32x2_t v45 = vadd_f32(vadd_f32((float32x2_t)cf[0].m_p2, (float32x2_t)0x4000000040000000), (float32x2_t)0x4000000040000000);
            v38[-1] = vadd_f32((float32x2_t)cf[0].m_p1, (float32x2_t)0xC0000000C0000000);
            float32x2_t *v38 = v45;
            ++v37;
            v38 += 2;
            ++v36;
          }
          while (v37 < self->_tapHighlightInformation.quads.m_size);
          LODWORD(v70.m_p2.m_y) = v37;
        }
        goto LABEL_36;
      }
LABEL_46:
      __break(0xC471u);
      JUMPOUT(0x1986EF358);
    }
  }
  else
  {
    double v12 = 0.0;
    if (isRectilinear) {
      goto LABEL_12;
    }
  }
  BOOL v16 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:4 * self->_tapHighlightInformation.quads.m_size];
  uint64_t v46 = self->_tapHighlightInformation.quads.m_size;
  if (v46)
  {
    uint64_t v47 = self->_tapHighlightInformation.quads.m_buffer;
    float v48 = v12;
    uint64_t v49 = 32 * v46;
    float v66 = v48;
    do
    {
      cf[0] = *v47;
      *(float32x4_t *)&cf[0].m_p1.m_CGFloat x = vmulq_n_f32(*(float32x4_t *)&cf[0].m_p1.m_x, v48);
      *(float32x4_t *)&cf[0].m_p3.m_CGFloat x = vmulq_n_f32(*(float32x4_t *)&cf[0].m_p3.m_x, v48);
      inflateQuad(&v70, cf[0].m_p1.m_x, (float *)&cf[0].m_p1);
      CGFloat v50 = (void *)MEMORY[0x1E4F29238];
      WebCore::FloatPoint::operator CGPoint();
      objc_msgSend(v16, "addObject:", objc_msgSend(v50, "valueWithCGPoint:"));
      CGFloat v51 = (void *)MEMORY[0x1E4F29238];
      WebCore::FloatPoint::operator CGPoint();
      objc_msgSend(v16, "addObject:", objc_msgSend(v51, "valueWithCGPoint:"));
      v52 = (void *)MEMORY[0x1E4F29238];
      WebCore::FloatPoint::operator CGPoint();
      objc_msgSend(v16, "addObject:", objc_msgSend(v52, "valueWithCGPoint:"));
      float v53 = (void *)MEMORY[0x1E4F29238];
      WebCore::FloatPoint::operator CGPoint();
      objc_msgSend(v16, "addObject:", objc_msgSend(v53, "valueWithCGPoint:"));
      ++v47;
      v49 -= 32;
      float v48 = v66;
    }
    while (v49);
    uint64_t v54 = self->_tapHighlightInformation.quads.m_size;
    float v67 = 0;
    uint64_t v68 = 0;
    if (v54)
    {
      if (v54 >> 27) {
        goto LABEL_46;
      }
      int v55 = (WTF *)WTF::fastMalloc((WTF *)(32 * v54));
      LODWORD(v68) = v54;
      float v67 = v55;
      float v56 = v66;
      if (self->_tapHighlightInformation.quads.m_size)
      {
        uint64_t v57 = 0;
        unint64_t v58 = 0;
        do
        {
          FloatQuad v70 = self->_tapHighlightInformation.quads.m_buffer[v57];
          *(float32x4_t *)&v70.m_p1.m_CGFloat x = vmulq_n_f32(*(float32x4_t *)&v70.m_p1.m_x, v56);
          *(float32x4_t *)&v70.m_p3.m_CGFloat x = vmulq_n_f32(*(float32x4_t *)&v70.m_p3.m_x, v56);
          inflateQuad(cf, v70.m_p1.m_x, (float *)&v70.m_p1);
          float v56 = v66;
          *(FloatQuad *)((char *)v55 + v57 * 32) = cf[0];
          ++v58;
          ++v57;
        }
        while (v58 < self->_tapHighlightInformation.quads.m_size);
        HIDWORD(v68) = v58;
      }
    }
  }
  else
  {
    float v67 = 0;
    uint64_t v68 = 0;
  }
  [self->_tapHighlightView.m_ptr setQuads:&v67 boundaryRect:*((void *)self->_page.m_ptr + 4) + 2280];
  uint64_t v60 = v67;
  if (v67)
  {
    float v67 = 0;
    LODWORD(v68) = 0;
    goto LABEL_41;
  }
LABEL_42:
  if (v16) {
    CFRelease(v16);
  }
  char v61 = self->_tapHighlightView.m_ptr;
  float v62 = v12;
  v63.i64[0] = 0x4000000040000000;
  v63.i64[1] = 0x4000000040000000;
  float32x4_t v64 = vaddq_f32(vmulq_n_f32(vcvtq_f32_s32(*(int32x4_t *)&self->_tapHighlightInformation.topLeftRadius.m_width), v62), v63);
  float32x4_t v65 = vaddq_f32(vmulq_n_f32(vcvtq_f32_s32(*(int32x4_t *)&self->_tapHighlightInformation.bottomLeftRadius.m_width), v62), v63);
  *(float32x4_t *)&cf[0].m_p1.m_CGFloat x = v64;
  *(float32x4_t *)&cf[0].m_p3.m_CGFloat x = v65;
  [v61 setCornerRadii:cf];
}

- (void)_createAndConfigureHighlightLongPressGestureRecognizer
{
  uint64_t v3 = [(_UIWebHighlightLongPressGestureRecognizer *)[WKHighlightLongPressGestureRecognizer alloc] initWithTarget:self action:sel__highlightLongPressRecognized_];
  m_ptr = self->_highlightLongPressGestureRecognizer.m_ptr;
  self->_highlightLongPressGestureRecognizer.m_ptr = v3;
  if (m_ptr)
  {
    CFRelease(m_ptr);
    uint64_t v3 = (WKHighlightLongPressGestureRecognizer *)self->_highlightLongPressGestureRecognizer.m_ptr;
  }
  [(WKHighlightLongPressGestureRecognizer *)v3 setDelay:0.119999997];
  [self->_highlightLongPressGestureRecognizer.m_ptr setDelegate:self];
  uint64_t v5 = self->_highlightLongPressGestureRecognizer.m_ptr;

  [(WKContentView *)self addGestureRecognizer:v5];
}

- (void)_createAndConfigureLongPressGestureRecognizer
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F42B70]) initWithTarget:self action:sel__longPressRecognized_];
  m_ptr = self->_longPressGestureRecognizer.m_ptr;
  self->_longPressGestureRecognizer.m_ptr = v3;
  if (m_ptr)
  {
    CFRelease(m_ptr);
    uint64_t v3 = self->_longPressGestureRecognizer.m_ptr;
  }
  [v3 setDelay:0.75];
  [self->_longPressGestureRecognizer.m_ptr setDelegate:self];
  [self->_longPressGestureRecognizer.m_ptr _setRequiresQuietImpulse:1];
  uint64_t v5 = self->_longPressGestureRecognizer.m_ptr;

  [(WKContentView *)self addGestureRecognizer:v5];
}

- (void)_createAndConfigureDoubleTapGestureRecognizer
{
  if (self->_doubleTapGestureRecognizer.m_ptr)
  {
    -[WKContentView removeGestureRecognizer:](self, "removeGestureRecognizer:");
    [self->_doubleTapGestureRecognizer.m_ptr setDelegate:0];
    [self->_doubleTapGestureRecognizer.m_ptr setGestureFailedTarget:0 action:0];
  }
  uint64_t v3 = [[WKSyntheticTapGestureRecognizer alloc] initWithTarget:self action:sel__doubleTapRecognized_];
  m_ptr = self->_doubleTapGestureRecognizer.m_ptr;
  self->_doubleTapGestureRecognizer.m_ptr = v3;
  if (m_ptr)
  {
    CFRelease(m_ptr);
    uint64_t v3 = (WKSyntheticTapGestureRecognizer *)self->_doubleTapGestureRecognizer.m_ptr;
  }
  [(WKSyntheticTapGestureRecognizer *)v3 setGestureFailedTarget:self action:sel__doubleTapDidFail_];
  [self->_doubleTapGestureRecognizer.m_ptr setNumberOfTapsRequired:2];
  [self->_doubleTapGestureRecognizer.m_ptr setDelegate:self];
  [(WKContentView *)self addGestureRecognizer:self->_doubleTapGestureRecognizer.m_ptr];
  [self->_singleTapGestureRecognizer.m_ptr requireGestureRecognizerToFail:self->_doubleTapGestureRecognizer.m_ptr];
  uint64_t v5 = self->_keyboardDismissalGestureRecognizer.m_ptr;
  uint64_t v6 = self->_doubleTapGestureRecognizer.m_ptr;

  [v5 requireGestureRecognizerToFail:v6];
}

- (void)_setUpImageAnalysis
{
  if (PAL::VisionKitCoreLibrary((PAL *)1))
  {
    if (LOBYTE(self->_editDropCaretAnimator.m_ptr)) {
      LOBYTE(self->_editDropCaretAnimator.m_ptr) = 0;
    }
    self->_anon_e70[32] = 0;
    if (self->_anon_e70[0]) {
      self->_anon_e70[0] = 0;
    }
    uint64_t v3 = [[WKImageAnalysisGestureRecognizer alloc] initWithImageAnalysisGestureDelegate:self];
    id m_block = self->_actionToPerformAfterReceivingEditDragSnapshot.m_block;
    self->_actionToPerformAfterReceivingEditDragSnapshot.id m_block = v3;
    if (m_block)
    {
      CFRelease(m_block);
      uint64_t v3 = (WKImageAnalysisGestureRecognizer *)self->_actionToPerformAfterReceivingEditDragSnapshot.m_block;
    }
    [(WKContentView *)self addGestureRecognizer:v3];
    std::__optional_destruct_base<WebKit::RemoveBackgroundData,false>::reset[abi:sn180100]((uint64_t)&self->_imageAnalysisActionButtons, v5);
    LOBYTE(self->_cachedVisualSearchPreviewImageBoundsInWindowCoordinates.var0.__val_.origin.y) = 0;
    std::__optional_destruct_base<WebKit::ImageAnalysisContextMenuActionData,false>::reset[abi:sn180100]((uint64_t)&self->_cachedVisualSearchPreviewImageBoundsInWindowCoordinates.var0.__val_.size);
  }
}

- (UITextRange)selectedTextRange
{
  uint64_t v2 = *((void *)self->_page.m_ptr + 4);
  if (*(unsigned char *)(v2 + 249)) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = *(unsigned char *)(v2 + 576) == 0;
  }
  if (v3) {
    return 0;
  }
  if (!*(unsigned char *)(v2 + 704)) {
    return 0;
  }
  int v6 = *(unsigned __int8 *)(v2 + 250);
  int v7 = *(unsigned __int8 *)(v2 + 253);
  if (!(v7 | v6)) {
    return 0;
  }
  m_buffer = self->_lastSelectionDrawingInfo.selectionGeometries.m_buffer;
  if (m_buffer) {
    return (UITextRange *)m_buffer;
  }
  WebCore::FloatRect::FloatRect((WebCore::FloatRect *)v46, (const WebCore::IntRect *)(v2 + 592));
  LODWORD(v9) = v46[0];
  LODWORD(v10) = v46[1];
  LODWORD(v11) = v46[2];
  LODWORD(v12) = v46[3];
  id result = (UITextRange *)-[WKContentView _scaledCaretRectForSelectionStart:](self, "_scaledCaretRectForSelectionStart:", v9, v10, v11, v12);
  v46[4] = v13;
  v46[5] = v14;
  v46[6] = v15;
  v46[7] = v16;
  uint64_t v17 = *((void *)self->_page.m_ptr + 4);
  if (*(unsigned char *)(v17 + 704))
  {
    WebCore::FloatRect::FloatRect((WebCore::FloatRect *)v45, (const WebCore::IntRect *)(v17 + 624));
    LODWORD(v18) = v45[0];
    LODWORD(v19) = v45[1];
    LODWORD(v20) = v45[2];
    LODWORD(v21) = v45[3];
    id result = (UITextRange *)-[WKContentView _scaledCaretRectForSelectionEnd:](self, "_scaledCaretRectForSelectionEnd:", v18, v19, v20, v21);
    v45[4] = v22;
    v45[5] = v23;
    v45[6] = v24;
    v45[7] = v25;
    uint64_t v26 = *((void *)self->_page.m_ptr + 4);
    if (*(unsigned char *)(v26 + 704))
    {
      CGRect v27 = (uint64_t *)(v26 + 640);
      [(WKContentView *)self _contentZoomScale];
      id result = (UITextRange *)textSelectionRects(v27, v28);
      if (*(unsigned char *)(v2 + 576))
      {
        float v29 = result;
        uint64_t v30 = *(void *)(v2 + 280);
        WebCore::FloatRect::operator CGRect();
        double v32 = v31;
        double v34 = v33;
        double v36 = v35;
        double v38 = v37;
        WebCore::FloatRect::operator CGRect();
        float v43 = +[WKTextRange textRangeWithState:isRange:isEditable:startRect:endRect:selectionRects:selectedTextLength:](WKTextRange, "textRangeWithState:isRange:isEditable:startRect:endRect:selectionRects:selectedTextLength:", 0, v6 != 0, v7 != 0, v29, v30, v32, v34, v36, v38, v39, v40, v41, v42);
        m_buffer = (SelectionGeometry *)v43;
        if (v43) {
          CFRetain(v43);
        }
        float v44 = self->_lastSelectionDrawingInfo.selectionGeometries.m_buffer;
        self->_lastSelectionDrawingInfo.selectionGeometries.m_buffer = m_buffer;
        if (v44)
        {
          CFRelease(v44);
          return (UITextRange *)self->_lastSelectionDrawingInfo.selectionGeometries.m_buffer;
        }
        return (UITextRange *)m_buffer;
      }
    }
  }
  __break(1u);
  return result;
}

- (CGRect)selectionClipRect
{
  m_ptr = self->_page.m_ptr;
  if (*((unsigned char *)m_ptr + 1104)
    || (uint64_t v7 = *((void *)m_ptr + 4), *(unsigned char *)(v7 + 704))
    && ((int v8 = *(_DWORD *)(v7 + 620), *(int *)(v7 + 616) >= 1)
      ? (BOOL v10 = __OFSUB__(v8, 1), v9 = v8 - 1 < 0)
      : (BOOL v10 = 0, v9 = 1),
        v9 == v10))
  {
    WebCore::IntRect::operator CGRect();
  }
  else
  {
    double v3 = *MEMORY[0x1E4F1DB20];
    double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  result.size.double height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (void)page
{
  return self->_page.m_ptr;
}

- (WKContentView)initWithFrame:(CGRect)a3 processPool:(NakedRef<WebKit:(void *)a5 :(id)a6 WebProcessPool>)a4 configuration:webView:
{
  v12.receiver = self;
  v12.super_class = (Class)WKContentView;
  CGRect result = -[WKApplicationStateTrackingView initWithFrame:webView:](&v12, sel_initWithFrame_webView_, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
  {
    BOOL v10 = result;
    WebKit::InitializeWebKit2((WebKit *)result);
    double v11 = (WebKit::PageClientImpl *)WTF::fastMalloc((WTF *)0x38);
    WebKit::PageClientImpl::PageClientImpl(v11, v10, (WKWebView *)a6);
    std::unique_ptr<WebKit::PageClientImpl>::reset[abi:sn180100]((WebKit::PageClientImpl **)&v10->_anon_fb8[32], v11);
    objc_storeWeak(&v10->_webView.m_weakReference, a6);
    return (WKContentView *)[(WKContentView *)v10 _commonInitializationWithProcessPool:a4.var0 configuration:a5];
  }
  return result;
}

- (unique_ptr<WebKit::DrawingAreaProxy,)_createDrawingAreaProxy:(void *)a3
{
  double v5 = v3;
  m_ptr = self->_page.m_ptr;
  uint64_t v7 = WTF::fastMalloc((WTF *)0xF0);
  int v8 = WebKit::RemoteLayerTreeDrawingAreaProxy::RemoteLayerTreeDrawingAreaProxy((WebKit::RemoteLayerTreeDrawingAreaProxy *)v7, (WebKit::WebPageProxy *)m_ptr, (WebKit::WebProcessProxy *)a3);
  *(void *)uint64_t v7 = &unk_1EE9D1EC8;
  *(void *)(v7 + 16) = &unk_1EE9D2070;
  *(void *)(v7 + 224) = 0;
  *(_WORD *)(v7 + 232) = 0;
  uint64_t *v5 = v7;
  return (unique_ptr<WebKit::DrawingAreaProxy, std::default_delete<WebKit::DrawingAreaProxy>>)v8;
}

- (void)_configureMouseGestureRecognizer
{
  m_ptr = self->_mouseInteraction.m_ptr;
  BOOL v3 = [(WKContentView *)self shouldUseMouseGestureRecognizer];

  [m_ptr setEnabled:v3];
}

- (BOOL)shouldUseMouseGestureRecognizer
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (byte_1E93CF9C9 == 1)
  {
    char v2 = _MergedGlobals_878 != 0;
    goto LABEL_3;
  }
  int v16 = self;
  isNews = (WebCore::IOSApplication *)WebCore::IOSApplication::isNews((WebCore::IOSApplication *)self);
  if (isNews & 1) != 0 || (WebCore::IOSApplication::isStocks(isNews)) {
    goto LABEL_25;
  }
  uint64_t v5 = WTF::linkedOnOrAfterSDKWithBehavior();
  if ((v5 & 1) == 0)
  {
    isFIFACompanion = (WebCore::IOSApplication *)WebCore::IOSApplication::isFIFACompanion((WebCore::IOSApplication *)v5);
    if ((isFIFACompanion & 1) != 0
      || (isNoggin = (WebCore::IOSApplication *)WebCore::IOSApplication::isNoggin(isFIFACompanion),
          (isNoggin & 1) != 0)
      || (isOKCupid = (WebCore::IOSApplication *)WebCore::IOSApplication::isOKCupid(isNoggin),
          (isOKCupid & 1) != 0)
      || (isJWLibrarCGFloat y = (WebCore::IOSApplication *)WebCore::IOSApplication::isJWLibrary(isOKCupid),
          (isJWLibrary & 1) != 0)
      || (isPaperIO = (WebCore::IOSApplication *)WebCore::IOSApplication::isPaperIO(isJWLibrary),
          (isPaperIO & 1) != 0)
      || (WebCore::IOSApplication::isCrunchyroll(isPaperIO) & 1) != 0)
    {
      objc_super v12 = "14.2";
      goto LABEL_23;
    }
  }
  uint64_t v6 = WTF::linkedOnOrAfterSDKWithBehavior();
  if ((v6 & 1) == 0)
  {
    isPocketCitCGFloat y = (WebCore::IOSApplication *)WebCore::IOSApplication::isPocketCity((WebCore::IOSApplication *)v6);
    if ((isPocketCity & 1) != 0
      || (isEssentialSkeleton = (WebCore::IOSApplication *)WebCore::IOSApplication::isEssentialSkeleton(isPocketCity),
          (isEssentialSkeleton & 1) != 0)
      || (isESPNFantasySports = (WebCore::IOSApplication *)WebCore::IOSApplication::isESPNFantasySports(isEssentialSkeleton),
          (isESPNFantasySports & 1) != 0)
      || WebCore::IOSApplication::isDoubleDown(isESPNFantasySports))
    {
      objc_super v12 = "13.4";
LABEL_23:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        double v18 = v12;
        _os_log_error_impl(&dword_1985F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "WARNING: This application has been observed to ignore mouse events in web content; touch events will be sent u"
          "ntil it is built against the iOS %s SDK, but after that, the web content must respect mouse or pointer events "
          "in addition to touch events in order to behave correctly when a trackpad or mouse is used.",
          buf,
          0xCu);
      }
LABEL_25:
      char v2 = 0;
      goto LABEL_26;
    }
  }
  char v2 = 1;
LABEL_26:
  _MergedGlobals_878 = v2;
  byte_1E93CF9C9 = 1;
  self = v16;
LABEL_3:
  if (self->_mouseEventPolicy == 1) {
    return 0;
  }
  else {
    return v2;
  }
}

- (void)_setAcceleratedCompositingRootView:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = objc_msgSend(*(id *)&self->_anon_fb8[48], "subviews", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) removeFromSuperview];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
  [*(id *)&self->_anon_fb8[48] addSubview:a3];
}

- (void)_applicationDidBecomeActive:(id)a3
{
}

- (void)_removeVisibilityPropagationViewForWebProcess
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  m_ptr = self->_page.m_ptr;
  if (m_ptr)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    double v4 = self->_inspectorIndicationView.m_ptr;
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
          [*(id *)(*((void *)&v12 + 1) + 8 * i) stopPropagatingVisibilityToProcess:*((void *)m_ptr + 32)];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v18 count:16];
      }
      while (v6);
    }
  }
  uint64_t v9 = self->_rootContentView.m_ptr;
  if (v9)
  {
    long long v10 = qword_1EB358960;
    if (os_log_type_enabled((os_log_t)qword_1EB358960, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v17 = v9;
      _os_log_impl(&dword_1985F2000, v10, OS_LOG_TYPE_DEFAULT, "Removing visibility propagation view %p", buf, 0xCu);
      uint64_t v9 = self->_rootContentView.m_ptr;
    }
    [v9 removeFromSuperview];
    long long v11 = self->_rootContentView.m_ptr;
    self->_rootContentView.m_ptr = 0;
    if (v11) {
      CFRelease(v11);
    }
  }
}

- (void)_removeVisibilityPropagationViewForGPUProcess
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  m_ptr = self->_page.m_ptr;
  if (m_ptr)
  {
    uint64_t v4 = *(void *)(API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebProcessPool,&API::PageConfiguration::Data::createWebProcessPool>::get((uint64_t *)(*((void *)m_ptr + 6) + 24))
                   + 176);
    if (v4)
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      uint64_t v5 = self->_inspectorIndicationView.m_ptr;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v14;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v14 != v8) {
              objc_enumerationMutation(v5);
            }
            [*(id *)(*((void *)&v13 + 1) + 8 * i) stopPropagatingVisibilityToProcess:v4];
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
        }
        while (v7);
      }
    }
  }
  long long v10 = self->_fixedClippingView.m_ptr;
  if (v10)
  {
    long long v11 = qword_1EB358960;
    if (os_log_type_enabled((os_log_t)qword_1EB358960, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v18 = v10;
      _os_log_impl(&dword_1985F2000, v11, OS_LOG_TYPE_DEFAULT, "Removing visibility propagation view %p", buf, 0xCu);
      long long v10 = self->_fixedClippingView.m_ptr;
    }
    [v10 removeFromSuperview];
    long long v12 = self->_fixedClippingView.m_ptr;
    self->_fixedClippingView.m_ptr = 0;
    if (v12) {
      CFRelease(v12);
    }
  }
}

- (void)dealloc
{
  [(WKContentView *)self cleanUpInteraction];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self);
  WebKit::WebPageProxy::close((unsigned int *)self->_page.m_ptr);
  LODWORD(WebKit::WebProcessPool::statistics(void)::statistics) = WebKit::WebProcessPool::statistics(void)::statistics
                                                                - 1;
  [(WKContentView *)self _removeTemporaryFilesIfNecessary];
  v3.receiver = self;
  v3.super_class = (Class)WKContentView;
  [(WKContentView *)&v3 dealloc];
}

- (void)_removeTemporaryFilesIfNecessary
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  id v3 = objc_alloc_init(MEMORY[0x1E4F28CA0]);
  uint64_t v4 = *(unsigned int *)(a1 + 44);
  if (v4)
  {
    uint64_t v5 = *(id **)(a1 + 32);
    uint64_t v6 = 8 * v4;
    do
    {
      if (objc_msgSend(v2, "fileExistsAtPath:", objc_msgSend(*v5, "path", v9, v10, v11, v12, cf, v14)))
      {
        uint64_t v14 = 0;
        id v7 = *v5;
        uint64_t v9 = MEMORY[0x1E4F143A8];
        uint64_t v10 = 3321888768;
        long long v11 = ___ZZ49__WKContentView__removeTemporaryFilesIfNecessary_ENK3__0clEv_block_invoke;
        long long v12 = &__block_descriptor_40_e8_32c37_ZTSN3WTF9RetainPtrI13NSFileManagerEE_e15_v16__0__NSURL_8l;
        CFTypeRef cf = v2;
        if (v2) {
          CFRetain(v2);
        }
        [v3 coordinateWritingItemAtURL:v7 options:1 error:&v14 byAccessor:&v9];
        CFTypeRef v8 = cf;
        CFTypeRef cf = 0;
        if (v8) {
          CFRelease(v8);
        }
      }
      ++v5;
      v6 -= 8;
    }
    while (v6);
  }
  if (v3) {
    CFRelease(v3);
  }
  if (v2) {
    CFRelease(v2);
  }
}

- (void)_removeTemporaryDirectoriesWhenDeallocated:(void *)a3
{
  p_pendingBackgroundPrintFormattersLock = &self->_pendingBackgroundPrintFormattersLock;
  uint64_t v5 = *((unsigned int *)a3 + 3);
  unint64_t m_ptr_low = LODWORD(self->_pendingBackgroundPrintFormatters.m_ptr);
  unint64_t v7 = v5 + HIDWORD(self->_pendingBackgroundPrintFormatters.m_ptr);
  if (v7 > m_ptr_low)
  {
    unint64_t v8 = m_ptr_low + (m_ptr_low >> 2);
    if (v8 >= 0x10) {
      unint64_t v9 = v8 + 1;
    }
    else {
      unint64_t v9 = 16;
    }
    if (v9 <= v7) {
      unint64_t v10 = v7;
    }
    else {
      unint64_t v10 = v9;
    }
    WTF::Vector<WTF::RetainPtr<__SecCertificate *>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::reserveCapacity<(WTF::FailureAction)0>((uint64_t)&self->_pendingBackgroundPrintFormattersLock, v10);
    uint64_t v5 = *((unsigned int *)a3 + 3);
  }
  if (v5)
  {
    long long v11 = *(uint64_t **)a3;
    unsigned int v12 = *(_DWORD *)&p_pendingBackgroundPrintFormattersLock[12].m_byte.value.__a_.__a_value;
    uint64_t v13 = 8 * v5;
    do
    {
      uint64_t v14 = *(void *)&p_pendingBackgroundPrintFormattersLock->m_byte.value.__a_.__a_value;
      uint64_t v15 = *v11;
      *v11++ = 0;
      *(void *)(v14 + 8 * v12++) = v15;
      v13 -= 8;
    }
    while (v13);
    *(_DWORD *)&p_pendingBackgroundPrintFormattersLock[12].m_byte.value.__a_.__a_value = v12;
  }
}

- (id)rootContentView
{
  return *(id *)&self->_anon_fb8[48];
}

- (WKBrowsingContextController)browsingContextController
{
  CGRect result = *(WKBrowsingContextController **)&self->_anon_fb8[40];
  if (!result)
  {
    uint64_t v4 = [WKBrowsingContextController alloc];
    m_ptr = self->_page.m_ptr;
    if (m_ptr) {
      uint64_t v6 = *((void *)m_ptr + 1);
    }
    else {
      uint64_t v6 = 0;
    }
    CGRect result = [(WKBrowsingContextController *)v4 _initWithPageRef:v6];
    unint64_t v7 = *(const void **)&self->_anon_fb8[40];
    *(void *)&self->_anon_fb8[40] = result;
    if (v7)
    {
      CFRelease(v7);
      return *(WKBrowsingContextController **)&self->_anon_fb8[40];
    }
  }
  return result;
}

- (OpaqueWKPage)_pageRef
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr) {
    return (OpaqueWKPage *)*((void *)m_ptr + 1);
  }
  else {
    return 0;
  }
}

- (void)_showInspectorHighlight:(const void *)a3
{
  m_ptr = self->_browsingContextController.m_ptr;
  if (!m_ptr)
  {
    uint64_t v6 = [WKInspectorHighlightView alloc];
    unint64_t v7 = -[WKInspectorHighlightView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    unint64_t v8 = self->_browsingContextController.m_ptr;
    self->_browsingContextController.m_ptr = v7;
    if (v8)
    {
      CFRelease(v8);
      unint64_t v7 = (WKInspectorHighlightView *)self->_browsingContextController.m_ptr;
    }
    [(WKContentView *)self insertSubview:v7 aboveSubview:*(void *)&self->_anon_fb8[48]];
    m_ptr = self->_browsingContextController.m_ptr;
  }
  [(WKContentView *)self _contentZoomScale];
  uint64_t v9 = *((void *)self->_page.m_ptr + 4) + 2296;

  objc_msgSend(m_ptr, "update:scale:frame:", a3, v9);
}

- (void)_hideInspectorHighlight
{
  m_ptr = self->_browsingContextController.m_ptr;
  if (m_ptr)
  {
    [m_ptr removeFromSuperview];
    uint64_t v4 = self->_browsingContextController.m_ptr;
    self->_browsingContextController.m_ptr = 0;
    if (v4)
    {
      CFRelease(v4);
    }
  }
}

- (BOOL)isShowingInspectorIndication
{
  return self->_pageClient.__ptr_.__value_ != 0;
}

- (void)setShowingInspectorIndication:(BOOL)a3
{
  value = self->_pageClient.__ptr_.__value_;
  if (a3)
  {
    if (!value)
    {
      uint64_t v5 = [WKInspectorIndicationView alloc];
      [(WKContentView *)self bounds];
      uint64_t v6 = -[WKInspectorIndicationView initWithFrame:](v5, "initWithFrame:");
      unint64_t v7 = self->_pageClient.__ptr_.__value_;
      self->_pageClient.__ptr_.__value_ = v6;
      if (v7)
      {
        CFRelease(v7);
        uint64_t v6 = self->_pageClient.__ptr_.__value_;
      }
      [(PageClientImpl *)v6 setAutoresizingMask:18];
      unint64_t v8 = self->_pageClient.__ptr_.__value_;
      uint64_t v9 = *(void *)&self->_anon_fb8[48];
      [(WKContentView *)self insertSubview:v8 aboveSubview:v9];
    }
  }
  else if (value)
  {
    [(PageClientImpl *)value removeFromSuperview];
    unint64_t v10 = self->_pageClient.__ptr_.__value_;
    self->_pageClient.__ptr_.__value_ = 0;
    if (v10)
    {
      CFRelease(v10);
    }
  }
}

- (void)_didExitStableState
{
  BOOL v3 = [(WKContentView *)self shouldHideSelectionWhenScrolling];
  self->_isTapHighlightIDValid = v3;
  if (v3)
  {
    m_ptr = self->_textInteractionWrapper.m_ptr;
    [m_ptr deactivateSelection];
  }
}

- (void)didInterruptScrolling
{
  LODWORD(self->_inspectorHighlightView.m_ptr) = 0;
}

- (NSUndoManager)undoManagerForWebView
{
  if (*(unsigned char *)([(WKContentView *)self focusedElementInformation] + 361)
    && [(WKContentView *)self hasHiddenContentEditable])
  {
    p_scale = &self->_historicalKinematicData.m_positionHistory[2];
    CGRect result = *(NSUndoManager **)&self->_historicalKinematicData.m_positionHistory[2].timestamp.m_value;
    if (result) {
      return result;
    }
    uint64_t v5 = WKNSKeyEventSimulatorUndoManager;
  }
  else
  {
    p_scale = (Data *)&self->_historicalKinematicData.m_positionHistory[1].scale;
    CGRect result = *(NSUndoManager **)&self->_historicalKinematicData.m_positionHistory[1].scale;
    if (result) {
      return result;
    }
    uint64_t v5 = WKNSUndoManager;
  }
  CGRect result = (NSUndoManager *)[[v5 alloc] initWithContentView:self];
  uint64_t v6 = *(NSUndoManager **)&p_scale->timestamp.m_value;
  *(void *)&p_scale->timestamp.m_value = result;
  if (v6)
  {
    CFRelease(v6);
    return *(NSUndoManager **)&p_scale->timestamp.m_value;
  }
  return result;
}

- (int64_t)interfaceOrientation
{
  id v2 = objc_msgSend((id)-[WKContentView window](self, "window"), "windowScene");

  return [v2 interfaceOrientation];
}

- (BOOL)canBecomeFocused
{
  BOOL v3 = objc_msgSend(-[WKContentView webView](self, "webView"), "UIDelegate");
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return objc_opt_respondsToSelector() & 1;
  }
  id v4 = [(WKContentView *)self webView];

  return [v3 _webViewCanBecomeFocused:v4];
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  if ((WKContentView *)[a3 nextFocusedView] == self)
  {
    unint64_t v6 = [a3 focusHeading];
    if ((v6 & 0x10) != 0 || ([a3 focusHeading] & 0x20) != 0)
    {
      [(WKContentView *)self _becomeFirstResponderWithSelectionMovingForward:(v6 >> 4) & 1 completionHandler:0];
    }
  }
}

- (void)_windowDidMoveToScreenNotification:(id)a3
{
  id v4 = (void *)[a3 userInfo];
  uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F43F30]];

  [(WKContentView *)self _updateForScreen:v5];
}

- (void)_webViewDestroyed
{
}

- (void)_resetPrintingState
{
  char v3 = 0;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  self->_undoManager.m_ptr = 0;
  p_position = &self->_historicalKinematicData.m_positionHistory[2].position;
  atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)&self->_historicalKinematicData.m_positionHistory[2].position, (unsigned __int8 *)&v3, 1u, memory_order_acquire, memory_order_acquire);
  if (v3) {
    MEMORY[0x19972E8D0](&self->_historicalKinematicData.m_positionHistory[2].position, a2);
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  double scale = self->_historicalKinematicData.m_positionHistory[2].scale;
  uint64_t v6 = [*(id *)&scale countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(*(id *)&scale);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * i) _invalidatePrintRenderingState];
      }
      uint64_t v6 = [*(id *)&scale countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  [*(id *)&self->_historicalKinematicData.m_positionHistory[2].scale removeAllObjects];
  int v9 = 1;
  atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)p_position, (unsigned __int8 *)&v9, 0, memory_order_release, memory_order_relaxed);
  if (v9 != 1) {
    WTF::Lock::unlockSlow((WTF::Lock *)p_position);
  }
}

- (void)_processDidExit
{
  [(WKContentView *)self _updateRemoteAccessibilityRegistration:0];
  [(WKContentView *)self cleanUpInteraction];
  [(WKContentView *)self setShowingInspectorIndication:0];
  [(WKContentView *)self _hideInspectorHighlight];
  [(WKContentView *)self _removeVisibilityPropagationViewForWebProcess];

  [(WKContentView *)self _resetPrintingState];
}

- (void)_didRelaunchProcess
{
  [(WKContentView *)self _accessibilityRegisterUIProcessTokens];
  [(WKContentView *)self setUpInteraction];
  [(WKContentView *)self _setupVisibilityPropagationForWebProcess];

  [(WKContentView *)self _setupVisibilityPropagationForGPUProcess];
}

- (BOOL)_scrollToRect:(CGRect)a3 withOrigin:(CGPoint)a4 minimumScrollDistance:(double)a5
{
  CGRect v18 = a3;
  CGPoint v17 = a4;
  id Weak = objc_loadWeak(&self->_webView.m_weakReference);
  WebCore::FloatRect::FloatRect((WebCore::FloatRect *)v16, &v18);
  WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v15, &v17);
  *(float *)&double v7 = a5;
  LODWORD(v8) = v16[0];
  LODWORD(v9) = v16[1];
  LODWORD(v10) = v16[2];
  LODWORD(v11) = v16[3];
  LODWORD(v12) = v15[0];
  LODWORD(v13) = v15[1];
  return objc_msgSend(Weak, "_scrollToRect:origin:minimumScrollDistance:", v8, v9, v10, v11, v12, v13, v7);
}

- (void)_zoomToFocusRect:(CGRect)a3 selectionRect:(CGRect)a4 fontSize:(float)a5 minimumScale:(double)a6 maximumScale:(double)a7 allowScaling:(BOOL)a8 forceScroll:(BOOL)a9
{
  BOOL v9 = a9;
  BOOL v10 = a8;
  CGRect v16 = a3;
  CGRect v15 = a4;
  id Weak = objc_loadWeak(&self->_webView.m_weakReference);
  WebCore::FloatRect::FloatRect((WebCore::FloatRect *)v14, &v16);
  WebCore::FloatRect::FloatRect((WebCore::FloatRect *)v13, &v15);
  *(float *)&double v12 = a5;
  [Weak _zoomToFocusRect:v14 selectionRect:v13 fontSize:v10 minimumScale:v9 maximumScale:v12 allowScaling:a6 forceScroll:a7];
}

- (BOOL)_zoomToRect:(CGRect)a3 withOrigin:(CGPoint)a4 fitEntireRect:(BOOL)a5 minimumScale:(double)a6 maximumScale:(double)a7 minimumScrollDistance:(double)a8
{
  BOOL v10 = a5;
  CGRect v24 = a3;
  CGPoint v23 = a4;
  id Weak = objc_loadWeak(&self->_webView.m_weakReference);
  WebCore::FloatRect::FloatRect((WebCore::FloatRect *)v22, &v24);
  WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v21, &v23);
  float v12 = a8;
  LODWORD(v13) = v22[0];
  LODWORD(v14) = v22[1];
  LODWORD(v15) = v22[2];
  LODWORD(v16) = v22[3];
  LODWORD(v17) = v21[0];
  LODWORD(v18) = v21[1];
  *(float *)&uint64_t v20 = v12;
  return objc_msgSend(Weak, "_zoomToRect:withOrigin:fitEntireRect:minimumScale:maximumScale:minimumScrollDistance:", v10, v13, v14, v15, v16, v17, v18, a6, a7, v20);
}

- (void)_zoomOutWithOrigin:(CGPoint)a3
{
  CGPoint v7 = a3;
  id Weak = objc_loadWeak(&self->_webView.m_weakReference);
  WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v6, &v7);
  LODWORD(v4) = v6[0];
  LODWORD(v5) = v6[1];
  objc_msgSend(Weak, "_zoomOutWithOrigin:animated:", 1, v4, v5);
}

- (void)_zoomToInitialScaleWithOrigin:(CGPoint)a3
{
  CGPoint v7 = a3;
  id Weak = objc_loadWeak(&self->_webView.m_weakReference);
  WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v6, &v7);
  LODWORD(v4) = v6[0];
  LODWORD(v5) = v6[1];
  objc_msgSend(Weak, "_zoomToInitialScaleWithOrigin:animated:", 1, v4, v5);
}

- (double)_initialScaleFactor
{
  id Weak = objc_loadWeak(&self->_webView.m_weakReference);

  [Weak _initialScaleFactor];
  return result;
}

- (double)_contentZoomScale
{
  id Weak = objc_loadWeak(&self->_webView.m_weakReference);

  [Weak _contentZoomScale];
  return result;
}

- (double)_targetContentZoomScaleForRect:(const FloatRect *)a3 currentScale:(double)a4 fitEntireRect:(BOOL)a5 minimumScale:(double)a6 maximumScale:(double)a7
{
  BOOL v9 = a5;
  id Weak = objc_loadWeak(&self->_webView.m_weakReference);

  [Weak _targetContentZoomScaleForRect:a3 currentScale:v9 fitEntireRect:a4 minimumScale:a6 maximumScale:a7];
  return result;
}

- (void)_applicationWillResignActive:(id)a3
{
  m_ptr = self->_page.m_ptr;
  uint64_t v4 = *((void *)m_ptr + 32);
  char v5 = 0;
  WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::ApplicationWillResignActive>(v4, (uint64_t)&v5, *(void *)(*((void *)m_ptr + 4) + 1928), 0);
}

- (void)_applicationDidEnterBackground:(id)a3
{
  if (![(WKContentView *)self window])
  {
    m_ptr = self->_page.m_ptr;
    WebKit::WebPageProxy::applicationDidEnterBackgroundForMedia((WebKit::WebPageProxy *)m_ptr);
  }
}

- (void)_applicationWillEnterForeground:(id)a3
{
  if (![(WKContentView *)self window])
  {
    m_ptr = self->_page.m_ptr;
    WebKit::WebPageProxy::applicationWillEnterForegroundForMedia((WebKit::WebPageProxy *)m_ptr);
  }
}

- (void)_screenCapturedDidChange:(id)a3
{
  m_ptr = self->_page.m_ptr;
  char v4 = [(WKContentView *)self screenIsBeingCaptured];

  WebKit::WebPageProxy::setScreenIsBeingCaptured((uint64_t)m_ptr, v4);
}

- (BOOL)isResigningFirstResponder
{
  return self->_hasValidPositionInformation;
}

- (void)setSizeChangedSinceLastVisibleContentRectUpdate:(BOOL)a3
{
  LOBYTE(self->_printRenderingCallbackID.m_identifier) = a3;
}

- (void).cxx_destruct
{
  WTF::Vector<WTF::RetainPtr<__SecCertificate *>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&self->_pendingBackgroundPrintFormattersLock, (void *)a2);
  double scale = self->_historicalKinematicData.m_positionHistory[2].scale;
  self->_historicalKinematicData.m_positionHistory[2].double scale = 0.0;
  if (scale != 0.0) {
    CFRelease(*(CFTypeRef *)&scale);
  }
  double m_value = self->_historicalKinematicData.m_positionHistory[2].timestamp.m_value;
  self->_historicalKinematicData.m_positionHistory[2].timestamp.double m_value = 0.0;
  if (m_value != 0.0) {
    CFRelease(*(CFTypeRef *)&m_value);
  }
  double v5 = self->_historicalKinematicData.m_positionHistory[1].scale;
  self->_historicalKinematicData.m_positionHistory[1].double scale = 0.0;
  if (v5 != 0.0) {
    CFRelease(*(CFTypeRef *)&v5);
  }
  m_ptr = self->_inspectorIndicationView.m_ptr;
  self->_inspectorIndicationView.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  CGPoint v7 = self->_fixedClippingView.m_ptr;
  self->_fixedClippingView.m_ptr = 0;
  if (v7) {
    CFRelease(v7);
  }
  double v8 = self->_rootContentView.m_ptr;
  self->_rootContentView.m_ptr = 0;
  if (v8) {
    CFRelease(v8);
  }
  BOOL v9 = self->_browsingContextController.m_ptr;
  self->_browsingContextController.m_ptr = 0;
  if (v9) {
    CFRelease(v9);
  }
  value = self->_pageClient.__ptr_.__value_;
  self->_pageClient.__ptr_.__value_ = 0;
  if (value) {
    CFRelease(value);
  }
  asyncInputDelegate = self->_asyncInputDelegate;
  self->_asyncInputDelegate = 0;
  if (asyncInputDelegate) {
    CFRelease(asyncInputDelegate);
  }
  float v12 = *(const void **)&self->_anon_fb8[48];
  *(void *)&self->_anon_fb8[48] = 0;
  if (v12) {
    CFRelease(v12);
  }
  double v13 = *(const void **)&self->_anon_fb8[40];
  *(void *)&self->_anon_fb8[40] = 0;
  if (v13) {
    CFRelease(v13);
  }
  std::unique_ptr<WebKit::PageClientImpl>::reset[abi:sn180100]((WebKit::PageClientImpl **)&self->_anon_fb8[32], 0);
  objc_destroyWeak((id *)&self->_anon_fb8[24]);
  std::__optional_destruct_base<WebKit::RemoveBackgroundData,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)&self->_imageAnalysisActionButtons, v14);
  double v16 = self->_imageAnalysisContextMenuActionData.var0.__val_.machineReadableCodeMenu.m_ptr;
  self->_imageAnalysisContextMenuActionData.var0.__val_.machineReadableCodeMenu.m_ptr = 0;
  if (v16) {
    CFRelease(v16);
  }
  double v17 = self->_imageAnalysisContextMenuActionData.var0.__val_.copySubjectResult.m_ptr;
  self->_imageAnalysisContextMenuActionData.var0.__val_.copySubjectResult.m_ptr = 0;
  if (v17) {
    CFRelease(v17);
  }
  if (self->_dynamicImageAnalysisContextMenuState)
  {
    double v18 = *(const void **)&self->_cachedVisualSearchPreviewImageBoundsInWindowCoordinates.__engaged_;
    *(void *)&self->_cachedVisualSearchPreviewImageBoundsInWindowCoordinates.__engaged_ = 0;
    if (v18) {
      CFRelease(v18);
    }
    CGFloat height = self->_cachedVisualSearchPreviewImageBoundsInWindowCoordinates.var0.__val_.size.height;
    self->_cachedVisualSearchPreviewImageBoundsInWindowCoordinates.var0.__val_.size.CGFloat height = 0.0;
    if (height != 0.0) {
      CFRelease(*(CFTypeRef *)&height);
    }
  }
  uint64_t v20 = self->_imageAnalyzer.m_ptr;
  self->_imageAnalyzer.m_ptr = 0;
  if (v20) {
    CFRelease(v20);
  }
  double v21 = *(const void **)&self->_isProceedingWithTextSelectionInImage;
  *(void *)&self->_isProceedingWithTextSelectionInImage = 0;
  if (v21) {
    CFRelease(v21);
  }
  int v22 = *(const void **)&self->_actionsToPerformAfterPendingImageAnalysis.m_capacity;
  *(void *)&self->_actionsToPerformAfterPendingImageAnalysis.m_capacitCGFloat y = 0;
  if (v22) {
    CFRelease(v22);
  }
  m_buffer = self->_actionsToPerformAfterPendingImageAnalysis.m_buffer;
  self->_actionsToPerformAfterPendingImageAnalysis.m_buffer = 0;
  if (m_buffer) {
    CFRelease(m_buffer);
  }
  CGRect v24 = *(const void **)&self->_anon_e70[40];
  *(void *)&self->_anon_e70[40] = 0;
  if (v24) {
    CFRelease(v24);
  }
  WTF::Vector<WTF::BlockPtr<void ()(void)>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&self->_anon_e70[16], v15);
  id m_block = self->_actionToPerformAfterReceivingEditDragSnapshot.m_block;
  self->_actionToPerformAfterReceivingEditDragSnapshot.id m_block = 0;
  if (m_block) {
    CFRelease(m_block);
  }
  uint64_t v26 = self->_editDropCaretView.m_ptr;
  self->_editDropCaretView.m_ptr = 0;
  if (v26) {
    CFRelease(v26);
  }
  CGRect v27 = self->_unselectedContentSnapshot.m_ptr;
  self->_unselectedContentSnapshot.m_ptr = 0;
  if (v27) {
    CFRelease(v27);
  }
  double v28 = self->_visibleContentViewSnapshot.m_ptr;
  self->_visibleContentViewSnapshot.m_ptr = 0;
  if (v28) {
    CFRelease(v28);
  }
  _Block_release(*(const void **)&self->_isAnimatingDragCancel);
  uint64_t v30 = self->_dropInteraction.m_ptr;
  self->_dropInteraction.m_ptr = 0;
  if (v30) {
    CFRelease(v30);
  }
  double v31 = self->_dragInteraction.m_ptr;
  self->_dragInteraction.m_ptr = 0;
  if (v31) {
    CFRelease(v31);
  }
  double v32 = *(const void **)self->_anon_dc8;
  *(void *)self->_anon_dc8 = 0;
  if (v32) {
    CFRelease(v32);
  }
  m_table = self->_dragDropInteractionState.m_defaultDropPreviews.m_impl.var0.m_table;
  self->_dragDropInteractionState.m_defaultDropPreviews.m_impl.var0.m_table = 0;
  if (m_table) {
    CFRelease(m_table);
  }
  double v34 = *(const void **)&self->_dragDropInteractionState.m_activeDragSources.m_capacity;
  *(void *)&self->_dragDropInteractionState.m_activeDragSources.m_capacitCGFloat y = 0;
  if (v34) {
    CFRelease(v34);
  }
  WebKit::DragDropInteractionState::~DragDropInteractionState((WebKit::DragDropInteractionState *)&self->_pendingRunModalJavaScriptDialogCallback, v29);
  double v35 = self->_domPasteRequestHandler.m_function.m_callableWrapper.__ptr_.__value_;
  self->_domPasteRequestHandler.m_function.m_callableWrapper.__ptr_.__value_ = 0;
  if (v35) {
    CFRelease(v35);
  }
  int64_t suppressNonEditableSingleTapTextInteractionCount = self->_suppressNonEditableSingleTapTextInteractionCount;
  self->_int64_t suppressNonEditableSingleTapTextInteractionCount = 0;
  if (suppressNonEditableSingleTapTextInteractionCount) {
    (*(void (**)(int64_t))(*(void *)suppressNonEditableSingleTapTextInteractionCount + 8))(suppressNonEditableSingleTapTextInteractionCount);
  }
  unint64_t activeTextInteractionCount = self->_activeTextInteractionCount;
  self->_unint64_t activeTextInteractionCount = 0;
  if (activeTextInteractionCount) {
    (*(void (**)(unint64_t))(*(void *)activeTextInteractionCount + 8))(activeTextInteractionCount);
  }
  uint64_t v38 = *(void *)&self->_hasSetUpInteractions;
  *(void *)&self->_hasSetUpInteractions = 0;
  if (v38) {
    (*(void (**)(uint64_t))(*(void *)v38 + 8))(v38);
  }
  uint64_t v39 = *(void *)&self->_actionsToPerformAfterEditorStateUpdate.m_capacity;
  *(void *)&self->_actionsToPerformAfterEditorStateUpdate.m_capacitCGFloat y = 0;
  if (v39) {
    WTF::RefCounted<WebKit::RevealFocusedElementDeferrer>::deref(v39);
  }
  objc_destroyWeak(&self->_actionsToPerformAfterEditorStateUpdate.m_buffer);
  double v41 = self->_keyboardScrollingAnimator.m_ptr;
  self->_keyboardScrollingAnimator.m_ptr = 0;
  if (v41) {
    CFRelease(v41);
  }
  double v42 = *(const void **)&self->_inputViewUpdateDeferralSources.m_storage;
  *(void *)&self->_inputViewUpdateDeferralSources.m_storage = 0;
  if (v42) {
    CFRelease(v42);
  }
  WTF::Vector<WTF::BlockPtr<void ()(void)>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&self->_pendingPositionInformationHandlers, v40);
  positionInformationCallbackDepth = (const void *)self->_positionInformationCallbackDepth;
  self->_positionInformationCallbackDepth = 0;
  if (positionInformationCallbackDepth) {
    CFRelease(positionInformationCallbackDepth);
  }
  p_lastOutstandingPositionInformationRequest = &self->_lastOutstandingPositionInformationRequest;
  uint64_t v46 = *(unsigned int *)&self->_lastOutstandingPositionInformationRequest.var0.__val_.includeImageData;
  uint64_t v47 = *(WTF **)&self->_lastOutstandingPositionInformationRequest.var0.__null_state_;
  if (v46)
  {
    uint64_t v48 = 32 * v46;
    uint64_t v49 = (const void **)((char *)v47 + 24);
    do
    {
      if (*(unsigned char *)v49) {
        _Block_release(*(v49 - 1));
      }
      v49 += 4;
      v48 -= 32;
    }
    while (v48);
    uint64_t v47 = *(WTF **)&p_lastOutstandingPositionInformationRequest->var0.__null_state_;
  }
  if (v47)
  {
    *(void *)&p_lastOutstandingPositionInformationRequest->var0.__null_state_ = 0;
    *(_DWORD *)&self->_lastOutstandingPositionInformationRequest.var0.__val_.includeSnapshot = 0;
    WTF::fastFree(v47, v43);
  }
  CGFloat v50 = self->_lastSelectionDrawingInfo.selectionGeometries.m_buffer;
  self->_lastSelectionDrawingInfo.selectionGeometries.m_buffer = 0;
  if (v50) {
    CFRelease(v50);
  }
  CGFloat v51 = *(WTF **)&self->_lastSelectionDrawingInfo.type;
  if (v51)
  {
    *(void *)&self->_lastSelectionDrawingInfo.type = 0;
    self->_lastSelectionDrawingInfo.caretRect.m_location.m_CGFloat y = 0;
    WTF::fastFree(v51, v43);
  }
  unint64_t m_identifier = self->_layerTreeTransactionIdAtLastInteractionStart.m_identifier;
  if ((m_identifier & 0x8000000000000) != 0)
  {
    v128 = (unsigned int *)(m_identifier & 0xFFFFFFFFFFFFLL);
    if (atomic_fetch_add((atomic_uint *volatile)(m_identifier & 0xFFFFFFFFFFFFLL), 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, v128);
      WTF::fastFree((WTF *)v128, v43);
    }
  }
  WTF::Vector<WebKit::KeyEventAndCompletionBlock,1ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&self->_keyWebEventHandlers, v43);
  uint64_t v54 = self->_inputPeripheral.m_ptr;
  self->_inputPeripheral.m_ptr = 0;
  if (v54) {
    CFRelease(v54);
  }
  WebKit::FocusedElementInformation::~FocusedElementInformation((WebKit::FocusedElementInformation *)&self->_focusedElementInformation, v53);
  if (self->_positionInformationLinkIndicator.__engaged_) {
    WebCore::TextIndicatorData::~TextIndicatorData((WebCore::TextIndicatorData *)&self->_positionInformationLinkIndicator, v55);
  }
  WebKit::InteractionInformationAtPosition::~InteractionInformationAtPosition((WebKit::InteractionInformationAtPosition *)&self->_positionInformation, v55);
  uint64_t v57 = self->_autocorrectionData.font.m_ptr;
  self->_autocorrectionData.font.m_ptr = 0;
  if (v57) {
    CFRelease(v57);
  }
  p_lastAutocorrectionContext = &self->_lastAutocorrectionContext;
  id v59 = self->_lastAutocorrectionContext.contextAfter.m_impl.m_ptr;
  self->_lastAutocorrectionContext.contextAfter.m_impl.m_ptr = 0;
  if (v59)
  {
    if (*(_DWORD *)v59 == 2) {
      WTF::StringImpl::destroy((WTF::StringImpl *)v59, v56);
    }
    else {
      *(_DWORD *)v59 -= 2;
    }
  }
  uint64_t v60 = self->_lastAutocorrectionContext.selectedText.m_impl.m_ptr;
  self->_lastAutocorrectionContext.selectedText.m_impl.m_ptr = 0;
  if (v60)
  {
    if (*(_DWORD *)v60 == 2) {
      WTF::StringImpl::destroy((WTF::StringImpl *)v60, v56);
    }
    else {
      *(_DWORD *)v60 -= 2;
    }
  }
  char v61 = self->_lastAutocorrectionContext.markedText.m_impl.m_ptr;
  self->_lastAutocorrectionContext.markedText.m_impl.m_ptr = 0;
  if (v61)
  {
    if (*(_DWORD *)v61 == 2) {
      WTF::StringImpl::destroy((WTF::StringImpl *)v61, v56);
    }
    else {
      *(_DWORD *)v61 -= 2;
    }
  }
  float v62 = (WTF::StringImpl *)p_lastAutocorrectionContext->contextBefore.m_impl.m_ptr;
  p_lastAutocorrectionContext->contextBefore.m_impl.m_ptr = 0;
  if (v62)
  {
    if (*(_DWORD *)v62 == 2) {
      WTF::StringImpl::destroy(v62, v56);
    }
    else {
      *(_DWORD *)v62 -= 2;
    }
  }
  float32x4_t v63 = self->_tapHighlightInformation.quads.m_buffer;
  if (v63)
  {
    self->_tapHighlightInformation.quads.m_buffer = 0;
    self->_tapHighlightInformation.quads.m_capacitCGFloat y = 0;
    WTF::fastFree((WTF *)v63, v56);
  }
  unint64_t m_colorAndFlags = self->_tapHighlightInformation.color.m_colorAndFlags;
  if ((m_colorAndFlags & 0x8000000000000) != 0)
  {
    v129 = (unsigned int *)(m_colorAndFlags & 0xFFFFFFFFFFFFLL);
    if (atomic_fetch_add((atomic_uint *volatile)(m_colorAndFlags & 0xFFFFFFFFFFFFLL), 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, v129);
      WTF::fastFree((WTF *)v129, v56);
    }
  }
  objc_destroyWeak(&self->_inputDelegate.m_weakReference);
  float32x4_t v65 = self->_smartMagnificationController.__ptr_.__value_;
  self->_smartMagnificationController.__ptr_.__value_ = 0;
  if (v65) {
    (*(void (**)(SmartMagnificationController *))(*(void *)v65 + 8))(v65);
  }
  float v66 = self->_textAnimationManager.m_ptr;
  self->_textAnimationManager.m_ptr = 0;
  if (v66) {
    CFRelease(v66);
  }
  float v67 = self->_contextMenuInteractionTargetedPreview.m_ptr;
  self->_contextMenuInteractionTargetedPreview.m_ptr = 0;
  if (v67) {
    CFRelease(v67);
  }
  uint64_t v68 = self->_textIndicatorLayer.m_ptr;
  self->_textIndicatorLayer.m_ptr = 0;
  if (v68) {
    CFRelease(v68);
  }
  float v69 = self->_textIndicator.m_ptr;
  self->_textIndicator.m_ptr = 0;
  if (v69) {
    WTF::RefCounted<WebCore::TextIndicator>::deref((WebCore::TextIndicator *)v69);
  }
  objc_destroyWeak((id *)&self->_cachedTextInteractionTapGestureRecognizer);
  objc_destroyWeak((id *)&self->_cachedTextInteractionLoupeGestureRecognizer);
  id v71 = self->_previewItemController.m_ptr;
  self->_previewItemController.m_ptr = 0;
  if (v71) {
    CFRelease(v71);
  }
  float v72 = self->_contextMenuLegacyMenu.m_ptr;
  self->_contextMenuLegacyMenu.m_ptr = 0;
  if (v72) {
    CFRelease(v72);
  }
  float v73 = self->_contextMenuLegacyPreviewController.m_ptr;
  self->_contextMenuLegacyPreviewController.m_ptr = 0;
  if (v73) {
    CFRelease(v73);
  }
  long long v74 = self->_contextMenuElementInfo.m_ptr;
  self->_contextMenuElementInfo.m_ptr = 0;
  if (v74) {
    CFRelease(v74);
  }
  long long v75 = self->_focusStateStack.m_buffer;
  if (v75)
  {
    self->_focusStateStack.m_buffer = 0;
    self->_focusStateStack.m_capacitCGFloat y = 0;
    WTF::fastFree((WTF *)v75, v70);
  }
  long long v76 = self->_previewSecondaryGestureRecognizer.m_ptr;
  self->_previewSecondaryGestureRecognizer.m_ptr = 0;
  if (v76) {
    CFRelease(v76);
  }
  long long v77 = self->_previewGestureRecognizer.m_ptr;
  self->_previewGestureRecognizer.m_ptr = 0;
  if (v77) {
    CFRelease(v77);
  }
  float v78 = self->_contactPicker.m_ptr;
  self->_contactPicker.m_ptr = 0;
  if (v78) {
    CFRelease(v78);
  }
  uint64_t v79 = self->_shareSheet.m_ptr;
  self->_shareSheet.m_ptr = 0;
  if (v79) {
    CFRelease(v79);
  }
  uint64_t v80 = self->_frameInfoForFileUploadPanel.frameName.m_impl.m_ptr;
  self->_frameInfoForFileUploadPanel.frameName.m_impl.m_ptr = 0;
  if (v80)
  {
    if (*(_DWORD *)v80 == 2) {
      WTF::StringImpl::destroy((WTF::StringImpl *)v80, (WTF::StringImpl *)v70);
    }
    else {
      *(_DWORD *)v80 -= 2;
    }
  }
  indeCGFloat x = self->_frameInfoForFileUploadPanel.securityOrigin.m_data.__impl_.__index;
  if (index != -1) {
    ((void (*)(char *, SecurityOriginData *))off_1EEA0DE08[index])(&v130, &self->_frameInfoForFileUploadPanel.securityOrigin);
  }
  self->_frameInfoForFileUploadPanel.securityOrigin.m_data.__impl_.__indeCGFloat x = -1;
  uint64_t v82 = self->_frameInfoForFileUploadPanel.request.m_nsRequest.m_ptr;
  self->_frameInfoForFileUploadPanel.request.m_nsRequest.m_ptr = 0;
  if (v82) {
    CFRelease(v82);
  }
  WebCore::ResourceRequestBase::~ResourceRequestBase((WebCore::ResourceRequestBase *)&self->_frameInfoForFileUploadPanel.request);
  __n128 v83 = self->_fileUploadPanel.m_ptr;
  self->_fileUploadPanel.m_ptr = 0;
  if (v83) {
    CFRelease(v83);
  }
  double v84 = self->_formInputSession.m_ptr;
  self->_formInputSession.m_ptr = 0;
  if (v84) {
    CFRelease(v84);
  }
  double v85 = self->_airPlayRoutePicker.m_ptr;
  self->_airPlayRoutePicker.m_ptr = 0;
  if (v85) {
    CFRelease(v85);
  }
  double v86 = self->_actionSheetAssistant.m_ptr;
  self->_actionSheetAssistant.m_ptr = 0;
  if (v86) {
    CFRelease(v86);
  }
  v87 = self->_markedText.m_ptr;
  self->_markedText.m_ptr = 0;
  if (v87) {
    CFRelease(v87);
  }
  v88 = self->_dropPreviewContainerView.m_ptr;
  self->_dropPreviewContainerView.m_ptr = 0;
  if (v88) {
    CFRelease(v88);
  }
  long long v89 = self->_dragPreviewContainerView.m_ptr;
  self->_dragPreviewContainerView.m_ptr = 0;
  if (v89) {
    CFRelease(v89);
  }
  objc_destroyWeak(&self->_scrollViewForTargetedPreview.m_weakReference);
  long long v90 = self->_contextMenuHintContainerView.m_ptr;
  self->_contextMenuHintContainerView.m_ptr = 0;
  if (v90) {
    CFRelease(v90);
  }
  long long v91 = self->_interactionViewsContainerView.m_ptr;
  self->_interactionViewsContainerView.m_ptr = 0;
  if (v91) {
    CFRelease(v91);
  }
  FloatRect v92 = self->_tapHighlightView.m_ptr;
  self->_tapHighlightView.m_ptr = 0;
  if (v92) {
    CFRelease(v92);
  }
  long long v93 = self->_formAccessoryView.m_ptr;
  self->_formAccessoryView.m_ptr = 0;
  if (v93) {
    CFRelease(v93);
  }
  float v94 = self->_extendedTextInputTraits.m_ptr;
  self->_extendedTextInputTraits.m_ptr = 0;
  if (v94) {
    CFRelease(v94);
  }
  float v95 = self->_legacyTextInputTraits.m_ptr;
  self->_legacyTextInputTraits.m_ptr = 0;
  if (v95) {
    CFRelease(v95);
  }
  float v96 = self->_textInteractionWrapper.m_ptr;
  self->_textInteractionWrapper.m_ptr = 0;
  if (v96) {
    CFRelease(v96);
  }
  float v97 = self->_lastPointerRegion.m_ptr;
  self->_lastPointerRegion.m_ptr = 0;
  if (v97) {
    CFRelease(v97);
  }
  long long v98 = self->_pointerInteraction.m_ptr;
  self->_pointerInteraction.m_ptr = 0;
  if (v98) {
    CFRelease(v98);
  }
  long long v99 = self->_scribbleInteraction.m_ptr;
  self->_scribbleInteraction.m_ptr = 0;
  if (v99) {
    CFRelease(v99);
  }
  float v100 = self->_mouseInteraction.m_ptr;
  self->_mouseInteraction.m_ptr = 0;
  if (v100) {
    CFRelease(v100);
  }
  int v101 = self->_touchActionDownSwipeGestureRecognizer.m_ptr;
  self->_touchActionDownSwipeGestureRecognizer.m_ptr = 0;
  if (v101) {
    CFRelease(v101);
  }
  int v102 = self->_touchActionUpSwipeGestureRecognizer.m_ptr;
  self->_touchActionUpSwipeGestureRecognizer.m_ptr = 0;
  if (v102) {
    CFRelease(v102);
  }
  int v103 = self->_touchActionRightSwipeGestureRecognizer.m_ptr;
  self->_touchActionRightSwipeGestureRecognizer.m_ptr = 0;
  if (v103) {
    CFRelease(v103);
  }
  float v104 = self->_touchActionLeftSwipeGestureRecognizer.m_ptr;
  self->_touchActionLeftSwipeGestureRecognizer.m_ptr = 0;
  if (v104) {
    CFRelease(v104);
  }
  float v105 = self->_touchActionGestureRecognizer.m_ptr;
  self->_touchActionGestureRecognizer.m_ptr = 0;
  if (v105) {
    CFRelease(v105);
  }
  float v106 = self->_inspectorNodeSearchGestureRecognizer.m_ptr;
  self->_inspectorNodeSearchGestureRecognizer.m_ptr = 0;
  if (v106) {
    CFRelease(v106);
  }
  float v107 = self->_keyboardDismissalGestureRecognizer.m_ptr;
  self->_keyboardDismissalGestureRecognizer.m_ptr = 0;
  if (v107) {
    CFRelease(v107);
  }
  float v108 = self->_twoFingerSingleTapGestureRecognizer.m_ptr;
  self->_twoFingerSingleTapGestureRecognizer.m_ptr = 0;
  if (v108) {
    CFRelease(v108);
  }
  float v109 = self->_twoFingerDoubleTapGestureRecognizer.m_ptr;
  self->_twoFingerDoubleTapGestureRecognizer.m_ptr = 0;
  if (v109) {
    CFRelease(v109);
  }
  float v110 = self->_doubleTapGestureRecognizerForDoubleClick.m_ptr;
  self->_doubleTapGestureRecognizerForDoubleClick.m_ptr = 0;
  if (v110) {
    CFRelease(v110);
  }
  float v111 = self->_nonBlockingDoubleTapGestureRecognizer.m_ptr;
  self->_nonBlockingDoubleTapGestureRecognizer.m_ptr = 0;
  if (v111) {
    CFRelease(v111);
  }
  FloatPoint v112 = self->_doubleTapGestureRecognizer.m_ptr;
  self->_doubleTapGestureRecognizer.m_ptr = 0;
  if (v112) {
    CFRelease(v112);
  }
  float v113 = self->_longPressGestureRecognizer.m_ptr;
  self->_longPressGestureRecognizer.m_ptr = 0;
  if (v113) {
    CFRelease(v113);
  }
  float v114 = self->_highlightLongPressGestureRecognizer.m_ptr;
  self->_highlightLongPressGestureRecognizer.m_ptr = 0;
  if (v114) {
    CFRelease(v114);
  }
  uint64_t v115 = self->_singleTapGestureRecognizer.m_ptr;
  self->_singleTapGestureRecognizer.m_ptr = 0;
  if (v115) {
    CFRelease(v115);
  }
  uint64_t v116 = self->_touchEventGestureRecognizer.m_ptr;
  self->_touchEventGestureRecognizer.m_ptr = 0;
  if (v116) {
    CFRelease(v116);
  }
  std::unique_ptr<WebKit::GestureRecognizerConsistencyEnforcer>::reset[abi:sn180100]((WebKit::GestureRecognizerConsistencyEnforcer **)&self->_gestureRecognizerConsistencyEnforcer, 0);
  char v118 = self->_imageAnalysisDeferringGestureRecognizer.m_ptr;
  self->_imageAnalysisDeferringGestureRecognizer.m_ptr = 0;
  if (v118) {
    CFRelease(v118);
  }
  p_failedTouchStartDeferringGestures = (const void ***)&self->_failedTouchStartDeferringGestures;
  if (self->_failedTouchStartDeferringGestures.__engaged_ && *p_failedTouchStartDeferringGestures) {
    WTF::HashTable<WTF::RetainPtr<WKDeferringGestureRecognizer>,WTF::RetainPtr<WKDeferringGestureRecognizer>,WTF::IdentityExtractor,WTF::DefaultHash<WTF::RetainPtr<WKDeferringGestureRecognizer>>,WTF::HashTraits<WTF::RetainPtr<WKDeferringGestureRecognizer>>,WTF::HashTraits<WTF::RetainPtr<WKDeferringGestureRecognizer>>>::deallocateTable(*p_failedTouchStartDeferringGestures, v117);
  }
  char v120 = self->_touchMoveDeferringGestureRecognizer.m_ptr;
  self->_touchMoveDeferringGestureRecognizer.m_ptr = 0;
  if (v120) {
    CFRelease(v120);
  }
  char v121 = self->_touchEndDeferringGestureRecognizerForSyntheticTapGestures.m_ptr;
  self->_touchEndDeferringGestureRecognizerForSyntheticTapGestures.m_ptr = 0;
  if (v121) {
    CFRelease(v121);
  }
  FloatRect v122 = self->_touchEndDeferringGestureRecognizerForDelayedResettableGestures.m_ptr;
  self->_touchEndDeferringGestureRecognizerForDelayedResettableGestures.m_ptr = 0;
  if (v122) {
    CFRelease(v122);
  }
  CGRect v123 = self->_touchEndDeferringGestureRecognizerForImmediatelyResettableGestures.m_ptr;
  self->_touchEndDeferringGestureRecognizerForImmediatelyResettableGestures.m_ptr = 0;
  if (v123) {
    CFRelease(v123);
  }
  int v124 = self->_touchStartDeferringGestureRecognizerForSyntheticTapGestures.m_ptr;
  self->_touchStartDeferringGestureRecognizerForSyntheticTapGestures.m_ptr = 0;
  if (v124) {
    CFRelease(v124);
  }
  CGRect v125 = self->_touchStartDeferringGestureRecognizerForDelayedResettableGestures.m_ptr;
  self->_touchStartDeferringGestureRecognizerForDelayedResettableGestures.m_ptr = 0;
  if (v125) {
    CFRelease(v125);
  }
  CGRect v126 = self->_touchStartDeferringGestureRecognizerForImmediatelyResettableGestures.m_ptr;
  self->_touchStartDeferringGestureRecognizerForImmediatelyResettableGestures.m_ptr = 0;
  if (v126) {
    CFRelease(v126);
  }
  objc_destroyWeak(&self->_webView.m_weakReference);
  CGRect v127 = self->_page.m_ptr;
  self->_page.m_ptr = 0;
  if (v127) {
    CFRelease(*((CFTypeRef *)v127 + 1));
  }
}

- (optional<WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::FrameIdentifierType,)_frameIdentifierForPrintFormatter:(unsigned long)long
{
  double result = (optional<WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::FrameIdentifierType, WTF::ObjectIdentifierMainThreadAccessTraits<uint64_t>, unsigned long long, WTF::SupportsObjectIdentifierNullState::Yes>>> *)[a4 frameToPrint];
  if (result)
  {
    $C125566FF38F5DE1C5AF278B483AD45B var0 = result[1].var0;
  }
  else
  {
    double v8 = ($C125566FF38F5DE1C5AF278B483AD45B *)*((void *)self->_page.m_ptr + 41);
    if (!v8)
    {
      retstr->var0.__null_state_ = 0;
      goto LABEL_6;
    }
    $C125566FF38F5DE1C5AF278B483AD45B var0 = v8[17];
  }
  retstr->$C125566FF38F5DE1C5AF278B483AD45B var0 = var0;
  LOBYTE(v8) = 1;
LABEL_6:
  retstr->__engaged_ = (char)v8;
  return result;
}

- (BOOL)_wk_printFormatterRequiresMainThread
{
  return 0;
}

- (RetainPtr<_WKPrintFormattingAttributes>)_attributesForPrintFormatter:(id)a3
{
  uint64_t v6 = v3;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  char isMainRunLoop = WTF::isMainRunLoop((WTF *)self);
  [(WKContentView *)self _waitForDrawToImageCallbackForPrintFormatterIfNeeded:a3];
  [(WKContentView *)self _waitForDrawToPDFCallbackForPrintFormatterIfNeeded:a3];
  [a3 _pageContentRect:1];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  [a3 _pageContentRect:0];
  v48.origin.CGFloat x = v16;
  v48.origin.CGFloat y = v17;
  v48.size.CGFloat width = v18;
  v48.size.double height = v19;
  v44.origin.CGFloat x = v9;
  v44.origin.CGFloat y = v11;
  v44.size.CGFloat width = v13;
  v44.size.double height = v15;
  CGRect v45 = CGRectIntersection(v44, v48);
  CGFloat x = v45.origin.x;
  CGFloat y = v45.origin.y;
  CGFloat width = v45.size.width;
  double height = v45.size.height;
  v24.unint64_t var0 = (void *)CGRectIsEmpty(v45);
  if (LODWORD(v24.var0)) {
    goto LABEL_18;
  }
  *(void *)&v40[20] = 0;
  *(void *)&v40[12] = 0;
  *(_DWORD *)double v40 = 1065353216;
  unsigned int v25 = [a3 snapshotFirstPage];
  v40[28] = v25;
  if (v25)
  {
    [(WKContentView *)self bounds];
    CGFloat width = v27;
    CGFloat x = *MEMORY[0x1E4F1DAD8];
    CGFloat y = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    if (v26 <= 14400.0) {
      double height = v26;
    }
    else {
      double height = 14400.0;
    }
    objc_msgSend(a3, "_setSnapshotPaperRect:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  }
  v46.origin.CGFloat x = x;
  v46.origin.CGFloat y = y;
  v46.size.CGFloat width = width;
  v46.size.double height = height;
  float v28 = CGRectGetWidth(v46);
  *(float *)&v40[4] = v28;
  v47.origin.CGFloat x = x;
  v47.origin.CGFloat y = y;
  v47.size.CGFloat width = width;
  v47.size.double height = height;
  float v29 = CGRectGetHeight(v47);
  *(float *)&v40[8] = v29;
  long long v39 = 0uLL;
  unint64_t var0 = v25;
  if (isMainRunLoop)
  {
    if (!self
      || (v24.unint64_t var0 = [(WKContentView *)self _frameIdentifierForPrintFormatter:a3],
          !buf[16])
      || (long long v39 = *(_OWORD *)buf, (v25 & 1) == 0)
      && (v24.unint64_t var0 = (void *)WebKit::WebPageProxy::computePagesForPrintingiOS((uint64_t)self->_page.m_ptr, v39, *((uint64_t *)&v39 + 1), (uint64_t)v40), (unint64_t var0 = (unint64_t)v24.var0) == 0))
    {
LABEL_18:
      *uint64_t v6 = 0;
      return v24;
    }
  }
  else
  {
    __int16 v36 = 0;
    char v37 = 0;
    *(_OWORD *)buf = *(_OWORD *)v40;
    *(_OWORD *)&buf[13] = *(_OWORD *)&v40[13];
    uint64_t v30 = WTF::fastMalloc((WTF *)0x50);
    *(void *)uint64_t v30 = &unk_1EEA0DE28;
    *(void *)(v30 + 8) = self;
    *(void *)(v30 + 16) = a3;
    *(_OWORD *)(v30 + 24) = *(_OWORD *)buf;
    *(_OWORD *)(v30 + 37) = *(_OWORD *)&buf[13];
    *(void *)(v30 + 56) = &v39;
    *(void *)(v30 + 64) = &var0;
    *(void *)(v30 + 72) = &v36;
    uint64_t v35 = v30;
    WTF::callOnMainRunLoop();
    uint64_t v31 = v35;
    uint64_t v35 = 0;
    if (v31) {
      (*(void (**)(uint64_t))(*(void *)v31 + 8))(v31);
    }
    *(void *)buf = 0x7FF0000000000000;
    *(_DWORD *)&buf[8] = 0;
    WTF::BinarySemaphore::waitUntil();
    v24.unint64_t var0 = (void *)var0;
    if (!var0) {
      goto LABEL_18;
    }
  }
  double v32 = [_WKPrintFormattingAttributes alloc];
  v34[0] = *(_OWORD *)v40;
  v34[1] = *(_OWORD *)&v40[16];
  *uint64_t v6 = [(_WKPrintFormattingAttributes *)v32 initWithPageCount:var0 frameID:v39 printInfo:v34];
  double v33 = qword_1EB3582D0;
  v24.unint64_t var0 = (void *)os_log_type_enabled((os_log_t)qword_1EB3582D0, OS_LOG_TYPE_DEFAULT);
  if (LODWORD(v24.var0))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = var0;
    _os_log_impl(&dword_1985F2000, v33, OS_LOG_TYPE_DEFAULT, "Computed attributes for print formatter. Computed page count = %zu", buf, 0xCu);
  }
  return v24;
}

- (unint64_t)_wk_pageCountForPrintFormatter:(id)a3
{
  if (!self) {
    return 0;
  }
  [(WKContentView *)self _attributesForPrintFormatter:a3];
  if (!cf) {
    return 0;
  }
  unint64_t v3 = [cf pageCount];
  CFRelease(cf);
  return v3;
}

- (void)_createImage:(id)a3 printFormatter:(id)a4
{
  char isMainRunLoop = WTF::isMainRunLoop((WTF *)self);
  if (a3) {
    CFRetain(a3);
  }
  if (a4) {
    CFRetain(a4);
  }
  if (self) {
    CFRetain(self);
  }
  uint64_t v8 = WTF::fastMalloc((WTF *)0x28);
  *(void *)uint64_t v8 = &unk_1EEA0DE78;
  *(void *)(v8 + 8) = a3;
  *(unsigned char *)(v8 + 16) = isMainRunLoop ^ 1;
  *(void *)(v8 + 24) = a4;
  *(void *)(v8 + 32) = self;
  uint64_t v9 = v8;
  WTF::ensureOnMainRunLoop();
  if (v9) {
    (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
  }
}

- (void)_createPDF:(id)a3 printFormatter:(id)a4
{
  char isMainRunLoop = WTF::isMainRunLoop((WTF *)self);
  if (a3) {
    CFRetain(a3);
  }
  if (a4) {
    CFRetain(a4);
  }
  if (self) {
    CFRetain(self);
  }
  uint64_t v8 = WTF::fastMalloc((WTF *)0x28);
  *(void *)uint64_t v8 = &unk_1EEA0DEC8;
  *(void *)(v8 + 8) = a3;
  *(unsigned char *)(v8 + 16) = isMainRunLoop ^ 1;
  *(void *)(v8 + 24) = a4;
  *(void *)(v8 + 32) = self;
  uint64_t v9 = v8;
  WTF::ensureOnMainRunLoop();
  if (v9) {
    (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
  }
}

- (void)_waitForDrawToPDFCallbackForPrintFormatterIfNeeded:(id)a3
{
  if (WTF::isMainRunLoop((WTF *)self))
  {
    if (self->_undoManagerForSimulatingKeyEvents.m_ptr == (void *)1)
    {
      m_ptr = self->_undoManager.m_ptr;
      self->_undoManager.m_ptr = 0;
      if (m_ptr)
      {
        uint64_t v6 = *(atomic_uchar *volatile ***)(*((void *)self->_page.m_ptr + 32) + 144);
        if (!v6)
        {
          __break(0xC471u);
          goto LABEL_29;
        }
        IPC::Connection::waitForMessage(v6, 0xD4Eu, (uint64_t)m_ptr, 0, (uint64_t)&v16, INFINITY);
        int v7 = v17;
        if (v17)
        {
          if (v17 != 1)
          {
            std::__throw_bad_variant_access[abi:sn180100]();
LABEL_28:
            __break(1u);
LABEL_29:
            JUMPOUT(0x199432544);
          }
LABEL_21:
          ((void (*)(uint64_t *, uint64_t *))off_1EEA0DF08[v7])(&v15, &v16);
          return;
        }
        uint64_t v13 = *(void *)(v16 + 64);
        if (v13 == -1)
        {
          __break(0xC471u);
          JUMPOUT(0x199432564);
        }
        IPC::Connection::takeAsyncReplyHandler((os_unfair_lock_s *)v6, v13, &v15);
        if (v15)
        {
          if (v17)
          {
            std::__throw_bad_variant_access[abi:sn180100]();
            goto LABEL_28;
          }
          WTF::CompletionHandler<void ()(IPC::Decoder *)>::operator()(&v15);
          uint64_t v14 = v15;
          uint64_t v15 = 0;
          if (v14) {
            (*(void (**)(uint64_t))(*(void *)v14 + 8))(v14);
          }
        }
        int v7 = v17;
        if (v17 != -1) {
          goto LABEL_21;
        }
      }
    }
  }
  else
  {
    char v8 = 0;
    p_position = &self->_historicalKinematicData.m_positionHistory[2].position;
    atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)&self->_historicalKinematicData.m_positionHistory[2].position, (unsigned __int8 *)&v8, 1u, memory_order_acquire, memory_order_acquire);
    if (v8) {
      MEMORY[0x19972E8D0](&self->_historicalKinematicData.m_positionHistory[2].position);
    }
    int v10 = [*(id *)&self->_historicalKinematicData.m_positionHistory[2].scale containsObject:a3];
    int v11 = v10;
    int v12 = 1;
    atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)p_position, (unsigned __int8 *)&v12, 0, memory_order_release, memory_order_relaxed);
    if (v12 == 1)
    {
      if (!v10) {
        return;
      }
    }
    else
    {
      WTF::Lock::unlockSlow((WTF::Lock *)p_position);
      if (!v11) {
        return;
      }
    }
    [a3 _waitForPrintedDocumentOrImage];
  }
}

- (void)_wk_requestDocumentForPrintFormatter:(id)a3
{
  char isMainRunLoop = WTF::isMainRunLoop((WTF *)self);
  if (self)
  {
    char v6 = isMainRunLoop;
    [(WKContentView *)self _attributesForPrintFormatter:a3];
    if (cf)
    {
      if ((v6 & 1) == 0)
      {
        char v7 = 0;
        atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)&self->_historicalKinematicData.m_positionHistory[2].position, (unsigned __int8 *)&v7, 1u, memory_order_acquire, memory_order_acquire);
        if (v7) {
          MEMORY[0x19972E8D0](&self->_historicalKinematicData.m_positionHistory[2].position);
        }
        double scale = self->_historicalKinematicData.m_positionHistory[2].scale;
        if (scale == 0.0)
        {
          *(void *)&double scale = objc_alloc_init(MEMORY[0x1E4F1CA80]);
          double v9 = self->_historicalKinematicData.m_positionHistory[2].scale;
          self->_historicalKinematicData.m_positionHistory[2].double scale = scale;
          if (v9 != 0.0)
          {
            CFRelease(*(CFTypeRef *)&v9);
            double scale = self->_historicalKinematicData.m_positionHistory[2].scale;
          }
        }
        [*(id *)&scale addObject:a3];
        int v10 = 1;
        atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)&self->_historicalKinematicData.m_positionHistory[2].position, (unsigned __int8 *)&v10, 0, memory_order_release, memory_order_relaxed);
        if (v10 != 1) {
          WTF::Lock::unlockSlow((WTF::Lock *)&self->_historicalKinematicData.m_positionHistory[2].position);
        }
      }
      [(WKContentView *)self _createPDF:cf printFormatter:a3];
      [(WKContentView *)self _waitForDrawToPDFCallbackForPrintFormatterIfNeeded:a3];
      CFRelease(cf);
    }
  }
}

- (void)_waitForDrawToImageCallbackForPrintFormatterIfNeeded:(id)a3
{
  if (WTF::isMainRunLoop((WTF *)self))
  {
    if (!self->_undoManagerForSimulatingKeyEvents.m_ptr)
    {
      m_ptr = self->_undoManager.m_ptr;
      self->_undoManager.m_ptr = 0;
      if (m_ptr)
      {
        char v6 = *(atomic_uchar *volatile ***)(*((void *)self->_page.m_ptr + 32) + 144);
        if (!v6)
        {
          __break(0xC471u);
          goto LABEL_29;
        }
        IPC::Connection::waitForMessage(v6, 0xD4Bu, (uint64_t)m_ptr, 0, (uint64_t)&v16, INFINITY);
        int v7 = v17;
        if (v17)
        {
          if (v17 != 1)
          {
            std::__throw_bad_variant_access[abi:sn180100]();
LABEL_28:
            __break(1u);
LABEL_29:
            JUMPOUT(0x199432934);
          }
LABEL_21:
          ((void (*)(uint64_t *, uint64_t *))off_1EEA0DF08[v7])(&v15, &v16);
          return;
        }
        uint64_t v13 = *(void *)(v16 + 64);
        if (v13 == -1)
        {
          __break(0xC471u);
          JUMPOUT(0x199432954);
        }
        IPC::Connection::takeAsyncReplyHandler((os_unfair_lock_s *)v6, v13, &v15);
        if (v15)
        {
          if (v17)
          {
            std::__throw_bad_variant_access[abi:sn180100]();
            goto LABEL_28;
          }
          WTF::CompletionHandler<void ()(IPC::Decoder *)>::operator()(&v15);
          uint64_t v14 = v15;
          uint64_t v15 = 0;
          if (v14) {
            (*(void (**)(uint64_t))(*(void *)v14 + 8))(v14);
          }
        }
        int v7 = v17;
        if (v17 != -1) {
          goto LABEL_21;
        }
      }
    }
  }
  else
  {
    char v8 = 0;
    p_position = &self->_historicalKinematicData.m_positionHistory[2].position;
    atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)&self->_historicalKinematicData.m_positionHistory[2].position, (unsigned __int8 *)&v8, 1u, memory_order_acquire, memory_order_acquire);
    if (v8) {
      MEMORY[0x19972E8D0](&self->_historicalKinematicData.m_positionHistory[2].position);
    }
    int v10 = [*(id *)&self->_historicalKinematicData.m_positionHistory[2].scale containsObject:a3];
    int v11 = v10;
    int v12 = 1;
    atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)p_position, (unsigned __int8 *)&v12, 0, memory_order_release, memory_order_relaxed);
    if (v12 == 1)
    {
      if (!v10) {
        return;
      }
    }
    else
    {
      WTF::Lock::unlockSlow((WTF::Lock *)p_position);
      if (!v11) {
        return;
      }
    }
    [a3 _waitForPrintedDocumentOrImage];
  }
}

- (void)_wk_requestImageForPrintFormatter:(id)a3
{
  char isMainRunLoop = WTF::isMainRunLoop((WTF *)self);
  if (self)
  {
    char v6 = isMainRunLoop;
    [(WKContentView *)self _attributesForPrintFormatter:a3];
    if (cf)
    {
      if ((v6 & 1) == 0)
      {
        char v7 = 0;
        atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)&self->_historicalKinematicData.m_positionHistory[2].position, (unsigned __int8 *)&v7, 1u, memory_order_acquire, memory_order_acquire);
        if (v7) {
          MEMORY[0x19972E8D0](&self->_historicalKinematicData.m_positionHistory[2].position);
        }
        double scale = self->_historicalKinematicData.m_positionHistory[2].scale;
        if (scale == 0.0)
        {
          *(void *)&double scale = objc_alloc_init(MEMORY[0x1E4F1CA80]);
          double v9 = self->_historicalKinematicData.m_positionHistory[2].scale;
          self->_historicalKinematicData.m_positionHistory[2].double scale = scale;
          if (v9 != 0.0)
          {
            CFRelease(*(CFTypeRef *)&v9);
            double scale = self->_historicalKinematicData.m_positionHistory[2].scale;
          }
        }
        [*(id *)&scale addObject:a3];
        int v10 = 1;
        atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)&self->_historicalKinematicData.m_positionHistory[2].position, (unsigned __int8 *)&v10, 0, memory_order_release, memory_order_relaxed);
        if (v10 != 1) {
          WTF::Lock::unlockSlow((WTF::Lock *)&self->_historicalKinematicData.m_positionHistory[2].position);
        }
      }
      [(WKContentView *)self _createImage:cf printFormatter:a3];
      [(WKContentView *)self _waitForDrawToImageCallbackForPrintFormatterIfNeeded:a3];
      CFRelease(cf);
    }
  }
}

- (uint64_t)_removeTemporaryFilesIfNecessary
{
  return WTF::Vector<WTF::RetainPtr<__SecCertificate *>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector(a1 + 32, a2);
}

- (BOOL)preventsPanningInXAxis
{
  return self->_preventsPanningInXAxis;
}

- (BOOL)preventsPanningInYAxis
{
  return self->_preventsPanningInYAxis;
}

- (id)_formInputSession
{
  return self->_formInputSession.m_ptr;
}

- (BOOL)_shouldUseTextCursorDragAnimator
{
  return 1;
}

- (void)cleanUpInteraction
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  if (self->_becomingFirstResponder)
  {
    m_ptr = self->_textInteractionWrapper.m_ptr;
    self->_textInteractionWrapper.m_ptr = 0;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    [self->_actionSheetAssistant.m_ptr cleanupSheet];
    char v4 = self->_actionSheetAssistant.m_ptr;
    self->_actionSheetAssistant.m_ptr = 0;
    if (v4) {
      CFRelease(v4);
    }
    value = self->_smartMagnificationController.__ptr_.__value_;
    self->_smartMagnificationController.__ptr_.__value_ = 0;
    if (value) {
      (*(void (**)(SmartMagnificationController *))(*(void *)value + 8))(value);
    }
    BYTE6(self->_dataListTextSuggestions.m_ptr) = 0;
    BYTE5(self->_dataListTextSuggestions.m_ptr) = 0;
    HIBYTE(self->_dataListTextSuggestions.m_ptr) = 0;
    self->_isTapHighlightIDValid = 0;
    [self->_formInputSession.m_ptr invalidate];
    char v6 = self->_formInputSession.m_ptr;
    self->_formInputSession.m_ptr = 0;
    if (v6) {
      CFRelease(v6);
    }
    [self->_tapHighlightView.m_ptr removeFromSuperview];
    if (LOBYTE(self->_lastSelectionDrawingInfo.selectionClipRect.m_size.m_width)) {
      LOBYTE(self->_lastSelectionDrawingInfo.selectionClipRect.m_size.m_width) = 0;
    }
    BYTE3(self->_dataListSuggestionsControl.m_weakReference) = 0;
    self->_textInteractionDidChangeFocusedElement = 0;
    char v8 = self->_domPasteRequestHandler.m_function.m_callableWrapper.__ptr_.__value_;
    self->_domPasteRequestHandler.m_function.m_callableWrapper.__ptr_.__value_ = 0;
    if (v8) {
      CFRelease(v8);
    }
    self->_treatAsContentEditableUntilNextEditorStateUpdate = 0;
    BYTE4(self->_dataListSuggestionsControl.m_weakReference) = 1;
    double v9 = self->_lastAutocorrectionContext.contextBefore.m_impl.m_ptr;
    self->_lastAutocorrectionContext.contextBefore.m_impl.m_ptr = 0;
    if (v9)
    {
      if (*(_DWORD *)v9 == 2) {
        WTF::StringImpl::destroy((WTF::StringImpl *)v9, v7);
      }
      else {
        *(_DWORD *)v9 -= 2;
      }
    }
    int v10 = self->_lastAutocorrectionContext.markedText.m_impl.m_ptr;
    self->_lastAutocorrectionContext.markedText.m_impl.m_ptr = 0;
    if (v10)
    {
      if (*(_DWORD *)v10 == 2) {
        WTF::StringImpl::destroy((WTF::StringImpl *)v10, v7);
      }
      else {
        *(_DWORD *)v10 -= 2;
      }
    }
    int v11 = self->_lastAutocorrectionContext.selectedText.m_impl.m_ptr;
    self->_lastAutocorrectionContext.selectedText.m_impl.m_ptr = 0;
    if (v11)
    {
      if (*(_DWORD *)v11 == 2) {
        WTF::StringImpl::destroy((WTF::StringImpl *)v11, v7);
      }
      else {
        *(_DWORD *)v11 -= 2;
      }
    }
    int v12 = self->_lastAutocorrectionContext.contextAfter.m_impl.m_ptr;
    self->_lastAutocorrectionContext.contextAfter.m_impl.m_ptr = 0;
    if (v12)
    {
      if (*(_DWORD *)v12 == 2) {
        WTF::StringImpl::destroy((WTF::StringImpl *)v12, v7);
      }
      else {
        *(_DWORD *)v12 -= 2;
      }
    }
    self->_lastAutocorrectionContext.selectedRangeInMarkedText = (EditingRange)xmmword_1994F6020;
    BYTE6(self->_revealFocusedElementDeferrer.m_ptr) = 0;
    HIBYTE(self->_revealFocusedElementDeferrer.m_ptr) = 0;
    BYTE1(self->_dataListSuggestionsControl.m_weakReference) = 0;
    *(void *)&self->_isUpdatingAccessoryView = 0;
    BYTE2(self->_dataListSuggestionsControl.m_weakReference) = 0;
    self->_isChangingFocusUsingAccessoryTab = 0;
    self->_didAccessoryTabInitiateFocus = 0;
    self->_isExpectingFastSingleTapCommit = 0;
    BYTE3(self->_dataListTextSuggestions.m_ptr) = 0;
    if (self->_interactionViewsContainerView.m_ptr)
    {
      uint64_t v13 = (void *)[(WKContentView *)self layer];
      [v13 removeObserver:self forKeyPath:@"transform" context:WKContentViewKVOTransformContext];
      [self->_interactionViewsContainerView.m_ptr removeFromSuperview];
      uint64_t v14 = self->_interactionViewsContainerView.m_ptr;
      self->_interactionViewsContainerView.m_ptr = 0;
      if (v14) {
        CFRelease(v14);
      }
    }
    self->_shouldRestoreSelection = 0;
    if (*((unsigned char *)&self->_domPasteRequestCategory + 4)) {
      *((unsigned char *)&self->_domPasteRequestCategory + 4) = 0;
    }
    [self->_touchEventGestureRecognizer.m_ptr setDelegate:0];
    [(WKContentView *)self removeGestureRecognizer:self->_touchEventGestureRecognizer.m_ptr];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v15 = [(WKContentView *)self deferringGestures];
    uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v30 objects:v74 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v31 != v17) {
            objc_enumerationMutation(v15);
          }
          CGFloat v19 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          [v19 setDelegate:0];
          [(WKContentView *)self removeGestureRecognizer:v19];
        }
        uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v30 objects:v74 count:16];
      }
      while (v16);
    }
    uint64_t v20 = self->_gestureRecognizerConsistencyEnforcer.__ptr_.__value_;
    if (v20) {
      WebKit::GestureRecognizerConsistencyEnforcer::reset((WebKit::GestureRecognizerConsistencyEnforcer *)v20);
    }
    [(WKContentView *)self removeInteraction:self->_mouseInteraction.m_ptr];
    [self->_keyboardDismissalGestureRecognizer.m_ptr setDelegate:0];
    [(WKContentView *)self removeGestureRecognizer:self->_keyboardDismissalGestureRecognizer.m_ptr];
    [self->_singleTapGestureRecognizer.m_ptr setDelegate:0];
    [self->_singleTapGestureRecognizer.m_ptr setGestureIdentifiedTarget:0 action:0];
    [self->_singleTapGestureRecognizer.m_ptr setResetTarget:0 action:0];
    [self->_singleTapGestureRecognizer.m_ptr setSupportingTouchEventsGestureRecognizer:0];
    [(WKContentView *)self removeGestureRecognizer:self->_singleTapGestureRecognizer.m_ptr];
    [self->_highlightLongPressGestureRecognizer.m_ptr setDelegate:0];
    [(WKContentView *)self removeGestureRecognizer:self->_highlightLongPressGestureRecognizer.m_ptr];
    [self->_longPressGestureRecognizer.m_ptr setDelegate:0];
    [(WKContentView *)self removeGestureRecognizer:self->_longPressGestureRecognizer.m_ptr];
    [self->_doubleTapGestureRecognizer.m_ptr setDelegate:0];
    [(WKContentView *)self removeGestureRecognizer:self->_doubleTapGestureRecognizer.m_ptr];
    [self->_nonBlockingDoubleTapGestureRecognizer.m_ptr setDelegate:0];
    [(WKContentView *)self removeGestureRecognizer:self->_nonBlockingDoubleTapGestureRecognizer.m_ptr];
    [self->_doubleTapGestureRecognizerForDoubleClick.m_ptr setDelegate:0];
    [(WKContentView *)self removeGestureRecognizer:self->_doubleTapGestureRecognizerForDoubleClick.m_ptr];
    [self->_twoFingerDoubleTapGestureRecognizer.m_ptr setDelegate:0];
    [(WKContentView *)self removeGestureRecognizer:self->_twoFingerDoubleTapGestureRecognizer.m_ptr];
    [self->_twoFingerSingleTapGestureRecognizer.m_ptr setDelegate:0];
    [(WKContentView *)self removeGestureRecognizer:self->_twoFingerSingleTapGestureRecognizer.m_ptr];
    [(WKContentView *)self removeGestureRecognizer:self->_touchActionGestureRecognizer.m_ptr];
    [(WKContentView *)self removeGestureRecognizer:self->_touchActionLeftSwipeGestureRecognizer.m_ptr];
    [(WKContentView *)self removeGestureRecognizer:self->_touchActionRightSwipeGestureRecognizer.m_ptr];
    [(WKContentView *)self removeGestureRecognizer:self->_touchActionUpSwipeGestureRecognizer.m_ptr];
    [(WKContentView *)self removeGestureRecognizer:self->_touchActionDownSwipeGestureRecognizer.m_ptr];
    *(void *)&self->_keyWebEventHandlers.m_inlineBuffer[0].__lx[32] = 0;
    [(WKContentView *)self _removeContextMenuHintContainerIfPossible];
    [(id)existingLocalDragSessionContext(*(void **)&self->_dragDropInteractionState.m_lastGlobalPosition.y) cleanUpTemporaryDirectories];
    [(WKContentView *)self teardownDragAndDropInteractions];
    [(WKContentView *)self removeInteraction:self->_pointerInteraction.m_ptr];
    double v21 = self->_pointerInteraction.m_ptr;
    self->_pointerInteraction.m_ptr = 0;
    if (v21) {
      CFRelease(v21);
    }
    self->_pointerInteractionRegionNeedsUpdate = 0;
    uint64_t v22 = *(void *)&self->_actionsToPerformAfterEditorStateUpdate.m_capacity;
    *(void *)&self->_actionsToPerformAfterEditorStateUpdate.m_capacitCGFloat y = 0;
    if (v22) {
      WTF::RefCounted<WebKit::RevealFocusedElementDeferrer>::deref(v22);
    }
    [(WKContentView *)self cleanUpScribbleInteraction];
    BYTE4(self->_dataListTextSuggestions.m_ptr) = 0;
    CGPoint v23 = self->_inspectorNodeSearchGestureRecognizer.m_ptr;
    if (v23)
    {
      [v23 setDelegate:0];
      [(WKContentView *)self removeGestureRecognizer:self->_inspectorNodeSearchGestureRecognizer.m_ptr];
      RetainPtr<_WKPrintFormattingAttributes> v24 = self->_inspectorNodeSearchGestureRecognizer.m_ptr;
      self->_inspectorNodeSearchGestureRecognizer.m_ptr = 0;
      if (v24) {
        CFRelease(v24);
      }
    }
    [(WKContentView *)self _unregisterPreview];
    [(WKContentView *)self dismissPickersIfNeededWithReason:2];
    [(WKContentView *)self stopDeferringInputViewUpdatesForAllSources];
    uint64_t v37 = 0;
    uint64_t v38 = 0;
    uint64_t v39 = 0;
    uint64_t v40 = 0;
    memset(v34, 0, sizeof(v34));
    uint64_t v36 = 0;
    uint64_t v35 = 0;
    long long v41 = xmmword_1994F73F0;
    long long v42 = xmmword_1994F7400;
    char v43 = 0;
    uint64_t v45 = 0;
    uint64_t v44 = 0;
    char v46 = 0;
    uint64_t v48 = 0;
    uint64_t v49 = 0;
    uint64_t v47 = 0;
    int v50 = 0;
    uint64_t v51 = 0;
    uint64_t v52 = 0;
    uint64_t v53 = 0;
    int v54 = -1;
    uint64_t v56 = 0;
    uint64_t v57 = 0;
    uint64_t v55 = 0;
    __int16 v58 = 0;
    WTF::URL::URL((WTF::URL *)v59);
    v59[20] = 0;
    uint64_t v61 = 0;
    uint64_t v62 = 0;
    uint64_t v60 = 0;
    __int16 v63 = 0;
    uint64_t v65 = 0;
    uint64_t v66 = 0;
    uint64_t v64 = 0;
    __int16 v67 = 0;
    char v68 = 1;
    int v69 = 0;
    __int16 v70 = 0;
    long long v71 = 0u;
    long long v72 = 0u;
    uint64_t v73 = 0;
    WebKit::FocusedElementInformation::operator=((uint64_t)&self->_focusedElementInformation, (uint64_t)v34);
    WebKit::FocusedElementInformation::~FocusedElementInformation((WebKit::FocusedElementInformation *)v34, v25);
    [self->_positionInformationCallbackDepth invalidate];
    positionInformationCallbackDepth = (const void *)self->_positionInformationCallbackDepth;
    self->_positionInformationCallbackDepth = 0;
    if (positionInformationCallbackDepth) {
      CFRelease(positionInformationCallbackDepth);
    }
    double v27 = *(const void **)&self->_inputViewUpdateDeferralSources.m_storage;
    *(void *)&self->_inputViewUpdateDeferralSources.m_storage = 0;
    if (v27) {
      CFRelease(v27);
    }
    float v28 = self->_keyboardScrollingAnimator.m_ptr;
    self->_keyboardScrollingAnimator.m_ptr = 0;
    if (v28) {
      CFRelease(v28);
    }
    [(WKContentView *)self _tearDownImageAnalysis];
    [(WKContentView *)self _removeContainerForContextMenuHintPreviews];
    [(WKContentView *)self _removeContainerForDragPreviews];
    [(WKContentView *)self _removeContainerForDropPreviews];
    [(WKContentView *)self unsuppressSoftwareKeyboardUsingLastAutocorrectionContextIfNeeded];
    self->_becomingFirstResponder = 0;
    self->_suppressSelectionAssistantReasons.m_storage = 0;
    [(WKContentView *)self _resetPanningPreventionFlags];
    [(WKContentView *)self _handleDOMPasteRequestWithResult:0];
    [(WKContentView *)self _cancelPendingKeyEventHandlers:0];
    [(WKContentView *)self setPasteConfiguration:0];
    if (self->_needsDeferredEndScrollingSelectionUpdate) {
      self->_needsDeferredEndScrollingSelectionUpdate = 0;
    }
    m_buffer = self->_lastSelectionDrawingInfo.selectionGeometries.m_buffer;
    self->_lastSelectionDrawingInfo.selectionGeometries.m_buffer = 0;
    if (m_buffer) {
      CFRelease(m_buffer);
    }
  }
}

- (void)_cancelPendingKeyEventHandlers:(BOOL)a3
{
  BOOL v3 = a3;
  p_keyWebEventHandlers = &self->_keyWebEventHandlers;
  CGFloat v18 = v20;
  uint64_t v19 = 1;
  double v21 = (const void **)v23;
  uint64_t v22 = 1;
  m_inlineBuffer = self->_keyWebEventHandlers.m_inlineBuffer;
  m_buffer = (const void **)self->_keyWebEventHandlers.m_buffer;
  if (m_buffer == (const void **)m_inlineBuffer)
  {
    WTF::VectorMover<false,WebKit::KeyEventAndCompletionBlock>::move(m_buffer, &m_buffer[2 * p_keyWebEventHandlers->m_size], v23);
    char v8 = (WTF *)p_keyWebEventHandlers->m_buffer;
    unsigned int m_size = p_keyWebEventHandlers->m_size;
    p_keyWebEventHandlers->unsigned int m_size = 0;
    HIDWORD(v22) = m_size;
    if (v8 != (WTF *)m_inlineBuffer)
    {
      if (v8)
      {
        p_keyWebEventHandlers->m_buffer = 0;
        p_keyWebEventHandlers->m_capacitCGFloat y = 0;
        WTF::fastFree(v8, (void *)a2);
      }
      p_keyWebEventHandlers->m_buffer = (KeyEventAndCompletionBlock *)m_inlineBuffer;
    }
  }
  else
  {
    p_keyWebEventHandlers->m_buffer = (KeyEventAndCompletionBlock *)m_inlineBuffer;
    double v21 = m_buffer;
    uint64_t v7 = *(void *)&p_keyWebEventHandlers->m_capacity;
    *(void *)&p_keyWebEventHandlers->m_capacitCGFloat y = 1;
    uint64_t v22 = v7;
  }
  int v10 = v18;
  if (v18 == v20)
  {
    WTF::VectorMover<false,WebKit::KeyEventAndCompletionBlock>::move(v20, &v20[2 * HIDWORD(v19)], m_inlineBuffer);
    unsigned int v11 = v19;
  }
  else
  {
    CGFloat v18 = v20;
    p_keyWebEventHandlers->m_buffer = (KeyEventAndCompletionBlock *)v10;
    unsigned int v11 = v19;
    LODWORD(v19) = 1;
  }
  unsigned int v12 = HIDWORD(v19);
  HIDWORD(v19) = 0;
  p_keyWebEventHandlers->m_capacitCGFloat y = v11;
  p_keyWebEventHandlers->unsigned int m_size = v12;
  WTF::Vector<WebKit::KeyEventAndCompletionBlock,1ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v18, (void *)a2);
  if (HIDWORD(v22))
  {
    uint64_t v14 = v21;
    uint64_t v15 = &v21[2 * HIDWORD(v22)];
    do
    {
      CFTypeRef v16 = *v14;
      if (*v14) {
        CFRetain(*v14);
      }
      uint64_t v17 = (void (**)(void *, CFTypeRef, BOOL))_Block_copy(v14[1]);
      v17[2](v17, v16, v3);
      _Block_release(v17);
      if (v16) {
        CFRelease(v16);
      }
      v14 += 2;
    }
    while (v14 != v15);
  }
  WTF::Vector<WebKit::KeyEventAndCompletionBlock,1ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v21, v13);
}

- (void)_removeDefaultGestureRecognizers
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v3 = [(WKContentView *)self deferringGestures];
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(WKContentView *)self removeGestureRecognizer:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
  [(WKContentView *)self removeGestureRecognizer:self->_touchEventGestureRecognizer.m_ptr];
  [(WKContentView *)self removeGestureRecognizer:self->_singleTapGestureRecognizer.m_ptr];
  [(WKContentView *)self removeGestureRecognizer:self->_highlightLongPressGestureRecognizer.m_ptr];
  [(WKContentView *)self removeGestureRecognizer:self->_doubleTapGestureRecognizer.m_ptr];
  [(WKContentView *)self removeGestureRecognizer:self->_nonBlockingDoubleTapGestureRecognizer.m_ptr];
  [(WKContentView *)self removeGestureRecognizer:self->_doubleTapGestureRecognizerForDoubleClick.m_ptr];
  [(WKContentView *)self removeGestureRecognizer:self->_twoFingerDoubleTapGestureRecognizer.m_ptr];
  [(WKContentView *)self removeGestureRecognizer:self->_twoFingerSingleTapGestureRecognizer.m_ptr];
  [(WKContentView *)self removeInteraction:self->_mouseInteraction.m_ptr];
  [(WKContentView *)self removeGestureRecognizer:self->_touchActionGestureRecognizer.m_ptr];
  [(WKContentView *)self removeGestureRecognizer:self->_touchActionLeftSwipeGestureRecognizer.m_ptr];
  [(WKContentView *)self removeGestureRecognizer:self->_touchActionRightSwipeGestureRecognizer.m_ptr];
  [(WKContentView *)self removeGestureRecognizer:self->_touchActionUpSwipeGestureRecognizer.m_ptr];
  [(WKContentView *)self removeGestureRecognizer:self->_touchActionDownSwipeGestureRecognizer.m_ptr];
  [(WKContentView *)self removeGestureRecognizer:self->_keyboardDismissalGestureRecognizer.m_ptr];
}

- (void)_addDefaultGestureRecognizers
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v3 = [(WKContentView *)self deferringGestures];
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(WKContentView *)self addGestureRecognizer:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
  [(WKContentView *)self addGestureRecognizer:self->_touchEventGestureRecognizer.m_ptr];
  [(WKContentView *)self addGestureRecognizer:self->_singleTapGestureRecognizer.m_ptr];
  [(WKContentView *)self addGestureRecognizer:self->_highlightLongPressGestureRecognizer.m_ptr];
  [(WKContentView *)self addGestureRecognizer:self->_doubleTapGestureRecognizer.m_ptr];
  [(WKContentView *)self addGestureRecognizer:self->_nonBlockingDoubleTapGestureRecognizer.m_ptr];
  [(WKContentView *)self addGestureRecognizer:self->_doubleTapGestureRecognizerForDoubleClick.m_ptr];
  [(WKContentView *)self addGestureRecognizer:self->_twoFingerDoubleTapGestureRecognizer.m_ptr];
  [(WKContentView *)self addGestureRecognizer:self->_twoFingerSingleTapGestureRecognizer.m_ptr];
  [(WKContentView *)self addInteraction:self->_mouseInteraction.m_ptr];
  [(WKContentView *)self addGestureRecognizer:self->_touchActionGestureRecognizer.m_ptr];
  [(WKContentView *)self addGestureRecognizer:self->_touchActionLeftSwipeGestureRecognizer.m_ptr];
  [(WKContentView *)self addGestureRecognizer:self->_touchActionRightSwipeGestureRecognizer.m_ptr];
  [(WKContentView *)self addGestureRecognizer:self->_touchActionUpSwipeGestureRecognizer.m_ptr];
  [(WKContentView *)self addGestureRecognizer:self->_touchActionDownSwipeGestureRecognizer.m_ptr];
  [(WKContentView *)self addGestureRecognizer:self->_keyboardDismissalGestureRecognizer.m_ptr];
}

- (double)inverseScale
{
  id v2 = (void *)[(WKContentView *)self layer];
  if (v2)
  {
    [v2 transform];
    double v3 = v5;
  }
  else
  {
    double v3 = 0.0;
  }
  return 1.0 / v3;
}

- (id)_scroller
{
  id Weak = objc_loadWeak(&self->_webView.m_weakReference);

  return (id)[Weak scrollView];
}

- (CGRect)unobscuredContentRect
{
  WebCore::FloatRect::operator CGRect();
  result.size.double height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (void)startAutoscroll:(CGPoint)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  CGPoint v8 = a3;
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    uint64_t v6 = qword_1EB3586B8;
    if (os_log_type_enabled((os_log_t)qword_1EB3586B8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[WKContentView(WKInteraction) startAutoscroll:]";
      _os_log_error_impl(&dword_1985F2000, v6, OS_LOG_TYPE_ERROR, "Received unexpected call to %s", buf, 0xCu);
    }
    __break(0xC471u);
    JUMPOUT(0x199435EC8);
  }
  m_ptr = self->_page.m_ptr;
  WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v7, &v8);
  uint64_t v5 = *((void *)m_ptr + 32);
  *(void *)buf = v7;
  WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::StartAutoscrollAtPosition>(v5, (float **)buf, *(void *)(*((void *)m_ptr + 4) + 1928), 0);
}

- (void)cancelAutoscroll
{
  m_ptr = self->_page.m_ptr;
  uint64_t v3 = *((void *)m_ptr + 32);
  char v4 = 0;
  WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::CancelAutoscroll>(v3, (uint64_t)&v4, *(void *)(*((void *)m_ptr + 4) + 1928), 0);
}

- (void)scrollSelectionToVisible:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    uint64_t v3 = qword_1EB3586B8;
    if (os_log_type_enabled((os_log_t)qword_1EB3586B8, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315138;
      uint64_t v5 = "-[WKContentView(WKInteraction) scrollSelectionToVisible:]";
      _os_log_error_impl(&dword_1985F2000, v3, OS_LOG_TYPE_ERROR, "Received unexpected call to %s", (uint8_t *)&v4, 0xCu);
    }
    __break(0xC471u);
    JUMPOUT(0x199435FD8);
  }
}

uint64_t __79__WKContentView_WKInteraction__observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 760) setHidden:0];
}

- (void)_enableInspectorNodeSearch
{
  BYTE4(self->_dataListTextSuggestions.m_ptr) = 1;
  [(WKContentView *)self _cancelInteraction];
  [(WKContentView *)self _removeDefaultGestureRecognizers];
  uint64_t v3 = [[WKInspectorNodeSearchGestureRecognizer alloc] initWithTarget:self action:sel__inspectorNodeSearchRecognized_];
  m_ptr = self->_inspectorNodeSearchGestureRecognizer.m_ptr;
  self->_inspectorNodeSearchGestureRecognizer.m_ptr = v3;
  if (m_ptr)
  {
    CFRelease(m_ptr);
    uint64_t v3 = (WKInspectorNodeSearchGestureRecognizer *)self->_inspectorNodeSearchGestureRecognizer.m_ptr;
  }

  [(WKContentView *)self addGestureRecognizer:v3];
}

- (void)_disableInspectorNodeSearch
{
  BYTE4(self->_dataListTextSuggestions.m_ptr) = 0;
  [(WKContentView *)self _addDefaultGestureRecognizers];
  [(WKContentView *)self removeGestureRecognizer:self->_inspectorNodeSearchGestureRecognizer.m_ptr];
  m_ptr = self->_inspectorNodeSearchGestureRecognizer.m_ptr;
  self->_inspectorNodeSearchGestureRecognizer.m_ptr = 0;
  if (m_ptr)
  {
    CFRelease(m_ptr);
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  CGPoint v8 = (void *)[self->_interactionViewsContainerView.m_ptr subviews];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v17 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void **)(*((void *)&v16 + 1) + 8 * v12);
      objc_msgSend(v13, "convertPoint:fromView:", self, x, y);
      id result = (id)objc_msgSend(v13, "hitTest:withEvent:", a4);
      if (result) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v15.receiver = self;
    v15.super_class = (Class)WKContentView;
    return -[WKContentView hitTest:withEvent:](&v15, sel_hitTest_withEvent_, a4, x, y);
  }
  return result;
}

- (const)positionInformation
{
  return &self->_positionInformation;
}

- (void)setInputDelegate:(id)a3
{
}

- (CGPoint)lastInteractionLocation
{
  double v2 = *(double *)&self->_keyWebEventHandlers.m_inlineBuffer[0].__lx[16];
  double v3 = *(double *)&self->_keyWebEventHandlers.m_inlineBuffer[0].__lx[24];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (BOOL)shouldHideSelectionWhenScrolling
{
  if (LOBYTE(self->_dataListTextSuggestionsInputView.m_ptr))
  {
    int v2 = self->_anon_938[110];
  }
  else
  {
    double v3 = (unsigned char *)*((void *)self->_page.m_ptr + 4);
    if (v3[576]) {
      BOOL v4 = v3[250] == 0;
    }
    else {
      BOOL v4 = 1;
    }
    if (v4) {
      return 0;
    }
    int v2 = v3[363];
  }
  return v2 != 0;
}

- (BOOL)setIsEditable:(BOOL)a3
{
  int m_ptr_low = LOBYTE(self->_dataListTextSuggestionsInputView.m_ptr);
  if (m_ptr_low != a3) {
    LOBYTE(self->_dataListTextSuggestionsInputView.m_ptr) = a3;
  }
  return m_ptr_low != a3;
}

- (void)_endEditing
{
  [self->_inputPeripheral.m_ptr endEditing];
  [self->_formInputSession.m_ptr endEditing];
  double v3 = *(void **)&self->_inputViewUpdateDeferralSources.m_storage;

  [v3 controlEndEditing];
}

- (void)_cancelPreviousResetInputViewDeferralRequest
{
}

- (void)_scheduleResetInputViewDeferralAfterBecomingFirstResponder
{
  [(WKContentView *)self _cancelPreviousResetInputViewDeferralRequest];

  [(WKContentView *)self performSelector:sel_stopDeferringInputViewUpdatesForAllSources withObject:self afterDelay:0.5];
}

- (BOOL)canBecomeFirstResponder
{
  return self->_isEditable;
}

- (BOOL)canBecomeFirstResponderForWebView
{
  return !self->_hasValidPositionInformation;
}

- (BOOL)becomeFirstResponder
{
  id Weak = objc_loadWeak(&self->_webView.m_weakReference);

  return [Weak becomeFirstResponder];
}

- (BOOL)becomeFirstResponderForWebView
{
  if (self->_hasValidPositionInformation) {
    return 0;
  }
  [(WKContentView *)self startDeferringInputViewUpdates:1];
  BOOL isEditable = self->_isEditable;
  self->_BOOL isEditable = 1;
  v11.receiver = self;
  v11.super_class = (Class)WKContentView;
  unsigned int v4 = [(WKContentView *)&v11 becomeFirstResponder];
  self->_BOOL isEditable = isEditable;
  if (!v4)
  {
    [(WKContentView *)self stopDeferringInputViewUpdates:1];
    return 0;
  }
  m_ptr = self->_page.m_ptr;
  id v9 = 0;
  objc_initWeak(&v9, self);
  uint64_t v6 = WTF::fastMalloc((WTF *)0x10);
  *(void *)uint64_t v6 = &unk_1EEA0E9B8;
  *(void *)(v6 + 8) = 0;
  objc_moveWeak((id *)(v6 + 8), &v9);
  uint64_t v10 = v6;
  WebKit::WebPageProxy::installActivityStateChangeCompletionHandler((unint64_t)m_ptr, &v10);
  uint64_t v7 = v10;
  uint64_t v10 = 0;
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
  }
  objc_destroyWeak(&v9);
  {
    WebKit::UIGamepadProvider::UIGamepadProvider((WebKit::UIGamepadProvider *)&WebKit::UIGamepadProvider::singleton(void)::sharedProvider);
  }
  WebKit::UIGamepadProvider::viewBecameActive((WebKit::UIGamepadProvider *)&WebKit::UIGamepadProvider::singleton(void)::sharedProvider, (WebKit::WebPageProxy *)self->_page.m_ptr);
  WebKit::WebPageProxy::activityStateDidChange((uint64_t)self->_page.m_ptr, 2, 1, 0);
  if ([(WKContentView *)self canShowNonEmptySelectionView]
    || !self->_suppressSelectionAssistantReasons.m_storage && *(void *)&self->_isUpdatingAccessoryView)
  {
    [self->_textInteractionWrapper.m_ptr activateSelection];
  }
  [(WKContentView *)self _scheduleResetInputViewDeferralAfterBecomingFirstResponder];
  return 1;
}

- (BOOL)resignFirstResponder
{
  id Weak = objc_loadWeak(&self->_webView.m_weakReference);

  return [Weak resignFirstResponder];
}

- (void)endEditingAndUpdateFocusAppearanceWithReason:(int64_t)a3
{
  if ((objc_msgSend(-[WKContentView webView](self, "webView"), "_isRetainingActiveFocusedState") & 1) == 0)
  {
    [(WKContentView *)self _endEditing];
    if (BYTE4(self->_revealFocusedElementDeferrer.m_ptr)
      || (uint64_t v5 = (PAL *)[(WKContentView *)self _shouldUseLegacySelectPopoverDismissalBehavior], (v5 & 1) != 0)|| !a3&& (self->_textInteractionDidChangeFocusedElement || PAL::currentUserInterfaceIdiomIsSmallScreen(v5)))
    {
      m_ptr = self->_page.m_ptr;
      uint64_t v7 = *((void *)m_ptr + 32);
      char v8 = 0;
      WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::BlurFocusedElement>(v7, (uint64_t)&v8, *(void *)(*((void *)m_ptr + 4) + 1928), 0);
      [(WKContentView *)self _elementDidBlur];
    }
  }
  [(WKContentView *)self _cancelInteraction];
  [self->_textInteractionWrapper.m_ptr deactivateSelection];

  [(WKContentView *)self stopDeferringInputViewUpdatesForAllSources];
}

- (BOOL)resignFirstResponderForWebView
{
  BOOL hasValidPositionInformation = self->_hasValidPositionInformation;
  self->_BOOL hasValidPositionInformation = 1;
  [(WKContentView *)self endEditingAndUpdateFocusAppearanceWithReason:1];
  if (BYTE4(self->_revealFocusedElementDeferrer.m_ptr))
  {
    LOBYTE(v4) = 0;
    BYTE4(self->_revealFocusedElementDeferrer.m_ptr) = 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)WKContentView;
    BOOL v4 = [(WKContentView *)&v11 resignFirstResponder];
    if (v4)
    {
      [(WKContentView *)self _handleDOMPasteRequestWithResult:0];
      WebKit::WebPageProxy::activityStateDidChange((uint64_t)self->_page.m_ptr, 2, 1, 0);
      {
        WebKit::UIGamepadProvider::UIGamepadProvider((WebKit::UIGamepadProvider *)&WebKit::UIGamepadProvider::singleton(void)::sharedProvider);
      }
      WebKit::UIGamepadProvider::viewBecameInactive((WebKit::UIGamepadProvider *)&WebKit::UIGamepadProvider::singleton(void)::sharedProvider, (WebKit::WebPageProxy *)self->_page.m_ptr);
      self->_isChangingFocusUsingAccessoryTab = 0;
      self->_didAccessoryTabInitiateFocus = 0;
      if (self->_keyWebEventHandlers.m_size)
      {
        WTF::RunLoop::main(v5);
        id v9 = 0;
        objc_initWeak(&v9, self);
        uint64_t v6 = WTF::fastMalloc((WTF *)0x10);
        *(void *)uint64_t v6 = &unk_1EEA0E9E0;
        *(void *)(v6 + 8) = 0;
        objc_moveWeak((id *)(v6 + 8), &v9);
        uint64_t v10 = v6;
        WTF::RunLoop::dispatch();
        uint64_t v7 = v10;
        uint64_t v10 = 0;
        if (v7) {
          (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
        }
        objc_destroyWeak(&v9);
      }
      LOBYTE(v4) = 1;
    }
  }
  self->_BOOL hasValidPositionInformation = hasValidPositionInformation;
  return v4;
}

- (void)cancelPointersForGestureRecognizer:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)[self->_touchEventGestureRecognizer.m_ptr activeTouchesByIdentifier];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        objc_super v11 = (void *)[v5 objectForKey:v10];
        if (objc_msgSend((id)objc_msgSend(v11, "gestureRecognizers"), "containsObject:", a3))
        {
          m_ptr = self->_page.m_ptr;
          int v13 = [v10 unsignedIntValue];
          [v11 locationInView:self];
          v20.double x = v14;
          v20.double y = v15;
          WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v21, &v20);
          float v16 = roundf(v21[0]);
          uint64_t v17 = (int)v16;
          if (v16 <= -2147500000.0) {
            uint64_t v17 = 0x80000000;
          }
          if (v16 >= 2147500000.0) {
            uint64_t v17 = 0x7FFFFFFFLL;
          }
          float v18 = roundf(v21[1]);
          unint64_t v19 = (unint64_t)(int)v18 << 32;
          if (v18 <= -2147500000.0) {
            unint64_t v19 = 0x8000000000000000;
          }
          if (v18 >= 2147500000.0) {
            unint64_t v19 = 0x7FFFFFFF00000000;
          }
          unint64_t v22 = v19 | v17;
          int v28 = v13;
          v27[0] = &v28;
          v27[1] = (int *)&v22;
          WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::CancelPointer>(*((void *)m_ptr + 32), v27, *(void *)(*((void *)m_ptr + 4) + 1928), 0);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v7);
  }
}

- (optional<unsigned)activeTouchIdentifierForGestureRecognizer:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void *)[self->_touchEventGestureRecognizer.m_ptr activeTouchesByIdentifier];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "objectForKey:", v9), "gestureRecognizers"), "containsObject:", a3))
        {
          int v13 = [v9 unsignedIntValue];
          unsigned int v12 = v13 & 0xFFFFFF00;
          int v10 = v13;
          uint64_t v11 = 0x100000000;
          return (optional<unsigned int>)(v11 | v12 | v10);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  int v10 = 0;
  uint64_t v11 = 0;
  unsigned int v12 = 0;
  return (optional<unsigned int>)(v11 | v12 | v10);
}

- (BOOL)_touchEventsMustRequireGestureRecognizerToFail:(id)a3
{
  id v4 = [(WKContentView *)self webView];
  if ([v4 _isNavigationSwipeGestureRecognizer:a3]) {
    return 1;
  }
  uint64_t v6 = (void *)[v4 UIDelegate];
  if ((id)[a3 view] != v4 || (objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }

  return [v6 _webView:v4 touchEventsMustRequireGestureRecognizerToFail:a3];
}

- (BOOL)_gestureRecognizerCanBePreventedByTouchEvents:(id)a3
{
  uint64_t v5 = objc_msgSend(-[WKContentView webView](self, "webView"), "UIDelegate");
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  id v6 = [(WKContentView *)self webView];

  return [v5 _webView:v6 gestureRecognizerCanBePreventedByTouchEvents:a3];
}

- (void)_touchEventsRecognized:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  m_ptr = self->_page.m_ptr;
  if (!*((unsigned char *)m_ptr + 801) && *((unsigned char *)m_ptr + 800))
  {
    uint64_t v6 = [a3 lastTouchEvent];
    *(_OWORD *)&self->_keyWebEventHandlers.m_inlineBuffer[0].__lx[16] = *(_OWORD *)(v6 + 32);
    if (!*(unsigned char *)v6)
    {
      if (!self->_failedTouchStartDeferringGestures.__engaged_)
      {
        self->_failedTouchStartDeferringGestures.var0.__val_.m_impl.var0.m_table = 0;
        self->_failedTouchStartDeferringGestures.__engaged_ = 1;
      }
      [(WKContentView *)self _handleDOMPasteRequestWithResult:0];
      uint64_t v7 = self->_page.m_ptr;
      uint64_t v8 = *((void *)v7 + 29);
      if (*(unsigned char *)(v8 + 36))
      {
        __break(0xC471u);
        JUMPOUT(0x199437214);
      }
      *(void *)&self->_keyWebEventHandlers.m_inlineBuffer[0].__lx[32] = *(void *)(v8 + 112);
      WebKit::WebPageProxy::resetPotentialTapSecurityOrigin((uint64_t)v7);
      WebCore::IntPoint::IntPoint((WebCore::IntPoint *)&v42, (const CGPoint *)&self->_keyWebEventHandlers.m_inlineBuffer[0].__lx[16]);
      uint64_t v9 = v42;
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3321888768;
      v40[2] = __55__WKContentView_WKInteraction___touchEventsRecognized___block_invoke;
      v40[3] = &__block_descriptor_40_e8_32c69_ZTSKZ55__WKContentView_WKInteraction___touchEventsRecognized__E4__15_e6320_v648__0_InteractionInformationAtPosition__InteractionInformationRequest__IntPoint_ii_BBBBBBB_B_optional_BOOL_____cB_B_CBBBBBBBBBBBBB_Markable_WebCore::ProcessQualified_WTF::ObjectIdentifierGeneric_WebCore::ScrollingNodeIDType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::Yes____WebCore::ProcessQualified_WTF::ObjectIdentifierGeneric_WebCore::ScrollingNodeIDType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::Yes__::MarkableTraits___ProcessQualified_WTF::ObjectIdentifierGeneric_WebCore::ScrollingNodeIDType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::Yes____ObjectIdentifierGeneric_WebCore::ScrollingNodeIDType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::Yes__Q__ObjectIdentifierGeneric_WebCore::ProcessIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::Yes__Q___BBBBBB_FloatPoint_ff__URL__String__RefPtr_WTF::StringImpl__WTF::RawPtrTraits_WTF::StringImpl___WTF::DefaultRefDerefTraits_WTF::StringImpl_____StringImpl___b1b1b1b3b26IIIIIII__URL__String__RefPtr_WTF::StringImpl__WTF::RawPtrTraits_WTF::StringImpl___WTF::DefaultRefDerefTraits_WTF::StringImpl_____StringImpl___b1b1b1b3b26IIIIIII__String__RefPtr_WTF::StringImpl__WTF::RawPtrTraits_WTF::StringImpl___WTF::DefaultRefDerefTraits_WTF::StringImpl_____StringImpl____String__RefPtr_WTF::StringImpl__WTF::RawPtrTraits_WTF::StringImpl___WTF::DefaultRefDerefTraits_WTF::StringImpl_____StringImpl____String__RefPtr_WTF::StringImpl__WTF::RawPtrTraits_WTF::StringImpl___WTF::DefaultRefDerefTraits_WTF::StringImpl_____StringImpl____IntRect__IntPoint_ii__IntSize_ii___RefPtr_WebCore::ShareableBitmap__WTF::RawPtrTraits_WebCore::ShareableBitmap___WTF::DefaultRefDerefTraits_WebCore::ShareableBitmap_____ShareableBitmap___String__RefPtr_WTF::StringImpl__WTF::RawPtrTraits_WTF::StringImpl___WTF::DefaultRefDerefTraits_WTF::StringImpl_____StringImpl____String__RefPtr_WTF::StringImpl__WTF::RawPtrTraits_WTF::StringImpl___WTF::DefaultRefDerefTraits_WTF::StringImpl_____StringImpl___f_FloatRect__FloatPoint_ff__FloatSize_ff___optional_WebCore::Cursor_____c_Cursor_C_RefPtr_WebCore::Image__WTF::RawPtrTraits_WebCore::Image___WTF::DefaultRefDerefTraits_WebCore::Image_____Image___IntPoint_ii__v__B__TextIndicatorData__FloatRect__FloatPoint_ff__FloatSize_ff___FloatRect__FloatPoint_ff__FloatSize_ff___FloatRect__FloatPoint_ff__FloatSize_ff___Vector_WebCore::FloatRect__0UL__WTF::CrashOnOverflow__16UL__WTF::FastMalloc____FloatRect_II_f_RefPtr_WebCore::Image__WTF::RawPtrTraits_WebCore::Image___WTF::DefaultRefDerefTraits_WebCore::Image_____Image___RefPtr_WebCore::Image__WTF::RawPtrTraits_WebCore::Image___WTF::DefaultRefDerefTraits_WebCore::Image_____Image___RefPtr_WebCore::Image__WTF::RawPtrTraits_WebCore::Image___WTF::DefaultRefDerefTraits_WebCore::Image_____Image___Color_Q_C_OptionSet_WebCore::TextIndicatorOption__S___String__RefPtr_WTF::StringImpl__WTF::RawPtrTraits_WTF::StringImpl___WTF::DefaultRefDerefTraits_WTF::StringImpl_____StringImpl____RetainPtr_NSArray___v__IntRect__IntPoint_ii__IntSize_ii___optional_WebCore::ElementContext_____c_ElementContext__FloatRect__FloatPoint_ff__FloatSize_ff___Markable_WTF::ObjectIdentifierGeneric_WebCore::PageIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No___WTF::ObjectIdentifierGeneric_WebCore::PageIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No_::MarkableTraits___ObjectIdentifierGeneric_WebCore::PageIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No__Q___ProcessQualified_WTF::UUID___UUID_T__ObjectIdentifierGeneric_WebCore::ProcessIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::Yes__Q___Markable_WTF::ObjectIdentifierGeneric_WebCore::ElementIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No___WTF::ObjectIdentifierGeneric_WebCore::ElementIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No_::MarkableTraits___ObjectIdentifierGeneric_WebCore::ElementIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No__Q____B__optional_WebCore::ElementContext_____c_ElementContext__FloatRect__FloatPoint_ff__FloatSize_ff___Markable_WTF::ObjectIdentifierGeneric_WebCore::PageIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No___WTF::ObjectIdentifierGeneric_WebCore::PageIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No_::MarkableTraits___ObjectIdentifierGeneric_WebCore::PageIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No__Q___ProcessQualified_WTF::UUID___UUID_T__ObjectIdentifierGeneric_WebCore::ProcessIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::Yes__Q___Markable_WTF::ObjectIdentifierGeneric_WebCore::ElementIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No___WTF::ObjectIdentifierGeneric_WebCore::ElementIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No_::MarkableTraits___ObjectIdentifierGeneric_WebCore::ElementIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No__Q____B__Vector_WebCore::ElementAnimationContext__0UL__WTF::CrashOnOverflow__16UL__WTF::FastMalloc____ElementAnimationContext_II__8l;
      int v10 = self->_actionSheetAssistant.m_ptr;
      location[0] = 0;
      objc_initWeak(location, v10);
      id v41 = 0;
      objc_copyWeak(&v41, location);
      -[WKContentView doAfterPositionInformationUpdate:forRequest:](self, "doAfterPositionInformationUpdate:forRequest:", v40, v9, 0x1000000);
      objc_destroyWeak(location);
      objc_destroyWeak(&v41);
    }
    WebKit::NativeWebTouchEvent::NativeWebTouchEvent((WebKit::NativeWebTouchEvent *)location, (const WKTouchEvent *)v6, [a3 modifierFlags]);
    if (self->_touchEventsCanPreventNativeGestures) {
      char v11 = 1;
    }
    else {
      char v11 = [a3 isDefaultPrevented];
    }
    v50[24] = v11;
    [(WKContentView *)self _handleTouchActionsForTouchEvent:location];
    unsigned int v12 = self->_page.m_ptr;
    if (self->_touchEventsCanPreventNativeGestures) {
      WebKit::WebPageProxy::handlePreventableTouchEvent((uint64_t)v12, (WebKit::NativeWebTouchEvent *)location);
    }
    else {
      WebKit::WebPageProxy::handleUnpreventableTouchEvent((WebKit::WebPageProxy *)v12, (const WebKit::NativeWebTouchEvent *)location);
    }
    if (v48)
    {
      uint64_t v14 = 72 * v48;
      long long v15 = v46 + 12;
      while (1)
      {
        int v16 = *v15;
        v15 += 72;
        if ((v16 | 4) != 4) {
          break;
        }
        v14 -= 72;
        if (!v14) {
          goto LABEL_19;
        }
      }
    }
    else
    {
LABEL_19:
      self->_touchEventsCanPreventNativeGestures = 1;
      if (!*((unsigned char *)self->_page.m_ptr + 450)) {
        [(WKContentView *)self _resetPanningPreventionFlags];
      }
      if (v50[25]
        && [(WKContentView *)self hasHiddenContentEditable]
        && [(WKContentView *)self _hasFocusedElement]
        && (objc_msgSend((id)-[WKContentView window](self, "window"), "isKeyWindow") & 1) == 0)
      {
        objc_msgSend((id)-[WKContentView window](self, "window"), "makeKeyWindow");
      }
      if (!*((void *)self->_page.m_ptr + 107))
      {
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id v17 = [(WKContentView *)self _touchStartDeferringGestures];
        uint64_t v18 = [v17 countByEnumeratingWithState:&v36 objects:v44 count:16];
        if (v18)
        {
          uint64_t v19 = *(void *)v37;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v37 != v19) {
                objc_enumerationMutation(v17);
              }
              uint64_t v21 = *(void **)(*((void *)&v36 + 1) + 8 * i);
              if (![v21 state]) {
                [v21 setState:5];
              }
            }
            uint64_t v18 = [v17 countByEnumeratingWithState:&v36 objects:v44 count:16];
          }
          while (v18);
        }
      }
      if (*((unsigned char *)self->_page.m_ptr + 872) != 1)
      {
        unint64_t v22 = self->_touchMoveDeferringGestureRecognizer.m_ptr;
        if (![v22 state]) {
          [v22 setState:5];
        }
      }
      if (!*((void *)self->_page.m_ptr + 108))
      {
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v23 = [(WKContentView *)self _touchEndDeferringGestures];
        uint64_t v24 = [v23 countByEnumeratingWithState:&v32 objects:v43 count:16];
        if (v24)
        {
          uint64_t v25 = *(void *)v33;
          do
          {
            for (uint64_t j = 0; j != v24; ++j)
            {
              if (*(void *)v33 != v25) {
                objc_enumerationMutation(v23);
              }
              double v27 = *(void **)(*((void *)&v32 + 1) + 8 * j);
              if (![v27 state]) {
                [v27 setState:5];
              }
            }
            uint64_t v24 = [v23 countByEnumeratingWithState:&v32 objects:v43 count:16];
          }
          while (v24);
        }
      }
      p_failedTouchStartDeferringGestures = &self->_failedTouchStartDeferringGestures;
      if (p_failedTouchStartDeferringGestures->__engaged_)
      {
        if (p_failedTouchStartDeferringGestures->var0.__val_.m_impl.var0.m_table) {
          WTF::HashTable<WTF::RetainPtr<WKDeferringGestureRecognizer>,WTF::RetainPtr<WKDeferringGestureRecognizer>,WTF::IdentityExtractor,WTF::DefaultHash<WTF::RetainPtr<WKDeferringGestureRecognizer>>,WTF::HashTraits<WTF::RetainPtr<WKDeferringGestureRecognizer>>,WTF::HashTraits<WTF::RetainPtr<WKDeferringGestureRecognizer>>>::deallocateTable((const void **)p_failedTouchStartDeferringGestures->var0.__val_.m_impl.var0.m_table, v13);
        }
        p_failedTouchStartDeferringGestures->__engaged_ = 0;
      }
    }
    WTF::Vector<WebKit::WebTouchEvent,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v50, v13);
    WTF::Vector<WebKit::WebTouchEvent,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v49, v29);
    long long v31 = (WTF *)v46;
    if (v46)
    {
      char v46 = 0;
      int v47 = 0;
      WTF::fastFree(v31, v30);
    }
  }
}

uint64_t __55__WKContentView_WKInteraction___touchEventsRecognized___block_invoke(uint64_t a1, uint64_t a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));

  return [Weak interactionDidStartWithPositionInformation:a2];
}

- (void)_handleTouchActionsForTouchEvent:(const void *)a3
{
  double v3 = (uint64_t *)*((void *)self->_page.m_ptr + 31);
  if (v3)
  {
    uint64_t v4 = *((unsigned int *)a3 + 11);
    if (v4)
    {
      uint64_t v6 = 72 * v4;
      uint64_t v7 = (int *)*((void *)a3 + 4);
      do
      {
        int v8 = *((unsigned __int8 *)v7 + 12);
        if (v8 == 1)
        {
          v12[0] = *(void *)(v7 + 1);
          unsigned __int8 v9 = WebKit::touchActionsForPoint((WebKit *)self, (UIView *)v12, (const WebCore::IntPoint *)a3);
          if (v9)
          {
            unsigned __int8 v10 = v9;
            if ((v9 & 1) == 0)
            {
              [self->_touchActionGestureRecognizer.m_ptr setTouchActions:v9 forTouchIdentifier:*v7];
              int v11 = *v7;
              unsigned __int8 v14 = v10;
              int v13 = v11;
              WTF::HashMap<unsigned int,WTF::OptionSet<WebCore::TouchAction>,WTF::DefaultHash<unsigned int>,WTF::HashTraits<unsigned int>,WTF::HashTraits<WTF::OptionSet<WebCore::TouchAction>>,WTF::HashTableTraits>::inlineSet<unsigned int const&,WTF::OptionSet<WebCore::TouchAction>&>(v3 + 18, &v13, &v14, (uint64_t)v12);
              self->_preventsPanningInXAxis = (v10 & 0xC) == 0;
              self->_preventsPanningInYAxis = (v10 & 0x14) == 0;
            }
          }
        }
        else if ((v8 & 0xFFFFFFFB) == 0)
        {
          [self->_touchActionGestureRecognizer.m_ptr clearTouchActionsForTouchIdentifier:*v7];
          WebKit::RemoteScrollingCoordinatorProxyIOS::clearTouchActionsForTouchIdentifier((WebKit::RemoteScrollingCoordinatorProxyIOS *)v3, *v7);
        }
        v7 += 18;
        v6 -= 72;
      }
      while (v6);
    }
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  if ((id)[self->_mouseInteraction.m_ptr mouseTouchGestureRecognizer] == a3)
  {
    int v7 = [a4 _isPointerTouch];
    if (!v7) {
      return v7;
    }
  }
  else if ((id)[self->_mouseInteraction.m_ptr mouseTouch] == a4 {
         && ([a4 _isPointerTouch] & 1) != 0)
  }
  {
    LOBYTE(v7) = 0;
    return v7;
  }
  if (self->_doubleTapGestureRecognizer.m_ptr == a3 || self->_nonBlockingDoubleTapGestureRecognizer.m_ptr == a3)
  {
    LOBYTE(v7) = [a4 type] != 3;
  }
  else if (self->_touchActionLeftSwipeGestureRecognizer.m_ptr == a3 {
         || self->_touchActionRightSwipeGestureRecognizer.m_ptr == a3
  }
         || self->_touchActionUpSwipeGestureRecognizer.m_ptr == a3
         || self->_touchActionDownSwipeGestureRecognizer.m_ptr == a3)
  {
    [a4 locationInView:self];
    v22.double x = v8;
    v22.double y = v9;
    WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v20, &v22);
    float v11 = roundf(v20[0]);
    uint64_t v12 = 0x7FFFFFFFLL;
    uint64_t v13 = (int)v11;
    if (v11 <= -2147500000.0) {
      uint64_t v13 = 0x80000000;
    }
    if (v11 < 2147500000.0) {
      uint64_t v12 = v13;
    }
    float v14 = roundf(v20[1]);
    uint64_t v15 = 0x7FFFFFFF00000000;
    unint64_t v16 = 0x8000000000000000;
    if (v14 > -2147500000.0) {
      unint64_t v16 = (unint64_t)(int)v14 << 32;
    }
    if (v14 < 2147500000.0) {
      uint64_t v15 = v16;
    }
    uint64_t v21 = v15 | v12;
    unsigned __int8 v17 = WebKit::touchActionsForPoint((WebKit *)self, (UIView *)&v21, v10);
    int v18 = 16;
    if (self->_touchActionLeftSwipeGestureRecognizer.m_ptr != a3)
    {
      if (self->_touchActionRightSwipeGestureRecognizer.m_ptr == a3) {
        int v18 = 16;
      }
      else {
        int v18 = 8;
      }
    }
    LOBYTE(v7) = v18 == v17;
  }
  else
  {
    LOBYTE(v7) = 1;
  }
  return v7;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceivePress:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizerMayPanWebView:(id)a3
{
  BOOL result = 1;
  if ((id)objc_msgSend((id)objc_msgSend(objc_loadWeak(&self->_webView.m_weakReference), "scrollView"), "panGestureRecognizer") != a3)
  {
    if (![a3 view]) {
      return 0;
    }
    [a3 view];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 0;
    }
  }
  return result;
}

- (BOOL)gestureRecognizerMayPinchToZoomWebView:(id)a3
{
  if ((id)objc_msgSend((id)objc_msgSend(objc_loadWeak(&self->_webView.m_weakReference), "scrollView"), "pinchGestureRecognizer") == a3)
  {
    LOBYTE(v5) = 1;
    return v5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_8;
  }
  uint64_t v5 = objc_msgSend(-[WKContentView webView](self, "webView"), "UIDelegate");
  if (!v5) {
    return v5;
  }
  uint64_t v6 = (void *)v5;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_8:
    LOBYTE(v5) = 0;
    return v5;
  }
  id v7 = [(WKContentView *)self webView];

  LOBYTE(v5) = [v6 _webView:v7 gestureRecognizerCouldPinch:a3];
  return v5;
}

- (BOOL)gestureRecognizerMayDoubleTapToZoomWebView:(id)a3
{
  return self->_doubleTapGestureRecognizer.m_ptr == a3 || self->_twoFingerDoubleTapGestureRecognizer.m_ptr == a3;
}

- (id)touchActionActiveTouches
{
  return (id)[self->_touchEventGestureRecognizer.m_ptr activeTouchesByIdentifier];
}

- (void)_resetPanningPreventionFlags
{
  self->_preventsPanningInXAxis = 0;
  self->_preventsPanningInYAxis = 0;
}

- (void)_inspectorNodeSearchRecognized:(id)a3
{
  [(WKContentView *)self _resetIsDoubleTapPending];
  [a3 locationInView:self];
  v12.double x = v5;
  v12.double y = v6;
  unint64_t v7 = [a3 state] - 1;
  m_ptr = self->_page.m_ptr;
  if (v7 > 1)
  {
    WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)&v11, &v12);
    uint64_t v10 = *((void *)m_ptr + 32);
    uint64_t v13 = (float *)&v11;
    WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::InspectorNodeSearchEndedAtPosition>(v10, &v13, *(void *)(*((void *)m_ptr + 4) + 1928), 0);
  }
  else
  {
    WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)&v11, &v12);
    uint64_t v9 = *((void *)m_ptr + 32);
    uint64_t v13 = (float *)&v11;
    WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::InspectorNodeSearchMovedToPosition>(v9, &v13, *(void *)(*((void *)m_ptr + 4) + 1928), 0);
  }
}

- (void)_touchEvent:(const void *)a3 preventsNativeGestures:(BOOL)a4
{
  if (a4 && objc_msgSend(self->_touchEventGestureRecognizer.m_ptr, "isDispatchingTouchEvents", a3))
  {
    BYTE6(self->_dataListTextSuggestionsInputView.m_ptr) = 0;
    self->_touchEventsCanPreventNativeGestures = 0;
    m_ptr = self->_touchEventGestureRecognizer.m_ptr;
    [m_ptr setDefaultPrevented:1];
  }
}

- (WKTouchEventsGestureRecognizer)touchEventGestureRecognizer
{
  return (WKTouchEventsGestureRecognizer *)self->_touchEventGestureRecognizer.m_ptr;
}

- (void)gestureRecognizerConsistencyEnforcer
{
  p_gestureRecognizerConsistencyEnforcer = (WebKit::GestureRecognizerConsistencyEnforcer **)&self->_gestureRecognizerConsistencyEnforcer;
  BOOL result = self->_gestureRecognizerConsistencyEnforcer.__ptr_.__value_;
  if (!result)
  {
    CGFloat v5 = (id *)WTF::fastMalloc((WTF *)0x30);
    WebKit::GestureRecognizerConsistencyEnforcer::GestureRecognizerConsistencyEnforcer(v5, self);
    std::unique_ptr<WebKit::GestureRecognizerConsistencyEnforcer>::reset[abi:sn180100](p_gestureRecognizerConsistencyEnforcer, (WebKit::GestureRecognizerConsistencyEnforcer *)v5);
    return *p_gestureRecognizerConsistencyEnforcer;
  }
  return result;
}

- (void)_doneDeferringTouchStart:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(WKContentView *)self _touchStartDeferringGestures];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        [v9 endDeferral:v3];
        if (self->_failedTouchStartDeferringGestures.__engaged_ && !v3)
        {
          CFTypeRef cf = v9;
          if (v9) {
            CFRetain(v9);
          }
          WTF::HashTable<WTF::RetainPtr<WKDeferringGestureRecognizer>,WTF::RetainPtr<WKDeferringGestureRecognizer>,WTF::IdentityExtractor,WTF::DefaultHash<WTF::RetainPtr<WKDeferringGestureRecognizer>>,WTF::HashTraits<WTF::RetainPtr<WKDeferringGestureRecognizer>>,WTF::HashTraits<WTF::RetainPtr<WKDeferringGestureRecognizer>>>::add((uint64_t *)&self->_failedTouchStartDeferringGestures.var0.__val_.m_impl.var0.m_table, &cf, (uint64_t)&v11);
          CFTypeRef v10 = cf;
          CFTypeRef cf = 0;
          if (v10) {
            CFRelease(v10);
          }
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (void)_doneDeferringTouchMove:(BOOL)a3
{
}

- (void)_doneDeferringTouchEnd:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [(WKContentView *)self _touchEndDeferringGestures];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) endDeferral:v3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (BOOL)_isTouchStartDeferringGesture:(id)a3
{
  return self->_touchStartDeferringGestureRecognizerForSyntheticTapGestures.m_ptr == a3
      || self->_touchStartDeferringGestureRecognizerForImmediatelyResettableGestures.m_ptr == a3
      || self->_touchStartDeferringGestureRecognizerForDelayedResettableGestures.m_ptr == a3;
}

- (BOOL)_isTouchEndDeferringGesture:(id)a3
{
  return self->_touchEndDeferringGestureRecognizerForSyntheticTapGestures.m_ptr == a3
      || self->_touchEndDeferringGestureRecognizerForImmediatelyResettableGestures.m_ptr == a3
      || self->_touchEndDeferringGestureRecognizerForDelayedResettableGestures.m_ptr == a3;
}

- (CGRect)tapHighlightViewRect
{
  [self->_tapHighlightView.m_ptr frame];
  result.size.double height = v5;
  result.size.CGFloat width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (UIGestureRecognizer)imageAnalysisGestureRecognizer
{
  return (UIGestureRecognizer *)self->_actionToPerformAfterReceivingEditDragSnapshot.m_block;
}

- (void)_showTapHighlight
{
  if (!self->_tapHighlightInformation.nodeHasBuiltInClickHandling)
  {
    uint64_t v3 = *((void *)self->_page.m_ptr + 4);
    uint64_t m_size = self->_tapHighlightInformation.quads.m_size;
    if (m_size)
    {
      m_buffer = self->_tapHighlightInformation.quads.m_buffer;
      uint64_t v6 = 32 * m_size;
      float v7 = 0.0;
      while (1)
      {
        long long v8 = *(_OWORD *)&m_buffer->m_p3.m_x;
        v18[0] = *(_OWORD *)&m_buffer->m_p1.m_x;
        v18[1] = v8;
        WebCore::FloatQuad::boundingBox((WebCore::FloatQuad *)v18);
        float v11 = *(float *)(v3 + 2304);
        if (v9 > (float)(v11 * 0.3)) {
          goto LABEL_10;
        }
        float v12 = *(float *)(v3 + 2308);
        if (v10 > (float)(v12 * 0.3)) {
          goto LABEL_10;
        }
        float v7 = v7 + (float)(v9 * v10);
        ++m_buffer;
        v6 -= 32;
        if (!v6) {
          goto LABEL_9;
        }
      }
    }
    float v11 = *(float *)(v3 + 2304);
    float v12 = *(float *)(v3 + 2308);
    float v7 = 0.0;
LABEL_9:
    if (v7 >= (float)((float)(v12 * v11) * 0.3))
    {
LABEL_10:
      if (!LOBYTE(self->_dataListSuggestionsControl.m_weakReference)) {
        return;
      }
    }
  }
  m_ptr = self->_tapHighlightView.m_ptr;
  if (!m_ptr)
  {
    uint64_t v14 = [WKTapHighlightView alloc];
    long long v15 = -[WKTapHighlightView initWithFrame:](v14, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    long long v16 = self->_tapHighlightView.m_ptr;
    self->_tapHighlightView.m_ptr = v15;
    if (v16)
    {
      CFRelease(v16);
      long long v15 = (WKTapHighlightView *)self->_tapHighlightView.m_ptr;
    }
    [(WKTapHighlightView *)v15 setUserInteractionEnabled:0];
    [self->_tapHighlightView.m_ptr setOpaque:0];
    LODWORD(v17) = 2.0;
    [self->_tapHighlightView.m_ptr setMinimumCornerRadius:v17];
    m_ptr = self->_tapHighlightView.m_ptr;
  }
  [m_ptr setAlpha:1.0];
  [self->_interactionViewsContainerView.m_ptr addSubview:self->_tapHighlightView.m_ptr];
  [(WKContentView *)self _updateTapHighlight];
}

- (void)_didGetTapHighlightForRequest:()ObjectIdentifierGeneric<WebKit:()WTF:(unsigned long)long :(WTF:(const Color *)a4 :(const void *)a5 SupportsObjectIdentifierNullState:(const IntSize *)a6 :(const IntSize *)a7 No>)a3 ObjectIdentifierMainThreadAccessTraits<uint64_t> :(const IntSize *)a8 TapIdentifierType color:(const IntSize *)a9 quads:(BOOL)a10 topLeftRadius:topRightRadius:bottomLeftRadius:bottomRightRadius:nodeHasBuiltInClickHandling:
{
  if (BYTE2(self->_dataListTextSuggestionsInputView.m_ptr))
  {
    unint64_t m_identifier = self->_latestTapID.m_value.m_identifier;
    BOOL v12 = m_identifier && m_identifier == a3.m_identifier;
    if (v12
      && (![(WKContentView *)self _hasFocusedElement]
       || !self->_anon_7d0[32]
       || !WebCore::ElementContext::isSameElement((WebCore::ElementContext *)(&self->_positionInformation.elementContext.var0.var2 + 1), &self->_focusedElementInformation.elementContext)))
    {
      BYTE2(self->_dataListTextSuggestionsInputView.m_ptr) = 0;
      WTF::Vector<WebCore::PlatformTimeRanges::Range,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::operator=((uint64_t)&self->_tapHighlightInformation.quads, (uint64_t)a5);
      self->_tapHighlightInformation.topLeftRadius = *a6;
      self->_tapHighlightInformation.topRightRadius = *a7;
      self->_tapHighlightInformation.bottomLeftRadius = *a8;
      self->_tapHighlightInformation.bottomRightRadius = *a9;
      self->_tapHighlightInformation.nodeHasBuiltInClickHandling = a10;
      if (LOBYTE(self->_dataListSuggestionsControl.m_weakReference))
      {
        -[WKContentView _tapHighlightColorForFastClick:](self, "_tapHighlightColorForFastClick:", [self->_doubleTapGestureRecognizer.m_ptr isEnabled] ^ 1);
        WebCore::Color::operator=();
        if ((*(void *)v19 & 0x8000000000000) != 0)
        {
          uint64_t v18 = (unsigned int *)(*(void *)v19 & 0xFFFFFFFFFFFFLL);
          if (atomic_fetch_add((atomic_uint *volatile)(*(void *)v19 & 0xFFFFFFFFFFFFLL), 0xFFFFFFFF) == 1)
          {
            atomic_store(1u, v18);
            WTF::fastFree((WTF *)v18, v17);
          }
        }
      }
      else
      {
        WebCore::Color::operator=();
      }
      if (BYTE4(self->_dataListTextSuggestionsInputView.m_ptr))
      {
        HIBYTE(self->_dataListTextSuggestionsInputView.m_ptr) = 1;
      }
      else
      {
        [(WKContentView *)self _showTapHighlight];
        if (HIBYTE(self->_dataListTextSuggestions.m_ptr))
        {
          [(WKContentView *)self _finishInteraction];
          if (!BYTE4(self->_dataListTextSuggestionsInputView.m_ptr)) {
            HIBYTE(self->_dataListTextSuggestions.m_ptr) = 0;
          }
        }
      }
    }
  }
}

- (void)_disableDoubleTapGesturesDuringTapIfNecessary:()ObjectIdentifierGeneric<WebKit:()WTF:(unsigned long)long :(WTF::SupportsObjectIdentifierNullState::No>)a3 ObjectIdentifierMainThreadAccessTraits<uint64_t> :TapIdentifierType
{
  unint64_t m_identifier = self->_latestTapID.m_value.m_identifier;
  if (m_identifier) {
    BOOL v4 = m_identifier == a3.m_identifier;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4) {
    [(WKContentView *)self _setDoubleTapGesturesEnabled:0];
  }
}

- (void)_handleSmartMagnificationInformationForPotentialTap:()ObjectIdentifierGeneric<WebKit:()WTF:(unsigned long)long :(WTF:(const FloatRect *)a4 :(BOOL)a5 SupportsObjectIdentifierNullState:(double)a6 :(double)a7 No>)a3 ObjectIdentifierMainThreadAccessTraits<uint64_t> :(BOOL)a8 TapIdentifierType renderRect:fitEntireRect:viewportMinimumScale:viewportMaximumScale:nodeIsRootLevel:
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (!BYTE4(self->_dataListTextSuggestionsInputView.m_ptr)) {
    return;
  }
  BOOL v8 = a8;
  BOOL v11 = a5;
  uint64_t v14 = *((void *)self->_page.m_ptr + 34);
  {
    WebKit::WebPreferencesKey::preferFasterClickOverDoubleTapKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::preferFasterClickOverDoubleTapKey(void)::kedouble y = (uint64_t)&WebKit::WebPreferencesKey::preferFasterClickOverDoubleTapKey(void)::$_0::operator() const(void)::impl;
  }
  long long v15 = (WebKit::WebPreferencesStore *)(v14 + 40);
  if (!WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)(v14 + 40), (WTF::StringImpl **)&WebKit::WebPreferencesKey::preferFasterClickOverDoubleTapKey(void)::key, (const WTF::StringImpl *)a3.m_identifier)|| (m_ptr = self->_page.m_ptr, !*((unsigned char *)m_ptr + 1122)))
  {
    [(WKContentView *)self _contentZoomScale];
    double v27 = v26;
    WebKit::SmartMagnificationController::zoomFactorForTargetRect((uint64_t)self->_smartMagnificationController.__ptr_.__value_, v11, a4->m_location.m_x, a4->m_location.m_y, a4->m_size.m_width, a4->m_size.m_height, a6, a7);
    if (v27 >= v28) {
      double v29 = v28;
    }
    else {
      double v29 = v27;
    }
    if (v28 < v27) {
      double v28 = v27;
    }
    double v30 = v29 / v28;
    long long v35 = qword_1EB358708;
    BOOL v31 = os_log_type_enabled((os_log_t)qword_1EB358708, OS_LOG_TYPE_DEFAULT);
    if (v30 <= 0.8)
    {
      if (!v31) {
        return;
      }
      uint64_t v34 = *(void *)(*((void *)self->_page.m_ptr + 4) + 760);
      *(_DWORD *)long long v39 = 134218240;
      *(void *)&v39[4] = self;
      *(_WORD *)&v39[12] = 2048;
      *(void *)&v39[14] = v34;
      uint64_t v25 = "Potential tap may cause significant zoom. Wait. (%p, pageProxyID=%llu)";
      goto LABEL_34;
    }
    if (v31)
    {
      uint64_t v32 = *(void *)(*((void *)self->_page.m_ptr + 4) + 760);
      *(_DWORD *)long long v39 = 134218240;
      *(void *)&v39[4] = self;
      *(_WORD *)&v39[12] = 2048;
      *(void *)&v39[14] = v32;
      long long v33 = "Potential tap would not cause a significant zoom. Trigger click. (%p, pageProxyID=%llu)";
LABEL_28:
      _os_log_impl(&dword_1985F2000, v35, OS_LOG_TYPE_DEFAULT, v33, v39, 0x16u);
    }
LABEL_29:
    -[WKContentView _setDoubleTapGesturesEnabled:](self, "_setDoubleTapGesturesEnabled:", 0, *(_OWORD *)v39, *(void *)&v39[16], v40);
    return;
  }
  double v17 = qword_1EB358708;
  if (os_log_type_enabled((os_log_t)qword_1EB358708, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = *(void *)(*((void *)m_ptr + 4) + 760);
    *(_DWORD *)long long v39 = 134218240;
    *(void *)&v39[4] = self;
    *(_WORD *)&v39[12] = 2048;
    *(void *)&v39[14] = v19;
    _os_log_impl(&dword_1985F2000, v17, OS_LOG_TYPE_DEFAULT, "Potential tap found an element and fast taps are preferred. Trigger click. (%p, pageProxyID=%llu)", v39, 0x16u);
  }
  {
    WebKit::WebPreferencesKey::zoomOnDoubleTapWhenRootKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::zoomOnDoubleTapWhenRootKey(void)::kedouble y = (uint64_t)&WebKit::WebPreferencesKey::zoomOnDoubleTapWhenRootKey(void)::$_0::operator() const(void)::impl;
  }
  if (WebKit::WebPreferencesStore::getBoolValueForKey(v15, (WTF::StringImpl **)&WebKit::WebPreferencesKey::zoomOnDoubleTapWhenRootKey(void)::key, v18))BOOL v21 = !v8; {
  else
  }
    BOOL v21 = 1;
  if (v21)
  {
    {
      WebKit::WebPreferencesKey::alwaysZoomOnDoubleTapKey(void)::$_0::operator() const(void)::impl += 2;
      WebKit::WebPreferencesKey::alwaysZoomOnDoubleTapKey(void)::kedouble y = (uint64_t)&WebKit::WebPreferencesKey::alwaysZoomOnDoubleTapKey(void)::$_0::operator() const(void)::impl;
    }
    BoolValueForKedouble y = WebKit::WebPreferencesStore::getBoolValueForKey(v15, (WTF::StringImpl **)&WebKit::WebPreferencesKey::alwaysZoomOnDoubleTapKey(void)::key, v20);
    long long v35 = qword_1EB358708;
    BOOL v23 = os_log_type_enabled((os_log_t)qword_1EB358708, OS_LOG_TYPE_DEFAULT);
    if (BoolValueForKey)
    {
      if (!v23) {
        return;
      }
      uint64_t v24 = *(void *)(*((void *)self->_page.m_ptr + 4) + 760);
      *(_DWORD *)long long v39 = 134218240;
      *(void *)&v39[4] = self;
      *(_WORD *)&v39[12] = 2048;
      *(void *)&v39[14] = v24;
      uint64_t v25 = "DTTZ is forced on, so don't disable double-tap. (%p, pageProxyID=%llu)";
      goto LABEL_34;
    }
    if (v23)
    {
      uint64_t v38 = *(void *)(*((void *)self->_page.m_ptr + 4) + 760);
      *(_DWORD *)long long v39 = 134218240;
      *(void *)&v39[4] = self;
      *(_WORD *)&v39[12] = 2048;
      *(void *)&v39[14] = v38;
      long long v33 = "Give preference to click by disabling double-tap. (%p, pageProxyID=%llu)";
      goto LABEL_28;
    }
    goto LABEL_29;
  }
  long long v35 = qword_1EB358708;
  if (os_log_type_enabled((os_log_t)qword_1EB358708, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v37 = *(void *)(*((void *)self->_page.m_ptr + 4) + 760);
    *(_DWORD *)long long v39 = 134218240;
    *(void *)&v39[4] = self;
    *(_WORD *)&v39[12] = 2048;
    *(void *)&v39[14] = v37;
    uint64_t v25 = "The click handler was on a root-level element, so don't disable double-tap. (%p, pageProxyID=%llu)";
LABEL_34:
    _os_log_impl(&dword_1985F2000, v35, OS_LOG_TYPE_DEFAULT, v25, v39, 0x16u);
  }
}

- (void)_cancelTouchEventGestureRecognizer
{
}

- (void)_scrollingNodeScrollingWillBegin:()ProcessQualified<WTF:()WTF:(unsigned long)long :(WTF::SupportsObjectIdentifierNullState::Yes>>)a3 ObjectIdentifierMainThreadAccessTraits<uint64_t> :ObjectIdentifierGeneric<WebCore::ScrollingNodeIDType
{
}

- (void)_scrollingNodeScrollingDidEnd:()ProcessQualified<WTF:()WTF:(unsigned long)long :(WTF::SupportsObjectIdentifierNullState::Yes>>)a3 ObjectIdentifierMainThreadAccessTraits<uint64_t> :ObjectIdentifierGeneric<WebCore::ScrollingNodeIDType
{
  if (LOBYTE(self->_dataListTextSuggestions.m_ptr))
  {
    [(WKContentView *)self _updateChangedSelection];
    [self->_textInteractionWrapper.m_ptr didEndScrollingOverflow];
    if (*((void *)self->_page.m_ptr + 31)) {
      BOOL v4 = WebKit::RemoteScrollingCoordinatorProxyIOS::scrollViewForScrollingNodeID();
    }
    else {
      BOOL v4 = 0;
    }
    id Weak = objc_loadWeak(&self->_webView.m_weakReference);
    [Weak _didFinishScrolling:v4];
  }
  else
  {
    BYTE1(self->_dataListTextSuggestions.m_ptr) = 1;
  }
}

- (BOOL)shouldShowAutomaticKeyboardUI
{
  if (self->_anon_938[114] == 1
    || self->_anon_938[257] && ![MEMORY[0x1E4F42B08] isInHardwareKeyboardMode])
  {
    return 0;
  }

  return [(WKContentView *)self _shouldShowAutomaticKeyboardUIIgnoringInputMode];
}

- (BOOL)_shouldShowAutomaticKeyboardUIIgnoringInputMode
{
  if (self->_anon_938[107]) {
    return 0;
  }
  unsigned int v2 = self->_anon_938[113];
  if (v2 > 0x12) {
    return 1;
  }
  if (((1 << v2) & 0x6F801) != 0) {
    return 0;
  }
  if (v2 != 16) {
    return 1;
  }
  BOOL v4 = (PAL *)[(WKContentView *)self _shouldUseContextMenusForFormControls];
  if (v4) {
    return 0;
  }

  return PAL::currentUserInterfaceIdiomIsSmallScreen(v4);
}

- (BOOL)_disableAutomaticKeyboardUI
{
  int v3 = [(WKContentView *)self isFirstResponder];
  if (v3) {
    LOBYTE(v3) = ![(WKContentView *)self shouldShowAutomaticKeyboardUI];
  }
  return v3;
}

- (BOOL)_requiresKeyboardWhenFirstResponder
{
  if ([objc_loadWeak(&self->_webView.m_weakReference) _isEditable])
  {
    if (![(WKContentView *)self _disableAutomaticKeyboardUI]) {
      return 1;
    }
  }
  else if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    v4.receiver = self;
    v4.super_class = (Class)WKContentView;
    return [(WKContentView *)&v4 _requiresKeyboardWhenFirstResponder];
  }
  if ([(WKContentView *)self _shouldShowAutomaticKeyboardUIIgnoringInputMode])
  {
    return 1;
  }
  return HIBYTE(self->_revealFocusedElementDeferrer.m_ptr) != 0;
}

- (BOOL)_requiresKeyboardResetOnReload
{
  if (![(WKContentView *)self shouldUseAsyncInteractions]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)WKContentView;
  return [(WKContentView *)&v4 _requiresKeyboardResetOnReload];
}

- (FloatRect)rectToRevealWhenZoomingToFocusedElement
{
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  p_focusedElementInformation = &self->_focusedElementInformation;
  int v3 = *(_DWORD *)&self->_anon_938[24];
  m_double x = self->_focusedElementInformation.interactionRect.m_location.m_x;
  if (m_x <= v3 && self->_focusedElementInformation.interactionRect.m_size.m_width + m_x > v3)
  {
    int v5 = *(_DWORD *)&self->_anon_938[28];
    m_double y = self->_focusedElementInformation.interactionRect.m_location.m_y;
    if (m_y <= v5 && self->_focusedElementInformation.interactionRect.m_size.m_height + m_y > v5)
    {
      uint64_t v17 = *(void *)&self->_anon_938[24];
      uint64_t v18 = 0x100000001;
    }
  }
  if (self->_anon_938[113] - 1 < 0xA
    && (m_ptr = self->_page.m_ptr, uint64_t v8 = *((void *)m_ptr + 4), *(unsigned char *)(v8 + 576))
    && *(unsigned char *)(v8 + 704))
  {
    float v19 = WebKit::WebPageProxy::selectionBoundingRectInRootViewCoordinates((WebKit::WebPageProxy *)m_ptr);
    float v20 = v13;
    float v21 = v14;
    float v22 = v15;
    WebCore::FloatRect::FloatRect((WebCore::FloatRect *)v16, (const WebCore::IntRect *)p_focusedElementInformation);
    WebCore::FloatRect::intersect((WebCore::FloatRect *)&v19, (const WebCore::FloatRect *)v16);
  }
  else
  {
    WebCore::FloatRect::FloatRect((WebCore::FloatRect *)&v19, (const WebCore::IntRect *)&v17);
  }
  float v9 = v19;
  float v10 = v20;
  float v11 = v21;
  float v12 = v22;
  result.m_size.float m_height = v12;
  result.m_size.float m_width = v11;
  result.m_location.m_double y = v10;
  result.m_location.m_double x = v9;
  return result;
}

- (void)_keyboardWillShow
{
  self->_shouldRestoreSelection = 0;
  uint64_t v2 = *(void *)&self->_actionsToPerformAfterEditorStateUpdate.m_capacity;
  if (v2) {
    WebKit::RevealFocusedElementDeferrer::fulfill(v2, 2);
  }
}

- (void)_keyboardDidShow
{
  WTF::RunLoop::main((WTF::RunLoop *)self);
  id v5 = 0;
  objc_initWeak(&v5, self);
  uint64_t v3 = WTF::fastMalloc((WTF *)0x10);
  *(void *)uint64_t v3 = &unk_1EEA0EA08;
  *(void *)(v3 + 8) = 0;
  objc_moveWeak((id *)(v3 + 8), &v5);
  uint64_t v6 = v3;
  WTF::RunLoop::dispatch();
  uint64_t v4 = v6;
  uint64_t v6 = 0;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
  objc_destroyWeak(&v5);
  [self->_fileUploadPanel.m_ptr repositionContextMenuIfNeeded];
}

- (void)_zoomToRevealFocusedElement
{
  uint64_t v3 = *(void *)&self->_actionsToPerformAfterEditorStateUpdate.m_capacity;
  *(void *)&self->_actionsToPerformAfterEditorStateUpdate.m_capacitdouble y = 0;
  if (v3) {
    WTF::RefCounted<WebKit::RevealFocusedElementDeferrer>::deref(v3);
  }
  if (!self->_anon_938[296]
    && !self->_suppressSelectionAssistantReasons.m_storage
    && !*(void *)&self->_isUpdatingAccessoryView)
  {
    WebCore::IntRect::operator CGRect();
    double v24 = v5;
    double v25 = v4;
    double v23 = v6;
    double v8 = v7;
    if (!BYTE6(self->_dataListTextSuggestions.m_ptr)) {
      [(WKContentView *)self rectToRevealWhenZoomingToFocusedElement];
    }
    float v9 = (PAL *)WebCore::FloatRect::operator CGRect();
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    uint64_t v18 = *(void *)&self->_anon_938[48];
    float v19 = *(double *)&self->_anon_938[56];
    uint64_t v20 = *(void *)&self->_anon_938[32];
    if (self->_anon_938[109]) {
      uint64_t IsSmallScreen = PAL::currentUserInterfaceIdiomIsSmallScreen(v9);
    }
    else {
      uint64_t IsSmallScreen = 0;
    }
    *(float *)&uint64_t v22 = v19;
    -[WKContentView _zoomToFocusRect:selectionRect:fontSize:minimumScale:maximumScale:allowScaling:forceScroll:](self, "_zoomToFocusRect:selectionRect:fontSize:minimumScale:maximumScale:allowScaling:forceScroll:", IsSmallScreen, [(WKContentView *)self requiresAccessoryView], v25, v24, v23, v8, v11, v13, v15, v17, v22, v20, v18);
  }
}

- (id)inputView
{
  id Weak = objc_loadWeak(&self->_webView.m_weakReference);

  return (id)[Weak inputView];
}

- (UIView)inputViewForWebView
{
  if (![(WKContentView *)self _hasFocusedElement]) {
    return 0;
  }
  if (self->_inputPeripheral.m_ptr)
  {
    [(WKContentView *)self _zoomToRevealFocusedElement];
    [(WKContentView *)self _updateAccessory];
  }
  FloatRect result = (UIView *)[self->_formInputSession.m_ptr customInputView];
  if (!result)
  {
    FloatRect result = *(UIView **)&self->_inputViewUpdateDeferralSources.m_storage;
    if (!result)
    {
      m_ptr = self->_inputPeripheral.m_ptr;
      return (UIView *)[m_ptr assistantView];
    }
  }
  return result;
}

- (CGRect)_selectionClipRect
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    double v7 = qword_1EB3586B8;
    if (os_log_type_enabled((os_log_t)qword_1EB3586B8, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      float v9 = "-[WKContentView(WKInteraction) _selectionClipRect]";
      _os_log_error_impl(&dword_1985F2000, v7, OS_LOG_TYPE_ERROR, "Received unexpected call to %s", (uint8_t *)&v8, 0xCu);
    }
    __break(0xC471u);
    JUMPOUT(0x199438DA0);
  }

  [(WKContentView *)self selectionClipRect];
  result.size.double height = v6;
  result.size.CGFloat width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (BOOL)_isContextMenuGestureRecognizerForFailureRelationships:(id)a3
{
  int v5 = objc_msgSend((id)objc_msgSend(a3, "name"), "isEqualToString:", @"com.apple.UIKit.clickPresentationFailure");
  if (v5) {
    LOBYTE(v5) = [a3 view] == (void)self;
  }
  return v5;
}

- (BOOL)_isDragInitiationGestureRecognizer:(id)a3
{
  BOOL result = *(void *)&self->_dragDropInteractionState.m_activeDragSources.m_capacity
        && (double v4 = (void *)[a3 delegate], (objc_opt_respondsToSelector() & 1) != 0)
        && *(void *)&self->_dragDropInteractionState.m_activeDragSources.m_capacity == [v4 delegate];
  return result;
}

- (BOOL)gestureRecognizer:(id)a3 canPreventGestureRecognizer:(id)a4
{
  if (self->_highlightLongPressGestureRecognizer.m_ptr == a3 || self->_longPressGestureRecognizer.m_ptr == a3)
  {
    if (qword_1E93CF9F0 != -1) {
      dispatch_once(&qword_1E93CF9F0, &__block_literal_global_2903);
    }
    if ((isBuiltInScrollViewPanGestureRecognizer((UIGestureRecognizer *)a4) & 1) != 0
      || (objc_opt_isKindOfClass() & 1) != 0)
    {
      char v5 = 0;
    }
    else
    {
      char v5 = objc_opt_isKindOfClass() ^ 1;
    }
  }
  else
  {
    char v5 = 1;
  }
  return v5 & 1;
}

- (BOOL)gestureRecognizer:(id)a3 canBePreventedByGestureRecognizer:(id)a4
{
  return !objc_msgSend(a4, "_wk_isTextInteractionLoupeGesture")
      || self->_highlightLongPressGestureRecognizer.m_ptr != a3 && self->_longPressGestureRecognizer.m_ptr != a3;
}

- (id)textInteractionLoupeGestureRecognizer
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  p_cachedTextInteractionLoupeGestureRecognizer = &self->_cachedTextInteractionLoupeGestureRecognizer;
  if ((WKContentView *)[objc_loadWeak((id *)&self->_cachedTextInteractionLoupeGestureRecognizer) view] != self)
  {
    objc_storeWeak((id *)p_cachedTextInteractionLoupeGestureRecognizer, 0);
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    double v4 = (void *)[(WKContentView *)self gestureRecognizers];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          float v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if (objc_msgSend(v9, "_wk_isTextInteractionLoupeGesture"))
          {
            objc_storeWeak((id *)p_cachedTextInteractionLoupeGestureRecognizer, v9);
            return objc_loadWeak((id *)p_cachedTextInteractionLoupeGestureRecognizer);
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
  }
  return objc_loadWeak((id *)p_cachedTextInteractionLoupeGestureRecognizer);
}

- (id)textInteractionTapGestureRecognizer
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  p_cachedTextInteractionTapGestureRecognizer = &self->_cachedTextInteractionTapGestureRecognizer;
  if ((WKContentView *)[objc_loadWeak((id *)&self->_cachedTextInteractionTapGestureRecognizer) view] != self)
  {
    objc_storeWeak((id *)p_cachedTextInteractionTapGestureRecognizer, 0);
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    double v4 = (void *)[(WKContentView *)self gestureRecognizers];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          float v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if (objc_msgSend(v9, "_wk_isTextInteractionTapGesture"))
          {
            objc_storeWeak((id *)p_cachedTextInteractionTapGestureRecognizer, v9);
            return objc_loadWeak((id *)p_cachedTextInteractionTapGestureRecognizer);
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
  }
  return objc_loadWeak((id *)p_cachedTextInteractionTapGestureRecognizer);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id m_ptr = self->_keyboardDismissalGestureRecognizer.m_ptr;
  if (m_ptr == a3 || m_ptr == a4) {
    return 1;
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v10 = [(WKContentView *)self deferringGestures];
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v46;
LABEL_10:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v46 != v13) {
        objc_enumerationMutation(v10);
      }
      id v15 = *(id *)(*((void *)&v45 + 1) + 8 * v14);
      id v16 = self->_touchEventGestureRecognizer.m_ptr;
      if (v15 == a4 && v16 == a3) {
        return 1;
      }
      if (v15 == a3 && v16 == a4) {
        return 1;
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v45 objects:v49 count:16];
        if (v12) {
          goto LABEL_10;
        }
        break;
      }
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      return 1;
    }
  }
  id v19 = self->_imageAnalysisDeferringGestureRecognizer.m_ptr;
  if (v19 == a3)
  {
    char v43 = self;
    id v44 = a4;
    return ![(WKContentView *)v43 shouldDeferGestureDueToImageAnalysis:v44];
  }
  if (v19 == a4)
  {
    char v43 = self;
    id v44 = a3;
    return ![(WKContentView *)v43 shouldDeferGestureDueToImageAnalysis:v44];
  }
  if (self->_singleTapGestureRecognizer.m_ptr == a3)
  {
    if (isBuiltInScrollViewPanGestureRecognizer((UIGestureRecognizer *)a4))
    {
      [a4 view];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && !-[WKContentView _isInterruptingDecelerationForScrollViewOrAncestor:](self, "_isInterruptingDecelerationForScrollViewOrAncestor:", [self->_singleTapGestureRecognizer.m_ptr lastTouchedScrollView]))
      {
        return 1;
      }
    }
  }
  id v20 = self->_highlightLongPressGestureRecognizer.m_ptr;
  id v21 = self->_longPressGestureRecognizer.m_ptr;
  BOOL v22 = v20 == a3 && v21 == a4;
  if (v22 || v20 == a4 && v21 == a3) {
    return 1;
  }
  if ([self->_mouseInteraction.m_ptr hasGesture:a4]) {
    return 1;
  }
  id v23 = self->_highlightLongPressGestureRecognizer.m_ptr;
  if ((v23 == a3 || v23 == a4)
    && ((objc_msgSend(a3, "_wk_isTextInteractionLoupeGesture") & 1) != 0
     || (objc_msgSend(a4, "_wk_isTextInteractionLoupeGesture") & 1) != 0
     || (objc_msgSend(a3, "_wk_isTapAndAHalf") & 1) != 0
     || (objc_msgSend(a4, "_wk_isTapAndAHalf") & 1) != 0))
  {
    return 1;
  }
  id v24 = self->_singleTapGestureRecognizer.m_ptr;
  if (v24 == a3)
  {
    if (objc_msgSend(a4, "_wk_isTextInteractionTapGesture")) {
      return 1;
    }
    id v24 = self->_singleTapGestureRecognizer.m_ptr;
  }
  if (v24 != a4) {
    goto LABEL_46;
  }
  if (objc_msgSend(a3, "_wk_isTextInteractionTapGesture")) {
    return 1;
  }
  id v24 = self->_singleTapGestureRecognizer.m_ptr;
LABEL_46:
  id v25 = self->_nonBlockingDoubleTapGestureRecognizer.m_ptr;
  if (v24 == a3 && v25 == a4) {
    return 1;
  }
  if (v24 == a4 && v25 == a3) {
    return 1;
  }
  id v26 = self->_highlightLongPressGestureRecognizer.m_ptr;
  if (v25 == a4 && v26 == a3) {
    return 1;
  }
  if (v25 == a3 && v26 == a4) {
    return 1;
  }
  id v27 = self->_previewSecondaryGestureRecognizer.m_ptr;
  BOOL v29 = v26 == a4 && v27 == a3;
  BOOL v30 = v27 == a4 && v26 == a3;
  BOOL result = 1;
  if (!v30 && !v29)
  {
    id v31 = self->_previewGestureRecognizer.m_ptr;
    BOOL v32 = v26 == a4 && v31 == a3;
    BOOL v33 = v32;
    BOOL v34 = v31 == a4 && v26 == a3;
    if (!v34 && !v33)
    {
      id v35 = self->_doubleTapGestureRecognizerForDoubleClick.m_ptr;
      BOOL v36 = v25 == a4 && v35 == a3;
      BOOL v37 = v36;
      BOOL v38 = v35 == a4 && v25 == a3;
      if (!v38 && !v37)
      {
        id v39 = self->_doubleTapGestureRecognizer.m_ptr;
        BOOL v41 = v35 == a3 && v39 == a4;
        BOOL v42 = v39 == a3 && v35 == a4;
        if (!v42 && !v41) {
          return self->_actionToPerformAfterReceivingEditDragSnapshot.m_block == a3;
        }
      }
    }
  }
  return result;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  if (self->_touchEventGestureRecognizer.m_ptr == a3
    && [(WKContentView *)self _touchEventsMustRequireGestureRecognizerToFail:a4])
  {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }

  return [a4 shouldDeferGestureRecognizer:a3];
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }

  return [a3 shouldDeferGestureRecognizer:a4];
}

- (void)_showImageSheet
{
}

- (void)_showAttachmentSheet
{
  double v3 = (void *)[objc_loadWeak(&self->_webView.m_weakReference) UIDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [[_WKActivatedElementInfo alloc] _initWithType:2 image:0 information:&self->_positionInformation];
    objc_msgSend(v3, "_webView:showCustomSheetForElement:", -[WKContentView webView](self, "webView"), v4);
    if (v4)
    {
      CFRelease(v4);
    }
  }
}

- (void)_showLinkSheet
{
}

- (void)_showDataDetectorsUI
{
}

- (void)_showDataDetectorsUIForPositionInformation:(const void *)a3
{
}

- (SEL)_actionForLongPressFromPositionInformation:(const void *)a3
{
  int v5 = objc_msgSend((id)objc_msgSend(-[WKContentView webView](self, "webView"), "configuration"), "_longPressActionsEnabled");
  SEL result = 0;
  if (v5 && *((unsigned char *)a3 + 23))
  {
    if (*((unsigned char *)a3 + 25))
    {
      return sel__showImageSheet;
    }
    else if (*((unsigned char *)a3 + 24))
    {
      if (WebCore::DataDetection::canBePresentedByDataDetectors((WebCore::DataDetection *)((char *)a3 + 72), v4))return sel__showDataDetectorsUI; {
      else
      }
        return sel__showLinkSheet;
    }
    else if (*((unsigned char *)a3 + 26))
    {
      return sel__showAttachmentSheet;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (SEL)_actionForLongPress
{
  return [(WKContentView *)self _actionForLongPressFromPositionInformation:&self->_positionInformation];
}

- (void)doAfterPositionInformationUpdate:(id)a3 forRequest:(InteractionInformationRequest)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  InteractionInformationRequest v18 = a4;
  if ([(WKContentView *)self _currentPositionInformationIsValidForRequest:&v18])
  {
    WebKit::InteractionInformationAtPosition::InteractionInformationAtPosition((WebKit::InteractionInformationAtPosition *)v19, (const WebKit::InteractionInformationAtPosition *)&self->_positionInformation);
    (*((void (**)(id, unsigned char *))a3 + 2))(a3, v19);
    WebKit::InteractionInformationAtPosition::~InteractionInformationAtPosition((WebKit::InteractionInformationAtPosition *)v19, v6);
    return;
  }
  InteractionInformationRequest v17 = v18;
  uint64_t v7 = _Block_copy(a3);
  p_lastOutstandingPositionInformationRequest = &self->_lastOutstandingPositionInformationRequest;
  unint64_t v9 = *(unsigned int *)&self->_lastOutstandingPositionInformationRequest.var0.__val_.includeImageData;
  if (v9 == *(_DWORD *)&self->_lastOutstandingPositionInformationRequest.var0.__val_.includeSnapshot)
  {
    unint64_t v10 = v9 + (v9 >> 2);
    if (v10 >= 0x10) {
      unint64_t v11 = v10 + 1;
    }
    else {
      unint64_t v11 = 16;
    }
    if (v11 <= v9 + 1) {
      unint64_t v12 = v9 + 1;
    }
    else {
      unint64_t v12 = v11;
    }
    if (v12 >> 27)
    {
      __break(0xC471u);
      return;
    }
    uint64_t v13 = *(WTF **)&p_lastOutstandingPositionInformationRequest->var0.__null_state_;
    uint64_t v14 = WTF::fastMalloc((WTF *)(32 * v12));
    *(_DWORD *)&self->_lastOutstandingPositionInformationRequest.var0.__val_.includeSnapshot = v12;
    *(void *)&p_lastOutstandingPositionInformationRequest->var0.__null_state_ = v14;
    WTF::VectorMover<false,std::optional<std::pair<WebKit::InteractionInformationRequest,WTF::BlockPtr<void ()(WebKit::InteractionInformationAtPosition)>>>>::move((uint64_t)v13, (uint64_t)v13 + 32 * v9, v14);
    if (v13)
    {
      if (*(WTF **)&p_lastOutstandingPositionInformationRequest->var0.__null_state_ == v13)
      {
        *(void *)&p_lastOutstandingPositionInformationRequest->var0.__null_state_ = 0;
        *(_DWORD *)&self->_lastOutstandingPositionInformationRequest.var0.__val_.includeSnapshot = 0;
      }
      WTF::fastFree(v13, v15);
    }
    uint64_t v16 = *(void *)&self->_lastOutstandingPositionInformationRequest.var0.__null_state_
        + 32 * *(unsigned int *)&self->_lastOutstandingPositionInformationRequest.var0.__val_.includeImageData;
  }
  else
  {
    uint64_t v16 = *(void *)&p_lastOutstandingPositionInformationRequest->var0.__null_state_ + 32 * v9;
  }
  *(InteractionInformationRequest *)uint64_t v16 = v17;
  *(void *)(v16 + 16) = v7;
  *(unsigned char *)(v16 + 24) = 1;
  ++*(_DWORD *)&self->_lastOutstandingPositionInformationRequest.var0.__val_.includeImageData;
  _Block_release(0);
  if (![(WKContentView *)self _hasValidOutstandingPositionInformationRequest:&v18])[(WKContentView *)self requestAsynchronousPositionInformationUpdate:v18]; {
}
  }

- (BOOL)ensurePositionInformationIsUpToDate:(InteractionInformationRequest)a3
{
  InteractionInformationRequest v18 = a3;
  if ([(WKContentView *)self _currentPositionInformationIsValidForRequest:&v18])
  {
    return 1;
  }
  id m_ptr = self->_page.m_ptr;
  if (*((unsigned char *)m_ptr + 801) || !*((unsigned char *)m_ptr + 800)) {
    return 0;
  }
  uint64_t v6 = *((void *)m_ptr + 32);
  uint64_t v7 = (unsigned int *)(v6 + 16);
  atomic_fetch_add((atomic_uint *volatile)(v6 + 16), 1u);
  if (!*(void *)(v6 + 144) || BYTE3(self->_dataListSuggestionsControl.m_weakReference))
  {
    BOOL canBeValid = 0;
LABEL_25:
    WTF::ThreadSafeRefCounted<WebKit::AuxiliaryProcessProxy,(WTF::DestructionThread)2>::deref(v7);
    return canBeValid;
  }
  BYTE3(self->_dataListSuggestionsControl.m_weakReference) = 1;
  if (!-[WKContentView _hasValidOutstandingPositionInformationRequest:](self, "_hasValidOutstandingPositionInformationRequest:", &v18))-[WKContentView requestAsynchronousPositionInformationUpdate:](self, "requestAsynchronousPositionInformationUpdate:", *(void *)&v18.point, *(void *)&v18.includeSnapshot); {
  int v8 = (WTF::ApproximateTime *)WebKit::AuxiliaryProcessProxy::protectedConnection((WebKit::AuxiliaryProcessProxy *)v6, &v17);
  }
  unint64_t v9 = v17;
  uint64_t v10 = *(void *)(*((void *)self->_page.m_ptr + 4) + 1928);
  WTF::ApproximateTime::now(v8);
  IPC::Connection::waitForMessage((atomic_uchar *volatile **)v9, 0x795u, v10, 1, (uint64_t)&v19, v11 + 1.0);
  int v12 = v20;
  if (!v20)
  {
    unsigned __int8 v14 = atomic_load((unsigned __int8 *)v9 + 33);
    int v12 = v20;
    if (v14)
    {
      (*(void (**)(void, atomic_uchar *volatile *, uint64_t))(**((void **)v9 + 1) + 16))(*((void *)v9 + 1), v9, v19);
      int v13 = 0;
      int v12 = v20;
    }
    else
    {
      int v13 = 1;
    }
    if (v12 == -1) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v20 == 1)
  {
    int v13 = v19;
LABEL_18:
    ((void (*)(char *, uint64_t *))off_1EEA0EA20[v12])(&v21, &v19);
LABEL_19:
    id v15 = (atomic_uchar **)v17;
    InteractionInformationRequest v17 = 0;
    if (v15) {
      WTF::ThreadSafeWeakPtrControlBlock::strongDeref<IPC::Connection,(WTF::DestructionThread)2>(*v15);
    }
    if (v13) {
      BOOL canBeValid = 0;
    }
    else {
      BOOL canBeValid = self->_positionInformation.canBeValid;
    }
    BYTE1(self->_dataListTextSuggestionsInputView.m_ptr) = canBeValid;
    goto LABEL_25;
  }
  BOOL result = std::__throw_bad_variant_access[abi:sn180100]();
  __break(1u);
  return result;
}

- (void)requestAsynchronousPositionInformationUpdate:(InteractionInformationRequest)a3
{
  InteractionInformationRequest v7 = a3;
  if (![(WKContentView *)self _currentPositionInformationIsValidForRequest:&v7])
  {
    p_m_capacitdouble y = (IntPoint *)&self->_lastSelectionDrawingInfo.selectionGeometries.m_capacity;
    if (LOBYTE(self->_lastSelectionDrawingInfo.selectionClipRect.m_size.m_width))
    {
      *p_m_capacitdouble y = v7.point;
      *(void *)((char *)&self->_lastSelectionDrawingInfo.selectionGeometries.m_size + 3) = *(void *)((char *)&v7.point.m_y + 3);
    }
    else
    {
      *(InteractionInformationRequest *)&p_m_capacity->m_double x = v7;
      LOBYTE(self->_lastSelectionDrawingInfo.selectionClipRect.m_size.m_width) = 1;
    }
    id m_ptr = self->_page.m_ptr;
    uint64_t v6 = *((void *)m_ptr + 32);
    int v8 = &v7;
    WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::RequestPositionInformation>(v6, (uint64_t *)&v8, *(void *)(*((void *)m_ptr + 4) + 1928), 0);
  }
}

- (BOOL)_currentPositionInformationIsValidForRequest:(const InteractionInformationRequest *)a3
{
  return BYTE1(self->_dataListTextSuggestionsInputView.m_ptr)
      && WebKit::InteractionInformationRequest::isValidForRequest((int32x2_t *)&self->_positionInformation, a3, 0);
}

- (BOOL)_hasValidOutstandingPositionInformationRequest:(const InteractionInformationRequest *)a3
{
  p_m_capacitdouble y = (int32x2_t *)&self->_lastSelectionDrawingInfo.selectionGeometries.m_capacity;
  return p_m_capacity[2].i8[0] && WebKit::InteractionInformationRequest::isValidForRequest(p_m_capacity, a3, 0);
}

- (BOOL)_currentPositionInformationIsApproximatelyValidForRequest:(const InteractionInformationRequest *)a3 radiusForApproximation:(int)a4
{
  return BYTE1(self->_dataListTextSuggestionsInputView.m_ptr)
      && WebKit::InteractionInformationRequest::isValidForRequest((int32x2_t *)&self->_positionInformation, a3, a4);
}

- (void)_invokeAndRemovePendingHandlersValidForCurrentPositionInformation
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  ++self->_cachedSelectedTextRange.m_ptr;
  WebKit::InteractionInformationAtPosition::InteractionInformationAtPosition((WebKit::InteractionInformationAtPosition *)v23, (const WebKit::InteractionInformationAtPosition *)&self->_positionInformation);
  p_lastOutstandingPositionInformationRequest = &self->_lastOutstandingPositionInformationRequest;
  LODWORD(v5) = *(_DWORD *)&self->_lastOutstandingPositionInformationRequest.var0.__val_.includeImageData;
  if (v5)
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    do
    {
      int v8 = (const void **)(*(void *)&p_lastOutstandingPositionInformationRequest->var0.__null_state_ + v6);
      LOBYTE(v19) = 0;
      char v21 = 0;
      if (*((unsigned char *)v8 + 24))
      {
        long long v19 = *(_OWORD *)v8;
        int v20 = (void (**)(void *, unsigned char *))_Block_copy(v8[2]);
        char v21 = 1;
        if ([(WKContentView *)self _currentPositionInformationIsValidForRequest:&v19])
        {
          if (v7 >= *(unsigned int *)&self->_lastOutstandingPositionInformationRequest.var0.__val_.includeImageData) {
            goto LABEL_26;
          }
          uint64_t v9 = *(void *)&p_lastOutstandingPositionInformationRequest->var0.__null_state_ + v6;
          if (*(unsigned char *)(v9 + 24))
          {
            _Block_release(*(const void **)(v9 + 16));
            *(unsigned char *)(v9 + 24) = 0;
          }
          if (!v21) {
            __break(1u);
          }
          if (!v20)
          {
            int v13 = 0;
            goto LABEL_14;
          }
          WebKit::InteractionInformationAtPosition::InteractionInformationAtPosition((WebKit::InteractionInformationAtPosition *)v22, (const WebKit::InteractionInformationAtPosition *)v23);
          uint64_t v10 = v20;
          WebKit::InteractionInformationAtPosition::InteractionInformationAtPosition((uint64_t)v24, (uint64_t)v22);
          v10[2](v10, v24);
          WebKit::InteractionInformationAtPosition::~InteractionInformationAtPosition((WebKit::InteractionInformationAtPosition *)v24, v11);
          WebKit::InteractionInformationAtPosition::~InteractionInformationAtPosition((WebKit::InteractionInformationAtPosition *)v22, v12);
        }
        if (v21)
        {
          int v13 = v20;
LABEL_14:
          _Block_release(v13);
        }
      }
      ++v7;
      unint64_t v5 = *(unsigned int *)&self->_lastOutstandingPositionInformationRequest.var0.__val_.includeImageData;
      v6 += 32;
    }
    while (v7 < v5);
  }
  unsigned __int8 v14 = (char *)self->_cachedSelectedTextRange.m_ptr - 1;
  self->_cachedSelectedTextRange.id m_ptr = v14;
  unint64_t v15 = (v5 - 1);
  if ((int)v5 - 1 >= 0 && !v14)
  {
    uint64_t v16 = 32 * (v5 - 1);
    while (v15 < v5)
    {
      uint64_t v17 = *(void *)&p_lastOutstandingPositionInformationRequest->var0.__null_state_ + v16;
      if (!*(unsigned char *)(v17 + 24))
      {
        WTF::VectorMover<false,std::optional<std::pair<WebKit::InteractionInformationRequest,WTF::BlockPtr<void ()(WebKit::InteractionInformationAtPosition)>>>>::move(v17 + 32, *(void *)&p_lastOutstandingPositionInformationRequest->var0.__null_state_ + 32 * v5, v17);
        LODWORD(v5) = *(_DWORD *)&p_lastOutstandingPositionInformationRequest->var0.__val_.includeImageData - 1;
        *(_DWORD *)&p_lastOutstandingPositionInformationRequest->var0.__val_.includeImageData = v5;
      }
      v16 -= 32;
      if ((uint64_t)v15-- <= 0) {
        goto LABEL_24;
      }
    }
LABEL_26:
    __break(0xC471u);
    JUMPOUT(0x19943A034);
  }
LABEL_24:
  WebKit::InteractionInformationAtPosition::~InteractionInformationAtPosition((WebKit::InteractionInformationAtPosition *)v23, v3);
}

- (id)_dataDetectionResults
{
  return (id)*((void *)self->_page.m_ptr + 62);
}

- (BOOL)_pointIsInsideSelectionRect:(CGPoint)a3 outBoundingRect:(FloatRect *)a4
{
  CGPoint v19 = a3;
  unsigned int m_width = self->_lastSelectionDrawingInfo.caretRect.m_size.m_width;
  if (m_width)
  {
    char v6 = 0;
    unint64_t v7 = *(WebCore::SelectionGeometry **)&self->_lastSelectionDrawingInfo.type;
    uint64_t v8 = 84 * m_width;
    do
    {
      uint64_t v17 = WebCore::SelectionGeometry::rect(v7);
      uint64_t v18 = v9;
      if ((int)v9 >= 1 && SHIDWORD(v9) >= 1)
      {
        WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v16, &v19);
        float v10 = roundf(v16[0]);
        int v11 = (int)v10;
        if (v10 <= -2147500000.0) {
          int v11 = 0x80000000;
        }
        if (v10 >= 2147500000.0) {
          int v11 = 0x7FFFFFFF;
        }
        float v12 = roundf(v16[1]);
        if (v12 >= 2147500000.0)
        {
          int v13 = 0x7FFFFFFF;
        }
        else if (v12 <= -2147500000.0)
        {
          int v13 = 0x80000000;
        }
        else
        {
          int v13 = (int)v12;
        }
        BOOL v14 = (int)v17 <= v11 && (int)v18 + (int)v17 > v11 && SHIDWORD(v17) <= v13 && HIDWORD(v18) + HIDWORD(v17) > v13;
        v6 |= v14;
        if (a4)
        {
          WebCore::FloatRect::FloatRect((WebCore::FloatRect *)v16, (const WebCore::IntRect *)&v17);
          WebCore::FloatRect::unite((WebCore::FloatRect *)a4, (const WebCore::FloatRect *)v16);
        }
      }
      unint64_t v7 = (WebCore::SelectionGeometry *)((char *)v7 + 84);
      v8 -= 84;
    }
    while (v8);
  }
  else
  {
    char v6 = 0;
  }
  return v6 & 1;
}

- (BOOL)_shouldToggleSelectionCommandsAfterTapAt:(CGPoint)a3
{
  if (!self->_lastSelectionDrawingInfo.caretRect.m_size.m_width) {
    return 0;
  }
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  BOOL v4 = -[WKContentView _pointIsInsideSelectionRect:outBoundingRect:](self, "_pointIsInsideSelectionRect:outBoundingRect:", &v14, a3.x, a3.y);
  [(WKContentView *)self unobscuredContentRect];
  v10.origin.double x = v5;
  v10.origin.double y = v6;
  v10.size.CGFloat width = v7;
  v10.size.double height = v8;
  WebCore::FloatRect::FloatRect((WebCore::FloatRect *)v11, &v10);
  WebCore::FloatRect::intersect((WebCore::FloatRect *)&v14, (const WebCore::FloatRect *)v11);
  if ((float)(v12 * v13) == 0.0 || (float)((float)(*(float *)&v15 * *((float *)&v15 + 1)) / (float)(v12 * v13)) > 0.75) {
    return 0;
  }
  return v4;
}

- (BOOL)_hasEnclosingScrollView:(id)a3 matchingCriteria:(void *)a4
{
  id v5 = a3;
  if (a3 || (uint64_t v6 = objc_msgSend(-[WKContentView webView](self, "webView"), "scrollView"), (v5 = (id)v6) != 0))
  {
    while (1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && ((*(uint64_t (**)(void, id))(**(void **)a4 + 16))(*(void *)a4, v5) & 1) != 0)
      {
        break;
      }
      uint64_t v6 = [v5 superview];
      id v5 = (id)v6;
      if (!v6) {
        return v6;
      }
    }
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (BOOL)_isPanningScrollViewOrAncestor:(id)a3
{
  id v5 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v5 = &unk_1EEA0EA40;
  uint64_t v9 = v5;
  BOOL v6 = [(WKContentView *)self _hasEnclosingScrollView:a3 matchingCriteria:&v9];
  CGFloat v7 = v9;
  uint64_t v9 = 0;
  if (v7) {
    (*(void (**)(void *))(*v7 + 8))(v7);
  }
  return v6;
}

- (BOOL)_isInterruptingDecelerationForScrollViewOrAncestor:(id)a3
{
  id v5 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v5 = &unk_1EEA0EA68;
  uint64_t v9 = v5;
  BOOL v6 = [(WKContentView *)self _hasEnclosingScrollView:a3 matchingCriteria:&v9];
  CGFloat v7 = v9;
  uint64_t v9 = 0;
  if (v7) {
    (*(void (**)(void *))(*v7 + 8))(v7);
  }
  return v6;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id m_ptr = a3;
  [a3 locationInView:self];
  double v6 = v5;
  double v8 = v7;
  v40.double x = v5;
  v40.double y = v7;
  if (self->_singleTapGestureRecognizer.m_ptr == m_ptr)
  {
LABEL_25:
    if (!-[WKContentView _shouldToggleSelectionCommandsAfterTapAt:](self, "_shouldToggleSelectionCommandsAfterTapAt:", v6, v8))
    {
      uint64_t v14 = [m_ptr lastTouchedScrollView];
      if (![(WKContentView *)self _isPanningScrollViewOrAncestor:v14])
      {
        LOBYTE(v13) = ![(WKContentView *)self _isInterruptingDecelerationForScrollViewOrAncestor:v14];
        return v13;
      }
    }
    goto LABEL_41;
  }
  if (self->_keyboardDismissalGestureRecognizer.m_ptr == m_ptr)
  {
    BOOL v13 = [(WKContentView *)self _hasFocusedElement];
    if (!v13) {
      return v13;
    }
    if ([(WKContentView *)self hasHiddenContentEditable]) {
      goto LABEL_41;
    }
    [(WKContentView *)self selectionClipRect];
    v41.double x = v6;
    v41.double y = v8;
    if (CGRectContainsPoint(v42, v41)) {
      goto LABEL_41;
    }
    id m_ptr = self->_keyboardDismissalGestureRecognizer.m_ptr;
    goto LABEL_25;
  }
  if (self->_doubleTapGestureRecognizerForDoubleClick.m_ptr == m_ptr)
  {
    WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v37, &v40);
    float v15 = roundf(v37[0]);
    uint64_t v16 = 0x7FFFFFFFLL;
    uint64_t v17 = (int)v15;
    if (v15 <= -2147500000.0) {
      uint64_t v17 = 0x80000000;
    }
    if (v15 < 2147500000.0) {
      uint64_t v16 = v17;
    }
    float v18 = roundf(v37[1]);
    uint64_t v19 = 0x7FFFFFFF00000000;
    unint64_t v20 = 0x8000000000000000;
    if (v18 > -2147500000.0) {
      unint64_t v20 = (unint64_t)(int)v18 << 32;
    }
    if (v18 < 2147500000.0) {
      uint64_t v19 = v20;
    }
    uint64_t v38 = v19 | v16;
    LODWORD(v39) = 0x1000000;
    WORD2(v39) = 0;
    BYTE6(v39) = 0;
    [self->_doubleTapGestureRecognizerForDoubleClick.m_ptr allowableMovement];
    if (-[WKContentView _currentPositionInformationIsApproximatelyValidForRequest:radiusForApproximation:](self, "_currentPositionInformationIsApproximatelyValidForRequest:radiusForApproximation:", &v38, (int)v21)|| (BOOL v13 = -[WKContentView ensurePositionInformationIsUpToDate:](self, "ensurePositionInformationIsUpToDate:", v38, v39)))
    {
      if (!self->_positionInformation.nodeAtPositionHasDoubleClickHandler.__engaged_) {
        goto LABEL_41;
      }
      BOOL v22 = self->_positionInformation.nodeAtPositionHasDoubleClickHandler.var0.__null_state_ == 0;
      goto LABEL_57;
    }
  }
  else
  {
    if ((self->_highlightLongPressGestureRecognizer.m_ptr == m_ptr
       || self->_doubleTapGestureRecognizer.m_ptr == m_ptr
       || self->_nonBlockingDoubleTapGestureRecognizer.m_ptr == m_ptr
       || self->_twoFingerDoubleTapGestureRecognizer.m_ptr == m_ptr)
      && [(WKContentView *)self _hasFocusedElement])
    {
      WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)&v38, &v40);
      float v9 = roundf(*(float *)&v38);
      if (v9 >= 2147500000.0)
      {
        uint64_t v10 = 0x7FFFFFFFLL;
      }
      else
      {
        uint64_t v10 = 0x80000000;
        if (v9 > -2147500000.0) {
          uint64_t v10 = (int)v9;
        }
      }
      float v11 = roundf(*((float *)&v38 + 1));
      if (v11 >= 2147500000.0)
      {
        unint64_t v12 = 0x7FFFFFFF00000000;
      }
      else if (v11 <= -2147500000.0)
      {
        unint64_t v12 = 0x8000000000000000;
      }
      else
      {
        unint64_t v12 = (unint64_t)(int)v11 << 32;
      }
      BOOL v13 = -[WKContentView ensurePositionInformationIsUpToDate:](self, "ensurePositionInformationIsUpToDate:", v12 | v10, 0x1000000);
      if (!v13) {
        return v13;
      }
      if (self->_anon_7d0[32]
        && WebCore::ElementContext::isSameElement((WebCore::ElementContext *)(&self->_positionInformation.elementContext.var0.var2 + 1), &self->_focusedElementInformation.elementContext))
      {
        goto LABEL_41;
      }
    }
    if (self->_highlightLongPressGestureRecognizer.m_ptr == m_ptr)
    {
      if (-[WKContentView _isInterruptingDecelerationForScrollViewOrAncestor:](self, "_isInterruptingDecelerationForScrollViewOrAncestor:", [m_ptr lastTouchedScrollView]))
      {
        goto LABEL_41;
      }
      if (![(WKContentView *)self _hasFocusedElement])
      {
        BYTE1(self->_dataListTextSuggestionsInputView.m_ptr) = 0;
        WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)&v38, &v40);
        float v27 = roundf(*(float *)&v38);
        if (v27 >= 2147500000.0)
        {
          uint64_t v28 = 0x7FFFFFFFLL;
        }
        else
        {
          uint64_t v28 = 0x80000000;
          if (v27 > -2147500000.0) {
            uint64_t v28 = (int)v27;
          }
        }
        float v29 = roundf(*((float *)&v38 + 1));
        if (v29 >= 2147500000.0)
        {
          unint64_t v30 = 0x7FFFFFFF00000000;
        }
        else if (v29 <= -2147500000.0)
        {
          unint64_t v30 = 0x8000000000000000;
        }
        else
        {
          unint64_t v30 = (unint64_t)(int)v29 << 32;
        }
        unint64_t v31 = v30 | v28;
        if (objc_msgSend((id)-[WKContentView traitCollection](self, "traitCollection"), "forceTouchCapability") == 2)
        {
          if ([(WKContentView *)self _shouldUseContextMenus]) {
            uint64_t v32 = 16777473;
          }
          else {
            uint64_t v32 = 0x1000001000101;
          }
          int v33 = objc_msgSend(-[WKContentView webView](self, "webView"), "_allowAnimationControls");
          uint64_t v34 = 0x10000000000;
          if (!v33) {
            uint64_t v34 = 0;
          }
          uint64_t v35 = v34 | v32;
        }
        else
        {
          uint64_t v35 = 0x1000000;
        }
        -[WKContentView requestAsynchronousPositionInformationUpdate:](self, "requestAsynchronousPositionInformationUpdate:", v31, v35);
        goto LABEL_20;
      }
      if (!self->_positionInformation.isElement) {
        goto LABEL_41;
      }
LABEL_56:
      BOOL v22 = [(WKContentView *)self _actionForLongPress] == 0;
LABEL_57:
      LOBYTE(v13) = !v22;
      return v13;
    }
    if (self->_longPressGestureRecognizer.m_ptr != m_ptr)
    {
LABEL_20:
      LOBYTE(v13) = 1;
      return v13;
    }
    WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)&v38, &v40);
    float v23 = roundf(*(float *)&v38);
    if (v23 >= 2147500000.0)
    {
      uint64_t v24 = 0x7FFFFFFFLL;
    }
    else
    {
      uint64_t v24 = 0x80000000;
      if (v23 > -2147500000.0) {
        uint64_t v24 = (int)v23;
      }
    }
    float v25 = roundf(*((float *)&v38 + 1));
    if (v25 >= 2147500000.0)
    {
      unint64_t v26 = 0x7FFFFFFF00000000;
    }
    else if (v25 <= -2147500000.0)
    {
      unint64_t v26 = 0x8000000000000000;
    }
    else
    {
      unint64_t v26 = (unint64_t)(int)v25 << 32;
    }
    BOOL v13 = -[WKContentView ensurePositionInformationIsUpToDate:](self, "ensurePositionInformationIsUpToDate:", v26 | v24, 0x1000000);
    if (v13)
    {
      if ([(WKContentView *)self _hasFocusedElement])
      {
        if (!self->_anon_7d0[32]
          || !WebCore::ElementContext::isSameElement((WebCore::ElementContext *)(&self->_positionInformation.elementContext.var0.var2 + 1), &self->_focusedElementInformation.elementContext))
        {
          goto LABEL_20;
        }
LABEL_41:
        LOBYTE(v13) = 0;
        return v13;
      }
      goto LABEL_56;
    }
  }
  return v13;
}

- (void)_finishInteraction
{
  BYTE2(self->_dataListTextSuggestionsInputView.m_ptr) = 0;
  [(WKContentView *)self _fadeTapHighlightViewIfNeeded];
}

- (void)_fadeTapHighlightViewIfNeeded
{
  if ([self->_tapHighlightView.m_ptr superview] && !BYTE3(self->_dataListTextSuggestionsInputView.m_ptr))
  {
    BYTE3(self->_dataListTextSuggestionsInputView.m_ptr) = 1;
    double v3 = 0.1;
    if (LOBYTE(self->_dataListSuggestionsControl.m_weakReference)) {
      double v3 = 0.25;
    }
    v4[4] = self;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __61__WKContentView_WKInteraction___fadeTapHighlightViewIfNeeded__block_invoke;
    v5[3] = &unk_1E5812158;
    v5[4] = self;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __61__WKContentView_WKInteraction___fadeTapHighlightViewIfNeeded__block_invoke_2;
    v4[3] = &unk_1E5813860;
    [MEMORY[0x1E4F42FF0] animateWithDuration:v5 animations:v4 completion:v3];
  }
}

uint64_t __61__WKContentView_WKInteraction___fadeTapHighlightViewIfNeeded__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 752) setAlpha:0.0];
}

uint64_t __61__WKContentView_WKInteraction___fadeTapHighlightViewIfNeeded__block_invoke_2(uint64_t result, int a2)
{
  uint64_t v2 = result;
  if (a2) {
    BOOL result = [*(id *)(*(void *)(result + 32) + 752) removeFromSuperview];
  }
  *(unsigned char *)(*(void *)(v2 + 32) + 2955) = 0;
  return result;
}

- (BOOL)canShowNonEmptySelectionView
{
  if (self->_suppressSelectionAssistantReasons.m_storage) {
    return 0;
  }
  uint64_t v3 = *((void *)self->_page.m_ptr + 4);
  int v4 = *(unsigned __int8 *)(v3 + 576);
  int v5 = *(unsigned __int8 *)(v3 + 249);
  return v4 && v5 == 0;
}

- (BOOL)hasSelectablePositionAtPoint:(CGPoint)a3
{
  CGPoint v13 = a3;
  if (objc_msgSend(self->_imageAnalysisContextMenuActionData.var0.__val_.copySubjectResult.m_ptr, "interactableItemExistsAtPoint:"))goto LABEL_2; {
  BoolValueForKedouble y = objc_msgSend((id)objc_msgSend(-[WKContentView webView](self, "webView"), "configuration"), "_textInteractionGesturesEnabled");
  }
  if (BoolValueForKey)
  {
    uint64_t v6 = *((void *)self->_page.m_ptr + 34);
    {
      WebKit::WebPreferencesKey::textInteractionEnabledKey(void)::$_0::operator() const(void)::impl += 2;
      WebKit::WebPreferencesKey::textInteractionEnabledKey(void)::kedouble y = (uint64_t)&WebKit::WebPreferencesKey::textInteractionEnabledKey(void)::$_0::operator() const(void)::impl;
    }
    BoolValueForKedouble y = WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)(v6 + 40), (WTF::StringImpl **)&WebKit::WebPreferencesKey::textInteractionEnabledKey(void)::key, v5);
    if (BoolValueForKey)
    {
      if (self->_suppressSelectionAssistantReasons.m_storage || BYTE4(self->_dataListTextSuggestions.m_ptr))
      {
LABEL_2:
        LOBYTE(BoolValueForKey) = 0;
        return BoolValueForKey;
      }
      WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v12, &v13);
      float v7 = roundf(v12[0]);
      if (v7 >= 2147500000.0)
      {
        uint64_t v8 = 0x7FFFFFFFLL;
      }
      else
      {
        uint64_t v8 = 0x80000000;
        if (v7 > -2147500000.0) {
          uint64_t v8 = (int)v7;
        }
      }
      float v9 = roundf(v12[1]);
      if (v9 >= 2147500000.0)
      {
        unint64_t v10 = 0x7FFFFFFF00000000;
      }
      else if (v9 <= -2147500000.0)
      {
        unint64_t v10 = 0x8000000000000000;
      }
      else
      {
        unint64_t v10 = (unint64_t)(int)v9 << 32;
      }
      BoolValueForKedouble y = -[WKContentView ensurePositionInformationIsUpToDate:](self, "ensurePositionInformationIsUpToDate:", v10 | v8, 0x1000000);
      if (BoolValueForKey) {
        LOBYTE(BoolValueForKey) = self->_anon_e70[0]
      }
                               && std::operator==[abi:sn180100]<WebCore::ElementContext,WebCore::ElementContext>((uint64_t)&self->_anon_7d0[48], (const ElementContext *)&self->_imageAnalysisGestureRecognizer)|| self->_positionInformation.selectability == 0;
    }
  }
  return BoolValueForKey;
}

- (BOOL)pointIsNearMarkedText:(CGPoint)a3
{
  CGPoint v13 = a3;
  if (objc_msgSend(self->_imageAnalysisContextMenuActionData.var0.__val_.copySubjectResult.m_ptr, "interactableItemExistsAtPoint:"))goto LABEL_2; {
  BoolValueForKedouble y = objc_msgSend((id)objc_msgSend(-[WKContentView webView](self, "webView"), "configuration"), "_textInteractionGesturesEnabled");
  }
  if (BoolValueForKey)
  {
    uint64_t v6 = *((void *)self->_page.m_ptr + 34);
    {
      WebKit::WebPreferencesKey::textInteractionEnabledKey(void)::$_0::operator() const(void)::impl += 2;
      WebKit::WebPreferencesKey::textInteractionEnabledKey(void)::kedouble y = (uint64_t)&WebKit::WebPreferencesKey::textInteractionEnabledKey(void)::$_0::operator() const(void)::impl;
    }
    BoolValueForKedouble y = WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)(v6 + 40), (WTF::StringImpl **)&WebKit::WebPreferencesKey::textInteractionEnabledKey(void)::key, v5);
    if (BoolValueForKey)
    {
      if (self->_suppressSelectionAssistantReasons.m_storage)
      {
LABEL_2:
        LOBYTE(BoolValueForKey) = 0;
        return BoolValueForKey;
      }
      WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v12, &v13);
      float v7 = roundf(v12[0]);
      if (v7 >= 2147500000.0)
      {
        uint64_t v8 = 0x7FFFFFFFLL;
      }
      else
      {
        uint64_t v8 = 0x80000000;
        if (v7 > -2147500000.0) {
          uint64_t v8 = (int)v7;
        }
      }
      float v9 = roundf(v12[1]);
      if (v9 >= 2147500000.0)
      {
        unint64_t v10 = 0x7FFFFFFF00000000;
      }
      else if (v9 <= -2147500000.0)
      {
        unint64_t v10 = 0x8000000000000000;
      }
      else
      {
        unint64_t v10 = (unint64_t)(int)v9 << 32;
      }
      BoolValueForKedouble y = -[WKContentView ensurePositionInformationIsUpToDate:](self, "ensurePositionInformationIsUpToDate:", v10 | v8, 0x1000000);
      if (BoolValueForKey) {
        LOBYTE(BoolValueForKey) = self->_positionInformation.isNearMarkedText;
      }
    }
  }
  return BoolValueForKey;
}

- (BOOL)textInteractionGesture:(int64_t)a3 shouldBeginAtPoint:(CGPoint)a4
{
  CGPoint v15 = a4;
  if (a3 == 15)
  {
    LOBYTE(BoolValueForKey) = -[WKContentView hasSelectablePositionAtPoint:](self, "hasSelectablePositionAtPoint:");
    return BoolValueForKey;
  }
  if (objc_msgSend(self->_imageAnalysisContextMenuActionData.var0.__val_.copySubjectResult.m_ptr, "interactableItemExistsAtPoint:"))goto LABEL_6; {
  BoolValueForKedouble y = objc_msgSend((id)objc_msgSend(-[WKContentView webView](self, "webView"), "configuration"), "_textInteractionGesturesEnabled");
  }
  if (BoolValueForKey)
  {
    uint64_t v8 = *((void *)self->_page.m_ptr + 34);
    {
      WebKit::WebPreferencesKey::textInteractionEnabledKey(void)::$_0::operator() const(void)::impl += 2;
      WebKit::WebPreferencesKey::textInteractionEnabledKey(void)::kedouble y = (uint64_t)&WebKit::WebPreferencesKey::textInteractionEnabledKey(void)::$_0::operator() const(void)::impl;
    }
    BoolValueForKedouble y = WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)(v8 + 40), (WTF::StringImpl **)&WebKit::WebPreferencesKey::textInteractionEnabledKey(void)::key, v7);
    if (BoolValueForKey)
    {
      if (*(void *)&self->_hasSetUpInteractions || self->_suppressSelectionAssistantReasons.m_storage) {
        goto LABEL_6;
      }
      if (![(WKContentView *)self isFocusingElement])
      {
        if (a3 == 3) {
          goto LABEL_6;
        }
        if (a3 == 1)
        {
          if (self->_dropAnimationCount <= 0
            && (objc_msgSend(-[WKContentView textInteractionLoupeGestureRecognizer](self, "textInteractionLoupeGestureRecognizer"), "_wk_hasRecognizedOrEnded") & 1) == 0)
          {
            LOBYTE(BoolValueForKey) = *(unsigned char *)(*((void *)self->_page.m_ptr + 4) + 250) != 0;
            return BoolValueForKey;
          }
          goto LABEL_6;
        }
      }
      WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v14, &v15);
      float v9 = roundf(v14[0]);
      if (v9 >= 2147500000.0)
      {
        uint64_t v10 = 0x7FFFFFFFLL;
      }
      else
      {
        uint64_t v10 = 0x80000000;
        if (v9 > -2147500000.0) {
          uint64_t v10 = (int)v9;
        }
      }
      float v11 = roundf(v14[1]);
      if (v11 >= 2147500000.0) {
        unint64_t v12 = 0x7FFFFFFF00000000;
      }
      else {
        unint64_t v12 = v11 <= -2147500000.0 ? 0x8000000000000000 : (unint64_t)(int)v11 << 32;
      }
      BoolValueForKedouble y = -[WKContentView ensurePositionInformationIsUpToDate:](self, "ensurePositionInformationIsUpToDate:", v12 | v10, 0x1000000);
      if (BoolValueForKey)
      {
        if ((a3 || self->_positionInformation.selectability != 3) && !self->_positionInformation.preventTextInteraction)
        {
          if (!self->_anon_e70[0]
            || !std::operator==[abi:sn180100]<WebCore::ElementContext,WebCore::ElementContext>((uint64_t)&self->_anon_7d0[48], (const ElementContext *)&self->_imageAnalysisGestureRecognizer))
          {
            if ([(WKContentView *)self isFocusingElement])
            {
              if (self->_anon_7d0[32])
              {
                LOBYTE(BoolValueForKey) = WebCore::ElementContext::isSameElement((WebCore::ElementContext *)(&self->_positionInformation.elementContext.var0.var2+ 1), &self->_focusedElementInformation.elementContext);
                return BoolValueForKey;
              }
              goto LABEL_6;
            }
            LOBYTE(BoolValueForKey) = !self->_positionInformation.prefersDraggingOverTextSelection;
            if (a3 || self->_positionInformation.prefersDraggingOverTextSelection) {
              return BoolValueForKey;
            }
            if (-[WKContentView hasSelectablePositionAtPoint:](self, "hasSelectablePositionAtPoint:", v15.x, v15.y)) {
              [(WKContentView *)self _cancelLongPressGestureRecognizer];
            }
          }
          LOBYTE(BoolValueForKey) = 1;
          return BoolValueForKey;
        }
LABEL_6:
        LOBYTE(BoolValueForKey) = 0;
      }
    }
  }
  return BoolValueForKey;
}

- (id)webSelectionRectsForSelectionGeometries:(const void *)a3
{
  if (!*((_DWORD *)a3 + 3)) {
    return 0;
  }
  int v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*((unsigned int *)a3 + 3)];
  int v5 = *((_DWORD *)a3 + 3);
  if (v5)
  {
    uint64_t v6 = *(unsigned __int8 **)a3;
    float v7 = &v6[84 * v5];
    do
    {
      uint64_t v8 = (void *)[MEMORY[0x1E4FB6DF8] selectionRect];
      uint64_t v11 = WebCore::SelectionGeometry::rect((WebCore::SelectionGeometry *)v6);
      uint64_t v12 = v9;
      WebCore::IntRect::operator CGRect();
      objc_msgSend(v8, "setRect:", v11, v12);
      [v8 setWritingDirection:v6[33]];
      [v8 setIsLineBreak:v6[52]];
      [v8 setIsFirstOnLine:v6[53]];
      [v8 setIsLastOnLine:v6[54]];
      [v8 setContainsStart:v6[55]];
      [v8 setContainsEnd:v6[56]];
      [v8 setIsInFixedPosition:v6[58]];
      [v8 setIsHorizontal:v6[57]];
      if (v8) {
        [v4 addObject:v8];
      }
      v6 += 84;
    }
    while (v6 != v7);
  }
  return (id)(id)CFMakeCollectable(v4);
}

- (id)webSelectionRects
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    int v5 = qword_1EB3586B8;
    if (os_log_type_enabled((os_log_t)qword_1EB3586B8, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315138;
      float v7 = "-[WKContentView(WKInteraction) webSelectionRects]";
      _os_log_error_impl(&dword_1985F2000, v5, OS_LOG_TYPE_ERROR, "Received unexpected call to %s", (uint8_t *)&v6, 0xCu);
    }
    __break(0xC471u);
    JUMPOUT(0x19943B3FCLL);
  }
  uint64_t v3 = (unsigned char *)*((void *)self->_page.m_ptr + 4);
  if (!v3[576] || !v3[704] || v3[249]) {
    return 0;
  }

  return [(WKContentView *)self webSelectionRectsForSelectionGeometries:v3 + 640];
}

- (ObjectIdentifierGeneric<WebKit::TapIdentifierType,)nextTapIdentifier
{
  unint64_t IdentifierInternal = WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>::generateIdentifierInternal();
  self->_latestTapID.m_value.unint64_t m_identifier = IdentifierInternal;
  if (!IdentifierInternal)
  {
    unint64_t IdentifierInternal = 146;
    __break(0xC471u);
  }
  return (ObjectIdentifierGeneric<WebKit::TapIdentifierType, WTF::ObjectIdentifierMainThreadAccessTraits<uint64_t>, unsigned long long, WTF::SupportsObjectIdentifierNullState::No>)IdentifierInternal;
}

- (void)_highlightLongPressRecognized:(id)a3
{
  [(WKContentView *)self _resetIsDoubleTapPending];
  [a3 startPoint];
  double v6 = v5;
  double v8 = v7;
  v14.double x = v5;
  v14.double y = v7;
  *(CGPoint *)&self->_keyWebEventHandlers.m_inlineBuffer[0].__lx[16] = v14;
  uint64_t v9 = [a3 state];
  switch(v9)
  {
    case 4:
      [(WKContentView *)self _cancelInteraction];
      BYTE6(self->_dataListTextSuggestionsInputView.m_ptr) = 0;
      break;
    case 3:
      if (BYTE6(self->_dataListTextSuggestionsInputView.m_ptr) && self->_positionInformation.isElement)
      {
        -[WKContentView _attemptSyntheticClickAtLocation:modifierFlags:](self, "_attemptSyntheticClickAtLocation:modifierFlags:", [a3 modifierFlags], v6, v8);
        [(WKContentView *)self _finishInteraction];
      }
      else
      {
        [(WKContentView *)self _cancelInteraction];
      }
      BYTE6(self->_dataListTextSuggestionsInputView.m_ptr) = 0;
      break;
    case 1:
      BYTE6(self->_dataListTextSuggestionsInputView.m_ptr) = 1;
      cancelPotentialTapIfNecessary(self);
      id m_ptr = self->_page.m_ptr;
      WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)&v13, &v14);
      v11.unint64_t m_identifier = (unint64_t)[(WKContentView *)self nextTapIdentifier];
      v15[1] = &v13;
      unint64_t m_identifier = v11.m_identifier;
      uint64_t v12 = *((void *)m_ptr + 32);
      v15[0] = &m_identifier;
      WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::TapHighlightAtPosition>(v12, (uint64_t)v15, *(void *)(*((void *)m_ptr + 4) + 1928), 0);
      BYTE2(self->_dataListTextSuggestionsInputView.m_ptr) = 1;
      break;
  }
}

- (void)_doubleTapRecognizedForDoubleClick:(id)a3
{
  id m_ptr = self->_page.m_ptr;
  [a3 locationInView:self];
  v11.double x = v6;
  v11.double y = v7;
  WebCore::IntPoint::IntPoint((WebCore::IntPoint *)v12, &v11);
  unsigned int v8 = [a3 modifierFlags];
  uint64_t v9 = *(void *)&self->_keyWebEventHandlers.m_inlineBuffer[0].__lx[32];
  char v15 = (v8 >> 12) & 0x10 | (v8 >> 17) & 0xF;
  uint64_t v10 = *((void *)m_ptr + 32);
  v13[0] = v12;
  v13[1] = &v15;
  v13[2] = &v14;
  uint64_t v14 = v9;
  WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::HandleDoubleTapForDoubleClickAtPoint>(v10, (uint64_t)v13, *(void *)(*((void *)m_ptr + 4) + 1928), 0);
}

- (void)_twoFingerSingleTapGestureRecognized:(id)a3
{
  BYTE2(self->_dataListTextSuggestionsInputView.m_ptr) = 1;
  HIBYTE(self->_dataListTextSuggestions.m_ptr) = 1;
  id m_ptr = self->_page.m_ptr;
  [a3 locationInView:self];
  v18.double x = v6;
  v18.double y = v7;
  WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v19, &v18);
  float v8 = roundf(v19[0]);
  uint64_t v9 = 0x7FFFFFFFLL;
  uint64_t v10 = (int)v8;
  if (v8 <= -2147500000.0) {
    uint64_t v10 = 0x80000000;
  }
  if (v8 < 2147500000.0) {
    uint64_t v9 = v10;
  }
  float v11 = roundf(v19[1]);
  uint64_t v12 = 0x7FFFFFFF00000000;
  unint64_t v13 = 0x8000000000000000;
  if (v11 > -2147500000.0) {
    unint64_t v13 = (unint64_t)(int)v11 << 32;
  }
  if (v11 < 2147500000.0) {
    uint64_t v12 = v13;
  }
  uint64_t v20 = v12 | v9;
  unsigned int v14 = [a3 modifierFlags];
  char v15 = (v14 >> 12) & 0x10 | (v14 >> 17) & 7 | 8;
  v16.unint64_t m_identifier = (unint64_t)[(WKContentView *)self nextTapIdentifier];
  char v23 = v15;
  unint64_t m_identifier = v16.m_identifier;
  uint64_t v17 = *((void *)m_ptr + 32);
  v21[0] = &v20;
  v21[1] = &v23;
  float v21[2] = &m_identifier;
  WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::HandleTwoFingerTapAtPoint>(v17, (uint64_t)v21, *(void *)(*((void *)m_ptr + 4) + 1928), 0);
}

- (void)_longPressRecognized:(id)a3
{
  [(WKContentView *)self _resetIsDoubleTapPending];
  [(WKContentView *)self _cancelTouchEventGestureRecognizer];
  id m_ptr = self->_page.m_ptr;
  uint64_t v6 = *((void *)m_ptr + 32);
  char v10 = 0;
  WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::DidRecognizeLongPress>(v6, (uint64_t)&v10, *(void *)(*((void *)m_ptr + 4) + 1928), 0);
  [a3 startPoint];
  *(void *)&self->_keyWebEventHandlers.m_inlineBuffer[0].__lx[16] = v7;
  *(void *)&self->_keyWebEventHandlers.m_inlineBuffer[0].__lx[24] = v8;
  if ([a3 state] == 1)
  {
    uint64_t v9 = [(WKContentView *)self _actionForLongPress];
    if (v9)
    {
      [(WKContentView *)self performSelector:v9];
      [(WKContentView *)self _cancelLongPressGestureRecognizer];
    }
  }
}

- (void)_endPotentialTapAndEnableDoubleTapGesturesIfNecessary
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend(-[WKContentView webView](self, "webView"), "_allowsDoubleTapGestures"))
  {
    uint64_t v3 = qword_1EB358708;
    if (os_log_type_enabled((os_log_t)qword_1EB358708, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(*((void *)self->_page.m_ptr + 4) + 760);
      int v7 = 134218240;
      uint64_t v8 = self;
      __int16 v9 = 2048;
      uint64_t v10 = v4;
      _os_log_impl(&dword_1985F2000, v3, OS_LOG_TYPE_DEFAULT, "ending potential tap - double taps are back. (%p, pageProxyID=%llu)", (uint8_t *)&v7, 0x16u);
    }
    [(WKContentView *)self _setDoubleTapGesturesEnabled:1];
  }
  CGFloat v5 = qword_1EB358708;
  if (os_log_type_enabled((os_log_t)qword_1EB358708, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(*((void *)self->_page.m_ptr + 4) + 760);
    int v7 = 134218240;
    uint64_t v8 = self;
    __int16 v9 = 2048;
    uint64_t v10 = v6;
    _os_log_impl(&dword_1985F2000, v5, OS_LOG_TYPE_DEFAULT, "Ending potential tap. (%p, pageProxyID=%llu)", (uint8_t *)&v7, 0x16u);
  }
  BYTE4(self->_dataListTextSuggestionsInputView.m_ptr) = 0;
}

- (void)_singleTapIdentified:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [a3 locationInView:self];
  if (!-[WKContentView _handleTapOverInteractiveControl:](self, "_handleTapOverInteractiveControl:", v4, v5))
  {
    [(WKContentView *)self _resetIsDoubleTapPending];
    objc_msgSend(self->_inputPeripheral.m_ptr, "setSingleTapShouldEndEditing:", objc_msgSend(self->_inputPeripheral.m_ptr, "isEditing"));
    uint64_t v7 = *((void *)self->_page.m_ptr + 34);
    {
      WebKit::WebPreferencesKey::fasterClicksEnabledKey(void)::$_0::operator() const(void)::impl += 2;
      WebKit::WebPreferencesKey::fasterClicksEnabledKey(void)::kedouble y = (uint64_t)&WebKit::WebPreferencesKey::fasterClicksEnabledKey(void)::$_0::operator() const(void)::impl;
    }
    BoolValueForKedouble y = WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)(v7 + 40), (WTF::StringImpl **)&WebKit::WebPreferencesKey::fasterClicksEnabledKey(void)::key, v6);
    char v9 = BoolValueForKey;
    if (BoolValueForKey)
    {
      uint64_t v10 = qword_1EB358708;
      if (os_log_type_enabled((os_log_t)qword_1EB358708, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(*((void *)self->_page.m_ptr + 4) + 760);
        *(_DWORD *)buf = 134218240;
        char v15 = self;
        __int16 v16 = 2048;
        uint64_t v17 = v11;
        _os_log_impl(&dword_1985F2000, v10, OS_LOG_TYPE_DEFAULT, "Single tap identified. Request details on potential zoom. (%p, pageProxyID=%llu)", buf, 0x16u);
      }
    }
    id m_ptr = self->_page.m_ptr;
    WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)buf, &v13);
    WebKit::WebPageProxy::potentialTapAtPosition(m_ptr, (uint64_t)buf, v9, [(WKContentView *)self nextTapIdentifier]);
    BYTE4(self->_dataListTextSuggestionsInputView.m_ptr) = 1;
    BYTE2(self->_dataListTextSuggestionsInputView.m_ptr) = 1;
    HIBYTE(self->_dataListTextSuggestions.m_ptr) = [self->_doubleTapGestureRecognizer.m_ptr isEnabled] ^ 1;
  }
}

- (void)_singleTapDidReset:(id)a3
{
  cancelPotentialTapIfNecessary(self);
  uint64_t v4 = (void *)[self->_singleTapGestureRecognizer.m_ptr lastActiveTouchIdentifier];
  if (v4)
  {
    int v5 = [v4 unsignedIntValue];
    if (LODWORD(self->_revealFocusedElementDeferrer.m_ptr) != v5)
    {
      id m_ptr = self->_page.m_ptr;
      int v8 = v5;
      uint64_t v7 = &v8;
      WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::TouchWithIdentifierWasRemoved>(*((void *)m_ptr + 32), &v7, *(void *)(*((void *)m_ptr + 4) + 1928), 0);
    }
  }
  if (!BYTE2(self->_dataListTextSuggestionsInputView.m_ptr))
  {
    [(WKContentView *)self _fadeTapHighlightViewIfNeeded];
  }
}

- (void)_keyboardDismissalGestureRecognized:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([(WKContentView *)self _hasFocusedElement])
  {
    id m_ptr = self->_page.m_ptr;
    [a3 locationInView:self];
    v16.double x = v6;
    v16.double y = v7;
    WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v17, &v16);
    location[0] = 0;
    objc_initWeak(location, self);
    long long v8 = *(_OWORD *)&self->_focusedElementInformation.elementIdentifier.m_value.m_identifier;
    long long v21 = *(long long *)((char *)&self->_focusedElementInformation.elementContext.documentIdentifier + 8);
    long long v22 = v8;
    *(void *)&long long v23 = *(void *)&self->_anon_938[8];
    long long v9 = *(_OWORD *)&self->_focusedElementInformation.elementContext.webPageIdentifier.m_value.m_identifier;
    FloatRect boundingRect = self->_focusedElementInformation.elementContext.boundingRect;
    long long v20 = v9;
    uint64_t v10 = WTF::fastMalloc((WTF *)0x70);
    *(void *)uint64_t v10 = &unk_1EEA0EA90;
    *(void *)(v10 + 16) = 0;
    objc_moveWeak((id *)(v10 + 16), location);
    long long v12 = v22;
    long long v11 = v23;
    *(_OWORD *)(v10 + 64) = v21;
    *(_OWORD *)(v10 + 80) = v12;
    *(_OWORD *)(v10 + 96) = v11;
    long long v13 = v20;
    *(FloatRect *)(v10 + 32) = boundingRect;
    *(_OWORD *)(v10 + 48) = v13;
    uint64_t v15 = v10;
    WebKit::WebPageProxy::shouldDismissKeyboardAfterTapAtPoint((uint64_t)m_ptr, &v15, v17[0], v17[1]);
    uint64_t v14 = v15;
    uint64_t v15 = 0;
    if (v14) {
      (*(void (**)(uint64_t))(*(void *)v14 + 8))(v14);
    }
    objc_destroyWeak(location);
  }
}

- (void)_doubleTapDidFail:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = qword_1EB358708;
  if (os_log_type_enabled((os_log_t)qword_1EB358708, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(*((void *)self->_page.m_ptr + 4) + 760);
    int v6 = 134218240;
    CGFloat v7 = self;
    __int16 v8 = 2048;
    uint64_t v9 = v5;
    _os_log_impl(&dword_1985F2000, v4, OS_LOG_TYPE_DEFAULT, "Double tap was not recognized. (%p, pageProxyID=%llu)", (uint8_t *)&v6, 0x16u);
  }
}

- (void)_commitPotentialTapFailed
{
  id m_ptr = self->_page.m_ptr;
  int v5 = (int)self->_revealFocusedElementDeferrer.m_ptr;
  uint64_t v4 = &v5;
  WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::TouchWithIdentifierWasRemoved>(*((void *)m_ptr + 32), &v4, *(void *)(*((void *)m_ptr + 4) + 1928), 0);
  LODWORD(self->_revealFocusedElementDeferrer.m_ptr) = 0;
  [(WKContentView *)self _cancelInteraction];

  [(WKContentView *)self stopDeferringInputViewUpdates:2];
}

- (void)_didNotHandleTapAsClick:(const IntPoint *)a3
{
  [(WKContentView *)self stopDeferringInputViewUpdates:2];
  if (BYTE5(self->_dataListTextSuggestionsInputView.m_ptr))
  {
    value = self->_smartMagnificationController.__ptr_.__value_;
    WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)&v7, (const CGPoint *)&self->_keyWebEventHandlers.m_inlineBuffer[0].__lx[16]);
    uint64_t v9 = v7;
    uint64_t v5 = *((void *)value + 2);
    uint64_t v6 = *(void *)(v5 + 256);
    __int16 v8 = (float *)&v9;
    WebKit::AuxiliaryProcessProxy::send<Messages::ViewGestureGeometryCollector::CollectGeometryForSmartMagnificationGesture>(v6, &v8, *(void *)(*(void *)(v5 + 32) + 1928), 0);
    BYTE5(self->_dataListTextSuggestionsInputView.m_ptr) = 0;
  }
}

- (void)_didHandleTapAsHover
{
}

- (void)_didCompleteSyntheticClick
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id m_ptr = self->_page.m_ptr;
  int v6 = (int)self->_revealFocusedElementDeferrer.m_ptr;
  *(void *)buf = &v6;
  WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::TouchWithIdentifierWasRemoved>(*((void *)m_ptr + 32), (int **)buf, *(void *)(*((void *)m_ptr + 4) + 1928), 0);
  LODWORD(self->_revealFocusedElementDeferrer.m_ptr) = 0;
  uint64_t v4 = qword_1EB358708;
  if (os_log_type_enabled((os_log_t)qword_1EB358708, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(*((void *)self->_page.m_ptr + 4) + 760);
    *(_DWORD *)buf = 134218240;
    *(void *)&uint8_t buf[4] = self;
    __int16 v8 = 2048;
    uint64_t v9 = v5;
    _os_log_impl(&dword_1985F2000, v4, OS_LOG_TYPE_DEFAULT, "Synthetic click completed. (%p, pageProxyID=%llu)", buf, 0x16u);
  }
  [(WKContentView *)self stopDeferringInputViewUpdates:2];
}

- (void)_singleTapRecognized:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (BYTE4(self->_dataListTextSuggestionsInputView.m_ptr))
  {
    if (([(WKContentView *)self isFirstResponder] & 1) == 0)
    {
      [(WKContentView *)self startDeferringInputViewUpdates:2];
      [(WKContentView *)self becomeFirstResponder];
    }
    [a3 locationInView:self];
    *(void *)&self->_keyWebEventHandlers.m_inlineBuffer[0].__lx[16] = v5;
    *(void *)&self->_keyWebEventHandlers.m_inlineBuffer[0].__lx[24] = v6;
    [(WKContentView *)self _endPotentialTapAndEnableDoubleTapGesturesIfNecessary];
    if (HIBYTE(self->_dataListTextSuggestionsInputView.m_ptr))
    {
      [(WKContentView *)self _showTapHighlight];
      HIBYTE(self->_dataListTextSuggestionsInputView.m_ptr) = 0;
    }
    if ([self->_inputPeripheral.m_ptr singleTapShouldEndEditing]) {
      [self->_inputPeripheral.m_ptr endEditing];
    }
    uint64_t v7 = qword_1EB358708;
    if (os_log_type_enabled((os_log_t)qword_1EB358708, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(*((void *)self->_page.m_ptr + 4) + 760);
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&unsigned char buf[12] = 2048;
      *(void *)&buf[14] = v8;
      _os_log_impl(&dword_1985F2000, v7, OS_LOG_TYPE_DEFAULT, "Single tap recognized - commit potential tap (%p, pageProxyID=%llu)", buf, 0x16u);
    }
    uint64_t v9 = (void *)[self->_singleTapGestureRecognizer.m_ptr lastActiveTouchIdentifier];
    if (v9)
    {
      int v10 = [v9 unsignedIntValue];
      LODWORD(self->_revealFocusedElementDeferrer.m_ptr) = v10;
    }
    else
    {
      int v10 = 1;
    }
    id m_ptr = self->_page.m_ptr;
    unsigned int v12 = [a3 modifierFlags];
    uint64_t v13 = *(void *)&self->_keyWebEventHandlers.m_inlineBuffer[0].__lx[32];
    char v17 = (v12 >> 12) & 0x10 | (v12 >> 17) & 0xF;
    uint64_t v16 = v13;
    int v15 = v10;
    uint64_t v14 = *((void *)m_ptr + 32);
    *(void *)buf = &v17;
    *(void *)&buf[8] = &v16;
    *(void *)&buf[16] = &v15;
    WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::CommitPotentialTap>(v14, (uint64_t)buf, *(void *)(*((void *)m_ptr + 4) + 1928), 0);
    if (!HIBYTE(self->_dataListTextSuggestions.m_ptr)) {
      [(WKContentView *)self _finishInteraction];
    }
    if ((objc_msgSend(self->_imageAnalysisContextMenuActionData.var0.__val_.copySubjectResult.m_ptr, "interactableItemExistsAtPoint:", *(double *)&self->_keyWebEventHandlers.m_inlineBuffer[0].__lx[16], *(double *)&self->_keyWebEventHandlers.m_inlineBuffer[0].__lx[24]) & 1) == 0)objc_msgSend(self->_imageAnalysisContextMenuActionData.var0.__val_.copySubjectResult.m_ptr, "resetSelection"); {
  }
    }
}

- (void)_doubleTapRecognized:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = qword_1EB358708;
  if (os_log_type_enabled((os_log_t)qword_1EB358708, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(*((void *)self->_page.m_ptr + 4) + 760);
    *(_DWORD *)buf = 134218240;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&unsigned char buf[12] = 2048;
    *(void *)&buf[14] = v6;
    _os_log_impl(&dword_1985F2000, v5, OS_LOG_TYPE_DEFAULT, "Identified a double tap (%p, pageProxyID=%llu)", buf, 0x16u);
  }
  [(WKContentView *)self _resetIsDoubleTapPending];
  [a3 locationInView:self];
  *(void *)buf = v7;
  *(void *)&buf[8] = v8;
  *(_OWORD *)&self->_keyWebEventHandlers.m_inlineBuffer[0].__lx[16] = *(_OWORD *)buf;
  value = self->_smartMagnificationController.__ptr_.__value_;
  WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)&v12, (const CGPoint *)buf);
  uint64_t v14 = v12;
  uint64_t v10 = *((void *)value + 2);
  uint64_t v11 = *(void *)(v10 + 256);
  uint64_t v13 = (float *)&v14;
  WebKit::AuxiliaryProcessProxy::send<Messages::ViewGestureGeometryCollector::CollectGeometryForSmartMagnificationGesture>(v11, &v13, *(void *)(*(void *)(v10 + 32) + 1928), 0);
}

- (void)_nonBlockingDoubleTapRecognized:(id)a3
{
  [a3 locationInView:self];
  *(void *)&self->_keyWebEventHandlers.m_inlineBuffer[0].__lx[16] = v4;
  *(void *)&self->_keyWebEventHandlers.m_inlineBuffer[0].__lx[24] = v5;
  BYTE5(self->_dataListTextSuggestionsInputView.m_ptr) = 1;
}

- (void)_twoFingerDoubleTapRecognized:(id)a3
{
  [(WKContentView *)self _resetIsDoubleTapPending];
  [a3 locationInView:self];
  v10.double x = v5;
  v10.double y = v6;
  *(CGPoint *)&self->_keyWebEventHandlers.m_inlineBuffer[0].__lx[16] = v10;
  value = self->_smartMagnificationController.__ptr_.__value_;
  WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)&v9, &v10);
  uint64_t v11 = v9;
  uint64_t v8 = (void *)*((void *)value + 3);
  WebCore::FloatPoint::operator CGPoint();
  objc_msgSend(v8, "_zoomOutWithOrigin:");
}

- (void)_attemptSyntheticClickAtLocation:(CGPoint)a3 modifierFlags:(int64_t)a4
{
  CGPoint v8 = a3;
  if (([(WKContentView *)self isFirstResponder] & 1) == 0) {
    [(WKContentView *)self becomeFirstResponder];
  }
  [self->_inputPeripheral.m_ptr endEditing];
  id m_ptr = self->_page.m_ptr;
  WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)&v7, &v8);
  WebKit::WebPageProxy::attemptSyntheticClick((uint64_t)m_ptr, &v7, ((unint64_t)a4 >> 12) & 0x10 | ((unint64_t)a4 >> 17) & 0xF, *(void *)&self->_keyWebEventHandlers.m_inlineBuffer[0].__lx[32]);
}

- (void)pasteWithCompletionHandler:(id)a3
{
  id m_ptr = self->_page.m_ptr;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v12 = 0;
  CGFloat v5 = _Block_copy(a3);
  CGFloat v6 = (void *)WTF::fastMalloc((WTF *)0x10);
  *CGFloat v6 = &unk_1EEA0EAB8;
  v6[1] = v5;
  uint64_t v11 = v6;
  WebKit::WebPageProxy::executeEditCommand((uint64_t)m_ptr, &v13, &v12, (uint64_t *)&v11);
  uint64_t v7 = (uint64_t)v11;
  uint64_t v11 = 0;
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
  }
  _Block_release(0);
  uint64_t v9 = v12;
  uint64_t v12 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2) {
      WTF::StringImpl::destroy(v9, v8);
    }
    else {
      *(_DWORD *)v9 -= 2;
    }
  }
  CGPoint v10 = v13;
  uint64_t v13 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2) {
      WTF::StringImpl::destroy(v10, v8);
    }
    else {
      *(_DWORD *)v10 -= 2;
    }
  }
}

- (void)clearSelection
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    uint64_t v3 = qword_1EB3586B8;
    if (os_log_type_enabled((os_log_t)qword_1EB3586B8, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315138;
      CGFloat v5 = "-[WKContentView(WKInteraction) clearSelection]";
      _os_log_error_impl(&dword_1985F2000, v3, OS_LOG_TYPE_ERROR, "Received unexpected call to %s", (uint8_t *)&v4, 0xCu);
    }
    __break(0xC471u);
    JUMPOUT(0x19943C908);
  }

  [(WKContentView *)self _internalClearSelection];
}

- (void)_internalClearSelection
{
  [(WKContentView *)self _elementDidBlur];
  id m_ptr = self->_page.m_ptr;
  LOBYTE(v4) = 0;
  char v5 = 0;
  WebKit::WebPageProxy::clearSelection((uint64_t)m_ptr, &v4);
}

- (void)_invalidateCurrentPositionInformation
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  BYTE1(self->_dataListTextSuggestionsInputView.m_ptr) = 0;
  memset(v4, 0, sizeof(v4));
  int v5 = 1;
  char v6 = 1;
  int v7 = 0;
  __int16 v8 = 0;
  char v9 = 1;
  uint64_t v10 = 0;
  char v11 = 0;
  uint64_t v12 = 0;
  v13[0] = 0;
  *(void *)((char *)v13 + 6) = 0;
  v13[2] = 0;
  WTF::URL::URL((WTF::URL *)&v14);
  WTF::URL::URL((WTF::URL *)v15);
  char v21 = 0;
  char v22 = 0;
  *(_OWORD *)&v15[40] = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  int v20 = 0;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  int v27 = 1065353216;
  __int16 v31 = 0;
  char v34 = 0;
  char v35 = 0;
  char v36 = 0;
  char v37 = 0;
  long long v38 = 0u;
  char v30 = 0;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  WebKit::InteractionInformationAtPosition::operator=((uint64_t)&self->_positionInformation, (uint64_t)v4);
  WebKit::InteractionInformationAtPosition::~InteractionInformationAtPosition((WebKit::InteractionInformationAtPosition *)v4, v3);
}

- (void)_positionInformationDidChange:(const void *)a3
{
  v8[81] = *MEMORY[0x1E4F143B8];
  p_m_capacitdouble y = &self->_lastSelectionDrawingInfo.selectionGeometries.m_capacity;
  if (LOBYTE(self->_lastSelectionDrawingInfo.selectionClipRect.m_size.m_width)
    && WebKit::InteractionInformationRequest::isValidForRequest((int32x2_t *)a3, (const InteractionInformationRequest *)p_m_capacity, 0))
  {
    *((unsigned char *)p_m_capacity + 16) = 0;
  }
  BYTE3(self->_dataListSuggestionsControl.m_weakReference) = 0;
  WebKit::InteractionInformationAtPosition::InteractionInformationAtPosition((WebKit::InteractionInformationAtPosition *)v8, (const WebKit::InteractionInformationAtPosition *)a3);
  WebKit::InteractionInformationAtPosition::mergeCompatibleOptionalInformation((uint64_t)v8, (const WebKit::InteractionInformationAtPosition *)&self->_positionInformation);
  WebKit::InteractionInformationAtPosition::operator=((uint64_t)&self->_positionInformation, (uint64_t)v8);
  BYTE1(self->_dataListTextSuggestionsInputView.m_ptr) = self->_positionInformation.canBeValid;
  id m_ptr = self->_actionSheetAssistant.m_ptr;
  if (m_ptr) {
    [m_ptr updateSheetPosition];
  }
  [(WKContentView *)self _invokeAndRemovePendingHandlersValidForCurrentPositionInformation];
  WebKit::InteractionInformationAtPosition::~InteractionInformationAtPosition((WebKit::InteractionInformationAtPosition *)v8, v7);
}

- (void)_willStartScrollingOrZooming
{
  *((unsigned char *)self->_page.m_ptr + 450) = 1;
}

- (void)scrollViewWillStartPanOrPinchGesture
{
  id m_ptr = self->_page.m_ptr;
  long long v4 = (_DWORD *)*((void *)m_ptr + 111);
  *((void *)m_ptr + 111) = 0;
  if (v4) {
    WTF::RefCounted<WebCore::ValidationBubble>::deref(v4);
  }
  [self->_positionInformationCallbackDepth willStartInteractiveScroll];
  self->_touchEventsCanPreventNativeGestures = 0;
}

- (void)_didEndScrollingOrZooming
{
  if (!self->_isTapHighlightIDValid) {
    [self->_textInteractionWrapper.m_ptr didEndScrollingOrZooming];
  }
  id m_ptr = self->_page.m_ptr;
  *((unsigned char *)m_ptr + 450) = 0;
  long long v4 = (WebCore::ValidationBubble *)*((void *)m_ptr + 111);
  if (v4) {
    WebCore::ValidationBubble::show(v4);
  }

  [(WKContentView *)self _resetPanningPreventionFlags];
}

- (BOOL)_elementTypeRequiresAccessoryView:(unsigned __int8)a3
{
  if ((a3 - 1) >= 0xA)
  {
    if (a3 != 16) {
      return 0;
    }
    self = (WKContentView *)[(WKContentView *)self _shouldUseContextMenusForFormControls];
    if (self) {
      return 0;
    }
  }
  return PAL::currentUserInterfaceIdiomIsSmallScreen((PAL *)self);
}

- (BOOL)requiresAccessoryView
{
  if (self->_isPresentingWritingTools
    || ([self->_formInputSession.m_ptr accessoryViewShouldNotShow] & 1) != 0)
  {
    return 0;
  }
  if ([self->_formInputSession.m_ptr customInputAccessoryView]) {
    return 1;
  }
  uint64_t v4 = self->_anon_938[113];

  return [(WKContentView *)self _elementTypeRequiresAccessoryView:v4];
}

- (id)inputAssistantItem
{
  id Weak = objc_loadWeak(&self->_webView.m_weakReference);

  return (id)[Weak inputAssistantItem];
}

- (UITextInputAssistantItem)inputAssistantItemForWebView
{
  v3.receiver = self;
  v3.super_class = (Class)WKContentView;
  return (UITextInputAssistantItem *)[(WKContentView *)&v3 inputAssistantItem];
}

- (id)inputAccessoryView
{
  id Weak = objc_loadWeak(&self->_webView.m_weakReference);

  return (id)[Weak inputAccessoryView];
}

- (UIView)inputAccessoryViewForWebView
{
  if (![(WKContentView *)self requiresAccessoryView]) {
    return 0;
  }
  BOOL result = (UIView *)[self->_formInputSession.m_ptr customInputAccessoryView];
  if (!result)
  {
    return (UIView *)[(WKContentView *)self formAccessoryView];
  }
  return result;
}

- (id)supportedPasteboardTypesForCurrentSelection
{
  uint64_t v2 = *((void *)self->_page.m_ptr + 4);
  if (*(unsigned char *)(v2 + 249)) {
    return 0;
  }
  if (*(unsigned char *)(v2 + 254))
  {
    if (byte_1E93CF9CC == 1)
    {
      return (id)qword_1E93CFA08;
    }
    else
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_msgSend(v4, "addObjectsFromArray:", WebKit::supportedRichTextPasteboardTypesForPasteConfiguration((WebKit *)objc_msgSend(v4, "addObject:", *MEMORY[0x1E4FB64E8])));
      id result = v4;
      qword_1E93CFA08 = (uint64_t)v4;
      byte_1E93CF9CC = 1;
    }
  }
  else
  {
    return WebKit::supportedPlainTextPasteboardTypes((WebKit *)self);
  }
  return result;
}

- (void)captureTextFromCamera:(id)a3
{
  [(WKContentView *)self _willPerformAction:sel_captureTextFromCamera_ sender:a3];
  [objc_loadWeak(&self->_webView.m_weakReference) captureTextFromCamera:a3];

  [(WKContentView *)self _didPerformAction:sel_captureTextFromCamera_ sender:a3];
}

- (void)useSelectionForFind:(id)a3
{
  [(WKContentView *)self _willPerformAction:sel_useSelectionForFind_ sender:a3];
  [objc_loadWeak(&self->_webView.m_weakReference) useSelectionForFind:a3];

  [(WKContentView *)self _didPerformAction:sel_useSelectionForFind_ sender:a3];
}

- (void)findSelected:(id)a3
{
  [(WKContentView *)self _willPerformAction:sel_findSelected_ sender:a3];
  [objc_loadWeak(&self->_webView.m_weakReference) findSelected:a3];

  [(WKContentView *)self _didPerformAction:sel_findSelected_ sender:a3];
}

- (void)_findSelected:(id)a3
{
  [(WKContentView *)self _willPerformAction:sel__findSelected_ sender:a3];
  [objc_loadWeak(&self->_webView.m_weakReference) _findSelected:a3];

  [(WKContentView *)self _didPerformAction:sel__findSelected_ sender:a3];
}

- (void)addShortcut:(id)a3
{
  [(WKContentView *)self _willPerformAction:sel_addShortcut_ sender:a3];
  [objc_loadWeak(&self->_webView.m_weakReference) addShortcut:a3];

  [(WKContentView *)self _didPerformAction:sel_addShortcut_ sender:a3];
}

- (void)_addShortcut:(id)a3
{
  [(WKContentView *)self _willPerformAction:sel__addShortcut_ sender:a3];
  [objc_loadWeak(&self->_webView.m_weakReference) _addShortcut:a3];

  [(WKContentView *)self _didPerformAction:sel__addShortcut_ sender:a3];
}

- (void)define:(id)a3
{
  [(WKContentView *)self _willPerformAction:sel_define_ sender:a3];
  [objc_loadWeak(&self->_webView.m_weakReference) define:a3];

  [(WKContentView *)self _didPerformAction:sel_define_ sender:a3];
}

- (void)_define:(id)a3
{
  [(WKContentView *)self _willPerformAction:sel__define_ sender:a3];
  [objc_loadWeak(&self->_webView.m_weakReference) _define:a3];

  [(WKContentView *)self _didPerformAction:sel__define_ sender:a3];
}

- (void)lookup:(id)a3
{
  [(WKContentView *)self _willPerformAction:sel_lookup_ sender:a3];
  [objc_loadWeak(&self->_webView.m_weakReference) lookup:a3];

  [(WKContentView *)self _didPerformAction:sel_lookup_ sender:a3];
}

- (void)_lookup:(id)a3
{
  [(WKContentView *)self _willPerformAction:sel__lookup_ sender:a3];
  [objc_loadWeak(&self->_webView.m_weakReference) _lookup:a3];

  [(WKContentView *)self _didPerformAction:sel__lookup_ sender:a3];
}

- (void)translate:(id)a3
{
  [(WKContentView *)self _willPerformAction:sel_translate_ sender:a3];
  [objc_loadWeak(&self->_webView.m_weakReference) translate:a3];

  [(WKContentView *)self _didPerformAction:sel_translate_ sender:a3];
}

- (void)_translate:(id)a3
{
  [(WKContentView *)self _willPerformAction:sel__translate_ sender:a3];
  [objc_loadWeak(&self->_webView.m_weakReference) _translate:a3];

  [(WKContentView *)self _didPerformAction:sel__translate_ sender:a3];
}

- (void)promptForReplace:(id)a3
{
  [(WKContentView *)self _willPerformAction:sel_promptForReplace_ sender:a3];
  [objc_loadWeak(&self->_webView.m_weakReference) promptForReplace:a3];

  [(WKContentView *)self _didPerformAction:sel_promptForReplace_ sender:a3];
}

- (void)_promptForReplace:(id)a3
{
  [(WKContentView *)self _willPerformAction:sel__promptForReplace_ sender:a3];
  [objc_loadWeak(&self->_webView.m_weakReference) _promptForReplace:a3];

  [(WKContentView *)self _didPerformAction:sel__promptForReplace_ sender:a3];
}

- (void)share:(id)a3
{
  [(WKContentView *)self _willPerformAction:sel_share_ sender:a3];
  [objc_loadWeak(&self->_webView.m_weakReference) share:a3];

  [(WKContentView *)self _didPerformAction:sel_share_ sender:a3];
}

- (void)_share:(id)a3
{
  [(WKContentView *)self _willPerformAction:sel__share_ sender:a3];
  [objc_loadWeak(&self->_webView.m_weakReference) _share:a3];

  [(WKContentView *)self _didPerformAction:sel__share_ sender:a3];
}

- (void)transliterateChinese:(id)a3
{
  [(WKContentView *)self _willPerformAction:sel_transliterateChinese_ sender:a3];
  [objc_loadWeak(&self->_webView.m_weakReference) transliterateChinese:a3];

  [(WKContentView *)self _didPerformAction:sel_transliterateChinese_ sender:a3];
}

- (void)_transliterateChinese:(id)a3
{
  [(WKContentView *)self _willPerformAction:sel__transliterateChinese_ sender:a3];
  [objc_loadWeak(&self->_webView.m_weakReference) _transliterateChinese:a3];

  [(WKContentView *)self _didPerformAction:sel__transliterateChinese_ sender:a3];
}

- (void)_nextAccessoryTab:(id)a3
{
  [(WKContentView *)self _willPerformAction:sel__nextAccessoryTab_ sender:a3];
  [objc_loadWeak(&self->_webView.m_weakReference) _nextAccessoryTab:a3];

  [(WKContentView *)self _didPerformAction:sel__nextAccessoryTab_ sender:a3];
}

- (void)_previousAccessoryTab:(id)a3
{
  [(WKContentView *)self _willPerformAction:sel__previousAccessoryTab_ sender:a3];
  [objc_loadWeak(&self->_webView.m_weakReference) _previousAccessoryTab:a3];

  [(WKContentView *)self _didPerformAction:sel__previousAccessoryTab_ sender:a3];
}

- (void)copy:(id)a3
{
  [(WKContentView *)self _willPerformAction:sel_copy_ sender:a3];
  [objc_loadWeak(&self->_webView.m_weakReference) copy:a3];

  [(WKContentView *)self _didPerformAction:sel_copy_ sender:a3];
}

- (void)cut:(id)a3
{
  [(WKContentView *)self _willPerformAction:sel_cut_ sender:a3];
  [objc_loadWeak(&self->_webView.m_weakReference) cut:a3];

  [(WKContentView *)self _didPerformAction:sel_cut_ sender:a3];
}

- (void)paste:(id)a3
{
  [(WKContentView *)self _willPerformAction:sel_paste_ sender:a3];
  [objc_loadWeak(&self->_webView.m_weakReference) paste:a3];

  [(WKContentView *)self _didPerformAction:sel_paste_ sender:a3];
}

- (void)replace:(id)a3
{
  [(WKContentView *)self _willPerformAction:sel_replace_ sender:a3];
  [objc_loadWeak(&self->_webView.m_weakReference) replace:a3];

  [(WKContentView *)self _didPerformAction:sel_replace_ sender:a3];
}

- (void)select:(id)a3
{
  [(WKContentView *)self _willPerformAction:sel_select_ sender:a3];
  [objc_loadWeak(&self->_webView.m_weakReference) select:a3];

  [(WKContentView *)self _didPerformAction:sel_select_ sender:a3];
}

- (void)selectAll:(id)a3
{
  [(WKContentView *)self _willPerformAction:sel_selectAll_ sender:a3];
  [objc_loadWeak(&self->_webView.m_weakReference) selectAll:a3];

  [(WKContentView *)self _didPerformAction:sel_selectAll_ sender:a3];
}

- (void)toggleBoldface:(id)a3
{
  [(WKContentView *)self _willPerformAction:sel_toggleBoldface_ sender:a3];
  [objc_loadWeak(&self->_webView.m_weakReference) toggleBoldface:a3];

  [(WKContentView *)self _didPerformAction:sel_toggleBoldface_ sender:a3];
}

- (void)toggleItalics:(id)a3
{
  [(WKContentView *)self _willPerformAction:sel_toggleItalics_ sender:a3];
  [objc_loadWeak(&self->_webView.m_weakReference) toggleItalics:a3];

  [(WKContentView *)self _didPerformAction:sel_toggleItalics_ sender:a3];
}

- (void)toggleUnderline:(id)a3
{
  [(WKContentView *)self _willPerformAction:sel_toggleUnderline_ sender:a3];
  [objc_loadWeak(&self->_webView.m_weakReference) toggleUnderline:a3];

  [(WKContentView *)self _didPerformAction:sel_toggleUnderline_ sender:a3];
}

- (void)increaseSize:(id)a3
{
  [(WKContentView *)self _willPerformAction:sel_increaseSize_ sender:a3];
  [objc_loadWeak(&self->_webView.m_weakReference) increaseSize:a3];

  [(WKContentView *)self _didPerformAction:sel_increaseSize_ sender:a3];
}

- (void)decreaseSize:(id)a3
{
  [(WKContentView *)self _willPerformAction:sel_decreaseSize_ sender:a3];
  [objc_loadWeak(&self->_webView.m_weakReference) decreaseSize:a3];

  [(WKContentView *)self _didPerformAction:sel_decreaseSize_ sender:a3];
}

- (void)pasteAndMatchStyle:(id)a3
{
  [(WKContentView *)self _willPerformAction:sel_pasteAndMatchStyle_ sender:a3];
  [objc_loadWeak(&self->_webView.m_weakReference) pasteAndMatchStyle:a3];

  [(WKContentView *)self _didPerformAction:sel_pasteAndMatchStyle_ sender:a3];
}

- (void)makeTextWritingDirectionNatural:(id)a3
{
  [(WKContentView *)self _willPerformAction:sel_makeTextWritingDirectionNatural_ sender:a3];
  [objc_loadWeak(&self->_webView.m_weakReference) makeTextWritingDirectionNatural:a3];

  [(WKContentView *)self _didPerformAction:sel_makeTextWritingDirectionNatural_ sender:a3];
}

- (void)makeTextWritingDirectionLeftToRight:(id)a3
{
  [(WKContentView *)self _willPerformAction:sel_makeTextWritingDirectionLeftToRight_ sender:a3];
  [objc_loadWeak(&self->_webView.m_weakReference) makeTextWritingDirectionLeftToRight:a3];

  [(WKContentView *)self _didPerformAction:sel_makeTextWritingDirectionLeftToRight_ sender:a3];
}

- (void)makeTextWritingDirectionRightToLeft:(id)a3
{
  [(WKContentView *)self _willPerformAction:sel_makeTextWritingDirectionRightToLeft_ sender:a3];
  [objc_loadWeak(&self->_webView.m_weakReference) makeTextWritingDirectionRightToLeft:a3];

  [(WKContentView *)self _didPerformAction:sel_makeTextWritingDirectionRightToLeft_ sender:a3];
}

- (void)_alignCenter:(id)a3
{
  [(WKContentView *)self _willPerformAction:sel__alignCenter_ sender:a3];
  [objc_loadWeak(&self->_webView.m_weakReference) _alignCenter:a3];

  [(WKContentView *)self _didPerformAction:sel__alignCenter_ sender:a3];
}

- (void)_alignJustified:(id)a3
{
  [(WKContentView *)self _willPerformAction:sel__alignJustified_ sender:a3];
  [objc_loadWeak(&self->_webView.m_weakReference) _alignJustified:a3];

  [(WKContentView *)self _didPerformAction:sel__alignJustified_ sender:a3];
}

- (void)_alignLeft:(id)a3
{
  [(WKContentView *)self _willPerformAction:sel__alignLeft_ sender:a3];
  [objc_loadWeak(&self->_webView.m_weakReference) _alignLeft:a3];

  [(WKContentView *)self _didPerformAction:sel__alignLeft_ sender:a3];
}

- (void)_alignRight:(id)a3
{
  [(WKContentView *)self _willPerformAction:sel__alignRight_ sender:a3];
  [objc_loadWeak(&self->_webView.m_weakReference) _alignRight:a3];

  [(WKContentView *)self _didPerformAction:sel__alignRight_ sender:a3];
}

- (void)_indent:(id)a3
{
  [(WKContentView *)self _willPerformAction:sel__indent_ sender:a3];
  [objc_loadWeak(&self->_webView.m_weakReference) _indent:a3];

  [(WKContentView *)self _didPerformAction:sel__indent_ sender:a3];
}

- (void)_outdent:(id)a3
{
  [(WKContentView *)self _willPerformAction:sel__outdent_ sender:a3];
  [objc_loadWeak(&self->_webView.m_weakReference) _outdent:a3];

  [(WKContentView *)self _didPerformAction:sel__outdent_ sender:a3];
}

- (void)_toggleStrikeThrough:(id)a3
{
  [(WKContentView *)self _willPerformAction:sel__toggleStrikeThrough_ sender:a3];
  [objc_loadWeak(&self->_webView.m_weakReference) _toggleStrikeThrough:a3];

  [(WKContentView *)self _didPerformAction:sel__toggleStrikeThrough_ sender:a3];
}

- (void)_insertOrderedList:(id)a3
{
  [(WKContentView *)self _willPerformAction:sel__insertOrderedList_ sender:a3];
  [objc_loadWeak(&self->_webView.m_weakReference) _insertOrderedList:a3];

  [(WKContentView *)self _didPerformAction:sel__insertOrderedList_ sender:a3];
}

- (void)_insertUnorderedList:(id)a3
{
  [(WKContentView *)self _willPerformAction:sel__insertUnorderedList_ sender:a3];
  [objc_loadWeak(&self->_webView.m_weakReference) _insertUnorderedList:a3];

  [(WKContentView *)self _didPerformAction:sel__insertUnorderedList_ sender:a3];
}

- (void)_insertNestedOrderedList:(id)a3
{
  [(WKContentView *)self _willPerformAction:sel__insertNestedOrderedList_ sender:a3];
  [objc_loadWeak(&self->_webView.m_weakReference) _insertNestedOrderedList:a3];

  [(WKContentView *)self _didPerformAction:sel__insertNestedOrderedList_ sender:a3];
}

- (void)_insertNestedUnorderedList:(id)a3
{
  [(WKContentView *)self _willPerformAction:sel__insertNestedUnorderedList_ sender:a3];
  [objc_loadWeak(&self->_webView.m_weakReference) _insertNestedUnorderedList:a3];

  [(WKContentView *)self _didPerformAction:sel__insertNestedUnorderedList_ sender:a3];
}

- (void)_increaseListLevel:(id)a3
{
  [(WKContentView *)self _willPerformAction:sel__increaseListLevel_ sender:a3];
  [objc_loadWeak(&self->_webView.m_weakReference) _increaseListLevel:a3];

  [(WKContentView *)self _didPerformAction:sel__increaseListLevel_ sender:a3];
}

- (void)_decreaseListLevel:(id)a3
{
  [(WKContentView *)self _willPerformAction:sel__decreaseListLevel_ sender:a3];
  [objc_loadWeak(&self->_webView.m_weakReference) _decreaseListLevel:a3];

  [(WKContentView *)self _didPerformAction:sel__decreaseListLevel_ sender:a3];
}

- (void)_changeListType:(id)a3
{
  [(WKContentView *)self _willPerformAction:sel__changeListType_ sender:a3];
  [objc_loadWeak(&self->_webView.m_weakReference) _changeListType:a3];

  [(WKContentView *)self _didPerformAction:sel__changeListType_ sender:a3];
}

- (void)_pasteAsQuotation:(id)a3
{
  [(WKContentView *)self _willPerformAction:sel__pasteAsQuotation_ sender:a3];
  [objc_loadWeak(&self->_webView.m_weakReference) _pasteAsQuotation:a3];

  [(WKContentView *)self _didPerformAction:sel__pasteAsQuotation_ sender:a3];
}

- (void)_pasteAndMatchStyle:(id)a3
{
  [(WKContentView *)self _willPerformAction:sel__pasteAndMatchStyle_ sender:a3];
  [objc_loadWeak(&self->_webView.m_weakReference) _pasteAndMatchStyle:a3];

  [(WKContentView *)self _didPerformAction:sel__pasteAndMatchStyle_ sender:a3];
}

- (void)_lookupForWebView:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    int v5 = qword_1EB3586B8;
    if (os_log_type_enabled((os_log_t)qword_1EB3586B8, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315138;
      int v7 = "-[WKContentView(WKInteraction) _lookupForWebView:]";
      _os_log_error_impl(&dword_1985F2000, v5, OS_LOG_TYPE_ERROR, "Received unexpected call to %s", (uint8_t *)&v6, 0xCu);
    }
    __break(0xC471u);
    JUMPOUT(0x19943E7B8);
  }

  [(WKContentView *)self lookupForWebView:a3];
}

- (void)lookupForWebView:(id)a3
{
  id m_ptr = self->_page.m_ptr;
  CFRetain(self);
  int v5 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v5 = &unk_1EEA0EAE0;
  v5[1] = self;
  int v7 = v5;
  WebKit::WebPageProxy::getSelectionContext((uint64_t)m_ptr, (uint64_t *)&v7);
  uint64_t v6 = (uint64_t)v7;
  int v7 = 0;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
}

- (void)_shareForWebView:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    int v5 = qword_1EB3586B8;
    if (os_log_type_enabled((os_log_t)qword_1EB3586B8, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315138;
      int v7 = "-[WKContentView(WKInteraction) _shareForWebView:]";
      _os_log_error_impl(&dword_1985F2000, v5, OS_LOG_TYPE_ERROR, "Received unexpected call to %s", (uint8_t *)&v6, 0xCu);
    }
    __break(0xC471u);
    JUMPOUT(0x19943E990);
  }

  [(WKContentView *)self shareForWebView:a3];
}

- (void)shareForWebView:(id)a3
{
  if (self) {
    CFRetain(self);
  }
  id m_ptr = self->_page.m_ptr;
  CFRetain(self);
  int v5 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v5 = &unk_1EEA0EB08;
  v5[1] = self;
  int v7 = v5;
  char v8 = 0;
  WebKit::AuxiliaryProcessProxy::sendWithAsyncReply<Messages::WebPage::GetSelectionOrContentsAsString,WTF::CompletionHandler<void ()(WTF::String const&)>>(*((void *)m_ptr + 32), (uint64_t)&v8, (uint64_t *)&v7, *(void *)(*((void *)m_ptr + 4) + 1928), 0, 1);
  uint64_t v6 = (uint64_t)v7;
  int v7 = 0;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  CFRelease(self);
}

- (void)_translateForWebView:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    int v5 = qword_1EB3586B8;
    if (os_log_type_enabled((os_log_t)qword_1EB3586B8, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315138;
      int v7 = "-[WKContentView(WKInteraction) _translateForWebView:]";
      _os_log_error_impl(&dword_1985F2000, v5, OS_LOG_TYPE_ERROR, "Received unexpected call to %s", (uint8_t *)&v6, 0xCu);
    }
    __break(0xC471u);
    JUMPOUT(0x19943EB6CLL);
  }

  [(WKContentView *)self translateForWebView:a3];
}

- (void)translateForWebView:(id)a3
{
  id m_ptr = self->_page.m_ptr;
  id location = 0;
  objc_initWeak(&location, self);
  uint64_t v4 = WTF::fastMalloc((WTF *)0x10);
  *(void *)uint64_t v4 = &unk_1EEA0EB30;
  *(void *)(v4 + 8) = 0;
  objc_moveWeak((id *)(v4 + 8), &location);
  uint64_t v7 = v4;
  char v8 = 0;
  WebKit::AuxiliaryProcessProxy::sendWithAsyncReply<Messages::WebPage::GetSelectionOrContentsAsString,WTF::CompletionHandler<void ()(WTF::String const&)>>(*((void *)m_ptr + 32), (uint64_t)&v8, &v7, *(void *)(*((void *)m_ptr + 4) + 1928), 0, 1);
  uint64_t v5 = v7;
  uint64_t v7 = 0;
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
  }
  objc_destroyWeak(&location);
}

- (void)_addShortcutForWebView:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    uint64_t v5 = qword_1EB3586B8;
    if (os_log_type_enabled((os_log_t)qword_1EB3586B8, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315138;
      uint64_t v7 = "-[WKContentView(WKInteraction) _addShortcutForWebView:]";
      _os_log_error_impl(&dword_1985F2000, v5, OS_LOG_TYPE_ERROR, "Received unexpected call to %s", (uint8_t *)&v6, 0xCu);
    }
    __break(0xC471u);
    JUMPOUT(0x19943ED50);
  }

  [(WKContentView *)self addShortcutForWebView:a3];
}

- (void)addShortcutForWebView:(id)a3
{
  if (*(unsigned char *)(*((void *)self->_page.m_ptr + 4) + 704))
  {
    id m_ptr = self->_textInteractionWrapper.m_ptr;
    id v5 = [(WKContentView *)self selectedText];
    uint64_t v6 = *((void *)self->_page.m_ptr + 4);
    if (*(unsigned char *)(v6 + 704))
    {
      if (*(_DWORD *)(v6 + 652))
      {
        id v7 = v5;
        uint64_t v9 = WebCore::SelectionGeometry::rect(*(WebCore::SelectionGeometry **)(v6 + 640));
        uint64_t v10 = v8;
        WebCore::IntRect::operator CGRect();
        objc_msgSend(m_ptr, "showTextServiceFor:fromRect:", v7, v9, v10);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(0xC471u);
  }
}

- (id)selectedText
{
  uint64_t v2 = *((void *)self->_page.m_ptr + 4);
  if (!*(unsigned char *)(v2 + 576)) {
    return 0;
  }
  if (*(void *)(v2 + 320)) {
    return (id)WTF::StringImpl::operator NSString *();
  }
  return &stru_1EEA10550;
}

- (id)alternativesForSelectedText
{
  uint64_t v2 = *((void *)self->_page.m_ptr + 4);
  if (!*(unsigned char *)(v2 + 576)) {
    return 0;
  }
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(unsigned int *)(v2 + 356)];
  uint64_t v5 = *(unsigned int *)(v2 + 356);
  if (v5)
  {
    uint64_t v6 = *(uint64_t **)(v2 + 344);
    uint64_t v7 = 8 * v5;
    do
    {
      uint64_t v8 = (void *)WebKit::WebPageProxy::platformDictationAlternatives((uint64_t)self->_page.m_ptr, *v6);
      uint64_t v9 = v8;
      if (v8) {
        CFRetain(v8);
      }
      if ([(WKContentView *)self shouldUseAsyncInteractions])
      {
        id v10 = (id)CFMakeCollectable(v9);
      }
      else
      {
        id v10 = (id)[v9 _nsTextAlternative];
        if (v9) {
          CFRelease(v9);
        }
      }
      if (v10) {
        [v4 addObject:v10];
      }
      ++v6;
      v7 -= 8;
    }
    while (v7);
  }
  char v11 = (void *)CFMakeCollectable(v4);

  return v11;
}

- (void)makeTextWritingDirectionNaturalForWebView:(id)a3
{
}

- (void)makeTextWritingDirectionLeftToRightForWebView:(id)a3
{
}

- (void)makeTextWritingDirectionRightToLeftForWebView:(id)a3
{
}

- (BOOL)isReplaceAllowed
{
  uint64_t v2 = *((void *)self->_page.m_ptr + 4);
  return *(unsigned char *)(v2 + 576) && *(unsigned char *)(v2 + 360) != 0;
}

- (void)replaceText:(id)a3 withText:(id)a4
{
  BYTE4(self->_dataListSuggestionsControl.m_weakReference) = 1;
  id m_ptr = self->_page.m_ptr;
  MEMORY[0x19972EAD0](&v11, a3);
  MEMORY[0x19972EAD0](&v10, a4);
  uint64_t v6 = *((void *)m_ptr + 32);
  v12[0] = (uint64_t *)&v11;
  v12[1] = (uint64_t *)&v10;
  WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::ReplaceSelectedText>(v6, v12, *(void *)(*((void *)m_ptr + 4) + 1928), 0);
  uint64_t v8 = v10;
  id v10 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2) {
      WTF::StringImpl::destroy(v8, v7);
    }
    else {
      *(_DWORD *)v8 -= 2;
    }
  }
  uint64_t v9 = v11;
  char v11 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2) {
      WTF::StringImpl::destroy(v9, v7);
    }
    else {
      *(_DWORD *)v9 -= 2;
    }
  }
}

- (void)_promptForReplaceForWebView:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    uint64_t v5 = qword_1EB3586B8;
    if (os_log_type_enabled((os_log_t)qword_1EB3586B8, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315138;
      uint64_t v7 = "-[WKContentView(WKInteraction) _promptForReplaceForWebView:]";
      _os_log_error_impl(&dword_1985F2000, v5, OS_LOG_TYPE_ERROR, "Received unexpected call to %s", (uint8_t *)&v6, 0xCu);
    }
    __break(0xC471u);
    JUMPOUT(0x19943F1F8);
  }

  [(WKContentView *)self promptForReplaceForWebView:a3];
}

- (void)promptForReplaceForWebView:(id)a3
{
  uint64_t v3 = *((void *)self->_page.m_ptr + 4);
  if (*(unsigned char *)(v3 + 576))
  {
    uint64_t v4 = *(void *)(v3 + 320);
    if (v4)
    {
      if (*(_DWORD *)(v4 + 4))
      {
        id m_ptr = self->_textInteractionWrapper.m_ptr;
        uint64_t v6 = WTF::StringImpl::operator NSString *();
        [m_ptr scheduleReplacementsForText:v6];
      }
    }
  }
}

- (void)_transliterateChineseForWebView:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    uint64_t v5 = qword_1EB3586B8;
    if (os_log_type_enabled((os_log_t)qword_1EB3586B8, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315138;
      uint64_t v7 = "-[WKContentView(WKInteraction) _transliterateChineseForWebView:]";
      _os_log_error_impl(&dword_1985F2000, v5, OS_LOG_TYPE_ERROR, "Received unexpected call to %s", (uint8_t *)&v6, 0xCu);
    }
    __break(0xC471u);
    JUMPOUT(0x19943F360);
  }

  [(WKContentView *)self transliterateChineseForWebView:a3];
}

- (void)transliterateChineseForWebView:(id)a3
{
  uint64_t v3 = *((void *)self->_page.m_ptr + 4);
  if (*(unsigned char *)(v3 + 576))
  {
    id m_ptr = self->_textInteractionWrapper.m_ptr;
    if (*(void *)(v3 + 320)) {
      uint64_t v5 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v5 = &stru_1EEA10550;
    }
    [m_ptr scheduleChineseTransliterationForText:v5];
  }
}

- (void)replaceForWebView:(id)a3
{
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    id Weak = objc_loadWeak((id *)&self->_anon_fb8[24]);
    id v6 = [(WKContentView *)self asBETextInput];
    [Weak textInput:v6 deferReplaceTextActionToSystem:a3];
  }
  else
  {
    uint64_t v7 = (void *)[MEMORY[0x1E4F42B20] sharedInstance];
    [v7 replaceText:a3];
  }
}

- (void)_insertOrderedListForWebView:(id)a3
{
  id m_ptr = self->_page.m_ptr;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v7 = 0;
  WebKit::WebPageProxy::executeEditCommand((WebKit::WebPageProxy *)m_ptr, &v8, &v7);
  uint64_t v5 = v7;
  uint64_t v7 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2) {
      WTF::StringImpl::destroy(v5, v4);
    }
    else {
      *(_DWORD *)v5 -= 2;
    }
  }
  id v6 = v8;
  uint64_t v8 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy(v6, v4);
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
}

- (void)_insertUnorderedListForWebView:(id)a3
{
  id m_ptr = self->_page.m_ptr;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v7 = 0;
  WebKit::WebPageProxy::executeEditCommand((WebKit::WebPageProxy *)m_ptr, &v8, &v7);
  uint64_t v5 = v7;
  uint64_t v7 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2) {
      WTF::StringImpl::destroy(v5, v4);
    }
    else {
      *(_DWORD *)v5 -= 2;
    }
  }
  id v6 = v8;
  uint64_t v8 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy(v6, v4);
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
}

- (void)_insertNestedOrderedListForWebView:(id)a3
{
  id m_ptr = self->_page.m_ptr;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v7 = 0;
  WebKit::WebPageProxy::executeEditCommand((WebKit::WebPageProxy *)m_ptr, &v8, &v7);
  uint64_t v5 = v7;
  uint64_t v7 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2) {
      WTF::StringImpl::destroy(v5, v4);
    }
    else {
      *(_DWORD *)v5 -= 2;
    }
  }
  id v6 = v8;
  uint64_t v8 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy(v6, v4);
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
}

- (void)_insertNestedUnorderedListForWebView:(id)a3
{
  id m_ptr = self->_page.m_ptr;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v7 = 0;
  WebKit::WebPageProxy::executeEditCommand((WebKit::WebPageProxy *)m_ptr, &v8, &v7);
  uint64_t v5 = v7;
  uint64_t v7 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2) {
      WTF::StringImpl::destroy(v5, v4);
    }
    else {
      *(_DWORD *)v5 -= 2;
    }
  }
  id v6 = v8;
  uint64_t v8 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy(v6, v4);
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
}

- (void)_indentForWebView:(id)a3
{
  id m_ptr = self->_page.m_ptr;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v7 = 0;
  WebKit::WebPageProxy::executeEditCommand((WebKit::WebPageProxy *)m_ptr, &v8, &v7);
  uint64_t v5 = v7;
  uint64_t v7 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2) {
      WTF::StringImpl::destroy(v5, v4);
    }
    else {
      *(_DWORD *)v5 -= 2;
    }
  }
  id v6 = v8;
  uint64_t v8 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy(v6, v4);
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
}

- (void)_outdentForWebView:(id)a3
{
  id m_ptr = self->_page.m_ptr;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v7 = 0;
  WebKit::WebPageProxy::executeEditCommand((WebKit::WebPageProxy *)m_ptr, &v8, &v7);
  uint64_t v5 = v7;
  uint64_t v7 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2) {
      WTF::StringImpl::destroy(v5, v4);
    }
    else {
      *(_DWORD *)v5 -= 2;
    }
  }
  id v6 = v8;
  uint64_t v8 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy(v6, v4);
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
}

- (void)_alignLeftForWebView:(id)a3
{
  id m_ptr = self->_page.m_ptr;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v7 = 0;
  WebKit::WebPageProxy::executeEditCommand((WebKit::WebPageProxy *)m_ptr, &v8, &v7);
  uint64_t v5 = v7;
  uint64_t v7 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2) {
      WTF::StringImpl::destroy(v5, v4);
    }
    else {
      *(_DWORD *)v5 -= 2;
    }
  }
  id v6 = v8;
  uint64_t v8 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy(v6, v4);
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
}

- (void)_alignRightForWebView:(id)a3
{
  id m_ptr = self->_page.m_ptr;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v7 = 0;
  WebKit::WebPageProxy::executeEditCommand((WebKit::WebPageProxy *)m_ptr, &v8, &v7);
  uint64_t v5 = v7;
  uint64_t v7 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2) {
      WTF::StringImpl::destroy(v5, v4);
    }
    else {
      *(_DWORD *)v5 -= 2;
    }
  }
  id v6 = v8;
  uint64_t v8 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy(v6, v4);
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
}

- (void)_alignCenterForWebView:(id)a3
{
  id m_ptr = self->_page.m_ptr;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v7 = 0;
  WebKit::WebPageProxy::executeEditCommand((WebKit::WebPageProxy *)m_ptr, &v8, &v7);
  uint64_t v5 = v7;
  uint64_t v7 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2) {
      WTF::StringImpl::destroy(v5, v4);
    }
    else {
      *(_DWORD *)v5 -= 2;
    }
  }
  id v6 = v8;
  uint64_t v8 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy(v6, v4);
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
}

- (void)_alignJustifiedForWebView:(id)a3
{
  id m_ptr = self->_page.m_ptr;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v7 = 0;
  WebKit::WebPageProxy::executeEditCommand((WebKit::WebPageProxy *)m_ptr, &v8, &v7);
  uint64_t v5 = v7;
  uint64_t v7 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2) {
      WTF::StringImpl::destroy(v5, v4);
    }
    else {
      *(_DWORD *)v5 -= 2;
    }
  }
  id v6 = v8;
  uint64_t v8 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy(v6, v4);
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
}

- (void)_pasteAndMatchStyleForWebView:(id)a3
{
  id m_ptr = self->_page.m_ptr;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v7 = 0;
  WebKit::WebPageProxy::executeEditCommand((WebKit::WebPageProxy *)m_ptr, &v8, &v7);
  uint64_t v5 = v7;
  uint64_t v7 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2) {
      WTF::StringImpl::destroy(v5, v4);
    }
    else {
      *(_DWORD *)v5 -= 2;
    }
  }
  id v6 = v8;
  uint64_t v8 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy(v6, v4);
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
}

- (void)_increaseListLevelForWebView:(id)a3
{
}

- (void)_decreaseListLevelForWebView:(id)a3
{
}

- (void)_changeListTypeForWebView:(id)a3
{
}

- (void)_toggleStrikeThroughForWebView:(id)a3
{
  id m_ptr = self->_page.m_ptr;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v7 = 0;
  WebKit::WebPageProxy::executeEditCommand((WebKit::WebPageProxy *)m_ptr, &v8, &v7);
  uint64_t v5 = v7;
  uint64_t v7 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2) {
      WTF::StringImpl::destroy(v5, v4);
    }
    else {
      *(_DWORD *)v5 -= 2;
    }
  }
  id v6 = v8;
  uint64_t v8 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy(v6, v4);
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
}

- (void)increaseSizeForWebView:(id)a3
{
  id m_ptr = self->_page.m_ptr;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v7 = v8[1];
  WebKit::WebPageProxy::executeEditCommand((WebKit::WebPageProxy *)m_ptr, v8, &v7);
  uint64_t v5 = v7;
  uint64_t v7 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2) {
      WTF::StringImpl::destroy(v5, v4);
    }
    else {
      *(_DWORD *)v5 -= 2;
    }
  }
  id v6 = v8[0];
  v8[0] = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy(v6, v4);
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
}

- (void)decreaseSizeForWebView:(id)a3
{
  id m_ptr = self->_page.m_ptr;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v7 = v8[1];
  WebKit::WebPageProxy::executeEditCommand((WebKit::WebPageProxy *)m_ptr, v8, &v7);
  uint64_t v5 = v7;
  uint64_t v7 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2) {
      WTF::StringImpl::destroy(v5, v4);
    }
    else {
      *(_DWORD *)v5 -= 2;
    }
  }
  id v6 = v8[0];
  v8[0] = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy(v6, v4);
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
}

- (void)_setFontForWebView:(id)a3 sender:(id)a4
{
  char v21 = 0;
  char v22 = 0;
  char v23 = 0;
  long long v18 = 0;
  long long v19 = 0;
  LOBYTE(v20) = 0;
  int v24 = 0;
  MEMORY[0x19972EAD0](&v17, [a3 familyName]);
  WTF::String::operator=((uint64_t *)&v19, &v17);
  uint64_t v7 = v17;
  long long v17 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2) {
      WTF::StringImpl::destroy(v7, v6);
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
  MEMORY[0x19972EAD0](&v17, objc_msgSend(a3, "fontName", v17));
  WTF::String::operator=((uint64_t *)&v18, &v17);
  uint64_t v9 = v17;
  long long v17 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2) {
      WTF::StringImpl::destroy(v9, v8);
    }
    else {
      *(_DWORD *)v9 -= 2;
    }
  }
  objc_msgSend(a3, "pointSize", v17);
  uint64_t v20 = v10;
  char v21 = 1;
  LOWORD(v24) = ([a3 traits] >> 1) & 1 | 0x100;
  HIWORD(v24) = [a3 traits] & 1 | 0x100;
  char v11 = objc_msgSend((id)objc_msgSend(a3, "fontDescriptor"), "fontAttributes");
  if ([v11 objectForKey:*MEMORY[0x1E4F43840]])
  {
    MEMORY[0x19972EAD0](&v17);
    WTF::String::operator=((uint64_t *)&v19, &v17);
    uint64_t v13 = v17;
    long long v17 = 0;
    if (v13)
    {
      if (*(_DWORD *)v13 == 2) {
        WTF::StringImpl::destroy(v13, v12);
      }
      else {
        *(_DWORD *)v13 -= 2;
      }
    }
  }
  WebKit::WebPageProxy::changeFont((uint64_t)self->_page.m_ptr, (uint64_t)&v18);
  int v15 = v19;
  long long v19 = 0;
  if (v15)
  {
    if (*(_DWORD *)v15 == 2) {
      WTF::StringImpl::destroy(v15, v14);
    }
    else {
      *(_DWORD *)v15 -= 2;
    }
  }
  long long v16 = v18;
  long long v18 = 0;
  if (v16)
  {
    if (*(_DWORD *)v16 == 2) {
      WTF::StringImpl::destroy(v16, v14);
    }
    else {
      *(_DWORD *)v16 -= 2;
    }
  }
}

- (void)_setFontSizeForWebView:(double)a3 sender:(id)a4
{
  char v11 = 0;
  char v12 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  int v13 = 0;
  double v9 = a3;
  char v10 = 1;
  WebKit::WebPageProxy::changeFont((uint64_t)self->_page.m_ptr, (uint64_t)&v7);
  uint64_t v5 = v8;
  uint64_t v8 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2) {
      WTF::StringImpl::destroy(v5, v4);
    }
    else {
      *(_DWORD *)v5 -= 2;
    }
  }
  id v6 = v7;
  uint64_t v7 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy(v6, v4);
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
}

- (void)_setTextColorForWebView:(id)a3 sender:(id)a4
{
  uint64_t v5 = (WebCore *)[a3 CGColor];
  uint64_t v7 = WebCore::roundAndClampToSRGBALossy(v5, v6);
  uint64_t v8 = bswap32(v7) | 0x1104000000000000;
  if (!BYTE4(v7)) {
    uint64_t v8 = 0;
  }
  uint64_t v16 = v8;
  id m_ptr = self->_page.m_ptr;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  int v15 = v17;
  WebCore::serializationForHTML((uint64_t *)&v17, (WebCore *)&v16, v10);
  WebKit::WebPageProxy::executeEditCommand((WebKit::WebPageProxy *)m_ptr, &v15, &v17);
  char v12 = v17;
  long long v17 = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2) {
      WTF::StringImpl::destroy(v12, v11);
    }
    else {
      *(_DWORD *)v12 -= 2;
    }
  }
  int v13 = v15;
  int v15 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2) {
      WTF::StringImpl::destroy(v13, v11);
    }
    else {
      *(_DWORD *)v13 -= 2;
    }
  }
  if ((v16 & 0x8000000000000) != 0)
  {
    uint64_t v14 = (unsigned int *)(v16 & 0xFFFFFFFFFFFFLL);
    if (atomic_fetch_add((atomic_uint *volatile)(v16 & 0xFFFFFFFFFFFFLL), 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, v14);
      WTF::fastFree((WTF *)v14, v11);
    }
  }
}

- (id)textStylingAtPosition:(id)a3 inDirection:(int64_t)a4
{
  id v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", a3, a4);
  uint64_t v7 = [MEMORY[0x1E4F428B8] blackColor];
  [v6 setObject:v7 forKey:_MergedGlobals_877_0()];
  if (!a3) {
    return v6;
  }
  uint64_t v8 = (unsigned char *)*((void *)self->_page.m_ptr + 4);
  if (!v8[254] || !v8[576]) {
    return v6;
  }
  unsigned int v9 = v8[272];
  id m_ptr = self->_autocorrectionData.font.m_ptr;
  if (m_ptr) {
    CFRetain(self->_autocorrectionData.font.m_ptr);
  }
  [(WKContentView *)self _contentZoomScale];
  double v12 = v11;
  if (fabs(v11 + -1.0) <= 0.00000011920929)
  {
    int v15 = m_ptr;
    if (m_ptr) {
      goto LABEL_12;
    }
  }
  else
  {
    [m_ptr pointSize];
    uint64_t v14 = (void *)[m_ptr fontWithSize:v12 * v13];
    int v15 = v14;
    if (v14) {
      CFRetain(v14);
    }
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    if (v15)
    {
LABEL_12:
      int v16 = objc_msgSend((id)objc_msgSend(v15, "fontDescriptor"), "symbolicTraits");
      uint64_t v17 = v16 | (__rbit32(v9) >> 30);
      if (v16 == v17) {
        goto LABEL_27;
      }
      long long v18 = (void *)[v15 fontDescriptor];
      long long v19 = v18;
      if (v18) {
        CFRetain(v18);
      }
      else {
        long long v19 = objc_opt_new();
      }
      char v21 = (const void *)[v19 fontDescriptorWithSymbolicTraits:v17];
      char v22 = v21;
      if (v21) {
        CFRetain(v21);
      }
      if (v19) {
        CFRelease(v19);
      }
      char v23 = (void *)MEMORY[0x1E4F42A30];
      [v15 pointSize];
      int v24 = objc_msgSend(v23, "fontWithDescriptor:size:", v22);
      long long v25 = v24;
      if (v24)
      {
        CFRetain(v24);
        CFRelease(v15);
        if (!v22)
        {
LABEL_26:
          int v15 = v25;
LABEL_27:
          [v6 setObject:v15 forKey:off_1EC2B2188()];
          uint64_t v20 = v15;
          if ((v9 & 4) == 0) {
            goto LABEL_29;
          }
          goto LABEL_28;
        }
      }
      else
      {
        long long v25 = v15;
        if (!v22) {
          goto LABEL_26;
        }
      }
      CFRelease(v22);
      goto LABEL_26;
    }
  }
  uint64_t v20 = 0;
  if ((v9 & 4) != 0) {
LABEL_28:
  }
    [v6 setObject:&unk_1EEA52F90 forKey:off_1EC2B2190()];
LABEL_29:
  if (v20) {
    CFRelease(v20);
  }
  return v6;
}

- (id)insertionPointColor
{
  if ([(WKContentView *)self _requiresLegacyTextInputTraits]) {
    id v3 = [(WKContentView *)self textInputTraits];
  }
  else {
    id v3 = [(WKContentView *)self extendedTraitsDelegate];
  }

  return (id)[v3 insertionPointColor];
}

- (id)selectionBarColor
{
  if ([(WKContentView *)self _requiresLegacyTextInputTraits])
  {
    id v3 = [(WKContentView *)self textInputTraits];
    return (id)[v3 selectionBarColor];
  }
  else
  {
    id v5 = [(WKContentView *)self extendedTextInputTraits];
    return (id)[v5 selectionHandleColor];
  }
}

- (id)selectionHighlightColor
{
  if ([(WKContentView *)self _requiresLegacyTextInputTraits]) {
    id v3 = [(WKContentView *)self textInputTraits];
  }
  else {
    id v3 = [(WKContentView *)self extendedTraitsDelegate];
  }

  return (id)[v3 selectionHighlightColor];
}

- (BOOL)shouldAllowHighlightLinkCreation
{
  v15[17] = *MEMORY[0x1E4F143B8];
  WebKit::WebPageProxy::currentURL((WebKit::WebPageProxy *)self->_page.m_ptr, (uint64_t *)v13);
  MEMORY[0x19972E890](&v11, v13, 0);
  uint64_t v4 = *(WTF::StringImpl **)v13;
  *(void *)double v13 = 0;
  if (v4)
  {
    if (*(_DWORD *)v4 == 2) {
      WTF::StringImpl::destroy(v4, v3);
    }
    else {
      *(_DWORD *)v4 -= 2;
    }
  }
  if ((~v12 & 3) != 0)
  {
    BOOL v8 = 0;
  }
  else
  {
    uint64_t v5 = *((void *)self->_page.m_ptr + 4);
    *(_OWORD *)double v13 = *(_OWORD *)(v5 + 240);
    *(_DWORD *)&v13[15] = *(_DWORD *)(v5 + 255);
    std::__optional_copy_base<WebKit::EditorState::PostLayoutData,false>::__optional_copy_base[abi:sn180100](v14, v5 + 272);
    uint64_t v6 = std::__optional_copy_base<WebKit::EditorState::VisualData,false>::__optional_copy_base[abi:sn180100]((uint64_t)v15, v5 + 592);
    BOOL v8 = 0;
    if (v13[10] && !v13[13]) {
      BOOL v8 = v13[11] == 0;
    }
    std::__optional_destruct_base<WebKit::EditorState::VisualData,false>::~__optional_destruct_base[abi:sn180100](v6, v7);
    if (v14[304]) {
      WebKit::EditorState::PostLayoutData::~PostLayoutData((WebKit::EditorState::PostLayoutData *)v14, v3);
    }
  }
  unsigned int v9 = v11;
  double v11 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2) {
      WTF::StringImpl::destroy(v9, v3);
    }
    else {
      *(_DWORD *)v9 -= 2;
    }
  }
  return v8;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (*(void *)&self->_hasSetUpInteractions) {
    return sel_paste_ == a3;
  }
  uint64_t v8 = *((void *)self->_page.m_ptr + 4);
  if (![(WKContentView *)self shouldUseAsyncInteractions])
  {
    if (sel__moveDown_withHistory_ != a3
      && sel__moveLeft_withHistory_ != a3
      && sel__moveRight_withHistory_ != a3
      && sel__moveToEndOfDocument_withHistory_ != a3
      && sel__moveToEndOfLine_withHistory_ != a3
      && sel__moveToEndOfParagraph_withHistory_ != a3
      && sel__moveToEndOfWord_withHistory_ != a3
      && sel__moveToStartOfDocument_withHistory_ != a3
      && sel__moveToStartOfLine_withHistory_ != a3
      && sel__moveToStartOfParagraph_withHistory_ != a3
      && sel__moveToStartOfWord_withHistory_ != a3
      && sel__moveUp_withHistory_ != a3)
    {
      if (sel__deleteByWord == a3
        || sel__deleteForwardByWord == a3
        || sel__deleteForwardAndNotify_ == a3
        || sel__deleteToEndOfParagraph == a3
        || sel__deleteToStartOfLine == a3)
      {
        return *(unsigned char *)(v8 + 253) != 0;
      }
      int v12 = sel__transpose;
      goto LABEL_34;
    }
    return *(unsigned char *)(v8 + 249) == 0;
  }
  if (sel_moveInLayoutDirection_ == a3
    || sel_extendInLayoutDirection_ == a3
    || sel_moveInStorageDirection_byGranularity_ == a3
    || sel_extendInStorageDirection_byGranularity_ == a3)
  {
    return *(unsigned char *)(v8 + 249) == 0;
  }
  if (sel_deleteInDirection_toGranularity_ == a3) {
    return *(unsigned char *)(v8 + 253) != 0;
  }
  int v12 = sel_transposeCharactersAroundSelection;
LABEL_34:
  if (v12 == a3) {
    return *(unsigned char *)(v8 + 253) != 0;
  }
  id Weak = objc_loadWeak(&self->_webView.m_weakReference);

  return [Weak canPerformAction:a3 withSender:a4];
}

- (BOOL)canPerformActionForWebView:(SEL)a3 withSender:(id)a4
{
  v45[16] = *MEMORY[0x1E4F143B8];
  if (*(void *)&self->_hasSetUpInteractions)
  {
    LOBYTE(v5) = sel_paste_ == a3;
    return v5;
  }
  if (sel__nextAccessoryTab_ == a3)
  {
    if ([(WKContentView *)self _hasFocusedElement])
    {
      int v12 = self->_anon_938[64];
LABEL_63:
      LOBYTE(v5) = v12 != 0;
      return v5;
    }
LABEL_64:
    LOBYTE(v5) = 0;
    return v5;
  }
  if (sel__previousAccessoryTab_ == a3)
  {
    if ([(WKContentView *)self _hasFocusedElement])
    {
      int v12 = self->_anon_938[84];
      goto LABEL_63;
    }
    goto LABEL_64;
  }
  uint64_t v9 = *((void *)self->_page.m_ptr + 4);
  v39[0] = *(_OWORD *)(v9 + 240);
  *(_DWORD *)((char *)v39 + 15) = *(_DWORD *)(v9 + 255);
  std::__optional_copy_base<WebKit::EditorState::PostLayoutData,false>::__optional_copy_base[abi:sn180100](v40, v9 + 272);
  std::__optional_copy_base<WebKit::EditorState::VisualData,false>::__optional_copy_base[abi:sn180100]((uint64_t)v45, v9 + 592);
  if (sel_toggleBoldface_ == a3
    || sel_toggleItalics_ == a3
    || sel_toggleUnderline_ == a3
    || sel__toggleStrikeThrough_ == a3
    || sel__alignLeft_ == a3
    || sel__alignRight_ == a3
    || sel__alignCenter_ == a3
    || sel__alignJustified_ == a3
    || sel__setTextColor_sender_ == a3
    || sel__setFont_sender_ == a3
    || sel__setFontSize_sender_ == a3
    || sel__insertOrderedList_ == a3
    || sel__insertUnorderedList_ == a3
    || sel__insertNestedOrderedList_ == a3
    || sel__insertNestedUnorderedList_ == a3
    || sel__increaseListLevel_ == a3
    || sel__decreaseListLevel_ == a3
    || sel__changeListType_ == a3
    || sel__indent_ == a3
    || sel__outdent_ == a3
    || sel_increaseSize_ == a3
    || sel_decreaseSize_ == a3
    || sel_makeTextWritingDirectionNatural_ == a3)
  {
    int v13 = BYTE14(v39[0]);
LABEL_69:
    BOOL v14 = v13 == 0;
    goto LABEL_70;
  }
  if (sel_cut_ == a3)
  {
    LOBYTE(v5) = 0;
    if (HIBYTE(v39[0]) || !BYTE13(v39[0])) {
      goto LABEL_73;
    }
    goto LABEL_68;
  }
  if (sel_paste_ == a3
    || sel__pasteAsQuotation_ == a3
    || sel__pasteAndMatchStyle_ == a3
    || sel_pasteAndMatchStyle_ == a3)
  {
    LOBYTE(v5) = 0;
    if (BYTE9(v39[0]) || !BYTE13(v39[0])) {
      goto LABEL_73;
    }
    int v16 = (void *)[MEMORY[0x1E4F42C50] generalPasteboard];
    id v17 = [(WKContentView *)self supportedPasteboardTypesForCurrentSelection];
    if (objc_msgSend(v16, "containsPasteboardTypes:inItemSet:", v17, objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, objc_msgSend(v16, "numberOfItems"))))goto LABEL_78; {
    if (BYTE14(v39[0]))
    }
    {
      uint64_t v20 = *((void *)self->_page.m_ptr + 34);
      {
        WebKit::WebPreferencesKey::attachmentElementEnabledKey(void)::$_0::operator() const(void)::impl += 2;
        WebKit::WebPreferencesKey::attachmentElementEnabledKey(void)::kedouble y = (uint64_t)&WebKit::WebPreferencesKey::attachmentElementEnabledKey(void)::$_0::operator() const(void)::impl;
      }
      if (WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)(v20 + 40), (WTF::StringImpl **)&WebKit::WebPreferencesKey::attachmentElementEnabledKey(void)::key, v18))
      {
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        char v21 = (void *)[v16 itemProviders];
        uint64_t v22 = [v21 countByEnumeratingWithState:&v34 objects:v38 count:16];
        if (v22)
        {
          uint64_t v23 = *(void *)v35;
          do
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v35 != v23) {
                objc_enumerationMutation(v21);
              }
              long long v25 = *(void **)(*((void *)&v34 + 1) + 8 * i);
              uint64_t v26 = [v25 preferredPresentationStyle];
              if (v26)
              {
                if (v26 == 1) {
                  continue;
                }
              }
              else if (!objc_msgSend((id)objc_msgSend(v25, "suggestedName"), "length"))
              {
                continue;
              }
              if (objc_msgSend((id)objc_msgSend(v25, "web_fileUploadContentTypes"), "count")) {
                goto LABEL_78;
              }
            }
            uint64_t v22 = [v21 countByEnumeratingWithState:&v34 objects:v38 count:16];
          }
          while (v22);
        }
      }
    }
  }
  if (sel_copy_ == a3)
  {
    if (HIBYTE(v39[0]) && !BYTE12(v39[0])) {
      goto LABEL_161;
    }
LABEL_68:
    int v13 = BYTE10(v39[0]);
    goto LABEL_69;
  }
  if (sel__define_ != a3 && sel_define_ != a3 && sel_lookup_ != a3)
  {
    if (sel__lookup_ != a3)
    {
      if (sel__share_ == a3 || sel_share_ == a3)
      {
        LOBYTE(v5) = 0;
        if (!HIBYTE(v39[0]) && BYTE10(v39[0]) && v44)
        {
          BOOL v14 = v41 == 0;
          goto LABEL_70;
        }
        goto LABEL_73;
      }
      if (sel__addShortcut_ == a3 || sel_addShortcut_ == a3)
      {
        LOBYTE(v5) = 0;
        if (!HIBYTE(v39[0]) && BYTE10(v39[0]))
        {
          id v28 = [(WKContentView *)self selectedText];
          if ([v28 length] && MEMORY[0x19972CD50]())
          {
            unsigned __int8 v11 = [v28 _containsCJScripts];
            goto LABEL_133;
          }
          goto LABEL_161;
        }
        goto LABEL_73;
      }
      if (sel__promptForReplace_ == a3 || sel_promptForReplace_ == a3)
      {
        LOBYTE(v5) = 0;
        if (BYTE10(v39[0]) && v44 && v43)
        {
          if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42B20], "activeInstance"), "autocorrectSpellingEnabled"))
          {
            int v5 = objc_msgSend(-[WKContentView selectedText](self, "selectedText"), "_containsCJScriptsOnly") ^ 1;
            goto LABEL_73;
          }
          goto LABEL_161;
        }
        goto LABEL_73;
      }
      if (sel__transliterateChinese_ == a3 || sel_transliterateChinese_ == a3)
      {
        LOBYTE(v5) = 0;
        if (BYTE10(v39[0]) && v44 && v43)
        {
          if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42B20], "activeInstance"), "autocorrectSpellingEnabled"))
          {
            [(WKContentView *)self selectedText];
            unsigned __int8 v11 = UIKeyboardEnabledInputModesAllowChineseTransliterationForText();
            goto LABEL_133;
          }
          goto LABEL_161;
        }
        goto LABEL_73;
      }
      if (sel__translate_ == a3 || sel_translate_ == a3)
      {
        if (PAL::TranslationUIServicesLibrary((PAL *)1)
          && [(id)((uint64_t (*)(void))*MEMORY[0x1E4FB6418])() isAvailable])
        {
          if (HIBYTE(v39[0])) {
            BOOL v14 = 1;
          }
          else {
            BOOL v14 = BYTE10(v39[0]) == 0;
          }
          goto LABEL_70;
        }
        goto LABEL_161;
      }
      if (sel_select_ == a3)
      {
        if (HIBYTE(v39[0]) | BYTE10(v39[0])) {
          goto LABEL_161;
        }
LABEL_132:
        unsigned __int8 v11 = [(WKContentView *)self _hasContent];
        goto LABEL_133;
      }
      if (sel_selectAll_ != a3)
      {
        if (sel_replace_ == a3)
        {
          if (BYTE13(v39[0])) {
            BOOL v29 = HIBYTE(v39[0]) == 0;
          }
          else {
            BOOL v29 = 0;
          }
          LOBYTE(v5) = v29;
          goto LABEL_73;
        }
        if (sel_makeTextWritingDirectionLeftToRight_ != a3 && sel_makeTextWritingDirectionRightToLeft_ != a3)
        {
          if (sel_captureTextFromCamera_ != a3
            || self->_anon_938[113] - 1 <= 9
            && !self->_anon_938[107]
            && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
             || self->_usingMouseDragForSelection
             || !BYTE10(v39[0])))
          {
            if (sel_useSelectionForFind_ != a3 && sel_findSelected_ != a3 && sel__findSelected_ != a3)
            {
              v33.receiver = self;
              v33.super_class = (Class)WKContentView;
              unsigned __int8 v11 = [(WKContentView *)&v33 canPerformAction:a3 withSender:a4];
LABEL_133:
              LOBYTE(v5) = v11;
              goto LABEL_73;
            }
            int v31 = objc_msgSend(-[WKContentView webView](self, "webView"), "_findInteractionEnabled");
            int v32 = BYTE10(v39[0]) ? v31 : 0;
            if (v32 == 1)
            {
              BOOL v14 = objc_msgSend(-[WKContentView selectedText](self, "selectedText"), "length") == 0;
LABEL_70:
              LOBYTE(v5) = !v14;
              goto LABEL_73;
            }
          }
LABEL_161:
          LOBYTE(v5) = 0;
          goto LABEL_73;
        }
        LOBYTE(v5) = 0;
        if (BYTE13(v39[0]) && v44)
        {
          int v30 = v42;
          if (v42 != 1 || (UIKeyboardIsRightToLeftInputModeActive() & 1) != 0)
          {
            if (sel_makeTextWritingDirectionLeftToRight_ == a3) {
              BOOL v14 = v30 == 1;
            }
            else {
              BOOL v14 = v30 == 2;
            }
            goto LABEL_70;
          }
          goto LABEL_161;
        }
        goto LABEL_73;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && !self->_usingMouseDragForSelection)
      {
        if (BYTE10(v39[0])) {
          goto LABEL_161;
        }
        goto LABEL_132;
      }
LABEL_78:
      LOBYTE(v5) = 1;
      goto LABEL_73;
    }
    if (HIBYTE(v39[0])) {
      goto LABEL_161;
    }
    int v27 = (void *)[(id)((uint64_t (*)(void))*MEMORY[0x1E4FB6348])() sharedConnection];
    if ([v27 effectiveBoolValueForSetting:PAL::get_ManagedConfiguration_MCFeatureDefinitionLookupAllowed((PAL *)v27)] == 2)goto LABEL_161; {
    goto LABEL_68;
    }
  }
  LOBYTE(v5) = 0;
  if (!HIBYTE(v39[0]) && BYTE10(v39[0]) && v44)
  {
    if ((unint64_t)(v41 - 201) >= 0xFFFFFFFFFFFFFF38)
    {
      long long v19 = (void *)[(id)((uint64_t (*)(void))*MEMORY[0x1E4FB6348])() sharedConnection];
      BOOL v14 = [v19 effectiveBoolValueForSetting:PAL::get_ManagedConfiguration_MCFeatureDefinitionLookupAllowed((PAL *)v19)] == 2;
      goto LABEL_70;
    }
    goto LABEL_161;
  }
LABEL_73:
  std::__optional_destruct_base<WebKit::EditorState::VisualData,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)v45, v10);
  if (v44) {
    WebKit::EditorState::PostLayoutData::~PostLayoutData((WebKit::EditorState::PostLayoutData *)v40, v15);
  }
  return v5;
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  id Weak = objc_loadWeak(&self->_webView.m_weakReference);

  return (id)[Weak targetForAction:a3 withSender:a4];
}

- (id)targetForActionForWebView:(SEL)a3 withSender:(id)a4
{
  BOOL v8 = sel__define_ != a3 && sel__translate_ != a3 && sel__lookup_ != a3;
  if ([(WKContentView *)self shouldUseAsyncInteractions] && !v8) {
    return 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)WKContentView;
  return [(WKContentView *)&v10 targetForAction:a3 withSender:a4];
}

- (void)_willHideMenu:(id)a3
{
}

- (void)_keyboardDidRequestDismissal:(id)a3
{
  if (LOBYTE(self->_dataListTextSuggestionsInputView.m_ptr))
  {
    if ([(WKContentView *)self isFirstResponder]) {
      BYTE4(self->_revealFocusedElementDeferrer.m_ptr) = 1;
    }
  }
}

- (void)copyForWebView:(id)a3
{
  id m_ptr = self->_page.m_ptr;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v7 = 0;
  WebKit::WebPageProxy::executeEditCommand((WebKit::WebPageProxy *)m_ptr, &v8, &v7);
  int v5 = v7;
  uint64_t v7 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2) {
      WTF::StringImpl::destroy(v5, v4);
    }
    else {
      *(_DWORD *)v5 -= 2;
    }
  }
  uint64_t v6 = v8;
  BOOL v8 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy(v6, v4);
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
}

- (void)cutForWebView:(id)a3
{
}

- (void)pasteForWebView:(id)a3
{
  if ((id)[MEMORY[0x1E4F42B88] sharedMenuController] != a3
    || ![(WKContentView *)self _handleDOMPasteRequestWithResult:2])
  {
    BYTE4(self->_dataListSuggestionsControl.m_weakReference) = 1;
    id m_ptr = self->_page.m_ptr;
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    BOOL v8 = 0;
    WebKit::WebPageProxy::executeEditCommand((WebKit::WebPageProxy *)m_ptr, &v9, &v8);
    uint64_t v6 = v8;
    BOOL v8 = 0;
    if (v6)
    {
      if (*(_DWORD *)v6 == 2) {
        WTF::StringImpl::destroy(v6, v5);
      }
      else {
        *(_DWORD *)v6 -= 2;
      }
    }
    uint64_t v7 = v9;
    uint64_t v9 = 0;
    if (v7)
    {
      if (*(_DWORD *)v7 == 2) {
        WTF::StringImpl::destroy(v7, v5);
      }
      else {
        *(_DWORD *)v7 -= 2;
      }
    }
  }
}

- (void)_pasteAsQuotationForWebView:(id)a3
{
  BYTE4(self->_dataListSuggestionsControl.m_weakReference) = 1;
  id m_ptr = self->_page.m_ptr;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v7 = 0;
  WebKit::WebPageProxy::executeEditCommand((WebKit::WebPageProxy *)m_ptr, &v8, &v7);
  int v5 = v7;
  uint64_t v7 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2) {
      WTF::StringImpl::destroy(v5, v4);
    }
    else {
      *(_DWORD *)v5 -= 2;
    }
  }
  uint64_t v6 = v8;
  BOOL v8 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy(v6, v4);
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
}

- (void)selectForWebView:(id)a3
{
  uint64_t v4 = *((void *)self->_page.m_ptr + 34);
  {
    WebKit::WebPreferencesKey::textInteractionEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::textInteractionEnabledKey(void)::kedouble y = (uint64_t)&WebKit::WebPreferencesKey::textInteractionEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  if (WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)(v4 + 40), (WTF::StringImpl **)&WebKit::WebPreferencesKey::textInteractionEnabledKey(void)::key, (const WTF::StringImpl *)a3))
  {
    BYTE4(self->_dataListSuggestionsControl.m_weakReference) = 1;
    [self->_textInteractionWrapper.m_ptr selectWord];
    id m_ptr = self->_page.m_ptr;
    uint64_t v6 = (void *)WTF::fastMalloc((WTF *)0x10);
    *uint64_t v6 = &unk_1EEA0EB58;
    BOOL v8 = v6;
    WebKit::WebPageProxy::extendSelection((uint64_t)m_ptr, 1, (uint64_t *)&v8);
    uint64_t v7 = (uint64_t)v8;
    BOOL v8 = 0;
    if (v7) {
      (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
    }
  }
}

- (void)selectAllForWebView:(id)a3
{
  uint64_t v5 = *((void *)self->_page.m_ptr + 34);
  {
    WebKit::WebPreferencesKey::textInteractionEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::textInteractionEnabledKey(void)::kedouble y = (uint64_t)&WebKit::WebPreferencesKey::textInteractionEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  if (WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)(v5 + 40), (WTF::StringImpl **)&WebKit::WebPreferencesKey::textInteractionEnabledKey(void)::key, (const WTF::StringImpl *)a3))
  {
    BYTE4(self->_dataListSuggestionsControl.m_weakReference) = 1;
    [self->_textInteractionWrapper.m_ptr selectAll:a3];
    id m_ptr = self->_page.m_ptr;
    WebKit::WebPageProxy::selectAll((uint64_t)m_ptr);
  }
}

- (BOOL)shouldSynthesizeKeyEvents
{
  return self->_anon_938[289] && [(WKContentView *)self hasHiddenContentEditable];
}

- (void)toggleBoldfaceForWebView:(id)a3
{
  if (*(unsigned char *)(*((void *)self->_page.m_ptr + 4) + 254))
  {
    [(WKContentView *)self _executeEditCommand:@"toggleBold"];
    if ([(WKContentView *)self shouldSynthesizeKeyEvents])
    {
      id m_ptr = self->_page.m_ptr;
      WebKit::WebPageProxy::generateSyntheticEditingCommand((uint64_t)m_ptr, 2);
    }
  }
}

- (void)toggleItalicsForWebView:(id)a3
{
  if (*(unsigned char *)(*((void *)self->_page.m_ptr + 4) + 254))
  {
    [(WKContentView *)self _executeEditCommand:@"toggleItalic"];
    if ([(WKContentView *)self shouldSynthesizeKeyEvents])
    {
      id m_ptr = self->_page.m_ptr;
      WebKit::WebPageProxy::generateSyntheticEditingCommand((uint64_t)m_ptr, 3);
    }
  }
}

- (void)toggleUnderlineForWebView:(id)a3
{
  if (*(unsigned char *)(*((void *)self->_page.m_ptr + 4) + 254))
  {
    [(WKContentView *)self _executeEditCommand:@"toggleUnderline"];
    if ([(WKContentView *)self shouldSynthesizeKeyEvents])
    {
      id m_ptr = self->_page.m_ptr;
      WebKit::WebPageProxy::generateSyntheticEditingCommand((uint64_t)m_ptr, 4);
    }
  }
}

- (void)_defineForWebView:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    uint64_t v5 = qword_1EB3586B8;
    if (os_log_type_enabled((os_log_t)qword_1EB3586B8, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315138;
      uint64_t v7 = "-[WKContentView(WKInteraction) _defineForWebView:]";
      _os_log_error_impl(&dword_1985F2000, v5, OS_LOG_TYPE_ERROR, "Received unexpected call to %s", (uint8_t *)&v6, 0xCu);
    }
    __break(0xC471u);
    JUMPOUT(0x199442184);
  }

  [(WKContentView *)self lookupForWebView:a3];
}

- (void)accessibilityRetrieveSpeakSelectionContent
{
  if (self) {
    CFRetain(self);
  }
  id WeakRetained = objc_loadWeakRetained(&self->_webView.m_weakReference);
  id m_ptr = self->_page.m_ptr;
  CFRetain(self);
  if (WeakRetained) {
    CFRetain(WeakRetained);
  }
  uint64_t v5 = (void *)WTF::fastMalloc((WTF *)0x18);
  void *v5 = &unk_1EEA0EB80;
  v5[1] = self;
  v5[2] = WeakRetained;
  uint64_t v7 = v5;
  char v8 = 0;
  WebKit::AuxiliaryProcessProxy::sendWithAsyncReply<Messages::WebPage::GetSelectionOrContentsAsString,WTF::CompletionHandler<void ()(WTF::String const&)>>(*((void *)m_ptr + 32), (uint64_t)&v8, (uint64_t *)&v7, *(void *)(*((void *)m_ptr + 4) + 1928), 0, 1);
  uint64_t v6 = (uint64_t)v7;
  uint64_t v7 = 0;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  if (WeakRetained) {
    CFRelease(WeakRetained);
  }
  CFRelease(self);
}

- (void)_accessibilityRetrieveRectsEnclosingSelectionOffset:(int64_t)a3 withGranularity:(int64_t)a4
{
  id m_ptr = self->_page.m_ptr;
  CFRetain(self);
  char v8 = (void *)WTF::fastMalloc((WTF *)0x20);
  unint64_t v9 = 0x50304020100uLL >> (8 * a4);
  *char v8 = &unk_1EEA0EBA8;
  v8[1] = self;
  if ((unint64_t)a4 >= 6) {
    LOBYTE(v9) = 0;
  }
  v8[2] = a3;
  v8[3] = a4;
  unsigned __int8 v11 = v8;
  WebKit::WebPageProxy::requestRectsForGranularityWithSelectionOffset((uint64_t)m_ptr, v9 & 7, a3, (uint64_t *)&v11);
  uint64_t v10 = (uint64_t)v11;
  unsigned __int8 v11 = 0;
  if (v10) {
    (*(void (**)(uint64_t))(*(void *)v10 + 8))(v10);
  }
}

- (void)_accessibilityRetrieveRectsAtSelectionOffset:(int64_t)a3 withText:(id)a4
{
}

- (void)_accessibilityRetrieveRectsAtSelectionOffset:(int64_t)a3 withText:(id)a4 completionHandler:(id)a5
{
  if (self) {
    CFRetain(self);
  }
  id m_ptr = self->_page.m_ptr;
  MEMORY[0x19972EAD0](&v16, a4);
  CFRetain(self);
  uint64_t v10 = _Block_copy(a5);
  unsigned __int8 v11 = (void *)WTF::fastMalloc((WTF *)0x20);
  *unsigned __int8 v11 = &unk_1EEA0EBD0;
  v11[1] = self;
  void v11[2] = a3;
  v11[3] = v10;
  int v15 = v11;
  WebKit::WebPageProxy::requestRectsAtSelectionOffsetWithText((uint64_t)m_ptr, a3, (uint64_t)&v16, (uint64_t *)&v15);
  uint64_t v12 = (uint64_t)v15;
  int v15 = 0;
  if (v12) {
    (*(void (**)(uint64_t))(*(void *)v12 + 8))(v12);
  }
  _Block_release(0);
  BOOL v14 = v16;
  int v16 = 0;
  if (v14)
  {
    if (*(_DWORD *)v14 == 2) {
      WTF::StringImpl::destroy(v14, v13);
    }
    else {
      *(_DWORD *)v14 -= 2;
    }
  }
  CFRelease(self);
}

- (void)_accessibilityStoreSelection
{
  id m_ptr = self->_page.m_ptr;
  uint64_t v3 = *((void *)m_ptr + 32);
  char v4 = 1;
  WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::StoreSelectionForAccessibility>(v3, &v4, *(void *)(*((void *)m_ptr + 4) + 1928), 0);
}

- (void)_accessibilityClearSelection
{
  id m_ptr = self->_page.m_ptr;
  uint64_t v3 = *((void *)m_ptr + 32);
  char v4 = 0;
  WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::StoreSelectionForAccessibility>(v3, &v4, *(void *)(*((void *)m_ptr + 4) + 1928), 0);
}

- (BOOL)_handleDOMPasteRequestWithResult:(unsigned __int8)a3
{
  if (LOWORD(self->_ignoreSelectionCommandFadeCount) >= 0x100u)
  {
    BYTE1(self->_ignoreSelectionCommandFadeCount) = 0;
    if ((a3 - 1) <= 1u)
    {
      id m_ptr = self->_page.m_ptr;
      MEMORY[0x19972EAD0](&v19, *MEMORY[0x1E4F43C08]);
      uint64_t v5 = (void *)WTF::fastMalloc((WTF *)0x10);
      void *v5 = &unk_1EEA0EBF8;
      long long v18 = v5;
      v17[0] = 0;
      v17[16] = 0;
      unint64_t v7 = WebKit::WebPageProxy::grantAccessToCurrentPasteboardData((WebKit::WebPasteboardProxy *)m_ptr, &v19, (uint64_t *)&v18, (uint64_t)v17);
      char v8 = (char)v6;
      uint64_t v9 = (uint64_t)v18;
      long long v18 = 0;
      if (v9) {
        (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
      }
      uint64_t v10 = v19;
      long long v19 = 0;
      if (v10)
      {
        if (*(_DWORD *)v10 == 2) {
          WTF::StringImpl::destroy(v10, v6);
        }
        else {
          *(_DWORD *)v10 -= 2;
        }
      }
      if (v8)
      {
        uint64_t v11 = WebKit::WebsiteDataStore::networkProcess(*((WebKit::WebsiteDataStore **)self->_page.m_ptr + 39));
        uint64_t v12 = (unsigned int *)(v11 + 16);
        atomic_fetch_add((atomic_uint *volatile)(v11 + 16), 1u);
        int v13 = *(atomic_uchar *volatile ***)(v11 + 144);
        if (!v13)
        {
          BOOL result = -126;
          __break(0xC471u);
          return result;
        }
        WTF::ApproximateTime::now((WTF::ApproximateTime *)v11);
        IPC::Connection::waitForAsyncReplyAndDispatchImmediately<Messages::NetworkProcess::AllowFilesAccessFromWebProcess>(v13, v7, v14 + 0.1);
        WTF::ThreadSafeRefCounted<WebKit::AuxiliaryProcessProxy,(WTF::DestructionThread)2>::deref(v12);
      }
    }
  }
  int v15 = *(WTF::StringImpl **)&self->_hasSetUpInteractions;
  *(void *)&self->_hasSetUpInteractions = 0;
  long long v19 = v15;
  if (v15)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42B88], "sharedMenuController"), "hideMenuFromView:", self);
    WTF::CompletionHandler<void ()(WebCore::DOMPasteAccessResponse)>::operator()((uint64_t *)&v19);
    if (v19) {
      (*(void (**)(WTF::StringImpl *))(*(void *)v19 + 8))(v19);
    }
  }
  return v15 != 0;
}

- (void)_willPerformAction:(SEL)a3 sender:(id)a4
{
  if (sel_paste_ != a3) {
    -[WKContentView _handleDOMPasteRequestWithResult:](self, "_handleDOMPasteRequestWithResult:", 0, a4);
  }
}

- (void)_didPerformAction:(SEL)a3 sender:(id)a4
{
  if (sel_paste_ == a3) {
    -[WKContentView _handleDOMPasteRequestWithResult:](self, "_handleDOMPasteRequestWithResult:", 0, a4);
  }
}

- (void)changeSelectionWithGestureAt:(CGPoint)a3 withGesture:(int64_t)a4 withState:(int64_t)a5
{
}

- (void)changeSelectionWithGestureAt:(CGPoint)a3 withGesture:(int64_t)a4 withState:(int64_t)a5 withFlags:(unint64_t)a6
{
  CGPoint v22 = a3;
  id v10 = [(WKContentView *)self textInteractionLoupeGestureRecognizer];
  CGPoint v20 = v22;
  char v21 = 1;
  logTextInteraction((uint64_t)"-[WKContentView(WKInteraction) changeSelectionWithGestureAt:withGesture:withState:withFlags:]", v10, (uint64_t)&v20, a5, 1, a4, 1, v11, 0, 0, 0, a6, SHIDWORD(a6), 1);
  BYTE4(self->_dataListSuggestionsControl.m_weakReference) = 1;
  BYTE2(self->_dataListTextSuggestions.m_ptr) = 1;
  id m_ptr = self->_page.m_ptr;
  WebCore::IntPoint::IntPoint((WebCore::IntPoint *)&v19, &v22);
  if ((unint64_t)(a4 - 1) > 0xD) {
    char v13 = 0;
  }
  else {
    char v13 = byte_1994F8FD0[a4 - 1];
  }
  char v14 = [(WKContentView *)self _hasFocusedElement];
  CFRetain(self);
  int v15 = (void *)WTF::fastMalloc((WTF *)0x28);
  if ((unint64_t)a5 >= 6) {
    char v16 = 0;
  }
  else {
    char v16 = a5;
  }
  *int v15 = &unk_1EEA0EC20;
  v15[1] = self;
  void v15[2] = self;
  v15[3] = a5;
  v15[4] = a6;
  long long v18 = v15;
  WebKit::WebPageProxy::selectWithGesture((uint64_t)m_ptr, v19, v13, v16, v14, (uint64_t *)&v18);
  uint64_t v17 = (uint64_t)v18;
  long long v18 = 0;
  if (v17) {
    (*(void (**)(uint64_t))(*(void *)v17 + 8))(v17);
  }
}

- (void)changeSelectionWithTouchAt:(CGPoint)a3 withSelectionTouch:(int64_t)a4 baseIsStart:(BOOL)a5 withFlags:(unint64_t)a6
{
  CGPoint v20 = a3;
  id v10 = [(WKContentView *)self textInteractionLoupeGestureRecognizer];
  CGPoint v18 = v20;
  char v19 = 1;
  logTextInteraction((uint64_t)"-[WKContentView(WKInteraction) changeSelectionWithTouchAt:withSelectionTouch:baseIsStart:withFlags:]", v10, (uint64_t)&v18, 0, 0, 0, 0, v11, a4, 1, 0, a6, SHIDWORD(a6), 1);
  BYTE4(self->_dataListSuggestionsControl.m_weakReference) = 1;
  BYTE2(self->_dataListTextSuggestions.m_ptr) = 1;
  id m_ptr = self->_page.m_ptr;
  WebCore::IntPoint::IntPoint((WebCore::IntPoint *)&v17, &v20);
  CFRetain(self);
  char v13 = (void *)WTF::fastMalloc((WTF *)0x20);
  if ((unint64_t)a4 >= 6) {
    char v14 = 2;
  }
  else {
    char v14 = a4;
  }
  *char v13 = &unk_1EEA0EC48;
  v13[1] = self;
  v13[2] = self;
  void v13[3] = a6;
  char v16 = v13;
  WebKit::WebPageProxy::updateSelectionWithTouches((uint64_t)m_ptr, v17, v14, a5, (uint64_t *)&v16);
  uint64_t v15 = (uint64_t)v16;
  char v16 = 0;
  if (v15) {
    (*(void (**)(uint64_t))(*(void *)v15 + 8))(v15);
  }
}

- (void)changeSelectionWithTouchesFrom:(CGPoint)a3 to:(CGPoint)a4 withGesture:(int64_t)a5 withState:(int64_t)a6
{
  CGPoint v22 = a3;
  CGPoint v21 = a4;
  id v9 = [(WKContentView *)self textInteractionLoupeGestureRecognizer];
  CGPoint v19 = v22;
  char v20 = 1;
  logTextInteraction((uint64_t)"-[WKContentView(WKInteraction) changeSelectionWithTouchesFrom:to:withGesture:withState:]", v9, (uint64_t)&v19, a6, 1, a5, 1, v10, 0, 0, 0, 0, 0, 0);
  BYTE4(self->_dataListSuggestionsControl.m_weakReference) = 1;
  BYTE2(self->_dataListTextSuggestions.m_ptr) = 1;
  id m_ptr = self->_page.m_ptr;
  WebCore::IntPoint::IntPoint((WebCore::IntPoint *)&v18, &v22);
  WebCore::IntPoint::IntPoint((WebCore::IntPoint *)&v17, &v21);
  if ((unint64_t)(a5 - 1) > 0xD) {
    char v12 = 0;
  }
  else {
    char v12 = byte_1994F8FD0[a5 - 1];
  }
  CFRetain(self);
  char v13 = (void *)WTF::fastMalloc((WTF *)0x18);
  if ((unint64_t)a6 >= 6) {
    char v14 = 0;
  }
  else {
    char v14 = a6;
  }
  *char v13 = &unk_1EEA0EC70;
  v13[1] = self;
  v13[2] = self;
  char v16 = v13;
  WebKit::WebPageProxy::selectWithTwoTouches((uint64_t)m_ptr, v18, v17, v12, v14, (uint64_t *)&v16);
  uint64_t v15 = (uint64_t)v16;
  char v16 = 0;
  if (v15) {
    (*(void (**)(uint64_t))(*(void *)v15 + 8))(v15);
  }
}

- (void)moveByOffset:(int64_t)a3
{
  if (a3)
  {
    int v3 = a3;
    [(WKContentView *)self _internalBeginSelectionChange];
    if (self) {
      CFRetain(self);
    }
    id m_ptr = self->_page.m_ptr;
    CFRetain(self);
    uint64_t v6 = (void *)WTF::fastMalloc((WTF *)0x10);
    *uint64_t v6 = &unk_1EEA0EC98;
    v6[1] = self;
    char v8 = v6;
    WebKit::WebPageProxy::moveSelectionByOffset((uint64_t)m_ptr, v3, (uint64_t *)&v8);
    uint64_t v7 = (uint64_t)v8;
    char v8 = 0;
    if (v7) {
      (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
    }
    CFRelease(self);
  }
}

- (const)autocorrectionData
{
  return &self->_autocorrectionData;
}

- (void)requestAutocorrectionRectsForString:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    uint64_t v10 = qword_1EB3586B8;
    if (os_log_type_enabled((os_log_t)qword_1EB3586B8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[WKContentView(WKInteraction) requestAutocorrectionRectsForString:withCompletionHandler:]";
      _os_log_error_impl(&dword_1985F2000, v10, OS_LOG_TYPE_ERROR, "Received unexpected call to %s", buf, 0xCu);
    }
    __break(0xC471u);
    JUMPOUT(0x199443604);
  }
  if (a4)
  {
    if (self) {
      CFRetain(self);
    }
    uint64_t v7 = _Block_copy(a4);
    char v8 = (void *)WTF::fastMalloc((WTF *)0x18);
    *char v8 = &unk_1EEA0ECC0;
    v8[1] = self;
    v8[2] = v7;
    *(void *)buf = v8;
    [(WKContentView *)self _internalRequestTextRectsForString:a3 completion:buf];
    uint64_t v9 = *(void *)buf;
    *(void *)buf = 0;
    if (v9) {
      (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
    }
    _Block_release(0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"Expected a nonnull completion handler in %s.", "-[WKContentView(WKInteraction) requestAutocorrectionRectsForString:withCompletionHandler:]");
  }
}

- (void)_internalRequestTextRectsForString:(id)a3 completion:(void *)a4
{
  if ([a3 length])
  {
    id m_ptr = self->_page.m_ptr;
    MEMORY[0x19972EAD0](&v16, a3);
    CFRetain(self);
    uint64_t v8 = *(void *)a4;
    *(void *)a4 = 0;
    uint64_t v9 = (void *)WTF::fastMalloc((WTF *)0x18);
    void *v9 = &unk_1EEA0ECE8;
    v9[1] = self;
    v9[2] = v8;
    uint64_t v15 = v9;
    WebKit::WebPageProxy::requestAutocorrectionData((uint64_t)m_ptr, (uint64_t *)&v16, (uint64_t *)&v15);
    uint64_t v11 = (uint64_t)v15;
    uint64_t v15 = 0;
    if (v11) {
      (*(void (**)(uint64_t))(*(void *)v11 + 8))(v11);
    }
    uint64_t v12 = v16;
    char v16 = 0;
    if (v12)
    {
      if (*(_DWORD *)v12 == 2) {
        WTF::StringImpl::destroy(v12, v10);
      }
      else {
        *(_DWORD *)v12 -= 2;
      }
    }
  }
  else
  {
    char v16 = 0;
    uint64_t v17 = 0;
    (*(void (**)(void, WTF::StringImpl **))(**(void **)a4 + 16))(*(void *)a4, &v16);
    char v14 = v16;
    if (v16)
    {
      char v16 = 0;
      LODWORD(v17) = 0;
      WTF::fastFree(v14, v13);
    }
  }
}

- (void)requestPreferredArrowDirectionForEditMenuWithCompletionHandler:(id)a3
{
  uint64_t v5 = (WTF::ApproximateTime *)[(WKContentView *)self shouldSuppressEditMenu];
  if (v5)
  {
    uint64_t v6 = (void (*)(id, void))*((void *)a3 + 2);
    v6(a3, 0);
  }
  else
  {
    WTF::ApproximateTime::now(v5);
    uint64_t v12 = v7;
    id v13 = 0;
    objc_initWeak(&v13, self);
    aBlock = _Block_copy(a3);
    uint64_t v8 = WTF::fastMalloc((WTF *)0x20);
    *(void *)uint64_t v8 = &unk_1EEA0ED10;
    *(void *)(v8 + 8) = v12;
    *(void *)(v8 + 16) = 0;
    objc_moveWeak((id *)(v8 + 16), &v13);
    uint64_t v9 = aBlock;
    aBlock = 0;
    *(void *)(v8 + 24) = v9;
    uint64_t v11 = v8;
    [(WKContentView *)self doAfterComputingImageAnalysisResultsForBackgroundRemoval:&v11];
    uint64_t v10 = v11;
    uint64_t v11 = 0;
    if (v10) {
      (*(void (**)(uint64_t))(*(void *)v10 + 8))(v10);
    }
    _Block_release(aBlock);
    objc_destroyWeak(&v13);
  }
}

- (id)removeBackgroundMenu
{
  id m_ptr = self->_page.m_ptr;
  if (!m_ptr) {
    return 0;
  }
  uint64_t v5 = *((void *)m_ptr + 34);
  {
    WebKit::WebPreferencesKey::removeBackgroundEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::removeBackgroundEnabledKey(void)::kedouble y = (uint64_t)&WebKit::WebPreferencesKey::removeBackgroundEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  if (!WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)(v5 + 40), (WTF::StringImpl **)&WebKit::WebPreferencesKey::removeBackgroundEnabledKey(void)::key, v2))return 0; {
  uint64_t v6 = *((void *)self->_page.m_ptr + 4);
  }
  if (!*(unsigned char *)(v6 + 576)) {
    return 0;
  }
  p_imageAnalysisActionButtons = (WebCore::ElementContext *)&self->_imageAnalysisActionButtons;
  if (!self->_anon_fb8[8] || !*(unsigned char *)(v6 + 464)) {
    return 0;
  }
  if (*(float *)p_imageAnalysisActionButtons != *(float *)(v6 + 384)
    || *((float *)&self->_imageAnalysisActionButtons.m_ptr + 1) != *(float *)(v6 + 388))
  {
    return 0;
  }
  if (self->_imageAnalysisInteractionBounds.m_location.m_x != *(float *)(v6 + 392)
    || self->_imageAnalysisInteractionBounds.m_location.m_y != *(float *)(v6 + 396))
  {
    return 0;
  }
  BOOL isSameElement = WebCore::ElementContext::isSameElement(p_imageAnalysisActionButtons, (const ElementContext *)(v6 + 384));
  if (!isSameElement) {
    return 0;
  }
  WebCore::contextMenuItemTitleRemoveBackground((uint64_t *)&v20, (WebCore *)isSameElement);
  if (v20) {
    uint64_t v11 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    uint64_t v11 = &stru_1EEA10550;
  }
  uint64_t v12 = [MEMORY[0x1E4F42A80] _systemImageNamed:@"circle.rectangle.filled.pattern.diagonalline"];
  id v13 = (void *)WTF::fastMalloc((WTF *)0x10);
  *id v13 = &unk_1EEA0ED88;
  CGPoint v19 = v13;
  id v15 = [(WKContentView *)self menuWithInlineAction:v11 image:v12 identifier:@"WKActionRemoveBackground" handler:&v19];
  char v16 = v19;
  CGPoint v19 = 0;
  if (v16) {
    (*(void (**)(void *))(*v16 + 8))(v16);
  }
  uint64_t v17 = v20;
  char v20 = 0;
  if (v17)
  {
    if (*(_DWORD *)v17 == 2) {
      WTF::StringImpl::destroy(v17, v14);
    }
    else {
      *(_DWORD *)v17 -= 2;
    }
  }
  return v15;
}

- (void)doAfterComputingImageAnalysisResultsForBackgroundRemoval:(void *)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *((void *)self->_page.m_ptr + 4);
  if (*(unsigned char *)(v4 + 576))
  {
    long long v6 = *(_OWORD *)(v4 + 432);
    *(ProcessQualified<WTF::UUID> *)((char *)&v31.documentIdentifier + 8) = *(ProcessQualified<WTF::UUID> *)(v4 + 416);
    long long v32 = v6;
    long long v7 = *(_OWORD *)(v4 + 464);
    long long v33 = *(_OWORD *)(v4 + 448);
    long long v34 = v7;
    long long v8 = *(_OWORD *)(v4 + 400);
    v31.FloatRect boundingRect = *(FloatRect *)(v4 + 384);
    *(_OWORD *)&v31.webPageIdentifier.m_value.unint64_t m_identifier = v8;
    p_imageAnalysisActionButtons = &self->_imageAnalysisActionButtons;
    if (self->_anon_fb8[8]) {
      BOOL v10 = v7 == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (!v10
      && (*(float *)&p_imageAnalysisActionButtons->m_ptr == v31.boundingRect.m_location.m_x
        ? (BOOL v11 = *((float *)&self->_imageAnalysisActionButtons.m_ptr + 1) == v31.boundingRect.m_location.m_y)
        : (BOOL v11 = 0),
          v11
       && (self->_imageAnalysisInteractionBounds.m_location.m_x == v31.boundingRect.m_size.m_width
         ? (BOOL v12 = self->_imageAnalysisInteractionBounds.m_location.m_y == v31.boundingRect.m_size.m_height)
         : (BOOL v12 = 0),
           v12
        && WebCore::ElementContext::isSameElement((WebCore::ElementContext *)&self->_imageAnalysisActionButtons, &v31)))
      || (std::__optional_destruct_base<WebKit::RemoveBackgroundData,false>::reset[abi:sn180100]((uint64_t)p_imageAnalysisActionButtons, (WTF::StringImpl *)a2), !(_BYTE)v34))
    {
      WTF::CompletionHandler<void ()(void)>::operator()((uint64_t *)a3);
    }
    else
    {
      id m_ptr = self->_page.m_ptr;
      long long v26 = *(long long *)((char *)&v31.documentIdentifier + 8);
      long long v27 = v32;
      uint64_t v14 = *(void *)a3;
      *(void *)a3 = 0;
      FloatRect boundingRect = v31.boundingRect;
      long long v25 = *(_OWORD *)&v31.webPageIdentifier.m_value.m_identifier;
      *(void *)&long long v28 = v33;
      uint64_t v29 = v14;
      id v30 = 0;
      objc_initWeak(&v30, self);
      uint64_t v15 = WTF::fastMalloc((WTF *)0x70);
      *(void *)uint64_t v15 = &unk_1EEA0EDB0;
      long long v17 = v27;
      long long v16 = v28;
      *(_OWORD *)(v15 + 48) = v26;
      *(_OWORD *)(v15 + 64) = v17;
      *(_OWORD *)(v15 + 80) = v16;
      long long v18 = v25;
      *(FloatRect *)(v15 + 16) = boundingRect;
      *(_OWORD *)(v15 + 32) = v18;
      uint64_t v19 = v29;
      uint64_t v29 = 0;
      *(void *)(v15 + 96) = v19;
      *(void *)(v15 + 104) = 0;
      objc_moveWeak((id *)(v15 + 104), &v30);
      uint64_t v22 = v15;
      uint64_t v23 = &v31;
      WebKit::AuxiliaryProcessProxy::sendWithAsyncReply<Messages::WebPage::ShouldAllowRemoveBackground,WTF::CompletionHandler<void ()(BOOL)>>(*((void *)m_ptr + 32), (uint64_t *)&v23, &v22, *(void *)(*((void *)m_ptr + 4) + 1928), 0, 1);
      uint64_t v20 = v22;
      uint64_t v22 = 0;
      if (v20) {
        (*(void (**)(uint64_t))(*(void *)v20 + 8))(v20);
      }
      objc_destroyWeak(&v30);
      uint64_t v21 = v29;
      uint64_t v29 = 0;
      if (v21) {
        (*(void (**)(uint64_t))(*(void *)v21 + 8))(v21);
      }
    }
  }
  else
  {
    WTF::CompletionHandler<void ()(void)>::operator()((uint64_t *)a3);
  }
}

- (BOOL)_handleTapOverInteractiveControl:(CGPoint)a3
{
  id v4 = -[WKContentView hitTest:withEvent:](self, "hitTest:withEvent:", 0, a3.x, a3.y);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    id v4 = 0;
  }
  if (v4)
  {
    if ([self->_imageAnalysisContextMenuActionData.var0.__val_.copySubjectResult.m_ptr analysisButton])
    {
      uint64_t v5 = objc_opt_class();
      if (v5 == objc_opt_class()) {
        objc_msgSend(self->_imageAnalysisContextMenuActionData.var0.__val_.copySubjectResult.m_ptr, "setHighlightSelectableItems:", objc_msgSend(self->_imageAnalysisContextMenuActionData.var0.__val_.copySubjectResult.m_ptr, "highlightSelectableItems") ^ 1);
      }
    }
    [v4 sendActionsForControlEvents:64];
  }
  return v4 != 0;
}

- (void)selectPositionAtPoint:(CGPoint)a3 completionHandler:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  BYTE4(self->_dataListSuggestionsControl.m_weakReference) = 1;
  BOOL v8 = [(WKContentView *)self _hasFocusedElement];

  -[WKContentView _selectPositionAtPoint:stayingWithinFocusedElement:completionHandler:](self, "_selectPositionAtPoint:stayingWithinFocusedElement:completionHandler:", v8, a4, x, y);
}

- (void)_selectPositionAtPoint:(CGPoint)a3 stayingWithinFocusedElement:(BOOL)a4 completionHandler:(id)a5
{
  CGPoint v18 = a3;
  id v8 = [(WKContentView *)self textInteractionLoupeGestureRecognizer];
  CGPoint v16 = v18;
  char v17 = 1;
  logTextInteraction((uint64_t)"-[WKContentView(WKInteraction) _selectPositionAtPoint:stayingWithinFocusedElement:completionHandler:]", v8, (uint64_t)&v16, 0, 0, 0, 0, v9, 0, 0, 0, 0, 0, 0);
  BYTE4(self->_dataListSuggestionsControl.m_weakReference) = 1;
  BYTE2(self->_dataListTextSuggestions.m_ptr) = 1;
  id m_ptr = self->_page.m_ptr;
  WebCore::IntPoint::IntPoint((WebCore::IntPoint *)&v15, &v18);
  CFRetain(self);
  BOOL v11 = _Block_copy(a5);
  BOOL v12 = (void *)WTF::fastMalloc((WTF *)0x18);
  *BOOL v12 = &unk_1EEA0EE28;
  v12[1] = self;
  float v12[2] = v11;
  uint64_t v14 = v12;
  WebKit::WebPageProxy::selectPositionAtPoint((uint64_t)m_ptr, v15, a4, (uint64_t *)&v14);
  uint64_t v13 = (uint64_t)v14;
  uint64_t v14 = 0;
  if (v13) {
    (*(void (**)(uint64_t))(*(void *)v13 + 8))(v13);
  }
  _Block_release(0);
}

- (void)selectPositionAtBoundary:(int64_t)a3 inDirection:(int64_t)a4 fromPoint:(CGPoint)a5 completionHandler:(id)a6
{
  CGPoint v23 = a5;
  id v10 = [(WKContentView *)self textInteractionLoupeGestureRecognizer];
  CGPoint v21 = v23;
  char v22 = 1;
  logTextInteraction((uint64_t)"-[WKContentView(WKInteraction) selectPositionAtBoundary:inDirection:fromPoint:completionHandler:]", v10, (uint64_t)&v21, 0, 0, 0, 0, v11, 0, 0, 0, 0, 0, 0);
  BYTE4(self->_dataListSuggestionsControl.m_weakReference) = 1;
  BYTE2(self->_dataListTextSuggestions.m_ptr) = 1;
  id m_ptr = self->_page.m_ptr;
  WebCore::IntPoint::IntPoint((WebCore::IntPoint *)&v20, &v23);
  if ((unint64_t)a3 >= 6) {
    char v13 = 0;
  }
  else {
    char v13 = 0x50304020100uLL >> (8 * a3);
  }
  if ((unint64_t)(a4 - 3) >= 2) {
    char v14 = 2;
  }
  else {
    char v14 = 3;
  }
  char v15 = [(WKContentView *)self _hasFocusedElement];
  CFRetain(self);
  CGPoint v16 = _Block_copy(a6);
  char v17 = (void *)WTF::fastMalloc((WTF *)0x18);
  *char v17 = &unk_1EEA0EE50;
  v17[1] = self;
  float v17[2] = v16;
  uint64_t v19 = v17;
  WebKit::WebPageProxy::selectPositionAtBoundaryWithDirection((uint64_t)m_ptr, v20, v13, v14, v15, (uint64_t *)&v19);
  uint64_t v18 = (uint64_t)v19;
  uint64_t v19 = 0;
  if (v18) {
    (*(void (**)(uint64_t))(*(void *)v18 + 8))(v18);
  }
  _Block_release(0);
}

- (void)moveSelectionAtBoundary:(int64_t)a3 inDirection:(int64_t)a4 completionHandler:(id)a5
{
  id v9 = [(WKContentView *)self textInteractionLoupeGestureRecognizer];
  v18[0] = 0;
  v18[16] = 0;
  logTextInteraction((uint64_t)"-[WKContentView(WKInteraction) moveSelectionAtBoundary:inDirection:completionHandler:]", v9, (uint64_t)v18, 0, 0, 0, 0, v10, 0, 0, 0, 0, 0, 0);
  BYTE4(self->_dataListSuggestionsControl.m_weakReference) = 1;
  BYTE2(self->_dataListTextSuggestions.m_ptr) = 1;
  id m_ptr = self->_page.m_ptr;
  if ((unint64_t)a3 >= 6) {
    char v12 = 0;
  }
  else {
    char v12 = 0x50304020100uLL >> (8 * a3);
  }
  if ((unint64_t)(a4 - 3) >= 2) {
    char v13 = 2;
  }
  else {
    char v13 = 3;
  }
  CFRetain(self);
  char v14 = _Block_copy(a5);
  char v15 = (void *)WTF::fastMalloc((WTF *)0x18);
  *char v15 = &unk_1EEA0EE78;
  v15[1] = self;
  void v15[2] = v14;
  char v17 = v15;
  WebKit::WebPageProxy::moveSelectionAtBoundaryWithDirection((uint64_t)m_ptr, v12, v13, (uint64_t *)&v17);
  uint64_t v16 = (uint64_t)v17;
  char v17 = 0;
  if (v16) {
    (*(void (**)(uint64_t))(*(void *)v16 + 8))(v16);
  }
  _Block_release(0);
}

- (void)selectTextWithGranularity:(int64_t)a3 atPoint:(CGPoint)a4 completionHandler:(id)a5
{
  CGPoint v20 = a4;
  id v8 = [(WKContentView *)self textInteractionLoupeGestureRecognizer];
  CGPoint v18 = v20;
  char v19 = 1;
  logTextInteraction((uint64_t)"-[WKContentView(WKInteraction) selectTextWithGranularity:atPoint:completionHandler:]", v8, (uint64_t)&v18, 0, 0, 0, 0, v9, 0, 0, 0, 0, 0, 0);
  BYTE4(self->_dataListSuggestionsControl.m_weakReference) = 1;
  BYTE2(self->_dataListTextSuggestions.m_ptr) = 1;
  BYTE3(self->_dataListTextSuggestions.m_ptr) = objc_msgSend((id)objc_msgSend(self->_mouseInteraction.m_ptr, "mouseTouchGestureRecognizer"), "_wk_hasRecognizedOrEnded");
  ++self->_dropAnimationCount;
  id m_ptr = self->_page.m_ptr;
  WebCore::IntPoint::IntPoint((WebCore::IntPoint *)&v17, &v20);
  if ((unint64_t)a3 >= 6) {
    char v11 = 0;
  }
  else {
    char v11 = 0x50304020100uLL >> (8 * a3);
  }
  char v12 = [(WKContentView *)self _hasFocusedElement];
  CFRetain(self);
  char v13 = _Block_copy(a5);
  char v14 = (void *)WTF::fastMalloc((WTF *)0x18);
  *char v14 = &unk_1EEA0EEA0;
  v14[1] = self;
  float v14[2] = v13;
  uint64_t v16 = v14;
  WebKit::WebPageProxy::selectTextWithGranularityAtPoint((uint64_t)m_ptr, v17, v11, v12, (uint64_t *)&v16);
  uint64_t v15 = (uint64_t)v16;
  uint64_t v16 = 0;
  if (v15) {
    (*(void (**)(uint64_t))(*(void *)v15 + 8))(v15);
  }
  _Block_release(0);
}

- (void)beginSelectionInDirection:(int64_t)a3 completionHandler:(id)a4
{
  id v7 = [(WKContentView *)self textInteractionLoupeGestureRecognizer];
  v16[0] = 0;
  unsigned char v16[16] = 0;
  logTextInteraction((uint64_t)"-[WKContentView(WKInteraction) beginSelectionInDirection:completionHandler:]", v7, (uint64_t)v16, 0, 0, 0, 0, v8, 0, 0, 0, 0, 0, 0);
  BYTE4(self->_dataListSuggestionsControl.m_weakReference) = 1;
  id m_ptr = self->_page.m_ptr;
  uint64_t v10 = _Block_copy(a4);
  char v11 = (void *)WTF::fastMalloc((WTF *)0x10);
  if ((unint64_t)(a3 - 3) >= 2) {
    char v12 = 2;
  }
  else {
    char v12 = 3;
  }
  *char v11 = &unk_1EEA0EEC8;
  v11[1] = v10;
  uint64_t v15 = v11;
  uint64_t v13 = *((void *)m_ptr + 32);
  char v17 = v12;
  WebKit::AuxiliaryProcessProxy::sendWithAsyncReply<Messages::WebPage::BeginSelectionInDirection,WTF::CompletionHandler<void ()(BOOL)>>(v13, &v17, (uint64_t *)&v15, *(void *)(*((void *)m_ptr + 4) + 1928), 0, 1);
  uint64_t v14 = (uint64_t)v15;
  uint64_t v15 = 0;
  if (v14) {
    (*(void (**)(uint64_t))(*(void *)v14 + 8))(v14);
  }
  _Block_release(0);
}

- (void)updateSelectionWithExtentPoint:(CGPoint)a3 completionHandler:(id)a4
{
}

- (void)updateSelectionWithExtentPoint:(CGPoint)a3 withBoundary:(int64_t)a4 completionHandler:(id)a5
{
  CGPoint v28 = a3;
  id v8 = [(WKContentView *)self textInteractionLoupeGestureRecognizer];
  CGPoint v26 = v28;
  char v27 = 1;
  logTextInteraction((uint64_t)"-[WKContentView(WKInteraction) updateSelectionWithExtentPoint:withBoundary:completionHandler:]", v8, (uint64_t)&v26, 0, 0, 0, 0, v9, 0, 0, 0, 0, 0, 0);
  BYTE4(self->_dataListSuggestionsControl.m_weakReference) = 1;
  if (a4)
  {
    ++self->_dropAnimationCount;
    id m_ptr = self->_page.m_ptr;
    WebCore::IntPoint::IntPoint((WebCore::IntPoint *)&v23, &v28);
    switch(a4)
    {
      case 1:
        char v11 = 1;
        break;
      case 2:
        char v11 = 2;
        break;
      case 3:
        char v11 = 4;
        break;
      case 4:
        char v11 = 3;
        break;
      case 5:
        char v11 = 5;
        break;
      default:
        goto LABEL_6;
    }
    goto LABEL_14;
  }
  if (BYTE3(self->_dataListTextSuggestions.m_ptr))
  {
    ++self->_dropAnimationCount;
    id m_ptr = self->_page.m_ptr;
    WebCore::IntPoint::IntPoint((WebCore::IntPoint *)&v23, &v28);
LABEL_6:
    char v11 = 0;
LABEL_14:
    BOOL v13 = [(WKContentView *)self _hasFocusedElement];
    uint64_t v14 = _Block_copy(a5);
    CFRetain(self);
    uint64_t v15 = (void *)WTF::fastMalloc((WTF *)0x18);
    *uint64_t v15 = &unk_1EEA0EF18;
    v15[1] = v14;
    void v15[2] = self;
    int v24 = v15;
    uint64_t v32 = v23;
    uint64_t v16 = *((void *)m_ptr + 32);
    uint64_t v29 = &v32;
    char v30 = v11;
    BOOL v31 = v13;
    WebKit::AuxiliaryProcessProxy::sendWithAsyncReply<Messages::WebPage::UpdateSelectionWithExtentPointAndBoundary,WTF::CompletionHandler<void ()(BOOL)>>(v16, (uint64_t)&v29, (uint64_t *)&v24, *(void *)(*((void *)m_ptr + 4) + 1928), 0, 1);
    goto LABEL_15;
  }
  if (objc_msgSend(-[WKContentView textInteractionLoupeGestureRecognizer](self, "textInteractionLoupeGestureRecognizer"), "_wk_hasRecognizedOrEnded") & 1) != 0|| (objc_msgSend((id)objc_msgSend(self->_mouseInteraction.m_ptr, "mouseTouchGestureRecognizer"), "_wk_hasRecognizedOrEnded"))
  {
    char v12 = 0;
  }
  else
  {
    char v12 = objc_msgSend(-[WKContentView textInteractionTapGestureRecognizer](self, "textInteractionTapGestureRecognizer"), "_wk_hasRecognizedOrEnded") ^ 1;
  }
  CGPoint v18 = self->_page.m_ptr;
  WebCore::IntPoint::IntPoint((WebCore::IntPoint *)&v25, &v28);
  BOOL v19 = [(WKContentView *)self _hasFocusedElement];
  CGPoint v20 = _Block_copy(a5);
  CGPoint v21 = (void *)WTF::fastMalloc((WTF *)0x10);
  *CGPoint v21 = &unk_1EEA0EEF0;
  v21[1] = v20;
  int v24 = v21;
  uint64_t v32 = v25;
  uint64_t v22 = *((void *)v18 + 32);
  uint64_t v29 = &v32;
  char v30 = v19;
  BOOL v31 = v12;
  WebKit::AuxiliaryProcessProxy::sendWithAsyncReply<Messages::WebPage::UpdateSelectionWithExtentPoint,WTF::CompletionHandler<void ()(BOOL)>>(v22, (uint64_t)&v29, (uint64_t *)&v24, *(void *)(*((void *)v18 + 4) + 1928), 0, 1);
LABEL_15:
  uint64_t v17 = (uint64_t)v24;
  int v24 = 0;
  if (v17) {
    (*(void (**)(uint64_t))(*(void *)v17 + 8))(v17);
  }
  _Block_release(0);
}

- (unsigned)_characterInRelationToCaretSelection:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    v10.receiver = self;
    v10.super_class = (Class)WKContentView;
    return [(WKContentView *)&v10 _characterInRelationToCaretSelection:v3];
  }
  if (v3 == -1 && *((unsigned char *)&self->_domPasteRequestCategory + 4)) {
    return *(_DWORD *)&self->_domPasteRequestCategory.var0.__null_state_;
  }
  uint64_t v6 = *((void *)self->_page.m_ptr + 4);
  if (*(unsigned char *)(v6 + 253)) {
    BOOL v7 = *(unsigned char *)(v6 + 249) == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (!v7 || *(unsigned char *)(v6 + 250) != 0 || *(unsigned char *)(v6 + 576) == 0) {
    return 0;
  }
  if (v3 == -2) {
    return *(_DWORD *)(v6 + 336);
  }
  if (v3 != -1)
  {
    if (!v3) {
      return *(_DWORD *)(v6 + 328);
    }
    return 0;
  }
  return *(_DWORD *)(v6 + 332);
}

- (BOOL)_selectionAtDocumentStart
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    id v4 = qword_1EB3586B8;
    if (os_log_type_enabled((os_log_t)qword_1EB3586B8, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      uint64_t v6 = "-[WKContentView(WKInteraction) _selectionAtDocumentStart]";
      _os_log_error_impl(&dword_1985F2000, v4, OS_LOG_TYPE_ERROR, "Received unexpected call to %s", (uint8_t *)&v5, 0xCu);
    }
    __break(0xC471u);
    JUMPOUT(0x199444F20);
  }

  return [(WKContentView *)self selectionAtDocumentStart];
}

- (CGRect)textFirstRect
{
  uint64_t v2 = *((void *)self->_page.m_ptr + 4);
  if (*(unsigned char *)(v2 + 257))
  {
    if (*(unsigned char *)(v2 + 704) && *(_DWORD *)(v2 + 668))
    {
      WebCore::SelectionGeometry::rect(*(WebCore::SelectionGeometry **)(v2 + 656));
      WebCore::IntRect::operator CGRect();
    }
    else
    {
      double x = *MEMORY[0x1E4F1DB28];
      double y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    }
  }
  else
  {
    double x = self->_autocorrectionData.textFirstRect.origin.x;
    double y = self->_autocorrectionData.textFirstRect.origin.y;
    double width = self->_autocorrectionData.textFirstRect.size.width;
    double height = self->_autocorrectionData.textFirstRect.size.height;
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)textLastRect
{
  uint64_t v2 = *((void *)self->_page.m_ptr + 4);
  if (*(unsigned char *)(v2 + 257))
  {
    if (*(unsigned char *)(v2 + 704) && (unsigned int v3 = *(_DWORD *)(v2 + 668)) != 0)
    {
      WebCore::SelectionGeometry::rect((WebCore::SelectionGeometry *)(*(void *)(v2 + 656) + 84 * v3 - 84));
      WebCore::IntRect::operator CGRect();
    }
    else
    {
      double x = *MEMORY[0x1E4F1DB28];
      double y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    }
  }
  else
  {
    double x = self->_autocorrectionData.textLastRect.origin.x;
    double y = self->_autocorrectionData.textLastRect.origin.y;
    double width = self->_autocorrectionData.textLastRect.size.width;
    double height = self->_autocorrectionData.textLastRect.size.height;
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)willInsertFinalDictationResult
{
  id m_ptr = self->_page.m_ptr;
  uint64_t v3 = *((void *)m_ptr + 32);
  char v4 = 0;
  WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::WillInsertFinalDictationResult>(v3, (uint64_t)&v4, *(void *)(*((void *)m_ptr + 4) + 1928), 0);
}

- (void)didInsertFinalDictationResult
{
  id m_ptr = self->_page.m_ptr;
  uint64_t v3 = *((void *)m_ptr + 32);
  char v4 = 0;
  WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::DidInsertFinalDictationResult>(v3, (uint64_t)&v4, *(void *)(*((void *)m_ptr + 4) + 1928), 0);
}

- (void)replaceDictatedText:(id)a3 withText:(id)a4
{
  if (!self->_usingGestureForSelection || !self->_isTapHighlightFading)
  {
    BYTE4(self->_dataListSuggestionsControl.m_weakReference) = 1;
    id m_ptr = self->_page.m_ptr;
    MEMORY[0x19972EAD0](&v11, a3);
    MEMORY[0x19972EAD0](&v10, a4);
    uint64_t v6 = *((void *)m_ptr + 32);
    v12[0] = (uint64_t *)&v11;
    v12[1] = (uint64_t *)&v10;
    WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::ReplaceDictatedText>(v6, v12, *(void *)(*((void *)m_ptr + 4) + 1928), 0);
    id v8 = v10;
    objc_super v10 = 0;
    if (v8)
    {
      if (*(_DWORD *)v8 == 2) {
        WTF::StringImpl::destroy(v8, v7);
      }
      else {
        *(_DWORD *)v8 -= 2;
      }
    }
    uint64_t v9 = v11;
    char v11 = 0;
    if (v9)
    {
      if (*(_DWORD *)v9 == 2) {
        WTF::StringImpl::destroy(v9, v7);
      }
      else {
        *(_DWORD *)v9 -= 2;
      }
    }
  }
}

- (void)applyAutocorrection:(id)a3 toString:(id)a4 isCandidate:(BOOL)a5 withCompletionHandler:(id)a6
{
  BOOL v7 = a5;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    uint64_t v14 = qword_1EB3586B8;
    if (os_log_type_enabled((os_log_t)qword_1EB3586B8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v15 = 136315138;
      *(void *)&v15[4] = "-[WKContentView(WKInteraction) applyAutocorrection:toString:isCandidate:withCompletionHandler:]";
      _os_log_error_impl(&dword_1985F2000, v14, OS_LOG_TYPE_ERROR, "Received unexpected call to %s", v15, 0xCu);
    }
    __break(0xC471u);
    JUMPOUT(0x199445390);
  }
  char v11 = _Block_copy(a6);
  if (self) {
    CFRetain(self);
  }
  char v12 = (void *)WTF::fastMalloc((WTF *)0x18);
  *char v12 = &unk_1EEA0EF40;
  v12[1] = v11;
  float v12[2] = self;
  *(void *)uint64_t v15 = v12;
  [(WKContentView *)self _internalReplaceText:a4 withText:a3 isCandidate:v7 completion:v15];
  uint64_t v13 = *(void *)v15;
  *(void *)uint64_t v15 = 0;
  if (v13) {
    (*(void (**)(uint64_t))(*(void *)v13 + 8))(v13);
  }
  _Block_release(0);
}

- (void)_internalReplaceText:(id)a3 withText:(id)a4 isCandidate:(BOOL)a5 completion:(void *)a6
{
  BOOL v11 = [(WKContentView *)self _disableAutomaticKeyboardUI];
  uint64_t v12 = *(void *)a6;
  if (v11)
  {
    if (v12)
    {
      uint64_t v13 = *(void (**)(void))(*(void *)v12 + 16);
      v13();
    }
  }
  else if (v12)
  {
    id m_ptr = self->_page.m_ptr;
    MEMORY[0x19972EAD0](&v20, a4);
    MEMORY[0x19972EAD0](&v19, a3);
    BOOL v15 = WebKit::WebPageProxy::applyAutocorrection((WebKit::WebPageProxy *)m_ptr, (const WTF::String *)&v20, (const WTF::String *)&v19, a5);
    (*(void (**)(void, BOOL))(**(void **)a6 + 16))(*(void *)a6, v15);
    uint64_t v17 = v19;
    BOOL v19 = 0;
    if (v17)
    {
      if (*(_DWORD *)v17 == 2) {
        WTF::StringImpl::destroy(v17, v16);
      }
      else {
        *(_DWORD *)v17 -= 2;
      }
    }
    CGPoint v18 = v20;
    CGPoint v20 = 0;
    if (v18)
    {
      if (*(_DWORD *)v18 == 2) {
        WTF::StringImpl::destroy(v18, v16);
      }
      else {
        *(_DWORD *)v18 -= 2;
      }
    }
  }
}

- (void)applyAutocorrection:(id)a3 toString:(id)a4 withCompletionHandler:(id)a5
{
}

- (void)_cancelPendingAutocorrectionContextHandler
{
  unint64_t activeTextInteractionCount = self->_activeTextInteractionCount;
  unint64_t v2 = activeTextInteractionCount;
  self->_unint64_t activeTextInteractionCount = 0;
  if (v2)
  {
    WTF::CompletionHandler<void ()(WebKit::RequestAutocorrectionContextResult)>::operator()((uint64_t *)&activeTextInteractionCount);
    if (activeTextInteractionCount)
    {
      uint64_t v3 = *(void (**)(void))(*(void *)activeTextInteractionCount + 8);
      v3();
    }
  }
}

- (void)requestAutocorrectionContextWithCompletionHandler:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    id v8 = qword_1EB3586B8;
    if (os_log_type_enabled((os_log_t)qword_1EB3586B8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[WKContentView(WKInteraction) requestAutocorrectionContextWithCompletionHandler:]";
      _os_log_error_impl(&dword_1985F2000, v8, OS_LOG_TYPE_ERROR, "Received unexpected call to %s", buf, 0xCu);
    }
    __break(0xC471u);
    JUMPOUT(0x1994458D0);
  }
  if (a3)
  {
    int v5 = _Block_copy(a3);
    if (self) {
      CFRetain(self);
    }
    uint64_t v6 = (void *)WTF::fastMalloc((WTF *)0x18);
    *uint64_t v6 = &unk_1EEA0EF68;
    v6[1] = v5;
    _DWORD v6[2] = self;
    *(void *)buf = v6;
    [(WKContentView *)self _internalRequestAutocorrectionContextWithCompletionHandler:buf];
    uint64_t v7 = *(void *)buf;
    *(void *)buf = 0;
    if (v7) {
      (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
    }
    _Block_release(0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"Expected a nonnull completion handler in %s.", "-[WKContentView(WKInteraction) requestAutocorrectionContextWithCompletionHandler:]");
  }
}

- (void)_internalRequestAutocorrectionContextWithCompletionHandler:(void *)a3
{
  uint64_t v5 = *((void *)self->_page.m_ptr + 4);
  int v6 = *(unsigned __int8 *)(v5 + 576);
  int v7 = *(unsigned __int8 *)(v5 + 380);
  if (v6) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  char v9 = !v8;
  if ([MEMORY[0x1E4F42B08] usesInputSystemUI] && (v9 & 1) == 0) {
    goto LABEL_11;
  }
  if ([(WKContentView *)self _disableAutomaticKeyboardUI]) {
    goto LABEL_11;
  }
  id m_ptr = self->_page.m_ptr;
  if (*((unsigned char *)m_ptr + 801) || !*((unsigned char *)m_ptr + 800)) {
    goto LABEL_11;
  }
  if ((WebKit::WebPageProxy::shouldAvoidSynchronouslyWaitingToPreventDeadlock((WebKit::WebPageProxy *)m_ptr) & 1) != 0
    || *(void *)&self->_hasSetUpInteractions
    || self->_selectionNeedsUpdate
    || !BYTE4(self->_dataListSuggestionsControl.m_weakReference))
  {
    BOOL v11 = (uint64_t *)a3;
    goto LABEL_12;
  }
  if (self->_activeTextInteractionCount)
  {
LABEL_11:
    BOOL v11 = (uint64_t *)a3;
LABEL_12:
    WTF::CompletionHandler<void ()(WebKit::RequestAutocorrectionContextResult)>::operator()(v11);
    return;
  }
  unint64_t v12 = *(void *)a3;
  *(void *)a3 = 0;
  unint64_t activeTextInteractionCount = self->_activeTextInteractionCount;
  self->_unint64_t activeTextInteractionCount = v12;
  if (activeTextInteractionCount) {
    (*(void (**)(unint64_t))(*(void *)activeTextInteractionCount + 8))(activeTextInteractionCount);
  }
  uint64_t v14 = self->_page.m_ptr;
  uint64_t v15 = *((void *)v14 + 32);
  LOBYTE(v26) = 0;
  uint64_t v16 = (WTF::ApproximateTime *)WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::HandleAutocorrectionContextRequest>(v15, (uint64_t)&v26, *(void *)(*((void *)v14 + 4) + 1928), 0);
  uint64_t v17 = self->_page.m_ptr;
  uint64_t v18 = *(void *)(*((void *)v17 + 32) + 144);
  if (!v18)
  {
    __break(0xC471u);
    goto LABEL_44;
  }
  uint64_t v19 = *(void *)(*((void *)v17 + 4) + 1928);
  WTF::ApproximateTime::now(v16);
  IPC::Connection::waitForMessage((atomic_uchar *volatile **)v18, 0x7BBu, v19, 2, (uint64_t)&v26, v20 + 1.0);
  int v21 = v27;
  if (!v27)
  {
    unsigned __int8 v23 = atomic_load((unsigned __int8 *)(v18 + 33));
    int v21 = v27;
    if (v23)
    {
      (*(void (**)(void, uint64_t, unint64_t))(**(void **)(v18 + 8) + 16))(*(void *)(v18 + 8), v18, v26);
      int v22 = 0;
      int v21 = v27;
    }
    else
    {
      int v22 = 1;
    }
    if (v21 == -1) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
  if (v27 != 1)
  {
    std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
LABEL_44:
    JUMPOUT(0x199445C30);
  }
  int v22 = v26;
LABEL_32:
  ((void (*)(char *, unint64_t *))off_1EEA0EA20[v21])(&v28, &v26);
LABEL_33:
  if (v22)
  {
    int v24 = qword_1EB358690;
    if (os_log_type_enabled((os_log_t)qword_1EB358690, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_1985F2000, v24, OS_LOG_TYPE_DEFAULT, "Timed out while waiting for autocorrection context.", (uint8_t *)&v26, 2u);
    }
  }
  if (BYTE4(self->_dataListSuggestionsControl.m_weakReference))
  {
    [(WKContentView *)self _cancelPendingAutocorrectionContextHandler];
  }
  else
  {
    unint64_t v25 = self->_activeTextInteractionCount;
    self->_unint64_t activeTextInteractionCount = 0;
    unint64_t v26 = v25;
    if (v25)
    {
      WTF::CompletionHandler<void ()(WebKit::RequestAutocorrectionContextResult)>::operator()((uint64_t *)&v26);
      if (v26) {
        (*(void (**)(unint64_t))(*(void *)v26 + 8))(v26);
      }
    }
  }
}

- (void)_handleAutocorrectionContext:(const void *)a3
{
  p_lastAutocorrectionContext = &self->_lastAutocorrectionContext;
  WTF::String::operator=((uint64_t *)&self->_lastAutocorrectionContext, (WTF::StringImpl **)a3);
  WTF::String::operator=((uint64_t *)&p_lastAutocorrectionContext->markedText, (WTF::StringImpl **)a3 + 1);
  WTF::String::operator=((uint64_t *)&p_lastAutocorrectionContext->selectedText, (WTF::StringImpl **)a3 + 2);
  WTF::String::operator=((uint64_t *)&p_lastAutocorrectionContext->contextAfter, (WTF::StringImpl **)a3 + 3);
  p_lastAutocorrectionContext->selectedRangeInMarkedText = (EditingRange)*((_OWORD *)a3 + 2);
  BYTE4(self->_dataListSuggestionsControl.m_weakReference) = 0;

  [(WKContentView *)self unsuppressSoftwareKeyboardUsingLastAutocorrectionContextIfNeeded];
}

- (void)updateSoftwareKeyboardSuppressionStateFromWebView
{
  if ([objc_loadWeak(&self->_webView.m_weakReference) _suppressSoftwareKeyboard])
  {
    self->_BOOL hasTapHighlightForPotentialTap = 0;
    [(WKContentView *)self _setSuppressSoftwareKeyboard:1];
  }
  else if ([(WKContentView *)self _suppressSoftwareKeyboard])
  {
    BOOL hasTapHighlightForPotentialTap = self->_hasTapHighlightForPotentialTap;
    self->_BOOL hasTapHighlightForPotentialTap = 1;
    if (!hasTapHighlightForPotentialTap)
    {
      id m_ptr = self->_page.m_ptr;
      uint64_t v5 = *((void *)m_ptr + 32);
      char v6 = 0;
      WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::HandleAutocorrectionContextRequest>(v5, (uint64_t)&v6, *(void *)(*((void *)m_ptr + 4) + 1928), 0);
    }
  }
}

- (void)unsuppressSoftwareKeyboardUsingLastAutocorrectionContextIfNeeded
{
  BOOL hasTapHighlightForPotentialTap = self->_hasTapHighlightForPotentialTap;
  self->_BOOL hasTapHighlightForPotentialTap = 0;
  if (hasTapHighlightForPotentialTap)
  {
    BOOL selectionNeedsUpdate = self->_selectionNeedsUpdate;
    self->_BOOL selectionNeedsUpdate = 1;
    [(WKContentView *)self _setSuppressSoftwareKeyboard:0];
    self->_BOOL selectionNeedsUpdate = selectionNeedsUpdate;
  }
}

- (void)runModalJavaScriptDialog:(void *)a3
{
  if (self->_potentialTapInProgress)
  {
    int64_t v3 = *(void *)a3;
    *(void *)a3 = 0;
    int64_t suppressNonEditableSingleTapTextInteractionCount = self->_suppressNonEditableSingleTapTextInteractionCount;
    self->_int64_t suppressNonEditableSingleTapTextInteractionCount = v3;
    if (suppressNonEditableSingleTapTextInteractionCount) {
      (*(void (**)(int64_t))(*(void *)suppressNonEditableSingleTapTextInteractionCount + 8))(suppressNonEditableSingleTapTextInteractionCount);
    }
  }
  else
  {
    WTF::CompletionHandler<void ()(void)>::operator()((uint64_t *)a3);
  }
}

- (void)_didStartProvisionalLoadForMainFrame
{
  objc_msgSend(self->_doubleTapGestureRecognizerForDoubleClick.m_ptr, "_wk_cancel");
  [(WKContentView *)self _setDoubleTapGesturesEnabled:0];
  objc_msgSend(self->_twoFingerDoubleTapGestureRecognizer.m_ptr, "_wk_cancel");

  [(WKContentView *)self _cancelImageAnalysis];
}

- (void)_didCommitLoadForMainFrame
{
  [self->_positionInformationCallbackDepth stopScrollingImmediately];
  HIBYTE(self->_revealFocusedElementDeferrer.m_ptr) = 0;
  [(WKContentView *)self _elementDidBlur];
  [(WKContentView *)self _cancelLongPressGestureRecognizer];
  [(WKContentView *)self _removeContainerForContextMenuHintPreviews];
  [(WKContentView *)self _removeContainerForDragPreviews];
  [(WKContentView *)self _removeContainerForDropPreviews];
  [objc_loadWeak(&self->_webView.m_weakReference) _didCommitLoadForMainFrame];
  BYTE1(self->_dataListSuggestionsControl.m_weakReference) = 0;
  *(void *)&self->_isUpdatingAccessoryView = 0;
  BYTE2(self->_dataListSuggestionsControl.m_weakReference) = 0;
  [(WKContentView *)self _invalidateCurrentPositionInformation];

  [(WKContentView *)self uninstallImageAnalysisInteraction];
}

- (void)_nextAccessoryTabForWebView:(id)a3
{
}

- (void)_previousAccessoryTabForWebView:(id)a3
{
}

- (void)_becomeFirstResponderWithSelectionMovingForward:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id m_ptr = self->_page.m_ptr;
  v13[0] = 0;
  char v14 = 0;
  CFRetain(self);
  BOOL v8 = _Block_copy(a4);
  char v9 = (void *)WTF::fastMalloc((WTF *)0x18);
  void *v9 = &unk_1EEA0EF90;
  v9[1] = self;
  v9[2] = v8;
  unint64_t v12 = v9;
  WebKit::WebPageProxy::setInitialFocus((uint64_t)m_ptr, a3, 0, (uint64_t)v13, (uint64_t *)&v12);
  uint64_t v10 = (uint64_t)v12;
  unint64_t v12 = 0;
  if (v10) {
    (*(void (**)(uint64_t))(*(void *)v10 + 8))(v10);
  }
  _Block_release(0);
  if (v14) {
    WebKit::WebKeyboardEvent::~WebKeyboardEvent((WebKit::WebKeyboardEvent *)v13, v11);
  }
}

- (Color)_tapHighlightColorForFastClick:(BOOL)a3
{
  if (a3) {
    unsigned int v4 = 2130764032;
  }
  else {
    unsigned int v4 = 2130706657;
  }
  *int64_t v3 = bswap32(v4) | 0x1104000000000000;
  return (Color)self;
}

- (void)accessoryDone
{
}

- (void)accessoryViewDone:(id)a3
{
  if ([objc_loadWeak(&self->_webView.m_weakReference) _resetFocusPreservationCount])
  {
    unsigned int v4 = qword_1EB358730;
    if (os_log_type_enabled((os_log_t)qword_1EB358730, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v7 = 0;
      _os_log_error_impl(&dword_1985F2000, v4, OS_LOG_TYPE_ERROR, "Keyboard dismissed with nonzero focus preservation count; check for unbalanced calls to -_incrementFocusPreservationCount",
        v7,
        2u);
    }
  }
  [(WKContentView *)self stopRelinquishingFirstResponderToFocusedElement];
  [(WKContentView *)self endEditingAndUpdateFocusAppearanceWithReason:0];
  id m_ptr = self->_page.m_ptr;
  uint64_t v6 = *((void *)m_ptr + 32);
  char v8 = 0;
  WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::SetIsShowingInputViewForFocusedElement>(v6, &v8, *(void *)(*((void *)m_ptr + 4) + 1928), 0);
}

- (void)updateFocusedElementValue:(id)a3
{
  id m_ptr = self->_page.m_ptr;
  p_focusedElementInformation = &self->_focusedElementInformation;
  p_elementContext = &self->_focusedElementInformation.elementContext;
  MEMORY[0x19972EAD0](&v15, a3);
  uint64_t v7 = *((void *)m_ptr + 32);
  v16[0] = (WTF::StringImpl *)p_elementContext;
  v16[1] = (WTF::StringImpl *)&v15;
  WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::SetFocusedElementValue>(v7, (uint64_t)v16, *(void *)(*((void *)m_ptr + 4) + 1928), 0);
  char v9 = v15;
  uint64_t v15 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2) {
      WTF::StringImpl::destroy(v9, v8);
    }
    else {
      *(_DWORD *)v9 -= 2;
    }
  }
  MEMORY[0x19972EAD0](v16, a3);
  BOOL v11 = v16[0];
  v16[0] = 0;
  uint64_t m_size = (WTF::StringImpl *)p_focusedElementInformation[3].interactionRect.m_size;
  p_focusedElementInformation[3].interactionRect.uint64_t m_size = (IntSize)v11;
  if (m_size)
  {
    int v13 = *(_DWORD *)m_size - 2;
    if (*(_DWORD *)m_size == 2)
    {
      WTF::StringImpl::destroy(m_size, v10);
      uint64_t m_size = v16[0];
      v16[0] = 0;
      if (!m_size) {
        return;
      }
      int v13 = *(_DWORD *)m_size - 2;
      if (*(_DWORD *)m_size == 2)
      {
        WTF::StringImpl::destroy(m_size, v14);
        return;
      }
    }
    *(_DWORD *)uint64_t m_size = v13;
  }
}

- (void)updateFocusedElementValueAsColor:(id)a3
{
  unsigned int v4 = (WebCore *)[a3 CGColor];
  uint64_t v6 = WebCore::roundAndClampToSRGBALossy(v4, v5);
  uint64_t v8 = bswap32(v6) | 0x1104000000000000;
  if (!BYTE4(v6)) {
    uint64_t v8 = 0;
  }
  uint64_t v16 = v8;
  WebCore::serializationForHTML((uint64_t *)&v15, (WebCore *)&v16, v7);
  id m_ptr = self->_page.m_ptr;
  p_focusedElementInformation = &self->_focusedElementInformation;
  uint64_t v11 = *((void *)m_ptr + 32);
  v17[0] = &p_focusedElementInformation->elementContext;
  v17[1] = &v15;
  WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::SetFocusedElementValue>(v11, (uint64_t)v17, *(void *)(*((void *)m_ptr + 4) + 1928), 0);
  WTF::String::operator=((uint64_t *)&p_focusedElementInformation[3].interactionRect.m_size, &v15);
  WebCore::Color::operator=();
  int v13 = v15;
  uint64_t v15 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2) {
      WTF::StringImpl::destroy(v13, v12);
    }
    else {
      *(_DWORD *)v13 -= 2;
    }
  }
  if ((v16 & 0x8000000000000) != 0)
  {
    char v14 = (unsigned int *)(v16 & 0xFFFFFFFFFFFFLL);
    if (atomic_fetch_add((atomic_uint *volatile)(v16 & 0xFFFFFFFFFFFFLL), 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, v14);
      WTF::fastFree((WTF *)v14, v12);
    }
  }
}

- (void)updateFocusedElementSelectedIndex:(unsigned int)a3 allowsMultipleSelection:(BOOL)a4
{
  id m_ptr = self->_page.m_ptr;
  p_elementContext = &self->_focusedElementInformation.elementContext;
  uint64_t v6 = *((void *)m_ptr + 32);
  uint64_t v7 = p_elementContext;
  unsigned int v8 = a3;
  BOOL v9 = a4;
  WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::SetFocusedElementSelectedIndex>(v6, (uint64_t)&v7, *(void *)(*((void *)m_ptr + 4) + 1928), 0);
}

- (void)updateFocusedElementFocusedWithDataListDropdown:(BOOL)a3
{
  self->_anon_938[257] = a3;
  [(WKContentView *)self reloadInputViews];
}

- (void)accessoryTab:(BOOL)a3
{
}

- (void)accessoryView:(id)a3 tabInDirection:(BOOL)a4
{
  [(WKContentView *)self _endEditing];
  id m_ptr = self->_inputPeripheral.m_ptr;
  self->_inputPeripheral.id m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  BYTE5(self->_dataListTextSuggestions.m_ptr) = 1;
  [(WKContentView *)self _internalBeginSelectionChange];
  uint64_t v7 = self->_page.m_ptr;
  CFRetain(self);
  unsigned int v8 = (void *)WTF::fastMalloc((WTF *)0x10);
  *unsigned int v8 = &unk_1EEA0EFB8;
  v8[1] = self;
  uint64_t v10 = v8;
  WebKit::WebPageProxy::focusNextFocusedElement((uint64_t)v7, !a4, (uint64_t *)&v10);
  uint64_t v9 = (uint64_t)v10;
  uint64_t v10 = 0;
  if (v9) {
    (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
  }
}

- (void)accessoryViewAutoFill:(id)a3
{
  unsigned int v4 = (void *)[objc_loadWeak(&self->_webView.m_weakReference) _inputDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [(WKContentView *)self webView];
    id m_ptr = self->_formInputSession.m_ptr;
    [v4 _webView:v5 accessoryViewCustomButtonTappedInFormInputSession:m_ptr];
  }
}

- (WKFormAccessoryView)formAccessoryView
{
  if (PAL::currentUserInterfaceIdiomIsVision((PAL *)self)) {
    return 0;
  }
  CGRect result = (WKFormAccessoryView *)self->_formAccessoryView.m_ptr;
  if (!result)
  {
    CGRect result = [[WKFormAccessoryView alloc] initWithInputAssistantItem:[(WKContentView *)self inputAssistantItem] delegate:self];
    id m_ptr = self->_formAccessoryView.m_ptr;
    self->_formAccessoryView.id m_ptr = result;
    if (m_ptr)
    {
      CFRelease(m_ptr);
      return (WKFormAccessoryView *)self->_formAccessoryView.m_ptr;
    }
  }
  return result;
}

- (void)accessoryOpen
{
  if (self->_inputPeripheral.m_ptr)
  {
    [(WKContentView *)self _zoomToRevealFocusedElement];
    [(WKContentView *)self _updateAccessory];
    id m_ptr = self->_inputPeripheral.m_ptr;
    [m_ptr beginEditing];
  }
}

- (void)_updateAccessory
{
  if (!self->_showDebugTapHighlightsForFastClicking)
  {
    self->_showDebugTapHighlightsForFastClicking = 1;
    int64_t v3 = [(WKContentView *)self formAccessoryView];
    if (objc_opt_respondsToSelector()) {
      -[WKFormAccessoryView setNextPreviousItemsVisible:](v3, "setNextPreviousItemsVisible:", objc_msgSend(-[WKContentView webView](self, "webView"), "_isEditable") ^ 1);
    }
    [(WKFormAccessoryView *)v3 setNextEnabled:self->_anon_938[64]];
    [(WKFormAccessoryView *)v3 setPreviousEnabled:self->_anon_938[84]];
    self->_showDebugTapHighlightsForFastClicking = 0;
  }
}

- (BOOL)_allowAnimatedUpdateSelectionRectViews
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    int64_t v3 = qword_1EB3586B8;
    if (os_log_type_enabled((os_log_t)qword_1EB3586B8, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315138;
      id v5 = "-[WKContentView(WKInteraction) _allowAnimatedUpdateSelectionRectViews]";
      _os_log_error_impl(&dword_1985F2000, v3, OS_LOG_TYPE_ERROR, "Received unexpected call to %s", (uint8_t *)&v4, 0xCu);
    }
    __break(0xC471u);
    JUMPOUT(0x199446978);
  }
  return 0;
}

- (void)beginSelectionChange
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    int64_t v3 = qword_1EB3586B8;
    if (os_log_type_enabled((os_log_t)qword_1EB3586B8, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315138;
      id v5 = "-[WKContentView(WKInteraction) beginSelectionChange]";
      _os_log_error_impl(&dword_1985F2000, v3, OS_LOG_TYPE_ERROR, "Received unexpected call to %s", (uint8_t *)&v4, 0xCu);
    }
    __break(0xC471u);
    JUMPOUT(0x199446A5CLL);
  }

  [(WKContentView *)self _internalBeginSelectionChange];
}

- (void)_internalBeginSelectionChange
{
  [(WKContentView *)self _updateInternalStateBeforeSelectionChange];
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    id Weak = objc_loadWeak((id *)&self->_anon_fb8[24]);
    id v4 = [(WKContentView *)self asBETextInput];
    [Weak selectionWillChangeForTextInput:v4];
  }
  else
  {
    id v5 = [(WKContentView *)self inputDelegate];
    [(UITextInputDelegate *)v5 selectionWillChange:self];
  }
}

- (void)_updateInternalStateBeforeSelectionChange
{
  BYTE4(self->_dataListSuggestionsControl.m_weakReference) = 1;
  ++LODWORD(self->_pendingAutocorrectionContextHandler.m_function.m_callableWrapper.__ptr_.__value_);
}

- (void)endSelectionChange
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    int64_t v3 = qword_1EB3586B8;
    if (os_log_type_enabled((os_log_t)qword_1EB3586B8, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315138;
      id v5 = "-[WKContentView(WKInteraction) endSelectionChange]";
      _os_log_error_impl(&dword_1985F2000, v3, OS_LOG_TYPE_ERROR, "Received unexpected call to %s", (uint8_t *)&v4, 0xCu);
    }
    __break(0xC471u);
    JUMPOUT(0x199446BF4);
  }

  [(WKContentView *)self _internalEndSelectionChange];
}

- (void)_internalEndSelectionChange
{
  if ([(WKContentView *)self shouldUseAsyncInteractions]) {
    objc_msgSend(objc_loadWeak((id *)&self->_anon_fb8[24]), "selectionDidChangeForTextInput:", -[WKContentView asBETextInput](self, "asBETextInput"));
  }
  else {
    [(UITextInputDelegate *)[(WKContentView *)self inputDelegate] selectionDidChange:self];
  }

  [(WKContentView *)self _updateInternalStateAfterSelectionChange];
}

- (void)_updateInternalStateAfterSelectionChange
{
  int value = (int)self->_pendingAutocorrectionContextHandler.m_function.m_callableWrapper.__ptr_.__value_;
  if (value) {
    LODWORD(self->_pendingAutocorrectionContextHandler.m_function.m_callableWrapper.__ptr_.__value_) = value - 1;
  }
}

- (void)willFinishIgnoringCalloutBarFadeAfterPerformingAction
{
  ++*(void *)&self->_isUnsuppressingSoftwareKeyboardUsingLastAutocorrectionContext;
  WebKit::WebPageProxy::scheduleFullEditorStateUpdate((uint64_t)self->_page.m_ptr);
  id m_ptr = self->_page.m_ptr;
  id v5 = 0;
  objc_initWeak(&v5, self);
  uint64_t v4 = WTF::fastMalloc((WTF *)0x10);
  *(void *)uint64_t v4 = &unk_1EEA0EFE0;
  *(void *)(v4 + 8) = 0;
  objc_moveWeak((id *)(v4 + 8), &v5);
  uint64_t v6 = v4;
  WebKit::WebPageProxy::callAfterNextPresentationUpdate((uint64_t)m_ptr, &v6);
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  objc_destroyWeak(&v5);
}

- (void)_didChangeWebViewEditability
{
  int v3 = objc_msgSend(-[WKContentView webView](self, "webView"), "_isEditable");
  if (objc_opt_respondsToSelector()) {
    [self->_formAccessoryView.m_ptr setNextPreviousItemsVisible:v3 ^ 1u];
  }
  [self->_twoFingerSingleTapGestureRecognizer.m_ptr setEnabled:v3 ^ 1u];
  if (v3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__WKContentView_WKInteraction___didChangeWebViewEditability__block_invoke;
    block[3] = &unk_1E5812158;
    block[4] = self;
    if (-[WKContentView(WKInteraction) _didChangeWebViewEditability]::onceToken != -1) {
      dispatch_once(&-[WKContentView(WKInteraction) _didChangeWebViewEditability]::onceToken, block);
    }
  }
}

BOOL __60__WKContentView_WKInteraction___didChangeWebViewEditability__block_invoke()
{
  v0 = (objc_class *)objc_opt_class();

  return class_addProtocol(v0, (Protocol *)&unk_1EEADC860);
}

- (void)insertTextSuggestion:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  BYTE4(self->_dataListSuggestionsControl.m_weakReference) = 1;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (a3 && (isKindOfClass & 1) != 0)
  {
    CFRetain(a3);
    id m_ptr = self->_page.m_ptr;
    MEMORY[0x19972EAD0](&v37, [a3 username]);
    MEMORY[0x19972EAD0](&v36, [a3 password]);
    uint64_t v7 = *((void *)m_ptr + 32);
    p_elementContext = (uint64_t *)&v37;
    uint64_t v39 = &v36;
    WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::AutofillLoginCredentials>(v7, &p_elementContext, *(void *)(*((void *)m_ptr + 4) + 1928), 0);
    uint64_t v9 = v36;
    long long v36 = 0;
    if (v9)
    {
      if (*(_DWORD *)v9 == 2) {
        WTF::StringImpl::destroy(v9, v8);
      }
      else {
        *(_DWORD *)v9 -= 2;
      }
    }
    int v24 = v37;
    long long v37 = 0;
    if (v24)
    {
      if (*(_DWORD *)v24 == 2) {
        WTF::StringImpl::destroy(v24, v8);
      }
      else {
        *(_DWORD *)v24 -= 2;
      }
    }
    goto LABEL_54;
  }
  objc_opt_class();
  char v10 = objc_opt_isKindOfClass();
  if (a3 && (v10 & 1) != 0)
  {
    CFRetain(a3);
    uint64_t v11 = (void *)[a3 contents];
    unint64_t v12 = v11;
    if (v11) {
      CFRetain(v11);
    }
    int v13 = self->_page.m_ptr;
    MEMORY[0x19972EAD0](&v37, [v12 objectForKey:*MEMORY[0x1E4F43E18]]);
    MEMORY[0x19972EAD0](&v36, [v12 objectForKey:*MEMORY[0x1E4F43DD8]]);
    uint64_t v14 = *((void *)v13 + 32);
    p_elementContext = (uint64_t *)&v37;
    uint64_t v39 = &v36;
    WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::AutofillLoginCredentials>(v14, &p_elementContext, *(void *)(*((void *)v13 + 4) + 1928), 0);
    uint64_t v16 = v36;
    long long v36 = 0;
    if (v16)
    {
      if (*(_DWORD *)v16 == 2) {
        WTF::StringImpl::destroy(v16, v15);
      }
      else {
        *(_DWORD *)v16 -= 2;
      }
    }
    unint64_t v25 = v37;
    long long v37 = 0;
    if (v25)
    {
      if (*(_DWORD *)v25 == 2)
      {
        WTF::StringImpl::destroy(v25, v15);
        if (!v12)
        {
LABEL_54:
          CFRelease(a3);
          return;
        }
LABEL_38:
        CFRelease(v12);
        goto LABEL_54;
      }
      *(_DWORD *)v25 -= 2;
    }
    if (!v12) {
      goto LABEL_54;
    }
    goto LABEL_38;
  }
  if (![self->_keyboardScrollingAnimator.m_ptr count]
    || objc_msgSend((id)objc_msgSend(self->_formInputSession.m_ptr, "suggestions"), "count"))
  {
    goto LABEL_57;
  }
  uint64_t v17 = (void *)[a3 inputText];
  uint64_t v18 = v17;
  if (v17) {
    CFRetain(v17);
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v19 = self->_keyboardScrollingAnimator.m_ptr;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v33;
    while (2)
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v33 != v21) {
          objc_enumerationMutation(v19);
        }
        if (objc_msgSend(v18, "isEqualToString:", objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * i), "inputText")))
        {
          unint64_t v26 = self->_page.m_ptr;
          MEMORY[0x19972EAD0](&v37, v18);
          uint64_t v27 = *((void *)v26 + 32);
          p_elementContext = (uint64_t *)&self->_focusedElementInformation.elementContext;
          uint64_t v39 = &v37;
          WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::SetFocusedElementValue>(v27, (uint64_t)&p_elementContext, *(void *)(*((void *)v26 + 4) + 1928), 0);
          uint64_t v29 = v37;
          long long v37 = 0;
          if (v29)
          {
            if (*(_DWORD *)v29 == 2) {
              WTF::StringImpl::destroy(v29, v28);
            }
            else {
              *(_DWORD *)v29 -= 2;
            }
          }
          char v23 = 0;
          goto LABEL_44;
        }
      }
      uint64_t v20 = [v19 countByEnumeratingWithState:&v32 objects:v40 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }
  char v23 = 1;
LABEL_44:
  if (v18) {
    CFRelease(v18);
  }
  if (v23)
  {
LABEL_57:
    char v30 = (void *)[objc_loadWeak(&self->_webView.m_weakReference) _inputDelegate];
    if (objc_opt_respondsToSelector())
    {
      objc_opt_class();
      if (((a3 != 0) & objc_opt_isKindOfClass()) == 1)
      {
        a3 = (id)[a3 _uikitTextSuggestion];
        if (!a3)
        {
LABEL_50:
          id v31 = 0;
          goto LABEL_53;
        }
      }
      else if (!a3)
      {
        goto LABEL_50;
      }
      CFRetain(a3);
      id v31 = a3;
LABEL_53:
      objc_msgSend(v30, "_webView:insertTextSuggestion:inInputSession:", -[WKContentView webView](self, "webView"), v31, self->_formInputSession.m_ptr);
      a3 = v31;
      if (!v31) {
        return;
      }
      goto LABEL_54;
    }
  }
}

- (id)textInRange:(id)a3
{
  id m_ptr = self->_page.m_ptr;
  if (!m_ptr) {
    return 0;
  }
  uint64_t v4 = *((void *)m_ptr + 4);
  if (!*(unsigned char *)(v4 + 576)) {
    return 0;
  }
  if ([(WKContentView *)self selectedTextRange] != a3 || !*(unsigned char *)(v4 + 250))
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    uint64_t v9 = 0;
    if (!a3 || (isKindOfClass & 1) == 0) {
      return v9;
    }
    if (!*(unsigned char *)(v4 + 576)) {
      goto LABEL_48;
    }
    uint64_t v10 = *(void *)&self->_domPasteRequestCategory.var0.__null_state_;
    uint64_t v11 = (void *)[a3 start];
    uint64_t v12 = [a3 end];
    uint64_t v9 = 0;
    if (!v11) {
      return v9;
    }
    int v13 = (void *)v12;
    if (!v12) {
      return v9;
    }
    if ([v11 isRelativeToStart] && objc_msgSend(v13, "isRelativeToStart"))
    {
      uint64_t v14 = [v11 offset];
      uint64_t v15 = [v13 offset];
      uint64_t v9 = 0;
      if (v14 >= -2)
      {
        uint64_t v16 = v15;
        if (v15 <= 1 && v15 > v14)
        {
          int v22 = 0;
          char v23 = 0;
          int v24 = 0;
          char v25 = 1;
          WTF::StringBuilder::reserveCapacity((WTF::StringBuilder *)&v22);
          do
          {
            if (v14)
            {
              if (v14 == -1)
              {
                unsigned int v17 = *(_DWORD *)(v4 + 332);
                if ((v10 & 0xFF00000000) != 0) {
                  unsigned int v17 = v10;
                }
                if (v17)
                {
                  unsigned int v26 = v17;
                  WTF::StringBuilder::appendFromAdapters<WTF::StringTypeAdapter<char32_t,void>>((WTF::StringBuilder *)&v22, &v26);
                }
              }
              else if (v14 == -2 && *(_DWORD *)(v4 + 336))
              {
                unsigned int v26 = *(_DWORD *)(v4 + 336);
                WTF::StringBuilder::appendFromAdapters<WTF::StringTypeAdapter<char32_t,void>>((WTF::StringBuilder *)&v22, &v26);
              }
            }
            else if (*(_DWORD *)(v4 + 328))
            {
              unsigned int v26 = *(_DWORD *)(v4 + 328);
              WTF::StringBuilder::appendFromAdapters<WTF::StringTypeAdapter<char32_t,void>>((WTF::StringBuilder *)&v22, &v26);
            }
            ++v14;
          }
          while (v16 != v14);
          uint64_t v18 = v22;
          if (v22
            || (WTF::StringBuilder::shrinkToFit((WTF::StringBuilder *)&v22),
                WTF::StringBuilder::reifyString((WTF::StringBuilder *)&v22),
                (uint64_t v18 = v22) != 0))
          {
            *(_DWORD *)v18 += 2;
            uint64_t v9 = (__CFString *)WTF::StringImpl::operator NSString *();
            if (*(_DWORD *)v18 == 2) {
              WTF::StringImpl::destroy(v18, v19);
            }
            else {
              *(_DWORD *)v18 -= 2;
            }
          }
          else
          {
            uint64_t v9 = &stru_1EEA10550;
          }
          uint64_t v20 = v23;
          char v23 = 0;
          if (v20)
          {
            if (*(_DWORD *)v20 == 2) {
              WTF::StringImpl::destroy(v20, v19);
            }
            else {
              *(_DWORD *)v20 -= 2;
            }
          }
          uint64_t v21 = v22;
          int v22 = 0;
          if (v21)
          {
            if (*(_DWORD *)v21 == 2) {
              WTF::StringImpl::destroy(v21, v19);
            }
            else {
              *(_DWORD *)v21 -= 2;
            }
          }
        }
      }
      return v9;
    }
    return 0;
  }
  if (!*(unsigned char *)(v4 + 576))
  {
LABEL_48:
    __break(1u);
    return &stru_1EEA10550;
  }
  if (!*(void *)(v4 + 320)) {
    return &stru_1EEA10550;
  }

  return (id)WTF::StringImpl::operator NSString *();
}

- (FloatRect)_scaledCaretRectForSelectionStart:(FloatRect)a3
{
  float m_height = a3.m_size.m_height;
  float m_width = a3.m_size.m_width;
  m_double y = a3.m_location.m_y;
  m_double x = a3.m_location.m_x;
  [(WKContentView *)self inverseScale];
  float v8 = v7 * m_height;
  float v9 = v7 * m_width;
  if (m_width < m_height) {
    float v10 = v9;
  }
  else {
    float v10 = m_width;
  }
  if (m_width < m_height) {
    float v11 = m_height;
  }
  else {
    float v11 = v8;
  }
  float v12 = m_x;
  float v13 = m_y;
  result.m_size.float m_height = v11;
  result.m_size.float m_width = v10;
  result.m_location.m_double y = v13;
  result.m_location.m_double x = v12;
  return result;
}

- (FloatRect)_scaledCaretRectForSelectionEnd:(FloatRect)a3
{
  float m_height = a3.m_size.m_height;
  float m_width = a3.m_size.m_width;
  m_double y = a3.m_location.m_y;
  m_double x = a3.m_location.m_x;
  [(WKContentView *)self inverseScale];
  float v8 = v7 * m_height;
  float v9 = v7 * m_width;
  if (m_width < m_height) {
    float v10 = 0.0;
  }
  else {
    float v10 = v8 - m_height;
  }
  if (m_width < m_height) {
    float v11 = m_height;
  }
  else {
    float v11 = v8;
  }
  if (m_width < m_height) {
    float v12 = v9;
  }
  else {
    float v12 = m_width;
  }
  if (m_width < m_height) {
    float v13 = v9 - m_width;
  }
  else {
    float v13 = 0.0;
  }
  float v14 = m_y + v10;
  float v15 = m_x + v13;
  result.m_size.float m_height = v11;
  result.m_size.float m_width = v12;
  result.m_location.m_double y = v14;
  result.m_location.m_double x = v15;
  return result;
}

- (CGRect)caretRectForPosition:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = a3;
  }
  else {
    id v4 = 0;
  }

  [v4 positionRect];
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.double y = v6;
  result.origin.double x = v5;
  return result;
}

- (id)selectionRectsForRange:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = a3;
  }
  else {
    id v4 = 0;
  }

  return (id)[v4 selectionRects];
}

- (void)setSelectedTextRange:(id)a3
{
  if (!a3 && [(WKContentView *)self _hasFocusedElement])
  {
    [(WKContentView *)self _internalClearSelection];
  }
}

- (BOOL)hasMarkedText
{
  return [self->_markedText.m_ptr length] != 0;
}

- (id)markedText
{
  return self->_markedText.m_ptr;
}

- (UITextRange)markedTextRange
{
  uint64_t v2 = *((void *)self->_page.m_ptr + 4);
  if (*(unsigned char *)(v2 + 257)) {
    BOOL v3 = *(unsigned char *)(v2 + 576) == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3 || !*(unsigned char *)(v2 + 704)) {
    return 0;
  }
  long long v5 = *(_OWORD *)(v2 + 688);
  long long v47 = *(_OWORD *)(v2 + 672);
  long long v46 = v5;
  BOOL v6 = 1;
  if ((void)v47 == (void)v5) {
    BOOL v6 = DWORD2(v47) != DWORD2(v46) || HIDWORD(v47) != HIDWORD(v46);
  }
  BOOL v43 = v6;
  int v9 = *(unsigned __int8 *)(v2 + 253);
  WebCore::FloatRect::FloatRect((WebCore::FloatRect *)v45, (const WebCore::IntRect *)&v47);
  LODWORD(v10) = v45[0];
  LODWORD(v11) = v45[1];
  LODWORD(v12) = v45[2];
  LODWORD(v13) = v45[3];
  -[WKContentView _scaledCaretRectForSelectionStart:](self, "_scaledCaretRectForSelectionStart:", v10, v11, v12, v13);
  v45[4] = v14;
  v45[5] = v15;
  v45[6] = v16;
  v45[7] = v17;
  WebCore::FloatRect::FloatRect((WebCore::FloatRect *)v44, (const WebCore::IntRect *)&v46);
  LODWORD(v18) = v44[0];
  LODWORD(v19) = v44[1];
  LODWORD(v20) = v44[2];
  LODWORD(v21) = v44[3];
  -[WKContentView _scaledCaretRectForSelectionEnd:](self, "_scaledCaretRectForSelectionEnd:", v18, v19, v20, v21);
  v44[4] = v22;
  v44[5] = v23;
  v44[6] = v24;
  v44[7] = v25;
  [(WKContentView *)self _contentZoomScale];
  id v27 = textSelectionRects((uint64_t *)(v2 + 656), v26);
  uint64_t v28 = *(void *)(v2 + 312);
  id v42 = v27;
  if (v28) {
    uint64_t v29 = *(unsigned int *)(v28 + 4);
  }
  else {
    uint64_t v29 = 0;
  }
  WebCore::FloatRect::operator CGRect();
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  WebCore::FloatRect::operator CGRect();
  return (UITextRange *)+[WKTextRange textRangeWithState:isRange:isEditable:startRect:endRect:selectionRects:selectedTextLength:](WKTextRange, "textRangeWithState:isRange:isEditable:startRect:endRect:selectionRects:selectedTextLength:", 0, v43, v9 != 0, v42, v29, v31, v33, v35, v37, v38, v39, v40, v41);
}

- (NSDictionary)markedTextStyle
{
  return 0;
}

- (void)setAttributedMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __70__WKContentView_WKInteraction__setAttributedMarkedText_selectedRange___block_invoke;
  v63[3] = &unk_1E5813438;
  v63[4] = a3;
  if (__70__WKContentView_WKInteraction__setAttributedMarkedText_selectedRange___block_invoke((uint64_t)v63))
  {
    id m_ptr = self->_page.m_ptr;
    MEMORY[0x19972EAD0](&v65, [a3 string]);
    v71.NSUInteger location = 0;
    v71.NSUInteger length = 0;
    WebKit::WebPageProxy::setWritingSuggestion((uint64_t)m_ptr, (const WTF::String *)&v65, &v71);
    double v10 = v65;
    uint64_t v65 = 0;
    if (v10)
    {
      if (*(_DWORD *)v10 == 2) {
        WTF::StringImpl::destroy(v10, v9);
      }
      else {
        *(_DWORD *)v10 -= 2;
      }
    }
  }
  else
  {
    uint64_t v61 = 0;
    uint64_t v62 = 0;
    id v59 = 0;
    uint64_t v60 = 0;
    uint64_t v65 = 0;
    uint64_t v66 = &v65;
    uint64_t v67 = 0x2020000000;
    char v68 = 0;
    uint64_t v11 = [a3 length];
    v71.NSUInteger location = MEMORY[0x1E4F143A8];
    v71.NSUInteger length = 3221225472;
    long long v72 = ___ZL32shouldUseHighlightsForMarkedTextP18NSAttributedString_block_invoke;
    uint64_t v73 = &unk_1E5813FD0;
    long long v74 = &v65;
    objc_msgSend(a3, "enumerateAttributesInRange:options:usingBlock:", 0, v11, 0, &v71);
    int v12 = *((unsigned __int8 *)v66 + 24);
    _Block_object_dispose(&v65, 8);
    if (v12)
    {
      if ([a3 length])
      {
        uint64_t v65 = 0;
        uint64_t v66 = 0;
        uint64_t v14 = [a3 length];
        v71.NSUInteger location = MEMORY[0x1E4F143A8];
        v71.NSUInteger length = 3321888768;
        long long v72 = ___ZL21compositionHighlightsP18NSAttributedString_block_invoke;
        uint64_t v73 = &__block_descriptor_40_e8_32c56_ZTSKZL21compositionHighlightsP18NSAttributedStringE3__1_e41_v40__0__NSDictionary_8__NSRange_QQ_16_B32l;
        long long v74 = &v65;
        objc_msgSend(a3, "enumerateAttributesInRange:options:usingBlock:", 0, v14, 0, &v71);
        unint64_t v15 = 126 - 2 * __clz(HIDWORD(v66));
        if (HIDWORD(v66)) {
          uint64_t v16 = v15;
        }
        else {
          uint64_t v16 = 0;
        }
        std::__introsort<std::_ClassicAlgPolicy,compositionHighlights(NSAttributedString *)::$_0 &,WebCore::CompositionHighlight *,false>((unsigned int *)v65, (_DWORD *)v65 + 10 * HIDWORD(v66), v16, 1);
        NSUInteger v56 = length;
        int v69 = 0;
        uint64_t v70 = 0;
        if (HIDWORD(v66))
        {
          if (HIDWORD(v66) >= 0x6666667)
          {
            __break(0xC471u);
            return;
          }
          unsigned int v18 = 40 * HIDWORD(v66);
          double v19 = (unsigned int *)WTF::fastMalloc((WTF *)(40 * HIDWORD(v66)));
          LODWORD(v70) = v18 / 0x28;
          int v69 = (WTF *)v19;
          if (HIDWORD(v66))
          {
            double v20 = v65;
            unsigned int v21 = HIDWORD(v70);
            uint64_t v22 = 40 * HIDWORD(v66);
            do
            {
              if (!v21
                || (uint64_t v23 = v21 - 1,
                    int v24 = v69,
                    std::operator!=[abi:sn180100]<WebCore::Color,WebCore::Color>(*((void *)v69 + 5 * v23 + 1), *((unsigned char *)v69 + 40 * v23 + 16), *((void *)v20 + 1), *((unsigned char *)v20 + 16)))|| std::operator!=[abi:sn180100]<WebCore::Color,WebCore::Color>(*((void *)v24 + 5 * v23 + 3), *((unsigned char *)v24 + 40 * v23 + 32), *((void *)v20 + 3), *((unsigned char *)v20 + 32)))
              {
                unsigned int v25 = v21;
                if (v21 == v70)
                {
                  double v26 = (void *)WTF::Vector<WebCore::CompositionHighlight,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)&v69, v21 + 1, (unint64_t)v20);
                  unsigned int v27 = HIDWORD(v70);
                  uint64_t v28 = v69;
                  uint64_t v29 = (unsigned int *)((char *)v69 + 40 * HIDWORD(v70));
                  *(void *)uint64_t v29 = *v26;
                  std::__optional_copy_base<WebCore::Color,false>::__optional_copy_base[abi:sn180100]((WebCore::Color *)(v29 + 2), (uint64_t)(v26 + 1));
                  std::__optional_copy_base<WebCore::Color,false>::__optional_copy_base[abi:sn180100]((WTF *)((char *)v28 + 40 * v27 + 24), (uint64_t)(v26 + 3));
                }
                else
                {
                  double v30 = v69;
                  double v31 = (unsigned int *)((char *)v69 + 40 * v21);
                  *(void *)double v31 = *(void *)v20;
                  std::__optional_copy_base<WebCore::Color,false>::__optional_copy_base[abi:sn180100]((WebCore::Color *)(v31 + 2), (uint64_t)v20 + 8);
                  std::__optional_copy_base<WebCore::Color,false>::__optional_copy_base[abi:sn180100]((WTF *)((char *)v30 + 40 * v25 + 24), (uint64_t)v20 + 24);
                }
                unsigned int v21 = ++HIDWORD(v70);
              }
              else
              {
                *((_DWORD *)v24 + 10 * v23 + 1) = *((_DWORD *)v20 + 1);
              }
              double v20 = (WTF::StringImpl *)((char *)v20 + 40);
              v22 -= 40;
            }
            while (v22);
          }
        }
        WTF::Vector<WebCore::CompositionHighlight,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v65, v17);
        NSUInteger length = v56;
      }
      else
      {
        int v69 = 0;
        uint64_t v70 = 0;
      }
      if (HIDWORD(v60)) {
        WTF::VectorDestructor<true,WebCore::CompositionHighlight>::destruct((uint64_t)v59, (char *)v59 + 40 * HIDWORD(v60));
      }
      long long v48 = v59;
      if (v59)
      {
        id v59 = 0;
        LODWORD(v60) = 0;
        WTF::fastFree(v48, v13);
      }
      id v59 = v69;
      uint64_t v49 = v70;
      int v69 = 0;
      uint64_t v70 = 0;
      uint64_t v60 = v49;
      WTF::Vector<WebCore::CompositionHighlight,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v69, v13);
    }
    else
    {
      if ([a3 length])
      {
        int v69 = 0;
        uint64_t v70 = 0;
        uint64_t v33 = [a3 length];
        v71.NSUInteger location = MEMORY[0x1E4F143A8];
        v71.NSUInteger length = 3321888768;
        long long v72 = ___ZL17extractUnderlinesP18NSAttributedString_block_invoke;
        uint64_t v73 = &__block_descriptor_40_e8_32c52_ZTSKZL17extractUnderlinesP18NSAttributedStringE3__1_e41_v40__0__NSDictionary_8__NSRange_QQ_16_B32l;
        long long v74 = &v69;
        objc_msgSend(a3, "enumerateAttributesInRange:options:usingBlock:", 0, v33, 0, &v71);
        unint64_t v34 = 126 - 2 * __clz(HIDWORD(v70));
        if (HIDWORD(v70)) {
          uint64_t v35 = v34;
        }
        else {
          uint64_t v35 = 0;
        }
        std::__introsort<std::_ClassicAlgPolicy,extractUnderlines(NSAttributedString *)::$_0 &,WebCore::CompositionUnderline *,false>((unsigned int *)v69, (uint64_t *)v69 + 4 * HIDWORD(v70), v35, 1);
        uint64_t v57 = 0;
        uint64_t v58 = 0;
        if (HIDWORD(v70))
        {
          unsigned int v37 = *(_DWORD *)v69;
          unsigned int v38 = *((_DWORD *)v69 + 8 * HIDWORD(v70) - 7);
          v64.unint64_t m_colorAndFlags = 0x11040000000000FFLL;
          uint64_t v65 = (WTF::StringImpl *)__PAIR64__(v38, v37);
          LOBYTE(v66) = 0;
          WebCore::Color::Color((WebCore::Color *)&v67, &v64);
          char v68 = 0;
          WTF::Vector<WebCore::CompositionUnderline,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WebCore::CompositionUnderline>((uint64_t)&v57, (unint64_t)&v65);
          if ((v67 & 0x8000000000000) != 0)
          {
            int v54 = (unsigned int *)(v67 & 0xFFFFFFFFFFFFLL);
            if (atomic_fetch_add((atomic_uint *volatile)(v67 & 0xFFFFFFFFFFFFLL), 0xFFFFFFFF) == 1)
            {
              atomic_store(1u, v54);
              WTF::fastFree((WTF *)v54, v36);
            }
          }
          if ((v64.m_colorAndFlags & 0x8000000000000) != 0)
          {
            uint64_t v55 = (unsigned int *)(v64.m_colorAndFlags & 0xFFFFFFFFFFFFLL);
            if (atomic_fetch_add((atomic_uint *volatile)(v64.m_colorAndFlags & 0xFFFFFFFFFFFFLL), 0xFFFFFFFF) == 1)
            {
              atomic_store(1u, v55);
              WTF::fastFree((WTF *)v55, v36);
            }
          }
          if (HIDWORD(v70))
          {
            double v39 = (unsigned int *)v69;
            uint64_t v40 = 32 * HIDWORD(v70);
            do
            {
              double v41 = v39 + 6;
              if (*((unsigned char *)v39 + 24))
              {
                if (HIDWORD(v58) == v58)
                {
                  unint64_t v42 = WTF::Vector<WebCore::CompositionUnderline,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)&v57, HIDWORD(v58) + 1, (unint64_t)v39);
                  BOOL v43 = (char *)v57 + 32 * HIDWORD(v58);
                  uint64_t v44 = *(void *)v42;
                  v43[8] = *(unsigned char *)(v42 + 8);
                  *(void *)BOOL v43 = v44;
                  WebCore::Color::Color((WebCore::Color *)(v43 + 16), (const Color *)(v42 + 16));
                  long long v45 = v43 + 24;
                  double v41 = (unsigned char *)(v42 + 24);
                }
                else
                {
                  long long v46 = (char *)v57 + 32 * HIDWORD(v58);
                  uint64_t v47 = *(void *)v39;
                  _DWORD v46[8] = *((unsigned char *)v39 + 8);
                  *(void *)long long v46 = v47;
                  WebCore::Color::Color((WebCore::Color *)(v46 + 16), (const Color *)v39 + 2);
                  long long v45 = v46 + 24;
                }
                *long long v45 = *v41;
                ++HIDWORD(v58);
              }
              v39 += 8;
              v40 -= 32;
            }
            while (v40);
          }
        }
        WTF::Vector<WebCore::CompositionUnderline,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v69, v36);
      }
      else
      {
        uint64_t v57 = 0;
        uint64_t v58 = 0;
      }
      if (HIDWORD(v62)) {
        WTF::VectorDestructor<true,WebCore::CompositionUnderline>::destruct(v61, (void *)v61 + 4 * HIDWORD(v62));
      }
      uint64_t v50 = v61;
      if (v61)
      {
        uint64_t v61 = 0;
        LODWORD(v62) = 0;
        WTF::fastFree(v50, v32);
      }
      uint64_t v61 = v57;
      uint64_t v51 = v58;
      uint64_t v57 = 0;
      uint64_t v58 = 0;
      uint64_t v62 = v51;
      WTF::Vector<WebCore::CompositionUnderline,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v57, v32);
    }
    -[WKContentView _setMarkedText:underlines:highlights:selectedRange:](self, "_setMarkedText:underlines:highlights:selectedRange:", [a3 string], &v61, &v59, location, length);
    WTF::Vector<WebCore::CompositionHighlight,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v59, v52);
    WTF::Vector<WebCore::CompositionUnderline,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v61, v53);
  }
}

uint64_t __70__WKContentView_WKInteraction__setAttributedMarkedText_selectedRange___block_invoke(uint64_t a1)
{
  v13[2] = *MEMORY[0x1E4F143B8];
  if (![*(id *)(a1 + 32) length]) {
    return 0;
  }
  v12[0] = _MergedGlobals_877_0();
  v13[0] = [MEMORY[0x1E4F428B8] systemGrayColor];
  v12[1] = off_1EC2B2198[0]();
  v13[1] = [MEMORY[0x1E4F428B8] clearColor];
  uint64_t v2 = (const void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  BOOL v3 = v2;
  if (v2) {
    CFRetain(v2);
  }
  id v4 = (void *)[*(id *)(a1 + 32) attributesAtIndex:0 effectiveRange:0];
  long long v5 = v4;
  if (v4) {
    CFRetain(v4);
  }
  BOOL v6 = (void *)[v5 objectForKey:_MergedGlobals_877_0()];
  double v7 = v6;
  if (v6) {
    CFRetain(v6);
  }
  if (objc_msgSend(v7, "isEqual:", objc_msgSend(MEMORY[0x1E4F428B8], "systemGrayColor")))
  {
    double v8 = (void *)[v5 objectForKey:off_1EC2B2198[0]()];
    int v9 = v8;
    if (v8) {
      CFRetain(v8);
    }
    uint64_t v10 = objc_msgSend(v9, "isEqual:", objc_msgSend(MEMORY[0x1E4F428B8], "clearColor"));
    if (v9) {
      CFRelease(v9);
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  if (v7) {
    CFRelease(v7);
  }
  if (v5) {
    CFRelease(v5);
  }
  if (v3) {
    CFRelease(v3);
  }
  return v10;
}

- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  int v8 = [self->_markedText.m_ptr length];
  v16.unint64_t m_colorAndFlags = 0x11040000000000FFLL;
  LODWORD(v17) = 0;
  HIDWORD(v17) = v8;
  LOBYTE(v18) = 0;
  WebCore::Color::Color((WebCore::Color *)&v19, &v16);
  char v20 = 0;
  if (HIDWORD(v22) == v22)
  {
    WTF::Vector<WebCore::CompositionUnderline,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WebCore::CompositionUnderline>((uint64_t)&v21, (unint64_t)&v17);
  }
  else
  {
    uint64_t v10 = v21 + 32 * HIDWORD(v22);
    uint64_t v11 = v17;
    *(unsigned char *)(v10 + 8) = v18;
    *(void *)uint64_t v10 = v11;
    WebCore::Color::Color();
    *(unsigned char *)(v10 + 24) = v20;
    ++HIDWORD(v22);
  }
  if ((v19 & 0x8000000000000) != 0)
  {
    uint64_t v14 = (unsigned int *)(v19 & 0xFFFFFFFFFFFFLL);
    if (atomic_fetch_add((atomic_uint *volatile)(v19 & 0xFFFFFFFFFFFFLL), 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, v14);
      WTF::fastFree((WTF *)v14, v9);
    }
  }
  if ((v16.m_colorAndFlags & 0x8000000000000) != 0)
  {
    unint64_t v15 = (unsigned int *)(v16.m_colorAndFlags & 0xFFFFFFFFFFFFLL);
    if (atomic_fetch_add((atomic_uint *volatile)(v16.m_colorAndFlags & 0xFFFFFFFFFFFFLL), 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, v15);
      WTF::fastFree((WTF *)v15, v9);
    }
  }
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  -[WKContentView _setMarkedText:underlines:highlights:selectedRange:](self, "_setMarkedText:underlines:highlights:selectedRange:", a3, &v21, &v17, location, length);
  WTF::Vector<WebCore::CompositionHighlight,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v17, v12);
  WTF::Vector<WebCore::CompositionUnderline,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v21, v13);
}

- (void)_setMarkedText:(id)a3 underlines:(const void *)a4 highlights:(const void *)a5 selectedRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  BYTE4(self->_dataListSuggestionsControl.m_weakReference) = 1;
  BOOL v12 = ![(WKContentView *)self hasMarkedText] && self->_isExpectingFastSingleTapCommit;
  BYTE6(self->_revealFocusedElementDeferrer.m_ptr) = v12;
  if (a3) {
    CFRetain(a3);
  }
  id m_ptr = self->_markedText.m_ptr;
  self->_markedText.id m_ptr = a3;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  uint64_t v14 = self->_page.m_ptr;
  MEMORY[0x19972EAD0](&v22, a3);
  if (location == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v15 = -1;
  }
  else {
    uint64_t v15 = location;
  }
  if (location == 0x7FFFFFFFFFFFFFFFLL) {
    NSUInteger v16 = 0;
  }
  else {
    NSUInteger v16 = length;
  }
  v20[0] = v15;
  v20[1] = v16;
  uint64_t v21 = 0;
  long long v19 = xmmword_1994F6020;
  WebKit::WebPageProxy::setCompositionAsync((uint64_t)v14, (uint64_t)&v22, (uint64_t)a4, (uint64_t)a5, (uint64_t)&v21, (uint64_t)v20, (uint64_t)&v19);
  if (v21) {
    WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,WTF::Vector<unsigned char,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::Vector<unsigned char,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::Vector<unsigned char,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Vector<unsigned char,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::deallocateTable(v21, v17);
  }
  uint64_t v18 = v22;
  uint64_t v22 = 0;
  if (v18)
  {
    if (*(_DWORD *)v18 == 2) {
      WTF::StringImpl::destroy(v18, (WTF::StringImpl *)v17);
    }
    else {
      *(_DWORD *)v18 -= 2;
    }
  }
}

- (void)unmarkText
{
  self->_isExpectingFastSingleTapCommit = 0;
  id m_ptr = self->_markedText.m_ptr;
  self->_markedText.id m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  id v4 = self->_page.m_ptr;

  WebKit::WebPageProxy::confirmCompositionAsync((uint64_t)v4);
}

- (UITextPosition)beginningOfDocument
{
  return 0;
}

- (UITextPosition)endOfDocument
{
  return 0;
}

- (BOOL)_isAnchoredToCurrentSelection:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_msgSend(a3, "isEqual:", -[UITextRange start](-[WKContentView selectedTextRange](self, "selectedTextRange"), "start")) & 1) != 0)
  {
    return 1;
  }
  BOOL v6 = [(UITextRange *)[(WKContentView *)self selectedTextRange] end];

  return [a3 isEqual:v6];
}

- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4
{
  if (![(WKContentView *)self shouldUseAsyncInteractions]
    || ![(WKContentView *)self _isAnchoredToCurrentSelection:a3]
    || ![(WKContentView *)self _isAnchoredToCurrentSelection:a4])
  {
    return 0;
  }
  double v7 = (void *)CFMakeCollectable([[WKRelativeTextRange alloc] initWithStart:a3 end:a4]);

  return v7;
}

- (id)positionFromPosition:(id)a3 offset:(int64_t)a4
{
  if (![(WKContentView *)self shouldUseAsyncInteractions]
    || ![(WKContentView *)self _isAnchoredToCurrentSelection:a3])
  {
    return 0;
  }
  if (!a4) {
    return a3;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = a3;
  }
  else {
    id v7 = 0;
  }
  if ([v7 anchors])
  {
    int v8 = [WKRelativeTextPosition alloc];
    uint64_t v9 = [v7 anchors];
    uint64_t v10 = v8;
    int64_t v11 = a4;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id result = 0;
    if (!a3 || (isKindOfClass & 1) == 0) {
      return result;
    }
    uint64_t v14 = [WKRelativeTextPosition alloc];
    unsigned __int8 v15 = [a3 anchors];
    int64_t v11 = [a3 offset] + a4;
    uint64_t v9 = v15;
    uint64_t v10 = v14;
  }
  NSUInteger v16 = (void *)CFMakeCollectable([(WKRelativeTextPosition *)v10 initWithAnchors:v9 offset:v11]);

  return v16;
}

- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5
{
  return 0;
}

- (int64_t)comparePosition:(id)a3 toPosition:(id)a4
{
  return 0;
}

- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v6 = [a3 order];
  if (v6 == [a4 order])
  {
    uint64_t v7 = [a3 offset];
    uint64_t v8 = [a4 offset];
  }
  else
  {
    uint64_t v7 = [a3 order];
    uint64_t v8 = [a4 order];
  }
  return v7 - v8;
}

- (UITextInputTokenizer)tokenizer
{
  return 0;
}

- (id)positionWithinRange:(id)a3 farthestInDirection:(int64_t)a4
{
  return 0;
}

- (id)characterRangeByExtendingPosition:(id)a3 inDirection:(int64_t)a4
{
  return 0;
}

- (int64_t)baseWritingDirectionForPosition:(id)a3 inDirection:(int64_t)a4
{
  return 0;
}

- (void)setBaseWritingDirection:(int64_t)a3 forRange:(id)a4
{
  id m_ptr = self->_page.m_ptr;
  if (*((unsigned char *)m_ptr + 688))
  {
    if (a4)
    {
      if (!objc_msgSend(a4, "isEqual:", -[WKContentView selectedTextRange](self, "selectedTextRange"))) {
        return;
      }
      id m_ptr = self->_page.m_ptr;
    }
    if (a3 == 1) {
      char v7 = 2;
    }
    else {
      char v7 = a3 == 0;
    }
    WebKit::WebPageProxy::setBaseWritingDirection((uint64_t)m_ptr, v7);
  }
}

- (CGRect)firstRectForRange:(id)a3
{
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (id)closestPositionToPoint:(CGPoint)a3
{
  return 0;
}

- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4
{
  return 0;
}

- (id)characterRangeAtPoint:(CGPoint)a3
{
  return 0;
}

- (void)deleteBackward
{
  id m_ptr = self->_page.m_ptr;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  double v6 = 0;
  WebKit::WebPageProxy::executeEditCommand((WebKit::WebPageProxy *)m_ptr, &v7, &v6);
  double v4 = v6;
  double v6 = 0;
  if (v4)
  {
    if (*(_DWORD *)v4 == 2) {
      WTF::StringImpl::destroy(v4, v3);
    }
    else {
      *(_DWORD *)v4 -= 2;
    }
  }
  double v5 = v7;
  char v7 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2) {
      WTF::StringImpl::destroy(v5, v3);
    }
    else {
      *(_DWORD *)v5 -= 2;
    }
  }
}

- (BOOL)_shouldSimulateKeyboardInputOnTextInsertion
{
  return [self->_scribbleInteraction.m_ptr isHandlingWriting];
}

- (void)insertText:(id)a3
{
  if (!self->_usingGestureForSelection || !self->_isTapHighlightFading)
  {
    char v13 = 0;
    int v12 = 0;
    BOOL v5 = self->_isChangingFocusUsingAccessoryTab || self->_didAccessoryTabInitiateFocus;
    BYTE2(v12) = v5;
    HIBYTE(v12) = [(WKContentView *)self _shouldSimulateKeyboardInputOnTextInsertion];
    id m_ptr = self->_page.m_ptr;
    MEMORY[0x19972EAD0](&v11, a3);
    long long v10 = xmmword_1994F6020;
    WebKit::WebPageProxy::insertTextAsync((uint64_t)m_ptr, (uint64_t)&v11, (uint64_t)&v10, (uint64_t)&v12);
    uint64_t v8 = v11;
    int64_t v11 = 0;
    if (v8)
    {
      if (*(_DWORD *)v8 == 2) {
        WTF::StringImpl::destroy(v8, v7);
      }
      else {
        *(_DWORD *)v8 -= 2;
      }
    }
    if (self->_anon_938[112] == 2 && [a3 length])
    {
      int v9 = objc_msgSend(a3, "characterAtIndex:", objc_msgSend(a3, "length") - 1);
      if (!*((unsigned char *)&self->_domPasteRequestCategory + 4)) {
        *((unsigned char *)&self->_domPasteRequestCategory + 4) = 1;
      }
      *(_DWORD *)&self->_domPasteRequestCategory.var0.__null_state_ = v9;
      WebKit::WebPageProxy::scheduleFullEditorStateUpdate((uint64_t)self->_page.m_ptr);
    }
    BYTE4(self->_dataListSuggestionsControl.m_weakReference) = 1;
  }
}

- (void)insertText:(id)a3 alternatives:(id)a4 style:(int64_t)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([a4 count])
  {
    int v9 = (const void *)[objc_alloc(MEMORY[0x1E4F42690]) initWithPrimaryString:a3 alternativeStrings:a4 isLowConfidence:a5 == 1];
    long long v10 = (const void *)[objc_alloc(MEMORY[0x1E4F18BC0]) _initWithNSTextAlternatives:v9];
    [a3 length];
    WebCore::TextAlternativeWithRange::TextAlternativeWithRange();
    char v21 = 0;
    int v20 = 0;
    HIBYTE(v20) = [(WKContentView *)self _shouldSimulateKeyboardInputOnTextInsertion];
    id m_ptr = self->_page.m_ptr;
    MEMORY[0x19972EAD0](&v19, a3);
    long long v18 = xmmword_1994F6020;
    long long v24 = v22;
    CFTypeRef v25 = cf;
    if (cf) {
      CFRetain(cf);
    }
    WTF::Vector<WebCore::TextAlternativeWithRange,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector(v17, (uint64_t)&v24, 1uLL);
    WebKit::WebPageProxy::insertDictatedTextAsync((WTF *)m_ptr, (uint64_t *)&v19, (uint64_t *)&v18, (unsigned int *)v17, (char *)&v20);
    WTF::Vector<WebKit::RemoteLayerTreeNode::CachedContentsBuffer,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((unsigned int *)v17, v12);
    CFTypeRef v14 = v25;
    CFTypeRef v25 = 0;
    if (v14) {
      CFRelease(v14);
    }
    unsigned __int8 v15 = v19;
    long long v19 = 0;
    if (v15)
    {
      if (*(_DWORD *)v15 == 2) {
        WTF::StringImpl::destroy(v15, v13);
      }
      else {
        *(_DWORD *)v15 -= 2;
      }
    }
    BYTE4(self->_dataListSuggestionsControl.m_weakReference) = 1;
    CFTypeRef v16 = cf;
    CFTypeRef cf = 0;
    if (v16) {
      CFRelease(v16);
    }
    if (v10) {
      CFRelease(v10);
    }
    if (v9) {
      CFRelease(v9);
    }
  }
  else
  {
    [(WKContentView *)self insertText:a3];
  }
}

- (BOOL)hasText
{
  if (self->_potentialTapInProgress || (id m_ptr = self->_page.m_ptr, *((unsigned char *)m_ptr + 1104)))
  {
    int v3 = self->_anon_938[111];
    return v3 != 0;
  }
  uint64_t v5 = *((void *)m_ptr + 4);
  if (*(unsigned char *)(v5 + 576))
  {
    int v3 = *(unsigned __int8 *)(v5 + 364);
    return v3 != 0;
  }
  return 0;
}

- (void)addTextAlternatives:(id)a3
{
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (a3 && (isKindOfClass & 1) != 0)
  {
    CFRetain(a3);
  }
  else
  {
    objc_opt_class();
    char v6 = objc_opt_isKindOfClass();
    if (!a3) {
      return;
    }
    if ((v6 & 1) == 0) {
      return;
    }
    CFRetain(a3);
    char v7 = (void *)[objc_alloc(MEMORY[0x1E4F18BC0]) _initWithNSTextAlternatives:a3];
    CFRelease(a3);
    a3 = v7;
    if (!v7) {
      return;
    }
  }
  id m_ptr = self->_page.m_ptr;
  objc_msgSend((id)objc_msgSend(a3, "primaryString"), "length");
  WebCore::TextAlternativeWithRange::TextAlternativeWithRange();
  WebKit::WebPageProxy::addDictationAlternative((WTF::StringImpl *)m_ptr, (uint64_t)v10);
  CFTypeRef v9 = cf;
  CFTypeRef cf = 0;
  if (v9) {
    CFRelease(v9);
  }
  CFRelease(a3);
}

- (void)removeEmojiAlternatives
{
  id m_ptr = self->_page.m_ptr;
  id v5 = 0;
  objc_initWeak(&v5, self);
  uint64_t v3 = WTF::fastMalloc((WTF *)0x10);
  *(void *)uint64_t v3 = &unk_1EEA0F008;
  *(void *)(v3 + 8) = 0;
  objc_moveWeak((id *)(v3 + 8), &v5);
  uint64_t v6 = v3;
  WebKit::WebPageProxy::dictationAlternativesAtSelection((uint64_t)m_ptr, &v6);
  uint64_t v4 = v6;
  uint64_t v6 = 0;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
  objc_destroyWeak(&v5);
}

- (id)textInputTraits
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (![(WKContentView *)self _requiresLegacyTextInputTraits]
    && [(WKContentView *)self shouldUseAsyncInteractions])
  {
    char v7 = qword_1EB3586B8;
    if (os_log_type_enabled((os_log_t)qword_1EB3586B8, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      CFTypeRef v9 = "-[WKContentView(WKInteraction) textInputTraits]";
      _os_log_error_impl(&dword_1985F2000, v7, OS_LOG_TYPE_ERROR, "Received unexpected call to %s", (uint8_t *)&v8, 0xCu);
    }
    __break(0xC471u);
    JUMPOUT(0x199449770);
  }
  uint64_t v3 = (void *)[objc_loadWeak(&self->_webView.m_weakReference) _textInputTraits];
  uint64_t v4 = v3;
  if (v3) {
    CFRetain(v3);
  }
  id m_ptr = self->_legacyTextInputTraits.m_ptr;
  self->_legacyTextInputTraits.id m_ptr = v4;
  if (m_ptr)
  {
    CFRelease(m_ptr);
    return self->_legacyTextInputTraits.m_ptr;
  }
  return v4;
}

uint64_t __55__WKContentView_WKInteraction___updateTextInputTraits___block_invoke(uint64_t a1)
{
  unint64_t v1 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 2473);
  return (v1 < 0x13) & (0x7FFECu >> v1);
}

- (id)interactionAssistant
{
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    v5.receiver = self;
    v5.super_class = (Class)WKContentView;
    return [(WKContentView *)&v5 interactionAssistant];
  }
  else
  {
    id m_ptr = self->_textInteractionWrapper.m_ptr;
    return (id)[m_ptr textInteractionAssistant];
  }
}

- (_NSRange)selectionRange
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    uint64_t v4 = qword_1EB3586B8;
    if (os_log_type_enabled((os_log_t)qword_1EB3586B8, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      uint64_t v6 = "-[WKContentView(WKInteraction) selectionRange]";
      _os_log_error_impl(&dword_1985F2000, v4, OS_LOG_TYPE_ERROR, "Received unexpected call to %s", (uint8_t *)&v5, 0xCu);
    }
    __break(0xC471u);
    JUMPOUT(0x199449910);
  }
  NSUInteger v2 = 0x7FFFFFFFFFFFFFFFLL;
  NSUInteger v3 = 0;
  result.NSUInteger length = v3;
  result.NSUInteger location = v2;
  return result;
}

- (CGRect)rectForNSRange:(_NSRange)a3
{
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (_NSRange)_markedTextNSRange
{
  NSUInteger v2 = 0x7FFFFFFFFFFFFFFFLL;
  NSUInteger v3 = 0;
  result.NSUInteger length = v3;
  result.NSUInteger location = v2;
  return result;
}

- (id)selectedDOMRange
{
  return 0;
}

- (void)replaceRangeWithTextWithoutClosingTyping:(id)a3 replacementText:(id)a4
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    double v4 = qword_1EB3586B8;
    if (os_log_type_enabled((os_log_t)qword_1EB3586B8, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      double v6 = "-[WKContentView(WKInteraction) replaceRangeWithTextWithoutClosingTyping:replacementText:]";
      _os_log_error_impl(&dword_1985F2000, v4, OS_LOG_TYPE_ERROR, "Received unexpected call to %s", (uint8_t *)&v5, 0xCu);
    }
    __break(0xC471u);
    JUMPOUT(0x199449A08);
  }
}

- (CGRect)rectContainingCaretSelection
{
  double v2 = *MEMORY[0x1E4F1DB28];
  double v3 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (BOOL)_isTextInputContextFocused:(id)a3
{
  BOOL v5 = [(WKContentView *)self _hasFocusedElement];
  if (v5)
  {
    double v6 = (WebCore::ElementContext *)[a3 _textInputContext];
    LOBYTE(v5) = WebCore::ElementContext::isSameElement(v6, &self->_focusedElementInformation.elementContext);
  }
  return v5;
}

- (void)_focusTextInputContext:(id)a3 placeCaretAt:(CGPoint)a4 completionHandler:(id)a5
{
  CGPoint v22 = a4;
  if (![(WKContentView *)self becomeFirstResponder])
  {
    CFTypeRef v9 = (void (*)(id, WKContentView *))*((void *)a5 + 2);
    id v10 = a5;
    int v8 = 0;
LABEL_8:
    v9(v10, v8);
    return;
  }
  if ([(WKContentView *)self _isTextInputContextFocused:a3])
  {
    if (self->_anon_938[107]) {
      int v8 = 0;
    }
    else {
      int v8 = self;
    }
    CFTypeRef v9 = (void (*)(id, WKContentView *))*((void *)a5 + 2);
    id v10 = a5;
    goto LABEL_8;
  }
  BYTE4(self->_dataListSuggestionsControl.m_weakReference) = 1;
  BYTE2(self->_dataListTextSuggestions.m_ptr) = 1;
  id location = 0;
  objc_initWeak(&location, self);
  CFTypeRef cf = (CFTypeRef)[a3 copy];
  aBlock = _Block_copy(a5);
  id m_ptr = self->_page.m_ptr;
  uint64_t v12 = [a3 _textInputContext];
  WebCore::IntPoint::IntPoint((WebCore::IntPoint *)v18, &v22);
  uint64_t v13 = WTF::fastMalloc((WTF *)0x20);
  *(void *)uint64_t v13 = &unk_1EEA0F030;
  *(void *)(v13 + 8) = 0;
  objc_moveWeak((id *)(v13 + 8), &location);
  *(void *)(v13 + 16) = cf;
  CFTypeRef v14 = aBlock;
  CFTypeRef cf = 0;
  aBlock = 0;
  *(void *)(v13 + 24) = v14;
  uint64_t v17 = v13;
  WebKit::WebPageProxy::focusTextInputContextAndPlaceCaret((uint64_t)m_ptr, v12, (uint64_t)v18, &v17);
  uint64_t v15 = v17;
  uint64_t v17 = 0;
  if (v15) {
    (*(void (**)(uint64_t))(*(void *)v15 + 8))(v15);
  }
  _Block_release(aBlock);
  CFTypeRef v16 = cf;
  CFTypeRef cf = 0;
  if (v16) {
    CFRelease(v16);
  }
  objc_destroyWeak(&location);
}

- (void)_requestTextInputContextsInRect:(CGRect)a3 completionHandler:(id)a4
{
  CGRect v20 = a3;
  WebCore::FloatRect::FloatRect((WebCore::FloatRect *)v19, &v20);
  if ([(WKContentView *)self _hasFocusedElement])
  {
    WebCore::FloatRect::FloatRect((WebCore::FloatRect *)&location, (const WebCore::IntRect *)&self->_focusedElementInformation);
    char v6 = WebCore::FloatRect::inclusivelyIntersects((WebCore::FloatRect *)v19, (const WebCore::FloatRect *)&location);
  }
  else
  {
    char v6 = 0;
  }
  if ((objc_msgSend(-[WKContentView webView](self, "webView"), "_isEditable") & 1) != 0
    || (v6 & 1) != 0
    || (WebCore::FloatRect::FloatRect((WebCore::FloatRect *)&location, &v20),
        (WebKit::mayContainEditableElementsInRect((WebKit *)self, (UIView *)&location, v7) & 1) != 0))
  {
    id m_ptr = self->_page.m_ptr;
    float v9 = *(float *)v19;
    float v10 = *(float *)&v19[1];
    float v11 = *(float *)&v19[2];
    float v12 = *(float *)&v19[3];
    id location = 0;
    objc_initWeak(&location, self);
    aBlock = _Block_copy(a4);
    uint64_t v13 = WTF::fastMalloc((WTF *)0x18);
    *(void *)uint64_t v13 = &unk_1EEA0F058;
    *(void *)(v13 + 8) = 0;
    objc_moveWeak((id *)(v13 + 8), &location);
    CFTypeRef v14 = aBlock;
    aBlock = 0;
    *(void *)(v13 + 16) = v14;
    uint64_t v16 = v13;
    WebKit::WebPageProxy::textInputContextsInRect((uint64_t)m_ptr, &v16, v9, v10, v11, v12);
    uint64_t v15 = v16;
    uint64_t v16 = 0;
    if (v15) {
      (*(void (**)(uint64_t))(*(void *)v15 + 8))(v15);
    }
    _Block_release(aBlock);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, void))a4 + 2))(a4, MEMORY[0x1E4F1CBF0]);
  }
}

- (void)_willBeginTextInteractionInTextInputContext:(id)a3
{
  WebKit::WebPageProxy::setCanShowPlaceholder((uint64_t)self->_page.m_ptr, (const WebCore::ElementContext *)[a3 _textInputContext], 0);
  unint64_t v4 = *(void *)&self->_isUpdatingAccessoryView + 1;
  *(void *)&self->_isUpdatingAccessoryView = v4;
  if (v4 <= 1)
  {
    BYTE1(self->_dataListSuggestionsControl.m_weakReference) = 0;
    WebKit::WebPageProxy::setShouldRevealCurrentSelectionAfterInsertion((uint64_t)self->_page.m_ptr, 0);
    BYTE4(self->_dataListSuggestionsControl.m_weakReference) = 1;
    BYTE2(self->_dataListTextSuggestions.m_ptr) = 1;
  }
}

- (void)_didFinishTextInteractionInTextInputContext:(id)a3
{
  WebKit::WebPageProxy::setCanShowPlaceholder((uint64_t)self->_page.m_ptr, (const WebCore::ElementContext *)[a3 _textInputContext], 1);
  uint64_t v4 = *(void *)&self->_isUpdatingAccessoryView - 1;
  *(void *)&self->_isUpdatingAccessoryView = v4;
  if (!v4)
  {
    BYTE2(self->_dataListTextSuggestions.m_ptr) = 0;
    if (BYTE1(self->_dataListSuggestionsControl.m_weakReference))
    {
      WebKit::RevealFocusedElementDeferrer::create(self, 1, &v7);
      uint64_t v5 = *(void *)&self->_actionsToPerformAfterEditorStateUpdate.m_capacity;
      *(void *)&self->_actionsToPerformAfterEditorStateUpdate.m_capacitdouble y = v7;
      if (v5) {
        WTF::RefCounted<WebKit::RevealFocusedElementDeferrer>::deref(v5);
      }
      id m_ptr = self->_page.m_ptr;
      *((unsigned char *)m_ptr + 1104) = 1;
      BYTE1(self->_dataListSuggestionsControl.m_weakReference) = 0;
    }
    else
    {
      id m_ptr = self->_page.m_ptr;
    }
    WebKit::WebPageProxy::setShouldRevealCurrentSelectionAfterInsertion((uint64_t)m_ptr, 1);
  }
}

- (void)modifierFlagsDidChangeFrom:(int64_t)a3 to:(int64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    uint64_t v13 = qword_1EB3586B8;
    if (os_log_type_enabled((os_log_t)qword_1EB3586B8, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315138;
      uint64_t v15 = "-[WKContentView(WKInteraction) modifierFlagsDidChangeFrom:to:]";
      _os_log_error_impl(&dword_1985F2000, v13, OS_LOG_TYPE_ERROR, "Received unexpected call to %s", (uint8_t *)&v14, 0xCu);
    }
    __break(0xC471u);
    JUMPOUT(0x19944A280);
  }
  int v7 = a3 & ~a4;
  if ((a3 & ~a4) != 0)
  {
    if ((v7 & 0x20000) != 0)
    {
      int v8 = [[WKSyntheticFlagsChangedWebEvent alloc] initWithShiftState:0];
      [(WKContentView *)self handleKeyWebEvent:v8];
      if (v8) {
        CFRelease(v8);
      }
    }
    if ((v7 & 0x10000) != 0)
    {
      float v9 = [[WKSyntheticFlagsChangedWebEvent alloc] initWithCapsLockState:0];
      [(WKContentView *)self handleKeyWebEvent:v9];
      if (v9) {
        CFRelease(v9);
      }
    }
  }
  int64_t v10 = a4 & ~a3;
  if (v10)
  {
    if ((v10 & 0x20000) != 0)
    {
      float v11 = [[WKSyntheticFlagsChangedWebEvent alloc] initWithShiftState:1];
      [(WKContentView *)self handleKeyWebEvent:v11];
      if (v11) {
        CFRelease(v11);
      }
    }
    if ((v10 & 0x10000) != 0)
    {
      float v12 = [[WKSyntheticFlagsChangedWebEvent alloc] initWithCapsLockState:1];
      [(WKContentView *)self handleKeyWebEvent:v12];
      if (v12)
      {
        CFRelease(v12);
      }
    }
  }
}

- (BOOL)shouldSuppressUpdateCandidateView
{
  return BYTE6(self->_revealFocusedElementDeferrer.m_ptr);
}

- (BOOL)requiresKeyEvents
{
  return 1;
}

- (BOOL)_tryToHandlePressesEvent:(id)a3
{
  uint64_t v5 = [a3 _hidEvent];
  int v6 = [(WKContentView *)self isFirstResponder];
  BOOL result = 0;
  if (v6 && v5)
  {
    if (self->_inputPeripheral.m_ptr || !*(unsigned char *)(*((void *)self->_page.m_ptr + 4) + 253))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0
        && ([self->_inputPeripheral.m_ptr handleKeyEvent:a3] & 1) != 0)
      {
        return 1;
      }
      if (!HIBYTE(self->_revealFocusedElementDeferrer.m_ptr))
      {
        HIBYTE(self->_revealFocusedElementDeferrer.m_ptr) = 1;
        [(WKContentView *)self reloadInputViews];
      }
    }
    return 0;
  }
  return result;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  if (![(WKContentView *)self _tryToHandlePressesEvent:a4])
  {
    self->_didAccessoryTabInitiateFocus = 1;
    v7.receiver = self;
    v7.super_class = (Class)WKContentView;
    [(WKContentView *)&v7 pressesBegan:a3 withEvent:a4];
  }
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  if (![(WKContentView *)self _tryToHandlePressesEvent:a4])
  {
    self->_didAccessoryTabInitiateFocus = 0;
    v7.receiver = self;
    v7.super_class = (Class)WKContentView;
    [(WKContentView *)&v7 pressesEnded:a3 withEvent:a4];
  }
}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  if (![(WKContentView *)self _tryToHandlePressesEvent:a4])
  {
    v7.receiver = self;
    v7.super_class = (Class)WKContentView;
    [(WKContentView *)&v7 pressesChanged:a3 withEvent:a4];
  }
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  if (![(WKContentView *)self _tryToHandlePressesEvent:a4])
  {
    self->_didAccessoryTabInitiateFocus = 0;
    v7.receiver = self;
    v7.super_class = (Class)WKContentView;
    [(WKContentView *)&v7 pressesCancelled:a3 withEvent:a4];
  }
}

- (void)generateSyntheticEditingCommand:(unsigned __int8)a3
{
}

- (void)handleKeyWebEvent:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    uint64_t v5 = qword_1EB3586B8;
    if (os_log_type_enabled((os_log_t)qword_1EB3586B8, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315138;
      objc_super v7 = "-[WKContentView(WKInteraction) handleKeyWebEvent:]";
      _os_log_error_impl(&dword_1985F2000, v5, OS_LOG_TYPE_ERROR, "Received unexpected call to %s", (uint8_t *)&v6, 0xCu);
    }
    __break(0xC471u);
    JUMPOUT(0x19944A64CLL);
  }

  [(WKContentView *)self _internalHandleKeyWebEvent:a3];
}

- (void)_internalHandleKeyWebEvent:(id)a3
{
  id m_ptr = self->_page.m_ptr;
  WebKit::NativeWebKeyboardEvent::NativeWebKeyboardEvent((uint64_t)v6, (WebKit::WebIOSEventFactory *)a3, 0);
  WebKit::WebPageProxy::handleKeyboardEvent((uint64_t)m_ptr, (uint64_t)v6);
  CFTypeRef v5 = cf;
  CFTypeRef cf = 0;
  if (v5) {
    CFRelease(v5);
  }
  WebKit::WebKeyboardEvent::~WebKeyboardEvent((WebKit::WebKeyboardEvent *)v6, v4);
}

- (void)handleKeyWebEvent:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    objc_super v7 = qword_1EB3586B8;
    if (os_log_type_enabled((os_log_t)qword_1EB3586B8, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      float v9 = "-[WKContentView(WKInteraction) handleKeyWebEvent:withCompletionHandler:]";
      _os_log_error_impl(&dword_1985F2000, v7, OS_LOG_TYPE_ERROR, "Received unexpected call to %s", (uint8_t *)&v8, 0xCu);
    }
    __break(0xC471u);
    JUMPOUT(0x19944A7ACLL);
  }

  [(WKContentView *)self _internalHandleKeyWebEvent:a3 withCompletionHandler:a4];
}

- (BOOL)_deferKeyEventToInputMethodEditing:(id)a3
{
  if (!*(unsigned char *)(*((void *)self->_page.m_ptr + 4) + 253)
    && !BYTE2(self->_dataListSuggestionsControl.m_weakReference))
  {
    return 0;
  }
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    id Weak = objc_loadWeak((id *)&self->_anon_fb8[24]);
    int v6 = Weak;
    if (Weak) {
      CFRetain(Weak);
    }
    -[WKContentView _logMissingSystemInputDelegateIfNeeded:](self, "_logMissingSystemInputDelegateIfNeeded:", "-[WKContentView(WKInteraction) _deferKeyEventToInputMethodEditing:]");
    if (v6)
    {
      objc_super v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F18B80]), "initWithKeyEntry:", objc_msgSend(a3, "originalKeyEntry"));
      [v7 setDocumentEditable:1];
      [v7 setShouldEvaluateForInputSystemHandling:1];
      char v8 = objc_msgSend(v6, "shouldDeferEventHandlingToSystemForTextInput:context:", -[WKContentView asBETextInput](self, "asBETextInput"), v7);
      if (v7) {
        CFRelease(v7);
      }
      CFRelease(v6);
      return v8;
    }
    return 0;
  }
  float v9 = (void *)[MEMORY[0x1E4F42B20] sharedInstance];

  return [v9 handleKeyInputMethodCommandForCurrentEvent];
}

- (void)_internalHandleKeyWebEvent:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (WTF::isUIThread((WTF *)self))
  {
    if ([a3 type] == 4) {
      self->_isChangingFocusUsingAccessoryTab = 1;
    }
    [(WKContentView *)self _handleDOMPasteRequestWithResult:0];
    if ([(WKContentView *)self _deferKeyEventToInputMethodEditing:a3])
    {
      (*((void (**)(id, id, uint64_t))a4 + 2))(a4, a3, 1);
      self->_isExpectingFastSingleTapCommit = 1;
      id m_ptr = self->_page.m_ptr;
      WebKit::NativeWebKeyboardEvent::NativeWebKeyboardEvent((uint64_t)v26, (WebKit::WebIOSEventFactory *)a3, (WebEvent *)1);
      WebKit::WebPageProxy::handleKeyboardEvent((uint64_t)m_ptr, (uint64_t)v26);
      CFTypeRef v9 = cf;
      CFTypeRef cf = 0;
      if (v9) {
        CFRelease(v9);
      }
      WebKit::WebKeyboardEvent::~WebKeyboardEvent((WebKit::WebKeyboardEvent *)v26, v8);
    }
    else
    {
      float v11 = self->_page.m_ptr;
      WebKit::NativeWebKeyboardEvent::NativeWebKeyboardEvent((uint64_t)v26, (WebKit::WebIOSEventFactory *)a3, 0);
      int v13 = WebKit::WebPageProxy::handleKeyboardEvent((uint64_t)v11, (uint64_t)v26);
      CFTypeRef v14 = cf;
      CFTypeRef cf = 0;
      if (v14) {
        CFRelease(v14);
      }
      WebKit::WebKeyboardEvent::~WebKeyboardEvent((WebKit::WebKeyboardEvent *)v26, v12);
      if (v13)
      {
        *(void *)&v26[0] = a3;
        if (a3) {
          CFRetain(a3);
        }
        uint64_t v15 = _Block_copy(a4);
        *((void *)&v26[0] + 1) = v15;
        uint64_t m_size = self->_keyWebEventHandlers.m_size;
        if (m_size == self->_keyWebEventHandlers.m_capacity)
        {
          uint64_t v17 = (uint64_t *)WTF::Vector<WebKit::KeyEventAndCompletionBlock,1ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)&self->_keyWebEventHandlers, m_size + 1, (unint64_t)v26);
          long long v18 = (void *)((char *)self->_keyWebEventHandlers.m_buffer + 16 * self->_keyWebEventHandlers.m_size);
          uint64_t v19 = *v17;
          *uint64_t v17 = 0;
          void *v18 = v19;
          uint64_t v20 = v17[1];
          v17[1] = 0;
          v18[1] = v20;
          ++self->_keyWebEventHandlers.m_size;
          char v21 = (const void *)*((void *)&v26[0] + 1);
        }
        else
        {
          char v21 = 0;
          unsigned int v22 = m_size + 1;
          m_buffer = self->_keyWebEventHandlers.m_buffer;
          *(void *)&v26[0] = 0;
          long long v24 = (id *)((char *)m_buffer + 16 * m_size);
          *long long v24 = a3;
          *((void *)&v26[0] + 1) = 0;
          v24[1] = v15;
          self->_keyWebEventHandlers.uint64_t m_size = v22;
        }
        _Block_release(v21);
        CFTypeRef v25 = *(const void **)&v26[0];
        *(void *)&v26[0] = 0;
        if (v25) {
          CFRelease(v25);
        }
      }
      else
      {
        (*((void (**)(id, id, void))a4 + 2))(a4, a3, 0);
      }
    }
  }
  else
  {
    uint64_t v10 = qword_1EB357F88;
    if (os_log_type_enabled((os_log_t)qword_1EB357F88, OS_LOG_TYPE_FAULT))
    {
      LODWORD(v26[0]) = 136315138;
      *(void *)((char *)v26 + 4) = "-[WKContentView(WKInteraction) _internalHandleKeyWebEvent:withCompletionHandler:]";
      _os_log_fault_impl(&dword_1985F2000, v10, OS_LOG_TYPE_FAULT, "%s was invoked on a background thread.", (uint8_t *)v26, 0xCu);
    }
    (*((void (**)(id, id, void))a4 + 2))(a4, a3, 0);
  }
}

- (void)_didHandleKeyEvent:(id)a3 eventWasHandled:(BOOL)a4
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (([a3 keyboardFlags] & 0x20) == 0) {
      [self->_positionInformationCallbackDepth handleKeyEvent:a3];
    }
    if ([a3 type] == 5) {
      self->_isChangingFocusUsingAccessoryTab = 0;
    }
    p_keyWebEventHandlers = &self->_keyWebEventHandlers;
    uint64_t m_size = p_keyWebEventHandlers->m_size;
    if (m_size)
    {
      uint64_t v8 = 0;
      m_buffer = p_keyWebEventHandlers->m_buffer;
      uint64_t v10 = 16 * m_size;
      while (*(id *)((char *)m_buffer + v8) != a3)
      {
        v8 += 16;
        if (v10 == v8) {
          return;
        }
      }
      (*(void (**)(void))(*(void *)((char *)m_buffer + v8 + 8) + 16))();
      float v11 = (const void **)((char *)p_keyWebEventHandlers->m_buffer + v8);
      _Block_release(v11[1]);
      float v12 = *v11;
      *float v11 = 0;
      if (v12) {
        CFRelease(v12);
      }
      WTF::VectorMover<false,WebKit::KeyEventAndCompletionBlock>::move(v11 + 2, (const void **)p_keyWebEventHandlers->m_buffer + 2 * p_keyWebEventHandlers->m_size, v11);
      --p_keyWebEventHandlers->m_size;
    }
  }
}

- (BOOL)_interpretKeyEvent:(id)a3 isCharEvent:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL usingMouseDragForSelection = self->_usingMouseDragForSelection;
  self->_BOOL usingMouseDragForSelection = 1;
  if ((objc_msgSend(self->_positionInformationCallbackDepth, "beginWithEvent:") & 1) != 0
    || ([self->_positionInformationCallbackDepth scrollTriggeringKeyIsPressed] & 1) != 0)
  {
    goto LABEL_3;
  }
  if (![(WKContentView *)self shouldUseAsyncInteractions])
  {
    if (([a3 keyboardFlags] & 0x20) != 0) {
      goto LABEL_20;
    }
    uint64_t v13 = *((void *)self->_page.m_ptr + 4);
    int v14 = *(unsigned __int8 *)(v13 + 253);
    if (!*(unsigned char *)(v13 + 253) && ([a3 isTabKey] & 1) != 0) {
      goto LABEL_20;
    }
    uint64_t v15 = (void *)[MEMORY[0x1E4F42B20] sharedInstance];
    uint64_t v16 = v15;
    if (v4) {
      char v17 = [v15 handleKeyAppCommandForCurrentEvent];
    }
    else {
      char v17 = [v15 handleKeyTextCommandForCurrentEvent];
    }
    if (v17) {
      goto LABEL_3;
    }
    if (([a3 modifierFlags] & 0x1010000) != 0) {
      goto LABEL_20;
    }
    long long v18 = (void *)[a3 characters];
    if (![v18 length]) {
      goto LABEL_20;
    }
    int v19 = [v18 characterAtIndex:0];
    if (v19 > 12)
    {
      if (v19 != 13)
      {
        if (v19 != 127)
        {
LABEL_25:
          char v8 = 0;
          if (!v14 || !v4) {
            goto LABEL_4;
          }
          objc_msgSend(v16, "addInputString:withFlags:withInputManagerHint:", objc_msgSend(a3, "characters"), objc_msgSend(a3, "keyboardFlags"), objc_msgSend(a3, "inputManagerHint"));
          goto LABEL_3;
        }
        goto LABEL_30;
      }
    }
    else if (v19 != 3)
    {
      if (v19 != 8) {
        goto LABEL_25;
      }
LABEL_30:
      if (v14)
      {
        objc_msgSend(v16, "deleteFromInputWithFlags:", objc_msgSend(a3, "keyboardFlags"));
        goto LABEL_3;
      }
LABEL_20:
      char v8 = 0;
      goto LABEL_4;
    }
    char v8 = 0;
    if (!v14 || !v4) {
      goto LABEL_4;
    }
    [v16 addInputString:@"\n" withFlags:0 withInputManagerHint:0];
LABEL_3:
    char v8 = 1;
    goto LABEL_4;
  }
  id Weak = objc_loadWeak((id *)&self->_anon_fb8[24]);
  float v11 = Weak;
  if (Weak) {
    CFRetain(Weak);
  }
  -[WKContentView _logMissingSystemInputDelegateIfNeeded:](self, "_logMissingSystemInputDelegateIfNeeded:", "-[WKContentView(WKInteraction) _interpretKeyEvent:isCharEvent:]");
  if (!v11) {
    goto LABEL_20;
  }
  float v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F18B80]), "initWithKeyEntry:", objc_msgSend(a3, "originalKeyEntry"));
  [v12 setDocumentEditable:*(unsigned __int8 *)(*((void *)self->_page.m_ptr + 4) + 253)];
  [v12 setShouldInsertCharacter:v4];
  char v8 = objc_msgSend(v11, "shouldDeferEventHandlingToSystemForTextInput:context:", -[WKContentView asBETextInput](self, "asBETextInput"), v12);
  if (v12) {
    CFRelease(v12);
  }
  CFRelease(v11);
LABEL_4:
  self->_BOOL usingMouseDragForSelection = usingMouseDragForSelection;
  return v8;
}

- (id)filePickerAcceptedTypeIdentifiers
{
  id m_ptr = self->_fileUploadPanel.m_ptr;
  if (m_ptr) {
    return (id)[m_ptr acceptedTypeIdentifiers];
  }
  else {
    return (id)MEMORY[0x1E4F1CBF0];
  }
}

- (void)dismissFilePicker
{
}

- (BOOL)isScrollableForKeyboardScrollViewAnimator:(id)a3
{
  if (*(unsigned char *)(*((void *)self->_page.m_ptr + 4) + 253)
    || self->_anon_938[113] == 16
    || !objc_msgSend((id)objc_msgSend(-[WKContentView webView](self, "webView", a3), "scrollView"), "isScrollEnabled"))
  {
    return 0;
  }
  BOOL v4 = objc_msgSend(-[WKContentView webView](self, "webView"), "scrollView");

  return [v4 allowsKeyboardScrolling];
}

- (double)keyboardScrollViewAnimator:(id)a3 distanceForIncrement:(unsigned __int8)a4 inDirection:(unsigned __int8)a5
{
  if (a4)
  {
    int v6 = a5 & 0xFE;
    if (a4 == 1)
    {
      float v15 = *(float *)(*((void *)self->_page.m_ptr + 4) + 2308);
      uint64_t v16 = (WebCore::Scrollbar *)[(WKContentView *)self bounds];
      int v18 = llroundf((float)(int)v15 * 0.8);
      int v19 = llroundf((float)(int)((int)v17 - WebCore::Scrollbar::maxOverlapBetweenPages(v16)));
      if (v18 > v19) {
        int v19 = v18;
      }
      if (v19 <= 1) {
        int v19 = 1;
      }
      -[WKContentView convertSize:toView:](self, "convertSize:toView:", [(WKContentView *)self webView], 0.0, (double)v19);
      if (v6 != 2) {
        return v20;
      }
    }
    else
    {
      double result = 0.0;
      if (a4 == 2)
      {
        [(WKContentView *)self bounds];
        -[WKContentView convertRect:toView:](self, "convertRect:toView:", [(WKContentView *)self webView], v8, v9, v10, v11);
        if (v6 == 2) {
          return v12;
        }
        else {
          return v13;
        }
      }
    }
  }
  else
  {
    -[WKContentView convertSize:toView:](self, "convertSize:toView:", [(WKContentView *)self webView], 0.0, 40.0);
    return v14;
  }
  return result;
}

- (void)keyboardScrollViewAnimatorWillScroll:(id)a3
{
  BYTE5(self->_revealFocusedElementDeferrer.m_ptr) = 1;
  [(WKContentView *)self willStartZoomOrScroll];
}

- (void)keyboardScrollViewAnimatorDidFinishScrolling:(id)a3
{
  BYTE5(self->_revealFocusedElementDeferrer.m_ptr) = 0;
}

- (BOOL)isKeyboardScrollingAnimationRunning
{
  return BYTE5(self->_revealFocusedElementDeferrer.m_ptr);
}

- (void)_executeEditCommand:(id)a3
{
}

- (void)_executeEditCommand:(id)a3 notifyDelegate:(BOOL)a4
{
  BYTE4(self->_dataListSuggestionsControl.m_weakReference) = 1;
  if (a4) {
    [(WKContentView *)self _internalBeginSelectionChange];
  }
  id m_ptr = self->_page.m_ptr;
  MEMORY[0x19972EAD0](&v15, a3);
  double v14 = 0;
  CFRetain(self);
  uint64_t v8 = WTF::fastMalloc((WTF *)0x18);
  *(void *)uint64_t v8 = &unk_1EEA0F080;
  *(void *)(v8 + 8) = self;
  *(unsigned char *)(v8 + 16) = a4;
  uint64_t v13 = v8;
  WebKit::WebPageProxy::executeEditCommand((uint64_t)m_ptr, &v15, &v14, &v13);
  uint64_t v10 = v13;
  uint64_t v13 = 0;
  if (v10) {
    (*(void (**)(uint64_t))(*(void *)v10 + 8))(v10);
  }
  double v11 = v14;
  double v14 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2) {
      WTF::StringImpl::destroy(v11, v9);
    }
    else {
      *(_DWORD *)v11 -= 2;
    }
  }
  double v12 = v15;
  float v15 = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2) {
      WTF::StringImpl::destroy(v12, v9);
    }
    else {
      *(_DWORD *)v12 -= 2;
    }
  }
}

- (void)_deleteByWord
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    double v3 = qword_1EB3586B8;
    if (os_log_type_enabled((os_log_t)qword_1EB3586B8, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315138;
      CFTypeRef v5 = "-[WKContentView(WKInteraction) _deleteByWord]";
      _os_log_error_impl(&dword_1985F2000, v3, OS_LOG_TYPE_ERROR, "Received unexpected call to %s", (uint8_t *)&v4, 0xCu);
    }
    __break(0xC471u);
    JUMPOUT(0x19944B53CLL);
  }

  [(WKContentView *)self _executeEditCommand:@"deleteWordBackward"];
}

- (void)_deleteForwardByWord
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    double v3 = qword_1EB3586B8;
    if (os_log_type_enabled((os_log_t)qword_1EB3586B8, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315138;
      CFTypeRef v5 = "-[WKContentView(WKInteraction) _deleteForwardByWord]";
      _os_log_error_impl(&dword_1985F2000, v3, OS_LOG_TYPE_ERROR, "Received unexpected call to %s", (uint8_t *)&v4, 0xCu);
    }
    __break(0xC471u);
    JUMPOUT(0x19944B628);
  }

  [(WKContentView *)self _executeEditCommand:@"deleteWordForward"];
}

- (void)_deleteToStartOfLine
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    double v3 = qword_1EB3586B8;
    if (os_log_type_enabled((os_log_t)qword_1EB3586B8, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315138;
      CFTypeRef v5 = "-[WKContentView(WKInteraction) _deleteToStartOfLine]";
      _os_log_error_impl(&dword_1985F2000, v3, OS_LOG_TYPE_ERROR, "Received unexpected call to %s", (uint8_t *)&v4, 0xCu);
    }
    __break(0xC471u);
    JUMPOUT(0x19944B714);
  }

  [(WKContentView *)self _executeEditCommand:@"deleteToBeginningOfLine"];
}

- (void)_deleteToEndOfLine
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    double v3 = qword_1EB3586B8;
    if (os_log_type_enabled((os_log_t)qword_1EB3586B8, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315138;
      CFTypeRef v5 = "-[WKContentView(WKInteraction) _deleteToEndOfLine]";
      _os_log_error_impl(&dword_1985F2000, v3, OS_LOG_TYPE_ERROR, "Received unexpected call to %s", (uint8_t *)&v4, 0xCu);
    }
    __break(0xC471u);
    JUMPOUT(0x19944B800);
  }

  [(WKContentView *)self _executeEditCommand:@"deleteToEndOfLine"];
}

- (void)_deleteForwardAndNotify:(BOOL)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    int v4 = qword_1EB3586B8;
    if (os_log_type_enabled((os_log_t)qword_1EB3586B8, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      uint64_t v6 = "-[WKContentView(WKInteraction) _deleteForwardAndNotify:]";
      _os_log_error_impl(&dword_1985F2000, v4, OS_LOG_TYPE_ERROR, "Received unexpected call to %s", (uint8_t *)&v5, 0xCu);
    }
    __break(0xC471u);
    JUMPOUT(0x19944B8ECLL);
  }

  [(WKContentView *)self _executeEditCommand:@"deleteForward"];
}

- (void)_deleteToEndOfParagraph
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    double v3 = qword_1EB3586B8;
    if (os_log_type_enabled((os_log_t)qword_1EB3586B8, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315138;
      int v5 = "-[WKContentView(WKInteraction) _deleteToEndOfParagraph]";
      _os_log_error_impl(&dword_1985F2000, v3, OS_LOG_TYPE_ERROR, "Received unexpected call to %s", (uint8_t *)&v4, 0xCu);
    }
    __break(0xC471u);
    JUMPOUT(0x19944B9D8);
  }

  [(WKContentView *)self _executeEditCommand:@"deleteToEndOfParagraph"];
}

- (void)_transpose
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    double v3 = qword_1EB3586B8;
    if (os_log_type_enabled((os_log_t)qword_1EB3586B8, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315138;
      int v5 = "-[WKContentView(WKInteraction) _transpose]";
      _os_log_error_impl(&dword_1985F2000, v3, OS_LOG_TYPE_ERROR, "Received unexpected call to %s", (uint8_t *)&v4, 0xCu);
    }
    __break(0xC471u);
    JUMPOUT(0x19944BABCLL);
  }

  [(WKContentView *)self transposeCharactersAroundSelection];
}

- (id)_moveUp:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    uint64_t v8 = qword_1EB3586B8;
    if (os_log_type_enabled((os_log_t)qword_1EB3586B8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315138;
      uint64_t v10 = "-[WKContentView(WKInteraction) _moveUp:withHistory:]";
      _os_log_error_impl(&dword_1985F2000, v8, OS_LOG_TYPE_ERROR, "Received unexpected call to %s", (uint8_t *)&v9, 0xCu);
    }
    __break(0xC471u);
    JUMPOUT(0x19944BBB4);
  }
  if (v4) {
    uint64_t v6 = @"moveUpAndModifySelection";
  }
  else {
    uint64_t v6 = @"moveUp";
  }
  [(WKContentView *)self _executeEditCommand:v6];
  return 0;
}

- (id)_moveDown:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    uint64_t v8 = qword_1EB3586B8;
    if (os_log_type_enabled((os_log_t)qword_1EB3586B8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315138;
      uint64_t v10 = "-[WKContentView(WKInteraction) _moveDown:withHistory:]";
      _os_log_error_impl(&dword_1985F2000, v8, OS_LOG_TYPE_ERROR, "Received unexpected call to %s", (uint8_t *)&v9, 0xCu);
    }
    __break(0xC471u);
    JUMPOUT(0x19944BCACLL);
  }
  if (v4) {
    uint64_t v6 = @"moveDownAndModifySelection";
  }
  else {
    uint64_t v6 = @"moveDown";
  }
  [(WKContentView *)self _executeEditCommand:v6];
  return 0;
}

- (id)_moveLeft:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    uint64_t v8 = qword_1EB3586B8;
    if (os_log_type_enabled((os_log_t)qword_1EB3586B8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315138;
      uint64_t v10 = "-[WKContentView(WKInteraction) _moveLeft:withHistory:]";
      _os_log_error_impl(&dword_1985F2000, v8, OS_LOG_TYPE_ERROR, "Received unexpected call to %s", (uint8_t *)&v9, 0xCu);
    }
    __break(0xC471u);
    JUMPOUT(0x19944BDA4);
  }
  if (v4) {
    uint64_t v6 = @"moveLeftAndModifySelection";
  }
  else {
    uint64_t v6 = @"moveLeft";
  }
  [(WKContentView *)self _executeEditCommand:v6];
  return 0;
}

- (id)_moveRight:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    uint64_t v8 = qword_1EB3586B8;
    if (os_log_type_enabled((os_log_t)qword_1EB3586B8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315138;
      uint64_t v10 = "-[WKContentView(WKInteraction) _moveRight:withHistory:]";
      _os_log_error_impl(&dword_1985F2000, v8, OS_LOG_TYPE_ERROR, "Received unexpected call to %s", (uint8_t *)&v9, 0xCu);
    }
    __break(0xC471u);
    JUMPOUT(0x19944BE9CLL);
  }
  if (v4) {
    uint64_t v6 = @"moveRightAndModifySelection";
  }
  else {
    uint64_t v6 = @"moveRight";
  }
  [(WKContentView *)self _executeEditCommand:v6];
  return 0;
}

- (id)_moveToStartOfWord:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    uint64_t v8 = qword_1EB3586B8;
    if (os_log_type_enabled((os_log_t)qword_1EB3586B8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315138;
      uint64_t v10 = "-[WKContentView(WKInteraction) _moveToStartOfWord:withHistory:]";
      _os_log_error_impl(&dword_1985F2000, v8, OS_LOG_TYPE_ERROR, "Received unexpected call to %s", (uint8_t *)&v9, 0xCu);
    }
    __break(0xC471u);
    JUMPOUT(0x19944BF94);
  }
  if (v4) {
    uint64_t v6 = @"moveWordBackwardAndModifySelection";
  }
  else {
    uint64_t v6 = @"moveWordBackward";
  }
  [(WKContentView *)self _executeEditCommand:v6];
  return 0;
}

- (id)_moveToStartOfParagraph:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    int v9 = qword_1EB3586B8;
    if (os_log_type_enabled((os_log_t)qword_1EB3586B8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315138;
      uint64_t v11 = "-[WKContentView(WKInteraction) _moveToStartOfParagraph:withHistory:]";
      _os_log_error_impl(&dword_1985F2000, v9, OS_LOG_TYPE_ERROR, "Received unexpected call to %s", (uint8_t *)&v10, 0xCu);
    }
    __break(0xC471u);
    JUMPOUT(0x19944C0ACLL);
  }
  if (v4) {
    uint64_t v6 = @"moveBackwardAndModifySelection";
  }
  else {
    uint64_t v6 = @"moveBackward";
  }
  if (v4) {
    uint64_t v7 = @"moveToBeginningOfParagraphAndModifySelection";
  }
  else {
    uint64_t v7 = @"moveToBeginningOfParagraph";
  }
  [(WKContentView *)self _executeEditCommand:v6];
  [(WKContentView *)self _executeEditCommand:v7];
  return 0;
}

- (id)_moveToStartOfLine:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    uint64_t v8 = qword_1EB3586B8;
    if (os_log_type_enabled((os_log_t)qword_1EB3586B8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315138;
      int v10 = "-[WKContentView(WKInteraction) _moveToStartOfLine:withHistory:]";
      _os_log_error_impl(&dword_1985F2000, v8, OS_LOG_TYPE_ERROR, "Received unexpected call to %s", (uint8_t *)&v9, 0xCu);
    }
    __break(0xC471u);
    JUMPOUT(0x19944C1A4);
  }
  if (v4) {
    uint64_t v6 = @"moveToBeginningOfLineAndModifySelection";
  }
  else {
    uint64_t v6 = @"moveToBeginningOfLine";
  }
  [(WKContentView *)self _executeEditCommand:v6];
  return 0;
}

- (id)_moveToStartOfDocument:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    uint64_t v8 = qword_1EB3586B8;
    if (os_log_type_enabled((os_log_t)qword_1EB3586B8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315138;
      int v10 = "-[WKContentView(WKInteraction) _moveToStartOfDocument:withHistory:]";
      _os_log_error_impl(&dword_1985F2000, v8, OS_LOG_TYPE_ERROR, "Received unexpected call to %s", (uint8_t *)&v9, 0xCu);
    }
    __break(0xC471u);
    JUMPOUT(0x19944C29CLL);
  }
  if (v4) {
    uint64_t v6 = @"moveToBeginningOfDocumentAndModifySelection";
  }
  else {
    uint64_t v6 = @"moveToBeginningOfDocument";
  }
  [(WKContentView *)self _executeEditCommand:v6];
  return 0;
}

- (id)_moveToEndOfWord:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    uint64_t v8 = qword_1EB3586B8;
    if (os_log_type_enabled((os_log_t)qword_1EB3586B8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315138;
      int v10 = "-[WKContentView(WKInteraction) _moveToEndOfWord:withHistory:]";
      _os_log_error_impl(&dword_1985F2000, v8, OS_LOG_TYPE_ERROR, "Received unexpected call to %s", (uint8_t *)&v9, 0xCu);
    }
    __break(0xC471u);
    JUMPOUT(0x19944C394);
  }
  if (v4) {
    uint64_t v6 = @"moveWordForwardAndModifySelection";
  }
  else {
    uint64_t v6 = @"moveWordForward";
  }
  [(WKContentView *)self _executeEditCommand:v6];
  return 0;
}

- (id)_moveToEndOfParagraph:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    int v9 = qword_1EB3586B8;
    if (os_log_type_enabled((os_log_t)qword_1EB3586B8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315138;
      uint64_t v11 = "-[WKContentView(WKInteraction) _moveToEndOfParagraph:withHistory:]";
      _os_log_error_impl(&dword_1985F2000, v9, OS_LOG_TYPE_ERROR, "Received unexpected call to %s", (uint8_t *)&v10, 0xCu);
    }
    __break(0xC471u);
    JUMPOUT(0x19944C4ACLL);
  }
  if (v4) {
    uint64_t v6 = @"moveForwardAndModifySelection";
  }
  else {
    uint64_t v6 = @"moveForward";
  }
  if (v4) {
    uint64_t v7 = @"moveToEndOfParagraphAndModifySelection";
  }
  else {
    uint64_t v7 = @"moveToEndOfParagraph";
  }
  [(WKContentView *)self _executeEditCommand:v6];
  [(WKContentView *)self _executeEditCommand:v7];
  return 0;
}

- (id)_moveToEndOfLine:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    uint64_t v8 = qword_1EB3586B8;
    if (os_log_type_enabled((os_log_t)qword_1EB3586B8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315138;
      int v10 = "-[WKContentView(WKInteraction) _moveToEndOfLine:withHistory:]";
      _os_log_error_impl(&dword_1985F2000, v8, OS_LOG_TYPE_ERROR, "Received unexpected call to %s", (uint8_t *)&v9, 0xCu);
    }
    __break(0xC471u);
    JUMPOUT(0x19944C5A4);
  }
  if (v4) {
    uint64_t v6 = @"moveToEndOfLineAndModifySelection";
  }
  else {
    uint64_t v6 = @"moveToEndOfLine";
  }
  [(WKContentView *)self _executeEditCommand:v6];
  return 0;
}

- (id)_moveToEndOfDocument:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    uint64_t v8 = qword_1EB3586B8;
    if (os_log_type_enabled((os_log_t)qword_1EB3586B8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315138;
      int v10 = "-[WKContentView(WKInteraction) _moveToEndOfDocument:withHistory:]";
      _os_log_error_impl(&dword_1985F2000, v8, OS_LOG_TYPE_ERROR, "Received unexpected call to %s", (uint8_t *)&v9, 0xCu);
    }
    __break(0xC471u);
    JUMPOUT(0x19944C69CLL);
  }
  if (v4) {
    uint64_t v6 = @"moveToEndOfDocumentAndModifySelection";
  }
  else {
    uint64_t v6 = @"moveToEndOfDocument";
  }
  [(WKContentView *)self _executeEditCommand:v6];
  return 0;
}

- (void)setBottomBufferHeight:(double)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    double v3 = qword_1EB3586B8;
    if (os_log_type_enabled((os_log_t)qword_1EB3586B8, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315138;
      int v5 = "-[WKContentView(WKInteraction) setBottomBufferHeight:]";
      _os_log_error_impl(&dword_1985F2000, v3, OS_LOG_TYPE_ERROR, "Received unexpected call to %s", (uint8_t *)&v4, 0xCu);
    }
    __break(0xC471u);
    JUMPOUT(0x19944C768);
  }
}

- (id)automaticallySelectedOverlay
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    int v4 = qword_1EB3586B8;
    if (os_log_type_enabled((os_log_t)qword_1EB3586B8, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      uint64_t v6 = "-[WKContentView(WKInteraction) automaticallySelectedOverlay]";
      _os_log_error_impl(&dword_1985F2000, v4, OS_LOG_TYPE_ERROR, "Received unexpected call to %s", (uint8_t *)&v5, 0xCu);
    }
    __break(0xC471u);
    JUMPOUT(0x19944C84CLL);
  }

  return [(WKContentView *)self unscaledView];
}

- (int64_t)selectionGranularity
{
  return 0;
}

- (unsigned)characterBeforeCaretSelection
{
  return 0;
}

- (id)wordContainingCaretSelection
{
  return 0;
}

- (id)wordRangeContainingCaretSelection
{
  return 0;
}

- (BOOL)hasContent
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    int v4 = qword_1EB3586B8;
    if (os_log_type_enabled((os_log_t)qword_1EB3586B8, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      uint64_t v6 = "-[WKContentView(WKInteraction) hasContent]";
      _os_log_error_impl(&dword_1985F2000, v4, OS_LOG_TYPE_ERROR, "Received unexpected call to %s", (uint8_t *)&v5, 0xCu);
    }
    __break(0xC471u);
    JUMPOUT(0x19944C95CLL);
  }

  return [(WKContentView *)self _hasContent];
}

- (BOOL)_hasContent
{
  double v2 = (unsigned char *)*((void *)self->_page.m_ptr + 4);
  if (v2[249]) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = v2[576] == 0;
  }
  return !v3 && v2[361] != 0;
}

- (void)selectAll
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    double v2 = qword_1EB3586B8;
    if (os_log_type_enabled((os_log_t)qword_1EB3586B8, OS_LOG_TYPE_ERROR))
    {
      int v3 = 136315138;
      int v4 = "-[WKContentView(WKInteraction) selectAll]";
      _os_log_error_impl(&dword_1985F2000, v2, OS_LOG_TYPE_ERROR, "Received unexpected call to %s", (uint8_t *)&v3, 0xCu);
    }
    __break(0xC471u);
    JUMPOUT(0x19944CA64);
  }
}

- (BOOL)hasSelection
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    int v3 = qword_1EB3586B8;
    if (os_log_type_enabled((os_log_t)qword_1EB3586B8, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315138;
      uint64_t v5 = "-[WKContentView(WKInteraction) hasSelection]";
      _os_log_error_impl(&dword_1985F2000, v3, OS_LOG_TYPE_ERROR, "Received unexpected call to %s", (uint8_t *)&v4, 0xCu);
    }
    __break(0xC471u);
    JUMPOUT(0x19944CB34);
  }
  return 0;
}

- (BOOL)isPosition:(id)a3 atBoundary:(int64_t)a4 inDirection:(int64_t)a5
{
  if (a4 != 3 || !*(unsigned char *)(*((void *)self->_page.m_ptr + 4) + 576)) {
    goto LABEL_8;
  }
  if (!a5)
  {
    int v6 = objc_msgSend(a3, "isEqual:", -[UITextRange end](-[WKContentView selectedTextRange](self, "selectedTextRange"), "end"));
    if (!v6) {
      return v6;
    }
    uint64_t v9 = *((void *)self->_page.m_ptr + 4);
    if (*(unsigned char *)(v9 + 576))
    {
      int v8 = *(unsigned __int8 *)(v9 + 379);
      goto LABEL_13;
    }
LABEL_14:
    __break(1u);
    return v6;
  }
  if (a5 != 1)
  {
LABEL_8:
    LOBYTE(v6) = 0;
    return v6;
  }
  int v6 = objc_msgSend(a3, "isEqual:", -[UITextRange start](-[WKContentView selectedTextRange](self, "selectedTextRange"), "start"));
  if (!v6) {
    return v6;
  }
  uint64_t v7 = *((void *)self->_page.m_ptr + 4);
  if (!*(unsigned char *)(v7 + 576)) {
    goto LABEL_14;
  }
  int v8 = *(unsigned __int8 *)(v7 + 378);
LABEL_13:
  LOBYTE(v6) = v8 != 0;
  return v6;
}

- (id)positionFromPosition:(id)a3 toBoundary:(int64_t)a4 inDirection:(int64_t)a5
{
  return 0;
}

- (BOOL)isPosition:(id)a3 withinTextUnit:(int64_t)a4 inDirection:(int64_t)a5
{
  return 0;
}

- (id)rangeEnclosingPosition:(id)a3 withGranularity:(int64_t)a4 inDirection:(int64_t)a5
{
  return 0;
}

- (void)takeTraitsFrom:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    int v6 = qword_1EB3586B8;
    if (os_log_type_enabled((os_log_t)qword_1EB3586B8, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315138;
      int v8 = "-[WKContentView(WKInteraction) takeTraitsFrom:]";
      _os_log_error_impl(&dword_1985F2000, v6, OS_LOG_TYPE_ERROR, "Received unexpected call to %s", (uint8_t *)&v7, 0xCu);
    }
    __break(0xC471u);
    JUMPOUT(0x19944CD0CLL);
  }
  id v5 = [(WKContentView *)self textInputTraits];

  [v5 takeTraitsFrom:a3];
}

- (void)_showKeyboard
{
  [(WKContentView *)self setUpTextSelectionAssistant];
  if ([(WKContentView *)self isFirstResponder]
    && !self->_suppressSelectionAssistantReasons.m_storage)
  {
    [self->_textInteractionWrapper.m_ptr activateSelection];
  }

  [(WKContentView *)self reloadInputViews];
}

- (void)_hideKeyboard
{
  BOOL usingGestureForSelection = self->_usingGestureForSelection;
  self->_BOOL usingGestureForSelection = 1;
  [(WKContentView *)self setInputDelegate:0];
  [(WKContentView *)self setUpTextSelectionAssistant];
  [self->_textInteractionWrapper.m_ptr deactivateSelection];
  [self->_formAccessoryView.m_ptr hideAutoFillButton];
  [(WKContentView *)self reloadInputViews];
  if (self->_formAccessoryView.m_ptr) {
    [(WKContentView *)self _updateAccessory];
  }
  self->_BOOL usingGestureForSelection = usingGestureForSelection;
}

- (BOOL)_formControlRefreshEnabled
{
  return self->_page.m_ptr != 0;
}

- (const)focusedElementInformation
{
  return &self->_focusedElementInformation;
}

- (void)focusedSelectElementOptions
{
  return &self->_anon_938[128];
}

- (BOOL)_shouldShowKeyboardForElement:(const void *)a3
{
  return *((unsigned char *)a3 + 186) != 1
      && -[WKContentView _shouldShowKeyboardForElementIgnoringInputMode:](self, "_shouldShowKeyboardForElementIgnoringInputMode:");
}

- (BOOL)_shouldShowKeyboardForElementIgnoringInputMode:(const void *)a3
{
  return *((unsigned __int8 *)a3 + 185) - 1 < 0xA
      || -[WKContentView _elementTypeRequiresAccessoryView:](self, "_elementTypeRequiresAccessoryView:");
}

- (void)startDeferringInputViewUpdates:(OptionSet<WebKit::InputViewUpdateDeferralSource>)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BOOL engaged = self->_lastOutstandingPositionInformationRequest.__engaged_;
  if (!engaged)
  {
    int v6 = qword_1EB358690;
    if (os_log_type_enabled((os_log_t)qword_1EB358690, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109120;
      v7[1] = a3.m_storage;
      _os_log_impl(&dword_1985F2000, v6, OS_LOG_TYPE_DEFAULT, "Started deferring input view updates (%02x)", (uint8_t *)v7, 8u);
    }
    [(WKContentView *)self _beginPinningInputViews];
    BOOL engaged = self->_lastOutstandingPositionInformationRequest.__engaged_;
  }
  self->_lastOutstandingPositionInformationRequest.__engaged_ = engaged | a3.m_storage;
}

- (void)stopDeferringInputViewUpdates:(OptionSet<WebKit::InputViewUpdateDeferralSource>)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL engaged = self->_lastOutstandingPositionInformationRequest.__engaged_;
  if ((engaged & a3.m_storage) != 0)
  {
    int v6 = engaged & (a3.m_storage ^ 0xFF);
    self->_lastOutstandingPositionInformationRequest.__engaged_ = v6;
    if (!v6)
    {
      [(WKContentView *)self _cancelPreviousResetInputViewDeferralRequest];
      int v7 = qword_1EB358690;
      if (os_log_type_enabled((os_log_t)qword_1EB358690, OS_LOG_TYPE_DEFAULT))
      {
        v8[0] = 67109120;
        v8[1] = a3.m_storage;
        _os_log_impl(&dword_1985F2000, v7, OS_LOG_TYPE_DEFAULT, "Stopped deferring input view updates (%02x)", (uint8_t *)v8, 8u);
      }
      [(WKContentView *)self _endPinningInputViews];
    }
  }
}

- (void)stopDeferringInputViewUpdatesForAllSources
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  BOOL engaged = self->_lastOutstandingPositionInformationRequest.__engaged_;
  if (self->_lastOutstandingPositionInformationRequest.__engaged_)
  {
    int v4 = qword_1EB358690;
    if (os_log_type_enabled((os_log_t)qword_1EB358690, OS_LOG_TYPE_DEFAULT))
    {
      v5[0] = 67109120;
      v5[1] = engaged;
      _os_log_impl(&dword_1985F2000, v4, OS_LOG_TYPE_DEFAULT, "Stopped deferring all input view updates (%02x)", (uint8_t *)v5, 8u);
    }
    [(WKContentView *)self _cancelPreviousResetInputViewDeferralRequest];
    self->_lastOutstandingPositionInformationRequest.__engaged_ = 0;
    [(WKContentView *)self _endPinningInputViews];
  }
}

- (void)_elementDidFocus:(const void *)a3 userIsInteracting:(BOOL)a4 blurPreviousNode:(BOOL)a5 activityStateChanges:(OptionSet<WebCore:(id)a7 :ActivityState>)a6 userObject:
{
  BOOL v9 = a5;
  BOOL v10 = a4;
  uint64_t v73 = self;
  BOOL v13 = [(WKContentView *)self _hasFocusedElement];
  BOOL isTapHighlightFading = self->_isTapHighlightFading;
  self->_BOOL isTapHighlightFading = v13;
  BOOL v14 = [(WKContentView *)self _shouldShowKeyboardForElement:a3];
  BOOL potentialTapInProgress = self->_potentialTapInProgress;
  self->_BOOL potentialTapInProgress = v14;
  EditingRange v71 = &v73;
  BYTE4(self->_dataListSuggestionsControl.m_weakReference) = 1;
  char v72 = 1;
  BYTE6(self->_dataListTextSuggestions.m_ptr) = BYTE5(self->_dataListTextSuggestions.m_ptr);
  float v15 = (void *)[objc_loadWeak(&self->_webView.m_weakReference) _inputDelegate];
  uint64_t v16 = [[WKFocusedElementInfo alloc] initWithFocusedElementInformation:a3 isUserInitiated:v10 userObject:a7];
  if (objc_opt_respondsToSelector())
  {
    if (objc_msgSend(v15, "_webView:focusShouldStartInputSession:", -[WKContentView webView](v73, "webView"), v16))uint64_t v17 = 1; {
    else
    }
      uint64_t v17 = 2;
  }
  else
  {
    uint64_t v17 = 0;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v17 = objc_msgSend(v15, "_webView:decidePolicyForFocusedElement:", -[WKContentView webView](v73, "webView"), v16);
  }
  BOOL v18 = v17 != 2
     && (v17 == 1
      || !v17
      && (v10
       || (([(WKContentView *)v73 isFirstResponder] & 1) != 0 || v73->_isEditable)
       && ((a6.var0 | 2) != 2
        || v73->_isTapHighlightFading
        || -[WKContentView _shouldShowKeyboardForElementIgnoringInputMode:](v73, "_shouldShowKeyboardForElementIgnoringInputMode:", a3)&& ([MEMORY[0x1E4F42B08] isInHardwareKeyboardMode] & 1) != 0)));
  if (*((unsigned char *)a3 + 367) && !v73->_potentialTapInProgress) {
    BOOL v18 = 0;
  }
  if (v9)
  {
    [(WKContentView *)v73 startDeferringInputViewUpdates:4];
    [(WKContentView *)v73 _elementDidBlur];
  }
  if (!v18)
  {
    int v19 = v73;
    goto LABEL_34;
  }
  int v19 = v73;
  if (!*((unsigned char *)a3 + 185))
  {
LABEL_34:
    id m_ptr = v19->_page.m_ptr;
    uint64_t v23 = *((void *)m_ptr + 32);
    LOBYTE(v70) = 0;
    WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::SetIsShowingInputViewForFocusedElement>(v23, (char *)&v70, *(void *)(*((void *)m_ptr + 4) + 1928), 0);
    goto LABEL_92;
  }
  double v20 = v73->_page.m_ptr;
  uint64_t v21 = *((void *)v20 + 32);
  LOBYTE(v70) = 1;
  WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::SetIsShowingInputViewForFocusedElement>(v21, (char *)&v70, *(void *)(*((void *)v20 + 4) + 1928), 0);
  if ([(WKContentView *)v73 _hasFocusedElement]
    && WebCore::ElementContext::isSameElement((WebCore::ElementContext *)&v73->_focusedElementInformation.elementContext, (const ElementContext *)((char *)a3 + 16)))
  {
    if (v73->_inputPeripheral.m_ptr)
    {
      if (([(WKContentView *)v73 isFirstResponder] & 1) == 0) {
        [(WKContentView *)v73 becomeFirstResponder];
      }
      [(WKContentView *)v73 accessoryOpen];
    }
    goto LABEL_92;
  }
  [objc_loadWeak(&v73->_webView.m_weakReference) _resetFocusPreservationCount];
  v73->_textInteractionDidChangeFocusedElement = 0;
  int value = v73->_domPasteRequestHandler.m_function.m_callableWrapper.__ptr_.__value_;
  v73->_domPasteRequestHandler.m_function.m_callableWrapper.__ptr_.__value_ = 0;
  if (value) {
    CFRelease(value);
  }
  if (objc_opt_respondsToSelector())
  {
    char v25 = objc_msgSend(v15, "_webView:focusRequiresStrongPasswordAssistance:", -[WKContentView webView](v73, "webView"), v16);
    v73->_textInteractionDidChangeFocusedElement = v25;
  }
  char v26 = objc_opt_respondsToSelector();
  unsigned int v27 = v73;
  if (v26)
  {
    uint64_t v28 = objc_msgSend(v15, "_webViewAdditionalContextForStrongPasswordAssistance:", -[WKContentView webView](v73, "webView"));
    uint64_t v29 = v28;
    double v30 = v73;
    if (v28) {
      CFRetain(v28);
    }
    double v31 = v30->_domPasteRequestHandler.m_function.m_callableWrapper.__ptr_.__value_;
    v30->_domPasteRequestHandler.m_function.m_callableWrapper.__ptr_.__value_ = v29;
    if (!v31) {
      goto LABEL_46;
    }
  }
  else
  {
    double v32 = (void *)MEMORY[0x1E4F1CC08];
    CFRetain(MEMORY[0x1E4F1CC08]);
    double v31 = v27->_domPasteRequestHandler.m_function.m_callableWrapper.__ptr_.__value_;
    v27->_domPasteRequestHandler.m_function.m_callableWrapper.__ptr_.__value_ = v32;
    if (!v31) {
      goto LABEL_46;
    }
  }
  CFRelease(v31);
LABEL_46:
  int v33 = objc_opt_respondsToSelector();
  int v66 = objc_opt_respondsToSelector();
  if ((v33 | v66))
  {
    [v73->_formInputSession.m_ptr invalidate];
    unint64_t v34 = [WKFormInputSession alloc];
    uint64_t v35 = [(WKFormInputSession *)v34 initWithContentView:v73 focusedElementInfo:v16 requiresStrongPasswordAssistance:v73->_textInteractionDidChangeFocusedElement];
    double v36 = v73->_formInputSession.m_ptr;
    v73->_formInputSession.id m_ptr = (void *)v35;
    if (v36) {
      CFRelease(v36);
    }
  }
  if (v33)
  {
    uint64_t v37 = [(WKContentView *)v73 webView];
    [v15 _webView:v37 willStartInputSession:v73->_formInputSession.m_ptr];
  }
  unsigned int v67 = *((unsigned __int8 *)a3 + 185) - 1;
  BOOL v65 = [(WKContentView *)v73 setIsEditable:v67 < 0xA];
  p_focusedElementInformation = &v73->_focusedElementInformation;
  ProcessQualified<WTF::UUID> v39 = (ProcessQualified<WTF::UUID>)*((_OWORD *)a3 + 3);
  IntRect v41 = *(IntRect *)a3;
  FloatRect v40 = (FloatRect)*((_OWORD *)a3 + 1);
  *(_OWORD *)&v73->_focusedElementInformation.elementContext.webPageIdentifier.m_value.unint64_t m_identifier = *((_OWORD *)a3 + 2);
  *(ProcessQualified<WTF::UUID> *)((char *)&p_focusedElementInformation->elementContext.documentIdentifier + 8) = v39;
  p_focusedElementInformation->interactionRect = v41;
  p_focusedElementInformation->elementContext.FloatRect boundingRect = v40;
  ProcessQualified<WTF::UUID> v42 = (ProcessQualified<WTF::UUID>)*((_OWORD *)a3 + 7);
  long long v44 = *((_OWORD *)a3 + 4);
  long long v43 = *((_OWORD *)a3 + 5);
  *(_OWORD *)&p_focusedElementInformation[1].elementContext.boundingRect.m_size.float m_width = *((_OWORD *)a3 + 6);
  p_focusedElementInformation[1].elementContext.documentIdentifier = v42;
  *(_OWORD *)&p_focusedElementInformation->elementIdentifier.m_value.unint64_t m_identifier = v44;
  *(_OWORD *)&p_focusedElementInformation[1].interactionRect.m_size.float m_width = v43;
  IntRect v46 = (IntRect)*((_OWORD *)a3 + 9);
  FloatRect v45 = (FloatRect)*((_OWORD *)a3 + 10);
  long long v47 = *((_OWORD *)a3 + 8);
  *(_OWORD *)&p_focusedElementInformation[2].elementContext.boundingRect.m_size.float m_height = *(_OWORD *)((char *)a3 + 172);
  p_focusedElementInformation[2].interactionRect = v46;
  p_focusedElementInformation[2].elementContext.FloatRect boundingRect = v45;
  *(_OWORD *)&p_focusedElementInformation[1].elementContext.m_processIdentifier.unint64_t m_identifier = v47;
  WTF::String::operator=((uint64_t *)&p_focusedElementInformation[2].elementContext.documentIdentifier.m_object[8], (WTF::StringImpl **)a3 + 24);
  WTF::Vector<WebKit::OptionItem,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::operator=((uint64_t)&p_focusedElementInformation[2].elementContext.m_processIdentifier, (uint64_t *)a3 + 25);
  p_focusedElementInformation[3].interactionRect.m_location.m_double x = *((_DWORD *)a3 + 54);
  WTF::String::operator=((uint64_t *)&p_focusedElementInformation[3].interactionRect.m_size, (WTF::StringImpl **)a3 + 28);
  p_focusedElementInformation[3].elementContext.boundingRect.FloatPoint m_location = (FloatPoint)*((void *)a3 + 29);
  WTF::String::operator=((uint64_t *)&p_focusedElementInformation[3].elementContext.boundingRect.m_size, (WTF::StringImpl **)a3 + 30);
  LOWORD(p_focusedElementInformation[3].elementContext.webPageIdentifier.m_value.m_identifier) = *((_WORD *)a3 + 124);
  WTF::String::operator=((uint64_t *)&p_focusedElementInformation[3].elementContext.documentIdentifier, (WTF::StringImpl **)a3 + 32);
  ProcessQualified<WTF::UUID> v48 = *(ProcessQualified<WTF::UUID> *)((char *)a3 + 264);
  *(_OWORD *)&p_focusedElementInformation[3].elementIdentifier.m_value.unint64_t m_identifier = *(_OWORD *)((char *)a3 + 280);
  *(ProcessQualified<WTF::UUID> *)((char *)&p_focusedElementInformation[3].elementContext.documentIdentifier + 8) = v48;
  LOWORD(p_focusedElementInformation[4].interactionRect.m_size.m_width) = *((_WORD *)a3 + 148);
  WTF::String::operator=((uint64_t *)&p_focusedElementInformation[4].elementContext, (WTF::StringImpl **)a3 + 38);
  WTF::String::operator=((uint64_t *)&p_focusedElementInformation[4].elementContext.boundingRect.m_size, (WTF::StringImpl **)a3 + 39);
  WTF::String::operator=((uint64_t *)&p_focusedElementInformation[4].elementContext.webPageIdentifier, (WTF::StringImpl **)a3 + 40);
  *(_WORD *)p_focusedElementInformation[4].elementContext.documentIdentifier.m_object = *((_WORD *)a3 + 164);
  WebCore::Color::operator=();
  WTF::Vector<WebCore::Color,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::operator=((uint64_t)&p_focusedElementInformation[4].elementContext.m_processIdentifier, (uint64_t *)a3 + 43);
  IntRect v49 = *(IntRect *)((char *)a3 + 360);
  FloatRect v50 = *(FloatRect *)((char *)a3 + 376);
  long long v51 = *(_OWORD *)((char *)a3 + 392);
  *(void *)&p_focusedElementInformation[5].elementContext.documentIdentifier.m_object[8] = *((void *)a3 + 51);
  p_focusedElementInformation[5].elementContext.FloatRect boundingRect = v50;
  *(_OWORD *)&p_focusedElementInformation[5].elementContext.webPageIdentifier.m_value.unint64_t m_identifier = v51;
  p_focusedElementInformation[5].interactionRect = v49;
  uint64_t v52 = v73->_legacyTextInputTraits.m_ptr;
  v73->_legacyTextInputTraits.id m_ptr = 0;
  if (v52) {
    CFRelease(v52);
  }
  uint64_t v53 = v73->_extendedTextInputTraits.m_ptr;
  v73->_extendedTextInputTraits.id m_ptr = 0;
  if (v53) {
    CFRelease(v53);
  }
  if (([(WKContentView *)v73 isFirstResponder] & 1) == 0) {
    [(WKContentView *)v73 becomeFirstResponder];
  }
  int v54 = v73;
  if (v67 <= 9 && !v73->_suppressSelectionAssistantReasons.m_storage && (a6.var0 & 2) != 0)
  {
    BYTE2(v73->_dataListSuggestionsControl.m_weakReference) = 1;
    [v73->_textInteractionWrapper.m_ptr activateSelection];
    WebKit::WebPageProxy::restoreSelectionInFocusedEditableElement((uint64_t)v73->_page.m_ptr);
    WebKit::WebPageProxy::scheduleFullEditorStateUpdate((uint64_t)v73->_page.m_ptr);
    int v54 = v73;
  }
  unsigned __int8 v55 = v54->_anon_938[113] - 11;
  if (v55 <= 7u && ((0xBFu >> v55) & 1) != 0)
  {
    uint64_t v56 = [objc_alloc(*off_1E5814100[(char)v55]) initWithView:v54];
    int v54 = v73;
  }
  else
  {
    uint64_t v56 = 0;
  }
  uint64_t v57 = v54->_inputPeripheral.m_ptr;
  v54->_inputPeripheral.id m_ptr = (void *)v56;
  if (v57) {
    CFRelease(v57);
  }
  if (v67 > 9)
  {
    v73->_shouldRestoreSelection = 0;
    [(WKContentView *)v73 reloadInputViews];
  }
  else
  {
    v73->_shouldRestoreSelection = !v73->_isTapHighlightFading;
    [(WKContentView *)v73 _showKeyboard];
    if ((objc_msgSend((id)-[WKContentView window](v73, "window"), "isKeyWindow") & 1) == 0) {
      objc_msgSend((id)-[WKContentView window](v73, "window"), "makeKeyWindow");
    }
  }
  if (![MEMORY[0x1E4F42B08] activeKeyboard]) {
    v73->_shouldRestoreSelection = 0;
  }
  if (v65) {
    [objc_loadWeak(&v73->_webView.m_weakReference) _scheduleVisibleContentRectUpdate];
  }
  if (v67 > 9)
  {
    [(WKContentView *)v73 _zoomToRevealFocusedElement];
    uint64_t v60 = v73;
  }
  else
  {
    if ([MEMORY[0x1E4F42B08] usesInputSystemUI]
      && (uint64_t v58 = (void *)[MEMORY[0x1E4F42B08] activeKeyboard]) != 0)
    {
      char v59 = [v58 isMinimized];
    }
    else
    {
      char v59 = 1;
    }
    uint64_t v61 = v73;
    if (objc_msgSend(-[WKContentView _scroller](v73, "_scroller"), "_isFirstResponderKeyboardAvoidanceEnabled"))
    {
      if ((!v73->_shouldRestoreSelection & v59) != 0) {
        char v62 = 1;
      }
      else {
        char v62 = 3;
      }
    }
    else
    {
      char v62 = 5;
    }
    WebKit::RevealFocusedElementDeferrer::create(v61, v62, &v70);
    uint64_t v63 = *(void *)&v73->_actionsToPerformAfterEditorStateUpdate.m_capacity;
    *(void *)&v73->_actionsToPerformAfterEditorStateUpdate.m_capacitdouble y = v70;
    if (v63) {
      WTF::RefCounted<WebKit::RevealFocusedElementDeferrer>::deref(v63);
    }
    uint64_t v60 = v73;
    *((unsigned char *)v73->_page.m_ptr + 1104) = 1;
  }
  [(WKContentView *)v60 _updateAccessory];
  [v73->_inputPeripheral.m_ptr beginEditing];
  if (v66)
  {
    uint64_t v64 = [(WKContentView *)v73 webView];
    [v15 _webView:v64 didStartInputSession:v73->_formInputSession.m_ptr];
  }
  [objc_loadWeak(&v73->_webView.m_weakReference) didStartFormControlInteraction];
LABEL_92:
  if (v16) {
    CFRelease(v16);
  }
  [(WKContentView *)v73 stopDeferringInputViewUpdates:5];
  WTF::ScopeExit<-[WKContentView(WKInteraction) _elementDidFocus:userIsInteracting:blurPreviousNode:activityStateChanges:userObject:]::$_69>::~ScopeExit((uint64_t **)&v71);
  self->_BOOL potentialTapInProgress = potentialTapInProgress;
  self->_BOOL isTapHighlightFading = isTapHighlightFading;
}

- (void)_elementDidBlur
{
  BOOL isDoubleTapPending = self->_isDoubleTapPending;
  self->_BOOL isDoubleTapPending = 1;
  p_webView = &self->_webView;
  [objc_loadWeak(&self->_webView.m_weakReference) _resetFocusPreservationCount];
  [(WKContentView *)self _endEditing];
  [self->_formInputSession.m_ptr invalidate];
  id m_ptr = self->_formInputSession.m_ptr;
  self->_formInputSession.id m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  uint64_t v6 = *(const void **)&self->_inputViewUpdateDeferralSources.m_storage;
  *(void *)&self->_inputViewUpdateDeferralSources.m_storage = 0;
  if (v6) {
    CFRelease(v6);
  }
  int v7 = self->_keyboardScrollingAnimator.m_ptr;
  self->_keyboardScrollingAnimator.id m_ptr = 0;
  if (v7) {
    CFRelease(v7);
  }
  BOOL v8 = [(WKContentView *)self setIsEditable:0];
  self->_anon_938[113] = 0;
  self->_anon_938[289] = 0;
  *(_DWORD *)&self->_anon_938[292] = 0;
  self->_anon_938[296] = 0;
  BOOL v9 = self->_inputPeripheral.m_ptr;
  self->_inputPeripheral.id m_ptr = 0;
  if (v9) {
    CFRelease(v9);
  }
  self->_textInteractionDidChangeFocusedElement = 0;
  BYTE4(self->_dataListSuggestionsControl.m_weakReference) = 1;
  int value = self->_domPasteRequestHandler.m_function.m_callableWrapper.__ptr_.__value_;
  self->_domPasteRequestHandler.m_function.m_callableWrapper.__ptr_.__value_ = 0;
  if (value) {
    CFRelease(value);
  }
  self->_shouldRestoreSelection = 0;
  uint64_t v11 = *(void *)&self->_actionsToPerformAfterEditorStateUpdate.m_capacity;
  *(void *)&self->_actionsToPerformAfterEditorStateUpdate.m_capacitdouble y = 0;
  if (v11) {
    WTF::RefCounted<WebKit::RevealFocusedElementDeferrer>::deref(v11);
  }
  if (v8) {
    HIBYTE(self->_revealFocusedElementDeferrer.m_ptr) = 0;
  }
  [(WKContentView *)self _hideKeyboard];
  if (v8)
  {
    [objc_loadWeak(&p_webView->m_weakReference) _scheduleVisibleContentRectUpdate];
    [objc_loadWeak(&p_webView->m_weakReference) didEndFormControlInteraction];
    uint64_t v12 = self->_page.m_ptr;
    uint64_t v13 = *((void *)v12 + 32);
    char v14 = 0;
    WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::SetIsShowingInputViewForFocusedElement>(v13, &v14, *(void *)(*((void *)v12 + 4) + 1928), 0);
  }
  *((unsigned char *)self->_page.m_ptr + 1104) = 0;
  if (!self->_isTapHighlightFading) {
    BYTE6(self->_dataListTextSuggestions.m_ptr) = 0;
  }
  if (*((unsigned char *)&self->_domPasteRequestCategory + 4)) {
    *((unsigned char *)&self->_domPasteRequestCategory + 4) = 0;
  }
  self->_BOOL isDoubleTapPending = isDoubleTapPending;
}

- (void)_updateInputContextAfterBlurringAndRefocusingElement
{
  if ([(WKContentView *)self _hasFocusedElement]
    && self->_suppressSelectionAssistantReasons.m_storage)
  {
    if ([(WKContentView *)self shouldUseAsyncInteractions])
    {
      id Weak = objc_loadWeak((id *)&self->_anon_fb8[24]);
      id v4 = [(WKContentView *)self asBETextInput];
      [Weak invalidateTextEntryContextForTextInput:v4];
    }
    else
    {
      id v5 = (void *)[MEMORY[0x1E4F42B20] activeInstance];
      [v5 updateForChangedSelection];
    }
  }
}

- (void)_updateFocusedElementInformation:(const void *)a3
{
  if ([(WKContentView *)self _hasFocusedElement]
    && WebCore::ElementContext::isSameElement((WebCore::ElementContext *)&self->_focusedElementInformation.elementContext, (const ElementContext *)((char *)a3 + 16)))
  {
    IntRect v5 = *(IntRect *)a3;
    FloatRect v6 = (FloatRect)*((_OWORD *)a3 + 1);
    ProcessQualified<WTF::UUID> v7 = (ProcessQualified<WTF::UUID>)*((_OWORD *)a3 + 3);
    *(_OWORD *)&self->_focusedElementInformation.elementContext.webPageIdentifier.m_value.unint64_t m_identifier = *((_OWORD *)a3 + 2);
    *(ProcessQualified<WTF::UUID> *)((char *)&self->_focusedElementInformation.elementContext.documentIdentifier + 8) = v7;
    self->_focusedElementInformation.interactionRect = v5;
    self->_focusedElementInformation.elementContext.FloatRect boundingRect = v6;
    long long v8 = *((_OWORD *)a3 + 4);
    long long v9 = *((_OWORD *)a3 + 5);
    long long v10 = *((_OWORD *)a3 + 7);
    *(_OWORD *)&self->_anon_938[24] = *((_OWORD *)a3 + 6);
    *(_OWORD *)&self->_anon_938[40] = v10;
    *(_OWORD *)&self->_focusedElementInformation.elementIdentifier.m_value.unint64_t m_identifier = v8;
    *(_OWORD *)&self->_anon_938[8] = v9;
    long long v11 = *((_OWORD *)a3 + 8);
    long long v12 = *((_OWORD *)a3 + 9);
    long long v13 = *((_OWORD *)a3 + 10);
    *(_OWORD *)&self->_anon_938[100] = *(_OWORD *)((char *)a3 + 172);
    *(_OWORD *)&self->_anon_938[72] = v12;
    *(_OWORD *)&self->_anon_938[88] = v13;
    *(_OWORD *)&self->_anon_938[56] = v11;
    WTF::String::operator=((uint64_t *)&self->_anon_938[120], (WTF::StringImpl **)a3 + 24);
    WTF::Vector<WebKit::OptionItem,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::operator=((uint64_t)&self->_anon_938[128], (uint64_t *)a3 + 25);
    *(_DWORD *)&self->_anon_938[144] = *((_DWORD *)a3 + 54);
    WTF::String::operator=((uint64_t *)&self->_anon_938[152], (WTF::StringImpl **)a3 + 28);
    *(void *)&self->_anon_938[160] = *((void *)a3 + 29);
    WTF::String::operator=((uint64_t *)&self->_anon_938[168], (WTF::StringImpl **)a3 + 30);
    *(_WORD *)&self->_anon_938[176] = *((_WORD *)a3 + 124);
    WTF::String::operator=((uint64_t *)&self->_anon_938[184], (WTF::StringImpl **)a3 + 32);
    long long v14 = *(_OWORD *)((char *)a3 + 264);
    *(_OWORD *)&self->_anon_938[208] = *(_OWORD *)((char *)a3 + 280);
    *(_OWORD *)&self->_anon_938[192] = v14;
    *(_WORD *)&self->_anon_938[224] = *((_WORD *)a3 + 148);
    WTF::String::operator=((uint64_t *)&self->_anon_938[232], (WTF::StringImpl **)a3 + 38);
    WTF::String::operator=((uint64_t *)&self->_anon_938[240], (WTF::StringImpl **)a3 + 39);
    WTF::String::operator=((uint64_t *)&self->_anon_938[248], (WTF::StringImpl **)a3 + 40);
    *(_WORD *)&self->_anon_938[256] = *((_WORD *)a3 + 164);
    WebCore::Color::operator=();
    WTF::Vector<WebCore::Color,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::operator=((uint64_t)&self->_anon_938[272], (uint64_t *)a3 + 43);
    long long v15 = *(_OWORD *)((char *)a3 + 360);
    long long v16 = *(_OWORD *)((char *)a3 + 376);
    long long v17 = *(_OWORD *)((char *)a3 + 392);
    *(void *)&self->_anon_938[336] = *((void *)a3 + 51);
    *(_OWORD *)&self->_anon_938[304] = v16;
    *(_OWORD *)&self->_anon_938[320] = v17;
    *(_OWORD *)&self->_anon_938[288] = v15;
    id m_ptr = self->_inputPeripheral.m_ptr;
    [m_ptr updateEditing];
  }
}

- (BOOL)shouldIgnoreKeyboardWillHideNotification
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42C68], "sharedInstance"), "rotationState")
      || self->_isTapHighlightFading && self->_potentialTapInProgress;
}

- (void)_hardwareKeyboardAvailabilityChanged
{
  HIBYTE(self->_revealFocusedElementDeferrer.m_ptr) = 0;
  [(WKContentView *)self reloadInputViews];
}

- (void)_didUpdateInputMode:(unsigned __int8)a3
{
  if ([(WKContentView *)self inputDelegate]
    && [(WKContentView *)self _hasFocusedElement])
  {
    self->_anon_938[114] = a3;
    [(WKContentView *)self reloadInputViews];
  }
}

- (void)_requestDOMPasteAccessForCategory:(unsigned __int8)a3 requiresInteraction:(BOOL)a4 elementRect:(const IntRect *)a5 originIdentifier:(const void *)a6 completionHandler:(void *)a7
{
  uint64_t v9 = a4;
  unsigned int v10 = a3;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  IntPoint v12 = *(IntPoint *)&self->_hasSetUpInteractions;
  *(void *)&self->_hasSetUpInteractions = 0;
  v36.FloatPoint m_location = v12;
  uint64_t v13 = *(void *)a7;
  *(void *)a7 = 0;
  uint64_t v14 = *(void *)&self->_hasSetUpInteractions;
  *(void *)&self->_hasSetUpInteractions = v13;
  if (v14) {
    (*(void (**)(uint64_t, SEL))(*(void *)v14 + 8))(v14, a2);
  }
  if (v12)
  {
    WTF::CompletionHandler<void ()(WebCore::DOMPasteAccessResponse)>::operator()((uint64_t *)&v36.m_location);
    if (v36.m_location) {
      (*(void (**)(void))(**(void **)&v36.m_location + 8))(*(void *)&v36.m_location);
    }
  }
  LOWORD(self->_ignoreSelectionCommandFadeCount) = v10 | 0x100;
  if (v9) {
    goto LABEL_27;
  }
  if (v10 <= 1) {
    uint64_t v9 = [MEMORY[0x1E4F42C50] generalPasteboard];
  }
  if (!*(void *)a6) {
    goto LABEL_27;
  }
  if (!*(_DWORD *)(*(void *)a6 + 4)) {
    goto LABEL_27;
  }
  long long v15 = (WebCore::PasteboardCustomData *)objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, objc_msgSend((id)v9, "numberOfItems"));
  long long v16 = objc_msgSend((id)v9, "dataForPasteboardType:inItemSet:", objc_msgSend(NSString, "stringWithUTF8String:", WebCore::PasteboardCustomData::cocoaType(v15)), v15);
  if (![v16 count]) {
    goto LABEL_27;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v31 objects:&v36 count:16];
  if (!v17) {
    goto LABEL_27;
  }
  char v18 = 0;
  uint64_t v19 = *(void *)v32;
  do
  {
    for (uint64_t i = 0; i != v17; ++i)
    {
      if (*(void *)v32 != v19) {
        objc_enumerationMutation(v16);
      }
      uint64_t v35 = 0;
      uint64_t v35 = *(WebCore::FragmentedSharedBuffer **)(*((void *)&v31 + 1) + 8 * i);
      if ([(WebCore::FragmentedSharedBuffer *)v35 length])
      {
        WebCore::SharedBuffer::create<NSData *&>(&v35, v21, (uint64_t *)&v30);
        WebCore::PasteboardCustomData::fromSharedBuffer((uint64_t *)v29, v30, v22);
        char v24 = WTF::equal(v29[0], *(const WTF::StringImpl **)a6, v23);
        WebCore::PasteboardCustomData::~PasteboardCustomData((WebCore::PasteboardCustomData *)v29);
        char v26 = (unsigned int *)v30;
        double v30 = 0;
        if (v26)
        {
          WTF::ThreadSafeRefCounted<WebCore::FragmentedSharedBuffer,(WTF::DestructionThread)0>::deref(v26, v25);
          if ((v24 & 1) == 0) {
            goto LABEL_27;
          }
        }
        else if ((v24 & 1) == 0)
        {
          goto LABEL_27;
        }
        char v18 = 1;
      }
    }
    uint64_t v17 = [v16 countByEnumeratingWithState:&v31 objects:&v36 count:16];
  }
  while (v17);
  if (v18)
  {
    [(WKContentView *)self _handleDOMPasteRequestWithResult:1];
  }
  else
  {
LABEL_27:
    IntRect v36 = *a5;
    if ((a5->m_size.m_width - 301) < 0xFFFFFED4
      || (int m_height = a5->m_size.m_height, m_height < 1)
      || m_height >= 121)
    {
      WebCore::IntPoint::IntPoint((WebCore::IntPoint *)&v31, (const CGPoint *)&self->_keyWebEventHandlers.m_inlineBuffer[0].__lx[16]);
      v36.uint64_t m_size = (IntSize)0x1400000014;
      v36.m_location.m_double x = v31 - 10;
      v36.m_location.m_double y = DWORD1(v31) - 10;
    }
    uint64_t v28 = (void *)[MEMORY[0x1E4F42B88] sharedMenuController];
    WebCore::IntRect::operator CGRect();
    objc_msgSend(v28, "showMenuFromView:rect:", self);
  }
}

- (void)doAfterEditorStateUpdateAfterFocusingElement:(id)a3
{
  if (*((unsigned char *)self->_page.m_ptr + 1104))
  {
    p_pendingPositionInformationHandlers = &self->_pendingPositionInformationHandlers;
    id v4 = _Block_copy(a3);
    uint64_t v13 = v4;
    unint64_t m_size = p_pendingPositionInformationHandlers->m_size;
    if (m_size == p_pendingPositionInformationHandlers->m_capacity)
    {
      FloatRect v6 = (uint64_t *)WTF::Vector<WTF::BlockPtr<void ()(void)>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)p_pendingPositionInformationHandlers, m_size + 1, (unint64_t)&v13);
      uint64_t v7 = p_pendingPositionInformationHandlers->m_size;
      unint64_t m_size = (unint64_t)p_pendingPositionInformationHandlers->m_buffer;
      uint64_t v8 = *v6;
      *FloatRect v6 = 0;
      *(void *)(m_size + 8 * v7) = v8;
      LODWORD(m_size) = p_pendingPositionInformationHandlers->m_size;
      uint64_t v9 = v13;
    }
    else
    {
      long long v11 = v4;
      uint64_t v9 = 0;
      m_buffer = p_pendingPositionInformationHandlers->m_buffer;
      uint64_t v13 = 0;
      m_buffer[m_size] = v11;
    }
    p_pendingPositionInformationHandlers->unint64_t m_size = m_size + 1;
    _Block_release(v9);
  }
  else
  {
    unsigned int v10 = (void (*)(id))*((void *)a3 + 2);
    v10(a3);
  }
}

- (void)_didUpdateEditorState
{
  [(WKContentView *)self _updateInitialWritingDirectionIfNecessary];
  uint64_t v4 = *(void *)&self->_actionsToPerformAfterEditorStateUpdate.m_capacity;
  if (v4) {
    WebKit::RevealFocusedElementDeferrer::fulfill(v4, 1);
  }
  BYTE2(self->_dataListSuggestionsControl.m_weakReference) = 0;
  p_pendingPositionInformationHandlers = &self->_pendingPositionInformationHandlers;
  m_buffer = (const void **)self->_pendingPositionInformationHandlers.m_buffer;
  uint64_t v13 = m_buffer;
  m_capacitdouble y = self->_pendingPositionInformationHandlers.m_capacity;
  uint64_t m_size = self->_pendingPositionInformationHandlers.m_size;
  unsigned int v14 = m_capacity;
  int v15 = m_size;
  v12[0] = 0;
  p_pendingPositionInformationHandlers->m_buffer = 0;
  v12[1] = 0;
  *(void *)&p_pendingPositionInformationHandlers->m_capacitdouble y = 0;
  WTF::Vector<WTF::BlockPtr<void ()(void)>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v12, v3);
  if (m_size)
  {
    uint64_t v10 = 8 * m_size;
    do
    {
      long long v11 = (void (**)(void))_Block_copy(*m_buffer);
      v11[2]();
      _Block_release(v11);
      ++m_buffer;
      v10 -= 8;
    }
    while (v10);
  }
  WTF::Vector<WTF::BlockPtr<void ()(void)>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v13, v9);
}

- (void)_updateInitialWritingDirectionIfNecessary
{
  id m_ptr = self->_page.m_ptr;
  if (*((unsigned char *)m_ptr + 688))
  {
    if (!(*(unsigned __int8 *)(*((void *)m_ptr + 4) + 249) | *(unsigned __int8 *)(*((void *)m_ptr + 4) + 250)))
    {
      uint64_t v4 = (void *)[MEMORY[0x1E4F42B20] activeInstance];
      if ((WKContentView *)[v4 delegate] == self)
      {
        [v4 setInitialDirection];
      }
    }
  }
}

- (void)updateCurrentFocusedElementInformation:(void *)a3
{
  id location = 0;
  objc_initWeak(&location, self);
  uint64_t v5 = *(void *)&self->_anon_938[304];
  id m_ptr = self->_page.m_ptr;
  uint64_t v7 = *(void *)a3;
  *(void *)a3 = 0;
  uint64_t v10 = v7;
  uint64_t v11 = v5;
  id v12 = 0;
  objc_copyWeak(&v12, &location);
  uint64_t v8 = WTF::fastMalloc((WTF *)0x20);
  *(void *)uint64_t v8 = &unk_1EEA0F0A8;
  *(void *)(v8 + 8) = v10;
  *(void *)(v8 + 16) = v11;
  *(void *)(v8 + 24) = 0;
  objc_moveWeak((id *)(v8 + 24), &v12);
  uint64_t v13 = v8;
  WebKit::WebPageProxy::requestFocusedElementInformation((uint64_t)m_ptr, &v13);
  uint64_t v9 = v13;
  uint64_t v13 = 0;
  if (v9) {
    (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
  }
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)_wheelChangedWithEvent:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)WKContentView;
  [(WKContentView *)&v3 _wheelChangedWithEvent:a3];
}

- (void)_updateSelectionAssistantSuppressionState
{
  double v2 = (unsigned char *)*((void *)self->_page.m_ptr + 4);
  if (!v2[576] || !v2[704]) {
    return;
  }
  if (v2[249]) {
    goto LABEL_5;
  }
  uint64_t v4 = *((void *)self->_page.m_ptr + 4);
  int v5 = v2[306];
  if (![(WKContentView *)self _hasFocusedElement]) {
    goto LABEL_15;
  }
  int v6 = *(_DWORD *)(v4 + 616);
  if (v6 < 0) {
    int v6 = -v6;
  }
  int v7 = *(_DWORD *)(v4 + 620);
  if (v7 < 0) {
    int v7 = -v7;
  }
  unint64_t v8 = v6 * (unint64_t)v7;
  if ((v8 & 0xFFFFFFFF00000000) != 0)
  {
LABEL_15:
    if (v5)
    {
      [(WKContentView *)self _startSuppressingSelectionAssistantForReason:1];
      goto LABEL_6;
    }
LABEL_5:
    [(WKContentView *)self _stopSuppressingSelectionAssistantForReason:1];
LABEL_6:
    [(WKContentView *)self _stopSuppressingSelectionAssistantForReason:2];
    return;
  }
  if (v5)
  {
    [(WKContentView *)self _startSuppressingSelectionAssistantForReason:1];
    if (v8 > 3) {
      goto LABEL_6;
    }
  }
  else
  {
    [(WKContentView *)self _stopSuppressingSelectionAssistantForReason:1];
    if (v8 >= 4) {
      goto LABEL_6;
    }
  }

  [(WKContentView *)self _startSuppressingSelectionAssistantForReason:2];
}

- (void)_selectionChanged
{
  BYTE4(self->_dataListSuggestionsControl.m_weakReference) = 1;
  [(WKContentView *)self _updateSelectionAssistantSuppressionState];
  m_buffer = self->_lastSelectionDrawingInfo.selectionGeometries.m_buffer;
  self->_lastSelectionDrawingInfo.selectionGeometries.m_buffer = 0;
  if (m_buffer) {
    CFRelease(m_buffer);
  }
  LOBYTE(self->_dataListTextSuggestions.m_ptr) = 1;
  if (BYTE2(self->_dataListTextSuggestions.m_ptr)) {
    [(WKContentView *)self _updateChangedSelection];
  }
  if (BYTE6(self->_revealFocusedElementDeferrer.m_ptr))
  {
    BYTE6(self->_revealFocusedElementDeferrer.m_ptr) = 0;
    if ([(WKContentView *)self shouldUseAsyncInteractions])
    {
      objc_msgSend(objc_loadWeak((id *)&self->_anon_fb8[24]), "invalidateTextEntryContextForTextInput:", -[WKContentView asBETextInput](self, "asBETextInput"));
    }
    else
    {
      uint64_t v4 = [(WKContentView *)self inputDelegate];
      if (objc_opt_respondsToSelector()) {
        [(UITextInputDelegate *)v4 layoutHasChanged];
      }
    }
  }
  [objc_loadWeak(&self->_webView.m_weakReference) _didChangeEditorState];
  int v5 = (unsigned char *)*((void *)self->_page.m_ptr + 4);
  if (v5[576] && v5[704])
  {
    if (*((unsigned char *)&self->_domPasteRequestCategory + 4)) {
      *((unsigned char *)&self->_domPasteRequestCategory + 4) = 0;
    }
    if (!BYTE2(self->_dataListTextSuggestions.m_ptr)
      && !LODWORD(self->_pendingAutocorrectionContextHandler.m_function.m_callableWrapper.__ptr_.__value_)
      && v5[258])
    {
      [(WKContentView *)self _internalBeginSelectionChange];
      [(WKContentView *)self _internalEndSelectionChange];
    }
  }
}

- (void)selectWordForReplacement
{
  [(WKContentView *)self _internalBeginSelectionChange];
  id m_ptr = self->_page.m_ptr;
  id location = 0;
  objc_initWeak(&location, self);
  uint64_t v4 = WTF::fastMalloc((WTF *)0x10);
  *(void *)uint64_t v4 = &unk_1EEA0F0D0;
  *(void *)(v4 + 8) = 0;
  objc_moveWeak((id *)(v4 + 8), &location);
  uint64_t v8 = v4;
  uint64_t v5 = *((void *)m_ptr + 32);
  char v9 = 0;
  WebKit::AuxiliaryProcessProxy::sendWithAsyncReply<Messages::WebPage::ExtendSelectionForReplacement,WTF::CompletionHandler<void ()(void)>>(v5, (uint64_t)&v9, &v8, *(void *)(*((void *)m_ptr + 4) + 1928), 0, 1);
  uint64_t v6 = v8;
  uint64_t v8 = 0;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  objc_destroyWeak(&location);
}

- (void)_updateChangedSelection
{
}

- (void)_updateChangedSelection:(BOOL)a3
{
  uint64_t v3 = *((void *)self->_page.m_ptr + 4);
  if (!*(unsigned char *)(v3 + 576) || !*(unsigned char *)(v3 + 704)) {
    return;
  }
  memset(v44, 0, sizeof(v44));
  *(_OWORD *)FloatRect v45 = 0u;
  memset(v46, 0, sizeof(v46));
  if (!*(unsigned char *)(v3 + 249))
  {
    BOOL v5 = a3;
    if (*(unsigned char *)(v3 + 256))
    {
      *(_DWORD *)long long v44 = 1;
    }
    else
    {
      *(_DWORD *)long long v44 = 2;
      *(_OWORD *)&v44[4] = *(_OWORD *)(v3 + 624);
      WebCore::Color::operator=();
      WTF::Vector<WebCore::SelectionGeometry,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::operator=((uint64_t)&v45[1], v3 + 640);
      *(_OWORD *)&_DWORD v46[8] = *(_OWORD *)(v3 + 608);
    }
    a3 = v5;
  }
  uint64_t v6 = &OBJC_IVAR___WKObservablePageState__page;
  if (a3) {
    goto LABEL_61;
  }
  int v7 = &self->_keyWebEventHandlers.m_inlineBuffer[0].__lx[40];
  int v8 = *(_DWORD *)v44;
  if (*(_DWORD *)v44 != *(_DWORD *)&self->_keyWebEventHandlers.m_inlineBuffer[0].__lx[40]) {
    goto LABEL_61;
  }
  if (*(_DWORD *)v44 != 2)
  {
LABEL_58:
    if (!v8) {
      goto LABEL_81;
    }
    goto LABEL_59;
  }
  BOOL v9 = *(_DWORD *)&v44[4] == *(_DWORD *)&self->_keyWebEventHandlers.m_inlineBuffer[0].__lx[44]
    && *(_DWORD *)&v44[8] == LODWORD(self->_lastInteractionLocation.x);
  if (!v9
    || *(_DWORD *)&v44[12] != HIDWORD(self->_lastInteractionLocation.x)
    || *(_DWORD *)&v44[16] != LODWORD(self->_lastInteractionLocation.y))
  {
    goto LABEL_61;
  }
  uint64_t v43 = v3;
  unint64_t m_identifier = self->_layerTreeTransactionIdAtLastInteractionStart.m_identifier;
  if (((unint64_t)v45[0] & 0x8000000000000) == 0)
  {
    if (v45[0] == (WTF *)m_identifier && (m_identifier & 0x8000000000000) == 0) {
      goto LABEL_22;
    }
LABEL_61:
    m_buffer = self->_lastSelectionDrawingInfo.selectionGeometries.m_buffer;
    self->_lastSelectionDrawingInfo.selectionGeometries.m_buffer = 0;
    if (m_buffer)
    {
      double v30 = v6;
      CFRelease(m_buffer);
      uint64_t v6 = v30;
    }
    long long v31 = (char *)self + v6[667];
    *(_OWORD *)long long v31 = *(_OWORD *)v44;
    *((_DWORD *)v31 + 4) = *(_DWORD *)&v44[16];
    WebCore::Color::operator=();
    WTF::Vector<WebCore::SelectionGeometry,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::operator=((uint64_t)(v31 + 32), (uint64_t)&v45[1]);
    *((_OWORD *)v31 + 3) = *(_OWORD *)&v46[8];
    if (!self->_textInteractionWrapper.m_ptr) {
      goto LABEL_79;
    }
    if (*(unsigned char *)(v3 + 257) && (long long v32 = *(WTF::StringImpl **)(v3 + 312)) != 0)
    {
      *(_DWORD *)v32 += 2;
      long long v34 = (__CFString *)WTF::StringImpl::operator NSString *();
      char v35 = 0;
      p_markedText = &self->_markedText;
      if (!v34) {
        goto LABEL_70;
      }
    }
    else
    {
      long long v32 = 0;
      p_markedText = &self->_markedText;
      char v35 = 1;
      long long v34 = &stru_1EEA10550;
    }
    CFRetain(v34);
LABEL_70:
    id m_ptr = p_markedText->m_ptr;
    p_markedText->id m_ptr = v34;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    if ((v35 & 1) == 0)
    {
      if (*(_DWORD *)v32 == 2) {
        WTF::StringImpl::destroy(v32, v33);
      }
      else {
        *(_DWORD *)v32 -= 2;
      }
    }
    if (![p_markedText->m_ptr length]) {
      self->_isExpectingFastSingleTapCommit = 0;
    }
    [self->_textInteractionWrapper.m_ptr selectionChanged];
LABEL_79:
    LOBYTE(self->_dataListTextSuggestions.m_ptr) = 0;
    if (BYTE1(self->_dataListTextSuggestions.m_ptr))
    {
      [self->_textInteractionWrapper.m_ptr didEndScrollingOverflow];
      BYTE1(self->_dataListTextSuggestions.m_ptr) = 0;
    }
    goto LABEL_81;
  }
  if ((m_identifier & 0x8000000000000) == 0) {
    goto LABEL_61;
  }
  BOOL v41 = 0;
  unint64_t v42 = 0;
  long long v48 = *(_OWORD *)(((unint64_t)v45[0] & 0xFFFFFFFFFFFFLL) + 4);
  long long v47 = *(_OWORD *)((m_identifier & 0xFFFFFFFFFFFFLL) + 4);
  do
  {
    if (*((float *)&v48 + v42) != *((float *)&v47 + v42)) {
      break;
    }
    BOOL v41 = v42++ > 2;
  }
  while (v42 != 4);
  if (!v41 || (unint64_t)v45[0] >> 56 != HIBYTE(m_identifier))
  {
    uint64_t v6 = &OBJC_IVAR___WKObservablePageState__page;
    goto LABEL_61;
  }
  uint64_t v6 = &OBJC_IVAR___WKObservablePageState__page;
  int v7 = &self->_keyWebEventHandlers.m_inlineBuffer[0].__lx[40];
  if (BYTE6(v45[0]) != BYTE6(m_identifier)) {
    goto LABEL_61;
  }
LABEL_22:
  unint64_t v11 = *(unsigned int *)&v46[4];
  if (*(unsigned int *)&v46[4] != (unint64_t)*((unsigned int *)v7 + 11)) {
    goto LABEL_61;
  }
  if (!*(_DWORD *)&v46[4])
  {
LABEL_59:
    if (*(void *)&v46[8] != *((void *)v7 + 6) || *(void *)&v46[16] != *((void *)v7 + 7)) {
      goto LABEL_61;
    }
LABEL_81:
    if (*(unsigned char *)(v3 + 362)
      && self->_isTapHighlightIDValid
      && !*(unsigned char *)(*((void *)self->_page.m_ptr + 4) + 2448))
    {
      unsigned int v38 = (WKContentView *)[(WKContentView *)self firstResponder];
      if ((!v38 || v38 == self) && !self->_suppressSelectionAssistantReasons.m_storage) {
        [self->_textInteractionWrapper.m_ptr activateSelection];
      }
      [self->_textInteractionWrapper.m_ptr didEndScrollingOverflow];
      self->_isTapHighlightIDValid = 0;
    }
    ProcessQualified<WTF::UUID> v39 = v45[1];
    if (v45[1])
    {
      v45[1] = 0;
      *(_DWORD *)IntRect v46 = 0;
      WTF::fastFree(v39, (void *)a2);
    }
    if (((unint64_t)v45[0] & 0x8000000000000) != 0)
    {
      FloatRect v40 = (unsigned int *)((unint64_t)v45[0] & 0xFFFFFFFFFFFFLL);
      if (atomic_fetch_add((atomic_uint *volatile)((unint64_t)v45[0] & 0xFFFFFFFFFFFFLL), 0xFFFFFFFF) == 1)
      {
        atomic_store(1u, v40);
        WTF::fastFree((WTF *)v40, (void *)a2);
      }
    }
    return;
  }
  unint64_t v12 = 0;
  uint64_t v13 = 32;
  while (v12 < self->_lastSelectionDrawingInfo.caretRect.m_size.m_width)
  {
    uint64_t v14 = *(void *)&self->_lastSelectionDrawingInfo.type;
    int v15 = (WebCore::SelectionGeometry *)(v14 + v13 - 32);
    uint64_t v3 = v43;
    uint64_t v6 = &OBJC_IVAR___WKObservablePageState__page;
    if ((*((unsigned char *)v45[1] + v13) != 0) != (*(unsigned char *)(v14 + v13) != 0)) {
      goto LABEL_61;
    }
    long long v16 = (WTF *)((char *)v45[1] + v13 - 32);
    if (*((unsigned char *)v45[1] + v13))
    {
      uint64_t v17 = (float *)((char *)v45[1] + v13);
      uint64_t v18 = v14 + v13;
      BOOL v19 = *(float *)v16 == *(float *)v15 && *(float *)((char *)v45[1] + v13 - 28) == *(float *)(v18 - 28);
      uint64_t v3 = v43;
      uint64_t v6 = &OBJC_IVAR___WKObservablePageState__page;
      if (!v19) {
        goto LABEL_61;
      }
      BOOL v20 = *(v17 - 6) == *(float *)(v18 - 24) && *(v17 - 5) == *(float *)(v18 - 20);
      BOOL v21 = v20 && *(v17 - 4) == *(float *)(v18 - 16);
      BOOL v22 = v21 && *(v17 - 3) == *(float *)(v18 - 12);
      BOOL v23 = v22 && *(v17 - 2) == *(float *)(v18 - 8);
      if (!v23 || *(v17 - 1) != *(float *)(v18 - 4)) {
        goto LABEL_61;
      }
    }
    else
    {
      uint64_t v25 = WebCore::SelectionGeometry::rect(v16);
      SEL v27 = v26;
      BOOL v28 = v25 == WebCore::SelectionGeometry::rect(v15) && v27 == a2;
      uint64_t v3 = v43;
      uint64_t v6 = &OBJC_IVAR___WKObservablePageState__page;
      if (!v28) {
        goto LABEL_61;
      }
      unint64_t v11 = *(unsigned int *)&v46[4];
    }
    ++v12;
    v13 += 84;
    if (v12 >= v11)
    {
      int v8 = *(_DWORD *)v44;
      uint64_t v3 = v43;
      int v7 = &self->_keyWebEventHandlers.m_inlineBuffer[0].__lx[40];
      goto LABEL_58;
    }
  }
  __break(0xC471u);
}

- (BOOL)shouldAllowHidingSelectionCommands
{
  return *(void *)&self->_isUnsuppressingSoftwareKeyboardUsingLastAutocorrectionContext == 0;
}

- (BOOL)supportsTextSelectionWithCharacterGranularity
{
  return 1;
}

- (void)requestRVItemInSelectedRangeWithCompletionHandler:(id)a3
{
  aBlock[3] = *(void **)MEMORY[0x1E4F143B8];
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    BOOL v9 = qword_1EB3586B8;
    if (os_log_type_enabled((os_log_t)qword_1EB3586B8, OS_LOG_TYPE_ERROR))
    {
      LODWORD(aBlock[0]) = 136315138;
      *(void **)((char *)aBlock + 4) = "-[WKContentView(WKInteraction) requestRVItemInSelectedRangeWithCompletionHandler:]";
      _os_log_error_impl(&dword_1985F2000, v9, OS_LOG_TYPE_ERROR, "Received unexpected call to %s", (uint8_t *)aBlock, 0xCu);
    }
    __break(0xC471u);
    JUMPOUT(0x19944F3E8);
  }
  id m_ptr = self->_page.m_ptr;
  *(_OWORD *)aBlock = (unint64_t)_Block_copy(a3);
  objc_initWeak(&aBlock[1], self);
  uint64_t v6 = WTF::fastMalloc((WTF *)0x18);
  *(void *)uint64_t v6 = &unk_1EEA0F0F8;
  int v7 = aBlock[0];
  aBlock[0] = 0;
  *(void *)(v6 + 8) = v7;
  *(void *)(v6 + 16) = 0;
  objc_moveWeak((id *)(v6 + 16), &aBlock[1]);
  uint64_t v10 = v6;
  WebKit::WebPageProxy::requestRVItemInCurrentSelectedRange((uint64_t)m_ptr, &v10);
  uint64_t v8 = v10;
  uint64_t v10 = 0;
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
  }
  objc_destroyWeak(&aBlock[1]);
  _Block_release(aBlock[0]);
}

- (void)prepareSelectionForContextMenuWithLocationInView:(CGPoint)a3 completionHandler:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    BOOL v9 = qword_1EB3586B8;
    if (os_log_type_enabled((os_log_t)qword_1EB3586B8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v13 = "-[WKContentView(WKInteraction) prepareSelectionForContextMenuWithLocationInView:completionHandler:]";
      _os_log_error_impl(&dword_1985F2000, v9, OS_LOG_TYPE_ERROR, "Received unexpected call to %s", buf, 0xCu);
    }
    __break(0xC471u);
    JUMPOUT(0x19944F5BCLL);
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3321888768;
  v10[2] = __99__WKContentView_WKInteraction__prepareSelectionForContextMenuWithLocationInView_completionHandler___block_invoke;
  v10[3] = &__block_descriptor_40_e8_32c113_ZTSKZ99__WKContentView_WKInteraction__prepareSelectionForContextMenuWithLocationInView_completionHandler__E4__77_e13_v20__0B8r_v12l;
  uint64_t v8 = _Block_copy(a4);
  aBlock = _Block_copy(v8);
  -[WKContentView _internalSelectTextForContextMenuWithLocationInView:completionHandler:](self, "_internalSelectTextForContextMenuWithLocationInView:completionHandler:", v10, x, y);
  _Block_release(v8);
  _Block_release(aBlock);
}

uint64_t __99__WKContentView_WKInteraction__prepareSelectionForContextMenuWithLocationInView_completionHandler___block_invoke(uint64_t a1, int a2, WebKit::RevealItem *this)
{
  WebKit::RevealItem::item(this);
  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v4();
}

- (void)_internalSelectTextForContextMenuWithLocationInView:(CGPoint)a3 completionHandler:(id)a4
{
  CGPoint v20 = a3;
  std::__optional_destruct_base<WebKit::RemoveBackgroundData,false>::reset[abi:sn180100]((uint64_t)&self->_imageAnalysisActionButtons, (WTF::StringImpl *)a2);
  id m_ptr = self->_page.m_ptr;
  WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v19, &v20);
  float v7 = roundf(v19[0]);
  uint64_t v8 = 0x80000000;
  if (v7 > -2147500000.0) {
    uint64_t v8 = (int)v7;
  }
  if (v7 < 2147500000.0) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0x7FFFFFFFLL;
  }
  float v10 = roundf(v19[1]);
  unint64_t v11 = 0x8000000000000000;
  if (v10 > -2147500000.0) {
    unint64_t v11 = (unint64_t)(int)v10 << 32;
  }
  if (v10 < 2147500000.0) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 0x7FFFFFFF00000000;
  }
  id v16 = 0;
  objc_initWeak(&v16, self);
  aBlock = _Block_copy(a4);
  uint64_t v13 = WTF::fastMalloc((WTF *)0x18);
  *(void *)uint64_t v13 = &unk_1EEA0F120;
  *(void *)(v13 + 8) = 0;
  objc_moveWeak((id *)(v13 + 8), &v16);
  uint64_t v14 = aBlock;
  aBlock = 0;
  uint64_t v18 = v13;
  *(void *)(v13 + 16) = v14;
  WebKit::WebPageProxy::prepareSelectionForContextMenuWithLocationInView((uint64_t)m_ptr, v12 | v9, &v18);
  uint64_t v15 = v18;
  uint64_t v18 = 0;
  if (v15) {
    (*(void (**)(uint64_t))(*(void *)v15 + 8))(v15);
  }
  _Block_release(aBlock);
  objc_destroyWeak(&v16);
}

- (BOOL)hasHiddenContentEditable
{
  return (self->_suppressSelectionAssistantReasons.m_storage & 3) != 0;
}

- (BOOL)_shouldSuppressSelectionCommands
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    uint64_t v4 = qword_1EB3586B8;
    if (os_log_type_enabled((os_log_t)qword_1EB3586B8, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      uint64_t v6 = "-[WKContentView(WKInteraction) _shouldSuppressSelectionCommands]";
      _os_log_error_impl(&dword_1985F2000, v4, OS_LOG_TYPE_ERROR, "Received unexpected call to %s", (uint8_t *)&v5, 0xCu);
    }
    __break(0xC471u);
    JUMPOUT(0x19944F940);
  }

  return [(WKContentView *)self shouldSuppressEditMenu];
}

- (void)_startSuppressingSelectionAssistantForReason:(unsigned __int8)a3
{
  int m_storage = self->_suppressSelectionAssistantReasons.m_storage;
  self->_suppressSelectionAssistantReasons.int m_storage = m_storage | a3;
  if (!m_storage) {
    [self->_textInteractionWrapper.m_ptr deactivateSelection];
  }
}

- (void)_stopSuppressingSelectionAssistantForReason:(unsigned __int8)a3
{
  int m_storage = self->_suppressSelectionAssistantReasons.m_storage;
  self->_suppressSelectionAssistantReasons.int m_storage = m_storage & ~a3;
  if (m_storage) {
    BOOL v4 = (m_storage & (a3 ^ 0xFF)) == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4) {
    [self->_textInteractionWrapper.m_ptr activateSelection];
  }
}

- (WKFormControl)dataListTextSuggestionsInputView
{
  return *(WKFormControl **)&self->_inputViewUpdateDeferralSources.m_storage;
}

- (NSArray)dataListTextSuggestions
{
  return (NSArray *)self->_keyboardScrollingAnimator.m_ptr;
}

- (void)setDataListTextSuggestionsInputView:(id)a3
{
  id v4 = *(id *)&self->_inputViewUpdateDeferralSources.m_storage;
  if (v4 != a3)
  {
    if (a3)
    {
      CFRetain(a3);
      id v4 = *(id *)&self->_inputViewUpdateDeferralSources.m_storage;
    }
    *(void *)&self->_inputViewUpdateDeferralSources.int m_storage = a3;
    if (v4) {
      CFRelease(v4);
    }
    if (![self->_formInputSession.m_ptr customInputView])
    {
      [(WKContentView *)self reloadInputViews];
    }
  }
}

- (void)setDataListTextSuggestions:(id)a3
{
  if (self->_keyboardScrollingAnimator.m_ptr != a3 && (objc_msgSend(a3, "isEqualToArray:") & 1) == 0)
  {
    if (a3) {
      CFRetain(a3);
    }
    id m_ptr = self->_keyboardScrollingAnimator.m_ptr;
    self->_keyboardScrollingAnimator.id m_ptr = a3;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    if (!objc_msgSend((id)objc_msgSend(self->_formInputSession.m_ptr, "suggestions"), "count"))
    {
      [(WKContentView *)self updateTextSuggestionsForInputDelegate];
    }
  }
}

- (void)updateTextSuggestionsForInputDelegate
{
  uint64_t v3 = (void *)[self->_formInputSession.m_ptr suggestions];
  if ([v3 count])
  {
    [(WKContentView *)self _provideUITextSuggestionsToInputDelegate:v3];
  }
  else
  {
    if ([self->_keyboardScrollingAnimator.m_ptr count])
    {
      id m_ptr = self->_keyboardScrollingAnimator.m_ptr;
      int v5 = self;
    }
    else
    {
      int v5 = self;
      id m_ptr = 0;
    }
    [(WKContentView *)v5 _provideSuggestionsToInputDelegate:m_ptr];
  }
}

- (void)_provideSuggestionsToInputDelegate:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    id Weak = objc_loadWeak((id *)&self->_anon_fb8[24]);
    id v6 = [(WKContentView *)self asBETextInput];
    [Weak textInput:v6 setCandidateSuggestions:a3];
  }
  else
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a3, "count"));
    uint64_t v8 = v7;
    if (v7) {
      CFRetain(v7);
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v9 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(a3);
          }
          objc_msgSend(v8, "addObject:", objc_msgSend(MEMORY[0x1E4F42F50], "textSuggestionWithInputText:", objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "inputText")));
        }
        uint64_t v9 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
    [(UITextInputDelegate *)[(WKContentView *)self inputDelegate] setSuggestions:v8];
    if (v8) {
      CFRelease(v8);
    }
  }
}

- (void)_provideUITextSuggestionsToInputDelegate:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    int v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a3, "count"));
    id v6 = v5;
    if (v5) {
      CFRetain(v5);
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(a3);
          }
          uint64_t v10 = (const void *)[objc_alloc(MEMORY[0x1E4F18BE0]) _initWithUIKitTextSuggestion:*(void *)(*((void *)&v12 + 1) + 8 * i)];
          [v6 addObject:v10];
          if (v10) {
            CFRelease(v10);
          }
        }
        uint64_t v7 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
    objc_msgSend(objc_loadWeak((id *)&self->_anon_fb8[24]), "textInput:setCandidateSuggestions:", -[WKContentView asBETextInput](self, "asBETextInput"), v6);
    if (v6) {
      CFRelease(v6);
    }
  }
  else
  {
    unint64_t v11 = [(WKContentView *)self inputDelegate];
    [(UITextInputDelegate *)v11 setSuggestions:a3];
  }
}

- (void)_showPlaybackTargetPicker:(BOOL)a3 fromRect:(const IntRect *)a4 routeSharingPolicy:(unsigned __int8)a5 routingContextUID:(id)a6
{
  uint64_t v7 = a5;
  BOOL v8 = a3;
  id m_ptr = (WKAirPlayRoutePicker *)self->_airPlayRoutePicker.m_ptr;
  if (!m_ptr)
  {
    id m_ptr = objc_alloc_init(WKAirPlayRoutePicker);
    unint64_t v11 = self->_airPlayRoutePicker.m_ptr;
    self->_airPlayRoutePicker.id m_ptr = m_ptr;
    if (v11)
    {
      CFRelease(v11);
      id m_ptr = (WKAirPlayRoutePicker *)self->_airPlayRoutePicker.m_ptr;
    }
  }

  [(WKAirPlayRoutePicker *)m_ptr showFromView:self routeSharingPolicy:v7 routingContextUID:a6 hasVideo:v8];
}

- (void)_showRunOpenPanel:(OpenPanelParameters *)a3 frameInfo:(const void *)a4 resultListener:(WebOpenPanelResultListenerProxy *)a5
{
  if (!self->_fileUploadPanel.m_ptr)
  {
    p_frameInfoForFileUploadPanel = &self->_frameInfoForFileUploadPanel;
    uint64_t v10 = &self->_frameInfoForFileUploadPanel;
    *(_WORD *)&v10->isMainFrame = *(_WORD *)a4;
    WebCore::ResourceRequestBase::operator=((uint64_t)&v10->request, (uint64_t)a4 + 8);
    unint64_t v11 = (void *)*((void *)a4 + 25);
    if (v11) {
      CFRetain(*((CFTypeRef *)a4 + 25));
    }
    id m_ptr = p_frameInfoForFileUploadPanel->request.m_nsRequest.m_ptr;
    p_frameInfoForFileUploadPanel->request.m_nsRequest.id m_ptr = v11;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    std::__variant_detail::__assignment<std::__variant_detail::__traits<WebCore::SecurityOriginData::Tuple,WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::OpaqueOriginIdentifierType,WTF::ObjectIdentifierThreadSafeAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)1>>>>::__generic_assign[abi:sn180100]<std::__variant_detail::__copy_assignment<std::__variant_detail::__traits<WebCore::SecurityOriginData::Tuple,WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::OpaqueOriginIdentifierType,WTF::ObjectIdentifierThreadSafeAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)1>>>,(std::__variant_detail::_Trait)1> const&>((uint64_t)&p_frameInfoForFileUploadPanel->securityOrigin, (uint64_t)a4 + 208);
    WTF::String::operator=((uint64_t *)&p_frameInfoForFileUploadPanel->frameName, (WTF::StringImpl **)a4 + 30);
    long long v13 = *(_OWORD *)((char *)a4 + 278);
    $C125566FF38F5DE1C5AF278B483AD45B v14 = *($C125566FF38F5DE1C5AF278B483AD45B *)((char *)a4 + 264);
    p_frameInfoForFileUploadPanel->frameID = *(ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::FrameIdentifierType, WTF::ObjectIdentifierMainThreadAccessTraits<uint64_t>, unsigned long long, WTF::SupportsObjectIdentifierNullState::Yes>> *)((char *)a4 + 248);
    p_frameInfoForFileUploadPanel->parentFrameID.unint64_t var0 = v14;
    *(_OWORD *)((char *)&p_frameInfoForFileUploadPanel->parentFrameID.var0.__val_.m_processIdentifier.m_identifier + 6) = v13;
    long long v15 = [[WKFileUploadPanel alloc] initWithView:self];
    id v16 = self->_fileUploadPanel.m_ptr;
    self->_fileUploadPanel.id m_ptr = v15;
    if (v16)
    {
      CFRelease(v16);
      long long v15 = (WKFileUploadPanel *)self->_fileUploadPanel.m_ptr;
    }
    [(WKFileUploadPanel *)v15 setDelegate:self];
    uint64_t v17 = self->_fileUploadPanel.m_ptr;
    [v17 presentWithParameters:a3 resultListener:a5];
  }
}

- (void)fileUploadPanelDidDismiss:(id)a3
{
  [self->_fileUploadPanel.m_ptr setDelegate:0];
  id m_ptr = self->_fileUploadPanel.m_ptr;
  self->_fileUploadPanel.id m_ptr = 0;
  if (m_ptr)
  {
    CFRelease(m_ptr);
  }
}

- (BOOL)fileUploadPanelDestinationIsManaged:(id)a3
{
  id WeakRetained = objc_loadWeakRetained(&self->_webView.m_weakReference);
  int v5 = (void *)[WeakRetained UIDelegate];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    char v11 = 0;
    if (!WeakRetained) {
      return v11;
    }
    goto LABEL_11;
  }
  id m_ptr = self->_page.m_ptr;
  if (m_ptr) {
    CFRetain(*((CFTypeRef *)m_ptr + 1));
  }
  p_frameInfoForFileUploadPanel = &self->_frameInfoForFileUploadPanel;
  long long v13 = m_ptr;
  uint64_t v8 = API::Object::newObject(0x140uLL, 60);
  uint64_t v9 = API::FrameInfo::FrameInfo(v8, (uint64_t)p_frameInfoForFileUploadPanel, (uint64_t *)&v13);
  uint64_t v10 = *(const void **)(v9 + 8);
  if (v10) {
    CFRetain(*(CFTypeRef *)(v9 + 8));
  }
  char v11 = [v5 _webView:WeakRetained fileUploadPanelContentIsManagedWithInitiatingFrame:v10];
  if (v10) {
    CFRelease(v10);
  }
  CFRelease(*(CFTypeRef *)(v8 + 8));
  if (v13) {
    CFRelease(*((CFTypeRef *)v13 + 1));
  }
  if (WeakRetained) {
LABEL_11:
  }
    CFRelease(WeakRetained);
  return v11;
}

- (BOOL)fileUploadPanelPhotoPickerPrefersOriginalImageFormat:(id)a3
{
  uint64_t v3 = *((void *)self->_page.m_ptr + 34);
  {
    WebKit::WebPreferencesKey::photoPickerPrefersOriginalImageFormatKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::photoPickerPrefersOriginalImageFormatKey(void)::kedouble y = (uint64_t)&WebKit::WebPreferencesKey::photoPickerPrefersOriginalImageFormatKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)(v3 + 40), (WTF::StringImpl **)&WebKit::WebPreferencesKey::photoPickerPrefersOriginalImageFormatKey(void)::key, (const WTF::StringImpl *)a3);
}

- (void)_showShareSheet:(const void *)a3 inRect:(optional<WebCore:(void *)a5 :FloatRect> *)a4 completionHandler:
{
  id m_ptr = self->_shareSheet.m_ptr;
  if (m_ptr) {
    [m_ptr dismissIfNeededWithReason:0];
  }
  uint64_t v10 = [[WKShareSheet alloc] initWithView:[(WKContentView *)self webView]];
  char v11 = self->_shareSheet.m_ptr;
  self->_shareSheet.id m_ptr = v10;
  if (v11)
  {
    CFRelease(v11);
    uint64_t v10 = (WKShareSheet *)self->_shareSheet.m_ptr;
  }
  [(WKShareSheet *)v10 setDelegate:self];
  if (!a4->var1)
  {
    long long v13 = self->_mouseInteraction.m_ptr;
    if (v13)
    {
      [v13 lastLocation];
      if (v26)
      {
        -[WKContentView convertPoint:toView:](self, "convertPoint:toView:", [(WKContentView *)self webView], v24, v25);
        *(float *)&double v14 = v14;
        *(float *)&double v15 = v15;
        BOOL var1 = a4->var1;
        a4->var0.var1.m_location.m_double x = *(float *)&v14;
        a4->var0.var1.m_location.m_double y = *(float *)&v15;
        __asm { FMOV            V0.2S, #1.0 }
        a4->var0.var1.uint64_t m_size = _D0;
        if (!var1) {
          a4->BOOL var1 = 1;
        }
      }
    }
  }
  long long v12 = self->_shareSheet.m_ptr;
  $E2D53856B32FA0E62EFBBE3F1668E26F var0 = a4->var0;
  int v23 = *(_DWORD *)&a4->var1;
  [v12 presentWithParameters:a3 inRect:&var0 completionHandler:a5];
}

- (void)shareSheetDidDismiss:(id)a3
{
  [self->_shareSheet.m_ptr setDelegate:0];
  id m_ptr = self->_shareSheet.m_ptr;
  self->_shareSheet.id m_ptr = 0;
  if (m_ptr)
  {
    CFRelease(m_ptr);
  }
}

- (void)shareSheet:(id)a3 willShowActivityItems:(id)a4
{
  id v6 = (void *)[objc_loadWeak(&self->_webView.m_weakReference) UIDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v7 = [(WKContentView *)self webView];
    [v6 _webView:v7 willShareActivityItems:a4];
  }
}

- (void)_showContactPicker:(const void *)a3 completionHandler:(void *)a4
{
  id v7 = [[WKContactPicker alloc] initWithView:[(WKContentView *)self webView]];
  id m_ptr = self->_contactPicker.m_ptr;
  self->_contactPicker.id m_ptr = v7;
  if (m_ptr)
  {
    CFRelease(m_ptr);
    id v7 = (WKContactPicker *)self->_contactPicker.m_ptr;
  }
  [(WKContactPicker *)v7 setDelegate:self];
  uint64_t v9 = self->_contactPicker.m_ptr;

  [v9 presentWithRequestData:a3 completionHandler:a4];
}

- (void)contactPickerDidPresent:(id)a3
{
  id Weak = objc_loadWeak(&self->_webView.m_weakReference);

  [Weak _didPresentContactPicker];
}

- (void)contactPickerDidDismiss:(id)a3
{
  [self->_contactPicker.m_ptr setDelegate:0];
  id m_ptr = self->_contactPicker.m_ptr;
  self->_contactPicker.id m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  id Weak = objc_loadWeak(&self->_webView.m_weakReference);

  [Weak _didDismissContactPicker];
}

- (void)dismissPickersIfNeededWithReason:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  if (objc_msgSend(self->_fileUploadPanel.m_ptr, "dismissIfNeededWithReason:"))
  {
    id m_ptr = self->_fileUploadPanel.m_ptr;
    self->_fileUploadPanel.id m_ptr = 0;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
  }
  if ([self->_shareSheet.m_ptr dismissIfNeededWithReason:v3])
  {
    id v6 = self->_shareSheet.m_ptr;
    self->_shareSheet.id m_ptr = 0;
    if (v6) {
      CFRelease(v6);
    }
  }
  if ([self->_contactPicker.m_ptr dismissIfNeededWithReason:v3])
  {
    id v7 = self->_contactPicker.m_ptr;
    self->_contactPicker.id m_ptr = 0;
    if (v7)
    {
      CFRelease(v7);
    }
  }
}

- (id)inputLabelText
{
  p_focusedElementInformation = &self->_focusedElementInformation;
  uint64_t v3 = *(void *)&self->_anon_938[240];
  if (v3 && *(_DWORD *)(v3 + 4)) {
    return (id)WTF::StringImpl::operator NSString *();
  }
  unint64_t m_identifier = p_focusedElementInformation[4].elementContext.webPageIdentifier.m_value.m_identifier;
  if (m_identifier)
  {
    if (*(_DWORD *)(m_identifier + 4)) {
      return (id)WTF::StringImpl::operator NSString *();
    }
  }
  FloatSize m_size = p_focusedElementInformation[3].elementContext.boundingRect.m_size;
  if (m_size)
  {
    if (*(_DWORD *)(*(void *)&m_size + 4)) {
      return (id)WTF::StringImpl::operator NSString *();
    }
  }
  if (p_focusedElementInformation[4].elementContext.boundingRect.m_location) {
    return (id)WTF::StringImpl::operator NSString *();
  }
  else {
    return &stru_1EEA10550;
  }
}

- (BOOL)_restoreFocusWithToken:(id)a3
{
  uint64_t m_size = self->_focusStateStack.m_size;
  if (m_size)
  {
    BOOL v4 = self->_focusStateStack.m_buffer[m_size - 1];
    self->_focusStateStack.uint64_t m_size = m_size - 1;
    if (v4) {
      [objc_loadWeak(&self->_webView.m_weakReference) _decrementFocusPreservationCount];
    }
  }
  return 0;
}

- (void)startRelinquishingFirstResponderToFocusedElement
{
  if (!self->_longPressCanClick)
  {
    self->_longPressCanClick = 1;
    id Weak = objc_loadWeak(&self->_webView.m_weakReference);
    [Weak _incrementFocusPreservationCount];
  }
}

- (void)stopRelinquishingFirstResponderToFocusedElement
{
  if (self->_longPressCanClick)
  {
    self->_longPressCanClick = 0;
    id Weak = objc_loadWeak(&self->_webView.m_weakReference);
    [Weak _decrementFocusPreservationCount];
  }
}

- (void)_preserveFocusWithToken:(id)a3 destructively:(BOOL)a4
{
  if (self->_inputPeripheral.m_ptr)
  {
    p_focusStateStack = &self->_focusStateStack;
    char v10 = 0;
    uint64_t m_size = self->_focusStateStack.m_size;
    if (m_size != self->_focusStateStack.m_capacity)
    {
      p_focusStateStack->m_buffer[m_size] = 0;
      goto LABEL_9;
    }
    id v7 = (WTF *)(m_size + 1);
    uint64_t v8 = &v10;
  }
  else
  {
    [objc_loadWeak(&self->_webView.m_weakReference) _incrementFocusPreservationCount];
    p_focusStateStack = &self->_focusStateStack;
    char v11 = 1;
    uint64_t m_size = p_focusStateStack->m_size;
    if (m_size != p_focusStateStack->m_capacity)
    {
      p_focusStateStack->m_buffer[m_size] = 1;
      goto LABEL_9;
    }
    id v7 = (WTF *)(m_size + 1);
    uint64_t v8 = &v11;
  }
  uint64_t v9 = (BOOL *)WTF::Vector<WebCore::ApplePayContactField,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)p_focusStateStack, v7, (unint64_t)v8);
  uint64_t m_size = p_focusStateStack->m_size;
  p_focusStateStack->m_buffer[m_size] = *v9;
LABEL_9:
  p_focusStateStack->uint64_t m_size = m_size + 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldIgnoreTouchEvent:(id)a4
{
  self->_touchEventsCanPreventNativeGestures = 1;
  id m_ptr = self->_imageAnalysisContextMenuActionData.var0.__val_.copySubjectResult.m_ptr;
  [a3 locationInView:self];
  if (objc_msgSend(m_ptr, "interactableItemExistsAtPoint:")) {
    return 1;
  }

  return [(WKContentView *)self gestureRecognizer:a3 isInterruptingMomentumScrollingWithEvent:a4];
}

- (BOOL)gestureRecognizer:(id)a3 isInterruptingMomentumScrollingWithEvent:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v5 = (void *)[a4 touchesForGestureRecognizer:a3];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v13 + 1) + 8 * v9) view];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          char v11 = (void *)v10;
        }
        else {
          char v11 = 0;
        }
        if (objc_msgSend(v11, "_wk_isInterruptingDeceleration")) {
          return 1;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  return objc_msgSend(-[WKContentView _scroller](self, "_scroller"), "_wk_isInterruptingDeceleration");
}

- (BOOL)isAnyTouchOverActiveArea:(id)a3
{
  return 1;
}

- (optional<WebKit::InteractionInformationAtPosition>)positionInformationForActionSheetAssistant:(optional<WebKit::InteractionInformationAtPosition> *__return_ptr)retstr
{
  uint64_t v3 = (void *)v1;
  int v5 = (const WebKit::InteractionInformationAtPosition *)(v1 + 1520);
  uint64_t v6 = *(void *)(v1 + 1520);
  if ([v2 needsLinkIndicator]) {
    uint64_t v7 = 16777473;
  }
  else {
    uint64_t v7 = 16777217;
  }
  int v8 = [v3 _shouldUseContextMenus];
  uint64_t v9 = 0x1000000000000;
  if (v8) {
    uint64_t v9 = 0;
  }
  uint64_t v10 = v9 | v7;
  int v11 = objc_msgSend((id)objc_msgSend(v3, "webView"), "_allowAnimationControls");
  uint64_t v12 = 0x10000000000;
  if (!v11) {
    uint64_t v12 = 0;
  }
  double result = (optional<WebKit::InteractionInformationAtPosition> *)objc_msgSend(v3, "ensurePositionInformationIsUpToDate:", v6, v10 | v12);
  if (result)
  {
    double result = (optional<WebKit::InteractionInformationAtPosition> *)WebKit::InteractionInformationAtPosition::InteractionInformationAtPosition((WebKit::InteractionInformationAtPosition *)retstr, v5);
    BOOL v14 = 1;
  }
  else
  {
    BOOL v14 = 0;
    retstr->var0.__null_state_ = 0;
  }
  *(&retstr[1].var0.__engaged_ + 144) = v14;
  return result;
}

- (void)updatePositionInformationForActionSheetAssistant:(id)a3
{
  BYTE1(self->_dataListTextSuggestionsInputView.m_ptr) = 0;
  IntPoint point = self->_positionInformation.request.point;
  if ([a3 needsLinkIndicator]) {
    uint64_t v5 = 16777473;
  }
  else {
    uint64_t v5 = 16777217;
  }
  BOOL v6 = [(WKContentView *)self _shouldUseContextMenus];
  uint64_t v7 = 0x1000000000000;
  if (v6) {
    uint64_t v7 = 0;
  }
  uint64_t v8 = v7 | v5;
  int v9 = objc_msgSend(-[WKContentView webView](self, "webView"), "_allowAnimationControls");
  uint64_t v10 = 0x10000000000;
  if (!v9) {
    uint64_t v10 = 0;
  }

  -[WKContentView requestAsynchronousPositionInformationUpdate:](self, "requestAsynchronousPositionInformationUpdate:", point, v8 | v10);
}

- (void)actionSheetAssistant:(id)a3 performAction:(unsigned __int8)a4
{
}

- (void)_actionSheetAssistant:(id)a3 performAction:(unsigned __int8)a4 onElements:(void *)a5
{
  id m_ptr = self->_page.m_ptr;
  uint64_t v6 = *((void *)m_ptr + 32);
  int v7 = a4;
  uint64_t v8 = a5;
  WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::PerformActionOnElements>(v6, &v7, *(void *)(*((void *)m_ptr + 4) + 1928), 0);
}

- (void)actionSheetAssistant:(id)a3 openElementAtLocation:(CGPoint)a4
{
}

- (void)actionSheetAssistant:(id)a3 shareElementWithURL:(id)a4 rect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  char v30 = 0;
  v31[0] = 0;
  v31[1] = 0;
  *(_OWORD *)BOOL v28 = 0u;
  memset(v29, 0, 25);
  MEMORY[0x19972E8A0](&v26, a4, a3);
  char v27 = 1;
  std::__optional_storage_base<WTF::URL,false>::__assign_from[abi:sn180100]<std::__optional_move_assign_base<WTF::URL,false>>((WTF::StringImpl *)&v29[3], (unsigned __int8 *)&v26);
  if (v27)
  {
    CGFloat v11 = v26.origin.x;
    v26.origin.double x = 0.0;
    if (v11 != 0.0)
    {
      if (**(_DWORD **)&v11 == 2) {
        WTF::StringImpl::destroy(*(WTF::StringImpl **)&v11, v10);
      }
      else {
        **(_DWORD **)&v11 -= 2;
      }
    }
  }
  char v32 = 1;
  -[WKContentView convertRect:toView:](self, "convertRect:toView:", [(WKContentView *)self webView], x, y, width, height);
  v26.origin.double x = v12;
  v26.origin.double y = v13;
  v26.size.double width = v14;
  v26.size.double height = v15;
  WebCore::FloatRect::FloatRect((WebCore::FloatRect *)v25, &v26);
  v25[16] = 1;
  uint64_t v24 = 0;
  [(WKContentView *)self _showShareSheet:v28 inRect:v25 completionHandler:&v24];
  uint64_t v17 = v24;
  uint64_t v24 = 0;
  if (v17) {
    (*(void (**)(uint64_t))(*(void *)v17 + 8))(v17);
  }
  WTF::Vector<WebCore::RawFile,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v31, v16);
  if (v30)
  {
    BOOL v19 = v29[3];
    v29[3] = 0;
    if (v19)
    {
      if (*(_DWORD *)v19 == 2) {
        WTF::StringImpl::destroy(v19, v18);
      }
      else {
        *(_DWORD *)v19 -= 2;
      }
    }
  }
  WTF::Vector<WTF::Ref<WebCore::File,WTF::RawPtrTraits<WebCore::File>,WTF::DefaultRefDerefTraits<WebCore::File>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v29[1], v18);
  BOOL v21 = v29[0];
  v29[0] = 0;
  if (v21)
  {
    if (*(_DWORD *)v21 == 2) {
      WTF::StringImpl::destroy(v21, v20);
    }
    else {
      *(_DWORD *)v21 -= 2;
    }
  }
  BOOL v22 = v28[1];
  v28[1] = 0;
  if (v22)
  {
    if (*(_DWORD *)v22 == 2) {
      WTF::StringImpl::destroy(v22, v20);
    }
    else {
      *(_DWORD *)v22 -= 2;
    }
  }
  int v23 = v28[0];
  v28[0] = 0;
  if (v23)
  {
    if (*(_DWORD *)v23 == 2) {
      WTF::StringImpl::destroy(v23, v20);
    }
    else {
      *(_DWORD *)v23 -= 2;
    }
  }
}

- (void)actionSheetAssistant:(id)a3 shareElementWithImage:(id)a4 rect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  char v49 = 0;
  FloatRect v50 = 0;
  CGFloat v51 = 0.0;
  *(_OWORD *)long long v47 = 0u;
  memset(v48, 0, 25);
  CGFloat v11 = NSString;
  WebCore::localizedString((uint64_t *)&v43, (WebCore *)@"Shared Image", (const __CFString *)a2);
  if (*(void *)&v43.origin.x) {
    CGFloat v12 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    CGFloat v12 = &stru_1EEA10550;
  }
  uint64_t v14 = [v11 stringWithFormat:@"%@.png", v12];
  CGFloat v15 = v43.origin.x;
  v43.origin.double x = 0.0;
  if (v15 != 0.0)
  {
    if (**(_DWORD **)&v15 == 2) {
      WTF::StringImpl::destroy(*(WTF::StringImpl **)&v15, v13);
    }
    else {
      **(_DWORD **)&v15 -= 2;
    }
  }
  MEMORY[0x19972EAD0](&v53, v14);
  FloatRect v45 = UIImagePNGRepresentation((UIImage *)a4);
  WebCore::SharedBuffer::create<NSData *>((WebCore::FragmentedSharedBuffer **)&v45, v16, (uint64_t *)&v46);
  uint64_t v17 = v46;
  IntRect v46 = 0;
  int v54 = v17;
  v43.origin.double x = 0.0;
  v43.origin.double y = 0.0;
  uint64_t v18 = WTF::fastMalloc((WTF *)0x10);
  LODWORD(v43.origin.y) = 1;
  *(void *)&v43.origin.double x = v18;
  uint64_t y_high = HIDWORD(v43.origin.y);
  BOOL v21 = (WTF::StringImpl **)(v18 + 16 * HIDWORD(v43.origin.y));
  BOOL v22 = v53;
  if (v53) {
    *(_DWORD *)v53 += 2;
  }
  *BOOL v21 = v22;
  int v23 = v54;
  if (v54)
  {
    atomic_fetch_add(v54, 1u);
    int v24 = HIDWORD(v43.origin.y);
  }
  else
  {
    int v24 = y_high;
  }
  *(void *)(v18 + 16 * y_high + 8) = v23;
  HIDWORD(v43.origin.y) = v24 + 1;
  if (HIDWORD(v51)) {
    WTF::VectorDestructor<true,WebCore::RawFile>::destruct(v50, (WTF *)((char *)v50 + 16 * HIDWORD(v51)));
  }
  double v25 = v50;
  if (v50)
  {
    FloatRect v50 = 0;
    LODWORD(v51) = 0;
    WTF::fastFree(v25, v19);
  }
  FloatRect v50 = *(WTF **)&v43.origin.x;
  CGFloat v26 = v43.origin.y;
  v43.origin.double x = 0.0;
  v43.origin.double y = 0.0;
  CGFloat v51 = v26;
  WTF::Vector<WebCore::RawFile,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v43, v19);
  BOOL v28 = (unsigned int *)v54;
  int v54 = 0;
  if (v28) {
    WTF::ThreadSafeRefCounted<WebCore::FragmentedSharedBuffer,(WTF::DestructionThread)0>::deref(v28, v27);
  }
  uint64_t v29 = v53;
  uint64_t v53 = 0;
  if (v29)
  {
    if (*(_DWORD *)v29 == 2) {
      WTF::StringImpl::destroy(v29, (WTF::StringImpl *)v27);
    }
    else {
      *(_DWORD *)v29 -= 2;
    }
  }
  char v30 = (unsigned int *)v46;
  IntRect v46 = 0;
  if (v30) {
    WTF::ThreadSafeRefCounted<WebCore::FragmentedSharedBuffer,(WTF::DestructionThread)0>::deref(v30, v27);
  }
  char v52 = 1;
  -[WKContentView convertRect:toView:](self, "convertRect:toView:", [(WKContentView *)self webView], x, y, width, height);
  v43.origin.double x = v31;
  v43.origin.double y = v32;
  v43.size.double width = v33;
  v43.size.double height = v34;
  WebCore::FloatRect::FloatRect((WebCore::FloatRect *)v44, &v43);
  v44[16] = 1;
  uint64_t v53 = 0;
  [(WKContentView *)self _showShareSheet:v47 inRect:v44 completionHandler:&v53];
  IntRect v36 = v53;
  uint64_t v53 = 0;
  if (v36) {
    (*(void (**)(WTF::StringImpl *))(*(void *)v36 + 8))(v36);
  }
  WTF::Vector<WebCore::RawFile,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v50, v35);
  if (v49)
  {
    unsigned int v38 = v48[3];
    v48[3] = 0;
    if (v38)
    {
      if (*(_DWORD *)v38 == 2) {
        WTF::StringImpl::destroy(v38, v37);
      }
      else {
        *(_DWORD *)v38 -= 2;
      }
    }
  }
  WTF::Vector<WTF::Ref<WebCore::File,WTF::RawPtrTraits<WebCore::File>,WTF::DefaultRefDerefTraits<WebCore::File>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v48[1], v37);
  FloatRect v40 = v48[0];
  v48[0] = 0;
  if (v40)
  {
    if (*(_DWORD *)v40 == 2) {
      WTF::StringImpl::destroy(v40, v39);
    }
    else {
      *(_DWORD *)v40 -= 2;
    }
  }
  BOOL v41 = v47[1];
  v47[1] = 0;
  if (v41)
  {
    if (*(_DWORD *)v41 == 2) {
      WTF::StringImpl::destroy(v41, v39);
    }
    else {
      *(_DWORD *)v41 -= 2;
    }
  }
  unint64_t v42 = v47[0];
  v47[0] = 0;
  if (v42)
  {
    if (*(_DWORD *)v42 == 2) {
      WTF::StringImpl::destroy(v42, v39);
    }
    else {
      *(_DWORD *)v42 -= 2;
    }
  }
}

- (BOOL)actionSheetAssistant:(id)a3 shouldIncludeAppLinkActionsForElement:(id)a4
{
  return (*(uint64_t (**)(void, id))(**((void **)self->_page.m_ptr + 13) + 448))(*((void *)self->_page.m_ptr + 13), a4);
}

- (BOOL)actionSheetAssistant:(id)a3 showCustomSheetForElement:(id)a4
{
  uint64_t v6 = (void *)[objc_loadWeak(&self->_webView.m_weakReference) UIDelegate];
  if (objc_opt_respondsToSelector())
  {
    int v7 = objc_msgSend(v6, "_webView:showCustomSheetForElement:", -[WKContentView webView](self, "webView"), a4);
    if (v7)
    {
      if (!*(void *)&self->_dragDropInteractionState.m_lastGlobalPosition.y) {
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42738], "sharedApplication"), "_cancelAllTouches");
      }
      LOBYTE(v7) = 1;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (CGRect)unoccludedWindowBoundsForActionSheetAssistant:(id)a3
{
  p_webView = &self->_webView;
  objc_msgSend((id)objc_msgSend(objc_loadWeak(&self->_webView.m_weakReference), "scrollView"), "adjustedContentInset");
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [objc_loadWeak(&p_webView->m_weakReference) bounds];
  double v14 = v8 + v13;
  double v16 = v6 + v15;
  double v18 = v17 - (v8 + v12);
  double v20 = v19 - (v6 + v10);
  id Weak = objc_loadWeak(&p_webView->m_weakReference);
  uint64_t v22 = [(WKContentView *)self window];

  objc_msgSend(Weak, "convertRect:toView:", v22, v14, v16, v18, v20);
  result.size.double height = v26;
  result.size.double width = v25;
  result.origin.double y = v24;
  result.origin.double x = v23;
  return result;
}

- (RetainPtr<NSArray>)actionSheetAssistant:(id)a3 decideActionsForElement:(id)a4 defaultActions:(RetainPtr<NSArray>)a5
{
  uint64_t v5 = *((void *)self->_page.m_ptr + 13);
  double v6 = *(const void **)a5.m_ptr;
  *(void *)a5.id m_ptr = 0;
  CFTypeRef cf = v6;
  (*(void (**)(uint64_t, id, CFTypeRef *))(*(void *)v5 + 456))(v5, a4, &cf);
  CFTypeRef v7 = cf;
  CFTypeRef cf = 0;
  if (v7) {
    CFRelease(v7);
  }
  return (RetainPtr<NSArray>)v7;
}

- (void)actionSheetAssistant:(id)a3 willStartInteractionWithElement:(id)a4
{
  id m_ptr = self->_page.m_ptr;
  p_positionInformation = &self->_positionInformation;
  uint64_t v6 = *((void *)m_ptr + 32);
  v7[0] = &p_positionInformation->elementContext.var0.var2 + 1;
  v7[1] = p_positionInformation;
  WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::StartInteractionWithElementContextOrPosition>(v6, (uint64_t)v7, *(void *)(*((void *)m_ptr + 4) + 1928), 0);
}

- (void)actionSheetAssistantDidStopInteraction:(id)a3
{
  id m_ptr = self->_page.m_ptr;
  uint64_t v4 = *((void *)m_ptr + 32);
  char v5 = 0;
  WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::StopInteraction>(v4, (uint64_t)&v5, *(void *)(*((void *)m_ptr + 4) + 1928), 0);
}

- (id)dataDetectionContextForPositionInformation:(const void *)a3
{
  char v5 = (void *)[objc_loadWeak(&self->_webView.m_weakReference) UIDelegate];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (id v6 = (id)objc_msgSend((id)objc_msgSend(v5, "_dataDetectionContextForWebView:", -[WKContentView webView](self, "webView")), "mutableCopy")) == 0)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  uint64_t v7 = *((void *)a3 + 25);
  if (v7 && *(_DWORD *)(v7 + 4))
  {
    double v8 = (PAL *)WTF::StringImpl::operator NSString *();
    [v6 setObject:v8 forKeyedSubscript:PAL::get_DataDetectorsUI_kDataDetectorsLeadingText(v8)];
  }
  uint64_t v9 = *((void *)a3 + 26);
  if (v9 && *(_DWORD *)(v9 + 4))
  {
    double v10 = (PAL *)WTF::StringImpl::operator NSString *();
    [v6 setObject:v10 forKeyedSubscript:PAL::get_DataDetectorsUI_kDataDetectorsTrailingText(v10)];
  }
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __75__WKContentView_WKInteraction__dataDetectionContextForPositionInformation___block_invoke;
  v28[3] = &unk_1E5813F58;
  v28[4] = self;
  v28[5] = a3;
  BOOL v11 = __75__WKContentView_WKInteraction__dataDetectionContextForPositionInformation___block_invoke((uint64_t)v28);
  if (!v11) {
    [v6 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:PAL::get_DataDetectorsUI_kDDContextMenuWantsPreviewKey((PAL *)v11)];
  }
  if (*((unsigned char *)a3 + 24)) {
    WebCore::FloatRect::operator CGRect();
  }
  else {
    WebCore::IntRect::operator CGRect();
  }
  uint64_t v16 = -[WKContentView convertRect:toView:](self, "convertRect:toView:", [(WKContentView *)self containerForContextMenuHintPreviews], v12, v13, v14, v15);
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  ((void (*)(uint64_t))*MEMORY[0x1E4FB6340])(v16);
  double v26 = objc_msgSend(v25, "updateContext:withSourceRect:", v6, v18, v20, v22, v24);
  if (v6) {
    CFRelease(v6);
  }
  return v26;
}

BOOL __75__WKContentView_WKInteraction__dataDetectionContextForPositionInformation___block_invoke(uint64_t a1)
{
  if (![(id)WTF::URL::operator NSURL *() iTunesStoreURL]) {
    return 1;
  }
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 424);
  uint64_t v3 = *(void *)(*(void *)(v2 + 312) + 24);
  return ((v3 & 0x8000000000000000) == 0 || v3 == -1) && (*(_WORD *)(v2 + 1378) & 1) == 0;
}

- (id)dataDetectionContextForActionSheetAssistant:(id)a3 positionInformation:(const void *)a4
{
  return [(WKContentView *)self dataDetectionContextForPositionInformation:a4];
}

- (void)actionSheetAssistant:(id)a3 getAlternateURLForImage:(id)a4 completion:(id)a5
{
  double v8 = (void *)[objc_loadWeak(&self->_webView.m_weakReference) UIDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v9 = [(WKContentView *)self webView];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __88__WKContentView_WKInteraction__actionSheetAssistant_getAlternateURLForImage_completion___block_invoke;
    v11[3] = &unk_1E5813F80;
    v11[4] = a5;
    [v8 _webView:v9 getAlternateURLFromImage:a4 completionHandler:v11];
  }
  else
  {
    double v10 = (void (*)(id, void, void))*((void *)a5 + 2);
    v10(a5, 0, 0);
  }
}

uint64_t __88__WKContentView_WKInteraction__actionSheetAssistant_getAlternateURLForImage_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)additionalMediaControlsContextMenuItemsForActionSheetAssistant:(id)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (void)actionSheetAssistantDidShowContextMenu:(id)a3
{
  id Weak = objc_loadWeak(&self->_webView.m_weakReference);

  [Weak _didShowContextMenu];
}

- (void)actionSheetAssistantDidDismissContextMenu:(id)a3
{
  id Weak = objc_loadWeak(&self->_webView.m_weakReference);

  [Weak _didDismissContextMenu];
}

- (void)_targetedPreviewContainerDidRemoveLastSubview:(id)a3
{
  if (self->_contextMenuHintContainerView.m_ptr == a3) {
    [(WKContentView *)self _removeContextMenuHintContainerIfPossible];
  }
}

- (BOOL)_shouldUseContextMenusForFormControls
{
  BOOL v3 = [(WKContentView *)self _formControlRefreshEnabled];
  if (v3)
  {
    LOBYTE(v3) = [(WKContentView *)self _shouldUseContextMenus];
  }
  return v3;
}

- (BOOL)_shouldAvoidResizingWhenInputViewBoundsChange
{
  return self->_anon_938[292];
}

- (BOOL)_shouldAvoidScrollingWhenFocusedContentIsVisible
{
  return self->_anon_938[293];
}

- (BOOL)_shouldUseLegacySelectPopoverDismissalBehavior
{
  if ((PAL::currentUserInterfaceIdiomIsSmallScreen((PAL *)self) & 1) != 0
    || self->_anon_938[113] != 16
    || !self->_anon_938[294])
  {
    return 0;
  }

  return MEMORY[0x1F416D948]();
}

- (BOOL)shouldDeferGestureDueToImageAnalysis:(id)a3
{
  if (objc_msgSend(a3, "_wk_isTextInteractionLoupeGesture")) {
    return 1;
  }

  return objc_msgSend(a3, "_wk_isTapAndAHalf");
}

- (unsigned)_dataOwnerForPasteboard:(BOOL)a3
{
  if (a3) {
    uint64_t v4 = [(WKContentView *)self _dataOwnerForCopy];
  }
  else {
    uint64_t v4 = [(WKContentView *)self _dataOwnerForPaste];
  }
  unint64_t v5 = [objc_loadWeak(&self->_webView.m_weakReference) _effectiveDataOwner:v4];
  if (v5 >= 4) {
    return 0;
  }
  else {
    return v5;
  }
}

- (RetainPtr<WKTargetedPreviewContainer>)_createPreviewContainerWithLayerName:(id)a3
{
  unint64_t v5 = v3;
  id v6 = [[WKTargetedPreviewContainer alloc] initWithContentView:self];
  void *v5 = v6;
  objc_msgSend((id)-[WKTargetedPreviewContainer layer](v6, "layer"), "setAnchorPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  return (RetainPtr<WKTargetedPreviewContainer>)objc_msgSend((id)-[WKTargetedPreviewContainer layer](v6, "layer"), "setName:", a3);
}

- (id)containerForDropPreviews
{
  id result = self->_dropPreviewContainerView.m_ptr;
  if (!result)
  {
    [(WKContentView *)self _createPreviewContainerWithLayerName:@"Drop Preview Container"];
    uint64_t v4 = (void *)cf;
    CFTypeRef cf = 0;
    id m_ptr = self->_dropPreviewContainerView.m_ptr;
    self->_dropPreviewContainerView.id m_ptr = v4;
    if (m_ptr)
    {
      CFRelease(m_ptr);
      CFTypeRef v6 = cf;
      CFTypeRef cf = 0;
      if (v6) {
        CFRelease(v6);
      }
    }
    [self->_interactionViewsContainerView.m_ptr addSubview:self->_dropPreviewContainerView.m_ptr];
    return self->_dropPreviewContainerView.m_ptr;
  }
  return result;
}

- (void)_removeContainerForDropPreviews
{
  id m_ptr = self->_dropPreviewContainerView.m_ptr;
  if (m_ptr)
  {
    self->_dropPreviewContainerView.id m_ptr = 0;
    [m_ptr removeFromSuperview];
    CFRelease(m_ptr);
  }
}

- (id)containerForDragPreviews
{
  id result = self->_dragPreviewContainerView.m_ptr;
  if (!result)
  {
    [(WKContentView *)self _createPreviewContainerWithLayerName:@"Drag Preview Container"];
    uint64_t v4 = (void *)cf;
    CFTypeRef cf = 0;
    id m_ptr = self->_dragPreviewContainerView.m_ptr;
    self->_dragPreviewContainerView.id m_ptr = v4;
    if (m_ptr)
    {
      CFRelease(m_ptr);
      CFTypeRef v6 = cf;
      CFTypeRef cf = 0;
      if (v6) {
        CFRelease(v6);
      }
    }
    [self->_interactionViewsContainerView.m_ptr addSubview:self->_dragPreviewContainerView.m_ptr];
    return self->_dragPreviewContainerView.m_ptr;
  }
  return result;
}

- (void)_removeContainerForDragPreviews
{
  id m_ptr = self->_dragPreviewContainerView.m_ptr;
  if (m_ptr)
  {
    self->_dragPreviewContainerView.id m_ptr = 0;
    [m_ptr removeFromSuperview];
    CFRelease(m_ptr);
  }
}

- (id)containerForContextMenuHintPreviews
{
  if (!self->_contextMenuHintContainerView.m_ptr)
  {
    [(WKContentView *)self _createPreviewContainerWithLayerName:@"Context Menu Hint Preview Container"];
    id m_ptr = self->_contextMenuHintContainerView.m_ptr;
    self->_contextMenuHintContainerView.id m_ptr = cf;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    uint64_t v4 = objc_msgSend(-[WKContentView webView](self, "webView"), "UIDelegate");
    if (v4
      && (unint64_t v5 = (void *)v4, (objc_opt_respondsToSelector() & 1) != 0)
      && (CFTypeRef v6 = objc_msgSend(v5, "_contextMenuHintPreviewContainerViewForWebView:", -[WKContentView webView](self, "webView"))) != 0|| (CFTypeRef v6 = self->_interactionViewsContainerView.m_ptr) != 0)
    {
      CFRetain(v6);
    }
    [v6 addSubview:self->_contextMenuHintContainerView.m_ptr];
    if (v6) {
      CFRelease(v6);
    }
  }
  return self->_contextMenuHintContainerView.m_ptr;
}

- (void)_removeContainerForContextMenuHintPreviews
{
  id m_ptr = self->_contextMenuHintContainerView.m_ptr;
  if (m_ptr)
  {
    self->_contextMenuHintContainerView.id m_ptr = 0;
    [m_ptr removeFromSuperview];
    CFRelease(m_ptr);
    objc_storeWeak(&self->_scrollViewForTargetedPreview.m_weakReference, 0);
    self->_scrollViewForTargetedPreviewInitialOffset = (CGPoint)*MEMORY[0x1E4F1DAD8];
  }
}

- (void)_updateTargetedPreviewScrollViewUsingContainerScrollingNodeID:()optional<WebCore:()WTF:(unsigned long)long :(WTF::SupportsObjectIdentifierNullState::Yes>>> *)a3 ObjectIdentifierMainThreadAccessTraits<uint64_t> :ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::ScrollingNodeIDType
{
  if (a3->var1)
  {
    if (*((void *)self->_page.m_ptr + 31))
    {
      uint64_t v4 = WebKit::RemoteScrollingCoordinatorProxyIOS::scrollViewForScrollingNodeID();
      if (v4) {
        objc_storeWeak(&self->_scrollViewForTargetedPreview.m_weakReference, v4);
      }
    }
  }
  p_scrollViewForTargetedPreview = &self->_scrollViewForTargetedPreview;
  id WeakRetained = objc_loadWeakRetained(&self->_scrollViewForTargetedPreview.m_weakReference);
  if (WeakRetained) {
    CFRelease(WeakRetained);
  }
  else {
    objc_storeWeak(&p_scrollViewForTargetedPreview->m_weakReference, (id)objc_msgSend(-[WKContentView webView](self, "webView"), "scrollView"));
  }
  objc_msgSend(objc_loadWeak(&p_scrollViewForTargetedPreview->m_weakReference), "convertPoint:toView:", objc_msgSend(self->_contextMenuHintContainerView.m_ptr, "superview"), *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  self->_scrollViewForTargetedPreviewInitialOffset.double x = v7;
  self->_scrollViewForTargetedPreviewInitialOffset.double y = v8;
}

- (BOOL)deferringGestureRecognizer:(id)a3 willBeginTouchesWithEvent:(id)a4
{
  WebKit::GestureRecognizerConsistencyEnforcer::beginTracking((WebKit::GestureRecognizerConsistencyEnforcer *)[(WKContentView *)self gestureRecognizerConsistencyEnforcer], (WKDeferringGestureRecognizer *)a3);
  id m_ptr = self->_imageAnalysisContextMenuActionData.var0.__val_.copySubjectResult.m_ptr;
  [a3 locationInView:self];
  if (objc_msgSend(m_ptr, "interactableItemExistsAtPoint:")) {
    return 0;
  }
  else {
    return ![(WKContentView *)self gestureRecognizer:a3 isInterruptingMomentumScrollingWithEvent:a4];
  }
}

- (void)deferringGestureRecognizer:(id)a3 didTransitionToState:(int64_t)a4
{
  if ((unint64_t)(a4 - 3) <= 2)
  {
    CFTypeRef v6 = [(WKContentView *)self gestureRecognizerConsistencyEnforcer];
    WebKit::GestureRecognizerConsistencyEnforcer::endTracking(v6, (WKDeferringGestureRecognizer *)a3);
  }
}

- (void)deferringGestureRecognizer:(id)a3 didEndTouchesWithEvent:(id)a4
{
  WebKit::GestureRecognizerConsistencyEnforcer::endTracking((WebKit::GestureRecognizerConsistencyEnforcer *)[(WKContentView *)self gestureRecognizerConsistencyEnforcer], (WKDeferringGestureRecognizer *)a3);
  if (![a3 state])
  {
    id m_ptr = self->_page.m_ptr;
    if (*((void *)m_ptr + 107))
    {
      if ([(WKContentView *)self _isTouchStartDeferringGesture:a3]) {
        return;
      }
      id m_ptr = self->_page.m_ptr;
    }
    if ((*((unsigned char *)m_ptr + 872) != 1 || self->_touchMoveDeferringGestureRecognizer.m_ptr != a3)
      && (!*((void *)m_ptr + 108)
       || ![(WKContentView *)self _isTouchEndDeferringGesture:a3])
      && [self->_touchEventGestureRecognizer.m_ptr state])
    {
      [a3 setState:5];
    }
  }
}

- (BOOL)deferringGestureRecognizer:(id)a3 shouldDeferOtherGestureRecognizer:(id)a4
{
  if ([(WKContentView *)self _touchEventsMustRequireGestureRecognizerToFail:a4])
  {
    goto LABEL_17;
  }
  if (self->_failedTouchStartDeferringGestures.__engaged_)
  {
    m_tableForLLDB = self->_failedTouchStartDeferringGestures.var0.__val_.m_impl.var0.m_tableForLLDB;
    if (m_tableForLLDB)
    {
      int v8 = *(m_tableForLLDB - 2);
      unint64_t v9 = ((unint64_t)a3 + ~((void)a3 << 32)) ^ (((unint64_t)a3 + ~((void)a3 << 32)) >> 22);
      unint64_t v10 = 9 * ((v9 + ~(v9 << 13)) ^ ((v9 + ~(v9 << 13)) >> 8));
      unint64_t v11 = (v10 ^ (v10 >> 15)) + ~((v10 ^ (v10 >> 15)) << 27);
      unsigned int v12 = v8 & ((v11 >> 31) ^ v11);
      id v13 = *(id *)&m_tableForLLDB[2 * v12];
      if (v13 == a3)
      {
LABEL_8:
        if (![a3 state]) {
          goto LABEL_17;
        }
      }
      else
      {
        int v14 = 1;
        while (v13)
        {
          unsigned int v12 = (v12 + v14) & v8;
          id v13 = *(id *)&m_tableForLLDB[2 * v12];
          ++v14;
          if (v13 == a3) {
            goto LABEL_8;
          }
        }
      }
    }
  }
  if (self->_keyboardDismissalGestureRecognizer.m_ptr == a4) {
    goto LABEL_17;
  }
  id Weak = objc_loadWeak(&self->_webView.m_weakReference);
  id v16 = (id)[a4 view];
  if (!v16)
  {
LABEL_13:
    if ([(WKContentView *)self _gestureRecognizerCanBePreventedByTouchEvents:a4])
    {
      goto LABEL_14;
    }
LABEL_17:
    char isKindOfClass = 0;
    return isKindOfClass & 1;
  }
  while (v16 != Weak)
  {
    id v16 = (id)[v16 superview];
    if (!v16) {
      goto LABEL_13;
    }
  }
LABEL_14:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || self->_touchEventGestureRecognizer.m_ptr == a4
    || ([self->_mouseInteraction.m_ptr hasGesture:a4] & 1) != 0)
  {
    goto LABEL_17;
  }
  if (self->_imageAnalysisDeferringGestureRecognizer.m_ptr != a3)
  {
    if (self->_touchMoveDeferringGestureRecognizer.m_ptr == a3)
    {
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
    if (-[WKContentView _isContextMenuGestureRecognizerForFailureRelationships:](self, "_isContextMenuGestureRecognizerForFailureRelationships:", a4)|| -[WKContentView _isDragInitiationGestureRecognizer:](self, "_isDragInitiationGestureRecognizer:", a4)|| self->_actionToPerformAfterReceivingEditDragSnapshot.m_block == a4|| (objc_msgSend(a4, "_wk_isTapAndAHalf") & 1) != 0|| (objc_msgSend(a4, "_wk_isTextInteractionLoupeGesture") & 1) != 0|| self->_highlightLongPressGestureRecognizer.m_ptr == a4)
    {
      BOOL v20 = 1;
    }
    else
    {
      objc_opt_class();
      char v19 = objc_opt_isKindOfClass();
      BOOL v20 = 0;
      if (a4 && (v19 & 1) != 0) {
        BOOL v20 = (unint64_t)[a4 numberOfTapsRequired] >= 2
      }
           && (unint64_t)[a4 numberOfTouchesRequired] < 2;
    }
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (self->_touchEndDeferringGestureRecognizerForSyntheticTapGestures.m_ptr == a3) {
        return isKindOfClass & 1;
      }
      if (self->_touchEndDeferringGestureRecognizerForDelayedResettableGestures.m_ptr == a3)
      {
        char isKindOfClass = v20 & ~isKindOfClass;
        return isKindOfClass & 1;
      }
      if (self->_touchEndDeferringGestureRecognizerForImmediatelyResettableGestures.m_ptr == a3)
      {
        char isKindOfClass = (isKindOfClass | v20) ^ 1;
        return isKindOfClass & 1;
      }
    }
    if (isKindOfClass)
    {
      uint64_t v21 = 456;
    }
    else if (v20)
    {
      uint64_t v21 = 448;
    }
    else
    {
      uint64_t v21 = 440;
    }
    char isKindOfClass = *(Class *)((char *)&self->super.super.super.super.isa + v21) == a3;
    return isKindOfClass & 1;
  }

  return [(WKContentView *)self shouldDeferGestureDueToImageAnalysis:a4];
}

- (void)_didChangeDragInteractionPolicy
{
  uint64_t v2 = *(void **)&self->_dragDropInteractionState.m_activeDragSources.m_capacity;
  uint64_t v3 = objc_msgSend(-[WKContentView webView](self, "webView"), "_dragInteractionPolicy");
  if (v3 == 1)
  {
    uint64_t v4 = 1;
  }
  else if (v3 == 2)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F42998] isEnabledByDefault];
  }

  [v2 setEnabled:v4];
}

- (double)dragLiftDelay
{
  uint64_t v2 = objc_msgSend((id)objc_msgSend(-[WKContentView webView](self, "webView"), "configuration"), "_dragLiftDelay");
  if (v2 == 1) {
    return 0.5;
  }
  if (v2 == 2) {
    return 0.65;
  }

  MEMORY[0x1F4102EE8]();
  return result;
}

- (id)webViewUIDelegate
{
  id Weak = objc_loadWeak(&self->_webView.m_weakReference);

  return (id)[Weak UIDelegate];
}

- (void)teardownDragAndDropInteractions
{
  if (*(void *)&self->_dragDropInteractionState.m_activeDragSources.m_capacity) {
    -[WKContentView removeInteraction:](self, "removeInteraction:");
  }
  if (self->_dragDropInteractionState.m_defaultDropPreviews.m_impl.var0.m_table) {
    -[WKContentView removeInteraction:](self, "removeInteraction:");
  }
  uint64_t v3 = *(const void **)&self->_dragDropInteractionState.m_activeDragSources.m_capacity;
  *(void *)&self->_dragDropInteractionState.m_activeDragSources.m_capacitdouble y = 0;
  if (v3) {
    CFRelease(v3);
  }
  m_table = self->_dragDropInteractionState.m_defaultDropPreviews.m_impl.var0.m_table;
  self->_dragDropInteractionState.m_defaultDropPreviews.m_impl.var0.m_table = 0;
  if (m_table) {
    CFRelease(m_table);
  }

  [(WKContentView *)self cleanUpDragSourceSessionState];
}

- (void)_startDrag:(RetainPtr<CGImage *>)a3 item:(const void *)a4
{
  uint64_t v7 = *((void *)a4 + 40);
  if (v7 && *(_DWORD *)(v7 + 4)) {
    [(WKContentView *)self _prepareToDragPromisedAttachment:(char *)a4 + 320];
  }
  id v8 = objc_alloc(MEMORY[0x1E4F42A80]);
  id m_ptr = self->_page.m_ptr;
  uint64_t v10 = 764;
  if (!*((unsigned char *)m_ptr + 768)) {
    uint64_t v10 = 760;
  }
  unint64_t v11 = (const void *)[v8 initWithCGImage:*(void *)a3.m_ptr scale:0 orientation:*(float *)((char *)m_ptr + v10)];
  WebKit::DragDropInteractionState::stageDragItem((uint64_t)&self->_pendingRunModalJavaScriptDialogCallback, (uint64_t)a4, v11);
  if (v11)
  {
    CFRelease(v11);
  }
}

- (void)_didHandleAdditionalDragItemsRequest:(BOOL)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  p_pendingRunModalJavaScriptDialogCallback = &self->_pendingRunModalJavaScriptDialogCallback;
  uint64_t v4 = *(void (***)(void, void))&self->_dragDropInteractionState.m_didBeginDragging;
  *(void *)&self->_dragDropInteractionState.m_didBeginDragging = 0;
  if (v4)
  {
    BOOL v5 = a3;
    uint64_t v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4FB6DC0], "sharedInstance"), "takeRegistrationLists");
    if (v5
      && (id v8 = v7, [v7 count])
      && LOBYTE(p_pendingRunModalJavaScriptDialogCallback[49].m_function.m_callableWrapper.__ptr_.__value_)
      && LOBYTE(p_pendingRunModalJavaScriptDialogCallback[10].m_function.m_callableWrapper.__ptr_.__value_))
    {
      long long v9 = *(_OWORD *)&p_pendingRunModalJavaScriptDialogCallback[12].m_function.m_callableWrapper.__ptr_.__value_;
      v29[0] = *(_OWORD *)&p_pendingRunModalJavaScriptDialogCallback[10].m_function.m_callableWrapper.__ptr_.__value_;
      v29[1] = v9;
      int value = p_pendingRunModalJavaScriptDialogCallback[15].m_function.m_callableWrapper.__ptr_.__value_;
      char v30 = p_pendingRunModalJavaScriptDialogCallback[14].m_function.m_callableWrapper.__ptr_.__value_;
      CFTypeRef cf = value;
      if (value) {
        CFRetain(value);
      }
      std::__optional_copy_base<WebCore::TextIndicatorData,false>::__optional_copy_base[abi:sn180100]((WebCore::TextIndicatorData *)&v32, (const WebCore::TextIndicatorData *)&p_pendingRunModalJavaScriptDialogCallback[16]);
      std::__optional_copy_base<WebCore::Path,false>::__optional_copy_base[abi:sn180100]((WebCore::Path *)&v40, (const WebCore::Path *)&p_pendingRunModalJavaScriptDialogCallback[31]);
      unint64_t v11 = (WTF::StringImpl *)p_pendingRunModalJavaScriptDialogCallback[41].m_function.m_callableWrapper.__ptr_.__value_;
      if (v11) {
        *(_DWORD *)v11 += 2;
      }
      long long v44 = v11;
      unsigned int v12 = (WTF::StringImpl *)p_pendingRunModalJavaScriptDialogCallback[42].m_function.m_callableWrapper.__ptr_.__value_;
      if (v12) {
        *(_DWORD *)v12 += 2;
      }
      FloatRect v45 = v12;
      long long v46 = *(_OWORD *)&p_pendingRunModalJavaScriptDialogCallback[43].m_function.m_callableWrapper.__ptr_.__value_;
      long long v47 = *(_OWORD *)&p_pendingRunModalJavaScriptDialogCallback[45].m_function.m_callableWrapper.__ptr_.__value_;
      long long v48 = *(_OWORD *)&p_pendingRunModalJavaScriptDialogCallback[47].m_function.m_callableWrapper.__ptr_.__value_;
      id v13 = [(WKContentView *)self _itemsForBeginningOrAddingToSessionWithRegistrationLists:v8 stagedDragSource:v29];
      int v14 = qword_1EB357DA8;
      if (os_log_type_enabled((os_log_t)qword_1EB357DA8, OS_LOG_TYPE_DEFAULT))
      {
        double v15 = p_pendingRunModalJavaScriptDialogCallback[5].m_function.m_callableWrapper.__ptr_.__value_;
        int v25 = 134218240;
        double v26 = v15;
        __int16 v27 = 2048;
        uint64_t v28 = [v13 count];
        _os_log_impl(&dword_1985F2000, v14, OS_LOG_TYPE_DEFAULT, "Drag session: %p adding %tu items", (uint8_t *)&v25, 0x16u);
      }
      WebKit::DragDropInteractionState::clearStagedDragSource((uint64_t)p_pendingRunModalJavaScriptDialogCallback, (WTF::StringImpl *)([v13 count] != 0));
      ((void (**)(void, id))v4)[2](v4, v13);
      if ([v13 count]) {
        WebKit::WebPageProxy::didStartDrag((uint64_t)self->_page.m_ptr);
      }
      double v17 = v45;
      FloatRect v45 = 0;
      if (v17)
      {
        if (*(_DWORD *)v17 == 2) {
          WTF::StringImpl::destroy(v17, v16);
        }
        else {
          *(_DWORD *)v17 -= 2;
        }
      }
      double v18 = v44;
      long long v44 = 0;
      if (v18)
      {
        if (*(_DWORD *)v18 == 2) {
          WTF::StringImpl::destroy(v18, v16);
        }
        else {
          *(_DWORD *)v18 -= 2;
        }
      }
      if (v43)
      {
        if (v42 != -1) {
          ((void (*)(int *, uint64_t *))off_1EEA0E610[v42])(&v25, &v41);
        }
        int v42 = -1;
      }
      if (v39)
      {
        if ((v38 & 0x8000000000000) != 0)
        {
          double v24 = (unsigned int *)(v38 & 0xFFFFFFFFFFFFLL);
          if (atomic_fetch_add((atomic_uint *volatile)(v38 & 0xFFFFFFFFFFFFLL), 0xFFFFFFFF) == 1)
          {
            atomic_store(1u, v24);
            WTF::fastFree((WTF *)v24, v16);
          }
        }
        char v19 = v37;
        uint64_t v37 = 0;
        if (v19)
        {
          if (v19[2] == 1) {
            (*(void (**)(_DWORD *))(*(void *)v19 + 8))(v19);
          }
          else {
            --v19[2];
          }
        }
        BOOL v20 = v36;
        IntRect v36 = 0;
        if (v20)
        {
          if (v20[2] == 1) {
            (*(void (**)(_DWORD *))(*(void *)v20 + 8))(v20);
          }
          else {
            --v20[2];
          }
        }
        uint64_t v21 = v35;
        char v35 = 0;
        if (v21)
        {
          if (v21[2] == 1) {
            (*(void (**)(_DWORD *))(*(void *)v21 + 8))(v21);
          }
          else {
            --v21[2];
          }
        }
        double v22 = v33;
        if (v33)
        {
          CGFloat v33 = 0;
          int v34 = 0;
          WTF::fastFree(v22, v16);
        }
      }
      CFTypeRef v23 = cf;
      CFTypeRef cf = 0;
      if (v23) {
        CFRelease(v23);
      }
    }
    else
    {
      WebKit::DragDropInteractionState::clearStagedDragSource((uint64_t)p_pendingRunModalJavaScriptDialogCallback, 0);
      v4[2](v4, MEMORY[0x1E4F1CBF0]);
    }
  }
  _Block_release(v4);
}

- (void)_didHandleDragStartRequest:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  p_pendingRunModalJavaScriptDialogCallback = &self->_pendingRunModalJavaScriptDialogCallback;
  CGFloat y = self->_dragDropInteractionState.m_adjustedPositionForDragEnd.y;
  self->_dragDropInteractionState.m_adjustedPositionForDragEnd.CGFloat y = 0.0;
  uint64_t v7 = qword_1EB357DA8;
  if (os_log_type_enabled((os_log_t)qword_1EB357DA8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&uint8_t buf[4] = v3;
    *(_WORD *)&buf[8] = 2048;
    *(CGFloat *)&buf[10] = y;
    _os_log_impl(&dword_1985F2000, v7, OS_LOG_TYPE_DEFAULT, "Handling drag start request (started: %d, completion block: %p)", buf, 0x12u);
  }
  if (y != 0.0) {
    (*(void (**)(CGFloat))(*(void *)&y + 16))(COERCE_CGFLOAT(*(void *)&y));
  }
  if (!objc_msgSend((id)objc_msgSend(p_pendingRunModalJavaScriptDialogCallback[5].m_function.m_callableWrapper.__ptr_.__value_, "items"), "count"))
  {
    *(_OWORD *)buf = *(_OWORD *)&p_pendingRunModalJavaScriptDialogCallback[2].m_function.m_callableWrapper.__ptr_.__value_;
    WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v17, (const CGPoint *)buf);
    float v8 = roundf(v17[0]);
    uint64_t v9 = 0x7FFFFFFFLL;
    uint64_t v10 = (int)v8;
    if (v8 <= -2147500000.0) {
      uint64_t v10 = 0x80000000;
    }
    if (v8 < 2147500000.0) {
      uint64_t v9 = v10;
    }
    float v11 = roundf(v17[1]);
    uint64_t v12 = 0x7FFFFFFF00000000;
    unint64_t v13 = 0x8000000000000000;
    if (v11 > -2147500000.0) {
      unint64_t v13 = (unint64_t)(int)v11 << 32;
    }
    if (v11 < 2147500000.0) {
      uint64_t v12 = v13;
    }
    uint64_t v18 = v12 | v9;
    [(WKContentView *)self cleanUpDragSourceSessionState];
    if (v3)
    {
      id m_ptr = self->_page.m_ptr;
      buf[0] = 0;
      buf[16] = 0;
      IntSize v15 = (IntSize)&v18;
      IntPoint v16 = (IntPoint)buf;
      WebKit::WebPageProxy::dragEnded((uint64_t)m_ptr, v15, &v18, 0, v16);
    }
  }
  _Block_release(*(const void **)&y);
}

- (void)computeClientAndGlobalPointsForDropSession:(id)a3 outClientPoint:(CGPoint *)a4 outGlobalPoint:(CGPoint *)a5
{
  [a3 locationInView:self];
  if (a4)
  {
    a4->double x = v7;
    a4->CGFloat y = v8;
  }
  if (a5)
  {
    a5->double x = v7;
    a5->CGFloat y = v8;
  }
}

- (DragData)dragDataForDropSession:(SEL)a3 dragDestinationAction:(id)a4
{
  [(WKContentView *)self computeClientAndGlobalPointsForDropSession:a4 outClientPoint:&v25 outGlobalPoint:&v26];
  char v6 = 0;
  uint64_t v7 = 0;
  LODWORD(v24) = 134480385;
  WORD2(v24) = 8208;
  do
    v6 |= *((unsigned char *)&v24 + v7++);
  while (v7 != 6);
  [a4 allowsMoveOperation];
  WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v23, &v25);
  float v8 = roundf(v23[0]);
  uint64_t v9 = 0x7FFFFFFFLL;
  uint64_t v10 = (int)v8;
  if (v8 <= -2147500000.0) {
    uint64_t v10 = 0x80000000;
  }
  if (v8 < 2147500000.0) {
    uint64_t v9 = v10;
  }
  float v11 = roundf(v23[1]);
  uint64_t v12 = 0x7FFFFFFF00000000;
  unint64_t v13 = 0x8000000000000000;
  if (v11 > -2147500000.0) {
    unint64_t v13 = (unint64_t)(int)v11 << 32;
  }
  if (v11 < 2147500000.0) {
    uint64_t v12 = v13;
  }
  uint64_t v24 = v12 | v9;
  WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v21, &v26);
  float v14 = roundf(v21[0]);
  uint64_t v15 = 0x7FFFFFFFLL;
  uint64_t v16 = (int)v14;
  if (v14 <= -2147500000.0) {
    uint64_t v16 = 0x80000000;
  }
  if (v14 < 2147500000.0) {
    uint64_t v15 = v16;
  }
  float v17 = roundf(v21[1]);
  uint64_t v18 = 0x7FFFFFFF00000000;
  unint64_t v19 = 0x8000000000000000;
  if (v17 > -2147500000.0) {
    unint64_t v19 = (unint64_t)(int)v17 << 32;
  }
  if (v17 < 2147500000.0) {
    uint64_t v18 = v19;
  }
  uint64_t v22 = v18 | v15;
  return (DragData *)WebCore::DragData::DragData();
}

- (void)cleanUpDragSourceSessionState
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (!self->_treatAsContentEditableUntilNextEditorStateUpdate)
  {
    p_pendingRunModalJavaScriptDialogCallback = &self->_pendingRunModalJavaScriptDialogCallback;
    if (*(void *)&self->_dragDropInteractionState.m_lastGlobalPosition.y
      || BYTE1(self->_dragDropInteractionState.m_lastGlobalPosition.x))
    {
      uint64_t v4 = qword_1EB357DA8;
      if (os_log_type_enabled((os_log_t)qword_1EB357DA8, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v21[0]) = 67109120;
        DWORD1(v21[0]) = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4FB6DC0], "sharedInstance"), "hasPendingOperation");
        _os_log_impl(&dword_1985F2000, v4, OS_LOG_TYPE_DEFAULT, "Cleaning up dragging state (has pending operation: %d)", (uint8_t *)v21, 8u);
      }
    }
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4FB6DC0], "sharedInstance"), "hasPendingOperation") & 1) == 0) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4FB6DC0], "sharedInstance"), "setItemProviders:", 0);
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4FB6DC0], "sharedInstance"), "clearRegistrationLists");
    [(WKContentView *)self _restoreEditMenuIfNeeded];
    [(WKContentView *)self _removeContainerForDragPreviews];
    BOOL v5 = *(void **)self->_anon_dc8;
    *(void *)self->_anon_dc8 = 0;
    [v5 removeFromSuperview];
    if (v5) {
      CFRelease(v5);
    }
    [(WKContentView *)self _removeDropCaret];
    BYTE1(self->_dragDropInteractionState.m_finalDropPreviews.m_impl.var0.m_table) = 0;
    WebKit::DragDropInteractionState::dragAndDropSessionsDidBecomeInactive((WebKit::DragDropInteractionState *)p_pendingRunModalJavaScriptDialogCallback);
    long long v6 = *MEMORY[0x1E4F1DAD8];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    memset(v25, 0, sizeof(v25));
    long long v7 = *MEMORY[0x1E4F1DAD8];
    v21[0] = v6;
    v21[1] = v7;
    long long v24 = 0uLL;
    long long v26 = 0u;
    long long v27 = 0u;
    *(_OWORD *)&p_pendingRunModalJavaScriptDialogCallback->m_function.m_callableWrapper.__ptr_.__value_ = v6;
    *(_OWORD *)&p_pendingRunModalJavaScriptDialogCallback[2].m_function.m_callableWrapper.__ptr_.__value_ = v7;
    LOWORD(p_pendingRunModalJavaScriptDialogCallback[4].m_function.m_callableWrapper.__ptr_.__value_) = v22;
    *((void *)&v23 + 1) = 0;
    *((void *)&v22 + 1) = 0;
    int value = p_pendingRunModalJavaScriptDialogCallback[5].m_function.m_callableWrapper.__ptr_.__value_;
    p_pendingRunModalJavaScriptDialogCallback[5].m_function.m_callableWrapper.__ptr_.__value_ = 0;
    if (value) {
      CFRelease(value);
    }
    *(void *)&long long v23 = 0;
    uint64_t v9 = p_pendingRunModalJavaScriptDialogCallback[6].m_function.m_callableWrapper.__ptr_.__value_;
    p_pendingRunModalJavaScriptDialogCallback[6].m_function.m_callableWrapper.__ptr_.__value_ = 0;
    if (v9) {
      CFRelease(v9);
    }
    _Block_release(p_pendingRunModalJavaScriptDialogCallback[7].m_function.m_callableWrapper.__ptr_.__value_);
    uint64_t v10 = (void *)*((void *)&v23 + 1);
    *((void *)&v23 + 1) = 0;
    p_pendingRunModalJavaScriptDialogCallback[7].m_function.m_callableWrapper.__ptr_.__value_ = v10;
    _Block_release(p_pendingRunModalJavaScriptDialogCallback[8].m_function.m_callableWrapper.__ptr_.__value_);
    float v11 = p_pendingRunModalJavaScriptDialogCallback[9].m_function.m_callableWrapper.__ptr_.__value_;
    long long v12 = v24;
    long long v24 = 0uLL;
    *(_OWORD *)&p_pendingRunModalJavaScriptDialogCallback[8].m_function.m_callableWrapper.__ptr_.__value_ = v12;
    if (v11) {
      CFRelease(v11);
    }
    std::__optional_storage_base<WebKit::DragSourceState,false>::__assign_from[abi:sn180100]<std::__optional_move_assign_base<WebKit::DragSourceState,false>>((uint64_t)&p_pendingRunModalJavaScriptDialogCallback[10], v25);
    unsigned int value_high = HIDWORD(p_pendingRunModalJavaScriptDialogCallback[51].m_function.m_callableWrapper.__ptr_.__value_);
    if (value_high) {
      WTF::VectorDestructor<true,WebKit::DragSourceState>::destruct((WTF::StringImpl *)p_pendingRunModalJavaScriptDialogCallback[50].m_function.m_callableWrapper.__ptr_.__value_, (WTF::StringImpl *)((char *)p_pendingRunModalJavaScriptDialogCallback[50].m_function.m_callableWrapper.__ptr_.__value_+ 312 * value_high));
    }
    uint64_t v15 = (WTF *)p_pendingRunModalJavaScriptDialogCallback[50].m_function.m_callableWrapper.__ptr_.__value_;
    if (v15)
    {
      p_pendingRunModalJavaScriptDialogCallback[50].m_function.m_callableWrapper.__ptr_.__value_ = 0;
      LODWORD(p_pendingRunModalJavaScriptDialogCallback[51].m_function.m_callableWrapper.__ptr_.__value_) = 0;
      WTF::fastFree(v15, v13);
    }
    p_pendingRunModalJavaScriptDialogCallback[50].m_function.m_callableWrapper.__ptr_.__value_ = (void *)v26;
    uint64_t v16 = (void *)*((void *)&v26 + 1);
    long long v26 = 0uLL;
    p_pendingRunModalJavaScriptDialogCallback[51].m_function.m_callableWrapper.__ptr_.__value_ = v16;
    float v17 = (void *)v27;
    *(void *)&long long v27 = 0;
    uint64_t v18 = (uint64_t)p_pendingRunModalJavaScriptDialogCallback[52].m_function.m_callableWrapper.__ptr_.__value_;
    p_pendingRunModalJavaScriptDialogCallback[52].m_function.m_callableWrapper.__ptr_.__value_ = v17;
    if (v18) {
      WTF::HashTable<WTF::RetainPtr<UIDragItem>,WTF::KeyValuePair<WTF::RetainPtr<UIDragItem>,WTF::RetainPtr<UITargetedDragPreview>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::RetainPtr<UIDragItem>,WTF::RetainPtr<UITargetedDragPreview>>>,WTF::DefaultHash<WTF::RetainPtr<UIDragItem>>,WTF::HashMap<WTF::RetainPtr<UIDragItem>,WTF::RetainPtr<UITargetedDragPreview>,WTF::DefaultHash<WTF::RetainPtr<UIDragItem>>,WTF::HashTraits<WTF::RetainPtr<UIDragItem>>,WTF::HashTraits<WTF::RetainPtr<UITargetedDragPreview>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::RetainPtr<UIDragItem>>>::deallocateTable(v18, v13);
    }
    unint64_t v19 = (void *)*((void *)&v27 + 1);
    *((void *)&v27 + 1) = 0;
    uint64_t v20 = (uint64_t)p_pendingRunModalJavaScriptDialogCallback[53].m_function.m_callableWrapper.__ptr_.__value_;
    p_pendingRunModalJavaScriptDialogCallback[53].m_function.m_callableWrapper.__ptr_.__value_ = v19;
    if (v20) {
      WTF::HashTable<WTF::RetainPtr<UIDragItem>,WTF::KeyValuePair<WTF::RetainPtr<UIDragItem>,WTF::RetainPtr<UITargetedDragPreview>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::RetainPtr<UIDragItem>,WTF::RetainPtr<UITargetedDragPreview>>>,WTF::DefaultHash<WTF::RetainPtr<UIDragItem>>,WTF::HashMap<WTF::RetainPtr<UIDragItem>,WTF::RetainPtr<UITargetedDragPreview>,WTF::DefaultHash<WTF::RetainPtr<UIDragItem>>,WTF::HashTraits<WTF::RetainPtr<UIDragItem>>,WTF::HashTraits<WTF::RetainPtr<UITargetedDragPreview>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::RetainPtr<UIDragItem>>>::deallocateTable(v20, v13);
    }
    WebKit::DragDropInteractionState::~DragDropInteractionState((WebKit::DragDropInteractionState *)v21, v13);
  }
}

- (void)_insertDropCaret:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(WKContentView *)self _shouldUseTextCursorDragAnimator])
  {
    float v8 = (void *)[objc_alloc(MEMORY[0x1E4F42F48]) initWithTextInput:self delegate:self];
    uint64_t v9 = (void *)[v8 cursorView];
    uint64_t v10 = v9;
    if (v9) {
      CFRetain(v9);
    }
    id m_ptr = self->_visibleContentViewSnapshot.m_ptr;
    self->_visibleContentViewSnapshot.id m_ptr = v10;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    if (v8) {
      CFRelease(v8);
    }
    [(WKContentView *)self addSubview:self->_visibleContentViewSnapshot.m_ptr];
    objc_msgSend(self->_visibleContentViewSnapshot.m_ptr, "setFrame:", x, y, width, height);
    long long v12 = (void *)[objc_alloc(MEMORY[0x1E4F42EF8]) initWithTextCursorView:self->_visibleContentViewSnapshot.m_ptr textInput:self];
    unint64_t v13 = self->_unselectedContentSnapshot.m_ptr;
    self->_unselectedContentSnapshot.id m_ptr = v12;
    if (v13)
    {
      CFRelease(v13);
      long long v12 = self->_unselectedContentSnapshot.m_ptr;
    }
    [v12 setCursorVisible:1 animated:1];
    float v14 = self->_unselectedContentSnapshot.m_ptr;
    uint64_t v15 = +[WKTextPosition textPositionWithRect:](WKTextPosition, "textPositionWithRect:", x, y, width, height);
    [v14 placeCursorAtPosition:v15 animated:0];
  }
  else
  {
    uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F43370]) initWithTextInputView:self];
    float v17 = self->_dropInteraction.m_ptr;
    self->_dropInteraction.id m_ptr = v16;
    if (v17)
    {
      CFRelease(v17);
      uint64_t v16 = self->_dropInteraction.m_ptr;
    }
    uint64_t v18 = +[WKTextPosition textPositionWithRect:](WKTextPosition, "textPositionWithRect:", x, y, width, height);
    [v16 insertAtPosition:v18];
  }
}

- (void)_removeDropCaret
{
  id m_ptr = self->_dropInteraction.m_ptr;
  self->_dropInteraction.id m_ptr = 0;
  [m_ptr remove];
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  uint64_t v4 = self->_unselectedContentSnapshot.m_ptr;
  self->_unselectedContentSnapshot.id m_ptr = 0;
  [v4 setCursorVisible:0 animated:0];
  if (v4) {
    CFRelease(v4);
  }
  BOOL v5 = self->_visibleContentViewSnapshot.m_ptr;
  self->_visibleContentViewSnapshot.id m_ptr = 0;
  [v5 removeFromSuperview];
  if (v5)
  {
    CFRelease(v5);
  }
}

- (void)_willReceiveEditDragSnapshot
{
  self->_treatAsContentEditableUntilNextEditorStateUpdate = 1;
}

- (void)_didReceiveEditDragSnapshot:(optional<WebCore::TextIndicatorData> *)a3
{
  self->_treatAsContentEditableUntilNextEditorStateUpdate = 0;
  std::__optional_copy_base<WebCore::TextIndicatorData,false>::__optional_copy_base[abi:sn180100]((WebCore::TextIndicatorData *)v11, (const WebCore::TextIndicatorData *)a3);
  [(WKContentView *)self _deliverDelayedDropPreviewIfPossible:v11];
  if (v18)
  {
    if ((v17 & 0x8000000000000) != 0)
    {
      uint64_t v10 = (unsigned int *)(v17 & 0xFFFFFFFFFFFFLL);
      if (atomic_fetch_add((atomic_uint *volatile)(v17 & 0xFFFFFFFFFFFFLL), 0xFFFFFFFF) == 1)
      {
        atomic_store(1u, v10);
        WTF::fastFree((WTF *)v10, v4);
      }
    }
    BOOL v5 = v16;
    uint64_t v16 = 0;
    if (v5)
    {
      if (v5[2] == 1) {
        (*(void (**)(_DWORD *))(*(void *)v5 + 8))(v5);
      }
      else {
        --v5[2];
      }
    }
    long long v6 = v15;
    uint64_t v15 = 0;
    if (v6)
    {
      if (v6[2] == 1) {
        (*(void (**)(_DWORD *))(*(void *)v6 + 8))(v6);
      }
      else {
        --v6[2];
      }
    }
    long long v7 = v14;
    float v14 = 0;
    if (v7)
    {
      if (v7[2] == 1) {
        (*(void (**)(_DWORD *))(*(void *)v7 + 8))(v7);
      }
      else {
        --v7[2];
      }
    }
    float v8 = v12;
    if (v12)
    {
      long long v12 = 0;
      int v13 = 0;
      WTF::fastFree(v8, v4);
    }
  }
  [(WKContentView *)self cleanUpDragSourceSessionState];
  uint64_t v9 = *(void (***)(void))&self->_isAnimatingDragCancel;
  *(void *)&self->_isAnimatingDragCancel = 0;
  if (v9) {
    v9[2](v9);
  }
  _Block_release(v9);
}

- (void)_deliverDelayedDropPreviewIfPossible:(optional<WebCore::TextIndicatorData> *)a3
{
  if (*(void *)self->_anon_dc8)
  {
    if (a3->__engaged_)
    {
      if (a3->var0.__val_.contentImage.m_ptr)
      {
        id m_ptr = a3->var0.__val_.contentImageWithoutSelection.m_ptr;
        if (m_ptr)
        {
          ++*((_DWORD *)m_ptr + 2);
          uint64_t v6 = WebCore::DestinationColorSpace::SRGB((WebCore::DestinationColorSpace *)self);
          (*(void (**)(WebCore::NativeImage **__return_ptr, Image *, uint64_t))(*(void *)m_ptr + 288))(&v25, m_ptr, v6);
          if (!v25) {
            goto LABEL_26;
          }
          if (*(void *)&self->_commitPotentialTapPointerId)
          {
            id v8 = objc_alloc(MEMORY[0x1E4F42A80]);
            uint64_t v9 = (void *)WebCore::NativeImage::platformImage(v25);
            uint64_t v10 = self->_page.m_ptr;
            uint64_t v11 = 764;
            if (!*((unsigned char *)v10 + 768)) {
              uint64_t v11 = 760;
            }
            long long v12 = (const void *)[v8 initWithCGImage:*v9 scale:0 orientation:*(float *)((char *)v10 + v11)];
            int v13 = (void *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v12];
            float v14 = self->_dragInteraction.m_ptr;
            self->_dragInteraction.id m_ptr = v13;
            if (v14)
            {
              CFRelease(v14);
              int v13 = self->_dragInteraction.m_ptr;
            }
            if (a3->__engaged_)
            {
              WebCore::FloatRect::operator CGRect();
              objc_msgSend(v13, "setFrame:");
              [(WKContentView *)self insertSubview:self->_dragInteraction.m_ptr belowSubview:*(void *)self->_anon_dc8];
              uint64_t v15 = [(WKContentView *)self containerForDropPreviews];
              if (a3->__engaged_)
              {
                WebKit::DragDropInteractionState::deliverDelayedDropPreview((WebKit::DragDropInteractionState *)&self->_pendingRunModalJavaScriptDialogCallback, &self->super.super, v15, (WebCore::Image **)a3);
                if (v12) {
                  CFRelease(v12);
                }
                goto LABEL_15;
              }
              std::__throw_bad_optional_access[abi:sn180100]();
            }
            __break(1u);
            return;
          }
LABEL_15:
          uint64_t v16 = v25;
          CGPoint v25 = 0;
          if (v16)
          {
            char v17 = 0;
            uint64_t v18 = *((void *)v16 + 1);
            atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)v18, (unsigned __int8 *)&v17, 1u, memory_order_acquire, memory_order_acquire);
            if (v17) {
              MEMORY[0x19972E8D0](v18);
            }
            uint64_t v19 = *(void *)(v18 + 8);
            int v20 = 1;
            uint64_t v21 = v19 - 1;
            *(void *)(v18 + 8) = v19 - 1;
            if (v19 == 1)
            {
              uint64_t v24 = *(void *)(v18 + 16);
              uint64_t v22 = *(void *)(v18 + 24);
              *(void *)(v18 + 24) = 0;
              BOOL v23 = v24 != 0;
            }
            else
            {
              uint64_t v22 = 0;
              BOOL v23 = 1;
            }
            atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)v18, (unsigned __int8 *)&v20, 0, memory_order_release, memory_order_relaxed);
            if (v20 == 1)
            {
              if (!v21)
              {
LABEL_22:
                if (v22) {
                  (*(void (**)(uint64_t))(*(void *)v22 + 8))(v22);
                }
                if (!v23) {
                  WTF::fastFree((WTF *)v18, v7);
                }
              }
            }
            else
            {
              WTF::Lock::unlockSlow((WTF::Lock *)v18);
              if (!v21) {
                goto LABEL_22;
              }
            }
          }
LABEL_26:
          if (*((_DWORD *)m_ptr + 2) == 1) {
            (*(void (**)(Image *))(*(void *)m_ptr + 8))(m_ptr);
          }
          else {
            --*((_DWORD *)m_ptr + 2);
          }
        }
      }
    }
  }
}

- (void)_didPerformDragOperation:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  BOOL v5 = qword_1EB357DA8;
  if (os_log_type_enabled((os_log_t)qword_1EB357DA8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v33 = v3;
    _os_log_impl(&dword_1985F2000, v5, OS_LOG_TYPE_DEFAULT, "Finished performing drag controller operation (handled: %d)", buf, 8u);
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4FB6DC0], "sharedInstance"), "decrementPendingOperationCount");
  CGFloat x = self->_dragDropInteractionState.m_adjustedPositionForDragEnd.x;
  [(WKContentView *)self webViewUIDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v7 = [(WKContentView *)self webViewUIDelegate];
    id v8 = [(WKContentView *)self webView];
    objc_msgSend(v7, "_webView:dataInteractionOperationWasHandled:forSession:itemProviders:", v8, v3, *(void *)&x, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4FB6DC0], "sharedInstance"), "itemProviders"));
  }
  [(WKContentView *)self computeClientAndGlobalPointsForDropSession:*(void *)&x outClientPoint:&v30 outGlobalPoint:&v31];
  [(WKContentView *)self cleanUpDragSourceSessionState];
  id m_ptr = self->_page.m_ptr;
  unsigned int v10 = *(unsigned __int16 *)((char *)m_ptr + 913);
  WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v28, &v30);
  float v11 = roundf(v28[0]);
  uint64_t v12 = 0x7FFFFFFFLL;
  uint64_t v13 = (int)v11;
  if (v11 <= -2147500000.0) {
    uint64_t v13 = 0x80000000;
  }
  if (v11 < 2147500000.0) {
    uint64_t v12 = v13;
  }
  float v14 = roundf(v28[1]);
  uint64_t v15 = 0x7FFFFFFF00000000;
  unint64_t v16 = 0x8000000000000000;
  if (v14 > -2147500000.0) {
    unint64_t v16 = (unint64_t)(int)v14 << 32;
  }
  if (v14 < 2147500000.0) {
    uint64_t v15 = v16;
  }
  uint64_t v29 = v15 | v12;
  WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v26, &v31);
  float v17 = roundf(v26[0]);
  uint64_t v18 = 0x7FFFFFFFLL;
  uint64_t v19 = (int)v17;
  if (v17 <= -2147500000.0) {
    uint64_t v19 = 0x80000000;
  }
  if (v17 < 2147500000.0) {
    uint64_t v18 = v19;
  }
  float v20 = roundf(v26[1]);
  uint64_t v21 = 0x7FFFFFFF00000000;
  unint64_t v22 = 0x8000000000000000;
  if (v20 > -2147500000.0) {
    unint64_t v22 = (unint64_t)(int)v20 << 32;
  }
  if (v20 < 2147500000.0) {
    uint64_t v21 = v22;
  }
  uint64_t v27 = v21 | v18;
  if (v10 <= 0x100) {
    char v23 = 0;
  }
  else {
    char v23 = v10;
  }
  buf[0] = 0;
  char v34 = 0;
  IntSize v24 = (IntSize)&v29;
  IntPoint v25 = (IntPoint)buf;
  WebKit::WebPageProxy::dragEnded((uint64_t)m_ptr, v24, &v27, v23, v25);
}

- (void)_didChangeDragCaretRect:(CGRect)a3 currentRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  IsEmptdouble y = CGRectIsEmpty(a3);
  v14.origin.double x = x;
  v14.origin.double y = y;
  v14.size.double width = width;
  v14.size.double height = height;
  BOOL v10 = CGRectIsEmpty(v14);
  if (!IsEmpty || !v10)
  {
    if (IsEmpty)
    {
      -[WKContentView _insertDropCaret:](self, "_insertDropCaret:", x, y, width, height);
    }
    else if (v10)
    {
      [(WKContentView *)self _removeDropCaret];
    }
    else
    {
      float v11 = +[WKTextPosition textPositionWithRect:](WKTextPosition, "textPositionWithRect:", x, y, width, height);
      uint64_t v12 = v11;
      if (v11) {
        CFRetain(v11);
      }
      [self->_unselectedContentSnapshot.m_ptr placeCursorAtPosition:v12 animated:1];
      [self->_dropInteraction.m_ptr updateToPosition:v12];
      if (v12)
      {
        CFRelease(v12);
      }
    }
  }
}

- (void)_prepareToDragPromisedAttachment:(const void *)a3
{
  v48[2] = *MEMORY[0x1E4F143B8];
  CGFloat y = self->_dragDropInteractionState.m_lastGlobalPosition.y;
  if (y != 0.0)
  {
    CFRetain(*(CFTypeRef *)&self->_dragDropInteractionState.m_lastGlobalPosition.y);
    uint64_t v6 = qword_1EB357DA8;
    if (os_log_type_enabled((os_log_t)qword_1EB357DA8, OS_LOG_TYPE_DEFAULT))
    {
      WTF::String::utf8();
      id v8 = v44 ? (char *)v44 + 16 : 0;
      *(_DWORD *)buf = 134218242;
      *(CGFloat *)&uint8_t buf[4] = y;
      *(_WORD *)&unsigned char buf[12] = 2080;
      *(void *)&buf[14] = v8;
      _os_log_impl(&dword_1985F2000, v6, OS_LOG_TYPE_DEFAULT, "Drag session: %p preparing to drag with attachment identifier: %s", buf, 0x16u);
      BOOL v10 = v44;
      long long v44 = 0;
      if (v10)
      {
        if (*(_DWORD *)v10 == 1) {
          WTF::fastFree(v10, v9);
        }
        else {
          --*(_DWORD *)v10;
        }
      }
    }
    WebKit::WebPageProxy::attachmentForIdentifier(self->_page.m_ptr, (WTF::StringImpl **)a3, v7, buf);
    float v11 = *(CFTypeRef **)buf;
    if (*(void *)buf)
    {
      API::Attachment::utiType(*(API::Attachment **)buf, &v44);
      if (v44)
      {
        uint64_t v13 = (__CFString *)WTF::StringImpl::operator NSString *();
        CGRect v14 = v44;
        long long v44 = 0;
        if (v14)
        {
          if (*(_DWORD *)v14 == 2) {
            WTF::StringImpl::destroy(v14, v12);
          }
          else {
            *(_DWORD *)v14 -= 2;
          }
        }
      }
      else
      {
        uint64_t v13 = &stru_1EEA10550;
      }
      API::Attachment::fileName((API::Attachment *)v11, (uint64_t)&v44);
      if (v44)
      {
        uint64_t v15 = (__CFString *)WTF::StringImpl::operator NSString *();
        float v17 = v44;
        long long v44 = 0;
        if (v17)
        {
          if (*(_DWORD *)v17 == 2) {
            WTF::StringImpl::destroy(v17, v16);
          }
          else {
            *(_DWORD *)v17 -= 2;
          }
        }
      }
      else
      {
        uint64_t v15 = &stru_1EEA10550;
      }
      CFRelease(v11[1]);
    }
    else
    {
      uint64_t v15 = 0;
      uint64_t v13 = 0;
    }
    id v18 = objc_alloc_init(MEMORY[0x1E4FB6DC8]);
    [v18 setPreferredPresentationStyle:2];
    if ([(__CFString *)v15 length]) {
      [v18 setSuggestedName:v15];
    }
    uint64_t v19 = (char *)a3 + 8;
    if (*((_DWORD *)a3 + 5))
    {
      uint64_t v20 = 0;
      unint64_t v21 = 0;
      while (1)
      {
        WebCore::SharedBuffer::createNSData((uint64_t *)buf, *(WebCore::SharedBuffer **)(*v19 + v20 + 8));
        if (v21 >= *((unsigned int *)a3 + 5)) {
          break;
        }
        uint64_t v22 = *(void *)buf;
        if (*(void *)(*v19 + v20)) {
          char v23 = (__CFString *)WTF::StringImpl::operator NSString *();
        }
        else {
          char v23 = &stru_1EEA10550;
        }
        [v18 addData:v22 forType:v23];
        IntSize v24 = *(const void **)buf;
        *(void *)buf = 0;
        if (v24) {
          CFRelease(v24);
        }
        ++v21;
        v20 += 16;
        if (v21 >= *((unsigned int *)a3 + 5)) {
          goto LABEL_35;
        }
      }
      __break(0xC471u);
    }
    else
    {
LABEL_35:
      uint64_t v36 = MEMORY[0x1E4F143A8];
      uint64_t v37 = 3321888768;
      uint64_t v38 = __65__WKContentView_WKInteraction___prepareToDragPromisedAttachment___block_invoke;
      char v39 = &__block_descriptor_72_e8_32c79_ZTSKZ65__WKContentView_WKInteraction___prepareToDragPromisedAttachment__E4__80_e32_v16__0___v____NSURL___NSError__8l;
      *(CGFloat *)buf = y;
      *(void *)&buf[8] = 0;
      objc_initWeak((id *)&buf[8], self);
      IntPoint v25 = *(_DWORD **)a3;
      if (*(void *)a3) {
        *v25 += 2;
      }
      *(void *)&buf[16] = v25;
      WTF::Vector<std::pair<WTF::String,WTF::RefPtr<WebCore::SharedBuffer,WTF::RawPtrTraits<WebCore::SharedBuffer>,WTF::DefaultRefDerefTraits<WebCore::SharedBuffer>>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t)v48, (uint64_t)a3 + 8);
      CFTypeRef cf = *(CFTypeRef *)buf;
      if (*(void *)buf) {
        CFRetain(*(CFTypeRef *)buf);
      }
      id v41 = 0;
      objc_copyWeak(&v41, (id *)&buf[8]);
      long long v26 = *(WTF::StringImpl **)&buf[16];
      if (*(void *)&buf[16]) {
        **(_DWORD **)&buf[16] += 2;
      }
      int v42 = v26;
      WTF::Vector<std::pair<WTF::String,WTF::RefPtr<WebCore::SharedBuffer,WTF::RawPtrTraits<WebCore::SharedBuffer>,WTF::DefaultRefDerefTraits<WebCore::SharedBuffer>>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t)v43, (uint64_t)v48);
      [v18 addPromisedType:v13 fileCallback:&v36];
      WTF::Vector<WebCore::RawFile,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v48, v27);
      uint64_t v29 = *(WTF::StringImpl **)&buf[16];
      *(void *)&buf[16] = 0;
      if (v29)
      {
        if (*(_DWORD *)v29 == 2) {
          WTF::StringImpl::destroy(v29, v28);
        }
        else {
          *(_DWORD *)v29 -= 2;
        }
      }
      objc_destroyWeak((id *)&buf[8]);
      CGPoint v30 = *(const void **)buf;
      *(void *)buf = 0;
      if (v30) {
        CFRelease(v30);
      }
      CGPoint v31 = objc_msgSend(MEMORY[0x1E4FB6DC0], "sharedInstance", v36, v37, v38, v39);
      uint64_t v46 = [v18 itemProvider];
      objc_msgSend(v31, "setItemProviders:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v46, 1));
      id v45 = v18;
      objc_msgSend(v31, "stageRegistrationLists:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v45, 1));
      WTF::Vector<WebCore::RawFile,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v43, v32);
      char v34 = v42;
      int v42 = 0;
      if (v34)
      {
        if (*(_DWORD *)v34 == 2) {
          WTF::StringImpl::destroy(v34, v33);
        }
        else {
          *(_DWORD *)v34 -= 2;
        }
      }
      objc_destroyWeak(&v41);
      CFTypeRef v35 = cf;
      CFTypeRef cf = 0;
      if (v35) {
        CFRelease(v35);
      }
      if (v18) {
        CFRelease(v18);
      }
    }
  }
}

void __65__WKContentView_WKInteraction___prepareToDragPromisedAttachment___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v22 = a2;
  id WeakRetained = (void **)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained;
    TemporaryDirectorCGFloat y = (void *)WTF::FileSystemImpl::createTemporaryDirectory((WTF::FileSystemImpl *)@"blobs", v5);
    id v8 = (void **)(a1 + 32);
    uint64_t v21 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:isDirectory:", objc_msgSend(TemporaryDirectory, "stringByAppendingPathComponent:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString")), 0);
    uint64_t v9 = a1 + 48;
    WebKit::WebPageProxy::attachmentForIdentifier(v6[53], (WTF::StringImpl **)(a1 + 48), v10, buf);
    uint64_t v11 = *(void *)buf;
    if (*(void *)buf && !API::Attachment::isEmpty(*(atomic_uchar **)buf))
    {
      CGRect v14 = (void *)WTF::fastMalloc((WTF *)0x28);
      *CGRect v14 = &unk_1EEA0E638;
      v14[1] = v8;
      float v14[2] = v9;
      v14[3] = &v21;
      v14[4] = &v22;
      uint64_t v20 = v14;
      API::Attachment::doWithFileWrapper(v11, &v20);
      (*(void (**)(void *))(*v14 + 8))(v14);
    }
    else
    {
      (*(void (**)(uint64_t, void, uint64_t))(a2 + 16))(a2, 0, [MEMORY[0x1E4F28C58] errorWithDomain:@"WKErrorDomain" code:3 userInfo:0]);
      if (!v11) {
        goto LABEL_11;
      }
    }
    CFRelease(*(CFTypeRef *)(v11 + 8));
LABEL_11:
    uint64_t v15 = *v8;
    unint64_t v16 = (void *)existingLocalDragSessionContext(*v8);
    if (!v16)
    {
      if ([v15 localContext])
      {
        float v17 = qword_1EB357DA8;
        if (os_log_type_enabled((os_log_t)qword_1EB357DA8, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v18 = [v15 localContext];
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v18;
          __int16 v24 = 2112;
          IntPoint v25 = v15;
          _os_log_impl(&dword_1985F2000, v17, OS_LOG_TYPE_DEFAULT, "Overriding existing local context: %@ on session: %@", buf, 0x16u);
        }
      }
      uint64_t v19 = objc_alloc_init(WKDragSessionContext);
      [v15 setLocalContext:v19];
      if (v19) {
        CFRelease(v19);
      }
      unint64_t v16 = (void *)[v15 localContext];
    }
    [v16 addTemporaryDirectory:TemporaryDirectory];
    CFRelease(v6);
    return;
  }
  uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WKErrorDomain" code:3 userInfo:0];
  uint64_t v13 = *(void (**)(uint64_t, void, uint64_t))(a2 + 16);

  v13(a2, 0, v12);
}

- (unint64_t)_dragDestinationActionForDropSession:(id)a3
{
  id v5 = [(WKContentView *)self webViewUIDelegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return -5;
  }
  id v6 = [(WKContentView *)self webView];

  return [v5 _webView:v6 dragDestinationActionMaskForDraggingInfo:a3];
}

- (OptionSet<WebCore::DragSourceAction>)_allowedDragSourceActions
{
  v3.int m_storage = 0;
  uint64_t v4 = 0;
  int v6 = 134480385;
  __int16 v7 = 8208;
  char v8 = 64;
  do
    v3.m_storage |= *((unsigned char *)&v6 + v4++);
  while (v4 != 7);
  if (![(WKContentView *)self isFirstResponder]
    || self->_suppressSelectionAssistantReasons.m_storage)
  {
    return (OptionSet<WebCore::DragSourceAction>)(v3.m_storage & 0xF7);
  }
  return v3;
}

- (id)currentDragOrDropSession
{
  p_pendingRunModalJavaScriptDialogCallback = &self->_pendingRunModalJavaScriptDialogCallback;
  id result = *(id *)&self->_dragDropInteractionState.m_adjustedPositionForDragEnd.x;
  if (!result) {
    return p_pendingRunModalJavaScriptDialogCallback[5].m_function.m_callableWrapper.__ptr_.__value_;
  }
  return result;
}

- (void)_restoreEditMenuIfNeeded
{
  if (BYTE1(self->_dragDropInteractionState.m_finalDropPreviews.m_impl.var0.m_table))
  {
    [self->_textInteractionWrapper.m_ptr didEndScrollingOverflow];
    BYTE1(self->_dragDropInteractionState.m_finalDropPreviews.m_impl.var0.m_table) = 0;
  }
}

- (id)_itemsForBeginningOrAddingToSessionWithRegistrationLists:(id)a3 stagedDragSource:(const void *)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (![a3 count]) {
    return (id)MEMORY[0x1E4F1CBF0];
  }
  __int16 v7 = (void *)[MEMORY[0x1E4F1CA48] array];
  id v29 = [(WKContentView *)self webViewUIDelegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v28 = self;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v8 = [a3 countByEnumeratingWithState:&v41 objects:v47 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v42 != v9) {
            objc_enumerationMutation(a3);
          }
          uint64_t v11 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          uint64_t v12 = [v11 itemProvider];
          if (v12)
          {
            id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            v38[0] = MEMORY[0x1E4F143A8];
            v38[1] = 3321888768;
            v38[2] = __106__WKContentView_WKInteraction___itemsForBeginningOrAddingToSessionWithRegistrationLists_stagedDragSource___block_invoke;
            v38[3] = &__block_descriptor_48_e8_32c121_ZTSKZ106__WKContentView_WKInteraction___itemsForBeginningOrAddingToSessionWithRegistrationLists_stagedDragSource__E4__81_e39_v24__0___WebItemProviderRegistrar__8Q16l;
            if (v13) {
              CFRetain(v13);
            }
            if (v14) {
              CFRetain(v14);
            }
            CFTypeRef v39 = v13;
            if (v13) {
              CFRetain(v13);
            }
            CFTypeRef cf = v14;
            if (v14) {
              CFRetain(v14);
            }
            [v11 enumerateItems:v38];
            if (v14) {
              CFRelease(v14);
            }
            if (v13) {
              CFRelease(v13);
            }
            uint64_t v15 = objc_msgSend(v29, "_webView:adjustedDataInteractionItemProvidersForItemProvider:representingObjects:additionalData:", -[WKContentView webView](v28, "webView"), v12, v13, v14);
            if ([v15 count]) {
              [v7 addObjectsFromArray:v15];
            }
            CFTypeRef v16 = cf;
            CFTypeRef cf = 0;
            if (v16) {
              CFRelease(v16);
            }
            CFTypeRef v17 = v39;
            CFTypeRef v39 = 0;
            if (v17) {
              CFRelease(v17);
            }
            if (v14) {
              CFRelease(v14);
            }
            if (v13) {
              CFRelease(v13);
            }
          }
        }
        uint64_t v8 = [a3 countByEnumeratingWithState:&v41 objects:v47 count:16];
      }
      while (v8);
    }
  }
  else
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v19 = [a3 countByEnumeratingWithState:&v34 objects:v46 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v35;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v35 != v20) {
            objc_enumerationMutation(a3);
          }
          uint64_t v22 = [*(id *)(*((void *)&v34 + 1) + 8 * j) itemProvider];
          if (v22) {
            [v7 addObject:v22];
          }
        }
        uint64_t v19 = [a3 countByEnumeratingWithState:&v34 objects:v46 count:16];
      }
      while (v19);
    }
  }
  uint64_t v18 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v23 = [v7 countByEnumeratingWithState:&v30 objects:v45 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v31;
    do
    {
      for (uint64_t k = 0; k != v23; ++k)
      {
        if (*(void *)v31 != v24) {
          objc_enumerationMutation(v7);
        }
        uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F429A0]) initWithItemProvider:*(void *)(*((void *)&v30 + 1) + 8 * k)];
        objc_msgSend(v26, "_setPrivateLocalContext:", objc_msgSend(NSNumber, "numberWithInteger:", *((void *)a4 + 38)));
        [v18 addObject:v26];
        if (v26) {
          CFRelease(v26);
        }
      }
      uint64_t v23 = [v7 countByEnumeratingWithState:&v30 objects:v45 count:16];
    }
    while (v23);
  }
  return v18;
}

uint64_t __106__WKContentView_WKInteraction___itemsForBeginningOrAddingToSessionWithRegistrationLists_stagedDragSource___block_invoke(uint64_t a1, void *a2)
{
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(a2, "representingObjectForClient"));
  }
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      id v5 = *(void **)(a1 + 40);
      uint64_t v6 = [a2 dataForClient];
      uint64_t v7 = [a2 typeIdentifierForClient];
      return [v5 setObject:v6 forKey:v7];
    }
  }
  return result;
}

- (void)insertTextPlaceholderWithSize:(CGSize)a3 completionHandler:(id)a4
{
  CGSize v14 = a3;
  id m_ptr = self->_page.m_ptr;
  WebCore::IntSize::IntSize((WebCore::IntSize *)&v13, &v14);
  id v10 = 0;
  objc_initWeak(&v10, self);
  aBlocuint64_t k = _Block_copy(a4);
  uint64_t v7 = WTF::fastMalloc((WTF *)0x18);
  *(void *)uint64_t v7 = &unk_1EEA0F170;
  *(void *)(v7 + 8) = 0;
  objc_moveWeak((id *)(v7 + 8), &v10);
  uint64_t v8 = aBlock;
  aBlocuint64_t k = 0;
  uint64_t v12 = v7;
  *(void *)(v7 + 16) = v8;
  WebKit::WebPageProxy::insertTextPlaceholder((uint64_t)m_ptr, &v13, &v12);
  uint64_t v9 = v12;
  uint64_t v12 = 0;
  if (v9) {
    (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
  }
  _Block_release(aBlock);
  objc_destroyWeak(&v10);
}

- (void)removeTextPlaceholder:(id)a3 willInsertText:(BOOL)a4 completionHandler:(id)a5
{
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (a3 && (isKindOfClass & 1) != 0)
  {
    CFRetain(a3);
    id m_ptr = self->_page.m_ptr;
    uint64_t v10 = [a3 elementContext];
    uint64_t v11 = _Block_copy(a5);
    uint64_t v12 = (void *)WTF::fastMalloc((WTF *)0x10);
    *uint64_t v12 = &unk_1EE9C5C00;
    v12[1] = v11;
    uint64_t v15 = v12;
    WebKit::WebPageProxy::removeTextPlaceholder((uint64_t)m_ptr, v10, (uint64_t *)&v15);
    uint64_t v13 = (uint64_t)v15;
    uint64_t v15 = 0;
    if (v13) {
      (*(void (**)(uint64_t))(*(void *)v13 + 8))(v13);
    }
    _Block_release(0);
    CFRelease(a3);
  }
  else
  {
    CGSize v14 = (void (*)(id))*((void *)a5 + 2);
    v14(a5);
  }
}

- (BOOL)_handleDropByInsertingImagePlaceholders:(id)a3 session:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (!objc_msgSend(-[WKContentView webView](self, "webView"), "_isEditable")) {
    return 0;
  }
  if (*(void *)&self->_dragDropInteractionState.m_lastGlobalPosition.y) {
    return 0;
  }
  uint64_t v7 = objc_msgSend((id)objc_msgSend(a4, "items"), "count");
  if (v7 != [a3 count]) {
    return 0;
  }
  long long v43 = 0;
  uint64_t v44 = 0;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v9 = (WTF *)[a3 countByEnumeratingWithState:&v39 objects:buf count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v40;
LABEL_6:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v40 != v10) {
        objc_enumerationMutation(a3);
      }
      uint64_t v12 = *(void **)(*((void *)&v39 + 1) + 8 * v11);
      MEMORY[0x19972EAD0](&v38, objc_msgSend((id)objc_msgSend(v12, "web_fileUploadContentTypes"), "firstObject"));
      WebCore::MIMETypeFromUTI((uint64_t *)&v37, (WebCore *)&v38, v13);
      char isSupportedImageMIMEType = WebCore::MIMETypeRegistry::isSupportedImageMIMEType((WebCore::MIMETypeRegistry *)&v37, v14);
      CGFloat width = v37.width;
      v37.CGFloat width = 0.0;
      if (width != 0.0)
      {
        if (**(_DWORD **)&width == 2) {
          WTF::StringImpl::destroy(*(WTF::StringImpl **)&width, v8);
        }
        else {
          **(_DWORD **)&width -= 2;
        }
      }
      CFTypeRef v17 = v38;
      uint64_t v38 = 0;
      if (v17)
      {
        if (*(_DWORD *)v17 == 2)
        {
          WTF::StringImpl::destroy(v17, v8);
          if ((isSupportedImageMIMEType & 1) == 0) {
            goto LABEL_29;
          }
          goto LABEL_19;
        }
        *(_DWORD *)v17 -= 2;
      }
      if ((isSupportedImageMIMEType & 1) == 0) {
        goto LABEL_29;
      }
LABEL_19:
      [v12 preferredPresentationSize];
      v37.CGFloat width = v18;
      v37.double height = v19;
      WebCore::IntSize::IntSize((WebCore::IntSize *)&v38, &v37);
      if ((int)v38 < 1 || SHIDWORD(v38) < 1)
      {
LABEL_29:
        uint64_t v9 = 0;
        unsigned int v25 = 0;
        long long v35 = 0;
        unint64_t v36 = 0;
        goto LABEL_32;
      }
      uint64_t v20 = HIDWORD(v44);
      if (HIDWORD(v44) == v44)
      {
        uint64_t v21 = (WTF::StringImpl **)WTF::Vector<WTF::ObjectIdentifierGeneric<WebCore::DictationContextType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)1>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)&v43, HIDWORD(v44) + 1, (unint64_t)&v38);
        uint64_t v20 = HIDWORD(v44);
        uint64_t v22 = v43;
        uint64_t v23 = *v21;
      }
      else
      {
        uint64_t v22 = v43;
        uint64_t v23 = v38;
      }
      *((void *)v22 + v20) = v23;
      ++HIDWORD(v44);
      if (v9 == (WTF *)++v11)
      {
        uint64_t v9 = (WTF *)[a3 countByEnumeratingWithState:&v39 objects:buf count:16];
        if (v9) {
          goto LABEL_6;
        }
        uint64_t v9 = v43;
        unsigned int v24 = v44;
        unsigned int v25 = HIDWORD(v44);
        goto LABEL_31;
      }
    }
  }
  unsigned int v25 = 0;
  unsigned int v24 = 0;
LABEL_31:
  long long v43 = 0;
  long long v35 = v9;
  HIDWORD(v44) = 0;
  unint64_t v36 = __PAIR64__(v25, v24);
LABEL_32:
  uint64_t v28 = v43;
  if (v43)
  {
    long long v43 = 0;
    LODWORD(v44) = 0;
    WTF::fastFree(v28, v8);
  }
  BOOL v26 = v25 != 0;
  if (v25)
  {
    id v29 = qword_1EB357DA8;
    if (os_log_type_enabled((os_log_t)qword_1EB357DA8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = a4;
      _os_log_impl(&dword_1985F2000, v29, OS_LOG_TYPE_DEFAULT, "Inserting dropped image placeholders for session: %p", buf, 0xCu);
    }
    id m_ptr = self->_page.m_ptr;
    CFRetain(self);
    long long v31 = (const void *)[a4 items];
    long long v32 = v31;
    if (v31) {
      CFRetain(v31);
    }
    long long v33 = (void *)WTF::fastMalloc((WTF *)0x18);
    void *v33 = &unk_1EEA0F198;
    v33[1] = self;
    v33[2] = v32;
    *(void *)buf = v33;
    WebKit::WebPageProxy::insertDroppedImagePlaceholders((uint64_t)m_ptr, (uint64_t)&v35, (uint64_t *)buf);
    uint64_t v34 = *(void *)buf;
    *(void *)buf = 0;
    if (v34) {
      (*(void (**)(uint64_t))(*(void *)v34 + 8))(v34);
    }
    uint64_t v9 = v35;
  }
  if (v9)
  {
    long long v35 = 0;
    LODWORD(v36) = 0;
    WTF::fastFree(v9, v8);
  }
  return v26;
}

- (BOOL)_dragInteraction:(id)a3 shouldDelayCompetingGestureRecognizer:(id)a4
{
  if (self->_highlightLongPressGestureRecognizer.m_ptr == a4)
  {
    char isKindOfClass = 0;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (int64_t)_dragInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  id v6 = [(WKContentView *)self webViewUIDelegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  id v7 = [(WKContentView *)self webView];

  return [v6 _webView:v7 dataOwnerForDragSession:a4];
}

- (void)_dragInteraction:(id)a3 itemsForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5 completion:(id)a6
{
  CGPoint v27 = a5;
  p_pendingRunModalJavaScriptDialogCallbacuint64_t k = &self->_pendingRunModalJavaScriptDialogCallback;
  if (p_pendingRunModalJavaScriptDialogCallback[5].m_function.m_callableWrapper.__ptr_.__value_ != a4
    || p_pendingRunModalJavaScriptDialogCallback[8].m_function.m_callableWrapper.__ptr_.__value_
    || p_pendingRunModalJavaScriptDialogCallback[7].m_function.m_callableWrapper.__ptr_.__value_)
  {
    uint64_t v8 = (void (*)(id, uint64_t))*((void *)a6 + 2);
    uint64_t v9 = MEMORY[0x1E4F1CBF0];
    v8(a6, v9);
  }
  else
  {
    WebKit::DragDropInteractionState::dragSessionWillRequestAdditionalItem((uint64_t)p_pendingRunModalJavaScriptDialogCallback, (WTF::StringImpl *)a6);
    id m_ptr = self->_page.m_ptr;
    WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v25, &v27);
    float v11 = roundf(v25[0]);
    uint64_t v12 = 0x7FFFFFFFLL;
    uint64_t v13 = (int)v11;
    if (v11 <= -2147500000.0) {
      uint64_t v13 = 0x80000000;
    }
    if (v11 < 2147500000.0) {
      uint64_t v12 = v13;
    }
    float v14 = roundf(v25[1]);
    uint64_t v15 = 0x7FFFFFFF00000000;
    unint64_t v16 = 0x8000000000000000;
    if (v14 > -2147500000.0) {
      unint64_t v16 = (unint64_t)(int)v14 << 32;
    }
    if (v14 < 2147500000.0) {
      uint64_t v15 = v16;
    }
    uint64_t v26 = v15 | v12;
    WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v23, &v27);
    float v17 = roundf(v23[0]);
    uint64_t v18 = 0x7FFFFFFFLL;
    uint64_t v19 = (int)v17;
    if (v17 <= -2147500000.0) {
      uint64_t v19 = 0x80000000;
    }
    if (v17 < 2147500000.0) {
      uint64_t v18 = v19;
    }
    float v20 = roundf(v23[1]);
    uint64_t v21 = 0x7FFFFFFF00000000;
    unint64_t v22 = 0x8000000000000000;
    if (v20 > -2147500000.0) {
      unint64_t v22 = (unint64_t)(int)v20 << 32;
    }
    if (v20 < 2147500000.0) {
      uint64_t v21 = v22;
    }
    uint64_t v24 = v21 | v18;
    WebKit::WebPageProxy::requestAdditionalItemsForDragSession((uint64_t)m_ptr, (uint64_t)&v26, (uint64_t)&v24, [(WKContentView *)self _allowedDragSourceActions]);
  }
}

- (void)_dragInteraction:(id)a3 prepareForSession:(id)a4 completion:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = qword_1EB357DA8;
  if (os_log_type_enabled((os_log_t)qword_1EB357DA8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = a4;
    _os_log_impl(&dword_1985F2000, v8, OS_LOG_TYPE_DEFAULT, "Preparing for drag session: %p", (uint8_t *)&buf, 0xCu);
  }
  if ([(WKContentView *)self currentDragOrDropSession])
  {
    uint64_t v9 = qword_1EB357DA8;
    if (os_log_type_enabled((os_log_t)qword_1EB357DA8, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = a4;
      _os_log_impl(&dword_1985F2000, v9, OS_LOG_TYPE_DEFAULT, "Drag session failed: %p (a current drag session already exists)", (uint8_t *)&buf, 0xCu);
    }
    (*((void (**)(id))a5 + 2))(a5);
  }
  else
  {
    [(WKContentView *)self cleanUpDragSourceSessionState];
    id location = 0;
    objc_initWeak(&location, self);
    CFTypeRef cf = a4;
    if (a4) {
      CFRetain(a4);
    }
    aBlocuint64_t k = _Block_copy(a5);
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3321888768;
    float v17 = ___ZZ78__WKContentView_WKInteraction___dragInteraction_prepareForSession_completion__ENK4__84cvU13block_pointerFvN6WebKit31ProceedWithTextSelectionInImageEEEv_block_invoke;
    uint64_t v18 = &__block_descriptor_56_e8_32c92_ZTSKZ78__WKContentView_WKInteraction___dragInteraction_prepareForSession_completion__E4__84_e8_v12__0B8l;
    id v19 = 0;
    objc_copyWeak(&v19, &location);
    CFTypeRef v20 = cf;
    if (cf) {
      CFRetain(cf);
    }
    uint64_t v21 = _Block_copy(aBlock);
    uint64_t v10 = objc_msgSend((id)objc_msgSend(&buf, "copy"), "autorelease");
    _Block_release(v21);
    CFTypeRef v11 = v20;
    CFTypeRef v20 = 0;
    if (v11) {
      CFRelease(v11);
    }
    objc_destroyWeak(&v19);
    [(WKContentView *)self _doAfterPendingImageAnalysis:v10];
    _Block_release(aBlock);
    CFTypeRef v12 = cf;
    CFTypeRef cf = 0;
    if (v12) {
      CFRelease(v12);
    }
    objc_destroyWeak(&location);
  }
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = qword_1EB357DA8;
  if (os_log_type_enabled((os_log_t)qword_1EB357DA8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    *(void *)&uint8_t buf[4] = a4;
    _os_log_impl(&dword_1985F2000, v6, OS_LOG_TYPE_DEFAULT, "Drag items requested for session: %p", buf, 0xCu);
  }
  p_pendingRunModalJavaScriptDialogCallbacuint64_t k = &self->_pendingRunModalJavaScriptDialogCallback;
  CGFloat y = self->_dragDropInteractionState.m_lastGlobalPosition.y;
  if (*(id *)&y != a4)
  {
    uint64_t v9 = qword_1EB357DA8;
    if (os_log_type_enabled((os_log_t)qword_1EB357DA8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218240;
      *(void *)&uint8_t buf[4] = a4;
      *(_WORD *)&unsigned char buf[12] = 2048;
      *(CGFloat *)&buf[14] = y;
      uint64_t v10 = "Drag session failed: %p (delegate session does not match %p)";
      CFTypeRef v11 = v9;
      uint32_t v12 = 22;
LABEL_18:
      _os_log_impl(&dword_1985F2000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
      return (id)MEMORY[0x1E4F1CBF0];
    }
    return (id)MEMORY[0x1E4F1CBF0];
  }
  if (!LOBYTE(self->_dragDropInteractionState.m_stagedDragSource.var0.__val_.linkURL.m_pathEnd)
    || !LOBYTE(self->_dragDropInteractionState.m_dropSession.m_ptr))
  {
    uint64_t v18 = qword_1EB357DA8;
    if (os_log_type_enabled((os_log_t)qword_1EB357DA8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134217984;
      *(void *)&uint8_t buf[4] = a4;
      uint64_t v10 = "Drag session failed: %p (missing staged drag source)";
      CFTypeRef v11 = v18;
      uint32_t v12 = 12;
      goto LABEL_18;
    }
    return (id)MEMORY[0x1E4F1CBF0];
  }
  long long v13 = *(_OWORD *)&self->_dragDropInteractionState.m_addDragItemCompletionBlock.m_block;
  *(_OWORD *)long long buf = *(_OWORD *)&self->_dragDropInteractionState.m_dropSession.m_ptr;
  *(_OWORD *)&buf[16] = v13;
  CGFloat x = self->_dragDropInteractionState.m_stagedDragSource.var0.__val_.dragPreviewFrameInRootViewCoordinates.origin.x;
  uint64_t v35 = *(void *)&self->_dragDropInteractionState.m_stagedDragSource.var0.__null_state_;
  CFTypeRef cf = *(CFTypeRef *)&x;
  if (x != 0.0) {
    CFRetain(*(CFTypeRef *)&x);
  }
  std::__optional_copy_base<WebCore::TextIndicatorData,false>::__optional_copy_base[abi:sn180100]((WebCore::TextIndicatorData *)&v37, (const WebCore::TextIndicatorData *)&self->_dragDropInteractionState.m_stagedDragSource.var0.__val_.dragPreviewFrameInRootViewCoordinates.origin.y);
  std::__optional_copy_base<WebCore::Path,false>::__optional_copy_base[abi:sn180100]((WebCore::Path *)&v45, (const WebCore::Path *)&self->_dragDropInteractionState.m_stagedDragSource.var0.__val_.indicatorData.var0.__val_.contentImage);
  uint64_t v15 = (WTF::StringImpl *)*((void *)&self->_dragDropInteractionState.m_stagedDragSource.var0.__val_.visiblePath.var0.__val_.m_data.__impl_.__data.__tail.__tail
                           + 6);
  if (v15) {
    *(_DWORD *)v15 += 2;
  }
  uint64_t v49 = v15;
  unint64_t v16 = *(WTF::StringImpl **)&self->_dragDropInteractionState.m_stagedDragSource.var0.__val_.visiblePath.var0.__val_.m_data.__impl_.__index;
  if (v16) {
    *(_DWORD *)v16 += 2;
  }
  FloatRect v50 = v16;
  long long v51 = *(_OWORD *)&self->_dragDropInteractionState.m_stagedDragSource.var0.__val_.visiblePath.__engaged_;
  long long v52 = *(_OWORD *)&self->_dragDropInteractionState.m_stagedDragSource.var0.__val_.linkURL.m_string.m_impl.m_ptr;
  long long v53 = *(_OWORD *)&self->_dragDropInteractionState.m_stagedDragSource.var0.__val_.linkURL.m_userEnd;
  id v17 = -[WKContentView _itemsForBeginningOrAddingToSessionWithRegistrationLists:stagedDragSource:](self, "_itemsForBeginningOrAddingToSessionWithRegistrationLists:stagedDragSource:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4FB6DC0], "sharedInstance"), "takeRegistrationLists"), buf);
  if ([v17 count]) {
    [(WKContentView *)self _cancelLongPressGestureRecognizer];
  }
  else {
    WebKit::WebPageProxy::dragCancelled((uint64_t)self->_page.m_ptr);
  }
  CFTypeRef v20 = qword_1EB357DA8;
  if (os_log_type_enabled((os_log_t)qword_1EB357DA8, OS_LOG_TYPE_DEFAULT))
  {
    int v30 = 134218240;
    id v31 = a4;
    __int16 v32 = 2048;
    uint64_t v33 = [v17 count];
    _os_log_impl(&dword_1985F2000, v20, OS_LOG_TYPE_DEFAULT, "Drag session: %p starting with %tu items", (uint8_t *)&v30, 0x16u);
  }
  WebKit::DragDropInteractionState::clearStagedDragSource((uint64_t)p_pendingRunModalJavaScriptDialogCallback, (WTF::StringImpl *)([v17 count] != 0));
  uint64_t v22 = v50;
  FloatRect v50 = 0;
  if (v22)
  {
    if (*(_DWORD *)v22 == 2) {
      WTF::StringImpl::destroy(v22, v21);
    }
    else {
      *(_DWORD *)v22 -= 2;
    }
  }
  uint64_t v23 = v49;
  uint64_t v49 = 0;
  if (v23)
  {
    if (*(_DWORD *)v23 == 2) {
      WTF::StringImpl::destroy(v23, v21);
    }
    else {
      *(_DWORD *)v23 -= 2;
    }
  }
  if (v48)
  {
    if (v47 != -1) {
      ((void (*)(int *, uint64_t *))off_1EEA0E610[v47])(&v30, &v46);
    }
    int v47 = -1;
  }
  if (v44)
  {
    if ((v43 & 0x8000000000000) != 0)
    {
      id v29 = (unsigned int *)(v43 & 0xFFFFFFFFFFFFLL);
      if (atomic_fetch_add((atomic_uint *volatile)(v43 & 0xFFFFFFFFFFFFLL), 0xFFFFFFFF) == 1)
      {
        atomic_store(1u, v29);
        WTF::fastFree((WTF *)v29, v21);
      }
    }
    uint64_t v24 = v42;
    long long v42 = 0;
    if (v24)
    {
      if (v24[2] == 1) {
        (*(void (**)(_DWORD *))(*(void *)v24 + 8))(v24);
      }
      else {
        --v24[2];
      }
    }
    unsigned int v25 = v41;
    long long v41 = 0;
    if (v25)
    {
      if (v25[2] == 1) {
        (*(void (**)(_DWORD *))(*(void *)v25 + 8))(v25);
      }
      else {
        --v25[2];
      }
    }
    uint64_t v26 = v40;
    long long v40 = 0;
    if (v26)
    {
      if (v26[2] == 1) {
        (*(void (**)(_DWORD *))(*(void *)v26 + 8))(v26);
      }
      else {
        --v26[2];
      }
    }
    CGPoint v27 = v38;
    if (v38)
    {
      uint64_t v38 = 0;
      int v39 = 0;
      WTF::fastFree(v27, v21);
    }
  }
  CFTypeRef v28 = cf;
  CFTypeRef cf = 0;
  if (v28) {
    CFRelease(v28);
  }
  return v17;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  id v8 = [(WKContentView *)self webViewUIDelegate];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (id v9 = (id)objc_msgSend(v8, "_webView:previewForLiftingItem:session:", -[WKContentView webView](self, "webView"), a4, a5)) == 0)
  {
    id v10 = [(WKContentView *)self containerForDragPreviews];
    v23[0] = 0;
    char v30 = 0;
    std::__optional_move_base<WebCore::TextIndicatorData,false>::__optional_move_base[abi:sn180100](v31, (uint64_t)&self->_positionInformationLinkIndicator);
    std::__optional_storage_base<WebCore::TextIndicatorData,false>::__assign_from[abi:sn180100]<std::__optional_move_assign_base<WebCore::TextIndicatorData,false>>((WebCore::TextIndicatorData *)&self->_positionInformationLinkIndicator, (uint64_t)v23);
    id v9 = WebKit::DragDropInteractionState::previewForLifting((uint64_t)&self->_pendingRunModalJavaScriptDialogCallback, a4, self, v10, (uint64_t)v31);
    if (v38)
    {
      if ((v37 & 0x8000000000000) != 0)
      {
        uint64_t v21 = (unsigned int *)(v37 & 0xFFFFFFFFFFFFLL);
        if (atomic_fetch_add((atomic_uint *volatile)(v37 & 0xFFFFFFFFFFFFLL), 0xFFFFFFFF) == 1)
        {
          atomic_store(1u, v21);
          WTF::fastFree((WTF *)v21, v11);
        }
      }
      uint32_t v12 = v36;
      unint64_t v36 = 0;
      if (v12)
      {
        if (v12[2] == 1) {
          (*(void (**)(_DWORD *))(*(void *)v12 + 8))(v12);
        }
        else {
          --v12[2];
        }
      }
      long long v13 = v35;
      uint64_t v35 = 0;
      if (v13)
      {
        if (v13[2] == 1) {
          (*(void (**)(_DWORD *))(*(void *)v13 + 8))(v13);
        }
        else {
          --v13[2];
        }
      }
      float v14 = v34;
      uint64_t v34 = 0;
      if (v14)
      {
        if (v14[2] == 1) {
          (*(void (**)(_DWORD *))(*(void *)v14 + 8))(v14);
        }
        else {
          --v14[2];
        }
      }
      uint64_t v15 = v32;
      if (v32)
      {
        __int16 v32 = 0;
        int v33 = 0;
        WTF::fastFree(v15, v11);
      }
    }
    if (v30)
    {
      if ((v29 & 0x8000000000000) != 0)
      {
        uint64_t v22 = (unsigned int *)(v29 & 0xFFFFFFFFFFFFLL);
        if (atomic_fetch_add((atomic_uint *volatile)(v29 & 0xFFFFFFFFFFFFLL), 0xFFFFFFFF) == 1)
        {
          atomic_store(1u, v22);
          WTF::fastFree((WTF *)v22, v11);
        }
      }
      unint64_t v16 = v28;
      CFTypeRef v28 = 0;
      if (v16)
      {
        if (v16[2] == 1) {
          (*(void (**)(_DWORD *))(*(void *)v16 + 8))(v16);
        }
        else {
          --v16[2];
        }
      }
      id v17 = v27;
      CGPoint v27 = 0;
      if (v17)
      {
        if (v17[2] == 1) {
          (*(void (**)(_DWORD *))(*(void *)v17 + 8))(v17);
        }
        else {
          --v17[2];
        }
      }
      uint64_t v18 = v26;
      uint64_t v26 = 0;
      if (v18)
      {
        if (v18[2] == 1) {
          (*(void (**)(_DWORD *))(*(void *)v18 + 8))(v18);
        }
        else {
          --v18[2];
        }
      }
      id v19 = v24;
      if (v24)
      {
        uint64_t v24 = 0;
        int v25 = 0;
        WTF::fastFree(v19, v11);
      }
    }
  }
  return v9;
}

- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = qword_1EB357DA8;
  if (os_log_type_enabled((os_log_t)qword_1EB357DA8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    *(void *)&uint8_t buf[4] = a5;
    _os_log_impl(&dword_1985F2000, v8, OS_LOG_TYPE_DEFAULT, "Drag session willAnimateLiftWithAnimator: %p", buf, 0xCu);
  }
  unsigned int itemIdentifier_high = HIDWORD(self->_dragDropInteractionState.m_stagedDragSource.var0.__val_.itemIdentifier);
  if (itemIdentifier_high)
  {
    uint64_t v10 = 312 * itemIdentifier_high;
    CFTypeRef v11 = (unsigned char *)(*(void *)&self->_dragDropInteractionState.m_stagedDragSource.var0.__val_.possiblyNeedsDragPreviewUpdate
                  + 297);
    while (!*v11)
    {
      v11 += 312;
      v10 -= 312;
      if (!v10) {
        goto LABEL_10;
      }
    }
    [(WKContentView *)self cancelActiveTextInteractionGestures];
    if (!BYTE1(self->_dragDropInteractionState.m_finalDropPreviews.m_impl.var0.m_table))
    {
      [self->_textInteractionWrapper.m_ptr willStartScrollingOverflow];
      BYTE1(self->_dragDropInteractionState.m_finalDropPreviews.m_impl.var0.m_table) = 1;
    }
  }
LABEL_10:
  *(_OWORD *)long long buf = *(_OWORD *)&self->_lastInsertedCharacterToOverrideCharacterBeforeSelection.var0.__null_state_;
  WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v23, (const CGPoint *)buf);
  float v12 = roundf(v23[0]);
  uint64_t v13 = 0x80000000;
  if (v12 > -2147500000.0) {
    uint64_t v13 = (int)v12;
  }
  if (v12 < 2147500000.0) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0x7FFFFFFFLL;
  }
  float v15 = roundf(v23[1]);
  if (v15 >= 2147500000.0)
  {
    unint64_t v16 = 0x7FFFFFFF00000000;
  }
  else if (v15 <= -2147500000.0)
  {
    unint64_t v16 = 0x8000000000000000;
  }
  else
  {
    unint64_t v16 = (unint64_t)(int)v15 << 32;
  }
  CFRetain(self);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3321888768;
  void v20[2] = __84__WKContentView_WKInteraction__dragInteraction_willAnimateLiftWithAnimator_session___block_invoke;
  v20[3] = &__block_descriptor_64_e8_32c98_ZTSKZ84__WKContentView_WKInteraction__dragInteraction_willAnimateLiftWithAnimator_session__E4__85_e8_v16__0q8l;
  CFRetain(self);
  id m_ptr = self->_page.m_ptr;
  if (m_ptr) {
    CFRetain(*((CFTypeRef *)m_ptr + 1));
  }
  v20[4] = a5;
  v20[5] = v16 | v14;
  CFTypeRef cf = self;
  CFRetain(self);
  if (m_ptr) {
    CFRetain(*((CFTypeRef *)m_ptr + 1));
  }
  uint64_t v22 = m_ptr;
  [a4 addCompletion:v20];
  if (m_ptr) {
    CFRelease(*((CFTypeRef *)m_ptr + 1));
  }
  CFRelease(self);
  uint64_t v18 = v22;
  uint64_t v22 = 0;
  if (v18) {
    CFRelease(*((CFTypeRef *)v18 + 1));
  }
  CFTypeRef v19 = cf;
  CFTypeRef cf = 0;
  if (v19) {
    CFRelease(v19);
  }
  CFRelease(self);
}

void __84__WKContentView_WKInteraction__dragInteraction_willAnimateLiftWithAnimator_session___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = qword_1EB357DA8;
  BOOL v5 = os_log_type_enabled((os_log_t)qword_1EB357DA8, OS_LOG_TYPE_DEFAULT);
  if (a2 == 1)
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v11 = 134217984;
      uint64_t v12 = v6;
      _os_log_impl(&dword_1985F2000, v4, OS_LOG_TYPE_DEFAULT, "Drag session ended at start: %p", (uint8_t *)&v11, 0xCu);
    }
    [*(id *)(a1 + 48) cleanUpDragSourceSessionState];
    uint64_t v7 = *(void *)(a1 + 56);
    IntSize v8 = (IntSize)(a1 + 40);
    LOBYTE(v11) = 0;
    char v13 = 0;
    IntPoint v9 = (IntPoint)&v11;
    WebKit::WebPageProxy::dragEnded(v7, v8, (void *)(a1 + 40), 0, v9);
  }
  else if (v5)
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = 134217984;
    uint64_t v12 = v10;
    _os_log_impl(&dword_1985F2000, v4, OS_LOG_TYPE_DEFAULT, "Drag session did not end at start: %p", (uint8_t *)&v11, 0xCu);
  }
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = qword_1EB357DA8;
  if (os_log_type_enabled((os_log_t)qword_1EB357DA8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    id v10 = a4;
    _os_log_impl(&dword_1985F2000, v7, OS_LOG_TYPE_DEFAULT, "Drag session beginning: %p", (uint8_t *)&v9, 0xCu);
  }
  id v8 = [(WKContentView *)self webViewUIDelegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v8, "_webView:dataInteraction:sessionWillBegin:", -[WKContentView webView](self, "webView"), a3, a4);
  }
  [self->_actionSheetAssistant.m_ptr cleanupSheet];
  LOBYTE(self->_dragDropInteractionState.m_lastGlobalPosition.x) = 1;
  WebKit::DragDropInteractionState::updatePreviewsForActiveDragSources((WebKit::DragDropInteractionState *)&self->_pendingRunModalJavaScriptDialogCallback);
  WebKit::WebPageProxy::didStartDrag((uint64_t)self->_page.m_ptr);
}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  int v9 = qword_1EB357DA8;
  if (os_log_type_enabled((os_log_t)qword_1EB357DA8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = BYTE1(self->_dragDropInteractionState.m_lastGlobalPosition.x);
    int x_low = LOBYTE(self->_dragDropInteractionState.m_lastGlobalPosition.x);
    *(_DWORD *)long long buf = 134218752;
    id v37 = a4;
    __int16 v38 = 2048;
    unint64_t v39 = a5;
    __int16 v40 = 1024;
    int v41 = v10;
    __int16 v42 = 1024;
    int v43 = x_low;
    _os_log_impl(&dword_1985F2000, v9, OS_LOG_TYPE_DEFAULT, "Drag session ended: %p (with operation: %tu, performing operation: %d, began dragging: %d)", buf, 0x22u);
  }
  [(WKContentView *)self _restoreEditMenuIfNeeded];
  id v12 = [(WKContentView *)self webViewUIDelegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v12, "_webView:dataInteraction:session:didEndWithOperation:", -[WKContentView webView](self, "webView"), a3, a4, a5);
  }
  p_pendingRunModalJavaScriptDialogCallbacuint64_t k = &self->_pendingRunModalJavaScriptDialogCallback;
  if (!BYTE1(self->_dragDropInteractionState.m_lastGlobalPosition.x))
  {
    [(WKContentView *)self cleanUpDragSourceSessionState];
    id m_ptr = self->_page.m_ptr;
    CGPoint v33 = *(CGPoint *)&p_pendingRunModalJavaScriptDialogCallback[2].m_function.m_callableWrapper.__ptr_.__value_;
    WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v34, &v33);
    float v15 = roundf(v34[0]);
    uint64_t v16 = 0x7FFFFFFFLL;
    uint64_t v17 = 0x80000000;
    if (v15 > -2147500000.0) {
      uint64_t v17 = (int)v15;
    }
    if (v15 < 2147500000.0) {
      uint64_t v16 = v17;
    }
    float v18 = roundf(v34[1]);
    uint64_t v19 = 0x7FFFFFFF00000000;
    unint64_t v20 = 0x8000000000000000;
    if (v18 > -2147500000.0) {
      unint64_t v20 = (unint64_t)(int)v18 << 32;
    }
    if (v18 < 2147500000.0) {
      uint64_t v19 = v20;
    }
    uint64_t v35 = v19 | v16;
    CGPoint v30 = *(CGPoint *)&p_pendingRunModalJavaScriptDialogCallback[2].m_function.m_callableWrapper.__ptr_.__value_;
    WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v31, &v30);
    float v21 = roundf(v31[0]);
    uint64_t v22 = 0x7FFFFFFFLL;
    uint64_t v23 = 0x80000000;
    if (v21 > -2147500000.0) {
      uint64_t v23 = (int)v21;
    }
    if (v21 < 2147500000.0) {
      uint64_t v22 = v23;
    }
    float v24 = roundf(v31[1]);
    uint64_t v25 = 0x7FFFFFFF00000000;
    unint64_t v26 = 0x8000000000000000;
    if (v24 > -2147500000.0) {
      unint64_t v26 = (unint64_t)(int)v24 << 32;
    }
    if (v24 < 2147500000.0) {
      uint64_t v25 = v26;
    }
    uint64_t v32 = v25 | v22;
    if (a5 - 1 > 2) {
      LOBYTE(v27) = 0;
    }
    else {
      uint64_t v27 = qword_1994F90B0[a5 - 1];
    }
    buf[0] = 0;
    BYTE2(v39) = 0;
    IntSize v28 = (IntSize)&v35;
    IntPoint v29 = (IntPoint)buf;
    WebKit::WebPageProxy::dragEnded((uint64_t)m_ptr, v28, &v32, v27, v29);
  }
}

- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5
{
  id v8 = [(WKContentView *)self webViewUIDelegate];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (id result = (id)objc_msgSend(v8, "_webView:previewForCancellingItem:withDefault:", -[WKContentView webView](self, "webView"), a4, a5)) == 0)
  {
    int v10 = [(WKContentView *)self unscaledView];
    return (id)WebKit::DragDropInteractionState::previewForCancelling((WebKit::DragDropInteractionState *)&self->_pendingRunModalJavaScriptDialogCallback, (UIDragItem *)a4, &self->super.super, v10);
  }
  return result;
}

- (void)dragInteraction:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5
{
  LOBYTE(self->_dragDropInteractionState.m_finalDropPreviews.m_impl.var0.m_table) = 1;
  uint64_t v7 = qword_1EB357DA8;
  if (os_log_type_enabled((os_log_t)qword_1EB357DA8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1985F2000, v7, OS_LOG_TYPE_DEFAULT, "Drag interaction willAnimateCancelWithAnimator", buf, 2u);
  }
  id m_ptr = self->_dragDropInteractionState.m_dragSession.m_ptr;
  self->_dragDropInteractionState.m_dragSession.id m_ptr = 0;
  [m_ptr setAlpha:0.0];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3321888768;
  v13[2] = __83__WKContentView_WKInteraction__dragInteraction_item_willAnimateCancelWithAnimator___block_invoke;
  void v13[3] = &__block_descriptor_56_e8_32c97_ZTSKZ83__WKContentView_WKInteraction__dragInteraction_item_willAnimateCancelWithAnimator__E4__86_e8_v16__0q8l;
  CFRetain(self);
  int v9 = self->_page.m_ptr;
  if (v9) {
    CFRetain(*((CFTypeRef *)v9 + 1));
  }
  CFTypeRef v14 = self;
  CFRetain(self);
  CFTypeRef cf = m_ptr;
  if (m_ptr) {
    CFRetain(m_ptr);
  }
  if (v9) {
    CFRetain(*((CFTypeRef *)v9 + 1));
  }
  uint64_t v16 = v9;
  [a5 addCompletion:v13];
  if (v9) {
    CFRelease(*((CFTypeRef *)v9 + 1));
  }
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  CFRelease(self);
  int v10 = v16;
  uint64_t v16 = 0;
  if (v10) {
    CFRelease(*((CFTypeRef *)v10 + 1));
  }
  CFTypeRef v11 = cf;
  CFTypeRef cf = 0;
  if (v11) {
    CFRelease(v11);
  }
  CFTypeRef v12 = v14;
  CFTypeRef v14 = 0;
  if (v12) {
    CFRelease(v12);
  }
}

uint64_t __83__WKContentView_WKInteraction__dragInteraction_item_willAnimateCancelWithAnimator___block_invoke(uint64_t a1)
{
  uint64_t v2 = qword_1EB357DA8;
  if (os_log_type_enabled((os_log_t)qword_1EB357DA8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1985F2000, v2, OS_LOG_TYPE_DEFAULT, "Drag interaction willAnimateCancelWithAnimator (animation completion block fired)", buf, 2u);
  }
  [*(id *)(a1 + 40) setAlpha:1.0];
  WebKit::WebPageProxy::dragCancelled(*(void *)(a1 + 48));
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  if (v3) {
    CFRetain(*(CFTypeRef *)(a1 + 40));
  }
  BOOL v5 = *(const void **)(a1 + 32);
  if (v5) {
    CFRetain(v5);
  }
  uint64_t v6 = (void *)WTF::fastMalloc((WTF *)0x18);
  *uint64_t v6 = &unk_1EEA0E690;
  v6[1] = v3;
  _DWORD v6[2] = v5;
  id v8 = v6;
  WebKit::WebPageProxy::callAfterNextPresentationUpdate(v4, (uint64_t *)&v8);
  uint64_t result = (uint64_t)v8;
  if (v8) {
    return (*(uint64_t (**)(void *))(*v8 + 8))(v8);
  }
  return result;
}

- (void)dragInteraction:(id)a3 sessionDidTransferItems:(id)a4
{
  uint64_t v4 = (void *)existingLocalDragSessionContext(a4);

  [v4 cleanUpTemporaryDirectories];
}

- (void)dragInteraction:(id)a3 prepareDragSession:(id)a4 completion:(id)a5
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3321888768;
  v9[2] = __78__WKContentView_WKInteraction__dragInteraction_prepareDragSession_completion___block_invoke;
  v9[3] = &__block_descriptor_40_e8_32c92_ZTSKZ78__WKContentView_WKInteraction__dragInteraction_prepareDragSession_completion__E4__87_e5_v8__0l;
  id v8 = _Block_copy(a5);
  aBlocuint64_t k = _Block_copy(v8);
  [(WKContentView *)self _dragInteraction:a3 prepareForSession:a4 completion:v9];
  _Block_release(v8);
  _Block_release(aBlock);
}

uint64_t __78__WKContentView_WKInteraction__dragInteraction_prepareDragSession_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dragInteraction:(id)a3 itemsForAddingToSession:(id)a4 forTouchAtPoint:(CGPoint)a5 completion:(id)a6
{
  double y = a5.y;
  double x = a5.x;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3321888768;
  void v12[2] = __99__WKContentView_WKInteraction__dragInteraction_itemsForAddingToSession_forTouchAtPoint_completion___block_invoke;
  void v12[3] = &__block_descriptor_40_e8_32c113_ZTSKZ99__WKContentView_WKInteraction__dragInteraction_itemsForAddingToSession_forTouchAtPoint_completion__E4__88_e17_v16__0__NSArray_8l;
  CFTypeRef v11 = _Block_copy(a6);
  aBlocuint64_t k = _Block_copy(v11);
  -[WKContentView _dragInteraction:itemsForAddingToSession:withTouchAtPoint:completion:](self, "_dragInteraction:itemsForAddingToSession:withTouchAtPoint:completion:", a3, a4, v12, x, y);
  _Block_release(v11);
  _Block_release(aBlock);
}

uint64_t __99__WKContentView_WKInteraction__dragInteraction_itemsForAddingToSession_forTouchAtPoint_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int64_t)_dropInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  id v6 = [(WKContentView *)self webViewUIDelegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  id v7 = [(WKContentView *)self webView];

  return [v6 _webView:v7 dataOwnerForDropSession:a4];
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = [(WKContentView *)self currentDragOrDropSession];
  id v6 = qword_1EB357DA8;
  if (os_log_type_enabled((os_log_t)qword_1EB357DA8, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134218496;
    id v9 = a4;
    __int16 v10 = 2048;
    uint64_t v11 = [a4 localDragSession];
    __int16 v12 = 2048;
    id v13 = v5;
    _os_log_impl(&dword_1985F2000, v6, OS_LOG_TYPE_DEFAULT, "Can handle drag session: %p with local session: %p existing session: %p?", (uint8_t *)&v8, 0x20u);
  }
  return !v5 || [a4 localDragSession] == (void)v5;
}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = qword_1EB357DA8;
  if (os_log_type_enabled((os_log_t)qword_1EB357DA8, OS_LOG_TYPE_DEFAULT))
  {
    buf.var0.m_double x = 134218240;
    *(void *)&buf.var0.m_double y = a4;
    LOWORD(buf.var1.m_y) = 2048;
    *(void *)((char *)&buf.var1.m_y + 2) = objc_msgSend((id)objc_msgSend(a4, "items"), "count");
    _os_log_impl(&dword_1985F2000, v6, OS_LOG_TYPE_DEFAULT, "Drop session entered: %p with %tu items", (uint8_t *)&buf, 0x16u);
  }
  unint64_t v7 = [(WKContentView *)self _dragDestinationActionForDropSession:a4];
  if (self) {
    [(WKContentView *)self dragDataForDropSession:a4 dragDestinationAction:v7];
  }
  else {
    memset(&buf, 0, sizeof(buf));
  }
  WebKit::DragDropInteractionState::dropSessionDidEnterOrUpdate(&self->_pendingRunModalJavaScriptDialogCallback.m_function.m_callableWrapper.__ptr_.__value_, a4);
  int v8 = (WebCore::Pasteboard *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4FB6DC0], "sharedInstance"), "setItemProviders:dropSession:", extractItemProvidersFromDragItems(objc_msgSend(a4, "items")), a4);
  id m_ptr = self->_page.m_ptr;
  WebCore::Pasteboard::nameOfDragPasteboard((uint64_t *)&v13, v8);
  WebKit::WebPageProxy::dragEntered((WebKit::WebPageProxy *)m_ptr, &buf, &v13);
  uint64_t v11 = v13;
  id v13 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2) {
      WTF::StringImpl::destroy(v11, v10);
    }
    else {
      *(_DWORD *)v11 -= 2;
    }
  }
  __int16 v12 = buf.var8.m_impl.m_ptr;
  buf.var8.m_impl.id m_ptr = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2) {
      WTF::StringImpl::destroy((WTF::StringImpl *)v12, v10);
    }
    else {
      *(_DWORD *)v12 -= 2;
    }
  }
  WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&buf.var5, v10);
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4FB6DC0], "sharedInstance", a3), "setItemProviders:dropSession:", extractItemProvidersFromDragItems(objc_msgSend(a4, "items")), a4);
  id v6 = [(WKContentView *)self _dragDestinationActionForDropSession:a4];
  if (self) {
    id v6 = [(WKContentView *)self dragDataForDropSession:a4 dragDestinationAction:v6];
  }
  else {
    memset(&v33, 0, sizeof(v33));
  }
  id m_ptr = self->_page.m_ptr;
  WebCore::Pasteboard::nameOfDragPasteboard((uint64_t *)v32, (WebCore::Pasteboard *)v6);
  WebKit::WebPageProxy::dragUpdated((WebKit::WebPageProxy *)m_ptr, &v33, v32);
  id v9 = v32[0];
  v32[0] = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2) {
      WTF::StringImpl::destroy(v9, v8);
    }
    else {
      *(_DWORD *)v9 -= 2;
    }
  }
  WebKit::DragDropInteractionState::dropSessionDidEnterOrUpdate(&self->_pendingRunModalJavaScriptDialogCallback.m_function.m_callableWrapper.__ptr_.__value_, a4);
  id v10 = [(WKContentView *)self webViewUIDelegate];
  int v11 = *(_WORD *)((char *)self->_page.m_ptr + 913);
  uint64_t v12 = 2 * (v11 == 1);
  BOOL v13 = v11 == 16;
  uint64_t v14 = 3;
  if (!v13) {
    uint64_t v14 = v12;
  }
  if (*(unsigned __int16 *)((char *)self->_page.m_ptr + 913) >= 0x100u) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = 0;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v15 = objc_msgSend(v10, "_webView:willUpdateDataInteractionOperationToOperation:forSession:", -[WKContentView webView](self, "webView"), v15, a4);
  }
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F429D8]) initWithDropOperation:v15];
  uint64_t v17 = v16;
  if (*(unsigned __int8 *)(*((void *)self->_page.m_ptr + 4) + 2072) - 1 > 1)
  {
    [v16 setPrecise:0];
  }
  else
  {
    objc_msgSend((id)objc_msgSend(-[WKContentView webView](self, "webView"), "scrollView"), "zoomScale");
    double v19 = v18;
    *(_OWORD *)uint64_t v32 = *(_OWORD *)(*((void *)self->_page.m_ptr + 4) + 2040);
    WebCore::IntRect::operator CGRect();
    CGRect v36 = CGRectInset(v35, 0.0, 25.0 / v19);
    CGFloat x = v36.origin.x;
    CGFloat y = v36.origin.y;
    CGFloat width = v36.size.width;
    CGFloat height = v36.size.height;
    [a4 locationInView:self];
    v34.CGFloat x = v24;
    v34.CGFloat y = v25;
    v37.origin.CGFloat x = x;
    v37.origin.CGFloat y = y;
    v37.size.CGFloat width = width;
    v37.size.CGFloat height = height;
    objc_msgSend(v17, "setPrecise:", CGRectContainsPoint(v37, v34));
  }
  if (objc_opt_respondsToSelector())
  {
    unint64_t v26 = (const void *)objc_msgSend(v10, "_webView:willUpdateDropProposalToProposal:forSession:", -[WKContentView webView](self, "webView"), v17, a4);
    uint64_t v27 = v26;
    if (v26) {
      CFRetain(v26);
    }
    if (v17) {
      CFRelease(v17);
    }
  }
  else
  {
    uint64_t v27 = v17;
  }
  CFTypeRef v29 = (id)CFMakeCollectable(v27);
  CGPoint v30 = v33.var8.m_impl.m_ptr;
  v33.var8.m_impl.id m_ptr = 0;
  if (v30)
  {
    if (*(_DWORD *)v30 == 2) {
      WTF::StringImpl::destroy((WTF::StringImpl *)v30, v28);
    }
    else {
      *(_DWORD *)v30 -= 2;
    }
  }
  WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v33.var5, v28);
  return (id)v29;
}

- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = qword_1EB357DA8;
  if (os_log_type_enabled((os_log_t)qword_1EB357DA8, OS_LOG_TYPE_DEFAULT))
  {
    buf[0] = 134218240;
    *(void *)&buf[1] = a4;
    LOWORD(buf[3]) = 2048;
    *(void *)((char *)&buf[3] + 2) = objc_msgSend((id)objc_msgSend(a4, "items"), "count");
    _os_log_impl(&dword_1985F2000, v6, OS_LOG_TYPE_DEFAULT, "Drop session exited: %p with %tu items", (uint8_t *)buf, 0x16u);
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4FB6DC0], "sharedInstance"), "setItemProviders:dropSession:", extractItemProvidersFromDragItems(objc_msgSend(a4, "items")), a4);
  if (self)
  {
    [(WKContentView *)self dragDataForDropSession:a4 dragDestinationAction:-1];
  }
  else
  {
    uint64_t v15 = 0;
    *(_OWORD *)uint64_t v14 = 0u;
    memset(v13, 0, sizeof(v13));
    memset(buf, 0, sizeof(buf));
  }
  id m_ptr = self->_page.m_ptr;
  v11[0] = 0;
  v11[16] = 0;
  WebKit::WebPageProxy::performDragControllerAction((uint64_t)m_ptr, 2, (uint64_t)buf, (uint64_t)v11);
  WebKit::WebPageProxy::resetCurrentDragInformation((WebKit::WebPageProxy *)self->_page.m_ptr);
  CGFloat x = self->_dragDropInteractionState.m_adjustedPositionForDragEnd.x;
  self->_dragDropInteractionState.m_adjustedPositionForDragEnd.CGFloat x = 0.0;
  if (x != 0.0) {
    CFRelease(*(CFTypeRef *)&x);
  }
  id v10 = v14[1];
  v14[1] = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2) {
      WTF::StringImpl::destroy(v10, v8);
    }
    else {
      *(_DWORD *)v10 -= 2;
    }
  }
  WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v13, v8);
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  ItemProvidersFromDragItems = extractItemProvidersFromDragItems(objc_msgSend(a4, "items", a3));
  id v7 = [(WKContentView *)self webViewUIDelegate];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v7, "_webView:performDataInteractionOperationWithItemProviders:", -[WKContentView webView](self, "webView"), ItemProvidersFromDragItems) & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (ItemProvidersFromDragItems = extractItemProvidersFromDragItems(objc_msgSend(v7, "_webView:willPerformDropWithSession:", -[WKContentView webView](self, "webView"), a4)), objc_msgSend(ItemProvidersFromDragItems, "count")))
    {
      BYTE1(self->_dragDropInteractionState.m_lastGlobalPosition.x) = 1;
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4FB6DC0], "sharedInstance"), "setItemProviders:dropSession:", ItemProvidersFromDragItems, a4);
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4FB6DC0], "sharedInstance"), "incrementPendingOperationCount");
      [(WKContentView *)self dragDataForDropSession:a4 dragDestinationAction:-1];
      BOOL v8 = [(WKContentView *)self _handleDropByInsertingImagePlaceholders:ItemProvidersFromDragItems session:a4];
      id v9 = qword_1EB357DA8;
      if (os_log_type_enabled((os_log_t)qword_1EB357DA8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = [ItemProvidersFromDragItems count];
        *(_DWORD *)DragData buf = 134218240;
        *(void *)&uint8_t buf[4] = v10;
        *(_WORD *)&unsigned char buf[12] = 2048;
        *(void *)&buf[14] = a4;
        _os_log_impl(&dword_1985F2000, v9, OS_LOG_TYPE_DEFAULT, "Loading data from %tu item providers for session: %p", buf, 0x16u);
      }
      CFRetain(self);
      int v11 = (void *)[MEMORY[0x1E4FB6DC0] sharedInstance];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3321888768;
      float v23[2] = __60__WKContentView_WKInteraction__dropInteraction_performDrop___block_invoke;
      v23[3] = &__block_descriptor_136_e8_32c74_ZTSKZ60__WKContentView_WKInteraction__dropInteraction_performDrop__E4__89_e17_v16__0__NSArray_8l;
      *(void *)DragData buf = self;
      CFRetain(self);
      *(_OWORD *)&_DWORD buf[8] = v31[0];
      *(_OWORD *)&unsigned char buf[18] = *(_OWORD *)((char *)v31 + 10);
      v39[0] = v32;
      uint64_t v12 = v33;
      uint64_t v32 = 0;
      uint64_t v33 = 0;
      v39[1] = v12;
      long long v40 = v34;
      char v41 = v35;
      BOOL v13 = v36;
      CGRect v36 = 0;
      __int16 v42 = v13;
      char v43 = v37;
      BOOL v44 = !v8;
      CFTypeRef cf = *(CFTypeRef *)buf;
      if (*(void *)buf) {
        CFRetain(*(CFTypeRef *)buf);
      }
      v25[0] = *(_OWORD *)&buf[8];
      *(_OWORD *)((char *)v25 + 10) = *(_OWORD *)&buf[18];
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t)v26, (uint64_t)v39);
      v26[1] = v40;
      char v27 = v41;
      uint64_t v14 = v42;
      if (v42) {
        *(_DWORD *)v42 += 2;
      }
      IntSize v28 = v14;
      char v29 = v43;
      BOOL v30 = v44;
      [v11 doAfterLoadingProvidedContentIntoFileURLs:v23];
      uint64_t v16 = v42;
      __int16 v42 = 0;
      if (v16)
      {
        if (*(_DWORD *)v16 == 2) {
          WTF::StringImpl::destroy(v16, v15);
        }
        else {
          *(_DWORD *)v16 -= 2;
        }
      }
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v39, v15);
      double v18 = *(const void **)buf;
      *(void *)DragData buf = 0;
      if (v18) {
        CFRelease(v18);
      }
      double v19 = v28;
      IntSize v28 = 0;
      if (v19)
      {
        if (*(_DWORD *)v19 == 2) {
          WTF::StringImpl::destroy(v19, v17);
        }
        else {
          *(_DWORD *)v19 -= 2;
        }
      }
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v26, v17);
      CFTypeRef v20 = cf;
      CFTypeRef cf = 0;
      if (v20) {
        CFRelease(v20);
      }
      CFRelease(self);
      uint64_t v22 = v36;
      CGRect v36 = 0;
      if (v22)
      {
        if (*(_DWORD *)v22 == 2) {
          WTF::StringImpl::destroy(v22, v21);
        }
        else {
          *(_DWORD *)v22 -= 2;
        }
      }
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v32, v21);
    }
  }
}

uint64_t __60__WKContentView_WKInteraction__dropInteraction_performDrop___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = qword_1EB357DA8;
  if (os_log_type_enabled((os_log_t)qword_1EB357DA8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)DragData buf = 134217984;
    uint64_t v33 = [a2 count];
    _os_log_impl(&dword_1985F2000, v4, OS_LOG_TYPE_DEFAULT, "Loaded data into %tu files", buf, 0xCu);
  }
  uint64_t v30 = 0;
  uint64_t v31 = 0;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v6 = [a2 countByEnumeratingWithState:&v26 objects:buf count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v27;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(a2);
        }
        v24[0] = [*(id *)(*((void *)&v26 + 1) + 8 * v8) path];
        if (HIDWORD(v31) == v31)
        {
          WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,NSString *&>((uint64_t)&v30, v24);
        }
        else
        {
          MEMORY[0x19972EAD0](v30 + 8 * HIDWORD(v31));
          ++HIDWORD(v31);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v9 = [a2 countByEnumeratingWithState:&v26 objects:buf count:16];
      uint64_t v6 = v9;
    }
    while (v9);
  }
  uint64_t v10 = *(unsigned int *)(a1 + 84);
  if (v10) {
    WTF::VectorDestructor<true,WTF::String>::destruct(*(WTF::StringImpl **)(a1 + 72), (WTF::StringImpl *)(*(void *)(a1 + 72) + 8 * v10));
  }
  int v11 = *(WTF **)(a1 + 72);
  if (v11)
  {
    *(void *)(a1 + 72) = 0;
    *(_DWORD *)(a1 + 80) = 0;
    int v11 = (WTF *)WTF::fastFree(v11, v5);
  }
  *(void *)(a1 + 72) = v30;
  uint64_t v12 = v31;
  uint64_t v30 = 0;
  uint64_t v31 = 0;
  *(void *)(a1 + 80) = v12;
  v24[1] = 0;
  CGFloat v25 = 0;
  v24[0] = 0;
  WebCore::Pasteboard::nameOfDragPasteboard((uint64_t *)&v23, v11);
  WebKit::WebPageProxy::createSandboxExtensionsIfNeeded(*(void *)(*(void *)(a1 + 32) + 424), (uint64_t)&v30, &v25, (uint64_t)v24);
  WebKit::WebPageProxy::performDragOperation(*(void *)(*(void *)(a1 + 32) + 424), a1 + 40, &v23, (uint64_t *)&v25, v24);
  if (*(unsigned char *)(a1 + 128))
  {
    uint64_t v14 = (const void *)[*(id *)(a1 + 32) snapshotViewAfterScreenUpdates:0];
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)(a1 + 32);
    if (v14) {
      CFRetain(v14);
    }
    uint64_t v17 = *(const void **)(v16 + 3560);
    *(void *)(v16 + 3560) = v15;
    if (v17) {
      CFRelease(v17);
    }
    double v18 = *(void **)(a1 + 32);
    double v19 = (void *)v18[445];
    [v18 bounds];
    objc_msgSend(v19, "setFrame:");
    [*(id *)(a1 + 32) addSubview:*(void *)(*(void *)(a1 + 32) + 3560)];
  }
  CFTypeRef v20 = v23;
  uint64_t v23 = 0;
  if (v20)
  {
    if (*(_DWORD *)v20 == 2) {
      WTF::StringImpl::destroy(v20, v13);
    }
    else {
      *(_DWORD *)v20 -= 2;
    }
  }
  WTF::Vector<WebKit::SandboxExtensionHandle,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v24, v13);
  WebKit::SandboxExtensionHandle::~SandboxExtensionHandle(&v25);
  return WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v30, v21);
}

- (void)dropInteraction:(id)a3 item:(id)a4 willAnimateDropWithAnimator:(id)a5
{
  ++*(void *)&self->_commitPotentialTapPointerId;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3321888768;
  _DWORD v8[2] = __81__WKContentView_WKInteraction__dropInteraction_item_willAnimateDropWithAnimator___block_invoke;
  v8[3] = &__block_descriptor_40_e8_32c95_ZTSKZ81__WKContentView_WKInteraction__dropInteraction_item_willAnimateDropWithAnimator__E4__90_e8_v16__0q8l;
  CFRetain(self);
  CFTypeRef cf = self;
  CFRetain(self);
  [a5 addCompletion:v8];
  CFRelease(self);
  CFTypeRef v7 = cf;
  CFTypeRef cf = 0;
  if (v7) {
    CFRelease(v7);
  }
}

void __81__WKContentView_WKInteraction__dropInteraction_item_willAnimateDropWithAnimator___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 3008) - 1;
  *(void *)(v1 + 3008) = v2;
  if (!v2)
  {
    uint64_t v3 = *(void **)(v1 + 3568);
    *(void *)(v1 + 3568) = 0;
    [v3 removeFromSuperview];
    if (v3)
    {
      CFRelease(v3);
    }
  }
}

- (void)dropInteraction:(id)a3 concludeDrop:(id)a4
{
  [(WKContentView *)self _removeContainerForDropPreviews];
  id v5 = *(void **)self->_anon_dc8;
  *(void *)self->_anon_dc8 = 0;
  [v5 removeFromSuperview];
  if (v5) {
    CFRelease(v5);
  }
  id m_ptr = self->_dragInteraction.m_ptr;
  self->_dragInteraction.id m_ptr = 0;
  [m_ptr removeFromSuperview];
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  CFTypeRef v7 = self->_page.m_ptr;
  uint64_t v8 = *((void *)v7 + 32);
  char v9 = 0;
  WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::DidConcludeDrop>(v8, (uint64_t)&v9, *(void *)(*((void *)v7 + 4) + 1928), 0);
}

- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5
{
  p_pendingRunModalJavaScriptDialogCallbacuint64_t k = &self->_pendingRunModalJavaScriptDialogCallback;
  CFTypeRef v9 = WebKit::DragDropInteractionState::finalDropPreview((WebKit::DragDropInteractionState *)&self->_pendingRunModalJavaScriptDialogCallback, (UIDragItem *)a4);
  if (!v9)
  {
    WebKit::DragDropInteractionState::addDefaultDropPreview((WebKit::DragDropInteractionState *)p_pendingRunModalJavaScriptDialogCallback, a4, (UITargetedDragPreview *)a5);
    v29[3] = *(_OWORD *)(*((void *)self->_page.m_ptr + 4) + 2056);
    WebCore::IntRect::operator CGRect();
    double x = v30.origin.x;
    double y = v30.origin.y;
    double width = v30.size.width;
    double height = v30.size.height;
    if (CGRectIsEmpty(v30))
    {
      return 0;
    }
    else
    {
      id v14 = [(WKContentView *)self textEffectsWindow];
      -[WKContentView convertRect:toCoordinateSpace:](self, "convertRect:toCoordinateSpace:", v14, x, y, width, height);
      CGFloat v15 = v31.origin.x;
      CGFloat v16 = v31.origin.y;
      CGFloat v17 = v31.size.width;
      CGFloat v18 = v31.size.height;
      double MidX = CGRectGetMidX(v31);
      v32.origin.double x = v15;
      v32.origin.double y = v16;
      v32.size.double width = v17;
      v32.size.double height = v18;
      double MidY = CGRectGetMidY(v32);
      [a5 size];
      double v22 = MidX + v21 * 0.5;
      [a5 size];
      double v24 = MidY + v23 * 0.5;
      id v25 = objc_alloc(MEMORY[0x1E4F429B8]);
      long long v26 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      v29[0] = *MEMORY[0x1E4F1DAB8];
      v29[1] = v26;
      _OWORD v29[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      long long v27 = (const void *)objc_msgSend(v25, "initWithContainer:center:transform:", v14, v29, v22, v24);
      CFTypeRef v9 = (CFTypeRef)[a5 retargetedPreviewWithTarget:v27];
      if (v27) {
        CFRelease(v27);
      }
    }
  }
  return (id)v9;
}

- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = qword_1EB357DA8;
  if (os_log_type_enabled((os_log_t)qword_1EB357DA8, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = BYTE1(self->_dragDropInteractionState.m_lastGlobalPosition.x);
    int x_low = LOBYTE(self->_dragDropInteractionState.m_lastGlobalPosition.x);
    *(_DWORD *)DragData buf = 134218496;
    id v31 = a4;
    __int16 v32 = 1024;
    int v33 = v7;
    __int16 v34 = 1024;
    int v35 = x_low;
    _os_log_impl(&dword_1985F2000, v6, OS_LOG_TYPE_DEFAULT, "Drop session ended: %p (performing operation: %d, began dragging: %d)", buf, 0x18u);
  }
  if (!BYTE1(self->_dragDropInteractionState.m_lastGlobalPosition.x)
    && !LOBYTE(self->_dragDropInteractionState.m_lastGlobalPosition.x))
  {
    [(WKContentView *)self computeClientAndGlobalPointsForDropSession:a4 outClientPoint:&v28 outGlobalPoint:&v29];
    [(WKContentView *)self cleanUpDragSourceSessionState];
    id m_ptr = self->_page.m_ptr;
    WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v26, &v28);
    float v10 = roundf(v26[0]);
    uint64_t v11 = 0x7FFFFFFFLL;
    uint64_t v12 = (int)v10;
    if (v10 <= -2147500000.0) {
      uint64_t v12 = 0x80000000;
    }
    if (v10 < 2147500000.0) {
      uint64_t v11 = v12;
    }
    float v13 = roundf(v26[1]);
    uint64_t v14 = 0x7FFFFFFF00000000;
    unint64_t v15 = 0x8000000000000000;
    if (v13 > -2147500000.0) {
      unint64_t v15 = (unint64_t)(int)v13 << 32;
    }
    if (v13 < 2147500000.0) {
      uint64_t v14 = v15;
    }
    uint64_t v27 = v14 | v11;
    WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v24, &v29);
    float v16 = roundf(v24[0]);
    uint64_t v17 = 0x7FFFFFFFLL;
    uint64_t v18 = 0x80000000;
    if (v16 > -2147500000.0) {
      uint64_t v18 = (int)v16;
    }
    if (v16 < 2147500000.0) {
      uint64_t v17 = v18;
    }
    float v19 = roundf(v24[1]);
    uint64_t v20 = 0x7FFFFFFF00000000;
    unint64_t v21 = 0x8000000000000000;
    if (v19 > -2147500000.0) {
      unint64_t v21 = (unint64_t)(int)v19 << 32;
    }
    if (v19 < 2147500000.0) {
      uint64_t v20 = v21;
    }
    uint64_t v25 = v20 | v17;
    buf[0] = 0;
    BYTE2(v33) = 0;
    IntSize v22 = (IntSize)&v27;
    IntPoint v23 = (IntPoint)buf;
    WebKit::WebPageProxy::dragEnded((uint64_t)m_ptr, v22, &v25, 0, v23);
  }
}

- (void)cancelActiveTextInteractionGestures
{
  id v2 = [(WKContentView *)self textInteractionLoupeGestureRecognizer];

  objc_msgSend(v2, "_wk_cancel");
}

- (id)textEffectsWindow
{
  id v2 = (void *)MEMORY[0x1E4F42F08];
  uint64_t v3 = objc_msgSend((id)-[WKContentView window](self, "window"), "windowScene");

  return (id)[v2 sharedTextEffectsWindowForWindowScene:v3];
}

- (id)_autofillContext
{
  if (![(WKContentView *)self _hasFocusedElement]) {
    return 0;
  }
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:&unk_1EEA52FA8 forKeyedSubscript:@"_WKAutofillContextVersion"];
  if (self->_textInteractionDidChangeFocusedElement && self->_anon_938[113] == 3)
  {
    [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"_automaticPasswordKeyboard"];
    [v3 setObject:self->_domPasteRequestHandler.m_function.m_callableWrapper.__ptr_.__value_ forKeyedSubscript:@"strongPasswordAdditionalContext"];
  }
  else if (self->_anon_938[176])
  {
    [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"_acceptsLoginCredentials"];
  }
  uint64_t v5 = WTF::URL::operator NSURL *();
  if (v5) {
    [v3 setObject:v5 forKeyedSubscript:@"_WebViewURL"];
  }
  if (self->_anon_938[225])
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLong:", *(void *)(*((void *)self->_page.m_ptr + 4) + 1928)), @"_page_id");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLong:", *(void *)&self->_anon_938[328]), @"_frame_id");
    WebCore::nonAutofillCredentialTypeString();
    if (v8) {
      uint64_t v6 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v6 = &stru_1EEA10550;
    }
    [v3 setObject:v6 forKeyedSubscript:@"_credential_type"];
    if (v8)
    {
      if (*(_DWORD *)v8 == 2) {
        WTF::StringImpl::destroy(v8, v7);
      }
      else {
        *(_DWORD *)v8 -= 2;
      }
    }
  }
  return (id)(id)CFMakeCollectable(v3);
}

- (id)_createTargetedPreviewFromTextIndicator:(TextIndicatorData *)a3 previewContainer:(id)a4
{
  id m_ptr = a3->contentImage.m_ptr;
  if (m_ptr)
  {
    uint64_t v8 = WebCore::DestinationColorSpace::SRGB((WebCore::DestinationColorSpace *)self);
    (*(void (**)(WebCore::NativeImage **__return_ptr, Image *, uint64_t))(*(void *)m_ptr + 288))(&v37, m_ptr, v8);
    if (!v37)
    {
      id m_ptr = 0;
      goto LABEL_15;
    }
    id v9 = objc_alloc(MEMORY[0x1E4F42A80]);
    id m_ptr = (Image *)[v9 initWithCGImage:*(void *)WebCore::NativeImage::platformImage(v37)];
    uint64_t v11 = v37;
    char v37 = 0;
    if (v11)
    {
      char v12 = 0;
      uint64_t v13 = *((void *)v11 + 1);
      atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)v13, (unsigned __int8 *)&v12, 1u, memory_order_acquire, memory_order_acquire);
      if (v12) {
        MEMORY[0x19972E8D0](v13);
      }
      uint64_t v14 = *(void *)(v13 + 8);
      int v15 = 1;
      uint64_t v16 = v14 - 1;
      *(void *)(v13 + 8) = v14 - 1;
      if (v14 == 1)
      {
        uint64_t v28 = *(void *)(v13 + 16);
        uint64_t v17 = *(void *)(v13 + 24);
        *(void *)(v13 + 24) = 0;
        BOOL v18 = v28 != 0;
      }
      else
      {
        uint64_t v17 = 0;
        BOOL v18 = 1;
      }
      atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)v13, (unsigned __int8 *)&v15, 0, memory_order_release, memory_order_relaxed);
      if (v15 == 1)
      {
        if (v16) {
          goto LABEL_15;
        }
      }
      else
      {
        WTF::Lock::unlockSlow((WTF::Lock *)v13);
        if (v16) {
          goto LABEL_15;
        }
      }
      if (v17) {
        (*(void (**)(uint64_t))(*(void *)v17 + 8))(v17);
      }
      if (!v18) {
        WTF::fastFree((WTF *)v13, v10);
      }
    }
  }
LABEL_15:
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3321888768;
  _OWORD v29[2] = __89__WKContentView_WKInteraction___createTargetedPreviewFromTextIndicator_previewContainer___block_invoke;
  v29[3] = &__block_descriptor_144_e8_32c33_ZTSN7WebCore17TextIndicatorDataE_e14___UIColor_8__0l;
  WebCore::TextIndicatorData::TextIndicatorData((WebCore::TextIndicatorData *)&v30, (const WebCore::TextIndicatorData *)a3);
  uint64_t v19 = ((uint64_t (*)(void *))__89__WKContentView_WKInteraction___createTargetedPreviewFromTextIndicator_previewContainer___block_invoke)(v29);
  createTargetedPreview(&v37, (uint64_t)m_ptr, self, a4, (uint64_t)&a3->textBoundingRectInRootViewCoordinates, (uint64_t)&a3->textRectsInBoundingRectCoordinates, v19);
  CFTypeRef v21 = (id)CFMakeCollectable(v37);
  char v37 = 0;
  if ((v36 & 0x8000000000000) != 0)
  {
    uint64_t v27 = (unsigned int *)(v36 & 0xFFFFFFFFFFFFLL);
    if (atomic_fetch_add((atomic_uint *volatile)(v36 & 0xFFFFFFFFFFFFLL), 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, v27);
      WTF::fastFree((WTF *)v27, v20);
    }
  }
  IntSize v22 = v35;
  int v35 = 0;
  if (v22)
  {
    if (v22[2] == 1) {
      (*(void (**)(_DWORD *))(*(void *)v22 + 8))(v22);
    }
    else {
      --v22[2];
    }
  }
  IntPoint v23 = v34;
  __int16 v34 = 0;
  if (v23)
  {
    if (v23[2] == 1) {
      (*(void (**)(_DWORD *))(*(void *)v23 + 8))(v23);
    }
    else {
      --v23[2];
    }
  }
  double v24 = v33;
  int v33 = 0;
  if (v24)
  {
    if (v24[2] == 1) {
      (*(void (**)(_DWORD *))(*(void *)v24 + 8))(v24);
    }
    else {
      --v24[2];
    }
  }
  uint64_t v25 = v31;
  if (v31)
  {
    id v31 = 0;
    int v32 = 0;
    WTF::fastFree(v25, v20);
  }
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  return (id)v21;
}

uint64_t __89__WKContentView_WKInteraction___createTargetedPreviewFromTextIndicator_previewContainer___block_invoke(uint64_t a1, const Color *a2)
{
  uint64_t v3 = *(void *)(a1 + 128);
  id v2 = (WebCore *)(a1 + 128);
  if (v3 == 0x1104000000000000)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F428B8];
    return [v8 systemBackgroundColor];
  }
  else
  {
    WebCore::cocoaColor((uint64_t *)&cf, v2, a2);
    CFTypeRef v4 = cf;
    CFTypeRef cf = 0;
    CFTypeRef v5 = (id)CFMakeCollectable(v4);
    CFTypeRef v6 = cf;
    CFTypeRef cf = 0;
    if (v6) {
      CFRelease(v6);
    }
    return (uint64_t)v5;
  }
}

- (id)_createTargetedContextMenuHintPreviewForFocusedElement:(unsigned __int8)a3
{
  int v3 = a3;
  p_focusedElementInformation = &self->_focusedElementInformation;
  if (self->_anon_938[113] - 11 > 4) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = [MEMORY[0x1E4F428B8] clearColor];
  }
  IntRect interactionRect = p_focusedElementInformation->interactionRect;
  if (v3 != 1) {
    goto LABEL_19;
  }
  [(WKContentView *)self unobscuredContentRect];
  v24.origin.double x = v7;
  v24.origin.double y = v8;
  v24.size.double width = v9;
  v24.size.double height = v10;
  WebCore::FloatRect::FloatRect((WebCore::FloatRect *)&v25, &v24);
  WebCore::IntRect::IntRect((WebCore::IntRect *)&v26, &v25);
  int v11 = interactionRect.m_location.m_x - 250;
  int v12 = interactionRect.m_size.m_width + interactionRect.m_location.m_x;
  int v13 = interactionRect.m_size.m_width + interactionRect.m_location.m_x + 250;
  int v14 = (int)v26;
  int v15 = v27 + v26;
  uint64_t v16 = [(WKContentView *)self effectiveUserInterfaceLayoutDirection];
  if (v16 == 1)
  {
    if (v11 <= v14) {
      int v17 = v12;
    }
    else {
      int v17 = v11;
    }
    if (v11 > v14 || v13 <= v15) {
      goto LABEL_18;
    }
  }
  else if (!v16)
  {
    int v17 = v13 > v15 ? v11 : v12;
    if (v13 <= v15 || v11 > v14)
    {
LABEL_18:
      interactionRect.m_location.m_double x = v17 + 20;
      interactionRect.m_size.float m_width = 1;
    }
  }
LABEL_19:
  BOOL v18 = [(WKContentView *)self containerForContextMenuHintPreviews];
  WebCore::FloatRect::FloatRect((WebCore::FloatRect *)&v24, (const WebCore::IntRect *)&interactionRect);
  createFallbackTargetedPreview((UIView *)&v26, &self->super.super, v18, (UIColor *)&v24, v6);
  FloatSize m_size = p_focusedElementInformation[5].elementContext.boundingRect.m_size;
  if (m_size)
  {
    long long v22 = *(_OWORD *)&p_focusedElementInformation[5].elementContext.boundingRect.m_size.m_width;
    LOBYTE(m_size.m_width) = 1;
  }
  else
  {
    LOBYTE(v22) = 0;
  }
  char m_width_low = LOBYTE(m_size.m_width);
  [(WKContentView *)self _updateTargetedPreviewScrollViewUsingContainerScrollingNodeID:&v22];
  id result = v26;
  id m_ptr = self->_contextMenuInteractionTargetedPreview.m_ptr;
  self->_contextMenuInteractionTargetedPreview.id m_ptr = v26;
  if (m_ptr)
  {
    CFRelease(m_ptr);
    return self->_contextMenuInteractionTargetedPreview.m_ptr;
  }
  return result;
}

- (BOOL)positionInformationHasImageOverlayDataDetector
{
  return self->_positionInformation.isImageOverlayText
      && [self->_positionInformation.dataDetectorResults.m_ptr count] != 0;
}

- (id)_createTargetedContextMenuHintPreviewIfPossible
{
  p_positionInformation = &self->_positionInformation;
  if (self->_positionInformation.isLink && self->_positionInformation.linkIndicator.contentImage.m_ptr)
  {
    WebCore::TextIndicatorData::TextIndicatorData((WebCore::TextIndicatorData *)v46, (const WebCore::TextIndicatorData *)&self->_positionInformation.linkIndicator);
    p_positionInformationLinkIndicator = &self->_positionInformationLinkIndicator;
    if (self->_positionInformationLinkIndicator.__engaged_) {
      WebCore::TextIndicatorData::operator=((uint64_t)p_positionInformationLinkIndicator, v46);
    }
    else {
      *((unsigned char *)WebCore::TextIndicatorData::TextIndicatorData((WebCore::TextIndicatorData *)p_positionInformationLinkIndicator, (const WebCore::TextIndicatorData *)v46)+ 112) = 1;
    }
    WebCore::TextIndicatorData::TextIndicatorData((WebCore::TextIndicatorData *)v39, (const WebCore::TextIndicatorData *)v46);
    id v11 = [(WKContentView *)self _createTargetedPreviewFromTextIndicator:v39 previewContainer:[(WKContentView *)self containerForContextMenuHintPreviews]];
    CGFloat v9 = v11;
    if (v11) {
      CFRetain(v11);
    }
    if ((v45 & 0x8000000000000) != 0)
    {
      id v31 = (unsigned int *)(v45 & 0xFFFFFFFFFFFFLL);
      if (atomic_fetch_add((atomic_uint *volatile)(v45 & 0xFFFFFFFFFFFFLL), 0xFFFFFFFF) == 1)
      {
        atomic_store(1u, v31);
        WTF::fastFree((WTF *)v31, v12);
      }
    }
    int v13 = v44;
    BOOL v44 = 0;
    if (v13)
    {
      if (v13[2] == 1) {
        (*(void (**)(_DWORD *))(*(void *)v13 + 8))(v13);
      }
      else {
        --v13[2];
      }
    }
    int v14 = v43;
    char v43 = 0;
    if (v14)
    {
      if (v14[2] == 1) {
        (*(void (**)(_DWORD *))(*(void *)v14 + 8))(v14);
      }
      else {
        --v14[2];
      }
    }
    int v15 = v42;
    __int16 v42 = 0;
    if (v15)
    {
      if (v15[2] == 1) {
        (*(void (**)(_DWORD *))(*(void *)v15 + 8))(v15);
      }
      else {
        --v15[2];
      }
    }
    uint64_t v16 = v40;
    if (v40)
    {
      long long v40 = 0;
      int v41 = 0;
      WTF::fastFree(v16, v12);
    }
    if ((v52 & 0x8000000000000) != 0)
    {
      int v32 = (unsigned int *)(v52 & 0xFFFFFFFFFFFFLL);
      if (atomic_fetch_add((atomic_uint *volatile)(v52 & 0xFFFFFFFFFFFFLL), 0xFFFFFFFF) == 1)
      {
        atomic_store(1u, v32);
        WTF::fastFree((WTF *)v32, v12);
      }
    }
    int v17 = v51;
    long long v51 = 0;
    if (v17)
    {
      if (v17[2] == 1) {
        (*(void (**)(_DWORD *))(*(void *)v17 + 8))(v17);
      }
      else {
        --v17[2];
      }
    }
    BOOL v18 = v50;
    FloatRect v50 = 0;
    if (v18)
    {
      if (v18[2] == 1) {
        (*(void (**)(_DWORD *))(*(void *)v18 + 8))(v18);
      }
      else {
        --v18[2];
      }
    }
    uint64_t v19 = v49;
    uint64_t v49 = 0;
    if (v19)
    {
      if (v19[2] == 1) {
        (*(void (**)(_DWORD *))(*(void *)v19 + 8))(v19);
      }
      else {
        --v19[2];
      }
    }
    uint64_t v20 = v47;
    if (v47)
    {
      int v47 = 0;
      int v48 = 0;
      WTF::fastFree(v20, v12);
    }
    goto LABEL_45;
  }
  if (self->_positionInformation.isAttachment || self->_positionInformation.isImage)
  {
    id m_ptr = self->_positionInformation.image.m_ptr;
    if (m_ptr)
    {
      WebCore::ShareableBitmap::makeCGImageCopy((uint64_t *)&cf, (WebCore::ShareableBitmap *)m_ptr);
      id v6 = objc_alloc(MEMORY[0x1E4F42A80]);
      CGFloat v7 = (const void *)[v6 initWithCGImage:cf];
      id v8 = [(WKContentView *)self containerForContextMenuHintPreviews];
      WebCore::FloatRect::FloatRect((WebCore::FloatRect *)v46, (const WebCore::IntRect *)&p_positionInformation->bounds);
      v35.super.isa = 0;
      uint64_t v36 = 0;
      createTargetedPreview(&v37, (uint64_t)v7, self, v8, (uint64_t)v46, (uint64_t)&v35, 0);
      CGFloat v9 = v37;
      if (v7) {
        CFRelease(v7);
      }
      CFTypeRef v10 = cf;
      CFTypeRef cf = 0;
      if (v10) {
        CFRelease(v10);
      }
LABEL_45:
      if (v9) {
        goto LABEL_51;
      }
    }
  }
  BOOL v21 = [(WKContentView *)self positionInformationHasImageOverlayDataDetector];
  uint64_t v22 = 176;
  if (v21) {
    uint64_t v22 = 408;
  }
  uint64_t v23 = 184;
  if (v21) {
    uint64_t v23 = 416;
  }
  uint64_t v24 = *(uint64_t *)((char *)&p_positionInformation->request.point + v23);
  *(IntPoint *)&v46[0] = *(IntPoint *)((char *)&p_positionInformation->request.point + v22);
  *((void *)&v46[0] + 1) = v24;
  FloatRect v25 = [(WKContentView *)self containerForContextMenuHintPreviews];
  WebCore::FloatRect::FloatRect((WebCore::FloatRect *)&v35, (const WebCore::IntRect *)v46);
  createFallbackTargetedPreview((UIView *)&cf, &self->super.super, v25, &v35, 0);
  CGFloat v9 = (void *)cf;
LABEL_51:
  unint64_t m_identifier = p_positionInformation->containerScrollingNodeID.m_value.m_object.m_identifier;
  p_containerScrollingNodeID = &p_positionInformation->containerScrollingNodeID;
  char v26 = m_identifier;
  if (m_identifier)
  {
    Markable<WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::ScrollingNodeIDType, WTF::ObjectIdentifierMainThreadAccessTraits<uint64_t>, unsigned long long, WTF::SupportsObjectIdentifierNullState::Yes>>, WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::ScrollingNodeIDType, WTF::ObjectIdentifierMainThreadAccessTraits<uint64_t>, unsigned long long, WTF::SupportsObjectIdentifierNullState::Yes>>::MarkableTraits> v33 = *p_containerScrollingNodeID;
    char v26 = 1;
  }
  else
  {
    LOBYTE(v33.m_value.m_object.m_identifier) = 0;
  }
  char v34 = v26;
  [(WKContentView *)self _updateTargetedPreviewScrollViewUsingContainerScrollingNodeID:&v33];
  CGPoint v29 = self->_contextMenuInteractionTargetedPreview.m_ptr;
  self->_contextMenuInteractionTargetedPreview.id m_ptr = v9;
  if (v29)
  {
    CFRelease(v29);
    return self->_contextMenuInteractionTargetedPreview.m_ptr;
  }
  return v9;
}

- (void)_removeContextMenuHintContainerIfPossible
{
  if (!self->_contextMenuElementInfo.m_ptr
    && !self->_isDisplayingContextMenuWithAnimation
    && ([self->_actionSheetAssistant.m_ptr hasContextMenuInteraction] & 1) == 0
    && !self->_fileUploadPanel.m_ptr
    && ![(WKContentView *)self dateTimeInputControl]
    && ![(WKContentView *)self selectControl]
    && !objc_msgSend((id)objc_msgSend(self->_contextMenuHintContainerView.m_ptr, "subviews"), "count"))
  {
    [(WKContentView *)self _removeContainerForContextMenuHintPreviews];
  }
}

- (void)adjustSelectionWithDelta:(_NSRange)a3 completionHandler:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    id v8 = qword_1EB3586B8;
    if (os_log_type_enabled((os_log_t)qword_1EB3586B8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315138;
      CFTypeRef v10 = "-[WKContentView(WKInteraction) adjustSelectionWithDelta:completionHandler:]";
      _os_log_error_impl(&dword_1985F2000, v8, OS_LOG_TYPE_ERROR, "Received unexpected call to %s", (uint8_t *)&v9, 0xCu);
    }
    __break(0xC471u);
    JUMPOUT(0x19945AED8);
  }

  [(WKContentView *)self _internalAdjustSelectionWithOffset:location lengthDelta:length completionHandler:a4];
}

- (void)requestDocumentContext:(id)a3 completionHandler:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (a3 && (isKindOfClass & 1) != 0)
  {
    [a3 documentRect];
    char v12 = objc_msgSend(a3, "flags", v8, v9, v10, v11);
  }
  else
  {
    objc_opt_class();
    char v13 = objc_opt_isKindOfClass();
    char v12 = 0;
    if (a3 && (v13 & 1) != 0)
    {
      [a3 _documentRect];
      char v12 = objc_msgSend(a3, "options", v14, v15, v16, v17);
    }
  }
  v33[0] = v12;
  unint64_t v18 = [a3 surroundingGranularity];
  unint64_t v19 = 0x50304020100uLL >> (8 * v18);
  if (v18 >= 6) {
    LOBYTE(v19) = 0;
  }
  v33[1] = v19;
  uint64_t v34 = [a3 granularityCount];
  WebCore::FloatRect::FloatRect((WebCore::FloatRect *)&v35, &v32);
  LOBYTE(v36) = 0;
  char v41 = 0;
  uint64_t v20 = (void *)[a3 inputElementIdentifier];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & (v20 != 0)) == 1)
  {
    uint64_t v21 = [v20 _textInputContext];
    long long v36 = *(_OWORD *)v21;
    long long v22 = *(_OWORD *)(v21 + 16);
    long long v23 = *(_OWORD *)(v21 + 32);
    if (v41)
    {
      long long v24 = *(_OWORD *)(v21 + 48);
      *(void *)&long long v40 = *(void *)(v21 + 64);
      long long v38 = v23;
      long long v39 = v24;
      long long v37 = v22;
    }
    else
    {
      long long v25 = *(_OWORD *)(v21 + 64);
      long long v39 = *(_OWORD *)(v21 + 48);
      long long v40 = v25;
      long long v37 = v22;
      long long v38 = v23;
      char v41 = 1;
    }
  }
  char v26 = v33[0];
  id m_ptr = self->_page.m_ptr;
  BOOL v28 = [(WKContentView *)self shouldUseAsyncInteractions];
  CGPoint v29 = _Block_copy(a4);
  uint64_t v30 = WTF::fastMalloc((WTF *)0x20);
  *(void *)uint64_t v30 = &unk_1EEA0F1C0;
  *(unsigned char *)(v30 + 8) = v28;
  *(void *)(v30 + 16) = v29;
  *(unsigned char *)(v30 + 24) = v26;
  *(void *)&v32.origin.CGFloat x = v30;
  WebKit::WebPageProxy::requestDocumentEditingContext((uint64_t)m_ptr, (uint64_t)v33, (uint64_t *)&v32);
  CGFloat x = v32.origin.x;
  v32.origin.CGFloat x = 0.0;
  if (x != 0.0) {
    (*(void (**)(CGFloat))(**(void **)&x + 8))(COERCE_CGFLOAT(*(void *)&x));
  }
  _Block_release(0);
}

- (void)selectPositionAtPoint:(CGPoint)a3 withContextRequest:(id)a4 completionHandler:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v10 = [(WKContentView *)self textInteractionLoupeGestureRecognizer];
  *(double *)unint64_t v19 = x;
  *(double *)&v19[1] = y;
  char v20 = 1;
  logTextInteraction((uint64_t)"-[WKContentView(WKInteraction) selectPositionAtPoint:withContextRequest:completionHandler:]", v10, (uint64_t)v19, 0, 0, 0, 0, v11, 0, 0, 0, 0, 0, 0);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3321888768;
  void v15[2] = __91__WKContentView_WKInteraction__selectPositionAtPoint_withContextRequest_completionHandler___block_invoke;
  v15[3] = &__block_descriptor_56_e8_32c105_ZTSKZ91__WKContentView_WKInteraction__selectPositionAtPoint_withContextRequest_completionHandler__E4__94_e5_v8__0l;
  if (self) {
    CFRetain(self);
  }
  if (a4) {
    CFRetain(a4);
  }
  char v12 = _Block_copy(a5);
  CFTypeRef v16 = self;
  if (self) {
    CFRetain(self);
  }
  CFTypeRef cf = a4;
  if (a4) {
    CFRetain(a4);
  }
  aBlocuint64_t k = _Block_copy(v12);
  -[WKContentView selectPositionAtPoint:completionHandler:](self, "selectPositionAtPoint:completionHandler:", v15, x, y);
  _Block_release(v12);
  if (a4) {
    CFRelease(a4);
  }
  if (self) {
    CFRelease(self);
  }
  _Block_release(aBlock);
  CFTypeRef v13 = cf;
  CFTypeRef cf = 0;
  if (v13) {
    CFRelease(v13);
  }
  CFTypeRef v14 = v16;
  CFTypeRef v16 = 0;
  if (v14) {
    CFRelease(v14);
  }
}

void __91__WKContentView_WKInteraction__selectPositionAtPoint_withContextRequest_completionHandler___block_invoke(void *a1)
{
  uint64_t v1 = (void *)a1[4];
  uint64_t v2 = a1[5];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3321888768;
  v4[2] = ___ZZ91__WKContentView_WKInteraction__selectPositionAtPoint_withContextRequest_completionHandler__EN4__94clEv_block_invoke;
  v4[3] = &__block_descriptor_40_e8_32c126_ZTSKZZ91__WKContentView_WKInteraction__selectPositionAtPoint_withContextRequest_completionHandler__EN4__94clEvEUlP8NSObjectE__e18_v16__0__NSObject_8l;
  int v3 = (const void *)a1[6];
  a1[6] = 0;
  aBlocuint64_t k = _Block_copy(v3);
  [v1 requestDocumentContext:v2 completionHandler:v4];
  _Block_release(v3);
  _Block_release(aBlock);
}

- (void)buildMenuForWebViewWithBuilder:(id)a3
{
  id v5 = [(WKContentView *)self removeBackgroundMenu];
  if (v5) {
    [a3 insertSiblingMenu:v5 beforeMenuForIdentifier:*MEMORY[0x1E4F43BB8]];
  }
  id v6 = [(WKContentView *)self appHighlightMenu];
  if (v6) {
    [a3 insertChildMenu:v6 atEndOfMenuForIdentifier:*MEMORY[0x1E4F43BD0]];
  }
  id v7 = [(WKContentView *)self scrollToTextFragmentGenerationMenu];
  if (v7)
  {
    uint64_t v8 = *MEMORY[0x1E4F43BD8];
    [a3 insertSiblingMenu:v7 beforeMenuForIdentifier:v8];
  }
}

- (id)menuWithInlineAction:(id)a3 image:(id)a4 identifier:(id)a5 handler:(void *)a6
{
  v21[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = (void *)MEMORY[0x1E4F426E8];
  uint64_t v10 = *(void *)a6;
  *(void *)a6 = 0;
  uint64_t v16 = v10;
  id v18 = 0;
  objc_initWeak(&v18, self);
  uint64_t v19 = v16;
  id v20 = 0;
  objc_moveWeak(&v20, &v18);
  uint64_t v11 = malloc_type_malloc(0x30uLL, 0x10E0040331879E5uLL);
  *(void *)uint64_t v11 = MEMORY[0x1E4F14398];
  *((void *)v11 + 1) = 50331650;
  *((void *)v11 + 2) = WTF::BlockPtr<void ()(UIAction *)>::fromCallable<-[WKContentView(WKInteraction) menuWithInlineAction:image:identifier:handler:]::$_3>(-[WKContentView(WKInteraction) menuWithInlineAction:image:identifier:handler:]::$_3)::{lambda(void *,UIAction *)#1}::__invoke;
  *((void *)v11 + 3) = &WTF::BlockPtr<void ()(UIAction *)>::fromCallable<-[WKContentView(WKInteraction) menuWithInlineAction:image:identifier:handler:]::$_3>(-[WKContentView(WKInteraction) menuWithInlineAction:image:identifier:handler:]::$_3)::descriptor;
  uint64_t v12 = v19;
  uint64_t v19 = 0;
  *((void *)v11 + 4) = v12;
  *((void *)v11 + 5) = 0;
  objc_moveWeak((id *)v11 + 5, &v20);
  objc_destroyWeak(&v20);
  uint64_t v13 = v19;
  uint64_t v19 = 0;
  if (v13) {
    (*(void (**)(uint64_t))(*(void *)v13 + 8))(v13);
  }
  uint64_t v14 = objc_msgSend(v9, "actionWithTitle:image:identifier:handler:", a3, a4, a5, v11, 0);
  _Block_release(v11);
  objc_destroyWeak(&v18);
  if (v17) {
    (*(void (**)(uint64_t))(*(void *)v17 + 8))(v17);
  }
  v21[0] = v14;
  return (id)objc_msgSend(MEMORY[0x1E4F42B80], "menuWithTitle:image:identifier:options:children:", &stru_1EEA10550, 0, 0, 1, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v21, 1, 0));
}

- (id)appHighlightMenu
{
  uint64_t v4 = *((void *)self->_page.m_ptr + 34);
  {
    WebKit::WebPreferencesKey::appHighlightsEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::appHighlightsEnabledKey(void)::kedouble y = (uint64_t)&WebKit::WebPreferencesKey::appHighlightsEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  if (!WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)(v4 + 40), (WTF::StringImpl **)&WebKit::WebPreferencesKey::appHighlightsEnabledKey(void)::key, v2)|| !*(unsigned char *)(*((void *)self->_page.m_ptr + 4) + 250)|| ![(WKContentView *)self shouldAllowHighlightLinkCreation])
  {
    return 0;
  }
  id v5 = (WebCore *)[*((id *)self->_page.m_ptr + 173) isVisible];
  char v6 = (char)v5;
  if (v5) {
    WebCore::contextMenuItemTagAddHighlightToCurrentQuickNote((uint64_t *)&v15, v5);
  }
  else {
    WebCore::contextMenuItemTagAddHighlightToNewQuickNote((uint64_t *)&v15, v5);
  }
  if (v15) {
    uint64_t v9 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    uint64_t v9 = &stru_1EEA10550;
  }
  uint64_t v10 = WTF::fastMalloc((WTF *)0x10);
  *(void *)uint64_t v10 = &unk_1EEA0F1E8;
  *(unsigned char *)(v10 + 8) = v6;
  uint64_t v14 = v10;
  id v7 = [(WKContentView *)self menuWithInlineAction:v9 image:0 identifier:@"WKActionCreateQuickNote" handler:&v14];
  uint64_t v12 = v14;
  uint64_t v14 = 0;
  if (v12) {
    (*(void (**)(uint64_t))(*(void *)v12 + 8))(v12);
  }
  uint64_t v13 = v15;
  uint64_t v15 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2) {
      WTF::StringImpl::destroy(v13, v11);
    }
    else {
      *(_DWORD *)v13 -= 2;
    }
  }
  return v7;
}

- (id)scrollToTextFragmentGenerationMenu
{
  uint64_t v4 = *((void *)self->_page.m_ptr + 34);
  {
    WebKit::WebPreferencesKey::scrollToTextFragmentGenerationEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::scrollToTextFragmentGenerationEnabledKey(void)::kedouble y = (uint64_t)&WebKit::WebPreferencesKey::scrollToTextFragmentGenerationEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  if (!WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)(v4 + 40), (WTF::StringImpl **)&WebKit::WebPreferencesKey::scrollToTextFragmentGenerationEnabledKey(void)::key, v2))return 0; {
  id v5 = (WebCore *)[(WKContentView *)self shouldAllowHighlightLinkCreation];
  }
  if (!v5) {
    return 0;
  }
  WebCore::contextMenuItemTagCopyLinkWithHighlight((uint64_t *)&v14, v5);
  if (v14) {
    char v6 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    char v6 = &stru_1EEA10550;
  }
  id v7 = (void *)WTF::fastMalloc((WTF *)0x10);
  *id v7 = &unk_1EEA0F210;
  uint64_t v13 = v7;
  id v9 = [(WKContentView *)self menuWithInlineAction:v6 image:0 identifier:@"WKActionScrollToTextFragmentGeneration" handler:&v13];
  uint64_t v10 = v13;
  uint64_t v13 = 0;
  if (v10) {
    (*(void (**)(void *))(*v10 + 8))(v10);
  }
  uint64_t v11 = v14;
  uint64_t v14 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2) {
      WTF::StringImpl::destroy(v11, v8);
    }
    else {
      *(_DWORD *)v11 -= 2;
    }
  }
  return v9;
}

- (void)setContinuousSpellCheckingEnabled:(BOOL)a3
{
  if (WebKit::TextChecker::setContinuousSpellCheckingEnabled((WebKit::TextChecker *)a3))
  {
    uint64_t v4 = (WebKit *)*((void *)self->_page.m_ptr + 32);
    WebKit::WebProcessProxy::updateTextCheckerState(v4);
  }
}

- (void)setGrammarCheckingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::mutableState((WebKit *)self);
  if (v3 != (WebKit::mutableState(void)::state & 2) >> 1)
  {
    WebKit::TextChecker::setGrammarCheckingEnabled((WebKit::TextChecker *)v3);
    id v5 = (WebKit *)*((void *)self->_page.m_ptr + 32);
    WebKit::WebProcessProxy::updateTextCheckerState(v5);
  }
}

- (void)mouseInteraction:(id)a3 changedWithEvent:(const void *)a4
{
  id m_ptr = self->_page.m_ptr;
  if (!*((unsigned char *)m_ptr + 801) && *((unsigned char *)m_ptr + 800))
  {
    if (*((unsigned char *)a4 + 4) == 1)
    {
      BYTE3(self->_dataListTextSuggestions.m_ptr) = 0;
      if ([(WKContentView *)self hasHiddenContentEditable]
        && [(WKContentView *)self _hasFocusedElement]
        && (objc_msgSend((id)-[WKContentView window](self, "window"), "isKeyWindow") & 1) == 0)
      {
        objc_msgSend((id)-[WKContentView window](self, "window"), "makeKeyWindow");
      }
    }
    else if (!*((unsigned char *)a4 + 4))
    {
      uint64_t v7 = *((void *)m_ptr + 29);
      if (*(unsigned char *)(v7 + 36))
      {
        __break(0xC471u);
        return;
      }
      *(void *)&self->_keyWebEventHandlers.m_inlineBuffer[0].__lx[32] = *(void *)(v7 + 112);
      if (a3)
      {
        [a3 lastLocation];
        if (v9) {
          *(_OWORD *)&self->_keyWebEventHandlers.m_inlineBuffer[0].__lx[16] = v8;
        }
      }
    }
    WebKit::WebPageProxy::handleMouseEvent((WebKit::WebProcessProxy **)self->_page.m_ptr, (const NativeWebMouseEvent *)a4);
  }
}

- (void)_setMouseEventPolicy:(unsigned __int8)a3
{
  self->_mouseEventPolicdouble y = a3;
  [(WKContentView *)self _configureMouseGestureRecognizer];
}

- (void)_showMediaControlsContextMenu:(FloatRect *)a3 items:(void *)a4 completionHandler:(void *)a5
{
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return self->_lastPointerRegion.m_ptr;
}

- (void)_updateLastPointerRegionIfNeeded:(id)a3
{
  BYTE2(v29) = 0;
  LOWORD(v29) = 0;
  WORD2(v29) = 0;
  BYTE6(v29) = 0;
  [a3 location];
  id location = v5;
  *(void *)&long long v23 = v6;
  WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v27, (const CGPoint *)&location);
  float v7 = roundf(v27[0]);
  uint64_t v8 = 0x7FFFFFFFLL;
  uint64_t v9 = 0x80000000;
  if (v7 > -2147500000.0) {
    uint64_t v9 = (int)v7;
  }
  if (v7 < 2147500000.0) {
    uint64_t v8 = v9;
  }
  float v10 = roundf(v27[1]);
  uint64_t v11 = 0x7FFFFFFF00000000;
  unint64_t v12 = 0x8000000000000000;
  if (v10 > -2147500000.0) {
    unint64_t v12 = (unint64_t)(int)v10 << 32;
  }
  if (v10 < 2147500000.0) {
    uint64_t v11 = v12;
  }
  uint64_t v28 = v11 | v8;
  WORD1(v29) = 1;
  if ([(WKContentView *)self _currentPositionInformationIsValidForRequest:&v28])
  {
    [a3 location];
    id v13 = -[WKContentView pointerRegionForPositionInformation:point:](self, "pointerRegionForPositionInformation:point:", &self->_positionInformation);
    uint64_t v14 = v13;
    if (v13) {
      CFRetain(v13);
    }
    id m_ptr = self->_lastPointerRegion.m_ptr;
    self->_lastPointerRegion.id m_ptr = v14;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    self->_pointerInteractionRegionNeedsUpdate = 0;
  }
  else
  {
    if (objc_msgSend(-[WKContentView webView](self, "webView"), "_isEditable")
      && !self->_positionInformation.shouldNotUseIBeamInEditableContent)
    {
      uint64_t v16 = self->_lastPointerRegion.m_ptr;
      if (v16) {
        [v16 rect];
      }
      else {
        [(WKContentView *)self bounds];
      }
      uint64_t v17 = objc_msgSend(MEMORY[0x1E4F42CB0], "regionWithRect:identifier:", @"WKEditablePointerRegion");
      id v18 = v17;
      if (v17) {
        CFRetain(v17);
      }
      uint64_t v19 = self->_lastPointerRegion.m_ptr;
      self->_lastPointerRegion.id m_ptr = v18;
      if (v19) {
        CFRelease(v19);
      }
    }
    if (!self->_pointerInteractionRegionNeedsUpdate)
    {
      self->_pointerInteractionRegionNeedsUpdate = 1;
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3321888768;
      float v24[2] = __65__WKContentView_WKInteraction___updateLastPointerRegionIfNeeded___block_invoke;
      v24[3] = &__block_descriptor_56_e8_32c79_ZTSKZ65__WKContentView_WKInteraction___updateLastPointerRegionIfNeeded__E4__98_e6320_v648__0_InteractionInformationAtPosition__InteractionInformationRequest__IntPoint_ii_BBBBBBB_B_optional_BOOL_____cB_B_CBBBBBBBBBBBBB_Markable_WebCore::ProcessQualified_WTF::ObjectIdentifierGeneric_WebCore::ScrollingNodeIDType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::Yes____WebCore::ProcessQualified_WTF::ObjectIdentifierGeneric_WebCore::ScrollingNodeIDType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::Yes__::MarkableTraits___ProcessQualified_WTF::ObjectIdentifierGeneric_WebCore::ScrollingNodeIDType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::Yes____ObjectIdentifierGeneric_WebCore::ScrollingNodeIDType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::Yes__Q__ObjectIdentifierGeneric_WebCore::ProcessIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::Yes__Q___BBBBBB_FloatPoint_ff__URL__String__RefPtr_WTF::StringImpl__WTF::RawPtrTraits_WTF::StringImpl___WTF::DefaultRefDerefTraits_WTF::StringImpl_____StringImpl___b1b1b1b3b26IIIIIII__URL__String__RefPtr_WTF::StringImpl__WTF::RawPtrTraits_WTF::StringImpl___WTF::DefaultRefDerefTraits_WTF::StringImpl_____StringImpl___b1b1b1b3b26IIIIIII__String__RefPtr_WTF::StringImpl__WTF::RawPtrTraits_WTF::StringImpl___WTF::DefaultRefDerefTraits_WTF::StringImpl_____StringImpl____String__RefPtr_WTF::StringImpl__WTF::RawPtrTraits_WTF::StringImpl___WTF::DefaultRefDerefTraits_WTF::StringImpl_____StringImpl____String__RefPtr_WTF::StringImpl__WTF::RawPtrTraits_WTF::StringImpl___WTF::DefaultRefDerefTraits_WTF::StringImpl_____StringImpl____IntRect__IntPoint_ii__IntSize_ii___RefPtr_WebCore::ShareableBitmap__WTF::RawPtrTraits_WebCore::ShareableBitmap___WTF::DefaultRefDerefTraits_WebCore::ShareableBitmap_____ShareableBitmap___String__RefPtr_WTF::StringImpl__WTF::RawPtrTraits_WTF::StringImpl___WTF::DefaultRefDerefTraits_WTF::StringImpl_____StringImpl____String__RefPtr_WTF::StringImpl__WTF::RawPtrTraits_WTF::StringImpl___WTF::DefaultRefDerefTraits_WTF::StringImpl_____StringImpl___f_FloatRect__FloatPoint_ff__FloatSize_ff___optional_WebCore::Cursor_____c_Cursor_C_RefPtr_WebCore::Image__WTF::RawPtrTraits_WebCore::Image___WTF::DefaultRefDerefTraits_WebCore::Image_____Image___IntPoint_ii__v__B__TextIndicatorData__FloatRect__FloatPoint_ff__FloatSize_ff___FloatRect__FloatPoint_ff__FloatSize_ff___FloatRect__FloatPoint_ff__FloatSize_ff___Vector_WebCore::FloatRect__0UL__WTF::CrashOnOverflow__16UL__WTF::FastMalloc____FloatRect_II_f_RefPtr_WebCore::Image__WTF::RawPtrTraits_WebCore::Image___WTF::DefaultRefDerefTraits_WebCore::Image_____Image___RefPtr_WebCore::Image__WTF::RawPtrTraits_WebCore::Image___WTF::DefaultRefDerefTraits_WebCore::Image_____Image___RefPtr_WebCore::Image__WTF::RawPtrTraits_WebCore::Image___WTF::DefaultRefDerefTraits_WebCore::Image_____Image___Color_Q_C_OptionSet_WebCore::TextIndicatorOption__S___String__RefPtr_WTF::StringImpl__WTF::RawPtrTraits_WTF::StringImpl___WTF::DefaultRefDerefTraits_WTF::StringImpl_____StringImpl____RetainPtr_NSArray___v__IntRect__IntPoint_ii__IntSize_ii___optional_WebCore::ElementContext_____c_ElementContext__FloatRect__FloatPoint_ff__FloatSize_ff___Markable_WTF::ObjectIdentifierGeneric_WebCore::PageIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No___WTF::ObjectIdentifierGeneric_WebCore::PageIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No_::MarkableTraits___ObjectIdentifierGeneric_WebCore::PageIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No__Q___ProcessQualified_WTF::UUID___UUID_T__ObjectIdentifierGeneric_WebCore::ProcessIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::Yes__Q___Markable_WTF::ObjectIdentifierGeneric_WebCore::ElementIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No___WTF::ObjectIdentifierGeneric_WebCore::ElementIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No_::MarkableTraits___ObjectIdentifierGeneric_WebCore::ElementIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No__Q____B__optional_WebCore::ElementContext_____c_ElementContext__FloatRect__FloatPoint_ff__FloatSize_ff___Markable_WTF::ObjectIdentifierGeneric_WebCore::PageIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No___WTF::ObjectIdentifierGeneric_WebCore::PageIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No_::MarkableTraits___ObjectIdentifierGeneric_WebCore::PageIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No__Q___ProcessQualified_WTF::UUID___UUID_T__ObjectIdentifierGeneric_WebCore::ProcessIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::Yes__Q___Markable_WTF::ObjectIdentifierGeneric_WebCore::ElementIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No___WTF::ObjectIdentifierGeneric_WebCore::ElementIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No_::MarkableTraits___ObjectIdentifierGeneric_WebCore::ElementIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No__Q____B__Vector_WebCore::ElementAnimationContext__0UL__WTF::CrashOnOverflow__16UL__WTF::FastMalloc____ElementAnimationContext_II__8l;
      id location = 0;
      objc_initWeak(&location, self);
      [a3 location];
      *(void *)&long long v23 = v20;
      *((void *)&v23 + 1) = v21;
      id v25 = 0;
      objc_copyWeak(&v25, &location);
      long long v26 = v23;
      -[WKContentView doAfterPositionInformationUpdate:forRequest:](self, "doAfterPositionInformationUpdate:forRequest:", v24, v28, v29);
      objc_destroyWeak(&location);
      objc_destroyWeak(&v25);
    }
  }
}

void __65__WKContentView_WKInteraction___updateLastPointerRegionIfNeeded___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    WeakRetained[704] = 0;
    uint64_t v6 = (const void *)objc_msgSend(WeakRetained, "pointerRegionForPositionInformation:point:", a2, *(double *)(a1 + 40), *(double *)(a1 + 48));
    float v7 = v6;
    if (v6) {
      CFRetain(v6);
    }
    uint64_t v8 = (const void *)*((void *)v5 + 87);
    *((void *)v5 + 87) = v7;
    if (v8) {
      CFRelease(v8);
    }
    [*((id *)v5 + 86) invalidate];
    CFRelease(v5);
  }
}

- (id)pointerRegionForPositionInformation:(const void *)a3 point:(CGPoint)a4
{
  CGPoint v18 = a4;
  v14[0] = WebCore::enclosingIntRect((WebCore *)((char *)a3 + 220), (const FloatRect *)a2);
  v14[1] = v6;
  WebCore::FloatRect::FloatRect((WebCore::FloatRect *)v15, (const WebCore::IntRect *)v14);
  float v16 = v16 + -10.0;
  float v17 = (float)(v17 + 10.0) + 10.0;
  if (!*((unsigned char *)a3 + 272)) {
    goto LABEL_8;
  }
  int v7 = *((unsigned __int8 *)a3 + 240);
  if (v7 != 3)
  {
    if (v7 == 4)
    {
      WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v14, &v18);
      if (WebCore::FloatRect::contains())
      {
        uint64_t v8 = (void *)MEMORY[0x1E4F42CB0];
        WebCore::FloatRect::operator CGRect();
        goto LABEL_7;
      }
    }
LABEL_8:
    if (objc_msgSend(-[WKContentView webView](self, "webView"), "_isEditable"))
    {
      WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v14, &v18);
      int v11 = WebCore::FloatRect::contains();
      unint64_t v12 = (void *)MEMORY[0x1E4F42CB0];
      if (!v11)
      {
        [(WKContentView *)self bounds];
        uint64_t v9 = @"WKEditablePointerRegion";
        goto LABEL_14;
      }
      WebCore::FloatRect::operator CGRect();
    }
    else
    {
      unint64_t v12 = (void *)MEMORY[0x1E4F42CB0];
      [(WKContentView *)self bounds];
    }
    uint64_t v9 = @"WKPointerRegion";
LABEL_14:
    float v10 = v12;
    return (id)objc_msgSend(v10, "regionWithRect:identifier:", v9);
  }
  uint64_t v8 = (void *)MEMORY[0x1E4F42CB0];
  WebCore::IntRect::operator CGRect();
LABEL_7:
  uint64_t v9 = @"WKPointerRegion";
  float v10 = v8;
  return (id)objc_msgSend(v10, "regionWithRect:identifier:", v9);
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  [(WKContentView *)self _contentZoomScale];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  unint64_t v12 = __66__WKContentView_WKInteraction__pointerInteraction_styleForRegion___block_invoke;
  id v13 = &unk_1E5813FA8;
  uint64_t v16 = v6;
  uint64_t v14 = self;
  id v15 = a4;
  int v7 = objc_msgSend(-[WKContentView webView](self, "webView"), "_isEditable");
  p_positionInformation = &self->_positionInformation;
  if (v7)
  {
    if (!p_positionInformation->shouldNotUseIBeamInEditableContent) {
      return (id)v12((uint64_t)v11);
    }
    return (id)[MEMORY[0x1E4F42CC0] systemPointerStyle];
  }
  if (!p_positionInformation->cursor.__engaged_) {
    return (id)[MEMORY[0x1E4F42CC0] systemPointerStyle];
  }
  id result = (id)objc_msgSend((id)objc_msgSend(a4, "identifier"), "isEqual:", @"WKPointerRegion");
  if (!result) {
    return (id)[MEMORY[0x1E4F42CC0] systemPointerStyle];
  }
  if (p_positionInformation->cursor.__engaged_)
  {
    if (p_positionInformation->cursor.var0.__null_state_ == 4)
    {
      WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)&v10, &p_positionInformation->request.point);
      if (WebCore::FloatRect::contains()) {
        return (id)v12((uint64_t)v11);
      }
    }
    return (id)[MEMORY[0x1E4F42CC0] systemPointerStyle];
  }
  __break(1u);
  return result;
}

uint64_t __66__WKContentView_WKInteraction__pointerInteraction_styleForRegion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  float v3 = *(float *)(v2 + 1736);
  double v4 = *(double *)(a1 + 48);
  int v5 = *(unsigned __int8 *)(v2 + 1581);
  [*(id *)(a1 + 40) rect];
  if (v5)
  {
    double Width = CGRectGetWidth(*(CGRect *)&v6);
    uint64_t v11 = 1;
  }
  else
  {
    double Width = CGRectGetHeight(*(CGRect *)&v6);
    uint64_t v11 = 2;
  }
  float v12 = v4 * v3;
  int v13 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "identifier"), "isEqual:", @"WKEditablePointerRegion");
  if (v12 > 100.0) {
    int v14 = 1;
  }
  else {
    int v14 = v13;
  }
  if (Width > 100.0) {
    int v14 = 1;
  }
  if (v14) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = v11;
  }
  uint64_t v16 = (void *)MEMORY[0x1E4F42CC0];
  uint64_t v17 = [MEMORY[0x1E4F42CB8] beamWithPreferredLength:v11 axis:v12];

  return [v16 styleWithShape:v17 constrainedAxes:v15];
}

- (void)cleanUpScribbleInteraction
{
  [(WKContentView *)self removeInteraction:self->_scribbleInteraction.m_ptr];
  id m_ptr = self->_scribbleInteraction.m_ptr;
  self->_scribbleInteraction.id m_ptr = 0;
  if (m_ptr)
  {
    CFRelease(m_ptr);
  }
}

- (id)_textInputContextByScribbleIdentifier:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v5 = *(void *)([a3 _textInputContext] + 16);
  if (v5 != *(void *)(*((void *)self->_page.m_ptr + 4) + 1928) || v5 == 0) {
    return 0;
  }
  else {
    return a3;
  }
}

- (BOOL)_elementForTextInputContextIsFocused:(id)a3
{
  BOOL v5 = [(WKContentView *)self _hasFocusedElement];
  if (!a3 || !v5) {
    return 0;
  }
  uint64_t v6 = (WebCore::ElementContext *)[a3 _textInputContext];

  return WebCore::ElementContext::isSameElement(v6, &self->_focusedElementInformation.elementContext);
}

- (void)indirectScribbleInteraction:(id)a3 requestElementsInRect:(CGRect)a4 completion:(id)a5
{
}

- (BOOL)indirectScribbleInteraction:(id)a3 isElementFocused:(id)a4
{
  id v5 = [(WKContentView *)self _textInputContextByScribbleIdentifier:a4];

  return [(WKContentView *)self _elementForTextInputContextIsFocused:v5];
}

- (void)indirectScribbleInteraction:(id)a3 focusElementIfNeeded:(id)a4 referencePoint:(CGPoint)a5 completion:(id)a6
{
  double y = a5.y;
  double x = a5.x;
  id v10 = [(WKContentView *)self _textInputContextByScribbleIdentifier:a4];
  if (v10)
  {
    -[WKContentView _focusTextInputContext:placeCaretAt:completionHandler:](self, "_focusTextInputContext:placeCaretAt:completionHandler:", v10, a6, x, y);
  }
  else
  {
    uint64_t v11 = (void (*)(id, void))*((void *)a6 + 2);
    v11(a6, 0);
  }
}

- (CGRect)indirectScribbleInteraction:(id)a3 frameForElement:(id)a4
{
  id v4 = [(WKContentView *)self _textInputContextByScribbleIdentifier:a4];
  if (v4)
  {
    [v4 boundingRect];
  }
  else
  {
    double v5 = *MEMORY[0x1E4F1DB20];
    double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.double y = v6;
  result.origin.double x = v5;
  return result;
}

- (void)indirectScribbleInteraction:(id)a3 willBeginWritingInElement:(id)a4
{
  id v5 = [(WKContentView *)self _textInputContextByScribbleIdentifier:a4];
  if (v5)
  {
    [(WKContentView *)self _willBeginTextInteractionInTextInputContext:v5];
  }
}

- (void)indirectScribbleInteraction:(id)a3 didFinishWritingInElement:(id)a4
{
  id v5 = [(WKContentView *)self _textInputContextByScribbleIdentifier:a4];
  if (v5)
  {
    [(WKContentView *)self _didFinishTextInteractionInTextInputContext:v5];
  }
}

- (void)_writePromisedAttachmentToPasteboard:(void *)a3
{
  id v4 = self;
  WebKit::WebPageProxy::attachmentForIdentifier(self->_page.m_ptr, (WTF::StringImpl **)a3, (const WTF::StringImpl *)a3, &v32);
  id v5 = v32;
  if (!v32) {
    return;
  }
  API::Attachment::utiType(v32, &v31);
  if (v31)
  {
    double v7 = (__CFString *)WTF::StringImpl::operator NSString *();
    double v8 = v31;
    id v31 = 0;
    if (v8)
    {
      if (*(_DWORD *)v8 == 2) {
        WTF::StringImpl::destroy(v8, v6);
      }
      else {
        *(_DWORD *)v8 -= 2;
      }
    }
  }
  else
  {
    double v7 = &stru_1EEA10550;
  }
  if (![(__CFString *)v7 length] || API::Attachment::isEmpty((atomic_uchar *)v5))
  {
    id v9 = 0;
LABEL_36:
    CFRelease(*((CFTypeRef *)v5 + 1));
    if (v9)
    {
      uint64_t v20 = (void *)MEMORY[0x1E4F42C50];
      uint64_t v21 = objc_msgSend(objc_loadWeak(&v4->_webView.m_weakReference), "_effectiveDataOwner:", -[WKContentView _dataOwnerForCopy](v4, "_dataOwnerForCopy"));
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3321888768;
      _OWORD v25[2] = __69__WKContentView_WKInteraction___writePromisedAttachmentToPasteboard___block_invoke;
      v25[3] = &__block_descriptor_40_e8_32c38_ZTSN3WTF9RetainPtrI14NSItemProviderEE_e5_v8__0l;
      CFTypeRef v26 = v9;
      CFRetain(v9);
      [v20 _performAsDataOwner:v21 block:v25];
      CFTypeRef v22 = v26;
      CFTypeRef v26 = 0;
      if (v22) {
        CFRelease(v22);
      }
      CFRelease(v9);
    }
    return;
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F28D78]);
  [v9 setPreferredPresentationStyle:2];
  API::Attachment::fileName(v5, (uint64_t)&v31);
  if (v31)
  {
    uint64_t v11 = (__CFString *)WTF::StringImpl::operator NSString *();
    float v12 = v31;
    id v31 = 0;
    if (v12)
    {
      if (*(_DWORD *)v12 == 2) {
        WTF::StringImpl::destroy(v12, v10);
      }
      else {
        *(_DWORD *)v12 -= 2;
      }
    }
  }
  else
  {
    uint64_t v11 = &stru_1EEA10550;
  }
  if ([(__CFString *)v11 length]) {
    [v9 setSuggestedName:v11];
  }
  if (!*((_DWORD *)a3 + 5))
  {
LABEL_34:
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3321888768;
    float v27[2] = ___ZL18createItemProviderRKN6WebKit12WebPageProxyERKN7WebCore22PromisedAttachmentInfoE_block_invoke_2998;
    v27[3] = &__block_descriptor_40_e8_32c93_ZTSKZL18createItemProviderRKN6WebKit12WebPageProxyERKN7WebCore22PromisedAttachmentInfoEE3__0_e45___NSProgress_16__0___v____NSData___NSError__8l;
    CFRetain(*((CFTypeRef *)v5 + 1));
    CFRetain(*((CFTypeRef *)v5 + 1));
    id v4 = v24;
    uint64_t v28 = v5;
    [v9 registerDataRepresentationForTypeIdentifier:v23 visibility:0 loadHandler:v27];
    CFRelease(*((CFTypeRef *)v5 + 1));
    uint64_t v19 = v28;
    uint64_t v28 = 0;
    if (v19) {
      CFRelease(*((CFTypeRef *)v19 + 1));
    }
    goto LABEL_36;
  }
  uint64_t v13 = 0;
  unint64_t v14 = 0;
  while (1)
  {
    WebCore::SharedBuffer::createNSData((uint64_t *)&v31, *(WebCore::SharedBuffer **)(*((void *)a3 + 1) + v13 + 8));
    if (v14 >= *((unsigned int *)a3 + 5)) {
      break;
    }
    if (*(void *)(*((void *)a3 + 1) + v13)) {
      uint64_t v15 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v15 = &stru_1EEA10550;
    }
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3321888768;
    _OWORD v29[2] = ___ZL18createItemProviderRKN6WebKit12WebPageProxyERKN7WebCore22PromisedAttachmentInfoE_block_invoke;
    v29[3] = &__block_descriptor_40_e8_32c93_ZTSKZL18createItemProviderRKN6WebKit12WebPageProxyERKN7WebCore22PromisedAttachmentInfoEE3__1_e45___NSProgress_16__0___v____NSData___NSError__8l;
    uint64_t v16 = v31;
    if (v31)
    {
      CFRetain(v31);
      CFTypeRef cf = v16;
      CFRetain(v16);
    }
    else
    {
      CFTypeRef cf = 0;
    }
    [v9 registerDataRepresentationForTypeIdentifier:v15 visibility:0 loadHandler:v29];
    if (v16) {
      CFRelease(v16);
    }
    CFTypeRef v17 = cf;
    CFTypeRef cf = 0;
    if (v17) {
      CFRelease(v17);
    }
    CGPoint v18 = v31;
    id v31 = 0;
    if (v18) {
      CFRelease(v18);
    }
    ++v14;
    v13 += 16;
    if (v14 >= *((unsigned int *)a3 + 5)) {
      goto LABEL_34;
    }
  }
  __break(0xC471u);
}

uint64_t __69__WKContentView_WKInteraction___writePromisedAttachmentToPasteboard___block_invoke(uint64_t a1)
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = *(void *)(a1 + 32);
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42C50], "generalPasteboard"), "setItemProviders:", v1);
}

- (void)_endImageAnalysisGestureDeferral:(BOOL)a3
{
}

- (void)_doAfterPendingImageAnalysis:(id)a3
{
  if ([(WKContentView *)self hasPendingImageAnalysisRequest])
  {
    id v5 = &self->_anon_e70[16];
    double v6 = _Block_copy(a3);
    uint64_t v15 = v6;
    uint64_t v7 = *((unsigned int *)v5 + 3);
    if (v7 == *((_DWORD *)v5 + 2))
    {
      double v8 = (uint64_t *)WTF::Vector<WTF::BlockPtr<void ()(WebKit::ProceedWithTextSelectionInImage)>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)v5, v7 + 1, (unint64_t)&v15);
      uint64_t v9 = *((unsigned int *)v5 + 3);
      uint64_t v7 = *(void *)v5;
      uint64_t v10 = *v8;
      *double v8 = 0;
      *(void *)(v7 + 8 * v9) = v10;
      LODWORD(v7) = *((_DWORD *)v5 + 3);
      uint64_t v11 = v15;
    }
    else
    {
      uint64_t v13 = v6;
      uint64_t v11 = 0;
      uint64_t v14 = *(void *)v5;
      uint64_t v15 = 0;
      *(void *)(v14 + 8 * v7) = v13;
    }
    *((_DWORD *)v5 + 3) = v7 + 1;
    _Block_release(v11);
  }
  else
  {
    float v12 = (void (*)(id, void))*((void *)a3 + 2);
    v12(a3, 0);
  }
}

- (void)_invokeAllActionsToPerformAfterPendingImageAnalysis:(BOOL)a3
{
  BOOL v3 = a3;
  if (LOBYTE(self->_editDropCaretAnimator.m_ptr)) {
    LOBYTE(self->_editDropCaretAnimator.m_ptr) = 0;
  }
  if (self->_anon_e70[0]) {
    self->_anon_e70[0] = 0;
  }
  id v4 = *(const void ***)&self->_anon_e70[16];
  uint64_t v10 = v4;
  uint64_t v5 = *(unsigned int *)&self->_anon_e70[28];
  int v11 = *(_DWORD *)&self->_anon_e70[24];
  int v12 = v5;
  v9[0] = 0;
  *(void *)&self->_anon_e70[16] = 0;
  v9[1] = 0;
  *(void *)&self->_anon_e70[24] = 0;
  WTF::Vector<WTF::BlockPtr<void ()(void)>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v9, (void *)a2);
  if (v5)
  {
    uint64_t v7 = 8 * v5;
    do
    {
      double v8 = (void (**)(void *, BOOL))_Block_copy(*v4);
      v8[2](v8, v3);
      _Block_release(v8);
      ++v4;
      v7 -= 8;
    }
    while (v7);
  }
  WTF::Vector<WTF::BlockPtr<void ()(void)>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v10, v6);
}

- (void)setUpTextIndicator:()Ref<WebCore:()WTF:(WTF::DefaultRefDerefTraits<WebCore::TextIndicator>>)a3 :RawPtrTraits<WebCore::TextIndicator> :TextIndicator
{
  if (self->_textIndicator.m_ptr != *(TextIndicator **)a3.var0)
  {
    [(WKContentView *)self teardownTextIndicatorLayer];
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_startFadeOut object:0];
    uint64_t v5 = *(TextIndicator **)a3.var0;
    if (*(void *)a3.var0) {
      ++*(_DWORD *)v5;
    }
    id m_ptr = self->_textIndicator.m_ptr;
    self->_textIndicator.id m_ptr = v5;
    if (m_ptr)
    {
      WTF::RefCounted<WebCore::TextIndicator>::deref((WebCore::TextIndicator *)m_ptr);
      uint64_t v5 = self->_textIndicator.m_ptr;
    }
    long long v18 = *(_OWORD *)((char *)v5 + 24);
    WebCore::FloatRect::operator CGRect();
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    id v15 = objc_alloc(MEMORY[0x1E4FB61F8]);
    uint64_t v16 = objc_msgSend(v15, "initWithFrame:textIndicator:margin:offset:", *(void *)a3.var0, v8, v10, v12, v14, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8), *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v18);
    CFTypeRef v17 = self->_textIndicatorLayer.m_ptr;
    self->_textIndicatorLayer.id m_ptr = v16;
    if (v17) {
      CFRelease(v17);
    }
    objc_msgSend((id)-[WKContentView layer](self, "layer"), "addSublayer:", self->_textIndicatorLayer.m_ptr);
    if (*((unsigned char *)self->_textIndicator.m_ptr + 112)) {
      [self->_textIndicatorLayer.m_ptr present];
    }
    [(WKContentView *)self performSelector:sel_startFadeOut withObject:self afterDelay:0.32];
  }
}

- (void)clearTextIndicator:(unsigned __int8)a3
{
  int v3 = a3;
  id m_ptr = self->_textIndicator.m_ptr;
  self->_textIndicator.id m_ptr = 0;
  if ([self->_textIndicatorLayer.m_ptr isFadingOut])
  {
LABEL_9:
    if (!m_ptr) {
      return;
    }
    goto LABEL_10;
  }
  if (!m_ptr || ![self->_textIndicatorLayer.m_ptr indicatorWantsManualAnimation:m_ptr]) {
    goto LABEL_8;
  }
  int v6 = [self->_textIndicatorLayer.m_ptr hasCompletedAnimation] ^ 1;
  if (v3 != 1) {
    LOBYTE(v6) = 1;
  }
  if (v6)
  {
LABEL_8:
    [(WKContentView *)self teardownTextIndicatorLayer];
    goto LABEL_9;
  }
  [(WKContentView *)self startFadeOut];
LABEL_10:

  WTF::RefCounted<WebCore::TextIndicator>::deref((WebCore::TextIndicator *)m_ptr);
}

- (void)setTextIndicatorAnimationProgress:(float)a3
{
  if (self->_textIndicator.m_ptr) {
    objc_msgSend(self->_textIndicatorLayer.m_ptr, "setAnimationProgress:");
  }
}

- (void)teardownTextIndicatorLayer
{
  [self->_textIndicatorLayer.m_ptr removeFromSuperlayer];
  id m_ptr = self->_textIndicatorLayer.m_ptr;
  self->_textIndicatorLayer.id m_ptr = 0;
  if (m_ptr)
  {
    CFRelease(m_ptr);
  }
}

- (void)startFadeOut
{
  [self->_textIndicatorLayer.m_ptr setFadingOut:1];
  id m_ptr = self->_textIndicatorLayer.m_ptr;
  id v4 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3321888768;
  _DWORD v5[2] = __44__WKContentView_WKInteraction__startFadeOut__block_invoke;
  v5[3] = &__block_descriptor_40_e8_32c58_ZTSKZ44__WKContentView_WKInteraction__startFadeOut_E4__99_e5_v8__0l;
  objc_initWeak(&v4, self);
  id v6 = 0;
  objc_copyWeak(&v6, &v4);
  [m_ptr hideWithCompletionHandler:v5];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&v6);
}

void __44__WKContentView_WKInteraction__startFadeOut__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained teardownTextIndicatorLayer];
  if (WeakRetained)
  {
    CFRelease(WeakRetained);
  }
}

- (void)find:(id)a3
{
  id v4 = [(WKContentView *)self webView];

  [v4 find:a3];
}

- (void)findAndReplace:(id)a3
{
  id v4 = [(WKContentView *)self webView];

  [v4 findAndReplace:a3];
}

- (void)findNext:(id)a3
{
  id v4 = [(WKContentView *)self webView];

  [v4 findNext:a3];
}

- (void)findPrevious:(id)a3
{
  id v4 = [(WKContentView *)self webView];

  [v4 findPrevious:a3];
}

- (void)useSelectionForFindForWebView:(id)a3
{
  if (*(unsigned char *)(*((void *)self->_page.m_ptr + 4) + 250))
  {
    id v4 = [(WKContentView *)self selectedText];
    if ([v4 length])
    {
      objc_msgSend((id)objc_msgSend(-[WKContentView webView](self, "webView"), "findInteraction"), "setSearchText:", v4);
      uint64_t v5 = (void *)MEMORY[0x1E4F42A10];
      [v5 _setGlobalFindBuffer:v4];
    }
  }
}

- (void)_findSelectedForWebView:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([(WKContentView *)self shouldUseAsyncInteractions])
  {
    uint64_t v5 = qword_1EB3586B8;
    if (os_log_type_enabled((os_log_t)qword_1EB3586B8, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315138;
      double v7 = "-[WKContentView(WKInteraction) _findSelectedForWebView:]";
      _os_log_error_impl(&dword_1985F2000, v5, OS_LOG_TYPE_ERROR, "Received unexpected call to %s", (uint8_t *)&v6, 0xCu);
    }
    __break(0xC471u);
    JUMPOUT(0x19945D694);
  }

  [(WKContentView *)self findSelectedForWebView:a3];
}

- (void)findSelectedForWebView:(id)a3
{
  -[WKContentView useSelectionForFindForWebView:](self, "useSelectionForFindForWebView:");
  id v5 = [(WKContentView *)self webView];

  [v5 find:a3];
}

- (void)performTextSearchWithQueryString:(id)a3 usingOptions:(id)a4 resultAggregator:(id)a5
{
  uint64_t v9 = [a4 wordMatchMethod];
  __int16 v10 = 1026;
  if (v9 != 2) {
    __int16 v10 = 0;
  }
  if (v9 == 1) {
    __int16 v11 = 2;
  }
  else {
    __int16 v11 = v10;
  }
  char v12 = [a4 stringCompareOptions];
  id m_ptr = self->_page.m_ptr;
  MEMORY[0x19972EAD0](&v19, a3);
  if (a3) {
    CFRetain(a3);
  }
  if (a5) {
    CFRetain(a5);
  }
  double v14 = (void *)WTF::fastMalloc((WTF *)0x18);
  *double v14 = &unk_1EEA0F238;
  v14[1] = a3;
  void v14[2] = a5;
  long long v18 = v14;
  __int16 v22 = v11 & 0xFFFE | v12 & 1;
  int v21 = 1000;
  v20[0] = &v19;
  v20[1] = &v22;
  void v20[2] = &v21;
  WebKit::AuxiliaryProcessProxy::sendWithAsyncReply<Messages::WebPage::FindTextRangesForStringMatches,WTF::CompletionHandler<void ()(WTF::Vector<WebKit::WebFoundTextRange,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc> &&)>>(*((void *)m_ptr + 32), (uint64_t)v20, (uint64_t *)&v18, *(void *)(*((void *)m_ptr + 4) + 1928), 0, 1);
  uint64_t v16 = (uint64_t)v18;
  long long v18 = 0;
  if (v16) {
    (*(void (**)(uint64_t))(*(void *)v16 + 8))(v16);
  }
  CFTypeRef v17 = v19;
  uint64_t v19 = 0;
  if (v17)
  {
    if (*(_DWORD *)v17 == 2) {
      WTF::StringImpl::destroy(v17, v15);
    }
    else {
      *(_DWORD *)v17 -= 2;
    }
  }
}

- (void)replaceFoundTextInRange:(id)a3 inDocument:(id)a4 withText:(id)a5
{
  if ([(WKContentView *)self supportsTextReplacement])
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (a3)
    {
      if (isKindOfClass)
      {
        id m_ptr = self->_page.m_ptr;
        [a3 webFoundTextRange];
        MEMORY[0x19972EAD0](&v13, a5);
        v16[0] = (uint64_t *)&v14;
        v16[1] = (uint64_t *)&v13;
        WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::ReplaceFoundTextRangeWithString>(*((void *)m_ptr + 32), v16, *(void *)(*((void *)m_ptr + 4) + 1928), 0);
        __int16 v11 = v13;
        double v13 = 0;
        if (v11)
        {
          if (*(_DWORD *)v11 == 2) {
            WTF::StringImpl::destroy(v11, v10);
          }
          else {
            *(_DWORD *)v11 -= 2;
          }
        }
        char v12 = v15;
        id v15 = 0;
        if (v12)
        {
          if (*(_DWORD *)v12 == 2) {
            WTF::StringImpl::destroy(v12, v10);
          }
          else {
            *(_DWORD *)v12 -= 2;
          }
        }
      }
    }
  }
}

- (void)decorateFoundTextRange:(id)a3 inDocument:(id)a4 usingStyle:(int64_t)a5
{
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (a3 && (isKindOfClass & 1) != 0)
  {
    if (a5 == 1) {
      char v9 = 1;
    }
    else {
      char v9 = 2 * (a5 == 2);
    }
    id m_ptr = self->_page.m_ptr;
    [a3 webFoundTextRange];
    id v15 = &v13;
    char v16 = v9;
    WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::DecorateTextRangeWithStyle>(*((void *)m_ptr + 32), (uint64_t)&v15, *(void *)(*((void *)m_ptr + 4) + 1928), 0);
    char v12 = v14;
    char v14 = 0;
    if (v12)
    {
      if (*(_DWORD *)v12 == 2) {
        WTF::StringImpl::destroy(v12, v11);
      }
      else {
        *(_DWORD *)v12 -= 2;
      }
    }
  }
}

- (void)scrollRangeToVisible:(id)a3 inDocument:(id)a4
{
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (a3)
  {
    if (isKindOfClass)
    {
      id m_ptr = self->_page.m_ptr;
      [a3 webFoundTextRange];
      char v12 = &v10;
      WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::ScrollTextRangeToVisible>(*((void *)m_ptr + 32), (uint64_t **)&v12, *(void *)(*((void *)m_ptr + 4) + 1928), 0);
      char v9 = v11;
      __int16 v11 = 0;
      if (v9)
      {
        if (*(_DWORD *)v9 == 2) {
          WTF::StringImpl::destroy(v9, v8);
        }
        else {
          *(_DWORD *)v9 -= 2;
        }
      }
    }
  }
}

- (void)clearAllDecoratedFoundText
{
  id m_ptr = self->_page.m_ptr;
  char v3 = 0;
  WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::ClearAllDecoratedFoundText>(*((void *)m_ptr + 32), (uint64_t)&v3, *(void *)(*((void *)m_ptr + 4) + 1928), 0);
}

- (void)didBeginTextSearchOperation
{
  objc_msgSend(-[WKContentView webView](self, "webView"), "_showFindOverlay");
  id m_ptr = self->_page.m_ptr;
  char v4 = 0;
  WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::DidBeginTextSearchOperation>(*((void *)m_ptr + 32), (uint64_t)&v4, *(void *)(*((void *)m_ptr + 4) + 1928), 0);
}

- (void)didEndTextSearchOperation
{
  id v2 = [(WKContentView *)self webView];

  [v2 _hideFindOverlay];
}

- (BOOL)supportsTextReplacement
{
  id v2 = [(WKContentView *)self webView];

  return [v2 supportsTextReplacement];
}

- (BOOL)supportsTextReplacementForWebView
{
  id v2 = [(WKContentView *)self webView];

  return [v2 _isEditable];
}

- (int64_t)compareFoundRange:(id)a3 toRange:(id)a4 inDocument:(id)a5
{
  uint64_t v5 = -[WKContentView offsetFromPosition:toPosition:](self, "offsetFromPosition:toPosition:", [a3 start], objc_msgSend(a4, "start"));
  if (v5 < 0) {
    return -1;
  }
  else {
    return v5 != 0;
  }
}

- (void)requestRectForFoundTextRange:(id)a3 completionHandler:(id)a4
{
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (a3 && (isKindOfClass & 1) != 0)
  {
    id m_ptr = self->_page.m_ptr;
    [a3 webFoundTextRange];
    uint64_t v13 = _Block_copy(a4);
    char v14 = (void *)WTF::fastMalloc((WTF *)0x10);
    *char v14 = &unk_1EEA0F260;
    v14[1] = v13;
    uint64_t v19 = v14;
    __int16 v22 = &v20;
    WebKit::AuxiliaryProcessProxy::sendWithAsyncReply<Messages::WebPage::RequestRectForFoundTextRange,WTF::CompletionHandler<void ()(WebCore::FloatRect)>>(*((void *)m_ptr + 32), (uint64_t **)&v22, (uint64_t *)&v19, *(void *)(*((void *)m_ptr + 4) + 1928), 0, 1);
    uint64_t v15 = (uint64_t)v19;
    uint64_t v19 = 0;
    if (v15) {
      (*(void (**)(uint64_t))(*(void *)v15 + 8))(v15);
    }
    _Block_release(0);
    CFTypeRef v17 = v21;
    int v21 = 0;
    if (v17)
    {
      if (*(_DWORD *)v17 == 2) {
        WTF::StringImpl::destroy(v17, v16);
      }
      else {
        *(_DWORD *)v17 -= 2;
      }
    }
  }
  else
  {
    v8.n128_u64[0] = *MEMORY[0x1E4F1DB28];
    v9.n128_u64[0] = *(void *)(MEMORY[0x1E4F1DB28] + 8);
    long long v18 = (void (*)(id, __n128, __n128, __n128, __n128))*((void *)a4 + 2);
    v10.n128_u64[0] = *(void *)(MEMORY[0x1E4F1DB28] + 16);
    v11.n128_u64[0] = *(void *)(MEMORY[0x1E4F1DB28] + 24);
    v18(a4, v8, v9, v10, v11);
  }
}

- (BOOL)hasSelectableTextForImageContextMenu
{
  WTF::valueOrDefault<std::optional<WebKit::ImageAnalysisContextMenuActionData> &>(&v4, (uint64_t)&self->_cachedVisualSearchPreviewImageBoundsInWindowCoordinates.var0.__val_.size);
  int v2 = v4;
  if (cf) {
    CFRelease(cf);
  }
  if (v5) {
    CFRelease(v5);
  }
  return v2 != 0;
}

- (BOOL)hasVisualSearchResultsForImageContextMenu
{
  WTF::valueOrDefault<std::optional<WebKit::ImageAnalysisContextMenuActionData> &>(&v4, (uint64_t)&self->_cachedVisualSearchPreviewImageBoundsInWindowCoordinates.var0.__val_.size);
  int v2 = BYTE1(v4);
  if (cf) {
    CFRelease(cf);
  }
  if (v5) {
    CFRelease(v5);
  }
  return v2 != 0;
}

- (CGImage)copySubjectResultForImageContextMenu
{
  WTF::valueOrDefault<std::optional<WebKit::ImageAnalysisContextMenuActionData> &>(v4, (uint64_t)&self->_cachedVisualSearchPreviewImageBoundsInWindowCoordinates.var0.__val_.size);
  int v2 = (const void *)v4[1];
  if (v5) {
    CFRelease(v5);
  }
  if (v2) {
    CFRelease(v2);
  }
  return (CGImage *)v2;
}

- (id)machineReadableCodeSubMenuForImageContextMenu
{
  WTF::valueOrDefault<std::optional<WebKit::ImageAnalysisContextMenuActionData> &>(&v4, (uint64_t)&self->_cachedVisualSearchPreviewImageBoundsInWindowCoordinates.var0.__val_.size);
  CFTypeRef v2 = cf;
  if (cf) {
    CFRelease(cf);
  }
  if (v5) {
    CFRelease(v5);
  }
  return (id)v2;
}

- (void)presentVisualSearchPreviewControllerForImage:(id)a3 imageURL:(id)a4 title:(id)a5 imageBounds:(CGRect)a6 appearanceActions:(unint64_t)a7
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  char v16 = objc_msgSend(objc_alloc((Class)((uint64_t (*)(WKContentView *, SEL))*MEMORY[0x1E4FB6358])(self, a2)), "init");
  m_buffer = self->_actionsToPerformAfterPendingImageAnalysis.m_buffer;
  self->_actionsToPerformAfterPendingImageAnalysis.m_buffer = v16;
  if (m_buffer)
  {
    CFRelease(m_buffer);
    char v16 = self->_actionsToPerformAfterPendingImageAnalysis.m_buffer;
  }
  [v16 setDelegate:self];
  [self->_actionsToPerformAfterPendingImageAnalysis.m_buffer setDataSource:self];
  [self->_actionsToPerformAfterPendingImageAnalysis.m_buffer setAppearanceActions:a7];
  [self->_actionsToPerformAfterPendingImageAnalysis.m_buffer setModalPresentationStyle:5];
  if (a3) {
    CFRetain(a3);
  }
  long long v18 = *(const void **)&self->_actionsToPerformAfterPendingImageAnalysis.m_capacity;
  *(void *)&self->_actionsToPerformAfterPendingImageAnalysis.m_capacitCGFloat y = a3;
  if (v18) {
    CFRelease(v18);
  }
  if (a5) {
    CFRetain(a5);
  }
  id m_ptr = self->_imageAnalyzer.m_ptr;
  self->_imageAnalyzer.id m_ptr = a5;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  if (a4) {
    CFRetain(a4);
  }
  char v20 = *(const void **)&self->_isProceedingWithTextSelectionInImage;
  *(void *)&self->_isProceedingWithTextSelectionInImage = a4;
  if (v20) {
    CFRelease(v20);
  }
  *(CGFloat *)&self->_visualSearchPreviewController.id m_ptr = x;
  *(CGFloat *)&self->_visualSearchPreviewImage.id m_ptr = y;
  *(CGFloat *)&self->_visualSearchPreviewImageURL.id m_ptr = width;
  *(CGFloat *)&self->_visualSearchPreviewTitle.id m_ptr = height;
  int v21 = [(UIView *)self _wk_viewControllerForFullScreenPresentation];
  __int16 v22 = self->_actionsToPerformAfterPendingImageAnalysis.m_buffer;

  [(UIViewController *)v21 presentViewController:v22 animated:1 completion:0];
}

- (CGRect)previewController:(id)a3 frameForPreviewItem:(id)a4 inSourceView:(id *)a5
{
  *a5 = self;
  id m_ptr = self->_visualSearchPreviewController.m_ptr;
  int v6 = self->_visualSearchPreviewImage.m_ptr;
  double v7 = self->_visualSearchPreviewImageURL.m_ptr;
  __n128 v8 = self->_visualSearchPreviewTitle.m_ptr;
  result.size.CGFloat height = *(double *)&v8;
  result.size.CGFloat width = *(double *)&v7;
  result.origin.CGFloat y = *(double *)&v6;
  result.origin.CGFloat x = *(double *)&m_ptr;
  return result;
}

- (id)previewController:(id)a3 transitionImageForPreviewItem:(id)a4 contentRect:(CGRect *)a5
{
  p_visualSearchPreviewImageBounds = &self->_visualSearchPreviewImageBounds;
  if (!self->_cachedVisualSearchPreviewImageBoundsInWindowCoordinates.var0.__null_state_)
  {
    CGPoint v13 = (CGPoint)*MEMORY[0x1E4F1DAD8];
    -[WKContentView convertRect:toView:](self, "convertRect:toView:", 0, a4, *(double *)&self->_visualSearchPreviewController.m_ptr, *(double *)&self->_visualSearchPreviewImage.m_ptr, *(double *)&self->_visualSearchPreviewImageURL.m_ptr, *(double *)&self->_visualSearchPreviewTitle.m_ptr);
    int x_low = LOBYTE(p_visualSearchPreviewImageBounds[1].origin.x);
    p_visualSearchPreviewImageBounds->origin = v13;
    p_visualSearchPreviewImageBounds->size.CGFloat width = v9;
    p_visualSearchPreviewImageBounds->size.CGFloat height = v10;
    if (!x_low) {
      LOBYTE(p_visualSearchPreviewImageBounds[1].origin.x) = 1;
    }
  }
  CGSize size = p_visualSearchPreviewImageBounds->size;
  a5->origin = p_visualSearchPreviewImageBounds->origin;
  a5->CGSize size = size;
  return *(id *)&self->_actionsToPerformAfterPendingImageAnalysis.m_capacity;
}

- (void)previewControllerDidDismiss:(id)a3
{
  m_buffer = self->_actionsToPerformAfterPendingImageAnalysis.m_buffer;
  self->_actionsToPerformAfterPendingImageAnalysis.m_buffer = 0;
  if (m_buffer) {
    CFRelease(m_buffer);
  }
  CFTypeRef v5 = *(const void **)&self->_actionsToPerformAfterPendingImageAnalysis.m_capacity;
  *(void *)&self->_actionsToPerformAfterPendingImageAnalysis.m_capacitCGFloat y = 0;
  if (v5) {
    CFRelease(v5);
  }
  id m_ptr = self->_imageAnalyzer.m_ptr;
  self->_imageAnalyzer.id m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  double v7 = *(const void **)&self->_isProceedingWithTextSelectionInImage;
  *(void *)&self->_isProceedingWithTextSelectionInImage = 0;
  if (v7) {
    CFRelease(v7);
  }
  if (self->_cachedVisualSearchPreviewImageBoundsInWindowCoordinates.var0.__null_state_) {
    self->_cachedVisualSearchPreviewImageBoundsInWindowCoordinates.var0.__null_state_ = 0;
  }
}

- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3
{
  return 1;
}

- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4
{
  CFTypeRef v5 = objc_msgSend(objc_alloc((Class)((uint64_t (*)(WKContentView *, SEL, id, int64_t))*MEMORY[0x1E4FB6250])(self, a2, a3, a4)), "initWithDataProvider:contentType:previewTitle:", self, objc_msgSend((id)*MEMORY[0x1E4F444E0], "identifier"), self->_imageAnalyzer.m_ptr);
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return (id)(id)CFMakeCollectable(v5);
  }
  int v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
  double v7 = v6;
  uint64_t v8 = *(void *)&self->_isProceedingWithTextSelectionInImage;
  if (v8) {
    [v6 setObject:v8 forKey:@"imageURL"];
  }
  WebKit::WebPageProxy::currentURL((WebKit::WebPageProxy *)self->_page.m_ptr, (uint64_t *)&v13);
  MEMORY[0x19972E890](&v14, &v13, 0);
  CGFloat v10 = v13;
  CGPoint v13 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2) {
      WTF::StringImpl::destroy(v10, v9);
    }
    else {
      *(_DWORD *)v10 -= 2;
    }
  }
  __n128 v11 = v14;
  if (v14)
  {
    if (*((_DWORD *)v14 + 1))
    {
      objc_msgSend(v7, "setObject:forKey:", WTF::URL::operator NSURL *(), @"pageURL", v13);
      __n128 v11 = v14;
      char v14 = 0;
      if (!v11) {
        goto LABEL_16;
      }
    }
    else
    {
      char v14 = 0;
    }
    if (*(_DWORD *)v11 == 2) {
      WTF::StringImpl::destroy(v11, v9);
    }
    else {
      *(_DWORD *)v11 -= 2;
    }
  }
LABEL_16:
  if (objc_msgSend(v7, "count", v13, v14)) {
    [v5 setPreviewOptions:v7];
  }
  if (v7) {
    CFRelease(v7);
  }
  return (id)(id)CFMakeCollectable(v5);
}

- (id)provideDataForItem:(id)a3
{
  char v3 = (WebKit *)objc_msgSend(*(id *)&self->_actionsToPerformAfterPendingImageAnalysis.m_capacity, "CGImage", a3);
  WebKit::transcode(v3, (const __CFString *)[(id)*MEMORY[0x1E4F444E0] identifier], (__CFData **)&cf);
  CFTypeRef v4 = cf;
  CFTypeRef cf = 0;
  CFTypeRef v5 = (id)CFMakeCollectable(v4);
  CFTypeRef v6 = cf;
  CFTypeRef cf = 0;
  if (v6) {
    CFRelease(v6);
  }
  return (id)v5;
}

- (BOOL)actionSheetAssistant:(id)a3 shouldIncludeShowTextActionForElement:(id)a4
{
  uint64_t v5 = PAL::VisionKitCoreLibrary((PAL *)1);
  if (v5)
  {
    LOBYTE(v5) = [(WKContentView *)self hasSelectableTextForImageContextMenu];
  }
  return v5;
}

- (void)actionSheetAssistant:(id)a3 showTextForImage:(id)a4 imageURL:(id)a5 title:(id)a6 imageBounds:(CGRect)a7
{
}

- (BOOL)actionSheetAssistant:(id)a3 shouldIncludeLookUpImageActionForElement:(id)a4
{
  uint64_t v5 = PAL::VisionKitCoreLibrary((PAL *)1);
  if (v5)
  {
    LOBYTE(v5) = [(WKContentView *)self hasVisualSearchResultsForImageContextMenu];
  }
  return v5;
}

- (void)actionSheetAssistant:(id)a3 lookUpImage:(id)a4 imageURL:(id)a5 title:(id)a6 imageBounds:(CGRect)a7
{
}

- (id)imageAnalyzer
{
  id result = *(id *)&self->_anon_e70[40];
  if (!result)
  {
    id result = (id)objc_msgSend(objc_alloc((Class)((uint64_t (*)(void, SEL))*MEMORY[0x1E4FB6320])(0, a2)), "init");
    CFTypeRef v4 = *(const void **)&self->_anon_e70[40];
    *(void *)&self->_anon_e70[40] = result;
    if (v4)
    {
      CFRelease(v4);
      return *(id *)&self->_anon_e70[40];
    }
  }
  return result;
}

- (BOOL)hasPendingImageAnalysisRequest
{
  return (BOOL)self->_editDropCaretAnimator.m_ptr;
}

- (void)_tearDownImageAnalysis
{
  if (PAL::VisionKitCoreLibrary((PAL *)1))
  {
    [self->_actionToPerformAfterReceivingEditDragSnapshot.m_block setDelegate:0];
    [(WKContentView *)self removeGestureRecognizer:self->_actionToPerformAfterReceivingEditDragSnapshot.m_block];
    id m_block = self->_actionToPerformAfterReceivingEditDragSnapshot.m_block;
    self->_actionToPerformAfterReceivingEditDragSnapshot.id m_block = 0;
    if (m_block) {
      CFRelease(m_block);
    }
    if (LOBYTE(self->_editDropCaretAnimator.m_ptr)) {
      LOBYTE(self->_editDropCaretAnimator.m_ptr) = 0;
    }
    self->_anon_e70[32] = 0;
    if (self->_anon_e70[0]) {
      self->_anon_e70[0] = 0;
    }
    CFTypeRef v4 = *(void **)&self->_anon_e70[40];
    *(void *)&self->_anon_e70[40] = 0;
    [v4 cancelAllRequests];
    if (v4) {
      CFRelease(v4);
    }
    [(WKContentView *)self _invokeAllActionsToPerformAfterPendingImageAnalysis:0];
    [(WKContentView *)self uninstallImageAnalysisInteraction];
    std::__optional_destruct_base<WebKit::RemoveBackgroundData,false>::reset[abi:sn180100]((uint64_t)&self->_imageAnalysisActionButtons, v5);
    LOBYTE(self->_cachedVisualSearchPreviewImageBoundsInWindowCoordinates.var0.__val_.origin.y) = 0;
    std::__optional_destruct_base<WebKit::ImageAnalysisContextMenuActionData,false>::reset[abi:sn180100]((uint64_t)&self->_cachedVisualSearchPreviewImageBoundsInWindowCoordinates.var0.__val_.size);
  }
}

- (void)_cancelImageAnalysis
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [*(id *)&self->_anon_e70[40] cancelAllRequests];
  if ([(WKContentView *)self hasPendingImageAnalysisRequest])
  {
    char v3 = qword_1EB358910;
    if (os_log_type_enabled((os_log_t)qword_1EB358910, OS_LOG_TYPE_DEFAULT))
    {
      if (!LOBYTE(self->_editDropCaretAnimator.m_ptr)) {
        __break(1u);
      }
      id m_ptr = self->_editDropTextCursorView.m_ptr;
      int v5 = 134217984;
      CFTypeRef v6 = m_ptr;
      _os_log_impl(&dword_1985F2000, v3, OS_LOG_TYPE_DEFAULT, "Image analysis request %llu cancelled.", (uint8_t *)&v5, 0xCu);
    }
  }
  if (LOBYTE(self->_editDropCaretAnimator.m_ptr)) {
    LOBYTE(self->_editDropCaretAnimator.m_ptr) = 0;
  }
  self->_anon_e70[32] = 0;
  if (self->_anon_e70[0]) {
    self->_anon_e70[0] = 0;
  }
}

- (RetainPtr<VKCImageAnalyzerRequest>)createImageAnalyzerRequest:(unint64_t)a3 image:(CGImage *)a4 imageURL:(id)a5
{
  uint64_t v8 = v5;
  CGFloat v9 = objc_msgSend(objc_alloc((Class)((uint64_t (*)(WKContentView *, SEL))*MEMORY[0x1E4FB63B0])(self, a2)), "initWithCGImage:orientation:requestType:", a4, 0, a3);
  *uint64_t v8 = v9;
  [v9 setImageURL:a5];
  CGFloat v10 = (void *)MEMORY[0x1E4F1CB10];
  WebKit::WebPageProxy::currentURL((WebKit::WebPageProxy *)self->_page.m_ptr, (uint64_t *)&v13);
  objc_msgSend(v9, "setPageURL:", objc_msgSend(v10, "_web_URLWithWTFString:", &v13));
  char v12 = v13;
  CGPoint v13 = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2) {
      return (RetainPtr<VKCImageAnalyzerRequest>)WTF::StringImpl::destroy(v12, v11);
    }
    else {
      *(_DWORD *)v12 -= 2;
    }
  }
  return (RetainPtr<VKCImageAnalyzerRequest>)v12;
}

- (RetainPtr<VKCImageAnalyzerRequest>)createImageAnalyzerRequest:(unint64_t)a3 image:(CGImage *)a4
{
  uint64_t v8 = v4;
  uint64_t v9 = WTF::URL::operator NSURL *();
  if (self)
  {
    return (RetainPtr<VKCImageAnalyzerRequest>)[(WKContentView *)self createImageAnalyzerRequest:a3 image:a4 imageURL:v9];
  }
  else
  {
    *uint64_t v8 = 0;
  }
  return (RetainPtr<VKCImageAnalyzerRequest>)v9;
}

- (void)updateImageAnalysisForContextMenuPresentation:(id)a3 elementBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  objc_msgSend(a3, "setPresentingViewControllerForMrcAction:", -[UIView _wk_viewControllerForFullScreenPresentation](self, "_wk_viewControllerForFullScreenPresentation"));
  if (objc_opt_respondsToSelector())
  {
    -[WKContentView convertRect:toView:](self, "convertRect:toView:", objc_msgSend((id)objc_msgSend(a3, "presentingViewControllerForMrcAction"), "viewIfLoaded"), x, y, width, height);
    objc_msgSend(a3, "setRectForMrcActionInPresentingViewController:");
  }
}

- (BOOL)validateImageAnalysisRequestIdentifier:()ObjectIdentifierGeneric<WebKit:()WTF:(unsigned long)long :(WTF::SupportsObjectIdentifierNullState::Yes>)a3 ObjectIdentifierMainThreadAccessTraits<uint64_t> :ImageAnalysisRequestIdentifierType
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (LOBYTE(self->_editDropCaretAnimator.m_ptr)) {
    BOOL v3 = self->_editDropTextCursorView.m_ptr == (void *)a3.m_identifier;
  }
  else {
    BOOL v3 = 0;
  }
  BOOL v4 = v3;
  if (!v3)
  {
    if (![(WKContentView *)self hasPendingImageAnalysisRequest]) {
      [(WKContentView *)self _invokeAllActionsToPerformAfterPendingImageAnalysis:0];
    }
    uint64_t v7 = qword_1EB358910;
    if (os_log_type_enabled((os_log_t)qword_1EB358910, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134217984;
      unint64_t m_identifier = a3.m_identifier;
      _os_log_impl(&dword_1985F2000, v7, OS_LOG_TYPE_DEFAULT, "Image analysis request %llu invalidated.", (uint8_t *)&v9, 0xCu);
    }
  }
  return v4;
}

- (void)requestTextRecognition:(id)a3 imageData:(void *)a4 sourceLanguageIdentifier:(id)a5 targetLanguageIdentifier:(id)a6 completionHandler:(void *)a7
{
  WebCore::ShareableBitmap::create();
  if (v35)
  {
    WebCore::ShareableBitmap::makeCGImage();
    if (v30)
    {
      if ([a6 length])
      {
        char v12 = [(WKContentView *)self imageAnalyzer];
        MEMORY[0x19972EAD0](v31, a5);
        MEMORY[0x19972EAD0](&v29, a6);
        WebKit::requestVisualTranslation(v12, (uint64_t)a3, (WTF::StringImpl **)v31, &v29, (uint64_t)v30, (uint64_t *)a7);
        char v14 = v29;
        uint64_t v29 = 0;
        if (v14)
        {
          if (*(_DWORD *)v14 == 2) {
            WTF::StringImpl::destroy(v14, v13);
          }
          else {
            *(_DWORD *)v14 -= 2;
          }
        }
        int v21 = (WTF::StringImpl *)v31[0];
        v31[0] = 0;
        if (v21)
        {
          if (*(_DWORD *)v21 == 2) {
            WTF::StringImpl::destroy(v21, v13);
          }
          else {
            *(_DWORD *)v21 -= 2;
          }
        }
      }
      else
      {
        if (self) {
          [(WKContentView *)self createImageAnalyzerRequest:1 image:v30];
        }
        else {
          v31[0] = 0;
        }
        id v22 = [(WKContentView *)self imageAnalyzer];
        CFTypeRef v23 = v31[0];
        uint64_t v24 = *(void *)a7;
        *(void *)a7 = 0;
        id v25 = malloc_type_malloc(0x28uLL, 0x10E004053C0834CuLL);
        *id v25 = MEMORY[0x1E4F14398];
        v25[1] = 50331650;
        _OWORD v25[2] = WTF::BlockPtr<void ()(VKCImageAnalysis *,NSError *)>::fromCallable<-[WKContentView(WKInteraction) requestTextRecognition:imageData:sourceLanguageIdentifier:targetLanguageIdentifier:completionHandler:]::$_4>(-[WKContentView(WKInteraction) requestTextRecognition:imageData:sourceLanguageIdentifier:targetLanguageIdentifier:completionHandler:]::$_4)::{lambda(void *,VKCImageAnalysis *,NSError *)#1}::__invoke;
        v25[3] = &WTF::BlockPtr<void ()(VKCImageAnalysis *,NSError *)>::fromCallable<-[WKContentView(WKInteraction) requestTextRecognition:imageData:sourceLanguageIdentifier:targetLanguageIdentifier:completionHandler:]::$_4>(-[WKContentView(WKInteraction) requestTextRecognition:imageData:sourceLanguageIdentifier:targetLanguageIdentifier:completionHandler:]::$_4)::descriptor;
        void v25[4] = v24;
        [v22 processRequest:v23 progressHandler:0 completionHandler:v25];
        _Block_release(v25);
        CFTypeRef v26 = v31[0];
        v31[0] = 0;
        if (v26) {
          CFRelease(v26);
        }
      }
    }
    else
    {
      long long v32 = 0u;
      long long v33 = 0u;
      *(_OWORD *)id v31 = 0u;
      WTF::CompletionHandler<void ()(WebCore::TextRecognitionResult &&)>::operator()((uint64_t *)a7);
      CFTypeRef cf = 0;
      WTF::Vector<WebCore::TextRecognitionBlockData,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v33, v18);
      WTF::Vector<WebCore::TextRecognitionDataDetector,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v32, v19);
      WTF::Vector<WebCore::TextRecognitionLineData,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v31, v20);
    }
    CFTypeRef v27 = v30;
    CFTypeRef v30 = 0;
    if (v27) {
      CFRelease(v27);
    }
  }
  else
  {
    long long v32 = 0u;
    long long v33 = 0u;
    *(_OWORD *)id v31 = 0u;
    WTF::CompletionHandler<void ()(WebCore::TextRecognitionResult &&)>::operator()((uint64_t *)a7);
    CFTypeRef cf = 0;
    WTF::Vector<WebCore::TextRecognitionBlockData,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v33, v15);
    WTF::Vector<WebCore::TextRecognitionDataDetector,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v32, v16);
    WTF::Vector<WebCore::TextRecognitionLineData,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v31, v17);
  }
  uint64_t v28 = v35;
  uint64_t v35 = 0;
  if (v28) {
    WTF::ThreadSafeRefCounted<WebCore::ShareableBitmap,(WTF::DestructionThread)0>::deref(v28, v13);
  }
}

- (void)imageAnalysisGestureDidBegin:(id)a3
{
  if (!-[WKContentView _isPanningScrollViewOrAncestor:](self, "_isPanningScrollViewOrAncestor:", [a3 lastTouchedScrollView]))
  {
    unint64_t IdentifierInternal = (void *)WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>::generateIdentifierInternal();
    [*(id *)&self->_anon_e70[40] cancelAllRequests];
    if (!LOBYTE(self->_editDropCaretAnimator.m_ptr)) {
      LOBYTE(self->_editDropCaretAnimator.m_ptr) = 1;
    }
    self->_editDropTextCursorView.id m_ptr = IdentifierInternal;
    self->_anon_e70[32] = 0;
    if (self->_anon_e70[0]) {
      self->_anon_e70[0] = 0;
    }
    LOBYTE(self->_cachedVisualSearchPreviewImageBoundsInWindowCoordinates.var0.__val_.origin.y) = 0;
    std::__optional_destruct_base<WebKit::ImageAnalysisContextMenuActionData,false>::reset[abi:sn180100]((uint64_t)&self->_cachedVisualSearchPreviewImageBoundsInWindowCoordinates.var0.__val_.size);
    [a3 locationInView:self];
    v18.double x = v6;
    v18.double y = v7;
    WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v23, &v18);
    float v8 = roundf(v23[0]);
    uint64_t v9 = 0x80000000;
    if (v8 > -2147500000.0) {
      uint64_t v9 = (int)v8;
    }
    if (v8 < 2147500000.0) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0x7FFFFFFFLL;
    }
    float v11 = roundf(v23[1]);
    unint64_t v12 = 0x8000000000000000;
    if (v11 > -2147500000.0) {
      unint64_t v12 = (unint64_t)(int)v11 << 32;
    }
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3321888768;
    void v20[2] = __61__WKContentView_WKInteraction__imageAnalysisGestureDidBegin___block_invoke;
    void v20[3] = &__block_descriptor_56_e8_32c76_ZTSKZ61__WKContentView_WKInteraction__imageAnalysisGestureDidBegin__E5__102_e6320_v648__0_InteractionInformationAtPosition__InteractionInformationRequest__IntPoint_ii_BBBBBBB_B_optional_BOOL_____cB_B_CBBBBBBBBBBBBB_Markable_WebCore::ProcessQualified_WTF::ObjectIdentifierGeneric_WebCore::ScrollingNodeIDType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::Yes____WebCore::ProcessQualified_WTF::ObjectIdentifierGeneric_WebCore::ScrollingNodeIDType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::Yes__::MarkableTraits___ProcessQualified_WTF::ObjectIdentifierGeneric_WebCore::ScrollingNodeIDType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::Yes____ObjectIdentifierGeneric_WebCore::ScrollingNodeIDType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::Yes__Q__ObjectIdentifierGeneric_WebCore::ProcessIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::Yes__Q___BBBBBB_FloatPoint_ff__URL__String__RefPtr_WTF::StringImpl__WTF::RawPtrTraits_WTF::StringImpl___WTF::DefaultRefDerefTraits_WTF::StringImpl_____StringImpl___b1b1b1b3b26IIIIIII__URL__String__RefPtr_WTF::StringImpl__WTF::RawPtrTraits_WTF::StringImpl___WTF::DefaultRefDerefTraits_WTF::StringImpl_____StringImpl___b1b1b1b3b26IIIIIII__String__RefPtr_WTF::StringImpl__WTF::RawPtrTraits_WTF::StringImpl___WTF::DefaultRefDerefTraits_WTF::StringImpl_____StringImpl____String__RefPtr_WTF::StringImpl__WTF::RawPtrTraits_WTF::StringImpl___WTF::DefaultRefDerefTraits_WTF::StringImpl_____StringImpl____String__RefPtr_WTF::StringImpl__WTF::RawPtrTraits_WTF::StringImpl___WTF::DefaultRefDerefTraits_WTF::StringImpl_____StringImpl____IntRect__IntPoint_ii__IntSize_ii___RefPtr_WebCore::ShareableBitmap__WTF::RawPtrTraits_WebCore::ShareableBitmap___WTF::DefaultRefDerefTraits_WebCore::ShareableBitmap_____ShareableBitmap___String__RefPtr_WTF::StringImpl__WTF::RawPtrTraits_WTF::StringImpl___WTF::DefaultRefDerefTraits_WTF::StringImpl_____StringImpl____String__RefPtr_WTF::StringImpl__WTF::RawPtrTraits_WTF::StringImpl___WTF::DefaultRefDerefTraits_WTF::StringImpl_____StringImpl___f_FloatRect__FloatPoint_ff__FloatSize_ff___optional_WebCore::Cursor_____c_Cursor_C_RefPtr_WebCore::Image__WTF::RawPtrTraits_WebCore::Image___WTF::DefaultRefDerefTraits_WebCore::Image_____Image___IntPoint_ii__v__B__TextIndicatorData__FloatRect__FloatPoint_ff__FloatSize_ff___FloatRect__FloatPoint_ff__FloatSize_ff___FloatRect__FloatPoint_ff__FloatSize_ff___Vector_WebCore::FloatRect__0UL__WTF::CrashOnOverflow__16UL__WTF::FastMalloc____FloatRect_II_f_RefPtr_WebCore::Image__WTF::RawPtrTraits_WebCore::Image___WTF::DefaultRefDerefTraits_WebCore::Image_____Image___RefPtr_WebCore::Image__WTF::RawPtrTraits_WebCore::Image___WTF::DefaultRefDerefTraits_WebCore::Image_____Image___RefPtr_WebCore::Image__WTF::RawPtrTraits_WebCore::Image___WTF::DefaultRefDerefTraits_WebCore::Image_____Image___Color_Q_C_OptionSet_WebCore::TextIndicatorOption__S___String__RefPtr_WTF::StringImpl__WTF::RawPtrTraits_WTF::StringImpl___WTF::DefaultRefDerefTraits_WTF::StringImpl_____StringImpl____RetainPtr_NSArray___v__IntRect__IntPoint_ii__IntSize_ii___optional_WebCore::ElementContext_____c_ElementContext__FloatRect__FloatPoint_ff__FloatSize_ff___Markable_WTF::ObjectIdentifierGeneric_WebCore::PageIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No___WTF::ObjectIdentifierGeneric_WebCore::PageIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No_::MarkableTraits___ObjectIdentifierGeneric_WebCore::PageIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No__Q___ProcessQualified_WTF::UUID___UUID_T__ObjectIdentifierGeneric_WebCore::ProcessIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::Yes__Q___Markable_WTF::ObjectIdentifierGeneric_WebCore::ElementIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No___WTF::ObjectIdentifierGeneric_WebCore::ElementIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No_::MarkableTraits___ObjectIdentifierGeneric_WebCore::ElementIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No__Q____B__optional_WebCore::ElementContext_____c_ElementContext__FloatRect__FloatPoint_ff__FloatSize_ff___Markable_WTF::ObjectIdentifierGeneric_WebCore::PageIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No___WTF::ObjectIdentifierGeneric_WebCore::PageIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No_::MarkableTraits___ObjectIdentifierGeneric_WebCore::PageIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No__Q___ProcessQualified_WTF::UUID___UUID_T__ObjectIdentifierGeneric_WebCore::ProcessIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::Yes__Q___Markable_WTF::ObjectIdentifierGeneric_WebCore::ElementIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No___WTF::ObjectIdentifierGeneric_WebCore::ElementIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No_::MarkableTraits___ObjectIdentifierGeneric_WebCore::ElementIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No__Q____B__Vector_WebCore::ElementAnimationContext__0UL__WTF::CrashOnOverflow__16UL__WTF::FastMalloc____ElementAnimationContext_II__8l;
    if (v11 < 2147500000.0) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0x7FFFFFFF00000000;
    }
    *(void *)&v18.double x = IdentifierInternal;
    v18.double y = 0.0;
    objc_initWeak((id *)&v18.y, self);
    uint64_t v14 = WTF::fastMalloc((WTF *)0x18);
    *(_DWORD *)uint64_t v14 = 1;
    *(void *)(v14 + 8) = 0;
    objc_initWeak((id *)(v14 + 8), self);
    *(unsigned char *)(v14 + 16) = 0;
    uint64_t v19 = (_DWORD *)v14;
    v20[4] = *(void *)&v18.x;
    id v21 = 0;
    objc_copyWeak(&v21, (id *)&v18.y);
    uint64_t v15 = v19;
    if (v19) {
      ++*v19;
    }
    uint64_t v22 = (uint64_t)v15;
    -[WKContentView doAfterPositionInformationUpdate:forRequest:](self, "doAfterPositionInformationUpdate:forRequest:", v20, v13 | v10, 0x101000000);
    uint64_t v16 = (uint64_t)v19;
    uint64_t v19 = 0;
    if (v16) {
      WTF::RefCounted<WebKit::ImageAnalysisGestureDeferralToken>::deref(v16);
    }
    objc_destroyWeak((id *)&v18.y);
    uint64_t v17 = v22;
    uint64_t v22 = 0;
    if (v17) {
      WTF::RefCounted<WebKit::ImageAnalysisGestureDeferralToken>::deref(v17);
    }
    objc_destroyWeak(&v21);
  }
}

void __61__WKContentView_WKInteraction__imageAnalysisGestureDidBegin___block_invoke(uint64_t a1, id *a2)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (([WeakRetained validateImageAnalysisRequestIdentifier:*(void *)(a1 + 32)] & 1) == 0)
  {
LABEL_13:
    if (!WeakRetained) {
      return;
    }
    goto LABEL_14;
  }
  if (!*((unsigned char *)a2 + 25))
  {
    uint64_t v7 = *(void *)(*((void *)WeakRetained + 53) + 272);
    {
      WebKit::WebPreferencesKey::textRecognitionInVideosEnabledKey(void)::$_0::operator() const(void)::impl += 2;
      WebKit::WebPreferencesKey::textRecognitionInVideosEnabledKey(void)::kedouble y = (uint64_t)&WebKit::WebPreferencesKey::textRecognitionInVideosEnabledKey(void)::$_0::operator() const(void)::impl;
    }
    if (!WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)(v7 + 40), (WTF::StringImpl **)&WebKit::WebPreferencesKey::textRecognitionInVideosEnabledKey(void)::key, v6)|| *((unsigned char *)a2 + 30) == 0)
    {
      goto LABEL_12;
    }
  }
  uint64_t v9 = (WebCore::ShareableBitmap *)a2[24];
  if (!v9 || !*((unsigned char *)a2 + 608) || *((unsigned char *)a2 + 27) || *((unsigned char *)a2 + 32) || !*((unsigned char *)WeakRetained + 3632))
  {
LABEL_12:
    [WeakRetained _invokeAllActionsToPerformAfterPendingImageAnalysis:0];
    goto LABEL_13;
  }
  WebCore::ShareableBitmap::makeCGImageCopy((uint64_t *)&cf, v9);
  if (cf)
  {
    uint64_t v10 = qword_1EB358910;
    CFTypeRef v11 = (CFTypeRef)os_log_type_enabled((os_log_t)qword_1EB358910, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      uint64_t v12 = *(void *)(a1 + 32);
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v12;
      _os_log_impl(&dword_1985F2000, v10, OS_LOG_TYPE_DEFAULT, "Image analysis preflight gesture initiated (request %llu).", (uint8_t *)&buf, 0xCu);
    }
    long long v13 = *((_OWORD *)a2 + 34);
    *((_OWORD *)WeakRetained + 228) = *((_OWORD *)a2 + 33);
    *((_OWORD *)WeakRetained + 229) = v13;
    long long v15 = *((_OWORD *)a2 + 36);
    long long v14 = *((_OWORD *)a2 + 37);
    long long v16 = *((_OWORD *)a2 + 35);
    *((unsigned char *)WeakRetained + 3728) = *((unsigned char *)a2 + 608);
    *((_OWORD *)WeakRetained + 231) = v15;
    *((_OWORD *)WeakRetained + 232) = v14;
    *((_OWORD *)WeakRetained + 230) = v16;
    if (*((unsigned char *)a2 + 608))
    {
      id v17 = *a2;
      long long v18 = *((_OWORD *)a2 + 36);
      long long v59 = *((_OWORD *)a2 + 35);
      long long v60 = v18;
      long long v61 = *((_OWORD *)a2 + 37);
      long long v19 = *((_OWORD *)a2 + 34);
      long long v57 = *((_OWORD *)a2 + 33);
      long long v58 = v19;
      char v20 = (WTF::MonotonicTime *)[WeakRetained createImageAnalyzerRequest:1 image:cf];
      if (*((unsigned char *)a2 + 30)) {
        char v20 = (WTF::MonotonicTime *)[v30 setImageSource:2];
      }
      if (*((unsigned char *)a2 + 58))
      {
        [WeakRetained _completeImageAnalysisRequestForContextMenu:cf requestIdentifier:*(void *)(a1 + 32) hasTextResults:1];
LABEL_43:
        if (v30) {
          CFRelease(v30);
        }
        goto LABEL_45;
      }
      WTF::MonotonicTime::now(v20);
      uint64_t v22 = v21;
      CFTypeRef v23 = (void *)[WeakRetained imageAnalyzer];
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3321888768;
      BOOL v44 = ___ZZ61__WKContentView_WKInteraction__imageAnalysisGestureDidBegin__EN5__102clEN6WebKit32InteractionInformationAtPositionE_block_invoke;
      uint64_t v45 = &__block_descriptor_160_e16_32c157_ZTSKZZ61__WKContentView_WKInteraction__imageAnalysisGestureDidBegin__EN5__102clEN6WebKit32InteractionInformationAtPositionEEUlP16VKCImageAnalysisP7NSErrorE__e38_v24__0__VKCImageAnalysis_8__NSError_16l;
      a2 = &v33;
      uint64_t v32 = *(void *)(a1 + 32);
      id v33 = 0;
      objc_copyWeak(&v33, v4);
      long long v36 = v59;
      long long v37 = v60;
      long long v34 = v57;
      long long v35 = v58;
      *(void *)&long long v38 = v61;
      id v39 = v17;
      CFTypeRef v40 = cf;
      if (cf) {
        CFRetain(cf);
      }
      uint64_t v24 = *(_DWORD **)(a1 + 48);
      if (v24) {
        ++*v24;
      }
      char v41 = v24;
      uint64_t v42 = v22;
      BOOL v4 = &v47;
      uint64_t v46 = v32;
      id v47 = 0;
      objc_copyWeak(&v47, &v33);
      long long v50 = v36;
      long long v51 = v37;
      long long v52 = v38;
      long long v48 = v34;
      long long v49 = v35;
      id v53 = v39;
      CFTypeRef v54 = v40;
      if (v40) {
        CFRetain(v40);
      }
      id v25 = v41;
      if (v41) {
        ++*v41;
      }
      uint64_t v55 = (uint64_t)v25;
      uint64_t v56 = v42;
      [v23 processRequest:v30 progressHandler:0 completionHandler:&buf];
      uint64_t v26 = (uint64_t)v41;
      char v41 = 0;
      if (v26) {
        WTF::RefCounted<WebKit::ImageAnalysisGestureDeferralToken>::deref(v26);
      }
      CFTypeRef v11 = v40;
      CFTypeRef v40 = 0;
      if (!v11)
      {
LABEL_38:
        objc_destroyWeak(a2);
        uint64_t v27 = v55;
        uint64_t v55 = 0;
        if (v27) {
          WTF::RefCounted<WebKit::ImageAnalysisGestureDeferralToken>::deref(v27);
        }
        CFTypeRef v28 = v54;
        CFTypeRef v54 = 0;
        if (v28) {
          CFRelease(v28);
        }
        objc_destroyWeak(v4);
        goto LABEL_43;
      }
    }
    else
    {
      __break(1u);
    }
    CFRelease(v11);
    goto LABEL_38;
  }
  [WeakRetained _invokeAllActionsToPerformAfterPendingImageAnalysis:0];
LABEL_45:
  CFTypeRef v29 = cf;
  CFTypeRef cf = 0;
  if (v29) {
    CFRelease(v29);
  }
LABEL_14:
  CFRelease(WeakRetained);
}

- (void)_completeImageAnalysisRequestForContextMenu:(CGImage *)a3 requestIdentifier:()ObjectIdentifierGeneric<WebKit:()WTF:(unsigned long)long :(WTF:(BOOL)a5 :SupportsObjectIdentifierNullState::Yes>)a4 ObjectIdentifierMainThreadAccessTraits<uint64_t> :ImageAnalysisRequestIdentifierType hasTextResults:
{
  LOBYTE(self->_cachedVisualSearchPreviewImageBoundsInWindowCoordinates.var0.__val_.origin.y) = 1;
  std::__optional_destruct_base<WebKit::ImageAnalysisContextMenuActionData,false>::reset[abi:sn180100]((uint64_t)&self->_cachedVisualSearchPreviewImageBoundsInWindowCoordinates.var0.__val_.size);
  [(WKContentView *)self _invokeAllActionsToPerformAfterPendingImageAnalysis:0];
  uint64_t v9 = WTF::fastMalloc((WTF *)0x20);
  *(_DWORD *)uint64_t v9 = 1;
  *(void *)(v9 + 16) = 0;
  *(void *)(v9 + 24) = 0;
  *(void *)(v9 + 8) = 0;
  *(unsigned char *)(v9 + 8) = a5;
  location[0] = 0;
  objc_initWeak(location, self);
  id to = 0;
  objc_copyWeak(&to, location);
  atomic_fetch_add((atomic_uint *volatile)v9, 1u);
  uint64_t v42 = (WTF *)v9;
  uint64_t v10 = WTF::fastMalloc((WTF *)0x18);
  *(void *)uint64_t v10 = &unk_1EEA0F288;
  *(void *)(v10 + 8) = 0;
  objc_moveWeak((id *)(v10 + 8), &to);
  CFTypeRef v11 = v42;
  uint64_t v42 = 0;
  *(void *)(v10 + 16) = v11;
  uint64_t v13 = WTF::fastMalloc((WTF *)0x10);
  *(_DWORD *)uint64_t v13 = 1;
  *(void *)(v13 + 8) = v10;
  long long v14 = v42;
  uint64_t v42 = 0;
  if (v14) {
    WTF::ThreadSafeRefCounted<WTF::Box<WebKit::ImageAnalysisContextMenuActionData>::Data,(WTF::DestructionThread)0>::deref(v14, v12);
  }
  objc_destroyWeak(&to);
  long long v15 = [(WKContentView *)self createImageAnalyzerRequest:28 image:a3];
  if (self->_positionInformation.isPausedVideo) {
    long long v15 = (WTF::MonotonicTime *)[v53 setImageSource:2];
  }
  long long v38 = a3;
  IntRect bounds = self->_positionInformation.bounds;
  WTF::MonotonicTime::now(v15);
  id v17 = v16;
  id v18 = [(WKContentView *)self imageAnalyzer];
  id v19 = v53;
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3321888768;
  v47[2] = __109__WKContentView_WKInteraction___completeImageAnalysisRequestForContextMenu_requestIdentifier_hasTextResults___block_invoke;
  v47[3] = &__block_descriptor_88_e8_32c125_ZTSKZ109__WKContentView_WKInteraction___completeImageAnalysisRequestForContextMenu_requestIdentifier_hasTextResults__E5__104_e38_v24__0__VKCImageAnalysis_8__NSError_16l;
  id to = (id)a4.m_identifier;
  uint64_t v42 = 0;
  objc_copyWeak((id *)&v42, location);
  char v43 = v17;
  atomic_fetch_add((atomic_uint *volatile)v13, 1u);
  BOOL v44 = (atomic_uint *)v13;
  atomic_fetch_add((atomic_uint *volatile)v9, 1u);
  uint64_t v45 = (WTF *)v9;
  IntRect v46 = bounds;
  v47[4] = to;
  v48[0] = 0;
  objc_copyWeak(v48, (id *)&v42);
  v48[1] = v43;
  char v20 = v44;
  atomic_fetch_add(v44, 1u);
  long long v49 = (unsigned int *)v20;
  uint64_t v21 = v45;
  if (v45) {
    atomic_fetch_add((atomic_uint *volatile)v45, 1u);
  }
  long long v50 = v21;
  IntRect v51 = v46;
  objc_msgSend(v18, "processRequest:progressHandler:completionHandler:", v19, 0, v47, v38);
  CFTypeRef v23 = v45;
  uint64_t v45 = 0;
  if (v23) {
    WTF::ThreadSafeRefCounted<WTF::Box<WebKit::ImageAnalysisContextMenuActionData>::Data,(WTF::DestructionThread)0>::deref(v23, v22);
  }
  uint64_t v24 = (unsigned int *)v44;
  BOOL v44 = 0;
  if (v24) {
    WTF::ThreadSafeRefCounted<WTF::CallbackAggregatorOnThread<(WTF::DestructionThread)2>,(WTF::DestructionThread)2>::deref(v24);
  }
  objc_destroyWeak((id *)&v42);
  uint64_t v26 = *((void *)self->_page.m_ptr + 34);
  {
    WebKit::WebPreferencesKey::removeBackgroundEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::removeBackgroundEnabledKey(void)::kedouble y = (uint64_t)&WebKit::WebPreferencesKey::removeBackgroundEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  if (WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)(v26 + 40), (WTF::StringImpl **)&WebKit::WebPreferencesKey::removeBackgroundEnabledKey(void)::key, v25))
  {
    id to = 0;
    objc_initWeak(&to, self);
    atomic_fetch_add((atomic_uint *volatile)v13, 1u);
    uint64_t v42 = (WTF *)v13;
    atomic_fetch_add((atomic_uint *volatile)v9, 1u);
    char v43 = (WTF *)v9;
    uint64_t v28 = WTF::fastMalloc((WTF *)0x20);
    *(void *)uint64_t v28 = &unk_1EEA0F2B0;
    *(void *)(v28 + 8) = 0;
    objc_moveWeak((id *)(v28 + 8), &to);
    *(void *)(v28 + 16) = v42;
    CFTypeRef v29 = v43;
    uint64_t v42 = 0;
    char v43 = 0;
    *(void *)(v28 + 24) = v29;
    uint64_t v40 = v28;
    WebKit::requestBackgroundRemoval(v39, &v40);
    uint64_t v31 = v40;
    uint64_t v40 = 0;
    if (v31) {
      (*(void (**)(uint64_t))(*(void *)v31 + 8))(v31);
    }
    uint64_t v32 = v43;
    char v43 = 0;
    if (v32) {
      WTF::ThreadSafeRefCounted<WTF::Box<WebKit::ImageAnalysisContextMenuActionData>::Data,(WTF::DestructionThread)0>::deref(v32, v30);
    }
    id v33 = (unsigned int *)v42;
    uint64_t v42 = 0;
    if (v33) {
      WTF::ThreadSafeRefCounted<WTF::CallbackAggregatorOnThread<(WTF::DestructionThread)2>,(WTF::DestructionThread)2>::deref(v33);
    }
    objc_destroyWeak(&to);
  }
  long long v34 = v50;
  long long v50 = 0;
  if (v34) {
    WTF::ThreadSafeRefCounted<WTF::Box<WebKit::ImageAnalysisContextMenuActionData>::Data,(WTF::DestructionThread)0>::deref(v34, v27);
  }
  long long v35 = v49;
  long long v49 = 0;
  if (v35) {
    WTF::ThreadSafeRefCounted<WTF::CallbackAggregatorOnThread<(WTF::DestructionThread)2>,(WTF::DestructionThread)2>::deref(v35);
  }
  objc_destroyWeak(v48);
  id v36 = v53;
  id v53 = 0;
  if (v36) {
    CFRelease(v36);
  }
  WTF::ThreadSafeRefCounted<WTF::CallbackAggregatorOnThread<(WTF::DestructionThread)2>,(WTF::DestructionThread)2>::deref((unsigned int *)v13);
  objc_destroyWeak(location);
  WTF::ThreadSafeRefCounted<WTF::Box<WebKit::ImageAnalysisContextMenuActionData>::Data,(WTF::DestructionThread)0>::deref((WTF *)v9, v37);
}

void __109__WKContentView_WKInteraction___completeImageAnalysisRequestForContextMenu_requestIdentifier_hasTextResults___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v7 = WeakRetained;
    int v8 = [a2 hasResultsForAnalysisTypes:16];
    uint64_t v9 = qword_1EB358910;
    BOOL v10 = os_log_type_enabled((os_log_t)qword_1EB358910, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      WTF::MonotonicTime::now((WTF::MonotonicTime *)v10);
      double v12 = (v11 - *(double *)(a1 + 48)) * 1000.0;
      uint64_t v13 = *(void *)(a1 + 32);
      int v18 = 134218496;
      double v19 = v12;
      __int16 v20 = 2048;
      uint64_t v21 = v13;
      __int16 v22 = 1024;
      int v23 = v8;
      _os_log_impl(&dword_1985F2000, v9, OS_LOG_TYPE_DEFAULT, "Image analysis completed in %.0f ms (request %llu; found visual search results? %d)",
        (uint8_t *)&v18,
        0x1Cu);
    }
    if (a2 && !a3)
    {
      WebCore::IntRect::operator CGRect();
      objc_msgSend(v7, "updateImageAnalysisForContextMenuPresentation:elementBounds:", a2);
      if (objc_msgSend((id)objc_msgSend(a2, "barcodeActions"), "indexOfObjectPassingTest:", &__block_literal_global_3004) == 0x7FFFFFFFFFFFFFFFLL)
      {
        long long v14 = (const void *)[a2 mrcMenu];
        long long v15 = v14;
        uint64_t v16 = *(void *)(a1 + 64);
        if (v14) {
          CFRetain(v14);
        }
        id v17 = *(const void **)(v16 + 24);
        *(void *)(v16 + 24) = v15;
        if (v17) {
          CFRelease(v17);
        }
      }
      *(unsigned char *)(*(void *)(a1 + 64) + 9) = v8;
    }
    CFRelease(v7);
  }
}

- (void)_insertDynamicImageAnalysisContextMenuItemsIfPossible
{
  int v5 = self;
  char v4 = 0;
  CFTypeRef v2 = [(WKContentView *)self contextMenuInteraction];
  BOOL v3 = malloc_type_malloc(0x30uLL, 0x10F0040815E20ADuLL);
  *BOOL v3 = MEMORY[0x1E4F14398];
  v3[1] = 50331650;
  void v3[2] = WTF::BlockPtr<UIMenu * ()(UIMenu *)>::fromCallable<-[WKContentView(WKInteraction) _insertDynamicImageAnalysisContextMenuItemsIfPossible]::$_5>([(WKContentView(WKInteraction) *)void * _insertDynamicImageAnalysisContextMenuItemsIfPossible]#1}::__invoke;
  v3[3] = &WTF::BlockPtr<UIMenu * ()(UIMenu *)>::fromCallable<-[WKContentView(WKInteraction) _insertDynamicImageAnalysisContextMenuItemsIfPossible]::$_5>(-[WKContentView(WKInteraction) _insertDynamicImageAnalysisContextMenuItemsIfPossible]::$_5)::descriptor;
  v3[4] = &v4;
  v3[5] = &v5;
  [(UIContextMenuInteraction *)v2 updateVisibleMenuWithBlock:v3];
  _Block_release(v3);
  LOBYTE(v5->_cachedVisualSearchPreviewImageBoundsInWindowCoordinates.var0.__val_.origin.y) = 2 * (v4 == 0);
}

- (void)imageAnalysisGestureDidFail:(id)a3
{
}

- (void)captureTextFromCameraForWebView:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)WKContentView;
  [(WKContentView *)&v3 captureTextFromCamera:a3];
}

- (BOOL)actionSheetAssistantShouldIncludeCopySubjectAction:(id)a3
{
  return [(WKContentView *)self copySubjectResultForImageContextMenu] != 0;
}

- (void)actionSheetAssistant:(id)a3 copySubject:(id)a4 sourceMIMEType:(id)a5
{
  if ([(WKContentView *)self copySubjectResultForImageContextMenu])
  {
    uint64_t v7 = [(WKContentView *)self copySubjectResultForImageContextMenu];
    MEMORY[0x19972EAD0](&v22, a5);
    WebKit::imageDataForRemoveBackground(v7, &v22, v8, (WebKit *)&v23);
    BOOL v10 = v22;
    __int16 v22 = 0;
    if (v10)
    {
      if (*(_DWORD *)v10 == 2) {
        WTF::StringImpl::destroy(v10, v9);
      }
      else {
        *(_DWORD *)v10 -= 2;
      }
    }
    if (v23)
    {
      double v11 = (void *)MEMORY[0x1E4F42C50];
      uint64_t v12 = [(WKContentView *)self _dataOwnerForCopy];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3321888768;
      void v19[2] = __80__WKContentView_WKInteraction__actionSheetAssistant_copySubject_sourceMIMEType___block_invoke;
      v19[3] = &__block_descriptor_48_e8_32c95_ZTSKZ80__WKContentView_WKInteraction__actionSheetAssistant_copySubject_sourceMIMEType__E5__106_e5_v8__0l;
      uint64_t v13 = v23;
      long long v14 = v24;
      int v23 = 0;
      uint64_t v24 = 0;
      CFTypeRef v20 = v13;
      if (v13) {
        CFRetain(v13);
      }
      CFTypeRef cf = v14;
      if (v14) {
        CFRetain(v14);
      }
      [v11 _performAsDataOwner:v12 block:v19];
      if (v14) {
        CFRelease(v14);
      }
      if (v13) {
        CFRelease(v13);
      }
      CFTypeRef v15 = cf;
      CFTypeRef cf = 0;
      if (v15) {
        CFRelease(v15);
      }
      CFTypeRef v16 = v20;
      CFTypeRef v20 = 0;
      if (v16) {
        CFRelease(v16);
      }
    }
    id v17 = v24;
    uint64_t v24 = 0;
    if (v17) {
      CFRelease(v17);
    }
    int v18 = v23;
    int v23 = 0;
    if (v18) {
      CFRelease(v18);
    }
  }
}

uint64_t __80__WKContentView_WKInteraction__actionSheetAssistant_copySubject_sourceMIMEType___block_invoke(uint64_t a1)
{
  CFTypeRef v2 = (void *)[MEMORY[0x1E4F42C50] generalPasteboard];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return [v2 setData:v3 forPasteboardType:v4];
}

- (CGRect)contentsRectForImageAnalysisInteraction:(id)a3
{
  long long v18 = *(_OWORD *)&self->_imageAnalysisContextMenuActionData.__engaged_;
  [(WKContentView *)self bounds];
  v14.origin.double x = v4;
  v14.origin.double y = v5;
  v14.size.double width = v6;
  v14.size.double height = v7;
  WebCore::FloatRect::FloatRect((WebCore::FloatRect *)&v15, &v14);
  objc_msgSend(-[WKContentView webView](self, "webView"), "_computedObscuredInset");
  v9.f64[1] = v8;
  *(float32x2_t *)&long long v18 = vsub_f32(vadd_f32(*(float32x2_t *)&v18, vcvt_f32_f64(v9)), v15);
  WebCore::FloatRect::scale((WebCore::FloatRect *)&v18, 1.0 / v16, 1.0 / v17);
  WebCore::FloatRect::operator CGRect();
  result.size.double height = v13;
  result.size.double width = v12;
  result.origin.double y = v11;
  result.origin.double x = v10;
  return result;
}

- (BOOL)imageAnalysisInteraction:(id)a3 shouldBeginAtPoint:(CGPoint)a4 forAnalysisType:(unint64_t)a5
{
  double y = a4.y;
  double x = a4.x;
  if ([a3 hasActiveTextSelection]) {
    return 1;
  }

  return objc_msgSend(a3, "interactableItemExistsAtPoint:", x, y);
}

- (void)beginTextRecognitionForFullscreenVideo:(void *)a3 playerViewController:(id)a4
{
  if (!*(_DWORD *)&self->_imageAnalysisContextMenuActionData.var0.__null_state_)
  {
    WebCore::ShareableBitmap::create();
    if (v19)
    {
      WebCore::ShareableBitmap::makeCGImage();
      if (v18)
      {
        -[WKContentView createImageAnalyzerRequest:image:](self, "createImageAnalyzerRequest:image:", 61);
        [(id)v17 setImageSource:2];
        id v7 = [(WKContentView *)self imageAnalyzer];
        CFTypeRef v8 = v17;
        id location = 0;
        objc_initWeak(&location, self);
        CFTypeRef cf = a4;
        if (a4) {
          CFRetain(a4);
        }
        id to = 0;
        objc_moveWeak(&to, &location);
        CFTypeRef v9 = cf;
        CFTypeRef cf = 0;
        CFTypeRef v21 = v9;
        double v10 = malloc_type_malloc(0x30uLL, 0x10E00408A4B35D9uLL);
        *(void *)double v10 = MEMORY[0x1E4F14398];
        *((void *)v10 + 1) = 50331650;
        *((void *)v10 + 2) = WTF::BlockPtr<void ()(VKCImageAnalysis *,NSError *)>::fromCallable<-[WKContentView(WKInteraction) beginTextRecognitionForFullscreenVideo:playerViewController:]::$_6>(-[WKContentView(WKInteraction) beginTextRecognitionForFullscreenVideo:playerViewController:]::$_6)::{lambda(void *,VKCImageAnalysis *,NSError *)#1}::__invoke;
        *((void *)v10 + 3) = &WTF::BlockPtr<void ()(VKCImageAnalysis *,NSError *)>::fromCallable<-[WKContentView(WKInteraction) beginTextRecognitionForFullscreenVideo:playerViewController:]::$_6>(-[WKContentView(WKInteraction) beginTextRecognitionForFullscreenVideo:playerViewController:]::$_6)::descriptor;
        *((void *)v10 + 4) = 0;
        objc_moveWeak((id *)v10 + 4, &to);
        *((void *)v10 + 5) = v21;
        CFTypeRef v21 = 0;
        objc_destroyWeak(&to);
        *(_DWORD *)&self->_imageAnalysisContextMenuActionData.var0.__null_state_ = [v7 processRequest:v8 progressHandler:0 completionHandler:v10];
        _Block_release(v10);
        CFTypeRef v11 = cf;
        CFTypeRef cf = 0;
        if (v11) {
          CFRelease(v11);
        }
        objc_destroyWeak(&location);
        CFTypeRef v12 = v17;
        CFTypeRef v17 = 0;
        if (v12) {
          CFRelease(v12);
        }
        CFTypeRef v13 = v18;
        CFTypeRef v18 = 0;
        if (v13) {
          CFRelease(v13);
        }
      }
      CGRect v14 = v19;
      double v19 = 0;
      if (v14) {
        WTF::ThreadSafeRefCounted<WebCore::ShareableBitmap,(WTF::DestructionThread)0>::deref((uint64_t)v14, v6);
      }
    }
  }
}

- (void)cancelTextRecognitionForFullscreenVideo:(id)a3
{
  int v4 = *(_DWORD *)&self->_imageAnalysisContextMenuActionData.var0.__null_state_;
  *(_DWORD *)&self->_imageAnalysisContextMenuActionData.var0.__null_state_ = 0;
  if (v4) {
    objc_msgSend(*(id *)&self->_anon_e70[40], "cancelRequestID:");
  }
  if (objc_opt_respondsToSelector())
  {
    [a3 setImageAnalysis:0];
  }
}

- (BOOL)isTextRecognitionInFullscreenVideoEnabled
{
  uint64_t v3 = *((void *)self->_page.m_ptr + 34);
  {
    WebKit::WebPreferencesKey::textRecognitionInVideosEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::textRecognitionInVideosEnabledKey(void)::kedouble y = (uint64_t)&WebKit::WebPreferencesKey::textRecognitionInVideosEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)(v3 + 40), (WTF::StringImpl **)&WebKit::WebPreferencesKey::textRecognitionInVideosEnabledKey(void)::key, v2);
}

- (void)beginTextRecognitionForVideoInElementFullscreen:(void *)a3 bounds:(FloatRect)a4
{
  float m_height = a4.m_size.m_height;
  float m_width = a4.m_size.m_width;
  m_double y = a4.m_location.m_y;
  m_double x = a4.m_location.m_x;
  WebCore::ShareableBitmap::create();
  if (v21)
  {
    uint64_t CGImage = WebCore::ShareableBitmap::makeCGImage();
    if (cf)
    {
      CFTypeRef v11 = (void *)[objc_alloc((Class)((uint64_t (*)(uint64_t))*MEMORY[0x1E4FB63B0])(CGImage)) initWithCGImage:cf orientation:0 requestType:45];
      [v11 setImageSource:2];
      id v12 = [(WKContentView *)self imageAnalyzer];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3321888768;
      float v17[2] = __87__WKContentView_WKInteraction__beginTextRecognitionForVideoInElementFullscreen_bounds___block_invoke;
      v17[3] = &__block_descriptor_56_e8_32c102_ZTSKZ87__WKContentView_WKInteraction__beginTextRecognitionForVideoInElementFullscreen_bounds__E5__107_e38_v24__0__VKCImageAnalysis_8__NSError_16l;
      id v15 = 0;
      objc_initWeak(&v15, self);
      *(void *)&long long v16 = __PAIR64__(LODWORD(m_y), LODWORD(m_x));
      *((void *)&v16 + 1) = __PAIR64__(LODWORD(m_height), LODWORD(m_width));
      id v18 = 0;
      objc_copyWeak(&v18, &v15);
      long long v19 = v16;
      *(_DWORD *)&self->_imageAnalysisContextMenuActionData.var0.__null_state_ = [v12 processRequest:v11 progressHandler:0 completionHandler:v17];
      objc_destroyWeak(&v15);
      objc_destroyWeak(&v18);
      if (v11) {
        CFRelease(v11);
      }
      CFTypeRef v13 = cf;
      CFTypeRef cf = 0;
      if (v13) {
        CFRelease(v13);
      }
    }
    CGRect v14 = v21;
    CFTypeRef v21 = 0;
    if (v14) {
      WTF::ThreadSafeRefCounted<WebCore::ShareableBitmap,(WTF::DestructionThread)0>::deref((uint64_t)v14, v10);
    }
  }
}

void __87__WKContentView_WKInteraction__beginTextRecognitionForVideoInElementFullscreen_bounds___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    if (*((_DWORD *)WeakRetained + 980))
    {
      *((_DWORD *)WeakRetained + 980) = 0;
      if (a2)
      {
        if (!a3)
        {
          *(_OWORD *)(WeakRetained + 3944) = *(_OWORD *)(a1 + 40);
          [WeakRetained installImageAnalysisInteraction:a2];
        }
      }
    }
    CFRelease(v7);
  }
}

- (void)cancelTextRecognitionForVideoInElementFullscreen
{
  [(WKContentView *)self uninstallImageAnalysisInteraction];
  uint64_t v3 = *(unsigned int *)&self->_imageAnalysisContextMenuActionData.var0.__null_state_;
  *(_DWORD *)&self->_imageAnalysisContextMenuActionData.var0.__null_state_ = 0;
  if (v3)
  {
    id v4 = [(WKContentView *)self imageAnalyzer];
    [v4 cancelRequestID:v3];
  }
}

- (void)installImageAnalysisInteraction:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id m_ptr = self->_imageAnalysisContextMenuActionData.var0.__val_.copySubjectResult.m_ptr;
  if (!m_ptr)
  {
    CGFloat v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:1];
    id v7 = self->_imageAnalysisContextMenuActionData.var0.__val_.machineReadableCodeMenu.m_ptr;
    self->_imageAnalysisContextMenuActionData.var0.__val_.machineReadableCodeMenu.id m_ptr = v6;
    if (v7) {
      CFRelease(v7);
    }
    CFTypeRef v8 = (void *)[objc_alloc((Class)((uint64_t (*)(void))*MEMORY[0x1E4FB63F8])()) init];
    CFTypeRef v9 = self->_imageAnalysisContextMenuActionData.var0.__val_.copySubjectResult.m_ptr;
    self->_imageAnalysisContextMenuActionData.var0.__val_.copySubjectResult.id m_ptr = v8;
    if (v9)
    {
      CFRelease(v9);
      CFTypeRef v8 = self->_imageAnalysisContextMenuActionData.var0.__val_.copySubjectResult.m_ptr;
    }
    [v8 setDelegate:self];
    [self->_imageAnalysisContextMenuActionData.var0.__val_.copySubjectResult.m_ptr setAnalysisButtonRequiresVisibleContentGating:1];
    double v10 = self->_imageAnalysisContextMenuActionData.var0.__val_.copySubjectResult.m_ptr;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3321888768;
    float v17[2] = __64__WKContentView_WKInteraction__installImageAnalysisInteraction___block_invoke;
    v17[3] = &__block_descriptor_40_e8_32c79_ZTSKZ64__WKContentView_WKInteraction__installImageAnalysisInteraction__E5__108_e18_v16__0__UIButton_8l;
    *(void *)id location = 0;
    objc_initWeak((id *)location, self);
    id v18 = 0;
    objc_copyWeak(&v18, (id *)location);
    [v10 setQuickActionConfigurationUpdateHandler:v17];
    objc_destroyWeak((id *)location);
    CFTypeRef v11 = self->_imageAnalysisContextMenuActionData.var0.__val_.copySubjectResult.m_ptr;
    [v11 setActiveInteractionTypes:3];
    [v11 setWantsAutomaticContentsRectCalculation:0];
    [v11 setActionInfoLiveTextButtonDisabled:0];
    [v11 setActionInfoQuickActionsDisabled:0];
    [v11 setActionInfoViewHidden:0 animated:1];
    [(WKContentView *)self addInteraction:self->_imageAnalysisContextMenuActionData.var0.__val_.copySubjectResult.m_ptr];
    id v12 = qword_1EB358910;
    if (os_log_type_enabled((os_log_t)qword_1EB358910, OS_LOG_TYPE_DEFAULT))
    {
      double v13 = *(float *)&self->_imageAnalysisContextMenuActionData.__engaged_;
      double v14 = *((float *)&self->_imageAnalysisContextMenuActionData.__engaged_ + 1);
      double v15 = *(float *)&self->_fullscreenVideoImageAnalysisRequestIdentifier;
      double v16 = *((float *)&self->_fullscreenVideoImageAnalysisRequestIdentifier + 1);
      *(_DWORD *)id location = 134218752;
      *(double *)&id location[4] = v13;
      __int16 v20 = 2048;
      double v21 = v14;
      __int16 v22 = 2048;
      double v23 = v15;
      __int16 v24 = 2048;
      double v25 = v16;
      _os_log_impl(&dword_1985F2000, v12, OS_LOG_TYPE_DEFAULT, "Installing image analysis interaction at {{ %.0f, %.0f }, { %.0f, %.0f }}", location, 0x2Au);
    }
    objc_destroyWeak(&v18);
    id m_ptr = self->_imageAnalysisContextMenuActionData.var0.__val_.copySubjectResult.m_ptr;
  }
  [m_ptr setAnalysis:a3];
  [self->_imageAnalysisDeferringGestureRecognizer.m_ptr setEnabled:0];
  [self->_actionToPerformAfterReceivingEditDragSnapshot.m_block setEnabled:0];
}

void __64__WKContentView_WKInteraction__installImageAnalysisInteraction___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained[492] addObject:a2];
    CFRelease(v4);
  }
}

- (void)uninstallImageAnalysisInteraction
{
  id m_ptr = self->_imageAnalysisContextMenuActionData.var0.__val_.copySubjectResult.m_ptr;
  if (m_ptr)
  {
    id v4 = qword_1EB358910;
    if (os_log_type_enabled((os_log_t)qword_1EB358910, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1985F2000, v4, OS_LOG_TYPE_DEFAULT, "Uninstalling image analysis interaction", v7, 2u);
      id m_ptr = self->_imageAnalysisContextMenuActionData.var0.__val_.copySubjectResult.m_ptr;
    }
    [(WKContentView *)self removeInteraction:m_ptr];
    [self->_imageAnalysisContextMenuActionData.var0.__val_.copySubjectResult.m_ptr setDelegate:0];
    [self->_imageAnalysisContextMenuActionData.var0.__val_.copySubjectResult.m_ptr setQuickActionConfigurationUpdateHandler:0];
    CGFloat v5 = self->_imageAnalysisContextMenuActionData.var0.__val_.copySubjectResult.m_ptr;
    self->_imageAnalysisContextMenuActionData.var0.__val_.copySubjectResult.id m_ptr = 0;
    if (v5) {
      CFRelease(v5);
    }
    CGFloat v6 = self->_imageAnalysisContextMenuActionData.var0.__val_.machineReadableCodeMenu.m_ptr;
    self->_imageAnalysisContextMenuActionData.var0.__val_.machineReadableCodeMenu.id m_ptr = 0;
    if (v6) {
      CFRelease(v6);
    }
    *(void *)&self->_imageAnalysisContextMenuActionData.__engaged_ = 0;
    *(void *)&self->_fullscreenVideoImageAnalysisRequestIdentifier = 0;
    [self->_imageAnalysisDeferringGestureRecognizer.m_ptr setEnabled:PAL::VisionKitCoreLibrary((PAL *)1) != 0];
    [self->_actionToPerformAfterReceivingEditDragSnapshot.m_block setEnabled:PAL::VisionKitCoreLibrary((PAL *)1) != 0];
  }
}

- (BOOL)_shouldAvoidSecurityHeuristicScoreUpdates
{
  return [self->_imageAnalysisContextMenuActionData.var0.__val_.copySubjectResult.m_ptr hasActiveTextSelection];
}

- (BOOL)isImageBacked
{
  id m_ptr = self->_page.m_ptr;
  return m_ptr && *(unsigned char *)(*((void *)m_ptr + 4) + 251) != 0;
}

- (void)willPresentEditMenuWithAnimator:(id)a3
{
  id v6 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3321888768;
  void v7[2] = __64__WKContentView_WKInteraction__willPresentEditMenuWithAnimator___block_invoke;
  v7[3] = &__block_descriptor_40_e8_32c79_ZTSKZ64__WKContentView_WKInteraction__willPresentEditMenuWithAnimator__E5__109_e5_v8__0l;
  objc_initWeak(&v6, self);
  id v8 = 0;
  objc_copyWeak(&v8, &v6);
  [a3 addCompletion:v7];
  objc_destroyWeak(&v6);
  CGFloat v5 = objc_msgSend(-[WKContentView webView](self, "webView"), "UIDelegate");
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v5, "webView:willPresentEditMenuWithAnimator:", -[WKContentView webView](self, "webView"), a3);
  }
  objc_destroyWeak(&v8);
}

void __64__WKContentView_WKInteraction__willPresentEditMenuWithAnimator___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[2996] = 1;
    CFRelease(WeakRetained);
  }
}

- (void)willDismissEditMenuWithAnimator:(id)a3
{
  id v6 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3321888768;
  void v7[2] = __64__WKContentView_WKInteraction__willDismissEditMenuWithAnimator___block_invoke;
  v7[3] = &__block_descriptor_40_e8_32c79_ZTSKZ64__WKContentView_WKInteraction__willDismissEditMenuWithAnimator__E5__110_e5_v8__0l;
  objc_initWeak(&v6, self);
  id v8 = 0;
  objc_copyWeak(&v8, &v6);
  [a3 addCompletion:v7];
  objc_destroyWeak(&v6);
  CGFloat v5 = objc_msgSend(-[WKContentView webView](self, "webView"), "UIDelegate");
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v5, "webView:willDismissEditMenuWithAnimator:", -[WKContentView webView](self, "webView"), a3);
  }
  objc_destroyWeak(&v8);
}

void __64__WKContentView_WKInteraction__willDismissEditMenuWithAnimator___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[2996] = 0;
    CFRelease(WeakRetained);
  }
}

- (BOOL)isPresentingEditMenu
{
  return self->_inspectorNodeSearchEnabled;
}

- (CGSize)sizeForLegacyFormControlPickerViews
{
  objc_msgSend((id)-[WKContentView window](self, "window"), "bounds");
  double v3 = v2;
  double v4 = 0.0;
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (void)_logMissingSystemInputDelegateIfNeeded:(const char *)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!objc_loadWeak((id *)&self->_anon_fb8[24]))
  {
    WTF::ApproximateTime::now(0);
    uint64_t v5 = *(void *)&v4;
    if (v4 - *(double *)&-[WKContentView(WKInteraction) _logMissingSystemInputDelegateIfNeeded:]::lastLoggingTimestamp > 10.0)
    {
      id v6 = qword_1EB358690;
      if (os_log_type_enabled((os_log_t)qword_1EB358690, OS_LOG_TYPE_ERROR))
      {
        int v7 = 136446210;
        id v8 = a3;
        _os_log_error_impl(&dword_1985F2000, v6, OS_LOG_TYPE_ERROR, "%{public}s - system input delegate is nil", (uint8_t *)&v7, 0xCu);
      }
      -[WKContentView(WKInteraction) _logMissingSystemInputDelegateIfNeeded:]::lastLoggingTimestamp = v5;
    }
  }
}

- (void)shiftKeyStateChangedFromState:(int64_t)a3 toState:(int64_t)a4
{
  if (self->_didAccessoryTabInitiateFocus) {
    return;
  }
  if (a3)
  {
    if (a3 == 2)
    {
      id v6 = [[WKSyntheticFlagsChangedWebEvent alloc] initWithCapsLockState:0];
    }
    else
    {
      if (a3 != 1)
      {
        int v7 = 0;
LABEL_10:
        [(WKContentView *)self _internalHandleKeyWebEvent:v7];
        if (v7) {
          CFRelease(v7);
        }
        goto LABEL_12;
      }
      id v6 = [[WKSyntheticFlagsChangedWebEvent alloc] initWithShiftState:0];
    }
    int v7 = v6;
    goto LABEL_10;
  }
LABEL_12:
  switch(a4)
  {
    case 0:
      return;
    case 2:
      id v8 = [[WKSyntheticFlagsChangedWebEvent alloc] initWithCapsLockState:1];
      goto LABEL_17;
    case 1:
      id v8 = [[WKSyntheticFlagsChangedWebEvent alloc] initWithShiftState:1];
LABEL_17:
      uint64_t v9 = v8;
      goto LABEL_19;
  }
  uint64_t v9 = 0;
LABEL_19:
  [(WKContentView *)self _internalHandleKeyWebEvent:v9];
  if (v9)
  {
    CFRelease(v9);
  }
}

- (void)insertTextAlternatives:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)[a3 primaryString];
  if (objc_msgSend((id)objc_msgSend(a3, "alternativeStrings"), "count"))
  {
    [v5 length];
    WebCore::TextAlternativeWithRange::TextAlternativeWithRange();
    id m_ptr = self->_page.m_ptr;
    MEMORY[0x19972EAD0](&v18, v5);
    long long v17 = xmmword_1994F6020;
    long long v21 = v19;
    CFTypeRef v22 = cf;
    if (cf) {
      CFRetain(cf);
    }
    WTF::Vector<WebCore::TextAlternativeWithRange,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector(v16, (uint64_t)&v21, 1uLL);
    __int16 v12 = 0;
    char v13 = 0;
    BOOL v14 = [(WKContentView *)self _shouldSimulateKeyboardInputOnTextInsertion];
    char v15 = 0;
    WebKit::WebPageProxy::insertDictatedTextAsync((WTF *)m_ptr, (uint64_t *)&v18, (uint64_t *)&v17, (unsigned int *)v16, (char *)&v12);
    WTF::Vector<WebKit::RemoteLayerTreeNode::CachedContentsBuffer,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((unsigned int *)v16, v7);
    uint64_t v9 = v22;
    CFTypeRef v22 = 0;
    if (v9) {
      CFRelease(v9);
    }
    double v10 = v18;
    id v18 = 0;
    if (v10)
    {
      if (*(_DWORD *)v10 == 2) {
        WTF::StringImpl::destroy(v10, v8);
      }
      else {
        *(_DWORD *)v10 -= 2;
      }
    }
    BYTE4(self->_dataListSuggestionsControl.m_weakReference) = 1;
    CFTypeRef v11 = cf;
    CFTypeRef cf = 0;
    if (v11) {
      CFRelease(v11);
    }
  }
  else
  {
    [(WKContentView *)self insertText:v5];
  }
}

- (void)insertText:(id)a3 textAlternatives:(id)a4 style:(int64_t)a5
{
}

- (BOOL)automaticallyPresentEditMenu
{
  return self->_suppressSelectionAssistantReasons.m_storage == 0;
}

- (id)asyncInputDelegate
{
  return objc_loadWeak((id *)&self->_anon_fb8[24]);
}

- (void)setAsyncInputDelegate:(id)a3
{
}

- (void)handleKeyEntry:(id)a3 withCompletionHandler:(id)a4
{
  int v7 = (const void *)[objc_alloc(MEMORY[0x1E4FB6DA8]) initWithKeyEntry:a3];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3321888768;
  v10[2] = __69__WKContentView_WKInteraction__handleKeyEntry_withCompletionHandler___block_invoke;
  v10[3] = &__block_descriptor_48_e8_32c84_ZTSKZ69__WKContentView_WKInteraction__handleKeyEntry_withCompletionHandler__E5__112_e21_v20__0__WebEvent_8B16l;
  if (a3) {
    CFRetain(a3);
  }
  id v8 = _Block_copy(a4);
  CFTypeRef cf = a3;
  if (a3) {
    CFRetain(a3);
  }
  aBlocuint64_t k = _Block_copy(v8);
  [(WKContentView *)self _internalHandleKeyWebEvent:v7 withCompletionHandler:v10];
  _Block_release(v8);
  if (a3) {
    CFRelease(a3);
  }
  _Block_release(aBlock);
  CFTypeRef v9 = cf;
  CFTypeRef cf = 0;
  if (v9) {
    CFRelease(v9);
  }
  if (v7) {
    CFRelease(v7);
  }
}

uint64_t __69__WKContentView_WKInteraction__handleKeyEntry_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)replaceText:(id)a3 withText:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  char v7 = a5;
  if (self) {
    CFRetain(self);
  }
  CFTypeRef v11 = _Block_copy(a6);
  __int16 v12 = (void *)WTF::fastMalloc((WTF *)0x18);
  *__int16 v12 = &unk_1EEA0F2D8;
  v12[1] = self;
  void v12[2] = v11;
  BOOL v14 = v12;
  [(WKContentView *)self _internalReplaceText:a3 withText:a4 isCandidate:v7 & 1 completion:&v14];
  char v13 = v14;
  BOOL v14 = 0;
  if (v13) {
    (*(void (**)(void *))(*v13 + 8))(v13);
  }
  _Block_release(0);
}

- (void)requestTextRectsForString:(id)a3 withCompletionHandler:(id)a4
{
  if (self) {
    CFRetain(self);
  }
  char v7 = _Block_copy(a4);
  id v8 = (void *)WTF::fastMalloc((WTF *)0x18);
  *id v8 = &unk_1EEA0F300;
  v8[1] = self;
  _DWORD v8[2] = v7;
  double v10 = v8;
  [(WKContentView *)self _internalRequestTextRectsForString:a3 completion:&v10];
  CFTypeRef v9 = v10;
  double v10 = 0;
  if (v9) {
    (*(void (**)(void *))(*v9 + 8))(v9);
  }
  _Block_release(0);
}

- (void)autoscrollToPoint:(CGPoint)a3
{
  CGPoint v6 = a3;
  id m_ptr = self->_page.m_ptr;
  WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)&v5, &v6);
  uint64_t v4 = *((void *)m_ptr + 32);
  char v7 = (float *)&v5;
  WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::StartAutoscrollAtPosition>(v4, &v7, *(void *)(*((void *)m_ptr + 4) + 1928), 0);
}

- (void)requestTextContextForAutocorrectionWithCompletionHandler:(id)a3
{
  if (a3)
  {
    uint64_t v4 = _Block_copy(a3);
    if (self) {
      CFRetain(self);
    }
    uint64_t v5 = (void *)WTF::fastMalloc((WTF *)0x18);
    void *v5 = &unk_1EEA0F328;
    v5[1] = v4;
    _DWORD v5[2] = self;
    char v7 = v5;
    [(WKContentView *)self _internalRequestAutocorrectionContextWithCompletionHandler:&v7];
    CGPoint v6 = v7;
    char v7 = 0;
    if (v6) {
      (*(void (**)(void *))(*v6 + 8))(v6);
    }
    _Block_release(0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"Expected a nonnull completion handler in %s.", "-[WKContentView(WKInteraction) requestTextContextForAutocorrectionWithCompletionHandler:]");
  }
}

- (void)selectTextForContextMenuWithLocationInView:(CGPoint)a3 completionHandler:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3321888768;
  _DWORD v8[2] = __93__WKContentView_WKInteraction__selectTextForContextMenuWithLocationInView_completionHandler___block_invoke;
  v8[3] = &__block_descriptor_40_e8_32c108_ZTSKZ93__WKContentView_WKInteraction__selectTextForContextMenuWithLocationInView_completionHandler__E5__116_e13_v20__0B8r_v12l;
  char v7 = _Block_copy(a4);
  aBlocuint64_t k = _Block_copy(v7);
  -[WKContentView _internalSelectTextForContextMenuWithLocationInView:completionHandler:](self, "_internalSelectTextForContextMenuWithLocationInView:completionHandler:", v8, x, y);
  _Block_release(v7);
  _Block_release(aBlock);
}

uint64_t __93__WKContentView_WKInteraction__selectTextForContextMenuWithLocationInView_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (*a3) {
    WTF::StringImpl::operator NSString *();
  }
  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v4();
}

- (void)deleteInDirection:(int64_t)a3 toGranularity:(int64_t)a4
{
  float v23[2] = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  BOOL v6 = a3 != 1 || a4 != 0;
  long long v20 = 0uLL;
  long long v21 = 0uLL;
  switch(a4)
  {
    case 0:
      char v7 = @"DeleteForward";
      id v8 = @"DeleteBackward";
      goto LABEL_14;
    case 1:
      char v7 = @"DeleteWordForward";
      id v8 = @"DeleteWordBackward";
      goto LABEL_14;
    case 2:
      double v10 = @"MoveToEndOfSentenceAndModifySelection";
      CFTypeRef v11 = @"MoveToBeginningOfSentenceAndModifySelection";
      goto LABEL_18;
    case 3:
      char v7 = @"DeleteToEndOfParagraph";
      id v8 = @"DeleteToBeginningOfParagraph";
      goto LABEL_14;
    case 4:
      char v7 = @"DeleteToEndOfLine";
      id v8 = @"DeleteToBeginningOfLine";
LABEL_14:
      if (a3 == 1) {
        char v7 = v8;
      }
      v23[0] = v7;
      __int16 v12 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v13 = 1;
      goto LABEL_21;
    case 5:
      double v10 = @"MoveToEndOfDocumentAndModifySelection";
      CFTypeRef v11 = @"MoveToBeginningOfDocumentAndModifySelection";
LABEL_18:
      if (a3 == 1) {
        double v10 = v11;
      }
      v23[0] = v10;
      v23[1] = @"DeleteBackward";
      __int16 v12 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v13 = 2;
LABEL_21:
      CFTypeRef v9 = objc_msgSend(v12, "arrayWithObjects:count:", v23, v13, (void)v18);
      break;
    default:
      CFTypeRef v9 = (void *)MEMORY[0x1E4F1CBF0];
      break;
  }
  uint64_t v14 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v9);
        }
        -[WKContentView _executeEditCommand:notifyDelegate:](self, "_executeEditCommand:notifyDelegate:", *(void *)(*((void *)&v18 + 1) + 8 * i), v6, (void)v18);
      }
      uint64_t v15 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v15);
  }
}

- (void)moveInStorageDirection:(int64_t)a3 byGranularity:(int64_t)a4
{
  void v21[2] = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  switch(a4)
  {
    case 0:
      uint64_t v5 = @"MoveForward";
      BOOL v6 = @"MoveBackward";
      goto LABEL_12;
    case 1:
      uint64_t v5 = @"MoveWordForward";
      BOOL v6 = @"MoveWordBackward";
      goto LABEL_12;
    case 2:
      uint64_t v5 = @"MoveToEndOfSentence";
      BOOL v6 = @"MoveToBeginningOfSentence";
      goto LABEL_12;
    case 3:
      id v8 = @"MoveForward";
      if (a3 == 1)
      {
        id v8 = @"MoveBackward";
        CFTypeRef v9 = @"MoveToBeginningOfParagraph";
      }
      else
      {
        CFTypeRef v9 = @"MoveToEndOfParagraph";
      }
      v21[0] = v8;
      v21[1] = v9;
      double v10 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v11 = 2;
      goto LABEL_15;
    case 4:
      uint64_t v5 = @"MoveToEndOfLine";
      BOOL v6 = @"MoveToBeginningOfLine";
      goto LABEL_12;
    case 5:
      uint64_t v5 = @"MoveToEndOfDocument";
      BOOL v6 = @"MoveToBeginningOfDocument";
LABEL_12:
      if (a3 == 1) {
        uint64_t v5 = v6;
      }
      v21[0] = v5;
      double v10 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v11 = 1;
LABEL_15:
      char v7 = objc_msgSend(v10, "arrayWithObjects:count:", v21, v11, (void)v16);
      break;
    default:
      char v7 = 0;
      break;
  }
  uint64_t v12 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v7);
        }
        -[WKContentView _executeEditCommand:](self, "_executeEditCommand:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
      }
      uint64_t v13 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

- (void)moveInLayoutDirection:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 3) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = *((void *)&off_1E5814140 + a3 - 2);
  }
  [(WKContentView *)self _executeEditCommand:v3];
}

- (void)extendInStorageDirection:(int64_t)a3 byGranularity:(int64_t)a4
{
  void v21[2] = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  switch(a4)
  {
    case 0:
      uint64_t v5 = @"MoveForwardAndModifySelection";
      BOOL v6 = @"MoveBackwardAndModifySelection";
      goto LABEL_12;
    case 1:
      uint64_t v5 = @"MoveWordForwardAndModifySelection";
      BOOL v6 = @"MoveWordBackwardAndModifySelection";
      goto LABEL_12;
    case 2:
      uint64_t v5 = @"MoveToEndOfSentenceAndModifySelection";
      BOOL v6 = @"MoveToBeginningOfSentenceAndModifySelection";
      goto LABEL_12;
    case 3:
      id v8 = @"MoveForwardAndModifySelection";
      if (a3 == 1)
      {
        id v8 = @"MoveBackwardAndModifySelection";
        CFTypeRef v9 = @"MoveToBeginningOfParagraphAndModifySelection";
      }
      else
      {
        CFTypeRef v9 = @"MoveToEndOfParagraphAndModifySelection";
      }
      v21[0] = v8;
      v21[1] = v9;
      double v10 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v11 = 2;
      goto LABEL_15;
    case 4:
      uint64_t v5 = @"MoveToEndOfLineAndModifySelection";
      BOOL v6 = @"MoveToBeginningOfLineAndModifySelection";
      goto LABEL_12;
    case 5:
      uint64_t v5 = @"MoveToEndOfDocumentAndModifySelection";
      BOOL v6 = @"MoveToBeginningOfDocumentAndModifySelection";
LABEL_12:
      if (a3 == 1) {
        uint64_t v5 = v6;
      }
      v21[0] = v5;
      double v10 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v11 = 1;
LABEL_15:
      char v7 = objc_msgSend(v10, "arrayWithObjects:count:", v21, v11, (void)v16);
      break;
    default:
      char v7 = 0;
      break;
  }
  uint64_t v12 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v7);
        }
        -[WKContentView _executeEditCommand:](self, "_executeEditCommand:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
      }
      uint64_t v13 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

- (void)extendInLayoutDirection:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 3) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = *((void *)&off_1E5814160 + a3 - 2);
  }
  [(WKContentView *)self _executeEditCommand:v3];
}

- (void)_internalAdjustSelectionWithOffset:(int64_t)a3 lengthDelta:(int64_t)a4 completionHandler:(id)a5
{
  id m_ptr = self->_page.m_ptr;
  id v8 = _Block_copy(a5);
  CFTypeRef v9 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v9 = &unk_1EEA0F350;
  v9[1] = v8;
  uint64_t v11 = v9;
  WebKit::WebPageProxy::updateSelectionWithDelta((uint64_t)m_ptr, a3, a4, (uint64_t *)&v11);
  uint64_t v10 = (uint64_t)v11;
  uint64_t v11 = 0;
  if (v10) {
    (*(void (**)(uint64_t))(*(void *)v10 + 8))(v10);
  }
  _Block_release(0);
}

- (void)transposeCharactersAroundSelection
{
}

- (BOOL)selectionAtDocumentStart
{
  uint64_t v2 = *((void *)self->_page.m_ptr + 4);
  return *(unsigned char *)(v2 + 576) && *(_DWORD *)(v2 + 332) == 0;
}

- (BOOL)shouldSuppressEditMenu
{
  return self->_suppressSelectionAssistantReasons.m_storage != 0;
}

- (void)targetedPreviewForID:(id)a3 completionHandler:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  WTF::UUID::fromNSUUID(v11, (WTF::UUID *)a3, (NSUUID *)a2);
  if (!v12) {
    __break(1u);
  }
  id m_ptr = self->_page.m_ptr;
  CFRetain(self);
  char v7 = _Block_copy(a4);
  id v8 = (void *)WTF::fastMalloc((WTF *)0x18);
  *id v8 = &unk_1EEA0F378;
  v8[1] = self;
  _DWORD v8[2] = v7;
  uint64_t v10 = v8;
  WebKit::WebPageProxy::getTextIndicatorForID((uint64_t)m_ptr, v11, (uint64_t *)&v10);
  uint64_t v9 = (uint64_t)v10;
  uint64_t v10 = 0;
  if (v9) {
    (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
  }
  _Block_release(0);
}

- (void)updateUnderlyingTextVisibilityForTextAnimationID:(id)a3 visible:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = (WTF::UUID *)objc_msgSend(self->_editDropCaretView.m_ptr, "objectForKeyedSubscript:");
  WTF::UUID::fromNSUUID((uint64_t *)&v18, (WTF::UUID *)a3, v10);
  if (v9)
  {
    WTF::UUID::fromNSUUID((uint64_t *)&v16, v9, v11);
    long long v18 = v16;
    char v19 = v17;
  }
  if (!v19) {
    __break(1u);
  }
  id m_ptr = self->_page.m_ptr;
  uint64_t v13 = _Block_copy(a5);
  uint64_t v14 = (void *)WTF::fastMalloc((WTF *)0x10);
  *uint64_t v14 = &unk_1EEA0F3A0;
  v14[1] = v13;
  *(void *)&long long v16 = v14;
  WebKit::WebPageProxy::updateUnderlyingTextVisibilityForTextAnimationID((uint64_t)m_ptr, (uint64_t)&v18, a4, (uint64_t *)&v16);
  uint64_t v15 = v16;
  *(void *)&long long v16 = 0;
  if (v15) {
    (*(void (**)(uint64_t))(*(void *)v15 + 8))(v15);
  }
  _Block_release(0);
}

- (void)callCompletionHandlerForAnimationID:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (WTF::UUID *)[self->_editDropCaretView.m_ptr objectForKeyedSubscript:a3];
  if (v4)
  {
    WTF::UUID::fromNSUUID(v6, v4, v5);
    if (!v7) {
      __break(1u);
    }
    WebKit::WebPageProxy::callCompletionHandlerForAnimationID((uint64_t *)self->_page.m_ptr, v6);
  }
}

- (void)callCompletionHandlerForAnimationID:(id)a3 completionHandler:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  WTF::UUID::fromNSUUID(v12, (WTF::UUID *)a3, (NSUUID *)a2);
  if (!v13) {
    goto LABEL_6;
  }
  id m_ptr = self->_page.m_ptr;
  CFRetain(self);
  char v7 = _Block_copy(a4);
  uint64_t v8 = (void *)WTF::fastMalloc((WTF *)0x18);
  *uint64_t v8 = &unk_1EEA0F3C8;
  v8[1] = self;
  _DWORD v8[2] = v7;
  uint64_t v10 = v8;
  WTF::HashMap<WTF::UUID,WTF::CompletionHandler<void ()(std::optional<WebCore::TextIndicatorData>)>,WTF::DefaultHash<WTF::UUID>,WTF::HashTraits<WTF::UUID>,WTF::HashTraits<WTF::CompletionHandler<void ()(std::optional<WebCore::TextIndicatorData>)>>,WTF::HashTableTraits>::add<WTF::CompletionHandler<void ()(std::optional<WebCore::TextIndicatorData>)>>((uint64_t *)(*((void *)m_ptr + 4) + 2240), v12, (uint64_t *)&v10, (uint64_t)v11);
  uint64_t v9 = (uint64_t)v10;
  uint64_t v10 = 0;
  if (v9) {
    (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
  }
  _Block_release(0);
  if (!v13) {
LABEL_6:
  }
    __break(1u);
  WebKit::WebPageProxy::callCompletionHandlerForAnimationID((uint64_t *)self->_page.m_ptr, v12);
}

- (void)replacementEffectDidComplete
{
}

- (void)willPresentWritingTools
{
  self->_isPresentingWritingTools = 1;
  [(WKFormAccessoryView *)[(WKContentView *)self formAccessoryView] setHidden:1];

  [(WKContentView *)self reloadInputViews];
}

- (void)didDismissWritingTools
{
  self->_isPresentingWritingTools = 0;
  [(WKFormAccessoryView *)[(WKContentView *)self formAccessoryView] setHidden:0];

  [(WKContentView *)self reloadInputViews];
}

- (unint64_t)writingToolsAllowedInputOptions
{
  id Weak = objc_loadWeak(&self->_webView.m_weakReference);

  return [Weak allowedWritingToolsResultOptions];
}

- (unint64_t)allowedWritingToolsResultOptions
{
  id Weak = objc_loadWeak(&self->_webView.m_weakReference);

  return [Weak allowedWritingToolsResultOptions];
}

- (int64_t)writingToolsBehavior
{
  id Weak = objc_loadWeak(&self->_webView.m_weakReference);

  return [Weak writingToolsBehavior];
}

- (void)willBeginWritingToolsSession:(id)a3 requestContexts:(id)a4
{
  id Weak = objc_loadWeak(&self->_webView.m_weakReference);

  [Weak willBeginWritingToolsSession:a3 requestContexts:a4];
}

- (void)didBeginWritingToolsSession:(id)a3 contexts:(id)a4
{
  id Weak = objc_loadWeak(&self->_webView.m_weakReference);

  [Weak didBeginWritingToolsSession:a3 contexts:a4];
}

- (void)proofreadingSession:(id)a3 didReceiveSuggestions:(id)a4 processedRange:(_NSRange)a5 inContext:(id)a6 finished:(BOOL)a7
{
  BOOL v7 = a7;
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id Weak = objc_loadWeak(&self->_webView.m_weakReference);

  objc_msgSend(Weak, "proofreadingSession:didReceiveSuggestions:processedRange:inContext:finished:", a3, a4, location, length, a6, v7);
}

- (void)proofreadingSession:(id)a3 didUpdateState:(int64_t)a4 forSuggestionWithUUID:(id)a5 inContext:(id)a6
{
  id Weak = objc_loadWeak(&self->_webView.m_weakReference);

  [Weak proofreadingSession:a3 didUpdateState:a4 forSuggestionWithUUID:a5 inContext:a6];
}

- (void)didEndWritingToolsSession:(id)a3 accepted:(BOOL)a4
{
  BOOL v4 = a4;
  id Weak = objc_loadWeak(&self->_webView.m_weakReference);

  [Weak didEndWritingToolsSession:a3 accepted:v4];
}

- (void)compositionSession:(id)a3 didReceiveText:(id)a4 replacementRange:(_NSRange)a5 inContext:(id)a6 finished:(BOOL)a7
{
  BOOL v7 = a7;
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id Weak = objc_loadWeak(&self->_webView.m_weakReference);

  objc_msgSend(Weak, "compositionSession:didReceiveText:replacementRange:inContext:finished:", a3, a4, location, length, a6, v7);
}

- (void)writingToolsSession:(id)a3 didReceiveAction:(int64_t)a4
{
  id Weak = objc_loadWeak(&self->_webView.m_weakReference);

  [Weak writingToolsSession:a3 didReceiveAction:a4];
}

- (void)addTextAnimationForAnimationID:(id)a3 withData:(const TextAnimationData *)a4
{
  uint64_t v8 = *((void *)self->_page.m_ptr + 34);
  {
    WebKit::WebPreferencesKey::textAnimationsEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::textAnimationsEnabledKey(void)::kedouble y = (uint64_t)&WebKit::WebPreferencesKey::textAnimationsEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  if (WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)(v8 + 40), (WTF::StringImpl **)&WebKit::WebPreferencesKey::textAnimationsEnabledKey(void)::key, (const WTF::StringImpl *)a3))
  {
    if (a4->var0 == 2) {
      [self->_editDropCaretView.m_ptr setObject:a3 forKey:WTF::UUID::operator NSUUID *()];
    }
    id m_ptr = self->_textAnimationManager.m_ptr;
    if (!m_ptr)
    {
      id m_ptr = (void *)[objc_alloc((Class)WebKit::getWKSTextAnimationManagerClass[0](0)) initWithDelegate:self];
      uint64_t v10 = self->_textAnimationManager.m_ptr;
      self->_textAnimationManager.id m_ptr = m_ptr;
      if (v10)
      {
        CFRelease(v10);
        id m_ptr = self->_textAnimationManager.m_ptr;
      }
    }
    int var0 = a4->var0;
    if (var0 == 2) {
      uint64_t v12 = 2;
    }
    else {
      uint64_t v12 = var0 == 1;
    }
    [m_ptr addTextAnimationForAnimationID:a3 withStyleType:v12];
  }
}

- (void)removeTextAnimationForAnimationID:(id)a3
{
  if (a3)
  {
    uint64_t v5 = *((void *)self->_page.m_ptr + 34);
    {
      WebKit::WebPreferencesKey::textAnimationsEnabledKey(void)::$_0::operator() const(void)::impl += 2;
      WebKit::WebPreferencesKey::textAnimationsEnabledKey(void)::kedouble y = (uint64_t)&WebKit::WebPreferencesKey::textAnimationsEnabledKey(void)::$_0::operator() const(void)::impl;
    }
    if (WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)(v5 + 40), (WTF::StringImpl **)&WebKit::WebPreferencesKey::textAnimationsEnabledKey(void)::key, (const WTF::StringImpl *)a3))
    {
      id m_ptr = self->_textAnimationManager.m_ptr;
      if (m_ptr)
      {
        [m_ptr removeTextAnimationForAnimationID:a3];
      }
    }
  }
}

- (BOOL)supportsAdaptiveImageGlyph
{
  if ((objc_msgSend(-[WKContentView webView](self, "webView"), "_isEditable") & 1) != 0
    || (int v3 = objc_msgSend((id)objc_msgSend(-[WKContentView webView](self, "webView"), "configuration"), "_multiRepresentationHEICInsertionEnabled")) != 0)
  {
    LOBYTE(v3) = *(unsigned char *)(*((void *)self->_page.m_ptr + 4) + 254) != 0;
  }
  return v3;
}

- (void)insertAdaptiveImageGlyph:(id)a3 replacementRange:(id)a4
{
  id m_ptr = self->_page.m_ptr;
  BOOL v6 = (NSData *)[a3 imageContent];
  BOOL v7 = (NSString *)[a3 contentDescription];

  WebKit::WebPageProxy::insertMultiRepresentationHEIC((WebKit::WebPageProxy *)m_ptr, v6, v7);
}

- (void)_closeCurrentTypingCommand
{
  id m_ptr = self->_page.m_ptr;
  if (m_ptr) {
    WebKit::WebPageProxy::closeCurrentTypingCommand((uint64_t)m_ptr);
  }
}

- (void)selectWordBackwardForTesting
{
  BYTE4(self->_dataListSuggestionsControl.m_weakReference) = 1;
  id m_ptr = self->_page.m_ptr;
  uint64_t v3 = *((void *)m_ptr + 32);
  char v4 = 0;
  WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::SelectWordBackward>(v3, (uint64_t)&v4, *(void *)(*((void *)m_ptr + 4) + 1928), 0);
}

- (void)_doAfterReceivingEditDragSnapshotForTesting:(id)a3
{
  if (self->_treatAsContentEditableUntilNextEditorStateUpdate)
  {
    char v4 = _Block_copy(a3);
    _Block_release(*(const void **)&self->_isAnimatingDragCancel);
    *(void *)&self->_isAnimatingDragCancel = v4;
    _Block_release(0);
  }
  else
  {
    uint64_t v5 = (void (*)(id))*((void *)a3 + 2);
    v5(a3);
  }
}

- (WKDateTimeInputControl)dateTimeInputControl
{
  if (objc_opt_isKindOfClass()) {
    return (WKDateTimeInputControl *)self->_inputPeripheral.m_ptr;
  }
  else {
    return 0;
  }
}

- (WKFormSelectControl)selectControl
{
  if (objc_opt_isKindOfClass()) {
    return (WKFormSelectControl *)self->_inputPeripheral.m_ptr;
  }
  else {
    return 0;
  }
}

- (BOOL)isAnimatingDragCancel
{
  return (BOOL)self->_dragDropInteractionState.m_finalDropPreviews.m_impl.var0.m_table;
}

- (void)_simulateElementAction:(int64_t)a3 atLocation:(CGPoint)a4
{
  CGPoint v15 = a4;
  uint64_t v4 = *((void *)self->_page.m_ptr + 29);
  if (*(unsigned char *)(v4 + 36))
  {
    __break(0xC471u);
    JUMPOUT(0x199463838);
  }
  *(void *)&self->_keyWebEventHandlers.m_inlineBuffer[0].__lx[32] = *(void *)(v4 + 112);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3321888768;
  _OWORD v13[2] = __62__WKContentView_WKTesting___simulateElementAction_atLocation___block_invoke;
  void v13[3] = &__block_descriptor_56_e8_32c77_ZTSKZ62__WKContentView_WKTesting___simulateElementAction_atLocation__E5__121_e6320_v648__0_InteractionInformationAtPosition__InteractionInformationRequest__IntPoint_ii_BBBBBBB_B_optional_BOOL_____cB_B_CBBBBBBBBBBBBB_Markable_WebCore::ProcessQualified_WTF::ObjectIdentifierGeneric_WebCore::ScrollingNodeIDType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::Yes____WebCore::ProcessQualified_WTF::ObjectIdentifierGeneric_WebCore::ScrollingNodeIDType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::Yes__::MarkableTraits___ProcessQualified_WTF::ObjectIdentifierGeneric_WebCore::ScrollingNodeIDType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::Yes____ObjectIdentifierGeneric_WebCore::ScrollingNodeIDType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::Yes__Q__ObjectIdentifierGeneric_WebCore::ProcessIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::Yes__Q___BBBBBB_FloatPoint_ff__URL__String__RefPtr_WTF::StringImpl__WTF::RawPtrTraits_WTF::StringImpl___WTF::DefaultRefDerefTraits_WTF::StringImpl_____StringImpl___b1b1b1b3b26IIIIIII__URL__String__RefPtr_WTF::StringImpl__WTF::RawPtrTraits_WTF::StringImpl___WTF::DefaultRefDerefTraits_WTF::StringImpl_____StringImpl___b1b1b1b3b26IIIIIII__String__RefPtr_WTF::StringImpl__WTF::RawPtrTraits_WTF::StringImpl___WTF::DefaultRefDerefTraits_WTF::StringImpl_____StringImpl____String__RefPtr_WTF::StringImpl__WTF::RawPtrTraits_WTF::StringImpl___WTF::DefaultRefDerefTraits_WTF::StringImpl_____StringImpl____String__RefPtr_WTF::StringImpl__WTF::RawPtrTraits_WTF::StringImpl___WTF::DefaultRefDerefTraits_WTF::StringImpl_____StringImpl____IntRect__IntPoint_ii__IntSize_ii___RefPtr_WebCore::ShareableBitmap__WTF::RawPtrTraits_WebCore::ShareableBitmap___WTF::DefaultRefDerefTraits_WebCore::ShareableBitmap_____ShareableBitmap___String__RefPtr_WTF::StringImpl__WTF::RawPtrTraits_WTF::StringImpl___WTF::DefaultRefDerefTraits_WTF::StringImpl_____StringImpl____String__RefPtr_WTF::StringImpl__WTF::RawPtrTraits_WTF::StringImpl___WTF::DefaultRefDerefTraits_WTF::StringImpl_____StringImpl___f_FloatRect__FloatPoint_ff__FloatSize_ff___optional_WebCore::Cursor_____c_Cursor_C_RefPtr_WebCore::Image__WTF::RawPtrTraits_WebCore::Image___WTF::DefaultRefDerefTraits_WebCore::Image_____Image___IntPoint_ii__v__B__TextIndicatorData__FloatRect__FloatPoint_ff__FloatSize_ff___FloatRect__FloatPoint_ff__FloatSize_ff___FloatRect__FloatPoint_ff__FloatSize_ff___Vector_WebCore::FloatRect__0UL__WTF::CrashOnOverflow__16UL__WTF::FastMalloc____FloatRect_II_f_RefPtr_WebCore::Image__WTF::RawPtrTraits_WebCore::Image___WTF::DefaultRefDerefTraits_WebCore::Image_____Image___RefPtr_WebCore::Image__WTF::RawPtrTraits_WebCore::Image___WTF::DefaultRefDerefTraits_WebCore::Image_____Image___RefPtr_WebCore::Image__WTF::RawPtrTraits_WebCore::Image___WTF::DefaultRefDerefTraits_WebCore::Image_____Image___Color_Q_C_OptionSet_WebCore::TextIndicatorOption__S___String__RefPtr_WTF::StringImpl__WTF::RawPtrTraits_WTF::StringImpl___WTF::DefaultRefDerefTraits_WTF::StringImpl_____StringImpl____RetainPtr_NSArray___v__IntRect__IntPoint_ii__IntSize_ii___optional_WebCore::ElementContext_____c_ElementContext__FloatRect__FloatPoint_ff__FloatSize_ff___Markable_WTF::ObjectIdentifierGeneric_WebCore::PageIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No___WTF::ObjectIdentifierGeneric_WebCore::PageIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No_::MarkableTraits___ObjectIdentifierGeneric_WebCore::PageIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No__Q___ProcessQualified_WTF::UUID___UUID_T__ObjectIdentifierGeneric_WebCore::ProcessIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::Yes__Q___Markable_WTF::ObjectIdentifierGeneric_WebCore::ElementIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No___WTF::ObjectIdentifierGeneric_WebCore::ElementIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No_::MarkableTraits___ObjectIdentifierGeneric_WebCore::ElementIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No__Q____B__optional_WebCore::ElementContext_____c_ElementContext__FloatRect__FloatPoint_ff__FloatSize_ff___Markable_WTF::ObjectIdentifierGeneric_WebCore::PageIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No___WTF::ObjectIdentifierGeneric_WebCore::PageIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No_::MarkableTraits___ObjectIdentifierGeneric_WebCore::PageIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No__Q___ProcessQualified_WTF::UUID___UUID_T__ObjectIdentifierGeneric_WebCore::ProcessIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::Yes__Q___Markable_WTF::ObjectIdentifierGeneric_WebCore::ElementIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No___WTF::ObjectIdentifierGeneric_WebCore::ElementIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No_::MarkableTraits___ObjectIdentifierGeneric_WebCore::ElementIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No__Q____B__Vector_WebCore::ElementAnimationContext__0UL__WTF::CrashOnOverflow__16UL__WTF::FastMalloc____ElementAnimationContext_II__8l;
  CFRetain(self);
  void v13[4] = a3;
  v13[5] = self;
  CFTypeRef cf = self;
  CFRetain(self);
  WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v12, &v15);
  float v7 = roundf(v12[0]);
  if (v7 >= 2147500000.0)
  {
    uint64_t v8 = 0x7FFFFFFFLL;
  }
  else if (v7 <= -2147500000.0)
  {
    uint64_t v8 = 0x80000000;
  }
  else
  {
    uint64_t v8 = (int)v7;
  }
  float v9 = roundf(v12[1]);
  if (v9 >= 2147500000.0)
  {
    unint64_t v10 = 0x7FFFFFFF00000000;
  }
  else if (v9 <= -2147500000.0)
  {
    unint64_t v10 = 0x8000000000000000;
  }
  else
  {
    unint64_t v10 = (unint64_t)(int)v9 << 32;
  }
  -[WKContentView doAfterPositionInformationUpdate:forRequest:](self, "doAfterPositionInformationUpdate:forRequest:", v13, v10 | v8, 0x1000000);
  CFRelease(self);
  CFTypeRef v11 = cf;
  CFTypeRef cf = 0;
  if (v11) {
    CFRelease(v11);
  }
}

uint64_t __62__WKContentView_WKTesting___simulateElementAction_atLocation___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = +[_WKActivatedElementInfo activatedElementInfoWithInteractionInformationAtPosition:a2 userInfo:0];
  id v4 = +[_WKElementAction _elementActionWithType:*(void *)(a1 + 32) info:v3 assistant:*(void *)(*(void *)(a1 + 40) + 824)];

  return [v4 runActionWithElementInfo:v3];
}

- (void)_simulateLongPressActionAtLocation:(CGPoint)a3
{
  CGPoint v12 = a3;
  if (self) {
    CFRetain(self);
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3321888768;
  v10[2] = __63__WKContentView_WKTesting___simulateLongPressActionAtLocation___block_invoke;
  v10[3] = &__block_descriptor_40_e8_32c78_ZTSKZ63__WKContentView_WKTesting___simulateLongPressActionAtLocation__E5__122_e6320_v648__0_InteractionInformationAtPosition__InteractionInformationRequest__IntPoint_ii_BBBBBBB_B_optional_BOOL_____cB_B_CBBBBBBBBBBBBB_Markable_WebCore::ProcessQualified_WTF::ObjectIdentifierGeneric_WebCore::ScrollingNodeIDType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::Yes____WebCore::ProcessQualified_WTF::ObjectIdentifierGeneric_WebCore::ScrollingNodeIDType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::Yes__::MarkableTraits___ProcessQualified_WTF::ObjectIdentifierGeneric_WebCore::ScrollingNodeIDType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::Yes____ObjectIdentifierGeneric_WebCore::ScrollingNodeIDType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::Yes__Q__ObjectIdentifierGeneric_WebCore::ProcessIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::Yes__Q___BBBBBB_FloatPoint_ff__URL__String__RefPtr_WTF::StringImpl__WTF::RawPtrTraits_WTF::StringImpl___WTF::DefaultRefDerefTraits_WTF::StringImpl_____StringImpl___b1b1b1b3b26IIIIIII__URL__String__RefPtr_WTF::StringImpl__WTF::RawPtrTraits_WTF::StringImpl___WTF::DefaultRefDerefTraits_WTF::StringImpl_____StringImpl___b1b1b1b3b26IIIIIII__String__RefPtr_WTF::StringImpl__WTF::RawPtrTraits_WTF::StringImpl___WTF::DefaultRefDerefTraits_WTF::StringImpl_____StringImpl____String__RefPtr_WTF::StringImpl__WTF::RawPtrTraits_WTF::StringImpl___WTF::DefaultRefDerefTraits_WTF::StringImpl_____StringImpl____String__RefPtr_WTF::StringImpl__WTF::RawPtrTraits_WTF::StringImpl___WTF::DefaultRefDerefTraits_WTF::StringImpl_____StringImpl____IntRect__IntPoint_ii__IntSize_ii___RefPtr_WebCore::ShareableBitmap__WTF::RawPtrTraits_WebCore::ShareableBitmap___WTF::DefaultRefDerefTraits_WebCore::ShareableBitmap_____ShareableBitmap___String__RefPtr_WTF::StringImpl__WTF::RawPtrTraits_WTF::StringImpl___WTF::DefaultRefDerefTraits_WTF::StringImpl_____StringImpl____String__RefPtr_WTF::StringImpl__WTF::RawPtrTraits_WTF::StringImpl___WTF::DefaultRefDerefTraits_WTF::StringImpl_____StringImpl___f_FloatRect__FloatPoint_ff__FloatSize_ff___optional_WebCore::Cursor_____c_Cursor_C_RefPtr_WebCore::Image__WTF::RawPtrTraits_WebCore::Image___WTF::DefaultRefDerefTraits_WebCore::Image_____Image___IntPoint_ii__v__B__TextIndicatorData__FloatRect__FloatPoint_ff__FloatSize_ff___FloatRect__FloatPoint_ff__FloatSize_ff___FloatRect__FloatPoint_ff__FloatSize_ff___Vector_WebCore::FloatRect__0UL__WTF::CrashOnOverflow__16UL__WTF::FastMalloc____FloatRect_II_f_RefPtr_WebCore::Image__WTF::RawPtrTraits_WebCore::Image___WTF::DefaultRefDerefTraits_WebCore::Image_____Image___RefPtr_WebCore::Image__WTF::RawPtrTraits_WebCore::Image___WTF::DefaultRefDerefTraits_WebCore::Image_____Image___RefPtr_WebCore::Image__WTF::RawPtrTraits_WebCore::Image___WTF::DefaultRefDerefTraits_WebCore::Image_____Image___Color_Q_C_OptionSet_WebCore::TextIndicatorOption__S___String__RefPtr_WTF::StringImpl__WTF::RawPtrTraits_WTF::StringImpl___WTF::DefaultRefDerefTraits_WTF::StringImpl_____StringImpl____RetainPtr_NSArray___v__IntRect__IntPoint_ii__IntSize_ii___optional_WebCore::ElementContext_____c_ElementContext__FloatRect__FloatPoint_ff__FloatSize_ff___Markable_WTF::ObjectIdentifierGeneric_WebCore::PageIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No___WTF::ObjectIdentifierGeneric_WebCore::PageIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No_::MarkableTraits___ObjectIdentifierGeneric_WebCore::PageIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No__Q___ProcessQualified_WTF::UUID___UUID_T__ObjectIdentifierGeneric_WebCore::ProcessIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::Yes__Q___Markable_WTF::ObjectIdentifierGeneric_WebCore::ElementIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No___WTF::ObjectIdentifierGeneric_WebCore::ElementIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No_::MarkableTraits___ObjectIdentifierGeneric_WebCore::ElementIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No__Q____B__optional_WebCore::ElementContext_____c_ElementContext__FloatRect__FloatPoint_ff__FloatSize_ff___Markable_WTF::ObjectIdentifierGeneric_WebCore::PageIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No___WTF::ObjectIdentifierGeneric_WebCore::PageIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No_::MarkableTraits___ObjectIdentifierGeneric_WebCore::PageIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No__Q___ProcessQualified_WTF::UUID___UUID_T__ObjectIdentifierGeneric_WebCore::ProcessIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::Yes__Q___Markable_WTF::ObjectIdentifierGeneric_WebCore::ElementIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No___WTF::ObjectIdentifierGeneric_WebCore::ElementIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No_::MarkableTraits___ObjectIdentifierGeneric_WebCore::ElementIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No__Q____B__Vector_WebCore::ElementAnimationContext__0UL__WTF::CrashOnOverflow__16UL__WTF::FastMalloc____ElementAnimationContext_II__8l;
  if (self)
  {
    CFRetain(self);
    CFTypeRef cf = self;
    CFRetain(self);
  }
  else
  {
    CFTypeRef cf = 0;
  }
  WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v9, &v12);
  float v4 = roundf(v9[0]);
  if (v4 >= 2147500000.0)
  {
    uint64_t v5 = 0x7FFFFFFFLL;
  }
  else
  {
    uint64_t v5 = 0x80000000;
    if (v4 > -2147500000.0) {
      uint64_t v5 = (int)v4;
    }
  }
  float v6 = roundf(v9[1]);
  if (v6 >= 2147500000.0)
  {
    unint64_t v7 = 0x7FFFFFFF00000000;
  }
  else if (v6 <= -2147500000.0)
  {
    unint64_t v7 = 0x8000000000000000;
  }
  else
  {
    unint64_t v7 = (unint64_t)(int)v6 << 32;
  }
  -[WKContentView doAfterPositionInformationUpdate:forRequest:](self, "doAfterPositionInformationUpdate:forRequest:", v10, v7 | v5, 0x1000000);
  if (self) {
    CFRelease(self);
  }
  CFTypeRef v8 = cf;
  CFTypeRef cf = 0;
  if (v8) {
    CFRelease(v8);
  }
  if (self) {
    CFRelease(self);
  }
}

uint64_t __63__WKContentView_WKTesting___simulateLongPressActionAtLocation___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _actionForLongPress];
  if (result)
  {
    uint64_t v3 = result;
    float v4 = *(void **)(a1 + 32);
    return [v4 performSelector:v3];
  }
  return result;
}

- (void)selectFormAccessoryPickerRow:(int64_t)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id m_ptr = self->_inputPeripheral.m_ptr;
    [m_ptr selectRow:a3 inComponent:0 extendingSelection:0];
  }
}

- (BOOL)selectFormAccessoryHasCheckedItemAtRow:(int64_t)a3
{
  self;
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id m_ptr = self->_inputPeripheral.m_ptr;

  return [m_ptr selectFormAccessoryHasCheckedItemAtRow:a3];
}

- (void)setSelectedColorForColorPicker:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id m_ptr = self->_inputPeripheral.m_ptr;
    [m_ptr selectColor:a3];
  }
}

- (NSString)textContentTypeForTesting
{
  if ([(WKContentView *)self _requiresLegacyTextInputTraits]) {
    id v3 = [(WKContentView *)self textInputTraits];
  }
  else {
    id v3 = [(WKContentView *)self extendedTraitsDelegate];
  }

  return (NSString *)[v3 textContentType];
}

- (NSString)selectFormPopoverTitle
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id m_ptr = self->_inputPeripheral.m_ptr;

  return (NSString *)[m_ptr selectFormPopoverTitle];
}

- (NSString)formInputLabel
{
  return 0;
}

- (void)setTimePickerValueToHour:(int64_t)a3 minute:(int64_t)a4
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id m_ptr = self->_inputPeripheral.m_ptr;
    [m_ptr setTimePickerHour:a3 minute:a4];
  }
}

- (double)timePickerValueHour
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return -1.0;
  }
  id m_ptr = self->_inputPeripheral.m_ptr;

  [m_ptr timePickerValueHour];
  return result;
}

- (double)timePickerValueMinute
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return -1.0;
  }
  id m_ptr = self->_inputPeripheral.m_ptr;

  [m_ptr timePickerValueMinute];
  return result;
}

- (id)_contentsOfUserInterfaceItem:(id)a3
{
  v45[1] = *MEMORY[0x1E4F143B8];
  if ([a3 isEqualToString:@"actionSheet"])
  {
    id v44 = a3;
    v45[0] = [self->_actionSheetAssistant.m_ptr currentlyAvailableActionTitles];
    return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:&v44 count:1];
  }
  if (![a3 isEqualToString:@"contextMenu"])
  {
    if ([a3 isEqualToString:@"mediaControlsContextMenu"])
    {
      id v34 = a3;
      uint64_t v35 = [self->_actionSheetAssistant.m_ptr currentlyAvailableMediaControlsContextMenuItems];
      return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    }
    else if ([a3 isEqualToString:@"fileUploadPanelMenu"])
    {
      id m_ptr = self->_fileUploadPanel.m_ptr;
      if (m_ptr)
      {
        id v30 = a3;
        uint64_t v31 = [m_ptr currentAvailableActionTitles];
        return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      }
      else
      {
        id v32 = a3;
        uint64_t v33 = MEMORY[0x1E4F1CBF0];
        return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
      }
    }
    else
    {
      if (![a3 isEqualToString:@"selectMenu"]) {
        return 0;
      }
      uint64_t v14 = [(WKFormSelectControl *)[(WKContentView *)self selectControl] menuItemTitles];
      if (v14)
      {
        id v28 = a3;
        CFTypeRef v29 = v14;
        return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
      }
      else
      {
        id v26 = a3;
        uint64_t v27 = MEMORY[0x1E4F1CBF0];
        return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      }
    }
  }
  CFTypeRef cf = (CFTypeRef)objc_opt_new();
  CFTypeRef v8 = [(WKContentView *)self contextMenuInteraction];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3321888768;
  float v24[2] = __57__WKContentView_WKTesting___contentsOfUserInterfaceItem___block_invoke;
  v24[3] = &__block_descriptor_40_e8_32c72_ZTSKZ57__WKContentView_WKTesting___contentsOfUserInterfaceItem__E5__123_e24___UIMenu_16__0__UIMenu_8l;
  void v24[4] = &cf;
  [(UIContextMenuInteraction *)v8 updateVisibleMenuWithBlock:v24];
  if ([(WKContentView *)self _shouldUseContextMenus])
  {
    id v42 = a3;
    v40[0] = @"url";
    if (*((unsigned char *)&self->_positionInformation.url + 8))
    {
      CGPoint v15 = (WTF *)WTF::URL::operator NSURL *();
      float v9 = (__CFString *)WTF::userVisibleString(v15, v16);
    }
    else
    {
      float v9 = &stru_1EEA10550;
    }
    v41[0] = v9;
    v40[1] = @"isLink";
    v41[1] = [NSNumber numberWithBool:self->_positionInformation.isLink];
    v40[2] = @"isImage";
    v41[2] = [NSNumber numberWithBool:self->_positionInformation.isImage];
    v40[3] = @"imageURL";
    if (*((unsigned char *)&self->_positionInformation.imageURL + 8))
    {
      long long v18 = (WTF *)WTF::URL::operator NSURL *();
      char v17 = (__CFString *)WTF::userVisibleString(v18, v19);
    }
    else
    {
      char v17 = &stru_1EEA10550;
    }
    void v40[4] = @"items";
    v41[3] = v17;
    v41[4] = cf;
    uint64_t v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:5];
    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
  }
  else
  {
    CFTypeRef v11 = (void *)[self->_previewItemController.m_ptr previewData];
    uint64_t v12 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F43C60]];
    id v38 = a3;
    v37[0] = v12;
    v36[0] = @"url";
    v36[1] = @"isLink";
    v37[1] = [NSNumber numberWithBool:self->_positionInformation.isLink];
    v36[2] = @"isImage";
    float v37[2] = [NSNumber numberWithBool:self->_positionInformation.isImage];
    v36[3] = @"imageURL";
    if (*((unsigned char *)&self->_positionInformation.imageURL + 8))
    {
      long long v21 = (WTF *)WTF::URL::operator NSURL *();
      char v13 = (__CFString *)WTF::userVisibleString(v21, v22);
    }
    else
    {
      char v13 = &stru_1EEA10550;
    }
    v36[4] = @"items";
    v37[3] = v13;
    v37[4] = cf;
    uint64_t v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:5];
    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
  }
  float v6 = (void *)v20;
  CFTypeRef v23 = cf;
  CFTypeRef cf = 0;
  if (v23) {
    CFRelease(v23);
  }
  return v6;
}

void *__57__WKContentView_WKTesting___contentsOfUserInterfaceItem___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  float v4 = objc_msgSend(a2, "children", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(**(id **)(a1 + 32), "addObject:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8++), "title"));
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return a2;
}

- (void)_dismissContactPickerWithContacts:(id)a3
{
}

- (UITapGestureRecognizer)singleTapGestureRecognizer
{
  return (UITapGestureRecognizer *)self->_singleTapGestureRecognizer.m_ptr;
}

- (void)_simulateSelectionStart
{
  BYTE2(self->_dataListTextSuggestions.m_ptr) = 1;
  *(_DWORD *)&self->_keyWebEventHandlers.m_inlineBuffer[0].__lx[40] = 2;
}

- (BOOL)_allowAnimationControls
{
  id v2 = [(WKContentView *)self webView];

  return [v2 _allowAnimationControls];
}

- (void)dismissFormAccessoryView
{
  if (![(WKDateTimeInputControl *)[(WKContentView *)self dateTimeInputControl] dismissWithAnimationForTesting])
  {
    [(WKContentView *)self accessoryDone];
  }
}

- (void)_selectDataListOption:(int64_t)a3
{
  id Weak = objc_loadWeak(&self->_actionsToPerformAfterEditorStateUpdate.m_buffer);

  [Weak didSelectOptionAtIndex:a3];
}

- (void)_setDataListSuggestionsControl:(id)a3
{
}

- (BOOL)isShowingDataListSuggestions
{
  id Weak = objc_loadWeak(&self->_actionsToPerformAfterEditorStateUpdate.m_buffer);

  return [Weak isShowingSuggestions];
}

- (UIWKTextInteractionAssistant)textInteractionAssistant
{
  return (UIWKTextInteractionAssistant *)[self->_textInteractionWrapper.m_ptr textInteractionAssistant];
}

- (UIContextMenuInteraction)contextMenuInteraction
{
  return (UIContextMenuInteraction *)[self->_textInteractionWrapper.m_ptr contextMenuInteraction];
}

- (void)_unregisterPreview
{
  if (![(WKContentView *)self _shouldUseContextMenus])
  {
    [self->_previewItemController.m_ptr setDelegate:0];
    id m_ptr = self->_previewGestureRecognizer.m_ptr;
    self->_previewGestureRecognizer.id m_ptr = 0;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    float v4 = self->_previewSecondaryGestureRecognizer.m_ptr;
    self->_previewSecondaryGestureRecognizer.id m_ptr = 0;
    if (v4) {
      CFRelease(v4);
    }
    uint64_t v5 = self->_previewItemController.m_ptr;
    self->_previewItemController.id m_ptr = 0;
    if (v5)
    {
      CFRelease(v5);
    }
  }
}

- (void)assignLegacyDataForContextMenuInteraction
{
  v76[16] = *(CFTypeRef *)MEMORY[0x1E4F143B8];
  if (self->_contextMenuHasRequestedLegacyData) {
    return;
  }
  self->_contextMenuHasRequestedLegacyData = 1;
  id WeakRetained = objc_loadWeakRetained(&self->_webView.m_weakReference);
  if (!WeakRetained) {
    return;
  }
  CFRelease(WeakRetained);
  uint64_t v4 = objc_msgSend(-[WKContentView webView](self, "webView"), "UIDelegate");
  if (!v4) {
    return;
  }
  uint64_t v5 = (void *)v4;
  p_positionInformation = &self->_positionInformation;
  id m_ptr = self->_page.m_ptr;
  uint64_t v8 = *((void *)m_ptr + 32);
  v76[0] = &self->_positionInformation.elementContext.var0.var2 + 1;
  v76[1] = &self->_positionInformation;
  WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::StartInteractionWithElementContextOrPosition>(v8, (uint64_t)v76, *(void *)(*((void *)m_ptr + 4) + 1928), 0);
  id v9 = [[_WKActivatedElementInfo alloc] _initWithInteractionInformationAtPosition:&self->_positionInformation isUsingAlternateURLForImage:0 userInfo:0];
  if (!self->_positionInformation.isLink)
  {
    if (self->_positionInformation.isImage && self->_positionInformation.image.m_ptr)
    {
      uint64_t v11 = WTF::URL::operator NSURL *();
      WebCore::ShareableBitmap::makeCGImageCopy((uint64_t *)v76, (WebCore::ShareableBitmap *)self->_positionInformation.image.m_ptr);
      id v12 = objc_alloc(MEMORY[0x1E4F42A80]);
      long long v13 = (const void *)[v12 initWithCGImage:v76[0]];
      if (objc_opt_respondsToSelector())
      {
        cf[0] = 0;
        uint64_t v11 = objc_msgSend(v5, "_webView:alternateURLFromImage:userInfo:", -[WKContentView webView](self, "webView"), v13, cf);
        CFTypeRef v14 = cf[0];
        if (cf[0]) {
          CFRetain(cf[0]);
        }
      }
      else
      {
        CFTypeRef v14 = 0;
      }
      if (objc_opt_respondsToSelector()) {
        objc_msgSend(v5, "_webView:willPreviewImageWithURL:", -[WKContentView webView](self, "webView"), WTF::URL::operator NSURL *());
      }
      id v47 = self->_actionSheetAssistant.m_ptr;
      if (v47) {
        [v47 defaultActionsForImageSheet:v9];
      }
      else {
        cf[0] = 0;
      }
      if (v14 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        id v48 = [(WKContentView *)self webView];
        long long v49 = (WKImagePreviewViewController *)[v5 _webView:v48 previewViewControllerForImage:v13 alternateURL:v11 defaultActions:cf[0] elementInfo:v9];
        double v25 = v49;
        if (v49) {
          CFRetain(v49);
        }
      }
      else
      {
        long long v50 = [WKImagePreviewViewController alloc];
        CFTypeRef v67 = v76[0];
        if (v76[0]) {
          CFRetain(v76[0]);
        }
        CFTypeRef v66 = cf[0];
        if (cf[0]) {
          CFRetain(cf[0]);
        }
        CFTypeRef v65 = v9;
        if (v9) {
          CFRetain(v9);
        }
        double v25 = [(WKImagePreviewViewController *)v50 initWithCGImage:&v67 defaultActions:&v66 elementInfo:&v65];
        CFTypeRef v51 = v65;
        CFTypeRef v65 = 0;
        if (v51) {
          CFRelease(v51);
        }
        CFTypeRef v52 = v66;
        CFTypeRef v66 = 0;
        if (v52) {
          CFRelease(v52);
        }
        CFTypeRef v53 = v67;
        CFTypeRef v67 = 0;
        if (v53) {
          CFRelease(v53);
        }
      }
      CFTypeRef v54 = cf[0];
      v71[0] = (id)cf[0];
      if (cf[0]) {
        CFRetain(cf[0]);
      }
      uint64_t v64 = v9;
      if (v9) {
        CFRetain(v9);
      }
      if (self->_positionInformation.title.m_impl.m_ptr) {
        uint64_t v55 = (__CFString *)WTF::StringImpl::operator NSString *();
      }
      else {
        uint64_t v55 = &stru_1EEA10550;
      }
      uint64_t v56 = (void *)menuFromLegacyPreviewOrDefaultActions(v25, v71, &v64, (uint64_t)v55);
      long long v57 = v56;
      if (v56) {
        CFRetain(v56);
      }
      long long v58 = self->_contextMenuLegacyMenu.m_ptr;
      self->_contextMenuLegacyMenu.id m_ptr = v57;
      if (v58) {
        CFRelease(v58);
      }
      uint64_t v64 = 0;
      if (v9) {
        CFRelease(v9);
      }
      if (v54) {
        CFRelease(v54);
      }
      CFTypeRef v59 = cf[0];
      cf[0] = 0;
      if (v59) {
        CFRelease(v59);
      }
      if (v13) {
        CFRelease(v13);
      }
      CFTypeRef v60 = v76[0];
      v76[0] = 0;
      if (v60)
      {
        CFRelease(v60);
        if (!v14) {
          goto LABEL_120;
        }
        goto LABEL_118;
      }
      if (v14)
      {
LABEL_118:
        CFTypeRef v30 = v14;
LABEL_119:
        CFRelease(v30);
      }
    }
    else
    {
      double v25 = 0;
    }
LABEL_120:
    long long v61 = self->_contextMenuLegacyPreviewController.m_ptr;
    self->_contextMenuLegacyPreviewController.id m_ptr = v25;
    if (v61) {
      CFRelease(v61);
    }
    double v25 = 0;
    goto LABEL_123;
  }
  BYTE6(self->_dataListTextSuggestionsInputView.m_ptr) = 0;
  long long v10 = self->_actionSheetAssistant.m_ptr;
  if (v10) {
    [v10 defaultActionsForLinkSheet:v9];
  }
  else {
    CFTypeRef v70 = 0;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v62 = v5;
    uint64_t v63 = v9;
    uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v70, "count"));
    long long v74 = 0u;
    long long v75 = 0u;
    *(_OWORD *)CFTypeRef cf = 0u;
    long long v73 = 0u;
    uint64_t v16 = [(id)v70 countByEnumeratingWithState:cf objects:v76 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v73;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v73 != v17) {
            objc_enumerationMutation((id)v70);
          }
          char v19 = (_WKElementAction *)*((void *)cf[1] + i);
          uint64_t v20 = previewIdentifierForElementAction(v19);
          uint64_t v21 = [(_WKElementAction *)v19 title];
          v71[0] = (id)MEMORY[0x1E4F143A8];
          v71[1] = (id)3221225472;
          v71[2] = ___ZL40wkLegacyPreviewActionsFromElementActionsP7NSArrayIP16_WKElementActionEP23_WKActivatedElementInfo_block_invoke;
          v71[3] = &unk_1E5811F08;
          v71[4] = v19;
          v71[5] = v63;
          CFTypeRef v22 = +[WKPreviewAction actionWithIdentifier:v20 title:v21 style:0 handler:v71];
          [(UIPreviewAction *)v22 setImage:+[_WKElementAction imageForElementActionType:[(_WKElementAction *)v19 type]]];
          [v15 addObject:v22];
        }
        uint64_t v16 = [(id)v70 countByEnumeratingWithState:cf objects:v76 count:16];
      }
      while (v16);
    }
    id v23 = [[WKPreviewElementInfo alloc] _initWithLinkURL:WTF::URL::operator NSURL *()];
    id v9 = v63;
    p_positionInformation = &self->_positionInformation;
    uint64_t v24 = objc_msgSend(v62, "webView:previewingViewControllerForElement:defaultActions:", -[WKContentView webView](self, "webView"), v23, v15);
    double v25 = (WKImagePreviewViewController *)v24;
    if (v24) {
      uint64_t v24 = (uint64_t)CFRetain((CFTypeRef)v24);
    }
    if (v23) {
      CFRelease(v23);
    }
    if (!v25) {
      goto LABEL_51;
    }
LABEL_35:
    uint64_t v24 = [(id)WTF::URL::operator NSURL *() iTunesStoreURL];
    if (!v24)
    {
      CFTypeRef v26 = v70;
      v76[0] = v70;
      if (v70) {
        CFRetain(v70);
      }
      char v68 = v9;
      if (v9) {
        CFRetain(v9);
      }
      uint64_t v27 = (void *)menuFromLegacyPreviewOrDefaultActions(v25, (id *)v76, &v68, 0);
      id v28 = v27;
      if (v27) {
        CFRetain(v27);
      }
      CFTypeRef v29 = self->_contextMenuLegacyMenu.m_ptr;
      self->_contextMenuLegacyMenu.id m_ptr = v28;
      if (v29) {
        CFRelease(v29);
      }
      char v68 = 0;
      if (v9) {
        CFRelease(v9);
      }
      if (v26) {
        CFRelease(v26);
      }
      CFTypeRef v30 = v70;
      CFTypeRef v70 = 0;
      if (!v30) {
        goto LABEL_120;
      }
      goto LABEL_119;
    }
    goto LABEL_51;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v24 = objc_msgSend(v5, "_webView:previewViewControllerForURL:defaultActions:elementInfo:", -[WKContentView webView](self, "webView"), WTF::URL::operator NSURL *(), v70, v9);
    double v25 = (WKImagePreviewViewController *)v24;
    if (!v24) {
      goto LABEL_51;
    }
    goto LABEL_34;
  }
  uint64_t v24 = objc_opt_respondsToSelector();
  if ((v24 & 1) == 0)
  {
    double v25 = 0;
    goto LABEL_51;
  }
  uint64_t v24 = objc_msgSend(v5, "_webView:previewViewControllerForURL:", -[WKContentView webView](self, "webView"), WTF::URL::operator NSURL *());
  double v25 = (WKImagePreviewViewController *)v24;
  if (v24)
  {
LABEL_34:
    CFRetain((CFTypeRef)v24);
    goto LABEL_35;
  }
LABEL_51:
  uint64_t v31 = (void *)((uint64_t (*)(uint64_t))*MEMORY[0x1E4FB6340])(v24);
  id v32 = [(WKContentView *)self dataDetectionContextForPositionInformation:p_positionInformation];
  uint64_t v33 = WTF::URL::operator NSURL *();
  if (p_positionInformation->dataDetectorIdentifier.m_impl.m_ptr) {
    id v34 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    id v34 = &stru_1EEA10550;
  }
  uint64_t v35 = objc_msgSend(v31, "contextMenuConfigurationForURL:identifier:selectedText:results:inView:context:menuIdentifier:", v33, v34, -[WKContentView selectedText](self, "selectedText"), p_positionInformation->dataDetectorResults.m_ptr, self, v32, 0);
  id v36 = v35;
  if (v35)
  {
    CFRetain(v35);
    if (self->_showLinkPreviews && [v36 previewProvider])
    {
      long long v37 = (void *)(*(uint64_t (**)(void))([v36 previewProvider] + 16))();
      id v38 = v37;
      if (v37) {
        CFRetain(v37);
      }
      uint64_t v39 = self->_contextMenuLegacyPreviewController.m_ptr;
      self->_contextMenuLegacyPreviewController.id m_ptr = v38;
      if (v39) {
        CFRelease(v39);
      }
    }
    if ([v36 actionProvider])
    {
      CFTypeRef v40 = v70;
      v76[0] = v70;
      if (v70) {
        CFRetain(v70);
      }
      id v69 = v9;
      if (v9) {
        CFRetain(v9);
      }
      char v41 = menuElementsFromDefaultActions((id *)v76, &v69);
      id v69 = 0;
      if (v9) {
        CFRelease(v9);
      }
      if (v40) {
        CFRelease(v40);
      }
      uint64_t v42 = [v36 actionProvider];
      uint64_t v43 = (void *)(*(uint64_t (**)(uint64_t, void *))(v42 + 16))(v42, v41);
      id v44 = v43;
      if (v43) {
        CFRetain(v43);
      }
      uint64_t v45 = self->_contextMenuLegacyMenu.m_ptr;
      self->_contextMenuLegacyMenu.id m_ptr = v44;
      if (v45) {
        CFRelease(v45);
      }
    }
    CFRelease(v36);
  }
  CFTypeRef v46 = v70;
  CFTypeRef v70 = 0;
  if (v46) {
    CFRelease(v46);
  }
LABEL_123:
  if (v9) {
    CFRelease(v9);
  }
  if (v25) {
    CFRelease(v25);
  }
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  if ([(WKContentView *)self _shouldUseUIContextMenuAsyncConfiguration])
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F18B70]);
    id v9 = v8;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3321888768;
    float v12[2] = __93__WKContentView_WKInteractionPreview__contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
    void v12[3] = &__block_descriptor_40_e8_32c108_ZTSKZ93__WKContentView_WKInteractionPreview__contextMenuInteraction_configurationForMenuAtLocation__E5__127_e36_v16__0__UIContextMenuConfiguration_8l;
    if (v8)
    {
      CFRetain(v8);
      CFTypeRef cf = v9;
      CFRetain(v9);
    }
    else
    {
      CFTypeRef cf = 0;
    }
    -[WKContentView _internalContextMenuInteraction:configurationForMenuAtLocation:completion:](self, "_internalContextMenuInteraction:configurationForMenuAtLocation:completion:", a3, v12, x, y);
    if (v9)
    {
      CFRelease(v9);
      CFRetain(v9);
    }
    CFTypeRef v10 = cf;
    CFTypeRef cf = 0;
    if (v10) {
      CFRelease(v10);
    }
    if (v9) {
      CFRelease(v9);
    }
  }
  else
  {
    id v9 = 0;
  }
  return (id)(id)CFMakeCollectable(v9);
}

uint64_t __93__WKContentView_WKInteractionPreview__contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) fulfillUsingConfiguration:a2];
}

- (void)_internalContextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4 completion:(id)a5
{
  self->_useContextMenuInteractionDismissalPreview = 1;
  id WeakRetained = objc_loadWeakRetained(&self->_webView.m_weakReference);
  if (WeakRetained
    && (CFRelease(WeakRetained),
        (objc_msgSend((id)objc_msgSend(-[WKContentView webView](self, "webView"), "configuration"), "_longPressActionsEnabled") & 1) != 0))
  {
    id v13 = 0;
    objc_initWeak(&v13, self);
    CFTypeRef cf = a3;
    if (a3) {
      CFRetain(a3);
    }
    aBlocuint64_t k = _Block_copy(a5);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3321888768;
    uint64_t v16[2] = ___ZZ113__WKContentView_WKInteractionPreview___internalContextMenuInteraction_configurationForMenuAtLocation_completion__ENK5__128cvU13block_pointerFvN6WebKit31ProceedWithTextSelectionInImageEEEv_block_invoke;
    v16[3] = &__block_descriptor_56_e8_32c129_ZTSKZ113__WKContentView_WKInteractionPreview___internalContextMenuInteraction_configurationForMenuAtLocation_completion__E5__128_e8_v12__0B8l;
    id v17 = 0;
    objc_copyWeak(&v17, &v13);
    CFTypeRef v18 = cf;
    if (cf) {
      CFRetain(cf);
    }
    char v19 = _Block_copy(aBlock);
    uint64_t v9 = objc_msgSend((id)objc_msgSend(v16, "copy"), "autorelease");
    _Block_release(v19);
    CFTypeRef v10 = v18;
    CFTypeRef v18 = 0;
    if (v10) {
      CFRelease(v10);
    }
    objc_destroyWeak(&v17);
    [(WKContentView *)self _doAfterPendingImageAnalysis:v9];
    _Block_release(aBlock);
    CFTypeRef v11 = cf;
    CFTypeRef cf = 0;
    if (v11) {
      CFRelease(v11);
    }
    objc_destroyWeak(&v13);
  }
  else
  {
    id v12 = (void (*)(id, void))*((void *)a5 + 2);
    v12(a5, 0);
  }
}

- (id)placeholderForDynamicallyInsertedImageAnalysisActions
{
  if (LOBYTE(self->_cachedVisualSearchPreviewImageBoundsInWindowCoordinates.var0.__val_.origin.y) - 1 > 1) {
    return 0;
  }
  id v2 = (void *)[MEMORY[0x1E4F426E8] actionWithTitle:&stru_1EEA10550 image:0 identifier:elementActionTypeToUIActionIdentifier(13) handler:&__block_literal_global_40];
  id v3 = v2;
  if (v2) {
    CFRetain(v2);
  }
  [v3 setAttributes:4];
  uint64_t v4 = (void *)CFMakeCollectable(v3);

  return v4;
}

- (void)continueContextMenuInteraction:(id)a3
{
  if ([(WKContentView *)self window]
    && self->_positionInformation.touchCalloutEnabled
    && (self->_positionInformation.isLink
     || self->_positionInformation.isImage
     || self->_positionInformation.isAttachment
     || [(WKContentView *)self positionInformationHasImageOverlayDataDetector]))
  {
    id m_ptr = self->_positionInformation.url.m_string.m_impl.m_ptr;
    if (m_ptr)
    {
      *(_DWORD *)m_ptr += 2;
      CFTypeRef v52 = (WTF::StringImpl *)m_ptr;
      long long v6 = *(_OWORD *)&self->_positionInformation.url.m_hostEnd;
      *(_OWORD *)CFTypeRef v53 = *(_OWORD *)((char *)&self->_positionInformation.url + 8);
      *(_OWORD *)&v53[16] = v6;
      if (!self->_positionInformation.isLink || *((_DWORD *)m_ptr + 1))
      {
LABEL_10:
        uint64_t v7 = objc_msgSend(-[WKContentView webView](self, "webView"), "UIDelegate");
        if (needsDeprecatedPreviewAPI((uint64_t)v7))
        {
          if (!self->_positionInformation.isLink) {
            goto LABEL_18;
          }
          if (objc_opt_respondsToSelector())
          {
            id v9 = [[WKPreviewElementInfo alloc] _initWithLinkURL:WTF::URL::operator NSURL *()];
            if ((objc_msgSend(v7, "webView:shouldPreviewElement:", -[WKContentView webView](self, "webView"), v9) & 1) == 0)
            {
              (*((void (**)(id, void))a3 + 2))(a3, 0);
              if (v9) {
                CFRelease(v9);
              }
              goto LABEL_67;
            }
            if (v9) {
              CFRelease(v9);
            }
          }
          if ((v53[0] & 2) != 0
            || (WebCore::DataDetection::canBePresentedByDataDetectors((WebCore::DataDetection *)&v52, v8) & 1) != 0)
          {
LABEL_18:
            CFTypeRef v10 = self->_contextMenuLegacyPreviewController.m_ptr;
            self->_contextMenuLegacyPreviewController.id m_ptr = 0;
            if (v10) {
              CFRelease(v10);
            }
            CFTypeRef v11 = self->_contextMenuLegacyMenu.m_ptr;
            self->_contextMenuLegacyMenu.id m_ptr = 0;
            if (v11) {
              CFRelease(v11);
            }
            self->_contextMenuHasRequestedLegacyData = 0;
            self->_contextMenuActionProviderDelegateNeedsOverride = 0;
            self->_contextMenuIsUsingAlternateURLForImage = 0;
            v50[0] = MEMORY[0x1E4F143A8];
            v50[1] = 3321888768;
            v50[2] = __70__WKContentView_WKInteractionPreview__continueContextMenuInteraction___block_invoke;
            v50[3] = &__block_descriptor_40_e8_32c85_ZTSKZ70__WKContentView_WKInteractionPreview__continueContextMenuInteraction__E5__129_e25___UIMenu_16__0__NSArray_8l;
            location[0] = 0;
            objc_initWeak(location, self);
            id v51 = 0;
            objc_copyWeak(&v51, location);
            objc_destroyWeak(location);
            v48[0] = MEMORY[0x1E4F143A8];
            v48[1] = 3321888768;
            id v48[2] = __70__WKContentView_WKInteractionPreview__continueContextMenuInteraction___block_invoke_2690;
            void v48[3] = &__block_descriptor_40_e8_32c85_ZTSKZ70__WKContentView_WKInteractionPreview__continueContextMenuInteraction__E5__130_e23___UIViewController_8__0l;
            location[0] = 0;
            objc_initWeak(location, self);
            id v49 = 0;
            objc_copyWeak(&v49, location);
            objc_destroyWeak(location);
            id v12 = self->_page.m_ptr;
            uint64_t v13 = *((void *)v12 + 32);
            location[0] = &self->_positionInformation.elementContext.var0.var2 + 1;
            location[1] = &self->_positionInformation;
            WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::StartInteractionWithElementContextOrPosition>(v13, (uint64_t)location, *(void *)(*((void *)v12 + 4) + 1928), 0);
            (*((void (**)(id, uint64_t))a3 + 2))(a3, [MEMORY[0x1E4F428F0] configurationWithIdentifier:0 previewProvider:v48 actionProvider:v50]);
            objc_destroyWeak(&v49);
            objc_destroyWeak(&v51);
          }
          else
          {
            (*((void (**)(id, void))a3 + 2))(a3, 0);
          }
LABEL_67:
          id v44 = v52;
          CFTypeRef v52 = 0;
          if (v44)
          {
            if (*(_DWORD *)v44 == 2) {
              WTF::StringImpl::destroy(v44, v14);
            }
            else {
              *(_DWORD *)v44 -= 2;
            }
          }
          return;
        }
        if ([(id)WTF::URL::operator NSURL *() iTunesStoreURL])
        {
          [(WKContentView *)self continueContextMenuInteractionWithDataDetectors:a3];
          goto LABEL_67;
        }
        uint64_t v16 = _Block_copy(a3);
        id v17 = v52;
        CFTypeRef v52 = 0;
        aBlock[0] = v16;
        aBlock[1] = v17;
        *(_OWORD *)&v46[4] = *(_OWORD *)&v53[4];
        *(_DWORD *)CFTypeRef v46 = *(_DWORD *)v53;
        *(void *)&v46[20] = *(void *)&v53[20];
        *(_DWORD *)&v46[28] = *(_DWORD *)&v53[28];
        *(_DWORD *)v53 &= ~1u;
        id v47 = 0;
        objc_initWeak(&v47, self);
        long long v18 = *(_OWORD *)aBlock;
        aBlock[0] = 0;
        aBlock[1] = 0;
        *(_OWORD *)NSUInteger location = v18;
        long long v55 = *(_OWORD *)v46;
        long long v56 = *(_OWORD *)&v46[16];
        *(_DWORD *)v46 &= ~1u;
        v57[0] = 0;
        objc_moveWeak(v57, &v47);
        char v19 = malloc_type_malloc(0x58uLL, 0x10E0040905B07F4uLL);
        *(void *)char v19 = MEMORY[0x1E4F14398];
        *((void *)v19 + 1) = 50331650;
        *((void *)v19 + 2) = WTF::BlockPtr<void ()(UIContextMenuConfiguration *)>::fromCallable<-[WKContentView(WKInteractionPreview) continueContextMenuInteraction:]::$_124>(-[WKContentView(WKInteractionPreview) continueContextMenuInteraction:]::$_124)::{lambda(void *,UIContextMenuConfiguration *)#1}::__invoke;
        *((void *)v19 + 3) = &WTF::BlockPtr<void ()(UIContextMenuConfiguration *)>::fromCallable<-[WKContentView(WKInteractionPreview) continueContextMenuInteraction:]::$_124>(-[WKContentView(WKInteractionPreview) continueContextMenuInteraction:]::$_124)::descriptor;
        id v20 = location[0];
        location[0] = 0;
        *((void *)v19 + 4) = v20;
        WTF::URL::URL((uint64_t)v19 + 40, (uint64_t *)&location[1]);
        *((void *)v19 + 10) = 0;
        objc_moveWeak((id *)v19 + 10, v57);
        objc_destroyWeak(v57);
        CFTypeRef v22 = (WTF::StringImpl *)location[1];
        location[1] = 0;
        if (v22)
        {
          if (*(_DWORD *)v22 == 2) {
            WTF::StringImpl::destroy(v22, v21);
          }
          else {
            *(_DWORD *)v22 -= 2;
          }
        }
        _Block_release(location[0]);
        objc_destroyWeak(&v47);
        uint64_t v24 = (WTF::StringImpl *)aBlock[1];
        aBlock[1] = 0;
        if (v24)
        {
          if (*(_DWORD *)v24 == 2) {
            WTF::StringImpl::destroy(v24, v23);
          }
          else {
            *(_DWORD *)v24 -= 2;
          }
        }
        _Block_release(aBlock[0]);
        self->_contextMenuActionProviderDelegateNeedsOverride = 0;
        self->_contextMenuIsUsingAlternateURLForImage = 0;
        uint64_t v25 = API::Object::newObject(0x2A0uLL, 51);
        *(void *)uint64_t v25 = &unk_1EE9D1E28;
        WebKit::InitializeWebKit2((WebKit *)v25);
        *(void *)uint64_t v25 = &unk_1EE9DF338;
        WebKit::InteractionInformationAtPosition::InteractionInformationAtPosition((WebKit::InteractionInformationAtPosition *)(v25 + 16), (const WebKit::InteractionInformationAtPosition *)&self->_positionInformation);
        *(void *)(v25 + 656) = 0;
        CFTypeRef v26 = *(void **)(v25 + 8);
        if (v26) {
          CFRetain(*(CFTypeRef *)(v25 + 8));
        }
        uint64_t v27 = self->_contextMenuElementInfo.m_ptr;
        self->_contextMenuElementInfo.id m_ptr = v26;
        if (v27) {
          CFRelease(v27);
        }
        CFRelease(*(CFTypeRef *)(v25 + 8));
        if (self->_positionInformation.isImage
          && !self->_positionInformation.url.m_string.m_impl.m_ptr
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          uint64_t v28 = objc_msgSend((id)objc_msgSend(self->_contextMenuElementInfo.m_ptr, "_activatedElementInfo"), "image");
          aBlock[0] = 0;
          uint64_t v29 = objc_msgSend(v7, "_webView:alternateURLFromImage:userInfo:", -[WKContentView webView](self, "webView"), v28, aBlock);
          MEMORY[0x19972E8A0](location, v29);
          WTF::URL::operator=((uint64_t)&self->_positionInformation.url, (uint64_t)location);
          uint64_t v31 = (WTF::StringImpl *)location[0];
          location[0] = 0;
          if (v31)
          {
            if (*(_DWORD *)v31 == 2) {
              WTF::StringImpl::destroy(v31, v30);
            }
            else {
              *(_DWORD *)v31 -= 2;
            }
          }
          if (v29) {
            self->_contextMenuIsUsingAlternateURLForImage = 1;
          }
          id v32 = (CFTypeRef *)API::Object::newObject(0x2A0uLL, 51);
          uint64_t v33 = API::ContextMenuElementInfo::ContextMenuElementInfo((API::ContextMenuElementInfo *)v32, (const WebKit::InteractionInformationAtPosition *)&self->_positionInformation, (NSDictionary *)aBlock[0]);
          id v34 = (void *)*((void *)v33 + 1);
          if (v34) {
            CFRetain(*((CFTypeRef *)v33 + 1));
          }
          uint64_t v35 = self->_contextMenuElementInfo.m_ptr;
          self->_contextMenuElementInfo.id m_ptr = v34;
          if (v35) {
            CFRelease(v35);
          }
          CFRelease(v32[1]);
        }
        if (self->_positionInformation.isLink && (objc_opt_respondsToSelector() & 1) != 0)
        {
          WebKit::CompletionHandlerCallChecker::create((WebKit::CompletionHandlerCallChecker *)v7, (objc_object *)sel_webView_contextMenuConfigurationForElement_completionHandler_, (uint64_t *)location);
          id v36 = [(WKContentView *)self webView];
          long long v37 = self->_contextMenuElementInfo.m_ptr;
          id v38 = location[0];
          uint64_t v39 = malloc_type_malloc(0x30uLL, 0x10E00409BB9573DuLL);
          void *v39 = MEMORY[0x1E4F14398];
          v39[1] = 50331650;
          void v39[2] = WTF::BlockPtr<void ()(UIContextMenuConfiguration *)>::fromCallable<-[WKContentView(WKInteractionPreview) continueContextMenuInteraction:]::$_125>(-[WKContentView(WKInteractionPreview) continueContextMenuInteraction:]::$_125)::{lambda(void *,UIContextMenuConfiguration *)#1}::__invoke;
          v39[3] = &WTF::BlockPtr<void ()(UIContextMenuConfiguration *)>::fromCallable<-[WKContentView(WKInteractionPreview) continueContextMenuInteraction:]::$_125>(-[WKContentView(WKInteractionPreview) continueContextMenuInteraction:]::$_125)::descriptor;
          v39[4] = v19;
          v39[5] = v38;
          _Block_release(0);
          [v7 webView:v36 contextMenuConfigurationForElement:v37 completionHandler:v39];
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {
            (*((void (**)(void *, void))v19 + 2))(v19, 0);
            goto LABEL_64;
          }
          WebKit::CompletionHandlerCallChecker::create((WebKit::CompletionHandlerCallChecker *)v7, (objc_object *)sel__webView_contextMenuConfigurationForElement_completionHandler_, (uint64_t *)location);
          id v40 = [(WKContentView *)self webView];
          char v41 = self->_contextMenuElementInfo.m_ptr;
          id v42 = location[0];
          uint64_t v39 = malloc_type_malloc(0x30uLL, 0x10E00409BB9573DuLL);
          void *v39 = MEMORY[0x1E4F14398];
          v39[1] = 50331650;
          void v39[2] = WTF::BlockPtr<void ()(UIContextMenuConfiguration *)>::fromCallable<-[WKContentView(WKInteractionPreview) continueContextMenuInteraction:]::$_126>(-[WKContentView(WKInteractionPreview) continueContextMenuInteraction:]::$_126)::{lambda(void *,UIContextMenuConfiguration *)#1}::__invoke;
          v39[3] = &WTF::BlockPtr<void ()(UIContextMenuConfiguration *)>::fromCallable<-[WKContentView(WKInteractionPreview) continueContextMenuInteraction:]::$_126>(-[WKContentView(WKInteractionPreview) continueContextMenuInteraction:]::$_126)::descriptor;
          v39[4] = v19;
          v39[5] = v42;
          _Block_release(0);
          [v7 _webView:v40 contextMenuConfigurationForElement:v41 completionHandler:v39];
        }
        _Block_release(v39);
        _Block_release(0);
        char v19 = 0;
LABEL_64:
        _Block_release(v19);
        goto LABEL_67;
      }
    }
    else
    {
      CFTypeRef v52 = 0;
      long long v43 = *(_OWORD *)&self->_positionInformation.url.m_hostEnd;
      *(_OWORD *)CFTypeRef v53 = *(_OWORD *)((char *)&self->_positionInformation.url + 8);
      *(_OWORD *)&v53[16] = v43;
      if (!self->_positionInformation.isLink) {
        goto LABEL_10;
      }
    }
    (*((void (**)(id, void))a3 + 2))(a3, 0);
    goto LABEL_67;
  }
  uint64_t v15 = (void (*)(id, void))*((void *)a3 + 2);

  v15(a3, 0);
}

uint64_t __70__WKContentView_WKInteractionPreview__continueContextMenuInteraction___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained) {
    return 0;
  }
  id v2 = WeakRetained;
  if (!WeakRetained[1232]) {
    [WeakRetained assignLegacyDataForContextMenuInteraction];
  }
  uint64_t v3 = v2[153];
  CFRelease(v2);
  return v3;
}

uint64_t __70__WKContentView_WKInteractionPreview__continueContextMenuInteraction___block_invoke_2690(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained) {
    return 0;
  }
  id v2 = WeakRetained;
  if (!WeakRetained[1232]) {
    [WeakRetained assignLegacyDataForContextMenuInteraction];
  }
  uint64_t v3 = v2[152];
  CFRelease(v2);
  return v3;
}

- (void)continueContextMenuInteractionWithDataDetectors:(id)a3
{
  uint64_t v5 = (void *)((uint64_t (*)(WKContentView *, SEL))*MEMORY[0x1E4FB6340])(self, a2);
  id v6 = [(WKContentView *)self dataDetectionContextForPositionInformation:&self->_positionInformation];
  uint64_t v7 = v6;
  if (v6) {
    CFRetain(v6);
  }
  if ([(WKContentView *)self positionInformationHasImageOverlayDataDetector])
  {
    id v8 = (const void *)objc_msgSend(v5, "contextMenuConfigurationWithResult:inView:context:menuIdentifier:", objc_msgSend((id)objc_msgSend(self->_positionInformation.dataDetectorResults.m_ptr, "firstObject"), "coreResult"), self, v7, 0);
    id v9 = v8;
    if (v8) {
      CFRetain(v8);
    }
  }
  else
  {
    uint64_t v10 = WTF::URL::operator NSURL *();
    if (self->_positionInformation.dataDetectorIdentifier.m_impl.m_ptr) {
      CFTypeRef v11 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      CFTypeRef v11 = &stru_1EEA10550;
    }
    id v12 = (const void *)objc_msgSend(v5, "contextMenuConfigurationForURL:identifier:selectedText:results:inView:context:menuIdentifier:", v10, v11, -[WKContentView selectedText](self, "selectedText"), self->_positionInformation.dataDetectorResults.m_ptr, self, v7, 0);
    id v9 = v12;
    if (v12) {
      CFRetain(v12);
    }
    id m_ptr = self->_page.m_ptr;
    uint64_t v14 = *((void *)m_ptr + 32);
    v15[0] = &self->_positionInformation.elementContext.var0.var2 + 1;
    v15[1] = &self->_positionInformation;
    WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::StartInteractionWithElementContextOrPosition>(v14, (uint64_t)v15, *(void *)(*((void *)m_ptr + 4) + 1928), 0);
  }
  self->_contextMenuActionProviderDelegateNeedsOverride = 1;
  (*((void (**)(id, const void *))a3 + 2))(a3, v9);
  if (v9) {
    CFRelease(v9);
  }
  if (v7)
  {
    CFRelease(v7);
  }
}

- (id)_contextMenuInteraction:(id)a3 overrideSuggestedActionsForConfiguration:(id)a4
{
  if (!self->_contextMenuActionProviderDelegateNeedsOverride) {
    return 0;
  }
  uint64_t v5 = objc_msgSend(self->_actionSheetAssistant.m_ptr, "suggestedActionsForContextMenuWithPositionInformation:", &self->_positionInformation, a4);
  id v6 = [(WKContentView *)self placeholderForDynamicallyInsertedImageAnalysisActions];
  if (v6) {
    [v5 addObject:v6];
  }
  return v5;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  -[WKContentView _startSuppressingSelectionAssistantForReason:](self, "_startSuppressingSelectionAssistantForReason:", 4, a4, a5);
  [(WKContentView *)self _cancelTouchEventGestureRecognizer];

  return [(WKContentView *)self _createTargetedContextMenuHintPreviewIfPossible];
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id WeakRetained = objc_loadWeakRetained(&self->_webView.m_weakReference);
  if (WeakRetained)
  {
    CFRelease(WeakRetained);
    self->_isDisplayingContextMenuWithAnimation = 1;
    id v9 = 0;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3321888768;
    v10[2] = __103__WKContentView_WKInteractionPreview__contextMenuInteraction_willDisplayMenuForConfiguration_animator___block_invoke;
    v10[3] = &__block_descriptor_40_e8_32c119_ZTSKZ103__WKContentView_WKInteractionPreview__contextMenuInteraction_willDisplayMenuForConfiguration_animator__E5__131_e5_v8__0l;
    objc_initWeak(&v9, self);
    id v11 = 0;
    objc_copyWeak(&v11, &v9);
    [a5 addCompletion:v10];
    objc_destroyWeak(&v9);
    id v8 = objc_msgSend(-[WKContentView webView](self, "webView"), "UIDelegate");
    if (v8)
    {
      if (objc_opt_respondsToSelector())
      {
        objc_msgSend(v8, "webView:contextMenuWillPresentForElement:", -[WKContentView webView](self, "webView"), self->_contextMenuElementInfo.m_ptr);
      }
      else if (objc_opt_respondsToSelector())
      {
        objc_msgSend(v8, "_webView:contextMenuWillPresentForElement:", -[WKContentView webView](self, "webView"), self->_contextMenuElementInfo.m_ptr);
      }
    }
    objc_destroyWeak(&v11);
  }
}

void __103__WKContentView_WKInteractionPreview__contextMenuInteraction_willDisplayMenuForConfiguration_animator___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    *((unsigned char *)WeakRetained + 1280) = 0;
    [objc_loadWeak((id *)WeakRetained + 54) _didShowContextMenu];
    if (v2[3880] == 2) {
      [v2 _insertDynamicImageAnalysisContextMenuItemsIfPossible];
    }
    CFRelease(v2);
  }
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 dismissalPreviewForItemWithIdentifier:(id)a5
{
  BOOL useContextMenuInteractionDismissalPreview = self->_useContextMenuInteractionDismissalPreview;
  id m_ptr = self->_contextMenuInteractionTargetedPreview.m_ptr;
  self->_contextMenuInteractionTargetedPreview.id m_ptr = 0;
  if (useContextMenuInteractionDismissalPreview)
  {
    id v8 = (void *)CFMakeCollectable(m_ptr);
    return v8;
  }
  else
  {
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    return 0;
  }
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id WeakRetained = objc_loadWeakRetained(&self->_webView.m_weakReference);
  if (WeakRetained)
  {
    CFRelease(WeakRetained);
    self->_BOOL useContextMenuInteractionDismissalPreview = 0;
    uint64_t v9 = objc_msgSend(-[WKContentView webView](self, "webView"), "UIDelegate");
    if (v9)
    {
      uint64_t v10 = (void *)v9;
      if (needsDeprecatedPreviewAPI(v9))
      {
        if (self->_positionInformation.isImage)
        {
          if (objc_opt_respondsToSelector())
          {
            id m_ptr = self->_positionInformation.imageURL.m_string.m_impl.m_ptr;
            if (m_ptr)
            {
              if (*((_DWORD *)m_ptr + 1)
                && ((*((unsigned char *)&self->_positionInformation.imageURL + 8) & 2) != 0
                 || WTF::URL::protocolIs()))
              {
                id v12 = [(WKContentView *)self webView];
                uint64_t v13 = WTF::URL::operator NSURL *();
                [v10 _webView:v12 commitPreviewedImageWithURL:v13];
              }
            }
          }
        }
        else if (objc_opt_respondsToSelector())
        {
          uint64_t v21 = self->_contextMenuLegacyPreviewController.m_ptr;
          if (v21)
          {
            id v22 = [(WKContentView *)self webView];
            [v10 webView:v22 commitPreviewingViewController:v21];
          }
        }
        else if (objc_opt_respondsToSelector())
        {
          id v23 = self->_contextMenuLegacyPreviewController.m_ptr;
          if (v23)
          {
            id v24 = [(WKContentView *)self webView];
            [v10 _webView:v24 commitPreviewedViewController:v23];
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector())
        {
          uint64_t v14 = objc_msgSend(v10, "webView:contextMenuForElement:willCommitWithAnimator:", -[WKContentView webView](self, "webView"), self->_contextMenuElementInfo.m_ptr, a5);
        }
        else
        {
          uint64_t v14 = objc_opt_respondsToSelector();
          if (v14) {
            uint64_t v14 = objc_msgSend(v10, "_webView:contextMenuForElement:willCommitWithAnimator:", -[WKContentView webView](self, "webView"), self->_contextMenuElementInfo.m_ptr, a5);
          }
        }
        ((void (*)(uint64_t))*MEMORY[0x1E4FB63E0])(v14);
        if (objc_opt_isKindOfClass())
        {
          if ([a4 interactionViewControllerProvider])
          {
            uint64_t v15 = (const void *)(*(uint64_t (**)(void))([a4 interactionViewControllerProvider] + 16))();
            uint64_t v16 = v15;
            if (v15) {
              CFRetain(v15);
            }
            [a5 setPreferredCommitStyle:1];
            self->_BOOL useContextMenuInteractionDismissalPreview = 1;
            id v17 = (const void *)objc_msgSend((id)objc_msgSend(a5, "previewViewController"), "presentingViewController");
            long long v18 = v17;
            if (v17) {
              CFRetain(v17);
            }
            v28[0] = MEMORY[0x1E4F143A8];
            v28[1] = 3321888768;
            float v28[2] = __120__WKContentView_WKInteractionPreview__contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke;
            v28[3] = &__block_descriptor_48_e8_32c40_ZTSN3WTF9RetainPtrI16UIViewControllerEE40c40_ZTSN3WTF9RetainPtrI16UIViewControllerEE_e5_v8__0l;
            CFTypeRef v29 = v18;
            if (v18) {
              CFRetain(v18);
            }
            CFTypeRef cf = v16;
            if (v16) {
              CFRetain(v16);
            }
            [a5 addAnimations:v28];
            CFTypeRef v19 = cf;
            CFTypeRef cf = 0;
            if (v19) {
              CFRelease(v19);
            }
            CFTypeRef v20 = v29;
            CFTypeRef v29 = 0;
            if (v20) {
              CFRelease(v20);
            }
            if (v18) {
              CFRelease(v18);
            }
            if (v16) {
              CFRelease(v16);
            }
          }
          else
          {
            uint64_t v25 = [a4 interactionURL];
            if (v25)
            {
              uint64_t v26 = v25;
              [a5 setPreferredCommitStyle:1];
              self->_BOOL useContextMenuInteractionDismissalPreview = 1;
              v27[0] = MEMORY[0x1E4F143A8];
              v27[1] = 3221225472;
              float v27[2] = __120__WKContentView_WKInteractionPreview__contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke_2715;
              v27[3] = &unk_1E5812158;
              void v27[4] = v26;
              [a5 addAnimations:v27];
            }
          }
        }
      }
    }
  }
}

uint64_t __120__WKContentView_WKInteractionPreview__contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:0 completion:0];
}

uint64_t __120__WKContentView_WKInteractionPreview__contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke_2715(uint64_t a1)
{
  id v2 = (void *)[MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v3 = *(void *)(a1 + 32);

  return [v2 openURL:v3 withCompletionHandler:0];
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id WeakRetained = objc_loadWeakRetained(&self->_webView.m_weakReference);
  if (WeakRetained)
  {
    CFRelease(WeakRetained);
    if (self->_contextMenuElementInfo.m_ptr)
    {
      id v8 = objc_msgSend(-[WKContentView webView](self, "webView"), "UIDelegate");
      if (objc_opt_respondsToSelector())
      {
        objc_msgSend(v8, "webView:contextMenuDidEndForElement:", -[WKContentView webView](self, "webView"), self->_contextMenuElementInfo.m_ptr);
      }
      else if (objc_opt_respondsToSelector())
      {
        objc_msgSend(v8, "_webView:contextMenuDidEndForElement:", -[WKContentView webView](self, "webView"), self->_contextMenuElementInfo.m_ptr);
      }
    }
    id m_ptr = self->_page.m_ptr;
    uint64_t v10 = *((void *)m_ptr + 32);
    LOBYTE(v18[0]) = 0;
    WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::StopInteraction>(v10, (uint64_t)v18, *(void *)(*((void *)m_ptr + 4) + 1928), 0);
    id v11 = self->_contextMenuLegacyPreviewController.m_ptr;
    self->_contextMenuLegacyPreviewController.id m_ptr = 0;
    if (v11) {
      CFRelease(v11);
    }
    id v12 = self->_contextMenuLegacyMenu.m_ptr;
    self->_contextMenuLegacyMenu.id m_ptr = 0;
    if (v12) {
      CFRelease(v12);
    }
    self->_contextMenuHasRequestedLegacyData = 0;
    uint64_t v13 = self->_contextMenuElementInfo.m_ptr;
    self->_contextMenuElementInfo.id m_ptr = 0;
    if (v13) {
      CFRelease(v13);
    }
    id v17 = 0;
    objc_initWeak(&v17, self);
    if (a5)
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3321888768;
      _OWORD v18[2] = ___ZZ95__WKContentView_WKInteractionPreview__contextMenuInteraction_willEndForConfiguration_animator__ENK5__132cvU13block_pointerFvvEEv_block_invoke;
      v18[3] = &__block_descriptor_40_e8_32c110_ZTSKZ95__WKContentView_WKInteractionPreview__contextMenuInteraction_willEndForConfiguration_animator__E5__132_e5_v8__0l;
      id v19 = 0;
      objc_copyWeak(&v19, &v17);
      uint64_t v14 = objc_msgSend((id)objc_msgSend(v18, "copy"), "autorelease");
      objc_destroyWeak(&v19);
      [a5 addCompletion:v14];
    }
    else
    {
      uint64_t v15 = (id *)objc_loadWeakRetained(&v17);
      uint64_t v16 = v15;
      if (v15)
      {
        *((unsigned char *)v15 + 1280) = 0;
        [v15 _removeContextMenuHintContainerIfPossible];
        [objc_loadWeak(v16 + 54) _didDismissContextMenu];
        [v16 _stopSuppressingSelectionAssistantForReason:4];
        CFRelease(v16);
      }
    }
    objc_destroyWeak(&v17);
  }
}

- (BOOL)_interactionShouldBeginFromPreviewItemController:(id)a3 forPosition:(CGPoint)a4
{
  CGPoint v22 = a4;
  if (!BYTE6(self->_dataListTextSuggestionsInputView.m_ptr)) {
    return 0;
  }
  WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v21, &v22);
  float v5 = roundf(v21[0]);
  uint64_t v6 = 0x7FFFFFFFLL;
  uint64_t v7 = 0x80000000;
  if (v5 > -2147500000.0) {
    uint64_t v7 = (int)v5;
  }
  if (v5 < 2147500000.0) {
    uint64_t v6 = v7;
  }
  float v8 = roundf(v21[1]);
  uint64_t v9 = 0x7FFFFFFF00000000;
  unint64_t v10 = 0x8000000000000000;
  if (v8 > -2147500000.0) {
    unint64_t v10 = (unint64_t)(int)v8 << 32;
  }
  if (v8 < 2147500000.0) {
    uint64_t v9 = v10;
  }
  uint64_t v11 = v9 | v6;
  if ([(WKContentView *)self _shouldUseContextMenus]) {
    uint64_t v12 = 16777473;
  }
  else {
    uint64_t v12 = 0x1000001000101;
  }
  int v13 = objc_msgSend(-[WKContentView webView](self, "webView"), "_allowAnimationControls");
  uint64_t v14 = 0x10000000000;
  if (!v13) {
    uint64_t v14 = 0;
  }
  if (!-[WKContentView ensurePositionInformationIsUpToDate:](self, "ensurePositionInformationIsUpToDate:", v11, v14 | v12))return 0; {
  if (!self->_positionInformation.isLink)
  }
    return self->_positionInformation.isImage || self->_positionInformation.isAttachment;
  p_url = &self->_positionInformation.url;
  uint64_t v16 = (void *)[objc_loadWeak(&self->_webView.m_weakReference) UIDelegate];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (p_url->m_string.m_impl.m_ptr && *((_DWORD *)p_url->m_string.m_impl.m_ptr + 1))
    {
      if ((*((unsigned char *)&self->_positionInformation.url + 8) & 2) == 0) {
        return WebCore::DataDetection::canBePresentedByDataDetectors((WebCore::DataDetection *)&self->_positionInformation.url, v17);
      }
      return 1;
    }
    return 0;
  }
  id v18 = [[WKPreviewElementInfo alloc] _initWithLinkURL:WTF::URL::operator NSURL *()];
  char v19 = objc_msgSend(v16, "webView:shouldPreviewElement:", -[WKContentView webView](self, "webView"), v18);
  if (v18) {
    CFRelease(v18);
  }
  return v19;
}

- (id)_dataForPreviewItemController:(id)a3 atPosition:(CGPoint)a4 type:(int64_t *)a5
{
  v38[2] = *MEMORY[0x1E4F143B8];
  *a5 = 0;
  uint64_t v7 = (void *)[objc_loadWeak(&self->_webView.m_weakReference) UIDelegate];
  unsigned int v8 = self->_positionInformation.isImage & objc_opt_respondsToSelector();
  if (self->_positionInformation.isLink) {
    int v9 = 1;
  }
  else {
    int v9 = v8;
  }
  char v10 = objc_opt_respondsToSelector();
  if (objc_opt_respondsToSelector() & 1) != 0 || (v10) {
    int v11 = objc_opt_respondsToSelector();
  }
  else {
    int v11 = 0;
  }
  if (!self->_positionInformation.isAttachment && !self->_positionInformation.isImage) {
    int v11 = 0;
  }
  isDataDetectorLinuint64_t k = self->_positionInformation.isDataDetectorLink;
  if (v8)
  {
    if (self->_positionInformation.isAnimatedImage)
    {
      id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      *a5 = 2;
      [v13 setObject:WTF::URL::operator NSURL *() forKeyedSubscript:*MEMORY[0x1E4F43C60]];
      goto LABEL_14;
    }
  }
  else if (((v9 | v11) & 1) == 0)
  {
    return 0;
  }
  id m_ptr = self->_positionInformation.url.m_string.m_impl.m_ptr;
  if (!m_ptr
    || !*((_DWORD *)m_ptr + 1)
    || !self->_positionInformation.isDataDetectorLink && (*((_DWORD *)&self->_positionInformation.url + 2) & 2) == 0)
  {
    if ((v9 ^ 1 | v8))
    {
      id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      if (v8)
      {
        *a5 = 3;
        id v13 = v16;
        [v16 setObject:WTF::URL::operator NSURL *() forKeyedSubscript:*MEMORY[0x1E4F43C60]];
        return (id)(id)CFMakeCollectable(v13);
      }
      id v13 = v16;
LABEL_46:
      if ((v11 & 1) == 0) {
        return (id)(id)CFMakeCollectable(v13);
      }
      *a5 = 5;
      id v29 = [[_WKActivatedElementInfo alloc] _initWithType:2 URL:WTF::URL::operator NSURL *() image:0 information:&self->_positionInformation];
      uint64_t v30 = objc_msgSend(v7, "_webView:indexIntoAttachmentListForElement:", -[WKContentView webView](self, "webView"), v29);
      if (v30 != 0x7FFFFFFFFFFFFFFFLL)
      {
        LOBYTE(v35) = 0;
        if (v10) {
          uint64_t v31 = objc_msgSend(v7, "_attachmentListForWebView:sourceIsManaged:", -[WKContentView webView](self, "webView"), &v35);
        }
        else {
          uint64_t v31 = objc_msgSend(v7, "_attachmentListForWebView:", -[WKContentView webView](self, "webView"));
        }
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v31, *MEMORY[0x1E4F43C40], v35);
        uint64_t v33 = [NSNumber numberWithUnsignedInteger:v30];
        [v13 setObject:v33 forKeyedSubscript:*MEMORY[0x1E4F43C38]];
        uint64_t v34 = [NSNumber numberWithBool:v35];
        [v13 setObject:v34 forKeyedSubscript:*MEMORY[0x1E4F43C48]];
      }
      if (!v29) {
        return (id)(id)CFMakeCollectable(v13);
      }
      id v32 = v29;
      goto LABEL_54;
    }
    return 0;
  }
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ((v9 & 1) == 0) {
    goto LABEL_46;
  }
  *a5 = 2;
  [v13 setObject:WTF::URL::operator NSURL *() forKeyedSubscript:*MEMORY[0x1E4F43C60]];
LABEL_14:
  if (!isDataDetectorLink) {
    return (id)(id)CFMakeCollectable(v13);
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v14 = objc_msgSend(v7, "_dataDetectionContextForWebView:", -[WKContentView webView](self, "webView"));
  }
  else {
    uint64_t v14 = 0;
  }
  id v18 = (void *)[(id)((uint64_t (*)(void))*MEMORY[0x1E4FB6370])() sharedController];
  uint64_t v35 = 0;
  uint64_t v19 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F43C60]];
  if (self->_positionInformation.dataDetectorIdentifier.m_impl.m_ptr) {
    CFTypeRef v20 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    CFTypeRef v20 = &stru_1EEA10550;
  }
  uint64_t v21 = (PAL *)objc_msgSend(v18, "resultForURL:identifier:selectedText:results:context:extendedContext:", v19, v20, -[WKContentView selectedText](self, "selectedText"), self->_positionInformation.dataDetectorResults.m_ptr, v14, &v35);
  if (v21) {
    uint64_t v21 = (PAL *)[v13 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F43C58]];
  }
  CGPoint v22 = self->_positionInformation.textBefore.m_impl.m_ptr;
  if (!v22 || !*((_DWORD *)v22 + 1))
  {
    id v23 = self->_positionInformation.textAfter.m_impl.m_ptr;
    if (!v23 || !*((_DWORD *)v23 + 1))
    {
      uint64_t v28 = 0;
      uint64_t v27 = v35;
      if (!v35) {
        goto LABEL_52;
      }
      goto LABEL_51;
    }
  }
  uint64_t DataDetectorsUI_kDataDetectorsLeadingText = PAL::get_DataDetectorsUI_kDataDetectorsLeadingText(v21);
  if (self->_positionInformation.textBefore.m_impl.m_ptr) {
    id v24 = (PAL *)WTF::StringImpl::operator NSString *();
  }
  else {
    id v24 = (PAL *)&stru_1EEA10550;
  }
  v38[0] = v24;
  uint64_t DataDetectorsUI_kDataDetectorsTrailingText = PAL::get_DataDetectorsUI_kDataDetectorsTrailingText(v24);
  if (self->_positionInformation.textAfter.m_impl.m_ptr) {
    uint64_t v25 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    uint64_t v25 = &stru_1EEA10550;
  }
  v38[1] = v25;
  uint64_t v26 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v38, &DataDetectorsUI_kDataDetectorsLeadingText, 2), "mutableCopy");
  uint64_t v27 = v26;
  if (v35) {
    objc_msgSend(v26, "addEntriesFromDictionary:");
  }
  uint64_t v35 = v27;
  uint64_t v28 = v27;
  if (v27) {
LABEL_51:
  }
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v27, *MEMORY[0x1E4F43C50], v35, DataDetectorsUI_kDataDetectorsLeadingText, DataDetectorsUI_kDataDetectorsTrailingText);
LABEL_52:
  if (v28)
  {
    id v32 = v28;
LABEL_54:
    CFRelease(v32);
  }
  return (id)(id)CFMakeCollectable(v13);
}

- (CGRect)_presentationRectForPreviewItemController:(id)a3
{
  WebCore::IntRect::operator CGRect();
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (id)_presentedViewControllerForPreviewItemController:(id)a3
{
  double v5 = self;
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  p_webView = &self->_webView;
  uint64_t v7 = (void *)[objc_loadWeak(&self->_webView.m_weakReference) UIDelegate];
  [objc_loadWeak(&p_webView->m_weakReference) _didShowContextMenu];
  unsigned int v8 = (void *)[a3 previewData];
  int v9 = (const void *)[v8 objectForKeyedSubscript:*MEMORY[0x1E4F43C60]];
  MEMORY[0x19972E8A0](&v67, v9);
  if (v67 && *((_DWORD *)v67 + 1))
  {
    if ((v68 & 2) != 0) {
      int v10 = 1;
    }
    else {
      int v10 = WTF::URL::protocolIs();
    }
  }
  else
  {
    int v10 = 0;
  }
  if ([v5->_previewItemController.m_ptr type] == 2)
  {
    BYTE6(v5->_dataListTextSuggestionsInputView.m_ptr) = 0;
    id m_ptr = v5->_page.m_ptr;
    uint64_t v12 = *((void *)m_ptr + 32);
    CFTypeRef cf = &v5->_positionInformation.elementContext.var0.var2 + 1;
    p_positionInformation = &v5->_positionInformation;
    WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::StartInteractionWithElementContextOrPosition>(v12, (uint64_t)&cf, *(void *)(*((void *)m_ptr + 4) + 1928), 0);
    if (!v10 || !v5->_positionInformation.isAnimatedImage) {
      goto LABEL_64;
    }
    id v13 = [[_WKActivatedElementInfo alloc] _initWithType:1 URL:v9 imageURL:0 information:&v5->_positionInformation];
    char v15 = objc_opt_respondsToSelector();
    if ((v15 & 1) != 0
      && ((id v16 = v5->_actionSheetAssistant.m_ptr) == 0
        ? (CFTypeRef v17 = 0)
        : ([v16 defaultActionsForImageSheet:v13], CFTypeRef v17 = cf),
          uint64_t v36 = [(WKContentView *)v5 webView],
          CFTypeRef cf = (CFTypeRef)*((void *)v5->_positionInformation.image.m_ptr + 1),
          WebCore::IntSize::operator CGSize(),
          CFTypeRef v3 = (CFTypeRef)objc_msgSend(v7, "_webView:previewViewControllerForAnimatedImageAtURL:defaultActions:elementInfo:imageSize:", v36, v9, v17, v13), v17))
    {
      CFRelease(v17);
      if (!v13)
      {
LABEL_63:
        if (v15) {
          goto LABEL_94;
        }
LABEL_64:
        CFTypeRef v56 = [[_WKActivatedElementInfo alloc] _initWithType:0 URL:v9 imageURL:0 information:&v5->_positionInformation];
        long long v37 = v5->_actionSheetAssistant.m_ptr;
        if (v37) {
          [v37 defaultActionsForLinkSheet:v56];
        }
        else {
          CFTypeRef cf = 0;
        }
        if ((objc_opt_respondsToSelector() & 1) == 0) {
          goto LABEL_84;
        }
        CFTypeRef v52 = v5;
        id v55 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v51 = v7;
        long long v65 = 0u;
        long long v66 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        CFTypeRef v53 = v9;
        obuint64_t j = (id)cf;
        uint64_t v38 = [(id)cf countByEnumeratingWithState:&v63 objects:v71 count:16];
        if (v38)
        {
          uint64_t v39 = *(void *)v64;
          do
          {
            for (uint64_t i = 0; i != v38; ++i)
            {
              if (*(void *)v64 != v39) {
                objc_enumerationMutation(obj);
              }
              char v41 = *(_WKElementAction **)(*((void *)&v63 + 1) + 8 * i);
              id v42 = previewIdentifierForElementAction(v41);
              uint64_t v43 = [(_WKElementAction *)v41 title];
              v61[0] = MEMORY[0x1E4F143A8];
              v61[1] = 3321888768;
              v61[2] = __88__WKContentView_WKInteractionPreview___presentedViewControllerForPreviewItemController___block_invoke;
              v61[3] = &unk_1EEA0E540;
              v61[4] = v41;
              CFTypeRef v62 = v56;
              if (v56) {
                CFRetain(v56);
              }
              objc_msgSend(v55, "addObject:", +[WKPreviewAction actionWithIdentifier:title:style:handler:](WKPreviewAction, "actionWithIdentifier:title:style:handler:", v42, v43, 0, v61));
              CFTypeRef v44 = v62;
              CFTypeRef v62 = 0;
              if (v44) {
                CFRelease(v44);
              }
            }
            uint64_t v38 = [obj countByEnumeratingWithState:&v63 objects:v71 count:16];
          }
          while (v38);
        }
        int v9 = v53;
        id v45 = [[WKPreviewElementInfo alloc] _initWithLinkURL:v53];
        double v5 = v52;
        uint64_t v7 = v51;
        CFTypeRef v3 = (CFTypeRef)objc_msgSend(v51, "webView:previewingViewControllerForElement:defaultActions:", -[WKContentView webView](v52, "webView"), v45, v55);
        if (v45) {
          CFRelease(v45);
        }
        if (v55) {
          CFRelease(v55);
        }
        if (!v3)
        {
LABEL_84:
          if (objc_opt_respondsToSelector())
          {
            uint64_t v46 = [(WKContentView *)v5 webView];
            uint64_t v47 = [v7 _webView:v46 previewViewControllerForURL:v9 defaultActions:cf elementInfo:v56];
LABEL_88:
            CFTypeRef v3 = (CFTypeRef)v47;
            goto LABEL_90;
          }
          if (objc_opt_respondsToSelector())
          {
            uint64_t v47 = objc_msgSend(v7, "_webView:previewViewControllerForURL:", -[WKContentView webView](v5, "webView"), v9);
            goto LABEL_88;
          }
          CFTypeRef v3 = 0;
        }
LABEL_90:
        CFTypeRef v48 = cf;
        CFTypeRef cf = 0;
        if (v48) {
          CFRelease(v48);
        }
        uint64_t v35 = v56;
        if (v56) {
          goto LABEL_93;
        }
        goto LABEL_94;
      }
    }
    else if (!v13)
    {
      goto LABEL_63;
    }
    CFRelease(v13);
    goto LABEL_63;
  }
  if ([v5->_previewItemController.m_ptr type] == 3) {
    int v18 = v10;
  }
  else {
    int v18 = 0;
  }
  if (v18 != 1)
  {
    CFTypeRef v3 = 0;
    goto LABEL_94;
  }
  if (v9) {
    CFRetain(v9);
  }
  WebCore::ShareableBitmap::makeCGImageCopy((uint64_t *)&v60, (WebCore::ShareableBitmap *)v5->_positionInformation.image.m_ptr);
  id v19 = objc_alloc(MEMORY[0x1E4F42A80]);
  CFTypeRef v20 = (const void *)[v19 initWithCGImage:v60];
  if (objc_opt_respondsToSelector())
  {
    CFTypeRef cf = 0;
    uint64_t v21 = v9;
    CGPoint v22 = (const void *)objc_msgSend(v7, "_webView:alternateURLFromImage:userInfo:", -[WKContentView webView](v5, "webView"), v20, &cf);
    int v9 = v22;
    if (v22) {
      CFRetain(v22);
    }
    if (v21) {
      CFRelease(v21);
    }
    CFTypeRef v23 = cf;
    if (cf) {
      CFRetain(cf);
    }
  }
  else
  {
    CFTypeRef v23 = 0;
    uint64_t v21 = v9;
  }
  id v24 = [[_WKActivatedElementInfo alloc] _initWithType:1 URL:v9 imageURL:0 userInfo:v23 information:&v5->_positionInformation];
  uint64_t v25 = v5->_page.m_ptr;
  uint64_t v26 = *((void *)v25 + 32);
  CFTypeRef cf = &v5->_positionInformation.elementContext.var0.var2 + 1;
  p_positionInformation = &v5->_positionInformation;
  WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::StartInteractionWithElementContextOrPosition>(v26, (uint64_t)&cf, *(void *)(*((void *)v25 + 4) + 1928), 0);
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v7, "_webView:willPreviewImageWithURL:", -[WKContentView webView](v5, "webView"), v21);
  }
  uint64_t v27 = v5->_actionSheetAssistant.m_ptr;
  if (v27)
  {
    [v27 defaultActionsForImageSheet:v24];
    if (!v23) {
      goto LABEL_36;
    }
LABEL_34:
    if (objc_opt_respondsToSelector())
    {
      uint64_t v28 = [(WKContentView *)v5 webView];
      CFTypeRef v3 = (CFTypeRef)[v7 _webView:v28 previewViewControllerForImage:v20 alternateURL:v9 defaultActions:cf elementInfo:v24];
      if (v3) {
        goto LABEL_48;
      }
    }
    goto LABEL_36;
  }
  CFTypeRef cf = 0;
  if (v23) {
    goto LABEL_34;
  }
LABEL_36:
  id v29 = [WKImagePreviewViewController alloc];
  CFTypeRef v59 = v60;
  if (v60) {
    CFRetain(v60);
  }
  CFTypeRef v58 = cf;
  if (cf) {
    CFRetain(cf);
  }
  CFTypeRef v57 = v24;
  if (v24) {
    CFRetain(v24);
  }
  CFTypeRef v3 = (id)CFMakeCollectable([(WKImagePreviewViewController *)v29 initWithCGImage:&v59 defaultActions:&v58 elementInfo:&v57]);
  CFTypeRef v30 = v57;
  CFTypeRef v57 = 0;
  if (v30) {
    CFRelease(v30);
  }
  CFTypeRef v31 = v58;
  CFTypeRef v58 = 0;
  if (v31) {
    CFRelease(v31);
  }
  CFTypeRef v32 = v59;
  CFTypeRef v59 = 0;
  if (v32) {
    CFRelease(v32);
  }
LABEL_48:
  CFTypeRef v33 = cf;
  CFTypeRef cf = 0;
  if (v33) {
    CFRelease(v33);
  }
  if (v24) {
    CFRelease(v24);
  }
  if (v20) {
    CFRelease(v20);
  }
  CFTypeRef v34 = v60;
  CFTypeRef v60 = 0;
  if (!v34)
  {
    if (!v23) {
      goto LABEL_57;
    }
    goto LABEL_56;
  }
  CFRelease(v34);
  if (v23) {
LABEL_56:
  }
    CFRelease(v23);
LABEL_57:
  uint64_t v35 = v9;
  if (v9) {
LABEL_93:
  }
    CFRelease(v35);
LABEL_94:
  id v49 = v67;
  CFTypeRef v67 = 0;
  if (v49)
  {
    if (*(_DWORD *)v49 == 2) {
      WTF::StringImpl::destroy(v49, v14);
    }
    else {
      *(_DWORD *)v49 -= 2;
    }
  }
  return (id)v3;
}

uint64_t __88__WKContentView_WKInteractionPreview___presentedViewControllerForPreviewItemController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) runActionWithElementInfo:*(void *)(a1 + 40)];
}

- (void)_previewItemController:(id)a3 commitPreview:(id)a4
{
  double v6 = (void *)[objc_loadWeak(&self->_webView.m_weakReference) UIDelegate];
  if ([self->_previewItemController.m_ptr type] == 3)
  {
    if (objc_opt_respondsToSelector())
    {
      id m_ptr = self->_positionInformation.imageURL.m_string.m_impl.m_ptr;
      if (m_ptr)
      {
        if (*((_DWORD *)m_ptr + 1)
          && ((*((unsigned char *)&self->_positionInformation.imageURL + 8) & 2) != 0 || WTF::URL::protocolIs()))
        {
          id v8 = [(WKContentView *)self webView];
          uint64_t v9 = WTF::URL::operator NSURL *();
          [v6 _webView:v8 commitPreviewedImageWithURL:v9];
        }
      }
    }
  }
  else if (objc_opt_respondsToSelector())
  {
    id v10 = [(WKContentView *)self webView];
    [v6 webView:v10 commitPreviewingViewController:a4];
  }
  else if (objc_opt_respondsToSelector())
  {
    id v11 = [(WKContentView *)self webView];
    [v6 _webView:v11 commitPreviewedViewController:a4];
  }
}

- (void)_interactionStartedFromPreviewItemController:(id)a3
{
  [(WKContentView *)self _removeDefaultGestureRecognizers];

  [(WKContentView *)self _cancelInteraction];
}

- (void)_interactionStoppedFromPreviewItemController:(id)a3
{
  [(WKContentView *)self _addDefaultGestureRecognizers];
  if (([self->_actionSheetAssistant.m_ptr isShowingSheet] & 1) == 0)
  {
    id m_ptr = self->_page.m_ptr;
    uint64_t v5 = *((void *)m_ptr + 32);
    char v6 = 0;
    WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::StopInteraction>(v5, (uint64_t)&v6, *(void *)(*((void *)m_ptr + 4) + 1928), 0);
  }
}

- (void)_previewItemController:(id)a3 didDismissPreview:(id)a4 committing:(BOOL)a5
{
  BOOL v5 = a5;
  p_webView = &self->_webView;
  uint64_t v9 = (void *)[objc_loadWeak(&self->_webView.m_weakReference) UIDelegate];
  if (objc_opt_respondsToSelector())
  {
    objc_msgSend(v9, "_webView:didDismissPreviewViewController:committing:", -[WKContentView webView](self, "webView"), a4, v5);
  }
  else if (objc_opt_respondsToSelector())
  {
    objc_msgSend(v9, "_webView:didDismissPreviewViewController:", -[WKContentView webView](self, "webView"), a4);
  }
  id Weak = objc_loadWeak(&p_webView->m_weakReference);

  [Weak _didDismissContextMenu];
}

- (id)_presentationSnapshotForPreviewItemController:(id)a3
{
  id m_ptr = self->_positionInformation.linkIndicator.contentImage.m_ptr;
  if (m_ptr)
  {
    uint64_t v4 = WebCore::DestinationColorSpace::SRGB((WebCore::DestinationColorSpace *)self);
    (*(void (**)(WebCore::NativeImage **__return_ptr, Image *, uint64_t))(*(void *)m_ptr + 288))(&v18, m_ptr, v4);
    if (!v18) {
      return 0;
    }
    id v5 = objc_alloc(MEMORY[0x1E4F42A80]);
    char v6 = (const void *)[v5 initWithCGImage:*(void *)WebCore::NativeImage::platformImage(v18)];
    id m_ptr = (id)CFMakeCollectable(v6);
    id v8 = v18;
    int v18 = 0;
    if (v8)
    {
      char v9 = 0;
      uint64_t v10 = *((void *)v8 + 1);
      atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)v10, (unsigned __int8 *)&v9, 1u, memory_order_acquire, memory_order_acquire);
      if (v9) {
        MEMORY[0x19972E8D0](v10);
      }
      uint64_t v11 = *(void *)(v10 + 8);
      int v12 = 1;
      uint64_t v13 = v11 - 1;
      *(void *)(v10 + 8) = v11 - 1;
      if (v11 == 1)
      {
        uint64_t v17 = *(void *)(v10 + 16);
        uint64_t v14 = *(void *)(v10 + 24);
        *(void *)(v10 + 24) = 0;
        BOOL v15 = v17 != 0;
      }
      else
      {
        uint64_t v14 = 0;
        BOOL v15 = 1;
      }
      atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)v10, (unsigned __int8 *)&v12, 0, memory_order_release, memory_order_relaxed);
      if (v12 == 1)
      {
        if (v13) {
          return m_ptr;
        }
      }
      else
      {
        WTF::Lock::unlockSlow((WTF::Lock *)v10);
        if (v13) {
          return m_ptr;
        }
      }
      if (v14) {
        (*(void (**)(uint64_t))(*(void *)v14 + 8))(v14);
      }
      if (!v15) {
        WTF::fastFree((WTF *)v10, v7);
      }
    }
  }
  return m_ptr;
}

- (id)_presentationRectsForPreviewItemController:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  p_positionInformation = &self->_positionInformation;
  if (self->_positionInformation.linkIndicator.contentImage.m_ptr)
  {
    m_double x = self->_positionInformation.linkIndicator.textBoundingRectInRootViewCoordinates.m_location.m_x;
    m_double y = self->_positionInformation.linkIndicator.textBoundingRectInRootViewCoordinates.m_location.m_y;
    char v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:self->_positionInformation.linkIndicator.textRectsInBoundingRectCoordinates.m_size];
    uint64_t m_size = p_positionInformation->linkIndicator.textRectsInBoundingRectCoordinates.m_size;
    if (m_size)
    {
      m_buffer = p_positionInformation->linkIndicator.textRectsInBoundingRectCoordinates.m_buffer;
      double v9 = m_x;
      double v10 = m_y;
      uint64_t v11 = 16 * m_size;
      do
      {
        WebCore::FloatRect::operator CGRect();
        int v12 = (void *)MEMORY[0x1E4F29238];
        CGRect v23 = CGRectOffset(v22, v9, v10);
        uint64_t v13 = objc_msgSend(v12, "valueWithCGRect:", v23.origin.x, v23.origin.y, v23.size.width, v23.size.height);
        if (v13) {
          [v6 addObject:v13];
        }
        ++m_buffer;
        v11 -= 16;
      }
      while (v11);
    }
    uint64_t v14 = (void *)CFMakeCollectable(v6);
    return v14;
  }
  else
  {
    id m_ptr = self->_page.m_ptr;
    uint64_t v17 = 764;
    if (!*((unsigned char *)m_ptr + 768)) {
      uint64_t v17 = 760;
    }
    float v18 = *(float *)((char *)m_ptr + v17);
    id v19 = (void *)MEMORY[0x1E4F29238];
    WebCore::IntRect::operator CGRect();
    CGRect v25 = CGRectInset(v24, (float)(v18 * -4.0), (float)(v18 * -4.0));
    v20[0] = objc_msgSend(v19, "valueWithCGRect:", v25.origin.x, v25.origin.y, v25.size.width, v25.size.height);
    return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  }
}

- (void)_previewItemControllerDidCancelPreview:(id)a3
{
  BYTE6(self->_dataListTextSuggestionsInputView.m_ptr) = 0;
  id Weak = objc_loadWeak(&self->_webView.m_weakReference);

  [Weak _didDismissContextMenu];
}

@end