@interface ValidateIntervalSetDictionary
@end

@implementation ValidateIntervalSetDictionary

BOOL ___ValidateIntervalSetDictionary_block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 objectForKeyedSubscript:@"intervalDefinitions"];
  BOOL v3 = v2 != 0;

  return v3;
}

BOOL ___ValidateIntervalSetDictionary_block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 objectForKeyedSubscript:@"repeatCount"];
  BOOL v3 = v2 != 0;

  return v3;
}

BOOL ___ValidateIntervalSetDictionary_block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 objectForKeyedSubscript:@"setType"];
  BOOL v3 = v2 != 0;

  return v3;
}

uint64_t ___ValidateIntervalSetDictionary_block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 objectForKeyedSubscript:@"setType"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t ___ValidateIntervalSetDictionary_block_invoke_5(uint64_t a1, void *a2)
{
  v2 = [a2 objectForKeyedSubscript:@"repeatCount"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t ___ValidateIntervalSetDictionary_block_invoke_6(uint64_t a1, void *a2)
{
  v2 = [a2 objectForKeyedSubscript:@"intervalDefinitions"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

BOOL ___ValidateIntervalSetDictionary_block_invoke_7(uint64_t a1, void *a2)
{
  v2 = [a2 objectForKeyedSubscript:@"setType"];
  BOOL v3 = (unint64_t)([v2 integerValue] - 1) < 2;

  return v3;
}

uint64_t ___ValidateIntervalSetDictionary_block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = objc_msgSend(a2, "objectForKeyedSubscript:", @"intervalDefinitions", 0, 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v7 = 0;
          goto LABEL_11;
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  uint64_t v7 = 1;
LABEL_11:

  return v7;
}

@end