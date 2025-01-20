@interface NSObject(PrintDebugging)
- (id)_gkDescription;
- (id)_gkDescriptionWithChildren:()PrintDebugging;
- (uint64_t)_gkRecursiveDescription;
@end

@implementation NSObject(PrintDebugging)

- (id)_gkDescription
{
  v1 = NSString;
  v2 = [a1 description];
  v3 = [v1 stringWithFormat:@"%@\n", v2];

  return v3;
}

- (id)_gkDescriptionWithChildren:()PrintDebugging
{
  v5 = [MEMORY[0x1E4F28E78] string];
  v6 = _gkTabStringForTabLevel(a3);
  v7 = [a1 _gkDescription];
  [v5 appendFormat:@"%@%@", v6, v7];

  return v5;
}

- (uint64_t)_gkRecursiveDescription
{
  return [a1 _gkDescriptionWithChildren:0];
}

@end