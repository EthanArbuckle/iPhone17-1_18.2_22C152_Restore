@interface VSAuthenticationSchemeValueTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
- (id)reverseTransformedValue:(id)a3;
- (id)transformedValue:(id)a3;
@end

@implementation VSAuthenticationSchemeValueTransformer

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

- (id)transformedValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 componentsJoinedByString:@","];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)reverseTransformedValue:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v6 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v7 = *MEMORY[0x1E4F1C3C8];
        v8 = (objc_class *)objc_opt_class();
        v9 = NSStringFromClass(v8);
        [v6 raise:v7, @"Unexpectedly, value was %@, instead of NSString.", v9 format];
      }
      v10 = [v5 componentsSeparatedByString:@","];
      if ([v10 count])
      {
        id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        v22 = v10;
        id v12 = v10;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v24;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v24 != v15) {
                objc_enumerationMutation(v12);
              }
              v17 = *(void **)(*((void *)&v23 + 1) + 8 * i);
              v18 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
              v19 = [v17 stringByTrimmingCharactersInSet:v18];

              if ([v19 length]) {
                [v11 addObject:v19];
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
          }
          while (v14);
        }

        if ([v11 count]) {
          id v20 = v11;
        }
        else {
          id v20 = 0;
        }

        v10 = v22;
      }
      else
      {
        id v20 = 0;
      }
    }
    else
    {
      id v20 = 0;
    }
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

@end