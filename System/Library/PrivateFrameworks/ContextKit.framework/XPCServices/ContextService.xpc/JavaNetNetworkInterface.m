@interface JavaNetNetworkInterface
+ (IOSObjectArray)getInterfaceNames;
+ (JavaUtilArrayList)getNetworkInterfacesList;
+ (const)__metadata;
+ (id)getByIndexWithInt:(int)a3;
+ (id)getByInetAddressWithJavaNetInetAddress:(id)a3;
+ (id)getByNameWithNSString:(id)a3;
+ (id)getIpv6AddressesWithNSString:(id)a3;
+ (id)getNetworkInterfaces;
+ (id)makeSocketErrnoExceptionWithNSString:(id)a3 withInt:(int)a4;
+ (id)rethrowAsSocketExceptionWithJavaLangException:(id)a3;
+ (int)getInterfaceIndexWithNSString:(id)a3;
+ (int)ipv6NetmaskToPrefixLengthWithByteArray:(id)a3;
+ (void)collectIpv4AddressWithNSString:(id)a3 withJavaUtilList:(id)a4 withJavaUtilList:(id)a5;
+ (void)collectIpv6AddressesWithNSString:(id)a3 withInt:(int)a4 withJavaUtilList:(id)a5 withJavaUtilList:(id)a6;
- (BOOL)hasFlagWithInt:(int)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLoopback;
- (BOOL)isPointToPoint;
- (BOOL)isUp;
- (BOOL)isVirtual;
- (BOOL)supportsMulticast;
- (JavaNetNetworkInterface)initWithNSString:(id)a3 withInt:(int)a4 withJavaUtilList:(id)a5 withJavaUtilList:(id)a6;
- (id)description;
- (id)getDisplayName;
- (id)getHardwareAddress;
- (id)getInetAddresses;
- (id)getInterfaceAddresses;
- (id)getName;
- (id)getParent;
- (id)getSubInterfaces;
- (int)getIndex;
- (int)getMTU;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation JavaNetNetworkInterface

- (JavaNetNetworkInterface)initWithNSString:(id)a3 withInt:(int)a4 withJavaUtilList:(id)a5 withJavaUtilList:(id)a6
{
  return self;
}

- (int)getIndex
{
  return self->interfaceIndex_;
}

- (id)getName
{
  return self->name_;
}

- (id)getInetAddresses
{
  return JavaUtilCollections_enumerationWithJavaUtilCollection_(self->addresses_);
}

- (id)getDisplayName
{
  return self->name_;
}

+ (id)getByNameWithNSString:(id)a3
{
  return JavaNetNetworkInterface_getByNameWithNSString_(a3);
}

+ (id)rethrowAsSocketExceptionWithJavaLangException:(id)a3
{
  v4 = new_JavaNetSocketException_init();
  [(JavaLangThrowable *)v4 initCauseWithJavaLangThrowable:a3];
  objc_exception_throw(v4);
}

+ (id)getByInetAddressWithJavaNetInetAddress:(id)a3
{
  return (id)JavaNetNetworkInterface_getByInetAddressWithJavaNetInetAddress_((uint64_t)a3);
}

+ (id)getByIndexWithInt:(int)a3
{
  return JavaNetNetworkInterface_getByIndexWithInt_(*(uint64_t *)&a3);
}

+ (id)getNetworkInterfaces
{
  v2 = +[JavaNetNetworkInterface getNetworkInterfacesList]_0();
  return JavaUtilCollections_enumerationWithJavaUtilCollection_(v2);
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v6) = 1;
    return v6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_12;
  }
  objc_opt_class();
  if (!a3) {
    goto LABEL_16;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  if (self->interfaceIndex_ != *((_DWORD *)a3 + 4))
  {
LABEL_12:
    LOBYTE(v6) = 0;
    return v6;
  }
  name = self->name_;
  if (!name) {
    goto LABEL_16;
  }
  unsigned int v6 = [(NSString *)name isEqual:*((void *)a3 + 1)];
  if (!v6) {
    return v6;
  }
  addresses = self->addresses_;
  if (!addresses) {
LABEL_16:
  }
    JreThrowNullPointerException();
  uint64_t v8 = *((void *)a3 + 4);
  LOBYTE(v6) = [(JavaUtilList *)addresses isEqual:v8];
  return v6;
}

- (unint64_t)hash
{
  name = self->name_;
  if (!name) {
    JreThrowNullPointerException();
  }
  return (int)[(NSString *)name hash];
}

