@interface CKMessageEntryTextView
+ (BOOL)shouldUseModernMentionsAndEmojiAnimations;
+ (void)setNeedsDisplayCurrentRenderAttributesForView:(id)a3;
- (BOOL)_canSuggestSupplementalItemsForCurrentSelection;
- (BOOL)_shouldHandleTextFormattingChangeValue:(id)a3;
- (BOOL)_shouldReplaceKeyboardForTextFormattingKeyboardSessionIfApplicable;
- (BOOL)allowCalloutActions;
- (BOOL)allowsMentions;
- (BOOL)applyDefaultTypingAttributesOnTextEffectPickerDismissal;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)handleTapOrLongPressOnMediaObjectForTransferGUID:(id)a3 characterIndex:(int64_t)a4 location:(CGPoint)a5 touchedCharacterFrame:(CGRect)a6;
- (BOOL)hideCaret;
- (BOOL)hideCaretUntilUserTypes;
- (BOOL)isExpressiveTextEnabled;
- (BOOL)isInPencilMode;
- (BOOL)isPencilWriting;
- (BOOL)isShowingDictationPlaceholder;
- (BOOL)isSingleLine;
- (BOOL)preventShowingCalloutMenu;
- (BOOL)resignFirstResponder;
- (BOOL)sendCurrentLocationFromKeyboardEnabled;
- (BOOL)shouldIncludeDictationPadding;
- (BOOL)shouldPreserveAdaptiveImageGlyphsInCompositionText;
- (BOOL)shouldStripEmojis;
- (BOOL)shouldUpdateMentionsInRange:(_NSRange *)a3 replacementText:(id)a4;
- (BOOL)supportsBigEmojiTextStyles;
- (CGRect)caretRectForPosition:(id)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKEntryRichTextViewEffectsPickerAssistant)effectsPickerAssistant;
- (CKMessageEntryTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4;
- (CKMessageEntryTextViewMentionsDelegate)mentionsDelegate;
- (CKMessageEntryTextViewTextFormattingDelegate)textFormattingDelegate;
- (NSAttributedString)compositionText;
- (NSDictionary)proofreadingInfo;
- (NSString)description;
- (NSString)placeholderText;
- (SEL)_sendCurrentLocationAction;
- (UIAction)showTextEffectsPickerEditMenuAction;
- (UIColor)placeholderColor;
- (UIKeyboardInputMode)savedKeyboardInputMode;
- (UILongPressGestureRecognizer)longPressGestureRecognizer;
- (UIScribbleInteraction)scribbleInteraction;
- (UITapGestureRecognizer)doubleTapGestureRecognizer;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (double)adjustedLineFragmentPadding;
- (double)placeHolderWidth;
- (id)_supportedAnimationAccessibilityHintsForTextFormatting;
- (id)_supportedAnimationNamesForTextFormatting;
- (id)_supportedAnimationTitlesForTextFormatting;
- (id)initUsingTextLayoutManagerWithFrame:(CGRect)a3;
- (id)initUsingTextLayoutManagerWithFrame:(CGRect)a3 textContainer:(id)a4;
- (id)insertDictationResultPlaceholder;
- (id)mediaObjects;
- (unint64_t)fontType;
- (void)_cancelChooseSupplementalItemToInsert;
- (void)_chooseSupplementalItemToInsert:(id)a3 replacementRange:(id)a4 completionHandler:(id)a5;
- (void)_insertSupplementalItem:(id)a3 forString:(id)a4 replacementRange:(id)a5;
- (void)_insertionPointEnteredRange:(id)a3 string:(id)a4 supplementalItems:(id)a5;
- (void)_insertionPointExitedRangeWithSupplementalItems;
- (void)_layoutPlaceholder;
- (void)_localeChanged;
- (void)_setAnimatingMentionsHidden:(BOOL)a3;
- (void)_setupTapOrLongPressGestureRecognizers;
- (void)_showTextFormattingAnimationOptions:(id)a3;
- (void)_stripEmojisIfNecessary;
- (void)_updateAttributedPlaceholder;
- (void)_updateTextContainerInsetUsingFont:(id)a3;
- (void)_updateTextEffectsPickerEditMenuAction;
- (void)_updatedAllowedTypingAttributesWithKeys:(id)a3;
- (void)acceptAutomaticMentionConfirmation;
- (void)checkForMentions;
- (void)dealloc;
- (void)didEndEditing:(id)a3;
- (void)didLongPressMentionForTextView:(id)a3 characterIndex:(unint64_t)a4 isLongPress:(BOOL)a5;
- (void)didTapMentionForTextView:(id)a3 atCharacterIndex:(double)a4;
- (void)handleHoverGesture:(id)a3;
- (void)handleTapOrLongPress:(id)a3;
- (void)hideTextEffectsPickerIfNeeded;
- (void)hideTextEffectsPickerIfNeededAndResetTypingAttributes;
- (void)insertMentionByName:(id)a3;
- (void)keyboardWillShow:(id)a3;
- (void)layoutManagerDidFinishAnimatingMentionWithAnimationIdentifier:(id)a3;
- (void)layoutSubviews;
- (void)reloadMentionsData;
- (void)removeDictationResultPlaceholder:(id)a3 willInsertResult:(BOOL)a4;
- (void)replaceRange:(id)a3 withAttributedText:(id)a4;
- (void)restoreKeyboardInputMode;
- (void)saveKeyboardInputMode;
- (void)scribbleInteractionDidFinishWriting:(id)a3;
- (void)scribbleInteractionWillBeginWriting:(id)a3;
- (void)setAdjustedLineFragmentPadding:(double)a3;
- (void)setAllowCalloutActions:(BOOL)a3;
- (void)setApplyDefaultTypingAttributesOnTextEffectPickerDismissal:(BOOL)a3;
- (void)setAttributedText:(id)a3;
- (void)setAttributedText:(id)a3 checkForMentions:(BOOL)a4;
- (void)setCompositionText:(id)a3;
- (void)setDoubleTapGestureRecognizer:(id)a3;
- (void)setEffectsPickerAssistant:(id)a3;
- (void)setExpressiveTextEnabled:(BOOL)a3;
- (void)setFont:(id)a3;
- (void)setFontType:(unint64_t)a3;
- (void)setHideCaret:(BOOL)a3;
- (void)setHideCaretUntilUserTypes:(BOOL)a3;
- (void)setInPencilMode:(BOOL)a3;
- (void)setLongPressGestureRecognizer:(id)a3;
- (void)setMentionsDelegate:(id)a3;
- (void)setNeedsDisplayCurrentRenderAttributes;
- (void)setPencilWriting:(BOOL)a3;
- (void)setPlaceHolderWidth:(double)a3;
- (void)setPlaceholderColor:(id)a3;
- (void)setPlaceholderText:(id)a3;
- (void)setPreventShowingCalloutMenu:(BOOL)a3;
- (void)setProofreadingInfo:(id)a3;
- (void)setSavedKeyboardInputMode:(id)a3;
- (void)setScribbleInteraction:(id)a3;
- (void)setSendCurrentLocationFromKeyboardEnabled:(BOOL)a3;
- (void)setShouldStripEmojis:(BOOL)a3;
- (void)setShowTextEffectsPickerEditMenuAction:(id)a3;
- (void)setShowingDictationPlaceholder:(BOOL)a3;
- (void)setSupportsBigEmojiTextStyles:(BOOL)a3;
- (void)setTapGestureRecognizer:(id)a3;
- (void)setTextFormattingDelegate:(id)a3;
- (void)setupScribbleInteraction;
- (void)setupTextViewFromInitWithTextLayoutManagerWithFrame:(CGRect)a3;
- (void)textViewDidChange:(id)a3;
- (void)updateFontIfNeededAndGetWasUsingBigEmojiStyle:(int64_t *)a3;
- (void)updateMentionAssociationsForInputModeChange:(id)a3;
- (void)updateMentionsAssociations;
- (void)updateTextAttributesWithConversionHandler:(id)a3;
- (void)updateTextView;
- (void)updateTextViewAndCheckForMentions:(BOOL)a3;
@end

@implementation CKMessageEntryTextView

- (void)_updateAttributedPlaceholder
{
  placeholderText = (__CFString *)self->_placeholderText;
  if (!placeholderText) {
    placeholderText = &stru_1EDE4CA38;
  }
  v13 = placeholderText;
  placeholderColor = self->_placeholderColor;
  if (placeholderColor)
  {
    v5 = placeholderColor;
  }
  else
  {
    v6 = +[CKUIBehavior sharedBehaviors];
    v7 = [v6 theme];
    v5 = [v7 entryFieldGrayColor];
  }
  v8 = objc_opt_new();
  [v8 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4FB0700]];
  v9 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v10 = [v9 isExpressiveTextEnabled];

  if (v10) {
    objc_msgSend(MEMORY[0x1E4FB08E0], "ck_fontWithMessageEntryTextViewFontType:", -[CKMessageEntryTextView fontType](self, "fontType"));
  }
  else {
  v11 = [(CKMessageEntryTextView *)self font];
  }
  if (v11) {
    [v8 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4FB06F8]];
  }
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v13 attributes:v8];
  [(CKMessageEntryTextView *)self setAttributedPlaceholder:v12];

  [(CKMessageEntryTextView *)self setNeedsLayout];
}

- (unint64_t)fontType
{
  return self->_fontType;
}

- (void)_updateTextContainerInsetUsingFont:(id)a3
{
  id v4 = a3;
  v5 = +[CKUIBehavior sharedBehaviors];
  [v5 entryViewVerticalTextFieldInsets];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  v14 = +[CKUIBehavior sharedBehaviors];
  [v14 entryViewCoverMinHeight];
  double v16 = v15;

  [v4 lineHeight];
  double v18 = v17;

  double v19 = v11 + v7 + v18;
  if (v19 >= v16) {
    double v20 = v11;
  }
  else {
    double v20 = (v16 - v18) * 0.5;
  }
  if (v19 >= v16) {
    double v21 = v7;
  }
  else {
    double v21 = (v16 - v18) * 0.5;
  }

  -[CKMessageEntryTextView setTextContainerInset:](self, "setTextContainerInset:", v21, v9, v20, v13);
}

