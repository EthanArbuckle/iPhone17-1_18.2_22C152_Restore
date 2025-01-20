@interface MTRDeviceControllerStartupParamsInternal
- (BOOL)advertiseOperational;
- (BOOL)allowMultipleControllersPerFabric;
- (BOOL)keypairsMatchCertificates;
- (MTRDeviceControllerStartupParamsInternal)initWithParams:(id)a3;
- (MTRDeviceControllerStorageDelegate)storageDelegate;
- (NSArray)certificationDeclarationCertificates;
- (NSArray)productAttestationAuthorityCertificates;
- (OS_dispatch_queue)storageDelegateQueue;
- (OperationalKeystore)keystore;
- (Optional<unsigned)fabricIndex;
- (id).cxx_construct;
- (id)initForExistingFabric:(void *)a3 fabricIndex:(unsigned __int8)a4 keystore:(OperationalKeystore *)a5 advertiseOperational:(BOOL)a6 params:(id)a7;
- (id)initForNewController:(id)a3 fabricTable:(void *)a4 keystore:(OperationalKeystore *)a5 advertiseOperational:(BOOL)a6 params:(id)a7 error:(ChipError *)a8;
- (id)initForNewFabric:(void *)a3 keystore:(OperationalKeystore *)a4 advertiseOperational:(BOOL)a5 params:(id)a6;
- (void)fabricTable;
- (void)setCertificationDeclarationCertificates:(id)a3;
- (void)setProductAttestationAuthorityCertificates:(id)a3;
@end

@implementation MTRDeviceControllerStartupParamsInternal

- (MTRDeviceControllerStartupParamsInternal)initWithParams:(id)a3
{
  id v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)MTRDeviceControllerStartupParamsInternal;
  v5 = [(MTRDeviceControllerStartupParams *)&v45 initWithParams:v4];
  v6 = v5;
  if (!v5) {
    goto LABEL_33;
  }
  storageDelegate = v5->_storageDelegate;
  v5->_storageDelegate = 0;

  storageDelegateQueue = v6->_storageDelegateQueue;
  v6->_storageDelegateQueue = 0;

  v11 = objc_msgSend_nocSigner(v6, v9, v10);
  if (v11)
  {
  }
  else
  {
    v16 = objc_msgSend_rootCertificate(v6, v12, v13);

    if (!v16)
    {
      v39 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v44 = 0;
        _os_log_impl(&dword_2446BD000, v39, OS_LOG_TYPE_ERROR, "nocSigner and rootCertificate are both nil; no public key available to identify the fabric",
          v44,
          2u);
      }

      if (!sub_244CC4E58(1u)) {
        goto LABEL_33;
      }
      goto LABEL_32;
    }
  }
  v19 = objc_msgSend_operationalCertificate(v6, v14, v15);
  if (v19)
  {
    v20 = objc_msgSend_nodeID(v6, v17, v18);

    if (v20)
    {
      v21 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v44 = 0;
        _os_log_impl(&dword_2446BD000, v21, OS_LOG_TYPE_ERROR, "nodeID must be nil if operationalCertificate is not nil", v44, 2u);
      }

      if (!sub_244CC4E58(1u)) {
        goto LABEL_33;
      }
      goto LABEL_32;
    }
  }
  v24 = objc_msgSend_caseAuthenticatedTags(v6, v17, v18);
  if (v24)
  {
    v25 = objc_msgSend_nodeID(v6, v22, v23);

    if (!v25)
    {
      v40 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v44 = 0;
        _os_log_impl(&dword_2446BD000, v40, OS_LOG_TYPE_ERROR, "caseAuthenticatedTags must be nil if nodeID is nil", v44, 2u);
      }

      if (!sub_244CC4E58(1u)) {
        goto LABEL_33;
      }
      goto LABEL_32;
    }
  }
  v26 = objc_msgSend_operationalCertificate(v6, v22, v23);

  if (v26)
  {
    v29 = objc_msgSend_operationalKeypair(v6, v27, v28);

    if (v29)
    {
      v32 = objc_msgSend_operationalKeypair(v6, v30, v31);
      v35 = objc_msgSend_operationalCertificate(v6, v33, v34);
      char v37 = objc_msgSend_keypair_matchesCertificate_(MTRCertificates, v36, (uint64_t)v32, v35);

      if (v37) {
        goto LABEL_16;
      }
      v42 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v44 = 0;
        _os_log_impl(&dword_2446BD000, v42, OS_LOG_TYPE_ERROR, "operationalKeypair public key does not match operationalCertificate", v44, 2u);
      }

      if (!sub_244CC4E58(1u)) {
        goto LABEL_33;
      }
    }
    else
    {
      v41 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v44 = 0;
        _os_log_impl(&dword_2446BD000, v41, OS_LOG_TYPE_ERROR, "Must have an operational keypair if an operational certificate is provided", v44, 2u);
      }

      if (!sub_244CC4E58(1u)) {
        goto LABEL_33;
      }
    }
