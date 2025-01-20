@interface OrgApacheLuceneSearchQuery
- (BOOL)isEqual:(id)a3;
- (OrgApacheLuceneSearchQuery)init;
- (float)getBoost;
- (id)clone;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createWeightWithOrgApacheLuceneSearchIndexSearcher:(id)a3 withBoolean:(BOOL)a4;
- (id)description;
- (unint64_t)hash;
- (void)setBoostWithFloat:(float)a3;
@end

@implementation OrgApacheLuceneSearchQuery

- (void)setBoostWithFloat:(float)a3
{
  self->boost_ = a3;
}

- (float)getBoost
{
  return self->boost_;
}

- (id)description
{
  return [(OrgApacheLuceneSearchQuery *)self toStringWithNSString:&stru_10048C1F8];
}

- (id)createWeightWithOrgApacheLuceneSearchIndexSearcher:(id)a3 withBoolean:(BOOL)a4
{
  CFStringRef v8 = JreStrcat("$@$", (uint64_t)a2, (uint64_t)a3, a4, v4, v5, v6, v7, @"Query ");
  v9 = new_JavaLangUnsupportedOperationException_initWithNSString_((uint64_t)v8);
  objc_exception_throw(v9);
}

- (id)clone
{
  v4.receiver = self;
  v4.super_class = (Class)OrgApacheLuceneSearchQuery;
  id v2 = [(OrgApacheLuceneSearchQuery *)&v4 clone];
  objc_opt_class();
  if (v2 && (objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return v2;
}

- (unint64_t)hash
{
  [(OrgApacheLuceneSearchQuery *)self getBoost];
  int v4 = JavaLangFloat_floatToIntBitsWithFloat_(v3);
  return (int)(v4 ^ objc_msgSend(-[OrgApacheLuceneSearchQuery getClass](self, "getClass"), "hash"));
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  if (!a3) {
    return 0;
  }
  id v5 = [(OrgApacheLuceneSearchQuery *)self getClass];
  if (v5 != [a3 getClass]) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  int v7 = JavaLangFloat_floatToIntBitsWithFloat_(self->boost_);
  return v7 == JavaLangFloat_floatToIntBitsWithFloat_(*((float *)a3 + 2));
}

- (OrgApacheLuceneSearchQuery)init
{
  self->boost_ = 1.0;
  return self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = [(OrgApacheLuceneSearchQuery *)self clone];
  return v3;
}

@end