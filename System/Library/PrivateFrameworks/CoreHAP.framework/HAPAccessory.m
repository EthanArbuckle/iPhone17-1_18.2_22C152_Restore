@interface HAPAccessory
+ (BOOL)isAccessoryPairedWithIdentifier:(id)a3;
+ (BOOL)isAccessoryPrimaryWithUniqueIdentifier:(id)a3;
+ (id)instanceIDForUniqueIdentifier:(id)a3;
+ (id)logCategory;
+ (id)productDataStringFromData:(id)a3;
+ (id)serverIdentifierWithUniqueIdentifier:(id)a3;
- (BOOL)_updateAndValidateServices;
- (BOOL)_updateService:(id)a3;
- (BOOL)_validateCharacteristicValues;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPaired;
- (BOOL)isPrimary;
- (BOOL)isReachable;
- (BOOL)mergeObject:(id)a3;
- (BOOL)shouldDisconnectOnIdle;
- (BOOL)shouldMergeObject:(id)a3;
- (BOOL)updateForAccessoryInformationService;
- (HAPAccessory)init;
- (HAPAccessory)initWithServer:(id)a3 instanceID:(id)a4;
- (HAPAccessory)initWithServer:(id)a3 instanceID:(id)a4 parsedServices:(id)a5;
- (HAPAccessoryDelegate)delegate;
- (HAPAccessoryServer)server;
- (HMFMACAddress)bluetoothClassicMacAddress;
- (NSArray)services;
- (NSDate)timeBecameReachable;
- (NSNumber)category;
- (NSNumber)instanceID;
- (NSNumber)sleepInterval;
- (NSString)description;
- (NSString)firmwareVersion;
- (NSString)identifier;
- (NSString)manufacturer;
- (NSString)model;
- (NSString)name;
- (NSString)productData;
- (NSString)serialNumber;
- (NSString)serverIdentifier;
- (NSString)uniqueIdentifier;
- (OS_dispatch_queue)workQueue;
- (id)characteristicOfType:(id)a3 serviceType:(id)a4;
- (id)characteristicWithInstanceID:(id)a3;
- (id)characteristicsOfType:(id)a3;
- (id)serviceWithInstanceID:(id)a3;
- (id)servicesOfType:(id)a3;
- (id)shortDescription;
- (int)consecutiveFailedPingCount;
- (int64_t)communicationProtocol;
- (int64_t)linkLayerType;
- (int64_t)linkType;
- (unint64_t)hash;
- (unint64_t)suspendedState;
- (void)invalidateWithError:(id)a3;
- (void)readCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6;
- (void)readValueForCharacteristic:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6;
- (void)setBluetoothClassicMacAddress:(id)a3;
- (void)setConsecutiveFailedPingCount:(int)a3;
- (void)setDelegate:(id)a3;
- (void)setFirmwareVersion:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInstanceID:(id)a3;
- (void)setLinkLayerType:(int64_t)a3;
- (void)setManufacturer:(id)a3;
- (void)setModel:(id)a3;
- (void)setName:(id)a3;
- (void)setPrimary:(BOOL)a3;
- (void)setProductData:(id)a3;
- (void)setReachable:(BOOL)a3;
- (void)setSerialNumber:(id)a3;
- (void)setServer:(id)a3;
- (void)setServerIdentifier:(id)a3;
- (void)setServices:(id)a3;
- (void)setShouldDisconnectOnIdle:(BOOL)a3;
- (void)setSleepInterval:(id)a3;
- (void)setSuspendedState:(unint64_t)a3;
- (void)setTimeBecameReachable:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)writeCharacteristicValue:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6;
- (void)writeCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6;
@end

@implementation HAPAccessory

- (NSString)serverIdentifier
{
  return self->_serverIdentifier;
}

- (id)shortDescription
{
  BOOL v3 = HAPIsInternalBuild();
  v4 = NSString;
  if (v3)
  {
    v5 = [(HAPAccessory *)self name];
    v6 = [(HAPAccessory *)self identifier];
    v7 = [(HAPAccessory *)self instanceID];
    v8 = [v4 stringWithFormat:@"%@/%@+%@", v5, v6, v7];
  }
  else
  {
    v5 = [(HAPAccessory *)self identifier];
    v6 = [(HAPAccessory *)self instanceID];
    v8 = [v4 stringWithFormat:@"%@+%@", v5, v6];
  }

  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (id)servicesOfType:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v6 = [(HAPAccessory *)self services];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v12 = [v11 type];
        int v13 = [v12 isEqualToString:v4];

        if (v13) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)_validateCharacteristicValues
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v2 = [(HAPAccessory *)self services];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v30 objects:v41 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v31;
    uint64_t v25 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v31 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        uint64_t v8 = [v7 characteristics];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v40 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v27;
          while (2)
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v27 != v11) {
                objc_enumerationMutation(v8);
              }
              int v13 = *(void **)(*((void *)&v26 + 1) + 8 * j);
              if ([v13 shouldValidateValueAfterReading])
              {
                uint64_t v14 = [v13 value];
                if (v14)
                {
                  long long v15 = (void *)v14;
                  char v16 = [v13 properties];

                  if ((v16 & 2) != 0)
                  {
                    long long v17 = [v13 value];
                    long long v18 = [v13 validateValue:v17 outValue:0];

                    if (v18)
                    {
                      uint64_t v20 = (void *)MEMORY[0x1D944E080]();
                      v21 = HMFGetOSLogHandle();
                      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                      {
                        v22 = HMFGetLogIdentifier();
                        v23 = [v13 type];
                        *(_DWORD *)buf = 138543874;
                        v35 = v22;
                        __int16 v36 = 2112;
                        v37 = v23;
                        __int16 v38 = 2112;
                        v39 = v18;
                        _os_log_impl(&dword_1D4758000, v21, OS_LOG_TYPE_ERROR, "%{public}@[HAP Accessory] ### Failed to validate value with type %@ with error %@", buf, 0x20u);
                      }

                      BOOL v19 = 0;
                      goto LABEL_24;
                    }
                  }
                }
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v40 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }

        uint64_t v5 = v25;
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v30 objects:v41 count:16];
      BOOL v19 = 1;
    }
    while (v4);
  }
  else
  {
    BOOL v19 = 1;
  }
LABEL_24:

  return v19;
}

