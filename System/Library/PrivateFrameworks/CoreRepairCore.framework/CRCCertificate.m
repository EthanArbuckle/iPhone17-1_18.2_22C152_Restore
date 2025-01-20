@interface CRCCertificate
- (CRCCertificate)init;
- (CRCCertificate)initWithRefKey:(__SecKey *)a3 certificates:(id)a4 certType:(int64_t)a5;
- (NSArray)certificates;
- (__SecKey)referenceKey;
- (id)copyCertificatePEMWithError:(id *)a3;
- (id)extractCAAAttestationOIDDataWithError:(id *)a3;
- (id)extractRepairHistoryWithError:(id *)a3;
- (int64_t)certifcateType;
- (void)setCertifcateType:(int64_t)a3;
- (void)setCertificates:(id)a3;
- (void)setReferenceKey:(__SecKey *)a3;
@end

@implementation CRCCertificate

- (CRCCertificate)initWithRefKey:(__SecKey *)a3 certificates:(id)a4 certType:(int64_t)a5
{
  id v9 = a4;
  v13 = v9;
  if (a3 && v9 && objc_msgSend_count(v9, v10, v11, v12) == 2)
  {
    v19.receiver = self;
    v19.super_class = (Class)CRCCertificate;
    v14 = [(CRCCertificate *)&v19 init];
    v15 = v14;
    if (v14)
    {
      v14->referenceKey = a3;
      objc_storeStrong((id *)&v14->certificates, a4);
      v15->certifcateType = a5;
    }
    self = v15;
    v16 = self;
  }
  else
  {
    v17 = handleForCategory(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_21FC62508();
    }

    v16 = 0;
  }

  return v16;
}

- (CRCCertificate)init
{
  return 0;
}

- (id)extractCAAAttestationOIDDataWithError:(id *)a3
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  v49[0] = 0;
  v49[1] = 0;
  long long v48 = 0uLL;
  memset(v56, 0, sizeof(v56));
  uint64_t v47 = 0;
  objc_msgSend_objectAtIndexedSubscript_(self->certificates, a2, 0, v3);
  v6 = (__SecCertificate *)objc_claimAutoreleasedReturnValue();
  CFDataRef v7 = SecCertificateCopyData(v6);

  CFDataRef v8 = v7;
  unint64_t v12 = objc_msgSend_bytes(v8, v9, v10, v11);
  unint64_t v16 = v12 + objc_msgSend_length(v8, v13, v14, v15);
  v17 = handleForCategory(0);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v55 = objc_msgSend_length(v8, v18, v19, v20);
    _os_log_impl(&dword_21FBF2000, v17, OS_LOG_TYPE_DEFAULT, "cert der length:%ld", buf, 0xCu);
  }

  v21 = handleForCategory(0);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FBF2000, v21, OS_LOG_TYPE_DEFAULT, "Calling CTParseCertificateSet", buf, 2u);
  }

  uint64_t v22 = sub_21FC564A8(v12, v16, v56, 3, &v47);
  if (v22 || !*(void *)&v56[0] || !*((void *)&v56[0] + 1))
  {
    v35 = handleForCategory(0);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      sub_21FC625B4();
    }

    v36 = (void *)MEMORY[0x263F087E8];
    uint64_t v52 = *MEMORY[0x263F08320];
    v30 = objc_msgSend_stringWithFormat_(NSString, v37, @"CTParseCertificateSet parse failed %d", v38, v22);
    v53 = v30;
    v40 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v39, (uint64_t)&v53, (uint64_t)&v52, 1);
    v34 = objc_msgSend_errorWithDomain_code_userInfo_(v36, v41, @"com.apple.corerepair", -41, v40);

    goto LABEL_17;
  }
  long long v48 = v56[0];
  v23 = handleForCategory(0);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FBF2000, v23, OS_LOG_TYPE_DEFAULT, "CTParseCertificateSet successful", buf, 2u);
  }

  v24 = sub_21FC53678((unint64_t *)&v48, v49);
  v25 = handleForCategory(0);
  v26 = v25;
  if (v24)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_21FC6253C((int)v24, v26);
    }

    v27 = (void *)MEMORY[0x263F087E8];
    uint64_t v50 = *MEMORY[0x263F08320];
    objc_msgSend_stringWithFormat_(NSString, v28, @"Failed to parse cert chain; stat: %d",
      v29,
    v30 = v24);
    v51 = v30;
    v32 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v31, (uint64_t)&v51, (uint64_t)&v50, 1);
    v34 = objc_msgSend_errorWithDomain_code_userInfo_(v27, v33, @"com.apple.corerepair", -41, v32);

