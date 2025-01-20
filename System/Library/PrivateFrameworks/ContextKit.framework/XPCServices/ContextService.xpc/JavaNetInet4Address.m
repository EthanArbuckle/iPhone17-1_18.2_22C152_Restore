@interface JavaNetInet4Address
+ (const)__metadata;
+ (void)initialize;
- (BOOL)isAnyLocalAddress;
- (BOOL)isLinkLocalAddress;
- (BOOL)isLoopbackAddress;
- (BOOL)isMCGlobal;
- (BOOL)isMCLinkLocal;
- (BOOL)isMCNodeLocal;
- (BOOL)isMCOrgLocal;
- (BOOL)isMCSiteLocal;
- (BOOL)isMulticastAddress;
- (BOOL)isSiteLocalAddress;
- (JavaNetInet4Address)initWithByteArray:(id)a3 withNSString:(id)a4;
- (id)writeReplace;
@end

@implementation JavaNetInet4Address

- (JavaNetInet4Address)initWithByteArray:(id)a3 withNSString:(id)a4
{
  return self;
}

- (BOOL)isAnyLocalAddress
{
  ipaddress = self->super.ipaddress_;
  if (!ipaddress) {
    JreThrowNullPointerException();
  }
  uint64_t size = ipaddress->super.size_;
  if ((int)size <= 0) {
    IOSArray_throwOutOfBoundsWithMsg(size, 0);
  }
  if (*((unsigned char *)&ipaddress->super.size_ + 4)) {
    return 0;
  }
  v5 = self->super.ipaddress_;
  uint64_t v6 = v5->super.size_;
  if ((int)v6 <= 1) {
    IOSArray_throwOutOfBoundsWithMsg(v6, 1);
  }
  if (*((unsigned char *)&v5->super.size_ + 5)) {
    return 0;
  }
  v7 = self->super.ipaddress_;
  uint64_t v8 = v7->super.size_;
  if ((int)v8 <= 2) {
    IOSArray_throwOutOfBoundsWithMsg(v8, 2);
  }
  if (*((unsigned char *)&v7->super.size_ + 6)) {
    return 0;
  }
  v10 = self->super.ipaddress_;
  uint64_t v11 = v10->super.size_;
  if ((int)v11 <= 3) {
    IOSArray_throwOutOfBoundsWithMsg(v11, 3);
  }
  return *((unsigned char *)&v10->super.size_ + 7) == 0;
}

- (BOOL)isLinkLocalAddress
{
  ipaddress = self->super.ipaddress_;
  if (!ipaddress) {
    JreThrowNullPointerException();
  }
  uint64_t size = ipaddress->super.size_;
  if ((int)size <= 0) {
    IOSArray_throwOutOfBoundsWithMsg(size, 0);
  }
  if (*((unsigned __int8 *)&ipaddress->super.size_ + 4) != 169) {
    return 0;
  }
  v5 = self->super.ipaddress_;
  uint64_t v6 = v5->super.size_;
  if ((int)v6 <= 1) {
    IOSArray_throwOutOfBoundsWithMsg(v6, 1);
  }
  return *((unsigned __int8 *)&v5->super.size_ + 5) == 254;
}

- (BOOL)isLoopbackAddress
{
  ipaddress = self->super.ipaddress_;
  if (!ipaddress) {
    JreThrowNullPointerException();
  }
  uint64_t size = ipaddress->super.size_;
  if ((int)size <= 0) {
    IOSArray_throwOutOfBoundsWithMsg(size, 0);
  }
  return *((unsigned char *)&ipaddress->super.size_ + 4) == 127;
}

