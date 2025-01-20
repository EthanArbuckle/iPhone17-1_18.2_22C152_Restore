@interface IDSInterfaceAddress
+ (id)addressesFromInterfaceAddresses:(id)a3;
+ (id)interfaceAddress:(ifaddrs *)a3 eflags:(unint64_t)a4 v6flags:(int)a5 iftype:(int)a6;
+ (id)interfaceAddressWithTransmittedBytes:(char *)a3 length:(int64_t)a4 withLocalInterfaceName:(id)a5;
- (BOOL)clat46;
- (BOOL)constrained;
- (BOOL)expensive;
- (BOOL)isAWDL;
- (BOOL)isCellular;
- (BOOL)isCompanionLink;
- (BOOL)isTemporaryIPv6;
- (BOOL)isWired;
- (IDSInterfaceAddress)initWithInterfaceAddress:(ifaddrs *)a3 bflags:(unsigned __int8)a4;
- (IDSSockAddrWrapper)address;
- (IDSSockAddrWrapper)destination;
- (IDSSockAddrWrapper)external;
- (IDSSockAddrWrapper)netmask;
- (NSData)bssid;
- (NSString)delegatedName;
- (NSString)name;
- (id)description;
- (int64_t)getTransmittableBytes:(char *)a3 withPrefixByte:(unsigned __int8)a4;
- (unint64_t)IPVersion;
- (unsigned)delegatedIndex;
- (unsigned)index;
- (void)setConstrained:(BOOL)a3;
- (void)setExternal:(id)a3;
@end

@implementation IDSInterfaceAddress