- (void)setupTextViewFromInitWithTextLayoutManagerWithFrame:(CGRect)a3
{
  self->_fontType = 0;
  self->_supportsBigEmojiTextStyles = 1;
  self->_expressiveTextEnabled = 0;
  id v4 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [v4 addObserver:self selector:sel_textViewDidChange_ name:*MEMORY[0x1E4F43E98] object:self];

  v5 = [(CKMessageEntryTextView *)self textContainer];
  double v6 = +[CKUIBehavior sharedBehaviors];
  [v6 balloonLineFragmentPadding];
  objc_msgSend(v5, "setLineFragmentPadding:");

  double v7 = +[CKUIBehavior sharedBehaviors];
  [v7 entryViewVerticalTextFieldInsets];
  -[CKMessageEntryTextView setTextContainerInset:](self, "setTextContainerInset:");

  [(CKMessageEntryTextView *)self setBackgroundColor:0];
  [(CKMessageEntryTextView *)self setOpaque:0];
  [(CKMessageEntryTextView *)self setScrollEnabled:0];
  double v8 = +[CKUIBehavior sharedBehaviors];
  double v9 = [v8 theme];
  double v10 = [v9 entryFieldGrayColor];
  [(CKMessageEntryTextView *)self setPlaceholderColor:v10];

  double v11 = [(CKMessageEntryTextView *)self _placeholderLabel];
  [v11 setNumberOfLines:1];

  double v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v12 addObserver:self selector:sel__localeChanged name:*MEMORY[0x1E4F43E60] object:0];

  [(CKMessageEntryTextView *)self _setupTapOrLongPressGestureRecognizers];
  [(CKMessageEntryTextView *)self setupScribbleInteraction];
  double v13 = [[CKEntryRichTextViewEffectsPickerAssistant alloc] initWithTextView:self];
  [(CKMessageEntryTextView *)self setEffectsPickerAssistant:v13];

  [(CKMessageEntryTextView *)self _updatedAllowedTypingAttributesWithKeys:MEMORY[0x1E4F1CBF0]];
  if (CKShouldUseModernRippleAnimation() && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [(EMKTextView *)self setUsingTextEffectBasedEmojiAnimations:1];
  }
}

- (void)setupScribbleInteraction
{
  id v4 = (id)[objc_alloc(MEMORY[0x1E4F42DA0]) initWithDelegate:self];
  [(CKMessageEntryTextView *)self setScribbleInteraction:v4];
  [(CKMessageEntryTextView *)self addInteraction:v4];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F42A70]) initWithTarget:self action:sel_handleHoverGesture_];
  [v3 setDelegate:self];
  [v3 setAllowedTouchTypes:&unk_1EDF159C8];
  [(CKMessageEntryTextView *)self addGestureRecognizer:v3];
  -[CKMessageEntryTextView setInPencilMode:](self, "setInPencilMode:", [MEMORY[0x1E4F42DA0] isPencilInputExpected]);
}

- (void)setScribbleInteraction:(id)a3
{
}

- (void)setPlaceholderColor:(id)a3
{
  id v5 = a3;
  if ((-[UIColor isEqual:](self->_placeholderColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_placeholderColor, a3);
    [(CKMessageEntryTextView *)self _updateAttributedPlaceholder];
  }
}

- (void)setInPencilMode:(BOOL)a3
{
  if (self->_inPencilMode != a3)
  {
    self->_inPencilMode = a3;
    id v4 = [(CKMessageEntryTextView *)self delegate];
    [v4 messageEntryTextViewDidChangePencilMode:self];
  }
}

- (void)setEffectsPickerAssistant:(id)a3
{
}

- (void)_setupTapOrLongPressGestureRecognizers
{
  id v5 = (id)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel_handleTapOrLongPress_];
  [v5 setAllowableMovement:10.0];
  [v5 setDelaysTouchesEnded:0];
  [v5 setDelegate:self];
  [(CKMessageEntryTextView *)self addGestureRecognizer:v5];
  [(CKMessageEntryTextView *)self setTapGestureRecognizer:v5];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F42B70]) initWithTarget:self action:sel_handleTapOrLongPress_];
  [v3 setDelegate:self];
  [v3 setDelaysTouchesEnded:0];
  [v5 requireGestureRecognizerToFail:v3];
  [(CKMessageEntryTextView *)self addGestureRecognizer:v3];
  [(CKMessageEntryTextView *)self setLongPressGestureRecognizer:v3];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel_handleDoubleTap_];
  [v4 setDelaysTouchesEnded:0];
  [v4 setNumberOfTapsRequired:2];
  [v5 requireGestureRecognizerToFail:v4];
  [(CKMessageEntryTextView *)self setDoubleTapGestureRecognizer:v4];
  [(CKMessageEntryTextView *)self addGestureRecognizer:v4];
}

- (void)setTapGestureRecognizer:(id)a3
{
}

- (void)setLongPressGestureRecognizer:(id)a3
{
}

- (void)setDoubleTapGestureRecognizer:(id)a3
{
}

- (void)setAllowCalloutActions:(BOOL)a3
{
  self->_allowCalloutActions = a3;
}

- (id)initUsingTextLayoutManagerWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)CKMessageEntryTextView;
  id v7 = [(EMKTextView *)&v10 initUsingTextLayoutManagerWithFrame:sel_initUsingTextLayoutManagerWithFrame_];
  double v8 = v7;
  if (v7) {
    objc_msgSend(v7, "setupTextViewFromInitWithTextLayoutManagerWithFrame:", x, y, width, height);
  }
  return v8;
}

- (void)_updatedAllowedTypingAttributesWithKeys:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4FB0738];
  uint64_t v22 = *MEMORY[0x1E4FB06F8];
  uint64_t v23 = v4;
  uint64_t v5 = *MEMORY[0x1E4FB06C0];
  uint64_t v24 = *MEMORY[0x1E4FB0700];
  uint64_t v25 = v5;
  uint64_t v6 = *MEMORY[0x1E4FB0710];
  uint64_t v26 = *MEMORY[0x1E4FB0718];
  uint64_t v27 = v6;
  uint64_t v7 = *MEMORY[0x1E4FB0808];
  uint64_t v28 = *MEMORY[0x1E4FB0768];
  uint64_t v29 = v7;
  uint64_t v8 = *MEMORY[0x1E4FB0778];
  uint64_t v30 = *MEMORY[0x1E4FB0770];
  uint64_t v31 = v8;
  uint64_t v9 = *MEMORY[0x1E4FB0790];
  uint64_t v32 = *MEMORY[0x1E4FB0758];
  uint64_t v33 = v9;
  uint64_t v10 = *MEMORY[0x1E4FB06C8];
  uint64_t v34 = *MEMORY[0x1E4FB0720];
  uint64_t v35 = v10;
  uint64_t v11 = *MEMORY[0x1E4FB0760];
  uint64_t v36 = *MEMORY[0x1E4FB0800];
  uint64_t v37 = v11;
  uint64_t v12 = *MEMORY[0x1E4FB06F0];
  uint64_t v38 = *MEMORY[0x1E4FB0728];
  uint64_t v39 = v12;
  uint64_t v13 = *MEMORY[0x1E4FB0810];
  uint64_t v40 = *MEMORY[0x1E4FB0818];
  uint64_t v41 = v13;
  uint64_t v14 = *MEMORY[0x1E4F6D538];
  uint64_t v42 = *MEMORY[0x1E4F6D508];
  uint64_t v43 = v14;
  uint64_t v44 = *MEMORY[0x1E4F6D518];
  double v15 = (void *)MEMORY[0x1E4F1C978];
  id v16 = a3;
  double v17 = [v15 arrayWithObjects:&v22 count:23];
  double v18 = objc_msgSend(v17, "mutableCopy", v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38,
                  v39,
                  v40,
                  v41,
                  v42,
                  v43,
                  v44,
                  v45);

  [v18 addObjectsFromArray:v16];
  double v19 = (void *)MEMORY[0x1E4F1CAD0];
  double v20 = (void *)[v18 copy];
  double v21 = [v19 setWithArray:v20];
  [(CKMessageEntryTextView *)self _setAllowedTypingAttributes:v21];
}

- (void)setSupportsBigEmojiTextStyles:(BOOL)a3
{
  self->_supportsBigEmojiTextStyles = a3;
}

- (void)setPlaceholderText:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_placeholderText, "isEqualToString:"))
  {
    uint64_t v4 = (NSString *)[v6 copy];
    placeholderText = self->_placeholderText;
    self->_placeholderText = v4;

    [(CKMessageEntryTextView *)self _updateAttributedPlaceholder];
  }
}

- (void)setFont:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CKMessageEntryTextView *)self font];
  if ([v5 isEqual:v4])
  {
    id v6 = [(CKMessageEntryTextView *)self _placeholderLabel];
    uint64_t v7 = [v6 font];
    char v8 = [v7 isEqual:v4];

    if (v8) {
      goto LABEL_8;
    }
  }
  else
  {
  }
  v12.receiver = self;
  v12.super_class = (Class)CKMessageEntryTextView;
  [(CKMessageEntryTextView *)&v12 setFont:v4];
  [(CKMessageEntryTextView *)self _updateAttributedPlaceholder];
  uint64_t v9 = [(CKMessageEntryTextView *)self font];
  char v10 = [v9 isEqual:v4];

  if ((v10 & 1) == 0) {
    [(CKMessageEntryTextView *)self setNeedsLayout];
  }
  uint64_t v11 = [(CKMessageEntryTextView *)self font];
  [(CKMessageEntryTextView *)self _updateTextContainerInsetUsingFont:v11];

LABEL_8:
}

- (BOOL)resignFirstResponder
{
  v5.receiver = self;
  v5.super_class = (Class)CKMessageEntryTextView;
  BOOL v3 = [(CKMessageEntryTextView *)&v5 resignFirstResponder];
  if (v3)
  {
    [(CKMessageEntryTextView *)self setSavedKeyboardInputMode:0];
    [(CKMessageEntryTextView *)self setInPencilMode:0];
    [(CKMessageEntryTextView *)self setPencilWriting:0];
  }
  return v3;
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(UITapGestureRecognizer *)self->_tapGestureRecognizer setDelegate:0];
  [(UILongPressGestureRecognizer *)self->_longPressGestureRecognizer setDelegate:0];
  v4.receiver = self;
  v4.super_class = (Class)CKMessageEntryTextView;
  [(EMKTextView *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doubleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_scribbleInteraction, 0);
  objc_storeStrong((id *)&self->_savedKeyboardInputMode, 0);
  objc_destroyWeak((id *)&self->_textFormattingDelegate);
  objc_storeStrong((id *)&self->_showTextEffectsPickerEditMenuAction, 0);
  objc_storeStrong((id *)&self->_effectsPickerAssistant, 0);
  objc_storeStrong((id *)&self->_proofreadingInfo, 0);
  objc_destroyWeak((id *)&self->_mentionsDelegate);
  objc_storeStrong((id *)&self->_placeholderColor, 0);

  objc_storeStrong((id *)&self->_placeholderText, 0);
}

- (void)didEndEditing:(id)a3
{
  if (CKIsRunningInMessagesNotificationExtension())
  {
    [(CKMessageEntryTextView *)self checkForMentions];
  }
}

- (BOOL)_canSuggestSupplementalItemsForCurrentSelection
{
  v2 = [(CKMessageEntryTextView *)self mentionsDelegate];
  char v3 = [v2 canSuggestSupplementalItemsForCurrentSelection];

  return v3;
}

- (void)_insertSupplementalItem:(id)a3 forString:(id)a4 replacementRange:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(CKMessageEntryTextView *)self mentionsDelegate];
  [v11 insertSupplementalItem:v10 forString:v9 replacementRange:v8];
}

