@interface LibcoreIoIoBridge
+ (BOOL)BOOLeanFromIntWithInt:(int)a3;
+ (BOOL)isConnectedWithJavaIoFileDescriptor:(id)a3 withJavaNetInetAddress:(id)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7;
+ (BOOL)isDirectoryWithNSString:(id)a3;
+ (const)__metadata;
+ (id)connectDetailWithJavaNetInetAddress:(id)a3 withInt:(int)a4 withInt:(int)a5 withLibcoreIoErrnoException:(id)a6;
+ (id)getSocketLocalAddressWithJavaIoFileDescriptor:(id)a3;
+ (id)getSocketOptionErrnoWithJavaIoFileDescriptor:(id)a3 withInt:(int)a4;
+ (id)getSocketOptionWithJavaIoFileDescriptor:(id)a3 withInt:(int)a4;
+ (id)openWithNSString:(id)a3 withInt:(int)a4;
+ (id)socketWithBoolean:(BOOL)a3;
+ (int)BOOLeanToIntWithBoolean:(BOOL)a3;
+ (int)availableWithJavaIoFileDescriptor:(id)a3;
+ (int)getGroupSourceReqOpWithInt:(int)a3;
+ (int)getSocketLocalPortWithJavaIoFileDescriptor:(id)a3;
+ (int)maybeThrowAfterRecvfromWithBoolean:(BOOL)a3 withBoolean:(BOOL)a4 withLibcoreIoErrnoException:(id)a5;
+ (int)maybeThrowAfterSendtoWithBoolean:(BOOL)a3 withLibcoreIoErrnoException:(id)a4;
+ (int)postRecvfromWithBoolean:(BOOL)a3 withJavaNetDatagramPacket:(id)a4 withBoolean:(BOOL)a5 withJavaNetInetSocketAddress:(id)a6 withInt:(int)a7;
+ (int)readWithJavaIoFileDescriptor:(id)a3 withByteArray:(id)a4 withInt:(int)a5 withInt:(int)a6;
+ (int)recvfromWithBoolean:(BOOL)a3 withJavaIoFileDescriptor:(id)a4 withByteArray:(id)a5 withInt:(int)a6 withInt:(int)a7 withInt:(int)a8 withJavaNetDatagramPacket:(id)a9 withBoolean:(BOOL)a10;
+ (int)recvfromWithBoolean:(BOOL)a3 withJavaIoFileDescriptor:(id)a4 withJavaNioByteBuffer:(id)a5 withInt:(int)a6 withJavaNetDatagramPacket:(id)a7 withBoolean:(BOOL)a8;
+ (int)sendtoWithJavaIoFileDescriptor:(id)a3 withByteArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7 withJavaNetInetAddress:(id)a8 withInt:(int)a9;
+ (int)sendtoWithJavaIoFileDescriptor:(id)a3 withJavaNioByteBuffer:(id)a4 withInt:(int)a5 withJavaNetInetAddress:(id)a6 withInt:(int)a7;
+ (void)bindWithJavaIoFileDescriptor:(id)a3 withJavaNetInetAddress:(id)a4 withInt:(int)a5;
+ (void)closeSocketWithJavaIoFileDescriptor:(id)a3;
+ (void)connectErrnoWithJavaIoFileDescriptor:(id)a3 withJavaNetInetAddress:(id)a4 withInt:(int)a5 withInt:(int)a6;
+ (void)connectWithJavaIoFileDescriptor:(id)a3 withJavaNetInetAddress:(id)a4 withInt:(int)a5;
+ (void)connectWithJavaIoFileDescriptor:(id)a3 withJavaNetInetAddress:(id)a4 withInt:(int)a5 withInt:(int)a6;
+ (void)setSocketOptionErrnoWithJavaIoFileDescriptor:(id)a3 withInt:(int)a4 withId:(id)a5;
+ (void)setSocketOptionWithJavaIoFileDescriptor:(id)a3 withInt:(int)a4 withId:(id)a5;
+ (void)writeWithJavaIoFileDescriptor:(id)a3 withByteArray:(id)a4 withInt:(int)a5 withInt:(int)a6;
@end

