@interface HMMTRSystemCommissionerControllerParams
+ (id)logCategory;
- (BOOL)_checkAndUpdateValidityPeriodOfV1Keypair:(id)a3 newKeyPair:(id *)a4;
- (BOOL)_findFabricRecordInMTSKeyValueStoreMatchingKeyPair:(id)a3 ipk:(id *)a4 rootCert:(id *)a5 operationalKey:(id *)a6 operationalCert:(id *)a7;
- (BOOL)fetchControllerParamsAllowingNew:(BOOL)a3 nocSigner:(id *)a4 controllerWrapper:(id *)a5;
- (BOOL)generatingKeyPair;
- (BOOL)shouldSkipAttestationCertificateValidation;
- (BOOL)v1KeypairIsEquivalentTo:(id)a3;
- (HMMTRControllerFactory)controllerFactory;
- (HMMTRControllerWrapper)controllerWrapper;
- (HMMTRMatterKeypair)v1keypair;
- (HMMTRSystemCommissionerControllerParams)initWithQueue:(id)a3 controllerFactory:(id)a4;
- (NSArray)certificationDeclarationCertificates;
- (NSArray)productAttestationAuthorityCertificates;
- (NSNumber)adminNodeID;
- (NSNumber)commissioneeNodeID;
- (NSNumber)commissioningFabricID;
- (OS_dispatch_queue)workQueue;
- (id)_buildControllerParams1WithV1Keypair:(id)a3;
- (id)_buildControllerParams2WithV1Keypair:(id)a3;
- (id)mtsKeyValueStore;
- (id)storeV0MatterKeypair;
- (id)storeV0MatterKeypairWithPrivateKey:(__SecKey *)a3;
- (id)storeV1MatterKeypairWithPrivateKey:(__SecKey *)a3 operationalKey:(__SecKey *)a4 rootCert:(id)a5 operationalCert:(id)a6 ipk:(id)a7;
- (id)v0MatterKeypairFromKeychain;
- (id)v1MatterKeypairFromKeychain;
- (void)_buildV1KeyFromScratch;
- (void)_buildV1KeyFromV0KeyAllowingNew:(BOOL)a3;
- (void)_buildV1KeyWithPrivateKey:(__SecKey *)a3 operationalKey:(__SecKey *)a4 ipk:(id)a5 rootCert:(id)a6 operationalCert:(id)a7 updatingMTSKeyValueStore:(BOOL)a8;
- (void)_buildV1KeyWithV0KeyPair:(id)a3;
- (void)_handleKeychainDataChanged;
- (void)_obtainControllerWrapperWithV1KeyPair:(id)a3 startupParams:(id)a4;
- (void)_startWithV1Keypair:(id)a3;
- (void)_updateMTSKeyValueStore:(id)a3;
- (void)handleKeyPairDataChanged;
- (void)issueOperationalCertificateForRequest:(id)a3 attestationInfo:(id)a4 controller:(id)a5 completion:(id)a6;
- (void)setAdminNodeID:(id)a3;
- (void)setCertificationDeclarationCertificates:(id)a3;
- (void)setCommissioneeNodeID:(id)a3;
- (void)setCommissioningFabricID:(id)a3;
- (void)setControllerWrapper:(id)a3;
- (void)setGeneratingKeyPair:(BOOL)a3;
- (void)setMTSStoredValue:(id)a3 forKey:(id)a4 error:(id *)a5;
- (void)setProductAttestationAuthorityCertificates:(id)a3;
- (void)setV1keypair:(id)a3;
@end

@implementation HMMTRSystemCommissionerControllerParams

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adminNodeID, 0);
  objc_storeStrong((id *)&self->_commissioningFabricID, 0);
  objc_storeStrong((id *)&self->_v1keypair, 0);
  objc_storeStrong((id *)&self->_controllerWrapper, 0);
  objc_storeStrong((id *)&self->_controllerFactory, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_certificationDeclarationCertificates, 0);
  objc_storeStrong((id *)&self->_productAttestationAuthorityCertificates, 0);
  objc_storeStrong((id *)&self->_commissioneeNodeID, 0);
}

- (void)setGeneratingKeyPair:(BOOL)a3
{
  self->_generatingKeyPair = a3;
}

- (BOOL)generatingKeyPair
{
  return self->_generatingKeyPair;
}

- (void)setAdminNodeID:(id)a3
{
}

- (NSNumber)adminNodeID
{
  return self->_adminNodeID;
}

- (void)setCommissioningFabricID:(id)a3
{
}

- (NSNumber)commissioningFabricID
{
  return self->_commissioningFabricID;
}

- (void)setV1keypair:(id)a3
{
}

- (HMMTRMatterKeypair)v1keypair
{
  return self->_v1keypair;
}

- (void)setControllerWrapper:(id)a3
{
}

- (HMMTRControllerWrapper)controllerWrapper
{
  return self->_controllerWrapper;
}

- (HMMTRControllerFactory)controllerFactory
{
  return self->_controllerFactory;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCertificationDeclarationCertificates:(id)a3
{
}

- (NSArray)certificationDeclarationCertificates
{
  return self->_certificationDeclarationCertificates;
}

- (void)setProductAttestationAuthorityCertificates:(id)a3
{
}

- (NSArray)productAttestationAuthorityCertificates
{
  return self->_productAttestationAuthorityCertificates;
}

- (void)setCommissioneeNodeID:(id)a3
{
}

- (NSNumber)commissioneeNodeID
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (id)mtsKeyValueStore
{
  id v2 = objc_alloc_init(MEMORY[0x263F11058]);
  return v2;
}

- (id)storeV1MatterKeypairWithPrivateKey:(__SecKey *)a3 operationalKey:(__SecKey *)a4 rootCert:(id)a5 operationalCert:(id)a6 ipk:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  v14 = [[HMMTRMatterKeypair alloc] initWithV1Account:@"CHIPPlugin.systemCommissioner.nodeopcerts.CA:1" privateKey:a3 operationalKey:a4 rootCert:v13 operationalCert:v12 ipk:v11];

  return v14;
}

- (id)storeV0MatterKeypairWithPrivateKey:(__SecKey *)a3
{
  v3 = [[HMMTRMatterKeypair alloc] initWithV0Account:@"CHIPPlugin.systemCommissioner.nodeopcerts.CA:0" privateKey:a3];
  return v3;
}

- (id)storeV0MatterKeypair
{
  id v2 = [[HMMTRMatterKeypair alloc] initWithAccount:@"CHIPPlugin.systemCommissioner.nodeopcerts.CA:0"];
  return v2;
}

- (id)v1MatterKeypairFromKeychain
{
  id v2 = [[HMMTRMatterKeypair alloc] initWithV1Account:@"CHIPPlugin.systemCommissioner.nodeopcerts.CA:1"];
  return v2;
}

- (id)v0MatterKeypairFromKeychain
{
  id v2 = [[HMMTRMatterKeypair alloc] initWithV0Account:@"CHIPPlugin.systemCommissioner.nodeopcerts.CA:0"];
  return v2;
}

- (void)setMTSStoredValue:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(HMMTRSystemCommissionerControllerParams *)self mtsKeyValueStore];
  [v10 setStoredValue:v9 forKey:v8 error:a5];
}

