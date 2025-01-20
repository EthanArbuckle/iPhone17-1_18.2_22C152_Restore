@interface NSOrderedSet(NSKeyValueCoding)
- (NSDecimalNumber)_sumForKeyPath:()NSKeyValueCoding;
- (NSNumber)_countForKeyPath:()NSKeyValueCoding;
- (id)valueForKey:()NSKeyValueCoding;
- (id)valueForKeyPath:()NSKeyValueCoding;
- (uint64_t)_avgForKeyPath:()NSKeyValueCoding;
- (uint64_t)setValue:()NSKeyValueCoding forKey:;
- (void)_maxForKeyPath:()NSKeyValueCoding;
- (void)_minForKeyPath:()NSKeyValueCoding;
@end

@implementation NSOrderedSet(NSKeyValueCoding)

- (id)valueForKey:()NSKeyValueCoding
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a3 length];
  if (v5
    && (uint64_t v6 = v5, [a3 characterAtIndex:0] == 64)
    && (uint64_t v7 = objc_msgSend(a3, "_newSubstringWithRange:zone:", 1, v6 - 1, 0)) != 0)
  {
    v8 = (void *)v7;
    v17.receiver = a1;
    v17.super_class = (Class)NSOrderedSet_0;
    id v9 = objc_msgSendSuper2(&v17, sel_valueForKey_, v7);
  }
  else
  {
    v10 = NSAllocateObjectArray([a1 count]);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v11 = 0;
    uint64_t v12 = [a1 countByEnumeratingWithState:&v19 objects:v18 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v20;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(a1);
          }
          uint64_t v15 = [*(id *)(*((void *)&v19 + 1) + 8 * v14) valueForKey:a3];
          if (v15) {
            v10[v11++] = v15;
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [a1 countByEnumeratingWithState:&v19 objects:v18 count:16];
      }
      while (v12);
    }
    id v9 = (id)[objc_alloc(MEMORY[0x1E4F1CAA0]) initWithObjects:v10 count:v11];
    free(v10);
  }
  return v9;
}

- (NSDecimalNumber)_sumForKeyPath:()NSKeyValueCoding
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v13 = 0uLL;
  int v14 = 0;
  uint64_t v5 = +[NSDecimalNumber zero];
  if (v5)
  {
    [(NSDecimalNumber *)v5 decimalValue];
  }
  else
  {
    long long v13 = 0uLL;
    int v14 = 0;
  }
  uint64_t v6 = [a1 count];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
    {
      id v9 = (void *)[a1 _valueForKeyPath:a3 ofObjectAtIndex:i];
      if (v9)
      {
        LODWORD(v12) = 0;
        objc_msgSend(v9, "decimalValue", 0, 0, v12);
        _NSDecimalAdd(&v13, &v13, &v11, 3);
      }
    }
  }
  long long v11 = v13;
  LODWORD(v12) = v14;
  return +[NSDecimalNumber decimalNumberWithDecimal:&v11];
}

- (uint64_t)_avgForKeyPath:()NSKeyValueCoding
{
  uint64_t result = [a1 count];
  if (result)
  {
    uint64_t v6 = result;
    uint64_t v7 = (void *)[a1 _sumForKeyPath:a3];
    v8 = +[NSDecimalNumber numberWithUnsignedInteger:v6];
    return [v7 decimalNumberByDividingBy:v8];
  }
  return result;
}

- (NSNumber)_countForKeyPath:()NSKeyValueCoding
{
  uint64_t v1 = [a1 count];

  return +[NSNumber numberWithInteger:v1];
}

- (void)_maxForKeyPath:()NSKeyValueCoding
{
  uint64_t v5 = [a1 count];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = 0;
  v8 = 0;
  do
  {
    uint64_t v9 = [a1 _valueForKeyPath:a3 ofObjectAtIndex:v7];
    if (v9)
    {
      v10 = (void *)v9;
      if (!v8 || [v8 compare:v9] == -1) {
        v8 = v10;
      }
    }
    ++v7;
  }
  while (v6 != v7);
  return v8;
}

- (void)_minForKeyPath:()NSKeyValueCoding
{
  uint64_t v5 = [a1 count];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = 0;
  v8 = 0;
  do
  {
    uint64_t v9 = [a1 _valueForKeyPath:a3 ofObjectAtIndex:v7];
    if (v9)
    {
      v10 = (void *)v9;
      if (!v8 || [v8 compare:v9] == 1) {
        v8 = v10;
      }
    }
    ++v7;
  }
  while (v6 != v7);
  return v8;
}

- (uint64_t)setValue:()NSKeyValueCoding forKey:
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t result = [a1 countByEnumeratingWithState:&v12 objects:v11 count:16];
  if (result)
  {
    uint64_t v8 = result;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(a1);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v10++) setValue:a3 forKey:a4];
      }
      while (v8 != v10);
      uint64_t result = [a1 countByEnumeratingWithState:&v12 objects:v11 count:16];
      uint64_t v8 = result;
    }
    while (result);
  }
  return result;
}

- (id)valueForKeyPath:()NSKeyValueCoding
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a3 length];
  if (v5)
  {
    uint64_t v6 = v5;
    if ([a3 characterAtIndex:0] == 64)
    {
      uint64_t v7 = objc_msgSend(a3, "rangeOfString:options:range:", @".", 2, 0, v6);
      if (v8)
      {
        uint64_t v9 = v7 + 1;
        uint64_t v10 = objc_msgSend(a3, "_newSubstringWithRange:zone:", 1, v7 - 1, 0);
        uint64_t v11 = objc_msgSend(a3, "_newSubstringWithRange:zone:", v9, v6 - v9, 0);
        if (v11)
        {
          long long v12 = (void *)v11;
          uint64_t v13 = [v10 lengthOfBytesUsingEncoding:4];
          double v14 = MEMORY[0x1F4188790](v13);
          uint64_t v16 = (char *)&v24 - v15;
          objc_msgSend(v10, "getCString:maxLength:encoding:", (char *)&v24 - v15, v14);
          objc_super v17 = objc_opt_class();
          if (!NSKeyValueMethodForPattern(v17, "%sForKeyPath:", v16))
          {
            v18 = objc_opt_class();
            if (!NSKeyValueMethodForPattern(v18, "_%sForKeyPath:", v16))
            {

              id v22 = v10;
              uint64_t v23 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[<%@ %p> valueForKeyPath:]: this class does not implement the %@ operation.", objc_opt_class(), a1, v10), 0 reason userInfo];
              objc_exception_throw(v23);
            }
          }
          method_invoke();
          id v20 = v19;

          goto LABEL_11;
        }
      }
      else
      {
        uint64_t v10 = objc_msgSend(a3, "_newSubstringWithRange:zone:", 1, v6 - 1, 0);
      }
      v26.receiver = a1;
      v26.super_class = (Class)NSOrderedSet_0;
      id v20 = objc_msgSendSuper2(&v26, sel_valueForKey_, v10);
LABEL_11:

      return v20;
    }
  }
  v25.receiver = a1;
  v25.super_class = (Class)NSOrderedSet_0;
  return objc_msgSendSuper2(&v25, sel_valueForKeyPath_, a3);
}

@end