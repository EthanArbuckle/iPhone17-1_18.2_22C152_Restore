@interface OrgApacheLuceneStoreFSLockFactory
+ (id)getDefault;
- (OrgApacheLuceneStoreFSLockFactory)init;
- (id)obtainLockWithOrgApacheLuceneStoreDirectory:(id)a3 withNSString:(id)a4;
@end

@implementation OrgApacheLuceneStoreFSLockFactory

+ (id)getDefault
{
  if ((atomic_load_explicit(OrgApacheLuceneStoreNativeFSLockFactory__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (id)OrgApacheLuceneStoreNativeFSLockFactory_INSTANCE_;
}

- (id)obtainLockWithOrgApacheLuceneStoreDirectory:(id)a3 withNSString:(id)a4
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v7 = objc_msgSend(-[OrgApacheLuceneStoreFSLockFactory getClass](self, "getClass"), "getSimpleName");
    CFStringRef v15 = JreStrcat("$$@", v8, v9, v10, v11, v12, v13, v14, v7);
    v16 = new_JavaLangUnsupportedOperationException_initWithNSString_((uint64_t)v15);
    objc_exception_throw(v16);
  }
  objc_opt_class();
  if (a3 && (objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return [(OrgApacheLuceneStoreFSLockFactory *)self obtainFSLockWithOrgApacheLuceneStoreFSDirectory:a3 withNSString:a4];
}

- (OrgApacheLuceneStoreFSLockFactory)init
{
  return self;
}

@end