- (BOOL)v1KeypairIsEquivalentTo:(id)a3
{
  id v4 = a3;
  v5 = [(HMMTRSystemCommissionerControllerParams *)self v1keypair];
  if ([v5 operationalKey])
  {
    v6 = [HMMTRMatterKeypair alloc];
    v7 = [(HMMTRSystemCommissionerControllerParams *)self v1keypair];
    id v8 = -[HMMTRMatterKeypair initWithPrivateKey:](v6, "initWithPrivateKey:", [v7 operationalKey]);
  }
  else
  {
    id v8 = 0;
  }

  if ([v4 operationalKey]) {
    id v9 = -[HMMTRMatterKeypair initWithPrivateKey:]([HMMTRMatterKeypair alloc], "initWithPrivateKey:", [v4 operationalKey]);
  }
  else {
    id v9 = 0;
  }
  id v10 = [(HMMTRSystemCommissionerControllerParams *)self v1keypair];
  id v11 = [v10 serialize];
  id v12 = [v4 serialize];
  if ([v11 isEqual:v12])
  {
    id v13 = [(HMMTRMatterKeypair *)v8 serialize];
    v14 = [(HMMTRMatterKeypair *)v9 serialize];
    if ([v13 isEqual:v14])
    {
      v29 = [(HMMTRSystemCommissionerControllerParams *)self v1keypair];
      v15 = [v29 rootCert];
      v27 = [v4 rootCert];
      v28 = v15;
      if ([v15 isEqual:v27])
      {
        v26 = [(HMMTRSystemCommissionerControllerParams *)self v1keypair];
        uint64_t v16 = [v26 operationalCert];
        uint64_t v17 = [v4 operationalCert];
        v25 = (void *)v16;
        v18 = (void *)v16;
        v19 = (void *)v17;
        if ([v18 isEqual:v17])
        {
          v24 = [(HMMTRSystemCommissionerControllerParams *)self v1keypair];
          v23 = [v24 ipk];
          v22 = [v4 ipk];
          char v20 = [v23 isEqual:v22];
        }
        else
        {
          char v20 = 0;
        }
      }
      else
      {
        char v20 = 0;
      }
    }
    else
    {
      char v20 = 0;
    }
  }
  else
  {
    char v20 = 0;
  }

  return v20;
}

- (void)_handleKeychainDataChanged
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v3 = [(HMMTRSystemCommissionerControllerParams *)self v1MatterKeypairFromKeychain];
  if (v3)
  {
    if ([(HMMTRSystemCommissionerControllerParams *)self v1KeypairIsEquivalentTo:v3])
    {
      id v4 = (void *)MEMORY[0x2533B64D0]();
      v5 = self;
      v6 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = HMFGetLogIdentifier();
        int v13 = 138543362;
        v14 = v7;
        _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_INFO, "%{public}@V1 keypair remains the same", (uint8_t *)&v13, 0xCu);
      }
    }
    else
    {
      [(HMMTRSystemCommissionerControllerParams *)self _startWithV1Keypair:v3];
    }
  }
  else
  {
    id v8 = (void *)MEMORY[0x2533B64D0]();
    id v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      int v13 = 138543362;
      v14 = v11;
      _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_ERROR, "%{public}@V1 keypair disappeared from keychain", (uint8_t *)&v13, 0xCu);
    }
    id v12 = [(HMMTRSystemCommissionerControllerParams *)v9 controllerWrapper];
    [v12 remove];

    [(HMMTRSystemCommissionerControllerParams *)v9 setControllerWrapper:0];
  }
}

