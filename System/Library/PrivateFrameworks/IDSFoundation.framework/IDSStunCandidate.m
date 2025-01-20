@interface IDSStunCandidate
+ (id)candidateWithType:(unint64_t)a3 transport:(int64_t)a4 radioAccessTechnology:(unsigned int)a5 mtu:(unsigned int)a6 index:(int)a7 address:(sockaddr *)a8 external:(sockaddr *)a9;
- ($B0CAF2F970A52CDCEAEBD8ED9A40FEA0)prefix;
- (BOOL)active;
- (BOOL)hasNATIPv4Address;
- (BOOL)hasNATIPv4External;
- (BOOL)isCLAT46;
- (BOOL)isCellularStunCandidate;
- (BOOL)isCompatibleWithStunCandidate:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLinkLocalStunCandidate;
- (BOOL)isRelayStunCandidate;
- (BOOL)isSameNetworkType:(id)a3;
- (BOOL)isServerReflexiveStunCandidate;
- (IDSStunCandidate)initWithType:(unint64_t)a3 transport:(int64_t)a4 radioAccessTechnology:(unsigned int)a5 mtu:(unsigned int)a6 index:(int)a7 address:(sockaddr *)a8 external:(sockaddr *)a9;
- (NSString)addressString;
- (NSString)allocbindDataBlob;
- (const)address;
- (double)extIPDetectionStartTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)index;
- (int64_t)transport;
- (sockaddr)external;
- (unint64_t)priority;
- (unint64_t)type;
- (unsigned)cellularSlicingFlags;
- (unsigned)dataSoMask;
- (unsigned)linkFlags;
- (unsigned)mtu;
- (unsigned)radioAccessTechnology;
- (void)dealloc;
- (void)setActive:(BOOL)a3;
- (void)setAddress:(const sockaddr *)a3 external:(const sockaddr *)a4;
- (void)setAllocbindDataBlob:(id)a3;
- (void)setCellularSlicingFlags:(unsigned __int8)a3;
- (void)setDataSoMask:(unsigned int)a3;
- (void)setExtIPDetectionStartTime:(double)a3;
- (void)setExternal:(sockaddr *)a3;
- (void)setExternalAddress:(id)a3;
- (void)setIsCLAT46:(BOOL)a3;
- (void)setLinkFlags:(unsigned __int16)a3;
- (void)setLocalPort:(unsigned __int16)a3;
- (void)setMtu:(unsigned int)a3;
- (void)setPrefix:(id *)a3;
- (void)setRadioAccessTechnology:(unsigned int)a3;
- (void)updateTransport:(int64_t)a3;
@end

@implementation IDSStunCandidate

+ (id)candidateWithType:(unint64_t)a3 transport:(int64_t)a4 radioAccessTechnology:(unsigned int)a5 mtu:(unsigned int)a6 index:(int)a7 address:(sockaddr *)a8 external:(sockaddr *)a9
{
  uint64_t v10 = *(void *)&a7;
  uint64_t v11 = *(void *)&a6;
  uint64_t v12 = *(void *)&a5;
  v15 = [IDSStunCandidate alloc];
  v18 = objc_msgSend_initWithType_transport_radioAccessTechnology_mtu_index_address_external_(v15, v16, a3, v17, a4, v12, v11, v10, a8, a9);
  return v18;
}

- (IDSStunCandidate)initWithType:(unint64_t)a3 transport:(int64_t)a4 radioAccessTechnology:(unsigned int)a5 mtu:(unsigned int)a6 index:(int)a7 address:(sockaddr *)a8 external:(sockaddr *)a9
{
  v19.receiver = self;
  v19.super_class = (Class)IDSStunCandidate;
  v15 = [(IDSStunCandidate *)&v19 init];
  v16 = v15;
  if (v15)
  {
    v15->_active = 1;
    v15->_type = a3;
    v15->_transport = a4;
    if (a3 > 3) {
      unint64_t v17 = 0;
    }
    else {
      unint64_t v17 = qword_19DB9B7D0[a3];
    }
    v15->_priority = v17;
    v15->_index = a7;
    if (a8 && IsValidSA((BOOL)a8)) {
      memcpy(&v16->_address, a8, a8->sa_len);
    }
    if (a9 && IsValidSA((BOOL)a9)) {
      memcpy(&v16->_external, a9, a9->sa_len);
    }
    v16->_radioAccessTechnology = a5;
    v16->_mtu = a6;
  }
  return v16;
}

