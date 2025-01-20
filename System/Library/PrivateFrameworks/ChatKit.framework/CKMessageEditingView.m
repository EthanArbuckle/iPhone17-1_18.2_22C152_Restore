@interface CKMessageEditingView
- (BOOL)becomeFirstResponder;
- (BOOL)firstLayoutPassCompleted;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKComposition)currentComposition;
- (CKComposition)originalComposition;
- (CKMessageEditingBalloonView)messageEditingBalloonView;
- (CKMessageEditingView)initWithMessageEditingViewDelegate:(id)a3;
- (CKMessageEditingViewDelegate)messageEditingViewDelegate;
- (UIButton)confirmButton;
- (UIButton)rejectButton;
- (UIView)balloonViewForAlignment;
- (char)balloonColorType;
- (id)adaptiveImageGlyphForTransferGUID:(id)a3;
- (id)keyCommands;
- (id)styledAttributedStringFromString:(id)a3;
- (int64_t)messageEditingViewState;
- (void)_applyExpressiveTextFormattingToAttributedText:(id)a3 forCompositionText:(id)a4;
- (void)_confirmButtonSelected:(id)a3;
- (void)_insertAdaptiveImageGlyphs:(id)a3;
- (void)_rejectButtonSelected:(id)a3;
- (void)_updateTextFieldWithOriginalComposition;
- (void)applyGrammarCheckingIndication;
- (void)layoutSubviews;
- (void)messageEditingBalloonView:(id)a3 didChangeTextAnimationInRange:(_NSRange)a4;
- (void)messageEditingBalloonViewContentDidChange:(id)a3;
- (void)messageEditingBalloonViewWritingToolsDidEnd:(id)a3;
- (void)messageEditingBalloonViewWritingToolsWillBegin:(id)a3;
- (void)modifySelectedTextByTogglingTextEffectType:(int64_t)a3;
- (void)modifySelectedTextByTogglingTextStyle:(unint64_t)a3;
- (void)setConfirmButton:(id)a3;
- (void)setMessageEditingBalloonView:(id)a3;
- (void)setMessageEditingViewDelegate:(id)a3;
- (void)setMessageEditingViewState:(int64_t)a3;
- (void)setOriginalComposition:(id)a3;
- (void)setRejectButton:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)underlineWithProofreadingInfo:(id)a3;
@end

@implementation CKMessageEditingView

- (void)modifySelectedTextByTogglingTextEffectType:(int64_t)a3
{
  id v4 = [(CKMessageEditingView *)self messageEditingBalloonView];
  [v4 modifySelectedTextByTogglingTextEffectType:a3];
}

- (void)modifySelectedTextByTogglingTextStyle:(unint64_t)a3
{
  id v4 = [(CKMessageEditingView *)self messageEditingBalloonView];
  [v4 modifySelectedTextByTogglingTextStyle:a3];
}

- (CKMessageEditingView)initWithMessageEditingViewDelegate:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)CKMessageEditingView;
  v5 = [(CKMessageEditingView *)&v31 init];
  v6 = v5;
  if (v5)
  {
    v5->_messageEditingViewState = 0;
    [(CKMessageEditingView *)v5 setMessageEditingViewDelegate:v4];
    v7 = +[CKUIBehavior sharedBehaviors];
    v8 = [v7 messageEditingRejectButtonBaseConfiguration];

    v9 = +[CKUIBehavior sharedBehaviors];
    v10 = [v9 messageEditingRejectButtonImage];
    [v8 setImage:v10];

    id location = 0;
    objc_initWeak(&location, v6);
    v11 = (void *)MEMORY[0x1E4F426E8];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __59__CKMessageEditingView_initWithMessageEditingViewDelegate___block_invoke;
    v28[3] = &unk_1E5620ED8;
    objc_copyWeak(&v29, &location);
    uint64_t v12 = [v11 actionWithHandler:v28];
    v13 = +[CKCustomButton buttonWithConfiguration:v8 primaryAction:v12];
    objc_storeStrong((id *)&v6->_rejectButton, v13);
    [(CKMessageEditingView *)v6 addSubview:v6->_rejectButton];
    v25 = (void *)v12;
    v14 = [(CKMessageEditingView *)v6 messageEditingViewDelegate];
    uint64_t v15 = [v14 messageEditingColor];

    v16 = +[CKUIBehavior sharedBehaviors];
    v17 = [v16 messageEditingConfirmButtonBaseConfiguration];

    v18 = +[CKUIBehavior sharedBehaviors];
    [v18 updateMessageEditingConfirmButtonConfiguration:v17 forButtonColor:v15 isEnabled:1];

    v19 = (void *)MEMORY[0x1E4F426E8];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __59__CKMessageEditingView_initWithMessageEditingViewDelegate___block_invoke_2;
    v26[3] = &unk_1E5620ED8;
    objc_copyWeak(&v27, &location);
    v20 = [v19 actionWithHandler:v26];
    v21 = +[CKCustomButton buttonWithConfiguration:v17 primaryAction:v20];
    objc_storeStrong((id *)&v6->_confirmButton, v21);
    [(CKMessageEditingView *)v6 addSubview:v6->_confirmButton];
    v22 = (objc_class *)objc_opt_class();
    v23 = CKBalloonViewForClass(v22);
    [v23 setEditingBalloonViewDelegate:v6];
    [v23 setHasTail:1];
    [v23 setOrientation:1];
    [v23 setBalloonShape:0];
    [v23 setCanUseOpaqueMask:0];
    objc_storeStrong((id *)&v6->_messageEditingBalloonView, v23);
    [(CKMessageEditingView *)v6 addSubview:v6->_messageEditingBalloonView];
    [(CKMessageEditingView *)v6 updateKeyboardActionButtonIfNeeded];

    objc_destroyWeak(&v27);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
  return v6;
}

