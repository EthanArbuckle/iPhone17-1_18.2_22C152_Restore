@interface HAPBLEPeripheral
+ (id)uuidForBTLEPeripheral:(id)a3;
- (BOOL)isBroadcasting;
- (BOOL)isCached;
- (BOOL)isEqual:(id)a3;
- (BOOL)isReachable;
- (BOOL)updateWithPeripheral:(id)a3;
- (CBPeripheral)cbPeripheral;
- (HAPBLEPeripheral)initWithName:(id)a3 peripheralUUID:(id)a4 identifier:(id)a5 hapVersion:(id)a6 hkType:(id)a7 advInterval:(id)a8 statusFlags:(id)a9 category:(id)a10 stateNumber:(id)a11 configNumber:(id)a12 setupHash:(id)a13 encryptedPayload:(id)a14 whbStableIdentifier:(id)a15 advDeviceAddress:(id)a16;
- (NSArray)peripheralUUIDs;
- (NSData)encryptedPayload;
- (NSData)setupHash;
- (NSMutableArray)cbPeripheralUUIDs;
- (NSNumber)advInterval;
- (NSNumber)averageRSSI;
- (NSNumber)category;
- (NSNumber)configNumber;
- (NSNumber)hkType;
- (NSNumber)stateNumber;
- (NSNumber)statusFlags;
- (NSString)advDeviceAddress;
- (NSString)identifier;
- (NSString)name;
- (NSString)whbStableIdentifier;
- (NSUUID)uniqueBTIdentifier;
- (double)lastSeen;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)shortDescription;
- (int64_t)compareConfigNumber:(id)a3;
- (int64_t)compareStateNumber:(id)a3;
- (unint64_t)advertisementFormat;
- (unint64_t)hash;
- (void)_updateAverageRSSIWithRSSI:(id)a3;
- (void)connectedToCBPeripheral:(id)a3 error:(id)a4;
- (void)disconnectedFromCBPeripheral:(id)a3 shouldRemove:(BOOL)a4;
- (void)mergeWithPeripheral:(id)a3;
- (void)reset;
- (void)setAdvDeviceAddress:(id)a3;
- (void)setAdvInterval:(id)a3;
- (void)setAdvertisementFormat:(unint64_t)a3;
- (void)setAverageRSSI:(id)a3;
- (void)setCategory:(id)a3;
- (void)setCbPeripheral:(id)a3;
- (void)setCbPeripheralUUIDs:(id)a3;
- (void)setConfigNumber:(id)a3;
- (void)setEncryptedPayload:(id)a3;
- (void)setHkType:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsCached:(BOOL)a3;
- (void)setLastSeen:(double)a3;
- (void)setName:(id)a3;
- (void)setSetupHash:(id)a3;
- (void)setStateNumber:(id)a3;
- (void)setStatusFlags:(id)a3;
- (void)setWhbStableIdentifier:(id)a3;
- (void)updateStateNumber:(id)a3;
@end

@implementation HAPBLEPeripheral

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cbPeripheralUUIDs, 0);
  objc_storeStrong((id *)&self->_whbStableIdentifier, 0);
  objc_storeStrong((id *)&self->_cbPeripheral, 0);
  objc_storeStrong((id *)&self->_averageRSSI, 0);
  objc_storeStrong((id *)&self->_encryptedPayload, 0);
  objc_storeStrong((id *)&self->_setupHash, 0);
  objc_storeStrong((id *)&self->_configNumber, 0);
  objc_storeStrong((id *)&self->_stateNumber, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_statusFlags, 0);
  objc_storeStrong((id *)&self->_advDeviceAddress, 0);
  objc_storeStrong((id *)&self->_advInterval, 0);
  objc_storeStrong((id *)&self->_hkType, 0);
  objc_storeStrong((id *)&self->_uniqueBTIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setCbPeripheralUUIDs:(id)a3
{
}

- (NSMutableArray)cbPeripheralUUIDs
{
  return self->_cbPeripheralUUIDs;
}

- (void)setWhbStableIdentifier:(id)a3
{
}

- (NSString)whbStableIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setCbPeripheral:(id)a3
{
}

- (CBPeripheral)cbPeripheral
{
  return (CBPeripheral *)objc_getProperty(self, a2, 136, 1);
}

- (void)setAdvertisementFormat:(unint64_t)a3
{
  self->_advertisementFormat = a3;
}

- (unint64_t)advertisementFormat
{
  return self->_advertisementFormat;
}

- (void)setIsCached:(BOOL)a3
{
  self->_isCached = a3;
}

- (BOOL)isCached
{
  return self->_isCached;
}

- (void)setLastSeen:(double)a3
{
  self->_lastSeen = a3;
}

- (double)lastSeen
{
  return self->_lastSeen;
}

- (void)setAverageRSSI:(id)a3
{
}

- (NSNumber)averageRSSI
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void)setEncryptedPayload:(id)a3
{
}

