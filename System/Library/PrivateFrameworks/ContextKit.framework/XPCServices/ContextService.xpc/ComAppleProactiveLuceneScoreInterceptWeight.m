@interface ComAppleProactiveLuceneScoreInterceptWeight
- (ComAppleProactiveLuceneScoreInterceptWeight)initWithOrgApacheLuceneSearchWeight:(id)a3 withComAppleProactiveLuceneScoreInterceptTarget:(id)a4;
- (float)getValueForNormalization;
- (id)explainWithOrgApacheLuceneIndexLeafReaderContext:(id)a3 withInt:(int)a4;
- (id)scorerWithOrgApacheLuceneIndexLeafReaderContext:(id)a3;
- (void)dealloc;
- (void)extractTermsWithJavaUtilSet:(id)a3;
- (void)normalizeWithFloat:(float)a3 withFloat:(float)a4;
@end

@implementation ComAppleProactiveLuceneScoreInterceptWeight

- (ComAppleProactiveLuceneScoreInterceptWeight)initWithOrgApacheLuceneSearchWeight:(id)a3 withComAppleProactiveLuceneScoreInterceptTarget:(id)a4
{
  return self;
}

- (void)extractTermsWithJavaUtilSet:(id)a3
{
  weight = self->weight_;
  if (!weight) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneSearchWeight *)weight extractTermsWithJavaUtilSet:a3];
}

- (id)explainWithOrgApacheLuceneIndexLeafReaderContext:(id)a3 withInt:(int)a4
{
  weight = self->weight_;
  if (!weight) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneSearchWeight *)weight explainWithOrgApacheLuceneIndexLeafReaderContext:a3 withInt:*(void *)&a4];
}

- (float)getValueForNormalization
{
  weight = self->weight_;
  if (!weight) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneSearchWeight *)weight getValueForNormalization];
  return result;
}

- (void)normalizeWithFloat:(float)a3 withFloat:(float)a4
{
  weight = self->weight_;
  if (!weight) {
    JreThrowNullPointerException();
  }
  -[OrgApacheLuceneSearchWeight normalizeWithFloat:withFloat:](weight, "normalizeWithFloat:withFloat:");
}

- (id)scorerWithOrgApacheLuceneIndexLeafReaderContext:(id)a3
{
  weight = self->weight_;
  if (!weight) {
    goto LABEL_9;
  }
  id v6 = -[OrgApacheLuceneSearchWeight scorerWithOrgApacheLuceneIndexLeafReaderContext:](weight, "scorerWithOrgApacheLuceneIndexLeafReaderContext:");
  if (!v6) {
    return v6;
  }
  target = self->target_;
  if (!target) {
LABEL_9:
  }
    JreThrowNullPointerException();
  if (![(ComAppleProactiveLuceneScoreInterceptTarget *)target isEnabled]) {
    return v6;
  }
  v8 = self->weight_;
  v9 = [ComAppleProactiveLuceneScoreInterceptWeight__1 alloc];
  sub_10004DAE0((id *)&v9->super.super.super.super.isa, self, a3, v6, v6, v8);
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ComAppleProactiveLuceneScoreInterceptWeight;
  [(OrgApacheLuceneSearchWeight *)&v3 dealloc];
}

@end