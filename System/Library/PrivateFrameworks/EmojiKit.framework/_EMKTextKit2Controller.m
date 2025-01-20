@interface _EMKTextKit2Controller
+ (OS_os_log)log;
- (BOOL)isDarkModeEnabled;
- (BOOL)isEmojiAnimationActive;
- (BOOL)isEmojiConversionActive;
- (BOOL)isEmojiConversionEnabled;
- (BOOL)isUsingTextEffectBasedEmojiAnimations;
- (BOOL)textContentManager:(id)a3 shouldEnumerateTextElement:(id)a4 options:(unint64_t)a5;
- (BOOL)touchHasEmojiSignificance:(id)a3;
- (EMFEmojiPreferences)emojiPreferences;
- (EMKGlyphRippler)rippler;
- (EMKOverlayView)overlayView;
- (EMKRippleAnimationCoordinator)rippleCoordinator;
- (EMKTextEnumerator)textEnumerator;
- (EMKTextView)textView;
- (NSArray)emojiConversionLanguages;
- (NSTextLayoutManager)_layoutManager;
- (NSTimer)rippleTimer;
- (UIView)textContainerOverlayView;
- (_EMKTextContainerOverlayView)containerOverlayView;
- (_EMKTextKit2Controller)initWithTextView:(id)a3 emojiPreferences:(id)a4;
- (_EMKTouchInfo)lastTouchInfo;
- (id)textContentStorage:(id)a3 textParagraphWithRange:(_NSRange)a4;
- (void)__rippleCoordinatorDidCompleteWithFinished:(BOOL)a3;
- (void)__startAnimation;
- (void)__startLegacyRippleAnimation;
- (void)__startTextEffectBasedAnimation;
- (void)__stopAnimation;
- (void)_startOrStopAnimation;
- (void)_startRippleAnimation;
- (void)_updateEmojiAttributesOfText:(id)a3;
- (void)_updateOverlayView;
- (void)dismissOverlayView;
- (void)replaceRange:(_NSRange)a3 withEmojiToken:(id)a4 language:(id)a5;
- (void)setContainerOverlayView:(id)a3;
- (void)setDarkModeEnabled:(BOOL)a3;
- (void)setEmojiAnimationActive:(BOOL)a3;
- (void)setEmojiConversionActive:(BOOL)a3;
- (void)setEmojiConversionEnabled:(BOOL)a3;
- (void)setEmojiConversionLanguages:(id)a3;
- (void)setEmojiPreferences:(id)a3;
- (void)setLastTouchInfo:(id)a3;
- (void)setOverlayView:(id)a3;
- (void)setRippleCoordinator:(id)a3;
- (void)setRippleTimer:(id)a3;
- (void)setRippler:(id)a3;
- (void)setTextContainerOverlayView:(id)a3;
- (void)setTextEnumerator:(id)a3;
- (void)setTextView:(id)a3;
- (void)textTapGestureRecognized:(id)a3;
- (void)textViewDidLayoutSubviews;
- (void)updateEmojiDisplay:(id)a3;
@end

@implementation _EMKTextKit2Controller

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rippleCoordinator, 0);
  objc_storeStrong((id *)&self->_lastTouchInfo, 0);
  objc_storeStrong((id *)&self->_textEnumerator, 0);
  objc_storeStrong((id *)&self->_rippler, 0);
  objc_storeStrong((id *)&self->_rippleTimer, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_emojiPreferences, 0);
  objc_storeStrong((id *)&self->_containerOverlayView, 0);
  objc_destroyWeak((id *)&self->_textView);
  objc_storeStrong((id *)&self->_emojiConversionLanguages, 0);
  objc_storeStrong((id *)&self->_textContainerOverlayView, 0);
}

- (void)setEmojiConversionLanguages:(id)a3
{
}

