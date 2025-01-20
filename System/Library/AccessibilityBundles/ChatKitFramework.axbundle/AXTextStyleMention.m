@interface AXTextStyleMention
@end

@implementation AXTextStyleMention

uint64_t ___AXTextStyleMention_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (v7)
  {
    v15 = v7;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v15 unsignedIntegerValue] == 1)
    {
      v8 = [[AXCKMentionSubelement alloc] initWithTextView:*(void *)(a1 + 32)];
      uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
      v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "setRange:", a3, a4);
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setType:2];
      v11 = accessibilityLocalizedString(*(void **)(a1 + 40));
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setAccessibilityValue:v11];

      v12 = [*(id *)(a1 + 48) string];
      v13 = objc_msgSend(v12, "substringWithRange:", a3, a4);
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setAccessibilityLabel:v13];
    }
  }

  return MEMORY[0x270F9A758]();
}

@end