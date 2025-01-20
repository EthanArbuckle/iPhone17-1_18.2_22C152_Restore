@interface OrgApacheLuceneUtilWeakIdentityMap_IdentityWeakReference
- (BOOL)isEqual:(id)a3;
- (OrgApacheLuceneUtilWeakIdentityMap_IdentityWeakReference)initWithId:(id)a3 withJavaLangRefReferenceQueue:(id)a4;
- (unint64_t)hash;
@end

@implementation OrgApacheLuceneUtilWeakIdentityMap_IdentityWeakReference

- (OrgApacheLuceneUtilWeakIdentityMap_IdentityWeakReference)initWithId:(id)a3 withJavaLangRefReferenceQueue:(id)a4
{
  return self;
}

- (unint64_t)hash
{
  return self->hash__;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  objc_opt_class();
  if (!a3)
  {
    [(JavaLangRefReference *)self get];
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  id v5 = [(JavaLangRefReference *)self get];
  return v5 == [a3 get];
}

@end