LABEL_32:
    sub_244CC4DE0(0, 1);
LABEL_33:
    v38 = 0;
    goto LABEL_34;
  }
LABEL_16:
  v38 = v6;
LABEL_34:

  return v38;
}

- (id)initForNewFabric:(void *)a3 keystore:(OperationalKeystore *)a4 advertiseOperational:(BOOL)a5 params:(id)a6
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v10 = a6;
  v12 = objc_msgSend_initWithParams_(self, v11, (uint64_t)v10);
  uint64_t v15 = v12;
  if (!v12)
  {
LABEL_20:
    id v31 = 0;
    goto LABEL_21;
  }
  v16 = objc_msgSend_nocSigner(v12, v13, v14);
  if (v16)
  {
  }
  else
  {
    v21 = objc_msgSend_operationalCertificate(v15, v17, v18);

    if (!v21)
    {
      v43 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2446BD000, v43, OS_LOG_TYPE_ERROR, "No way to get an operational certificate: nocSigner and operationalCertificate are both nil", buf, 2u);
      }

      if (sub_244CC4E58(1u)) {
        sub_244CC4DE0(0, 1);
      }
      goto LABEL_20;
    }
  }
  v24 = objc_msgSend_operationalCertificate(v15, v19, v20);
  if (!v24)
  {
    v27 = objc_msgSend_nodeID(v15, v22, v23);

    if (v27) {
      goto LABEL_8;
    }
    uint32_t v45 = arc4random();
    uint32_t v46 = arc4random();
    v24 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v47, (v46 >> 1) | ((unint64_t)v45 << 31));
    objc_msgSend_setNodeID_(v15, v48, (uint64_t)v24);
  }

LABEL_8:
  uint64_t v28 = objc_msgSend_rootCertificate(v15, v25, v26);

  if (!v28)
  {
    v32 = objc_msgSend_nocSigner(v15, v29, v30);
    v35 = objc_msgSend_fabricID(v15, v33, v34);
    id v51 = 0;
    char v37 = objc_msgSend_createRootCertificate_issuerID_fabricID_error_(MTRCertificates, v36, (uint64_t)v32, 0, v35, &v51);
    id v38 = v51;
    objc_msgSend_setRootCertificate_(v15, v39, (uint64_t)v37);

    if (v38
      || (objc_msgSend_rootCertificate(v15, v40, v41),
          v49 = objc_claimAutoreleasedReturnValue(),
          BOOL v50 = v49 == 0,
          v49,
          v50))
    {
      v42 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v53 = v38;
        _os_log_impl(&dword_2446BD000, v42, OS_LOG_TYPE_ERROR, "Failed to generate root certificate: %@", buf, 0xCu);
      }

      if (sub_244CC4E58(1u)) {
        sub_244CC4DE0(0, 1);
      }

      goto LABEL_20;
    }
  }
  *((void *)v15 + 15) = a3;
  *((void *)v15 + 16) = a4;
  *((unsigned char *)v15 + 112) = a5;
  *((unsigned char *)v15 + 113) = 0;
  id v31 = v15;
LABEL_21:

  return v31;
}

