@interface HMMTRMutableDeviceTopology
- (id)storeForNodeId:(id)a3 server:(id)a4;
- (void)addDeviceAttributeValues:(id)a3 clusterClassName:(id)a4 attributeName:(id)a5 atEndpoint:(id)a6;
- (void)addDeviceFeatureMapValue:(id)a3 clusterClassName:(id)a4 atEndpoint:(id)a5;
- (void)addHAPDisabledCharacteristic:(id)a3 atEndpoint:(id)a4 hapServiceType:(id)a5;
- (void)setClustersInUse:(id)a3 atEndpoint:(id)a4;
- (void)setDeviceAttributeValues:(id)a3 atEndpoint:(id)a4;
- (void)setDeviceFeatureMapValues:(id)a3 atEndpoint:(id)a4;
- (void)setFixedLabels:(id)a3 atEndpoint:(id)a4;
- (void)setHAPCategories:(id)a3 atEndpoint:(id)a4;
- (void)setHAPDisabledCharacteristics:(id)a3 atEndpoint:(id)a4;
- (void)setHAPServiceTypes:(id)a3 atEndpoint:(id)a4;
- (void)setNodeLabel:(id)a3 atEndpoint:(id)a4;
- (void)setOTARequestorEnabled:(BOOL)a3 atEndpoint:(id)a4;
- (void)setPartsList:(id)a3 atEndpoint:(id)a4;
- (void)setVersion:(id)a3 for:(id)a4;
@end

@implementation HMMTRMutableDeviceTopology

- (id)storeForNodeId:(id)a3 server:(id)a4
{
  id v5 = a4;
  v6 = [(HMMTRDeviceTopology *)self _dictionaryRepresentation];
  uint64_t v10 = 0;
  v7 = [MEMORY[0x263F08AC0] dataWithPropertyList:v6 format:100 options:0 error:&v10];
  v8 = (void *)[v7 copy];
  [v5 setTopology:v8];

  return 0;
}

- (void)setOTARequestorEnabled:(BOOL)a3 atEndpoint:(id)a4
{
  BOOL v4 = a3;
  v6 = NSNumber;
  id v7 = a4;
  id v10 = [v6 numberWithBool:v4];
  v8 = [(HMMTRDeviceTopology *)self otaRequestorEndpoints];
  v9 = [v7 stringValue];

  [v8 setObject:v10 forKeyedSubscript:v9];
}

- (void)setVersion:(id)a3 for:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMMTRDeviceTopology *)self versions];
  [v8 setObject:v7 forKeyedSubscript:v6];
}

- (void)setFixedLabels:(id)a3 atEndpoint:(id)a4
{
  id v6 = (void *)MEMORY[0x263EFF8C0];
  id v7 = a4;
  id v10 = [v6 arrayWithArray:a3];
  id v8 = [(HMMTRDeviceTopology *)self fixedLabels];
  v9 = [v7 stringValue];

  [v8 setObject:v10 forKeyedSubscript:v9];
}

- (void)setPartsList:(id)a3 atEndpoint:(id)a4
{
  id v6 = (void *)MEMORY[0x263EFF8C0];
  id v7 = a4;
  id v10 = [v6 arrayWithArray:a3];
  id v8 = [(HMMTRDeviceTopology *)self partsList];
  v9 = [v7 stringValue];

  [v8 setObject:v10 forKeyedSubscript:v9];
}

- (void)setNodeLabel:(id)a3 atEndpoint:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(HMMTRDeviceTopology *)self nodeLabels];
  id v8 = [v6 stringValue];

  [v9 setObject:v7 forKeyedSubscript:v8];
}

- (void)addDeviceAttributeValues:(id)a3 clusterClassName:(id)a4 attributeName:(id)a5 atEndpoint:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v17 = [a3 componentsJoinedByString:@":"];
  v13 = [(HMMTRDeviceTopology *)self deviceAttributeValues];
  v14 = [v10 stringValue];

  v15 = [v13 objectForKeyedSubscript:v14];
  v16 = [NSString stringWithFormat:@"%@:%@:%@", v12, v11, v17];

  [v15 addObject:v16];
}

- (void)addDeviceFeatureMapValue:(id)a3 clusterClassName:(id)a4 atEndpoint:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v14 = [(HMMTRDeviceTopology *)self deviceFeatureMapValues];
  id v11 = [v8 stringValue];

  id v12 = [v14 objectForKeyedSubscript:v11];
  v13 = [NSString stringWithFormat:@"%@:%@", v9, v10];

  [v12 addObject:v13];
}

- (void)addHAPDisabledCharacteristic:(id)a3 atEndpoint:(id)a4 hapServiceType:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v14 = [(HMMTRDeviceTopology *)self hapDisabledCharacteristics];
  id v11 = [v9 stringValue];

  id v12 = [v14 objectForKeyedSubscript:v11];
  v13 = [NSString stringWithFormat:@"%@:%@", v8, v10];

  [v12 addObject:v13];
}

- (void)setDeviceAttributeValues:(id)a3 atEndpoint:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(HMMTRDeviceTopology *)self deviceAttributeValues];
  id v8 = [v6 stringValue];

  [v9 setObject:v7 forKeyedSubscript:v8];
}

- (void)setDeviceFeatureMapValues:(id)a3 atEndpoint:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(HMMTRDeviceTopology *)self deviceFeatureMapValues];
  id v8 = [v6 stringValue];

  [v9 setObject:v7 forKeyedSubscript:v8];
}

- (void)setHAPDisabledCharacteristics:(id)a3 atEndpoint:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(HMMTRDeviceTopology *)self hapDisabledCharacteristics];
  id v8 = [v6 stringValue];

  [v9 setObject:v7 forKeyedSubscript:v8];
}

- (void)setHAPCategories:(id)a3 atEndpoint:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(HMMTRDeviceTopology *)self hapCategories];
  id v8 = [v6 stringValue];

  [v9 setObject:v7 forKeyedSubscript:v8];
}

- (void)setClustersInUse:(id)a3 atEndpoint:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(HMMTRDeviceTopology *)self clustersInUse];
  id v8 = [v6 stringValue];

  [v9 setObject:v7 forKeyedSubscript:v8];
}

- (void)setHAPServiceTypes:(id)a3 atEndpoint:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(HMMTRDeviceTopology *)self hapServiceTypes];
  id v8 = [v6 stringValue];

  [v9 setObject:v7 forKeyedSubscript:v8];
}

@end