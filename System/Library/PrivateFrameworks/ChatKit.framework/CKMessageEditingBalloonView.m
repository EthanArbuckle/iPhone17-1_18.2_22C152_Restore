@interface CKMessageEditingBalloonView
+ (BOOL)supportsAllowsTextAnimationChanges;
- (BOOL)hasBackground;
- (BOOL)shouldResignFirstResponderForPresses;
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (BOOL)textViewShouldBeginEditing:(id)a3;
- (CGRect)customTextViewLayoutBounds;
- (CKMessageEditingBalloonTextView)messageEditingBalloonTextView;
- (CKMessageEditingBalloonView)initWithFrame:(CGRect)a3;
- (CKMessageEditingBalloonViewDelegate)editingBalloonViewDelegate;
- (NSAttributedString)currentCompositionText;
- (NSDictionary)typingAttributes;
- (NSString)description;
- (id)textEffectsEditMenuForTextInRange:(_NSRange)a3;
- (id)textView:(id)a3 editMenuForTextInRange:(_NSRange)a4 suggestedActions:(id)a5;
- (void)applyTextEffect:(int64_t)a3 toTextRange:(_NSRange)a4;
- (void)applyTextStyle:(unint64_t)a3 toTextRange:(_NSRange)a4;
- (void)layoutSubviews;
- (void)messageEntryTextView:(id)a3 applyStyleChangeOfType:(unint64_t)a4 add:(BOOL)a5 forRange:(_NSRange)a6;
- (void)messageEntryTextView:(id)a3 didSetAnimationName:(id)a4 forRange:(_NSRange)a5;
- (void)messageEntryTextView:(id)a3 didUpdateForRange:(_NSRange)a4 conversionHandler:(id)a5;
- (void)messageEntryTextView:(id)a3 replaceRange:(_NSRange)a4 withAttributedText:(id)a5;
- (void)messageEntryTextViewDidChangePencilMode:(id)a3;
- (void)modifySelectedTextByTogglingTextEffectType:(int64_t)a3;
- (void)modifySelectedTextByTogglingTextStyle:(unint64_t)a3;
- (void)prepareForReuse;
- (void)setCustomTextViewLayoutBounds:(CGRect)a3;
- (void)setEditingBalloonViewDelegate:(id)a3;
- (void)setMessageEditingBalloonTextView:(id)a3;
- (void)setTypingAttributes:(id)a3;
- (void)textViewDidChange:(id)a3;
- (void)textViewWritingToolsDidEnd:(id)a3;
- (void)textViewWritingToolsWillBegin:(id)a3;
@end

@implementation CKMessageEditingBalloonView

- (NSString)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)CKMessageEditingBalloonView;
  v4 = [(CKTextBalloonView *)&v9 textView];
  v8.receiver = self;
  v8.super_class = (Class)CKMessageEditingBalloonView;
  v5 = [(CKTextBalloonView *)&v8 description];
  v6 = [v3 stringWithFormat:@"[CKMessageEditingBalloonView textView:%@ %@]", v4, v5];

  return (NSString *)v6;
}

- (NSAttributedString)currentCompositionText
{
  return [(CKMessageEntryTextView *)self->_messageEditingBalloonTextView compositionText];
}

- (CKMessageEditingBalloonView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  objc_super v8 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v9 = [v8 isTextKit2Enabled];

  v10 = [CKMessageEditingBalloonTextView alloc];
  if (v9) {
    uint64_t v11 = -[CKMessageEntryTextView initUsingTextLayoutManagerWithFrame:](v10, "initUsingTextLayoutManagerWithFrame:", x, y, width, height);
  }
  else {
    uint64_t v11 = -[CKMessageEntryTextView initWithFrame:textContainer:](v10, "initWithFrame:textContainer:", 0, x, y, width, height);
  }
  v12 = (void *)v11;
  +[CKMessageEntryContentView configureMessageBodyEntryTextView:v11 shouldUseNonEmojiKeyboard:0 shouldUseNonHandwritingKeyboard:0];
  v19.receiver = self;
  v19.super_class = (Class)CKMessageEditingBalloonView;
  v13 = -[CKTextBalloonView initWithFrame:textView:](&v19, sel_initWithFrame_textView_, v12, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_messageEditingBalloonTextView, v12);
    [(CKTextBalloonView *)v14 targetTextContainerInsets];
    objc_msgSend(v12, "setTextContainerInset:");
    [v12 setEditable:1];
    [v12 setScrollEnabled:1];
    [v12 setUserInteractionEnabled:1];
    [v12 setAlwaysBounceVertical:0];
    [v12 setSupportsBigEmojiTextStyles:1];
    v15 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v16 = [v15 isExpressiveTextEnabled];

    if (v16)
    {
      [v12 setAllowsTextAnimations:1];
      [(CKMessageEntryTextView *)v14->_messageEditingBalloonTextView setTextFormattingDelegate:v14];
      v17 = [v12 textLayoutManager];
      [v17 setRequiresCTLineRef:1];
    }
  }

  return v14;
}