- (void)_insertionPointEnteredRange:(id)a3 string:(id)a4 supplementalItems:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(CKMessageEntryTextView *)self mentionsDelegate];
  [v11 insertionPointEnteredRange:v10 string:v9 supplementalItems:v8];
}

- (void)_insertionPointExitedRangeWithSupplementalItems
{
  id v2 = [(CKMessageEntryTextView *)self mentionsDelegate];
  [v2 insertionPointExitedRangeWithSupplementalItems];
}

- (void)_chooseSupplementalItemToInsert:(id)a3 replacementRange:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(CKMessageEntryTextView *)self mentionsDelegate];
  [v11 chooseSupplementalItemToInsert:v10 replacementRange:v9 completionHandler:v8];
}

- (void)_cancelChooseSupplementalItemToInsert
{
  id v2 = [(CKMessageEntryTextView *)self mentionsDelegate];
  [v2 cancelChooseSupplementalItemToInsert];
}

- (void)didTapMentionForTextView:(id)a3 atCharacterIndex:(double)a4
{
  id v5 = [(CKMessageEntryTextView *)self mentionsDelegate];
  [v5 didTapMentionAtCharacterIndex:a4];
}

- (void)didLongPressMentionForTextView:(id)a3 characterIndex:(unint64_t)a4 isLongPress:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = [(CKMessageEntryTextView *)self mentionsDelegate];
  [v7 didLongPressMentionAtCharacterIndex:a4 isLongPress:v5];
}

- (void)updateMentionAssociationsForInputModeChange:(id)a3
{
  id v3 = [(CKMessageEntryTextView *)self mentionsDelegate];
  [v3 updateMentionsAssociations];
}

- (void)acceptAutomaticMentionConfirmation
{
  id v2 = [(CKMessageEntryTextView *)self mentionsDelegate];
  [v2 acceptAutomaticMentionConfirmation];
}

- (void)updateMentionsAssociations
{
  id v2 = [(CKMessageEntryTextView *)self mentionsDelegate];
  [v2 updateMentionsAssociations];
}

- (void)reloadMentionsData
{
  id v2 = [(CKMessageEntryTextView *)self mentionsDelegate];
  [v2 reloadMentionsData];
}

- (void)checkForMentions
{
  id v2 = [(CKMessageEntryTextView *)self mentionsDelegate];
  [v2 checkForMentions];
}

- (void)insertMentionByName:(id)a3
{
  id v4 = a3;
  id v5 = [(CKMessageEntryTextView *)self mentionsDelegate];
  [v5 insertMentionByName:v4];
}

- (BOOL)shouldUpdateMentionsInRange:(_NSRange *)a3 replacementText:(id)a4
{
  id v6 = a4;
  id v7 = [(CKMessageEntryTextView *)self mentionsDelegate];
  [v7 setCurrentTappedCharacterIndex:0x7FFFFFFFFFFFFFFFLL];

  id v8 = [(CKMessageEntryTextView *)self mentionsDelegate];
  LOBYTE(a3) = objc_msgSend(v8, "shouldUpdateMentionsInRange:withReplacementText:", a3->location, a3->length, v6);

  return (char)a3;
}

- (BOOL)allowsMentions
{
  id v2 = [(CKMessageEntryTextView *)self mentionsDelegate];
  char v3 = [v2 allowsMentions];

  return v3;
}

- (void)_setAnimatingMentionsHidden:(BOOL)a3
{
  id v6 = [(CKMessageEntryTextView *)self textLayoutManager];
  if (!v6)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"CKMessageEntryTextView+CKMentionsController.m" lineNumber:21 description:@"TextKit 2 expected"];
  }
  id v7 = [(CKMessageEntryTextView *)self attributedText];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__CKMessageEntryTextView_CKMentionsController___setAnimatingMentionsHidden___block_invoke;
  v10[3] = &unk_1E5627D40;
  BOOL v13 = a3;
  id v11 = v6;
  objc_super v12 = self;
  id v8 = v6;
  objc_msgSend(v7, "ck_enumerateAllMentionAnimationIdentifiersUsingBlock:", v10);

  [(id)objc_opt_class() setNeedsDisplayCurrentRenderAttributesForView:self];
}

void __76__CKMessageEntryTextView_CKMentionsController___setAnimatingMentionsHidden___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7 = [*(id *)(a1 + 32) documentRange];
  id v8 = *(void **)(a1 + 32);
  id v18 = v7;
  id v9 = [v7 location];
  id v10 = [v8 locationFromLocation:v9 withOffset:a3];

  id v11 = [*(id *)(a1 + 32) locationFromLocation:v10 withOffset:a4];
  objc_super v12 = (void *)[objc_alloc(MEMORY[0x1E4FB08B0]) initWithLocation:v10 endLocation:v11];
  int v13 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v14 = [*(id *)(a1 + 40) textLayoutManager];
  double v15 = v14;
  uint64_t v16 = *MEMORY[0x1E4FB0700];
  if (v13)
  {
    double v17 = [MEMORY[0x1E4F428B8] clearColor];
    [v15 addRenderingAttribute:v16 value:v17 forTextRange:v12];
  }
  else
  {
    [v14 removeRenderingAttribute:*MEMORY[0x1E4FB0700] forTextRange:v12];
  }
}

- (void)setNeedsDisplayCurrentRenderAttributes
{
  char v3 = objc_opt_class();

  [v3 setNeedsDisplayCurrentRenderAttributesForView:self];
}

+ (void)setNeedsDisplayCurrentRenderAttributesForView:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 setNeedsDisplay];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = objc_msgSend(v4, "subviews", 0);
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
        [a1 setNeedsDisplayCurrentRenderAttributesForView:*(void *)(*((void *)&v10 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSString)description
{
  char v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(CKMessageEntryTextView *)self frame];
  id v5 = NSStringFromCGRect(v16);
  uint64_t v6 = [(CKMessageEntryTextView *)self text];
  uint64_t v7 = [v6 length];
  [(CKMessageEntryTextView *)self contentSize];
  uint64_t v8 = NSStringFromCGSize(v14);
  [(CKMessageEntryTextView *)self contentOffset];
  uint64_t v9 = NSStringFromCGPoint(v15);
  [(CKMessageEntryTextView *)self adjustedContentInset];
  long long v10 = NSStringFromUIEdgeInsets(v17);
  long long v11 = [v3 stringWithFormat:@"<%@: %p> {frame: %@, text length: %lu, contentSize: %@, contentOffset: %@, adjustedContentInset: %@", v4, self, v5, v7, v8, v9, v10];

  return (NSString *)v11;
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)CKMessageEntryTextView;
  [(EMKTextView *)&v8 layoutSubviews];
  char v3 = +[CKUIBehavior sharedBehaviors];
  int v4 = [v3 isAccessibilityPreferredContentSizeCategory];

  if (v4)
  {
    id v5 = [(CKMessageEntryTextView *)self _placeholderLabel];
    [v5 setAdjustsFontSizeToFitWidth:1];

    uint64_t v6 = [(CKMessageEntryTextView *)self _placeholderLabel];
    [v6 setBaselineAdjustment:1];

    uint64_t v7 = [(CKMessageEntryTextView *)self _placeholderLabel];
    [v7 setMinimumScaleFactor:0.01];
  }
}

- (CKMessageEntryTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  v20.receiver = self;
  v20.super_class = (Class)CKMessageEntryTextView;
  int v4 = -[EMKTextView initWithFrame:textContainer:](&v20, sel_initWithFrame_textContainer_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v4 selector:sel_textViewDidChange_ name:*MEMORY[0x1E4F43E98] object:v4];
    [v5 addObserver:v4 selector:sel_keyboardWillShow_ name:*MEMORY[0x1E4F43B88] object:v4];
    uint64_t v6 = [(CKMessageEntryTextView *)v4 textContainer];
    uint64_t v7 = +[CKUIBehavior sharedBehaviors];
    [v7 balloonLineFragmentPadding];
    objc_msgSend(v6, "setLineFragmentPadding:");

    objc_super v8 = +[CKUIBehavior sharedBehaviors];
    [v8 entryViewVerticalTextFieldInsets];
    -[CKMessageEntryTextView setTextContainerInset:](v4, "setTextContainerInset:");

    [(CKMessageEntryTextView *)v4 setBackgroundColor:0];
    [(CKMessageEntryTextView *)v4 setOpaque:0];
    [(CKMessageEntryTextView *)v4 setScrollEnabled:0];
    uint64_t v9 = +[CKUIBehavior sharedBehaviors];
    long long v10 = [v9 theme];
    long long v11 = [v10 entryFieldGrayColor];
    [(CKMessageEntryTextView *)v4 setPlaceholderColor:v11];

    long long v12 = [(CKMessageEntryTextView *)v4 _placeholderLabel];
    [v12 setNumberOfLines:1];

    [(CKMessageEntryTextView *)v4 setupScribbleInteraction];
    v4->_supportsBigEmojiTextStyles = 1;
    [(CKMessageEntryTextView *)v4 _setupTapOrLongPressGestureRecognizers];
    long long v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v14 = *MEMORY[0x1E4F43E60];
    [v13 addObserver:v4 selector:sel__localeChanged name:*MEMORY[0x1E4F43E60] object:0];

    CGPoint v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v4 selector:sel_updateMentionAssociationsForInputModeChange_ name:v14 object:0];

    [(CKMessageEntryTextView *)v4 _localeChanged];
    CGRect v16 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    LOBYTE(v14) = [v16 isTextKit2Enabled];

    if ((v14 & 1) == 0)
    {
      UIEdgeInsets v17 = [(CKMessageEntryTextView *)v4 layoutManager];
      [v17 setMentionsDelegate:v4];
    }
    id v18 = [[CKEntryRichTextViewEffectsPickerAssistant alloc] initWithTextView:v4];
    [(CKMessageEntryTextView *)v4 setEffectsPickerAssistant:v18];

    [(CKMessageEntryTextView *)v4 _updatedAllowedTypingAttributesWithKeys:MEMORY[0x1E4F1CBF0]];
  }
  return v4;
}

- (id)initUsingTextLayoutManagerWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)CKMessageEntryTextView;
  id v8 = -[EMKTextView initUsingTextLayoutManagerWithFrame:textContainer:](&v11, sel_initUsingTextLayoutManagerWithFrame_textContainer_, a4);
  uint64_t v9 = v8;
  if (v8) {
    objc_msgSend(v8, "setupTextViewFromInitWithTextLayoutManagerWithFrame:", x, y, width, height);
  }
  return v9;
}

- (void)_localeChanged
{
  id v2 = [(CKMessageEntryTextView *)self mentionsDelegate];
  [v2 localeChanged];
}

- (void)setMentionsDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mentionsDelegate);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_mentionsDelegate, obj);
    [(CKMessageEntryTextView *)self _localeChanged];
    id v5 = obj;
  }
}

