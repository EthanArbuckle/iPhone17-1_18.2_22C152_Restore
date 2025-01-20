@interface DESJSONPredicate
+ (BOOL)_testStrings:(id)a3 test:(id)a4 caseInsensitive:(BOOL)a5;
+ (BOOL)evaluateAnd:(id)a3 onObj:(id)a4;
+ (BOOL)evaluateArrayOp:(id)a3 onObj:(id)a4;
+ (BOOL)evaluateBoolOp:(id)a3 onObj:(id)a4;
+ (BOOL)evaluateDefOp:(id)a3 onObj:(id)a4;
+ (BOOL)evaluateDict:(id)a3 onObj:(id)a4;
+ (BOOL)evaluateJson:(id)a3 onJson:(id)a4;
+ (BOOL)evaluateNumericOp:(id)a3 onObj:(id)a4;
+ (BOOL)evaluateOr:(id)a3 onObj:(id)a4;
+ (BOOL)evaluatePredicate:(id)a3 onObj:(id)a4;
+ (BOOL)evaluateRegexOp:(id)a3 onObj:(id)a4;
+ (BOOL)evaluateStringOp:(id)a3 onObj:(id)a4;
+ (BOOL)evaluateTypeOp:(id)a3 onObj:(id)a4;
+ (BOOL)isBoolean:(id)a3;
+ (BOOL)isDate:(id)a3;
+ (BOOL)isDateTime:(id)a3;
+ (BOOL)isNumber:(id)a3;
+ (BOOL)isTime:(id)a3;
+ (BOOL)obj:(id)a3 matchesRegex:(id)a4;
+ (id)fetchObjectAtPath:(id)a3 from:(id)a4;
+ (id)parseJSON:(id)a3;
+ (id)parsePath:(id)a3;
@end

@implementation DESJSONPredicate

+ (id)parseJSON:(id)a3
{
  v3 = (const char *)[a3 UTF8String];
  v4 = v3;
  if (v3) {
    size_t v5 = strlen(v3);
  }
  else {
    size_t v5 = 0;
  }
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v4 length:v5];
  id v11 = 0;
  v7 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v6 options:0 error:&v11];
  id v8 = v11;
  v9 = v8;
  if (!v7) {
    NSLog(&cfstr_ParseError.isa, v8);
  }

  return v7;
}

+ (id)fetchObjectAtPath:(id)a3 from:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    while (2)
    {
      uint64_t v11 = 0;
      id v12 = v6;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        if (!v12) {
          goto LABEL_17;
        }
        v13 = *(void **)(*((void *)&v19 + 1) + 8 * v11);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v6 = [v12 objectForKey:v13];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_17;
          }
          id v14 = v12;
          unsigned int v15 = objc_msgSend(v13, "intValue", (void)v19);
          int v16 = [v14 count];
          if ((v15 & 0x80000000) != 0 || (int)v15 >= v16)
          {

LABEL_17:
            v17 = 0;
            goto LABEL_18;
          }
          id v6 = [v14 objectAtIndex:v15];
        }
        ++v11;
        id v12 = v6;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v12 = v6;
  v17 = v12;
LABEL_18:

  return v17;
}

+ (id)parsePath:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 hasPrefix:@"/"])
  {
    uint64_t v4 = objc_msgSend(v3, "substringWithRange:", 1, objc_msgSend(v3, "length") - 1);

    id v3 = (id)v4;
  }
  if ([v3 length])
  {
    id v14 = v3;
    id v5 = [v3 componentsSeparatedByString:@"/"];
    id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id obj = v5;
    uint64_t v7 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = [*(id *)(*((void *)&v16 + 1) + 8 * i) stringByReplacingOccurrencesOfString:@"~1" withString:@"/"];
          id v12 = [v11 stringByReplacingOccurrencesOfString:@"~0" withString:@"~"];
          [v6 addObject:v12];
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }

    id v3 = v14;
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

