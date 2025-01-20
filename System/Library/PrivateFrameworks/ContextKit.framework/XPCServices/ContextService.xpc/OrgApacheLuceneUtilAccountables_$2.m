@interface OrgApacheLuceneUtilAccountables_$2
- (NSString)description;
- (OrgApacheLuceneUtilAccountables_$2)initWithLong:(int64_t)a3 withJavaUtilCollection:(id)a4 withNSString:(id)a5;
- (id)getChildResources;
- (int64_t)ramBytesUsed;
- (void)dealloc;
@end

@implementation OrgApacheLuceneUtilAccountables_$2

- (int64_t)ramBytesUsed
{
  return self->val$bytes_;
}

- (id)getChildResources
{
  return self->val$children_;
}

- (NSString)description
{
  return self->val$description_;
}

- (OrgApacheLuceneUtilAccountables_$2)initWithLong:(int64_t)a3 withJavaUtilCollection:(id)a4 withNSString:(id)a5
{
  self->val$bytes_ = a3;
  JreStrongAssign((id *)&self->val$children_, a4);
  JreStrongAssign((id *)&self->val$description_, a5);
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilAccountables__2;
  [(OrgApacheLuceneUtilAccountables_$2 *)&v3 dealloc];
}

@end