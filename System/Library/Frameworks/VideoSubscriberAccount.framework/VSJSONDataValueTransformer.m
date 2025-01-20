@interface VSJSONDataValueTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
- (id)transformedValue:(id)a3;
@end

@implementation VSJSONDataValueTransformer

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)allowsReverseTransformation
{
  return 0;
}

- (id)transformedValue:(id)a3
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
        [v6 raise:v7, @"Unexpectedly, value was %@, instead of NSData.", v9 format];
      }
      id v16 = 0;
      v10 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v5 options:0 error:&v16];
      id v11 = v16;
      v12 = v11;
      if (v10)
      {
        uint64_t v13 = +[VSFailable failableWithObject:v10];
      }
      else
      {
        if (!v11) {
          [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The errorOrNil parameter must not be nil."];
        }
        uint64_t v13 = +[VSFailable failableWithError:v12];
      }
      v14 = (void *)v13;
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end