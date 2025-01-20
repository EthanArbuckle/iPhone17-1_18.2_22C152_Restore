@interface OrgApacheLuceneSearchTopTermsRewrite_$2
- (BOOL)collectWithOrgApacheLuceneUtilBytesRef:(id)a3;
- (BOOL)compareToLastTermWithOrgApacheLuceneUtilBytesRef:(id)a3;
- (OrgApacheLuceneSearchTopTermsRewrite_$2)initWithJavaUtilPriorityQueue:(id)a3 withInt:(int)a4;
- (void)dealloc;
- (void)setNextEnumWithOrgApacheLuceneIndexTermsEnum:(id)a3;
@end

@implementation OrgApacheLuceneSearchTopTermsRewrite_$2

- (void)setNextEnumWithOrgApacheLuceneIndexTermsEnum:(id)a3
{
  JreStrongAssign((id *)&self->termsEnum_, a3);
  if (!self->st_)
  {
    v5 = new_OrgApacheLuceneIndexTermContext_initWithOrgApacheLuceneIndexIndexReaderContext_(self->super.topReaderContext_);
    v6 = new_OrgApacheLuceneSearchTopTermsRewrite_ScoreTerm_initWithOrgApacheLuceneIndexTermContext_(v5);
    JreStrongAssignAndConsume((id *)&self->st_, v6);
  }
  if (!a3 || (id v7 = [a3 attributes]) == 0) {
    JreThrowNullPointerException();
  }
  id v8 = [v7 addAttributeWithIOSClass:OrgApacheLuceneSearchBoostAttribute_class_()];
  JreStrongAssign((id *)&self->boostAtt_, v8);
}

- (BOOL)compareToLastTermWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  p_lastTerm = &self->lastTerm_;
  lastTerm = self->lastTerm_;
  if (!a3 || lastTerm)
  {
    if (a3) {
      [(OrgApacheLuceneUtilBytesRefBuilder *)lastTerm copyBytesWithOrgApacheLuceneUtilBytesRef:a3];
    }
    else {
      JreStrongAssign((id *)p_lastTerm, 0);
    }
  }
  else
  {
    id v7 = new_OrgApacheLuceneUtilBytesRefBuilder_init();
    JreStrongAssignAndConsume((id *)p_lastTerm, v7);
    [(OrgApacheLuceneUtilBytesRefBuilder *)self->lastTerm_ appendWithOrgApacheLuceneUtilBytesRef:a3];
  }
  return 1;
}

