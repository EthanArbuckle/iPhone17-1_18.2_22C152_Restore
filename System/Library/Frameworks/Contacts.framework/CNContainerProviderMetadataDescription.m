@interface CNContainerProviderMetadataDescription
- (BOOL)isWritable;
- (Class)valueClass;
- (id)CNValueForContainer:(id)a3;
- (id)CNValueFromABValue:(void *)a3;
- (id)key;
- (int)abPropertyID;
- (void)ABValueFromCNValue:(id)a3;
- (void)setCNValue:(id)a3 onContainer:(id)a4;
@end

@implementation CNContainerProviderMetadataDescription

- (id)key
{
  return @"providerMetadata";
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
  return (id)[a3 providerMetadata];
}

- (void)setCNValue:(id)a3 onContainer:(id)a4
{
}

- (int)abPropertyID
{
  return *MEMORY[0x1E4F49E50];
}

- (void)ABValueFromCNValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  v7 = [v6 dataRepresentation];

  return v7;
}

- (id)CNValueFromABValue:(void *)a3
{
  id v3 = (CNProviderMetadata *)a3;
  if (a3)
  {
    CFTypeID v4 = CFGetTypeID(a3);
    if (v4 == CFDataGetTypeID())
    {
      v5 = v3;
      id v3 = [[CNProviderMetadata alloc] initWithDataRepresentation:v5];
    }
    else
    {
      id v3 = 0;
    }
  }

  return v3;
}

@end