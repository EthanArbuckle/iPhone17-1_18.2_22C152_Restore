@interface INIntentSpeedSlotValueTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)_intents_resolutionResultClass;
+ (Class)reverseTransformedValueClass;
+ (Class)transformedValueClass;
+ (int64_t)_intents_valueType;
- (id)reverseTransformedValue:(id)a3;
- (id)transformedValue:(id)a3;
@end

@implementation INIntentSpeedSlotValueTransformer

+ (Class)_intents_resolutionResultClass
{
  return (Class)objc_opt_class();
}

+ (int64_t)_intents_valueType
{
  return 40;
}

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
  return (Class)objc_opt_class();
}

- (id)reverseTransformedValue:(id)a3
{
  id v3 = a3;
  [(id)objc_opt_class() reverseTransformedValueClass];
  if (objc_opt_isKindOfClass())
  {
    v4 = INIntentSlotValueTransformFromSpeed(v3);
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
    v4 = INIntentSlotValueTransformToSpeed(v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end