- (void)layoutSubviews
{
  v36.receiver = self;
  v36.super_class = (Class)CKMessageEditingBalloonView;
  [(CKTextBalloonView *)&v36 layoutSubviews];
  [(CKMessageEditingBalloonView *)self customTextViewLayoutBounds];
  if (CGRectIsEmpty(v37)) {
    [(CKMessageEditingBalloonView *)self bounds];
  }
  else {
    [(CKMessageEditingBalloonView *)self customTextViewLayoutBounds];
  }
  -[CKMessageEditingBalloonView alignmentRectForFrame:](self, "alignmentRectForFrame:");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(CKBalloonView *)self textAlignmentInsets];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v10 + v11 + v17;
  if ([(CKTextBalloonView *)self containsExcessiveLineHeightCharacters])
  {
    objc_super v19 = +[CKUIBehavior sharedBehaviors];
    [v19 transcriptTextFontLanguageAwareOutsets];
    double v21 = v20;
    double v35 = v16;
    double v22 = v6;
    double v23 = v8;
    double v24 = v4;
    double v26 = v25;

    double v27 = v21 + v26;
    double v4 = v24;
    double v8 = v23;
    double v6 = v22;
    double v16 = v35;
    double v18 = v18 + v27;
  }
  if (CKMainScreenScale_once_30 != -1) {
    dispatch_once(&CKMainScreenScale_once_30, &__block_literal_global_287_1);
  }
  double v28 = v8 + v14 + v16;
  double v29 = *(double *)&CKMainScreenScale_sMainScreenScale_30;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_30 == 0.0) {
    double v29 = 1.0;
  }
  double v30 = floor((v4 - v14) * v29) / v29;
  double v31 = ceil(v28 * v29) / v29;
  double v32 = floor((v6 - v12) * v29) / v29;
  double v33 = ceil(v18 * v29) / v29;
  v34 = [(CKTextBalloonView *)self textView];
  objc_msgSend(v34, "setFrame:", v30, v32, v31, v33);
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)CKMessageEditingBalloonView;
  [(CKTextBalloonView *)&v3 prepareForReuse];
  [(CKTextBalloonView *)self setContainsExcessiveLineHeightCharacters:0];
}

- (BOOL)hasBackground
{
  return 0;
}

- (BOOL)textViewShouldBeginEditing:(id)a3
{
  if (!self->_typingAttributes)
  {
    double v4 = [a3 typingAttributes];
    [(CKMessageEditingBalloonView *)self setTypingAttributes:v4];
  }
  return 1;
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  _NSRange v15 = a4;
  id v7 = a3;
  id v8 = a5;
  id v9 = [(CKTextBalloonView *)self textView];
  if (v9 == v7)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0
      && ![v7 shouldUpdateMentionsInRange:&v15 replacementText:v8])
    {
      BOOL v13 = 0;
      goto LABEL_6;
    }
  }
  else
  {
  }
  double v11 = [(CKMessageEditingBalloonView *)self messageEditingBalloonTextView];
  double v12 = [v11 effectsPickerAssistant];
  objc_msgSend(v12, "adjustTypingAttributesIfNeededForReplacement:inRange:", v8, v15.location, v15.length);

  BOOL v13 = 1;
LABEL_6:
  objc_msgSend(v7, "typingAttributes", v15.location, v15.length);

  return v13;
}

