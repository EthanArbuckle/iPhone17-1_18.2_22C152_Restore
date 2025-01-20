@interface CKMessageEntryContentView
+ (id)_createSubjectView;
+ (id)_createTextView:(BOOL)a3 shouldUseNonEmojiKeyboard:(BOOL)a4 shouldUseNonHandwritingKeyboard:(BOOL)a5 shouldDisableKeyboardStickers:(BOOL)a6;
+ (void)configureMessageBodyEntryTextView:(id)a3 shouldUseNonEmojiKeyboard:(BOOL)a4 shouldUseNonHandwritingKeyboard:(BOOL)a5;
+ (void)getClearButtonOffsetTop:(double *)a3 clearButtonOffsetTrailing:(double *)a4 forPluginWithBundleID:(id)a5;
+ (void)prewarmTextView;
- (BOOL)_currentPluginIsGPPlugin;
- (BOOL)_currentPluginIsPhotosPlugin;
- (BOOL)_currentPluginPayloadHasPhotosExtensionMediaPayload;
- (BOOL)_shouldDeferUpdateUI;
- (BOOL)canApplyTextEffectFromKeyCommand;
- (BOOL)canApplyTextStyleFromKeyCommand;
- (BOOL)canStartNewTextAnimationsInTextEffectCoordinator:(id)a3;
- (BOOL)forceEnsureTextViewVisble;
- (BOOL)ignoreEndEditing;
- (BOOL)isActive;
- (BOOL)isCompositionExpirable;
- (BOOL)isShowingDictationPlaceholder;
- (BOOL)isSingleLine;
- (BOOL)makeActive;
- (BOOL)messageEntryRichTextView:(id)a3 canPerformDictationAction:(id)a4;
- (BOOL)messageEntryRichTextView:(id)a3 shouldPasteMediaObjects:(id)a4;
- (BOOL)messageEntryRichTextView:(id)a3 shouldRecognizeGesture:(id)a4;
- (BOOL)messageEntryRichTextViewShouldAllowLinkCustomization:(id)a3;
- (BOOL)messageEntryRichTextViewShouldResignFirstResponder:(id)a3;
- (BOOL)messageEntryRichTextViewSupportsInlineAdaptiveImageGlyphs:(id)a3;
- (BOOL)needsEnsureSelectionVisible;
- (BOOL)needsEnsureTextViewVisible;
- (BOOL)needsTextLayout;
- (BOOL)pendingShelfPayloadWillAnimateIn;
- (BOOL)shouldHideClearPluginButton;
- (BOOL)shouldShowClearButton;
- (BOOL)shouldShowGenerationButton;
- (BOOL)shouldShowPlugin;
- (BOOL)shouldShowSubject;
- (BOOL)shouldSkipRemovalFromParent;
- (BOOL)shouldStripEmojis;
- (BOOL)textEffectCoordinator:(id)a3 textViewIdentifierIsCandidateForTextEffectPlayback:(id)a4;
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (BOOL)textView:(id)a3 shouldInteractWithTextAttachment:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (BOOL)textViewShouldBeginEditing:(id)a3;
- (CGRect)computedClearPluginButtonFrame;
- (CGRect)computedPluginViewFrame;
- (CGSize)_computedSizeForTextView:(id)a3 maxWidth:(double)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKComposition)composition;
- (CKConversation)conversation;
- (CKMediaObject)shelfMediaObject;
- (CKMentionsAnimationController)mentionsController;
- (CKMessageEntryContentView)initWithFrame:(CGRect)a3 shouldShowSubject:(BOOL)a4 shouldDisableAttachments:(BOOL)a5 shouldUseNonEmojiKeyboard:(BOOL)a6 shouldUseNonHandwritingKeyboard:(BOOL)a7 shouldDisableKeyboardStickers:(BOOL)a8;
- (CKMessageEntryRichTextView)textView;
- (CKMessageEntryTextView)activeView;
- (CKMessageEntryTextView)subjectView;
- (CKPluginEntryViewController)pluginEntryViewController;
- (CKSendLaterPluginInfo)sendLaterPluginInfo;
- (CKSendLaterView)sendLaterView;
- (IMPluginPayload)shelfPluginPayload;
- (NSArray)collaborationOptions;
- (NSDictionary)bizIntent;
- (NSString)overridePlaceholderText;
- (NSString)placeholderText;
- (NSString)requestedPlaceholderText;
- (NSString)selectedText;
- (UIButton)clearPluginButton;
- (UIEdgeInsets)_pluginMargins;
- (UIEdgeInsets)contentTextAlignmentInsets;
- (UIImpactFeedbackGenerator)impactFeedbackGenerator;
- (UIView)pluginDividerLine;
- (UIView)pluginView;
- (UIView)textAndSubjectDividerLine;
- (_SWCollaborationShareOptions)collaborationShareOptions;
- (_TtC7ChatKit23CKTextEffectCoordinator)textEffectCoordinator;
- (char)balloonColor;
- (double)_calcuateIdealMaxPluginHeight:(BOOL)a3;
- (double)_maxWidthForTextView;
- (double)balloonMaxWidthForMessageEntryRichTextView:(id)a3;
- (double)containerViewLineWidth;
- (double)entryContentViewTextLeftOffset;
- (double)maxContentWidthWhenExpanded;
- (double)maxPluginShelfViewWidth;
- (double)maxPreviewContentWidthWhenExpanded;
- (double)maxWidthForPreviewImagesInMessageEntryRichTextView:(id)a3;
- (double)placeHolderWidth;
- (double)sendButtonTextInsetWidth;
- (id)pluginSnapshotViewForPluginAtIndex:(unint64_t)a3 isFromTextAttachment:(BOOL *)a4 startingScaleMultiplier:(double *)a5;
- (id)richLinksEditMenuForAttributedText:(id)a3 inRange:(_NSRange)a4;
- (id)textDraggableView:(id)a3 itemsForDrag:(id)a4;
- (id)textEffectCoordinator:(id)a3 highPriorityTextViewIdentifiersForUnplayedVisibleTextViewIdentifiers:(id)a4;
- (id)textEffectsEditMenuForTextInRange:(_NSRange)a3;
- (id)textView:(id)a3 editMenuForTextInRange:(_NSRange)a4 suggestedActions:(id)a5;
- (id)visibleTextViewIdentifiersFor:(id)a3;
- (int64_t)activeTextEffectTypeInSelectedRange;
- (int64_t)style;
- (unint64_t)activeTextStylesInSelectedRange;
- (void)_didChangeAttributesAffectingTextSize;
- (void)_layoutDividerLine:(id)a3 leftInset:(double)a4 widthInset:(double)a5 currentYOffset:(double *)a6;
- (void)_layoutTextView:(id)a3 currentYOffset:(double *)a4 originX:(double)a5 maxWidth:(double)a6;
- (void)_provideHapticFeedbackIfNecessaryForText:(id)a3;
- (void)_updateAttributedTextContent:(id)a3 byApplyingInteraction:(int64_t)a4 toLinkTextAttachments:(id)a5;
- (void)_updateUI;
- (void)acceptAutocorrectionForChat:(id)a3 completionHandler:(id)a4;
- (void)applyTextEffect:(int64_t)a3;
- (void)applyTextEffect:(int64_t)a3 toTextRange:(_NSRange)a4;
- (void)applyTextStyle:(unint64_t)a3;
- (void)applyTextStyle:(unint64_t)a3 toTextRange:(_NSRange)a4;
- (void)balloonPluginDataSource:(id)a3 shouldSendAsCopy:(BOOL)a4;
- (void)ckSendLaterViewCancelled:(id)a3;
- (void)ckSendLaterViewWantsDatePickerPresented:(id)a3;
- (void)clearPluginButtonTapped:(id)a3;
- (void)collapseTextFieldsIfInPencilMode;
- (void)configureShelfForPluginPayload:(id)a3;
- (void)dealloc;
- (void)didFinishAnimatedBoundsChange;
- (void)didMoveToSuperview;
- (void)ensureSelectionVisibleIfNeeded;
- (void)ensureTextViewVisibleIfNeeded;
- (void)hideTextEffectsPickerIfNeededAndResetTypingAttributes;
- (void)invalidateComposition;
- (void)layoutSubviews;
- (void)messageEntryRichTextView:(id)a3 didAddPluginTextAttachmentViewControllerToViewHierarchy:(id)a4;
- (void)messageEntryRichTextView:(id)a3 didPasteComposition:(id)a4;
- (void)messageEntryRichTextView:(id)a3 didTapGenerativeButtonForImageURL:(id)a4;
- (void)messageEntryRichTextView:(id)a3 didTapMediaObject:(id)a4;
- (void)messageEntryRichTextView:(id)a3 pastedURL:(id)a4;
- (void)messageEntryRichTextView:(id)a3 willAddPluginTextAttachmentViewControllerToViewHierarchy:(id)a4;
- (void)messageEntryRichTextViewDidDismissCustomizationPicker:(id)a3;
- (void)messageEntryRichTextViewDidPresentCustomizationPicker:(id)a3;
- (void)messageEntryRichTextViewDidTapHandwritingKey:(id)a3;
- (void)messageEntryRichTextViewWasTapped:(id)a3 isLongPress:(BOOL)a4;
- (void)messageEntryRichTextViewWillDismissCustomizationPicker:(id)a3;
- (void)messageEntryRichTextViewWillPresentCustomizationPicker:(id)a3;
- (void)messageEntryTextView:(id)a3 applyStyleChangeOfType:(unint64_t)a4 add:(BOOL)a5 forRange:(_NSRange)a6;
- (void)messageEntryTextView:(id)a3 didSetAnimationName:(id)a4 forRange:(_NSRange)a5;
- (void)messageEntryTextView:(id)a3 didUpdateForRange:(_NSRange)a4 conversionHandler:(id)a5;
- (void)messageEntryTextView:(id)a3 replaceRange:(_NSRange)a4 withAttributedText:(id)a5;
- (void)messageEntryTextViewDidChangePencilMode:(id)a3;
- (void)messageEntryTextViewTextFormattingAnimationsOptionsPresentationInProgress:(BOOL)a3;
- (void)pluginPayloadDidLoad:(id)a3;
- (void)pluginPayloadWantsResize:(id)a3;
- (void)prepareForShelfPayloadAnimation;
- (void)prepareTextEffectsForImmediateMessageSend;
- (void)quicktationEnablementDidChange;
- (void)setActiveView:(id)a3;
- (void)setBalloonColor:(char)a3;
- (void)setBizIntent:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setClearPluginButton:(id)a3;
- (void)setClearPluginButtonEnabled:(BOOL)a3;
- (void)setCollaborationOptions:(id)a3;
- (void)setCollaborationShareOptions:(id)a3;
- (void)setComposition:(id)a3;
- (void)setContainerViewLineWidth:(double)a3;
- (void)setConversation:(id)a3;
- (void)setForceEnsureTextViewVisble:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setIgnoreEndEditing:(BOOL)a3;
- (void)setImpactFeedbackGenerator:(id)a3;
- (void)setIsCompositionExpirable:(BOOL)a3;
- (void)setMaxContentWidthWhenExpanded:(double)a3;
- (void)setMaxPluginShelfViewWidth:(double)a3;
- (void)setMaxPreviewContentWidthWhenExpanded:(double)a3;
- (void)setMentionsController:(id)a3;
- (void)setNeedsEnsureSelectionVisible:(BOOL)a3;
- (void)setNeedsEnsureTextViewVisible:(BOOL)a3;
- (void)setNeedsTextLayout:(BOOL)a3;
- (void)setOverridePlaceholderText:(id)a3;
- (void)setPendingShelfPayloadWillAnimateIn:(BOOL)a3;
- (void)setPlaceHolderWidth:(double)a3;
- (void)setPlaceholderText:(id)a3;
- (void)setPluginDividerLine:(id)a3;
- (void)setPluginEntryViewController:(id)a3;
- (void)setRequestedPlaceholderText:(id)a3;
- (void)setSendButtonTextInsetWidth:(double)a3;
- (void)setSendLaterPluginInfo:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5;
- (void)setSendLaterView:(id)a3;
- (void)setShelfMediaObject:(id)a3;
- (void)setShelfPluginPayload:(id)a3;
- (void)setShouldHideClearPluginButton:(BOOL)a3;
- (void)setShouldShowSubject:(BOOL)a3;
- (void)setShouldSkipRemovalFromParent:(BOOL)a3;
- (void)setShouldStripEmojis:(BOOL)a3;
- (void)setStyle:(int64_t)a3;
- (void)setSubjectView:(id)a3;
- (void)setTextAndSubjectDividerLine:(id)a3;
- (void)setTextEffectCoordinator:(id)a3;
- (void)setTextEffectCoordinatorPaused:(BOOL)a3 reason:(id)a4;
- (void)setTextView:(id)a3;
- (void)textViewDidBeginEditing:(id)a3;
- (void)textViewDidChange:(id)a3;
- (void)textViewDidChangeSelection:(id)a3;
- (void)textViewDidEndEditing:(id)a3;
- (void)textViewDidEndEmojiRippleAnimation:(id)a3;
- (void)textViewWillBeginEmojiRippleAnimation:(id)a3;
- (void)textViewWritingToolsDidEnd:(id)a3;
- (void)textViewWritingToolsWillBegin:(id)a3;
- (void)unpauseTextEffectsCoordinator;
- (void)willAnimateBoundsChange;
@end

@implementation CKMessageEntryContentView

+ (id)_createTextView:(BOOL)a3 shouldUseNonEmojiKeyboard:(BOOL)a4 shouldUseNonHandwritingKeyboard:(BOOL)a5 shouldDisableKeyboardStickers:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  BOOL v9 = a3;
  v11 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  uint64_t v12 = [v11 isTextKit2Enabled];

  v13 = [CKMessageEntryRichTextView alloc];
  v14 = -[CKMessageEntryRichTextView initWithFrame:usingTextLayoutManager:shouldDisableAttachments:shouldDisableKeyboardStickers:](v13, "initWithFrame:usingTextLayoutManager:shouldDisableAttachments:shouldDisableKeyboardStickers:", v12, v9, v6, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [a1 configureMessageBodyEntryTextView:v14 shouldUseNonEmojiKeyboard:v8 shouldUseNonHandwritingKeyboard:v7];

  return v14;
}

+ (void)configureMessageBodyEntryTextView:(id)a3 shouldUseNonEmojiKeyboard:(BOOL)a4 shouldUseNonHandwritingKeyboard:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v18 = a3;
  [v18 setShowsHorizontalScrollIndicator:1];
  BOOL v7 = CKFrameworkBundle();
  BOOL v8 = [v7 localizedStringForKey:@"MADRID" value:&stru_1EDE4CA38 table:@"ChatKit"];
  [v18 setPlaceholderText:v8];

  BOOL v9 = +[CKUIBehavior sharedBehaviors];
  v10 = [v9 balloonTextFont];
  [v18 setFont:v10];

  [v18 setSupportsBigEmojiTextStyles:1];
  [v18 setBackgroundColor:0];
  v11 = +[CKUIBehavior sharedBehaviors];
  uint64_t v12 = [v11 theme];
  v13 = [v12 entryFieldTextColor];
  [v18 setTextColor:v13];

  v14 = +[CKUIBehavior sharedBehaviors];
  v15 = [v14 theme];
  objc_msgSend(v18, "setKeyboardAppearance:", objc_msgSend(v15, "keyboardAppearance"));

  if (!CKIsRunningInMessagesNotificationExtension())
  {
    uint64_t v16 = 126;
    if (v5) {
      uint64_t v16 = 0;
    }
    if (v6) {
      uint64_t v17 = 13;
    }
    else {
      uint64_t v17 = v16;
    }
    [v18 setKeyboardType:v17];
  }
  [v18 setOpaque:0];
}

+ (void)prewarmTextView
{
  id v2 = (id)[(id)objc_opt_class() _createTextView:0 shouldUseNonEmojiKeyboard:0 shouldUseNonHandwritingKeyboard:0 shouldDisableKeyboardStickers:0];
}

- (BOOL)canApplyTextEffectFromKeyCommand
{
  id v2 = [(CKMessageEntryContentView *)self textView];
  char v3 = [v2 isExpressiveTextEnabled];

  return v3;
}

- (BOOL)canApplyTextStyleFromKeyCommand
{
  id v2 = [(CKMessageEntryContentView *)self textView];
  char v3 = [v2 isExpressiveTextEnabled];

  return v3;
}

- (int64_t)activeTextEffectTypeInSelectedRange
{
  char v3 = [(CKMessageEntryContentView *)self textView];
  uint64_t v4 = [v3 selectedRange];
  uint64_t v6 = v5;

  BOOL v7 = [(CKMessageEntryContentView *)self textView];
  int64_t v8 = objc_msgSend(v7, "ck_activeTextEffectTypeInRange:", v4, v6);

  return v8;
}

- (unint64_t)activeTextStylesInSelectedRange
{
  char v3 = [(CKMessageEntryContentView *)self textView];
  uint64_t v4 = [v3 selectedRange];
  uint64_t v6 = v5;

  BOOL v7 = [(CKMessageEntryContentView *)self textView];
  unint64_t v8 = objc_msgSend(v7, "ck_activeTextStylesInRange:", v4, v6);

  return v8;
}

- (id)textEffectsEditMenuForTextInRange:(_NSRange)a3
{
  length = (void *)a3.length;
  uint64_t v4 = (void *)a3.location;
  v29[2] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v7 = [v6 isExpressiveTextEnabled];

  if (v7)
  {
    id location = 0;
    objc_initWeak(&location, self);
    unint64_t v8 = [(CKMessageEntryContentView *)self textView];
    uint64_t v9 = objc_msgSend(v8, "ck_activeTextStylesInRange:", v4, length);

    v10 = [(CKMessageEntryContentView *)self textView];
    uint64_t v11 = objc_msgSend(v10, "ck_activeTextEffectTypeInRange:", v4, length);

    uint64_t v12 = [(CKMessageEntryContentView *)self selectedText];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __76__CKMessageEntryContentView_TextEffects__textEffectsEditMenuForTextInRange___block_invoke;
    v26[3] = &unk_1E5625098;
    objc_copyWeak(v27, &location);
    v27[1] = v4;
    v27[2] = length;
    v13 = +[CKTextEffectsMenuFactory textStylePaletteMenuWithActiveTextStyles:v9 selectedText:v12 handler:v26];

    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __76__CKMessageEntryContentView_TextEffects__textEffectsEditMenuForTextInRange___block_invoke_2;
    v24 = &unk_1E56250C0;
    objc_copyWeak(v25, &location);
    v25[1] = v4;
    v25[2] = length;
    v14 = +[CKTextEffectsMenuFactory inlineEffectMenuWithHandler:&v21 activeTextEffectType:v11];
    int v15 = CKIsRunningInMacCatalyst();
    uint64_t v16 = (void *)MEMORY[0x1E4F42B80];
    v29[0] = v13;
    v29[1] = v14;
    uint64_t v17 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v29, 2, v21, v22, v23, v24);
    if (v15) {
      uint64_t v18 = 17;
    }
    else {
      uint64_t v18 = 1;
    }
    v19 = [v16 menuWithTitle:&stru_1EDE4CA38 image:0 identifier:0 options:v18 children:v17];

    objc_destroyWeak(v25);
    objc_destroyWeak(v27);
    objc_destroyWeak(&location);
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

void __76__CKMessageEntryContentView_TextEffects__textEffectsEditMenuForTextInRange___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "applyTextStyle:toTextRange:", a2, *(void *)(a1 + 40), *(void *)(a1 + 48));
}

