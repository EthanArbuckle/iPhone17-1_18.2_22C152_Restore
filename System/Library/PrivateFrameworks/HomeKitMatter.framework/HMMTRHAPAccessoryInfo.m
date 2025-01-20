@interface HMMTRHAPAccessoryInfo
- (HMMTRHAPAccessoryInfo)init;
- (HMMTRHAPAccessoryInfo)initWithType:(id)a3;
- (NSMutableDictionary)accessoryInfoDictionary;
- (id)accessoryInfoForEndpoint:(id)a3;
- (id)attributeDescriptions;
- (id)categoriesForEndpoint:(id)a3;
- (id)fixedLabelsForEndpoint:(id)a3;
- (id)nameForEndpoint:(id)a3;
- (id)partsListForEndpoint:(id)a3;
- (id)serviceDescriptionsForEndpoint:(id)a3;
- (void)setAccessoryInfo:(id)a3 forEndpoint:(id)a4;
- (void)setAccessoryInfoDictionary:(id)a3;
@end

@implementation HMMTRHAPAccessoryInfo

- (void).cxx_destruct
{
}

- (void)setAccessoryInfoDictionary:(id)a3
{
}

- (id)attributeDescriptions
{
  v8[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(HMMTRHAPAccessoryInfo *)self accessoryInfoDictionary];
  v5 = (void *)[v3 initWithName:@"AccessoryInfoDictionary" value:v4];
  v8[0] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];

  return v6;
}

- (void)setAccessoryInfo:(id)a3 forEndpoint:(id)a4
{
  accessoryInfoDictionary = self->_accessoryInfoDictionary;
  id v6 = a3;
  id v7 = [a4 stringValue];
  [(NSMutableDictionary *)accessoryInfoDictionary setObject:v6 forKey:v7];
}

- (id)nameForEndpoint:(id)a3
{
  id v3 = [(HMMTRHAPAccessoryInfo *)self accessoryInfoForEndpoint:a3];
  v4 = [v3 getName];

  return v4;
}

- (id)fixedLabelsForEndpoint:(id)a3
{
  id v3 = [(HMMTRHAPAccessoryInfo *)self accessoryInfoForEndpoint:a3];
  v4 = [v3 getFixedLabels];

  return v4;
}

- (id)partsListForEndpoint:(id)a3
{
  id v3 = [(HMMTRHAPAccessoryInfo *)self accessoryInfoForEndpoint:a3];
  v4 = [v3 getPartsList];

  return v4;
}

- (id)serviceDescriptionsForEndpoint:(id)a3
{
  id v3 = [(HMMTRHAPAccessoryInfo *)self accessoryInfoForEndpoint:a3];
  v4 = [v3 getServiceDescriptions];

  return v4;
}

- (id)categoriesForEndpoint:(id)a3
{
  id v3 = [(HMMTRHAPAccessoryInfo *)self accessoryInfoForEndpoint:a3];
  v4 = [v3 getCategories];

  return v4;
}

- (id)accessoryInfoForEndpoint:(id)a3
{
  accessoryInfoDictionary = self->_accessoryInfoDictionary;
  v4 = [a3 stringValue];
  v5 = [(NSMutableDictionary *)accessoryInfoDictionary objectForKey:v4];

  return v5;
}

- (NSMutableDictionary)accessoryInfoDictionary
{
  return self->_accessoryInfoDictionary;
}

- (HMMTRHAPAccessoryInfo)initWithType:(id)a3
{
  id v4 = a3;
  v5 = [(HMMTRHAPAccessoryInfo *)self init];
  id v6 = v5;
  if (v5) {
    [(NSMutableDictionary *)v5->_accessoryInfoDictionary addEntriesFromDictionary:v4];
  }

  return v6;
}

- (HMMTRHAPAccessoryInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)HMMTRHAPAccessoryInfo;
  v2 = [(HMMTRHAPAccessoryInfo *)&v6 init];
  if (v2)
  {
    id v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    accessoryInfoDictionary = v2->_accessoryInfoDictionary;
    v2->_accessoryInfoDictionary = v3;
  }
  return v2;
}

@end