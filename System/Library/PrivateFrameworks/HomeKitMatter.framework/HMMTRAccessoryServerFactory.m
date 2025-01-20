@interface HMMTRAccessoryServerFactory
+ (id)createHMMTRHAPServiceCommon:(id)a3 characteristics:(id)a4 serviceLabelIndex:(id)a5 serviceInstanceID:(id)a6 endpointID:(id)a7 nodeID:(id)a8 topology:(id)a9 clusterIDCharacteristicMap:(id)a10 linkedServices:(id)a11;
+ (id)createHMMTRHAPServiceLabelServiceWithEndpointID:(id)a3 nodeID:(id)a4;
+ (id)createInfoService:(id)a3 model:(id)a4 manufacturer:(id)a5 serialNumber:(id)a6 instanceID:(int64_t)a7 endpointID:(id)a8;
+ (id)createInfoService:(id)a3 model:(id)a4 manufacturer:(id)a5 serialNumber:(id)a6 instanceID:(unint64_t)a7 endpointID:(id)a8 nodeID:(id)a9 legacyInstanceIDAssignment:(BOOL)a10;
+ (id)instanceIDForCharacteristicType:(id)a3 serviceType:(id)a4 endpointID:(id)a5 nodeID:(id)a6;
+ (id)logCategory;
- (HAPKeyStore)keystore;
- (HMMTRAccessoryServerBrowser)browser;
- (HMMTRAccessoryServerFactory)initWithKeystore:(id)a3 browser:(id)a4;
- (id)logIdentifier;
- (id)vendAccessoryServerWithNodeID:(id)a3 setupCode:(id)a4 discriminator:(id)a5 category:(id)a6 vendorID:(id)a7 productID:(id)a8 serialNumber:(id)a9 firmwareRevision:(id)a10;
- (void)setBrowser:(id)a3;
- (void)setKeystore:(id)a3;
@end

@implementation HMMTRAccessoryServerFactory

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_keystore);
  objc_destroyWeak((id *)&self->_browser);
}

- (void)setKeystore:(id)a3
{
}

- (HAPKeyStore)keystore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_keystore);
  return (HAPKeyStore *)WeakRetained;
}

- (void)setBrowser:(id)a3
{
}

- (HMMTRAccessoryServerBrowser)browser
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browser);
  return (HMMTRAccessoryServerBrowser *)WeakRetained;
}

- (id)logIdentifier
{
  return @"HMMTRAccessoryServerFactory";
}

- (id)vendAccessoryServerWithNodeID:(id)a3 setupCode:(id)a4 discriminator:(id)a5 category:(id)a6 vendorID:(id)a7 productID:(id)a8 serialNumber:(id)a9 firmwareRevision:(id)a10
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  v76 = (__CFString *)a3;
  id v74 = a4;
  id v75 = a5;
  id v78 = a6;
  id v16 = a7;
  id v17 = a8;
  id v77 = a9;
  id v18 = v16;
  id v71 = a10;
  v19 = (void *)MEMORY[0x2533B64D0]();
  v20 = self;
  v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v23 = id v22 = v17;
    *(_DWORD *)buf = 138544642;
    v80 = v23;
    __int16 v81 = 2112;
    v82 = v76;
    __int16 v83 = 2112;
    id v84 = v78;
    __int16 v85 = 2112;
    id v86 = v18;
    __int16 v87 = 2112;
    id v88 = v22;
    __int16 v89 = 2112;
    id v90 = v77;
    _os_log_impl(&dword_252495000, v21, OS_LOG_TYPE_DEBUG, "%{public}@vendAccessoryServerWithNodeID - nodeID: %@, category: %@, vid: %@, pid %@, serial %@", buf, 0x3Eu);

    id v17 = v22;
  }

  if (!v18)
  {
    v26 = 0;
    goto LABEL_13;
  }
  v24 = [(HMMTRAccessoryServerFactory *)v20 browser];
  v25 = [v24 vendorMetadataStore];
  v26 = [v25 retrieveVendorMetadataForVendorID:v18 productID:v17];

  objc_storeStrong(&vendorId, a7);
  if (!v17)
  {
LABEL_13:
    v27 = 0;
LABEL_14:
    v38 = (void *)MEMORY[0x2533B64D0]();
    v39 = v20;
    v40 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      v41 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v80 = v41;
      __int16 v81 = 2112;
      v82 = @"Matter Accessory";
      _os_log_impl(&dword_252495000, v40, OS_LOG_TYPE_INFO, "%{public}@No product name information available so using default name: %@", buf, 0x16u);
    }
    v31 = @"Matter Accessory";
    goto LABEL_17;
  }
  objc_storeStrong(&productId, a8);
  v27 = [v26 productWithID:v17];
  v28 = [v27 categoryNumber];

  if (v28)
  {
    uint64_t v29 = [v27 categoryNumber];

    id v78 = (id)v29;
  }
  v30 = [v27 name];

  if (!v30) {
    goto LABEL_14;
  }
  v31 = [v27 name];
  v32 = (void *)MEMORY[0x2533B64D0]();
  v33 = v20;
  v34 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    v35 = HMFGetLogIdentifier();
    [v26 name];
    v72 = v26;
    v37 = id v36 = v17;
    *(_DWORD *)buf = 138543874;
    v80 = v35;
    __int16 v81 = 2112;
    v82 = v31;
    __int16 v83 = 2112;
    id v84 = v37;
    _os_log_impl(&dword_252495000, v34, OS_LOG_TYPE_INFO, "%{public}@Using metadata product name: %@ and vendor name: %@", buf, 0x20u);

    id v17 = v36;
    v26 = v72;
  }
  if (!v31) {
    goto LABEL_14;
  }