void __59__CKMessageEditingView_initWithMessageEditingViewDelegate___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [v3 sender];

  [WeakRetained _rejectButtonSelected:v4];
}

void __59__CKMessageEditingView_initWithMessageEditingViewDelegate___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [v3 sender];

  [WeakRetained _confirmButtonSelected:v4];
}

- (UIView)balloonViewForAlignment
{
  return (UIView *)self->_messageEditingBalloonView;
}

- (void)setOriginalComposition:(id)a3
{
  objc_storeStrong((id *)&self->_originalComposition, a3);

  [(CKMessageEditingView *)self _updateTextFieldWithOriginalComposition];
}

- (void)_updateTextFieldWithOriginalComposition
{
  id v4 = [(CKComposition *)self->_originalComposition text];
  id v3 = [(CKMessageEditingView *)self styledAttributedStringFromString:v4];
  [(CKTextBalloonView *)self->_messageEditingBalloonView setAttributedText:v3];
  [(CKTextBalloonView *)self->_messageEditingBalloonView prepareForDisplay];
  [(CKMessageEditingView *)self setNeedsLayout];
}

- (id)styledAttributedStringFromString:(id)a3
{
  id v4 = a3;
  v5 = (void *)[v4 mutableCopy];
  v6 = +[CKUIBehavior sharedBehaviors];
  v7 = [v6 balloonParagraphStyle];

  if (!v7)
  {
    v7 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
  }
  objc_msgSend(v5, "addAttribute:value:range:", *MEMORY[0x1E4FB0738], v7, 0, objc_msgSend(v5, "length"));
  uint64_t v8 = [v5 length];
  v9 = +[CKUIBehavior sharedBehaviors];
  v10 = [v9 balloonTextFont];

  uint64_t v11 = [(CKBalloonView *)self->_messageEditingBalloonView color];
  uint64_t v12 = objc_msgSend(v5, "__ck_bigEmojiStyle");
  if ((unint64_t)(v12 - 1) >= 3)
  {
    v16 = 0;
    if (v12) {
      goto LABEL_8;
    }
    v13 = +[CKUIBehavior sharedBehaviors];
    v14 = [v13 theme];
    uint64_t v15 = [v14 balloonTextColorForColorType:v11];
  }
  else
  {
    v13 = +[CKUIBehavior sharedBehaviors];
    v14 = [v13 theme];
    uint64_t v15 = [v14 transcriptBigEmojiColor];
  }
  v16 = (void *)v15;

LABEL_8:
  objc_msgSend(v5, "addAttribute:value:range:", *MEMORY[0x1E4FB0700], v16, 0, v8);
  objc_msgSend(v5, "addAttribute:value:range:", *MEMORY[0x1E4FB06F8], v10, 0, v8);
  [(CKMessageEditingView *)self _insertAdaptiveImageGlyphs:v5];
  v17 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v18 = [v17 isExpressiveTextEnabled];

  if (v18) {
    [(CKMessageEditingView *)self _applyExpressiveTextFormattingToAttributedText:v5 forCompositionText:v4];
  }
  v19 = (void *)[v5 copy];

  return v19;
}

