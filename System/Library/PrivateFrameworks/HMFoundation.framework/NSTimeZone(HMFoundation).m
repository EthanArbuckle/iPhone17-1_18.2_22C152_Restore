@interface NSTimeZone(HMFoundation)
+ (id)hmf_unarchiveFromData:()HMFoundation error:;
@end

@implementation NSTimeZone(HMFoundation)

+ (id)hmf_unarchiveFromData:()HMFoundation error:
{
  v5 = (void *)MEMORY[0x1E4F28DC0];
  id v6 = a3;
  v7 = [v5 unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:a4];

  return v7;
}

@end