LABEL_17:
  v63 = v27;
  v73 = v26;
  v68 = v17;
  v67 = +[HMMTRUtilities identifierStringWithCHIPNodeID:](HMMTRUtilities, "identifierStringWithCHIPNodeID:", v76, v31);
  v42 = [HMMTRAccessoryServerBuilder alloc];
  v69 = [(HMMTRAccessoryServerFactory *)v20 keystore];
  v66 = [(HMMTRAccessoryServerFactory *)v20 browser];
  v65 = [(HMMTRAccessoryServerBuilder *)v42 initWithKeystore:v69 browser:v66];
  v64 = [(HMMTRAccessoryServerBuilder *)v65 name:v31];
  v62 = [v64 nodeID:v76];
  v61 = [v62 vendorID:v18];
  v60 = [v26 name];
  v59 = [v61 vendorName:v60];
  v43 = [v59 productID:v17];
  [v27 name];
  v44 = v70 = v18;
  v45 = [v43 productName:v44];
  v46 = [v45 identifier:v67];
  v47 = [v46 manufacturer:0];
  v48 = [v47 model:0];
  v49 = [v48 serialNumber:v77];
  v50 = [v49 category:v78];
  v51 = [v50 setUpPinCode:v74];
  v52 = [v51 discriminator:v75];

  v53 = +[HMMTRUtilities sanitizeHAPName:v58];

  v54 = +[HMMTRAccessoryServerFactory createInfoService:v53 model:0 manufacturer:0 serialNumber:0 instanceID:1 endpointID:&unk_2702B5670];
  id v55 = (id)[v52 addService:v54];

  v56 = [v52 build];

  return v56;
}

- (HMMTRAccessoryServerFactory)initWithKeystore:(id)a3 browser:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMMTRAccessoryServerFactory;
  v8 = [(HMMTRAccessoryServerFactory *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_keystore, v6);
    objc_storeWeak((id *)&v9->_browser, v7);
  }

  return v9;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_6128 != -1) {
    dispatch_once(&logCategory__hmf_once_t4_6128, &__block_literal_global_6129);
  }
  v2 = (void *)logCategory__hmf_once_v5_6130;
  return v2;
}

uint64_t __42__HMMTRAccessoryServerFactory_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v5_6130;
  logCategory__hmf_once_v5_6130 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)instanceIDForCharacteristicType:(id)a3 serviceType:(id)a4 endpointID:(id)a5 nodeID:(id)a6
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  memset(&c, 0, sizeof(c));
  CC_SHA256_Init(&c);
  memset(data, 0, sizeof(data));
  if (v9)
  {
    v13 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v9];
    if (!v13) {
      goto LABEL_12;
    }
    v14 = v13;
    [v13 getUUIDBytes:data];
  }
  else
  {
    *(void *)&data[0] = 0xFEFEFEFEFEFEFEFELL;
    *((void *)&data[0] + 1) = 0xFEFEFEFEFEFEFEFELL;
  }
  CC_SHA256_Update(&c, data, 0x10u);
  if (v10)
  {
    v15 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v10];
    if (v15)
    {
      id v16 = v15;
      [v15 getUUIDBytes:data];

      goto LABEL_9;
    }