- (BOOL)updateForAccessoryInformationService
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v3 = [(HAPAccessory *)self services];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v49 objects:v56 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v50;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v50 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        uint64_t v10 = [v9 type];
        int v11 = [v10 isEqualToString:@"0000003E-0000-1000-8000-0026BB765291"];

        if (v11)
        {
          if (v6)
          {
            v39 = (void *)MEMORY[0x1D944E080]();
            v40 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            {
              v41 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              v55 = v41;
              _os_log_impl(&dword_1D4758000, v40, OS_LOG_TYPE_ERROR, "%{public}@### Accessory has more than one Accessory Information Service", buf, 0xCu);
            }

            return 0;
          }
          id v6 = v9;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v49 objects:v56 count:16];
      if (v5) {
        continue;
      }
      break;
    }

    if (v6)
    {
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      v12 = objc_msgSend(v6, "characteristics", 0);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v45 objects:v53 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v46;
        do
        {
          for (uint64_t j = 0; j != v14; ++j)
          {
            if (*(void *)v46 != v15) {
              objc_enumerationMutation(v12);
            }
            long long v17 = *(void **)(*((void *)&v45 + 1) + 8 * j);
            long long v18 = [v17 value];

            if (v18)
            {
              BOOL v19 = [v17 value];
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                uint64_t v20 = v19;
              }
              else {
                uint64_t v20 = 0;
              }
              id v21 = v20;

              v22 = objc_msgSend(MEMORY[0x1E4F654E8], "hmf_cachedInstanceForString:", v21);

              v23 = [v17 type];
              int v24 = [v23 isEqualToString:@"00000023-0000-1000-8000-0026BB765291"];

              if (v24)
              {
                [(HAPAccessory *)self setName:v22];
              }
              else
              {
                uint64_t v25 = [v17 type];
                int v26 = [v25 isEqualToString:@"00000020-0000-1000-8000-0026BB765291"];

                if (v26)
                {
                  [(HAPAccessory *)self setManufacturer:v22];
                }
                else
                {
                  long long v27 = [v17 type];
                  int v28 = [v27 isEqualToString:@"00000021-0000-1000-8000-0026BB765291"];

                  if (v28)
                  {
                    [(HAPAccessory *)self setModel:v22];
                  }
                  else
                  {
                    long long v29 = [v17 type];
                    int v30 = [v29 isEqualToString:@"00000030-0000-1000-8000-0026BB765291"];

                    if (v30)
                    {
                      [(HAPAccessory *)self setSerialNumber:v22];
                    }
                    else
                    {
                      long long v31 = [v17 type];
                      int v32 = [v31 isEqualToString:@"00000052-0000-1000-8000-0026BB765291"];

                      if (v32)
                      {
                        [(HAPAccessory *)self setFirmwareVersion:v22];
                      }
                      else
                      {
                        long long v33 = [v17 type];
                        int v34 = [v33 isEqualToString:@"00000220-0000-1000-8000-0026BB765291"];

                        if (v34)
                        {
                          v35 = objc_opt_class();
                          __int16 v36 = [v17 value];
                          v37 = [v35 productDataStringFromData:v36];
                          [(HAPAccessory *)self setProductData:v37];
                        }
                      }
                    }
                  }
                }
              }
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v45 objects:v53 count:16];
        }
        while (v14);
      }

      return 1;
    }
  }
  else
  {
  }
  uint64_t v42 = (void *)MEMORY[0x1D944E080]();
  v43 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
  {
    v44 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v55 = v44;
    _os_log_impl(&dword_1D4758000, v43, OS_LOG_TYPE_ERROR, "%{public}@### Accessory is missing an Accessory Information Service", buf, 0xCu);
  }
  return 0;
}

- (NSArray)services
{
  return self->_services;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HAPAccessory *)a3;
  if (self == v4)
  {
    BOOL v15 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
    id v6 = v5;
    if (!v6) {
      goto LABEL_10;
    }
    uint64_t v7 = [(HAPAccessory *)self instanceID];
    uint64_t v8 = [(HAPAccessory *)v6 instanceID];
    int v9 = [v7 isEqualToNumber:v8];

    if (!v9) {
      goto LABEL_10;
    }
    uint64_t v10 = [(HAPAccessory *)self identifier];
    int v11 = [(HAPAccessory *)v6 identifier];
    int v12 = [v10 isEqualToString:v11];

    if (!v12) {
      goto LABEL_10;
    }
    int64_t v13 = [(HAPAccessory *)self linkType];
    if (v13 == [(HAPAccessory *)v6 linkType])
    {
      int64_t v14 = [(HAPAccessory *)self communicationProtocol];
      BOOL v15 = v14 == [(HAPAccessory *)v6 communicationProtocol];
    }
    else
    {
LABEL_10:
      BOOL v15 = 0;
    }
  }
  return v15;
}

- (NSNumber)instanceID
{
  return self->_instanceID;
}

- (int64_t)linkType
{
  return self->_linkType;
}

- (int64_t)communicationProtocol
{
  return self->_communicationProtocol;
}

- (void)setSerialNumber:(id)a3
{
}

- (void)setName:(id)a3
{
}

- (void)setModel:(id)a3
{
}

- (void)setManufacturer:(id)a3
{
}

- (void)setFirmwareVersion:(id)a3
{
}

- (BOOL)_updateAndValidateServices
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v4 = [(HAPAccessory *)self services];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v45 objects:v54 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v46;
    v39 = self;
    v40 = v4;
    uint64_t v37 = *(void *)v46;
    while (2)
    {
      uint64_t v8 = 0;
      uint64_t v38 = v6;
      do
      {
        if (*(void *)v46 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v45 + 1) + 8 * v8);
        uint64_t v10 = objc_msgSend(v9, "instanceID", v37);
        int v11 = [v3 containsObject:v10];

        if (v11)
        {
          int v32 = (void *)MEMORY[0x1D944E080]();
          long long v33 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            int v34 = HMFGetLogIdentifier();
            v35 = [v9 instanceID];
            __int16 v36 = [v35 stringValue];
            *(_DWORD *)buf = 138543618;
            long long v51 = v34;
            __int16 v52 = 2112;
            v53 = v36;
            _os_log_impl(&dword_1D4758000, v33, OS_LOG_TYPE_ERROR, "%{public}@### Accessory has service with duplicate instance ID '%@'", buf, 0x16u);

            goto LABEL_33;
          }
LABEL_34:

LABEL_23:

          goto LABEL_27;
        }
        int v12 = [v9 instanceID];
        [v3 addObject:v12];

        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        int64_t v13 = [v9 characteristics];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v41 objects:v49 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v42;
          while (2)
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v42 != v16) {
                objc_enumerationMutation(v13);
              }
              long long v18 = *(void **)(*((void *)&v41 + 1) + 8 * i);
              BOOL v19 = [v18 instanceID];
              int v20 = [v3 containsObject:v19];

              if (v20)
              {
                v23 = (void *)MEMORY[0x1D944E080]();
                int v24 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v25 = HMFGetLogIdentifier();
                  int v26 = [v18 instanceID];
                  long long v27 = [v26 stringValue];
                  *(_DWORD *)buf = 138543618;
                  long long v51 = v25;
                  __int16 v52 = 2112;
                  v53 = v27;
                  _os_log_impl(&dword_1D4758000, v24, OS_LOG_TYPE_ERROR, "%{public}@### Accessory has characteristic with duplicate instance ID '%@'", buf, 0x16u);
                }

                uint64_t v4 = v40;
                goto LABEL_23;
              }
              id v21 = [v18 instanceID];
              [v3 addObject:v21];
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v41 objects:v49 count:16];
            if (v15) {
              continue;
            }
            break;
          }
        }

        self = v39;
        if (![(HAPAccessory *)v39 _updateService:v9])
        {
          int v32 = (void *)MEMORY[0x1D944E080]();
          long long v33 = HMFGetOSLogHandle();
          uint64_t v4 = v40;
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            int v34 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            long long v51 = v34;
            _os_log_impl(&dword_1D4758000, v33, OS_LOG_TYPE_ERROR, "%{public}@### Accessory failed _updateService", buf, 0xCu);
LABEL_33:
          }
          goto LABEL_34;
        }
        ++v8;
        uint64_t v7 = v37;
        uint64_t v4 = v40;
      }
      while (v8 != v38);
      uint64_t v6 = [v40 countByEnumeratingWithState:&v45 objects:v54 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  if ([(HAPAccessory *)self updateForAccessoryInformationService])
  {
    BOOL v22 = 1;
  }
  else
  {
    int v28 = (void *)MEMORY[0x1D944E080]();
    long long v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      int v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v51 = v30;
      _os_log_impl(&dword_1D4758000, v29, OS_LOG_TYPE_ERROR, "%{public}@### Accessory failed _updateForAccessoryInformationService", buf, 0xCu);
    }
LABEL_27:
    BOOL v22 = 0;
  }

  return v22;
}