void __76__CKMessageEntryContentView_TextEffects__textEffectsEditMenuForTextInRange___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "applyTextEffect:toTextRange:", a2, *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)applyTextStyle:(unint64_t)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(CKMessageEntryContentView *)self textView];
  NSUInteger v6 = [v5 selectedRange];
  NSUInteger v8 = v7;

  uint64_t v9 = [(CKMessageEntryContentView *)self composition];
  v10 = [v9 text];
  uint64_t v11 = [v10 string];

  unint64_t v12 = [v11 length];
  if (v6 + v8 <= v12)
  {
    -[CKMessageEntryContentView applyTextStyle:toTextRange:](self, "applyTextStyle:toTextRange:", a3, v6, v8);
  }
  else
  {
    unint64_t v13 = v12;
    v14 = IMLogHandleForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v15 = IMTextStyleAttributeNameFromStyle();
      v24.id location = v6;
      v24.length = v8;
      uint64_t v16 = NSStringFromRange(v24);
      int v17 = 138412802;
      uint64_t v18 = v15;
      __int16 v19 = 2112;
      v20 = v16;
      __int16 v21 = 2048;
      unint64_t v22 = v13;
      _os_log_error_impl(&dword_18EF18000, v14, OS_LOG_TYPE_ERROR, "Invalid range when toggling text style {%@} for range {%@} with textLength {%lu}.", (uint8_t *)&v17, 0x20u);
    }
  }
}

- (void)applyTextStyle:(unint64_t)a3 toTextRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger v5 = a4.location;
  NSUInteger v8 = [(CKMessageEntryContentView *)self textView];
  uint64_t v9 = +[CKUIBehavior sharedBehaviors];
  v10 = [v9 balloonTextFont];

  id location = 0;
  objc_initWeak(&location, self);
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  unint64_t v13 = __69__CKMessageEntryContentView_TextEffects__applyTextStyle_toTextRange___block_invoke;
  v14 = &unk_1E56215C8;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v8, "ck_applyWithTextStyle:toRange:baseFont:undo:", a3, v5, length, v10, &v11);
  [(CKMessageEntryContentView *)self invalidateComposition];
  [(CKMessageEntryContentView *)self _didChangeAttributesAffectingTextSize];
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __69__CKMessageEntryContentView_TextEffects__applyTextStyle_toTextRange___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidateComposition];

  id v3 = objc_loadWeakRetained(v1);
  [v3 _didChangeAttributesAffectingTextSize];
}

- (void)applyTextEffect:(int64_t)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  NSUInteger v5 = [(CKMessageEntryContentView *)self textView];
  NSUInteger v6 = [v5 selectedRange];
  NSUInteger v8 = v7;

  uint64_t v9 = [(CKMessageEntryContentView *)self composition];
  v10 = [v9 text];
  uint64_t v11 = [v10 string];

  unint64_t v12 = [v11 length];
  if (v6 + v8 <= v12)
  {
    -[CKMessageEntryContentView applyTextEffect:toTextRange:](self, "applyTextEffect:toTextRange:", a3, v6, v8);
  }
  else
  {
    unint64_t v13 = v12;
    v14 = IMLogHandleForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = IMTextEffectNameFromType();
      v24.id location = v6;
      v24.NSUInteger length = v8;
      uint64_t v16 = NSStringFromRange(v24);
      int v17 = 138412802;
      uint64_t v18 = v15;
      __int16 v19 = 2112;
      v20 = v16;
      __int16 v21 = 2048;
      unint64_t v22 = v13;
      _os_log_error_impl(&dword_18EF18000, v14, OS_LOG_TYPE_ERROR, "Invalid range when toggling text effect {%@} for range {%@} with textLength {%lu}.", (uint8_t *)&v17, 0x20u);
    }
  }
}

- (void)applyTextEffect:(int64_t)a3 toTextRange:(_NSRange)a4
{
  NSUInteger length = (void *)a4.length;
  NSUInteger v5 = (void *)a4.location;
  id location = 0;
  objc_initWeak(&location, self);
  NSUInteger v8 = [(CKMessageEntryContentView *)self textView];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__CKMessageEntryContentView_TextEffects__applyTextEffect_toTextRange___block_invoke;
  v13[3] = &unk_1E56250E8;
  objc_copyWeak(v14, &location);
  v14[1] = (id)a3;
  v14[2] = v5;
  v14[3] = length;
  objc_msgSend(v8, "ck_toggleTextEffect:inRange:getAdded:undo:", a3, v5, length, 0, v13);

  [(CKMessageEntryContentView *)self invalidateComposition];
  uint64_t v9 = NSString;
  v16.id location = (NSUInteger)v5;
  v16.NSUInteger length = (NSUInteger)length;
  v10 = NSStringFromRange(v16);
  uint64_t v11 = [v9 stringWithFormat:@"did apply text effect of type: %lu to range: %@", a3, v10];

  unint64_t v12 = [(CKMessageEntryContentView *)self textEffectCoordinator];
  [v12 updateWithReason:v11];

  [(CKMessageEntryContentView *)self _didChangeAttributesAffectingTextSize];
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
}

void __70__CKMessageEntryContentView_TextEffects__applyTextEffect_toTextRange___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidateComposition];

  uint64_t v4 = NSString;
  uint64_t v5 = *(void *)(a1 + 40);
  NSUInteger v6 = NSStringFromRange(*(NSRange *)(a1 + 48));
  id v10 = [v4 stringWithFormat:@"(undo) did apply text effect of type: %lu to range: %@", v5, v6];

  id v7 = objc_loadWeakRetained(v2);
  NSUInteger v8 = [v7 textEffectCoordinator];
  [v8 updateWithReason:v10];

  id v9 = objc_loadWeakRetained(v2);
  [v9 _didChangeAttributesAffectingTextSize];
}

- (NSString)selectedText
{
  id v2 = [(CKMessageEntryContentView *)self textView];
  id v3 = [v2 selectedText];

  if (v3) {
    uint64_t v4 = (__CFString *)[v3 copy];
  }
  else {
    uint64_t v4 = &stru_1EDE4CA38;
  }

  return (NSString *)v4;
}

- (void)dealloc
{
  [(CKMessageEntryTextView *)self->_subjectView setDelegate:0];
  [(CKMessageEntryRichTextView *)self->_textView setDelegate:0];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CKMessageEntryContentView;
  [(CKMessageEntryContentView *)&v4 dealloc];
}

- (CGRect)computedPluginViewFrame
{
  [(CKMessageEntryContentView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(CKMessageEntryContentView *)self maxPluginShelfViewWidth];
  CGFloat v12 = v11;
  [(CKMessageEntryContentView *)self _pluginMargins];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  memset(&slice, 0, sizeof(slice));
  memset(&v35, 0, sizeof(v35));
  v37.origin.x = v4;
  v37.origin.y = v6;
  v37.size.width = v8;
  v37.size.height = v10;
  CGRectDivide(v37, &slice, &v35, v12, CGRectMinXEdge);
  BOOL v19 = [(CKMessageEntryContentView *)self _currentPluginPayloadHasPhotosExtensionMediaPayload];
  if ([(CKMessageEntryContentView *)self _currentPluginIsPhotosPlugin] || v19)
  {
    double v22 = slice.size.width - (v16 + v18);
    [(CKMessageEntryContentView *)self _calcuateIdealMaxPluginHeight:0];
    double v24 = v25;
  }
  else
  {
    v20 = [(CKMessageEntryContentView *)self delegate];
    [v20 messageEntryContentViewMaxShelfPluginViewSize:self];
    double v22 = v21;
    double v24 = v23;
  }
  v26 = [(CKMessageEntryContentView *)self pluginEntryViewController];
  objc_msgSend(v26, "ck_constrainedSizeThatFits:", v22, v24);
  double v28 = v27;
  double v30 = v29;

  double v31 = CGRectGetMidX(slice) + v28 * -0.5;
  double v32 = v14;
  double v33 = v28;
  double v34 = v30;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

+ (void)getClearButtonOffsetTop:(double *)a3 clearButtonOffsetTrailing:(double *)a4 forPluginWithBundleID:(id)a5
{
  id v17 = a5;
  if (!a3)
  {
    double v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"CKMessageEntryContentView.m", 233, @"Invalid parameter not satisfying: %@", @"offsetTopOut" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
LABEL_11:
    double v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"CKMessageEntryContentView.m", 234, @"Invalid parameter not satisfying: %@", @"offsetTrailingOut" object file lineNumber description];

    goto LABEL_3;
  }
  if (!a4) {
    goto LABEL_11;
  }
LABEL_3:
  char v9 = [v17 isEqualToString:*MEMORY[0x1E4F6CBD8]];
  int v10 = [v17 isEqualToString:@"com.apple.messages.MSMessageExtensionBalloonPlugin:0000000000:com.apple.Stickers.UserGenerated.MessagesExtension"];
  if ((v9 & 1) != 0 || v10)
  {
    *a3 = 0.0;
    *a4 = 0.0;
  }
  else
  {
    double v11 = +[CKUIBehavior sharedBehaviors];
    [v11 messageEntryContentViewClearOffsetFromTop];
    *(void *)a3 = v12;

    double v13 = +[CKUIBehavior sharedBehaviors];
    [v13 messageEntryContentViewClearOffsetFromRight];
    *(void *)a4 = v14;
  }
}

- (CGRect)computedClearPluginButtonFrame
{
  int v3 = [(CKMessageEntryContentView *)self _shouldReverseLayoutDirection];
  CGFloat v4 = [(CKMessageEntryContentView *)self shelfPluginPayload];
  double v5 = [v4 pluginBundleID];
  double v30 = 0.0;
  double v31 = 0.0;
  [(id)objc_opt_class() getClearButtonOffsetTop:&v31 clearButtonOffsetTrailing:&v30 forPluginWithBundleID:v5];
  [(CKMessageEntryContentView *)self computedPluginViewFrame];
  uint64_t v7 = v6;
  double v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v14 = [(CKMessageEntryContentView *)self clearPluginButton];
  [v14 bounds];
  double v16 = v15;

  id v17 = [(CKMessageEntryContentView *)self clearPluginButton];
  [v17 bounds];
  double v19 = v18;

  double v20 = v31;
  uint64_t v21 = v7;
  double v22 = v9;
  uint64_t v23 = v11;
  uint64_t v24 = v13;
  if (v3) {
    double v25 = CGRectGetMinX(*(CGRect *)&v21) + v30;
  }
  else {
    double v25 = CGRectGetMaxX(*(CGRect *)&v21) - v16 - v30;
  }

  double v26 = v25;
  double v27 = v9 + v20;
  double v28 = v16;
  double v29 = v19;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (BOOL)_currentPluginPayloadHasPhotosExtensionMediaPayload
{
  id v2 = [(CKMessageEntryContentView *)self shelfPluginPayload];
  int v3 = [v2 pluginBundleID];
  CGFloat v4 = IMBalloonExtensionIDWithSuffix();
  if [v3 isEqualToString:v4] && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    double v5 = [v2 photoShelfViewController];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_currentPluginIsPhotosPlugin
{
  id v2 = [(CKMessageEntryContentView *)self shelfPluginPayload];
  int v3 = [v2 pluginBundleID];
  char v4 = [v3 isEqualToString:*MEMORY[0x1E4F6CBF8]];

  return v4;
}

- (UIEdgeInsets)_pluginMargins
{
  if ([(CKMessageEntryContentView *)self _currentPluginIsPhotosPlugin]
    || [(CKMessageEntryContentView *)self _currentPluginPayloadHasPhotosExtensionMediaPayload])
  {
    int v3 = +[CKUIBehavior sharedBehaviors];
    [v3 messageEntryContentViewPhotoPluginInsets];
  }
  else
  {
    int v3 = +[CKUIBehavior sharedBehaviors];
    [v3 messageEntryContentViewPluginInsets];
  }
  double v8 = v4;
  double v9 = v5;
  double v10 = v6;
  double v11 = v7;

  double v12 = v8;
  double v13 = v9;
  double v14 = v10;
  double v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (void)layoutSubviews
{
  v92.receiver = self;
  v92.super_class = (Class)CKMessageEntryContentView;
  [(CKMessageEntryContentView *)&v92 layoutSubviews];
  double v91 = 0.0;
  [(CKMessageEntryContentView *)self bounds];
  double v4 = v3;
  uint64_t v5 = [(CKMessageEntryContentView *)self sendLaterView];
  if (v5)
  {
    double v6 = (void *)v5;
    double v7 = [(CKMessageEntryContentView *)self sendLaterView];
    [v7 alpha];
    double v9 = v8;

    if (v9 > 0.0)
    {
      double v10 = +[CKUIBehavior sharedBehaviors];
      [v10 messageEntryContentViewSendLaterInsets];
      double v12 = v11;
      double v14 = v13;
      double v88 = v15;
      double v17 = v16;

      [(CKMessageEntryContentView *)self bounds];
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      double v22 = v4;
      CGFloat v24 = v23;
      CGFloat v26 = v25;
      [(CKMessageEntryContentView *)self maxPluginShelfViewWidth];
      CGFloat v28 = v27;
      memset(&slice, 0, sizeof(slice));
      memset(&remainder, 0, sizeof(remainder));
      v93.origin.x = v19;
      v93.origin.y = v21;
      v93.size.width = v24;
      double v4 = v22;
      v93.size.height = v26;
      CGRectDivide(v93, &slice, &remainder, v28, CGRectMinXEdge);
      CGFloat v29 = slice.size.width - (v14 + v17);
      double v30 = +[CKUIBehavior sharedBehaviors];
      [v30 entryViewMaxSendLaterHeight];
      double v32 = v31;

      double v33 = [(CKMessageEntryContentView *)self sendLaterView];
      objc_msgSend(v33, "setFrame:", v14, v12, v29, v32);

      double v91 = v88 * 0.5 + v12 + v32 + 0.0;
    }
  }
  if ([(CKMessageEntryContentView *)self shouldShowPlugin])
  {
    [(CKMessageEntryContentView *)self _pluginMargins];
    double v35 = v34;
    double v37 = v36;
    [(CKMessageEntryContentView *)self computedPluginViewFrame];
    double v39 = v38;
    double v41 = v40;
    double v43 = v42;
    double v45 = v91 + v44;
    v46 = [(CKMessageEntryContentView *)self pluginView];
    objc_msgSend(v46, "setFrame:", v39, v45, v41, v43);

    v47 = [(CKMessageEntryContentView *)self clearPluginButton];
    [(CKMessageEntryContentView *)self bringSubviewToFront:v47];

    double v48 = (double)[(CKMessageEntryContentView *)self shouldShowClearButton];
    v49 = [(CKMessageEntryContentView *)self clearPluginButton];
    [v49 setAlpha:v48];

    [(CKMessageEntryContentView *)self computedClearPluginButtonFrame];
    double v51 = v50;
    double v53 = v52;
    double v55 = v54;
    double v57 = v91 + v56;
    v58 = [(CKMessageEntryContentView *)self clearPluginButton];
    objc_msgSend(v58, "setFrame:", v51, v57, v53, v55);

    double v91 = v37 + v35 + v43 + v91;
    v59 = +[CKUIBehavior sharedBehaviors];
    uint64_t v60 = [v59 shouldShowPluginDividerLineWithPluginShelf] ^ 1;
    v61 = [(CKMessageEntryContentView *)self pluginDividerLine];
    [v61 setHidden:v60];

    v62 = +[CKUIBehavior sharedBehaviors];
    [v62 pluginDividerLineInsetsWithPluginShelf];
    double v64 = v63;

    v65 = [(CKMessageEntryContentView *)self pluginDividerLine];
    LOBYTE(v60) = [v65 isHidden];

    if (v60) {
      goto LABEL_11;
    }
    v66 = [(CKMessageEntryContentView *)self pluginDividerLine];
    [(CKMessageEntryContentView *)self _layoutDividerLine:v66 leftInset:&v91 widthInset:v64 currentYOffset:v64 + v64];
  }
  else
  {
    v67 = [(CKMessageEntryContentView *)self pluginEntryViewController];

    if (v67)
    {
      v68 = [(CKMessageEntryContentView *)self delegate];
      [v68 messageEntryContentViewMaxShelfPluginViewSize:self];
      double v70 = v69;
      double v72 = v71;

      v66 = [(CKMessageEntryContentView *)self pluginEntryViewController];
      objc_msgSend(v66, "ck_constrainedSizeThatFits:", v70, v72);
    }
    else
    {
      v73 = [(CKMessageEntryContentView *)self clearPluginButton];
      [v73 setAlpha:0.0];

      v66 = [(CKMessageEntryContentView *)self pluginDividerLine];
      [v66 setHidden:1];
    }
  }

LABEL_11:
  if ([(CKMessageEntryContentView *)self needsTextLayout])
  {
    [(CKMessageEntryContentView *)self _maxWidthForTextView];
    double v75 = v74;
    [(CKMessageEntryContentView *)self entryContentViewTextLeftOffset];
    double v77 = v76;
    if ([(CKMessageEntryContentView *)self shouldShowSubject])
    {
      v78 = [(CKMessageEntryContentView *)self subjectView];
      [(CKMessageEntryContentView *)self _layoutTextView:v78 currentYOffset:&v91 originX:v77 maxWidth:v75];

      v79 = [(CKMessageEntryContentView *)self textAndSubjectDividerLine];
      [v79 setHidden:0];

      v80 = [(CKMessageEntryContentView *)self textAndSubjectDividerLine];
      [(CKMessageEntryContentView *)self sendButtonTextInsetWidth];
      double v82 = v81;
      v83 = [(CKMessageEntryContentView *)self subjectView];
      [v83 contentInset];
      [(CKMessageEntryContentView *)self _layoutDividerLine:v80 leftInset:&v91 widthInset:v77 currentYOffset:v82 + v84];
    }
    else
    {
      [(UIView *)self->_textAndSubjectDividerLine setHidden:1];
    }
    v85 = [(CKMessageEntryContentView *)self textView];
    [(CKMessageEntryContentView *)self _layoutTextView:v85 currentYOffset:&v91 originX:v77 maxWidth:v75];

    v86 = [(CKMessageEntryContentView *)self textView];
    [v86 frame];
    double MaxY = CGRectGetMaxY(v94);

    -[CKMessageEntryContentView setContentSize:](self, "setContentSize:", v4, MaxY);
    [(CKMessageEntryContentView *)self ensureSelectionVisibleIfNeeded];
    [(CKMessageEntryContentView *)self setNeedsTextLayout:0];
  }
  [(CKMessageEntryContentView *)self ensureTextViewVisibleIfNeeded];
}

- (double)entryContentViewTextLeftOffset
{
  id v2 = +[CKUIBehavior sharedBehaviors];
  [v2 entryContentViewTextLeftOffset];
  double v4 = v3;

  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  uint64_t v5 = [(CKMessageEntryContentView *)self sendLaterView];
  double v6 = 0.0;
  if (v5)
  {
    double v7 = (void *)v5;
    double v8 = [(CKMessageEntryContentView *)self sendLaterView];
    [v8 alpha];
    double v10 = v9;

    if (v10 > 0.0)
    {
      double v11 = +[CKUIBehavior sharedBehaviors];
      [v11 messageEntryContentViewSendLaterInsets];
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;

      double v20 = width - (v15 + v19);
      CGFloat v21 = +[CKUIBehavior sharedBehaviors];
      [v21 entryViewMaxSendLaterHeight];
      double v23 = v22;

      CGFloat v24 = [(CKMessageEntryContentView *)self sendLaterView];
      objc_msgSend(v24, "ck_constrainedSizeThatFits:", v20, v23);
      double v26 = v25;

      double v6 = v17 + v13 + 0.0 + v26;
    }
  }
  if ([(CKMessageEntryContentView *)self shouldShowPlugin])
  {
    double v27 = [(CKMessageEntryContentView *)self shelfPluginPayload];
    CGFloat v28 = [v27 pluginBundleID];
    int v29 = [v28 isEqualToString:*MEMORY[0x1E4F6CBF8]];
    double v30 = IMBalloonExtensionIDWithSuffix();
    if ([v28 isEqualToString:v30]
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      double v31 = [v27 photoShelfViewController];
      BOOL v32 = v31 != 0;
    }
    else
    {
      BOOL v32 = 0;
    }

    [(CKMessageEntryContentView *)self _pluginMargins];
    double v36 = v35;
    double v38 = v37;
    if ((v29 | v32) == 1)
    {
      double v39 = width - (v33 + v34);
      double v40 = +[CKUIBehavior sharedBehaviors];
      [v40 entryViewMaxPluginShelfHeight];
      double v42 = v41;
    }
    else
    {
      double v40 = [(CKMessageEntryContentView *)self delegate];
      [v40 messageEntryContentViewMaxShelfPluginViewSize:self];
      double v39 = v43;
      double v42 = v44;
    }

    double v45 = [(CKMessageEntryContentView *)self pluginEntryViewController];
    objc_msgSend(v45, "ck_constrainedSizeThatFits:", v39, v42);
    double v47 = v46;

    double v48 = v38 + v6 + v36 + v47;
    if (CKPixelWidth_once_11 != -1) {
      dispatch_once(&CKPixelWidth_once_11, &__block_literal_global_783);
    }
    double v6 = v48 + *(double *)&CKPixelWidth_sPixel_11;
  }
  [(CKMessageEntryContentView *)self containerViewLineWidth];
  double v50 = width + v49 * -2.0;
  [(CKMessageEntryContentView *)self entryContentViewTextLeftOffset];
  double v52 = v50 - v51;
  [(CKMessageEntryContentView *)self sendButtonTextInsetWidth];
  double v54 = v52 - v53;
  double v55 = +[CKUIBehavior sharedBehaviors];
  [v55 entryViewCoverMinHeight];
  double v57 = v56;

  if ([(CKMessageEntryContentView *)self shouldShowSubject])
  {
    v58 = [(CKMessageEntryContentView *)self subjectView];
    objc_msgSend(v58, "sizeThatFits:", v54, 1.79769313e308);
    double v60 = fmax(v59, v57);
    if (CKPixelWidth_once_11 != -1) {
      dispatch_once(&CKPixelWidth_once_11, &__block_literal_global_783);
    }
    double v6 = v6 + v60 + *(double *)&CKPixelWidth_sPixel_11;
  }
  v61 = [(CKMessageEntryContentView *)self textView];
  objc_msgSend(v61, "sizeThatFits:", v54, 1.79769313e308);
  double v63 = v62;
  double v64 = +[CKUIBehavior sharedBehaviors];
  [v64 entryViewMaxHeight];
  double v66 = fmin(v63, v65);

  double v67 = width;
  double v68 = v6 + fmax(v66, v57);
  result.height = v68;
  result.double width = v67;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(CKMessageEntryContentView *)self bounds];
  if (v9 != width || v8 != height) {
    [(CKMessageEntryContentView *)self setNeedsTextLayout:1];
  }
  v11.receiver = self;
  v11.super_class = (Class)CKMessageEntryContentView;
  -[CKMessageEntryContentView setBounds:](&v11, sel_setBounds_, x, y, width, height);
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(CKMessageEntryContentView *)self frame];
  if (v9 != width || v8 != height) {
    [(CKMessageEntryContentView *)self setNeedsTextLayout:1];
  }
  v11.receiver = self;
  v11.super_class = (Class)CKMessageEntryContentView;
  -[CKMessageEntryContentView setFrame:](&v11, sel_setFrame_, x, y, width, height);
}

- (void)didMoveToSuperview
{
  v2.receiver = self;
  v2.super_class = (Class)CKMessageEntryContentView;
  [(CKMessageEntryContentView *)&v2 didMoveToSuperview];
}

- (CKMessageEntryContentView)initWithFrame:(CGRect)a3 shouldShowSubject:(BOOL)a4 shouldDisableAttachments:(BOOL)a5 shouldUseNonEmojiKeyboard:(BOOL)a6 shouldUseNonHandwritingKeyboard:(BOOL)a7 shouldDisableKeyboardStickers:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  BOOL v10 = a6;
  BOOL v11 = a5;
  BOOL v12 = a4;
  v49.receiver = self;
  v49.super_class = (Class)CKMessageEntryContentView;
  double v13 = -[CKMessageEntryContentView initWithFrame:](&v49, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v13)
  {
    double v14 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v15 = [v14 isExpressiveTextEnabled];

    if (v15
      && !+[CKTextEffectCoordinator entryViewTextEffectCoordinationDisabled])
    {
      double v16 = [[CKTextEffectCoordinatorConfiguration alloc] initWithLogIdentifier:@"entry_view" timeAfterLastAnimationInSeconds:3.5];
      double v17 = [[_TtC7ChatKit23CKTextEffectCoordinator alloc] initWithConfiguration:v16];
      textEffectCoordinator = v13->_textEffectCoordinator;
      v13->_textEffectCoordinator = v17;

      [(CKTextEffectCoordinator *)v13->_textEffectCoordinator setDelegate:v13];
      [(CKTextEffectCoordinator *)v13->_textEffectCoordinator setPaused:0 includingAnimators:1];
    }
    v13->_isCompositionExpirable = 0;
    [(CKMessageEntryContentView *)v13 setScrollsToTop:0];
    [(CKMessageEntryContentView *)v13 setShouldShowSubject:v12];
    double v19 = [(id)objc_opt_class() _createTextView:v11 shouldUseNonEmojiKeyboard:v10 shouldUseNonHandwritingKeyboard:v9 shouldDisableKeyboardStickers:v8];
    [v19 setDelegate:v13];
    [v19 setTextDragDelegate:v13];
    double v20 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v21 = [v20 isExpressiveTextEnabled];

    if (v21)
    {
      double v22 = [v19 textLayoutManager];
      [v22 setRequiresCTLineRef:1];

      [v19 setTextFormattingDelegate:v13];
      if (CKShouldUseModernRippleAnimation() && (objc_opt_respondsToSelector() & 1) != 0) {
        [v19 performSelector:sel_setEmojiAnimationDelegate_ withObject:v13];
      }
    }
    [(CKMessageEntryContentView *)v13 setTextView:v19];
    [(CKMessageEntryContentView *)v13 addSubview:v19];
    [(CKMessageEntryContentView *)v13 setStyle:4];
    if (v12)
    {
      double v23 = [(id)objc_opt_class() _createSubjectView];
      [v23 setDelegate:v13];
      [(CKMessageEntryContentView *)v13 setSubjectView:v23];
      [(CKMessageEntryContentView *)v13 addSubview:v23];
      id v24 = objc_alloc(MEMORY[0x1E4F42FF0]);
      double v25 = *MEMORY[0x1E4F1DB28];
      double v26 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v27 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v28 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      int v29 = objc_msgSend(v24, "initWithFrame:", *MEMORY[0x1E4F1DB28], v26, v27, v28);
      double v30 = +[CKUIBehavior sharedBehaviors];
      double v31 = [v30 theme];
      BOOL v32 = [v31 entryFieldBorderColor];
      [v29 setBackgroundColor:v32];

      [(CKMessageEntryContentView *)v13 setTextAndSubjectDividerLine:v29];
      [(CKMessageEntryContentView *)v13 addSubview:v29];
    }
    else
    {
      double v25 = *MEMORY[0x1E4F1DB28];
      double v26 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v27 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v28 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    }
    double v33 = (void *)MEMORY[0x1E4F427E0];
    double v34 = +[CKUIBehavior sharedBehaviors];
    double v35 = [v34 clearPluginButtonConfiguration];
    double v36 = [v33 buttonWithConfiguration:v35 primaryAction:0];

    [v36 accessibilitySetIdentification:@"clearPluginButton"];
    [v36 setExclusiveTouch:0];
    double v37 = *MEMORY[0x1E4F1DAD8];
    double v38 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double v39 = +[CKUIBehavior sharedBehaviors];
    [v39 clearPluginButtonSize];
    objc_msgSend(v36, "setBounds:", v37, v38, v40, v41);

    [v36 addTarget:v13 action:sel_clearPluginButtonTapped_ forEvents:64];
    [v36 setAlpha:0.0];
    [(CKMessageEntryContentView *)v13 setClearPluginButton:v36];
    [(CKMessageEntryContentView *)v13 addSubview:v36];
    double v42 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v25, v26, v27, v28);
    double v43 = +[CKUIBehavior sharedBehaviors];
    double v44 = [v43 theme];
    double v45 = [v44 entryFieldBorderColor];
    [v42 setBackgroundColor:v45];

    [(CKMessageEntryContentView *)v13 setPluginDividerLine:v42];
    [(CKMessageEntryContentView *)v13 addSubview:v42];
    [(CKMessageEntryContentView *)v13 setNeedsTextLayout:1];
    double v46 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v46 addObserver:v13 selector:sel_pluginPayloadWantsResize_ name:*MEMORY[0x1E4F6BB60] object:0];

    double v47 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v47 addObserver:v13 selector:sel_pluginPayloadDidLoad_ name:*MEMORY[0x1E4F6BB58] object:0];
  }
  return v13;
}

