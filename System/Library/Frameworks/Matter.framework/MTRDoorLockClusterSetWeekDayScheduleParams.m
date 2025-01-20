@interface MTRDoorLockClusterSetWeekDayScheduleParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRDoorLockClusterSetWeekDayScheduleParams)init;
- (NSNumber)daysMask;
- (NSNumber)endHour;
- (NSNumber)endMinute;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)startHour;
- (NSNumber)startMinute;
- (NSNumber)timedInvokeTimeoutMs;
- (NSNumber)userIndex;
- (NSNumber)weekDayIndex;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setDaysMask:(NSNumber *)daysMask;
- (void)setEndHour:(NSNumber *)endHour;
- (void)setEndMinute:(NSNumber *)endMinute;
- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout;
- (void)setStartHour:(NSNumber *)startHour;
- (void)setStartMinute:(NSNumber *)startMinute;
- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs;
- (void)setUserIndex:(NSNumber *)userIndex;
- (void)setWeekDayIndex:(NSNumber *)weekDayIndex;
@end

@implementation MTRDoorLockClusterSetWeekDayScheduleParams

- (MTRDoorLockClusterSetWeekDayScheduleParams)init
{
  v14.receiver = self;
  v14.super_class = (Class)MTRDoorLockClusterSetWeekDayScheduleParams;
  v2 = [(MTRDoorLockClusterSetWeekDayScheduleParams *)&v14 init];
  v3 = v2;
  if (v2)
  {
    weekDayIndex = v2->_weekDayIndex;
    v2->_weekDayIndex = (NSNumber *)&unk_26F9C8548;

    userIndex = v3->_userIndex;
    v3->_userIndex = (NSNumber *)&unk_26F9C8548;

    daysMask = v3->_daysMask;
    v3->_daysMask = (NSNumber *)&unk_26F9C8548;

    startHour = v3->_startHour;
    v3->_startHour = (NSNumber *)&unk_26F9C8548;

    startMinute = v3->_startMinute;
    v3->_startMinute = (NSNumber *)&unk_26F9C8548;

    endHour = v3->_endHour;
    v3->_endHour = (NSNumber *)&unk_26F9C8548;

    endMinute = v3->_endMinute;
    v3->_endMinute = (NSNumber *)&unk_26F9C8548;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRDoorLockClusterSetWeekDayScheduleParams);
  v7 = objc_msgSend_weekDayIndex(self, v5, v6);
  objc_msgSend_setWeekDayIndex_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_userIndex(self, v9, v10);
  objc_msgSend_setUserIndex_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_daysMask(self, v13, v14);
  objc_msgSend_setDaysMask_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_startHour(self, v17, v18);
  objc_msgSend_setStartHour_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_startMinute(self, v21, v22);
  objc_msgSend_setStartMinute_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_endHour(self, v25, v26);
  objc_msgSend_setEndHour_(v4, v28, (uint64_t)v27);

  v31 = objc_msgSend_endMinute(self, v29, v30);
  objc_msgSend_setEndMinute_(v4, v32, (uint64_t)v31);

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
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: weekDayIndex:%@; userIndex:%@; daysMask:%@; startHour:%@; startMinute:%@; endHour:%@; endMinute:%@; >",
    v5,
    self->_weekDayIndex,
    self->_userIndex,
    self->_daysMask,
    self->_startHour,
    self->_startMinute,
    self->_endHour,
  v7 = self->_endMinute);

  return v7;
}

- (NSNumber)weekDayIndex
{
  return self->_weekDayIndex;
}

- (void)setWeekDayIndex:(NSNumber *)weekDayIndex
{
}

- (NSNumber)userIndex
{
  return self->_userIndex;
}

- (void)setUserIndex:(NSNumber *)userIndex
{
}

- (NSNumber)daysMask
{
  return self->_daysMask;
}

- (void)setDaysMask:(NSNumber *)daysMask
{
}

- (NSNumber)startHour
{
  return self->_startHour;
}

- (void)setStartHour:(NSNumber *)startHour
{
}

- (NSNumber)startMinute
{
  return self->_startMinute;
}

- (void)setStartMinute:(NSNumber *)startMinute
{
}

- (NSNumber)endHour
{
  return self->_endHour;
}

- (void)setEndHour:(NSNumber *)endHour
{
}

- (NSNumber)endMinute
{
  return self->_endMinute;
}

- (void)setEndMinute:(NSNumber *)endMinute
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
  objc_storeStrong((id *)&self->_endMinute, 0);
  objc_storeStrong((id *)&self->_endHour, 0);
  objc_storeStrong((id *)&self->_startMinute, 0);
  objc_storeStrong((id *)&self->_startHour, 0);
  objc_storeStrong((id *)&self->_daysMask, 0);
  objc_storeStrong((id *)&self->_userIndex, 0);

  objc_storeStrong((id *)&self->_weekDayIndex, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  char v49 = 0;
  memset(v50, 0, 7);
  v48[0] = 0;
  v48[1] = 0;
  v47 = v48;
  v7 = objc_msgSend_weekDayIndex(self, a3, (uint64_t)a4);
  char v49 = objc_msgSend_unsignedCharValue(v7, v8, v9);

  v12 = objc_msgSend_userIndex(self, v10, v11);
  v50[0] = objc_msgSend_unsignedShortValue(v12, v13, v14);

  v17 = objc_msgSend_daysMask(self, v15, v16);
  LOBYTE(v50[1]) = objc_msgSend_unsignedCharValue(v17, v18, v19);

  uint64_t v22 = objc_msgSend_startHour(self, v20, v21);
  HIBYTE(v50[1]) = objc_msgSend_unsignedCharValue(v22, v23, v24);

  v27 = objc_msgSend_startMinute(self, v25, v26);
  LOBYTE(v50[2]) = objc_msgSend_unsignedCharValue(v27, v28, v29);

  v32 = objc_msgSend_endHour(self, v30, v31);
  HIBYTE(v50[2]) = objc_msgSend_unsignedCharValue(v32, v33, v34);

  v37 = objc_msgSend_endMinute(self, v35, v36);
  LOBYTE(v50[3]) = objc_msgSend_unsignedCharValue(v37, v38, v39);

  sub_244CC8F5C(0x62FuLL, 0, &v46);
  if (v46)
  {
    sub_244CB62B8((uint64_t)v41);
    v43 = 0;
    v44 = 0;
    v42 = &unk_26F9536C8;
    char v45 = 0;
    sub_2447945A0((uint64_t)&v42, &v46, 0);
    sub_244CB6318((uint64_t)v41, (uint64_t)&v42, 0xFFFFFFFF, (uint64_t)v51);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_24481F444(v41, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v41, &v46, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v46);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    v42 = &unk_26F9536C8;
    sub_244794634(&v44);
    sub_244794634(&v43);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 19136;
  }
  sub_244794634(&v46);
  return (ChipError *)sub_24479466C((uint64_t)&v47);
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
    int v11 = 19165;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end