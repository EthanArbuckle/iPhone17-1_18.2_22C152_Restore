@interface MTRMessagesClusterPresentMessagesRequestParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRMessagesClusterPresentMessagesRequestParams)init;
- (NSArray)responses;
- (NSData)messageID;
- (NSNumber)duration;
- (NSNumber)messageControl;
- (NSNumber)priority;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)startTime;
- (NSNumber)timedInvokeTimeoutMs;
- (NSString)messageText;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setDuration:(id)a3;
- (void)setMessageControl:(id)a3;
- (void)setMessageID:(id)a3;
- (void)setMessageText:(id)a3;
- (void)setPriority:(id)a3;
- (void)setResponses:(id)a3;
- (void)setServerSideProcessingTimeout:(id)a3;
- (void)setStartTime:(id)a3;
- (void)setTimedInvokeTimeoutMs:(id)a3;
@end

@implementation MTRMessagesClusterPresentMessagesRequestParams

- (MTRMessagesClusterPresentMessagesRequestParams)init
{
  v16.receiver = self;
  v16.super_class = (Class)MTRMessagesClusterPresentMessagesRequestParams;
  v4 = [(MTRMessagesClusterPresentMessagesRequestParams *)&v16 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend_data(MEMORY[0x263EFF8F8], v2, v3);
    messageID = v4->_messageID;
    v4->_messageID = (NSData *)v5;

    priority = v4->_priority;
    v4->_priority = (NSNumber *)&unk_26F9C8548;

    messageControl = v4->_messageControl;
    v4->_messageControl = (NSNumber *)&unk_26F9C8548;

    startTime = v4->_startTime;
    v4->_startTime = 0;

    duration = v4->_duration;
    v4->_duration = 0;

    messageText = v4->_messageText;
    v4->_messageText = (NSString *)&stru_26F969DC8;

    responses = v4->_responses;
    v4->_responses = 0;

    timedInvokeTimeoutMs = v4->_timedInvokeTimeoutMs;
    v4->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v4->_serverSideProcessingTimeout;
    v4->_serverSideProcessingTimeout = 0;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRMessagesClusterPresentMessagesRequestParams);
  v7 = objc_msgSend_messageID(self, v5, v6);
  objc_msgSend_setMessageID_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_priority(self, v9, v10);
  objc_msgSend_setPriority_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_messageControl(self, v13, v14);
  objc_msgSend_setMessageControl_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_startTime(self, v17, v18);
  objc_msgSend_setStartTime_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_duration(self, v21, v22);
  objc_msgSend_setDuration_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_messageText(self, v25, v26);
  objc_msgSend_setMessageText_(v4, v28, (uint64_t)v27);

  v31 = objc_msgSend_responses(self, v29, v30);
  objc_msgSend_setResponses_(v4, v32, (uint64_t)v31);

  v35 = objc_msgSend_timedInvokeTimeoutMs(self, v33, v34);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v36, (uint64_t)v35);

  v39 = objc_msgSend_serverSideProcessingTimeout(self, v37, v38);
  objc_msgSend_setServerSideProcessingTimeout_(v4, v40, (uint64_t)v39);

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_base64EncodedStringWithOptions_(self->_messageID, v6, 0);
  objc_msgSend_stringWithFormat_(v3, v8, @"<%@: messageID:%@; priority:%@; messageControl:%@; startTime:%@; duration:%@; messageText:%@; responses:%@; >",
    v5,
    v7,
    self->_priority,
    self->_messageControl,
    self->_startTime,
    self->_duration,
    self->_messageText,
  v9 = self->_responses);

  return v9;
}

- (NSData)messageID
{
  return self->_messageID;
}

- (void)setMessageID:(id)a3
{
}

- (NSNumber)priority
{
  return self->_priority;
}

- (void)setPriority:(id)a3
{
}

- (NSNumber)messageControl
{
  return self->_messageControl;
}

- (void)setMessageControl:(id)a3
{
}