@implementation LibcoreIoIoBridge

+ (int)availableWithJavaIoFileDescriptor:(id)a3
{
  return LibcoreIoIoBridge_availableWithJavaIoFileDescriptor_((uint64_t)a3);
}

+ (void)bindWithJavaIoFileDescriptor:(id)a3 withJavaNetInetAddress:(id)a4 withInt:(int)a5
{
}

+ (void)connectWithJavaIoFileDescriptor:(id)a3 withJavaNetInetAddress:(id)a4 withInt:(int)a5
{
}

+ (void)connectWithJavaIoFileDescriptor:(id)a3 withJavaNetInetAddress:(id)a4 withInt:(int)a5 withInt:(int)a6
{
}

+ (void)connectErrnoWithJavaIoFileDescriptor:(id)a3 withJavaNetInetAddress:(id)a4 withInt:(int)a5 withInt:(int)a6
{
}

+ (id)connectDetailWithJavaNetInetAddress:(id)a3 withInt:(int)a4 withInt:(int)a5 withLibcoreIoErrnoException:(id)a6
{
  return sub_100275A90((uint64_t)a3, *(uint64_t *)&a4, *(uint64_t *)&a5, a6, *(uint64_t *)&a5, (uint64_t)a6, v6, v7);
}

+ (void)closeSocketWithJavaIoFileDescriptor:(id)a3
{
}

+ (BOOL)isConnectedWithJavaIoFileDescriptor:(id)a3 withJavaNetInetAddress:(id)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7
{
  return LibcoreIoIoBridge_isConnectedWithJavaIoFileDescriptor_withJavaNetInetAddress_withInt_withInt_withInt_(a3, (uint64_t)a4, *(uint64_t *)&a5, *(uint64_t *)&a6, *(uint64_t *)&a7);
}

+ (id)getSocketOptionWithJavaIoFileDescriptor:(id)a3 withInt:(int)a4
{
  return LibcoreIoIoBridge_getSocketOptionWithJavaIoFileDescriptor_withInt_((uint64_t)a3, *(uint64_t *)&a4, (uint64_t)a3, *(uint64_t *)&a4, v4, v5, v6, v7);
}

+ (id)getSocketOptionErrnoWithJavaIoFileDescriptor:(id)a3 withInt:(int)a4
{
  return sub_100275F60((uint64_t)a3, *(uint64_t *)&a4, (uint64_t)a3, *(uint64_t *)&a4, v4, v5, v6, v7);
}

+ (BOOL)BOOLeanFromIntWithInt:(int)a3
{
  return a3 != 0;
}

+ (int)BOOLeanToIntWithBoolean:(BOOL)a3
{
  return a3;
}

+ (void)setSocketOptionWithJavaIoFileDescriptor:(id)a3 withInt:(int)a4 withId:(id)a5
{
  LibcoreIoIoBridge_setSocketOptionWithJavaIoFileDescriptor_withInt_withId_((uint64_t)a3, *(uint64_t *)&a4, a5, *(uint64_t *)&a4, (uint64_t)a5, v5, v6, v7);
}

+ (void)setSocketOptionErrnoWithJavaIoFileDescriptor:(id)a3 withInt:(int)a4 withId:(id)a5
{
  sub_100276528((uint64_t)a3, *(uint64_t *)&a4, a5, *(uint64_t *)&a4, (uint64_t)a5, v5, v6, v7);
}

+ (int)getGroupSourceReqOpWithInt:(int)a3
{
  return sub_100276FD0(a3, (uint64_t)a2, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
}

+ (id)openWithNSString:(id)a3 withInt:(int)a4
{
  return LibcoreIoIoBridge_openWithNSString_withInt_((uint64_t)a3, *(uint64_t *)&a4);
}

+ (BOOL)isDirectoryWithNSString:(id)a3
{
  uint64_t v3 = [(NSDictionary *)[+[NSFileManager defaultManager] attributesOfItemAtPath:a3 error:0] fileType];
  return [(NSString *)v3 isEqualToString:NSFileTypeDirectory];
}

+ (int)readWithJavaIoFileDescriptor:(id)a3 withByteArray:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  return LibcoreIoIoBridge_readWithJavaIoFileDescriptor_withByteArray_withInt_withInt_((uint64_t)a3, (uint64_t)a4, *(uint64_t *)&a5, *(uint64_t *)&a6);
}

