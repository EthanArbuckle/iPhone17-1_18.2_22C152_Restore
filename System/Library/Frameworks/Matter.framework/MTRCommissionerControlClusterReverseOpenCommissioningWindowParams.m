@interface MTRCommissionerControlClusterReverseOpenCommissioningWindowParams
- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3;
- (MTRCommissionerControlClusterReverseOpenCommissioningWindowParams)init;
- (MTRCommissionerControlClusterReverseOpenCommissioningWindowParams)initWithResponseValue:(id)a3 error:(id *)a4;
- (NSData)pakePasscodeVerifier;
- (NSData)salt;
- (NSNumber)commissioningTimeout;
- (NSNumber)discriminator;
- (NSNumber)iterations;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setCommissioningTimeout:(id)a3;
- (void)setDiscriminator:(id)a3;
- (void)setIterations:(id)a3;
- (void)setPakePasscodeVerifier:(id)a3;
- (void)setSalt:(id)a3;
@end

@implementation MTRCommissionerControlClusterReverseOpenCommissioningWindowParams

- (MTRCommissionerControlClusterReverseOpenCommissioningWindowParams)init
{
  v16.receiver = self;
  v16.super_class = (Class)MTRCommissionerControlClusterReverseOpenCommissioningWindowParams;
  v2 = [(MTRCommissionerControlClusterReverseOpenCommissioningWindowParams *)&v16 init];
  v3 = v2;
  if (v2)
  {
    commissioningTimeout = v2->_commissioningTimeout;
    v2->_commissioningTimeout = (NSNumber *)&unk_26F9C8548;

    uint64_t v7 = objc_msgSend_data(MEMORY[0x263EFF8F8], v5, v6);
    pakePasscodeVerifier = v3->_pakePasscodeVerifier;
    v3->_pakePasscodeVerifier = (NSData *)v7;

    discriminator = v3->_discriminator;
    v3->_discriminator = (NSNumber *)&unk_26F9C8548;

    iterations = v3->_iterations;
    v3->_iterations = (NSNumber *)&unk_26F9C8548;

    uint64_t v13 = objc_msgSend_data(MEMORY[0x263EFF8F8], v11, v12);
    salt = v3->_salt;
    v3->_salt = (NSData *)v13;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRCommissionerControlClusterReverseOpenCommissioningWindowParams);
  uint64_t v7 = objc_msgSend_commissioningTimeout(self, v5, v6);
  objc_msgSend_setCommissioningTimeout_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_pakePasscodeVerifier(self, v9, v10);
  objc_msgSend_setPakePasscodeVerifier_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_discriminator(self, v13, v14);
  objc_msgSend_setDiscriminator_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_iterations(self, v17, v18);
  objc_msgSend_setIterations_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_salt(self, v21, v22);
  objc_msgSend_setSalt_(v4, v24, (uint64_t)v23);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  commissioningTimeout = self->_commissioningTimeout;
  v8 = objc_msgSend_base64EncodedStringWithOptions_(self->_pakePasscodeVerifier, v7, 0);
  discriminator = self->_discriminator;
  iterations = self->_iterations;
  uint64_t v12 = objc_msgSend_base64EncodedStringWithOptions_(self->_salt, v11, 0);
  objc_msgSend_stringWithFormat_(v3, v13, @"<%@: commissioningTimeout:%@; pakePasscodeVerifier:%@; discriminator:%@; iterations:%@; salt:%@; >",
    v5,
    commissioningTimeout,
    v8,
    discriminator,
    iterations,
  uint64_t v14 = v12);

  return v14;
}

- (MTRCommissionerControlClusterReverseOpenCommissioningWindowParams)initWithResponseValue:(id)a3 error:(id *)a4
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v38.receiver = self;
  v38.super_class = (Class)MTRCommissionerControlClusterReverseOpenCommissioningWindowParams;
  v8 = [(MTRCommissionerControlClusterReverseOpenCommissioningWindowParams *)&v38 init];
  if (!v8)
  {
    v30 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 1873, 2, a4);
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
      *((void *)&buf + 1) = 0;
      uint64_t v42 = 0;
      __int16 v43 = 0;
      uint64_t v45 = 0;
      uint64_t v44 = 0;
      int v46 = 0;
      sub_244842BD8((uint64_t)&buf, (uint64_t)v36, (uint64_t)&v32);
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
    uint64_t v13 = objc_msgSend_stringWithFormat_(v10, v12, @"Command payload decoding failed: %s", v11);
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

- (NSNumber)commissioningTimeout
{
  return self->_commissioningTimeout;
}

- (void)setCommissioningTimeout:(id)a3
{
}

- (NSData)pakePasscodeVerifier
{
  return self->_pakePasscodeVerifier;
}

- (void)setPakePasscodeVerifier:(id)a3
{
}

- (NSNumber)discriminator
{
  return self->_discriminator;
}

- (void)setDiscriminator:(id)a3
{
}

- (NSNumber)iterations
{
  return self->_iterations;
}

- (void)setIterations:(id)a3
{
}

- (NSData)salt
{
  return self->_salt;
}

- (void)setSalt:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_salt, 0);
  objc_storeStrong((id *)&self->_iterations, 0);
  objc_storeStrong((id *)&self->_discriminator, 0);
  objc_storeStrong((id *)&self->_pakePasscodeVerifier, 0);

  objc_storeStrong((id *)&self->_commissioningTimeout, 0);
}

- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3
{
  uint64_t v7 = objc_msgSend_numberWithUnsignedShort_(NSNumber, a3, *(unsigned __int16 *)a4);
  objc_msgSend_setCommissioningTimeout_(self, v8, (uint64_t)v7);

  uint64_t v10 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v9, *((void *)a4 + 1), *((void *)a4 + 2));
  objc_msgSend_setPakePasscodeVerifier_(self, v11, (uint64_t)v10);

  uint64_t v13 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v12, *((unsigned __int16 *)a4 + 12));
  objc_msgSend_setDiscriminator_(self, v14, (uint64_t)v13);

  objc_super v16 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v15, *((unsigned int *)a4 + 7));
  objc_msgSend_setIterations_(self, v17, (uint64_t)v16);

  v19 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v18, *((void *)a4 + 4), *((void *)a4 + 5));
  objc_msgSend_setSalt_(self, v20, (uint64_t)v19);

  retstr->mError = 0;
  retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-gene"
                  "rated/MTRCommandPayloadsObjc.mm";
  retstr->mLine = 35538;
  return result;
}

@end