+ (id)interfaceAddressWithTransmittedBytes:(char *)a3 length:(int64_t)a4 withLocalInterfaceName:(id)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  unint64_t v45 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v9 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v43 = v9;
  long long v44 = v9;
  long long v42 = v9;
  double v10 = 0.0;
  memset(v52, 0, sizeof(v52));
  memset(v51, 0, sizeof(v51));
  memset(v50, 0, sizeof(v50));
  if (a4 < 2) {
    goto LABEL_34;
  }
  v11 = a3 + 1;
  uint64_t v12 = a3[1];
  if (v12 + 2 > (unint64_t)a4) {
    goto LABEL_34;
  }
  uint64_t v13 = *a3;
  if (a3[1])
  {
    if (v12 >= 0x81)
    {
      v14 = objc_msgSend_interface(IDSFoundationLog, v11, v7, 0.0, v42, v43, v44, v45);
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
LABEL_9:

LABEL_34:
        v28 = 0;
        goto LABEL_35;
      }
      *(_DWORD *)buf = 67109376;
      unsigned int v47 = v12;
      __int16 v48 = 2048;
      uint64_t v49 = 128;
      v15 = "Error: addr length = %u > sizeof(struct sockaddr_storage) = %lu";
      goto LABEL_7;
    }
    unsigned int v19 = a3[2];
    if (v19 == 2)
    {
      if (v12 <= 0xF)
      {
        v14 = objc_msgSend_interface(IDSFoundationLog, v11, v7, 0.0, v42, v43, v44, v45);
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_9;
        }
        *(_DWORD *)buf = 67109376;
        unsigned int v47 = v12;
        __int16 v48 = 2048;
        uint64_t v49 = 16;
        v15 = "Error: addr length = %d < sizeof(struct sockaddr_in) = %lu";
        goto LABEL_7;
      }
    }
    else
    {
      if (v19 != 30)
      {
        v14 = objc_msgSend_interface(IDSFoundationLog, v11, v7, 0.0, v42, v43, v44, v45);
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_9;
        }
        *(_DWORD *)buf = 67109120;
        unsigned int v47 = v19;
        v15 = "Error: addr sa_family = %d not AF_INET (2) or AF_INET6 (30)";
        goto LABEL_21;
      }
      if (v12 <= 0x1B)
      {
        v14 = objc_msgSend_interface(IDSFoundationLog, v11, v7, 0.0, v42, v43, v44, v45);
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_9;
        }
        *(_DWORD *)buf = 67109376;
        unsigned int v47 = v12;
        __int16 v48 = 2048;
        uint64_t v49 = 28;
        v15 = "Error: addr length = %d < sizeof(struct sockaddr_in6) = %lu";
        goto LABEL_7;
      }
    }
    unsigned int v20 = v12 + 1;
    v18 = v52;
    __memcpy_chk();
    LOBYTE(v52[0]) = v12;
    BYTE1(v52[0]) = v19;
  }
  else
  {
    v18 = 0;
    unsigned int v19 = 0;
    unsigned int v20 = 2;
  }
  *((void *)&v43 + 1) = v18;
  v21 = &a3[v20];
  unsigned int v22 = *(unsigned __int8 *)v21;
  uint64_t v23 = v20 + 1;
  if (v23 + v22 > (unint64_t)a4) {
    goto LABEL_34;
  }
  if (*v21)
  {
    if (v22 >= 0x81)
    {
      v14 = objc_msgSend_interface(IDSFoundationLog, v21, v7, v10, v42, v43, v44, v45);
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_9;
      }
      *(_DWORD *)buf = 67109376;
      unsigned int v47 = v22;
      __int16 v48 = 2048;
      uint64_t v49 = 128;
      v15 = "Error: netmask length = %u > sizeof(struct sockaddr_storage) = %lu";
      goto LABEL_7;
    }
    unsigned int v24 = a3[v23];
    if (v24 != v19)
    {
      v14 = objc_msgSend_interface(IDSFoundationLog, v21, v7, v10, v42, v43, v44, v45);
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_9;
      }
      *(_DWORD *)buf = 67109376;
      unsigned int v47 = v24;
      __int16 v48 = 1024;
      LODWORD(v49) = BYTE1(v52[0]);
      v15 = "Error: netmask sa_family %d != addr sa_family %d";
      goto LABEL_44;
    }
    if (v22 >= 3) {
      __memcpy_chk();
    }
    LOBYTE(v51[0]) = v22;
    BYTE1(v51[0]) = v19;
    *(void *)&long long v44 = v51;
    LODWORD(v23) = v20 + v22;
  }
  else
  {
    *(void *)&long long v44 = 0;
  }
  v25 = &a3[v23];
  unsigned int v26 = *v25;
  uint64_t v27 = v23 + 1;
  if (v27 + v26 > (unint64_t)a4) {
    goto LABEL_34;
  }
  if (!*v25)
  {
    *((void *)&v44 + 1) = 0;
    goto LABEL_57;
  }
  if (v26 >= 0x81)
  {
    v14 = objc_msgSend_interface(IDSFoundationLog, v25, v7, v10, v42, v43, v44, v45);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 67109376;
    unsigned int v47 = v26;
    __int16 v48 = 2048;
    uint64_t v49 = 128;
    v15 = "Error: dstaddr length = %u > sizeof(struct sockaddr_storage) = %lu";
    goto LABEL_7;
  }
  unsigned int v30 = a3[v27];
  if (v30 == 2)
  {
    if (v26 <= 0xF)
    {
      v14 = objc_msgSend_interface(IDSFoundationLog, v25, v7, v10, v42, v43, v44, v45);
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_9;
      }
      *(_DWORD *)buf = 67109376;
      unsigned int v47 = v26;
      __int16 v48 = 2048;
      uint64_t v49 = 16;
      v15 = "Error: dstaddr length = %d < sizeof(struct sockaddr_in) = %lu";
LABEL_7:
      v16 = v14;
      uint32_t v17 = 18;
LABEL_8:
      _os_log_impl(&dword_19D9BE000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
      goto LABEL_9;
    }
    goto LABEL_56;
  }
  if (v30 != 30)
  {
    v14 = objc_msgSend_interface(IDSFoundationLog, v25, v7, v10, v42, v43, v44, v45);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 67109120;
    unsigned int v47 = v30;
    v15 = "Error: dstaddr sa_family = %d not AF_INET (2) or AF_INET6 (30)";
LABEL_21:
    v16 = v14;
    uint32_t v17 = 8;
    goto LABEL_8;
  }
  if (v26 <= 0x1B)
  {
    v14 = objc_msgSend_interface(IDSFoundationLog, v25, v7, v10, v42, v43, v44, v45);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 67109376;
    unsigned int v47 = v26;
    __int16 v48 = 2048;
    uint64_t v49 = 28;
    v15 = "Error: dstaddr length = %d < sizeof(struct sockaddr_in6) = %lu";
    goto LABEL_7;
  }
