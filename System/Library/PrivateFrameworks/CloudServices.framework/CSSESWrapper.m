@interface CSSESWrapper
- (AppleIDPasswordMetadata)appleIDPasswordMetadata;
- (BOOL)recoveryPassphraseMutable;
- (BOOL)useAppleIDPassword;
- (BOOL)validatePassphrasePresentOrPending;
- (CSSESWrapper)initWithDSID:(id)a3 escrowRecordContents:(id)a4 recoveryPassphrase:(id)a5 recordID:(id)a6 recordLabel:(id)a7 useAppleIDPassword:(BOOL)a8 appleIDPasswordMetadata:(id)a9 reqVersion:(int)a10;
- (CSSESWrapper)initWithRequest:(id)a3 reqVersion:(int)a4;
- (CSSESWrapper)initWithRequest:(id)a3 validate:(BOOL)a4 reqVersion:(int)a5;
- (NSData)escrowBlob;
- (NSData)recoveryBlob;
- (NSDate)escrowDate;
- (NSDictionary)escrowRecord;
- (NSString)decodedLabel;
- (NSString)dsid;
- (NSString)label;
- (NSString)recordID;
- (NSString)recoveryPassphrase;
- (ckvr_srp_context)ckvr;
- (id)decodedEscrowRecordFromData:(id)a3 stingray:(BOOL)a4 env:(id)a5 duplicate:(BOOL)a6 error:(id *)a7;
- (id)derivePassword;
- (id)derivePasswordGuitarfish;
- (id)encodedEscrowRecordWithPublicKey:(__SecKey *)a3 error:(id *)a4;
- (id)encodedEscrowRecordWithPublicKeyBytes:(id)a3 error:(id *)a4;
- (id)recoveryResponseForBlob:(id)a3;
- (id)srpInitBlob;
- (id)srpRecoveryBlobFromData:(id)a3 error:(id *)a4;
- (id)srpResponseForEscrowBlob:(id)a3 withFullCCKey:(ccrsa_full_ctx *)a4;
- (int)reqVersion;
- (unint64_t)srpKeySize;
- (unint64_t)srpPublicKeySize;
- (void)dealloc;
- (void)setAppleIDPasswordMetadata:(id)a3;
- (void)setDecodedLabel:(id)a3;
- (void)setDsid:(id)a3;
- (void)setEscrowBlob:(id)a3;
- (void)setEscrowDate:(id)a3;
- (void)setRecoveryBlob:(id)a3;
- (void)setRecoveryPassphrase:(id)a3;
- (void)setRecoveryPassphraseMutable:(BOOL)a3;
- (void)setReqVersion:(int)a3;
- (void)srpRecoveryUpdateDSID:(id)a3 recoveryPassphrase:(id)a4;
@end

@implementation CSSESWrapper

- (CSSESWrapper)initWithRequest:(id)a3 reqVersion:(int)a4
{
  return (CSSESWrapper *)MEMORY[0x270F9A6D0](self, sel_initWithRequest_validate_reqVersion_, a3);
}

- (CSSESWrapper)initWithRequest:(id)a3 validate:(BOOL)a4 reqVersion:(int)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v11 = v8;
  if (v6 && (objc_msgSend_validateInput(v8, v9, v10), (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v13 = (void *)v12;
    v14 = CloudServicesLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_21813EFC8();
    }

    v15 = 0;
  }
  else
  {
    v16 = objc_msgSend_dsid(v11, v9, v10);
    v19 = objc_msgSend_escrowRecord(v11, v17, v18);
    v22 = objc_msgSend_recoveryPassphrase(v11, v20, v21);
    v25 = objc_msgSend_recordID(v11, v23, v24);
    v28 = objc_msgSend_recordLabel(v11, v26, v27);
    if (objc_msgSend_guitarfish(v11, v29, v30)) {
      uint64_t v33 = objc_msgSend_guitarfishToken(v11, v31, v32) ^ 1;
    }
    else {
      uint64_t v33 = 0;
    }
    v34 = objc_msgSend_appleIDPasswordMetadata(v11, v31, v32);
    int v37 = a5;
    self = (CSSESWrapper *)(id)objc_msgSend_initWithDSID_escrowRecordContents_recoveryPassphrase_recordID_recordLabel_useAppleIDPassword_appleIDPasswordMetadata_reqVersion_(self, v35, (uint64_t)v16, v19, v22, v25, v28, v33, v34, v37);

    v15 = self;
  }

  return v15;
}

- (CSSESWrapper)initWithDSID:(id)a3 escrowRecordContents:(id)a4 recoveryPassphrase:(id)a5 recordID:(id)a6 recordLabel:(id)a7 useAppleIDPassword:(BOOL)a8 appleIDPasswordMetadata:(id)a9 reqVersion:(int)a10
{
  id v16 = a3;
  id v30 = a4;
  id v17 = a5;
  id v29 = a6;
  id v18 = a7;
  id v28 = a9;
  if (((objc_msgSend_isEqualToString_(v18, v19, @"com.apple.protectedcloudstorage.record") & 1) != 0
     || objc_msgSend_isEqualToString_(v18, v20, @"com.apple.protectedcloudstorage.record.double"))&& (objc_msgSend_isEqualToString_(v17, v20, (uint64_t)v16) & 1) == 0)
  {
    sub_21813EEDC();
  }
  v31.receiver = self;
  v31.super_class = (Class)CSSESWrapper;
  uint64_t v21 = [(CSSESWrapper *)&v31 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_dsid, a3);
    objc_storeStrong((id *)&v22->_escrowRecord, a4);
    objc_storeStrong((id *)&v22->_recoveryPassphrase, a5);
    objc_storeStrong((id *)&v22->_recordID, a6);
    objc_storeStrong((id *)&v22->_label, a7);
    if (!v22->_dsid && !v22->_recoveryPassphrase) {
      v22->_recoveryPassphraseMutable = 1;
    }
    v22->_reqVersion = a10;
    v23 = (uint64_t *)malloc_type_malloc(0x38uLL, 0x6004031944618uLL);
    v22->_ckvr = (ckvr_srp_context *)v23;
    sub_2181318F4(v23);
    objc_msgSend_setReqVersion_(v22, v24, a10);
    v22->_useAppleIDPassword = a8;
    objc_storeStrong((id *)&v22->_appleIDPasswordMetadata, a9);
    v25 = v22;
  }

  return v22;
}

- (id)derivePasswordGuitarfish
{
  v4 = objc_msgSend_appleIDPasswordMetadata(self, a2, v2);

  if (v4)
  {
    ccsha256_di();
    v7 = objc_msgSend_appleIDPasswordMetadata(self, v5, v6);
    uint64_t v10 = objc_msgSend_proto(v7, v8, v9);
    objc_msgSend_isEqualToString_(v10, v11, *MEMORY[0x263F26D20]);

    v14 = objc_msgSend_recoveryPassphrase(self, v12, v13);
    id v17 = objc_msgSend_appleIDPasswordMetadata(self, v15, v16);
    v20 = objc_msgSend_salt(v17, v18, v19);
    uint64_t v21 = NSNumber;
    uint64_t v24 = objc_msgSend_appleIDPasswordMetadata(self, v22, v23);
    uint64_t v27 = objc_msgSend_iterations(v24, v25, v26);
    objc_msgSend_numberWithInt_(v21, v28, v27);
    id v29 = (void *)AppleIDAuthSupportPBKDF2SRP();

    if (!v29)
    {
      id v30 = CloudServicesLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        sub_21813F064();
      }
    }
  }
  else
  {
    objc_super v31 = CloudServicesLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      sub_21813F030();
    }

    id v29 = 0;
  }

  return v29;
}

- (id)derivePassword
{
  if (objc_msgSend_useAppleIDPassword(self, a2, v2))
  {
    uint64_t v6 = objc_msgSend_derivePasswordGuitarfish(self, v4, v5);
  }
  else
  {
    v7 = objc_msgSend_recoveryPassphrase(self, v4, v5);
    uint64_t v6 = objc_msgSend_dataUsingEncoding_(v7, v8, 4);
  }

  return v6;
}

- (void)setReqVersion:(int)a3
{
  self->_reqVersion = a3;
  p_reqVersion = &self->_reqVersion;
  if (a3 >= 3)
  {
    uint64_t v6 = p_reqVersion;
    v4 = CloudServicesLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_21813F0CC(v6, v4, v5);
    }

    abort();
  }
}

- (id)srpInitBlob
{
  v14[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend_ckvr(self, a2, v2);
  size_t v7 = sub_218131A4C(v4);
  unint64_t v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v9 = (char *)v14 - v8;
  if (v7) {
    memset((char *)v14 - v8, 170, v7);
  }
  uint64_t v10 = objc_msgSend_ckvr(self, v5, v6);
  sub_218131A7C(v10, (uint64_t)v9, v7);
  uint64_t v12 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v11, (uint64_t)v9, v7);

  return v12;
}

- (unint64_t)srpKeySize
{
  objc_msgSend_ckvr(self, a2, v2);

  return sub_218131AD8();
}

