@interface IDSQUICConnectionIDs
- (BOOL)isComplete;
- (NSData)localAVCConnectionIDData;
- (NSData)localIDSConnectionIDData;
- (NSData)remoteAVCConnectionIDData;
- (NSData)remoteIDSConnectionIDData;
- (id)_getConnectionIDData:(unsigned int)a3;
- (id)_getConnectionIDDispatchData:(unsigned int)a3;
- (id)description;
- (id)generateLocalIDs:(id *)a3;
- (id)localAVCConnectionIDDispatchData;
- (id)localIDSConnectionIDDispatchData;
- (id)remoteAVCConnectionIDDispatchData;
- (id)remoteIDSConnectionIDDispatchData;
- (unsigned)_convertConnectionIDDataToUInt32:(id)a3;
- (unsigned)_generateUniqueQUICConnectionID:(unsigned int)a3 usedLocalConnectionIDs:(id *)a4;
- (unsigned)localAVCConnectionID;
- (unsigned)localIDSConnectionID;
- (unsigned)remoteAVCConnectionID;
- (unsigned)remoteIDSConnectionID;
- (void)setLocalAVCConnectionID:(unsigned int)a3;
- (void)setLocalAVCConnectionIDData:(id)a3;
- (void)setLocalIDSConnectionID:(unsigned int)a3;
- (void)setLocalIDSConnectionIDData:(id)a3;
- (void)setRemoteAVCConnectionID:(unsigned int)a3;
- (void)setRemoteAVCConnectionIDData:(id)a3;
- (void)setRemoteIDSConnectionID:(unsigned int)a3;
- (void)setRemoteIDSConnectionIDData:(id)a3;
@end

@implementation IDSQUICConnectionIDs

- (unsigned)_generateUniqueQUICConnectionID:(unsigned int)a3 usedLocalConnectionIDs:(id *)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v7 = objc_msgSend_GlobalLink(IDSFoundationLog, a2, *(uint64_t *)&a3, v4);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = objc_msgSend_count(*a4, v8, v9, v10);
    *(_DWORD *)buf = 134217984;
    uint64_t v31 = v11;
    _os_log_impl(&dword_19D9BE000, v7, OS_LOG_TYPE_DEFAULT, "generating a connection ID (%lu already taken)", buf, 0xCu);
  }

  unsigned int __buf = -1431655766;
  unsigned int v12 = a3 << 28;
  int v13 = -100000;
  do
  {
    arc4random_buf(&__buf, 4uLL);
    int v17 = __buf & 0xFFFFFFF | v12;
    uint64_t v18 = v17 | 0x800000u;
    unsigned int __buf = v17 | 0x800000;
    if (__CFADD__(v13++, 1)) {
      sub_19DB7E06C(v16, v14, v15, v18);
    }
    id v20 = *a4;
    v21 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v15, v18, v16);
    LOBYTE(v20) = objc_msgSend_containsObject_(v20, v22, (uint64_t)v21, v23);
  }
  while ((v20 & 1) != 0);
  v27 = objc_msgSend_GlobalLink(IDSFoundationLog, v24, v25, v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v31) = __buf;
    _os_log_impl(&dword_19D9BE000, v27, OS_LOG_TYPE_DEFAULT, "generated connection ID %08x", buf, 8u);
  }

  return __buf;
}

- (id)_getConnectionIDData:(unsigned int)a3
{
  unsigned int v6 = bswap32(a3);
  double v4 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], a2, (uint64_t)&v6, v3, 4);
  return v4;
}

- (unsigned)_convertConnectionIDDataToUInt32:(id)a3
{
  id v3 = a3;
  return bswap32(*(_DWORD *)objc_msgSend_bytes(v3, v4, v5, v6));
}

- (id)_getConnectionIDDispatchData:(unsigned int)a3
{
  unsigned int buffer = bswap32(a3);
  dispatch_data_t v3 = dispatch_data_create(&buffer, 4uLL, 0, 0);
  return v3;
}

- (id)generateLocalIDs:(id *)a3
{
  v18[2] = *MEMORY[0x1E4F143B8];
  self->_localAVCConnectionID = objc_msgSend__generateUniqueQUICConnectionID_usedLocalConnectionIDs_(self, a2, 0, v3, a3);
  self->_localIDSConnectionID = objc_msgSend__generateUniqueQUICConnectionID_usedLocalConnectionIDs_(self, v6, 1, v7, a3);
  double v10 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v8, self->_localAVCConnectionID, v9);
  v18[0] = v10;
  int v13 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v11, self->_localIDSConnectionID, v12);
  v18[1] = v13;
  double v16 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v14, (uint64_t)v18, v15, 2);

  return v16;
}

