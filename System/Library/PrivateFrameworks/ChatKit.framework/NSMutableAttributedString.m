@interface NSMutableAttributedString
@end

@implementation NSMutableAttributedString

void __73__NSMutableAttributedString_CKUtilities____ck_removeAllAttributesExcept___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if (([*(id *)(a1 + 32) containsObject:v12] & 1) == 0) {
          objc_msgSend(*(id *)(a1 + 40), "removeAttribute:range:", v12, a3, a4);
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

void __64__NSMutableAttributedString_CKUtilities____ck_filterAttributes___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__NSMutableAttributedString_CKUtilities____ck_filterAttributes___block_invoke_2;
  v9[3] = &unk_1E5624040;
  id v8 = *(id *)(a1 + 40);
  uint64_t v11 = a3;
  uint64_t v12 = a4;
  v9[4] = *(void *)(a1 + 32);
  id v10 = v8;
  [a2 enumerateKeysAndObjectsUsingBlock:v9];
}

void __64__NSMutableAttributedString_CKUtilities____ck_filterAttributes___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (((*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))() & 1) == 0) {
    objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", v3, *(void *)(a1 + 48), *(void *)(a1 + 56));
  }
}

void __82__NSMutableAttributedString_TextEffects__ck_toggleTextEffectNamed_range_getAdded___block_invoke(void *a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v9 = a2;
  if (v9)
  {
    id v12 = v9;
    BOOL v11 = [v9 unsignedIntegerValue] != a1[5] || a1[6] != a3 || a1[7] != a4;
    id v9 = v12;
  }
  else
  {
    BOOL v11 = 1;
  }
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = v11;
  *a5 = 1;
}

uint64_t __80__NSMutableAttributedString_TextEffects__ck_removeAnimatedTextEffectsFromRange___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2) {
    return objc_msgSend(*(id *)(result + 32), "removeAttribute:range:", *MEMORY[0x1E4F6E400], a3, a4);
  }
  return result;
}

uint64_t __80__NSMutableAttributedString_TextEffects__ck_removeAnimatedTextEffectsFromRange___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2) {
    return objc_msgSend(*(id *)(result + 32), "removeAttribute:range:", *MEMORY[0x1E4FB0788], a3, a4);
  }
  return result;
}

void __105__NSMutableAttributedString_TextEffects___ck_intersectingTextAnimationOnRange_getExistingAnimationRange___block_invoke(NSRange *a1, void *a2, NSUInteger a3, NSUInteger a4, unsigned char *a5)
{
  id v11 = a2;
  v13.location = a3;
  v13.length = a4;
  if (NSIntersectionRange(v13, a1[48]).length)
  {
    uint64_t v10 = *(void *)(a1[2].location + 8);
    *(void *)(v10 + 32) = a3;
    *(void *)(v10 + 40) = a4;
    objc_storeStrong((id *)(*(void *)(a1[2].length + 8) + 40), a2);
    *a5 = 1;
  }
}

void __71__NSMutableAttributedString_TextEffects__ck_applyTextEffectType_range___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", *MEMORY[0x1E4F6D538], a3, a4);
    uint64_t v7 = *MEMORY[0x1E4FB0700];
    objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", *MEMORY[0x1E4FB0700], a3, a4);
    id v11 = +[CKUIBehavior sharedBehaviors];
    id v8 = *(void **)(a1 + 32);
    id v9 = [v11 theme];
    uint64_t v10 = [v9 entryFieldTextColor];
    objc_msgSend(v8, "addAttribute:value:range:", v7, v10, a3, a4);
  }
}

void __71__NSMutableAttributedString_TextEffects__ck_applyTextEffectType_range___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v7, a3 - v7);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) addObject:v8];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3 + a4;
  }
}

void __72__NSMutableAttributedString_TextEffects__ck_addTextStyle_options_range___block_invoke(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4)
{
  id v7 = a2;
  if (v7)
  {
    v9.location = a3;
    v9.length = a4;
    if (NSIntersectionRange(v9, *(NSRange *)(a1 + 40)).length) {
      objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", *MEMORY[0x1E4F6E400], a3, a4);
    }
  }
}

void __72__NSMutableAttributedString_TextEffects__ck_addTextStyle_options_range___block_invoke_2(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4)
{
  id v7 = a2;
  if (v7)
  {
    v9.location = a3;
    v9.length = a4;
    if (NSIntersectionRange(v9, *(NSRange *)(a1 + 40)).length) {
      objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", *MEMORY[0x1E4FB0788], a3, a4);
    }
  }
}

void __72__NSMutableAttributedString_TextEffects__ck_addTextStyle_options_range___block_invoke_103(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = objc_msgSend(a2, "ck_fontByAddingSymbolicTrait:", 2);
    v4 = *(void **)(a1 + 32);
    uint64_t v5 = *MEMORY[0x1E4FB06F8];
  }
  else
  {
    v6 = *(void **)(a1 + 32);
    uint64_t v7 = *MEMORY[0x1E4FB06F8];
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4FB08E0], "ck_boldBalloonFont");
    v4 = v6;
    uint64_t v5 = v7;
  }
  id v8 = (id)v3;
  objc_msgSend(v4, "addAttribute:value:range:", v5);
}

void __72__NSMutableAttributedString_TextEffects__ck_addTextStyle_options_range___block_invoke_2_106(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = objc_msgSend(a2, "ck_fontByAddingSymbolicTrait:", 1);
    v4 = *(void **)(a1 + 32);
    uint64_t v5 = *MEMORY[0x1E4FB06F8];
  }
  else
  {
    v6 = *(void **)(a1 + 32);
    uint64_t v7 = *MEMORY[0x1E4FB06F8];
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4FB08E0], "ck_italicBalloonFont");
    v4 = v6;
    uint64_t v5 = v7;
  }
  id v8 = (id)v3;
  objc_msgSend(v4, "addAttribute:value:range:", v5);
}

void __62__NSMutableAttributedString_Helper__ck_removeAttributesNotIn___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  if ([v7 count])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v13, (void)v14) & 1) == 0) {
            objc_msgSend(*(id *)(a1 + 40), "removeAttribute:range:", v13, a3, a4);
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
  }
}

@end