@interface CTDeviceIdentifier
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CTDeviceIdentifier)init;
- (CTDeviceIdentifier)initWithCoder:(id)a3;
- (CTDeviceIdentifier)initWithDeviceType:(unint64_t)a3 EID:(id)a4 IMEI:(id)a5 idsDeviceId:(id)a6;
- (NSString)EID;
- (NSString)IMEI;
- (NSString)deviceName;
- (NSString)idsDeviceId;
- (NSString)modelName;
- (id)description;
- (id)toQRCodeString;
- (unint64_t)deviceType;
- (void)encodeWithCoder:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setDeviceType:(unint64_t)a3;
- (void)setEID:(id)a3;
- (void)setIMEI:(id)a3;
- (void)setIdsDeviceId:(id)a3;
- (void)setModelName:(id)a3;
@end

@implementation CTDeviceIdentifier

- (CTDeviceIdentifier)init
{
  v10.receiver = self;
  v10.super_class = (Class)CTDeviceIdentifier;
  v2 = [(CTDeviceIdentifier *)&v10 init];
  v3 = v2;
  if (v2)
  {
    deviceName = v2->_deviceName;
    v2->_deviceName = 0;

    modelName = v3->_modelName;
    v3->_modelName = 0;

    EID = v3->_EID;
    v3->_deviceType = 0;
    v3->_EID = 0;

    IMEI = v3->_IMEI;
    v3->_IMEI = 0;

    idsDeviceId = v3->_idsDeviceId;
    v3->_idsDeviceId = 0;
  }
  return v3;
}

- (CTDeviceIdentifier)initWithDeviceType:(unint64_t)a3 EID:(id)a4 IMEI:(id)a5 idsDeviceId:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CTDeviceIdentifier;
  v13 = [(CTDeviceIdentifier *)&v22 init];
  v14 = v13;
  if (v13)
  {
    v13->_deviceType = a3;
    uint64_t v15 = [v10 copy];
    EID = v14->_EID;
    v14->_EID = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    IMEI = v14->_IMEI;
    v14->_IMEI = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    idsDeviceId = v14->_idsDeviceId;
    v14->_idsDeviceId = (NSString *)v19;
  }
  return v14;
}

