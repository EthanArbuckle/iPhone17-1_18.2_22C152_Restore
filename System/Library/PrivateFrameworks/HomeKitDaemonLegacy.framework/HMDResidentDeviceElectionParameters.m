@interface HMDResidentDeviceElectionParameters
- (BOOL)isEqual:(id)a3;
- (HMDHomeKitVersion)version;
- (HMDResidentDevice)resident;
- (HMDResidentDeviceElectionParameters)initWithResident:(id)a3 dictionaryRepresentation:(id)a4;
- (HMDResidentDeviceElectionParameters)initWithResident:(id)a3 enabled:(id)a4 location:(int64_t)a5 accessories:(id)a6;
- (HMFBoolean)isEnabled;
- (HMFProductInfo)productInfo;
- (NSDictionary)dictionaryRepresentation;
- (NSSet)accessories;
- (id)attributeDescriptions;
- (int64_t)compare:(id)a3;
- (int64_t)compare:(id)a3 outCriteria:(unint64_t *)a4;
- (int64_t)location;
- (unint64_t)hash;
@end

@implementation HMDResidentDeviceElectionParameters

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_productInfo, 0);
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_enabled, 0);
  objc_storeStrong((id *)&self->_resident, 0);
}

- (HMDHomeKitVersion)version
{
  return (HMDHomeKitVersion *)objc_getProperty(self, a2, 48, 1);
}

- (HMFProductInfo)productInfo
{
  return (HMFProductInfo *)objc_getProperty(self, a2, 40, 1);
}

- (NSSet)accessories
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (int64_t)location
{
  return self->_location;
}

- (HMFBoolean)isEnabled
{
  return (HMFBoolean *)objc_getProperty(self, a2, 16, 1);
}

- (HMDResidentDevice)resident
{
  return (HMDResidentDevice *)objc_getProperty(self, a2, 8, 1);
}

