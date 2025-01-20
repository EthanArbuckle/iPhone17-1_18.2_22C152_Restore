@interface HAPRecentlySeenPairedBTLEPeripheralTuple
- (BOOL)monitorState;
- (BOOL)notifyingCharacteristicUpdated;
- (NSNumber)category;
- (NSNumber)configNumber;
- (NSNumber)stateNumber;
- (NSString)identifier;
- (id)description;
- (id)initRecentlySeenPairedHAPBLEPeripheral:(id)a3;
- (unint64_t)advertisementFormat;
- (unint64_t)connectionPriority;
- (void)setAdvertisementFormat:(unint64_t)a3;
- (void)setCategory:(id)a3;
- (void)setConfigNumber:(id)a3;
- (void)setConnectionPriority:(unint64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setMonitorState:(BOOL)a3;
- (void)setNotifyingCharacteristicUpdated:(BOOL)a3;
- (void)setStateNumber:(id)a3;
- (void)updatePairedPeripheralConfiguration:(BOOL)a3 connectionPriority:(unint64_t)a4;
- (void)updateWithPeripheral:(id)a3;
@end

@implementation HAPRecentlySeenPairedBTLEPeripheralTuple

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_configNumber, 0);
  objc_storeStrong((id *)&self->_stateNumber, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setCategory:(id)a3
{
}

- (NSNumber)category
{
  return self->_category;
}

- (void)setConfigNumber:(id)a3
{
}

- (NSNumber)configNumber
{
  return self->_configNumber;
}

- (void)setStateNumber:(id)a3
{
}

- (NSNumber)stateNumber
{
  return self->_stateNumber;
}

- (void)setAdvertisementFormat:(unint64_t)a3
{
  self->_advertisementFormat = a3;
}

- (unint64_t)advertisementFormat
{
  return self->_advertisementFormat;
}

- (void)setConnectionPriority:(unint64_t)a3
{
  self->_connectionPriority = a3;
}

- (unint64_t)connectionPriority
{
  return self->_connectionPriority;
}

- (void)setMonitorState:(BOOL)a3
{
  self->_monitorState = a3;
}

- (BOOL)monitorState
{
  return self->_monitorState;
}

- (void)setNotifyingCharacteristicUpdated:(BOOL)a3
{
  self->_notifyingCharacteristicUpdated = a3;
}

- (BOOL)notifyingCharacteristicUpdated
{
  return self->_notifyingCharacteristicUpdated;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)description
{
  double v3 = 0.0;
  if (self->_lastSeen > 0.0)
  {
    v4 = [MEMORY[0x1E4F1C9C8] date];
    [v4 timeIntervalSinceReferenceDate];
    double v3 = v5 - self->_lastSeen;
  }
  v6 = NSString;
  v7 = [(HAPRecentlySeenPairedBTLEPeripheralTuple *)self identifier];
  v8 = [(HAPRecentlySeenPairedBTLEPeripheralTuple *)self stateNumber];
  if (v3 <= 0.0) {
    double v9 = -1.0;
  }
  else {
    double v9 = v3 / 60.0;
  }
  [(HAPRecentlySeenPairedBTLEPeripheralTuple *)self monitorState];
  v10 = HMFBooleanToString();
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HAPRecentlySeenPairedBTLEPeripheralTuple connectionPriority](self, "connectionPriority"));
  v12 = [v6 stringWithFormat:@"%@/%@ - Seen(%0.2fm)/Monitor(%@)/Priority(%@)", v7, v8, *(void *)&v9, v10, v11];

  return v12;
}

- (void)updatePairedPeripheralConfiguration:(BOOL)a3 connectionPriority:(unint64_t)a4
{
  BOOL v5 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([(HAPRecentlySeenPairedBTLEPeripheralTuple *)self monitorState] != a3
    || [(HAPRecentlySeenPairedBTLEPeripheralTuple *)self connectionPriority] != a4)
  {
    v7 = (void *)MEMORY[0x1D944E080]();
    v8 = self;
    double v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = HMFGetLogIdentifier();
      v11 = [(HAPRecentlySeenPairedBTLEPeripheralTuple *)v8 identifier];
      v12 = HMFBooleanToString();
      int v13 = 138544130;
      v14 = v10;
      __int16 v15 = 2114;
      v16 = v11;
      __int16 v17 = 2114;
      v18 = v12;
      __int16 v19 = 2048;
      unint64_t v20 = a4;
      _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_INFO, "%{public}@Updating configuration for %{public}@, monitor: %{public}@, priority: %tu", (uint8_t *)&v13, 0x2Au);
    }
    [(HAPRecentlySeenPairedBTLEPeripheralTuple *)v8 setMonitorState:v5];
    [(HAPRecentlySeenPairedBTLEPeripheralTuple *)v8 setConnectionPriority:a4];
  }
}

- (void)updateWithPeripheral:(id)a3
{
  id v15 = a3;
  v4 = [v15 stateNumber];

  if (v4)
  {
    BOOL v5 = [v15 stateNumber];
    stateNumber = self->_stateNumber;
    self->_stateNumber = v5;
  }
  v7 = [v15 configNumber];

  if (v7)
  {
    v8 = [v15 configNumber];
    configNumber = self->_configNumber;
    self->_configNumber = v8;
  }
  v10 = [v15 category];

  if (v10)
  {
    v11 = [v15 category];
    category = self->_category;
    self->_category = v11;
  }
  [v15 lastSeen];
  if (v13 > 0.0)
  {
    [v15 lastSeen];
    self->_lastSeen = v14;
  }
}

- (id)initRecentlySeenPairedHAPBLEPeripheral:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HAPRecentlySeenPairedBTLEPeripheralTuple;
  BOOL v5 = [(HAPRecentlySeenPairedBTLEPeripheralTuple *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 identifier];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_advertisementFormat = [v4 advertisementFormat];
    v5->_connectionPriority = 0;
    v5->_monitorState = 1;
    [(HAPRecentlySeenPairedBTLEPeripheralTuple *)v5 updateWithPeripheral:v4];
  }

  return v5;
}

@end