@interface EMKTextView
+ (void)__emk_setNeedsDisplayCurrentRenderAttributesForView:(id)a3;
- (BOOL)_shouldSuppressSelectionCommands;
- (BOOL)isEmojiConversionEnabled;
- (BOOL)isUsingTextEffectBasedEmojiAnimations;
- (BOOL)touchHasEmojiSignificance:(id)a3;
- (CGRect)anchorRect;
- (EMFEmojiPreferences)emojiPreferences;
- (EMKGestureRecognizerDelegate)gestureRecognizerDelegate;
- (EMKTextView)init;
- (EMKTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4;
- (EMKTextViewEmojiAnimationDelegate)emojiAnimationDelegate;
- (UIView)textContainerOverlayView;
- (id)initUsingTextLayoutManagerWithFrame:(CGRect)a3;
- (id)initUsingTextLayoutManagerWithFrame:(CGRect)a3 textContainer:(id)a4;
- (id)personalizedEmojiTokenListForList:(id)a3;
- (void)__legacy_setTokenListsHighlighted_emk:(BOOL)a3 rippler:(id)a4;
- (void)__textEffects_setTokenListsHighlighted_emk:(BOOL)a3;
- (void)_emk_addRenderingAttribute:(id)a3 value:(id)a4 forTextRange:(id)a5;
- (void)_emk_removeRenderingAttribute:(id)a3 forTextRange:(id)a4;
- (void)_emk_setNeedsDisplayCurrentRenderAttributes;
- (void)_emojifyingDisabled:(id)a3;
- (void)_keyboardDidShow:(id)a3;
- (void)_setTokenListsHidden_emk:(BOOL)a3;
- (void)_setTokenListsHighlighted_emk:(BOOL)a3 rippler:(id)a4;
- (void)_showEmojiSuggestionsForInputModeChange:(id)a3;
- (void)_startTextKit1EmojiDisplayUpdateTimer:(id)a3;
- (void)_stopTextKit1EmojiDisplayUpdateTimer:(id)a3;
- (void)calculateDisplayRect;
- (void)dealloc;
- (void)deleteBackward;
- (void)didMoveToSuperview;
- (void)didMoveToWindow;
- (void)dismissOverlayView;
- (void)layoutSubviews;
- (void)replaceRange:(_NSRange)a3 withEmojiToken:(id)a4 language:(id)a5;
- (void)setDelayFrames:(unint64_t)a3;
- (void)setEmojiAnimationDelegate:(id)a3;
- (void)setEmojiConversionEnabled:(BOOL)a3;
- (void)setEmojiConversionLanguagesAndActivateConversion:(BOOL)a3;
- (void)setEmojiConversionLanguagesForInputModeChange:(id)a3;
- (void)setEmojiConversionLanguagesForKeyboardShow:(id)a3;
- (void)setEmojiPreferences:(id)a3;
- (void)setGestureRecognizerDelegate:(id)a3;
- (void)setPostFrames:(unint64_t)a3;
- (void)setPreFrames:(unint64_t)a3;
- (void)setTextContainerOverlayView:(id)a3;
- (void)setUsingTextEffectBasedEmojiAnimations:(BOOL)a3;
- (void)setupLayoutManagerWithFrame:(CGRect)a3;
- (void)textTapGestureRecognized:(id)a3;
- (void)updateEmojiDisplay:(id)a3;
- (void)updateOverlayView:(id)a3;
@end

@implementation EMKTextView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emojiPreferences, 0);
  objc_storeStrong((id *)&self->_gestureRecognizerDelegate, 0);
  objc_destroyWeak((id *)&self->_emojiAnimationDelegate);
  objc_storeStrong((id *)&self->_textKit2Controller, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)EMKTextView;
  [(EMKTextView *)&v4 dealloc];
}

- (id)initUsingTextLayoutManagerWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)EMKTextView;
  v7 = -[EMKTextView initWithFrame:textContainer:](&v10, sel_initWithFrame_textContainer_, 0);
  v8 = v7;
  if (v7) {
    -[EMKTextView setupLayoutManagerWithFrame:](v7, "setupLayoutManagerWithFrame:", x, y, width, height);
  }
  return v8;
}

- (void)setupLayoutManagerWithFrame:(CGRect)a3
{
  double width = a3.size.width;
  __commonInit(self);
  v5 = [[_EMKTextKit2Controller alloc] initWithTextView:self emojiPreferences:self->_emojiPreferences];
  textKit2Controller = self->_textKit2Controller;
  self->_textKit2Controller = v5;

  id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 addObserver:self selector:sel__showEmojiSuggestionsForInputModeChange_ name:*MEMORY[0x1E4F43E60] object:0];
  [v8 addObserver:self selector:sel__keyboardDidShow_ name:*MEMORY[0x1E4F43AC8] object:0];
  v7 = [(EMKTextView *)self textContainer];
  objc_msgSend(v7, "setSize:", width, 1.79769313e308);
  [v7 setWidthTracksTextView:1];
  if (([(EMKTextView *)self isScrollEnabled] & 1) == 0) {
    [v7 setHeightTracksTextView:1];
  }
  [(EMKTextView *)self setEmojiConversionLanguagesAndActivateConversion:1];
}