- (void)_applyExpressiveTextFormattingToAttributedText:(id)a3 forCompositionText:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 length];
  uint64_t v8 = *MEMORY[0x1E4F6E400];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __90__CKMessageEditingView__applyExpressiveTextFormattingToAttributedText_forCompositionText___block_invoke;
  v35[3] = &unk_1E5624860;
  id v9 = v5;
  id v36 = v9;
  objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v8, 0, v7, 0, v35);
  uint64_t v10 = *MEMORY[0x1E4F6E410];
  uint64_t v11 = [v6 length];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __90__CKMessageEditingView__applyExpressiveTextFormattingToAttributedText_forCompositionText___block_invoke_2;
  v33[3] = &unk_1E5624860;
  id v12 = v9;
  id v34 = v12;
  objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v10, 0, v11, 0, v33);
  uint64_t v13 = *MEMORY[0x1E4F6E420];
  uint64_t v14 = [v6 length];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __90__CKMessageEditingView__applyExpressiveTextFormattingToAttributedText_forCompositionText___block_invoke_3;
  v31[3] = &unk_1E5624860;
  id v15 = v12;
  id v32 = v15;
  objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v13, 0, v14, 0, v31);
  uint64_t v16 = *MEMORY[0x1E4F6E3F8];
  uint64_t v17 = [v6 length];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __90__CKMessageEditingView__applyExpressiveTextFormattingToAttributedText_forCompositionText___block_invoke_4;
  v29[3] = &unk_1E5624860;
  id v18 = v15;
  id v30 = v18;
  objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v16, 0, v17, 0, v29);
  uint64_t v19 = *MEMORY[0x1E4F6E408];
  uint64_t v20 = [v6 length];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __90__CKMessageEditingView__applyExpressiveTextFormattingToAttributedText_forCompositionText___block_invoke_5;
  v27[3] = &unk_1E5624860;
  id v21 = v18;
  id v28 = v21;
  objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v19, 0, v20, 0, v27);
  uint64_t v22 = *MEMORY[0x1E4F6D538];
  uint64_t v23 = [v6 length];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __90__CKMessageEditingView__applyExpressiveTextFormattingToAttributedText_forCompositionText___block_invoke_6;
  v25[3] = &unk_1E5624860;
  id v26 = v21;
  id v24 = v21;
  objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v22, 0, v23, 0, v25);
}

void __90__CKMessageEditingView__applyExpressiveTextFormattingToAttributedText_forCompositionText___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(*(id *)(a1 + 32), "ck_applyTextEffectType:range:", objc_msgSend(v7, "integerValue"), a3, a4);
    }
  }
}

void __90__CKMessageEditingView__applyExpressiveTextFormattingToAttributedText_forCompositionText___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
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
      uint64_t v9 = [v10 unsignedIntegerValue];
      id v7 = v10;
      if (v9 == 1)
      {
        objc_msgSend(*(id *)(a1 + 32), "ck_addTextStyle:options:range:", 8, 3, a3, a4);
        id v7 = v10;
      }
    }
  }
}

void __90__CKMessageEditingView__applyExpressiveTextFormattingToAttributedText_forCompositionText___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
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
      uint64_t v9 = [v10 unsignedIntegerValue];
      id v7 = v10;
      if (v9 == 1)
      {
        objc_msgSend(*(id *)(a1 + 32), "ck_addTextStyle:options:range:", 4, 3, a3, a4);
        id v7 = v10;
      }
    }
  }
}

void __90__CKMessageEditingView__applyExpressiveTextFormattingToAttributedText_forCompositionText___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
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
      uint64_t v9 = [v10 unsignedIntegerValue];
      id v7 = v10;
      if (v9 == 1)
      {
        objc_msgSend(*(id *)(a1 + 32), "ck_addTextStyle:options:range:", 1, 3, a3, a4);
        id v7 = v10;
      }
    }
  }
}

void __90__CKMessageEditingView__applyExpressiveTextFormattingToAttributedText_forCompositionText___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
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
      uint64_t v9 = [v10 unsignedIntegerValue];
      id v7 = v10;
      if (v9 == 1)
      {
        objc_msgSend(*(id *)(a1 + 32), "ck_addTextStyle:options:range:", 2, 3, a3, a4);
        id v7 = v10;
      }
    }
  }
}

uint64_t __90__CKMessageEditingView__applyExpressiveTextFormattingToAttributedText_forCompositionText___block_invoke_6(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2) {
    return objc_msgSend(*(id *)(result + 32), "ck_addTextStyle:options:range:", 1, 3, a3, a4);
  }
  return result;
}

- (void)_insertAdaptiveImageGlyphs:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F6BCC8];
  id v5 = a3;
  id v6 = [v4 sharedInstance];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__CKMessageEditingView__insertAdaptiveImageGlyphs___block_invoke;
  aBlock[3] = &unk_1E5621100;
  id v12 = v6;
  id v7 = v6;
  uint64_t v8 = _Block_copy(aBlock);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__CKMessageEditingView__insertAdaptiveImageGlyphs___block_invoke_2;
  v10[3] = &unk_1E5625C38;
  v10[4] = self;
  uint64_t v9 = _Block_copy(v10);
  objc_msgSend(v5, "__im_insertAdaptiveImageGlyphsForFileTransfersUsingFileTransferProvider:adaptiveImageGlyphProvider:isCommSafetySensitiveProvider:", v8, v9, &__block_literal_global_86);
}

uint64_t __51__CKMessageEditingView__insertAdaptiveImageGlyphs___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) transferForGUID:a2];
}

