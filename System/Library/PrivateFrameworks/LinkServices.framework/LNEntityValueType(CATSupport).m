@interface LNEntityValueType(CATSupport)
- (__CFString)cat_dialogType;
- (__CFString)cat_value:()CATSupport;
- (uint64_t)cat_keyPath;
@end

@implementation LNEntityValueType(CATSupport)

- (uint64_t)cat_keyPath
{
  return 0;
}

- (__CFString)cat_value:()CATSupport
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [a3 value];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v17 = v3;
    v5 = [v3 properties];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          v11 = [v10 value];
          v12 = [v11 valueType];
          v13 = [v10 value];
          v14 = objc_msgSend(v12, "cat_value:", v13);
          v15 = [v10 identifier];
          [(__CFString *)v4 setObject:v14 forKeyedSubscript:v15];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v7);
    }
  }
  else
  {

    v4 = &stru_1EF7D9D20;
  }
  return v4;
}

- (__CFString)cat_dialogType
{
  return @"dialog.Object";
}

@end