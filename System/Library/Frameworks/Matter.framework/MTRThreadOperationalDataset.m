@interface MTRThreadOperationalDataset
- (BOOL)_checkDataLength:(id)a3 expectedLength:(unint64_t)a4;
- (BOOL)_populateCppOperationalDataset;
- (MTRThreadOperationalDataset)initWithData:(NSData *)data;
- (MTRThreadOperationalDataset)initWithNetworkName:(NSString *)networkName extendedPANID:(NSData *)extendedPANID masterKey:(NSData *)masterKey PSKc:(NSData *)PSKc channel:(uint16_t)channel panID:(NSData *)panID;
- (MTRThreadOperationalDataset)initWithNetworkName:(NSString *)networkName extendedPANID:(NSData *)extendedPANID masterKey:(NSData *)masterKey PSKc:(NSData *)PSKc channelNumber:(NSNumber *)channelNumber panID:(NSData *)panID;
- (NSData)PSKc;
- (NSData)data;
- (NSData)extendedPANID;
- (NSData)masterKey;
- (NSData)panID;
- (NSNumber)channelNumber;
- (NSString)networkName;
- (id).cxx_construct;
- (uint16_t)channel;
- (void)setChannel:(uint16_t)channel;
@end

@implementation MTRThreadOperationalDataset

- (MTRThreadOperationalDataset)initWithNetworkName:(NSString *)networkName extendedPANID:(NSData *)extendedPANID masterKey:(NSData *)masterKey PSKc:(NSData *)PSKc channelNumber:(NSNumber *)channelNumber panID:(NSData *)panID
{
  v14 = networkName;
  v15 = extendedPANID;
  v16 = masterKey;
  v17 = PSKc;
  v18 = channelNumber;
  v19 = panID;
  v49.receiver = self;
  v49.super_class = (Class)MTRThreadOperationalDataset;
  v22 = [(MTRThreadOperationalDataset *)&v49 init];
  if (!v22) {
    goto LABEL_4;
  }
  uint64_t v23 = objc_msgSend_copy(v14, v20, v21);
  v24 = (void *)*((void *)v22 + 33);
  *((void *)v22 + 33) = v23;

  uint64_t v27 = objc_msgSend_copy(v15, v25, v26);
  v28 = (void *)*((void *)v22 + 34);
  *((void *)v22 + 34) = v27;

  uint64_t v31 = objc_msgSend_copy(v16, v29, v30);
  v32 = (void *)*((void *)v22 + 35);
  *((void *)v22 + 35) = v31;

  uint64_t v35 = objc_msgSend_copy(v17, v33, v34);
  v36 = (void *)*((void *)v22 + 36);
  *((void *)v22 + 36) = v35;

  uint64_t v39 = objc_msgSend_copy(v18, v37, v38);
  v40 = (void *)*((void *)v22 + 37);
  *((void *)v22 + 37) = v39;

  uint64_t v43 = objc_msgSend_copy(v19, v41, v42);
  v44 = (void *)*((void *)v22 + 38);
  *((void *)v22 + 38) = v43;

  *(_OWORD *)(v22 + 247) = 0u;
  *(_OWORD *)(v22 + 232) = 0u;
  *(_OWORD *)(v22 + 216) = 0u;
  *(_OWORD *)(v22 + 200) = 0u;
  *(_OWORD *)(v22 + 184) = 0u;
  *(_OWORD *)(v22 + 168) = 0u;
  *(_OWORD *)(v22 + 152) = 0u;
  *(_OWORD *)(v22 + 136) = 0u;
  *(_OWORD *)(v22 + 120) = 0u;
  *(_OWORD *)(v22 + 104) = 0u;
  *(_OWORD *)(v22 + 88) = 0u;
  *(_OWORD *)(v22 + 72) = 0u;
  *(_OWORD *)(v22 + 56) = 0u;
  *(_OWORD *)(v22 + 40) = 0u;
  *(_OWORD *)(v22 + 24) = 0u;
  *(_OWORD *)(v22 + 8) = 0u;
  if (objc_msgSend__populateCppOperationalDataset(v22, v45, v46)) {
    v47 = v22;
  }
  else {
LABEL_4:
  }
    v47 = 0;

  return v47;
}

