@interface JavaNetInet6Address
+ (const)__metadata;
+ (id)getByAddressWithNSString:(id)a3 withByteArray:(id)a4 withInt:(int)a5;
+ (id)getByAddressWithNSString:(id)a3 withByteArray:(id)a4 withJavaNetNetworkInterface:(id)a5;
+ (void)initialize;
- (BOOL)compareLocalTypeWithJavaNetInet6Address:(id)a3;
- (BOOL)isAnyLocalAddress;
- (BOOL)isIPv4CompatibleAddress;
- (BOOL)isLinkLocalAddress;
- (BOOL)isLoopbackAddress;
- (BOOL)isMCGlobal;
- (BOOL)isMCLinkLocal;
- (BOOL)isMCNodeLocal;
- (BOOL)isMCOrgLocal;
- (BOOL)isMCSiteLocal;
- (BOOL)isMulticastAddress;
- (BOOL)isSiteLocalAddress;
- (JavaNetInet6Address)initWithByteArray:(id)a3 withNSString:(id)a4 withInt:(int)a5;
- (id)description;
- (id)getScopedInterface;
- (int)getScopeId;
- (void)dealloc;
- (void)readObjectWithJavaIoObjectInputStream:(id)a3;
- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3;
@end

@implementation JavaNetInet6Address

- (JavaNetInet6Address)initWithByteArray:(id)a3 withNSString:(id)a4 withInt:(int)a5
{
  *(_DWORD *)&self->scope_id_set_ = a5;
  *((unsigned char *)&self->super.family_ + 4) = a5 != 0;
  return self;
}

+ (id)getByAddressWithNSString:(id)a3 withByteArray:(id)a4 withInt:(int)a5
{
  return JavaNetInet6Address_getByAddressWithNSString_withByteArray_withInt_(a3, a4, a5);
}

+ (id)getByAddressWithNSString:(id)a3 withByteArray:(id)a4 withJavaNetNetworkInterface:(id)a5
{
  return JavaNetInet6Address_getByAddressWithNSString_withByteArray_withJavaNetNetworkInterface_(a3, a4, a5);
}

- (BOOL)compareLocalTypeWithJavaNetInet6Address:(id)a3
{
  return sub_1001EEEF4(self, a3);
}

- (BOOL)isAnyLocalAddress
{
  if (!JavaNetInet6Address_ANY_) {
    JreThrowNullPointerException();
  }
  ipaddress = self->super.ipaddress_;
  uint64_t v3 = *(void *)(JavaNetInet6Address_ANY_ + 8);
  return JavaUtilArrays_equalsWithByteArray_withByteArray_((uint64_t)ipaddress, v3);
}

- (BOOL)isIPv4CompatibleAddress
{
  uint64_t v3 = 0;
  BOOL v4 = 0;
  do
  {
    ipaddress = self->super.ipaddress_;
    if (!ipaddress) {
      JreThrowNullPointerException();
    }
    uint64_t size = ipaddress->super.size_;
    if (v3 >= size) {
      IOSArray_throwOutOfBoundsWithMsg(size, v3);
    }
    if (*((unsigned char *)&ipaddress->super.size_ + v3 + 4)) {
      break;
    }
    BOOL v4 = (unint64_t)v3++ > 0xA;
  }
  while (v3 != 12);
  return v4;
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
  if (*((unsigned __int8 *)&ipaddress->super.size_ + 4) != 254) {
    return 0;
  }
  v5 = self->super.ipaddress_;
  uint64_t v6 = v5->super.size_;
  if ((int)v6 <= 1) {
    IOSArray_throwOutOfBoundsWithMsg(v6, 1);
  }
  return (*((unsigned char *)&v5->super.size_ + 5) & 0xC0) == 128;
}

- (BOOL)isLoopbackAddress
{
  if (!JavaNetInet6Address_LOOPBACK_) {
    JreThrowNullPointerException();
  }
  ipaddress = self->super.ipaddress_;
  uint64_t v3 = *(void *)(JavaNetInet6Address_LOOPBACK_ + 8);
  return JavaUtilArrays_equalsWithByteArray_withByteArray_((uint64_t)ipaddress, v3);
}

