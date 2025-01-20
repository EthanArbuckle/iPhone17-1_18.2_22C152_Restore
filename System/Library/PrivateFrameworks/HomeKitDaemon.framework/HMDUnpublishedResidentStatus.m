@interface HMDUnpublishedResidentStatus
- (HMDHomeKitVersion)swVersion;
- (HMDPreferredResidentsList)preferredResidentsList;
- (HMDResidentSelectionInfo)selectionInfo;
- (HMDUnpublishedResidentStatus)initWithVersion:(id)a3 generationID:(id)a4 preferredResidentsList:(id)a5 selectionInfo:(id)a6 connectionType:(unint64_t)a7 locationRawValue:(id)a8;
- (NSDictionary)channelRecordPayload;
- (NSNumber)locationRawValue;
- (NSUUID)generationID;
- (id)description;
- (unint64_t)networkConnectionType;
@end

@implementation HMDUnpublishedResidentStatus

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionInfo, 0);
  objc_storeStrong((id *)&self->_locationRawValue, 0);
  objc_storeStrong((id *)&self->_preferredResidentsList, 0);
  objc_storeStrong((id *)&self->_generationID, 0);
  objc_storeStrong((id *)&self->_swVersion, 0);
}

- (unint64_t)networkConnectionType
{
  return self->_networkConnectionType;
}

- (HMDResidentSelectionInfo)selectionInfo
{
  return self->_selectionInfo;
}

- (NSNumber)locationRawValue
{
  return self->_locationRawValue;
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

- (id)description
{
  v3 = NSString;
  v4 = [(HMDUnpublishedResidentStatus *)self swVersion];
  v5 = [(HMDUnpublishedResidentStatus *)self generationID];
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUnpublishedResidentStatus networkConnectionType](self, "networkConnectionType"));
  v7 = [(HMDUnpublishedResidentStatus *)self locationRawValue];
  v8 = [(HMDUnpublishedResidentStatus *)self preferredResidentsList];
  v9 = [v3 stringWithFormat:@"swVer %@ generationID %@ connectionType %@ location %@ preferredResidentsList %@", v4, v5, v6, v7, v8];

  return v9;
}

- (NSDictionary)channelRecordPayload
{
  v37[1] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263EFF9A0];
  v36 = @"residentStatusSwVersionKey";
  v4 = [(HMDUnpublishedResidentStatus *)self swVersion];
  v5 = [v4 versionString];
  v37[0] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v37 forKeys:&v36 count:1];
  v7 = [v3 dictionaryWithDictionary:v6];

  v8 = [(HMDUnpublishedResidentStatus *)self generationID];

  if (v8)
  {
    v9 = [(HMDUnpublishedResidentStatus *)self generationID];
    v10 = [v9 UUIDString];
    [v7 setObject:v10 forKeyedSubscript:@"residentStatusGenerationIDKey"];
  }
  v11 = [(HMDUnpublishedResidentStatus *)self preferredResidentsList];

  if (v11)
  {
    v12 = [(HMDUnpublishedResidentStatus *)self preferredResidentsList];
    v13 = [v12 residentIDSIdentifiers];
    v14 = objc_msgSend(v13, "na_map:", &__block_literal_global_102291);

    v34[0] = @"PRL.ck.rii";
    v34[1] = @"PRL.ck.mt";
    v35[0] = v14;
    v15 = [(HMDUnpublishedResidentStatus *)self preferredResidentsList];
    v16 = [v15 modifiedTimestamp];
    v35[1] = v16;
    v17 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];
    [v7 setObject:v17 forKeyedSubscript:@"RS.ck.prl"];
  }
  v18 = [(HMDUnpublishedResidentStatus *)self selectionInfo];
  uint64_t v19 = [v18 currentModeType];

  if ((v19 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v20 = [(HMDUnpublishedResidentStatus *)self selectionInfo];
    v21 = [v20 selectionTimestamp];
    [v7 setObject:v21 forKeyedSubscript:@"RSI.ck.st"];

    v22 = NSNumber;
    v23 = [(HMDUnpublishedResidentStatus *)self selectionInfo];
    v24 = objc_msgSend(v22, "numberWithUnsignedInteger:", objc_msgSend(v23, "currentModeType"));
    [v7 setObject:v24 forKeyedSubscript:@"RSI.ck.m"];

    v25 = [(HMDUnpublishedResidentStatus *)self selectionInfo];
    v26 = [v25 preferredResidentIDSIdentifier];

    if (v26)
    {
      v27 = [(HMDUnpublishedResidentStatus *)self selectionInfo];
      v28 = [v27 preferredResidentIDSIdentifier];
      v29 = objc_msgSend(v28, "hmf_bytesAsData");
      [v7 setObject:v29 forKeyedSubscript:@"RSI.ck.prii"];
    }
  }
  v30 = [(HMDUnpublishedResidentStatus *)self locationRawValue];
  [v7 setObject:v30 forKeyedSubscript:@"RS.ck.rl"];

  v31 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUnpublishedResidentStatus networkConnectionType](self, "networkConnectionType"));
  [v7 setObject:v31 forKeyedSubscript:@"RS.ck.nw"];

  v32 = (void *)[v7 copy];
  return (NSDictionary *)v32;
}

uint64_t __52__HMDUnpublishedResidentStatus_channelRecordPayload__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hmf_bytesAsData");
}

- (HMDUnpublishedResidentStatus)initWithVersion:(id)a3 generationID:(id)a4 preferredResidentsList:(id)a5 selectionInfo:(id)a6 connectionType:(unint64_t)a7 locationRawValue:(id)a8
{
  id v22 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)HMDUnpublishedResidentStatus;
  v18 = [(HMDUnpublishedResidentStatus *)&v23 init];
  uint64_t v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_swVersion, a3);
    objc_storeStrong((id *)&v19->_generationID, a4);
    objc_storeStrong((id *)&v19->_preferredResidentsList, a5);
    objc_storeStrong((id *)&v19->_selectionInfo, a6);
    v19->_networkConnectionType = a7;
    objc_storeStrong((id *)&v19->_locationRawValue, a8);
  }

  return v19;
}

@end