- (CGRect)caretRectForPosition:(id)a3
{
  id v4 = a3;
  if (*(_WORD *)&self->_hideCaret)
  {
    double v10 = *MEMORY[0x1E4F1DB28];
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)CKMessageEntryTextView;
    [(CKMessageEntryTextView *)&v17 caretRectForPosition:v4];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
  }

  double v5 = v10;
  double v6 = v12;
  double v7 = v14;
  double v8 = v16;
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.double y = v6;
  result.origin.double x = v5;
  return result;
}

- (void)setFontType:(unint64_t)a3
{
  if (self->_fontType != a3)
  {
    self->_fontType = a3;
    [(CKMessageEntryTextView *)self _updateAttributedPlaceholder];
    objc_msgSend(MEMORY[0x1E4FB08E0], "ck_fontWithMessageEntryTextViewFontType:", self->_fontType);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(CKMessageEntryTextView *)self _updateTextContainerInsetUsingFont:v4];
  }
}

- (void)setAttributedText:(id)a3
{
}

- (void)setAttributedText:(id)a3 checkForMentions:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v6 = (unint64_t)a3;
  uint64_t v7 = [(CKMessageEntryTextView *)self attributedText];
  if (v6 | v7)
  {
    double v8 = (void *)v7;
    double v9 = [(CKMessageEntryTextView *)self attributedText];
    char v10 = [v9 isEqualToAttributedString:v6];

    if ((v10 & 1) == 0)
    {
      double v11 = [(CKMessageEntryTextView *)self mentionsDelegate];
      [v11 didSetAttributedTextOfTextView];

      double v12 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
      int v13 = [v12 isExpressiveTextEnabled];

      if (v13)
      {
        double v14 = (void *)[(id)v6 mutableCopy];
        if (self->_supportsBigEmojiTextStyles)
        {
          double v15 = +[CKUIBehavior sharedBehaviors];
          uint64_t v16 = [v15 entryViewSupportsSingleBigEmojiFont];
          objc_super v17 = [(CKMessageEntryTextView *)self mediaObjects];
          id v18 = [v17 allValues];
          objc_msgSend(v14, "ck_adjustFontsForBigEmojisIfNeededWithSingleBigEmojiSupported:mediaObjects:", v16, v18);
        }
        v21.receiver = self;
        v21.super_class = (Class)CKMessageEntryTextView;
        [(CKMessageEntryTextView *)&v21 setAttributedText:v14];
      }
      else
      {
        v20.receiver = self;
        v20.super_class = (Class)CKMessageEntryTextView;
        [(CKMessageEntryTextView *)&v20 setAttributedText:v6];
      }
      [(CKMessageEntryTextView *)self updateTextViewAndCheckForMentions:v4];
      double v19 = [(CKMessageEntryTextView *)self delegate];
      [v19 textViewDidChange:self];
    }
  }
}

- (void)handleTapOrLongPress:(id)a3
{
  id v4 = a3;
  double v5 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v6 = [v5 isExpressiveTextEnabled];

  if (v6)
  {
    [(CKMessageEntryTextView *)self hideTextEffectsPickerIfNeeded];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) == 0 || [v4 state] == 3)
    {
      if ([(CKMessageEntryTextView *)self hideCaret])
      {
        [(CKMessageEntryTextView *)self setAllowCalloutActions:0];
        dispatch_time_t v8 = dispatch_time(0, 500000000);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __47__CKMessageEntryTextView_handleTapOrLongPress___block_invoke;
        block[3] = &unk_1E5620C40;
        block[4] = self;
        dispatch_after(v8, MEMORY[0x1E4F14428], block);
      }
      double v9 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
      int v10 = [v9 isTextKit2Enabled];

      if (v10)
      {
        [v4 locationInView:self];
        double v12 = v11;
        double v14 = v13;
        double v15 = [(CKMessageEntryTextView *)self textLayoutManager];
        uint64_t v16 = [v15 documentRange];
        [v15 ensureLayoutForRange:v16];
        objc_super v17 = [v16 location];
        id v18 = objc_msgSend(v15, "lineFragmentRangeForPoint:inContainerAtLocation:", v17, v12, v14);

        if (v18)
        {
          uint64_t v43 = 0;
          uint64_t v44 = &v43;
          uint64_t v45 = 0x3032000000;
          v46 = __Block_byref_object_copy__58;
          v47 = __Block_byref_object_dispose__58;
          id v48 = 0;
          uint64_t v37 = 0;
          uint64_t v38 = (double *)&v37;
          uint64_t v39 = 0x4010000000;
          uint64_t v40 = "";
          long long v19 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
          long long v41 = *MEMORY[0x1E4F1DB28];
          long long v42 = v19;
          objc_super v20 = [v18 location];
          v31[0] = MEMORY[0x1E4F143A8];
          v31[1] = 3221225472;
          v31[2] = __47__CKMessageEntryTextView_handleTapOrLongPress___block_invoke_152;
          v31[3] = &unk_1E562ACE0;
          id v21 = v15;
          double v35 = v12;
          double v36 = v14;
          id v32 = v21;
          uint64_t v33 = &v43;
          uint64_t v34 = &v37;
          [v21 enumerateSubstringsFromLocation:v20 options:2 usingBlock:v31];

          if (v44[5])
          {
            uint64_t v22 = [v16 location];
            uint64_t v23 = [(id)v44[5] location];
            uint64_t v24 = [v21 offsetFromLocation:v22 toLocation:v23];

            uint64_t v25 = [(CKMessageEntryTextView *)self attributedText];
            uint64_t v26 = [v25 attribute:@"CKFileTransferGUIDAttributeName" atIndex:v24 effectiveRange:0];

            if (-[CKMessageEntryTextView handleTapOrLongPressOnMediaObjectForTransferGUID:characterIndex:location:touchedCharacterFrame:](self, "handleTapOrLongPressOnMediaObjectForTransferGUID:characterIndex:location:touchedCharacterFrame:", v26, v24, v12, v14, v38[4], v38[5], v38[6], v38[7]))
            {
              if (IMOSLoggingEnabled())
              {
                uint64_t v27 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)uint64_t v30 = 0;
                  _os_log_impl(&dword_18EF18000, v27, OS_LOG_TYPE_INFO, "handleTapOrLongPress didProcessMediaObject", v30, 2u);
                }
              }
            }
            else
            {
              uint64_t v28 = [(CKMessageEntryTextView *)self attributedText];
              uint64_t v29 = [v28 attribute:*MEMORY[0x1E4F6D508] atIndex:v24 effectiveRange:0];

              if (v29) {
                [(CKMessageEntryTextView *)self didTapMentionForTextView:self atCharacterIndex:(double)v24];
              }
            }
            if (+[CKMentionsUtilities supportsSupplementalLexiconMentions])
            {
              [(CKMessageEntryTextView *)self didLongPressMentionForTextView:self characterIndex:v24 isLongPress:isKindOfClass & 1];
            }
          }
          _Block_object_dispose(&v37, 8);
          _Block_object_dispose(&v43, 8);
        }
      }
    }
  }
}

uint64_t __47__CKMessageEntryTextView_handleTapOrLongPress___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAllowCalloutActions:1];
}

uint64_t __47__CKMessageEntryTextView_handleTapOrLongPress___block_invoke_152(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, BOOL *a5)
{
  uint64_t v7 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__CKMessageEntryTextView_handleTapOrLongPress___block_invoke_2;
  v10[3] = &unk_1E562ACB8;
  long long v8 = *(_OWORD *)(a1 + 56);
  long long v11 = *(_OWORD *)(a1 + 40);
  long long v12 = v8;
  uint64_t result = [v7 enumerateTextSegmentsInRange:a3 type:0 options:0 usingBlock:v10];
  *a5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
  return result;
}

BOOL __47__CKMessageEntryTextView_handleTapOrLongPress___block_invoke_2(uint64_t a1, void *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  id v12 = a2;
  v16.origin.double x = a3;
  v16.origin.double y = a4;
  v16.size.double width = a5;
  v16.size.double height = a6;
  BOOL v13 = CGRectContainsPoint(v16, *(CGPoint *)(a1 + 48));
  if (v13)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    double v14 = *(double **)(*(void *)(a1 + 40) + 8);
    v14[4] = a3;
    v14[5] = a4;
    v14[6] = a5;
    v14[7] = a6;
  }

  return !v13;
}

- (void)replaceRange:(id)a3 withAttributedText:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v9 = [v8 isExpressiveTextEnabled];

  if (v9)
  {
    if (IMOSLoggingEnabled())
    {
      int v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v18 = 0;
        _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "User accepted a suggested effect.", v18, 2u);
      }
    }
    long long v11 = [(CKMessageEntryTextView *)self beginningOfDocument];
    id v12 = [v6 start];
    uint64_t v13 = [(CKMessageEntryTextView *)self offsetFromPosition:v11 toPosition:v12];

    double v14 = [v6 start];
    double v15 = [v6 end];
    uint64_t v16 = [(CKMessageEntryTextView *)self offsetFromPosition:v14 toPosition:v15];

    objc_super v17 = [(CKMessageEntryTextView *)self textFormattingDelegate];
    objc_msgSend(v17, "messageEntryTextView:replaceRange:withAttributedText:", self, v13, v16, v7);
  }
}

- (BOOL)handleTapOrLongPressOnMediaObjectForTransferGUID:(id)a3 characterIndex:(int64_t)a4 location:(CGPoint)a5 touchedCharacterFrame:(CGRect)a6
{
  return 0;
}

+ (BOOL)shouldUseModernMentionsAndEmojiAnimations
{
  id v2 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v3 = [v2 isModernMentionsAndEmojiAnimationsEnabled];

  return v3 && NSClassFromString(&cfstr_Emkrippleanima.isa) != 0;
}

- (id)insertDictationResultPlaceholder
{
  [(CKMessageEntryTextView *)self setShowingDictationPlaceholder:1];
  [(CKMessageEntryTextView *)self updateTextView];
  v5.receiver = self;
  v5.super_class = (Class)CKMessageEntryTextView;
  int v3 = [(CKMessageEntryTextView *)&v5 insertDictationResultPlaceholder];

  return v3;
}

- (void)removeDictationResultPlaceholder:(id)a3 willInsertResult:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(CKMessageEntryTextView *)self setShowingDictationPlaceholder:0];
  v7.receiver = self;
  v7.super_class = (Class)CKMessageEntryTextView;
  [(CKMessageEntryTextView *)&v7 removeDictationResultPlaceholder:v6 willInsertResult:v4];

  [(CKMessageEntryTextView *)self updateTextView];
}

- (SEL)_sendCurrentLocationAction
{
  if (self->_sendCurrentLocationFromKeyboardEnabled) {
    return sel_sendCurrentLocationMessage;
  }
  else {
    return 0;
  }
}

- (void)setCompositionText:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(CKMessageEntryTextView *)self undoManager];
  [v5 removeAllActions];

  id v8 = (id)[v4 mutableCopy];
  id v6 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  LODWORD(v5) = [v6 isExpressiveTextEnabled];

  if (!v5 || ![(CKMessageEntryTextView *)self isExpressiveTextEnabled])
  {
    objc_super v7 = [(CKMessageEntryTextView *)self typingAttributes];
    objc_msgSend(v8, "addAttributes:range:", v7, 0, objc_msgSend(v8, "length"));
  }
  [(CKMessageEntryTextView *)self setAttributedText:v8];
}