- (BOOL)_findFabricRecordInMTSKeyValueStoreMatchingKeyPair:(id)a3 ipk:(id *)a4 rootCert:(id *)a5 operationalKey:(id *)a6 operationalCert:(id *)a7
{
  uint64_t v171 = *MEMORY[0x263EF8340];
  id v156 = a3;
  id v12 = [(HMMTRSystemCommissionerControllerParams *)self mtsKeyValueStore];
  int v13 = v12;
  if (!v12)
  {
    v105 = (void *)MEMORY[0x2533B64D0]();
    v106 = self;
    v107 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
    {
      v108 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v166 = v108;
      _os_log_impl(&dword_252495000, v107, OS_LOG_TYPE_ERROR, "%{public}@Couldn't access MatterSupport key store", buf, 0xCu);
    }
    BOOL v102 = 0;
    goto LABEL_102;
  }
  v14 = [v12 storedValueForKey:@"IPK"];
  unint64_t v15 = 0x263F08000uLL;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v16 = v14;
  }
  else {
    uint64_t v16 = 0;
  }
  id v17 = v16;

  if (!v17)
  {
    *a4 = 0;
    goto LABEL_83;
  }
  id v18 = (id) [objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v17 options:0];
  *a4 = v18;

  if (!*a4)
  {
LABEL_83:
    v109 = (void *)MEMORY[0x2533B64D0]();
    v110 = self;
    v111 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
    {
      v112 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v166 = v112;
      _os_log_impl(&dword_252495000, v111, OS_LOG_TYPE_INFO, "%{public}@No IPK in MatterSupport storage", buf, 0xCu);
    }
    BOOL v102 = 0;
    goto LABEL_101;
  }
  v128 = a5;
  v19 = (void *)MEMORY[0x2533B64D0]();
  char v20 = self;
  v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    v22 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v166 = v22;
    _os_log_impl(&dword_252495000, v21, OS_LOG_TYPE_DEBUG, "%{public}@IPK retrieved from MatterSupport storage", buf, 0xCu);
  }
  v23 = [v13 storedValueForKey:@"g/fidx"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v24 = v23;
  }
  else {
    v24 = 0;
  }
  id v25 = v24;

  if (!v25)
  {
    v113 = (void *)MEMORY[0x2533B64D0]();
    v114 = v20;
    v115 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v115, OS_LOG_TYPE_INFO))
    {
      v116 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v166 = v116;
      _os_log_impl(&dword_252495000, v115, OS_LOG_TYPE_INFO, "%{public}@No fabric index info in MatterSupport storage", buf, 0xCu);
    }
    BOOL v102 = 0;
    goto LABEL_100;
  }
  v127 = a7;
  v26 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v25 options:0];
  if (!v26)
  {
    v117 = (void *)MEMORY[0x2533B64D0]();
    v118 = v20;
    v119 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
    {
      v120 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v166 = v120;
      _os_log_impl(&dword_252495000, v119, OS_LOG_TYPE_ERROR, "%{public}@Fabric index info wasn't base64 encoded in MatterSupport storage", buf, 0xCu);
    }
    BOOL v102 = 0;
    goto LABEL_99;
  }
  uint64_t v27 = +[HMMTRTLVParser fabricIndicesFromTLV:v26];
  v28 = (void *)MEMORY[0x2533B64D0]();
  v159 = v20;
  v29 = HMFGetOSLogHandle();
  v30 = v29;
  v129 = (void *)v27;
  if (!v27)
  {
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v121 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v166 = v121;
      _os_log_impl(&dword_252495000, v30, OS_LOG_TYPE_ERROR, "%{public}@Fabric index info wasn't parsed successfully", buf, 0xCu);
    }
    BOOL v102 = 0;
    goto LABEL_98;
  }
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    v31 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v166 = v31;
    __int16 v167 = 2112;
    *(void *)v168 = v129;
    _os_log_impl(&dword_252495000, v30, OS_LOG_TYPE_DEBUG, "%{public}@Fabric indices in the MatterSupport storage: %@", buf, 0x16u);
  }
  long long v163 = 0u;
  long long v164 = 0u;
  long long v161 = 0u;
  long long v162 = 0u;
  id v32 = v129;
  uint64_t v160 = [v32 countByEnumeratingWithState:&v161 objects:v170 count:16];
  if (!v160)
  {

    BOOL v102 = 0;
    v97 = 0;
    v104 = 0;
    v103 = 0;
    id v99 = 0;
    id v100 = 0;
    v101 = 0;
    goto LABEL_97;
  }
  v123 = a6;
  v124 = v26;
  id v125 = v25;
  id v126 = v17;
  id v135 = 0;
  v136 = 0;
  v134 = 0;
  v139 = 0;
  v140 = 0;
  v137 = 0;
  uint64_t v158 = *(void *)v162;
  v152 = v13;
  id v157 = v32;
  do
  {
    for (uint64_t i = 0; i != v160; ++i)
    {
      if (*(void *)v162 != v158) {
        objc_enumerationMutation(v32);
      }
      v34 = *(void **)(*((void *)&v161 + 1) + 8 * i);
      v35 = objc_msgSend(*(id *)(v15 + 2880), "stringWithFormat:", @"f/%x/r", objc_msgSend(v34, "unsignedIntValue"));
      v36 = [v13 storedValueForKey:v35];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v37 = v36;
      }
      else {
        v37 = 0;
      }
      id v38 = v37;

      if (v38)
      {
        uint64_t v39 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v38 options:0];
        if (v39)
        {
          v40 = (void *)v39;
          v41 = [MEMORY[0x263F10CC0] convertMatterCertificate:v39];
          if ([MEMORY[0x263F10CC0] keypair:v156 matchesCertificate:v41])
          {
            v153 = v41;
            objc_msgSend(*(id *)(v15 + 2880), "stringWithFormat:", @"f/%x/o", objc_msgSend(v34, "unsignedIntValue"));
            uint64_t v155 = v42 = v13;
            v43 = objc_msgSend(v13, "storedValueForKey:");
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v44 = v43;
            }
            else {
              v44 = 0;
            }
            id v45 = v44;

            v154 = v45;
            if (v45
              && (uint64_t v46 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v45 options:0]) != 0)
            {
              v150 = (void *)v46;
              v151 = [[HMMTRMatterKeypair alloc] initWithTLVData:v46];
              if (v151)
              {
                objc_msgSend(*(id *)(v15 + 2880), "stringWithFormat:", @"f/%x/n", objc_msgSend(v34, "unsignedIntValue"));
                v147 = int v13 = v42;
                v47 = objc_msgSend(v42, "storedValueForKey:");
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  v48 = v47;
                }
                else {
                  v48 = 0;
                }
                id v49 = v48;

                v148 = v49;
                if (v49
                  && (uint64_t v50 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v49 options:0]) != 0)
                {
                  v51 = (void *)v50;
                  v145 = [MEMORY[0x263F10CC0] convertMatterCertificate:v50];
                  v41 = v153;
                  v144 = v51;
                  if (objc_msgSend(MEMORY[0x263F10CC0], "keypair:matchesCertificate:", v151))
                  {
                    v142 = (void *)[objc_alloc(MEMORY[0x263F10CB8]) initWithTLVBytes:v51];
                    v52 = [v142 subject];
                    v138 = [v52 fabricID];

                    if (!v140) {
                      goto LABEL_45;
                    }
                    v53 = [v142 notBefore];

                    context = (void *)MEMORY[0x2533B64D0]();
                    v132 = v159;
                    log = HMFGetOSLogHandle();
                    BOOL v54 = os_log_type_enabled(log, OS_LOG_TYPE_INFO);
                    if (v53 >= v139)
                    {
                      if (v54)
                      {
                        v92 = HMFGetLogIdentifier();
                        int v93 = [v34 unsignedIntValue];
                        *(_DWORD *)buf = 138543874;
                        v166 = v92;
                        __int16 v167 = 2112;
                        *(void *)v168 = v138;
                        *(_WORD *)&v168[8] = 1024;
                        LODWORD(v169) = v93;
                        _os_log_impl(&dword_252495000, log, OS_LOG_TYPE_INFO, "%{public}@Redundant system commissioner NOC present in MatterSupport storage with fabricID %@, index: 0x%x", buf, 0x1Cu);
                      }
                      v62 = (void *)v155;
                      v61 = v138;
                    }
                    else
                    {
                      if (v54)
                      {
                        v55 = HMFGetLogIdentifier();
                        int v56 = [v137 unsignedIntValue];
                        *(_DWORD *)buf = 138543874;
                        v166 = v55;
                        __int16 v167 = 2112;
                        *(void *)v168 = v140;
                        *(_WORD *)&v168[8] = 1024;
                        LODWORD(v169) = v56;
                        _os_log_impl(&dword_252495000, log, OS_LOG_TYPE_INFO, "%{public}@Redundant system commissioner NOC present in MatterSupport storage with fabricID %@, index: 0x%x", buf, 0x1Cu);
                      }
LABEL_45:
                      id v133 = v138;

                      id v141 = v34;
                      uint64_t v57 = [v142 notBefore];

                      id v58 = v153;
                      id v59 = v145;

                      v60 = v151;
                      v61 = v138;
                      id v135 = v59;
                      v136 = v60;
                      id v32 = v157;
                      int v13 = v152;
                      v134 = v58;
                      unint64_t v15 = 0x263F08000;
                      v137 = v141;
                      v139 = (void *)v57;
                      v140 = v133;
                      v62 = (void *)v155;
                    }
                  }
                  else
                  {
                    v143 = (void *)MEMORY[0x2533B64D0]();
                    v87 = v159;
                    v88 = HMFGetOSLogHandle();
                    if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
                    {
                      v89 = HMFGetLogIdentifier();
                      int v90 = [v34 unsignedIntValue];
                      int v91 = [v34 unsignedIntValue];
                      *(_DWORD *)buf = 138543874;
                      v166 = v89;
                      __int16 v167 = 1024;
                      *(_DWORD *)v168 = v90;
                      int v13 = v152;
                      *(_WORD *)&v168[4] = 1024;
                      *(_DWORD *)&v168[6] = v91;
                      _os_log_impl(&dword_252495000, v88, OS_LOG_TYPE_ERROR, "%{public}@f/%x/n doesn't match f/%x/o", buf, 0x18u);

                      unint64_t v15 = 0x263F08000;
                    }

                    id v32 = v157;
                    v62 = (void *)v155;
                  }
                  v82 = (void *)v147;
                }
                else
                {
                  v146 = (void *)MEMORY[0x2533B64D0]();
                  v78 = v159;
                  v79 = HMFGetOSLogHandle();
                  v41 = v153;
                  if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
                  {
                    v80 = HMFGetLogIdentifier();
                    int v81 = [v34 unsignedIntValue];
                    *(_DWORD *)buf = 138543618;
                    v166 = v80;
                    __int16 v167 = 1024;
                    *(_DWORD *)v168 = v81;
                    _os_log_impl(&dword_252495000, v79, OS_LOG_TYPE_ERROR, "%{public}@No f/%x/n in storage", buf, 0x12u);

                    unint64_t v15 = 0x263F08000;
                  }

                  id v32 = v157;
                  v62 = (void *)v155;
                  v82 = (void *)v147;
                }
              }
              else
              {
                v149 = (void *)MEMORY[0x2533B64D0]();
                v83 = v159;
                v84 = HMFGetOSLogHandle();
                int v13 = v42;
                if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
                {
                  v85 = HMFGetLogIdentifier();
                  int v86 = [v34 unsignedIntValue];
                  *(_DWORD *)buf = 138543618;
                  v166 = v85;
                  __int16 v167 = 1024;
                  *(_DWORD *)v168 = v86;
                  _os_log_impl(&dword_252495000, v84, OS_LOG_TYPE_ERROR, "%{public}@f/%x/o format mismatch", buf, 0x12u);

                  unint64_t v15 = 0x263F08000;
                }

                id v32 = v157;
                v62 = (void *)v155;
                v41 = v153;
              }
            }
            else
            {
              v73 = (void *)MEMORY[0x2533B64D0]();
              v74 = v159;
              v75 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
              {
                v76 = HMFGetLogIdentifier();
                int v77 = [v34 unsignedIntValue];
                *(_DWORD *)buf = 138543618;
                v166 = v76;
                __int16 v167 = 1024;
                *(_DWORD *)v168 = v77;
                _os_log_impl(&dword_252495000, v75, OS_LOG_TYPE_ERROR, "%{public}@No f/%x/o in storage", buf, 0x12u);

                unint64_t v15 = 0x263F08000;
              }

              int v13 = v152;
              v41 = v153;
              id v32 = v157;
              v62 = (void *)v155;
            }
          }
          else
          {
            v68 = (void *)MEMORY[0x2533B64D0]();
            v69 = v159;
            v70 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
            {
              v71 = HMFGetLogIdentifier();
              int v72 = [v34 unsignedIntValue];
              *(_DWORD *)buf = 138543618;
              v166 = v71;
              __int16 v167 = 1024;
              *(_DWORD *)v168 = v72;
              _os_log_impl(&dword_252495000, v70, OS_LOG_TYPE_INFO, "%{public}@Ignoring incompatible system commissioner fabric in MatterSupport storage with index: 0x%x", buf, 0x12u);

              int v13 = v152;
            }

            unint64_t v15 = 0x263F08000;
            id v32 = v157;
          }

          goto LABEL_73;
        }
      }
      v63 = (void *)MEMORY[0x2533B64D0]();
      v64 = v159;
      v65 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        v66 = HMFGetLogIdentifier();
        int v67 = [v34 unsignedIntValue];
        *(_DWORD *)buf = 138543618;
        v166 = v66;
        __int16 v167 = 1024;
        *(_DWORD *)v168 = v67;
        _os_log_impl(&dword_252495000, v65, OS_LOG_TYPE_ERROR, "%{public}@f/%x/r isn't base 64 encoded", buf, 0x12u);
      }
      id v32 = v157;
