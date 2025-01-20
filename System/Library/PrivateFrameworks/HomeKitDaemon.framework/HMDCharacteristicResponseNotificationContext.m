@interface HMDCharacteristicResponseNotificationContext
+ (id)notificationUpdateMessagePayloadForHome:(id)a3 notificationEnabled:(BOOL)a4 characteristics:(id)a5 characteristicsErrorsMap:(id)a6;
+ (id)responsePayloadForHome:(id)a3 changedAccessories:(id)a4 moreMessagesInMultipart:(id)a5;
+ (id)updateMultipleCharacteristicReadWriteResponsePayload:(id)a3 withUnhandledRequests:(id)a4;
- (BOOL)hasPendingMultiPartResponses;
- (HMDCharacteristicResponseNotificationContext)initWithRequestIdentifier:(id)a3 responses:(id)a4 pendingMultiPartResponses:(BOOL)a5;
- (NSDictionary)notificationPayloadByAccessoryUUID;
- (NSSet)changedCharacteristics;
- (NSSet)previouslyNilChangedCharacteristics;
- (NSSet)responseCharacteristics;
- (NSUUID)requestIdentifier;
- (id)attributeDescriptions;
- (id)notificationWithHome:(id)a3;
@end

@implementation HMDCharacteristicResponseNotificationContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseCharacteristics, 0);
  objc_storeStrong((id *)&self->_notificationPayloadByAccessoryUUID, 0);
  objc_storeStrong((id *)&self->_previouslyNilChangedCharacteristics, 0);
  objc_storeStrong((id *)&self->_changedCharacteristics, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
}

- (BOOL)hasPendingMultiPartResponses
{
  return self->_pendingMultiPartResponses;
}

- (NSSet)responseCharacteristics
{
  return (NSSet *)objc_getProperty(self, a2, 48, 1);
}

- (NSDictionary)notificationPayloadByAccessoryUUID
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (NSSet)previouslyNilChangedCharacteristics
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (NSSet)changedCharacteristics
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)requestIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (id)attributeDescriptions
{
  v20[5] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v19 = [(HMDCharacteristicResponseNotificationContext *)self requestIdentifier];
  v4 = (void *)[v3 initWithName:@"Request Identifier" value:v19];
  v20[0] = v4;
  id v5 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMDCharacteristicResponseNotificationContext *)self hasPendingMultiPartResponses];
  v6 = HMFBooleanToString();
  v7 = (void *)[v5 initWithName:@"Has Pending Multi Part Responses" value:v6];
  v20[1] = v7;
  id v8 = objc_alloc(MEMORY[0x263F424F8]);
  v9 = [(HMDCharacteristicResponseNotificationContext *)self changedCharacteristics];
  v10 = (void *)[v8 initWithName:@"Changed Characteristics" value:v9];
  v20[2] = v10;
  id v11 = objc_alloc(MEMORY[0x263F424F8]);
  v12 = [(HMDCharacteristicResponseNotificationContext *)self previouslyNilChangedCharacteristics];
  v13 = (void *)[v11 initWithName:@"Previously Nil Changed Characteristics" value:v12];
  v20[3] = v13;
  id v14 = objc_alloc(MEMORY[0x263F424F8]);
  v15 = [(HMDCharacteristicResponseNotificationContext *)self notificationPayloadByAccessoryUUID];
  v16 = (void *)[v14 initWithName:@"Notification Payload" value:v15];
  v20[4] = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:5];

  return v17;
}