- (unint64_t)srpPublicKeySize
{
  uint64_t v3 = objc_msgSend_ckvr(self, a2, v2);

  return sub_218131A4C(v3);
}

- (void)srpRecoveryUpdateDSID:(id)a3 recoveryPassphrase:(id)a4
{
  uint64_t v6 = (NSString *)a3;
  size_t v7 = (NSString *)a4;
  if (!self->_recoveryPassphraseMutable) {
    abort();
  }
  unint64_t v8 = v7;
  self->_recoveryPassphraseMutable = 0;
  dsid = self->_dsid;
  self->_dsid = v6;
  v11 = v6;

  recoveryPassphrase = self->_recoveryPassphrase;
  self->_recoveryPassphrase = v8;
}

- (BOOL)validatePassphrasePresentOrPending
{
  if (objc_msgSend_recoveryPassphraseMutable(self, a2, v2)) {
    return 1;
  }
  size_t v7 = objc_msgSend_recoveryPassphrase(self, v4, v5);
  BOOL v6 = v7 != 0;

  return v6;
}

- (id)srpRecoveryBlobFromData:(id)a3 error:(id *)a4
{
  v158[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  self->_recoveryPassphraseMutable = 0;
  if ((unint64_t)objc_msgSend_length(v6, v7, v8) >> 32)
  {
    CloudServicesLog();
    v11 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR)) {
      sub_21813F140(v6, v11, v12);
    }

    if (a4)
    {
      uint64_t v15 = objc_msgSend_length(v6, v13, v14);
      objc_msgSend_errorWithDomain_code_format_(CloudServicesError, v16, @"EscrowServiceErrorDomain", 102, @"srp recovery blob too large: %lu bytes", v15);
      id v17 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v17 = 0;
    }
    goto LABEL_76;
  }
  size_t v18 = objc_msgSend_length(v6, v9, v10);
  unint64_t v19 = (v18 + 15) & 0xFFFFFFFFFFFFFFF0;
  v20 = (char *)&v147 - v19;
  if (v18) {
    memset((char *)&v147 - v19, 170, v18);
  }
  id v21 = v6;
  uint64_t v24 = (const void *)objc_msgSend_bytes(v21, v22, v23);
  size_t v27 = objc_msgSend_length(v21, v25, v26);
  memcpy(v20, v24, v27);
  unint64_t v30 = objc_msgSend_length(v21, v28, v29);
  if (sub_2181357C0(v30, (uint64_t)v20))
  {
    uint64_t v33 = (void *)MEMORY[0x263EFF8F8];
    uint64_t v34 = objc_msgSend_length(v21, v31, v32);
    v36 = objc_msgSend_dataWithBytes_length_(v33, v35, (uint64_t)v20, v34);
    v39 = v36;
    if (v36)
    {
      unint64_t v40 = objc_msgSend_length(v36, v37, v38);
      id v41 = v39;
      v44 = (_DWORD *)objc_msgSend_bytes(v41, v42, v43);
      uint64_t v152 = -1;
      uint64_t v47 = objc_msgSend_ckvr(self, v45, v46);
      uint64_t v152 = sub_218135050(v47, (uint64_t)v44);
      objc_msgSend_dataWithLength_(MEMORY[0x263EFF990], v48, v152);
      id v150 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_useAppleIDPassword(self, v49, v50))
      {
        v149 = &unk_21814465E;
LABEL_21:
        v59 = objc_msgSend_recoveryPassphrase(self, v51, v52);
        BOOL v60 = v59 == 0;

        if (!v60)
        {
          if (objc_msgSend_useAppleIDPassword(self, v61, v62))
          {
            size_t v65 = sub_2181321D4(v40, v44);
            if ((v65 & 0x8000000000000000) != 0)
            {
              v80 = objc_msgSend_errorWithDomain_code_format_(CloudServicesError, v66, @"EscrowServiceErrorDomain", 102, @"Failed to get salt from SRP response");
              v81 = CloudServicesLog();
              if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR)) {
                sub_21813F230();
              }

              if (a4) {
                *a4 = v80;
              }

              goto LABEL_49;
            }
            v158[0] = v65;
            objc_msgSend_dataWithLength_(MEMORY[0x263EFF990], v66, v65);
            id v67 = objc_claimAutoreleasedReturnValue();
            v70 = objc_msgSend_mutableBytes(v67, v68, v69);
            if (sub_218132268(v40, v44, v158, v70))
            {
              v72 = objc_msgSend_errorWithDomain_code_format_(CloudServicesError, v71, @"EscrowServiceErrorDomain", 102, @"Failed to copy from SRP response");
              v73 = CloudServicesLog();
              if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
                sub_21813F230();
              }

              if (a4) {
                *a4 = v72;
              }

              goto LABEL_49;
            }
            if (_os_feature_enabled_impl())
            {
              v82 = CloudServicesLog();
              if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
              {
                v85 = objc_msgSend_debugDescription(v67, v83, v84);
                LODWORD(buf) = 138412290;
                *(void *)((char *)&buf + 4) = v85;
                _os_log_impl(&dword_218118000, v82, OS_LOG_TYPE_DEFAULT, "DEMO: recovering with salt: %@", (uint8_t *)&buf, 0xCu);
              }
            }
            v86 = [AppleIDPasswordMetadata alloc];
            v148 = objc_msgSend_appleIDPasswordMetadata(self, v87, v88);
            v91 = objc_msgSend_proto(v148, v89, v90);
            v94 = objc_msgSend_appleIDPasswordMetadata(self, v92, v93);
            uint64_t v97 = objc_msgSend_iterations(v94, v95, v96);
            v99 = objc_msgSend_initWithProto_salt_iterations_(v86, v98, (uint64_t)v91, v67, v97);

            objc_msgSend_setAppleIDPasswordMetadata_(self, v100, (uint64_t)v99);
          }
          v101 = objc_msgSend_derivePassword(self, v63, v64);
          v104 = v101;
          if (v101)
          {
            uint64_t v105 = objc_msgSend_length(v101, v102, v103);
            id v106 = v104;
            v148 = objc_msgSend_bytes(v106, v107, v108);
            *(void *)&long long buf = 0;
            *((void *)&buf + 1) = &buf;
            uint64_t v154 = 0x3032000000;
            v155 = sub_21813A2B0;
            v156 = sub_218119828;
            id v157 = 0;
            v151[0] = MEMORY[0x263EF8330];
            v151[1] = 3221225472;
            v151[2] = sub_21813A2C0;
            v151[3] = &unk_264303A18;
            v151[4] = &buf;
            v109 = (void *)MEMORY[0x21D463430](v151);
            int v112 = objc_msgSend_reqVersion(self, v110, v111);
            if (v112)
            {
              if (v112 == 1)
              {
                uint64_t v123 = objc_msgSend_ckvr(self, v113, v114);
                id v124 = v150;
                uint64_t v127 = objc_msgSend_mutableBytes(v124, v125, v126);
                int v120 = sub_21813217C(v123, (uint64_t)v149, v105, (uint64_t)v148, (uint64_t)v44, (unsigned int *)&v152, v127, (void (*)(const char *, ...))sub_21813A1D8, (uint64_t)v109);
              }
              else
              {
                if (v112 != 2)
                {
                  v143 = CloudServicesLog();
                  if (os_log_type_enabled(v143, OS_LOG_TYPE_ERROR))
                  {
                    int v146 = objc_msgSend_reqVersion(self, v144, v145);
                    sub_21813F298((uint64_t)v158, v146, v143);
                  }

                  abort();
                }
                uint64_t v115 = objc_msgSend_ckvr(self, v113, v114);
                id v116 = v150;
                uint64_t v119 = objc_msgSend_mutableBytes(v116, v117, v118);
                int v120 = sub_2181321A8(v115, (uint64_t)v149, v105, (uint64_t)v148, (uint64_t)v44, (unsigned int *)&v152, v119, (void (*)(const char *, ...))sub_21813A1D8, (uint64_t)v109);
              }
            }
            else
            {
              uint64_t v128 = objc_msgSend_ckvr(self, v113, v114);
              id v129 = v150;
              uint64_t v132 = objc_msgSend_mutableBytes(v129, v130, v131);
              int v120 = sub_218131B58(v128, (uint64_t)v149, v105, (uint64_t)v148, (uint64_t)v44, (unsigned int *)&v152, v132, (void (*)(const char *, ...))sub_21813A1D8, (uint64_t)v109);
            }
            int v133 = v120;
            if (a4)
            {
              v134 = *(void **)(*((void *)&buf + 1) + 40);
              if (v134) {
                *a4 = v134;
              }
            }
            if (v133)
            {
              v135 = CloudServicesLog();
              if (os_log_type_enabled(v135, OS_LOG_TYPE_ERROR)) {
                sub_21813F2D8((uint64_t)&buf + 8, v133, v135);
              }

              id v17 = 0;
            }
            else
            {
              id v136 = objc_alloc(MEMORY[0x263EFF8F8]);
              id v137 = v150;
              uint64_t v140 = objc_msgSend_bytes(v137, v138, v139);
              id v17 = objc_msgSend_initWithBytes_length_(v136, v141, v140, v152);
            }

            _Block_object_dispose(&buf, 8);
          }
          else
          {
            v121 = objc_msgSend_errorWithDomain_code_format_(CloudServicesError, v102, @"EscrowServiceErrorDomain", 102, @"fail to derive password");
            v122 = v121;
            if (a4) {
              *a4 = v121;
            }

            id v17 = 0;
          }

          goto LABEL_75;
        }
        v74 = CloudServicesLog();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
          sub_21813F1FC();
        }

        if (a4)
        {
          objc_msgSend_errorWithDomain_code_format_(CloudServicesError, v75, @"EscrowServiceErrorDomain", 128, @"recoveryPassphrase not provided");
          id v17 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_75:

          goto LABEL_76;
        }
