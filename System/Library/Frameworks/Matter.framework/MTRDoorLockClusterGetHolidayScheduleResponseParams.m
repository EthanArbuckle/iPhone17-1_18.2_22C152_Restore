@interface MTRDoorLockClusterGetHolidayScheduleResponseParams
- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3;
- (MTRDoorLockClusterGetHolidayScheduleResponseParams)init;
- (MTRDoorLockClusterGetHolidayScheduleResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error;
- (NSNumber)holidayIndex;
- (NSNumber)localEndTime;
- (NSNumber)localStartTime;
- (NSNumber)operatingMode;
- (NSNumber)status;
- (NSNumber)timedInvokeTimeoutMs;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setHolidayIndex:(NSNumber *)holidayIndex;
- (void)setLocalEndTime:(NSNumber *)localEndTime;
- (void)setLocalStartTime:(NSNumber *)localStartTime;
- (void)setOperatingMode:(NSNumber *)operatingMode;
- (void)setStatus:(NSNumber *)status;
- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs;
@end

@implementation MTRDoorLockClusterGetHolidayScheduleResponseParams

- (MTRDoorLockClusterGetHolidayScheduleResponseParams)init
{
  v11.receiver = self;
  v11.super_class = (Class)MTRDoorLockClusterGetHolidayScheduleResponseParams;
  v2 = [(MTRDoorLockClusterGetHolidayScheduleResponseParams *)&v11 init];
  v3 = v2;
  if (v2)
  {
    holidayIndex = v2->_holidayIndex;
    v2->_holidayIndex = (NSNumber *)&unk_26F9C8548;

    status = v3->_status;
    v3->_status = (NSNumber *)&unk_26F9C8548;

    localStartTime = v3->_localStartTime;
    v3->_localStartTime = 0;

    localEndTime = v3->_localEndTime;
    v3->_localEndTime = 0;

    operatingMode = v3->_operatingMode;
    v3->_operatingMode = 0;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRDoorLockClusterGetHolidayScheduleResponseParams);
  v7 = objc_msgSend_holidayIndex(self, v5, v6);
  objc_msgSend_setHolidayIndex_(v4, v8, (uint64_t)v7);

  objc_super v11 = objc_msgSend_status(self, v9, v10);
  objc_msgSend_setStatus_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_localStartTime(self, v13, v14);
  objc_msgSend_setLocalStartTime_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_localEndTime(self, v17, v18);
  objc_msgSend_setLocalEndTime_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_operatingMode(self, v21, v22);
  objc_msgSend_setOperatingMode_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_timedInvokeTimeoutMs(self, v25, v26);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v28, (uint64_t)v27);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: holidayIndex:%@; status:%@; localStartTime:%@; localEndTime:%@; operatingMode:%@; >",
    v5,
    self->_holidayIndex,
    self->_status,
    self->_localStartTime,
    self->_localEndTime,
  v7 = self->_operatingMode);

  return v7;
}