LABEL_56:
  __memcpy_chk();
  LOBYTE(v50[0]) = v26;
  BYTE1(v50[0]) = v30;
  LODWORD(v27) = v23 + v26;
  *((void *)&v44 + 1) = v50;
LABEL_57:
  unsigned int v31 = a3[v27];
  int v32 = v27 + 1 + v31;
  unint64_t v33 = (v32 + 1);
  if (v33 > a4) {
    goto LABEL_34;
  }
  if (a3[v27])
  {
    *((void *)&v42 + 1) = &a3[(v27 + 1)];
    if (v31 >= 0x11)
    {
      v14 = objc_msgSend_interface(IDSFoundationLog, v25, v7, v10, v42, v43, v44, v45);
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_9;
      }
      *(_DWORD *)buf = 67109376;
      unsigned int v47 = v31;
      __int16 v48 = 1024;
      LODWORD(v49) = 16;
      v15 = "Error: len: %u is greater than IFNAMSIZ: %d";
LABEL_44:
      v16 = v14;
      uint32_t v17 = 14;
      goto LABEL_8;
    }
  }
  else
  {
    *((void *)&v42 + 1) = 0;
    int v32 = v27 + 2;
    LODWORD(v33) = v27 + 3;
  }
  if (v33 + a3[v32] > (unint64_t)a4) {
    goto LABEL_34;
  }
  if (v8 && v18 && *((unsigned char *)v18 + 1) == 30)
  {
    id v34 = v8;
    v38 = (const char *)objc_msgSend_UTF8String(v34, v35, v36, v37, v42, v43, v44, v45);
    *((_DWORD *)v18 + 6) = if_nametoindex(v38);
  }
  v39 = [IDSInterfaceAddress alloc];
  v28 = objc_msgSend_initWithInterfaceAddress_bflags_(v39, v40, (uint64_t)&v42, v41, v13);
LABEL_35:

  return v28;
}

+ (id)interfaceAddress:(ifaddrs *)a3 eflags:(unint64_t)a4 v6flags:(int)a5 iftype:(int)a6
{
  unsigned int v7 = (a5 >> 5) & 4 | (a4 >> 20) & 1 | (a4 >> 10) & 0x10 | (a4 >> 11) & 2 | (8 * (a6 == 5)) | (32 * (a6 == 7)) | ((a6 == 2) << 6);
  id v8 = [IDSInterfaceAddress alloc];
  v11 = objc_msgSend_initWithInterfaceAddress_bflags_(v8, v9, (uint64_t)a3, v10, v7);
  return v11;
}

+ (id)addressesFromInterfaceAddresses:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v17, 0.0, v21, 16);
  if (v5)
  {
    uint64_t v9 = v5;
    double v10 = 0;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v3);
        }
        uint64_t v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (!v10)
        {
          double v10 = (__CFArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
          if (!v10) {
            continue;
          }
        }
        v14 = objc_msgSend_address(v13, v6, v7, v8);

        if (v14)
        {
          v15 = objc_msgSend_address(v13, v6, v7, v8);
          CFArrayAppendValue(v10, v15);
        }
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v17, v8, v21, 16);
    }
    while (v9);
  }
  else
  {
    double v10 = 0;
  }

  return v10;
}

- (id)description
{
  id v3 = @"YES";
  if (self->_AWDL) {
    v4 = @"YES";
  }
  else {
    v4 = @"NO";
  }
  if (self->_Cellular) {
    uint64_t v5 = @"YES";
  }
  else {
    uint64_t v5 = @"NO";
  }
  if (self->_expensive) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  if (self->_constrained) {
    uint64_t v7 = @"YES";
  }
  else {
    uint64_t v7 = @"NO";
  }
  if (self->_companionLink) {
    double v8 = @"YES";
  }
  else {
    double v8 = @"NO";
  }
  if (!self->_wired) {
    id v3 = @"NO";
  }
  return (id)objc_msgSend_stringWithFormat_(NSString, (const char *)v6, @"<%@/%@/%@/%@/%@/%@/%@/%@/%@/%@/%@>", v2, self->_address, self->_netmask, self->_destination, self->_name, self->_delegatedName, v4, v5, v6, v7, v8, v3);
}

