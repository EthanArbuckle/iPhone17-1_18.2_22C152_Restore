@interface MTRChannelClusterGetProgramGuideParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRChannelClusterGetProgramGuideParams)init;
- (MTRChannelClusterPageTokenStruct)pageToken;
- (NSArray)channelList;
- (NSArray)externalIDList;
- (NSData)data;
- (NSNumber)endTime;
- (NSNumber)recordingFlag;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)startTime;
- (NSNumber)timedInvokeTimeoutMs;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setChannelList:(id)a3;
- (void)setData:(id)a3;
- (void)setEndTime:(id)a3;
- (void)setExternalIDList:(id)a3;
- (void)setPageToken:(id)a3;
- (void)setRecordingFlag:(id)a3;
- (void)setServerSideProcessingTimeout:(id)a3;
- (void)setStartTime:(id)a3;
- (void)setTimedInvokeTimeoutMs:(id)a3;
@end

@implementation MTRChannelClusterGetProgramGuideParams

- (MTRChannelClusterGetProgramGuideParams)init
{
  v14.receiver = self;
  v14.super_class = (Class)MTRChannelClusterGetProgramGuideParams;
  v2 = [(MTRChannelClusterGetProgramGuideParams *)&v14 init];
  v3 = v2;
  if (v2)
  {
    startTime = v2->_startTime;
    v2->_startTime = 0;

    endTime = v3->_endTime;
    v3->_endTime = 0;

    channelList = v3->_channelList;
    v3->_channelList = 0;

    pageToken = v3->_pageToken;
    v3->_pageToken = 0;

    recordingFlag = v3->_recordingFlag;
    v3->_recordingFlag = 0;

    externalIDList = v3->_externalIDList;
    v3->_externalIDList = 0;

    data = v3->_data;
    v3->_data = 0;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRChannelClusterGetProgramGuideParams);
  v7 = objc_msgSend_startTime(self, v5, v6);
  objc_msgSend_setStartTime_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_endTime(self, v9, v10);
  objc_msgSend_setEndTime_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_channelList(self, v13, v14);
  objc_msgSend_setChannelList_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_pageToken(self, v17, v18);
  objc_msgSend_setPageToken_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_recordingFlag(self, v21, v22);
  objc_msgSend_setRecordingFlag_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_externalIDList(self, v25, v26);
  objc_msgSend_setExternalIDList_(v4, v28, (uint64_t)v27);

  v31 = objc_msgSend_data(self, v29, v30);
  objc_msgSend_setData_(v4, v32, (uint64_t)v31);

  v35 = objc_msgSend_timedInvokeTimeoutMs(self, v33, v34);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v36, (uint64_t)v35);

  v39 = objc_msgSend_serverSideProcessingTimeout(self, v37, v38);
  objc_msgSend_setServerSideProcessingTimeout_(v4, v40, (uint64_t)v39);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  startTime = self->_startTime;
  endTime = self->_endTime;
  channelList = self->_channelList;
  pageToken = self->_pageToken;
  recordingFlag = self->_recordingFlag;
  externalIDList = self->_externalIDList;
  v13 = objc_msgSend_base64EncodedStringWithOptions_(self->_data, v12, 0);
  objc_msgSend_stringWithFormat_(v3, v14, @"<%@: startTime:%@; endTime:%@; channelList:%@; pageToken:%@; recordingFlag:%@; externalIDList:%@; data:%@; >",
    v5,
    startTime,
    endTime,
    channelList,
    pageToken,
    recordingFlag,
    externalIDList,
  v15 = v13);

  return v15;
}

- (NSNumber)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
}

- (NSNumber)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(id)a3
{
}

- (NSArray)channelList
{
  return self->_channelList;
}

- (void)setChannelList:(id)a3
{
}

- (MTRChannelClusterPageTokenStruct)pageToken
{
  return self->_pageToken;
}

- (void)setPageToken:(id)a3
{
}

- (NSNumber)recordingFlag
{
  return self->_recordingFlag;
}

