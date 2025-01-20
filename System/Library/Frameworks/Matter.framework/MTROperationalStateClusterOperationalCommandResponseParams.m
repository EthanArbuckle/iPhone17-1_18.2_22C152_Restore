@interface MTROperationalStateClusterOperationalCommandResponseParams
- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3;
- (MTROperationalStateClusterErrorStateStruct)commandResponseState;
- (MTROperationalStateClusterOperationalCommandResponseParams)init;
- (MTROperationalStateClusterOperationalCommandResponseParams)initWithResponseValue:(id)a3 error:(id *)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setCommandResponseState:(id)a3;
@end

@implementation MTROperationalStateClusterOperationalCommandResponseParams

- (MTROperationalStateClusterOperationalCommandResponseParams)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTROperationalStateClusterOperationalCommandResponseParams;
  v2 = [(MTROperationalStateClusterOperationalCommandResponseParams *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    commandResponseState = v2->_commandResponseState;
    v2->_commandResponseState = (MTROperationalStateClusterErrorStateStruct *)v3;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTROperationalStateClusterOperationalCommandResponseParams);
  v7 = objc_msgSend_commandResponseState(self, v5, v6);
  objc_msgSend_setCommandResponseState_(v4, v8, (uint64_t)v7);

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: commandResponseState:%@; >",
    v5,
  v7 = self->_commandResponseState);

  return v7;
}

- (MTROperationalStateClusterOperationalCommandResponseParams)initWithResponseValue:(id)a3 error:(id *)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v38.receiver = self;
  v38.super_class = (Class)MTROperationalStateClusterOperationalCommandResponseParams;
  v8 = [(MTROperationalStateClusterOperationalCommandResponseParams *)&v38 init];
  if (!v8)
  {
    v30 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 96, 4, a4);
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
      sub_24480FB18((uint64_t)&buf, (uint64_t)v36, (uint64_t)&v32);
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
    v10 = NSString;
    long long buf = v34;
    uint64_t v42 = v35;
    v11 = sub_244CB7B34((const char **)&buf, 1);
    v13 = objc_msgSend_stringWithFormat_(v10, v12, @"Command payload decoding failed: %s", v11);
    v14 = sub_244CC8484(0, "NotSpecified");
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
    if (a4)
    {
      uint64_t v39 = *MEMORY[0x263F08338];
      v24 = objc_msgSend_mainBundle(MEMORY[0x263F086E0], v19, v20);
      v26 = objc_msgSend_localizedStringForKey_value_table_(v24, v25, (uint64_t)v13, &stru_26F969DC8, 0);
      v40 = v26;
      v28 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v27, (uint64_t)&v40, &v39, 1);

      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v29, @"MTRErrorDomain", 13, v28);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v30 = 0;
LABEL_14:
  sub_244794634(&v37);
LABEL_16:

  return v30;
}

- (MTROperationalStateClusterErrorStateStruct)commandResponseState
{
  return self->_commandResponseState;
}

- (void)setCommandResponseState:(id)a3
{
}

- (void).cxx_destruct
{
}

- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3
{
  v7 = objc_opt_new();
  objc_msgSend_setCommandResponseState_(self, v8, (uint64_t)v7);

  v10 = objc_msgSend_numberWithUnsignedChar_(NSNumber, v9, *(unsigned __int8 *)a4);
  v13 = objc_msgSend_commandResponseState(self, v11, v12);
  objc_msgSend_setErrorStateID_(v13, v14, (uint64_t)v10);

  if (*((unsigned char *)a4 + 8))
  {
    uint64_t v17 = (uint64_t *)sub_2446D18A4((unsigned char *)a4 + 8);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    id v20 = [NSString alloc];
    v22 = objc_msgSend_initWithBytes_length_encoding_(v20, v21, v18, v19, 4);
    v25 = objc_msgSend_commandResponseState(self, v23, v24);
    objc_msgSend_setErrorStateLabel_(v25, v26, (uint64_t)v22);

    v29 = objc_msgSend_commandResponseState(self, v27, v28);
    long long v32 = objc_msgSend_errorStateLabel(v29, v30, v31);

    if (!v32)
    {
      v36 = &xmmword_2651940F8;
LABEL_8:
      *(_OWORD *)&retstr->mError = *v36;
      *(void *)&retstr->mLine = *((void *)v36 + 2);
      return result;
    }
  }
  else
  {
    v37 = objc_msgSend_commandResponseState(self, v15, v16);
    objc_msgSend_setErrorStateLabel_(v37, v38, 0);
  }
  int v40 = *((unsigned __int8 *)a4 + 32);
  uint64_t v39 = (char *)a4 + 32;
  if (v40)
  {
    v41 = (uint64_t *)sub_2446D18A4(v39);
    uint64_t v42 = *v41;
    uint64_t v43 = v41[1];
    id v44 = [NSString alloc];
    v46 = objc_msgSend_initWithBytes_length_encoding_(v44, v45, v42, v43, 4);
    v49 = objc_msgSend_commandResponseState(self, v47, v48);
    objc_msgSend_setErrorStateDetails_(v49, v50, (uint64_t)v46);

    v53 = objc_msgSend_commandResponseState(self, v51, v52);
    v56 = objc_msgSend_errorStateDetails(v53, v54, v55);

    if (!v56)
    {
      v36 = &xmmword_265194110;
      goto LABEL_8;
    }
  }
  else
  {
    v57 = objc_msgSend_commandResponseState(self, v34, v35);
    objc_msgSend_setErrorStateDetails_(v57, v58, 0);
  }
  retstr->mError = 0;
  retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-gene"
                  "rated/MTRCommandPayloadsObjc.mm";
  retstr->mLine = 13554;
  return result;
}

@end