@interface MTRThermostatClusterSetWeeklyScheduleParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRThermostatClusterSetWeeklyScheduleParams)init;
- (NSArray)transitions;
- (NSNumber)dayOfWeekForSequence;
- (NSNumber)modeForSequence;
- (NSNumber)numberOfTransitionsForSequence;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)timedInvokeTimeoutMs;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setDayOfWeekForSequence:(NSNumber *)dayOfWeekForSequence;
- (void)setModeForSequence:(NSNumber *)modeForSequence;
- (void)setNumberOfTransitionsForSequence:(NSNumber *)numberOfTransitionsForSequence;
- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout;
- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs;
- (void)setTransitions:(NSArray *)transitions;
@end

@implementation MTRThermostatClusterSetWeeklyScheduleParams

- (MTRThermostatClusterSetWeeklyScheduleParams)init
{
  v14.receiver = self;
  v14.super_class = (Class)MTRThermostatClusterSetWeeklyScheduleParams;
  v2 = [(MTRThermostatClusterSetWeeklyScheduleParams *)&v14 init];
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

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRThermostatClusterSetWeeklyScheduleParams);
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

  v27 = objc_msgSend_serverSideProcessingTimeout(self, v25, v26);
  objc_msgSend_setServerSideProcessingTimeout_(v4, v28, (uint64_t)v27);

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
  objc_storeStrong((id *)&self->_transitions, 0);
  objc_storeStrong((id *)&self->_modeForSequence, 0);
  objc_storeStrong((id *)&self->_dayOfWeekForSequence, 0);

  objc_storeStrong((id *)&self->_numberOfTransitionsForSequence, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  __int16 v35 = 0;
  char v36 = 0;
  uint64_t v37 = 0;
  uint64_t v38 = 0;
  v34[0] = 0;
  v34[1] = 0;
  v33 = v34;
  uint64_t v6 = objc_msgSend_numberOfTransitionsForSequence(self, a3, (uint64_t)a4);
  LOBYTE(v35) = objc_msgSend_unsignedCharValue(v6, v7, v8);

  v11 = objc_msgSend_dayOfWeekForSequence(self, v9, v10);
  HIBYTE(v35) = objc_msgSend_unsignedCharValue(v11, v12, v13);

  v16 = objc_msgSend_modeForSequence(self, v14, v15);
  char v36 = objc_msgSend_unsignedCharValue(v16, v17, v18);

  v21 = objc_msgSend_transitions(self, v19, v20);
  uint64_t v24 = objc_msgSend_count(v21, v22, v23);

  if (v24) {
    operator new();
  }
  uint64_t v37 = 0;
  uint64_t v38 = 0;
  sub_244CC8F5C(0x62FuLL, 0, &v32);
  if (v32)
  {
    sub_244CB62B8((uint64_t)v27);
    v29 = 0;
    v30 = 0;
    v28 = &unk_26F9536C8;
    char v31 = 0;
    sub_2447945A0((uint64_t)&v28, &v32, 0);
    sub_244CB6318((uint64_t)v27, (uint64_t)&v28, 0xFFFFFFFF, (uint64_t)v39);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_2448283B8((uint64_t)&v35, v27, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v27, &v32, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v32);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    v28 = &unk_26F9536C8;
    sub_244794634(&v30);
    sub_244794634(&v29);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 22726;
  }
  sub_244794634(&v32);
  return (ChipError *)sub_24479466C((uint64_t)&v33);
}

- (id)_encodeAsDataValue:(id *)a3
{
  double v5 = sub_244CB3988((uint64_t)v14);
  uint64_t v15 = 0;
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
    int v11 = 22755;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end