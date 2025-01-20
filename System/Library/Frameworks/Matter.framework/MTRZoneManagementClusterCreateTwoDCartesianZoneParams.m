@interface MTRZoneManagementClusterCreateTwoDCartesianZoneParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRZoneManagementClusterCreateTwoDCartesianZoneParams)init;
- (MTRZoneManagementClusterTwoDCartesianZoneStruct)zone;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)timedInvokeTimeoutMs;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setServerSideProcessingTimeout:(id)a3;
- (void)setTimedInvokeTimeoutMs:(id)a3;
- (void)setZone:(id)a3;
@end

@implementation MTRZoneManagementClusterCreateTwoDCartesianZoneParams

- (MTRZoneManagementClusterCreateTwoDCartesianZoneParams)init
{
  v8.receiver = self;
  v8.super_class = (Class)MTRZoneManagementClusterCreateTwoDCartesianZoneParams;
  v2 = [(MTRZoneManagementClusterCreateTwoDCartesianZoneParams *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    zone = v2->_zone;
    v2->_zone = (MTRZoneManagementClusterTwoDCartesianZoneStruct *)v3;

    timedInvokeTimeoutMs = v2->_timedInvokeTimeoutMs;
    v2->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v2->_serverSideProcessingTimeout;
    v2->_serverSideProcessingTimeout = 0;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRZoneManagementClusterCreateTwoDCartesianZoneParams);
  v7 = objc_msgSend_zone(self, v5, v6);
  objc_msgSend_setZone_(v4, v8, (uint64_t)v7);

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
  v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: zone:%@ >", v5, self->_zone);;

  return v7;
}

- (MTRZoneManagementClusterTwoDCartesianZoneStruct)zone
{
  return self->_zone;
}

- (void)setZone:(id)a3
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

  objc_storeStrong((id *)&self->_zone, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  long long v59 = 0uLL;
  char v60 = 0;
  uint64_t v61 = 0;
  uint64_t v62 = 0;
  char v63 = 0;
  v58[0] = 0;
  v58[1] = 0;
  v57 = v58;
  uint64_t v6 = objc_msgSend_zone(self, a3, (uint64_t)a4);
  objc_msgSend_name(v6, v7, v8);
  id v9 = objc_claimAutoreleasedReturnValue();
  uint64_t v12 = objc_msgSend_UTF8String(v9, v10, v11);
  uint64_t v14 = objc_msgSend_lengthOfBytesUsingEncoding_(v9, v13, 4);
  sub_24479476C(v51, v12, v14);

  long long v59 = *(_OWORD *)v51;
  v17 = objc_msgSend_zone(self, v15, v16);
  v20 = objc_msgSend_use(v17, v18, v19);
  char v60 = objc_msgSend_unsignedCharValue(v20, v21, v22);

  v25 = objc_msgSend_zone(self, v23, v24);
  v28 = objc_msgSend_vertices(v25, v26, v27);
  uint64_t v31 = objc_msgSend_count(v28, v29, v30);

  if (v31) {
    operator new();
  }
  uint64_t v61 = 0;
  uint64_t v62 = 0;
  v34 = objc_msgSend_zone(self, v32, v33);
  v37 = objc_msgSend_color(v34, v35, v36);

  if (v37)
  {
    char v63 = 1;
    long long v64 = 0uLL;
    v40 = objc_msgSend_zone(self, v38, v39);
    objc_msgSend_color(v40, v41, v42);
    id v43 = objc_claimAutoreleasedReturnValue();
    uint64_t v46 = objc_msgSend_UTF8String(v43, v44, v45);
    uint64_t v48 = objc_msgSend_lengthOfBytesUsingEncoding_(v43, v47, 4);
    sub_24479476C(v51, v46, v48);

    long long v64 = *(_OWORD *)v51;
  }
  sub_244CC8F5C(0x62FuLL, 0, &v56);
  if (v56)
  {
    sub_244CB62B8((uint64_t)v51);
    v53 = 0;
    v54 = 0;
    v52 = &unk_26F9536C8;
    char v55 = 0;
    sub_2447945A0((uint64_t)&v52, &v56, 0);
    sub_244CB6318((uint64_t)v51, (uint64_t)&v52, 0xFFFFFFFF, (uint64_t)v65);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_24483AA1C((uint64_t)&v59, v51, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v51, &v56, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v56);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    v52 = &unk_26F9536C8;
    sub_244794634(&v54);
    sub_244794634(&v53);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 31847;
  }
  sub_244794634(&v56);
  return (ChipError *)sub_24479466C((uint64_t)&v57);
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
    int v11 = 31876;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end