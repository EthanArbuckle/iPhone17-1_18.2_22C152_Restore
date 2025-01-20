@interface HMMTRAttestationDataStore
+ (id)logCategory;
- (BOOL)sendMessageToAccessory:(id)a3 uarpMsg:(id)a4 error:(id *)a5;
- (HMMTRAttestationDataStore)initWithFileURL:(id)a3;
- (HMMTRAttestationDataStore)initWithFileURL:(id)a3 uarpController:(id)a4 fileManager:(id)a5;
- (HMMTRFileManager)fileManager;
- (NSArray)cdCertificates;
- (NSArray)paaCertificates;
- (NSURL)fileURL;
- (UARPController)uarpController;
- (id)convertPEMtoDERforCertificate:(id)a3;
- (id)staticAttestationData;
- (id)staticAttestationDataFileURL;
- (void)attestationCertificates:(id)a3 forSubjectKeyIdentifier:(id)a4;
- (void)fetchCloudAttestationData;
- (void)saveWithPaaCertificates:(id)a3 cdCertificates:(id)a4;
@end

@implementation HMMTRAttestationDataStore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_uarpController, 0);
}

- (NSURL)fileURL
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (HMMTRFileManager)fileManager
{
  return (HMMTRFileManager *)objc_getProperty(self, a2, 24, 1);
}

- (UARPController)uarpController
{
  return (UARPController *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)sendMessageToAccessory:(id)a3 uarpMsg:(id)a4 error:(id *)a5
{
  return 0;
}

- (void)attestationCertificates:(id)a3 forSubjectKeyIdentifier:(id)a4
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x2533B64D0]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  v11 = v10;
  if (v6)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v49 = v12;
      __int16 v50 = 2048;
      uint64_t v51 = [v6 count];
      _os_log_impl(&dword_252495000, v11, OS_LOG_TYPE_INFO, "%{public}@Received %tu PAA certificates from UARP controller", buf, 0x16u);
    }
    if ([v6 count])
    {
      id v28 = v7;
      id v35 = objc_alloc_init(MEMORY[0x263EFF980]);
      id v37 = objc_alloc_init(MEMORY[0x263EFF980]);
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v29 = v6;
      id obj = v6;
      uint64_t v31 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
      if (!v31) {
        goto LABEL_28;
      }
      uint64_t v30 = *(void *)v43;
      while (1)
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v43 != v30) {
            objc_enumerationMutation(obj);
          }
          uint64_t v34 = v13;
          uint64_t v36 = *(void *)(*((void *)&v42 + 1) + 8 * v13);
          v33 = [obj objectForKeyedSubscript:v28];
          v14 = [v33 componentsSeparatedByString:@","];
          long long v38 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          id v15 = v14;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v38 objects:v46 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v39;
            char v19 = 1;
            do
            {
              for (uint64_t i = 0; i != v17; ++i)
              {
                if (*(void *)v39 != v18) {
                  objc_enumerationMutation(v15);
                }
                v21 = [(HMMTRAttestationDataStore *)v9 convertPEMtoDERforCertificate:*(void *)(*((void *)&v38 + 1) + 8 * i)];
                if (v21)
                {
                  if (v19)
                  {
                    if ([v15 count] != 1) {
                      goto LABEL_24;
                    }
                    v22 = v35;
                  }
                  else
                  {
                    v22 = v37;
                  }
                  [v22 addObject:v21];
                }
                else
                {
                  v23 = (void *)MEMORY[0x2533B64D0]();
                  v24 = v9;
                  v25 = HMFGetOSLogHandle();
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                  {
                    v26 = HMFGetLogIdentifier();
                    *(_DWORD *)buf = 138543618;
                    v49 = v26;
                    __int16 v50 = 2112;
                    uint64_t v51 = v36;
                    _os_log_impl(&dword_252495000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to convert certificate from PEM to DER. Skipping certificate from subject key ID : %@", buf, 0x16u);
                  }
                }
LABEL_24:

                char v19 = 0;
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v38 objects:v46 count:16];
              char v19 = 0;
            }
            while (v17);
          }

          uint64_t v13 = v34 + 1;
        }
        while (v34 + 1 != v31);
        uint64_t v31 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
        if (!v31)
        {
LABEL_28:

          [(HMMTRAttestationDataStore *)v9 saveWithPaaCertificates:v35 cdCertificates:v37];
          id v7 = v28;
          id v6 = v29;
          break;
        }
      }
    }
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v49 = v27;
      _os_log_impl(&dword_252495000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch PAA certificates", buf, 0xCu);
    }
  }
}

