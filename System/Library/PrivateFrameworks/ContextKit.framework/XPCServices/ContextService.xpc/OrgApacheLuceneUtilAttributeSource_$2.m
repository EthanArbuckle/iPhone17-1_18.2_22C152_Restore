@interface OrgApacheLuceneUtilAttributeSource_$2
- (BOOL)hasNext;
- (OrgApacheLuceneUtilAttributeSource_$2)initWithOrgApacheLuceneUtilAttributeSource_State:(id)a3;
- (id)next;
- (void)dealloc;
- (void)remove;
@end

@implementation OrgApacheLuceneUtilAttributeSource_$2

- (void)remove
{
  v2 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v2);
}

- (id)next
{
  state = self->state_;
  p_state = &self->state_;
  v3 = state;
  if (!state)
  {
    v7 = new_JavaUtilNoSuchElementException_init();
    objc_exception_throw(v7);
  }
  attribute = v3->attribute_;
  JreStrongAssign((id *)p_state, v3->next_);
  return attribute;
}

- (BOOL)hasNext
{
  return self->state_ != 0;
}

- (OrgApacheLuceneUtilAttributeSource_$2)initWithOrgApacheLuceneUtilAttributeSource_State:(id)a3
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilAttributeSource__2;
  [(OrgApacheLuceneUtilAttributeSource_$2 *)&v3 dealloc];
}

@end