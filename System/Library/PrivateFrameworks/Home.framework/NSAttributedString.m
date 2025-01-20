@interface NSAttributedString
@end

@implementation NSAttributedString

uint64_t __84__NSAttributedString_HFAdditions__hf_attributedStringWithDefaultAttributes_inRange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "addAttributes:range:", a2, a3, a4);
}

void __84__NSAttributedString_HFAdditions__hf_attributedStringWithDefaultAttributes_inRange___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
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

    uint64_t v12 = *MEMORY[0x263F1C268];
    v13 = [v11 objectForKeyedSubscript:*MEMORY[0x263F1C268]];
    v14 = (void *)[v13 mutableCopy];

    [v14 setLineBreakMode:1];
    [v11 setObject:v14 forKeyedSubscript:v12];
    objc_msgSend(*(id *)(a1 + 40), "setAttributes:range:", v11, a3, a4);
  }
}

void __69__NSAttributedString_HFAdditions__hf_loadFromHTMLWithString_options___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)MEMORY[0x263F086A0];
  uint64_t v5 = *(void *)(a1 + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __69__NSAttributedString_HFAdditions__hf_loadFromHTMLWithString_options___block_invoke_2;
  v7[3] = &unk_264096340;
  id v8 = v3;
  id v6 = v3;
  [v4 loadFromHTMLWithString:v5 options:MEMORY[0x263EFFA78] completionHandler:v7];
}

void __69__NSAttributedString_HFAdditions__hf_loadFromHTMLWithString_options___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  if (v7)
  {
    id v8 = HFLogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v7;
      _os_log_error_impl(&dword_20B986000, v8, OS_LOG_TYPE_ERROR, "-[NSAttributedString loadFromHTMLWithString:options:completionHandler:]: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  [*(id *)(a1 + 32) finishWithResult:v6 error:v7];
}

id __78__NSAttributedString_HFAdditions__hf_safeAttributedStringWithHTML_attributes___block_invoke(uint64_t a1, void *a2)
{
  v27[1] = *MEMORY[0x263EF8340];
  id v3 = (void *)[a2 mutableCopy];
  uint64_t v4 = [v3 length];
  uint64_t v5 = [v3 string];
  uint64_t v6 = objc_msgSend(v5, "rangeOfString:options:range:", @"\u2028", 0, 0, v4);
  uint64_t v8 = v7;

  while (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v3, "replaceCharactersInRange:withString:", v6, v8, @"\n");
    uint64_t v9 = v6 + 1;
    if (v4 == v9) {
      break;
    }
    id v10 = [v3 string];
    uint64_t v6 = objc_msgSend(v10, "rangeOfString:options:range:", @"\u2028", 0, v9, v4 - v9);
    uint64_t v8 = v11;
  }
  id v12 = objc_alloc(MEMORY[0x263EFF9C0]);
  v27[0] = *MEMORY[0x263F1C268];
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:1];
  v14 = (void *)[v12 initWithArray:v13];

  uint64_t v15 = [v3 length];
  uint64_t v21 = MEMORY[0x263EF8330];
  uint64_t v22 = 3221225472;
  v23 = __78__NSAttributedString_HFAdditions__hf_safeAttributedStringWithHTML_attributes___block_invoke_2;
  v24 = &unk_264096368;
  id v16 = v3;
  id v25 = v16;
  id v17 = v14;
  id v26 = v17;
  objc_msgSend(v16, "enumerateAttributesInRange:options:usingBlock:", 0, v15, 0, &v21);
  uint64_t v18 = *(void *)(a1 + 32);
  if (v18) {
    objc_msgSend(v16, "addAttributes:range:", v18, 0, objc_msgSend(v16, "length", v21, v22, v23, v24, v25));
  }
  v19 = objc_msgSend(MEMORY[0x263F58190], "futureWithResult:", v16, v21, v22, v23, v24);

  return v19;
}

void __78__NSAttributedString_HFAdditions__hf_safeAttributedStringWithHTML_attributes___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
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
    uint64_t v10 = *MEMORY[0x263F1C258];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
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

uint64_t __78__NSAttributedString_HFAdditions__hf_safeAttributedStringWithHTML_attributes___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x263F58190] futureWithError:a2];
}

uint64_t __114__NSAttributedString_HFStringGeneratoreAdditions___synthesizeAttributedSubstringFromRange_usingDefaultAttributes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "addAttributes:range:", a2, a3, a4);
}

@end