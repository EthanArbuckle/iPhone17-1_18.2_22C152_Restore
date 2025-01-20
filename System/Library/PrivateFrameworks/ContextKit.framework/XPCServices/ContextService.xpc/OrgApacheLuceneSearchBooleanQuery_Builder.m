@interface OrgApacheLuceneSearchBooleanQuery_Builder
- (OrgApacheLuceneSearchBooleanQuery_Builder)init;
- (id)addWithOrgApacheLuceneSearchBooleanClause:(id)a3;
- (id)addWithOrgApacheLuceneSearchQuery:(id)a3 withOrgApacheLuceneSearchBooleanClause_OccurEnum:(id)a4;
- (id)build;
- (id)setDisableCoordWithBoolean:(BOOL)a3;
- (id)setMinimumNumberShouldMatchWithInt:(int)a3;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchBooleanQuery_Builder

- (OrgApacheLuceneSearchBooleanQuery_Builder)init
{
  p_clauses = &self->clauses_;
  v4 = new_JavaUtilArrayList_init();
  JreStrongAssignAndConsume((id *)p_clauses, v4);
  return self;
}

- (id)setDisableCoordWithBoolean:(BOOL)a3
{
  *((unsigned char *)self + 8) = a3;
  return self;
}

- (id)setMinimumNumberShouldMatchWithInt:(int)a3
{
  *((_DWORD *)self + 3) = a3;
  return self;
}

- (id)addWithOrgApacheLuceneSearchBooleanClause:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  -[OrgApacheLuceneSearchBooleanQuery_Builder addWithOrgApacheLuceneSearchQuery:withOrgApacheLuceneSearchBooleanClause_OccurEnum:](self, "addWithOrgApacheLuceneSearchQuery:withOrgApacheLuceneSearchBooleanClause_OccurEnum:", [a3 getQuery], objc_msgSend(a3, "getOccur"));
  return self;
}

- (id)addWithOrgApacheLuceneSearchQuery:(id)a3 withOrgApacheLuceneSearchBooleanClause_OccurEnum:(id)a4
{
  clauses = self->clauses_;
  if (!clauses) {
    JreThrowNullPointerException();
  }
  signed int v8 = [(JavaUtilList *)clauses size];
  if (v8 >= dword_10055ACF0)
  {
    v10 = new_OrgApacheLuceneSearchBooleanQuery_TooManyClauses_init();
    objc_exception_throw(v10);
  }
  [(JavaUtilList *)self->clauses_ addWithId:new_OrgApacheLuceneSearchBooleanClause_initWithOrgApacheLuceneSearchQuery_withOrgApacheLuceneSearchBooleanClause_OccurEnum_((uint64_t)a3, (uint64_t)a4)];
  return self;
}

- (id)build
{
  clauses = self->clauses_;
  if (!clauses) {
    JreThrowNullPointerException();
  }
  int minimumNumberShouldMatch = self->minimumNumberShouldMatch_;
  char disableCoord = self->disableCoord_;
  id v5 = [(JavaUtilList *)clauses toArrayWithNSObjectArray:+[IOSObjectArray arrayWithLength:0 type:OrgApacheLuceneSearchBooleanClause_class_()]];
  v6 = [OrgApacheLuceneSearchBooleanQuery alloc];
  sub_1000EB0F8((uint64_t)v6, disableCoord, minimumNumberShouldMatch, v5);
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchBooleanQuery_Builder;
  [(OrgApacheLuceneSearchBooleanQuery_Builder *)&v3 dealloc];
}

@end