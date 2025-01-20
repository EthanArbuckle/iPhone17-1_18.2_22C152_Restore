@interface JavaNioFileChannelImpl
+ (const)__metadata;
+ (int)calculateTotalRemainingWithJavaNioByteBufferArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withBoolean:(BOOL)a6;
+ (int64_t)translateLockLengthWithLong:(int64_t)a3;
+ (void)initialize;
- (JavaNioFileChannelImpl)initWithId:(id)a3 withJavaIoFileDescriptor:(id)a4 withInt:(int)a5;
- (id)basicLockWithLong:(int64_t)a3 withLong:(int64_t)a4 withBoolean:(BOOL)a5 withBoolean:(BOOL)a6;
- (id)getFD;
- (id)lockWithLong:(int64_t)a3 withLong:(int64_t)a4 withBoolean:(BOOL)a5;
- (id)mapWithJavaNioChannelsFileChannel_MapMode:(id)a3 withLong:(int64_t)a4 withLong:(int64_t)a5;
- (id)positionWithLong:(int64_t)a3;
- (id)truncateWithLong:(int64_t)a3;
- (id)tryLockWithLong:(int64_t)a3 withLong:(int64_t)a4 withBoolean:(BOOL)a5;
- (int)readImplWithJavaNioByteBuffer:(id)a3 withLong:(int64_t)a4;
- (int)readWithJavaNioByteBuffer:(id)a3;
- (int)readWithJavaNioByteBuffer:(id)a3 withLong:(int64_t)a4;
- (int)transferIoVecWithJavaNioIoVec:(id)a3;
- (int)writeImplWithJavaNioByteBuffer:(id)a3 withLong:(int64_t)a4;
- (int)writeWithJavaNioByteBuffer:(id)a3;
- (int)writeWithJavaNioByteBuffer:(id)a3 withLong:(int64_t)a4;
- (int64_t)position;
- (int64_t)readWithJavaNioByteBufferArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (int64_t)size;
- (int64_t)transferFromWithJavaNioChannelsReadableByteChannel:(id)a3 withLong:(int64_t)a4 withLong:(int64_t)a5;
- (int64_t)transferToWithLong:(int64_t)a3 withLong:(int64_t)a4 withJavaNioChannelsWritableByteChannel:(id)a5;
- (int64_t)writeWithJavaNioByteBufferArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)__javaClone;
- (void)addLockWithJavaNioChannelsFileLock:(id)a3;
- (void)dealloc;
- (void)forceWithBoolean:(BOOL)a3;
- (void)implCloseChannel;
- (void)release__WithJavaNioChannelsFileLock:(id)a3;
- (void)removeLockWithJavaNioChannelsFileLock:(id)a3;
@end

@implementation JavaNioFileChannelImpl

- (JavaNioFileChannelImpl)initWithId:(id)a3 withJavaIoFileDescriptor:(id)a4 withInt:(int)a5
{
  return self;
}

- (void)implCloseChannel
{
  v3 = (void *)JavaIoCloseable_class_();
  p_stream = &self->stream_;
  if ([v3 isInstance:objc_loadWeak(p_stream)])
  {
    id Weak = objc_loadWeak(p_stream);
    v6 = (void *)JavaIoCloseable_class_();
    if (!Weak) {
      JreThrowNullPointerException();
    }
    if (([v6 isInstance:Weak] & 1) == 0) {
      JreThrowClassCastException();
    }
    [Weak close];
  }
}

- (id)basicLockWithLong:(int64_t)a3 withLong:(int64_t)a4 withBoolean:(BOOL)a5 withBoolean:(BOOL)a6
{
  return sub_100233E24((uint64_t)self, a3, a4, a5, a6, a6, v6, v7);
}

+ (int64_t)translateLockLengthWithLong:(int64_t)a3
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&JavaNioFileChannelImpl__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  else {
    return a3;
  }
}

- (id)lockWithLong:(int64_t)a3 withLong:(int64_t)a4 withBoolean:(BOOL)a5
{
  BOOL v5 = a5;
  -[JavaNioDatagramChannelImpl checkOpen]_0(self);
  [(JavaNioChannelsSpiAbstractInterruptibleChannel *)self begin];
  v12 = sub_100233E24((uint64_t)self, a3, a4, v5, 1, v9, v10, v11);
  [(JavaNioChannelsSpiAbstractInterruptibleChannel *)self endWithBoolean:1];
  return v12;
}

