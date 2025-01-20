@interface OrgApacheLuceneIndexPostingsEnum
+ (BOOL)featureRequestedWithInt:(int)a3 withShort:(signed __int16)a4;
- (OrgApacheLuceneIndexPostingsEnum)init;
- (id)attributes;
- (void)dealloc;
@end

@implementation OrgApacheLuceneIndexPostingsEnum

+ (BOOL)featureRequestedWithInt:(int)a3 withShort:(signed __int16)a4
{
  return (a4 & ~a3) == 0;
}

- (OrgApacheLuceneIndexPostingsEnum)init
{
  return self;
}

- (id)attributes
{
  p_atts = &self->atts_;
  id result = self->atts_;
  if (!result)
  {
    v4 = new_OrgApacheLuceneUtilAttributeSource_init();
    JreStrongAssignAndConsume((id *)p_atts, v4);
    return *p_atts;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexPostingsEnum;
  [(OrgApacheLuceneIndexPostingsEnum *)&v3 dealloc];
}

@end