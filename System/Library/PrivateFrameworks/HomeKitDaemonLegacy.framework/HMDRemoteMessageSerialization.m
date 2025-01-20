@interface HMDRemoteMessageSerialization
+ (BOOL)legacyNotificationMessage:(id)a3;
+ (id)dictionaryForMessage:(id)a3 error:(id *)a4;
+ (id)remoteMessageWithDictionary:(id)a3 error:(id *)a4;
@end

@implementation HMDRemoteMessageSerialization

+ (id)dictionaryForMessage:(id)a3 error:(id *)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    v7 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
    v8 = [v6 name];
    [v7 setObject:v8 forKeyedSubscript:@"kIDSMessageNameKey"];

    v9 = [v6 identifier];
    v10 = [v9 UUIDString];
    [v7 setObject:v10 forKeyedSubscript:@"kIDSMessageIdentifierKey"];

    v11 = [v6 destination];
    v12 = [v11 target];
    v13 = [v12 UUIDString];
    [v7 setObject:v13 forKeyedSubscript:@"kIDSMessageTargetKey"];

    v14 = [v6 messagePayload];

    if (v14)
    {
      v15 = (void *)MEMORY[0x1E4F28F98];
      v16 = [v6 messagePayload];
      LOBYTE(v15) = [v15 propertyList:v16 isValidForFormat:200];

      if ((v15 & 1) == 0)
      {
        uint64_t v41 = MEMORY[0x1D9452090]();
        v42 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          v43 = HMFGetLogIdentifier();
          v44 = [v6 messagePayload];
          int v52 = 138543618;
          v53 = v43;
          __int16 v54 = 2112;
          v55 = v44;
          _os_log_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_ERROR, "%{public}@Invalid message payload: %@", (uint8_t *)&v52, 0x16u);
        }
        v45 = (void *)v41;
        goto LABEL_33;
      }
      v17 = [v6 messagePayload];
      [v7 setObject:v17 forKeyedSubscript:@"kIDSMessagePayloadKey"];
    }
    v18 = [v6 headers];
    uint64_t v19 = [v18 count];

    if (!v19)
    {
LABEL_8:
      v23 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "qualityOfService"));
      [v7 setObject:v23 forKeyedSubscript:@"kRemoteMessageQoSKey"];

      id v24 = v6;
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (isKindOfClass) {
        v26 = v24;
      }
      else {
        v26 = 0;
      }
      id v27 = v26;

      if (isKindOfClass)
      {
        v28 = [v24 transactionIdentifier];

        if (v28)
        {
          v29 = [v24 transactionIdentifier];
          v30 = [v29 UUIDString];
          [v7 setObject:v30 forKeyedSubscript:@"kIDSMessageRequestTransactionIDKey"];
        }
        unint64_t v31 = [v24 type];
        if (v31 <= 2) {
          [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*off_1E6A194D0[v31]];
        }
        if ([v24 isSecure])
        {
          v32 = +[HMDHomeKitVersion currentVersion];
          v33 = [v32 versionString];
          [v7 setObject:v33 forKeyedSubscript:@"dv"];
        }
        uint64_t v34 = [v24 remoteResponseRestriction];
        if (v34 != -1)
        {
          uint64_t v35 = v34;
          if (![v24 type])
          {
            v36 = [NSNumber numberWithUnsignedInteger:v35];
            [v7 setObject:v36 forKeyedSubscript:@"kRemoteMessageResponseRestrictionKey"];
          }
        }
      }
      id v37 = v7;

      goto LABEL_36;
    }
    v20 = (void *)MEMORY[0x1E4F28F98];
    v21 = [v6 headers];
    LOBYTE(v20) = [v20 propertyList:v21 isValidForFormat:200];

    if (v20)
    {
      v22 = [v6 headers];
      [v7 setObject:v22 forKeyedSubscript:@"kRemoteMessageHeadersKey"];

      goto LABEL_8;
    }
    uint64_t v46 = MEMORY[0x1D9452090]();
    id v47 = a1;
    v48 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      v49 = HMFGetLogIdentifier();
      v50 = [v6 headers];
      int v52 = 138543618;
      v53 = v49;
      __int16 v54 = 2112;
      v55 = v50;
      _os_log_impl(&dword_1D49D5000, v48, OS_LOG_TYPE_ERROR, "%{public}@Invalid message headers: %@", (uint8_t *)&v52, 0x16u);
    }
    v45 = (void *)v46;