- (id)textView:(id)a3 editMenuForTextInRange:(_NSRange)a4 suggestedActions:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = objc_msgSend(a5, "mutableCopy", a3);
  id v9 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  if (([v9 isExpressiveTextEnabled] & 1) == 0)
  {

    goto LABEL_9;
  }
  double v10 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v11 = [v10 isSendingExpressiveTextEnabled];

  if (!v11)
  {
LABEL_9:
    double v14 = (void *)MEMORY[0x1E4F42B80];
    goto LABEL_14;
  }
  unint64_t v12 = objc_msgSend(MEMORY[0x1E4F42B80], "ck_indexOfMenuWithMenuIdentifier:inMenuElementsArray:", *MEMORY[0x1E4F43BC8], v8);
  if (v12 >= [v8 count]) {
    unint64_t v12 = 0;
  }
  if (CKIsRunningInMacCatalyst())
  {
    BOOL v13 = -[CKMessageEditingBalloonView textEffectsEditMenuForTextInRange:](self, "textEffectsEditMenuForTextInRange:", location, length);
    if (!v13) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  _NSRange v15 = [(CKMessageEditingBalloonView *)self messageEditingBalloonTextView];
  BOOL v13 = [v15 showTextEffectsPickerEditMenuAction];

  if (v13)
  {
    double v16 = CKFrameworkBundle();
    double v17 = [v16 localizedStringForKey:@"TEXT_EFFECTS" value:&stru_1EDE4CA38 table:@"ChatKit"];
    [v13 setTitle:v17];

LABEL_12:
    [v8 insertObject:v13 atIndex:v12];
  }
LABEL_13:

  double v14 = (void *)MEMORY[0x1E4F42B80];
LABEL_14:
  double v18 = (void *)[v8 copy];
  objc_super v19 = [v14 menuWithChildren:v18];

  return v19;
}

- (void)textViewDidChange:(id)a3
{
  [a3 updateFontIfNeededAndGetWasUsingBigEmojiStyle:0];
  id v4 = [(CKMessageEditingBalloonView *)self editingBalloonViewDelegate];
  [v4 messageEditingBalloonViewContentDidChange:self];
}

- (BOOL)shouldResignFirstResponderForPresses
{
  return 0;
}

- (void)textViewWritingToolsWillBegin:(id)a3
{
  id v4 = [(CKMessageEditingBalloonView *)self editingBalloonViewDelegate];
  [v4 messageEditingBalloonViewWritingToolsWillBegin:self];
}

- (void)textViewWritingToolsDidEnd:(id)a3
{
  id v4 = [(CKMessageEditingBalloonView *)self editingBalloonViewDelegate];
  [v4 messageEditingBalloonViewWritingToolsDidEnd:self];
}

+ (BOOL)supportsAllowsTextAnimationChanges
{
  return 0;
}

- (void)messageEntryTextView:(id)a3 didUpdateForRange:(_NSRange)a4 conversionHandler:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v12 = a5;
  if (length)
  {
    id v9 = [a3 textStorage];
    [v9 beginEditing];
    id v10 = (id)objc_msgSend(v9, "ck_attributedStringByConverting:range:", v12, location, length);
    [v9 endEditing];
    int v11 = [(CKMessageEditingBalloonView *)self editingBalloonViewDelegate];
    [v11 messageEditingBalloonViewContentDidChange:self];
  }
}

- (void)messageEntryTextView:(id)a3 didSetAnimationName:(id)a4 forRange:(_NSRange)a5
{
  if (a5.length)
  {
    NSUInteger length = a5.length;
    NSUInteger location = a5.location;
    id v9 = a4;
    id v12 = [a3 textStorage];
    [v12 beginEditing];
    objc_msgSend(v12, "ck_toggleTextEffectNamed:range:getAdded:", v9, location, length, 0);

    [v12 endEditing];
    id v10 = [(CKMessageEditingBalloonView *)self editingBalloonViewDelegate];
    [v10 messageEditingBalloonViewContentDidChange:self];

    int v11 = [(CKMessageEditingBalloonView *)self editingBalloonViewDelegate];
    objc_msgSend(v11, "messageEditingBalloonView:didChangeTextAnimationInRange:", self, location, length);
  }
}

- (void)messageEntryTextView:(id)a3 applyStyleChangeOfType:(unint64_t)a4 add:(BOOL)a5 forRange:(_NSRange)a6
{
  if (a6.length)
  {
    NSUInteger location = a6.location;
    if (a6.location != 0x7FFFFFFFFFFFFFFFLL)
    {
      NSUInteger length = a6.length;
      BOOL v8 = a5;
      id v12 = [a3 textStorage];
      [v12 beginEditing];
      if (v8) {
        objc_msgSend(v12, "ck_addTextStyle:options:range:", a4, 3, location, length);
      }
      else {
        objc_msgSend(v12, "ck_removeTextStyle:options:range:", a4, 3, location, length);
      }
      [v12 endEditing];
      int v11 = [(CKMessageEditingBalloonView *)self editingBalloonViewDelegate];
      [v11 messageEditingBalloonViewContentDidChange:self];
    }
  }
}

