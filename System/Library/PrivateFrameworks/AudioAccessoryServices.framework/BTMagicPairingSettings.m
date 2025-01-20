@interface BTMagicPairingSettings
+ (BOOL)supportsSecureCoding;
+ (id)magicSettingsWithBluetoothAddress:(id)a3;
- (BTMagicPairingSettings)initWithBluetoothAddress:(id)a3;
- (BTMagicPairingSettings)initWithCoder:(id)a3;
- (NSData)accessoryHint;
- (NSData)accessoryKey;
- (NSData)encryptionKey;
- (NSData)irk;
- (NSData)masterHint;
- (NSData)masterKey;
- (NSString)bluetoothAddress;
- (NSString)buttonModes;
- (NSString)color;
- (NSString)deviceIDFeatureBitsV1;
- (NSString)deviceIDFeatureBitsV2;
- (NSString)listeningServices;
- (NSString)listeningServicesV2;
- (NSString)name;
- (NSString)optimizedBatteryCharging;
- (NSString)optimizedBatteryFullChargeDeadline;
- (NSString)productID;
- (NSString)ratchet;
- (NSString)reserved;
- (NSString)settingsMask;
- (NSString)spatialAudio;
- (NSString)supportedServices;
- (NSString)vendorID;
- (NSString)version;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessoryHint:(id)a3;
- (void)setAccessoryKey:(id)a3;
- (void)setBluetoothAddress:(id)a3;
- (void)setButtonModes:(id)a3;
- (void)setColor:(id)a3;
- (void)setDeviceIDFeatureBitsV1:(id)a3;
- (void)setDeviceIDFeatureBitsV2:(id)a3;
- (void)setEncryptionKey:(id)a3;
- (void)setIrk:(id)a3;
- (void)setListeningServices:(id)a3;
- (void)setListeningServicesV2:(id)a3;
- (void)setMasterHint:(id)a3;
- (void)setMasterKey:(id)a3;
- (void)setName:(id)a3;
- (void)setOptimizedBatteryCharging:(id)a3;
- (void)setOptimizedBatteryFullChargeDeadline:(id)a3;
- (void)setProductID:(id)a3;
- (void)setRatchet:(id)a3;
- (void)setReserved:(id)a3;
- (void)setSettingsMask:(id)a3;
- (void)setSpatialAudio:(id)a3;
- (void)setSupportedServices:(id)a3;
- (void)setVendorID:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation BTMagicPairingSettings

+ (id)magicSettingsWithBluetoothAddress:(id)a3
{
  id v3 = a3;
  v4 = [[BTMagicPairingSettings alloc] initWithBluetoothAddress:v3];

  return v4;
}

