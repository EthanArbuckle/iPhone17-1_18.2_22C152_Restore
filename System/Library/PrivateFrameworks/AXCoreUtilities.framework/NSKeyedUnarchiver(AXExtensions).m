@interface NSKeyedUnarchiver(AXExtensions)
+ (id)secureUnarchiveData:()AXExtensions withExpectedClass:otherAllowedClasses:;
@end

@implementation NSKeyedUnarchiver(AXExtensions)

+ (id)secureUnarchiveData:()AXExtensions withExpectedClass:otherAllowedClasses:
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v16 = 0;
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v7 error:&v16];
    v10 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", a4, 0);
    v11 = v10;
    if (v8)
    {
      uint64_t v12 = [v10 setByAddingObjectsFromSet:v8];

      v11 = (void *)v12;
    }
    v13 = [v9 decodeObjectOfClasses:v11 forKey:*MEMORY[0x1E4F284E8]];
    v14 = __UIAccessibilityCastAsClass(a4, v13, 1, 0);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end