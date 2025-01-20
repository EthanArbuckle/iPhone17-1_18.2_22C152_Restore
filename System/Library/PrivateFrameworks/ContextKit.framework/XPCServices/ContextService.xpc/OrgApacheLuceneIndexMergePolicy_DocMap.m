@interface OrgApacheLuceneIndexMergePolicy_DocMap
- (BOOL)isConsistentWithInt:(int)a3;
@end

@implementation OrgApacheLuceneIndexMergePolicy_DocMap

- (BOOL)isConsistentWithInt:(int)a3
{
  v5 = new_OrgApacheLuceneUtilFixedBitSet_initWithInt_(a3);
  if (a3 < 1)
  {
    return 1;
  }
  else
  {
    v6 = v5;
    v7 = [(OrgApacheLuceneIndexMergePolicy_DocMap *)self mapWithInt:0];
    BOOL v8 = 0;
    if ((v7 & 0x80000000) == 0)
    {
      v9 = v7;
      if ((int)v7 < a3)
      {
        BOOL v8 = 0;
        uint64_t v10 = 1;
        do
        {
          if ([(OrgApacheLuceneUtilFixedBitSet *)v6 getWithInt:v9]) {
            break;
          }
          BOOL v8 = (int)v10 >= a3;
          if (a3 == v10) {
            break;
          }
          v11 = [(OrgApacheLuceneIndexMergePolicy_DocMap *)self mapWithInt:v10];
          if ((v11 & 0x80000000) != 0) {
            break;
          }
          v9 = v11;
          uint64_t v10 = (v10 + 1);
        }
        while ((int)v11 < a3);
      }
    }
  }
  return v8;
}

@end