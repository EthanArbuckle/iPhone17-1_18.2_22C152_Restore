@interface OrgApacheLuceneSearchFilteredQuery
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (OrgApacheLuceneSearchFilteredQuery)initWithOrgApacheLuceneSearchQuery:(id)a3 withOrgApacheLuceneSearchFilter:(id)a4;
- (OrgApacheLuceneSearchFilteredQuery)initWithOrgApacheLuceneSearchQuery:(id)a3 withOrgApacheLuceneSearchFilter:(id)a4 withOrgApacheLuceneSearchFilteredQuery_FilterStrategy:(id)a5;
- (id)getFilter;
- (id)getFilterStrategy;
- (id)getQuery;
- (id)rewriteWithOrgApacheLuceneIndexIndexReader:(id)a3;
- (id)toStringWithNSString:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchFilteredQuery

- (OrgApacheLuceneSearchFilteredQuery)initWithOrgApacheLuceneSearchQuery:(id)a3 withOrgApacheLuceneSearchFilter:(id)a4
{
  return self;
}

- (OrgApacheLuceneSearchFilteredQuery)initWithOrgApacheLuceneSearchQuery:(id)a3 withOrgApacheLuceneSearchFilter:(id)a4 withOrgApacheLuceneSearchFilteredQuery_FilterStrategy:(id)a5
{
  return self;
}

