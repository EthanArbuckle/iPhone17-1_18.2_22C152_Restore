@interface EAWiFiUnconfiguredAccessory
- (BOOL)isEqual:(id)a3;
- (EAWiFiUnconfiguredAccessory)initWithAirPortAssistantWACDevice:(id)a3;
- (EAWiFiUnconfiguredAccessoryProperties)properties;
- (NSString)macAddress;
- (NSString)manufacturer;
- (NSString)model;
- (NSString)name;
- (NSString)ssid;
- (id)description;
@end

@implementation EAWiFiUnconfiguredAccessory

- (EAWiFiUnconfiguredAccessory)initWithAirPortAssistantWACDevice:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)EAWiFiUnconfiguredAccessory;
  v5 = [(EAWiFiUnconfiguredAccessory *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:@"wacFriendlyName"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 objectForKey:@"wacSSID"];
    ssid = v5->_ssid;
    v5->_ssid = (NSString *)v8;

    uint64_t v10 = [v4 objectForKey:@"wacManufacturerName"];
    manufacturer = v5->_manufacturer;
    v5->_manufacturer = (NSString *)v10;

    uint64_t v12 = [v4 objectForKey:@"wacModelName"];
    model = v5->_model;
    v5->_model = (NSString *)v12;

    uint64_t v14 = [v4 objectForKey:@"wacMACAddress"];
    macAddress = v5->_macAddress;
    v5->_macAddress = (NSString *)v14;

    if (!v5->_name)
    {
      v5->_name = (NSString *)&stru_1F1595068;
    }
    if (!v5->_ssid)
    {
      v5->_ssid = (NSString *)&stru_1F1595068;
    }
    if (!v5->_manufacturer)
    {
      v5->_manufacturer = (NSString *)&stru_1F1595068;
    }
    if (!v5->_model)
    {
      v5->_model = (NSString *)&stru_1F1595068;
    }
    if (!v5->_macAddress)
    {
      v5->_macAddress = (NSString *)&stru_1F1595068;
    }
    v5->_properties = 0;
    v16 = [v4 objectForKey:@"wacSupportsAirPlay"];
    int v17 = [v16 BOOLValue];

    if (v17) {
      v5->_properties |= 1uLL;
    }
    v18 = [v4 objectForKey:@"wacSupportsSpruce"];
    int v19 = [v18 BOOLValue];

    if (v19) {
      v5->_properties |= 4uLL;
    }
  }

  return v5;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"EAWiFiUnconfiguredAccessory: Name=%@ Manufacturer=%@ Model=%@ MAC=%@ SSID=%@ Properties=%d", self->_name, self->_manufacturer, self->_model, self->_macAddress, self->_ssid, self->_properties];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    name = self->_name;
    v7 = [v5 name];
    if ([(NSString *)name isEqual:v7])
    {
      ssid = self->_ssid;
      v9 = [v5 ssid];
      if ([(NSString *)ssid isEqual:v9])
      {
        manufacturer = self->_manufacturer;
        v11 = [v5 manufacturer];
        if ([(NSString *)manufacturer isEqual:v11])
        {
          model = self->_model;
          v13 = [v5 model];
          if ([(NSString *)model isEqual:v13])
          {
            macAddress = self->_macAddress;
            v15 = [v5 macAddress];
            if ([(NSString *)macAddress isEqual:v15])
            {
              unint64_t properties = self->_properties;
              BOOL v17 = properties == [v5 properties];
            }
            else
            {
              BOOL v17 = 0;
            }
          }
          else
          {
            BOOL v17 = 0;
          }
        }
        else
        {
          BOOL v17 = 0;
        }
      }
      else
      {
        BOOL v17 = 0;
      }
    }
    else
    {
      BOOL v17 = 0;
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (NSString)model
{
  return self->_model;
}

- (NSString)ssid
{
  return self->_ssid;
}

- (NSString)macAddress
{
  return self->_macAddress;
}

- (EAWiFiUnconfiguredAccessoryProperties)properties
{
  return self->_properties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_macAddress, 0);
  objc_storeStrong((id *)&self->_ssid, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end