LABEL_73:
    }
    uint64_t v160 = [v32 countByEnumeratingWithState:&v161 objects:v170 count:16];
  }
  while (v160);

  if (v137)
  {
    v94 = (void *)MEMORY[0x2533B64D0]();
    v95 = v159;
    v96 = HMFGetOSLogHandle();
    id v25 = v125;
    id v17 = v126;
    v26 = v124;
    v97 = v140;
    if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
    {
      v98 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v166 = v98;
      __int16 v167 = 2112;
      *(void *)v168 = v137;
      *(_WORD *)&v168[8] = 2112;
      v169 = v140;
      _os_log_impl(&dword_252495000, v96, OS_LOG_TYPE_INFO, "%{public}@Picked fabric index %@ with fabric ID %@", buf, 0x20u);
    }
    id v99 = v134;
    id *v128 = v99;
    id v100 = v135;
    id *v127 = v100;
    v101 = v136;
    id *v123 = v101;
    BOOL v102 = 1;
    v103 = v139;
    v104 = v137;
  }
  else
  {
    BOOL v102 = 0;
    v104 = 0;
    id v25 = v125;
    id v17 = v126;
    v26 = v124;
    id v100 = v135;
    v101 = v136;
    id v99 = v134;
    v103 = v139;
    v97 = v140;
  }
LABEL_97:

LABEL_98:
LABEL_99:

LABEL_100:
LABEL_101:

LABEL_102:
  return v102;
}

- (void)_updateMTSKeyValueStore:(id)a3
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMMTRSystemCommissionerControllerParams *)self mtsKeyValueStore];
  v6 = v5;
  if (v5)
  {
    uint64_t v39 = self;
    v37 = v4;
    [v5 storedValuesByKey];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 countByEnumeratingWithState:&v47 objects:v56 count:16];
    v40 = v6;
    id v38 = v7;
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v48 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          if ([v12 hasPrefix:@"f/"])
          {
            id v46 = 0;
            char v13 = [v6 removeStoredValueForKey:v12 error:&v46];
            id v14 = v46;
            if ((v13 & 1) == 0)
            {
              unint64_t v15 = (void *)MEMORY[0x2533B64D0]();
              uint64_t v16 = v39;
              id v17 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                id v18 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                v53 = v18;
                __int16 v54 = 2112;
                v55 = v12;
                _os_log_impl(&dword_252495000, v17, OS_LOG_TYPE_ERROR, "%{public}@Could not remove key '%@' from MTSKeyValueStore", buf, 0x16u);
              }
              v6 = v40;
              id v7 = v38;
            }
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v47 objects:v56 count:16];
      }
      while (v9);
    }

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v19 = v37;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v42 objects:v51 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v43;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v43 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = *(void **)(*((void *)&v42 + 1) + 8 * j);
          id v25 = [v19 objectForKeyedSubscript:v24];
          v26 = [v25 base64EncodedStringWithOptions:0];
          id v41 = 0;
          char v27 = [v6 setStoredValue:v26 forKey:v24 error:&v41];
          id v28 = v41;

          if ((v27 & 1) == 0)
          {
            v29 = (void *)MEMORY[0x2533B64D0]();
            v30 = v39;
            v31 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              id v32 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v53 = v32;
              __int16 v54 = 2112;
              v55 = v24;
              _os_log_impl(&dword_252495000, v31, OS_LOG_TYPE_ERROR, "%{public}@Could not store key '%@' into MTSKeyValueStore", buf, 0x16u);
            }
            v6 = v40;
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v42 objects:v51 count:16];
      }
      while (v21);
    }

    id v4 = v37;
  }
  else
  {
    v33 = (void *)MEMORY[0x2533B64D0]();
    v34 = self;
    v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v36 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v53 = v36;
      _os_log_impl(&dword_252495000, v35, OS_LOG_TYPE_ERROR, "%{public}@Could not retrieve MTSKeyValueStore to update", buf, 0xCu);
    }
  }
}

- (void)_obtainControllerWrapperWithV1KeyPair:(id)a3 startupParams:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMMTRSystemCommissionerControllerParams *)self controllerWrapper];
  [v8 remove];

  [(HMMTRSystemCommissionerControllerParams *)self setV1keypair:v6];
  uint64_t v9 = [(HMMTRSystemCommissionerControllerParams *)self controllerFactory];
  uint64_t v10 = [v9 wrapperWithName:@"System Commissioner Controller" startupParams:v7 entityIdentifier:0];
  [(HMMTRSystemCommissionerControllerParams *)self setControllerWrapper:v10];

  id v11 = (void *)MEMORY[0x2533B64D0]();
  id v12 = self;
  char v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = HMFGetLogIdentifier();
    unint64_t v15 = [(HMMTRSystemCommissionerControllerParams *)v12 controllerWrapper];
    uint64_t v16 = [v7 fabricID];
    int v17 = 138543874;
    id v18 = v14;
    __int16 v19 = 2112;
    uint64_t v20 = v15;
    __int16 v21 = 2112;
    uint64_t v22 = v16;
    _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_INFO, "%{public}@Obtained controller wrapper %@ for fabric ID %@", (uint8_t *)&v17, 0x20u);
  }
}

