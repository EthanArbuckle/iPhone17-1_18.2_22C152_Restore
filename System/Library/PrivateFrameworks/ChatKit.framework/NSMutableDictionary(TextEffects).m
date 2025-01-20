@interface NSMutableDictionary(TextEffects)
- (id)__ck_fontUsedWhenTogglingTypingAttributesUsingBaseFont:()TextEffects;
- (uint64_t)_ck_removeTextEffect;
- (uint64_t)ck_removeBoldItalicUnderlineAndStrikethroughTypingAttributes;
- (uint64_t)ck_removeTextAnimationsTypingAttributes;
- (uint64_t)ck_toggleTextEffect:()TextEffects;
- (void)_ck_addTextEffect:()TextEffects;
- (void)_ck_toggleTextStyleBoldUsingBaseFont:()TextEffects;
- (void)_ck_toggleTextStyleItalicUsingBaseFont:()TextEffects;
- (void)_ck_toggleTextStyleStrikethrough;
- (void)_ck_toggleTextStyleUnderline;
- (void)ck_addTypingAttributeFontTrait:()TextEffects;
- (void)ck_removeTypingAttributeFontTrait:()TextEffects;
- (void)ck_toggleTextStyles:()TextEffects baseFont:;
@end

@implementation NSMutableDictionary(TextEffects)

- (void)ck_addTypingAttributeFontTrait:()TextEffects
{
  uint64_t v5 = *MEMORY[0x1E4FB06F8];
  v6 = [a1 objectForKeyedSubscript:*MEMORY[0x1E4FB06F8]];
  if (v6)
  {
    id v8 = v6;
    v7 = objc_msgSend(v6, "ck_fontByAddingSymbolicTrait:", a3);
    [a1 setObject:v7 forKeyedSubscript:v5];

    v6 = v8;
  }
}

- (void)ck_removeTypingAttributeFontTrait:()TextEffects
{
  uint64_t v5 = *MEMORY[0x1E4FB06F8];
  v6 = [a1 objectForKeyedSubscript:*MEMORY[0x1E4FB06F8]];
  if (v6)
  {
    id v8 = v6;
    v7 = objc_msgSend(v6, "ck_fontByRemovingSymbolicTrait:", a3);
    [a1 setObject:v7 forKeyedSubscript:v5];

    v6 = v8;
  }
}

- (uint64_t)ck_removeBoldItalicUnderlineAndStrikethroughTypingAttributes
{
  objc_msgSend(a1, "ck_removeTypingAttributeFontTrait:", 2);
  objc_msgSend(a1, "ck_removeTypingAttributeFontTrait:", 1);
  [a1 removeObjectForKey:*MEMORY[0x1E4FB0808]];
  [a1 removeObjectForKey:*MEMORY[0x1E4FB0768]];
  [a1 removeObjectForKey:*MEMORY[0x1E4F6E3F8]];
  [a1 removeObjectForKey:*MEMORY[0x1E4F6E408]];
  [a1 removeObjectForKey:*MEMORY[0x1E4F6E420]];
  uint64_t v2 = *MEMORY[0x1E4F6E410];

  return [a1 removeObjectForKey:v2];
}

- (uint64_t)ck_removeTextAnimationsTypingAttributes
{
  [a1 removeObjectForKey:*MEMORY[0x1E4FB0788]];
  uint64_t v2 = *MEMORY[0x1E4F6E400];

  return [a1 removeObjectForKey:v2];
}

