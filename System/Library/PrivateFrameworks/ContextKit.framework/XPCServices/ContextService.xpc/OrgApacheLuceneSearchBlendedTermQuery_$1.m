@interface OrgApacheLuceneSearchBlendedTermQuery_$1
- (id)rewriteWithOrgApacheLuceneSearchQueryArray:(id)a3;
@end

@implementation OrgApacheLuceneSearchBlendedTermQuery_$1

- (id)rewriteWithOrgApacheLuceneSearchQueryArray:(id)a3
{
  v4 = new_OrgApacheLuceneSearchBooleanQuery_Builder_init();
  [(OrgApacheLuceneSearchBooleanQuery_Builder *)v4 setDisableCoordWithBoolean:1];
  if (!a3) {
    JreThrowNullPointerException();
  }
  v5 = (uint64_t *)((char *)a3 + 24);
  v6 = (char *)a3 + 8 * *((int *)a3 + 2) + 24;
  if ((char *)a3 + 24 < v6)
  {
    do
    {
      uint64_t v8 = *v5++;
      uint64_t v7 = v8;
      if ((atomic_load_explicit(OrgApacheLuceneSearchBooleanClause_OccurEnum__initialized, memory_order_acquire) & 1) == 0) {
        objc_opt_class();
      }
      [(OrgApacheLuceneSearchBooleanQuery_Builder *)v4 addWithOrgApacheLuceneSearchQuery:v7 withOrgApacheLuceneSearchBooleanClause_OccurEnum:qword_100563A28];
    }
    while (v5 < (uint64_t *)v6);
  }
  return [(OrgApacheLuceneSearchBooleanQuery_Builder *)v4 build];
}

@end