- (id)initForExistingFabric:(void *)a3 fabricIndex:(unsigned __int8)a4 keystore:(OperationalKeystore *)a5 advertiseOperational:(BOOL)a6 params:(id)a7
{
  int v9 = a4;
  uint64_t v119 = *MEMORY[0x263EF8340];
  id v12 = a7;
  uint64_t v14 = objc_msgSend_initWithParams_(self, v13, (uint64_t)v12);
  if (!v14) {
    goto LABEL_80;
  }
  uint64_t v15 = sub_244D9EA90((uint64_t)a3, v9);
  uint64_t v18 = objc_msgSend_vendorID((void *)v14, v16, v17);

  if (!v18)
  {
    v21 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v19, *(unsigned __int16 *)(v15 + 138));
    objc_msgSend_setVendorID_((void *)v14, v22, (uint64_t)v21);
  }
  uint64_t v23 = objc_msgSend_operationalCertificate((void *)v14, v19, v20);
  if (v23)
  {

LABEL_7:
    int v28 = 0;
    goto LABEL_8;
  }
  uint64_t v26 = objc_msgSend_nodeID((void *)v14, v24, v25);

  if (v26) {
    goto LABEL_7;
  }
  uint64_t v34 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v27, *(void *)v15);
  objc_msgSend_setNodeID_((void *)v14, v35, (uint64_t)v34);

  *(void *)&long long buf = v118;
  *((void *)&buf + 1) = 400;
  long long v113 = 0uLL;
  uint64_t v114 = 0;
  sub_244D9EF98((uint64_t)a3, *(unsigned __int8 *)(v15 + 137), (uint64_t)&buf, (uint64_t)&v113);
  if (v113)
  {
    id v38 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      long long v111 = v113;
      uint64_t v112 = v114;
      v39 = sub_244CB7B34((const char **)&v111, 1);
      *(_DWORD *)v115 = 136315138;
      *(void *)&v115[4] = v39;
      _os_log_impl(&dword_2446BD000, v38, OS_LOG_TYPE_ERROR, "Failed to get existing NOC: %s", v115, 0xCu);
    }

    if (!sub_244CC4E58(1u)) {
      goto LABEL_80;
    }
    long long v109 = v113;
    uint64_t v110 = v114;
    sub_244CB7B34((const char **)&v109, 1);
    goto LABEL_21;
  }
  v57 = objc_msgSend_operationalKeypair((void *)v14, v36, v37);
  BOOL v58 = v57 == 0;

  if (v58)
  {
    sub_2446C1098(v115, buf, *((uint64_t *)&buf + 1));
    v76 = sub_244B2A68C((uint64_t)v115);
    objc_msgSend_setOperationalCertificate_((void *)v14, v77, (uint64_t)v76);

    v80 = objc_msgSend_operationalCertificate((void *)v14, v78, v79);
    LODWORD(v76) = v80 == 0;

    if (v76)
    {
      v86 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
      {
        long long v107 = v113;
        uint64_t v108 = v114;
        v87 = sub_244CB7B34((const char **)&v107, 1);
        *(_DWORD *)v115 = 136315138;
        *(void *)&v115[4] = v87;
        _os_log_impl(&dword_2446BD000, v86, OS_LOG_TYPE_ERROR, "Failed to convert TLV NOC to DER X.509: %s", v115, 0xCu);
      }

      if (!sub_244CC4E58(1u)) {
        goto LABEL_80;
      }
      long long v105 = v113;
      uint64_t v106 = v114;
      sub_244CB7B34((const char **)&v105, 1);
LABEL_21:
      sub_244CC4DE0(0, 1);
LABEL_80:
      id v65 = 0;
      goto LABEL_81;
    }
    if (((*((uint64_t (**)(OperationalKeystore *, void))a5->var0 + 3))(a5, *(unsigned __int8 *)(v15 + 137)) & 1) == 0)
    {
      v81 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v115 = 0;
        _os_log_impl(&dword_2446BD000, v81, OS_LOG_TYPE_ERROR, "No existing operational key for fabric", v115, 2u);
      }

      if (sub_244CC4E58(1u)) {
        sub_244CC4DE0(0, 1);
      }
      goto LABEL_80;
    }
  }
  int v103 = 0;
  uint64_t v104 = 0;
  sub_2446C1098(v102, buf, *((uint64_t *)&buf + 1));
  sub_244D93E48((uint64_t)v102, (uint64_t)&v103, v115);
  long long v113 = *(_OWORD *)v115;
  uint64_t v114 = v116;
  if (*(_DWORD *)v115)
  {
    v60 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      long long v100 = v113;
      uint64_t v101 = v114;
      v61 = sub_244CB7B34((const char **)&v100, 1);
      *(_DWORD *)v115 = 136315138;
      *(void *)&v115[4] = v61;
      _os_log_impl(&dword_2446BD000, v60, OS_LOG_TYPE_ERROR, "Failed to extract existing CATs: %s", v115, 0xCu);
    }

    if (sub_244CC4E58(1u))
    {
      long long v98 = v113;
      uint64_t v99 = v114;
      sub_244CB7B34((const char **)&v98, 1);
      sub_244CC4DE0(0, 1);
    }
    goto LABEL_80;
  }
  uint64_t v82 = 0;
  uint64_t v83 = 0;
  do
  {
    if (*(int *)((char *)&v103 + v82)) {
      ++v83;
    }
    v82 += 4;
  }
  while (v82 != 12);
  if (v83)
  {
    v84 = sub_244B2BCCC((uint64_t)&v103);
    objc_msgSend_setCaseAuthenticatedTags_((void *)v14, v85, (uint64_t)v84);
  }
  else
  {
    objc_msgSend_setCaseAuthenticatedTags_((void *)v14, v59, 0);
  }
  int v28 = 1;
