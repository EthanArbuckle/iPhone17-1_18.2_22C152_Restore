@interface HAPBLECharacteristicCache
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HAPBLECharacteristicCache)initWithCharacteristicUUID:(id)a3 instanceId:(id)a4 characteristicProperties:(unint64_t)a5 characteristicMetadata:(id)a6;
- (HAPBLECharacteristicCache)initWithCoder:(id)a3;
- (HAPCharacteristicMetadata)characteristicMetadata;
- (NSNumber)characteristicInstanceId;
- (NSUUID)characteristicUUID;
- (id)description;
- (unint64_t)characteristicProperties;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCharacteristicMetadata:(id)a3;
- (void)setCharacteristicProperties:(unint64_t)a3;
- (void)updateWithCharacteristic:(id)a3;
@end

@implementation HAPBLECharacteristicCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristicMetadata, 0);
  objc_storeStrong((id *)&self->_characteristicInstanceId, 0);

  objc_storeStrong((id *)&self->_characteristicUUID, 0);
}

- (void)setCharacteristicMetadata:(id)a3
{
}

- (HAPCharacteristicMetadata)characteristicMetadata
{
  return self->_characteristicMetadata;
}

- (void)setCharacteristicProperties:(unint64_t)a3
{
  self->_characteristicProperties = a3;
}

- (unint64_t)characteristicProperties
{
  return self->_characteristicProperties;
}

- (NSNumber)characteristicInstanceId
{
  return self->_characteristicInstanceId;
}

- (NSUUID)characteristicUUID
{
  return self->_characteristicUUID;
}

- (id)description
{
  v3 = NSString;
  v4 = [(HAPBLECharacteristicCache *)self characteristicUUID];
  v5 = [(HAPBLECharacteristicCache *)self characteristicInstanceId];
  __int16 v6 = [(HAPBLECharacteristicCache *)self characteristicProperties];
  v7 = [MEMORY[0x1E4F28E78] string];
  v8 = v7;
  if ((v6 & 0x40) != 0)
  {
    uint64_t v13 = [v7 stringByAppendingString:@": Hidden"];

    v8 = (void *)v13;
    if ((v6 & 1) == 0)
    {
LABEL_3:
      if ((v6 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((v6 & 1) == 0)
  {
    goto LABEL_3;
  }
  uint64_t v14 = [v8 stringByAppendingString:@": Notify"];

  v8 = (void *)v14;
  if ((v6 & 8) == 0)
  {
LABEL_4:
    if ((v6 & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v15 = [v8 stringByAppendingString:@": Broadcast"];

  v8 = (void *)v15;
  if ((v6 & 2) == 0)
  {
LABEL_5:
    if ((v6 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v16 = [v8 stringByAppendingString:@": Read"];

  v8 = (void *)v16;
  if ((v6 & 4) == 0)
  {
LABEL_6:
    if ((v6 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v17 = [v8 stringByAppendingString:@": Write"];

  v8 = (void *)v17;
  if ((v6 & 0x20) == 0)
  {
LABEL_7:
    if ((v6 & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v18 = [v8 stringByAppendingString:@": Timed Write"];

  v8 = (void *)v18;
  if ((v6 & 0x10) == 0)
  {
LABEL_8:
    if ((v6 & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_19:
  uint64_t v19 = [v8 stringByAppendingString:@": AAD"];

  v8 = (void *)v19;
  if ((v6 & 0x100) != 0)
  {
LABEL_9:
    uint64_t v9 = [v8 stringByAppendingString:@": ENC"];

    v8 = (void *)v9;
  }
LABEL_10:
  v10 = [(HAPBLECharacteristicCache *)self characteristicMetadata];
  v11 = [v3 stringWithFormat:@"\n\tCharacteristic Info:\n\t\tCharacteristic UUID: %@,\n\t\tInstanceId: %@,\n\t\tProperties: %@,\n\t\tMetadata: %@", v4, v5, v8, v10];

  return v11;
}

- (HAPBLECharacteristicCache)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HAPBLECharacteristicCache;
  v5 = [(HAPBLECharacteristicCache *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CUUI"];
    characteristicUUID = v5->_characteristicUUID;
    v5->_characteristicUUID = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CI"];
    characteristicInstanceId = v5->_characteristicInstanceId;
    v5->_characteristicInstanceId = (NSNumber *)v8;

    v5->_characteristicProperties = [v4 decodeIntegerForKey:@"CP"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CM"];
    characteristicMetadata = v5->_characteristicMetadata;
    v5->_characteristicMetadata = (HAPCharacteristicMetadata *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HAPBLECharacteristicCache *)self characteristicUUID];
  [v4 encodeObject:v5 forKey:@"CUUI"];

  uint64_t v6 = [(HAPBLECharacteristicCache *)self characteristicInstanceId];
  [v4 encodeObject:v6 forKey:@"CI"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[HAPBLECharacteristicCache characteristicProperties](self, "characteristicProperties"), @"CP");
  id v7 = [(HAPBLECharacteristicCache *)self characteristicMetadata];
  [v4 encodeObject:v7 forKey:@"CM"];
}

- (void)updateWithCharacteristic:(id)a3
{
  id v4 = a3;
  -[HAPBLECharacteristicCache setCharacteristicProperties:](self, "setCharacteristicProperties:", [v4 characteristicProperties]);
  id v5 = [v4 characteristicMetadata];

  [(HAPBLECharacteristicCache *)self setCharacteristicMetadata:v5];
}

- (unint64_t)hash
{
  v3 = [(HAPBLECharacteristicCache *)self characteristicUUID];
  uint64_t v4 = [v3 hash];
  id v5 = [(HAPBLECharacteristicCache *)self characteristicInstanceId];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HAPBLECharacteristicCache *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      unint64_t v6 = [(HAPBLECharacteristicCache *)self characteristicUUID];
      id v7 = [(HAPBLECharacteristicCache *)v5 characteristicUUID];
      int v8 = [v6 isEqual:v7];

      if (v8)
      {
        uint64_t v9 = [(HAPBLECharacteristicCache *)self characteristicInstanceId];
        uint64_t v10 = [(HAPBLECharacteristicCache *)v5 characteristicInstanceId];
        char v11 = [v9 isEqual:v10];
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (HAPBLECharacteristicCache)initWithCharacteristicUUID:(id)a3 instanceId:(id)a4 characteristicProperties:(unint64_t)a5 characteristicMetadata:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HAPBLECharacteristicCache;
  uint64_t v14 = [(HAPBLECharacteristicCache *)&v17 init];
  uint64_t v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_characteristicUUID, a3);
    objc_storeStrong((id *)&v15->_characteristicInstanceId, a4);
    v15->_characteristicProperties = a5;
    objc_storeStrong((id *)&v15->_characteristicMetadata, a6);
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end