- (void)setStyle:(int64_t)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (self->_style != a3)
  {
    int v3 = a3;
    self->_style = a3;
    if (IMOSLoggingEnabled())
    {
      uint64_t v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v35 = 67109120;
        LODWORD(v36) = v3;
        _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Updating entry view style to %d", (uint8_t *)&v35, 8u);
      }
    }
    int v6 = CKMessageEntryViewStyleIsForDarkAppearance(self->_style);
    double v7 = +[CKUIBehavior sharedBehaviors];
    BOOL v8 = [v7 theme];
    BOOL v9 = v8;
    if (v6) {
      uint64_t v10 = [v8 keyboardDarkAppearance];
    }
    else {
      uint64_t v10 = [v8 keyboardAppearance];
    }
    uint64_t v11 = v10;

    BOOL v12 = [(CKMessageEntryContentView *)self textView];
    double v13 = +[CKUIBehavior sharedBehaviors];
    double v14 = [v13 theme];
    int v15 = [v14 entryFieldTextColor];
    [v12 setTextColor:v15];

    double v16 = +[CKUIBehavior sharedBehaviors];
    double v17 = [v16 theme];
    double v18 = [v17 entryFieldPlaceholderTextColor];
    [v12 setPlaceholderColor:v18];

    uint64_t v19 = [v12 keyboardAppearance];
    BOOL v20 = v19 != v11;
    if (v19 != v11) {
      [v12 setKeyboardAppearance:v11];
    }
    if (IMOSLoggingEnabled())
    {
      int v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        double v22 = @"NO";
        if (v19 != v11) {
          double v22 = @"YES";
        }
        int v35 = 138412290;
        double v36 = v22;
        _os_log_impl(&dword_18EF18000, v21, OS_LOG_TYPE_INFO, "Keyboard appearance changed? {%@}", (uint8_t *)&v35, 0xCu);
      }
    }
    if ([(CKMessageEntryContentView *)self shouldShowSubject])
    {
      double v23 = [(CKMessageEntryContentView *)self subjectView];
      BOOL v24 = v23 == 0;

      if (!v24)
      {
        double v25 = [(CKMessageEntryContentView *)self subjectView];
        double v26 = +[CKUIBehavior sharedBehaviors];
        double v27 = [v26 theme];
        double v28 = [v27 entryFieldTextColor];
        [v25 setTextColor:v28];

        int v29 = +[CKUIBehavior sharedBehaviors];
        double v30 = [v29 theme];
        double v31 = [v30 entryFieldPlaceholderTextColor];
        [v25 setPlaceholderColor:v31];

        if ([v25 keyboardAppearance] != v11)
        {
          [v25 setKeyboardAppearance:v11];
          BOOL v20 = 1;
        }
      }
    }
    if ((v20 & [(CKMessageEntryContentView *)self isActive]) == 1)
    {
      if (IMOSLoggingEnabled())
      {
        BOOL v32 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          LOWORD(v35) = 0;
          _os_log_impl(&dword_18EF18000, v32, OS_LOG_TYPE_INFO, "Needs to trigger a keyboard appearance change.", (uint8_t *)&v35, 2u);
        }
      }
      double v33 = [(CKMessageEntryContentView *)self activeView];
      [v33 reloadInputViews];

      if (IMOSLoggingEnabled())
      {
        double v34 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          LOWORD(v35) = 0;
          _os_log_impl(&dword_18EF18000, v34, OS_LOG_TYPE_INFO, "Call to reloadInputViews returned.", (uint8_t *)&v35, 2u);
        }
      }
    }
  }
}

- (BOOL)shouldShowPlugin
{
  int v3 = [(CKMessageEntryContentView *)self pluginEntryViewController];
  if (objc_opt_respondsToSelector())
  {
    char v4 = [v3 loadedContentView];
  }
  else
  {
    uint64_t v5 = [(CKMessageEntryContentView *)self pluginEntryViewController];
    char v4 = v5 != 0;
  }
  return v4;
}

- (CKComposition)composition
{
  if (!self->_composition)
  {
    if ([(CKMessageEntryContentView *)self isCompositionExpirable])
    {
      int v3 = [(CKMessageEntryContentView *)self textView];
      char v4 = [v3 compositionText];
      uint64_t v5 = [(CKMessageEntryContentView *)self subjectView];
      int v6 = [v5 compositionText];
      double v7 = [(CKMessageEntryContentView *)self shelfPluginPayload];
      BOOL v8 = +[CKComposition newExpirableCompositionWithText:v4 subject:v6 shelfPluginPayload:v7];
      composition = self->_composition;
      self->_composition = v8;
    }
    else
    {
      uint64_t v10 = [(CKMessageEntryContentView *)self shelfPluginPayload];
      int v11 = [v10 supportsCollaboration];

      BOOL v32 = [CKComposition alloc];
      double v33 = [(CKMessageEntryContentView *)self textView];
      char v4 = [v33 compositionText];
      uint64_t v5 = [(CKMessageEntryContentView *)self subjectView];
      int v6 = [v5 compositionText];
      double v7 = [(CKMessageEntryContentView *)self shelfPluginPayload];
      composition = [(CKMessageEntryContentView *)self bizIntent];
      BOOL v12 = [(CKMessageEntryContentView *)self shelfMediaObject];
      if (v11)
      {
        [(CKMessageEntryContentView *)self collaborationShareOptions];
        double v30 = v12;
        v14 = double v13 = v4;
        double v31 = [(CKMessageEntryContentView *)self textView];
        int v15 = [v31 proofreadingInfo];
        double v16 = v12;
        uint64_t v17 = v14;
        double v18 = (void *)v14;
        char v4 = v13;
        uint64_t v19 = [(CKComposition *)v32 initWithText:v13 subject:v6 shelfPluginPayload:v7 bizIntent:composition shelfMediaObject:v16 collaborationShareOptions:v17 proofreadingInfo:v15];
        BOOL v20 = self->_composition;
        self->_composition = v19;
      }
      else
      {
        int v21 = [(CKMessageEntryContentView *)self textView];
        double v22 = [v21 proofreadingInfo];
        double v23 = [(CKComposition *)v32 initWithText:v4 subject:v6 shelfPluginPayload:v7 bizIntent:composition shelfMediaObject:v12 proofreadingInfo:v22];
        BOOL v24 = self->_composition;
        self->_composition = v23;
      }
      int v3 = v33;
    }
  }
  double v25 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v26 = [v25 isScheduledMessagesCoreEnabled];

  if (v26)
  {
    double v27 = [(CKMessageEntryContentView *)self sendLaterPluginInfo];
    [(CKComposition *)self->_composition setSendLaterPluginInfo:v27];
  }
  double v28 = self->_composition;

  return v28;
}

- (void)setSendLaterPluginInfo:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  BOOL v9 = (CKSendLaterPluginInfo *)a3;
  uint64_t v10 = (void (**)(void))a5;
  if (self->_sendLaterPluginInfo != v9)
  {
    objc_storeStrong((id *)&self->_sendLaterPluginInfo, a3);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __79__CKMessageEntryContentView_setSendLaterPluginInfo_animated_completionHandler___block_invoke;
    aBlock[3] = &unk_1E5620AF8;
    int v11 = v9;
    BOOL v24 = v11;
    double v25 = self;
    BOOL v12 = (void (**)(void))_Block_copy(aBlock);
    double v13 = v12;
    if (v6)
    {
      uint64_t v14 = (void *)MEMORY[0x1E4F42FF0];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __79__CKMessageEntryContentView_setSendLaterPluginInfo_animated_completionHandler___block_invoke_2;
      v21[3] = &unk_1E5623828;
      v21[4] = self;
      double v22 = v12;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __79__CKMessageEntryContentView_setSendLaterPluginInfo_animated_completionHandler___block_invoke_3;
      v17[3] = &unk_1E56277A8;
      double v18 = v11;
      uint64_t v19 = self;
      BOOL v20 = v10;
      [v14 animateWithDuration:v21 animations:v17 completion:0.2];
    }
    else
    {
      v12[2](v12);
      if (!v11)
      {
        int v15 = [(CKMessageEntryContentView *)self sendLaterView];
        [v15 removeFromSuperview];

        [(CKMessageEntryContentView *)self setSendLaterView:0];
      }
      [(CKMessageEntryContentView *)self layoutIfNeeded];
      double v16 = [(CKMessageEntryContentView *)self delegate];
      [v16 messageEntryContentViewSendLaterPluginInfoUpdated:self];

      v10[2](v10);
    }
  }
}

