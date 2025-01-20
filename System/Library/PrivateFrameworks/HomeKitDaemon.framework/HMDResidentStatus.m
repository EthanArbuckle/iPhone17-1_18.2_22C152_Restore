@interface HMDResidentStatus
- (BOOL)hasChangedFrom:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPrimary;
- (HMDHomeKitVersion)swVersion;
- (HMDPreferredResidentsList)preferredResidentsList;
- (HMDResidentSelectionInfo)selectionInfo;
- (HMDResidentStatus)initWithChannelRecord:(id)a3;
- (HMDResidentStatus)initWithIDSIdentifier:(id)a3 idsDestination:(id)a4 version:(id)a5 generationID:(id)a6 assertionTime:(id)a7 preferredResidentsList:(id)a8 selectionInfo:(id)a9 connectionType:(unint64_t)a10 locationRawValue:(id)a11;
- (NSDate)assertionTime;
- (NSNumber)locationRawValue;
- (NSString)idsDestination;
- (NSUUID)generationID;
- (NSUUID)idsIdentifier;
- (id)description;
- (id)matchingDeviceFromResidentDevices:(id)a3;
- (unint64_t)hash;
- (unint64_t)location;
- (unint64_t)networkConnectionType;
@end

@implementation HMDResidentStatus

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationRawValue, 0);
  objc_storeStrong((id *)&self->_assertionTime, 0);
  objc_storeStrong((id *)&self->_selectionInfo, 0);
  objc_storeStrong((id *)&self->_preferredResidentsList, 0);
  objc_storeStrong((id *)&self->_generationID, 0);
  objc_storeStrong((id *)&self->_swVersion, 0);
  objc_storeStrong((id *)&self->_idsDestination, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
}

- (NSNumber)locationRawValue
{
  return self->_locationRawValue;
}

- (NSDate)assertionTime
{
  return self->_assertionTime;
}

- (unint64_t)networkConnectionType
{
  return self->_networkConnectionType;
}

- (HMDResidentSelectionInfo)selectionInfo
{
  return self->_selectionInfo;
}

- (unint64_t)location
{
  return self->_location;
}

- (HMDPreferredResidentsList)preferredResidentsList
{
  return self->_preferredResidentsList;
}

- (NSUUID)generationID
{
  return self->_generationID;
}

- (HMDHomeKitVersion)swVersion
{
  return self->_swVersion;
}

- (NSString)idsDestination
{
  return self->_idsDestination;
}

- (NSUUID)idsIdentifier
{
  return self->_idsIdentifier;
}

- (id)description
{
  v3 = NSString;
  v4 = [(HMDResidentStatus *)self idsIdentifier];
  v5 = [(HMDResidentStatus *)self idsDestination];
  v6 = [(HMDResidentStatus *)self assertionTime];
  v7 = [(HMDResidentStatus *)self swVersion];
  v8 = [(HMDResidentStatus *)self generationID];
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDResidentStatus networkConnectionType](self, "networkConnectionType"));
  v10 = StringFromHMDResidentLocation([(HMDResidentStatus *)self location]);
  v11 = [(HMDResidentStatus *)self preferredResidentsList];
  v12 = [v3 stringWithFormat:@"%@ %@ assertionTime: %@ swVer %@ generationID %@ connectionType %@ location %@ preferredResidentsList %@", v4, v5, v6, v7, v8, v9, v10, v11];

  return v12;
}