- (NSArray)cdCertificates
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x2533B64D0](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    long long v43 = v6;
    _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_INFO, "%{public}@Loading locally stored attestation information", buf, 0xCu);
  }
  id v7 = [(HMMTRAttestationDataStore *)v4 fileManager];
  v8 = [(HMMTRAttestationDataStore *)v4 fileURL];
  id v41 = 0;
  v9 = [v7 dictionaryWithContentsOfURL:v8 error:&v41];
  id v10 = v41;

  if (!v9)
  {
    v11 = (void *)MEMORY[0x2533B64D0]();
    v12 = v4;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v43 = v14;
      _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_INFO, "%{public}@Locally stored attestation information not found. Loading static attestation information", buf, 0xCu);
    }
    v9 = [(HMMTRAttestationDataStore *)v12 staticAttestationData];
  }
  id v15 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v16 = v4;
  uint64_t v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    uint64_t v18 = HMFGetLogIdentifier();
    char v19 = [v9 objectForKeyedSubscript:@"Version"];
    *(_DWORD *)buf = 138543618;
    long long v43 = v18;
    __int16 v44 = 2112;
    uint64_t v45 = (uint64_t)v19;
    _os_log_impl(&dword_252495000, v17, OS_LOG_TYPE_INFO, "%{public}@Data version %@", buf, 0x16u);
  }
  v20 = (void *)MEMORY[0x2533B64D0]();
  v21 = v16;
  v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    v23 = HMFGetLogIdentifier();
    v24 = [v9 objectForKeyedSubscript:@"SchemaVersion"];
    *(_DWORD *)buf = 138543618;
    long long v43 = v23;
    __int16 v44 = 2112;
    uint64_t v45 = (uint64_t)v24;
    _os_log_impl(&dword_252495000, v22, OS_LOG_TYPE_INFO, "%{public}@Schema version %@", buf, 0x16u);
  }
  v25 = [v9 objectForKeyedSubscript:@"CDCertificates"];
  v26 = v25;
  if (!v25)
  {
    id v28 = (void *)MEMORY[0x2533B64D0]();
    id v29 = v21;
    uint64_t v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      id v35 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v43 = v35;
      __int16 v44 = 2112;
      uint64_t v45 = (uint64_t)v9;
      uint64_t v36 = "%{public}@Could not find Certificate Declarations(CDs) in attestation data dictionary: %@";
      id v37 = v30;
      os_log_type_t v38 = OS_LOG_TYPE_ERROR;
      uint32_t v39 = 22;
LABEL_20:
      _os_log_impl(&dword_252495000, v37, v38, v36, buf, v39);
    }
LABEL_21:

    id v34 = (id)MEMORY[0x263EFFA68];
    goto LABEL_22;
  }
  uint64_t v27 = [v25 count];
  id v28 = (void *)MEMORY[0x2533B64D0]();
  id v29 = v21;
  uint64_t v30 = HMFGetOSLogHandle();
  BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_INFO);
  if (!v27)
  {
    if (v31)
    {
      id v35 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v43 = v35;
      uint64_t v36 = "%{public}@No Certificate Declarations(CDs) found";
      id v37 = v30;
      os_log_type_t v38 = OS_LOG_TYPE_INFO;
      uint32_t v39 = 12;
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  if (v31)
  {
    v32 = HMFGetLogIdentifier();
    uint64_t v33 = [v26 count];
    *(_DWORD *)buf = 138543618;
    long long v43 = v32;
    __int16 v44 = 2048;
    uint64_t v45 = v33;
    _os_log_impl(&dword_252495000, v30, OS_LOG_TYPE_INFO, "%{public}@Number of Certificate Declarations(CDs) found: %tu", buf, 0x16u);
  }
  id v34 = v26;
LABEL_22:

  return (NSArray *)v34;
}

- (NSArray)paaCertificates
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x2533B64D0](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    long long v43 = v6;
    _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_INFO, "%{public}@Loading locally stored PAA information", buf, 0xCu);
  }
  id v7 = [(HMMTRAttestationDataStore *)v4 fileManager];
  v8 = [(HMMTRAttestationDataStore *)v4 fileURL];
  id v41 = 0;
  v9 = [v7 dictionaryWithContentsOfURL:v8 error:&v41];
  id v10 = v41;

  if (!v9)
  {
    v11 = (void *)MEMORY[0x2533B64D0]();
    v12 = v4;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v43 = v14;
      _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_INFO, "%{public}@Locally stored PAA information not found. Loading static PAA information", buf, 0xCu);
    }
    v9 = [(HMMTRAttestationDataStore *)v12 staticAttestationData];
  }
  id v15 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v16 = v4;
  uint64_t v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    uint64_t v18 = HMFGetLogIdentifier();
    char v19 = [v9 objectForKeyedSubscript:@"Version"];
    *(_DWORD *)buf = 138543618;
    long long v43 = v18;
    __int16 v44 = 2112;
    uint64_t v45 = (uint64_t)v19;
    _os_log_impl(&dword_252495000, v17, OS_LOG_TYPE_INFO, "%{public}@Data version %@", buf, 0x16u);
  }
  v20 = (void *)MEMORY[0x2533B64D0]();
  v21 = v16;
  v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    v23 = HMFGetLogIdentifier();
    v24 = [v9 objectForKeyedSubscript:@"SchemaVersion"];
    *(_DWORD *)buf = 138543618;
    long long v43 = v23;
    __int16 v44 = 2112;
    uint64_t v45 = (uint64_t)v24;
    _os_log_impl(&dword_252495000, v22, OS_LOG_TYPE_INFO, "%{public}@Schema version %@", buf, 0x16u);
  }
  v25 = [v9 objectForKeyedSubscript:@"PAACertificates"];
  v26 = v25;
  if (!v25)
  {
    id v28 = (void *)MEMORY[0x2533B64D0]();
    id v29 = v21;
    uint64_t v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      id v35 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v43 = v35;
      __int16 v44 = 2112;
      uint64_t v45 = (uint64_t)v9;
      uint64_t v36 = "%{public}@Could not find PAAs in attestation data dictionary: %@";
      id v37 = v30;
      os_log_type_t v38 = OS_LOG_TYPE_ERROR;
      uint32_t v39 = 22;
LABEL_20:
      _os_log_impl(&dword_252495000, v37, v38, v36, buf, v39);
    }
