@interface OrgApacheLuceneIndexMultiDocValues_OrdinalMap_$1
- (OrgApacheLuceneIndexMultiDocValues_OrdinalMap_$1)initWithOrgApacheLuceneUtilPackedPackedInts_Mutable:(id)a3;
- (int64_t)getWithLong:(int64_t)a3;
- (void)dealloc;
@end

@implementation OrgApacheLuceneIndexMultiDocValues_OrdinalMap_$1

- (int64_t)getWithLong:(int64_t)a3
{
  v3 = self->val$newDeltas_;
  if (!v3) {
    JreThrowNullPointerException();
  }
  return (int64_t)-[OrgApacheLuceneUtilPackedPackedInts_Mutable getWithInt:](v3, "getWithInt:") + a3;
}

- (OrgApacheLuceneIndexMultiDocValues_OrdinalMap_$1)initWithOrgApacheLuceneUtilPackedPackedInts_Mutable:(id)a3
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexMultiDocValues_OrdinalMap__1;
  [(OrgApacheLuceneIndexMultiDocValues_OrdinalMap_$1 *)&v3 dealloc];
}

@end