- (id)tryLockWithLong:(int64_t)a3 withLong:(int64_t)a4 withBoolean:(BOOL)a5
{
  BOOL v5 = a5;
  -[JavaNioDatagramChannelImpl checkOpen]_0(self);
  return sub_100233E24((uint64_t)self, a3, a4, v5, 0, v9, v10, v11);
}

- (void)release__WithJavaNioChannelsFileLock:(id)a3
{
  -[JavaNioDatagramChannelImpl checkOpen]_0(self);
  BOOL v5 = new_LibcoreIoStructFlock_init();
  v5->l_type_ = 2;
  v5->l_whence_ = 0;
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v6 = v5;
  v5->l_start_ = (int64_t)[a3 position];
  id v7 = [a3 size];
  if ((atomic_load_explicit((atomic_uchar *volatile)&JavaNioFileChannelImpl__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL) {
    int64_t v8 = 0;
  }
  else {
    int64_t v8 = (int64_t)v7;
  }
  v6->l_len_ = v8;
  if ((atomic_load_explicit(LibcoreIoLibcore__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (!LibcoreIoLibcore_os_) {
    JreThrowNullPointerException();
  }
  [(id)LibcoreIoLibcore_os_ fcntlFlockWithJavaIoFileDescriptor:self->fd_ withInt:9 withLibcoreIoStructFlock:v6];
  sub_100234368(self, (uint64_t)a3);
}

- (void)forceWithBoolean:(BOOL)a3
{
  BOOL v3 = a3;
  -[JavaNioDatagramChannelImpl checkOpen]_0(self);
  if ((self->mode_ & 3) != 0)
  {
    unsigned __int8 explicit = atomic_load_explicit(LibcoreIoLibcore__initialized, memory_order_acquire);
    if (v3)
    {
      if ((explicit & 1) == 0) {
        objc_opt_class();
      }
      if (LibcoreIoLibcore_os_)
      {
        [(id)LibcoreIoLibcore_os_ fsyncWithJavaIoFileDescriptor:self->fd_];
        return;
      }
LABEL_12:
      JreThrowNullPointerException();
    }
    if ((explicit & 1) == 0) {
      objc_opt_class();
    }
    if (!LibcoreIoLibcore_os_) {
      goto LABEL_12;
    }
    [(id)LibcoreIoLibcore_os_ fdatasyncWithJavaIoFileDescriptor:self->fd_];
  }
}

- (id)mapWithJavaNioChannelsFileChannel_MapMode:(id)a3 withLong:(int64_t)a4 withLong:(int64_t)a5
{
  return sub_1002344E4((uint64_t)self, a3, a4, a5);
}

- (int64_t)position
{
  if ((atomic_load_explicit(LibcoreIoLibcore__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (!LibcoreIoLibcore_os_) {
    JreThrowNullPointerException();
  }
  return (int64_t)[(id)LibcoreIoLibcore_os_ lseekWithJavaIoFileDescriptor:self->fd_ withLong:0 withInt:1];
}

- (id)positionWithLong:(int64_t)a3
{
  -[JavaNioDatagramChannelImpl checkOpen]_0(self);
  if (a3 < 0)
  {
    CFStringRef v13 = JreStrcat("$J", v5, v6, v7, v8, v9, v10, v11, @"position: ");
    v14 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v13);
    objc_exception_throw(v14);
  }
  if ((atomic_load_explicit(LibcoreIoLibcore__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (!LibcoreIoLibcore_os_) {
    JreThrowNullPointerException();
  }
  [(id)LibcoreIoLibcore_os_ lseekWithJavaIoFileDescriptor:self->fd_ withLong:a3 withInt:0];
  return self;
}

- (int)readWithJavaNioByteBuffer:(id)a3 withLong:(int64_t)a4
{
  if (a4 < 0)
  {
    CFStringRef v10 = JreStrcat("$J", (uint64_t)a2, (uint64_t)a3, a4, v4, v5, v6, v7, @"position: ");
    uint64_t v11 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v10);
    objc_exception_throw(v11);
  }
  return sub_1002349BC(self, a3, a4);
}

- (int)readWithJavaNioByteBuffer:(id)a3
{
  return sub_1002349BC(self, a3, -1);
}

- (int)readImplWithJavaNioByteBuffer:(id)a3 withLong:(int64_t)a4
{
  return sub_1002349BC(self, a3, a4);
}

- (int)transferIoVecWithJavaNioIoVec:(id)a3
{
  return sub_100234BC4(self, a3);
}

- (int64_t)readWithJavaNioByteBufferArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  JavaUtilArrays_checkOffsetAndCountWithInt_withInt_withInt_(*((unsigned int *)a3 + 2), a4, a5);
  -[JavaNioDatagramChannelImpl checkOpen]_0(self);
  sub_100233D0C((uint64_t)self);
  if ((atomic_load_explicit(JavaNioIoVec_DirectionEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  uint64_t v9 = new_JavaNioIoVec_initWithJavaNioByteBufferArray_withInt_withInt_withJavaNioIoVec_DirectionEnum_(a3, a4, a5, (void *)JavaNioIoVec_DirectionEnum_values_[0]);
  return (int)sub_100234BC4(self, v9);
}

- (int64_t)size
{
  -[JavaNioDatagramChannelImpl checkOpen]_0(self);
  if ((atomic_load_explicit(LibcoreIoLibcore__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (!LibcoreIoLibcore_os_
    || (BOOL v3 = [(id)LibcoreIoLibcore_os_ fstatWithJavaIoFileDescriptor:self->fd_]) == 0)
  {
    JreThrowNullPointerException();
  }
  return v3[7];
}

- (int64_t)transferFromWithJavaNioChannelsReadableByteChannel:(id)a3 withLong:(int64_t)a4 withLong:(int64_t)a5
{
  -[JavaNioDatagramChannelImpl checkOpen]_0(self);
  if (!a3) {
    goto LABEL_15;
  }
  if (([a3 isOpen] & 1) == 0)
  {
    v30 = new_JavaNioChannelsClosedChannelException_init();
    goto LABEL_19;
  }
  sub_100233D48((uint64_t)self);
  if (a5 > 0x7FFFFFFF || (a5 | a4) < 0)
  {
    CFStringRef v31 = JreStrcat("$J$J", v9, v10, v11, v12, v13, v14, v15, @"position=");
    v30 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v31);
LABEL_19:
    objc_exception_throw(v30);
  }
  if ([(JavaNioFileChannelImpl *)self size] < a4) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v28 = JavaNioByteBuffer_allocateWithInt_(a5, v17, v18, v19, v20, v21, v22, v23);
    [a3 readWithJavaNioByteBuffer:v28];
    if (v28)
    {
      [(JavaNioBuffer *)v28 flip];
      return [(JavaNioFileChannelImpl *)self writeWithJavaNioByteBuffer:v28 withLong:a4];
    }
LABEL_15:
    JreThrowNullPointerException();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  v24 = [a3 size];
  v25 = [a3 position];
  uint64_t v26 = JavaLangMath_minWithLong_withLong_(a5, v24 - v25);
  if ((atomic_load_explicit(JavaNioChannelsFileChannel_MapMode__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  id v27 = objc_msgSend(a3, "mapWithJavaNioChannelsFileChannel_MapMode:withLong:withLong:", JavaNioChannelsFileChannel_MapMode_READ_ONLY_, v25, v26);
  [a3 positionWithLong:&v25[v26]];
  int64_t v16 = [(JavaNioFileChannelImpl *)self writeWithJavaNioByteBuffer:v27 withLong:a4];
  JavaNioNioUtils_freeDirectBufferWithJavaNioByteBuffer_(v27);
  return v16;
}

- (int64_t)transferToWithLong:(int64_t)a3 withLong:(int64_t)a4 withJavaNioChannelsWritableByteChannel:(id)a5
{
  -[JavaNioDatagramChannelImpl checkOpen]_0(self);
  if (!a5) {
    JreThrowNullPointerException();
  }
  if (([a5 isOpen] & 1) == 0)
  {
    uint64_t v23 = new_JavaNioChannelsClosedChannelException_init();
    goto LABEL_25;
  }
  sub_100233D0C((uint64_t)self);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_21;
    }
    sub_100233D48((uint64_t)a5);
  }
  if ((a4 | a3) < 0)
  {
    CFStringRef v24 = JreStrcat("$J$J", v9, v10, v11, v12, v13, v14, v15, @"position=");
    uint64_t v23 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v24);
LABEL_25:
    objc_exception_throw(v23);
  }
  if (!a4 || [(JavaNioFileChannelImpl *)self size] <= a3) {
    return 0;
  }
  uint64_t v16 = JavaLangMath_minWithLong_withLong_(a4, [(JavaNioFileChannelImpl *)self size] - a3);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v17 = [a5 getFD];
      [(JavaNioChannelsSpiAbstractInterruptibleChannel *)self begin];
      uint64_t v18 = new_LibcoreUtilMutableLong_initWithLong_(a3);
      if ((atomic_load_explicit(LibcoreIoLibcore__initialized, memory_order_acquire) & 1) == 0)
      {
        uint64_t v22 = v18;
        objc_opt_class();
        uint64_t v18 = v22;
      }
      if (!LibcoreIoLibcore_os_) {
        JreThrowNullPointerException();
      }
      int64_t v19 = (int64_t)[(id)LibcoreIoLibcore_os_ sendfileWithJavaIoFileDescriptor:v17 withJavaIoFileDescriptor:self->fd_ withLibcoreUtilMutableLong:v18 withLong:v16];
      [(JavaNioChannelsSpiAbstractInterruptibleChannel *)self endWithBoolean:1];
      return v19;
    }
LABEL_21:
    JreThrowClassCastException();
  }
  if ((atomic_load_explicit(JavaNioChannelsFileChannel_MapMode__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  uint64_t v20 = sub_1002344E4((uint64_t)self, (void *)JavaNioChannelsFileChannel_MapMode_READ_ONLY_, a3, v16);
  int64_t v19 = (int)[a5 writeWithJavaNioByteBuffer:v20];
  JavaNioNioUtils_freeDirectBufferWithJavaNioByteBuffer_(v20);
  return v19;
}

- (id)truncateWithLong:(int64_t)a3
{
  -[JavaNioDatagramChannelImpl checkOpen]_0(self);
  if (a3 < 0)
  {
    CFStringRef v13 = JreStrcat("$J", v5, v6, v7, v8, v9, v10, v11, @"size < 0: ");
    uint64_t v14 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v13);
    objc_exception_throw(v14);
  }
  sub_100233D48((uint64_t)self);
  if ([(JavaNioFileChannelImpl *)self size] > a3)
  {
    if ((atomic_load_explicit(LibcoreIoLibcore__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    if (!LibcoreIoLibcore_os_) {
      JreThrowNullPointerException();
    }
    [(id)LibcoreIoLibcore_os_ ftruncateWithJavaIoFileDescriptor:self->fd_ withLong:a3];
  }
  if ([(JavaNioFileChannelImpl *)self position] > a3) {
    [(JavaNioFileChannelImpl *)self positionWithLong:a3];
  }
  return self;
}

- (int)writeWithJavaNioByteBuffer:(id)a3 withLong:(int64_t)a4
{
  if (a4 < 0)
  {
    CFStringRef v10 = JreStrcat("$J", (uint64_t)a2, (uint64_t)a3, a4, v4, v5, v6, v7, @"position < 0: ");
    uint64_t v11 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v10);
    objc_exception_throw(v11);
  }
  return sub_1002354B0(self, a3, a4);
}

- (int)writeWithJavaNioByteBuffer:(id)a3
{
  return sub_1002354B0(self, a3, -1);
}

- (int)writeImplWithJavaNioByteBuffer:(id)a3 withLong:(int64_t)a4
{
  return sub_1002354B0(self, a3, a4);
}

- (int64_t)writeWithJavaNioByteBufferArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  JavaUtilArrays_checkOffsetAndCountWithInt_withInt_withInt_(*((unsigned int *)a3 + 2), a4, a5);
  -[JavaNioDatagramChannelImpl checkOpen]_0(self);
  sub_100233D48((uint64_t)self);
  if ((atomic_load_explicit(JavaNioIoVec_DirectionEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  uint64_t v9 = new_JavaNioIoVec_initWithJavaNioByteBufferArray_withInt_withInt_withJavaNioIoVec_DirectionEnum_(a3, a4, a5, (void *)qword_100563EC0);
  return (int)sub_100234BC4(self, v9);
}

+ (int)calculateTotalRemainingWithJavaNioByteBufferArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withBoolean:(BOOL)a6
{
  return JavaNioFileChannelImpl_calculateTotalRemainingWithJavaNioByteBufferArray_withInt_withInt_withBoolean_((uint64_t)a3, a4, a5, a6);
}

- (id)getFD
{
  return self->fd_;
}

- (void)addLockWithJavaNioChannelsFileLock:(id)a3
{
}

- (void)removeLockWithJavaNioChannelsFileLock:(id)a3
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNioFileChannelImpl;
  [(JavaNioChannelsSpiAbstractInterruptibleChannel *)&v3 dealloc];
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNioFileChannelImpl;
  [(JavaNioFileChannelImpl *)&v3 __javaClone];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    JreStrongAssignAndConsume((id *)&qword_1005610A8, [JavaNioFileChannelImpl__1 alloc]);
    atomic_store(1u, (unsigned __int8 *)&JavaNioFileChannelImpl__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100457668;
}

- (void).cxx_destruct
{
}

@end