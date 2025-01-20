@interface MTRCertificates
+ (BOOL)isCertificate:(MTRCertificateDERBytes)certificate1 equalTo:(MTRCertificateDERBytes)certificate2;
+ (BOOL)keypair:(id)keypair matchesCertificate:(NSData *)certificate;
+ (MTRCSRDERBytes)createCertificateSigningRequest:(id)keypair error:(NSError *)error;
+ (MTRCertificateDERBytes)convertMatterCertificate:(MTRCertificateTLVBytes)matterCertificate;
+ (MTRCertificateDERBytes)createIntermediateCertificate:(id)rootKeypair rootCertificate:(MTRCertificateDERBytes)rootCertificate intermediatePublicKey:(SecKeyRef)intermediatePublicKey issuerID:(NSNumber *)issuerID fabricID:(NSNumber *)fabricID error:(NSError *)error;
+ (MTRCertificateDERBytes)createIntermediateCertificate:(id)rootKeypair rootCertificate:(MTRCertificateDERBytes)rootCertificate intermediatePublicKey:(SecKeyRef)intermediatePublicKey issuerID:(NSNumber *)issuerID fabricID:(NSNumber *)fabricID validityPeriod:(NSDateInterval *)validityPeriod error:(NSError *)error;
+ (MTRCertificateDERBytes)createOperationalCertificate:(id)signingKeypair signingCertificate:(MTRCertificateDERBytes)signingCertificate operationalPublicKey:(SecKeyRef)operationalPublicKey fabricID:(NSNumber *)fabricID nodeID:(NSNumber *)nodeID caseAuthenticatedTags:(NSSet *)caseAuthenticatedTags error:(NSError *)error;
+ (MTRCertificateDERBytes)createOperationalCertificate:(id)signingKeypair signingCertificate:(MTRCertificateDERBytes)signingCertificate operationalPublicKey:(SecKeyRef)operationalPublicKey fabricID:(NSNumber *)fabricID nodeID:(NSNumber *)nodeID caseAuthenticatedTags:(NSSet *)caseAuthenticatedTags validityPeriod:(NSDateInterval *)validityPeriod error:(NSError *)error;
+ (MTRCertificateDERBytes)createRootCertificate:(id)keypair issuerID:(NSNumber *)issuerID fabricID:(NSNumber *)fabricID error:(NSError *)error;
+ (MTRCertificateDERBytes)createRootCertificate:(id)keypair issuerID:(NSNumber *)issuerID fabricID:(NSNumber *)fabricID validityPeriod:(NSDateInterval *)validityPeriod error:(NSError *)error;
+ (MTRCertificateTLVBytes)convertX509Certificate:(MTRCertificateDERBytes)x509Certificate;
+ (NSData)generateCertificateSigningRequest:(id)keypair error:(NSError *)error;
+ (NSData)generateIntermediateCertificate:(id)rootKeypair rootCertificate:(NSData *)rootCertificate intermediatePublicKey:(SecKeyRef)intermediatePublicKey issuerId:(NSNumber *)issuerId fabricId:(NSNumber *)fabricId error:(NSError *)error;
+ (NSData)generateOperationalCertificate:(id)signingKeypair signingCertificate:(NSData *)signingCertificate operationalPublicKey:(SecKeyRef)operationalPublicKey fabricId:(NSNumber *)fabricId nodeId:(NSNumber *)nodeId caseAuthenticatedTags:(NSArray *)caseAuthenticatedTags error:(NSError *)error;
+ (NSData)generateRootCertificate:(id)keypair issuerId:(NSNumber *)issuerId fabricId:(NSNumber *)fabricId error:(NSError *)error;
+ (NSData)publicKeyFromCSR:(MTRCSRDERBytes)csr error:(NSError *)error;
@end

@implementation MTRCertificates

