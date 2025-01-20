@interface NSDictionary(NSKeyValueCoding)
- (id)valueForKeyPath:()NSKeyValueCoding;
- (uint64_t)valueForKey:()NSKeyValueCoding;
@end

@implementation NSDictionary(NSKeyValueCoding)

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
        v10 = objc_msgSend(a3, "_newSubstringWithRange:zone:", 1, v7 - 1, 0);
        uint64_t v11 = objc_msgSend(a3, "_newSubstringWithRange:zone:", v9, v6 - v9, 0);
        if (v11)
        {
          v12 = (void *)v11;
          uint64_t v13 = [v10 lengthOfBytesUsingEncoding:4];
          double v14 = MEMORY[0x1F4188790](v13);
          v16 = (char *)&v24 - v15;
          objc_msgSend(v10, "getCString:maxLength:encoding:", (char *)&v24 - v15, v14);
          v17 = objc_opt_class();
          if (!NSKeyValueMethodForPattern(v17, "%sForKeyPath:", v16))
          {
            v18 = objc_opt_class();
            if (!NSKeyValueMethodForPattern(v18, "_%sForKeyPath:", v16))
            {

              id v22 = v10;
              v23 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[<%@ %p> valueForKeyPath:]: this class does not implement the %@ operation.", objc_opt_class(), a1, v10), 0 reason userInfo];
              objc_exception_throw(v23);
            }
          }
          method_invoke();
          id v20 = v19;

          goto LABEL_12;
        }
      }
      else
      {
        v10 = objc_msgSend(a3, "_newSubstringWithRange:zone:", 1, v6 - 1, 0);
      }
      v26.receiver = a1;
      v26.super_class = (Class)NSDictionary_0;
      id v20 = objc_msgSendSuper2(&v26, sel_valueForKey_, v10);
LABEL_12:

      return v20;
    }
  }
  id v20 = (id)[a1 objectForKey:a3];
  if (!v20)
  {
    v25.receiver = a1;
    v25.super_class = (Class)NSDictionary_0;
    return objc_msgSendSuper2(&v25, sel_valueForKeyPath_, a3);
  }
  return v20;
}

- (uint64_t)valueForKey:()NSKeyValueCoding
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a3 length];
  if (v5
    && (uint64_t v6 = v5, [a3 characterAtIndex:0] == 64)
    && (uint64_t v7 = objc_msgSend(a3, "_newSubstringWithRange:zone:", 1, v6 - 1, 0)) != 0)
  {
    uint64_t v8 = (void *)v7;
    v11.receiver = a1;
    v11.super_class = (Class)NSDictionary_0;
    id v9 = objc_msgSendSuper2(&v11, sel_valueForKey_, v7);

    return (uint64_t)v9;
  }
  else
  {
    return [a1 objectForKey:a3];
  }
}

@end