- (void)setEmojiConversionActive:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v5 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = v3;
    _os_log_impl(&dword_1E4A5E000, v5, OS_LOG_TYPE_DEFAULT, "setEmojiConversionActive: %{BOOL}d", (uint8_t *)v9, 8u);
  }

  if (self->_emojiConversionActive != v3)
  {
    self->_emojiConversionActive = v3;
    if (v3)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
      v7 = [WeakRetained textStorage];
      [(_EMKTextKit2Controller *)self _updateEmojiAttributesOfText:v7];
    }
    v8 = [(_EMKTextKit2Controller *)self _layoutManager];
    if (v8) {
      [(_EMKTextKit2Controller *)self _startOrStopAnimation];
    }
  }
}

- (void)setDarkModeEnabled:(BOOL)a3
{
  self->_darkModeEnabled = a3;
}

+ (OS_os_log)log
{
  if (log_onceToken != -1) {
    dispatch_once(&log_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)log_logger;
  return (OS_os_log *)v2;
}

- (_EMKTextKit2Controller)initWithTextView:(id)a3 emojiPreferences:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)_EMKTextKit2Controller;
  v8 = [(_EMKTextKit2Controller *)&v20 init];
  if (v8)
  {
    v9 = objc_alloc_init(EMKGlyphRippler);
    rippler = v8->_rippler;
    v8->_rippler = v9;

    objc_storeWeak((id *)&v8->_textView, v6);
    objc_storeStrong((id *)&v8->_emojiPreferences, a4);
    v11 = [[EMKTextEnumerator alloc] initWithEmojiPreferences:v7];
    textEnumerator = v8->_textEnumerator;
    v8->_textEnumerator = v11;

    emojiConversionLanguages = v8->_emojiConversionLanguages;
    v8->_emojiConversionLanguages = (NSArray *)&unk_1F40657D8;

    *(_DWORD *)&v8->_darkModeEnabled = 256;
    lastTouchInfo = v8->_lastTouchInfo;
    v8->_lastTouchInfo = 0;

    overlayView = v8->_overlayView;
    v8->_overlayView = 0;

    containerOverlayView = v8->_containerOverlayView;
    v8->_containerOverlayView = 0;

    v17 = [v6 textLayoutManager];
    v18 = [v17 textContentManager];
    [v18 setDelegate:v8];
    if (objc_opt_respondsToSelector()) {
      [v17 setRequiresCTLineRef:1];
    }
  }
  return v8;
}

- (NSTextLayoutManager)_layoutManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  BOOL v3 = [WeakRetained textLayoutManager];

  return (NSTextLayoutManager *)v3;
}

- (void)_startRippleAnimation
{
  if ([(_EMKTextKit2Controller *)self isUsingTextEffectBasedEmojiAnimations])
  {
    [(_EMKTextKit2Controller *)self __startTextEffectBasedAnimation];
  }
  else
  {
    [(_EMKTextKit2Controller *)self __startLegacyRippleAnimation];
  }
}

- (void)__startTextEffectBasedAnimation
{
  BOOL v3 = [(_EMKTextKit2Controller *)self textView];
  v4 = [v3 textStorage];
  uint64_t v5 = [v4 length];
  id v6 = [v3 emojiAnimationDelegate];
  [v6 textViewWillBeginEmojiRippleAnimation:v3];

  id v7 = objc_opt_new();
  [v4 beginEditing];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __57___EMKTextKit2Controller___startTextEffectBasedAnimation__block_invoke;
  v23[3] = &unk_1E6E97098;
  id v8 = v4;
  id v24 = v8;
  id v25 = v7;
  id v9 = v7;
  objc_msgSend(v8, "_enumerateTokenListsInRange:usingBlock_emk:", 0, v5, v23);
  [v8 endEditing];
  uint64_t v10 = [(_EMKTextKit2Controller *)self textView];
  [v10 setNeedsLayout];

  v11 = [(_EMKTextKit2Controller *)self textView];
  [v11 layoutIfNeeded];

  v12 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4A5E000, v12, OS_LOG_TYPE_DEFAULT, "creating coordinator", buf, 2u);
  }

  v13 = [EMKRippleAnimationCoordinator alloc];
  v14 = [(_EMKTextKit2Controller *)self textView];
  v15 = [MEMORY[0x1E4F428B8] colorWithRed:1.0 green:0.498039216 blue:0.0 alpha:1.0];
  v16 = [(id)objc_opt_class() log];
  v17 = [(EMKRippleAnimationCoordinator *)v13 initWithTextView:v14 animations:v9 foregroundColor:v15 log:v16];
  [(_EMKTextKit2Controller *)self setRippleCoordinator:v17];

  v18 = [(_EMKTextKit2Controller *)self rippleCoordinator];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __57___EMKTextKit2Controller___startTextEffectBasedAnimation__block_invoke_46;
  v20[3] = &unk_1E6E970C0;
  v20[4] = self;
  id v21 = v3;
  id v19 = v3;
  [v18 startWithCompletionHandler:v20];
}