+ (BOOL)evaluateDefOp:(id)a3 onObj:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 objectForKey:@"path"];
  if (v7)
  {
    uint64_t v8 = +[DESJSONPredicate parsePath:v7];
    uint64_t v9 = +[DESJSONPredicate fetchObjectAtPath:v8 from:v6];
    uint64_t v10 = [v5 objectForKey:@"op"];
    unsigned int v11 = (v9 == 0) ^ [@"defined" isEqualToString:v10];
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

+ (BOOL)evaluateStringOp:(id)a3 onObj:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 objectForKey:@"op"];
  uint64_t v8 = [v6 objectForKey:@"path"];
  uint64_t v9 = [v6 objectForKey:@"value"];

  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = +[DESJSONPredicate parsePath:v8];
      unsigned int v11 = +[DESJSONPredicate fetchObjectAtPath:v10 from:v5];
      if (!v11)
      {
        BOOL v13 = 0;
LABEL_21:

        goto LABEL_22;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = v11;
      }
      else
      {
        id v12 = [NSString stringWithFormat:@"%@", v11];
      }
      id v14 = v12;
      if ([v7 hasSuffix:@"-"])
      {
        uint64_t v15 = objc_msgSend(v7, "substringToIndex:", objc_msgSend(v7, "length") - 1);

        uint64_t v16 = [v14 uppercaseString];

        uint64_t v17 = [v9 uppercaseString];

        uint64_t v9 = (void *)v17;
        uint64_t v7 = (void *)v15;
        id v14 = (void *)v16;
      }
      if ([@"starts" isEqualToString:v7])
      {
        char v18 = [v14 hasPrefix:v9];
      }
      else if ([@"ends" isEqualToString:v7])
      {
        char v18 = [v14 hasSuffix:v9];
      }
      else if ([@"contains" isEqualToString:v7])
      {
        char v18 = [v14 containsString:v9];
      }
      else
      {
        if (![@"test" isEqualToString:v7])
        {
          BOOL v13 = 0;
          goto LABEL_20;
        }
        char v18 = [v14 isEqualToString:v9];
      }
      BOOL v13 = v18;
LABEL_20:

      goto LABEL_21;
    }
  }
  BOOL v13 = 0;
LABEL_22:

  return v13;
}

+ (BOOL)evaluateRegexOp:(id)a3 onObj:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 objectForKey:@"op"];
  uint64_t v8 = [v6 objectForKey:@"path"];
  uint64_t v9 = [v6 objectForKey:@"value"];

  BOOL v10 = 0;
  if (v8 && v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v11 = +[DESJSONPredicate parsePath:v8];
      uint64_t v12 = +[DESJSONPredicate fetchObjectAtPath:v11 from:v5];
      if (v12)
      {
        BOOL v13 = (void *)v12;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v14 = v13;
        }
        else
        {
          id v14 = [NSString stringWithFormat:@"%@", v13];
        }
        uint64_t v15 = v14;
        unsigned int v16 = [v7 hasSuffix:@"-"];
        uint64_t v17 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:v9 options:v16 error:0];
        BOOL v10 = objc_msgSend(v17, "numberOfMatchesInString:options:range:", v15, 0, 0, objc_msgSend(v15, "length")) != 0;
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

+ (BOOL)evaluateNumericOp:(id)a3 onObj:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 objectForKey:@"op"];
  uint64_t v8 = [v6 objectForKey:@"path"];
  uint64_t v9 = [v6 objectForKey:@"value"];

  BOOL v10 = 0;
  if (v8 && v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v11 = +[DESJSONPredicate parsePath:v8];
      uint64_t v12 = +[DESJSONPredicate fetchObjectAtPath:v11 from:v5];
      if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        BOOL v10 = 0;
LABEL_15:

        goto LABEL_16;
      }
      id v13 = v12;
      if ([@"less" isEqualToString:v7])
      {
        uint64_t v14 = -1;
      }
      else
      {
        if (![@"more" isEqualToString:v7])
        {
          BOOL v10 = 0;
          goto LABEL_14;
        }
        uint64_t v14 = 1;
      }
      BOOL v10 = [v13 compare:v9] == v14;
