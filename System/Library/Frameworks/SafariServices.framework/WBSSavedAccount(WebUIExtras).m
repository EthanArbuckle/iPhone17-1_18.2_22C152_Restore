@interface WBSSavedAccount(WebUIExtras)
- (id)_firstSiteMatchingSearchPattern:()WebUIExtras withTokenizer:;
- (void)safari_getTitle:()WebUIExtras detail:forTableViewCell:withSearchPattern:emphasizeUserName:;
@end

@implementation WBSSavedAccount(WebUIExtras)

- (id)_firstSiteMatchingSearchPattern:()WebUIExtras withTokenizer:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v7 = [a1 userVisibleSites];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v24;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v24 != v10) {
        objc_enumerationMutation(v7);
      }
      v12 = *(void **)(*((void *)&v23 + 1) + 8 * v11);
      if ([(id)objc_opt_class() stringMatchesPatternWithTokenizer:a4 string:v12 pattern:v6 matchingType:1])break; {
      if (v9 == ++v11)
      }
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v7 = objc_msgSend(a1, "sites", 0);
    uint64_t v13 = [v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (!v13)
    {
LABEL_17:
      id v17 = 0;
      goto LABEL_19;
    }
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
LABEL_11:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v20 != v15) {
        objc_enumerationMutation(v7);
      }
      v12 = *(void **)(*((void *)&v19 + 1) + 8 * v16);
      if ([(id)objc_opt_class() stringMatchesPatternWithTokenizer:a4 string:v12 pattern:v6 matchingType:1])break; {
      if (v14 == ++v16)
      }
      {
        uint64_t v14 = [v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v14) {
          goto LABEL_11;
        }
        goto LABEL_17;
      }
    }
  }
  id v17 = v12;
LABEL_19:

  return v17;
}

- (void)safari_getTitle:()WebUIExtras detail:forTableViewCell:withSearchPattern:emphasizeUserName:
{
  v71[1] = *MEMORY[0x1E4F143B8];
  id v59 = a5;
  id v10 = a6;
  int v61 = a7;
  if (a7)
  {
    uint64_t v11 = [a1 user];
    v12 = [a1 userVisibleDomain];
    v62 = _WBSLocalizedString();
    uint64_t v13 = _WBSLocalizedString();
    uint64_t v14 = [a1 customTitle];
    uint64_t v15 = [v14 length];

    uint64_t v60 = v13;
    if (!v15)
    {
      long long v19 = v12;
      goto LABEL_18;
    }
    uint64_t v16 = NSString;
    id v17 = [a1 customTitle];
    if ([v12 length]) {
      v18 = v12;
    }
    else {
      v18 = (void *)v13;
    }
    long long v19 = [v16 stringWithFormat:@"%@ — %@", v17, v18];
    goto LABEL_16;
  }
  uint64_t v11 = [a1 effectiveTitle];
  v62 = _WBSLocalizedString();
  long long v19 = [a1 user];
  uint64_t v60 = _WBSLocalizedString();
  id v17 = [a1 customTitle];
  if ([v17 length])
  {
    v12 = [a1 userVisibleDomain];
    if ([v12 length])
    {
      long long v20 = v11;
      long long v21 = [a1 customTitle];
      long long v22 = [a1 userVisibleDomain];
      char v23 = [v21 isEqualToString:v22];

      if (v23)
      {
        uint64_t v11 = v20;
        goto LABEL_18;
      }
      long long v24 = NSString;
      if ([v19 length]) {
        long long v25 = v19;
      }
      else {
        long long v25 = (void *)v60;
      }
      id v17 = [a1 userVisibleDomain];
      [v24 stringWithFormat:@"%@ — %@", v25, v17];
      long long v19 = v12 = v19;
      uint64_t v11 = v20;
    }
LABEL_16:
  }
LABEL_18:
  id v63 = v10;
  if ([v10 length])
  {
    CFAllocatorRef v26 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFLocaleRef v27 = (const __CFLocale *)[MEMORY[0x1E4F1CA20] currentLocale];
    v72.location = 0;
    v72.length = 0;
    CFStringTokenizerRef v28 = CFStringTokenizerCreate(v26, 0, v72, 0, v27);
  }
  else
  {
    CFStringTokenizerRef v28 = 0;
  }
  uint64_t v29 = [v11 length];
  id v30 = objc_alloc(MEMORY[0x1E4F28E48]);
  uint64_t v31 = *MEMORY[0x1E4FB12B0];
  v58 = v11;
  if (v29)
  {
    uint64_t v70 = *MEMORY[0x1E4FB12B0];
    v32 = +[_SFAccountManagerAppearanceValues titleFontForNarrowCell];
    v71[0] = v32;
    v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v71 forKeys:&v70 count:1];
    v34 = (void *)[v30 initWithString:v11 attributes:v33];

    if (v61)
    {
      uint64_t v35 = 0;
    }
    else
    {
      v39 = [a1 customTitle];
      uint64_t v40 = [v39 length];

      if (v40) {
        uint64_t v35 = 3;
      }
      else {
        uint64_t v35 = 1;
      }
    }
    v36 = +[_SFAccountManagerAppearanceValues titleFontForNarrowCell];
    highlightMatchingRanges((uint64_t)v28, v34, v10, v35, v36);
  }
  else
  {
    v68[0] = *MEMORY[0x1E4FB12B0];
    v36 = +[_SFAccountManagerAppearanceValues titleFontForNarrowCell];
    v69[0] = v36;
    v68[1] = *MEMORY[0x1E4FB12B8];
    v37 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v69[1] = v37;
    v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:v68 count:2];
    v34 = (void *)[v30 initWithString:v62 attributes:v38];
  }
  id v41 = v34;
  *a3 = v41;
  uint64_t v42 = [v19 length];
  id v43 = objc_alloc(MEMORY[0x1E4F28E48]);
  if (v42)
  {
    uint64_t v66 = v31;
    v44 = +[_SFAccountManagerAppearanceValues subtitleFontForNarrowCellWithText:v19];
    v67 = v44;
    v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v67 forKeys:&v66 count:1];
    v46 = (void *)[v43 initWithString:v19 attributes:v45];

    if (v61)
    {
      v47 = [a1 customTitle];
      uint64_t v48 = [v47 length];

      if (v48) {
        uint64_t v49 = 3;
      }
      else {
        uint64_t v49 = 1;
      }
    }
    else
    {
      uint64_t v49 = 0;
    }
    v51 = +[_SFAccountManagerAppearanceValues subtitleFontForNarrowCellWithText:v19];
    v54 = v10;
    highlightMatchingRanges((uint64_t)v28, v46, v10, v49, v51);
    v50 = (void *)v60;
  }
  else
  {
    v64[0] = v31;
    v50 = (void *)v60;
    v51 = +[_SFAccountManagerAppearanceValues subtitleFontForNarrowCellWithText:v60];
    v65[0] = v51;
    v64[1] = *MEMORY[0x1E4FB12B8];
    v52 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v65[1] = v52;
    v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:v64 count:2];
    v46 = (void *)[v43 initWithString:v60 attributes:v53];

    v54 = v63;
  }

  id v55 = v46;
  *a4 = v55;
  if (v28) {
    CFRelease(v28);
  }
}

@end