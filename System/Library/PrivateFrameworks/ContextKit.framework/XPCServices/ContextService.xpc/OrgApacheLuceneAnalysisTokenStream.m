@interface OrgApacheLuceneAnalysisTokenStream
+ (void)initialize;
- (BOOL)assertFinal;
- (OrgApacheLuceneAnalysisTokenStream)init;
- (OrgApacheLuceneAnalysisTokenStream)initWithOrgApacheLuceneUtilAttributeFactory:(id)a3;
- (OrgApacheLuceneAnalysisTokenStream)initWithOrgApacheLuceneUtilAttributeSource:(id)a3;
- (void)end;
@end

@implementation OrgApacheLuceneAnalysisTokenStream

- (OrgApacheLuceneAnalysisTokenStream)init
{
  return self;
}

- (OrgApacheLuceneAnalysisTokenStream)initWithOrgApacheLuceneUtilAttributeSource:(id)a3
{
  return self;
}

- (OrgApacheLuceneAnalysisTokenStream)initWithOrgApacheLuceneUtilAttributeFactory:(id)a3
{
  return self;
}

- (BOOL)assertFinal
{
  return 1;
}

- (void)end
{
  [(OrgApacheLuceneUtilAttributeSource *)self clearAttributes];
  id v3 = [(OrgApacheLuceneUtilAttributeSource *)self getAttributeWithIOSClass:OrgApacheLuceneAnalysisTokenattributesPositionIncrementAttribute_class_()];
  if (v3)
  {
    [v3 setPositionIncrementWithInt:0];
  }
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    if ((atomic_load_explicit(OrgApacheLuceneUtilAttributeFactory__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    v2 = (void *)OrgApacheLuceneUtilAttributeFactory_DEFAULT_ATTRIBUTE_FACTORY_;
    id v3 = (void *)OrgApacheLuceneAnalysisTokenattributesPackedTokenAttributeImpl_class_();
    StaticImplementationWithOrgApacheLuceneUtilAttributeFactory_withIOSClass = OrgApacheLuceneUtilAttributeFactory_getStaticImplementationWithOrgApacheLuceneUtilAttributeFactory_withIOSClass_(v2, v3);
    JreStrongAssign((id *)&OrgApacheLuceneAnalysisTokenStream_DEFAULT_TOKEN_ATTRIBUTE_FACTORY_, StaticImplementationWithOrgApacheLuceneUtilAttributeFactory_withIOSClass);
    atomic_store(1u, OrgApacheLuceneAnalysisTokenStream__initialized);
  }
}

@end