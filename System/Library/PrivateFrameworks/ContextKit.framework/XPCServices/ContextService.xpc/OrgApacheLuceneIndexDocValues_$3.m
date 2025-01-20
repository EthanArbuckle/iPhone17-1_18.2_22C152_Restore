@interface OrgApacheLuceneIndexDocValues_$3
- (OrgApacheLuceneIndexDocValues_$3)initWithOrgApacheLuceneUtilBytesRef:(id)a3;
- (id)lookupOrdWithInt:(int)a3;
- (int)getOrdWithInt:(int)a3;
- (int)getValueCount;
- (void)dealloc;
@end

@implementation OrgApacheLuceneIndexDocValues_$3

- (int)getOrdWithInt:(int)a3
{
  return -1;
}

- (id)lookupOrdWithInt:(int)a3
{
  return self->val$empty_;
}

- (int)getValueCount
{
  return 0;
}

- (OrgApacheLuceneIndexDocValues_$3)initWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  JreStrongAssign((id *)&self->val$empty_, a3);
  OrgApacheLuceneIndexSortedDocValues_init((uint64_t)self, v4);
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexDocValues__3;
  [(OrgApacheLuceneIndexSortedDocValues *)&v3 dealloc];
}

@end