- (void)_buildV1KeyWithPrivateKey:(__SecKey *)a3 operationalKey:(__SecKey *)a4 ipk:(id)a5 rootCert:(id)a6 operationalCert:(id)a7 updatingMTSKeyValueStore:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  int v17 = [(HMMTRSystemCommissionerControllerParams *)self storeV1MatterKeypairWithPrivateKey:a3 operationalKey:a4 rootCert:v15 operationalCert:v16 ipk:v14];
  if (v17)
  {
    id v18 = [[HMMTRMatterKeypair alloc] initWithPrivateKey:a4];
    if (v18)
    {
      __int16 v19 = [[HMMTRControllerParameters alloc] initWithIPK:v14 operationalKeypair:v18 operationalCertificate:v16 intermediateCertificate:0 rootCertificate:v15];
      uint64_t v20 = v19;
      if (v19)
      {
        [(HMMTRControllerParameters *)v19 setVendorID:&unk_2702B57F0];
        if (v8)
        {
          __int16 v21 = [(HMMTRMatterKeypair *)v18 serialize];
          if (v21)
          {
            [(HMMTRSystemCommissionerControllerParams *)self setGeneratingKeyPair:1];
            uint64_t v22 = [(HMMTRSystemCommissionerControllerParams *)self controllerFactory];
            uint64_t v23 = [v22 stackStorageWithStartupParams:v20 operationalKeyPairTLV:v21];

            context = (void *)MEMORY[0x2533B64D0]();
            v24 = self;
            id v25 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v26 = long long v43 = v23;
              *(_DWORD *)buf = 138543362;
              long long v47 = v26;
              _os_log_impl(&dword_252495000, v25, OS_LOG_TYPE_INFO, "%{public}@Dumping storage content to MTSKeyValueStore for backward compatibility", buf, 0xCu);

              uint64_t v23 = v43;
            }

            [(HMMTRSystemCommissionerControllerParams *)v24 _updateMTSKeyValueStore:v23];
            [(HMMTRSystemCommissionerControllerParams *)v24 _startWithV1Keypair:v17];
            [(HMMTRSystemCommissionerControllerParams *)v24 setGeneratingKeyPair:0];
          }
          else
          {
            uint64_t v39 = (void *)MEMORY[0x2533B64D0]();
            v40 = self;
            id v41 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              long long v42 = contexta = v39;
              *(_DWORD *)buf = 138543362;
              long long v47 = v42;
              _os_log_impl(&dword_252495000, v41, OS_LOG_TYPE_ERROR, "%{public}@Could not serialize operational key pair", buf, 0xCu);

              uint64_t v39 = contexta;
            }
          }
        }
        else
        {
          [(HMMTRSystemCommissionerControllerParams *)self _startWithV1Keypair:v17];
        }
      }
      else
      {
        v35 = (void *)MEMORY[0x2533B64D0]();
        v36 = self;
        v37 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          id v38 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          long long v47 = v38;
          _os_log_impl(&dword_252495000, v37, OS_LOG_TYPE_ERROR, "%{public}@Bad startup parameter", buf, 0xCu);
        }
      }
    }
    else
    {
      v31 = (void *)MEMORY[0x2533B64D0]();
      id v32 = self;
      v33 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v34 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        long long v47 = v34;
        _os_log_impl(&dword_252495000, v33, OS_LOG_TYPE_ERROR, "%{public}@Could not build operational key pair from V1 Key. System commissioner won't be functional.", buf, 0xCu);
      }
    }
  }
  else
  {
    char v27 = (void *)MEMORY[0x2533B64D0]();
    id v28 = self;
    v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v47 = v30;
      _os_log_impl(&dword_252495000, v29, OS_LOG_TYPE_ERROR, "%{public}@Could not build V1 key. System commissioner won't be functional.", buf, 0xCu);
    }
  }
}

- (void)_buildV1KeyWithV0KeyPair:(id)a3
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", +[HMMTRUtilities randomNodeID](HMMTRUtilities, "randomNodeID"));
  id v6 = (void *)MEMORY[0x2533B64D0]();
  id v7 = self;
  BOOL v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v52 = v9;
    __int16 v53 = 2112;
    id v54 = v5;
    _os_log_impl(&dword_252495000, v8, OS_LOG_TYPE_INFO, "%{public}@Building new fabric certs with fabricID: %@", buf, 0x16u);
  }
  int v10 = SecRandomCopyBytes((SecRandomRef)*MEMORY[0x263F17510], 0x10uLL, bytes);
  if (v10)
  {
    int v11 = v10;
    id v12 = (void *)MEMORY[0x2533B64D0]();
    char v13 = v7;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v52 = v15;
      __int16 v53 = 2112;
      id v54 = v5;
      __int16 v55 = 1024;
      LODWORD(v56) = v11;
      _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_ERROR, "%{public}@FATAL Error: Failed to generate IPK for fabric ID %@. Status: %d", buf, 0x1Cu);
    }
  }
  else
  {
    id v16 = [MEMORY[0x263EFF8F8] dataWithBytes:bytes length:16];
    int v17 = [v16 base64EncodedStringWithOptions:0];
    id v50 = 0;
    [(HMMTRSystemCommissionerControllerParams *)v7 setMTSStoredValue:v17 forKey:@"IPK" error:&v50];
    id v18 = v50;

    __int16 v19 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v20 = v7;
    __int16 v21 = HMFGetOSLogHandle();
    uint64_t v22 = v21;
    if (v18)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v52 = v23;
        __int16 v53 = 2112;
        id v54 = v18;
        _os_log_impl(&dword_252495000, v22, OS_LOG_TYPE_ERROR, "%{public}@FATAL Error: Failed to store IPK in system commissioner storage: %@", buf, 0x16u);
      }
    }
    else
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v52 = v24;
        _os_log_impl(&dword_252495000, v22, OS_LOG_TYPE_INFO, "%{public}@IPK for System Commissioner was generated and stored", buf, 0xCu);
      }
      id v49 = 0;
      id v25 = [MEMORY[0x263F10CC0] createRootCertificate:v4 issuerID:0 fabricID:v5 error:&v49];
      id v18 = v49;
      if (v25)
      {
        v26 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", +[HMMTRUtilities randomNodeID](HMMTRUtilities, "randomNodeID"));
        char v27 = (void *)MEMORY[0x2533B64D0]();
        id v28 = v20;
        v29 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          v30 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          v52 = v30;
          __int16 v53 = 2112;
          id v54 = v5;
          __int16 v55 = 2112;
          id v56 = v26;
          _os_log_impl(&dword_252495000, v29, OS_LOG_TYPE_INFO, "%{public}@Generated RCAC for fabric %@, controller node ID: %@", buf, 0x20u);
        }
        id v31 = [[HMMTRMatterKeypair alloc] initUnassociated];
        id v32 = v31;
        if (v31)
        {
          id v48 = v18;
          v33 = objc_msgSend(MEMORY[0x263F10CC0], "createOperationalCertificate:signingCertificate:operationalPublicKey:fabricID:nodeID:caseAuthenticatedTags:error:", v4, v25, objc_msgSend(v31, "publicKey"), v5, v26, 0, &v48);
          id v34 = v48;

          if (v33)
          {
            -[HMMTRSystemCommissionerControllerParams _buildV1KeyWithPrivateKey:operationalKey:ipk:rootCert:operationalCert:updatingMTSKeyValueStore:](v28, "_buildV1KeyWithPrivateKey:operationalKey:ipk:rootCert:operationalCert:updatingMTSKeyValueStore:", [v4 privateKey], objc_msgSend(v32, "privateKey"), v16, v25, v33, 1);
          }
          else
          {
            context = (void *)MEMORY[0x2533B64D0]();
            long long v43 = v28;
            long long v44 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            {
              long long v45 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543874;
              v52 = v45;
              __int16 v53 = 2112;
              id v54 = v5;
              __int16 v55 = 2112;
              id v56 = v34;
              _os_log_impl(&dword_252495000, v44, OS_LOG_TYPE_ERROR, "%{public}@FATAL Error: Failed to generate ooperational cert for fabric ID %@. error: %@", buf, 0x20u);
            }
          }

          id v18 = v34;
        }
        else
        {
          uint64_t v39 = (void *)MEMORY[0x2533B64D0]();
          v40 = v28;
          id v41 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            long long v42 = contexta = v39;
            *(_DWORD *)buf = 138543362;
            v52 = v42;
            _os_log_impl(&dword_252495000, v41, OS_LOG_TYPE_ERROR, "%{public}@Failed to generate operational key", buf, 0xCu);

            uint64_t v39 = contexta;
          }
        }
      }
      else
      {
        v35 = (void *)MEMORY[0x2533B64D0]();
        v36 = v20;
        v37 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          id v38 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          v52 = v38;
          __int16 v53 = 2112;
          id v54 = v5;
          __int16 v55 = 2112;
          id v56 = v18;
          _os_log_impl(&dword_252495000, v37, OS_LOG_TYPE_ERROR, "%{public}@FATAL Error: Failed to generate root cert for fabric ID %@. error: %@", buf, 0x20u);
        }
      }
    }
  }
}

