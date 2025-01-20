@interface NSMutableAttributedString
@end

@implementation NSMutableAttributedString

uint64_t __82__NSMutableAttributedString_CRTT__cr_replaceStorageInRange_withStorage_fromRange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAttributes:range:", a2, a3 - *(void *)(a1 + 40) + *(void *)(a1 + 56), a4);
}

void __83__NSMutableAttributedString_CRTT__cr_mergeAttributesInRange_withStorage_fromRange___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  v8 = [v7 objectForKeyedSubscript:@"_ts"];
  v9 = v8;
  if (v8)
  {
    v10 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40) + a3;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __83__NSMutableAttributedString_CRTT__cr_mergeAttributesInRange_withStorage_fromRange___block_invoke_2;
    v14[3] = &unk_1E64C1AD0;
    id v12 = v8;
    uint64_t v13 = *(void *)(a1 + 32);
    id v15 = v12;
    uint64_t v16 = v13;
    id v17 = v7;
    objc_msgSend(v10, "enumerateAttribute:inRange:options:usingBlock:", @"_ts", v11, a4, 0x100000, v14);
  }
}

void __83__NSMutableAttributedString_CRTT__cr_mergeAttributesInRange_withStorage_fromRange___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (!v7 || [*(id *)(a1 + 32) isGreaterThanTimestamp:v7]) {
    objc_msgSend(*(id *)(a1 + 40), "setAttributes:range:", *(void *)(a1 + 48), a3, a4);
  }
}

@end