LABEL_49:
        id v17 = 0;
        goto LABEL_75;
      }
      v55 = objc_msgSend_dsid(self, v51, v52);
      v56 = v55;
      if (v55)
      {
        id v57 = v55;
        v149 = objc_msgSend_cStringUsingEncoding_(v57, v58, 4);
        if (v149)
        {

          goto LABEL_21;
        }
        v78 = CloudServicesLog();
        if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR)) {
          sub_21813F39C();
        }

        if (!a4)
        {
LABEL_43:

          goto LABEL_49;
        }
        objc_msgSend_errorWithDomain_code_format_(CloudServicesError, v79, @"EscrowServiceErrorDomain", 102, @"username could not be converted to cstring");
      }
      else
      {
        v76 = CloudServicesLog();
        if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR)) {
          sub_21813F368();
        }

        if (!a4) {
          goto LABEL_43;
        }
        objc_msgSend_errorWithDomain_code_format_(CloudServicesError, v77, @"EscrowServiceErrorDomain", 102, @"can't process recovery blob with no username");
      }
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_43;
    }
  }
  v53 = CloudServicesLog();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
    sub_21813F1C8();
  }

  if (a4)
  {
    objc_msgSend_errorWithDomain_code_format_(CloudServicesError, v54, @"EscrowServiceErrorDomain", 102, @"failed to convert srp init response");
    id v17 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v17 = 0;
  }
LABEL_76:

  return v17;
}

- (id)encodedEscrowRecordWithPublicKey:(__SecKey *)a3 error:(id *)a4
{
  v11 = 0xAAAAAAAAAAAAAAAALL;
  if (SecKeyCopyPublicBytes())
  {
    size_t v7 = CloudServicesLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_218118000, v7, OS_LOG_TYPE_DEFAULT, "SecKeyCopyPublicBytes failed", v10, 2u);
    }
    uint64_t v8 = 0;
  }
  else
  {
    size_t v7 = v11;
    uint64_t v8 = objc_msgSend_encodedEscrowRecordWithPublicKeyBytes_error_(self, v6, (uint64_t)v11, a4);
  }

  return v8;
}

