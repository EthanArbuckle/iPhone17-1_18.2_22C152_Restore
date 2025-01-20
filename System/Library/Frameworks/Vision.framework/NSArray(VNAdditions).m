@interface NSArray(VNAdditions)
- (void)vn_enumerateObjectsAsSubarraysOfCount:()VNAdditions usingBlock:;
@end

@implementation NSArray(VNAdditions)

- (void)vn_enumerateObjectsAsSubarraysOfCount:()VNAdditions usingBlock:
{
  v6 = a4;
  unint64_t v7 = [a1 count];
  if (v7 < a3) {
    a3 = v7;
  }
  if (a3)
  {
    unint64_t v8 = v7;
    unint64_t v9 = 0;
    unsigned __int8 v13 = 0;
    do
    {
      if (a3 + v9 > v8) {
        a3 = v8 - v9;
      }
      v10 = objc_msgSend(a1, "subarrayWithRange:", v9, a3);
      v6[2](v6, v10, v9, a3, &v13);
      int v11 = v13;

      v9 += a3;
      if (v11) {
        BOOL v12 = 1;
      }
      else {
        BOOL v12 = v9 >= v8;
      }
    }
    while (!v12);
  }
}

@end