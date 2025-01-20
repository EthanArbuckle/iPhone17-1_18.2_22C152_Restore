@interface INIntentWellnessUnitTypeSlotValueTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)reverseTransformedValueClass;
+ (Class)transformedValueClass;
- (id)reverseTransformedValue:(id)a3;
- (id)transformedValue:(id)a3;
@end

@implementation INIntentWellnessUnitTypeSlotValueTransformer

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

+ (Class)reverseTransformedValueClass
{
  return (Class)objc_opt_class();
}

+ (Class)transformedValueClass
{
  getHKUnitClass_95404();

  return (Class)objc_opt_class();
}

- (id)reverseTransformedValue:(id)a3
{
  id v3 = a3;
  [(id)objc_opt_class() reverseTransformedValueClass];
  if (objc_opt_isKindOfClass())
  {
    v4 = INIntentSlotValueTransformFromWellnessUnitType(v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)transformedValue:(id)a3
{
  id v3 = a3;
  [(id)objc_opt_class() transformedValueClass];
  if (objc_opt_isKindOfClass())
  {
    v4 = INIntentSlotValueTransformToWellnessUnitType(v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end