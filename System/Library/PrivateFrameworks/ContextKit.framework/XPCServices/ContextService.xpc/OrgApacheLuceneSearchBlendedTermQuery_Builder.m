@interface OrgApacheLuceneSearchBlendedTermQuery_Builder
- (OrgApacheLuceneSearchBlendedTermQuery_Builder)init;
- (id)addWithOrgApacheLuceneIndexTerm:(id)a3;
- (id)addWithOrgApacheLuceneIndexTerm:(id)a3 withFloat:(float)a4;
- (id)addWithOrgApacheLuceneIndexTerm:(id)a3 withFloat:(float)a4 withOrgApacheLuceneIndexTermContext:(id)a5;
- (id)build;
- (id)setRewriteMethodWithOrgApacheLuceneSearchBlendedTermQuery_RewriteMethod:(id)a3;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchBlendedTermQuery_Builder

- (OrgApacheLuceneSearchBlendedTermQuery_Builder)init
{
  return self;
}

- (id)setRewriteMethodWithOrgApacheLuceneSearchBlendedTermQuery_RewriteMethod:(id)a3
{
  return self;
}

- (id)addWithOrgApacheLuceneIndexTerm:(id)a3
{
  LODWORD(v3) = 1.0;
  return [(OrgApacheLuceneSearchBlendedTermQuery_Builder *)self addWithOrgApacheLuceneIndexTerm:a3 withFloat:v3];
}

- (id)addWithOrgApacheLuceneIndexTerm:(id)a3 withFloat:(float)a4
{
  return -[OrgApacheLuceneSearchBlendedTermQuery_Builder addWithOrgApacheLuceneIndexTerm:withFloat:withOrgApacheLuceneIndexTermContext:](self, "addWithOrgApacheLuceneIndexTerm:withFloat:withOrgApacheLuceneIndexTermContext:", a3, 0);
}

- (id)addWithOrgApacheLuceneIndexTerm:(id)a3 withFloat:(float)a4 withOrgApacheLuceneIndexTermContext:(id)a5
{
  int numTerms = self->numTerms_;
  if (numTerms >= (int)OrgApacheLuceneSearchBooleanQuery_getMaxClauseCount())
  {
    v41 = new_OrgApacheLuceneSearchBooleanQuery_TooManyClauses_init();
    objc_exception_throw(v41);
  }
  v16 = OrgApacheLuceneUtilArrayUtil_growWithNSObjectArray_withInt_(self->terms_, self->numTerms_ + 1, v10, v11, v12, v13, v14, v15);
  JreStrongAssign((id *)&self->terms_, v16);
  v23 = OrgApacheLuceneUtilArrayUtil_growWithFloatArray_withInt_((unsigned int *)self->boosts_, self->numTerms_ + 1, v17, v18, v19, v20, v21, v22);
  JreStrongAssign((id *)&self->boosts_, v23);
  p_contexts = (uint64_t *)&self->contexts_;
  v31 = OrgApacheLuceneUtilArrayUtil_growWithNSObjectArray_withInt_(self->contexts_, self->numTerms_ + 1, v25, v26, v27, v28, v29, v30);
  JreStrongAssign((id *)&self->contexts_, v31);
  terms = self->terms_;
  if (!terms) {
    goto LABEL_9;
  }
  if (!a3) {
    goto LABEL_9;
  }
  uint64_t v33 = self->numTerms_;
  id v34 = [a3 field];
  v35 = OrgApacheLuceneUtilBytesRef_deepCopyOfWithOrgApacheLuceneUtilBytesRef_((uint64_t)[a3 bytes]);
  v36 = new_OrgApacheLuceneIndexTerm_initWithNSString_withOrgApacheLuceneUtilBytesRef_(v34, v35);
  IOSObjectArray_SetAndConsume((uint64_t)terms, v33, v36);
  boosts = self->boosts_;
  if (!boosts) {
    goto LABEL_9;
  }
  int v38 = self->numTerms_;
  uint64_t size = boosts->super.size_;
  if (v38 < 0 || v38 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v38);
  }
  *((float *)&boosts->super.size_ + v38 + 1) = a4;
  if (!*p_contexts) {
LABEL_9:
  }
    JreThrowNullPointerException();
  IOSObjectArray_Set(*p_contexts, self->numTerms_, a5);
  ++self->numTerms_;
  return self;
}

- (id)build
{
  double v3 = (unsigned int *)JavaUtilArrays_copyOfWithNSObjectArray_withInt_(self->terms_, self->numTerms_);
  v4 = JavaUtilArrays_copyOfWithFloatArray_withInt_(self->boosts_, self->numTerms_);
  v5 = JavaUtilArrays_copyOfWithNSObjectArray_withInt_(self->contexts_, self->numTerms_);
  rewriteMethod = self->rewriteMethod_;
  v7 = [OrgApacheLuceneSearchBlendedTermQuery alloc];
  sub_100038E40((uint64_t)v7, v3, v4, v5, rewriteMethod);
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchBlendedTermQuery_Builder;
  [(OrgApacheLuceneSearchBlendedTermQuery_Builder *)&v3 dealloc];
}

@end