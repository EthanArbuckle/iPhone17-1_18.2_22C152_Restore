@interface HMDRemoteMessageSerialization
+ (id)dictionaryForMessage:(id)a3 error:(id *)a4;
+ (id)dictionaryForMessage:(id)a3 isHH2Payload:(BOOL)a4 error:(id *)a5;
+ (id)remoteMessageWithDictionary:(id)a3 error:(id *)a4;
+ (id)remoteMessageWithDictionary:(id)a3 isHH2Payload:(BOOL)a4 error:(id *)a5;
@end

@implementation HMDRemoteMessageSerialization

+ (id)dictionaryForMessage:(id)a3 isHH2Payload:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (v8)
  {
    v9 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:3];
    v10 = [v8 name];
    [v9 setObject:v10 forKeyedSubscript:@"kIDSMessageNameKey"];

    v11 = [v8 identifier];
    v12 = [v11 UUIDString];
    self;
    if (v6) {
      v13 = @"id";
    }
    else {
      v13 = @"kIDSMessageIdentifierKey";
    }
    [v9 setObject:v12 forKeyedSubscript:v13];

    v14 = [v8 destination];
    v15 = [v14 target];
    v16 = [v15 UUIDString];
    [v9 setObject:v16 forKeyedSubscript:@"kIDSMessageTargetKey"];

    v17 = [v8 messagePayload];

    if (v17)
    {
      v18 = (void *)MEMORY[0x263F08AC0];
      v19 = [v8 messagePayload];
      LOBYTE(v18) = [v18 propertyList:v19 isValidForFormat:200];

      if ((v18 & 1) == 0)
      {
        uint64_t v44 = MEMORY[0x230FBD990]();
        v45 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          v46 = HMFGetLogIdentifier();
          v47 = [v8 messagePayload];
          int v55 = 138543618;
          v56 = v46;
          __int16 v57 = 2112;
          v58 = v47;
          _os_log_impl(&dword_22F52A000, v45, OS_LOG_TYPE_ERROR, "%{public}@Invalid message payload: %@", (uint8_t *)&v55, 0x16u);
        }
        v48 = (void *)v44;
        goto LABEL_36;
      }
      v20 = [v8 messagePayload];
      [v9 setObject:v20 forKeyedSubscript:@"kIDSMessagePayloadKey"];
    }
    v21 = [v8 headers];
    uint64_t v22 = [v21 count];

    if (!v22)
    {
LABEL_11:
      v26 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "qualityOfService"));
      [v9 setObject:v26 forKeyedSubscript:@"kRemoteMessageQoSKey"];

      id v27 = v8;
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (isKindOfClass) {
        v29 = v27;
      }
      else {
        v29 = 0;
      }
      id v30 = v29;

      if (isKindOfClass)
      {
        v31 = [v27 transactionIdentifier];

        if (v31)
        {
          v32 = [v27 transactionIdentifier];
          v33 = [v32 UUIDString];
          [v9 setObject:v33 forKeyedSubscript:@"kIDSMessageRequestTransactionIDKey"];
        }
        unint64_t v34 = [v27 type];
        if (v34 <= 2) {
          [v9 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*off_264A2EBB8[v34]];
        }
        if ([v27 isSecure])
        {
          v35 = +[HMDHomeKitVersion currentVersion];
          v36 = [v35 versionString];
          [v9 setObject:v36 forKeyedSubscript:@"dv"];
        }
        uint64_t v37 = [v27 remoteResponseRestriction];
        if (v37 != -1)
        {
          uint64_t v38 = v37;
          if (![v27 type])
          {
            v39 = [NSNumber numberWithUnsignedInteger:v38];
            [v9 setObject:v39 forKeyedSubscript:@"kRemoteMessageResponseRestrictionKey"];
          }
        }
      }
      id v40 = v9;

      goto LABEL_39;
    }
    v23 = (void *)MEMORY[0x263F08AC0];
    v24 = [v8 headers];
    LOBYTE(v23) = [v23 propertyList:v24 isValidForFormat:200];

    if (v23)
    {
      v25 = [v8 headers];
      [v9 setObject:v25 forKeyedSubscript:@"kRemoteMessageHeadersKey"];

      goto LABEL_11;
    }
    uint64_t v49 = MEMORY[0x230FBD990]();
    id v50 = a1;
    v51 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      v52 = HMFGetLogIdentifier();
      v53 = [v8 headers];
      int v55 = 138543618;
      v56 = v52;
      __int16 v57 = 2112;
      v58 = v53;
      _os_log_impl(&dword_22F52A000, v51, OS_LOG_TYPE_ERROR, "%{public}@Invalid message headers: %@", (uint8_t *)&v55, 0x16u);
    }
    v48 = (void *)v49;
