@interface OrgApacheLuceneSearchMatchNoDocsQuery
- (OrgApacheLuceneSearchMatchNoDocsQuery)init;
- (id)rewriteWithOrgApacheLuceneIndexIndexReader:(id)a3;
- (id)toStringWithNSString:(id)a3;
@end

@implementation OrgApacheLuceneSearchMatchNoDocsQuery

- (id)rewriteWithOrgApacheLuceneIndexIndexReader:(id)a3
{
  id v4 = [new_OrgApacheLuceneSearchBooleanQuery_Builder_init() build];
  if (!v4) {
    JreThrowNullPointerException();
  }
  v5 = v4;
  [(OrgApacheLuceneSearchQuery *)self getBoost];
  objc_msgSend(v5, "setBoostWithFloat:");
  return v5;
}

- (id)toStringWithNSString:(id)a3
{
  id v4 = new_JavaLangStringBuilder_init();
  [(JavaLangStringBuilder *)v4 appendWithNSString:&stru_10048C1F8];
  [(OrgApacheLuceneSearchQuery *)self getBoost];
  [(JavaLangStringBuilder *)v4 appendWithNSString:OrgApacheLuceneUtilToStringUtils_boostWithFloat_(v5)];
  return [(JavaLangStringBuilder *)v4 description];
}

- (OrgApacheLuceneSearchMatchNoDocsQuery)init
{
  return self;
}

@end