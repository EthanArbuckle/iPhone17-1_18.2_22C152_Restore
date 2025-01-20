@interface IDSSockAddrWrapper
+ (id)wrapperWithAddressString:(id)a3 withPortHostOrder:(unsigned __int16)a4;
+ (id)wrapperWithAddressString:(id)a3 withPortHostOrder:(unsigned __int16)a4 withInterfaceName:(id)a5;
+ (id)wrapperWithSockAddr:(const sockaddr *)a3;
+ (id)wrapperWithWrapper:(id)a3 andPortHostOrder:(unsigned __int16)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSockAddr:(const sockaddr *)a3;
- (BOOL)isEqualToWrapper:(id)a3;
- (IDSSockAddrWrapper)initWithSockAddr:(const sockaddr *)a3;
- (const)sa;
- (const)sa4;
- (const)sa6;
- (id)description;
- (id)ipData;
- (id)ipString;
- (unint64_t)hash;
- (unsigned)saPortHostOrder;
- (void)copySockAddr:(sockaddr *)a3;
- (void)updateLocalPort:(unsigned __int16)a3;
@end

@implementation IDSSockAddrWrapper

+ (id)wrapperWithSockAddr:(const sockaddr *)a3
{
  v4 = [IDSSockAddrWrapper alloc];
  v7 = objc_msgSend_initWithSockAddr_(v4, v5, (uint64_t)a3, v6);
  return v7;
}

+ (id)wrapperWithAddressString:(id)a3 withPortHostOrder:(unsigned __int16)a4 withInterfaceName:(id)a5
{
  unsigned int v5 = a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = a3;
  v12 = (const char *)objc_msgSend_UTF8String(v8, v9, v10, v11);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  if (inet_pton(2, v12, (char *)&v23 + 4))
  {
    LOWORD(v23) = 528;
    WORD1(v23) = __rev16(v5);
LABEL_3:
    v13 = [IDSSockAddrWrapper alloc];
    v16 = objc_msgSend_initWithSockAddr_(v13, v14, (uint64_t)&v23, v15);
    goto LABEL_4;
  }
  if (inet_pton(30, v12, (char *)&v23 + 8))
  {
    LOWORD(v23) = 7708;
    WORD1(v23) = __rev16(v5);
    if (v7)
    {
      id v18 = v7;
      v22 = (const char *)objc_msgSend_UTF8String(v18, v19, v20, v21);
      DWORD2(v24) = if_nametoindex(v22);
    }
    goto LABEL_3;
  }
  v16 = 0;
LABEL_4:

  return v16;
}

+ (id)wrapperWithAddressString:(id)a3 withPortHostOrder:(unsigned __int16)a4
{
  return (id)((uint64_t (*)(__objc2_class *, char *, id))MEMORY[0x1F4181798])(IDSSockAddrWrapper, sel_wrapperWithAddressString_withPortHostOrder_withInterfaceName_, a3);
}

- (IDSSockAddrWrapper)initWithSockAddr:(const sockaddr *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)IDSSockAddrWrapper;
  v4 = [(IDSSockAddrWrapper *)&v8 init];
  unsigned int v5 = v4;
  if (!v4)
  {
LABEL_7:
    a3 = v5;
    goto LABEL_9;
  }
  if (a3)
  {
    if (!a3->sa_len || (int sa_family = a3->sa_family, sa_family != 30) && sa_family != 2)
    {
      a3 = 0;
      goto LABEL_9;
    }
    memcpy(&v4->_sa, a3, a3->sa_len);
    goto LABEL_7;
  }
LABEL_9:

  return (IDSSockAddrWrapper *)a3;
}

- (id)description
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  __int16 v16 = -21846;
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v14 = v2;
  long long v15 = v2;
  *(_OWORD *)__s = v2;
  *(_OWORD *)&__s[16] = v2;
  v3 = NSString;
  int ss_family = self->_sa.ss_family;
  if (ss_family == 30)
  {
    __s[0] = 91;
    if (inet_ntop(30, &self->_sa.__ss_align, &__s[1], 0x41u))
    {
      size_t v8 = strlen(__s);
      snprintf(&__s[v8], 66 - v8, "%%%u]:%u");
      goto LABEL_12;
    }
    v9 = " *** JT *** can't convert v6 address to string (%d)\n";
    goto LABEL_11;
  }
  if (ss_family != 2)
  {
    strcpy(__s, "<unsupported address>");
    objc_msgSend_stringWithUTF8String_(NSString, a2, (uint64_t)__s, *(double *)"<unsupported address>");
    goto LABEL_13;
  }
  if (!inet_ntop(2, &self->_sa.__ss_pad1[2], __s, 0x42u))
  {
    v9 = " *** JT *** can't convert v4 address to string (%d)\n";
LABEL_11:
    uint64_t v10 = __error();
    printf(v9, *v10);
    double v7 = *(double *)"<invalid address>";
    strcpy(__s, "<invalid address>");
    goto LABEL_12;
  }
  size_t v5 = strlen(__s);
  snprintf(&__s[v5], 66 - v5, ":%u");
