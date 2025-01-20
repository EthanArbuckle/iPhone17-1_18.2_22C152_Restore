@interface NSKeyedUnarchiver(LaunchServicesAdditions)
+ (id)ls_unarchivedObjectOfClass:()LaunchServicesAdditions fromData:error:;
@end

@implementation NSKeyedUnarchiver(LaunchServicesAdditions)

+ (id)ls_unarchivedObjectOfClass:()LaunchServicesAdditions fromData:error:
{
  v7 = objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
  if (v7)
  {
    v8 = [MEMORY[0x1E4F1CAD0] setWithObject:a3];
    char v9 = _LSIsKindOfClasses(v7, v8);

    if ((v9 & 1) == 0)
    {

      if (a5)
      {
        _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F281F8], 4864, (uint64_t)"+[NSKeyedUnarchiver(LaunchServicesAdditions) ls_unarchivedObjectOfClass:fromData:error:]", 161, 0);
        v7 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = 0;
      }
    }
  }

  return v7;
}

@end