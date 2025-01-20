@interface VSSubscriptionSourceKindPropertyListValueTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
- (id)reverseTransformedValue:(id)a3;
- (id)transformedValue:(id)a3;
@end

@implementation VSSubscriptionSourceKindPropertyListValueTransformer

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
  v4 = @"PSSSIdentifierTypeURL";
  if (v3 != 1) {
    v4 = 0;
  }
  if (v3) {
    return v4;
  }
  else {
    return @"PSSSIdentifierTypeBundle";
  }
}

- (id)reverseTransformedValue:(id)a3
{
  id v3 = a3;
  if ([v3 isEqual:@"PSSSIdentifierTypeBundle"])
  {
    v4 = &unk_1F34D0E50;
  }
  else if ([v3 isEqual:@"PSSSIdentifierTypeURL"])
  {
    v4 = &unk_1F34D0E68;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end