- (id)notificationWithHome:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCharacteristicResponseNotificationContext *)self requestIdentifier];

  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v7 = [(HMDCharacteristicResponseNotificationContext *)self notificationPayloadByAccessoryUUID];
    [v6 setObject:v7 forKeyedSubscript:@"kModifiedCharacteristicsForAccessoryKey"];

    id v8 = [(HMDCharacteristicResponseNotificationContext *)self requestIdentifier];
    [v6 setObject:v8 forKeyedSubscript:@"kModifiedCharacteristicsMessageIdentifierKey"];

    v9 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDCharacteristicResponseNotificationContext hasPendingMultiPartResponses](self, "hasPendingMultiPartResponses"));
    [v6 setObject:v9 forKeyedSubscript:@"kMultiPartResponseKey"];

    v10 = (void *)[objc_alloc(MEMORY[0x263F089F8]) initWithName:@"HMDAccessoryCharacteristicsResponseReceivedNotification" object:v4 userInfo:v6];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (HMDCharacteristicResponseNotificationContext)initWithRequestIdentifier:(id)a3 responses:(id)a4 pendingMultiPartResponses:(BOOL)a5
{
  uint64_t v122 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v110.receiver = self;
  v110.super_class = (Class)HMDCharacteristicResponseNotificationContext;
  v10 = [(HMDCharacteristicResponseNotificationContext *)&v110 init];
  if (v10)
  {
    id v87 = v8;
    uint64_t v11 = [v8 copy];
    requestIdentifier = v10->_requestIdentifier;
    v10->_requestIdentifier = (NSUUID *)v11;

    v91 = v10;
    v10->_pendingMultiPartResponses = a5;
    v98 = [MEMORY[0x263EFF9C0] set];
    v90 = [MEMORY[0x263EFF9C0] set];
    v88 = [MEMORY[0x263EFF9C0] set];
    v101 = [MEMORY[0x263EFF9A0] dictionary];
    long long v106 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    id v86 = v9;
    id obj = v9;
    uint64_t v13 = [obj countByEnumeratingWithState:&v106 objects:v121 count:16];
    if (!v13) {
      goto LABEL_67;
    }
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v107;
    uint64_t v89 = *MEMORY[0x263F0C710];
    uint64_t v97 = *(void *)v107;
    while (1)
    {
      uint64_t v16 = 0;
      uint64_t v99 = v14;
      do
      {
        if (*(void *)v107 != v15) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v106 + 1) + 8 * v16);
        v18 = objc_msgSend(v17, "request", v86);
        v19 = [v18 characteristic];

        v20 = [v19 service];
        v21 = [v20 accessory];
        v22 = v21;
        if (v19) {
          BOOL v23 = v20 == 0;
        }
        else {
          BOOL v23 = 1;
        }
        if (!v23 && v21 != 0)
        {
          v25 = [v21 uuid];
          uint64_t v26 = [v25 UUIDString];

          v27 = objc_msgSend(v101, "hmf_mutableDictionaryForKey:", v26);
          if (!v27)
          {
            v27 = [MEMORY[0x263EFF9A0] dictionary];
            [v101 setObject:v27 forKeyedSubscript:v26];
          }
          v103 = (void *)v26;
          v28 = [v20 instanceID];
          v29 = [v28 stringValue];
          v30 = objc_msgSend(v27, "hmf_mutableDictionaryForKey:", v29);

          if (!v30)
          {
            v30 = [MEMORY[0x263EFF9A0] dictionary];
            v31 = [v20 instanceID];
            v32 = [v31 stringValue];
            [v27 setObject:v30 forKeyedSubscript:v32];
          }
          [v98 addObject:v19];
          id v33 = [v17 error];
          v104 = v22;
          v102 = v27;
          if (v33
            || ([v17 value], v39 = objc_claimAutoreleasedReturnValue(), v39, !v39)
            && ([MEMORY[0x263F087E8] errorWithDomain:v89 code:4 userInfo:0],
                (id v33 = (id)objc_claimAutoreleasedReturnValue()) != 0))
          {
            v34 = v30;
            id v105 = 0;
            v35 = [MEMORY[0x263F08910] archivedDataWithRootObject:v33 requiringSecureCoding:1 error:&v105];
            id v36 = v105;
            if (v35)
            {
              v119 = @"kCharacteristicErrorDataKey";
              v120 = v35;
              v37 = [NSDictionary dictionaryWithObjects:&v120 forKeys:&v119 count:1];
              v38 = (void *)[v37 mutableCopy];
            }
            else
            {
              v49 = (void *)MEMORY[0x230FBD990]();
              v50 = v91;
              v51 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v52 = v96 = v49;
                *(_DWORD *)buf = 138543874;
                v114 = v52;
                __int16 v115 = 2112;
                id v116 = v33;
                __int16 v117 = 2112;
                id v118 = v36;
                _os_log_impl(&dword_22F52A000, v51, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize error %@: %@", buf, 0x20u);

                v49 = v96;
              }

              v38 = 0;
            }

            v53 = v103;
            v30 = v34;
          }
          else
          {
            id v33 = [v17 value];
            v40 = [v17 request];
            int v41 = [v40 isMemberOfClass:objc_opt_class()];

            if (v41)
            {
              v42 = v30;
              v43 = [v19 lastKnownValue];
              v44 = [v19 lastKnownValueUpdateTime];
              v45 = [v17 valueUpdatedTime];
              BOOL v46 = [v44 compare:v45] != 1 || v43 == 0;
              char v47 = !v46;
              char v95 = v47;
              if (v46)
              {
              }
              else
              {
                char v48 = [v43 isEqual:v33];

                if (v48)
                {
                  char v95 = 0;
                  goto LABEL_45;
                }
                v54 = (void *)MEMORY[0x230FBD990]();
                v55 = v91;
                v56 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v57 = v92 = v54;
                  *(_DWORD *)buf = 138543874;
                  v114 = v57;
                  __int16 v115 = 2112;
                  id v116 = v17;
                  __int16 v117 = 2112;
                  id v118 = v43;
                  _os_log_impl(&dword_22F52A000, v56, OS_LOG_TYPE_INFO, "%{public}@Updating notification context response to last known characteristic value %@ -> %@", buf, 0x20u);

                  v54 = v92;
                }

                v44 = v33;
                id v33 = v43;
              }

LABEL_45:
              v30 = v42;

              if (!v33)
              {
LABEL_46:
                id v33 = [MEMORY[0x263EFF9D0] null];
              }
            }
            else
            {
              char v95 = 0;
              if (!v33) {
                goto LABEL_46;
              }
            }
            v111 = @"kCharacteristicValue";
            id v112 = v33;
            v58 = [NSDictionary dictionaryWithObjects:&v112 forKeys:&v111 count:1];
            v38 = (void *)[v58 mutableCopy];

            v59 = [v19 lastKnownValueUpdateTime];
            [v38 setObject:v59 forKeyedSubscript:@"kCharacteristicValueUpdateTime"];

            v60 = [v19 notificationContext];
            [v38 setObject:v60 forKeyedSubscript:@"kCharacteristicNotificationContextKey"];

            uint64_t v61 = [v17 stateNumber];
            if (v61)
            {
              v62 = (void *)v61;
              v93 = v30;
              v63 = [v17 stateNumber];
              v64 = [v19 stateNumber];
              uint64_t v65 = HAPCompareStateNumberWithRollover();

              if (v65 == 1)
              {
                v66 = [v17 stateNumber];
                [v19 setStateNumber:v66];
              }
              else
              {
                LOBYTE(v65) = 0;
              }
              v30 = v93;
            }
            else
            {
              LOBYTE(v65) = 0;
            }
            v67 = [v19 stateNumber];
            [v38 setObject:v67 forKeyedSubscript:@"kCharacteristicValueUpdateStateNumberKey"];

            v68 = [v17 request];
            id v36 = [v68 previousValue];

            if (v36) {
              char v69 = v95;
            }
            else {
              char v69 = 1;
            }
            if ((v69 & 1) != 0
              || !+[HMDCharacteristic value:v33 differentThan:v36])
            {
              BOOL v72 = 0;
            }
            else
            {
              v70 = [v19 previousValue];
              [v19 lastKnownValue];
              v71 = v94 = v30;
              BOOL v72 = +[HMDCharacteristic value:v70 differentThan:v71];

              v30 = v94;
            }
            char v73 = v65 | v72;
            v74 = v90;
            v53 = v103;
            if ((v73 & 1) != 0 || !v36 && (v74 = v88, v33)) {
              [v74 addObject:v19];
            }
          }

          v75 = [v19 instanceID];
          v76 = [v75 stringValue];
          [v30 setObject:v38 forKeyedSubscript:v76];

          uint64_t v14 = v99;
          uint64_t v15 = v97;
          v22 = v104;
        }

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [obj countByEnumeratingWithState:&v106 objects:v121 count:16];
      if (!v14)
      {
LABEL_67:

        uint64_t v77 = [v98 copy];
        v10 = v91;
        responseCharacteristics = v91->_responseCharacteristics;
        v91->_responseCharacteristics = (NSSet *)v77;

        uint64_t v79 = [v90 copy];
        changedCharacteristics = v91->_changedCharacteristics;
        v91->_changedCharacteristics = (NSSet *)v79;

        uint64_t v81 = [v88 copy];
        previouslyNilChangedCharacteristics = v91->_previouslyNilChangedCharacteristics;
        v91->_previouslyNilChangedCharacteristics = (NSSet *)v81;

        uint64_t v83 = [v101 copy];
        notificationPayloadByAccessoryUUID = v91->_notificationPayloadByAccessoryUUID;
        v91->_notificationPayloadByAccessoryUUID = (NSDictionary *)v83;

        id v9 = v86;
        id v8 = v87;
        break;
      }
    }
  }

  return v10;
}

