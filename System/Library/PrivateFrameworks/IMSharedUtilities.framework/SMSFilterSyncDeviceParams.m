@interface SMSFilterSyncDeviceParams
+ (BOOL)supportsSecureCoding;
- (NSString)deviceUniqueID;
- (NSString)filterExtensionName;
- (SMSFilterSyncDeviceParams)init;
- (SMSFilterSyncDeviceParams)initWithCoder:(id)a3;
- (unint64_t)smsFilterCapabilitiesOptions;
- (void)encodeWithCoder:(id)a3;
- (void)setDeviceUniqueID:(id)a3;
- (void)setFilterExtensionName:(id)a3;
- (void)setSmsFilterCapabilitiesOptions:(unint64_t)a3;
@end

@implementation SMSFilterSyncDeviceParams

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SMSFilterSyncDeviceParams)init
{
  v3.receiver = self;
  v3.super_class = (Class)SMSFilterSyncDeviceParams;
  return [(SMSFilterSyncDeviceParams *)&v3 init];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SMSFilterSyncDeviceParams *)self deviceUniqueID];
  [v4 encodeObject:v5 forKey:@"deviceUniqueID"];

  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SMSFilterSyncDeviceParams smsFilterCapabilitiesOptions](self, "smsFilterCapabilitiesOptions"));
  [v4 encodeObject:v6 forKey:@"smsFilterCapabilitiesOptions"];

  id v7 = [(SMSFilterSyncDeviceParams *)self filterExtensionName];
  [v4 encodeObject:v7 forKey:@"filterExtensionName"];
}

- (SMSFilterSyncDeviceParams)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SMSFilterSyncDeviceParams;
  v5 = [(SMSFilterSyncDeviceParams *)&v10 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceUniqueID"];
    [(SMSFilterSyncDeviceParams *)v5 setDeviceUniqueID:v6];

    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"smsFilterCapabilitiesOptions"];
    -[SMSFilterSyncDeviceParams setSmsFilterCapabilitiesOptions:](v5, "setSmsFilterCapabilitiesOptions:", [v7 unsignedIntegerValue]);

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"filterExtensionName"];
    [(SMSFilterSyncDeviceParams *)v5 setFilterExtensionName:v8];
  }
  return v5;
}

- (NSString)deviceUniqueID
{
  return self->_deviceUniqueID;
}

- (void)setDeviceUniqueID:(id)a3
{
}

- (unint64_t)smsFilterCapabilitiesOptions
{
  return self->_smsFilterCapabilitiesOptions;
}

- (void)setSmsFilterCapabilitiesOptions:(unint64_t)a3
{
  self->_smsFilterCapabilitiesOptions = a3;
}

- (NSString)filterExtensionName
{
  return self->_filterExtensionName;
}

- (void)setFilterExtensionName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterExtensionName, 0);

  objc_storeStrong((id *)&self->_deviceUniqueID, 0);
}

@end