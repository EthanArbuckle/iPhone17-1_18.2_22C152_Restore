@interface JavaNioChannelsFileChannel_MapMode
+ (const)__metadata;
+ (void)initialize;
- (JavaNioChannelsFileChannel_MapMode)initWithNSString:(id)a3;
- (id)description;
- (void)dealloc;
@end

@implementation JavaNioChannelsFileChannel_MapMode

- (JavaNioChannelsFileChannel_MapMode)initWithNSString:(id)a3
{
  return self;
}

- (id)description
{
  return self->displayName_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNioChannelsFileChannel_MapMode;
  [(JavaNioChannelsFileChannel_MapMode *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [JavaNioChannelsFileChannel_MapMode alloc];
    JreStrongAssign((id *)&v2->displayName_, @"PRIVATE");
    JreStrongAssignAndConsume((id *)&JavaNioChannelsFileChannel_MapMode_PRIVATE_, v2);
    objc_super v3 = [JavaNioChannelsFileChannel_MapMode alloc];
    JreStrongAssign((id *)&v3->displayName_, @"READ_ONLY");
    JreStrongAssignAndConsume((id *)&JavaNioChannelsFileChannel_MapMode_READ_ONLY_, v3);
    v4 = [JavaNioChannelsFileChannel_MapMode alloc];
    JreStrongAssign((id *)&v4->displayName_, @"READ_WRITE");
    JreStrongAssignAndConsume((id *)&JavaNioChannelsFileChannel_MapMode_READ_WRITE_, v4);
    atomic_store(1u, (unsigned __int8 *)JavaNioChannelsFileChannel_MapMode__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10040E398;
}

@end