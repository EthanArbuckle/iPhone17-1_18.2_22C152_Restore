@interface PBCodable(Redactor)
- (id)_redact:()Redactor;
- (uint64_t)_isRedactable:()Redactor;
- (uint64_t)redact;
@end

@implementation PBCodable(Redactor)

- (uint64_t)redact
{
  return [a1 _redact:a1];
}

- (id)_redact:()Redactor
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([a1 _isRedactable:v4])
  {
    id v29 = v4;
    if (objc_opt_respondsToSelector())
    {
      v5 = [v4 dictionaryRepresentation];
      id v6 = (id)[v5 mutableCopy];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v6 = (id)[v4 mutableCopy];
      }
      else {
        id v6 = 0;
      }
    }
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    uint64_t v7 = objc_msgSend(&unk_26D607C48, "countByEnumeratingWithState:objects:count:", &v42, v48, 16, v29);
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v43 != v9) {
            objc_enumerationMutation(&unk_26D607C48);
          }
          uint64_t v11 = *(void *)(*((void *)&v42 + 1) + 8 * i);
          v12 = [v6 objectForKeyedSubscript:v11];

          if (v12) {
            [v6 setObject:@"<<redacted>>" forKeyedSubscript:v11];
          }
        }
        uint64_t v8 = [&unk_26D607C48 countByEnumeratingWithState:&v42 objects:v48 count:16];
      }
      while (v8);
    }
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v13 = [&unk_26D607C60 countByEnumeratingWithState:&v38 objects:v47 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v39;
      uint64_t v31 = *(void *)v39;
      v32 = v6;
      do
      {
        uint64_t v16 = 0;
        uint64_t v33 = v14;
        do
        {
          if (*(void *)v39 != v15) {
            objc_enumerationMutation(&unk_26D607C60);
          }
          uint64_t v17 = *(void *)(*((void *)&v38 + 1) + 8 * v16);
          v18 = [v6 objectForKeyedSubscript:v17];
          if (v18)
          {
            if ([a1 _isRedactable:v18])
            {
              id v19 = [a1 _redact:v18];
              [v6 setObject:v19 forKeyedSubscript:v17];
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_38;
              }
              id v20 = v18;
              v21 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v20, "count"));
              long long v34 = 0u;
              long long v35 = 0u;
              long long v36 = 0u;
              long long v37 = 0u;
              id v19 = v20;
              uint64_t v22 = [v19 countByEnumeratingWithState:&v34 objects:v46 count:16];
              if (v22)
              {
                uint64_t v23 = v22;
                uint64_t v24 = *(void *)v35;
                do
                {
                  for (uint64_t j = 0; j != v23; ++j)
                  {
                    if (*(void *)v35 != v24) {
                      objc_enumerationMutation(v19);
                    }
                    uint64_t v26 = *(void *)(*((void *)&v34 + 1) + 8 * j);
                    if ([a1 _isRedactable:v26])
                    {
                      v27 = [a1 _redact:v26];
                      [v21 addObject:v27];
                    }
                    else
                    {
                      [v21 addObject:v26];
                    }
                  }
                  uint64_t v23 = [v19 countByEnumeratingWithState:&v34 objects:v46 count:16];
                }
                while (v23);
              }

              id v6 = v32;
              [v32 setObject:v21 forKeyedSubscript:v17];

              uint64_t v15 = v31;
              uint64_t v14 = v33;
            }
          }
LABEL_38:

          ++v16;
        }
        while (v16 != v14);
        uint64_t v14 = [&unk_26D607C60 countByEnumeratingWithState:&v38 objects:v47 count:16];
      }
      while (v14);
    }
    id v4 = v30;
  }
  else
  {
    id v6 = v4;
  }

  return v6;
}

- (uint64_t)_isRedactable:()Redactor
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = 1;
  }
  else {
    char v4 = objc_opt_respondsToSelector();
  }

  return v4 & 1;
}

@end