void __79__CKMessageEntryContentView_setSendLaterPluginInfo_animated_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = [*(id *)(a1 + 40) sendLaterView];
  id v9 = v3;
  if (v2)
  {
    [v3 removeFromSuperview];

    char v4 = [[CKSendLaterView alloc] initWithPluginContext:*(void *)(a1 + 32)];
    [*(id *)(a1 + 40) setSendLaterView:v4];

    uint64_t v5 = *(void **)(a1 + 40);
    BOOL v6 = [v5 sendLaterView];
    [v5 addSubview:v6];

    double v7 = [*(id *)(a1 + 40) sendLaterView];
    [v7 addDelegate:*(void *)(a1 + 40)];

    BOOL v8 = *(void **)(a1 + 40);
    objc_msgSend(v8, "__ck_scrollToTop:", 1);
  }
  else
  {
    [v3 setAlpha:0.0];
  }
}

void __79__CKMessageEntryContentView_setSendLaterPluginInfo_animated_completionHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) layoutIfNeeded];
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 messageEntryContentViewSendLaterPluginInfoUpdated:*(void *)(a1 + 32)];
}

uint64_t __79__CKMessageEntryContentView_setSendLaterPluginInfo_animated_completionHandler___block_invoke_3(uint64_t a1)
{
  if (!*(void *)(a1 + 32))
  {
    id v2 = [*(id *)(a1 + 40) sendLaterView];
    [v2 removeFromSuperview];

    [*(id *)(a1 + 40) setSendLaterView:0];
  }
  int v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v3();
}

- (void)setComposition:(id)a3
{
  id v26 = a3;
  if ((CKIsEqual(self->_composition, v26) & 1) == 0)
  {
    [(CKMessageEntryContentView *)self invalidateComposition];
    char v4 = [v26 shelfPluginPayload];
    char v5 = [v4 skipConfigurePlugin];

    BOOL v6 = [v26 shelfPluginPayload];
    double v7 = v6;
    if (v5)
    {
      [v6 setSkipConfigurePlugin:0];

      BOOL v8 = [v26 shelfPluginPayload];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        uint64_t v10 = [v26 shelfPluginPayload];
        int v11 = [v10 datasource];
        [v11 setPluginDataSourceDelegate:self];
      }
      BOOL v12 = [v26 shelfPluginPayload];
      double v13 = [v12 datasource];

      if (!v13)
      {
        uint64_t v14 = [(CKMessageEntryContentView *)self shelfPluginPayload];
        int v15 = [v14 datasource];
        double v16 = [v26 shelfPluginPayload];
        [v16 setDatasource:v15];
      }
      double v7 = [v26 shelfPluginPayload];
      [(CKMessageEntryContentView *)self setShelfPluginPayload:v7];
    }
    else
    {
      [(CKMessageEntryContentView *)self configureShelfForPluginPayload:v6];
    }

    uint64_t v17 = [v26 bizIntent];
    [(CKMessageEntryContentView *)self setBizIntent:v17];

    double v18 = [v26 shelfMediaObject];
    [(CKMessageEntryContentView *)self setShelfMediaObject:v18];

    uint64_t v19 = [v26 collaborationShareOptions];
    [(CKMessageEntryContentView *)self setCollaborationShareOptions:v19];

    BOOL v20 = [v26 collaborationOptions];
    [(CKMessageEntryContentView *)self setCollaborationOptions:v20];

    int v21 = [v26 sendLaterPluginInfo];
    [(CKMessageEntryContentView *)self setSendLaterPluginInfo:v21 animated:0 completionHandler:&__block_literal_global_150];

    if (![(CKMessageEntryContentView *)self _shouldDeferUpdateUI])
    {
      double v22 = [(CKMessageEntryContentView *)self textView];
      double v23 = [v26 text];
      [v22 setCompositionText:v23];

      BOOL v24 = [(CKMessageEntryContentView *)self subjectView];
      double v25 = [v26 subject];
      [v24 setCompositionText:v25];

      -[CKMessageEntryContentView setIsCompositionExpirable:](self, "setIsCompositionExpirable:", [v26 isExpirableComposition]);
      self->_shouldHideClearPluginButton = [v26 shouldHideClearPluginButton];
    }
  }
}

- (void)hideTextEffectsPickerIfNeededAndResetTypingAttributes
{
  id v2 = [(CKMessageEntryContentView *)self textView];
  [v2 hideTextEffectsPickerIfNeededAndResetTypingAttributes];
}

- (void)configureShelfForPluginPayload:(id)a3
{
  id v4 = a3;
  if (!v4
    || ([(CKMessageEntryContentView *)self shelfPluginPayload],
        char v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v4 isEqualToPluginPayload:v5],
        v5,
        (v6 & 1) == 0))
  {
    double v7 = [(CKMessageEntryContentView *)self pluginEntryViewController];

    if (v7)
    {
      BOOL v8 = [(CKMessageEntryContentView *)self pluginEntryViewController];
      id v9 = [v8 view];
      [v9 removeFromSuperview];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v4;
      char v11 = [v10 shouldSendAsMediaObject];
      if (v4) {
        goto LABEL_7;
      }
    }
    else
    {
      id v10 = 0;
      char v11 = 0;
      if (v4)
      {
LABEL_7:
        BOOL v12 = [v4 pluginBundleID];
        double v13 = IMBalloonExtensionIDWithSuffix();
        int v14 = [v12 isEqualToString:v13];

        uint64_t v15 = [v10 photoShelfViewController];
        double v16 = (void *)v15;
        if (v14 && v15)
        {
          [(CKMessageEntryContentView *)self setShelfPluginPayload:v4];
          [(CKMessageEntryContentView *)self setPluginEntryViewController:v16];
        }
        else
        {
          uint64_t v17 = [MEMORY[0x1E4F6BC18] sharedInstance];
          double v18 = [v4 pluginBundleID];
          int v35 = v17;
          uint64_t v19 = [v17 balloonPluginForBundleID:v18];

          double v36 = v19;
          BOOL v20 = (objc_class *)[v19 dataSourceClass];
          if ((v11 & 1) != 0 || !v20) {
            BOOL v20 = (objc_class *)objc_opt_class();
          }
          int v21 = (void *)[[v20 alloc] initWithPluginPayload:v4];
          [v4 setDatasource:v21];
          double v22 = [(CKMessageEntryContentView *)self conversation];
          double v23 = [v22 chat];
          [v21 setChat:v23];

          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v21 setPluginDataSourceDelegate:self];
          }
          BOOL v24 = [MEMORY[0x1E4F6BD78] stagingContextWithIdentifier:@"stagedShelfPlugin" isEmbeddedInTextView:0];
          [v21 setPayloadInShelf:1];
          [v21 setStagingContext:v24];
          [v21 payloadWillEnterShelf];
          double v25 = [MEMORY[0x1E4F6BC18] sharedInstance];
          id v26 = [v4 associatedMessageGUID];
          double v27 = [v4 pluginBundleID];
          double v28 = [v25 existingDataSourceForMessageGUID:v26 bundleID:v27];

          [v28 beginShowingLastConsumedBreadcrumbForOutgoingPayload:v4];
          int v29 = [[CKDefaultPluginEntryViewController alloc] initWithDataSource:v21 entryViewDelegate:0 andPlugin:v36];
          double v30 = [v4 pluginBundleID];
          double v31 = IMBalloonExtensionIDWithSuffix();
          -[CKMessageEntryContentView setShouldSkipRemovalFromParent:](self, "setShouldSkipRemovalFromParent:", [v30 isEqualToString:v31]);

          BOOL v32 = [(CKDefaultPluginEntryViewController *)v29 view];
          objc_msgSend(v32, "setFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

          if ([(CKMessageEntryContentView *)self pendingShelfPayloadWillAnimateIn])
          {
            double v33 = [(CKDefaultPluginEntryViewController *)v29 view];
            [v33 setAlpha:0.0];

            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __60__CKMessageEntryContentView_configureShelfForPluginPayload___block_invoke;
            block[3] = &unk_1E5620C40;
            double v38 = v29;
            dispatch_async(MEMORY[0x1E4F14428], block);
            [(CKMessageEntryContentView *)self setPendingShelfPayloadWillAnimateIn:0];
          }
          [(CKMessageEntryContentView *)self setShelfPluginPayload:v4];
          [(CKMessageEntryContentView *)self setPluginEntryViewController:v29];
          double v34 = [(CKMessageEntryContentView *)self delegate];
          [v34 messageEntryContentView:self didStagePluginPayload:v4];
        }
        goto LABEL_21;
      }
    }
    [(CKMessageEntryContentView *)self setShelfPluginPayload:0];
    [(CKMessageEntryContentView *)self setPluginEntryViewController:0];
LABEL_21:
  }
}

void __60__CKMessageEntryContentView_configureShelfForPluginPayload___block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F42FF0];
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __60__CKMessageEntryContentView_configureShelfForPluginPayload___block_invoke_2;
  v2[3] = &unk_1E5620C40;
  id v3 = *(id *)(a1 + 32);
  [v1 animateWithDuration:v2 animations:0.5];
}

void __60__CKMessageEntryContentView_configureShelfForPluginPayload___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:1.0];
}

- (void)prepareForShelfPayloadAnimation
{
}

- (void)setPluginEntryViewController:(id)a3
{
  id v5 = a3;
  p_pluginEntryViewController = &self->_pluginEntryViewController;
  if ((CKIsEqual(self->_pluginEntryViewController, v5) & 1) == 0)
  {
    if (*p_pluginEntryViewController
      && ![(CKMessageEntryContentView *)self shouldSkipRemovalFromParent])
    {
      [(CKPluginEntryViewController *)*p_pluginEntryViewController willMoveToParentViewController:0];
      double v7 = [(CKPluginEntryViewController *)*p_pluginEntryViewController view];
      [v7 removeFromSuperview];

      [(CKPluginEntryViewController *)*p_pluginEntryViewController removeFromParentViewController];
      BOOL v8 = *p_pluginEntryViewController;
      *p_pluginEntryViewController = 0;
    }
    if (v5)
    {
      objc_storeStrong((id *)&self->_pluginEntryViewController, a3);
      [(CKMessageEntryContentView *)self setShouldSkipRemovalFromParent:0];
      id v9 = [(CKMessageEntryContentView *)self delegate];
      if (!v9 && IMOSLoggingEnabled())
      {
        id v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)double v13 = 0;
          _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Content view had no delegate when setPluginEntryViewController: was called. This will break the view controller containment.", v13, 2u);
        }
      }
      [v9 messageEntryContentView:self willAddPluginEntryViewControllerToViewHierarchy:*p_pluginEntryViewController];
      char v11 = [(CKPluginEntryViewController *)*p_pluginEntryViewController view];
      [(CKMessageEntryContentView *)self addSubview:v11];

      [v9 messageEntryContentView:self didAddPluginEntryViewControllerToViewHierarchy:*p_pluginEntryViewController];
    }
    if (![(CKMessageEntryContentView *)self _shouldDeferUpdateUI])
    {
      [(CKMessageEntryContentView *)self _updateUI];
      BOOL v12 = [(CKMessageEntryContentView *)self delegate];
      [v12 messageEntryContentViewShelfDidChange:self];
    }
  }
}

- (UIView)pluginView
{
  id v2 = [(CKMessageEntryContentView *)self pluginEntryViewController];
  id v3 = [v2 view];

  return (UIView *)v3;
}

- (BOOL)isActive
{
  id v2 = [(CKMessageEntryContentView *)self activeView];
  char v3 = [v2 isFirstResponder];

  return v3;
}

- (CKMessageEntryTextView)activeView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeView);
  if (!WeakRetained)
  {
    id WeakRetained = [(CKMessageEntryContentView *)self textView];
  }

  return (CKMessageEntryTextView *)WeakRetained;
}

- (BOOL)makeActive
{
  id v2 = [(CKMessageEntryContentView *)self activeView];
  char v3 = [v2 becomeFirstResponder];

  return v3;
}

- (BOOL)_shouldDeferUpdateUI
{
  char v3 = [(CKMessageEntryContentView *)self composition];
  id v4 = [v3 shelfPluginPayload];
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6BC18] sharedInstance];
    char v6 = [v4 pluginBundleID];
    double v7 = [v5 balloonPluginForBundleID:v6];

    BOOL v8 = objc_msgSend(objc_alloc((Class)objc_msgSend(v7, "dataSourceClass")), "initWithPluginPayload:", v4);
    if ([v8 supportsDynamicSize])
    {
      id v9 = [(CKMessageEntryContentView *)self pluginEntryViewController];
      BOOL v10 = v9 != 0;
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)isSingleLine
{
  char v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isTextKit2Enabled];

  if (v4)
  {
    uint64_t v22 = 0;
    double v23 = &v22;
    uint64_t v24 = 0x2020000000;
    uint64_t v25 = 0;
    id v5 = [(CKMessageEntryContentView *)self textView];
    char v6 = [v5 textLayoutManager];
    double v7 = [(CKMessageEntryContentView *)self textView];
    BOOL v8 = [v7 textLayoutManager];
    id v9 = [v8 documentRange];
    BOOL v10 = [v9 location];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __41__CKMessageEntryContentView_isSingleLine__block_invoke;
    v21[3] = &unk_1E5621AA8;
    v21[4] = &v22;
    id v11 = (id)[v6 enumerateTextLayoutFragmentsFromLocation:v10 options:4 usingBlock:v21];

    BOOL v12 = v23[3] == 1;
    _Block_object_dispose(&v22, 8);
  }
  else
  {
    if ([(CKMessageEntryContentView *)self shouldShowSubject]) {
      return 0;
    }
    double v13 = [(CKMessageEntryContentView *)self shelfPluginPayload];

    if (v13)
    {
      return 0;
    }
    else
    {
      uint64_t v15 = [(CKMessageEntryContentView *)self textView];
      double v16 = [v15 layoutManager];

      uint64_t v17 = [v16 numberOfGlyphs];
      if (v17)
      {
        double v18 = (uint64_t *)v17;
        uint64_t v22 = 0;
        double v23 = 0;
        [v16 lineFragmentUsedRectForGlyphAtIndex:0 effectiveRange:&v22];
        if (v23 == v18)
        {
          [v16 extraLineFragmentUsedRect];
          BOOL v12 = v20 == *(double *)(MEMORY[0x1E4F1DB30] + 8) && v19 == *MEMORY[0x1E4F1DB30];
        }
        else
        {
          BOOL v12 = 0;
        }
      }
      else
      {
        BOOL v12 = 1;
      }
    }
  }
  return v12;
}

BOOL __41__CKMessageEntryContentView_isSingleLine__block_invoke(uint64_t a1, void *a2)
{
  char v3 = [a2 textLineFragments];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += [v3 count];

  return *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) < 2uLL;
}

- (void)setPlaceholderText:(id)a3
{
  id v6 = a3;
  int v4 = [(CKMessageEntryContentView *)self requestedPlaceholderText];
  char v5 = [v4 isEqualToString:v6];

  if ((v5 & 1) == 0)
  {
    [(CKMessageEntryContentView *)self setRequestedPlaceholderText:v6];
    [(CKMessageEntryContentView *)self _updateUI];
  }
}

- (NSString)placeholderText
{
  id v2 = [(CKMessageEntryContentView *)self textView];
  char v3 = [v2 placeholderText];

  return (NSString *)v3;
}

- (BOOL)isShowingDictationPlaceholder
{
  char v3 = [(CKMessageEntryContentView *)self textView];
  if ([v3 isShowingDictationPlaceholder])
  {
    char v4 = 1;
  }
  else
  {
    char v5 = [(CKMessageEntryContentView *)self subjectView];
    char v4 = [v5 isShowingDictationPlaceholder];
  }
  return v4;
}

- (void)setBalloonColor:(char)a3
{
  uint64_t v3 = a3;
  id v4 = [(CKMessageEntryContentView *)self textView];
  [v4 setBalloonColor:v3];
}

- (UIEdgeInsets)contentTextAlignmentInsets
{
  id v2 = +[CKUIBehavior sharedBehaviors];
  uint64_t v3 = [v2 entryViewlayoutMetrics];

  [v3 entryViewTextAlignmentInsets];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (char)balloonColor
{
  id v2 = [(CKMessageEntryContentView *)self textView];
  char v3 = [v2 balloonColor];

  return v3;
}

- (void)setPlaceHolderWidth:(double)a3
{
  self->_placeHolderWidth = a3;
  double v5 = [(CKMessageEntryContentView *)self textView];
  [v5 setPlaceHolderWidth:a3];

  id v6 = [(CKMessageEntryContentView *)self subjectView];
  [v6 setPlaceHolderWidth:a3];
}

- (void)setShouldStripEmojis:(BOOL)a3
{
  BOOL v3 = a3;
  self->_shouldStripEmojis = a3;
  id v4 = [(CKMessageEntryContentView *)self textView];
  [v4 setShouldStripEmojis:v3];
}

- (void)acceptAutocorrectionForChat:(id)a3 completionHandler:(id)a4
{
  v56[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = [v6 proofreadingInfo];
  uint64_t v9 = [v8 count];

  if (v9) {
    [v6 setProofreadingInfo:0];
  }
  if (CKIsRunningInMacCatalyst())
  {
    double v10 = (void (*)(void))MEMORY[0x192FBA870]("NSBridgedPerformPendingTextCheckingAndReturnInfo", @"AppKit");
    if (v10)
    {
      double v11 = v10();
      if ([v11 count])
      {
        double v12 = [v11 objectForKeyedSubscript:@"UnderlineRanges"];
        double v13 = [v11 objectForKeyedSubscript:@"TextCorrections"];
        uint64_t v14 = [v11 objectForKeyedSubscript:@"ReplacedStrings"];
        unint64_t v15 = 0x1E4F1C000;
        double v45 = (void *)v14;
        if (v12)
        {
          if (v13)
          {
            double v16 = (void *)v14;
            if (v14)
            {
              uint64_t v17 = [v12 lastObject];
              double v18 = [v13 lastObject];
              double v19 = v16;
              double v20 = v17;
              int v21 = [v19 lastObject];
              if (v17 && v18 && v21)
              {
                double v43 = v18;
                double v44 = v21;
                double v40 = v13;
                double v41 = v12;
                uint64_t v22 = [v17 rangeValue];
                uint64_t v24 = v22 + v23;
                [(CKMessageEntryContentView *)self textView];
                v26 = uint64_t v25 = v20;
                double v27 = [(CKMessageEntryContentView *)self textView];
                double v28 = [v27 beginningOfDocument];
                int v29 = [v26 positionFromPosition:v28 offset:v24];

                double v30 = [(CKMessageEntryContentView *)self textView];
                double v31 = [v30 endOfDocument];
                double v42 = v29;
                LODWORD(v28) = [v29 isEqual:v31];

                if (v28)
                {
                  v55[0] = @"UnderlineRanges";
                  BOOL v32 = v25;
                  double v54 = v25;
                  double v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v54 count:1];
                  v56[0] = v33;
                  v55[1] = @"TextCorrections";
                  double v53 = v43;
                  double v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v53 count:1];
                  v56[1] = v34;
                  v55[2] = @"ReplacedStrings";
                  double v52 = v44;
                  int v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
                  v56[2] = v35;
                  uint64_t v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:3];

                  double v11 = (void *)v36;
                }
                else
                {
                  BOOL v32 = v25;
                }
                double v13 = v40;
                double v12 = v41;

                double v20 = v32;
                double v18 = v43;
                int v21 = v44;
              }

              unint64_t v15 = 0x1E4F1C000uLL;
            }
          }
        }
        uint64_t v50 = *MEMORY[0x1E4F6B9E0];
        double v51 = v11;
        uint64_t v37 = [*(id *)(v15 + 2536) dictionaryWithObjects:&v51 forKeys:&v50 count:1];
        [v6 setProofreadingInfo:v37];
      }
    }
  }
  double v38 = [MEMORY[0x1E4F42B08] activeKeyboard];
  double v39 = v38;
  if (v38)
  {
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __75__CKMessageEntryContentView_acceptAutocorrectionForChat_completionHandler___block_invoke;
    v46[3] = &unk_1E56277A8;
    id v47 = v38;
    double v48 = self;
    id v49 = v7;
    [v47 acceptAutocorrectionWithCompletionHandler:v46];
  }
  else
  {
    [(CKMessageEntryContentView *)self invalidateComposition];
    if (v7) {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
}

void __75__CKMessageEntryContentView_acceptAutocorrectionForChat_completionHandler___block_invoke(uint64_t a1, char a2)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__CKMessageEntryContentView_acceptAutocorrectionForChat_completionHandler___block_invoke_2;
  v7[3] = &unk_1E56231C0;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void **)(a1 + 48);
  id v8 = v4;
  uint64_t v9 = v5;
  id v10 = v6;
  char v11 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __75__CKMessageEntryContentView_acceptAutocorrectionForChat_completionHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removeAutocorrectPrompt];
  [*(id *)(a1 + 32) updateLayout];
  [*(id *)(a1 + 40) invalidateComposition];
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2)
  {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, *(unsigned __int8 *)(a1 + 56));
    id v3 = [*(id *)(a1 + 40) textView];
    [v3 setProofreadingInfo:0];
  }
}

