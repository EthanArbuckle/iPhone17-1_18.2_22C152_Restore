@interface CRKASMHasher
+ (unint64_t)asmHashForString:(id)a3 maximumExclusive:(unint64_t)a4;
@end

@implementation CRKASMHasher

+ (unint64_t)asmHashForString:(id)a3 maximumExclusive:(unint64_t)a4
{
  id v5 = a3;
  if ([v5 length])
  {
    uint64_t v13 = 0;
    v6 = (unsigned __int8 *)malloc_type_malloc(2 * [v5 length], 0x9BF64D54uLL);
    unint64_t v7 = 0;
    if (objc_msgSend(v5, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v6, 2 * objc_msgSend(v5, "length"), &v13, 4, 1, 0, objc_msgSend(v5, "length"), 0))
    {
      uint64_t v8 = v13;
      if (v13)
      {
        LODWORD(v9) = 0;
        v10 = v6;
        do
        {
          int v11 = *v10++;
          unint64_t v9 = (v11 - v9 + 32 * v9);
          --v8;
        }
        while (v8);
      }
      else
      {
        unint64_t v9 = 0;
      }
      unint64_t v7 = v9 % a4;
    }
    free(v6);
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

@end