- (NSData)encryptedPayload
{
  return (NSData *)objc_getProperty(self, a2, 104, 1);
}

- (void)setSetupHash:(id)a3
{
}

- (NSData)setupHash
{
  return (NSData *)objc_getProperty(self, a2, 96, 1);
}

- (void)setConfigNumber:(id)a3
{
}

- (NSNumber)configNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setStateNumber:(id)a3
{
}

- (NSNumber)stateNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 80, 1);
}

- (void)setCategory:(id)a3
{
}

- (NSNumber)category
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (void)setStatusFlags:(id)a3
{
}

- (NSNumber)statusFlags
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAdvDeviceAddress:(id)a3
{
}

- (NSString)advDeviceAddress
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAdvInterval:(id)a3
{
}

- (NSNumber)advInterval
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setHkType:(id)a3
{
}

- (NSNumber)hkType
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (NSUUID)uniqueBTIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)disconnectedFromCBPeripheral:(id)a3 shouldRemove:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  [(HAPBLEPeripheral *)self setCbPeripheral:0];
  if (v9 && v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    cbPeripheralUUIDs = self->_cbPeripheralUUIDs;
    v8 = [v9 identifier];
    [(NSMutableArray *)cbPeripheralUUIDs removeObject:v8];

    os_unfair_lock_unlock(p_lock);
  }
}

- (void)connectedToCBPeripheral:(id)a3 error:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  id v7 = v14;
  if (v6)
  {
    os_unfair_lock_lock_with_options();
    v8 = [(HAPBLEPeripheral *)self cbPeripheral];

    if (v8)
    {
      cbPeripheralUUIDs = self->_cbPeripheralUUIDs;
      v10 = [(HAPBLEPeripheral *)self cbPeripheral];
      v11 = [v10 identifier];
      [(NSMutableArray *)cbPeripheralUUIDs removeObject:v11];
    }
    if (v14)
    {
      v12 = self->_cbPeripheralUUIDs;
      v13 = [v14 identifier];
      [(NSMutableArray *)v12 removeObject:v13];
    }
    os_unfair_lock_unlock(&self->_lock);
    id v7 = 0;
  }
  [(HAPBLEPeripheral *)self setCbPeripheral:v7];
}