LABEL_33:
    if (a4)
    {
      [MEMORY[0x1E4F28C58] hmErrorWithCode:22];
      id v37 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v37 = 0;
    }
LABEL_36:

    goto LABEL_37;
  }
  v38 = (void *)MEMORY[0x1D9452090]();
  v39 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
  {
    v40 = HMFGetLogIdentifier();
    int v52 = 138543362;
    v53 = v40;
    _os_log_impl(&dword_1D49D5000, v39, OS_LOG_TYPE_ERROR, "%{public}@Message parameter is required", (uint8_t *)&v52, 0xCu);
  }
  if (a4)
  {
    [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
    id v37 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v37 = 0;
  }
LABEL_37:

  return v37;
}

+ (id)remoteMessageWithDictionary:(id)a3 error:(id *)a4
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = objc_msgSend(v6, "hmf_stringForKey:", @"kIDSMessageNameKey");
  if (!v7)
  {
    v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3 description:@"Invalid parameter" reason:@"The message name is missing" suggestion:0];
    v12 = 0;
    goto LABEL_52;
  }
  v8 = objc_msgSend(v6, "hmf_UUIDForKey:", @"kIDSMessageIdentifierKey");
  if (v8)
  {
    v60 = objc_msgSend(v6, "hmf_UUIDForKey:", @"kIDSMessageTargetKey");
    v59 = objc_msgSend(v6, "hmf_dictionaryForKey:", @"kIDSMessagePayloadKey");
    if (objc_msgSend(v6, "hmf_BOOLForKey:", @"kIDSMessageRequiresResponseKey"))
    {
      uint64_t v9 = objc_msgSend(v6, "hmf_UUIDForKey:", @"kIDSMessageRequestTransactionIDKey");
      if (v9)
      {
        v10 = (void *)v9;
        uint64_t v57 = 0;
        goto LABEL_19;
      }
      v15 = (void *)MEMORY[0x1E4F28C58];
      v16 = @"The transaction identifier is required for requests";
LABEL_16:
      v11 = [v15 hmErrorWithCode:3 description:@"Invalid parameter" reason:v16 suggestion:0];
      v12 = 0;
LABEL_50:

      goto LABEL_51;
    }
    if (objc_msgSend(v6, "hmf_BOOLForKey:", @"kIDSMessageIsResponseToRequest"))
    {
      uint64_t v13 = objc_msgSend(v6, "hmf_UUIDForKey:", @"kIDSMessageRequestTransactionIDKey");
      if (!v13)
      {
        v15 = (void *)MEMORY[0x1E4F28C58];
        v16 = @"The transaction identifier is required for request-responses";
        goto LABEL_16;
      }
      v10 = (void *)v13;
      uint64_t v14 = 1;
    }
    else if ((objc_msgSend(v6, "hmf_BOOLForKey:", @"kIDSMessageIsNotificationKey") & 1) != 0 {
           || [a1 legacyNotificationMessage:v7])
    }
    {
      v10 = 0;
      uint64_t v14 = 2;
    }
    else
    {
      v10 = 0;
      uint64_t v14 = 3;
    }
    uint64_t v57 = v14;
LABEL_19:
    v17 = objc_msgSend(v6, "hmf_dictionaryForKey:", @"kRemoteMessageHeadersKey");
    if ([v17 count])
    {
      v18 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
      v61[0] = MEMORY[0x1E4F143A8];
      v61[1] = 3221225472;
      v61[2] = __67__HMDRemoteMessageSerialization_remoteMessageWithDictionary_error___block_invoke;
      v61[3] = &unk_1E6A19458;
      id v19 = v18;
      id v62 = v19;
      [v17 enumerateKeysAndObjectsUsingBlock:v61];
      if ([v19 count]) {
        v20 = (void *)[v19 copy];
      }
      else {
        v20 = 0;
      }
    }
    else
    {
      v20 = 0;
    }
    v58 = v8;

    if (v60)
    {
      uint64_t v21 = [objc_alloc(MEMORY[0x1E4F65488]) initWithTarget:v60];
    }
    else
    {
      uint64_t v21 = [MEMORY[0x1E4F65488] allMessageDestinations];
    }
    v22 = (void *)v21;
    v23 = objc_msgSend(v6, "hmf_numberForKey:", @"kRemoteMessageQoSKey");
    if (v23)
    {
      id v24 = v23;
      [v23 integerValue];
      if (HMFQualityOfServiceCompare() == 1)
      {
        v25 = &unk_1F2DC9F10;
      }
      else
      {
        [v24 integerValue];
        if (HMFQualityOfServiceCompare()
          || ((v49 = NSNumber, uint64_t v50 = [v24 integerValue], v50 <= 17)
            ? (uint64_t v51 = 17)
            : (uint64_t v51 = v50),
              v51 != 21 ? (uint64_t v52 = v51) : (uint64_t v52 = 17),
              [v49 numberWithInteger:v52],
              (v25 = objc_claimAutoreleasedReturnValue()) == 0))
        {
          v33 = [HMDRemoteMessage alloc];
          goto LABEL_39;
        }
      }
      v26 = (void *)MEMORY[0x1D9452090]();
      id v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v28 = v55 = v20;
        [v24 integerValue];
        HMFQualityOfServiceToString();
        __int16 v54 = v26;
        v30 = v29 = v22;
        [v25 integerValue];
        HMFQualityOfServiceToString();
        unint64_t v31 = v56 = v10;
        *(_DWORD *)buf = 138544386;
        v64 = v28;
        __int16 v65 = 2112;
        id v66 = v30;
        __int16 v67 = 2112;
        v68 = v31;
        __int16 v69 = 2112;
        v70 = v7;
        __int16 v71 = 2112;
        v72 = v58;
        _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_INFO, "%{public}@Changing the QoS (%@ -> %@) of remote message: %@ (%@)", buf, 0x34u);

        v10 = v56;
        v22 = v29;
        v26 = v54;

        v20 = v55;
      }

      id v32 = v25;

      v33 = [HMDRemoteMessage alloc];
      if (v32)
      {
        id v24 = v32;
LABEL_39:
        uint64_t v34 = [v24 integerValue];

        goto LABEL_40;
      }
    }
    else
    {
      v33 = [HMDRemoteMessage alloc];
    }
    uint64_t v34 = 17;