id __51__CKMessageEditingView__insertAdaptiveImageGlyphs___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 guid];
  id v4 = [*(id *)(a1 + 32) adaptiveImageGlyphForTransferGUID:v3];
  if (!v4)
  {
    id v5 = IMLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Do not have NSAdaptiveImageGlyph for transfer. Will display as blank space.", v7, 2u);
    }
  }

  return v4;
}

uint64_t __51__CKMessageEditingView__insertAdaptiveImageGlyphs___block_invoke_85()
{
  return 0;
}

- (id)adaptiveImageGlyphForTransferGUID:(id)a3
{
  id v3 = a3;
  id v4 = +[CKMediaObjectManager sharedInstance];
  id v5 = [v4 mediaObjectWithTransferGUID:v3 imMessage:0 chatContext:0];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 adaptiveImageGlyph];
  }
  else
  {
    uint64_t v8 = IMLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CKMessageEditingView adaptiveImageGlyphForTransferGUID:]((uint64_t)v3, v8);
    }

    id v7 = 0;
  }

  return v7;
}

- (CKComposition)currentComposition
{
  v2 = [(CKMessageEditingBalloonView *)self->_messageEditingBalloonView currentCompositionText];
  id v3 = [[CKComposition alloc] initWithText:v2 subject:0];

  return v3;
}

- (void)_rejectButtonSelected:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Reject button selected", v7, 2u);
    }
  }
  id v6 = [(CKMessageEditingView *)self messageEditingViewDelegate];
  [v6 messageEditingViewRejectButtonSelected:self];
}

- (void)_confirmButtonSelected:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Confirm button selected", v7, 2u);
    }
  }
  id v6 = [(CKMessageEditingView *)self messageEditingViewDelegate];
  [v6 messageEditingViewConfirmButtonSelected:self];
}

- (void)traitCollectionDidChange:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CKMessageEditingView;
  [(CKMessageEditingView *)&v12 traitCollectionDidChange:a3];
  id v4 = [(CKMessageEditingView *)self traitCollection];
  -[CKBalloonView setUserInterfaceStyle:](self->_messageEditingBalloonView, "setUserInterfaceStyle:", [v4 userInterfaceStyle]);

  id v5 = [(CKMessageEditingView *)self currentComposition];
  id v6 = [v5 text];

  id v7 = [(CKMessageEditingView *)self styledAttributedStringFromString:v6];
  [(CKTextBalloonView *)self->_messageEditingBalloonView setAttributedText:v7];
  uint64_t v8 = [(CKMessageEditingView *)self balloonColorType];
  [(CKColoredBalloonView *)self->_messageEditingBalloonView setColor:v8];
  uint64_t v9 = +[CKUIBehavior sharedBehaviors];
  uint64_t v10 = [v9 theme];
  uint64_t v11 = [v10 unfilledBalloonColorForColorType:v8];
  [v11 ckColor];
  -[CKBalloonView setStrokeColor:](self->_messageEditingBalloonView, "setStrokeColor:");

  [(CKBalloonView *)self->_messageEditingBalloonView setNeedsPrepareForDisplay];
  [(CKBalloonView *)self->_messageEditingBalloonView prepareForDisplayIfNeeded];
}

- (char)balloonColorType
{
  id v3 = [(CKMessageEditingView *)self messageEditingViewDelegate];
  char v4 = [v3 messageEditingColor];

  id v5 = [(CKMessageEditingView *)self currentComposition];
  id v6 = [v5 text];

  uint64_t v7 = objc_msgSend(v6, "__ck_bigEmojiStyle");
  switch([(CKMessageEditingView *)self messageEditingViewState])
  {
    case 1:
    case 3:
    case 4:
      if ((unint64_t)(v7 - 1) < 3) {
        char v4 = 13;
      }
      break;
    case 2:
      char v4 = 13;
      break;
    default:
      break;
  }

  return v4;
}

