@interface _CDDataCollectionUtilities
+ (id)randomDataWithLength:(unint64_t)a3;
@end

@implementation _CDDataCollectionUtilities

+ (id)randomDataWithLength:(unint64_t)a3
{
  v4 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithLength:");
  v5 = (const __SecRandom *)*MEMORY[0x1E4F3BC60];
  id v6 = v4;
  if (SecRandomCopyBytes(v5, a3, (void *)[v6 mutableBytes]))
  {
    v7 = 0;
  }
  else
  {
    v7 = [MEMORY[0x1E4F1C9B8] dataWithData:v6];
  }

  return v7;
}

@end