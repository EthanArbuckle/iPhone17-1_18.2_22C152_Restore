@interface OrgApacheLuceneSearchDisiPriorityQueue_$1
- (BOOL)hasNext;
- (OrgApacheLuceneSearchDisiPriorityQueue_$1)initWithOrgApacheLuceneSearchDisiPriorityQueue:(id)a3 withInt:(int)a4;
- (id)next;
- (void)dealloc;
- (void)remove;
@end

@implementation OrgApacheLuceneSearchDisiPriorityQueue_$1

- (BOOL)hasNext
{
  return self->i_ + 1 < self->val$size_;
}

- (id)next
{
  int v2 = self->val$size_;
  int v3 = self->i_ + 1;
  self->i_ = v3;
  if (v3 >= v2)
  {
    v5 = new_JavaUtilNoSuchElementException_init();
    goto LABEL_6;
  }
  id result = -[OrgApacheLuceneSearchDisiPriorityQueue getHeapWithInt:](self->this$0_, "getHeapWithInt:");
  if (!result)
  {
    v5 = new_JavaLangIllegalStateException_init();
LABEL_6:
    objc_exception_throw(v5);
  }
  return result;
}

- (void)remove
{
  int v2 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v2);
}

- (OrgApacheLuceneSearchDisiPriorityQueue_$1)initWithOrgApacheLuceneSearchDisiPriorityQueue:(id)a3 withInt:(int)a4
{
  self->i_ = -1;
  self->val$size_ = a4;
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchDisiPriorityQueue__1;
  [(OrgApacheLuceneSearchDisiPriorityQueue_$1 *)&v3 dealloc];
}

@end