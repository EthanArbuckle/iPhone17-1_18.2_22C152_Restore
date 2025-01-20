@interface JavaNioChannelsFileLock
+ (const)__metadata;
- (BOOL)isShared;
- (BOOL)isValid;
- (BOOL)overlapsWithLong:(int64_t)a3 withLong:(int64_t)a4;
- (JavaNioChannelsFileLock)initWithJavaNioChannelsFileChannel:(id)a3 withLong:(int64_t)a4 withLong:(int64_t)a5 withBoolean:(BOOL)a6;
- (NSString)description;
- (id)channel;
- (int64_t)position;
- (int64_t)size;
- (void)__javaClone;
- (void)release__;
@end

@implementation JavaNioChannelsFileLock

- (JavaNioChannelsFileLock)initWithJavaNioChannelsFileChannel:(id)a3 withLong:(int64_t)a4 withLong:(int64_t)a5 withBoolean:(BOOL)a6
{
  JavaNioChannelsFileLock_initWithJavaNioChannelsFileChannel_withLong_withLong_withBoolean_((uint64_t)self, a3, a4, a5, a6, a6, v6, v7);
  return self;
}

- (id)channel
{
  return objc_loadWeak((id *)&self->channel_);
}

- (int64_t)position
{
  return self->position_;
}

- (int64_t)size
{
  return self->size_;
}

- (BOOL)isShared
{
  return self->shared_;
}

- (BOOL)overlapsWithLong:(int64_t)a3 withLong:(int64_t)a4
{
  int64_t position = self->position_;
  return position + self->size_ - 1 >= a3 && position <= a3 + a4 - 1;
}

- (BOOL)isValid
{
  return 0;
}

- (void)release__
{
}

- (NSString)description
{
  return (NSString *)JreStrcat("$J$J$ZC", (uint64_t)a2, v2, v3, v4, v5, v6, v7, @"FileLock[position=");
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNioChannelsFileLock;
  [(JavaNioChannelsFileLock *)&v3 __javaClone];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10047BE58;
}

- (void).cxx_destruct
{
}

@end