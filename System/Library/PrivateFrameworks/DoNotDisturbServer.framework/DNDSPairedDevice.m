@interface DNDSPairedDevice
- (BOOL)isEqual:(id)a3;
- (BOOL)isICloudEnabled;
- (BOOL)isIOS14EraOS;
- (BOOL)supportsKettle;
- (BOOL)supportsSilenceLists;
- (DNDSPairedDevice)initWithCloudDeviceIdentifier:(id)a3 deviceClass:(unint64_t)a4 assertionSyncProtocolVersion:(unint64_t)a5 configurationSyncProtocolVersion:(unint64_t)a6 supportsSilenceLists:(BOOL)a7;
- (DNDSPairedDevice)initWithLocalDeviceIdentifier:(id)a3 deviceClass:(unint64_t)a4 assertionSyncProtocolVersion:(unint64_t)a5 configurationSyncProtocolVersion:(unint64_t)a6 iOS14EraOS:(BOOL)a7 supportsSilenceLists:(BOOL)a8 pairingIdentifier:(id)a9 pairingDataStore:(id)a10;
- (NSString)deviceIdentifier;
- (NSString)deviceName;
- (NSString)osBuild;
- (NSString)pairingDataStore;
- (NSUUID)pairingIdentifier;
- (id)description;
- (unint64_t)assertionSyncProtocolVersion;
- (unint64_t)configurationSyncProtocolVersion;
- (unint64_t)deviceClass;
- (unint64_t)hash;
- (unint64_t)syncServiceType;
- (void)setDeviceName:(id)a3;
- (void)setICloudEnabled:(BOOL)a3;
- (void)setOsBuild:(id)a3;
@end

@implementation DNDSPairedDevice

- (BOOL)supportsKettle
{
  return [(DNDSPairedDevice *)self assertionSyncProtocolVersion] > 8;
}

- (DNDSPairedDevice)initWithLocalDeviceIdentifier:(id)a3 deviceClass:(unint64_t)a4 assertionSyncProtocolVersion:(unint64_t)a5 configurationSyncProtocolVersion:(unint64_t)a6 iOS14EraOS:(BOOL)a7 supportsSilenceLists:(BOOL)a8 pairingIdentifier:(id)a9 pairingDataStore:(id)a10
{
  id v16 = a3;
  id v17 = a9;
  id v18 = a10;
  v27.receiver = self;
  v27.super_class = (Class)DNDSPairedDevice;
  v19 = [(DNDSPairedDevice *)&v27 init];
  if (v19)
  {
    uint64_t v20 = [v16 copy];
    deviceIdentifier = v19->_deviceIdentifier;
    v19->_deviceIdentifier = (NSString *)v20;

    v19->_deviceClass = a4;
    v19->_assertionSyncProtocolVersion = a5;
    v19->_configurationSyncProtocolVersion = a6;
    v19->_iOS14EraOS = a7;
    v19->_supportsSilenceLists = a8;
    v19->_iCloudEnabled = 0;
    v19->_syncServiceType = 1;
    uint64_t v22 = [v17 copy];
    pairingIdentifier = v19->_pairingIdentifier;
    v19->_pairingIdentifier = (NSUUID *)v22;

    uint64_t v24 = [v18 copy];
    pairingDataStore = v19->_pairingDataStore;
    v19->_pairingDataStore = (NSString *)v24;
  }
  return v19;
}

- (DNDSPairedDevice)initWithCloudDeviceIdentifier:(id)a3 deviceClass:(unint64_t)a4 assertionSyncProtocolVersion:(unint64_t)a5 configurationSyncProtocolVersion:(unint64_t)a6 supportsSilenceLists:(BOOL)a7
{
  id v12 = a3;
  v17.receiver = self;
  v17.super_class = (Class)DNDSPairedDevice;
  v13 = [(DNDSPairedDevice *)&v17 init];
  if (v13)
  {
    uint64_t v14 = [v12 copy];
    deviceIdentifier = v13->_deviceIdentifier;
    v13->_deviceIdentifier = (NSString *)v14;

    v13->_deviceClass = a4;
    v13->_assertionSyncProtocolVersion = a5;
    v13->_configurationSyncProtocolVersion = a6;
    v13->_iOS14EraOS = 0;
    v13->_supportsSilenceLists = a7;
    v13->_iCloudEnabled = 1;
    v13->_syncServiceType = 2;
  }

  return v13;
}

