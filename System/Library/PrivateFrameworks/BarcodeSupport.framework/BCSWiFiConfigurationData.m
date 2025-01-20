@interface BCSWiFiConfigurationData
+ (BOOL)supportsSecureCoding;
- (BCSWiFiConfigurationData)initWithCoder:(id)a3;
- (BCSWiFiConfigurationData)initWithSSID:(id)a3 isWEP:(BOOL)a4 password:(id)a5 isHidden:(BOOL)a6;
- (BOOL)hasAirplayPayload;
- (BOOL)isHidden;
- (BOOL)isWEP;
- (NSString)airplayBrokerID;
- (NSString)airplayBrokerPin;
- (NSString)captivePortalToken;
- (NSString)extraPreviewText;
- (NSString)password;
- (NSString)ssid;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setAirplayBrokerID:(id)a3;
- (void)setAirplayBrokerPin:(id)a3;
- (void)setCaptivePortalToken:(id)a3;
@end

@implementation BCSWiFiConfigurationData

- (BCSWiFiConfigurationData)initWithSSID:(id)a3 isWEP:(BOOL)a4 password:(id)a5 isHidden:(BOOL)a6
{
  id v10 = a3;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)BCSWiFiConfigurationData;
  v12 = [(BCSWiFiConfigurationData *)&v19 init];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    ssid = v12->_ssid;
    v12->_ssid = (NSString *)v13;

    v12->_WEP = a4;
    uint64_t v15 = [v11 copy];
    password = v12->_password;
    v12->_password = (NSString *)v15;

    v12->_hidden = a6;
    v17 = v12;
  }

  return v12;
}

- (int64_t)type
{
  return 8;
}

- (NSString)extraPreviewText
{
  return 0;
}

- (BCSWiFiConfigurationData)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"ssid");
  v6 = objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"isWEP");
  uint64_t v7 = [v6 BOOLValue];

  v8 = objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"password");
  v9 = objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"isHidden");
  uint64_t v10 = [v9 BOOLValue];

  id v11 = [(BCSWiFiConfigurationData *)self initWithSSID:v5 isWEP:v7 password:v8 isHidden:v10];
  v12 = objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"airplayBrokerID");
  [(BCSWiFiConfigurationData *)v11 setAirplayBrokerID:v12];

  uint64_t v13 = objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"airplayBrokerPin");
  [(BCSWiFiConfigurationData *)v11 setAirplayBrokerPin:v13];

  v14 = objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"captivePortalToken");

  [(BCSWiFiConfigurationData *)v11 setCaptivePortalToken:v14];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  [v10 encodeObject:self->_ssid forKey:@"ssid"];
  id v4 = [NSNumber numberWithBool:self->_WEP];
  [v10 encodeObject:v4 forKey:@"isWEP"];

  [v10 encodeObject:self->_password forKey:@"password"];
  v5 = [NSNumber numberWithBool:self->_hidden];
  [v10 encodeObject:v5 forKey:@"isHidden"];

  airplayBrokerID = self->_airplayBrokerID;
  if (airplayBrokerID) {
    [v10 encodeObject:airplayBrokerID forKey:@"airplayBrokerID"];
  }
  airplayBrokerPin = self->_airplayBrokerPin;
  if (airplayBrokerPin) {
    [v10 encodeObject:airplayBrokerPin forKey:@"airplayBrokerPin"];
  }
  captivePortalToken = self->_captivePortalToken;
  v9 = v10;
  if (captivePortalToken)
  {
    [v10 encodeObject:captivePortalToken forKey:@"captivePortalToken"];
    v9 = v10;
  }
}

- (BOOL)hasAirplayPayload
{
  return self->_airplayBrokerID && self->_airplayBrokerPin != 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)ssid
{
  return self->_ssid;
}

- (BOOL)isWEP
{
  return self->_WEP;
}

- (NSString)password
{
  return self->_password;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (NSString)airplayBrokerID
{
  return self->_airplayBrokerID;
}

- (void)setAirplayBrokerID:(id)a3
{
}

- (NSString)airplayBrokerPin
{
  return self->_airplayBrokerPin;
}

- (void)setAirplayBrokerPin:(id)a3
{
}

- (NSString)captivePortalToken
{
  return self->_captivePortalToken;
}

- (void)setCaptivePortalToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captivePortalToken, 0);
  objc_storeStrong((id *)&self->_airplayBrokerPin, 0);
  objc_storeStrong((id *)&self->_airplayBrokerID, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_ssid, 0);
}

@end