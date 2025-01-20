@interface ComAppleProactiveLuceneScoreInterceptTermQuery
- (ComAppleProactiveLuceneScoreInterceptTermQuery)initWithOrgApacheLuceneIndexTerm:(id)a3 withComAppleProactiveLuceneScoreInterceptTarget:(id)a4;
- (id)createWeightWithOrgApacheLuceneSearchIndexSearcher:(id)a3 withBoolean:(BOOL)a4;
- (id)getUserObject;
- (void)__javaClone;
- (void)dealloc;
- (void)setUserObjectWithId:(id)a3;
@end

@implementation ComAppleProactiveLuceneScoreInterceptTermQuery

- (ComAppleProactiveLuceneScoreInterceptTermQuery)initWithOrgApacheLuceneIndexTerm:(id)a3 withComAppleProactiveLuceneScoreInterceptTarget:(id)a4
{
  return self;
}

- (id)createWeightWithOrgApacheLuceneSearchIndexSearcher:(id)a3 withBoolean:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)ComAppleProactiveLuceneScoreInterceptTermQuery;
  id v5 = [(OrgApacheLuceneSearchTermQuery *)&v7 createWeightWithOrgApacheLuceneSearchIndexSearcher:a3 withBoolean:a4];
  return new_ComAppleProactiveLuceneScoreInterceptWeight_initWithOrgApacheLuceneSearchWeight_withComAppleProactiveLuceneScoreInterceptTarget_(v5, *(void **)((char *)&self->super.perReaderTermState_ + 4));
}

- (id)getUserObject
{
  return objc_loadWeak((id *)((char *)&self->target_ + 4));
}

- (void)setUserObjectWithId:(id)a3
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ComAppleProactiveLuceneScoreInterceptTermQuery;
  [(OrgApacheLuceneSearchTermQuery *)&v3 dealloc];
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)ComAppleProactiveLuceneScoreInterceptTermQuery;
  [(ComAppleProactiveLuceneScoreInterceptTermQuery *)&v3 __javaClone];
}

- (void).cxx_destruct
{
}

@end