- (BTMagicPairingSettings)initWithBluetoothAddress:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BTMagicPairingSettings;
  v5 = [(BTMagicPairingSettings *)&v8 init];
  v6 = v5;
  if (v5) {
    [(BTMagicPairingSettings *)v5 setBluetoothAddress:v4];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(BTMagicPairingSettings *)self bluetoothAddress];
  v6 = NSStringFromSelector(sel_bluetoothAddress);
  [v4 encodeObject:v5 forKey:v6];

  v7 = [(BTMagicPairingSettings *)self name];
  objc_super v8 = NSStringFromSelector(sel_name);
  [v4 encodeObject:v7 forKey:v8];

  v9 = [(BTMagicPairingSettings *)self masterHint];
  v10 = NSStringFromSelector(sel_masterHint);
  [v4 encodeObject:v9 forKey:v10];

  v11 = [(BTMagicPairingSettings *)self masterKey];
  v12 = NSStringFromSelector(sel_masterKey);
  [v4 encodeObject:v11 forKey:v12];

  v13 = [(BTMagicPairingSettings *)self accessoryHint];
  v14 = NSStringFromSelector(sel_accessoryHint);
  [v4 encodeObject:v13 forKey:v14];

  v15 = [(BTMagicPairingSettings *)self accessoryKey];
  v16 = NSStringFromSelector(sel_accessoryKey);
  [v4 encodeObject:v15 forKey:v16];

  v17 = [(BTMagicPairingSettings *)self buttonModes];
  v18 = NSStringFromSelector(sel_buttonModes);
  [v4 encodeObject:v17 forKey:v18];

  v19 = [(BTMagicPairingSettings *)self color];
  v20 = NSStringFromSelector(sel_color);
  [v4 encodeObject:v19 forKey:v20];

  v21 = [(BTMagicPairingSettings *)self deviceIDFeatureBitsV1];
  v22 = NSStringFromSelector(sel_deviceIDFeatureBitsV1);
  [v4 encodeObject:v21 forKey:v22];

  v23 = [(BTMagicPairingSettings *)self deviceIDFeatureBitsV2];
  v24 = NSStringFromSelector(sel_deviceIDFeatureBitsV2);
  [v4 encodeObject:v23 forKey:v24];

  v25 = [(BTMagicPairingSettings *)self encryptionKey];
  v26 = NSStringFromSelector(sel_encryptionKey);
  [v4 encodeObject:v25 forKey:v26];

  v27 = [(BTMagicPairingSettings *)self irk];
  v28 = NSStringFromSelector("irk");
  [v4 encodeObject:v27 forKey:v28];

  v29 = [(BTMagicPairingSettings *)self listeningServices];
  v30 = NSStringFromSelector(sel_listeningServices);
  [v4 encodeObject:v29 forKey:v30];

  v31 = [(BTMagicPairingSettings *)self listeningServicesV2];
  v32 = NSStringFromSelector(sel_listeningServicesV2);
  [v4 encodeObject:v31 forKey:v32];

  v33 = [(BTMagicPairingSettings *)self optimizedBatteryCharging];
  v34 = NSStringFromSelector(sel_optimizedBatteryCharging);
  [v4 encodeObject:v33 forKey:v34];

  v35 = [(BTMagicPairingSettings *)self optimizedBatteryFullChargeDeadline];
  v36 = NSStringFromSelector(sel_optimizedBatteryFullChargeDeadline);
  [v4 encodeObject:v35 forKey:v36];

  v37 = [(BTMagicPairingSettings *)self ratchet];
  v38 = NSStringFromSelector(sel_ratchet);
  [v4 encodeObject:v37 forKey:v38];

  v39 = [(BTMagicPairingSettings *)self reserved];
  v40 = NSStringFromSelector(sel_reserved);
  [v4 encodeObject:v39 forKey:v40];

  v41 = [(BTMagicPairingSettings *)self settingsMask];
  v42 = NSStringFromSelector(sel_settingsMask);
  [v4 encodeObject:v41 forKey:v42];

  v43 = [(BTMagicPairingSettings *)self supportedServices];
  v44 = NSStringFromSelector(sel_supportedServices);
  [v4 encodeObject:v43 forKey:v44];

  v45 = [(BTMagicPairingSettings *)self version];
  v46 = NSStringFromSelector(sel_version);
  [v4 encodeObject:v45 forKey:v46];

  v47 = [(BTMagicPairingSettings *)self vendorID];
  v48 = NSStringFromSelector(sel_vendorID);
  [v4 encodeObject:v47 forKey:v48];

  id v50 = [(BTMagicPairingSettings *)self productID];
  v49 = NSStringFromSelector(sel_productID);
  [v4 encodeObject:v50 forKey:v49];
}