- (NSAttributedString)compositionText
{
  int v3 = [(CKMessageEntryTextView *)self attributedText];
  id v4 = (void *)[v3 mutableCopy];
  uint64_t v5 = [v4 length];
  objc_msgSend(v4, "setAttributes:range:", 0, 0, v5);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __41__CKMessageEntryTextView_compositionText__block_invoke;
  v17[3] = &unk_1E5626238;
  id v6 = v4;
  id v18 = v6;
  objc_msgSend(v3, "enumerateAttributesInRange:options:usingBlock:", 0, v5, 0, v17);
  objc_super v7 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v8 = [v7 isExpressiveTextEnabled];

  if (v8)
  {
    objc_msgSend(v6, "ck_addAttribute:from:range:", *MEMORY[0x1E4F6E400], v3, 0, v5);
    objc_msgSend(v6, "ck_addAttribute:from:range:", *MEMORY[0x1E4F6E3F8], v3, 0, v5);
    objc_msgSend(v6, "ck_addAttribute:from:range:", *MEMORY[0x1E4F6E408], v3, 0, v5);
    objc_msgSend(v6, "ck_addAttribute:from:range:", *MEMORY[0x1E4F6E420], v3, 0, v5);
    objc_msgSend(v6, "ck_addAttribute:from:range:", *MEMORY[0x1E4F6E410], v3, 0, v5);
  }
  if ([(CKMessageEntryTextView *)self shouldPreserveAdaptiveImageGlyphsInCompositionText])
  {
    int v9 = [MEMORY[0x1E4F6BCC8] sharedInstance];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __41__CKMessageEntryTextView_compositionText__block_invoke_2;
    aBlock[3] = &unk_1E5621100;
    id v16 = v9;
    id v10 = v9;
    long long v11 = _Block_copy(aBlock);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __41__CKMessageEntryTextView_compositionText__block_invoke_3;
    v13[3] = &unk_1E562AD08;
    id v14 = v6;
    objc_msgSend(v3, "__im_enumerateAdaptiveImageGlyphFileTransfersUsingFileTransferProvider:block:", v11, v13);
  }

  return (NSAttributedString *)v6;
}

void __41__CKMessageEntryTextView_compositionText__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = *MEMORY[0x1E4F6D538];
  uint64_t v8 = [a2 objectForKey:*MEMORY[0x1E4F6D538]];
  int v9 = (void *)v8;
  if (v8)
  {
    id v10 = *(void **)(a1 + 32);
    uint64_t v12 = v7;
    v13[0] = v8;
    long long v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    objc_msgSend(v10, "setAttributes:range:", v11, a3, a4);
  }
}

uint64_t __41__CKMessageEntryTextView_compositionText__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) transferForGUID:a2];
}

void __41__CKMessageEntryTextView_compositionText__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = [a2 guid];
  if (v7)
  {
    uint64_t v8 = v7;
    objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *MEMORY[0x1E4F6C188], v7, a3, a4);
    uint64_t v7 = v8;
  }
}

- (BOOL)shouldPreserveAdaptiveImageGlyphsInCompositionText
{
  return 0;
}

- (NSString)placeholderText
{
  id v2 = (void *)[(NSString *)self->_placeholderText copy];

  return (NSString *)v2;
}

- (void)_layoutPlaceholder
{
  v17.receiver = self;
  v17.super_class = (Class)CKMessageEntryTextView;
  [(CKMessageEntryTextView *)&v17 _layoutPlaceholder];
  [(CKMessageEntryTextView *)self bounds];
  [(CKMessageEntryTextView *)self placeHolderWidth];
  double v4 = v3;
  uint64_t v5 = [(CKMessageEntryTextView *)self _placeholderLabel];
  [(CKMessageEntryTextView *)self bounds];
  objc_msgSend(v5, "sizeThatFits:", v6, v7);
  double v9 = v8;

  id v10 = [(CKMessageEntryTextView *)self textContainer];
  [v10 lineFragmentPadding];
  double v12 = v11;

  if ([(CKMessageEntryTextView *)self effectiveUserInterfaceLayoutDirection] == 1) {
    double v13 = -v12;
  }
  else {
    double v13 = v12;
  }
  [(CKMessageEntryTextView *)self textContainerInset];
  double v15 = v14;
  if (CKIsRunningInMacCatalyst()) {
    double v13 = v13 + 2.0;
  }
  id v16 = [(CKMessageEntryTextView *)self _placeholderLabel];
  objc_msgSend(v16, "setFrame:", v13, v15, v4, v9);
}

- (void)setPlaceHolderWidth:(double)a3
{
  if (!CKFloatApproximatelyEqualToFloatWithTolerance(self->_placeHolderWidth, a3, 0.00000999999975))
  {
    self->_placeHolderWidth = a3;
    [(CKMessageEntryTextView *)self setNeedsLayout];
  }
}

- (BOOL)isSingleLine
{
  double v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isTextKit2Enabled];

  if (v4)
  {
    uint64_t v16 = 0;
    objc_super v17 = &v16;
    uint64_t v18 = 0x2020000000;
    uint64_t v19 = 0;
    uint64_t v5 = [(CKMessageEntryTextView *)self textLayoutManager];
    double v6 = [(CKMessageEntryTextView *)self textLayoutManager];
    double v7 = [v6 documentRange];
    double v8 = [v7 location];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __38__CKMessageEntryTextView_isSingleLine__block_invoke;
    v15[3] = &unk_1E5621AA8;
    v15[4] = &v16;
    id v9 = (id)[v5 enumerateTextLayoutFragmentsFromLocation:v8 options:4 usingBlock:v15];

    BOOL v10 = v17[3] == 1;
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    double v11 = [(CKMessageEntryTextView *)self layoutManager];
    uint64_t v12 = [v11 numberOfGlyphs];
    if (v12)
    {
      double v13 = (uint64_t *)v12;
      uint64_t v16 = 0;
      objc_super v17 = 0;
      [v11 lineFragmentUsedRectForGlyphAtIndex:v12 - 1 effectiveRange:&v16];
      BOOL v10 = v17 == v13;
    }
    else
    {
      BOOL v10 = 1;
    }
  }
  return v10;
}

BOOL __38__CKMessageEntryTextView_isSingleLine__block_invoke(uint64_t a1, void *a2)
{
  double v3 = [a2 textLineFragments];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += [v3 count];

  return *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) < 2uLL;
}

- (BOOL)shouldIncludeDictationPadding
{
  uint64_t v10 = 0;
  double v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  double v3 = [(CKMessageEntryTextView *)self textLayoutManager];
  int v4 = [(CKMessageEntryTextView *)self textLayoutManager];
  uint64_t v5 = [v4 documentRange];
  double v6 = [v5 location];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__CKMessageEntryTextView_shouldIncludeDictationPadding__block_invoke;
  v9[3] = &unk_1E5621AA8;
  v9[4] = &v10;
  id v7 = (id)[v3 enumerateTextLayoutFragmentsFromLocation:v6 options:12 usingBlock:v9];

  LOBYTE(v3) = (unint64_t)v11[3] > 1;
  _Block_object_dispose(&v10, 8);
  return (char)v3;
}

BOOL __55__CKMessageEntryTextView_shouldIncludeDictationPadding__block_invoke(uint64_t a1, void *a2)
{
  double v3 = [a2 textLineFragments];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += [v3 count];

  return *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) < 3uLL;
}

- (void)updateFontIfNeededAndGetWasUsingBigEmojiStyle:(int64_t *)a3
{
  uint64_t v5 = +[CKUIBehavior sharedBehaviors];
  uint64_t v45 = [v5 singleBigEmojiFont];
  double v6 = [v5 singleBigAssetFont];
  id v7 = [v5 multipleBigEmojiFont];
  uint64_t v44 = [v5 balloonTextFont];
  if (self->_supportsBigEmojiTextStyles)
  {
    uint64_t v8 = [v5 entryViewSupportsSingleBigEmojiFont];
    id v9 = [(CKMessageEntryTextView *)self attributedText];
    uint64_t v10 = [(CKMessageEntryTextView *)self mediaObjects];
    [v10 allValues];
    v12 = double v11 = a3;
    uint64_t v13 = objc_msgSend(v9, "__ck_bigEmojiStyleWithSingleBigEmojiSupported:mediaObjects:", v8, v12);

    a3 = v11;
  }
  else
  {
    uint64_t v13 = 0;
  }
  double v14 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v15 = [v14 isExpressiveTextEnabled];

  if (v15)
  {
    unint64_t v16 = [(CKMessageEntryTextView *)self fontType];
    if ((unint64_t)(v13 - 1) >= 3) {
      uint64_t v13 = 0;
    }
    [(CKMessageEntryTextView *)self setFontType:v13];
    objc_super v17 = [(CKMessageEntryTextView *)self attributedText];
    uint64_t v18 = [v17 length];

    if (!v18)
    {
      long long v42 = objc_msgSend(MEMORY[0x1E4FB08E0], "ck_fontWithMessageEntryTextViewFontType:", -[CKMessageEntryTextView fontType](self, "fontType"));
      [(CKMessageEntryTextView *)self setFont:v42];
      uint64_t v19 = [(CKMessageEntryTextView *)self effectsPickerAssistant];
      [v19 removeTypingAttributesAdjustments];

      objc_super v20 = [(CKMessageEntryTextView *)self typingAttributes];
      id v21 = (void *)[v20 mutableCopy];

      [v21 setObject:v42 forKeyedSubscript:*MEMORY[0x1E4FB06F8]];
      uint64_t v22 = [v5 theme];
      [v22 entryFieldTextColor];
      uint64_t v23 = a3;
      uint64_t v24 = v7;
      unint64_t v25 = v16;
      v27 = uint64_t v26 = v6;
      [v21 setObject:v27 forKeyedSubscript:*MEMORY[0x1E4FB0700]];

      double v6 = v26;
      unint64_t v16 = v25;
      id v7 = v24;
      a3 = v23;

      [v21 removeObjectForKey:*MEMORY[0x1E4F6E400]];
      [(CKMessageEntryTextView *)self setTypingAttributes:v21];
    }
    if (a3 && v16 != v13)
    {
      switch(v16)
      {
        case 0uLL:
          *a3 = 0;
          break;
        case 1uLL:
          int64_t v40 = 1;
          goto LABEL_37;
        case 2uLL:
          int64_t v40 = 2;
          goto LABEL_37;
        case 3uLL:
          int64_t v40 = 3;
LABEL_37:
          *a3 = v40;
          break;
        default:
          break;
      }
    }
  }
  else
  {
    id v28 = [(CKMessageEntryTextView *)self font];
    uint64_t v29 = v45;
    switch(v13)
    {
      case 0:
        uint64_t v29 = v44;
        goto LABEL_19;
      case 1:
        goto LABEL_19;
      case 2:
        uint64_t v29 = v7;
        goto LABEL_19;
      case 3:
        uint64_t v29 = v6;
LABEL_19:
        id v30 = v29;
        if (a3) {
          goto LABEL_20;
        }
        goto LABEL_28;
      default:
        id v30 = 0;
        if (!a3) {
          goto LABEL_28;
        }
LABEL_20:
        if (v28 != v30)
        {
          if ([v28 isEqual:v45])
          {
            int64_t v31 = 1;
          }
          else if ([v28 isEqual:v6])
          {
            int64_t v31 = 3;
          }
          else
          {
            int v32 = [v28 isEqual:v7];
            int64_t v31 = 2;
            if (!v32) {
              int64_t v31 = 0;
            }
          }
          *a3 = v31;
        }
LABEL_28:
        uint64_t v43 = v6;
        uint64_t v33 = [(CKMessageEntryTextView *)self attributedText];
        uint64_t v34 = [v33 length];

        if (v34)
        {
          long long v41 = v7;
          uint64_t v52 = 0;
          v53 = &v52;
          uint64_t v54 = 0x2020000000;
          char v55 = 0;
          double v35 = [(CKMessageEntryTextView *)self attributedText];
          double v36 = [(CKMessageEntryTextView *)self attributedText];
          uint64_t v37 = [v36 length];
          uint64_t v38 = *MEMORY[0x1E4FB06F8];
          v46[0] = MEMORY[0x1E4F143A8];
          v46[1] = 3221225472;
          v46[2] = __72__CKMessageEntryTextView_updateFontIfNeededAndGetWasUsingBigEmojiStyle___block_invoke;
          v46[3] = &unk_1E562AD30;
          id v47 = v45;
          id v48 = v41;
          id v49 = v44;
          v51 = &v52;
          id v39 = v30;
          id v50 = v39;
          objc_msgSend(v35, "enumerateAttribute:inRange:options:usingBlock:", v38, 0, v37, 0, v46);

          if (*((unsigned char *)v53 + 24)) {
            [(CKMessageEntryTextView *)self setFont:v39];
          }

          _Block_object_dispose(&v52, 8);
          id v7 = v41;
        }
        else
        {
          [(CKMessageEntryTextView *)self setFont:v30];
        }

        double v6 = v43;
        break;
    }
  }
}