LABEL_8:
  *(void *)v115 = v118;
  *(void *)&v115[8] = 400;
  long long v113 = 0uLL;
  uint64_t v114 = 0;
  sub_244D9ED74((uint64_t)a3, *(unsigned __int8 *)(v15 + 137), (uint64_t)v115, (uint64_t)&v113);
  if (v113)
  {
    uint64_t v30 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      long long v96 = v113;
      uint64_t v97 = v114;
      id v31 = sub_244CB7B34((const char **)&v96, 1);
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = v31;
      _os_log_impl(&dword_2446BD000, v30, OS_LOG_TYPE_ERROR, "Failed to get existing intermediate certificate: %s", (uint8_t *)&buf, 0xCu);
    }

    if (sub_244CC4E58(1u))
    {
      long long v94 = v113;
      uint64_t v95 = v114;
      sub_244CB7B34((const char **)&v94, 1);
      sub_244CC4DE0(0, 1);
    }
    goto LABEL_80;
  }
  uint64_t v32 = *(void *)&v115[8];
  if (*(void *)&v115[8])
  {
    sub_2446C1098(&buf, *(uint64_t *)v115, *(uint64_t *)&v115[8]);
    uint64_t v33 = sub_244B2A68C((uint64_t)&buf);
    if (!v33) {
      goto LABEL_80;
    }
  }
  else
  {
    uint64_t v33 = 0;
  }
  v89 = (void *)v33;
  v42 = objc_msgSend_nocSigner((void *)v14, v29, v32);
  if (v42)
  {
    v43 = objc_msgSend_intermediateCertificate((void *)v14, v40, v41);
    BOOL v44 = v43 || v89 == 0;
    BOOL v45 = !v44;

    if (v45)
    {
      uint32_t v46 = objc_msgSend_nocSigner((void *)v14, v40, v41);
      int v48 = objc_msgSend_keypair_matchesCertificate_(MTRCertificates, v47, (uint64_t)v46, v89);

      if (v48) {
        objc_msgSend_setIntermediateCertificate_((void *)v14, v40, (uint64_t)v89);
      }
    }
  }
  if (!v28) {
    goto LABEL_47;
  }
  v49 = objc_msgSend_intermediateCertificate((void *)v14, v40, v41);
  v52 = v49;
  if ((v89 != 0) == (v49 == 0))
  {

    goto LABEL_39;
  }
  if (!v89)
  {

    goto LABEL_47;
  }
  id v53 = objc_msgSend_intermediateCertificate((void *)v14, v50, v51);
  char isCertificate_equalTo = objc_msgSend_isCertificate_equalTo_(MTRCertificates, v54, (uint64_t)v89, v53);

  if ((isCertificate_equalTo & 1) == 0) {
LABEL_39:
  }
    objc_msgSend_setOperationalCertificate_((void *)v14, v56, 0);