- (id)attributeDescriptions
{
  v22[5] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v21 = [(HMDResidentDeviceElectionParameters *)self resident];
  v20 = [v21 shortDescription];
  v19 = (void *)[v3 initWithName:@"Resident" value:v20];
  v22[0] = v19;
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  v5 = [(HMDResidentDeviceElectionParameters *)self version];
  v6 = [v5 versionString];
  v7 = (void *)[v4 initWithName:@"Version" value:v6];
  v22[1] = v7;
  id v8 = objc_alloc(MEMORY[0x1E4F653F8]);
  v9 = [(HMDResidentDeviceElectionParameters *)self isEnabled];
  v10 = (void *)[v8 initWithName:@"Enabled" value:v9];
  v22[2] = v10;
  id v11 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDResidentDeviceElectionParameters *)self location];
  v12 = HMStringFromHomeLocation();
  v13 = (void *)[v11 initWithName:@"Location" value:v12];
  v22[3] = v13;
  id v14 = objc_alloc(MEMORY[0x1E4F653F8]);
  v15 = [(HMDResidentDeviceElectionParameters *)self accessories];
  v16 = (void *)[v14 initWithName:@"Accessories" value:v15];
  v22[4] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:5];

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  if (v6) {
    BOOL v7 = [(HMDResidentDeviceElectionParameters *)self compare:v6] == 0;
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(HMDResidentDeviceElectionParameters *)self resident];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (int64_t)compare:(id)a3 outCriteria:(unint64_t *)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = (HMDResidentDeviceElectionParameters *)a3;
  if (self != v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v7 = v6;
    }
    else {
      BOOL v7 = 0;
    }
    id v8 = v7;
    if (!v8) {
      goto LABEL_35;
    }
    if (a4) {
      *a4 = 1;
    }
    v9 = [(HMDResidentDeviceElectionParameters *)self isEnabled];
    v10 = [(HMDResidentDeviceElectionParameters *)v8 isEnabled];
    if ((HMFEqualObjects() & 1) == 0)
    {
      if (v9 && v10)
      {
LABEL_33:
        int64_t v21 = [v9 compare:v10];
LABEL_60:

        goto LABEL_61;
      }
      if ([v9 BOOLValue]) {
        goto LABEL_59;
      }
      if ([v10 BOOLValue])
      {
LABEL_40:
        int64_t v21 = -1;
        goto LABEL_60;
      }
    }

    if (a4) {
      *a4 = 3;
    }
    int64_t v11 = [(HMDResidentDeviceElectionParameters *)self location];
    uint64_t v12 = [(HMDResidentDeviceElectionParameters *)v8 location];
    if (v11 == v12)
    {
LABEL_12:
      if (a4) {
        *a4 = 4;
      }
      v9 = [(HMDResidentDeviceElectionParameters *)self productInfo];
      v10 = [(HMDResidentDeviceElectionParameters *)v8 productInfo];
      uint64_t v13 = [v9 productClass];
      if (v13 != [v10 productClass])
      {
        if ([v9 productClass] == 3) {
          goto LABEL_40;
        }
        if ([v10 productClass] == 3) {
          goto LABEL_59;
        }
      }

      if (a4) {
        *a4 = 6;
      }
      v9 = [(HMDResidentDeviceElectionParameters *)self version];
      v10 = [(HMDResidentDeviceElectionParameters *)v8 version];
      uint64_t v14 = [v9 majorVersion];
      if (v14 == [v10 majorVersion] || !v9)
      {
        if (a4) {
          *a4 = 9;
        }
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        v15 = [(HMDResidentDeviceElectionParameters *)self accessories];
        uint64_t v16 = [v15 countByEnumeratingWithState:&v35 objects:v40 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          unint64_t v18 = 0;
          uint64_t v19 = *(void *)v36;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v36 != v19) {
                objc_enumerationMutation(v15);
              }
              v18 += [*(id *)(*((void *)&v35 + 1) + 8 * i) isReachable];
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v35 objects:v40 count:16];
          }
          while (v17);
        }
        else
        {
          unint64_t v18 = 0;
        }
        v30 = v10;

        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        v22 = [(HMDResidentDeviceElectionParameters *)v8 accessories];
        uint64_t v23 = [v22 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          unint64_t v25 = 0;
          uint64_t v26 = *(void *)v32;
          do
          {
            for (uint64_t j = 0; j != v24; ++j)
            {
              if (*(void *)v32 != v26) {
                objc_enumerationMutation(v22);
              }
              v25 += [*(id *)(*((void *)&v31 + 1) + 8 * j) isReachable];
            }
            uint64_t v24 = [v22 countByEnumeratingWithState:&v31 objects:v39 count:16];
          }
          while (v24);
        }
        else
        {
          unint64_t v25 = 0;
        }

        if (v18 < v25)
        {
          int64_t v21 = -1;
          v10 = v30;
          goto LABEL_60;
        }
        v10 = v30;
        if (v18 <= v25)
        {
          uint64_t v29 = [v9 compare:v30];
          if (v29)
          {
            int64_t v21 = v29;
            if (a4) {
              *a4 = 7;
            }
          }
          else
          {
            int64_t v21 = 0;
            if (a4) {
              *a4 = 0;
            }
          }
          goto LABEL_60;
        }
LABEL_59:
        int64_t v21 = 1;
        goto LABEL_60;
      }
      goto LABEL_33;
    }
    if (v11 != 1)
    {
      if (v12 != 1) {
        goto LABEL_12;
      }
      int64_t v21 = -1;
    }
    else
    {
LABEL_35:
      int64_t v21 = 1;
    }
LABEL_61:

    goto LABEL_62;
  }
  int64_t v21 = 0;
  if (a4) {
    *a4 = 0;
  }
LABEL_62:

  return v21;
}

- (int64_t)compare:(id)a3
{
  return [(HMDResidentDeviceElectionParameters *)self compare:a3 outCriteria:0];
}

