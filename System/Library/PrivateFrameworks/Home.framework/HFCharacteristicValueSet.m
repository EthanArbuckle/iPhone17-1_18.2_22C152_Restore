@interface HFCharacteristicValueSet
- (HFCharacteristicValueSet)init;
- (NSSet)allCharacteristics;
- (id)valueForCharacteristic:(id)a3;
- (void)removeValueForCharacteristic:(id)a3;
- (void)setValue:(id)a3 forCharacteristic:(id)a4;
@end

@implementation HFCharacteristicValueSet

- (HFCharacteristicValueSet)init
{
  v8.receiver = self;
  v8.super_class = (Class)HFCharacteristicValueSet;
  v2 = [(HFCharacteristicValueSet *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9C0] set];
    allCharacteristics = v2->_allCharacteristics;
    v2->_allCharacteristics = (NSMutableSet *)v3;

    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    valuesByCharacteristicUUID = v2->_valuesByCharacteristicUUID;
    v2->_valuesByCharacteristicUUID = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (id)valueForCharacteristic:(id)a3
{
  valuesByCharacteristicUUID = self->_valuesByCharacteristicUUID;
  v4 = [a3 uniqueIdentifier];
  uint64_t v5 = [(NSMutableDictionary *)valuesByCharacteristicUUID objectForKeyedSubscript:v4];

  return v5;
}

- (void)setValue:(id)a3 forCharacteristic:(id)a4
{
  allCharacteristics = self->_allCharacteristics;
  id v7 = a4;
  id v8 = a3;
  [(NSMutableSet *)allCharacteristics addObject:v7];
  valuesByCharacteristicUUID = self->_valuesByCharacteristicUUID;
  id v10 = [v7 uniqueIdentifier];

  [(NSMutableDictionary *)valuesByCharacteristicUUID setObject:v8 forKeyedSubscript:v10];
}

- (void)removeValueForCharacteristic:(id)a3
{
  valuesByCharacteristicUUID = self->_valuesByCharacteristicUUID;
  id v6 = a3;
  uint64_t v5 = [v6 uniqueIdentifier];
  [(NSMutableDictionary *)valuesByCharacteristicUUID removeObjectForKey:v5];

  [(NSMutableSet *)self->_allCharacteristics removeObject:v6];
}

- (NSSet)allCharacteristics
{
  return &self->_allCharacteristics->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valuesByCharacteristicUUID, 0);
  objc_storeStrong((id *)&self->_allCharacteristics, 0);
}

@end