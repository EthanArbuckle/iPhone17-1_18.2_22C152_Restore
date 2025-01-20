@interface MTRZoneManagementClusterUpdateTwoDCartesianZoneParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRZoneManagementClusterTwoDCartesianZoneStruct)zone;
- (MTRZoneManagementClusterUpdateTwoDCartesianZoneParams)init;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)timedInvokeTimeoutMs;
- (NSNumber)zoneID;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setServerSideProcessingTimeout:(id)a3;
- (void)setTimedInvokeTimeoutMs:(id)a3;
- (void)setZone:(id)a3;
- (void)setZoneID:(id)a3;
@end

@implementation MTRZoneManagementClusterUpdateTwoDCartesianZoneParams

- (MTRZoneManagementClusterUpdateTwoDCartesianZoneParams)init
{
  v10.receiver = self;
  v10.super_class = (Class)MTRZoneManagementClusterUpdateTwoDCartesianZoneParams;
  v2 = [(MTRZoneManagementClusterUpdateTwoDCartesianZoneParams *)&v10 init];
  v3 = v2;
  if (v2)
  {
    zoneID = v2->_zoneID;
    v2->_zoneID = (NSNumber *)&unk_26F9C8548;

    uint64_t v5 = objc_opt_new();
    zone = v3->_zone;
    v3->_zone = (MTRZoneManagementClusterTwoDCartesianZoneStruct *)v5;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRZoneManagementClusterUpdateTwoDCartesianZoneParams);
  v7 = objc_msgSend_zoneID(self, v5, v6);
  objc_msgSend_setZoneID_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_zone(self, v9, v10);
  objc_msgSend_setZone_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_timedInvokeTimeoutMs(self, v13, v14);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_serverSideProcessingTimeout(self, v17, v18);
  objc_msgSend_setServerSideProcessingTimeout_(v4, v20, (uint64_t)v19);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: zoneID:%@ zone:%@; >", v5, self->_zoneID, self->_zone);;

  return v7;
}

- (NSNumber)zoneID
{
  return self->_zoneID;
}

- (void)setZoneID:(id)a3
{
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

  objc_storeStrong((id *)&self->_zoneID, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  __int16 v64 = 0;
  long long v65 = 0uLL;
  char v66 = 0;
  uint64_t v67 = 0;
  uint64_t v68 = 0;
  char v69 = 0;
  v63[0] = 0;
  v63[1] = 0;
  v62 = v63;
  uint64_t v6 = objc_msgSend_zoneID(self, a3, (uint64_t)a4);
  __int16 v64 = objc_msgSend_unsignedShortValue(v6, v7, v8);

  v11 = objc_msgSend_zone(self, v9, v10);
  objc_msgSend_name(v11, v12, v13);
  id v14 = objc_claimAutoreleasedReturnValue();
  uint64_t v17 = objc_msgSend_UTF8String(v14, v15, v16);
  uint64_t v19 = objc_msgSend_lengthOfBytesUsingEncoding_(v14, v18, 4);
  sub_24479476C(v56, v17, v19);

  long long v65 = *(_OWORD *)v56;
  v22 = objc_msgSend_zone(self, v20, v21);
  v25 = objc_msgSend_use(v22, v23, v24);
  char v66 = objc_msgSend_unsignedCharValue(v25, v26, v27);

  v30 = objc_msgSend_zone(self, v28, v29);
  v33 = objc_msgSend_vertices(v30, v31, v32);
  uint64_t v36 = objc_msgSend_count(v33, v34, v35);

  if (v36) {
    operator new();
  }
  uint64_t v67 = 0;
  uint64_t v68 = 0;
  v39 = objc_msgSend_zone(self, v37, v38);
  v42 = objc_msgSend_color(v39, v40, v41);

  if (v42)
  {
    char v69 = 1;
    long long v70 = 0uLL;
    v45 = objc_msgSend_zone(self, v43, v44);
    objc_msgSend_color(v45, v46, v47);
    id v48 = objc_claimAutoreleasedReturnValue();
    uint64_t v51 = objc_msgSend_UTF8String(v48, v49, v50);
    uint64_t v53 = objc_msgSend_lengthOfBytesUsingEncoding_(v48, v52, 4);
    sub_24479476C(v56, v51, v53);

    long long v70 = *(_OWORD *)v56;
  }
  sub_244CC8F5C(0x62FuLL, 0, &v61);
  if (v61)
  {
    sub_244CB62B8((uint64_t)v56);
    v58 = 0;
    v59 = 0;
    v57 = &unk_26F9536C8;
    char v60 = 0;
    sub_2447945A0((uint64_t)&v57, &v61, 0);
    sub_244CB6318((uint64_t)v56, (uint64_t)&v57, 0xFFFFFFFF, (uint64_t)v71);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_24483ACB0((uint64_t)&v64, v56, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v56, &v61, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v61);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    v57 = &unk_26F9536C8;
    sub_244794634(&v59);
    sub_244794634(&v58);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 32039;
  }
  sub_244794634(&v61);
  return (ChipError *)sub_24479466C((uint64_t)&v62);
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
    int v11 = 32068;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end