@interface IDSStunMessage
- (BOOL)addAttribute:(IDSStunAttribute *)a3;
- (BOOL)dataIndicationToBuffer:(char *)a3 outputLength:(int *)a4 data:(char *)a5 dataLen:(int)a6 keyData:(id)a7 remainingLength:(unint64_t)a8;
- (BOOL)decryptAES128CTRStunAttributes:(id)a3;
- (BOOL)getAttribute:(int64_t)a3 attribute:(IDSStunAttribute *)a4;
- (BOOL)hasAttribute:(int64_t)a3;
- (BOOL)initAES128CTR:(id)a3;
- (BOOL)read:(char *)a3 inputLength:(unint64_t)a4;
- (BOOL)read:(char *)a3 inputLength:(unint64_t)a4 internal:(BOOL)a5;
- (BOOL)stunRequestToBuffer:(char *)a3 outputLength:(int *)a4 transactionID:(char *)a5 reqCount:(int)a6 userName:(char *)a7 usernameLen:(int)a8 sendTime:(unsigned __int16)a9 keyData:(id)a10 remainingLength:(unint64_t)a11;
- (BOOL)stunResponseToBuffer:(char *)a3 outputLength:(int *)a4 transactionID:(id)a5 reqCount:(int)a6 echoTime:(unsigned __int16)a7 delay:(unsigned __int16)a8 keyData:(id)a9 remainingLength:(unint64_t)a10;
- (BOOL)verifyMessageIntegrityWithKey:(id)a3 inputBuffer:(char *)a4 inputLength:(int)a5;
- (BOOL)write:(char *)a3 outputLength:(int *)a4 remainingLength:(unint64_t)a5;
- (BOOL)write:(char *)a3 outputLength:(int *)a4 remainingLength:(unint64_t)a5 internal:(BOOL)a6;
- (IDSStunMessage)initWithType:(int64_t)a3;
- (NSData)key;
- (NSData)transactionID;
- (NSString)requestID;
- (double)startTime;
- (id)description;
- (int64_t)type;
- (void)_addBinaryDataAttribute:(int64_t)a3 value:(id)a4;
- (void)_addUInt16Attribute:(int64_t)a3 value:(unsigned __int16)a4;
- (void)_addUInt32Attribute:(int64_t)a3 value:(unsigned int)a4;
- (void)_addUInt64Attribute:(int64_t)a3 value:(unint64_t)a4;
- (void)_addUInt8Attribute:(int64_t)a3 value:(unsigned __int8)a4;
- (void)_addUUIDAttribute:(int64_t)a3 value:(id)a4;
- (void)_addXORAddressAttribute:(int64_t)a3 value:(sockaddr *)a4;
- (void)dealloc;
- (void)setAttributes:(id)a3;
- (void)setKey:(id)a3;
- (void)setStartTime:(double)a3;
- (void)setTransactionID:(id)a3;
- (void)setTransactionID:(id)a3 attributes:(id)a4;
@end

@implementation IDSStunMessage

- (IDSStunMessage)initWithType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)IDSStunMessage;
  result = [(IDSStunMessage *)&v5 init];
  if (result) {
    result->_type = a3;
  }
  return result;
}

- (void)dealloc
{
  cryptorRef = self->_cryptorRef;
  if (cryptorRef) {
    CCCryptorRelease(cryptorRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)IDSStunMessage;
  [(IDSStunMessage *)&v4 dealloc];
}

- (id)description
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"[%04x/%uB/%@]", v2, LOWORD(self->_type), self->_len, self->_requestID);
}

- (BOOL)addAttribute:(IDSStunAttribute *)a3
{
  if (!a3) {
    return 0;
  }
  p_int numAttribute = &self->_numAttribute;
  int numAttribute = self->_numAttribute;
  if (numAttribute < 19)
  {
    memcpy(&self->_attributes[numAttribute], a3, sizeof(self->_attributes[numAttribute]));
    ++*p_numAttribute;
    return 1;
  }
  else
  {
    v7 = objc_msgSend_Stun(IDSFoundationLog, a2, (uint64_t)a3, v3);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_19DB7C4B0(&a3->type, v7);
    }

    return 0;
  }
}

- (BOOL)hasAttribute:(int64_t)a3
{
  unint64_t numAttribute = self->_numAttribute;
  if ((int)numAttribute < 1) {
    return 0;
  }
  if (self->_attributes[0].type == a3) {
    return 1;
  }
  objc_super v5 = &self->_attributes[1];
  uint64_t v6 = 1;
  do
  {
    unint64_t v7 = v6;
    if (numAttribute == v6) {
      break;
    }
    uint64_t type = v5->type;
    ++v6;
    ++v5;
  }
  while (type != a3);
  return v7 < numAttribute;
}

- (BOOL)getAttribute:(int64_t)a3 attribute:(IDSStunAttribute *)a4
{
  unint64_t numAttribute = self->_numAttribute;
  if ((int)numAttribute < 1) {
    return 0;
  }
  attributes = self->_attributes;
  if (self->_attributes[0].type != a3)
  {
    unint64_t v7 = 0;
    v8 = &self->_attributes[1];
    while (numAttribute - 1 != v7)
    {
      uint64_t type = v8->type;
      ++v8;
      ++v7;
      if (type == a3)
      {
        BOOL v6 = v7 < numAttribute;
        attributes = v8 - 1;
        goto LABEL_8;
      }
    }
    return 0;
  }
  BOOL v6 = 1;
LABEL_8:
  memcpy(a4, attributes, sizeof(IDSStunAttribute));
  return v6;
}

- (BOOL)stunRequestToBuffer:(char *)a3 outputLength:(int *)a4 transactionID:(char *)a5 reqCount:(int)a6 userName:(char *)a7 usernameLen:(int)a8 sendTime:(unsigned __int16)a9 keyData:(id)a10 remainingLength:(unint64_t)a11
{
  v40[186] = *MEMORY[0x1E4F143B8];
  id v20 = a10;
  if (a3) {
    BOOL v22 = a4 == 0;
  }
  else {
    BOOL v22 = 1;
  }
  BOOL v23 = v22 || a11 == 0;
  char v24 = v23;
  if (v23)
  {
    v25 = objc_msgSend_Stun(IDSFoundationLog, v18, v19, v21);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v40[0]) = 134218496;
      *(void *)((char *)v40 + 4) = a3;
      WORD2(v40[1]) = 2048;
      *(void *)((char *)&v40[1] + 6) = a4;
      HIWORD(v40[2]) = 2048;
      v40[3] = a11;
      _os_log_error_impl(&dword_19D9BE000, v25, OS_LOG_TYPE_ERROR, "refreshRequestToBuffer - invalid parameter outputBuffer: %p, outputLength: %p, remainingLength: %zd", (uint8_t *)v40, 0x20u);
    }
  }
  else
  {
    if (a5)
    {
      v26 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v18, (uint64_t)a5, v21, 12);
      objc_msgSend_setTransactionID_(self, v27, (uint64_t)v26, v28);
    }
    else
    {
      objc_msgSend_setTransactionID_(self, v18, 0, v21);
    }
    if (a6 >= 1)
    {
      memset(v40, 170, 0x5D0uLL);
      LODWORD(v40[0]) = 262181;
      LODWORD(v40[1]) = a6;
      objc_msgSend_addAttribute_(self, v31, (uint64_t)v40, v32);
    }
    if (a7 && a8 >= 1)
    {
      memset(v40, 170, 0x5D0uLL);
      LOWORD(v40[0]) = 6;
      WORD1(v40[0]) = a8;
      LODWORD(v40[1]) = a8;
      __memcpy_chk();
      objc_msgSend_addAttribute_(self, v33, (uint64_t)v40, v34);
    }
    if (a9)
    {
      memset(v40, 170, 0x5D0uLL);
      LODWORD(v40[0]) = 294917;
      LODWORD(v40[1]) = 4;
      BYTE4(v40[1]) = HIBYTE(a9);
      BYTE5(v40[1]) = a9;
      HIWORD(v40[1]) = 0;
      objc_msgSend_addAttribute_(self, v35, (uint64_t)v40, v36);
    }
    if (v20)
    {
      objc_msgSend_setKey_(self, v29, (uint64_t)v20, v30);
      memset(v40, 170, 0x5D0uLL);
      LODWORD(v40[0]) = 1310728;
      LODWORD(v40[1]) = 20;
      objc_msgSend_addAttribute_(self, v37, (uint64_t)v40, v38);
    }
    objc_msgSend_write_outputLength_remainingLength_(self, v29, (uint64_t)a3, v30, a4, a11);
  }

  return v24 ^ 1;
}