- (void)mergeWithPeripheral:(id)a3
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (HAPBLEPeripheral *)a3;
  if (self == v4) {
    goto LABEL_104;
  }
  v5 = [(HAPBLEPeripheral *)self identifier];
  id v6 = [(HAPBLEPeripheral *)v4 identifier];
  int v7 = [v5 isEqualToString:v6];

  if (!v7) {
    goto LABEL_104;
  }
  [(HAPBLEPeripheral *)v4 lastSeen];
  double v9 = v8;
  [(HAPBLEPeripheral *)self lastSeen];
  double v11 = v9 - v10;
  if (v11 > 0.0)
  {
    [(HAPBLEPeripheral *)v4 lastSeen];
    -[HAPBLEPeripheral setLastSeen:](self, "setLastSeen:");
    v12 = [(HAPBLEPeripheral *)v4 encryptedPayload];
    [(HAPBLEPeripheral *)self setEncryptedPayload:v12];

    [(HAPBLEPeripheral *)self setIsCached:[(HAPBLEPeripheral *)v4 isCached]];
    v13 = [(HAPBLEPeripheral *)v4 averageRSSI];

    if (v13)
    {
      id v14 = [(HAPBLEPeripheral *)v4 averageRSSI];
      [(HAPBLEPeripheral *)self _updateAverageRSSIWithRSSI:v14];
    }
    uint64_t v15 = [(HAPBLEPeripheral *)v4 cbPeripheral];
    if (v15)
    {
      v16 = (void *)v15;
      v17 = [(HAPBLEPeripheral *)self cbPeripheral];

      if (!v17)
      {
        v18 = (void *)MEMORY[0x1D944E080]();
        v19 = self;
        v20 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          v21 = HMFGetLogIdentifier();
          v22 = [(HAPBLEPeripheral *)v19 shortDescription];
          v23 = [(HAPBLEPeripheral *)v4 cbPeripheral];
          *(_DWORD *)buf = 138543874;
          v102 = v21;
          __int16 v103 = 2112;
          v104 = v22;
          __int16 v105 = 2112;
          v106 = v23;
          _os_log_impl(&dword_1D4758000, v20, OS_LOG_TYPE_INFO, "%{public}@Updating the BLE peripheral: %@ with CBPeripheral: %@", buf, 0x20u);
        }
        v24 = [(HAPBLEPeripheral *)v4 cbPeripheral];
        [(HAPBLEPeripheral *)v19 setCbPeripheral:v24];
      }
    }
  }
  v25 = [(HAPBLEPeripheral *)v4 identifier];
  v26 = v25;
  if (v11 > 0.0 || v25 == 0)
  {

    if (v26)
    {
LABEL_17:
      v28 = [(HAPBLEPeripheral *)v4 identifier];
      [(HAPBLEPeripheral *)self setIdentifier:v28];
    }
  }
  else
  {
    v32 = [(HAPBLEPeripheral *)self identifier];

    if (!v32) {
      goto LABEL_17;
    }
  }
  v29 = [(HAPBLEPeripheral *)v4 whbStableIdentifier];
  v30 = v29;
  if (v11 <= 0.0 && v29)
  {
    v31 = [(HAPBLEPeripheral *)self whbStableIdentifier];

    if (!v31) {
      goto LABEL_25;
    }
  }
  else
  {

    if (v30)
    {
LABEL_25:
      v33 = [(HAPBLEPeripheral *)v4 whbStableIdentifier];
      [(HAPBLEPeripheral *)self setWhbStableIdentifier:v33];
    }
  }
  v34 = [(HAPBLEPeripheral *)v4 hkType];
  v35 = v34;
  if (v11 <= 0.0 && v34)
  {
    v36 = [(HAPBLEPeripheral *)self hkType];

    if (!v36) {
      goto LABEL_31;
    }
  }
  else
  {

    if (v35)
    {
LABEL_31:
      v37 = [(HAPBLEPeripheral *)v4 hkType];
      [(HAPBLEPeripheral *)self setHkType:v37];
    }
  }
  v38 = [(HAPBLEPeripheral *)v4 advInterval];
  v39 = v38;
  if (v11 <= 0.0 && v38)
  {
    v40 = [(HAPBLEPeripheral *)self advInterval];

    if (!v40) {
      goto LABEL_37;
    }
  }
  else
  {

    if (v39)
    {
LABEL_37:
      v41 = [(HAPBLEPeripheral *)v4 advInterval];
      [(HAPBLEPeripheral *)self setAdvInterval:v41];
    }
  }
  if ([(HAPBLEPeripheral *)v4 advertisementFormat]
    && (v11 > 0.0 || ![(HAPBLEPeripheral *)self advertisementFormat]))
  {
    [(HAPBLEPeripheral *)self setAdvertisementFormat:[(HAPBLEPeripheral *)v4 advertisementFormat]];
  }
  v42 = [(HAPBLEPeripheral *)v4 statusFlags];
  v43 = v42;
  if (v11 <= 0.0 && v42)
  {
    v44 = [(HAPBLEPeripheral *)self statusFlags];

    if (!v44) {
      goto LABEL_47;
    }
  }
  else
  {

    if (v43)
    {
LABEL_47:
      v45 = [(HAPBLEPeripheral *)v4 statusFlags];
      [(HAPBLEPeripheral *)self setStatusFlags:v45];
    }
  }
  v46 = [(HAPBLEPeripheral *)v4 category];
  v47 = v46;
  if (v11 <= 0.0 && v46)
  {
    v48 = [(HAPBLEPeripheral *)self category];

    if (!v48) {
      goto LABEL_53;
    }
  }
  else
  {

    if (v47)
    {
LABEL_53:
      v49 = [(HAPBLEPeripheral *)v4 category];
      [(HAPBLEPeripheral *)self setCategory:v49];
    }
  }
  v50 = [(HAPBLEPeripheral *)v4 stateNumber];
  v51 = v50;
  if (v11 <= 0.0 && v50)
  {
    v52 = [(HAPBLEPeripheral *)self stateNumber];

    if (v52) {
      goto LABEL_62;
    }
  }
  else
  {

    if (!v51) {
      goto LABEL_62;
    }
  }
  if (![(HAPBLEPeripheral *)v4 isCached]
    || ([(HAPBLEPeripheral *)v4 stateNumber],
        v53 = objc_claimAutoreleasedReturnValue(),
        int64_t v54 = [(HAPBLEPeripheral *)self compareStateNumber:v53],
        v53,
        v54 == -1))
  {
    v55 = [(HAPBLEPeripheral *)v4 stateNumber];
    [(HAPBLEPeripheral *)self setStateNumber:v55];
  }