- (void)setEmojiConversionLanguagesAndActivateConversion:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v5 = [MEMORY[0x1E4F42B30] sharedInputModeController];
  v6 = [v5 currentInputMode];

  v7 = [v6 primaryLanguage];
  id v8 = standardLanguage(v7);

  v9 = [MEMORY[0x1E4F28B50] mainBundle];
  objc_super v10 = [v9 bundleIdentifier];

  if (!v8 || ([v8 hasPrefix:@"emoji"] & 1) != 0)
  {
    self->_emojiConversionActive = !v10
                                || ![v10 isEqualToString:@"com.apple.MobileSMS.MessagesNotificationExtension"];
    if (!v3) {
      goto LABEL_27;
    }
LABEL_24:
    v20 = [(EMKTextView *)self traitCollection];
    uint64_t v21 = [v20 userInterfaceStyle];

    textKit2Controller = self->_textKit2Controller;
    if (textKit2Controller)
    {
      [(_EMKTextKit2Controller *)textKit2Controller setDarkModeEnabled:v21 == 2];
      [(_EMKTextKit2Controller *)self->_textKit2Controller setEmojiConversionActive:self->_emojiConversionActive];
    }
    else
    {
      v23 = [(EMKTextView *)self layoutManager];
      [v23 setDarkModeEnabled:v21 == 2];
      [v23 setEmojiConversionActive:self->_emojiConversionActive];
    }
    goto LABEL_27;
  }
  BOOL v24 = v3;
  v11 = [MEMORY[0x1E4F1CA48] arrayWithObject:v8];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v25 = v6;
  v12 = [v6 multilingualLanguages];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = standardLanguage(*(void **)(*((void *)&v26 + 1) + 8 * i));
        if ([v17 length]
          && ([v17 hasPrefix:@"emoji"] & 1) == 0
          && ([v11 containsObject:v17] & 1) == 0)
        {
          [v11 addObject:v17];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v14);
  }

  v18 = self->_textKit2Controller;
  if (v18)
  {
    [(_EMKTextKit2Controller *)v18 setEmojiConversionLanguages:v11];
  }
  else
  {
    v19 = [(EMKTextView *)self layoutManager];
    [v19 setEmojiConversionLanguages:v11];
  }
  self->_emojiConversionActive = 0;

  v6 = v25;
  if (v24) {
    goto LABEL_24;
  }
LABEL_27:
}

- (void)setGestureRecognizerDelegate:(id)a3
{
}

- (void)setEmojiPreferences:(id)a3
{
}

- (EMKGestureRecognizerDelegate)gestureRecognizerDelegate
{
  return (EMKGestureRecognizerDelegate *)objc_getProperty(self, a2, 2880, 1);
}

- (void)setEmojiConversionLanguagesForInputModeChange:(id)a3
{
}

- (void)_showEmojiSuggestionsForInputModeChange:(id)a3
{
  id v3 = (id)[MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel_setEmojiConversionLanguagesForInputModeChange_ selector:0 userInfo:0 repeats:0.01];
}

- (void)_emk_removeRenderingAttribute:(id)a3 forTextRange:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(EMKTextView *)self textLayoutManager];
  [v8 removeRenderingAttribute:v7 forTextRange:v6];
}

- (void)_emk_addRenderingAttribute:(id)a3 value:(id)a4 forTextRange:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(EMKTextView *)self textLayoutManager];
  [v11 addRenderingAttribute:v10 value:v9 forTextRange:v8];
}