LABEL_14:

      goto LABEL_15;
    }
    BOOL v10 = 0;
  }
LABEL_16:

  return v10;
}

+ (BOOL)_testStrings:(id)a3 test:(id)a4 caseInsensitive:(BOOL)a5
{
  if (a5) {
    return [a3 caseInsensitiveCompare:a4] == 0;
  }
  return [a3 isEqualToString:a4];
}

+ (BOOL)evaluateArrayOp:(id)a3 onObj:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 objectForKey:@"path"];
  uint64_t v8 = [v5 objectForKey:@"value"];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v9 = +[DESJSONPredicate parsePath:v7];
    BOOL v10 = +[DESJSONPredicate fetchObjectAtPath:v9 from:v6];
    if (v10)
    {
      unsigned int v11 = [v5 objectForKeyedSubscript:@"op"];
      unsigned int v22 = [v11 isEqualToString:@"in-"];

      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v12 = v8;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        long long v20 = v9;
        id v21 = v6;
        uint64_t v15 = *(void *)v24;
        while (2)
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v24 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
            {
              if (+[DESJSONPredicate _testStrings:v10 test:v17 caseInsensitive:v22])
              {
                goto LABEL_18;
              }
            }
            else if ([v17 isEqual:v10])
            {
LABEL_18:
              BOOL v18 = 1;
              goto LABEL_19;
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
          if (v14) {
            continue;
          }
          break;
        }
        BOOL v18 = 0;
LABEL_19:
        uint64_t v9 = v20;
        id v6 = v21;
      }
      else
      {
        BOOL v18 = 0;
      }
    }
    else
    {
      BOOL v18 = 0;
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

+ (BOOL)isNumber:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CFTypeID v4 = CFGetTypeID(v3);
    BOOL v5 = v4 != CFBooleanGetTypeID();
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (BOOL)isBoolean:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CFTypeID v4 = CFGetTypeID(v3);
    BOOL v5 = v4 == CFBooleanGetTypeID();
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (BOOL)obj:(id)a3 matchesRegex:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v5;
    uint64_t v8 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:v6 options:0 error:0];
    uint64_t v9 = objc_msgSend(v8, "matchesInString:options:range:", v7, 0, 0, objc_msgSend(v7, "length"));
    BOOL v10 = v9;
    if (v9)
    {
      if ([v9 count] == 1) {
        char v11 = -1;
      }
      else {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11 & 1;
}

+ (BOOL)isDate:(id)a3
{
  return +[DESJSONPredicate obj:matchesRegex:](DESJSONPredicate, "obj:matchesRegex:", a3, @"^[0-9]{4}-[01][0-9]-[0-3][0-9]$");
}

+ (BOOL)isDateTime:(id)a3
{
  return +[DESJSONPredicate obj:matchesRegex:](DESJSONPredicate, "obj:matchesRegex:", a3, @"^[0-9]{4}-[01][0-9]-[0-3][0-9][Tt][0-2][0-9]:[0-5][0-9]:[0-6][0-9](\\.[0-9]+)?([Zz]|[-+][0-1][0-9]:[0-5][0-9])$");
}

+ (BOOL)isTime:(id)a3
{
  return +[DESJSONPredicate obj:a3 matchesRegex:@"^[0-2][0-9]:[0-5][0-9]:[0-6][0-9](\\.[0-9]+)?([Zz]|[-+][0-1][0-9]:[0-5][0-9])$"];
}

+ (BOOL)evaluateTypeOp:(id)a3 onObj:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 objectForKey:@"path"];
  uint64_t v8 = [v6 objectForKey:@"value"];

  char v9 = 0;
  if (v7 && v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v10 = +[DESJSONPredicate parsePath:v7];
      char v11 = +[DESJSONPredicate fetchObjectAtPath:v10 from:v5];
      if (v11)
      {
        if ([v8 isEqualToString:@"string"]) {
          goto LABEL_6;
        }
        if ([v8 isEqualToString:@"number"])
        {
          char isKindOfClass = +[DESJSONPredicate isNumber:v11];
          goto LABEL_14;
        }
        if ([v8 isEqualToString:@"BOOLean"])
        {
          char isKindOfClass = +[DESJSONPredicate isBoolean:v11];
          goto LABEL_14;
        }
        if ([v8 isEqualToString:@"object"]
          || [v8 isEqualToString:@"array"]
          || [v8 isEqualToString:@"null"])
        {
LABEL_6:
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
LABEL_14:
          char v9 = isKindOfClass;
          goto LABEL_20;
        }
        if (([v8 isEqualToString:@"undefined"] & 1) == 0)
        {
          if ([v8 isEqualToString:@"date"])
          {
            char isKindOfClass = +[DESJSONPredicate isDate:v11];
            goto LABEL_14;
          }
          if ([v8 isEqualToString:@"date-time"])
          {
            char isKindOfClass = +[DESJSONPredicate isDateTime:v11];
            goto LABEL_14;
          }
          if ([v8 isEqualToString:@"time"])
          {
            char isKindOfClass = +[DESJSONPredicate isTime:v11];
            goto LABEL_14;
          }
        }
      }
      else if ([v8 isEqualToString:@"undefined"])
      {
        char v9 = 1;
LABEL_20:

        goto LABEL_21;
      }
      char v9 = 0;
      goto LABEL_20;
    }
    char v9 = 0;
  }