+ (id)updateMultipleCharacteristicReadWriteResponsePayload:(id)a3 withUnhandledRequests:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 count])
  {
    v7 = objc_msgSend(v5, "hmf_dictionaryForKey:", @"kModifiedCharacteristicsForAccessoryKey");
    id v8 = (void *)[v7 mutableCopy];

    if (v8)
    {
      id v9 = (void *)MEMORY[0x230FBD990]();
      v10 = (void *)MEMORY[0x263F08910];
      uint64_t v11 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
      v12 = [v10 archivedDataWithRootObject:v11 requiringSecureCoding:1 error:0];

      uint64_t v19 = MEMORY[0x263EF8330];
      uint64_t v20 = 3221225472;
      v21 = __123__HMDCharacteristicResponseNotificationContext_updateMultipleCharacteristicReadWriteResponsePayload_withUnhandledRequests___block_invoke;
      v22 = &unk_264A2D720;
      id v13 = v8;
      id v23 = v13;
      id v24 = v12;
      id v14 = v12;
      [v6 enumerateKeysAndObjectsUsingBlock:&v19];
      uint64_t v15 = objc_msgSend(v5, "mutableCopy", v19, v20, v21, v22);
      uint64_t v16 = (void *)[v13 copy];
      [v15 setObject:v16 forKeyedSubscript:@"kModifiedCharacteristicsForAccessoryKey"];

      id v17 = (id)[v15 copy];
    }
    else
    {
      id v17 = v5;
    }
  }
  else
  {
    id v17 = v5;
  }

  return v17;
}