LABEL_62:
  v56 = [(HAPBLEPeripheral *)v4 configNumber];
  v57 = v56;
  if (v11 <= 0.0 && v56)
  {
    v58 = [(HAPBLEPeripheral *)self configNumber];

    if (v58) {
      goto LABEL_70;
    }
  }
  else
  {

    if (!v57) {
      goto LABEL_70;
    }
  }
  if (![(HAPBLEPeripheral *)v4 isCached]
    || ([(HAPBLEPeripheral *)v4 configNumber],
        v59 = objc_claimAutoreleasedReturnValue(),
        int64_t v60 = [(HAPBLEPeripheral *)self compareConfigNumber:v59],
        v59,
        v60 == -1))
  {
    v61 = [(HAPBLEPeripheral *)v4 configNumber];
    [(HAPBLEPeripheral *)self setConfigNumber:v61];
  }
LABEL_70:
  v62 = [(HAPBLEPeripheral *)v4 setupHash];
  v63 = v62;
  if (v11 <= 0.0 && v62)
  {
    v64 = [(HAPBLEPeripheral *)self setupHash];

    if (!v64) {
      goto LABEL_75;
    }
  }
  else
  {

    if (v63)
    {
LABEL_75:
      v65 = [(HAPBLEPeripheral *)v4 setupHash];
      [(HAPBLEPeripheral *)self setSetupHash:v65];
    }
  }
  v66 = [(HAPBLEPeripheral *)v4 averageRSSI];
  v67 = v66;
  if (v11 <= 0.0 && v66)
  {
    v68 = [(HAPBLEPeripheral *)self averageRSSI];

    if (!v68) {
      goto LABEL_81;
    }
  }
  else
  {

    if (v67)
    {
LABEL_81:
      v69 = [(HAPBLEPeripheral *)v4 averageRSSI];
      [(HAPBLEPeripheral *)self setAverageRSSI:v69];
    }
  }
  v70 = [(HAPBLEPeripheral *)self name];
  unint64_t v71 = [v70 length];
  v72 = [(HAPBLEPeripheral *)v4 name];
  unint64_t v73 = [v72 length];

  if (v71 < v73)
  {
    v74 = [(HAPBLEPeripheral *)v4 name];
    [(HAPBLEPeripheral *)self setName:v74];
  }
  uint64_t v75 = [(HAPBLEPeripheral *)v4 peripheralUUIDs];
  if (v75)
  {
    v76 = (void *)v75;
    v77 = [(HAPBLEPeripheral *)self peripheralUUIDs];
    v78 = [(HAPBLEPeripheral *)v4 peripheralUUIDs];
    char v79 = [v77 isEqual:v78];

    if ((v79 & 1) == 0)
    {
      if (v11 <= 0.0) {
        v80 = v4;
      }
      else {
        v80 = self;
      }
      if (v11 <= 0.0) {
        v81 = self;
      }
      else {
        v81 = v4;
      }
      v82 = [(HAPBLEPeripheral *)v80 peripheralUUIDs];
      v83 = (void *)[v82 mutableCopy];

      long long v98 = 0u;
      long long v99 = 0u;
      long long v96 = 0u;
      long long v97 = 0u;
      v84 = [(HAPBLEPeripheral *)v81 peripheralUUIDs];
      uint64_t v85 = [v84 countByEnumeratingWithState:&v96 objects:v100 count:16];
      if (v85)
      {
        uint64_t v86 = v85;
        uint64_t v87 = *(void *)v97;
        do
        {
          for (uint64_t i = 0; i != v86; ++i)
          {
            if (*(void *)v97 != v87) {
              objc_enumerationMutation(v84);
            }
            uint64_t v89 = *(void *)(*((void *)&v96 + 1) + 8 * i);
            [v83 removeObject:v89];
            [v83 addObject:v89];
          }
          uint64_t v86 = [v84 countByEnumeratingWithState:&v96 objects:v100 count:16];
        }
        while (v86);
      }

      v90 = [(HAPBLEPeripheral *)self cbPeripheral];
      uint64_t v91 = [v90 state];

      if (v91)
      {
        v92 = [(HAPBLEPeripheral *)self cbPeripheral];
        v93 = [v92 identifier];
        [v83 removeObject:v93];

        v94 = [(HAPBLEPeripheral *)self cbPeripheral];
        v95 = [v94 identifier];
        [v83 addObject:v95];
      }
      if ((unint64_t)[v83 count] >= 6) {
        objc_msgSend(v83, "removeObjectsInRange:", 0, objc_msgSend(v83, "count") - 5);
      }
      os_unfair_lock_lock_with_options();
      objc_storeStrong((id *)&self->_cbPeripheralUUIDs, v83);
      os_unfair_lock_unlock(&self->_lock);
    }
  }
