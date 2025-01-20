@interface OrgApacheLuceneStoreBaseDirectory
- (OrgApacheLuceneStoreBaseDirectory)initWithOrgApacheLuceneStoreLockFactory:(id)a3;
- (id)description;
- (id)obtainLockWithNSString:(id)a3;
- (void)dealloc;
- (void)ensureOpen;
@end

@implementation OrgApacheLuceneStoreBaseDirectory

- (OrgApacheLuceneStoreBaseDirectory)initWithOrgApacheLuceneStoreLockFactory:(id)a3
{
  return self;
}

- (id)obtainLockWithNSString:(id)a3
{
  lockFactory = self->lockFactory_;
  if (!lockFactory) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneStoreLockFactory *)lockFactory obtainLockWithOrgApacheLuceneStoreDirectory:self withNSString:a3];
}

- (void)ensureOpen
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->isOpen_);
  if ((v2 & 1) == 0)
  {
    v3 = new_OrgApacheLuceneStoreAlreadyClosedException_initWithNSString_(@"this Directory is closed");
    objc_exception_throw(v3);
  }
}

- (id)description
{
  v11.receiver = self;
  v11.super_class = (Class)OrgApacheLuceneStoreBaseDirectory;
  unsigned __int8 v2 = [(OrgApacheLuceneStoreDirectory *)&v11 description];
  return (id)JreStrcat("$$@", v3, v4, v5, v6, v7, v8, v9, v2);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneStoreBaseDirectory;
  [(OrgApacheLuceneStoreBaseDirectory *)&v3 dealloc];
}

@end