- (void)setMessageEditingViewState:(int64_t)a3
{
  if (self->_messageEditingViewState != a3)
  {
    self->_messageEditingViewState = a3;
    id v5 = [(CKMessageEditingView *)self messageEditingViewDelegate];
    unsigned int v6 = [v5 messageEditingViewBalloonHasTail];

    uint64_t v7 = [(CKMessageEditingView *)self currentComposition];
    id v25 = [v7 text];

    double v8 = 1.0;
    if (a3 == 2) {
      unsigned int v9 = 2;
    }
    else {
      unsigned int v9 = 0;
    }
    if (a3 != 2) {
      double v8 = 0.0;
    }
    BOOL v10 = a3 == 3;
    BOOL v11 = a3 == 3 || a3 != 2;
    if (v10) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = v6;
    }
    if (v10) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = v9;
    }
    if (v10) {
      double v14 = 0.0;
    }
    else {
      double v14 = v8;
    }
    -[UIButton setAlpha:](self->_rejectButton, "setAlpha:", v14, v8);
    [(UIButton *)self->_confirmButton setAlpha:v14];
    uint64_t v15 = [(CKMessageEditingView *)self balloonColorType];
    [(CKColoredBalloonView *)self->_messageEditingBalloonView setColor:v15];
    uint64_t v16 = +[CKUIBehavior sharedBehaviors];
    uint64_t v17 = [v16 theme];
    id v18 = [v17 unfilledBalloonColorForColorType:v15];
    [v18 ckColor];
    -[CKBalloonView setStrokeColor:](self->_messageEditingBalloonView, "setStrokeColor:");

    [(CKBalloonView *)self->_messageEditingBalloonView setBalloonStyle:v13];
    [(CKColoredBalloonView *)self->_messageEditingBalloonView setHasTail:v12];
    uint64_t v19 = +[CKUIBehavior sharedBehaviors];
    uint64_t v20 = [v19 theme];
    id v21 = objc_msgSend(v20, "balloonTextColorForColorType:", -[CKBalloonView color](self->_messageEditingBalloonView, "color"));
    uint64_t v22 = [(CKTextBalloonView *)self->_messageEditingBalloonView textView];
    [v22 setTextColor:v21];

    uint64_t v23 = [(CKTextBalloonView *)self->_messageEditingBalloonView textView];
    [v23 setShouldAdjustInsetsForMinimumSize:v11];

    id v24 = [(CKMessageEditingView *)self styledAttributedStringFromString:v25];
    [(CKTextBalloonView *)self->_messageEditingBalloonView setAttributedText:v24];
    [(CKBalloonView *)self->_messageEditingBalloonView setNeedsPrepareForDisplay];
    [(CKBalloonView *)self->_messageEditingBalloonView prepareForDisplayIfNeeded];
  }
}

- (BOOL)becomeFirstResponder
{
  v2 = [(CKTextBalloonView *)self->_messageEditingBalloonView textView];
  char v3 = [v2 becomeFirstResponder];

  return v3;
}