- (BOOL)isMCGlobal
{
  ipaddress = self->super.ipaddress_;
  if (!ipaddress) {
    JreThrowNullPointerException();
  }
  uint64_t size = ipaddress->super.size_;
  if ((int)size <= 0) {
    IOSArray_throwOutOfBoundsWithMsg(size, 0);
  }
  if (*((unsigned __int8 *)&ipaddress->super.size_ + 4) != 255) {
    return 0;
  }
  uint64_t v6 = self->super.ipaddress_;
  uint64_t v7 = v6->super.size_;
  if ((int)v7 <= 1) {
    IOSArray_throwOutOfBoundsWithMsg(v7, 1);
  }
  return (*((unsigned char *)&v6->super.size_ + 5) & 0xF) == 14;
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
  if (*((unsigned __int8 *)&ipaddress->super.size_ + 4) != 255) {
    return 0;
  }
  uint64_t v6 = self->super.ipaddress_;
  uint64_t v7 = v6->super.size_;
  if ((int)v7 <= 1) {
    IOSArray_throwOutOfBoundsWithMsg(v7, 1);
  }
  return (*((unsigned char *)&v6->super.size_ + 5) & 0xF) == 2;
}

- (BOOL)isMCNodeLocal
{
  ipaddress = self->super.ipaddress_;
  if (!ipaddress) {
    JreThrowNullPointerException();
  }
  uint64_t size = ipaddress->super.size_;
  if ((int)size <= 0) {
    IOSArray_throwOutOfBoundsWithMsg(size, 0);
  }
  if (*((unsigned __int8 *)&ipaddress->super.size_ + 4) != 255) {
    return 0;
  }
  uint64_t v6 = self->super.ipaddress_;
  uint64_t v7 = v6->super.size_;
  if ((int)v7 <= 1) {
    IOSArray_throwOutOfBoundsWithMsg(v7, 1);
  }
  return (*((unsigned char *)&v6->super.size_ + 5) & 0xF) == 1;
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
  if (*((unsigned __int8 *)&ipaddress->super.size_ + 4) != 255) {
    return 0;
  }
  uint64_t v6 = self->super.ipaddress_;
  uint64_t v7 = v6->super.size_;
  if ((int)v7 <= 1) {
    IOSArray_throwOutOfBoundsWithMsg(v7, 1);
  }
  return (*((unsigned char *)&v6->super.size_ + 5) & 0xF) == 8;
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
  if (*((unsigned __int8 *)&ipaddress->super.size_ + 4) != 255) {
    return 0;
  }
  uint64_t v6 = self->super.ipaddress_;
  uint64_t v7 = v6->super.size_;
  if ((int)v7 <= 1) {
    IOSArray_throwOutOfBoundsWithMsg(v7, 1);
  }
  return (*((unsigned char *)&v6->super.size_ + 5) & 0xF) == 5;
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
  return *((unsigned __int8 *)&ipaddress->super.size_ + 4) == 255;
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
  if (*((unsigned __int8 *)&ipaddress->super.size_ + 4) != 254) {
    return 0;
  }
  v5 = self->super.ipaddress_;
  uint64_t v6 = v5->super.size_;
  if ((int)v6 <= 1) {
    IOSArray_throwOutOfBoundsWithMsg(v6, 1);
  }
  return *((unsigned __int8 *)&v5->super.size_ + 5) > 0xBFu;
}

- (int)getScopeId
{
  if (*((unsigned char *)&self->super.family_ + 4)) {
    return *(_DWORD *)&self->scope_id_set_;
  }
  else {
    return 0;
  }
}

- (id)getScopedInterface
{
  if (!LOBYTE(self->scope_id_)) {
    return 0;
  }
  id result = *(id *)(&self->scope_ifname_set_ + 4);
  if (result) {
    return JavaNetNetworkInterface_getByNameWithNSString_(result);
  }
  return result;
}

- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3
{
  if (!a3) {
    goto LABEL_10;
  }
  id v5 = [a3 putFields];
  uint64_t v6 = v5;
  ipaddress = self->super.ipaddress_;
  if (!ipaddress)
  {
    if (v5)
    {
      ipaddress = 0;
      goto LABEL_7;
    }
LABEL_10:
    JreThrowNullPointerException();
  }
  if (!v5) {
    goto LABEL_10;
  }
LABEL_7:
  [v5 putWithNSString:@"ipaddress" withId:ipaddress];
  [v6 putWithNSString:@"scope_id" withInt:*(unsigned int *)&self->scope_id_set_];
  [v6 putWithNSString:@"scope_id_set" withBoolean:*((unsigned __int8 *)&self->super.family_ + 4)];
  [v6 putWithNSString:@"scope_ifname_set" withBoolean:LOBYTE(self->scope_id_)];
  [v6 putWithNSString:@"ifname" withId:*(void *)(&self->scope_ifname_set_ + 4)];
  [a3 writeFields];
}