- (BOOL)_populateCppOperationalDataset
{
  v61[1] = *MEMORY[0x263EF8340];
  self->_cppThreadOperationalDataset.mLength = 0;
  objc_msgSend_networkName(self, a2, v2);
  id v4 = objc_claimAutoreleasedReturnValue();
  v7 = (char *)objc_msgSend_UTF8String(v4, v5, v6);
  p_cppThreadOperationalDataset = &self->_cppThreadOperationalDataset;
  sub_244CC6F30(v7, self->_cppThreadOperationalDataset.mData, (uint64_t)v58);

  v11 = objc_msgSend_extendedPANID(self, v9, v10);
  char v13 = objc_msgSend__checkDataLength_expectedLength_(self, v12, (uint64_t)v11, 8);

  if ((v13 & 1) == 0)
  {
    v53 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v58 = 0;
      _os_log_impl(&dword_2446BD000, v53, OS_LOG_TYPE_ERROR, "Invalid ExtendedPANID", v58, 2u);
    }

    if (!sub_244CC4E58(1u)) {
      return 0;
    }
LABEL_17:
    sub_244CC4DE0(0, 1);
    return 0;
  }
  v16 = objc_msgSend_extendedPANID(self, v14, v15);
  objc_msgSend_getBytes_length_(v16, v17, (uint64_t)v61, 8);

  sub_244CC6BEC(self->_cppThreadOperationalDataset.mData, v61, (uint64_t)v58);
  v20 = objc_msgSend_masterKey(self, v18, v19);
  char v22 = objc_msgSend__checkDataLength_expectedLength_(self, v21, (uint64_t)v20, 16);

  if ((v22 & 1) == 0)
  {
    v54 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v58 = 0;
      _os_log_impl(&dword_2446BD000, v54, OS_LOG_TYPE_ERROR, "Invalid MasterKey", v58, 2u);
    }

    if (!sub_244CC4E58(1u)) {
      return 0;
    }
    goto LABEL_17;
  }
  v25 = objc_msgSend_masterKey(self, v23, v24);
  objc_msgSend_getBytes_length_(v25, v26, (uint64_t)&v60, 16);

  sub_244CC6CF0(self->_cppThreadOperationalDataset.mData, &v60, (uint64_t)v58);
  v29 = objc_msgSend_PSKc(self, v27, v28);
  char v31 = objc_msgSend__checkDataLength_expectedLength_(self, v30, (uint64_t)v29, 16);

  if ((v31 & 1) == 0)
  {
    v55 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v58 = 0;
      _os_log_impl(&dword_2446BD000, v55, OS_LOG_TYPE_ERROR, "Invalid PKSc", v58, 2u);
    }

    if (!sub_244CC4E58(1u)) {
      return 0;
    }
    goto LABEL_17;
  }
  uint64_t v34 = objc_msgSend_PSKc(self, v32, v33);
  objc_msgSend_getBytes_length_(v34, v35, (uint64_t)&v59, 16);

  sub_244CC7180(self->_cppThreadOperationalDataset.mData, &v59, (uint64_t)v58);
  uint64_t v38 = objc_msgSend_channelNumber(self, v36, v37);
  __int16 v41 = objc_msgSend_unsignedShortValue(v38, v39, v40);
  sub_244CC699C(self->_cppThreadOperationalDataset.mData, v41, (uint64_t)v58);

  v44 = objc_msgSend_panID(self, v42, v43);
  char v46 = objc_msgSend__checkDataLength_expectedLength_(self, v45, (uint64_t)v44, 2);

  if (v46)
  {
    objc_msgSend_panID(self, v47, v48);
    id v49 = objc_claimAutoreleasedReturnValue();
    unsigned int v52 = *(unsigned __int16 *)objc_msgSend_bytes(v49, v50, v51);

    sub_244CC707C(p_cppThreadOperationalDataset->mData, __rev16(v52), (uint64_t)v58);
  }
  else
  {
    v57 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v58 = 0;
      _os_log_impl(&dword_2446BD000, v57, OS_LOG_TYPE_ERROR, "Invalid PAN ID", v58, 2u);
    }

    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(0, 1);
    }
  }
  return v46;
}

- (BOOL)_checkDataLength:(id)a3 expectedLength:(unint64_t)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v8 = objc_msgSend_length(v5, v6, v7);
  if (v8 != a4)
  {
    v9 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v16 = objc_msgSend_length(v5, v10, v11);
      __int16 v17 = 2048;
      unint64_t v18 = a4;
      _os_log_impl(&dword_2446BD000, v9, OS_LOG_TYPE_ERROR, "Length Check Failed. Length:%lu is incorrect, must be %tu", buf, 0x16u);
    }

    if (sub_244CC4E58(1u))
    {
      objc_msgSend_length(v5, v12, v13);
      sub_244CC4DE0(0, 1);
    }
  }

  return v8 == a4;
}

