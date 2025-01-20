@interface NSAttributedString
@end

@implementation NSAttributedString

uint64_t __84__NSAttributedString_HUAdditions__hu_attributedStringWithDefaultAttributes_inRange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "addAttributes:range:", a2, a3, a4);
}

void __84__NSAttributedString_HUAdditions__hu_attributedStringWithDefaultAttributes_inRange___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v15 = a2;
  v7 = [v15 image];

  if (v7)
  {
    v8 = [v15 image];
    v9 = [v8 imageWithConfiguration:*(void *)(a1 + 32)];
    [v15 setImage:v9];

    v10 = [*(id *)(a1 + 40) attributesAtIndex:a3 effectiveRange:0];
    v11 = (void *)[v10 mutableCopy];

    uint64_t v12 = *MEMORY[0x1E4F42540];
    v13 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F42540]];
    v14 = (void *)[v13 mutableCopy];

    [v14 setLineBreakMode:1];
    [v11 setObject:v14 forKeyedSubscript:v12];
    objc_msgSend(*(id *)(a1 + 40), "setAttributes:range:", v11, a3, a4);
  }
}

void __78__NSAttributedString_HUAdditions__hu_safeAttributedStringWithHTML_attributes___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    uint64_t v10 = *MEMORY[0x1E4F42530];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v12 isEqualToString:v10])
        {
          v13 = [v6 objectForKeyedSubscript:v12];
          v14 = [v13 host];

          if (!v14) {
            objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", v12, a3, a4);
          }
        }
        else if (([*(id *)(a1 + 40) containsObject:v12] & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", v12, a3, a4);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
}

@end