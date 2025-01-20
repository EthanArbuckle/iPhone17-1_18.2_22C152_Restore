@interface AVTextStyleRule
+ (AVTextStyleRule)textStyleRuleWithTextMarkupAttributes:(NSDictionary *)textMarkupAttributes;
+ (AVTextStyleRule)textStyleRuleWithTextMarkupAttributes:(NSDictionary *)textMarkupAttributes textSelector:(NSString *)textSelector;
+ (NSArray)textStyleRulesFromPropertyList:(id)plist;
+ (id)propertyListForTextStyleRules:(NSArray *)textStyleRules;
- (AVTextStyleRule)init;
- (AVTextStyleRule)initWithTextMarkupAttributes:(NSDictionary *)textMarkupAttributes;
- (AVTextStyleRule)initWithTextMarkupAttributes:(NSDictionary *)textMarkupAttributes textSelector:(NSString *)textSelector;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)textMarkupAttributes;
- (NSString)textSelector;
- (id)_dictionaryPlistRepresentation;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation AVTextStyleRule

+ (id)propertyListForTextStyleRules:(NSArray *)textStyleRules
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](textStyleRules, "count"));
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(NSArray *)textStyleRules countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(textStyleRules);
        }
        objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8++), "_dictionaryPlistRepresentation"));
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)textStyleRules countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return v4;
}

+ (NSArray)textStyleRulesFromPropertyList:(id)plist
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v22 = (NSArray *)objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(plist, "count"));
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obuint64_t j = plist;
  uint64_t v24 = [plist countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v24)
  {
    uint64_t v23 = *(void *)v30;
    uint64_t v4 = *MEMORY[0x1E4F1F810];
    uint64_t v21 = *MEMORY[0x1E4F1F990];
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v30 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v7 = (id)[v6 objectForKey:v4];
        id v8 = (id)[v6 objectForKey:@"AVCGColorAttributes"];
        v9 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v6];
        [v9 removeObjectForKey:v4];
        [v9 removeObjectForKey:@"AVCGColorAttributes"];
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v26;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v26 != v12) {
                objc_enumerationMutation(v8);
              }
              uint64_t v14 = *(void *)(*((void *)&v25 + 1) + 8 * j);
              [v9 objectForKey:v14];
              uint64_t CGColorSRGBFromArray = FigCreateCGColorSRGBFromArray();
              if (CGColorSRGBFromArray)
              {
                v16 = (CGColor *)CGColorSRGBFromArray;
                [v9 setObject:CGColorSRGBFromArray forKey:v14];
                CGColorRelease(v16);
              }
            }
            uint64_t v11 = [v8 countByEnumeratingWithState:&v25 objects:v33 count:16];
          }
          while (v11);
        }
        if (v7)
        {
          if ([v7 isEqual:v21]) {
            id v17 = 0;
          }
          else {
            id v17 = v7;
          }
        }
        else
        {
          id v17 = 0;
        }
        v18 = +[AVTextStyleRule textStyleRuleWithTextMarkupAttributes:v9 textSelector:v17];
        if (v18) {
          [(NSArray *)v22 addObject:v18];
        }
      }
      uint64_t v24 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v24);
  }
  return v22;
}

+ (AVTextStyleRule)textStyleRuleWithTextMarkupAttributes:(NSDictionary *)textMarkupAttributes
{
  return (AVTextStyleRule *)[a1 textStyleRuleWithTextMarkupAttributes:textMarkupAttributes textSelector:0];
}

+ (AVTextStyleRule)textStyleRuleWithTextMarkupAttributes:(NSDictionary *)textMarkupAttributes textSelector:(NSString *)textSelector
{
  uint64_t v4 = [[AVTextStyleRule alloc] initWithTextMarkupAttributes:textMarkupAttributes textSelector:textSelector];
  return v4;
}

- (AVTextStyleRule)init
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3A8];
  uint64_t v6 = NSStringFromSelector(sel_initWithTextMarkupAttributes_textSelector_);
  uint64_t v12 = (void *)[v4 exceptionWithName:v5, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Not available.  Use %@ instead", v7, v8, v9, v10, v11, (uint64_t)v6), 0 reason userInfo];
  objc_exception_throw(v12);
}

- (AVTextStyleRule)initWithTextMarkupAttributes:(NSDictionary *)textMarkupAttributes
{
  return [(AVTextStyleRule *)self initWithTextMarkupAttributes:textMarkupAttributes textSelector:0];
}

- (AVTextStyleRule)initWithTextMarkupAttributes:(NSDictionary *)textMarkupAttributes textSelector:(NSString *)textSelector
{
  v9.receiver = self;
  v9.super_class = (Class)AVTextStyleRule;
  uint64_t v6 = [(AVTextStyleRule *)&v9 init];
  if (v6)
  {
    uint64_t v7 = objc_alloc_init(AVTextStyleRuleInternal);
    v6->_textStyleRule = v7;
    if (v7)
    {
      CFRetain(v7);
      v6->_textStyleRule->textMarkupAttributes = textMarkupAttributes;
      v6->_textStyleRule->textSelector = textSelector;
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  textStyleRule = self->_textStyleRule;
  if (textStyleRule)
  {

    CFRelease(self->_textStyleRule);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVTextStyleRule;
  [(AVTextStyleRule *)&v4 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (self != a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v5 = -[NSDictionary isEqualToDictionary:](self->_textStyleRule->textMarkupAttributes, "isEqualToDictionary:", [a3 textMarkupAttributes]);
      if (!v5) {
        return v5;
      }
      uint64_t v6 = [a3 textSelector];
      textSelector = self->_textStyleRule->textSelector;
      if (textSelector)
      {
        BOOL v5 = [(NSString *)textSelector isEqualToString:v6];
        if (!v5) {
          return v5;
        }
        goto LABEL_11;
      }
      if (!v6)
      {
LABEL_11:
        LOBYTE(v5) = 1;
        return v5;
      }
    }
    LOBYTE(v5) = 0;
    return v5;
  }
  LOBYTE(v5) = 1;
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDictionary *)self->_textStyleRule->textMarkupAttributes hash];
  return [(NSString *)self->_textStyleRule->textSelector hash] ^ v3;
}

- (NSDictionary)textMarkupAttributes
{
  return self->_textStyleRule->textMarkupAttributes;
}

- (NSString)textSelector
{
  return self->_textStyleRule->textSelector;
}

- (id)_dictionaryPlistRepresentation
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:self->_textStyleRule->textMarkupAttributes];
  textSelector = self->_textStyleRule->textSelector;
  BOOL v5 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F1F548], *MEMORY[0x1E4F1F600], 0);
  uint64_t v6 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v12 = (const void *)[v3 objectForKey:v11];
        if (v12)
        {
          CFTypeID v13 = CFGetTypeID(v12);
          if (v13 == CGColorGetTypeID())
          {
            [v3 setValue:(id)FigCopyCGColorSRGBAsArray() forKey:v11];
            [v6 addObject:v11];
          }
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
  uint64_t v14 = (NSString *)*MEMORY[0x1E4F1F990];
  if ([v6 count]) {
    [v3 setObject:v6 forKey:@"AVCGColorAttributes"];
  }
  if (textSelector) {
    uint64_t v15 = textSelector;
  }
  else {
    uint64_t v15 = v14;
  }
  [v3 setObject:v15 forKey:*MEMORY[0x1E4F1F810]];
  return v3;
}

@end