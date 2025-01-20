@interface NSObject(INJSONSerialization)
- (id)_setterForProperty:()INJSONSerialization;
- (uint64_t)_intents_isValidKey:()INJSONSerialization;
@end

@implementation NSObject(INJSONSerialization)

- (id)_setterForProperty:()INJSONSerialization
{
  v3 = (const char *)[a3 cStringUsingEncoding:1];
  v4 = (objc_class *)objc_opt_class();
  Property = class_getProperty(v4, v3);
  v6 = property_copyAttributeValue(Property, "S");
  if (v6)
  {
    v7 = [NSString stringWithCString:v6 encoding:1];
    if ([v7 hasPrefix:@"set"] && (unint64_t)objc_msgSend(v7, "length") >= 4)
    {
      v8 = objc_msgSend(NSString, "stringWithFormat:", @"%c", (char)__tolower(objc_msgSend(v7, "characterAtIndex:", 3)));
      v9 = [v7 substringFromIndex:4];
      uint64_t v10 = [v9 rangeOfString:@":"];
      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v11 = [v9 substringToIndex:v10];

        v9 = (void *)v11;
      }
      uint64_t v12 = [NSString stringWithFormat:@"%@%@", v8, v9];

      v7 = (void *)v12;
    }
    free(v6);
  }
  else
  {
    v7 = [NSString stringWithCString:v3 encoding:1];
  }

  return v7;
}

- (uint64_t)_intents_isValidKey:()INJSONSerialization
{
  v4 = a3;
  NSSelectorFromString(v4);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = 1;
  }
  else if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [a1 _isValidKey:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

@end