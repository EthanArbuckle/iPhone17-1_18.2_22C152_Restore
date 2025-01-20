@interface CBDescriptor
- (CBCharacteristic)characteristic;
- (CBDescriptor)initWithCharacteristic:(id)a3 dictionary:(id)a4;
- (CBPeripheral)peripheral;
- (NSNumber)handle;
- (id)description;
- (id)handleValueUpdated:(id)a3;
- (id)value;
- (void)invalidate;
- (void)setCharacteristic:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation CBDescriptor

- (CBDescriptor)initWithCharacteristic:(id)a3 dictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 objectForKeyedSubscript:@"kCBMsgArgUUID"];
  v9 = +[CBUUID UUIDWithData:v8];
  v18.receiver = self;
  v18.super_class = (Class)CBDescriptor;
  v10 = [(CBAttribute *)&v18 initWithUUID:v9];

  if (v10)
  {
    uint64_t v11 = [v7 objectForKeyedSubscript:@"kCBMsgArgDescriptorHandle"];
    handle = v10->_handle;
    v10->_handle = (NSNumber *)v11;

    uint64_t v13 = [v7 objectForKeyedSubscript:@"kCBMsgArgData"];
    id value = v10->_value;
    v10->_id value = (id)v13;

    uint64_t v15 = [v6 peripheral];
    peripheral = v10->_peripheral;
    v10->_peripheral = (CBPeripheral *)v15;

    objc_storeWeak((id *)&v10->_characteristic, v6);
  }

  return v10;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CBAttribute *)self UUID];
  id v6 = [v3 stringWithFormat:@"<%@: %p, UUID = %@, value = %@>", v4, self, v5, self->_value];

  return v6;
}

- (void)invalidate
{
}

- (id)handleValueUpdated:(id)a3
{
  uint64_t v4 = [a3 objectForKeyedSubscript:@"kCBMsgArgData"];
  [(CBDescriptor *)self setValue:v4];

  return self;
}

- (CBCharacteristic)characteristic
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_characteristic);

  return (CBCharacteristic *)WeakRetained;
}

- (void)setCharacteristic:(id)a3
{
}

- (id)value
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setValue:(id)a3
{
}

- (CBPeripheral)peripheral
{
  return self->_peripheral;
}

- (NSNumber)handle
{
  return self->_handle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_peripheral, 0);
  objc_storeStrong(&self->_value, 0);

  objc_destroyWeak((id *)&self->_characteristic);
}

@end