- (id)encodedEscrowRecordWithPublicKeyBytes:(id)a3 error:(id *)a4
{
  uint64_t v378 = *MEMORY[0x263EF8340];
  id v6 = a3;
  memset(v377, 170, sizeof(v377));
  size_t v7 = (void *)MEMORY[0x263F08AC0];
  uint64_t v10 = objc_msgSend_escrowRecord(self, v8, v9);
  id v372 = 0;
  uint64_t v12 = objc_msgSend_dataWithPropertyList_format_options_error_(v7, v11, (uint64_t)v10, 200, 0, &v372);
  id v13 = v372;

  if (!v12)
  {
    objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v14, v15);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v16, v100, (uint64_t)v13, *MEMORY[0x263F08608]);
    objc_msgSend_setObject_forKeyedSubscript_(v16, v101, @"failed to serialize escrow data", *MEMORY[0x263F08320]);
    uint64_t v103 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v102, @"EscrowServiceErrorDomain", 5, v16);
    v104 = CloudServicesLog();
    if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v376[0]) = 138412290;
      *(void *)((char *)v376 + 4) = v103;
      _os_log_impl(&dword_218118000, v104, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)v376, 0xCu);
    }

    if (a4) {
      *a4 = v103;
    }

    goto LABEL_23;
  }
  objc_msgSend_dsid(self, v14, v15);
  id v16 = objc_claimAutoreleasedReturnValue();
  size_t v18 = objc_msgSend_cStringUsingEncoding_(v16, v17, 4);
  if (!v18)
  {
    id v106 = CloudServicesLog();
    if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
    {
      v109 = objc_msgSend_label(self, v107, v108);
      int v112 = objc_msgSend_dsid(self, v110, v111);
      LODWORD(v376[0]) = 138412546;
      *(void *)((char *)v376 + 4) = v109;
      WORD6(v376[0]) = 2112;
      *(void *)((char *)v376 + 14) = v112;
      _os_log_impl(&dword_218118000, v106, OS_LOG_TYPE_DEFAULT, "username missing for %@ (dsid %@)", (uint8_t *)v376, 0x16u);
    }
    if (a4)
    {
      objc_msgSend_errorWithDomain_code_format_(CloudServicesError, v113, @"EscrowServiceErrorDomain", 4, @"Username missing");
LABEL_32:
      uint64_t v105 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_109;
    }
LABEL_23:
    uint64_t v105 = 0;
    goto LABEL_109;
  }
  id v367 = v16;
  unint64_t v19 = v12;
  id v360 = v18;
  id v364 = (id)strlen((const char *)v18);
  objc_msgSend_label(self, v20, v21);
  id v22 = objc_claimAutoreleasedReturnValue();
  uint64_t v24 = (const char *)objc_msgSend_cStringUsingEncoding_(v22, v23, 4);

  size_t v27 = objc_msgSend_recordID(self, v25, v26);

  if (v27)
  {
    unint64_t v30 = NSString;
    objc_msgSend_label(self, v28, v29);
    uint64_t v32 = v31 = v6;
    v35 = objc_msgSend_recordID(self, v33, v34);
    objc_msgSend_stringWithFormat_(v30, v36, @"%@.%@", v32, v35);
    id v37 = objc_claimAutoreleasedReturnValue();
    uint64_t v24 = (const char *)objc_msgSend_cStringUsingEncoding_(v37, v38, 4);

    id v6 = v31;
  }
  if (!v24)
  {
    uint64_t v114 = CloudServicesLog();
    uint64_t v12 = v19;
    if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
    {
      v117 = objc_msgSend_label(self, v115, v116);
      int v120 = objc_msgSend_dsid(self, v118, v119);
      LODWORD(v376[0]) = 138412546;
      *(void *)((char *)v376 + 4) = v117;
      WORD6(v376[0]) = 2112;
      *(void *)((char *)v376 + 14) = v120;
      _os_log_impl(&dword_218118000, v114, OS_LOG_TYPE_DEFAULT, "label missing for %@ (dsid %@)", (uint8_t *)v376, 0x16u);
    }
    id v16 = v367;
    if (a4)
    {
      objc_msgSend_errorWithDomain_code_format_(CloudServicesError, v121, @"EscrowServiceErrorDomain", 4, @"label missing");
      goto LABEL_32;
    }
    goto LABEL_23;
  }
  v355 = v24;
  size_t v39 = strlen(v24);
  uint64_t v42 = 128;
  if (v39 < 0x80) {
    uint64_t v42 = v39;
  }
  id v361 = (id)v42;
  uint64_t v43 = objc_msgSend_date(MEMORY[0x263EFF910], v40, v41);
  uint64_t v46 = objc_msgSend_posixDateFormatter(CSDateUtilities, v44, v45);
  objc_msgSend_stringFromDate_(v46, v47, (uint64_t)v43);
  id v365 = objc_claimAutoreleasedReturnValue();
  v354 = (const char *)objc_msgSend_cStringUsingEncoding_(v365, v48, 4);
  id v363 = (id)strlen(v354);
  objc_msgSend_length(v6, v49, v50);
  v362 = v6;
  objc_msgSend_bytes(v362, v51, v52);
  uint64_t v53 = ccrsa_import_pub_n();
  id v366 = v13;
  uint64_t v12 = v19;
  if (!v53)
  {
    v122 = objc_msgSend_errorWithDomain_code_format_(CloudServicesError, v54, @"EscrowServiceErrorDomain", 120, @"Fail to parse certificate");
    uint64_t v123 = a4;
    id v124 = v122;
    id v16 = v367;
    if (v123) {
      *uint64_t v123 = v122;
    }
    v125 = CloudServicesLog();
    if (!os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_44;
    }
    LODWORD(v376[0]) = 138412290;
    *(void *)((char *)v376 + 4) = v124;
    goto LABEL_43;
  }
  uint64_t v353 = v53;
  v356 = v46;
  if (objc_msgSend_useAppleIDPassword(self, v54, v55))
  {
    v58 = objc_msgSend_appleIDPasswordMetadata(self, v56, v57);

    if (!v58)
    {
      id v59 = objc_alloc(MEMORY[0x263EFF990]);
      id v61 = objc_msgSend_initWithLength_(v59, v60, 32);
      uint64_t v64 = objc_msgSend_mutableBytes(v61, v62, v63);
      size_t v67 = objc_msgSend_length(v61, v65, v66);
      CCRandomGenerateBytes(v64, v67);
      v68 = [AppleIDPasswordMetadata alloc];
      v70 = (AppleIDPasswordMetadata *)objc_msgSend_initWithProto_salt_iterations_(v68, v69, *MEMORY[0x263F26D18], v61, 43690);
      appleIDPasswordMetadata = self->_appleIDPasswordMetadata;
      self->_appleIDPasswordMetadata = v70;

      if (_os_feature_enabled_impl())
      {
        v72 = CloudServicesLog();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
        {
          v75 = objc_msgSend_debugDescription(v61, v73, v74);
          LODWORD(v376[0]) = 138412290;
          *(void *)((char *)v376 + 4) = v75;
          _os_log_impl(&dword_218118000, v72, OS_LOG_TYPE_DEFAULT, "DEMO: enrolling with salt: %@", (uint8_t *)v376, 0xCu);
        }
      }
    }
  }
  v357 = v43;
  v358 = a4;
  v359 = v12;
  if (objc_msgSend_useAppleIDPassword(self, v56, v57))
  {
    v78 = objc_msgSend_appleIDPasswordMetadata(self, v76, v77);
    unint64_t v81 = objc_msgSend_ckvr(self, v79, v80);
    unint64_t v84 = objc_msgSend_length(v12, v82, v83);
    objc_msgSend_salt(v78, v85, v86);
    uint64_t v88 = v87 = v6;
    unsigned int v91 = objc_msgSend_length(v88, v89, v90);
    v92 = v362;
    objc_msgSend_bytes(v92, v93, v94);
    objc_msgSend_length(v92, v95, v96);
    size_t v97 = sub_2181341E0(v81, 0, v84, v361, v363, v91);

    id v6 = v87;
  }
  else
  {
    unint64_t v126 = objc_msgSend_ckvr(self, v76, v77);
    unint64_t v129 = objc_msgSend_length(v12, v127, v128);
    v130 = v362;
    objc_msgSend_bytes(v130, v131, v132);
    objc_msgSend_length(v130, v133, v134);
    unint64_t v98 = sub_218134408(v126, (unint64_t)v364, v129, v361, v363);
    size_t v97 = v98;
  }
  id v16 = v367;
  if (v97 <= 0x1000)
  {
    v352 = &v339;
    MEMORY[0x270FA5388](v98);
    unint64_t v136 = (v97 + 15) & 0xFFFFFFFFFFFFFFF0;
    uint64_t v12 = v359;
    if (v97)
    {
      id v137 = memset((char *)&v339 - v136, 170, v97);
      MEMORY[0x270FA5388](v137);
      v351 = (char *)&v339 - v136;
      memset((char *)&v339 - v136, 170, v97);
    }
    else
    {
      v351 = &v373;
    }
    v138 = v358;
    uint64_t v139 = v353;
    *(void *)&long long v140 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v140 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v376[0] = v140;
    v376[1] = v140;
    char v371 = 1;
    __int16 v370 = 1;
    ccrng();
    ccrng();
    uint64_t fips186_key = ccrsa_generate_fips186_key();
    if (fips186_key)
    {
      v143 = objc_msgSend_errorWithDomain_code_format_(CloudServicesError, v142, @"EscrowServiceErrorDomain", 1, @"Could not generate key: %d", fips186_key);
      id v144 = v143;
      if (v138) {
        id *v138 = v143;
      }
      uint64_t v145 = CloudServicesLog();
      if (os_log_type_enabled(v145, OS_LOG_TYPE_DEFAULT))
      {
        int v374 = 138412290;
        id v375 = v144;
        _os_log_impl(&dword_218118000, v145, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v374, 0xCu);
      }

      v362 = 0;
      id v363 = 0;
      int v146 = 0;
      id v360 = 0;
      id v361 = 0;
      id v364 = 0;
      v125 = 0;
      id v124 = 0;
      uint64_t v147 = 0;
      goto LABEL_105;
    }
    uint64_t v349 = (uint64_t)&v339 - v136;
    v148 = malloc_type_malloc(24 * v139 + 40, 0xF641BC80uLL);
    void *v148 = v139;
    v149 = v362;
    objc_msgSend_length(v362, v150, v151);
    id v152 = v149;
    objc_msgSend_bytes(v152, v153, v154);
    ccrsa_import_pub();
    v362 = (void *)ccrsa_ctx_public();
    int v157 = objc_msgSend_useAppleIDPassword(self, v155, v156);
    v350 = v148;
    if (v157)
    {
      v160 = objc_msgSend_appleIDPasswordMetadata(self, v158, v159);
      v369 = 0;
      v163 = objc_msgSend_proto(v160, v161, v162);
      v166 = objc_msgSend_salt(v160, v164, v165);
      v167 = NSNumber;
      v347 = v160;
      uint64_t v170 = objc_msgSend_iterations(v160, v168, v169);
      objc_msgSend_numberWithInt_(v167, v171, v170);
      v174 = objc_msgSend_recoveryPassphrase(self, v172, v173);
      Verifier = (void *)AppleIDAuthSupportCreateVerifier();

      if (!Verifier)
      {
        id v144 = v347;
        objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v176, v177);
        id v212 = (id)objc_claimAutoreleasedReturnValue();
        v238 = v369;
        objc_msgSend_setObject_forKeyedSubscript_(v212, v239, (uint64_t)v369, *MEMORY[0x263F08608]);

        objc_msgSend_setObject_forKeyedSubscript_(v212, v240, @"could not create verifier", *MEMORY[0x263F08320]);
        v242 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v241, @"EscrowServiceErrorDomain", 6, v212);
        v243 = CloudServicesLog();
        if (os_log_type_enabled(v243, OS_LOG_TYPE_ERROR)) {
          sub_21813F230();
        }

        id v16 = v367;
        if (v138) {
          id *v138 = v242;
        }

        uint64_t v12 = v359;
        goto LABEL_72;
      }
      id v348 = v6;
      id v364 = (id)objc_msgSend_ckvr(self, v176, v177);
      v178 = v359;
      id v360 = (id)objc_msgSend_length(v359, v179, v180);
      id v344 = v178;
      v346 = objc_msgSend_bytes(v344, v181, v182);
      v183 = v347;
      v186 = objc_msgSend_salt(v347, v184, v185);
      unsigned int v189 = objc_msgSend_length(v186, v187, v188);
      objc_msgSend_salt(v183, v190, v191);
      id v192 = objc_claimAutoreleasedReturnValue();
      uint64_t v195 = objc_msgSend_bytes(v192, v193, v194);
      unsigned int v198 = objc_msgSend_length(Verifier, v196, v197);
      v345 = Verifier;
      id v343 = Verifier;
      uint64_t v201 = objc_msgSend_bytes(v343, v199, v200);
      int v204 = objc_msgSend_iterations(v183, v202, v203);
      uint64_t v336 = v201;
      uint64_t v334 = v195;
      unsigned int v335 = v198;
      v205 = v354;
      unsigned int v206 = v363;
      unsigned int v207 = v361;
      uint64_t v208 = (uint64_t)v355;
      int v209 = sub_218134484((unint64_t)v364, 0, (uint64_t)&unk_21814465E, (unint64_t)v360, v346, v361, (uint64_t)v355, v363, (uint64_t)v354, v189, v334, v335, v336, v350, v204, v349, (uint64_t)v376);

      if (v209)
      {
        id v144 = v347;
        objc_msgSend_errorWithDomain_code_format_(CloudServicesError, v210, @"EscrowServiceErrorDomain", 125, @"Escrow error encrypting data");
        id v212 = (id)objc_claimAutoreleasedReturnValue();
        v213 = CloudServicesLog();
        if (os_log_type_enabled(v213, OS_LOG_TYPE_DEFAULT))
        {
          int v374 = 138412290;
          id v375 = v212;
          _os_log_impl(&dword_218118000, v213, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v374, 0xCu);
        }

        id v6 = v348;
        v214 = v358;
        uint64_t v12 = v359;
        id v16 = v367;
        uint64_t v147 = v350;
        Verifier = v345;
        if (v358)
        {
          id v212 = v212;
          id *v214 = v212;
        }
        goto LABEL_73;
      }
      id v364 = (id)objc_msgSend_ckvr(self, v210, v211);
      v258 = v344;
      id v360 = (id)objc_msgSend_length(v344, v259, v260);
      id v261 = v258;
      id v344 = (id)objc_msgSend_bytes(v261, v262, v263);
      v264 = v347;
      v346 = objc_msgSend_salt(v347, v265, v266);
      uint64_t v342 = objc_msgSend_length(v346, v267, v268);
      objc_msgSend_salt(v264, v269, v270);
      id v271 = objc_claimAutoreleasedReturnValue();
      uint64_t v341 = objc_msgSend_bytes(v271, v272, v273);
      v274 = v343;
      uint64_t v340 = objc_msgSend_length(v343, v275, v276);
      id v343 = v274;
      uint64_t v279 = (uint64_t)v205;
      uint64_t v280 = objc_msgSend_bytes(v343, v277, v278);
      int v283 = objc_msgSend_iterations(v264, v281, v282);
      v338 = sub_21813A1D8;
      uint64_t v252 = (uint64_t)v351;
      LODWORD(v279) = sub_218134484((unint64_t)v364, 0, (uint64_t)&unk_21814465E, (unint64_t)v360, v344, v207, v208, v206, v279, v342, v341, v340, v280, v362, v283, (uint64_t)v351, (uint64_t)v376);

      if (v279)
      {
        id v144 = v347;
        objc_msgSend_errorWithDomain_code_format_(CloudServicesError, v284, @"EscrowServiceErrorDomain", 125, @"Escrow error encrypting data (spare)");
        id v212 = (id)objc_claimAutoreleasedReturnValue();
        v285 = CloudServicesLog();
        BOOL v286 = os_log_type_enabled(v285, OS_LOG_TYPE_DEFAULT);
        id v6 = v348;
        id v16 = v367;
        v287 = v358;
        if (v286)
        {
          int v374 = 138412290;
          id v375 = v212;
          _os_log_impl(&dword_218118000, v285, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v374, 0xCu);
        }

        uint64_t v12 = v359;
        Verifier = v345;
        if (v287)
        {
          id v212 = v212;
          id *v287 = v212;
        }
LABEL_72:
        uint64_t v147 = v350;
LABEL_73:

        v362 = 0;
        id v363 = 0;
        int v146 = 0;
        id v360 = 0;
        id v361 = 0;
        id v364 = 0;
        v125 = 0;
        id v124 = 0;
        goto LABEL_105;
      }

      id v6 = v348;
      v255 = v366;
      id v16 = v367;
      id v124 = v358;
    }
    else
    {
      id v348 = v6;
      objc_msgSend_recoveryPassphrase(self, v158, v159);
      id v215 = objc_claimAutoreleasedReturnValue();
      v217 = (const char *)objc_msgSend_cStringUsingEncoding_(v215, v216, 4);

      v218 = (void *)strlen(v217);
      unint64_t v221 = objc_msgSend_ckvr(self, v219, v220);
      v222 = v359;
      unint64_t v225 = objc_msgSend_length(v359, v223, v224);
      id v226 = v222;
      uint64_t v229 = objc_msgSend_bytes(v226, v227, v228);
      v337 = v148;
      v230 = v354;
      uint64_t v231 = (uint64_t)v355;
      v346 = v218;
      v347 = (void *)v217;
      uint64_t v232 = (uint64_t)v217;
      unsigned int v233 = v361;
      if (sub_218134B00(v221, (unint64_t)v364, (uint64_t)v360, (uint64_t)v218, v232, v225, v229, v361, (uint64_t)v355, v363, (uint64_t)v354, v337, v349, (uint64_t)v376))
      {
        objc_msgSend_errorWithDomain_code_format_(CloudServicesError, v234, @"EscrowServiceErrorDomain", 125, @"Escrow error encrypting data");
        id v144 = (id)objc_claimAutoreleasedReturnValue();
        v236 = CloudServicesLog();
        if (os_log_type_enabled(v236, OS_LOG_TYPE_DEFAULT))
        {
          int v374 = 138412290;
          id v375 = v144;
          _os_log_impl(&dword_218118000, v236, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v374, 0xCu);
        }

        id v6 = v348;
        v237 = v358;
        uint64_t v12 = v359;
        id v16 = v367;
        uint64_t v147 = v350;
        if (v358)
        {
          id v144 = v144;
          v362 = 0;
          id v363 = 0;
          int v146 = 0;
          id v360 = 0;
          id v361 = 0;
          id v364 = 0;
          v125 = 0;
          id v124 = 0;
          id *v237 = v144;
        }
        else
        {
          v362 = 0;
          id v363 = 0;
          int v146 = 0;
          id v360 = 0;
          id v361 = 0;
          id v364 = 0;
          v125 = 0;
          id v124 = 0;
        }
        goto LABEL_105;
      }
      unint64_t v244 = objc_msgSend_ckvr(self, v234, v235);
      unint64_t v247 = objc_msgSend_length(v226, v245, v246);
      id v248 = v226;
      uint64_t v251 = objc_msgSend_bytes(v248, v249, v250);
      uint64_t v252 = (uint64_t)v351;
      int v253 = sub_218134B00(v244, (unint64_t)v364, (uint64_t)v360, (uint64_t)v346, (uint64_t)v347, v247, v251, v233, v231, v363, (uint64_t)v230, v362, (uint64_t)v351, (uint64_t)v376);
      id v6 = v348;
      v255 = v366;
      id v16 = v367;
      id v124 = v358;
      if (v253)
      {
        objc_msgSend_errorWithDomain_code_format_(CloudServicesError, v254, @"EscrowServiceErrorDomain", 125, @"Escrow error encrypting data (spare)");
        id v144 = (id)objc_claimAutoreleasedReturnValue();
        v256 = CloudServicesLog();
        if (os_log_type_enabled(v256, OS_LOG_TYPE_DEFAULT))
        {
          int v374 = 138412290;
          id v375 = v144;
          _os_log_impl(&dword_218118000, v256, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v374, 0xCu);
        }

        uint64_t v12 = v359;
        uint64_t v147 = v350;
        if (v124)
        {
          id v257 = v144;
          id v144 = v257;
          v362 = 0;
          id v363 = 0;
          int v146 = 0;
          id v360 = 0;
          id v361 = 0;
          id v364 = 0;
LABEL_92:
          v125 = 0;
          v301 = v124;
          id v124 = 0;
          void *v301 = v257;
          goto LABEL_105;
        }
        v362 = 0;
        id v363 = 0;
        int v146 = 0;
        id v360 = 0;
        id v361 = 0;
        id v364 = 0;
LABEL_98:
        v125 = 0;
        goto LABEL_105;
      }
    }
    objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v254, v349, v97);
    id v360 = (id)objc_claimAutoreleasedReturnValue();
    v289 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF990], v288, v252, v97);
    unint64_t v292 = objc_msgSend_length(v289, v290, v291);
    id v293 = v289;
    uint64_t v296 = objc_msgSend_mutableBytes(v293, v294, v295);
    int v297 = sub_2181350A8(v292, v296);
    id v364 = v293;
    if (!v297)
    {
      v302 = [CSSESWrapper alloc];
      LODWORD(v338) = 0;
      v304 = objc_msgSend_initWithDSID_escrowRecordContents_recoveryPassphrase_recordID_recordLabel_useAppleIDPassword_appleIDPasswordMetadata_reqVersion_(v302, v303, 0, 0, 0, 0, 0, 0, 0, v338);
      objc_msgSend_setRecoveryBlob_(v304, v305, (uint64_t)v293);
      v308 = objc_msgSend_srpInitBlob(self, v306, v307);
      v310 = objc_msgSend_srpResponseForEscrowBlob_withFullCCKey_(v304, v309, (uint64_t)v308, v377);
      id v368 = v255;
      v362 = v310;
      int v146 = objc_msgSend_srpRecoveryBlobFromData_error_(self, v311, (uint64_t)v310, &v368);
      id v312 = v368;

      uint64_t v12 = v359;
      id v363 = v308;
      id v361 = v304;
      if (v146)
      {
        id v124 = objc_msgSend_recoveryResponseForBlob_(v304, v313, (uint64_t)v146);
        v125 = objc_msgSend_decodedEscrowRecordFromData_stingray_env_duplicate_error_(self, v314, (uint64_t)v124, 0, 0, 0, v358);
        if (!v125)
        {
          uint64_t v147 = v350;
          goto LABEL_106;
        }
        v317 = objc_msgSend_escrowRecord(self, v315, v316);
        char isEqual = objc_msgSend_isEqual_(v125, v318, (uint64_t)v317);

        if (isEqual)
        {
          cc_clear();
          free(v350);
          id v321 = v360;
          uint64_t v105 = v321;
          uint64_t v12 = v359;
          id v16 = v367;
LABEL_107:

          id v366 = v312;
          uint64_t v46 = v356;
          uint64_t v43 = v357;
          goto LABEL_108;
        }
        v347 = objc_msgSend_errorWithDomain_code_format_(CloudServicesError, v320, @"EscrowServiceErrorDomain", 102, @"Local SRP verify failed");
        v330 = CloudServicesLog();
        BOOL v331 = os_log_type_enabled(v330, OS_LOG_TYPE_ERROR);
        uint64_t v12 = v359;
        uint64_t v147 = v350;
        if (v331) {
          sub_21813F230();
        }

        v332 = v358;
        if (v358)
        {
          id v333 = v347;
          id *v332 = v333;
          id v366 = v312;
          id v144 = v333;
          id v16 = v367;
          goto LABEL_105;
        }
        id v366 = v312;
        id v16 = v367;
      }
      else
      {
        id v322 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        objc_msgSend_setObject_forKeyedSubscript_(v322, v323, (uint64_t)v312, *MEMORY[0x263F08608]);
        objc_msgSend_setObject_forKeyedSubscript_(v322, v324, @"could not create local SRP recovery blob", *MEMORY[0x263F08320]);
        v347 = v322;
        v326 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v325, @"EscrowServiceErrorDomain", 102, v322);
        v327 = CloudServicesLog();
        if (os_log_type_enabled(v327, OS_LOG_TYPE_ERROR)) {
          sub_21813F230();
        }

        uint64_t v147 = v350;
        v328 = v358;
        if (v358) {
          id *v328 = v326;
        }

        int v146 = 0;
        v125 = 0;
        id v124 = 0;
        id v366 = v312;
      }
      id v144 = v347;
