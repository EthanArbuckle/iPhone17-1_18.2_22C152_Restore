@interface HMDStatusChannelRecord
- (BOOL)isEqual:(id)a3;
- (HMDStatusChannelRecord)initWithIdsIdentifier:(id)a3 idsDestination:(id)a4 payload:(id)a5 assertionTime:(id)a6;
- (HMDStatusChannelRecord)initWithPresentDevice:(id)a3;
- (NSDate)assertionTime;
- (NSDictionary)payload;
- (NSString)idsDestination;
- (NSUUID)idsIdentifier;
- (id)description;
- (unint64_t)hash;
@end

@implementation HMDStatusChannelRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertionTime, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_idsDestination, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
}

- (NSDate)assertionTime
{
  return self->_assertionTime;
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (NSString)idsDestination
{
  return self->_idsDestination;
}

- (NSUUID)idsIdentifier
{
  return self->_idsIdentifier;
}

- (unint64_t)hash
{
  v2 = [(HMDStatusChannelRecord *)self idsIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
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
  if (v6)
  {
    v7 = [(HMDStatusChannelRecord *)self idsIdentifier];
    v8 = [v6 idsIdentifier];
    if ([v7 isEqual:v8])
    {
      v9 = [(HMDStatusChannelRecord *)self idsDestination];
      v10 = [v6 idsDestination];
      if ([v9 isEqual:v10])
      {
        v11 = [(HMDStatusChannelRecord *)self payload];
        v12 = [v6 payload];
        if ([v11 isEqual:v12])
        {
          v16 = [(HMDStatusChannelRecord *)self assertionTime];
          v13 = [v6 assertionTime];
          char v14 = HMFEqualObjects();
        }
        else
        {
          char v14 = 0;
        }
      }
      else
      {
        char v14 = 0;
      }
    }
    else
    {
      char v14 = 0;
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (id)description
{
  unint64_t v3 = NSString;
  id v4 = [(HMDStatusChannelRecord *)self idsIdentifier];
  v5 = [(HMDStatusChannelRecord *)self idsDestination];
  id v6 = [(HMDStatusChannelRecord *)self assertionTime];
  v7 = [(HMDStatusChannelRecord *)self payload];
  v8 = [v3 stringWithFormat:@"device:%@ %@ assertionTime:%@ payload:%@", v4, v5, v6, v7];

  return v8;
}

- (HMDStatusChannelRecord)initWithPresentDevice:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 presencePayload];
  id v6 = [v4 deviceTokenURI];
  id v7 = objc_alloc(MEMORY[0x263F08C38]);
  v8 = [v5 payloadDictionary];
  v9 = objc_msgSend(v8, "hmf_stringForKey:", @"statusChannelDeviceIdKey");
  v10 = (void *)[v7 initWithUUIDString:v9];

  if (v10)
  {
    v11 = [v5 payloadDictionary];
    v12 = objc_msgSend(v11, "hmf_dateForKey:", @"SC.ck.pt");

    if (v12)
    {
      v13 = [v5 payloadDictionary];
      char v14 = [(HMDStatusChannelRecord *)self initWithIdsIdentifier:v10 idsDestination:v6 payload:v13 assertionTime:v12];
    }
    else
    {
      v13 = [v4 assertionTime];
      v20 = [v5 payloadDictionary];
      char v14 = [(HMDStatusChannelRecord *)self initWithIdsIdentifier:v10 idsDestination:v6 payload:v20 assertionTime:v13];
    }
    v19 = v14;
  }
  else
  {
    v15 = (void *)MEMORY[0x230FBD990]();
    char v14 = self;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = HMFGetLogIdentifier();
      v18 = [v5 payloadDictionary];
      int v22 = 138543618;
      v23 = v17;
      __int16 v24 = 2112;
      v25 = v18;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Attempt to create ChannelRecord with invalid payload: missing/bad deviceID %@", (uint8_t *)&v22, 0x16u);
    }
    v19 = 0;
  }

  return v19;
}

- (HMDStatusChannelRecord)initWithIdsIdentifier:(id)a3 idsDestination:(id)a4 payload:(id)a5 assertionTime:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)HMDStatusChannelRecord;
  v15 = [(HMDStatusChannelRecord *)&v19 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_idsIdentifier, a3);
    objc_storeStrong((id *)&v16->_idsDestination, a4);
    payload = v16->_payload;
    v16->_payload = (NSDictionary *)MEMORY[0x263EFFA78];

    if (v13) {
      objc_storeStrong((id *)&v16->_payload, a5);
    }
    objc_storeStrong((id *)&v16->_assertionTime, a6);
  }

  return v16;
}

@end