LABEL_47:
  *(void *)v115 = v118;
  *(void *)&v115[8] = 400;
  long long v113 = 0uLL;
  uint64_t v114 = 0;
  sub_244D9E6A4((uint64_t)a3, *(unsigned __int8 *)(v15 + 137), (uint64_t)v115, (uint64_t)&v113);
  if (v113)
  {
    v62 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      long long v92 = v113;
      uint64_t v93 = v114;
      v63 = sub_244CB7B34((const char **)&v92, 1);
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = v63;
      _os_log_impl(&dword_2446BD000, v62, OS_LOG_TYPE_ERROR, "Failed to get existing root certificate: %s", (uint8_t *)&buf, 0xCu);
    }

    if (sub_244CC4E58(1u))
    {
      long long v90 = v113;
      uint64_t v91 = v114;
      sub_244CB7B34((const char **)&v90, 1);
      sub_244CC4DE0(0, 1);
    }
    v64 = 0;
  }
  else
  {
    sub_2446C1098(&buf, *(uint64_t *)v115, *(uint64_t *)&v115[8]);
    v64 = sub_244B2A68C((uint64_t)&buf);
    if (v64)
    {
      v68 = objc_msgSend_rootCertificate((void *)v14, v66, v67);
      BOOL v69 = v68 == 0;

      if (v69)
      {
        objc_msgSend_setRootCertificate_((void *)v14, v70, (uint64_t)v64);
      }
      else
      {
        v72 = objc_msgSend_rootCertificate((void *)v14, v70, v71);
        int v74 = objc_msgSend_isCertificate_equalTo_(MTRCertificates, v73, (uint64_t)v64, v72);

        if ((v74 & 1) == 0)
        {
          v75 = sub_244CC8484(0, "NotSpecified");
          if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v118 = 0;
            _os_log_impl(&dword_2446BD000, v75, OS_LOG_TYPE_ERROR, "Root certificate identity does not match existing root certificate", v118, 2u);
          }

          if (sub_244CC4E58(1u)) {
            sub_244CC4DE0(0, 1);
          }
          goto LABEL_53;
        }
      }
      *(void *)(v14 + 120) = a3;
      *(unsigned char *)(v14 + 114) = 1;
      *(unsigned char *)(v14 + 115) = v9;
      *(void *)(v14 + 128) = a5;
      *(unsigned char *)(v14 + 112) = a6;
      *(unsigned char *)(v14 + 113) = 0;
      id v65 = (id)v14;
      goto LABEL_54;
    }
  }
LABEL_53:
  id v65 = 0;
LABEL_54:

LABEL_81:
  return v65;
}

