@interface NSMutableAttributedString(DataDetectorsSupport)
- (BOOL)dd_urlifyClientRange:()DataDetectorsSupport index:context:;
- (uint64_t)dd_resetResults;
- (uint64_t)dd_urlifyResult:()DataDetectorsSupport withBlock:referenceDate:context:;
- (void)dd_appendUrl:()DataDetectorsSupport context:range:backedAttributes:;
- (void)dd_makeLinksForResultsInAttributesOfType:()DataDetectorsSupport context:;
- (void)dd_makeLinksForResultsInAttributesOfType:()DataDetectorsSupport context:range:;
- (void)dd_makeLinksForResultsInAttributesOfType:()DataDetectorsSupport usingURLificationBlock:context:range:;
- (void)dd_replaceResultAttributesWithSimpleLinksForTypes:()DataDetectorsSupport context:;
- (void)dd_resetResults:()DataDetectorsSupport;
@end

@implementation NSMutableAttributedString(DataDetectorsSupport)

- (uint64_t)dd_urlifyResult:()DataDetectorsSupport withBlock:referenceDate:context:
{
  v44[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v11 = a4;
  id v12 = a5;
  id v13 = a6;
  [v10 coreResult];
  NSUInteger RangeForURLification = DDResultGetRangeForURLification();
  NSUInteger v16 = v15;
  v17 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
  NSUInteger v18 = [a1 length];
  v45.location = RangeForURLification;
  v45.length = v16;
  v47.location = 0;
  v47.length = v18;
  NSRange v19 = NSIntersectionRange(v45, v47);
  if (v19.location == RangeForURLification && v19.length == v16)
  {
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x2020000000;
    char v42 = 0;
    uint64_t v20 = *MEMORY[0x1E4F42530];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __99__NSMutableAttributedString_DataDetectorsSupport__dd_urlifyResult_withBlock_referenceDate_context___block_invoke;
    v38[3] = &unk_1E5A85DF0;
    v38[4] = a1;
    v38[5] = &v39;
    objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v20, RangeForURLification, v16, 0, v38);
    if (*((unsigned char *)v40 + 24))
    {
      uint64_t v21 = 0;
LABEL_29:
      _Block_object_dispose(&v39, 8);
      goto LABEL_30;
    }
    v37 = [NSString stringWithFormat:@"%@/%lu", @"embedded-result", RangeForURLification];
    uint64_t v35 = [v10 coreResult];
    v22 = v11[2](v11);
    if (v22)
    {
      v23 = objc_msgSend(MEMORY[0x1E4F1CB10], "dd_URLWithPotentiallyInvalidURLString:", v22);
LABEL_10:
      v24 = v23;
      if (v23 && (dd_urlLooksSuspicious(v23) & 1) == 0)
      {
        if (DDShouldUseLightLinksForResult())
        {
          uint64_t v25 = *MEMORY[0x1E4F425C0];
          v44[0] = *MEMORY[0x1E4F425C8];
          v44[1] = v25;
          v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];
        }
        else
        {
          v34 = [MEMORY[0x1E4F28B50] mainBundle];
          v33 = [v34 bundleIdentifier];
          int v27 = [v33 isEqualToString:@"com.apple.mobilenotes"];
          v28 = v33;
          if (v27)
          {
            uint64_t v29 = *MEMORY[0x1E4F425C0];
            v43[0] = *MEMORY[0x1E4F42510];
            v43[1] = v29;
            uint64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:2];
            v28 = v33;
            v36 = (void *)v30;
          }
          else
          {
            v36 = 0;
          }
        }
        objc_msgSend(a1, "dd_appendUrl:context:range:backedAttributes:", v24, v13, RangeForURLification, v16, v36);

        uint64_t v21 = 1;
        goto LABEL_28;
      }
LABEL_24:
      uint64_t v21 = 0;
LABEL_28:

      goto LABEL_29;
    }
    if (DDResultHasType())
    {
      v26 = [v13 objectForKeyedSubscript:@"IncludeMoney"];
      if ([v26 BOOLValue])
      {

        goto LABEL_20;
      }
      BOOL v31 = +[DDConversionAction actionAvailableForResult:v35];

      if (v31)
      {
LABEL_20:
        v22 = DDInternalURLStringForResultIdentifier();
        if (v22)
        {
          v23 = [MEMORY[0x1E4F1CB10] URLWithString:v22];
          goto LABEL_10;
        }
LABEL_23:
        v24 = 0;
        goto LABEL_24;
      }
    }
    v22 = 0;
    goto LABEL_23;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v46.location = RangeForURLification;
    v46.length = v16;
    -[NSMutableAttributedString(DataDetectorsSupport) dd_urlifyResult:withBlock:referenceDate:context:]((int)v10, v46, 0, v18);
  }
  uint64_t v21 = 0;