- (void)__startLegacyRippleAnimation
{
  rippleTimer = self->_rippleTimer;
  if (rippleTimer)
  {
    [(NSTimer *)rippleTimer invalidate];
    [(_EMKTextKit2Controller *)self setRippleTimer:0];
  }
  else
  {
    v4 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel_updateEmojiDisplay_ selector:0 userInfo:1 repeats:0.0166666667];
    uint64_t v5 = self->_rippleTimer;
    self->_rippleTimer = v4;

    id v6 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [v6 addTimer:self->_rippleTimer forMode:*MEMORY[0x1E4F43EA8]];
  }
}

- (void)updateEmojiDisplay:(id)a3
{
  char v4 = 0;
  [(_EMKTextContainerOverlayView *)self->_containerOverlayView updateAnimationAndGetFinished:&v4];
  if (v4)
  {
    [(_EMKTextKit2Controller *)self setEmojiAnimationActive:0];
    [(_EMKTextKit2Controller *)self __stopAnimation];
  }
}

- (void)_updateEmojiAttributesOfText:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v24 = self;
    _os_log_impl(&dword_1E4A5E000, v5, OS_LOG_TYPE_DEFAULT, "%p _updateEmojiAttributesOfText", buf, 0xCu);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  obj = self->_emojiConversionLanguages;
  uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * v9);
        textEnumerator = self->_textEnumerator;
        v12 = [v4 string];
        uint64_t v13 = [v4 length];
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __55___EMKTextKit2Controller__updateEmojiAttributesOfText___block_invoke;
        v15[3] = &unk_1E6E970E8;
        id v16 = v4;
        uint64_t v17 = v10;
        -[EMKTextEnumerator enumerateEmojiSignifiersInString:touchingRange:language:usingBlock:](textEnumerator, "enumerateEmojiSignifiersInString:touchingRange:language:usingBlock:", v12, 0, v13, v10, v15);

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }
}

- (BOOL)isUsingTextEffectBasedEmojiAnimations
{
  v2 = [(_EMKTextKit2Controller *)self textView];
  char v3 = [v2 isUsingTextEffectBasedEmojiAnimations];

  return v3;
}

