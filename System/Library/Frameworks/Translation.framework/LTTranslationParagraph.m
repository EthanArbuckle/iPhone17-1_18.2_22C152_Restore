@interface LTTranslationParagraph
@end

@implementation LTTranslationParagraph

void __45___LTTranslationParagraph_splitIntoSentences__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v4 = *(void **)(a1 + 32);
  v5 = NSString;
  id v6 = a2;
  objc_msgSend(v5, "stringWithFormat:", @"%zd", a3);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 range];
  objc_msgSend(v4, "addAttribute:value:range:", v9, v6, v7, v8);
}

void __45___LTTranslationParagraph_splitIntoSentences__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45___LTTranslationParagraph_splitIntoSentences__block_invoke_3;
  v7[3] = &unk_2651DC5A0;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = a3;
  uint64_t v10 = a4;
  [a2 enumerateKeysAndObjectsUsingBlock:v7];
}

void __45___LTTranslationParagraph_splitIntoSentences__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v25 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v25];
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 range];
    [v7 range];
    if (v9 + v8 != *(void *)(a1 + 40)) {
      __45___LTTranslationParagraph_splitIntoSentences__block_invoke_3_cold_1();
    }
    uint64_t v10 = [v7 range];
    [v7 range];
    uint64_t v12 = v11 + *(void *)(a1 + 48);
    v13 = [_LTTranslationSpan alloc];
    v14 = [v5 identifier];
    uint64_t v15 = [v5 shouldTranslate];
    v16 = [v5 metaInfoData];
    v17 = v13;
    v18 = v14;
    uint64_t v19 = v10;
    uint64_t v20 = v12;
    uint64_t v21 = v15;
  }
  else
  {
    v22 = [_LTTranslationSpan alloc];
    v14 = [v5 identifier];
    uint64_t v23 = [v5 shouldTranslate];
    v16 = [v5 metaInfoData];
    uint64_t v19 = *(void *)(a1 + 40);
    uint64_t v20 = *(void *)(a1 + 48);
    v17 = v22;
    v18 = v14;
    uint64_t v21 = v23;
  }
  v24 = -[_LTTranslationSpan initWithIdentifier:range:shouldTranslate:metaInfoData:](v17, "initWithIdentifier:range:shouldTranslate:metaInfoData:", v18, v19, v20, v21, v16);
  [*(id *)(a1 + 32) setObject:v24 forKeyedSubscript:v25];
}

uint64_t __45___LTTranslationParagraph_splitIntoSentences__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

void __45___LTTranslationParagraph_splitIntoSentences__block_invoke_3_cold_1()
{
  __assert_rtn("-[_LTTranslationParagraph splitIntoSentences]_block_invoke_3", "LTTranslationParagraph.m", 99, "previousSpan.range.location + previousSpan.range.length == textRange.location");
}

@end