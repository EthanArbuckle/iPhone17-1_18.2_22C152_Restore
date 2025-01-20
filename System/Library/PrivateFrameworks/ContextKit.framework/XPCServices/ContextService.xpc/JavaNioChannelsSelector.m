@interface JavaNioChannelsSelector
+ (const)__metadata;
+ (id)open;
- (BOOL)isOpen;
- (id)keys;
- (id)provider;
- (id)selectedKeys;
- (id)wakeup;
- (int)select;
- (int)selectNow;
- (int)selectWithLong:(int64_t)a3;
- (void)close;
@end

@implementation JavaNioChannelsSelector

+ (id)open
{
  v2 = (void *)JavaNioChannelsSpiSelectorProvider_provider();
  if (!v2) {
    JreThrowNullPointerException();
  }
  return [v2 openSelector];
}

- (void)close
{
}

- (BOOL)isOpen
{
  return 0;
}

- (id)keys
{
  return 0;
}

- (id)provider
{
  return 0;
}

- (int)select
{
  return 0;
}

- (int)selectWithLong:(int64_t)a3
{
  return 0;
}

- (id)selectedKeys
{
  return 0;
}

- (int)selectNow
{
  return 0;
}

- (id)wakeup
{
  return 0;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100482E68;
}

@end