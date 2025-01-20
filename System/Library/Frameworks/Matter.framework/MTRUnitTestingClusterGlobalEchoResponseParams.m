@interface MTRUnitTestingClusterGlobalEchoResponseParams
- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3;
- (MTRDataTypeTestGlobalStruct)field1;
- (MTRUnitTestingClusterGlobalEchoResponseParams)init;
- (MTRUnitTestingClusterGlobalEchoResponseParams)initWithResponseValue:(id)a3 error:(id *)a4;
- (NSNumber)field2;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setField1:(id)a3;
- (void)setField2:(id)a3;
@end

@implementation MTRUnitTestingClusterGlobalEchoResponseParams

- (MTRUnitTestingClusterGlobalEchoResponseParams)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTRUnitTestingClusterGlobalEchoResponseParams;
  v2 = [(MTRUnitTestingClusterGlobalEchoResponseParams *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    field1 = v2->_field1;
    v2->_field1 = (MTRDataTypeTestGlobalStruct *)v3;

    field2 = v2->_field2;
    v2->_field2 = (NSNumber *)&unk_26F9C8548;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRUnitTestingClusterGlobalEchoResponseParams);
  objc_super v7 = objc_msgSend_field1(self, v5, v6);
  objc_msgSend_setField1_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_field2(self, v9, v10);
  objc_msgSend_setField2_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: field1:%@; field2:%@; >",
    v5,
    self->_field1,
  objc_super v7 = self->_field2);

  return v7;
}

- (MTRUnitTestingClusterGlobalEchoResponseParams)initWithResponseValue:(id)a3 error:(id *)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v38.receiver = self;
  v38.super_class = (Class)MTRUnitTestingClusterGlobalEchoResponseParams;
  v8 = [(MTRUnitTestingClusterGlobalEchoResponseParams *)&v38 init];
  if (!v8)
  {
    v30 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 4294048773, 14, a4);
  if (v37)
  {
    sub_244CB3988((uint64_t)v36);
    sub_244CB39B8((uint64_t)v36, *((void *)v37 + 1), *((void *)v37 + 3));
    long long v34 = 0uLL;
    uint64_t v35 = 0;
    sub_244CB54B4((uint64_t)v36, 256, &v34);
    if (!v34)
    {
      BYTE4(v42) = 0;
      char v43 = 0;
      long long buf = 0uLL;
      LOBYTE(v42) = 0;
      char v44 = 0;
      sub_244847874((uint64_t)&buf, (uint64_t)v36, (uint64_t)&v32);
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

- (MTRDataTypeTestGlobalStruct)field1
{
  return self->_field1;
}

- (void)setField1:(id)a3
{
}

- (NSNumber)field2
{
  return self->_field2;
}

- (void)setField2:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_field2, 0);

  objc_storeStrong((id *)&self->_field1, 0);
}

- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3
{
  objc_super v7 = objc_opt_new();
  objc_msgSend_setField1_(self, v8, (uint64_t)v7);

  uint64_t v9 = *(void *)a4;
  uint64_t v10 = *((void *)a4 + 1);
  id v11 = [NSString alloc];
  v13 = objc_msgSend_initWithBytes_length_encoding_(v11, v12, v9, v10, 4);
  v16 = objc_msgSend_field1(self, v14, v15);
  objc_msgSend_setName_(v16, v17, (uint64_t)v13);

  uint64_t v20 = objc_msgSend_field1(self, v18, v19);
  uint64_t v23 = objc_msgSend_name(v20, v21, v22);

  if (v23)
  {
    if (*((unsigned char *)a4 + 20))
    {
      v27 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v25, *((unsigned int *)a4 + 4));
      v30 = objc_msgSend_field1(self, v28, v29);
      objc_msgSend_setMyBitmap_(v30, v31, (uint64_t)v27);
    }
    else
    {
      v27 = objc_msgSend_field1(self, v25, v26);
      objc_msgSend_setMyBitmap_(v27, v32, 0);
    }

    if (*((unsigned char *)a4 + 24) && sub_2446F9190((unsigned char *)a4 + 24)[1])
    {
      uint64_t v35 = NSNumber;
      v36 = sub_2446F9190((unsigned char *)a4 + 24);
      if (!v36[1]) {
        sub_24479484C();
      }
      objc_super v38 = objc_msgSend_numberWithUnsignedChar_(v35, v37, *v36);
      v41 = objc_msgSend_field1(self, v39, v40);
      objc_msgSend_setMyEnum_(v41, v42, (uint64_t)v38);
    }
    else
    {
      objc_super v38 = objc_msgSend_field1(self, v33, v34);
      objc_msgSend_setMyEnum_(v38, v43, 0);
    }

    uint64_t v45 = objc_msgSend_numberWithUnsignedChar_(NSNumber, v44, *((unsigned __int8 *)a4 + 32));
    objc_msgSend_setField2_(self, v46, (uint64_t)v45);

    retstr->mError = 0;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 39335;
  }
  else
  {
    *(_OWORD *)&retstr->mError = xmmword_265194668;
    *(void *)&retstr->mLine = 39314;
  }
  return result;
}

@end