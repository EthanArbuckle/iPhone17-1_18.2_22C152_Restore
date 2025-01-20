@interface MTRDoorLockClusterSetHolidayScheduleParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRDoorLockClusterSetHolidayScheduleParams)init;
- (NSNumber)holidayIndex;
- (NSNumber)localEndTime;
- (NSNumber)localStartTime;
- (NSNumber)operatingMode;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)timedInvokeTimeoutMs;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setHolidayIndex:(NSNumber *)holidayIndex;
- (void)setLocalEndTime:(NSNumber *)localEndTime;
- (void)setLocalStartTime:(NSNumber *)localStartTime;
- (void)setOperatingMode:(NSNumber *)operatingMode;
- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout;
- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs;
@end

@implementation MTRDoorLockClusterSetHolidayScheduleParams

- (MTRDoorLockClusterSetHolidayScheduleParams)init
{
  v11.receiver = self;
  v11.super_class = (Class)MTRDoorLockClusterSetHolidayScheduleParams;
  v2 = [(MTRDoorLockClusterSetHolidayScheduleParams *)&v11 init];
  v3 = v2;
  if (v2)
  {
    holidayIndex = v2->_holidayIndex;
    v2->_holidayIndex = (NSNumber *)&unk_26F9C8548;

    localStartTime = v3->_localStartTime;
    v3->_localStartTime = (NSNumber *)&unk_26F9C8548;

    localEndTime = v3->_localEndTime;
    v3->_localEndTime = (NSNumber *)&unk_26F9C8548;

    operatingMode = v3->_operatingMode;
    v3->_operatingMode = (NSNumber *)&unk_26F9C8548;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRDoorLockClusterSetHolidayScheduleParams);
  v7 = objc_msgSend_holidayIndex(self, v5, v6);
  objc_msgSend_setHolidayIndex_(v4, v8, (uint64_t)v7);

  objc_super v11 = objc_msgSend_localStartTime(self, v9, v10);
  objc_msgSend_setLocalStartTime_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_localEndTime(self, v13, v14);
  objc_msgSend_setLocalEndTime_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_operatingMode(self, v17, v18);
  objc_msgSend_setOperatingMode_(v4, v20, (uint64_t)v19);

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
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: holidayIndex:%@; localStartTime:%@; localEndTime:%@; operatingMode:%@; >",
    v5,
    self->_holidayIndex,
    self->_localStartTime,
    self->_localEndTime,
  v7 = self->_operatingMode);

  return v7;
}

- (NSNumber)holidayIndex
{
  return self->_holidayIndex;
}

- (void)setHolidayIndex:(NSNumber *)holidayIndex
{
}

- (NSNumber)localStartTime
{
  return self->_localStartTime;
}

- (void)setLocalStartTime:(NSNumber *)localStartTime
{
}

- (NSNumber)localEndTime
{
  return self->_localEndTime;
}

- (void)setLocalEndTime:(NSNumber *)localEndTime
{
}

- (NSNumber)operatingMode
{
  return self->_operatingMode;
}

- (void)setOperatingMode:(NSNumber *)operatingMode
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
  objc_storeStrong((id *)&self->_operatingMode, 0);
  objc_storeStrong((id *)&self->_localEndTime, 0);
  objc_storeStrong((id *)&self->_localStartTime, 0);

  objc_storeStrong((id *)&self->_holidayIndex, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  v34[0] = 0;
  uint64_t v35 = 0;
  char v36 = 0;
  v33[0] = 0;
  v33[1] = 0;
  v32 = v33;
  v7 = objc_msgSend_holidayIndex(self, a3, (uint64_t)a4);
  v34[0] = objc_msgSend_unsignedCharValue(v7, v8, v9);

  v12 = objc_msgSend_localStartTime(self, v10, v11);
  LODWORD(v35) = objc_msgSend_unsignedIntValue(v12, v13, v14);

  v17 = objc_msgSend_localEndTime(self, v15, v16);
  HIDWORD(v35) = objc_msgSend_unsignedIntValue(v17, v18, v19);

  uint64_t v22 = objc_msgSend_operatingMode(self, v20, v21);
  char v36 = objc_msgSend_unsignedCharValue(v22, v23, v24);

  sub_244CC8F5C(0x62FuLL, 0, &v31);
  if (v31)
  {
    sub_244CB62B8((uint64_t)v26);
    v28 = 0;
    v29 = 0;
    v27 = &unk_26F9536C8;
    char v30 = 0;
    sub_2447945A0((uint64_t)&v27, &v31, 0);
    sub_244CB6318((uint64_t)v26, (uint64_t)&v27, 0xFFFFFFFF, (uint64_t)v37);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_2448206A8((uint64_t)v34, v26, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v26, &v31, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v31);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    v27 = &unk_26F9536C8;
    sub_244794634(&v29);
    sub_244794634(&v28);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 19926;
  }
  sub_244794634(&v31);
  return (ChipError *)sub_24479466C((uint64_t)&v32);
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
    int v11 = 19955;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end