void __123__HMDCharacteristicResponseNotificationContext_updateMultipleCharacteristicReadWriteResponsePayload_withUnhandledRequests___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v8 = objc_msgSend(v5, "hmf_dictionaryForKey:", v7);
  id v9 = (void *)[v8 mutableCopy];
  v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [MEMORY[0x263EFF9A0] dictionary];
  }
  v12 = v11;

  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  id v17 = __123__HMDCharacteristicResponseNotificationContext_updateMultipleCharacteristicReadWriteResponsePayload_withUnhandledRequests___block_invoke_2;
  v18 = &unk_264A2D6F8;
  id v19 = v12;
  id v20 = *(id *)(a1 + 40);
  id v13 = v12;
  [v6 enumerateKeysAndObjectsUsingBlock:&v15];

  id v14 = objc_msgSend(v13, "copy", v15, v16, v17, v18);
  [*(id *)(a1 + 32) setObject:v14 forKeyedSubscript:v7];
}

void __123__HMDCharacteristicResponseNotificationContext_updateMultipleCharacteristicReadWriteResponsePayload_withUnhandledRequests___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v19 = v5;
  id v7 = objc_msgSend(*(id *)(a1 + 32), "hmf_dictionaryForKey:", v5);
  id v8 = (void *)[v7 mutableCopy];

  if (!v8)
  {
    id v8 = [MEMORY[0x263EFF9A0] dictionary];
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v20 + 1) + 8 * v13);
        uint64_t v15 = *(void *)(a1 + 40);
        id v24 = @"kCharacteristicErrorDataKey";
        uint64_t v25 = v15;
        uint64_t v16 = [NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
        id v17 = [v14 stringValue];
        [v8 setObject:v16 forKeyedSubscript:v17];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v11);
  }

  v18 = (void *)[v8 copy];
  [*(id *)(a1 + 32) setObject:v18 forKeyedSubscript:v19];
}