- (BOOL)collectWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  boostAtt = self->boostAtt_;
  if (!boostAtt) {
    goto LABEL_28;
  }
  [(OrgApacheLuceneSearchBoostAttribute *)boostAtt getBoost];
  id v7 = self->val$stQueue_;
  if (!v7) {
    goto LABEL_28;
  }
  float v8 = v6;
  if ([(JavaUtilPriorityQueue *)v7 size] != self->val$maxSize_) {
    goto LABEL_10;
  }
  v9 = [(JavaUtilPriorityQueue *)self->val$stQueue_ peek];
  if (!v9) {
    goto LABEL_28;
  }
  float v10 = v9[4];
  if (v8 >= v10)
  {
    if (v8 != v10) {
      goto LABEL_10;
    }
    if (!a3) {
      goto LABEL_28;
    }
    v11 = (void *)*((void *)v9 + 1);
    if (!v11) {
      goto LABEL_28;
    }
    if ((int)objc_msgSend(a3, "compareToWithId:", objc_msgSend(v11, "get")) <= 0)
    {
LABEL_10:
      visitedTerms = self->visitedTerms_;
      if (visitedTerms)
      {
        v13 = [(JavaUtilMap *)visitedTerms getWithId:a3];
        termsEnum = self->termsEnum_;
        if (termsEnum)
        {
          id v15 = [(OrgApacheLuceneIndexTermsEnum *)termsEnum termState];
          if (v13)
          {
            v16 = (void *)v13[3];
            if (v16)
            {
              readerContext = self->super.readerContext_;
              if (readerContext)
              {
                objc_msgSend(v16, "register__WithOrgApacheLuceneIndexTermState:withInt:withInt:withLong:", v15, *((unsigned int *)&readerContext->super.ordInParent_ + 1), -[OrgApacheLuceneIndexTermsEnum docFreq](self->termsEnum_, "docFreq"), -[OrgApacheLuceneIndexTermsEnum totalTermFreq](self->termsEnum_, "totalTermFreq"));
                return 1;
              }
            }
          }
          else
          {
            p_st = &self->st_;
            st = self->st_;
            if (st)
            {
              bytes = st->bytes_;
              if (bytes)
              {
                [(OrgApacheLuceneUtilBytesRefBuilder *)bytes copyBytesWithOrgApacheLuceneUtilBytesRef:a3];
                (*p_st)->boost_ = v8;
                [(JavaUtilMap *)self->visitedTerms_ putWithId:[(OrgApacheLuceneUtilBytesRefBuilder *)(*p_st)->bytes_ get] withId:*p_st];
                v21 = self->super.readerContext_;
                if (v21)
                {
                  [(OrgApacheLuceneIndexTermContext *)(*p_st)->termState_ register__WithOrgApacheLuceneIndexTermState:v15 withInt:*((unsigned int *)&v21->super.ordInParent_ + 1) withInt:[(OrgApacheLuceneIndexTermsEnum *)self->termsEnum_ docFreq] withLong:[(OrgApacheLuceneIndexTermsEnum *)self->termsEnum_ totalTermFreq]];
                  [(JavaUtilPriorityQueue *)self->val$stQueue_ offerWithId:*p_st];
                  if ([(JavaUtilPriorityQueue *)self->val$stQueue_ size] <= self->val$maxSize_)
                  {
                    v22 = new_OrgApacheLuceneIndexTermContext_initWithOrgApacheLuceneIndexIndexReaderContext_(self->super.topReaderContext_);
                    v23 = new_OrgApacheLuceneSearchTopTermsRewrite_ScoreTerm_initWithOrgApacheLuceneIndexTermContext_(v22);
                    JreStrongAssignAndConsume((id *)&self->st_, v23);
                  }
                  else
                  {
                    JreStrongAssign((id *)&self->st_, [(JavaUtilPriorityQueue *)self->val$stQueue_ poll]);
                    if (!*p_st) {
                      goto LABEL_28;
                    }
                    [(JavaUtilMap *)self->visitedTerms_ removeWithId:[(OrgApacheLuceneUtilBytesRefBuilder *)(*p_st)->bytes_ get]];
                    [(OrgApacheLuceneIndexTermContext *)(*p_st)->termState_ clear];
                  }
                  if ([(JavaUtilPriorityQueue *)self->val$stQueue_ size] != self->val$maxSize_) {
                    return 1;
                  }
                  id v24 = [(JavaUtilPriorityQueue *)self->val$stQueue_ peek];
                  maxBoostAtt = self->maxBoostAtt_;
                  if (maxBoostAtt && v24)
                  {
                    LODWORD(v25) = *((_DWORD *)v24 + 4);
                    [(OrgApacheLuceneSearchMaxNonCompetitiveBoostAttribute *)maxBoostAtt setMaxNonCompetitiveBoostWithFloat:v25];
                    -[OrgApacheLuceneSearchMaxNonCompetitiveBoostAttribute setCompetitiveTermWithOrgApacheLuceneUtilBytesRef:](self->maxBoostAtt_, "setCompetitiveTermWithOrgApacheLuceneUtilBytesRef:", [*((id *)v24 + 1) get]);
                    return 1;
                  }
                }
              }
            }
          }
        }
      }
LABEL_28:
      JreThrowNullPointerException();
    }
  }
  return 1;
}

- (OrgApacheLuceneSearchTopTermsRewrite_$2)initWithJavaUtilPriorityQueue:(id)a3 withInt:(int)a4
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchTopTermsRewrite__2;
  [(OrgApacheLuceneSearchTermCollectingRewrite_TermCollector *)&v3 dealloc];
}

@end