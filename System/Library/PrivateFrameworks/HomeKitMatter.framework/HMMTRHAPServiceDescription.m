@interface HMMTRHAPServiceDescription
- (BOOL)optionalServiceLabelIndexIncluded;
- (HMMTRHAPServiceDescription)initWithType:(id)a3 endpoint:(id)a4 name:(id)a5;
- (HMMTRHAPServiceDescription)initWithType:(id)a3 endpoint:(id)a4 name:(id)a5 optionalServiceLabelIndexIncluded:(BOOL)a6;
- (NSArray)optionalCharacteristics;
- (NSArray)requiredCharacteristics;
- (NSDictionary)characteristicFeatureMap;
- (NSNumber)endpoint;
- (NSString)name;
- (NSString)serviceType;
- (id)attributeDescriptions;
- (id)padCharacteristicIDWithZeros:(id)a3;
- (void)addFeatureMapForCharacteristic:(id)a3 featureMap:(id)a4;
- (void)addMandatoryCharacteristic:(id)a3;
- (void)addOptionalCharacteristic:(id)a3;
- (void)removeCharacteristic:(id)a3;
- (void)setEndpoint:(id)a3;
- (void)setName:(id)a3;
@end

@implementation HMMTRHAPServiceDescription

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristicFeatureMap, 0);
  objc_storeStrong((id *)&self->_optionalCharacteristics, 0);
  objc_storeStrong((id *)&self->_requiredCharacteristics, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
}

- (BOOL)optionalServiceLabelIndexIncluded
{
  return self->_optionalServiceLabelIndexIncluded;
}

- (NSDictionary)characteristicFeatureMap
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (NSArray)optionalCharacteristics
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (NSArray)requiredCharacteristics
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setEndpoint:(id)a3
{
}

- (NSNumber)endpoint
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)serviceType
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (id)attributeDescriptions
{
  v26[7] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v25 = [(HMMTRHAPServiceDescription *)self serviceType];
  v24 = (void *)[v3 initWithName:@"ServiceType" value:v25];
  v26[0] = v24;
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  v23 = [(HMMTRHAPServiceDescription *)self endpoint];
  v22 = (void *)[v4 initWithName:@"Endpoint" value:v23];
  v26[1] = v22;
  id v5 = objc_alloc(MEMORY[0x263F424F8]);
  v21 = [(HMMTRHAPServiceDescription *)self name];
  v6 = (void *)[v5 initWithName:@"Name" value:v21];
  v26[2] = v6;
  id v7 = objc_alloc(MEMORY[0x263F424F8]);
  v8 = [(HMMTRHAPServiceDescription *)self requiredCharacteristics];
  v9 = (void *)[v7 initWithName:@"RequiredCharacteristics" value:v8];
  v26[3] = v9;
  id v10 = objc_alloc(MEMORY[0x263F424F8]);
  v11 = [(HMMTRHAPServiceDescription *)self optionalCharacteristics];
  v12 = (void *)[v10 initWithName:@"OptionalCharacteristics" value:v11];
  v26[4] = v12;
  id v13 = objc_alloc(MEMORY[0x263F424F8]);
  v14 = [(HMMTRHAPServiceDescription *)self characteristicFeatureMap];
  v15 = (void *)[v13 initWithName:@"CharacteristicFeatureMap" value:v14];
  v26[5] = v15;
  id v16 = objc_alloc(MEMORY[0x263F424F8]);
  v17 = objc_msgSend(NSNumber, "numberWithBool:", -[HMMTRHAPServiceDescription optionalServiceLabelIndexIncluded](self, "optionalServiceLabelIndexIncluded"));
  v18 = (void *)[v16 initWithName:@"OptionalServiceLabelIndexIncluded" value:v17];
  v26[6] = v18;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:7];

  return v19;
}

- (id)padCharacteristicIDWithZeros:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 length];
  if ((unint64_t)(v4 - 1) > 7)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = objc_msgSend(NSString, "stringWithFormat:", off_265374910[v4 - 1], v3, "-0000-1000-8000-0026BB765291");
  }

  return v5;
}

