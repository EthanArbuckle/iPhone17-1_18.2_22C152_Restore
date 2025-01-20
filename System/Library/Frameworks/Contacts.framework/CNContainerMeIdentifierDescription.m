@interface CNContainerMeIdentifierDescription
- (BOOL)isWritable;
- (Class)valueClass;
- (id)CNValueForContainer:(id)a3;
- (id)CNValueFromABValue:(void *)a3;
- (id)key;
- (int)abPropertyID;
- (void)ABValueFromCNValue:(id)a3;
- (void)setCNValue:(id)a3 onContainer:(id)a4;
@end

@implementation CNContainerMeIdentifierDescription

- (id)key
{
  return @"meIdentifier";
}

- (BOOL)isWritable
{
  return 1;
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (id)CNValueForContainer:(id)a3
{
  return (id)[a3 meIdentifier];
}

- (void)setCNValue:(id)a3 onContainer:(id)a4
{
}

- (int)abPropertyID
{
  return *MEMORY[0x1E4F49E38];
}

- (void)ABValueFromCNValue:(id)a3
{
  uint64_t v3 = [a3 intValue];
  v4 = (const void *)[NSNumber numberWithInt:v3];
  if (!v4) {
    return 0;
  }
  CFTypeRef v5 = CFRetain(v4);
  if (!v5) {
    return 0;
  }

  return (void *)CFAutorelease(v5);
}

- (id)CNValueFromABValue:(void *)a3
{
  return (id)[a3 stringValue];
}

@end