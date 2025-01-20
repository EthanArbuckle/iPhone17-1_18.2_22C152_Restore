@interface OrgApacheLuceneUtilRefCount
- (OrgApacheLuceneUtilRefCount)initWithId:(id)a3;
- (id)get;
- (int)getRefCount;
- (void)dealloc;
- (void)decRef;
- (void)incRef;
@end

@implementation OrgApacheLuceneUtilRefCount

- (OrgApacheLuceneUtilRefCount)initWithId:(id)a3
{
  return self;
}

- (void)decRef
{
  refCount = self->refCount_;
  if (!refCount) {
    JreThrowNullPointerException();
  }
  unsigned int v4 = [(JavaUtilConcurrentAtomicAtomicInteger *)refCount decrementAndGet];
  if (v4)
  {
    if ((v4 & 0x80000000) != 0)
    {
      CFStringRef v12 = JreStrcat("$I$", v5, v6, v7, v8, v9, v10, v11, @"too many decRef calls: refCount is ");
      v13 = new_JavaLangIllegalStateException_initWithNSString_((uint64_t)v12);
      objc_exception_throw(v13);
    }
  }
  else
  {
    [(OrgApacheLuceneUtilRefCount *)self release];
  }
}

- (id)get
{
  return self->object_;
}

- (int)getRefCount
{
  refCount = self->refCount_;
  if (!refCount) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilConcurrentAtomicAtomicInteger *)refCount get];
}

- (void)incRef
{
  refCount = self->refCount_;
  if (!refCount) {
    JreThrowNullPointerException();
  }
  [(JavaUtilConcurrentAtomicAtomicInteger *)refCount incrementAndGet];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilRefCount;
  [(OrgApacheLuceneUtilRefCount *)&v3 dealloc];
}

@end