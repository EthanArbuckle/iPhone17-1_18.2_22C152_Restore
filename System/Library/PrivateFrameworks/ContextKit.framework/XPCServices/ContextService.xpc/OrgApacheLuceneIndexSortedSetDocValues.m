@interface OrgApacheLuceneIndexSortedSetDocValues
- (id)termsEnum;
- (int64_t)lookupTermWithOrgApacheLuceneUtilBytesRef:(id)a3;
@end

@implementation OrgApacheLuceneIndexSortedSetDocValues

- (int64_t)lookupTermWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  int64_t v5 = 0;
  v6 = (char *)[(OrgApacheLuceneIndexSortedSetDocValues *)self getValueCount] - 1;
  if ((uint64_t)v6 >= 0)
  {
    do
    {
      int64_t v7 = (unint64_t)&v6[v5] >> 1;
      id v8 = [(OrgApacheLuceneIndexSortedSetDocValues *)self lookupOrdWithLong:v7];
      if (!v8) {
        JreThrowNullPointerException();
      }
      unsigned int v9 = [v8 compareToWithId:a3];
      if ((v9 & 0x80000000) != 0)
      {
        int64_t v5 = v7 + 1;
      }
      else
      {
        if (!v9) {
          return v7;
        }
        v6 = (char *)(v7 - 1);
      }
    }
    while (v5 <= (uint64_t)v6);
  }
  return ~v5;
}

- (id)termsEnum
{
  v2 = new_OrgApacheLuceneIndexSortedSetDocValuesTermsEnum_initWithOrgApacheLuceneIndexSortedSetDocValues_(self);
  return v2;
}

@end