- (void)_startOrStopAnimation
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL emojiAnimationActive = self->_emojiAnimationActive;
  BOOL emojiConversionActive = self->_emojiConversionActive;
  BOOL v5 = self->_emojiConversionActive && !self->_emojiAnimationActive;
  BOOL v6 = self->_emojiAnimationActive && !self->_emojiConversionActive;
  uint64_t v7 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = self->_emojiAnimationActive;
    BOOL v9 = self->_emojiConversionActive;
    int v16 = 67109376;
    *(_DWORD *)uint64_t v17 = v8;
    *(_WORD *)&v17[4] = 1024;
    *(_DWORD *)&v17[6] = v9;
    _os_log_impl(&dword_1E4A5E000, v7, OS_LOG_TYPE_DEFAULT, "_startOrStopAnimation: _emojiAnimationActive: %{BOOL}d - _emojiConversionActive: %{BOOL}d", (uint8_t *)&v16, 0xEu);
  }
  int v10 = emojiAnimationActive || emojiConversionActive;

  v11 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 67109632;
    *(_DWORD *)uint64_t v17 = v6;
    *(_WORD *)&v17[4] = 1024;
    *(_DWORD *)&v17[6] = v5;
    __int16 v18 = 1024;
    BOOL v19 = v10 == 0;
    _os_log_impl(&dword_1E4A5E000, v11, OS_LOG_TYPE_DEFAULT, "_startOrStopAnimation: stopAnimation: %{BOOL}d - startAnimation: %{BOOL}d - hideHighlight: %{BOOL}d", (uint8_t *)&v16, 0x14u);
  }

  if (v6)
  {
    [(_EMKTextKit2Controller *)self __stopAnimation];
  }
  else if (v5)
  {
    [(_EMKTextKit2Controller *)self __startAnimation];
  }
  else if (!v10)
  {
    if ([(_EMKTextKit2Controller *)self isUsingTextEffectBasedEmojiAnimations])
    {
      v12 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = [(_EMKTextKit2Controller *)self rippleCoordinator];
        int v16 = 138412290;
        *(void *)uint64_t v17 = v13;
        _os_log_impl(&dword_1E4A5E000, v12, OS_LOG_TYPE_DEFAULT, "self.rippleCoordinator: %@", (uint8_t *)&v16, 0xCu);
      }
      v14 = [(_EMKTextKit2Controller *)self rippleCoordinator];
      [v14 cleanupIncludingFilterEffect:1];

      [(_EMKTextKit2Controller *)self setRippleCoordinator:0];
    }
    else
    {
      v15 = [(_EMKTextKit2Controller *)self textView];
      objc_msgSend(v15, "_setTokenListsHighlighted_emk:rippler:", 0, self->_rippler);
    }
  }
}

- (void)setTextContainerOverlayView:(id)a3
{
  BOOL v5 = (UIView *)a3;
  textContainerOverlayView = self->_textContainerOverlayView;
  if (textContainerOverlayView != v5)
  {
    [(UIView *)textContainerOverlayView removeFromSuperview];
    objc_storeStrong((id *)&self->_textContainerOverlayView, a3);
    uint64_t v7 = [(_EMKTextKit2Controller *)self textView];
    BOOL v8 = [v7 _containerView];
    [v8 frame];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;

    -[UIView setFrame:](self->_textContainerOverlayView, "setFrame:", v10, v12, v14, v16);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
    [WeakRetained addSubview:self->_textContainerOverlayView];
  }
  MEMORY[0x1F41817F8]();
}

- (UIView)textContainerOverlayView
{
  return self->_textContainerOverlayView;
}

- (void)__rippleCoordinatorDidCompleteWithFinished:(BOOL)a3
{
  [(_EMKTextKit2Controller *)self __stopAnimation];
  self->_BOOL emojiAnimationActive = 0;
  id v4 = [(_EMKTextKit2Controller *)self rippleCoordinator];
  [v4 cleanupIncludingFilterEffect:!self->_emojiConversionActive];
}

- (void)__stopAnimation
{
  char v3 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_1E4A5E000, v3, OS_LOG_TYPE_DEFAULT, "Stopping animation", v7, 2u);
  }

  self->_BOOL emojiAnimationActive = 0;
  if ([(_EMKTextKit2Controller *)self isUsingTextEffectBasedEmojiAnimations])
  {
    id v4 = [(_EMKTextKit2Controller *)self rippleCoordinator];
    [v4 stop];
  }
  else
  {
    [(NSTimer *)self->_rippleTimer invalidate];
    [(_EMKTextContainerOverlayView *)self->_containerOverlayView removeFromSuperview];
    containerOverlayView = self->_containerOverlayView;
    self->_containerOverlayView = 0;

    [(_EMKTextKit2Controller *)self setRippleTimer:0];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
    objc_msgSend(WeakRetained, "_setTokenListsHidden_emk:", 0);

    id v4 = objc_loadWeakRetained((id *)&self->_textView);
    objc_msgSend(v4, "_setTokenListsHighlighted_emk:rippler:", self->_emojiConversionActive, self->_rippler);
  }
}