- (void)dealloc
{
  self->_cellularSlicingFlags = 0;
  v2.receiver = self;
  v2.super_class = (Class)IDSStunCandidate;
  [(IDSStunCandidate *)&v2 dealloc];
}

- (id)description
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v26 = v3;
  long long v27 = v3;
  long long v24 = v3;
  long long v25 = v3;
  long long v22 = v3;
  long long v23 = v3;
  *(_OWORD *)__str = v3;
  long long v21 = v3;
  long long v18 = v3;
  long long v19 = v3;
  long long v16 = v3;
  long long v17 = v3;
  long long v14 = v3;
  long long v15 = v3;
  *(_OWORD *)uint64_t v12 = v3;
  long long v13 = v3;
  SAToIPPortString(__str, 0x80uLL, (uint64_t)&self->_address);
  SAToIPPortString(v12, 0x80uLL, (uint64_t)&self->_external);
  v4 = NSString;
  v5 = (&_IDSStunCandidateTypeStrings)[self->_type];
  uint64_t index = self->_index;
  v7 = IDSRadioAccessTechnologyToString(self->_radioAccessTechnology);
  uint64_t v10 = objc_msgSend_stringWithFormat_(v4, v8, @"[%p/%s/%s/%s/%1d/%s/0x%x/%u]", v9, self, __str, v12, v5, index, v7, self->_linkFlags, self->_dataSoMask);
  return v10;
}

- (const)address
{
  return (const sockaddr *)&self->_address;
}

- (NSString)addressString
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend_address(self, a2, v2, -3.72066208e-103, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL,
         0xAAAAAAAAAAAAAAAALL);
  SAToIPPortString((char *)&v8, 0x80uLL, v3);
  v6 = objc_msgSend_stringWithCString_encoding_(NSString, v4, (uint64_t)&v8, v5, 4);
  return (NSString *)v6;
}

- (sockaddr)external
{
  return (sockaddr *)&self->_external;
}

- (void)setExternal:(sockaddr *)a3
{
  if (a3 && IsValidSA((BOOL)a3))
  {
    size_t sa_len = a3->sa_len;
    memcpy(&self->_external, a3, sa_len);
  }
}

- (void)setAddress:(const sockaddr *)a3 external:(const sockaddr *)a4
{
  v4 = (void *)a4;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = (void *)a4;
  __src = (void *)a3;
  if (a3 && IsValidSA((BOOL)a3))
  {
    *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v32 = v6;
    long long v33 = v6;
    long long v30 = v6;
    long long v31 = v6;
    long long v28 = v6;
    long long v29 = v6;
    *(_OWORD *)__str = v6;
    long long v27 = v6;
    long long v24 = v6;
    long long v25 = v6;
    long long v22 = v6;
    long long v23 = v6;
    long long v20 = v6;
    long long v21 = v6;
    *(_OWORD *)long long v18 = v6;
    long long v19 = v6;
    SAToIPPortString(__str, 0x80uLL, (uint64_t)&self->_address);
    SAToIPPortString(v18, 0x80uLL, (uint64_t)&__src);
    v7 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      long long v13 = __str;
      __int16 v14 = 2080;
      long long v15 = v18;
      __int16 v16 = 2112;
      long long v17 = self;
      _os_log_impl(&dword_19D9BE000, v7, OS_LOG_TYPE_DEFAULT, "update address (%s->%s) for %@.", buf, 0x20u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"update address (%s->%s) for %@.");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"update address (%s->%s) for %@.");
        }
      }
    }
    memcpy(&self->_address, __src, *(unsigned __int8 *)__src);
    v4 = v10;
  }
  if (v4 && IsValidSA((BOOL)v4))
  {
    *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v32 = v8;
    long long v33 = v8;
    long long v30 = v8;
    long long v31 = v8;
    long long v28 = v8;
    long long v29 = v8;
    *(_OWORD *)__str = v8;
    long long v27 = v8;
    long long v24 = v8;
    long long v25 = v8;
    long long v22 = v8;
    long long v23 = v8;
    long long v20 = v8;
    long long v21 = v8;
    *(_OWORD *)long long v18 = v8;
    long long v19 = v8;
    SAToIPPortString(__str, 0x80uLL, (uint64_t)&self->_external);
    SAToIPPortString(v18, 0x80uLL, (uint64_t)&v10);
    uint64_t v9 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      long long v13 = __str;
      __int16 v14 = 2080;
      long long v15 = v18;
      __int16 v16 = 2112;
      long long v17 = self;
      _os_log_impl(&dword_19D9BE000, v9, OS_LOG_TYPE_DEFAULT, "update external address (%s->%s) for %@.", buf, 0x20u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      _IDSLogTransport(@"GL", @"IDS", @"update external address (%s->%s) for %@.");
      if (_IDSShouldLog()) {
        _IDSLogV(0, @"IDSFoundation", @"GL", @"update external address (%s->%s) for %@.");
      }
    }
    memcpy(&self->_external, v10, *(unsigned __int8 *)v10);
  }
}

