@interface OrgApacheLuceneIndexSegmentCoreReaders_FieldsReaderLocal
- (OrgApacheLuceneIndexSegmentCoreReaders_FieldsReaderLocal)initWithOrgApacheLuceneIndexSegmentCoreReaders:(id)a3;
- (id)initialValue;
- (void)__javaClone;
@end

@implementation OrgApacheLuceneIndexSegmentCoreReaders_FieldsReaderLocal

- (id)initialValue
{
  v2 = (void *)*(objc_loadWeak((id *)&self->this$0_) + 3);
  if (!v2) {
    JreThrowNullPointerException();
  }
  return [v2 clone];
}

- (OrgApacheLuceneIndexSegmentCoreReaders_FieldsReaderLocal)initWithOrgApacheLuceneIndexSegmentCoreReaders:(id)a3
{
  return self;
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexSegmentCoreReaders_FieldsReaderLocal;
  [(OrgApacheLuceneIndexSegmentCoreReaders_FieldsReaderLocal *)&v3 __javaClone];
}

- (void).cxx_destruct
{
}

@end