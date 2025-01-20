@interface NSDictionary(Validations)
- (__CFString)dk_stringFromRequiredKey:()Validations maxLength:failed:;
- (id)dk_arrayFromKey:()Validations inSet:maxLength:defaultValue:failed:;
- (id)dk_arrayFromKey:()Validations types:maxLength:defaultValue:failed:validator:;
- (id)dk_arrayFromRequiredKey:()Validations inSet:maxLength:failed:;
- (id)dk_arrayFromRequiredKey:()Validations types:maxLength:failed:;
- (id)dk_arrayFromRequiredKey:()Validations types:maxLength:failed:validator:;
- (id)dk_dataFromKey:()Validations minLength:maxLength:defaultValue:failed:;
- (id)dk_dataFromRequiredKey:()Validations maxLength:failed:;
- (id)dk_dictionaryFromKey:()Validations defaultValue:failed:;
- (id)dk_dictionaryFromKey:()Validations limitedToKeys:defaultValue:failed:;
- (id)dk_dictionaryFromRequiredKey:()Validations failed:;
- (id)dk_dictionaryFromRequiredKey:()Validations limitedToKeys:failed:;
- (id)dk_numberFromKey:()Validations lowerBound:upperBound:defaultValue:failed:;
- (id)dk_numberFromRequiredKey:()Validations lowerBound:upperBound:failed:;
- (id)dk_stringFromKey:()Validations inSet:defaultValue:failed:;
- (id)dk_stringFromKey:()Validations maxLength:defaultValue:failed:;
- (id)dk_stringFromRequiredKey:()Validations inSet:failed:;
- (uint64_t)dk_BOOLFromKey:()Validations defaultValue:failed:;
- (uint64_t)dk_BOOLFromRequiredKey:()Validations failed:;
- (uint64_t)dk_arrayFromKey:()Validations types:maxLength:defaultValue:failed:;
@end

@implementation NSDictionary(Validations)

- (id)dk_stringFromKey:()Validations maxLength:defaultValue:failed:
{
  id v10 = a5;
  uint64_t v11 = [a1 objectForKey:a3];
  if (v11)
  {
    v12 = (void *)v11;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v12 length] <= a4)
    {
      id v13 = v12;
    }
    else
    {
      id v13 = v10;

      if (a6) {
        *a6 = 1;
      }
    }
  }
  else
  {
    id v13 = v10;
  }

  return v13;
}

- (id)dk_stringFromKey:()Validations inSet:defaultValue:failed:
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a3;
  id v13 = [v10 valueForKeyPath:@"@max.length"];
  v14 = objc_msgSend(a1, "dk_stringFromKey:maxLength:defaultValue:failed:", v12, objc_msgSend(v13, "unsignedIntegerValue"), v11, a6);

  if (v14)
  {
    if ([v10 containsObject:v14])
    {
      id v15 = v14;
    }
    else
    {
      id v15 = v11;

      if (a6) {
        *a6 = 1;
      }
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)dk_numberFromKey:()Validations lowerBound:upperBound:defaultValue:failed:
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = [a1 objectForKey:a3];
  if (v15)
  {
    v16 = (void *)v15;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (uint64_t v17 = [v16 compare:v13], (unint64_t)objc_msgSend(v16, "compare:", v12) <= 1)
      && (unint64_t)(v17 + 1) < 2)
    {
      id v18 = v16;
    }
    else
    {
      id v18 = v14;

      if (a7) {
        *a7 = 1;
      }
    }
  }
  else
  {
    id v18 = v14;
  }

  return v18;
}

- (uint64_t)dk_BOOLFromKey:()Validations defaultValue:failed:
{
  v7 = objc_msgSend(a1, "objectForKey:");
  if (v7)
  {
    if (objc_opt_respondsToSelector())
    {
      a4 = [v7 BOOLValue];
    }
    else if (a5)
    {
      *a5 = 1;
    }
  }

  return a4;
}