- (void)setLocalPort:(unsigned __int16)a3
{
  if (a3) {
    SASetPort((uint64_t)&self->_address, a3);
  }
}

- (void)setExternalAddress:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v7[6] = v4;
  v7[7] = v4;
  v7[4] = v4;
  v7[5] = v4;
  v7[2] = v4;
  v7[3] = v4;
  v7[0] = v4;
  v7[1] = v4;
  uint64_t v5 = IPPortStringToSA(a3, (uint64_t)v7);
  if (v5)
  {
    long long v6 = (unsigned __int8 *)v5;
    if (IsValidSA(v5)) {
      memcpy(&self->_external, v6, *v6);
    }
  }
}

- (void)updateTransport:(int64_t)a3
{
  self->_transport = a3;
}

- ($B0CAF2F970A52CDCEAEBD8ED9A40FEA0)prefix
{
  return ($B0CAF2F970A52CDCEAEBD8ED9A40FEA0 *)&self->_prefix;
}

- (void)setPrefix:(id *)a3
{
  if (a3) {
    self->_prefix = ($BE1143823B49C92274321FF531FF3CB8)*a3;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  unint64_t type = self->_type;
  if ((type == 3) != (objc_msgSend_type(v4, v6, v7, v8) == 3)
    || (uint64_t v12 = objc_msgSend_address(v4, v9, v10, v11), !IsSameSA((uint64_t)&self->_address, v12)))
  {
    BOOL v17 = 0;
  }
  else
  {
    uint64_t v16 = objc_msgSend_external(v4, v13, v14, v15);
    BOOL v17 = IsSameSA((uint64_t)&self->_external, v16);
  }

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [IDSStunCandidate alloc];
  uint64_t v7 = objc_msgSend_initWithType_transport_radioAccessTechnology_mtu_index_address_external_(v4, v5, self->_type, v6, self->_transport, self->_radioAccessTechnology, self->_mtu, self->_index, &self->_address, &self->_external);
  objc_msgSend_setDataSoMask_(v7, v8, self->_dataSoMask, v9);
  objc_msgSend_setLinkFlags_(v7, v10, self->_linkFlags, v11);
  objc_msgSend_setIsCLAT46_(v7, v12, self->_isCLAT46, v13);
  objc_msgSend_setCellularSlicingFlags_(v7, v14, self->_cellularSlicingFlags, v15);
  return v7;
}

- (BOOL)isCompatibleWithStunCandidate:(id)a3
{
  id v4 = a3;
  int64_t transport = self->_transport;
  if (transport != objc_msgSend_transport(v4, v6, v7, v8)) {
    goto LABEL_14;
  }
  int v14 = *(unsigned __int8 *)(objc_msgSend_external(v4, v9, v10, v11) + 1);
  if (v14 != self->_address.ss_family) {
    goto LABEL_14;
  }
  if (v14 != 2) {
    goto LABEL_13;
  }
  unsigned int v16 = *(_DWORD *)&self->_address.__ss_pad1[2];
  unsigned int v17 = *(_DWORD *)(objc_msgSend_external(v4, v12, v13, v15) + 4);
  int isCellularStunCandidate = objc_msgSend_isCellularStunCandidate(self, v18, v19, v20);
  if (isCellularStunCandidate == objc_msgSend_isCellularStunCandidate(v4, v22, v23, v24)
    || (unsigned int v28 = bswap32(v16), HIBYTE(v28) != 10) && (v28 & 0xFFF00000) != 0xAC100000 && (v28 & 0xFFFF0000) != 0xC0A80000
    || (LOBYTE(v29) = 0, unsigned int v30 = bswap32(v17), HIBYTE(v30) != 10)
    && (v30 & 0xFFF00000) != 0xAC100000
    && (v30 & 0xFFFF0000) != 0xC0A80000)
  {
    int v31 = *(unsigned __int16 *)self->_address.__ss_pad1;
    uint64_t v32 = objc_msgSend_external(v4, v25, v26, v27);
    if (v16 != v17 || v31 != *(unsigned __int16 *)(v32 + 2))
    {
LABEL_13:
      unint64_t type = self->_type;
      if ((type == 3) == (objc_msgSend_type(v4, v12, v13, v15) == 3))
      {
        int isLinkLocalStunCandidate = objc_msgSend_isLinkLocalStunCandidate(self, v34, v35, v36);
        int v29 = isLinkLocalStunCandidate ^ objc_msgSend_isLinkLocalStunCandidate(v4, v39, v40, v41) ^ 1;
        goto LABEL_15;
      }
    }
LABEL_14:
    LOBYTE(v29) = 0;
  }
LABEL_15:

  return v29;
}

- (BOOL)isSameNetworkType:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_isCellularStunCandidate(v4, v5, v6, v7)
    && (objc_msgSend_isCellularStunCandidate(self, v8, v9, v10) & 1) != 0)
  {
    BOOL v11 = 1;
  }
  else if (objc_msgSend_radioAccessTechnology(v4, v8, v9, v10) {
         && objc_msgSend_radioAccessTechnology(v4, v12, v13, v14) != 9)
  }
  {
    BOOL v11 = 0;
  }
  else
  {
    unsigned int radioAccessTechnology = self->_radioAccessTechnology;
    if (radioAccessTechnology) {
      BOOL v16 = radioAccessTechnology == 9;
    }
    else {
      BOOL v16 = 1;
    }
    BOOL v11 = v16;
  }

  return v11;
}

