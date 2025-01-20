@interface MTRDiagnosticLogsClusterRetrieveLogsRequestParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRDiagnosticLogsClusterRetrieveLogsRequestParams)init;
- (NSNumber)intent;
- (NSNumber)requestedProtocol;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)timedInvokeTimeoutMs;
- (NSString)transferFileDesignator;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setIntent:(NSNumber *)intent;
- (void)setRequestedProtocol:(NSNumber *)requestedProtocol;
- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout;
- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs;
- (void)setTransferFileDesignator:(NSString *)transferFileDesignator;
@end

@implementation MTRDiagnosticLogsClusterRetrieveLogsRequestParams

- (MTRDiagnosticLogsClusterRetrieveLogsRequestParams)init
{
  v10.receiver = self;
  v10.super_class = (Class)MTRDiagnosticLogsClusterRetrieveLogsRequestParams;
  v2 = [(MTRDiagnosticLogsClusterRetrieveLogsRequestParams *)&v10 init];
  v3 = v2;
  if (v2)
  {
    intent = v2->_intent;
    v2->_intent = (NSNumber *)&unk_26F9C8548;

    requestedProtocol = v3->_requestedProtocol;
    v3->_requestedProtocol = (NSNumber *)&unk_26F9C8548;

    transferFileDesignator = v3->_transferFileDesignator;
    v3->_transferFileDesignator = 0;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRDiagnosticLogsClusterRetrieveLogsRequestParams);
  v7 = objc_msgSend_intent(self, v5, v6);
  objc_msgSend_setIntent_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_requestedProtocol(self, v9, v10);
  objc_msgSend_setRequestedProtocol_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_transferFileDesignator(self, v13, v14);
  objc_msgSend_setTransferFileDesignator_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_timedInvokeTimeoutMs(self, v17, v18);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_serverSideProcessingTimeout(self, v21, v22);
  objc_msgSend_setServerSideProcessingTimeout_(v4, v24, (uint64_t)v23);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: intent:%@; requestedProtocol:%@; transferFileDesignator:%@; >",
    v5,
    self->_intent,
    self->_requestedProtocol,
  v7 = self->_transferFileDesignator);

  return v7;
}

- (NSNumber)intent
{
  return self->_intent;
}

- (void)setIntent:(NSNumber *)intent
{
}

- (NSNumber)requestedProtocol
{
  return self->_requestedProtocol;
}

- (void)setRequestedProtocol:(NSNumber *)requestedProtocol
{
}

- (NSString)transferFileDesignator
{
  return self->_transferFileDesignator;
}

- (void)setTransferFileDesignator:(NSString *)transferFileDesignator
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
  objc_storeStrong((id *)&self->_transferFileDesignator, 0);
  objc_storeStrong((id *)&self->_requestedProtocol, 0);

  objc_storeStrong((id *)&self->_intent, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  __int16 v35 = 0;
  char v36 = 0;
  v34[0] = 0;
  v34[1] = 0;
  v33 = v34;
  v7 = objc_msgSend_intent(self, a3, (uint64_t)a4);
  LOBYTE(v35) = objc_msgSend_unsignedCharValue(v7, v8, v9);

  v12 = objc_msgSend_requestedProtocol(self, v10, v11);
  HIBYTE(v35) = objc_msgSend_unsignedCharValue(v12, v13, v14);

  v17 = objc_msgSend_transferFileDesignator(self, v15, v16);

  if (v17)
  {
    char v36 = 1;
    long long v37 = 0uLL;
    objc_msgSend_transferFileDesignator(self, v18, v19);
    id v20 = objc_claimAutoreleasedReturnValue();
    uint64_t v23 = objc_msgSend_UTF8String(v20, v21, v22);
    uint64_t v25 = objc_msgSend_lengthOfBytesUsingEncoding_(v20, v24, 4);
    sub_24479476C(v27, v23, v25);

    long long v37 = *(_OWORD *)v27;
  }
  sub_244CC8F5C(0x62FuLL, 0, &v32);
  if (v32)
  {
    sub_244CB62B8((uint64_t)v27);
    v29 = 0;
    v30 = 0;
    v28 = &unk_26F9536C8;
    char v31 = 0;
    sub_2447945A0((uint64_t)&v28, &v32, 0);
    sub_244CB6318((uint64_t)v27, (uint64_t)&v28, 0xFFFFFFFF, (uint64_t)v38);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_2448000BC(&v35, v27, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v27, &v32, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v32);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    v28 = &unk_26F9536C8;
    sub_244794634(&v30);
    sub_244794634(&v29);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 6931;
  }
  sub_244794634(&v32);
  return (ChipError *)sub_24479466C((uint64_t)&v33);
}

- (id)_encodeAsDataValue:(id *)a3
{
  double v5 = sub_244CB3988((uint64_t)v14);
  v15 = 0;
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
    int v11 = 6960;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end