@interface HAPMetadataCharacteristic
- (HAPMetadataCharacteristic)initWithName:(id)a3 uuid:(id)a4 description:(id)a5 format:(id)a6 properties:(id)a7;
- (HAPMetadataCharacteristicValue)valueMetadata;
- (NSNumber)properties;
- (NSString)chrDescription;
- (NSString)format;
- (NSString)name;
- (NSString)units;
- (NSString)uuidStr;
- (id)description;
- (id)generateDictionary:(id)a3;
- (void)dump;
- (void)setChrDescription:(id)a3;
- (void)setFormat:(id)a3;
- (void)setName:(id)a3;
- (void)setProperties:(id)a3;
- (void)setUnits:(id)a3;
- (void)setUuidStr:(id)a3;
- (void)setValueMetadata:(id)a3;
@end

@implementation HAPMetadataCharacteristic

- (NSString)uuidStr
{
  return self->_uuidStr;
}

- (NSString)chrDescription
{
  return self->_chrDescription;
}

- (HAPMetadataCharacteristicValue)valueMetadata
{
  return self->_valueMetadata;
}

- (NSString)units
{
  return self->_units;
}

- (NSNumber)properties
{
  return self->_properties;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)format
{
  return self->_format;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueMetadata, 0);
  objc_storeStrong((id *)&self->_units, 0);
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_uuidStr, 0);
  objc_storeStrong((id *)&self->_chrDescription, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setValueMetadata:(id)a3
{
}

- (void)setUnits:(id)a3
{
}

- (void)setFormat:(id)a3
{
}

- (void)setProperties:(id)a3
{
}

- (void)setUuidStr:(id)a3
{
}

- (void)setChrDescription:(id)a3
{
}

- (void)setName:(id)a3
{
}

- (void)dump
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D944E080](self, a2);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    v6 = [(HAPMetadataCharacteristic *)self name];
    v7 = [(HAPMetadataCharacteristic *)self uuidStr];
    v8 = [(HAPMetadataCharacteristic *)self chrDescription];
    v9 = [(HAPMetadataCharacteristic *)self format];
    v10 = [(HAPMetadataCharacteristic *)self properties];
    v11 = [(HAPMetadataCharacteristic *)self units];
    int v12 = 138544898;
    v13 = v5;
    __int16 v14 = 2112;
    v15 = v6;
    __int16 v16 = 2112;
    v17 = v7;
    __int16 v18 = 2112;
    v19 = v8;
    __int16 v20 = 2112;
    v21 = v9;
    __int16 v22 = 2112;
    v23 = v10;
    __int16 v24 = 2112;
    v25 = v11;
    _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_INFO, "%{public}@HAPMetadataCharacteristic %@(%@):  description: %@  format: %@  properties: %@  units:%@", (uint8_t *)&v12, 0x48u);
  }
}

- (id)description
{
  v3 = NSString;
  v4 = [(HAPMetadataCharacteristic *)self name];
  v5 = [(HAPMetadataCharacteristic *)self uuidStr];
  v6 = [(HAPMetadataCharacteristic *)self chrDescription];
  v7 = [(HAPMetadataCharacteristic *)self format];
  v8 = [(HAPMetadataCharacteristic *)self properties];
  v9 = [v3 stringWithFormat:@"HAPMetadataCharacteristic %@(%@) - %@ - format %@, properties %@", v4, v5, v6, v7, v8];

  return v9;
}

- (id)generateDictionary:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  v6 = [v4 dictionary];
  v7 = [(HAPMetadataCharacteristic *)self uuidStr];
  v8 = +[HAPMetadata shortenHAPType:v7 baseUUIDSuffix:v5];

  [v6 setObject:v8 forKeyedSubscript:@"ShortUUID"];
  v9 = [(HAPMetadataCharacteristic *)self chrDescription];
  [v6 setObject:v9 forKeyedSubscript:@"DefaultDescription"];

  v10 = [(HAPMetadataCharacteristic *)self format];
  [v6 setObject:v10 forKeyedSubscript:@"Format"];

  v11 = [(HAPMetadataCharacteristic *)self properties];
  [v6 setObject:v11 forKeyedSubscript:@"Properties"];

  [v6 setObject:&stru_1F2C4E778 forKeyedSubscript:@"LocalizationKey"];
  int v12 = [(HAPMetadataCharacteristic *)self units];

  if (v12)
  {
    v13 = [(HAPMetadataCharacteristic *)self units];
    [v6 setObject:v13 forKeyedSubscript:@"Units"];
  }
  __int16 v14 = [(HAPMetadataCharacteristic *)self valueMetadata];
  v15 = [v14 generateDictionary];
  [v6 addEntriesFromDictionary:v15];

  return v6;
}

- (HAPMetadataCharacteristic)initWithName:(id)a3 uuid:(id)a4 description:(id)a5 format:(id)a6 properties:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = v16;
  id v18 = 0;
  if (v12 && v13 && v14 && v15 && v16)
  {
    v29.receiver = self;
    v29.super_class = (Class)HAPMetadataCharacteristic;
    id v18 = [(HAPMetadataCharacteristic *)&v29 init];
    if (v18)
    {
      uint64_t v19 = [v12 copy];
      __int16 v20 = (void *)*((void *)v18 + 1);
      *((void *)v18 + 1) = v19;

      uint64_t v21 = [v13 copy];
      __int16 v22 = (void *)*((void *)v18 + 3);
      *((void *)v18 + 3) = v21;

      uint64_t v23 = [v14 copy];
      __int16 v24 = (void *)*((void *)v18 + 2);
      *((void *)v18 + 2) = v23;

      uint64_t v25 = [v15 copy];
      uint64_t v26 = (void *)*((void *)v18 + 5);
      *((void *)v18 + 5) = v25;

      id v27 = v17;
      self = (HAPMetadataCharacteristic *)*((void *)v18 + 4);
      *((void *)v18 + 4) = v27;
    }
    else
    {
      self = 0;
    }
  }

  return (HAPMetadataCharacteristic *)v18;
}

@end