- (BOOL)_updateService:(id)a3
{
  if (a3) {
    [a3 setAccessory:self];
  }
  return 1;
}

- (HAPAccessory)initWithServer:(id)a3 instanceID:(id)a4 parsedServices:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (isValidInstanceID(v9))
  {
    v21.receiver = self;
    v21.super_class = (Class)HAPAccessory;
    int v11 = [(HAPAccessory *)&v21 init];
    self = v11;
    if (v11)
    {
      objc_storeWeak((id *)&v11->_server, v8);
      self->_linkType = [v8 linkType];
      self->_communicationProtocol = [v8 communicationProtocol];
      objc_storeStrong((id *)&self->_instanceID, a4);
      int v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      int64_t v13 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.HAPAccessory", v12);
      workQueue = self->_workQueue;
      self->_workQueue = v13;

      if (v10)
      {
        if ((unint64_t)[v10 count] >= 0x65)
        {
          uint64_t v15 = (void *)MEMORY[0x1D944E080]();
          uint64_t v16 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            long long v17 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v23 = v17;
            long long v18 = "%{public}@### Accessory exceeds maximum number of allowed services";
LABEL_9:
            _os_log_impl(&dword_1D4758000, v16, OS_LOG_TYPE_ERROR, v18, buf, 0xCu);

            goto LABEL_10;
          }
          goto LABEL_10;
        }
        objc_storeStrong((id *)&self->_services, a5);
        if (![(HAPAccessory *)self _validateCharacteristicValues])
        {
          uint64_t v15 = (void *)MEMORY[0x1D944E080]();
          uint64_t v16 = HMFGetOSLogHandle();
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            goto LABEL_10;
          }
          long long v17 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v23 = v17;
          long long v18 = "%{public}@### Accessory failed validateCharacteristicValues";
          goto LABEL_9;
        }
        if (![(HAPAccessory *)self _updateAndValidateServices])
        {
          uint64_t v15 = (void *)MEMORY[0x1D944E080]();
          uint64_t v16 = HMFGetOSLogHandle();
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            goto LABEL_10;
          }
          long long v17 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v23 = v17;
          long long v18 = "%{public}@### Accessory failed _updateAndValidateServices";
          goto LABEL_9;
        }
      }
      self->_consecutiveFailedPingCount = 0;
      self->_primary = 1;
      self->_reachable = 1;
      self->_shouldDisconnectOnIdle = 0;
      if ([v8 wakeNumber]) {
        self->_suspendedState = 3;
      }
    }
    self = self;
    BOOL v19 = self;
    goto LABEL_16;
  }
  uint64_t v15 = (void *)MEMORY[0x1D944E080]();
  uint64_t v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    long long v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v23 = v17;
    long long v18 = "%{public}@### Unable to initialize accessory because of invalid arguments";
    goto LABEL_9;
  }
LABEL_10:

  BOOL v19 = 0;
LABEL_16:

  return v19;
}

- (void)setPrimary:(BOOL)a3
{
  self->_primary = a3;
}

- (BOOL)isReachable
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_reachable;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setServer:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (HMFMACAddress)bluetoothClassicMacAddress
{
  return (HMFMACAddress *)objc_getProperty(self, a2, 112, 1);
}

- (NSString)uniqueIdentifier
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (!self->_uniqueIdentifier)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_server);

    if (WeakRetained)
    {
      id v5 = objc_loadWeakRetained((id *)&self->_server);
      uint64_t v6 = [v5 identifier];
      HAPUniqueIdentifier(v6, self->_instanceID);
      uint64_t v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      uniqueIdentifier = self->_uniqueIdentifier;
      self->_uniqueIdentifier = v7;
    }
    else
    {
      id v9 = (void *)MEMORY[0x1D944E080]();
      HMFGetOSLogHandle();
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v11 = HMFGetLogIdentifier();
        identifier = self->_identifier;
        int v15 = 138543618;
        uint64_t v16 = v11;
        __int16 v17 = 2112;
        long long v18 = identifier;
        _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_ERROR, "%{public}@Cannot create globally unique identifier because there is no server for accessory: %@", (uint8_t *)&v15, 0x16u);
      }
    }
  }
  int64_t v13 = self->_uniqueIdentifier;
  os_unfair_lock_unlock(p_lock);

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3 = [(HAPAccessory *)self identifier];
  uint64_t v4 = [v3 hash];
  id v5 = [(HAPAccessory *)self instanceID];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setServerIdentifier:(id)a3
{
}

- (void)setIdentifier:(id)a3
{
}

- (void)readCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  int v11 = a5;
  id v12 = a6;
  int64_t v13 = [MEMORY[0x1E4F653F0] currentActivity];
  if ([v10 count])
  {
    if (a4 >= 0.0)
    {
      v23 = [(HAPAccessory *)self server];
      if (v23)
      {
        long long v18 = v23;
        [v23 readCharacteristicValues:v10 timeout:v11 completionQueue:v12 completionHandler:a4];
      }
      else
      {
        uint64_t v24 = (void *)MEMORY[0x1D944E080]();
        uint64_t v25 = self;
        int v26 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          long long v27 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          uint64_t v38 = v27;
          __int16 v39 = 2112;
          id v40 = v10;
          _os_log_impl(&dword_1D4758000, v26, OS_LOG_TYPE_ERROR, "%{public}@Unable to read characteristics %@ because there is no server.", buf, 0x16u);
        }
        long long v18 = 0;
        if (v11 && v12)
        {
          v28[0] = MEMORY[0x1E4F143A8];
          v28[1] = 3221225472;
          v28[2] = __83__HAPAccessory_readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_106;
          v28[3] = &unk_1E69F3C68;
          id v29 = v13;
          id v30 = v12;
          dispatch_async(v11, v28);

          long long v18 = 0;
        }
      }
      goto LABEL_20;
    }
    uint64_t v14 = (void *)MEMORY[0x1D944E080]();
    int v15 = self;
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      __int16 v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v38 = v17;
      _os_log_impl(&dword_1D4758000, v16, OS_LOG_TYPE_ERROR, "%{public}@The timeout must not be negative.", buf, 0xCu);
    }
    if (v11 && v12)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __83__HAPAccessory_readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_105;
      block[3] = &unk_1E69F3C68;
      id v32 = v13;
      id v33 = v12;
      dispatch_async(v11, block);

      long long v18 = v32;
