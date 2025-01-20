@interface JavaNetInetAddress
+ (BOOL)isIPv4MappedAddressWithByteArray:(id)a3;
+ (BOOL)isNumericWithNSString:(id)a3;
+ (IOSObjectArray)loopbackAddresses;
+ (const)__metadata;
+ (id)badAddressLengthWithByteArray:(id)a3;
+ (id)bytesToInetAddressesWithByteArray2:(id)a3 withNSString:(id)a4;
+ (id)disallowDeprecatedFormatsWithNSString:(id)a3 withJavaNetInetAddress:(id)a4;
+ (id)getAllByNameImplWithNSString:(id)a3;
+ (id)getAllByNameWithNSString:(id)a3;
+ (id)getByAddressWithByteArray:(id)a3;
+ (id)getByAddressWithNSString:(id)a3 withByteArray:(id)a4;
+ (id)getByAddressWithNSString:(id)a3 withByteArray:(id)a4 withInt:(int)a5;
+ (id)getByNameWithNSString:(id)a3;
+ (id)getHostByAddrImplWithJavaNetInetAddress:(id)a3;
+ (id)ipv4MappedToIPv4WithByteArray:(id)a3;
+ (id)lookupHostByNameWithNSString:(id)a3;
+ (id)makeInetAddressWithByteArray:(id)a3 withNSString:(id)a4;
+ (id)parseNumericAddressNoThrowWithNSString:(id)a3;
+ (id)parseNumericAddressWithNSString:(id)a3;
+ (void)initialize;
- (BOOL)isAnyLocalAddress;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLinkLocalAddress;
- (BOOL)isLoopbackAddress;
- (BOOL)isMCGlobal;
- (BOOL)isMCLinkLocal;
- (BOOL)isMCNodeLocal;
- (BOOL)isMCOrgLocal;
- (BOOL)isMCSiteLocal;
- (BOOL)isMulticastAddress;
- (BOOL)isReachableWithInt:(int)a3;
- (BOOL)isReachableWithJavaNetInetAddress:(id)a3 withJavaNetInetAddress:(id)a4 withInt:(int)a5;
- (BOOL)isReachableWithJavaNetNetworkInterface:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (BOOL)isSiteLocalAddress;
- (JavaNetInetAddress)initWithInt:(int)a3 withByteArray:(id)a4 withNSString:(id)a5;
- (NSString)description;
- (id)getAddress;
- (id)getCanonicalHostName;
- (id)getHostAddress;
- (id)getHostName;
- (id)readResolve;
- (int)getFamily;
- (unint64_t)hash;
- (void)dealloc;
- (void)readObjectWithJavaIoObjectInputStream:(id)a3;
- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3;
@end

@implementation JavaNetInetAddress

- (JavaNetInetAddress)initWithInt:(int)a3 withByteArray:(id)a4 withNSString:(id)a5
{
  self->family_ = a3;
  JreStrongAssign((id *)&self->ipaddress_, a4);
  JreStrongAssign((id *)&self->hostName_, a5);
  return self;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  ipaddress = self->ipaddress_;
  objc_opt_class();
  if (!a3) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  uint64_t v6 = *((void *)a3 + 1);
  return JavaUtilArrays_equalsWithByteArray_withByteArray_((uint64_t)ipaddress, v6);
}

- (id)getAddress
{
  ipaddress = self->ipaddress_;
  if (!ipaddress) {
    JreThrowNullPointerException();
  }
  return [(IOSArray *)ipaddress clone];
}

+ (id)bytesToInetAddressesWithByteArray2:(id)a3 withNSString:(id)a4
{
  if (atomic_load_explicit(JavaNetInetAddress__initialized, memory_order_acquire))
  {
    if (a3) {
      goto LABEL_3;
    }
LABEL_8:
    JreThrowNullPointerException();
  }
  objc_opt_class();
  if (!a3) {
    goto LABEL_8;
  }
LABEL_3:
  uint64_t v6 = +[IOSObjectArray arrayWithLength:*((int *)a3 + 2) type:JavaNetInetAddress_class_()];
  if (*((int *)a3 + 2) >= 1)
  {
    uint64_t v7 = 0;
    do
    {
      id v8 = sub_1001D5BDC(*((_DWORD **)a3 + v7 + 3), a4);
      IOSObjectArray_Set((uint64_t)v6, v7++, v8);
    }
    while (v7 < *((int *)a3 + 2));
  }
  return v6;
}

+ (id)getAllByNameWithNSString:(id)a3
{
  return JavaNetInetAddress_getAllByNameWithNSString_(a3);
}

+ (id)getAllByNameImplWithNSString:(id)a3
{
  return sub_1001D5A64(a3);
}

+ (id)makeInetAddressWithByteArray:(id)a3 withNSString:(id)a4
{
  return sub_1001D5BDC(a3, a4);
}

+ (id)disallowDeprecatedFormatsWithNSString:(id)a3 withJavaNetInetAddress:(id)a4
{
  return sub_1001D5C84(a3, (uint64_t)a4);
}