- (void)__startAnimation
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  char v3 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    BOOL darkModeEnabled = self->_darkModeEnabled;
    *(_DWORD *)buf = 67109120;
    BOOL v25 = darkModeEnabled;
    _os_log_impl(&dword_1E4A5E000, v3, OS_LOG_TYPE_DEFAULT, "Starting animation with dark mode: %{BOOL}d", buf, 8u);
  }

  self->_BOOL emojiAnimationActive = 1;
  if ([(_EMKTextKit2Controller *)self isUsingTextEffectBasedEmojiAnimations])
  {
    BOOL v5 = [(_EMKTextKit2Controller *)self textView];
    [v5 setNeedsLayout];

    BOOL v6 = [(_EMKTextKit2Controller *)self textView];
    [v6 layoutIfNeeded];
  }
  else
  {
    [(EMKGlyphRippler *)self->_rippler startWithDarkMode:self->_darkModeEnabled];
    containerOverlayView = self->_containerOverlayView;
    if (!containerOverlayView)
    {
      BOOL v8 = [(_EMKTextKit2Controller *)self textView];
      double v9 = [v8 _containerView];
      [v9 frame];
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;

      __int16 v18 = -[_EMKTextContainerOverlayView initWithFrame:rippler:]([_EMKTextContainerOverlayView alloc], "initWithFrame:rippler:", self->_rippler, v11, v13, v15, v17);
      BOOL v19 = self->_containerOverlayView;
      self->_containerOverlayView = v18;

      id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
      [WeakRetained addSubview:self->_containerOverlayView];

      long long v21 = self->_containerOverlayView;
      id v22 = objc_loadWeakRetained((id *)&self->_textView);
      [(_EMKTextContainerOverlayView *)v21 prepareWithTextView:v22];

      containerOverlayView = self->_containerOverlayView;
    }
    [(_EMKTextContainerOverlayView *)containerOverlayView startAnimation];
    BOOL v6 = objc_loadWeakRetained((id *)&self->_textView);
    objc_msgSend(v6, "_setTokenListsHidden_emk:", 1);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42___EMKTextKit2Controller___startAnimation__block_invoke;
  block[3] = &unk_1E6E97110;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (BOOL)touchHasEmojiSignificance:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_EMKTextKit2Controller *)self isEmojiConversionActive]
    && [(_EMKTextKit2Controller *)self isEmojiConversionEnabled])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
    [v4 locationInView:WeakRetained];
    double v7 = v6;
    double v9 = v8;

    double v10 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v59.x = v7;
      v59.y = v9;
      double v11 = NSStringFromCGPoint(v59);
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = v4;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v11;
      _os_log_impl(&dword_1E4A5E000, v10, OS_LOG_TYPE_DEFAULT, "touchHasEmojiSignificance: %p - location: %@", buf, 0x16u);
    }
    id v12 = objc_loadWeakRetained((id *)&self->_textView);
    double v13 = [v12 textLayoutManager];
    double v14 = [v13 textContainer];

    id v15 = objc_loadWeakRetained((id *)&self->_textView);
    double v16 = [v15 textLayoutManager];

    double v17 = [v16 documentRange];
    [v16 ensureLayoutForRange:v17];
    __int16 v18 = [v17 location];
    BOOL v19 = objc_msgSend(v16, "lineFragmentRangeForPoint:inContainerAtLocation:", v18, v7, v9);

    uint64_t v20 = [(id)objc_opt_class() log];
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    if (v19)
    {
      if (v21)
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v19;
        _os_log_impl(&dword_1E4A5E000, v20, OS_LOG_TYPE_DEFAULT, "touchHasEmojiSignificance: => Touched line range: %@", buf, 0xCu);
      }

      uint64_t v48 = 0;
      v49 = &v48;
      uint64_t v50 = 0x3032000000;
      v51 = __Block_byref_object_copy_;
      v52 = __Block_byref_object_dispose_;
      id v53 = 0;
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x4010000000;
      v55 = &unk_1E4A6F05E;
      long long v22 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
      long long v56 = *MEMORY[0x1E4F1DB28];
      long long v57 = v22;
      v23 = [v19 location];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __52___EMKTextKit2Controller_touchHasEmojiSignificance___block_invoke;
      v41[3] = &unk_1E6E97160;
      id v24 = v16;
      id v42 = v24;
      v43 = self;
      double v46 = v7;
      double v47 = v9;
      v44 = &v48;
      v45 = buf;
      [v24 enumerateSubstringsFromLocation:v23 options:3 usingBlock:v41];

      BOOL v25 = (void *)v49[5];
      if (v25)
      {
        uint64_t v37 = 0;
        v38 = &v37;
        uint64_t v39 = 0x2020000000;
        char v40 = 0;
        uint64_t v26 = [v25 location];
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __52___EMKTextKit2Controller_touchHasEmojiSignificance___block_invoke_57;
        v31[3] = &unk_1E6E971B0;
        v31[4] = self;
        id v32 = v24;
        id v33 = v17;
        v34 = &v48;
        v35 = &v37;
        v36 = buf;
        id v27 = (id)[v32 enumerateTextLayoutFragmentsFromLocation:v26 options:0 usingBlock:v31];

        if (*((unsigned char *)v38 + 24))
        {
          BOOL v28 = 1;
        }
        else
        {
          lastTouchInfo = self->_lastTouchInfo;
          self->_lastTouchInfo = 0;

          BOOL v28 = *((unsigned char *)v38 + 24) != 0;
        }

        _Block_object_dispose(&v37, 8);
      }
      else
      {
        BOOL v28 = 0;
      }

      _Block_object_dispose(buf, 8);
      _Block_object_dispose(&v48, 8);
    }
    else
    {
      if (v21)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E4A5E000, v20, OS_LOG_TYPE_DEFAULT, "touchHasEmojiSignificance: => no line touched.", buf, 2u);
      }

      BOOL v28 = 0;
    }
  }
  else
  {
    BOOL v28 = 0;
  }

  return v28;
}