- (NSNumber)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void)setDuration:(id)a3
{
}

- (NSString)messageText
{
  return self->_messageText;
}

- (void)setMessageText:(id)a3
{
}

- (NSArray)responses
{
  return self->_responses;
}

- (void)setResponses:(id)a3
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
  objc_storeStrong((id *)&self->_responses, 0);
  objc_storeStrong((id *)&self->_messageText, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_messageControl, 0);
  objc_storeStrong((id *)&self->_priority, 0);

  objc_storeStrong((id *)&self->_messageID, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  LOBYTE(v64) = 0;
  char v65 = 0;
  LOBYTE(v66) = 0;
  char v67 = 0;
  long long v62 = 0uLL;
  __int16 v63 = 0;
  long long v68 = 0uLL;
  char v69 = 0;
  v61[0] = 0;
  v61[1] = 0;
  v60 = v61;
  objc_msgSend_messageID(self, a3, (uint64_t)a4);
  id v5 = objc_claimAutoreleasedReturnValue();
  uint64_t v8 = objc_msgSend_bytes(v5, v6, v7);
  uint64_t v11 = objc_msgSend_length(v5, v9, v10);
  sub_2446C1098(v54, v8, v11);

  long long v62 = *(_OWORD *)v54;
  uint64_t v14 = objc_msgSend_priority(self, v12, v13);
  LOBYTE(v63) = objc_msgSend_unsignedCharValue(v14, v15, v16);

  v19 = objc_msgSend_messageControl(self, v17, v18);
  HIBYTE(v63) = objc_msgSend_unsignedCharValue(v19, v20, v21);

  v24 = objc_msgSend_startTime(self, v22, v23);

  if (v24)
  {
    int v64 = 0;
    char v65 = 1;
    v27 = objc_msgSend_startTime(self, v25, v26);
    int v64 = objc_msgSend_unsignedIntValue(v27, v28, v29);
  }
  uint64_t v30 = objc_msgSend_duration(self, v25, v26);

  if (v30)
  {
    uint64_t v66 = 0;
    char v67 = 1;
    v33 = objc_msgSend_duration(self, v31, v32);
    uint64_t v66 = objc_msgSend_unsignedLongLongValue(v33, v34, v35);
  }
  objc_msgSend_messageText(self, v31, v32);
  id v36 = objc_claimAutoreleasedReturnValue();
  uint64_t v39 = objc_msgSend_UTF8String(v36, v37, v38);
  uint64_t v41 = objc_msgSend_lengthOfBytesUsingEncoding_(v36, v40, 4);
  sub_24479476C(v54, v39, v41);

  long long v68 = *(_OWORD *)v54;
  v44 = objc_msgSend_responses(self, v42, v43);

  if (v44)
  {
    char v69 = 1;
    uint64_t v70 = 0;
    uint64_t v71 = 0;
    v47 = objc_msgSend_responses(self, v45, v46);
    uint64_t v50 = objc_msgSend_count(v47, v48, v49);

    if (v50) {
      operator new();
    }
    uint64_t v70 = 0;
    uint64_t v71 = 0;
  }
  sub_244CC8F5C(0x62FuLL, 0, &v59);
  if (v59)
  {
    sub_244CB62B8((uint64_t)v54);
    v56 = 0;
    v57 = 0;
    v55 = &unk_26F9536C8;
    char v58 = 0;
    sub_2447945A0((uint64_t)&v55, &v59, 0);
    sub_244CB6318((uint64_t)v54, (uint64_t)&v55, 0xFFFFFFFF, (uint64_t)v72);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_24481856C((uint64_t)&v62, v54, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v54, &v59, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v59);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    v55 = &unk_26F9536C8;
    sub_244794634(&v57);
    sub_244794634(&v56);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 16709;
  }
  sub_244794634(&v59);
  return (ChipError *)sub_24479466C((uint64_t)&v60);
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
    int v11 = 16738;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end