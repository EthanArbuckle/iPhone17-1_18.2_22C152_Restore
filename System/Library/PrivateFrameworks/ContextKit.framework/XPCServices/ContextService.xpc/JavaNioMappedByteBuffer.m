@interface JavaNioMappedByteBuffer
+ (const)__metadata;
- (BOOL)isLoaded;
- (JavaNioMappedByteBuffer)initWithJavaNioMemoryBlock:(id)a3 withInt:(int)a4 withJavaNioChannelsFileChannel_MapMode:(id)a5 withLong:(int64_t)a6;
- (id)force;
- (id)load__;
- (uint64_t)checkIsMapped;
- (void)dealloc;
@end

@implementation JavaNioMappedByteBuffer

- (JavaNioMappedByteBuffer)initWithJavaNioMemoryBlock:(id)a3 withInt:(int)a4 withJavaNioChannelsFileChannel_MapMode:(id)a5 withLong:(int64_t)a6
{
  JavaNioMappedByteBuffer_initWithJavaNioMemoryBlock_withInt_withJavaNioChannelsFileChannel_MapMode_withLong_((uint64_t)self, a3, *(uint64_t *)&a4, a5, a6, a6, v6, v7);
  return self;
}

- (BOOL)isLoaded
{
  -[JavaNioMappedByteBuffer checkIsMapped]_0((uint64_t)self);
  block = self->block_;
  if (!block) {
    JreThrowNullPointerException();
  }
  int64_t v4 = [(JavaNioMemoryBlock *)block toLong];
  int64_t v5 = [(JavaNioMemoryBlock *)self->block_ getSize];
  if (!v5) {
    return 1;
  }
  int64_t v6 = v5;
  if ((atomic_load_explicit(LibcoreIoLibcore__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (!LibcoreIoLibcore_os_) {
    JreThrowNullPointerException();
  }
  signed int v7 = [(id)LibcoreIoLibcore_os_ sysconfWithInt:29];
  uint64_t v8 = v4 / v7 * v7;
  int64_t v9 = v4 % v7 + v6;
  v10 = +[IOSByteArray arrayWithLength:(int)((v9 + v7 - 1) / v7)];
  if ((atomic_load_explicit(LibcoreIoLibcore__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  [(id)LibcoreIoLibcore_os_ mincoreWithLong:v8 withLong:v9 withByteArray:v10];
  uint64_t size = v10->super.size_;
  if ((int)size < 1) {
    return 1;
  }
  v12 = (char *)(&v10->super.size_ + 1);
  uint64_t v13 = size - 1;
  do
  {
    char v15 = *v12++;
    char v14 = v15;
    BOOL result = v15 & 1;
    BOOL v18 = v13-- != 0;
  }
  while ((v14 & 1) != 0 && v18);
  return result;
}

- (uint64_t)checkIsMapped
{
  if (!*(void *)(result + 48))
  {
    v1 = new_JavaLangUnsupportedOperationException_init();
    objc_exception_throw(v1);
  }
  return result;
}

- (id)load__
{
  -[JavaNioMappedByteBuffer checkIsMapped]_0((uint64_t)self);
  if ((atomic_load_explicit(LibcoreIoLibcore__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (!LibcoreIoLibcore_os_ || (block = self->block_) == 0) {
    JreThrowNullPointerException();
  }
  objc_msgSend((id)LibcoreIoLibcore_os_, "mlockWithLong:withLong:", -[JavaNioMemoryBlock toLong](block, "toLong"), -[JavaNioMemoryBlock getSize](self->block_, "getSize"));
  if ((atomic_load_explicit(LibcoreIoLibcore__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  objc_msgSend((id)LibcoreIoLibcore_os_, "munlockWithLong:withLong:", -[JavaNioMemoryBlock toLong](self->block_, "toLong"), -[JavaNioMemoryBlock getSize](self->block_, "getSize"));
  return self;
}

- (id)force
{
  -[JavaNioMappedByteBuffer checkIsMapped]_0((uint64_t)self);
  mapMode = self->mapMode_;
  if ((atomic_load_explicit(JavaNioChannelsFileChannel_MapMode__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (mapMode == (JavaNioChannelsFileChannel_MapMode *)JavaNioChannelsFileChannel_MapMode_READ_WRITE_)
  {
    if ((atomic_load_explicit(LibcoreIoLibcore__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    if (!LibcoreIoLibcore_os_ || (block = self->block_) == 0) {
      JreThrowNullPointerException();
    }
    objc_msgSend((id)LibcoreIoLibcore_os_, "msyncWithLong:withLong:withInt:", -[JavaNioMemoryBlock toLong](block, "toLong"), -[JavaNioMemoryBlock getSize](self->block_, "getSize"), 16);
  }
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNioMappedByteBuffer;
  [(JavaNioByteBuffer *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1003F6E00;
}

@end