LABEL_12:
    _HMFPreconditionFailure();
  }
  *(void *)&data[0] = 0xEFEFEFEFEFEFEFEFLL;
  *((void *)&data[0] + 1) = 0xEFEFEFEFEFEFEFEFLL;
LABEL_9:
  CC_SHA256_Update(&c, data, 0x10u);
  uint64_t v19 = [v11 unsignedLongLongValue];
  CC_SHA256_Update(&c, &v19, 8u);
  uint64_t v19 = [v12 unsignedLongLongValue];
  CC_SHA256_Update(&c, &v19, 8u);
  CC_SHA256_Final((unsigned __int8 *)data, &c);
  uint64_t v19 = *(void *)&data[0] & 0x7FFFFFFFFFFFFFFFLL;
  id v17 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");

  return v17;
}

+ (id)createHMMTRHAPServiceLabelServiceWithEndpointID:(id)a3 nodeID:(id)a4
{
  v23[1] = *MEMORY[0x263EF8340];
  id v6 = (void *)MEMORY[0x263F359E8];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 getSharedInstance];
  id v10 = [v9 getDefaultCharacteristicProperties:@"000000CD-0000-1000-8000-0026BB765291"];
  unint64_t v11 = [v10 integerValue] & 0xFFFFFFFFFFFFFFEFLL;

  id v12 = [v9 getDefaultCharacteristicMetadata:@"000000CD-0000-1000-8000-0026BB765291"];
  v13 = objc_msgSend(@"000000CC-0000-1000-8000-0026BB765291", "hap_validatedAndNormalizedUUIDString");
  v14 = [a1 instanceIDForCharacteristicType:@"000000CD-0000-1000-8000-0026BB765291" serviceType:v13 endpointID:v8 nodeID:v7];
  v15 = (void *)[objc_alloc(MEMORY[0x263F358C8]) initWithType:@"000000CD-0000-1000-8000-0026BB765291" instanceID:v14 value:&unk_2702B5658 stateNumber:0 properties:v11 eventNotificationsEnabled:0 metadata:v12];
  id v16 = [v9 getDefaultServiceProperties:@"000000CC-0000-1000-8000-0026BB765291"];
  uint64_t v17 = [v16 integerValue];

  id v18 = [a1 instanceIDForCharacteristicType:0 serviceType:v13 endpointID:v8 nodeID:v7];

  uint64_t v19 = [HMMTRHAPService alloc];
  v23[0] = v15;
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
  v21 = [(HMMTRHAPService *)v19 initWithType:@"000000CC-0000-1000-8000-0026BB765291" instanceID:v18 parsedCharacteristics:v20 serviceProperties:v17 linkedServices:MEMORY[0x263EFFA68] endpoint:v8];

  return v21;
}

