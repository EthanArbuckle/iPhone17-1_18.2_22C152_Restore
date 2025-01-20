@interface IDSCloudKitKeyTransparencyDeviceRecord
+ (id)recordWithDeviceData:(id)a3 deviceMetadata:(id)a4 recordID:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCloudKitKeyTransparencyDeviceRecord:(id)a3;
- (IDSCloudKitKeyTransparencyDeviceRecord)initWithDeviceData:(id)a3 deviceMetadata:(id)a4 recordID:(id)a5;
- (NSData)deviceData;
- (NSData)deviceMetadata;
- (NSString)recordID;
- (id)description;
- (unint64_t)hash;
@end

@implementation IDSCloudKitKeyTransparencyDeviceRecord

+ (id)recordWithDeviceData:(id)a3 deviceMetadata:(id)a4 recordID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)a1) initWithDeviceData:v10 deviceMetadata:v9 recordID:v8];

  return v11;
}

- (IDSCloudKitKeyTransparencyDeviceRecord)initWithDeviceData:(id)a3 deviceMetadata:(id)a4 recordID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)IDSCloudKitKeyTransparencyDeviceRecord;
  id v11 = [(IDSCloudKitKeyTransparencyDeviceRecord *)&v19 init];
  if (v11)
  {
    v12 = (NSData *)[v8 copy];
    deviceData = v11->_deviceData;
    v11->_deviceData = v12;

    v14 = (NSData *)[v9 copy];
    deviceMetadata = v11->_deviceMetadata;
    v11->_deviceMetadata = v14;

    v16 = (NSString *)[v10 copy];
    recordID = v11->_recordID;
    v11->_recordID = v16;
  }
  return v11;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v4 = [(IDSCloudKitKeyTransparencyDeviceRecord *)self deviceData];
  v5 = [(IDSCloudKitKeyTransparencyDeviceRecord *)self deviceMetadata];
  v6 = [(IDSCloudKitKeyTransparencyDeviceRecord *)self recordID];
  v7 = +[NSString stringWithFormat:@"<%@: %p deviceData: %@, deviceMetadata: %@ recordID: %@>", v3, self, v4, v5, v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (IDSCloudKitKeyTransparencyDeviceRecord *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(IDSCloudKitKeyTransparencyDeviceRecord *)self isEqualToCloudKitKeyTransparencyDeviceRecord:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isEqualToCloudKitKeyTransparencyDeviceRecord:(id)a3
{
  v6 = (IDSCloudKitKeyTransparencyDeviceRecord *)a3;
  v7 = v6;
  if (self == v6)
  {
    unsigned __int8 v10 = 1;
  }
  else
  {
    if (v6)
    {
      id v8 = [(IDSCloudKitKeyTransparencyDeviceRecord *)self deviceData];
      id v9 = [(IDSCloudKitKeyTransparencyDeviceRecord *)v7 deviceData];
      if (v8 != v9)
      {
        uint64_t v3 = [(IDSCloudKitKeyTransparencyDeviceRecord *)self deviceData];
        v4 = [(IDSCloudKitKeyTransparencyDeviceRecord *)v7 deviceData];
        if (![v3 isEqual:v4])
        {
          unsigned __int8 v10 = 0;
          goto LABEL_18;
        }
      }
      id v11 = [(IDSCloudKitKeyTransparencyDeviceRecord *)self deviceMetadata];
      v12 = [(IDSCloudKitKeyTransparencyDeviceRecord *)v7 deviceMetadata];
      if (v11 != v12)
      {
        v13 = [(IDSCloudKitKeyTransparencyDeviceRecord *)self deviceMetadata];
        v14 = [(IDSCloudKitKeyTransparencyDeviceRecord *)v7 deviceMetadata];
        if (![v13 isEqual:v14])
        {
          unsigned __int8 v10 = 0;
          goto LABEL_16;
        }
        v26 = v14;
        v27 = v13;
      }
      v15 = [(IDSCloudKitKeyTransparencyDeviceRecord *)self recordID];
      uint64_t v16 = [(IDSCloudKitKeyTransparencyDeviceRecord *)v7 recordID];
      if (v15 == (void *)v16)
      {

        unsigned __int8 v10 = 1;
      }
      else
      {
        v17 = (void *)v16;
        [(IDSCloudKitKeyTransparencyDeviceRecord *)self recordID];
        v18 = v25 = v3;
        [(IDSCloudKitKeyTransparencyDeviceRecord *)v7 recordID];
        v24 = v11;
        objc_super v19 = v9;
        v20 = v8;
        v22 = v21 = v4;
        unsigned __int8 v10 = [v18 isEqual:v22];

        v4 = v21;
        id v8 = v20;
        id v9 = v19;
        id v11 = v24;

        uint64_t v3 = v25;
      }
      v14 = v26;
      v13 = v27;
      if (v11 == v12)
      {
LABEL_17:

        if (v8 == v9)
        {
LABEL_19:

          goto LABEL_20;
        }
LABEL_18:

        goto LABEL_19;
      }
LABEL_16:

      goto LABEL_17;
    }
    unsigned __int8 v10 = 0;
  }
LABEL_20:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3 = [(IDSCloudKitKeyTransparencyDeviceRecord *)self deviceData];
  unint64_t v4 = (unint64_t)[v3 hash];
  BOOL v5 = [(IDSCloudKitKeyTransparencyDeviceRecord *)self deviceMetadata];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;
  v7 = [(IDSCloudKitKeyTransparencyDeviceRecord *)self recordID];
  unint64_t v8 = v6 ^ (unint64_t)[v7 hash];

  return v8;
}

- (NSData)deviceData
{
  return self->_deviceData;
}

- (NSData)deviceMetadata
{
  return self->_deviceMetadata;
}

- (NSString)recordID
{
  return self->_recordID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_deviceMetadata, 0);

  objc_storeStrong((id *)&self->_deviceData, 0);
}

@end