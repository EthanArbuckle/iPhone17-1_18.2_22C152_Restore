@interface ComAppleProactiveLuceneCachingWeight
- (ComAppleProactiveLuceneCachingWeight)initWithOrgApacheLuceneSearchWeight:(id)a3;
- (float)getValueForNormalization;
- (id)explainWithOrgApacheLuceneIndexLeafReaderContext:(id)a3 withInt:(int)a4;
- (id)scorerWithOrgApacheLuceneIndexLeafReaderContext:(id)a3;
- (void)dealloc;
- (void)extractTermsWithJavaUtilSet:(id)a3;
- (void)normalizeWithFloat:(float)a3 withFloat:(float)a4;
@end

@implementation ComAppleProactiveLuceneCachingWeight

- (ComAppleProactiveLuceneCachingWeight)initWithOrgApacheLuceneSearchWeight:(id)a3
{
  return self;
}

- (void)extractTermsWithJavaUtilSet:(id)a3
{
  p_cachedTerms = &self->cachedTerms_;
  cachedTerms = self->cachedTerms_;
  if (cachedTerms)
  {
    if (a3)
    {
      [a3 addAllWithJavaUtilCollection:cachedTerms];
      return;
    }
LABEL_10:
    JreThrowNullPointerException();
  }
  v6 = new_JavaUtilHashSet_init();
  JreStrongAssignAndConsume((id *)p_cachedTerms, v6);
  w = self->w_;
  if (!w) {
    goto LABEL_10;
  }
  v8 = *p_cachedTerms;
  [(OrgApacheLuceneSearchWeight *)w extractTermsWithJavaUtilSet:v8];
}

- (id)explainWithOrgApacheLuceneIndexLeafReaderContext:(id)a3 withInt:(int)a4
{
  w = self->w_;
  if (!w) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneSearchWeight *)w explainWithOrgApacheLuceneIndexLeafReaderContext:a3 withInt:*(void *)&a4];
}

- (float)getValueForNormalization
{
  return self->valueForNormalization_;
}

- (void)normalizeWithFloat:(float)a3 withFloat:(float)a4
{
  self->valueForNormalization_ = NAN;
  w = self->w_;
  if (!w) {
    JreThrowNullPointerException();
  }
  -[OrgApacheLuceneSearchWeight normalizeWithFloat:withFloat:](w, "normalizeWithFloat:withFloat:");
}

- (id)scorerWithOrgApacheLuceneIndexLeafReaderContext:(id)a3
{
  w = self->w_;
  if (!w) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneSearchWeight *)w scorerWithOrgApacheLuceneIndexLeafReaderContext:a3];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ComAppleProactiveLuceneCachingWeight;
  [(OrgApacheLuceneSearchWeight *)&v3 dealloc];
}

@end