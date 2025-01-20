@interface CNContainerExternalModificationTagDescription
- (BOOL)isWritable;
- (Class)valueClass;
- (id)CNValueForContainer:(id)a3;
- (id)key;
- (int)abPropertyID;
- (void)setCNValue:(id)a3 onContainer:(id)a4;
@end

@implementation CNContainerExternalModificationTagDescription

- (id)key
{
  return @"externalModificationTag";
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
  return (id)[a3 externalModificationTag];
}

- (void)setCNValue:(id)a3 onContainer:(id)a4
{
}

- (int)abPropertyID
{
  return *MEMORY[0x1E4F49E18];
}

@end