LABEL_20:
    }
  }
  else
  {
    uint64_t v19 = (void *)MEMORY[0x1D944E080]();
    int v20 = self;
    objc_super v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      BOOL v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v38 = v22;
      _os_log_impl(&dword_1D4758000, v21, OS_LOG_TYPE_ERROR, "%{public}@One or more target characteristics are required.", buf, 0xCu);
    }
    if (v11 && v12)
    {
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __83__HAPAccessory_readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke;
      v34[3] = &unk_1E69F3C68;
      id v35 = v13;
      id v36 = v12;
      dispatch_async(v11, v34);

      long long v18 = v35;
      goto LABEL_20;
    }
  }
}

- (NSNumber)category
{
  uint64_t v3 = [(HAPAccessory *)self server];
  if (v3 && (uint64_t v4 = (void *)v3, v5 = [(HAPAccessory *)self isPrimary], v4, v5))
  {
    unint64_t v6 = [(HAPAccessory *)self server];
    uint64_t v7 = [v6 category];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return (NSNumber *)v7;
}

- (HAPAccessoryServer)server
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_server);

  return (HAPAccessoryServer *)WeakRetained;
}

+ (id)instanceIDForUniqueIdentifier:(id)a3
{
  return HAPInstanceIDFromUniqueIdentifier(a3);
}

+ (id)serverIdentifierWithUniqueIdentifier:(id)a3
{
  return HAPServerIDFromUniqueIdentifier(a3);
}

- (NSString)model
{
  return self->_model;
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (BOOL)isPrimary
{
  return self->_primary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepInterval, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_productData, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_timeBecameReachable, 0);
  objc_storeStrong((id *)&self->_bluetoothClassicMacAddress, 0);
  objc_storeStrong((id *)&self->_serverIdentifier, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_instanceID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_server);

  objc_destroyWeak((id *)&self->_delegate);
}

- (NSString)productData
{
  return self->_productData;
}

- (void)setShouldDisconnectOnIdle:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_shouldDisconnectOnIdle == v3)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_shouldDisconnectOnIdle = v3;
    os_unfair_lock_unlock(p_lock);
    unint64_t v6 = [(HAPAccessory *)self server];

    if (v6)
    {
      id v12 = [(HAPAccessory *)self server];
      [v12 setShouldDisconnectOnIdle:v3];
    }
    else
    {
      uint64_t v7 = (void *)MEMORY[0x1D944E080]();
      id v8 = self;
      id v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = HMFGetLogIdentifier();
        int v11 = [(HAPAccessory *)v8 shortDescription];
        *(_DWORD *)buf = 138543618;
        uint64_t v14 = v10;
        __int16 v15 = 2112;
        uint64_t v16 = v11;
        _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to set shouldDisconnectOnIdle due to no server instance for %@", buf, 0x16u);
      }
    }
  }
}

- (int64_t)linkLayerType
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  int64_t linkLayerType = self->_linkLayerType;
  os_unfair_lock_unlock(p_lock);
  return linkLayerType;
}

- (void)setSleepInterval:(id)a3
{
}

- (NSNumber)sleepInterval
{
  return self->_sleepInterval;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 176, 1);
}

- (void)setProductData:(id)a3
{
}