LABEL_104:
}

- (void)reset
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_lastSeen = 0.0;
  encryptedPayload = self->_encryptedPayload;
  self->_encryptedPayload = 0;

  averageRSSI = self->_averageRSSI;
  self->_averageRSSI = (NSNumber *)&unk_1F2C80B20;

  [(NSMutableArray *)self->_cbPeripheralUUIDs removeAllObjects];

  os_unfair_lock_unlock(p_lock);
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v4 = objc_alloc_init(HAPBLEPeripheral);
  uint64_t v5 = [(HAPBLEPeripheral *)self identifier];
  identifier = v4->_identifier;
  v4->_identifier = (NSString *)v5;

  uint64_t v7 = [(HAPBLEPeripheral *)self uniqueBTIdentifier];
  uniqueBTIdentifier = v4->_uniqueBTIdentifier;
  v4->_uniqueBTIdentifier = (NSUUID *)v7;

  uint64_t v9 = [(HAPBLEPeripheral *)self advDeviceAddress];
  advDeviceAddress = v4->_advDeviceAddress;
  v4->_advDeviceAddress = (NSString *)v9;

  double v11 = [(HAPBLEPeripheral *)self peripheralUUIDs];
  uint64_t v12 = [v11 mutableCopy];
  cbPeripheralUUIDs = v4->_cbPeripheralUUIDs;
  v4->_cbPeripheralUUIDs = (NSMutableArray *)v12;

  if (HAPIsHH2Enabled_onceToken != -1) {
    dispatch_once(&HAPIsHH2Enabled_onceToken, &__block_literal_global_12024);
  }
  if ((HAPIsHH2Enabled_hh2Enabled & 1) == 0)
  {
    uint64_t v14 = [(HAPBLEPeripheral *)self cbPeripheral];
    cbPeripheral = v4->_cbPeripheral;
    v4->_cbPeripheral = (CBPeripheral *)v14;
  }
  [(HAPBLEPeripheral *)v4 mergeWithPeripheral:self];
  return v4;
}

- (BOOL)isReachable
{
  double Current = CFAbsoluteTimeGetCurrent();
  [(HAPBLEPeripheral *)self lastSeen];
  if (v4 <= 0.0) {
    return 0;
  }
  [(HAPBLEPeripheral *)self lastSeen];
  return Current - v5 < 600.0;
}

- (NSArray)peripheralUUIDs
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  double v4 = (void *)[(NSMutableArray *)self->_cbPeripheralUUIDs copy];
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v4;
}

