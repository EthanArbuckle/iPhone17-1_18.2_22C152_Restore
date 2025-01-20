@interface MTRUnitTestingClusterSimpleStructEchoRequestParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRUnitTestingClusterSimpleStruct)arg1;
- (MTRUnitTestingClusterSimpleStructEchoRequestParams)init;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)timedInvokeTimeoutMs;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setArg1:(MTRUnitTestingClusterSimpleStruct *)arg1;
- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout;
- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs;
@end

@implementation MTRUnitTestingClusterSimpleStructEchoRequestParams

- (MTRUnitTestingClusterSimpleStructEchoRequestParams)init
{
  v8.receiver = self;
  v8.super_class = (Class)MTRUnitTestingClusterSimpleStructEchoRequestParams;
  v2 = [(MTRUnitTestingClusterSimpleStructEchoRequestParams *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    arg1 = v2->_arg1;
    v2->_arg1 = (MTRUnitTestingClusterSimpleStruct *)v3;

    timedInvokeTimeoutMs = v2->_timedInvokeTimeoutMs;
    v2->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v2->_serverSideProcessingTimeout;
    v2->_serverSideProcessingTimeout = 0;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRUnitTestingClusterSimpleStructEchoRequestParams);
  v7 = objc_msgSend_arg1(self, v5, v6);
  objc_msgSend_setArg1_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_timedInvokeTimeoutMs(self, v9, v10);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_serverSideProcessingTimeout(self, v13, v14);
  objc_msgSend_setServerSideProcessingTimeout_(v4, v16, (uint64_t)v15);

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: arg1:%@ >", v5, self->_arg1);;

  return v7;
}

- (MTRUnitTestingClusterSimpleStruct)arg1
{
  return self->_arg1;
}

- (void)setArg1:(MTRUnitTestingClusterSimpleStruct *)arg1
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

  objc_storeStrong((id *)&self->_arg1, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  __int16 v101 = 0;
  char v102 = 0;
  int v106 = 0;
  uint64_t v107 = 0;
  LOBYTE(v108) = 0;
  long long v103 = 0u;
  long long v104 = 0u;
  char v105 = 0;
  v100[0] = 0;
  v100[1] = 0;
  v99 = v100;
  v7 = objc_msgSend_arg1(self, a3, (uint64_t)a4);
  uint64_t v10 = objc_msgSend_a(v7, v8, v9);
  LOBYTE(v101) = objc_msgSend_unsignedCharValue(v10, v11, v12);

  v15 = objc_msgSend_arg1(self, v13, v14);
  v18 = objc_msgSend_b(v15, v16, v17);
  HIBYTE(v101) = objc_msgSend_BOOLValue(v18, v19, v20);

  v23 = objc_msgSend_arg1(self, v21, v22);
  v26 = objc_msgSend_c(v23, v24, v25);
  char v102 = objc_msgSend_unsignedCharValue(v26, v27, v28);

  v31 = objc_msgSend_arg1(self, v29, v30);
  objc_msgSend_d(v31, v32, v33);
  id v34 = objc_claimAutoreleasedReturnValue();
  uint64_t v37 = objc_msgSend_bytes(v34, v35, v36);
  uint64_t v40 = objc_msgSend_length(v34, v38, v39);
  sub_2446C1098(v93, v37, v40);

  long long v103 = *(_OWORD *)v93;
  v43 = objc_msgSend_arg1(self, v41, v42);
  objc_msgSend_e(v43, v44, v45);
  id v46 = objc_claimAutoreleasedReturnValue();
  uint64_t v49 = objc_msgSend_UTF8String(v46, v47, v48);
  uint64_t v51 = objc_msgSend_lengthOfBytesUsingEncoding_(v46, v50, 4);
  sub_24479476C(v93, v49, v51);

  long long v104 = *(_OWORD *)v93;
  v54 = objc_msgSend_arg1(self, v52, v53);
  v57 = objc_msgSend_f(v54, v55, v56);
  char v105 = objc_msgSend_unsignedCharValue(v57, v58, v59);

  v62 = objc_msgSend_arg1(self, v60, v61);
  v65 = objc_msgSend_g(v62, v63, v64);
  objc_msgSend_floatValue(v65, v66, v67);
  int v106 = v68;

  v71 = objc_msgSend_arg1(self, v69, v70);
  v74 = objc_msgSend_h(v71, v72, v73);
  objc_msgSend_doubleValue(v74, v75, v76);
  uint64_t v107 = v77;

  v80 = objc_msgSend_arg1(self, v78, v79);
  v83 = objc_msgSend_i(v80, v81, v82);

  if (v83)
  {
    __int16 v108 = 1;
    v86 = objc_msgSend_arg1(self, v84, v85);
    v89 = objc_msgSend_i(v86, v87, v88);
    HIBYTE(v108) = objc_msgSend_unsignedCharValue(v89, v90, v91);
  }
  sub_244CC8F5C(0x62FuLL, 0, &v98);
  if (v98)
  {
    sub_244CB62B8((uint64_t)v93);
    v95 = 0;
    v96 = 0;
    v94 = &unk_26F9536C8;
    char v97 = 0;
    sub_2447945A0((uint64_t)&v94, &v98, 0);
    sub_244CB6318((uint64_t)v93, (uint64_t)&v94, 0xFFFFFFFF, (uint64_t)v109);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_244845D14((uint64_t)&v101, v93, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v93, &v98, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v98);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    v94 = &unk_26F9536C8;
    sub_244794634(&v96);
    sub_244794634(&v95);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 39809;
  }
  sub_244794634(&v98);
  return (ChipError *)sub_24479466C((uint64_t)&v99);
}

- (id)_encodeAsDataValue:(id *)a3
{
  double v5 = sub_244CB3988((uint64_t)v14);
  v15 = 0;
  long long v12 = 0uLL;
  uint64_t v13 = 0;
  objc_msgSend__encodeToTLVReader_(self, v6, (uint64_t)v14, v5);
  uint64_t v7 = sub_2447D5B3C((uint64_t)v14, 0);
  objc_super v8 = (void *)v7;
  if (a3 && !v7)
  {
    LODWORD(v10) = 3;
    *((void *)&v10 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHI"
                            "P/zap-generated/MTRCommandPayloadsObjc.mm";
    int v11 = 39838;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end