- (void)removeCharacteristic:(id)a3
{
  id v11 = [(HMMTRHAPServiceDescription *)self padCharacteristicIDWithZeros:a3];
  if (v11)
  {
    if ([(NSArray *)self->_requiredCharacteristics containsObject:v11])
    {
      uint64_t v4 = [MEMORY[0x263EFF980] arrayWithArray:self->_requiredCharacteristics];
      [(NSArray *)v4 removeObject:v11];
      requiredCharacteristics = self->_requiredCharacteristics;
      self->_requiredCharacteristics = v4;
    }
    if ([(NSArray *)self->_optionalCharacteristics containsObject:v11])
    {
      v6 = [MEMORY[0x263EFF980] arrayWithArray:self->_optionalCharacteristics];
      [(NSArray *)v6 removeObject:v11];
      optionalCharacteristics = self->_optionalCharacteristics;
      self->_optionalCharacteristics = v6;
    }
    v8 = [(NSDictionary *)self->_characteristicFeatureMap objectForKeyedSubscript:v11];

    if (v8)
    {
      v9 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:self->_characteristicFeatureMap];
      [(NSDictionary *)v9 removeObjectForKey:v11];
      characteristicFeatureMap = self->_characteristicFeatureMap;
      self->_characteristicFeatureMap = v9;
    }
  }
}

- (void)addFeatureMapForCharacteristic:(id)a3 featureMap:(id)a4
{
  id v9 = a4;
  v6 = [(HMMTRHAPServiceDescription *)self padCharacteristicIDWithZeros:a3];
  if (v9 && v6)
  {
    id v7 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:self->_characteristicFeatureMap];
    [(NSDictionary *)v7 setObject:v9 forKey:v6];
    characteristicFeatureMap = self->_characteristicFeatureMap;
    self->_characteristicFeatureMap = v7;
  }
}

- (void)addMandatoryCharacteristic:(id)a3
{
  id v6 = [(HMMTRHAPServiceDescription *)self padCharacteristicIDWithZeros:a3];
  if (v6)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] arrayWithArray:self->_requiredCharacteristics];
    [(NSArray *)v4 addObject:v6];
    requiredCharacteristics = self->_requiredCharacteristics;
    self->_requiredCharacteristics = v4;
  }
}

- (void)addOptionalCharacteristic:(id)a3
{
  id v6 = [(HMMTRHAPServiceDescription *)self padCharacteristicIDWithZeros:a3];
  if (v6)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] arrayWithArray:self->_optionalCharacteristics];
    [(NSArray *)v4 addObject:v6];
    optionalCharacteristics = self->_optionalCharacteristics;
    self->_optionalCharacteristics = v4;
  }
}

- (HMMTRHAPServiceDescription)initWithType:(id)a3 endpoint:(id)a4 name:(id)a5
{
  return [(HMMTRHAPServiceDescription *)self initWithType:a3 endpoint:a4 name:a5 optionalServiceLabelIndexIncluded:0];
}

- (HMMTRHAPServiceDescription)initWithType:(id)a3 endpoint:(id)a4 name:(id)a5 optionalServiceLabelIndexIncluded:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v21.receiver = self;
  v21.super_class = (Class)HMMTRHAPServiceDescription;
  v14 = [(HMMTRHAPServiceDescription *)&v21 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_serviceType, a3);
    objc_storeStrong((id *)&v15->_endpoint, a4);
    objc_storeStrong((id *)&v15->_name, a5);
    optionalCharacteristics = v15->_optionalCharacteristics;
    v17 = (NSArray *)MEMORY[0x263EFFA68];
    v15->_optionalCharacteristics = (NSArray *)MEMORY[0x263EFFA68];

    requiredCharacteristics = v15->_requiredCharacteristics;
    v15->_requiredCharacteristics = v17;

    characteristicFeatureMap = v15->_characteristicFeatureMap;
    v15->_characteristicFeatureMap = (NSDictionary *)MEMORY[0x263EFFA78];

    v15->_optionalServiceLabelIndexIncluded = a6;
  }

  return v15;
}

@end