- (id)description
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"LocalAVC: 0x%08x, RemoteAVC: 0x%08x, LocalIDS: 0x%08x, RemoteIDS: 0x%08x", v2, self->_localAVCConnectionID, self->_remoteAVCConnectionID, self->_localIDSConnectionID, self->_remoteIDSConnectionID);
}

- (NSData)localAVCConnectionIDData
{
  return (NSData *)((uint64_t (*)(IDSQUICConnectionIDs *, char *, void))MEMORY[0x1F4181798])(self, sel__getConnectionIDData_, self->_localAVCConnectionID);
}

- (NSData)localIDSConnectionIDData
{
  return (NSData *)((uint64_t (*)(IDSQUICConnectionIDs *, char *, void))MEMORY[0x1F4181798])(self, sel__getConnectionIDData_, self->_localIDSConnectionID);
}

- (NSData)remoteAVCConnectionIDData
{
  return (NSData *)((uint64_t (*)(IDSQUICConnectionIDs *, char *, void))MEMORY[0x1F4181798])(self, sel__getConnectionIDData_, self->_remoteAVCConnectionID);
}

- (NSData)remoteIDSConnectionIDData
{
  return (NSData *)((uint64_t (*)(IDSQUICConnectionIDs *, char *, void))MEMORY[0x1F4181798])(self, sel__getConnectionIDData_, self->_remoteIDSConnectionID);
}

- (void)setLocalAVCConnectionIDData:(id)a3
{
  self->_localAVCConnectionID = objc_msgSend__convertConnectionIDDataToUInt32_(self, a2, (uint64_t)a3, v3);
}

- (void)setLocalIDSConnectionIDData:(id)a3
{
  self->_localIDSConnectionID = objc_msgSend__convertConnectionIDDataToUInt32_(self, a2, (uint64_t)a3, v3);
}

- (void)setRemoteAVCConnectionIDData:(id)a3
{
  self->_remoteAVCConnectionID = objc_msgSend__convertConnectionIDDataToUInt32_(self, a2, (uint64_t)a3, v3);
}

- (void)setRemoteIDSConnectionIDData:(id)a3
{
  self->_remoteIDSConnectionID = objc_msgSend__convertConnectionIDDataToUInt32_(self, a2, (uint64_t)a3, v3);
}

- (id)localAVCConnectionIDDispatchData
{
  return (id)((uint64_t (*)(IDSQUICConnectionIDs *, char *, void))MEMORY[0x1F4181798])(self, sel__getConnectionIDDispatchData_, self->_localAVCConnectionID);
}

- (id)localIDSConnectionIDDispatchData
{
  return (id)((uint64_t (*)(IDSQUICConnectionIDs *, char *, void))MEMORY[0x1F4181798])(self, sel__getConnectionIDDispatchData_, self->_localIDSConnectionID);
}

- (id)remoteAVCConnectionIDDispatchData
{
  return (id)((uint64_t (*)(IDSQUICConnectionIDs *, char *, void))MEMORY[0x1F4181798])(self, sel__getConnectionIDDispatchData_, self->_remoteAVCConnectionID);
}

- (id)remoteIDSConnectionIDDispatchData
{
  return (id)((uint64_t (*)(IDSQUICConnectionIDs *, char *, void))MEMORY[0x1F4181798])(self, sel__getConnectionIDDispatchData_, self->_remoteIDSConnectionID);
}

- (BOOL)isComplete
{
  return self->_localAVCConnectionID
      && self->_localIDSConnectionID
      && self->_remoteAVCConnectionID
      && self->_remoteIDSConnectionID != 0;
}

- (unsigned)localAVCConnectionID
{
  return self->_localAVCConnectionID;
}

- (void)setLocalAVCConnectionID:(unsigned int)a3
{
  self->_localAVCConnectionID = a3;
}

- (unsigned)localIDSConnectionID
{
  return self->_localIDSConnectionID;
}

- (void)setLocalIDSConnectionID:(unsigned int)a3
{
  self->_localIDSConnectionID = a3;
}

- (unsigned)remoteAVCConnectionID
{
  return self->_remoteAVCConnectionID;
}

- (void)setRemoteAVCConnectionID:(unsigned int)a3
{
  self->_remoteAVCConnectionID = a3;
}

- (unsigned)remoteIDSConnectionID
{
  return self->_remoteIDSConnectionID;
}

- (void)setRemoteIDSConnectionID:(unsigned int)a3
{
  self->_remoteIDSConnectionID = a3;
}

@end