+ (MTRCertificateDERBytes)createRootCertificate:(id)keypair issuerID:(NSNumber *)issuerID fabricID:(NSNumber *)fabricID validityPeriod:(NSDateInterval *)validityPeriod error:(NSError *)error
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v11 = keypair;
  v12 = issuerID;
  v13 = fabricID;
  v14 = validityPeriod;
  v15 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2446BD000, v15, OS_LOG_TYPE_DEFAULT, "Generating root certificate", buf, 2u);
  }

  if (sub_244CC4E58(2u)) {
    sub_244CC4DE0(0, 2);
  }
  memset(buf, 0, sizeof(buf));
  uint64_t v28 = 0;
  id v26 = 0;
  sub_244BCD5CC(v11, v12, v13, v14, &v26, buf);
  id v16 = v26;
  if (error)
  {
    long long v24 = *(_OWORD *)buf;
    uint64_t v25 = v28;
    sub_244B26908((uint64_t)MTRError, &v24);
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
  if (*(_DWORD *)buf)
  {
    v17 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      long long v22 = *(_OWORD *)buf;
      uint64_t v23 = v28;
      v18 = sub_244CB7B34((const char **)&v22, 1);
      *(_DWORD *)v29 = 136315138;
      v30 = v18;
      _os_log_impl(&dword_2446BD000, v17, OS_LOG_TYPE_ERROR, "Generating root certificate failed: %s", v29, 0xCu);
    }

    if (sub_244CC4E58(1u))
    {
      long long v20 = *(_OWORD *)buf;
      uint64_t v21 = v28;
      sub_244CB7B34((const char **)&v20, 1);
      sub_244CC4DE0(0, 1);
    }
  }

  return (MTRCertificateDERBytes)v16;
}

+ (MTRCertificateDERBytes)createRootCertificate:(id)keypair issuerID:(NSNumber *)issuerID fabricID:(NSNumber *)fabricID error:(NSError *)error
{
  id v10 = keypair;
  id v11 = issuerID;
  v12 = fabricID;
  id v13 = objc_alloc(MEMORY[0x263F08798]);
  id v16 = objc_msgSend_now(MEMORY[0x263EFF910], v14, v15);
  v19 = objc_msgSend_distantFuture(MEMORY[0x263EFF910], v17, v18);
  started = objc_msgSend_initWithStartDate_endDate_(v13, v20, (uint64_t)v16, v19);

  uint64_t v23 = objc_msgSend_createRootCertificate_issuerID_fabricID_validityPeriod_error_(a1, v22, (uint64_t)v10, v11, v12, started, error);

  return (MTRCertificateDERBytes)v23;
}

+ (MTRCertificateDERBytes)createIntermediateCertificate:(id)rootKeypair rootCertificate:(MTRCertificateDERBytes)rootCertificate intermediatePublicKey:(SecKeyRef)intermediatePublicKey issuerID:(NSNumber *)issuerID fabricID:(NSNumber *)fabricID validityPeriod:(NSDateInterval *)validityPeriod error:(NSError *)error
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v14 = rootKeypair;
  uint64_t v15 = rootCertificate;
  id v16 = issuerID;
  v17 = fabricID;
  uint64_t v18 = validityPeriod;
  v19 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2446BD000, v19, OS_LOG_TYPE_DEFAULT, "Generating intermediate certificate", buf, 2u);
  }

  if (sub_244CC4E58(2u)) {
    sub_244CC4DE0(0, 2);
  }
  memset(buf, 0, sizeof(buf));
  uint64_t v32 = 0;
  id v30 = 0;
  sub_244BCDAEC(v14, v15, intermediatePublicKey, v16, v17, v18, &v30, buf);
  id v20 = v30;
  if (error)
  {
    long long v28 = *(_OWORD *)buf;
    uint64_t v29 = v32;
    sub_244B26908((uint64_t)MTRError, &v28);
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
  if (*(_DWORD *)buf)
  {
    uint64_t v21 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      long long v26 = *(_OWORD *)buf;
      uint64_t v27 = v32;
      long long v22 = sub_244CB7B34((const char **)&v26, 1);
      *(_DWORD *)v33 = 136315138;
      v34 = v22;
      _os_log_impl(&dword_2446BD000, v21, OS_LOG_TYPE_ERROR, "Generating intermediate certificate failed: %s", v33, 0xCu);
    }

    if (sub_244CC4E58(1u))
    {
      long long v24 = *(_OWORD *)buf;
      uint64_t v25 = v32;
      sub_244CB7B34((const char **)&v24, 1);
      sub_244CC4DE0(0, 1);
    }
  }

  return (MTRCertificateDERBytes)v20;
}