+ (void)__emk_setNeedsDisplayCurrentRenderAttributesForView:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 setNeedsDisplay];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = objc_msgSend(v4, "subviews", 0);
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
        objc_msgSend(a1, "__emk_setNeedsDisplayCurrentRenderAttributesForView:", *(void *)(*((void *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_emk_setNeedsDisplayCurrentRenderAttributes
{
  id v3 = objc_opt_class();
  objc_msgSend(v3, "__emk_setNeedsDisplayCurrentRenderAttributesForView:", self);
}

- (void)_setTokenListsHidden_emk:(BOOL)a3
{
  if (![(EMKTextView *)self isUsingTextEffectBasedEmojiAnimations])
  {
    v5 = [(EMKTextView *)self textLayoutManager];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __48__EMKTextView_Helper___setTokenListsHidden_emk___block_invoke;
    v6[3] = &unk_1E6E97020;
    BOOL v7 = a3;
    v6[4] = self;
    objc_msgSend(v5, "_enumerateAllTokenListsUsingBlock_emk:", v6);
    [(EMKTextView *)self _emk_setNeedsDisplayCurrentRenderAttributes];
  }
}

void __48__EMKTextView_Helper___setTokenListsHidden_emk___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *MEMORY[0x1E4FB0700];
  if (*(unsigned char *)(a1 + 40))
  {
    v5 = (void *)MEMORY[0x1E4F428B8];
    id v6 = a3;
    id v7 = [v5 clearColor];
    objc_msgSend(v3, "_emk_addRenderingAttribute:value:forTextRange:", v4);
  }
  else
  {
    id v7 = a3;
    objc_msgSend(v3, "_emk_removeRenderingAttribute:forTextRange:", v4);
  }
}

- (void)_setTokenListsHighlighted_emk:(BOOL)a3 rippler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if ([(EMKTextView *)self isUsingTextEffectBasedEmojiAnimations]) {
    [(EMKTextView *)self __textEffects_setTokenListsHighlighted_emk:v4];
  }
  else {
    [(EMKTextView *)self __legacy_setTokenListsHighlighted_emk:v4 rippler:v6];
  }
}

- (void)__legacy_setTokenListsHighlighted_emk:(BOOL)a3 rippler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(EMKTextView *)self textLayoutManager];
  uint64_t v8 = v7;
  if (v4)
  {
    uint64_t v9 = -[_EMKGlyphRenderingAttributes initWithValuesFromRippler:timeIndex:glyphIndex:numberOfGlyphs:]([_EMKGlyphRenderingAttributes alloc], "initWithValuesFromRippler:timeIndex:glyphIndex:numberOfGlyphs:", v6, [v6 currentTimeIndex], 0, 1);
    long long v10 = [(_EMKGlyphRenderingAttributes *)v9 color];
    long long v11 = [(EMKTextView *)self font];
    [v11 pointSize];
    long long v12 = -[_EMKGlyphRenderingAttributes shadowIfNeededForFontPointSize:](v9, "shadowIfNeededForFontPointSize:");

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __69__EMKTextView_Helper____legacy_setTokenListsHighlighted_emk_rippler___block_invoke;
    v16[3] = &unk_1E6E97048;
    v16[4] = self;
    id v17 = v10;
    id v18 = v12;
    id v13 = v12;
    id v14 = v10;
    objc_msgSend(v8, "_enumerateAllTokenListsUsingBlock_emk:", v16);
  }
  else
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __69__EMKTextView_Helper____legacy_setTokenListsHighlighted_emk_rippler___block_invoke_2;
    v15[3] = &unk_1E6E97070;
    v15[4] = self;
    objc_msgSend(v7, "_enumerateAllTokenListsUsingBlock_emk:", v15);
  }
  [(EMKTextView *)self _emk_setNeedsDisplayCurrentRenderAttributes];
}

void __69__EMKTextView_Helper____legacy_setTokenListsHighlighted_emk_rippler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_emk_addRenderingAttribute:value:forTextRange:", *MEMORY[0x1E4FB0700], *(void *)(a1 + 40));
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4) {
    objc_msgSend(*(id *)(a1 + 32), "_emk_addRenderingAttribute:value:forTextRange:", *MEMORY[0x1E4FB0758], v4, v5);
  }
}

void __69__EMKTextView_Helper____legacy_setTokenListsHighlighted_emk_rippler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *MEMORY[0x1E4FB0700];
  id v6 = a3;
  objc_msgSend(v4, "_emk_removeRenderingAttribute:forTextRange:", v5, v6);
  objc_msgSend(*(id *)(a1 + 32), "_emk_removeRenderingAttribute:forTextRange:", *MEMORY[0x1E4FB0758], v6);
}

- (void)__textEffects_setTokenListsHighlighted_emk:(BOOL)a3
{
  if (a3)
  {
    id v3 = [(EMKTextView *)self textStorage];
    objc_msgSend(v3, "removeAttribute:range:", *MEMORY[0x1E4FB0790], 0, objc_msgSend(v3, "length"));
  }
}

- (BOOL)isUsingTextEffectBasedEmojiAnimations
{
  return self->_usingTextEffectBasedEmojiAnimations;
}

- (void)setUsingTextEffectBasedEmojiAnimations:(BOOL)a3
{
  self->_usingTextEffectBasedEmojiAnimations = a3;
  if (a3 && ([(EMKTextView *)self allowsTextAnimations] & 1) == 0)
  {
    [(EMKTextView *)self setAllowsTextAnimations:1];
  }
}

- (UIView)textContainerOverlayView
{
  return [(_EMKTextKit2Controller *)self->_textKit2Controller textContainerOverlayView];
}

- (void)setTextContainerOverlayView:(id)a3
{
}

- (void)setEmojiConversionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_textKit2Controller)
  {
    textKit2Controller = self->_textKit2Controller;
    -[_EMKTextKit2Controller setEmojiConversionEnabled:](textKit2Controller, "setEmojiConversionEnabled:");
  }
  else
  {
    id v5 = [(EMKTextView *)self layoutManager];
    [v5 setEmojiConversionEnabled:v3];
  }
}

- (BOOL)isEmojiConversionEnabled
{
  if (self->_textKit2Controller)
  {
    textKit2Controller = self->_textKit2Controller;
    return [(_EMKTextKit2Controller *)textKit2Controller isEmojiConversionEnabled];
  }
  else
  {
    uint64_t v4 = [(EMKTextView *)self layoutManager];
    char v5 = [v4 isEmojiConversionEnabled];

    return v5;
  }
}

- (void)dismissOverlayView
{
  textKit2Controller = self->_textKit2Controller;
  if (textKit2Controller)
  {
    [(_EMKTextKit2Controller *)textKit2Controller dismissOverlayView];
  }
  else
  {
    [(EMKOverlayView *)self->_overlayView dismiss];
    overlayView = self->_overlayView;
    self->_overlayView = 0;
  }
}