- (void)_buildV1KeyFromScratch
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = [(HMMTRSystemCommissionerControllerParams *)self storeV0MatterKeypair];
  id v4 = (void *)MEMORY[0x2533B64D0]();
  v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    int v11 = v3;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_INFO, "%{public}@Using new key pair for system commissioner: %@", (uint8_t *)&v8, 0x16u);
  }
  [(HMMTRSystemCommissionerControllerParams *)v5 _buildV1KeyWithV0KeyPair:v3];
}

- (void)_buildV1KeyFromV0KeyAllowingNew:(BOOL)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  v5 = (void *)MEMORY[0x2533B64D0](self, a2);
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v49 = v8;
    _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@Building V1 key from V0 key", buf, 0xCu);
  }
  uint64_t v9 = [(HMMTRSystemCommissionerControllerParams *)v6 v0MatterKeypairFromKeychain];
  if (v9)
  {
    id v46 = 0;
    id v47 = 0;
    id v44 = 0;
    id v45 = 0;
    BOOL v10 = [(HMMTRSystemCommissionerControllerParams *)v6 _findFabricRecordInMTSKeyValueStoreMatchingKeyPair:v9 ipk:&v47 rootCert:&v46 operationalKey:&v45 operationalCert:&v44];
    id v11 = v47;
    id v12 = v46;
    id v13 = v45;
    id v14 = v44;
    id v15 = (void *)MEMORY[0x2533B64D0]();
    id v16 = v6;
    int v17 = HMFGetOSLogHandle();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
    if (v10)
    {
      if (v18)
      {
        __int16 v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v49 = v19;
        _os_log_impl(&dword_252495000, v17, OS_LOG_TYPE_INFO, "%{public}@Check if MTS stored cert has correct validity period", buf, 0xCu);
      }
      id v43 = 0;
      BOOL v20 = +[HMMTRStorage checkAndUpdateExpiryOfCertificate:v12 keyPair:v9 newCertificate:&v43];
      id v21 = v43;
      id v42 = v11;
      if (v20)
      {
        uint64_t v22 = (void *)MEMORY[0x2533B64D0]();
        uint64_t v23 = v16;
        v24 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          id v25 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          id v49 = v25;
          _os_log_impl(&dword_252495000, v24, OS_LOG_TYPE_ERROR, "%{public}@V1 key will be updated using new root cert. This will disrupt all paired accessories", buf, 0xCu);
        }
        id v26 = v21;

        id v12 = v26;
      }
      char v27 = (void *)MEMORY[0x2533B64D0]();
      id v28 = v16;
      v29 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        v30 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v49 = v30;
        _os_log_impl(&dword_252495000, v29, OS_LOG_TYPE_INFO, "%{public}@Propagating V1 key from V0 key and storage certs", buf, 0xCu);
      }
      uint64_t v31 = [v9 privateKey];
      uint64_t v32 = [v13 privateKey];
      uint64_t v33 = v31;
      id v11 = v42;
      [(HMMTRSystemCommissionerControllerParams *)v28 _buildV1KeyWithPrivateKey:v33 operationalKey:v32 ipk:v42 rootCert:v12 operationalCert:v14 updatingMTSKeyValueStore:0];
    }
    else if (a3)
    {
      if (v18)
      {
        uint64_t v39 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v49 = v39;
        _os_log_impl(&dword_252495000, v17, OS_LOG_TYPE_INFO, "%{public}@Propagating V1 key from V0 key and creating new fabric certs", buf, 0xCu);
      }
      [(HMMTRSystemCommissionerControllerParams *)v16 _buildV1KeyWithV0KeyPair:v9];
    }
    else
    {
      if (v18)
      {
        id v41 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v49 = v41;
        _os_log_impl(&dword_252495000, v17, OS_LOG_TYPE_INFO, "%{public}@No fabric records present in MTS storage for matching V0 key pair", buf, 0xCu);
      }
    }
  }
  else
  {
    id v34 = (void *)MEMORY[0x2533B64D0]();
    v35 = v6;
    v36 = HMFGetOSLogHandle();
    BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_INFO);
    if (a3)
    {
      if (v37)
      {
        id v38 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v49 = v38;
        _os_log_impl(&dword_252495000, v36, OS_LOG_TYPE_INFO, "%{public}@No V0 keypair present. Building new V1 keypair.", buf, 0xCu);
      }
      [(HMMTRSystemCommissionerControllerParams *)v35 _buildV1KeyFromScratch];
    }
    else
    {
      if (v37)
      {
        v40 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v49 = v40;
        _os_log_impl(&dword_252495000, v36, OS_LOG_TYPE_INFO, "%{public}@No V0 keypair present", buf, 0xCu);
      }
    }
  }
}

- (id)_buildControllerParams2WithV1Keypair:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 operationalKey]) {
    v5 = -[HMMTRMatterKeypair initWithPrivateKey:]([HMMTRMatterKeypair alloc], "initWithPrivateKey:", [v4 operationalKey]);
  }
  else {
    v5 = 0;
  }
  dispatch_queue_t v6 = dispatch_queue_create("HMMTRPerControllerStorage queue for System Commissioner fabric", 0);
  id v7 = [[HMMTRSystemCommissionerPerControllerStorage alloc] initWithQueue:v6];
  int v8 = [HMMTRControllerParameters alloc];
  uint64_t v9 = [MEMORY[0x263F08C38] UUID];
  BOOL v10 = [v4 ipk];
  id v11 = [v4 operationalCert];
  id v12 = [v4 rootCert];
  id v13 = [(HMMTRControllerParameters *)v8 initWithStorageDelegate:v7 storageDelegateQueue:v6 uniqueIdentifier:v9 ipk:v10 vendorID:&unk_2702B57F0 operationalKeypair:v5 operationalCertificate:v11 intermediateCertificate:0 rootCertificate:v12];

  if (v13)
  {
    id v14 = (void *)MEMORY[0x263F10CC0];
    id v15 = [v4 operationalCert];
    id v16 = [v14 convertX509Certificate:v15];

    int v17 = (void *)[objc_alloc(MEMORY[0x263F10CB8]) initWithTLVBytes:v16];
    BOOL v18 = v17;
    if (v17)
    {
      __int16 v19 = [v17 subject];
      BOOL v20 = [v19 fabricID];
      [(HMMTRSystemCommissionerControllerParams *)self setCommissioningFabricID:v20];

      id v21 = [v18 subject];
      uint64_t v22 = [v21 nodeID];
      [(HMMTRSystemCommissionerControllerParams *)self setAdminNodeID:v22];

      [(HMMTRControllerParameters *)v13 setOperationalCertificateIssuer:self];
      uint64_t v23 = [(HMMTRSystemCommissionerControllerParams *)self workQueue];
      [(HMMTRControllerParameters *)v13 setOperationalCertificateIssuerQueue:v23];

      v24 = [(HMMTRSystemCommissionerControllerParams *)self certificationDeclarationCertificates];
      [(HMMTRControllerParameters *)v13 setCertificationDeclarationCertificates:v24];

      id v25 = [(HMMTRSystemCommissionerControllerParams *)self productAttestationAuthorityCertificates];
      [(HMMTRControllerParameters *)v13 setProductAttestationAuthorityCertificates:v25];

      id v26 = v13;
    }
    else
    {
      uint64_t v31 = (void *)MEMORY[0x2533B64D0]();
      uint64_t v32 = self;
      uint64_t v33 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v34 = v36 = v31;
        *(_DWORD *)buf = 138543362;
        id v38 = v34;
        _os_log_impl(&dword_252495000, v33, OS_LOG_TYPE_ERROR, "%{public}@Bad NOC in V1 key", buf, 0xCu);

        uint64_t v31 = v36;
      }

      id v26 = 0;
    }
  }
  else
  {
    char v27 = (void *)MEMORY[0x2533B64D0]();
    id v28 = self;
    v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v38 = v30;
      _os_log_impl(&dword_252495000, v29, OS_LOG_TYPE_ERROR, "%{public}@Bad startup parameter from V1 keypair", buf, 0xCu);
    }
    id v26 = 0;
  }

  return v26;
}

