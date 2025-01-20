@interface HAP2CharacteristicTuple
- (HAP2Accessory)accessory;
- (HAP2CharacteristicTuple)initWithAccessory:(id)a3;
- (NSMutableArray)values;
@end

@implementation HAP2CharacteristicTuple

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);

  objc_storeStrong((id *)&self->_accessory, 0);
}

- (NSMutableArray)values
{
  return self->_values;
}

- (HAP2Accessory)accessory
{
  return self->_accessory;
}

- (HAP2CharacteristicTuple)initWithAccessory:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HAP2CharacteristicTuple;
  v6 = [(HAP2CharacteristicTuple *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accessory, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    values = v7->_values;
    v7->_values = (NSMutableArray *)v8;
  }
  return v7;
}

@end