- (NSDictionary)dictionaryRepresentation
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(HMDResidentDeviceElectionParameters *)self accessories];
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "dictionaryRepresentation", (void)v19);
        [v4 addEntriesFromDictionary:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v7);
  }

  v23[0] = @"kEnabledKey";
  int64_t v11 = NSNumber;
  uint64_t v12 = [(HMDResidentDeviceElectionParameters *)self isEnabled];
  uint64_t v13 = objc_msgSend(v11, "numberWithBool:", objc_msgSend(v12, "BOOLValue"));
  v24[0] = v13;
  v23[1] = @"kAtHomeStateKey";
  int64_t v14 = [(HMDResidentDeviceElectionParameters *)self location];
  uint64_t v15 = MEMORY[0x1E4F1CC28];
  if (v14 == 1) {
    uint64_t v15 = MEMORY[0x1E4F1CC38];
  }
  v24[1] = v15;
  v23[2] = @"kAccessoriesListKey";
  uint64_t v16 = objc_msgSend(v4, "copy", (void)v19);
  v24[2] = v16;
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];

  return (NSDictionary *)v17;
}

- (HMDResidentDeviceElectionParameters)initWithResident:(id)a3 enabled:(id)a4 location:(int64_t)a5 accessories:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (v11)
  {
    v27.receiver = self;
    v27.super_class = (Class)HMDResidentDeviceElectionParameters;
    int64_t v14 = [(HMDResidentDeviceElectionParameters *)&v27 init];
    uint64_t v15 = v14;
    if (v14)
    {
      objc_storeStrong((id *)&v14->_resident, a3);
      uint64_t v16 = [v11 device];
      uint64_t v17 = [v16 productInfo];
      productInfo = v15->_productInfo;
      v15->_productInfo = (HMFProductInfo *)v17;

      uint64_t v19 = [v16 version];
      version = v15->_version;
      v15->_version = (HMDHomeKitVersion *)v19;

      uint64_t v21 = [v12 copy];
      enabled = v15->_enabled;
      v15->_enabled = (HMFBoolean *)v21;

      v15->_location = a5;
      uint64_t v23 = [v13 copy];
      accessories = v15->_accessories;
      v15->_accessories = (NSSet *)v23;
    }
    self = v15;
    unint64_t v25 = self;
  }
  else
  {
    unint64_t v25 = 0;
  }

  return v25;
}

- (HMDResidentDeviceElectionParameters)initWithResident:(id)a3 dictionaryRepresentation:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x1E4F1CA80];
  id v8 = a3;
  v9 = [v7 set];
  v10 = objc_msgSend(v6, "hmf_numberForKey:", @"kEnabledKey");
  id v11 = v10;
  if (v10)
  {
    id v12 = objc_msgSend(MEMORY[0x1E4F65408], "BOOLeanWithBool:", objc_msgSend(v10, "BOOLValue"));
  }
  else
  {
    id v12 = 0;
  }

  id v13 = objc_msgSend(v6, "hmf_numberForKey:", @"kAtHomeStateKey");
  int64_t v14 = v13;
  if (v13)
  {
    if ([v13 BOOLValue]) {
      uint64_t v15 = 1;
    }
    else {
      uint64_t v15 = 2;
    }
  }
  else
  {
    uint64_t v15 = 2;
  }

  uint64_t v16 = objc_msgSend(v6, "hmf_dictionaryForKey:", @"kAccessoriesListKey");
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __81__HMDResidentDeviceElectionParameters_initWithResident_dictionaryRepresentation___block_invoke;
  v20[3] = &unk_1E6A18E48;
  id v21 = v9;
  id v17 = v9;
  [v16 enumerateKeysAndObjectsUsingBlock:v20];

  unint64_t v18 = [(HMDResidentDeviceElectionParameters *)self initWithResident:v8 enabled:v12 location:v15 accessories:v17];
  return v18;
}

void __81__HMDResidentDeviceElectionParameters_initWithResident_dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [HMDAccessoryReachabilityElectionParameter alloc];
  id v10 = v5;
  v11[0] = v6;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  v9 = [(HMDAccessoryReachabilityElectionParameter *)v7 initWithDictionaryRepresentation:v8];

  if (v9) {
    [*(id *)(a1 + 32) addObject:v9];
  }
}

@end