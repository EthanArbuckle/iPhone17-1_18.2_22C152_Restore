@interface AXITMLUtilities
+ (id)_listTemplateForViewElement:(id)a3;
+ (id)firstItemTitleForViewElement:(id)a3;
+ (id)textByReconcilingClientText:(id)a3 withServerText:(id)a4;
+ (unint64_t)listItemElementCountForViewElement:(id)a3;
@end

@implementation AXITMLUtilities

+ (id)textByReconcilingClientText:(id)a3 withServerText:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [v5 string];
    v8 = [v7 stringByReplacingOccurrencesOfString:@"\uFFFC" withString:&stru_1F1F0EB90];

    v9 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    id v5 = [v8 stringByTrimmingCharactersInSet:v9];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = [v6 string];
    v11 = [v10 stringByReplacingOccurrencesOfString:@"\uFFFC" withString:&stru_1F1F0EB90];

    v12 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    id v6 = [v11 stringByTrimmingCharactersInSet:v12];
  }
  uint64_t v13 = [v5 length];
  uint64_t v14 = [v6 length];
  if (!(v13 | v14))
  {
    v16 = 0;
    goto LABEL_14;
  }
  if (v5 && !v14) {
    goto LABEL_8;
  }
  if (v14 && !v13)
  {
LABEL_12:
    id v15 = v6;
    goto LABEL_13;
  }
  if (![v5 localizedCaseInsensitiveContainsString:v6])
  {
    if (![v6 localizedCaseInsensitiveContainsString:v5])
    {
      __AXStringForVariables();
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_8:
  id v15 = v5;
LABEL_13:
  v16 = v15;
LABEL_14:

  return v16;
}

+ (unint64_t)listItemElementCountForViewElement:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [a1 _listTemplateForViewElement:a3];
  v4 = [v3 list];
  id v5 = [v4 sections];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    unint64_t v8 = 0;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) items];
        v8 += [v11 count];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

+ (id)firstItemTitleForViewElement:(id)a3
{
  v3 = [a1 _listTemplateForViewElement:a3];
  v4 = [v3 list];
  id v5 = [v4 sections];
  uint64_t v6 = [v5 firstObject];

  uint64_t v7 = [v6 items];
  unint64_t v8 = [v7 firstObject];

  getIKListItemLockupElementClass();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && v8) {
    _AXAssert();
  }
  getIKListItemLockupElementClass();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v8 title];
    v10 = [v9 text];
    v11 = [v10 string];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)_listTemplateForViewElement:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2050000000;
  v3 = (void *)getIKViewElementClass_softClass;
  uint64_t v26 = getIKViewElementClass_softClass;
  if (!getIKViewElementClass_softClass)
  {
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    v20 = __getIKViewElementClass_block_invoke;
    v21 = &unk_1E649BF00;
    v22 = &v23;
    __getIKViewElementClass_block_invoke((uint64_t)&v18);
    v3 = (void *)v24[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v23, 8);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v13 children];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v27 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v23 = 0;
          v24 = &v23;
          uint64_t v25 = 0x2050000000;
          v10 = (void *)getIKListTemplateClass_softClass;
          uint64_t v26 = getIKListTemplateClass_softClass;
          if (!getIKListTemplateClass_softClass)
          {
            uint64_t v18 = MEMORY[0x1E4F143A8];
            uint64_t v19 = 3221225472;
            v20 = __getIKListTemplateClass_block_invoke;
            v21 = &unk_1E649BF00;
            v22 = &v23;
            __getIKListTemplateClass_block_invoke((uint64_t)&v18);
            v10 = (void *)v24[3];
          }
          id v11 = v10;
          _Block_object_dispose(&v23, 8);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v6 = v9;
            goto LABEL_17;
          }
        }
        id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v27 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_17:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

@end