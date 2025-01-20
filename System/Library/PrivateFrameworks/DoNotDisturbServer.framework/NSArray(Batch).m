@interface NSArray(Batch)
- (void)enumerateBatchesOfSize:()Batch handler:;
@end

@implementation NSArray(Batch)

- (void)enumerateBatchesOfSize:()Batch handler:
{
  v6 = a4;
  unint64_t v7 = [a1 count];
  unint64_t v8 = 0;
  unsigned __int8 v15 = 0;
  v14 = v6 + 16;
  do
  {
    v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", v14);
    unint64_t v10 = v8 * a3;
    if (v8 * a3 + a3 >= v7) {
      unint64_t v11 = v7;
    }
    else {
      unint64_t v11 = v8 * a3 + a3;
    }
    while (v10 < v11)
    {
      v12 = [a1 objectAtIndexedSubscript:v10];
      [v9 addObject:v12];

      ++v10;
    }
    if ([v9 count]) {
      (*((void (**)(char *, void *, unsigned __int8 *))v6 + 2))(v6, v9, &v15);
    }
    int v13 = v15;

    if (v13) {
      break;
    }
    ++v8;
  }
  while (v8 <= v7 / a3);
}

@end