- (unint64_t)hash
{
  v3 = [(DNDSPairedDevice *)self deviceIdentifier];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(DNDSPairedDevice *)self deviceClass];
  unint64_t v6 = v5 ^ [(DNDSPairedDevice *)self assertionSyncProtocolVersion] ^ v4;
  unint64_t v7 = v6 ^ [(DNDSPairedDevice *)self configurationSyncProtocolVersion];
  uint64_t v8 = [(DNDSPairedDevice *)self isIOS14EraOS];
  unint64_t v9 = v7 ^ v8 ^ [(DNDSPairedDevice *)self supportsSilenceLists];
  uint64_t v10 = [(DNDSPairedDevice *)self isICloudEnabled];
  unint64_t v11 = v10 ^ [(DNDSPairedDevice *)self syncServiceType];
  id v12 = [(DNDSPairedDevice *)self pairingIdentifier];
  uint64_t v13 = v9 ^ v11 ^ [v12 hash];
  uint64_t v14 = [(DNDSPairedDevice *)self pairingDataStore];
  unint64_t v15 = v13 ^ [v14 hash];

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v8 = (DNDSPairedDevice *)a3;
  if (self == v8)
  {
    BOOL v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v9 = v8;
      uint64_t v10 = [(DNDSPairedDevice *)self deviceIdentifier];
      unint64_t v11 = [(DNDSPairedDevice *)v9 deviceIdentifier];
      if (v10 != v11)
      {
        uint64_t v12 = [(DNDSPairedDevice *)self deviceIdentifier];
        if (!v12)
        {
          BOOL v14 = 0;
          goto LABEL_37;
        }
        v3 = (void *)v12;
        uint64_t v4 = [(DNDSPairedDevice *)v9 deviceIdentifier];
        if (!v4)
        {
          char v13 = 0;
LABEL_36:

          BOOL v14 = v13;
          goto LABEL_37;
        }
        unint64_t v5 = [(DNDSPairedDevice *)self deviceIdentifier];
        unint64_t v6 = [(DNDSPairedDevice *)v9 deviceIdentifier];
        if (![v5 isEqual:v6])
        {
          char v13 = 0;
LABEL_35:

          goto LABEL_36;
        }
      }
      unint64_t v15 = [(DNDSPairedDevice *)self deviceClass];
      if (v15 == [(DNDSPairedDevice *)v9 deviceClass])
      {
        unint64_t v16 = [(DNDSPairedDevice *)self assertionSyncProtocolVersion];
        if (v16 == [(DNDSPairedDevice *)v9 assertionSyncProtocolVersion])
        {
          unint64_t v17 = [(DNDSPairedDevice *)self configurationSyncProtocolVersion];
          if (v17 == [(DNDSPairedDevice *)v9 configurationSyncProtocolVersion])
          {
            BOOL v18 = [(DNDSPairedDevice *)self isIOS14EraOS];
            if (v18 == [(DNDSPairedDevice *)v9 isIOS14EraOS])
            {
              BOOL v19 = [(DNDSPairedDevice *)self supportsSilenceLists];
              if (v19 == [(DNDSPairedDevice *)v9 supportsSilenceLists])
              {
                BOOL v20 = [(DNDSPairedDevice *)self isICloudEnabled];
                if (v20 == [(DNDSPairedDevice *)v9 isICloudEnabled])
                {
                  unint64_t v21 = [(DNDSPairedDevice *)self syncServiceType];
                  if (v21 == [(DNDSPairedDevice *)v9 syncServiceType])
                  {
                    uint64_t v22 = [(DNDSPairedDevice *)self pairingIdentifier];
                    v41 = [(DNDSPairedDevice *)v9 pairingIdentifier];
                    if (v22 == v41)
                    {
                      v40 = v22;
                      goto LABEL_25;
                    }
                    uint64_t v23 = [(DNDSPairedDevice *)self pairingIdentifier];
                    if (v23)
                    {
                      v39 = (void *)v23;
                      uint64_t v24 = [(DNDSPairedDevice *)v9 pairingIdentifier];
                      if (v24)
                      {
                        id v37 = v24;
                        v38 = [(DNDSPairedDevice *)self pairingIdentifier];
                        v36 = [(DNDSPairedDevice *)v9 pairingIdentifier];
                        if (objc_msgSend(v38, "isEqual:"))
                        {
                          v40 = v22;
LABEL_25:
                          v25 = [(DNDSPairedDevice *)self pairingDataStore];
                          uint64_t v26 = [(DNDSPairedDevice *)v9 pairingDataStore];
                          if (v25 == (void *)v26)
                          {

                            char v13 = 1;
                          }
                          else
                          {
                            v35 = (void *)v26;
                            uint64_t v27 = [(DNDSPairedDevice *)self pairingDataStore];
                            if (v27)
                            {
                              v34 = (void *)v27;
                              v28 = [(DNDSPairedDevice *)v9 pairingDataStore];
                              if (v28)
                              {
                                v33 = v28;
                                v32 = [(DNDSPairedDevice *)self pairingDataStore];
                                v31 = [(DNDSPairedDevice *)v9 pairingDataStore];
                                char v13 = [v32 isEqual:v31];

                                v28 = v33;
                              }
                              else
                              {
                                char v13 = 0;
                              }
                            }
                            else
                            {

                              char v13 = 0;
                            }
                          }
                          v30 = v41;
                          if (v40 != v41)
                          {

                            v30 = v41;
                          }

                          BOOL v14 = v13;
LABEL_34:
                          if (v10 != v11) {
                            goto LABEL_35;
                          }
LABEL_37:

                          goto LABEL_38;
                        }

                        uint64_t v24 = v37;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      char v13 = 0;
      BOOL v14 = 0;
      goto LABEL_34;
    }
    BOOL v14 = 0;
  }
LABEL_38:

  return v14;
}

- (id)description
{
  uint64_t v27 = NSString;
  uint64_t v25 = objc_opt_class();
  v29 = [(DNDSPairedDevice *)self deviceName];
  if (v29)
  {
    v3 = NSString;
    uint64_t v22 = [(DNDSPairedDevice *)self deviceName];
    uint64_t v4 = [v3 stringWithFormat:@"; deviceName: '%@'", v22];
  }
  else
  {
    uint64_t v4 = &stru_1F2A2D288;
  }
  uint64_t v26 = [(DNDSPairedDevice *)self osBuild];
  if (v26)
  {
    unint64_t v5 = NSString;
    unint64_t v21 = [(DNDSPairedDevice *)self osBuild];
    unint64_t v6 = [v5 stringWithFormat:@"; build: %@", v21];
  }
  else
  {
    unint64_t v6 = &stru_1F2A2D288;
  }
  uint64_t v24 = v6;
  v28 = v4;
  uint64_t v23 = [(DNDSPairedDevice *)self deviceIdentifier];
  unint64_t v7 = [(DNDSPairedDevice *)self deviceClass];
  uint64_t v8 = @"<unhandled>";
  if (v7 <= 4) {
    uint64_t v8 = off_1E6974930[v7];
  }
  unint64_t v9 = [(DNDSPairedDevice *)self assertionSyncProtocolVersion];
  unint64_t v10 = [(DNDSPairedDevice *)self configurationSyncProtocolVersion];
  unint64_t v11 = objc_msgSend(NSNumber, "numberWithBool:", -[DNDSPairedDevice isIOS14EraOS](self, "isIOS14EraOS"));
  uint64_t v12 = objc_msgSend(NSNumber, "numberWithBool:", -[DNDSPairedDevice supportsSilenceLists](self, "supportsSilenceLists"));
  char v13 = objc_msgSend(NSNumber, "numberWithBool:", -[DNDSPairedDevice isICloudEnabled](self, "isICloudEnabled"));
  unint64_t v14 = [(DNDSPairedDevice *)self syncServiceType];
  unint64_t v15 = @"cloud";
  if (v14 != 2) {
    unint64_t v15 = @"<unhandled>";
  }
  if (v14 == 1) {
    unint64_t v15 = @"local";
  }
  unint64_t v16 = v15;
  unint64_t v17 = [(DNDSPairedDevice *)self pairingIdentifier];
  BOOL v18 = [(DNDSPairedDevice *)self pairingDataStore];
  objc_msgSend(v27, "stringWithFormat:", @"<%@: %p%@%@; deviceIdentifier: '%@'; deviceClass: %@; assertionSyncProtocolVersion: %lu; configurationSyncProtocolVersion: %lu; iOS14EraOS: %@; supportsSilenceLists: %@; iCloudEnabled: %@; syncServiceType: %@; pairingIdentifier: %@; pairingDataStore: %@>",
    v25,
    self,
    v28,
    v24,
    v23,
    v8,
    v9,
    v10,
    v11,
    v12,
    v13,
    v16,
    v17,
  BOOL v19 = v18);

  if (v26)
  {
  }
  if (v29)
  {
  }
  return v19;
}

- (NSString)osBuild
{
  return self->_osBuild;
}

- (void)setOsBuild:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_diagnostics()) {
    objc_storeStrong((id *)&self->_osBuild, a3);
  }
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_diagnostics()) {
    objc_storeStrong((id *)&self->_deviceName, a3);
  }
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (unint64_t)deviceClass
{
  return self->_deviceClass;
}

- (unint64_t)assertionSyncProtocolVersion
{
  return self->_assertionSyncProtocolVersion;
}

- (unint64_t)configurationSyncProtocolVersion
{
  return self->_configurationSyncProtocolVersion;
}

- (BOOL)isIOS14EraOS
{
  return self->_iOS14EraOS;
}

- (BOOL)supportsSilenceLists
{
  return self->_supportsSilenceLists;
}

- (BOOL)isICloudEnabled
{
  return self->_iCloudEnabled;
}

- (void)setICloudEnabled:(BOOL)a3
{
  self->_iCloudEnabled = a3;
}

- (unint64_t)syncServiceType
{
  return self->_syncServiceType;
}

- (NSUUID)pairingIdentifier
{
  return self->_pairingIdentifier;
}

- (NSString)pairingDataStore
{
  return self->_pairingDataStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingDataStore, 0);
  objc_storeStrong((id *)&self->_pairingIdentifier, 0);
  objc_storeStrong((id *)&self->_osBuild, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

@end