- (BOOL)stunResponseToBuffer:(char *)a3 outputLength:(int *)a4 transactionID:(id)a5 reqCount:(int)a6 echoTime:(unsigned __int16)a7 delay:(unsigned __int16)a8 keyData:(id)a9 remainingLength:(unint64_t)a10
{
  int v11 = a7;
  v34[186] = *MEMORY[0x1E4F143B8];
  id v19 = a9;
  if (a3) {
    BOOL v21 = a4 == 0;
  }
  else {
    BOOL v21 = 1;
  }
  BOOL v22 = v21 || a10 == 0;
  char v23 = v22;
  if (v22)
  {
    char v24 = objc_msgSend_Stun(IDSFoundationLog, v17, v18, v20);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v34[0]) = 134218496;
      *(void *)((char *)v34 + 4) = a3;
      WORD2(v34[1]) = 2048;
      *(void *)((char *)&v34[1] + 6) = a4;
      HIWORD(v34[2]) = 2048;
      v34[3] = a10;
      _os_log_error_impl(&dword_19D9BE000, v24, OS_LOG_TYPE_ERROR, "refreshRequestToBuffer - invalid parameter: outputBuffer: %p, outputLength: %p, remainingLength: %zd", (uint8_t *)v34, 0x20u);
    }
  }
  else
  {
    objc_msgSend_setTransactionID_(self, v17, (uint64_t)a5, v20);
    if (a6 >= 1)
    {
      memset(v34, 170, 0x5D0uLL);
      LODWORD(v34[0]) = 262181;
      LODWORD(v34[1]) = a6;
      objc_msgSend_addAttribute_(self, v27, (uint64_t)v34, v28);
    }
    if (v11)
    {
      memset(v34, 170, 0x5D0uLL);
      LODWORD(v34[0]) = 294917;
      LODWORD(v34[1]) = 4;
      BYTE4(v34[1]) = BYTE1(v11);
      BYTE5(v34[1]) = v11;
      BYTE6(v34[1]) = HIBYTE(a8);
      HIBYTE(v34[1]) = a8;
      objc_msgSend_addAttribute_(self, v29, (uint64_t)v34, v30);
    }
    if (v19)
    {
      objc_msgSend_setKey_(self, v25, (uint64_t)v19, v26);
      memset(v34, 170, 0x5D0uLL);
      LODWORD(v34[0]) = 1310728;
      LODWORD(v34[1]) = 20;
      objc_msgSend_addAttribute_(self, v31, (uint64_t)v34, v32);
    }
    objc_msgSend_write_outputLength_remainingLength_(self, v25, (uint64_t)a3, v26, a4, a10);
  }

  return v23 ^ 1;
}

- (BOOL)dataIndicationToBuffer:(char *)a3 outputLength:(int *)a4 data:(char *)a5 dataLen:(int)a6 keyData:(id)a7 remainingLength:(unint64_t)a8
{
  __b[187] = *MEMORY[0x1E4F143B8];
  id v16 = a7;
  if (a3) {
    BOOL v18 = a4 == 0;
  }
  else {
    BOOL v18 = 1;
  }
  BOOL v20 = v18 || a5 == 0 || a6 <= 0;
  BOOL v21 = !v20;
  if (v20)
  {
    double v28 = objc_msgSend_Stun(IDSFoundationLog, v14, v15, v17);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      LODWORD(__b[0]) = 134218496;
      *(void *)((char *)__b + 4) = a3;
      WORD2(__b[1]) = 2048;
      *(void *)((char *)&__b[1] + 6) = a4;
      HIWORD(__b[2]) = 2048;
      __b[3] = a8;
      _os_log_error_impl(&dword_19D9BE000, v28, OS_LOG_TYPE_ERROR, "failed to create data indication with invalid parameter, outputBuffer: %p, outputLength: %p, remainingLength: %zd", (uint8_t *)__b, 0x20u);
    }
  }
  else
  {
    objc_msgSend_setTransactionID_(self, v14, 0, v17);
    memset(__b, 170, 0x5D0uLL);
    LOWORD(__b[0]) = 19;
    WORD1(__b[0]) = a6;
    LODWORD(__b[1]) = a6;
    __memcpy_chk();
    objc_msgSend_addAttribute_(self, v22, (uint64_t)__b, v23);
    if (v16)
    {
      objc_msgSend_setKey_(self, v24, (uint64_t)v16, v25);
      memset(v30, 170, sizeof(v30));
      v30[0] = 1310728;
      v30[2] = 20;
      objc_msgSend_addAttribute_(self, v26, (uint64_t)v30, v27);
    }
    objc_msgSend_write_outputLength_remainingLength_(self, v24, (uint64_t)a3, v25, a4, a8);
  }

  return v21;
}

- (void)_addUInt8Attribute:(int64_t)a3 value:(unsigned __int8)a4
{
  __int16 v5 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  memset(__b, 170, sizeof(__b));
  __b[0] = v5;
  __b[1] = 1;
  LOBYTE(__b[4]) = a4;
  objc_msgSend_addAttribute_(self, v7, (uint64_t)__b, v8);
}

- (void)_addUInt16Attribute:(int64_t)a3 value:(unsigned __int16)a4
{
  __int16 v5 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  memset(__b, 170, sizeof(__b));
  __b[0] = v5;
  __b[1] = 2;
  __b[4] = a4;
  objc_msgSend_addAttribute_(self, v7, (uint64_t)__b, v8);
}

- (void)_addUInt32Attribute:(int64_t)a3 value:(unsigned int)a4
{
  __int16 v5 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  memset(__b, 170, sizeof(__b));
  LOWORD(__b[0]) = v5;
  HIWORD(__b[0]) = 4;
  __b[2] = a4;
  objc_msgSend_addAttribute_(self, v7, (uint64_t)__b, v8);
}

- (void)_addUInt64Attribute:(int64_t)a3 value:(unint64_t)a4
{
  __int16 v5 = a3;
  __b[186] = *MEMORY[0x1E4F143B8];
  memset(__b, 170, 0x5D0uLL);
  LOWORD(__b[0]) = v5;
  WORD1(__b[0]) = 8;
  __b[1] = a4;
  objc_msgSend_addAttribute_(self, v7, (uint64_t)__b, v8);
}

- (void)_addBinaryDataAttribute:(int64_t)a3 value:(id)a4
{
  __int16 v4 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      memset(__b, 170, sizeof(__b));
      unint64_t v10 = objc_msgSend_length(v6, v7, v8, v9);
      unint64_t v14 = v10;
      if (v10 < 0x5C1)
      {
        LOWORD(__b[0]) = v4;
        HIWORD(__b[0]) = v10;
        BYTE2(__b[1]) = 0;
        __b[2] = v10;
        id v16 = v6;
        objc_msgSend_bytes(v16, v17, v18, v19);
        __memcpy_chk();
        objc_msgSend_addAttribute_(self, v20, (uint64_t)__b, v21);
      }
      else
      {
        uint64_t v15 = objc_msgSend_Stun(IDSFoundationLog, v11, v12, v13);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          int v22 = 134218240;
          unint64_t v23 = v14;
          __int16 v24 = 2048;
          uint64_t v25 = 1472;
          _os_log_impl(&dword_19D9BE000, v15, OS_LOG_TYPE_DEFAULT, "_addBinaryDataAttribute: len %lu > sizeof(attr.value.binaryData.data) %lu", (uint8_t *)&v22, 0x16u);
        }
      }
    }
  }
}

- (void)_addUUIDAttribute:(int64_t)a3 value:(id)a4
{
  __int16 v4 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      memset(__b, 170, sizeof(__b));
      id v7 = objc_alloc(MEMORY[0x1E4F29128]);
      unint64_t v10 = objc_msgSend_initWithUUIDString_(v7, v8, (uint64_t)v6, v9);
      *(void *)&long long v14 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
      objc_msgSend_getUUIDBytes_(v10, v11, (uint64_t)&v14, v12);
      LOWORD(__b[0]) = v4;
      HIWORD(__b[0]) = 16;
      __b[2] = 16;
      *(_OWORD *)&__b[3] = v14;
      objc_msgSend_addAttribute_(self, v13, (uint64_t)__b, *(double *)&v14);
    }
  }
}

