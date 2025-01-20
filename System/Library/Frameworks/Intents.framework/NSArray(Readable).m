@interface NSArray(Readable)
- (id)_intents_localizedCopyWithLocalizer:()Readable;
- (id)_intents_readableTitleWithLocalizer:()Readable metadata:;
@end

@implementation NSArray(Readable)

- (id)_intents_localizedCopyWithLocalizer:()Readable
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "_intents_localizedCopyWithLocalizer:", v4, (void)v13);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_intents_readableTitleWithLocalizer:()Readable metadata:
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 locale];
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v10 = a1;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v39 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = objc_msgSend(*(id *)(*((void *)&v38 + 1) + 8 * i), "_intents_readableTitleWithLocalizer:metadata:", v6, v7);
        if ([v15 length]) {
          [v9 addObject:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v12);
  }

  uint64_t v16 = [v9 count];
  v17 = (void *)v16;
  if (v16)
  {
    if (v16 == 2)
    {
      id v19 = [NSString alloc];
      v20 = INLocalizedStringWithLocalizer(@"%@ and %@ (two elements format)", @"%@ and %@", v6);
      v21 = [v9 objectAtIndex:0];
      v22 = [v9 objectAtIndex:1];
      uint64_t v23 = objc_msgSend(v19, "initWithFormat:locale:", v20, v8, v21, v22);
    }
    else
    {
      unint64_t v18 = v16 - 1;
      if (v16 == 1)
      {
        v17 = [v9 firstObject];
        goto LABEL_22;
      }
      id v24 = [NSString alloc];
      v25 = INLocalizedStringWithLocalizer(@"%@, %@ (three or more start format)", @"%@, %@", v6);
      v26 = [v9 objectAtIndex:0];
      v27 = [v9 objectAtIndex:1];
      v28 = objc_msgSend(v24, "initWithFormat:locale:", v25, v8, v26, v27);

      if (v18 < 3)
      {
        v22 = v28;
      }
      else
      {
        uint64_t v29 = 3;
        v37 = v17;
        do
        {
          v30 = v8;
          id v31 = [NSString alloc];
          v32 = INLocalizedStringWithLocalizer(@"%@, %@ (three or more middle format)", @"%@, %@", v6);
          v33 = [v9 objectAtIndex:v29 - 1];
          v34 = v31;
          uint64_t v8 = v30;
          v22 = objc_msgSend(v34, "initWithFormat:locale:", v32, v30, v28, v33);

          ++v29;
          v28 = v22;
        }
        while (v37 != (void *)v29);
      }
      id v35 = [NSString alloc];
      v20 = INLocalizedStringWithLocalizer(@"%@ and %@ (three or more end format)", @"%@ and %@", v6);
      v21 = [v9 lastObject];
      uint64_t v23 = objc_msgSend(v35, "initWithFormat:locale:", v20, v8, v22, v21);
    }
    v17 = (void *)v23;
  }
LABEL_22:

  return v17;
}

@end