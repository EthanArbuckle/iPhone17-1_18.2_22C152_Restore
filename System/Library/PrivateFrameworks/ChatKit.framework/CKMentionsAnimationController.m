@interface CKMentionsAnimationController
- (BOOL)isAnyMentionAnimationActive;
- (CKMentionsAnimationController)initWithEntryTextView:(id)a3;
- (CKMentionsAnimationControllerDelegate)delegate;
- (CKMentionsTextContainerOverlayView)overlayView;
- (CKMessageEntryTextView)textView;
- (NSAttributedString)mentionAttributes;
- (NSMutableDictionary)animationsByIdentifier;
- (NSMutableDictionary)rippleAnimatorsByIdentifier;
- (NSTimer)mentionTimer;
- (void)__startAnimationIfNeeded_legacy;
- (void)__startAnimationIfNeeded_textEffects;
- (void)_delegateDidFinishMentionAnimationWithIdentifier:(id)a3;
- (void)_startAnimationIfNeeded;
- (void)_updateMentionAttributes_legacy:(id)a3;
- (void)_updateMentionAttributes_textEffects:(id)a3;
- (void)didSetAttributedTextOfTextView;
- (void)setAnimationsByIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMentionAttributes:(id)a3;
- (void)setMentionTimer:(id)a3;
- (void)setOverlayView:(id)a3;
- (void)setRippleAnimatorsByIdentifier:(id)a3;
- (void)setTextView:(id)a3;
- (void)stopTimerRemovingAttribute:(BOOL)a3;
- (void)updateDisplayForMentionGlyphRangeRemovingAttribute:(BOOL)a3;
- (void)updateMentionAttributes:(id)a3;
- (void)updateMentionDisplay;
@end

@implementation CKMentionsAnimationController

- (CKMentionsAnimationController)initWithEntryTextView:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"CKMentionsAnimationController.m", 93, @"Invalid parameter not satisfying: %@", @"textView" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)CKMentionsAnimationController;
  v7 = [(CKMentionsAnimationController *)&v15 init];
  if (v7)
  {
    uint64_t v8 = objc_opt_new();
    animationsByIdentifier = v7->_animationsByIdentifier;
    v7->_animationsByIdentifier = (NSMutableDictionary *)v8;

    uint64_t v10 = objc_opt_new();
    rippleAnimatorsByIdentifier = v7->_rippleAnimatorsByIdentifier;
    v7->_rippleAnimatorsByIdentifier = (NSMutableDictionary *)v10;

    objc_storeStrong((id *)&v7->_textView, a3);
    overlayView = v7->_overlayView;
    v7->_overlayView = 0;
  }
  return v7;
}

- (void)updateMentionAttributes:(id)a3
{
  id v4 = a3;
  if (CKShouldUseModernRippleAnimation()) {
    [(CKMentionsAnimationController *)self _updateMentionAttributes_textEffects:v4];
  }
  else {
    [(CKMentionsAnimationController *)self _updateMentionAttributes_legacy:v4];
  }
}

- (void)_updateMentionAttributes_legacy:(id)a3
{
  id v4 = (NSAttributedString *)a3;
  mentionAttributes = self->_mentionAttributes;
  if (mentionAttributes == v4
    || [(NSAttributedString *)mentionAttributes isEqualToAttributedString:v4])
  {
    [(CKMentionsAnimationController *)self didSetAttributedTextOfTextView];
  }
  else
  {
    [(CKMentionsAnimationController *)self setMentionAttributes:v4];
    id v6 = [(CKMentionsAnimationController *)self textView];
    v7 = [v6 textLayoutManager];

    if (objc_opt_respondsToSelector()) {
      [v7 setRequiresCTLineRef:1];
    }
    uint64_t v8 = [v7 documentRange];
    [v7 ensureLayoutForRange:v8];

    v9 = [(CKMentionsAnimationController *)self mentionAttributes];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __65__CKMentionsAnimationController__updateMentionAttributes_legacy___block_invoke;
    v10[3] = &unk_1E5621440;
    v10[4] = self;
    objc_msgSend(v9, "ck_enumerateAllMentionAnimationIdentifiersUsingBlock:", v10);

    [(CKMentionsAnimationController *)self didSetAttributedTextOfTextView];
  }
}

