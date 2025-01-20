@interface HMDValueTransformer
+ (Class)transformedValueClass;
+ (Class)valueClass;
+ (id)decodeValue:(id)a3 withTransformerNamed:(id)a4 error:(id *)a5;
+ (id)encodeValue:(id)a3 withTransformerNamed:(id)a4 error:(id *)a5;
+ (id)requiredTransformerForName:(uint64_t)a1;
+ (id)reverseTransformedValue:(id)a3 error:(id *)a4;
+ (id)sharedTransformer;
+ (id)transformedValue:(id)a3 error:(id *)a4;
+ (id)valueTransformerForName:(id)a3;
- (BOOL)isKindOfTransformer:(Class)a3;
- (HMDValueTransformer)init;
- (id)description;
- (id)reverseTransformedValue:(id)a3;
- (id)reverseTransformedValue:(id)a3 error:(id *)a4;
- (id)transformedValue:(id)a3;
- (id)transformedValue:(id)a3 error:(id *)a4;
@end

@implementation HMDValueTransformer

- (id)reverseTransformedValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = objc_opt_class();
  if (checkValueOfClass((uint64_t)v5, [v6 transformedValueClass], a4))
  {
    v7 = [v6 reverseTransformedValue:v5 error:a4];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)transformedValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = objc_opt_class();
  if (checkValueOfClass((uint64_t)v5, [v6 valueClass], a4))
  {
    v7 = [v6 transformedValue:v5 error:a4];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)reverseTransformedValue:(id)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v14 = 0;
    id v5 = [(HMDValueTransformer *)self reverseTransformedValue:v4 error:&v14];
    id v6 = v14;
    if (!v5)
    {
      if (v6)
      {
        uint64_t v15 = *MEMORY[0x263F08608];
        v16[0] = v6;
        uint64_t v8 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
      }
      else
      {
        uint64_t v8 = 0;
      }
      v9 = NSString;
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      uint64_t v12 = [v9 stringWithFormat:@"%@ reverseTransformedValue failed", v11];

      id v13 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v12 userInfo:v8];
      objc_exception_throw(v13);
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)transformedValue:(id)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v14 = 0;
    id v5 = [(HMDValueTransformer *)self transformedValue:v4 error:&v14];
    id v6 = v14;
    if (!v5)
    {
      if (v6)
      {
        uint64_t v15 = *MEMORY[0x263F08608];
        v16[0] = v6;
        uint64_t v8 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
      }
      else
      {
        uint64_t v8 = 0;
      }
      v9 = NSString;
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      uint64_t v12 = [v9 stringWithFormat:@"%@ transformedValue failed", v11];

      id v13 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v12 userInfo:v8];
      objc_exception_throw(v13);
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)isKindOfTransformer:(Class)a3
{
  return objc_opt_isKindOfClass() & 1;
}

- (id)description
{
  v2 = objc_opt_class();
  return (id)[v2 description];
}

- (HMDValueTransformer)init
{
  uint64_t v4 = objc_opt_class();
  if (v4 == objc_opt_class())
  {
    id v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF498];
    uint64_t v8 = NSString;
    v9 = NSStringFromSelector(a2);
    v10 = [v8 stringWithFormat:@"You must override %@ in a subclass", v9];
    id v11 = [v6 exceptionWithName:v7 reason:v10 userInfo:0];

    objc_exception_throw(v11);
  }
  v12.receiver = self;
  v12.super_class = (Class)HMDValueTransformer;
  return [(HMDValueTransformer *)&v12 init];
}

+ (id)reverseTransformedValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)MEMORY[0x263EFF940];
  uint64_t v7 = *MEMORY[0x263EFF498];
  uint64_t v8 = NSString;
  v9 = NSStringFromSelector(a2);
  v10 = [v8 stringWithFormat:@"You must override %@ in a subclass", v9];
  id v11 = [v6 exceptionWithName:v7 reason:v10 userInfo:0];

  objc_exception_throw(v11);
}

+ (id)transformedValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)MEMORY[0x263EFF940];
  uint64_t v7 = *MEMORY[0x263EFF498];
  uint64_t v8 = NSString;
  v9 = NSStringFromSelector(a2);
  v10 = [v8 stringWithFormat:@"You must override %@ in a subclass", v9];
  id v11 = [v6 exceptionWithName:v7 reason:v10 userInfo:0];

  objc_exception_throw(v11);
}

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (Class)valueClass
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  uint64_t v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)valueTransformerForName:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263F08D50] valueTransformerForName:v3];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
    }
    else
    {
      if (valueTransformerForName__once != -1) {
        dispatch_once(&valueTransformerForName__once, &__block_literal_global_264991);
      }
      id v5 = [(id)valueTransformerForName__adaptersByName objectForKey:v3];
      if (!v5)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          && ([v3 isEqualToString:*MEMORY[0x263F081E0]] & 1) == 0)
        {
          [v3 isEqualToString:*MEMORY[0x263F085F8]];
        }
        id v5 = (id)[objc_alloc((Class)objc_opt_class()) initWithTransformer:v4];
        id v7 = (void *)valueTransformerForName__adaptersByName;
        uint64_t v8 = (void *)[v3 copy];
        [v7 setObject:v5 forKey:v8];
      }
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void __47__HMDValueTransformer_valueTransformerForName___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF8E0]);
  v1 = (void *)valueTransformerForName__adaptersByName;
  valueTransformerForName__adaptersByName = (uint64_t)v0;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v4 stringByAppendingString:@".adaptersByName"];
  [(id)valueTransformerForName__adaptersByName setName:v3];
}

+ (id)sharedTransformer
{
  v2 = (void *)MEMORY[0x263F08D50];
  id v3 = NSStringFromClass((Class)a1);
  id v4 = [v2 valueTransformerForName:v3];

  return v4;
}

+ (id)decodeValue:(id)a3 withTransformerNamed:(id)a4 error:(id *)a5
{
  if (a4) {
    id v7 = a4;
  }
  else {
    id v7 = (id)*MEMORY[0x263F081E0];
  }
  id v8 = a3;
  v9 = +[HMDValueTransformer requiredTransformerForName:]((uint64_t)a1, v7);
  v10 = [v9 reverseTransformedValue:v8 error:a5];

  return v10;
}

+ (id)requiredTransformerForName:(uint64_t)a1
{
  id v2 = a2;
  uint64_t v3 = [self valueTransformerForName:v2];
  if (v3)
  {
    id v4 = (void *)v3;

    return v4;
  }
  else
  {
    id v6 = (void *)_HMFPreconditionFailureWithFormat();
    return +[HMDValueTransformer encodeValue:v8 withTransformerNamed:v9 error:v10];
  }
}

+ (id)encodeValue:(id)a3 withTransformerNamed:(id)a4 error:(id *)a5
{
  if (a4) {
    id v7 = a4;
  }
  else {
    id v7 = (id)*MEMORY[0x263F081E0];
  }
  id v8 = a3;
  id v9 = +[HMDValueTransformer requiredTransformerForName:]((uint64_t)a1, v7);
  v10 = [v9 transformedValue:v8 error:a5];

  return v10;
}

@end