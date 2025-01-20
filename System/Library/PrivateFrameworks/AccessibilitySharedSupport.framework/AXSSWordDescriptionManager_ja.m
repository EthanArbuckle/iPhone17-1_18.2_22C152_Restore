@interface AXSSWordDescriptionManager_ja
- (id)_convertString:(id)a3 ifNeededForHiragana:(BOOL)a4;
- (id)descriptionForWord:(id)a3;
@end

@implementation AXSSWordDescriptionManager_ja

- (id)_convertString:(id)a3 ifNeededForHiragana:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = v5;
  v7 = v5;
  if (v4)
  {
    v8 = (void *)[v5 mutableCopy];
    if (objc_msgSend(v8, "applyTransform:reverse:range:updatedRange:", *MEMORY[0x1E4F1C4D0], 0, 0, objc_msgSend(v6, "length"), 0))
    {
      v7 = (void *)[v8 copy];
    }
    else
    {
      v9 = AXLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[AXSSWordDescriptionManager_ja _convertString:ifNeededForHiragana:]((uint64_t)v6, v9);
      }

      v7 = v6;
    }
  }

  return v7;
}

- (id)descriptionForWord:(id)a3
{
  id v4 = a3;
  id v5 = [(AXSSWordDescriptionManager *)self managedObjectContext];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x3032000000;
    v22[3] = __Block_byref_object_copy__7;
    v22[4] = __Block_byref_object_dispose__7;
    id v23 = 0;
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x2020000000;
    v21[3] = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v7 = [v4 length];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __52__AXSSWordDescriptionManager_ja_descriptionForWord___block_invoke;
    v14 = &unk_1E606DB38;
    v19 = v22;
    v20 = v21;
    v15 = self;
    id v8 = v6;
    id v16 = v8;
    id v17 = v4;
    id v18 = v5;
    objc_msgSend(v17, "enumerateSubstringsInRange:options:usingBlock:", 0, v7, 2, &v11);
    v9 = objc_msgSend(v8, "componentsJoinedByString:", @"、", v11, v12, v13, v14, v15);

    _Block_object_dispose(v21, 8);
    _Block_object_dispose(v22, 8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_convertString:(uint64_t)a1 ifNeededForHiragana:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B3B9D000, a2, OS_LOG_TYPE_ERROR, "Unable to convert Hiragana string to Katakana: %@", (uint8_t *)&v2, 0xCu);
}

@end