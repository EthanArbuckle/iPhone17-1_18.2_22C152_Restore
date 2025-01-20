@interface OrgApacheLuceneSearchFilteredQuery_RandomAccessFilterWrapperQuery
- (BOOL)isEqual:(id)a3;
- (OrgApacheLuceneSearchFilteredQuery_RandomAccessFilterWrapperQuery)initWithOrgApacheLuceneSearchFilter:(id)a3 withOrgApacheLuceneSearchFilteredQuery_RandomAccessFilterStrategy:(id)a4;
- (id)createWeightWithOrgApacheLuceneSearchIndexSearcher:(id)a3 withBoolean:(BOOL)a4;
- (id)toStringWithNSString:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchFilteredQuery_RandomAccessFilterWrapperQuery

- (OrgApacheLuceneSearchFilteredQuery_RandomAccessFilterWrapperQuery)initWithOrgApacheLuceneSearchFilter:(id)a3 withOrgApacheLuceneSearchFilteredQuery_RandomAccessFilterStrategy:(id)a4
{
  return self;
}

- (BOOL)isEqual:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)OrgApacheLuceneSearchFilteredQuery_RandomAccessFilterWrapperQuery;
  unsigned int v5 = -[OrgApacheLuceneSearchQuery isEqual:](&v9, "isEqual:");
  if (v5)
  {
    objc_opt_class();
    if (!a3) {
      JreThrowNullPointerException();
    }
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      JreThrowClassCastException();
    }
    v6 = *(void **)(&self->super.boost_ + 1);
    if (!v6) {
      goto LABEL_9;
    }
    unsigned int v5 = [v6 isEqual:*(void *)((char *)a3 + 12)];
    if (v5)
    {
      v7 = *(OrgApacheLuceneSearchFilter **)((char *)&self->filter_ + 4);
      if (v7)
      {
        LOBYTE(v5) = [v7 isEqual:*(void *)((char *)a3 + 20)];
        return v5;
      }
LABEL_9:
      JreThrowNullPointerException();
    }
  }
  return v5;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)OrgApacheLuceneSearchFilteredQuery_RandomAccessFilterWrapperQuery;
  unsigned int v3 = [(OrgApacheLuceneSearchQuery *)&v7 hash];
  uint64_t v4 = *(uint64_t *)((char *)&self->filter_ + 4);
  v8[0] = *(void *)(&self->super.boost_ + 1);
  v8[1] = v4;
  unsigned int v5 = +[IOSObjectArray arrayWithObjects:v8 count:2 type:NSObject_class_()];
  return (int)(OrgLukhnosPortmobileUtilObjects_hash__WithNSObjectArray_(v5) - v3 + 32 * v3);
}

- (id)toStringWithNSString:(id)a3
{
  unsigned int v3 = *(void **)(&self->super.boost_ + 1);
  if (!v3) {
    JreThrowNullPointerException();
  }
  return [v3 toStringWithNSString:a3];
}

- (id)createWeightWithOrgApacheLuceneSearchIndexSearcher:(id)a3 withBoolean:(BOOL)a4
{
  unsigned int v5 = [OrgApacheLuceneSearchFilteredQuery_RandomAccessFilterWrapperQuery__1 alloc];
  JreStrongAssign((id *)&v5->this$0_, self);
  OrgApacheLuceneSearchWeight_initWithOrgApacheLuceneSearchQuery_((uint64_t)v5, self);
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchFilteredQuery_RandomAccessFilterWrapperQuery;
  [(OrgApacheLuceneSearchFilteredQuery_RandomAccessFilterWrapperQuery *)&v3 dealloc];
}

@end