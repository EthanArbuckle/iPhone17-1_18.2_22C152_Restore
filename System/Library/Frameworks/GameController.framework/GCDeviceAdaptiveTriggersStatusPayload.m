@interface GCDeviceAdaptiveTriggersStatusPayload
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (GCDeviceAdaptiveTriggersStatusPayload)initWithCoder:(id)a3;
- (NSNumber)armPosition;
- (NSNumber)mode;
- (NSNumber)status;
- (id)description;
- (id)initFeedbackWithStatus:(unsigned __int8)a3 armPosition:(unsigned __int8)a4 mode:(unsigned __int8)a5;
- (id)redactedDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GCDeviceAdaptiveTriggersStatusPayload

- (id)initFeedbackWithStatus:(unsigned __int8)a3 armPosition:(unsigned __int8)a4 mode:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = a4;
  uint64_t v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GCDeviceAdaptiveTriggersStatusPayload;
  v8 = [(GCDeviceAdaptiveTriggersStatusPayload *)&v16 init];
  if (v8)
  {
    uint64_t v9 = +[NSNumber numberWithUnsignedChar:v7];
    status = v8->_status;
    v8->_status = (NSNumber *)v9;

    uint64_t v11 = +[NSNumber numberWithUnsignedChar:v6];
    armPosition = v8->_armPosition;
    v8->_armPosition = (NSNumber *)v11;

    uint64_t v13 = +[NSNumber numberWithUnsignedChar:v5];
    mode = v8->_mode;
    v8->_mode = (NSNumber *)v13;
  }
  return v8;
}

- (id)description
{
  return +[NSString stringWithFormat:@"<ATPayload - mode=%@> status=%@ armPosition=%@", self->_mode, self->_status, self->_armPosition];
}

- (id)redactedDescription
{
  return +[NSString stringWithFormat:@"<ATPayload - mode=%@>", self->_mode];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (GCDeviceAdaptiveTriggersStatusPayload *)a3;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      status = self->_status;
      uint64_t v7 = [(GCDeviceAdaptiveTriggersStatusPayload *)v5 status];
      if ([(NSNumber *)status isEqualToNumber:v7])
      {
        armPosition = self->_armPosition;
        uint64_t v9 = [(GCDeviceAdaptiveTriggersStatusPayload *)v5 armPosition];
        if ([(NSNumber *)armPosition isEqualToNumber:v9])
        {
          mode = self->_mode;
          uint64_t v11 = [(GCDeviceAdaptiveTriggersStatusPayload *)v5 mode];
          char v12 = [(NSNumber *)mode isEqualToNumber:v11];
        }
        else
        {
          char v12 = 0;
        }
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSNumber *)self->_status hash];
  uint64_t v4 = [(NSNumber *)self->_armPosition hash] ^ v3;
  return v4 ^ [(NSNumber *)self->_mode hash];
}

- (NSNumber)status
{
  return self->_status;
}

- (NSNumber)armPosition
{
  return self->_armPosition;
}

- (NSNumber)mode
{
  return self->_mode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mode, 0);
  objc_storeStrong((id *)&self->_armPosition, 0);

  objc_storeStrong((id *)&self->_status, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCDeviceAdaptiveTriggersStatusPayload)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GCDeviceAdaptiveTriggersStatusPayload;
  uint64_t v5 = [(GCDeviceAdaptiveTriggersStatusPayload *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_status"];
    status = v5->_status;
    v5->_status = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_armPosition"];
    armPosition = v5->_armPosition;
    v5->_armPosition = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_mode"];
    mode = v5->_mode;
    v5->_mode = (NSNumber *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  status = self->_status;
  id v5 = a3;
  [v5 encodeObject:status forKey:@"_status"];
  [v5 encodeObject:self->_armPosition forKey:@"_armPosition"];
  [v5 encodeObject:self->_mode forKey:@"_mode"];
}

@end