- (void)layoutSubviews
{
  v114.receiver = self;
  v114.super_class = (Class)CKMessageEditingView;
  [(CKMessageEditingView *)&v114 layoutSubviews];
  [(CKMessageEditingView *)self bounds];
  CGFloat v98 = v4;
  CGFloat v99 = v3;
  double v6 = v5;
  double v8 = v7;
  [(CKMessageEditingBalloonView *)self->_messageEditingBalloonView frame];
  CGFloat v96 = v10;
  CGFloat v97 = v9;
  CGFloat v94 = v12;
  CGFloat v95 = v11;
  int v13 = [(CKMessageEditingView *)self _shouldReverseLayoutDirection];
  double v14 = [(CKMessageEditingView *)self messageEditingViewDelegate];
  [v14 messageEditingViewDismissAnimationBalloonMaxWidth];
  double v16 = v15;

  uint64_t v17 = +[CKUIBehavior sharedBehaviors];
  [v17 balloonMaskTailWidth];
  double v19 = v18;

  double v83 = v19;
  double v20 = v16 - v19;
  -[UIButton sizeThatFits:](self->_rejectButton, "sizeThatFits:", v6, v8);
  double v22 = v21;
  double v24 = v23;
  -[UIButton sizeThatFits:](self->_confirmButton, "sizeThatFits:", v6, v8);
  if (v13) {
    double v27 = v26;
  }
  else {
    double v27 = v24;
  }
  if (v13) {
    double v28 = v25;
  }
  else {
    double v28 = v22;
  }
  double v92 = v24;
  double v93 = v22;
  double v90 = v26;
  double v91 = v25;
  if (v13) {
    double v26 = v24;
  }
  double v86 = v26;
  double v87 = v27;
  if (v13) {
    double v29 = v22;
  }
  else {
    double v29 = v25;
  }
  id v30 = [(CKMessageEditingView *)self traitCollection];
  uint64_t v31 = [v30 horizontalSizeClass];

  double v84 = v16;
  if (v31 == 1) {
    goto LABEL_14;
  }
  id v32 = +[CKUIBehavior sharedBehaviors];
  [v32 messageEditingNonCompactLeftEdgeToButtonMinimumPadding];
  double v34 = v28 + v33;
  v35 = +[CKUIBehavior sharedBehaviors];
  [v35 messageEditingNonCompactBalloonToLeftButtonPadding];
  double v37 = v16 + v34 + v36;
  v38 = +[CKUIBehavior sharedBehaviors];
  [v38 messageEditingNonCompactBalloonPillEdgeToRightButtonPadding];
  double v40 = v29 + v37 + v39;
  v41 = +[CKUIBehavior sharedBehaviors];
  [v41 messageEditingNonCompactRightEdgeToButtonPadding];
  double v43 = v40 - v42;

  if (v6 < v43)
  {
LABEL_14:
    double v44 = (v6 - v20 - v28 - v29) * 0.25;
    double v45 = v44;
    double v46 = v44;
    double v47 = v44;
  }
  else
  {
    v48 = +[CKUIBehavior sharedBehaviors];
    [v48 messageEditingNonCompactBalloonToLeftButtonPadding];
    double v47 = v49;

    v50 = +[CKUIBehavior sharedBehaviors];
    [v50 messageEditingNonCompactBalloonPillEdgeToRightButtonPadding];
    double v46 = v51;

    v52 = +[CKUIBehavior sharedBehaviors];
    [v52 messageEditingNonCompactRightEdgeToButtonPadding];
    double v44 = v53;

    double v45 = v6 - v28 - v47 - v20 - v46 - v29 - v44;
  }
  v115.origin.y = v98;
  v115.origin.x = v99;
  remainder.origin.x = v99;
  remainder.origin.y = v98;
  remainder.size.double width = v6;
  remainder.size.double height = v8;
  v54 = (double *)MEMORY[0x1E4F1DB28];
  CGSize v101 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  slice.CGPoint origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  CGPoint origin = slice.origin;
  slice.size = v101;
  v115.size.double width = v6;
  v115.size.double height = v8;
  CGRectDivide(v115, &slice, &remainder, v45, CGRectMinXEdge);
  v111.CGPoint origin = origin;
  v111.size = v101;
  CGRectDivide(remainder, &v111, &remainder, v28, CGRectMinXEdge);
  double v88 = v111.origin.y + floor((v111.size.height - v87) * 0.5);
  double v89 = v111.origin.x + floor((v111.size.width - v28) * 0.5);
  CGRectDivide(remainder, &slice, &remainder, v47, CGRectMinXEdge);
  CGRectDivide(remainder, &slice, &remainder, v44, CGRectMaxXEdge);
  v110.CGPoint origin = origin;
  v110.size = v101;
  CGRectDivide(remainder, &v110, &remainder, v29, CGRectMaxXEdge);
  double v85 = v110.origin.x + floor((v110.size.width - v29) * 0.5);
  double v55 = v110.origin.y + floor((v110.size.height - v86) * 0.5);
  CGRectDivide(remainder, &slice, &remainder, v46, CGRectMaxXEdge);
  double v56 = v54[1];
  double width = v54[2];
  double v58 = v54[3];
  unint64_t messageEditingViewState = self->_messageEditingViewState;
  if (messageEditingViewState > 4)
  {
    double v69 = v54[3];
    double v67 = v54[2];
    double v70 = v54[1];
    double v102 = *v54;
    double v104 = *v54;
  }
  else if (messageEditingViewState == 2)
  {
    double v104 = *v54;
    double height = remainder.size.height;
    double v75 = remainder.origin.x + 0.0;
    double v100 = remainder.origin.y + 0.0;
    double v67 = remainder.size.width - (0.0 - v83);
    CGSize v76 = *(CGSize *)(MEMORY[0x1E4F437F8] + 16);
    v109.CGPoint origin = (CGPoint)*MEMORY[0x1E4F437F8];
    v109.size = v76;
    LOBYTE(v108.origin.x) = 0;
    -[CKTextBalloonView sizeThatFits:textAlignmentInsets:isSingleLine:](self->_messageEditingBalloonView, "sizeThatFits:textAlignmentInsets:isSingleLine:", &v109, &v108, v67, remainder.size.height);
    if (v77 >= height) {
      double v69 = height;
    }
    else {
      double v69 = v77;
    }
    double v102 = v75 + floor((v67 - v67) * 0.5);
    double v70 = v100 + floor((height - v69) * 0.5);
  }
  else
  {
    v109.origin.x = v99;
    v109.origin.y = v98;
    v109.size.double width = v6;
    v109.size.double height = v8;
    v108.CGPoint origin = origin;
    v108.size = v101;
    v60 = [(CKMessageEditingView *)self messageEditingViewDelegate];
    [v60 messageEditingViewDismissAnimationContentInsets];
    CGFloat v62 = v61;
    CGFloat v64 = v63;

    v116.origin.x = v99;
    v116.origin.y = v98;
    v116.size.double width = v6;
    v116.size.double height = v8;
    CGRectDivide(v116, &v108, &v109, v62, CGRectMinXEdge);
    CGRectDivide(v109, &v108, &v109, v64, CGRectMaxXEdge);
    if (v84 >= v109.size.width) {
      double width = v109.size.width;
    }
    else {
      double width = v84;
    }
    long long v65 = *(_OWORD *)(MEMORY[0x1E4F437F8] + 16);
    v107[0] = *MEMORY[0x1E4F437F8];
    v107[1] = v65;
    char v106 = 0;
    -[CKTextBalloonView sizeThatFits:textAlignmentInsets:isSingleLine:](self->_messageEditingBalloonView, "sizeThatFits:textAlignmentInsets:isSingleLine:", v107, &v106, width, 1.79769313e308);
    double v67 = v66;
    double v69 = v68;
    memset(&v105, 0, sizeof(v105));
    CGRectDivide(v109, &v105, &v109, v66, CGRectMaxXEdge);
    double v102 = v105.origin.x + floor((v105.size.width - v67) * 0.5);
    double v70 = v105.origin.y + floor((v105.size.height - v69) * 0.5);
    v71 = [(CKMessageEditingBalloonView *)self->_messageEditingBalloonView messageEditingBalloonTextView];
    int v72 = objc_msgSend(v71, "ck_isTextLayoutExclusivelyUsingRTLWritingDirection");
    double v73 = -vabdd_f64(width, v67);
    double v56 = 0.0;
    if (!v72) {
      double v73 = 0.0;
    }
    double v104 = v73;

    double v58 = v69;
  }
  if (v13) {
    double v78 = v55;
  }
  else {
    double v78 = v88;
  }
  if (v13) {
    double v79 = v85;
  }
  else {
    double v79 = v89;
  }
  if (v13) {
    double v80 = v88;
  }
  else {
    double v80 = v55;
  }
  if (v13) {
    double v81 = v89;
  }
  else {
    double v81 = v85;
  }
  -[UIButton setFrame:](self->_rejectButton, "setFrame:", v79, v78, v93, v92);
  -[UIButton setFrame:](self->_confirmButton, "setFrame:", v81, v80, v91, v90);
  -[CKColoredBalloonView setFrame:](self->_messageEditingBalloonView, "setFrame:", v102, v70, v67, v69);
  -[CKMessageEditingBalloonView setCustomTextViewLayoutBounds:](self->_messageEditingBalloonView, "setCustomTextViewLayoutBounds:", v104, v56, width, v58);
  self->_firstLayoutPassCompleted = 1;
  [(CKMessageEditingBalloonView *)self->_messageEditingBalloonView frame];
  v118.origin.y = v96;
  v118.origin.x = v97;
  v118.size.double height = v94;
  v118.size.double width = v95;
  if (!CGRectEqualToRect(v117, v118))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_messageEditingViewDelegate);
    [WeakRetained messageEditingViewDidUpdateBalloonViewFrame:self];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = +[CKUIBehavior sharedBehaviors];
  [v6 messageEditingNonCompactLeftEdgeToButtonMinimumPadding];
  double v36 = v7;

  -[UIButton sizeThatFits:](self->_rejectButton, "sizeThatFits:", width, height);
  double v9 = v8;
  double v11 = v10;
  double v12 = +[CKUIBehavior sharedBehaviors];
  [v12 messageEditingNonCompactBalloonToLeftButtonPadding];
  double v14 = v13;

  double v15 = [(CKMessageEditingView *)self messageEditingViewDelegate];
  [v15 messageEditingViewDismissAnimationBalloonMaxWidth];
  double v17 = v16;

  double v18 = +[CKUIBehavior sharedBehaviors];
  [v18 messageEditingNonCompactBalloonPillEdgeToRightButtonPadding];
  double v20 = v19;
  double v21 = +[CKUIBehavior sharedBehaviors];
  [v21 balloonMaskTailWidth];
  double v23 = v20 - v22;

  -[UIButton sizeThatFits:](self->_confirmButton, "sizeThatFits:", width, height);
  double v25 = v24;
  double v27 = v26;
  double v28 = +[CKUIBehavior sharedBehaviors];
  [v28 messageEditingNonCompactRightEdgeToButtonPadding];
  double v30 = v29;

  double v31 = v36 + v9 + v14 + v17 + v23 + v25 + v30;
  -[CKBalloonView sizeThatFits:](self->_messageEditingBalloonView, "sizeThatFits:", v17, 1.79769313e308);
  if (v32 >= v11) {
    double v33 = v32;
  }
  else {
    double v33 = v11;
  }
  if (v33 >= v27) {
    double v34 = v33;
  }
  else {
    double v34 = v27;
  }
  double v35 = v31;
  result.double height = v34;
  result.double width = v35;
  return result;
}