+ (MTRCertificateDERBytes)createIntermediateCertificate:(id)rootKeypair rootCertificate:(MTRCertificateDERBytes)rootCertificate intermediatePublicKey:(SecKeyRef)intermediatePublicKey issuerID:(NSNumber *)issuerID fabricID:(NSNumber *)fabricID error:(NSError *)error
{
  id v14 = rootKeypair;
  uint64_t v15 = rootCertificate;
  id v16 = issuerID;
  v17 = fabricID;
  id v18 = objc_alloc(MEMORY[0x263F08798]);
  uint64_t v21 = objc_msgSend_now(MEMORY[0x263EFF910], v19, v20);
  long long v24 = objc_msgSend_distantFuture(MEMORY[0x263EFF910], v22, v23);
  started = objc_msgSend_initWithStartDate_endDate_(v18, v25, (uint64_t)v21, v24);

  long long v28 = objc_msgSend_createIntermediateCertificate_rootCertificate_intermediatePublicKey_issuerID_fabricID_validityPeriod_error_(a1, v27, (uint64_t)v14, v15, intermediatePublicKey, v16, v17, started, error);

  return (MTRCertificateDERBytes)v28;
}

+ (MTRCertificateDERBytes)createOperationalCertificate:(id)signingKeypair signingCertificate:(MTRCertificateDERBytes)signingCertificate operationalPublicKey:(SecKeyRef)operationalPublicKey fabricID:(NSNumber *)fabricID nodeID:(NSNumber *)nodeID caseAuthenticatedTags:(NSSet *)caseAuthenticatedTags validityPeriod:(NSDateInterval *)validityPeriod error:(NSError *)error
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v15 = signingKeypair;
  id v16 = signingCertificate;
  v17 = fabricID;
  id v18 = nodeID;
  v19 = caseAuthenticatedTags;
  uint64_t v20 = validityPeriod;
  uint64_t v21 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2446BD000, v21, OS_LOG_TYPE_DEFAULT, "Generating operational certificate", buf, 2u);
  }

  if (sub_244CC4E58(2u)) {
    sub_244CC4DE0(0, 2);
  }
  memset(buf, 0, sizeof(buf));
  uint64_t v34 = 0;
  id v32 = 0;
  sub_244BCE0D0(v15, v16, operationalPublicKey, v17, v18, v19, v20, &v32, (uint64_t)buf);
  id v22 = v32;
  if (error)
  {
    long long v30 = *(_OWORD *)buf;
    uint64_t v31 = v34;
    sub_244B26908((uint64_t)MTRError, &v30);
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
  if (*(_DWORD *)buf)
  {
    uint64_t v23 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      long long v28 = *(_OWORD *)buf;
      uint64_t v29 = v34;
      long long v24 = sub_244CB7B34((const char **)&v28, 1);
      *(_DWORD *)uint64_t v35 = 136315138;
      v36 = v24;
      _os_log_impl(&dword_2446BD000, v23, OS_LOG_TYPE_ERROR, "Generating operational certificate failed: %s", v35, 0xCu);
    }

    if (sub_244CC4E58(1u))
    {
      long long v26 = *(_OWORD *)buf;
      uint64_t v27 = v34;
      sub_244CB7B34((const char **)&v26, 1);
      sub_244CC4DE0(0, 1);
    }
  }

  return (MTRCertificateDERBytes)v22;
}

+ (MTRCertificateDERBytes)createOperationalCertificate:(id)signingKeypair signingCertificate:(MTRCertificateDERBytes)signingCertificate operationalPublicKey:(SecKeyRef)operationalPublicKey fabricID:(NSNumber *)fabricID nodeID:(NSNumber *)nodeID caseAuthenticatedTags:(NSSet *)caseAuthenticatedTags error:(NSError *)error
{
  id v31 = signingKeypair;
  id v15 = signingCertificate;
  id v16 = fabricID;
  v17 = nodeID;
  id v18 = caseAuthenticatedTags;
  id v19 = objc_alloc(MEMORY[0x263F08798]);
  id v22 = objc_msgSend_now(MEMORY[0x263EFF910], v20, v21);
  uint64_t v25 = objc_msgSend_distantFuture(MEMORY[0x263EFF910], v23, v24);
  started = objc_msgSend_initWithStartDate_endDate_(v19, v26, (uint64_t)v22, v25);

  uint64_t v29 = objc_msgSend_createOperationalCertificate_signingCertificate_operationalPublicKey_fabricID_nodeID_caseAuthenticatedTags_validityPeriod_error_(a1, v28, (uint64_t)v31, v15, operationalPublicKey, v16, v17, v18, started, error);

  return (MTRCertificateDERBytes)v29;
}

