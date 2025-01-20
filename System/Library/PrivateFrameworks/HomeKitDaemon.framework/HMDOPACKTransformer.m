@interface HMDOPACKTransformer
+ (BOOL)isStructuredDataCompatible;
+ (Class)valueClass;
+ (id)OPACKFromValue:(id)a3 error:(id *)a4;
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)reverseTransformedValue:(id)a3 error:(id *)a4;
+ (id)transformedValue:(id)a3 error:(id *)a4;
+ (id)valueFromOPACK:(id)a3 error:(id *)a4;
- (id)OPACKFromValue:(id)a3 error:(id *)a4;
- (id)valueFromOPACK:(id)a3 error:(id *)a4;
@end

@implementation HMDOPACKTransformer

- (id)valueFromOPACK:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (!v5) {
    goto LABEL_13;
  }
  if (HMDIsOPACKValue_once != -1) {
    dispatch_once(&HMDIsOPACKValue_once, &__block_literal_global_150603);
  }
  CFTypeID v6 = CFGetTypeID(v5);
  if (v6 == HMDIsOPACKValue_arrayTypeID
    || v6 == HMDIsOPACKValue_dictionaryTypeID
    || v6 == HMDIsOPACKValue_nullTypeID
    || v6 == HMDIsOPACKValue_BOOLeanTypeID
    || v6 == HMDIsOPACKValue_stringTypeID
    || v6 == HMDIsOPACKValue_numberTypeID
    || v6 == HMDIsOPACKValue_dataTypeID
    || v6 == HMDIsOPACKValue_dateTypeID)
  {

    goto LABEL_16;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
LABEL_16:
    v8 = [(id)objc_opt_class() valueFromOPACK:v5 error:a4];
    goto LABEL_18;
  }
LABEL_13:
  if (a4)
  {
    [MEMORY[0x263F087E8] hmfErrorWithCode:3 reason:@"Expected OPACK-compatible value"];
    v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
LABEL_18:

  return v8;
}

- (id)OPACKFromValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  CFTypeID v6 = objc_opt_class();
  uint64_t v7 = [v6 valueClass];
  if (objc_opt_isKindOfClass())
  {
    a4 = [v6 OPACKFromValue:v5 error:a4];
  }
  else if (a4)
  {
    v8 = (void *)MEMORY[0x263F087E8];
    v9 = [NSString stringWithFormat:@"Expected %@", v7];
    *a4 = [v8 hmfErrorWithCode:3 reason:v9];

    a4 = 0;
  }

  return a4;
}

+ (id)valueFromOPACK:(id)a3 error:(id *)a4
{
  id v5 = a3;
  CFTypeID v6 = (void *)MEMORY[0x263EFF940];
  uint64_t v7 = *MEMORY[0x263EFF498];
  v8 = NSString;
  v9 = NSStringFromSelector(a2);
  v10 = [v8 stringWithFormat:@"You must override %@ in a subclass", v9];
  id v11 = [v6 exceptionWithName:v7 reason:v10 userInfo:0];

  objc_exception_throw(v11);
}

+ (id)OPACKFromValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  CFTypeID v6 = (void *)MEMORY[0x263EFF940];
  uint64_t v7 = *MEMORY[0x263EFF498];
  v8 = NSString;
  v9 = NSStringFromSelector(a2);
  v10 = [v8 stringWithFormat:@"You must override %@ in a subclass", v9];
  id v11 = [v6 exceptionWithName:v7 reason:v10 userInfo:0];

  objc_exception_throw(v11);
}

+ (id)reverseTransformedValue:(id)a3 error:(id *)a4
{
  id v5 = (void *)OPACKDecodeData();
  if (a4)
  {
    id v6 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6705 userInfo:0];
    *a4 = v6;

    a4 = 0;
  }

  return a4;
}

+ (id)transformedValue:(id)a3 error:(id *)a4
{
  uint64_t v5 = objc_msgSend(a1, "OPACKFromValue:error:", a3);
  id v6 = (void *)v5;
  if (!v5)
  {
    id v9 = 0;
    goto LABEL_12;
  }
  int v12 = -6700;
  uint64_t v7 = (void *)MEMORY[0x230FBC730](v5, 8, &v12);
  v8 = v7;
  if (!v7 || v12)
  {
    if (a4)
    {
      if (!v12)
      {
        id v9 = 0;
        *a4 = 0;
        goto LABEL_11;
      }
      objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", *MEMORY[0x263F08410]);
      id v10 = objc_claimAutoreleasedReturnValue();
      *a4 = v10;
    }
    id v9 = 0;
  }
  else
  {
    id v9 = v7;
  }
LABEL_11:

LABEL_12:
  return v9;
}

+ (BOOL)isStructuredDataCompatible
{
  return 1;
}

+ (Class)valueClass
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  v4 = NSString;
  uint64_t v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return +[HMDOPACKTransformer allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___HMDOPACKTransformer;
    return objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

@end