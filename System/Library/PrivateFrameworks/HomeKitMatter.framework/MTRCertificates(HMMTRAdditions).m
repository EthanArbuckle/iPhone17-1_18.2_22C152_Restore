@interface MTRCertificates(HMMTRAdditions)
+ (__CFString)describeX509Certificate:()HMMTRAdditions;
+ (__CFString)shortDescriptionForX509Certificate:()HMMTRAdditions;
+ (id)describeMatterCertificate:()HMMTRAdditions;
+ (id)fabricIDFromCertificate:()HMMTRAdditions;
+ (id)shortDescriptionForMatterCertificate:()HMMTRAdditions;
+ (void)printMatterCertificate:()HMMTRAdditions;
+ (void)printX509Certificate:()HMMTRAdditions;
@end

@implementation MTRCertificates(HMMTRAdditions)

+ (id)fabricIDFromCertificate:()HMMTRAdditions
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F10CC0] convertX509Certificate:v3];
  if (!v4) {
    id v4 = v3;
  }
  v5 = (void *)[objc_alloc(MEMORY[0x263F10CB8]) initWithTLVBytes:v4];
  v6 = [v5 issuer];
  v7 = [v6 fabricID];

  return v7;
}

+ (__CFString)shortDescriptionForX509Certificate:()HMMTRAdditions
{
  v2 = objc_msgSend(MEMORY[0x263F10CC0], "convertX509Certificate:");
  if (v2)
  {
    id v3 = [a1 shortDescriptionForMatterCertificate:v2];
  }
  else
  {
    id v3 = @"(invalid X509 certificate)";
  }

  return v3;
}

+ (id)shortDescriptionForMatterCertificate:()HMMTRAdditions
{
  id v3 = (void *)MEMORY[0x263F089D8];
  id v4 = a3;
  v5 = [v3 string];
  v6 = (void *)[objc_alloc(MEMORY[0x263F10CB8]) initWithTLVBytes:v4];

  v7 = [v6 subject];
  v8 = [v7 nodeID];

  if (v8)
  {
    v9 = [v6 subject];
    v10 = [v9 nodeID];
    [v5 appendFormat:@"NodeID = %@, ", v10];
  }
  v11 = [v6 subject];
  v12 = [v11 fabricID];

  if (v12)
  {
    v13 = [v6 subject];
    v14 = [v13 fabricID];
    [v5 appendFormat:@"FabricID = %@, ", v14];
  }
  v15 = [v6 subject];
  v16 = [v15 caseAuthenticatedTags];
  uint64_t v17 = [v16 count];

  if (v17)
  {
    v18 = [v6 subject];
    v19 = [v18 caseAuthenticatedTags];
    v20 = [v19 allObjects];
    v21 = [v20 componentsJoinedByString:@","];
    [v5 appendFormat:@"CATs = %@, ", v21];
  }
  return v5;
}

+ (__CFString)describeX509Certificate:()HMMTRAdditions
{
  v2 = objc_msgSend(MEMORY[0x263F10CC0], "convertX509Certificate:");
  if (v2)
  {
    id v3 = [a1 describeMatterCertificate:v2];
  }
  else
  {
    id v3 = @"(invalid X509 certificate)";
  }

  return v3;
}

+ (id)describeMatterCertificate:()HMMTRAdditions
{
  id v3 = (void *)MEMORY[0x263F089D8];
  id v4 = a3;
  v31 = [v3 string];
  v5 = (void *)[objc_alloc(MEMORY[0x263F10CB8]) initWithTLVBytes:v4];

  v6 = [v5 notBefore];
  v7 = [v6 description];
  v8 = [v5 notAfter];
  v9 = [v8 description];
  [v31 appendFormat:@"\nValidity: [%@ - %@]", v7, v9];

  v29 = [v5 issuer];
  v10 = [v29 nodeID];
  v11 = [v5 issuer];
  v12 = [v11 fabricID];
  v13 = [v5 issuer];
  v14 = [v13 rootCACertificateID];
  v15 = [v5 issuer];
  v16 = [v15 intermediateCACertificateID];
  uint64_t v17 = [v5 issuer];
  v18 = [v17 caseAuthenticatedTags];
  [v31 appendFormat:@"\nIssuer: [node ID = %@, fabricID = %@, root certificate ID = %@, intermediate certificate ID = %@, CATs = %@]", v10, v12, v14, v16, v18];

  v30 = [v5 subject];
  v19 = [v30 nodeID];
  v28 = [v5 subject];
  v20 = [v28 fabricID];
  v21 = [v5 subject];
  v22 = [v21 rootCACertificateID];
  v23 = [v5 subject];
  v24 = [v23 intermediateCACertificateID];
  v25 = [v5 subject];
  v26 = [v25 caseAuthenticatedTags];
  [v31 appendFormat:@"\nSubject: [node ID = %@, fabricID = %@, root certificate ID = %@, intermediate certificate ID = %@, CATs = %@]\n", v19, v20, v22, v24, v26];

  return v31;
}

