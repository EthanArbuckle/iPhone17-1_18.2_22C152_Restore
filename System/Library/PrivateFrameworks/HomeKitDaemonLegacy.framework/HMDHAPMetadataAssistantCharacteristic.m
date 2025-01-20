@interface HMDHAPMetadataAssistantCharacteristic
- (BOOL)supportsLocalization;
- (HMDHAPMetadataAssistantCharacteristic)init;
- (HMDHAPMetadataAssistantCharacteristic)initWithName:(id)a3 readHAPCharacteristic:(id)a4 writeHAPCharacteristic:(id)a5 format:(id)a6;
- (NSDictionary)outValues;
- (NSDictionary)values;
- (NSString)format;
- (NSString)name;
- (NSString)readHAPCharacteristicName;
- (NSString)writeHAPCharacteristicName;
- (id)description;
- (void)setFormat:(id)a3;
- (void)setName:(id)a3;
- (void)setOutValues:(id)a3;
- (void)setReadHAPCharacteristicName:(id)a3;
- (void)setSupportsLocalization:(BOOL)a3;
- (void)setValues:(id)a3;
- (void)setWriteHAPCharacteristicName:(id)a3;
@end

@implementation HMDHAPMetadataAssistantCharacteristic

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outValues, 0);
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_writeHAPCharacteristicName, 0);
  objc_storeStrong((id *)&self->_readHAPCharacteristicName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setOutValues:(id)a3
{
}

- (NSDictionary)outValues
{
  return self->_outValues;
}

- (void)setValues:(id)a3
{
}

- (NSDictionary)values
{
  return self->_values;
}

- (void)setSupportsLocalization:(BOOL)a3
{
  self->_supportsLocalization = a3;
}

- (BOOL)supportsLocalization
{
  return self->_supportsLocalization;
}

- (void)setFormat:(id)a3
{
}

- (NSString)format
{
  return self->_format;
}

- (void)setWriteHAPCharacteristicName:(id)a3
{
}

- (NSString)writeHAPCharacteristicName
{
  return self->_writeHAPCharacteristicName;
}

- (void)setReadHAPCharacteristicName:(id)a3
{
}

- (NSString)readHAPCharacteristicName
{
  return self->_readHAPCharacteristicName;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (id)description
{
  v3 = NSString;
  v4 = [(HMDHAPMetadataAssistantCharacteristic *)self name];
  v5 = [(HMDHAPMetadataAssistantCharacteristic *)self readHAPCharacteristicName];
  v6 = [(HMDHAPMetadataAssistantCharacteristic *)self writeHAPCharacteristicName];
  v7 = [(HMDHAPMetadataAssistantCharacteristic *)self format];
  v8 = [v3 stringWithFormat:@"Assistant characteristic %@: readHAP %@  writeHAP %@, format %@ supportsLocalization %ld", v4, v5, v6, v7, -[HMDHAPMetadataAssistantCharacteristic supportsLocalization](self, "supportsLocalization")];

  return v8;
}

- (HMDHAPMetadataAssistantCharacteristic)initWithName:(id)a3 readHAPCharacteristic:(id)a4 writeHAPCharacteristic:(id)a5 format:(id)a6
{
  id v10 = a3;
  unint64_t v11 = (unint64_t)a4;
  unint64_t v12 = (unint64_t)a5;
  id v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)HMDHAPMetadataAssistantCharacteristic;
  v14 = [(HMDHAPMetadataAssistantCharacteristic *)&v25 init];
  v15 = v14;
  if (v10 && v11 | v12)
  {
    if (v14)
    {
      uint64_t v16 = objc_msgSend(MEMORY[0x1E4F654E8], "hmf_cachedInstanceForString:", v10);
      name = v15->_name;
      v15->_name = (NSString *)v16;

      uint64_t v18 = objc_msgSend(MEMORY[0x1E4F654E8], "hmf_cachedInstanceForString:", v11);
      readHAPCharacteristicName = v15->_readHAPCharacteristicName;
      v15->_readHAPCharacteristicName = (NSString *)v18;

      uint64_t v20 = objc_msgSend(MEMORY[0x1E4F654E8], "hmf_cachedInstanceForString:", v12);
      writeHAPCharacteristicName = v15->_writeHAPCharacteristicName;
      v15->_writeHAPCharacteristicName = (NSString *)v20;

      uint64_t v22 = objc_msgSend(MEMORY[0x1E4F654E8], "hmf_cachedInstanceForString:", v13);
      format = (HMDHAPMetadataAssistantCharacteristic *)v15->_format;
      v15->_format = (NSString *)v22;
    }
    else
    {
      format = 0;
    }
  }
  else
  {
    format = v14;
    v15 = 0;
  }

  return v15;
}

- (HMDHAPMetadataAssistantCharacteristic)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end