- (void)calculateDisplayRect
{
  BOOL v3 = [(EMKTextView *)self layoutManager];
  uint64_t v4 = [v3 attributes];
  char v5 = [(EMKTextView *)self textStorage];
  unint64_t v6 = [v5 length];
  unint64_t v7 = [v4 length];
  uint64_t v8 = [(EMKTextView *)self textContainer];
  [(EMKTextView *)self textContainerInset];
  double v10 = v9;
  double v12 = v11;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  p_displayRect = &self->_displayRect;
  CGSize v14 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  self->_displayRect.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  self->_displayRect.size = v14;
  if (v7)
  {
    uint64_t v15 = 0;
    do
    {
      v16 = objc_msgSend(v4, "attribute:atIndex:longestEffectiveRange:inRange:", @"EMKEmojiTokenList", v15, &v27, v15, v7 - v15);
      if (v16 && v28 + v27 <= v6)
      {
        uint64_t v17 = objc_msgSend(v3, "glyphRangeForCharacterRange:actualCharacterRange:");
        objc_msgSend(v3, "boundingRectForGlyphRange:inTextContainer:", v17, v18, v8);
        CGFloat width = v19;
        CGFloat height = v21;
        double x = v12 + v23;
        double y = v10 + v25;
        v29.origin.double x = p_displayRect->origin.x;
        v29.origin.double y = self->_displayRect.origin.y;
        v29.size.CGFloat width = self->_displayRect.size.width;
        v29.size.CGFloat height = self->_displayRect.size.height;
        if (!CGRectIsEmpty(v29))
        {
          v30.origin.double x = p_displayRect->origin.x;
          v30.origin.double y = self->_displayRect.origin.y;
          v30.size.CGFloat width = self->_displayRect.size.width;
          v30.size.CGFloat height = self->_displayRect.size.height;
          v32.origin.double x = x;
          v32.origin.double y = y;
          v32.size.CGFloat width = width;
          v32.size.CGFloat height = height;
          CGRect v31 = CGRectUnion(v30, v32);
          double x = v31.origin.x;
          double y = v31.origin.y;
          CGFloat width = v31.size.width;
          CGFloat height = v31.size.height;
        }
        p_displayRect->origin.double x = x;
        self->_displayRect.origin.double y = y;
        self->_displayRect.size.CGFloat width = width;
        self->_displayRect.size.CGFloat height = height;
      }

      uint64_t v15 = v28 + v27;
    }
    while (v28 + v27 < v7);
  }
}

- (void)updateEmojiDisplay:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(EMKTextView *)self layoutManager];
  p_displayRect = &self->_displayRect;
  if (CGRectIsNull(self->_displayRect)) {
    [(EMKTextView *)self calculateDisplayRect];
  }
  v19.origin.double x = p_displayRect->origin.x;
  v19.origin.double y = self->_displayRect.origin.y;
  v19.size.CGFloat width = self->_displayRect.size.width;
  v19.size.CGFloat height = self->_displayRect.size.height;
  if (!CGRectIsEmpty(v19))
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    unint64_t v6 = [(EMKTextView *)self subviews];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          double v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          objc_msgSend(v11, "convertRect:fromView:", self, p_displayRect->origin.x, self->_displayRect.origin.y, self->_displayRect.size.width, self->_displayRect.size.height);
          objc_msgSend(v11, "setNeedsDisplayInRect:");
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  if (([v4 isEmojiAnimationActive] & 1) == 0)
  {
    [(NSTimer *)self->_timer invalidate];
    timer = self->_timer;
    self->_timer = 0;
  }
}

- (void)_startTextKit1EmojiDisplayUpdateTimer:(id)a3
{
  CGSize v4 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  self->_displayRect.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  self->_displayRect.size = v4;
  if (!self->_timer)
  {
    char v5 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel_updateEmojiDisplay_ selector:0 userInfo:1 repeats:0.0166666667];
    timer = self->_timer;
    self->_timer = v5;
  }
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CAC0], "mainRunLoop", a3);
  [v7 addTimer:self->_timer forMode:*MEMORY[0x1E4F43EA8]];

  [(EMKTextView *)self dismissOverlayView];
}

- (void)_stopTextKit1EmojiDisplayUpdateTimer:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(EMKTextView *)self setNeedsDisplay];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  CGSize v4 = [(EMKTextView *)self subviews];
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
        [*(id *)(*((void *)&v10 + 1) + 8 * v8++) setNeedsDisplay];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  [(NSTimer *)self->_timer invalidate];
  timer = self->_timer;
  self->_timer = 0;

  [(EMKTextView *)self dismissOverlayView];
}

- (void)_emojifyingDisabled:(id)a3
{
  [(EMKTextView *)self dismissOverlayView];
  [(EMKTextView *)self _stopTextKit1EmojiDisplayUpdateTimer:0];
}

- (void)setEmojiConversionLanguagesForKeyboardShow:(id)a3
{
}

- (void)_keyboardDidShow:(id)a3
{
  id v3 = (id)[MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel_setEmojiConversionLanguagesForKeyboardShow_ selector:0 userInfo:0 repeats:0.01];
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)EMKTextView;
  [(EMKTextView *)&v3 didMoveToWindow];
  [(EMKTextView *)self dismissOverlayView];
}

- (void)didMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)EMKTextView;
  [(EMKTextView *)&v3 didMoveToSuperview];
  [(EMKTextView *)self dismissOverlayView];
}

