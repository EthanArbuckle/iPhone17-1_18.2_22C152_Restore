@interface NSIndexSet(CoreDuetConvencience)
- (id)_cd_commaSeparatedIndexes;
@end

@implementation NSIndexSet(CoreDuetConvencience)

- (id)_cd_commaSeparatedIndexes
{
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  char v9 = 1;
  v2 = objc_opt_new();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__NSIndexSet_CoreDuetConvencience___cd_commaSeparatedIndexes__block_invoke;
  v5[3] = &unk_1E560D438;
  v7 = v8;
  id v3 = v2;
  id v6 = v3;
  [a1 enumerateIndexesUsingBlock:v5];

  _Block_object_dispose(v8, 8);
  return v3;
}

@end