void __72__CKMessageEntryTextView_updateFontIfNeededAndGetWasUsingBigEmojiStyle___block_invoke(void *a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v7 = a2;
  if (v7)
  {
    uint64_t v10 = v7;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v7 = v10;
    if (isKindOfClass)
    {
      id v9 = v10;
      if (([v9 isEqual:a1[4]] & 1) != 0
        || ([v9 isEqual:a1[5]] & 1) != 0
        || [v9 isEqual:a1[6]])
      {
        *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = [v9 isEqual:a1[7]] ^ 1;
        *a5 = *(unsigned char *)(*(void *)(a1[8] + 8) + 24);
      }

      id v7 = v10;
    }
  }
}

- (id)mediaObjects
{
  return 0;
}

- (void)saveKeyboardInputMode
{
  id v4 = [MEMORY[0x1E4F42B30] sharedInputModeController];
  double v3 = [v4 currentInputMode];
  [(CKMessageEntryTextView *)self setSavedKeyboardInputMode:v3];
}

- (void)restoreKeyboardInputMode
{
  id v4 = [(CKMessageEntryTextView *)self savedKeyboardInputMode];
  if (v4)
  {
    double v3 = [MEMORY[0x1E4F42B30] sharedInputModeController];
    [v3 setCurrentInputMode:v4];

    [(CKMessageEntryTextView *)self setSavedKeyboardInputMode:0];
  }
}

- (void)setShouldStripEmojis:(BOOL)a3
{
  if (self->_shouldStripEmojis != a3) {
    self->_shouldStripEmojis = a3;
  }
}

- (void)setExpressiveTextEnabled:(BOOL)a3
{
  if (self->_expressiveTextEnabled != a3)
  {
    uint64_t v5 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    char v6 = [v5 isExpressiveTextEnabled];

    if (v6)
    {
      self->_expressiveTextEnabled = a3;
      [(CKMessageEntryTextView *)self _updateTextEffectsPickerEditMenuAction];
    }
    else
    {
      self->_expressiveTextEnabled = 0;
    }
  }
}

- (void)_updateTextEffectsPickerEditMenuAction
{
  v16[6] = *MEMORY[0x1E4F143B8];
  BOOL expressiveTextEnabled = self->_expressiveTextEnabled;
  if (self->_expressiveTextEnabled
    && ([MEMORY[0x1E4F6E778] sharedFeatureFlags],
        id v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 isSendingExpressiveTextEnabled],
        v4,
        v5))
  {
    uint64_t v6 = *MEMORY[0x1E4F6E400];
    v16[0] = *MEMORY[0x1E4FB0788];
    v16[1] = v6;
    uint64_t v7 = *MEMORY[0x1E4F6E408];
    v16[2] = *MEMORY[0x1E4F6E3F8];
    v16[3] = v7;
    uint64_t v8 = *MEMORY[0x1E4F6E410];
    v16[4] = *MEMORY[0x1E4F6E420];
    v16[5] = v8;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:6];
    [(CKMessageEntryTextView *)self _updatedAllowedTypingAttributesWithKeys:v9];

    if (objc_opt_respondsToSelector())
    {
      uint64_t v10 = [MEMORY[0x1E4F42A80] _systemImageNamed:@"character.motion"];
      if ([MEMORY[0x1E4F42B08] isInHardwareKeyboardMode])
      {
        double v11 = CKFrameworkBundle();
        uint64_t v12 = [v11 localizedStringForKey:@"TEXT_EFFECTS" value:&stru_1EDE4CA38 table:@"ChatKit"];
      }
      else
      {
        uint64_t v12 = &stru_1EDE4CA38;
      }
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __64__CKMessageEntryTextView__updateTextEffectsPickerEditMenuAction__block_invoke;
      v15[3] = &unk_1E56211C8;
      v15[4] = self;
      uint64_t v13 = [MEMORY[0x1E4F426E8] actionWithTitle:v12 image:v10 identifier:0 handler:v15];
    }
    else
    {
      uint64_t v13 = 0;
    }
    BOOL v14 = 1;
  }
  else
  {
    [(CKMessageEntryTextView *)self _updatedAllowedTypingAttributesWithKeys:MEMORY[0x1E4F1CBF0]];
    uint64_t v13 = 0;
    BOOL v14 = expressiveTextEnabled;
  }
  [(CKMessageEntryTextView *)self setAllowsTextAnimations:v14];
  [(CKMessageEntryTextView *)self setShowTextEffectsPickerEditMenuAction:v13];
}

uint64_t __64__CKMessageEntryTextView__updateTextEffectsPickerEditMenuAction__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showTextFormattingAnimationOptions:0];
}

- (void)scribbleInteractionWillBeginWriting:(id)a3
{
  [(CKMessageEntryTextView *)self setPencilWriting:1];
  [(CKMessageEntryTextView *)self setInPencilMode:1];

  [(CKMessageEntryTextView *)self updateTextView];
}

- (void)scribbleInteractionDidFinishWriting:(id)a3
{
  [(CKMessageEntryTextView *)self setPencilWriting:0];
  [(CKMessageEntryTextView *)self setInPencilMode:1];

  [(CKMessageEntryTextView *)self updateTextView];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v17.receiver = self;
  v17.super_class = (Class)CKMessageEntryTextView;
  -[CKMessageEntryTextView sizeThatFits:](&v17, sel_sizeThatFits_, a3.width, a3.height);
  double v5 = v4;
  double v7 = v6;
  if ([(CKMessageEntryTextView *)self isInPencilMode])
  {
    [MEMORY[0x1E4F42DA0] _recommendedBlankSpaceHeight];
    double v7 = v7 + v8;
  }
  else if ([MEMORY[0x1E4F42950] isRunning] {
         && [(CKMessageEntryTextView *)self shouldIncludeDictationPadding])
  }
  {
    id v9 = [(CKMessageEntryTextView *)self font];
    [v9 pointSize];
    double v7 = v7 + v10 * 0.65;
  }
  double v11 = [(CKMessageEntryTextView *)self traitCollection];
  [v11 displayScale];
  double v13 = v12;

  if (v13 == 0.0)
  {
    if (CKMainScreenScale_once_86 != -1) {
      dispatch_once(&CKMainScreenScale_once_86, &__block_literal_global_211);
    }
    double v14 = *(double *)&CKMainScreenScale_sMainScreenScale_86;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_86 == 0.0) {
      double v14 = 1.0;
    }
    double v15 = ceil(v5 * v14) / v14;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_86 == 0.0) {
      double v13 = 1.0;
    }
    else {
      double v13 = *(double *)&CKMainScreenScale_sMainScreenScale_86;
    }
  }
  else
  {
    double v15 = ceil(v5 * v13) / v13;
  }
  double v16 = ceil(v7 * v13) / v13;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (void)handleHoverGesture:(id)a3
{
  if ([a3 state] == 1)
  {
    [(CKMessageEntryTextView *)self setInPencilMode:1];
    [(CKMessageEntryTextView *)self updateTextView];
    id v4 = [(CKMessageEntryTextView *)self delegate];
    [v4 textViewDidChange:self];
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)_stripEmojisIfNecessary
{
  double v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 stewieEnabled];

  if (v4 && [(CKMessageEntryTextView *)self shouldStripEmojis])
  {
    double v5 = [(CKMessageEntryTextView *)self attributedText];
    id v12 = (id)[v5 mutableCopy];

    double v6 = (uint64_t (*)(uint64_t))MEMORY[0x192FBA870]("CEMCreateStringByStrippingEmojiCharacters", @"CoreEmoji");
    id v7 = (id)v6([v12 string]);
    double v8 = [v12 string];
    char v9 = [v7 isEqualToString:v8];

    if ((v9 & 1) == 0)
    {
      double v10 = [v12 mutableString];
      [v10 setString:v7];

      double v11 = [(CKMessageEntryTextView *)self textStorage];
      [v11 setAttributedString:v12];
    }
  }
}

- (void)updateTextView
{
}

- (void)updateTextViewAndCheckForMentions:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(CKMessageEntryTextView *)self textStorage];
  BOOL v6 = [v5 length]
    || [(CKMessageEntryTextView *)self isShowingDictationPlaceholder]
    || [(CKMessageEntryTextView *)self isPencilWriting];

  id v7 = [(CKMessageEntryTextView *)self _placeholderLabel];
  [v7 setHidden:v6];

  [(CKMessageEntryTextView *)self _stripEmojisIfNecessary];
  double v8 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v9 = [v8 isExpressiveTextEnabled];

  if (v9 && self->_supportsBigEmojiTextStyles)
  {
    double v10 = [(CKMessageEntryTextView *)self textStorage];
    [v10 beginEditing];

    double v11 = +[CKUIBehavior sharedBehaviors];
    uint64_t v12 = [v11 entryViewSupportsSingleBigEmojiFont];
    double v13 = [(CKMessageEntryTextView *)self textStorage];
    double v14 = [(CKMessageEntryTextView *)self mediaObjects];
    double v15 = [v14 allValues];
    objc_msgSend(v13, "ck_adjustFontsForBigEmojisIfNeededWithSingleBigEmojiSupported:mediaObjects:", v12, v15);

    double v16 = [(CKMessageEntryTextView *)self textStorage];
    [v16 endEditing];
  }
  if (v3)
  {
    [(CKMessageEntryTextView *)self checkForMentions];
  }
}

