@interface MTRThermostatClusterGetWeeklyScheduleResponseParams
- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3;
- (MTRThermostatClusterGetWeeklyScheduleResponseParams)init;
- (MTRThermostatClusterGetWeeklyScheduleResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error;
- (NSArray)transitions;
- (NSNumber)dayOfWeekForSequence;
- (NSNumber)modeForSequence;
- (NSNumber)numberOfTransitionsForSequence;
- (NSNumber)timedInvokeTimeoutMs;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setDayOfWeekForSequence:(NSNumber *)dayOfWeekForSequence;
- (void)setModeForSequence:(NSNumber *)modeForSequence;
- (void)setNumberOfTransitionsForSequence:(NSNumber *)numberOfTransitionsForSequence;
- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs;
- (void)setTransitions:(NSArray *)transitions;
@end

@implementation MTRThermostatClusterGetWeeklyScheduleResponseParams

- (MTRThermostatClusterGetWeeklyScheduleResponseParams)init
{
  v13.receiver = self;
  v13.super_class = (Class)MTRThermostatClusterGetWeeklyScheduleResponseParams;
  v2 = [(MTRThermostatClusterGetWeeklyScheduleResponseParams *)&v13 init];
  v3 = v2;
  if (v2)
  {
    numberOfTransitionsForSequence = v2->_numberOfTransitionsForSequence;
    v2->_numberOfTransitionsForSequence = (NSNumber *)&unk_26F9C8548;

    dayOfWeekForSequence = v3->_dayOfWeekForSequence;
    v3->_dayOfWeekForSequence = (NSNumber *)&unk_26F9C8548;

    modeForSequence = v3->_modeForSequence;
    v3->_modeForSequence = (NSNumber *)&unk_26F9C8548;

    uint64_t v9 = objc_msgSend_array(MEMORY[0x263EFF8C0], v7, v8);
    transitions = v3->_transitions;
    v3->_transitions = (NSArray *)v9;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRThermostatClusterGetWeeklyScheduleResponseParams);
  v7 = objc_msgSend_numberOfTransitionsForSequence(self, v5, v6);
  objc_msgSend_setNumberOfTransitionsForSequence_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_dayOfWeekForSequence(self, v9, v10);
  objc_msgSend_setDayOfWeekForSequence_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_modeForSequence(self, v13, v14);
  objc_msgSend_setModeForSequence_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_transitions(self, v17, v18);
  objc_msgSend_setTransitions_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_timedInvokeTimeoutMs(self, v21, v22);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v24, (uint64_t)v23);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: numberOfTransitionsForSequence:%@; dayOfWeekForSequence:%@; modeForSequence:%@; transitions:%@; >",
    v5,
    self->_numberOfTransitionsForSequence,
    self->_dayOfWeekForSequence,
    self->_modeForSequence,
  v7 = self->_transitions);

  return v7;
}

- (MTRThermostatClusterGetWeeklyScheduleResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  uint64_t v6 = responseValue;
  v39.receiver = self;
  v39.super_class = (Class)MTRThermostatClusterGetWeeklyScheduleResponseParams;
  uint64_t v8 = [(MTRThermostatClusterGetWeeklyScheduleResponseParams *)&v39 init];
  if (!v8)
  {
    v31 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 513, 0, error);
  if (v38)
  {
    sub_244CB3988((uint64_t)v37);
    sub_244CB39B8((uint64_t)v37, *((void *)v38 + 1), *((void *)v38 + 3));
    long long v35 = 0uLL;
    uint64_t v36 = 0;
    sub_244CB54B4((uint64_t)v37, 256, &v35);
    if (!v35)
    {
      LOWORD(buf) = 0;
      BYTE2(buf) = 0;
      sub_244CB3988((uint64_t)&buf + 8);
      char v44 = 0;
      sub_244CB39B8(v9, 0, 0);
      sub_2448285F4(&buf, (uint64_t)v37, (uint64_t)&v33);
      long long v35 = v33;
      uint64_t v36 = v34;
      if (!v33)
      {
        objc_msgSend__setFieldsFromDecodableStruct_(v8, v10, (uint64_t)&buf);
        long long v35 = v33;
        uint64_t v36 = v34;
        if (!v33)
        {
          v31 = v8;
          goto LABEL_14;
        }
      }
    }
    v11 = NSString;
    long long buf = v35;
    uint64_t v43 = v36;
    v12 = sub_244CB7B34((const char **)&buf, 1);
    uint64_t v14 = objc_msgSend_stringWithFormat_(v11, v13, @"Command payload decoding failed: %s", v12);
    v15 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = v14;
      uint64_t v19 = objc_msgSend_UTF8String(v16, v17, v18);
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = v19;
      _os_log_impl(&dword_2446BD000, v15, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&buf, 0xCu);
    }

    if (sub_244CC4E58(1u))
    {
      id v22 = v14;
      objc_msgSend_UTF8String(v22, v23, v24);
      sub_244CC4DE0(0, 1);
    }
    if (error)
    {
      uint64_t v40 = *MEMORY[0x263F08338];
      v25 = objc_msgSend_mainBundle(MEMORY[0x263F086E0], v20, v21);
      v27 = objc_msgSend_localizedStringForKey_value_table_(v25, v26, (uint64_t)v14, &stru_26F969DC8, 0);
      v41 = v27;
      v29 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v28, (uint64_t)&v41, &v40, 1);

      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v30, @"MTRErrorDomain", 13, v29);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    }
  }
  v31 = 0;
