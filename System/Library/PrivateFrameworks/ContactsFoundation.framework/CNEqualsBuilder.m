@interface CNEqualsBuilder
+ (BOOL)evaluateBuilderBlock:(id)a3 remainingBlocks:(char *)a4;
+ (BOOL)isBool:(BOOL)a3 equalToOther:(BOOL)a4;
+ (BOOL)isDouble:(double)a3 equalToOther:(double)a4 withAccuracy:(double)a5;
+ (BOOL)isInteger:(int64_t)a3 equalToOther:(int64_t)a4;
+ (BOOL)isObject:(id)a3 equalToOther:(id)a4;
+ (BOOL)isObject:(id)a3 equalToOther:(id)a4 withBlocks:(id)a5;
+ (BOOL)isObject:(id)a3 kindOfClass:(Class)a4 andEqualToObject:(id)a5 withBlocks:(id)a6;
+ (BOOL)isObject:(id)a3 memberOfClass:(Class)a4 andEqualToObject:(id)a5 withBlocks:(id)a6;
+ (BOOL)isObject:(id)a3 memberOfSameClassAndEqualTo:(id)a4 withBlocks:(id)a5;
+ (BOOL)isString:(id)a3 localizedCaseInsensitiveEqualToOther:(id)a4;
@end

@implementation CNEqualsBuilder

+ (BOOL)isObject:(id)a3 equalToOther:(id)a4
{
  if ((unint64_t)a3 | (unint64_t)a4) {
    return [a3 isEqual:a4];
  }
  else {
    return 1;
  }
}

+ (BOOL)isObject:(id)a3 kindOfClass:(Class)a4 andEqualToObject:(id)a5 withBlocks:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  if (v10 == v9)
  {
    char v12 = 1;
  }
  else if (objc_opt_isKindOfClass())
  {
    char v12 = [a1 evaluateBuilderBlock:v11 remainingBlocks:&v14];
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

+ (BOOL)evaluateBuilderBlock:(id)a3 remainingBlocks:(char *)a4
{
  id v5 = a3;
  v13 = a4;
  v6 = (uint64_t (**)(void))_Block_copy(v5);
  if (v6)
  {
    v7 = v6;
    do
    {
      v8 = v7;
      int v9 = v7[2](v7);
      id v10 = (const void **)v13;
      v13 += 8;
      v7 = (uint64_t (**)(void))_Block_copy(*v10);

      if (v9) {
        BOOL v11 = v7 == 0;
      }
      else {
        BOOL v11 = 1;
      }
    }
    while (!v11);
  }
  else
  {
    LOBYTE(v9) = 1;
  }

  return v9;
}

+ (BOOL)isObject:(id)a3 memberOfSameClassAndEqualTo:(id)a4 withBlocks:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9 == v8)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v11 = [a1 evaluateBuilderBlock:v10 remainingBlocks:&v13];
    }
    else {
      char v11 = 0;
    }
  }

  return v11;
}

+ (BOOL)isObject:(id)a3 equalToOther:(id)a4 withBlocks:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 == v9)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v11 = [a1 evaluateBuilderBlock:v10 remainingBlocks:&v13];
    }
    else {
      char v11 = 0;
    }
  }

  return v11;
}

+ (BOOL)isObject:(id)a3 memberOfClass:(Class)a4 andEqualToObject:(id)a5 withBlocks:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (v11 == v10)
  {
    char v13 = 1;
  }
  else if ([v10 isMemberOfClass:a4])
  {
    char v13 = [a1 evaluateBuilderBlock:v12 remainingBlocks:&v15];
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

+ (BOOL)isString:(id)a3 localizedCaseInsensitiveEqualToOther:(id)a4
{
  if (a3) {
    v4 = (__CFString *)a3;
  }
  else {
    v4 = &stru_1EE0267A8;
  }
  if (a4) {
    id v5 = (__CFString *)a4;
  }
  else {
    id v5 = &stru_1EE0267A8;
  }
  return [(__CFString *)v4 localizedCaseInsensitiveCompare:v5] == 0;
}

+ (BOOL)isBool:(BOOL)a3 equalToOther:(BOOL)a4
{
  return a3 ^ a4 ^ 1;
}

+ (BOOL)isInteger:(int64_t)a3 equalToOther:(int64_t)a4
{
  return a3 == a4;
}

+ (BOOL)isDouble:(double)a3 equalToOther:(double)a4 withAccuracy:(double)a5
{
  return vabdd_f64(a3, a4) < fabs(a5);
}

@end