@interface NSMutableDictionary(CRKEDUAdditions)
- (id)crk_validateAndRemoveArrayOfClass:()CRKEDUAdditions withKey:isRequired:allowZeroLengthString:outError:;
- (id)crk_validateAndRemoveNonZeroLengthStringWithKey:()CRKEDUAdditions isRequired:outError:;
- (id)crk_validateAndRemoveObjectOfClass:()CRKEDUAdditions withKey:isRequired:outError:;
- (uint64_t)crk_validateAndRemoveArrayOfClass:()CRKEDUAdditions withKey:isRequired:outError:;
@end

@implementation NSMutableDictionary(CRKEDUAdditions)

- (id)crk_validateAndRemoveNonZeroLengthStringWithKey:()CRKEDUAdditions isRequired:outError:
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
      v11 = objc_msgSend(MEMORY[0x263F087E8], "crk_missingFieldErrorWithField:", v8);
LABEL_10:
      id v10 = 0;
      *a5 = v11;
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  if (a5)
  {
    v11 = objc_msgSend(MEMORY[0x263F087E8], "crk_badFieldTypeErrorWithField:", v8);
    goto LABEL_10;
  }
  id v10 = 0;
LABEL_12:

  return v10;
}

- (id)crk_validateAndRemoveObjectOfClass:()CRKEDUAdditions withKey:isRequired:outError:
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
      v12 = objc_msgSend(MEMORY[0x263F087E8], "crk_badFieldTypeErrorWithField:", v9);
      goto LABEL_9;
    }
    id v11 = 0;
  }
  else
  {
    id v11 = 0;
    if (a6 && a5)
    {
      v12 = objc_msgSend(MEMORY[0x263F087E8], "crk_missingFieldErrorWithField:", v9);
LABEL_9:
      id v11 = 0;
      *a6 = v12;
    }
  }
LABEL_11:

  return v11;
}

- (id)crk_validateAndRemoveArrayOfClass:()CRKEDUAdditions withKey:isRequired:allowZeroLengthString:outError:
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v11 = a4;
  v12 = [a1 objectForKey:v11];
  if (!v12)
  {
    id v19 = 0;
    if (!a7 || !a5) {
      goto LABEL_25;
    }
    v20 = objc_msgSend(MEMORY[0x263F087E8], "crk_missingFieldErrorWithField:", v11);
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
    v20 = objc_msgSend(MEMORY[0x263F087E8], "crk_badFieldTypeErrorWithField:", v11);
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
          objc_msgSend(MEMORY[0x263F087E8], "crk_badFieldTypeErrorWithField:", v11);
          void *v22 = (id)objc_claimAutoreleasedReturnValue();
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

- (uint64_t)crk_validateAndRemoveArrayOfClass:()CRKEDUAdditions withKey:isRequired:outError:
{
  return objc_msgSend(a1, "crk_validateAndRemoveArrayOfClass:withKey:isRequired:allowZeroLengthString:outError:", a3, a4, a5, 1, a6);
}

@end