- (MTRThreadOperationalDataset)initWithData:(NSData *)data
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v4 = data;
  uint64_t v7 = objc_msgSend_bytes(v4, v5, v6);
  uint64_t v10 = objc_msgSend_length(v4, v8, v9);
  sub_2446C1098(v35, v7, v10);
  memset(__dst, 0, 255);
  long long v33 = 0uLL;
  uint64_t v34 = 0;
  sub_244CC6678(__dst, (size_t)v35[1], v35[0], (uint64_t)&v33);
  if (v33)
  {
    uint64_t v11 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      long long v31 = v33;
      uint64_t v32 = v34;
      v12 = sub_244CB7B34((const char **)&v31, 1);
      *(_DWORD *)buf = 136315138;
      uint64_t v37 = v12;
      _os_log_impl(&dword_2446BD000, v11, OS_LOG_TYPE_ERROR, "Failed to parse data, cannot construct Operational Dataset. %s", buf, 0xCu);
    }

    if (sub_244CC4E58(1u))
    {
      long long v29 = v33;
      uint64_t v30 = v34;
      sub_244CB7B34((const char **)&v29, 1);
      sub_244CC4DE0(0, 1);
    }
    uint64_t v13 = 0;
  }
  else
  {
    int v28 = 0;
    sub_244CC6E78(v41, __dst, (uint64_t)buf);
    sub_244CC6A24((unint64_t)__dst, &v39, buf);
    sub_244CC6C70((unint64_t)__dst, &v38, (uint64_t)buf);
    sub_244CC7100((unint64_t)__dst, &v40, (uint64_t)buf);
    sub_244CC6FF4((unint64_t)__dst, (_WORD *)&v28 + 1, (uint64_t)buf);
    sub_244CC6918((unint64_t)__dst, &v28, (uint64_t)buf);
    HIWORD(v28) = bswap32(HIWORD(v28)) >> 16;
    uint64_t v15 = objc_msgSend_stringWithUTF8String_(NSString, v14, (uint64_t)v41);
    __int16 v17 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v16, (uint64_t)&v39, 8);
    uint64_t v19 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v18, (uint64_t)&v38, 16);
    uint64_t v21 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v20, (uint64_t)&v40, 16);
    uint64_t v23 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v22, (unsigned __int16)v28);
    v25 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v24, (uint64_t)&v28 + 2, 2);
    self = (MTRThreadOperationalDataset *)(id)objc_msgSend_initWithNetworkName_extendedPANID_masterKey_PSKc_channelNumber_panID_(self, v26, (uint64_t)v15, v17, v19, v21, v23, v25);

    uint64_t v13 = self;
  }

  return v13;
}

- (NSData)data
{
  sub_2446C1098(v5, (uint64_t)&self->_cppThreadOperationalDataset, self->_cppThreadOperationalDataset.mLength);
  v3 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v2, v5[0], v5[1]);

  return (NSData *)v3;
}

- (NSString)networkName
{
  return self->_networkName;
}

- (NSData)extendedPANID
{
  return self->_extendedPANID;
}

- (NSData)masterKey
{
  return self->_masterKey;
}

- (NSData)PSKc
{
  return self->_PSKc;
}

- (NSNumber)channelNumber
{
  return self->_channelNumber;
}

- (NSData)panID
{
  return self->_panID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_panID, 0);
  objc_storeStrong((id *)&self->_channelNumber, 0);
  objc_storeStrong((id *)&self->_PSKc, 0);
  objc_storeStrong((id *)&self->_masterKey, 0);
  objc_storeStrong((id *)&self->_extendedPANID, 0);

  objc_storeStrong((id *)&self->_networkName, 0);
}

- (id).cxx_construct
{
  *((unsigned char *)self + 262) = 0;
  return self;
}

- (void)setChannel:(uint16_t)channel
{
  objc_msgSend_numberWithUnsignedShort_(NSNumber, a2, channel);
  id v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  channelNumber = self->_channelNumber;
  self->_channelNumber = v4;
}

- (uint16_t)channel
{
  v3 = objc_msgSend_channelNumber(self, a2, v2);
  uint16_t v6 = objc_msgSend_unsignedShortValue(v3, v4, v5);

  return v6;
}

- (MTRThreadOperationalDataset)initWithNetworkName:(NSString *)networkName extendedPANID:(NSData *)extendedPANID masterKey:(NSData *)masterKey PSKc:(NSData *)PSKc channel:(uint16_t)channel panID:(NSData *)panID
{
  uint64_t v9 = channel;
  v14 = networkName;
  uint64_t v15 = extendedPANID;
  uint64_t v16 = masterKey;
  __int16 v17 = PSKc;
  unint64_t v18 = panID;
  v20 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v19, v9);
  char v22 = (MTRThreadOperationalDataset *)objc_msgSend_initWithNetworkName_extendedPANID_masterKey_PSKc_channelNumber_panID_(self, v21, (uint64_t)v14, v15, v16, v17, v20, v18);

  return v22;
}

@end