- (BOOL)isBroadcasting
{
  v2 = [(HAPBLEPeripheral *)self encryptedPayload];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_updateAverageRSSIWithRSSI:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v12 = v4;
    double v5 = [(HAPBLEPeripheral *)self averageRSSI];
    if (v5)
    {
      id v6 = NSNumber;
      uint64_t v7 = [(HAPBLEPeripheral *)self averageRSSI];
      uint64_t v8 = [v7 integerValue];
      uint64_t v9 = [v12 integerValue];
      uint64_t v10 = v9 + v8;
      if (v9 + v8 < 0 != __OFADD__(v9, v8)) {
        ++v10;
      }
      double v11 = [v6 numberWithInteger:v10 >> 1];
      [(HAPBLEPeripheral *)self setAverageRSSI:v11];
    }
    else
    {
      [(HAPBLEPeripheral *)self setAverageRSSI:v12];
    }

    id v4 = v12;
  }
}

- (BOOL)updateWithPeripheral:(id)a3
{
  id v4 = a3;
  double v5 = [v4 name];
  unint64_t v6 = [v5 length];
  uint64_t v7 = [(HAPBLEPeripheral *)self name];
  unint64_t v8 = [v7 length];

  if (v6 > v8)
  {
    uint64_t v9 = [v4 name];
    [(HAPBLEPeripheral *)self setName:v9];
  }
  uint64_t v10 = [v4 encryptedPayload];

  if (v10)
  {
    double v11 = [(HAPBLEPeripheral *)self encryptedPayload];
    id v12 = [v4 encryptedPayload];
    char v13 = [v11 isEqualToData:v12];
  }
  else
  {
    double Current = CFAbsoluteTimeGetCurrent();
    double v11 = [(HAPBLEPeripheral *)self configNumber];
    id v12 = [v4 configNumber];
    if ([v11 isEqual:v12])
    {
      uint64_t v15 = [(HAPBLEPeripheral *)self stateNumber];
      v16 = [v4 stateNumber];
      if ([v15 isEqual:v16])
      {
        v17 = [(HAPBLEPeripheral *)self peripheralUUIDs];
        v18 = [v4 peripheralUUIDs];
        v19 = [v18 lastObject];
        if ([v17 containsObject:v19])
        {
          [(HAPBLEPeripheral *)self lastSeen];
          char v13 = Current - v20 < 600.0;
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
    else
    {
      char v13 = 0;
    }
  }

  [(HAPBLEPeripheral *)self mergeWithPeripheral:v4];
  return v13 ^ 1;
}

- (void)updateStateNumber:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(HAPBLEPeripheral *)self compareStateNumber:v4] == -1)
  {
    double v5 = (void *)MEMORY[0x1D944E080]();
    unint64_t v6 = self;
    uint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v8 = HMFGetLogIdentifier();
      uint64_t v9 = [(HAPBLEPeripheral *)v6 identifier];
      uint64_t v10 = [(HAPBLEPeripheral *)v6 stateNumber];
      int v11 = 138544130;
      id v12 = v8;
      __int16 v13 = 2112;
      uint64_t v14 = v9;
      __int16 v15 = 2114;
      v16 = v10;
      __int16 v17 = 2114;
      id v18 = v4;
      _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Updating state number for tracked peripheral of %@ to sync-up current/new: %{public}@/%{public}@", (uint8_t *)&v11, 0x2Au);
    }
    [(HAPBLEPeripheral *)v6 setStateNumber:v4];
  }
}

- (int64_t)compareConfigNumber:(id)a3
{
  id v4 = a3;
  double v5 = [(HAPBLEPeripheral *)self configNumber];
  int64_t v6 = HAPCompareStateNumberWithRollover(v5, v4, 0xFFuLL);

  return v6;
}

- (int64_t)compareStateNumber:(id)a3
{
  id v4 = a3;
  double v5 = [(HAPBLEPeripheral *)self stateNumber];
  int64_t v6 = HAPCompareStateNumberWithRollover(v5, v4, 0xFFuLL);

  return v6;
}