LABEL_14:
  sub_244794634(&v38);
LABEL_16:

  return v31;
}

- (NSNumber)numberOfTransitionsForSequence
{
  return self->_numberOfTransitionsForSequence;
}

- (void)setNumberOfTransitionsForSequence:(NSNumber *)numberOfTransitionsForSequence
{
}

- (NSNumber)dayOfWeekForSequence
{
  return self->_dayOfWeekForSequence;
}

- (void)setDayOfWeekForSequence:(NSNumber *)dayOfWeekForSequence
{
}

- (NSNumber)modeForSequence
{
  return self->_modeForSequence;
}

- (void)setModeForSequence:(NSNumber *)modeForSequence
{
}

- (NSArray)transitions
{
  return self->_transitions;
}

- (void)setTransitions:(NSArray *)transitions
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
  objc_storeStrong((id *)&self->_transitions, 0);
  objc_storeStrong((id *)&self->_modeForSequence, 0);
  objc_storeStrong((id *)&self->_dayOfWeekForSequence, 0);

  objc_storeStrong((id *)&self->_numberOfTransitionsForSequence, 0);
}

- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3
{
  v7 = objc_msgSend_numberWithUnsignedChar_(NSNumber, a3, *(unsigned __int8 *)a4);
  objc_msgSend_setNumberOfTransitionsForSequence_(self, v8, (uint64_t)v7);

  uint64_t v10 = objc_msgSend_numberWithUnsignedChar_(NSNumber, v9, *((unsigned __int8 *)a4 + 1));
  objc_msgSend_setDayOfWeekForSequence_(self, v11, (uint64_t)v10);

  objc_super v13 = objc_msgSend_numberWithUnsignedChar_(NSNumber, v12, *((unsigned __int8 *)a4 + 2));
  objc_msgSend_setModeForSequence_(self, v14, (uint64_t)v13);

  v15 = objc_opt_new();
  v35[0] = *((unsigned char *)a4 + 80);
  if (v35[0]) {
    v35[1] = *((unsigned char *)a4 + 81);
  }
  sub_2447969D0((uint64_t)v29, (uint64_t)a4 + 8, v35);
  while (sub_244796A54((uint64_t)v29))
  {
    v17 = objc_opt_new();
    uint64_t v19 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v18, v29[0]);
    objc_msgSend_setTransitionTime_(v17, v20, (uint64_t)v19);

    if (v30)
    {
      id v22 = objc_msgSend_numberWithShort_(NSNumber, v21, v29[1]);
      objc_msgSend_setHeatSetpoint_(v17, v23, (uint64_t)v22);
    }
    else
    {
      objc_msgSend_setHeatSetpoint_(v17, v21, 0);
    }
    if (v32)
    {
      v25 = objc_msgSend_numberWithShort_(NSNumber, v24, v31);
      objc_msgSend_setCoolSetpoint_(v17, v26, (uint64_t)v25);
    }
    else
    {
      objc_msgSend_setCoolSetpoint_(v17, v24, 0);
    }
    objc_msgSend_addObject_(v15, v27, (uint64_t)v17);
  }
  *(void *)&retstr->mError = 0;
  retstr->mFile = 0;
  *(void *)&retstr->mLine = 0;
  if (v33 == 33)
  {
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/app/data-model/DecodableList.h";
    retstr->mLine = 147;
  }
  else
  {
    *(_OWORD *)&retstr->mError = v33;
    *(void *)&retstr->mLine = v34;
    if (retstr->mError)
    {

      return result;
    }
  }
  objc_msgSend_setTransitions_(self, v16, (uint64_t)v15);

  retstr->mError = 0;
  retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-gene"
                  "rated/MTRCommandPayloadsObjc.mm";
  retstr->mLine = 22627;
  return result;
}

@end