LABEL_30:

  return v21;
}

- (void)dd_appendUrl:()DataDetectorsSupport context:range:backedAttributes:
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  NSUInteger v15 = [MEMORY[0x1E4F1CA60] dictionaryWithObject:v12 forKey:*MEMORY[0x1E4F42530]];
  NSUInteger v16 = v15;
  if (v13) {
    [v15 setObject:v13 forKeyedSubscript:@"DDContext"];
  }
  objc_msgSend(a1, "addAttributes:range:", v16, a5, a6);
  if ([v14 count])
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __95__NSMutableAttributedString_DataDetectorsSupport__dd_appendUrl_context_range_backedAttributes___block_invoke;
    v17[3] = &unk_1E5A85DC8;
    id v18 = v12;
    id v19 = v14;
    uint64_t v20 = a1;
    objc_msgSend(a1, "enumerateAttributesInRange:options:usingBlock:", a5, a6, 0, v17);
  }
}

- (void)dd_makeLinksForResultsInAttributesOfType:()DataDetectorsSupport context:range:
{
  id v10 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    -[NSMutableAttributedString(DataDetectorsSupport) dd_makeLinksForResultsInAttributesOfType:context:]();
  }
  v11 = +[DDOperation urlificationBlockForTypes:a3];
  objc_msgSend(a1, "dd_makeLinksForResultsInAttributesOfType:usingURLificationBlock:context:range:", a3, v11, v10, a5, a6);
}

- (void)dd_makeLinksForResultsInAttributesOfType:()DataDetectorsSupport usingURLificationBlock:context:range:
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v35 = a4;
  id v11 = a5;
  id v12 = [v11 objectForKeyedSubscript:@"CoreSpotlightUniqueIdentifier"];
  if (v12) {
    BOOL v13 = DDTrackEventCreationInHostApplication(0);
  }
  else {
    BOOL v13 = 0;
  }
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  NSRange v45 = __Block_byref_object_copy__4;
  NSRange v46 = __Block_byref_object_dispose__4;
  id v47 = 0;
  if (a6 != 0x7FFFFFFFFFFFFFFFLL && a7)
  {
    unint64_t v14 = [a1 length];
    uint64_t v15 = v14;
    if (a6 > v14 || a6 + a7 > v14)
    {
      int v27 = MEMORY[0x1E4F14500];
      id v28 = MEMORY[0x1E4F14500];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v50.location = a6;
        v50.length = a7;
        uint64_t v29 = NSStringFromRange(v50);
        -[NSMutableAttributedString(DataDetectorsSupport) dd_makeLinksForResultsInAttributesOfType:usingURLificationBlock:context:range:](v29, buf, v15);
      }
    }
    else
    {
      NSUInteger v16 = [v11 objectForKey:@"ReferenceDate"];
      uint64_t v17 = *MEMORY[0x1E4F5F118];
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __129__NSMutableAttributedString_DataDetectorsSupport__dd_makeLinksForResultsInAttributesOfType_usingURLificationBlock_context_range___block_invoke;
      v36[3] = &unk_1E5A85E40;
      v36[4] = a1;
      id v39 = v35;
      v34 = v16;
      v37 = v34;
      id v18 = v11;
      BOOL v41 = v13;
      id v38 = v18;
      v40 = &v42;
      objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v17, a6, a7, 0, v36);
      id v19 = [v18 objectForKeyedSubscript:@"CustomActionRanges"];
      if (v19)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v20 = [v19 count];
          if (v20)
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              v22 = objc_msgSend(v19, "objectAtIndexedSubscript:", i, v34);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v24 = [v22 rangeValue];
                if (v24 != 0x7FFFFFFFFFFFFFFFLL)
                {
                  if (v23) {
                    objc_msgSend(a1, "dd_urlifyClientRange:index:context:", v24, v23, i, v18);
                  }
                }
              }
            }
          }
        }
      }
      if (v13)
      {
        uint64_t v25 = [(id)dd_makeLinksForResultsInAttributesOfType_usingURLificationBlock_context_range___trackedCoreSpotlightUniqueIdentifiersCache objectForKey:v12];
        BOOL v26 = v25 == 0;

        if (v26)
        {
          [(id)v43[5] enumerateObjectsUsingBlock:&__block_literal_global_10];
          uint64_t v30 = (void *)dd_makeLinksForResultsInAttributesOfType_usingURLificationBlock_context_range___trackedCoreSpotlightUniqueIdentifiersCache;
          if (!dd_makeLinksForResultsInAttributesOfType_usingURLificationBlock_context_range___trackedCoreSpotlightUniqueIdentifiersCache)
          {
            id v31 = objc_alloc_init(MEMORY[0x1E4F1C998]);
            v32 = (void *)dd_makeLinksForResultsInAttributesOfType_usingURLificationBlock_context_range___trackedCoreSpotlightUniqueIdentifiersCache;
            dd_makeLinksForResultsInAttributesOfType_usingURLificationBlock_context_range___trackedCoreSpotlightUniqueIdentifiersCache = (uint64_t)v31;

            uint64_t v30 = (void *)dd_makeLinksForResultsInAttributesOfType_usingURLificationBlock_context_range___trackedCoreSpotlightUniqueIdentifiersCache;
          }
          v33 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v34);
          [v30 setObject:v33 forKey:v12];
        }
        else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
        {
          -[NSMutableAttributedString(DataDetectorsSupport) dd_makeLinksForResultsInAttributesOfType:usingURLificationBlock:context:range:]();
        }
      }

      int v27 = v34;
    }
  }
  _Block_object_dispose(&v42, 8);
}