- (void)willAnimateBoundsChange
{
  id v2 = [(CKMessageEntryContentView *)self pluginEntryViewController];
  if (objc_opt_respondsToSelector()) {
    [v2 willAnimateBoundsChange];
  }
}

- (void)didFinishAnimatedBoundsChange
{
  id v2 = [(CKMessageEntryContentView *)self pluginEntryViewController];
  if (objc_opt_respondsToSelector()) {
    [v2 didFinishAnimatedBoundsChange];
  }
}

- (void)collapseTextFieldsIfInPencilMode
{
  id v3 = [(CKMessageEntryContentView *)self textView];
  if ([v3 isInPencilMode])
  {
  }
  else
  {
    id v4 = [(CKMessageEntryContentView *)self subjectView];
    int v5 = [v4 isInPencilMode];

    if (!v5) {
      return;
    }
  }
  id v6 = [(CKMessageEntryContentView *)self textView];
  [v6 setInPencilMode:0];

  id v7 = [(CKMessageEntryContentView *)self subjectView];
  [v7 setInPencilMode:0];

  id v8 = [(CKMessageEntryContentView *)self textView];
  [v8 layoutSubviews];

  id v9 = [(CKMessageEntryContentView *)self subjectView];
  [v9 layoutSubviews];
}

- (id)textView:(id)a3 editMenuForTextInRange:(_NSRange)a4 suggestedActions:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = (void *)[a5 mutableCopy];
  char v11 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v12 = [v11 isExpressiveTextEnabled];

  unint64_t v13 = 0x1E4F42000uLL;
  if (v12)
  {
    uint64_t v14 = objc_msgSend(MEMORY[0x1E4F42B80], "ck_indexOfMenuWithMenuIdentifier:inMenuElementsArray:", *MEMORY[0x1E4F43BB8], v10);
    if (v14 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v15 = 0;
    }
    else
    {
      uint64_t v15 = v14;
      [v10 removeObjectAtIndex:v14];
    }
    double v16 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    if ([v16 isExpressiveTextEnabled])
    {
      uint64_t v17 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
      if ([v17 isSendingExpressiveTextEnabled])
      {
        id v18 = [(CKMessageEntryContentView *)self textView];

        BOOL v19 = v18 == v9;
        unint64_t v13 = 0x1E4F42000;
        if (!v19) {
          goto LABEL_15;
        }
        if (CKIsRunningInMacCatalyst())
        {
          double v20 = [(CKMessageEntryContentView *)self textView];
          int v21 = [v20 isExpressiveTextEnabled];

          if (!v21) {
            goto LABEL_15;
          }
          double v16 = -[CKMessageEntryContentView textEffectsEditMenuForTextInRange:](self, "textEffectsEditMenuForTextInRange:", location, length);
          if (v16) {
            [v10 insertObject:v16 atIndex:v15];
          }
        }
        else
        {
          if (!self->_textViewRespondsToShowTextFormattingAnimationOptions)
          {
            double v31 = NSNumber;
            BOOL v32 = [(CKMessageEntryContentView *)self textView];
            double v33 = [v31 numberWithBool:objc_opt_respondsToSelector() & 1];
            textViewRespondsToShowTextFormattingAnimationOptions = self->_textViewRespondsToShowTextFormattingAnimationOptions;
            self->_textViewRespondsToShowTextFormattingAnimationOptions = v33;
          }
          int v35 = [(CKMessageEntryContentView *)self textView];
          double v16 = [v35 showTextEffectsPickerEditMenuAction];

          if (v16)
          {
            uint64_t v36 = CKFrameworkBundle();
            uint64_t v37 = [v36 localizedStringForKey:@"TEXT_EFFECTS" value:&stru_1EDE4CA38 table:@"ChatKit"];
            [v16 setTitle:v37];

            [v10 insertObject:v16 atIndex:v15];
          }
          unint64_t v13 = 0x1E4F42000;
        }
      }
      else
      {
      }
    }
  }
LABEL_15:
  uint64_t v22 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v23 = [v22 isRichLinkImprovementsEnabled];

  if (v23)
  {
    uint64_t v24 = [v9 attributedText];
    uint64_t v25 = -[CKMessageEntryContentView richLinksEditMenuForAttributedText:inRange:](self, "richLinksEditMenuForAttributedText:inRange:", v24, location, length);

    if (v25) {
      objc_msgSend(v10, "insertObject:atIndex:", v25, objc_msgSend(*(id *)(v13 + 2944), "ck_menuInsertionIndexAfterIndex:inMenuElementsArray:", objc_msgSend(*(id *)(v13 + 2944), "ck_indexOfMenuWithMenuIdentifier:inMenuElementsArray:", *MEMORY[0x1E4F43BE0], v10), v10));
    }
  }
  uint64_t v26 = 16 * (CKIsRunningInMacCatalyst() != 0);
  double v27 = *(void **)(v13 + 2944);
  double v28 = (void *)[v10 copy];
  int v29 = [v27 menuWithTitle:&stru_1EDE4CA38 image:0 identifier:0 options:v26 children:v28];

  return v29;
}

- (BOOL)textViewShouldBeginEditing:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeView);
  if (!WeakRetained
    || (id v6 = WeakRetained,
        id v7 = objc_loadWeakRetained((id *)&self->_activeView),
        v7,
        v6,
        v7 == v4))
  {
    id v9 = [(CKMessageEntryContentView *)self delegate];
    char v8 = [v9 messageEntryContentViewShouldBeginEditing:self];
  }
  else
  {
    char v8 = 1;
    [(CKMessageEntryContentView *)self setIgnoreEndEditing:1];
  }

  return v8;
}

- (void)textViewDidBeginEditing:(id)a3
{
  p_activeView = &self->_activeView;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_activeView);
  BOOL v7 = WeakRetained != 0;

  [(CKMessageEntryContentView *)self setActiveView:v5];
  id v8 = [(CKMessageEntryContentView *)self delegate];
  [v8 messageEntryContentViewDidBeginEditing:self wasAlreadyActive:v7];
}

- (void)textViewDidEndEditing:(id)a3
{
  if ([(CKMessageEntryContentView *)self ignoreEndEditing])
  {
    [(CKMessageEntryContentView *)self setIgnoreEndEditing:0];
  }
  else
  {
    [(CKMessageEntryContentView *)self setActiveView:0];
    id v4 = [(CKMessageEntryContentView *)self delegate];
    [v4 messageEntryContentViewDidEndEditing:self];
  }
}

- (void)textViewDidChange:(id)a3
{
  id v4 = a3;
  [(CKMessageEntryContentView *)self invalidateComposition];
  uint64_t v16 = 0;
  [v4 updateFontIfNeededAndGetWasUsingBigEmojiStyle:&v16];
  id v5 = [v4 attributedText];
  uint64_t v6 = [v5 length];

  if (!v6 && (unint64_t)(v16 - 1) <= 2)
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "didClearBigEmoji", buf, 2u);
      }
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__CKMessageEntryContentView_textViewDidChange___block_invoke;
    block[3] = &unk_1E5620C40;
    void block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  id v8 = [(CKMessageEntryContentView *)self textView];
  [v8 performTextViewUpdatesNeededBeforeLayoutPass];

  id v9 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v10 = [v9 isExpressiveTextEnabled];

  if (v10)
  {
    id v11 = [(CKMessageEntryContentView *)self textView];

    if (v11 == v4)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __47__CKMessageEntryContentView_textViewDidChange___block_invoke_2;
      v13[3] = &unk_1E5620C40;
      void v13[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], v13);
    }
  }
  int v12 = [(CKMessageEntryContentView *)self delegate];
  [v12 messageEntryContentViewDidChange:self isTextChange:1 isShelfChange:0];

  [(CKMessageEntryContentView *)self setNeedsTextLayout:1];
  [(CKMessageEntryContentView *)self setNeedsEnsureSelectionVisible:1];
  [(CKMessageEntryContentView *)self setNeedsLayout];
}

void __47__CKMessageEntryContentView_textViewDidChange___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateUI];
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 messageEntryContentViewDidChange:*(void *)(a1 + 32) isTextChange:1 isShelfChange:0];
}

void __47__CKMessageEntryContentView_textViewDidChange___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) textEffectCoordinator];
  [v1 updateWithReason:@"text changed"];
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  _NSRange v22 = a4;
  id v9 = a3;
  id v10 = a5;
  id v11 = [(CKMessageEntryContentView *)self delegate];
  LOBYTE(length) = objc_msgSend(v11, "messageEntryContentView:shouldChangeTextInRange:replacementText:", self, location, length, v10);

  if ((length & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      unint64_t v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int v21 = 0;
        _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "CKMessageEntryContentViewDelegate shouldChangeTextInRange returned NO. Rejecting text change.", v21, 2u);
      }
    }
    goto LABEL_10;
  }
  id v12 = [(CKMessageEntryContentView *)self textView];

  if (v12 == v9)
  {
    uint64_t v14 = [(CKMessageEntryContentView *)self textView];
    int v15 = [v14 shouldUpdateMentionsInRange:&v22 replacementText:v10];

    [(CKMessageEntryContentView *)self _provideHapticFeedbackIfNecessaryForText:v10];
    if (v15) {
      goto LABEL_9;
    }
LABEL_10:
    BOOL v19 = 0;
    goto LABEL_11;
  }
  [(CKMessageEntryContentView *)self _provideHapticFeedbackIfNecessaryForText:v10];
LABEL_9:
  uint64_t v16 = [(CKMessageEntryContentView *)self textView];
  [v16 setApplyDefaultTypingAttributesOnTextEffectPickerDismissal:0];

  uint64_t v17 = [(CKMessageEntryContentView *)self textView];
  id v18 = [v17 effectsPickerAssistant];
  objc_msgSend(v18, "adjustTypingAttributesIfNeededForReplacement:inRange:", v10, v22.location, v22.length);

  BOOL v19 = 1;
LABEL_11:

  return v19;
}

- (void)textViewDidChangeSelection:(id)a3
{
  id v7 = a3;
  id v4 = [(CKMessageEntryContentView *)self textView];

  id v5 = v7;
  if (v4 == v7)
  {
    [v7 selectedRange];
    id v5 = v7;
    if (!v6)
    {
      [(CKMessageEntryContentView *)self setNeedsEnsureSelectionVisible:1];
      [(CKMessageEntryContentView *)self setNeedsTextLayout:1];
      [(CKMessageEntryContentView *)self setNeedsLayout];
      id v5 = v7;
    }
  }
}

- (BOOL)textView:(id)a3 shouldInteractWithTextAttachment:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  return 0;
}

- (void)textViewWritingToolsWillBegin:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F6E778], "sharedFeatureFlags", a3);
  int v5 = [v4 isExpressiveTextEnabled];

  if (v5)
  {
    uint64_t v6 = [(CKMessageEntryContentView *)self textEffectCoordinator];

    if (v6)
    {
      id v7 = [(CKMessageEntryContentView *)self textEffectCoordinator];
      [v7 reset];

      id v8 = [(CKMessageEntryContentView *)self textEffectCoordinator];
      [v8 setPaused:1 includingAnimators:1];

      id v9 = [(CKMessageEntryContentView *)self textEffectCoordinator];
      [v9 updateWithReason:@"pausing because writing tools will begin"];
    }
  }
}

- (void)textViewWritingToolsDidEnd:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F6E778], "sharedFeatureFlags", a3);
  int v5 = [v4 isExpressiveTextEnabled];

  if (v5)
  {
    uint64_t v6 = [(CKMessageEntryContentView *)self textEffectCoordinator];

    if (v6)
    {
      id v7 = [(CKMessageEntryContentView *)self textEffectCoordinator];
      [v7 setPaused:0 includingAnimators:0];

      id v8 = [(CKMessageEntryContentView *)self textEffectCoordinator];
      [v8 updateWithReason:@"unpausing because writing tools did end"];
    }
  }
}

- (void)_provideHapticFeedbackIfNecessaryForText:(id)a3
{
  id v14 = a3;
  id v4 = [(CKMessageEntryContentView *)self conversation];
  int v5 = [v4 isStewieConversation];

  if (v5)
  {
    uint64_t v6 = [(CKMessageEntryContentView *)self impactFeedbackGenerator];

    if (!v6)
    {
      id v7 = (void *)[objc_alloc(MEMORY[0x1E4F42AA8]) initWithStyle:2];
      [(CKMessageEntryContentView *)self setImpactFeedbackGenerator:v7];

      id v8 = [(CKMessageEntryContentView *)self impactFeedbackGenerator];
      [v8 prepare];
    }
    id v9 = [(CKMessageEntryContentView *)self textView];
    id v10 = [v9 textStorage];
    id v11 = [v10 string];

    if ((unint64_t)[v11 lengthOfBytesUsingEncoding:4] <= 0x9F)
    {
      id v12 = [v11 stringByAppendingString:v14];
      if ((unint64_t)[v12 lengthOfBytesUsingEncoding:4] >= 0xA0)
      {
        unint64_t v13 = [(CKMessageEntryContentView *)self impactFeedbackGenerator];
        [v13 impactOccurred];
      }
    }
  }
}

- (double)maxWidthForPreviewImagesInMessageEntryRichTextView:(id)a3
{
  [(CKMessageEntryContentView *)self maxPreviewContentWidthWhenExpanded];
  double v5 = v4;
  [(CKMessageEntryContentView *)self containerViewLineWidth];
  double v7 = v5 + v6 * -2.0;
  [(CKMessageEntryContentView *)self entryContentViewTextLeftOffset];
  double v9 = v7 - v8;
  [(CKMessageEntryContentView *)self sendButtonTextInsetWidth];
  return v9 - v10;
}

- (double)_maxWidthForTextView
{
  [(CKMessageEntryContentView *)self maxContentWidthWhenExpanded];
  double v4 = v3;
  [(CKMessageEntryContentView *)self containerViewLineWidth];
  double v6 = v4 + v5 * -2.0;
  [(CKMessageEntryContentView *)self entryContentViewTextLeftOffset];
  double v8 = v6 - v7;
  [(CKMessageEntryContentView *)self sendButtonTextInsetWidth];
  return v8 - v9;
}

- (void)messageEntryTextViewDidChangePencilMode:(id)a3
{
  id v4 = [(CKMessageEntryContentView *)self delegate];
  [v4 messageEntryContentViewDidChangePencilMode:self];
}

- (BOOL)messageEntryRichTextView:(id)a3 shouldPasteMediaObjects:(id)a4
{
  id v5 = a4;
  double v6 = [(CKMessageEntryContentView *)self delegate];
  LOBYTE(self) = [v6 messageEntryContentView:self shouldInsertMediaObjects:v5];

  return (char)self;
}

- (void)messageEntryRichTextView:(id)a3 didTapMediaObject:(id)a4
{
  id v5 = a4;
  id v6 = [(CKMessageEntryContentView *)self delegate];
  [v6 messageEntryContentView:self didTapMediaObject:v5];
}

- (void)messageEntryRichTextViewWasTapped:(id)a3 isLongPress:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(CKMessageEntryContentView *)self delegate];
  [v6 messageEntryContentViewWasTapped:self isLongPress:v4];
}

- (void)messageEntryRichTextView:(id)a3 pastedURL:(id)a4
{
  id v5 = a4;
  id v6 = [(CKMessageEntryContentView *)self delegate];
  [v6 messageEntryContentView:self didPasteURL:v5];
}

- (void)messageEntryRichTextViewDidTapHandwritingKey:(id)a3
{
  id v4 = [(CKMessageEntryContentView *)self delegate];
  [v4 messageEntryContentViewDidTapHandwritingKey:self];
}

- (BOOL)messageEntryRichTextViewSupportsInlineAdaptiveImageGlyphs:(id)a3
{
  double v3 = [(CKMessageEntryContentView *)self conversation];
  char v4 = [v3 supportsInlineAdaptiveImageGlyphs];

  return v4;
}

- (BOOL)messageEntryRichTextView:(id)a3 shouldRecognizeGesture:(id)a4
{
  char v4 = self;
  id v5 = [(CKMessageEntryContentView *)self delegate];
  LOBYTE(v4) = [v5 messageEntryContentViewShouldBeginEditing:v4];

  return (char)v4;
}

- (BOOL)messageEntryRichTextViewShouldResignFirstResponder:(id)a3
{
  double v3 = self;
  char v4 = [(CKMessageEntryContentView *)self delegate];
  LOBYTE(v3) = [v4 messageEntryContentViewShouldResignFirstResponder:v3];

  return (char)v3;
}