- (BOOL)isPrimary
{
  v2 = [(HMDResidentStatus *)self generationID];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)hasChangedFrom:(id)a3
{
  id v4 = a3;
  v5 = [(HMDResidentStatus *)self idsIdentifier];
  v6 = [v4 idsIdentifier];
  if ([v5 isEqual:v6])
  {
    v7 = [(HMDResidentStatus *)self idsDestination];
    v8 = [v4 idsDestination];
    if (![v7 isEqual:v8])
    {
      LOBYTE(v23) = 0;
LABEL_14:

      goto LABEL_15;
    }
    v9 = [(HMDResidentStatus *)self swVersion];
    v10 = [v4 swVersion];
    if (![v9 isEqual:v10]) {
      goto LABEL_11;
    }
    v25 = v9;
    v11 = [(HMDResidentStatus *)self generationID];
    v12 = [v4 generationID];
    int v13 = HMFEqualObjects();

    if (!v13) {
      goto LABEL_12;
    }
    v14 = [(HMDResidentStatus *)self assertionTime];
    v15 = [v4 assertionTime];
    int v16 = HMFEqualObjects();

    if (!v16
      || ([(HMDResidentStatus *)self preferredResidentsList],
          v17 = objc_claimAutoreleasedReturnValue(),
          [v4 preferredResidentsList],
          v18 = objc_claimAutoreleasedReturnValue(),
          int v19 = HMFEqualObjects(),
          v18,
          v17,
          !v19))
    {
LABEL_12:
      LOBYTE(v23) = 1;
      v9 = v25;
      goto LABEL_13;
    }
    unint64_t v20 = [(HMDResidentStatus *)self networkConnectionType];
    v9 = v25;
    if (v20 == [v4 networkConnectionType])
    {
      v21 = [(HMDResidentStatus *)self locationRawValue];
      v22 = [v4 locationRawValue];
      int v23 = [v21 isEqualToNumber:v22] ^ 1;
    }
    else
    {
LABEL_11:
      LOBYTE(v23) = 1;
    }
LABEL_13:

    goto LABEL_14;
  }
  LOBYTE(v23) = 0;
LABEL_15:

  return v23;
}

- (unint64_t)hash
{
  v2 = [(HMDResidentStatus *)self idsIdentifier];
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
    v7 = [(HMDResidentStatus *)self idsIdentifier];
    v8 = [v6 idsIdentifier];
    if ([v7 isEqual:v8])
    {
      v9 = [(HMDResidentStatus *)self idsDestination];
      v10 = [v6 idsDestination];
      char v11 = [v9 isEqual:v10];
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)matchingDeviceFromResidentDevices:(id)a3
{
  id v4 = a3;
  v5 = [(HMDResidentStatus *)self idsIdentifier];
  id v6 = [(HMDResidentStatus *)self idsDestination];
  v7 = +[HMDDeviceAddress addressWithIDSIdentifier:v5 idsDestination:v6];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __55__HMDResidentStatus_matchingDeviceFromResidentDevices___block_invoke;
  v11[3] = &unk_264A2A830;
  id v12 = v7;
  id v8 = v7;
  v9 = objc_msgSend(v4, "na_firstObjectPassingTest:", v11);

  return v9;
}

uint64_t __55__HMDResidentStatus_matchingDeviceFromResidentDevices___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isDeviceEquivalentToDeviceAddress:*(void *)(a1 + 32)];
}

