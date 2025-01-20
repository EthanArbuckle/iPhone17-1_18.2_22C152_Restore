@interface MTRNetworkCommissioningClusterScanNetworksResponseParams
- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3;
- (MTRNetworkCommissioningClusterScanNetworksResponseParams)init;
- (MTRNetworkCommissioningClusterScanNetworksResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error;
- (NSArray)threadScanResults;
- (NSArray)wiFiScanResults;
- (NSNumber)networkingStatus;
- (NSNumber)timedInvokeTimeoutMs;
- (NSString)debugText;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setDebugText:(NSString *)debugText;
- (void)setNetworkingStatus:(NSNumber *)networkingStatus;
- (void)setThreadScanResults:(NSArray *)threadScanResults;
- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs;
- (void)setWiFiScanResults:(NSArray *)wiFiScanResults;
@end

@implementation MTRNetworkCommissioningClusterScanNetworksResponseParams

- (MTRNetworkCommissioningClusterScanNetworksResponseParams)init
{
  v10.receiver = self;
  v10.super_class = (Class)MTRNetworkCommissioningClusterScanNetworksResponseParams;
  v2 = [(MTRNetworkCommissioningClusterScanNetworksResponseParams *)&v10 init];
  v3 = v2;
  if (v2)
  {
    networkingStatus = v2->_networkingStatus;
    v2->_networkingStatus = (NSNumber *)&unk_26F9C8548;

    debugText = v3->_debugText;
    v3->_debugText = 0;

    wiFiScanResults = v3->_wiFiScanResults;
    v3->_wiFiScanResults = 0;

    threadScanResults = v3->_threadScanResults;
    v3->_threadScanResults = 0;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRNetworkCommissioningClusterScanNetworksResponseParams);
  v7 = objc_msgSend_networkingStatus(self, v5, v6);
  objc_msgSend_setNetworkingStatus_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_debugText(self, v9, v10);
  objc_msgSend_setDebugText_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_wiFiScanResults(self, v13, v14);
  objc_msgSend_setWiFiScanResults_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_threadScanResults(self, v17, v18);
  objc_msgSend_setThreadScanResults_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_timedInvokeTimeoutMs(self, v21, v22);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v24, (uint64_t)v23);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: networkingStatus:%@; debugText:%@; wiFiScanResults:%@; threadScanResults:%@; >",
    v5,
    self->_networkingStatus,
    self->_debugText,
    self->_wiFiScanResults,
  v7 = self->_threadScanResults);

  return v7;
}

