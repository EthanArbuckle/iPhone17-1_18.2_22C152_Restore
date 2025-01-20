@interface FMDUserNotificationContent
+ (BOOL)supportsSecureCoding;
- (FMDUserNotificationContent)initWithCoder:(id)a3;
- (NSString)body;
- (NSString)categoryIdentifier;
- (NSString)deviceId;
- (NSString)identifier;
- (NSString)locationMessage;
- (NSString)locationTitle;
- (NSString)serialNumber;
- (NSString)title;
- (double)latitude;
- (double)longitude;
- (unint64_t)interruptionLevel;
- (void)encodeWithCoder:(id)a3;
- (void)setBody:(id)a3;
- (void)setCategoryIdentifier:(id)a3;
- (void)setDeviceId:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInterruptionLevel:(unint64_t)a3;
- (void)setLatitude:(double)a3;
- (void)setLocationMessage:(id)a3;
- (void)setLocationTitle:(id)a3;
- (void)setLongitude:(double)a3;
- (void)setSerialNumber:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation FMDUserNotificationContent

- (FMDUserNotificationContent)initWithCoder:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)FMDUserNotificationContent;
  v5 = [(FMDUserNotificationContent *)&v34 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector("title");
    v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    [(FMDUserNotificationContent *)v5 setTitle:v8];

    uint64_t v9 = objc_opt_class();
    v10 = NSStringFromSelector("body");
    v11 = [v4 decodeObjectOfClass:v9 forKey:v10];
    [(FMDUserNotificationContent *)v5 setBody:v11];

    uint64_t v12 = objc_opt_class();
    v13 = NSStringFromSelector("categoryIdentifier");
    v14 = [v4 decodeObjectOfClass:v12 forKey:v13];
    [(FMDUserNotificationContent *)v5 setCategoryIdentifier:v14];

    uint64_t v15 = objc_opt_class();
    v16 = NSStringFromSelector("deviceId");
    v17 = [v4 decodeObjectOfClass:v15 forKey:v16];
    [(FMDUserNotificationContent *)v5 setDeviceId:v17];

    uint64_t v18 = objc_opt_class();
    v19 = NSStringFromSelector("serialNumber");
    v20 = [v4 decodeObjectOfClass:v18 forKey:v19];
    [(FMDUserNotificationContent *)v5 setSerialNumber:v20];

    uint64_t v21 = objc_opt_class();
    v22 = NSStringFromSelector("identifier");
    v23 = [v4 decodeObjectOfClass:v21 forKey:v22];
    [(FMDUserNotificationContent *)v5 setIdentifier:v23];

    uint64_t v24 = objc_opt_class();
    v25 = NSStringFromSelector("locationTitle");
    v26 = [v4 decodeObjectOfClass:v24 forKey:v25];
    [(FMDUserNotificationContent *)v5 setLocationTitle:v26];

    uint64_t v27 = objc_opt_class();
    v28 = NSStringFromSelector("locationMessage");
    v29 = [v4 decodeObjectOfClass:v27 forKey:v28];
    [(FMDUserNotificationContent *)v5 setLocationMessage:v29];

    v30 = NSStringFromSelector("latitude");
    [v4 decodeDoubleForKey:v30];
    -[FMDUserNotificationContent setLatitude:](v5, "setLatitude:");

    v31 = NSStringFromSelector("longitude");
    [v4 decodeDoubleForKey:v31];
    -[FMDUserNotificationContent setLongitude:](v5, "setLongitude:");

    v32 = NSStringFromSelector("interruptionLevel");
    -[FMDUserNotificationContent setInterruptionLevel:](v5, "setInterruptionLevel:", [v4 decodeIntegerForKey:v32]);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(FMDUserNotificationContent *)self title];
  uint64_t v6 = NSStringFromSelector("title");
  [v4 encodeObject:v5 forKey:v6];

  v7 = [(FMDUserNotificationContent *)self body];
  v8 = NSStringFromSelector("body");
  [v4 encodeObject:v7 forKey:v8];

  uint64_t v9 = [(FMDUserNotificationContent *)self categoryIdentifier];
  v10 = NSStringFromSelector("categoryIdentifier");
  [v4 encodeObject:v9 forKey:v10];

  v11 = [(FMDUserNotificationContent *)self deviceId];
  uint64_t v12 = NSStringFromSelector("deviceId");
  [v4 encodeObject:v11 forKey:v12];

  v13 = [(FMDUserNotificationContent *)self serialNumber];
  v14 = NSStringFromSelector("serialNumber");
  [v4 encodeObject:v13 forKey:v14];

  uint64_t v15 = [(FMDUserNotificationContent *)self identifier];
  v16 = NSStringFromSelector("identifier");
  [v4 encodeObject:v15 forKey:v16];

  v17 = [(FMDUserNotificationContent *)self locationTitle];
  uint64_t v18 = NSStringFromSelector("locationTitle");
  [v4 encodeObject:v17 forKey:v18];

  v19 = [(FMDUserNotificationContent *)self locationMessage];
  v20 = NSStringFromSelector("locationMessage");
  [v4 encodeObject:v19 forKey:v20];

  [(FMDUserNotificationContent *)self latitude];
  double v22 = v21;
  v23 = NSStringFromSelector("latitude");
  [v4 encodeDouble:v23 forKey:v22];

  [(FMDUserNotificationContent *)self longitude];
  double v25 = v24;
  v26 = NSStringFromSelector("longitude");
  [v4 encodeDouble:v26 forKey:v25];

  unint64_t v27 = [(FMDUserNotificationContent *)self interruptionLevel];
  NSStringFromSelector("interruptionLevel");
  id v28 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeInteger:v27 forKey:v28];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
}

- (NSString)categoryIdentifier
{
  return self->_categoryIdentifier;
}

- (void)setCategoryIdentifier:(id)a3
{
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (void)setDeviceId:(id)a3
{
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)locationTitle
{
  return self->_locationTitle;
}

- (void)setLocationTitle:(id)a3
{
}

- (NSString)locationMessage
{
  return self->_locationMessage;
}

- (void)setLocationMessage:(id)a3
{
}

- (double)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(double)a3
{
  self->_latitude = a3;
}

- (double)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(double)a3
{
  self->_longitude = a3;
}

- (unint64_t)interruptionLevel
{
  return self->_interruptionLevel;
}

- (void)setInterruptionLevel:(unint64_t)a3
{
  self->_interruptionLevel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationMessage, 0);
  objc_storeStrong((id *)&self->_locationTitle, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_deviceId, 0);
  objc_storeStrong((id *)&self->_categoryIdentifier, 0);
  objc_storeStrong((id *)&self->_body, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end