LABEL_21:

    id v34 = (id)MEMORY[0x263EFFA68];
    goto LABEL_22;
  }
  uint64_t v27 = [v25 count];
  id v28 = (void *)MEMORY[0x2533B64D0]();
  id v29 = v21;
  uint64_t v30 = HMFGetOSLogHandle();
  BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_INFO);
  if (!v27)
  {
    if (v31)
    {
      id v35 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v43 = v35;
      uint64_t v36 = "%{public}@No PAAs found";
      id v37 = v30;
      os_log_type_t v38 = OS_LOG_TYPE_INFO;
      uint32_t v39 = 12;
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  if (v31)
  {
    v32 = HMFGetLogIdentifier();
    uint64_t v33 = [v26 count];
    *(_DWORD *)buf = 138543618;
    long long v43 = v32;
    __int16 v44 = 2048;
    uint64_t v45 = v33;
    _os_log_impl(&dword_252495000, v30, OS_LOG_TYPE_INFO, "%{public}@Number of PAAs found: %tu", buf, 0x16u);
  }
  id v34 = v26;
LABEL_22:

  return (NSArray *)v34;
}

- (void)fetchCloudAttestationData
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x2533B64D0](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    int v13 = 138543362;
    v14 = v6;
    _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_INFO, "%{public}@Fetching cloud PAA data from UARP controller", (uint8_t *)&v13, 0xCu);
  }
  id v7 = [(HMMTRAttestationDataStore *)v4 uarpController];
  char v8 = [v7 getAttestationCertificates:0 assetLocationType:15];

  if ((v8 & 1) == 0)
  {
    v9 = (void *)MEMORY[0x2533B64D0]();
    id v10 = v4;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      int v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_252495000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to request PAA certificates from UARP controller", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (id)convertPEMtoDERforCertificate:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    v4 = [v3 stringByReplacingOccurrencesOfString:@"-----BEGIN CERTIFICATE-----" withString:&stru_2702A0B38];

    v5 = [v4 stringByReplacingOccurrencesOfString:@"-----END CERTIFICATE-----" withString:&stru_2702A0B38];

    id v6 = [v5 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_2702A0B38];

    id v7 = [v6 stringByReplacingOccurrencesOfString:@"\r" withString:&stru_2702A0B38];

    char v8 = [MEMORY[0x263F08708] newlineCharacterSet];
    id v3 = [v7 stringByTrimmingCharactersInSet:v8];

    v9 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v3 options:0];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)saveWithPaaCertificates:(id)a3 cdCertificates:(id)a4
{
  v35[4] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  char v8 = (void *)MEMORY[0x2533B64D0]();
  v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v29 = v11;
    _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_INFO, "%{public}@Saving certificates to file", buf, 0xCu);
  }
  v34[0] = @"Version";
  v34[1] = @"SchemaVersion";
  v35[0] = &unk_2702B5FB8;
  v35[1] = &unk_2702B5FB8;
  v34[2] = @"PAACertificates";
  v34[3] = @"CDCertificates";
  v35[2] = v6;
  v35[3] = v7;
  v12 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:4];
  int v13 = [(HMMTRAttestationDataStore *)v9 fileManager];
  v14 = [(HMMTRAttestationDataStore *)v9 fileURL];
  id v27 = 0;
  int v15 = [v13 writeDictionary:v12 toURL:v14 error:&v27];
  id v16 = v27;

  uint64_t v17 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v18 = v9;
  char v19 = HMFGetOSLogHandle();
  v20 = v19;
  if (v15)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v21 = HMFGetLogIdentifier();
      v22 = [(HMMTRAttestationDataStore *)v18 fileURL];
      *(_DWORD *)buf = 138543618;
      id v29 = v21;
      __int16 v30 = 2112;
      BOOL v31 = v22;
      v23 = "%{public}@Successfully saved attestation data to %@";
      v24 = v20;
      os_log_type_t v25 = OS_LOG_TYPE_INFO;
      uint32_t v26 = 22;
