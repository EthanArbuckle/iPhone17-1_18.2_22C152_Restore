@interface OrgApacheLuceneIndexMultiDocValues_OrdinalMap_$2
- (OrgApacheLuceneIndexMultiDocValues_OrdinalMap_$2)initWithOrgApacheLuceneUtilPackedPackedLongValues:(id)a3;
- (int64_t)getWithLong:(int64_t)a3;
- (void)dealloc;
@end

@implementation OrgApacheLuceneIndexMultiDocValues_OrdinalMap_$2

- (int64_t)getWithLong:(int64_t)a3
{
  v3 = self->val$deltas_;
  if (!v3) {
    JreThrowNullPointerException();
  }
  return -[OrgApacheLuceneUtilPackedPackedLongValues getWithLong:](v3, "getWithLong:") + a3;
}

- (OrgApacheLuceneIndexMultiDocValues_OrdinalMap_$2)initWithOrgApacheLuceneUtilPackedPackedLongValues:(id)a3
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexMultiDocValues_OrdinalMap__2;
  [(OrgApacheLuceneIndexMultiDocValues_OrdinalMap_$2 *)&v3 dealloc];
}

@end