LABEL_21:

  return v9 & 1;
}

+ (BOOL)evaluateAnd:(id)a3 onObj:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        if (!+[DESJSONPredicate evaluatePredicate:onObj:](DESJSONPredicate, "evaluatePredicate:onObj:", *(void *)(*((void *)&v14 + 1) + 8 * i), v6, (void)v14))
        {
          BOOL v12 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 1;
LABEL_11:

  return v12;
}

+ (BOOL)evaluateOr:(id)a3 onObj:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        if (+[DESJSONPredicate evaluatePredicate:onObj:](DESJSONPredicate, "evaluatePredicate:onObj:", *(void *)(*((void *)&v12 + 1) + 8 * i), v6, (void)v12))
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

+ (BOOL)evaluateBoolOp:(id)a3 onObj:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 objectForKey:@"op"];
  uint64_t v8 = [v6 objectForKey:@"path"];
  uint64_t v9 = [v6 objectForKey:@"apply"];

  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v9;
      id v11 = v5;
      if (v8)
      {
        long long v12 = +[DESJSONPredicate parsePath:v8];
        uint64_t v13 = +[DESJSONPredicate fetchObjectAtPath:v12 from:v11];

        id v11 = (id)v13;
      }
      if ([v7 isEqualToString:@"and"])
      {
        BOOL v14 = +[DESJSONPredicate evaluateAnd:v10 onObj:v11];
      }
      else
      {
        if ([v7 isEqualToString:@"not"])
        {
          BOOL v15 = !+[DESJSONPredicate evaluateAnd:v10 onObj:v11];
LABEL_13:

          goto LABEL_14;
        }
        if (![v7 isEqualToString:@"or"])
        {
          LOBYTE(v15) = 0;
          goto LABEL_13;
        }
        BOOL v14 = +[DESJSONPredicate evaluateOr:v10 onObj:v11];
      }
      LOBYTE(v15) = v14;
      goto LABEL_13;
    }
  }
  LOBYTE(v15) = 0;
LABEL_14:

  return v15;
}