void __65__CKMentionsAnimationController__updateMentionAttributes_legacy___block_invoke(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:v7];

  if (!v8)
  {
    v9 = objc_alloc_init(CKMentionRippler);
    [*(id *)(*(void *)(a1 + 32) + 32) setObject:v9 forKeyedSubscript:v7];
    [(CKMentionRippler *)v9 start];
    if (IMOSLoggingEnabled())
    {
      uint64_t v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v17.location = a3;
        v17.length = a4;
        v11 = NSStringFromRange(v17);
        int v12 = 138412546;
        v13 = v11;
        __int16 v14 = 2112;
        id v15 = v7;
        _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Setting up animation for range: %@ - identifier: %@", (uint8_t *)&v12, 0x16u);
      }
    }
    [*(id *)(a1 + 32) _startAnimationIfNeeded];
  }
}

- (void)_updateMentionAttributes_textEffects:(id)a3
{
  id v4 = (NSAttributedString *)a3;
  mentionAttributes = self->_mentionAttributes;
  if (mentionAttributes == v4
    || [(NSAttributedString *)mentionAttributes isEqualToAttributedString:v4])
  {
    [(CKMentionsAnimationController *)self didSetAttributedTextOfTextView];
  }
  else
  {
    [(CKMentionsAnimationController *)self setMentionAttributes:v4];
    id v6 = [(CKMentionsAnimationController *)self textView];
    id v7 = [v6 textStorage];

    [v7 beginEditing];
    uint64_t v8 = [(CKMentionsAnimationController *)self mentionAttributes];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    __int16 v14 = __70__CKMentionsAnimationController__updateMentionAttributes_textEffects___block_invoke;
    id v15 = &unk_1E5621490;
    uint64_t v16 = self;
    id v17 = v7;
    id v9 = v7;
    objc_msgSend(v8, "ck_enumerateAllMentionAnimationIdentifiersUsingBlock:", &v12);

    objc_msgSend(v9, "endEditing", v12, v13, v14, v15, v16);
    uint64_t v10 = [(CKMentionsAnimationController *)self textView];
    [v10 setNeedsLayout];

    v11 = [(CKMentionsAnimationController *)self textView];
    [v11 layoutIfNeeded];

    [(CKMentionsAnimationController *)self _startAnimationIfNeeded];
  }
}

void __70__CKMentionsAnimationController__updateMentionAttributes_textEffects___block_invoke(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  uint64_t v8 = [*(id *)(a1 + 32) rippleAnimatorsByIdentifier];
  id v9 = [v8 objectForKeyedSubscript:v7];

  if (!v9)
  {
    uint64_t v10 = objc_msgSend(*(id *)(a1 + 40), "addRippleAnimationForRange_emk:", a3, a4);
    v11 = *(void **)(a1 + 40);
    uint64_t v12 = +[CKUIBehavior sharedBehaviors];
    uint64_t v13 = [v12 balloonTextFont];
    objc_msgSend(v11, "addAttribute:value:range:", *MEMORY[0x1E4FB06F8], v13, a3, a4);

    id v15 = *(void **)(a1 + 32);
    __int16 v14 = (id *)(a1 + 32);
    uint64_t v16 = [v15 textView];
    id v17 = [MEMORY[0x1E4F428B8] systemBlueColor];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __70__CKMentionsAnimationController__updateMentionAttributes_textEffects___block_invoke_2;
    v24[3] = &unk_1E5621468;
    v24[4] = *v14;
    id v18 = v10;
    id v25 = v18;
    id v19 = v7;
    id v26 = v19;
    v20 = objc_msgSend(v16, "newRippleAnimatorForAnimation:foregroundColor:notify_emk:", v18, v17, v24);

    v21 = [*v14 rippleAnimatorsByIdentifier];
    [v21 setObject:v20 forKeyedSubscript:v19];

    if (IMOSLoggingEnabled())
    {
      v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v32.location = a3;
        v32.length = a4;
        v23 = NSStringFromRange(v32);
        *(_DWORD *)buf = 138412546;
        v28 = v23;
        __int16 v29 = 2112;
        id v30 = v19;
        _os_log_impl(&dword_18EF18000, v22, OS_LOG_TYPE_INFO, "Setting up animation for range: %@ - identifier: %@", buf, 0x16u);
      }
    }
  }
}

