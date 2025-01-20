@interface NSAttributedString(TextEffects)
- (BOOL)ck_actionForIMTextStyle:()TextEffects range:;
- (BOOL)ck_attributedStringHasTextEffectType:()TextEffects inRange:;
- (BOOL)ck_hasTextStyle:()TextEffects range:;
- (id)ck_attributedStringByApplyingTextEffectType:()TextEffects range:;
- (id)ck_attributedStringByApplyingTextStyle:()TextEffects range:;
- (id)ck_attributedStringByConverting:()TextEffects range:;
- (id)ck_attributedStringByTogglingTextEffectNamed:()TextEffects range:;
- (uint64_t)ck_activeTextEffectTypeInRange:()TextEffects;
- (uint64_t)ck_activeTextStylesInRange:()TextEffects;
@end

@implementation NSAttributedString(TextEffects)

- (id)ck_attributedStringByApplyingTextEffectType:()TextEffects range:
{
  v8 = (void *)[a1 mutableCopy];
  objc_msgSend(v8, "ck_applyTextEffectType:range:", a3, a4, a5);
  v9 = (void *)[v8 copy];

  return v9;
}

- (id)ck_attributedStringByApplyingTextStyle:()TextEffects range:
{
  v8 = (void *)[a1 mutableCopy];
  objc_msgSend(v8, "ck_addTextStyle:options:range:", a3, 3, a4, a5);
  v9 = (void *)[v8 copy];

  return v9;
}

- (BOOL)ck_attributedStringHasTextEffectType:()TextEffects inRange:
{
  if (a4 >= [a1 length])
  {
    [a1 length];
    return 0;
  }
  else
  {
    unint64_t v9 = [a1 length];
    BOOL v10 = 0;
    if ([a1 length] && a4 + a5 <= v9)
    {
      uint64_t v15 = 0;
      unint64_t v16 = 0;
      v11 = objc_msgSend(a1, "attributesAtIndex:longestEffectiveRange:inRange:", a4, &v15, a4, a5);
      v12 = [v11 objectForKey:*MEMORY[0x1E4F6E400]];
      BOOL v13 = v12
         && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
         && [v12 unsignedIntegerValue] == a3;
      BOOL v10 = v16 >= a5 && v13;
    }
  }
  return v10;
}

- (uint64_t)ck_activeTextEffectTypeInRange:()TextEffects
{
  return objc_msgSend(a1, "ck_activeTextEffectTypeInRange:ignoreRangeLengthCheck:", a3, a4, 0);
}

- (id)ck_attributedStringByTogglingTextEffectNamed:()TextEffects range:
{
  id v8 = a3;
  unint64_t v9 = (void *)[a1 mutableCopy];
  objc_msgSend(v9, "ck_toggleTextEffectNamed:range:getAdded:", v8, a4, a5, 0);

  BOOL v10 = (void *)[v9 copy];

  return v10;
}

- (id)ck_attributedStringByConverting:()TextEffects range:
{
  id v8 = a3;
  unint64_t v9 = (void *)[a1 mutableCopy];
  objc_msgSend(v9, "ck_convertAttributesUsingConversionHandler:range:", v8, a4, a5);

  BOOL v10 = (void *)[v9 copy];

  return v10;
}

- (BOOL)ck_actionForIMTextStyle:()TextEffects range:
{
  id v8 = IMTextStyleAttributeNameFromStyle();
  if (v8)
  {
    uint64_t v14 = 0;
    uint64_t v15 = (NSRange *)&v14;
    uint64_t v16 = 0x3010000000;
    v17 = "";
    long long v18 = xmmword_18F81B060;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __65__NSAttributedString_TextEffects__ck_actionForIMTextStyle_range___block_invoke;
    v13[3] = &unk_1E5624810;
    v13[4] = &v14;
    objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v8, a4, a5, 0, v13);
    v19.location = a4;
    v19.length = a5;
    NSRange v9 = NSIntersectionRange(v15[2], v19);
    BOOL v11 = v9.location == a4 && v9.length == a5;
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (uint64_t)ck_activeTextStylesInRange:()TextEffects
{
  if (![a1 length]) {
    return 0;
  }
  v5 = [a1 attributesAtIndex:a3 effectiveRange:0];
  v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4FB0808]];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = 4;
    }
    else {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F6E420]];

  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = 4;
    }
  }
  NSRange v9 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4FB0768]];

  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v7 |= 8uLL;
    }
  }
  BOOL v10 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F6E410]];

  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v7 |= 8uLL;
    }
  }
  BOOL v11 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4FB06F8]];
  v12 = v11;
  if (v11)
  {
    BOOL v13 = [v11 fontDescriptor];
    v7 |= __rbit32([v13 symbolicTraits]) >> 30;
  }
  uint64_t v14 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F6E3F8]];

  if (v14)
  {
    objc_opt_class();
    v7 |= objc_opt_isKindOfClass() & 1;
  }
  uint64_t v15 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F6E408]];

  if (v15)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v7 |= 2uLL;
    }
  }

  return v7;
}

- (BOOL)ck_hasTextStyle:()TextEffects range:
{
  return (objc_msgSend(a1, "ck_activeTextStylesInRange:", a4, a5) & a3) != 0;
}

@end