- (void)textTapGestureRecognized:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_emojiConversionEnabled && self->_emojiConversionActive) {
    int v5 = [MEMORY[0x1E4F42810] sharedCalloutBarIsVisible] ^ 1;
  }
  else {
    int v5 = 0;
  }
  double v6 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    lastTouchInfo = self->_lastTouchInfo;
    *(_DWORD *)buf = 138412802;
    id v35 = v4;
    __int16 v36 = 1024;
    int v37 = v5;
    __int16 v38 = 2112;
    uint64_t v39 = lastTouchInfo;
    _os_log_impl(&dword_1E4A5E000, v6, OS_LOG_TYPE_DEFAULT, "textTapGestureRecognized: %@ - shouldProcess: %{BOOL}d - lastTouchInfo: %@", buf, 0x1Cu);
  }

  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
    double v9 = [WeakRetained text];

    double v10 = (void *)[(_EMKTouchInfo *)self->_lastTouchInfo tokenListRange];
    id v12 = v11;
    double v13 = objc_msgSend(v9, "substringWithRange:", v10, v11);
    objc_initWeak((id *)buf, self);
    double v14 = [EMKOverlayView alloc];
    id v15 = [(_EMKTextKit2Controller *)self textView];
    [(_EMKTouchInfo *)self->_lastTouchInfo frame];
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    id v24 = [(_EMKTouchInfo *)self->_lastTouchInfo tokenList];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __51___EMKTextKit2Controller_textTapGestureRecognized___block_invoke;
    v29[3] = &unk_1E6E971D8;
    objc_copyWeak(v33, (id *)buf);
    v33[1] = v10;
    v33[2] = v12;
    id v25 = v9;
    id v30 = v25;
    id v26 = v13;
    id v31 = v26;
    id v32 = self;
    id v27 = -[EMKOverlayView initWithView:anchorRect:emojiTokenList:selectionHandler:](v14, "initWithView:anchorRect:emojiTokenList:selectionHandler:", v15, v24, v29, v17, v19, v21, v23);
    overlayView = self->_overlayView;
    self->_overlayView = v27;

    objc_destroyWeak(v33);
    objc_destroyWeak((id *)buf);
  }
}

