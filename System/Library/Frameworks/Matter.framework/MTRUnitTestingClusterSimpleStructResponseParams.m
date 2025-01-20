@interface MTRUnitTestingClusterSimpleStructResponseParams
- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3;
- (MTRUnitTestingClusterSimpleStruct)arg1;
- (MTRUnitTestingClusterSimpleStructResponseParams)init;
- (MTRUnitTestingClusterSimpleStructResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error;
- (NSNumber)timedInvokeTimeoutMs;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setArg1:(MTRUnitTestingClusterSimpleStruct *)arg1;
- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs;
@end

@implementation MTRUnitTestingClusterSimpleStructResponseParams

- (MTRUnitTestingClusterSimpleStructResponseParams)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTRUnitTestingClusterSimpleStructResponseParams;
  v2 = [(MTRUnitTestingClusterSimpleStructResponseParams *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    arg1 = v2->_arg1;
    v2->_arg1 = (MTRUnitTestingClusterSimpleStruct *)v3;

    timedInvokeTimeoutMs = v2->_timedInvokeTimeoutMs;
    v2->_timedInvokeTimeoutMs = 0;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRUnitTestingClusterSimpleStructResponseParams);
  objc_super v7 = objc_msgSend_arg1(self, v5, v6);
  objc_msgSend_setArg1_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_timedInvokeTimeoutMs(self, v9, v10);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_super v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: arg1:%@ >", v5, self->_arg1);;

  return v7;
}

- (MTRUnitTestingClusterSimpleStructResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  uint64_t v6 = responseValue;
  v38.receiver = self;
  v38.super_class = (Class)MTRUnitTestingClusterSimpleStructResponseParams;
  v8 = [(MTRUnitTestingClusterSimpleStructResponseParams *)&v38 init];
  if (!v8)
  {
    v30 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 4294048773, 9, error);
  if (v37)
  {
    sub_244CB3988((uint64_t)v36);
    sub_244CB39B8((uint64_t)v36, *((void *)v37 + 1), *((void *)v37 + 3));
    long long v34 = 0uLL;
    uint64_t v35 = 0;
    sub_244CB54B4((uint64_t)v36, 256, &v34);
    if (!v34)
    {
      *(_WORD *)buf = 0;
      buf[2] = 0;
      int v44 = 0;
      uint64_t v45 = 0;
      char v46 = 0;
      *(_OWORD *)&buf[8] = 0u;
      long long v42 = 0u;
      char v43 = 0;
      sub_244846D24((uint64_t)buf, (uint64_t)v36, (uint64_t)&v32);
      long long v34 = v32;
      uint64_t v35 = v33;
      if (!v32)
      {
        objc_msgSend__setFieldsFromDecodableStruct_(v8, v9, (uint64_t)buf);
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
    *(_OWORD *)buf = v34;
    *(void *)&buf[16] = v35;
    v11 = sub_244CB7B34((const char **)buf, 1);
    v13 = objc_msgSend_stringWithFormat_(v10, v12, @"Command payload decoding failed: %s", v11);
    v14 = sub_244CC8484(0, "NotSpecified");
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

- (MTRUnitTestingClusterSimpleStruct)arg1
{
  return self->_arg1;
}

- (void)setArg1:(MTRUnitTestingClusterSimpleStruct *)arg1
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

  objc_storeStrong((id *)&self->_arg1, 0);
}

- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3
{
  objc_super v7 = objc_opt_new();
  objc_msgSend_setArg1_(self, v8, (uint64_t)v7);

  uint64_t v10 = objc_msgSend_numberWithUnsignedChar_(NSNumber, v9, *(unsigned __int8 *)a4);
  v13 = objc_msgSend_arg1(self, v11, v12);
  objc_msgSend_setA_(v13, v14, (uint64_t)v10);

  v16 = objc_msgSend_numberWithBool_(NSNumber, v15, *((unsigned __int8 *)a4 + 1));
  v19 = objc_msgSend_arg1(self, v17, v18);
  objc_msgSend_setB_(v19, v20, (uint64_t)v16);

  v22 = objc_msgSend_numberWithUnsignedChar_(NSNumber, v21, *((unsigned __int8 *)a4 + 2));
  v25 = objc_msgSend_arg1(self, v23, v24);
  objc_msgSend_setC_(v25, v26, (uint64_t)v22);

  v28 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v27, *((void *)a4 + 1), *((void *)a4 + 2));
  v31 = objc_msgSend_arg1(self, v29, v30);
  objc_msgSend_setD_(v31, v32, (uint64_t)v28);

  uint64_t v33 = *((void *)a4 + 3);
  uint64_t v34 = *((void *)a4 + 4);
  id v35 = [NSString alloc];
  v37 = objc_msgSend_initWithBytes_length_encoding_(v35, v36, v33, v34, 4);
  v40 = objc_msgSend_arg1(self, v38, v39);
  objc_msgSend_setE_(v40, v41, (uint64_t)v37);

  int v44 = objc_msgSend_arg1(self, v42, v43);
  uint64_t v47 = objc_msgSend_e(v44, v45, v46);

  if (v47)
  {
    v50 = objc_msgSend_numberWithUnsignedChar_(NSNumber, v49, *((unsigned __int8 *)a4 + 40));
    v53 = objc_msgSend_arg1(self, v51, v52);
    objc_msgSend_setF_(v53, v54, (uint64_t)v50);

    LODWORD(v55) = *((_DWORD *)a4 + 11);
    v58 = objc_msgSend_numberWithFloat_(NSNumber, v56, v57, v55);
    v61 = objc_msgSend_arg1(self, v59, v60);
    objc_msgSend_setG_(v61, v62, (uint64_t)v58);

    v65 = objc_msgSend_numberWithDouble_(NSNumber, v63, v64, *((double *)a4 + 6));
    v68 = objc_msgSend_arg1(self, v66, v67);
    objc_msgSend_setH_(v68, v69, (uint64_t)v65);

    int v73 = *((unsigned __int8 *)a4 + 56);
    v72 = (char *)a4 + 56;
    if (v73)
    {
      v74 = NSNumber;
      v75 = sub_2446F9190(v72);
      v77 = objc_msgSend_numberWithUnsignedChar_(v74, v76, *v75);
      v80 = objc_msgSend_arg1(self, v78, v79);
      objc_msgSend_setI_(v80, v81, (uint64_t)v77);
    }
    else
    {
      v77 = objc_msgSend_arg1(self, v70, v71);
      objc_msgSend_setI_(v77, v82, 0);
    }

    retstr->mError = 0;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 38177;
  }
  else
  {
    *(_OWORD *)&retstr->mError = xmmword_265194650;
    *(void *)&retstr->mLine = 38165;
  }
  return result;
}

@end