- (unint64_t)IPVersion
{
  return *(unsigned __int8 *)(objc_msgSend_sa(self->_address, a2, v2, v3) + 1) != 2;
}

- (int64_t)getTransmittableBytes:(char *)a3 withPrefixByte:(unsigned __int8)a4
{
  *a3 = a4;
  a3[1] = self->_AWDL;
  uint64_t v9 = (unsigned __int8 *)objc_msgSend_sa(self->_address, a2, (uint64_t)a3, v4);
  uint64_t v11 = a3 + 2;
  if (v9)
  {
    memcpy(v11, v9, *v9);
    uint64_t v12 = *v9 + 2;
  }
  else
  {
    char *v11 = 0;
    uint64_t v12 = 3;
  }
  v15 = (unsigned __int8 *)objc_msgSend_sa(self->_netmask, v7, v8, v10);
  long long v17 = &a3[v12];
  if (v15)
  {
    memcpy(v17, v15, *v15);
    uint64_t v18 = *v15;
  }
  else
  {
    *long long v17 = 0;
    uint64_t v18 = 1;
  }
  uint64_t v19 = v18 + v12;
  uint64_t v22 = (unsigned __int8 *)objc_msgSend_sa(self->_destination, v13, v14, v16);
  unsigned int v24 = &a3[v19];
  if (v22)
  {
    memcpy(v24, v22, *v22);
    uint64_t v25 = *v22;
  }
  else
  {
    *unsigned int v24 = 0;
    uint64_t v25 = 1;
  }
  uint64_t v26 = v25 + v19;
  unsigned __int8 v27 = objc_msgSend_length(self->_name, v20, v21, v23);
  a3[v26] = v27 + 1;
  unsigned int v31 = (const void *)objc_msgSend_UTF8String(self->_name, v28, v29, v30);
  memcpy(&a3[v26 + 1], v31, v27);
  uint64_t v32 = v26 + 1 + v27;
  *(_WORD *)&a3[v32] = 0;
  return v32 + 2;
}

