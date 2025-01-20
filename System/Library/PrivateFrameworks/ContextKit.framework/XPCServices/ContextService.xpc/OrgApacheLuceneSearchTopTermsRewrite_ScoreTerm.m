@interface OrgApacheLuceneSearchTopTermsRewrite_ScoreTerm
- (OrgApacheLuceneSearchTopTermsRewrite_ScoreTerm)initWithOrgApacheLuceneIndexTermContext:(id)a3;
- (int)compareToWithId:(id)a3;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchTopTermsRewrite_ScoreTerm

- (OrgApacheLuceneSearchTopTermsRewrite_ScoreTerm)initWithOrgApacheLuceneIndexTermContext:(id)a3
{
  p_bytes = &self->bytes_;
  v6 = new_OrgApacheLuceneUtilBytesRefBuilder_init();
  JreStrongAssignAndConsume((id *)p_bytes, v6);
  JreStrongAssign((id *)&self->termState_, a3);
  return self;
}

- (int)compareToWithId:(id)a3
{
  objc_opt_class();
  if (!a3) {
    goto LABEL_12;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  float boost = self->boost_;
  float v6 = *((float *)a3 + 4);
  if (boost == v6)
  {
    v7 = (void *)*((void *)a3 + 1);
    if (v7)
    {
      id v8 = [v7 get];
      if (v8)
      {
        v9 = v8;
        id v10 = [(OrgApacheLuceneUtilBytesRefBuilder *)self->bytes_ get];
        return [v9 compareToWithId:v10];
      }
    }
LABEL_12:
    JreThrowNullPointerException();
  }
  return JavaLangFloat_compareWithFloat_withFloat_(boost, v6);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchTopTermsRewrite_ScoreTerm;
  [(OrgApacheLuceneSearchTopTermsRewrite_ScoreTerm *)&v3 dealloc];
}

@end