- (MTRDoorLockClusterGetHolidayScheduleResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  uint64_t v6 = responseValue;
  v38.receiver = self;
  v38.super_class = (Class)MTRDoorLockClusterGetHolidayScheduleResponseParams;
  v8 = [(MTRDoorLockClusterGetHolidayScheduleResponseParams *)&v38 init];
  if (!v8)
  {
    v30 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 257, 18, error);
  if (v37)
  {
    sub_244CB3988((uint64_t)v36);
    sub_244CB39B8((uint64_t)v36, *((void *)v37 + 1), *((void *)v37 + 3));
    long long v34 = 0uLL;
    uint64_t v35 = 0;
    sub_244CB54B4((uint64_t)v36, 256, &v34);
    if (!v34)
    {
      LOWORD(buf) = 0;
      BYTE4(buf) = 0;
      BYTE12(buf) = 0;
      BYTE4(v42) = 0;
      sub_244820BB4((uint64_t)&buf, (uint64_t)v36, (uint64_t)&v32);
      long long v34 = v32;
      uint64_t v35 = v33;
      if (!v32)
      {
        objc_msgSend__setFieldsFromDecodableStruct_(v8, v9, (uint64_t)&buf);
        long long v34 = v32;
        uint64_t v35 = v33;
        if (!v32)
        {
          v30 = v8;
          goto LABEL_14;
        }
      }
    }
    uint64_t v10 = NSString;
    long long buf = v34;
    uint64_t v42 = v35;
    objc_super v11 = sub_244CB7B34((const char **)&buf, 1);
    v13 = objc_msgSend_stringWithFormat_(v10, v12, @"Command payload decoding failed: %s", v11);
    uint64_t v14 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = v13;
      uint64_t v18 = objc_msgSend_UTF8String(v15, v16, v17);
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = v18;
      _os_log_impl(&dword_2446BD000, v14, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&buf, 0xCu);
    }

    if (sub_244CC4E58(1u))
    {
      id v21 = v13;
      objc_msgSend_UTF8String(v21, v22, v23);
      sub_244CC4DE0(0, 1);
    }
    if (error)
    {
      uint64_t v39 = *MEMORY[0x263F08338];
      v24 = objc_msgSend_mainBundle(MEMORY[0x263F086E0], v19, v20);
      uint64_t v26 = objc_msgSend_localizedStringForKey_value_table_(v24, v25, (uint64_t)v13, &stru_26F969DC8, 0);
      v40 = v26;
      v28 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v27, (uint64_t)&v40, &v39, 1);

      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v29, @"MTRErrorDomain", 13, v28);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    }
  }
  v30 = 0;
LABEL_14:
  sub_244794634(&v37);
LABEL_16:

  return v30;
}

- (NSNumber)holidayIndex
{
  return self->_holidayIndex;
}

- (void)setHolidayIndex:(NSNumber *)holidayIndex
{
}

- (NSNumber)status
{
  return self->_status;
}

- (void)setStatus:(NSNumber *)status
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_operatingMode, 0);
  objc_storeStrong((id *)&self->_localEndTime, 0);
  objc_storeStrong((id *)&self->_localStartTime, 0);
  objc_storeStrong((id *)&self->_status, 0);

  objc_storeStrong((id *)&self->_holidayIndex, 0);
}

- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3
{
  v7 = objc_msgSend_numberWithUnsignedChar_(NSNumber, a3, *(unsigned __int8 *)a4);
  objc_msgSend_setHolidayIndex_(self, v8, (uint64_t)v7);

  uint64_t v10 = objc_msgSend_numberWithUnsignedChar_(NSNumber, v9, *((unsigned __int8 *)a4 + 1));
  objc_msgSend_setStatus_(self, v11, (uint64_t)v10);

  if (*((unsigned char *)a4 + 4))
  {
    v13 = NSNumber;
    uint64_t v14 = sub_2446F12CC((unsigned char *)a4 + 4);
    v16 = objc_msgSend_numberWithUnsignedInt_(v13, v15, *(unsigned int *)v14);
    objc_msgSend_setLocalStartTime_(self, v17, (uint64_t)v16);
  }
  else
  {
    objc_msgSend_setLocalStartTime_(self, v12, 0);
  }
  if (*((unsigned char *)a4 + 12))
  {
    v19 = NSNumber;
    uint64_t v20 = sub_2446F12CC((unsigned char *)a4 + 12);
    uint64_t v22 = objc_msgSend_numberWithUnsignedInt_(v19, v21, *(unsigned int *)v20);
    objc_msgSend_setLocalEndTime_(self, v23, (uint64_t)v22);
  }
  else
  {
    objc_msgSend_setLocalEndTime_(self, v18, 0);
  }
  int v26 = *((unsigned __int8 *)a4 + 20);
  v25 = (char *)a4 + 20;
  if (v26)
  {
    v27 = NSNumber;
    v28 = sub_2446F9190(v25);
    v30 = objc_msgSend_numberWithUnsignedChar_(v27, v29, *v28);
    objc_msgSend_setOperatingMode_(self, v31, (uint64_t)v30);
  }
  else
  {
    result = (ChipError *)objc_msgSend_setOperatingMode_(self, v24, 0);
  }
  retstr->mError = 0;
  retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-gene"
                  "rated/MTRCommandPayloadsObjc.mm";
  retstr->mLine = 20153;
  return result;
}

@end