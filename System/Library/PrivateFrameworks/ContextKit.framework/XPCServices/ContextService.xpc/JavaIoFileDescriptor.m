@interface JavaIoFileDescriptor
+ (const)__metadata;
+ (void)initialize;
- (BOOL)valid;
- (JavaIoFileDescriptor)init;
- (id)description;
- (int)getInt$;
- (void)setInt$WithInt:(int)a3;
- (void)sync;
@end

@implementation JavaIoFileDescriptor

- (JavaIoFileDescriptor)init
{
  self->descriptor_ = -1;
  return self;
}

- (void)sync
{
  if ((atomic_load_explicit(LibcoreIoLibcore__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (!LibcoreIoLibcore_os_) {
    JreThrowNullPointerException();
  }
  unsigned int v3 = [(id)LibcoreIoLibcore_os_ isattyWithJavaIoFileDescriptor:self];
  unsigned __int8 explicit = atomic_load_explicit(LibcoreIoLibcore__initialized, memory_order_acquire);
  if (v3)
  {
    if ((explicit & 1) == 0) {
      objc_opt_class();
    }
    [(id)LibcoreIoLibcore_os_ tcdrainWithJavaIoFileDescriptor:self];
  }
  else
  {
    if ((explicit & 1) == 0) {
      objc_opt_class();
    }
    [(id)LibcoreIoLibcore_os_ fsyncWithJavaIoFileDescriptor:self];
  }
}

- (BOOL)valid
{
  return self->descriptor_ != -1;
}

- (int)getInt$
{
  return self->descriptor_;
}

- (void)setInt$WithInt:(int)a3
{
  self->descriptor_ = a3;
}

- (id)description
{
  return (id)JreStrcat("$IC", (uint64_t)a2, v2, v3, v4, v5, v6, v7, @"FileDescriptor[");
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = [JavaIoFileDescriptor alloc];
    v2->descriptor_ = -1;
    JreStrongAssignAndConsume((id *)&JavaIoFileDescriptor_in_, v2);
    uint64_t v3 = [JavaIoFileDescriptor alloc];
    v3->descriptor_ = -1;
    JreStrongAssignAndConsume((id *)&JavaIoFileDescriptor_out_, v3);
    uint64_t v4 = [JavaIoFileDescriptor alloc];
    v4->descriptor_ = -1;
    JreStrongAssignAndConsume((id *)&JavaIoFileDescriptor_err_, v4);
    *(_DWORD *)(JavaIoFileDescriptor_in_ + 8) = 0;
    *(_DWORD *)(JavaIoFileDescriptor_out_ + 8) = 1;
    *(_DWORD *)(JavaIoFileDescriptor_err_ + 8) = 2;
    atomic_store(1u, (unsigned __int8 *)JavaIoFileDescriptor__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100476B90;
}

@end