- (id)_buildControllerParams1WithV1Keypair:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 operationalKey]) {
    v5 = -[HMMTRMatterKeypair initWithPrivateKey:]([HMMTRMatterKeypair alloc], "initWithPrivateKey:", [v4 operationalKey]);
  }
  else {
    v5 = 0;
  }
  dispatch_queue_t v6 = [HMMTRControllerParameters alloc];
  id v7 = [v4 ipk];
  int v8 = [v4 operationalCert];
  uint64_t v9 = [v4 rootCert];
  BOOL v10 = [(HMMTRControllerParameters *)v6 initWithIPK:v7 operationalKeypair:v5 operationalCertificate:v8 intermediateCertificate:0 rootCertificate:v9];

  if (v10)
  {
    id v11 = (void *)MEMORY[0x263F10CC0];
    id v12 = [v4 operationalCert];
    id v13 = [v11 convertX509Certificate:v12];

    id v14 = (void *)[objc_alloc(MEMORY[0x263F10CB8]) initWithTLVBytes:v13];
    id v15 = v14;
    if (v14)
    {
      id v16 = [v14 subject];
      int v17 = [v16 fabricID];
      [(HMMTRSystemCommissionerControllerParams *)self setCommissioningFabricID:v17];

      BOOL v18 = [v15 subject];
      __int16 v19 = [v18 nodeID];
      [(HMMTRSystemCommissionerControllerParams *)self setAdminNodeID:v19];

      [(HMMTRControllerParameters *)v10 setVendorID:&unk_2702B57F0];
      [(HMMTRControllerParameters *)v10 setOperationalCertificateIssuer:self];
      BOOL v20 = [(HMMTRSystemCommissionerControllerParams *)self workQueue];
      [(HMMTRControllerParameters *)v10 setOperationalCertificateIssuerQueue:v20];

      id v21 = v10;
    }
    else
    {
      id v26 = (void *)MEMORY[0x2533B64D0]();
      char v27 = self;
      id v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v29 = HMFGetLogIdentifier();
        int v31 = 138543362;
        uint64_t v32 = v29;
        _os_log_impl(&dword_252495000, v28, OS_LOG_TYPE_ERROR, "%{public}@Bad NOC in V1 key", (uint8_t *)&v31, 0xCu);
      }
      id v21 = 0;
    }
  }
  else
  {
    uint64_t v22 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v23 = self;
    v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      id v25 = HMFGetLogIdentifier();
      int v31 = 138543362;
      uint64_t v32 = v25;
      _os_log_impl(&dword_252495000, v24, OS_LOG_TYPE_ERROR, "%{public}@Bad startup parameter from V1 keypair", (uint8_t *)&v31, 0xCu);
    }
    id v21 = 0;
  }

  return v21;
}

- (void)_startWithV1Keypair:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMMTRSystemCommissionerControllerParams *)self controllerFactory];
  int v6 = [v5 usesCommonStorage];

  if (v6) {
    [(HMMTRSystemCommissionerControllerParams *)self _buildControllerParams1WithV1Keypair:v4];
  }
  else {
  id v7 = [(HMMTRSystemCommissionerControllerParams *)self _buildControllerParams2WithV1Keypair:v4];
  }
  if (v7)
  {
    [(HMMTRSystemCommissionerControllerParams *)self _obtainControllerWrapperWithV1KeyPair:v4 startupParams:v7];
  }
  else
  {
    int v8 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v9 = self;
    BOOL v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      int v12 = 138543362;
      id v13 = v11;
      _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to generate controller parameters from V1 keypair", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (BOOL)_checkAndUpdateValidityPeriodOfV1Keypair:(id)a3 newKeyPair:(id *)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [v6 rootCert];
  id v20 = 0;
  BOOL v8 = +[HMMTRStorage checkAndUpdateExpiryOfCertificate:v7 keyPair:v6 newCertificate:&v20];
  id v9 = v20;

  if (v8)
  {
    BOOL v10 = (void *)MEMORY[0x2533B64D0]();
    id v11 = self;
    int v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v22 = v13;
      _os_log_impl(&dword_252495000, v12, OS_LOG_TYPE_ERROR, "%{public}@V1 key pair root cert is updated. This will disrupt already paired accessories.", buf, 0xCu);
    }
    uint64_t v14 = [v6 privateKey];
    uint64_t v15 = [v6 operationalKey];
    id v16 = [v6 operationalCert];
    int v17 = [v6 ipk];
    *a4 = [(HMMTRSystemCommissionerControllerParams *)v11 storeV1MatterKeypairWithPrivateKey:v14 operationalKey:v15 rootCert:v9 operationalCert:v16 ipk:v17];

    BOOL v18 = *a4 != 0;
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (void)issueOperationalCertificateForRequest:(id)a3 attestationInfo:(id)a4 controller:(id)a5 completion:(id)a6
{
  v65[2] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void *, void))a6;
  uint64_t v14 = [(HMMTRSystemCommissionerControllerParams *)self commissioneeNodeID];

  if (v14)
  {
    uint64_t v15 = (void *)MEMORY[0x263F10CC0];
    id v16 = [v10 csr];
    id v57 = 0;
    CFDataRef v17 = [v15 publicKeyFromCSR:v16 error:&v57];
    id v18 = v57;

    if (v17)
    {
      id v54 = v11;
      uint64_t v19 = *MEMORY[0x263F16FB8];
      uint64_t v20 = *MEMORY[0x263F16F68];
      v64[0] = *MEMORY[0x263F16FA8];
      v64[1] = v20;
      uint64_t v21 = *MEMORY[0x263F16F80];
      v65[0] = v19;
      v65[1] = v21;
      CFDictionaryRef v22 = [NSDictionary dictionaryWithObjects:v65 forKeys:v64 count:2];
      CFErrorRef error = 0;
      SecKeyRef v23 = SecKeyCreateWithData(v17, v22, &error);
      if (v23)
      {
        SecKeyRef v24 = v23;
        [(HMMTRSystemCommissionerControllerParams *)self v1keypair];
        id v25 = v53 = v10;
        id v26 = [v25 rootCert];

        char v27 = (void *)MEMORY[0x263F10CC0];
        [(HMMTRSystemCommissionerControllerParams *)self v1keypair];
        id v28 = v52 = v12;
        [(HMMTRSystemCommissionerControllerParams *)self commissioningFabricID];
        CFDataRef v51 = v17;
        v30 = CFDictionaryRef v29 = v22;
        int v31 = [(HMMTRSystemCommissionerControllerParams *)self commissioneeNodeID];
        id v55 = v18;
        uint64_t v32 = [v27 createOperationalCertificate:v28 signingCertificate:v26 operationalPublicKey:v24 fabricID:v30 nodeID:v31 caseAuthenticatedTags:0 error:&v55];
        id v33 = v55;

        CFDictionaryRef v22 = v29;
        CFDataRef v17 = v51;

        id v34 = objc_alloc(MEMORY[0x263F10F08]);
        v35 = [(HMMTRSystemCommissionerControllerParams *)self adminNodeID];
        v36 = (void *)[v34 initWithOperationalCertificate:v32 intermediateCertificate:0 rootCertificate:v26 adminSubject:v35];

        id v12 = v52;
        v13[2](v13, v36, 0);

        id v18 = v33;
        id v10 = v53;
      }
      else
      {
        id v46 = (void *)MEMORY[0x2533B64D0]();
        id v47 = self;
        id v48 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v50 = id v49 = v10;
          *(_DWORD *)buf = 138543874;
          id v59 = v50;
          __int16 v60 = 2112;
          CFDataRef v61 = v17;
          __int16 v62 = 2112;
          CFErrorRef v63 = error;
          _os_log_impl(&dword_252495000, v48, OS_LOG_TYPE_ERROR, "%{public}@Failed to create SecKey from %@: %@", buf, 0x20u);

          id v10 = v49;
        }

        ((void (**)(id, void *, CFErrorRef))v13)[2](v13, 0, error);
      }

      id v11 = v54;
    }
    else
    {
      id v41 = (void *)MEMORY[0x2533B64D0]();
      id v42 = self;
      id v43 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v45 = v44 = v11;
        *(_DWORD *)buf = 138543618;
        id v59 = v45;
        __int16 v60 = 2112;
        CFDataRef v61 = (const __CFData *)v18;
        _os_log_impl(&dword_252495000, v43, OS_LOG_TYPE_ERROR, "%{public}@Failed to extract public key from CSR: %@", buf, 0x16u);

        id v11 = v44;
      }

      ((void (**)(id, void *, id))v13)[2](v13, 0, v18);
    }
  }
  else
  {
    BOOL v37 = (void *)MEMORY[0x2533B64D0]();
    id v38 = self;
    uint64_t v39 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      v40 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v59 = v40;
      _os_log_impl(&dword_252495000, v39, OS_LOG_TYPE_ERROR, "%{public}@No commissionee node ID assigned yet. Not issuing NOC.", buf, 0xCu);
    }
    id v18 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F10BB0] code:6 userInfo:0];
    ((void (**)(id, void *, id))v13)[2](v13, 0, v18);
  }
}

