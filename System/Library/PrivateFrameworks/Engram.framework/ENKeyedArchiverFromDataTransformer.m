@interface ENKeyedArchiverFromDataTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
- (id)reverseTransformedValue:(id)a3;
- (id)transformedValue:(id)a3;
@end

@implementation ENKeyedArchiverFromDataTransformer

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
  if (a3)
  {
    v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:0 error:0];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)reverseTransformedValue:(id)a3
{
  return 0;
}

@end