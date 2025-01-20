@interface MTRNetworkCommissioningClusterNetworkConfigResponseParams
- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3;
- (MTRNetworkCommissioningClusterNetworkConfigResponseParams)init;
- (MTRNetworkCommissioningClusterNetworkConfigResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error;
- (NSData)clientIdentity;
- (NSData)possessionSignature;
- (NSNumber)networkIndex;
- (NSNumber)networkingStatus;
- (NSNumber)timedInvokeTimeoutMs;
- (NSString)debugText;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setClientIdentity:(id)a3;
- (void)setDebugText:(NSString *)debugText;
- (void)setNetworkIndex:(NSNumber *)networkIndex;
- (void)setNetworkingStatus:(NSNumber *)networkingStatus;
- (void)setPossessionSignature:(id)a3;
- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs;
@end

@implementation MTRNetworkCommissioningClusterNetworkConfigResponseParams

- (MTRNetworkCommissioningClusterNetworkConfigResponseParams)init
{
  v11.receiver = self;
  v11.super_class = (Class)MTRNetworkCommissioningClusterNetworkConfigResponseParams;
  v2 = [(MTRNetworkCommissioningClusterNetworkConfigResponseParams *)&v11 init];
  v3 = v2;
  if (v2)
  {
    networkingStatus = v2->_networkingStatus;
    v2->_networkingStatus = (NSNumber *)&unk_26F9C8548;

    debugText = v3->_debugText;
    v3->_debugText = 0;

    networkIndex = v3->_networkIndex;
    v3->_networkIndex = 0;

    clientIdentity = v3->_clientIdentity;
    v3->_clientIdentity = 0;

    possessionSignature = v3->_possessionSignature;
    v3->_possessionSignature = 0;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRNetworkCommissioningClusterNetworkConfigResponseParams);
  v7 = objc_msgSend_networkingStatus(self, v5, v6);
  objc_msgSend_setNetworkingStatus_(v4, v8, (uint64_t)v7);

  objc_super v11 = objc_msgSend_debugText(self, v9, v10);
  objc_msgSend_setDebugText_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_networkIndex(self, v13, v14);
  objc_msgSend_setNetworkIndex_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_clientIdentity(self, v17, v18);
  objc_msgSend_setClientIdentity_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_possessionSignature(self, v21, v22);
  objc_msgSend_setPossessionSignature_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_timedInvokeTimeoutMs(self, v25, v26);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v28, (uint64_t)v27);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  networkingStatus = self->_networkingStatus;
  debugText = self->_debugText;
  networkIndex = self->_networkIndex;
  uint64_t v10 = objc_msgSend_base64EncodedStringWithOptions_(self->_clientIdentity, v9, 0);
  v12 = objc_msgSend_base64EncodedStringWithOptions_(self->_possessionSignature, v11, 0);
  objc_msgSend_stringWithFormat_(v3, v13, @"<%@: networkingStatus:%@; debugText:%@; networkIndex:%@; clientIdentity:%@; possessionSignature:%@; >",
    v5,
    networkingStatus,
    debugText,
    networkIndex,
    v10,
  uint64_t v14 = v12);

  return v14;
}

- (MTRNetworkCommissioningClusterNetworkConfigResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  uint64_t v6 = responseValue;
  v38.receiver = self;
  v38.super_class = (Class)MTRNetworkCommissioningClusterNetworkConfigResponseParams;
  v8 = [(MTRNetworkCommissioningClusterNetworkConfigResponseParams *)&v38 init];
  if (!v8)
  {
    v30 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 49, 5, error);
  if (v37)
  {
    sub_244CB3988((uint64_t)v36);
    sub_244CB39B8((uint64_t)v36, *((void *)v37 + 1), *((void *)v37 + 3));
    long long v34 = 0uLL;
    uint64_t v35 = 0;
    sub_244CB54B4((uint64_t)v36, 256, &v34);
    if (!v34)
    {
      LOBYTE(buf) = 0;
      BYTE8(buf) = 0;
      char v43 = 0;
      char v44 = 0;
      char v45 = 0;
      sub_2447FF108((uint64_t)&buf, (uint64_t)v36, (uint64_t)&v32);
      long long v34 = v32;
      uint64_t v35 = v33;
      if (!v32)
      {
        objc_msgSend__setFieldsFromDecodableStruct_(v8, v9, (uint64_t)&buf);
        long long v34 = v32;
        uint64_t v35 = v33;
        if (!v32)
        {
          v30 = v8;
          goto LABEL_14;
        }
      }
    }
    uint64_t v10 = NSString;
    long long buf = v34;
    uint64_t v42 = v35;
    objc_super v11 = sub_244CB7B34((const char **)&buf, 1);
    v13 = objc_msgSend_stringWithFormat_(v10, v12, @"Command payload decoding failed: %s", v11);
    uint64_t v14 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = v13;
      uint64_t v18 = objc_msgSend_UTF8String(v15, v16, v17);
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = v18;
      _os_log_impl(&dword_2446BD000, v14, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&buf, 0xCu);
    }

    if (sub_244CC4E58(1u))
    {
      id v21 = v13;
      objc_msgSend_UTF8String(v21, v22, v23);
      sub_244CC4DE0(0, 1);
    }
    if (error)
    {
      uint64_t v39 = *MEMORY[0x263F08338];
      v24 = objc_msgSend_mainBundle(MEMORY[0x263F086E0], v19, v20);
      uint64_t v26 = objc_msgSend_localizedStringForKey_value_table_(v24, v25, (uint64_t)v13, &stru_26F969DC8, 0);
      v40 = v26;
      v28 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v27, (uint64_t)&v40, &v39, 1);

      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v29, @"MTRErrorDomain", 13, v28);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    }
  }
  v30 = 0;