- (HMDResidentStatus)initWithChannelRecord:(id)a3
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 payload];
  id v6 = objc_msgSend(v5, "hmf_stringForKey:", @"residentStatusSwVersionKey");

  v7 = [v4 payload];
  id v8 = objc_msgSend(v7, "hmf_UUIDForKey:", @"residentStatusGenerationIDKey");

  v9 = [[HMDHomeKitVersion alloc] initWithVersionString:v6];
  if (v9)
  {
    v10 = [v4 payload];
    char v11 = objc_msgSend(v10, "hmf_dictionaryForKey:", @"RS.ck.prl");

    v53 = v8;
    v51 = self;
    if (v11)
    {
      id v12 = (void *)MEMORY[0x263EFFA08];
      uint64_t v54 = objc_opt_class();
      int v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v54 count:1];
      v14 = [v12 setWithArray:v13];
      v15 = objc_msgSend(v11, "hmf_arrayForKey:ofClasses:", @"PRL.ck.rii", v14);

      uint64_t v16 = objc_msgSend(v11, "hmf_dateForKey:", @"PRL.ck.mt");
      v17 = (void *)v16;
      if (v15 && v16)
      {
        v18 = objc_msgSend(v15, "na_map:", &__block_literal_global_118_102355);
        v47 = [[HMDPreferredResidentsList alloc] initWithResidentIDSIdentifiers:v18 modifiedTimestamp:v17];
      }
      else
      {
        v25 = (void *)MEMORY[0x230FBD990]();
        v26 = self;
        v27 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v28 = v48 = v25;
          v29 = [v4 payload];
          *(_DWORD *)buf = 138543618;
          v56 = v28;
          __int16 v57 = 2112;
          v58 = v29;
          _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@Unable to create preferred residents list from invalid record %@", buf, 0x16u);

          v25 = v48;
        }

        v47 = 0;
      }
    }
    else
    {
      v47 = 0;
    }
    v30 = [v4 payload];
    uint64_t v31 = objc_msgSend(v30, "hmf_dateForKey:", @"RSI.ck.st");

    v52 = v6;
    v49 = (void *)v31;
    v50 = v11;
    if (v31)
    {
      v32 = [v4 payload];
      v33 = objc_msgSend(v32, "hmf_dataForKey:", @"RSI.ck.prii");

      if (v33) {
        v34 = objc_msgSend(objc_alloc(MEMORY[0x263F08C38]), "initWithUUIDBytes:", objc_msgSend(v33, "bytes"));
      }
      else {
        v34 = 0;
      }
      v35 = [[HMDResidentSelectionInfo alloc] initWithPreferredResidentIDSIdentifier:v34 selectionTimestamp:v31];
    }
    else
    {
      v35 = 0;
    }
    v36 = [v4 payload];
    uint64_t v37 = objc_msgSend(v36, "hmf_numberForKey:", @"RS.ck.rl");

    if (v37) {
      v38 = (void *)v37;
    }
    else {
      v38 = &unk_26E471710;
    }
    v39 = [v4 payload];
    v40 = objc_msgSend(v39, "hmf_numberForKey:", @"RS.ck.nw");
    uint64_t v41 = [v40 unsignedIntegerValue];

    v42 = [v4 idsIdentifier];
    v43 = [v4 idsDestination];
    v44 = [v4 assertionTime];
    uint64_t v46 = v41;
    id v8 = v53;
    unint64_t v20 = [(HMDResidentStatus *)v51 initWithIDSIdentifier:v42 idsDestination:v43 version:v9 generationID:v53 assertionTime:v44 preferredResidentsList:v47 selectionInfo:v35 connectionType:v46 locationRawValue:v38];

    v24 = v20;
    id v6 = v52;
  }
  else
  {
    int v19 = (void *)MEMORY[0x230FBD990]();
    unint64_t v20 = self;
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = HMFGetLogIdentifier();
      int v23 = [v4 payload];
      *(_DWORD *)buf = 138543618;
      v56 = v22;
      __int16 v57 = 2112;
      v58 = v23;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Unable to create resident status from invalid record %@", buf, 0x16u);
    }
    v24 = 0;
  }

  return v24;
}

id __43__HMDResidentStatus_initWithChannelRecord___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F08C38];
  id v3 = a2;
  id v4 = [v2 alloc];
  id v5 = v3;
  uint64_t v6 = [v5 bytes];

  v7 = (void *)[v4 initWithUUIDBytes:v6];
  return v7;
}

- (HMDResidentStatus)initWithIDSIdentifier:(id)a3 idsDestination:(id)a4 version:(id)a5 generationID:(id)a6 assertionTime:(id)a7 preferredResidentsList:(id)a8 selectionInfo:(id)a9 connectionType:(unint64_t)a10 locationRawValue:(id)a11
{
  id v18 = a3;
  id v28 = a4;
  id v27 = a5;
  id v26 = a6;
  id v25 = a7;
  id v24 = a8;
  id v23 = a9;
  id v19 = a11;
  v29.receiver = self;
  v29.super_class = (Class)HMDResidentStatus;
  unint64_t v20 = [(HMDResidentStatus *)&v29 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_idsIdentifier, a3);
    objc_storeStrong((id *)&v21->_idsDestination, a4);
    objc_storeStrong((id *)&v21->_swVersion, a5);
    objc_storeStrong((id *)&v21->_generationID, a6);
    objc_storeStrong((id *)&v21->_assertionTime, a7);
    objc_storeStrong((id *)&v21->_preferredResidentsList, a8);
    objc_storeStrong((id *)&v21->_selectionInfo, a9);
    v21->_networkConnectionType = a10;
    objc_storeStrong((id *)&v21->_locationRawValue, a11);
    v21->_location = [v19 unsignedIntegerValue];
  }

  return v21;
}

@end