- (void)messageEntryRichTextView:(id)a3 didPasteComposition:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  id v5 = [MEMORY[0x1E4F6E6D0] sharedManager];
  if ([v5 checksForSensitivityOnSend])
  {
    uint64_t v16 = v5;
    id v17 = v4;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id obj = [v4 mediaObjects];
    uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v22;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(obj);
          }
          double v10 = *(void **)(*((void *)&v21 + 1) + 8 * v9);
          id v11 = [MEMORY[0x1E4F6E6C8] sharedManager];
          id v12 = [v10 fileURL];
          unint64_t v13 = [(CKMessageEntryContentView *)self conversation];
          id v14 = [v13 chat];
          int v15 = [v14 chatIdentifier];
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = __74__CKMessageEntryContentView_messageEntryRichTextView_didPasteComposition___block_invoke;
          v20[3] = &unk_1E56211F0;
          v20[4] = v10;
          [v11 isSensitiveContent:v12 withChatID:v15 completionHandler:v20];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v7);
    }

    id v5 = v16;
    id v4 = v17;
  }
}

void __74__CKMessageEntryContentView_messageEntryRichTextView_didPasteComposition___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = [*(id *)(a1 + 32) filename];
      uint64_t v8 = (void *)v7;
      uint64_t v9 = @"NO";
      if (a2) {
        uint64_t v9 = @"YES";
      }
      int v10 = 138412546;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      unint64_t v13 = v9;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Pasted asset %@ is sensitive: %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)messageEntryRichTextView:(id)a3 willAddPluginTextAttachmentViewControllerToViewHierarchy:(id)a4
{
  id v5 = a4;
  id v6 = [(CKMessageEntryContentView *)self delegate];
  [v6 messageEntryContentView:self willAddPluginEntryViewControllerToViewHierarchy:v5];
}

- (void)messageEntryRichTextView:(id)a3 didAddPluginTextAttachmentViewControllerToViewHierarchy:(id)a4
{
  id v5 = a4;
  id v6 = [(CKMessageEntryContentView *)self delegate];
  [v6 messageEntryContentView:self didAddPluginEntryViewControllerToViewHierarchy:v5];
}

- (double)balloonMaxWidthForMessageEntryRichTextView:(id)a3
{
  id v4 = [(CKMessageEntryContentView *)self delegate];
  [v4 balloonMaxWidthForMessageEntryRichTextView:self];
  double v6 = v5;

  return v6;
}

- (BOOL)messageEntryRichTextViewShouldAllowLinkCustomization:(id)a3
{
  double v3 = self;
  id v4 = [(CKMessageEntryContentView *)self delegate];
  LOBYTE(v3) = [v4 messageEntryContentViewShouldAllowLinkCustomization:v3];

  return (char)v3;
}

- (void)messageEntryRichTextViewWillPresentCustomizationPicker:(id)a3
{
  id v4 = [(CKMessageEntryContentView *)self delegate];
  [v4 messageEntryContentViewWillPresentCustomizationPicker:self];
}

- (void)messageEntryRichTextViewDidPresentCustomizationPicker:(id)a3
{
  id v4 = [(CKMessageEntryContentView *)self delegate];
  [v4 messageEntryContentViewDidPresentCustomizationPicker:self];
}

- (void)messageEntryRichTextViewWillDismissCustomizationPicker:(id)a3
{
  id v4 = [(CKMessageEntryContentView *)self delegate];
  [v4 messageEntryContentViewWillDismissCustomizationPicker:self];
}

- (void)messageEntryRichTextViewDidDismissCustomizationPicker:(id)a3
{
  id v4 = [(CKMessageEntryContentView *)self delegate];
  [v4 messageEntryContentViewDidDismissCustomizationPicker:self];
}

- (BOOL)messageEntryRichTextView:(id)a3 canPerformDictationAction:(id)a4
{
  id v5 = a4;
  double v6 = [(CKMessageEntryContentView *)self delegate];
  LOBYTE(self) = [v6 messageEntryContentView:self canPerformDictationAction:v5];

  return (char)self;
}

- (void)messageEntryRichTextView:(id)a3 didTapGenerativeButtonForImageURL:(id)a4
{
  id v5 = a4;
  id v6 = [(CKMessageEntryContentView *)self delegate];
  [v6 messageEntryContentView:self didRequestGenerativeContentForImageURL:v5];
}

- (void)messageEntryTextViewTextFormattingAnimationsOptionsPresentationInProgress:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CKMessageEntryContentView *)self delegate];
  [v4 messageEntryContentViewTextFormattingAnimationsOptionsPresentationInProgress:v3];
}

- (void)prepareTextEffectsForImmediateMessageSend
{
  id v2 = [(CKMessageEntryContentView *)self textEffectCoordinator];
  [v2 reset];
}

- (void)unpauseTextEffectsCoordinator
{
  BOOL v3 = [(CKMessageEntryContentView *)self textEffectCoordinator];

  if (v3)
  {
    id v4 = [(CKMessageEntryContentView *)self textEffectCoordinator];
    [v4 updateWithReason:@"unpausing"];
  }
}

- (void)setTextEffectCoordinatorPaused:(BOOL)a3 reason:(id)a4
{
  BOOL v4 = a3;
  id v9 = a4;
  id v6 = [(CKMessageEntryContentView *)self textEffectCoordinator];

  if (v6)
  {
    uint64_t v7 = [(CKMessageEntryContentView *)self textEffectCoordinator];
    [v7 setPaused:v4 includingAnimators:1];

    uint64_t v8 = [(CKMessageEntryContentView *)self textEffectCoordinator];
    [v8 updateWithReason:v9];
  }
}

- (void)messageEntryTextView:(id)a3 didSetAnimationName:(id)a4 forRange:(_NSRange)a5
{
  NSUInteger length = (void *)a5.length;
  id v6 = (void *)a5.location;
  id v9 = a3;
  id v10 = a4;
  if (length)
  {
    id location = 0;
    objc_initWeak(&location, self);
    unsigned __int8 v25 = 0;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __79__CKMessageEntryContentView_messageEntryTextView_didSetAnimationName_forRange___block_invoke;
    v21[3] = &unk_1E56291B8;
    objc_copyWeak(v24, &location);
    id v11 = v9;
    id v22 = v11;
    id v23 = v10;
    v24[1] = v6;
    v24[2] = length;
    objc_msgSend(v11, "ck_toggleTextEffectNamed:inRange:getAdded:undo:", v23, v6, length, &v25, v21);
    [(CKMessageEntryContentView *)self invalidateComposition];
    if (v25)
    {
      __int16 v12 = -[CKTextEffectCoordinatorContinuationState initWithTextViewIdentifier:locationInAttributedText:ignoreTextViewEligibilityCheck:]([CKTextEffectCoordinatorContinuationState alloc], "initWithTextViewIdentifier:locationInAttributedText:ignoreTextViewEligibilityCheck:", @"textView", [v11 selectedRange], 0);
      unint64_t v13 = [(CKMessageEntryContentView *)self textEffectCoordinator];
      [v13 resetAndContinueFromState:v12];

      int v14 = v25;
    }
    else
    {
      int v14 = 0;
    }
    int v15 = NSString;
    v27.id location = (NSUInteger)v6;
    v27.NSUInteger length = (NSUInteger)length;
    uint64_t v16 = NSStringFromRange(v27);
    id v17 = (void *)v16;
    id v18 = @"added";
    if (!v14) {
      id v18 = @"removed";
    }
    BOOL v19 = [v15 stringWithFormat:@"animation %@ for range: %@", v18, v16];

    double v20 = [(CKMessageEntryContentView *)self textEffectCoordinator];
    [v20 updateWithReason:v19];

    [(CKMessageEntryContentView *)self _didChangeAttributesAffectingTextSize];
    objc_destroyWeak(v24);
    objc_destroyWeak(&location);
  }
}

void __79__CKMessageEntryContentView_messageEntryTextView_didSetAnimationName_forRange___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained invalidateComposition];

  unint64_t v13 = -[CKTextEffectCoordinatorContinuationState initWithTextViewIdentifier:locationInAttributedText:ignoreTextViewEligibilityCheck:]([CKTextEffectCoordinatorContinuationState alloc], "initWithTextViewIdentifier:locationInAttributedText:ignoreTextViewEligibilityCheck:", @"textView", [*(id *)(a1 + 32) selectedRange], 0);
  id v4 = objc_loadWeakRetained(v2);
  id v5 = [v4 textEffectCoordinator];
  [v5 resetAndContinueFromState:v13];

  id v6 = NSString;
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = NSStringFromRange(*(NSRange *)(a1 + 56));
  id v9 = [v6 stringWithFormat:@"undo animation %@ for range: %@", v7, v8];

  id v10 = objc_loadWeakRetained(v2);
  id v11 = [v10 textEffectCoordinator];
  [v11 updateWithReason:v9];

  id v12 = objc_loadWeakRetained(v2);
  [v12 _didChangeAttributesAffectingTextSize];
}

- (void)messageEntryTextView:(id)a3 didUpdateForRange:(_NSRange)a4 conversionHandler:(id)a5
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    id v8 = a5;
    id v9 = [(CKMessageEntryContentView *)self composition];
    id v10 = [v9 text];
    id v11 = objc_msgSend(v10, "ck_attributedStringByConverting:range:", v8, location, length);

    id v12 = [v9 subject];
    unint64_t v13 = [v9 shelfPluginPayload];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __86__CKMessageEntryContentView_messageEntryTextView_didUpdateForRange_conversionHandler___block_invoke;
    v14[3] = &unk_1E56291E0;
    id v14[4] = self;
    v14[5] = location;
    v14[6] = length;
    +[CKComposition compositionWithText:v11 subject:v12 shelfPluginPayload:v13 completionHandler:v14];
  }
}

void __86__CKMessageEntryContentView_messageEntryTextView_didUpdateForRange_conversionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setComposition:a2];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  id v5 = [*(id *)(a1 + 32) textView];
  objc_msgSend(v5, "setSelectedRange:", v4, v3);
}

- (void)messageEntryTextView:(id)a3 applyStyleChangeOfType:(unint64_t)a4 add:(BOOL)a5 forRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  BOOL v8 = a5;
  id v11 = a3;
  id v12 = v11;
  if (length && location != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v13 = [v11 undoManager];
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    id v23 = __86__CKMessageEntryContentView_messageEntryTextView_applyStyleChangeOfType_add_forRange___block_invoke;
    long long v24 = &unk_1E5629208;
    id v14 = v12;
    BOOL v30 = v8;
    unint64_t v27 = a4;
    NSUInteger v28 = location;
    NSUInteger v29 = length;
    id v25 = v14;
    uint64_t v26 = self;
    [v13 registerUndoWithTarget:self handler:&v21];

    int v15 = [v14 textStorage];
    [v15 beginEditing];
    if (v8)
    {
      objc_msgSend(v15, "ck_addTextStyle:options:range:", a4, 3, location, length);
      uint64_t v16 = @"added";
    }
    else
    {
      objc_msgSend(v15, "ck_removeTextStyle:options:range:", a4, 3, location, length);
      uint64_t v16 = @"removed";
    }
    [v15 endEditing];
    [(CKMessageEntryContentView *)self invalidateComposition];
    id v17 = NSString;
    v31.NSUInteger location = location;
    v31.NSUInteger length = length;
    id v18 = NSStringFromRange(v31);
    BOOL v19 = [v17 stringWithFormat:@"animation %@ for range: %@", v16, v18, v21, v22, v23, v24];

    double v20 = [(CKMessageEntryContentView *)self textEffectCoordinator];
    [v20 updateWithReason:v19];

    [(CKMessageEntryContentView *)self _didChangeAttributesAffectingTextSize];
  }
}

void __86__CKMessageEntryContentView_messageEntryTextView_applyStyleChangeOfType_add_forRange___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) textStorage];
  [v2 beginEditing];
  objc_msgSend(v2, "ck_removeTextStyle:options:range:", *(void *)(a1 + 48), 3, *(void *)(a1 + 56), *(void *)(a1 + 64));
  [v2 endEditing];
  [*(id *)(a1 + 40) invalidateComposition];
}

- (void)messageEntryTextView:(id)a3 replaceRange:(_NSRange)a4 withAttributedText:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v13 = (id)objc_msgSend(a5, "mutableCopy", a3);
  objc_msgSend(v13, "ck_replaceTextAnimationsWithIMTextEffects");
  objc_msgSend(v13, "ck_replaceBIUSWithIMTextStyles");
  BOOL v8 = [(CKMessageEntryContentView *)self composition];
  id v9 = [v8 text];
  id v10 = (void *)[v9 mutableCopy];
  objc_msgSend(v10, "replaceCharactersInRange:withAttributedString:", location, length, v13);
  id v11 = [v8 compositionByReplacingText:v10];
  [(CKMessageEntryContentView *)self setComposition:v11];

  id v12 = [(CKMessageEntryContentView *)self textEffectCoordinator];
  [v12 updateWithReason:@"replaced text with a suggested effect/BIUS styles"];
}

- (void)_didChangeAttributesAffectingTextSize
{
  uint64_t v3 = [(CKMessageEntryContentView *)self delegate];
  [v3 messageEntryContentViewDidChange:self isTextChange:1 isShelfChange:0];

  [(CKMessageEntryContentView *)self setNeedsTextLayout:1];
  [(CKMessageEntryContentView *)self setNeedsEnsureSelectionVisible:1];

  [(CKMessageEntryContentView *)self setNeedsLayout];
}

- (void)pluginPayloadWantsResize:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F6BBA0]];
  uint64_t v7 = v6;
  if (v6)
  {
    if (([v6 isEqualToString:@"stagedShelfPlugin"] & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        BOOL v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          int v28 = 138412290;
          NSUInteger v29 = v7;
          _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "A plugin that is NOT the shelf identifier {%@} was asked to reload. Bailing.", (uint8_t *)&v28, 0xCu);
        }
      }
      goto LABEL_22;
    }
  }
  else
  {
    id v9 = IMLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CKMessageEntryContentView pluginPayloadWantsResize:](v9);
    }
  }
  id v10 = [(CKMessageEntryContentView *)self pluginEntryViewController];

  if (v10)
  {
    [(CKMessageEntryContentView *)self setNeedsEnsureTextViewVisible:1];
    id v11 = [(CKMessageEntryContentView *)self conversation];
    id v12 = [v11 unsentComposition];
    id v13 = [v12 text];

    id v14 = [(CKMessageEntryContentView *)self composition];
    int v15 = [v14 text];

    if ([v15 length] || !objc_msgSend(v13, "length"))
    {
      uint64_t v16 = [(CKMessageEntryContentView *)self textView];
      [v16 setCompositionText:v15];
    }
    else
    {
      uint64_t v16 = [(CKMessageEntryContentView *)self textView];
      [v16 setCompositionText:v13];
    }

    id v17 = [(CKMessageEntryContentView *)self conversation];
    id v18 = [v17 unsentComposition];
    BOOL v19 = [v18 subject];

    double v20 = [(CKMessageEntryContentView *)self composition];
    uint64_t v21 = [v20 subject];

    if ([v21 length] || !objc_msgSend(v19, "length"))
    {
      uint64_t v22 = [(CKMessageEntryContentView *)self subjectView];
      [v22 setCompositionText:v21];
    }
    else
    {
      uint64_t v22 = [(CKMessageEntryContentView *)self textView];
      [v22 setCompositionText:v19];
    }

    id v23 = [(CKMessageEntryContentView *)self composition];
    -[CKMessageEntryContentView setIsCompositionExpirable:](self, "setIsCompositionExpirable:", [v23 isExpirableComposition]);

    [(CKMessageEntryContentView *)self _updateUI];
    long long v24 = [(CKMessageEntryContentView *)self delegate];
    [v24 messageEntryContentViewShelfDidChange:self];

    id v25 = [(CKMessageEntryContentView *)self pluginEntryViewController];
    char v26 = objc_opt_respondsToSelector();

    if (v26)
    {
      unint64_t v27 = [(CKMessageEntryContentView *)self pluginEntryViewController];
      [v27 didFinishAnimatedBoundsChange];
    }
  }
LABEL_22:
}

- (void)pluginPayloadDidLoad:(id)a3
{
  [(CKMessageEntryContentView *)self setNeedsTextLayout:1];

  [(CKMessageEntryContentView *)self setNeedsLayout];
}

- (void)quicktationEnablementDidChange
{
  [(CKMessageEntryContentView *)self setNeedsTextLayout:1];

  [(CKMessageEntryContentView *)self setNeedsLayout];
}

- (void)ckSendLaterViewWantsDatePickerPresented:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Received request to present SendLater's DatePicker.", v7, 2u);
    }
  }
  id v6 = [(CKMessageEntryContentView *)self delegate];
  [v6 messageEntryContentViewWantsSendLaterPickerPresented:self];
}

- (void)ckSendLaterViewCancelled:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Received signal that SendLater was cancelled by the user.", v6, 2u);
    }
  }
  [(CKMessageEntryContentView *)self setSendLaterPluginInfo:0 animated:1 completionHandler:&__block_literal_global_203_0];
}

- (id)textDraggableView:(id)a3 itemsForDrag:(id)a4
{
  id v5 = a4;
  id v6 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v7 = [(CKMessageEntryContentView *)self textView];
  BOOL v8 = [v5 dragRange];
  id v9 = [v7 attributedTextInRange:v8];

  uint64_t v10 = [v9 length];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __60__CKMessageEntryContentView_textDraggableView_itemsForDrag___block_invoke;
  v17[3] = &unk_1E5629258;
  void v17[4] = self;
  id v11 = v6;
  id v18 = v11;
  BOOL v19 = v9;
  id v12 = v9;
  objc_msgSend(v12, "enumerateAttributesInRange:options:usingBlock:", 0, v10, 0, v17);
  if ([v11 count])
  {
    id v13 = [v5 dragSession];
    [v13 setLocalContext:@"CKMessageEntryContentViewDragContext"];
  }
  id v14 = v19;
  id v15 = v11;

  return v15;
}

