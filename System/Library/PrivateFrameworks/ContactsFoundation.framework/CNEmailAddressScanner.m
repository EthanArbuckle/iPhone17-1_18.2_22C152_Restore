@interface CNEmailAddressScanner
- (id)firstEmailAddressInString:(id)a3;
- (void)enumerateEmailAddressesInString:(id)a3 usingBlock:(id)a4;
- (void)withEmailAddressesInString:(id)a3 each:(id)a4;
@end

@implementation CNEmailAddressScanner

- (id)firstEmailAddressInString:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (off_1EE025420((uint64_t)&__block_literal_global_119, v3))
  {
    v4 = 0;
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v5 = objc_msgSend(MEMORY[0x1E4F5F158], "scanString:", v3, 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      uint64_t v9 = *MEMORY[0x1E4F5EFF8];
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          v12 = [v11 type];
          char v13 = [v12 isEqualToString:v9];

          if (v13)
          {
            v4 = [v11 matchedString];
            goto LABEL_13;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    v4 = 0;
LABEL_13:
  }

  return v4;
}

- (void)enumerateEmailAddressesInString:(id)a3 usingBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!off_1EE025420((uint64_t)&__block_literal_global_119, v5))
  {
    uint64_t v7 = +[CNObservable observableWithScannerResultsOfType:2 inString:v5];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __68__CNEmailAddressScanner_enumerateEmailAddressesInString_usingBlock___block_invoke;
    v8[3] = &unk_1E56A0240;
    id v9 = v6;
    [v7 enumerateObjectsUsingBlock:v8];
  }
}

void __68__CNEmailAddressScanner_enumerateEmailAddressesInString_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a2;
  id v10 = [v6 matchedString];
  uint64_t v7 = [v6 range];
  uint64_t v9 = v8;

  (*(void (**)(uint64_t, id, uint64_t, uint64_t, uint64_t))(v5 + 16))(v5, v10, v7, v9, a4);
}

- (void)withEmailAddressesInString:(id)a3 each:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__CNEmailAddressScanner_withEmailAddressesInString_each___block_invoke;
  v8[3] = &unk_1E56A0268;
  id v9 = v6;
  id v7 = v6;
  [(CNEmailAddressScanner *)self enumerateEmailAddressesInString:a3 usingBlock:v8];
}

uint64_t __57__CNEmailAddressScanner_withEmailAddressesInString_each___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end