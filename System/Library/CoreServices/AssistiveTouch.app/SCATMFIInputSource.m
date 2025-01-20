@interface SCATMFIInputSource
- (BOOL)isMFIInputSource;
- (NSString)manufacturerName;
- (NSString)productName;
- (NSString)serialNumber;
- (NSString)versionNumber;
- (id)actionForButtonNumber:(int64_t)a3 withType:(id)a4;
- (id)persistentSwitchIdentifierForButtonNumber:(int64_t)a3;
- (id)switchDisplayNameForButtonNumber:(int64_t)a3;
- (id)switchSource;
- (int64_t)availableButtons;
- (int64_t)switchKeyForSwitch:(id)a3;
- (void)setAvailableButtons:(int64_t)a3;
- (void)setManufacturerName:(id)a3;
- (void)setProductName:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)setVersionNumber:(id)a3;
@end

@implementation SCATMFIInputSource

- (BOOL)isMFIInputSource
{
  return 1;
}

- (id)switchSource
{
  return SCATSwitchSourceMFI;
}

- (int64_t)switchKeyForSwitch:(id)a3
{
  return (int64_t)[a3 buttonNumber];
}

- (id)actionForButtonNumber:(int64_t)a3 withType:(id)a4
{
  id v6 = a4;
  v7 = [(SCATInputSource *)self actions];

  if (v7)
  {
    v8 = +[NSNumber numberWithInteger:a3];
    v9 = [(SCATInputSource *)self actions];
    v10 = [v9 objectForKeyedSubscript:v8];

    v11 = [v10 objectForKeyedSubscript:v6];
  }
  else
  {
    _AXLogWithFacility();
    v11 = 0;
  }

  return v11;
}

- (id)persistentSwitchIdentifierForButtonNumber:(int64_t)a3
{
  v4 = [(SCATHardwareInputSource *)self persistentSwitchIdentifiers];
  v5 = +[NSNumber numberWithInteger:a3];
  id v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

- (id)switchDisplayNameForButtonNumber:(int64_t)a3
{
  v4 = [(SCATHardwareInputSource *)self switchDisplayNames];
  v5 = +[NSNumber numberWithInteger:a3];
  id v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

- (NSString)productName
{
  return self->_productName;
}

- (void)setProductName:(id)a3
{
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)manufacturerName
{
  return self->_manufacturerName;
}

- (void)setManufacturerName:(id)a3
{
}

- (NSString)versionNumber
{
  return self->_versionNumber;
}

- (void)setVersionNumber:(id)a3
{
}

- (int64_t)availableButtons
{
  return self->_availableButtons;
}

- (void)setAvailableButtons:(int64_t)a3
{
  self->_availableButtons = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionNumber, 0);
  objc_storeStrong((id *)&self->_manufacturerName, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);

  objc_storeStrong((id *)&self->_productName, 0);
}

@end