LABEL_36:
    if (a5)
    {
      [MEMORY[0x263F087E8] hmErrorWithCode:22];
      id v40 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v40 = 0;
    }
LABEL_39:

    goto LABEL_40;
  }
  v41 = (void *)MEMORY[0x230FBD990]();
  v42 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
  {
    v43 = HMFGetLogIdentifier();
    int v55 = 138543362;
    v56 = v43;
    _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_ERROR, "%{public}@Message parameter is required", (uint8_t *)&v55, 0xCu);
  }
  if (a5)
  {
    [MEMORY[0x263F087E8] hmErrorWithCode:20];
    id v40 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v40 = 0;
  }
LABEL_40:

  return v40;
}

+ (id)dictionaryForMessage:(id)a3 error:(id *)a4
{
  return (id)[a1 dictionaryForMessage:a3 isHH2Payload:0 error:a4];
}

+ (id)remoteMessageWithDictionary:(id)a3 isHH2Payload:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = objc_msgSend(v7, "hmf_stringForKey:", @"kIDSMessageNameKey");
  if (!v8)
  {
    v13 = [MEMORY[0x263F087E8] hmErrorWithCode:3 description:@"Invalid parameter" reason:@"The message name is missing" suggestion:0];
    v14 = 0;
    goto LABEL_53;
  }
  self;
  if (v6) {
    v9 = @"id";
  }
  else {
    v9 = @"kIDSMessageIdentifierKey";
  }
  v10 = objc_msgSend(v7, "hmf_UUIDForKey:", v9);
  if (v10)
  {
    v63 = objc_msgSend(v7, "hmf_UUIDForKey:", @"kIDSMessageTargetKey");
    v62 = objc_msgSend(v7, "hmf_dictionaryForKey:", @"kIDSMessagePayloadKey");
    if (objc_msgSend(v7, "hmf_BOOLForKey:", @"kIDSMessageRequiresResponseKey"))
    {
      uint64_t v11 = objc_msgSend(v7, "hmf_UUIDForKey:", @"kIDSMessageRequestTransactionIDKey");
      if (v11)
      {
        v12 = (void *)v11;
        uint64_t v60 = 0;
        goto LABEL_17;
      }
      uint64_t v22 = (void *)MEMORY[0x263F087E8];
      v23 = @"The transaction identifier is required for requests";
LABEL_50:
      v13 = [v22 hmErrorWithCode:3 description:@"Invalid parameter" reason:v23 suggestion:0];
      v14 = 0;
LABEL_51:

      goto LABEL_52;
    }
    if (objc_msgSend(v7, "hmf_BOOLForKey:", @"kIDSMessageIsResponseToRequest"))
    {
      uint64_t v15 = objc_msgSend(v7, "hmf_UUIDForKey:", @"kIDSMessageRequestTransactionIDKey");
      if (!v15)
      {
        uint64_t v22 = (void *)MEMORY[0x263F087E8];
        v23 = @"The transaction identifier is required for request-responses";
        goto LABEL_50;
      }
      v12 = (void *)v15;
      uint64_t v16 = 1;
    }
    else
    {
      int v17 = objc_msgSend(v7, "hmf_BOOLForKey:", @"kIDSMessageIsNotificationKey");
      v12 = 0;
      uint64_t v16 = 2;
      if (!v17) {
        uint64_t v16 = 3;
      }
    }
    uint64_t v60 = v16;
LABEL_17:
    v18 = objc_msgSend(v7, "hmf_dictionaryForKey:", @"kRemoteMessageHeadersKey");
    if ([v18 count])
    {
      v19 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v18, "count"));
      v64[0] = MEMORY[0x263EF8330];
      v64[1] = 3221225472;
      v64[2] = __80__HMDRemoteMessageSerialization_remoteMessageWithDictionary_isHH2Payload_error___block_invoke;
      v64[3] = &unk_264A2EB40;
      id v20 = v19;
      id v65 = v20;
      [v18 enumerateKeysAndObjectsUsingBlock:v64];
      if ([v20 count]) {
        v21 = (void *)[v20 copy];
      }
      else {
        v21 = 0;
      }
    }
    else
    {
      v21 = 0;
    }
    v61 = v10;

    if (v63)
    {
      uint64_t v24 = [objc_alloc(MEMORY[0x263F42570]) initWithTarget:v63];
    }
    else
    {
      uint64_t v24 = [MEMORY[0x263F42570] allMessageDestinations];
    }
    v25 = (void *)v24;
    v26 = objc_msgSend(v7, "hmf_numberForKey:", @"kRemoteMessageQoSKey");
    if (v26)
    {
      id v27 = v26;
      [v26 integerValue];
      if (HMFQualityOfServiceCompare() == 1)
      {
        v28 = &unk_26E473B28;
      }
      else
      {
        [v27 integerValue];
        if (HMFQualityOfServiceCompare()
          || ((v52 = NSNumber, uint64_t v53 = [v27 integerValue], v53 <= 17)
            ? (uint64_t v54 = 17)
            : (uint64_t v54 = v53),
              v54 != 21 ? (uint64_t v55 = v54) : (uint64_t v55 = 17),
              [v52 numberWithInteger:v55],
              (v28 = objc_claimAutoreleasedReturnValue()) == 0))
        {
          v36 = [HMDRemoteMessage alloc];
          goto LABEL_38;
        }
      }
      v29 = (void *)MEMORY[0x230FBD990]();
      id v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v31 = v58 = v21;
        [v27 integerValue];
        HMFQualityOfServiceToString();
        __int16 v57 = v29;
        v33 = v32 = v25;
        [v28 integerValue];
        HMFQualityOfServiceToString();
        unint64_t v34 = v59 = v12;
        *(_DWORD *)buf = 138544386;
        v67 = v31;
        __int16 v68 = 2112;
        id v69 = v33;
        __int16 v70 = 2112;
        v71 = v34;
        __int16 v72 = 2112;
        v73 = v8;
        __int16 v74 = 2112;
        v75 = v61;
        _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_INFO, "%{public}@Changing the QoS (%@ -> %@) of remote message: %@ (%@)", buf, 0x34u);

        v12 = v59;
        v25 = v32;
        v29 = v57;

        v21 = v58;
      }

      id v35 = v28;

      v36 = [HMDRemoteMessage alloc];
      if (v35)
      {
        id v27 = v35;
LABEL_38:
        uint64_t v37 = [v27 integerValue];

        goto LABEL_39;
      }
    }
    else
    {
      v36 = [HMDRemoteMessage alloc];
    }
    uint64_t v37 = 17;