uint64_t __70__CKMentionsAnimationController__updateMentionAttributes_textEffects___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isIdle];
  if (result)
  {
    id v4 = [*(id *)(a1 + 32) textView];
    v5 = [v4 textStorage];
    id v6 = (id)objc_msgSend(v5, "removeRippleAnimation:includingFilterEffect_emk:", *(void *)(a1 + 40), 1);

    id v7 = [*(id *)(a1 + 32) rippleAnimatorsByIdentifier];
    [v7 setObject:0 forKeyedSubscript:*(void *)(a1 + 48)];

    uint64_t v8 = *(void **)(a1 + 32);
    return [v8 updateDisplayForMentionGlyphRangeRemovingAttribute:1];
  }
  return result;
}

- (void)didSetAttributedTextOfTextView
{
  if (!CKShouldUseModernRippleAnimation())
  {
    BOOL v3 = [(CKMentionsAnimationController *)self isAnyMentionAnimationActive];
    int v4 = IMOSLoggingEnabled();
    if (v3)
    {
      if (v4)
      {
        v5 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)id v7 = 0;
          _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "didSetAttributedTextOfTextView - at least 1 animation is active - hiding animating mentions…", v7, 2u);
        }
      }
      id v6 = [(CKMentionsAnimationController *)self textView];
      [v6 _setAnimatingMentionsHidden:1];
LABEL_8:

      return;
    }
    if (v4)
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "didSetAttributedTextOfTextView - returning early because no animation is active", buf, 2u);
      }
      goto LABEL_8;
    }
  }
}

- (void)_startAnimationIfNeeded
{
  if (CKShouldUseModernRippleAnimation())
  {
    [(CKMentionsAnimationController *)self __startAnimationIfNeeded_textEffects];
  }
  else
  {
    [(CKMentionsAnimationController *)self __startAnimationIfNeeded_legacy];
  }
}

- (void)__startAnimationIfNeeded_textEffects
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    BOOL v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "__startAnimationIfNeeded_textEffects", buf, 2u);
    }
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  int v4 = [(CKMentionsAnimationController *)self rippleAnimatorsByIdentifier];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v5)
  {
    uint64_t v7 = *(void *)v17;
    *(void *)&long long v6 = 138412290;
    long long v15 = v6;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * v8);
        uint64_t v10 = [(CKMentionsAnimationController *)self rippleAnimatorsByIdentifier];
        v11 = [v10 objectForKeyedSubscript:v9];

        LODWORD(v10) = [v11 isPlaying];
        int v12 = IMOSLoggingEnabled();
        if (v10)
        {
          if (v12)
          {
            uint64_t v13 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v15;
              uint64_t v21 = v9;
              _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "__startAnimationIfNeeded_textEffects - already playing %@", buf, 0xCu);
            }
          }
        }
        else
        {
          if (v12)
          {
            __int16 v14 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v15;
              uint64_t v21 = v9;
              _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "__startAnimationIfNeeded_textEffects - starting %@", buf, 0xCu);
            }
          }
          if (objc_opt_respondsToSelector()) {
            [v11 performSelector:sel_start];
          }
        }

        ++v8;
      }
      while (v5 != v8);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v5);
  }
}