- (void)deleteBackward
{
  v3.receiver = self;
  v3.super_class = (Class)EMKTextView;
  [(EMKTextView *)&v3 deleteBackward];
  [(EMKTextView *)self dismissOverlayView];
}

- (EMKTextView)init
{
  return -[EMKTextView initWithFrame:textContainer:](self, "initWithFrame:textContainer:", 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (id)initUsingTextLayoutManagerWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)EMKTextView;
  uint64_t v8 = -[EMKTextView initWithFrame:textContainer:](&v11, sel_initWithFrame_textContainer_, a4);
  uint64_t v9 = v8;
  if (v8) {
    -[EMKTextView setupLayoutManagerWithFrame:](v8, "setupLayoutManagerWithFrame:", x, y, width, height);
  }
  return v9;
}

- (EMKTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  long long v10 = [v9 layoutManager];
  objc_super v11 = [v10 textStorage];
  long long v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
  if (v9 && v10 && v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v13 = v11;
    id v14 = v9;
  }
  else
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4FB08B8]);

    id v14 = objc_alloc_init(MEMORY[0x1E4FB0880]);
    objc_msgSend(v14, "setSize:", width, 1.79769313e308);
    [v14 setWidthTracksTextView:1];
    if (([(EMKTextView *)self isScrollEnabled] & 1) == 0) {
      [v14 setHeightTracksTextView:1];
    }
    uint64_t v15 = objc_alloc_init(EMKLayoutManager);

    [(EMKLayoutManager *)v15 setAllowsNonContiguousLayout:1];
    [(EMKLayoutManager *)v15 addTextContainer:v14];
    [v13 addLayoutManager:v15];
    long long v10 = v15;
  }
  v22.receiver = self;
  v22.super_class = (Class)EMKTextView;
  long long v16 = -[EMKTextView initWithFrame:textContainer:](&v22, sel_initWithFrame_textContainer_, v14, x, y, width, height);
  uint64_t v17 = v16;
  if (v16)
  {
    __commonInit(v16);
    v17->_tappedGlyphIndedouble x = 0x7FFFFFFFFFFFFFFFLL;
    v17->_tappedGlyphRange = (_NSRange)xmmword_1E4A6E060;
    CGSize v18 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v17->_displayRect.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v17->_displayRect.size = v18;
    v17->_emojiConversionActive = 0;
    CGRect v19 = [(EMKTextView *)v17 layoutManager];
    [v12 addObserver:v17 selector:sel__startTextKit1EmojiDisplayUpdateTimer_ name:@"EMKStartTimerNotificationName" object:v19];

    v20 = [(EMKTextView *)v17 layoutManager];
    [v12 addObserver:v17 selector:sel__stopTextKit1EmojiDisplayUpdateTimer_ name:@"EMKStopTimerNotificationName" object:v20];

    [v12 addObserver:v17 selector:sel__emojifyingDisabled_ name:@"EMKEmojiConversionDisabledNotificationName" object:0];
    [v12 addObserver:v17 selector:sel__showEmojiSuggestionsForInputModeChange_ name:*MEMORY[0x1E4F43E60] object:0];
    [v12 addObserver:v17 selector:sel__keyboardDidShow_ name:*MEMORY[0x1E4F43AC8] object:0];
    [(EMKTextView *)v17 setEmojiConversionLanguagesAndActivateConversion:1];
  }

  return v17;
}

- (void)replaceRange:(_NSRange)a3 withEmojiToken:(id)a4 language:(id)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v31 = a4;
  id v30 = a5;
  id v9 = [(EMKTextView *)self textStorage];
  uint64_t v27 = [v9 string];
  long long v10 = [v31 string];
  uint64_t v28 = [(EMKTextView *)self layoutManager];
  long long v26 = [v28 attributes];
  uint64_t v11 = [v10 length];
  long long v12 = [EMKEmojiSignifier alloc];
  id v13 = objc_msgSend(v9, "attributedSubstringFromRange:", location, length);
  id v14 = [v13 string];
  CGRect v29 = [(EMKEmojiSignifier *)v12 initWithString:v14];

  uint64_t v15 = [(EMKTextView *)self beginningOfDocument];
  long long v16 = [(EMKTextView *)self positionFromPosition:v15 offset:location];
  uint64_t v17 = [(EMKTextView *)self beginningOfDocument];
  CGSize v18 = [(EMKTextView *)self positionFromPosition:v17 offset:location + length];
  CGRect v19 = [(EMKTextView *)self textRangeFromPosition:v16 toPosition:v18];

  v20 = [(EMKTextView *)self inputDelegate];
  [v20 textWillChange:self];

  [(EMKTextView *)self replaceRange:v19 withText:v10];
  double v21 = [(EMKTextView *)self inputDelegate];
  [v21 textDidChange:self];

  unint64_t v22 = [v9 length];
  unint64_t v23 = [v26 length];
  if (v11 + location <= v22 && v11 + location <= v23)
  {
    BOOL v24 = objc_msgSend(v27, "substringWithRange:", location, v11);
    int v25 = [v24 isEqualToString:v10];

    if (v25)
    {
      objc_msgSend(v26, "addAttribute:value:range:", @"EMKEmojiSignifier", v29, location, v11);
      if (v30) {
        objc_msgSend(v26, "addAttribute:value:range:", @"EMKEmojiConversionLanguage", v30, location, v11);
      }
    }
  }
  [(EMFEmojiPreferences *)self->_emojiPreferences didUseEmoji:v31 usageMode:*MEMORY[0x1E4F61060]];
}