- (id)rewriteWithOrgApacheLuceneIndexIndexReader:(id)a3
{
  v4 = new_OrgApacheLuceneSearchBooleanQuery_Builder_init();
  uint64_t v5 = *(void *)(&self->super.boost_ + 1);
  if ((atomic_load_explicit(OrgApacheLuceneSearchBooleanClause_OccurEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  [(OrgApacheLuceneSearchBooleanQuery_Builder *)v4 addWithOrgApacheLuceneSearchQuery:v5 withOrgApacheLuceneSearchBooleanClause_OccurEnum:OrgApacheLuceneSearchBooleanClause_OccurEnum_values_];
  v6 = *(OrgApacheLuceneSearchFilter **)((char *)&self->filter_ + 4);
  if (!v6) {
    goto LABEL_8;
  }
  id v7 = [v6 rewriteWithOrgApacheLuceneSearchFilter:*(OrgApacheLuceneSearchQuery **)((char *)&self->query_ + 4)];
  if ((atomic_load_explicit(OrgApacheLuceneSearchBooleanClause_OccurEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  [(OrgApacheLuceneSearchBooleanQuery_Builder *)v4 addWithOrgApacheLuceneSearchQuery:v7 withOrgApacheLuceneSearchBooleanClause_OccurEnum:qword_100563A20];
  id v8 = [(OrgApacheLuceneSearchBooleanQuery_Builder *)v4 build];
  if (!v8) {
LABEL_8:
  }
    JreThrowNullPointerException();
  v9 = v8;
  [(OrgApacheLuceneSearchQuery *)self getBoost];
  objc_msgSend(v9, "setBoostWithFloat:");
  return v9;
}

- (id)getQuery
{
  return *(id *)(&self->super.boost_ + 1);
}

- (id)getFilter
{
  return *(OrgApacheLuceneSearchQuery **)((char *)&self->query_ + 4);
}

- (id)getFilterStrategy
{
  return *(OrgApacheLuceneSearchFilter **)((char *)&self->filter_ + 4);
}

- (id)toStringWithNSString:(id)a3
{
  uint64_t v5 = new_JavaLangStringBuilder_init();
  -[JavaLangStringBuilder appendWithNSString:](v5, "appendWithNSString:", @"filtered(");
  v6 = *(void **)(&self->super.boost_ + 1);
  if (!v6) {
    JreThrowNullPointerException();
  }
  -[JavaLangStringBuilder appendWithNSString:](v5, "appendWithNSString:", [v6 toStringWithNSString:a3]);
  [(JavaLangStringBuilder *)v5 appendWithNSString:@"->"]);
  [(JavaLangStringBuilder *)v5 appendWithId:*(OrgApacheLuceneSearchQuery **)((char *)&self->query_ + 4)];
  [(OrgApacheLuceneSearchQuery *)self getBoost];
  [(JavaLangStringBuilder *)v5 appendWithNSString:OrgApacheLuceneUtilToStringUtils_boostWithFloat_(v7)];
  return [(JavaLangStringBuilder *)v5 description];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v5) = 1;
    return v5;
  }
  v10.receiver = self;
  v10.super_class = (Class)OrgApacheLuceneSearchFilteredQuery;
  unsigned int v5 = -[OrgApacheLuceneSearchQuery isEqual:](&v10, "isEqual:");
  if (v5)
  {
    objc_opt_class();
    if (!a3) {
      goto LABEL_13;
    }
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      JreThrowClassCastException();
    }
    v6 = *(void **)((char *)a3 + 12);
    if (!v6) {
      goto LABEL_13;
    }
    unsigned int v5 = [v6 isEqual:*(void *)(&self->super.boost_ + 1)];
    if (!v5) {
      return v5;
    }
    float v7 = *(void **)((char *)a3 + 20);
    if (!v7) {
      goto LABEL_13;
    }
    unsigned int v5 = [v7 isEqual:*(OrgApacheLuceneSearchQuery **)((char *)&self->query_ + 4)];
    if (!v5) {
      return v5;
    }
    id v8 = *(void **)((char *)a3 + 28);
    if (!v8) {
LABEL_13:
    }
      JreThrowNullPointerException();
    LOBYTE(v5) = [v8 isEqual:*(OrgApacheLuceneSearchFilter **)((char *)&self->filter_ + 4)];
  }
  return v5;
}

- (unint64_t)hash
{
  v11.receiver = self;
  v11.super_class = (Class)OrgApacheLuceneSearchFilteredQuery;
  unsigned int v3 = [(OrgApacheLuceneSearchQuery *)&v11 hash];
  v4 = *(OrgApacheLuceneSearchFilter **)((char *)&self->filter_ + 4);
  if (!v4
    || (unsigned int v5 = [v4 hash], (v6 = *(void **)(&self->super.boost_ + 1)) == 0)
    || (unsigned int v7 = [v6 hash],
        (id v8 = *(OrgApacheLuceneSearchQuery **)((char *)&self->query_ + 4)) == 0))
  {
    JreThrowNullPointerException();
  }
  int v9 = v7 - (v5 - v3 + 32 * v3) + 32 * (v5 - v3 + 32 * v3);
  return (int)([v8 hash] - v9 + 32 * v9);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchFilteredQuery;
  [(OrgApacheLuceneSearchFilteredQuery *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    JreStrongAssignAndConsume((id *)&OrgApacheLuceneSearchFilteredQuery_RANDOM_ACCESS_FILTER_STRATEGY_, [OrgApacheLuceneSearchFilteredQuery_RandomAccessFilterStrategy alloc]);
    JreStrongAssignAndConsume((id *)&OrgApacheLuceneSearchFilteredQuery_LEAP_FROG_FILTER_FIRST_STRATEGY_, [OrgApacheLuceneSearchFilteredQuery__1 alloc]);
    JreStrongAssign(&OrgApacheLuceneSearchFilteredQuery_LEAP_FROG_QUERY_FIRST_STRATEGY_, (void *)OrgApacheLuceneSearchFilteredQuery_LEAP_FROG_FILTER_FIRST_STRATEGY_);
    JreStrongAssignAndConsume(&OrgApacheLuceneSearchFilteredQuery_QUERY_FIRST_FILTER_STRATEGY_, [OrgApacheLuceneSearchFilteredQuery__2 alloc]);
    atomic_store(1u, OrgApacheLuceneSearchFilteredQuery__initialized);
  }
}

@end