- (id)initForNewController:(id)a3 fabricTable:(void *)a4 keystore:(OperationalKeystore *)a5 advertiseOperational:(BOOL)a6 params:(id)a7 error:(ChipError *)a8
{
  v111[10] = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a7;
  v103.receiver = self;
  v103.super_class = (Class)MTRDeviceControllerStartupParamsInternal;
  v16 = [(MTRDeviceControllerStartupParams *)&v103 initWithParameters:v15 error:a8];
  v19 = v16;
  if (v16)
  {
    v111[0] = &unk_26F954540;
    objc_msgSend_rootCertificate(v16, v17, v18);
    id v20 = objc_claimAutoreleasedReturnValue();
    uint64_t v23 = objc_msgSend_bytes(v20, v21, v22);
    uint64_t v26 = objc_msgSend_length(v20, v24, v25);
    sub_2446C1098(buf, v23, v26);

    long long v102 = *(_OWORD *)buf;
    sub_244CEF4D0((uint64_t *)&v102, (uint64_t)v111, (uint64_t)v104);
    *(_OWORD *)&a8->mError = *(_OWORD *)v104;
    *(void *)&a8->mLine = v105;

    if (a8->mError)
    {
      v29 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_OWORD *)uint64_t v104 = *(_OWORD *)&a8->mError;
        uint64_t v105 = *(void *)&a8->mLine;
        uint64_t v30 = sub_244CB7B34((const char **)v104, 1);
        *(_DWORD *)long long buf = 136315138;
        *(void *)&uint8_t buf[4] = v30;
        _os_log_impl(&dword_2446BD000, v29, OS_LOG_TYPE_ERROR, "Can't extract public key from root certificate: %s", buf, 0xCu);
      }

      if (sub_244CC4E58(1u))
      {
        *(_OWORD *)uint64_t v104 = *(_OWORD *)&a8->mError;
        uint64_t v105 = *(void *)&a8->mLine;
        sub_244CB7B34((const char **)v104, 1);
        sub_244CC4DE0(0, 1);
      }
      goto LABEL_7;
    }
    uint64_t v32 = objc_msgSend_operationalCertificate(v19, v27, v28);
    id v101 = 0;
    sub_244B2B594((uint64_t)v32, (char *)&v101, buf, (uint64_t)v104);
    id v33 = v101;
    *(_OWORD *)&a8->mError = *(_OWORD *)v104;
    *(void *)&a8->mLine = v105;

    if (a8->mError)
    {
      id v31 = 0;
LABEL_45:

      goto LABEL_46;
    }
    v36 = objc_msgSend_fabricID(v19, v34, v35);
    uint64_t v39 = objc_msgSend_unsignedLongLongValue(v36, v37, v38);
    uint64_t v42 = objc_msgSend_unsignedLongLongValue(v33, v40, v41);
    LOBYTE(v39) = sub_244D9EA08((uint64_t)a4, (uint64_t)v111, v39, v42) == 0;

    if ((v39 & 1) == 0)
    {
      BOOL v45 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v104 = 0;
        _os_log_impl(&dword_2446BD000, v45, OS_LOG_TYPE_ERROR, "Trying to start a controller identity that is already running", v104, 2u);
      }

      if (sub_244CC4E58(1u)) {
        sub_244CC4DE0(0, 1);
      }
      id v31 = 0;
      a8->mError = 47;
      a8->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDevic"
                  "eControllerStartupParams.mm";
      a8->mLine = 626;
      goto LABEL_45;
    }
    uint32_t v46 = objc_msgSend_controllerDataStore(v14, v43, v44);
    v49 = objc_msgSend_fetchLastLocallyUsedNOC(v46, v47, v48);

    if (v49)
    {
      id v52 = v49;
      uint64_t v55 = objc_msgSend_bytes(v52, v53, v54);
      uint64_t v58 = objc_msgSend_length(v52, v56, v57);
      sub_2446C1098(v104, v55, v58);

      long long v102 = *(_OWORD *)v104;
      uint64_t v99 = 0;
      uint64_t v100 = 0;
      memset(buf, 0, sizeof(buf));
      uint64_t v110 = 0;
      sub_244D93CC0((uint64_t)&v102, &v99, &v100, buf);
      if (*(_DWORD *)buf)
      {
        v59 = sub_244CC8484(0, "NotSpecified");
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        {
          *(_OWORD *)uint64_t v104 = *(_OWORD *)buf;
          uint64_t v105 = v110;
          v60 = sub_244CB7B34((const char **)v104, 1);
          LODWORD(v108) = 136315138;
          *(void *)((char *)&v108 + 4) = v60;
          _os_log_impl(&dword_2446BD000, v59, OS_LOG_TYPE_ERROR, "Unable to extract node ID and fabric ID from old operational certificate: %s", (uint8_t *)&v108, 0xCu);
        }

        if (sub_244CC4E58(1u))
        {
          *(_OWORD *)uint64_t v104 = *(_OWORD *)buf;
          uint64_t v105 = v110;
          sub_244CB7B34((const char **)v104, 1);
          sub_244CC4DE0(0, 1);
        }
        goto LABEL_34;
      }
      int v97 = 0;
      uint64_t v98 = 0;
      sub_244D93E48((uint64_t)&v102, (uint64_t)&v97, v104);
      *(_OWORD *)long long buf = *(_OWORD *)v104;
      uint64_t v110 = v105;
      if (*(_DWORD *)v104)
      {
        v63 = sub_244CC8484(0, "NotSpecified");
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        {
          *(_OWORD *)uint64_t v104 = *(_OWORD *)buf;
          uint64_t v105 = v110;
          v64 = sub_244CB7B34((const char **)v104, 1);
          LODWORD(v108) = 136315138;
          *(void *)((char *)&v108 + 4) = v64;
          _os_log_impl(&dword_2446BD000, v63, OS_LOG_TYPE_ERROR, "Failed to extract CATs from old operational certificate: %s", (uint8_t *)&v108, 0xCu);
        }

        if (sub_244CC4E58(1u))
        {
          *(_OWORD *)uint64_t v104 = *(_OWORD *)buf;
          uint64_t v105 = v110;
          sub_244CB7B34((const char **)v104, 1);
          sub_244CC4DE0(0, 1);
        }
        goto LABEL_34;
      }
      id v65 = objc_msgSend_operationalCertificate(v19, v61, v62);
      uint64_t v67 = objc_msgSend_convertX509Certificate_(MTRCertificates, v66, (uint64_t)v65);

      if (!v67)
      {
LABEL_34:
        id v31 = 0;
LABEL_44:

        goto LABEL_45;
      }
      *(void *)&long long v108 = sub_2447E4CFC(v67);
      *((void *)&v108 + 1) = v68;
      int v95 = 0;
      uint64_t v96 = 0;
      sub_244D93E48((uint64_t)&v108, (uint64_t)&v95, v104);
      *(_OWORD *)long long buf = *(_OWORD *)v104;
      uint64_t v110 = v105;
      if (*(_DWORD *)v104)
      {
        uint64_t v71 = sub_244CC8484(0, "NotSpecified");
        if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
        {
          *(_OWORD *)uint64_t v104 = *(_OWORD *)buf;
          uint64_t v105 = v110;
          v72 = sub_244CB7B34((const char **)v104, 1);
          *(_DWORD *)uint64_t v106 = 136315138;
          long long v107 = v72;
          _os_log_impl(&dword_2446BD000, v71, OS_LOG_TYPE_ERROR, "Failed to extract CATs from new operational certificate: %s", v106, 0xCu);
        }

        if (sub_244CC4E58(1u))
        {
          *(_OWORD *)uint64_t v104 = *(_OWORD *)buf;
          uint64_t v105 = v110;
          sub_244CB7B34((const char **)v104, 1);
          sub_244CC4DE0(0, 1);
        }

        goto LABEL_34;
      }
      uint64_t v73 = objc_msgSend_unsignedLongLongValue(v33, v69, v70);
      if (v73 != v99 || !sub_244B2B7E8((uint64_t)&v97, (uint64_t)&v95))
      {
        int v74 = sub_244CC8484(0, "NotSpecified");
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v104 = 0;
          _os_log_impl(&dword_2446BD000, v74, OS_LOG_TYPE_DEFAULT, "Node ID or CATs changed.  Clearing CASE resumption storage.", v104, 2u);
        }

        if (sub_244CC4E58(2u)) {
          sub_244CC4DE0(0, 2);
        }
        v77 = objc_msgSend_controllerDataStore(v14, v75, v76);
        objc_msgSend_clearAllResumptionInfo(v77, v78, v79);
      }
    }
    v19->_fabricTable = a4;
    v19->_keystore = a5;
    v19->_advertiseOperational = a6;
    v19->_allowMultipleControllersPerFabric = 1;
    uint64_t v80 = objc_msgSend_storageDelegate(v15, v50, v51);
    storageDelegate = v19->_storageDelegate;
    v19->_storageDelegate = (MTRDeviceControllerStorageDelegate *)v80;

    uint64_t v84 = objc_msgSend_storageDelegateQueue(v15, v82, v83);
    storageDelegateQueue = v19->_storageDelegateQueue;
    v19->_storageDelegateQueue = (OS_dispatch_queue *)v84;

    uint64_t v88 = objc_msgSend_productAttestationAuthorityCertificates(v15, v86, v87);
    productAttestationAuthorityCertificates = v19->_productAttestationAuthorityCertificates;
    v19->_productAttestationAuthorityCertificates = (NSArray *)v88;

    uint64_t v92 = objc_msgSend_certificationDeclarationCertificates(v15, v90, v91);
    certificationDeclarationCertificates = v19->_certificationDeclarationCertificates;
    v19->_certificationDeclarationCertificates = (NSArray *)v92;

    id v31 = v19;
    goto LABEL_44;
  }
