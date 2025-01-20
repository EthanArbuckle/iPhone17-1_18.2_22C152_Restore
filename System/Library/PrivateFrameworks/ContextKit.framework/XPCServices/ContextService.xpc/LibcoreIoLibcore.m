@interface LibcoreIoLibcore
+ (const)__metadata;
+ (void)initialize;
@end

@implementation LibcoreIoLibcore

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = new_LibcoreIoPosix_init();
    JreStrongAssignAndConsume((id *)&LibcoreIoLibcore_os_, v2);
    atomic_store(1u, (unsigned __int8 *)LibcoreIoLibcore__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004540D8;
}

@end