+ (id)parseNumericAddressNoThrowWithNSString:(id)a3
{
  return (id)sub_1001D5D60(a3);
}

+ (id)getByNameWithNSString:(id)a3
{
  return JavaNetInetAddress_getByNameWithNSString_(a3);
}

- (id)getHostAddress
{
  if ((atomic_load_explicit(LibcoreIoLibcore__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  v3 = (void *)LibcoreIoLibcore_os_;
  if (!LibcoreIoLibcore_os_) {
    JreThrowNullPointerException();
  }
  return [v3 getnameinfoWithJavaNetInetAddress:self withInt:2];
}

- (id)getHostName
{
  p_hostName = &self->hostName_;
  if (!self->hostName_)
  {
    v3 = (void **)sub_1001D6044((uint64_t)self);
    if (!v3) {
      JreThrowNullPointerException();
    }
    JreStrongAssign((id *)p_hostName, v3[2]);
  }
  return *p_hostName;
}

- (id)getCanonicalHostName
{
  id v2 = sub_1001D6044((uint64_t)self);
  if (!v2) {
    JreThrowNullPointerException();
  }
  return (id)*((void *)v2 + 2);
}

- (unint64_t)hash
{
  return (int)JavaUtilArrays_hashCodeWithByteArray_((uint64_t)self->ipaddress_);
}

+ (id)lookupHostByNameWithNSString:(id)a3
{
  return (id)sub_1001D61CC(a3);
}

+ (id)getHostByAddrImplWithJavaNetInetAddress:(id)a3
{
  return sub_1001D6044((uint64_t)a3);
}

- (NSString)description
{
  if (self->hostName_) {
    hostName = (__CFString *)self->hostName_;
  }
  else {
    hostName = &stru_10048C1F8;
  }
  [(JavaNetInetAddress *)self getHostAddress];
  return (NSString *)JreStrcat("$C$", v3, v4, v5, v6, v7, v8, v9, hostName);
}

+ (BOOL)isNumericWithNSString:(id)a3
{
  return JavaNetInetAddress_isNumericWithNSString_(a3);
}

+ (id)parseNumericAddressWithNSString:(id)a3
{
  return JavaNetInetAddress_parseNumericAddressWithNSString_(a3);
}

- (BOOL)isAnyLocalAddress
{
  return 0;
}

- (BOOL)isLinkLocalAddress
{
  return 0;
}

- (BOOL)isLoopbackAddress
{
  return 0;
}

- (BOOL)isMCGlobal
{
  return 0;
}

- (BOOL)isMCLinkLocal
{
  return 0;
}

- (BOOL)isMCNodeLocal
{
  return 0;
}

- (BOOL)isMCOrgLocal
{
  return 0;
}

- (BOOL)isMCSiteLocal
{
  return 0;
}

- (BOOL)isMulticastAddress
{
  return 0;
}

- (BOOL)isSiteLocalAddress
{
  return 0;
}

- (BOOL)isReachableWithInt:(int)a3
{
  return [(JavaNetInetAddress *)self isReachableWithJavaNetNetworkInterface:0 withInt:0 withInt:*(void *)&a3];
}

- (BOOL)isReachableWithJavaNetNetworkInterface:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  if ((a5 | a4) < 0)
  {
    v17 = new_JavaLangIllegalArgumentException_initWithNSString_(@"ttl < 0 || timeout < 0");
    objc_exception_throw(v17);
  }
  if (a3)
  {
    uint64_t v7 = JavaUtilCollections_listWithJavaUtilEnumeration_([a3 getInetAddresses]);
    if (!v7) {
      JreThrowNullPointerException();
    }
    uint64_t v8 = v7;
    if ([(JavaUtilArrayList *)v7 isEmpty])
    {
      return 0;
    }
    else
    {
      v10 = new_JavaUtilConcurrentCountDownLatch_initWithInt_([(JavaUtilArrayList *)v8 size]);
      v11 = new_JavaUtilConcurrentAtomicAtomicBoolean_initWithBoolean_(0);
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      obj = v8;
      id v12 = [(JavaUtilArrayList *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v20;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v20 != v13) {
              objc_enumerationMutation(obj);
            }
            v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            v16 = [JavaNetInetAddress__1 alloc];
            sub_1001D76E8((uint64_t)v16, self, self, v15, a5, v11, v10);
            [(JavaLangThread *)v16 start];
          }
          id v12 = [(JavaUtilArrayList *)obj countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v12);
      }
      [(JavaUtilConcurrentCountDownLatch *)v10 await];
      return [(JavaUtilConcurrentAtomicAtomicBoolean *)v11 get];
    }
  }
  else
  {
    return sub_1001D6958((uint64_t)self, 0, a5);
  }
}

- (BOOL)isReachableWithJavaNetInetAddress:(id)a3 withJavaNetInetAddress:(id)a4 withInt:(int)a5
{
  return sub_1001D6958((uint64_t)a3, (JavaNetInet6Address *)a4, a5);
}

+ (id)getByAddressWithByteArray:(id)a3
{
  return JavaNetInetAddress_getByAddressWithByteArray_(a3);
}

+ (id)getByAddressWithNSString:(id)a3 withByteArray:(id)a4
{
  return JavaNetInetAddress_getByAddressWithNSString_withByteArray_(a3, a4);
}

+ (id)getByAddressWithNSString:(id)a3 withByteArray:(id)a4 withInt:(int)a5
{
  return JavaNetInetAddress_getByAddressWithNSString_withByteArray_withInt_(a3, a4, a5);
}

+ (id)badAddressLengthWithByteArray:(id)a3
{
}

+ (BOOL)isIPv4MappedAddressWithByteArray:(id)a3
{
  return sub_1001D6CC8((uint64_t)a3);
}

+ (id)ipv4MappedToIPv4WithByteArray:(id)a3
{
  return sub_1001D6DE4((uint64_t)a3);
}

- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3
{
  if (!a3) {
    goto LABEL_12;
  }
  id v5 = [a3 putFields];
  uint64_t v6 = v5;
  ipaddress = self->ipaddress_;
  if (!ipaddress)
  {
    if (v5)
    {
      uint64_t v8 = 0;
      goto LABEL_9;
    }
LABEL_12:
    JreThrowNullPointerException();
  }
  if (!v5) {
    goto LABEL_12;
  }
  if ((atomic_load_explicit(JavaNioByteOrder__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  uint64_t v8 = LibcoreIoMemory_peekIntWithByteArray_withInt_withJavaNioByteOrder_((uint64_t)ipaddress, 0, JavaNioByteOrder_BIG_ENDIAN__);
LABEL_9:
  [v6 putWithNSString:@"address" withInt:v8];
  [v6 putWithNSString:@"family" withInt:self->family_];
  [v6 putWithNSString:@"hostName" withId:self->hostName_];
  [a3 writeFields];
}

- (void)readObjectWithJavaIoObjectInputStream:(id)a3
{
  if (!a3 || (id v4 = [a3 readFields]) == 0) {
    JreThrowNullPointerException();
  }
  id v5 = v4;
  unsigned int v6 = [v4 getWithNSString:@"address" withInt:0];
  JreStrongAssignAndConsume((id *)&self->ipaddress_, +[IOSByteArray newArrayWithLength:4]);
  ipaddress = self->ipaddress_;
  if ((atomic_load_explicit(JavaNioByteOrder__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  LibcoreIoMemory_pokeIntWithByteArray_withInt_withInt_withJavaNioByteOrder_((uint64_t)ipaddress, 0, v6, JavaNioByteOrder_BIG_ENDIAN__);
  id v8 = [v5 getWithNSString:@"hostName" withId:0];
  objc_opt_class();
  if (v8 && (objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  JreStrongAssign((id *)&self->hostName_, v8);
  self->family_ = [v5 getWithNSString:@"family" withInt:2];
}

- (id)readResolve
{
  id v2 = new_JavaNetInet4Address_initWithByteArray_withNSString_(self->ipaddress_, self->hostName_);
  return v2;
}

- (int)getFamily
{
  return self->family_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNetInetAddress;
  [(JavaNetInetAddress *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = new_JavaNetAddressCache_init();
    JreStrongAssignAndConsume((id *)&qword_100560C60, v2);
    objc_super v3 = new_JavaNetInetAddress_initWithInt_withByteArray_withNSString_(0, 0, 0);
    JreStrongAssignAndConsume((id *)&JavaNetInetAddress_UNSPECIFIED_, v3);
    id v4 = +[IOSClass intClass](IOSClass, "intClass", new_JavaIoObjectStreamField_initWithNSString_withIOSClass_(@"address", (JavaLangRefWeakReference *)+[IOSClass intClass]));
    v7[1] = new_JavaIoObjectStreamField_initWithNSString_withIOSClass_(@"family", v4);
    id v5 = (JavaLangRefWeakReference *)NSString_class_();
    v7[2] = new_JavaIoObjectStreamField_initWithNSString_withIOSClass_(@"hostName", v5);
    id v6 = +[IOSObjectArray newArrayWithObjects:v7 count:3 type:JavaIoObjectStreamField_class_()];
    JreStrongAssignAndConsume(&qword_100560C68, v6);
    atomic_store(1u, (unsigned __int8 *)JavaNetInetAddress__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10042DDE8;
}

+ (IOSObjectArray)loopbackAddresses
{
  if ((atomic_load_explicit(JavaNetInetAddress__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if ((atomic_load_explicit(JavaNetInet6Address__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  v1[0] = JavaNetInet6Address_LOOPBACK_;
  if ((atomic_load_explicit(JavaNetInet4Address__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  v1[1] = JavaNetInet4Address_LOOPBACK_;
  return +[IOSObjectArray arrayWithObjects:v1 count:2 type:JavaNetInetAddress_class_()];
}

@end