- (void)__startAnimationIfNeeded_legacy
{
  overlayView = self->_overlayView;
  if (self->_mentionTimer)
  {
    if (overlayView) {
      goto LABEL_3;
    }
  }
  else if (!overlayView)
  {
    goto LABEL_9;
  }
  long long v6 = [MEMORY[0x1E4F28B00] currentHandler];
  [v6 handleFailureInMethod:a2 object:self file:@"CKMentionsAnimationController.m" lineNumber:242 description:@"Invalid state"];

  if (self->_mentionTimer)
  {
LABEL_3:
    if (IMOSLoggingEnabled())
    {
      uint64_t v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "_startAnimationIfNeeded – return early because animation already running.", buf, 2u);
      }
    }
    return;
  }
LABEL_9:
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long v19 = 0;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "_startAnimationIfNeeded – animation needed!", v19, 2u);
    }
  }
  uint64_t v8 = [(CKMentionsAnimationController *)self textView];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    uint64_t v10 = [CKMentionsTextContainerOverlayView alloc];
    v11 = [(CKMentionsAnimationController *)self textView];
    int v12 = -[CKMentionsTextContainerOverlayView initWithFrame:textView:](v10, "initWithFrame:textView:", v11, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(CKMentionsAnimationController *)self setOverlayView:v12];

    uint64_t v13 = [(CKMentionsAnimationController *)self overlayView];
    __int16 v14 = [(CKMentionsAnimationController *)self textView];
    [v14 setTextContainerOverlayView:v13];

    long long v15 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel_updateMentionDisplay selector:0 userInfo:1 repeats:0.0166666667];
    [(CKMentionsAnimationController *)self setMentionTimer:v15];

    long long v16 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    long long v17 = [(CKMentionsAnimationController *)self mentionTimer];
    [v16 addTimer:v17 forMode:*MEMORY[0x1E4F43EA8]];

    long long v18 = [(CKMentionsAnimationController *)self textView];
    [v18 setNeedsDisplayCurrentRenderAttributes];

    [(CKMentionsAnimationController *)self updateMentionDisplay];
  }
}

- (void)stopTimerRemovingAttribute:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!CKShouldUseModernRippleAnimation())
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v10[0] = 67109120;
        v10[1] = v3;
        _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "stopTimerRemovingAttribute: %{BOOL}d", (uint8_t *)v10, 8u);
      }
    }
    [(CKMentionsAnimationController *)self updateDisplayForMentionGlyphRangeRemovingAttribute:v3];
    long long v6 = [(CKMentionsAnimationController *)self mentionTimer];
    [v6 invalidate];

    [(CKMentionsAnimationController *)self setMentionTimer:0];
    uint64_t v7 = [(CKMentionsAnimationController *)self textView];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      char v9 = [(CKMentionsAnimationController *)self textView];
      [v9 setTextContainerOverlayView:0];
    }
    [(CKMentionsAnimationController *)self setOverlayView:0];
  }
}

- (void)updateDisplayForMentionGlyphRangeRemovingAttribute:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LODWORD(v17) = 67109120;
      HIDWORD(v17) = v3;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "updateDisplayForMentionGlyphRangeRemovingAttribute: %{BOOL}d", (uint8_t *)&v17, 8u);
    }
  }
  long long v6 = [(CKMentionsAnimationController *)self mentionAttributes];
  uint64_t v7 = (void *)[v6 copy];

  uint64_t v17 = 0;
  uint64_t v18 = 0;
  char v8 = [(CKMentionsAnimationController *)self textView];
  char v9 = [v8 textStorage];
  unint64_t v10 = [v9 length];

  unint64_t v11 = [v7 length];
  if (v11)
  {
    uint64_t v12 = 0;
    uint64_t v13 = *MEMORY[0x1E4F6D510];
    do
    {
      __int16 v14 = objc_msgSend(v7, "attribute:atIndex:longestEffectiveRange:inRange:", v13, v12, &v17, v12, v11 - v12);
      long long v15 = v14;
      if (v14 && [v14 length] && v18 + v17 <= v10 && v3) {
        [(CKMentionsAnimationController *)self _delegateDidFinishMentionAnimationWithIdentifier:v15];
      }

      uint64_t v12 = v18 + v17;
    }
    while (v18 + v17 < v11);
  }
}

