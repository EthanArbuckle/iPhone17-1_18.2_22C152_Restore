@interface OrgApacheLuceneSearchBlendedTermQuery_DisjunctionMaxRewrite
- (BOOL)isEqual:(id)a3;
- (OrgApacheLuceneSearchBlendedTermQuery_DisjunctionMaxRewrite)initWithFloat:(float)a3;
- (OrgApacheLuceneSearchBlendedTermQuery_DisjunctionMaxRewrite)rewriteWithOrgApacheLuceneSearchQueryArray:(id)a3;
- (unint64_t)hash;
@end

@implementation OrgApacheLuceneSearchBlendedTermQuery_DisjunctionMaxRewrite

- (OrgApacheLuceneSearchBlendedTermQuery_DisjunctionMaxRewrite)initWithFloat:(float)a3
{
  self->tieBreakerMultiplier_ = a3;
  return self;
}

- (OrgApacheLuceneSearchBlendedTermQuery_DisjunctionMaxRewrite)rewriteWithOrgApacheLuceneSearchQueryArray:(id)a3
{
  v4 = JavaUtilArrays_asListWithNSObjectArray_(a3);
  initWithJavaUtilCollection_withFloat = new_OrgApacheLuceneSearchDisjunctionMaxQuery_initWithJavaUtilCollection_withFloat_((uint64_t)v4, self->tieBreakerMultiplier_);
  return (OrgApacheLuceneSearchBlendedTermQuery_DisjunctionMaxRewrite *)initWithJavaUtilCollection_withFloat;
}

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v5 = [(OrgApacheLuceneSearchBlendedTermQuery_DisjunctionMaxRewrite *)self getClass];
  if (v5 != [a3 getClass]) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return self->tieBreakerMultiplier_ == *((float *)a3 + 2);
}

- (unint64_t)hash
{
  unsigned int v3 = objc_msgSend(-[OrgApacheLuceneSearchBlendedTermQuery_DisjunctionMaxRewrite getClass](self, "getClass"), "hash");
  return (int)(JavaLangFloat_floatToIntBitsWithFloat_(self->tieBreakerMultiplier_) - v3 + 32 * v3);
}

@end