- (void)messageEntryTextView:(id)a3 replaceRange:(_NSRange)a4 withAttributedText:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v15 = (id)[a5 mutableCopy];
  objc_msgSend(v15, "ck_replaceTextAnimationsWithIMTextEffects");
  objc_msgSend(v15, "ck_replaceBIUSWithIMTextStyles");
  uint64_t v10 = *MEMORY[0x1E4FB06F8];
  objc_msgSend(v15, "removeAttribute:range:", *MEMORY[0x1E4FB06F8], 0, objc_msgSend(v15, "length"));
  int v11 = +[CKUIBehavior sharedBehaviors];
  id v12 = [v11 balloonTextFont];
  objc_msgSend(v15, "addAttribute:value:range:", v10, v12, 0, objc_msgSend(v15, "length"));

  objc_msgSend(v15, "ck_addDisplayableAttributeForIMTextEffectAttribute");
  objc_msgSend(v15, "ck_addDisplayableAttributesForIMTextStyleAttributes");
  BOOL v13 = [v9 textStorage];

  [v13 beginEditing];
  objc_msgSend(v13, "replaceCharactersInRange:withAttributedString:", location, length, v15);
  [v13 endEditing];
  double v14 = [(CKMessageEditingBalloonView *)self editingBalloonViewDelegate];
  [v14 messageEditingBalloonViewContentDidChange:self];
}

- (void)messageEntryTextViewDidChangePencilMode:(id)a3
{
  id v4 = [(CKMessageEditingBalloonView *)self editingBalloonViewDelegate];
  [v4 messageEditingBalloonViewDidChangePencilMode:self];
}

- (id)textEffectsEditMenuForTextInRange:(_NSRange)a3
{
  NSUInteger length = (void *)a3.length;
  id v4 = (void *)a3.location;
  v30[2] = *MEMORY[0x1E4F143B8];
  double v6 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v7 = [v6 isExpressiveTextEnabled];

  if (v7)
  {
    id location = 0;
    objc_initWeak(&location, self);
    BOOL v8 = [(CKTextBalloonView *)self textView];
    uint64_t v9 = objc_msgSend(v8, "ck_activeTextStylesInRange:", v4, length);

    uint64_t v10 = [(CKTextBalloonView *)self textView];
    uint64_t v11 = objc_msgSend(v10, "ck_activeTextEffectTypeInRange:", v4, length);

    id v12 = [(CKMessageEditingBalloonView *)self messageEditingBalloonTextView];
    BOOL v13 = [v12 selectedText];

    if (!v13) {
      BOOL v13 = &stru_1EDE4CA38;
    }
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __65__CKMessageEditingBalloonView_textEffectsEditMenuForTextInRange___block_invoke;
    v27[3] = &unk_1E5625098;
    objc_copyWeak(v28, &location);
    v28[1] = v4;
    v28[2] = length;
    double v14 = +[CKTextEffectsMenuFactory textStylePaletteMenuWithActiveTextStyles:v9 selectedText:v13 handler:v27];
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    double v24 = __65__CKMessageEditingBalloonView_textEffectsEditMenuForTextInRange___block_invoke_2;
    double v25 = &unk_1E56250C0;
    objc_copyWeak(v26, &location);
    v26[1] = v4;
    v26[2] = length;
    id v15 = +[CKTextEffectsMenuFactory inlineEffectMenuWithHandler:&v22 activeTextEffectType:v11];
    int v16 = CKIsRunningInMacCatalyst();
    double v17 = (void *)MEMORY[0x1E4F42B80];
    v30[0] = v14;
    v30[1] = v15;
    double v18 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v30, 2, v22, v23, v24, v25);
    if (v16) {
      uint64_t v19 = 17;
    }
    else {
      uint64_t v19 = 1;
    }
    double v20 = [v17 menuWithTitle:&stru_1EDE4CA38 image:0 identifier:0 options:v19 children:v18];

    objc_destroyWeak(v26);
    objc_destroyWeak(v28);

    objc_destroyWeak(&location);
  }
  else
  {
    double v20 = 0;
  }

  return v20;
}

void __65__CKMessageEditingBalloonView_textEffectsEditMenuForTextInRange___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "applyTextStyle:toTextRange:", a2, *(void *)(a1 + 40), *(void *)(a1 + 48));
}

