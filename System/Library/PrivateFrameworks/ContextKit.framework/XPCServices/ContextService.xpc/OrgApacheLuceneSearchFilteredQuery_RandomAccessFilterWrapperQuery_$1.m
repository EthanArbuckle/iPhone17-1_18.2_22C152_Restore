@interface OrgApacheLuceneSearchFilteredQuery_RandomAccessFilterWrapperQuery_$1
- (OrgApacheLuceneSearchFilteredQuery_RandomAccessFilterWrapperQuery_$1)initWithOrgApacheLuceneSearchFilteredQuery_RandomAccessFilterWrapperQuery:(id)a3 withOrgApacheLuceneSearchQuery:(id)a4;
- (float)getValueForNormalization;
- (id)explainWithOrgApacheLuceneIndexLeafReaderContext:(id)a3 withInt:(int)a4;
- (id)scorerWithOrgApacheLuceneIndexLeafReaderContext:(id)a3;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchFilteredQuery_RandomAccessFilterWrapperQuery_$1

- (float)getValueForNormalization
{
  return 0.0;
}

- (id)explainWithOrgApacheLuceneIndexLeafReaderContext:(id)a3 withInt:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = [(OrgApacheLuceneSearchFilteredQuery_RandomAccessFilterWrapperQuery_$1 *)self scorerWithOrgApacheLuceneIndexLeafReaderContext:a3];
  if (!v5) {
    goto LABEL_6;
  }
  v13 = v5;
  id v14 = [v5 asTwoPhaseIterator];
  if (!v14)
  {
    if ([v13 advanceWithInt:v4] == v4) {
      goto LABEL_8;
    }
LABEL_6:
    v17 = @"No match on id ";
    goto LABEL_9;
  }
  v15 = v14;
  id v16 = [v14 approximation];
  if (!v16) {
    JreThrowNullPointerException();
  }
  if ([v16 advanceWithInt:v4] != v4
    || ([v15 matches] & 1) == 0)
  {
    goto LABEL_6;
  }
LABEL_8:
  v17 = @"Match on id ";
LABEL_9:
  CFStringRef v18 = JreStrcat("$I", v6, v7, v8, v9, v10, v11, v12, v17);
  v19 = +[IOSObjectArray arrayWithLength:0 type:OrgApacheLuceneSearchExplanation_class_()];
  return OrgApacheLuceneSearchExplanation_matchWithFloat_withNSString_withOrgApacheLuceneSearchExplanationArray_((uint64_t)v18, v19, 0.0);
}

- (id)scorerWithOrgApacheLuceneIndexLeafReaderContext:(id)a3
{
  uint64_t v4 = *(void **)(&self->this$0_->super.boost_ + 1);
  if (!v4) {
LABEL_18:
  }
    JreThrowNullPointerException();
  id v6 = [v4 getDocIdSetWithOrgApacheLuceneIndexLeafReaderContext:a3 withOrgApacheLuceneUtilBits:0];
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  id v8 = [v6 bits];
  if (!v8)
  {
    id v13 = [v7 iterator];
    if (v13) {
      goto LABEL_13;
    }
    return 0;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(OrgApacheLuceneSearchFilter **)((char *)&self->this$0_->filter_ + 4);
  if (!v10) {
    goto LABEL_18;
  }
  if ([v10 alwaysUseRandomAccess]) {
    goto LABEL_9;
  }
  id v11 = [v7 iterator];
  if (!v11) {
    return 0;
  }
  uint64_t v12 = *(OrgApacheLuceneSearchFilter **)((char *)&self->this$0_->filter_ + 4);
  if (!v12) {
    goto LABEL_18;
  }
  id v13 = v11;
  if (!objc_msgSend(v12, "useRandomAccessWithOrgApacheLuceneUtilBits:withLong:", v9, objc_msgSend(v11, "cost")))
  {
LABEL_13:
    v17 = new_OrgApacheLuceneSearchConstantScoreScorer_initWithOrgApacheLuceneSearchWeight_withFloat_withOrgApacheLuceneSearchDocIdSetIterator_(self, v13, 0.0);
    goto LABEL_14;
  }
LABEL_9:
  if (!a3) {
    goto LABEL_18;
  }
  id v14 = [a3 reader];
  if (!v14) {
    goto LABEL_18;
  }
  v15 = OrgApacheLuceneSearchDocIdSetIterator_allWithInt_((int)[v14 maxDoc]);
  id v16 = [OrgApacheLuceneSearchFilteredQuery_RandomAccessFilterWrapperQuery__1__1 alloc];
  JreStrongAssign((id *)&v16->val$bits_, v9);
  OrgApacheLuceneSearchTwoPhaseIterator_initWithOrgApacheLuceneSearchDocIdSetIterator_((uint64_t)v16, (uint64_t)v15);
  v17 = new_OrgApacheLuceneSearchConstantScoreScorer_initWithOrgApacheLuceneSearchWeight_withFloat_withOrgApacheLuceneSearchTwoPhaseIterator_(self, v16, 0.0);
LABEL_14:
  return v17;
}

- (OrgApacheLuceneSearchFilteredQuery_RandomAccessFilterWrapperQuery_$1)initWithOrgApacheLuceneSearchFilteredQuery_RandomAccessFilterWrapperQuery:(id)a3 withOrgApacheLuceneSearchQuery:(id)a4
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchFilteredQuery_RandomAccessFilterWrapperQuery__1;
  [(OrgApacheLuceneSearchWeight *)&v3 dealloc];
}

@end