- (BOOL)isServerReflexiveStunCandidate
{
  return self->_type == 1;
}

- (BOOL)isRelayStunCandidate
{
  return self->_type == 3;
}

- (BOOL)isCellularStunCandidate
{
  unsigned int radioAccessTechnology = self->_radioAccessTechnology;
  if (radioAccessTechnology) {
    BOOL v3 = radioAccessTechnology == 9;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

- (BOOL)isLinkLocalStunCandidate
{
  return IsLinkLocalSA((BOOL)&self->_address);
}

- (BOOL)hasNATIPv4Address
{
  if (self->_address.ss_family != 2) {
    return 0;
  }
  if (*(_DWORD *)&self->_address.__ss_pad1[2] == 10) {
    return 1;
  }
  unsigned int v3 = bswap32(*(_DWORD *)&self->_address.__ss_pad1[2]);
  unsigned int v4 = v3 >> 20;
  BOOL v5 = HIWORD(v3) == 49320;
  return v4 == 2753 || v5;
}

- (BOOL)hasNATIPv4External
{
  if (self->_external.ss_family != 2) {
    return 0;
  }
  if (*(_DWORD *)&self->_external.__ss_pad1[2] == 10) {
    return 1;
  }
  unsigned int v3 = bswap32(*(_DWORD *)&self->_external.__ss_pad1[2]);
  unsigned int v4 = v3 >> 20;
  BOOL v5 = HIWORD(v3) == 49320;
  return v4 == 2753 || v5;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (int)index
{
  return self->_index;
}

- (unsigned)radioAccessTechnology
{
  return self->_radioAccessTechnology;
}

- (void)setRadioAccessTechnology:(unsigned int)a3
{
  self->_unsigned int radioAccessTechnology = a3;
}

- (int64_t)transport
{
  return self->_transport;
}

- (unsigned)mtu
{
  return self->_mtu;
}

- (void)setMtu:(unsigned int)a3
{
  self->_mtu = a3;
}

- (double)extIPDetectionStartTime
{
  return self->_extIPDetectionStartTime;
}

- (void)setExtIPDetectionStartTime:(double)a3
{
  self->_extIPDetectionStartTime = a3;
}

- (unsigned)dataSoMask
{
  return self->_dataSoMask;
}

- (void)setDataSoMask:(unsigned int)a3
{
  self->_dataSoMask = a3;
}

- (NSString)allocbindDataBlob
{
  return self->_allocbindDataBlob;
}

- (void)setAllocbindDataBlob:(id)a3
{
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)isCLAT46
{
  return self->_isCLAT46;
}

- (void)setIsCLAT46:(BOOL)a3
{
  self->_isCLAT46 = a3;
}

- (unsigned)linkFlags
{
  return self->_linkFlags;
}

- (void)setLinkFlags:(unsigned __int16)a3
{
  self->_linkFlags = a3;
}

- (unsigned)cellularSlicingFlags
{
  return self->_cellularSlicingFlags;
}

- (void)setCellularSlicingFlags:(unsigned __int8)a3
{
  self->_cellularSlicingFlags = a3;
}

- (void).cxx_destruct
{
}

@end