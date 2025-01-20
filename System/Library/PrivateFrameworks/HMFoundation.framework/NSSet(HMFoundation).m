@interface NSSet(HMFoundation)
+ (NSString)shortDescription;
- (BOOL)hmf_isEmpty;
- (id)privateDescription;
- (id)shortDescription;
- (void)hmf_enumerateWithAutoreleasePoolUsingBlock:()HMFoundation;
@end

@implementation NSSet(HMFoundation)

- (id)privateDescription
{
  v1 = [a1 allObjects];
  v2 = [v1 privateDescription];

  return v2;
}

- (id)shortDescription
{
  v1 = [a1 allObjects];
  v2 = [v1 shortDescription];

  return v2;
}

- (BOOL)hmf_isEmpty
{
  return [a1 count] == 0;
}

- (void)hmf_enumerateWithAutoreleasePoolUsingBlock:()HMFoundation
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__NSSet_HMFoundation__hmf_enumerateWithAutoreleasePoolUsingBlock___block_invoke;
  v6[3] = &unk_1E5958850;
  id v7 = v4;
  id v5 = v4;
  [a1 enumerateObjectsUsingBlock:v6];
}

+ (NSString)shortDescription
{
  v0 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v0);
}

@end