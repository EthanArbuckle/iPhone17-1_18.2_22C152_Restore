@interface NSError(FamilyCircle)
+ (id)fa_familyErrorWithCode:()FamilyCircle exception:;
+ (id)fa_familyErrorWithCode:()FamilyCircle underlyingError:;
+ (uint64_t)fa_familyErrorWithCode:()FamilyCircle;
+ (uint64_t)fa_familyErrorWithCode:()FamilyCircle userInfo:;
@end

@implementation NSError(FamilyCircle)

+ (uint64_t)fa_familyErrorWithCode:()FamilyCircle
{
  return objc_msgSend(a1, "fa_familyErrorWithCode:userInfo:", a3, 0);
}

+ (uint64_t)fa_familyErrorWithCode:()FamilyCircle userInfo:
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.family.error" code:a3 userInfo:a4];
}

+ (id)fa_familyErrorWithCode:()FamilyCircle underlyingError:
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = v5;
  if (v5)
  {
    uint64_t v10 = *MEMORY[0x1E4F28A50];
    v11[0] = v5;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  }
  else
  {
    v7 = 0;
  }
  v8 = objc_msgSend(MEMORY[0x1E4F28C58], "fa_familyErrorWithCode:userInfo:", a3, v7);

  return v8;
}

+ (id)fa_familyErrorWithCode:()FamilyCircle exception:
{
  id v5 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v6 = a4;
  id v7 = objc_alloc_init(v5);
  v8 = [v6 reason];

  [v7 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F28568]];
  v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.family.error" code:a3 userInfo:v7];

  return v9;
}

@end