- (MTRNetworkCommissioningClusterScanNetworksResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  uint64_t v6 = responseValue;
  v38.receiver = self;
  v38.super_class = (Class)MTRNetworkCommissioningClusterScanNetworksResponseParams;
  v8 = [(MTRNetworkCommissioningClusterScanNetworksResponseParams *)&v38 init];
  if (!v8)
  {
    v30 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 49, 1, error);
  if (v37)
  {
    sub_244CB3988((uint64_t)v36);
    sub_244CB39B8((uint64_t)v36, *((void *)v37 + 1), *((void *)v37 + 3));
    long long v34 = 0uLL;
    uint64_t v35 = 0;
    sub_244CB54B4((uint64_t)v36, 256, &v34);
    if (!v34)
    {
      LOBYTE(buf) = 0;
      BYTE8(buf) = 0;
      char v43 = 0;
      char v44 = 0;
      sub_2447FE5C0((uint64_t)&buf, (uint64_t)v36, (uint64_t)&v32);
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
    v11 = sub_244CB7B34((const char **)&buf, 1);
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
      v26 = objc_msgSend_localizedStringForKey_value_table_(v24, v25, (uint64_t)v13, &stru_26F969DC8, 0);
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

- (NSNumber)networkingStatus
{
  return self->_networkingStatus;
}

- (void)setNetworkingStatus:(NSNumber *)networkingStatus
{
}

- (NSString)debugText
{
  return self->_debugText;
}

- (void)setDebugText:(NSString *)debugText
{
}

- (NSArray)wiFiScanResults
{
  return self->_wiFiScanResults;
}

- (void)setWiFiScanResults:(NSArray *)wiFiScanResults
{
}

- (NSArray)threadScanResults
{
  return self->_threadScanResults;
}

- (void)setThreadScanResults:(NSArray *)threadScanResults
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
  objc_storeStrong((id *)&self->_threadScanResults, 0);
  objc_storeStrong((id *)&self->_wiFiScanResults, 0);
  objc_storeStrong((id *)&self->_debugText, 0);

  objc_storeStrong((id *)&self->_networkingStatus, 0);
}

- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3
{
  v7 = objc_msgSend_numberWithUnsignedChar_(NSNumber, a3, *(unsigned __int8 *)a4);
  objc_msgSend_setNetworkingStatus_(self, v8, (uint64_t)v7);

  if (*((unsigned char *)a4 + 8))
  {
    uint64_t v10 = (uint64_t *)sub_2446D18A4((unsigned char *)a4 + 8);
    uint64_t v11 = *v10;
    uint64_t v12 = v10[1];
    id v13 = [NSString alloc];
    id v15 = objc_msgSend_initWithBytes_length_encoding_(v13, v14, v11, v12, 4);
    objc_msgSend_setDebugText_(self, v16, (uint64_t)v15);

    v19 = objc_msgSend_debugText(self, v17, v18);

    if (!v19)
    {
      *(_OWORD *)&retstr->mError = xmmword_265193FC0;
      *(void *)&retstr->mLine = 5915;
      return result;
    }
  }
  else
  {
    objc_msgSend_setDebugText_(self, v9, 0);
  }
  if (*((unsigned char *)a4 + 32))
  {
    uint64_t v22 = objc_opt_new();
    uint64_t v23 = sub_2446F7170((unsigned char *)a4 + 32);
    unsigned __int8 v91 = v23[72];
    if (v91) {
      char v92 = v23[73];
    }
    sub_244794DDC((uint64_t)&v82, (uint64_t)v23, &v91);
    while (sub_244794E60((uint64_t)&v82))
    {
      v25 = objc_opt_new();
      v27 = objc_msgSend_numberWithUnsignedChar_(NSNumber, v26, v82);
      objc_msgSend_setSecurity_(v25, v28, (uint64_t)v27);

      v30 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v29, v83, v84);
      objc_msgSend_setSsid_(v25, v31, (uint64_t)v30);

      uint64_t v33 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v32, v85, v86);
      objc_msgSend_setBssid_(v25, v34, (uint64_t)v33);

      v36 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v35, (unsigned __int16)v87);
      objc_msgSend_setChannel_(v25, v37, (uint64_t)v36);

      uint64_t v39 = objc_msgSend_numberWithUnsignedChar_(NSNumber, v38, BYTE2(v87));
      objc_msgSend_setWiFiBand_(v25, v40, (uint64_t)v39);

      uint64_t v42 = objc_msgSend_numberWithChar_(NSNumber, v41, SBYTE3(v87));
      objc_msgSend_setRssi_(v25, v43, (uint64_t)v42);

      objc_msgSend_addObject_(v22, v44, (uint64_t)v25);
    }
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    if (v88 == 33)
    {
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/app/data-model/DecodableList.h";
      retstr->mLine = 147;
    }
    else
    {
      *(_OWORD *)&retstr->mError = v88;
      *(void *)&retstr->mLine = v89;
      if (retstr->mError) {
        goto LABEL_28;
      }
    }
    objc_msgSend_setWiFiScanResults_(self, v24, (uint64_t)v22);
  }
  else
  {
    objc_msgSend_setWiFiScanResults_(self, v21, 0);
  }
  int v47 = *((unsigned __int8 *)a4 + 120);
  v46 = (char *)a4 + 120;
  if (v47)
  {
    uint64_t v22 = objc_opt_new();
    v48 = sub_2446F7170(v46);
    unsigned __int8 v91 = v48[72];
    if (v91) {
      char v92 = v48[73];
    }
    sub_244794F10((uint64_t)&v82, (uint64_t)v48, &v91);
    while (sub_244794F98((uint64_t)&v82))
    {
      v50 = objc_opt_new();
      v52 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v51, v82);
      objc_msgSend_setPanId_(v50, v53, (uint64_t)v52);

      v55 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v54, v83);
      objc_msgSend_setExtendedPanId_(v50, v56, (uint64_t)v55);

      uint64_t v57 = v84;
      uint64_t v58 = v85;
      id v59 = [NSString alloc];
      v61 = objc_msgSend_initWithBytes_length_encoding_(v59, v60, v57, v58, 4);
      objc_msgSend_setNetworkName_(v50, v62, (uint64_t)v61);

      v65 = objc_msgSend_networkName(v50, v63, v64);

      if (!v65)
      {
        *(_OWORD *)&retstr->mError = xmmword_265193FD8;
        *(void *)&retstr->mLine = 5962;

        goto LABEL_28;
      }
      v67 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v66, (unsigned __int16)v86);
      objc_msgSend_setChannel_(v50, v68, (uint64_t)v67);

      v70 = objc_msgSend_numberWithUnsignedChar_(NSNumber, v69, BYTE2(v86));
      objc_msgSend_setVersion_(v50, v71, (uint64_t)v70);

      v73 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v72, v87, (void)v88);
      objc_msgSend_setExtendedAddress_(v50, v74, (uint64_t)v73);

      v76 = objc_msgSend_numberWithChar_(NSNumber, v75, SBYTE8(v88));
      objc_msgSend_setRssi_(v50, v77, (uint64_t)v76);

      v79 = objc_msgSend_numberWithUnsignedChar_(NSNumber, v78, BYTE9(v88));
      objc_msgSend_setLqi_(v50, v80, (uint64_t)v79);

      objc_msgSend_addObject_(v22, v81, (uint64_t)v50);
    }
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    if (v89 == 33)
    {
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/app/data-model/DecodableList.h";
      retstr->mLine = 147;
LABEL_29:
      objc_msgSend_setThreadScanResults_(self, v49, (uint64_t)v22);

      goto LABEL_30;
    }
    *(_OWORD *)&retstr->mError = v89;
    *(void *)&retstr->mLine = v90;
    if (!retstr->mError) {
      goto LABEL_29;
    }
LABEL_28:

    return result;
  }
  result = (ChipError *)objc_msgSend_setThreadScanResults_(self, v45, 0);
LABEL_30:
  retstr->mError = 0;
  retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-gene"
                  "rated/MTRCommandPayloadsObjc.mm";
  retstr->mLine = 5982;
  return result;
}

@end