- (NSString)firmwareVersion
{
  return self->_firmwareVersion;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setTimeBecameReachable:(id)a3
{
}

- (NSDate)timeBecameReachable
{
  return self->_timeBecameReachable;
}

- (void)setBluetoothClassicMacAddress:(id)a3
{
}

- (void)setServices:(id)a3
{
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (void)setInstanceID:(id)a3
{
}

- (HAPAccessoryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HAPAccessoryDelegate *)WeakRetained;
}

- (BOOL)mergeObject:(id)a3
{
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v5 = v4;
  }
  else {
    BOOL v5 = 0;
  }
  id v6 = v5;

  if (!v6)
  {
LABEL_28:
    char v39 = 0;
    goto LABEL_57;
  }
  if (![(HAPAccessory *)self shouldMergeObject:v6])
  {
    id v35 = (void *)MEMORY[0x1D944E080]();
    id v36 = self;
    uint64_t v37 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      uint64_t v38 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v110 = v38;
      __int16 v111 = 2112;
      id v112 = v6;
      _os_log_impl(&dword_1D4758000, v37, OS_LOG_TYPE_INFO, "%{public}@Not merging with accessory: %@", buf, 0x16u);
    }
    goto LABEL_28;
  }
  v85 = v6;
  uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
  id v8 = [(HAPAccessory *)self services];
  id v9 = [v7 setWithArray:v8];

  id v10 = (void *)MEMORY[0x1E4F1CAD0];
  id v86 = v4;
  int v11 = [v4 services];
  uint64_t v12 = [v10 setWithArray:v11];

  v87 = v9;
  int64_t v13 = (void *)[v9 mutableCopy];
  v88 = (void *)v12;
  [v13 minusSet:v12];
  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  obuint64_t j = v13;
  uint64_t v14 = [obj countByEnumeratingWithState:&v102 objects:v108 count:16];
  BOOL v89 = v14 != 0;
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v103;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v103 != v16) {
          objc_enumerationMutation(obj);
        }
        long long v18 = *(void **)(*((void *)&v102 + 1) + 8 * i);
        uint64_t v19 = (void *)MEMORY[0x1D944E080]();
        int v20 = self;
        objc_super v21 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          BOOL v22 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v110 = v22;
          __int16 v111 = 2112;
          id v112 = v18;
          _os_log_impl(&dword_1D4758000, v21, OS_LOG_TYPE_INFO, "%{public}@Removed service: %@", buf, 0x16u);
        }
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v102 objects:v108 count:16];
    }
    while (v15);
  }

  v23 = v88;
  uint64_t v24 = (void *)[v88 mutableCopy];
  [v24 minusSet:v87];
  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  id v92 = v24;
  uint64_t v25 = [v92 countByEnumeratingWithState:&v98 objects:v107 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v99;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v99 != v27) {
          objc_enumerationMutation(v92);
        }
        id v29 = *(void **)(*((void *)&v98 + 1) + 8 * j);
        id v30 = (void *)MEMORY[0x1D944E080]();
        long long v31 = self;
        id v32 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          id v33 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v110 = v33;
          __int16 v111 = 2112;
          id v112 = v29;
          _os_log_impl(&dword_1D4758000, v32, OS_LOG_TYPE_INFO, "%{public}@Added service: %@", buf, 0x16u);
        }
        [v29 setAccessory:v31];
      }
      uint64_t v26 = [v92 countByEnumeratingWithState:&v98 objects:v107 count:16];
    }
    while (v26);
    char v34 = 1;
    v23 = v88;
  }
  else
  {
    char v34 = v89;
  }
  char v90 = v34;

  id v40 = (void *)[v87 mutableCopy];
  [v40 minusSet:obj];
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id v91 = v40;
  uint64_t v41 = [v91 countByEnumeratingWithState:&v94 objects:v106 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v95;
    do
    {
      for (uint64_t k = 0; k != v42; ++k)
      {
        if (*(void *)v95 != v43) {
          objc_enumerationMutation(v91);
        }
        long long v45 = *(void **)(*((void *)&v94 + 1) + 8 * k);
        long long v46 = (void *)MEMORY[0x1D944E080]();
        long long v47 = self;
        long long v48 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
        {
          long long v49 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v110 = v49;
          __int16 v111 = 2112;
          id v112 = v45;
          _os_log_impl(&dword_1D4758000, v48, OS_LOG_TYPE_DEBUG, "%{public}@Merging existing service: %@", buf, 0x16u);
        }
        long long v50 = [v23 member:v45];
        if (v50 && [v45 mergeObject:v50])
        {
          long long v51 = (void *)MEMORY[0x1D944E080]();
          __int16 v52 = v47;
          v53 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
          {
            v54 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v110 = v54;
            __int16 v111 = 2112;
            id v112 = v45;
            _os_log_impl(&dword_1D4758000, v53, OS_LOG_TYPE_INFO, "%{public}@Updated service: %@", buf, 0x16u);

            v23 = v88;
          }

          char v90 = 1;
        }
      }
      uint64_t v42 = [v91 countByEnumeratingWithState:&v94 objects:v106 count:16];
    }
    while (v42);
  }

  uint64_t v55 = (void *)MEMORY[0x1E4F1CA48];
  v56 = [v91 allObjects];
  uint64_t v57 = [v55 arrayWithArray:v56];

  v58 = [v92 allObjects];
  [v57 addObjectsFromArray:v58];

  v59 = (void *)[v57 copy];
  [(HAPAccessory *)self setServices:v59];

  v60 = [(HAPAccessory *)self name];
  id v6 = v85;
  v61 = [v85 name];
  char v62 = [v60 isEqualToString:v61];

  char v39 = v90;
  if ((v62 & 1) == 0)
  {
    v63 = [v85 name];
    [(HAPAccessory *)self setName:v63];

    char v39 = 1;
  }
  v64 = [(HAPAccessory *)self manufacturer];
  v65 = [v85 manufacturer];
  char v66 = [v64 isEqualToString:v65];

  id v4 = v86;
  if ((v66 & 1) == 0)
  {
    v67 = [v85 manufacturer];
    [(HAPAccessory *)self setManufacturer:v67];

    char v39 = 1;
  }
  v68 = [(HAPAccessory *)self model];
  v69 = [v85 model];
  char v70 = [v68 isEqualToString:v69];

  if ((v70 & 1) == 0)
  {
    v71 = [v85 model];
    [(HAPAccessory *)self setModel:v71];

    char v39 = 1;
  }
  v72 = [(HAPAccessory *)self serialNumber];
  v73 = [v85 serialNumber];
  char v74 = [v72 isEqualToString:v73];

  if ((v74 & 1) == 0)
  {
    v75 = [v85 serialNumber];
    [(HAPAccessory *)self setSerialNumber:v75];

    char v39 = 1;
  }
  v76 = [(HAPAccessory *)self firmwareVersion];
  v77 = [v85 firmwareVersion];
  char v78 = [v76 isEqualToString:v77];

  if ((v78 & 1) == 0)
  {
    v79 = [v85 firmwareVersion];
    [(HAPAccessory *)self setFirmwareVersion:v79];

    char v39 = 1;
  }
  v80 = [(HAPAccessory *)self productData];
  v81 = [v85 productData];
  char v82 = [v80 isEqualToString:v81];

  if ((v82 & 1) == 0)
  {
    v83 = [v85 productData];
    [(HAPAccessory *)self setProductData:v83];

    char v39 = 1;
  }

LABEL_57:
  return v39 & 1;
}

- (BOOL)shouldMergeObject:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(HAPAccessory *)self isEqual:v4])
  {
    BOOL v5 = (void *)MEMORY[0x1E4F1CAD0];
    id v6 = [(HAPAccessory *)self services];
    uint64_t v7 = [v5 setWithArray:v6];

    id v8 = (void *)MEMORY[0x1E4F1CAD0];
    id v29 = v4;
    id v9 = [v4 services];
    id v10 = [v8 setWithArray:v9];

    int v28 = v7;
    int v11 = (void *)[v7 mutableCopy];
    [v11 intersectSet:v10];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v41 count:16];
    if (!v13)
    {
      char v16 = 1;
      goto LABEL_18;
    }
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v32;
    char v16 = 1;
    while (1)
    {
      uint64_t v17 = 0;
      uint64_t v30 = v14;
      do
      {
        if (*(void *)v32 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v18 = *(void **)(*((void *)&v31 + 1) + 8 * v17);
        uint64_t v19 = [v10 member:v18];
        if (v19)
        {
          if ([v18 shouldMergeObject:v19]) {
            goto LABEL_13;
          }
          int v20 = (void *)MEMORY[0x1D944E080]();
          objc_super v21 = self;
          BOOL v22 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            uint64_t v23 = v15;
            uint64_t v24 = v10;
            v26 = uint64_t v25 = self;
            *(_DWORD *)buf = 138543874;
            id v36 = v26;
            __int16 v37 = 2112;
            uint64_t v38 = v19;
            __int16 v39 = 2112;
            id v40 = v12;
            _os_log_impl(&dword_1D4758000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to merge service, %@, with existing service: %@", buf, 0x20u);

            self = v25;
            id v10 = v24;
            uint64_t v15 = v23;
            uint64_t v14 = v30;
          }
        }
        char v16 = 0;
LABEL_13:

        ++v17;
      }
      while (v14 != v17);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v31 objects:v41 count:16];
      if (!v14)
      {
LABEL_18:

        id v4 = v29;
        goto LABEL_19;
      }
    }
  }
  char v16 = 0;
LABEL_19:

  return v16 & 1;
}

- (id)characteristicWithInstanceID:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  BOOL v5 = [(HAPAccessory *)self services];
  uint64_t v20 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v20)
  {
    uint64_t v6 = *(void *)v26;
    uint64_t v19 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(v5);
        }
        id v8 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v9 = objc_msgSend(v8, "characteristics", v19);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v22;
          while (2)
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v22 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void **)(*((void *)&v21 + 1) + 8 * j);
              uint64_t v15 = [v14 instanceID];
              char v16 = [v4 isEqualToNumber:v15];

              if (v16)
              {
                id v17 = v14;

                goto LABEL_19;
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }

        uint64_t v6 = v19;
      }
      id v17 = 0;
      uint64_t v20 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v20);
  }
  else
  {
    id v17 = 0;
  }
