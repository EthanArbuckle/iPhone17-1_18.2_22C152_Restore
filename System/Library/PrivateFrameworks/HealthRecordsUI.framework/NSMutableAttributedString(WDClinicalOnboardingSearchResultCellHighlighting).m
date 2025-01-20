@interface NSMutableAttributedString(WDClinicalOnboardingSearchResultCellHighlighting)
+ (id)wd_stringWithString:()WDClinicalOnboardingSearchResultCellHighlighting highlightingStrings:baseColor:baseFont:highlightingBaseColor:highlightColor:highlightFont:;
@end

@implementation NSMutableAttributedString(WDClinicalOnboardingSearchResultCellHighlighting)

+ (id)wd_stringWithString:()WDClinicalOnboardingSearchResultCellHighlighting highlightingStrings:baseColor:baseFont:highlightingBaseColor:highlightColor:highlightFont:
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v41 = a8;
  id v40 = a9;
  v19 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v14];
  uint64_t v20 = [v14 length];
  uint64_t v39 = *MEMORY[0x1E4FB06F8];
  objc_msgSend(v19, "addAttribute:value:range:");
  if ([v15 count] == 1
    && ([v15 firstObject],
        v21 = objc_claimAutoreleasedReturnValue(),
        uint64_t v22 = [v21 length],
        v21,
        !v22))
  {
    objc_msgSend(v19, "addAttribute:value:range:", *MEMORY[0x1E4FB0700], v16, 0, v20);
  }
  else
  {
    uint64_t v23 = *MEMORY[0x1E4FB0700];
    objc_msgSend(v19, "addAttribute:value:range:", *MEMORY[0x1E4FB0700], v18, 0, v20, v18, v17, v16);
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id obj = v15;
    uint64_t v38 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v38)
    {
      uint64_t v37 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v38; ++i)
        {
          if (*(void *)v43 != v37) {
            objc_enumerationMutation(obj);
          }
          v25 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          if ([v25 length])
          {
            v26 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
            uint64_t v27 = objc_msgSend(v14, "rangeOfString:options:range:", v25, 1, 0, v20);
            if (v27 != 0x7FFFFFFFFFFFFFFFLL)
            {
              uint64_t v29 = v27;
              uint64_t v30 = v28;
              do
              {
                if (!v29
                  || objc_msgSend(v26, "characterIsMember:", objc_msgSend(v14, "characterAtIndex:", v29 - 1)))
                {
                  objc_msgSend(v19, "addAttribute:value:range:", v39, v40, v29, v30);
                  objc_msgSend(v19, "addAttribute:value:range:", v23, v41, v29, v30);
                }
                uint64_t v29 = objc_msgSend(v14, "rangeOfString:options:range:", v25, 1, v29 + v30, v20 - (v29 + v30));
                uint64_t v30 = v31;
              }
              while (v29 != 0x7FFFFFFFFFFFFFFFLL);
            }
          }
        }
        uint64_t v38 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
      }
      while (v38);
    }

    id v16 = v35;
    id v18 = v33;
    id v17 = v34;
  }

  return v19;
}

@end