LABEL_14:
  sub_244794634(&v37);
LABEL_16:

  return v30;
}

- (NSNumber)networkingStatus
{
  return self->_networkingStatus;
}

- (void)setNetworkingStatus:(NSNumber *)networkingStatus
{
}

- (NSString)debugText
{
  return self->_debugText;
}

- (void)setDebugText:(NSString *)debugText
{
}

- (NSNumber)networkIndex
{
  return self->_networkIndex;
}

- (void)setNetworkIndex:(NSNumber *)networkIndex
{
}

- (NSData)clientIdentity
{
  return self->_clientIdentity;
}

- (void)setClientIdentity:(id)a3
{
}

- (NSData)possessionSignature
{
  return self->_possessionSignature;
}

- (void)setPossessionSignature:(id)a3
{
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_possessionSignature, 0);
  objc_storeStrong((id *)&self->_clientIdentity, 0);
  objc_storeStrong((id *)&self->_networkIndex, 0);
  objc_storeStrong((id *)&self->_debugText, 0);

  objc_storeStrong((id *)&self->_networkingStatus, 0);
}

- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3
{
  v7 = objc_msgSend_numberWithUnsignedChar_(NSNumber, a3, *(unsigned __int8 *)a4);
  objc_msgSend_setNetworkingStatus_(self, v8, (uint64_t)v7);

  if (*((unsigned char *)a4 + 8))
  {
    uint64_t v10 = (uint64_t *)sub_2446D18A4((unsigned char *)a4 + 8);
    uint64_t v11 = *v10;
    uint64_t v12 = v10[1];
    id v13 = [NSString alloc];
    id v15 = objc_msgSend_initWithBytes_length_encoding_(v13, v14, v11, v12, 4);
    objc_msgSend_setDebugText_(self, v16, (uint64_t)v15);

    v19 = objc_msgSend_debugText(self, v17, v18);

    if (!v19)
    {
      *(_OWORD *)&retstr->mError = xmmword_265193FF0;
      *(void *)&retstr->mLine = 6376;
      return result;
    }
  }
  else
  {
    objc_msgSend_setDebugText_(self, v9, 0);
  }
  if (*((unsigned char *)a4 + 32))
  {
    uint64_t v22 = NSNumber;
    uint64_t v23 = sub_2446F9190((unsigned char *)a4 + 32);
    v25 = objc_msgSend_numberWithUnsignedChar_(v22, v24, *v23);
    objc_msgSend_setNetworkIndex_(self, v26, (uint64_t)v25);
  }
  else
  {
    objc_msgSend_setNetworkIndex_(self, v21, 0);
  }
  if (*((unsigned char *)a4 + 40))
  {
    v28 = (uint64_t *)sub_2446D18A4((unsigned char *)a4 + 40);
    v30 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v29, *v28, v28[1]);
    objc_msgSend_setClientIdentity_(self, v31, (uint64_t)v30);
  }
  else
  {
    objc_msgSend_setClientIdentity_(self, v27, 0);
  }
  int v34 = *((unsigned __int8 *)a4 + 64);
  uint64_t v33 = (char *)a4 + 64;
  if (v34)
  {
    uint64_t v35 = (uint64_t *)sub_2446D18A4(v33);
    v37 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v36, *v35, v35[1]);
    objc_msgSend_setPossessionSignature_(self, v38, (uint64_t)v37);
  }
  else
  {
    result = (ChipError *)objc_msgSend_setPossessionSignature_(self, v32, 0);
  }
  retstr->mError = 0;
  retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-gene"
                  "rated/MTRCommandPayloadsObjc.mm";
  retstr->mLine = 6404;
  return result;
}

@end