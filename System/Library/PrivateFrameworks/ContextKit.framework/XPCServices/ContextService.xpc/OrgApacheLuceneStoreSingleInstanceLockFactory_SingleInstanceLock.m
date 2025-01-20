@interface OrgApacheLuceneStoreSingleInstanceLockFactory_SingleInstanceLock
- (OrgApacheLuceneStoreSingleInstanceLockFactory_SingleInstanceLock)initWithOrgApacheLuceneStoreSingleInstanceLockFactory:(id)a3 withNSString:(id)a4;
- (id)description;
- (void)close;
- (void)dealloc;
- (void)ensureValid;
@end

@implementation OrgApacheLuceneStoreSingleInstanceLockFactory_SingleInstanceLock

- (OrgApacheLuceneStoreSingleInstanceLockFactory_SingleInstanceLock)initWithOrgApacheLuceneStoreSingleInstanceLockFactory:(id)a3 withNSString:(id)a4
{
  return self;
}

- (void)ensureValid
{
  unsigned __int8 v9 = atomic_load((unsigned __int8 *)&self->closed_);
  if (v9)
  {
    CFStringRef v19 = JreStrcat("$@", (uint64_t)a2, v2, v3, v4, v5, v6, v7, @"Lock instance already released: ");
    v20 = new_OrgApacheLuceneStoreAlreadyClosedException_initWithNSString_((uint64_t)v19);
    objc_exception_throw(v20);
  }
  locks = self->this$0_->locks_;
  objc_sync_enter(locks);
  v11 = self->this$0_->locks_;
  if (!v11) {
    JreThrowNullPointerException();
  }
  if (![(JavaUtilHashSet *)v11 containsWithId:self->lockName_])
  {
    CFStringRef v21 = JreStrcat("$@", v12, v13, v14, v15, v16, v17, v18, @"Lock instance was invalidated from map: ");
    v22 = new_OrgApacheLuceneStoreAlreadyClosedException_initWithNSString_((uint64_t)v21);
    objc_exception_throw(v22);
  }
  objc_sync_exit(locks);
}

- (void)close
{
  objc_sync_enter(self);
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->closed_);
  if ((v3 & 1) == 0)
  {
    locks = self->this$0_->locks_;
    objc_sync_enter(locks);
    uint64_t v5 = self->this$0_->locks_;
    if (!v5) {
      JreThrowNullPointerException();
    }
    if (![(JavaUtilHashSet *)v5 removeWithId:self->lockName_])
    {
      CFStringRef v13 = JreStrcat("$@", v6, v7, v8, v9, v10, v11, v12, @"Lock was already released: ");
      uint64_t v14 = new_OrgApacheLuceneStoreAlreadyClosedException_initWithNSString_((uint64_t)v13);
      objc_exception_throw(v14);
    }
    objc_sync_exit(locks);
    atomic_store(1u, (unsigned __int8 *)&self->closed_);
  }
  objc_sync_exit(self);
}

- (id)description
{
  v11.receiver = self;
  v11.super_class = (Class)OrgApacheLuceneStoreSingleInstanceLockFactory_SingleInstanceLock;
  id v2 = [(OrgApacheLuceneStoreSingleInstanceLockFactory_SingleInstanceLock *)&v11 description];
  return (id)JreStrcat("$$$", v3, v4, v5, v6, v7, v8, v9, v2);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneStoreSingleInstanceLockFactory_SingleInstanceLock;
  [(OrgApacheLuceneStoreSingleInstanceLockFactory_SingleInstanceLock *)&v3 dealloc];
}

@end