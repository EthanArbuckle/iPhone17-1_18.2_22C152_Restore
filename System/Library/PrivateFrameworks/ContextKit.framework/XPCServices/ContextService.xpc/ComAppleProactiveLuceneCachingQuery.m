@interface ComAppleProactiveLuceneCachingQuery
- (BOOL)isEqual:(id)a3;
- (ComAppleProactiveLuceneCachingQuery)initWithOrgApacheLuceneSearchQuery:(id)a3 withOrgApacheLuceneSearchIndexSearcher:(id)a4;
- (float)getBoost;
- (id)clone;
- (id)createWeightWithOrgApacheLuceneSearchIndexSearcher:(id)a3 withBoolean:(BOOL)a4;
- (id)toStringWithNSString:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
- (void)setBoostWithFloat:(float)a3;
@end

@implementation ComAppleProactiveLuceneCachingQuery

- (ComAppleProactiveLuceneCachingQuery)initWithOrgApacheLuceneSearchQuery:(id)a3 withOrgApacheLuceneSearchIndexSearcher:(id)a4
{
  return self;
}

- (void)setBoostWithFloat:(float)a3
{
  v3 = *(void **)(&self->super.boost_ + 1);
  if (!v3) {
    JreThrowNullPointerException();
  }
  objc_msgSend(v3, "setBoostWithFloat:");
}

- (float)getBoost
{
  v2 = *(void **)(&self->super.boost_ + 1);
  if (!v2) {
    JreThrowNullPointerException();
  }
  [v2 getBoost];
  return result;
}

- (id)createWeightWithOrgApacheLuceneSearchIndexSearcher:(id)a3 withBoolean:(BOOL)a4
{
  if (a4)
  {
    v4 = (id *)((char *)&self->is_ + 4);
    if (!*(OrgApacheLuceneSearchIndexSearcher **)((char *)&self->is_ + 4))
    {
      v5 = *(void **)(&self->super.boost_ + 1);
      if (v5)
      {
        uint64_t v6 = 1;
LABEL_8:
        v7 = new_ComAppleProactiveLuceneCachingWeight_initWithOrgApacheLuceneSearchWeight_([v5 createWeightWithOrgApacheLuceneSearchIndexSearcher:a3 withBoolean:v6]);
        JreStrongAssignAndConsume(v4, v7);
        return *v4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    v4 = (id *)((char *)&self->weightWithScores_ + 4);
    if (!*(OrgApacheLuceneSearchWeight **)((char *)&self->weightWithScores_ + 4))
    {
      v5 = *(void **)(&self->super.boost_ + 1);
      if (v5)
      {
        uint64_t v6 = 0;
        goto LABEL_8;
      }
LABEL_10:
      JreThrowNullPointerException();
    }
  }
  return *v4;
}

- (id)clone
{
  v3 = *(OrgApacheLuceneSearchQuery **)((char *)&self->q_ + 4);
  v4 = [ComAppleProactiveLuceneCachingQuery alloc];
  ComAppleProactiveLuceneCachingQuery_initWithOrgApacheLuceneSearchQuery_withOrgApacheLuceneSearchIndexSearcher_((uint64_t)v4, (uint64_t)self, v3);
  v5 = v4;
  JreStrongAssign((id *)((char *)&v5->weightWithScores_ + 4), *(void **)((char *)&self->weightWithScores_ + 4));
  JreStrongAssign((id *)((char *)&v5->is_ + 4), *(void **)((char *)&self->is_ + 4));
  return v5;
}

- (unint64_t)hash
{
  v2 = *(void **)(&self->super.boost_ + 1);
  if (!v2) {
    JreThrowNullPointerException();
  }
  return (int)[v2 hash];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  v3 = *(void **)(&self->super.boost_ + 1);
  if (!v3) {
    JreThrowNullPointerException();
  }
  return objc_msgSend(v3, "isEqual:");
}

- (id)toStringWithNSString:(id)a3
{
  v3 = *(void **)(&self->super.boost_ + 1);
  if (!v3) {
    JreThrowNullPointerException();
  }
  return [v3 toStringWithNSString:a3];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ComAppleProactiveLuceneCachingQuery;
  [(ComAppleProactiveLuceneCachingQuery *)&v3 dealloc];
}

@end