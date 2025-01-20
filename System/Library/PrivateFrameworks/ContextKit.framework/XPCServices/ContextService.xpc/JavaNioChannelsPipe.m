@interface JavaNioChannelsPipe
+ (const)__metadata;
+ (id)open;
- (id)sink;
- (id)source;
@end

@implementation JavaNioChannelsPipe

+ (id)open
{
  v2 = (void *)JavaNioChannelsSpiSelectorProvider_provider();
  if (!v2) {
    JreThrowNullPointerException();
  }
  return [v2 openPipe];
}

- (id)sink
{
  return 0;
}

- (id)source
{
  return 0;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10047D210;
}

@end