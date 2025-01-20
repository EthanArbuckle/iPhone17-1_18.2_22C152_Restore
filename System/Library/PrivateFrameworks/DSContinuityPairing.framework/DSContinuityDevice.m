@interface DSContinuityDevice
- (BOOL)isEqual:(id)a3;
- (DSContinuityDevice)initWithName:(id)a3 deviceID:(id)a4 relationshipID:(id)a5 initialDiscoveryDate:(id)a6;
- (NSDate)initialDiscoveryDate;
- (NSString)formattedSessionDuration;
- (NSString)formattedSessionStart;
- (NSString)marketingName;
- (NSString)model;
- (NSString)name;
- (NSString)pushToken;
- (NSString)serialNumber;
- (NSUUID)deviceID;
- (NSUUID)relationshipID;
- (UIImage)deviceImage;
- (void)setDeviceID:(id)a3;
- (void)setDeviceImage:(id)a3;
- (void)setFormattedSessionDuration:(id)a3;
- (void)setFormattedSessionStart:(id)a3;
- (void)setInitialDiscoveryDate:(id)a3;
- (void)setMarketingName:(id)a3;
- (void)setModel:(id)a3;
- (void)setName:(id)a3;
- (void)setPushToken:(id)a3;
- (void)setRelationshipID:(id)a3;
- (void)setSerialNumber:(id)a3;
@end

@implementation DSContinuityDevice

- (DSContinuityDevice)initWithName:(id)a3 deviceID:(id)a4 relationshipID:(id)a5 initialDiscoveryDate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)DSContinuityDevice;
  v14 = [(DSContinuityDevice *)&v17 init];
  v15 = v14;
  if (v14)
  {
    [(DSContinuityDevice *)v14 setName:v10];
    [(DSContinuityDevice *)v15 setDeviceID:v11];
    [(DSContinuityDevice *)v15 setRelationshipID:v12];
    [(DSContinuityDevice *)v15 setInitialDiscoveryDate:v13];
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (DSContinuityDevice *)a3;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(DSContinuityDevice *)v4 pushToken];
      v6 = [(DSContinuityDevice *)self pushToken];
      if (v5 == v6)
      {
        BOOL v9 = 1;
      }
      else
      {
        v7 = [(DSContinuityDevice *)v4 deviceID];
        v8 = [(DSContinuityDevice *)self deviceID];
        BOOL v9 = v7 == v8;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (NSString)marketingName
{
  return self->_marketingName;
}

- (void)setMarketingName:(id)a3
{
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSUUID)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
}

- (NSUUID)relationshipID
{
  return self->_relationshipID;
}

- (void)setRelationshipID:(id)a3
{
}

- (NSString)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
}

- (NSDate)initialDiscoveryDate
{
  return self->_initialDiscoveryDate;
}

- (void)setInitialDiscoveryDate:(id)a3
{
}

- (NSString)formattedSessionStart
{
  return self->_formattedSessionStart;
}

- (void)setFormattedSessionStart:(id)a3
{
}

- (NSString)formattedSessionDuration
{
  return self->_formattedSessionDuration;
}

- (void)setFormattedSessionDuration:(id)a3
{
}

- (UIImage)deviceImage
{
  return self->_deviceImage;
}

- (void)setDeviceImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceImage, 0);
  objc_storeStrong((id *)&self->_formattedSessionDuration, 0);
  objc_storeStrong((id *)&self->_formattedSessionStart, 0);
  objc_storeStrong((id *)&self->_initialDiscoveryDate, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_relationshipID, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_marketingName, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end