- (void)textViewDidChange:(id)a3
{
  [(CKMessageEntryTextView *)self updateTextViewAndCheckForMentions:0];

  [(CKMessageEntryTextView *)self setHideCaretUntilUserTypes:0];
}

- (void)keyboardWillShow:(id)a3
{
  int v4 = [(CKMessageEntryTextView *)self showTextEffectsPickerEditMenuAction];

  if (v4)
  {
    if ([MEMORY[0x1E4F42B08] isInHardwareKeyboardMode])
    {
      CKFrameworkBundle();
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      double v5 = [v7 localizedStringForKey:@"TEXT_EFFECTS" value:&stru_1EDE4CA38 table:@"ChatKit"];
      BOOL v6 = [(CKMessageEntryTextView *)self showTextEffectsPickerEditMenuAction];
      [v6 setTitle:v5];
    }
    else
    {
      id v7 = [(CKMessageEntryTextView *)self showTextEffectsPickerEditMenuAction];
      [v7 setTitle:&stru_1EDE4CA38];
    }
  }
  else
  {
    [(CKMessageEntryTextView *)self _updateTextEffectsPickerEditMenuAction];
  }
}

- (void)layoutManagerDidFinishAnimatingMentionWithAnimationIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CKMessageEntryTextView *)self mentionsDelegate];
  [v5 didFinishAnimatingMentionWithAnimationIdentifier:v4];
}

- (void)hideTextEffectsPickerIfNeeded
{
  BOOL v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isExpressiveTextEnabled];

  if (v4)
  {
    if (objc_opt_respondsToSelector())
    {
      [(CKMessageEntryTextView *)self performSelector:sel__hideTextFormattingOptions_ withObject:self];
      if ([(CKMessageEntryTextView *)self applyDefaultTypingAttributesOnTextEffectPickerDismissal])
      {
        id v5 = [(CKMessageEntryTextView *)self effectsPickerAssistant];
        [v5 removeTypingAttributesAdjustments];

        [(CKMessageEntryTextView *)self setApplyDefaultTypingAttributesOnTextEffectPickerDismissal:0];
      }
    }
  }
}

- (void)hideTextEffectsPickerIfNeededAndResetTypingAttributes
{
  [(CKMessageEntryTextView *)self hideTextEffectsPickerIfNeeded];
  id v3 = [(CKMessageEntryTextView *)self effectsPickerAssistant];
  [v3 removeTypingAttributesAdjustments];
}

- (void)_showTextFormattingAnimationOptions:(id)a3
{
  id v4 = a3;
  id v5 = [(CKMessageEntryTextView *)self effectsPickerAssistant];
  [v5 selectSentenceAtCaretIfPossible];

  BOOL v6 = [(CKMessageEntryTextView *)self delegate];
  [v6 messageEntryTextViewTextFormattingAnimationsOptionsPresentationInProgress:1];

  v11.receiver = self;
  v11.super_class = (Class)CKMessageEntryTextView;
  [(CKMessageEntryTextView *)&v11 _showTextFormattingAnimationOptions:v4];

  id location = 0;
  objc_initWeak(&location, self);
  dispatch_time_t v7 = dispatch_time(0, 500000000);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__CKMessageEntryTextView__showTextFormattingAnimationOptions___block_invoke;
  v8[3] = &unk_1E56215C8;
  objc_copyWeak(&v9, &location);
  dispatch_after(v7, MEMORY[0x1E4F14428], v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __62__CKMessageEntryTextView__showTextFormattingAnimationOptions___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained delegate];
  [v1 messageEntryTextViewTextFormattingAnimationsOptionsPresentationInProgress:0];
}

- (BOOL)_shouldHandleTextFormattingChangeValue:(id)a3
{
  id v4 = a3;
  id v5 = [v4 changeType];
  [(CKMessageEntryTextView *)self setApplyDefaultTypingAttributesOnTextEffectPickerDismissal:0];
  BOOL v6 = [(CKMessageEntryTextView *)self typingAttributes];
  dispatch_time_t v7 = (void *)[v6 mutableCopy];

  [(CKMessageEntryTextView *)self selectedRange];
  uint64_t v9 = v8;
  [(CKMessageEntryTextView *)self selectedRange];
  uint64_t v11 = v10;
  int v12 = [v5 isEqualToString:@"UITextFormattingViewControllerRemoveUnderlineChange"];
  uint64_t v13 = [v5 isEqualToString:@"UITextFormattingViewControllerSetUnderlineChange"];
  uint64_t v14 = v13;
  if ((v12 & 1) != 0 || v13)
  {
    if (v12)
    {
      [v7 removeObjectForKey:*MEMORY[0x1E4FB0808]];
      [v7 removeObjectForKey:*MEMORY[0x1E4F6E420]];
    }
    if (v14)
    {
      [v7 setObject:&unk_1EDF16BC8 forKey:*MEMORY[0x1E4FB0808]];
      [v7 setObject:&unk_1EDF16BE0 forKey:*MEMORY[0x1E4F6E420]];
      [v7 removeObjectForKey:*MEMORY[0x1E4FB0788]];
      [v7 removeObjectForKey:*MEMORY[0x1E4F6E400]];
    }
    BOOL v24 = v11 != 0;
    unint64_t v25 = [(CKMessageEntryTextView *)self effectsPickerAssistant];
    [v25 setShouldSkipNextAdjustingOfTypingAttributes:v9 == 0];

    [(CKMessageEntryTextView *)self setTypingAttributes:v7];
    uint64_t v26 = [MEMORY[0x1E4F6E890] sharedInstance];
    [(CKMessageEntryTextView *)self selectedRange];
    [v26 trackDidSelectTextStyle:4 styleLength:v27];

    id v28 = [(CKMessageEntryTextView *)self textFormattingDelegate];
    uint64_t v30 = [(CKMessageEntryTextView *)self selectedRange];
    int64_t v31 = v28;
    int v32 = self;
    uint64_t v33 = 4;
    goto LABEL_36;
  }
  uint64_t v14 = [v5 isEqualToString:@"UITextFormattingViewControllerSetStrikethroughChange"];
  int v15 = [v5 isEqualToString:@"UITextFormattingViewControllerRemoveStrikethroughChange"];
  if ((v14 & 1) != 0 || v15)
  {
    if (v15)
    {
      [v7 removeObjectForKey:*MEMORY[0x1E4FB0768]];
      [v7 removeObjectForKey:*MEMORY[0x1E4F6E410]];
    }
    if (v14)
    {
      [v7 setObject:&unk_1EDF16BC8 forKey:*MEMORY[0x1E4FB0768]];
      [v7 setObject:&unk_1EDF16BE0 forKey:*MEMORY[0x1E4F6E410]];
      [v7 removeObjectForKey:*MEMORY[0x1E4FB0788]];
      [v7 removeObjectForKey:*MEMORY[0x1E4F6E400]];
    }
    BOOL v24 = v11 != 0;
    uint64_t v34 = [(CKMessageEntryTextView *)self effectsPickerAssistant];
    [v34 setShouldSkipNextAdjustingOfTypingAttributes:v9 == 0];

    [(CKMessageEntryTextView *)self setTypingAttributes:v7];
    double v35 = [MEMORY[0x1E4F6E890] sharedInstance];
    [(CKMessageEntryTextView *)self selectedRange];
    [v35 trackDidSelectTextStyle:8 styleLength:v36];

    id v28 = [(CKMessageEntryTextView *)self textFormattingDelegate];
    uint64_t v30 = [(CKMessageEntryTextView *)self selectedRange];
    int64_t v31 = v28;
    int v32 = self;
    uint64_t v33 = 8;
    goto LABEL_36;
  }
  uint64_t v14 = [v5 isEqualToString:@"UITextFormattingViewControllerSetBoldChange"];
  int v16 = [v5 isEqualToString:@"UITextFormattingViewControllerRemoveBoldChange"];
  if ((v14 & 1) != 0 || v16)
  {
    if (v16)
    {
      objc_msgSend(v7, "ck_removeTypingAttributeFontTrait:", 2);
      [v7 removeObjectForKey:*MEMORY[0x1E4F6E3F8]];
    }
    if (v14)
    {
      objc_msgSend(v7, "ck_addTypingAttributeFontTrait:", 2);
      [v7 setObject:&unk_1EDF16BE0 forKey:*MEMORY[0x1E4F6E3F8]];
      [v7 removeObjectForKey:*MEMORY[0x1E4FB0788]];
      [v7 removeObjectForKey:*MEMORY[0x1E4F6E400]];
    }
    BOOL v24 = v11 != 0;
    uint64_t v37 = [(CKMessageEntryTextView *)self effectsPickerAssistant];
    [v37 setShouldSkipNextAdjustingOfTypingAttributes:v9 == 0];

    [(CKMessageEntryTextView *)self setTypingAttributes:v7];
    uint64_t v38 = [MEMORY[0x1E4F6E890] sharedInstance];
    [(CKMessageEntryTextView *)self selectedRange];
    [v38 trackDidSelectTextStyle:1 styleLength:v39];

    id v28 = [(CKMessageEntryTextView *)self textFormattingDelegate];
    uint64_t v30 = [(CKMessageEntryTextView *)self selectedRange];
    int64_t v31 = v28;
    int v32 = self;
    uint64_t v33 = 1;
    goto LABEL_36;
  }
  uint64_t v14 = [v5 isEqualToString:@"UITextFormattingViewControllerSetItalicChange"];
  int v17 = [v5 isEqualToString:@"UITextFormattingViewControllerRemoveItalicChange"];
  if ((v14 & 1) != 0 || v17)
  {
    if (v17)
    {
      objc_msgSend(v7, "ck_removeTypingAttributeFontTrait:", 1);
      [v7 removeObjectForKey:*MEMORY[0x1E4F6E408]];
    }
    if (v14)
    {
      objc_msgSend(v7, "ck_addTypingAttributeFontTrait:", 1);
      [v7 setObject:&unk_1EDF16BE0 forKey:*MEMORY[0x1E4F6E408]];
      [v7 removeObjectForKey:*MEMORY[0x1E4FB0788]];
      [v7 removeObjectForKey:*MEMORY[0x1E4F6E400]];
    }
    BOOL v24 = v11 != 0;
    int64_t v40 = [(CKMessageEntryTextView *)self effectsPickerAssistant];
    [v40 setShouldSkipNextAdjustingOfTypingAttributes:v9 == 0];

    [(CKMessageEntryTextView *)self setTypingAttributes:v7];
    long long v41 = [MEMORY[0x1E4F6E890] sharedInstance];
    [(CKMessageEntryTextView *)self selectedRange];
    [v41 trackDidSelectTextStyle:2 styleLength:v42];

    id v28 = [(CKMessageEntryTextView *)self textFormattingDelegate];
    uint64_t v30 = [(CKMessageEntryTextView *)self selectedRange];
    int64_t v31 = v28;
    int v32 = self;
    uint64_t v33 = 2;
LABEL_36:
    objc_msgSend(v31, "messageEntryTextView:applyStyleChangeOfType:add:forRange:", v32, v33, v14, v30, v29);

    [(CKMessageEntryTextView *)self setApplyDefaultTypingAttributesOnTextEffectPickerDismissal:v24];
    BOOL v19 = 0;
    goto LABEL_37;
  }
  if [v5 isEqualToString:@"UITextFormattingViewControllerCustomComponentSelectedChange"]&& (objc_opt_respondsToSelector())
  {
    uint64_t v18 = [v4 performSelector:sel__textAnimationName];
    BOOL v19 = v18 == 0;
    if (v18)
    {
      uint64_t v20 = *MEMORY[0x1E4F6E400];
      id v21 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F6E400]];

      uint64_t v52 = v20;
      if (v21)
      {
        uint64_t v22 = [v7 objectForKeyedSubscript:v20];
        id v21 = (void *)[v22 unsignedIntegerValue];
      }
      uint64_t v23 = IMTextEffectTypeFromName();
      if (v21 == (void *)v23)
      {
        [v7 removeObjectForKey:*MEMORY[0x1E4FB0788]];
        [v7 removeObjectForKey:v52];
      }
      else
      {
        v51 = [MEMORY[0x1E4F43368] animationWithName:v18];
        [v7 setObject:v51 forKey:*MEMORY[0x1E4FB0788]];
        uint64_t v44 = [NSNumber numberWithInteger:v23];
        [v7 setObject:v44 forKey:v52];

        objc_msgSend(v7, "ck_removeTypingAttributeFontTrait:", 2);
        objc_msgSend(v7, "ck_removeTypingAttributeFontTrait:", 1);
        [v7 removeObjectForKey:*MEMORY[0x1E4FB0808]];
        [v7 removeObjectForKey:*MEMORY[0x1E4FB0768]];
        [v7 removeObjectForKey:*MEMORY[0x1E4F6E3F8]];
        [v7 removeObjectForKey:*MEMORY[0x1E4F6E408]];
        [v7 removeObjectForKey:*MEMORY[0x1E4F6E420]];
        [v7 removeObjectForKey:*MEMORY[0x1E4F6E410]];
      }
      uint64_t v45 = [(CKMessageEntryTextView *)self effectsPickerAssistant];
      [v45 setShouldSkipNextAdjustingOfTypingAttributes:v9 == 0];

      [(CKMessageEntryTextView *)self setTypingAttributes:v7];
      v46 = [MEMORY[0x1E4F6E890] sharedInstance];
      [(CKMessageEntryTextView *)self selectedRange];
      [v46 trackDidSelectTextEffect:v23 effectLength:v47];

      id v48 = [(CKMessageEntryTextView *)self textFormattingDelegate];
      uint64_t v49 = [(CKMessageEntryTextView *)self selectedRange];
      objc_msgSend(v48, "messageEntryTextView:didSetAnimationName:forRange:", self, v18, v49, v50);

      [(CKMessageEntryTextView *)self setApplyDefaultTypingAttributesOnTextEffectPickerDismissal:v11 != 0];
    }
  }
  else
  {
    BOOL v19 = 1;
  }
