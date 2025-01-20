@interface JavaNioChannelsFileChannel
+ (const)__metadata;
- (JavaNioChannelsFileChannel)init;
- (id)lock;
- (id)lockWithLong:(int64_t)a3 withLong:(int64_t)a4 withBoolean:(BOOL)a5;
- (id)mapWithJavaNioChannelsFileChannel_MapMode:(id)a3 withLong:(int64_t)a4 withLong:(int64_t)a5;
- (id)positionWithLong:(int64_t)a3;
- (id)truncateWithLong:(int64_t)a3;
- (id)tryLock;
- (id)tryLockWithLong:(int64_t)a3 withLong:(int64_t)a4 withBoolean:(BOOL)a5;
- (int)readWithJavaNioByteBuffer:(id)a3;
- (int)readWithJavaNioByteBuffer:(id)a3 withLong:(int64_t)a4;
- (int)writeWithJavaNioByteBuffer:(id)a3;
- (int)writeWithJavaNioByteBuffer:(id)a3 withLong:(int64_t)a4;
- (int64_t)position;
- (int64_t)readWithJavaNioByteBufferArray:(id)a3;
- (int64_t)readWithJavaNioByteBufferArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (int64_t)size;
- (int64_t)transferFromWithJavaNioChannelsReadableByteChannel:(id)a3 withLong:(int64_t)a4 withLong:(int64_t)a5;
- (int64_t)transferToWithLong:(int64_t)a3 withLong:(int64_t)a4 withJavaNioChannelsWritableByteChannel:(id)a5;
- (int64_t)writeWithJavaNioByteBufferArray:(id)a3;
- (int64_t)writeWithJavaNioByteBufferArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)forceWithBoolean:(BOOL)a3;
@end

@implementation JavaNioChannelsFileChannel

- (JavaNioChannelsFileChannel)init
{
  return self;
}

- (void)forceWithBoolean:(BOOL)a3
{
}

- (id)lock
{
  return [(JavaNioChannelsFileChannel *)self lockWithLong:0 withLong:0x7FFFFFFFFFFFFFFFLL withBoolean:0];
}

- (id)lockWithLong:(int64_t)a3 withLong:(int64_t)a4 withBoolean:(BOOL)a5
{
  return 0;
}

- (id)mapWithJavaNioChannelsFileChannel_MapMode:(id)a3 withLong:(int64_t)a4 withLong:(int64_t)a5
{
  return 0;
}

- (int64_t)position
{
  return 0;
}

- (id)positionWithLong:(int64_t)a3
{
  return 0;
}

- (int)readWithJavaNioByteBuffer:(id)a3
{
  return 0;
}

- (int)readWithJavaNioByteBuffer:(id)a3 withLong:(int64_t)a4
{
  return 0;
}

- (int64_t)readWithJavaNioByteBufferArray:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v3 = *((unsigned int *)a3 + 2);
  return [(JavaNioChannelsFileChannel *)self readWithJavaNioByteBufferArray:a3 withInt:0 withInt:v3];
}

- (int64_t)readWithJavaNioByteBufferArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  return 0;
}

- (int64_t)size
{
  return 0;
}

- (int64_t)transferFromWithJavaNioChannelsReadableByteChannel:(id)a3 withLong:(int64_t)a4 withLong:(int64_t)a5
{
  return 0;
}

- (int64_t)transferToWithLong:(int64_t)a3 withLong:(int64_t)a4 withJavaNioChannelsWritableByteChannel:(id)a5
{
  return 0;
}

- (id)truncateWithLong:(int64_t)a3
{
  return 0;
}

- (id)tryLock
{
  return [(JavaNioChannelsFileChannel *)self tryLockWithLong:0 withLong:0x7FFFFFFFFFFFFFFFLL withBoolean:0];
}

- (id)tryLockWithLong:(int64_t)a3 withLong:(int64_t)a4 withBoolean:(BOOL)a5
{
  return 0;
}

- (int)writeWithJavaNioByteBuffer:(id)a3
{
  return 0;
}

- (int)writeWithJavaNioByteBuffer:(id)a3 withLong:(int64_t)a4
{
  return 0;
}

- (int64_t)writeWithJavaNioByteBufferArray:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v3 = *((unsigned int *)a3 + 2);
  return [(JavaNioChannelsFileChannel *)self writeWithJavaNioByteBufferArray:a3 withInt:0 withInt:v3];
}

- (int64_t)writeWithJavaNioByteBufferArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  return 0;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10040E1E8;
}

@end