+ (void)writeWithJavaIoFileDescriptor:(id)a3 withByteArray:(id)a4 withInt:(int)a5 withInt:(int)a6
{
}

+ (int)sendtoWithJavaIoFileDescriptor:(id)a3 withByteArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7 withJavaNetInetAddress:(id)a8 withInt:(int)a9
{
  return LibcoreIoIoBridge_sendtoWithJavaIoFileDescriptor_withByteArray_withInt_withInt_withInt_withJavaNetInetAddress_withInt_((uint64_t)a3, (uint64_t)a4, *(uint64_t *)&a5, *(uint64_t *)&a6, *(uint64_t *)&a7, (uint64_t)a8, a9);
}

+ (int)sendtoWithJavaIoFileDescriptor:(id)a3 withJavaNioByteBuffer:(id)a4 withInt:(int)a5 withJavaNetInetAddress:(id)a6 withInt:(int)a7
{
  return LibcoreIoIoBridge_sendtoWithJavaIoFileDescriptor_withJavaNioByteBuffer_withInt_withJavaNetInetAddress_withInt_((uint64_t)a3, a4, *(uint64_t *)&a5, (uint64_t)a6, *(uint64_t *)&a7);
}

+ (int)maybeThrowAfterSendtoWithBoolean:(BOOL)a3 withLibcoreIoErrnoException:(id)a4
{
  return 0;
}

+ (int)recvfromWithBoolean:(BOOL)a3 withJavaIoFileDescriptor:(id)a4 withByteArray:(id)a5 withInt:(int)a6 withInt:(int)a7 withInt:(int)a8 withJavaNetDatagramPacket:(id)a9 withBoolean:(BOOL)a10
{
  return LibcoreIoIoBridge_recvfromWithBoolean_withJavaIoFileDescriptor_withByteArray_withInt_withInt_withInt_withJavaNetDatagramPacket_withBoolean_(a3, (uint64_t)a4, (uint64_t)a5, *(uint64_t *)&a6, *(uint64_t *)&a7, *(uint64_t *)&a8, a9, a10);
}

+ (int)recvfromWithBoolean:(BOOL)a3 withJavaIoFileDescriptor:(id)a4 withJavaNioByteBuffer:(id)a5 withInt:(int)a6 withJavaNetDatagramPacket:(id)a7 withBoolean:(BOOL)a8
{
  return LibcoreIoIoBridge_recvfromWithBoolean_withJavaIoFileDescriptor_withJavaNioByteBuffer_withInt_withJavaNetDatagramPacket_withBoolean_(a3, (uint64_t)a4, (uint64_t)a5, *(uint64_t *)&a6, a7, a8);
}

+ (int)postRecvfromWithBoolean:(BOOL)a3 withJavaNetDatagramPacket:(id)a4 withBoolean:(BOOL)a5 withJavaNetInetSocketAddress:(id)a6 withInt:(int)a7
{
  return sub_1002779A8(a3, a4, a5, a6, *(uint64_t *)&a7);
}

+ (int)maybeThrowAfterRecvfromWithBoolean:(BOOL)a3 withBoolean:(BOOL)a4 withLibcoreIoErrnoException:(id)a5
{
  return 0;
}

+ (id)socketWithBoolean:(BOOL)a3
{
  return LibcoreIoIoBridge_socketWithBoolean_(a3);
}

+ (id)getSocketLocalAddressWithJavaIoFileDescriptor:(id)a3
{
  return LibcoreIoIoBridge_getSocketLocalAddressWithJavaIoFileDescriptor_((uint64_t)a3);
}

+ (int)getSocketLocalPortWithJavaIoFileDescriptor:(id)a3
{
  return LibcoreIoIoBridge_getSocketLocalPortWithJavaIoFileDescriptor_((uint64_t)a3);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100477AE0;
}

@end