- (id)toQRCodeString
{
  return (id)[NSString stringWithFormat:@"LPA:1$TR.ID:1$EID:%@$IMEI:%@", self->_EID, self->_IMEI];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTDeviceIdentifier *)self deviceName];
  [v3 appendFormat:@" deviceName=%@", v4];

  v5 = [(CTDeviceIdentifier *)self modelName];
  [v3 appendFormat:@" modelName=%@", v5];

  objc_msgSend(v3, "appendFormat:", @" deviceType=%s", CTDeviceTypeAsString(-[CTDeviceIdentifier deviceType](self, "deviceType")));
  v6 = [(CTDeviceIdentifier *)self EID];
  [v3 appendFormat:@" EID=%@", v6];

  v7 = [(CTDeviceIdentifier *)self IMEI];
  [v3 appendFormat:@" IMEI=%@", v7];

  v8 = [(CTDeviceIdentifier *)self idsDeviceId];
  [v3 appendFormat:@" idsDeviceId=%@", v8];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v7 = (CTDeviceIdentifier *)a3;
  if (v7 == self)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = [(CTDeviceIdentifier *)self deviceName];
      v9 = [(CTDeviceIdentifier *)v7 deviceName];
      if (v8 != v9)
      {
        v3 = [(CTDeviceIdentifier *)self deviceName];
        v4 = [(CTDeviceIdentifier *)v7 deviceName];
        if (![v3 isEqualToString:v4])
        {
          char v10 = 0;
          goto LABEL_15;
        }
      }
      id v11 = [(CTDeviceIdentifier *)self modelName];
      id v12 = [(CTDeviceIdentifier *)v7 modelName];
      if (v11 != v12
        || (unint64_t v13 = [(CTDeviceIdentifier *)self deviceType],
            v13 != [(CTDeviceIdentifier *)v7 deviceType]))
      {

        char v10 = 0;
        goto LABEL_14;
      }
      uint64_t v14 = [(CTDeviceIdentifier *)self EID];
      uint64_t v15 = [(CTDeviceIdentifier *)v7 EID];
      v33 = (void *)v14;
      if ((void *)v14 != v15)
      {
        v5 = [(CTDeviceIdentifier *)self EID];
        v31 = [(CTDeviceIdentifier *)v7 EID];
        if (!objc_msgSend(v5, "isEqualToString:"))
        {
          char v10 = 0;
          goto LABEL_29;
        }
      }
      uint64_t v17 = [(CTDeviceIdentifier *)self IMEI];
      [(CTDeviceIdentifier *)v7 IMEI];
      uint64_t v29 = v32 = v5;
      v30 = (void *)v17;
      if (v17 == v29)
      {
        v26 = v15;
      }
      else
      {
        v18 = [(CTDeviceIdentifier *)self IMEI];
        v27 = [(CTDeviceIdentifier *)v7 IMEI];
        v28 = v18;
        if (!objc_msgSend(v18, "isEqualToString:"))
        {
          char v10 = 0;
          v24 = (void *)v29;
          v23 = v30;
          goto LABEL_27;
        }
        v26 = v15;
      }
      uint64_t v19 = [(CTDeviceIdentifier *)self idsDeviceId];
      uint64_t v20 = [(CTDeviceIdentifier *)v7 idsDeviceId];
      if (v19 == (void *)v20)
      {

        char v10 = 1;
      }
      else
      {
        v21 = (void *)v20;
        v25 = [(CTDeviceIdentifier *)self idsDeviceId];
        objc_super v22 = [(CTDeviceIdentifier *)v7 idsDeviceId];
        char v10 = [v25 isEqualToString:v22];
      }
      v24 = (void *)v29;
      v23 = v30;
      uint64_t v15 = v26;
      if (v30 == (void *)v29)
      {
LABEL_28:

        v5 = v32;
        if (v33 == v15)
        {
LABEL_30:

LABEL_14:
          if (v8 == v9)
          {
LABEL_16:

            goto LABEL_17;
          }
LABEL_15:

          goto LABEL_16;
        }
LABEL_29:

        goto LABEL_30;
      }
LABEL_27:

      goto LABEL_28;
    }
    char v10 = 0;
  }
LABEL_17:

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTDeviceIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CTDeviceIdentifier;
  v5 = [(CTDeviceIdentifier *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceName"];
    deviceName = v5->_deviceName;
    v5->_deviceName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modelName"];
    modelName = v5->_modelName;
    v5->_modelName = (NSString *)v8;

    v5->_deviceType = [v4 decodeIntegerForKey:@"deviceType"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EID"];
    EID = v5->_EID;
    v5->_EID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IMEI"];
    IMEI = v5->_IMEI;
    v5->_IMEI = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"idsDeviceId"];
    idsDeviceId = v5->_idsDeviceId;
    v5->_idsDeviceId = (NSString *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  deviceName = self->_deviceName;
  id v5 = a3;
  [v5 encodeObject:deviceName forKey:@"deviceName"];
  [v5 encodeObject:self->_modelName forKey:@"modelName"];
  [v5 encodeInteger:self->_deviceType forKey:@"deviceType"];
  [v5 encodeObject:self->_EID forKey:@"EID"];
  [v5 encodeObject:self->_IMEI forKey:@"IMEI"];
  [v5 encodeObject:self->_idsDeviceId forKey:@"idsDeviceId"];
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (NSString)modelName
{
  return self->_modelName;
}

- (void)setModelName:(id)a3
{
}

- (unint64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(unint64_t)a3
{
  self->_deviceType = a3;
}

- (NSString)EID
{
  return self->_EID;
}

- (void)setEID:(id)a3
{
}

- (NSString)IMEI
{
  return self->_IMEI;
}

- (void)setIMEI:(id)a3
{
}

- (NSString)idsDeviceId
{
  return self->_idsDeviceId;
}

- (void)setIdsDeviceId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsDeviceId, 0);
  objc_storeStrong((id *)&self->_IMEI, 0);
  objc_storeStrong((id *)&self->_EID, 0);
  objc_storeStrong((id *)&self->_modelName, 0);

  objc_storeStrong((id *)&self->_deviceName, 0);
}

@end