- (void)_addXORAddressAttribute:(int64_t)a3 value:(sockaddr *)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    int sa_family = a4->sa_family;
    if (sa_family == 30 || sa_family == 2)
    {
      __int16 v6 = a3;
      memset(__b, 170, sizeof(__b));
      __b[0] = v6;
      __b[1] = 128;
      __memcpy_chk();
      objc_msgSend_addAttribute_(self, v8, (uint64_t)__b, v9);
    }
  }
}

- (void)setTransactionID:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    memset(bytes, 170, sizeof(bytes));
    CCRNGStatus v5 = CCRandomGenerateBytes(bytes, 0xCuLL);
    if (v5)
    {
      CCRNGStatus v9 = v5;
      unint64_t v10 = objc_msgSend_Stun(IDSFoundationLog, v6, v7, v8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        CCRNGStatus v38 = v9;
        _os_log_impl(&dword_19D9BE000, v10, OS_LOG_TYPE_DEFAULT, "CCRandomGenerateBytes failed (%d), use arc4random_buf.", buf, 8u);
      }

      arc4random_buf(bytes, 0xCuLL);
    }
    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v6, (uint64_t)bytes, v8, 12);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)&self->_transactionID, v4);
  uint64_t v14 = objc_msgSend_bytes(self->_transactionID, v11, v12, v13);
  if (objc_msgSend_length(self->_transactionID, v15, v16, v17) == 12)
  {
    int v22 = objc_msgSend_stringWithCapacity_(MEMORY[0x1E4F28E78], v18, 24, v20);
    uint64_t v24 = 0;
    do
    {
      uint64_t v25 = objc_msgSend_stringWithFormat_(NSString, v21, @"%02X", v23, *(unsigned __int8 *)(v14 + v24));
      objc_msgSend_appendString_(v22, v26, (uint64_t)v25, v27);

      ++v24;
    }
    while (v24 != 12);
    objc_msgSend_stringWithString_(NSString, v21, (uint64_t)v22, v23);
    double v28 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestID = self->_requestID;
    self->_requestID = v28;
  }
  else
  {
    int v22 = objc_msgSend_Stun(IDSFoundationLog, v18, v19, v20);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v33 = objc_msgSend_length(self->_transactionID, v30, v31, v32);
      *(_DWORD *)bytes = 134218240;
      *(void *)&bytes[4] = v33;
      __int16 v35 = 2048;
      uint64_t v36 = 12;
      _os_log_impl(&dword_19D9BE000, v22, OS_LOG_TYPE_DEFAULT, "ERROR: TransactionID length = %lu, mismatch STUN_TRANSACTIONID_LEN = %ld", bytes, 0x16u);
    }
  }
}