- (id)dk_dictionaryFromKey:()Validations defaultValue:failed:
{
  id v8 = a4;
  uint64_t v9 = [a1 objectForKey:a3];
  if (v9)
  {
    id v10 = (void *)v9;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = v10;
    }
    else
    {
      id v11 = v8;

      if (a5) {
        *a5 = 1;
      }
    }
  }
  else
  {
    id v11 = v8;
  }

  return v11;
}

- (id)dk_dictionaryFromKey:()Validations limitedToKeys:defaultValue:failed:
{
  id v10 = a4;
  id v11 = objc_msgSend(a1, "dk_dictionaryFromKey:defaultValue:failed:", a3, a5, a6);
  id v12 = v11;
  if (v11)
  {
    id v13 = (void *)MEMORY[0x263EFF9C0];
    id v14 = [v11 allKeys];
    uint64_t v15 = [v13 setWithArray:v14];

    [v15 intersectSet:v10];
    v16 = [v15 allObjects];
    uint64_t v17 = [v12 dictionaryWithValuesForKeys:v16];
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

- (uint64_t)dk_arrayFromKey:()Validations types:maxLength:defaultValue:failed:
{
  return objc_msgSend(a1, "dk_arrayFromKey:types:maxLength:defaultValue:failed:validator:", a3, a4, a5, a6, a7, &__block_literal_global_0);
}

- (id)dk_arrayFromKey:()Validations types:maxLength:defaultValue:failed:validator:
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v14 = a4;
  id v15 = a6;
  v16 = a8;
  uint64_t v17 = [a1 objectForKey:a3];
  if (v17)
  {
    id v18 = (void *)v17;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v18 count] <= a5)
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v19 = v18;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v30;
        uint64_t v28 = *(void *)v30;
        while (2)
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v30 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = *(void *)(*((void *)&v29 + 1) + 8 * i);
            uint64_t v25 = objc_opt_class();
            if (!v25) {
              goto LABEL_19;
            }
            Superclass = (objc_class *)v25;
            while ((objc_msgSend(v14, "containsObject:", Superclass, v28) & 1) == 0)
            {
              Superclass = class_getSuperclass(Superclass);
              if (!Superclass) {
                goto LABEL_19;
              }
            }
            if (!v16[2](v16, v24))
            {
LABEL_19:

              goto LABEL_20;
            }
            uint64_t v22 = v28;
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v29 objects:v33 count:16];
          if (v21) {
            continue;
          }
          break;
        }
      }
    }
    else
    {
LABEL_20:
      id v19 = v15;

      if (a7) {
        *a7 = 1;
      }
    }
  }
  else
  {
    id v19 = v15;
  }

  return v19;
}

- (id)dk_arrayFromKey:()Validations inSet:maxLength:defaultValue:failed:
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v12 = a4;
  id v13 = a6;
  uint64_t v14 = [a1 objectForKey:a3];
  if (v14)
  {
    id v15 = (void *)v14;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v15 count] <= a5)
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v16 = v15;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v23;
        while (2)
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v23 != v19) {
              objc_enumerationMutation(v16);
            }
            if (!objc_msgSend(v12, "containsObject:", *(void *)(*((void *)&v22 + 1) + 8 * i), (void)v22))
            {

              goto LABEL_15;
            }
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
          if (v18) {
            continue;
          }
          break;
        }
      }
    }
    else
    {
LABEL_15:
      id v16 = v13;

      if (a7) {
        *a7 = 1;
      }
    }
  }
  else
  {
    id v16 = v13;
  }

  return v16;
}

- (id)dk_dataFromKey:()Validations minLength:maxLength:defaultValue:failed:
{
  id v12 = a6;
  uint64_t v13 = [a1 objectForKey:a3];
  if (v13)
  {
    uint64_t v14 = (void *)v13;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v14 length] <= a5 && objc_msgSend(v14, "length") >= a4)
    {
      id v15 = v14;
    }
    else
    {
      id v15 = v12;

      if (a7) {
        *a7 = 1;
      }
    }
  }
  else
  {
    id v15 = v12;
  }

  return v15;
}

- (__CFString)dk_stringFromRequiredKey:()Validations maxLength:failed:
{
  objc_msgSend(a1, "dk_stringFromKey:maxLength:defaultValue:failed:", a3, a4, 0, a5);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if (a5) {
      *a5 = 1;
    }
    v6 = &stru_26F0D5118;
  }
  return v6;
}

