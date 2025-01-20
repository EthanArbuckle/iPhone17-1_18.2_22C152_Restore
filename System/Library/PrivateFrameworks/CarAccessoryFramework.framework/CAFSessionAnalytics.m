@interface CAFSessionAnalytics
+ (BOOL)supportsSecureCoding;
- (BOOL)supportsBluetoothLE;
- (CAFSessionAnalytics)initWithCoder:(id)a3;
- (CAFSessionAnalytics)initWithSession:(id)a3;
- (NSString)firmwareVersion;
- (NSString)hardwareVersion;
- (NSString)manufacturer;
- (NSString)model;
- (NSString)name;
- (NSString)ppid;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CAFSessionAnalytics

- (CAFSessionAnalytics)initWithSession:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CAFSessionAnalytics;
  v5 = [(CAFSessionAnalytics *)&v24 init];
  if (v5)
  {
    v6 = [MEMORY[0x263F30EB0] sharedInstance];
    v7 = [v4 MFiCertificateSerialNumber];
    if (v7)
    {
      v8 = [v6 vehicleAccessoryForCertificateSerial:v7];
      v9 = v8;
      if (v8)
      {
        v10 = [v8 analyticsDescription];
        uint64_t v11 = [v10 objectForKeyedSubscript:@"name"];
        name = v5->_name;
        v5->_name = (NSString *)v11;

        uint64_t v13 = [v10 objectForKeyedSubscript:@"ppid"];
        ppid = v5->_ppid;
        v5->_ppid = (NSString *)v13;

        uint64_t v15 = [v10 objectForKeyedSubscript:@"firmwareVersion"];
        firmwareVersion = v5->_firmwareVersion;
        v5->_firmwareVersion = (NSString *)v15;

        uint64_t v17 = [v10 objectForKeyedSubscript:@"hardwareVersion"];
        hardwareVersion = v5->_hardwareVersion;
        v5->_hardwareVersion = (NSString *)v17;

        uint64_t v19 = [v10 objectForKeyedSubscript:@"manufacturer"];
        manufacturer = v5->_manufacturer;
        v5->_manufacturer = (NSString *)v19;

        uint64_t v21 = [v10 objectForKeyedSubscript:@"modelName"];
        model = v5->_model;
        v5->_model = (NSString *)v21;

        v5->_supportsBluetoothLE = [v9 supportsBluetoothLE];
      }
    }
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CAFSessionAnalytics)initWithCoder:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)CAFSessionAnalytics;
  v5 = [(CAFSessionAnalytics *)&v32 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_name);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    name = v5->_name;
    v5->_name = (NSString *)v8;

    uint64_t v10 = objc_opt_class();
    uint64_t v11 = NSStringFromSelector(sel_ppid);
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    ppid = v5->_ppid;
    v5->_ppid = (NSString *)v12;

    uint64_t v14 = objc_opt_class();
    uint64_t v15 = NSStringFromSelector(sel_firmwareVersion);
    uint64_t v16 = [v4 decodeObjectOfClass:v14 forKey:v15];
    firmwareVersion = v5->_firmwareVersion;
    v5->_firmwareVersion = (NSString *)v16;

    uint64_t v18 = objc_opt_class();
    uint64_t v19 = NSStringFromSelector(sel_hardwareVersion);
    uint64_t v20 = [v4 decodeObjectOfClass:v18 forKey:v19];
    hardwareVersion = v5->_hardwareVersion;
    v5->_hardwareVersion = (NSString *)v20;

    uint64_t v22 = objc_opt_class();
    v23 = NSStringFromSelector(sel_manufacturer);
    uint64_t v24 = [v4 decodeObjectOfClass:v22 forKey:v23];
    manufacturer = v5->_manufacturer;
    v5->_manufacturer = (NSString *)v24;

    uint64_t v26 = objc_opt_class();
    v27 = NSStringFromSelector(sel_model);
    uint64_t v28 = [v4 decodeObjectOfClass:v26 forKey:v27];
    model = v5->_model;
    v5->_model = (NSString *)v28;

    v30 = NSStringFromSelector(sel_supportsBluetoothLE);
    v5->_supportsBluetoothLE = [v4 decodeBoolForKey:v30];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  uint64_t v6 = NSStringFromSelector(sel_name);
  [v5 encodeObject:name forKey:v6];

  ppid = self->_ppid;
  uint64_t v8 = NSStringFromSelector(sel_ppid);
  [v5 encodeObject:ppid forKey:v8];

  firmwareVersion = self->_firmwareVersion;
  uint64_t v10 = NSStringFromSelector(sel_firmwareVersion);
  [v5 encodeObject:firmwareVersion forKey:v10];

  hardwareVersion = self->_hardwareVersion;
  uint64_t v12 = NSStringFromSelector(sel_hardwareVersion);
  [v5 encodeObject:hardwareVersion forKey:v12];

  manufacturer = self->_manufacturer;
  uint64_t v14 = NSStringFromSelector(sel_manufacturer);
  [v5 encodeObject:manufacturer forKey:v14];

  model = self->_model;
  uint64_t v16 = NSStringFromSelector(sel_model);
  [v5 encodeObject:model forKey:v16];

  BOOL supportsBluetoothLE = self->_supportsBluetoothLE;
  NSStringFromSelector(sel_supportsBluetoothLE);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeBool:supportsBluetoothLE forKey:v18];
}

- (NSString)name
{
  return self->_name;
}

- (NSString)ppid
{
  return self->_ppid;
}

- (NSString)firmwareVersion
{
  return self->_firmwareVersion;
}

- (NSString)hardwareVersion
{
  return self->_hardwareVersion;
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (NSString)model
{
  return self->_model;
}

- (BOOL)supportsBluetoothLE
{
  return self->_supportsBluetoothLE;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_hardwareVersion, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_ppid, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end