- (void)ck_toggleTextStyles:()TextEffects baseFont:
{
  id v6 = a4;
  if ((a3 & 4) != 0)
  {
    objc_msgSend(a1, "_ck_toggleTextStyleUnderline");
    if ((a3 & 8) == 0)
    {
LABEL_3:
      if ((a3 & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((a3 & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(a1, "_ck_toggleTextStyleStrikethrough");
  if ((a3 & 1) == 0)
  {
LABEL_4:
    if ((a3 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  objc_msgSend(a1, "_ck_toggleTextStyleBoldUsingBaseFont:", v6);
  if ((a3 & 2) != 0) {
LABEL_5:
  }
    objc_msgSend(a1, "_ck_toggleTextStyleItalicUsingBaseFont:", v6);
LABEL_6:
}

- (void)_ck_toggleTextStyleUnderline
{
  uint64_t v2 = *MEMORY[0x1E4F6E420];
  id v3 = [a1 objectForKeyedSubscript:*MEMORY[0x1E4F6E420]];
  if (v3)
  {
    [a1 removeObjectForKey:v2];
    [a1 removeObjectForKey:*MEMORY[0x1E4FB0808]];
  }
  else
  {
    [a1 setObject:&unk_1EDF164A8 forKeyedSubscript:v2];
    [a1 setObject:&unk_1EDF164C0 forKeyedSubscript:*MEMORY[0x1E4FB0808]];
  }
}

- (void)_ck_toggleTextStyleStrikethrough
{
  uint64_t v2 = *MEMORY[0x1E4F6E410];
  id v3 = [a1 objectForKeyedSubscript:*MEMORY[0x1E4F6E410]];
  if (v3)
  {
    [a1 removeObjectForKey:v2];
    [a1 removeObjectForKey:*MEMORY[0x1E4FB0768]];
  }
  else
  {
    [a1 setObject:&unk_1EDF164A8 forKeyedSubscript:v2];
    [a1 setObject:&unk_1EDF164C0 forKeyedSubscript:*MEMORY[0x1E4FB0768]];
  }
}

- (id)__ck_fontUsedWhenTogglingTypingAttributesUsingBaseFont:()TextEffects
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(a1, "___ck_typingAttributesFont");
  id v6 = (void *)v5;
  if (v5) {
    v7 = (void *)v5;
  }
  else {
    v7 = v4;
  }
  id v8 = v7;

  return v8;
}

- (void)_ck_toggleTextStyleBoldUsingBaseFont:()TextEffects
{
  uint64_t v4 = *MEMORY[0x1E4F6E3F8];
  id v5 = a3;
  id v8 = [a1 objectForKeyedSubscript:v4];
  id v6 = objc_msgSend(a1, "__ck_fontUsedWhenTogglingTypingAttributesUsingBaseFont:", v5);

  if (v8) {
    [a1 removeObjectForKey:v4];
  }
  else {
    [a1 setObject:&unk_1EDF164A8 forKeyedSubscript:v4];
  }
  v7 = objc_msgSend(v6, "ck_fontBySettingBoldEnabled:", v8 == 0);
  [a1 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4FB06F8]];
}

- (void)_ck_toggleTextStyleItalicUsingBaseFont:()TextEffects
{
  uint64_t v4 = *MEMORY[0x1E4F6E408];
  id v5 = a3;
  id v8 = [a1 objectForKeyedSubscript:v4];
  id v6 = objc_msgSend(a1, "__ck_fontUsedWhenTogglingTypingAttributesUsingBaseFont:", v5);

  if (v8) {
    [a1 removeObjectForKey:v4];
  }
  else {
    [a1 setObject:&unk_1EDF164A8 forKeyedSubscript:v4];
  }
  v7 = objc_msgSend(v6, "ck_fontBySettingItalicEnabled:", v8 == 0);
  [a1 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4FB06F8]];
}

- (uint64_t)ck_toggleTextEffect:()TextEffects
{
  if (objc_msgSend(a1, "ck_activeTextEffectFromTypingAttributes") == a3)
  {
    return objc_msgSend(a1, "_ck_removeTextEffect");
  }
  else
  {
    return objc_msgSend(a1, "_ck_addTextEffect:", a3);
  }
}

- (void)_ck_addTextEffect:()TextEffects
{
  if (a3)
  {
    id v5 = IMTextEffectNameFromType();
    if (v5)
    {
      id v8 = v5;
      id v6 = [MEMORY[0x1E4F43368] animationWithName:v5];
      if (v6)
      {
        [a1 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4FB0788]];
        v7 = [NSNumber numberWithInteger:a3];
        [a1 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F6E400]];
      }
      id v5 = v8;
    }
  }
}

- (uint64_t)_ck_removeTextEffect
{
  [a1 setObject:0 forKeyedSubscript:*MEMORY[0x1E4FB0788]];
  uint64_t v2 = *MEMORY[0x1E4F6E400];

  return [a1 setObject:0 forKeyedSubscript:v2];
}

@end