- (void)replaceRange:(_NSRange)a3 withEmojiToken:(id)a4 language:(id)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v49 = a5;
  double v10 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v53.NSUInteger location = location;
    v53.NSUInteger length = length;
    double v11 = NSStringFromRange(v53);
    *(_DWORD *)buf = 138412290;
    v51 = v11;
    _os_log_impl(&dword_1E4A5E000, v10, OS_LOG_TYPE_DEFAULT, "replaceRange:withEmojiToken:language: - range: %@", buf, 0xCu);
  }
  uint64_t v48 = v9;
  id v12 = [v9 string];
  uint64_t v45 = [v12 length];
  double v13 = [(_EMKTextKit2Controller *)self textView];
  double v14 = [v13 attributedText];
  id v15 = objc_msgSend(v14, "attributedSubstringFromRange:", location, length);
  double v16 = [v15 string];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  double v18 = [WeakRetained beginningOfDocument];

  id v19 = objc_loadWeakRetained((id *)&self->_textView);
  uint64_t v20 = [v19 positionFromPosition:v18 offset:location];

  id v21 = objc_loadWeakRetained((id *)&self->_textView);
  uint64_t v22 = [v21 positionFromPosition:v18 offset:location + length];

  id v23 = objc_loadWeakRetained((id *)&self->_textView);
  double v46 = (void *)v22;
  double v47 = (void *)v20;
  id v24 = [v23 textRangeFromPosition:v20 toPosition:v22];

  id v25 = objc_loadWeakRetained((id *)&self->_textView);
  id v26 = [v25 inputDelegate];
  id v27 = objc_loadWeakRetained((id *)&self->_textView);
  [v26 textWillChange:v27];

  id v28 = objc_loadWeakRetained((id *)&self->_textView);
  [v28 replaceRange:v24 withText:v12];

  id v29 = objc_loadWeakRetained((id *)&self->_textView);
  id v30 = [v29 inputDelegate];
  id v31 = objc_loadWeakRetained((id *)&self->_textView);
  [v30 textDidChange:v31];

  if ([v16 isEqualToString:v12])
  {
    v44 = v24;
    id v32 = objc_loadWeakRetained((id *)&self->_textView);
    id v33 = [v32 inputDelegate];
    id v34 = objc_loadWeakRetained((id *)&self->_textView);
    [v33 textWillChange:v34];

    id v35 = [[EMKEmojiSignifier alloc] initWithString:v16];
    __int16 v36 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E4A5E000, v36, OS_LOG_TYPE_DEFAULT, "Adding attributes…", buf, 2u);
    }

    int v37 = [(_EMKTextKit2Controller *)self textView];
    __int16 v38 = [v37 attributedText];
    uint64_t v39 = (void *)[v38 mutableCopy];

    objc_msgSend(v39, "addAttribute:value:range:", @"EMKEmojiSignifier", v35, location, v45);
    if (v49) {
      objc_msgSend(v39, "addAttribute:value:range:", @"EMKEmojiConversionLanguage", v49, location, v45);
    }
    id v40 = objc_loadWeakRetained((id *)&self->_textView);
    [v40 setAttributedText:v39];

    id v41 = objc_loadWeakRetained((id *)&self->_textView);
    id v42 = [v41 inputDelegate];
    id v43 = objc_loadWeakRetained((id *)&self->_textView);
    [v42 textDidChange:v43];

    id v24 = v44;
  }
  -[EMFEmojiPreferences didUseEmoji:usageMode:typingName:replacementContext:](self->_emojiPreferences, "didUseEmoji:usageMode:typingName:replacementContext:", v48, *MEMORY[0x1E4F61060], 0, v16, v44);
}

- (void)textViewDidLayoutSubviews
{
  char v3 = [(_EMKTextKit2Controller *)self textView];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(_EMKTextKit2Controller *)self textView];
    int v5 = [v4 _containerView];
    [v5 bounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v14 = [(_EMKTextKit2Controller *)self textContainerOverlayView];
    objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);
  }
  if (self->_overlayView)
  {
    dispatch_time_t v15 = dispatch_time(0, 10000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51___EMKTextKit2Controller_textViewDidLayoutSubviews__block_invoke;
    block[3] = &unk_1E6E97110;
    block[4] = self;
    dispatch_after(v15, MEMORY[0x1E4F14428], block);
  }
}