LABEL_7:
  id v31 = 0;
LABEL_46:

  return v31;
}

- (BOOL)keypairsMatchCertificates
{
  id v4 = objc_msgSend_nocSigner(self, a2, v2);

  if (v4)
  {
    int v9 = objc_msgSend_intermediateCertificate(self, v5, v6);
    if (v9 || (objc_msgSend_rootCertificate(self, v7, v8), (int v9 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v10 = objc_msgSend_nocSigner(self, v7, v8);
      char v12 = objc_msgSend_keypair_matchesCertificate_(MTRCertificates, v11, (uint64_t)v10, v9);

      if (v12)
      {

        goto LABEL_6;
      }
      v27 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_2446BD000, v27, OS_LOG_TYPE_ERROR, "Provided nocSigner does not match certificates", buf, 2u);
      }

      if (sub_244CC4E58(1u)) {
        sub_244CC4DE0(0, 1);
      }
    }
    else
    {
      v29 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v33 = 0;
        _os_log_impl(&dword_2446BD000, v29, OS_LOG_TYPE_ERROR, "No certificate to match nocSigner", v33, 2u);
      }

      int v9 = 0;
      if (sub_244CC4E58(1u)) {
        sub_244CC4DE0(0, 1);
      }
    }

    goto LABEL_23;
  }
