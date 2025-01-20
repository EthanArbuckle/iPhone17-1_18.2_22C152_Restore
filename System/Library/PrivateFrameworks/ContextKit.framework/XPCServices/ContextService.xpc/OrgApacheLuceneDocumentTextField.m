@interface OrgApacheLuceneDocumentTextField
+ (void)initialize;
- (OrgApacheLuceneDocumentTextField)initWithNSString:(id)a3 withJavaIoReader:(id)a4;
- (OrgApacheLuceneDocumentTextField)initWithNSString:(id)a3 withNSString:(id)a4 withOrgApacheLuceneDocumentField_StoreEnum:(id)a5;
- (OrgApacheLuceneDocumentTextField)initWithNSString:(id)a3 withOrgApacheLuceneAnalysisTokenStream:(id)a4;
@end

@implementation OrgApacheLuceneDocumentTextField

- (OrgApacheLuceneDocumentTextField)initWithNSString:(id)a3 withJavaIoReader:(id)a4
{
  return self;
}

- (OrgApacheLuceneDocumentTextField)initWithNSString:(id)a3 withNSString:(id)a4 withOrgApacheLuceneDocumentField_StoreEnum:(id)a5
{
  return self;
}

- (OrgApacheLuceneDocumentTextField)initWithNSString:(id)a3 withOrgApacheLuceneAnalysisTokenStream:(id)a4
{
  return self;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = new_OrgApacheLuceneDocumentFieldType_init();
    JreStrongAssignAndConsume((id *)&OrgApacheLuceneDocumentTextField_TYPE_NOT_STORED_, v2);
    v3 = new_OrgApacheLuceneDocumentFieldType_init();
    JreStrongAssignAndConsume((id *)&OrgApacheLuceneDocumentTextField_TYPE_STORED_, v3);
    v4 = (void *)OrgApacheLuceneDocumentTextField_TYPE_NOT_STORED_;
    if ((atomic_load_explicit(OrgApacheLuceneIndexIndexOptionsEnum__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    [v4 setIndexOptionsWithOrgApacheLuceneIndexIndexOptionsEnum:qword_100563208];
    [(id)OrgApacheLuceneDocumentTextField_TYPE_NOT_STORED_ setTokenizedWithBoolean:1];
    [(id)OrgApacheLuceneDocumentTextField_TYPE_NOT_STORED_ freeze];
    v5 = (void *)OrgApacheLuceneDocumentTextField_TYPE_STORED_;
    if ((atomic_load_explicit(OrgApacheLuceneIndexIndexOptionsEnum__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    [v5 setIndexOptionsWithOrgApacheLuceneIndexIndexOptionsEnum:qword_100563208];
    [(id)OrgApacheLuceneDocumentTextField_TYPE_STORED_ setTokenizedWithBoolean:1];
    [(id)OrgApacheLuceneDocumentTextField_TYPE_STORED_ setStoredWithBoolean:1];
    [(id)OrgApacheLuceneDocumentTextField_TYPE_STORED_ freeze];
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneDocumentTextField__initialized);
  }
}

@end