- (id)keyCommands
{
  v2 = [MEMORY[0x1E4F1CA48] array];
  double v3 = (void *)MEMORY[0x1E4F42AF8];
  double v4 = objc_msgSend(NSString, "stringWithFormat:", @"%C", 3);
  double v5 = [v3 keyCommandWithInput:v4 modifierFlags:0 action:sel__confirmButtonSelected_];

  [v5 setWantsPriorityOverSystemBehavior:1];
  [v2 addObject:v5];
  double v6 = [MEMORY[0x1E4F42AF8] keyCommandWithInput:@"\r" modifierFlags:0 action:sel__confirmButtonSelected_];
  [v6 setWantsPriorityOverSystemBehavior:1];
  [v2 addObject:v6];
  double v7 = [MEMORY[0x1E4F42AF8] keyCommandWithInput:@"\r" modifierFlags:0x10000 action:sel__confirmButtonSelected_];
  [v7 setWantsPriorityOverSystemBehavior:1];
  [v2 addObject:v7];
  double v8 = (void *)[v2 copy];

  return v8;
}

- (void)applyGrammarCheckingIndication
{
  id v2 = [(CKTextBalloonView *)self->_messageEditingBalloonView textView];
  [v2 applyGrammarCheckingIndication];
}

- (void)underlineWithProofreadingInfo:(id)a3
{
  messageEditingBalloonView = self->_messageEditingBalloonView;
  id v4 = a3;
  id v13 = [(CKTextBalloonView *)messageEditingBalloonView textView];
  double v5 = [v4 objectForKeyedSubscript:@"TextCorrections"];
  double v6 = [v5 lastObject];
  double v7 = [v4 objectForKeyedSubscript:@"UnderlineRanges"];

  if (v7 && [v7 count])
  {
    double v8 = [v7 lastObject];
    double v9 = [v8 end];
    double v10 = [v13 endOfDocument];
    int v11 = [v9 isEqual:v10];

    if (v11)
    {
      double v12 = [v13 interactionAssistant];
      [v12 underlineCorrectedTextInRange:v8 typedString:v6];
    }
  }
}