- (id)dk_stringFromRequiredKey:()Validations inSet:failed:
{
  id v8 = a4;
  uint64_t v9 = objc_msgSend(a1, "dk_stringFromKey:inSet:defaultValue:failed:", a3, v8, 0, a5);
  if (!v9)
  {
    uint64_t v9 = [v8 anyObject];
    if (a5) {
      *a5 = 1;
    }
  }

  return v9;
}

- (id)dk_numberFromRequiredKey:()Validations lowerBound:upperBound:failed:
{
  id v10 = a4;
  objc_msgSend(a1, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:", a3, v10, a5, 0, a6);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    id v11 = v10;
    if (a6) {
      *a6 = 1;
    }
  }

  return v11;
}

- (uint64_t)dk_BOOLFromRequiredKey:()Validations failed:
{
  id v6 = a3;
  v7 = [a1 objectForKey:v6];
  if (v7)
  {
    uint64_t v8 = objc_msgSend(a1, "dk_BOOLFromKey:defaultValue:failed:", v6, 0, a4);
  }
  else
  {
    uint64_t v8 = 0;
    if (a4) {
      *a4 = 1;
    }
  }

  return v8;
}

- (id)dk_dictionaryFromRequiredKey:()Validations failed:
{
  v5 = objc_msgSend(a1, "dk_dictionaryFromKey:defaultValue:failed:", a3, 0, a4);
  if (!v5)
  {
    if (a4) {
      *a4 = 1;
    }
    v5 = (void *)MEMORY[0x263EFFA78];
  }
  return v5;
}

- (id)dk_dictionaryFromRequiredKey:()Validations limitedToKeys:failed:
{
  id v8 = a4;
  uint64_t v9 = objc_msgSend(a1, "dk_dictionaryFromRequiredKey:failed:", a3, a5);
  id v10 = v9;
  if (v9)
  {
    id v11 = (void *)MEMORY[0x263EFF9C0];
    id v12 = [v9 allKeys];
    uint64_t v13 = [v11 setWithArray:v12];

    [v13 intersectSet:v8];
    uint64_t v14 = [v13 allObjects];
    id v15 = [v10 dictionaryWithValuesForKeys:v14];
  }
  else
  {
    id v15 = (void *)MEMORY[0x263EFFA78];
  }

  return v15;
}

- (id)dk_arrayFromRequiredKey:()Validations types:maxLength:failed:
{
  v7 = objc_msgSend(a1, "dk_arrayFromKey:types:maxLength:defaultValue:failed:", a3, a4, a5, 0, a6);
  if (!v7)
  {
    if (a6) {
      *a6 = 1;
    }
    v7 = (void *)MEMORY[0x263EFFA68];
  }
  return v7;
}

- (id)dk_arrayFromRequiredKey:()Validations types:maxLength:failed:validator:
{
  id v8 = objc_msgSend(a1, "dk_arrayFromKey:types:maxLength:defaultValue:failed:validator:", a3, a4, a5, 0, a6, a7);
  if (!v8)
  {
    if (a6) {
      *a6 = 1;
    }
    id v8 = (void *)MEMORY[0x263EFFA68];
  }
  return v8;
}

- (id)dk_arrayFromRequiredKey:()Validations inSet:maxLength:failed:
{
  v7 = objc_msgSend(a1, "dk_arrayFromKey:inSet:maxLength:defaultValue:failed:", a3, a4, a5, 0, a6);
  if (!v7)
  {
    if (a6) {
      *a6 = 1;
    }
    v7 = (void *)MEMORY[0x263EFFA68];
  }
  return v7;
}

- (id)dk_dataFromRequiredKey:()Validations maxLength:failed:
{
  id v6 = objc_msgSend(a1, "dk_dataFromKey:minLength:maxLength:defaultValue:failed:", a3, 0, a4, 0, a5);
  if (!v6)
  {
    id v6 = [MEMORY[0x263EFF8F8] data];
    if (a5) {
      *a5 = 1;
    }
  }
  return v6;
}

@end