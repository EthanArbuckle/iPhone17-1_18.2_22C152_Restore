@interface HAPJSONValueTransformer
+ (Class)expectedTransformedClassForFormat:(unint64_t)a3;
+ (id)defaultJSONValueTransformer;
+ (void)initialize;
- (id)reverseTransformedValue:(id)a3 format:(unint64_t)a4 error:(id *)a5;
- (id)transformedValue:(id)a3 format:(unint64_t)a4 error:(id *)a5;
@end

@implementation HAPJSONValueTransformer

+ (id)defaultJSONValueTransformer
{
  return (id)defaultJSONValueTransformer;
}

- (id)reverseTransformedValue:(id)a3 format:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || v8
    && (v15.receiver = self,
        v15.super_class = (Class)HAPJSONValueTransformer,
        -[HAPValueTransformer reverseTransformedValue:format:error:](&v15, sel_reverseTransformedValue_format_error_, v8, a4, a5), v9 = objc_claimAutoreleasedReturnValue(), int v10 = [v8 isEqual:v9], v9, !v10))
  {
    v13 = 0;
  }
  else
  {
    uint64_t v11 = [(id)objc_opt_class() expectedClassForFormat:a4];
    if (v11 == objc_opt_class() && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      id v12 = (id)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v8 options:0];
    }
    else {
      id v12 = v8;
    }
    v13 = v12;
  }

  return v13;
}

+ (Class)expectedTransformedClassForFormat:(unint64_t)a3
{
  if (a3 - 1 > 0xE)
  {
    v4 = 0;
  }
  else
  {
    v4 = objc_opt_class();
  }
  return (Class)v4;
}

- (id)transformedValue:(id)a3 format:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  if (v8)
  {
    v14.receiver = self;
    v14.super_class = (Class)HAPJSONValueTransformer;
    v9 = [(HAPValueTransformer *)&v14 transformedValue:v8 format:a4 error:a5];
    int v10 = [v8 isEqual:v9];

    if (!v10)
    {
      id v12 = 0;
      goto LABEL_9;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = [v8 base64EncodedStringWithOptions:0];
    }
    else
    {
      id v11 = v8;
    }
  }
  else
  {
    id v11 = [MEMORY[0x1E4F1CA98] null];
  }
  id v12 = v11;
LABEL_9:

  return v12;
}

+ (void)initialize
{
  if (!defaultJSONValueTransformer)
  {
    defaultJSONValueTransformer = objc_alloc_init(HAPJSONValueTransformer);
    MEMORY[0x1F41817F8]();
  }
}

@end