LABEL_12:
  objc_msgSend_stringWithUTF8String_(v3, v6, (uint64_t)__s, v7);
  double v11 = LABEL_13:;
  return v11;
}

+ (id)wrapperWithWrapper:(id)a3 andPortHostOrder:(unsigned __int16)a4
{
  unsigned int v4 = a4;
  id v5 = a3;
  double v6 = [IDSSockAddrWrapper alloc];
  uint64_t v10 = objc_msgSend_sa(v5, v7, v8, v9);

  v13 = objc_msgSend_initWithSockAddr_(v6, v11, v10, v12);
  if (*(unsigned char *)(objc_msgSend_sa(v13, v14, v15, v16) + 1) == 2) {
    uint64_t v20 = objc_msgSend_sa4(v13, v17, v18, v19);
  }
  else {
    uint64_t v20 = objc_msgSend_sa6(v13, v17, v18, v19);
  }
  *(_WORD *)(v20 + 2) = __rev16(v4);
  return v13;
}

- (const)sa
{
  return (const sockaddr *)&self->_sa;
}

- (const)sa4
{
  return (const sockaddr_in *)&self->_sa;
}

- (const)sa6
{
  return (const sockaddr_in6 *)&self->_sa;
}

- (unsigned)saPortHostOrder
{
  return bswap32(*(unsigned __int16 *)self->_sa.__ss_pad1) >> 16;
}

- (BOOL)isEqualToSockAddr:(const sockaddr *)a3
{
  return sub_19DAC5D20((uint64_t)&self->_sa, (uint64_t)a3);
}

- (BOOL)isEqualToWrapper:(id)a3
{
  if (self == a3) {
    return 1;
  }
  p_sa = &self->_sa;
  uint64_t v6 = objc_msgSend_sa(a3, a2, (uint64_t)a3, v4);
  return sub_19DAC5D20((uint64_t)p_sa, v6);
}

- (id)ipData
{
  double v4 = (void *)MEMORY[0x1E4F1C9B8];
  if (self->_sa.ss_family == 2)
  {
    uint64_t v5 = objc_msgSend_sa4(self, a2, v2, v3) + 4;
    objc_msgSend_dataWithBytes_length_(v4, v6, v5, v7, 4);
  }
  else
  {
    uint64_t v8 = objc_msgSend_sa6(self, a2, v2, v3) + 8;
    objc_msgSend_dataWithBytes_length_(v4, v9, v8, v10, 16);
  double v11 = };
  return v11;
}

- (id)ipString
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v12[14] = v3;
  *(_OWORD *)double v11 = v3;
  *(_OWORD *)double v12 = v3;
  int ss_family = self->_sa.ss_family;
  if (ss_family == 30)
  {
    uint64_t v8 = objc_msgSend_sa6(self, a2, v2, *(double *)&v3);
    if (!inet_ntop(30, (const void *)(v8 + 8), v11, 0x2Eu))
    {
      __error();
      printf(" *** JT *** can't convert v6 address to string (%d)\n");
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (ss_family == 2)
  {
    uint64_t v5 = objc_msgSend_sa4(self, a2, v2, *(double *)&v3);
    if (!inet_ntop(2, (const void *)(v5 + 4), v11, 0x2Eu))
    {
      __error();
      printf(" *** JT *** can't convert v4 address to string (%d)\n");
      goto LABEL_8;
    }
LABEL_6:
    double v9 = objc_msgSend_stringWithUTF8String_(NSString, v6, (uint64_t)v11, v7);
    goto LABEL_9;
  }
LABEL_8:
  double v9 = 0;
LABEL_9:
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class()) {
    char isEqualToWrapper = objc_msgSend_isEqualToWrapper_(self, v6, (uint64_t)v4, v7);
  }
  else {
    char isEqualToWrapper = 0;
  }

  return isEqualToWrapper;
}

- (unint64_t)hash
{
  return sub_19DAC5FBC((uint64_t)&self->_sa);
}

- (void)copySockAddr:(sockaddr *)a3
{
}

- (void)updateLocalPort:(unsigned __int16)a3
{
  *(_WORD *)self->_sa.__ss_pad1 = __rev16(a3);
}

@end