+ (BOOL)keypair:(id)keypair matchesCertificate:(NSData *)certificate
{
  v39[9] = *MEMORY[0x263EF8340];
  id v5 = keypair;
  v6 = certificate;
  v38 = &unk_26F954540;
  long long v32 = 0uLL;
  uint64_t v33 = 0;
  v9 = (__SecKey *)objc_msgSend_publicKey(v5, v7, v8);
  sub_2446CD1AC(v9, (uint64_t)&v38, (uint64_t)&v32);
  if (!v32)
  {
    *(void *)buf = &unk_26F954540;
    id v13 = v6;
    uint64_t v16 = objc_msgSend_bytes(v13, v14, v15);
    uint64_t v19 = objc_msgSend_length(v13, v17, v18);
    sub_2446C1098(&v34, v16, v19);

    long long v27 = v34;
    sub_244CEF4D0((uint64_t *)&v27, (uint64_t)buf, (uint64_t)v35);
    long long v32 = *(_OWORD *)v35;
    uint64_t v33 = v36;
    if (!*(_DWORD *)v35)
    {
      BOOL v12 = memcmp(&buf[8], v39, 0x41uLL) == 0;
      goto LABEL_13;
    }
    uint64_t v20 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      long long v25 = v32;
      uint64_t v26 = v33;
      uint64_t v21 = sub_244CB7B34((const char **)&v25, 1);
      *(_DWORD *)uint64_t v35 = 136315138;
      *(void *)&uint8_t v35[4] = v21;
      _os_log_impl(&dword_2446BD000, v20, OS_LOG_TYPE_ERROR, "Can't extract public key from certificate: %s", v35, 0xCu);
    }

    if (sub_244CC4E58(1u))
    {
      long long v23 = v32;
      uint64_t v24 = v33;
      sub_244CB7B34((const char **)&v23, 1);
      sub_244CC4DE0(0, 1);
      BOOL v12 = 0;
      goto LABEL_13;
    }
LABEL_11:
    BOOL v12 = 0;
    goto LABEL_13;
  }
  id v10 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    long long v30 = v32;
    uint64_t v31 = v33;
    id v11 = sub_244CB7B34((const char **)&v30, 1);
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = v11;
    _os_log_impl(&dword_2446BD000, v10, OS_LOG_TYPE_ERROR, "Can't extract public key from keypair: %s", buf, 0xCu);
  }

  if (!sub_244CC4E58(1u)) {
    goto LABEL_11;
  }
  long long v28 = v32;
  uint64_t v29 = v33;
  sub_244CB7B34((const char **)&v28, 1);
  sub_244CC4DE0(0, 1);
  BOOL v12 = 0;
LABEL_13:

  return v12;
}

