@interface OrgApacheLuceneSearchBooleanClause
- (BOOL)isEqual:(id)a3;
- (BOOL)isProhibited;
- (BOOL)isRequired;
- (BOOL)isScoring;
- (OrgApacheLuceneSearchBooleanClause)initWithOrgApacheLuceneSearchQuery:(id)a3 withOrgApacheLuceneSearchBooleanClause_OccurEnum:(id)a4;
- (id)description;
- (id)getOccur;
- (id)getQuery;
- (unint64_t)hash;
- (void)dealloc;
- (void)setOccurWithOrgApacheLuceneSearchBooleanClause_OccurEnum:(id)a3;
- (void)setQueryWithOrgApacheLuceneSearchQuery:(id)a3;
@end

@implementation OrgApacheLuceneSearchBooleanClause

- (OrgApacheLuceneSearchBooleanClause)initWithOrgApacheLuceneSearchQuery:(id)a3 withOrgApacheLuceneSearchBooleanClause_OccurEnum:(id)a4
{
  return self;
}

- (id)getOccur
{
  return self->occur_;
}

- (id)getQuery
{
  return self->query_;
}

- (BOOL)isProhibited
{
  if ((atomic_load_explicit(OrgApacheLuceneSearchBooleanClause_OccurEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (OrgApacheLuceneSearchBooleanClause_OccurEnum *)qword_100563A30 == self->occur_;
}

- (BOOL)isRequired
{
  occur = self->occur_;
  if ((atomic_load_explicit(OrgApacheLuceneSearchBooleanClause_OccurEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (occur == (OrgApacheLuceneSearchBooleanClause_OccurEnum *)OrgApacheLuceneSearchBooleanClause_OccurEnum_values_) {
    return 1;
  }
  v4 = self->occur_;
  if ((atomic_load_explicit(OrgApacheLuceneSearchBooleanClause_OccurEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return v4 == (OrgApacheLuceneSearchBooleanClause_OccurEnum *)qword_100563A20;
}

- (BOOL)isScoring
{
  occur = self->occur_;
  if ((atomic_load_explicit(OrgApacheLuceneSearchBooleanClause_OccurEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (occur == (OrgApacheLuceneSearchBooleanClause_OccurEnum *)OrgApacheLuceneSearchBooleanClause_OccurEnum_values_) {
    return 1;
  }
  v4 = self->occur_;
  if ((atomic_load_explicit(OrgApacheLuceneSearchBooleanClause_OccurEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return v4 == (OrgApacheLuceneSearchBooleanClause_OccurEnum *)qword_100563A28;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      JreThrowClassCastException();
    }
    query = self->query_;
    if (!query) {
      JreThrowNullPointerException();
    }
    unsigned int v6 = [(OrgApacheLuceneSearchQuery *)query isEqual:*((void *)a3 + 1)];
    if (v6) {
      LOBYTE(v6) = self->occur_ == (OrgApacheLuceneSearchBooleanClause_OccurEnum *)*((void *)a3 + 2);
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (unint64_t)hash
{
  query = self->query_;
  if (!query || (unsigned int v4 = [(OrgApacheLuceneSearchQuery *)query hash], (occur = self->occur_) == 0)) {
    JreThrowNullPointerException();
  }
  return (int)([(JavaLangEnum *)occur hash] - v4 + 32 * v4);
}

- (id)description
{
  occur = self->occur_;
  if (!occur || (unsigned int v4 = [(JavaLangEnum *)occur description], (query = self->query_) == 0)) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneSearchQuery *)query description];
  return (id)JreStrcat("$$", v6, v7, v8, v9, v10, v11, v12, v4);
}

- (void)setOccurWithOrgApacheLuceneSearchBooleanClause_OccurEnum:(id)a3
{
  p_occur = &self->occur_;
  unsigned int v4 = (void *)OrgLukhnosPortmobileUtilObjects_requireNonNullWithId_withNSString_((uint64_t)a3, @"Occur must not be null");
  JreStrongAssign((id *)p_occur, v4);
}

- (void)setQueryWithOrgApacheLuceneSearchQuery:(id)a3
{
  p_query = &self->query_;
  unsigned int v4 = (void *)OrgLukhnosPortmobileUtilObjects_requireNonNullWithId_withNSString_((uint64_t)a3, @"Query must not be null");
  JreStrongAssign((id *)p_query, v4);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchBooleanClause;
  [(OrgApacheLuceneSearchBooleanClause *)&v3 dealloc];
}

@end