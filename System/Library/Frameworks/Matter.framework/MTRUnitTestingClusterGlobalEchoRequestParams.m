@interface MTRUnitTestingClusterGlobalEchoRequestParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRDataTypeTestGlobalStruct)field1;
- (MTRUnitTestingClusterGlobalEchoRequestParams)init;
- (NSNumber)field2;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)timedInvokeTimeoutMs;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setField1:(id)a3;
- (void)setField2:(id)a3;
- (void)setServerSideProcessingTimeout:(id)a3;
- (void)setTimedInvokeTimeoutMs:(id)a3;
@end

@implementation MTRUnitTestingClusterGlobalEchoRequestParams

- (MTRUnitTestingClusterGlobalEchoRequestParams)init
{
  v9.receiver = self;
  v9.super_class = (Class)MTRUnitTestingClusterGlobalEchoRequestParams;
  v2 = [(MTRUnitTestingClusterGlobalEchoRequestParams *)&v9 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    field1 = v2->_field1;
    v2->_field1 = (MTRDataTypeTestGlobalStruct *)v3;

    field2 = v2->_field2;
    v2->_field2 = (NSNumber *)&unk_26F9C8548;

    timedInvokeTimeoutMs = v2->_timedInvokeTimeoutMs;
    v2->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v2->_serverSideProcessingTimeout;
    v2->_serverSideProcessingTimeout = 0;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRUnitTestingClusterGlobalEchoRequestParams);
  v7 = objc_msgSend_field1(self, v5, v6);
  objc_msgSend_setField1_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_field2(self, v9, v10);
  objc_msgSend_setField2_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_timedInvokeTimeoutMs(self, v13, v14);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_serverSideProcessingTimeout(self, v17, v18);
  objc_msgSend_setServerSideProcessingTimeout_(v4, v20, (uint64_t)v19);

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: field1:%@; field2:%@; >",
    v5,
    self->_field1,
  v7 = self->_field2);

  return v7;
}

- (MTRDataTypeTestGlobalStruct)field1
{
  return self->_field1;
}

- (void)setField1:(id)a3
{
}

- (NSNumber)field2
{
  return self->_field2;
}

- (void)setField2:(id)a3
{
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(id)a3
{
}

- (NSNumber)serverSideProcessingTimeout
{
  return self->_serverSideProcessingTimeout;
}

- (void)setServerSideProcessingTimeout:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSideProcessingTimeout, 0);
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_field2, 0);

  objc_storeStrong((id *)&self->_field1, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  char v60 = 0;
  char v61 = 0;
  long long v58 = 0uLL;
  LOBYTE(v59) = 0;
  char v63 = 0;
  v57[0] = 0;
  v57[1] = 0;
  v56 = v57;
  v7 = objc_msgSend_field1(self, a3, (uint64_t)a4);
  objc_msgSend_name(v7, v8, v9);
  id v10 = objc_claimAutoreleasedReturnValue();
  uint64_t v13 = objc_msgSend_UTF8String(v10, v11, v12);
  uint64_t v15 = objc_msgSend_lengthOfBytesUsingEncoding_(v10, v14, 4);
  sub_24479476C(v50, v13, v15);

  long long v58 = *(_OWORD *)v50;
  uint64_t v18 = objc_msgSend_field1(self, v16, v17);
  v21 = objc_msgSend_myBitmap(v18, v19, v20);

  if (v21)
  {
    int v59 = 0;
    char v60 = 1;
    v24 = objc_msgSend_field1(self, v22, v23);
    v27 = objc_msgSend_myBitmap(v24, v25, v26);
    int v59 = objc_msgSend_unsignedIntValue(v27, v28, v29);
  }
  v30 = objc_msgSend_field1(self, v22, v23);
  v33 = objc_msgSend_myEnum(v30, v31, v32);

  if (v33)
  {
    char v61 = 1;
    __int16 v62 = 0;
    v36 = objc_msgSend_field1(self, v34, v35);
    v39 = objc_msgSend_myEnum(v36, v37, v38);

    if (v39)
    {
      __int16 v62 = 256;
      v40 = objc_msgSend_field1(self, v34, v35);
      v43 = objc_msgSend_myEnum(v40, v41, v42);
      LOBYTE(v62) = objc_msgSend_unsignedCharValue(v43, v44, v45);
    }
  }
  v46 = objc_msgSend_field2(self, v34, v35);
  char v63 = objc_msgSend_unsignedCharValue(v46, v47, v48);

  sub_244CC8F5C(0x62FuLL, 0, &v55);
  if (v55)
  {
    sub_244CB62B8((uint64_t)v50);
    v52 = 0;
    v53 = 0;
    v51 = &unk_26F9536C8;
    char v54 = 0;
    sub_2447945A0((uint64_t)&v51, &v55, 0);
    sub_244CB6318((uint64_t)v50, (uint64_t)&v51, 0xFFFFFFFF, (uint64_t)v64);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_244847780((uint64_t)&v58, v50, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v50, &v55, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v55);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    v51 = &unk_26F9536C8;
    sub_244794634(&v53);
    sub_244794634(&v52);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 40526;
  }
  sub_244794634(&v55);
  return (ChipError *)sub_24479466C((uint64_t)&v56);
}

- (id)_encodeAsDataValue:(id *)a3
{
  double v5 = sub_244CB3988((uint64_t)v14);
  uint64_t v15 = 0;
  long long v12 = 0uLL;
  uint64_t v13 = 0;
  objc_msgSend__encodeToTLVReader_(self, v6, (uint64_t)v14, v5);
  uint64_t v7 = sub_2447D5B3C((uint64_t)v14, 0);
  v8 = (void *)v7;
  if (a3 && !v7)
  {
    LODWORD(v10) = 3;
    *((void *)&v10 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHI"
                            "P/zap-generated/MTRCommandPayloadsObjc.mm";
    int v11 = 40555;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end