+ (id)createHMMTRHAPServiceCommon:(id)a3 characteristics:(id)a4 serviceLabelIndex:(id)a5 serviceInstanceID:(id)a6 endpointID:(id)a7 nodeID:(id)a8 topology:(id)a9 clusterIDCharacteristicMap:(id)a10 linkedServices:(id)a11
{
  id v51 = a3;
  id v16 = a4;
  id v48 = a5;
  id v17 = a6;
  id v56 = a7;
  id v50 = a8;
  id v54 = a9;
  id v53 = a10;
  id v47 = a11;
  id v18 = [MEMORY[0x263F359E8] getSharedInstance];
  id v55 = [MEMORY[0x263EFF980] array];
  id v52 = v17;
  if ([v16 count])
  {
    unint64_t v19 = 0;
    do
    {
      v20 = [v16 objectAtIndexedSubscript:v19];
      v21 = [v18 getDefaultCharacteristicMetadata:v20];
      uint64_t v22 = +[HMMTRProtocolMap protocolMap];
      [v22 updateMetadataForCharacteristic:v20 metadata:v21 endpointID:v56 topology:v54 clusterIDCharacteristicMap:v53];

      v23 = [v18 getDefaultCharacteristicProperties:v20];
      uint64_t v24 = [v23 integerValue];

      if (v17)
      {
        v25 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", ++v19 + objc_msgSend(v17, "unsignedLongLongValue"));
      }
      else
      {
        v26 = objc_msgSend(v51, "hap_validatedAndNormalizedUUIDString");
        v25 = [a1 instanceIDForCharacteristicType:v20 serviceType:v26 endpointID:v56 nodeID:v50];

        ++v19;
      }
      unint64_t v27 = v24 & 0xFFFFFFFFFFFFFFEFLL;
      id v28 = objc_alloc(MEMORY[0x263F358C8]);
      uint64_t v29 = [v21 constraints];
      v30 = [v29 minimumValue];
      v31 = (void *)[v28 initWithType:v20 instanceID:v25 value:v30 stateNumber:0 properties:v27 eventNotificationsEnabled:1 metadata:v21];

      [v55 addObject:v31];
      id v17 = v52;
    }
    while (v19 < [v16 count]);
  }
  if (v48)
  {
    v32 = [v18 getDefaultCharacteristicProperties:@"000000CB-0000-1000-8000-0026BB765291"];
    unint64_t v33 = [v32 integerValue] & 0xFFFFFFFFFFFFFFEFLL;

    v34 = [v18 getDefaultCharacteristicMetadata:@"000000CB-0000-1000-8000-0026BB765291"];
    v35 = objc_msgSend(v51, "hap_validatedAndNormalizedUUIDString");
    id v36 = [a1 instanceIDForCharacteristicType:@"000000CB-0000-1000-8000-0026BB765291" serviceType:v35 endpointID:v56 nodeID:v50];
    id v37 = objc_alloc(MEMORY[0x263F358C8]);
    unint64_t v38 = v33;
    id v17 = v52;
    v39 = (void *)[v37 initWithType:@"000000CB-0000-1000-8000-0026BB765291" instanceID:v36 value:v48 stateNumber:0 properties:v38 eventNotificationsEnabled:0 metadata:v34];
    [v55 addObject:v39];
  }
  v40 = [v18 getDefaultServiceProperties:v51];
  uint64_t v41 = [v40 integerValue];

  if (v17)
  {
    id v42 = v17;
    v43 = v56;
  }
  else
  {
    v44 = objc_msgSend(v51, "hap_validatedAndNormalizedUUIDString");
    v43 = v56;
    id v42 = [a1 instanceIDForCharacteristicType:0 serviceType:v44 endpointID:v56 nodeID:v50];
  }
  v45 = [[HMMTRHAPService alloc] initWithType:v51 instanceID:v42 parsedCharacteristics:v55 serviceProperties:v41 linkedServices:v47 endpoint:v43];

  return v45;
}