- (uint64_t)dd_resetResults
{
  return objc_msgSend(a1, "dd_resetResults:", 0);
}

- (void)dd_resetResults:()DataDetectorsSupport
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v25 = 0;
  BOOL v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v5 = [a1 length];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:8];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __67__NSMutableAttributedString_DataDetectorsSupport__dd_resetResults___block_invoke;
  v19[3] = &unk_1E5A85D78;
  id v8 = v6;
  id v20 = v8;
  id v9 = v7;
  char v24 = a3;
  v22 = a1;
  uint64_t v23 = &v25;
  id v21 = v9;
  objc_msgSend(a1, "enumerateAttributesInRange:options:usingBlock:", 0, v5, 0, v19);
  if ((a3 & 1) == 0)
  {
    id v14 = v9;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v10 = dd_transientAttributesSet();
    uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v29 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v10);
          }
          objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:");
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v29 count:16];
      }
      while (v11);
    }

    id v9 = v14;
  }
  if (*((unsigned char *)v26 + 24)) {
    [a1 endEditing];
  }

  _Block_object_dispose(&v25, 8);
}

- (BOOL)dd_urlifyClientRange:()DataDetectorsSupport index:context:
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  NSUInteger v11 = [a1 length];
  v27.location = a3;
  v27.length = a4;
  v29.location = 0;
  v29.length = v11;
  NSRange v12 = NSIntersectionRange(v27, v29);
  if (v12.location == a3 && v12.length == a4)
  {
    uint64_t v22 = 0;
    uint64_t v23 = &v22;
    uint64_t v24 = 0x2020000000;
    char v25 = 0;
    uint64_t v13 = *MEMORY[0x1E4F42530];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __86__NSMutableAttributedString_DataDetectorsSupport__dd_urlifyClientRange_index_context___block_invoke;
    v21[3] = &unk_1E5A85E18;
    v21[4] = &v22;
    objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v13, a3, a4, 0, v21);
    BOOL v14 = *((unsigned char *)v23 + 24) == 0;
    if (!*((unsigned char *)v23 + 24))
    {
      long long v15 = (void *)MEMORY[0x1E4F1CB10];
      long long v16 = [NSString stringWithFormat:@"%@:%lu", @"x-apple-data-detectors-clientdefined", a5];
      long long v17 = [v15 URLWithString:v16];

      uint64_t v18 = *MEMORY[0x1E4F425C0];
      v26[0] = *MEMORY[0x1E4F425C8];
      v26[1] = v18;
      id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
      objc_msgSend(a1, "dd_appendUrl:context:range:backedAttributes:", v17, v10, a3, a4, v19);
    }
    _Block_object_dispose(&v22, 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v28.location = a3;
      v28.length = a4;
      -[NSMutableAttributedString(DataDetectorsSupport) dd_urlifyClientRange:index:context:](v28, 0, v11);
    }
    BOOL v14 = 0;
  }

  return v14;
}