LABEL_40:
    LOBYTE(v53) = 0;
    v12 = [(HMDRemoteMessage *)v33 initWithName:v7 qualityOfService:v34 destination:v22 payload:v59 headers:v20 type:v57 timeout:0.0 secure:v53];
    if (v12)
    {
      uint64_t v35 = v22;
      v36 = v20;
      id v37 = objc_msgSend(v6, "hmf_stringForKey:", @"dv");
      if (v37)
      {
        v38 = [[HMDHomeKitVersion alloc] initWithVersionString:v37];
        [(HMDRemoteMessage *)v12 setSourceVersion:v38];
      }
      [(HMDRemoteMessage *)v12 setIdentifier:v58];
      v39 = v10;
      [(HMDRemoteMessage *)v12 setTransactionIdentifier:v10];
      v40 = objc_msgSend(v6, "hmf_numberForKey:", @"kRemoteMessageResponseRestrictionKey");
      uint64_t v41 = [v40 unsignedIntegerValue];

      if (v41) {
        [(HMDRemoteMessage *)v12 setResponseRestriction:v41];
      }

      v11 = 0;
      v10 = v39;
      v20 = v36;
      v22 = v35;
    }
    else
    {
      v42 = (void *)MEMORY[0x1D9452090]();
      v43 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v44 = v22;
        v45 = v20;
        v47 = uint64_t v46 = v10;
        *(_DWORD *)buf = 138543618;
        v64 = v47;
        __int16 v65 = 2112;
        id v66 = v6;
        _os_log_impl(&dword_1D49D5000, v43, OS_LOG_TYPE_ERROR, "%{public}@Failed to create message with message dictionary: %@", buf, 0x16u);

        v10 = v46;
        v20 = v45;
        v22 = v44;
      }

      v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52];
    }

    v8 = v58;
    goto LABEL_50;
  }
  v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3 description:@"Invalid parameter" reason:@"The message identifier is missing" suggestion:0];
  v12 = 0;
LABEL_51:

LABEL_52:
  if (a4) {
    *a4 = v11;
  }

  return v12;
}

void __67__HMDRemoteMessageSerialization_remoteMessageWithDictionary_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v8;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;
  if (v7) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v7];
  }
}

+ (BOOL)legacyNotificationMessage:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"kCharacteristicValueUpdatedNotificationKey"]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isEqualToString:@"kMultipleCharacteristicValuesUpdatedNotificationKey"];
  }

  return v4;
}

@end