- (BOOL)isMCGlobal
{
  BOOL v3 = [(JavaNetInet4Address *)self isMulticastAddress];
  if (v3)
  {
    ipaddress = self->super.ipaddress_;
    if ((atomic_load_explicit(JavaNioByteOrder__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    LOBYTE(v3) = LibcoreIoMemory_peekIntWithByteArray_withInt_withJavaNioByteOrder_((uint64_t)ipaddress, 0, JavaNioByteOrder_BIG_ENDIAN__)+ 536870656 < 0xEFFFF00;
  }
  return v3;
}

- (BOOL)isMCLinkLocal
{
  ipaddress = self->super.ipaddress_;
  if (!ipaddress) {
    JreThrowNullPointerException();
  }
  uint64_t size = ipaddress->super.size_;
  if ((int)size <= 0) {
    IOSArray_throwOutOfBoundsWithMsg(size, 0);
  }
  if (*((unsigned __int8 *)&ipaddress->super.size_ + 4) != 224) {
    return 0;
  }
  v5 = self->super.ipaddress_;
  uint64_t v6 = v5->super.size_;
  if ((int)v6 <= 1) {
    IOSArray_throwOutOfBoundsWithMsg(v6, 1);
  }
  if (*((unsigned char *)&v5->super.size_ + 5)) {
    return 0;
  }
  uint64_t v8 = self->super.ipaddress_;
  uint64_t v9 = v8->super.size_;
  if ((int)v9 <= 2) {
    IOSArray_throwOutOfBoundsWithMsg(v9, 2);
  }
  return *((unsigned char *)&v8->super.size_ + 6) == 0;
}

- (BOOL)isMCNodeLocal
{
  return 0;
}

- (BOOL)isMCOrgLocal
{
  ipaddress = self->super.ipaddress_;
  if (!ipaddress) {
    JreThrowNullPointerException();
  }
  uint64_t size = ipaddress->super.size_;
  if ((int)size <= 0) {
    IOSArray_throwOutOfBoundsWithMsg(size, 0);
  }
  if (*((unsigned __int8 *)&ipaddress->super.size_ + 4) != 239) {
    return 0;
  }
  v5 = self->super.ipaddress_;
  uint64_t v6 = v5->super.size_;
  if ((int)v6 <= 1) {
    IOSArray_throwOutOfBoundsWithMsg(v6, 1);
  }
  return (*((unsigned char *)&v5->super.size_ + 5) & 0xFC) == 192;
}

- (BOOL)isMCSiteLocal
{
  ipaddress = self->super.ipaddress_;
  if (!ipaddress) {
    JreThrowNullPointerException();
  }
  uint64_t size = ipaddress->super.size_;
  if ((int)size <= 0) {
    IOSArray_throwOutOfBoundsWithMsg(size, 0);
  }
  if (*((unsigned __int8 *)&ipaddress->super.size_ + 4) != 239) {
    return 0;
  }
  v5 = self->super.ipaddress_;
  uint64_t v6 = v5->super.size_;
  if ((int)v6 <= 1) {
    IOSArray_throwOutOfBoundsWithMsg(v6, 1);
  }
  return *((unsigned __int8 *)&v5->super.size_ + 5) == 255;
}

- (BOOL)isMulticastAddress
{
  ipaddress = self->super.ipaddress_;
  if (!ipaddress) {
    JreThrowNullPointerException();
  }
  uint64_t size = ipaddress->super.size_;
  if ((int)size <= 0) {
    IOSArray_throwOutOfBoundsWithMsg(size, 0);
  }
  return (*(unsigned char *)(&ipaddress->super.size_ + 1) & 0xF0) == 224;
}

- (BOOL)isSiteLocalAddress
{
  ipaddress = self->super.ipaddress_;
  if (!ipaddress) {
    JreThrowNullPointerException();
  }
  uint64_t size = ipaddress->super.size_;
  if ((int)size <= 0) {
    IOSArray_throwOutOfBoundsWithMsg(size, 0);
  }
  if (*((unsigned char *)&ipaddress->super.size_ + 4) == 10) {
    return 1;
  }
  v5 = self->super.ipaddress_;
  uint64_t v6 = v5->super.size_;
  if ((int)v6 <= 0) {
    IOSArray_throwOutOfBoundsWithMsg(v6, 0);
  }
  v7 = self->super.ipaddress_;
  if (*((unsigned __int8 *)&v5->super.size_ + 4) == 172)
  {
    uint64_t v8 = v5->super.size_;
    if ((int)v8 <= 1) {
      IOSArray_throwOutOfBoundsWithMsg(v8, 1);
    }
    if ((*((unsigned char *)&v5->super.size_ + 5) & 0xF0) == 0x10) {
      return 1;
    }
    v7 = self->super.ipaddress_;
  }
  uint64_t v9 = v7->super.size_;
  if ((int)v9 <= 0) {
    IOSArray_throwOutOfBoundsWithMsg(v9, 0);
  }
  if (*((unsigned __int8 *)&v7->super.size_ + 4) == 192)
  {
    v10 = self->super.ipaddress_;
    uint64_t v11 = v10->super.size_;
    if ((int)v11 <= 1) {
      IOSArray_throwOutOfBoundsWithMsg(v11, 1);
    }
    if (*((unsigned __int8 *)&v10->super.size_ + 5) == 168) {
      return 1;
    }
  }
  return 0;
}

- (id)writeReplace
{
  ipaddress = self->super.ipaddress_;
  hostName = self->super.hostName_;
  v4 = [JavaNetInet4Address alloc];
  JavaNetInetAddress_initWithInt_withByteArray_withNSString_((uint64_t)v4, 2, ipaddress, hostName);
  return v4;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    int v10 = 0;
    v2 = +[IOSByteArray arrayWithBytes:&v10 count:4];
    BOOL v3 = [JavaNetInet4Address alloc];
    JavaNetInetAddress_initWithInt_withByteArray_withNSString_((uint64_t)v3, 2, v2, 0);
    JreStrongAssignAndConsume((id *)&JavaNetInet4Address_ANY_, v3);
    int v9 = -1;
    v4 = +[IOSByteArray arrayWithBytes:&v9 count:4];
    v5 = [JavaNetInet4Address alloc];
    JavaNetInetAddress_initWithInt_withByteArray_withNSString_((uint64_t)v5, 2, v4, 0);
    JreStrongAssignAndConsume(&JavaNetInet4Address_ALL_, v5);
    int v8 = 16777343;
    uint64_t v6 = +[IOSByteArray arrayWithBytes:&v8 count:4];
    v7 = [JavaNetInet4Address alloc];
    JavaNetInetAddress_initWithInt_withByteArray_withNSString_((uint64_t)v7, 2, v6, @"localhost");
    JreStrongAssignAndConsume((id *)&JavaNetInet4Address_LOOPBACK_, v7);
    atomic_store(1u, (unsigned __int8 *)JavaNetInet4Address__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004050F0;
}

@end