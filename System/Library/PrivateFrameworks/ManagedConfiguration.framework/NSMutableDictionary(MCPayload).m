@interface NSMutableDictionary(MCPayload)
- (id)MCMutableDictionaryContainingValidatedKeysAndClasses:()MCPayload removeKeys:outError:;
- (id)MCValidateAndRemoveArrayOfClass:()MCPayload withKey:isRequired:allowZeroLengthString:outError:;
- (id)MCValidateAndRemoveNonZeroLengthStringWithKey:()MCPayload isRequired:outError:;
- (id)MCValidateAndRemoveObjectOfClass:()MCPayload withKey:isRequired:outError:;
- (uint64_t)MCValidateAndRemoveArrayOfClass:()MCPayload withKey:isRequired:outError:;
@end

@implementation NSMutableDictionary(MCPayload)

- (id)MCValidateAndRemoveNonZeroLengthStringWithKey:()MCPayload isRequired:outError:
{
  id v8 = a3;
  v9 = [a1 objectForKey:v8];
  if (!v9) {
    goto LABEL_5;
  }
  [a1 removeObjectForKey:v8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v9 length])
    {
      id v10 = v9;
      goto LABEL_12;
    }
LABEL_5:
    id v10 = 0;
    if (a5 && a4)
    {
      v11 = +[MCPayload missingFieldErrorWithField:v8 underlyingError:0];
LABEL_10:
      id v10 = 0;
      *a5 = v11;
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  if (a5)
  {
    v11 = +[MCPayload badFieldTypeErrorWithField:v8];
    goto LABEL_10;
  }
  id v10 = 0;
LABEL_12:

  return v10;
}

- (id)MCValidateAndRemoveObjectOfClass:()MCPayload withKey:isRequired:outError:
{
  id v9 = a4;
  id v10 = [a1 objectForKey:v9];
  if (v10)
  {
    [a1 removeObjectForKey:v9];
    if (objc_opt_isKindOfClass())
    {
      id v11 = v10;
      goto LABEL_11;
    }
    if (a6)
    {
      v12 = +[MCPayload badFieldTypeErrorWithField:v9];
      goto LABEL_9;
    }
    id v11 = 0;
  }
  else
  {
    id v11 = 0;
    if (a6 && a5)
    {
      v12 = +[MCPayload missingFieldErrorWithField:v9 underlyingError:0];
LABEL_9:
      id v11 = 0;
      *a6 = v12;
    }
  }
LABEL_11:

  return v11;
}

- (id)MCValidateAndRemoveArrayOfClass:()MCPayload withKey:isRequired:allowZeroLengthString:outError:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  v12 = [a1 objectForKey:v11];
  if (!v12)
  {
    id v19 = 0;
    if (!a7 || !a5) {
      goto LABEL_25;
    }
    v20 = +[MCPayload missingFieldErrorWithField:v11 underlyingError:0];
LABEL_20:
    id v19 = 0;
    *a7 = v20;
    goto LABEL_25;
  }
  [a1 removeObjectForKey:v11];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!a7)
    {
LABEL_24:
      id v19 = 0;
      goto LABEL_25;
    }
    v20 = +[MCPayload badFieldTypeErrorWithField:v11];
    goto LABEL_20;
  }
  v22 = a7;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if (objc_opt_isKindOfClass())
        {
          if (a6) {
            continue;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || [v18 length]) {
            continue;
          }
        }
        if (v22)
        {
          void *v22 = +[MCPayload badFieldTypeErrorWithField:v11];
        }

        goto LABEL_24;
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

  id v19 = v13;
LABEL_25:

  return v19;
}

- (uint64_t)MCValidateAndRemoveArrayOfClass:()MCPayload withKey:isRequired:outError:
{
  return [a1 MCValidateAndRemoveArrayOfClass:a3 withKey:a4 isRequired:a5 allowZeroLengthString:1 outError:a6];
}

- (id)MCMutableDictionaryContainingValidatedKeysAndClasses:()MCPayload removeKeys:outError:
{
  v20 = a5;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
  v21 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        id v15 = (id)objc_msgSend(v9, "objectForKeyedSubscript:", v14, v20);
        uint64_t v16 = [a1 objectForKeyedSubscript:v14];
        if (v16)
        {
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (v20)
            {
              void *v20 = +[MCPayload badFieldTypeErrorWithField:v14];
            }

            id v18 = 0;
            v17 = v21;
            goto LABEL_18;
          }
          [v8 setObject:v16 forKeyedSubscript:v14];
          if (a4) {
            [v21 addObject:v14];
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  v17 = v21;
  if ([v21 count]) {
    [a1 removeObjectsForKeys:v21];
  }
  id v18 = v8;
LABEL_18:

  return v18;
}

@end