@interface NSKeyedUnarchiver(Intents)
+ (id)_in_safeUnarchivedObjectOfClass:()Intents fromData:error:;
+ (id)_in_safeUnarchivedObjectOfClasses:()Intents fromData:error:;
@end

@implementation NSKeyedUnarchiver(Intents)

+ (id)_in_safeUnarchivedObjectOfClasses:()Intents fromData:error:
{
  v7 = (objc_class *)MEMORY[0x1E4F28DC0];
  id v8 = a4;
  id v9 = a3;
  v10 = (void *)[[v7 alloc] initForReadingFromData:v8 error:a5];

  [v10 _allowDecodingCyclesInSecureMode];
  v11 = [v10 decodeObjectOfClasses:v9 forKey:*MEMORY[0x1E4F284E8]];

  [v10 finishDecoding];

  return v11;
}

+ (id)_in_safeUnarchivedObjectOfClass:()Intents fromData:error:
{
  v7 = (objc_class *)MEMORY[0x1E4F28DC0];
  id v8 = a4;
  id v9 = (void *)[[v7 alloc] initForReadingFromData:v8 error:a5];

  [v9 _allowDecodingCyclesInSecureMode];
  v10 = [v9 decodeObjectOfClass:a3 forKey:*MEMORY[0x1E4F284E8]];
  [v9 finishDecoding];

  return v10;
}

@end