- (void)setRecordingFlag:(id)a3
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
  objc_storeStrong((id *)&self->_recordingFlag, 0);
  objc_storeStrong((id *)&self->_pageToken, 0);
  objc_storeStrong((id *)&self->_channelList, 0);
  objc_storeStrong((id *)&self->_endTime, 0);

  objc_storeStrong((id *)&self->_startTime, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  v101[0] = 0;
  char v103 = 0;
  char v105 = 0;
  char v108 = 0;
  char v112 = 0;
  char v114 = 0;
  char v117 = 0;
  v100[0] = 0;
  v100[1] = 0;
  v99 = v100;
  v5 = objc_msgSend_startTime(self, a3, (uint64_t)a4);

  if (v5)
  {
    v101[0] = 1;
    int v102 = 0;
    v8 = objc_msgSend_startTime(self, v6, v7);
    int v102 = objc_msgSend_unsignedIntValue(v8, v9, v10);
  }
  v11 = objc_msgSend_endTime(self, v6, v7);

  if (v11)
  {
    char v103 = 1;
    int v104 = 0;
    uint64_t v14 = objc_msgSend_endTime(self, v12, v13);
    int v104 = objc_msgSend_unsignedIntValue(v14, v15, v16);
  }
  v17 = objc_msgSend_channelList(self, v12, v13);

  if (v17)
  {
    char v105 = 1;
    uint64_t v106 = 0;
    uint64_t v107 = 0;
    v20 = objc_msgSend_channelList(self, v18, v19);
    uint64_t v23 = objc_msgSend_count(v20, v21, v22);

    if (v23) {
      operator new();
    }
    uint64_t v106 = 0;
    uint64_t v107 = 0;
  }
  v24 = objc_msgSend_pageToken(self, v18, v19);

  if (v24)
  {
    char v108 = 1;
    long long v109 = 0u;
    long long v110 = 0u;
    memset(v111, 0, sizeof(v111));
    v27 = objc_msgSend_pageToken(self, v25, v26);
    uint64_t v30 = objc_msgSend_limit(v27, v28, v29);

    if (v30)
    {
      LOBYTE(v109) = 1;
      WORD1(v109) = 0;
      v33 = objc_msgSend_pageToken(self, v31, v32);
      v36 = objc_msgSend_limit(v33, v34, v35);
      WORD1(v109) = objc_msgSend_unsignedShortValue(v36, v37, v38);
    }
    v39 = objc_msgSend_pageToken(self, v31, v32);
    v42 = objc_msgSend_after(v39, v40, v41);

    if (v42)
    {
      BYTE8(v109) = 1;
      long long v110 = 0uLL;
      v45 = objc_msgSend_pageToken(self, v43, v44);
      objc_msgSend_after(v45, v46, v47);
      id v48 = objc_claimAutoreleasedReturnValue();
      uint64_t v51 = objc_msgSend_UTF8String(v48, v49, v50);
      uint64_t v53 = objc_msgSend_lengthOfBytesUsingEncoding_(v48, v52, 4);
      sub_24479476C(v93, v51, v53);

      long long v110 = *(_OWORD *)v93;
    }
    v54 = objc_msgSend_pageToken(self, v43, v44);
    v57 = objc_msgSend_before(v54, v55, v56);

    if (v57)
    {
      LOBYTE(v111[0]) = 1;
      v111[1] = 0;
      v111[2] = 0;
      v58 = objc_msgSend_pageToken(self, v25, v26);
      objc_msgSend_before(v58, v59, v60);
      id v61 = objc_claimAutoreleasedReturnValue();
      uint64_t v64 = objc_msgSend_UTF8String(v61, v62, v63);
      uint64_t v66 = objc_msgSend_lengthOfBytesUsingEncoding_(v61, v65, 4);
      sub_24479476C(v93, v64, v66);

      *(_OWORD *)&v111[1] = *(_OWORD *)v93;
    }
  }
  v67 = objc_msgSend_recordingFlag(self, v25, v26);

  if (v67)
  {
    char v112 = 1;
    int v113 = 0;
    v70 = objc_msgSend_recordingFlag(self, v68, v69);
    int v113 = objc_msgSend_unsignedIntValue(v70, v71, v72);
  }
  v73 = objc_msgSend_externalIDList(self, v68, v69);

  if (v73)
  {
    char v114 = 1;
    uint64_t v115 = 0;
    uint64_t v116 = 0;
    v76 = objc_msgSend_externalIDList(self, v74, v75);
    uint64_t v79 = objc_msgSend_count(v76, v77, v78);

    if (v79) {
      operator new();
    }
    uint64_t v115 = 0;
    uint64_t v116 = 0;
  }
  v80 = objc_msgSend_data(self, v74, v75);

  if (v80)
  {
    char v117 = 1;
    long long v118 = 0uLL;
    objc_msgSend_data(self, v81, v82);
    id v83 = objc_claimAutoreleasedReturnValue();
    uint64_t v86 = objc_msgSend_bytes(v83, v84, v85);
    uint64_t v89 = objc_msgSend_length(v83, v87, v88);
    sub_2446C1098(v93, v86, v89);

    long long v118 = *(_OWORD *)v93;
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
    sub_244CB6318((uint64_t)v93, (uint64_t)&v94, 0xFFFFFFFF, (uint64_t)v119);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_24483239C(v101, v93, 256, (uint64_t)retstr);
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
    retstr->mLine = 26724;
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
  v8 = (void *)v7;
  if (a3 && !v7)
  {
    LODWORD(v10) = 3;
    *((void *)&v10 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHI"
                            "P/zap-generated/MTRCommandPayloadsObjc.mm";
    int v11 = 26753;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end