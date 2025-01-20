@interface DSPairedComputer
- (BOOL)isEqual:(id)a3;
- (DSPairedComputer)initWithDeviceName:(id)a3;
- (NSDate)datePaired;
- (NSString)deviceName;
- (NSString)lockdownFrameworkIdentifier;
- (NSString)lockdownFrameworkKey;
- (NSString)marketingName;
- (NSString)remotePairingFrameworkIdentifier;
- (NSString)serialNumber;
- (unint64_t)hash;
- (void)setDatePaired:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setLockdownFrameworkIdentifier:(id)a3;
- (void)setLockdownFrameworkKey:(id)a3;
- (void)setMarketingName:(id)a3;
- (void)setRemotePairingFrameworkIdentifier:(id)a3;
- (void)setSerialNumber:(id)a3;
@end

@implementation DSPairedComputer

- (DSPairedComputer)initWithDeviceName:(id)a3
{
  return self;
}

- (unint64_t)hash
{
  remotePairingFrameworkIdentifier = self->_remotePairingFrameworkIdentifier;
  if (!remotePairingFrameworkIdentifier) {
    remotePairingFrameworkIdentifier = self->_lockdownFrameworkIdentifier;
  }
  return [(NSString *)remotePairingFrameworkIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (DSPairedComputer *)a3;
  if (v4 == self) {
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    LOBYTE(lockdownFrameworkIdentifier) = 0;
    goto LABEL_8;
  }
  serialNumber = self->_serialNumber;
  v6 = [(DSPairedComputer *)v4 serialNumber];
  LOBYTE(serialNumber) = [(NSString *)serialNumber isEqualToString:v6];

  if ((serialNumber & 1) != 0
    || (remotePairingFrameworkIdentifier = self->_remotePairingFrameworkIdentifier) != 0
    && ([(DSPairedComputer *)v4 remotePairingFrameworkIdentifier],
        v8 = objc_claimAutoreleasedReturnValue(),
        BOOL v9 = [(NSString *)remotePairingFrameworkIdentifier isEqualToString:v8],
        v8,
        v9))
  {
LABEL_6:
    LOBYTE(lockdownFrameworkIdentifier) = 1;
  }
  else
  {
    lockdownFrameworkIdentifier = self->_lockdownFrameworkIdentifier;
    if (lockdownFrameworkIdentifier)
    {
      v12 = [(DSPairedComputer *)v4 lockdownFrameworkIdentifier];
      LOBYTE(lockdownFrameworkIdentifier) = [(NSString *)lockdownFrameworkIdentifier isEqualToString:v12];
    }
  }
LABEL_8:

  return (char)lockdownFrameworkIdentifier;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (NSDate)datePaired
{
  return self->_datePaired;
}

- (void)setDatePaired:(id)a3
{
}

- (NSString)remotePairingFrameworkIdentifier
{
  return self->_remotePairingFrameworkIdentifier;
}

- (void)setRemotePairingFrameworkIdentifier:(id)a3
{
}

- (NSString)lockdownFrameworkIdentifier
{
  return self->_lockdownFrameworkIdentifier;
}

- (void)setLockdownFrameworkIdentifier:(id)a3
{
}

- (NSString)lockdownFrameworkKey
{
  return self->_lockdownFrameworkKey;
}

- (void)setLockdownFrameworkKey:(id)a3
{
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)marketingName
{
  return self->_marketingName;
}

- (void)setMarketingName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_marketingName, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_lockdownFrameworkKey, 0);
  objc_storeStrong((id *)&self->_lockdownFrameworkIdentifier, 0);
  objc_storeStrong((id *)&self->_remotePairingFrameworkIdentifier, 0);
  objc_storeStrong((id *)&self->_datePaired, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
}

@end