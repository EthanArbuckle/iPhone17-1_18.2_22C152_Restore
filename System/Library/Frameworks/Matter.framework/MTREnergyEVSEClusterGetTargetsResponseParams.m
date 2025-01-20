@interface MTREnergyEVSEClusterGetTargetsResponseParams
- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3;
- (MTREnergyEVSEClusterGetTargetsResponseParams)init;
- (MTREnergyEVSEClusterGetTargetsResponseParams)initWithResponseValue:(id)a3 error:(id *)a4;
- (NSArray)chargingTargetSchedules;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setChargingTargetSchedules:(id)a3;
@end

@implementation MTREnergyEVSEClusterGetTargetsResponseParams

- (MTREnergyEVSEClusterGetTargetsResponseParams)init
{
  v8.receiver = self;
  v8.super_class = (Class)MTREnergyEVSEClusterGetTargetsResponseParams;
  v4 = [(MTREnergyEVSEClusterGetTargetsResponseParams *)&v8 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend_array(MEMORY[0x263EFF8C0], v2, v3);
    chargingTargetSchedules = v4->_chargingTargetSchedules;
    v4->_chargingTargetSchedules = (NSArray *)v5;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTREnergyEVSEClusterGetTargetsResponseParams);
  v7 = objc_msgSend_chargingTargetSchedules(self, v5, v6);
  objc_msgSend_setChargingTargetSchedules_(v4, v8, (uint64_t)v7);

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: chargingTargetSchedules:%@; >",
    v5,
  v7 = self->_chargingTargetSchedules);

  return v7;
}

- (MTREnergyEVSEClusterGetTargetsResponseParams)initWithResponseValue:(id)a3 error:(id *)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v39.receiver = self;
  v39.super_class = (Class)MTREnergyEVSEClusterGetTargetsResponseParams;
  objc_super v8 = [(MTREnergyEVSEClusterGetTargetsResponseParams *)&v39 init];
  if (!v8)
  {
    v31 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 153, 0, a4);
  if (v38)
  {
    sub_244CB3988((uint64_t)v37);
    sub_244CB39B8((uint64_t)v37, *((void *)v38 + 1), *((void *)v38 + 3));
    long long v35 = 0uLL;
    uint64_t v36 = 0;
    sub_244CB54B4((uint64_t)v37, 256, &v35);
    if (!v35)
    {
      sub_244CB3988((uint64_t)&buf);
      char v44 = 0;
      sub_244CB39B8(v9, 0, 0);
      sub_24481C7F4((uint64_t)&buf, (uint64_t)v37, (uint64_t)&v33);
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
    v14 = objc_msgSend_stringWithFormat_(v11, v13, @"Command payload decoding failed: %s", v12);
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
    if (a4)
    {
      uint64_t v40 = *MEMORY[0x263F08338];
      v25 = objc_msgSend_mainBundle(MEMORY[0x263F086E0], v20, v21);
      v27 = objc_msgSend_localizedStringForKey_value_table_(v25, v26, (uint64_t)v14, &stru_26F969DC8, 0);
      v41 = v27;
      v29 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v28, (uint64_t)&v41, &v40, 1);

      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v30, @"MTRErrorDomain", 13, v29);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v31 = 0;
LABEL_14:
  sub_244794634(&v38);
LABEL_16:

  return v31;
}

- (NSArray)chargingTargetSchedules
{
  return self->_chargingTargetSchedules;
}

- (void)setChargingTargetSchedules:(id)a3
{
}

- (void).cxx_destruct
{
}

- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3
{
  long long v33 = objc_opt_new();
  LOBYTE(v34) = *((unsigned char *)a4 + 72);
  if ((_BYTE)v34) {
    HIBYTE(v34) = *((unsigned char *)a4 + 73);
  }
  sub_244796200((uint64_t)v39, (uint64_t)a4, (unsigned __int8 *)&v34);
  while (sub_244796288((uint64_t)v39))
  {
    v7 = objc_opt_new();
    uint64_t v9 = objc_msgSend_numberWithUnsignedChar_(NSNumber, v8, v39[0]);
    objc_msgSend_setDayOfWeekForSequence_(v7, v10, (uint64_t)v9);

    v11 = objc_opt_new();
    v45[0] = v41;
    if (v41) {
      v45[1] = v42;
    }
    sub_2447963A0((uint64_t)&v34, (uint64_t)&v40, v45);
    while (sub_24479641C((uint64_t)&v34))
    {
      v13 = objc_opt_new();
      v15 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v14, v34);
      objc_msgSend_setTargetTimeMinutesPastMidnight_(v13, v16, (uint64_t)v15);

      if (v35[0])
      {
        uint64_t v18 = NSNumber;
        uint64_t v19 = sub_2446F9190(v35);
        uint64_t v21 = objc_msgSend_numberWithUnsignedChar_(v18, v20, *v19);
        objc_msgSend_setTargetSoC_(v13, v22, (uint64_t)v21);
      }
      else
      {
        objc_msgSend_setTargetSoC_(v13, v17, 0);
      }
      if (v36[0])
      {
        uint64_t v24 = NSNumber;
        v25 = (uint64_t *)sub_2446F7170(v36);
        v27 = objc_msgSend_numberWithLongLong_(v24, v26, *v25);
        objc_msgSend_setAddedEnergy_(v13, v28, (uint64_t)v27);
      }
      else
      {
        objc_msgSend_setAddedEnergy_(v13, v23, 0);
      }
      objc_msgSend_addObject_(v11, v29, (uint64_t)v13);
    }
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    if (v37 == 33)
    {
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/app/data-model/DecodableList.h";
      retstr->mLine = 147;
    }
    else
    {
      *(_OWORD *)&retstr->mError = v37;
      *(void *)&retstr->mLine = v38;
      if (retstr->mError)
      {

        goto LABEL_25;
      }
    }
    objc_msgSend_setChargingTargets_(v7, v12, (uint64_t)v11);

    objc_msgSend_addObject_(v33, v30, (uint64_t)v7);
  }
  *(void *)&retstr->mError = 0;
  retstr->mFile = 0;
  *(void *)&retstr->mLine = 0;
  if (v43 == 33)
  {
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/app/data-model/DecodableList.h";
    retstr->mLine = 147;
LABEL_23:
    objc_msgSend_setChargingTargetSchedules_(self, v6, (uint64_t)v33);

    retstr->mError = 0;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 17676;
    return result;
  }
  *(_OWORD *)&retstr->mError = v43;
  *(void *)&retstr->mLine = v44;
  if (!retstr->mError) {
    goto LABEL_23;
  }
LABEL_25:

  return result;
}

@end