- (void)setAttributes:(id)a3
{
  uint64_t v265 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_objectForKey_(v4, v5, @"ids-stun-attribute-channelnumber", v6);

  if (v7)
  {
    unint64_t v10 = objc_msgSend_objectForKey_(v4, v8, @"ids-stun-attribute-channelnumber", v9);
    int v14 = objc_msgSend_unsignedIntegerValue(v10, v11, v12, v13);
    objc_msgSend__addUInt32Attribute_value_(self, v15, 12, v16, (v14 << 16));
  }
  double v17 = objc_msgSend_objectForKey_(v4, v8, @"ids-stun-attribute-qr-sessiontokenkey", v9);

  if (v17)
  {
    double v20 = objc_msgSend_objectForKey_(v4, v18, @"ids-stun-attribute-qr-sessiontokenkey", v19);
    uint64_t v24 = objc_msgSend_Stun(IDSFoundationLog, v21, v22, v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v20;
      _os_log_impl(&dword_19D9BE000, v24, OS_LOG_TYPE_DEFAULT, "setAttributes: IDSStunAttributeQRSessionTokenKey: %@", buf, 0xCu);
    }

    objc_msgSend__addBinaryDataAttribute_value_(self, v25, 65522, v26, v20);
  }
  double v27 = objc_msgSend_objectForKey_(v4, v18, @"ids-stun-attribute-qr-realloctoken", v19);

  if (v27)
  {
    uint64_t v31 = objc_msgSend_objectForKey_(v4, v28, @"ids-stun-attribute-qr-realloctoken", v30);
    __int16 v35 = objc_msgSend_Stun(IDSFoundationLog, v32, v33, v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v31;
      _os_log_impl(&dword_19D9BE000, v35, OS_LOG_TYPE_DEFAULT, "setAttributes: IDSStunAttributeQRReallocToken: %@", buf, 0xCu);
    }

    objc_msgSend__addBinaryDataAttribute_value_(self, v36, 65520, v37, v31);
  }
  objc_msgSend_allKeys(v4, v28, v29, v30);
  long long v261 = 0u;
  long long v262 = 0u;
  long long v259 = 0u;
  long long v260 = 0u;
  id v38 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v39, (uint64_t)&v259, v40, v264, 16);
  if (!v42)
  {

    goto LABEL_115;
  }
  v257 = 0;
  char v258 = 0;
  uint64_t v43 = *(void *)v260;
  uint64_t v44 = 138412290;
  p_requiresAES128CTR = &self->_requiresAES128CTR;
  do
  {
    for (uint64_t i = 0; i != v42; ++i)
    {
      if (*(void *)v260 != v43) {
        objc_enumerationMutation(v38);
      }
      v46 = *(void **)(*((void *)&v259 + 1) + 8 * i);
      v47 = objc_msgSend_objectForKey_(v4, v41, (uint64_t)v46, *(double *)&v44, v254);
      if (objc_msgSend_isEqualToString_(v46, v48, @"ids-stun-attribute-requestedtransport", v49))
      {
        int v53 = objc_msgSend_unsignedCharValue(v47, v50, v51, v52);
        objc_msgSend__addUInt32Attribute_value_(self, v54, 25, v55, (v53 << 24));
      }
      else if ((objc_msgSend_isEqualToString_(v46, v50, @"ids-stun-attribute-qr-sessiontokenkey", v52) & 1) == 0)
      {
        if (objc_msgSend_isEqualToString_(v46, v56, @"ids-stun-attribute-qr-sessionid", v57))
        {
          objc_msgSend__addUUIDAttribute_value_(self, v58, 65521, v59, v47);
        }
        else if (objc_msgSend_isEqualToString_(v46, v58, @"ids-stun-attribute-lifetime", v59))
        {
          uint64_t v63 = objc_msgSend_unsignedIntegerValue(v47, v60, v61, v62);
          objc_msgSend__addUInt32Attribute_value_(self, v64, 13, v65, v63);
        }
        else if ((objc_msgSend_isEqualToString_(v46, v60, @"ids-stun-attribute-qr-realloctoken", v62) & 1) == 0)
        {
          if (objc_msgSend_isEqualToString_(v46, v66, @"ids-stun-attribute-messageintegrity", v67))
          {
            objc_msgSend_setKey_(self, v68, (uint64_t)v47, v69);
            char v258 = 1;
          }
          else if (objc_msgSend_isEqualToString_(v46, v68, @"ids-stun-attribute-data", v69))
          {
            objc_msgSend__addBinaryDataAttribute_value_(self, v70, 19, v71, v47);
          }
          else if ((objc_msgSend_isEqualToString_(v46, v70, @"ids-stun-attribute-channelnumber", v71) & 1) == 0)
          {
            if (objc_msgSend_isEqualToString_(v46, v72, @"ids-stun-attribute-xormappedaddress", v73))
            {
              uint64_t v77 = objc_msgSend_sa(v47, v74, v75, v76);
              objc_msgSend__addXORAddressAttribute_value_(self, v78, 32, v79, v77);
            }
            else if (objc_msgSend_isEqualToString_(v46, v74, @"ids-stun-attribute-cellrat", v76))
            {
              unsigned __int8 v83 = objc_msgSend_unsignedIntegerValue(v47, v80, v81, v82);
              objc_msgSend__addUInt32Attribute_value_(self, v84, 32775, v85, v83);
            }
            else if (objc_msgSend_isEqualToString_(v46, v80, @"ids-stun-attribute-linkuuid", v82))
            {
              objc_msgSend__addBinaryDataAttribute_value_(self, v86, 32776, v87, v47);
            }
            else if (objc_msgSend_isEqualToString_(v46, v86, @"ids-stun-attribute-software", v87))
            {
              objc_msgSend__addBinaryDataAttribute_value_(self, v88, 32802, v89, v47);
            }
            else if (objc_msgSend_isEqualToString_(v46, v88, @"ids-stun-attribute-clienttime", v89))
            {
              uint64_t v93 = objc_msgSend_unsignedIntegerValue(v47, v90, v91, v92);
              objc_msgSend__addUInt32Attribute_value_(self, v94, 65523, v95, v93);
            }
            else if (objc_msgSend_isEqualToString_(v46, v90, @"ids-stun-attribute-clientlatency", v92))
            {
              uint64_t v99 = objc_msgSend_unsignedIntegerValue(v47, v96, v97, v98);
              objc_msgSend__addUInt32Attribute_value_(self, v100, 65524, v101, v99);
            }
            else if (objc_msgSend_isEqualToString_(v46, v96, @"ids-stun-attribute-infoflags", v98))
            {
              uint64_t v105 = objc_msgSend_unsignedIntegerValue(v47, v102, v103, v104);
              objc_msgSend__addUInt32Attribute_value_(self, v106, 65525, v107, v105);
            }
            else if (objc_msgSend_isEqualToString_(v46, v102, @"ids-stun-attribute-capabilityflags", v104))
            {
              uint64_t v111 = objc_msgSend_longValue(v47, v108, v109, v110);
              objc_msgSend__addUInt64Attribute_value_(self, v112, 65527, v113, v111);
            }
            else if (objc_msgSend_isEqualToString_(v46, v108, @"ids-stun-attribute-enc-pub-streams", v110))
            {
              BOOL *p_requiresAES128CTR = 1;
              objc_msgSend__addBinaryDataAttribute_value_(self, v114, 60929, v115, v47);
            }
            else if (objc_msgSend_isEqualToString_(v46, v114, @"ids-stun-attribute-enc-sub-streams", v115))
            {
              BOOL *p_requiresAES128CTR = 1;
              objc_msgSend__addBinaryDataAttribute_value_(self, v116, 60930, v117, v47);
            }
            else if (objc_msgSend_isEqualToString_(v46, v116, @"ids-stun-attribvute-enc-marker", v117))
            {
              id v120 = v47;

              v257 = v120;
            }
            else if (objc_msgSend_isEqualToString_(v46, v118, @"ids-stun-attribute-generation-counter", v119))
            {
              uint64_t v124 = objc_msgSend_unsignedIntegerValue(v47, v121, v122, v123);
              objc_msgSend__addUInt32Attribute_value_(self, v125, 65531, v126, v124);
            }
            else if (objc_msgSend_isEqualToString_(v46, v121, @"ids-stun-attribute-max-concurrent-streams", v123))
            {
              unsigned __int8 v130 = objc_msgSend_unsignedIntValue(v47, v127, v128, v129);
              objc_msgSend__addUInt8Attribute_value_(self, v131, 65532, v132, v130);
            }
            else if (objc_msgSend_isEqualToString_(v46, v127, @"ids-stun-attribute-sent-packets", v129))
            {
              uint64_t v136 = objc_msgSend_unsignedIntegerValue(v47, v133, v134, v135);
              objc_msgSend__addUInt32Attribute_value_(self, v137, 65504, v138, v136);
            }
            else if (objc_msgSend_isEqualToString_(v46, v133, @"ids-stun-attribute-received-packets", v135))
            {
              uint64_t v142 = objc_msgSend_unsignedIntegerValue(v47, v139, v140, v141);
              objc_msgSend__addUInt32Attribute_value_(self, v143, 65505, v144, v142);
            }
            else if (objc_msgSend_isEqualToString_(v46, v139, @"ids-stun-attribute-channel-binding-info", v141))
            {
              uint64_t v148 = objc_msgSend_unsignedIntegerValue(v47, v145, v146, v147);
              objc_msgSend__addUInt32Attribute_value_(self, v149, 65508, v150, v148);
            }
            else if (objc_msgSend_isEqualToString_(v46, v145, @"ids-stun-attribute-relay-link-id", v147))
            {
              unsigned __int16 v154 = objc_msgSend_unsignedIntegerValue(v47, v151, v152, v153);
              objc_msgSend__addUInt16Attribute_value_(self, v155, 65509, v156, v154);
            }
            else if (objc_msgSend_isEqualToString_(v46, v151, @"ids-stun-attribute-qr-request-id", v153))
            {
              uint64_t v160 = objc_msgSend_unsignedIntegerValue(v47, v157, v158, v159);
              objc_msgSend__addUInt32Attribute_value_(self, v161, 65510, v162, v160);
            }
            else if (objc_msgSend_isEqualToString_(v46, v157, @"ids-stun-attribute-qr-cookie", v159))
            {
              uint64_t v166 = objc_msgSend_unsignedIntegerValue(v47, v163, v164, v165);
              objc_msgSend__addUInt32Attribute_value_(self, v167, 65513, v168, v166);
            }
            else if (objc_msgSend_isEqualToString_(v46, v163, @"ids-stun-attribute-qr-testoptions", v165))
            {
              uint64_t v172 = objc_msgSend_unsignedIntegerValue(v47, v169, v170, v171);
              objc_msgSend__addUInt32Attribute_value_(self, v173, 65511, v174, v172);
            }
            else if (objc_msgSend_isEqualToString_(v46, v169, @"ids-stun-attribute-qr-test-requested-message", v171))
            {
              unsigned __int16 v178 = objc_msgSend_unsignedIntegerValue(v47, v175, v176, v177);
              objc_msgSend__addUInt16Attribute_value_(self, v179, 65472, v180, v178);
            }
            else if (objc_msgSend_isEqualToString_(v46, v175, @"ids-stun-attribute-qr-test-requested-error-code", v177))
            {
              unsigned __int16 v184 = objc_msgSend_unsignedIntegerValue(v47, v181, v182, v183);
              objc_msgSend__addUInt16Attribute_value_(self, v185, 65474, v186, v184);
            }
            else if (objc_msgSend_isEqualToString_(v46, v181, @"ids-stun-attribute-qr-testsuboperation", v183))
            {
              objc_msgSend__addBinaryDataAttribute_value_(self, v187, 65473, v188, v47);
            }
            else if (objc_msgSend_isEqualToString_(v46, v187, @"ids-stun-attribute-link-attributes", v188))
            {
              uint64_t v192 = objc_msgSend_unsignedIntegerValue(v47, v189, v190, v191);
              objc_msgSend__addUInt32Attribute_value_(self, v193, 32803, v194, v192);
            }
            else if (objc_msgSend_isEqualToString_(v46, v189, @"ids-stun-attribute-data-so-masks-attributes", v191))
            {
              uint64_t v198 = objc_msgSend_unsignedIntegerValue(v47, v195, v196, v197);
              objc_msgSend__addUInt32Attribute_value_(self, v199, 32804, v200, v198);
            }
            else if (objc_msgSend_isEqualToString_(v46, v195, @"gl-attr-error-code-data", v197))
            {
              uint64_t v204 = objc_msgSend_unsignedIntegerValue(v47, v201, v202, v203);
              objc_msgSend__addUInt32Attribute_value_(self, v205, 9, v206, v204);
            }
            else if (objc_msgSend_isEqualToString_(v46, v201, @"ids-stun-attribute-session-state-counter", v203))
            {
              uint64_t v210 = objc_msgSend_unsignedIntegerValue(v47, v207, v208, v209);
              objc_msgSend__addUInt32Attribute_value_(self, v211, 65489, v212, v210);
            }
            else if (objc_msgSend_isEqualToString_(v46, v207, @"ids-stun-attribute-session-state-type", v209))
            {
              unsigned __int16 v216 = objc_msgSend_unsignedIntegerValue(v47, v213, v214, v215);
              objc_msgSend__addUInt16Attribute_value_(self, v217, 65518, v218, v216);
            }
            else if (objc_msgSend_isEqualToString_(v46, v213, @"ids-stun-attribute-enc-ParticipantIDs", v215))
            {
              BOOL *p_requiresAES128CTR = 1;
              objc_msgSend__addBinaryDataAttribute_value_(self, v219, 60928, v220, v47);
            }
            else if (objc_msgSend_isEqualToString_(v46, v219, @"ids-stun-attribute-plugin-name", v220))
            {
              BOOL *p_requiresAES128CTR = 1;
              objc_msgSend__addBinaryDataAttribute_value_(self, v221, 60935, v222, v47);
            }
            else if (objc_msgSend_isEqualToString_(v46, v221, @"ids-stun-attribute-raw-public-key", v222))
            {
              objc_msgSend__addBinaryDataAttribute_value_(self, v223, 65495, v224, v47);
            }
            else if (objc_msgSend_isEqualToString_(v46, v223, @"ids-stun-attribute-plugin-operation", v224))
            {
              unsigned __int8 v228 = objc_msgSend_unsignedIntValue(v47, v225, v226, v227);
              objc_msgSend__addUInt8Attribute_value_(self, v229, 65491, v230, v228);
            }
            else if (objc_msgSend_isEqualToString_(v46, v225, @"ids-stun-attribute-qr-server-blob", v227))
            {
              objc_msgSend__addBinaryDataAttribute_value_(self, v231, 65503, v232, v47);
            }
            else if (objc_msgSend_isEqualToString_(v46, v231, @"ids-stun-attribute-tle-p2p-blob", v232))
            {
              objc_msgSend__addBinaryDataAttribute_value_(self, v233, 36865, v234, v47);
            }
            else if (objc_msgSend_isEqualToString_(v46, v233, @"ids-stun-attribute-tle-p2p-connection-id-ids", v234))
            {
              uint64_t v238 = objc_msgSend_unsignedIntValue(v47, v235, v236, v237);
              objc_msgSend__addUInt32Attribute_value_(self, v239, 36867, v240, v238);
            }
            else if (objc_msgSend_isEqualToString_(v46, v235, @"ids-stun-attribute-tle-p2p-connection-id-avc", v237))
            {
              uint64_t v244 = objc_msgSend_unsignedIntValue(v47, v241, v242, v243);
              objc_msgSend__addUInt32Attribute_value_(self, v245, 36866, v246, v244);
            }
            else if (objc_msgSend_isEqualToString_(v46, v241, @"ids-stun-attribute-qr-materials", v243))
            {
              objc_msgSend__addBinaryDataAttribute_value_(self, v247, 65499, v248, v47);
            }
            else
            {
              oslog = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v46;
                _os_log_impl(&dword_19D9BE000, oslog, OS_LOG_TYPE_ERROR, "receive unknown stun attribute key %@ for QR stun message, ignore.", buf, 0xCu);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                _IDSWarnV();
                _IDSLogV(0, @"IDSFoundation", @"Warning", @"receive unknown stun attribute key %@ for QR stun message, ignore.");
                v254 = v46;
                _IDSLogTransport(@"Warning", @"IDS", @"receive unknown stun attribute key %@ for QR stun message, ignore.");
              }
            }
          }
        }
      }
    }
    uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v41, (uint64_t)&v259, *(double *)&v44, v264, 16);
  }
  while (v42);

  if (v257)
  {
    objc_msgSend__addBinaryDataAttribute_value_(self, v249, 60934, v250);
    if ((v258 & 1) == 0) {
      goto LABEL_116;
    }
    goto LABEL_114;
  }
  if ((v258 & 1) == 0)
  {
LABEL_115:
    v257 = 0;
    goto LABEL_116;
  }