LABEL_105:

      id v312 = v366;
LABEL_106:
      free(v147);
      cc_clear();
      uint64_t v105 = 0;
      id v321 = v360;
      goto LABEL_107;
    }
    objc_msgSend_errorWithDomain_code_format_(CloudServicesError, v298, @"EscrowServiceErrorDomain", 102, @"Error decoding recovery record");
    id v144 = (id)objc_claimAutoreleasedReturnValue();
    v299 = CloudServicesLog();
    BOOL v300 = os_log_type_enabled(v299, OS_LOG_TYPE_DEFAULT);
    uint64_t v12 = v359;
    if (v300)
    {
      int v374 = 138412290;
      id v375 = v144;
      _os_log_impl(&dword_218118000, v299, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v374, 0xCu);
    }

    uint64_t v147 = v350;
    if (v124)
    {
      id v257 = v144;
      id v144 = v257;
      v362 = 0;
      id v363 = 0;
      int v146 = 0;
      id v361 = 0;
      goto LABEL_92;
    }
    v362 = 0;
    id v363 = 0;
    int v146 = 0;
    id v361 = 0;
    goto LABEL_98;
  }
  v135 = objc_msgSend_errorWithDomain_code_format_(CloudServicesError, v99, @"EscrowServiceErrorDomain", 3, @"Escrow data too long (%zu)", v97);
  id v124 = v135;
  uint64_t v12 = v359;
  uint64_t v43 = v357;
  if (v358) {
    id *v358 = v135;
  }
  v125 = CloudServicesLog();
  uint64_t v46 = v356;
  if (!os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_44;
  }
  LODWORD(v376[0]) = 138412290;
  *(void *)((char *)v376 + 4) = v124;
