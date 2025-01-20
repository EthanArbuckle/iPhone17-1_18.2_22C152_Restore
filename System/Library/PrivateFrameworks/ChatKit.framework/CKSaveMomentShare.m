@interface CKSaveMomentShare
@end

@implementation CKSaveMomentShare

void ___CKSaveMomentShare_block_invoke(void *a1, long long *a2)
{
  v4 = (void *)a1[4];
  long long v5 = a2[1];
  long long v11 = *a2;
  long long v12 = v5;
  v6 = [v4 assetAtItemIndexPath:&v11];
  v7 = (void *)a1[5];
  v8 = [v6 uuid];
  LODWORD(v7) = [v7 containsObject:v8];

  if (v7)
  {
    v9 = (void *)a1[6];
    long long v10 = a2[1];
    long long v11 = *a2;
    long long v12 = v10;
    [v9 addIndexPath:&v11];
  }
}

uint64_t ___CKSaveMomentShare_block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setSelectedIndexPaths:*(void *)(a1 + 32)];
}

uint64_t ___CKSaveMomentShare_block_invoke_79(uint64_t a1, void *a2)
{
  return [a2 selectAllItems];
}

@end