+ (id)createInfoService:(id)a3 model:(id)a4 manufacturer:(id)a5 serialNumber:(id)a6 instanceID:(unint64_t)a7 endpointID:(id)a8 nodeID:(id)a9 legacyInstanceIDAssignment:(BOOL)a10
{
  uint64_t v103 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v95 = a4;
  id v94 = a5;
  id v93 = a6;
  id v17 = a8;
  id v18 = a9;
  unint64_t v19 = [MEMORY[0x263F359E8] getSharedInstance];
  v20 = [v19 getDefaultCharacteristicMetadata:@"00000023-0000-1000-8000-0026BB765291"];
  v21 = [v19 getDefaultCharacteristicProperties:@"00000023-0000-1000-8000-0026BB765291"];
  uint64_t v22 = [v21 integerValue];

  id v96 = a1;
  v97 = v17;
  v98 = v18;
  unint64_t v85 = a7;
  if (a10)
  {
    unint64_t v23 = a7 + 1;
  }
  else
  {
    uint64_t v24 = [a1 instanceIDForCharacteristicType:@"00000023-0000-1000-8000-0026BB765291" serviceType:@"0000003E-0000-1000-8000-0026BB765291" endpointID:v17 nodeID:v18];
    unint64_t v23 = [v24 unsignedLongLongValue];
  }
  id v25 = objc_alloc(MEMORY[0x263F358C8]);
  v26 = [NSNumber numberWithUnsignedLongLong:v23];
  unint64_t v27 = (void *)[v25 initWithType:@"00000023-0000-1000-8000-0026BB765291" instanceID:v26 value:v16 stateNumber:0 properties:v22 eventNotificationsEnabled:1 metadata:v20];

  id v28 = [v19 getDefaultCharacteristicMetadata:@"00000021-0000-1000-8000-0026BB765291"];

  uint64_t v29 = [v19 getDefaultCharacteristicProperties:@"00000021-0000-1000-8000-0026BB765291"];
  uint64_t v30 = [v29 integerValue];

  if (a10)
  {
    uint64_t v31 = v23 + 1;
  }
  else
  {
    v32 = [v96 instanceIDForCharacteristicType:@"00000021-0000-1000-8000-0026BB765291" serviceType:@"0000003E-0000-1000-8000-0026BB765291" endpointID:v97 nodeID:v98];
    uint64_t v31 = [v32 unsignedLongLongValue];
  }
  id v33 = objc_alloc(MEMORY[0x263F358C8]);
  v34 = [NSNumber numberWithUnsignedLongLong:v31];
  uint64_t v87 = [v33 initWithType:@"00000021-0000-1000-8000-0026BB765291" instanceID:v34 value:v95 stateNumber:0 properties:v30 eventNotificationsEnabled:1 metadata:v28];

  v35 = [v19 getDefaultCharacteristicMetadata:@"00000020-0000-1000-8000-0026BB765291"];

  id v36 = [v19 getDefaultCharacteristicProperties:@"00000020-0000-1000-8000-0026BB765291"];
  uint64_t v37 = [v36 integerValue];

  if (a10)
  {
    uint64_t v38 = v31 + 1;
  }
  else
  {
    v39 = [v96 instanceIDForCharacteristicType:@"00000020-0000-1000-8000-0026BB765291" serviceType:@"0000003E-0000-1000-8000-0026BB765291" endpointID:v97 nodeID:v98];
    uint64_t v38 = [v39 unsignedLongLongValue];
  }
  id v40 = objc_alloc(MEMORY[0x263F358C8]);
  uint64_t v41 = [NSNumber numberWithUnsignedLongLong:v38];
  v92 = (void *)[v40 initWithType:@"00000020-0000-1000-8000-0026BB765291" instanceID:v41 value:v94 stateNumber:0 properties:v37 eventNotificationsEnabled:1 metadata:v35];

  id v42 = [v19 getDefaultCharacteristicMetadata:@"00000014-0000-1000-8000-0026BB765291"];

  v43 = [v19 getDefaultCharacteristicProperties:@"00000014-0000-1000-8000-0026BB765291"];
  uint64_t v44 = [v43 integerValue];

  if (a10)
  {
    uint64_t v45 = v38 + 1;
  }
  else
  {
    v46 = [v96 instanceIDForCharacteristicType:@"00000014-0000-1000-8000-0026BB765291" serviceType:@"0000003E-0000-1000-8000-0026BB765291" endpointID:v97 nodeID:v98];
    uint64_t v45 = [v46 unsignedLongLongValue];
  }
  id v47 = objc_alloc(MEMORY[0x263F358C8]);
  id v48 = [NSNumber numberWithUnsignedLongLong:v45];
  uint64_t v91 = (void *)[v47 initWithType:@"00000014-0000-1000-8000-0026BB765291" instanceID:v48 value:@"false" stateNumber:0 properties:v44 eventNotificationsEnabled:1 metadata:v42];

  v49 = [v19 getDefaultCharacteristicMetadata:@"00000030-0000-1000-8000-0026BB765291"];

  id v50 = [v19 getDefaultCharacteristicProperties:@"00000030-0000-1000-8000-0026BB765291"];
  uint64_t v51 = [v50 integerValue];

  id v86 = v16;
  if (a10)
  {
    uint64_t v52 = v45 + 1;
  }
  else
  {
    id v53 = [v96 instanceIDForCharacteristicType:@"00000030-0000-1000-8000-0026BB765291" serviceType:@"0000003E-0000-1000-8000-0026BB765291" endpointID:v97 nodeID:v98];
    uint64_t v52 = [v53 unsignedLongLongValue];
  }
  id v54 = objc_alloc(MEMORY[0x263F358C8]);
  id v55 = [NSNumber numberWithUnsignedLongLong:v52];
  id v90 = (void *)[v54 initWithType:@"00000030-0000-1000-8000-0026BB765291" instanceID:v55 value:v93 stateNumber:0 properties:v51 eventNotificationsEnabled:1 metadata:v49];

  id v56 = [v19 getDefaultCharacteristicMetadata:@"00000052-0000-1000-8000-0026BB765291"];

  v57 = [v19 getDefaultCharacteristicProperties:@"00000052-0000-1000-8000-0026BB765291"];
  uint64_t v58 = [v57 integerValue];

  if (a10)
  {
    uint64_t v59 = v52 + 1;
    v60 = v96;
  }
  else
  {
    v60 = v96;
    v61 = [v96 instanceIDForCharacteristicType:@"00000052-0000-1000-8000-0026BB765291" serviceType:@"0000003E-0000-1000-8000-0026BB765291" endpointID:v97 nodeID:v98];
    uint64_t v59 = [v61 unsignedLongLongValue];
  }
  id v62 = objc_alloc(MEMORY[0x263F358C8]);
  v63 = [NSNumber numberWithUnsignedLongLong:v59];
  id v88 = (void *)[v62 initWithType:@"00000052-0000-1000-8000-0026BB765291" instanceID:v63 value:0 stateNumber:0 properties:v58 eventNotificationsEnabled:1 metadata:v56];

  __int16 v89 = [v19 getDefaultCharacteristicMetadata:@"0000026D-0000-1000-8000-0026BB765291"];

  v64 = [v19 getDefaultCharacteristicProperties:@"0000026D-0000-1000-8000-0026BB765291"];
  uint64_t v65 = [v64 integerValue];

  if (a10)
  {
    unint64_t v66 = v59 + 1;
  }
  else
  {
    v67 = [v60 instanceIDForCharacteristicType:@"0000026D-0000-1000-8000-0026BB765291" serviceType:@"0000003E-0000-1000-8000-0026BB765291" endpointID:v97 nodeID:v98];
    unint64_t v66 = [v67 unsignedLongLongValue];
  }
  v68 = (void *)v87;
  id v69 = objc_alloc(MEMORY[0x263F358C8]);
  v70 = [NSNumber numberWithUnsignedLongLong:v66];
  id v71 = (void *)[v69 initWithType:@"0000026D-0000-1000-8000-0026BB765291" instanceID:v70 value:&unk_2702B5670 stateNumber:0 properties:v65 eventNotificationsEnabled:1 metadata:v89];

  unint64_t v72 = a7;
  if (a10 && v66 >= a7 + 9)
  {
    v73 = (void *)MEMORY[0x2533B64D0]();
    id v74 = v60;
    id v75 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
    {
      v76 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v100 = v76;
      __int16 v101 = 2048;
      unint64_t v102 = v66;
      _os_log_impl(&dword_252495000, v75, OS_LOG_TYPE_ERROR, "%{public}@Instance ID overflowed into next range: %lu", buf, 0x16u);
    }
    unint64_t v72 = v85;
    v68 = (void *)v87;
  }
  id v77 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v27, v68, v92, v91, v90, v88, v71, 0);
  id v78 = [v19 getDefaultServiceProperties:@"0000003E-0000-1000-8000-0026BB765291"];
  uint64_t v79 = [v78 integerValue];

  if (!a10)
  {
    v80 = [v96 instanceIDForCharacteristicType:0 serviceType:@"0000003E-0000-1000-8000-0026BB765291" endpointID:v97 nodeID:v98];
    unint64_t v72 = [v80 unsignedLongLongValue];
  }
  __int16 v81 = [HMMTRHAPService alloc];
  v82 = [NSNumber numberWithUnsignedLongLong:v72];
  __int16 v83 = [(HMMTRHAPService *)v81 initWithType:@"0000003E-0000-1000-8000-0026BB765291" instanceID:v82 parsedCharacteristics:v77 serviceProperties:v79 linkedServices:MEMORY[0x263EFFA68] endpoint:v97];

  return v83;
}

+ (id)createInfoService:(id)a3 model:(id)a4 manufacturer:(id)a5 serialNumber:(id)a6 instanceID:(int64_t)a7 endpointID:(id)a8
{
  LOBYTE(v9) = 1;
  return (id)[a1 createInfoService:a3 model:a4 manufacturer:a5 serialNumber:a6 instanceID:a7 endpointID:a8 nodeID:&unk_2702B5670 legacyInstanceIDAssignment:v9];
}

@end