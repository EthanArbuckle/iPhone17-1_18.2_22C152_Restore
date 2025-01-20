@interface VSSubscriptionAvailabilityTypeJSONValueTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
- (id)reverseTransformedValue:(id)a3;
- (id)transformedValue:(id)a3;
@end

@implementation VSSubscriptionAvailabilityTypeJSONValueTransformer

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
  uint64_t v3 = [a3 integerValue];
  v4 = @"Account";
  if (v3 != 1) {
    v4 = 0;
  }
  if (v3 == 2) {
    return @"Subscription";
  }
  else {
    return v4;
  }
}

- (id)reverseTransformedValue:(id)a3
{
  id v3 = a3;
  if ([v3 isEqual:@"Account"])
  {
    uint64_t v4 = 1;
  }
  else if ([v3 isEqual:@"Subscription"])
  {
    uint64_t v4 = 2;
  }
  else
  {
    uint64_t v4 = 0;
  }
  v5 = [NSNumber numberWithInteger:v4];

  return v5;
}

@end