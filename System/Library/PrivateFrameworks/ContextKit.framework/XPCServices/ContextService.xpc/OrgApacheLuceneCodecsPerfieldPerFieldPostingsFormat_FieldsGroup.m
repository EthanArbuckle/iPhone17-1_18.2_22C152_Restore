@interface OrgApacheLuceneCodecsPerfieldPerFieldPostingsFormat_FieldsGroup
- (OrgApacheLuceneCodecsPerfieldPerFieldPostingsFormat_FieldsGroup)init;
- (void)dealloc;
@end

@implementation OrgApacheLuceneCodecsPerfieldPerFieldPostingsFormat_FieldsGroup

- (OrgApacheLuceneCodecsPerfieldPerFieldPostingsFormat_FieldsGroup)init
{
  p_fields = &self->fields_;
  v4 = new_JavaUtilTreeSet_init();
  JreStrongAssignAndConsume((id *)p_fields, v4);
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsPerfieldPerFieldPostingsFormat_FieldsGroup;
  [(OrgApacheLuceneCodecsPerfieldPerFieldPostingsFormat_FieldsGroup *)&v3 dealloc];
}

@end