@interface JavaNioChannelsSelectionKey
+ (const)__metadata;
- (BOOL)isAcceptable;
- (BOOL)isConnectable;
- (BOOL)isReadable;
- (BOOL)isValid;
- (BOOL)isWritable;
- (JavaNioChannelsSelectionKey)init;
- (id)attachWithId:(id)a3;
- (id)attachment;
- (id)channel;
- (id)interestOpsWithInt:(int)a3;
- (id)selector;
- (int)interestOps;
- (int)readyOps;
- (void)__javaClone;
- (void)cancel;
- (void)dealloc;
@end

@implementation JavaNioChannelsSelectionKey

- (JavaNioChannelsSelectionKey)init
{
  return self;
}

- (id)attachWithId:(id)a3
{
  p_attachment = (unint64_t *)&self->attachment_;
  v4 = (void *)atomic_load(p_attachment);
  JreVolatileStrongAssign((atomic_ullong *)p_attachment, a3);
  return v4;
}

- (id)attachment
{
  return (id)atomic_load((unint64_t *)&self->attachment_);
}

- (void)cancel
{
}

- (id)channel
{
  return 0;
}

- (int)interestOps
{
  return 0;
}

- (id)interestOpsWithInt:(int)a3
{
  return 0;
}

- (BOOL)isAcceptable
{
  return ([(JavaNioChannelsSelectionKey *)self readyOps] >> 4) & 1;
}

- (BOOL)isConnectable
{
  return ([(JavaNioChannelsSelectionKey *)self readyOps] >> 3) & 1;
}

- (BOOL)isReadable
{
  return [(JavaNioChannelsSelectionKey *)self readyOps] & 1;
}

- (BOOL)isValid
{
  return 0;
}

- (BOOL)isWritable
{
  return ([(JavaNioChannelsSelectionKey *)self readyOps] >> 2) & 1;
}

- (int)readyOps
{
  return 0;
}

- (id)selector
{
  return 0;
}

- (void)dealloc
{
  JreReleaseVolatile(&self->attachment_);
  v3.receiver = self;
  v3.super_class = (Class)JavaNioChannelsSelectionKey;
  [(JavaNioChannelsSelectionKey *)&v3 dealloc];
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNioChannelsSelectionKey;
  [(JavaNioChannelsSelectionKey *)&v3 __javaClone];
  JreRetainVolatile(&self->attachment_);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100467BD8;
}

@end