void __60__CKMessageEntryContentView_textDraggableView_itemsForDrag___block_invoke(id *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  BOOL v8 = v7;
  if (v7)
  {
    id v9 = [v7 objectForKey:@"CKFileTransferGUIDAttributeName"];
    uint64_t v10 = [v8 objectForKey:@"CKPluginPayloadGUIDAttributeName"];
    id v11 = (void *)v10;
    if (v9)
    {
      id v12 = [a1[4] textView];
      id v13 = [v12 cachedMediaObjectForTransferGUID:v9];

      if (v13)
      {
        id v14 = [v13 pasteboardItemProvider];
        if (!v14) {
          goto LABEL_17;
        }
      }
      else
      {
        uint64_t v22 = [MEMORY[0x1E4F6BCC8] sharedInstance];
        id v23 = [v22 transferForGUID:v9];

        long long v24 = [v23 localURL];
        id v14 = (void *)[objc_alloc(MEMORY[0x1E4F28D78]) initWithContentsOfURL:v24];
        id v25 = [v24 lastPathComponent];
        [v14 setSuggestedName:v25];

        if (!v14)
        {
LABEL_17:

          goto LABEL_18;
        }
      }
      char v26 = (void *)[objc_alloc(MEMORY[0x1E4F429A0]) initWithItemProvider:v14];
      unint64_t v27 = [a1[4] textView];
      [v26 setLocalObject:v27];

      int v28 = [v8 objectForKey:*MEMORY[0x1E4FB06B8]];
      NSUInteger v29 = v28;
      if (v28)
      {
        uint64_t v30 = [v28 image];
        if (v30)
        {
          NSRange v31 = (void *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v30];
          [v31 sizeToFit];
          v41[0] = MEMORY[0x1E4F143A8];
          v41[1] = 3221225472;
          v41[2] = __60__CKMessageEntryContentView_textDraggableView_itemsForDrag___block_invoke_2;
          v41[3] = &unk_1E5629230;
          id v42 = v31;
          id v32 = v31;
          [v26 setPreviewProvider:v41];
        }
        [a1[5] addObject:v26];
      }
      goto LABEL_17;
    }
    if (v10)
    {
      id v15 = [a1[4] textView];
      uint64_t v16 = [v15 cachedPluginDisplayContainerForGUID:v11];

      id v17 = [v16 pasteboardItemProvider];
      id v18 = (void *)[objc_alloc(MEMORY[0x1E4F429A0]) initWithItemProvider:v17];
      BOOL v19 = [a1[4] textView];
      [v18 setLocalObject:v19];

      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __60__CKMessageEntryContentView_textDraggableView_itemsForDrag___block_invoke_3;
      v39[3] = &unk_1E5629230;
      double v40 = v16;
      id v20 = v16;
      [v18 setPreviewProvider:v39];
      [a1[5] addObject:v18];
      uint64_t v21 = v40;
    }
    else
    {
      objc_msgSend(a1[6], "attributedSubstringFromRange:", a3, a4);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      if ([v17 length] == 1)
      {
        id v18 = [v17 string];
        if ([v18 characterAtIndex:0] == 10) {
          goto LABEL_9;
        }
        uint64_t v33 = [v17 length];

        if (!v33) {
          goto LABEL_10;
        }
      }
      else if (![v17 length])
      {
        goto LABEL_10;
      }
      if (!v17) {
        goto LABEL_18;
      }
      id v34 = objc_alloc(MEMORY[0x1E4F28D78]);
      int v35 = [[CKAttributedStringItemProviderWriter alloc] initWithAttributedString:v17];
      id v18 = (void *)[v34 initWithObject:v35];

      id v20 = (id)[objc_alloc(MEMORY[0x1E4F429A0]) initWithItemProvider:v18];
      uint64_t v36 = [a1[4] textView];
      [v20 setLocalObject:v36];

      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __60__CKMessageEntryContentView_textDraggableView_itemsForDrag___block_invoke_4;
      v37[3] = &unk_1E5629230;
      id v38 = v17;
      id v17 = v17;
      [v20 setPreviewProvider:v37];
      [a1[5] addObject:v20];
      uint64_t v21 = v38;
    }

LABEL_9:
LABEL_10:

LABEL_18:
  }
}

id __60__CKMessageEntryContentView_textDraggableView_itemsForDrag___block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F429A8]);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = objc_alloc_init(MEMORY[0x1E4F429B0]);
  id v5 = (void *)[v2 initWithView:v3 parameters:v4];

  return v5;
}

id __60__CKMessageEntryContentView_textDraggableView_itemsForDrag___block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) composeImage];
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v1];
  [v2 sizeToFit];
  [v2 frame];
  objc_msgSend(v2, "setFrame:");
  id v3 = objc_alloc(MEMORY[0x1E4F429A8]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F429B0]);
  id v5 = (void *)[v3 initWithView:v2 parameters:v4];

  return v5;
}

id __60__CKMessageEntryContentView_textDraggableView_itemsForDrag___block_invoke_4(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F42F10]);
  id v3 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v3 setAttributedText:*(void *)(a1 + 32)];
  [v3 sizeToFit];
  id v4 = objc_alloc(MEMORY[0x1E4F429A8]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F429B0]);
  id v6 = (void *)[v4 initWithView:v3 parameters:v5];

  return v6;
}

- (double)_calcuateIdealMaxPluginHeight:(BOOL)a3
{
  BOOL v3 = a3;
  [(CKMessageEntryContentView *)self bounds];
  double v6 = v5;
  id v7 = +[CKUIBehavior sharedBehaviors];
  BOOL v8 = [v7 entryViewlayoutMetrics];

  [(CKMessageEntryContentView *)self _pluginMargins];
  double v10 = v9;
  double v12 = v11;
  if (CKPixelWidth_once_11 != -1) {
    dispatch_once(&CKPixelWidth_once_11, &__block_literal_global_783);
  }
  double v13 = *(double *)&CKPixelWidth_sPixel_11;
  [v8 defaultEntryContentViewHeight];
  double v15 = v14;
  uint64_t v16 = [MEMORY[0x1E4F6BC18] sharedInstance];
  id v17 = [(CKMessageEntryContentView *)self shelfPluginPayload];
  id v18 = [v17 pluginBundleID];
  BOOL v19 = [v16 balloonPluginForBundleID:v18];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v20 = +[CKUIBehavior sharedBehaviors];
    [v20 entryViewMaxExtensionShelfHeight];
  }
  else
  {
    id v20 = +[CKUIBehavior sharedBehaviors];
    [v20 entryViewMaxPluginShelfHeight];
  }
  double v22 = fmin(v6 - v13 - v15 - v10 - v12, v21);

  id v23 = +[CKUIBehavior sharedBehaviors];
  [v23 entryViewMinPluginShelfHeight];
  double v25 = fmax(v22, v24);

  return v25;
}

- (void)ensureSelectionVisibleIfNeeded
{
  if ([(CKMessageEntryContentView *)self needsEnsureSelectionVisible])
  {
    id v38 = [(CKMessageEntryContentView *)self activeView];
    if (v38)
    {
      uint64_t v4 = [v38 selectedRange];
      if (v3 <= 1) {
        uint64_t v5 = 1;
      }
      else {
        uint64_t v5 = v3;
      }
      objc_msgSend(v38, "_rectForScrollToVisible:", v4, v5);
      double x = v6;
      double y = v8;
      double width = v10;
      double height = v12;
      double v14 = [v38 textStorage];
      uint64_t v15 = [v14 length];

      if (v4 == v15)
      {
        uint64_t v16 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
        int v17 = [v16 isTextKit2Enabled];

        if (v17)
        {
          CGFloat v18 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
          double v37 = *MEMORY[0x1E4F1DB28];
          double v19 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
          double v20 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
          double v21 = [(CKMessageEntryContentView *)self textView];
          double v22 = [v21 textLayoutManager];

          id v23 = [v22 textViewportLayoutController];
          double v24 = [v22 documentRange];
          double v25 = [v24 endLocation];
          [v23 relocateViewportToTextLocation:v25];
          double v27 = v26;

          int v28 = [v22 textViewportLayoutController];
          double v29 = v27;
          CGFloat v30 = v37;
          [v28 adjustViewportByVerticalOffset:v29];

          NSRange v31 = [v22 textViewportLayoutController];
          [v31 layoutViewport];
        }
        else
        {
          double v22 = [v38 layoutManager];
          [v22 extraLineFragmentUsedRect];
          CGFloat v30 = v32;
          CGFloat v18 = v33;
          double v19 = v34;
          double v20 = v35;
        }

        if (v19 != *MEMORY[0x1E4F1DB30] || v20 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
        {
          v40.origin.double x = x;
          v40.origin.double y = y;
          v40.size.double width = width;
          v40.size.double height = height;
          v42.origin.double x = v30;
          v42.origin.double y = v18;
          v42.size.double width = v19;
          v42.size.double height = v20;
          CGRect v41 = CGRectUnion(v40, v42);
          double x = v41.origin.x;
          double y = v41.origin.y;
          double width = v41.size.width;
          double height = v41.size.height;
        }
      }
      -[CKMessageEntryContentView convertRect:fromView:](self, "convertRect:fromView:", v38, x, y, width, height);
      -[CKMessageEntryContentView scrollRectToVisible:animated:](self, "scrollRectToVisible:animated:", 0);
    }
    [(CKMessageEntryContentView *)self setNeedsEnsureSelectionVisible:0];
  }
}

- (void)ensureTextViewVisibleIfNeeded
{
  if ([(CKMessageEntryContentView *)self needsEnsureTextViewVisible]
    || [(CKMessageEntryContentView *)self forceEnsureTextViewVisble])
  {
    [(UIScrollView *)self __ck_scrollToBottom:0];
    [(CKMessageEntryContentView *)self setNeedsEnsureTextViewVisible:0];
  }
}

- (void)invalidateComposition
{
  if (IMOSLoggingEnabled())
  {
    unint64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "invalidating composition", v5, 2u);
    }
  }
  composition = self->_composition;
  self->_composition = 0;
}

- (CGSize)_computedSizeForTextView:(id)a3 maxWidth:(double)a4
{
  id v5 = a3;
  double v6 = +[CKUIBehavior sharedBehaviors];
  [v6 entryViewCoverMinHeight];
  double v8 = v7;

  objc_msgSend(v5, "sizeThatFits:", a4, 1.79769313e308);
  double v10 = v9;

  double v11 = fmax(v10, v8);
  double v12 = a4;
  result.double height = v11;
  result.double width = v12;
  return result;
}

- (void)_layoutTextView:(id)a3 currentYOffset:(double *)a4 originX:(double)a5 maxWidth:(double)a6
{
  id v10 = a3;
  [(CKMessageEntryContentView *)self _computedSizeForTextView:v10 maxWidth:a6];
  double v12 = v11;
  double v14 = v13;
  [v10 textContainerInset];
  double v16 = a5 - v15;
  double v17 = *a4;
  [(CKMessageEntryContentView *)self placeHolderWidth];
  objc_msgSend(v10, "setPlaceHolderWidth:");
  objc_msgSend(v10, "setFrame:", v16, v17, v12, v14);

  *a4 = v14 + *a4;
}

- (void)_layoutDividerLine:(id)a3 leftInset:(double)a4 widthInset:(double)a5 currentYOffset:(double *)a6
{
  id v10 = a3;
  [(CKMessageEntryContentView *)self containerViewLineWidth];
  double v12 = v11 + a4;
  double v13 = *a6;
  [(CKMessageEntryContentView *)self bounds];
  double v15 = v14 - a5;
  [(CKMessageEntryContentView *)self containerViewLineWidth];
  double v17 = v15 + v16 * -2.0;
  if (CKPixelWidth_once_11 != -1) {
    dispatch_once(&CKPixelWidth_once_11, &__block_literal_global_783);
  }
  objc_msgSend(v10, "setFrame:", v12, v13, v17, *(double *)&CKPixelWidth_sPixel_11);

  double v18 = *a6;
  if (CKPixelWidth_once_11 != -1) {
    dispatch_once(&CKPixelWidth_once_11, &__block_literal_global_783);
  }
  *a6 = v18 + *(double *)&CKPixelWidth_sPixel_11;
}

- (void)_updateUI
{
  if (self->_pluginEntryViewController)
  {
    unint64_t v3 = CKFrameworkBundle();
    uint64_t v4 = [v3 localizedStringForKey:@"ADD_COMMENT_OR_SEND" value:&stru_1EDE4CA38 table:@"ChatKit"];
    [(CKMessageEntryContentView *)self setOverridePlaceholderText:v4];
  }
  else
  {
    [(CKMessageEntryContentView *)self setOverridePlaceholderText:0];
  }
  id v5 = [(CKMessageEntryContentView *)self overridePlaceholderText];
  if (v5) {
    [(CKMessageEntryContentView *)self overridePlaceholderText];
  }
  else {
  double v6 = [(CKMessageEntryContentView *)self requestedPlaceholderText];
  }
  double v7 = [(CKMessageEntryContentView *)self textView];
  [v7 setPlaceholderText:v6];

  [(CKMessageEntryContentView *)self containerViewLineWidth];
  double v9 = v8 + 17.0;
  [(CKMessageEntryContentView *)self containerViewLineWidth];
  double v11 = v10 + 17.0;
  [(CKMessageEntryContentView *)self containerViewLineWidth];
  -[CKMessageEntryContentView setScrollIndicatorInsets:](self, "setScrollIndicatorInsets:", v9, 0.0, v11, v12 + 5.0);
  [(CKMessageEntryContentView *)self setNeedsTextLayout:1];

  [(CKMessageEntryContentView *)self setNeedsLayout];
}

- (BOOL)shouldShowClearButton
{
  if (self->_shouldHideClearPluginButton) {
    return 0;
  }
  uint64_t v4 = [(CKMessageEntryContentView *)self pluginEntryViewController];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [(CKMessageEntryContentView *)self pluginEntryViewController];
    char v2 = [v5 wantsClearButton];
  }
  else
  {
    char v2 = 0;
  }

  return v2;
}

- (BOOL)shouldShowGenerationButton
{
  return 0;
}

- (BOOL)_currentPluginIsGPPlugin
{
  char v2 = [(CKMessageEntryContentView *)self shelfPluginPayload];
  unint64_t v3 = [v2 pluginBundleID];
  uint64_t v4 = IMBalloonExtensionIDWithSuffix();
  char v5 = [v3 isEqualToString:v4];

  return v5;
}

- (void)clearPluginButtonTapped:(id)a3
{
  uint64_t v4 = [(CKMessageEntryContentView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    double v6 = [(CKMessageEntryContentView *)self delegate];
    double v7 = [(CKMessageEntryContentView *)self shelfPluginPayload];
    [v6 messageEntryContentViewCancelWasTapped:self shelfPluginPayload:v7];
  }
  double v8 = [(CKMessageEntryContentView *)self pluginEntryViewController];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    double v10 = [(CKMessageEntryContentView *)self pluginEntryViewController];
    [v10 payloadWillClear];
  }
  [(CKComposition *)self->_composition cleanupCKShareFromComposition];
  [(CKMessageEntryContentView *)self setShelfPluginPayload:0];
  [(CKMessageEntryContentView *)self invalidateComposition];

  [(CKMessageEntryContentView *)self setPluginEntryViewController:0];
}

- (void)setContainerViewLineWidth:(double)a3
{
  if (self->_containerViewLineWidth != a3)
  {
    self->_containerViewLineWidth = a3;
    [(CKMessageEntryContentView *)self _updateUI];
  }
}

- (void)setClearPluginButtonEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CKMessageEntryContentView *)self clearPluginButton];
  [v4 setEnabled:v3];
}

- (void)setSendButtonTextInsetWidth:(double)a3
{
  if (self->_sendButtonTextInsetWidth != a3)
  {
    self->_sendButtonTextInsetWidth = a3;
    [(CKMessageEntryContentView *)self setNeedsTextLayout:1];
    [(CKMessageEntryContentView *)self setNeedsLayout];
  }
}

- (void)setMaxPluginShelfViewWidth:(double)a3
{
  if (self->_maxPluginShelfViewWidth != a3)
  {
    self->_maxPluginShelfViewWidth = a3;
    [(CKMessageEntryContentView *)self setNeedsTextLayout:1];
    [(CKMessageEntryContentView *)self setNeedsLayout];
  }
}

+ (id)_createSubjectView
{
  char v2 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v3 = [v2 isTextKit2Enabled];

  id v4 = [CKMessageEntryTextView alloc];
  double v5 = *MEMORY[0x1E4F1DB28];
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  if (v3) {
    char v9 = -[CKMessageEntryTextView initUsingTextLayoutManagerWithFrame:](v4, "initUsingTextLayoutManagerWithFrame:", v5, v6, v7, v8);
  }
  else {
    char v9 = -[CKMessageEntryTextView initWithFrame:textContainer:](v4, "initWithFrame:textContainer:", 0, v5, v6, v7, v8);
  }
  double v10 = v9;
  [(CKMessageEntryTextView *)v9 setShowsHorizontalScrollIndicator:1];
  double v11 = CKFrameworkBundle();
  double v12 = [v11 localizedStringForKey:@"SUBJECT" value:&stru_1EDE4CA38 table:@"ChatKit"];
  [(CKMessageEntryTextView *)v10 setPlaceholderText:v12];

  double v13 = +[CKUIBehavior sharedBehaviors];
  double v14 = [v13 balloonSubjectFont];
  [(CKMessageEntryTextView *)v10 setFont:v14];

  double v15 = +[CKUIBehavior sharedBehaviors];
  double v16 = [v15 theme];
  double v17 = [v16 entryFieldTextColor];
  [(CKMessageEntryTextView *)v10 setTextColor:v17];

  [(CKMessageEntryTextView *)v10 setSupportsBigEmojiTextStyles:0];
  double v18 = +[CKUIBehavior sharedBehaviors];
  double v19 = [v18 theme];
  -[CKMessageEntryTextView setKeyboardAppearance:](v10, "setKeyboardAppearance:", [v19 keyboardAppearance]);

  [(CKMessageEntryTextView *)v10 setBackgroundColor:0];
  [(CKMessageEntryTextView *)v10 setOpaque:0];

  return v10;
}

- (id)pluginSnapshotViewForPluginAtIndex:(unint64_t)a3 isFromTextAttachment:(BOOL *)a4 startingScaleMultiplier:(double *)a5
{
  char v9 = [(CKMessageEntryContentView *)self pluginView];

  if (!v9) {
    goto LABEL_4;
  }
  if (a3)
  {
    --a3;
LABEL_4:
    uint64_t v19 = 0;
    double v20 = &v19;
    uint64_t v21 = 0x3032000000;
    double v22 = __Block_byref_object_copy__43;
    id v23 = __Block_byref_object_dispose__43;
    id v24 = 0;
    double v10 = [(CKMessageEntryContentView *)self textView];
    double v11 = [v10 attributedText];

    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x2020000000;
    v18[3] = 0;
    uint64_t v12 = [v11 length];
    uint64_t v13 = *MEMORY[0x1E4FB06B8];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __109__CKMessageEntryContentView_pluginSnapshotViewForPluginAtIndex_isFromTextAttachment_startingScaleMultiplier___block_invoke;
    v17[3] = &unk_1E5629280;
    v17[6] = a3;
    v17[7] = a4;
    v17[8] = a5;
    void v17[4] = v18;
    void v17[5] = &v19;
    objc_msgSend(v11, "enumerateAttribute:inRange:options:usingBlock:", v13, 0, v12, 0, v17);
    id v14 = (id)v20[5];
    _Block_object_dispose(v18, 8);

    _Block_object_dispose(&v19, 8);
    goto LABEL_10;
  }
  if (a4) {
    *a4 = 0;
  }
  if (a5) {
    *a5 = 1.0;
  }
  double v15 = [(CKMessageEntryContentView *)self pluginView];
  id v14 = [v15 snapshotViewAfterScreenUpdates:0];

LABEL_10:

  return v14;
}

