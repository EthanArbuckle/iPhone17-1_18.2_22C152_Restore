@interface JavaNioNioUtils
+ (const)__metadata;
+ (id)getFDWithJavaNioChannelsFileChannel:(id)a3;
+ (id)getSocketOptionWithJavaNioFileDescriptorChannel:(id)a3 withJavaUtilSet:(id)a4 withJavaNetSocketOption:(id)a5;
+ (id)newFileChannelWithId:(id)a3 withJavaIoFileDescriptor:(id)a4 withInt:(int)a5;
+ (id)unsafeArrayWithJavaNioByteBuffer:(id)a3;
+ (int)unsafeArrayOffsetWithJavaNioByteBuffer:(id)a3;
+ (void)freeDirectBufferWithJavaNioByteBuffer:(id)a3;
+ (void)setSocketOptionWithJavaNioFileDescriptorChannel:(id)a3 withJavaUtilSet:(id)a4 withJavaNetSocketOption:(id)a5 withId:(id)a6;
@end

@implementation JavaNioNioUtils

+ (void)freeDirectBufferWithJavaNioByteBuffer:(id)a3
{
}

+ (id)getFDWithJavaNioChannelsFileChannel:(id)a3
{
  return JavaNioNioUtils_getFDWithJavaNioChannelsFileChannel_(a3);
}

+ (id)newFileChannelWithId:(id)a3 withJavaIoFileDescriptor:(id)a4 withInt:(int)a5
{
  v5 = new_JavaNioFileChannelImpl_initWithId_withJavaIoFileDescriptor_withInt_(a3, a4, a5);
  return v5;
}

+ (id)unsafeArrayWithJavaNioByteBuffer:(id)a3
{
  return (id)JavaNioNioUtils_unsafeArrayWithJavaNioByteBuffer_((uint64_t)a3);
}

+ (int)unsafeArrayOffsetWithJavaNioByteBuffer:(id)a3
{
  return JavaNioNioUtils_unsafeArrayOffsetWithJavaNioByteBuffer_((uint64_t)a3);
}

+ (void)setSocketOptionWithJavaNioFileDescriptorChannel:(id)a3 withJavaUtilSet:(id)a4 withJavaNetSocketOption:(id)a5 withId:(id)a6
{
}

+ (id)getSocketOptionWithJavaNioFileDescriptorChannel:(id)a3 withJavaUtilSet:(id)a4 withJavaNetSocketOption:(id)a5
{
  return JavaNioNioUtils_getSocketOptionWithJavaNioFileDescriptorChannel_withJavaUtilSet_withJavaNetSocketOption_(a3, a4, a5);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004451A0;
}

@end