- (CGRect)anchorRect
{
  if (self->_tappedGlyphIndex == 0x7FFFFFFFFFFFFFFFLL
    || (p_tappedGlyphRange = &self->_tappedGlyphRange, self->_tappedGlyphRange.location == 0x7FFFFFFFFFFFFFFFLL)
    || !self->_tappedGlyphRange.length)
  {
    double v15 = *MEMORY[0x1E4F1DB28];
    double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v18 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  else
  {
    [(EMKTextView *)self textContainerInset];
    double v5 = v4;
    double v7 = v6;
    uint64_t v8 = [(EMKTextView *)self layoutManager];
    id v9 = [(EMKTextView *)self textContainer];
    objc_msgSend(v8, "boundingRectForGlyphRange:inTextContainer:", self->_tappedGlyphIndex, 1, v9);
    uint64_t v24 = 0;
    int v25 = (double *)&v24;
    uint64_t v26 = 0x4010000000;
    uint64_t v27 = &unk_1E4A6F05E;
    uint64_t v28 = v10;
    uint64_t v29 = v11;
    uint64_t v30 = v12;
    uint64_t v31 = v13;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __25__EMKTextView_anchorRect__block_invoke;
    v23[3] = &unk_1E6E972F8;
    v23[5] = v10;
    v23[6] = v11;
    v23[7] = v12;
    v23[8] = v13;
    v23[4] = &v24;
    objc_msgSend(v8, "enumerateEnclosingRectsForGlyphRange:withinSelectedGlyphRange:inTextContainer:usingBlock:", p_tappedGlyphRange->location, p_tappedGlyphRange->length, 0x7FFFFFFFFFFFFFFFLL, 0, v9, v23);
    id v14 = v25;
    double v15 = v7 + v25[4];
    double v16 = v5 + v25[5];
    v25[4] = v15;
    v14[5] = v16;
    double v17 = v14[6];
    double v18 = v14[7];
    _Block_object_dispose(&v24, 8);
  }
  double v19 = v15;
  double v20 = v16;
  double v21 = v17;
  double v22 = v18;
  result.size.double height = v22;
  result.size.double width = v21;
  result.origin.double y = v20;
  result.origin.double x = v19;
  return result;
}

BOOL __25__EMKTextView_anchorRect__block_invoke(uint64_t a1, unsigned char *a2, double a3, double a4, double a5, double a6)
{
  BOOL result = CGRectIntersectsRect(*(CGRect *)&a3, *(CGRect *)(a1 + 40));
  if (result)
  {
    uint64_t v13 = *(double **)(*(void *)(a1 + 32) + 8);
    v13[4] = a3;
    v13[5] = a4;
    v13[6] = a5;
    v13[7] = a6;
    *a2 = 1;
  }
  return result;
}

- (id)personalizedEmojiTokenListForList:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  double v4 = [MEMORY[0x1E4F1CA48] array];
  double v22 = [MEMORY[0x1E4F42B18] sharedInstance];
  if (!personalizedEmojiTokenListForList__fistEmoji)
  {
    uint64_t v5 = [MEMORY[0x1E4F610A0] emojiTokenWithString:@"✊" localeData:0];
    double v6 = (void *)personalizedEmojiTokenListForList__fistEmoji;
    personalizedEmojiTokenListForList__fistEmojuint64_t i = v5;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  double v21 = v3;
  double v7 = [v3 emojiTokenArray];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
  unint64_t v9 = 0x1EAE87000uLL;
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(id *)(*((void *)&v24 + 1) + 8 * i);
        if (![v13 skinTone]
          || ([v13 isEqualIgnoringModifiers:*(void *)(v9 + 1416)] & 1) == 0)
        {
          id v14 = [(EMFEmojiPreferences *)self->_emojiPreferences lastUsedVariantEmojiForEmoji:v13];

          if (v14 && ![v14 isEqual:v13])
          {
            id v13 = v14;
          }
          else
          {
            double v15 = [v13 string];
            double v16 = [v22 lastUsedVariantEmojiForEmojiString:v15];

            if (v16)
            {
              double v17 = (void *)MEMORY[0x1E4F610A0];
              uint64_t v18 = [v13 localeData];
              id v13 = [v17 emojiTokenWithString:v16 localeData:v18];

              id v14 = (void *)v18;
              unint64_t v9 = 0x1EAE87000;
            }
            else
            {
              id v13 = v13;
            }
          }
        }
        [v4 addObject:v13];
      }
      uint64_t v10 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v10);
  }

  double v19 = [[EMKEmojiTokenList alloc] initWithEmojiTokenArray:v4];
  return v19;
}