- (BOOL)isAnyMentionAnimationActive
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (CKShouldUseModernRippleAnimation()) {
    return 0;
  }
  uint64_t v10 = 0;
  unint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  mentionAttributes = self->_mentionAttributes;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__CKMentionsAnimationController_isAnyMentionAnimationActive__block_invoke;
  v9[3] = &unk_1E56214B8;
  v9[4] = self;
  v9[5] = &v10;
  [(NSAttributedString *)mentionAttributes ck_enumerateAllMentionAnimationIdentifiersUsingBlock:v9];
  if (!*((unsigned char *)v11 + 24))
  {
    uint64_t v5 = [(CKMentionsAnimationController *)self animationsByIdentifier];
    [v5 removeAllObjects];
  }
  if (IMOSLoggingEnabled())
  {
    long long v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = *((unsigned __int8 *)v11 + 24);
      *(_DWORD *)buf = 67109120;
      int v15 = v7;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "isAnyMentionAnimationActive: %{BOOL}d", buf, 8u);
    }
  }
  BOOL v3 = *((unsigned char *)v11 + 24) != 0;
  _Block_object_dispose(&v10, 8);
  return v3;
}

void __60__CKMentionsAnimationController_isAnyMentionAnimationActive__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v10 = a2;
  long long v6 = [*(id *)(a1 + 32) animationsByIdentifier];
  int v7 = [v6 objectForKeyedSubscript:v10];

  if (v7) {
    BOOL v8 = a4 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    if (objc_msgSend(v7, "finishedForGlyphIndex:numberOfGlyphs:timeIndex:", a4 - 1, a4, objc_msgSend(v7, "currentTimeIndex")))
    {
      char v9 = [*(id *)(a1 + 32) animationsByIdentifier];
      [v9 removeObjectForKey:v10];
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }
}

- (void)updateMentionDisplay
{
  if (IMOSLoggingEnabled())
  {
    BOOL v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v7 = 0;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "updateMentionDisplay", v7, 2u);
    }
  }
  [(CKMentionsAnimationController *)self updateDisplayForMentionGlyphRangeRemovingAttribute:0];
  if (![(CKMentionsAnimationController *)self isAnyMentionAnimationActive]) {
    [(CKMentionsAnimationController *)self stopTimerRemovingAttribute:1];
  }
  int v4 = [(CKMentionsAnimationController *)self overlayView];
  uint64_t v5 = [(CKMentionsAnimationController *)self animationsByIdentifier];
  long long v6 = (void *)[v5 copy];
  [v4 updateUsingAnimations:v6];
}

- (void)_delegateDidFinishMentionAnimationWithIdentifier:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      id v8 = v4;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "_delegateDidFinishMentionAnimationWithIdentifier: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained mentionsAnimationController:self didFinishMentionAnimationWithIdentifier:v4];
}

- (CKMentionsAnimationControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKMentionsAnimationControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSAttributedString)mentionAttributes
{
  return self->_mentionAttributes;
}

- (void)setMentionAttributes:(id)a3
{
}

- (CKMessageEntryTextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
}

- (NSMutableDictionary)animationsByIdentifier
{
  return self->_animationsByIdentifier;
}

- (void)setAnimationsByIdentifier:(id)a3
{
}

- (NSMutableDictionary)rippleAnimatorsByIdentifier
{
  return self->_rippleAnimatorsByIdentifier;
}

- (void)setRippleAnimatorsByIdentifier:(id)a3
{
}

- (NSTimer)mentionTimer
{
  return self->_mentionTimer;
}

- (void)setMentionTimer:(id)a3
{
}

- (CKMentionsTextContainerOverlayView)overlayView
{
  return self->_overlayView;
}

- (void)setOverlayView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_mentionTimer, 0);
  objc_storeStrong((id *)&self->_rippleAnimatorsByIdentifier, 0);
  objc_storeStrong((id *)&self->_animationsByIdentifier, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_mentionAttributes, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end