- (void)messageEditingBalloonViewWritingToolsWillBegin:(id)a3
{
  id v4 = [(CKMessageEditingView *)self messageEditingViewDelegate];
  [v4 messageEditingViewWritingToolsWillBegin:self];
}

- (void)messageEditingBalloonViewWritingToolsDidEnd:(id)a3
{
  id v4 = [(CKMessageEditingView *)self messageEditingViewDelegate];
  [v4 messageEditingViewWritingToolsDidEnd:self];
}

- (void)messageEditingBalloonViewContentDidChange:(id)a3
{
  id v10 = [(CKMessageEditingBalloonView *)self->_messageEditingBalloonView currentCompositionText];
  BOOL v4 = [v10 length] != 0;
  [(UIButton *)self->_confirmButton setEnabled:v4];
  double v5 = [(UIButton *)self->_confirmButton configuration];
  double v6 = [(CKMessageEditingView *)self messageEditingViewDelegate];
  uint64_t v7 = [v6 messageEditingColor];

  double v8 = +[CKUIBehavior sharedBehaviors];
  [v8 updateMessageEditingConfirmButtonConfiguration:v5 forButtonColor:v7 isEnabled:v4];

  [(UIButton *)self->_confirmButton setConfiguration:v5];
  [(CKMessageEditingView *)self updateKeyboardActionButtonIfNeeded];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageEditingViewDelegate);
  [WeakRetained messageEditingViewDidUpdateBalloonViewContent:self];
}

- (void)messageEditingBalloonView:(id)a3 didChangeTextAnimationInRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F6E778], "sharedFeatureFlags", a3);
  int v8 = [v7 isExpressiveTextEnabled];

  if (v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_messageEditingViewDelegate);
    objc_msgSend(WeakRetained, "messageEditingView:didChangeTextAnimationInRange:", self, location, length);
  }
}

- (int64_t)messageEditingViewState
{
  return self->_messageEditingViewState;
}

- (CKComposition)originalComposition
{
  return self->_originalComposition;
}

- (BOOL)firstLayoutPassCompleted
{
  return self->_firstLayoutPassCompleted;
}

- (CKMessageEditingBalloonView)messageEditingBalloonView
{
  return self->_messageEditingBalloonView;
}

- (void)setMessageEditingBalloonView:(id)a3
{
}

- (CKMessageEditingViewDelegate)messageEditingViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageEditingViewDelegate);

  return (CKMessageEditingViewDelegate *)WeakRetained;
}

- (void)setMessageEditingViewDelegate:(id)a3
{
}

- (UIButton)confirmButton
{
  return self->_confirmButton;
}

- (void)setConfirmButton:(id)a3
{
}

- (UIButton)rejectButton
{
  return self->_rejectButton;
}

- (void)setRejectButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rejectButton, 0);
  objc_storeStrong((id *)&self->_confirmButton, 0);
  objc_destroyWeak((id *)&self->_messageEditingViewDelegate);
  objc_storeStrong((id *)&self->_messageEditingBalloonView, 0);

  objc_storeStrong((id *)&self->_originalComposition, 0);
}

- (void)adaptiveImageGlyphForTransferGUID:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18EF18000, a2, OS_LOG_TYPE_ERROR, "Could not create adaptive image glyph because could not find media object for transfer guid: %@", (uint8_t *)&v2, 0xCu);
}

@end