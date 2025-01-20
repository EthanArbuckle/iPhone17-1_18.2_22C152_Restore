@interface NSKeyedUnarchiver(ARAdditions)
+ (id)ar_unarchivedObjectOfClass:()ARAdditions fromData:error:;
+ (id)ar_unarchivedObjectOfClasses:()ARAdditions fromData:error:;
@end

@implementation NSKeyedUnarchiver(ARAdditions)

+ (id)ar_unarchivedObjectOfClasses:()ARAdditions fromData:error:
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void *)[[a1 alloc] initForReadingFromData:v9 error:a5];
  v11 = v10;
  if (v10)
  {
    [v10 setRequiresSecureCoding:1];
    [v11 setDecodingFailurePolicy:0];
    v12 = [v11 decodeTopLevelObjectOfClasses:v8 forKey:*MEMORY[0x1E4F284E8] error:a5];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)ar_unarchivedObjectOfClass:()ARAdditions fromData:error:
{
  id v8 = a4;
  id v9 = [MEMORY[0x1E4F1CAD0] setWithObject:a3];
  v10 = objc_msgSend(a1, "ar_unarchivedObjectOfClasses:fromData:error:", v9, v8, a5);

  return v10;
}

@end