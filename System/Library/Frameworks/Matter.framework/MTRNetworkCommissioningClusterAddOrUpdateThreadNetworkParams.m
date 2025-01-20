@interface MTRNetworkCommissioningClusterAddOrUpdateThreadNetworkParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRNetworkCommissioningClusterAddOrUpdateThreadNetworkParams)init;
- (NSData)operationalDataset;
- (NSNumber)breadcrumb;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)timedInvokeTimeoutMs;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setBreadcrumb:(NSNumber *)breadcrumb;
- (void)setOperationalDataset:(NSData *)operationalDataset;
- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout;
- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs;
@end

@implementation MTRNetworkCommissioningClusterAddOrUpdateThreadNetworkParams

- (MTRNetworkCommissioningClusterAddOrUpdateThreadNetworkParams)init
{
  v11.receiver = self;
  v11.super_class = (Class)MTRNetworkCommissioningClusterAddOrUpdateThreadNetworkParams;
  v4 = [(MTRNetworkCommissioningClusterAddOrUpdateThreadNetworkParams *)&v11 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend_data(MEMORY[0x263EFF8F8], v2, v3);
    operationalDataset = v4->_operationalDataset;
    v4->_operationalDataset = (NSData *)v5;

    breadcrumb = v4->_breadcrumb;
    v4->_breadcrumb = 0;

    timedInvokeTimeoutMs = v4->_timedInvokeTimeoutMs;
    v4->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v4->_serverSideProcessingTimeout;
    v4->_serverSideProcessingTimeout = 0;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRNetworkCommissioningClusterAddOrUpdateThreadNetworkParams);
  v7 = objc_msgSend_operationalDataset(self, v5, v6);
  objc_msgSend_setOperationalDataset_(v4, v8, (uint64_t)v7);

  objc_super v11 = objc_msgSend_breadcrumb(self, v9, v10);
  objc_msgSend_setBreadcrumb_(v4, v12, (uint64_t)v11);

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
  uint64_t v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_base64EncodedStringWithOptions_(self->_operationalDataset, v6, 0);
  objc_msgSend_stringWithFormat_(v3, v8, @"<%@: operationalDataset:%@; breadcrumb:%@; >",
    v5,
    v7,
  v9 = self->_breadcrumb);

  return v9;
}

- (NSData)operationalDataset
{
  return self->_operationalDataset;
}

- (void)setOperationalDataset:(NSData *)operationalDataset
{
}

- (NSNumber)breadcrumb
{
  return self->_breadcrumb;
}

- (void)setBreadcrumb:(NSNumber *)breadcrumb
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
  objc_storeStrong((id *)&self->_breadcrumb, 0);

  objc_storeStrong((id *)&self->_operationalDataset, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  long long v31 = 0uLL;
  char v32 = 0;
  v30[0] = 0;
  v30[1] = 0;
  v29 = v30;
  objc_msgSend_operationalDataset(self, a3, (uint64_t)a4);
  id v7 = objc_claimAutoreleasedReturnValue();
  uint64_t v10 = objc_msgSend_bytes(v7, v8, v9);
  uint64_t v13 = objc_msgSend_length(v7, v11, v12);
  sub_2446C1098(v23, v10, v13);

  long long v31 = *(_OWORD *)v23;
  v16 = objc_msgSend_breadcrumb(self, v14, v15);

  if (v16)
  {
    char v32 = 1;
    uint64_t v33 = 0;
    v19 = objc_msgSend_breadcrumb(self, v17, v18);
    uint64_t v33 = objc_msgSend_unsignedLongLongValue(v19, v20, v21);
  }
  sub_244CC8F5C(0x62FuLL, 0, &v28);
  if (v28)
  {
    sub_244CB62B8((uint64_t)v23);
    v25 = 0;
    v26 = 0;
    v24 = &unk_26F9536C8;
    char v27 = 0;
    sub_2447945A0((uint64_t)&v24, &v28, 0);
    sub_244CB6318((uint64_t)v23, (uint64_t)&v24, 0xFFFFFFFF, (uint64_t)v34);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_2447FEBC8((uint64_t)&v31, v23, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v23, &v28, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v28);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    v24 = &unk_26F9536C8;
    sub_244794634(&v26);
    sub_244794634(&v25);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 6160;
  }
  sub_244794634(&v28);
  return (ChipError *)sub_24479466C((uint64_t)&v29);
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
    int v11 = 6189;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end