LABEL_17:
    v42 = 0;
    goto LABEL_18;
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FBF2000, v26, OS_LOG_TYPE_DEFAULT, "DERDecodeSeqContentInit successful", buf, 2u);
  }

  v46 = objc_msgSend_objectAtIndexedSubscript_(self->certificates, v44, 0, v45);
  v42 = (void *)SecCertificateCopyExtensionValue();

  v30 = handleForCategory(0);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v55 = (uint64_t)v42;
    _os_log_impl(&dword_21FBF2000, v30, OS_LOG_TYPE_DEFAULT, "caaOIDDer:%@", buf, 0xCu);
  }
  v34 = 0;
LABEL_18:

  if (a3) {
    *a3 = v34;
  }

  return v42;
}

- (id)extractRepairHistoryWithError:(id *)a3
{
  uint64_t v142 = *MEMORY[0x263EF8340];
  v134[0] = 0;
  v134[1] = 0;
  v133[0] = 0;
  v133[1] = 0;
  uint64_t v131 = 0;
  uint64_t v132 = 0;
  memset(v141, 0, sizeof(v141));
  uint64_t v129 = 0;
  uint64_t v130 = 0;
  unint64_t v127 = 0;
  uint64_t v128 = 0;
  unint64_t v124 = 0;
  uint64_t v125 = 0;
  uint64_t v126 = 0;
  v5 = objc_opt_new();
  id v6 = objc_alloc_init(MEMORY[0x263F08790]);
  uint64_t v10 = objc_msgSend_currentLocale(MEMORY[0x263EFF960], v7, v8, v9);
  objc_msgSend_setLocale_(v6, v11, (uint64_t)v10, v12);

  objc_msgSend_setDateStyle_(v6, v13, 3, v14);
  objc_msgSend_setTimeStyle_(v6, v15, 0, v16);
  objc_msgSend_setFormattingContext_(v6, v17, 5, v18);
  objc_msgSend_objectAtIndexedSubscript_(self->certificates, v19, 0, v20);
  v21 = (__SecCertificate *)objc_claimAutoreleasedReturnValue();
  CFDataRef v22 = SecCertificateCopyData(v21);

  CFDataRef v23 = v22;
  unint64_t v27 = objc_msgSend_bytes(v23, v24, v25, v26);
  unint64_t v31 = v27 + objc_msgSend_length(v23, v28, v29, v30);
  v32 = handleForCategory(0);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v140 = objc_msgSend_length(v23, v33, v34, v35);
    _os_log_impl(&dword_21FBF2000, v32, OS_LOG_TYPE_DEFAULT, "cert der length:%ld", buf, 0xCu);
  }

  v36 = handleForCategory(0);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FBF2000, v36, OS_LOG_TYPE_DEFAULT, "Calling CTParseCertificateSet", buf, 2u);
  }

  uint64_t v39 = sub_21FC564A8(v27, v31, v141, 3, &v130);
  if (v39 || !*(void *)&v141[0] || !*((void *)&v141[0] + 1))
  {
    v109 = handleForCategory(0);
    if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR)) {
      sub_21FC625B4();
    }

    v110 = (void *)MEMORY[0x263F087E8];
    uint64_t v137 = *MEMORY[0x263F08320];
    v113 = objc_msgSend_stringWithFormat_(NSString, v111, @"CTParseCertificateSet parse failed %d", v112, v39);
    v138 = v113;
    v115 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v114, (uint64_t)&v138, (uint64_t)&v137, 1);
    v108 = objc_msgSend_errorWithDomain_code_userInfo_(v110, v116, @"com.apple.corerepair", -41, v115);

    id v41 = 0;
