@interface OrgApacheLuceneIndexSortedDocValues
- (OrgApacheLuceneIndexSortedDocValues)init;
- (id)getWithInt:(int)a3;
- (id)termsEnum;
- (int)lookupTermWithOrgApacheLuceneUtilBytesRef:(id)a3;
- (void)dealloc;
@end

@implementation OrgApacheLuceneIndexSortedDocValues

- (OrgApacheLuceneIndexSortedDocValues)init
{
  OrgApacheLuceneIndexBinaryDocValues_init(self, a2);
  v3 = new_OrgApacheLuceneUtilBytesRef_init();
  JreStrongAssignAndConsume((id *)&self->empty_, v3);
  return self;
}

- (id)getWithInt:(int)a3
{
  id v4 = [(OrgApacheLuceneIndexSortedDocValues *)self getOrdWithInt:*(void *)&a3];
  if (v4 == -1) {
    return self->empty_;
  }
  return [(OrgApacheLuceneIndexSortedDocValues *)self lookupOrdWithInt:v4];
}

- (int)lookupTermWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  signed int v5 = 0;
  signed int v6 = [(OrgApacheLuceneIndexSortedDocValues *)self getValueCount] - 1;
  if (v6 >= 0)
  {
    do
    {
      unsigned int v7 = (v6 + v5) >> 1;
      id v8 = [(OrgApacheLuceneIndexSortedDocValues *)self lookupOrdWithInt:v7];
      if (!v8) {
        JreThrowNullPointerException();
      }
      unsigned int v9 = [v8 compareToWithId:a3];
      if ((v9 & 0x80000000) != 0)
      {
        signed int v5 = v7 + 1;
      }
      else
      {
        if (!v9) {
          return v7;
        }
        signed int v6 = v7 - 1;
      }
    }
    while (v5 <= v6);
  }
  return ~v5;
}

- (id)termsEnum
{
  v2 = new_OrgApacheLuceneIndexSortedDocValuesTermsEnum_initWithOrgApacheLuceneIndexSortedDocValues_(self);
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexSortedDocValues;
  [(OrgApacheLuceneIndexSortedDocValues *)&v3 dealloc];
}

@end