+ (id)notificationUpdateMessagePayloadForHome:(id)a3 notificationEnabled:(BOOL)a4 characteristics:(id)a5 characteristicsErrorsMap:(id)a6
{
  BOOL v51 = a4;
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v50 = a3;
  id v8 = a5;
  id v54 = a6;
  id v9 = [MEMORY[0x263EFF9A0] dictionary];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id obj = v8;
  uint64_t v57 = [obj countByEnumeratingWithState:&v58 objects:v70 count:16];
  if (v57)
  {
    uint64_t v56 = *(void *)v59;
    v52 = v9;
    do
    {
      for (uint64_t i = 0; i != v57; ++i)
      {
        if (*(void *)v59 != v56) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "service", v50);
        uint64_t v13 = [v12 instanceID];
        id v14 = [v12 accessory];
        uint64_t v15 = [v14 uuid];
        uint64_t v16 = [v15 UUIDString];

        if (v13) {
          BOOL v17 = v16 == 0;
        }
        else {
          BOOL v17 = 1;
        }
        if (v17)
        {
          v18 = (void *)MEMORY[0x230FBD990]();
          id v19 = a1;
          long long v20 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            long long v21 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            uint64_t v65 = v21;
            __int16 v66 = 2112;
            v67 = v12;
            __int16 v68 = 2112;
            char v69 = v11;
            _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Missing required service (%@) properties for characteristic %@ - dropping the notification", buf, 0x20u);
          }
        }
        else
        {
          long long v22 = (void *)MEMORY[0x263EFF9A0];
          uint64_t v23 = [v9 objectForKeyedSubscript:v16];
          id v24 = (void *)v23;
          uint64_t v25 = MEMORY[0x263EFFA78];
          if (v23) {
            uint64_t v26 = v23;
          }
          else {
            uint64_t v26 = MEMORY[0x263EFFA78];
          }
          uint64_t v27 = [v22 dictionaryWithDictionary:v26];

          v28 = (void *)MEMORY[0x263EFF9A0];
          uint64_t v29 = [v27 objectForKeyedSubscript:v13];
          v30 = (void *)v29;
          if (v29) {
            uint64_t v31 = v29;
          }
          else {
            uint64_t v31 = v25;
          }
          v32 = [v28 dictionaryWithDictionary:v31];

          id v33 = [MEMORY[0x263EFF9A0] dictionary];
          v34 = [v54 objectForKey:v11];
          if (v34)
          {
            v35 = [MEMORY[0x263F08910] archivedDataWithRootObject:v34 requiringSecureCoding:1 error:0];
            id v36 = v33;
            v37 = v35;
            v38 = @"kCharacteristicErrorDataKey";
          }
          else
          {
            v39 = [NSNumber numberWithBool:v51];
            [v33 setObject:v39 forKeyedSubscript:@"kCharacteristicNotificationEnableKey"];

            v35 = [v11 notificationEnabledTime];
            id v36 = v33;
            v37 = v35;
            v38 = @"kCharacteristicNotificationEnableTime";
          }
          [v36 setObject:v37 forKeyedSubscript:v38];

          v40 = (void *)[v33 copy];
          int v41 = [v11 instanceID];
          [v32 setObject:v40 forKeyedSubscript:v41];

          v42 = (void *)[v32 copy];
          [v27 setObject:v42 forKeyedSubscript:v13];

          v43 = (void *)[v27 copy];
          [v52 setObject:v43 forKeyedSubscript:v16];

          id v9 = v52;
        }
      }
      uint64_t v57 = [obj countByEnumeratingWithState:&v58 objects:v70 count:16];
    }
    while (v57);
  }

  if ([v9 count])
  {
    v62[0] = @"kModifiedNotificationsForAccessoryKey";
    v44 = (void *)[v9 copy];
    v62[1] = @"kHomeUUID";
    v63[0] = v44;
    v45 = v50;
    BOOL v46 = [v50 uuid];
    char v47 = [v46 UUIDString];
    v63[1] = v47;
    char v48 = [NSDictionary dictionaryWithObjects:v63 forKeys:v62 count:2];
  }
  else
  {
    char v48 = (void *)MEMORY[0x263EFFA78];
    v45 = v50;
  }

  return v48;
}

+ (id)responsePayloadForHome:(id)a3 changedAccessories:(id)a4 moreMessagesInMultipart:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v11 = v10;
  if (v8) {
    [v10 setObject:v8 forKeyedSubscript:@"kModifiedCharacteristicsForAccessoryKey"];
  }
  if (v7)
  {
    uint64_t v12 = [v7 uuid];
    uint64_t v13 = [v12 UUIDString];
    [v11 setObject:v13 forKeyedSubscript:@"kHomeUUID"];
  }
  if (v9) {
    [v11 setObject:v9 forKeyedSubscript:@"kMultiPartResponseKey"];
  }
  id v14 = (void *)[v11 copy];

  return v14;
}

@end