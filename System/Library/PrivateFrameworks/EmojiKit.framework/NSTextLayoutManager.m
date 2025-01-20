@interface NSTextLayoutManager
@end

@implementation NSTextLayoutManager

uint64_t __90__NSTextLayoutManager_Helper__enumerateTextParagraphsFromLocation_options_usingBlock_emk___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 textElement];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    uint64_t v4 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else {
    uint64_t v4 = 1;
  }

  return v4;
}

uint64_t __72__NSTextLayoutManager_Helper__enumerateAllTextParagraphsUsingBlock_emk___block_invoke(uint64_t a1)
{
  return 1;
}

uint64_t __81__NSTextLayoutManager_Helper___enumerateTextLineFragmentsInTextRange_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v29 = [v3 rangeInElement];
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "textRangeByIntersectingWithTextRange:");
  v5 = v4;
  if (v4 && ([v4 isEmpty] & 1) == 0)
  {
    v7 = *(void **)(a1 + 40);
    v8 = [v29 location];
    v9 = [v5 location];
    NSUInteger v10 = [v7 offsetFromLocation:v8 toLocation:v9];

    v11 = *(void **)(a1 + 40);
    v12 = [v29 location];
    v13 = [v5 endLocation];
    uint64_t v14 = [v11 offsetFromLocation:v12 toLocation:v13];

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id obj = [v3 textLineFragments];
    uint64_t v32 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v32)
    {
      v26 = v5;
      id v27 = v3;
      NSUInteger v15 = 0;
      NSUInteger range2 = v14 - v10;
      uint64_t v30 = *(void *)v34;
      while (2)
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v34 != v30) {
            objc_enumerationMutation(obj);
          }
          [*(id *)(*((void *)&v33 + 1) + 8 * i) characterRange];
          NSUInteger length = v39.length;
          v39.location = v15;
          v40.location = v10;
          v40.NSUInteger length = range2;
          NSRange v18 = NSIntersectionRange(v39, v40);
          if (v18.length)
          {
            v19 = *(void **)(a1 + 40);
            v20 = [v29 location];
            v21 = [v19 locationFromLocation:v20 withOffset:v18.location];

            v22 = [*(id *)(a1 + 40) locationFromLocation:v21 withOffset:v18.length];
            v23 = (void *)[objc_alloc(MEMORY[0x1E4FB08B0]) initWithLocation:v21 endLocation:v22];
            int v24 = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();

            if (!v24)
            {
              int v6 = 1;
              goto LABEL_15;
            }
          }
          v15 += length;
          ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
        }
        uint64_t v32 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
        if (v32) {
          continue;
        }
        break;
      }
      int v6 = 0;
LABEL_15:
      v5 = v26;
      id v3 = v27;
    }
    else
    {
      int v6 = 0;
    }
  }
  else
  {
    int v6 = 1;
  }

  return v6 ^ 1u;
}

void __69__NSTextLayoutManager_Helper___enumerateAllTokenListsUsingBlock_emk___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 attributedString];
  v5 = [v3 elementRange];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__NSTextLayoutManager_Helper___enumerateAllTokenListsUsingBlock_emk___block_invoke_2;
  v8[3] = &unk_1E6E96FA8;
  int v6 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v6;
  id v10 = v5;
  id v11 = *(id *)(a1 + 48);
  id v7 = v5;
  objc_msgSend(v4, "_enumerateTokenListsInReverse:handler_emk:", 0, v8);
}

void __69__NSTextLayoutManager_Helper___enumerateAllTokenListsUsingBlock_emk___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = *(void **)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  id v9 = a2;
  id v10 = [v8 location];
  id v11 = [*(id *)(a1 + 48) location];
  uint64_t v12 = [v7 offsetFromLocation:v10 toLocation:v11];

  uint64_t v13 = v12 + a3;
  uint64_t v14 = *(void **)(a1 + 32);
  NSUInteger v15 = [*(id *)(a1 + 40) location];
  id v18 = [v14 locationFromLocation:v15 withOffset:v13];

  v16 = [*(id *)(a1 + 32) locationFromLocation:v18 withOffset:a4];
  v17 = (void *)[objc_alloc(MEMORY[0x1E4FB08B0]) initWithLocation:v18 endLocation:v16];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

uint64_t __54__NSTextLayoutManager_Helper__animatingGlyphCount_emk__block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += objc_msgSend(a2, "animatingGlyphCount_emk");
  return 1;
}

@end