LABEL_19:

  return v17;
}

- (id)characteristicOfType:(id)a3 serviceType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  id v9 = 0;
  if (!v6 || !v7) {
    goto LABEL_9;
  }
  uint64_t v10 = [(HAPAccessory *)self servicesOfType:v7];
  uint64_t v11 = [v10 firstObject];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = 0;
    goto LABEL_7;
  }
  uint64_t v12 = [(HAPAccessory *)self servicesOfType:v8];
  uint64_t v13 = [v12 firstObject];

  if (v13)
  {
    uint64_t v11 = [v13 characteristicsOfType:v6];
    id v9 = [v11 firstObject];
    uint64_t v10 = v13;
LABEL_7:

    goto LABEL_9;
  }
  id v9 = 0;
LABEL_9:
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v14 = v9;
  }
  else {
    uint64_t v14 = 0;
  }
  id v15 = v14;

  return v15;
}

- (id)characteristicsOfType:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [(HAPAccessory *)self services];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) characteristicsOfType:v4];
        [v5 addObjectsFromArray:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)serviceWithInstanceID:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v5 = [(HAPAccessory *)self services];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v9 instanceID];
        char v11 = [v4 isEqualToNumber:v10];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)invalidateWithError:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = (void *)MEMORY[0x1D944E080]();
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    uint64_t v9 = [(HAPAccessory *)v6 shortDescription];
    int v10 = 138543618;
    char v11 = v8;
    __int16 v12 = 2112;
    long long v13 = v9;
    _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Invalidating and updating connection state for HAP Accessory: %@", (uint8_t *)&v10, 0x16u);
  }
}

- (void)writeCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  char v11 = a5;
  id v12 = a6;
  long long v13 = [MEMORY[0x1E4F653F0] currentActivity];
  if ([v10 count])
  {
    if (a4 >= 0.0)
    {
      long long v23 = [(HAPAccessory *)self server];
      if (v23)
      {
        uint64_t v18 = v23;
        [v23 writeCharacteristicValues:v10 timeout:v11 completionQueue:v12 completionHandler:a4];
      }
      else
      {
        long long v24 = (void *)MEMORY[0x1D944E080]();
        long long v25 = self;
        long long v26 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          long long v27 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          uint64_t v38 = v27;
          __int16 v39 = 2112;
          id v40 = v10;
          _os_log_impl(&dword_1D4758000, v26, OS_LOG_TYPE_ERROR, "%{public}@Unable to write characteristics %@ because there is no server.", buf, 0x16u);
        }
        uint64_t v18 = 0;
        if (v11 && v12)
        {
          v28[0] = MEMORY[0x1E4F143A8];
          v28[1] = 3221225472;
          v28[2] = __84__HAPAccessory_writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_122;
          v28[3] = &unk_1E69F3C68;
          id v29 = v13;
          id v30 = v12;
          dispatch_async(v11, v28);

          uint64_t v18 = 0;
        }
      }
      goto LABEL_20;
    }
    uint64_t v14 = (void *)MEMORY[0x1D944E080]();
    long long v15 = self;
    long long v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v38 = v17;
      _os_log_impl(&dword_1D4758000, v16, OS_LOG_TYPE_ERROR, "%{public}@The timeout must not be negative.", buf, 0xCu);
    }
    if (v11 && v12)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __84__HAPAccessory_writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_121;
      block[3] = &unk_1E69F3C68;
      id v32 = v13;
      id v33 = v12;
      dispatch_async(v11, block);

      uint64_t v18 = v32;
LABEL_20:
    }
  }
  else
  {
    uint64_t v19 = (void *)MEMORY[0x1D944E080]();
    uint64_t v20 = self;
    long long v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      long long v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v38 = v22;
      _os_log_impl(&dword_1D4758000, v21, OS_LOG_TYPE_ERROR, "%{public}@One or more target characteristic writes are required.", buf, 0xCu);
    }
    if (v11 && v12)
    {
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __84__HAPAccessory_writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke;
      v34[3] = &unk_1E69F3C68;
      id v35 = v13;
      id v36 = v12;
      dispatch_async(v11, v34);

      uint64_t v18 = v35;
      goto LABEL_20;
    }
  }
}

void __84__HAPAccessory_writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] hapErrorWithCode:9 description:@"Invalid parameter." reason:@"One or more target characteristic writes are required." suggestion:0 underlyingError:0];
  [v2 domain];

  [v2 code];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __84__HAPAccessory_writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_121(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] hapErrorWithCode:9 description:@"Invalid parameter." reason:@"The timeout must not be negative." suggestion:0 underlyingError:0];
  [v2 domain];

  [v2 code];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __84__HAPAccessory_writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_122(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] hapErrorWithCode:13 description:@"Write failed." reason:@"There is no server present for the accessory." suggestion:0 underlyingError:0];
  [v2 domain];

  [v2 code];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)writeCharacteristicValue:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  char v11 = a5;
  id v12 = a6;
  if (v10)
  {
    if (a4 >= 0.0)
    {
      long long v22 = [(HAPAccessory *)self server];
      if (v22)
      {
        id v43 = v10;
        long long v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __83__HAPAccessory_writeCharacteristicValue_timeout_completionQueue_completionHandler___block_invoke_2;
        v31[3] = &unk_1E69F36F0;
        long long v24 = &v33;
        id v33 = v12;
        long long v25 = &v32;
        id v32 = v10;
        [v22 writeCharacteristicValues:v23 timeout:v11 completionQueue:v31 completionHandler:a4];
      }
      else
      {
        long long v26 = (void *)MEMORY[0x1D944E080]();
        long long v27 = self;
        long long v28 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          id v29 = HMFGetLogIdentifier();
          id v30 = [v10 characteristic];
          *(_DWORD *)buf = 138543618;
          long long v45 = v29;
          __int16 v46 = 2112;
          long long v47 = v30;
          _os_log_impl(&dword_1D4758000, v28, OS_LOG_TYPE_ERROR, "%{public}@Unable to write value for characteristic %@ because there is no server.", buf, 0x16u);
        }
        id v17 = 0;
        if (!v11 || !v12) {
          goto LABEL_21;
        }
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __83__HAPAccessory_writeCharacteristicValue_timeout_completionQueue_completionHandler___block_invoke_111;
        v34[3] = &unk_1E69F3C68;
        long long v24 = &v36;
        id v36 = v12;
        long long v25 = &v35;
        id v35 = v10;
        dispatch_async(v11, v34);
      }

      id v17 = v22;
LABEL_21:

      goto LABEL_22;
    }
    long long v13 = (void *)MEMORY[0x1D944E080]();
    uint64_t v14 = self;
    long long v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      long long v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v45 = v16;
      _os_log_impl(&dword_1D4758000, v15, OS_LOG_TYPE_ERROR, "%{public}@The timeout must not be negative.", buf, 0xCu);
    }
    if (v11 && v12)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __83__HAPAccessory_writeCharacteristicValue_timeout_completionQueue_completionHandler___block_invoke_110;
      block[3] = &unk_1E69F3C68;
      id v39 = v12;
      id v38 = v10;
      dispatch_async(v11, block);

      id v17 = v39;
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v18 = (void *)MEMORY[0x1D944E080]();
    uint64_t v19 = self;
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      long long v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v45 = v21;
      _os_log_impl(&dword_1D4758000, v20, OS_LOG_TYPE_ERROR, "%{public}@The target characteristic write request is a required parameter", buf, 0xCu);
    }
    if (v11 && v12)
    {
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __83__HAPAccessory_writeCharacteristicValue_timeout_completionQueue_completionHandler___block_invoke;
      v40[3] = &unk_1E69F3C68;
      id v41 = 0;
      id v42 = v12;
      dispatch_async(v11, v40);

      id v17 = v42;
      goto LABEL_21;
    }
  }