+ (BOOL)evaluateDict:(id)a3 onObj:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (evaluateDict_onObj__onceToken != -1) {
    dispatch_once(&evaluateDict_onObj__onceToken, &__block_literal_global_1);
  }
  id v7 = [v5 allKeys];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    uint64_t v9 = [v5 objectForKey:@"op"];
    if ([(id)evaluateDict_onObj__BOOLOps containsObject:v9])
    {
      BOOL v10 = +[DESJSONPredicate evaluateBoolOp:v5 onObj:v6];
    }
    else if ([(id)evaluateDict_onObj__defOps containsObject:v9])
    {
      BOOL v10 = +[DESJSONPredicate evaluateDefOp:v5 onObj:v6];
    }
    else if ([(id)evaluateDict_onObj__stringOps containsObject:v9])
    {
      BOOL v10 = +[DESJSONPredicate evaluateStringOp:v5 onObj:v6];
    }
    else if ([(id)evaluateDict_onObj__regexOps containsObject:v9])
    {
      BOOL v10 = +[DESJSONPredicate evaluateRegexOp:v5 onObj:v6];
    }
    else if ([(id)evaluateDict_onObj__numericOps containsObject:v9])
    {
      BOOL v10 = +[DESJSONPredicate evaluateNumericOp:v5 onObj:v6];
    }
    else if ([(id)evaluateDict_onObj__arrayOps containsObject:v9])
    {
      BOOL v10 = +[DESJSONPredicate evaluateArrayOp:v5 onObj:v6];
    }
    else
    {
      if (![(id)evaluateDict_onObj__typeOps containsObject:v9])
      {
        BOOL v11 = 0;
        goto LABEL_20;
      }
      BOOL v10 = +[DESJSONPredicate evaluateTypeOp:v5 onObj:v6];
    }
    BOOL v11 = v10;
LABEL_20:

    goto LABEL_21;
  }
  BOOL v11 = 1;
LABEL_21:

  return v11;
}

void __39__DESJSONPredicate_evaluateDict_onObj___block_invoke()
{
  v34[3] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v34[0] = @"and";
  v34[1] = @"not";
  v34[2] = @"or";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:3];
  uint64_t v2 = [v0 initWithArray:v1];
  id v3 = (void *)evaluateDict_onObj__BOOLOps;
  evaluateDict_onObj__BOOLOps = v2;

  id v4 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v33[0] = @"defined";
  v33[1] = @"undefined";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
  uint64_t v6 = [v4 initWithArray:v5];
  id v7 = (void *)evaluateDict_onObj__defOps;
  evaluateDict_onObj__defOps = v6;

  id v8 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v32 = @"type";
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
  uint64_t v10 = [v8 initWithArray:v9];
  BOOL v11 = (void *)evaluateDict_onObj__typeOps;
  evaluateDict_onObj__typeOps = v10;

  id v12 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v31[0] = @"in";
  v31[1] = @"in-";
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
  uint64_t v14 = [v12 initWithArray:v13];
  BOOL v15 = (void *)evaluateDict_onObj__arrayOps;
  evaluateDict_onObj__arrayOps = v14;

  id v16 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v30[0] = @"less";
  v30[1] = @"more";
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
  uint64_t v18 = [v16 initWithArray:v17];
  uint64_t v19 = (void *)evaluateDict_onObj__numericOps;
  evaluateDict_onObj__numericOps = v18;

  id v20 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v29[0] = @"matches";
  v29[1] = @"matches-";
  id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
  uint64_t v22 = [v20 initWithArray:v21];
  long long v23 = (void *)evaluateDict_onObj__regexOps;
  evaluateDict_onObj__regexOps = v22;

  id v24 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v28[0] = @"contains";
  v28[1] = @"contains-";
  v28[2] = @"ends";
  v28[3] = @"ends-";
  v28[4] = @"starts";
  v28[5] = @"starts-";
  v28[6] = @"test";
  v28[7] = @"test-";
  long long v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:8];
  uint64_t v26 = [v24 initWithArray:v25];
  v27 = (void *)evaluateDict_onObj__stringOps;
  evaluateDict_onObj__stringOps = v26;
}

+ (BOOL)evaluatePredicate:(id)a3 onObj:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = v5
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && +[DESJSONPredicate evaluateDict:v5 onObj:v6];

  return v7;
}

+ (BOOL)evaluateJson:(id)a3 onJson:(id)a4
{
  id v5 = a4;
  id v6 = +[DESJSONPredicate parseJSON:a3];
  BOOL v7 = +[DESJSONPredicate parseJSON:v5];

  LOBYTE(v5) = +[DESJSONPredicate evaluatePredicate:v6 onObj:v7];
  return (char)v5;
}

@end