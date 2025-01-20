@interface MTRChannelClusterRecordProgramParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRChannelClusterRecordProgramParams)init;
- (NSArray)externalIDList;
- (NSData)data;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)shouldRecordSeries;
- (NSNumber)timedInvokeTimeoutMs;
- (NSString)programIdentifier;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setData:(id)a3;
- (void)setExternalIDList:(id)a3;
- (void)setProgramIdentifier:(id)a3;
- (void)setServerSideProcessingTimeout:(id)a3;
- (void)setShouldRecordSeries:(id)a3;
- (void)setTimedInvokeTimeoutMs:(id)a3;
@end

@implementation MTRChannelClusterRecordProgramParams

- (MTRChannelClusterRecordProgramParams)init
{
  v17.receiver = self;
  v17.super_class = (Class)MTRChannelClusterRecordProgramParams;
  v2 = [(MTRChannelClusterRecordProgramParams *)&v17 init];
  v3 = v2;
  if (v2)
  {
    programIdentifier = v2->_programIdentifier;
    v2->_programIdentifier = (NSString *)&stru_26F969DC8;

    shouldRecordSeries = v3->_shouldRecordSeries;
    v3->_shouldRecordSeries = (NSNumber *)&unk_26F9C8548;

    uint64_t v8 = objc_msgSend_array(MEMORY[0x263EFF8C0], v6, v7);
    externalIDList = v3->_externalIDList;
    v3->_externalIDList = (NSArray *)v8;

    uint64_t v12 = objc_msgSend_data(MEMORY[0x263EFF8F8], v10, v11);
    data = v3->_data;
    v3->_data = (NSData *)v12;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRChannelClusterRecordProgramParams);
  uint64_t v7 = objc_msgSend_programIdentifier(self, v5, v6);
  objc_msgSend_setProgramIdentifier_(v4, v8, (uint64_t)v7);

  uint64_t v11 = objc_msgSend_shouldRecordSeries(self, v9, v10);
  objc_msgSend_setShouldRecordSeries_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_externalIDList(self, v13, v14);
  objc_msgSend_setExternalIDList_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_data(self, v17, v18);
  objc_msgSend_setData_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_timedInvokeTimeoutMs(self, v21, v22);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_serverSideProcessingTimeout(self, v25, v26);
  objc_msgSend_setServerSideProcessingTimeout_(v4, v28, (uint64_t)v27);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  programIdentifier = self->_programIdentifier;
  shouldRecordSeries = self->_shouldRecordSeries;
  externalIDList = self->_externalIDList;
  uint64_t v10 = objc_msgSend_base64EncodedStringWithOptions_(self->_data, v9, 0);
  objc_msgSend_stringWithFormat_(v3, v11, @"<%@: programIdentifier:%@; shouldRecordSeries:%@; externalIDList:%@; data:%@; >",
    v5,
    programIdentifier,
    shouldRecordSeries,
    externalIDList,
  uint64_t v12 = v10);

  return v12;
}

- (NSString)programIdentifier
{
  return self->_programIdentifier;
}

- (void)setProgramIdentifier:(id)a3
{
}

- (NSNumber)shouldRecordSeries
{
  return self->_shouldRecordSeries;
}

- (void)setShouldRecordSeries:(id)a3
{
}

- (NSArray)externalIDList
{
  return self->_externalIDList;
}

- (void)setExternalIDList:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
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
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_externalIDList, 0);
  objc_storeStrong((id *)&self->_shouldRecordSeries, 0);

  objc_storeStrong((id *)&self->_programIdentifier, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  long long v42 = 0uLL;
  char v43 = 0;
  long long v44 = 0u;
  long long v45 = 0u;
  v41[0] = 0;
  v41[1] = 0;
  v40 = v41;
  objc_msgSend_programIdentifier(self, a3, (uint64_t)a4);
  id v6 = objc_claimAutoreleasedReturnValue();
  uint64_t v9 = objc_msgSend_UTF8String(v6, v7, v8);
  uint64_t v11 = objc_msgSend_lengthOfBytesUsingEncoding_(v6, v10, 4);
  sub_24479476C(v34, v9, v11);

  long long v42 = *(_OWORD *)v34;
  uint64_t v14 = objc_msgSend_shouldRecordSeries(self, v12, v13);
  char v43 = objc_msgSend_BOOLValue(v14, v15, v16);

  v19 = objc_msgSend_externalIDList(self, v17, v18);
  uint64_t v22 = objc_msgSend_count(v19, v20, v21);

  if (v22) {
    operator new();
  }
  long long v44 = 0uLL;
  objc_msgSend_data(self, v23, v24);
  id v25 = objc_claimAutoreleasedReturnValue();
  uint64_t v28 = objc_msgSend_bytes(v25, v26, v27);
  uint64_t v31 = objc_msgSend_length(v25, v29, v30);
  sub_2446C1098(v34, v28, v31);

  long long v45 = *(_OWORD *)v34;
  sub_244CC8F5C(0x62FuLL, 0, &v39);
  if (v39)
  {
    sub_244CB62B8((uint64_t)v34);
    v36 = 0;
    v37 = 0;
    v35 = &unk_26F9536C8;
    char v38 = 0;
    sub_2447945A0((uint64_t)&v35, &v39, 0);
    sub_244CB6318((uint64_t)v34, (uint64_t)&v35, 0xFFFFFFFF, (uint64_t)v46);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_244832A74((uint64_t)&v42, v34, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v34, &v39, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v39);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    v35 = &unk_26F9536C8;
    sub_244794634(&v37);
    sub_244794634(&v36);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 27286;
  }
  sub_244794634(&v39);
  return (ChipError *)sub_24479466C((uint64_t)&v40);
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
    int v11 = 27315;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end