LABEL_22:
}

void __83__HAPAccessory_writeCharacteristicValue_timeout_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  id v4 = [MEMORY[0x1E4F28C58] hapErrorWithCode:9 description:@"Invalid parameter." reason:@"Characteristic write request is a required parameter." suggestion:0 underlyingError:0];
  uint64_t v2 = *(void *)(a1 + 40);
  BOOL v3 = [*(id *)(a1 + 32) characteristic];
  (*(void (**)(uint64_t, void *, id))(v2 + 16))(v2, v3, v4);
}

void __83__HAPAccessory_writeCharacteristicValue_timeout_completionQueue_completionHandler___block_invoke_110(uint64_t a1)
{
  id v4 = [MEMORY[0x1E4F28C58] hapErrorWithCode:9 description:@"Invalid parameter." reason:@"The timeout must not be negative." suggestion:0 underlyingError:0];
  uint64_t v2 = *(void *)(a1 + 40);
  BOOL v3 = [*(id *)(a1 + 32) characteristic];
  (*(void (**)(uint64_t, void *, id))(v2 + 16))(v2, v3, v4);
}

void __83__HAPAccessory_writeCharacteristicValue_timeout_completionQueue_completionHandler___block_invoke_111(uint64_t a1)
{
  id v4 = [MEMORY[0x1E4F28C58] hapErrorWithCode:13 description:@"Write failed." reason:@"There is no server present for the accessory." suggestion:0 underlyingError:0];
  uint64_t v2 = *(void *)(a1 + 40);
  BOOL v3 = [*(id *)(a1 + 32) characteristic];
  (*(void (**)(uint64_t, void *, id))(v2 + 16))(v2, v3, v4);
}

void __83__HAPAccessory_writeCharacteristicValue_timeout_completionQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (*(void *)(a1 + 40))
  {
    id v14 = v5;
    id v6 = [a2 firstObject];
    uint64_t v7 = [v6 characteristic];
    uint64_t v8 = [*(id *)(a1 + 32) characteristic];
    if ([v7 isEqual:v8])
    {
      uint64_t v9 = [v6 error];

      if (v9)
      {
        id v10 = [v6 error];
LABEL_7:
        char v11 = v10;
        uint64_t v12 = *(void *)(a1 + 40);
        long long v13 = [*(id *)(a1 + 32) characteristic];
        (*(void (**)(uint64_t, void *, void *))(v12 + 16))(v12, v13, v11);

        id v5 = v14;
        goto LABEL_8;
      }
    }
    else
    {
    }
    id v10 = v14;
    goto LABEL_7;
  }
LABEL_8:
}

void __83__HAPAccessory_readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] hapErrorWithCode:9 description:@"Invalid parameter." reason:@"One or more target characteristics are required." suggestion:0 underlyingError:0];
  [v2 domain];

  [v2 code];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __83__HAPAccessory_readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_105(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] hapErrorWithCode:9 description:@"Invalid parameter." reason:@"The timeout must not be negative." suggestion:0 underlyingError:0];
  [v2 domain];

  [v2 code];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __83__HAPAccessory_readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_106(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] hapErrorWithCode:14 description:@"Read failed." reason:@"There is no server present for the accessory." suggestion:0 underlyingError:0];
  [v2 domain];

  [v2 code];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)readValueForCharacteristic:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  char v11 = a5;
  id v12 = a6;
  if (v10)
  {
    if (a4 >= 0.0)
    {
      long long v22 = [(HAPAccessory *)self server];
      if (v22)
      {
        id v42 = v10;
        long long v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __85__HAPAccessory_readValueForCharacteristic_timeout_completionQueue_completionHandler___block_invoke_2;
        v30[3] = &unk_1E69F36F0;
        long long v24 = &v32;
        id v32 = v12;
        long long v25 = &v31;
        id v31 = v10;
        [v22 readCharacteristicValues:v23 timeout:v11 completionQueue:v30 completionHandler:a4];
      }
      else
      {
        long long v26 = (void *)MEMORY[0x1D944E080]();
        long long v27 = self;
        long long v28 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          id v29 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          long long v44 = v29;
          __int16 v45 = 2112;
          id v46 = v10;
          _os_log_impl(&dword_1D4758000, v28, OS_LOG_TYPE_ERROR, "%{public}@Unable to read value for characteristic %@ because there is no server.", buf, 0x16u);
        }
        id v17 = 0;
        if (!v11 || !v12) {
          goto LABEL_21;
        }
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __85__HAPAccessory_readValueForCharacteristic_timeout_completionQueue_completionHandler___block_invoke_88;
        v33[3] = &unk_1E69F3C68;
        long long v24 = &v35;
        id v35 = v12;
        long long v25 = &v34;
        id v34 = v10;
        dispatch_async(v11, v33);
      }

      id v17 = v22;
LABEL_21:

      goto LABEL_22;
    }
    long long v13 = (void *)MEMORY[0x1D944E080]();
    id v14 = self;
    long long v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      long long v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v44 = v16;
      _os_log_impl(&dword_1D4758000, v15, OS_LOG_TYPE_ERROR, "%{public}@The timeout must not be negative.", buf, 0xCu);
    }
    if (v11 && v12)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __85__HAPAccessory_readValueForCharacteristic_timeout_completionQueue_completionHandler___block_invoke_84;
      block[3] = &unk_1E69F3C68;
      id v38 = v12;
      id v37 = v10;
      dispatch_async(v11, block);

      id v17 = v38;
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v18 = (void *)MEMORY[0x1D944E080]();
    uint64_t v19 = self;
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      long long v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v44 = v21;
      _os_log_impl(&dword_1D4758000, v20, OS_LOG_TYPE_ERROR, "%{public}@The target characteristic is a required parameter", buf, 0xCu);
    }
    if (v11 && v12)
    {
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __85__HAPAccessory_readValueForCharacteristic_timeout_completionQueue_completionHandler___block_invoke;
      v39[3] = &unk_1E69F3C68;
      id v40 = 0;
      id v41 = v12;
      dispatch_async(v11, v39);

      id v17 = v41;
      goto LABEL_21;
    }
  }
LABEL_22:
}

