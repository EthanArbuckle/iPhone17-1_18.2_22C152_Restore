@interface CNContainerNameDescription
- (BOOL)isNonnull;
- (BOOL)isWritable;
- (id)CNValueForContainer:(id)a3;
- (id)key;
- (int)abPropertyID;
- (void)setCNValue:(id)a3 onContainer:(id)a4;
@end

@implementation CNContainerNameDescription

- (id)key
{
  return @"name";
}

- (BOOL)isWritable
{
  return 1;
}

- (BOOL)isNonnull
{
  return 1;
}

- (id)CNValueForContainer:(id)a3
{
  return (id)[a3 name];
}

- (void)setCNValue:(id)a3 onContainer:(id)a4
{
}

- (int)abPropertyID
{
  return *MEMORY[0x1E4F49E40];
}

@end