LABEL_50:

    if (!a3) {
      goto LABEL_52;
    }
    goto LABEL_51;
  }
  v40 = objc_msgSend_objectAtIndexedSubscript_(self->certificates, v37, 0, v38);
  id v41 = (id)SecCertificateCopyExtensionValue();

  v42 = handleForCategory(0);
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v140 = (uint64_t)v41;
    _os_log_impl(&dword_21FBF2000, v42, OS_LOG_TYPE_DEFAULT, "caaOIDDer:%@", buf, 0xCu);
  }

  if (!v41 || !objc_msgSend_length(v41, v43, v44, v45))
  {
    v117 = handleForCategory(0);
    if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FBF2000, v117, OS_LOG_TYPE_DEFAULT, "CAA oid missing from the cert", buf, 2u);
    }

    v118 = (void *)MEMORY[0x263F087E8];
    uint64_t v135 = *MEMORY[0x263F08320];
    v136 = @"CAA oid missing from the cert";
    v113 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v119, (uint64_t)&v136, (uint64_t)&v135, 1);
    v108 = objc_msgSend_errorWithDomain_code_userInfo_(v118, v120, @"com.apple.corerepair", -41, v113);
    goto LABEL_50;
  }
  id v41 = v41;
  uint64_t v131 = objc_msgSend_bytes(v41, v46, v47, v48);
  uint64_t v132 = objc_msgSend_length(v41, v49, v50, v51);
  if (!sub_21FC53678((unint64_t *)&v131, v134) && !sub_21FC536A4(v134, &v127))
  {
    uint64_t v131 = v128;
    uint64_t v132 = v129;
    sub_21FC53678((unint64_t *)&v131, v133);
    while (!sub_21FC536A4(v133, &v124))
    {
      uint64_t v131 = v125;
      uint64_t v132 = v126;
      sub_21FC53678((unint64_t *)&v131, v134);
      if (!sub_21FC536A4(v134, &v127))
      {
        id v55 = objc_alloc(MEMORY[0x263EFF8F8]);
        uint64_t v57 = objc_msgSend_initWithBytes_length_(v55, v56, v128, v129);
        if (v127 == 0xA0000000000005DCLL)
        {
          id v58 = [NSString alloc];
          v60 = objc_msgSend_initWithData_encoding_(v58, v59, (uint64_t)v57, 4);
          v64 = v60;
          if (v60 && (unint64_t)objc_msgSend_length(v60, v61, v62, v63) >= 3)
          {
            uint64_t v67 = objc_msgSend_substringFromIndex_(v64, v65, 2, v66);

            v64 = (void *)v67;
          }
          if (!sub_21FC536A4(v134, &v127))
          {
            v123 = v57;
            do
            {
              id v68 = objc_alloc(MEMORY[0x263EFF8F8]);
              v70 = objc_msgSend_initWithBytes_length_(v68, v69, v128, v129);
              v74 = v70;
              BOOL v75 = v127 != 0xA0000000000005E3 || v70 == 0;
              if (v75 || (unint64_t)objc_msgSend_length(v70, v71, v72, v73) < 3)
              {
                v81 = v74;
              }
              else
              {
                uint64_t v79 = objc_msgSend_length(v74, v76, v77, v78);
                v81 = objc_msgSend_subdataWithRange_(v74, v80, 2, v79 - 2);

                id v82 = [NSString alloc];
                v84 = objc_msgSend_initWithData_encoding_(v82, v83, (uint64_t)v81, 4);
                uint64_t v88 = objc_msgSend_longLongValue(v84, v85, v86, v87) % 10000000000000;

                if (v88 >= 0xDC6ACFAC01)
                {
                  v92 = objc_msgSend_date(MEMORY[0x263EFF910], v89, v90, v91);
                  objc_msgSend_timeIntervalSince1970(v92, v93, v94, v95);
                  double v97 = v96 * 1000.0;

                  if (v97 > (double)v88)
                  {
                    id v98 = objc_alloc(MEMORY[0x263EFF910]);
                    v104 = objc_msgSend_initWithTimeIntervalSince1970_(v98, v99, v100, v101, (double)v88 / 1000.0);
                    if (v104) {
                      BOOL v105 = v64 == 0;
                    }
                    else {
                      BOOL v105 = 1;
                    }
                    if (!v105)
                    {
                      v106 = objc_msgSend_stringFromDate_(v6, v102, (uint64_t)v104, v103);
                      objc_msgSend_setObject_forKeyedSubscript_(v5, v107, (uint64_t)v106, (uint64_t)v64);
                    }
                  }
                }
              }
            }
            while (!sub_21FC536A4(v134, &v127));
            uint64_t v57 = v123;
          }
        }
        else
        {
          v64 = 0;
        }
      }
    }
  }
  v108 = 0;
  if (a3) {
LABEL_51:
  }
    *a3 = v108;
