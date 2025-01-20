@interface VSBase64DataValueTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
- (id)reverseTransformedValue:(id)a3;
- (id)transformedValue:(id)a3;
@end

@implementation VSBase64DataValueTransformer

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
  return (id)[a3 base64EncodedStringWithOptions:0];
}

- (id)reverseTransformedValue:(id)a3
{
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
      v10 = (objc_class *)MEMORY[0x1E4F1C9B8];
      id v11 = v5;
      v12 = (void *)[[v10 alloc] initWithBase64EncodedString:v11 options:0];
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end