+ (void)printX509Certificate:()HMMTRAdditions
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263F10CC0] convertX509Certificate:v4];
  if (v5)
  {
    [a1 printMatterCertificate:v5];
  }
  else
  {
    v6 = (void *)MEMORY[0x2533B64D0]();
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = HMFGetLogIdentifier();
      int v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@Failed to convert X509 certificate", (uint8_t *)&v9, 0xCu);
    }
  }
}

+ (void)printMatterCertificate:()HMMTRAdditions
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x263F10CB8]) initWithTLVBytes:v3];
  v5 = (void *)MEMORY[0x2533B64D0]();
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    v8 = [v4 notBefore];
    int v9 = [v4 notAfter];
    *(_DWORD *)buf = 138543874;
    v47 = v7;
    __int16 v48 = 2112;
    v49 = v8;
    __int16 v50 = 2112;
    v51 = v9;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_INFO, "%{public}@Certificate valid between %@ and %@", buf, 0x20u);
  }
  v10 = [v4 issuer];

  uint64_t v11 = (void *)MEMORY[0x2533B64D0]();
  v12 = HMFGetOSLogHandle();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (v10)
  {
    if (v13)
    {
      v14 = HMFGetLogIdentifier();
      v42 = [v4 issuer];
      [v42 nodeID];
      v15 = v40 = v11;
      v38 = [v4 issuer];
      v16 = [v38 fabricID];
      v36 = [v4 issuer];
      uint64_t v17 = [v36 rootCACertificateID];
      v18 = [v4 issuer];
      v19 = [v18 intermediateCACertificateID];
      [v4 issuer];
      v20 = id v44 = v3;
      v21 = [v20 caseAuthenticatedTags];
      *(_DWORD *)buf = 138544642;
      v47 = v14;
      __int16 v48 = 2112;
      v49 = v15;
      __int16 v50 = 2112;
      v51 = v16;
      __int16 v52 = 2112;
      v53 = v17;
      __int16 v54 = 2112;
      v55 = v19;
      __int16 v56 = 2112;
      v57 = v21;
      _os_log_impl(&dword_252495000, v12, OS_LOG_TYPE_INFO, "%{public}@Certificate issuer node ID = %@, fabricID = %@, root certificate ID = %@, intermediate certificate ID = %@, CATs = %@", buf, 0x3Eu);

      id v3 = v44;
      uint64_t v11 = v40;
    }
  }
  else if (v13)
  {
    v22 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v47 = v22;
    _os_log_impl(&dword_252495000, v12, OS_LOG_TYPE_INFO, "%{public}@Certificate issuer = nil", buf, 0xCu);
  }
  v23 = [v4 subject];

  v24 = (void *)MEMORY[0x2533B64D0]();
  v25 = HMFGetOSLogHandle();
  BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_INFO);
  if (v23)
  {
    if (v26)
    {
      v27 = HMFGetLogIdentifier();
      v43 = [v4 subject];
      v28 = [v43 nodeID];
      v41 = [v4 subject];
      [v41 fabricID];
      v29 = v39 = v24;
      v37 = [v4 subject];
      v30 = [v37 rootCACertificateID];
      v31 = [v4 subject];
      v32 = [v31 intermediateCACertificateID];
      [v4 subject];
      v33 = id v45 = v3;
      v34 = [v33 caseAuthenticatedTags];
      *(_DWORD *)buf = 138544642;
      v47 = v27;
      __int16 v48 = 2112;
      v49 = v28;
      __int16 v50 = 2112;
      v51 = v29;
      __int16 v52 = 2112;
      v53 = v30;
      __int16 v54 = 2112;
      v55 = v32;
      __int16 v56 = 2112;
      v57 = v34;
      _os_log_impl(&dword_252495000, v25, OS_LOG_TYPE_INFO, "%{public}@Certificate subject node ID = %@, fabricID = %@, root certificate ID = %@, intermediate certificate ID = %@, CATs = %@", buf, 0x3Eu);

      id v3 = v45;
      v24 = v39;
    }
  }
  else if (v26)
  {
    v35 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v47 = v35;
    _os_log_impl(&dword_252495000, v25, OS_LOG_TYPE_INFO, "%{public}@Certificate subject = nil", buf, 0xCu);
  }
}

@end