- (id)description
{
  v25 = NSString;
  BOOL v30 = HAPIsInternalBuild();
  if (v30)
  {
    v31 = [(HAPBLEPeripheral *)self name];
  }
  else
  {
    v31 = @"<private>";
  }
  v29 = [(HAPBLEPeripheral *)self identifier];
  v28 = [(HAPBLEPeripheral *)self advDeviceAddress];
  v27 = [(HAPBLEPeripheral *)self statusFlags];
  uint64_t v21 = [v27 unsignedIntValue];
  v24 = [(HAPBLEPeripheral *)self category];
  v23 = [(HAPBLEPeripheral *)self stateNumber];
  v22 = [(HAPBLEPeripheral *)self configNumber];
  unint64_t v3 = [(HAPBLEPeripheral *)self advertisementFormat];
  [(HAPBLEPeripheral *)self isCached];
  id v4 = HMFBooleanToString();
  [(HAPBLEPeripheral *)self lastSeen];
  if (v5 <= 0.0)
  {
    uint64_t v10 = @"N/A";
  }
  else
  {
    double v6 = v5;
    unint64_t v7 = v3;
    if (HAPBLEDateStringForTime_onceToken != -1) {
      dispatch_once(&HAPBLEDateStringForTime_onceToken, &__block_literal_global_464);
    }
    unint64_t v8 = (void *)HAPBLEDateStringForTime_formatter;
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:v6];
    uint64_t v10 = [v8 stringFromDate:v9];

    unint64_t v3 = v7;
  }
  int v11 = NSNumber;
  double v20 = [(HAPBLEPeripheral *)self peripheralUUIDs];
  id v18 = objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v20, "count"));
  uint64_t v19 = [(HAPBLEPeripheral *)self cbPeripheral];
  id v12 = [v19 identifier];
  __int16 v13 = [(HAPBLEPeripheral *)self cbPeripheral];
  uint64_t v14 = NSNumber;
  __int16 v15 = [(HAPBLEPeripheral *)self cbPeripheral];
  v16 = objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v15, "state"));
  v26 = [v25 stringWithFormat:@"%@ (%@/%@/%p), sf: 0x%0x, c: %@, s#: %@, c#: %@, v: %tu, cached: %@, seen: '%@', periph[%@]: %@ (%p: %@)", v31, v29, v28, self, v21, v24, v23, v22, v3, v4, v10, v18, v12, v13, v16];

  if (v30) {

  }
  return v26;
}

- (id)shortDescription
{
  id v16 = (id)NSString;
  BOOL v19 = HAPIsInternalBuild();
  if (v19)
  {
    id v18 = [(HAPBLEPeripheral *)self name];
  }
  else
  {
    id v18 = @"<private>";
  }
  uint64_t v14 = [(HAPBLEPeripheral *)self identifier];
  unint64_t v3 = [(HAPBLEPeripheral *)self stateNumber];
  [(HAPBLEPeripheral *)self isCached];
  id v4 = HMFBooleanToString();
  double v5 = NSNumber;
  __int16 v15 = [(HAPBLEPeripheral *)self peripheralUUIDs];
  double v6 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
  unint64_t v7 = [(HAPBLEPeripheral *)self cbPeripheral];
  unint64_t v8 = [v7 identifier];
  uint64_t v9 = [(HAPBLEPeripheral *)self cbPeripheral];
  uint64_t v10 = NSNumber;
  int v11 = [(HAPBLEPeripheral *)self cbPeripheral];
  id v12 = objc_msgSend(v10, "numberWithInteger:", objc_msgSend(v11, "state"));
  id v17 = [v16 stringWithFormat:@"%@/%@ (%@, %@, %p) periph[%@] -> %@ (%p: %@)", v18, v14, v3, v4, self, v6, v8, v9, v12];

  if (v19) {

  }
  return v17;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HAPBLEPeripheral *)self identifier];
  uint64_t v4 = [v3 hash];
  double v5 = [(HAPBLEPeripheral *)self whbStableIdentifier];
  uint64_t v6 = [v5 hash] ^ v4;
  unint64_t v7 = [(HAPBLEPeripheral *)self advDeviceAddress];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HAPBLEPeripheral *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      double v5 = v4;
    }
    else {
      double v5 = 0;
    }
    uint64_t v6 = v5;
    if (v6
      && ([(HAPBLEPeripheral *)self identifier],
          unint64_t v7 = objc_claimAutoreleasedReturnValue(),
          [(HAPBLEPeripheral *)v6 identifier],
          unint64_t v8 = objc_claimAutoreleasedReturnValue(),
          int v9 = HMFEqualObjects(),
          v8,
          v7,
          v9))
    {
      uint64_t v10 = [(HAPBLEPeripheral *)self uniqueBTIdentifier];
      int v11 = [(HAPBLEPeripheral *)v6 uniqueBTIdentifier];
      char v12 = HMFEqualObjects();
    }
    else
    {
      char v12 = 0;
    }
  }
  return v12;
}