void __85__HAPAccessory_readValueForCharacteristic_timeout_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] hapErrorWithCode:9 description:@"Invalid parameter." reason:@"Characteristic is a required parameter." suggestion:0 underlyingError:0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __85__HAPAccessory_readValueForCharacteristic_timeout_completionQueue_completionHandler___block_invoke_84(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] hapErrorWithCode:9 description:@"Invalid parameter." reason:@"The timeout must not be negative." suggestion:0 underlyingError:0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __85__HAPAccessory_readValueForCharacteristic_timeout_completionQueue_completionHandler___block_invoke_88(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] hapErrorWithCode:14 description:@"Read failed." reason:@"There is no server present for the accessory." suggestion:0 underlyingError:0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __85__HAPAccessory_readValueForCharacteristic_timeout_completionQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (*(void *)(a1 + 40))
  {
    id v11 = v5;
    id v6 = [a2 firstObject];
    uint64_t v7 = [v6 characteristic];
    if ([v7 isEqual:*(void *)(a1 + 32)])
    {
      uint64_t v8 = [v6 error];

      if (v8)
      {
        id v9 = [v6 error];
LABEL_7:
        id v10 = v9;
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

        id v5 = v11;
        goto LABEL_8;
      }
    }
    else
    {
    }
    id v9 = v11;
    goto LABEL_7;
  }
LABEL_8:
}

- (void)setConsecutiveFailedPingCount:(int)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_consecutiveFailedPingCount = a3;

  os_unfair_lock_unlock(p_lock);
}

- (int)consecutiveFailedPingCount
{
  id v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LODWORD(v2) = v2->_consecutiveFailedPingCount;
  os_unfair_lock_unlock(p_lock);
  return (int)v2;
}

- (BOOL)shouldDisconnectOnIdle
{
  id v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_shouldDisconnectOnIdle;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSuspendedState:(unint64_t)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_suspendedState = a3;

  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)suspendedState
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t suspendedState = self->_suspendedState;
  os_unfair_lock_unlock(p_lock);
  return suspendedState;
}

- (void)setLinkLayerType:(int64_t)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_int64_t linkLayerType = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)setReachable:(BOOL)a3
{
  BOOL v3 = a3;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_reachable == v3)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_reachable = v3;
    os_unfair_lock_unlock(p_lock);
    id v6 = [(HAPAccessory *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = [(HAPAccessory *)self delegate];
      [v8 accessory:self didUpdateReachabilityState:v3];
    }
  }
}

- (BOOL)isPaired
{
  id v2 = [(HAPAccessory *)self server];
  char v3 = [v2 isPaired];

  return v3;
}

- (NSString)description
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v5 = [(HAPAccessory *)self instanceID];
  [v4 appendFormat:@"Instance ID: %@    ", v5];

  BOOL v6 = HAPIsInternalBuild();
  if (v6)
  {
    id v2 = [(HAPAccessory *)self server];
    char v7 = [v2 name];
  }
  else
  {
    char v7 = @"<private>";
  }
  id v8 = [(HAPAccessory *)self server];
  id v9 = [v8 identifier];
  [v4 appendFormat:@"Server: '%@' (%@)    ", v7, v9];

  if (v6)
  {
  }
  if ([(HAPAccessory *)self isPrimary])
  {
    id v10 = [(HAPAccessory *)self category];
    [v4 appendFormat:@"Category: %@    ", v10];
  }
  id v11 = [(HAPAccessory *)self name];

  if (v11)
  {
    if (HAPIsInternalBuild())
    {
      id v12 = [(HAPAccessory *)self name];
      [v4 appendFormat:@"Name: %@    ", v12];
    }
    else
    {
      [v4 appendFormat:@"Name: %@    ", @"<private>"];
    }
  }
  long long v13 = HAPAccessorySuspendedStateDescription([(HAPAccessory *)self suspendedState]);
  [v4 appendFormat:@"Suspended State: %@    ", v13];

  id v14 = [(HAPAccessory *)self model];
  if (v14
    || ([(HAPAccessory *)self manufacturer], (id v14 = objc_claimAutoreleasedReturnValue()) != 0))
  {
  }
  else
  {
    long long v23 = [(HAPAccessory *)self serialNumber];

    if (!v23) {
      goto LABEL_22;
    }
  }
  long long v15 = [(HAPAccessory *)self model];

  if (v15)
  {
    long long v16 = [(HAPAccessory *)self model];
    [v4 appendFormat:@"Model: %@    ", v16];
  }
  id v17 = [(HAPAccessory *)self manufacturer];

  if (v17)
  {
    uint64_t v18 = [(HAPAccessory *)self manufacturer];
    [v4 appendFormat:@"Manufacturer: %@    ", v18];
  }
  uint64_t v19 = [(HAPAccessory *)self serialNumber];

  if (v19)
  {
    uint64_t v20 = [(HAPAccessory *)self serialNumber];
    [v4 appendFormat:@"Serial Number: %@    ", v20];
  }
  [v4 appendFormat:@"\n"];
LABEL_22:
  long long v21 = [(HAPAccessory *)self services];
  [v4 appendFormat:@"Services: %@    ", v21];

  return (NSString *)v4;
}

- (HAPAccessory)initWithServer:(id)a3 instanceID:(id)a4
{
  return [(HAPAccessory *)self initWithServer:a3 instanceID:a4 parsedServices:0];
}

- (HAPAccessory)init
{
  id v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  BOOL v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t47 != -1) {
    dispatch_once(&logCategory__hmf_once_t47, &__block_literal_global_19569);
  }
  id v2 = (void *)logCategory__hmf_once_v48;

  return v2;
}

uint64_t __27__HAPAccessory_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v48;
  logCategory__hmf_once_uint64_t v48 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (BOOL)isAccessoryPrimaryWithUniqueIdentifier:(id)a3
{
  uint64_t v3 = [a3 componentsSeparatedByString:@"+"];
  if ([v3 count] == 2)
  {
    id v4 = [v3 objectAtIndexedSubscript:1];
    char v5 = [v4 isEqualToString:@"1"];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (id)productDataStringFromData:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  BOOL v6 = objc_msgSend(v5, "hmf_hexadecimalStringWithOptions:", 2);

  return v6;
}

+ (BOOL)isAccessoryPairedWithIdentifier:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = +[HAPSystemKeychainStore systemStore];
    id v15 = 0;
    id v16 = 0;
    [v4 getControllerPublicKey:&v16 secretKey:0 username:0 allowCreation:0 forAccessory:v3 error:&v15];
    id v5 = v16;
    id v6 = v15;

    BOOL v7 = 0;
    if (!v6 && v5)
    {
      char v14 = 0;
      id v8 = +[HAPSystemKeychainStore systemStore];
      id v13 = 0;
      id v9 = [v8 readPublicKeyForAccessoryName:v3 registeredWithHomeKit:&v14 error:&v13];
      id v6 = v13;

      if (v6) {
        BOOL v10 = 1;
      }
      else {
        BOOL v10 = v9 == 0;
      }
      BOOL v7 = !v10 && v14 != 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

@end