LABEL_43:
  _os_log_impl(&dword_218118000, v125, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)v376, 0xCu);
LABEL_44:
  uint64_t v105 = 0;
LABEL_108:

  id v13 = v366;
LABEL_109:

  return v105;
}

- (id)decodedEscrowRecordFromData:(id)a3 stingray:(BOOL)a4 env:(id)a5 duplicate:(BOOL)a6 error:(id *)a7
{
  BOOL v10 = a4;
  v150[1] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a5;
  if (!((unint64_t)objc_msgSend_length(v12, v14, v15) >> 32))
  {
    size_t v23 = objc_msgSend_length(v12, v16, v17);
    unint64_t v24 = (v23 + 15) & 0xFFFFFFFFFFFFFFF0;
    v25 = (char *)&v133 - v24;
    if (v23) {
      memset((char *)&v133 - v24, 170, v23);
    }
    id v26 = v12;
    uint64_t v29 = (const void *)objc_msgSend_bytes(v26, v27, v28);
    size_t v32 = objc_msgSend_length(v26, v30, v31);
    memcpy(v25, v29, v32);
    unint64_t v35 = objc_msgSend_length(v26, v33, v34);
    int v36 = sub_218135CF0(v35, (unsigned int *)v25);
    if (!v36)
    {
      objc_msgSend_errorWithDomain_code_format_(CloudServicesError, v37, @"EscrowServiceErrorDomain", 7, @"decodedEscrowRecordFromData: failed to parse packet header");
      id v42 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v43 = CloudServicesLog();
      if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
    LODWORD(v39) = v36;
    int v40 = objc_msgSend_reqVersion(self, v37, v38);
    if (v40)
    {
      if (v40 != 2)
      {
        if (v40 != 1)
        {
          CloudServicesLog();
          unint64_t v126 = (char *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled((os_log_t)v126, OS_LOG_TYPE_ERROR)) {
            sub_21813F3D0(self, v126, v127);
          }
          goto LABEL_83;
        }
        unint64_t v39 = v39;
        if (!sub_218135AA4(v39, (uint64_t)v25)) {
          goto LABEL_14;
        }
LABEL_24:
        v143 = &v133;
        objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v41, (uint64_t)v25, v39);
        id v42 = objc_claimAutoreleasedReturnValue();
        long long v140 = (_DWORD *)objc_msgSend_bytes(v42, v44, v45);
        id v139 = (id)objc_msgSend_length(v42, v46, v47);
        v150[0] = 4096;
        memset(&v133 - 512, 170, 0x1000uLL);
        size_t v149 = 128;
        v141 = &v133 - 16;
        *(void *)&long long v48 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v48 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v131 = v48;
        long long v132 = v48;
        long long v129 = v48;
        long long v130 = v48;
        *((_OWORD *)&v133 - 6) = v48;
        *((_OWORD *)&v133 - 5) = v48;
        *((_OWORD *)&v133 - 8) = v48;
        *((_OWORD *)&v133 - 7) = v48;
        v51 = objc_msgSend_derivePassword(self, v49, v50);
        id v142 = v51;
        if (!v51)
        {
          v71 = objc_msgSend_errorWithDomain_code_format_(CloudServicesError, v52, @"EscrowServiceErrorDomain", 102, @"fail to derive password");
          v72 = v71;
          if (a7) {
            *a7 = v71;
          }

          id v22 = 0;
          goto LABEL_74;
        }
        id v138 = v13;
        v54 = v51;
        uint64_t v136 = objc_msgSend_length(v51, v52, v53);
        id v55 = v54;
        uint64_t v58 = objc_msgSend_bytes(v55, v56, v57);
        size_t v148 = 64;
        id v137 = &v129;
        *(void *)&long long v59 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v59 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v131 = v59;
        long long v132 = v59;
        long long v129 = v59;
        long long v130 = v59;
        int v62 = objc_msgSend_reqVersion(self, v60, v61);
        if (v62)
        {
          uint64_t v135 = v58;
          if (v62 != 1)
          {
            size_t v65 = v141;
            if (v62 == 2)
            {
              uint64_t v66 = objc_msgSend_ckvr(self, v63, v64);
              *((void *)&v132 + 1) = sub_21813A1D8;
              uint64_t v67 = (uint64_t)v137;
              if (sub_218133CD4(v66, v136, v135, (unint64_t)v139, v140, v150, &v133 - 512, &v149, v65, &v148, v137))
              {
                uint64_t v69 = objc_msgSend_errorWithDomain_code_format_(CloudServicesError, v68, @"EscrowServiceErrorDomain", 10, @"fail to decode masterkey_v1");
                id v70 = v69;
                if (a7)
                {
                  id v70 = v69;
                  id v22 = 0;
                  *a7 = v70;
                }
                else
                {
                  id v22 = 0;
                }
                id v13 = v138;
                goto LABEL_73;
              }
LABEL_66:
              v109 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v68, (uint64_t)(&v133 - 512), v150[0]);
              id v144 = 0;
              id v22 = objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x263F08AC0], v110, (uint64_t)v109, 0, 0, &v144);
              id v70 = v144;
              if (v22)
              {
                id v112 = [NSString alloc];
                id v114 = (id)objc_msgSend_initWithBytes_length_encoding_(v112, v113, v67, v148, 4);
                uint64_t v116 = objc_msgSend_secureBackupDateFromString_(CSDateUtilities, v115, (uint64_t)v114);
                objc_msgSend_setEscrowDate_(self, v117, (uint64_t)v116);

                id v118 = [NSString alloc];
                int v120 = objc_msgSend_initWithBytes_length_encoding_(v118, v119, (uint64_t)v65, v149, 4);
                objc_msgSend_setDecodedLabel_(self, v121, (uint64_t)v120);

                id v122 = v22;
                id v13 = v138;
              }
              else
              {
                objc_msgSend_errorWithDomain_code_underlyingError_format_(CloudServicesError, v111, @"EscrowServiceErrorDomain", 12, v70, @"fail to decode plist");
                id v114 = (id)objc_claimAutoreleasedReturnValue();
                uint64_t v123 = CloudServicesLog();
                BOOL v124 = os_log_type_enabled(v123, OS_LOG_TYPE_ERROR);
                id v13 = v138;
                if (v124) {
                  sub_21813F230();
                }

                if (a7)
                {
                  id v114 = v114;
                  *a7 = v114;
                }
              }

              goto LABEL_73;
            }
            CloudServicesLog();
            unint64_t v126 = (char *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled((os_log_t)v126, OS_LOG_TYPE_ERROR)) {
              sub_21813F3D0(self, v126, v128);
            }
LABEL_83:

            abort();
          }
          id v139 = (id)MEMORY[0x263EFF8F8];
          id v76 = v26;
          uint64_t v79 = objc_msgSend_bytes(v76, v77, v78) + v39;
          id v134 = v76;
          uint64_t v82 = objc_msgSend_length(v76, v80, v81);
          uint64_t v84 = objc_msgSend_dataWithBytes_length_(v139, v83, v79, v82 - v39);
          id v146 = 0;
          CFTypeRef v147 = 0;
          BYTE9(v131) = 1;
          BYTE8(v131) = a6;
          id v13 = v138;
          v85 = (void *)v84;
          LOBYTE(v79) = objc_msgSend_verifyCertData_withCert_withPubKey_stingray_enroll_altDSID_env_duplicate_sigVerification_error_(CSCertOperations, v86, v84, 0, &v147, v10, 0, 0, v138, *((void *)&v131 + 1), &v146);
          id v139 = v146;
          if (v79)
          {
            uint64_t v145 = 0;
            uint64_t v89 = SecKeyCopyPublicBytes();
            if (v147) {
              CFRelease(v147);
            }
            if (v89)
            {
              uint64_t v90 = objc_msgSend_errorWithDomain_code_format_(CloudServicesError, v87, @"EscrowServiceErrorDomain", 11, @"SecKeyCopyPublicBytes: %d", v89);
              unsigned int v91 = CloudServicesLog();
              if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR)) {
                sub_21813F230();
              }

              id v70 = v85;
              if (a7) {
                *a7 = v90;
              }
            }
            else
            {
              v95 = v145;
              uint64_t v133 = objc_msgSend_ckvr(self, v87, v88);
              id v96 = v134;
              id v134 = (id)objc_msgSend_bytes(v96, v97, v98);
              uint64_t v101 = objc_msgSend_length(v95, v99, v100);
              id v102 = v95;
              *(void *)&long long v132 = objc_msgSend_bytes(v102, v103, v104);
              *((void *)&v132 + 1) = sub_21813A1D8;
              *((void *)&v131 + 1) = v101;
              *(void *)&long long v131 = v137;
              uint64_t v105 = v141;
              if (!sub_218133694(v133, v136, v135, v39, v140, v39, (uint64_t)v134, (uint64_t)v150, (uint64_t)(&v133 - 512), (uint64_t)&v149, (uint64_t)v141, (unint64_t)&v148))
              {

                size_t v65 = v105;
                uint64_t v67 = (uint64_t)v137;
                goto LABEL_66;
              }
              v107 = objc_msgSend_errorWithDomain_code_format_(CloudServicesError, v106, @"EscrowServiceErrorDomain", 10, @"fail to decode masterkey_v1");
              uint64_t v108 = CloudServicesLog();
              id v70 = v85;
              if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR)) {
                sub_21813F230();
              }

              if (a7) {
                *a7 = v107;
              }
            }
          }
          else
          {
            if (v147) {
              CFRelease(v147);
            }
            v92 = CloudServicesLog();
            BOOL v93 = os_log_type_enabled(v92, OS_LOG_TYPE_ERROR);
            id v70 = v85;
            uint64_t v94 = v139;
            if (v93) {
              sub_21813F454();
            }

            if (a7) {
              *a7 = v94;
            }
          }
        }
        else
        {
          uint64_t v73 = objc_msgSend_ckvr(self, v63, v64);
          *((void *)&v132 + 1) = sub_21813A1D8;
          uint64_t v67 = (uint64_t)v137;
          int v74 = v58;
          size_t v65 = v141;
          if (!sub_218132FEC(v73, v136, v74, (unint64_t)v139, v140, v150, &v133 - 512, &v149, v141, &v148, v137))goto LABEL_66; {
          objc_msgSend_errorWithDomain_code_format_(CloudServicesError, v68, @"EscrowServiceErrorDomain", 10, @"fail to decode masterkey_v0");
          }
          id v70 = (id)objc_claimAutoreleasedReturnValue();
          v75 = CloudServicesLog();
          if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
            sub_21813F230();
          }

          id v13 = v138;
          if (a7)
          {
            id v70 = v70;
            id v22 = 0;
            *a7 = v70;
LABEL_73:

LABEL_74:
LABEL_75:

            goto LABEL_76;
          }
        }
        id v22 = 0;
        goto LABEL_73;
      }
      unint64_t v39 = v39;
      if (sub_218135BD4(v39, (uint64_t)v25)) {
        goto LABEL_24;
      }
    }
    else
    {
      unint64_t v39 = v39;
      if (sub_2181357C0(v39, (uint64_t)v25)) {
        goto LABEL_24;
      }
    }
