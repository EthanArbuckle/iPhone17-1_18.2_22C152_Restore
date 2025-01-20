@interface NSError(HMFoundation)
+ (NSString)shortDescription;
+ (id)hmf_unarchiveFromData:()HMFoundation error:;
- (id)shortDescription;
@end

@implementation NSError(HMFoundation)

- (id)shortDescription
{
  v2 = NSString;
  v3 = [a1 domain];
  uint64_t v4 = [a1 code];
  v5 = [a1 localizedDescription];
  v6 = [v2 stringWithFormat:@"Error Domain=%@ Code=%ld \"%@\"", v3, v4, v5];

  return v6;
}

+ (id)hmf_unarchiveFromData:()HMFoundation error:
{
  v5 = (void *)MEMORY[0x1E4F28DC0];
  id v6 = a3;
  v7 = [v5 unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:a4];

  return v7;
}

+ (NSString)shortDescription
{
  v0 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v0);
}

@end