@interface MTRDoorLockClusterGetWeekDayScheduleResponseParams
- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3;
- (MTRDoorLockClusterGetWeekDayScheduleResponseParams)init;
- (MTRDoorLockClusterGetWeekDayScheduleResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error;
- (NSNumber)daysMask;
- (NSNumber)endHour;
- (NSNumber)endMinute;
- (NSNumber)startHour;
- (NSNumber)startMinute;
- (NSNumber)status;
- (NSNumber)timedInvokeTimeoutMs;
- (NSNumber)userIndex;
- (NSNumber)weekDayIndex;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setDaysMask:(NSNumber *)daysMask;
- (void)setEndHour:(NSNumber *)endHour;
- (void)setEndMinute:(NSNumber *)endMinute;
- (void)setStartHour:(NSNumber *)startHour;
- (void)setStartMinute:(NSNumber *)startMinute;
- (void)setStatus:(NSNumber *)status;
- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs;
- (void)setUserIndex:(NSNumber *)userIndex;
- (void)setWeekDayIndex:(NSNumber *)weekDayIndex;
@end

@implementation MTRDoorLockClusterGetWeekDayScheduleResponseParams

- (MTRDoorLockClusterGetWeekDayScheduleResponseParams)init
{
  v14.receiver = self;
  v14.super_class = (Class)MTRDoorLockClusterGetWeekDayScheduleResponseParams;
  v2 = [(MTRDoorLockClusterGetWeekDayScheduleResponseParams *)&v14 init];
  v3 = v2;
  if (v2)
  {
    weekDayIndex = v2->_weekDayIndex;
    v2->_weekDayIndex = (NSNumber *)&unk_26F9C8548;

    userIndex = v3->_userIndex;
    v3->_userIndex = (NSNumber *)&unk_26F9C8548;

    status = v3->_status;
    v3->_status = (NSNumber *)&unk_26F9C8548;

    daysMask = v3->_daysMask;
    v3->_daysMask = 0;

    startHour = v3->_startHour;
    v3->_startHour = 0;

    startMinute = v3->_startMinute;
    v3->_startMinute = 0;

    endHour = v3->_endHour;
    v3->_endHour = 0;

    endMinute = v3->_endMinute;
    v3->_endMinute = 0;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRDoorLockClusterGetWeekDayScheduleResponseParams);
  v7 = objc_msgSend_weekDayIndex(self, v5, v6);
  objc_msgSend_setWeekDayIndex_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_userIndex(self, v9, v10);
  objc_msgSend_setUserIndex_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_status(self, v13, v14);
  objc_msgSend_setStatus_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_daysMask(self, v17, v18);
  objc_msgSend_setDaysMask_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_startHour(self, v21, v22);
  objc_msgSend_setStartHour_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_startMinute(self, v25, v26);
  objc_msgSend_setStartMinute_(v4, v28, (uint64_t)v27);

  v31 = objc_msgSend_endHour(self, v29, v30);
  objc_msgSend_setEndHour_(v4, v32, (uint64_t)v31);

  v35 = objc_msgSend_endMinute(self, v33, v34);
  objc_msgSend_setEndMinute_(v4, v36, (uint64_t)v35);

  v39 = objc_msgSend_timedInvokeTimeoutMs(self, v37, v38);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v40, (uint64_t)v39);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: weekDayIndex:%@; userIndex:%@; status:%@; daysMask:%@; startHour:%@; startMinute:%@; endHour:%@; endMinute:%@; >",
    v5,
    self->_weekDayIndex,
    self->_userIndex,
    self->_status,
    self->_daysMask,
    self->_startHour,
    self->_startMinute,
    self->_endHour,
  v7 = self->_endMinute);

  return v7;
}