LABEL_14:
    objc_msgSend_errorWithDomain_code_format_(CloudServicesError, v41, @"EscrowServiceErrorDomain", 9, @"decodedEscrowRecordFromData: failed to convert recover_resp");
    id v42 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v43 = CloudServicesLog();
    if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
LABEL_17:
    sub_21813F230();
LABEL_18:

    if (a7)
    {
      id v42 = v42;
      id v22 = 0;
      *a7 = v42;
    }
    else
    {
      id v22 = 0;
    }
    goto LABEL_75;
  }
  uint64_t v18 = objc_msgSend_length(v12, v16, v17);
  v20 = objc_msgSend_errorWithDomain_code_format_(CloudServicesError, v19, @"EscrowServiceErrorDomain", 7, @"srp recovery blob too large: %lu bytes", v18);
  uint64_t v21 = CloudServicesLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    sub_21813F230();
  }

  if (a7) {
    *a7 = v20;
  }

  id v22 = 0;
LABEL_76:

  return v22;
}

- (id)srpResponseForEscrowBlob:(id)a3 withFullCCKey:(ccrsa_full_ctx *)a4
{
  uint64_t v4 = MEMORY[0x270FA5388](self);
  uint64_t v6 = v5;
  size_t v7 = (void *)v4;
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v9 = v8;
  unint64_t v76 = 4096;
  memset(v77, 170, sizeof(v77));
  uint64_t v12 = objc_msgSend_ckvr(v7, v10, v11);
  objc_msgSend_recoveryBlob(v7, v13, v14);
  id v15 = objc_claimAutoreleasedReturnValue();
  uint64_t v18 = (unsigned int *)objc_msgSend_bytes(v15, v16, v17);
  LODWORD(v6) = sub_2181351D8(v12, v18, (uint64_t *)&v76, (uint64_t)v77, v6);

  if (v6)
  {
    unint64_t v19 = CloudServicesLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_21813F524();
    }
LABEL_4:

LABEL_24:
    long long v59 = 0;
    goto LABEL_25;
  }
  id v20 = objc_alloc(MEMORY[0x263EFF8F8]);
  id v22 = objc_msgSend_initWithBytes_length_(v20, v21, (uint64_t)v77, v76);
  objc_msgSend_setEscrowBlob_(v7, v23, (uint64_t)v22);

  BOOL v24 = sub_218133470(v76, v77);
  if (!v24) {
    goto LABEL_24;
  }
  uint64_t v67 = (uint64_t)&v67;
  size_t v25 = *(unsigned int *)((char *)v77[3].u32 + v77[1].u32[1]);
  size_t v26 = *(unsigned int *)((char *)v77[3].u32 + v77[2].u32[1]);
  size_t v27 = *(unsigned int *)((char *)v77[3].u32 + v77[2].u32[2]);
  size_t v74 = v26;
  size_t v75 = v25;
  size_t v28 = *(unsigned int *)((char *)v77[3].u32 + v77[1].u32[2]);
  size_t v72 = v28;
  size_t v73 = v27;
  unint64_t v70 = 0xAAAAAAAAAAAAAAAALL;
  size_t v29 = *(unsigned int *)((char *)v77[3].u32 + v77[1].u32[3]);
  size_t v71 = v29;
  size_t v30 = *(unsigned int *)((char *)v77[3].u32 + v77[2].u32[0]);
  size_t v69 = v30;
  MEMORY[0x270FA5388](v24);
  size_t v32 = (char *)&v67 - v31;
  uint64_t v34 = memset((char *)&v67 - v31, 170, v33);
  unint64_t v35 = (void *)MEMORY[0x270FA5388](v34);
  id v37 = (char *)&v67 - v36;
  if (v26) {
    unint64_t v35 = memset((char *)&v67 - v36, 170, v26);
  }
  uint64_t v38 = (void *)MEMORY[0x270FA5388](v35);
  unint64_t v39 = (char *)&v67 - ((v27 + 15) & 0x1FFFFFFF0);
  if (v27) {
    uint64_t v38 = memset((char *)&v67 - ((v27 + 15) & 0x1FFFFFFF0), 170, v27);
  }
  int v40 = (void *)MEMORY[0x270FA5388](v38);
  uint64_t v41 = (char *)&v67 - ((v28 + 15) & 0x1FFFFFFF0);
  if (v28) {
    int v40 = memset((char *)&v67 - ((v28 + 15) & 0x1FFFFFFF0), 170, v28);
  }
  id v42 = (void *)MEMORY[0x270FA5388](v40);
  uint64_t v43 = (char *)&v67 - ((v29 + 15) & 0x1FFFFFFF0);
  if (v29) {
    id v42 = memset((char *)&v67 - ((v29 + 15) & 0x1FFFFFFF0), 170, v29);
  }
  MEMORY[0x270FA5388](v42);
  if (v30) {
    memset((char *)&v67 - ((v30 + 15) & 0x1FFFFFFF0), 170, v30);
  }
  if (!sub_218135464((unsigned int *)v77, &v75, v32, &v74, v37, &v73, v39, &v72, v41, &v71, v43, &v70, &v69, (char *)&v67 - ((v30 + 15) & 0x1FFFFFFF0)))
  {
LABEL_23:
    long long v59 = 0;
    goto LABEL_25;
  }
  v32[v75] = 0;
  uint64_t v46 = objc_msgSend_srpPublicKeySize(v7, v44, v45);
  uint64_t v47 = MEMORY[0x270FA5388](v46);
  v51 = (char *)&v67 - v50;
  if (v47) {
    memset((char *)&v67 - v50, 170, v46);
  }
  uint64_t v52 = objc_msgSend_ckvr(v7, v48, v49);
  uint64_t v53 = v72;
  id v54 = v9;
  uint64_t v57 = objc_msgSend_bytes(v54, v55, v56);
  if (sub_218134D84(v52, (uint64_t)v32, v53, (uint64_t)v41, (uint64_t)v43, v57, (uint64_t)v51))
  {
    uint64_t v58 = CloudServicesLog();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
      sub_21813F4F0();
    }

    goto LABEL_23;
  }
  long long v79 = xmmword_2181427C0;
  v78[0] = 0x706050403020100;
  *(void *)((char *)v78 + 6) = 0xD0C0B0A09080706;
  unint64_t v68 = sub_218135788(0xEuLL, v72, v46);
  uint64_t v61 = MEMORY[0x270FA5388](v68);
  uint64_t v64 = (char *)&v67 - v63;
  if (v61) {
    memset((char *)&v67 - v63, 170, v62);
  }
  if ((sub_2181355C4(16, &v79, 0xEu, (uint64_t)v78, v72, (uint64_t)v41, v46, (uint64_t)v51, (unsigned int *)&v68, (uint64_t)v64) & 1) == 0)
  {
    unint64_t v19 = CloudServicesLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_21813F4BC();
    }
    goto LABEL_4;
  }
  id v65 = objc_alloc(MEMORY[0x263EFF8F8]);
  long long v59 = objc_msgSend_initWithBytes_length_(v65, v66, (uint64_t)v64, v68);
