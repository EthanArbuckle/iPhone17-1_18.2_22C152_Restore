@interface GDFTSTokenize
+ (id)ftsTokenize:(id)a3;
@end

@implementation GDFTSTokenize

+ (id)ftsTokenize:(id)a3
{
  id v3 = a3;
  uint64_t v4 = ITSTokenListCreate();
  v5 = (const void *)v4;
  if (v3 && v4)
  {
    if (qword_1E9CAF5D8 != -1) {
      dispatch_once(&qword_1E9CAF5D8, &unk_1F0AC23C8);
    }
    id v6 = (id)qword_1E9CAF5D0;
    v11 = objc_msgSend_result(v6, v7, v8, v9, v10);
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = sub_1B2E430E0;
    v37[3] = &unk_1E6013750;
    id v38 = v3;
    id v39 = v3;
    v40 = v5;
    id v12 = v3;
    objc_msgSend_runWithLockAcquired_(v11, v13, (uint64_t)v37, v14, v15);
  }
  else
  {

    if (!v5)
    {
      v22 = 0;
      goto LABEL_15;
    }
  }
  CFCharacterSetRef v16 = CFCharacterSetCreateWithCharactersInString(0, @"()\"");
  uint64_t Count = ITSTokenListGetCount();
  id v18 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v22 = objc_msgSend_initWithCapacity_(v18, v19, Count, v20, v21);
  if (Count >= 1)
  {
    for (uint64_t i = 0; i != Count; ++i)
    {
      v24 = (void *)MEMORY[0x1B3EB26F0]();
      uint64_t v25 = ITSTokenListCopyEscapedTokenAtIndex();
      if (v25)
      {
        v26 = (void *)v25;
        v27 = _PASRemoveCharacterSet();

        if ((objc_msgSend_isEqualToString_(@"##&", v28, (uint64_t)v27, v29, v30) & 1) == 0) {
          objc_msgSend_addObject_(v22, v31, (uint64_t)v27, v32, v33);
        }
      }
      else
      {
        v27 = 0;
      }
    }
  }
  CFRelease(v5);
  CFRelease(v16);
LABEL_15:
  if (v22) {
    v34 = v22;
  }
  else {
    v34 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v35 = v34;

  return v35;
}

@end