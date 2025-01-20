@interface HMDCameraSnapshotSessionID
- (BOOL)isSnapshotRequestForBulletin;
- (HMDCameraSnapshotSessionID)initWithAccessory:(id)a3 message:(id)a4;
- (HMDCameraSnapshotSessionID)initWithSessionID:(id)a3 hostProcessBundleIdentifier:(id)a4 isSPIClient:(BOOL)a5 deviceSectionName:(id)a6 description:(id)a7 snapshotReason:(unint64_t)a8 snapshotRequestForBulletin:(BOOL)a9 snapshotCharacteristicEventUUID:(id)a10 streamingTier:(id)a11;
- (NSNumber)streamingTier;
- (NSString)snapshotCharacteristicEventUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)snapshotReason;
@end

@implementation HMDCameraSnapshotSessionID

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamingTier, 0);
  objc_storeStrong((id *)&self->_snapshotCharacteristicEventUUID, 0);
}

- (NSNumber)streamingTier
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (BOOL)isSnapshotRequestForBulletin
{
  return self->_snapshotRequestForBulletin;
}

- (unint64_t)snapshotReason
{
  return self->_snapshotReason;
}

- (NSString)snapshotCharacteristicEventUUID
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HMDCameraSnapshotSessionID allocWithZone:a3];
  v5 = [(HMDCameraSessionID *)self sessionID];
  v6 = [(HMDCameraSessionID *)self hostProcessBundleIdentifier];
  BOOL v7 = [(HMDCameraSessionID *)self isSPIClient];
  v8 = [(HMDCameraSessionID *)self deviceSectionName];
  v9 = [(HMDCameraSessionID *)self description];
  unint64_t v10 = [(HMDCameraSnapshotSessionID *)self snapshotReason];
  BOOL v11 = [(HMDCameraSnapshotSessionID *)self isSnapshotRequestForBulletin];
  v12 = [(HMDCameraSnapshotSessionID *)self snapshotCharacteristicEventUUID];
  v13 = [(HMDCameraSnapshotSessionID *)self streamingTier];
  LOBYTE(v16) = v11;
  v14 = [(HMDCameraSnapshotSessionID *)v4 initWithSessionID:v5 hostProcessBundleIdentifier:v6 isSPIClient:v7 deviceSectionName:v8 description:v9 snapshotReason:v10 snapshotRequestForBulletin:v16 snapshotCharacteristicEventUUID:v12 streamingTier:v13];

  return v14;
}

- (HMDCameraSnapshotSessionID)initWithAccessory:(id)a3 message:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 stringForKey:@"kCameraSessionID"];
  if (v8)
  {
    v32 = self;
    v33 = [v7 numberForKey:@"kCameraStreamingTierType"];
    v9 = [v7 stringForKey:@"kCameraProactiveSessionID"];
    unint64_t v10 = (void *)MEMORY[0x263F089D8];
    id v34 = v6;
    BOOL v11 = [v6 name];
    v12 = [v10 stringWithFormat:@"%@/%@", v11, v8];

    if (v9) {
      [v12 appendFormat:@"/%@", v9];
    }
    v13 = [(HMDCameraSessionID *)[HMDCameraSnapshotSessionID alloc] initWithSessionID:v8 message:v7 description:v12];
    unsigned int v14 = [v7 BOOLForKey:*MEMORY[0x263F0BD58]];
    char v15 = v14;
    if (v9) {
      uint64_t v16 = 1;
    }
    else {
      uint64_t v16 = v14;
    }
    uint64_t v30 = v16;
    v17 = [(HMDCameraSessionID *)v13 sessionID];
    v18 = [(HMDCameraSessionID *)v13 hostProcessBundleIdentifier];
    uint64_t v19 = [(HMDCameraSessionID *)v13 isSPIClient];
    [(HMDCameraSessionID *)v13 deviceSectionName];
    v31 = v12;
    v21 = v20 = v8;
    v22 = [(HMDCameraSessionID *)v13 description];
    LOBYTE(v29) = v15;
    v23 = [(HMDCameraSnapshotSessionID *)v32 initWithSessionID:v17 hostProcessBundleIdentifier:v18 isSPIClient:v19 deviceSectionName:v21 description:v22 snapshotReason:v30 snapshotRequestForBulletin:v29 snapshotCharacteristicEventUUID:v9 streamingTier:v33];

    v8 = v20;
    v24 = v23;
    id v6 = v34;
  }
  else
  {
    v25 = (void *)MEMORY[0x230FBD990]();
    v23 = self;
    v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v36 = v27;
      __int16 v37 = 2112;
      id v38 = v7;
      _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@Snapshot session ID is not present in message: %@", buf, 0x16u);
    }
    v24 = 0;
  }

  return v24;
}

- (HMDCameraSnapshotSessionID)initWithSessionID:(id)a3 hostProcessBundleIdentifier:(id)a4 isSPIClient:(BOOL)a5 deviceSectionName:(id)a6 description:(id)a7 snapshotReason:(unint64_t)a8 snapshotRequestForBulletin:(BOOL)a9 snapshotCharacteristicEventUUID:(id)a10 streamingTier:(id)a11
{
  BOOL v13 = a5;
  id v17 = a10;
  id v18 = a11;
  v23.receiver = self;
  v23.super_class = (Class)HMDCameraSnapshotSessionID;
  uint64_t v19 = [(HMDCameraSessionID *)&v23 initWithSessionID:a3 hostProcessBundleIdentifier:a4 isSPIClient:v13 deviceSectionName:a6 description:a7];
  v20 = v19;
  if (v19)
  {
    v19->_snapshotReason = a8;
    objc_storeStrong((id *)&v19->_snapshotCharacteristicEventUUID, a10);
    v20->_snapshotRequestForBulletin = a9;
    objc_storeStrong((id *)&v20->_streamingTier, a11);
  }

  return v20;
}

@end