void __65__CKMessageEditingBalloonView_textEffectsEditMenuForTextInRange___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "applyTextEffect:toTextRange:", a2, *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)modifySelectedTextByTogglingTextStyle:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  double v5 = [(CKMessageEditingBalloonView *)self messageEditingBalloonTextView];
  NSUInteger v6 = [v5 selectedRange];
  NSUInteger v8 = v7;

  uint64_t v9 = [(CKMessageEditingBalloonView *)self messageEditingBalloonTextView];
  uint64_t v10 = [v9 text];

  if (v6 + v8 <= [v10 length])
  {
    -[CKMessageEditingBalloonView applyTextStyle:toTextRange:](self, "applyTextStyle:toTextRange:", a3, v6, v8);
  }
  else
  {
    uint64_t v11 = IMLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = IMTextStyleAttributeNameFromStyle();
      v21.id location = v6;
      v21.NSUInteger length = v8;
      BOOL v13 = NSStringFromRange(v21);
      int v14 = 138412802;
      id v15 = v12;
      __int16 v16 = 2112;
      double v17 = v13;
      __int16 v18 = 2048;
      uint64_t v19 = [v10 length];
      _os_log_error_impl(&dword_18EF18000, v11, OS_LOG_TYPE_ERROR, "Invalid range when toggling text style {%@} for range {%@} with textLength {%lu}.", (uint8_t *)&v14, 0x20u);
    }
  }
}

- (void)applyTextStyle:(unint64_t)a3 toTextRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v11 = [(CKMessageEditingBalloonView *)self messageEditingBalloonTextView];
  NSUInteger v8 = +[CKUIBehavior sharedBehaviors];
  uint64_t v9 = [v8 balloonTextFont];

  objc_msgSend(v11, "ck_applyWithTextStyle:toRange:baseFont:", a3, location, length, v9);
  uint64_t v10 = [(CKMessageEditingBalloonView *)self editingBalloonViewDelegate];
  [v10 messageEditingBalloonViewContentDidChange:self];
}

- (void)modifySelectedTextByTogglingTextEffectType:(int64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  double v5 = [(CKMessageEditingBalloonView *)self messageEditingBalloonTextView];
  NSUInteger v6 = [v5 selectedRange];
  NSUInteger v8 = v7;

  uint64_t v9 = [(CKMessageEditingBalloonView *)self messageEditingBalloonTextView];
  uint64_t v10 = [v9 text];

  if (v6 + v8 <= [v10 length])
  {
    -[CKMessageEditingBalloonView applyTextEffect:toTextRange:](self, "applyTextEffect:toTextRange:", a3, v6, v8);
  }
  else
  {
    id v11 = IMLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = IMTextEffectNameFromType();
      v21.NSUInteger location = v6;
      v21.NSUInteger length = v8;
      BOOL v13 = NSStringFromRange(v21);
      int v14 = 138412802;
      id v15 = v12;
      __int16 v16 = 2112;
      double v17 = v13;
      __int16 v18 = 2048;
      uint64_t v19 = [v10 length];
      _os_log_error_impl(&dword_18EF18000, v11, OS_LOG_TYPE_ERROR, "Invalid range when toggling text style {%@} for range {%@} with textLength {%lu}.", (uint8_t *)&v14, 0x20u);
    }
  }
}

- (void)applyTextEffect:(int64_t)a3 toTextRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = [(CKMessageEditingBalloonView *)self messageEditingBalloonTextView];
  objc_msgSend(v9, "ck_toggleTextEffect:inRange:getAdded:undo:", a3, location, length, 0, &__block_literal_global_71);
  NSUInteger v8 = [(CKMessageEditingBalloonView *)self editingBalloonViewDelegate];
  [v8 messageEditingBalloonViewContentDidChange:self];
}

- (CKMessageEditingBalloonViewDelegate)editingBalloonViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_editingBalloonViewDelegate);

  return (CKMessageEditingBalloonViewDelegate *)WeakRetained;
}

- (void)setEditingBalloonViewDelegate:(id)a3
{
}

- (CKMessageEditingBalloonTextView)messageEditingBalloonTextView
{
  return self->_messageEditingBalloonTextView;
}

- (void)setMessageEditingBalloonTextView:(id)a3
{
}

- (CGRect)customTextViewLayoutBounds
{
  double x = self->_customTextViewLayoutBounds.origin.x;
  double y = self->_customTextViewLayoutBounds.origin.y;
  double width = self->_customTextViewLayoutBounds.size.width;
  double height = self->_customTextViewLayoutBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCustomTextViewLayoutBounds:(CGRect)a3
{
  self->_customTextViewLayoutBounds = a3;
}

- (NSDictionary)typingAttributes
{
  return self->_typingAttributes;
}

- (void)setTypingAttributes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typingAttributes, 0);
  objc_storeStrong((id *)&self->_messageEditingBalloonTextView, 0);

  objc_destroyWeak((id *)&self->_editingBalloonViewDelegate);
}

@end