LABEL_25:

  return v59;
}

- (id)recoveryResponseForBlob:(id)a3
{
  v79[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v9 = objc_msgSend_srpKeySize(self, v5, v6);
  if (v9)
  {
    uint64_t v10 = objc_msgSend_length(v4, v7, v8);
    uint64_t v11 = MEMORY[0x270FA5388](v10);
    uint64_t v14 = (int8x8_t *)((char *)&v73 - v13);
    if (v11) {
      memset((char *)&v73 - v13, 170, v12);
    }
    id v15 = v4;
    uint64_t v18 = (const void *)objc_msgSend_bytes(v15, v16, v17);
    size_t v21 = objc_msgSend_length(v15, v19, v20);
    memcpy(v14, v18, v21);
    unint64_t v24 = objc_msgSend_length(v15, v22, v23);
    if (!sub_2181358D0(v24, v14)
      || (size_t v27 = (void *)MEMORY[0x263EFF8F8],
          uint64_t v28 = objc_msgSend_length(v15, v25, v26),
          objc_msgSend_dataWithBytes_length_(v27, v29, (uint64_t)v14, v28),
          (size_t v30 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      id v9 = 0;
      goto LABEL_22;
    }
    size_t v75 = &v73;
    id v31 = v30;
    uint64_t v34 = objc_msgSend_bytes(v31, v32, v33);
    v79[0] = 16;
    uint64_t v35 = *(unsigned int *)(v34 + 32);
    size_t v78 = *(unsigned int *)(v34 + 40 + *(unsigned int *)(v34 + 28));
    size_t v36 = *(unsigned int *)(v34 + 40 + v35);
    size_t v77 = v36;
    uint64_t v37 = MEMORY[0x270FA5388](v34);
    *(void *)&long long v72 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v72 + 1) = 0xAAAAAAAAAAAAAAAALL;
    uint64_t v38 = (void *)MEMORY[0x270FA5388](v37);
    uint64_t v41 = (char *)&v73 - v40;
    if (v39) {
      uint64_t v38 = memset((char *)&v73 - v40, 170, v39);
    }
    MEMORY[0x270FA5388](v38);
    id v42 = memset((char *)&v73 - (((unint64_t)v9 + 15) & 0xFFFFFFFFFFFFFFF0), 170, (size_t)v9);
    MEMORY[0x270FA5388](v42);
    if (v36) {
      memset((char *)&v73 - ((v36 + 15) & 0x1FFFFFFF0), 170, v36);
    }
    if (sub_2181359F4(v34, &v78, v41, v79, &v72, &v77, (char *)&v73 - ((v36 + 15) & 0x1FFFFFFF0)))
    {
      objc_msgSend_ckvr(self, v43, v44);
      uint64_t v45 = sub_218134DAC();
      if (v45)
      {
        uint64_t v76 = 4096;
        MEMORY[0x270FA5388](v45);
        memset(&v73 - 512, 170, 0x1000uLL);
        unint64_t v74 = objc_msgSend_ckvr(self, v46, v47);
        uint64_t v50 = objc_msgSend_srpKeySize(self, v48, v49);
        uint64_t v53 = objc_msgSend_ckvr(self, v51, v52);
        unint64_t v54 = sub_218131AE0(v53);
        uint64_t v57 = objc_msgSend_escrowBlob(self, v55, v56);
        unint64_t v60 = objc_msgSend_length(v57, v58, v59);
        objc_msgSend_escrowBlob(self, v61, v62);
        id v63 = objc_claimAutoreleasedReturnValue();
        uint64_t v66 = objc_msgSend_bytes(v63, v64, v65);
        *((void *)&v72 + 1) = sub_21813A1D8;
        int v67 = sub_218134DC8(v74, v50, v54, v9, (uint64_t)&v73 - (((unint64_t)v9 + 15) & 0xFFFFFFFFFFFFFFF0), v60, v66, &v76, (uint64_t)(&v73 - 512));

        if (!v67)
        {
          id v68 = objc_alloc(MEMORY[0x263EFF8F8]);
          id v9 = objc_msgSend_initWithBytes_length_(v68, v69, (uint64_t)(&v73 - 512), v76);
LABEL_21:

          goto LABEL_22;
        }
LABEL_20:
        id v9 = 0;
        goto LABEL_21;
      }
      unint64_t v70 = CloudServicesLog();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
        sub_21813F558();
      }
    }
    else
    {
      unint64_t v70 = CloudServicesLog();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
        sub_21813F58C();
      }
    }

    goto LABEL_20;
  }
LABEL_22:

  return v9;
}

- (void)dealloc
{
  ckvr = self->_ckvr;
  if (ckvr)
  {
    sub_2181319CC((uint64_t)ckvr);
    free(self->_ckvr);
  }
  v4.receiver = self;
  v4.super_class = (Class)CSSESWrapper;
  [(CSSESWrapper *)&v4 dealloc];
}

- (AppleIDPasswordMetadata)appleIDPasswordMetadata
{
  return self->_appleIDPasswordMetadata;
}

- (void)setAppleIDPasswordMetadata:(id)a3
{
}

- (NSString)decodedLabel
{
  return self->_decodedLabel;
}

- (void)setDecodedLabel:(id)a3
{
}

- (NSDate)escrowDate
{
  return self->_escrowDate;
}

- (void)setEscrowDate:(id)a3
{
}

- (NSData)recoveryBlob
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRecoveryBlob:(id)a3
{
}

- (int)reqVersion
{
  return self->_reqVersion;
}

- (ckvr_srp_context)ckvr
{
  return self->_ckvr;
}

- (NSString)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
{
}

- (NSString)recoveryPassphrase
{
  return self->_recoveryPassphrase;
}

- (void)setRecoveryPassphrase:(id)a3
{
}

- (BOOL)recoveryPassphraseMutable
{
  return self->_recoveryPassphraseMutable;
}

- (void)setRecoveryPassphraseMutable:(BOOL)a3
{
  self->_recoveryPassphraseMutable = a3;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)recordID
{
  return self->_recordID;
}

- (NSDictionary)escrowRecord
{
  return self->_escrowRecord;
}

- (NSData)escrowBlob
{
  return self->_escrowBlob;
}

- (void)setEscrowBlob:(id)a3
{
}

- (BOOL)useAppleIDPassword
{
  return self->_useAppleIDPassword;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_escrowBlob, 0);
  objc_storeStrong((id *)&self->_escrowRecord, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_recoveryPassphrase, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_recoveryBlob, 0);
  objc_storeStrong((id *)&self->_escrowDate, 0);
  objc_storeStrong((id *)&self->_decodedLabel, 0);

  objc_storeStrong((id *)&self->_appleIDPasswordMetadata, 0);
}

@end