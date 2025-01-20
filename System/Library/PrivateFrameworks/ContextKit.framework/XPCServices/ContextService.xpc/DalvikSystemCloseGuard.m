@interface DalvikSystemCloseGuard
+ (const)__metadata;
+ (id)getReporter;
+ (void)initialize;
+ (void)setEnabledWithBoolean:(BOOL)a3;
+ (void)setReporterWithDalvikSystemCloseGuard_Reporter:(id)a3;
- (void)close;
- (void)dealloc;
- (void)openWithNSString:(id)a3;
- (void)warnIfOpen;
@end

@implementation DalvikSystemCloseGuard

+ (void)setEnabledWithBoolean:(BOOL)a3
{
  if ((atomic_load_explicit(DalvikSystemCloseGuard__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  atomic_store(a3, byte_100560CD0);
}

+ (void)setReporterWithDalvikSystemCloseGuard_Reporter:(id)a3
{
}

+ (id)getReporter
{
  if ((atomic_load_explicit(DalvikSystemCloseGuard__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (id)atomic_load((unint64_t *)&qword_100560CD8);
}

- (void)openWithNSString:(id)a3
{
  if (!a3)
  {
    v12 = new_JavaLangNullPointerException_initWithNSString_(@"closer == null");
    objc_exception_throw(v12);
  }
  if ((DalvikSystemCloseGuard *)qword_100560CC8 != self)
  {
    unsigned __int8 v9 = atomic_load(byte_100560CD0);
    if (v9)
    {
      v10 = (__CFString *)JreStrcat("$$$", (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, @"Explicit termination method '");
      v11 = new_JavaLangThrowable_initWithNSString_(v10);
      JreStrongAssignAndConsume((id *)&self->allocationSite_, v11);
    }
  }
}

- (void)close
{
}

- (void)warnIfOpen
{
  if (self->allocationSite_)
  {
    unsigned __int8 v2 = atomic_load(byte_100560CD0);
    if (v2)
    {
      uint64_t v3 = (void *)atomic_load((unint64_t *)&qword_100560CD8);
      if (!v3) {
        JreThrowNullPointerException();
      }
      allocationSite = self->allocationSite_;
      [v3 reportWithNSString:@"A resource was acquired at attached stack trace but never released. See java.io.Closeable for information on avoiding resource leaks." withJavaLangThrowable:allocationSite];
    }
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)DalvikSystemCloseGuard;
  [(DalvikSystemCloseGuard *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    JreStrongAssignAndConsume((id *)&qword_100560CC8, [DalvikSystemCloseGuard alloc]);
    JreVolatileStrongAssignAndConsume(&qword_100560CD8, (unint64_t)[DalvikSystemCloseGuard_DefaultReporter alloc]);
    atomic_store(1u, (unsigned __int8 *)DalvikSystemCloseGuard__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004304B8;
}

@end