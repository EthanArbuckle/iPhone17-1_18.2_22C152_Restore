@interface HMMTROperationalCertificateIssuer
+ (id)shortDescription;
- (BOOL)isEquivalentTo:(id)a3;
- (BOOL)shouldSkipAttestationCertificateValidation;
- (HMMTRAccessoryServerBrowser)browser;
- (HMMTROperationalCertificateIssuer)initWithQueue:(id)a3 rootCertificate:(id)a4 browser:(id)a5;
- (NSData)rootCertificate;
- (NSString)description;
- (NSString)shortDescription;
- (OS_dispatch_queue)queue;
- (void)issueOperationalCertificateForRequest:(id)a3 attestationInfo:(id)a4 controller:(id)a5 completion:(id)a6;
@end

@implementation HMMTROperationalCertificateIssuer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootCertificate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_browser);
}

- (NSData)rootCertificate
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (HMMTRAccessoryServerBrowser)browser
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browser);
  return (HMMTRAccessoryServerBrowser *)WeakRetained;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x270F30880](self, a2);
}

- (NSString)shortDescription
{
  v2 = objc_opt_class();
  return (NSString *)[v2 shortDescription];
}

- (void)issueOperationalCertificateForRequest:(id)a3 attestationInfo:(id)a4 controller:(id)a5 completion:(id)a6
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (void *)MEMORY[0x263F10CC0];
  v15 = [v10 csr];
  id v27 = 0;
  v16 = [v14 publicKeyFromCSR:v15 error:&v27];
  id v17 = v27;

  v18 = (void *)MEMORY[0x2533B64D0]();
  v19 = self;
  v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    v21 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v29 = v21;
    __int16 v30 = 2112;
    v31 = v16;
    _os_log_impl(&dword_252495000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Extracted Public Key from Operational Certificate %@", buf, 0x16u);
  }
  v22 = [(HMMTROperationalCertificateIssuer *)v19 browser];
  v23 = [(HMMTROperationalCertificateIssuer *)v19 rootCertificate];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __113__HMMTROperationalCertificateIssuer_issueOperationalCertificateForRequest_attestationInfo_controller_completion___block_invoke;
  v25[3] = &unk_265376398;
  v25[4] = v19;
  id v26 = v13;
  id v24 = v13;
  [v22 fetchCommissioningCertificatesForAccessoryWithOperationalPublicKey:v16 rootCertificate:v23 completionHandler:v25];
}

void __113__HMMTROperationalCertificateIssuer_issueOperationalCertificateForRequest_attestationInfo_controller_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)MEMORY[0x2533B64D0]();
  id v11 = *(id *)(a1 + 32);
  id v12 = HMFGetOSLogHandle();
  id v13 = v12;
  if (v7 && v8)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v14 = HMFGetLogIdentifier();
      int v25 = 138543874;
      id v26 = v14;
      __int16 v27 = 2112;
      id v28 = v7;
      __int16 v29 = 2112;
      id v30 = v8;
      _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_INFO, "%{public}@Successfully fetched Root %@ and Operational Certificate %@ for accessory getting paired", (uint8_t *)&v25, 0x20u);
    }
    v15 = (void *)MEMORY[0x2533B64D0]();
    id v16 = *(id *)(a1 + 32);
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = HMFGetLogIdentifier();
      int v25 = 138543362;
      id v26 = v18;
      _os_log_impl(&dword_252495000, v17, OS_LOG_TYPE_INFO, "%{public}@Root certificate:", (uint8_t *)&v25, 0xCu);
    }
    v19 = (void *)MEMORY[0x2533B64D0]([MEMORY[0x263F10CC0] printX509Certificate:v7]);
    id v20 = *(id *)(a1 + 32);
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = HMFGetLogIdentifier();
      int v25 = 138543362;
      id v26 = v22;
      _os_log_impl(&dword_252495000, v21, OS_LOG_TYPE_INFO, "%{public}@NOC for accessory:", (uint8_t *)&v25, 0xCu);
    }
    [MEMORY[0x263F10CC0] printX509Certificate:v8];
    v23 = (void *)[objc_alloc(MEMORY[0x263F10F08]) initWithOperationalCertificate:v8 intermediateCertificate:0 rootCertificate:v7 adminSubject:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v24 = HMFGetLogIdentifier();
      int v25 = 138543618;
      id v26 = v24;
      __int16 v27 = 2112;
      id v28 = v9;
      _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch Root / Operational Certificate for accessory getting paired with error %@", (uint8_t *)&v25, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (BOOL)shouldSkipAttestationCertificateValidation
{
  return 0;
}

- (BOOL)isEquivalentTo:(id)a3
{
  id v4 = a3;
  v5 = [(HMMTROperationalCertificateIssuer *)self rootCertificate];
  if (v5)
  {
  }
  else
  {
    v6 = [v4 rootCertificate];

    if (!v6) {
      goto LABEL_5;
    }
  }
  id v7 = (void *)MEMORY[0x263F10CC0];
  id v8 = [(HMMTROperationalCertificateIssuer *)self rootCertificate];
  id v9 = [v4 rootCertificate];
  LODWORD(v7) = [v7 isCertificate:v8 equalTo:v9];

  if (!v7)
  {
    BOOL v12 = 0;
    goto LABEL_7;
  }
LABEL_5:
  id v10 = [(HMMTROperationalCertificateIssuer *)self browser];
  id v11 = [v4 browser];
  BOOL v12 = v10 == v11;

LABEL_7:
  return v12;
}

- (HMMTROperationalCertificateIssuer)initWithQueue:(id)a3 rootCertificate:(id)a4 browser:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HMMTROperationalCertificateIssuer;
  id v10 = [(HMMTROperationalCertificateIssuer *)&v14 init];
  if (v10)
  {
    dispatch_queue_t v11 = dispatch_queue_create("HMMTROperationalCertificateIssuer", 0);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v10->_rootCertificate, a4);
    objc_storeWeak((id *)&v10->_browser, v9);
  }

  return v10;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end