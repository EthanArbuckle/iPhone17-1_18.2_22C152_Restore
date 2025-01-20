@interface MTRUnitTestingClusterTestStructArrayArgumentRequestParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRUnitTestingClusterTestStructArrayArgumentRequestParams)init;
- (NSArray)arg1;
- (NSArray)arg2;
- (NSArray)arg3;
- (NSArray)arg4;
- (NSNumber)arg5;
- (NSNumber)arg6;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)timedInvokeTimeoutMs;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setArg1:(NSArray *)arg1;
- (void)setArg2:(NSArray *)arg2;
- (void)setArg3:(NSArray *)arg3;
- (void)setArg4:(NSArray *)arg4;
- (void)setArg5:(NSNumber *)arg5;
- (void)setArg6:(NSNumber *)arg6;
- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout;
- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs;
@end

@implementation MTRUnitTestingClusterTestStructArrayArgumentRequestParams

- (MTRUnitTestingClusterTestStructArrayArgumentRequestParams)init
{
  v24.receiver = self;
  v24.super_class = (Class)MTRUnitTestingClusterTestStructArrayArgumentRequestParams;
  v4 = [(MTRUnitTestingClusterTestStructArrayArgumentRequestParams *)&v24 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend_array(MEMORY[0x263EFF8C0], v2, v3);
    arg1 = v4->_arg1;
    v4->_arg1 = (NSArray *)v5;

    uint64_t v9 = objc_msgSend_array(MEMORY[0x263EFF8C0], v7, v8);
    arg2 = v4->_arg2;
    v4->_arg2 = (NSArray *)v9;

    uint64_t v13 = objc_msgSend_array(MEMORY[0x263EFF8C0], v11, v12);
    arg3 = v4->_arg3;
    v4->_arg3 = (NSArray *)v13;

    uint64_t v17 = objc_msgSend_array(MEMORY[0x263EFF8C0], v15, v16);
    arg4 = v4->_arg4;
    v4->_arg4 = (NSArray *)v17;

    arg5 = v4->_arg5;
    v4->_arg5 = (NSNumber *)&unk_26F9C8548;

    arg6 = v4->_arg6;
    v4->_arg6 = (NSNumber *)&unk_26F9C8548;

    timedInvokeTimeoutMs = v4->_timedInvokeTimeoutMs;
    v4->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v4->_serverSideProcessingTimeout;
    v4->_serverSideProcessingTimeout = 0;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRUnitTestingClusterTestStructArrayArgumentRequestParams);
  v7 = objc_msgSend_arg1(self, v5, v6);
  objc_msgSend_setArg1_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_arg2(self, v9, v10);
  objc_msgSend_setArg2_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_arg3(self, v13, v14);
  objc_msgSend_setArg3_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_arg4(self, v17, v18);
  objc_msgSend_setArg4_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_arg5(self, v21, v22);
  objc_msgSend_setArg5_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_arg6(self, v25, v26);
  objc_msgSend_setArg6_(v4, v28, (uint64_t)v27);

  v31 = objc_msgSend_timedInvokeTimeoutMs(self, v29, v30);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v32, (uint64_t)v31);

  v35 = objc_msgSend_serverSideProcessingTimeout(self, v33, v34);
  objc_msgSend_setServerSideProcessingTimeout_(v4, v36, (uint64_t)v35);

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: arg1:%@; arg2:%@; arg3:%@; arg4:%@; arg5:%@; arg6:%@; >",
    v5,
    self->_arg1,
    self->_arg2,
    self->_arg3,
    self->_arg4,
    self->_arg5,
  v7 = self->_arg6);

  return v7;
}

- (NSArray)arg1
{
  return self->_arg1;
}

- (void)setArg1:(NSArray *)arg1
{
}

- (NSArray)arg2
{
  return self->_arg2;
}

- (void)setArg2:(NSArray *)arg2
{
}

- (NSArray)arg3
{
  return self->_arg3;
}

- (void)setArg3:(NSArray *)arg3
{
}

- (NSArray)arg4
{
  return self->_arg4;
}

- (void)setArg4:(NSArray *)arg4
{
}

- (NSNumber)arg5
{
  return self->_arg5;
}

- (void)setArg5:(NSNumber *)arg5
{
}

- (NSNumber)arg6
{
  return self->_arg6;
}

- (void)setArg6:(NSNumber *)arg6
{
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs
{
}

- (NSNumber)serverSideProcessingTimeout
{
  return self->_serverSideProcessingTimeout;
}

- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSideProcessingTimeout, 0);
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_arg6, 0);
  objc_storeStrong((id *)&self->_arg5, 0);
  objc_storeStrong((id *)&self->_arg4, 0);
  objc_storeStrong((id *)&self->_arg3, 0);
  objc_storeStrong((id *)&self->_arg2, 0);

  objc_storeStrong((id *)&self->_arg1, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  __int16 v52 = 0;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v47[0] = 0;
  v47[1] = 0;
  v46 = v47;
  uint64_t v5 = objc_msgSend_arg1(self, a3, (uint64_t)a4);
  uint64_t v8 = objc_msgSend_count(v5, v6, v7);

  if (v8) {
    operator new();
  }
  long long v48 = 0uLL;
  v11 = objc_msgSend_arg2(self, v9, v10);
  uint64_t v14 = objc_msgSend_count(v11, v12, v13);

  if (v14) {
    operator new();
  }
  long long v49 = 0uLL;
  uint64_t v17 = objc_msgSend_arg3(self, v15, v16);
  uint64_t v20 = objc_msgSend_count(v17, v18, v19);

  if (v20) {
    operator new();
  }
  long long v50 = 0uLL;
  v23 = objc_msgSend_arg4(self, v21, v22);
  uint64_t v26 = objc_msgSend_count(v23, v24, v25);

  if (v26) {
    operator new();
  }
  long long v51 = 0uLL;
  v29 = objc_msgSend_arg5(self, v27, v28);
  LOBYTE(v52) = objc_msgSend_unsignedCharValue(v29, v30, v31);

  uint64_t v34 = objc_msgSend_arg6(self, v32, v33);
  HIBYTE(v52) = objc_msgSend_BOOLValue(v34, v35, v36);

  sub_244CC8F5C(0x62FuLL, 0, &v45);
  if (v45)
  {
    sub_244CB62B8((uint64_t)v40);
    v42 = 0;
    v43 = 0;
    v41 = &unk_26F9536C8;
    char v44 = 0;
    sub_2447945A0((uint64_t)&v41, &v45, 0);
    sub_244CB6318((uint64_t)v40, (uint64_t)&v41, 0xFFFFFFFF, (uint64_t)v53);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_244844EE4((uint64_t)&v48, v40, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v40, &v45, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v45);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    v41 = &unk_26F9536C8;
    sub_244794634(&v43);
    sub_244794634(&v42);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 37054;
  }
  sub_244794634(&v45);
  return (ChipError *)sub_24479466C((uint64_t)&v46);
}

- (id)_encodeAsDataValue:(id *)a3
{
  double v5 = sub_244CB3988((uint64_t)v14);
  v15 = 0;
  long long v12 = 0uLL;
  uint64_t v13 = 0;
  objc_msgSend__encodeToTLVReader_(self, v6, (uint64_t)v14, v5);
  uint64_t v7 = sub_2447D5B3C((uint64_t)v14, 0);
  uint64_t v8 = (void *)v7;
  if (a3 && !v7)
  {
    LODWORD(v10) = 3;
    *((void *)&v10 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHI"
                            "P/zap-generated/MTRCommandPayloadsObjc.mm";
    int v11 = 37083;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end