LABEL_39:
    LOBYTE(v56) = 0;
    v14 = [(HMDRemoteMessage *)v36 initWithName:v8 qualityOfService:v37 destination:v25 payload:v62 headers:v21 type:v60 timeout:0.0 secure:v56];
    if (v14)
    {
      uint64_t v38 = v25;
      v39 = v21;
      id v40 = objc_msgSend(v7, "hmf_stringForKey:", @"dv");
      if (v40)
      {
        v41 = [[HMDHomeKitVersion alloc] initWithVersionString:v40];
        [(HMDRemoteMessage *)v14 setSourceVersion:v41];
      }
      [(HMDRemoteMessage *)v14 setIdentifier:v61];
      v42 = v12;
      [(HMDRemoteMessage *)v14 setTransactionIdentifier:v12];
      v43 = objc_msgSend(v7, "hmf_numberForKey:", @"kRemoteMessageResponseRestrictionKey");
      uint64_t v44 = [v43 unsignedIntegerValue];

      if (v44) {
        [(HMDRemoteMessage *)v14 setResponseRestriction:v44];
      }

      v13 = 0;
      v12 = v42;
      v21 = v39;
      v25 = v38;
    }
    else
    {
      v45 = (void *)MEMORY[0x230FBD990]();
      v46 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v47 = v25;
        v48 = v21;
        v50 = uint64_t v49 = v12;
        *(_DWORD *)buf = 138543618;
        v67 = v50;
        __int16 v68 = 2112;
        id v69 = v7;
        _os_log_impl(&dword_22F52A000, v46, OS_LOG_TYPE_ERROR, "%{public}@Failed to create message with message dictionary: %@", buf, 0x16u);

        v12 = v49;
        v21 = v48;
        v25 = v47;
      }

      v13 = [MEMORY[0x263F087E8] hmErrorWithCode:52];
    }

    v10 = v61;
    goto LABEL_51;
  }
  v13 = [MEMORY[0x263F087E8] hmErrorWithCode:3 description:@"Invalid parameter" reason:@"The message identifier is missing" suggestion:0];
  v14 = 0;
LABEL_52:

LABEL_53:
  if (a5) {
    *a5 = v13;
  }

  return v14;
}

void __80__HMDRemoteMessageSerialization_remoteMessageWithDictionary_isHH2Payload_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v6 = v8;
  }
  else {
    BOOL v6 = 0;
  }
  id v7 = v6;
  if (v7) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v7];
  }
}

+ (id)remoteMessageWithDictionary:(id)a3 error:(id *)a4
{
  return (id)[a1 remoteMessageWithDictionary:a3 isHH2Payload:0 error:a4];
}

@end