LABEL_114:
  memset(buf, 170, 20);
  v251 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v249, (uint64_t)buf, v250, 20, v254);
  objc_msgSend__addBinaryDataAttribute_value_(self, v252, 8, v253, v251);

LABEL_116:
}

- (void)setTransactionID:(id)a3 attributes:(id)a4
{
  id v10 = a4;
  objc_msgSend_setTransactionID_(self, v6, (uint64_t)a3, v7);
  objc_msgSend_setAttributes_(self, v8, (uint64_t)v10, v9);
}

- (BOOL)write:(char *)a3 outputLength:(int *)a4 remainingLength:(unint64_t)a5
{
  return objc_msgSend_write_outputLength_remainingLength_internal_(self, a2, (uint64_t)a3, v5, a4, a5, 1);
}

- (BOOL)write:(char *)a3 outputLength:(int *)a4 remainingLength:(unint64_t)a5 internal:(BOOL)a6
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  int v61 = -1431655766;
  if (!a3 || !a4)
  {
    double v13 = objc_msgSend_Stun(IDSFoundationLog, a2, (uint64_t)a3, v6, a4, a5, a6);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_19DB7C88C();
    }

    return 0;
  }
  unint64_t v9 = a5;
  if (!a5)
  {
    int v14 = objc_msgSend_Stun(IDSFoundationLog, a2, (uint64_t)a3, v6);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_19DB7C554(v14, v15, v16, v17, v18, v19, v20, v21);
    }