+ (BOOL)isCertificate:(MTRCertificateDERBytes)certificate1 equalTo:(MTRCertificateDERBytes)certificate2
{
  v76[9] = *MEMORY[0x263EF8340];
  id v5 = certificate1;
  v6 = certificate2;
  v75 = &unk_26F954540;
  long long v64 = 0uLL;
  uint64_t v65 = 0;
  v7 = v5;
  uint64_t v10 = objc_msgSend_bytes(v7, v8, v9);
  uint64_t v13 = objc_msgSend_length(v7, v11, v12);
  sub_2446C1098(buf, v10, v13);

  *(_OWORD *)v69 = *(_OWORD *)buf;
  sub_244CEF4D0((uint64_t *)v69, (uint64_t)&v75, (uint64_t)&v64);
  if (v64)
  {
    id v14 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      long long v62 = v64;
      uint64_t v63 = v65;
      uint64_t v15 = sub_244CB7B34((const char **)&v62, 1);
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = v15;
      _os_log_impl(&dword_2446BD000, v14, OS_LOG_TYPE_ERROR, "Can't extract public key from first certificate: %s", buf, 0xCu);
    }

    if (sub_244CC4E58(1u))
    {
      long long v60 = v64;
      uint64_t v61 = v65;
      sub_244CB7B34((const char **)&v60, 1);
      sub_244CC4DE0(0, 1);
      BOOL v16 = 0;
      goto LABEL_13;
    }
LABEL_12:
    BOOL v16 = 0;
    goto LABEL_13;
  }
  v73 = &unk_26F954540;
  v17 = v6;
  uint64_t v20 = objc_msgSend_bytes(v17, v18, v19);
  uint64_t v23 = objc_msgSend_length(v17, v21, v22);
  sub_2446C1098(v69, v20, v23);

  *(_OWORD *)v67 = *(_OWORD *)v69;
  sub_244CEF4D0((uint64_t *)v67, (uint64_t)&v73, (uint64_t)buf);
  long long v64 = *(_OWORD *)buf;
  uint64_t v65 = v72;
  if (*(_DWORD *)buf)
  {
    uint64_t v24 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      long long v58 = v64;
      uint64_t v59 = v65;
      long long v25 = sub_244CB7B34((const char **)&v58, 1);
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = v25;
      _os_log_impl(&dword_2446BD000, v24, OS_LOG_TYPE_ERROR, "Can't extract public key from second certificate: %s", buf, 0xCu);
    }

    if (sub_244CC4E58(1u))
    {
      long long v56 = v64;
      uint64_t v57 = v65;
      sub_244CB7B34((const char **)&v56, 1);
      sub_244CC4DE0(0, 1);
      BOOL v16 = 0;
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (memcmp(v76, &v74, 0x41uLL)) {
    goto LABEL_12;
  }
  sub_244D9200C((uint64_t)buf);
  long long v27 = v7;
  uint64_t v30 = objc_msgSend_bytes(v27, v28, v29);
  uint64_t v33 = objc_msgSend_length(v27, v31, v32);
  sub_2446C1098(v67, v30, v33);

  long long v66 = *(_OWORD *)v67;
  sub_244D94384((uint64_t *)&v66, (uint64_t)buf, (uint64_t)v69);
  long long v64 = *(_OWORD *)v69;
  uint64_t v65 = v70;
  if (*(_DWORD *)v69)
  {
    long long v34 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      long long v54 = v64;
      uint64_t v55 = v65;
      uint64_t v35 = sub_244CB7B34((const char **)&v54, 1);
      *(_DWORD *)v69 = 136315138;
      *(void *)&v69[4] = v35;
      _os_log_impl(&dword_2446BD000, v34, OS_LOG_TYPE_ERROR, "Can't extract subject DN from first certificate: %s", v69, 0xCu);
    }

    if (sub_244CC4E58(1u))
    {
      long long v52 = v64;
      uint64_t v53 = v65;
      sub_244CB7B34((const char **)&v52, 1);
      sub_244CC4DE0(0, 1);
    }
    BOOL v16 = 0;
  }
  else
  {
    sub_244D9200C((uint64_t)v69);
    uint64_t v37 = v17;
    uint64_t v40 = objc_msgSend_bytes(v37, v38, v39);
    uint64_t v43 = objc_msgSend_length(v37, v41, v42);
    sub_2446C1098(&v66, v40, v43);

    long long v51 = v66;
    sub_244D94384((uint64_t *)&v51, (uint64_t)v69, (uint64_t)v67);
    long long v64 = *(_OWORD *)v67;
    uint64_t v65 = v68;
    if (*(_DWORD *)v67)
    {
      v44 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        long long v49 = v64;
        uint64_t v50 = v65;
        v45 = sub_244CB7B34((const char **)&v49, 1);
        *(_DWORD *)v67 = 136315138;
        *(void *)&v67[4] = v45;
        _os_log_impl(&dword_2446BD000, v44, OS_LOG_TYPE_ERROR, "Can't extract subject DN from second certificate: %s", v67, 0xCu);
      }

      if (sub_244CC4E58(1u))
      {
        long long v47 = v64;
        uint64_t v48 = v65;
        sub_244CB7B34((const char **)&v47, 1);
        sub_244CC4DE0(0, 1);
      }
      BOOL v16 = 0;
    }
    else
    {
      BOOL v16 = sub_244D91EAC((uint64_t)buf, (uint64_t)v69);
    }
    nullsub_13(v69, v46);
  }
  nullsub_13(buf, v36);
LABEL_13:

  return v16;
}

