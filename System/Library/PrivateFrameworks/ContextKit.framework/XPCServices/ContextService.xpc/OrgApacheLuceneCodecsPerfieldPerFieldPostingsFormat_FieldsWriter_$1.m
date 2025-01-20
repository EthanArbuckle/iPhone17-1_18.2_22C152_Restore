@interface OrgApacheLuceneCodecsPerfieldPerFieldPostingsFormat_FieldsWriter_$1
- (OrgApacheLuceneCodecsPerfieldPerFieldPostingsFormat_FieldsWriter_$1)initWithOrgApacheLuceneCodecsPerfieldPerFieldPostingsFormat_FieldsGroup:(id)a3 withOrgApacheLuceneIndexFields:(id)a4;
- (id)iterator;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)dealloc;
@end

@implementation OrgApacheLuceneCodecsPerfieldPerFieldPostingsFormat_FieldsWriter_$1

- (id)iterator
{
  v2 = self->val$group_;
  if (!v2 || (fields = v2->fields_) == 0) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilSet *)fields iterator];
}

- (OrgApacheLuceneCodecsPerfieldPerFieldPostingsFormat_FieldsWriter_$1)initWithOrgApacheLuceneCodecsPerfieldPerFieldPostingsFormat_FieldsGroup:(id)a3 withOrgApacheLuceneIndexFields:(id)a4
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsPerfieldPerFieldPostingsFormat_FieldsWriter__1;
  [(OrgApacheLuceneIndexFilterLeafReader_FilterFields *)&v3 dealloc];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

@end