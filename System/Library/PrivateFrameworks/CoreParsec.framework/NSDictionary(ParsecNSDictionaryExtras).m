@interface NSDictionary(ParsecNSDictionaryExtras)
- (id)parsec_URLForKey:()ParsecNSDictionaryExtras;
- (id)parsec_UUIDForKey:()ParsecNSDictionaryExtras;
- (id)parsec_arrayForKey:()ParsecNSDictionaryExtras;
- (id)parsec_dataForKey:()ParsecNSDictionaryExtras;
- (id)parsec_dateForKey:()ParsecNSDictionaryExtras;
- (id)parsec_dictionaryByMappingKeysUsingBlock:()ParsecNSDictionaryExtras;
- (id)parsec_dictionaryForKey:()ParsecNSDictionaryExtras;
- (id)parsec_numberForKey:()ParsecNSDictionaryExtras;
- (id)parsec_stringForKey:()ParsecNSDictionaryExtras;
- (uint64_t)parsec_BOOLForKey:()ParsecNSDictionaryExtras;
@end

@implementation NSDictionary(ParsecNSDictionaryExtras)

- (id)parsec_dictionaryByMappingKeysUsingBlock:()ParsecNSDictionaryExtras
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(a1, "count"));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    v10 = v4 + 16;
    unint64_t v11 = 0x1E4F1C000uLL;
    v24 = v4;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v13 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        v14 = (*((void (**)(char *, uint64_t))v4 + 2))(v4, v13);
        v15 = [v6 objectForKeyedSubscript:v13];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_msgSend(v15, "parsec_dictionaryByMappingKeysUsingBlock:", v4);
          id v16 = v6;
          uint64_t v17 = v8;
          v18 = v10;
          uint64_t v19 = v9;
          v20 = v5;
          v22 = unint64_t v21 = v11;

          v15 = (void *)v22;
          unint64_t v11 = v21;
          v5 = v20;
          uint64_t v9 = v19;
          v10 = v18;
          uint64_t v8 = v17;
          id v6 = v16;
          v4 = v24;
        }
        [v5 setObject:v15 forKeyedSubscript:v14];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)parsec_UUIDForKey:()ParsecNSDictionaryExtras
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v2 = v1;
  }
  else {
    v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)parsec_URLForKey:()ParsecNSDictionaryExtras
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v1 length])
  {
    id v2 = [MEMORY[0x1E4F1CB10] URLWithString:v1];
LABEL_6:
    id v3 = v2;
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = v1;
    goto LABEL_6;
  }
  id v3 = 0;
LABEL_8:

  return v3;
}

- (id)parsec_dictionaryForKey:()ParsecNSDictionaryExtras
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)parsec_arrayForKey:()ParsecNSDictionaryExtras
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)parsec_dateForKey:()ParsecNSDictionaryExtras
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)parsec_dataForKey:()ParsecNSDictionaryExtras
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)parsec_numberForKey:()ParsecNSDictionaryExtras
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)parsec_stringForKey:()ParsecNSDictionaryExtras
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (uint64_t)parsec_BOOLForKey:()ParsecNSDictionaryExtras
{
  v1 = objc_msgSend(a1, "parsec_numberForKey:");
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

@end