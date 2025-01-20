@interface EMKTextKit2Controller
@end

@implementation EMKTextKit2Controller

uint64_t __29___EMKTextKit2Controller_log__block_invoke()
{
  log_logger = (uint64_t)os_log_create("com.apple.emojikit", "TK2Controller");
  return MEMORY[0x1F41817F8]();
}

uint64_t __57___EMKTextKit2Controller___startTextEffectBasedAnimation__block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 32), "addRippleAnimationForRange_emk:");
  [*(id *)(a1 + 40) addObject:v2];

  return 1;
}

void __57___EMKTextKit2Controller___startTextEffectBasedAnimation__block_invoke_46(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = a3;
    _os_log_impl(&dword_1E4A5E000, v5, OS_LOG_TYPE_DEFAULT, "coordinator finished: %{BOOL}d", (uint8_t *)v7, 8u);
  }

  objc_msgSend(*(id *)(a1 + 32), "__rippleCoordinatorDidCompleteWithFinished:", a3);
  v6 = [*(id *)(a1 + 40) emojiAnimationDelegate];
  [v6 textViewDidEndEmojiRippleAnimation:*(void *)(a1 + 40)];
}

uint64_t __55___EMKTextKit2Controller__updateEmojiAttributesOfText___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", @"EMKEmojiTokenList", a4, a2, a3);
  v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  return objc_msgSend(v7, "addAttribute:value:range:", @"EMKEmojiConversionLanguage", v8, a2, a3);
}

uint64_t __42___EMKTextKit2Controller___startAnimation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startRippleAnimation];
}

uint64_t __52___EMKTextKit2Controller_touchHasEmojiSignificance___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, BOOL *a5)
{
  v7 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52___EMKTextKit2Controller_touchHasEmojiSignificance___block_invoke_2;
  v9[3] = &unk_1E6E97138;
  long long v12 = *(_OWORD *)(a1 + 64);
  long long v10 = *(_OWORD *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 56);
  uint64_t result = [v7 enumerateTextSegmentsInRange:a3 type:0 options:0 usingBlock:v9];
  *a5 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) != 0;
  return result;
}

BOOL __52___EMKTextKit2Controller_touchHasEmojiSignificance___block_invoke_2(uint64_t a1, void *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v12 = a2;
  v13 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v23.origin.x = a3;
    v23.origin.y = a4;
    v23.size.width = a5;
    v23.size.height = a6;
    v14 = NSStringFromCGRect(v23);
    int v18 = 138412546;
    v19 = v14;
    __int16 v20 = 2112;
    id v21 = v12;
    _os_log_impl(&dword_1E4A5E000, v13, OS_LOG_TYPE_DEFAULT, "touchHasEmojiSignificance: textSegmentFrame %@ touchedWordRange: %@", (uint8_t *)&v18, 0x16u);
  }
  v24.origin.x = a3;
  v24.origin.y = a4;
  v24.size.width = a5;
  v24.size.height = a6;
  BOOL v15 = CGRectContainsPoint(v24, *(CGPoint *)(a1 + 56));
  if (v15)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    v16 = *(double **)(*(void *)(a1 + 48) + 8);
    v16[4] = a3;
    v16[5] = a4;
    v16[6] = a5;
    v16[7] = a6;
  }

  return !v15;
}

uint64_t __52___EMKTextKit2Controller_touchHasEmojiSignificance___block_invoke_57(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 rangeInElement];
  v5 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v25 = v3;
    __int16 v26 = 2112;
    v27 = v4;
    _os_log_impl(&dword_1E4A5E000, v5, OS_LOG_TYPE_DEFAULT, "layoutFragment: %@ - rangeInElement: %@", buf, 0x16u);
  }

  v6 = [v3 textElement];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v6;
      uint64_t v8 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = [v7 elementRange];
        long long v10 = [v7 paragraphContentRange];
        uint64_t v11 = [v7 paragraphSeparatorRange];
        *(_DWORD *)buf = 138412802;
        id v25 = v9;
        __int16 v26 = 2112;
        v27 = v10;
        __int16 v28 = 2112;
        v29 = v11;
        _os_log_impl(&dword_1E4A5E000, v8, OS_LOG_TYPE_DEFAULT, "paragraph range: %@ - paragraphContentRange: %@ - paragraphSeparatorRange: %@", buf, 0x20u);
      }
      id v12 = [v7 attributedString];
      uint64_t v13 = [v12 length];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __52___EMKTextKit2Controller_touchHasEmojiSignificance___block_invoke_59;
      v17[3] = &unk_1E6E97188;
      id v18 = *(id *)(a1 + 40);
      id v19 = *(id *)(a1 + 48);
      id v14 = v4;
      long long v22 = *(_OWORD *)(a1 + 56);
      uint64_t v23 = *(void *)(a1 + 72);
      uint64_t v15 = *(void *)(a1 + 32);
      id v20 = v14;
      uint64_t v21 = v15;
      objc_msgSend(v12, "enumerateAttribute:inRange:options:usingBlock:", @"EMKEmojiTokenList", 0, v13, 0, v17);
    }
  }

  return 1;
}

uint64_t __52___EMKTextKit2Controller_touchHasEmojiSignificance___block_invoke_59(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v9 = a2;
  if (v9)
  {
    uint64_t v23 = v9;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v23;
      uint64_t v11 = *(void **)(a1 + 32);
      id v12 = [*(id *)(a1 + 40) location];
      uint64_t v13 = [*(id *)(a1 + 48) location];
      uint64_t v14 = [v11 offsetFromLocation:v12 toLocation:v13];

      uint64_t v15 = v14 + a3;
      v16 = *(void **)(a1 + 32);
      v17 = [*(id *)(a1 + 40) location];
      id v18 = [v16 locationFromLocation:v17 withOffset:v15];

      id v19 = [*(id *)(a1 + 32) locationFromLocation:v18 withOffset:a4];
      id v20 = (void *)[objc_alloc(MEMORY[0x1E4FB08B0]) initWithLocation:v18 endLocation:v19];
      if ([v20 intersectsWithTextRange:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)])
      {
        *a5 = 1;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
        uint64_t v21 = objc_alloc_init(_EMKTouchInfo);
        [(_EMKTouchInfo *)v21 setTokenList:v10];
        -[_EMKTouchInfo setFrame:](v21, "setFrame:", *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 56));
        -[_EMKTouchInfo setTokenListRange:](v21, "setTokenListRange:", v15, a4);
        [*(id *)(a1 + 56) setLastTouchInfo:v21];
      }
    }
  }
  return MEMORY[0x1F41817F8]();
}

void __51___EMKTextKit2Controller_textTapGestureRecognized___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained setOverlayView:0];
  if (v7)
  {
    unint64_t v4 = *(void *)(a1 + 72) + *(void *)(a1 + 64);
    if (v4 <= [*(id *)(a1 + 32) length])
    {
      v5 = *(void **)(a1 + 40);
      v6 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", *(void *)(a1 + 64), *(void *)(a1 + 72));
      LODWORD(v5) = [v5 isEqualToString:v6];

      if (v5) {
        objc_msgSend(*(id *)(a1 + 48), "replaceRange:withEmojiToken:language:", *(void *)(a1 + 64), *(void *)(a1 + 72), v7, @"en");
      }
    }
  }
  [WeakRetained setLastTouchInfo:0];
}

uint64_t __51___EMKTextKit2Controller_textViewDidLayoutSubviews__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateOverlayView];
}

@end