void __109__CKMessageEntryContentView_pluginSnapshotViewForPluginAtIndex_isFromTextAttachment_startingScaleMultiplier___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v7 = a2;
  if (v7)
  {
    double v18 = v7;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v7 = v18;
    if (isKindOfClass)
    {
      id v9 = v18;
      double v10 = v9;
      uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v12 = *(void *)(v11 + 24);
      if (v12 == *(void *)(a1 + 48))
      {
        uint64_t v13 = *(unsigned char **)(a1 + 56);
        if (v13) {
          unsigned char *v13 = 1;
        }
        if (*(void *)(a1 + 64))
        {
          [v9 downscaleMultiplier];
          **(void **)(a1 + 64) = v14;
        }
        uint64_t v15 = [v10 makeThrowAnimationSnapshotView];
        uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
        double v17 = *(void **)(v16 + 40);
        *(void *)(v16 + 40) = v15;

        *a5 = 1;
      }
      else
      {
        *(void *)(v11 + 24) = v12 + 1;
      }

      id v7 = v18;
    }
  }
}

- (void)balloonPluginDataSource:(id)a3 shouldSendAsCopy:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(CKMessageEntryContentView *)self shelfPluginPayload];
  [v7 setSendAsCopy:v4];

  double v8 = [(CKMessageEntryContentView *)self shelfPluginPayload];
  id v9 = [v8 url];

  double v10 = [(CKMessageEntryContentView *)self shelfPluginPayload];
  uint64_t v11 = [v10 sendAsCopyURL];

  if (v11)
  {
    uint64_t v12 = [(CKMessageEntryContentView *)self shelfPluginPayload];
    uint64_t v13 = [v12 sendAsCopyURL];

    id v9 = (void *)v13;
  }
  if (v9)
  {
    uint64_t v14 = [v9 lastPathComponent];
    uint64_t v15 = [v14 stringByRemovingPercentEncoding];

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __70__CKMessageEntryContentView_balloonPluginDataSource_shouldSendAsCopy___block_invoke;
    v18[3] = &unk_1E56292A8;
    id v19 = v9;
    id v20 = v15;
    uint64_t v21 = self;
    uint64_t v16 = v15;
    +[CKComposition mediaObjectFromItemAtURL:v19 filename:v16 completion:v18];
  }
  else
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_6;
    }
    uint64_t v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v17 = 0;
      _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "URL is nil so we don't create a composition", v17, 2u);
    }
  }

LABEL_6:
}

void __70__CKMessageEntryContentView_balloonPluginDataSource_shouldSendAsCopy___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = a1[4];
      uint64_t v9 = a1[5];
      int v17 = 138413058;
      id v18 = v5;
      __int16 v19 = 2112;
      uint64_t v20 = v8;
      __int16 v21 = 2112;
      uint64_t v22 = v9;
      __int16 v23 = 2112;
      id v24 = v6;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Created mediaObject:%@ from url:%@, filename:%@. Error: %@", (uint8_t *)&v17, 0x2Au);
    }
  }
  double v10 = objc_alloc_init(CKComposition);
  uint64_t v12 = (void *)a1[6];
  uint64_t v11 = (id *)(a1 + 6);
  uint64_t v13 = [v12 shelfPluginPayload];
  uint64_t v14 = [(CKComposition *)v10 compositionByAppendingText:0 shelfPluginPayload:v13 shelfMediaObject:v5 collaborationShareOptions:0];

  uint64_t v15 = [*v11 composition];
  uint64_t v16 = [v14 compositionByAppendingCollaborativeComposition:v15];

  [*v11 setComposition:v16];
}

- (BOOL)textEffectCoordinator:(id)a3 textViewIdentifierIsCandidateForTextEffectPlayback:(id)a4
{
  return 1;
}

- (id)visibleTextViewIdentifiersFor:(id)a3
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = @"textView";
  int v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)textEffectCoordinator:(id)a3 highPriorityTextViewIdentifiersForUnplayedVisibleTextViewIdentifiers:(id)a4
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)canStartNewTextAnimationsInTextEffectCoordinator:(id)a3
{
  return 1;
}

- (void)textViewWillBeginEmojiRippleAnimation:(id)a3
{
  id v4 = a3;
  id v5 = [(CKMessageEntryContentView *)self textEffectCoordinator];
  [v5 setPaused:1 includingAnimators:0];
  [v5 reset];
  id v6 = [v4 textStorage];

  [v6 beginEditing];
  uint64_t v7 = [v6 length];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__CKMessageEntryContentView_textViewWillBeginEmojiRippleAnimation___block_invoke;
  v9[3] = &unk_1E56292D0;
  id v10 = v6;
  id v8 = v6;
  objc_msgSend(v8, "ck_enumerateTextAnimationsIn:options:using:", 0, v7, 0, v9);
  [v8 endEditing];
}

uint64_t __67__CKMessageEntryContentView_textViewWillBeginEmojiRippleAnimation___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", *MEMORY[0x1E4FB0790], a3, a4);
}

- (void)textViewDidEndEmojiRippleAnimation:(id)a3
{
  id v5 = [a3 textStorage];
  [v5 beginEditing];
  objc_msgSend(v5, "ck_addDisplayableAttributeForIMTextEffectAttribute");
  [v5 endEditing];
  id v4 = [(CKMessageEntryContentView *)self textEffectCoordinator];
  [v4 setPaused:0 includingAnimators:0];
  [v4 updateWithReason:@"resumed because emoji ripple animation did end"];
}

- (int64_t)style
{
  return self->_style;
}

- (BOOL)shouldShowSubject
{
  return self->_shouldShowSubject;
}

- (void)setShouldShowSubject:(BOOL)a3
{
  self->_shouldShowSubject = a3;
}

- (BOOL)shouldHideClearPluginButton
{
  return self->_shouldHideClearPluginButton;
}

- (void)setShouldHideClearPluginButton:(BOOL)a3
{
  self->_shouldHideClearPluginButton = a3;
}

- (CKMessageEntryTextView)subjectView
{
  return self->_subjectView;
}

- (void)setSubjectView:(id)a3
{
}

- (CKMessageEntryRichTextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
}

- (CKSendLaterPluginInfo)sendLaterPluginInfo
{
  return self->_sendLaterPluginInfo;
}

- (CKSendLaterView)sendLaterView
{
  return self->_sendLaterView;
}

- (void)setSendLaterView:(id)a3
{
}

- (UIView)pluginDividerLine
{
  return self->_pluginDividerLine;
}

- (void)setPluginDividerLine:(id)a3
{
}

- (void)setActiveView:(id)a3
{
}

- (IMPluginPayload)shelfPluginPayload
{
  return self->_shelfPluginPayload;
}

- (void)setShelfPluginPayload:(id)a3
{
}

- (BOOL)ignoreEndEditing
{
  return self->_ignoreEndEditing;
}

- (void)setIgnoreEndEditing:(BOOL)a3
{
  self->_ignoreEndEditing = a3;
}

- (CKMentionsAnimationController)mentionsController
{
  return self->_mentionsController;
}

- (void)setMentionsController:(id)a3
{
}

- (double)placeHolderWidth
{
  return self->_placeHolderWidth;
}

- (BOOL)shouldStripEmojis
{
  return self->_shouldStripEmojis;
}

- (BOOL)forceEnsureTextViewVisble
{
  return self->_forceEnsureTextViewVisble;
}

- (void)setForceEnsureTextViewVisble:(BOOL)a3
{
  self->_forceEnsureTextViewVisble = a3;
}

- (BOOL)needsEnsureTextViewVisible
{
  return self->_needsEnsureTextViewVisible;
}

- (void)setNeedsEnsureTextViewVisible:(BOOL)a3
{
  self->_needsEnsureTextViewVisible = a3;
}

- (double)maxContentWidthWhenExpanded
{
  return self->_maxContentWidthWhenExpanded;
}

- (void)setMaxContentWidthWhenExpanded:(double)a3
{
  self->_maxContentWidthWhenExpanded = a3;
}

- (double)maxPreviewContentWidthWhenExpanded
{
  return self->_maxPreviewContentWidthWhenExpanded;
}

- (void)setMaxPreviewContentWidthWhenExpanded:(double)a3
{
  self->_maxPreviewContentWidthWhenExpanded = a3;
}

- (double)containerViewLineWidth
{
  return self->_containerViewLineWidth;
}

- (double)sendButtonTextInsetWidth
{
  return self->_sendButtonTextInsetWidth;
}

- (double)maxPluginShelfViewWidth
{
  return self->_maxPluginShelfViewWidth;
}

- (CKPluginEntryViewController)pluginEntryViewController
{
  return self->_pluginEntryViewController;
}

- (CKConversation)conversation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_conversation);

  return (CKConversation *)WeakRetained;
}

- (void)setConversation:(id)a3
{
}

- (_TtC7ChatKit23CKTextEffectCoordinator)textEffectCoordinator
{
  return self->_textEffectCoordinator;
}

- (void)setTextEffectCoordinator:(id)a3
{
}

- (UIView)textAndSubjectDividerLine
{
  return self->_textAndSubjectDividerLine;
}

- (void)setTextAndSubjectDividerLine:(id)a3
{
}

- (BOOL)needsTextLayout
{
  return self->_needsTextLayout;
}

- (void)setNeedsTextLayout:(BOOL)a3
{
  self->_needsTextLayout = a3;
}

- (BOOL)needsEnsureSelectionVisible
{
  return self->_needsEnsureSelectionVisible;
}

- (void)setNeedsEnsureSelectionVisible:(BOOL)a3
{
  self->_needsEnsureSelectionVisible = a3;
}

- (BOOL)isCompositionExpirable
{
  return self->_isCompositionExpirable;
}

- (void)setIsCompositionExpirable:(BOOL)a3
{
  self->_isCompositionExpirable = a3;
}

- (BOOL)shouldSkipRemovalFromParent
{
  return self->_shouldSkipRemovalFromParent;
}

- (void)setShouldSkipRemovalFromParent:(BOOL)a3
{
  self->_shouldSkipRemovalFromParent = a3;
}

- (UIButton)clearPluginButton
{
  return self->_clearPluginButton;
}

- (void)setClearPluginButton:(id)a3
{
}

- (NSString)requestedPlaceholderText
{
  return self->_requestedPlaceholderText;
}

- (void)setRequestedPlaceholderText:(id)a3
{
}

- (NSString)overridePlaceholderText
{
  return self->_overridePlaceholderText;
}

- (void)setOverridePlaceholderText:(id)a3
{
}

- (BOOL)pendingShelfPayloadWillAnimateIn
{
  return self->_pendingShelfPayloadWillAnimateIn;
}

- (void)setPendingShelfPayloadWillAnimateIn:(BOOL)a3
{
  self->_pendingShelfPayloadWillAnimateIn = a3;
}

- (NSDictionary)bizIntent
{
  return self->_bizIntent;
}

- (void)setBizIntent:(id)a3
{
}

- (CKMediaObject)shelfMediaObject
{
  return self->_shelfMediaObject;
}

- (void)setShelfMediaObject:(id)a3
{
}

- (_SWCollaborationShareOptions)collaborationShareOptions
{
  return self->_collaborationShareOptions;
}

- (void)setCollaborationShareOptions:(id)a3
{
}

- (NSArray)collaborationOptions
{
  return self->_collaborationOptions;
}

- (void)setCollaborationOptions:(id)a3
{
}

- (UIImpactFeedbackGenerator)impactFeedbackGenerator
{
  return self->_impactFeedbackGenerator;
}

- (void)setImpactFeedbackGenerator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impactFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_collaborationOptions, 0);
  objc_storeStrong((id *)&self->_collaborationShareOptions, 0);
  objc_storeStrong((id *)&self->_shelfMediaObject, 0);
  objc_storeStrong((id *)&self->_bizIntent, 0);
  objc_storeStrong((id *)&self->_overridePlaceholderText, 0);
  objc_storeStrong((id *)&self->_requestedPlaceholderText, 0);
  objc_storeStrong((id *)&self->_clearPluginButton, 0);
  objc_storeStrong((id *)&self->_textAndSubjectDividerLine, 0);
  objc_storeStrong((id *)&self->_textEffectCoordinator, 0);
  objc_destroyWeak((id *)&self->_conversation);
  objc_storeStrong((id *)&self->_pluginEntryViewController, 0);
  objc_storeStrong((id *)&self->_mentionsController, 0);
  objc_storeStrong((id *)&self->_shelfPluginPayload, 0);
  objc_destroyWeak((id *)&self->_activeView);
  objc_storeStrong((id *)&self->_pluginDividerLine, 0);
  objc_storeStrong((id *)&self->_sendLaterView, 0);
  objc_storeStrong((id *)&self->_sendLaterPluginInfo, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_subjectView, 0);
  objc_storeStrong((id *)&self->_composition, 0);

  objc_storeStrong((id *)&self->_textViewRespondsToShowTextFormattingAnimationOptions, 0);
}

- (id)richLinksEditMenuForAttributedText:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = (void *)a4.length;
  id v5 = (void *)a4.location;
  id v7 = a3;
  if (length)
  {
    if ([MEMORY[0x1E4F6E730] deviceIsLockedDown])
    {
      NSUInteger length = 0;
    }
    else
    {
      location[0] = 0;
      objc_initWeak(location, self);
      id v8 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v9 = [v7 string];
      id v10 = +[CKRichLinkUtilities validURLsInString:inRange:](_TtC7ChatKit19CKRichLinkUtilities, "validURLsInString:inRange:", v9, v5, length);

      if ([v10 count])
      {
        if ((unint64_t)[v10 count] >= 2)
        {
          uint64_t v11 = CKFrameworkBundle();
          [v11 localizedStringForKey:@"SHOW_LINK_PREVIEW_PLURAL" value:&stru_1EDE4CA38 table:@"ChatKit"];
        }
        else
        {
          uint64_t v11 = CKFrameworkBundle();
          [v11 localizedStringForKey:@"SHOW_LINK_PREVIEW" value:&stru_1EDE4CA38 table:@"ChatKit"];
        uint64_t v12 = };

        uint64_t v13 = (void *)MEMORY[0x1E4F426E8];
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __83__CKMessageEntryContentView_RichLinks__richLinksEditMenuForAttributedText_inRange___block_invoke;
        v34[3] = &unk_1E56299E8;
        id v35 = v10;
        objc_copyWeak(&v36, location);
        uint64_t v14 = [v13 actionWithTitle:v12 image:0 identifier:0 handler:v34];
        [v8 addObject:v14];

        objc_destroyWeak(&v36);
      }
      uint64_t v15 = objc_msgSend(v7, "ck_linkPreviewTextAttachmentsInRange:", v5, length);
      if ([v15 count])
      {
        if ((unint64_t)[v15 count] >= 2)
        {
          uint64_t v16 = CKFrameworkBundle();
          [v16 localizedStringForKey:@"CONVERT_TO_TEXT_LINK_PLURAL" value:&stru_1EDE4CA38 table:@"ChatKit"];
        }
        else
        {
          uint64_t v16 = CKFrameworkBundle();
          [v16 localizedStringForKey:@"CONVERT_TO_TEXT_LINK" value:&stru_1EDE4CA38 table:@"ChatKit"];
        int v17 = };

        id v18 = (void *)MEMORY[0x1E4F426E8];
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __83__CKMessageEntryContentView_RichLinks__richLinksEditMenuForAttributedText_inRange___block_invoke_96;
        v30[3] = &unk_1E562C798;
        id v31 = v15;
        v33[1] = v5;
        v33[2] = length;
        objc_copyWeak(v33, location);
        id v32 = v7;
        __int16 v19 = [v18 actionWithTitle:v17 image:0 identifier:0 handler:v30];
        [v8 addObject:v19];

        objc_destroyWeak(v33);
      }
      if ([v15 count] == 1)
      {
        uint64_t v20 = [v15 firstObject];
        if ([v20 canPresentCustomizationPicker])
        {
          __int16 v21 = CKFrameworkBundle();
          uint64_t v22 = [v21 localizedStringForKey:@"CUSTOMIZE_LINK" value:&stru_1EDE4CA38 table:@"ChatKit"];

          __int16 v23 = (void *)MEMORY[0x1E4F426E8];
          v28[0] = MEMORY[0x1E4F143A8];
          v28[1] = 3221225472;
          v28[2] = __83__CKMessageEntryContentView_RichLinks__richLinksEditMenuForAttributedText_inRange___block_invoke_100;
          v28[3] = &unk_1E56211C8;
          id v29 = v20;
          id v24 = [v23 actionWithTitle:v22 image:0 identifier:0 handler:v28];
          [v8 addObject:v24];
        }
      }
      uint64_t v25 = (void *)MEMORY[0x1E4F42B80];
      double v26 = (void *)[v8 copy];
      NSUInteger length = [v25 menuWithTitle:&stru_1EDE4CA38 image:0 identifier:0 options:1 children:v26];

      objc_destroyWeak(location);
    }
  }

  return length;
}

void __83__CKMessageEntryContentView_RichLinks__richLinksEditMenuForAttributedText_inRange___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = [*(id *)(a1 + 32) count];
      int v12 = 134217984;
      uint64_t v13 = v5;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Will replace {%ld} detected URL(s) with rich links.", (uint8_t *)&v12, 0xCu);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = [WeakRetained textView];
  id v8 = [v7 text];
  uint64_t v9 = [v8 length];

  id v10 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v11 = [v10 textView];
  objc_msgSend(v11, "replaceTextInRange:withLinks:", 0, v9, *(void *)(a1 + 32));
}

void __83__CKMessageEntryContentView_RichLinks__richLinksEditMenuForAttributedText_inRange___block_invoke_96(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = [*(id *)(a1 + 32) count];
      id v6 = NSStringFromRange(*(NSRange *)(a1 + 56));
      int v8 = 134218242;
      uint64_t v9 = v5;
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Converting a selection that includes {%ld} inlined rich links to text. In range={%@}}.", (uint8_t *)&v8, 0x16u);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _updateAttributedTextContent:*(void *)(a1 + 40) byApplyingInteraction:2 toLinkTextAttachments:*(void *)(a1 + 32)];
}

void __83__CKMessageEntryContentView_RichLinks__richLinksEditMenuForAttributedText_inRange___block_invoke_100(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Invoking presentCustomizationPicker on a rich link text attachment via callout menu...", v5, 2u);
    }
  }
  [*(id *)(a1 + 32) presentCustomizationPicker];
}

- (void)_updateAttributedTextContent:(id)a3 byApplyingInteraction:(int64_t)a4 toLinkTextAttachments:(id)a5
{
  char v8 = 0;
  id v6 = objc_msgSend(a3, "ck_attributedStringByApplyingRichLinkInteraction:toLinkTextAttachments:stringDidChange:", a4, a5, &v8);
  if (v8)
  {
    id v7 = [(CKMessageEntryContentView *)self textView];
    [v7 setAttributedText:v6];
  }
}

- (void)pluginPayloadWantsResize:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_18EF18000, log, OS_LOG_TYPE_ERROR, "A plugin was updated without a staging identifier! Programming error.", v1, 2u);
}

@end