@interface CNContainerIdentifierDescription
- (BOOL)isNonnull;
- (Class)valueClass;
- (id)CNValueForContainer:(id)a3;
- (id)CNValueFromABValue:(void *)a3;
- (id)key;
- (int)abPropertyID;
- (void)ABValueFromCNValue:(id)a3;
- (void)setCNValue:(id)a3 onContainer:(id)a4;
@end

@implementation CNContainerIdentifierDescription

- (id)key
{
  return @"identifier";
}

- (BOOL)isNonnull
{
  return 1;
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (id)CNValueForContainer:(id)a3
{
  return (id)[a3 identifier];
}

- (void)setCNValue:(id)a3 onContainer:(id)a4
{
}

- (int)abPropertyID
{
  return *MEMORY[0x1E4F49E28];
}

- (void)ABValueFromCNValue:(id)a3
{
  return a3;
}

- (id)CNValueFromABValue:(void *)a3
{
  v3 = (objc_class *)NSString;
  v4 = a3;
  v5 = (void *)[[v3 alloc] initWithString:v4];

  return v5;
}

@end