LABEL_6:
  uint64_t v13 = objc_msgSend_operationalCertificate(self, v5, v6);
  if (!v13) {
    goto LABEL_9;
  }
  v16 = (void *)v13;
  uint64_t v17 = objc_msgSend_operationalKeypair(self, v14, v15);

  if (!v17
    || (objc_msgSend_operationalKeypair(self, v18, v19),
        id v20 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_operationalCertificate(self, v21, v22),
        uint64_t v23 = objc_claimAutoreleasedReturnValue(),
        char v25 = objc_msgSend_keypair_matchesCertificate_(MTRCertificates, v24, (uint64_t)v20, v23),
        v23,
        v20,
        (v25 & 1) != 0))
  {
LABEL_9:
    LOBYTE(v26) = 1;
    return v26;
  }
  uint64_t v28 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v31 = 0;
    _os_log_impl(&dword_2446BD000, v28, OS_LOG_TYPE_ERROR, "Provided operationalKeypair does not match operationalCertificate", v31, 2u);
  }

  BOOL v26 = sub_244CC4E58(1u);
  if (v26)
  {
    sub_244CC4DE0(0, 1);
LABEL_23:
    LOBYTE(v26) = 0;
  }
  return v26;
}

- (void)fabricTable
{
  return self->_fabricTable;
}

- (Optional<unsigned)fabricIndex
{
  BOOL mHasValue = self->_fabricIndex.mHasValue;
  *uint64_t v2 = mHasValue;
  if (mHasValue) {
    v2[1] = self->_fabricIndex.mValue.mData;
  }
  return (Optional<unsigned char>)self;
}

- (OperationalKeystore)keystore
{
  return self->_keystore;
}

- (BOOL)advertiseOperational
{
  return self->_advertiseOperational;
}

- (BOOL)allowMultipleControllersPerFabric
{
  return self->_allowMultipleControllersPerFabric;
}

- (NSArray)productAttestationAuthorityCertificates
{
  return self->_productAttestationAuthorityCertificates;
}

- (void)setProductAttestationAuthorityCertificates:(id)a3
{
}

- (NSArray)certificationDeclarationCertificates
{
  return self->_certificationDeclarationCertificates;
}

- (void)setCertificationDeclarationCertificates:(id)a3
{
}

- (MTRDeviceControllerStorageDelegate)storageDelegate
{
  return self->_storageDelegate;
}

- (OS_dispatch_queue)storageDelegateQueue
{
  return self->_storageDelegateQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storageDelegateQueue, 0);
  objc_storeStrong((id *)&self->_storageDelegate, 0);
  objc_storeStrong((id *)&self->_certificationDeclarationCertificates, 0);

  objc_storeStrong((id *)&self->_productAttestationAuthorityCertificates, 0);
}

- (id).cxx_construct
{
  *((unsigned char *)self + 114) = 0;
  return self;
}

@end