- (void)textTapGestureRecognized:(id)a3
{
  v74[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  textKit2Controller = self->_textKit2Controller;
  if (!textKit2Controller)
  {
    [v4 locationInView:self];
    double v7 = v6;
    double v9 = v8;
    [(EMKTextView *)self textContainerInset];
    double v11 = v10;
    double v13 = v12;
    id v14 = [(EMKTextView *)self textStorage];
    double v15 = [(EMKTextView *)self layoutManager];
    v65 = [v15 attributes];
    v64 = [v14 string];
    unint64_t v16 = [v14 length];
    unint64_t v17 = [v65 length];
    uint64_t v18 = [(EMKTextView *)self textContainer];
    double v19 = v7 - v13;
    double v20 = v9 - v11;
    unint64_t v21 = objc_msgSend(v15, "characterIndexForPoint:inTextContainer:fractionOfDistanceBetweenInsertionPoints:", v18, 0, v19, v20);
    unint64_t v22 = [v15 glyphIndexForCharacterAtIndex:v21];
    objc_msgSend(v15, "boundingRectForGlyphRange:inTextContainer:", v22, 1, v18);
    if (!self->_emojiConversionActive) {
      goto LABEL_24;
    }
    CGFloat v27 = v23;
    CGFloat v28 = v24;
    CGFloat v29 = v25;
    CGFloat v30 = v26;
    if (![v15 isEmojiConversionEnabled]) {
      goto LABEL_24;
    }
    v76.origin.double x = v27;
    v76.origin.double y = v28;
    v76.size.double width = v29;
    v76.size.double height = v30;
    v75.double x = v19;
    v75.double y = v20;
    if (!CGRectContainsPoint(v76, v75)
      || v21 >= v16
      || v21 >= v17
      || ([MEMORY[0x1E4F42810] sharedCalloutBarIsVisible] & 1) != 0)
    {
      goto LABEL_24;
    }
    v63 = objc_msgSend(v65, "attribute:atIndex:effectiveRange:");
    v60 = [v65 attribute:@"EMKEmojiConversionLanguage" atIndex:v21 effectiveRange:0];
    v61 = objc_msgSend(v65, "attribute:atIndex:effectiveRange:");
    long long v73 = 0uLL;
    if ([v63 count])
    {
      v62 = [(EMKTextView *)self personalizedEmojiTokenListForList:v63];

      uint64_t v31 = [v62 count];
      id v32 = (id)objc_msgSend(v65, "attribute:atIndex:longestEffectiveRange:inRange:", @"EMKEmojiTokenList", v21, &v73, 0, v17);
      if (*((void *)&v73 + 1) + (void)v73 > v16 || !v31) {
        goto LABEL_23;
      }
      if (v31 == 1)
      {
        id v33 = [v62 emojiTokenAtIndex:0];
        [(EMKTextView *)self replaceRange:v73 withEmojiToken:v33 language:v60];
      }
      else
      {
        v44 = objc_msgSend(v64, "substringWithRange:");
        self->_tappedGlyphIndedouble x = v22;
        self->_tappedGlyphRange.id location = [v15 glyphRangeForCharacterRange:v73 actualCharacterRange:0];
        self->_tappedGlyphRange.NSUInteger length = v45;
        objc_initWeak(&location, self);
        v46 = [EMKOverlayView alloc];
        [(EMKTextView *)self anchorRect];
        double v48 = v47;
        double v50 = v49;
        double v52 = v51;
        double v54 = v53;
        v66[0] = MEMORY[0x1E4F143A8];
        v66[1] = 3221225472;
        v66[2] = __40__EMKTextView_textTapGestureRecognized___block_invoke;
        v66[3] = &unk_1E6E971D8;
        objc_copyWeak(&v70, &location);
        long long v71 = v73;
        id v67 = v64;
        id v33 = v44;
        id v68 = v33;
        id v69 = v60;
        v55 = -[EMKOverlayView initWithView:anchorRect:emojiTokenList:selectionHandler:](v46, "initWithView:anchorRect:emojiTokenList:selectionHandler:", self, v62, v66, v48, v50, v52, v54);
        overlayView = self->_overlayView;
        self->_overlayView = v55;

        objc_destroyWeak(&v70);
        objc_destroyWeak(&location);
      }
    }
    else
    {
      if (!v61
        || (id v34 = (id)objc_msgSend(v65, "attribute:atIndex:longestEffectiveRange:inRange:", @"EMKEmojiSignifier", v21, &v73, 0, v17), *((void *)&v73 + 1) + (void)v73 > v16))
      {
        v62 = v63;
LABEL_23:

LABEL_24:
        goto LABEL_25;
      }
      v35 = [(EMKTextView *)self beginningOfDocument];
      v36 = [(EMKTextView *)self positionFromPosition:v35 offset:(void)v73];
      v37 = [(EMKTextView *)self beginningOfDocument];
      v38 = [(EMKTextView *)self positionFromPosition:v37 offset:*((void *)&v73 + 1) + (void)v73];
      id v33 = [(EMKTextView *)self textRangeFromPosition:v36 toPosition:v38];

      v39 = [v15 emojiConversionLanguages];
      if (v60)
      {
        v74[0] = v60;
        v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:1];
        [v15 setEmojiConversionLanguages:v40];

        v41 = [(EMKTextView *)self inputDelegate];
        [v41 textWillChange:self];

        v42 = [v61 string];
        [(EMKTextView *)self replaceRange:v33 withText:v42];

        v43 = [(EMKTextView *)self inputDelegate];
        [v43 textDidChange:self];

        [v15 setEmojiConversionLanguages:v39];
      }
      else
      {
        v57 = [(EMKTextView *)self inputDelegate];
        [v57 textWillChange:self];

        v58 = [v61 string];
        [(EMKTextView *)self replaceRange:v33 withText:v58];

        v59 = [(EMKTextView *)self inputDelegate];
        [v59 textDidChange:self];
      }
      v62 = v63;
    }

    goto LABEL_23;
  }
  [(_EMKTextKit2Controller *)textKit2Controller textTapGestureRecognized:v4];
LABEL_25:
}

