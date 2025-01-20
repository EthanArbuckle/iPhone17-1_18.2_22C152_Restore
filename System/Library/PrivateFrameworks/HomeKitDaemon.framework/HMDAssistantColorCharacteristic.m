@interface HMDAssistantColorCharacteristic
- (BOOL)mandatory;
- (HMDAssistantColorCharacteristic)initWithReadCharacteristicType:(id)a3 writeCharacteristicType:(id)a4 format:(id)a5 mandatory:(BOOL)a6;
- (NSString)format;
- (NSString)readCharacteristicType;
- (NSString)writeCharacteristicType;
@end

@implementation HMDAssistantColorCharacteristic

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_writeCharacteristicType, 0);
  objc_storeStrong((id *)&self->_readCharacteristicType, 0);
}

- (BOOL)mandatory
{
  return self->_mandatory;
}

- (NSString)format
{
  return self->_format;
}

- (NSString)writeCharacteristicType
{
  return self->_writeCharacteristicType;
}

- (NSString)readCharacteristicType
{
  return self->_readCharacteristicType;
}

- (HMDAssistantColorCharacteristic)initWithReadCharacteristicType:(id)a3 writeCharacteristicType:(id)a4 format:(id)a5 mandatory:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HMDAssistantColorCharacteristic;
  v14 = [(HMDAssistantColorCharacteristic *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_readCharacteristicType, a3);
    objc_storeStrong((id *)&v15->_writeCharacteristicType, a4);
    objc_storeStrong((id *)&v15->_format, a5);
    v15->_mandatory = a6;
  }

  return v15;
}

@end