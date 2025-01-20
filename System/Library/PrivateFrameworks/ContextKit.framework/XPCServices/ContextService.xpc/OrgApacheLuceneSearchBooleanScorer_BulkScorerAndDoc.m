@interface OrgApacheLuceneSearchBooleanScorer_BulkScorerAndDoc
- (OrgApacheLuceneSearchBooleanScorer_BulkScorerAndDoc)initWithOrgApacheLuceneSearchBooleanScorer:(id)a3 withOrgApacheLuceneSearchBulkScorer:(id)a4;
- (void)__javaClone;
- (void)advanceWithInt:(int)a3;
- (void)scoreWithOrgApacheLuceneUtilBits:(id)a3 withInt:(int)a4 withInt:(int)a5;
@end

@implementation OrgApacheLuceneSearchBooleanScorer_BulkScorerAndDoc

- (OrgApacheLuceneSearchBooleanScorer_BulkScorerAndDoc)initWithOrgApacheLuceneSearchBooleanScorer:(id)a3 withOrgApacheLuceneSearchBulkScorer:(id)a4
{
  return self;
}

- (void)advanceWithInt:(int)a3
{
}

- (void)scoreWithOrgApacheLuceneUtilBits:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id Weak = objc_loadWeak((id *)&self->scorer_);
  if (!Weak) {
    JreThrowNullPointerException();
  }
  self->next_ = [Weak scoreWithOrgApacheLuceneSearchLeafCollector:*(objc_loadWeak((id *)&self->this$0_) + 10) withOrgApacheLuceneUtilBits:a3 withInt:v6 withInt:v5];
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchBooleanScorer_BulkScorerAndDoc;
  [(OrgApacheLuceneSearchBooleanScorer_BulkScorerAndDoc *)&v3 __javaClone];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->this$0_);
  objc_destroyWeak((id *)&self->scorer_);
}

@end