@interface HMDIdentityTransformer
+ (Class)transformedValueClass;
+ (Class)valueClass;
+ (id)reverseTransformedValue:(id)a3 error:(id *)a4;
+ (id)transformedValue:(id)a3 error:(id *)a4;
- (id)reverseTransformedValue:(id)a3 error:(id *)a4;
- (id)transformedValue:(id)a3 error:(id *)a4;
@end

@implementation HMDIdentityTransformer

+ (id)reverseTransformedValue:(id)a3 error:(id *)a4
{
  id v4 = a3;
  return v4;
}

+ (id)transformedValue:(id)a3 error:(id *)a4
{
  id v4 = a3;
  return v4;
}

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (id)reverseTransformedValue:(id)a3 error:(id *)a4
{
  id v4 = a3;
  return v4;
}

- (id)transformedValue:(id)a3 error:(id *)a4
{
  id v4 = a3;
  return v4;
}

@end