+ (MTRCSRDERBytes)createCertificateSigningRequest:(id)keypair error:(NSError *)error
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = keypair;
  v24[1] = &unk_26F954540;
  char v25 = 0;
  v24[0] = &unk_26F943F78;
  id v26 = 0;
  long long v27 = &unk_26F954540;
  sub_2446CC8D8((uint64_t)v24, v5, (uint64_t)&v19);
  int v6 = v19;
  long long v22 = v20;
  int v23 = v21;
  if (v19
    || (v17 = &v19,
        uint64_t v18 = 255,
        sub_244CE7A10((uint64_t)v24, (uint64_t *)&v17, (uint64_t)&v14),
        int v6 = v14,
        long long v22 = v15,
        int v23 = v16,
        v14))
  {
    if (error)
    {
      int v10 = v6;
      long long v11 = v22;
      int v12 = v23;
      sub_244B26908((uint64_t)MTRError, (long long *)&v10);
      v7 = 0;
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    sub_2446C1098(v13, (uint64_t)v17, v18);
    v7 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v8, v13[0], v13[1]);
  }

  sub_244CEDE1C((uint64_t)v24);

  return (MTRCSRDERBytes)v7;
}

+ (MTRCertificateTLVBytes)convertX509Certificate:(MTRCertificateDERBytes)x509Certificate
{
  v25[50] = *MEMORY[0x263EF8340];
  v3 = x509Certificate;
  uint64_t v6 = objc_msgSend_bytes(v3, v4, v5);
  uint64_t v9 = objc_msgSend_length(v3, v7, v8);
  sub_2446C1098(v25, v6, v9);

  int v19 = v25;
  uint64_t v20 = 400;
  long long v17 = 0uLL;
  uint64_t v18 = 0;
  sub_244D95190(v25[0], v25[1], (uint64_t)&v19, (uint64_t)&v17);
  if (v17)
  {
    int v10 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_OWORD *)int v21 = v17;
      uint64_t v22 = v18;
      long long v11 = sub_244CB7B34((const char **)v21, 1);
      *(_DWORD *)buf = 136315138;
      uint64_t v24 = v11;
      _os_log_impl(&dword_2446BD000, v10, OS_LOG_TYPE_ERROR, "convertX509Certificate: %s", buf, 0xCu);
    }

    if (sub_244CC4E58(1u))
    {
      *(_OWORD *)int v21 = v17;
      uint64_t v22 = v18;
      sub_244CB7B34((const char **)v21, 1);
      sub_244CC4DE0(0, 1);
    }
    int v12 = 0;
  }
  else
  {
    uint64_t v13 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v21 = 0;
      _os_log_impl(&dword_2446BD000, v13, OS_LOG_TYPE_INFO, "convertX509Certificate: Success", v21, 2u);
    }

    if (sub_244CC4E58(3u)) {
      sub_244CC4DE0(0, 3);
    }
    sub_2446C1098(v16, (uint64_t)v19, v20);
    int v12 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v14, v16[0], v16[1]);
  }

  return (MTRCertificateTLVBytes)v12;
}

+ (MTRCertificateDERBytes)convertMatterCertificate:(MTRCertificateTLVBytes)matterCertificate
{
  v26[75] = *MEMORY[0x263EF8340];
  v3 = matterCertificate;
  uint64_t v6 = objc_msgSend_bytes(v3, v4, v5);
  uint64_t v9 = objc_msgSend_length(v3, v7, v8);
  sub_2446C1098(v26, v6, v9);

  uint64_t v22 = v26;
  uint64_t v23 = 600;
  long long v20 = 0uLL;
  uint64_t v21 = 0;
  sub_244D96BFC(v26[0], v26[1], (uint64_t *)&v22, &v20);
  if (v20)
  {
    int v10 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      long long v18 = v20;
      uint64_t v19 = v21;
      long long v11 = sub_244CB7B34((const char **)&v18, 1);
      *(_DWORD *)buf = 136315138;
      char v25 = v11;
      _os_log_impl(&dword_2446BD000, v10, OS_LOG_TYPE_ERROR, "convertMatterCertificate: %s", buf, 0xCu);
    }

    if (sub_244CC4E58(1u))
    {
      long long v16 = v20;
      uint64_t v17 = v21;
      sub_244CB7B34((const char **)&v16, 1);
      sub_244CC4DE0(0, 1);
    }
    int v12 = 0;
  }
  else
  {
    sub_2446C1098(v15, (uint64_t)v22, v23);
    int v12 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v13, v15[0], v15[1]);
  }

  return (MTRCertificateDERBytes)v12;
}