- (void)dd_makeLinksForResultsInAttributesOfType:()DataDetectorsSupport context:
{
  id v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    -[NSMutableAttributedString(DataDetectorsSupport) dd_makeLinksForResultsInAttributesOfType:context:]();
  }
  v7 = +[DDOperation urlificationBlockForTypes:a3];
  objc_msgSend(a1, "dd_makeLinksForResultsInAttributesOfType:usingURLificationBlock:context:range:", a3, v7, v6, 0, objc_msgSend(a1, "length"));
}

- (void)dd_replaceResultAttributesWithSimpleLinksForTypes:()DataDetectorsSupport context:
{
  id v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    -[NSMutableAttributedString(DataDetectorsSupport) dd_replaceResultAttributesWithSimpleLinksForTypes:context:]();
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __109__NSMutableAttributedString_DataDetectorsSupport__dd_replaceResultAttributesWithSimpleLinksForTypes_context___block_invoke;
  v7[3] = &__block_descriptor_40_e229___NSString_40__0____DDResult____CFRuntimeBase_QAQ____DDQueryRange____DDQueryOffset_b16b16b32____DDQueryOffset_b16b16b32_____qq_q____CFArray_____CFString_____CFString__v____CFDictionary_qCf_8__NSString_16__NSDate_24__NSTimeZone_32l;
  v7[4] = a3;
  objc_msgSend(a1, "dd_makeLinksForResultsInAttributesOfType:usingURLificationBlock:context:range:", a3, v7, v6, 0, objc_msgSend(a1, "length"));
  objc_msgSend(a1, "removeAttribute:range:", *MEMORY[0x1E4F5F118], 0, objc_msgSend(a1, "length"));
}

- (void)dd_urlifyResult:()DataDetectorsSupport withBlock:referenceDate:context:.cold.1(int a1, NSRange range, NSUInteger a3, NSUInteger a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = NSStringFromRange(range);
  v15.location = a3;
  v15.length = a4;
  v7 = NSStringFromRange(v15);
  OUTLINED_FUNCTION_2_3();
  NSUInteger v11 = v6;
  __int16 v12 = v8;
  uint64_t v13 = v9;
  _os_log_error_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Bad result %@: its range %@ is not completely included in the range %@ of the string it is attached to", v10, 0x20u);
}

- (void)dd_urlifyClientRange:()DataDetectorsSupport index:context:.cold.1(NSRange a1, NSUInteger a2, NSUInteger a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSStringFromRange(a1);
  v12.location = a2;
  v12.length = a3;
  id v6 = NSStringFromRange(v12);
  int v7 = 138412546;
  __int16 v8 = v5;
  __int16 v9 = 2112;
  id v10 = v6;
  _os_log_error_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Bad custom client range %@ not completely included in the range %@ of the string it is attached to", (uint8_t *)&v7, 0x16u);
}

- (void)dd_makeLinksForResultsInAttributesOfType:()DataDetectorsSupport usingURLificationBlock:context:range:.cold.1(void *a1, uint8_t *buf, uint64_t a3)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = a3;
  _os_log_error_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "dd_makeLinksForResults called with an invalid range %@ (self length = %lu))", buf, 0x16u);
}

- (void)dd_makeLinksForResultsInAttributesOfType:()DataDetectorsSupport usingURLificationBlock:context:range:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 134217984;
  uint64_t v1 = dd_makeLinksForResultsInAttributesOfType_usingURLificationBlock_context_range___trackedCoreSpotlightUniqueIdentifiersCache;
  _os_log_debug_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Date/time result has been shown before (registered in cache %p). Skipping logging the Display event. #DDUINLEventMetrics", (uint8_t *)&v0, 0xCu);
}

- (void)dd_makeLinksForResultsInAttributesOfType:()DataDetectorsSupport context:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_2(&dword_1A1709000, MEMORY[0x1E4F14500], v0, "Making links for results in %p with context %@", v1, v2, v3, v4, v5);
}

- (void)dd_replaceResultAttributesWithSimpleLinksForTypes:()DataDetectorsSupport context:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_2(&dword_1A1709000, MEMORY[0x1E4F14500], v0, "Making shareable links for results in %p with context %@", v1, v2, v3, v4, v5);
}

@end