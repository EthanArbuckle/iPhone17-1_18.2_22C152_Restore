@interface NSDictionary(IconFoundationAdditions)
- (id)_IF_arrayForKey:()IconFoundationAdditions;
- (id)_IF_arrayForKeys:()IconFoundationAdditions;
- (id)_IF_dataForKey:()IconFoundationAdditions;
- (id)_IF_dictionaryAddingEntriesFromDictionary:()IconFoundationAdditions;
- (id)_IF_dictionaryForKey:()IconFoundationAdditions;
- (id)_IF_dictionaryForKeys:()IconFoundationAdditions;
- (id)_IF_dictionarySubsetForKeys:()IconFoundationAdditions;
- (id)_IF_numberForKey:()IconFoundationAdditions;
- (id)_IF_numberForKeys:()IconFoundationAdditions;
- (id)_IF_objectOfClass:()IconFoundationAdditions forKey:;
- (id)_IF_objectOfClass:()IconFoundationAdditions forKeys:;
- (id)_IF_stringForKey:()IconFoundationAdditions;
- (id)_IF_stringForKeys:()IconFoundationAdditions;
- (uint64_t)_IF_BOOLForKey:()IconFoundationAdditions;
- (uint64_t)_IF_BOOLForKey:()IconFoundationAdditions defaultValue:;
- (uint64_t)_IF_BOOLForKeys:()IconFoundationAdditions;
- (uint64_t)_IF_BOOLForKeys:()IconFoundationAdditions defaultValue:;
@end

@implementation NSDictionary(IconFoundationAdditions)

- (id)_IF_stringForKey:()IconFoundationAdditions
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "_IF_objectOfClass:forKey:", objc_opt_class(), v4);

  return v5;
}

- (id)_IF_objectOfClass:()IconFoundationAdditions forKey:
{
  id v4 = [a1 objectForKey:a4];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (id)_IF_numberForKey:()IconFoundationAdditions
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "_IF_objectOfClass:forKey:", objc_opt_class(), v4);

  return v5;
}

- (id)_IF_arrayForKey:()IconFoundationAdditions
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "_IF_objectOfClass:forKey:", objc_opt_class(), v4);

  return v5;
}

- (id)_IF_dictionaryForKey:()IconFoundationAdditions
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "_IF_objectOfClass:forKey:", objc_opt_class(), v4);

  return v5;
}

- (id)_IF_dataForKey:()IconFoundationAdditions
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "_IF_objectOfClass:forKey:", objc_opt_class(), v4);

  return v5;
}

- (uint64_t)_IF_BOOLForKey:()IconFoundationAdditions
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "_IF_objectOfClass:forKey:", objc_opt_class(), v4);

  uint64_t v6 = [v5 BOOLValue];
  return v6;
}

- (uint64_t)_IF_BOOLForKey:()IconFoundationAdditions defaultValue:
{
  id v6 = a3;
  v7 = objc_msgSend(a1, "_IF_objectOfClass:forKey:", objc_opt_class(), v6);

  if (v7) {
    a4 = [v7 BOOLValue];
  }

  return a4;
}

- (id)_IF_objectOfClass:()IconFoundationAdditions forKeys:
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = a4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(v5);
      }
      v10 = objc_msgSend(a1, "objectForKey:", *(void *)(*((void *)&v12 + 1) + 8 * v9), (void)v12);
      if (objc_opt_isKindOfClass()) {
        break;
      }

      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v10 = 0;
  }

  return v10;
}

- (id)_IF_stringForKeys:()IconFoundationAdditions
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "_IF_objectOfClass:forKeys:", objc_opt_class(), v4);

  return v5;
}

- (id)_IF_numberForKeys:()IconFoundationAdditions
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "_IF_objectOfClass:forKeys:", objc_opt_class(), v4);

  return v5;
}

- (id)_IF_arrayForKeys:()IconFoundationAdditions
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "_IF_objectOfClass:forKeys:", objc_opt_class(), v4);

  return v5;
}

- (id)_IF_dictionaryForKeys:()IconFoundationAdditions
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "_IF_objectOfClass:forKeys:", objc_opt_class(), v4);

  return v5;
}

- (uint64_t)_IF_BOOLForKeys:()IconFoundationAdditions
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "_IF_objectOfClass:forKeys:", objc_opt_class(), v4);

  uint64_t v6 = [v5 BOOLValue];
  return v6;
}

- (uint64_t)_IF_BOOLForKeys:()IconFoundationAdditions defaultValue:
{
  id v6 = a3;
  uint64_t v7 = objc_msgSend(a1, "_IF_objectOfClass:forKeys:", objc_opt_class(), v6);

  if (v7) {
    a4 = [v7 BOOLValue];
  }

  return a4;
}

- (id)_IF_dictionaryAddingEntriesFromDictionary:()IconFoundationAdditions
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithDictionary:a1];
  [v6 addEntriesFromDictionary:v5];

  uint64_t v7 = (void *)[v6 copy];

  return v7;
}

- (id)_IF_dictionarySubsetForKeys:()IconFoundationAdditions
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        long long v12 = objc_msgSend(a1, "objectForKeyedSubscript:", v11, (void)v16);

        if (v12)
        {
          long long v13 = [a1 objectForKeyedSubscript:v11];
          [v5 setObject:v13 forKey:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  long long v14 = (void *)[v5 copy];

  return v14;
}

@end