LABEL_37:

  return v19;
}

- (id)_supportedAnimationNamesForTextFormatting
{
  id v2 = IMTextEffectOrderedSupportedNames();
  unint64_t v3 = [v2 count];
  if (v3 >= 8) {
    uint64_t v4 = 8;
  }
  else {
    uint64_t v4 = v3;
  }
  id v5 = objc_msgSend(v2, "subarrayWithRange:", 0, v4);

  return v5;
}

- (id)_supportedAnimationTitlesForTextFormatting
{
  id v2 = [(CKMessageEntryTextView *)self _supportedAnimationNamesForTextFormatting];
  if (v2)
  {
    unint64_t v3 = objc_opt_new();
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __68__CKMessageEntryTextView__supportedAnimationTitlesForTextFormatting__block_invoke;
    v6[3] = &unk_1E56256A8;
    id v4 = v3;
    id v7 = v4;
    [v2 enumerateObjectsUsingBlock:v6];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

void __68__CKMessageEntryTextView__supportedAnimationTitlesForTextFormatting__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  IMTextEffectTypeFromName();
  IMTextEffectLocalizationKeyFromType();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = +[CKUIBehavior sharedBehaviors];
  id v5 = objc_msgSend(v4, "__ck_localizedString:", v6);

  [*(id *)(a1 + 32) setValue:v5 forKey:v3];
}

- (id)_supportedAnimationAccessibilityHintsForTextFormatting
{
  id v2 = [(CKMessageEntryTextView *)self _supportedAnimationNamesForTextFormatting];
  if (v2)
  {
    id v3 = objc_opt_new();
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __80__CKMessageEntryTextView__supportedAnimationAccessibilityHintsForTextFormatting__block_invoke;
    v6[3] = &unk_1E56256A8;
    id v4 = v3;
    id v7 = v4;
    [v2 enumerateObjectsUsingBlock:v6];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

void __80__CKMessageEntryTextView__supportedAnimationAccessibilityHintsForTextFormatting__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  IMTextEffectTypeFromName();
  IMTextEffectDiscoverabilityTitleLocalizationKeyFromType();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = +[CKUIBehavior sharedBehaviors];
  id v5 = objc_msgSend(v4, "__ck_localizedString:", v6);

  [*(id *)(a1 + 32) setValue:v5 forKey:v3];
}

- (BOOL)_shouldReplaceKeyboardForTextFormattingKeyboardSessionIfApplicable
{
  return IMIsRunningInMessagesExtension() ^ 1;
}

- (void)updateTextAttributesWithConversionHandler:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKMessageEntryTextView;
  id v4 = a3;
  [(CKMessageEntryTextView *)&v8 updateTextAttributesWithConversionHandler:v4];
  id v5 = [(CKMessageEntryTextView *)self textFormattingDelegate];
  uint64_t v6 = [(CKMessageEntryTextView *)self selectedRange];
  objc_msgSend(v5, "messageEntryTextView:didUpdateForRange:conversionHandler:", self, v6, v7, v4);

  if (objc_opt_respondsToSelector()) {
    [(CKMessageEntryTextView *)self performSelector:sel__textFormattingOptionsNeedUpdate_ withObject:self];
  }
}

- (UIColor)placeholderColor
{
  return self->_placeholderColor;
}

- (CKMessageEntryTextViewMentionsDelegate)mentionsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mentionsDelegate);

  return (CKMessageEntryTextViewMentionsDelegate *)WeakRetained;
}

- (double)placeHolderWidth
{
  return self->_placeHolderWidth;
}

- (BOOL)isShowingDictationPlaceholder
{
  return self->_showingDictationPlaceholder;
}

- (void)setShowingDictationPlaceholder:(BOOL)a3
{
  self->_showingDictationPlaceholder = a3;
}

- (BOOL)isInPencilMode
{
  return self->_inPencilMode;
}

- (BOOL)isPencilWriting
{
  return self->_pencilWriting;
}

- (void)setPencilWriting:(BOOL)a3
{
  self->_pencilWriting = a3;
}

- (BOOL)shouldStripEmojis
{
  return self->_shouldStripEmojis;
}

- (NSDictionary)proofreadingInfo
{
  return self->_proofreadingInfo;
}

- (void)setProofreadingInfo:(id)a3
{
}

- (BOOL)sendCurrentLocationFromKeyboardEnabled
{
  return self->_sendCurrentLocationFromKeyboardEnabled;
}

- (void)setSendCurrentLocationFromKeyboardEnabled:(BOOL)a3
{
  self->_sendCurrentLocationFromKeyboardEnabled = a3;
}

- (BOOL)supportsBigEmojiTextStyles
{
  return self->_supportsBigEmojiTextStyles;
}

- (BOOL)hideCaret
{
  return self->_hideCaret;
}

- (void)setHideCaret:(BOOL)a3
{
  self->_hideCaret = a3;
}

- (BOOL)hideCaretUntilUserTypes
{
  return self->_hideCaretUntilUserTypes;
}

- (void)setHideCaretUntilUserTypes:(BOOL)a3
{
  self->_hideCaretUntilUserTypes = a3;
}

- (BOOL)preventShowingCalloutMenu
{
  return self->_preventShowingCalloutMenu;
}

- (void)setPreventShowingCalloutMenu:(BOOL)a3
{
  self->_preventShowingCalloutMenu = a3;
}

- (double)adjustedLineFragmentPadding
{
  return self->_adjustedLineFragmentPadding;
}

- (void)setAdjustedLineFragmentPadding:(double)a3
{
  self->_adjustedLineFragmentPadding = a3;
}

- (CKEntryRichTextViewEffectsPickerAssistant)effectsPickerAssistant
{
  return self->_effectsPickerAssistant;
}

- (UIAction)showTextEffectsPickerEditMenuAction
{
  return self->_showTextEffectsPickerEditMenuAction;
}

- (void)setShowTextEffectsPickerEditMenuAction:(id)a3
{
}

- (CKMessageEntryTextViewTextFormattingDelegate)textFormattingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textFormattingDelegate);

  return (CKMessageEntryTextViewTextFormattingDelegate *)WeakRetained;
}

- (void)setTextFormattingDelegate:(id)a3
{
}

- (BOOL)isExpressiveTextEnabled
{
  return self->_expressiveTextEnabled;
}

- (UIKeyboardInputMode)savedKeyboardInputMode
{
  return self->_savedKeyboardInputMode;
}

- (void)setSavedKeyboardInputMode:(id)a3
{
}

- (UIScribbleInteraction)scribbleInteraction
{
  return self->_scribbleInteraction;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (UILongPressGestureRecognizer)longPressGestureRecognizer
{
  return self->_longPressGestureRecognizer;
}

- (UITapGestureRecognizer)doubleTapGestureRecognizer
{
  return self->_doubleTapGestureRecognizer;
}

- (BOOL)allowCalloutActions
{
  return self->_allowCalloutActions;
}

- (BOOL)applyDefaultTypingAttributesOnTextEffectPickerDismissal
{
  return self->_applyDefaultTypingAttributesOnTextEffectPickerDismissal;
}

- (void)setApplyDefaultTypingAttributesOnTextEffectPickerDismissal:(BOOL)a3
{
  self->_applyDefaultTypingAttributesOnTextEffectPickerDismissal = a3;
}

@end