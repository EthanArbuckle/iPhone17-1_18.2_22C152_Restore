@interface HKMedicationsNgramGenerator
+ (id)tokensFrom:(id)a3 minimumLength:(int64_t)a4 maximumLength:(int64_t)a5;
@end

@implementation HKMedicationsNgramGenerator

+ (id)tokensFrom:(id)a3 minimumLength:(int64_t)a4 maximumLength:(int64_t)a5
{
  id v9 = a3;
  if (a5 < a4 || a4 < 1 || a5 <= 0)
  {
    v20 = [MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"HKMedicationsNgramGenerator.m", 22, @"invalid inputs: %ld < %ld", a5, a4);
  }
  v10 = [v9 normalizeForType:1];
  id v11 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  if (a5 >= a4)
  {
    int64_t v12 = 1 - a4;
    do
    {
      int64_t v13 = [v10 length];
      if (v13 >= a4)
      {
        uint64_t v14 = 0;
        int64_t v15 = v13 + v12;
        do
        {
          v16 = objc_msgSend(v10, "substringWithRange:", v14, a4);
          [v11 addObject:v16];

          ++v14;
        }
        while (v15 != v14);
      }
      --v12;
    }
    while (a4++ != a5);
  }
  v18 = [v11 allObjects];

  return v18;
}

@end