- (IDSInterfaceAddress)initWithInterfaceAddress:(ifaddrs *)a3 bflags:(unsigned __int8)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v37.receiver = self;
  v37.super_class = (Class)IDSInterfaceAddress;
  v6 = [(IDSInterfaceAddress *)&v37 init];
  if (!v6) {
    goto LABEL_29;
  }
  if (a3->ifa_addr)
  {
    uint64_t v7 = [IDSSockAddrWrapper alloc];
    uint64_t v10 = objc_msgSend_initWithSockAddr_(v7, v8, (uint64_t)a3->ifa_addr, v9);
    address = v6->_address;
    v6->_address = (IDSSockAddrWrapper *)v10;
  }
  if (a3->ifa_netmask)
  {
    uint64_t v12 = [IDSSockAddrWrapper alloc];
    uint64_t v15 = objc_msgSend_initWithSockAddr_(v12, v13, (uint64_t)a3->ifa_netmask, v14);
    netmask = v6->_netmask;
    v6->_netmask = (IDSSockAddrWrapper *)v15;
  }
  if (a3->ifa_dstaddr)
  {
    long long v17 = [IDSSockAddrWrapper alloc];
    uint64_t v20 = objc_msgSend_initWithSockAddr_(v17, v18, (uint64_t)a3->ifa_dstaddr, v19);
    destination = v6->_destination;
    v6->_destination = (IDSSockAddrWrapper *)v20;
  }
  if (!v6->_address)
  {
    v35 = 0;
    goto LABEL_31;
  }
  if (a3->ifa_name)
  {
    uint64_t v22 = (void *)MEMORY[0x19F3AEEF0]();
    id v23 = [NSString alloc];
    uint64_t v26 = objc_msgSend_initWithCString_encoding_(v23, v24, (uint64_t)a3->ifa_name, v25, 4);
    name = v6->_name;
    v6->_name = (NSString *)v26;

    v6->_index = if_nametoindex(a3->ifa_name);
    memset(buf, 170, 16);
    ifa_addr = a3->ifa_addr;
    if (ifa_addr)
    {
      if (getEffectiveInterface((uint64_t)a3->ifa_name, ifa_addr->sa_family, (char *)buf, &v6->_delegatedIndex))
      {
        id v29 = [NSString alloc];
        uint64_t v32 = objc_msgSend_initWithCString_encoding_(v29, v30, (uint64_t)buf, v31, 4);
        delegatedName = v6->_delegatedName;
        v6->_delegatedName = (NSString *)v32;
      }
      v6->_constrained = isInterfaceConstrained((uint64_t)a3->ifa_name, a3->ifa_addr->sa_family);
    }
  }
  if ((a4 & 0x20) != 0)
  {
    v6->_companionLink = 1;
    id v34 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v34, OS_LOG_TYPE_DEFAULT, "interface is CompanionLink", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"IDSInterface", @"IDS", @"interface is CompanionLink");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"IDSInterface", @"interface is CompanionLink");
        }
      }
    }
  }
  if (a4)
  {
    v6->_AWDL = 1;
    if ((a4 & 8) == 0)
    {
LABEL_24:
      if ((a4 & 4) == 0) {
        goto LABEL_25;
      }
      goto LABEL_34;
    }
  }
  else if ((a4 & 8) == 0)
  {
    goto LABEL_24;
  }
  v6->_Cellular = 1;
  if ((a4 & 4) == 0)
  {
LABEL_25:
    if ((a4 & 0x10) == 0) {
      goto LABEL_26;
    }
    goto LABEL_35;
  }
LABEL_34:
  v6->_temporary = 1;
  if ((a4 & 0x10) == 0)
  {
LABEL_26:
    if ((a4 & 0x40) == 0) {
      goto LABEL_27;
    }
LABEL_36:
    v6->_wired = 1;
    if ((a4 & 2) == 0) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
LABEL_35:
  v6->_expensive = 1;
  if ((a4 & 0x40) != 0) {
    goto LABEL_36;
  }
LABEL_27:
  if ((a4 & 2) != 0) {
LABEL_28:
  }
    v6->_clat46 = 1;
LABEL_29:
  v35 = v6;
LABEL_31:

  return v35;
}

- (IDSSockAddrWrapper)address
{
  return (IDSSockAddrWrapper *)objc_getProperty(self, a2, 8, 1);
}

- (IDSSockAddrWrapper)external
{
  return (IDSSockAddrWrapper *)objc_getProperty(self, a2, 16, 1);
}

- (void)setExternal:(id)a3
{
}

- (IDSSockAddrWrapper)netmask
{
  return (IDSSockAddrWrapper *)objc_getProperty(self, a2, 24, 1);
}

- (IDSSockAddrWrapper)destination
{
  return (IDSSockAddrWrapper *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (unsigned)index
{
  return self->_index;
}

- (NSString)delegatedName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (unsigned)delegatedIndex
{
  return self->_delegatedIndex;
}

- (BOOL)isAWDL
{
  return self->_AWDL;
}

- (BOOL)isCellular
{
  return self->_Cellular;
}

- (BOOL)isTemporaryIPv6
{
  return self->_temporary;
}

- (NSData)bssid
{
  return (NSData *)objc_getProperty(self, a2, 80, 1);
}

- (BOOL)isCompanionLink
{
  return self->_companionLink;
}

- (BOOL)isWired
{
  return self->_wired;
}

- (BOOL)expensive
{
  return self->_expensive;
}

- (BOOL)constrained
{
  return self->_constrained;
}

- (void)setConstrained:(BOOL)a3
{
  self->_constrained = a3;
}

- (BOOL)clat46
{
  return self->_clat46;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bssid, 0);
  objc_storeStrong((id *)&self->_delegatedName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_netmask, 0);
  objc_storeStrong((id *)&self->_external, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

@end