@interface NSKeyedUnarchiver(HMFoundation)
+ (id)hmf_unarchivedObjectOfClass:()HMFoundation fromClassName:fromData:error:;
@end

@implementation NSKeyedUnarchiver(HMFoundation)

+ (id)hmf_unarchivedObjectOfClass:()HMFoundation fromClassName:fromData:error:
{
  id v9 = a4;
  v10 = (objc_class *)MEMORY[0x1E4F28DC0];
  id v11 = a5;
  v12 = (void *)[[v10 alloc] initForReadingFromData:v11 error:a6];

  if (v12)
  {
    [v12 setDecodingFailurePolicy:1];
    if (v9) {
      [v12 setClass:a3 forClassName:v9];
    }
    v13 = [v12 decodeTopLevelObjectOfClass:a3 forKey:*MEMORY[0x1E4F284E8] error:a6];
    [v12 finishDecoding];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end