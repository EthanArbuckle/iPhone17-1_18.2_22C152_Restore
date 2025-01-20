@interface NSKeyedUnarchiver(CATSecureCoding)
+ (id)cat_unarchiveObjectOfClass:()CATSecureCoding withData:;
+ (id)cat_unarchiveObjectOfClass:()CATSecureCoding withData:error:;
+ (id)cat_unarchiveObjectOfClasses:()CATSecureCoding withData:error:;
+ (id)cat_unarchivePropertyListObjectWithData:()CATSecureCoding error:;
+ (uint64_t)cat_unarchiveObjectOfClasses:()CATSecureCoding withData:;
+ (uint64_t)cat_unarchivePropertyListObjectWithData:()CATSecureCoding;
@end

@implementation NSKeyedUnarchiver(CATSecureCoding)

+ (id)cat_unarchiveObjectOfClass:()CATSecureCoding withData:
{
  id v7 = a4;
  if (!a3)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"NSKeyedUnarchiver+SecureCoding.m", 32, @"Invalid parameter not satisfying: %@", @"aClass" object file lineNumber description];
  }
  v8 = [MEMORY[0x263EFFA08] setWithObject:a3];
  v9 = objc_msgSend(a1, "cat_unarchiveObjectOfClasses:withData:", v8, v7);

  return v9;
}

+ (id)cat_unarchiveObjectOfClass:()CATSecureCoding withData:error:
{
  id v9 = a4;
  if (!a3)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"NSKeyedUnarchiver+SecureCoding.m", 39, @"Invalid parameter not satisfying: %@", @"aClass" object file lineNumber description];
  }
  v10 = [MEMORY[0x263EFFA08] setWithObject:a3];
  v11 = objc_msgSend(a1, "cat_unarchiveObjectOfClasses:withData:error:", v10, v9, a5);

  return v11;
}

+ (uint64_t)cat_unarchiveObjectOfClasses:()CATSecureCoding withData:
{
  return objc_msgSend(a1, "cat_unarchiveObjectOfClasses:withData:error:", a3, a4, 0);
}

+ (id)cat_unarchiveObjectOfClasses:()CATSecureCoding withData:error:
{
  id v9 = a3;
  id v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10)
    {
LABEL_3:
      v12 = [a1 unarchivedObjectOfClasses:v9 fromData:v11 error:a5];
      goto LABEL_6;
    }
  }
  else
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"NSKeyedUnarchiver+SecureCoding.m", 52, @"Invalid parameter not satisfying: %@", @"classes" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  v12 = 0;
LABEL_6:

  return v12;
}

+ (uint64_t)cat_unarchivePropertyListObjectWithData:()CATSecureCoding
{
  return objc_msgSend(a1, "cat_unarchivePropertyListObjectWithData:error:", a3, 0);
}

+ (id)cat_unarchivePropertyListObjectWithData:()CATSecureCoding error:
{
  if (a3)
  {
    id v6 = a3;
    id v7 = (void *)[[a1 alloc] initForReadingFromData:v6 error:a4];

    v8 = [v7 decodePropertyListForKey:*MEMORY[0x263F081D0]];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end