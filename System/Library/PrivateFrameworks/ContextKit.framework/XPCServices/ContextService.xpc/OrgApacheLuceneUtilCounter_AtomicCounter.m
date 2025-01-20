@interface OrgApacheLuceneUtilCounter_AtomicCounter
- (OrgApacheLuceneUtilCounter_AtomicCounter)init;
- (int64_t)addAndGetWithLong:(int64_t)a3;
- (int64_t)get;
- (void)dealloc;
@end

@implementation OrgApacheLuceneUtilCounter_AtomicCounter

- (int64_t)addAndGetWithLong:(int64_t)a3
{
  count = self->count_;
  if (!count) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilConcurrentAtomicAtomicLong *)count addAndGetWithLong:a3];
}

- (int64_t)get
{
  count = self->count_;
  if (!count) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilConcurrentAtomicAtomicLong *)count get];
}

- (OrgApacheLuceneUtilCounter_AtomicCounter)init
{
  p_count = &self->count_;
  v4 = new_JavaUtilConcurrentAtomicAtomicLong_init();
  JreStrongAssignAndConsume((id *)p_count, v4);
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilCounter_AtomicCounter;
  [(OrgApacheLuceneUtilCounter_AtomicCounter *)&v3 dealloc];
}

@end