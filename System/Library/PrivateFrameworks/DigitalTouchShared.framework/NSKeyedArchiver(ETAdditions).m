@interface NSKeyedArchiver(ETAdditions)
+ (id)_et_secureArchivedDataWithRootObject:()ETAdditions;
@end

@implementation NSKeyedArchiver(ETAdditions)

+ (id)_et_secureArchivedDataWithRootObject:()ETAdditions
{
  v3 = (objc_class *)MEMORY[0x263F08910];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initRequiringSecureCoding:1];
  [v5 encodeObject:v4 forKey:@"root"];

  v6 = [v5 encodedData];

  return v6;
}

@end