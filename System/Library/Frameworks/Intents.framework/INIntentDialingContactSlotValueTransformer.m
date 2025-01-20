@interface INIntentDialingContactSlotValueTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)reverseTransformedValueClass;
+ (Class)transformedValueClass;
+ (int64_t)_intents_valueType;
- (id)reverseTransformedValue:(id)a3;
- (id)transformedValue:(id)a3;
@end

@implementation INIntentDialingContactSlotValueTransformer

+ (int64_t)_intents_valueType
{
  return 18;
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
    v4 = INIntentSlotValueTransformFromDialingContact(v3);
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
    v4 = INIntentSlotValueTransformToDialingContact(v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end