- (void)_updateOverlayView
{
  overlayView = self->_overlayView;
  if (overlayView)
  {
    id v4 = [(_EMKTextKit2Controller *)self textView];
    [(_EMKTouchInfo *)self->_lastTouchInfo frame];
    -[EMKOverlayView setView:anchorRect:](overlayView, "setView:anchorRect:", v4);
  }
}

- (void)dismissOverlayView
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->_overlayView)
  {
    char v3 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 134217984;
      double v6 = self;
      _os_log_impl(&dword_1E4A5E000, v3, OS_LOG_TYPE_DEFAULT, "Dismissing overlay view: %p", (uint8_t *)&v5, 0xCu);
    }

    [(EMKOverlayView *)self->_overlayView dismiss];
    overlayView = self->_overlayView;
    self->_overlayView = 0;
  }
}

- (BOOL)textContentManager:(id)a3 shouldEnumerateTextElement:(id)a4 options:(unint64_t)a5
{
  return 1;
}

- (id)textContentStorage:(id)a3 textParagraphWithRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  double v8 = v7;
  if (self->_emojiConversionEnabled && self->_emojiConversionActive)
  {
    double v9 = [v7 textStorage];
    double v10 = objc_msgSend(v9, "attributedSubstringFromRange:", location, length);

    double v11 = (void *)[v10 mutableCopy];
    [(_EMKTextKit2Controller *)self _updateEmojiAttributesOfText:v11];
    double v12 = (void *)[objc_alloc(MEMORY[0x1E4FB08A8]) initWithAttributedString:v11];
  }
  else
  {
    double v12 = 0;
  }

  return v12;
}

- (BOOL)isDarkModeEnabled
{
  return self->_darkModeEnabled;
}

- (BOOL)isEmojiConversionEnabled
{
  return self->_emojiConversionEnabled;
}

- (void)setEmojiConversionEnabled:(BOOL)a3
{
  self->_emojiConversionEnabled = a3;
}

- (BOOL)isEmojiConversionActive
{
  return self->_emojiConversionActive;
}

- (NSArray)emojiConversionLanguages
{
  return self->_emojiConversionLanguages;
}

- (EMKTextView)textView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  return (EMKTextView *)WeakRetained;
}

- (void)setTextView:(id)a3
{
}

- (_EMKTextContainerOverlayView)containerOverlayView
{
  return self->_containerOverlayView;
}

- (void)setContainerOverlayView:(id)a3
{
}

- (EMFEmojiPreferences)emojiPreferences
{
  return (EMFEmojiPreferences *)objc_getProperty(self, a2, 48, 1);
}

- (void)setEmojiPreferences:(id)a3
{
}

- (EMKOverlayView)overlayView
{
  return (EMKOverlayView *)objc_getProperty(self, a2, 56, 1);
}

- (void)setOverlayView:(id)a3
{
}

- (NSTimer)rippleTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 64, 1);
}

- (void)setRippleTimer:(id)a3
{
}

- (EMKGlyphRippler)rippler
{
  return self->_rippler;
}

- (void)setRippler:(id)a3
{
}

- (EMKTextEnumerator)textEnumerator
{
  return self->_textEnumerator;
}

- (void)setTextEnumerator:(id)a3
{
}

- (_EMKTouchInfo)lastTouchInfo
{
  return self->_lastTouchInfo;
}

- (void)setLastTouchInfo:(id)a3
{
}

- (BOOL)isEmojiAnimationActive
{
  return self->_emojiAnimationActive;
}

- (void)setEmojiAnimationActive:(BOOL)a3
{
  self->_BOOL emojiAnimationActive = a3;
}

- (EMKRippleAnimationCoordinator)rippleCoordinator
{
  return self->_rippleCoordinator;
}

- (void)setRippleCoordinator:(id)a3
{
}

@end