+ (NSData)publicKeyFromCSR:(MTRCSRDERBytes)csr error:(NSError *)error
{
  v29[9] = *MEMORY[0x263EF8340];
  uint64_t v5 = csr;
  uint64_t v8 = objc_msgSend_bytes(v5, v6, v7);
  uint64_t v11 = objc_msgSend_length(v5, v9, v10);
  sub_2446C1098(&v28, v8, v11);

  uint64_t v12 = (uint64_t)v28;
  uint64_t v28 = &unk_26F954540;
  long long v24 = 0uLL;
  uint64_t v25 = 0;
  sub_244CEE210(v12, v29[0], (uint64_t)&v28, &v24);
  if (v24)
  {
    int v14 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      long long v22 = v24;
      uint64_t v23 = v25;
      long long v15 = sub_244CB7B34((const char **)&v22, 1);
      *(_DWORD *)buf = 136315138;
      long long v27 = v15;
      _os_log_impl(&dword_2446BD000, v14, OS_LOG_TYPE_ERROR, "publicKeyFromCSR: %s", buf, 0xCu);
    }

    if (sub_244CC4E58(1u))
    {
      long long v20 = v24;
      uint64_t v21 = v25;
      sub_244CB7B34((const char **)&v20, 1);
      sub_244CC4DE0(0, 1);
    }
    if (error)
    {
      long long v18 = v24;
      uint64_t v19 = v25;
      sub_244B26908((uint64_t)MTRError, &v18);
      long long v16 = 0;
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      long long v16 = 0;
    }
  }
  else
  {
    long long v16 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v13, (uint64_t)v29, 65);
  }

  return (NSData *)v16;
}

+ (NSData)generateRootCertificate:(id)keypair issuerId:(NSNumber *)issuerId fabricId:(NSNumber *)fabricId error:(NSError *)error
{
  uint64_t v6 = objc_msgSend_createRootCertificate_issuerID_fabricID_error_(MTRCertificates, a2, (uint64_t)keypair, issuerId, fabricId, error);

  return (NSData *)v6;
}

+ (NSData)generateIntermediateCertificate:(id)rootKeypair rootCertificate:(NSData *)rootCertificate intermediatePublicKey:(SecKeyRef)intermediatePublicKey issuerId:(NSNumber *)issuerId fabricId:(NSNumber *)fabricId error:(NSError *)error
{
  uint64_t v8 = objc_msgSend_createIntermediateCertificate_rootCertificate_intermediatePublicKey_issuerID_fabricID_error_(MTRCertificates, a2, (uint64_t)rootKeypair, rootCertificate, intermediatePublicKey, issuerId, fabricId, error);

  return (NSData *)v8;
}

+ (NSData)generateOperationalCertificate:(id)signingKeypair signingCertificate:(NSData *)signingCertificate operationalPublicKey:(SecKeyRef)operationalPublicKey fabricId:(NSNumber *)fabricId nodeId:(NSNumber *)nodeId caseAuthenticatedTags:(NSArray *)caseAuthenticatedTags error:(NSError *)error
{
  id v14 = signingKeypair;
  long long v15 = signingCertificate;
  long long v16 = fabricId;
  uint64_t v17 = nodeId;
  uint64_t v19 = caseAuthenticatedTags;
  if (v19)
  {
    long long v20 = objc_msgSend_setWithArray_(MEMORY[0x263EFFA08], v18, (uint64_t)v19);
    objc_msgSend_createOperationalCertificate_signingCertificate_operationalPublicKey_fabricID_nodeID_caseAuthenticatedTags_error_(MTRCertificates, v21, (uint64_t)v14, v15, operationalPublicKey, v16, v17, v20, error);
  }
  else
  {
    long long v20 = 0;
    objc_msgSend_createOperationalCertificate_signingCertificate_operationalPublicKey_fabricID_nodeID_caseAuthenticatedTags_error_(MTRCertificates, v18, (uint64_t)v14, v15, operationalPublicKey, v16, v17, 0, error);
  long long v22 = };

  return (NSData *)v22;
}

+ (NSData)generateCertificateSigningRequest:(id)keypair error:(NSError *)error
{
  v4 = objc_msgSend_createCertificateSigningRequest_error_(MTRCertificates, a2, (uint64_t)keypair, error);

  return (NSData *)v4;
}

@end