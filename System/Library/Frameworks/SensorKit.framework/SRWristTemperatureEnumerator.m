@interface SRWristTemperatureEnumerator
+ (id)new;
- (SRWristTemperatureEnumerator)init;
- (SRWristTemperatureEnumerator)initWithHAWristTemperatureEnumerator:(id)a3;
- (id)allObjects;
- (id)nextObject;
- (void)dealloc;
@end

@implementation SRWristTemperatureEnumerator

- (SRWristTemperatureEnumerator)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

- (SRWristTemperatureEnumerator)initWithHAWristTemperatureEnumerator:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SRWristTemperatureEnumerator;
  v4 = [(SRWristTemperatureEnumerator *)&v6 init];
  if (v4) {
    v4->_enumerableHAWristTemperature = (HAWristTemperatureEnumerator *)a3;
  }
  return v4;
}

- (id)nextObject
{
  id result = (id)[(HAWristTemperatureEnumerator *)self->_enumerableHAWristTemperature nextObject];
  if (result)
  {
    v3 = -[SRWristTemperature initWithTimestamp:temperature:condition:errorEstimate:temperatureT1:temperatureT2:]([SRWristTemperature alloc], "initWithTimestamp:temperature:condition:errorEstimate:temperatureT1:temperatureT2:", [result timestamp], objc_msgSend(result, "computedTemperature"), objc_msgSend(result, "dataValidity"), objc_msgSend(result, "computedTemperatureErrorEstimate"), objc_msgSend(result, "sensor1Temperature"), objc_msgSend(result, "sensor2Temperature"));
    return v3;
  }
  return result;
}

- (id)allObjects
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v11 = (void *)[MEMORY[0x263EFF980] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  obj = self->_enumerableHAWristTemperature;
  uint64_t v3 = [(HAWristTemperatureEnumerator *)obj countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v8 = -[SRWristTemperature initWithTimestamp:temperature:condition:errorEstimate:temperatureT1:temperatureT2:]([SRWristTemperature alloc], "initWithTimestamp:temperature:condition:errorEstimate:temperatureT1:temperatureT2:", [v7 timestamp], objc_msgSend(v7, "computedTemperature"), objc_msgSend(v7, "dataValidity"), objc_msgSend(v7, "computedTemperatureErrorEstimate"), objc_msgSend(v7, "sensor1Temperature"), objc_msgSend(v7, "sensor2Temperature"));
        [v11 addObject:v8];
      }
      uint64_t v4 = [(HAWristTemperatureEnumerator *)obj countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
  return (id)[MEMORY[0x263EFF8C0] arrayWithArray:v11];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SRWristTemperatureEnumerator;
  [(SRWristTemperatureEnumerator *)&v3 dealloc];
}

@end