void __40__EMKTextView_textTapGestureRecognized___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = (void *)WeakRetained[347];
    WeakRetained[347] = 0;

    v4[348] = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v9)
  {
    unint64_t v6 = *(void *)(a1 + 72) + *(void *)(a1 + 64);
    if (v6 <= [*(id *)(a1 + 32) length])
    {
      double v7 = *(void **)(a1 + 40);
      double v8 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", *(void *)(a1 + 64), *(void *)(a1 + 72));
      LODWORD(v7) = [v7 isEqualToString:v8];

      if (v7) {
        objc_msgSend(v4, "replaceRange:withEmojiToken:language:", *(void *)(a1 + 64), *(void *)(a1 + 72), v9, *(void *)(a1 + 48));
      }
    }
  }
}

- (void)updateOverlayView:(id)a3
{
  overlayView = self->_overlayView;
  if (overlayView)
  {
    [(EMKTextView *)self anchorRect];
    -[EMKOverlayView setView:anchorRect:](overlayView, "setView:anchorRect:", self);
  }
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)EMKTextView;
  [(EMKTextView *)&v5 layoutSubviews];
  textKit2Controller = self->_textKit2Controller;
  if (textKit2Controller)
  {
    [(_EMKTextKit2Controller *)textKit2Controller textViewDidLayoutSubviews];
  }
  else if (self->_overlayView)
  {
    id v4 = (id)[MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel_updateOverlayView_ selector:0 userInfo:0 repeats:0.01];
  }
}

- (BOOL)touchHasEmojiSignificance:(id)a3
{
  textKit2Controller = self->_textKit2Controller;
  if (textKit2Controller)
  {
    return [(_EMKTextKit2Controller *)textKit2Controller touchHasEmojiSignificance:a3];
  }
  else
  {
    [a3 locationInView:self];
    double v7 = v6;
    double v9 = v8;
    [(EMKTextView *)self textContainerInset];
    double v11 = v10;
    double v13 = v12;
    id v14 = [(EMKTextView *)self textStorage];
    double v15 = [(EMKTextView *)self layoutManager];
    unint64_t v16 = [v15 attributes];
    unint64_t v17 = [v14 length];
    unint64_t v18 = [v16 length];
    double v19 = [(EMKTextView *)self textContainer];
    double v20 = v7 - v13;
    double v21 = v9 - v11;
    unint64_t v22 = objc_msgSend(v15, "characterIndexForPoint:inTextContainer:fractionOfDistanceBetweenInsertionPoints:", v19, 0, v20, v21);
    objc_msgSend(v15, "boundingRectForGlyphRange:inTextContainer:", objc_msgSend(v15, "glyphIndexForCharacterAtIndex:", v22), 1, v19);
    if (self->_emojiConversionActive
      && (CGFloat v27 = v23, v28 = v24, v29 = v25, v30 = v26, [v15 isEmojiConversionEnabled]))
    {
      v36.origin.double x = v27;
      v36.origin.double y = v28;
      v36.size.double width = v29;
      v36.size.double height = v30;
      v35.double x = v20;
      v35.double y = v21;
      BOOL v31 = 0;
      if (CGRectContainsPoint(v36, v35) && v22 < v17 && v22 < v18)
      {
        uint64_t v32 = [v16 attribute:@"EMKEmojiTokenList" atIndex:v22 effectiveRange:0];
        uint64_t v33 = [v16 attribute:@"EMKEmojiSignifier" atIndex:v22 effectiveRange:0];
        BOOL v31 = (v32 | v33) != 0;
      }
    }
    else
    {
      BOOL v31 = 0;
    }

    return v31;
  }
}

- (BOOL)_shouldSuppressSelectionCommands
{
  return self->_overlayView != 0;
}

- (void)setPreFrames:(unint64_t)a3
{
  id v4 = [(EMKTextView *)self layoutManager];
  [v4 setPreFrames:a3];
}

- (void)setPostFrames:(unint64_t)a3
{
  id v4 = [(EMKTextView *)self layoutManager];
  [v4 setPostFrames:a3];
}

- (void)setDelayFrames:(unint64_t)a3
{
  id v4 = [(EMKTextView *)self layoutManager];
  [v4 setDelayFrames:a3];
}

- (EMKTextViewEmojiAnimationDelegate)emojiAnimationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_emojiAnimationDelegate);
  return (EMKTextViewEmojiAnimationDelegate *)WeakRetained;
}

- (void)setEmojiAnimationDelegate:(id)a3
{
}

- (EMFEmojiPreferences)emojiPreferences
{
  return (EMFEmojiPreferences *)objc_getProperty(self, a2, 2888, 1);
}

@end