LABEL_8:
      _os_log_impl(&dword_252495000, v24, v25, v23, buf, v26);
    }
  }
  else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    v21 = HMFGetLogIdentifier();
    v22 = [(HMMTRAttestationDataStore *)v18 fileURL];
    *(_DWORD *)buf = 138543874;
    id v29 = v21;
    __int16 v30 = 2112;
    BOOL v31 = v22;
    __int16 v32 = 2112;
    id v33 = v16;
    v23 = "%{public}@Failed to write attestation data to %@: %@";
    v24 = v20;
    os_log_type_t v25 = OS_LOG_TYPE_ERROR;
    uint32_t v26 = 32;
    goto LABEL_8;
  }
}

- (id)staticAttestationData
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = [(HMMTRAttestationDataStore *)self fileManager];
  v4 = [(HMMTRAttestationDataStore *)self staticAttestationDataFileURL];
  id v14 = 0;
  v5 = [v3 dictionaryWithContentsOfURL:v4 error:&v14];
  id v6 = v14;

  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    char v8 = (void *)MEMORY[0x2533B64D0]();
    v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      v12 = [(HMMTRAttestationDataStore *)v9 staticAttestationDataFileURL];
      *(_DWORD *)buf = 138543874;
      id v16 = v11;
      __int16 v17 = 2112;
      uint64_t v18 = v12;
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to load local attestation data at file URL %@: %@", buf, 0x20u);
    }
    id v7 = (id)MEMORY[0x263EFFA78];
  }

  return v7;
}

- (id)staticAttestationDataFileURL
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 URLForResource:@"attestation-data-store" withExtension:@"plist"];

  if (v3)
  {
    return v3;
  }
  else
  {
    v5 = (HMMTRAttestationDataStore *)_HMFPreconditionFailure();
    return [(HMMTRAttestationDataStore *)v5 initWithFileURL:v7 uarpController:v8 fileManager:v9];
  }
}

- (HMMTRAttestationDataStore)initWithFileURL:(id)a3 uarpController:(id)a4 fileManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v10)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  v12 = v11;
  if (!v11)
  {
LABEL_9:
    id v16 = (HMMTRAttestationDataStore *)_HMFPreconditionFailure();
    return [(HMMTRAttestationDataStore *)v16 initWithFileURL:v18];
  }
  v19.receiver = self;
  v19.super_class = (Class)HMMTRAttestationDataStore;
  int v13 = [(HMMTRAttestationDataStore *)&v19 init];
  id v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_fileURL, a3);
    objc_storeStrong((id *)&v14->_uarpController, a4);
    [(UARPController *)v14->_uarpController setDelegate:v14];
    objc_storeStrong((id *)&v14->_fileManager, a5);
  }

  return v14;
}

- (HMMTRAttestationDataStore)initWithFileURL:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F38328];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = objc_alloc_init(HMMTRFileManager);
  id v8 = [(HMMTRAttestationDataStore *)self initWithFileURL:v5 uarpController:v6 fileManager:v7];

  return v8;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t20 != -1) {
    dispatch_once(&logCategory__hmf_once_t20, &__block_literal_global_10026);
  }
  v2 = (void *)logCategory__hmf_once_v21;
  return v2;
}

uint64_t __40__HMMTRAttestationDataStore_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v21;
  logCategory__hmf_once_uint64_t v21 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end