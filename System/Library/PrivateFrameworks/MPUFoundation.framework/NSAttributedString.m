@interface NSAttributedString
@end

@implementation NSAttributedString

void __107__NSAttributedString_MPUDynamicType__MPU_attributedStringByUpdatingTextStyleFontsToPreferredTextStyleFonts__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v13 = [a2 fontDescriptor];
  v7 = [v13 objectForKey:*MEMORY[0x263F1D208]];
  if (v7)
  {
    v8 = [MEMORY[0x263F1C660] preferredFontDescriptorWithTextStyle:v7];
    v9 = objc_msgSend(v8, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v13, "symbolicTraits"));

    v10 = *(void **)(a1 + 32);
    uint64_t v11 = *MEMORY[0x263F1C238];
    v12 = [MEMORY[0x263F1C658] fontWithDescriptor:v9 size:0.0];
    objc_msgSend(v10, "addAttribute:value:range:", v11, v12, a3, a4);
  }
}

void __67__NSAttributedString_MPUDynamicType__MPU_tallestFontFromAttributes__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6)
  {
    [v6 _bodyLeading];
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    if (v4 > *(double *)(v5 + 24))
    {
      *(double *)(v5 + 24) = v4;
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    }
  }
}

@end