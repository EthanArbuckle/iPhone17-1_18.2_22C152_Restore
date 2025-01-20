@interface HAPMetadataTuple
- (BOOL)isEqual:(id)a3;
- (HAPMetadataTuple)initWithCharacteristicType:(id)a3 serviceType:(id)a4;
- (NSString)characteristicType;
- (NSString)index;
- (NSString)serviceType;
- (unint64_t)hash;
@end

@implementation HAPMetadataTuple

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);

  objc_storeStrong((id *)&self->_characteristicType, 0);
}

- (unint64_t)hash
{
  v2 = [(HAPMetadataTuple *)self index];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  v7 = v6;
  if (v6)
  {
    v8 = [v6 index];
    v9 = [(HAPMetadataTuple *)self index];
    char v10 = [v8 isEqual:v9];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (NSString)index
{
  return self->_index;
}

- (HAPMetadataTuple)initWithCharacteristicType:(id)a3 serviceType:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  char v10 = 0;
  if (v7 && v8)
  {
    v16.receiver = self;
    v16.super_class = (Class)HAPMetadataTuple;
    v11 = [(HAPMetadataTuple *)&v16 init];
    v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_characteristicType, a3);
      objc_storeStrong((id *)&v12->_serviceType, a4);
      uint64_t v13 = [NSString stringWithFormat:@"%@+%@", v9, v7];
      index = v12->_index;
      v12->_index = (NSString *)v13;
    }
    self = v12;
    char v10 = self;
  }

  return v10;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (NSString)characteristicType
{
  return self->_characteristicType;
}

@end