- (MTRDoorLockClusterGetWeekDayScheduleResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  uint64_t v6 = responseValue;
  v42.receiver = self;
  v42.super_class = (Class)MTRDoorLockClusterGetWeekDayScheduleResponseParams;
  v8 = [(MTRDoorLockClusterGetWeekDayScheduleResponseParams *)&v42 init];
  if (!v8)
  {
    uint64_t v30 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 257, 12, error);
  if (v41)
  {
    sub_244CB3988((uint64_t)v40);
    sub_244CB39B8((uint64_t)v40, *((void *)v41 + 1), *((void *)v41 + 3));
    long long v38 = 0uLL;
    uint64_t v39 = 0;
    sub_244CB54B4((uint64_t)v40, 256, &v38);
    if (!v38)
    {
      v32[0] = 0;
      int v33 = 0;
      char v34 = 0;
      char v35 = 0;
      char v36 = 0;
      char v37 = 0;
      sub_24481FB00((uint64_t)v32, (uint64_t)v40, (uint64_t)buf);
      long long v38 = *(_OWORD *)buf;
      uint64_t v39 = v46;
      if (!*(_DWORD *)buf)
      {
        objc_msgSend__setFieldsFromDecodableStruct_(v8, v9, (uint64_t)v32);
        long long v38 = *(_OWORD *)buf;
        uint64_t v39 = v46;
        if (!*(_DWORD *)buf)
        {
          uint64_t v30 = v8;
          goto LABEL_14;
        }
      }
    }
    uint64_t v10 = NSString;
    *(_OWORD *)buf = v38;
    uint64_t v46 = v39;
    v11 = sub_244CB7B34((const char **)buf, 1);
    v13 = objc_msgSend_stringWithFormat_(v10, v12, @"Command payload decoding failed: %s", v11);
    uint64_t v14 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = v13;
      uint64_t v18 = objc_msgSend_UTF8String(v15, v16, v17);
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = v18;
      _os_log_impl(&dword_2446BD000, v14, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
    }

    if (sub_244CC4E58(1u))
    {
      id v21 = v13;
      objc_msgSend_UTF8String(v21, v22, v23);
      sub_244CC4DE0(0, 1);
    }
    if (error)
    {
      uint64_t v43 = *MEMORY[0x263F08338];
      v24 = objc_msgSend_mainBundle(MEMORY[0x263F086E0], v19, v20);
      uint64_t v26 = objc_msgSend_localizedStringForKey_value_table_(v24, v25, (uint64_t)v13, &stru_26F969DC8, 0);
      v44 = v26;
      v28 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v27, (uint64_t)&v44, &v43, 1);

      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v29, @"MTRErrorDomain", 13, v28);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    }
  }
  uint64_t v30 = 0;
LABEL_14:
  sub_244794634(&v41);
LABEL_16:

  return v30;
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

- (NSNumber)status
{
  return self->_status;
}

- (void)setStatus:(NSNumber *)status
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_endMinute, 0);
  objc_storeStrong((id *)&self->_endHour, 0);
  objc_storeStrong((id *)&self->_startMinute, 0);
  objc_storeStrong((id *)&self->_startHour, 0);
  objc_storeStrong((id *)&self->_daysMask, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_userIndex, 0);

  objc_storeStrong((id *)&self->_weekDayIndex, 0);
}

- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3
{
  v7 = objc_msgSend_numberWithUnsignedChar_(NSNumber, a3, *(unsigned __int8 *)a4);
  objc_msgSend_setWeekDayIndex_(self, v8, (uint64_t)v7);

  uint64_t v10 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v9, *((unsigned __int16 *)a4 + 1));
  objc_msgSend_setUserIndex_(self, v11, (uint64_t)v10);

  v13 = objc_msgSend_numberWithUnsignedChar_(NSNumber, v12, *((unsigned __int8 *)a4 + 4));
  objc_msgSend_setStatus_(self, v14, (uint64_t)v13);

  if (*((unsigned char *)a4 + 5))
  {
    v16 = NSNumber;
    uint64_t v17 = sub_2446F9190((unsigned char *)a4 + 5);
    v19 = objc_msgSend_numberWithUnsignedChar_(v16, v18, *v17);
    objc_msgSend_setDaysMask_(self, v20, (uint64_t)v19);
  }
  else
  {
    objc_msgSend_setDaysMask_(self, v15, 0);
  }
  if (*((unsigned char *)a4 + 7))
  {
    uint64_t v22 = NSNumber;
    uint64_t v23 = sub_2446F9190((unsigned char *)a4 + 7);
    v25 = objc_msgSend_numberWithUnsignedChar_(v22, v24, *v23);
    objc_msgSend_setStartHour_(self, v26, (uint64_t)v25);
  }
  else
  {
    objc_msgSend_setStartHour_(self, v21, 0);
  }
  if (*((unsigned char *)a4 + 9))
  {
    v28 = NSNumber;
    v29 = sub_2446F9190((unsigned char *)a4 + 9);
    v31 = objc_msgSend_numberWithUnsignedChar_(v28, v30, *v29);
    objc_msgSend_setStartMinute_(self, v32, (uint64_t)v31);
  }
  else
  {
    objc_msgSend_setStartMinute_(self, v27, 0);
  }
  if (*((unsigned char *)a4 + 11))
  {
    char v34 = NSNumber;
    char v35 = sub_2446F9190((unsigned char *)a4 + 11);
    char v37 = objc_msgSend_numberWithUnsignedChar_(v34, v36, *v35);
    objc_msgSend_setEndHour_(self, v38, (uint64_t)v37);
  }
  else
  {
    objc_msgSend_setEndHour_(self, v33, 0);
  }
  int v41 = *((unsigned __int8 *)a4 + 13);
  v40 = (char *)a4 + 13;
  if (v41)
  {
    objc_super v42 = NSNumber;
    uint64_t v43 = sub_2446F9190(v40);
    v45 = objc_msgSend_numberWithUnsignedChar_(v42, v44, *v43);
    objc_msgSend_setEndMinute_(self, v46, (uint64_t)v45);
  }
  else
  {
    result = (ChipError *)objc_msgSend_setEndMinute_(self, v39, 0);
  }
  retstr->mError = 0;
  retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-gene"
                  "rated/MTRCommandPayloadsObjc.mm";
  retstr->mLine = 19395;
  return result;
}

@end