LABEL_70:

    return 0;
  }
  BOOL v10 = a6;
  if (a6)
  {
    unint64_t v9 = a5 - 1;
    *a3 = 15;
    uint64_t v12 = a3 + 1;
  }
  else
  {
    uint64_t v12 = a3;
  }
  if (v9 <= 3)
  {
    int v14 = objc_msgSend_Stun(IDSFoundationLog, a2, (uint64_t)a3, v6);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_19DB7C5C4();
    }
    goto LABEL_70;
  }
  *(_WORD *)uint64_t v12 = bswap32(LOWORD(self->_type)) >> 16;
  if (v9 - 4 <= 3)
  {
    int v14 = objc_msgSend_Stun(IDSFoundationLog, a2, (uint64_t)a3, v6);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_19DB7C62C();
    }
    goto LABEL_70;
  }
  *((_DWORD *)v12 + 1) = 1118048801;
  if (v9 - 8 <= 0xB)
  {
    int v14 = objc_msgSend_Stun(IDSFoundationLog, a2, (uint64_t)a3, v6);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_19DB7C694();
    }
    goto LABEL_70;
  }
  uint64_t v22 = objc_msgSend_bytes(self->_transactionID, a2, (uint64_t)a3, v6);
  uint64_t v26 = *(void *)v22;
  *((_DWORD *)v12 + 4) = *(_DWORD *)(v22 + 8);
  *((void *)v12 + 1) = v26;
  uint64_t v27 = (uint64_t)(v12 + 20);
  p_unint64_t numAttribute = &self->_numAttribute;
  if (self->_numAttribute >= 1)
  {
    uint64_t v29 = 0;
    uint64_t v30 = 0;
    unint64_t v31 = v9 - 20;
    uint64_t v25 = 67109376;
    while (1)
    {
      int v61 = 0;
      uint64_t v33 = &self->_attributes[v29];
      unsigned int type = v33->type;
      if (type <= 0x9001)
      {
        switch(self->_attributes[v29].type)
        {
          case 6u:
          case 8u:
          case 0x13u:
            goto LABEL_33;
          case 7u:
          case 0xBu:
          case 0xEu:
          case 0xFu:
          case 0x10u:
          case 0x11u:
          case 0x14u:
          case 0x15u:
          case 0x17u:
          case 0x18u:
          case 0x1Au:
          case 0x1Bu:
          case 0x1Cu:
          case 0x1Du:
          case 0x1Eu:
          case 0x1Fu:
          case 0x21u:
          case 0x23u:
          case 0x24u:
            goto LABEL_57;
          case 9u:
            writeStunErrorCodeAttribute(&self->_attributes[v29].type, v27, &v61, v31, *(double *)&v25);
            goto LABEL_46;
          case 0xAu:
            writeStunUnknownAttribute((int *)&self->_attributes[v29], v27, &v61, v31, *(double *)&v25);
            goto LABEL_46;
          case 0xCu:
          case 0xDu:
          case 0x19u:
          case 0x25u:
            goto LABEL_45;
          case 0x12u:
          case 0x16u:
          case 0x20u:
            double v34 = objc_msgSend_transactionID(self, v23, v24, *(double *)&v25);
            writeStunXORAddressAttribute(&self->_attributes[v29].type, v34, v27, &v61, v31);
            goto LABEL_26;
          case 0x22u:
            goto LABEL_43;
          default:
            if (type - 32773 > 0x1F) {
              goto LABEL_32;
            }
            int v35 = 1 << (type - 5);
            if ((v35 & 0x20000009) != 0) {
              goto LABEL_33;
            }
            if ((v35 & 0xC0000004) != 0) {
              goto LABEL_45;
            }
LABEL_32:
            if (type == 36865) {
              goto LABEL_33;
            }
            goto LABEL_57;
        }
      }
      switch(self->_attributes[v29].type)
      {
        case 0xFFC0u:
        case 0xFFC2u:
        case 0xFFE5u:
        case 0xFFEEu:
          writeStunUINT16Attribute(&self->_attributes[v29].type, v27, &v61, v31, *(double *)&v25);
          goto LABEL_46;
        case 0xFFC1u:
        case 0xFFD7u:
        case 0xFFDBu:
        case 0xFFDFu:
        case 0xFFF0u:
        case 0xFFF1u:
        case 0xFFF2u:
LABEL_33:
          writeStunBinaryDataAttribute(&self->_attributes[v29].type, v27, &v61, v31, *(double *)&v25);
          goto LABEL_46;
        case 0xFFC3u:
        case 0xFFC4u:
        case 0xFFC5u:
        case 0xFFC6u:
        case 0xFFC7u:
        case 0xFFC8u:
        case 0xFFC9u:
        case 0xFFCAu:
        case 0xFFCBu:
        case 0xFFCCu:
        case 0xFFCDu:
        case 0xFFCEu:
        case 0xFFCFu:
        case 0xFFD0u:
        case 0xFFD2u:
        case 0xFFD4u:
        case 0xFFD5u:
        case 0xFFD6u:
        case 0xFFD8u:
        case 0xFFD9u:
        case 0xFFDAu:
        case 0xFFDCu:
        case 0xFFDDu:
        case 0xFFDEu:
        case 0xFFE8u:
        case 0xFFEAu:
        case 0xFFEBu:
        case 0xFFECu:
        case 0xFFEDu:
        case 0xFFEFu:
        case 0xFFF6u:
        case 0xFFF8u:
        case 0xFFF9u:
        case 0xFFFAu:
          goto LABEL_57;
        case 0xFFD1u:
        case 0xFFE0u:
        case 0xFFE1u:
        case 0xFFE2u:
        case 0xFFE4u:
        case 0xFFE6u:
        case 0xFFE7u:
        case 0xFFE9u:
        case 0xFFF3u:
        case 0xFFF4u:
        case 0xFFF5u:
        case 0xFFFBu:
          goto LABEL_45;
        case 0xFFD3u:
        case 0xFFFCu:
          writeStunUINT8Attribute(&self->_attributes[v29].type, v27, &v61, v31, *(double *)&v25);
          goto LABEL_46;
        case 0xFFE3u:
        case 0xFFF7u:
LABEL_43:
          writeStunUINT64Attribute(&self->_attributes[v29].type, v27, &v61, v31, *(double *)&v25);
          goto LABEL_46;
        default:
          if (type - 60928 > 7 || ((1 << type) & 0xC7) == 0)
          {
            if (type - 36866 < 2)
            {
LABEL_45:
              writeStunUINT32Attribute(&self->_attributes[v29].type, v27, &v61, v31, *(double *)&v25);
              goto LABEL_46;
            }
LABEL_57:
            double v34 = objc_msgSend_Stun(IDSFoundationLog, v23, v24, *(double *)&v25);
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              int v45 = v33->type;
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&uint8_t buf[4] = v45;
              _os_log_impl(&dword_19D9BE000, v34, OS_LOG_TYPE_DEFAULT, "write: unknown attribute %04X", buf, 8u);
            }
LABEL_26:
          }
          else
          {
            double v37 = objc_msgSend_Stun(IDSFoundationLog, v23, v24, *(double *)&v25);
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              int v38 = v33->type;
              unsigned int u32 = self->_attributes[v29].value.u32;
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = v38;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = u32;
              _os_log_impl(&dword_19D9BE000, v37, OS_LOG_TYPE_DEFAULT, "send enc attr %04X, %dB.", buf, 0xEu);
            }

            v41 = (char *)self + v29 * 1488;
            if (!self->_attributes[v29].encrypted && *((_WORD *)v41 + 21) && self->_cryptorRef)
            {
              __dst = self->_cryptorRef;
              memset(buf, 170, sizeof(buf));
              size_t __n = 0;
              if (!StunUtilDoAES128CTR(__dst, &self->_attributes[v29].value.u32 + 1, self->_attributes[v29].value.binaryData.len, buf, &__n))
              {
                v46 = objc_msgSend_Stun(IDSFoundationLog, v42, v43, v44);
                if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                {
                  int v47 = v33->type;
                  *(_DWORD *)double v62 = 67109120;
                  int v63 = v47;
                  _os_log_impl(&dword_19D9BE000, v46, OS_LOG_TYPE_DEFAULT, "write: failed to enc attribute %04x.", v62, 8u);
                }

                p_unint64_t numAttribute = &self->_numAttribute;
                goto LABEL_48;
              }
              unsigned int v58 = __n;
              memcpy(&self->_attributes[v29].value.u32 + 1, buf, __n);
              self->_attributes[v29].value.unsigned int u32 = v58;
              v41[46] = 1;
            }
            writeStunBinaryDataAttribute(&self->_attributes[v29].type, v27, &v61, v31, v40);
          }
          p_unint64_t numAttribute = &self->_numAttribute;
LABEL_46:
          if (v31 < v61)
          {
            int v14 = objc_msgSend_Stun(IDSFoundationLog, v23, v24, *(double *)&v25);
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
              sub_19DB7C6FC(&v61, v31, v14);
            }
            goto LABEL_70;
          }
          v27 += v61;
          v31 -= v61;
LABEL_48:
          ++v30;
          ++v29;
          if (v30 >= *p_numAttribute) {
            goto LABEL_62;
          }
          break;
      }
    }
  }
LABEL_62:
  int v48 = v27 - a3;
  if (v27 - (uint64_t)a3 <= 19)
  {
    int v14 = objc_msgSend_Stun(IDSFoundationLog, v23, v24, *(double *)&v25);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_19DB7C788(v48, v14);
    }
    goto LABEL_70;
  }
  unsigned int v49 = v48 - 20;
  self->_len = v48 - 20;
  if (v10)
  {
    if ((_WORD)v48 == 20)
    {
      int v14 = objc_msgSend_Stun(IDSFoundationLog, v23, v24, *(double *)&v25);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_19DB7C810(&self->_len, v14);
      }
      goto LABEL_70;
    }
    unsigned int v49 = v48 - 21;
    self->_len = v48 - 21;
    uint64_t v50 = 3;
  }
  else
  {
    uint64_t v50 = 2;
  }
  *(_WORD *)&a3[v50] = bswap32(v49) >> 16;
  *a4 = v48;
  key = self->_key;
  if (key)
  {
    int v53 = (const void *)objc_msgSend_bytes(key, v23, v24, *(double *)&v25);
    size_t v57 = objc_msgSend_length(self->_key, v54, v55, v56);
    CCHmac(0, v53, v57, a3, v48 - 24, &a3[v48 - 20]);
  }
  return 1;
}

- (BOOL)verifyMessageIntegrityWithKey:(id)a3 inputBuffer:(char *)a4 inputLength:(int)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a5 < 44) {
    return 0;
  }
  size_t v7 = (a5 - 24);
  memset(v18, 170, 20);
  id v8 = a3;
  uint64_t v12 = (const void *)objc_msgSend_bytes(v8, v9, v10, v11, *(void *)v18, *(void *)&v18[8], *(void *)&v18[16], v19);
  size_t v16 = objc_msgSend_length(v8, v13, v14, v15);

  CCHmac(0, v12, v16, a4, v7, v18);
  return timingsafe_bcmp(v18, &a4[a5 - 20], 0x14uLL) == 0;
}

- (BOOL)read:(char *)a3 inputLength:(unint64_t)a4
{
  return objc_msgSend_read_inputLength_internal_(self, a2, (uint64_t)a3, v4, a4, 1);
}

- (BOOL)read:(char *)a3 inputLength:(unint64_t)a4 internal:(BOOL)a5
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    id v8 = objc_msgSend_Stun(IDSFoundationLog, a2, 0, v5, a4, a5);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      unint64_t v9 = "read: invalid inputBuffer";
      uint64_t v10 = v8;
      uint32_t v11 = 2;
      goto LABEL_10;
    }
LABEL_11:

LABEL_12:
    LOBYTE(v12) = 0;
    return v12;
  }
  if (a5) {
    unint64_t v7 = 21;
  }
  else {
    unint64_t v7 = 20;
  }
  if (v7 > a4)
  {
    id v8 = objc_msgSend_Stun(IDSFoundationLog, a2, (uint64_t)a3, v5);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      *(void *)v64 = a4;
      *(_WORD *)&v64[8] = 2048;
      unint64_t v65 = v7;
      unint64_t v9 = "read: short packet (%zd < %zd)";
      uint64_t v10 = v8;
      uint32_t v11 = 22;
LABEL_10:
      _os_log_impl(&dword_19D9BE000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  double v15 = &a3[a5];
  self->_unsigned int type = bswap32(*(unsigned __int16 *)v15) >> 16;
  uint64_t v16 = bswap32(*((unsigned __int16 *)v15 + 1)) >> 16;
  self->_len = v16;
  if (v16 + 20 > a4)
  {
    uint64_t v17 = objc_msgSend_Stun(IDSFoundationLog, a2, (uint64_t)a3, v5);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = self->_len + 20;
      *(_DWORD *)buf = 134218240;
      *(void *)v64 = a4;
      *(_WORD *)&v64[8] = 1024;
      LODWORD(v65) = v18;
      _os_log_impl(&dword_19D9BE000, v17, OS_LOG_TYPE_DEFAULT, "read: short packet (%zd < %d)", buf, 0x12u);
    }

    goto LABEL_12;
  }
  unsigned int v19 = *((_DWORD *)v15 + 1);
  if (v19 != 1118048801)
  {
    id v8 = objc_msgSend_Stun(IDSFoundationLog, a2, (uint64_t)a3, v5);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v64 = bswap32(v19);
    unint64_t v9 = "read: invalid magic cookie %08X";
    uint64_t v10 = v8;
    uint32_t v11 = 8;
    goto LABEL_10;
  }
  p_unint64_t numAttribute = &self->_numAttribute;
  uint64_t v21 = &a3[a4];
  uint64_t v61 = *((void *)v15 + 1);
  int v62 = *((_DWORD *)v15 + 4);
  uint64_t v22 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], a2, (uint64_t)&v61, v5, 12);
  objc_msgSend_setTransactionID_(self, v23, (uint64_t)v22, v24);

  uint64_t v25 = (unsigned __int8 *)(v15 + 24);
  LOBYTE(v12) = v15 + 24 > v21;
  if (v15 + 24 > v21)
  {
    int v26 = 0;
    goto LABEL_82;
  }
  int v26 = 0;
  unint64_t v27 = 0;
  attributes = (int8x16_t *)self->_attributes;
  uint64_t v29 = (unsigned __int8 *)(v15 + 20);
  while (2)
  {
    unint64_t v30 = v27;
    attributes->i16[0] = bswap32(*(unsigned __int16 *)v29) >> 16;
    unsigned int v31 = bswap32(*((unsigned __int16 *)v29 + 1));
    attributes->i16[1] = HIWORD(v31);
    unsigned int v60 = HIWORD(v31);
    if ((StunUtilHasValidAttrLength((uint64_t)v25, HIWORD(v31), (unint64_t)v21) & 1) == 0)
    {
      v54 = objc_msgSend_Stun(IDSFoundationLog, v32, v33, v34);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        int v55 = attributes->u16[0];
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v64 = v60;
        *(_WORD *)&v64[4] = 1024;
        *(_DWORD *)&v64[6] = v55;
        double v56 = "read: bad attribute length %d, type %u";
        size_t v57 = v54;
        uint32_t v58 = 14;
LABEL_79:
        _os_log_impl(&dword_19D9BE000, v57, OS_LOG_TYPE_DEFAULT, v56, buf, v58);
      }
LABEL_80:

      return v12;
    }
    if ((int)v21 - (int)v25 < 0)
    {
      v54 = objc_msgSend_Stun(IDSFoundationLog, v32, v33, v34);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v64 = v21 - v25;
        double v56 = "remaining Bytes = %d";
        size_t v57 = v54;
        uint32_t v58 = 8;
        goto LABEL_79;
      }
      goto LABEL_80;
    }
    unsigned int v35 = attributes->u16[0];
    if (v35 <= 0x9001)
    {
      switch(attributes->i16[0])
      {
        case 6:
        case 8:
        case 0x13:
          goto LABEL_39;
        case 7:
        case 0xB:
        case 0xE:
        case 0xF:
        case 0x10:
        case 0x11:
        case 0x14:
        case 0x15:
        case 0x17:
        case 0x18:
        case 0x1A:
        case 0x1B:
        case 0x1C:
        case 0x1D:
        case 0x1E:
        case 0x1F:
        case 0x21:
        case 0x23:
        case 0x24:
          goto LABEL_62;
        case 9:
          attributes->i16[2] = 6;
          char StunErrorCodeAttribute = readStunErrorCodeAttribute(attributes, (char *)&v60, v25, (int)v21 - (int)v25, v34);
          goto LABEL_44;
        case 0xA:
          attributes->i16[2] = 9;
          int StunUnknownAttribute = readStunUnknownAttribute((uint64_t)attributes, (int *)&v60, (unsigned __int16 *)v25, (int)v21 - (int)v25);
          double v44 = objc_msgSend_Stun(IDSFoundationLog, v41, v42, v43);
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            int v45 = @"NO";
            if (StunUnknownAttribute) {
              int v45 = @"YES";
            }
            *(_DWORD *)buf = 138412290;
            *(void *)v64 = v45;
            _os_log_impl(&dword_19D9BE000, v44, OS_LOG_TYPE_DEFAULT, "read unknown attribute, success = %@", buf, 0xCu);
          }

          ++v26;
          if ((StunUnknownAttribute & 1) == 0) {
            goto LABEL_81;
          }
          goto LABEL_45;
        case 0xC:
        case 0xD:
        case 0x19:
        case 0x25:
          goto LABEL_43;
        case 0x12:
        case 0x16:
        case 0x20:
          attributes->i16[2] = 2;
          char StunErrorCodeAttribute = readStunXORAddressAttribute(attributes, &v60, self->_transactionID, (uint64_t)v25, (int)v21 - (int)v25);
          goto LABEL_44;
        case 0x22:
          goto LABEL_30;
        default:
          if (v35 - 32773 > 0x1F) {
            goto LABEL_34;
          }
          int v37 = 1 << (v35 - 5);
          if ((v37 & 0x20000009) != 0) {
            goto LABEL_39;
          }
          if ((v37 & 0xC0000004) != 0) {
            goto LABEL_43;
          }
LABEL_34:
          if (v35 != 36865) {
            goto LABEL_62;
          }
          goto LABEL_39;
      }
    }
    switch(attributes->i16[0])
    {
      case 0xFFD1:
      case 0xFFE0:
      case 0xFFE1:
      case 0xFFE2:
      case 0xFFE4:
      case 0xFFE6:
      case 0xFFE8:
      case 0xFFE9:
      case 0xFFF3:
      case 0xFFF4:
      case 0xFFF5:
      case 0xFFFB:
        goto LABEL_43;
      case 0xFFD2:
        attributes->i16[2] = 8;
        uint64_t v38 = (int)v60;
        ++v26;
        if (v60) {
          goto LABEL_81;
        }
        goto LABEL_46;
      case 0xFFD3:
        attributes->i16[2] = 10;
        char StunErrorCodeAttribute = readStunUINT8Attribute((uint64_t)attributes, (char *)&v60, v25, (int)v21 - (int)v25, v34);
        goto LABEL_44;
      case 0xFFD4:
      case 0xFFD6:
      case 0xFFD7:
      case 0xFFD8:
      case 0xFFD9:
      case 0xFFDA:
      case 0xFFDC:
      case 0xFFDD:
      case 0xFFDE:
      case 0xFFE7:
      case 0xFFEF:
      case 0xFFF2:
      case 0xFFF6:
      case 0xFFF8:
      case 0xFFF9:
      case 0xFFFA:
        goto LABEL_62;
      case 0xFFD5:
      case 0xFFE3:
      case 0xFFF7:
LABEL_30:
        attributes->i16[2] = 4;
        char StunErrorCodeAttribute = readStunUINT64Attribute((uint64_t)attributes, (char *)&v60, (unint64_t *)v25, (int)v21 - (int)v25, v34);
        goto LABEL_44;
      case 0xFFDB:
      case 0xFFDF:
      case 0xFFEA:
      case 0xFFEB:
      case 0xFFED:
      case 0xFFF0:
      case 0xFFF1:
        goto LABEL_39;
      case 0xFFE5:
      case 0xFFEC:
      case 0xFFEE:
        attributes->i16[2] = 7;
        ++v26;
        if (!readStunUINT16Attribute((uint64_t)attributes, (char *)&v60, (unsigned __int16 *)v25, (int)v21 - (int)v25, v34))goto LABEL_81; {
        goto LABEL_45;
        }
      default:
        if (v35 - 60928 <= 0xB && ((1 << v35) & 0xD71) != 0)
        {
          self->_requiresAES128CTR = 1;
LABEL_39:
          attributes->i16[2] = 5;
          char StunErrorCodeAttribute = readStunBinaryDataAttribute((uint64_t)attributes, (int *)&v60, v25, v21 - v25);
LABEL_44:
          ++v26;
          if ((StunErrorCodeAttribute & 1) == 0) {
            goto LABEL_81;
          }
          goto LABEL_45;
        }
        if (v35 - 36866 < 2)
        {
LABEL_43:
          attributes->i16[2] = 3;
          char StunErrorCodeAttribute = readStunUINT32Attribute((uint64_t)attributes, (char *)&v60, (unsigned int *)v25, (int)v21 - (int)v25, v34);
          goto LABEL_44;
        }
LABEL_62:
        if (!isReservedStunEncryptedAttribute(attributes->i16[0]))
        {
          if ((v60 & 3) != 0) {
            v60 += -v60 & 3;
          }
          int v53 = objc_msgSend_Stun(IDSFoundationLog, v46, v47, v48);
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v64 = v35;
            _os_log_impl(&dword_19D9BE000, v53, OS_LOG_TYPE_DEFAULT, "read: unknown attribute %04X", buf, 8u);
          }

          uint64_t v29 = &v25[v60];
          ++v26;
          goto LABEL_47;
        }
        self->_requiresAES128CTR = 1;
        attributes->i16[2] = 5;
        BOOL StunBinaryDataAttribute = readStunBinaryDataAttribute((uint64_t)attributes, (int *)&v60, v25, v21 - v25);
        double v52 = objc_msgSend_Stun(IDSFoundationLog, v49, v50, v51);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v64 = v35;
          _os_log_impl(&dword_19D9BE000, v52, OS_LOG_TYPE_DEFAULT, "read: decrypt and drop the reserved encrypted attribute %04X", buf, 8u);
        }

        ++v26;
        if (!StunBinaryDataAttribute) {
          goto LABEL_81;
        }