- (id)description
{
  v3 = new_JavaLangStringBuilder_initWithInt_(0x19u);
  [(JavaLangStringBuilder *)v3 appendWithNSString:@"["];
  [(JavaLangStringBuilder *)v3 appendWithNSString:self->name_];
  [(JavaLangStringBuilder *)v3 appendWithNSString:@"]["];
  [(JavaLangStringBuilder *)v3 appendWithInt:self->interfaceIndex_];
  [(JavaLangStringBuilder *)v3 appendWithNSString:@"]"];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  addresses = self->addresses_;
  if (!addresses) {
LABEL_11:
  }
    JreThrowNullPointerException();
  id v5 = [(JavaUtilList *)addresses countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(addresses);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        [(JavaLangStringBuilder *)v3 appendWithNSString:@"[", (void)v11];
        if (!v9) {
          goto LABEL_11;
        }
        -[JavaLangStringBuilder appendWithNSString:](v3, "appendWithNSString:", [v9 description]);
        [(JavaLangStringBuilder *)v3 appendWithNSString:@"]"];
      }
      id v6 = [(JavaUtilList *)addresses countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  return [(JavaLangStringBuilder *)v3 description];
}

- (id)getInterfaceAddresses
{
  return JavaUtilCollections_unmodifiableListWithJavaUtilList_(self->interfaceAddresses_);
}

- (id)getSubInterfaces
{
  return JavaUtilCollections_enumerationWithJavaUtilCollection_(self->children_);
}

- (id)getParent
{
  return self->parent_;
}

- (BOOL)isUp
{
  return sub_1001DAAEC((uint64_t)self, 1);
}

- (BOOL)isLoopback
{
  return sub_1001DAAEC((uint64_t)self, 8);
}

- (BOOL)isPointToPoint
{
  return sub_1001DAAEC((uint64_t)self, 16);
}

- (BOOL)supportsMulticast
{
  return sub_1001DAAEC((uint64_t)self, 0x8000);
}

- (BOOL)hasFlagWithInt:(int)a3
{
  return sub_1001DAAEC((uint64_t)self, a3);
}

- (id)getHardwareAddress
{
  v2 = [(NSString *)self->name_ UTF8String];
  if (!v2) {
    return 0;
  }
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = sub_1001DACD0;
  v10 = sub_1001DACE0;
  uint64_t v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001DACEC;
  v5[3] = &unk_10042F5E0;
  v5[4] = &v6;
  sub_1001DAD88(v2, (uint64_t)v5);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int)getMTU
{
  if (self->name_)
  {
    int v3 = socket(2, 2, 0);
    if (v3 < 0)
    {
      unsigned int v7 = *__error();
      uint64_t v8 = @"socket";
    }
    else
    {
      int v4 = v3;
      long long v10 = 0u;
      long long v11 = 0u;
      [(NSString *)self->name_ UTF8String];
      __strcpy_chk();
      int v5 = ioctl(v4, 0xC0206933uLL, &v10);
      close(v4);
      if ((v5 & 0x80000000) == 0) {
        return v11;
      }
      unsigned int v7 = *__error();
      uint64_t v8 = @"ioctl";
    }
    v9 = sub_1001DAF24(v8, v7);
    objc_exception_throw(v9);
  }
  return 0;
}

- (BOOL)isVirtual
{
  return self->parent_ != 0;
}

+ (int)getInterfaceIndexWithNSString:(id)a3
{
  int v3 = (const char *)[a3 UTF8String];
  return if_nametoindex(v3);
}

+ (id)makeSocketErrnoExceptionWithNSString:(id)a3 withInt:(int)a4
{
  return sub_1001DAF24(a3, a4);
}

+ (void)collectIpv6AddressesWithNSString:(id)a3 withInt:(int)a4 withJavaUtilList:(id)a5 withJavaUtilList:(id)a6
{
}

+ (id)getIpv6AddressesWithNSString:(id)a3
{
  return sub_1001DB0F0(a3);
}

+ (int)ipv6NetmaskToPrefixLengthWithByteArray:(id)a3
{
  return sub_1001DB288((uint64_t)a3);
}

+ (void)collectIpv4AddressWithNSString:(id)a3 withJavaUtilList:(id)a4 withJavaUtilList:(id)a5
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNetNetworkInterface;
  [(JavaNetNetworkInterface *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10042FD80;
}

+ (JavaUtilArrayList)getNetworkInterfacesList
{
  v0 = +[JavaNetNetworkInterface getInterfaceNames]_0();
  if (!v0) {
LABEL_64:
  }
    JreThrowNullPointerException();
  v1 = v0;
  uint64_t size = v0->super.size_;
  if (qword_100560CC0 != -1) {
    dispatch_once(&qword_100560CC0, &stru_10042FDF0);
  }
  objc_super v3 = +[IOSObjectArray arrayWithLength:size type:qword_100560CB8];
  int v4 = +[IOSBooleanArray arrayWithLength:v3->super.size_];
  if (v1->super.size_ >= 1)
  {
    uint64_t v5 = 0;
    do
    {
      uint64_t v6 = JavaNetNetworkInterface_getByNameWithNSString_((&v1->elementType_)[v5]);
      IOSObjectArray_Set((uint64_t)v3, v5, v6);
      uint64_t v7 = v3->super.size_;
      if (v5 >= v7) {
        IOSArray_throwOutOfBoundsWithMsg(v7, v5);
      }
      if (!(&v3->elementType_)[v5])
      {
        uint64_t v8 = v4->super.size_;
        if (v5 >= v8) {
          IOSArray_throwOutOfBoundsWithMsg(v8, v5);
        }
        *((unsigned char *)&v4->super.size_ + v5 + 4) = 1;
      }
      ++v5;
    }
    while (v5 < v1->super.size_);
  }
  v9 = new_JavaUtilArrayList_init();
  v17 = v9;
  if (v3->super.size_ >= 1)
  {
    uint64_t v18 = 0;
    v43 = v9;
    do
    {
      uint64_t v19 = v4->super.size_;
      if (v18 >= v19) {
        IOSArray_throwOutOfBoundsWithMsg(v19, v18);
      }
      if (!*((unsigned char *)&v4->super.size_ + v18 + 4))
      {
        uint64_t v20 = v3->super.size_;
        if (v18 >= (int)v20)
        {
          uint64_t v40 = (int)v20;
        }
        else
        {
          v21 = &v3->super.super.isa + v18;
          uint64_t v22 = v18;
          do
          {
            uint64_t v23 = v4->super.size_;
            if (v22 >= v23) {
              IOSArray_throwOutOfBoundsWithMsg(v23, v22);
            }
            if (!*((unsigned char *)&v4->super.size_ + v22 + 4))
            {
              uint64_t v24 = v3->super.size_;
              if (v22 >= v24) {
                IOSArray_throwOutOfBoundsWithMsg(v24, v22);
              }
              v25 = (&v3->elementType_)[v22];
              if (!v25) {
                goto LABEL_64;
              }
              Class isa = v25[1].super.isa;
              if (!isa) {
                goto LABEL_64;
              }
              uint64_t v27 = v3->super.size_;
              if (v18 >= v27) {
                IOSArray_throwOutOfBoundsWithMsg(v27, v18);
              }
              Class v28 = v21[3];
              if (!v28) {
                goto LABEL_64;
              }
              if ([(objc_class *)isa hasPrefix:JreStrcat("$C", v10, v11, v12, v13, v14, v15, v16, *((id *)v28 + 1))])
              {
                uint64_t v29 = v3->super.size_;
                if (v18 >= v29) {
                  IOSArray_throwOutOfBoundsWithMsg(v29, v18);
                }
                Class v30 = v21[3];
                if (!v30 || !*((void *)v30 + 5)) {
                  goto LABEL_64;
                }
                uint64_t v31 = v3->super.size_;
                if (v22 >= v31) {
                  IOSArray_throwOutOfBoundsWithMsg(v31, v22);
                }
                [*((id *)v30 + 5) addWithId:(&v3->elementType_)[v22]];
                uint64_t v32 = v3->super.size_;
                if (v22 >= v32) {
                  IOSArray_throwOutOfBoundsWithMsg(v32, v22);
                }
                v33 = (&v3->elementType_)[v22];
                if (!v33) {
                  goto LABEL_64;
                }
                uint64_t v34 = v3->super.size_;
                if (v18 >= v34) {
                  IOSArray_throwOutOfBoundsWithMsg(v34, v18);
                }
                JreStrongAssign((id *)&v33[6].super.isa, v21[3]);
                uint64_t v35 = v3->super.size_;
                if (v18 >= v35) {
                  IOSArray_throwOutOfBoundsWithMsg(v35, v18);
                }
                Class v36 = v21[3];
                if (!v36 || !*((void *)v36 + 4)) {
                  goto LABEL_64;
                }
                uint64_t v37 = v3->super.size_;
                if (v22 >= v37) {
                  IOSArray_throwOutOfBoundsWithMsg(v37, v22);
                }
                v38 = (&v3->elementType_)[v22];
                if (!v38) {
                  goto LABEL_64;
                }
                [*((id *)v36 + 4) addAllWithJavaUtilCollection:v38[4].super.isa];
                uint64_t v39 = v4->super.size_;
                if (v22 >= v39) {
                  IOSArray_throwOutOfBoundsWithMsg(v39, v22);
                }
                *((unsigned char *)&v4->super.size_ + v22 + 4) = 1;
              }
            }
            ++v22;
            uint64_t v20 = v3->super.size_;
          }
          while (v22 < (int)v20);
          uint64_t v40 = (int)v20;
          v17 = v43;
        }
        if (v18 >= v40) {
          IOSArray_throwOutOfBoundsWithMsg(v20, v18);
        }
        [(JavaUtilArrayList *)v17 addWithId:(&v3->elementType_)[v18]];
        uint64_t v41 = v4->super.size_;
        if (v18 >= v41) {
          IOSArray_throwOutOfBoundsWithMsg(v41, v18);
        }
        *((unsigned char *)&v4->super.size_ + v18 + 4) = 1;
      }
      ++v18;
    }
    while (v18 < v3->super.size_);
  }
  return v17;
}

+ (IOSObjectArray)getInterfaceNames
{
  id v0 = +[NSMutableArray array];
  int v4 = 0;
  int v1 = getifaddrs(&v4);
  v2 = v4;
  if (!v1 && v4)
  {
    do
    {
      if (v2->ifa_addr->sa_family == 2) {
        objc_msgSend(v0, "addObject:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v2->ifa_name));
      }
      v2 = v2->ifa_next;
    }
    while (v2);
    v2 = v4;
  }
  freeifaddrs(v2);
  return +[IOSObjectArray arrayWithNSArray:v0 type:NSString_class_()];
}

@end