- (BTMagicPairingSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v77.receiver = self;
  v77.super_class = (Class)BTMagicPairingSettings;
  v5 = [(BTMagicPairingSettings *)&v77 init];
  if (!v5) {
    goto LABEL_4;
  }
  uint64_t v6 = objc_opt_class();
  v7 = NSStringFromSelector(sel_bluetoothAddress);
  objc_super v8 = [v4 decodeObjectOfClass:v6 forKey:v7];

  if (v8)
  {
    [(BTMagicPairingSettings *)v5 setBluetoothAddress:v8];
    uint64_t v9 = objc_opt_class();
    v10 = NSStringFromSelector(sel_name);
    v11 = [v4 decodeObjectOfClass:v9 forKey:v10];
    [(BTMagicPairingSettings *)v5 setName:v11];

    uint64_t v12 = objc_opt_class();
    v13 = NSStringFromSelector(sel_masterHint);
    v14 = [v4 decodeObjectOfClass:v12 forKey:v13];
    [(BTMagicPairingSettings *)v5 setMasterHint:v14];

    uint64_t v15 = objc_opt_class();
    v16 = NSStringFromSelector(sel_masterKey);
    v17 = [v4 decodeObjectOfClass:v15 forKey:v16];
    [(BTMagicPairingSettings *)v5 setMasterKey:v17];

    uint64_t v18 = objc_opt_class();
    v19 = NSStringFromSelector(sel_accessoryHint);
    v20 = [v4 decodeObjectOfClass:v18 forKey:v19];
    [(BTMagicPairingSettings *)v5 setAccessoryHint:v20];

    uint64_t v21 = objc_opt_class();
    v22 = NSStringFromSelector(sel_accessoryKey);
    v23 = [v4 decodeObjectOfClass:v21 forKey:v22];
    [(BTMagicPairingSettings *)v5 setAccessoryKey:v23];

    uint64_t v24 = objc_opt_class();
    v25 = NSStringFromSelector(sel_buttonModes);
    v26 = [v4 decodeObjectOfClass:v24 forKey:v25];
    [(BTMagicPairingSettings *)v5 setButtonModes:v26];

    uint64_t v27 = objc_opt_class();
    v28 = NSStringFromSelector(sel_color);
    v29 = [v4 decodeObjectOfClass:v27 forKey:v28];
    [(BTMagicPairingSettings *)v5 setColor:v29];

    uint64_t v30 = objc_opt_class();
    v31 = NSStringFromSelector(sel_deviceIDFeatureBitsV1);
    v32 = [v4 decodeObjectOfClass:v30 forKey:v31];
    [(BTMagicPairingSettings *)v5 setDeviceIDFeatureBitsV1:v32];

    uint64_t v33 = objc_opt_class();
    v34 = NSStringFromSelector(sel_deviceIDFeatureBitsV2);
    v35 = [v4 decodeObjectOfClass:v33 forKey:v34];
    [(BTMagicPairingSettings *)v5 setDeviceIDFeatureBitsV2:v35];

    uint64_t v36 = objc_opt_class();
    v37 = NSStringFromSelector(sel_encryptionKey);
    v38 = [v4 decodeObjectOfClass:v36 forKey:v37];
    [(BTMagicPairingSettings *)v5 setEncryptionKey:v38];

    uint64_t v39 = objc_opt_class();
    v40 = NSStringFromSelector("irk");
    v41 = [v4 decodeObjectOfClass:v39 forKey:v40];
    [(BTMagicPairingSettings *)v5 setIrk:v41];

    uint64_t v42 = objc_opt_class();
    v43 = NSStringFromSelector(sel_listeningServices);
    v44 = [v4 decodeObjectOfClass:v42 forKey:v43];
    [(BTMagicPairingSettings *)v5 setListeningServices:v44];

    uint64_t v45 = objc_opt_class();
    v46 = NSStringFromSelector(sel_listeningServicesV2);
    v47 = [v4 decodeObjectOfClass:v45 forKey:v46];
    [(BTMagicPairingSettings *)v5 setListeningServicesV2:v47];

    uint64_t v48 = objc_opt_class();
    v49 = NSStringFromSelector(sel_optimizedBatteryCharging);
    id v50 = [v4 decodeObjectOfClass:v48 forKey:v49];
    [(BTMagicPairingSettings *)v5 setOptimizedBatteryCharging:v50];

    uint64_t v51 = objc_opt_class();
    v52 = NSStringFromSelector(sel_optimizedBatteryFullChargeDeadline);
    v53 = [v4 decodeObjectOfClass:v51 forKey:v52];
    [(BTMagicPairingSettings *)v5 setOptimizedBatteryFullChargeDeadline:v53];

    uint64_t v54 = objc_opt_class();
    v55 = NSStringFromSelector(sel_ratchet);
    v56 = [v4 decodeObjectOfClass:v54 forKey:v55];
    [(BTMagicPairingSettings *)v5 setRatchet:v56];

    uint64_t v57 = objc_opt_class();
    v58 = NSStringFromSelector(sel_reserved);
    v59 = [v4 decodeObjectOfClass:v57 forKey:v58];
    [(BTMagicPairingSettings *)v5 setReserved:v59];

    uint64_t v60 = objc_opt_class();
    v61 = NSStringFromSelector(sel_settingsMask);
    v62 = [v4 decodeObjectOfClass:v60 forKey:v61];
    [(BTMagicPairingSettings *)v5 setSettingsMask:v62];

    uint64_t v63 = objc_opt_class();
    v64 = NSStringFromSelector(sel_supportedServices);
    v65 = [v4 decodeObjectOfClass:v63 forKey:v64];
    [(BTMagicPairingSettings *)v5 setSupportedServices:v65];

    uint64_t v66 = objc_opt_class();
    v67 = NSStringFromSelector(sel_version);
    v68 = [v4 decodeObjectOfClass:v66 forKey:v67];
    [(BTMagicPairingSettings *)v5 setVersion:v68];

    uint64_t v69 = objc_opt_class();
    v70 = NSStringFromSelector(sel_vendorID);
    v71 = [v4 decodeObjectOfClass:v69 forKey:v70];
    [(BTMagicPairingSettings *)v5 setVendorID:v71];

    uint64_t v72 = objc_opt_class();
    v73 = NSStringFromSelector(sel_productID);
    v74 = [v4 decodeObjectOfClass:v72 forKey:v73];
    [(BTMagicPairingSettings *)v5 setProductID:v74];

LABEL_4:
    v75 = v5;
    goto LABEL_10;
  }
  if (gLogCategory_BTCloudDevice <= 90 && (gLogCategory_BTCloudDevice != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v75 = 0;
LABEL_10:

  return v75;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  int v3 = IsAppleInternalBuild();
  id v4 = NSString;
  v5 = [(BTMagicPairingSettings *)self bluetoothAddress];
  uint64_t v6 = [(BTMagicPairingSettings *)self name];
  uint64_t v7 = [v6 length];
  if (v3)
  {
    uint64_t v26 = [(BTMagicPairingSettings *)self name];
    uint64_t v24 = [(BTMagicPairingSettings *)self productID];
    v35 = [(BTMagicPairingSettings *)self vendorID];
    v23 = [(BTMagicPairingSettings *)self masterKey];
    v34 = [(BTMagicPairingSettings *)self accessoryKey];
    uint64_t v33 = [(BTMagicPairingSettings *)self masterHint];
    [(BTMagicPairingSettings *)self accessoryHint];
    v32 = uint64_t v22 = v7;
    v31 = [(BTMagicPairingSettings *)self irk];
    uint64_t v30 = [(BTMagicPairingSettings *)self encryptionKey];
    v29 = [(BTMagicPairingSettings *)self version];
    v28 = [(BTMagicPairingSettings *)self color];
    uint64_t v21 = [(BTMagicPairingSettings *)self ratchet];
    [(BTMagicPairingSettings *)self buttonModes];
    objc_super v8 = v36 = v5;
    v20 = [(BTMagicPairingSettings *)self deviceIDFeatureBitsV1];
    [(BTMagicPairingSettings *)self deviceIDFeatureBitsV2];
    uint64_t v9 = v27 = v6;
    v19 = [(BTMagicPairingSettings *)self listeningServices];
    v10 = [(BTMagicPairingSettings *)self listeningServicesV2];
    v11 = [(BTMagicPairingSettings *)self settingsMask];
    uint64_t v12 = [(BTMagicPairingSettings *)self supportedServices];
    v13 = [(BTMagicPairingSettings *)self optimizedBatteryCharging];
    v14 = [(BTMagicPairingSettings *)self optimizedBatteryFullChargeDeadline];
    uint64_t v15 = (void *)v24;
    v16 = (void *)v26;
    objc_msgSend(v4, "stringWithFormat:", @"BTMagicPairingSettings[%@]: Name(%ld): %@, PID: %@, VID: %@, MainKey: %@, AccKey: %@, MainHint: %@, AccHint: %@, IRK: %@, Enc: %@, V: %@, C: %@, R: %@, BM: %@, DID1: %@, DID2: %@, LS: %@, LSv2: %@, S: %@, SS: %@, OBC: %@-%@", v36, v22, v26, v24, v35, v23, v34, v33, v32, v31, v30, v29, v28, v21, v8, v20,
      v9,
      v19,
      v10,
      v11,
      v12,
      v13,
    uint64_t v25 = v14);

    uint64_t v6 = v27;
    v5 = v36;

    v17 = (void *)v25;
  }
  else
  {
    v16 = [(BTMagicPairingSettings *)self productID];
    uint64_t v15 = [(BTMagicPairingSettings *)self vendorID];
    v17 = [v4 stringWithFormat:@"BTMagicPairingSettings[%@]: Name(%ld), PID: %@, VID: %@", v5, v7, v16, v15];
  }

  return v17;
}

- (NSString)bluetoothAddress
{
  return self->_bluetoothAddress;
}

- (void)setBluetoothAddress:(id)a3
{
}

- (NSData)masterKey
{
  return self->_masterKey;
}

- (void)setMasterKey:(id)a3
{
}

- (NSData)masterHint
{
  return self->_masterHint;
}

- (void)setMasterHint:(id)a3
{
}

- (NSData)accessoryKey
{
  return self->_accessoryKey;
}

- (void)setAccessoryKey:(id)a3
{
}

- (NSData)accessoryHint
{
  return self->_accessoryHint;
}

- (void)setAccessoryHint:(id)a3
{
}

- (NSData)encryptionKey
{
  return self->_encryptionKey;
}

- (void)setEncryptionKey:(id)a3
{
}

- (NSData)irk
{
  return self->_irk;
}

- (void)setIrk:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)productID
{
  return self->_productID;
}

- (void)setProductID:(id)a3
{
}

- (NSString)vendorID
{
  return self->_vendorID;
}

- (void)setVendorID:(id)a3
{
}

- (NSString)buttonModes
{
  return self->_buttonModes;
}

- (void)setButtonModes:(id)a3
{
}

- (NSString)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (NSString)deviceIDFeatureBitsV1
{
  return self->_deviceIDFeatureBitsV1;
}

- (void)setDeviceIDFeatureBitsV1:(id)a3
{
}

- (NSString)deviceIDFeatureBitsV2
{
  return self->_deviceIDFeatureBitsV2;
}

- (void)setDeviceIDFeatureBitsV2:(id)a3
{
}

- (NSString)listeningServices
{
  return self->_listeningServices;
}

- (void)setListeningServices:(id)a3
{
}

- (NSString)listeningServicesV2
{
  return self->_listeningServicesV2;
}

- (void)setListeningServicesV2:(id)a3
{
}

- (NSString)spatialAudio
{
  return self->_spatialAudio;
}

- (void)setSpatialAudio:(id)a3
{
}

- (NSString)optimizedBatteryCharging
{
  return self->_optimizedBatteryCharging;
}

- (void)setOptimizedBatteryCharging:(id)a3
{
}

- (NSString)optimizedBatteryFullChargeDeadline
{
  return self->_optimizedBatteryFullChargeDeadline;
}

- (void)setOptimizedBatteryFullChargeDeadline:(id)a3
{
}

- (NSString)ratchet
{
  return self->_ratchet;
}

- (void)setRatchet:(id)a3
{
}

- (NSString)reserved
{
  return self->_reserved;
}

- (void)setReserved:(id)a3
{
}

- (NSString)settingsMask
{
  return self->_settingsMask;
}

- (void)setSettingsMask:(id)a3
{
}

- (NSString)supportedServices
{
  return self->_supportedServices;
}

- (void)setSupportedServices:(id)a3
{
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_supportedServices, 0);
  objc_storeStrong((id *)&self->_settingsMask, 0);
  objc_storeStrong((id *)&self->_reserved, 0);
  objc_storeStrong((id *)&self->_ratchet, 0);
  objc_storeStrong((id *)&self->_optimizedBatteryFullChargeDeadline, 0);
  objc_storeStrong((id *)&self->_optimizedBatteryCharging, 0);
  objc_storeStrong((id *)&self->_spatialAudio, 0);
  objc_storeStrong((id *)&self->_listeningServicesV2, 0);
  objc_storeStrong((id *)&self->_listeningServices, 0);
  objc_storeStrong((id *)&self->_deviceIDFeatureBitsV2, 0);
  objc_storeStrong((id *)&self->_deviceIDFeatureBitsV1, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_buttonModes, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);
  objc_storeStrong((id *)&self->_productID, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_irk, 0);
  objc_storeStrong((id *)&self->_encryptionKey, 0);
  objc_storeStrong((id *)&self->_accessoryHint, 0);
  objc_storeStrong((id *)&self->_accessoryKey, 0);
  objc_storeStrong((id *)&self->_masterHint, 0);
  objc_storeStrong((id *)&self->_masterKey, 0);

  objc_storeStrong((id *)&self->_bluetoothAddress, 0);
}

@end