- (HAPBLEPeripheral)initWithName:(id)a3 peripheralUUID:(id)a4 identifier:(id)a5 hapVersion:(id)a6 hkType:(id)a7 advInterval:(id)a8 statusFlags:(id)a9 category:(id)a10 stateNumber:(id)a11 configNumber:(id)a12 setupHash:(id)a13 encryptedPayload:(id)a14 whbStableIdentifier:(id)a15 advDeviceAddress:(id)a16
{
  v49[1] = *MEMORY[0x1E4F143B8];
  id v47 = a3;
  id v21 = a4;
  id v36 = a5;
  id v46 = a5;
  id v22 = a6;
  id v45 = a7;
  id v35 = a8;
  id v44 = a8;
  id v43 = a9;
  id v42 = a10;
  id v41 = a11;
  id v40 = a12;
  id v39 = a13;
  id v38 = a14;
  id v23 = a15;
  v24 = v22;
  id v25 = a16;
  v48.receiver = self;
  v48.super_class = (Class)HAPBLEPeripheral;
  v26 = [(HAPBLEPeripheral *)&v48 init];
  v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_name, a3);
    objc_storeStrong((id *)&v27->_hkType, a7);
    objc_storeStrong((id *)&v27->_advInterval, v35);
    v27->_advertisementFormat = [v24 unsignedIntegerValue];
    objc_storeStrong((id *)&v27->_statusFlags, a9);
    objc_storeStrong((id *)&v27->_identifier, v36);
    objc_storeStrong((id *)&v27->_category, a10);
    objc_storeStrong((id *)&v27->_stateNumber, a11);
    objc_storeStrong((id *)&v27->_configNumber, a12);
    objc_storeStrong((id *)&v27->_setupHash, a13);
    objc_storeStrong((id *)&v27->_encryptedPayload, a14);
    v27->_lastSeen = CFAbsoluteTimeGetCurrent();
    objc_storeStrong((id *)&v27->_whbStableIdentifier, a15);
    objc_storeStrong((id *)&v27->_advDeviceAddress, a16);
    v49[0] = v21;
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:1];
    uint64_t v29 = [v28 mutableCopy];
    cbPeripheralUUIDs = v27->_cbPeripheralUUIDs;
    v27->_cbPeripheralUUIDs = (NSMutableArray *)v29;

    uint64_t v31 = [(id)objc_opt_class() uuidForBTLEPeripheral:v27];
    uniqueBTIdentifier = v27->_uniqueBTIdentifier;
    v27->_uniqueBTIdentifier = (NSUUID *)v31;
  }
  return v27;
}

+ (id)uuidForBTLEPeripheral:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 uniqueBTIdentifier];

  if (v4)
  {
    double v5 = [v3 uniqueBTIdentifier];
  }
  else
  {
    if (HAPIsHH2Enabled_onceToken != -1) {
      dispatch_once(&HAPIsHH2Enabled_onceToken, &__block_literal_global_12024);
    }
    if (HAPIsHH2Enabled_hh2Enabled == 1
      && ([v3 whbStableIdentifier], uint64_t v6 = objc_claimAutoreleasedReturnValue(),
                                                   v6,
                                                   v6))
    {
      unint64_t v7 = [v3 advDeviceAddress];
      unint64_t v8 = v7;
      if (v7)
      {
        int v9 = [v7 stringByReplacingOccurrencesOfString:@":" withString:&stru_1F2C4E778];
      }
      else
      {
        uint64_t v10 = [v3 whbStableIdentifier];
        int v9 = [v10 stringByReplacingOccurrencesOfString:@":" withString:&stru_1F2C4E778];
      }
      id v11 = objc_alloc(MEMORY[0x1E4F29128]);
      char v12 = [@"8A0A9F67-9C4E-4BA0-9ECC-" stringByAppendingFormat:@"%@", v9];
      double v5 = (void *)[v11 initWithUUIDString:v12];
    }
    else
    {
      int v9 = [v3 peripheralUUIDs];
      double v5 = [v9 lastObject];
    }
  }

  return v5;
}

@end