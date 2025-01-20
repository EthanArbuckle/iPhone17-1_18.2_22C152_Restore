@interface NSKeyedUnarchiver(ETAdditions)
+ (id)_et_secureUnarchiveObjectOfClass:()ETAdditions withData:;
+ (id)_et_secureUnarchiveObjectOfClasses:()ETAdditions withData:;
@end

@implementation NSKeyedUnarchiver(ETAdditions)

+ (id)_et_secureUnarchiveObjectOfClasses:()ETAdditions withData:
{
  v5 = (objc_class *)MEMORY[0x263F08928];
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[[v5 alloc] initForReadingFromData:v6 error:0];

  v9 = [v8 decodeObjectOfClasses:v7 forKey:@"root"];

  return v9;
}

+ (id)_et_secureUnarchiveObjectOfClass:()ETAdditions withData:
{
  v5 = (void *)MEMORY[0x263F08928];
  id v6 = (void *)MEMORY[0x263EFFA08];
  id v7 = a4;
  v8 = [v6 setWithObject:a3];
  v9 = objc_msgSend(v5, "_et_secureUnarchiveObjectOfClasses:withData:", v8, v7);

  return v9;
}

@end