@interface MTROperationalCredentialsClusterAttestationResponseParams
- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3;
- (MTROperationalCredentialsClusterAttestationResponseParams)init;
- (MTROperationalCredentialsClusterAttestationResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error;
- (NSData)attestationChallenge;
- (NSData)attestationElements;
- (NSData)attestationSignature;
- (NSNumber)timedInvokeTimeoutMs;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setAttestationChallenge:(id)a3;
- (void)setAttestationElements:(NSData *)attestationElements;
- (void)setAttestationSignature:(NSData *)attestationSignature;
- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs;
@end

@implementation MTROperationalCredentialsClusterAttestationResponseParams

- (MTROperationalCredentialsClusterAttestationResponseParams)init
{
  v13.receiver = self;
  v13.super_class = (Class)MTROperationalCredentialsClusterAttestationResponseParams;
  v4 = [(MTROperationalCredentialsClusterAttestationResponseParams *)&v13 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend_data(MEMORY[0x263EFF8F8], v2, v3);
    attestationElements = v4->_attestationElements;
    v4->_attestationElements = (NSData *)v5;

    uint64_t v9 = objc_msgSend_data(MEMORY[0x263EFF8F8], v7, v8);
    attestationSignature = v4->_attestationSignature;
    v4->_attestationSignature = (NSData *)v9;

    timedInvokeTimeoutMs = v4->_timedInvokeTimeoutMs;
    v4->_timedInvokeTimeoutMs = 0;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTROperationalCredentialsClusterAttestationResponseParams);
  v7 = objc_msgSend_attestationElements(self, v5, v6);
  objc_msgSend_setAttestationElements_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_attestationSignature(self, v9, v10);
  objc_msgSend_setAttestationSignature_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_timedInvokeTimeoutMs(self, v13, v14);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v16, (uint64_t)v15);

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_base64EncodedStringWithOptions_(self->_attestationElements, v6, 0);
  uint64_t v9 = objc_msgSend_base64EncodedStringWithOptions_(self->_attestationSignature, v8, 0);
  objc_msgSend_stringWithFormat_(v3, v10, @"<%@: attestationElements:%@; attestationSignature:%@; >",
    v5,
    v7,
  v11 = v9);

  return v11;
}

- (MTROperationalCredentialsClusterAttestationResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  uint64_t v6 = responseValue;
  v79.receiver = self;
  v79.super_class = (Class)MTROperationalCredentialsClusterAttestationResponseParams;
  uint64_t v8 = [(MTROperationalCredentialsClusterAttestationResponseParams *)&v79 init];
  if (v8)
  {
    objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 62, 1, error);
    if (!v78)
    {
LABEL_37:
      v32 = 0;
LABEL_38:
      sub_244794634(&v78);
      goto LABEL_39;
    }
    sub_244CB3988((uint64_t)v77);
    sub_244CB39B8((uint64_t)v77, *((void *)v78 + 1), *((void *)v78 + 3));
    long long v75 = 0uLL;
    uint64_t v76 = 0;
    sub_244CB54B4((uint64_t)v77, 256, &v75);
    if (v75) {
      goto LABEL_30;
    }
    *(_OWORD *)buf = 0u;
    long long v84 = 0u;
    sub_244808548(buf, (uint64_t)v77, (uint64_t)&v73);
    long long v75 = v73;
    uint64_t v76 = v74;
    if (v73
      || (objc_msgSend__setFieldsFromDecodableStruct_(v8, v9, (uint64_t)buf), long long v75 = v73, v76 = v74, v73))
    {
LABEL_30:
      v33 = NSString;
      *(_OWORD *)buf = v75;
      *(void *)&long long v84 = v76;
      v34 = sub_244CB7B34((const char **)buf, 1);
      v36 = objc_msgSend_stringWithFormat_(v33, v35, @"Command payload decoding failed: %s", v34);
      v37 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        id v38 = v36;
        uint64_t v41 = objc_msgSend_UTF8String(v38, v39, v40);
        *(_DWORD *)buf = 136315138;
        *(void *)&buf[4] = v41;
        _os_log_impl(&dword_2446BD000, v37, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
      }

      if (sub_244CC4E58(1u))
      {
        id v44 = v36;
        objc_msgSend_UTF8String(v44, v45, v46);
        sub_244CC4DE0(0, 1);
      }
      if (error)
      {
        uint64_t v80 = *MEMORY[0x263F08338];
        v47 = objc_msgSend_mainBundle(MEMORY[0x263F086E0], v42, v43);
        v49 = objc_msgSend_localizedStringForKey_value_table_(v47, v48, (uint64_t)v36, &stru_26F969DC8, 0);
        v81 = v49;
        v51 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v50, (uint64_t)&v81, &v80, 1);

        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v52, @"MTRErrorDomain", 13, v51);
        *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_37;
    }
    v11 = objc_msgSend_objectForKeyedSubscript_(v6, v10, @"data");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      LODWORD(v75) = 47;
      *((void *)&v75 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/C"
                              "HIP/zap-generated/MTRCommandPayloadsObjc.mm";
      LODWORD(v76) = 8863;
      goto LABEL_29;
    }
    id v68 = v11;
    uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(v68, v12, @"type");
    if (v14)
    {
      v15 = objc_msgSend_objectForKeyedSubscript_(v68, v13, @"type");
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v17 = objc_msgSend_objectForKeyedSubscript_(v68, v16, @"type");
        char isEqualToString = objc_msgSend_isEqualToString_(v17, v18, @"Structure");

        if (isEqualToString)
        {
          v67 = objc_msgSend_objectForKeyedSubscript_(v68, v20, @"value");
          if (v67 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            long long v69 = 0u;
            long long v70 = 0u;
            long long v71 = 0u;
            long long v72 = 0u;
            id obj = v67;
            uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v21, (uint64_t)&v69, v82, 16);
            if (v22)
            {
              uint64_t v65 = *(void *)v70;
              while (2)
              {
                uint64_t v62 = v22;
                for (uint64_t i = 0; i != v62; ++i)
                {
                  if (*(void *)v70 != v65) {
                    objc_enumerationMutation(obj);
                  }
                  v24 = *(void **)(*((void *)&v69 + 1) + 8 * i);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    LODWORD(v75) = 47;
                    *((void *)&v75 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darw"
                                            "in/Framework/CHIP/zap-generated/MTRCommandPayloadsObjc.mm";
                    LODWORD(v76) = 8882;
                    goto LABEL_56;
                  }
                  id v25 = v24;
                  v27 = objc_msgSend_objectForKeyedSubscript_(v25, v26, @"contextTag");
                  if (!v27 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                  {
                    LODWORD(v75) = 47;
                    *((void *)&v75 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darw"
                                            "in/Framework/CHIP/zap-generated/MTRCommandPayloadsObjc.mm";
                    LODWORD(v76) = 8889;

                    goto LABEL_56;
                  }
                  id v28 = v27;
                  if (objc_msgSend_isEqualToNumber_(v28, v29, (uint64_t)&unk_26F9C8560))
                  {
                    v54 = objc_msgSend_objectForKeyedSubscript_(v25, v30, @"data");
                    if (v54 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      id v55 = v54;
                      v66 = objc_msgSend_objectForKeyedSubscript_(v55, v56, @"type");
                      uint64_t v58 = objc_msgSend_objectForKeyedSubscript_(v55, v57, @"value");
                      v59 = (void *)v58;
                      if (v66
                        && v58
                        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
                        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        id v63 = v66;
                        if (objc_msgSend_isEqualToString_(v63, v60, @"OctetString"))
                        {
                          objc_msgSend_setAttestationChallenge_(v8, v61, (uint64_t)v59);
                        }
                        else
                        {
                          LODWORD(v75) = 47;
                          *((void *)&v75 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/sr"
                                                  "c/darwin/Framework/CHIP/zap-generated/MTRCommandPayloadsObjc.mm";
                          LODWORD(v76) = 8915;
                        }
                      }
                      else
                      {
                        LODWORD(v75) = 47;
                        *((void *)&v75 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/"
                                                "darwin/Framework/CHIP/zap-generated/MTRCommandPayloadsObjc.mm";
                        LODWORD(v76) = 8909;
                      }
                    }
                    else
                    {
                      LODWORD(v75) = 47;
                      *((void *)&v75 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/da"
                                              "rwin/Framework/CHIP/zap-generated/MTRCommandPayloadsObjc.mm";
                      LODWORD(v76) = 8901;
                    }

                    goto LABEL_56;
                  }
                }
                uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v31, (uint64_t)&v69, v82, 16);
                if (v22) {
                  continue;
                }
                break;
              }
            }
LABEL_56:
          }
          else
          {
            LODWORD(v75) = 47;
            *((void *)&v75 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Frame"
                                    "work/CHIP/zap-generated/MTRCommandPayloadsObjc.mm";
            LODWORD(v76) = 8875;
          }

          goto LABEL_28;
        }
      }
      else
      {
      }
    }
    LODWORD(v75) = 47;
    *((void *)&v75 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHI"
                            "P/zap-generated/MTRCommandPayloadsObjc.mm";
    LODWORD(v76) = 8869;
LABEL_28:

LABEL_29:
    if (!v75)
    {
      v32 = v8;
      goto LABEL_38;
    }
    goto LABEL_30;
  }
  v32 = 0;
LABEL_39:

  return v32;
}

- (NSData)attestationElements
{
  return self->_attestationElements;
}

- (void)setAttestationElements:(NSData *)attestationElements
{
}

- (NSData)attestationSignature
{
  return self->_attestationSignature;
}

- (void)setAttestationSignature:(NSData *)attestationSignature
{
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs
{
}

- (NSData)attestationChallenge
{
  return self->_attestationChallenge;
}

- (void)setAttestationChallenge:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attestationChallenge, 0);
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_attestationSignature, 0);

  objc_storeStrong((id *)&self->_attestationElements, 0);
}

- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3
{
  v7 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], a3, *(void *)a4, *((void *)a4 + 1));
  objc_msgSend_setAttestationElements_(self, v8, (uint64_t)v7);

  uint64_t v10 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v9, *((void *)a4 + 2), *((void *)a4 + 3));
  objc_msgSend_setAttestationSignature_(self, v11, (uint64_t)v10);

  retstr->mError = 0;
  retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-gene"
                  "rated/MTRCommandPayloadsObjc.mm";
  retstr->mLine = 8953;
  return result;
}

@end