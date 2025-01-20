@interface NSDictionary(VSAdditions)
- (id)vs_arrayForKey:()VSAdditions;
- (id)vs_arrayOfDictionariesForKey:()VSAdditions;
- (id)vs_arrayOfKindOfClass:()VSAdditions forKey:;
- (id)vs_arrayOfNumbersForKey:()VSAdditions;
- (id)vs_arrayOfStringsForKey:()VSAdditions;
- (id)vs_dictionaryForKey:()VSAdditions;
- (id)vs_numberForKey:()VSAdditions;
- (id)vs_objectForCaseInsensitiveKey:()VSAdditions;
- (id)vs_objectForNormalizedKey:()VSAdditions;
- (id)vs_objectOfClass:()VSAdditions forKey:;
- (id)vs_stringForKey:()VSAdditions;
- (uint64_t)vs_BOOLForKey:()VSAdditions;
@end

@implementation NSDictionary(VSAdditions)

- (id)vs_objectOfClass:()VSAdditions forKey:
{
  v4 = [a1 objectForKey:a4];
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v4 = 0;
  }

  return v4;
}

- (id)vs_dictionaryForKey:()VSAdditions
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "vs_objectOfClass:forKey:", objc_opt_class(), v4);

  return v5;
}

- (id)vs_arrayForKey:()VSAdditions
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "vs_objectOfClass:forKey:", objc_opt_class(), v4);

  return v5;
}

- (id)vs_arrayOfKindOfClass:()VSAdditions forKey:
{
  v5 = objc_msgSend(a1, "vs_arrayForKey:", a4);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__NSDictionary_VSAdditions__vs_arrayOfKindOfClass_forKey___block_invoke;
  v9[3] = &__block_descriptor_40_e25_B24__0_8__NSDictionary_16lu32l8;
  v9[4] = a3;
  v6 = [MEMORY[0x1E4F28F60] predicateWithBlock:v9];
  v7 = [v5 filteredArrayUsingPredicate:v6];

  return v7;
}

- (id)vs_arrayOfStringsForKey:()VSAdditions
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "vs_arrayOfKindOfClass:forKey:", objc_opt_class(), v4);

  return v5;
}

- (id)vs_arrayOfNumbersForKey:()VSAdditions
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "vs_arrayOfKindOfClass:forKey:", objc_opt_class(), v4);

  return v5;
}

- (id)vs_arrayOfDictionariesForKey:()VSAdditions
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "vs_arrayOfKindOfClass:forKey:", objc_opt_class(), v4);

  return v5;
}

- (id)vs_numberForKey:()VSAdditions
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "vs_objectOfClass:forKey:", objc_opt_class(), v4);

  return v5;
}

- (uint64_t)vs_BOOLForKey:()VSAdditions
{
  v1 = objc_msgSend(a1, "vs_numberForKey:");
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (id)vs_stringForKey:()VSAdditions
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "vs_objectOfClass:forKey:", objc_opt_class(), v4);

  return v5;
}

- (id)vs_objectForCaseInsensitiveKey:()VSAdditions
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [a1 allKeys];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if (!objc_msgSend(v4, "caseInsensitiveCompare:", v10, (void)v13))
        {
          v11 = [a1 objectForKey:v10];
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (id)vs_objectForNormalizedKey:()VSAdditions
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 allKeys];
  uint64_t v6 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  uint64_t v7 = [v4 componentsSeparatedByCharactersInSet:v6];
  uint64_t v8 = [v7 componentsJoinedByString:&stru_1F34B2EC8];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    v20 = a1;
    id v21 = v4;
    uint64_t v12 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v15 = objc_msgSend(MEMORY[0x1E4F28B88], "whitespaceCharacterSet", v20);
        long long v16 = [v14 componentsSeparatedByCharactersInSet:v15];
        v17 = [v16 componentsJoinedByString:&stru_1F34B2EC8];

        if (![v8 caseInsensitiveCompare:v17])
        {
          uint64_t v18 = [v20 objectForKey:v14];

          goto LABEL_11;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v11) {
        continue;
      }
      break;
    }
    uint64_t v18 = 0;
LABEL_11:
    id v4 = v21;
  }
  else
  {
    uint64_t v18 = 0;
  }

  return v18;
}

@end