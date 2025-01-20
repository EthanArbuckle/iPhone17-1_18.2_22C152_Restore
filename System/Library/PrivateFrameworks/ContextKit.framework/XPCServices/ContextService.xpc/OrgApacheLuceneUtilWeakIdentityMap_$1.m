@interface OrgApacheLuceneUtilWeakIdentityMap_$1
- (BOOL)hasNext;
- (OrgApacheLuceneUtilWeakIdentityMap_$1)initWithJavaUtilIterator:(id)a3;
- (id)next;
- (id)setNext;
- (void)dealloc;
- (void)remove;
@end

@implementation OrgApacheLuceneUtilWeakIdentityMap_$1

- (BOOL)hasNext
{
  if (self->nextIsSet_) {
    return 1;
  }
  else {
    return -[OrgApacheLuceneUtilWeakIdentityMap_$1 setNext]_0((uint64_t)self);
  }
}

- (id)setNext
{
  v2 = *(void **)(a1 + 24);
  if (!v2) {
LABEL_7:
  }
    JreThrowNullPointerException();
  v3 = (uint64_t *)(a1 + 8);
  while (1)
  {
    id v4 = [v2 hasNext];
    if (!v4) {
      return v4;
    }
    id v5 = [*(id *)(a1 + 24) next];
    if (!v5) {
      goto LABEL_7;
    }
    JreStrongAssign((id *)(a1 + 8), [v5 get]);
    uint64_t v6 = *v3;
    if (*v3)
    {
      if ((atomic_load_explicit(OrgApacheLuceneUtilWeakIdentityMap__initialized, memory_order_acquire) & 1) == 0) {
        objc_opt_class();
      }
      if (v6 == OrgApacheLuceneUtilWeakIdentityMap_NULL__) {
        JreStrongAssign((id *)(a1 + 8), 0);
      }
      *(unsigned char *)(a1 + 16) = 1;
      return v4;
    }
    [*(id *)(a1 + 24) remove];
    v2 = *(void **)(a1 + 24);
    if (!v2) {
      goto LABEL_7;
    }
  }
}

- (id)next
{
  if (![(OrgApacheLuceneUtilWeakIdentityMap_$1 *)self hasNext])
  {
    uint64_t v6 = new_JavaUtilNoSuchElementException_init();
    objc_exception_throw(v6);
  }
  id next = self->next_;
  p_id next = &self->next_;
  *((unsigned char *)p_next + 8) = 0;
  JreStrongAssign(p_next, 0);
  return next;
}

- (void)remove
{
  v2 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v2);
}

- (OrgApacheLuceneUtilWeakIdentityMap_$1)initWithJavaUtilIterator:(id)a3
{
  self->nextIsSet_ = 0;
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilWeakIdentityMap__1;
  [(OrgApacheLuceneUtilWeakIdentityMap_$1 *)&v3 dealloc];
}

@end