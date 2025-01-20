@interface JavaNioChannelsSpiSelectorProvider
+ (const)__metadata;
+ (id)loadProviderByJar;
+ (void)initialize;
- (id)inheritedChannel;
- (id)openDatagramChannel;
- (id)openPipe;
- (id)openSelector;
- (id)openServerSocketChannel;
- (id)openSocketChannel;
@end

@implementation JavaNioChannelsSpiSelectorProvider

- (id)openDatagramChannel
{
  return 0;
}

- (id)openPipe
{
  return 0;
}

- (id)openSelector
{
  return 0;
}

- (id)openServerSocketChannel
{
  return 0;
}

- (id)openSocketChannel
{
  return 0;
}

- (id)inheritedChannel
{
  return 0;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    JreStrongAssign((id *)&qword_100561020, 0);
    atomic_store(1u, (unsigned __int8 *)JavaNioChannelsSpiSelectorProvider__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100451280;
}

+ (id)loadProviderByJar
{
  if ((atomic_load_explicit(JavaNioChannelsSpiSelectorProvider__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  memset(v3, 0, sizeof(v3));
  v0 = (void *)JavaNioChannelsSpiSelectorProvider_class_();
  v1 = JavaUtilServiceLoader_load__WithIOSClass_(v0);
  if (!v1) {
    JreThrowNullPointerException();
  }
  id result = [(JavaUtilServiceLoader *)v1 countByEnumeratingWithState:v3 objects:v4 count:16];
  if (result) {
    return (id)**((void **)&v3[0] + 1);
  }
  return result;
}

@end