- (BOOL)shouldSkipAttestationCertificateValidation
{
  return 0;
}

- (void)handleKeyPairDataChanged
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x2533B64D0](self, a2);
  id v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v10 = v6;
    _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_INFO, "%{public}@Keypair data changed", buf, 0xCu);
  }
  id v7 = [(HMMTRSystemCommissionerControllerParams *)v4 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__HMMTRSystemCommissionerControllerParams_handleKeyPairDataChanged__block_invoke;
  block[3] = &unk_265378638;
  block[4] = v4;
  dispatch_async(v7, block);
}

void __67__HMMTRSystemCommissionerControllerParams_handleKeyPairDataChanged__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) generatingKeyPair])
  {
    id v2 = (void *)MEMORY[0x2533B64D0]();
    id v3 = *(id *)(a1 + 32);
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = HMFGetLogIdentifier();
      int v7 = 138543362;
      BOOL v8 = v5;
      _os_log_impl(&dword_252495000, v4, OS_LOG_TYPE_INFO, "%{public}@Currently generating key pair. Will ignore the keypair data change.", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    id v6 = *(void **)(a1 + 32);
    [v6 _handleKeychainDataChanged];
  }
}

- (BOOL)fetchControllerParamsAllowingNew:(BOOL)a3 nocSigner:(id *)a4 controllerWrapper:(id *)a5
{
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  SecKeyRef v23 = __Block_byref_object_copy__6733;
  SecKeyRef v24 = __Block_byref_object_dispose__6734;
  id v25 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  CFDataRef v17 = __Block_byref_object_copy__6733;
  id v18 = __Block_byref_object_dispose__6734;
  id v19 = 0;
  uint64_t v9 = [(HMMTRSystemCommissionerControllerParams *)self workQueue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __104__HMMTRSystemCommissionerControllerParams_fetchControllerParamsAllowingNew_nocSigner_controllerWrapper___block_invoke;
  v12[3] = &unk_265376368;
  BOOL v13 = a3;
  v12[4] = self;
  v12[5] = &v20;
  v12[6] = &v14;
  dispatch_sync(v9, v12);

  uint64_t v10 = v15[5];
  if (v10)
  {
    *a4 = (id) v21[5];
    *a5 = (id) v15[5];
  }
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v10 != 0;
}

void __104__HMMTRSystemCommissionerControllerParams_fetchControllerParamsAllowingNew_nocSigner_controllerWrapper___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) controllerWrapper];

  if (v2)
  {
    id v3 = (void *)MEMORY[0x2533B64D0]();
    id v4 = *(id *)(a1 + 32);
    v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v6 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v26 = v6;
      _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_DEBUG, "%{public}@No new fabric created. Returning previous controller wrapper.", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 32) v1MatterKeypairFromKeychain];
    if (v7)
    {
      BOOL v8 = (void *)v7;
      if (*(unsigned char *)(a1 + 56))
      {
        uint64_t v9 = *(void **)(a1 + 32);
        id v24 = 0;
        int v10 = [v9 _checkAndUpdateValidityPeriodOfV1Keypair:v8 newKeyPair:&v24];
        id v11 = v24;
        id v12 = v11;
        if (v10)
        {
          id v13 = v11;

          BOOL v8 = v13;
        }
      }
      [*(id *)(a1 + 32) _startWithV1Keypair:v8];
    }
    else
    {
      uint64_t v14 = (void *)MEMORY[0x2533B64D0]();
      id v15 = *(id *)(a1 + 32);
      uint64_t v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        CFDataRef v17 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v26 = v17;
        _os_log_impl(&dword_252495000, v16, OS_LOG_TYPE_INFO, "%{public}@No V1 keypair present", buf, 0xCu);
      }
      [*(id *)(a1 + 32) _buildV1KeyFromV0KeyAllowingNew:*(unsigned __int8 *)(a1 + 56)];
    }
  }
  uint64_t v18 = [*(id *)(a1 + 32) v1keypair];
  uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v20 = *(void **)(v19 + 40);
  *(void *)(v19 + 40) = v18;

  uint64_t v21 = [*(id *)(a1 + 32) controllerWrapper];
  uint64_t v22 = *(void *)(*(void *)(a1 + 48) + 8);
  SecKeyRef v23 = *(void **)(v22 + 40);
  *(void *)(v22 + 40) = v21;
}

- (HMMTRSystemCommissionerControllerParams)initWithQueue:(id)a3 controllerFactory:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMMTRSystemCommissionerControllerParams;
  uint64_t v9 = [(HMMTRSystemCommissionerControllerParams *)&v12 init];
  int v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_workQueue, a3);
    objc_storeStrong((id *)&v10->_controllerFactory, a4);
  }

  return v10;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t62 != -1) {
    dispatch_once(&logCategory__hmf_once_t62, &__block_literal_global_6744);
  }
  id v2 = (void *)logCategory__hmf_once_v63;
  return v2;
}

uint64_t __54__HMMTRSystemCommissionerControllerParams_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v63;
  logCategory__hmf_once_CFErrorRef v63 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end