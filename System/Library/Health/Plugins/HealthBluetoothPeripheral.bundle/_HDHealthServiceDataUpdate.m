@interface _HDHealthServiceDataUpdate
- (HDHealthServiceCharacteristic)characteristic;
- (HKDevice)device;
- (NSError)error;
- (_HDHealthServiceDataUpdate)initWithSessionIdentifier:(unint64_t)a3 characteristic:(id)a4 device:(id)a5 error:(id)a6;
- (unint64_t)sessionIdentifier;
@end

@implementation _HDHealthServiceDataUpdate

- (_HDHealthServiceDataUpdate)initWithSessionIdentifier:(unint64_t)a3 characteristic:(id)a4 device:(id)a5 error:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)_HDHealthServiceDataUpdate;
  v14 = [(_HDHealthServiceDataUpdate *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_sessionIdentifier = a3;
    objc_storeStrong((id *)&v14->_characteristic, a4);
    objc_storeStrong((id *)&v15->_device, a5);
    objc_storeStrong((id *)&v15->_error, a6);
  }

  return v15;
}

- (unint64_t)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (HDHealthServiceCharacteristic)characteristic
{
  return self->_characteristic;
}

- (HKDevice)device
{
  return self->_device;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_device, 0);

  objc_storeStrong((id *)&self->_characteristic, 0);
}

@end