LABEL_45:
        uint64_t v38 = (int)v60;
LABEL_46:
        uint64_t v29 = &v25[v38];
LABEL_47:
        unint64_t v27 = v30 + 1;
        uint64_t v25 = v29 + 4;
        BOOL v12 = v29 + 4 > (unsigned __int8 *)v21 || v30 > 0x12;
        attributes += 93;
        if (!v12) {
          continue;
        }
        int v26 = v30 + 1;
LABEL_81:
        p_unint64_t numAttribute = &self->_numAttribute;
LABEL_82:
        int *p_numAttribute = v26;
        return v12;
    }
  }
}

- (BOOL)initAES128CTR:(id)a3
{
  *(void *)&v26[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v8 = v4;
  if (self->_requiresAES128CTR)
  {
    if (v4)
    {
      p_cryptorRef = &self->_cryptorRef;
      if (self->_cryptorRef)
      {
        uint64_t v10 = objc_msgSend_Stun(IDSFoundationLog, v5, v6, v7);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          CCCryptorRef v11 = *p_cryptorRef;
          int v25 = 134217984;
          *(void *)int v26 = v11;
          _os_log_impl(&dword_19D9BE000, v10, OS_LOG_TYPE_DEFAULT, "release AES128-CTR cryptor %p.", (uint8_t *)&v25, 0xCu);
        }

        CCCryptorRelease(*p_cryptorRef);
        *p_cryptorRef = 0;
      }
      int64_t v12 = self->_type & 0x110;
      double v13 = objc_msgSend_Stun(IDSFoundationLog, v5, v6, v7);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = "encrypt";
        int type_low = LOWORD(self->_type);
        if (v12) {
          uint64_t v14 = "decrypt";
        }
        int v25 = 67109378;
        v26[0] = type_low;
        LOWORD(v26[1]) = 2080;
        *(void *)((char *)&v26[1] + 2) = v14;
        _os_log_impl(&dword_19D9BE000, v13, OS_LOG_TYPE_DEFAULT, "Start AES128-CTR for stun message type %04X to %s.", (uint8_t *)&v25, 0x12u);
      }

      transactionID = self->_transactionID;
      id v17 = v8;
      uint64_t v21 = (const void *)objc_msgSend_bytes(v17, v18, v19, v20);
      BOOL inited = StunUtilInitAES128CTR(transactionID, v12 != 0, v21, p_cryptorRef);
    }
    else
    {
      double v23 = objc_msgSend_Stun(IDSFoundationLog, v5, v6, v7);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v25) = 0;
        _os_log_impl(&dword_19D9BE000, v23, OS_LOG_TYPE_DEFAULT, "initAES128CTR failed with invalid key.", (uint8_t *)&v25, 2u);
      }

      BOOL inited = 0;
    }
  }
  else
  {
    BOOL inited = 1;
  }

  return inited;
}

- (BOOL)decryptAES128CTRStunAttributes:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  memset(__b, 170, sizeof(__b));
  size_t __n = 0;
  objc_msgSend_initAES128CTR_(self, v5, (uint64_t)a3, v6);
  BOOL v9 = 1;
  if (self->_numAttribute >= 1)
  {
    uint64_t v10 = 0;
    p_errorNumber = (unsigned int *)&self->_attributes[0].value.errorCode.errorNumber;
    uint64_t v12 = 67109376;
    while (1)
    {
      unsigned int v13 = *((unsigned __int16 *)p_errorNumber - 6);
      if (v13 - 60928 <= 8 && ((1 << v13) & 0x171) != 0)
      {
        size_t v15 = *(p_errorNumber - 1);
        uint64_t v16 = objc_msgSend_Stun(IDSFoundationLog, v7, v8, *(double *)&v12);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          unsigned int v29 = v13;
          __int16 v30 = 1024;
          int v31 = v15;
          _os_log_impl(&dword_19D9BE000, v16, OS_LOG_TYPE_DEFAULT, "recv enc attr %04X, %dB.", buf, 0xEu);
        }

        if ((int)v15 >= 1)
        {
          if (!StunUtilDoAES128CTR(self->_cryptorRef, p_errorNumber, v15, __b, &__n))
          {
            uint64_t v22 = objc_msgSend_Stun(IDSFoundationLog, v17, v18, v19);
            if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_20;
            }
            *(_DWORD *)buf = 67109120;
            unsigned int v29 = v13;
            double v23 = "decryptAES128CTRStunAttributes: failed to read attr (%04x).";
            double v24 = v22;
            uint32_t v25 = 8;
            goto LABEL_19;
          }
          unsigned int v20 = __n;
          memcpy(p_errorNumber, __b, __n);
          *(p_errorNumber - 1) = v20;
          if (v13 == 60934)
          {
            unsigned int v21 = *p_errorNumber;
            if (*p_errorNumber != 1414938954) {
              break;
            }
          }
        }
      }
      p_errorNumber += 372;
      if (++v10 >= self->_numAttribute) {
        return 1;
      }
    }
    uint64_t v22 = objc_msgSend_Stun(IDSFoundationLog, v7, v8, *(double *)&v12);
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    *(_DWORD *)buf = 67109376;
    unsigned int v29 = bswap32(v21);
    __int16 v30 = 1024;
    int v31 = 1245795924;
    double v23 = "decryptAES128CTRStunAttributes: enc marker mismatch (%08x != %08x).";
    double v24 = v22;
    uint32_t v25 = 14;
LABEL_19:
    _os_log_impl(&dword_19D9BE000, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v25);
LABEL_20:

    return 0;
  }
  return v9;
}

- (int64_t)type
{
  return self->_type;
}

- (NSData)transactionID
{
  return self->_transactionID;
}

- (NSData)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (NSString)requestID
{
  return self->_requestID;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_transactionID, 0);
}

@end