- (void)readObjectWithJavaIoObjectInputStream:(id)a3
{
  if (!a3 || (id v4 = [a3 readFields]) == 0) {
    JreThrowNullPointerException();
  }
  id v5 = v4;
  id v6 = [v4 getWithNSString:@"ipaddress" withId:0];
  objc_opt_class();
  if (v6 && (objc_opt_isKindOfClass() & 1) == 0
    || (JreStrongAssign((id *)&self->super.ipaddress_, v6),
        *(_DWORD *)&self->scope_id_set_ = [v5 getWithNSString:@"scope_id" withInt:0], *((unsigned char *)&self->super.family_ + 4) = objc_msgSend(v5, "getWithNSString:withBoolean:", @"scope_id_set", 0), id v7 = objc_msgSend(v5, "getWithNSString:withId:", @"ifname", 0), objc_opt_class(), v7)&& (objc_opt_isKindOfClass() & 1) == 0)
  {
    JreThrowClassCastException();
  }
  JreStrongAssign((id *)(&self->scope_ifname_set_ + 4), v7);
  LOBYTE(self->scope_id_) = [v5 getWithNSString:@"scope_ifname_set" withBoolean:0];
}

- (id)description
{
  if (*(void *)(&self->scope_ifname_set_ + 4))
  {
    v21.receiver = self;
    v21.super_class = (Class)JavaNetInet6Address;
    v2 = [(JavaNetInetAddress *)&v21 description];
    return (id)JreStrcat("$C$", v3, v4, v5, v6, v7, v8, v9, v2);
  }
  else if (*(_DWORD *)&self->scope_id_set_)
  {
    v20.receiver = self;
    v20.super_class = (Class)JavaNetInet6Address;
    v11 = [(JavaNetInetAddress *)&v20 description];
    return (id)JreStrcat("$CI", v12, v13, v14, v15, v16, v17, v18, v11);
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)JavaNetInet6Address;
    return [(JavaNetInetAddress *)&v19 description];
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNetInet6Address;
  [(JavaNetInetAddress *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v12[0] = 0;
    v12[1] = 0;
    v2 = +[IOSByteArray arrayWithBytes:v12 count:16];
    objc_super v3 = [JavaNetInet6Address alloc];
    JavaNetInetAddress_initWithInt_withByteArray_withNSString_((uint64_t)v3, 30, v2, 0);
    *(_DWORD *)&v3->scope_id_set_ = 0;
    *((unsigned char *)&v3->super.family_ + 4) = 0;
    JreStrongAssignAndConsume((id *)&JavaNetInet6Address_ANY_, v3);
    memset(v11, 0, 15);
    v11[15] = 1;
    uint64_t v4 = +[IOSByteArray arrayWithBytes:v11 count:16];
    uint64_t v5 = [JavaNetInet6Address alloc];
    JavaNetInetAddress_initWithInt_withByteArray_withNSString_((uint64_t)v5, 30, v4, @"localhost");
    *(_DWORD *)&v5->scope_id_set_ = 0;
    *((unsigned char *)&v5->super.family_ + 4) = 0;
    JreStrongAssignAndConsume((id *)&JavaNetInet6Address_LOOPBACK_, v5);
    uint64_t v6 = (JavaLangRefWeakReference *)IOSClass_arrayType((uint64_t)+[IOSClass byteClass], 1u);
    uint64_t v7 = +[IOSClass intClass];
    v10[1] = new_JavaIoObjectStreamField_initWithNSString_withIOSClass_(@"scope_id", v7);
    v10[2] = new_JavaIoObjectStreamField_initWithNSString_withIOSClass_(@"scope_id_set", (JavaLangRefWeakReference *)+[IOSClass BOOLeanClass]);
    v10[3] = new_JavaIoObjectStreamField_initWithNSString_withIOSClass_(@"scope_ifname_set", (JavaLangRefWeakReference *)+[IOSClass BOOLeanClass]);
    uint64_t v8 = (JavaLangRefWeakReference *)NSString_class_();
    v10[4] = new_JavaIoObjectStreamField_initWithNSString_withIOSClass_(@"ifname", v8);
    id v9 = +[IOSObjectArray newArrayWithObjects:v10 count:5 type:JavaIoObjectStreamField_class_()];
    JreStrongAssignAndConsume(&qword_100560D90, v9);
    atomic_store(1u, (unsigned __int8 *)JavaNetInet6Address__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100439950;
}

@end