LABEL_52:
  v121 = objc_msgSend_copy(v5, v52, v53, v54);

  return v121;
}

- (id)copyCertificatePEMWithError:(id *)a3
{
  v52[1] = *MEMORY[0x263EF8340];
  v5 = objc_opt_new();
  id v6 = NSString;
  objc_msgSend_objectAtIndexedSubscript_(self->certificates, v7, 0, v8);
  uint64_t v9 = (__SecCertificate *)objc_claimAutoreleasedReturnValue();
  CFDataRef v10 = SecCertificateCopyData(v9);
  v13 = objc_msgSend_base64EncodedStringWithOptions_(v10, v11, 1, v12);
  uint64_t v16 = objc_msgSend_stringWithFormat_(v6, v14, @"-----BEGIN CERTIFICATE-----\n%@\n-----END CERTIFICATE-----\n", v15, v13);
  uint64_t v19 = objc_msgSend_dataUsingEncoding_(v16, v17, 4, v18);

  if (!v19)
  {
    v40 = handleForCategory(0);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      sub_21FC625E8();
    }

    id v41 = (void *)MEMORY[0x263F087E8];
    uint64_t v51 = *MEMORY[0x263F08320];
    v52[0] = @"Failed to create certificatePEM";
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v42, (uint64_t)v52, (uint64_t)&v51, 1);
    goto LABEL_12;
  }
  objc_msgSend_appendData_(v5, v20, (uint64_t)v19, v21);
  CFDataRef v22 = NSString;
  objc_msgSend_objectAtIndexedSubscript_(self->certificates, v23, 1, v24);
  uint64_t v25 = (__SecCertificate *)objc_claimAutoreleasedReturnValue();
  CFDataRef v26 = SecCertificateCopyData(v25);
  uint64_t v29 = objc_msgSend_base64EncodedStringWithOptions_(v26, v27, 1, v28);
  v32 = objc_msgSend_stringWithFormat_(v22, v30, @"-----BEGIN CERTIFICATE-----\n%@\n-----END CERTIFICATE-----\n", v31, v29);
  uint64_t v35 = objc_msgSend_dataUsingEncoding_(v32, v33, 4, v34);

  if (!v35)
  {
    v43 = handleForCategory(0);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
      sub_21FC625E8();
    }

    id v41 = (void *)MEMORY[0x263F087E8];
    uint64_t v49 = *MEMORY[0x263F08320];
    uint64_t v50 = @"Failed to create certificatePEM";
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v44, (uint64_t)&v50, (uint64_t)&v49, 1);
    uint64_t v38 = LABEL_12:;
    uint64_t v39 = objc_msgSend_errorWithDomain_code_userInfo_(v41, v45, @"com.apple.corerepair", -43, v38);
    uint64_t v35 = 0;
    v5 = 0;
    goto LABEL_13;
  }
  objc_msgSend_appendData_(v5, v36, (uint64_t)v35, v37);
  uint64_t v38 = handleForCategory(0);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FBF2000, v38, OS_LOG_TYPE_DEFAULT, "Successfully created PEM", buf, 2u);
  }
  uint64_t v39 = 0;
LABEL_13:

  if (a3) {
    *a3 = v39;
  }
  id v46 = v5;

  return v46;
}

- (__SecKey)referenceKey
{
  return self->referenceKey;
}

- (void)setReferenceKey:(__SecKey *)a3
{
  self->referenceKey = a3;
}

- (NSArray)certificates
{
  return self->certificates;
}

- (void)setCertificates:(id)a3
{
}

- (int64_t)certifcateType
{
  return self->certifcateType;
}

- (void)setCertifcateType:(int64_t)a3
{
  self->certifcateType = a3;
}

- (void).cxx_destruct
{
}

@end